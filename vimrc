""" Basic
set nocompatible
set mouse=a
set clipboard+=unnamed
set noeb
set novb
set t_vb=
" set shell=/bin/zsh
set confirm
set nowrap
set bsdir=buffer
set history=1000
set hid
set enc=utf-8
set fenc=utf-8
set fencs=utf-8
" set laststatus=2
" set statusline=\ %F\ %Y\ %{&fileformat}\ %{&fileencoding}\ %{(&bomb?\"[BOM]\":\"\")}\ Row\ \[%l/%L\ %<%P]\ Col\ \[%c%V]\ \ %m\ %r
set wildmenu
set showcmd
set nosmd
set magic
set shortmess=atI
set scrolloff=5
set cc=120
set number
set cul
" set ambiwidth=double
set smartcase
set showmatch
set mat=2
set hls
set incsearch
" set expandtab
" set autoindent " same level indent
" set cindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set foldmethod=manual   " fold manually only
set nofoldenable        " dont fold by default
" set iskeyword+=_,@,%,#
set linebreak
set display=lastline
" set wildignore+=*.swp,*\\.git\\*,*\\.hg\\*,*\\.svn\\*,*/.git/*,*/.hg/*,*/.svn/*
set formatoptions+=mM
set backspace=indent,eol,start
" set pumheight=15
" set completeopt=menuone
" set complete-=k complete+=k
" set complete-=i   " disable scanning included files
" set complete-=t   " disable searching tags
" set tags+=tags;

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
set noswapfile

" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set nolazyredraw
set encoding=UTF-8

set splitright
set splitbelow

set signcolumn=number

filetype plugin on

""" Plug
call plug#begin('~/.vim/plugged')
" coc-nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

""" utils
Plug 'tpope/vim-sleuth'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

if has('nvim')
  Plug 'kyazdani42/nvim-web-devicons' " for file icons
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'akinsho/bufferline.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'akinsho/git-conflict.nvim'
else
  Plug 'preservim/nerdtree'
  Plug 'itchyny/lightline.vim'
  Plug 'ap/vim-buftabline'
endif

Plug 'mhinz/vim-startify'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'djoshea/vim-autoread'
Plug 'voldikss/vim-floaterm'
Plug 'jparise/vim-graphql'

Plug 'qpkorr/vim-bufkill'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'


""" theme
Plug 'dracula/vim', { 'as': 'dracula' }

""" git related
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'zivyangll/git-blame.vim'
Plug 'junegunn/gv.vim'
Plug 'ruanyl/vim-gh-line'

call plug#end()

" select the block of code
nn <leader>B ^vg_%

" remap the command line mode arrow keys
cnoremap <c-k> <up>
cnoremap <c-j> <down>
cnoremap <c-h> <left>
cnoremap <c-l> <right>

inoremap <c-k> <up>
inoremap <c-j> <down>
inoremap <c-h> <left>
inoremap <c-l> <right>

" keep selection
xnoremap < <gv
xnoremap > >gv

" no tags
let g:gutentags_enabled = 0

" terminal emulation
" nn <silent> <leader>sh :terminal<CR>
let g:floaterm_keymap_toggle = '<leader>sh'
let g:floaterm_wintype = 'split'
let g:floaterm_height = 0.4

" delete current buffer
nn <leader>ww :bdelete<CR>

""" theme
set guioptions-=r
set guioptions-=L
set linespace=3
set t_Co=256
" set guifont=JetBrains\ Mono\ NL:h14
set guifont=Hack\ Nerd\ Font\ Mono:h14
set background=dark
colorscheme dracula
syntax on

set foldcolumn=0

if (has("termguicolors"))
  set termguicolors
endif

if has('gui_running')
  hi LineNr guibg=NONE
  if (has("termguicolors"))
    set termguicolors
  endif
endif
hi foldcolumn guibg=bg
hi VertSplit guibg=bg guifg=bg

""" FZF search
let g:fzf_layout={'window': {'width': 0.95, 'height': 0.6}}
" search in case insensitive
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --hidden --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" search in case sensitive
command! -bang -nargs=* RG
  \ call fzf#vim#grep(
  \   'rg --column --hidden --line-number --no-heading --color=always -s -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" search the word as keyword under current cursor
command! -bang -nargs=* RW
  \ call fzf#vim#grep(
  \   'rg --column --hidden --line-number --no-heading --color=always -s -- '.expand('<cword>'), 1,
  \   fzf#vim#with_preview(), <bang>0)

nn <leader>sw :RW<CR>
nn <leader>sb :Buffers<CR>
nn <leader>F :Files<CR>


""" sneak
let g:sneak#label = 1

""" vim-startify
au User Startified nmap <buffer> o <plug>(startify-open-buffers)

let g:startify_custom_header = []
let g:startify_session_persistence = 1
let g:www_folders=split(globpath($HOME.'/www', '*/'), '\n')
let g:startify_bookmarks = [
      \ $HOME.'/.vim/vimrc',
      \ $HOME.'/.config/nvim/init.vim',
      \ $HOME.'/www',
      \ ] + www_folders

let g:startify_lists = [
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] },
      \ { 'type': 'files',     'header': ['   MRU']       },
      \ { 'type': 'sessions',  'header': ['   Sessions']  },
      \ ]

if has('nvim')
  """ nvim-tree.lua
  nn <leader>wh :NvimTreeToggle<CR>
  nn <leader>ff :NvimTreeFindFileToggle<CR>
else
  """ NERDTree
  let g:NERDTreeMinimalUI = 1
  let g:NERDTreeChDirMode = 2
  let g:NERDTreeWinSize=40
  let g:NERDTreeIgnore = ['\~$', '\.pyc$', '\.DS_Store']
  let g:NERDTreeHijackNetrw = 1
  let g:NERDTreeCascadeSingleChildDir = 0
  let g:NERDTreeCascadeOpenSingleChildDir = 0
  let g:NERDTreeDirArrowExpandable = '+'
  let g:NERDTreeDirArrowCollapsible = '-'
  let g:NERDTreeAutoDeleteBuffer = 1
  nn <leader>wh :NERDTreeToggle<CR>
  nn <leader>ff :NERDTreeFind<CR>
endif


""" vim-buftabline
set hidden
nn <C-n> :bnext<CR>
nn <C-p> :bprev<CR>

""" lightline
set noshowmode
if !has('nvim')
  let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'active': {
          \   'left': [ [ 'mode', 'paste' ],
          \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
          \ },
          \ 'component_function': {
            \   'gitbranch': 'FugitiveHead'
            \ },
            \ }
endif

""" git blame
nnoremap <Leader>bb :<C-u>call gitblame#echo()<CR>

""" open github page
let g:gh_line_map_default = 0
let g:gh_line_blame_map_default = 0
let g:gh_line_map = '<leader>gith'

""" coc-nvim
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>dd :CocDiagnostics<CR>
nmap <leader>rn <Plug>(coc-rename)
nnoremap <leader>fmt :call CocAction('format')<CR>

" Use K to show documentation in preview window.
nnoremap <silent> <leader>h :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


""" coc-jest
" Run jest for current project
command! -nargs=0 Jest :call  CocAction('runCommand', 'jest.projectTest')
" Run jest for current file
command! -nargs=0 JestFile :call  CocAction('runCommand', 'jest.fileTest', ['%'])
" Run jest for current test
nnoremap <leader>tt :call CocAction('runCommand', 'jest.singleTest')<CR>

" Init jest in current cwd, require global jest command exists
command! JestInit :call CocAction('runCommand', 'jest.init')
