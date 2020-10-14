""" Basic
set nocompatible
set mouse=a
set clipboard+=unnamed
set noeb
set novb
set t_vb=
set shell=/bin/zsh
set confirm
set nowrap
set bsdir=buffer
set history=1000
set hid
set enc=utf-8
set fenc=utf-8
set fencs=utf-8
set laststatus=2
set statusline=\ %F\ %Y\ %{&fileformat}\ %{&fileencoding}\ %{(&bomb?\"[BOM]\":\"\")}\ Row\ \[%l/%L\ %<%P]\ Col\ \[%c%V]\ \ %m\ %r
set wildmenu
set showcmd
set nosmd
set magic
set shortmess=atI
set scrolloff=5
set cc=120
set nu
set cul
set ambiwidth=double
set smartcase
set showmatch
set noswapfile
set mat=2
set hls
set incsearch
set expandtab
set autoindent " same level indent
set cindent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set foldmethod=manual   " fold manually only
set nofoldenable        " dont fold by default
set iskeyword+=_,@,%,#
set linebreak
set display=lastline
set wildignore+=*.swp,*\\.git\\*,*\\.hg\\*,*\\.svn\\*,*/.git/*,*/.hg/*,*/.svn/*
set formatoptions+=mM
set backspace=indent,eol,start
set pumheight=15
set completeopt=menuone
set complete-=k complete+=k
set complete-=i   " disable scanning included files
set complete-=t   " disable searching tags
set tags+=tags;
filetype plugin on

""" Plug
call plug#begin('~/.vim/plugged')
" for lsp
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'ajh17/VimCompletesMe'

" language specific
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'rust-lang/rust.vim'
Plug 'leafgarland/typescript-vim'

" utils & theme
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'tpope/vim-sleuth'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --update-rc' }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
Plug 'valloric/MatchTagAlways'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'ap/vim-buftabline'
Plug 'qpkorr/vim-bufkill'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] }
Plug 'romainl/flattened'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'janko/vim-test'
Plug 'djoshea/vim-autoread'
call plug#end()

""" basic
nn <leader>rr :source $MYVIMRC<CR>
nn <leader>tt  :TestNearest<CR>
nn <leader>TT  :TestFile<CR>
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

""" vim-lsp
let g:asyncomplete_auto_popup = 0
let g:lsp_diagnostics_enabled = 1
let g:lsp_signs_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_fold_enabled = 0
let g:lsp_highlight_references_enabled = 0
let g:lsp_documentation_float = 0

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=number
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> <leader>h <plug>(lsp-hover)
endfunction
augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" terminal emulation
nn <silent> <leader>sh :terminal<CR>

""" theme
set guioptions-=r
set guioptions-=L
set linespace=3
set t_Co=256
set guifont=JetBrains\ Mono:h14
set background=dark
if has('gui_running')
 silent! colorscheme dracula
else
 silent! colorscheme flattened_dark
endif
syntax on

set foldcolumn=0
if has('gui_running')
  hi LineNr guibg=NONE
  if (has("termguicolors"))
    set termguicolors
  endif
endif
hi foldcolumn guibg=bg
hi VertSplit guibg=bg guifg=bg

""" test
let test#strategy = 'vimterminal'

""" FZF search
" search in case insensitive
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" search in case sensitive
command! -bang -nargs=* RG
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always -s -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" search the word as keyword under current cursor
command! -bang -nargs=* RW
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always -s -- '.expand('<cword>'), 1,
  \   fzf#vim#with_preview(), <bang>0)

nn <leader>sw :RW<CR>
nn <leader>W :Buffers<CR>
nn <leader>F :FZF<CR>

""" Prettier
nmap <leader>fmt <Plug>(Prettier)
let g:prettier#autoformat_require_pragma = 1
let g:prettier#autoformat_config_present = 1

""" sneak
let g:sneak#label = 1

""" vim-startify
au User Startified nmap <buffer> o <plug>(startify-open-buffers)

let g:startify_custom_header = []
let g:startify_session_persistence = 1
let g:www_folders=split(globpath($HOME.'/www', '*/'), '\n')
let g:startify_bookmarks = [ 
      \ $HOME.'/.vim/vimrc', 
      \ $HOME.'/www',
      \ ] + www_folders

let g:startify_lists = [
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] },
      \ { 'type': 'files',     'header': ['   MRU']       },
      \ { 'type': 'sessions',  'header': ['   Sessions']  },
      \ ]

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
nn <leader>cd :cd %:p:h<CR>:pwd<CR>

""" vim-go
let g:go_fmt_command = "goimports"

""" rust
let g:rustfmt_autosave = 1

""" vim-buftabline
set hidden
nn <C-n> :bnext<CR>
nn <C-p> :bprev<CR>

""" lightline
set noshowmode
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
