Plug 'elzr/vim-json'
let g:vim_json_syntax_conceal = 0
" GraphQL syntax highlighting
" Plug 'jparise/vim-graphql'
" Plug 'posva/vim-vue'

""""""" Brackets & Parentheses highlighting
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

" C-m is synonymous with 'enter', so will cause enter key to lag
let g:user_emmet_leader_key='<C-k>'
let g:user_emmet_settings = {'javascript': {'extends': 'jsx'}}
