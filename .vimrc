" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Dec 17
"
" To use it, copy it to
"	       for Unix:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"	 for MS-Windows:  $VIM\_vimrc
"	      for Haiku:  ~/config/settings/vim/vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

"文件编码
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gbk,gb18030,latin1
set termencoding=utf-8
"防止特殊符号无法正常显示
set ambiwidth=double

set tags=.tags;,./tags;,./TAGS;,tags;,TAGS;  
set shiftwidth=4
set tabstop=4
set wrap
set expandtab
set cindent
set smartindent
set number
set showmatch
set cursorline
set mouse=a
colorscheme desert
"文件类型
autocmd BufEnter *.pc,*.cp,*.xc,*.sqc  set filetype=esqlc
autocmd BufEnter *.cpp set filetype=esqlc
autocmd BufEnter mk    set filetype=sh
set pastetoggle=<F9>
