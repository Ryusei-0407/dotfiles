local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "ss", ":split<CR>", opts)
keymap("n", "sv", ":vsplit<CR>", opts)

-- telescope
keymap("n", "<leader>f", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<C-t>", "<cmd>Telescope live_grep<CR>", opts)

-- nvim-tree
keymap("n", "<C-e>", ":NvimTreeToggle<CR>", opts)

-- winresizer
vim.g.winresizer_start_key = "<C-s>"

-- multiple cursors
vim.g.mluti_cursor_use_default_mapping = 0
vim.g.multi_cursor_start_word_key = "<C-n>"
vim.g.multi_corsor_next_key = "<C-n>"
vim.g.multi_cursor_prev_key = "<C-p>"
vim.g.multi_cursor_skip_key = "<C-x>"
vim.g.multi_corsor_quit_key = "<Esc>"

-- block paste
vim.g.block_paste_fill_blank = 1

-- fast
vim.g.did_install_default_menus = 1
vim.g.did_install_syntax_menu = 1
vim.g.did_indent_on = 1
vim.g.did_load_ftplugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_man = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_remote_plugins = 1
vim.g.loaded_shada_plugin = 1
vim.g.loaded_spellfile_plugin = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_tutor_mode_plugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.skip_loading_mswin = 1
