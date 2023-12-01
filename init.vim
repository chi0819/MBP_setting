:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set scrolloff=6
:set mouse=a
:set list lcs=tab:\|\ 
:set updatetime=300 " reduce coc.nvim delay

call plug#begin()

Plug 'preservim/nerdtree' " sidebar directories and files
Plug 'tpope/vim-commentary' " shortcut for comment
Plug 'vim-airline/vim-airline' " status bar under nvim editor
Plug 'rafi/awesome-vim-colorschemes' " colorscheme
Plug 'ryanoasis/vim-devicons' " sidebar files and directories icons
Plug 'vhda/verilog_systemverilog.vim'
Plug 'HonkW93/automatic-verilog'
Plug 'Yggdroot/indentLine' " indentline make code blocks readable
Plug 'lervag/vimtex' " for LaTeX
Plug 'neoclide/coc.nvim', {'branch': 'release'} " auto completion
Plug 'honza/vim-snippets' " show information about function, data type and key value

set encoding=UTF-8

call plug#end()

nnoremap <Space>v <C-w>v <CR>
" split window vertically

nnoremap <Space>b <C-w>s <CR>
" split window horizontally

nnoremap <Space>m <C-w>= <CR>
" make split windows equal width & height

nnoremap <Space>q <ESC>:close <CR>
" close current split window

nnoremap <Space>h <C-w>h <CR>
" move cursor to left window

nnoremap <Space>j <C-w>j <CR>
" move cursor to under window

nnoremap <Space>k <C-w>k <CR>
" move cursor to above window

nnoremap <Space>l <C-w>l <CR>
" move cursor to right window

nnoremap <Space>n <C-f> <CR>
" move cursor to next page

nnoremap <Space>p <C-b> <CR>
" move cursor to previous page

nnoremap <Space>u <C-r> <CR>
" recover undo

nnoremap <Space>e <ESC>:NERDTreeToggle<CR> 
" open nerdtree directory

inoremap <C-c> <C-n>
inoremap <C-d> <C-p>
" this two keymap for coc popup menu
" crtl+c for scrolling down
" crtl+d for scrolling up

" Coc.nvim Setting
" Use enter to select first suggestion
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
	\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>\<BS>"

" Can scroll down auto completion suggestion window
" Use ctrl+f to scroll down, use crtl+b to scroll up
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Vimtex Setting
let g:tex_flavor = 'latex'
let g:vimtex_quickfix_mode = 0 " Manualy use :copen to use syntax error checking window

let g:vimtex_view_general_viewer
\ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'

" Skim pdf Viewer Setting for Vimtex
let g:vimtex_compiler_callback_hooks = ['UpdateSkim']

function! UpdateSkim(status)
if !a:status | return | endif

let l:out = b:vimtex.out()
let l:tex = expand('%:p')
let l:cmd = [g:vimtex_view_general_viewer, '-r']

if !empty(system('pgrep Skim'))
	call extend(l:cmd, ['-g'])
endif

if has('nvim')
	call jobstart(l:cmd + [line('.'), l:out, l:tex])
elseif has('job')
	call job_start(l:cmd + [line('.'), l:out, l:tex])
else
	call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
endif
endfunction

let g:vimtex_toc_config = { 
\ 'name' : 'TOC',
\ 'layers' : ['content', 'todo', 'include'],
\ 'split_width' : 25,
\ 'todo_sorted' : 0,
\ 'show_help' : 1,
\ 'show_numbers' : 1,
\} " Manualy use :VimtexTocToggle to open article directory window

" Indentline Setting
let g:indentLine_setColors = 0
let g:indentLine_bgcolor_term = 202

" NerdTree Setting
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" Airline Setting
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

:colorscheme gruvbox