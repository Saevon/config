" Vim syntax file
" Language:	    SQL
" Maintainer:	Serghei Filippov
" Last Change:	
" Version:      

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'sql'
endif

" Create HiLink Command
if version >= 508 || !exists("did_sql_syn_inits")
  if version <= 508
    let did_python_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
endif

syntax case ignore


" SYNTAX
" Keywords
syn keyword       sqlKeyword       ADD AS CHANGE CHARSET COLLATE COLUMN DROP ENGINE FROM IGNORE INTO KEY MODIFY NOT SET TABLE WHERE
    syn match     sqlKeyMatch      "GROUP\s\+BY"
    syn match     sqlKeyMatch      "RENAME\s*TO"
    syn match     sqlKeyMatch      "CONVERT\s\+TO"
    syn match     sqlKeyMatch      "CHARACTER\s\+SET"
    syn match     sqlKeyMatch      "ON\s\+UPDATE"
    syn keyword   sqlMainKeyword   DELETE INSERT SELECT UPDATE
        syn match sqlMainKeyMatch  "ALTER\s*DATABASE"
        syn match sqlMainKeyMatch  "ALTER\s*TABLE" skipwhite nextgroup=sqlKnownName
        syn match sqlMainKeyMatch  "CREATE\s*DATABASE"
        syn match sqlMainKeyMatch  "CREATE\s*TABLE"
        syn match sqlMainKeyMatch  "CREATE\s*INDEX"
        syn match sqlMainKeyMatch  "CREATE\s*KEY"
        syn match sqlMainKeyMatch  "DROP\s*DATABASE"
        syn match sqlMainKeyMatch  "DROP\s*TABLE"
        syn match sqlMainKeyMatch  "DROP\s*INDEX"
        syn match sqlMainKeyMatch  "DROP\s*KEY"

HiLink          sqlKeyword      Statement
    HiLink      sqlKeyMatch     sqlKeyword
    HiLink      sqlMainKeyword  sqlKeyword
        HiLink  sqlMainKeyMatch sqlMainKeyword

" Statements
syn keyword sqlStatement  CASE ELSE END THEN WHEN

HiLink sqlStatement       Statement

" Functions
syn keyword sqlFunction  count instr substr

HiLink sqlFunction       Function

" Types
syn keyword sqlType  bit
syn keyword sqlType  tinyint smallint mediumint int integer bigint
syn keyword sqlType  float double real decimal numeric
syn keyword sqlType  date datetime timestamp time year
syn keyword sqlType  char varchar binary varbinary enum set
syn keyword sqlType  tinytext text mediumtext longtext
syn keyword sqlType  tinyblob blob mediumblob longblob
syn keyword sqlTypeDescriptor AUTO_INCREMENT CURRENT_TIMESTAMP DEFAULT
syn keyword sqlTypeDescriptor PRIMARY UNSIGNED UNIQUE ZEROFILL

HiLink     sqlType            Type
    HiLink sqlTypeDescriptor  sqlType

" Character Sets
syn keyword sqlCharSet        ascii latin1 utf8
syn keyword sqlCharCollation  utf8_unicode_ci latin1_swedish_ci latin1_bin
syn keyword sqlEngine         MyIsam InoDb

" Constants
syn match   sqlName      "\(['"`]\)[A-Za-z_][A-Za-z0-9_]*\1"
syn match   sqlKnownName "[A-Za-z_][A-Za-z0-9_]*" contained display
syn keyword sqlBool      true false
syn keyword sqlNull      null
syn match   sqlNumber    "\<[0-9]*[.]\=[0-9]\+\>" display
syn region  sqlString    start=+"+ end=+"+
syn region  sqlString    start=+'+ end=+'+

HiLink sqlName     Statement
    HiLink sqlKnownName  sqlName
HiLink sqlBool       Constant
HiLink sqlNull       Constant
HiLink sqlNumber     Number
HiLink sqlString     String

" Operators
syn match   sqlSpecial     "[*]" display
syn match   sqlSpecial     "[;]" display
"FIXME: add the rest
syn match   sqlComparison  "=" display
syn match   sqlComparison  "<>" display
syn match   sqlComparison  ">" display
syn match   sqlComparison  "<" display
syn match   sqlMath        "+" display
syn match   sqlMath        "-" display
syn match   sqlMath        "\\" display

HiLink sqlSpecial    Operator
HiLink sqlComparison Operator
HiLink sqlMath       Operator

" Special
syn region  sqlComment     start="--" end="$"

HiLink sqlComment Comment

if version >= 508 || !exists("did_sql_syn_inits")
    delcommand HiLink
endif

let b:current_syntax = "sql"
if main_syntax == 'sql'
  unlet main_syntax
endif
