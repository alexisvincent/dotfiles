-- Harper grammar checker (replaces ltex-ls). Based on julienvincent/config.nvim.
local mason = require("julienvincent.modules.core.mason")
local fs = require("julienvincent.modules.lsp.utils.fs")

-- Dictionaries and ignored lints live in ~/.config/harper-ls (kept out of
-- the dotfiles repo, which ignores ~/.config apart from a few folders).
local function db_path(subpath)
  local home = os.getenv("HOME")
  local config = os.getenv("XDG_CONFIG_HOME") or (home .. "/.config")
  return config .. "/harper-ls" .. subpath
end

return function()
  local root_dir_fn = fs.find_closest_root({ ".git" })

  local workspace_root = root_dir_fn(vim.fn.getcwd()) or vim.fn.getcwd()
  local workspace_id = vim.fn.sha256(workspace_root)

  local mason_cmd = mason.command("harper-ls", { "--stdio" })

  return {
    name = "harper",
    filetypes = {
      "markdown",
      "mdx",
      "gitcommit",
      "toml",
      "json",
      "yaml",
      "clojure",
      "jjdescription",
    },
    -- A harper-ls on PATH wins; otherwise the one Mason installed.
    cmd = function()
      local system_path = vim.fn.exepath("harper-ls")
      if system_path ~= "" then
        return { system_path, "--stdio" }
      end
      return mason_cmd()
    end,
    root_dir = root_dir_fn,

    single_file_support = true,

    settings = {
      ["harper-ls"] = {
        userDictPath = db_path("/dictionaries/user.txt"),
        workspaceDictPath = db_path("/dictionaries/workspaces/" .. workspace_id .. ".txt"),
        fileDictPath = db_path("/dictionaries/files/"),
        ignoredLintsPath = db_path("/lints/" .. workspace_id .. "/"),

        dialect = "British",
      },
    },
  }
end
