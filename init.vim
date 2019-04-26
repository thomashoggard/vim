" vim-plug
call plug#begin('~/.vim/plugged')

"============== UI ====================
Plug 'talek/obvious-resize'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'

""" Themes
Plug 'morhetz/gruvbox'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'drewtempelmeyer/palenight.vim'
Plug 'joshdick/onedark.vim'
Plug 'mhartington/oceanic-next'
Plug 'ayu-theme/ayu-vim' 
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'crusoexia/vim-monokai'

""" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " might cause performance issues

"""============== Coding ================
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'luochen1990/rainbow' " Rainbow brackets (contains a bug where concealing breaks)
Plug 'tpope/vim-commentary' " Comment out lines
Plug 'airblade/vim-rooter'  " Change working direction to project root
Plug 'mattn/emmet-vim'
Plug 'majutsushi/tagbar'
" not working
Plug 'meain/vim-package-info', { 'do': 'npm install' }

"repl
Plug 'metakirby5/codi.vim'

"" git
Plug 'vim-scripts/gitignore'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"" syntax
Plug 'chemzqm/vim-jsx-improve'
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/html5.vim'
Plug 'elzr/vim-json'
Plug 'JulesWang/css.vim'
Plug 'jparise/vim-graphql'

" autocomplete
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'honza/vim-snippets' " works with coc
Plug 'chun-yang/auto-pairs'
"
"============== Misc. ==================
" Plug 'vimwiki/vimwiki' " Note Taking

call plug#end()

""""""""""""""""
" VIM Settings "
""""""""""""""""
set hidden " allow the ability to switch buffers without saving
set termguicolors " Enable full color support in terminals
" set guifont=Hack\ NF:h11:cANSI
set guifont=Fira\ Code:h11:cANSI
set clipboard=unnamedplus
set number     	" Show line numbers in the gutter
set ignorecase 	" Make searching case insensitive
set smartcase  	" ... unless the query has capital letters
set rnu        	" relative line numbers
set nowrap     	" Disable text wrap	
set splitright	" Split new vertical windows to the right
set splitbelow 	" Split new horizontal windows to the bottom
set cursorline  " highlight the line containing the cursor
set expandtab shiftwidth=2 tabstop=2 " indentation

" remap leader to spacebar
nnoremap <space> <leader>
" escape to normalmap
inoremap jk <esc>
inoremap <esc> <nop>
" 'strong' left
nnoremap H 0
" 'strong' right
nnoremap L $
" edit vim config
nnoremap <leader>ev :vsplit $VIMCONFIG/init.vim<cr>
" reload VIM config
nnoremap <leader>sv :source $VIMCONFIG/init.vim<cr>

" move screen down
nnoremap <c-j> 4<c-E>
" move screen up
nnoremap <c-k> 4<c-Y>

" Java
autocmd FileType java set noexpandtab|set shiftwidth=4|set tabstop=4

" terminal
tnoremap <Esc> <C-\><C-n> " map <ESC> to exit terminal mode

" Use <C-L> to clear the highlighting of :set hlsearch
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
" set background=dark
" let g:gruvbox_italic=1
" colorscheme gruvbox

" challenger deep (sucks for jsx and diff)
" colorscheme challenger_deep

" let g:palenight_color_overrides = { 
"       \ "white": { "gui": "#FFF", "cterm": "145", "cterm16": "7" } ,
"       \ "black": { "gui": "#1E1C31", "cterm": "233", "cterm16": "0" },
"       \ "purple": { "gui": "#63F2F1", "cterm": "122", "cterm16": "14" },
"       \ "red": { "gui": "#FF8080", "cterm": "204", "cterm16": "1" },
"       \ "blue": { "gui": "#91DDFF", "cterm": "39", "cterm16": "4" },
"       \ "yellow": { "gui": "#FFE9AA", "cterm": "180", "cterm16": "3" }
"       \ }

" let g:palenight_terminal_italics=1

" ayu (gdiff sucks)
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu
function! MyHighlights() abort
    hi normal      cterm=none ctermbg=233              gui=none guibg=#1e1c31
    hi nontext     cterm=none ctermbg=233              gui=none guibg=#1e1c31
    " hi DraculaPink ctermfg=212 ctermbg=233 guifg=#FF8080
    " hi DraculaYellow  ctermfg=212 ctermbg=233 guifg=#62D196
    " hi DraculaGreen ctermfg=212 ctermbg=233 guifg=#63F2F1
    hi EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme dracula call MyHighlights()
    autocmd ColorScheme * call MyHighlights()
augroup END 

colorscheme dracula
" colorscheme palenight


" colorscheme monokai
" colorscheme onedark

" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
" colorscheme OceanicNext

"==========================================

" airline
let g:airline_powerline_fonts = 1

" Obvious Resize 
noremap <silent> <C-Up> :<C-U>ObviousResizeUp<CR>
noremap <silent> <C-Down> :<C-U>ObviousResizeDown<CR>
noremap <silent> <C-Left> :<C-U>ObviousResizeLeft<CR>
noremap <silent> <C-Right> :<C-U>ObviousResizeRight<CR>
let g:obvious_resize_default = 4

" GIT Gutter
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = ''
let g:gitgutter_sign_removed_first_line = '~'
let g:gitgutter_sign_modified_removed = '~'

" NERDTree
nmap ,n :NERDTreeFind<CR> " reveal file in tree

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
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
highlight! link NERDTreeFlags NERDTreeDir

" fzf 
let $FZF_DEFAULT_COMMAND = 'rg --files'
let g:fzf_history_dir = '~/.local/share/fzf-history'
au TermOpen * tnoremap <Esc> <c-\><c-n>
au FileType fzf tunmap <Esc>
nnoremap <C-p> :Files<Cr>
nnoremap <F5> :Buffers<CR>
" fuzzy find Vim commands
nnoremap <leader>c :Commands<cr>
" fuzzy find lines in current file
nnoremap <c-f> :BLines<cr>
" fuzzy find text in the working directory map
nnoremap <leader>r :Rg<cr>

" rainbow brackets
" let g:rainbow_active=1
" let g:rainbow_conf = {
" \	'separately': {
" \		'nerdtree': 0,
" \	}
" \}

" Emmet
" let g:user_emmet_leader_key='<Tab>'
 
" coc.vim
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" tab navigation
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" <cr> to confirm
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" trigger completion
inoremap <silent><expr> <C-space> coc#refresh()
" format on save
autocmd BufWritePre *.js CocCommand prettier.formatFile
autocmd BufWritePre *.json CocCommand prettier.formatFile

" tagbar
nmap <F8> :TagbarToggle<CR>

" Vimwiki
" let g:vimwiki_list = [{ 'syntax': 'markdown', 'ext': '.md'}]
" let g:vim_markdown_folding_disabled = 1

" javascript libaries
let g:used_javascript_libs = 'react,underscore'
