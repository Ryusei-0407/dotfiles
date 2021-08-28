call ddc#custom#patch_global('source', ['around'])
call ddc#custom#patch_global('sourceOptions', {
    \ '_': {
    \    'matchers': ['matcher_head'],
    \    'sorters': ['sorter_rank']},
    \ })

call ddc#custom#patch_global('sources', ['around', 'nextword'])
call ddc#custom#patch_global('sourceOptions', {
    \ 'around': {'mark': 'A'},
    \ 'nextword': {'mark': 'nextword'},
    \ '_': {
    \ 'matchers': ['matcher_head'],
    \ 'sorters': ['sorter_rank']},
    \ })

" Mappings
inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ "\<TAB>" : ddc#manual_complete()

inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-h>"

call ddc#enable()
