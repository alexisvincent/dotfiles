" Vim syntax file
" Language: SIMPL
" Maintainer: W. H. K. Bester
" Latest Revision: 3 August 2015

if exists("b:current_syntax")
	finish
endif

" keywords
syn keyword	simplBoolean			false true
syn keyword	simplCommand			procedure read write
syn keyword	simplConditional		else elif if
syn keyword	simplOperator			and not or mod
syn keyword	simplOperator			= # < > <= >= + - * / :=
syn keyword	simplRepeat				while
syn keyword	simplBlockStatement		begin do end then
syn keyword	simplDefineStatement	define program ->
syn keyword	simplStatement			chill done
syn keyword	simplType				array boolean integer

" literals
syn match	simplNumber				"-\?\d\+"
syn match	simplIdentifier			"\<[a-zA-Z][a-zA-Z0-9]*\>"
syn match	simplFunction			/\<[a-zA-Z_][a-zA-Z0-9_]*\s*(/me=e-1,he=e-1
syn region	simplString matchgroup=simplString start=+"+ skip=+\\.+ end=+"+

" comments
syn region	simplComment start="(\*" end="\*)" contains=simplTodo,simplComment
syn keyword	simplTodo contained		TODO FIXME XXX DEBUG NOTE HBD
syn match	simplTodo contained		"HERE BE DRAGONS"
syn match	simplTodo contained		"HIC SVNT DRACONES"
" Anyone who alleges a Harry Potter or Game of Thrones reference, will be
" eaten by said dragons.  Fieri potest ut cerebrum tuum liquefiat.

" associations
let b:current_syntax = "simpl"

" The following is a bit colourful, rather like what SublimeText fanboys are
" used to.  Do feel free to tune to taste.

hi def link	simplBlockStatement		Statement
hi def link	simplBoolean			Boolean
hi def link	simplCommand			Function
hi def link	simplComment			Comment
hi def link	simplConditional		Conditional
hi def link	simplDefineStatement	Statement
hi def link simplFunction			Function
hi def link	simplIdentifier			Identifier
hi def link	simplNumber				Number
hi def link	simplRepeat				Repeat
hi def link	simplTodo				Todo
hi def link	simplType				Type
hi def link simplOperator			Operator
hi def link simplStatement			Keyword
hi def link simplString				String

" vim: ts=4 sw=2:
