call plug#begin('~/.vim/plugged')
 Plug 'https://github.com/ycm-core/YouCompleteMe'
 Plug 'airblade/vim-gitgutter'
 Plug 'bling/vim-airline'
 Plug 'aserebryakov/vim-todo-lists'
 Plug 'cespare/vim-toml'
 Plug 'mg979/vim-visual-multi', {'branch': 'master'}
 Plug 'easymotion/vim-easymotion'
 Plug 'flazz/vim-colorschemes'
 Plug 'jaxbot/semantic-highlight.vim'
 Plug 'jreybert/vimagit'
 Plug 'majutsushi/tagbar'
 Plug 'https://github.com/fidian/hexmode.git'
 Plug 'mileszs/ack.vim'
 Plug 'nathanaelkane/vim-indent-guides'
 Plug 'rust-lang/rust.vim'
 Plug 'sheerun/vim-polyglot'
 Plug 'sickill/vim-monokai'
 Plug 'tpope/vim-fugitive'
 Plug 'tpope/vim-sensible'
 Plug 'vim-syntastic/syntastic'
 Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
 Plug 'christoomey/vim-system-copy'
call plug#end()

 set nocompatible
 set history=500
 syntax on
 filetype plugin indent on

 noremap j h
 noremap k j
 noremap i k

 noremap f i

" AUTO COMMENT

	autocmd FileType c,cpp,java,rust,cs,php  let b:comment_leader = '\/\/'
	autocmd FileType sh,ruby,python          let b:comment_leader = '#'
	autocmd FileType conf,fstab         	 let b:comment_leader = '#'
	autocmd FileType tex             		 let b:comment_leader = '%'
	autocmd FileType mail               	 let b:comment_leader = '>'
	autocmd FileType vim                	 let b:comment_leader = '"'
	autocmd FileType nasm               	 let b:comment_leader = ';'
function! CommentLine()
    execute ':silent! s/^\(.*\)/' . b:comment_leader . '\1/g'
endfunction
function! UncommentLine()
    execute ':silent! s/^' . b:comment_leader . '//g'
endfunction
noremap <silent> cc :call CommentLine()<CR>zvj
noremap <silent> cx :call UncommentLine()<CR>zvj

" todo
let g:VimTodoListsUndoneItem = '- [ ]'
let g:VimTodoListsDoneItem = '- [✔]'

" Hex edit from vim
	let g:hexmode_patterns = '*.bin,*.exe,*.dat,*.o,*.com'

    let g:VM_mouse_mappings    = 1
    let g:VM_theme             = 'iceblue'

    let g:VM_maps = {}
    let g:VM_maps["Undo"]      = 'u'
    let g:VM_maps["Redo"]      = '<C-r>'

" indentation
	set shiftwidth=4 tabstop=4 noexpandtab smarttab
	set scrolloff=8
	set tw=0 wm=0
	au BufRead,BufNewFile *.txt,*.md set tw=0 wm=0

	set incsearch
	set number relativenumber

" bash-like TAB completion
	set wildmode=longest,list

" Navigate through completion variants using ← and →
	set wildmenu

" Colorsheme
	set background=dark
	let g:seoul256_background = 233
	colo seoul256

" enable Normal mode keys in ru layout
	set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" cscope
	set cscopeverbose
	set cscopequickfix=g-,s-,c-,d-,i-,t-,e-,a-
" enable using scope as tags
	set cscopetag

" Highlight extra whitespaces at the end
	highlight ExtraWhitespace ctermbg=red guibg=red
	au BufNew,BufEnter,BufWinEnter,WinEnter,BufNew * match ExtraWhitespace /\s\+$/

" Ack
 if executable('ag')
	let g:ackprg = 'ag --vimgrep'
	endif

" vim-airline
	let g:airline_powerline_fonts = 0
	let g:airline#extensions#tabline#enabled = 1
	let g:airline_section_b = ''
	let g:airline_section_x = ''
	let g:airline_section_y = ''


" indent-guides
	hi IndentGuidesOdd  guibg=#3B3B3B ctermbg=235
	hi IndentGuidesEven guibg=#343434 ctermbg=236
	let g:indent_guides_space_guides = 1
	let g:indent_guides_enable_on_vim_startup = 1

" Syntastic
	set statusline+=%f
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*
	let g:syntastic_loc_list_height = 2
	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0
	let g:syntastic_error_symbol = "✗"
	let g:syntastic_warning_symbol = "⚠"

	let g:ycm_global_ycm_extra_conf = "~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"

" Tagbar
	 let g:tagbar_ctags_bin = "~/.local/bin/ctags-5.8/ctags"
	nmap <F8> :TagbarToggle<CR>

	nnoremap <F5> :YcmRestartServer<CR>
	nnoremap <leader>jj :YcmCompleter GoTo<CR>
	nnoremap <leader>jr :YcmCompleter GoToReferences<CR>
	nnoremap <leader>jf :YcmCompleter GoToDefinition<CR>
	nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>

" S P E E D
	let g:airline_highlighting_cache=1
	set ttyfast
	set lazyredraw

" Rust
" PLS JUST NO
	let g:ycm_language_server =
	\ [
	\   {
	\     'name': 'rust',
	\     'cmdline': ['rust-analyzer'],
	\     'filetypes': ['rust'],
	\     'project_root_files': ['Cargo.toml']
	\   }
	\ ]
	let g:rust_recommended_style = 0
