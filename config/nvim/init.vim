" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set nocompatible

call plug#begin()

" to be perfectly honest idk what most of these are, but its related to magic lsp
Plug 'neovim/nvim-lspconfig'                 
Plug 'jose-elias-alvarez/null-ls.nvim'      
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'mickael-menu/zk-nvim'
Plug 'nvim-lua/plenary.nvim'                " dependecy for telescope and lsp 
" Plug 'xolox/vim-misc'

" gui elements
" Plug 'majutsushi/tagbar'
Plug 'nvim-telescope/telescope.nvim'        " search files and text more easily
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' } " native fzf support for telescope
" Plug 'bling/vim-bufferline'                 " buffer tabs
" Plug 'vim-airline/vim-airline'              " improved status bar buffer list
Plug 'nvim-lualine/lualine.nvim'
Plug 'liuchengxu/vista.vim'                 " tag explorer
Plug 'nvim-tree/nvim-web-devicons'          " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'              " file tree
Plug 'puremourning/vimspector'

" syntax highlight and completition features
" Plug 'sheerun/vim-polyglot'
" Plug 'neoclide/coc.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}     " best plugin in the world - better syntax highlighting and much more
Plug 'nvim-treesitter/playground'                               " playground for treesitter adds a couple of functions related to treesitter
Plug 'nvim-treesitter/nvim-treesitter-refactor'                 " refactoring features using treesitter
" Plug 'nvim-treesitter/nvim-treesitter-context'                  " show current context on top of window if it isnt visible

" Plug 'vim-scripts/TagHighlight'
" Plug 'xolox/vim-easytags'
" Plug 'FrancescoMagliocco/vim-uctags'

" some git features directly from vim improved from shell com
Plug 'tpope/vim-fugitive'



Plug 'tpope/vim-commentary'                 " toggle comments
Plug 'windwp/nvim-autopairs'                " 

" visual functional
Plug 'airblade/vim-gitgutter'
" visual sugar
Plug 'junegunn/goyo.vim'                    " zen mode
Plug 'junegunn/limelight.vim'               " flashlight for better concentration
Plug 'sainnhe/sonokai'
Plug 'p00f/nvim-ts-rainbow'
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'ap/vim-css-color'                     " backlight hex colors:
Plug 'chrisbra/colorizer'                   " since last plugin dont have support for all types i had to also use this 
call plug#end()

let g:vimspector_base_dir=expand( '$HOME/.config/vimspector' )

" commentary
" set single comment as default for c/c++ files
autocmd FileType cpp setlocal commentstring=//\ %s
autocmd FileType c setlocal commentstring=//\ %s
autocmd FileType hpp setlocal commentstring=//\ %s
autocmd FileType h setlocal commentstring=//\ %s
autocmd FileType inl setlocal commentstring=//\ %s

" TagHighlight settings
" let g:TagHighlightSettings = {'TagFileName': 'tags', 'CtagsExecutable': 'ctags'}

" easytags settings
" :let g:easytags_cmd = 'ctags'
" :let g:easytags_async = 1
" :set tags=./tags;
" :let g:easytags_dynamic_files = 1

" tagbar settings
" :let g:tagbar_ctags_bin = 'ctags'
" let g:tagbar_type_cpp = {
"     \ 'ctagstype' : 'c++',
"     \ 'kinds'     : [
"         \ 'd:macros:1:0',
"         \ 'p:prototypes:1:0',
"         \ 'g:enums',
"         \ 'e:enumerators:0:0',
"         \ 't:typedefs:0:0',
"         \ 'n:namespaces',
"         \ 'c:classes',
"         \ 's:structs',
"         \ 'u:unions',
"         \ 'f:functions',
"         \ 'm:members:0:0',
"         \ 'v:variables:0:0',
"         \ 'l:local:0:0'
"     \ ],
"     \ 'sro'        : '::'}
    " \ 'kind2scope' : {
    "     \ 'g' : 'enum',
    "     \ 'n' : 'namespace',
    "     \ 'c' : 'class',
    "     \ 's' : 'struct',
    "     \ 'u' : 'union',
    "     \ 'l' : 'local'
    " \ },
    " \ 'scope2kind' : {
    "     \ 'enum'      : 'g',
    "     \ 'namespace' : 'n',
    "     \ 'class'     : 'c',
    "     \ 'struct'    : 's',
    "     \ 'union'     : 'u',
    "     \ 'local'     : 'l'
    " \ }
" \ }


" nnoremap <C-E> :NERDTreeToggle<cr>
nnoremap <leader>z :Goyo<cr>
nmap <F8> :Vista!!<CR>


function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
command! -nargs=0 Syn call SynStack()

:let g:goyo_width = 120
:let g:goyo_linenr = 1
" enable and disable limelight when entering and leaving goyo
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  set cc=80,120
  colorscheme spanditimePurple
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

set hlsearch
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set number
set cc=80,120
set cursorline



set list lcs=space:⋅,eol:↴

colorscheme spanditimePurple

:lua require("nvim-tree").setup()
nnoremap <leader>E <cmd>NvimTreeToggle<cr>

" indent settings
:lua require("indent_blankline").setup {char='¦',show_current_context=true,show_end_of_line =true,space_char_blankline=" ",char_highlight_list={"IndentBlanklineIndent1","IndentBlanklineIndent2"}}
lua require "user.plugins"
lua require "user.lsp"
