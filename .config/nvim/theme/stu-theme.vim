" File:     stu-colors.vim
" Author:   Stuart Thompson (stuart@stuartthompson.net)
" URL:      https://github.com/stuartthompson/configs/.config/nvim/colors/stu-colors.vim
" License:  GPL3

" Ensure 256 colors available
if !has("gui_running") && &t_Co < 256
    finish
endif

set background=dark

" Function to set highlights
function! s:h(group, style)
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
    execute "highlight" a:group
        \ "ctermfg=" . l:ctermfg
        \ "ctermbg=" . l:ctermbg
endfunction

" Colors
" ------
let s:black         = { "gui": "#000000", "cterm": "0" }
let s:darkgray      = { "gui": "#444444", "cterm": "8" }

let s:darkred       = { "gui": "#880000", "cterm": "1" }
let s:red           = { "gui": "#ff0000", "cterm": "9" }
let s:darkgreen     = { "gui": "#008800", "cterm": "2" }
let s:green         = { "gui": "#00ff00", "cterm": "10" }
let s:orange        = { "gui": "#ff8800", "cterm": "3" }
let s:yellow        = { "gui": "#ffff00", "cterm": "11" }
let s:darkblue      = { "gui": "#0000ff", "cterm": "4" }
let s:blue          = { "gui": "#88ccff", "cterm": "12" }
let s:darkpurple    = { "gui": "#880088", "cterm": "5" }
let s:purple        = { "gui": "#ff00ff", "cterm": "13" }
let s:darkcyan      = { "gui": "#008888", "cterm": "6" }
let s:cyan          = { "gui": "#00ffff", "cterm": "14" }

let s:gray          = { "gui": "#888888", "cterm": "7" }
let s:white         = { "gui": "#ffffff", "cterm": "15" }

" +--------------+
" | Highlighting |
" +--------------+------+
" | Editor Highlighting |
" +---------------------+
call s:h("Normal",          { "fg": s:white,        "bg": s:black })
call s:h("ColorColumn",     {                       "bg": s:darkgreen })
call s:h("Cursor",          { "fg": s:black,        "bg": s:green })
call s:h("NonText",         { "fg": s:orange })
call s:h("Visual",          { "fg": s:black,        "bg": s:orange })
call s:h("Search",          { "fg": s:black,        "bg": s:yellow })
call s:h("MatchParen",      { "fg": s:yellow,        "bg": s:darkblue })
call s:h("Question",        { "fg": s:yellow })
call s:h("ModeMsg",         { "fg": s:yellow })
call s:h("MoreMsg",         { "fg": s:yellow })
call s:h("WarningMsg",      { "fg": s:orange })
call s:h("ErrorMsg",        { "fg": s:black,        "bg": s:red })
call s:h("LineNr",          { "fg": s:darkgray })
call s:h("CursorLineNr",    { "fg": s:white })
call s:h("SignColumn",      { "fg": s:red,          "bg": s:darkgray })

" +--------+
" | Syntax |
" +--------+--------------------+
" | Generic Syntax Highlighting |
" +-----------------------------+
call s:h("Comment",         { "fg": s:gray })
call s:h("Todo",            { "fg": s:yellow,       "bg": s:darkblue })

call s:h("Constant",        { "fg": s:darkcyan })
call s:h("Number",          { "fg": s:darkcyan })
call s:h("Float",           { "fg": s:darkcyan })
call s:h("Boolean",         { "fg": s:darkcyan })
call s:h("Character",       { "fg": s:darkcyan })
call s:h("String",          { "fg": s:darkcyan })

call s:h("Type",            { "fg": s:blue })
call s:h("Structure",       { "fg": s:blue })
call s:h("StorageClass",    { "fg": s:blue })
call s:h("TypeDef",         { "fg": s:blue })

call s:h("Identifier",      { "fg": s:darkblue })
call s:h("Function",        { "fg": s:darkblue })

call s:h("Statement",       { "fg": s:green })
call s:h("Operator",        { "fg": s:purple })
call s:h("Label",           { "fg": s:red })
call s:h("Keyword",         { "fg": s:yellow })
call s:h("Conditional",     { "fg": s:yellow,       "bg": s:darkpurple })
call s:h("Repeat",          { "fg": s:green })
call s:h("Exception",       { "fg": s:yellow,       "bg": s:darkpurple })

call s:h("PreProc",         { "fg": s:blue })
call s:h("Include",         { "fg": s:darkcyan })
call s:h("Define",          { "fg": s:yellow,       "bg": s:darkpurple })
call s:h("Macro",           { "fg": s:cyan })
call s:h("PreCondit",       { "fg": s:yellow,       "bg": s:darkpurple })

call s:h("Special",         { "fg": s:yellow,       "bg": s:darkpurple })
call s:h("SpecialChar",     { "fg": s:yellow,       "bg": s:darkpurple })
call s:h("Delimiter",       { "fg": s:white })
call s:h("SpecialComment",  { "fg": s:gray })
call s:h("Tag",             { "fg": s:yellow,       "bg": s:darkpurple })

call s:h("Underlined",      { "fg": s:yellow,       "bg": s:darkpurple })
call s:h("Ignore",          { "fg": s:yellow,       "bg": s:darkpurple })
call s:h("Error",           { "fg": s:yellow,       "bg": s:darkpurple })

" +-------------------------+
" | VIM Syntax Highlighting |
" +-------------------------+
call s:h("vimComment",      { "fg": s:darkgray })
call s:h("vimCommand",      { "fg": s:darkgreen })

" +--------------------------+
" | Rust Syntax Highlighting |
" +--------------------------+
" Literals
call s:h("rustNumber",      { "fg": s:darkred })
call s:h("rustDecNumber",   { "fg": s:darkred })
call s:h("rustFloat",       { "fg": s:darkred })
call s:h("rustHexNumber",   { "fg": s:darkred })
call s:h("rustOctNumber",   { "fg": s:darkred })
call s:h("rustBinNumber",   { "fg": s:darkred })
call s:h("rustBoolean",     { "fg": s:darkred })
call s:h("rustCharacter",   { "fg": s:darkred })
call s:h("rustString",      { "fg": s:darkred })
call s:h("rustStringDelimiter", { "fg": s:darkred })

call s:h("rustKeyword",     { "fg": s:darkgreen })
call s:h("rustStructure",   { "fg": s:darkgreen })
call s:h("rustTrait",       { "fg": s:blue })
call s:h("rustStorage",     { "fg": s:blue })
call s:h("rustIdentifier",  { "fg": s:blue })
call s:h("rustFuncName",    { "fg": s:orange })
call s:h("rustFuncCall",    { "fg": s:orange })
call s:h("rustMacro",       { "fg": s:blue })
call s:h("rustMacroVariable", { "fg": s:darkcyan })
call s:h("rustMacroRepeatDelimiters", { "fg": s:cyan, "bg": s:darkgray })

" Symbols
call s:h("rustOperator",    { "fg": s:yellow })
call s:h("rustSigil",       { "fg": s:darkgreen })

" Types
call s:h("rustType",        { "fg": s:blue })
call s:h("rustTypedef",     { "fg": s:darkblue })

" Enums
call s:h("rustEnum",        { "fg": s:darkgreen })
call s:h("rustEnumVariant", { "fg": s:darkgreen })

" Comments
call s:h("rustCommentLineDoc", { "fg": s:gray })

" Flow control
call s:h("rustConditional", { "fg": s:green })
call s:h("rustRepeat", { "fg": s:green })

" Specials
call s:h("rustSelf", { "fg": s:darkcyan })
call s:h("rustDynKeyword", { "fg": s:darkpurple })
call s:h("rustLifetime", { "fg": s:darkcyan })

" Attributes
call s:h("rustAttribute",   { "fg": s:darkred })
call s:h("rustDerive",      { "fg": s:darkred })
call s:h("rustDeriveTrait", { "fg": s:darkred })

" Testing
call s:h("rustAssert", { "fg": s:blue })

" +--------------------------+
" | YAML Syntax Highlighting |
" +--------------------------+
call s:h("yamlPlainScalar", { "fg": s:yellow })
call s:h("yamlBlockMappingKey", { "fg": s:darkgreen })
call s:h("yamlFlowIndicator", { "fg": s:orange })
call s:h("yamlKeyValueDelimiter", { "fg": s:gray })

" +--------------------------+
" | YAML Syntax Highlighting |
" +--------------------------+
call s:h("markdownLinkTest", { "fg": s:blue })
