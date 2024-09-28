-- package manager configuration
--
local Plug = vim.fn["plug#"]
vim.call("plug#begin")
	Plug('williamboman/mason-lspconfig.nvim')				-- Mason integration with lsp config
	Plug('hrsh7th/nvim-cmp')
  Plug('hrsh7th/cmp-nvim-lsp')
  Plug('neovim/nvim-lspconfig')
  Plug('L3MON4D3/LuaSnip')
  Plug('VonHeikemen/lsp-zero.nvim', {['branch']= 'v3.x'})
  Plug('williamboman/mason.nvim') 					-- Mason package manager
  Plug('nvim-treesitter/nvim-treesitter', {['do']= ':TSUpdate'})		-- Nvim treesitter
	Plug('nvim-tree/nvim-web-devicons')					-- Nvim sidebar icons
	Plug('nvim-tree/nvim-tree.lua')						-- Nvim sidebar
  Plug('nvim-treesitter/playground')                  -- Nvim treesitter plugin that prints the AST
	Plug('navarasu/onedark.nvim')						-- Nvim onedark theme
	Plug('nvim-lua/plenary.nvim')						-- Depedency for telescope
	Plug('nvim-telescope/telescope.nvim', {['tag']='0.1.8'})			-- Telescope
	Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do']= 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' })  -- FZF native
    Plug('nvim-lua/plenary.nvim') -- don't forget to add this one if you don't have it yet!
    Plug('ThePrimeagen/harpoon')
    Plug('duane9/nvim-rg')
    Plug('mbbill/undotree')
  Plug('f-person/git-blame.nvim')


 Plug('folke/trouble.nvim')
vim.call("plug#end")

