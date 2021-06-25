set nocompatible
filetype plugin on
syntax on

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'gruvbox-community/gruvbox'
Plug 'fannheyward/coc-rust-analyzer'
Plug 'vimwiki/vimwiki'
Plug 'mattn/calendar-vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'rust-lang/rust.vim'
Plug 'justinmk/vim-sneak'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'APZelos/blamer.nvim'
Plug 'tpope/vim-vinegar'
Plug 'maxmellon/vim-jsx-pretty'

call plug#end()

if has('nvim')
    set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
    set inccommand=nosplit
    noremap <C-q> :confirm qall<CR>
end

" deal with colors
if !has('gui_running')
  set t_Co=256
endif
if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
  " screen does not (yet) support truecolor
  set termguicolors
endif

set exrc
set guicursor=
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
set colorcolumn=80
set signcolumn=yes
set diffopt+=iwhite " No whitespace in vimdiff
" Make diffing better: https://vimways.org/2018/the-power-of-diff/
set diffopt+=algorithm:patience
set diffopt+=indent-heuristic
set cmdheight=2
set updatetime=50
set shortmess+=c
set showcmd
set mouse=a

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

colorscheme gruvbox

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" Key mappings
let mapleader=' '
inoremap jk <Esc>

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

" Quick-save
nmap <leader>w :w<CR>

""" Windows {{{
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" }}}
"
" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" next greatest remap ever : asbjornHaland
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>

" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>

" Implement methods for trait
nnoremap <silent> <space>i  :call CocActionAsync('codeAction', '', 'Implement missing members')<cr>

" Show actions available at this location
nnoremap <silent> <space>a  :CocAction<cr>

" Maps Alt-[h,j,k,l] to resizing a window split
map <silent> <M-y> <C-w><
map <silent> <M-u> <C-W>-
map <silent> <M-i> <C-W>+
map <silent> <M-o> <C-w>>

" Maps Alt-[s.v] to horizontal and vertical split respectively
map <silent> <M-s> :split<CR>
map <silent> <M-v> :vsplit<CR>

" Vim Wiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md', 'auto_diary_index': 1}]

" Running :RustFmt on saving
let g:rustfmt_autosave = 1

" Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

vmap <leader>fr :RustFmt<CR>
nmap <leader>fr :RustFmt<CR>

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Neat X clipboard integration
" ,p will paste clipboard into buffer
" ,c will copy entire buffer into clipboard
noremap <leader>p :.w !pbcopy<CR><CR>
noremap <leader>c :r !pbpaste<CR>

" vim-sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T

let g:sneak#s_next = 1
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1

" netrw
nmap <unique> <leader>l <Plug>NetrwRefresh
