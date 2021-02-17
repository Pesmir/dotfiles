syntax on
set termguicolors
set number relativenumber
" Shared Clipboard
set clipboard=unnamedplus
filetype on

autocmd FileType c setlocal shiftwidth=2 tabstop=2 noexpandtab
" Define Leader Key as space
let mapleader=" "

" Disable Arrow keys in Normal mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Install Plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-syntastic/syntastic'
Plug 'jiangmiao/auto-pairs'
Plug 'morhetz/gruvbox'
Plug 'alfredodeza/pytest.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fancy Fuzzy Search
Plug 'junegunn/fzf.vim'
Plug 'joshdick/onedark.vim' " Colorschem
Plug 'mhinz/vim-startify' " start screen
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocompletion and linting
Plug 'airblade/vim-rooter'
call plug#end()

colorscheme gruvbox
" Autocompletion
" Complete with tab instead of Enter
" inoremap <expr> <tab> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Statusbar :
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1
"Filesearch for git
nmap <C-P> :GFiles<CR>
nmap <C-F> :Lines<CR>
" Code Navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

map <PageDown> 10jzz<CR>
map <PageUp> 10kzz<CR>
set scrolloff=10

" Start screen config
let g:startify_lists = [
	\{'type': 'sessions', 'header': ['	Sessions']},
	\{'type': 'files', 'header': ['	Most Recent Files']},
	\{'type': 'bookmarks', 'header': ['	Bookmarks']},
	\]

let g:startify_bookmarks = [
	\'~/.config/nvim/init.vim',
	\]
