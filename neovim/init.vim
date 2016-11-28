""""""""""""""""""""""""""""""""""""""""""""""""
"  _____  _____ _   _  ___________  ___   _
" |  __ \|  ___| \ | ||  ___| ___ \/ _ \ | |
" | |  \/| |__ |  \| || |__ | |_/ / /_\ \| |
" | | __ |  __|| . ` ||  __||    /|  _  || |
" | |_\ \| |___| |\  || |___| |\ \| | | || |____
"  \____/\____/\_| \_/\____/\_| \_\_| |_/\_____/
""""""""""""""""""""""""""""""""""""""""""""""""

" Make sure neovim uses bash
set shell=/bin/bash

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

" Fast saving
nnoremap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

" Turn off auto comment insertion for vim files
au FileType vim setlocal fo-=c fo-=r fo-=o

""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files / Backups / Tabs / Indentation / Panes
""""""""""""""""""""""""""""""""""""""""""""""""""

" Set utf8 as standard encoding and en_US as the standard language
if !has('nvim')
  set encoding=utf8
endif

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Make new panes open to the right and below by default,
" instead of the "normal" default of left and above
set splitright
set splitbelow

"""""""""""""""""""""""
" => Custom Mappings
"""""""""""""""""""""""

" Make jk == esc
:inoremap jk <esc>
:inoremap <esc> <nop>

" Remap VIM 0 to first non-blank character
noremap 0 ^

" Easy way to open vimrc
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Make e / b prefixed by leader go next / previous panes
:nnoremap <Leader>f :bnext<CR>
:nnoremap <Leader>b :bprevious<CR>

" Copy / Paste to system clipboard
vnoremap <Leader>y "+y
vnoremap <Leader>d "+d
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P
vnoremap <Leader>p "+p
vnoremap <Leader>P "+P

""""""""""""""""""""""""""""""""""""
"  _   _ ________  ___  _   _ _____
" | | | |_   _|  \/  | | | | |_   _|
" | | | | | | | .  . | | | | | | |
" | | | | | | | |\/| | | | | | | |
" \ \_/ /_| |_| |  | | | |_| |_| |_
"  \___/ \___/\_|  |_/  \___/ \___/
""""""""""""""""""""""""""""""""""""

" Ignore compiled files
set wildignore=*.o,*~,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

"Always show current position
set ruler

" A buffer becomes hidden when it is abandoned
set hid

" Allow wrapping to next line with arrow / h / l
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Disable highlight when <leader><cr> is pressed
noremap <silent> <leader><cr> :noh<cr>

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" Show line relative line numbers and the absolute current line number
set number
set relativenumber

" Show trailing whitespace
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

""""""""""""""""""""""""""""""""""""""""""""""
" ______ _     _   _ _____ _____ _   _  _____
" | ___ \ |   | | | |  __ \_   _| \ | |/  ___|
" | |_/ / |   | | | | |  \/ | | |  \| |\ `--.
" |  __/| |   | | | | | __  | | | . ` | `--. \
" | |   | |___| |_| | |_\ \_| |_| |\  |/\__/ /
" \_|   \_____/\___/ \____/\___/\_| \_/\____/
""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.config/nvim/plugged')

" ********** Themes / Colors / Icons **********
Plug 'cocopon/iceberg.vim'
Plug 'ryanoasis/vim-devicons'

" ********** File Browsing / Buffer Management **********
Plug 'scrooloose/nerdtree'
Plug 'moll/vim-bbye'
Plug 'jlanzarotta/bufexplorer'

" ********** General Buffer Formatting **********
Plug 'editorconfig/editorconfig-vim'
Plug 'Yggdroot/indentLine'
Plug 'machakann/vim-highlightedyank'
Plug 'derekprior/vim-trimmer'

" ********** Status Line **********
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ********** Git Integration **********
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/committia.vim'

" ********** Linting / Syntax Validation **********
Plug 'neomake/neomake'

" ********** Autocomplete / Snippets **********
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Vim autocomplete
Plug 'Shougo/neco-vim'

" Javascript Autocomplete
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

" Javascript Snippets
Plug 'epilande/vim-es2015-snippets'
Plug 'green-arrow/vim-react-snippets'

" ********** Search / Fuzzy Finder **********
Plug 'cloudhead/neovim-fuzzy'
Plug 'mhinz/vim-grepper'

" ********** Language Support **********

" HTML / XML / JSX
Plug 'Valloric/MatchTagAlways'
Plug 'alvan/vim-closetag'

" Javascript / Node
Plug 'jaawerth/nrun.vim'
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'

" Add plugins to &runtimepath
call plug#end()

"""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""

nnoremap <leader>t :NERDTreeToggle<CR>

"""""""""""""""""""""""
" => vim-bbye
"""""""""""""""""""""""

nnoremap <leader>q :Bdelete<CR>

"""""""""""""""""""""""
" => editorconfig
"""""""""""""""""""""""

let g:EditorConfig_exclude_patterns = ['fugitive://.*']

"""""""""""""""""""""""
" => indentLine
"""""""""""""""""""""""

let g:indentLine_enabled = 0
let g:indentLine_char = '┆'

" Turning this on results in very poor scroll performance
let g:indentLine_leadingSpaceEnabled = 0

"""""""""""""""""""""""
" => vim-airline
"""""""""""""""""""""""

set laststatus=2
let g:airline_theme = 'lucius'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"""""""""""""""""""""""
" => Linting / Syntax
"""""""""""""""""""""""

let g:neomake_verbose = 3
let g:neomake_javascript_enabled_makers = ['eslint']

" Automatically run Neomake when switching to a buffer or writing
autocmd BufWritePost,BufEnter * Neomake

" Key mappings
nmap <leader><leader>o :lopen<CR>
nmap <leader><leader>c :lclose<CR>
nmap <leader><leader>, :ll<CR>
nmap <leader><leader>n :lnext<CR>
nmap <leader><leader>p :lprev<CR>

"""""""""""""""""""""""
" => Autocomplete
"""""""""""""""""""""""

" Set options for vim completion
set completeopt=longest,menuone,preview

" Enable deoplete
let g:deoplete#enable_at_startup = 1

" Configure OmniFuncs
let g:deoplete#omni#functions = {}

" Configure Javascript autocomplete
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

" Configure deoplete sources
let g:deoplete#sources = {}

" Configure Javascript sources
let g:deoplete#sources['javascript'] = ['file', 'ultisnips', 'ternjs']
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']

" Key bindings for navigating / closing autocomplete
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  :pclose
  return pumvisible() ? deoplete#close_popup() : "\<CR>"
endfunction

" ********** UltiSnips **********
let g:UltiSnipsExpandTrigger="<C-j>"

" ********** tern_for_vim **********
"let g:tern#command = ['~/.config/nvim/plugged/tern_for_vim/node_modules/.bin/tern']
"let g:tern#arguments = ['--persistent']

"""""""""""""""""""""""
" => Search / Fuzzy Finder
"""""""""""""""""""""""

" ********** neovim-fuzzy **********
nnoremap <leader><leader> :FuzzyOpen<CR>

" ********** vim-grepper **********
let g:grepper = {
      \ 'tools': ['rg', 'ag', 'git', 'grep'],
      \ 'open': 1,
      \ 'jump': 0,
      \ }

" Custom search commands
command! -nargs=* FindAll Grepper -noprompt -tool rg -grepprg rg --vimgrep --type-add 'elixir:*.{ex,exs}' <args>

" vim-grepper mappings
nnoremap <leader>* :Grepper -tool rg -cword -noprompt --type-add 'elixir:*.{ex,exs}'<cr>
nnoremap \ :FindAll<Space>

" vim-grepper operator setup
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)

"""""""""""""""""""""""
" => Language Support
"""""""""""""""""""""""

" ********** javascript-libraries-syntax **********

let g:used_javascript_libs = 'jquery,underscore,backbone,react,handlebars'

" ********** vim-javascript **********
let g:javascript_plugin_jsdoc=1
let g:javascript_plugin_flow=1
let g:jsx_ext_required=0

" ********** MatchTagAlways **********

let g:mta_filetypes = {
      \ 'html': 1,
      \ 'xhtml': 1,
      \ 'xml': 1,
      \ 'javascript.jsx': 1
      \ }

" ********** vim-closetag **********

let g:closetag_filenames = "*.html,*.xhtml,*.js,*.jsx"

""""""""""""""""""""""""""""""""""""
"  _____ _   _  ________  ___ _____
" |_   _| | | ||  ___|  \/  ||  ___|
"   | | | |_| || |__ | .  . || |__
"   | | |  _  ||  __|| |\/| ||  __|
"   | | | | | || |___| |  | || |___
"   \_/ \_| |_/\____/\_|  |_/\____/
""""""""""""""""""""""""""""""""""""

" Enable full color support
if (has("termguicolors"))
  set termguicolors
endif

" Background / Theme
set background=dark
colorscheme iceberg

" Use a patched font
set guifont=SauceCodePro\ Nerd\ Font:h16

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Auto-reload $MYVIMRC when it's updated
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END " }
