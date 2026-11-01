-- Parsers installed on startup (missing ones are built in the background).
local parsers = {
  "cpp",
  "bash",
  "fish",
  "html",
  "javascript",
  "http",
  "json",
  "csv",
  "lua",
  "luadoc",
  "luap",
  "markdown",
  "markdown_inline",
  "kdl",
  "mermaid",
  "regex",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "yaml",
  "graphql",
  "fennel",
  "clojure",
  "commonlisp",
  "rust",
  "go",
  "wit",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- The main branch is the rewrite for Neovim 0.12 (master is frozen and
    -- breaks on 0.12). It builds parsers with the tree-sitter CLI.
    branch = "main",
    build = ":TSUpdate",
    lazy = false,

    config = function()
      require("nvim-treesitter").setup({})
      -- Two at a time: building every parser at once on a fresh machine needs
      -- well over 1 GiB of memory (the Rex machines got killed for it).
      require("nvim-treesitter").install(parsers, { max_jobs = 2 })

      local parser_configs = require("nvim-treesitter.parsers")

      parser_configs.spicedb = {
        install_info = {
          url = "https://github.com/authzed/tree-sitter-spicedb",
          branch = "main",
          files = { "src/parser.c" },
        },
      }
      vim.treesitter.language.register("spicedb", { "authzed" })

      parser_configs.numscript = {
        install_info = {
          url = "https://github.com/julienvincent/tree-sitter-numscript",
          branch = "master",
          files = { "src/parser.c" },
        },
      }

      -- Highlighting and indenting are no longer switched on by the plugin:
      -- start them for every buffer whose language has a parser installed.
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "*" },
        callback = function(event)
          local file_size = vim.fn.getfsize(vim.api.nvim_buf_get_name(event.buf))
          if file_size > 256 * 1024 then
            return
          end

          local lang = vim.treesitter.language.get_lang(vim.bo[event.buf].filetype)
          if not lang or not vim.treesitter.language.add(lang) then
            return
          end

          local ok, err = pcall(vim.treesitter.start, event.buf, lang)
          if not ok then
            vim.notify("Failed to start treesitter parser for [" .. lang .. "]: " .. err, vim.log.levels.WARN)
            return
          end

          vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },

  {
    "julienvincent/tree-sitter-numscript",
  },

  {
    "https://github.com/windwp/nvim-ts-autotag",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = true,
        },
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("treesitter-context").setup({
        enable = false,
        max_lines = 0,
        min_window_height = 0,
        line_numbers = true,
        multiline_threshold = 20,
        separator = "-",
      })

      vim.keymap.set("n", "<localleader>C", "<Cmd>TSContextToggle<Cr>", {
        desc = "Toggle treesitter context",
      })
    end,
  },
}
