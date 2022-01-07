-- vim.g.material_style = 'palenight'

vim.cmd [[
try
    colorscheme dracula
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
endtry
]]
