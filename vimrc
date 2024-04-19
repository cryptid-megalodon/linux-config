
" Use my google-specific config.
" source $HOME/.google_vimrc.vim

"Programming syntax turned on
syntax on

" Change leader key. <leader> key is set to '\' by default.
let mapleader = "v"

"Ignore case in searches except when a search term is explicitely capitalized.
set ignorecase
set smartcase

"Set bottom of page to always show the next N lines.
set scrolloff=2

"Turn on line numbers
set number

"Allow :edit to hide current buffers when opening a new file.
set hidden

"Set tab to equal two spaces
"set expandtab
"set tabstop=2
"set shiftwidth=2

"Turn off arrow keys in all modes. Use J,K,L,; instead.
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
inoremap  <Del>    <Nop>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
noremap   <Del>    <Nop>
"set relativenumber

"Highlight characters past column 80:
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
match OverLength /\%81v.\+/

"Change spelling highlighting to be bold and underlined
hi clear SpellBad
hi SpellBad cterm=undercurl,bold

" Abbreviations seem useful!
" Abbreviations are echoed normally until complete, therefore the abbreviation
" can't contain escape (you'd leave edit-mode before completing the
" abbreviation), but the replacement expression can contain escape, and can
" leave and return to edit-mode.
"
" :ab teh the
" :ab #d #define
" :ab #i #include
" :ab cmain main(argc,argv)^Mint argc;^Mchar **argv;^M{^M}^[O
" :ab cmmap mmap(NULL,st.st_size,PROT_READ,MAP_SHARED,fd,0);
" :ab readsig ^[G:r ~/misc/sig^M

" Detects when vim is inside tmux and updates special characters that are
" triggered when copy/pasting from outside of tmux.
" https://vi.stackexchange.com/questions/15722/vim-tmux-and-xterm-bracketed-paste
if &term =~ '^screen'
  let &t_BE="\<Esc>[?2004h"
  let &t_BD="\<Esc>[?2004l"
  let &t_PS="\<Esc>[200~"
  let &t_PE="\<Esc>[201~"
endif

" Set pastetoggle.
" https://vim.fandom.com/wiki/Toggle_auto-indenting_for_code_paste
nnoremap <leader>z :set invpaste paste?<CR>
set pastetoggle=<leader>z
set showmode
