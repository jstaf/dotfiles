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

" default text width at 90 chars, no autowrap
set textwidth=90
set formatoptions-=t
set wrapmargin=0

" highlight when we're over 90
augroup vimrc_autocmds
  autocmd BufEnter * highlight OverLength ctermbg=darkgrey guibg=#592929
  autocmd BufEnter * match OverLength /\%90v.*/
augroup END

" enable mouse support
set mouse=a

"""""""""""""""""""""""""""""""""""""""
" vim plug plugins
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'rodjek/vim-puppet'
Plug 'pearofducks/ansible-vim'
Plug 'hashivim/vim-terraform'
call plug#end()

" colorscheme configs
set background=dark
let g:gruvbox_italic=0
let g:gruvbox_contrast_dark='soft'
let g:onedark_termcolors=256
colorscheme gruvbox

" enable airline, with server compatibility fixes
set laststatus=2
let g:airline#extensions#tabline#enabled=1

" gitgutter config
set updatetime=100
set signcolumn=yes
let g:gitgutter_set_sign_backgrounds=1
" most of these are gruvbox-specific
highlight SignColumn            ctermbg=236
highlight GitGutterAdd          ctermfg=10
highlight GitGutterChange       ctermfg=11
highlight GitGutterDelete       ctermfg=9
highlight GitGutterChangeDelete ctermfg=13

" Snakemake syntax highlighting
au BufNewFile,BufRead Snakefile set syntax=snakemake

" Python formatting
autocmd BufWritePre *.py execute ':Black'

" makefiles will use tabs
autocmd FileType make set noexpandtab

" yaml formatting
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab indentkeys-=<:>

" terraform formatting
let g:terraform_align=1
let g:terraform_fmt_on_save=1

