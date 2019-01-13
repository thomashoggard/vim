" vim-plug
call plug#begin('~/.vim/plugged')

"============== UI ====================
Plug 'talek/obvious-resize'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'

" Themes
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }

" Icons
Plug 'ryanoasis/vim-devicons'

"============== Coding ================
Plug 'ctrlpvim/ctrlp.vim'
Plug 'luochen1990/rainbow' " Rainbow brackets
Plug 'tpope/vim-commentary' " Comment out lines
Plug 'airblade/vim-rooter'  " Change working direction to project root

" git
Plug 'vim-scripts/gitignore'

" syntax
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'elzr/vim-json'
Plug 'JulesWang/css.vim'
Plug 'jparise/vim-graphql'

" linting
Plug 'w0rp/ale'

" autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"
"============== Misc. ==================
Plug 'vimwiki/vimwiki' " Note Taking

call plug#end()

""""""""""""""""
" VIM Settings "
""""""""""""""""
set hidden " allow the ability to switch buffers without saving

" Enable full color support in terminals
set termguicolors

" windows only
if has('win32') || has('win64') 
  set clipboard=unnamedplus
  autocmd VimEnter * GuiFont! Hack\ NF:h11
  set grepprg=rg\ --vimgrep\ --smart-case\ --glob\ !package-lock.json\ $*
  set grepformat=%f:%l:%c:%m
else
  set guifont=Hack\ NF:h11:cANSI
endif

set number     	" Show line numbers in the gutter
set ignorecase 	" Make searching case insensitive
set smartcase  	" ... unless the query has capital letters
set rnu        	" relative line numbers
set nowrap     	" Disable text wrap	
set splitright	" Split new vertical windows to the right
set splitbelow 	" Split new horizontal windows to the bottom
set cursorline  " highlight the line containing the cursor

" indentation
set expandtab
set shiftwidth=2
set tabstop=2
autocmd FileType java set noexpandtab|set shiftwidth=4|set tabstop=4

" Use <C-L> to clear the highlighting of :set hlsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

nnoremap <silent> [f :cprevious<CR>
nnoremap <silent> ]f :cnext<CR>

" Set window title to working directory
set title
set titlestring=%{getcwd()}

"""""""""""""""""
" Plug Settings "
"""""""""""""""""
"============== Themes ====================
" gruvbox
" set background=light
" let g:gruvbox_italic=1
" colorscheme gruvbox
" let g:lightline = { 'colorscheme': 'gruvbox' }

" nord
" colorscheme nord 
" let g:nord_italic = 1
" let g:nord_underline = 1
" let g:nord_comment_brightness = 4
" let g:nord_cursor_line_number_background = 1
" let g:lightline = { 'colorscheme': 'nord' }

" challenger deep
colorscheme challenger_deep
let g:challenger_deep_terminal_italics = 0
let g:lightline = { 'colorscheme': 'challenger_deep'}

" jsx - makes the end tag match the color of the start tag 
hi! link xmlEndTag Statement 
"==========================================

" Obvious Resize 
" =================
noremap <silent> <C-Up> :<C-U>ObviousResizeUp<CR>
noremap <silent> <C-Down> :<C-U>ObviousResizeDown<CR>
noremap <silent> <C-Left> :<C-U>ObviousResizeLeft<CR>
noremap <silent> <C-Right> :<C-U>ObviousResizeRight<CR>

" Ale
" =================
let g:ale_fix_on_save = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '●'
let b:ale_fixers = ['prettier']
let b:ale_linters =['eslint']

" NERDTree
" =================
" open tree automaitcally if directory is opened
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" reveal file in tree
nmap ,n :NERDTreeFind<CR>

" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'
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
let g:NERDTreeIgnore=['.git', 'node_modules', 'package-lock.json']
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
" Disable arrow icons at the left side of folders for NERDTree.
let g:NERDTreeDirArrowExpandable = "\u00a0"
let g:NERDTreeDirArrowCollapsible = "\u00a0"
let NERDTreeNodeDelimiter = "\x07"
let NERDTreeShowLineNumbers=1
highlight! link NERDTreeFlags NERDTreeDir

" ctrl-p
" =================
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
nnoremap <F5> :CtrlPBuffer<CR>

" rainbow brackets
" =================
let g:rainbow_active=1
let g:rainbow_conf = {
\	'separately': {
\		'nerdtree': 0,
\	}
\}
 
" Deoplete
" =================
let g:deoplete#enable_at_startup = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Vimwiki
" =================
let g:vimwiki_list = [{ 'syntax': 'markdown', 'ext': '.md'}]
