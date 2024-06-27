-- package manager configuration
--
local Plug = vim.fn["plug#"]
vim.call("plug#begin")
	Plug('williamboman/mason-lspconfig.nvim')				-- Mason integration with lsp config
	Plug('williamboman/mason.nvim') 					-- Mason package manager
	Plug('nvim-treesitter/nvim-treesitter', {['do']= ':TSUpdate'})		-- Nvim treesitter
	Plug('nvim-tree/nvim-web-devicons')					-- Nvim sidebar icons
	Plug('nvim-tree/nvim-tree.lua')						-- Nvim sidebar
	Plug('navarasu/onedark.nvim')						-- Nvim onedark theme
	Plug('nvim-lua/plenary.nvim')						-- Depedency for telescope
	Plug('nvim-telescope/telescope.nvim', {['tag']='0.1.8'})			-- Telescope
	Plug('nvim-telescope/telescope-fzf-native.nvim', { ['do']= 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' })  -- FZF native
vim.call("plug#end")

-- treesitter playground
-- harpoon  file navigation
-- undotree undos in a tree
-- fugitive git management stuff
-- lsp.zero
-- webdev.icons
