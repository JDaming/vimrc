" This line should not be removed as it ensures that various options are  
" properly set to work with the Vim-related packages available in Debian.  
  
" Uncomment the next line to make Vim more Vi-compatible  
" NOTE: debian.vim sets 'nocompatible'. Setting 'compatible' changes numerous  
" options, so any other options should be set AFTER setting 'compatible'.  
set nocompatible  
  
" Vim5 and later versions support syntax highlighting. Uncommenting the  
" following enables syntax highlighting by default.  
if has("syntax")  
syntax on " 语法高亮  
endif  
   
  
" If using a dark background within the editing area and syntax highlighting  
" turn on this option as well  
set background=dark  
  
" Uncomment the following to have Vim jump to the last position when  
" reopening a file  
if has("autocmd")  
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif  
"have Vim load indentation rules and plugins according to the detected filetype  
filetype plugin indent on  
endif  
  
" The following are commented out as they cause vim to behave a lot  
" differently from regular Vi. They are highly recommended though.  
  
"set ignorecase " 搜索模式里忽略大小写  
"set smartcase " 如果搜索模式包含大写字符，不使用 'ignorecase' 选项。只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用。  
set autowrite " 自动把内容写回文件: 如果文件被修改过，在每个 :next、:rewind、:last、:first、:previous、:stop、:suspend、:tag、:!、:make、CTRL-] 和 CTRL-^命令时进行；用 :buffer、CTRL-O、CTRL-I、'{A-Z0-9} 或 `{A-Z0-9} 命令转到别的文件时亦然。  
set autoindent " 设置自动对齐(缩进)：即每行的缩进值与上一行相等；使用 noautoindent 取消设置  
"set smartindent " 智能对齐方式  
set tabstop=4 " 设置制表符(tab键)的宽度  
set softtabstop=4 " 设置软制表符的宽度  
set shiftwidth=4 " (自动) 缩进使用的4个空格  
set cindent " 使用 C/C++ 语言的自动缩进方式  
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s "设置C/C++语言的具体缩进方式  
"set backspace=2 " 设置退格键可用  
set showmatch " 设置匹配模式，显示匹配的括号  
set linebreak " 整词换行  
set whichwrap=b,s,<,>,[,] " 光标从行首和行末时可以跳到另一行去  
"set hidden " Hide buffers when they are abandoned  
set mouse=a " Enable mouse usage (all modes) "使用鼠标  
set number " Enable line number "显示行号  
"set previewwindow " 标识预览窗口  
set history=50 " set command history to 50 "历史记录50条  
  
"--状态行设置--  
set laststatus=2 " 总显示最后一个窗口的状态行；设为1则窗口数多于一个的时候显示最后一个窗口的状态行；0不显示最后一个窗口的状态行  
set ruler " 标尺，用于显示光标位置的行号和列号，逗号分隔。每个窗口都有自己的标尺。如果窗口有状态行，标尺在那里显示。否则，它显示在屏幕的最后一行上。  
  
"--命令行设置--  
set showcmd " 命令行显示输入的命令  
set showmode " 命令行显示vim当前模式  
  
"--find setting--  
set incsearch " 输入字符串就显示匹配点  
set hlsearch  

set nocompatible                " be iMproved
filetype off                    " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

"my Bundle here:
"
" original repos on github
Bundle 'kien/ctrlp.vim'
Bundle 'sukima/xmledit'
Bundle 'sjl/gundo.vim'
Bundle 'jiangmiao/auto-pairs'
Bundle 'klen/python-mode'
Bundle 'Valloric/ListToggle'
Bundle 'SirVer/ultisnips'
Bundle 'scrooloose/syntastic'
Bundle 't9md/vim-quickhl'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'majutsushi/tagbar'
"..................................
" vim-scripts repos
Bundle 'YankRing.vim'
Bundle 'vcscommand.vim'
Bundle 'ShowPairs'
Bundle 'SudoEdit.vim'
Bundle 'EasyGrep'
Bundle 'VOoM'
Bundle 'VimIM'
Bundle 'The-NERD-tree'
"..................................
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
"......................................
filetype plugin indent on



"-- Cscope setting --  
if has("cscope")  
set csprg=/usr/bin/cscope " 指定用来执行cscope的命令  
set csto=0 " 设置cstag命令查找次序：0先找cscope数据库再找标签文件；1先找标签文件再找cscope数据库  
set cst " 同时搜索cscope数据库和标签文件  
set cscopequickfix=s-,c-,d-,i-,t-,e- " 使用QuickFix窗口来显示cscope查找结果  
set nocsverb  
if filereadable("cscope.out") " 若当前目录下存在cscope数据库，添加该数据库到vim  
cs add cscope.out  
elseif $CSCOPE_DB != "" " 否则只要环境变量CSCOPE_DB不为空，则添加其指定的数据库到vim  
cs add $CSCOPE_DB  
endif  
set csverb  
endif  
map <F4> :cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>  
imap <F4> <ESC>:cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>  
" 将:cs find c等Cscope查找命令映射为<C-_>c等快捷键（按法是先按Ctrl+Shift+-, 然后很快再按下c）  
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>  
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>  
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>  
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>  
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>  
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR> :copen<CR><CR>  
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>  
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR> :copen<CR><CR>


"tagbar setting:""
"type help: tagbar for more info 
let g:tagbar_ctags_bin='ctags' "program road of ctags"
let g:tagbar_width=30
let g:tagbar_right=1
map <F3> :TagbarToggle<CR>
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar*autoopen()




"NERDTree setting
"
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q |endif

"NeoComplcache setting
"
" most of them not documented because I'm not sure how they work
" (docs aren't good, had to do a lot of trial and error to make 
" it play nice)
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_ignore_case = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_fuzzy_completion_start_length = 1
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_manual_completion_start_length = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_keyword_length = 1
let g:neocomplcache_min_syntax_length = 1
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" complete with workds from any opened file
let g:neocomplcache_same_filetype_lists = {}
let g:neocomplcache_same_filetype_lists._ = '_'
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

"CtrlP setting
"
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'

map <leader>f :CtrlPMRU<CR>



"
"others 
"
"
"
set tags=/home/hadoop/postgresql-9.6.0
set tags=tags

