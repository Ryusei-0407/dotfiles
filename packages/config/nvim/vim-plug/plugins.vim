" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')

" Colortheme
    Plug 'wadackel/vim-dogrun'

" JK
    Plug 'PHSix/faster.nvim'

" Sandwich
    Plug 'machakann/vim-sandwich'

" Silicon
    Plug 'segeljakt/vim-silicon'

" Block Paste
   Plug 'Rasukarusan/vim-block-paste'

" Select Multi Lines
    Plug 'Rasukarusan/nvim-select-multi-line'

" Split window resize
    Plug 'simeji/winresizer'

" Explore
    Plug 'lambdalisue/fern.vim'
    Plug 'lambdalisue/fern-git-status.vim'
    Plug 'lambdalisue/nerdfont.vim'
    Plug 'lambdalisue/fern-renderer-nerdfont.vim'
    Plug 'lambdalisue/glyph-palette.vim'

" fzf
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'

" Multiple cursors
    Plug 'terryma/vim-multiple-cursors'

" Terminal
    Plug 'voldikss/vim-floaterm'

" Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

" Markdown
    Plug 'skanehira/preview-markdown.vim'

" LSP
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'

" Complete
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'

" Treesitter
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" Prettier
    Plug 'prettier/vim-prettier', { 
        \ 'do': 'yarn install --frozen-lockfile --production',
        \ 'for': ['javascript', 'typescript', 'css', 'json', 'graphql', 'markdown', 'svelte', 'yaml', 'html'] }

" Solidity
    Plug 'tomlion/vim-solidity'

" Copilot
    Plug 'github/copilot.vim'
   
call plug#end()
