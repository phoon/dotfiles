" ~/.vimrc

syntax enable			" 启用语法高亮
colorscheme dark_purple	" 配色方案

set t_Co=256			" 启用256色
set encoding=utf-8		" 启用UTF8编码
set number				" 启用行号
set relativenumber		" 启用相对位置行号显示
set nocompatible		" 设置不兼容vi
set mouse=a				" 启用鼠标支持
set cursorline			" 启用当前行高亮
set wrap				" 启用自动折行
set tabstop=4			" TAB长度
set background=dark		" 设置背景颜色
set wildmenu			" 增强vim命令补全
set hlsearch			" 搜索高亮 
set hidden				" 避免必须保存修改才能跳转buffer

" vim-plug插件配置
call plug#begin('~/.vim/plugged')
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } 			" go工具
	Plug 'tpope/vim-fugitive'									" git工具
	Plug 'tpope/vim-commentary'									" 注释工具
	Plug 'vim-airline/vim-airline'								" 状态栏工具
	Plug 'vim-airline/vim-airline-themes'						" 状态栏主题
	Plug 'majutsushi/tagbar'									" 代码导航
	Plug 'scrooloose/nerdtree'									" 文件管理
	Plug 'Xuyuanp/nerdtree-git-plugin'							" 文件git状态
	Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'} "代码补全
call plug#end()

" vim-go 配置
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_highlight_function_calls = 1

" airline 配置
let g:airline_theme = 'angr'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '

" NERDTree 配置
autocmd vimenter * NERDTree

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
