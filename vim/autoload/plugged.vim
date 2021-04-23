" vim:fdm=marker
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""      Vim-Plug Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" This file is used to install Vim-Plug and plug ins for Vim
""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""      List of Plug Ins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" let g: plug_list = [
" \ 'arcticicestudio/nord-vim',
" \ 'vim-airline/vim-airline',
" \ 'dense-analysis/ale',
" \ 'tpope/vim-surround',
" \ 'tpope/vim-commentary',
" \ 'sheerun/vim-polyglot',
" \ 'tpope/vim-fugitive',
" \ 'morhetz/gruvbox',
" \ 'direnv/direnv',
" \ 'JamshedVesuna/vim-markdown-preview',
" \ 'christoomey/vim-tmux-navigator',
" \ ]
""
""
""" Unused Plugins
""
"" Plug 'preservim/nerdtree'       " I don't use this one anymore, I think.
"" Plug 'itchyny/lightline.vim'    " Status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""      Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
""  InstallVimPlug() - Check if VP not installed, if not - install.

function! plugged#InstallVimPlug()
        if empty(glob('$XDG_CONFIG_HOME/vim/autoload/plug.vim'))
                silent !curl -fLo $XDG_CONFIG_HOME/vim/autoload/plug.vim --create-dirs
                        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
                autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif
endfunction

"" InstallPlugIns() - checks what's installed, then installs what's not
function! plugged#InstallPlugIns()
        autocmd VimEnter *
                \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
                        \|   PlugInstall --sync | q
                \| endif
endfunction
""
""" LoadInstalledPlugins() - loads installed plugins
" function! plugged#LoadInstalledPlugins(plug_list)
"         call plug#begin($VIMDIRPATH. '/plugged')
"         for plug in plugs(plug_list)
"                 Plug plug
"         endfor
"         " Plug 'arcticicestudio/nord-vim' " My favorite theme
"         call plug#end()
" endfunction
" call plug#begin($VIMDIRPATH'/plugged')
"""
""" Load the specific configuraton
""
""
""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""      Plug In Settings
""B
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""
""" ALE
"let g:ale_fix_on_save = 1           " Fix files when they are saved.
"let g:ale_fixers = {
"                        \    '*': ['remove_trailing_lines', 'trim_whitespace'],
"                        \ 'python': ['black', 'isort']
"                        \}
"nmap <silent> <leader>aj :ALENext<cr>
"nmap <silent> <leader>ak :ALENext<cr>
""
""" Vim-Polyglot
"let g:python_highlight_all=1
""
"""Lightline
""let g:lightline = {
""    \ 'colorscheme': 'nord',
""    \ }
