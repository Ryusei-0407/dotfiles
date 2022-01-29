local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<Space>[", ":BufferPrevious<CR>", opts)
map("n", "<Space>]", ":BufferNext<CR>", opts)
map("n", "<Space>,", ":BufferMovePrevious<CR>", opts)
map("n", "<Space>.", ":BufferMoveNext<CR>", opts)
map("n", "<Space>w", ":BufferClose<CR>", opts)
