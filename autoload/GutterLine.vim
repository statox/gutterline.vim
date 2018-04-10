function! GutterLine#PlaceLineSign()
    " If the user wants to disable the plugin temporarily
    " remove the signs in the gutter
    if (exists('g:GutterLineDisable') && g:GutterLineDisable==1)
        sign unplace 21744
        sign unplace 21745
        return
    endif

    " Don't set a sign for the filetypes in g:GutterLineIgnore
    if (exists('g:GutterLineIgnore') && !empty(g:GutterLineIgnore) && index(g:GutterLineIgnore, &filetype) > -1 )
        return
    endif

    " Define the sign IDs if they don't exist
    if !exists('s:signToPlace')
        let s:signToPlace=21744
        let s:signToUnplace=21745
    endif

    " Get the position of the cursor
    let s:currentPosition = [bufnr('%'), line('.')]

    if !exists('s:previousPosition')
        let s:previousPosition = s:currentPosition
    endif

    " If the buffer or the line number has changed move the lign sign
    if ( s:currentPosition[0] != s:previousPosition[0] || s:currentPosition[1] != s:previousPosition[1] )
        if (bufexists(s:currentPosition[0]))
            execute 'sign place ' . s:signToPlace . ' name=GutterLine line=' . s:currentPosition[1] . ' buffer=' . s:currentPosition[0]
        endif
        if (bufexists(s:previousPosition[0]))
            execute 'sign unplace ' . s:signToUnplace . ' buffer=' . s:previousPosition[0]
        endif

        let s:previousPosition = s:currentPosition

        if s:signToPlace == 21745
            let s:signToPlace=21744
            let s:signToUnplace=21745
        else
            let s:signToPlace=21745
            let s:signToUnplace=21744
        endif
    endif
endfunction

