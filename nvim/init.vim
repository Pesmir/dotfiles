" General settings
syntax on
set termguicolors
set number relativenumber
set clipboard=unnamedplus
filetype on
filetype plugin on


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
Plug 'mhinz/vim-startify' " start screen
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Autocompletion and linting

" LSP
Plug 'neovim/nvim-lspconfig'

" Python
Plug 'psf/black', { 'branch': 'stable' }
Plug 'fisadev/vim-isort'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git 
Plug 'ThePrimeagen/git-worktree.nvim'
Plug 'tpope/vim-fugitive'
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

" Misc
Plug 'ghifarit53/tokyonight-vim' " Colorschem
Plug 'airblade/vim-rooter'
Plug 'psliwka/vim-smoothie'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

" lua stuff
" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

" Notes
let g:notes_directories = ['~/Documents/Notes']
vmap <Leader>ns :NoteFromSelectedText<CR>
 
" Colorscheme
let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1
colorscheme tokyonight
hi Normal ctermbg=NONE guibg=NONE
" Autocompletion
" Complete with tab instead of Enter
inoremap <expr> <tab> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Python
" Python LSP
lua << EOF
require'lspconfig'.pyright.setup{}
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { "pyright" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF

let g:vim_isort_map = '<C-i>' " sorting of imports with CTRL-i in visual mode
let g:vim_isort_config_overrides = {
			\'include_trailing_comma': 1,
			\'multi_line_output': 3,
			\'force_grid_wrap': 0,
			\'use_parentheses': 'True',
			\'ensure_newline_before_comments': 'True',
			\'line_length': 88}
" Fugitive Git Commands
nnoremap <leader>gm :Gdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>
nnoremap <leader>gga :Gw<CR>
nnoremap <leader>ggc :Git commit<CR>
nnoremap <leader>ggp :Git push<CR>
nnoremap <leader>gcp :Git checkout -<CR>

" Statusbar :
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='tokyonight'
let g:airline_powerline_fonts = 1
" Search
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fw <cmd>lua require('telescope.builtin').grep_string()<cr>

" Telescope LSP 
nnoremap <leader>gr <cmd>lua require('telescope.builtin').lsp_references()<cr>

" Telescope Git
nnoremap <leader>gs <cmd>lua require('telescope.builtin').git_status()<cr>
nnoremap <leader>gc <cmd>lua require('telescope.builtin').git_commits()<cr>
nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches()<cr>
nnoremap <leader>gw <cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>



" Start screen config
let g:startify_lists = [
	\{'type': 'sessions', 'header': ['	Sessions']},
	\{'type': 'files', 'header': ['	Most Recent Files']},
	\{'type': 'bookmarks', 'header': ['	Bookmarks']},
	\]

let g:startify_bookmarks = [
	\'~/.config/nvim/init.vim',
	\]

