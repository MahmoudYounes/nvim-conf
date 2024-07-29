print("hello from lsp module")
local lsp_zero = require('lsp-zero')
local vim = vim

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
      lsp_zero.default_keymaps({buffer = bufnr})
      vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition)
      vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration)
      vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation)
      vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references)
      vim.keymap.set('n', '<leader>re', vim.lsp.buf.rename)
      vim.keymap.set('n', '<leader>fmt', vim.lsp.buf.format)

    end)

lsp_zero.format_on_save()

--- if you want to know more about lsp-zero and mason.nvim
--- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require('mason-lspconfig').setup()

require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function (server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {}
        end,
        -- Next, you can provide a dedicated handler for specific servers.
        -- For example, a handler override for the `rust_analyzer`:
        ["rust_analyzer"] = function ()
            require("rust-tools").setup {}
        end
    }


