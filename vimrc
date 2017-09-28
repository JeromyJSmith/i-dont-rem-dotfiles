
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
