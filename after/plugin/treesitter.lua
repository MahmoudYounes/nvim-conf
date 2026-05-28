-- Ensure that the tree-sitter cli is installed because this is a 
-- must have dependency

local treesitter=require('nvim-treesitter')
treesitter.setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}

local languages = {'go', 'c', 'cpp', 'markdown'}

treesitter.install(languages)

 vim.api.nvim_create_autocmd('FileType', {
    pattern = languages,
    callback = function()
      -- syntax highlighting, provided by Neovim
      vim.treesitter.start()
      -- indentation, provided by nvim-treesitter
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  })
