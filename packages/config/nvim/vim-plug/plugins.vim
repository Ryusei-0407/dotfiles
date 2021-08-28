" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " Snippets
    Plug 'honza/vim-snippets'
    Plug 'SirVer/ultisnips'
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
    " Indent
    Plug 'lukas-reineke/indent-blankline.nvim'
    " Multiple cursors
    Plug 'terryma/vim-multiple-cursors'
    " Terminal
    Plug 'vimlab/split-term.vim'
    " Tig
    Plug 'iberianpig/tig-explorer.vim'
    Plug 'rbgrouleff/bclose.vim'
    " Airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Markdown
    Plug 'skanehira/preview-markdown.vim'
    " Silicon
    Plug 'segeljakt/vim-silicon'
    " Dap
    Plug 'mfussenegger/nvim-dap'
    " Denops
    " Plug 'vim-denops/denops.vim'
    " Plug 'Shougo/ddc.vim'
    " LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'ray-x/lsp_signature.nvim'
    Plug 'nvim-lua/lsp_extensions.nvim'
    " Complete
    Plug 'hrsh7th/nvim-compe'
    " Plug 'ms-jpq/coq_nvim', { 'branch': 'coq' }
    " Plug 'ms-jpq/coq.artifacts', { 'branch': 'artifacts' }
    " Treesitter
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
    " Rust tools
    Plug 'rust-lang/rust.vim'
    Plug 'simrat39/rust-tools.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'mfussenegger/nvim-dap'
    " Terraform
    Plug 'hashivim/vim-terraform'
    " Flutter
    Plug 'dart-lang/dart-vim-plugin'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'akinsho/flutter-tools.nvim'
    " Python Black
    Plug 'a-vrma/black-nvim', { 'do': ':UpdateRemotePlugins' }
    " Solidity
    Plug 'tomlion/vim-solidity'
   
call plug#end()
