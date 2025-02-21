return {
    {
        "echasnovski/mini.comment",
        version = '*',
        config = function()
            require("mini.comment").setup({
                mappings = {
                    comment = "<leader>/",
                    comment_visual = "<leader>/",
                },
                hooks = {
                    pre = function() end,
                    post = function() end,
                }
            })
        end,
    },
    {
        "echasnovski/mini.surround",
		version = "*",
		config = true,
    }
}
