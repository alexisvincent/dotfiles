local function get_lsp_cond()
  local client = vim.lsp.get_active_clients({ bufnr = 0 })[1]
  if client then
    return true
  end
  return false
end

local function get_lsp_client_color()
  local client = vim.lsp.get_active_clients({ bufnr = 0 })[1]
  if not client or not client.initialized then
    return {
      bg = "#928374",
      fg = "#1b1b1b",
    }
  end

  return {
    bg = "#b0b846",
    fg = "#1b1b1b",
  }
end

local function show_recording()
  local reg = vim.fn.reg_recording()

  if reg == "" then
    return ""
  end

  return "RECORDING @" .. reg
end

local function get_lsp_client_status()
  for _, client in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
    if client.initialized then
      -- return "🚀"
      -- return "∵"
      -- return "🪢"
      -- return "🌒"
      return "🌔"
    end
  end
  return nil
end

local function get_lsp_client_status()
  return " LSP"
end



local function get_nrepl_status()
  if vim.bo.filetype == "clojure" then
    local nrepl = require("julienvincent.lang.clojure.nrepl")
    return nrepl.get_repl_status("Not Connected")
  end
  return ""
end

return {
  {
    "nvim-lualine/lualine.nvim",

    event = "VeryLazy",

    config = function()
      local lualine = require("lualine")

      lualine.setup({
        options = {
          icons_enabled = true,
          globalstatus = true,
          theme = "auto",
          component_separators = { left = "", right = "" },
          -- component_separators = "±",
          -- section_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = {
            "mode",
            { show_recording, color = { bg = "#d79921" } },
          },
          lualine_b = {
            {
              "filename",
              path = 1, -- 1: Relative path
              symbols = {
                modified = "[+]", -- Text to show when the file is modified.
                readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
                unnamed = "[No Name]", -- Text to show for unnamed buffers.
                newfile = "[New]", -- Text to show for newly created file before first write
              },
              -- Small attempt to workaround https://github.com/nvim-lualine/lualine.nvim/issues/872
              -- Upstream issue: https://github.com/neovim/neovim/issues/19464
              fmt = function(filename)
                if #filename > 80 then
                  filename = vim.fs.basename(filename)
                end
                return filename
              end,

            },
          },
          lualine_c = {
            "location",
            {
              "diagnostics",
              sources = { "nvim_lsp" },
              -- Displays diagnostics for the defined severity types
              sections = { "error", "warn", "info", "hint" },
              symbols = { error = "• ", warn = "• ", info = "• ", hint = "• " },
              -- update_in_insert = true,
            },
          },

          lualine_x = {
            "filesize",
            "encoding",
            "fileformat",
          },
          lualine_y = {
            {
              "filetype",
            },

            {
              get_lsp_client_status,
              cond = get_lsp_cond,
              color = get_lsp_client_color,

              padding = { left = 1, right = 1 },
              -- color = {
              --   fg = "#b0b846",
              -- },
            },

            {
              get_nrepl_status,
            },

            -- {
            --   fmt = get_nrepl_status,
            --   "repl_status",
            -- },
          },
          lualine_z = {
            "branch",
            "diff",
            "tag",
          },
        },
      })
    end,
  },
}
--
--
--
