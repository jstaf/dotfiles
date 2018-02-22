" basic config
set number
set shiftwidth=4
set tabstop=4
set softtabstop=0
set expandtab
set smarttab

" enable mouse support
" omg omg omg where has this been all my life!
"set mouse=a

" vim plug plugins section
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'davidhalter/jedi-vim' " python autocomplete
Plug 'ervandew/supertab'	" enable tab autocomplete
call plug#end()

" colorscheme configs
set background=dark
let g:gruvbox_italic=0
let g:gruvbox_contrast_dark='medium'
colorscheme gruvbox

" enable airline, with server compatibility fixes
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" gitgutter config
let g:gitgutter_override_sign_column_highlight = 0
" highlight SignColumn ctermbg=none

" enable snakemake syntax highlighting
au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead *.rules set syntax=snakemake
au BufNewFile,BufRead *.snakefile set syntax=snakemake
au BufNewFile,BufRead *.snake set syntax=snakemake

" Python-only spaces to tabs
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 smarttab softtabstop=0

" makefiles will use tabs
autocmd FileType make set noexpandtab

" if you forget to open a file with sudo, use w!!
cmap w!! w !sudo tee % > /dev/null

" fortran options
let fortran_free_source=1
let fortran_more_precise=1
let fortran_do_enddo=1

" youcompleteme config
let g:ycm_show_diagnostics_ui=1

" jedi vim doc window is now at bottom instead of top
set splitbelow

