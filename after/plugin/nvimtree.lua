-- Nvim tree configurations

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Nvim tree key mappings
local function nvim_tree_key_maps(bufnr)
   local api = require 'nvim-tree.api'
   -- this function formats the options passed to it to return a structure that is
   -- understandable to nvim-tree api
   local function opts(desc)
	return {
		desc = "nvim-tree: " .. desc,
		buffer = bufnr,
		noremap = true,
		silent = true,
		nowait = true
	}
   end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-r>o',   api.tree.change_root_to_node,        opts('CD'))
  vim.keymap.set('n', '<C-r>cd',   api.node.open.replace_tree_buffer,   opts('Open: In Place'))
  vim.keymap.set('n', '<C-r>v', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', '<C-r>h', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.set('n', '<C-r>fc', api.fs.create, opts('Create File Or Directory'))
  vim.keymap.set('n', '<C-r>fr', api.fs.rename_sub, opts('Rename: Omit Filename'))
  vim.keymap.set('n', '<C-r>fd', api.fs.remove, opts('Delete File Or Directory'))
  vim.keymap.set('n', '<C-r>fy', api.fs.copy.node, opts('Copy'))
  vim.keymap.set('n', '<C-r>fp', api.fs.paste, opts('Paste'))
  vim.keymap.set('n', '<C-r>fx', api.fs.cut, opts('Cut'))
  vim.keymap.set('n', '<C-r>?',      api.tree.toggle_help,                  opts('Help'))
end

-- Nvim tree setup configs
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  on_attach = nvim_tree_key_maps,
})
