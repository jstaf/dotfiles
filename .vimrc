" basic config
set number
set shiftwidth=4
set tabstop=4
set softtabstop=0
set expandtab
set smarttab
set splitbelow
set splitright
set noswapfile

" enable mouse support
set mouse=a

"""""""""""""""""""""""""""""""""""""""
" vim plug plugins
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'puppetlabs/puppetsyntax-vim'
Plug 'pearofducks/ansible-vim'
Plug 'hashivim/vim-terraform'
call plug#end()

" colorscheme configs
set background=dark
let g:gruvbox_italic=0
let g:gruvbox_contrast_dark='soft'
colorscheme gruvbox

" enable airline, with server compatibility fixes
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" gitgutter config
let g:gitgutter_override_sign_column_highlight = 0
" highlight SignColumn ctermbg=none

"""""""""""""""""""""""""""""""""""""""""""""
" enable snakemake syntax highlighting
au BufNewFile,BufRead Snakefile set syntax=snakemake

" Python-only spaces to tabs
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 smarttab softtabstop=0

" makefiles will use tabs
autocmd FileType make set noexpandtab

" yaml formatting
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab indentkeys-=<:>

" terraform formatting
let g:terraform_align=1
let g:terraform_fmt_on_save=1

