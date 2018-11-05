set nocompatible
filetype off

" set the runtime path to include Vundle
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"    " let Vundle manage Vundle, required
"    "Plugin 'VundleVim/Vundle.vim'
"	"Plugin 'gmarik/Vundle.vim'
"	"Plugin 'jlanzarotta/bufexplorer'
"
"call vundle#end()
"filetype plugin indent on
" Vundle End


" Include tibero vimrc 
let g:unuse_tb_compile=1
let unuse_tb_compile=1
if filereadable($TB_HOME . "/dev-util/vimrc")
    so $TB_HOME/dev-util/vimrc
elseif filereadable($TL_HOME . "/dev-util/vimrc")
    so $TL_HOME/dev-util/vimrc
endif

if filereadable($TB_HOME . "/dev-util/vimrc.db1team")
    so $TB_HOME/dev-util/vimrc.db1team
elseif filereadable($TL_HOME . "/dev-util/vimrc.db1team")
    so $TL_HOME/dev-util/vimrc.db1team
endif

if filereadable($TB_HOME . "/dev-util/vimrc.mmdb")
    so $TB_HOME/dev-util/vimrc.mmdb
elseif filereadable($TL_HOME . "/dev-util/vimrc.mmdb")
    so $TL_HOME/dev-util/vimrc.mmdb
endif

if filereadable($TB_HOME . "/dev-util/vim_lib/searchfold.vim")
    so $TB_HOME/dev-util/vim_lib/searchfold.vim
elseif filereadable($TL_HOME . "/dev-util/vim_lib/searchfold.vim")
    so $TL_HOME/dev-util/vim_lib/searchfold.vim
endif

if filereadable($TB_HOME . "/dev-util/vim_lib/svnblame.vim")
    so $TB_HOME/dev-util/vim_lib/svnblame.vim
elseif filereadable($TL_HOME . "/dev-util/vim_lib/svnblame.vim")
    so $TL_HOME/dev-util/vim_lib/svnblame.vim
endif

" ctags for tibero/tlite
if filereadable($TB_HOME . "/src/tags")
    set tags=$TB_HOME/src/tags
    set path+=$TB_HOME/src/**
elseif filereadable($TL_HOME . "/src/tags")
    set tags=$TL_HOME/src/tags
    set tags+=$TL_HOME/tools/sqlite/src/tags
    set path+=$TL_HOME/src/**
    set path+=$TL_HOME/tools/sqlite/src/**
else
    set tags=tags
    set path+=./**
endif

" cscope for tibero/tlite
set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb
set nocp
set splitright

if filereadable($TB_HOME . "/src/cscope.out")
    cs add $TB_HOME/src/cscope.out
elseif filereadable($TL_HOME . "/src/cscope.out")
    cs add $TL_HOME/src/cscope.out
    cs add $TL_HOME/tools/sqlite/src/cscope.out
else
    cs add cscope.out
endif
set csverb

cnoreabbrev csf cscope find f
cnoreabbrev css cscope find s

nmap <C-[>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-[>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-[>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-[>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-[>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-[>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-[>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-[>d :cs find d <C-R>=expand("<cword>")<CR><CR>

cnoreabbrev gt Gtags
map <C-j> :cn<CR>
map <C-k> :cp<CR>

" ==================== General Configuration ====================

if has("syntax")
    syntax on
endif
set history=1000        " Store lots of :cmdline history
set textwidth=80        " Text width
set mouse=a             " Enable mouse in all modes
set laststatus=2        " Always show status line
set ruler               " Show the cursor position
set title               " Show the filename in the window titlebar
set showmatch			" Highlight matching braces
set showcmd             " Show the (partial) command as it's being typed
set showmode            " Show the current mode
set autoread            " Reload files changed outside vim
set nostartofline       " Don't reset cursor to start of line when moving around

" ==================== Indentation ====================

filetype indent on
set ts=4                " tabsize
set shiftwidth=4        " tabsize when autoindent
set sts=4
"set expandtab			" converting tab to space
set autoindent
set cindent
set smartindent
"set copyindent
"set preserveindent
set matchtime=1

" ==================== Scrolling ====================

set scrolloff=10        " Start scrolling when we're 10 lines away from margins

" ==================== Search ====================
set incsearch           " Find the next match as we type the search
set hlsearch            " Highlight search
set ignorecase          " Ignore case when searching
set smartcase           " Unless we type a capital

set fileencodings=euc-kr,ucs-bom,utf-8,latin-1
"set fileencodings=utf-8,ucs-bom,euc-kr,latin-1
set backspace=2

set nofoldenable		" don't collapse code line
set mmp=5000
set cc=81               " red line

" ==================== Automatic Commands ====================

if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
		\| exe "normal! g'\"" | endif

	augroup bashalias
		autocmd BufRead,BufNewFile *_aliases set filetype=sh
	augroup END
endif


" ==================== Key mappings ====================

" mode line up and down with indentation
" do not work when tmux is used 
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
inoremap <C-Down> <Esc>:m .+1<CR>==gi
inoremap <C-Up> <Esc>:m .-2<CR>==gi
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv


" LLVM syntax highliting
augroup filetype
	au! BufRead,BufNewFile *.ll		set filetype=llvm
augroup END

" Key mapping
map <F2> :BufExplorer<CR>
map! <F2> <ESC><F2><CR>
let g:bufExplorerUseCurrentWindow=1

"let unuse_newfold=1                                                              
"let unuse_currentline_comment = 1                                                
"let use_svn_blame= 1                                                             
"let use_svn_diff= 1                                                              
"let unuse_tb_code_format= 0                

nmap <F9> :set ignorecase! ignorecase?<CR>

