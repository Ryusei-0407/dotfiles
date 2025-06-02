vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

keymap.set("", "<Space>", "<Nop>")
keymap.set("n", "<Enter><Enter>", "<C-w><C-w>")

-- Buffer
keymap.set("n", "<leader>]", "<CMD>bnext<CR>")
keymap.set("n", "<leader>[", "<CMD>bprevious<CR>")
keymap.set("n", "<leader>w", function()
	Snacks.bufdelete()
end)
