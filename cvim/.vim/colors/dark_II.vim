" Vim color file

set background=dark
if version > 580
    hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="dark_II"

hi Normal	guifg=#DFD6C1 guibg=gray14 gui=none

" highlight groups
hi Cursor       guifg=black          guibg=#AAAA77      gui=none
hi CursorLine                        guibg=#223333
hi ErrorMsg     guifg=white          guibg=red			gui=none
hi VertSplit    guifg=gray40         guibg=gray40		gui=none
hi Folded       guifg=DarkSlateGray3 guibg=grey30		gui=none
hi FoldColumn   guifg=tan            guibg=grey30		gui=none
hi IncSearch    guifg=#b0ffff        guibg=#2050d0
hi LineNr       guifg=burlywood3     gui=none
hi ModeMsg      guifg=SkyBlue        gui=none
hi MoreMsg      guifg=SeaGreen       gui=none
hi NonText      guifg=cyan           gui=none
hi Question     guifg=springgreen    gui=none
hi Search       guifg=gray80         guibg=#445599		gui=none
hi SpecialKey   guifg=cyan           gui=none
hi StatusLine   guifg=black          guibg=Pink		gui=bold
hi StatusLineNC guifg=grey           guibg=gray40		gui=none
hi Title        guifg=#ff4400        gui=none			gui=bold
hi Visual       guifg=gray17         guibg=tan1			gui=none
hi WarningMsg   guifg=salmon         gui=none
hi Pmenu        guifg=white          guibg=#445599		gui=none
hi PmenuSel     guifg=#445599        guibg=gray
hi WildMenu     guifg=gray           guibg=gray17		gui=none
hi MatchParen	guifg=cyan           guibg=#6C6C6C		gui=bold
hi DiffAdd      guifg=black          guibg=wheat1
hi DiffChange   guifg=black          guibg=skyblue1
hi DiffText     guifg=black          guibg=hotpink1		gui=none
hi DiffDelete   guibg=gray45         guifg=black		gui=none

" syntax highlighting groups
hi Comment         guifg=#33AF55        gui=italic
hi Constant        guifg=#BBCC55        gui=none
    hi String      guifg=#CC55CC        gui=none
    hi Character   guifg=#CC55CC        gui=none
    hi Number      guifg=#BBCC55        gui=none
hi Identifier      guifg=#DFD6C1        gui=none
hi Statement       guifg=#DFD6C1        gui=none
    "hi Conditional guifg=#449FD9        gui=none
hi Function        guifg=#AA99FF        gui=none
hi PreProc         guifg=#65E670        gui=none
hi Type            guifg=#AAAAFF        gui=none
hi Special         guifg=orange         gui=none
hi Ignore          guifg=red            gui=none
hi Todo            guifg=#FF4444        guibg=#EEBB00     gui=italic,bold

" <<>> Cool Colors <<>>
" Dull Blue: #207FC0

" Python Highlighting for python.vim
hi pythonStatement     guifg=#409FE0    gui=none
hi pythonImport        guifg=#D5A23C    gui=italic
hi pythonConditional   guifg=#D5A23C    gui=none
hi pythonWith          guifg=#D5A23C    gui=none
hi pythonLoop          guifg=#D5A23C    gui=none
hi pythonTry           guifg=#D5A23C    gui=none
hi pythonExit          guifg=#A860A8    gui=none
    hi pythonBreak     guifg=#409FE0    gui=italic
    hi pythonReturn    guifg=#409FE0    gui=italic
    hi pythonRaise     guifg=#FF8FD3    gui=italic
    hi pythonAssert    guifg=#FF8FD3    gui=italic
hi pythonOperator      guifg=#AA99FF    gui=none
hi pythonBitOperator   guifg=#AA99FF    gui=none
hi pythonMathOperator  guifg=#AA99FF    gui=none
hi pythonComparison    guifg=#AA99FF    gui=none
hi pythonAssignment    guifg=#AA99FF    gui=none

hi pythonClassDef      guifg=#8866DF    gui=none
hi pythonClass         guifg=#00BBFF    gui=italic
hi pythonSelf          guifg=#409FE0    gui=italic
hi pythonFunctionDef   guifg=#8866DF    gui=none
hi pythonFunction      guifg=#339980    gui=none
hi pythonDecorator     guifg=#B62020    gui=bold

hi pythonBuiltin       guifg=#409FE0    gui=none
hi pythonBuiltinNull   guifg=#AA99FF    gui=italic
hi pythonBuiltinBool   guifg=#AA99FF    gui=italic
hi pythonBuiltinFunc   guifg=#339980    gui=none
hi pythonBuiltinObj    guifg=#00BBFF    gui=italic
hi pythonExClass       guifg=#00BBFF    gui=italic

hi pythonNumber        guifg=#BBCC55    gui=none
hi pythonFloat         guifg=#BBCC55    gui=none

hi pythonLineCont      guifg=#FF9900    gui=none
hi pythonStrFormatting guifg=#FF9900    gui=none
hi pythonComment       guifg=#33AF55    gui=italic
hi pythonHeading       guifg=#33AF55    gui=italic,bold
" Errors
if exists("python_highlight_errors") && python_highlight_errors != 0
    hi pythonError          guifg=red       gui=bold,undercurl
    hi pythonIndentError    guifg=#DFD6C1   gui=none
    hi pythonSpacingError   guifg=#DFD6C1   gui=none
endif

" PHP Colors
hi phpInclude        guifg=#D5A23C    gui=italic
hi phpStatement      guifg=#D5A23C    gui=none

hi phpFunctions      guifg=#339980    gui=none
hi phpSpecial        guifg=#8866DF    gui=none
hi phpClasses        guifg=#00BBFF    gui=italic
hi phpType           guifg=#00BBFF    gui=italic

hi phpOperator       guifg=#AA99FF    gui=none
hi phpMemberSelector guifg=#AA99FF    gui=none
hi phpVarSelector    guifg=#AFA6C1    gui=none
hi phpIdentifier     guifg=#AFA6C1    gui=italic

hi phpNull           guifg=#AA99FF    gui=italic
hi phpBoolean        guifg=#AA99FF    gui=italic

hi phpNumber         guifg=#BBCC55    gui=none

hi phpSpecialChar    guifg=#FF9900    gui=none
hi phpStrEsc         guifg=#FF9900    gui=none
hi phpComment        guifg=#33AF55    gui=italic

"CFG File
hi cfgSection        guifg=#D5A23C   gui=none
hi cfgProperty       guifg=#409FE0   gui=none
hi cfgBoolean        guifg=#AA99FF   gui=italic
hi cfgNumber         guifg=#BBCC55   gui=none
hi cfgVersionNumber  guifg=#BBCC55   gui=none
hi cfgDelimiter      guifg=#AA99FF   gui=none
hi cfgListItem       guifg=#449980   gui=none
hi cfgLogLevel       guifg=#559999   gui=none
hi cfgLogWarn        guifg=#BB5741   gui=none
hi cfgLogDebug       guifg=#FF5721   gui=none
hi cfgLogError       guifg=#FF3355   gui=none
hi cfgComment        guifg=#33AF55   gui=italic

" SQL
hi sqlKeyword        guifg=#D5A23C   gui=none
hi sqlMainKeyword    guifg=#FF9900   gui=italic
hi sqlFunction       guifg=#339980   gui=none
hi sqlStatement      guifg=#409FE0    gui=none
hi sqlName           guifg=#AFA6C1   gui=none
hi sqlType           guifg=#00BBFF   gui=italic
hi sqlTypeDescriptor guifg=#D5904C   gui=italic
hi sqlComparison     guifg=#AA99FF   gui=none
hi sqlMath           guifg=#AA99FF   gui=none
hi sqlCharSet                        gui=italic
hi sqlCharCollation                  gui=italic
hi sqlEngine                         gui=italic
hi sqlSpecial        guifg=#AA99FF   gui=none
hi sqlNumber         guifg=#BBCC55   gui=none
hi sqlNull           guifg=#AA99FF   gui=italic
hi sqlBool           guifg=#AA99FF   gui=italic
hi sqlString         guifg=#CC55CC   gui=none
hi sqlComment        guifg=#33AF55   gui=italic

" color terminal definitions
hi SpecialKey   ctermfg=red
hi NonText      cterm=bold           ctermfg=darkblue
hi Directory    ctermfg=darkcyan
hi ErrorMsg     cterm=bold           ctermfg=7         ctermbg=1
hi IncSearch    cterm=NONE           ctermfg=yellow    ctermbg=green
hi Search       cterm=NONE           ctermfg=white     ctermbg=grey
hi MoreMsg      ctermfg=darkgreen
hi ModeMsg      cterm=NONE           ctermfg=brown
hi LineNr       ctermfg=3
hi Question     ctermfg=green
hi StatusLine   cterm=bold,reverse
hi StatusLineNC cterm=reverse
hi VertSplit    cterm=reverse
hi Title        ctermfg=5
hi Visual       cterm=reverse
hi VisualNOS    cterm=bold,underline
hi WarningMsg   ctermfg=1
hi WildMenu     ctermfg=0            ctermbg=3
hi Folded       ctermfg=darkgrey     ctermbg=NONE
hi FoldColumn   ctermfg=darkgrey     ctermbg=NONE
hi DiffAdd      ctermbg=4
hi DiffChange   ctermbg=5
hi DiffDelete   cterm=bold           ctermfg=4         ctermbg=6
hi DiffText     cterm=bold           ctermbg=1
hi Comment      ctermfg=DarkGreen    cterm=none
hi Constant     ctermfg=DarkCyan
hi Special      ctermfg=Brown
hi Identifier   ctermfg=DarkCyan
hi Statement    ctermfg=DarkBlue
hi PreProc      ctermfg=DarkBlue
hi Type         ctermfg=2
hi Underlined   cterm=underline      ctermfg=5
hi Ignore       ctermfg=darkgrey
hi Error        cterm=bold           ctermfg=7         ctermbg=1

" Python Highlighting for cterm
hi pythonStatement     ctermfg=DarkBlue     cterm=none
hi pythonImport        ctermfg=Brown        cterm=none
hi pythonConditional   ctermfg=Brown        cterm=none
hi pythonWith          ctermfg=Brown        cterm=none
hi pythonLoop          ctermfg=Brown        cterm=none
hi pythonTry           ctermfg=Brown        cterm=none
hi pythonExit          ctermfg=DarkMagenta  cterm=none
    hi pythonBreak     ctermfg=DarkBlue     cterm=none
    hi pythonReturn    ctermfg=DarkBlue     cterm=none
    hi pythonRaise     ctermfg=Magenta      cterm=bold
    hi pythonAssert    ctermfg=Magenta      cterm=bold
hi pythonOperator      ctermfg=White        cterm=none
hi pythonBitOperator   ctermfg=White        cterm=none
hi pythonMathOperator  ctermfg=White        cterm=none
hi pythonComparison    ctermfg=White        cterm=none

hi pythonClassDef      ctermfg=DarkBlue     cterm=none
hi pythonClass         ctermfg=DarkCyan     cterm=none
hi pythonSelf          ctermfg=DarkBlue     cterm=none
hi pythonFunctionDef   ctermfg=DarkBlue     cterm=none
hi pythonFunction      ctermfg=DarkCyan     cterm=none
hi pythonDecorator     ctermfg=DarkRed      cterm=none

hi pythonBuiltin       ctermfg=DarkCyan     cterm=none
hi pythonBuiltinNull   ctermfg=Blue         cterm=bold
hi pythonBuiltinBool   ctermfg=Blue         cterm=bold
hi pythonBuiltinFunc   ctermfg=DarkCyan     cterm=none
hi pythonBuiltinObj    ctermfg=DarkCyan     cterm=none
hi pythonExClass       ctermfg=DarkCyan     cterm=none

hi pythonNumber        ctermfg=Blue         cterm=bold
hi pythonFloat         ctermfg=Blue         cterm=bold

hi pythonLineCont      ctermfg=DarkYellow   cterm=none
hi pythonStrFormatting ctermfg=DarkYellow   cterm=none
hi pythonComment       ctermfg=DarkGreen    cterm=none
hi pythonHeading       ctermfg=DarkGreen    cterm=none
" Errors
if exists("python_highlight_errors") && python_highlight_errors != 0
    hi pythonError          ctermfg=DarkRed cterm=undercurl
    hi pythonIndentError    ctermfg=DarkRed cterm=undercurl
    hi pythonSpacingError   ctermfg=DarkRed cterm=undercurl
endif
