set exrc
set guicursor=
set relativenumber
set nu
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set signcolumn=yes
set colorcolumn=80
set completeopt=menuone,noinsert,noselect

call plug#begin('~/.vim/plugged')

Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'tmsvg/pear-tree'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
call plug#end()

colorscheme gruvbox
highlight Normal guibg=none

let mapleader = " "

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup REVAN
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup ENDPlug

:lua << END
    require'lspconfig'.tsserver.setup{}
    require'lspconfig'.rls.setup{}
END

let g:completion_matchin_strategy_list = ['exact', 'substring', 'fuzzy']
lua require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.rls.setup{on_attach=require'completion'.on_attach}
