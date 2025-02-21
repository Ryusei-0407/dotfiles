return {
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "lua",
                    "markdown",
                    "markdown_inline",
                },
                context_commentstring = { enable = true },
                highlight = { enable = true },
                indent = { enable = true },
                rainbow = {
                    enable = true,
                    extended_mode = true,
                    max_file_lines = nil
                },
            })
        end,
    },
}
