require('trouble').setup({
  icons = false
})

vim.keymap.set('n', '<C-t>o', function()
    require("trouble").toggle()
end)

