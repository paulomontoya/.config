" Settings
set mouse=a
syntax enable
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set number 
set relativenumber

let g:gruvbox_contrast_dark='hard'
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'css': ['prettier'],
\}
let g:ale_fix_on_save = 1

let mapleader=" "
map <C-T> :tabnew<CR>
map <C-L> :tabn<CR>
map <C-H> :tabp<CR>
" map <C-B> :tab all<CR>

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'dense-analysis/ale'
Plug 'ludovicchabant/vim-gutentags'
Plug 'kristijanhusak/vim-js-file-import', {'do': 'npm install'}

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

autocmd vimenter * colorscheme gruvbox

"""""""""""""""""""""""""""
" FZF
"""""""""""""""""""""""""""
map <C-p> :FZF<CR>
map <C-u> :Buffers<CR>

"""""""""""""""""""""""""""
" Easymotion
"""""""""""""""""""""""""""
map <Leader> <Plug>(easymotion-prefix)

"""""""""""""""""""""""""""
" Fugitive
"""""""""""""""""""""""""""
"map <C-g>s :Gstatus<CR>
"map <C-g>b :Gblame<CR>
"map <C-g>c :Gcommit
"map <C-g>h :Git checkout 
"map <C-g>r :Gread<CR>
"map <C-g>w :Gwrite<CR>
"map <C-g>d :Gdiff<CR>
"map <C-g>p :Gpush<CR>
"map <C-g>g :Gpull<CR>

"""""""""""""""""""""""""""
" NerdTree
"""""""""""""""""""""""""""
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function! s:CloseIfOnlyNerdTreeLeft()
	if exists("t:NERDTreeBufName")
		if bufwinnr(t:NERDTreeBufName) != -1
			if winnr("$") == 1
				q
			endif
		endif
	endif
endfunction

" toggle file explorer visibility
map <C-A> :NERDTreeToggle<CR>

" execute jshint when file is saved
let jshint2_save = 1
