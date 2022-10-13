local cmp = require('cmp')

local icons = {
    Text = '',
    Method = '',
    Function = '',
    Constructor = '',
    Field = 'ﰠ',
    Variable = '',
    Class = 'ﴯ',
    Interface = '',
    Module = '',
    Property = 'ﰠ',
    Unit = '塞',
    Value = '',
    Enum = '',
    Keyword = '',
    Snippet = '',
    Color = '',
    File = '',
    Reference = '',
    Folder = '',
    EnumMember = '',
    Constant = '',
    Struct = 'פּ',
    Event = '',
    Operator = '',
    TypeParameter = '',
}

local aliases = {
    nvim_lsp = 'LSP',
    luasnip = 'Snippet',
    nvim_lsp_signature_help = "Signature",
    buffer = "BR",
    latex_symbols = "LTX Sym"
}

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-k>'] = cmp.mapping.scroll_docs(-4),
        ['<C-j>'] = cmp.mapping.scroll_docs(4),
        ['<Enter>'] = cmp.mapping.confirm({ select = true }),
        ['<C-o>'] = cmp.mapping.complete(),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),

    sources = cmp.config.sources({
        { name = 'nvim_lsp', max_item_count = 10 },
        { name = 'path', max_item_count = 10 },
        { name = 'buffer', max_item_count = 3 },
        { name = 'nvim_lsp_signature_help' },
        { name = 'latex_symbols', max_item_count = 3 },
        { name = 'omni', },
    }),

    experimental = {
        ghost_text = true,
    },

    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    formatting = {
        format = function(entry, item)
            -- Kind icons
            item.kind = string.format('%s %s', icons[item.kind], item.kind)
            -- Source
            item.menu = string.format('[%s]', aliases[entry.source.name] or entry.source.name)
            return item
        end,
    },
})
