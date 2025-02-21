return {
    "windwp/nvim-ts-autotag",
    ft = { "typescriptreact" },
    config = function()
        require("nvim-ts-autotag").setup({})
    end
}
