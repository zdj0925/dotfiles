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
set fileencodings=ucs-bom,utf-8,cp936,gbk,gb18030,big5,euc-jp,euc-kr,latin1
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
set autoindent
set mouse=c
colorscheme desert
"文件类型
autocmd BufEnter *.pc,*.cp,*.xc,*.sqc  set filetype=esqlc
autocmd BufEnter *.cpp set filetype=esqlc
autocmd BufEnter mk    set filetype=sh
set pastetoggle=<F9>

"set vim-airline
"let g:airline_theme="luna" 

"这个是安装字体后 必须设置此项" 
let g:airline_powerline_fonts = 1   
 
 "打开tabline功能,方便查看Buffer和切换，这个功能比较不错"
 "我还省去了minibufexpl插件，因为我习惯在1个Tab下用多个buffer"
 let g:airline#extensions#tabline#enabled = 1
 let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'

 "设置切换Buffer快捷键"
" nnoremap <C-N> :bn<CR>
" nnoremap <C-P> :bp<CR>
noremap [b :bp<cr>
noremap ]b :bn<cr>
noremap [t :tabp<cr>
noremap ]t :tabn<cr>
map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>

 " 关闭状态显示空白符号计数,这个对我用处不大"
 let g:airline#extensions#whitespace#enabled = 0
 let g:airline#extensions#whitespace#symbol = '!'

" 在Gvim中我设置了英文用Hermit， 中文使用 YaHei Mono "
if has('win32')
  set guifont=Hermit:h13
  set guifontwide=Microsoft_YaHei_Mono:h12
endif
"set vim-markdown
let g:markdown_fenced_languages = ['html', 'vim', 'python', 'bash=sh']
"let g:makdown_syntax_conceal = 0
let g:markdown_minlines = 100
