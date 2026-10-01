set nocompatible
filetype off

" ==============================
" Plugins
" ==============================

packadd lsp

call LspOptionsSet(#{
                  \  showDiagWithVirtualText: v:true,
                  \  })

" Clangd language server
call LspAddServer([#{
	                \    name: 'clangd',
                	\    filetype: ['c', 'cpp'],
                	\    path: '/usr/bin/clangd',
                	\    args: ['--background-index']
                	\  }])


call LspAddServer([#{name: 'tsserver',
                 \   filetype: ['javascript', 'typescript', 'javascriptreact'],
                 \   path: '/usr/local/bin/typescript-language-server',
                 \   args: ['--stdio']
                 \ }])

" Tab and Shift-Tab for choosing next and previous options in popups 
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Highlight yank settings
let g:highlightedyank_highlight_duration = 100

" Airline - Top and bottom bar
let g:airline_powerline_fonts = 0 " Disables Nerd Fonts
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'deus'

" ==============================
" General
" ==============================

set number
set relativenumber
set clipboard=unnamedplus
set scrolloff=14 
set wrap " Lines will wrap when too long to fit in the terminal
set linebreak " Extra setting to do with wrapping characters .. not exactly sure what it does 
" set mouse=a " Enables mouse
set ttyfast " Makes rendering faster - Should be on by default
set laststatus=2 " Enables status bar 


" ==============================
" Indentation
" ==============================

set expandtab " Convert tabs to spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smartindent

" ==============================
" Search
" ==============================

set ignorecase
set smartcase
set incsearch
set hlsearch
set wildmenu " Tab search options and autocompletion 

" ==============================
" Appearance
" ==============================

set signcolumn=yes "Column on the left side of the terminal

" Mapping cursor escape sequences for insert and normal mode
let &t_SI = "\<Esc>[6 q" 
let &t_EI = "\<Esc>[2 q"

" Setting timeout to 0, so cursor changes are instant
set ttimeout
set ttimeoutlen=0

set t_Co=256
syntax on

colorscheme torte

" Yank highlight color matching to chosen colorscheme
highlight HighlightedyankRegion cterm=reverse gui=reverse

" Search highlighting
highlight Search    ctermfg=gray ctermbg=256
highlight CurSearch ctermfg=black ctermbg=cyan
highlight IncSearch ctermfg=black ctermbg=cyan

" Hides buffers that are not opened
set hidden

" ==============================
" Key mappings
" ==============================

let mapleader = " "

" Nordic keymaps
nnoremap ö %
nnoremap Ä 0
nnoremap ä $
nnoremap å /
nnoremap Å ?

inoremap ¤ $

" Helpers 
inoremap <C-e> {}<ESC>i
inoremap <C-q> ()<ESC>i
inoremap <C-d> []<ESC>i

nnoremap <CR> :nohlsearch<CR>

" Reload vim config
nnoremap <leader>rl :source ~/.vimrc<CR>

" Open vim config in new tab
nnoremap <leader>lc :tabnew ~/.vimrc<CR>
nnoremap <leader>c :e ~/.vimrc<CR>

" LSP mappings
nnoremap gd :tab LspGotoDefinition<CR>
nnoremap gD :tab LspGotoDeclaration<CR>
nnoremap <leader>qf :LspAutoFix<CR>
nnoremap H :LspHover<CR>

" Tabs
nnoremap <leader>o :tabedit 
nnoremap <C-j> gT
nnoremap <C-k> gt

" Netrw 
" - go up one directory
" % create a new file
" D delete a file
" R rename a file

nnoremap <leader>sf :Explore<CR>

