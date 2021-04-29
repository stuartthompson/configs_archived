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
let s:black      = { "cterm": "0" }
let s:darkgray   = { "cterm": "8" }

let s:error_red  = { "cterm": "1" }
let s:hi_green   = { "cterm": "2" }
let s:darkblue   = { "cterm": "4" }
let s:darkpurple = { "cterm": "5" }
let s:darkcyan   = { "cterm": "6" }

let s:red        = { "cterm": "9" }
let s:orange     = { "cterm": "3" }
let s:yellow     = { "cterm": "11" }
let s:green      = { "cterm": "10" }
let s:cyan       = { "cterm": "14" }
let s:blue       = { "cterm": "12" }
let s:purple     = { "cterm": "13" }

let s:gray       = { "cterm": "7" }
let s:white      = { "cterm": "15" }

" Syntax assignments
let s:keyword    = s:red
let s:variable   = s:orange
let s:literal    = s:yellow
let s:function   = s:green
let s:parameter  = s:blue
let s:highlight  = s:purple
let s:comment    = s:gray
let s:operator   = s:white

let s:highlight_bg = s:darkpurple

" +--------------+
" | Highlighting |
" +--------------+------+
" | Editor Highlighting |
" +---------------------+
call s:h("Normal",          { "fg": s:white,        "bg": s:black })
call s:h("ColorColumn",     {                       "bg": s:hi_green })
call s:h("Cursor",          { "fg": s:black,        "bg": s:green })
call s:h("NonText",         { "fg": s:orange })
call s:h("Visual",          { "fg": s:black,        "bg": s:orange })
call s:h("Search",          { "fg": s:black,        "bg": s:yellow })
call s:h("MatchParen",      { "fg": s:yellow,       "bg": s:highlight_bg})
call s:h("Question",        { "fg": s:yellow })
call s:h("ModeMsg",         { "fg": s:yellow })
call s:h("MoreMsg",         { "fg": s:yellow })
call s:h("WarningMsg",      { "fg": s:orange })
call s:h("ErrorMsg",        { "fg": s:black,        "bg": s:error_red })
call s:h("LineNr",          { "fg": s:darkgray })
call s:h("CursorLineNr",    { "fg": s:white })
call s:h("SignColumn",      { "fg": s:red,          "bg": s:darkgray })

" +-------------------------+
" | VIM Syntax Highlighting |
" +-------------------------+
call s:h("vimCommand",      { "fg": s:keyword })
call s:h("vimContinue",     {                       "bg": s:black })
call s:h("vimUserFunc",     { "fg": s:variable })
call s:h("vimString",       { "fg": s:literal })
call s:h("vimOper",         { "fg": s:operator })
call s:h("vimSep",          { "fg": s:operator })
call s:h("vimCommentTitle", { "fg": s:variable })
call s:h("vimComment",      { "fg": s:comment })
call s:h("vimParenSep",     { "fg": s:operator })

" +----------------+
" | NetRW Tree Bar |
" +----------------+
call s:h("netrwTreeBar",    { "fg": s:yellow,       "bg": s:darkblue })

" +--------------------------+
" | Rust Syntax Highlighting |
" +--------------------------+
" Literals
call s:h("rustNumber",      { "fg": s:literal })
call s:h("rustDecNumber",   { "fg": s:literal })
call s:h("rustFloat",       { "fg": s:literal })
call s:h("rustHexNumber",   { "fg": s:literal })
call s:h("rustOctNumber",   { "fg": s:literal })
call s:h("rustBinNumber",   { "fg": s:literal })
call s:h("rustBoolean",     { "fg": s:literal })
call s:h("rustCharacter",   { "fg": s:literal })
call s:h("rustString",      { "fg": s:literal })
call s:h("rustStringDelimiter", { "fg": s:literal })

call s:h("rustKeyword",     { "fg": s:keyword })
call s:h("rustStructure",   { "fg": s:keyword })

call s:h("rustFuncName",    { "fg": s:function })
call s:h("rustFuncCall",    { "fg": s:function })

call s:h("rustTrait",       { "fg": s:variable })
call s:h("rustStorage",     { "fg": s:variable })
call s:h("rustIdentifier",  { "fg": s:variable })
call s:h("rustMacro",       { "fg": s:variable })
call s:h("rustMacroVariable", { "fg": s:darkcyan })
call s:h("rustMacroRepeatDelimiters", { "fg": s:highlight })

" Symbols
call s:h("rustOperator",    { "fg": s:operator })
call s:h("rustSigil",       { "fg": s:operator })

" Types
call s:h("rustType",        { "fg": s:variable })
call s:h("rustTypedef",     { "fg": s:keyword })

" Enums
call s:h("rustEnum",        { "fg": s:keyword })
call s:h("rustEnumVariant", { "fg": s:variable })

" Comments
call s:h("rustCommentLineDoc", { "fg": s:comment })

" Flow control
call s:h("rustConditional", { "fg": s:keyword })
call s:h("rustRepeat", { "fg": s:keyword })

" Specials
call s:h("rustSelf", { "fg": s:keyword })
call s:h("rustDynKeyword", { "fg": s:keyword })
call s:h("rustLifetime", { "fg": s:highlight })

" Attributes
call s:h("rustAttribute",   { "fg": s:keyword })
call s:h("rustDerive",      { "fg": s:keyword })
call s:h("rustDeriveTrait", { "fg": s:keyword })

" Testing
call s:h("rustAssert", { "fg": s:keyword })

" +--------------------------+
" | YAML Syntax Highlighting |
" +--------------------------+
call s:h("yamlPlainScalar", { "fg": s:literal })
call s:h("yamlBlockMappingKey", { "fg": s:variable })
call s:h("yamlFlowIndicator", { "fg": s:keyword })
call s:h("yamlKeyValueDelimiter", { "fg": s:comment })

" +------------------------------+
" | Markdown Syntax Highlighting |
" +------------------------------+
call s:h("markdownLinkText", { "fg": s:parameter })

" +--------------------------------+
" | JavaScript Syntax Highlighting |
" +--------------------------------+
" Imports
call s:h("jsImport", { "fg": s:keyword })
call s:h("jsFrom", { "fg": s:keyword })
call s:h("jsModuleKeyword", { "fg": s:variable })

" Keywords
call s:h("jsStorageClass", { "fg": s:keyword })
call s:h("jsAsyncKeyword", { "fg": s:keyword })
call s:h("jsForAwait", { "fg": s:keyword })
call s:h("jsOperatorKeyword", { "fg": s:keyword })
call s:h("jsOperator", { "fg": s:operator })
call s:h("jsReturn", { "fg": s:keyword })

" Functions
call s:h("jsFunction", { "fg": s:keyword })
call s:h("jsFuncArgs", { "fg": s:parameter })
call s:h("jsFuncCall", { "fg": s:function })
call s:h("jsFuncArgOperator", { "fg": s:operator })
call s:h("jsFuncName", { "fg": s:variable })
call s:h("jsArrowFunction", { "fg": s:keyword })

" Literals
call s:h("jsString", { "fg": s:literal })
call s:h("jsNumber", { "fg": s:literal })
call s:h("jsTemplateString", { "fg": s:literal })
call s:h("jsTemplateBraces", { "fg": s:highlight })
call s:h("jsTemplateExpression", { "fg": s:parameter })
call s:h("jsObjectKey", { "fg": s:variable })
call s:h("jsObjectValue", { "fg": s:parameter })
call s:h("jsObjectProp", { "fg": s:parameter })
call s:h("jsGlobalObjects", { "fg": s:variable })
call s:h("jsVariableDef", { "fg": s:variable })

" Comments and auxiliary items
call s:h("jsComment", { "fg": s:comment })

