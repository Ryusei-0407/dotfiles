vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

keymap.set("", "<Space>", "<Nop>")
keymap.set("n", "<Enter><Enter>", "<C-w><C-w>")

-- Buffer
keymap.set("n", "<C-]>", "<CMD>BufferLineCycleNext<CR>")
keymap.set("n", "<C-[>", "<CMD>BufferLineCyclePrev<CR>")
-- keymap.set("n", "<leader>w", "<CMD>BufferClose<CR>")
