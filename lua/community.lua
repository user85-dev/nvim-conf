---@type LazySpec
local spec = {
  "AstroNvim/astrocommunity",
  -- UI
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.color.tint-nvim" },
  { import = "astrocommunity.bars-and-lines.dropbar-nvim" },
  { import = "astrocommunity.bars-and-lines.lualine-nvim" },
  { import = "astrocommunity.recipes.telescope-lsp-mappings" },

  -- LSP
  { import = "astrocommunity.lsp.lsp-signature-nvim" },
  { import = "astrocommunity.lsp.actions-preview-nvim" },

  -- Git
  { import = "astrocommunity.git.blame-nvim" },

  -- Completion

  -- Icons
  { import = "astrocommunity.icon.mini-icons" },

  -- Plugins
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.indent.mini-indentscope" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.terminal-integration.vim-tmux-navigator" },
  { import = "astrocommunity.file-explorer.telescope-file-browser-nvim" },
  { import = "astrocommunity.programming-language-support.csv-vim" },

  -- Motions
  { import = "astrocommunity.motion.flit-nvim" },
  { import = "astrocommunity.motion.mini-move" },
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.motion.marks-nvim" },

  -- Packs (always loaded)
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.cs-omnisharp" },
}

-- Conditionally add packs only if *not* in SSH
if not os.getenv "SSH_TTY" then
  local local_packs = { "svelte", "php", "go", "bash", "sql" }
  for _, pack in ipairs(local_packs) do
    table.insert(spec, { import = "astrocommunity.pack." .. pack })
  end
end

return spec
