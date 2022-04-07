require("options")
require("keymaps")
require("plugins")
require("telescope")
require("barbar")
require("indentline")

vim.cmd([[
try
    colorscheme zephyr
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
endtry
]])
