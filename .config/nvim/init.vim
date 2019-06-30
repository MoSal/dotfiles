" Load vim addons and syntax highlighting files
set rtp^=/usr/share/vim/vimfiles/


syntax on
colorscheme ron

" Needs the "words" Arch package
set dictionary=/usr/share/dict/american-english
 
" Avoid cursor blinking
set gcr=

" Share clipboard with X
set clipboard=unnamedplus

set backupdir=/vim
set undodir=/vim

" Plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'ervandew/supertab', { 'do': ':UpdateRemotePlugins' }
Plug 'rust-lang/rust.vim', { 'do': ':UpdateRemotePlugins' }
Plug 'leafgarland/typescript-vim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'do': ':UpdateRemotePlugins' }
Plug 'zah/nim.vim', { 'do': ':UpdateRemotePlugins' }
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next',  'do': 'bash install.sh' }

call plug#end()

" SuperTab: Move from top to bottom
let g:SuperTabDefaultCompletionType = "<c-n>"

" LanguageClient config

" Required for operations modifying multiple buffers like rename.
set hidden

    " \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rls'],
    \ 'c': ['clangd'],
    \ }

" Automatically start language servers and deoplete
let g:LanguageClient_autoStart = 1
let g:deoplete#enable_at_startup = 1

" key mappings
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>

" deoplete clang config
let g:deoplete#sources#clang#libclang_path = "/usr/lib/libclang.so"
let g:deoplete#sources#clang#clang_header = "/usr/include/clang"



" YCM conf
" let g:ycm_server_python_interpreter = '/usr/bin/python2'
" let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" Skip YCM asking to load
" let g:ycm_confirm_extra_conf = 0

" YCM rust (note: <Leader> = '\')
"nnoremap <Leader>] :YcmCompleter GoTo<CR>
" let g:ycm_rust_src_path = '/home/user64/.multirust/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'

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
