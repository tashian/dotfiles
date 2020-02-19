" ---- PLUGINS -----------------------------------------------------------------
set nocompatible " choose no compatibility with legacy vi
filetype off     " required for vim-plug!

" vim-plug minimalist plugin manager
" use :PlugUpdate to update/install all plugs
" use :PlugUpgrade to upgrade vim-plug
" see https://github.com/junegunn/vim-plug for more

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'mileszs/ack.vim'
" Plug 'ambv/black' " Python formatter https://github.com/ambv/black

Plug 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1

" post install (yarn install | npm install) then load plugin only for editing
" supported files
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" Markdown support
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
" Sane Ignore For ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|dist\|node_modules\|data\|log\|tmp$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_max_files=32768
if executable('rg')
    set grepprg=rg\ --color=never
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 0
endif


Plug 'airblade/vim-gitgutter'

" All of your Plugins must be added above the following lines
call plug#end()
filetype plugin indent on

" ---- COLORS ------------------------------------------------------------------
" Highlight everything after column 80
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27
highlight LineNr ctermfg=grey

"" Show Invisibles
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Invisible character colors
highlight NonText guifg=#4a4a59
" highlight SpecialKey guifg=#4a4

" ---- BEHAVIOR ----------------------------------------------------------------
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands

set visualbell t_vb=                    " Silence bells
set nostartofline                       " When paging, don't go to the start of the line
set laststatus=2                        " show status line all the time
set scrolloff=5                         " don't scroll any closer to top/bottom
set backspace=2                         " Set for maximum backspace smartness
set nu

"" Whitespace
set tabstop=4 shiftwidth=4      " a tab is 4 spaces (Python)
set expandtab                   " use spaces, not tabs (optional)
set smarttab                    " fix <BS> key
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
"set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Dealing with unsaved buffers
set hidden                      " Allow unsaved buffers
set confirm                     " Confirm all unsaved buffers on exit

set foldlevel=99

set wildignore+=*/.git/*,*/tmp/*,*.swp

" ---- KEY BINDINGS ------------------------------------------------------------
" Set <leader> key to ,
let mapleader = ","
nmap <leader>t :CtrlP<CR>

nmap <tab><tab> :tabnext<CR>
nmap <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>
nmap <Tab>p :tabprevious<CR>
nmap <Tab>h :tabprevious<CR>
nmap <Tab>l :tabnext<CR>
nmap <Tab><Space> :tabnext<CR>
nmap <C-space> :tabnext<CR>

imap jj <Esc>

map vv :vsplit<CR>
map ss :split<CR>

" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

" Easy movement btwn buffers
nmap <silent> <leader>. :bnext<CR>             " Next buffer
nmap <silent> <leader>m :bprev<CR>             " Previous buffer

" ---- FILETYPES ---------------------------------------------------------------
au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79 " PEP-8 Friendly

" Turn on spellcheck for certain files
" see: https://thoughtbot.com/blog/vim-spell-checking
autocmd BufRead,BufNewFile *.md setlocal spell

