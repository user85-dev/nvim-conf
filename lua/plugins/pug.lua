---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = function(_, opts)
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "pug" })
      end
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "pug_ls" })
    end,
  },

  {
    "AstroNvim/astrolsp",
    optional = true,
    opts = {
      config = {
        pug_ls = {
          cmd = { "pug-lsp", "--stdio" },
          filetypes = { "pug" },
          root_dir = function(fname) return require("lspconfig.util").root_pattern("package.json", ".git")(fname) end,
        },
      },
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "pug-lsp" })
      local lspconfig = require "lspconfig"
      lspconfig.pug.setup {}
    end,
  },

  {
    "jay-babu/mason-null-ls.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed or {}, { "prettierd" })
    end,
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      if not opts.formatters_by_ft then opts.formatters_by_ft = {} end
      opts.formatters_by_ft["pug"] = { "prettierd" }

      local function ensure_pug_plugin()
        local has_plugin = vim.fn.system "npm list -g prettier-plugin-pug" or ""
        if not has_plugin:match "prettier%-plugin%-pug" then
          vim.notify("Installing prettier-plugin-pug globally...", vim.log.levels.INFO)
          vim.fn.system "npm install -g prettier prettier-plugin-pug"
        end
      end

      vim.schedule(ensure_pug_plugin)
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    optional = true,
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed or {}, { "prettierd" })
    end,
  },
}
