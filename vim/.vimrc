" add to the end of root .vimrc
" source ~/dotfiles

unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" setup vim almost like vs code
" https://www.youtube.com/watch?v=gnupOrSEikQ

" plugins setup
call plug#begin('~/.vim/plugged')
  " Autocomplete plugin. similar to VS Code
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Left side directory tree like VS Code
  Plug 'preservim/nerdtree'

  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight' "git nerd icons
  Plug 'ryanoasis/vim-devicons' " nerd icons
  " look there https://github.com/ryanoasis/nerd-fonts need to be installed
  
  Plug 'christoomey/vim-tmux-navigator' " ctrl hjkl between windows
  Plug 'tomasiser/vim-code-dark' " VS Code dark scheme
  " https://github.com/Mofiqul/vscode.nvim looks great, but doesn't work

  Plug 'HerringtonDarkholme/yats.vim' " TS Syntax

  Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files (ctrl+p in VS Code)

  " Toggle comments in various ways.
  " gc - selected lines, gcc - line beneath cursor
  Plug 'tpope/vim-commentary'

  let g:coc_disable_startup_warning = 1
call plug#end()

colorscheme codedark

" let eslint.autoFixOnSave=true
" let g:coc_confing_home = '~/dotfiles/vim/coc-settings.json' 

set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set laststatus=2
set noshowmode

" nerdtree setup
let NERDTreeShowHidden=1

let mapleader=","

"nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <leader>n :tabnew<CR>
nnoremap <leader>h :tabprevious<CR>
nnoremap <leader>l :tabnext<CR>
nnoremap <leader>. :tabnext<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>e :Ex<CR>

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" autocomplete insert on Enter or Tab
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"

" coc format binding
nnoremap <leader>f :call CocAction('format')<CR>
nnoremap <C-f> :call CocAction('format')<CR>
inoremap <C-f> <ESC>:call CocAction('format')<CR>

" Move 1 more lines up or down in normal and visual selection modes.
" hey, like in VS Code)
nnoremap K :m .-2<CR>==
nnoremap J :m .+1<CR>==
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" coc extensions
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-json', 
  \ ]

" bottom bar setup

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

"set statusline=
"set statusline+=%#PmenuSel#
"set statusline+=%{StatuslineGit()}
"set statusline+=%#LineNr#
"set statusline+=\ %f
"set statusline+=%m\
"set statusline+=%=
"set statusline+=%#CursorColumn#
"set statusline+=\ %y
"set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
"set statusline+=\[%{&fileformat}\]
"set statusline+=\ %p%%
"set statusline+=\ %l:%c
"set statusline+=\

set statusline=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=\ %n\           " buffer number
set statusline+=%#Visual#       " colour
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#     " colour
set statusline+=%R                        " readonly flag
set statusline+=%M                        " modified [+] flag
set statusline+=%#Cursor#               " colour
set statusline+=%#CursorLine#     " colour
set statusline+=\ %t\                   " short file name
set statusline+=%=                          " right align
set statusline+=%#CursorLine#   " colour
set statusline+=\ %Y\                   " file type
set statusline+=%#CursorIM#     " colour
set statusline+=\ %3l:%-2c\         " line + column
set statusline+=%#Cursor#       " colour
set statusline+=\ %3p%%\                " percentage

