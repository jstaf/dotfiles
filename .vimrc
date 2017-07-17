" basic config
set number
set shiftwidth=4
set tabstop=4

" vim plug plugins section
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'davidhalter/jedi-vim' " python autocomplete
Plug 'ervandew/supertab'	" enable tab autocomplete
Plug 'jpalardy/vim-slime'
call plug#end()

" colorscheme configs
set background=dark
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

" enable airline
set laststatus=2
" let g:airline#extensions#tabline#enabled = 1

" enable snakemake syntax highlighting
au BufNewFile,BufRead Snakefile set syntax=snakemake
au BufNewFile,BufRead *.rules set syntax=snakemake
au BufNewFile,BufRead *.snakefile set syntax=snakemake
au BufNewFile,BufRead *.snake set syntax=snakemake

" Python-only spaces to tabs
autocmd FileType python setlocal expandtab tabstop=4 shiftwidth=4 smarttab softtabstop=0

" vim-slime config
let g:slime_target = 'tmux'



