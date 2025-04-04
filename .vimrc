syntax on

call plug#begin()
  Plug 'tpope/vim-sensible'
  Plug 'junegunn/fzf'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/vim-lsp'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  Plug 'sbdchd/neoformat'
call plug#end()

set number
set re=0
set rtp+=/opt/homebrew/opt/fzf

if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript', 'typescript.tsx', 'typescriptreact'],
        \ })
endif

let g:neoformat_try_node_exe = 1
autocmd BufWritePre,TextChanged,InsertLeave *.ts* Neoformat
