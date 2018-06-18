"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
" "       Andrew Walton
" "
" " Sections:
" "    -> General
" "    -> VIM user interface
" "    -> Colors and Fonts
" "    -> Plugin management
" "    -> Files and backups
" "    -> Text, tab and indent related
" "    -> Plugin configuration
" "    -> Moving around, tabs and buffers
" "    -> Edit mappings
" "    -> vimgrep searching and cope displaying
" "    -> Spell checking
" "    -> Misc
" "    -> Helper functions
" "
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => General
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of history VIM has to remember
set history=500

" Make sure vim uses bash
set shell=/bin/bash

" Force vim into nocompatible mode
set nocompatible

" Set to auto read when a file is changed from the outside
set autoread

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Disable highlight when <leader><cr> is pressed
noremap <silent> <leader><cr> :noh<cr>

" Makes search act like search in modern browsers
set incsearch

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

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Plugin management (vundle)
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set filetype off initially, required by vundle
filetype off

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" install our plugins

" General
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-repeat'
Plugin 'svermeulen/vim-easyclip'

" Autocomplete
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-flow.vim'

" Tabs / panes / buffers
Plugin 'scrooloose/nerdtree'
Plugin 'moll/vim-bbye'

" Git integration
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" Search
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'

" Formatting / Linting
Plugin 'w0rp/ale'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'tomtom/tcomment_vim'

" Javascript
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Elixir
Plugin 'elixir-lang/vim-elixir'

" Icons for vim
Plugin 'ryanoasis/vim-devicons'

" let vundle know we're done with our plugins
call vundle#end()            " required

" Enable filetype plugins once vundle is done
filetype plugin on
filetype indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set colorscheme from flazz/vim-colorschemes
colorscheme blazer

" Enable syntax highlighting
syntax enable

" Use a dark background
set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Enable italics for Dank Mono font
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
hi htmlArg   cterm=italic
hi Comment   cterm=italic
hi Type      cterm=italic
hi Keyword   cterm=italic
hi Special   cterm=italic
hi Statement cterm=italic
hi Include   cterm=italic

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Make vim use FZF
set rtp+=/usr/local/opt/fzf

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

autocmd BufWritePre * FixWhitespace

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Make sure editorconfig plays nice with fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" Open git diffs in new tab
function! GdiffInTab()
  tabedit %
  Gvdiff
endfunction
command! GdiffInTab tabedit %|Gvdiff

" EasyClip settings
set clipboard=unnamed
let g:EasyClipAutoFormat = 1
nmap <Leader>cf <plug>EasyClipToggleFormattedPaste

" Ale configuration
let g:ale_fixers = {}
let g:ale_fixers['json'] = []
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['markdown'] = ['prettier']

let g:ale_pattern_options = {'workbox': {'ale_fixers': []}}

let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'

" Javascript / JSX
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

" Autocomplete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#flow#get_source_options({
    \ 'name': 'flow',
    \ 'whitelist': ['javascript', 'javascript.jsx'],
    \ 'completor': function('asyncomplete#sources#flow#completor'),
    \ 'config': {
    \    'prefer_local': 1,
    \    'flowbin_path': expand('~/bin/flow'),
    \    'show_typeinfo': 1,
    \  },
    \ }))"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

:nnoremap <Leader>f :bnext<CR>
:nnoremap <Leader>b :bprevious<CR>

" Open NERDTree when vim opens with a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Automatically close vim if the only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

:nnoremap <Leader>n :NERDTreeToggle<CR>

" Use vim-bbye to delete buffers so we can keep our layout
:nnoremap <Leader>q :Bdelete<CR>

" Make new panes open to the right and below, as opposed to
" the left and above
set splitright
set splitbelow

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Edit mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Make jk == esc
:inoremap jk <esc>
:inoremap <esc> <nop>

" Remap VIM 0 to first non-blank character
noremap 0 ^

" Easy way to open vimrc
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Map double leader to FZF file search
nnoremap ; :Buffers<CR>
nnoremap <leader>t :Files<CR>
nnoremap <leader>r :Tags<CR>
nnoremap <leader>a :Ack! <cword><CR>
nnoremap <leader>/ :Ack! ""<Left>

if executable('rg')
  " --files: List files that would be searched but do not search
  " --hidden: Search hidden files and folders
  " --follow: Follow symlinks
  " --glob: Additional conditions for search (ignore everything in the '.git' directory)
  let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

  " Use rg over grep
  set grepprg=rg\ --vimgrep
  set shellpipe=>

  " Make ack.vim use rg
  let g:ackprg='rg --vimgrep'
elseif executable('ag')
  " Configure FZF to get its input from Ag (silver searcher)
  " By default, this excludes things located in .gitignore
  let $FZF_DEFAULT_COMMAND= 'ag -g ""'

  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  set shellpipe=>

  " Make ack.vim use Ag
  let g:ackprg='ag --vimgrep'
endif

set regexpengine=1

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Auto-reload .vimrc when it's updated
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END " }
