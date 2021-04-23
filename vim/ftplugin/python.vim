" Vim filetype plugin
" Language:             Python
" Maintainer:           Nick Hamm
" Last Change:          2020 Aug 24
"
"
" Indentation settings
set tabstop=8  " Set tabstops to eight characters wide
set expandtab  " Converts tabs to white space
set shiftwidth=4  " Sets the autoindent to 4 characters
set softtabstop=4  " Tab key indents 4 spaces

" Provide an indicator for the line length.
setlocal colorcolumn=85
hi colorcolumn ctermbg=1

" Folding settings
" set foldmethod=indent
" nnoremap <space> za
" vnoremap <space> zf
set foldnestmax=2
" colorscheme gruvbox

" ALE
let b:ale_fixers = ['black', 'isort','remove_trailing_lines', 'trim_whitespace']
let b:ale_fix_on_save = 1


