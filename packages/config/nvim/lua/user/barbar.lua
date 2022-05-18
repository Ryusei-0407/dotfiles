local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<Space>h", ":BufferPrevious<CR>", opts)
map("n", "<Space>l", ":BufferNext<CR>", opts)
map("n", "<Space>,", ":BufferMovePrevious<CR>", opts)
map("n", "<Space>.", ":BufferMoveNext<CR>", opts)
map("n", "<Space>w", ":BufferClose<CR>", opts)
