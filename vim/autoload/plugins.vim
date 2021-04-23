"" Load the Plugins for All the Things
"
"
"
Plug 'arcticicestudio/nord-vim' " My favorite theme
" Plug 'itchyny/lightline.vim'    " Status line
Plug 'vim-airline/vim-airline'  " Another status line
Plug 'dense-analysis/ale'       " Linting asyncronously
" Plug 'preservim/nerdtree'       " I don't use this one anymore, I think.
Plug 'tpope/vim-surround'       " Makes it easy to add brackets and stuff, (TODO: Write down the commands for this and actually use it)
Plug 'tpope/vim-commentary'     " Makes it easy to comment things
Plug 'sheerun/vim-polyglot'     " Syntax highlighting
Plug 'tpope/vim-fugitive'       " Git wrapper for vim
Plug 'morhetz/gruvbox'           " Vim Colorscheme
Plug 'direnv/direnv'            " Direnv and vim integrations
Plug 'JamshedVesuna/vim-markdown-preview'      " preivew md files with ctrl-p
Plug 'christoomey/vim-tmux-navigator'   " seamless navigation between vim and tmux
"
"
"" Plug in Settings
"
" ALE
let g:ale_fix_on_save = 1           " Fix files when they are saved.
let g:ale_fixers = {
                        \     'python': ['black', 'isort','remove_trailing_lines', 'trim_whitespace'],


                        \}
nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALENext<cr>
" Vim-Polyglot
let g:python_highlight_all=1
""
""Lightline
"let g:lightline = {
"    \ 'colorscheme': 'nord',
"    \ }
