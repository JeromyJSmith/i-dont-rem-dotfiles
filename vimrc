" If it doesn't have a comment, means it is temporary and needs to be documented.
" Most of these are not intuitive, so provide lots of description for what it does/resources
" to make sure we always understand.

set autoindent
set smartindent

"======[Line numbers]===============
set number
set relativenumber

"* Get tab stuff setup
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab


" Only do this part when compiled with support for autocommands.
if has("autocmd")
    " Use filetype detection and file-based automatic indenting.
    filetype plugin indent on

    " Use actual tab chars in Makefiles.
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab
endif

" For everything else, use a tab width of 4 space chars.
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.
set shiftwidth=4    " Indents will have a width of 4.
set softtabstop=4   " Sets the number of columns for a TAB.
set expandtab       " Expand TABs to spaces.



"=====[ Whitespace ]================ 
match ErrorMsg '\s\+$' 

" Remove trailing whitespace with \rtw (press and hold \ then rtw) 
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

"* highlight trailing white space and tabs
set listchars=tab:>-,trail:-
set list

set pastetoggle=<F8>

syn on se title

"https://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
"Remove all trailing whitespace by pressing F5, (second part is leading whitespace)
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:%s/^\s\+//e<Bar>:let @/=_s<Bar><CR>
