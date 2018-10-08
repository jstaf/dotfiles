" basic config
set number
set shiftwidth=4
set tabstop=4
set softtabstop=0
set expandtab
set smarttab
set splitbelow
set splitright

" enable mouse support
"set mouse=a

"""""""""""""""""""""""""""""""""""""""
" vim plug plugins
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'davidhalter/jedi-vim' " python autocomplete
Plug 'ervandew/supertab'	" enable tab autocomplete
Plug 'puppetlabs/puppet-syntax-vim'
call plug#end()

" colorscheme configs
set background=dark
let g:gruvbox_italic=0
let g:gruvbox_contrast_dark='medium'
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

" youcompleteme config
let g:ycm_show_diagnostics_ui=1

