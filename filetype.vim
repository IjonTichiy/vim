"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   filetypes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim can detect the type of file that is edited.  This is done by checking the
" file name and sometimes by inspecting the contents of the file for specific
" text.
"
" WARNING: Some plugins are used here.
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""
" Python
"""""""""""""""""""""""""""""""""""""""
highlight def link pythonSelf Special
let python_highlight_all = 1
syn keyword pythonSelf cls
syn keyword pythonSelf self 

"""""""""""""""""""""""""""""""""""""""
" LaTeX
"""""""""""""""""""""""""""""""""""""""
let g:Tex_FormatDependency_dvi = 'dvi,ps,pdf'
let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autocommands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('autocmd')
    aug new_file
        au!
        au BufNewFile *.py put =\"#!/usr/bin/env python\<nl># -*- coding: utf-8 -*-\"|$
        au BufNewFile,BufRead *.jinja set syntax=htmljinja
        au BufNewFile,BufRead *.mako set ft=mako
    aug end

    aug write_file
        if exists('*CleanExtraSpaces')
            autocmd BufWritePre *.txt,*md,*.js,*.py,*.wiki,*.sh,*.coffee call CleanExtraSpaces()
        endif
    aug end

    aug filetype_python
        au!
        au FileType python inoremap <buffer> $r return 
        au FileType python inoremap <buffer> $i import 
        au FileType python inoremap <buffer> $p print 
        au FileType python set cindent
        au FileType python set cinkeys-=0#
        au FileType python set indentkeys-=0#
        au FileType python set tw=79
        au FileType python set colorcolumn=+1
        au FileType python setlocal formatprg=autopep8\ -
        au FileType python map <CR> :!clear; python %<Enter>
        au FileType python map !python % <CR>
        au FileType python map <M-CR> :!clear; pudb %<Enter>
        au FileType python map !pudb % <M-CR>
        au FileType python map <buffer> F :set foldmethod=indent<cr>
        au FileType python syn keyword pythonDecorator True None False self
    aug end

    aug filetype_cpp
        au!
        au FileType cpp set tw=79
        au FileType cpp set colorcolumn=80
        au FileType cpp set foldmethod=syntax
    aug end

    aug filetype_css
        au FileType css set omnifunc=csscomplete#CompleteCSS
    aug end

    aug filetype_tex
        au FileType tex let g:Tex_IgnoreLevel = 7
        au FileType tex let g:Tex_Leader = '='
        au FileType tex TexLet g:Tex_CompileRule_pdf = 'pdflatex -interaction=nonstopmode $*'
        au FileType tex let g:Tex_defaultTargetFormat = 'pdf'
    aug end
endif
