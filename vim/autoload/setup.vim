
function! setup#CreateTempFolder()
        if empty(glob('$XDG_CACHE_HOME/vim/tmp'))
                silent !mkdir -p $XDG_CACHE_HOME/vim/tmp
        endif
endfunction
