local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set('n', '<leader>fo', function()
        vim.lsp.buf.format { async = true }
    end, opts)
    
    -- vim.keymap.set('n', '<leader>fo', function()
    --     vim.cmd('Format')
    -- end, opts)
end)


require('mason').setup({})

require('mason-lspconfig').setup({
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,
    }
})

-- require'lspconfig'.basedpyright.setup{}
-- require'lspconfig'.marksman.setup{}
-- require'lspconfig'.ltex.setup{}
-- require'lspconfig'.gopls.setup{}

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'cmp_zotcite' },
        { name = 'luasnip', keyword_length = 2 },
        { name = 'buffer',  keyword_length = 3 },
    },
    formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ["<CR>"] = cmp.mapping({
            i = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
            -- i = function()
            --     if cmp.visible() then
            --         cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
            --     end
            -- end,
        }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
    -- snippet = {
    --     expand = function(args)
    --         require('luasnip').lsp_expand(args.body)
    --     end,
    -- },
    -- preselect = 'item',
    -- completion = {
    --     completeopt = 'menu,menuone,noinsert'
    -- },
    -- window = {
    --     completion = cmp.config.window.bordered(),
    --     documentation = cmp.config.window.bordered(),
    -- },


})


-- cmp.setup({
--     mapping = {
--         -- ["<Tab"] = cmp.mapping(function(fallback)
--         --     if cmp.visible() then
--         --         cmp.select_next_item()
--         --         -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
--         --         -- that way you will only jump inside the snippet region
--         --     elseif luasnip.expand_or_jumpable() then
--         --         luasnip.expand_or_jump()
--         --     elseif has_words_before() then
--         --         cmp.complete()
--         --     else
--         --         fallback()
--         --     end
--         -- end, { "i", "s" }),
--
--         -- ["<S-Tab>"] = cmp.mapping(function(fallback)
--         --     if cmp.visible() then
--         --         cmp.select_prev_item()
--         --     elseif luasnip.jumpable(-1) then
--         --         luasnip.jump(-1)
--         --     else
--         --         fallback()
--         --     end
--         -- end, { "i", "s" }),
--         ['<CR>'] = cmp.mapping.confirm({ select = true }),
--         ['<C-n>'] = cmp.mapping.select_next_item(),
--         ['<C-p>'] = cmp.mapping.select_prev_item(),
--     },
--     sources = {
--         { name = 'nvim_lsp' },
--         { name = 'nvim_lua' },
--         { name = 'luasnip' },
--         { name = 'buffer' },
--     },
--
--     --- (Optional) Show source name in completion menu
--     formatting = {
--         -- changing the order of fields so the icon is the first
--         fields = { 'menu', 'abbr', 'kind' },
--
--         -- here is where the change happens
--         format = function(entry, item)
--             local menu_icon = {
--                 nvim_lsp = 'λ',
--                 luasnip = '⋗',
--                 buffer = 'Ω',
--                 path = '🖫',
--                 nvim_lua = 'Π',
--             }
--
--             item.menu = menu_icon[entry.source.name]
--             return item
--         end,
--     },
-- })


-- -- Setup language servers.
-- local lspconfig = require('lspconfig')
-- local lsp_defaults = lspconfig.util.default_config
-- local lsp_zero = require('lsp-zero')
--
-- lsp_zero.on_attach(function(client, bufnr)
--     -- see :help lsp-zero-keybindings
--     -- to learn the available actions
--     --         vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
--     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--     vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
--     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--     vim.keymap.set('n', '<leader>sh', vim.lsp.buf.signature_help, opts)
--     vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
--     vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
--     vim.keymap.set('n', '<space>wl', function()
--         print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--     end, opts)
--     vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
--     vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
--     vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
--     vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--     vim.keymap.set('n', '<leader>fo', function()
--         vim.lsp.buf.format { async = true }
--     end, opts)
-- end)
--
--
--
-- -- lsp_defaults.capabilities = vim.tbl_deep_extend(
-- --     'force',
-- --     lsp_defaults.capabilities,
-- --     require('cmp_nvim_lsp').default_capabilities()
-- -- )
--
--
--
-- -- lspconfig.pyright.setup {}
-- -- lspconfig.tsserver.setup {}
-- -- lspconfig.gopls.setup({
-- --     cmd = { 'gopls', '--remote=auto' },
-- --     settings = {
-- --         gopls = {
-- --             analyses = {
-- --                 unusedparams = true,
-- --             },
-- --             staticcheck = true,
-- --             gofumpt = true,
-- --         },
-- --     },
-- -- })
-- -- lspconfig.rust_analyzer.setup {
-- --     -- Server-specific settings. See `:help lspconfig-setup`
-- --     settings = {
-- --         ['rust-analyzer'] = {},
-- --     },
-- -- }
--
--
--
-- -- Global mappings.
-- -- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
--
--
-- -- Use LspAttach autocommand to only map the following keys
-- -- after the language server attaches to the current buffer
-- -- vim.api.nvim_create_autocmd('LspAttach', {
-- --     group = vim.api.nvim_create_augroup('UserLspConfig', {}),
-- --     callback = function(ev)
-- --         -- Enable completion triggered by <c-x><c-o>
-- --         -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
-- --
-- --         -- Buffer local mappings.
-- --         -- See `:help vim.lsp.*` for documentation on any of the below functions
-- --         local opts = { buffer = ev.buf }
-- --         vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
-- --         vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
-- --         vim.keymap.set('n', 'gh', vim.lsp.buf.hover, opts)
-- --         vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
-- --         vim.keymap.set('n', '<leader>sh', vim.lsp.buf.signature_help, opts)
-- --         vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
-- --         vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
-- --         vim.keymap.set('n', '<space>wl', function()
-- --             print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- --         end, opts)
-- --         vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
-- --         vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
-- --         vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
-- --         vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
-- --         vim.keymap.set('n', '<leader>fo', function()
-- --             vim.lsp.buf.format { async = true }
-- --         end, opts)
-- --     end,
-- -- })
--
--
-- local default_setup = function(server)
--     lspconfig[server].setup({})
-- end
--
--
-- require('mason').setup({})
-- require('mason-lspconfig').setup({
--   ensure_installed = {'tsserver', 'rust_analyzer'},
--   handlers = {
--     lsp_zero.default_setup,
--     lua_ls = function()
--       local lua_opts = lsp_zero.nvim_lua_ls()
--       require('lspconfig').lua_ls.setup(lua_opts)
--     end,
--   }
-- })
-- -- require('mason-lspconfig').setup({
-- --     ensure_installed = {},
-- --     handlers = { default_setup },
-- -- })
--
-- require("mason-nvim-lint").setup()
--
--
--
-- local has_words_before = function()
--     unpack = unpack or table.unpack
--     local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--     return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end
--
-- local luasnip = require("luasnip")
-- local cmp = require('cmp')
-- local cmp_select = {behavior = cmp.SelectBehavior.Select}
--
--
--
--
-- -- require 'lspconfig'.mojo.setup {}
--
vim.filetype.add({ extension = { templ = "templ" } })
-- vim.cmd [[
-- augroup cmp-confg
--     autocmd!
--     autocmd InsertEnter * lua if vim.fn.bufname("%") == "[Command Line]" then
--     \   require'cmp'.setup.buffer { view = {entries = "native"} }
--     \   end
-- augroup END
-- ]]

-- [nvim-cmp] experimental.native_menu is deprecated.
-- [nvim-cmp] Please use view.entries = "native" instead.
--
--
--
-- -- lspconfig.html.setup({
-- --     on_attach = on_attach,
-- --     capabilities = capabilities,
-- --     filetypes = { "html", "templ" },
-- -- })
-- --
-- -- lspconfig.htmx.setup({
-- --     on_attach = on_attach,
-- --     capabilities = capabilities,
-- --     filetypes = { "html", "templ" },
-- -- })
-- --
-- -- lspconfig.tailwindcss.setup({
-- --     on_attach = on_attach,
-- --     capabilities = capabilities,
-- --     filetypes = { "templ", "astro", "javascript", "typescript", "react" },
-- --     init_options = { userLanguages = { templ = "html" } },
-- -- })
