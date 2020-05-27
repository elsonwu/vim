""" Basic
set nocompatible
set mouse=a
set clipboard+=unnamed
set noeb
set novb
set vb t_vb=
set shell=/bin/zsh
set confirm
set nowrap
set bsdir=buffer
set history=1000
set hid
set enc=utf-8
set fenc=utf-8
set fencs=ucs-bom,utf-8,cp936,gb18030,gbk,gb2312
set laststatus=2
set statusline=\ %F\ %Y\ %{&fileformat}\ %{&fileencoding}\ %{(&bomb?\"[BOM]\":\"\")}\ Row\ \[%l/%L\ %<%P]\ Col\ \[%c%V]\ \ %m\ %r
" set cursorcolumn
set wildmenu
set showcmd
set nosmd
set shortmess=atI
set scrolloff=5
set cc=120
set nu!
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
" set smartindent " next level indent
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
set tags+=tags;
syntax on
filetype plugin on

""" Plug
call plug#begin('~/.vim/plugged')
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-gocode.vim'
Plug 'ajh17/VimCompletesMe'
Plug 'runoshun/tscompletejob'
Plug 'prabirshrestha/asyncomplete-tscompletejob.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'keremc/asyncomplete-racer.vim'
Plug 'preservim/nerdtree'
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'rust-lang/rust.vim'
Plug 'leafgarland/typescript-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'jiangmiao/auto-pairs'
Plug 'valloric/MatchTagAlways'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'ap/vim-buftabline'
Plug 'qpkorr/vim-bufkill'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
call plug#end()

""" vim-lsp
let g:asyncomplete_auto_popup = 0
let g:lsp_diagnostics_enabled = 1
" let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
" let g:lsp_highlight_references_enabled = 1

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=number
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> <leader>h <plug>(lsp-hover)
    " refer to doc to add more commands
endfunction
augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

""" Prettier
nmap <Leader>fmt <Plug>(Prettier)
let g:prettier#autoformat_require_pragma = 1

""" theme
set guioptions-=r
set guioptions-=L
set linespace=3
set t_Co=256
set guifont=Monaco:h14
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
set foldcolumn=0
if has('gui_running')
  hi LineNr guibg=
endif
hi foldcolumn guibg=bg
hi VertSplit guibg=bg guifg=bg

""" vim-startify
au User Startified nmap <buffer> o <plug>(startify-open-buffers)
let g:startify_custom_header = []
let g:startify_bookmarks = [ 
            \ $HOME.'/.vim/vimrc', 
            \ $HOME.'/www',
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
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""" vim-go
let g:go_fmt_command = "goimports"

""" rust
let g:rustfmt_autosave = 1

""" vim-buftabline
set hidden
nn <C-n> :bnext<CR>
nn <C-p> :bprev<CR>

""" fzf
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules/*" --glob "!dist/*" --color "always" '.shellescape(<q-args>).'| sort | tr -d "\017"', 1, <bang>0)
command! -bang -nargs=* Cfind call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules/*" --glob "!dist/*" --color "always" '.shellescape(<q-args>).'| sort | tr -d "\017"', 1, <bang>0)
set grepprg=rg\ --vimgrep

""" vim-startify
let g:startify_lists = [
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
    \ { 'type': 'files',     'header': ['   MRU']            },
    \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    \ { 'type': 'commands',  'header': ['   Commands']       },
    \ ]

""" itchyny/lightline.vim  """
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

" indent
autocmd Filetype php setlocal ts=4 sw=4 
autocmd Filetype html setlocal ts=2 sw=2
autocmd Filetype json setlocal ts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sw=2
autocmd Filetype typescript setlocal ts=2 sw=2

" remap to avoid mistake
command WQ wq
command Wq wq
command W w
command Q q
