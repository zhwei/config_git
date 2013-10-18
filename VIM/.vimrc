"
"zhwei
"

syntax on

"自动补齐空格
set cindent shiftwidth=4
set cinoptions+={2
filetype indent on
set autoindent shiftwidth=3
set background=dark
colorscheme molokai

"解决konsole 256 色显示问题
let g:solarized_termcolors=256
set t_Co=256



function! ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endfunction

"
"映射快捷键
"
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

"gundo 可视化 Vim 的撤销列表
map <leader>g :GundoToggle<CR>




"常见设置
"
set nu
set numberwidth=1
set background=dark
set nocompatible
setlocal noswapfile
set foldcolumn=2
set nobackup
set shortmess=atI
set report=0

" 下面两条配置使得tab显示为 ^I ,行尾空格显示为+
set list
set listchars=trail:+

" 自动加载文件
set autoread
set showmatch
set matchtime=5
set hlsearch
set incsearch
set scrolloff=3
set laststatus=2
set formatoptions+=mM
set autoindent
set smartindent
set langmenu=zh_CN.UTF-8
set helplang=cn
set cindent
set imcmdline

"tab setting
set showtabline=1
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4

filetype indent on
autocmd FileType python,c setlocal et sta sw=4 sts=4
autocmd FileType html,go,vim setlocal et sta sw=2 sts=2
autocmd FileType html,htmldjango,css,js,coffee,markdown setlocal et sta sw=2 sts=2

set showmode
set nocp
set showcmd
set ttyfast

set lbr
filetype plugin indent on
filetype off

"单词补全字典
set dictionary+=/usr/share/dict/words

"替代键
"
inoremap jj <ESC>
map ,pa :setlocal paste! <cr>

"

"编码方式
"
"chinese
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,chinese,latin-1
let &termencoding=&encoding
"



"插件
"

set nocompatible
filetype on
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 

Bundle 'gmarik/vundle'
Bundle 'SuperTab'
Bundle 'git://github.com/scrooloose/nerdtree.git'
Bundle 'git://github.com/msanders/snipmate.vim.git'
Bundle 'VimIM'
Bundle 'git://github.com/scrooloose/nerdcommenter.git'
Bundle 'git://github.com/mattn/zencoding-vim.git'
Bundle 'git://github.com/kien/ctrlp.vim.git'
Bundle 'git://github.com/vim-scripts/FuzzyFinder.git'
Bundle 'git://github.com/vim-scripts/L9.git'
Bundle 'git://github.com/sjl/gundo.vim.git'
Bundle 'git://github.com/mitechie/pyflakes-pathogen.git'
Bundle 'git://github.com/alfredodeza/pytest.vim.git'
Bundle 'git://github.com/vim-scripts/pep8.git'
Bundle 'git://github.com/fs111/pydoc.vim.git'
Bundle 'git://github.com/kevinw/pyflakes-vim.git'
Bundle 'git://github.com/sontek/rope-vim.git'
Bundle 'git://github.com/majutsushi/tagbar.git'
Bundle 'git://github.com/kchmck/vim-coffee-script.git'
Bundle 'git://github.com/Glench/Vim-Jinja2-Syntax.git'
Bundle 'Yggdroot/indentLine'
Bundle 'go.vim'
"




"plugin setting
"
"
"
"snipMate
""snipmate_for_django
map ,dj :set ft=python.django <cr>
map ,md :set ft=markdown <cr>
autocmd FileType html set ft=htmldjango.html " For SnipMate
"map ,ja :set ft=htmldjango.html <cr>
"
"
"tagbar
"
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30

"supertab


set ofu=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"


set completeopt=menuone,longest,preview


""NERDTree plugin
"
let NERDTreeWinPos = "left" "where NERD tree window is placed on the screen
nmap <F7> <ESC>:NERDTreeToggle<RETURN>" Open and close the NERD_tree.vim separately
"
"fuzzyfinder
"
map ff  :FufCoverageFile!<cr>
let g:fuf_coveragefile_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|(tmp|log|db/migrate|vendor|pyc|gif|png)'
let g:fuf_enumeratingLimit = 100
let g:fuf_coveragefile_prompt = '=>'

"
"autopep8
"
map <F9> :call FormartSrc()<CR>
"
""定义FormartSrc()
func FormartSrc()
  exec "w"
  if &filetype == 'c'
    exec "!astyle --style=ansi --one-line=keep-statements -a --suffix=none %"
  elseif &filetype == 'cpp' || &filetype == 'hpp'
    exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
  elseif &filetype == 'perl'
    exec "!astyle --style=gnu --suffix=none %"
  elseif &filetype == 'py'||&filetype == 'python'
    exec "r !autopep8 -i --aggressive %"
  elseif &filetype == 'java'
    exec "!astyle --style=java --suffix=none %"
  elseif &filetype == 'jsp'
    exec "!astyle --style=gnu --suffix=none %"
  elseif &filetype == 'xml'
    exec "!astyle --style=gnu --suffix=none %"
  endif
  exec "e! %"
endfunc
"结束定义FormartSrc
"
"
"pyflaskes
"
"
let g:pyflakes_use_quickfix = 0

"
"
"pep8
"
"
let g:pep8_map='<leader>8'
"
"
"
"new python file add encodings config
autocmd BufNewFile *.py, exec ":call SetTitle()" 
func SetTitle() 
  if &filetype == 'python'
    call setline(1,"#!/usr/bin/env python")
    call append(line("."),"# -*- coding: utf-8 -*-")
    call append(line(".")+1, "") 
  endif
  autocmd BufNewFile * normal G
endfunc
"
"
"
""C，C++ ,python 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!gcc % -o %<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "! ./%<"
  elseif &filetype == 'sh'
    :!./%
  elseif &filetype == 'python'
    exec "!python2.7 %"
  elseif &filetype == 'html'
    exec "!google-chrome % &"
  elseif &filetype == 'go'
    exec "!go run % &"
  elseif &filetype == 'mkd'
    "        exec "!touch ~/temp.html"
    "        exec "!perl ~/.vim/markdown.pl % > /tmp/temp.html<"<CR>
    "        exec "!markdown % > /tmp/temp.html<"<CR>
    "        exec "mkd"
    exec "!google-chrome /tmp/markdown.html &"
  endif
endfunc

"


" go.vim
"
au BufRead,BufNewFile *.go set filetype=go
