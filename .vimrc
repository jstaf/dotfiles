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

" enable mouse support
set mouse=a

" terminal config
set termwinsize=14x0

"""""""""""""""""""""""""""""""""""""""
" vim plug plugins
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ervandew/supertab'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'rodjek/vim-puppet'
Plug 'pearofducks/ansible-vim'
Plug 'hashivim/vim-terraform'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
call plug#end()

" colorscheme configs
set background=dark
let g:gruvbox_italic=0
let g:gruvbox_contrast_dark='soft'
let g:onedark_termcolors=256
colorscheme gruvbox

" hotkeys
map <C-n> :NERDTreeToggle<CR>
map <C-h> :bp<CR>
map <C-l> :bn<CR>

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

" Python + Snakemake
autocmd BufWritePre *.py execute ':Black'
au BufNewFile,BufRead Snakefile set syntax=snakemake

" golang
let g:go_highlight_functions=1
let g:go_highlight_function_calls=1
let g:go_highlight_function_parameters=1
let g:go_highlight_operators=1
let g:go_highlight_variable_declarations=1
let g:go_highlight_variable_assignments=1
let g:go_highlight_types=1
let g:go_highlight_fields=1
let g:go_highlight_build_constraints=1

" makefiles
autocmd FileType make set noexpandtab

" yaml
autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab indentkeys-=<:>

" terraform formatting
let g:terraform_align=1
let g:terraform_fmt_on_save=1

