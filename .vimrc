" ------------------------------------------------------------------------------
" Basics
" ------------------------------------------------------------------------------
" Be IMproved
set nocompatible
" Enable pathogen bundle loader
call pathogen#infect()
" Recognize file types / set indent mode
filetype plugin indent on
" Share OS clipboard
set clipboard=unnamed
" Allow mouse usage in terminal vim
set mouse-=a
" Always show status line
" set laststatus=2
" Syntastic highlight
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" Per project vimrc
set exrc
" Source vimrc files after editing
autocmd bufwritepost .vimrc source <afile>
" Indention
set autoindent
" visual模式修改缩进时不退出该模式
vnoremap < <gv
vnoremap > >gv 
" Automatically safe files when switchin between them / leaving vim
" set autowriteall
autocmd FocusLost * silent! :wa
autocmd TabLeave * silent! :wa
" Do not create swap files, we're using git after all
set nobackup
set nowritebackup
set noswapfile
" Enable vim to remember undo chains between sessions (vim 7.3)
if v:version >= 703
  set undofile
endif
" Disable folding
" set nofoldenable
" Configure snipmate dir
" let g:snippets_dir="~/.vim/snippets"
" Setup syntastic filetypes
let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': ['javascript', 'php'],
                           \ 'passive_filetypes': ['puppet'] }


" ------------------------------------------------------------------------------
" Styling
" ------------------------------------------------------------------------------
" Syntax highlighting
syntax on
" Color Scheme
" colorscheme koehler 
" Show Line numbers
" let g:solarized_termcolors=256
" set t_Co=256
" set background=light
colorscheme darkblue 
set number
" Text-mate style display of invisible characters (tab/newline)
" set listchars=tab:.\ ,eol:¬
" set list
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59 guibg=NONE
" Highlight active line
" set cursorline
" Highlight search results
set hlsearch
hi Search guibg=Khaki guifg=Black gui=NONE

" ------------------------------------------------------------------------------
" Tabs vs. Spaces
" ------------------------------------------------------------------------------
" Spaces instead of tabs
set expandtab
" 2 spaces for each tab
set tabstop=4
" 2 spaces for indention
set shiftwidth=4

" ------------------------------------------------------------------------------
" Key bindings
" ------------------------------------------------------------------------------
" Make , the leader key
let mapleader = ","

" Nerd Tree (toggle)
nnoremap <Leader>n :NERDTreeToggle<CR>
" Nerd Tree (reveal current file)
nnoremap <Leader>f :NERDTree<CR>:NERDTreeClose<cr>:NERDTreeFind<CR>

" Edit user .vimrc
nmap <Leader>v :e ~/.vimrc<CR>
" Edit project .vimrc
map <Leader>V :e .vimrc<CR>

" Clear search results when hitting space
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Copy path to current buffer into clipboard
nnoremap <leader><space> :!echo -n % \| pbcopy<CR><CR>

" ------------------------------------------------------------------------------
" File type specifics *
" ------------------------------------------------------------------------------
" Execute current file with node.js
" autocmd BufEnter *.js nmap <Leader><Leader> :w<CR>:!node %:p<CR>
" Execute current file with coffee-script node.js
" autocmd BufEnter *.coffee nmap <Leader><Leader> :w<CR>:!coffee %:p<CR>

" Recognise file by extension
autocmd BufEnter *.ctp set filetype=php
autocmd BufEnter *.json set filetype=javascript
autocmd BufEnter *.isml set filetype=html
autocmd BufEnter *.ejs set filetype=html
autocmd BufEnter *.as set filetype=actionscript

" Magic to make ledger work
au BufNewFile,BufRead *.ldg,*.ledger setf ledger | comp ledger
:set tags=/home/eason/Workspace/WebModules/tags