source $VIMRUNTIME/defaults.vim
:set relativenumber
:set nu
:set hls
:set cmdheight=2
:set nohlsearch
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
:let mapleader = " "

" VIM-Plug plugins list
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'honza/vim-snippets'
Plug 'preservim/nerdcommenter'
Plug 'alvan/vim-closetag'

" Fuzzy Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'crusoexia/vim-monokai'

" NERDTree
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdtree-project-plugin'

call plug#end()


" Theme settings
syntax on
colorscheme monokai
set termguicolors

"--------------------------------------------------------------------------------------------------
"-------------------------------------- General remaps --------------------------------------------
"--------------------------------------------------------------------------------------------------

" Quick save and quit
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>


"--------------------------------------------------------------------------------------------------
"-------------------------------------- NERDtree --------------------------------------------------
"--------------------------------------------------------------------------------------------------

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>


"--------------------------------------------------------------------------------------------------
"------------------------------  WINDOW MANAGEMENT/MOVEMENT  --------------------------------------
"--------------------------------------------------------------------------------------------------

" Move between windows
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
" Make current window only window
nnoremap <leader>o :wincmd o<CR>

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
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

" Prettier format on save
command! -nargs=0 Prettier :CocCommand prettier.formatFile
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <C-space> coc#refresh()

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
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart


"--------------------------------------------------------------------------------------------------
"----------------------------------FUZZY FINDER CONFIG --------------------------------------------
"--------------------------------------------------------------------------------------------------

"Config fuzzi finder
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-o': 'vsplit'
  \}

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

let g:vrfr_rg = 'true'


"--------------------------------------------------------------------------------------------------
"------------------------------------  SEARCH REMAPS  ---------------------------------------------
"--------------------------------------------------------------------------------------------------

"Search inside the files in current directory
nnoremap <Leader>s :Rg<SPACE>
"Search current buffer
nnoremap <Leader>b :Buffers<CR>
"Search files by name in current directory
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>p :Files<CR>


"--------------------------------------------------------------------------------------------------
"----------------------------------  HTML vim-closetag --------------------------------------------
"--------------------------------------------------------------------------------------------------

let g:closetag_filenames = '*.html'
let g:closetag_filetypes = 'html,jsx,javascript'

" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 0
" Disables auto-close if not in a valid region (based on filetype)
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'


"--------------------------------------------------------------------------------------------------
"----------------------------------  Navigation Remaps --------------------------------------------
"--------------------------------------------------------------------------------------------------

" Navigate previous/next tab
nnoremap <Leader>y gT
nnoremap <Leader>u gt

