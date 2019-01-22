set nocompatible
set autowrite
set backspace=2
set noerrorbells
set esckeys
set hidden
set highlight=8r,db,es,hs,mb,Mr,nu,rs,sr,tb,vr,ws
set incsearch
set ignorecase
set magic
set showcmd
set showmatch
set showmode
set nostartofline
set tabstop=4
set visualbell t_vb=
set whichwrap=b,s,h,l,<,>,[,]
set nowritebackup
set noai
set number
set nobackup
set t_Co=256
#colo grb256

syn on

augroup twig_ft
  au!
  autocmd BufNewFile,BufRead *.html.twig   set syntax=html
augroup END
