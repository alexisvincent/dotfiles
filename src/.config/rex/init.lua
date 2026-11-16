-- Rex key bindings. Docs: https://www.superlogical.com/rex/docs/customize/keyboard-shortcuts
-- After editing: rex config reload

-- Cmd+S toggles the sidebar.
rex.bind("cmd+s", "client.sidebar.toggle")

-- Editor toggle. A session is a project: Cmd+E jumps to the project's Neovim pane, creating an
-- editor tab if there is none, and pressing it again from that pane jumps back out of it.
local TERMINAL = "com.superlogical.terminal"
local SHELL = "com.superlogical.terminal.shell"
local EDITOR_LABEL = "editor"

local function exists(path)
  local f = io.open(path, "r")
  if f then
    f:close()
    return true
  end
  return false
end

-- Walk up from dir to the nearest jj or git repo root. Falls back to dir itself.
local function repo_root(dir)
  local current = dir
  while current and current ~= "" and current ~= "/" do
    if exists(current .. "/.jj") or exists(current .. "/.git") then
      return current
    end
    current = current:match("^(.*)/[^/]+$")
  end
  return dir
end

local function foreground(block_id)
  local process = rex.block.call(TERMINAL, "process", { block_id = block_id })
  return process and process.foreground or nil
end

-- Every block in the session, in tab order, tagged with the window (tab) it lives in.
local function session_blocks(view)
  local blocks = {}
  for _, window in ipairs(view.windows or {}) do
    for _, layer in ipairs(window.layers or {}) do
      for _, block in ipairs(layer.blocks or {}) do
        table.insert(blocks, {
          block_id = block.block_id,
          window_id = window.window_id,
          label = block.label,
          is_terminal = block.creator_name == TERMINAL,
        })
      end
    end
  end
  return blocks
end

-- The pane this action created (it keeps its label after quitting to fish), else any pane running nvim.
local function find_editor(blocks)
  for _, block in ipairs(blocks) do
    if block.label == EDITOR_LABEL then
      return block
    end
  end
  for _, block in ipairs(blocks) do
    local fg = block.is_terminal and foreground(block.block_id)
    if fg and (fg.argv0 == "nvim" or fg.name == "nvim") then
      return block
    end
  end
  return nil
end

-- The project is wherever the session's first terminal is, widened to its repo root.
local function project_dir(blocks)
  for _, block in ipairs(blocks) do
    if block.is_terminal then
      local fg = foreground(block.block_id)
      if fg and fg.cwd then
        return repo_root(fg.cwd)
      end
    end
  end
  return os.getenv("HOME")
end

local function check(result, err)
  if err ~= nil then
    error(err, 0)
  end
  return result
end

-- The app follows a server-side pane focus inside the tab it is showing, but only changes tab when
-- asked through its own session.select action. So do both.
local function show_block(ctx, block)
  check(rex.session.focus_block({ block_id = block.block_id }))
  if ctx.client_id and ctx.session_id then
    pcall(rex.client.queue, "session.select", { session_id = ctx.session_id, window_id = block.window_id })
  end
end

-- The app to steer: the one that pressed the key, else the first app attached to the session.
local function app_client_id(ctx)
  local clients = (rex.session.list_clients({}) or {}).clients or {}
  local first_app = nil
  for _, client in ipairs(clients) do
    if client.info and client.info.kind == "app" then
      if client.client_id == ctx.client_id then
        return client.client_id
      end
      first_app = first_app or client.client_id
    end
  end
  return first_app
end

-- The server runs commands with a bare PATH, so fall back to where the Mac app installs the CLI.
local SELECT_LATER = [[
sleep 0.3
rex=$(command -v rex) || rex="$HOME/Library/Application Support/com.superlogical.rex/RexServer/Versions/Current/Rex Server.app/Contents/MacOS/rex"
if [ -n "$3" ]; then
  exec "$rex" -C "$1" do session.select session_id="$2" window_id="$3"
fi
exec "$rex" -C "$1" do session.select session_id="$2"
]]

-- Show something the app hasn't heard about yet. A queued session.select reaches the app before the
-- news of a new tab or session does and is ignored, so ask from a detached rex call a moment later.
local function select_later(ctx, session_id, window_id)
  local client_id = app_client_id(ctx)
  if client_id and session_id then
    rex.exec.start(
      { "/bin/sh", "-c", SELECT_LATER, "sh", client_id, session_id, window_id or "" },
      { detach = true }
    )
  end
end

local function open_tab(ctx, opts)
  local created = check(rex.session.new_window(opts))
  select_later(ctx, ctx.session_id, created.window_id)
  return created
end

rex.action({
  name = "editor_toggle",
  title = "Toggle Project Editor",
  description = "Go to this session's Neovim pane, or back from it to the nearest other pane.",
  run = function(ctx)
    local view = check(rex.session.view({}))
    local blocks = session_blocks(view)
    local editor = find_editor(blocks)

    -- The pane the key was pressed in. Without one (ie, from the CLI), the active tab's focused pane.
    local current = ctx.block_id
    if not current then
      for _, window in ipairs(view.windows) do
        if window.window_id == view.active_window_id then
          current = window.focused_block_id
        end
      end
    end

    if editor and editor.block_id == current then
      -- Leave the editor: prefer a pane beside it in the same tab, else the first pane of the first other tab.
      local target = nil
      for _, block in ipairs(blocks) do
        if block.block_id ~= editor.block_id and block.window_id == editor.window_id then
          target = block
          break
        end
      end
      if not target then
        for _, block in ipairs(blocks) do
          if block.window_id ~= editor.window_id then
            target = block
            break
          end
        end
      end
      if target then
        show_block(ctx, target)
      else
        open_tab(ctx, {
          layout = rex.layout.block({ flavor = SHELL, options = { cwd = project_dir(blocks) } }),
        })
      end
      return
    end

    if editor then
      show_block(ctx, editor)
      return
    end

    -- Type nvim into a normal shell rather than running it directly, so quitting lands in fish.
    local created = open_tab(ctx, {
      window_label = EDITOR_LABEL,
      layout = rex.layout.block({
        flavor = SHELL,
        options = { cwd = project_dir(blocks), initial_input = "nvim\n" },
      }),
    })
    for _, block_id in ipairs(created.block_ids or {}) do
      check(rex.session.set_block_label({ block_id = block_id, label = EDITOR_LABEL }))
    end
  end,
})

rex.bind("cmd+e", "editor_toggle")

-- Project sessions. Go to the session with this label from anywhere, creating it with a shell in
-- its directory if it doesn't exist yet. Pressed from inside it, go to the first other session.
rex.action({
  name = "go_to_project",
  title = "Go to Project Session",
  description = "Switch to the session with this label (creating it in dir if needed), or away from it.",
  args = { label = "string", dir = "string" },
  run = function(ctx, args)
    local listed = check(rex.call("session.list"))
    local sessions = listed.sessions or {}
    for _, session in ipairs(sessions) do
      if session.label == args.label then
        if session.session_id ~= ctx.session_id then
          rex.client.queue("session.select", { session_id = session.session_id })
          return
        end
        -- Already there: leave for the first other session, if there is one.
        for _, other in ipairs(sessions) do
          if other.session_id ~= session.session_id then
            rex.client.queue("session.select", { session_id = other.session_id })
            return
          end
        end
        return
      end
    end

    local dir = args.dir:gsub("^~", os.getenv("HOME"))
    local created = check(rex.call("session.create", {
      label = args.label,
      initial_windows = {
        { layout = rex.layout.block({ flavor = SHELL, options = { cwd = dir } }) },
      },
    }))
    select_later(ctx, created.session_id)
  end,
})

rex.bind("shift+cmd+c", "go_to_project", { label = "dotfiles", dir = "~/Code/dotfiles" })
