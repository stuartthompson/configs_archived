syntax on

" Line numbers
" -- Relative line numbering
set number relativenumber
" -- Colors (lines: orange, current: yellow)
highlight LineNr ctermfg=3 gui=bold guifg=black
highlight CursorLineNr cterm=bold ctermfg=3

" Rulers
set colorcolumn=80,120
highlight ColorColumn ctermbg=1 guibg=#8888ff

" Tabs
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

" Special Characters (tab, trailing spaces, carriage returns)
highlight SpecialKey ctermfg=3
highlight NonText ctermfg=3
set listchars=trail:␣
set list

" Highlighted Yank
highlight HighlightedyankRegion cterm=reverse gui=reverse

" NetRW
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_winsize = 20

" Plugins (vim-plug)
call plug#begin('~/.vim/plugged')

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'machakann/vim-highlightedyank'

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

" Language support
Plug 'rust-lang/rust.vim'

" Utilities
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

" Plugin Configuration
"
" Markdown Preview
" -- Open MarkdownPreview browser to more than local (lets WSL host see it)
let g:mkdp_open_to_the_world = 1
