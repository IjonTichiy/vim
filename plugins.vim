"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins reside in the $XDG_CONFIG_DIR/vim/plugins/ directory and are
" autoloaded with pathogen.
" For debugging purposes you can disable a single plugin by removing the
" suffix .vim from the plugin directory.
" That is, pathogen only loads plugins which directory names end with .vim
"
" Some usefule plugins include:
"
"   - bufExplorer:
"       access open buffers with <leader>b
"
"   - comfortable-motion:
"       smooth scrolling with <c-d> & <c-u>
"
"   - NERDTree:
"       access directory tree with <leader>nn
"
"
"""""""""""""""""""""""""""""""""""""""
" Contents:
"   
"   1. ) Mappings
"   2. ) Configuration
"
"""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load plugins with pathogen#infect
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load pathogen paths (needed for plugins)
call pathogen#infect('~/.config/vim/plugins/{}.vim')
call pathogen#helptags()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mappings for plugins are 
" provided here.  " For completion 
" some default bindings are explicitly 
" defined here again
"""""""""""""""""""""""""""""""""""""""
" ack
"""""""""""""""""""""""""""""""""""""""
map <leader>ack :Ack


" AutoPairs
"""""""""""""""""""""""""""""""""""""""


" bufExplorer
"""""""""""""""""""""""""""""""""""""""
map <leader>b :BufExplorer<cr>


" comfortable-motion
"""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(-100)<CR>
nnoremap <silent> <C-f> :call comfortable_motion#flick(200)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(-200)<CR>


" Cope
"""""""""""""""""""""""""""""""""""""""
map <leader>cn :cn<cr>
map <leader>cp :cp<cr>
map <leader>cc :botright cope<cr>


" NERDTree
"""""""""""""""""""""""""""""""""""""""
map <leader>nn :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>
map <leader>nb :NERDTreeFromBookmark<Space>


" Tagbar
"""""""""""""""""""""""""""""""""""""""
map <leader>nt :TagbarToggle<cr>


" vim-mru
"""""""""""""""""""""""""""""""""""""""
map <leader>f :MRU<CR>


" yanckstack
"""""""""""""""""""""""""""""""""""""""
nmap <c-p> <Plug>yankstack_substitute_older_paste
nmap <c-n> <Plug>yankstack_substitute_newer_paste


" snipmate
"""""""""""""""""""""""""""""""""""""""
ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>


"""""""""""""""""""""""""""""""""""""""
" ack
"""""""""""""""""""""""""""""""""""""""
vn <silent> gv :call VisualSelection('gv', '')<CR>
vn <silent> <leader>r :call VisualSelection('replace', '')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin behaviour is configured here
"""""""""""""""""""""""""""""""""""""""
" AutoPairs 
"""""""""""""""""""""""""""""""""""""""
let g:AutoPairs={ '(':')', '[':']', '{':'}', "'":"'",  '"':'"', '`':'`'}
    "
let g:AutoPairsShortcutToggle="<leader>ap"

" Airline
"""""""""""""""""""""""""""""""""""""""

" Comfortable-motion
"""""""""""""""""""""""""""""""""""""""


" bufExplorer
"""""""""""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'


"vim_mru_files
"""""""""""""""""""""""""""""""""""""""
let MRU_File="/home/ijon/.cache/vim/mru/vim_mru_files"
let MRU_Max_Entries = 1000


" YankStack
"""""""""""""""""""""""""""""""""""""""
let g:yankstack_yank_keys = ['y', 'd']


" Ack searching and cope displaying
"""""""""""""""""""""""""""""""""""""""
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif


" Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=0


" Nerd Tree
"""""""""""""""""""""""""""""""""""""""
let g:NERDTreeShowHidden=1
let g:NERDTreeBookmaksFile='~/.config/.vim/temp/NERDTreeBookmarks'
let g:NERDTreeIgnore = ['\.pyc$', '__pycache__', '.git']
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize=25
let g:NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI=1
let NERDTREEDirArrows=1


" netrw
"""""""""""""""""""""""""""""""""""""""
let g:netrw_dirhistmax  =10
let g:netrw_dirhistcnt =1
let g:netrw_dirhist_1='/etc/fonts/conf.avail'

" snipmate
"""""""""""""""""""""""""""""""""""""""
let g:snipMate = { 'snippet_version': 1 } 

" surround
"""""""""""""""""""""""""""""""""""""""
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


" Tagbar
"""""""""""""""""""""""""""""""""""""""
let g:TagbarWinSize=25


" Vim grep
"""""""""""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""
" ZenRoom2
"""""""""""""""""""""""""""""""""""""""
let g:user_zen_mode='a'
