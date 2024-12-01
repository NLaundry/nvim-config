local wilder = require('wilder')
-- Key bindings can be changed, see below
wilder.setup({ modes = { ':', '/', '?' } })
-- Disable Python remote plugin
wilder.set_option('use_python_remote_plugin', 0)

local highlighters = {
    wilder.pcre2_highlighter(),
    wilder.lua_fzy_highlighter(),
}


wilder.set_option('pipeline', {
    wilder.branch(
        wilder.cmdline_pipeline({
            fuzzy = 1,
            fuzzy_filter = wilder.lua_fzy_filter(),
        }),
        wilder.vim_search_pipeline()
    )
})


local test_menu_renderer = wilder.popupmenu_renderer(
    wilder.popupmenu_border_theme({
        border = 'rounded',
        empty_message = wilder.popupmenu_empty_message_with_spinner(),
        highlighter = highlighters,
        left = {
            ' ',
            wilder.popupmenu_devicons(),
            wilder.popupmenu_buffer_flags({
                flags = ' a + ',
                icons = { ['+'] = '', a = '', h = '' },
            }),
        },
        right = {
            ' ',
            wilder.popupmenu_scrollbar(),
        },
        highlights = {
            accent = wilder.make_hl('WilderAccent', 'Pmenu', { { a = 1 }, { a = 1 }, { foreground = '#f4468f' } }), },
    })
)

wilder.set_option('renderer', test_menu_renderer)
wilder.set_option('renderer', wilder.renderer_mux({
    [':'] = test_menu_renderer,
    ['/'] = test_menu_renderer,
    substitute = test_menu_renderer,
}))
