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
set smartindent " next level indent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set foldmethod=indent   " fold based on indent
set foldnestmax=3       " deepest fold is 3 levels
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

""" Plug
call plug#begin('~/.vim/plugged')
" auto complete
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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'altercation/vim-colors-solarized'
Plug 'fholgado/minibufexpl.vim'
Plug 'alvan/vim-acomment'
call plug#end()

""" vim-lsp
let g:asyncomplete_auto_popup = 0
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    nmap <buffer> gd <plug>(lsp-definition)
    " refer to doc to add more commands
endfunction
augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

""" theme
syntax enable
set guioptions-=LT
set linespace=3
set t_Co=256
set guifont=Monaco:h13
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
let g:lightline = { 'colorscheme': 'wombat'}

""" startify
au User Startified nmap <buffer> o <plug>(startify-open-buffers)
let g:startify_custom_header = []
let g:startify_bookmarks = [ 
            \ $HOME.'/.vim/vimrc', 
            \ $HOME.'/www',
            \ ]

""" NERDTree
let g:NERDTreeMinimalUI = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeIgnore = ['\~$', '\.pyc$', '\.DS_Store']
let g:NERDTreeHijackNetrw = 0
let g:NERDTreeCascadeSingleChildDir = 0
let g:NERDTreeCascadeOpenSingleChildDir = 0
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
nn <leader>ww :ToggleBufExplorer<CR>
nn <leader>wf :NERDTreeFind<CR>
nn <leader>wh :NERDTreeToggle<CR>
nn <leader>wl :TagbarToggle<CR>
nn <leader>wm :TagbarToggle<CR>:NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""" rust
let g:rustfmt_autosave = 1

""" go
let g:go_fmt_command = "goimports"

""" fzf
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
set grepprg=rg\ --vimgrep
nnoremap <C-p> :FZF<CR>

""" startify
let g:startify_lists = [
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
    \ { 'type': 'files',     'header': ['   MRU']            },
    \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    \ { 'type': 'commands',  'header': ['   Commands']       },
    \ ]

