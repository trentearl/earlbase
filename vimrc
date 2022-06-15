call plug#begin('~/.vim/plugged')
Plug 'ekalinin/Dockerfile.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'hashivim/vim-terraform'
Plug 'mxw/vim-jsx'
Plug 'embear/vim-localvimrc'
Plug 'prettier/vim-prettier'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'leafgarland/typescript-vim'
Plug 'othree/yajs.vim'
Plug 'chr4/nginx.vim'
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'sbdchd/neoformat'
Plug 'neovimhaskell/haskell-vim'
Plug 'scrooloose/nerdtree'



Plug 'pangloss/vim-javascript'    " JavaScript support
"Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'sgur/vim-lazygutter'
Plug 'vim-scripts/indentpython.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'rust-lang/rust.vim'
call plug#end()

let g:coc_global_extensions = [ 'coc-tsserver' ]

silent! colorscheme solarized8_high

"autocmd BufWritePre,TextChanged,InsertLeave *.js Neoformat
"autocmd BufWritePre,TextChanged,InsertLeave *.ts Neoformat
"autocmd BufWritePre,TextChanged,InsertLeave *.tsx Neoformat
"autocmd BufWritePre,TextChanged,InsertLeave *.jsx Neoformat
"autocmd BufWritePre,TextChanged,InsertLeave *.json Neoformat


"au BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.typescriptreact

set re=2
set background=light
set hlsearch ignorecase
set showmatch mat=2
set number
set nowrap linebreak
set smartcase
set hidden
set nobackup nowritebackup noswapfile noundofile undolevels=10000
set re=0


let mapleader = "\<space>"

map Q <nop>
map <leader><leader> <c-^>
nnoremap <cr> :nohlsearch<cr>
noremap <leader>w :w!<cr>

nmap <leader>c :set paste<cr>
nmap <leader>C :set nopaste<cr>

nmap <leader>q :q<cr>
nmap <leader>Q :qa!<cr>

nmap <leader>r :NERDTreeFind<cr>
nmap <leader>t :NERDTree<cr>
nmap <leader>T :NERDTreeClose<cr>

nmap <leader>sb :Gblame<cr>
nmap <leader>sd :Gvdiff<cr>zR<cr>
nmap <leader>sl :BCommits<cr>
map <leader>ff :Prettier<cr>

map <c-k> 10k
map <c-j> 10j

map <leader>p :GFiles<cr>
map <leader>bb :Buffers<cr>
map <leader>bs :BLines<cr>
map <leader>l :Lines<cr>
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0) 
map <leader>g :Rg<cr>

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline']}, <bang>0)

noremap <leader>V :e ~/.vimrc<cr>
map <leader>v :source ~/.vimrc<cr>
map <c-w>v :vsp<cr>
map ,n :vertical resize -35<cr>
map ,m :vertical resize -15<cr>
map ,/ :vertical resize +15<cr>
map ,. :vertical resize +35<cr>

nnoremap <c-h> <c-w><c-h>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-n> :bnext<cr>
nnoremap <c-p> :bprevious<cr>
nnoremap <c-d> :bd<cr>

map <leader>o :set list<cr>
map <leader>O :set nolist<cr>
set listchars=tab:>-
set listchars+=space:.

" jump to last position in a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

highlight Normal ctermbg=None

let g:gitgutter_terminal_reports_focus=0
let updatetime=750

let g:airline_theme='tomorrow'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_section_z = "%p%% (%l/%L)"
let g:localvimrc_ask=0

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2


nnoremap <silent> K :call CocAction('doHover')<CR>

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)


:se nostartofline

nnoremap <silent> <leader>d :<C-u>CocList diagnostics<cr>

nmap <leader>do <Plug>(coc-codeaction)
nmap <leader>cl iconsole.log(<esc>a

nmap <leader>dn <Plug>(coc-rename)

nmap <c-w> :w<CR>
imap <c-w> <Esc>:w<CR>
inoremap jj <ESC>
inoremap jk <esc>
inoremap kj <esc>

nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"


autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
