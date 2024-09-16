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
" "    -> Autocompletion with coc.nvim
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

" Restore global session variables
set sessionoptions+=globals

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

" Set filetype off initially
filetype off

" Initialize vim-plug
call plug#begin('~/.vim/plugged')

" install our plugins

" neovim plugin support
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" General
Plug '~/Code/sonokai'
Plug 'nvim-lualine/lualine.nvim'
Plug 'tpope/vim-repeat'
Plug 'svermeulen/vim-easyclip'
Plug 'honza/vim-snippets'

" Tabs / panes / buffers
Plug 'scrooloose/nerdtree'
Plug 'moll/vim-bbye'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

" Formatting / Linting
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-trailing-whitespace'
Plug 'tomtom/tcomment_vim'
Plug 'editorconfig/editorconfig-vim'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jxnblk/vim-mdx-js'
Plug 'epilande/vim-es2015-snippets'
Plug 'green-arrow/vim-react-snippets'

" Typescript
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Svelte
Plug 'leafOfTree/vim-svelte-plugin'

" GraphQL
Plug 'jparise/vim-graphql'

" Elixir
Plug 'elixir-lang/vim-elixir'

" Python
Plug 'vim-python/python-syntax'
Plug 'Vimjas/vim-python-pep8-indent'

" Icons for vim
Plug 'kyazdani42/nvim-web-devicons'

" Autocomplete / Intelligent Assistance
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'github/copilot.vim'

" Initialize plugins
call plug#end()

" Enable filetype plugins
filetype plugin on
filetype indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

" Use a dark background and colorscheme
" set background=dark
" let g:nord_italic = 1
" let g:nord_italic_comments = 1
set termguicolors
let g:sonokai_style = 'nord'
let g:sonokai_better_performance = 1
colorscheme sonokai
let g:embark_terminal_italics = 1

" Disable the background, so the terminal background shows through
" hi Normal guibg=NONE ctermbg=NONE
" hi SignColumn guibg=NONE ctermbg=NONE
" hi LineNr guibg=NONE ctermbg=NONE
" hi VertSplit guibg=NONE ctermbg=NONE
" let g:gitgutter_override_sign_column_highlight = 0

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

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set cindent "Like smartindent, but stricter"
set wrap "Wrap lines

" Automatically remove leading / traling whitespace on write
autocmd BufWritePre * FixWhitespace

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Lualine configuration
lua << END
require('lualine_config')
END

" Open git diffs in new tab
function! GdiffInTab()
  tabedit %
  Gvdiff
endfunction
command! GdiffInTab tabedit %|Gvdiff

" EasyClip settings
set clipboard^=unnamed,unnamedplus
let g:EasyClipAutoFormat = 1
nmap <Leader>cf <plug>EasyClipToggleFormattedPaste

" Javascript / JSX
let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 0

au BufReadPost *.tsx set ft=typescript.tsx
au BufReadPost *.ejs set ft=html

" Python
let g:python_highlight_all = 1

" Svelte
let g:vim_svelte_plugin_load_full_syntax = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocompletion with coc.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-eslint', 'coc-git', 'coc-jedi', 'coc-elixir']

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Close the preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Github Copilot
let g:copilot_no_tab_map = v:true
nmap <leader>cp :Copilot panel<CR>
imap <silent> <C-j> <Plug>(copilot-next)
imap <silent> <C-k> <Plug>(copilot-previous)
imap <silent> <C-\> <Plug>(copilot-dismiss)
imap <silent> <C-s> <Plug>(copilot-suggest)
imap <silent><script><expr> <C-f> copilot#Accept("\<CR>")

" LanguageServer config for Flow
" Source: https://flow.org/en/docs/editors/vim/#toc-coc-nvim-neovim
" autocmd FileType javascript.jsx let b:coc_root_patterns = ['.git', '.env', '.flowconfig']
" let s:LSP_CONFIG = {
"       \  'flow': {
"         \    'command': "${workspaceFolder}/node_modules/.bin/flow",
"         \    'args': ['lsp'],
"         \    'filetypes': ['javascript', 'javascriptreact', 'javascript.jsx'],
"         \    'initializationOptions': {},
"         \    'requireRootPattern': 1,
"         \    'settings': {},
"         \    'rootPatterns': ['.flowconfig']
"       \  }
"       \}

" let s:languageservers = {}
" for [lsp, config] in items(s:LSP_CONFIG)
"   let s:not_empty_cmd = !empty(get(config, 'command'))
"   if s:not_empty_cmd | let s:languageservers[lsp] = config | endif
" endfor
"
" if !empty(s:languageservers)
"   call coc#config('languageserver', s:languageservers)
" endif

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
:nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Map double leader to FZF file search
nnoremap ; :Buffers<CR>
nnoremap <leader>t :Files<CR>
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
  let g:ackprg='rg --hidden --vimgrep'
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

" set regexpengine=1
" let g:coc_force_debug=1

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Auto-reload .vimrc when it's updated
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup reload_vimrc " {
  autocmd!
  autocmd BufWritePost ~/.config/nvim/init.vim nested source ~/.config/nvim/init.vim
augroup END " }
