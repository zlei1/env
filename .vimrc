set nocompatible
filetype on

set encoding=utf-8

syntax on
set re=2
set ttyfast
set lazyredraw

colorscheme molokai

" backspace 的三种模式
" 0 same as set backspace= (Vi compatible)
" 1 same as set backspace=indent,eol
" 2 same as set backspace=indent,eol,start
set backspace=2

" fzf
nnoremap <C-p> :Files<CR>

" 高亮搜寻
set hlsearch

" 设置所有的Tab和缩进为2个空格 tabstop
set ts=2
" 设定<<和>>命令移动时的宽度为2 shiftwidth
set sw=2
" 使用空格来替换Tab
set expandtab
" 缩进，自动缩进(继承前一行的缩进)
set autoindent

" 定义代码折叠
set foldmethod=indent
" 打开文件是默认不折叠代码
set foldlevelstart=99

" 显示行号
set number

" 显示光标当前位置
set ruler

" 取消换行
" set nowrap

" 不需要备份文件
set nobackup
" 不创建临时交换文件 
set noswapfile
" 编辑的时候不需要备份文件
set nowritebackup
" 不创建撤销文件
set noundofile

"搜索忽略大小写
set ignorecase

" 在搜索时，输入的词句的逐字符高亮
" set incsearch

set report=0
" 高亮显示匹配的括号([{和}])
set showmatch

" 总是显示状态栏
set laststatus=2

" 高亮显示当前行
set cursorline
hi cursorline guibg=#00ff00
hi CursorColumn guibg=#00ff00

" indentLine
let g:indentLine_char = '¦'
let g:indentLine_enabled = 1

" syntastic
set statusline+=%F
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

" 打开文件时恢复光标位置
autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" buffers
" 允许隐藏被修改过的 buffer
" set hidden

" n始终为向后搜索 N始终为向前搜索
nnoremap <expr> n  'Nn'[v:searchforward]
nnoremap <expr> N  'nN'[v:searchforward]

" 当前行上移或下移
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

" 普通模式下用块状光标，在插入模式下用条状光标
" 终端环境的内部原理不尽相同，对于序列的处理方式也稍有不同，可能无法在你的环境中运行
" 可以在 iTerm2 中完美运行
if empty($TMUX)
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif

" Ack 使用 ag 命令搜索
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" NERDTree
 noremap <C-n> :NERDTreeToggle<CR>
 nnoremap <Leader>] :NERDTreeFind<CR>
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 显示书签列表
let NERDTreeShowBookmarks=1
" 
let g:NERDTreeGitStatusShowIgnored=1
" let g:nerdtree_tabs_open_on_console_startup=1
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
:let g:NERDTreeWinSize=40

" 递归  非递归    模式
" :map	:noremap	normal, visual, operator-pending
" :nmap	:nnoremap	normal
" :xmap	:xnoremap	visual
" :cmap	:cnoremap	command-line
" :omap	:onoremap	operator-pending
" :imap	:inoremap	insert

" 如果你选中了一行或多行，那么你可以用 < 或 > 来调整他们的缩进。但在调整之后就不会保持选中状态了。
" 你可以连续按下 g v 来重新选中他们，请参考 :h gv。因此，你可以这样来配置映射
xnoremap <  <gv
xnoremap >  >gv

" tagbar
nnoremap <F9> :TagbarToggle<CR>
nnoremap <Leader>tt :TagbarToggle<CR>
" 设置tagbar在右边
let g:tagbar_left = 0
" 设置tagbar打开时是否自动获取焦点
let g:tagbar_autofocus = 0
" 设置tagbar默认打开
autocmd VimEnter * nested TagbarOpen

" ==== 系统剪切板复制粘贴 ====
" v 模式下复制内容到系统剪切板
xnoremap ;y "+yy
" n 模式下复制一行到系统剪切板
nnoremap ;y "+yy

" EasyAlign
xnoremap ga <Plug>(EasyAlign)
nnoremap ga <Plug>(EasyAlign)

" tab 标签页切换快捷键
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 8gt
nnoremap <Leader>0 :tablast<CR>

" marks
nnoremap <Leader>m :marks<CR>

inoremap jj <Esc>

nnoremap <space> :
xnoremap <space> :

" MarkdownPreview
cabbrev mdp MarkdownPreview
cabbrev mdps MarkdownPreviewStop

" Function
function! RailsProjectTagsUpdate()
  let curdir=getcwd()
  while !filereadable("./tags")
    cd ..
    if getcwd() == "/"
      break
    endif
  endwhile

  if filewritable("./tags")
    !ctags -R --languages=ruby --exclude=.git --exclude=log --exclude=tmp --exclude=node_modules . $(bundle list --paths)
  endif
  execute ":cd " . curdir
endfunction

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" A tree explorer plugin for vim.
Plugin 'scrooloose/nerdtree'

" NERDTree and tabs together in Vim, painlessly
Plugin 'jistr/vim-nerdtree-tabs'

" A plugin of NERDTree showing git status
Plugin 'Xuyuanp/nerdtree-git-plugin'

" A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes (partial) hunks.
Plugin 'airblade/vim-gitgutter'

" fugitive.vim: A Git wrapper so awesome
Plugin 'tpope/vim-fugitive'

" Vim plugin for intensely orgasmic commenting
Plugin 'scrooloose/nerdcommenter'

" A vim plugin to display the indention levels with thin vertical lines
Plugin 'Yggdroot/indentLine'

" Vim plugin for the Perl module / CLI script 'ack'
Plugin 'mileszs/ack.vim'

" Syntax checking hacks for vim
Plugin 'scrooloose/syntastic'

" Vim plugin that displays tags in a window
Plugin 'majutsushi/tagbar'

" Markdown Preview for (Neo)vim
Plugin 'iamcco/markdown-preview.nvim'

" Vim motions on speed! 
" 跳转到当前光标前后的位置 <leader><leader>w
" 搜索跳转 <leader><leader>s
" 行级跳转 <leader><leader>j 和 <leader><leader>k
" 行内跳转 <leader><leader>h 和 <leader><leader>l
" 重复上一次动作 <Leader><leader>.
Plugin 'easymotion/vim-easymotion'

" A Vim alignment plugin
Plugin 'junegunn/vim-easy-align'

" Plugin to toggle, display and navigate marks
Plugin 'kshenoy/vim-signature'

" Coc.nvim
Plugin 'neoclide/coc.nvim'

" fzf vim
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

call vundle#end()
filetype plugin indent on
