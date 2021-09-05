call ddc#custom#patch_global('sources', ['nvimlsp'])
" call ddc#custom#patch_global('sourceOptions', {
"       \ '_': { 'matchers': ['matcher_head'] },
"       \ 'nvimlsp': { 'mark': 'lsp', 'forceCompletionPattern': '\.|:|->' },
"       \ })
" 
" " Use Customized labels
" call ddc#custom#patch_global('sourceParams', {
"       \ 'nvimlsp': { 'kindLabels': { 'Class': 'c' } },
"       \ })

" Mappings
inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ "\<TAB>" : ddc#manual_complete()

inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

call ddc#enable()
