"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Whitespace
match ErrorMsg '\s\+$' 

" Remove trailing whitespace with \rtw (press and hold \ then rtw) 
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

"* highlight trailing white space and tabs
set listchars=tab:>-,trail:-
set list

syn on se title

"https://vi.stackexchange.com/questions/454/whats-the-simplest-way-to-strip-trailing-whitespace-from-all-lines-in-a-file
"Remove all trailing whitespace by pressing F5, (second part is leading whitespace)
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:%s/^\s\+//e<Bar>:let @/=_s<Bar><CR>

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

set autoindent
set smartindent

" Hopefully handle the ^Ms that sometimes crop up
set fileformat=unix
set fileformats=unix,dos

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Look and Feel
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show status line
set laststatus=2

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
  endif
endfunction

au BufEnter * hi statusline guibg=DarkGrey ctermfg=8 guifg=Black ctermbg=15
au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=Black ctermbg=15


set statusline=
set statusline+=%{HasPaste()}
" TODO: find a new one of these, this one causes issues with random characters https://github.com/fatih/vim-go/issues/71
"set statusline+=%{StatuslineGit()}
set statusline+=%F%m%r%h
" Switch to right side
set statusline+=%=
set statusline+=%w\ 
set statusline+=%p%%\ \ %l:%c\ \ 
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ %p%%\ %l:%c

colorscheme koehler

" Show matching brackets when text indicator over them
set showmatch

"Line numbers
set number
set relativenumber


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" :W saves file, good for permission-denied error
command W w !sudo tee % /dev/null

" Turn off file backup since stuff in git usually
set nobackup
set nowb
set noswapfile

set pastetoggle=<C-P>

" ignore case when searching, use \C to do case sensitive (smartcase should
" work if you start typing capitals
set ignorecase
set smartcase

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  => Helper Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

