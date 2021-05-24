" General settings
syntax on
filetype plugin on
set termguicolors
set number relativenumber
set clipboard=unnamedplus
set nohlsearch
set hidden
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=10
set signcolumn=yes
set inccommand=nosplit

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
Plug 'mhinz/vim-startify' " start screen

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'glepnir/lspsaga.nvim'

" Autocomplete
Plug 'sirver/ultisnips'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/nvim-compe'

" Debugging & Testing
Plug 'puremourning/vimspector'
Plug 'sagi-z/vimspectorpy', { 'do': { -> vimspectorpy#update() } }
Plug 'vim-test/vim-test'

" Python
Plug 'jmcantrell/vim-virtualenv' 
Plug 'psf/black', { 'branch': 'stable' }

" LaTeX
Plug 'lervag/vimtex'

" Statusbar
Plug 'akinsho/nvim-bufferline.lua'
Plug 'hoob3rt/lualine.nvim'


" Git 
Plug 'tpope/vim-fugitive'
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

" Colorschem
Plug 'ghifarit53/tokyonight-vim' 
Plug 'tiagovla/tokyodark.nvim'
Plug 'christianchiarulli/nvcode-color-schemes.vim'

" Misc
Plug 'junegunn/goyo.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'jessedhillon/vim-easycomment'
Plug 'airblade/vim-rooter'
Plug 'psliwka/vim-smoothie'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

" lua stuff
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'

call plug#end()
" Terminal 
tnoremap <Esc> <C-\><C-n>

" Notes
let g:notes_directories = ['~/Documents/Notes']
vmap <Leader>ns :NoteFromSelectedText<CR>
 
" Snippets
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" Python
"Test Configuration
let  pdb_str = nvim_replace_termcodes("oimport pdb; pdb.set_trace()<ESC>", v:true, v:false, v:true)
nnoremap <leader>pdb :call nvim_feedkeys(pdb_str, 'n', v:true)<CR>
let test#python#pytest#options = {
			\ 'nearest': '-o addopts="" --pdb',
			\ 'file': '-o addopts="" --pdb'
			\}
" LSP
"   Python
lua require('lsp.python')
lua require('lsp.latex')
lua require('lsp.json')
lua require('lsp.bash')

" LSP general
lua require('lsp.config')
lua require('lsp.general')

" Autocomplete
lua require('autocomplete')

" LaTeX
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
"     Spelling
autocmd FileType latex setlocal spell
autocmd FileType latex set spelllang=ger,en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>

" Fugitive Git Commands
nnoremap <leader>gm :Gdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>
nnoremap <leader>gga :Gw<CR>
nnoremap <leader>ggc :Git commit<CR>
nnoremap <leader>ggp :Git push<CR>
nnoremap <leader>gcp :Git checkout -<CR>

" Colorscheme
"let g:tokyodark_enable_italic_comment = 1
"let g:tokyodark_enable_italic = 1
"let g:tokyodark_color_gamma = "1.0"
colorscheme lunar
"hi Normal ctermbg=NONE guibg=NONE

" Statusbar :
lua << EOF
	require'lualine'.setup{
		options = {theme = 'nord'}
	}
EOF
lua << EOF
require'bufferline'.setup{
  options = {
    buffer_close_icon= '',
    modified_icon = '●',
    close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is deduplicated
    tab_size = 18,
    diagnostics = false, 
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "thick", 
    always_show_bufferline = true,
    sort_by = 'directory',
  }
}
EOF

" Search
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fw <cmd>lua require('telescope.builtin').grep_string()<cr>

" Telescope LSP 
nnoremap <leader>gr <cmd>lua require('telescope.builtin').lsp_references()<cr>

" Telescope Git
nnoremap <leader>ggs <cmd>lua require('telescope.builtin').git_status()<cr>
nnoremap <leader>gsc <cmd>lua require('telescope.builtin').git_commits()<cr>
nnoremap <leader>ggb <cmd>lua require('telescope.builtin').git_branches()<cr>

"Debugger
nnoremap <leader>dbg :call vimspector#Launch()<CR>

" Testing
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>tv :TestVisit<CR>
nmap <silent> <leader>ta :TestSuite<CR>

" Misc
"  Comment
vmap <silent> <C-_> :call ToggleCommentVisual()<CR>
nmap <silent> <C-_> :call ToggleCommentLine()<CR>

" Filetree
nnoremap <C-n> :NvimTreeToggle<CR>

" Start screen config
let g:webdevicons_enable_startify = 1
let g:startify_use_env = 1
let g:startify_lists = [
	\{'type': 'sessions', 'header': ['	Sessions']},
	\{'type': 'files', 'header': ['	Most Recent Files']},
	\{'type': 'bookmarks', 'header': ['	Bookmarks']},
	\]

let g:startify_bookmarks = [
	\'~/.config/nvim/init.vim',
	\]

