" If it doesn't have a comment, means it is temporary and needs to be documented.
" Most of these are not intuitive, so provide lots of description for what it does/resources
" to make sure we always understand.

set autoindent
set smartindent

"======[Line numbers]===============
set number
set relativenumber

"* Get tab stuff setup

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
