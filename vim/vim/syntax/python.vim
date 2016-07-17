" Vim syntax file
" Language:	Python
" Filenames:	*.py
""""""""""""""""""""""""""""""

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" TODO:Add Options?

if version >= 508 || !exists("did_python_syn_inits")
  if version <= 508
    let did_python_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
endif

" Keywords
syn keyword pythonStatement	   del exec global
syn keyword pythonStatement    lambda print
syn keyword pythonImport       from import as
syn keyword pythonConditional  if elif else
syn keyword pythonWith         with
syn keyword pythonLoop         for while
syn keyword pythonTry          try except finally
syn keyword pythonExit         pass
    syn keyword pythonBreak    break continue 
    syn keyword pythonReturn   return yield
    syn keyword pythonRaise    raise
    syn keyword pythonAssert   assert
syn keyword pythonOperator     and in is not or
syn match pythonBitOperator    "|\|^\|&\|\~" display
syn match pythonBitOperator    "\(<<\)\|\(>>\)" display
syn match pythonMathOperator   "+\|-\|%\|" display
syn match pythonMathOperator   "[*]\{1,2}" display
syn match pythonMathOperator   "[/]\{1,2}" display
syn match pythonComparison     "\(==\)\|\(!=\)" display
syn match pythonComparison     "\(>=\)\|>" display
syn match pythonComparison     "\(<=\)\|<" display
syn match pythonAssignment     "\(-=\)\|\(+=\)\|=" display

HiLink pythonStatement      Statement
HiLink pythonImport         Statement
HiLink pythonConditional    Conditional
HiLink pythonWith           Statement
HiLink pythonLoop           Repeat
HiLink pythonTry            Conditional
HiLink pythonExit           Statement
    HiLink pythonBreak      pythonExit
    HiLink pythonReturn     pythonExit
    HiLink pythonRaise      pythonExit
    HiLink pythonAssert     pythonExit
HiLink pythonOperator       Operator
HiLink pythonBitOperator    Operator
HiLink pythonMathOperator   Operator
HiLink pythonComparison     Operator

" Defining a class and Function
syn keyword pythonClassDef      class nextgroup=pythonClass skipwhite
syn match pythonClass           "[a-zA-Z_][a-zA-Z0-9_]*"  display contained
syn keyword pythonSelf          self
syn keyword pythonFunctionDef   def nextgroup=pythonFunction skipwhite
syn match pythonDecorator       "@" nextgroup=pythonFunction skipwhite
syn match pythonFunction        "[a-zA-Z_][a-zA-Z0-9_]*"  display contained

HiLink pythonClassDef       Function
HiLink pythonClass          Function
HiLink pythonSelf           Statement
HiLink pythonFunctionDef    Function
HiLink pythonFunction       Function
HiLink pythonDecorator      Define

" Builtin functions, types and objects
syn keyword pythonBuiltin   	Ellipsis NotImplemented
syn keyword pythonBuiltin   	__debug__ __doc__ __file__
syn keyword pythonBuiltin       __name__ __package__
    syn keyword pythonBuiltinNull   None
    syn keyword pythonBuiltinBool   True False

syn keyword pythonBuiltinObj    bool chr dict file float hex
syn keyword pythonBuiltinObj    int list oct set str tuple unicode
syn keyword pythonBuiltinObj    bytearray bytes complex enumerate
syn keyword pythonBuiltinObj    frozenset object long property
syn keyword pythonBuiltinObj    slice super type

syn keyword pythonBuiltinFunc	__import__ abs all any apply
syn keyword pythonBuiltinFunc	basestring bin buffer
syn keyword pythonBuiltinFunc   callable
syn keyword pythonBuiltinFunc	classmethod cmp coerce compile
syn keyword pythonBuiltinFunc	delattr dir divmod eval
syn keyword pythonBuiltinFunc	execfile filter format getattr
syn keyword pythonBuiltinFunc	globals hasattr hash help id 
syn keyword pythonBuiltinFunc	input intern isinstance
syn keyword pythonBuiltinFunc	issubclass iter len locals map max
syn keyword pythonBuiltinFunc	min next open ord
syn keyword pythonBuiltinFunc	pow range
syn keyword pythonBuiltinFunc	raw_input reduce reload repr
syn keyword pythonBuiltinFunc	reversed round setattr
syn keyword pythonBuiltinFunc	sorted staticmethod sum
syn keyword pythonBuiltinFunc	unichr vars xrange zip

HiLink Builtin                  Structure
    HiLink pythonBuiltinNull    pythonBuiltin
    HiLink pythonBuiltinBool    pythonBuiltin
HiLink pythonBuiltinFunc	    pythonFunction
HiLink pythonBuiltinObj         pythonClass

"Special Characters
"syn match pythonInterpolate     "%\(.*A?\)\|\((.*"
"syn keyword pythonInterpolationKey 

" Comments
syn match pythonComment       "#.*$" display contains=pythonTodo,@Spell
    syn match pythonHeader    "#\! .*python$" display
syn keyword pythonTodo          TODO FIXME contained

HiLink pythonComment        Comment
    HiLink pythonHeading    pythonComment
HiLink pythonTodo           Todo

" Builtin exceptions and warnings
syn keyword pythonExClass   BaseException
syn keyword pythonExClass   Exception StandardError ArithmeticError
syn keyword pythonExClass   LookupError EnvironmentError

syn keyword pythonExClass   AssertionError AttributeError
syn keyword pythonExClass   BufferError EOFError
syn keyword pythonExClass   FloatingPointError GeneratorExit IOError
syn keyword pythonExClass   ImportError IndexError KeyError
syn keyword pythonExClass   KeyboardInterrupt MemoryError NameError
syn keyword pythonExClass   NotImplementedError OSError OverflowError
syn keyword pythonExClass   ReferenceError RuntimeError StopIteration
syn keyword pythonExClass   SyntaxError IndentationError TabError
syn keyword pythonExClass   SystemError SystemExit TypeError
syn keyword pythonExClass   UnboundLocalError UnicodeError
syn keyword pythonExClass   UnicodeEncodeError UnicodeDecodeError
syn keyword pythonExClass   UnicodeTranslateError ValueError
syn keyword pythonExClass   WindowsError ZeroDivisionError

syn keyword pythonExClass   Warning UserWarning BytesWarning
syn keyword pythonExClass   DeprecationWarning
syn keyword pythonExClass   PendingDepricationWarning SyntaxWarning
syn keyword pythonExClass   RuntimeWarning FutureWarning
syn keyword pythonExClass   ImportWarning UnicodeWarning

HiLink pythonExClass	pythonClass

" Escape Char
syn match pythonEscape      +\\[abfnrtv'"\\]+ display contained
syn match pythonEscape      "\\\o\o\=\o\=" display contained
syn match pythonEscape      "\\x\x\{2}" display contained
syn match pythonLineCont    "\\\s*$" display
syn match pythonStringLineCont "\\$" contained display

HiLink pythonEscape			     Special
HiLink pythonLineCont            Special
    HiLink pythonStringLineCont  pythonLineCont


" Numbers (ints, longs, floats, complex)
syn match pythonNumber    "\<[-]\=\d\+[lLjJ]\=\>" display
syn match pythonHexNumber "\<0[xX]\x\+[lL]\=\>" display
syn match pythonOctNumber "\<0[oO]\o\+[lL]\=\>" display
syn match pythonBinNumber "\<0[bB][01]\+[lL]\=\>" display
syn match pythonFloat     "\.\d\+\([eE][+-]\=\d\+\)\=[jJ]\=\>" display
syn match pythonFloat     "\<\d\+[eE][+-]\=\d\+[jJ]\=\>" display
syn match pythonFloat     "\<\d\+\.\d*\([eE][+-]\=\d\+\)\=[jJ]\=" display

HiLink pythonNumber		Number
HiLink pythonHexNumber	pythonNumber
HiLink pythonOctNumber	pythonNumber
HiLink pythonBinNumber	pythonNumber
HiLink pythonFloat		Float

if exists("python_highlight_errors") && python_highlight_errors != 0
    syn match pythonError       "[$?]" display
    syn match pythonError       "[&|]\{2,}" display
    syn match pythonError       "[*]\{3,}" display
    syn match pythonError       "[/]\{3,}" display
    syn match pythonError       "[>]\{3,}" display
    syn match pythonError       "[<]\{3,}" display
    syn match pythonError       "\\\s*\S\+\s*$" display

    syn match pythonNumberError "\<\d\+[a-zA-Z_~!@{]\D\+\>" display
    syn match pythonHexError	"\<0[xX]\x*[g-zG-Z]\x*[lL]\=\>" display
    syn match pythonOctError	"\<0[oO]\=\o*[8-9]\d*[lL]\=\>" display
    syn match pythonBinError	"\<0[bB][01]*[2-9]\d*[lL]\=\>" display

    HiLink pythonError        Error
    HiLink pythonNumberError  pythonError
    HiLink pythonOctError     pythonError
    HiLink pythonHexError     pythonError
    HiLink pythonBinError     pythonError

    " Trailing Whitespace
    syn match pythonSpacingError "\s\+$" display
    syn match pythonIndentError  "^\s*\t" display

    HiLink pythonSpacingError pythonError
    HiLink pythonIndentError  pythonError
    function! WS (boolean)
        if a:boolean != 0
            hi pythonSpacingError guifg=#FF0000 gui=bold,undercurl
            hi pythonIndentError  guifg=#FF0000 gui=bold,undercurl
        else
            hi clear pythonSpacingError
            hi clear pythonIndentError
        endif
    endfunction



    syn match  pythonUniRawEscapeError	"\([^\\]\(\\\\\)*\)\@<=\\u\x\{,3}\X" display contained

syn match  pythonUniEscapeError	"\\N{[^A-Z ]\+}" display contained
syn match  pythonUniEscapeError	"\\U\x\{,7}\X" display contained
syn match  pythonUniEscapeError	"\\u\x\{,3}\X" display contained

HiLink pythonUniEscapeError		Error
HiLink pythonUniRawEscapeError	Error

endif




" Strings
syn region pythonString		start=+'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonEscape,pythonEscapeError,@Spell
syn region pythonString		start=+"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonEscape,pythonEscapeError,@Spell
syn region pythonString		start=+"""+ end=+"""+ keepend contains=pythonStringLineCont,pythonEscape,pythonEscapeError,@Spell
syn region pythonString		start=+'''+ end=+'''+ keepend contains=pythonStringLineCont,pythonEscape,pythonEscapeError,@Spell


" Unicode strings
syn region pythonUniString	start=+[uU]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonEscape,pythonUniEscape,pythonEscapeError,pythonUniEscapeError,@Spell
syn region pythonUniString	start=+[uU]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonEscape,pythonUniEscape,pythonEscapeError,pythonUniEscapeError,@Spell
syn region pythonUniString	start=+[uU]"""+ end=+"""+ keepend contains=pythonStringLineCont,pythonEscape,pythonUniEscape,pythonEscapeError,pythonUniEscapeError,pythonSpaceError,@Spell
syn region pythonUniString	start=+[uU]'''+ end=+'''+ keepend contains=pythonStringLineCont,pythonEscape,pythonUniEscape,pythonEscapeError,pythonUniEscapeError,pythonSpaceError,@Spell

syn match  pythonUniEscape	"\\u\x\{4}" display contained
syn match  pythonUniEscape	"\\U\x\{8}" display contained
syn match  pythonUniEscape	"\\N{[A-Z ]\+}" display contained

" Raw strings
syn region pythonRawString	start=+[rR]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonRawEscape,@Spell
syn region pythonRawString	start=+[rR]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonRawEscape,@Spell
syn region pythonRawString	start=+[rR]"""+ end=+"""+ keepend contains=pythonStringLineCont,pythonSpaceError,@Spell
syn region pythonRawString	start=+[rR]'''+ end=+'''+ keepend contains=pythonStringLineCont,pythonSpaceError,@Spell

syn match pythonRawEscape	+\\['"]+ display transparent contained

" Unicode raw strings
syn region pythonUniRawString	start=+[uU][rR]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonRawEscape,pythonUniRawEscape,pythonUniRawEscapeError,@Spell
syn region pythonUniRawString	start=+[uU][rR]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonRawEscape,pythonUniRawEscape,pythonUniRawEscapeError,@Spell
syn region pythonUniRawString	start=+[uU][rR]"""+ end=+"""+ keepend contains=pythonStringLineCont,pythonUniRawEscape,pythonUniRawEscapeError,pythonSpaceError,@Spell
syn region pythonUniRawString	start=+[uU][rR]'''+ end=+'''+ keepend contains=pythonStringLineCont,pythonUniRawEscape,pythonUniRawEscapeError,pythonSpaceError,@Spell

syn match  pythonUniRawEscape		"\([^\\]\(\\\\\)*\)\@<=\\u\x\{4}" display contained

" String formatting
syn match pythonStrFormatting	"%\(([^)]\+)\)\=[-#0 +]*\d*\(\.\d\+\)\=[hlL]\=[diouxXeEfFgGcrs%]" contained containedin=pythonString,pythonUniString,pythonRawString,pythonUniRawString
syn match pythonStrFormatting	"%[-#0 +]*\(\*\|\d\+\)\=\(\.\(\*\|\d\+\)\)\=[hlL]\=[diouxXeEfFgGcrs%]" contained containedin=pythonString,pythonUniString,pythonRawString,pythonUniRawString

" TODO:see if this is worth keeping
if exists("python_highlight_string_templates") && python_highlight_string_templates != 0
  " String templates
  syn match pythonStrTemplate	"\$\(\$\|{[a-zA-Z_][a-zA-Z0-9_]*}\|[a-zA-Z_][a-zA-Z0-9_]*\)" contained containedin=pythonString,pythonUniString,pythonRawString,pythonUniRawString
endif



if exists("python_slow_sync") && python_slow_sync != 0
  syn sync minlines=2000
else
  syn sync maxlines=200
endif

HiLink pythonString		String
HiLink pythonUniString	String
HiLink pythonRawString	String
HiLink pythonUniRawString	String

HiLink pythonUniEscape		Special
HiLink pythonUniRawEscape		Special

HiLink pythonStrFormatting	Special
HiLink pythonStrTemplate	    Special

delcommand HiLink
let b:current_syntax = "python"
