"
" VIM main mapping (*: those not default and programed)
" 
set encoding=utf-8
"
"NORMAL mode:
"
" <escape> with jk/kj
imap jk <ESC>
imap kj <ESC>
" j/k move through wrapped lines
nmap k gk
nmap j gj
" wrap around lines
set whichwrap+=<,>,h,l,[,]
" made <space> the <leader> key
let mapleader = ' '
noremap <SPACE> :
"
" hjkl in normal and visual
"         hl: 1 char
" shift + hl: 1 word (*)
"  ctrl + hl: start/end line (*)
"     ñ + hl: start/end {[()]} (*)
"         jk: 1 char
" shift + jk: start/end paragraph/block (*)
"  ctrl + jk: page up/down (*) 
"     ñ + jk: start/end file (*)
"
nmap H b
nmap L w
nmap <C-h> 0
nmap <C-l> $
nmap ñh [{
nmap ñl ]}
nmap J }
nmap K {
nnoremap <C-J> <C-D>
nnoremap <C-K> <C-U>
nmap ñj :%<CR>
nmap ñk :1<CR>
vmap H b
vmap L w
vmap <C-h> 0
vmap <C-l> $
vmap ñh [{
vmap ñl ]}
vmap J }
vmap K {
vnoremap <C-J> <C-D>
vnoremap <C-K> <C-U>
vmap ñj G
vmap ñk gg
"
" m -> M, goto middle page
" nmap m M
nnoremap <C-M> M
" vmap m M
vnoremap <C-M> M
" 
" :33 -> goto line 33
"
" u -> undo
" U -> :redo (*)
nmap U :redo<CR>
"
" O -> Insert in new line above
"   I ->    Insert at line beginning
"    i ->   Insert at cursor
"     a ->  Insert after cursor
"      A -> Insert at line end
" o -> Insert in new line below 
"
" y -> copy
"   yiw -> copy cursor word
"   yy  -> copy line
"   Y   -> copy line
" d -> cut
"   diw -> cut cursor word
"   dd  -> cut line
"   D   -> cut until end of line
" p -> paste at cursor
" P -> paste after cursor
"
" iw/aw -> inside/around word
" is/as -> inside/around sentence
" ip/ap -> inside/around paragraph
" i'/a' -> inside/around ''
" it/at -> inside/around tags
"
" ¡ -> / pattern search (*)
" ¿ -> :s (current line) :%s (whole file) foo/bar/g (*)
"      /foo/bar/c -> confirm on each replacement
" n/N -> next/previous finding
map ¡ /
nnoremap <Leader><space> :let @/=""<cr>
map ¿ :%s/
"
" VISUAL mode:
"         v -> char
" shift + v -> line
"  ctrl + v -> block
"
" 2i[ -> select tier-2 [] inside
" a"  -> select tier-1 "" around
" www -> extend selection up to 3 words right
" bbb -> extend selection up to 3 words left
" hjkl -> extend with cursor
"
" y/c/d|p -> yank/cut/delete|paste
"
" FOLDS:
" zh<- fold
" zl-> unfold
set foldmethod=indent
""set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2
nmap zh zc
nmap zl zo
"
" TABS & SPLITS:
" vim -p file1 file2 ...
" ctrl+e e -> new tab (*)
" ctrl+e h -> prev tab (*)
" ctrl+e l -> next tab (*)
" ctrl+e j/k -> split h/v (*)
" ctrl+e q/o -> close/close othes tabs (*)
" ctrl+w hjkl -> move on tab
" ctrl+w q/o -> close/close other frames (*)
" :e -> open file
" TABS:
" :tabe [file]
" gt/gT
" 2gt -> goto tab 2
" :tabc or ctrl+w c
" :tabs -> list tabs
""nmap <C-H> gT
""nmap <C-L> gt
""nmap <C-E> <ESC>:tabs<CR>
nmap <C-E>e <ESC>:tabe<CR>:NERDTreeToggle<CR>
nmap <C-E>h <ESC>gT
nmap <C-E>l <ESC>gt
nmap <C-E>k <ESC>:vs<CR><C-W>l:NERDTreeToggle<CR>
nmap <C-E>j <ESC>:sp<CR><C-W>j:NERDTreeToggle<CR>
nmap <C-E><C-E> <C-E>e
nmap <C-E><C-H> <C-E>h
nmap <C-E><C-L> <C-E>l
nmap <C-E><C-K> <C-E>k
nmap <C-E><C-J> <C-E>j
nmap <C-E>1 <ESC>1gt
nmap <C-E>2 <ESC>2gt
nmap <C-E>3 <ESC>3gt
nmap <C-E>4 <ESC>4gt
nmap <C-E>5 <ESC>5gt
nmap <C-E>6 <ESC>6gt
nmap <C-E>7 <ESC>7gt
nmap <C-E>8 <ESC>8gt
nmap <C-E>9 <ESC>9gt
nmap <C-E>0 <ESC>10gt
nmap <C-E>c <ESC>:tabc<CR>
nmap <C-E>o <ESC>:tabo<CR>
nmap <C-E>q <C-E>c
nmap <C-E><C-Q> <C-E>q
nmap <C-E><C-O> <C-E>o
" :e -> open file
" :Ex -> open file explorer
" SPLITS:
" :sp [file]
" :vs [file]
" ctrl+w hjkl -> to move
" ctrl+w c/o -> close/close all other
nmap <C-W>q <C-W>c
nmap <C-W><C-Q> <C-W>q
nmap <C-W><C-W> <C-W>q
"
"
" Open current HTML/... (file) on browser/... (system):
nmap <F5> :w <Bar> !xdg-open %<CR>
" https://stackoverflow.com/questions/21702726/how-to-preview-html-file-in-a-browser-using-vim-any-keyboard-shortcut
"
" MACROS:
" qa -> start REC macro 'a'
" q  -> end macro REC
" @a -> call macro 'a'
"
"
" MODULES:
"
" neobundle.vim
" mkdir ~/.vim/bundle
" git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif
if &compatible
  set nocompatible               " Be iMproved
endif
" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
" My Bundles here:
"
" surround.vim
NeoBundle 'tpope/vim-surround'
" cs"'  -> change "any group in cursor" to 'any group in cursor'
" ds"   -> delete "" in any group around cursor
" ysiw" -> surround word in cursor with ""
" VISUAL + S<p> -> in VISUAL surround selection with <p></p>
nmap W lbvhe
nmap E <C-H>v<C-L>h
nmap S WS
vmap " S"
vmap ' S'
vmap ( S(
vmap [ S[
vmap { S{
vmap < S<
"
" sessions.vim
function! MakeSession(overwrite)
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  if a:overwrite == 0 && !empty(glob(b:filename))
    return
  endif
  exe "mksession! " . b:filename
endfunction
"
function! LoadSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction
"
" Adding automatons for when entering or leaving Vim
if(argc() == 0)
  au VimEnter * nested :call LoadSession()
  au VimLeave * :call MakeSession(1)
else
  au VimLeave * :call MakeSes'ion(0)
endif
" Automatically saving previous sessions if no command is provided
set ssop-=options    " do not store global and local values in a session
"set ssop-=folds      " do not store folds
"vimrc au FocusLost * silent! wa 
" Other: NeoBundle 'thaerkh/vim-workspace' but gives problems on old vim
" 
" commentary.vim
NeoBundle 'tpope/vim-commentary'
" ctrl+d -> toggle comment (*)
" gcc  -> toggle comment
" gcgc -> uncomment continuous commented lines
" autocmd FileType apache setlocal commentstring=#\ %s
map <C-D> gcc<ESC>
imap <C-D> <ESC>:Commentary<CR>i
"
" lightline.vim (not powerline, not airline)
NeoBundle 'itchyny/lightline.vim'
" status bar
set laststatus=2
set noshowmode
"
" NERDTree 
NeoBundle 'preservim/nerdtree'
" º -> Toggle NEDTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=1
nmap º :NERDTreeToggle<CR>
" :Bookmark <name>
" B -> show NERDTree bookmarks
" D -> delete NERDTree bookmark
" let g:NERDTreeBookmarksSort=0 -> to sort bookmarks, then edit ~/.NERDTreeBookmarks
"
" 
" These two need NerdFonts, disable otherwise:
NeoBundle 'ryanoasis/vim-devicons'
NeoBundle 'tiagofumo/vim-nerdtree-syntax-highlight'
" 
" For a start-up menu
NeoBundle 'mhinz/vim-startify'
let g:startify_bookmarks = ['~/.vimrc',]
let g:startify_custom_header = ['   ██╗   ██╗██╗███╗   ███╗','   ██║   ██║██║████╗ ████║','   ██║   ██║██║██╔████╔██║','   ╚██╗ ██╔╝██║██║╚██╔╝██║','    ╚████╔╝ ██║██║ ╚═╝ ██║','     ╚═══╝  ╚═╝╚═╝     ╚═╝','                          ']
" more: https://github.com/mhinz/vim-startify/wiki/Example-configurations
"
" autoclose
NeoBundle 'Townk/vim-autoclose'
" Other: https://github.com/Raimondi/delimitMate
"
" terminal
NeoBundle 'tc50cal/vim-terminal'
nmap t :TerminalSplit bash<CR>
nmap T :TerminalSplit bash<CR>
nmap <C-T> :TerminalTab bash<CR>
" Other: nmap <C-T> :terminal<cr>
"
" hexeditor
NeoBundle 'Shougo/vinarise'
let g:vinarise_enable_auto_detect = 1
"
" vim-bookmarks
NeoBundle 'MattesGroeger/vim-bookmarks'
nmap MN mp
" after set colorscheme later: highlight SignColumn ctermbg=Black

" Similar: https://github.com/kshenoy/vim-signature
"
" undotree
NeoBundle 'mbbill/undotree'
nmap <Leader>u :UndotreeToggle<cr><C-W>l
nmap <C-U> :UndotreeToggle<cr><C-W>l
let g:undotree_WindowLayout = 3
"
" vim-simple-complete
" NeoBundle 'maxboisvert/vim-simple-complete'
"
" indentation object
NeoBundle 'michaeljsmith/vim-indent-object'
" (v)ii
" (v)ai
" (v)aI
" (v)iI
"
" tabularize
NeoBundle 'godlygeek/tabular'
" :Tab /=
" :Tab /|
" :Tab /:
" :Tab /:\zs
"
" transpose tool
NeoBundle 'salsifis/vim-transpose'
" :Transpose            (for character array transposition),
" :TransposeWords       (for word array transposition),
" :TransposeTab         (for tab-separated table transposition),
" :TransposeCSV         (for general delimited text transposition), and
" :TransposeInteractive (for custom transposition).
"
" diff
" :diffthis
" check: https://vi.stackexchange.com/questions/625/how-do-i-use-vim-as-a-diff-tool
" check: https://github.com/will133/vim-dirdiff
"
" easymotion
NeoBundle 'easymotion/vim-easymotion' " Configured later...
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
let g:EasyMotion_keys = 'asdhjklfgpoiuywert,'
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1
"
call neobundle#end()
" Required:
filetype plugin indent on
"
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"
" Other plug-ins:
"  · https://github.com/spf13/spf13-vim
"  · https://github.com/liangxianzhe/oh-my-vim
"  · https://www.sainnhe.dev/post/status-line-config/
"  · deoplete.nvim
" 
"  · markdown md preview:
"   NeoBundle 'JamshedVesuna/vim-markdown-preview'
"   let vim_markdown_preview_use_xdg_open=1
"   let vim_markdown_preview_browser='Firefox'
"   <C-P>
"   Also: https://github.com/iamcco/markdown-preview.nvim
"
"  · html/css hierarchy emmet: https://github.com/mattn/emmet-vim

"  · https://www.sainnhe.dev/post/status-line-config/
"   if (has("termguicolors"))
"     set termguicolors
"   endif
"


colorscheme desert
syntax on
"" syntax enable
set hlsearch
" You can force with :set sytanx=html
set number

" Indenting a gogo
set backspace=indent,eol,start
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
" Saving jumping features:
nnoremap <C-P> <C-I>
""nmap <C-P> :bn<CR>
""nmap <C-O> :bp<CR>
nmap <Tab> >>
nmap <S-Tab> <<
imap <Tab> <C-T>
imap <S-Tab> <C-D>
vmap <Tab> >gv
vmap <S-Tab> <gv

" Share clipboard into vim (not working)
set clipboard=unnamed
set clipboard=unnamedplus
" vmap <C-c> "+yi
" vmap <C-x> "+c
" vmap <C-v> c<ESC>"+p
" imap <C-v> <ESC>"+pa
" set clipboard+=unnamed
" set paste
" set go+=a
" Hide line numbers
" silent! map <F10> :set invnumber <bar> :GitGutterToggle<CR>
silent! map <F10> :set invnumber<CR>
nmap <C-N> :set invnumber<CR>

" Toggle spelling visuals
nmap <leader>ss :set spell!
" Fix/Loop on spelling alternatives
" nmap <leader>f 1z=

" For vim-bookmark use of Sign color
highlight SignColumn ctermbg=Black 
" highlight SignColumn guibg=Black 

" Show file type
" seems problematic

" Date tools
"nmap <F3> i<C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR><Esc>
"imap <F3> <C-R>=strftime("%Y-%m-%d %a %I:%M %p")<CR>
command Now :pu=strftime(\"%Y-%m-%d %H:%M:%S\")
command Today :pu=strftime(\"%d/%m/%Y\")

"A mapping to make a backup of the current file.
function! WriteBackup()
  let l:fname = expand('%:p') . '__' . strftime('%Y_%m_%d_%H.%M.%S')
  silent execute 'write' l:fname
  echomsg 'Wrote' l:fname
endfunction
nnoremap <Leader>bk :<C-U>call WriteBackup()<CR>

" Exit without save, similar to exit saving ZZ
nmap QQ :qa<CR>
""nmap <C-Q><C-Q> :qa<CR>
" Save current file
nmap SS :w<CR>

" Set cursor... not always work
set guicursor=a:block-Cursor,i:ver10-Cursor
set cursorcolumn
set cursorline
map <F2> :set cursorcolumn!<Bar>set cursorline!<CR>
hi CursorColumn term=reverse ctermbg=234 guibg=Grey40
hi CursorLine cterm=NONE ctermbg=234 guibg=Grey40
" https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg

" Mouse support
set mouse=a
set ttymouse=xterm2

" More pages to see:
" https://hea-www.harvard.edu/~fine/Tech/vi.html
" https://danielmiessler.com/study/vim/
" https://blog.confirm.ch/mastering-vim-working-with-multiple-files/
"

