require('bufferline').setup {
    options = {
        mode = "tabs",
        buffer_close_icon = '',
        separator_style = '|',
        offsets = {
            {
                filetype = "NvimTree",
                text = "",
                highlight = "Directory",
                text_align = "left",
                separator = " "
            }
        }
    },

}

