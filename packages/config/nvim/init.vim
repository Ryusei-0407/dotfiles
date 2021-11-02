source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/fzf.vim
source $HOME/.config/nvim/general/nvim-treesitter.vim
" source $HOME/.config/nvim/lsp/config.vim
" source $HOME/.config/nvim/lsp/compe-config.vim
" source $HOME/.config/nvim/ddc/config.vim
source $HOME/.config/nvim/themes/airline.vim

" CoC
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Split window
nnoremap ss :split<CR>
nnoremap sv :vsplit<CR>
" Move windows
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
" Tab next
nnoremap gn :tabNext<CR>
