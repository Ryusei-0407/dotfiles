vim.g.dracula_colorterm = 0

vim.cmd([[
try
    colorscheme dracula_pro_base
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
endtry
]])
