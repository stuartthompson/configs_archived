" Snippets
"
" This file defines normal mode remaps for snippet expansions.
" Snippets are prefixed with the leader ,
"
" Each snippet expands a single file using :read and then issues the command
" and navigates into specific part of the inserted code.

" Rust Snippets
"
" snippet: struct
nnoremap ,rs-struct :-1read $HOME/.config/nvim/snippets/rust/rs-struct.rs<CR>whi<space>

" snippet: /// documentation block
"
" /(<CR>                        - Find (
" yi(                           - Yank in (
" kp0                           - Up 1 line, paste, start of line
" i///<space>##mark##///        - Add initial line
" /// # Arguments///            - Add # Arguments line
" ///<space>*<space>`<esc>      - Prefix with ///<space>*<space>`
" :s/,/\/\/\/\ *\ `/g<CR>       - Replace , with ///<space>*<space>`
" :s/`\ /`/g<CR>                - Replace `<space> with `
" :s/:\zs[^\/]*//g<CR>          - Replace : through / with nothing
" :s/:/\` -/g<CR>               - Replace : with <space>-
" :s/\/\/\//\r\/\/\//g<CR>      - Replace /// with ///<CR>
" /##mark##<CR>                 - Move to mark
" d8l                           - Delete 8 chars to the right (delete mark)
" :noh<CR>                      - Remove highlight (from find/replace)
" a                             - Go to insert mode with append
nnoremap ,rs-/ /(<CR>yi(kp0i///<space>##mark##//////<space># Arguments//////<space>*<space>`<esc>:s/,/\/\/\/\ *\ `/g<CR>:s/`\ /`/g<CR>:s/:\zs[^\/]*//g<CR>:s/:/\` -/g<CR>:s/\/\/\//\r\/\/\//g<CR>/##mark##<CR>d8l:noh<CR>a
