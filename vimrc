""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" The user configuration file for vim.
"""""""""""""""""""""""""""""""""""""""
" Contents:
"
"           - Mappings
"           - Plugins
"           - Colorscheme
"           - Autocommands
"           - Abbreviations
"
"""""""""""""""""""""""""""""""""""""""
" TODO: don't hardcode paths
" TODO: find out how to select text in tridactyl
" TODO: vimscript that opens and closes a python split with c-x

" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For easy access to the main configuration files the <leader To make access to
" the main configuration easy the following key bindings are provided where the
" key bindings are between 4 characters wide.
"
" The concept behind them is the edit-mapping* <leader>e<X><Y>
"
"   <X> first letter of the source file <Y> possible subfile
"
" here are the mappings:
"""""""""""""""""""""""""""""""""""""""
" SYSTEM:
"       ec : Access your cronjobs (man crontab)
"
" VIM:
"       ee : ~ /.config/vim/vimrc 
"       evf: ~ /.config/vim/filetypes.vim 
"       evp: ~ /.config/vim/plugins.vim 
"       evh: ~ /.config/vim/functions.vim 
"       ey : ~ /.config/vim/global_ycm_config.py
"
" TERMINAL:
"       ea : ~ /.config/alacritty/alacritty.yml 
"       ebb: ~ /.config/bash/.bashrc 
"       eba: ~ /.config/bash/alias 
"       ebp: ~ /.config/bash/bash_profile 
"       ebh: ~ /.config/bash/helper
"       el : ~ /.config/liquidprompt/liquidpromptrc 
"
" SCREEN:
"       es : ~ /.config/screen/screenrc 
"
" XORG_DESKTOP:
"       exi : ~ /.config/xorg/xinitrc
"       exm : ~ /.config/xorg/xmodmap
"       exr : ~ /.config/xorg/xresources
"       ei : ~ /.config/i3/config
"
" SWAY_DESKTOP:
"       ew : ~ /.config/sway/config
"
" APPLICATIONS:
"       et : ~ /.config/tridactyl/tridactylrc 
"
" *Exceptions may occur
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"With a map leader it's possible to do extra key combinations
let mapleader=","

" Configuration interface
"""""""""""""""""""""""""""""""""""""""
"" Access this file (exception for easy access to vimrc)
nnoremap <leader>ee :e $VIMRC<CR>

" Access the vim helper functions (edit vim filetypes)
nnoremap <leader>evf :e $VIM_FILETYPES<CR>

" Access the vim plugin configuration (edit vim plugins)
nnoremap <leader>evp :e $VIM_PLUGINS<CR>

" Access the vim helper functions (edit vim helper)
nnoremap <leader>evh :e $VIM_HELPER<CR>

" Access alacritty configuration (edit alactritty)
nnoremap <leader>ea :e $ALACRITTYRC<CR>

" Access ~/.bashrc (exception - second 'b' because of other eb<?> binds)
nnoremap <leader>ebb :e $BASHRC<CR>

" Access local alias definitions (edit bash alias)
nnoremap <leader>eba :e $BASH_ALIAS<CR>

" Access ~/.bash_profile
nnoremap <leader>ebp :e $BASH_PROFILE<CR>

" Access bash helper functions
nnoremap <leader>ebh :e $BASH_HELPER<CR>

" Access cronjobs (pacman -S cronie)
nnoremap <leader>ec :!crontab -e<CR>

" Access gnu-screen configuration
nnoremap <leader>es :e $SCREENRC<CR>

" Access the sway window manager config
nnoremap <leader>ew :e $SWAYRC<CR>

" Access the sway window manager config
nnoremap <leader>ei :e $I3RC<CR>

" Access configuration for firefox plugin tridactyl
nnoremap <leader>et :e $TRIDACTYLRC<CR>

" Access the liquidprompt rc
nnoremap <leader>el :e $LIQUIDPROMPTRC<CR>

" Access the xinitrc
nnoremap <leader>exi :e $XINITRC<CR>

" Access the xmodmap
nnoremap <leader>exm :e $XMODMAP<CR>

" Access the xmodmap
nnoremap <leader>exm :e $XRESOURCES<CR>

" Access the ycm global debug conf
nnoremap <leader>ey :e $VIM_YCM<CR>

nnoremap <leader>xp :e ~/.cache/python/tmp.py<CR>


"""""""""""""""""""""""""""""""""""""""
" global
"""""""""""""""""""""""""""""""""""""""
" Clipboard support
" wayland:
" xnoremap "+y y:call system("wl-copy", @")<cr>
" nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
" nnoremap "+p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p

" Remove the Windows ^M - when the encodings gets messed up
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" show a list of all sourced files (l)ist (s)ource
noremap <leader>ls :scriptnames<cr>

"
"""""""""""""""""""""""""""""""""""""""
" Normal mode
"""""""""""""""""""""""""""""""""""""""
" Reload this file
nmap <leader>r :source ~/.vimrc<CR>

"" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z

" Fast saving
nmap <leader>w :w!<cr>

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Toggle paste mode on and off
nmap <leader>pp :setlocal paste!<cr>

" Map <Space> to / (search) and
nmap <space> /

" Map Ctrl-<Space> to ? (backwards search)
nmap <c-space> ?

" Disable highlight when <leader><cr> is pressed
nmap <silent> <leader><cr> :noh<cr>

" Remap VIM 0 to first non-blank character
nmap 0 ^

" Smart way to move between windows
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" Create a new tab
nmap <leader>tn :tabnew<cr>

" Close all tabs except this one
nmap <leader>to :tabonly<cr>

" Close the current tab
nmap <leader>tc :tabclose<cr>

" Move the current tab page to after tab page N.
nmap <leader>tm :tabmove


"""""""""""""""""""""""""""""""""""""""
" Insert mode
"""""""""""""""""""""""""""""""""""""""
" Convenient escape (alternatives are: <M-[h,j,k,l]>)
imap jj <ESC>


"""""""""""""""""""""""""""""""""""""""
" Command mode
"""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
" it deletes everything until the last slash
cno $q <C-\>eDeleteTillSlash()<cr>


"""""""""""""""""""""""""""""""""""""""
" Visual mode
"""""""""""""""""""""""""""""""""""""""
" pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Move a line of text using ALT+[jk] or Command+[jk] on mac
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z


"""""""""""""""""""""""""""""""""""""""
" Misc
"""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""
" Tabs and windows
"""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Move to next misspelled word after the cursor.
map <leader>sn ]s

" Like "]s" but search backwards,
map <leader>sp [s

" Add word under the cursor as a good word
map <leader>sa zg

" Show possible suggestions.
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" >> Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim settings go here
"""""""""""""""""""""""""""""""""""""""
" " environment
let vimrc='~/.vimrc'                            " Location of this file
let pluginpath='~/.config/vim/plugins'          " Set the plugin path
set viminfo=%,<800,'10,/50,:100,h,f0,n~/.cache/vim/info/viminfo
set runtimepath+=~/.config/vim                  " Set vims runtime path
set shortmess=at
set nocompatible                                " compatibili

" General
set backspace=eol,start,indent                  " Configure backspace
set number                                      " Show line numbers
set autoread                                    " Autoread on file changed
set expandtab                                   " Use spaces instead of tabs
set smarttab                                    " Be smart when using tabs ;)
set shiftwidth=4                                " 1 tab == 4 spaces
set tabstop=4                                   " 1 tab == 4 spaces
set lbr                                         " Linebreak on 500 characters
set ai                                          " Enable auto ident
set si                                          " Enable smart indent
set nowrap                                      " Disable line wrapping

set tw=79                                       " set textwidth
set colorcolumn=+1                              " line at the end of tw

" Command mode
set history=1000                                " Command line history
set wildmenu
set hidden
set cmdheight=2
set wildignore=*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set whichwrap+=<,>,h,l

" Appearence
set t_Co=256                                    " Enable 256 colors
set so=12                                       " Horizontal scroll border
set showmatch                                   " Highlight brackets
set mat=3                                       " match blink frequency
set noerrorbells                                " No error sounds
set novisualbell                                " Deactivate visual bell
set t_vb=                                       " Deactivate visual bell

" Search and highlights
set incsearch                                   " Modern search behaviour
set ignorecase                                  " Ignore case when searching
set smartcase
set hlsearch                                    " Highlight search results
set magic                                       " Regular expressions magic

" Files
set nobackup                                    " no backup file clutter
set nowb                                        " no backup on write
set noswapfile                                  " no swap files
set encoding=utf8                               " Set the encoding
set langmenu=en                                 " Menu language
set ffs=unix,dos,mac

" Enable infinite undo
try
  set undodir=~/.cache/vim/undo/
  set undofile
catch
endtry

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry
" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif



"""""""""""""""""""""""""""""""""""""""
" >> Plugins
"""""""""""""""""""""""""""""""""""""""
" Source plugin specific configuration
source $VIM_PLUGINS

" Activate the filetype plugin
filetype plugin on

" Enable specific indent files for filetypes
filetype indent on

" " Source filetype specific configuration
source $VIM_FILETYPES

" location of additional vimrcs
source $VIM_HELPER

" This Vim script deletes all the menus, so that they can be redefined.
" Warning: This also deletes all menus defined by the user!
" source $VIMRUNTIME/delmenu.vim

" Vim support file to define the default menus
" You can also use this as a start for your own set of menus.
" source $VIMRUNTIME/menu.vim


"""""""""""""""""""""""""""""""""""""""
" Colorscheme
"""""""""""""""""""""""""""""""""""""""
" IMPORTANT: this must come after loading the plugins
" colorscheme wal
syntax enable


"""""""""""""""""""""""""""""""""""""""
" Autocommands
"""""""""""""""""""""""""""""""""""""""
" Plugin independet autocommands go
" here.
"""""""""""""""""""""""""""""""""""""""
" autoreload ~/.vimrc when ~/.vimrc
if has('autocmd')
    augroup reload_vimrc
        autocmd!
        autocmd! BufWritePost $MYVIMRC nested source %
    augroup end
endif


"""""""""""""""""""""""""""""""""""""""
" Abbreviations
"""""""""""""""""""""""""""""""""""""""
ab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
