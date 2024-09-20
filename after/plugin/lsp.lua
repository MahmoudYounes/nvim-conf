-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- configures key bindings
function on_attach(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    local opts = { noremap=true, silent=true, buffer=bufnr }
 
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    
    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>re', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>fmt', vim.lsp.buf.format, opts)
    vim.keymap.set('n', '<leader>gc', vim.lsp.buf.code_action, opts)
end

local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(on_attach)

local lspconfig = require('lspconfig')

lspconfig.gopls.setup {
    cmd = { 'gopls', '-remote=auto' },
    on_attach = on_attach, 
    flags = {
        -- Don't spam LSP with changes. Wait a second between each.
        debounce_text_changes = 1000,
    },
    capabilities = capabilities
}

lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    },
    on_attach = on_attach, 
    capabilities = capabilities
}

lspconfig.clangd.setup{
    on_attach = on_attach,
    capabilities = capabilities
}

local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}


