return {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup({
            open_mapping = [[<C-\>]],
            size = 20,
            hide_numbers = true,
            direction = "float",
            close_on_exit = true,
        })
    end,
}
