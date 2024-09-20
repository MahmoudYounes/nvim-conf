local harpoonui = require('harpoon.ui')
local harpoonmark = require('harpoon.mark')
local harpoonterm = require('harpoon.term')
local harpoontmux = require('harpoon.tmux')
local harpoon = require('harpoon')

local global_settings = {
    -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
    save_on_toggle = false,

    -- saves the harpoon file upon every change. disabling is unrecommended.
    save_on_change = true,

    -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
    enter_on_sendcmd = false,

    -- closes any tmux windows harpoon that harpoon creates when you close Neovim.keymap.
    tmux_autoclose_windows = false,

    -- filetypes that you want to prevent from adding to the harpoon list menu.
    excluded_filetypes = {},

    -- set marks specific to each git branch inside git repository
    mark_branch = false,

    -- enable tabline with harpoon marks
    tabline = false,
    tabline_prefix = "   ",
    tabline_suffix = "   ",
}

-- global config
harpoon.setup(global_settings)


-- keybindings
local function opts(desc)
    return {
        desc= 'Harpoon:' .. desc
    }
end

local vim = vim
vim.keymap.set('n', '<C-a>a', harpoonmark.add_file, opts('Harpoon: Mark file'))
vim.keymap.set('n', '<C-a>t', harpoonui.toggle_quick_menu, opts('Harpoon: Toggle'))
vim.keymap.set('n', '<C-a>1', function() harpoonui.nav_file(1) end, opts('Harpoon: nav file 1'))
vim.keymap.set('n', '<C-a>2', function() harpoonui.nav_file(2) end, opts('Harpoon: nav file 2'))
vim.keymap.set('n', '<C-a>3', function() harpoonui.nav_file(3) end, opts('Harpoon: nav file 3'))
vim.keymap.set('n', '<C-a>4', function() harpoonui.nav_file(4) end, opts('Harpoon: nav file 4'))
vim.keymap.set('n', '<C-a>n', harpoonui.nav_next, opts('Harpoon: nav next'))

