set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim' 
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/c.vim'
Plugin 'kien/ctrlp.vim'

set laststatus=2
set t_Co=256
set noshowmode
let g:airline#extensions#tabline#enabled = 1

map <F2> :NERDTreeToggle<cr>
map <F3> :TlistToggle<cr>
map <F8> :TagbarToggle<CR>

syntax on
colorscheme neonwave 


call vundle#end()            " required
filetype plugin indent on    " required 

set number
