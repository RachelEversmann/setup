set nocompatible              " be iMproved, required

filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp^=~/.vim/bundle/ctrlp.vim
set rtp+=~/.vim/bundle/Vundle.vim
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" --- Configure Vundle ---
filetype on " without this vim emits a zero exit status, later, because of :ft off
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" install Vundle bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
  source ~/.vimrc.bundles.local
endif

call vundle#end()
filetype plugin on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
set omnifunc=sytaxcomplete#Complete
au InsertEnter * silent execute "!echo -en \<esc>[5 q"
au InsertLeave * silent execute "!echo -en \<esc>[2 q"
autocmd InsertLeave * set nocul
autocmd InsertEnter * set cul
set showmatch
set ignorecase
set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set softtabstop=0
set expandtab " use spaces instead of tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set smartindent " Intellegently dedent / indent new lines based on rules.set tabstop=4
set clipboard=unnamed        " yank and paste with the system clipboard
set directory-=.             " don't store swapfiles in the current directory
syntax on
set number
set incsearch           
set hlsearch
noremap j gj
noremap k gk
let g:jsx_ext_required = 0
map <C-n> :NERDTreeToggle<CR>
map <C-b> :OpenBookmark 
let NERDTreeQuitOnOpen = 3
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END
let g:qs_max_chars=80
" Map the leader key + q to toggle quick-scope's highlighting in normal/visual mode.
" Note that you must use nmap/xmap instead of their non-recursive versions (nnoremap/xnoremap).
nmap <leader>q <plug>(QuickScopeToggle)
xmap <leader>q <plug>(QuickScopeToggle)
let g:airline_theme='luna'
let g:esearch = {
  \ 'adapter':          'ack',
  \ 'backend':          'vim8',
  \ 'out':              'win',
  \ 'batch_size':       1000,
  \ 'use':              ['visual', 'hlsearch', 'last'],
  \ 'default_mappings': 1,
  \}
hi ESearchMatch ctermfg=black ctermbg=darkblue  guifg=#000000 guibg=#E6E6FA
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:syntastic_html_checkers=['']
set undofile
set undodir=~/.vim/undo
nnoremap <C-u> :MundoToggle<CR>
if (has("termguicolors"))
  set termguicolors
endif
set background=dark
