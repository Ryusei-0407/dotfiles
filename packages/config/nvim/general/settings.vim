" Markdown
let g:preview_markdown_vertical = 1
let g:preview_markdown_auto_update = 1
" Winresizer
let g:winresizer_start_key = '<C-S>'

" Fern
nnoremap <C-e> :Fern . -reveal=% -drawer -toggle -width=30<CR>
let g:fern#renderer = 'nerdfont'
autocmd! *
autocmd FileType fern call glyph_palette#apply()
autocmd FileType nerdtree,startify call glyph_palette#apply()
let g:fern#default_hidden = 1

" Terminal
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
nnoremap <C-t> :FloatermNew tig status<CR>

" Snippet
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsEditSplit = 'normal'
let g:UltiSnipsSnippetDirectories  = ['$HOME/.config/nvim/snips']
let g:UltiSnipsEnableSnipMate = 0
let g:UltiSnipsExpandTrigger = "<>"
let g:UltiSnipsJumpForwardTrigger = "<>"
let g:UltiSnipsJumpBackwardTrigger = "<>"
command! SNIP UltiSnipsEdit

" Multiple cursor
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" Rust format
let g:rustfmt_autosave = 1

" Python format
let g:python3_host_prog = '/opt/homebrew/bin/python3'

" Svelte
let g:svelte_indent_script = 0
let g:svelte_indent_style = 0

" JK
lua << EOF
    vim.api.nvim_set_keymap('n', 'j', '<Plug>(faster_move_j)', {noremap=false, silent=true})
    vim.api.nvim_set_keymap('n', 'k', '<Plug>(faster_move_k)', {noremap=false, silent=true})
EOF

let g:mapleader = ","

syntax enable                           " Enables syntax highlighing
filetype plugin indent on
colorscheme dogrun

set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			        " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=4                           " Insert 4 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=4                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" You can't stop me
cmap w!! w !sudo tee %
