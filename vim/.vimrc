" ~/.vimrc

syntax on               " 启用语法高亮

set ttyfast
set t_Co=256            " 启用256色
" set termguicolors
set nocompatible        " 设置不兼容vi
set encoding=utf-8      " 启用UTF8编码
set mouse=a             " 启用鼠标支持

" 缩进
set expandtab
set tabstop=4           " TAB空格数
set shiftwidth=4        " 缩进宽度
set softtabstop=4       " TAB转为多少个空格
set autoindent          " 自动缩进
set smartindent         " 智能缩进

" 外观
set number              " 启用行号
set relativenumber      " 启用相对位置行号显示
set cursorline          " 启用当前行高亮
set cursorcolumn        " 启用当前列高亮
set wrap                " 启用自动折行
set background=dark     " 设置背景颜色
set wildmenu            " 增强vim命令补全
set hlsearch            " 搜索高亮
set hidden              " 避免必须保存修改才能跳转buffer
set cc=80

" 备份
set nobackup
set noswapfile
set nowritebackup

" vim-plug插件
call plug#begin('~/.vim/plugged')
    Plug 'joshdick/onedark.vim'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }          " go工具
    Plug 'tpope/vim-fugitive'                                   " git工具
    Plug 'tpope/vim-commentary'                                 " 注释工具
    Plug 'honza/vim-snippets'                                   " 代码片段
    Plug 'vim-airline/vim-airline'                              " 状态栏工具
    Plug 'vim-airline/vim-airline-themes'                       " 状态栏主题
    Plug 'majutsushi/tagbar'                                    " 代码导航
    Plug 'scrooloose/nerdtree'                                  " 文件管理
    Plug 'Xuyuanp/nerdtree-git-plugin'                          " 文件git状态
    Plug 'neoclide/coc.nvim', {'branch': 'release'}             " 代码补全
call plug#end()

colorscheme onedark " 配色方案
let g:onedark_termcolors = 256

" airline 配置
let g:airline_theme = 'tomorrow'
let g:airline#extensions#tabline#enabled = 1

" vim-go 配置
let g:go_doc_popup_window = 1
let g:go_gopls_options = ['-remote=auto']
let g:go_template_use_pkg = 1
let g:go_rename_command='gorename'
let g:fmt_fail_silently = 1
let g:def_mapping_enabled = 0
let g:go_fmt_command = 'goimports'
let g:go_auto_type_info = 1
let g:go_updatetime = 500
let g:go_highlight_function_calls = 1

" NERDTree 配置
" autocmd vimenter * NERDTree

" NERDTree git plugin 配置
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

" 键位映射
let mapleader = ','

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

map <C-n> :NERDTreeToggle<CR>
inoremap ) )<Esc>i
inoremap } }<Esc>i
inoremap ] ]<Esc>i

nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>e :bdelete<CR>

" coc-snippets
" using <Tab> to trigger completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
