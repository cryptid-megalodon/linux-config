" Below is a list of all the normally unbound keys in vi command-mode.
" g q v K V # * \ = ^A ^C ^I ^K ^O ^V ^W ^X ^[ ^_
map <leader>yf :YcmCompleter FixIt<CR>
map <leader>yd :YcmCompleter GetDoc<CR>
map <leader>yt :YcmCompleter GetType<CR>
map <leader>ya :YcmDiags<CR>
" Update highlight color of location list window.
hi QuickFixLine term=reverse ctermbg=3
" Navigating the location-list window populated by YcmDiags.
map <leader>yn :lnext<CR>
map <leader>yp :lprevious<CR>
map <leader>yo :lopen<CR>
map <leader>yc :lclose<CR>
" Update Deps
map <leader>bu :BlazeDepsUpdate<CR>

map <leader>ba <leader>bb <bar> <leader>bl <bar> :execute "normal! G" <bar> :wincmd j<CR>

"Google specific:

" NOTE: Glug plugins seem to be broken. Didn't want to fully remove them to
" document my old text editor setup just in case.
" Run applicable google codeformatter on save. See:
" https://g3doc.corp.google.com/company/editors/vim/plugins/index.md?cl=head
" Glug codefmt
" Glug codefmt gofmt_executable="goimports"
" Glug codefmt-google
" Glug blaze
" Glug blaze plugin[mappings]='<leader>b'
" Glug blazedeps auto_filetypes=`['go,py']`
" Glug youcompleteme-google
augroup autoformat_settings
  "autocmd FileType bzl AutoFormatBuffer buildifier
  "autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  "autocmd FileType java AutoFormatBuffer google-java-format
  "autocmd FileType jslayout AutoFormatBuffer jslfmt
  "autocmd FileType go AutoFormatBuffer gofmt
  "autocmd FileType python AutoFormatBuffer pyformat
  "autocmd FileType markdown AutoFormatBuffer mdformat
augroup END

" Improvements to YCM location-list window
function! s:CustomizeYcmLocationWindow()
  " Move the window to the top of the screen.
  wincmd K
  " Set the window height to 5.
  5wincmd _
  " Switch back to working window.
  wincmd p
endfunction
autocmd User YcmLocationOpened call s:CustomizeYcmLocationWindow()

" PMCG's Bash Vim Shortcuts

" getreg('+') is the system clipboard accessed with Ctrl+C & Ctrl+V
" getreg('*') is the selection accessed via selecting text is visual mode or
"               middle click
" getreg('"') is whatever was last yanked; `ye` yanks from the
"                cursor to the end of the current word.
"
" Automatically add includes and dependencies for a symbol that was last yanked.
function! PmcgAddIncludeFromClipboard()
  execute "!pmcg::include ".@%." ".getreg('"')
  edit
endfunction

" `:Inc` will add an include for the symbol / filename on the clipboard to the
" current file.
command! Inc call PmcgAddIncludeFromClipboard()<cr>

function! PmcgAddUsingFromClipboard()
  execute "!pmcg::add_using ".@%." ".getreg('"')
  edit
endfunction

" `:Use` will add a using statement for the symbol on the clipboard.
command! Use call PmcgAddUsingFromClipboard()<cr>

function! PmcgFixUsing()
  execute "!pmcg::fix_usings ".@%
  edit
endfunction

" `:Fuse` will fix all using statements in the current file.
command! Fuse call PmcgFixUsing()<cr>
