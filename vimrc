

""""""""""""" General ViM Settings """""""""

scriptencoding utf-8
syntax on
filetype plugin indent on
set hidden
set encoding=utf-8  " Use utf-8 encoding
set incsearch       " move while searching
set laststatus=2    " always show the status line
set report=0        " tell us when anything is changed via :...
set scrolloff=10    " Keep 10 lines (top/bottom) for scope
set showcmd         " show the command being typed
set showmatch       " show matching brackets
set backspace=indent,eol,start
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab                     " Tabs insert 2 space characters
set virtualedit+=block            " Allow the cursor to go anywhere in visual block mode
set relativenumber                " Relative line numbers
set number                        " Line numbers [:set number!] to turn off
set numberwidth=5                 " We are good up to 99999 lines
set sidescrolloff=10              " Keep 5 lines at the size
set list                          " Show whitespace and tabs
set listchars=tab:\¦·,trail:·     " show tabs and trailing whitespace
set clipboard=unnamed             " copy and paste with *
set mouse=a                       " Scrollable term-vim
" set cursorcolumn
autocmd BufWritePre * %s/\s\+$//e " trim trailing whitespace
set nohlsearch    " highlight removed until next search
" set splitbelow  " Preview window opens to the bottom, not above
set splitright    " Preview window opens to the right, not above
set shortmess=aFc " remove prompts to continue messages in cmd line
" set completeopt=menuone,longest,preview
set completeopt=preview,menu
""""""""""""" END General ViM Settings """""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""" Plug configs """""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround'
Plug 'Lokaltog/vim-easymotion'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jremmen/vim-ripgrep'
Plug 'mhinz/vim-mix-format'
let g:mix_format_on_save = 1
" Allow us to use Ctrl-s and Ctrl-q as keybinds
silent !stty -ixon
" Restore default behaviour when leaving Vim.
autocmd VimLeave * silent !stty ixon
map <C-s> :w <CR> :echo "Saved" <CR>
imap <C-s> <Esc> :w <CR> :echo "Saved" <CR> i

Plug 'ctrlpvim/ctrlp.vim'

" OWN Plugs
Plug 'tpope/vim-fugitive'
Plug 'ElmCast/elm-vim'
let g:elm_format_autosave = 1
Plug 'fishcakez/vim-erlang'
Plug 'elixir-editors/vim-elixir'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-update-rc' }
Plug 'junegunn/fzf.vim'
Plug 'slashmili/alchemist.vim'
Plug 'tpope/vim-repeat'
Plug 'aklt/plantuml-syntax'
Plug 'pangloss/vim-javascript'





" """""""""""" Autocompletion """"""""""""""""""""""""""""""""
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
nmap <silent> td <Plug>(coc-definition)
nmap <silent> tt <Plug>(coc-type-definition)
nmap <silent> ti <Plug>(coc-implementation)
nmap <silent> tr <Plug>(coc-references)
" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')
nnoremap <silent> H :call CocActionAsync('highlight')<CR>
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nmap <C-c> :CocEnable<CR>
nmap <C-x> :CocDisable<CR>

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable, 'rls']},
        \ 'whitelist': ['rust'],
        \ 'blacklist': ['javascript', 'jsx', 'tsx', 'typescript'],
        \ })
endif

" Asynchronous linting/fixing for Vim and Language Server Protocol (LSP) integration
" ONLY FOR typescript until neoclide preview window is working better
Plug 'w0rp/ale'
let g:ale_sign_error = '>'
let g:ale_sign_warning = '!'
let g:ale_lint_delay = 200
let b:ale_linters = ['tslint']
let g:ale_linters = {'jsx': ['tslint']}
let g:ale_sign_column_always = 1 "" annoying if it's not kept open

"" Docker
Plug 'ekalinin/Dockerfile.vim'

"""" CSS syntax highlight
Plug 'othree/csscomplete.vim'
" Add Support css3 properties
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
" highlight hex colors in color
au BufRead,BufNewFile *.scss set filetype=scss.css
au BufRead,BufNewFile *.sass set filetype=sass.css
" scss lint
Plug 'gcorne/vim-sass-lint'

""""""" Javascript
" Syntax highlighting for .jsx (typescript)
Plug 'peitalin/vim-jsx-typescript'
"" Typescript "
Plug 'leafgarland/typescript-vim'
Plug 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

Plug 'elzr/vim-json'
let g:vim_json_syntax_conceal = 0
" GraphQL syntax highlighting
" Plug 'jparise/vim-graphql'
" Plug 'posva/vim-vue'


""""""" Brackets & Parentheses highlighting
" Allow autoclose paired characters like [,] or (,),
Plug 'jiangmiao/auto-pairs'
" Highlights the matching HTML tag when the cursor is positioned on a tag.
Plug 'Valloric/MatchTagAlways'
" Valloric/MatchTagAlways"
nnoremap <leader>% :MtaJumpToOtherTag<cr>
let g:mta_filetypes = {
            \ 'html' : 1, 'xhtml' : 1, 'xml' : 1,
            \ 'javascript' : 1,
            \ 'javascript.jsx' : 1,
            \ 'javascript.tsx' : 1,
            \ 'typescript.tsx' : 1,
            \ 'typescript' : 1
            \}

"""""""""""" Vim Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"
" Snippets/Macros for DOM tags
Plug 'mattn/emmet-vim'
" C-m is synonymous with 'enter', so will cause enter key to lag
let g:user_emmet_leader_key='<C-k>'
let g:user_emmet_settings = {'javascript': {'extends': 'jsx'}}

call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""" PLUGS MUST BE ABOVE THIS LINE """""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""




""""""""""""" YCM YouCompleteMe """"""""""""""""""""""""""""""""
let g:ycm_confirm_extra_conf = 0
let g:ycm_min_num_of_chars_for_completion = 1 " default = 2
let g:ycm_min_num_identifier_candidate_chars = 0 " default = 0
let g:ycm_auto_trigger = 1 " complete as you type, default = 1
" let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_python_binary_path = 'python3'
let g:ycm_key_invoke_completion = '<C-n>'
" let g:ycm_rust_src_path = '/Users/peitalin/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src'
let g:ycm_filetype_whitelist = {
            \ "c":1,
            \ "cpp":1,
            \ "javascript":1,
            \ "javascript.jsx":1,
            \ "typescript":1,
            \ "typescript.tsx":1,
            \ "python":1,
            \ "rust":0,
            \ }
let g:ycm_filetype_blacklist = { 'rust': 1 }
" nnoremap <silent> te :YcmCompleter GetDoc<CR>
" nnoremap <silent> tt :YcmCompleter GetType<CR>
" nnoremap <silent> td :YcmCompleter GoToDefinition<CR>
" nnoremap <silent> tr :YcmCompleter RefactorRename


""""""""""" Toggle Fold Columns
set foldmethod=indent
set foldnestmax=1
" nnoremap <C-c> :%foldc<CR>
set foldlevelstart=10
if line("$") > 400
    set foldlevel=3
endif
nnoremap <C-g> :Rg<Cr>

let g:tagbar_type_markdown = {
\ 'ctagstype': 'markdown',
\ 'kinds': ['h:Heading_L1', 'i:Heading_L2', 'k:Heading_L3']
\ }

nnoremap <silent> <F11> :TagbarToggle<CR>

""""""""""""" Custom key bindings """"""""""
"""NEVER MAP TO: <C-[> , causes mouse scrolling bug
" http://stackoverflow.com/questions/21738018/vim-how-do-i-map-number-keys

let mapleader = "\<Space>"

" replace tabs with 4 whitespace
" nmap <F4> :%s/\t/    /g<CR>
autocmd FileType typescript.tsx,javascript.tsx,javascript,typescript nmap <Leader>s :%s/\t/  /g<CR>
autocmd BufNewFile,BufRead *.ts,*.js set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.vue set filetype=vue.typescript
autocmd FileType vue.typescript setlocal commentstring=//\ %s
autocmd FileType typescript setlocal commentstring=//\ %s
autocmd FileType json setlocal commentstring=//\ %s
" autocmd FileType *.jsx,*.tsx setlocal commentstring=//\ %s
autocmd FileType json syntax match Comment +\/\/.\+$+


""  buffers
" nmap gt :bnext<CR>
" nmap tg :bprevious<CR>
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>
nmap <Leader>b :Buffers<CR>
nmap tg :tabprevious<CR>

"" Refresh file state
map <leader>r :e! <CR>
nmap <leader>w :wa<CR>

""""""""""" window navigation
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

""""""""""" clipboard copy and cut
vmap <C-x> :!pbcopy<CR>
" yanks and copies to system clipboard
vnoremap <C-c> "*y
vnoremap y "*y
vnoremap <C-v> "+p
vnoremap p "*p

""""""""" Tab indent
vnoremap <TAB> >
vnoremap <S-TAB> <
nnoremap <TAB> V >
nnoremap <S-TAB> V <

"""""" disable annoying lowercase shortcut in visual-mode
vnoremap u <Nop>

" Plugins Mapping
nnoremap <Leader>f :GFiles<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>vs :execute "vsplit " . bufname("#")<CR>
nnoremap <Leader>sp :execute "split " . bufname("#")<CR>
inoremap jj <Esc>

""""""" easymotion
" Replace default search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
" easymotion with hjkl keys
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

"""""""""" Add newline in normal mode with shift+enter
" Quickly insert an empty new line without entering insert mode
nnoremap L i<CR><Esc>
nnoremap <Leader>o i<CR><Esc>
nnoremap <Leader>O i<CR><Esc>

""""""" Vim-indent-guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1
autocmd FileType typescript.tsx,javascript.jsx,javascript,typescript let g:indent_guides_guide_size = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_tab_guides = 1
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#243e48 ctermbg=237
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#283e48 ctermbg=236


""""""""""""" Color Schemes """"""""""""""""
set termguicolors
colorscheme gruvbox

