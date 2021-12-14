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

" Better Syntax Support
    Plug 'sheerun/vim-polyglot'

" Snippets
    Plug 'honza/vim-snippets'
    Plug 'SirVer/ultisnips'

" Match up
    Plug 'andymass/vim-matchup'

" Sandwich
    Plug 'machakann/vim-sandwich'

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

" Silicon
    Plug 'segeljakt/vim-silicon'

" Dap
    " Plug 'mfussenegger/nvim-dap'
    " Plug 'rcarriga/nvim-dap-ui'
    " Plug 'theHamsta/nvim-dap-virtual-text'
    " Plug 'nvim-lua/plenary.nvim'

" Denops
    " Plug 'vim-denops/denops.vim'
    " Plug 'Shougo/ddc.vim'

" CoC
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

" LSP
    " Plug 'neovim/nvim-lspconfig'
    " Plug 'kabouzeid/nvim-lspinstall'
    " Plug 'ray-x/lsp_signature.nvim'
    " Plug 'nvim-lua/lsp_extensions.nvim'

" Complete
    " Plug 'hrsh7th/nvim-compe'
    " Plug 'hrsh7th/nvim-cmp'
    " Plug 'hrsh7th/vim-vsnip'
    " Plug 'hrsh7th/cmp-buffer'

" Treesitter
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" Rust
    Plug 'rust-lang/rust.vim'
    " Plug 'simrat39/rust-tools.nvim'
    Plug 'nvim-lua/popup.nvim'

" Go
    Plug 'ray-x/go.nvim'

" Python Black
    Plug 'a-vrma/black-nvim', { 'do': ':UpdateRemotePlugins' }

" Svelte
    Plug 'evanleck/vim-svelte', {'branch': 'main'}

" Solidity
    Plug 'tomlion/vim-solidity'

" Kubernetes
    Plug 'andrewstuart/vim-kubernetes'

" Terraform
    Plug 'hashivim/vim-terraform'

" Copilot
    Plug 'github/copilot.vim'
   
call plug#end()
