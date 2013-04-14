" Vim syntax file
" Filenames:    *.ini, .*.cfg
" Maintainer:	Serghei Filippov
" Last Change:	June 27, 2011

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'cfg'
endif

syntax case ignore

" Syntax {{{1
" Main properties {{{2
syn region  cfgSection    start="^[[]" end="[]]" skipwhite display
syn match   cfgProperty   "^[-A-Za-z0-9_.]\+" skipwhite nextgroup=cfgDelimiter
syn match   cfgDelimiter  "=\|:" display skipwhite contained
 \ nextgroup=cfgBoolean,cfgNumber,cfgVersionNumber,cfgLogLevel

" Values {{{2
syn keyword cfgBoolean    true false True False contained
syn match   cfgNumber     "\<\d\+[.]\d*\>"
syn match   cfgNumber     "\<\d*[.]\=\d\+\>"
syn match   cfgVersionNumber  "\<\([.]\|\d\)\+\>"

" Comments {{{2
syn keyword cfgTodo    TODO FIXME contained
syn match   cfgComment "^[#;].*" skipwhite display contains=cfgTodo
syn match   cfgComment ";.*" skipwhite display contains=cfgTodo

" Special Syntax for setup.cfg {{{2
syn match   cfgListItem   "^\s\+[-A-Za-z0-9_.]*" skipwhite nextgroup=cfgDelimiter

" Special LogLevel Syntax {{2
syn cluster cfgLogLevel  contains=cfgLogNotSet,cfgLogLog,cfgLogWarn,cfgLogDebug,cfgLogError
syn keyword cfgLogNotSet NotSet skipwhite nextgroup=cfgDelimiter
syn keyword cfgLogLog    Log skipwhite nextgroup=cfgDelimiter
syn keyword cfgLogWarn   Warn skipwhite nextgroup=cfgDelimiter
syn keyword cfgLogDebug  Debug skipwhite nextgroup=cfgDelimiter
syn keyword cfgLogError  Error skipwhite nextgroup=cfgDelimiter

" Highlight Linking {{{1
hi def link cfgSection   Identifier
hi def link cfgProperty  Identifier
hi def link cfgDelimiter Operator
hi def link cfgListItem  Identifier

hi def link cfgLogLevel  Special
hi def link cfgLogNotSet cfgLogLevel
hi def link cfgLogLog    cfgLogLevel
hi def link cfgLogWarn   cfgLogLevel
hi def link cfgLogDebug  cfgLogLevel
hi def link cfgLogError  cfgLogLevel

hi def link cfgComment   Comment
hi def link cfgTodo      Todo


let b:current_syntax = "cfg"
