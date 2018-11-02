set nocompatible

" ======================== Vundle ========================
" set runtime path to include Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'altercation/vim-colors-solarized'
call vundle#end()
filetype plugin on

" :PluginList		- lists configured plugins
" :PluginInstall	- installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal


set background=dark
colorscheme solarized

" ======================== General Config ========================
syntax on			" Enable syntax highlighting
set history=1000		" Store lots of :cmdline history
set textwidth=80		" Text width
set mouse=a				" Enable mouse in all modes
set laststatus=2		" Always show status line
set ruler				" Show the cursor position
set title				" Show the filename in the window titlebar
set showmatch			" highlight matching braces
set showcmd				" Show the (partial) command as it's being typed
set showmode			" Show the current mode
set gcr=a:blinkon0		" Disable cursor blink
set autoread			" Reload files changed outside vim
"set cursorline			" Highlight current line
set nostartofline		" Don't reset cursor to start of line when moving around
"set colorcolumn=80


" ======================== Indentation ========================
filetype indent on
set autoindent
set cindent
set smartindent
set smarttab
set expandtab			  " Convert tab to space
set copyindent
"set preserveinent
set cinoptions=g0		" For C++ class indentation
set tabstop=2				" Make tabs as wide as four spaces
set softtabstop=2		" 
set shiftwidth=2		" Tab size when autoindent
"set paste					" No autoindent when paste



" ======================== Scrolling ========================
set scrolloff=5			" Start scrolling when we're 10 lines away from margins



" ======================== Search ========================
set incsearch				" Find the next match as we type the search
set hlsearch				" Highlight search
set ignorecase			" Ignore case when serching
set smartcase				" Unless we type a capital



" ======================== Automatic Commands ========================
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
		\| exe "normal! g'\"" | endif
endif
