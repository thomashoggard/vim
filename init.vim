" vim-plug
call plug#begin('~/.vim/plugged')

" window resizing
Plug 'talek/obvious-resize'

" Ctrl-P
Plug 'ctrlpvim/ctrlp.vim'

" Rainbow brackets
"Plug 'luochen1990/rainbow'

" lightline
Plug 'itchyny/lightline.vim'

" git
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'

" prettier
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" comment out lines
Plug 'tpope/vim-commentary'

" NERD TREE
Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'

" web dev.
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/html5.vim'
Plug 'elzr/vim-json'
Plug 'larsbs/vim-xmll'
Plug 'JulesWang/css.vim'
Plug 'jparise/vim-graphql'

" linting
Plug 'w0rp/ale'

" Note Taking
Plug 'vimwiki/vimwiki'

" autocomplete
if has('win32') || has('win64') 
  Plug 'lifepillar/vim-mucomplete'
  set completeopt+=noinsert
  set shortmess+=c
  set belloff+=ctrlg
elseif
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    " For func argument completion
  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'
  let g:deoplete#enable_at_startup = 1
endif


" Searching
Plug 'vim-scripts/gitignore'
" Plug 'wokalski/autocomplete-flow'

" Themes
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
" icons
Plug 'ryanoasis/vim-devicons'

call plug#end()


" commenting out lines
" not working - noremap <C-/> <leader>gc

" window resizing
noremap <silent> <C-Up> :<C-U>ObviousResizeUp<CR>
noremap <silent> <C-Down> :<C-U>ObviousResizeDown<CR>
noremap <silent> <C-Left> :<C-U>ObviousResizeLeft<CR>
noremap <silent> <C-Right> :<C-U>ObviousResizeRight<CR>

" easy motion
nmap s <Plug>(easymotion-s2)

" buffer management
" allow the ability to switch buffers without saving
set hidden
" list buffers and press a number to switch
"nnoremap <F5> :buffers<CR>:buffer<Space>

" ctrl-p
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
nnoremap <F5> :CtrlPBuffer<CR>

" rainbow brackets
" let g:rainbow_active=1

" NERDTree
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


" Enable full color support in terminals
set termguicolors

" windows only
if has('win32') || has('win64') 
  set clipboard=unnamedplus
  autocmd VimEnter * GuiFont! Hack\ NF:h11
  let g:python3_host_prog = 'C:\Users\803465046\AppData\Local\Programs\Python\Python37-32\python.exe'
  
  " autocomplete
  let g:mucomplete#enable_auto_at_startup = 1
elseif
  " autocomplete
  let g:deoplete#enable_at_startup = 1
  let g:neosnippet#enable_completed_snippet = 1
  " <TAB>: completion.
  inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
endif

if (has('unix')) 
  set guifont=Hack\ NF:h11:cANSI
endif

" note taking
let g:vimwiki_list = [{ 'syntax': 'markdown', 'ext': '.md'}]

" ================================= Themes ================================
" gruvbox
"set background=dark
"let g:gruvbox_italic=1
"colorscheme gruvbox
"let g:lightline = { 'colorscheme': 'gruvbox' }

" nord
colorscheme nord
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_comment_brightness = 4
let g:nord_cursor_line_number_background = 1
let g:lightline = { 'colorscheme': 'nord' }


" =============================== END THEMES ===============================

" Prettier Config
let g:prettier#config#single_quote = 'false'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#trailing_comma = 'all'
"let g:prettier#config#parser = 'flow'
"let g:prettier#config#config_precedence = 'prefer-file'
"let g:prettier#config#prose_wrap = 'preserve'
"Running before saving async
"let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

set number     	" Show line numbers in the gutter
set ignorecase 	" Make searching case insensitive
set smartcase  	" ... unless the query has capital letters
set rnu        	" relative line numbers
set nowrap	" Disable text wrap	
set splitright	" Split new vertical windows to the right
set splitbelow 	" Split new horizontal windows to the bottom

set shiftwidth=2 tabstop=2 expandtab 
autocmd FileType java set noexpandtab|set shiftwidth=4|set tabstop=4

" Use <C-L> to clear the highlighting of :set hlsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" searching
set grepprg=rg\ --vimgrep\ --smart-case\ --glob\ !package-lock.json\ $*
set grepformat=%f:%l:%c:%m
nnoremap <silent> [f :cprevious<CR>
nnoremap <silent> ]f :cnext<CR>

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

" Set window title to working directory
set title
set titlestring=%{getcwd()}

" Auto reload a changed file
"set autoread
set cursorline
