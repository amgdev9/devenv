require('lualine').setup({
    options = {
        disabled_filetypes = {'NvimTree'},
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'location'}
    },
})
