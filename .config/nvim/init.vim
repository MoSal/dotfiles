" Load vim addons and syntax highlighting files
set rtp^=/usr/share/vim/vimfiles/

syntax on
colorscheme ron

set backupdir=/vim
set undodir=/vim

" Skip YCM asking to load
let g:ycm_confirm_extra_conf = 0

" YCM rust (note: <Leader> = '\')
nnoremap <Leader>] :YcmCompleter GoTo<CR>
"let g:ycm_rust_src_path = '/home/user64/.multirust/toolchains/nightly/src/rustc-nightly/src'
let g:ycm_rust_src_path = '/home/user64/.multirust/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'

"let g:powerline_pycmd = "py3"

" Map Double <Esc> to exit terminal mode
:tnoremap <Esc><Esc> <C-\><C-n>

" status line items
set statusline=[%n]\ %f\ [%l/%L]\ (%p%%)\ %v\ %r

" Copied from /usr/share/vim/vim74/vimrc_example.vim
" ===================================================

" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!
  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
  augroup END
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

" ===================================================

" Enable spell and include spell dictionary in completion
" set spell
set complete+=kspell

" Always uses spaces instead of tab characters
set expandtab

" Indent spaces
set shiftwidth=2

" If we have tabs
set tabstop=2

" vim: set ft=vim :
