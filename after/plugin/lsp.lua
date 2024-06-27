-- lsp configs
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


