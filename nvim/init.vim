" Plugins
call plug#begin(stdpath('data') . '/plugged')

Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'hrsh7th/nvim-cmp'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-telescope/telescope.nvim'

Plug 'tpope/vim-fugitive'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'mhartington/formatter.nvim'

Plug 'folke/trouble.nvim'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install'  }

call plug#end()

" Relative numbers
set number 

" Hightlight line
set cursorline
highlight CursorLine cterm=bold ctermbg=236| " 236 means a color in 256 color scale

" Tab size
set expandtab
set tabstop=2
set shiftwidth=2

"autosave
:au FocusLost * :wa

"leader key
let mapleader = " "

hi Pmenu ctermbg=240


