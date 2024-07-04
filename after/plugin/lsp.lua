local lsp = require("lsp-zero")

lsp.preset("recommended")

local lspcfg = require("lspconfig")
lspcfg.clangd.setup{
      filetypes={ "c", "cpp","hpp","h", "objc", "objcpp", "cuda", "proto" },
      cmd= {"clangd", "--offset-encoding=utf-16"},
      root_dir=require('lspconfig').util.root_pattern(
          '.clangd',
          '.clang-tidy',
          '.clang-format',
          'compile_commands.json',
          'compile_flags.txt',
          'configure.ac',
          '.git'
        )}


lspcfg.lua_ls.setup{
    -- the following comes from
    -- https://github.com/neovim/neovim/issues/21686#issuecomment-1522446128
    settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {
          'vim',
          'require'
        },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        -- the following does not show nvim api completion 
       --library = vim.env.runtime, 
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}



local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-f>'] = cmp_action.luasnip_jump_forward(),
      ['<C-b>'] = cmp_action.luasnip_jump_backward(),
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
    }),
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
  })

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "<C-d>d", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "<C-d>]", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "<C-d>[", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<C-d> ", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<C-d>re", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<C-d>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-d>h", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
