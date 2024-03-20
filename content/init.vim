" asdf
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab
" Show line numbers
set number

set grepprg=ack

" Keyboard shortcuts
:let mapleader = ","
nnoremap <leader>f :NERDTreeFocus<CR>
nnoremap <leader>d :NERDTreeClose<CR>
nnoremap <leader>l Jxi<CR><Esc>
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//gc<Left><Left><Left>
nnoremap <Leader>e :e#<CR>
nnoremap <Leader>p :call flake8#Flake8()<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

autocmd BufWritePre * %s/\s\+$//e

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'nvie/vim-flake8'
Plug 'psf/black'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'

autocmd BufWritePre *.py execute 'Black' | call flake8#Flake8()

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Prettier for web code
" Plug 'prettier/vim-prettier', { 'do': 'npm install' }
autocmd FileType javascript,javascriptreact nnoremap <leader>p :silent %!npx -q prettier --stdin-filepath %<CR>
" autocmd BufWritePre FileType javascript,javascriptreact !npx -q prettier --stdin-filepath %<CR>
" Plug 'sbdchd/neoformat'
" autocmd BufWritePre *.js,*.jsx,*.css,*.html Neoformat

" Ctags
Plug 'skywind3000/asyncrun.vim'
" autocmd BufWritePost *.py,*.cpp,*.h,*.hxx,*.c,*.cxx AsyncRun cctg

" Set up NERDTree.
Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
autocmd vimenter * NERDTree
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['\.pyc$', '\~$']

Plug 'airblade/vim-gitgutter'

Plug 'hashivim/vim-terraform'
let g:terraform_fmt_on_save=1

Plug 'preservim/nerdcommenter'
let g:NERDSpaceDelims = 1

Plug 'rhysd/vim-clang-format'
autocmd FileType c,cpp,objc ClangFormatAutoEnable

" Autocomplete
"Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'
"autocmd BufEnter * call ncm2#enable_for_buffer()
"set completeopt=noinsert,menuone,noselect
"Plug 'ncm2/ncm2-bufword'
"Plug 'ncm2/ncm2-path'
"Plug 'ncm2/ncm2-pyclang'
"Plug 'ncm2/ncm2-cssomni'
"Plug 'ncm2/ncm2-tern'
"Plug 'ncm2/ncm2-jedi'
"Plug 'ncm2/ncm2-html-subscope'

" Autocomplete (take 2)
"Python >= 3.6.1
"pip3 install --user pynvim
"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif
"let g:deoplete#enable_at_startup = 1

" Codeium autocomplete (take 3)
Plug 'Exafunction/codeium.vim', { 'branch': 'main' }
set statusline+=%3{codeium#GetStatusString()}

let g:kite_supported_languages = ['python', 'javascript']


" List ends here. Plugins become visible to Vim after this call.
call plug#end()


" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
