vim.g.material_style = 'palenight'

vim.cmd [[
try
    colorscheme material
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
endtry
]]
