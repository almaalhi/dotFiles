:set relativenumber
:set nu
:set nohlsearch
:set cmdheight=2
:set tabstop=4
:set softtabstop=4
:set shiftwidth=4
:set smartindent
:set signcolumn=yes
:set scrolloff=8 " Keep 8 lines below the cursor
:set updatetime=300
:set encoding=utf-8
:set hidden
:set nowrap
:set noshowmode
:let mapleader = " "

" VIM-Plug plugins list
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Language packs for Vim
Plug 'sheerun/vim-polyglot'

Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'alvan/vim-closetag'

Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

Plug 'preservim/nerdcommenter'

" Fuzzy Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'crusoexia/vim-monokai'
Plug 'ghifarit53/tokyonight-vim'

" NERDTree and git add-ons
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
" Plug 'scrooloose/nerdtree-project-plugin' **Commented out on 9/18/2021 due
" to bug causing error**

call plug#end()


"--------------------------------------------------------------------------------------------------
"-------------------------------------- General remaps --------------------------------------------
"--------------------------------------------------------------------------------------------------

" Quick save and quit
nnoremap <leader>s :w<cr>
nnoremap <leader>w :q<cr>

" TAB moves to next buffer
nnoremap <TAB> :bnext<CR>

" SHIFT-TAB moves to previous buffer
nnoremap <S-TAB> :bprevious<CR>

" Use control-c instead of escape
nnoremap <C-c> <Esc>


"--------------------------------------------------------------------------------------------------
"-------------------------------------- Theme Settings  -------------------------------------------
"--------------------------------------------------------------------------------------------------

:set termguicolors
:syntax on
let g:tokyonight_style = 'storm' " available: night, storm
:colorscheme tokyonight


" Airline settings
let g:airline#extensions#tabline#enabled = 1


"--------------------------------------------------------------------------------------------------
"-------------------------------------- NERDtree --------------------------------------------------
"--------------------------------------------------------------------------------------------------

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Key remaps for split/vsplit (To match more closely with FZF)
let NERDTreeMapOpenVSplit='v'
let NERDTreeMapOpenSplit='x'


"--------------------------------------------------------------------------------------------------
"------------------------------  WINDOW AND TAB MANAGEMENT/MOVEMENT  ------------------------------
"--------------------------------------------------------------------------------------------------

" Move between windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" Make current window only window
nnoremap <leader>o :wincmd o<CR>


" Navigate previous/next tab
nnoremap <leader>y gT
nnoremap <leader>u gt

" Resize splits quickly
nnoremap <C-j> :res +2<CR>
nnoremap <C-h> :res -2<CR>

nnoremap <C-k> :vert res +6<CR>
nnoremap <C-l> :vert res -6<CR>


"--------------------------------------------------------------------------------------------------
"---------------------------------------  COC  ----------------------------------------------------
"--------------------------------------------------------------------------------------------------

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Prettier format on save
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Tab completion for snippets
let g:coc_snippet_next = '<tab>'
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Move position for placeholders
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart



" alvan/close-tag settings
let g:closetag_filenames = '*.html'
let g:closetag_filetypes = 'html,jsx,javascript'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)

let g:closetag_emptyTags_caseSensitive = 0

" Disables auto-close if not in a "valid" region (based on filetype)

let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Should change <CR> to close tag and auto-format
 inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"--------------------------------------------------------------------------------------------------
"----------------------------------FUZZY FINDER CONFIG --------------------------------------------
"--------------------------------------------------------------------------------------------------

" Config fuzzi finder
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit'
  \}


"--------------------------------------------------------------------------------------------------
"------------------------------------  SEARCH REMAPS  ---------------------------------------------
"--------------------------------------------------------------------------------------------------

"Search inside the files in current directory
nnoremap <Leader>pp :Rg<SPACE>
"Search current buffer
nnoremap <Leader>b :Buffers<CR>
"Search files by name in current directory
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>p :Files<CR>



"--------------------------------------------------------------------------------------------------
"----------------------------------  Markdown Preview  --------------------------------------------
"--------------------------------------------------------------------------------------------------


" Set default browser for Markdown Preview
let g:mkdp_browser = 'firefox'

" Start liveserver
nnoremap <C-t> :Bracey <CR>
nnoremap <C-g> :BraceyStop <CR>



"--------------------------------------------------------------------------------------------------
"----------------------------------  Hexokinase Colorizer  ----------------------------------------
"--------------------------------------------------------------------------------------------------

let g:Hexokinase_highlighters = [ 'backgroundfull' ]
