" ~/.vimrc

set ttyfast
set t_Co=256            " 启用256色
" set termguicolors
set nocompatible        " 设置不兼容vi
set encoding=utf-8      " 启用UTF8编码
set mouse=a             " 启用鼠标支持

" 缩进
set expandtab
set tabstop=4			" TAB空格数
set shiftwidth=4		" 缩进宽度
set softtabstop=4		" TAB转为多少个空格
set autoindent			" 自动缩进
set smartindent			" 智能缩进

" 外观
set number              " 启用行号
set relativenumber      " 启用相对位置行号显示
set cursorline          " 启用当前行高亮
set wrap                " 启用自动折行
set background=dark     " 设置背景颜色
set wildmenu            " 增强vim命令补全
set hlsearch            " 搜索高亮
set hidden              " 避免必须保存修改才能跳转buffer

" 备份
set nobackup
set noswapfile
set nowritebackup

let g:onedark_termcolors=256

" vim-plug插件
call plug#begin('~/.vim/plugged')
	Plug 'joshdick/onedark.vim'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }          " go工具
	Plug 'tpope/vim-fugitive'                                   " git工具
	Plug 'tpope/vim-commentary'                                 " 注释工具
	Plug 'itchyny/lightline.vim'                                " 状态栏工具
	Plug 'majutsushi/tagbar'                                    " 代码导航
	Plug 'scrooloose/nerdtree'                                  " 文件管理
	Plug 'Xuyuanp/nerdtree-git-plugin'                          " 文件git状态
	Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'} " 代码补全
call plug#end()

syntax on           " 启用语法高亮
colorscheme onedark " 配色方案

" Lightline
set laststatus=2
let g:lightline = {
	\ 'colorscheme': 'one',
	\ }

" vim-go 配置
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_highlight_function_calls = 1

" NERDTree 配置
" autocmd vimenter * NERDTree

" NERDTree git plugin 配置
let g:NERDTreeIndicatorMapCustom = {
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

" 键位映射
let mapleader = ','

map <C-n> :NERDTreeToggle<CR>
inoremap ) )<Esc>i
inoremap } }<Esc>i
inoremap ] ]<Esc>i

nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
