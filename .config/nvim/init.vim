syntax on

" Line numbers
set number relativenumber

" Highlights
" -- Rulers
set colorcolumn=80,120
highlight ColorColumn ctermbg=1 guibg=#8888ff
" -- Highlighted Yank
highlight HighlightedyankRegion cterm=reverse gui=reverse

call plug#begin('~/.vim/plugged')

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'machakann/vim-highlightedyank'

" Utilities
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()
