vim.cmd [[
try
    colorscheme default
catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme default
endtry
]]
