" General settings
syntax on
set termguicolors
set number relativenumber
set clipboard=unnamedplus
filetype on


" Define Leader Key as space
let mapleader=" "

" Disable arrow keys until you learn to use vim correct
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <backspace> <Nop>

" Install Plugins
call plug#begin('~/.vim/plugged')
Plug 'jessedhillon/vim-easycomment'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'fisadev/vim-isort'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'psliwka/vim-smoothie'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fancy Fuzzy Search
Plug 'junegunn/fzf.vim'
Plug 'ghifarit53/tokyonight-vim' " Colorschem
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify' " start screen
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocompletion and linting
Plug 'airblade/vim-rooter'
call plug#end()

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight
hi Normal ctermbg=NONE guibg=NONE
" Autocompletion
" Complete with tab instead of Enter
inoremap <expr> <tab> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Python
let g:vim_isort_map = '<C-i>' " sorting of imports with CTRL-i in visual mode
let g:vim_isort_config_overrides = {
			\'include_trailing_comma': 1,
			\'multi_line_output': 3,
			\'force_grid_wrap': 0,
			\'use_parentheses': 'True',
			\'ensure_newline_before_comments': 'True',
			\'line_length': 88}
" Fugitive Conflict Resolution
nnoremap <leader>gm :Gdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" Statusbar :
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='tokyonight'
let g:airline_powerline_fonts = 1
" Search
nmap <C-p> :GFiles<CR>
nmap <C-f> :BLines<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Start screen config
let g:startify_lists = [
	\{'type': 'sessions', 'header': ['	Sessions']},
	\{'type': 'files', 'header': ['	Most Recent Files']},
	\{'type': 'bookmarks', 'header': ['	Bookmarks']},
	\]

let g:startify_bookmarks = [
	\'~/.config/nvim/init.vim',
	\]

