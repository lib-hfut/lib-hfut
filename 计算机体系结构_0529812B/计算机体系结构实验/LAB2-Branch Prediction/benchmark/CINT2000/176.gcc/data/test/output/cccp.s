	file	 "cccp.i"
data

; cc1 (2.7.2.2) arguments: -O -fdefer-pop -fomit-frame-pointer
; -fcse-follow-jumps -fcse-skip-blocks -fexpensive-optimizations
; -fthread-jumps -fstrength-reduce -funroll-loops -fwritable-strings
; -fpeephole -fforce-mem -ffunction-cse -finline-functions -finline
; -freg-struct-return -fdelayed-branch -frerun-cse-after-loop
; -fschedule-insns -fschedule-insns2 -fcommon -fgnu-linker -m88110 -m88100
; -m88000 -mno-ocs-debug-info -mno-ocs-frame-position -mcheck-zero-division

gcc2_compiled.:
	align	 4
_lint:
	word	 0
	align	 4
_put_out_comments:
	word	 0
	align	 4
_no_trigraphs:
	word	 0
	align	 4
_print_deps:
	word	 0
	align	 4
_print_include_names:
	word	 0
	align	 4
_dump_macros:
	word	 0
	align	 4
_debug_output:
	word	 0
	align	 4
_inhibit_warnings:
	word	 0
	align	 4
_warn_import:
	word	 1
	align	 4
_done_initializing:
	word	 0
	align	 4
_indepth:
	word	 -1
	align	 4
_system_include_depth:
	word	 0
	align	 4
_include_defaults_array:
	word	 @LC0
	word	 1
	word	 @LC1
	word	 0
	word	 @LC2
	word	 0
	word	 @LC3
	word	 0
	word	 0
	word	 0
	align	 8
@LC3:
	string	 "/usr/include\000"
	align	 8
@LC2:
	string	 "/usr/local/include\000"
	align	 8
@LC1:
	string	 "/usr/local/bin\000"
	align	 8
@LC0:
	string	 "/usr\000"
	align	 4
_include_defaults:
	word	 _include_defaults_array
	align	 4
_include:
	word	 0
	align	 4
_first_bracket_include:
	word	 0
	align	 4
_first_system_include:
	word	 0
	align	 4
_last_include:
	word	 0
	align	 4
_after_include:
	word	 0
	align	 4
_last_after_include:
	word	 0
	align	 4
_dont_repeat_files:
	word	 0
	align	 4
_all_include_files:
	word	 0
	align	 4
_stringlist_tailp:
	word	 _stringlist
	align	 8
_rest_extension:
	string	 "...\000"
	align	 8
@LC4:
	string	 "-Dunix -D__osf__ -D__alpha -D__alpha__ -D_LONGLON"
	string	 "G -DSYSTYPE_BSD  -D_SYSTYPE_BSD\000"
	align	 4
_predefs:
	word	 @LC4
	align	 4
_directive_table:
	word	 6
	word	 _do_define
	word	 @LC5
	word	 1
	byte	 0
	byte	 1
	zero	 2
	word	 2
	word	 _do_if
	word	 @LC6
	word	 7
	zero	 4
	word	 5
	word	 _do_xifdef
	word	 @LC7
	word	 5
	zero	 4
	word	 6
	word	 _do_xifdef
	word	 @LC8
	word	 6
	zero	 4
	word	 5
	word	 _do_endif
	word	 @LC9
	word	 15
	zero	 4
	word	 4
	word	 _do_else
	word	 @LC10
	word	 8
	zero	 4
	word	 4
	word	 _do_elif
	word	 @LC11
	word	 10
	zero	 4
	word	 4
	word	 _do_line
	word	 @LC12
	word	 12
	zero	 4
	word	 7
	word	 _do_include
	word	 @LC13
	word	 2
	byte	 1
	zero	 3
	word	 12
	word	 _do_include
	word	 @LC14
	word	 3
	byte	 1
	zero	 3
	word	 6
	word	 _do_include
	word	 @LC15
	word	 4
	byte	 1
	zero	 3
	word	 5
	word	 _do_undef
	word	 @LC16
	word	 11
	zero	 4
	word	 5
	word	 _do_error
	word	 @LC17
	word	 13
	zero	 4
	word	 7
	word	 _do_warning
	word	 @LC18
	word	 14
	zero	 4
	word	 6
	word	 _do_pragma
	word	 @LC19
	word	 9
	byte	 0
	byte	 0
	byte	 1
	zero	 1
	word	 5
	word	 _do_ident
	word	 @LC20
	word	 17
	byte	 0
	byte	 0
	byte	 1
	zero	 1
	word	 6
	word	 _do_assert
	word	 @LC21
	word	 18
	zero	 4
	word	 8
	word	 _do_unassert
	word	 @LC22
	word	 19
	zero	 4
	word	 -1
	word	 0
	word	 @LC23
	word	 35
	zero	 4
	align	 8
@LC23:
	string	 "\000"
	align	 8
@LC22:
	string	 "unassert\000"
	align	 8
@LC21:
	string	 "assert\000"
	align	 8
@LC20:
	string	 "ident\000"
	align	 8
@LC19:
	string	 "pragma\000"
	align	 8
@LC18:
	string	 "warning\000"
	align	 8
@LC17:
	string	 "error\000"
	align	 8
@LC16:
	string	 "undef\000"
	align	 8
@LC15:
	string	 "import\000"
	align	 8
@LC14:
	string	 "include_next\000"
	align	 8
@LC13:
	string	 "include\000"
	align	 8
@LC12:
	string	 "line\000"
	align	 8
@LC11:
	string	 "elif\000"
	align	 8
@LC10:
	string	 "else\000"
	align	 8
@LC9:
	string	 "endif\000"
	align	 8
@LC8:
	string	 "ifndef\000"
	align	 8
@LC7:
	string	 "ifdef\000"
	align	 8
@LC6:
	string	 "if\000"
	align	 8
@LC5:
	string	 "define\000"
	align	 4
_errors:
	word	 0
	align	 4
_if_stack:
	word	 0
	align	 8
@LC24:
	string	 "Usage: %s [switches] input output\000"
	align	 8
@LC25:
	string	 "-include\000"
	align	 8
@LC26:
	string	 "Filename missing after -include option\000"
	align	 8
@LC27:
	string	 "-imacros\000"
	align	 8
@LC28:
	string	 "Filename missing after -imacros option\000"
	align	 8
@LC29:
	string	 "-iprefix\000"
	align	 8
@LC30:
	string	 "Filename missing after -iprefix option\000"
	align	 8
@LC31:
	string	 "-idirafter\000"
	align	 8
@LC32:
	string	 "Directory name missing after -idirafter option\000"
	align	 8
@LC33:
	string	 "Output filename specified twice\000"
	align	 8
@LC34:
	string	 "Filename missing after -o option\000"
	align	 8
@LC35:
	string	 "-\000"
	align	 8
@LC36:
	string	 "\000"
	align	 8
@LC37:
	string	 "-pedantic\000"
	align	 8
@LC38:
	string	 "-pedantic-errors\000"
	align	 8
@LC39:
	string	 "-pcp\000"
	align	 8
@LC40:
	string	 "w\000"
	align	 8
@LC41:
	string	 "w\000"
	align	 8
@LC42:
	string	 "-traditional\000"
	align	 8
@LC43:
	string	 "-trigraphs\000"
	align	 8
@LC44:
	string	 "-lang-c\000"
	align	 8
@LC45:
	string	 "-lang-c++\000"
	align	 8
@LC46:
	string	 "-lang-objc\000"
	align	 8
@LC47:
	string	 "-lang-objc++\000"
	align	 8
@LC48:
	string	 "-lang-asm\000"
	align	 8
@LC49:
	string	 "-lint\000"
	align	 8
@LC50:
	string	 "-Wtrigraphs\000"
	align	 8
@LC51:
	string	 "-Wno-trigraphs\000"
	align	 8
@LC52:
	string	 "-Wcomment\000"
	align	 8
@LC53:
	string	 "-Wno-comment\000"
	align	 8
@LC54:
	string	 "-Wcomments\000"
	align	 8
@LC55:
	string	 "-Wno-comments\000"
	align	 8
@LC56:
	string	 "-Wtraditional\000"
	align	 8
@LC57:
	string	 "-Wno-traditional\000"
	align	 8
@LC58:
	string	 "-Wimport\000"
	align	 8
@LC59:
	string	 "-Wno-import\000"
	align	 8
@LC60:
	string	 "-Werror\000"
	align	 8
@LC61:
	string	 "-Wno-error\000"
	align	 8
@LC62:
	string	 "-Wall\000"
	align	 8
@LC63:
	string	 "-M\000"
	align	 8
@LC64:
	string	 "-MM\000"
	align	 8
@LC65:
	string	 "-MD\000"
	align	 8
@LC66:
	string	 "-MMD\000"
	align	 8
@LC67:
	string	 "-MD\000"
	align	 8
@LC68:
	string	 "-MMD\000"
	align	 8
@LC69:
	string	 "GNU CPP version %s\000"
	align	 8
@LC70:
	string	 "\n\000"
	align	 8
@LC71:
	string	 "Macro name missing after -D option\000"
	align	 8
@LC72:
	string	 "Assertion missing after -A option\000"
	align	 8
@LC73:
	string	 "-\000"
	align	 8
@LC74:
	string	 "-A\000"
	align	 8
@LC75:
	string	 "Macro name missing after -U option\000"
	align	 8
@LC76:
	string	 "-\000"
	align	 8
@LC77:
	string	 "Directory name missing after -I option\000"
	align	 8
@LC78:
	string	 "-nostdinc\000"
	align	 8
@LC79:
	string	 "-nostdinc++\000"
	align	 8
@LC80:
	string	 "-noprecomp\000"
	align	 8
@LC81:
	string	 "\000"
	align	 8
@LC82:
	string	 "\000"
	align	 8
@LC83:
	string	 "Invalid option `%s'\000"
	align	 8
@LC84:
	string	 "CPATH\000"
	align	 8
@LC85:
	string	 "\000"
	align	 8
@LC86:
	string	 "-A\000"
	align	 8
@LC87:
	string	 "C_INCLUDE_PATH\000"
	align	 8
@LC88:
	string	 "CPLUS_INCLUDE_PATH\000"
	align	 8
@LC89:
	string	 "OBJC_INCLUDE_PATH\000"
	align	 8
@LC90:
	string	 "OBJCPLUS_INCLUDE_PATH\000"
	align	 8
@LC91:
	string	 ".\000"
	align	 8
@LC92:
	string	 "/usr/local/bin\000"
	align	 8
@LC93:
	string	 "/include\000"
	align	 8
@LC94:
	string	 "\000"
	align	 8
@LC95:
	string	 "SUNPRO_DEPENDENCIES\000"
	align	 8
@LC96:
	string	 "DEPENDENCIES_OUTPUT\000"
	align	 8
@LC97:
	string	 "DEPENDENCIES_OUTPUT\000"
	align	 8
@LC98:
	string	 "SUNPRO_DEPENDENCIES\000"
	align	 8
@LC99:
	string	 ":\000"
	align	 8
@LC100:
	string	 "-: \000"
	align	 8
@LC101:
	string	 ".o : \000"
	align	 8
@LC102:
	string	 " \000"
	align	 8
@LC103:
	string	 "\000"
	align	 8
@LC104:
	string	 "stdout\000"
	align	 8
@LC105:
	string	 "w\000"
	align	 8
@LC106:
	string	 "file does not end in newline\000"
	align	 8
@LC107:
	string	 "a\000"
	align	 8
@LC108:
	string	 "I/O error on output\000"
	align	 8
@LC109:
	string	 "I/O error on output\000"
text
	align	 8
	global	 _main
_main:
	subu	 r31,r31,192
	st	 r1,r31,84
	st	 r30,r31,80
	st.d	 r24,r31,72
	addu	 r30,r31,80
	st.d	 r16,r31,40
	or	 r17,r0,r2
	st.d	 r22,r31,64
	or	 r22,r0,r3
	st.d	 r20,r31,56
	mak	 r24,r17,0<2>
	st.d	 r18,r31,48
	or	 r2,r0,r24
	bsr.n	 _xmalloc
	st.d	 r14,r31,32
@Ltb0:
	or	 r16,r0,r2
	bsr.n	 _xmalloc
	or	 r2,r0,r24
	or	 r21,r0,r2
	bsr.n	 _xmalloc
	or	 r2,r0,r24
	or	 r18,r0,r2
	bsr.n	 _xmalloc
	or	 r2,r0,r24
	or	 r20,r0,r2
	bsr.n	 _xmalloc
	or	 r2,r0,r24
	or	 r14,r0,r2
	bsr.n	 _xmalloc
	or	 r2,r0,r24
	st	 r2,r30,36
	or	 r2,r0,3
	addu	 r3,r30,8
	bsr.n	 _getrlimit
	st	 r0,r30,44
	ld	 r13,r30,12
	or	 r2,r0,3
	addu	 r3,r30,8
	bsr.n	 _setrlimit
	st	 r13,r30,8
	ld	 r12,r0,r22
	or.u	 r23,r0,hi16(_dollars_in_ident)
	or	 r25,r0,1
	st	 r0,r30,52
	or.u	 r13,r0,hi16(_progname)
	st	 r25,r23,lo16(_dollars_in_ident)
	bsr.n	 _initialize_char_syntax
	st	 r12,r13,lo16(_progname)
	st	 r25,r23,lo16(_dollars_in_ident)
	st	 r0,r30,60
	st	 r0,r30,68
	st	 r0,r30,76
	or.u	 r13,r0,hi16(_no_line_commands)
	st	 r0,r30,84
	st	 r0,r13,lo16(_no_line_commands)
	or.u	 r13,r0,hi16(_no_trigraphs)
	st	 r25,r13,lo16(_no_trigraphs)
	or.u	 r13,r0,hi16(_dump_macros)
	st	 r0,r13,lo16(_dump_macros)
	or.u	 r13,r0,hi16(_no_output)
	st	 r0,r13,lo16(_no_output)
	or.u	 r13,r0,hi16(_cplusplus)
	or	 r2,r0,r16
	st	 r0,r13,lo16(_cplusplus)
	or.u	 r13,r0,hi16(_cplusplus_comments)
	or	 r3,r0,r24
	bsr.n	 _bzero
	st	 r0,r13,lo16(_cplusplus_comments)
	or	 r2,r0,r21
	or	 r3,r0,r24
	bsr.n	 _bzero
	st	 r0,r30,92
	or	 r2,r0,r18
	or	 r3,r0,r24
	bsr.n	 _bzero
	st	 r0,r30,100
	or	 r2,r0,r20
	or	 r3,r0,r24
	bsr.n	 _bzero
	or	 r15,r0,0
	or	 r2,r0,r14
	or	 r3,r0,r24
	bsr.n	 _bzero
	or	 r24,r0,1
	cmp	 r13,r24,r17
	bb0.n	 lt,r13,@L3
	st	 r0,r30,28
	or	 r23,r0,1
@L5:
	ld	 r12,r22[r24]
	ld.b	 r13,r0,r12
	cmp	 r13,r13,45
	bb0	 ne,r13,@L6
	ld	 r7,r30,28
	bcnd.n	 eq0,r7,@L7
	or.u	 r2,r0,hi16(@LC24)
	ld	 r3,r0,r22
	br.n	 @L473
	or	 r2,r2,lo16(@LC24)
	align	 4
@L7:
	bcnd	 eq0,r15,@L9
	st	 r12,r30,28
	br.n	 @L494
	addu	 r24,r24,1
	align	 4
@L9:
	br.n	 @L4
	or	 r15,r0,r12
	align	 4
@L6:
	ld.b	 r11,r12,1
	or.u	 r13,r0,hi16(@L154)
	cmp	 r12,r11,119
	bb0.n	 ls,r12,@L153
	or	 r13,r13,lo16(@L154)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L154:
	word	 @L149
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L134
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L54
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L114
	word	 @L153
	word	 @L131
	word	 @L109
	word	 @L4
	word	 @L153
	word	 @L153
	word	 @L108
	word	 @L135
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L82
	word	 @L153
	word	 @L153
	word	 @L133
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L126
	word	 @L153
	word	 @L56
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L93
	word	 @L153
	word	 @L153
	word	 @L105
	word	 @L153
	word	 @L13
	word	 @L153
	word	 @L153
	word	 @L47
	word	 @L153
	word	 @L142
	word	 @L28
	word	 @L32
	word	 @L153
	word	 @L153
	word	 @L153
	word	 @L42
	word	 @L148
	word	 @L107
	word	 @L55
	align	 4
@L13:
	or.u	 r3,r0,hi16(@LC25)
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC25)
	bcnd.n	 ne0,r2,@L14
	addu	 r12,r24,1
	cmp	 r13,r12,r17
	bb1.n	 ne,r13,@L15
	lda	 r13,r22[r24]
	or.u	 r2,r0,hi16(@LC26)
	or	 r2,r2,lo16(@LC26)
	bsr.n	 _fatal
	addu	 r1,r1,@L522
@L523:
	align	 4
@L15:
	ld	 r13,r13,4
	st	 r13,r14[r24]
	or	 r24,r0,r12
@L14:
	or.u	 r3,r0,hi16(@LC27)
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC27)
	bcnd.n	 ne0,r2,@L17
	addu	 r12,r24,1
	cmp	 r13,r12,r17
	bb1.n	 ne,r13,@L18
	lda	 r13,r22[r24]
	or.u	 r2,r0,hi16(@LC28)
	or	 r2,r2,lo16(@LC28)
	bsr.n	 _fatal
	addu	 r1,r1,@L524
@L525:
	align	 4
@L18:
	ld	 r13,r13,4
	st	 r13,r16[r24]
	or	 r24,r0,r12
@L17:
	or.u	 r3,r0,hi16(@LC29)
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC29)
	bcnd.n	 ne0,r2,@L20
	addu	 r12,r24,1
	cmp	 r13,r12,r17
	bb1.n	 ne,r13,@L21
	or.u	 r13,r0,hi16(_include_prefix)
	or.u	 r2,r0,hi16(@LC30)
	or	 r2,r2,lo16(@LC30)
	bsr.n	 _fatal
	addu	 r1,r1,@L526
@L527:
	align	 4
@L21:
	or	 r24,r0,r12
	ld	 r12,r22[r24]
	st	 r12,r13,lo16(_include_prefix)
@L20:
	or.u	 r3,r0,hi16(@LC31)
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC31)
	bcnd	 ne0,r2,@L4
	bsr.n	 _xmalloc
	or	 r2,r0,12
	or	 r25,r0,r2
	addu	 r12,r24,1
	st	 r0,r0,r25
	cmp	 r13,r12,r17
	bb1.n	 ne,r13,@L24
	st	 r0,r25,8
	or.u	 r2,r0,hi16(@LC32)
	or	 r2,r2,lo16(@LC32)
	bsr.n	 _fatal
	addu	 r1,r1,@L528
@L529:
	align	 4
@L24:
	or	 r24,r0,r12
	ld	 r13,r22[r24]
	st	 r13,r25,4
@L25:
	or.u	 r12,r0,hi16(_after_include)
	ld	 r13,r12,lo16(_after_include)
	bcnd.n	 ne0,r13,@L26
	or.u	 r13,r0,hi16(_last_after_include)
	br.n	 @L520
	st	 r25,r12,lo16(_after_include)
	align	 4
@L26:
	ld	 r13,r13,lo16(_last_after_include)
	st	 r25,r0,r13
	or.u	 r13,r0,hi16(_last_after_include)
@L520:
	br.n	 @L4
	st	 r25,r13,lo16(_last_after_include)
	align	 4
@L28:
	ld	 r7,r30,28
	bcnd	 eq0,r7,@L29
	or.u	 r2,r0,hi16(@LC33)
	bsr.n	 _fatal
	or	 r2,r2,lo16(@LC33)
@L29:
	addu	 r25,r24,1
	cmp	 r13,r25,r17
	bb1.n	 ne,r13,@L492
	or	 r24,r0,r25
	or.u	 r2,r0,hi16(@LC34)
	bsr.n	 _fatal
	or	 r2,r2,lo16(@LC34)
	or	 r24,r0,r25
@L492:
	ld	 r7,r22[r24]
	st	 r7,r30,28
	or.u	 r3,r0,hi16(@LC35)
	ld	 r2,r30,28
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC35)
	bcnd.n	 ne0,r2,@L4
	or.u	 r13,r0,hi16(@LC36)
	or	 r13,r13,lo16(@LC36)
	br.n	 @L4
	st	 r13,r30,28
	align	 4
@L32:
	or.u	 r3,r0,hi16(@LC37)
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC37)
	bcnd.n	 ne0,r2,@L33
	or.u	 r3,r0,hi16(@LC38)
	or.u	 r13,r0,hi16(_pedantic)
	br.n	 @L4
	st	 r23,r13,lo16(_pedantic)
	align	 4
@L33:
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC38)
	bcnd.n	 ne0,r2,@L35
	or.u	 r3,r0,hi16(@LC39)
	or.u	 r13,r0,hi16(_pedantic)
	st	 r23,r13,lo16(_pedantic)
	or.u	 r13,r0,hi16(_pedantic_errors)
	br.n	 @L4
	st	 r23,r13,lo16(_pedantic_errors)
	align	 4
@L35:
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC39)
	bcnd	 ne0,r2,@L4
	addu	 r24,r24,1
	ld	 r25,r22[r24]
	ld.b	 r13,r0,r25
	cmp	 r13,r13,45
	bb1	 ne,r13,@L40
	ld.b	 r13,r25,1
	bcnd.n	 eq0,r13,@L38
	or.u	 r13,r0,hi16(__iob+50)
@L40:
	or.u	 r3,r0,hi16(@LC40)
	or	 r2,r0,r25
	or	 r3,r3,lo16(@LC40)
	bsr.n	 _fopen
	addu	 r1,r1,@L530
@L531:
	align	 4
@L38:
	bsr.n	 _dup
	ld.h	 r2,r13,lo16(__iob+50)
	or.u	 r3,r0,hi16(@LC41)
	bsr.n	 _fdopen
	or	 r3,r3,lo16(@LC41)
@L39:
	or.u	 r7,r0,hi16(_pcp_outfile)
	or	 r7,r7,lo16(_pcp_outfile)
	st	 r2,r0,r7
	or.u	 r7,r0,hi16(_pcp_outfile)
	ld	 r13,r7,lo16(_pcp_outfile)
	bcnd.n	 ne0,r13,@L493
	or.u	 r13,r0,hi16(_no_precomp)
	or	 r2,r0,r25
	bsr.n	 _pfatal_with_name
	addu	 r1,r1,@L532
@L533:
	align	 4
@L42:
	or.u	 r3,r0,hi16(@LC42)
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC42)
	bcnd.n	 ne0,r2,@L43
	or.u	 r11,r0,hi16(_dollars_in_ident)
	ld	 r12,r11,lo16(_dollars_in_ident)
	or.u	 r13,r0,hi16(_traditional)
	bcnd.n	 le0,r12,@L4
	st	 r23,r13,lo16(_traditional)
	br.n	 @L4
	st	 r23,r11,lo16(_dollars_in_ident)
	align	 4
@L43:
	or.u	 r3,r0,hi16(@LC43)
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC43)
	bcnd.n	 ne0,r2,@L4
	or.u	 r13,r0,hi16(_no_trigraphs)
	br.n	 @L4
	st	 r0,r13,lo16(_no_trigraphs)
	align	 4
@L47:
	or.u	 r3,r0,hi16(@LC44)
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC44)
	bcnd.n	 ne0,r2,@L48
	or.u	 r13,r0,hi16(_cplusplus)
	st	 r0,r13,lo16(_cplusplus)
	or.u	 r13,r0,hi16(_cplusplus_comments)
	st	 r0,r13,lo16(_cplusplus_comments)
	or.u	 r13,r0,hi16(_objc)
	st	 r0,r13,lo16(_objc)
@L48:
	or.u	 r3,r0,hi16(@LC45)
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC45)
	bcnd.n	 ne0,r2,@L49
	or.u	 r13,r0,hi16(_cplusplus)
	st	 r23,r13,lo16(_cplusplus)
	or.u	 r13,r0,hi16(_cplusplus_comments)
	st	 r23,r13,lo16(_cplusplus_comments)
	or.u	 r13,r0,hi16(_objc)
	st	 r0,r13,lo16(_objc)
@L49:
	or.u	 r3,r0,hi16(@LC46)
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC46)
	bcnd.n	 ne0,r2,@L50
	or.u	 r13,r0,hi16(_objc)
	st	 r23,r13,lo16(_objc)
	or.u	 r13,r0,hi16(_cplusplus)
	st	 r0,r13,lo16(_cplusplus)
	or.u	 r13,r0,hi16(_cplusplus_comments)
	st	 r23,r13,lo16(_cplusplus_comments)
@L50:
	or.u	 r3,r0,hi16(@LC47)
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC47)
	bcnd.n	 ne0,r2,@L51
	or.u	 r13,r0,hi16(_objc)
	st	 r23,r13,lo16(_objc)
	or.u	 r13,r0,hi16(_cplusplus)
	st	 r23,r13,lo16(_cplusplus)
	or.u	 r13,r0,hi16(_cplusplus_comments)
	st	 r23,r13,lo16(_cplusplus_comments)
@L51:
	or.u	 r3,r0,hi16(@LC48)
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC48)
	bcnd.n	 ne0,r2,@L52
	or.u	 r13,r0,hi16(_lang_asm)
	st	 r23,r13,lo16(_lang_asm)
@L52:
	or.u	 r3,r0,hi16(@LC49)
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC49)
	bcnd.n	 ne0,r2,@L4
	or.u	 r13,r0,hi16(_lint)
	br.n	 @L4
	st	 r23,r13,lo16(_lint)
	align	 4
@L54:
	or.u	 r13,r0,hi16(_cplusplus)
	st	 r23,r13,lo16(_cplusplus)
	or.u	 r13,r0,hi16(_cplusplus_comments)
	br.n	 @L4
	st	 r23,r13,lo16(_cplusplus_comments)
	align	 4
@L55:
	or.u	 r13,r0,hi16(_inhibit_warnings)
	br.n	 @L4
	st	 r23,r13,lo16(_inhibit_warnings)
	align	 4
@L56:
	or.u	 r3,r0,hi16(@LC50)
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC50)
	bcnd.n	 ne0,r2,@L57
	or.u	 r3,r0,hi16(@LC51)
	or.u	 r13,r0,hi16(_warn_trigraphs)
	br.n	 @L4
	st	 r23,r13,lo16(_warn_trigraphs)
	align	 4
@L57:
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC51)
	bcnd.n	 ne0,r2,@L59
	or.u	 r3,r0,hi16(@LC52)
	or.u	 r13,r0,hi16(_warn_trigraphs)
	br.n	 @L4
	st	 r0,r13,lo16(_warn_trigraphs)
	align	 4
@L59:
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC52)
	bcnd.n	 eq0,r2,@L475
	or.u	 r3,r0,hi16(@LC53)
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC53)
	bcnd.n	 eq0,r2,@L476
	or.u	 r3,r0,hi16(@LC54)
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC54)
	bcnd.n	 eq0,r2,@L475
	or.u	 r3,r0,hi16(@LC55)
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC55)
	bcnd.n	 ne0,r2,@L67
	or.u	 r3,r0,hi16(@LC56)
@L476:
	or.u	 r13,r0,hi16(_warn_comments)
	br.n	 @L4
	st	 r0,r13,lo16(_warn_comments)
	align	 4
@L67:
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC56)
	bcnd.n	 ne0,r2,@L69
	or.u	 r3,r0,hi16(@LC57)
	or.u	 r13,r0,hi16(_warn_stringify)
	br.n	 @L4
	st	 r23,r13,lo16(_warn_stringify)
	align	 4
@L69:
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC57)
	bcnd.n	 ne0,r2,@L71
	or.u	 r3,r0,hi16(@LC58)
	or.u	 r13,r0,hi16(_warn_stringify)
	br.n	 @L4
	st	 r0,r13,lo16(_warn_stringify)
	align	 4
@L71:
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC58)
	bcnd.n	 ne0,r2,@L73
	or.u	 r3,r0,hi16(@LC59)
	or.u	 r13,r0,hi16(_warn_import)
	br.n	 @L4
	st	 r23,r13,lo16(_warn_import)
	align	 4
@L73:
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC59)
	bcnd.n	 ne0,r2,@L75
	or.u	 r3,r0,hi16(@LC60)
	or.u	 r13,r0,hi16(_warn_import)
	br.n	 @L4
	st	 r0,r13,lo16(_warn_import)
	align	 4
@L75:
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC60)
	bcnd.n	 ne0,r2,@L77
	or.u	 r3,r0,hi16(@LC61)
	or.u	 r13,r0,hi16(_warnings_are_errors)
	br.n	 @L4
	st	 r23,r13,lo16(_warnings_are_errors)
	align	 4
@L77:
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC61)
	bcnd.n	 ne0,r2,@L79
	or.u	 r3,r0,hi16(@LC62)
	or.u	 r13,r0,hi16(_warnings_are_errors)
	br.n	 @L4
	st	 r0,r13,lo16(_warnings_are_errors)
	align	 4
@L79:
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC62)
	bcnd.n	 ne0,r2,@L4
	or.u	 r13,r0,hi16(_warn_trigraphs)
	st	 r23,r13,lo16(_warn_trigraphs)
@L475:
	or.u	 r13,r0,hi16(_warn_comments)
	br.n	 @L4
	st	 r23,r13,lo16(_warn_comments)
	align	 4
@L82:
	or.u	 r3,r0,hi16(@LC63)
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC63)
	bcnd	 eq0,r2,@L477
	or.u	 r3,r0,hi16(@LC64)
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC64)
	bcnd	 eq0,r2,@L478
	or.u	 r3,r0,hi16(@LC65)
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC65)
	bcnd	 ne0,r2,@L87
@L477:
	or.u	 r13,r0,hi16(_print_deps)
	or	 r7,r0,2
	br.n	 @L84
	st	 r7,r13,lo16(_print_deps)
	align	 4
@L87:
	or.u	 r3,r0,hi16(@LC66)
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC66)
	bcnd	 ne0,r2,@L84
@L478:
	or.u	 r13,r0,hi16(_print_deps)
	st	 r23,r13,lo16(_print_deps)
@L84:
	or.u	 r3,r0,hi16(@LC67)
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC67)
	bcnd.n	 eq0,r2,@L91
	or.u	 r3,r0,hi16(@LC68)
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC68)
	bcnd.n	 ne0,r2,@L90
	or.u	 r13,r0,hi16(__iob+32)
@L91:
	addu	 r24,r24,1
	ld	 r7,r22[r24]
	br.n	 @L4
	st	 r7,r30,84
	align	 4
@L90:
	or	 r7,r0,1
	st	 r7,r30,76
	or	 r13,r13,lo16(__iob+32)
	br.n	 @L4
	st	 r13,r30,92
	align	 4
@L93:
	ld	 r13,r22[r24]
	ld.bu	 r11,r13,2
	ext	 r12,r11,8<0>
	bcnd.n	 eq0,r12,@L4
	addu	 r10,r13,3
	or.u	 r9,r0,hi16(_dump_macros)
	or.u	 r25,r0,hi16(_no_output)
	or	 r8,r0,3
@L96:
	ext	 r12,r11,8<0>
	cmp	 r11,r12,77
	bb0	 ne,r11,@L98
	bb1.n	 gt,r11,@L103
	cmp	 r13,r12,78
	cmp	 r13,r12,68
	bb0	 ne,r13,@L100
	br	 @L94
	align	 4
@L103:
	bb0.n	 ne,r13,@L99
	or	 r7,r0,2
	br	 @L94
	align	 4
@L98:
	st	 r23,r9,lo16(_dump_macros)
	br.n	 @L94
	st	 r23,r25,lo16(_no_output)
	align	 4
@L99:
	br.n	 @L94
	st	 r7,r9,lo16(_dump_macros)
	align	 4
@L100:
	st	 r8,r9,lo16(_dump_macros)
@L94:
	ld.bu	 r11,r0,r10
	ext	 r13,r11,8<0>
	bcnd.n	 ne0,r13,@L96
	addu	 r10,r10,1
	br.n	 @L494
	addu	 r24,r24,1
	align	 4
@L105:
	ld	 r13,r22[r24]
	ld.b	 r13,r13,2
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L4
	or.u	 r13,r0,hi16(_debug_output)
	br.n	 @L4
	st	 r23,r13,lo16(_debug_output)
	align	 4
@L107:
	or.u	 r13,r0,hi16(_version_string)
	or.u	 r25,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC69)
	ld	 r4,r13,lo16(_version_string)
	or	 r25,r25,lo16(__iob+64)
	or	 r3,r3,lo16(@LC69)
	bsr.n	 _fprintf
	or	 r2,r0,r25
	or.u	 r3,r0,hi16(@LC70)
	or	 r2,r0,r25
	or	 r3,r3,lo16(@LC70)
	bsr.n	 _fprintf
	addu	 r1,r1,@L534
@L535:
	align	 4
@L108:
	or.u	 r13,r0,hi16(_print_include_names)
	br.n	 @L4
	st	 r23,r13,lo16(_print_include_names)
	align	 4
@L109:
	ld	 r12,r22[r24]
	ld.b	 r13,r12,2
	bcnd.n	 eq0,r13,@L110
	addu	 r12,r12,2
	br.n	 @L111
	st	 r12,r30,108
	align	 4
@L110:
	addu	 r12,r24,1
	cmp	 r13,r12,r17
	bb1.n	 ne,r13,@L112
	or.u	 r2,r0,hi16(@LC71)
	or	 r2,r2,lo16(@LC71)
	bsr.n	 _fatal
	addu	 r1,r1,@L536
@L537:
	align	 4
@L112:
	or	 r24,r0,r12
	ld	 r7,r22[r12]
	st	 r7,r30,108
@L111:
	ld	 r7,r30,108
	br.n	 @L4
	st	 r7,r21[r24]
	align	 4
@L114:
	ld	 r12,r22[r24]
	ld.b	 r13,r12,2
	bcnd	 eq0,r13,@L115
	addu	 r19,r12,2
	br.n	 @L521
	or.u	 r3,r0,hi16(@LC73)
	align	 4
@L115:
	addu	 r12,r24,1
	cmp	 r13,r12,r17
	bb1.n	 ne,r13,@L117
	or.u	 r2,r0,hi16(@LC72)
	or	 r2,r2,lo16(@LC72)
	bsr.n	 _fatal
	addu	 r1,r1,@L538
@L539:
	align	 4
@L117:
	or	 r24,r0,r12
	ld	 r19,r22[r12]
@L116:
	or.u	 r3,r0,hi16(@LC73)
@L521:
	or	 r2,r0,r19
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC73)
	bcnd.n	 ne0,r2,@L119
	or.u	 r13,r0,hi16(@LC74)
	or	 r7,r0,1
	st	 r7,r30,44
	bcnd.n	 le0,r24,@L4
	or	 r12,r0,0
	mask	 r11,r24,3
	bcnd.n	 eq0,r11,@L123
	cmp	 r13,r11,1
	bb0.n	 gt,r13,@L455
	cmp	 r13,r11,2
	bb0	 gt,r13,@L456
	st	 r0,r0,r20
	or	 r12,r0,1
	st	 r0,r0,r21
@L456:
	st	 r0,r20[r12]
	st	 r0,r21[r12]
	addu	 r12,r12,1
@L455:
	st	 r0,r20[r12]
	st	 r0,r21[r12]
	addu	 r12,r12,1
	cmp	 r11,r12,r24
	bb1	 ge,r11,@L4
@L123:
	st	 r0,r20[r12]
	addu	 r13,r12,1
	st	 r0,r21[r12]
	st	 r0,r20[r13]
	st	 r0,r21[r13]
	addu	 r13,r12,2
	st	 r0,r20[r13]
	st	 r0,r21[r13]
	addu	 r13,r12,3
	addu	 r12,r12,4
	st	 r0,r20[r13]
	cmp	 r11,r12,r24
	bb1.n	 lt,r11,@L123
	st	 r0,r21[r13]
	br.n	 @L494
	addu	 r24,r24,1
	align	 4
@L119:
	ld	 r7,r30,36
	st	 r19,r20[r24]
	or	 r13,r13,lo16(@LC74)
	br.n	 @L4
	st	 r13,r7[r24]
	align	 4
@L126:
	ld	 r12,r22[r24]
	ld.b	 r13,r12,2
	bcnd.n	 eq0,r13,@L127
	addu	 r13,r12,2
	br.n	 @L4
	st	 r13,r18[r24]
	align	 4
@L127:
	addu	 r12,r24,1
	cmp	 r13,r12,r17
	bb1.n	 ne,r13,@L129
	lda	 r13,r22[r24]
	or.u	 r2,r0,hi16(@LC75)
	or	 r2,r2,lo16(@LC75)
	bsr.n	 _fatal
	addu	 r1,r1,@L540
@L541:
	align	 4
@L129:
	ld	 r13,r13,4
	st	 r13,r18[r24]
	br.n	 @L4
	or	 r24,r0,r12
	align	 4
@L131:
	or.u	 r13,r0,hi16(_put_out_comments)
	br.n	 @L4
	st	 r23,r13,lo16(_put_out_comments)
	align	 4
@L133:
	or.u	 r13,r0,hi16(_no_line_commands)
	br.n	 @L4
	st	 r23,r13,lo16(_no_line_commands)
	align	 4
@L134:
	or.u	 r13,r0,hi16(_dollars_in_ident)
	br.n	 @L4
	st	 r0,r13,lo16(_dollars_in_ident)
	align	 4
@L135:
	or.u	 r25,r0,hi16(_ignore_srcdir)
	ld	 r13,r25,lo16(_ignore_srcdir)
	bcnd	 ne0,r13,@L136
	ld	 r2,r22[r24]
	or.u	 r3,r0,hi16(@LC76)
	or	 r3,r3,lo16(@LC76)
	bsr.n	 _strcmp
	addu	 r2,r2,2
	bcnd.n	 ne0,r2,@L136
	or.u	 r13,r0,hi16(_first_bracket_include)
	st	 r23,r25,lo16(_ignore_srcdir)
	br.n	 @L4
	st	 r0,r13,lo16(_first_bracket_include)
	align	 4
@L136:
	bsr.n	 _xmalloc
	or	 r2,r0,12
	or	 r25,r0,r2
	st	 r0,r0,r25
	st	 r0,r25,8
	ld	 r12,r22[r24]
	ld.b	 r13,r12,2
	bcnd.n	 ne0,r13,@L479
	addu	 r13,r12,2
	addu	 r12,r24,1
	cmp	 r13,r12,r17
	bb1.n	 ne,r13,@L140
	or.u	 r2,r0,hi16(@LC77)
	or	 r2,r2,lo16(@LC77)
	bsr.n	 _fatal
	addu	 r1,r1,@L542
@L543:
	align	 4
@L140:
	or	 r24,r0,r12
	ld	 r13,r22[r12]
@L479:
	st	 r13,r25,4
@L139:
	or	 r2,r0,r25
	or	 r3,r0,r2
	bsr.n	 _append_include_chain
	addu	 r1,r1,@L544
@L545:
	align	 4
@L142:
	or.u	 r3,r0,hi16(@LC78)
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC78)
	bcnd.n	 ne0,r2,@L143
	or.u	 r3,r0,hi16(@LC79)
	or	 r7,r0,1
	br.n	 @L4
	st	 r7,r30,52
	align	 4
@L143:
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC79)
	bcnd.n	 ne0,r2,@L145
	or.u	 r3,r0,hi16(@LC80)
	or	 r7,r0,1
	br.n	 @L4
	st	 r7,r30,60
	align	 4
@L145:
	ld	 r2,r22[r24]
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC80)
	bcnd	 ne0,r2,@L4
@L474:
	or.u	 r13,r0,hi16(_no_precomp)
@L493:
	br.n	 @L4
	st	 r23,r13,lo16(_no_precomp)
	align	 4
@L148:
	or	 r7,r0,1
	br.n	 @L4
	st	 r7,r30,44
	align	 4
@L149:
	bcnd.n	 ne0,r15,@L150
	or.u	 r13,r0,hi16(@LC81)
	br.n	 @L4
	or	 r15,r13,lo16(@LC81)
	align	 4
@L150:
	ld	 r7,r30,28
	bcnd.n	 ne0,r7,@L495
	or.u	 r2,r0,hi16(@LC83)
	or.u	 r13,r0,hi16(@LC82)
	or	 r13,r13,lo16(@LC82)
	br.n	 @L4
	st	 r13,r30,28
	align	 4
@L153:
	or.u	 r2,r0,hi16(@LC83)
@L495:
	ld	 r3,r22[r24]
	or	 r2,r2,lo16(@LC83)
@L473:
	bsr	 _fatal
@L4:
	addu	 r24,r24,1
@L494:
	cmp	 r13,r24,r17
	bb1	 lt,r13,@L5
@L3:
	or.u	 r2,r0,hi16(@LC84)
	bsr.n	 _getenv
	or	 r2,r2,lo16(@LC84)
	ld	 r7,r30,52
	cmp	 r12,r2,0
	subu	 r13,r7,1
	extu	 r12,r12,1<ne>
	subu	 r13,r0,r13
	and	 r12,r12,r13
	bcnd	 eq0,r12,@L156
	bsr	 _path_include
@L156:
	bsr	 _initialize_char_syntax
	bsr.n	 _xmalloc
	or	 r2,r0,10
	or.u	 r9,r0,hi16(_indepth)
	or.u	 r13,r0,hi16(_outbuf)
	ld	 r11,r9,lo16(_indepth)
	or	 r3,r13,lo16(_outbuf)
	or	 r12,r0,10
	st	 r2,r3,20
	addu	 r11,r11,1
	st	 r2,r3,24
	mul	 r10,r11,44
	or.u	 r13,r0,hi16(_instack)
	st	 r12,r3,16
	or	 r13,r13,lo16(_instack)
	st	 r11,r9,lo16(_indepth)
	bcnd.n	 ne0,r15,@L157
	addu	 r19,r10,r13
	or.u	 r13,r0,hi16(@LC85)
	or	 r15,r13,lo16(@LC85)
@L157:
	st	 r15,r0,r19
	st	 r15,r19,4
	or	 r2,r0,r19
	bsr.n	 _initialize_builtins
	st	 r0,r19,12
	ld	 r7,r30,44
	bcnd.n	 ne0,r7,@L496
	or	 r24,r0,1
	or.u	 r25,r0,hi16(_predefs)
	bsr.n	 _strlen
	ld	 r2,r25,lo16(_predefs)
	addu	 r2,r2,16
	and	 r2,r2,0xfff0
	subu	 r31,r31,r2
	addu	 r24,r31,32
	ld	 r3,r25,lo16(_predefs)
	bsr.n	 _strcpy
	or	 r2,r0,r24
	ld.b	 r13,r31,32
	bcnd	 eq0,r13,@L158
	ld.b	 r13,r0,r24
	cmp	 r12,r13,32
@L501:
	cmp	 r13,r13,9
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L163
	addu	 r24,r24,1
@L497:
	ld.b	 r12,r0,r24
	cmp	 r13,r12,32
	cmp	 r12,r12,9
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L497
	addu	 r24,r24,1
	subu	 r24,r24,1
@L163:
	ld.bu	 r11,r0,r24
	ext	 r13,r11,8<0>
	cmp	 r13,r13,45
	bb1	 ne,r13,@L179
	ld.b	 r12,r24,1
	cmp	 r13,r12,68
	bb1.n	 ne,r13,@L166
	cmp	 r13,r12,65
	addu	 r25,r24,2
	ext	 r13,r11,8<0>
@L498:
	cmp	 r13,r13,9
	bb0	 ne,r13,@L168
	addu	 r24,r24,1
	ld.bu	 r11,r0,r24
	ext	 r13,r11,8<0>
	cmp	 r12,r13,0
	cmp	 r13,r13,32
	or	 r12,r12,r13
	extu	 r13,r12,1<eq>
	xor	 r12,r13,1
	bcnd.n	 ne0,r12,@L498
	ext	 r13,r11,8<0>
@L168:
	ld.b	 r13,r0,r24
	bcnd	 eq0,r13,@L172
	st.b	 r0,r0,r24
	addu	 r24,r24,1
@L172:
	or.u	 r13,r0,hi16(_debug_output)
	ld	 r13,r13,lo16(_debug_output)
	bcnd.n	 eq0,r13,@L173
	or	 r2,r0,r19
	or	 r4,r0,0
	or.u	 r3,r0,hi16(_outbuf)
	or	 r5,r0,0
	bsr.n	 _output_line_command
	or	 r3,r3,lo16(_outbuf)
@L173:
	or.u	 r3,r0,hi16(_outbuf)
	or	 r2,r0,r25
	bsr.n	 _make_definition
	or	 r3,r3,lo16(_outbuf)
	ld.b	 r13,r0,r24
	cmp	 r12,r13,32
	cmp	 r13,r13,9
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L159
	addu	 r24,r24,1
@L499:
	ld.b	 r12,r0,r24
	cmp	 r13,r12,32
	cmp	 r12,r12,9
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L499
	addu	 r24,r24,1
	br.n	 @L159
	subu	 r24,r24,1
	align	 4
@L166:
	bb1	 ne,r13,@L179
	ld.b	 r13,r24,2
	cmp	 r12,r13,0
	cmp	 r13,r13,32
	or	 r12,r12,r13
	addu	 r3,r24,2
	extu	 r13,r12,1<eq>
	xor	 r12,r13,1
	bcnd.n	 eq0,r12,@L480
	or	 r11,r0,r3
@L184:
	ld.b	 r13,r0,r11
	cmp	 r12,r13,9
	cmp	 r13,r13,40
	or	 r12,r12,r13
	extu	 r13,r12,1<eq>
	xor	 r12,r13,1
	bcnd	 eq0,r12,@L480
	addu	 r11,r11,1
	ld.b	 r13,r0,r11
	cmp	 r12,r13,0
	cmp	 r13,r13,32
	or	 r12,r12,r13
	extu	 r13,r12,1<eq>
	xor	 r12,r13,1
	bcnd	 eq0,r12,@L480
	br	 @L184
	align	 4
@L189:
	ext	 r12,r12,8<0>
	cmp	 r13,r12,32
	cmp	 r12,r12,9
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L186
	addu	 r11,r11,1
@L480:
	ld.bu	 r12,r0,r11
	ext	 r13,r12,8<0>
	bcnd	 ne0,r13,@L189
@L186:
	ld.b	 r13,r0,r11
	cmp	 r13,r13,40
	bb1.n	 eq,r13,@L481
	addu	 r11,r11,1
	bsr	 _abort
	align	 4
@L195:
	cmp	 r13,r12,32
	cmp	 r12,r12,9
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L192
	addu	 r11,r11,1
@L481:
	ld.bu	 r12,r0,r11
	ext	 r13,r12,8<0>
	bcnd.n	 ne0,r13,@L195
	ext	 r12,r12,8<0>
@L192:
	br.n	 @L482
	or	 r10,r0,r11
	align	 4
@L200:
	cmp	 r12,r13,9
	cmp	 r13,r13,41
	or	 r12,r12,r13
	extu	 r13,r12,1<eq>
	xor	 r12,r13,1
	bcnd	 eq0,r12,@L197
	addu	 r10,r10,1
@L482:
	ld.bu	 r11,r0,r10
	ext	 r13,r11,8<0>
	cmp	 r12,r13,0
	cmp	 r13,r13,32
	or	 r12,r12,r13
	extu	 r13,r12,1<eq>
	xor	 r12,r13,1
	bcnd.n	 ne0,r12,@L200
	ext	 r13,r11,8<0>
@L197:
	br.n	 @L483
	or	 r24,r0,r10
	align	 4
@L205:
	ext	 r12,r12,8<0>
	cmp	 r13,r12,32
	cmp	 r12,r12,9
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L202
	addu	 r24,r24,1
@L483:
	ld.bu	 r12,r0,r24
	ext	 r13,r12,8<0>
	bcnd	 ne0,r13,@L205
@L202:
	ld.b	 r13,r0,r24
	cmp	 r13,r13,41
	bb0.n	 ne,r13,@L206
	addu	 r24,r24,1
	bsr	 _abort
	align	 4
@L206:
	ld.b	 r11,r0,r24
	cmp	 r13,r11,0
	cmp	 r12,r11,32
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L207
	cmp	 r13,r11,9
	bb0	 ne,r13,@L207
	bsr	 _abort
	align	 4
@L207:
	ld.b	 r25,r0,r24
	or.u	 r2,r0,hi16(@LC86)
	or	 r2,r2,lo16(@LC86)
	bsr.n	 _make_assertion
	st.b	 r0,r0,r24
	cmp	 r12,r25,32
	cmp	 r13,r25,9
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L159
	st.b	 r25,r0,r24
	addu	 r24,r24,1
@L500:
	ld.b	 r12,r0,r24
	cmp	 r13,r12,32
	cmp	 r12,r12,9
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L500
	addu	 r24,r24,1
	br.n	 @L159
	subu	 r24,r24,1
	align	 4
@L179:
	bsr	 _abort
	align	 4
@L159:
	ld.b	 r13,r0,r24
	bcnd.n	 ne0,r13,@L501
	cmp	 r12,r13,32
@L158:
	or	 r24,r0,1
@L496:
	cmp	 r13,r24,r17
	bb0	 lt,r13,@L215
	or.u	 r22,r0,hi16(_debug_output)
	bb1.n	 (31-31),r17,@L217
	or.u	 r23,r0,hi16(_outbuf)
	ld	 r13,r18,4
	bcnd	 eq0,r13,@L425
	ld	 r13,r22,lo16(_debug_output)
	bcnd.n	 eq0,r13,@L426
	or	 r2,r0,r19
	or	 r3,r23,lo16(_outbuf)
	or	 r4,r0,0
	bsr.n	 _output_line_command
	or	 r5,r0,0
@L426:
	ld	 r2,r18,4
	bsr.n	 _make_undef
	or	 r3,r23,lo16(_outbuf)
@L425:
	ld	 r13,r21[r24]
	bcnd	 eq0,r13,@L427
	ld	 r13,r22,lo16(_debug_output)
	bcnd.n	 eq0,r13,@L428
	or	 r2,r0,r19
	or	 r3,r23,lo16(_outbuf)
	or	 r4,r0,0
	bsr.n	 _output_line_command
	or	 r5,r0,0
@L428:
	ld	 r2,r21[r24]
	bsr.n	 _make_definition
	or	 r3,r23,lo16(_outbuf)
@L427:
	ld	 r3,r20[r24]
	bcnd	 eq0,r3,@L423
	ld	 r7,r30,36
	bsr.n	 _make_assertion
	ld	 r2,r7[r24]
@L423:
	addu	 r24,r24,1
	cmp	 r13,r24,r17
	bb1.n	 ge,r13,@L502
	or.u	 r13,r0,hi16(_objc)
@L217:
	ld	 r13,r18[r24]
	bcnd	 eq0,r13,@L432
	ld	 r13,r22,lo16(_debug_output)
	bcnd.n	 eq0,r13,@L433
	or	 r2,r0,r19
	or	 r3,r23,lo16(_outbuf)
	or	 r4,r0,0
	bsr.n	 _output_line_command
	or	 r5,r0,0
@L433:
	ld	 r2,r18[r24]
	bsr.n	 _make_undef
	or	 r3,r23,lo16(_outbuf)
@L432:
	ld	 r13,r21[r24]
	bcnd	 eq0,r13,@L434
	ld	 r13,r22,lo16(_debug_output)
	bcnd.n	 eq0,r13,@L435
	or	 r2,r0,r19
	or	 r3,r23,lo16(_outbuf)
	or	 r4,r0,0
	bsr.n	 _output_line_command
	or	 r5,r0,0
@L435:
	ld	 r2,r21[r24]
	bsr.n	 _make_definition
	or	 r3,r23,lo16(_outbuf)
@L434:
	ld	 r3,r20[r24]
	bcnd.n	 eq0,r3,@L503
	addu	 r25,r24,1
	ld	 r7,r30,36
	bsr.n	 _make_assertion
	ld	 r2,r7[r24]
	addu	 r25,r24,1
@L503:
	ld	 r13,r18[r25]
	bcnd	 eq0,r13,@L439
	ld	 r13,r22,lo16(_debug_output)
	bcnd.n	 eq0,r13,@L440
	or	 r2,r0,r19
	or	 r3,r23,lo16(_outbuf)
	or	 r4,r0,0
	bsr.n	 _output_line_command
	or	 r5,r0,0
@L440:
	ld	 r2,r18[r25]
	bsr.n	 _make_undef
	or	 r3,r23,lo16(_outbuf)
@L439:
	ld	 r13,r21[r25]
	bcnd	 eq0,r13,@L441
	ld	 r13,r22,lo16(_debug_output)
	bcnd.n	 eq0,r13,@L442
	or	 r2,r0,r19
	or	 r3,r23,lo16(_outbuf)
	or	 r4,r0,0
	bsr.n	 _output_line_command
	or	 r5,r0,0
@L442:
	ld	 r2,r21[r25]
	bsr.n	 _make_definition
	or	 r3,r23,lo16(_outbuf)
@L441:
	ld	 r3,r20[r25]
	bcnd	 eq0,r3,@L437
	ld	 r7,r30,36
	bsr.n	 _make_assertion
	ld	 r2,r7[r25]
@L437:
	addu	 r24,r24,2
	cmp	 r13,r24,r17
	bb1	 lt,r13,@L217
@L215:
	or.u	 r13,r0,hi16(_objc)
@L502:
	ld	 r11,r13,lo16(_objc)
	or.u	 r13,r0,hi16(_cplusplus)
	ld	 r13,r13,lo16(_cplusplus)
	or	 r25,r0,0
	or.u	 r12,r0,hi16(_done_initializing)
	lda.h	 r11,r13[r11]
	or	 r13,r0,1
	cmp	 r10,r11,1
	bb0.n	 ne,r10,@L226
	st	 r13,r12,lo16(_done_initializing)
	bb1	 gt,r10,@L231
	bcnd.n	 eq0,r11,@L225
	or.u	 r2,r0,hi16(@LC87)
	br	 @L224
	align	 4
@L231:
	cmp	 r13,r11,2
	bb0.n	 ne,r13,@L227
	cmp	 r13,r11,3
	bb0.n	 ne,r13,@L228
	or.u	 r2,r0,hi16(@LC90)
	br	 @L224
	align	 4
@L225:
	br.n	 @L484
	or	 r2,r2,lo16(@LC87)
	align	 4
@L226:
	or.u	 r2,r0,hi16(@LC88)
	br.n	 @L484
	or	 r2,r2,lo16(@LC88)
	align	 4
@L227:
	or.u	 r2,r0,hi16(@LC89)
	br.n	 @L484
	or	 r2,r2,lo16(@LC89)
	align	 4
@L228:
	or	 r2,r2,lo16(@LC90)
@L484:
	bsr	 _getenv
	or	 r25,r0,r2
@L224:
	bcnd.n	 eq0,r25,@L232
	or	 r2,r0,r25
	bsr.n	 _strlen
	or	 r24,r0,r25
	addu	 r2,r2,17
	ld.bu	 r11,r0,r24
	and	 r2,r2,0xfff0
	or	 r20,r0,1
	subu	 r31,r31,r2
	ext	 r13,r11,8<0>
	bcnd.n	 eq0,r13,@L234
	addu	 r21,r31,32
@L236:
	ext	 r13,r11,8<0>
	addu	 r24,r24,1
	cmp	 r13,r13,58
	ld.bu	 r11,r0,r24
	extu	 r13,r13,1<eq>
	ext	 r12,r11,8<0>
	bcnd.n	 ne0,r12,@L236
	addu	 r20,r20,r13
@L234:
	mak	 r2,r20,0<3>
	or	 r23,r0,r25
	or	 r20,r0,0
	or	 r22,r0,0
	or.u	 r18,r0,hi16(@LC91)
	or.u	 r25,r0,hi16(_include_defaults)
	addu	 r2,r2,40
	bsr.n	 _xmalloc
	or	 r24,r0,r23
	st	 r2,r25,lo16(_include_defaults)
@L241:
	ld.b	 r13,r0,r23
	cmp	 r12,r13,58
	cmp	 r13,r13,0
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L242
	or	 r2,r0,r21
	subu	 r25,r23,r24
	or	 r3,r0,r24
	bsr.n	 _strncpy
	or	 r4,r0,r25
	cmp	 r13,r23,r24
	bb1.n	 ne,r13,@L243
	or.u	 r7,r0,hi16(@LC91)
	ld.bu	 r13,r18,lo16(@LC91)
	or	 r7,r7,lo16(@LC91)
	ld.bu	 r12,r7,1
	st.b	 r13,r0,r21
	br.n	 @L244
	st.b	 r12,r21,1
	align	 4
@L243:
	st.b	 r0,r21,r25
@L244:
	bsr.n	 _savestring
	or	 r2,r0,r21
	or.u	 r13,r0,hi16(_include_defaults)
	ld	 r12,r13,lo16(_include_defaults)
	or.u	 r13,r0,hi16(_cplusplus)
	ld	 r13,r13,lo16(_cplusplus)
	st	 r2,r12,r22
	addu	 r12,r12,r22
	st	 r13,r12,4
	ld.b	 r13,r0,r23
	addu	 r20,r20,1
	bcnd.n	 eq0,r13,@L240
	addu	 r22,r22,8
	addu	 r23,r23,1
	br.n	 @L241
	or	 r24,r0,r23
	align	 4
@L242:
	br.n	 @L241
	addu	 r23,r23,1
	align	 4
@L240:
	or.u	 r13,r0,hi16(_include_defaults)
	or.u	 r2,r0,hi16(_include_defaults_array)
	ld	 r13,r13,lo16(_include_defaults)
	or	 r4,r0,40
	or	 r2,r2,lo16(_include_defaults_array)
	bsr.n	 _bcopy
	lda.d	 r3,r13[r20]
@L232:
	ld	 r7,r30,52
	or.u	 r23,r0,hi16(_first_system_include)
	bcnd.n	 ne0,r7,@L248
	st	 r0,r23,lo16(_first_system_include)
	or.u	 r2,r0,hi16(@LC92)
	or.u	 r13,r0,hi16(_include_prefix)
	or	 r2,r2,lo16(@LC92)
	bsr.n	 _savestring
	ld	 r20,r13,lo16(_include_prefix)
	or	 r21,r0,r2
	bsr.n	 _strlen
	or	 r22,r0,0
	addu	 r2,r21,r2
	or.u	 r3,r0,hi16(@LC93)
	subu	 r2,r2,8
	or	 r3,r3,lo16(@LC93)
	bsr.n	 _strcmp
	or.u	 r25,r0,hi16(_include_defaults)
	bcnd.n	 ne0,r2,@L504
	cmp	 r13,r20,0
	bsr.n	 _strlen
	or	 r2,r0,r21
	subu	 r22,r2,7
	st.b	 r0,r21,r22
	cmp	 r13,r20,0
@L504:
	cmp	 r12,r22,0
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L505
	or.u	 r13,r0,hi16(_include_defaults)
	ld	 r24,r25,lo16(_include_defaults)
	ld	 r13,r0,r24
	bcnd	 eq0,r13,@L250
	or	 r18,r0,r23
@L254:
	ld	 r13,r24,4
	bcnd.n	 eq0,r13,@L256
	or.u	 r13,r0,hi16(_cplusplus)
	ld	 r7,r30,60
	ld	 r13,r13,lo16(_cplusplus)
	cmp	 r12,r7,0
	cmp	 r13,r13,0
	and.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L253
@L256:
	ld	 r2,r0,r24
	or	 r3,r0,r21
	bsr.n	 _strncmp
	or	 r4,r0,r22
	bcnd	 ne0,r2,@L253
	bsr.n	 _xmalloc
	or	 r2,r0,12
	or	 r23,r0,r2
	bsr.n	 _strlen
	or	 r2,r0,r20
	or	 r25,r0,r2
	bsr.n	 _strlen
	ld	 r2,r0,r24
	addu	 r25,r25,r2
	subu	 r25,r25,r22
	bsr.n	 _xmalloc
	addu	 r2,r25,1
	or	 r25,r0,r2
	bsr.n	 _strcpy
	or	 r3,r0,r20
	ld	 r3,r0,r24
	or	 r2,r0,r25
	bsr.n	 _strcat
	addu	 r3,r3,r22
	st	 r25,r23,4
	or	 r2,r0,r23
	or	 r3,r0,r23
	bsr.n	 _append_include_chain
	st	 r0,r23,8
	ld	 r13,r18,lo16(_first_system_include)
	bcnd	 ne0,r13,@L253
	st	 r23,r18,lo16(_first_system_include)
@L253:
	addu	 r24,r24,8
	ld	 r13,r0,r24
	bcnd	 ne0,r13,@L254
@L250:
	or.u	 r13,r0,hi16(_include_defaults)
@L505:
	ld	 r24,r13,lo16(_include_defaults)
	ld	 r13,r0,r24
	bcnd	 eq0,r13,@L248
	or.u	 r23,r0,hi16(_first_system_include)
@L263:
	ld	 r13,r24,4
	bcnd.n	 eq0,r13,@L265
	or.u	 r13,r0,hi16(_cplusplus)
	ld	 r7,r30,60
	ld	 r13,r13,lo16(_cplusplus)
	cmp	 r12,r7,0
	cmp	 r13,r13,0
	and.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L262
@L265:
	bsr.n	 _xmalloc
	or	 r2,r0,12
	or	 r25,r0,r2
	st	 r0,r25,8
	ld	 r13,r0,r24
	or	 r3,r0,r25
	bsr.n	 _append_include_chain
	st	 r13,r25,4
	ld	 r13,r23,lo16(_first_system_include)
	bcnd	 ne0,r13,@L262
	st	 r25,r23,lo16(_first_system_include)
@L262:
	addu	 r24,r24,8
	ld	 r13,r0,r24
	bcnd	 ne0,r13,@L263
@L248:
	or.u	 r25,r0,hi16(_after_include)
	or.u	 r13,r0,hi16(_last_after_include)
	ld	 r2,r25,lo16(_after_include)
	bsr.n	 _append_include_chain
	ld	 r3,r13,lo16(_last_after_include)
	or.u	 r12,r0,hi16(_first_system_include)
	ld	 r13,r12,lo16(_first_system_include)
	bcnd.n	 ne0,r13,@L506
	or.u	 r13,r0,hi16(_no_output)
	ld	 r13,r25,lo16(_after_include)
	st	 r13,r12,lo16(_first_system_include)
	or.u	 r13,r0,hi16(_no_output)
@L506:
	or	 r24,r0,1
	ld	 r12,r13,lo16(_no_output)
	cmp	 r11,r24,r17
	addu	 r12,r12,1
	bb0.n	 lt,r11,@L270
	st	 r12,r13,lo16(_no_output)
	subu	 r13,r17,1
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L272
	or.u	 r25,r0,hi16(_outbuf)
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L488
	cmp	 r13,r12,2
	bb0	 gt,r13,@L490
	ld	 r2,r16,4
	bcnd.n	 eq0,r2,@L396
	or	 r3,r0,0
	bsr.n	 _open
	or	 r4,r0,438
	bcnd	 lt0,r2,@L359
	ld	 r3,r16,4
	or	 r4,r25,lo16(_outbuf)
	or	 r5,r0,0
	bsr.n	 _finclude
	or	 r6,r0,0
@L396:
	br.n	 @L490
	or	 r24,r0,2
	align	 4
@L272:
	ld	 r2,r16[r24]
	bcnd.n	 eq0,r2,@L405
	or	 r3,r0,0
	bsr.n	 _open
	or	 r4,r0,438
	bcnd	 lt0,r2,@L359
	ld	 r3,r16[r24]
	or	 r4,r25,lo16(_outbuf)
	or	 r5,r0,0
	bsr.n	 _finclude
	or	 r6,r0,0
@L405:
	addu	 r24,r24,1
	ld	 r2,r16[r24]
	bcnd.n	 eq0,r2,@L408
	or	 r3,r0,0
	bsr.n	 _open
	or	 r4,r0,438
	bcnd	 lt0,r2,@L359
	ld	 r3,r16[r24]
	or	 r4,r25,lo16(_outbuf)
	or	 r5,r0,0
	bsr.n	 _finclude
	or	 r6,r0,0
@L408:
	addu	 r24,r24,1
@L490:
	ld	 r2,r16[r24]
	bcnd.n	 eq0,r2,@L411
	or	 r3,r0,0
	bsr.n	 _open
	or	 r4,r0,438
	bcnd	 lt0,r2,@L359
	ld	 r3,r16[r24]
	or	 r4,r25,lo16(_outbuf)
	or	 r5,r0,0
	bsr.n	 _finclude
	or	 r6,r0,0
@L411:
	addu	 r24,r24,1
@L488:
	ld	 r2,r16[r24]
	bcnd.n	 eq0,r2,@L414
	or	 r3,r0,0
	bsr.n	 _open
	or	 r4,r0,438
	bcnd	 lt0,r2,@L359
	ld	 r3,r16[r24]
	or	 r4,r25,lo16(_outbuf)
	or	 r5,r0,0
	bsr.n	 _finclude
	or	 r6,r0,0
@L414:
	addu	 r24,r24,1
	cmp	 r13,r24,r17
	bb1	 lt,r13,@L272
@L270:
	or.u	 r12,r0,hi16(_no_output)
	ld	 r13,r12,lo16(_no_output)
	subu	 r13,r13,1
	bcnd.n	 eq0,r15,@L277
	st	 r13,r12,lo16(_no_output)
	ld.b	 r13,r0,r15
	bcnd.n	 ne0,r13,@L276
	or	 r2,r0,r15
@L277:
	or.u	 r13,r0,hi16(@LC94)
	or	 r22,r0,0
	br.n	 @L278
	or	 r15,r13,lo16(@LC94)
	align	 4
@L276:
	or	 r3,r0,0
	bsr.n	 _open
	or	 r4,r0,438
	or	 r22,r0,r2
	bcnd	 lt0,r22,@L280
@L278:
	or.u	 r25,r0,hi16(_print_deps)
	ld	 r13,r25,lo16(_print_deps)
	bcnd.n	 ne0,r13,@L358
	or.u	 r2,r0,hi16(@LC95)
	bsr.n	 _getenv
	or	 r2,r2,lo16(@LC95)
	bcnd	 ne0,r2,@L282
	or.u	 r2,r0,hi16(@LC96)
	bsr.n	 _getenv
	or	 r2,r2,lo16(@LC96)
	bcnd.n	 eq0,r2,@L507
	or.u	 r13,r0,hi16(_print_deps)
@L282:
	or.u	 r2,r0,hi16(@LC97)
	bsr.n	 _getenv
	or	 r2,r2,lo16(@LC97)
	or	 r23,r0,r2
	bcnd.n	 ne0,r23,@L283
	or	 r13,r0,1
	or.u	 r2,r0,hi16(@LC98)
	bsr.n	 _getenv
	or	 r2,r2,lo16(@LC98)
	or	 r13,r0,2
	st	 r13,r25,lo16(_print_deps)
	br.n	 @L284
	or	 r23,r0,r2
	align	 4
@L283:
	st	 r13,r25,lo16(_print_deps)
@L284:
	ld.b	 r13,r0,r23
	cmp	 r12,r13,0
	cmp	 r13,r13,32
	or	 r12,r12,r13
	extu	 r13,r12,1<eq>
	xor	 r12,r13,1
	bcnd.n	 eq0,r12,@L286
	or	 r11,r0,r23
	addu	 r11,r11,1
@L508:
	ld.b	 r13,r0,r11
	cmp	 r12,r13,0
	cmp	 r13,r13,32
	or	 r12,r12,r13
	extu	 r13,r12,1<eq>
	xor	 r12,r13,1
	bcnd.n	 ne0,r12,@L508
	addu	 r11,r11,1
	subu	 r11,r11,1
@L286:
	ld.b	 r13,r0,r11
	bcnd.n	 eq0,r13,@L289
	subu	 r25,r11,r23
	addu	 r11,r11,1
	addu	 r2,r25,1
	bsr.n	 _xmalloc
	st	 r11,r30,100
	or	 r24,r0,r2
	or	 r2,r0,r23
	or	 r4,r0,r25
	bsr.n	 _bcopy
	or	 r3,r0,r24
	br.n	 @L290
	st.b	 r0,r24,r25
	align	 4
@L289:
	or	 r24,r0,r23
	st	 r0,r30,100
@L290:
	st	 r24,r30,84
	or.u	 r13,r0,hi16(_print_deps)
@L507:
	ld	 r13,r13,lo16(_print_deps)
	bcnd.n	 eq0,r13,@L509
	or	 r2,r0,r22
@L358:
	or	 r2,r0,200
	or.u	 r12,r0,hi16(_deps_allocated_size)
	or	 r13,r0,200
	bsr.n	 _xmalloc
	st	 r13,r12,lo16(_deps_allocated_size)
	or.u	 r13,r0,hi16(_deps_buffer)
	st	 r2,r13,lo16(_deps_buffer)
	st.b	 r0,r0,r2
	ld	 r7,r30,100
	or.u	 r13,r0,hi16(_deps_size)
	st	 r0,r13,lo16(_deps_size)
	or.u	 r13,r0,hi16(_deps_column)
	bcnd.n	 eq0,r7,@L292
	st	 r0,r13,lo16(_deps_column)
	ld	 r2,r30,100
	bsr.n	 _deps_output
	or	 r3,r0,0
	or.u	 r2,r0,hi16(@LC99)
	or	 r3,r0,0
	br.n	 @L485
	or	 r2,r2,lo16(@LC99)
	align	 4
@L292:
	ld.b	 r13,r0,r15
	bcnd.n	 ne0,r13,@L294
	or	 r25,r0,r15
	or.u	 r2,r0,hi16(@LC100)
	or	 r3,r0,0
	br.n	 @L485
	or	 r2,r2,lo16(@LC100)
	align	 4
@L294:
	or	 r12,r0,r15
	ld.b	 r13,r0,r12
	cmp	 r13,r13,47
@L510:
	bb1	 ne,r13,@L299
	addu	 r25,r12,1
@L299:
	addu	 r12,r12,1
	ld.b	 r13,r0,r12
	bcnd.n	 ne0,r13,@L510
	cmp	 r13,r13,47
	bsr.n	 _strlen
	or	 r2,r0,r25
	or	 r3,r0,r2
	subu	 r13,r0,2
	addu	 r12,r3,r25
	ld.b	 r13,r12,r13
	cmp	 r13,r13,46
	bb1.n	 ne,r13,@L511
	subu	 r13,r0,3
	subu	 r13,r0,1
	ld.b	 r12,r12,r13
	cmp	 r13,r12,99
	bb1.n	 ne,r13,@L301
	cmp	 r13,r12,67
	or	 r2,r0,r25
	br.n	 @L486
	subu	 r3,r3,2
	align	 4
@L301:
	bb1.n	 ne,r13,@L303
	subu	 r13,r0,3
	or	 r2,r0,r25
	br.n	 @L486
	subu	 r3,r3,2
	align	 4
@L303:
	addu	 r12,r3,r25
@L511:
	ld.b	 r13,r12,r13
	cmp	 r13,r13,46
	bb1.n	 ne,r13,@L512
	subu	 r13,r0,2
	ld.b	 r13,r12,r13
	cmp	 r13,r13,99
	bb1.n	 ne,r13,@L512
	subu	 r13,r0,2
	subu	 r13,r0,1
	ld.b	 r13,r12,r13
	cmp	 r13,r13,99
	bb1.n	 ne,r13,@L305
	subu	 r13,r0,2
	or	 r2,r0,r25
	br.n	 @L486
	subu	 r3,r3,3
	align	 4
@L305:
@L512:
	addu	 r12,r3,r25
	ld.b	 r13,r12,r13
	cmp	 r13,r13,46
	bb1.n	 ne,r13,@L513
	or	 r2,r0,r25
	subu	 r13,r0,1
	ld.b	 r12,r12,r13
	cmp	 r13,r12,115
	bb1.n	 ne,r13,@L307
	cmp	 r13,r12,83
	or	 r2,r0,r25
	br.n	 @L486
	subu	 r3,r3,2
	align	 4
@L307:
	bb1.n	 ne,r13,@L309
	cmp	 r13,r12,109
	or	 r2,r0,r25
	br.n	 @L486
	subu	 r3,r3,2
	align	 4
@L309:
	bb1.n	 ne,r13,@L311
	or	 r2,r0,r25
	br.n	 @L486
	subu	 r3,r3,2
	align	 4
@L311:
@L513:
	or	 r3,r0,0
@L486:
	bsr	 _deps_output
	or.u	 r2,r0,hi16(@LC101)
	or	 r3,r0,0
	bsr.n	 _deps_output
	or	 r2,r2,lo16(@LC101)
	or	 r2,r0,r15
	bsr.n	 _deps_output
	or	 r3,r0,0
	or.u	 r2,r0,hi16(@LC102)
	or	 r3,r0,0
	or	 r2,r2,lo16(@LC102)
@L485:
	bsr	 _deps_output
	or	 r2,r0,r22
@L509:
	addu	 r3,r30,16
	bsr.n	 _file_size_and_mode
	addu	 r4,r30,20
	st.b	 r0,r19,40
	ld	 r13,r30,16
	or	 r12,r0,1
	st	 r15,r0,r19
	mask	 r13,r13,61440
	st	 r15,r19,4
	cmp	 r13,r13,32768
	bb0.n	 ne,r13,@L313
	st	 r12,r19,12
	or	 r23,r0,2000
	or	 r2,r0,2002
	bsr.n	 _xmalloc
	or	 r24,r0,0
	st	 r2,r19,20
	or	 r25,r0,r2
@L314:
	or	 r2,r0,r22
	or	 r3,r0,r25
	bsr.n	 _read
	subu	 r4,r23,r24
	bcnd	 lt0,r2,@L280
	bcnd	 eq0,r2,@L315
	addu	 r24,r24,r2
	cmp	 r13,r23,r24
	bb1.n	 ne,r13,@L314
	addu	 r25,r25,r2
	mak	 r23,r24,0<1>
	ld	 r2,r19,20
	bsr.n	 _xrealloc
	addu	 r3,r23,2
	addu	 r25,r2,r24
	br.n	 @L314
	st	 r2,r19,20
	align	 4
@L315:
	br.n	 @L320
	st	 r24,r19,16
	align	 4
@L313:
	ld	 r2,r30,20
	addu	 r2,r2,2
	bsr.n	 _xmalloc
	st	 r0,r19,16
	ld	 r4,r30,20
	bcnd.n	 le0,r4,@L320
	st	 r2,r19,20
@L323:
	ld	 r13,r19,20
	ld	 r3,r19,16
	or	 r2,r0,r22
	bsr.n	 _read
	addu	 r3,r13,r3
	bcnd	 gt0,r2,@L324
	bcnd	 eq0,r2,@L320
	br	 @L280
	align	 4
@L324:
	ld	 r13,r19,16
	ld	 r12,r30,20
	addu	 r13,r13,r2
	st	 r13,r19,16
	subu	 r12,r12,r2
	st	 r12,r30,20
	bcnd.n	 gt0,r12,@L323
	or	 r4,r0,r12
@L320:
	ld	 r12,r19,20
	or.u	 r13,r0,hi16(_if_stack)
	ld	 r11,r19,16
	ld	 r13,r13,lo16(_if_stack)
	st	 r12,r19,24
	bcnd.n	 le0,r11,@L329
	st	 r13,r19,32
	ld	 r13,r19,20
	subu	 r12,r0,1
	addu	 r13,r11,r13
	ld.bu	 r13,r13,r12
	cmp	 r13,r13,10
	bb1	 ne,r13,@L328
@L329:
	cmp	 r13,r11,1
	bb0	 gt,r13,@L327
	ld	 r13,r19,20
	subu	 r12,r0,2
	addu	 r13,r11,r13
	ld.bu	 r13,r13,r12
	cmp	 r13,r13,92
	bb1	 ne,r13,@L327
@L328:
	ld	 r12,r19,16
	ld	 r11,r19,20
	or	 r7,r0,1
	st	 r7,r30,68
	addu	 r13,r12,1
	st	 r13,r19,16
	or	 r13,r0,10
	st.b	 r13,r11,r12
@L327:
	ld	 r12,r19,20
	ld	 r13,r19,16
	st.b	 r0,r12,r13
	or.u	 r13,r0,hi16(_no_trigraphs)
	ld	 r13,r13,lo16(_no_trigraphs)
	bcnd	 ne0,r13,@L330
	bsr.n	 _trigraph_pcp
	or	 r2,r0,r19
@L330:
	ld	 r7,r30,28
	bcnd.n	 eq0,r7,@L333
	or.u	 r3,r0,hi16(@LC103)
	ld	 r2,r30,28
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC103)
	bcnd.n	 eq0,r2,@L333
	or.u	 r3,r0,hi16(@LC105)
	ld	 r2,r30,28
	or.u	 r4,r0,hi16(__iob+32)
	or	 r3,r3,lo16(@LC105)
	bsr.n	 _freopen
	or	 r4,r4,lo16(__iob+32)
	bcnd.n	 ne0,r2,@L514
	or	 r2,r0,r19
	bsr.n	 _pfatal_with_name
	ld	 r2,r30,28
@L333:
	or	 r2,r0,r19
@L514:
	or.u	 r25,r0,hi16(_outbuf)
	or	 r4,r0,0
	or	 r23,r25,lo16(_outbuf)
	or	 r5,r0,0
	or	 r3,r0,r23
	bsr.n	 _output_line_command
	or	 r24,r0,1
	cmp	 r13,r24,r17
	bb0.n	 lt,r13,@L515
	or.u	 r2,r0,hi16(_outbuf)
	subu	 r13,r17,1
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L338
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L489
	cmp	 r13,r12,2
	bb0	 gt,r13,@L491
	ld	 r2,r14,4
	bcnd.n	 eq0,r2,@L366
	or	 r3,r0,0
	bsr.n	 _open
	or	 r4,r0,438
	bcnd	 lt0,r2,@L360
	ld	 r3,r14,4
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _finclude
	or	 r6,r0,0
@L366:
	br.n	 @L491
	or	 r24,r0,2
	align	 4
@L338:
	ld	 r2,r14[r24]
	bcnd.n	 eq0,r2,@L375
	or	 r3,r0,0
	bsr.n	 _open
	or	 r4,r0,438
	bcnd	 lt0,r2,@L360
	ld	 r3,r14[r24]
	or	 r4,r25,lo16(_outbuf)
	or	 r5,r0,0
	bsr.n	 _finclude
	or	 r6,r0,0
@L375:
	addu	 r24,r24,1
	ld	 r2,r14[r24]
	bcnd.n	 eq0,r2,@L378
	or	 r3,r0,0
	bsr.n	 _open
	or	 r4,r0,438
	bcnd	 lt0,r2,@L360
	ld	 r3,r14[r24]
	or	 r4,r25,lo16(_outbuf)
	or	 r5,r0,0
	bsr.n	 _finclude
	or	 r6,r0,0
@L378:
	addu	 r24,r24,1
@L491:
	ld	 r2,r14[r24]
	bcnd.n	 eq0,r2,@L381
	or	 r3,r0,0
	bsr.n	 _open
	or	 r4,r0,438
	bcnd	 lt0,r2,@L360
	ld	 r3,r14[r24]
	or	 r4,r25,lo16(_outbuf)
	or	 r5,r0,0
	bsr.n	 _finclude
	or	 r6,r0,0
@L381:
	addu	 r24,r24,1
@L489:
	ld	 r2,r14[r24]
	bcnd.n	 eq0,r2,@L384
	or	 r3,r0,0
	bsr.n	 _open
	or	 r4,r0,438
	bcnd	 lt0,r2,@L360
	ld	 r3,r14[r24]
	or	 r4,r25,lo16(_outbuf)
	or	 r5,r0,0
	bsr.n	 _finclude
	or	 r6,r0,0
@L384:
	addu	 r24,r24,1
	cmp	 r13,r24,r17
	bb1.n	 lt,r13,@L338
	or.u	 r2,r0,hi16(_outbuf)
@L515:
	or	 r3,r0,0
	bsr.n	 _rescan
	or	 r2,r2,lo16(_outbuf)
	ld	 r7,r30,68
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	subu	 r12,r0,r7
	cmp	 r13,r13,0
	subu	 r12,r0,r12
	extu	 r13,r13,1<ne>
	and	 r13,r13,r12
	bcnd	 eq0,r13,@L342
	or.u	 r2,r0,hi16(@LC106)
	bsr.n	 _pedwarn
	or	 r2,r2,lo16(@LC106)
@L342:
	or.u	 r13,r0,hi16(_dump_macros)
	ld	 r13,r13,lo16(_dump_macros)
	cmp	 r13,r13,1
	bb1	 ne,r13,@L343
	bsr.n	 _dump_all_macros
	addu	 r1,r1,@L546
@L547:
	align	 4
@L343:
	ld	 r7,r30,76
	bcnd.n	 ne0,r7,@L516
	or.u	 r13,r0,hi16(_print_deps)
	bsr	 _write_output
@L344:
	or.u	 r13,r0,hi16(_print_deps)
@L516:
	ld	 r13,r13,lo16(_print_deps)
	bcnd.n	 eq0,r13,@L346
	or.u	 r13,r0,hi16(_errors)
	ld	 r13,r13,lo16(_errors)
	bcnd	 ne0,r13,@L346
	ld	 r7,r30,84
	bcnd.n	 eq0,r7,@L348
	or.u	 r3,r0,hi16(@LC107)
	ld	 r2,r30,84
	bsr.n	 _fopen
	or	 r3,r3,lo16(@LC107)
	bcnd.n	 ne0,r2,@L348
	st	 r2,r30,92
	bsr.n	 _pfatal_with_name
	ld	 r2,r30,84
@L348:
	or.u	 r13,r0,hi16(_deps_buffer)
	ld	 r3,r30,92
	bsr.n	 _fputs
	ld	 r2,r13,lo16(_deps_buffer)
	ld	 r7,r30,92
	ld	 r13,r0,r7
	subu	 r13,r13,1
	bcnd.n	 ge0,r13,@L349
	st	 r13,r0,r7
	ld	 r3,r30,92
	or	 r2,r0,10
	bsr.n	 __flsbuf
	addu	 r1,r1,@L548
@L549:
	align	 4
@L349:
	ld	 r7,r30,92
	ld	 r13,r7,4
	addu	 r12,r13,1
	st	 r12,r7,4
	or	 r12,r0,10
	st.b	 r12,r0,r13
@L350:
	ld	 r7,r30,84
	bcnd.n	 eq0,r7,@L517
	or.u	 r13,r0,hi16(__iob+32)
	ld	 r7,r30,92
	ld.hu	 r13,r7,16
	bb1.n	 (31-26),r13,@L518
	or.u	 r2,r0,hi16(@LC108)
	bsr.n	 _fclose
	ld	 r2,r30,92
	bcnd.n	 eq0,r2,@L346
	or.u	 r2,r0,hi16(@LC108)
@L518:
	bsr.n	 _fatal
	or	 r2,r2,lo16(@LC108)
@L346:
	or.u	 r13,r0,hi16(__iob+32)
@L517:
	or	 r2,r13,lo16(__iob+32)
	ld.hu	 r13,r2,16
	bb1	 (31-26),r13,@L355
	bsr	 _fclose
	bcnd.n	 eq0,r2,@L519
	or.u	 r13,r0,hi16(_errors)
@L355:
	or.u	 r2,r0,hi16(@LC109)
	bsr.n	 _fatal
	or	 r2,r2,lo16(@LC109)
	or.u	 r13,r0,hi16(_errors)
@L519:
	ld	 r13,r13,lo16(_errors)
	bcnd	 eq0,r13,@L356
	bsr.n	 _exit
	or	 r2,r0,33
	align	 4
@L356:
	bsr.n	 _exit
	or	 r2,r0,0
	align	 4
@L359:
	ld	 r2,r16[r24]
	br	 @L487
	align	 4
@L360:
	ld	 r2,r14[r24]
@L487:
	bsr	 _perror_with_name
	br.n	 @L357
	or	 r2,r0,33
	align	 4
@L280:
	bsr.n	 _pfatal_with_name
	or	 r2,r0,r15
	or	 r2,r0,0
@L357:
@Lte0:
	subu	 r31,r30,80
	ld	 r1,r31,84
	ld	 r30,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	ld.d	 r14,r31,32
	jmp.n	 r1
	addu	 r31,r31,192
	def	 @L548,@L350-@L549
	def	 @L546,@L344-@L547
	def	 @L544,@L4-@L545
	def	 @L542,@L139-@L543
	def	 @L540,@L4-@L541
	def	 @L538,@L116-@L539
	def	 @L536,@L111-@L537
	def	 @L534,@L4-@L535
	def	 @L532,@L474-@L533
	def	 @L530,@L39-@L531
	def	 @L528,@L25-@L529
	def	 @L526,@L20-@L527
	def	 @L524,@L17-@L525
	def	 @L522,@L14-@L523

	align	 8
_path_include:
	subu	 r31,r31,64
	st	 r1,r31,48
	st.d	 r24,r31,40
	or	 r24,r0,r2
	st.d	 r22,r31,32
@Ltb1:
	ld.b	 r13,r0,r24
	bcnd	 eq0,r13,@L564
@L567:
	ld.b	 r13,r0,r24
	cmp	 r12,r13,0
	cmp	 r13,r13,58
	or	 r12,r12,r13
	extu	 r13,r12,1<eq>
	xor	 r12,r13,1
	bcnd.n	 eq0,r12,@L569
	or	 r23,r0,r24
	addu	 r23,r23,1
@L577:
	ld.b	 r13,r0,r23
	cmp	 r12,r13,0
	cmp	 r13,r13,58
	or	 r12,r12,r13
	extu	 r13,r12,1<eq>
	xor	 r12,r13,1
	bcnd.n	 ne0,r12,@L577
	addu	 r23,r23,1
	subu	 r23,r23,1
@L569:
	cmp	 r13,r24,r23
	bb1.n	 ne,r13,@L572
	subu	 r25,r23,r24
	bsr.n	 _xmalloc
	or	 r2,r0,2
	or	 r22,r0,r2
	or	 r13,r0,46
	st.b	 r13,r0,r22
	br.n	 @L573
	st.b	 r0,r22,1
	align	 4
@L572:
	bsr.n	 _xmalloc
	addu	 r2,r25,1
	or	 r22,r0,r2
	or	 r2,r0,r24
	or	 r4,r0,r25
	bsr.n	 _bcopy
	or	 r3,r0,r22
	st.b	 r0,r22,r25
@L573:
	bsr.n	 _xmalloc
	or	 r2,r0,12
	st	 r0,r0,r2
	or	 r24,r0,r23
	st	 r0,r2,8
	or	 r3,r0,r2
	bsr.n	 _append_include_chain
	st	 r22,r2,4
	ld.b	 r13,r0,r24
	bcnd.n	 ne0,r13,@L567
	addu	 r24,r24,1
@L564:
@Lte1:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	ld.d	 r22,r31,32
	jmp.n	 r1
	addu	 r31,r31,64

data
	align	 8
@LC110:
	string	 "%d trigraph(s) encountered\000"
text
	align	 8
_trigraph_pcp:
	subu	 r31,r31,80
	st	 r1,r31,64
	st.d	 r24,r31,56
	st.d	 r20,r31,40
	or	 r20,r0,r2
	st.d	 r22,r31,48
@Ltb2:
	ld	 r22,r20,20
	or	 r24,r0,r22
	or	 r21,r0,r22
@L600:
	or	 r2,r0,r24
	bsr.n	 _index
	or	 r3,r0,63
	or	 r24,r0,r2
	bcnd.n	 eq0,r24,@L601
	addu	 r24,r24,1
	ld.bu	 r13,r0,r24
	cmp	 r13,r13,63
	bb1	 ne,r13,@L600
	addu	 r24,r24,1
	ld.bu	 r13,r0,r24
	subu	 r11,r13,33
	or.u	 r13,r0,hi16(@L616)
	cmp	 r12,r11,30
	bb1.n	 hi,r12,@L600
	or	 r13,r13,lo16(@L616)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L616:
	word	 @L611
	word	 @L600
	word	 @L600
	word	 @L600
	word	 @L600
	word	 @L600
	word	 @L609
	word	 @L606
	word	 @L608
	word	 @L600
	word	 @L600
	word	 @L600
	word	 @L613
	word	 @L600
	word	 @L607
	word	 @L600
	word	 @L600
	word	 @L600
	word	 @L600
	word	 @L600
	word	 @L600
	word	 @L600
	word	 @L600
	word	 @L600
	word	 @L600
	word	 @L600
	word	 @L600
	word	 @L610
	word	 @L605
	word	 @L612
	word	 @L614
	align	 4
@L605:
	br.n	 @L604
	or	 r25,r0,35
	align	 4
@L606:
	br.n	 @L604
	or	 r25,r0,91
	align	 4
@L607:
	br.n	 @L604
	or	 r25,r0,92
	align	 4
@L608:
	br.n	 @L604
	or	 r25,r0,93
	align	 4
@L609:
	br.n	 @L604
	or	 r25,r0,94
	align	 4
@L610:
	br.n	 @L604
	or	 r25,r0,123
	align	 4
@L611:
	br.n	 @L604
	or	 r25,r0,124
	align	 4
@L612:
	br.n	 @L604
	or	 r25,r0,125
	align	 4
@L613:
	br.n	 @L604
	or	 r25,r0,126
	align	 4
@L614:
	br.n	 @L600
	subu	 r24,r24,1
	align	 4
@L604:
	subu	 r13,r24,r21
	subu	 r23,r13,2
	cmp	 r13,r22,r21
	cmp	 r12,r23,0
	rot	 r11,r13,30
	and.c	 r13,r12,r11
	extu	 r13,r13,1<gt>
	bcnd.n	 eq0,r13,@L617
	or	 r2,r0,r21
	or	 r3,r0,r22
	bsr.n	 _bcopy
	or	 r4,r0,r23
@L617:
	addu	 r22,r22,r23
	addu	 r21,r24,1
	st.b	 r25,r0,r22
	addu	 r22,r22,1
	br.n	 @L600
	or	 r24,r0,r21
	align	 4
@L601:
	ld	 r13,r20,20
	ld	 r12,r20,16
	subu	 r13,r21,r13
	subu	 r23,r12,r13
	cmp	 r13,r22,r21
	cmp	 r12,r23,0
	rot	 r11,r13,30
	and.c	 r13,r12,r11
	extu	 r13,r13,1<gt>
	bcnd.n	 eq0,r13,@L618
	or	 r2,r0,r21
	or	 r3,r0,r22
	bsr.n	 _bcopy
	or	 r4,r0,r23
@L618:
	ld	 r13,r20,16
	subu	 r11,r21,r22
	ld	 r12,r20,20
	subu	 r13,r13,r11
	st	 r13,r20,16
	st.b	 r0,r12,r13
	or.u	 r13,r0,hi16(_warn_trigraphs)
	ld	 r13,r13,lo16(_warn_trigraphs)
	cmp	 r12,r21,r22
	cmp	 r13,r13,0
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L619
	extu	 r3,r11,0<31>
	or.u	 r2,r0,hi16(@LC110)
	addu	 r3,r11,r3
	or	 r2,r2,lo16(@LC110)
	bsr.n	 _warning
	ext	 r3,r3,0<1>
@L619:
@Lte2:
	ld	 r1,r31,64
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80

data
	align	 8
@LC111:
	string	 "NOTREACHED\000"
	align	 8
@LC112:
	string	 "NOTREACHED\000"
	align	 8
@LC113:
	string	 "ARGSUSED\000"
	align	 8
@LC114:
	string	 "ARGSUSED\000"
	align	 8
@LC115:
	string	 "LINTLIBRARY\000"
	align	 8
@LC116:
	string	 "LINTLIBRARY\000"
	align	 8
@LC117:
	string	 "VARARGS\000"
	align	 8
@LC118:
	string	 "VARARGS\000"
	align	 8
@LC119:
	string	 "VARARGS\000"
	align	 8
@LC120:
	string	 "unterminated string or character constant\000"
	align	 8
@LC121:
	string	 "possible real start of unterminated constant\000"
	align	 8
@LC122:
	string	 "unterminated string or character constant\000"
	align	 8
@LC123:
	string	 "#pragma lint \000"
	align	 8
@LC124:
	string	 "`/*' within comment\000"
	align	 8
@LC125:
	string	 "unterminated comment\000"
	align	 8
@LC126:
	string	 "if\000"
	align	 8
@LC127:
	string	 "ifdef\000"
	align	 8
@LC128:
	string	 "ifndef\000"
	align	 8
@LC129:
	string	 "else\000"
	align	 8
@LC130:
	string	 "elif\000"
	align	 8
@LC131:
	string	 "unterminated `#%s' conditional\000"
text
	align	 8
_rescan:
	or.u	 r13,r0,hi16(_no_output)
	ld	 r13,r13,lo16(_no_output)
	subu	 r31,r31,176
	st	 r1,r31,80
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	st.d	 r18,r31,48
	st.d	 r16,r31,40
	st.d	 r14,r31,32
@Ltb3:
	st	 r3,r31,108
	st	 r0,r31,116
	st	 r0,r31,124
	or	 r20,r0,r2
	st	 r0,r31,132
	or	 r17,r0,0
	bcnd.n	 eq0,r13,@L689
	st	 r0,r31,140
	or.u	 r13,r0,hi16(_indepth)
	ld	 r13,r13,lo16(_indepth)
	mul	 r2,r13,44
	or.u	 r13,r0,hi16(_instack)
	or	 r12,r13,lo16(_instack)
	ld	 r13,r2,r12
	bcnd.n	 eq0,r13,@L689
	addu	 r2,r2,r12
	bsr.n	 _skip_if_group
	or	 r3,r0,1
@L689:
	ld	 r23,r20,24
	or.u	 r22,r0,hi16(_indepth)
	ld	 r12,r22,lo16(_indepth)
	mul	 r12,r12,44
	or.u	 r13,r0,hi16(_instack)
	or	 r25,r13,lo16(_instack)
	ld	 r13,r20,20
	addu	 r21,r12,r25
	ld	 r12,r20,16
	ld	 r10,r21,20
	ld	 r11,r21,16
	subu	 r13,r23,r13
	ld	 r24,r21,24
	addu	 r19,r10,r11
	subu	 r12,r12,r13
	subu	 r3,r19,r24
	cmp	 r12,r12,r3
	bb1.n	 gt,r12,@L694
	st	 r23,r20,24
	bsr.n	 _grow_outbuf
	or	 r2,r0,r20
@L694:
	ld	 r23,r20,24
	ld.bu	 r13,r0,r19
	bcnd.n	 eq0,r13,@L696
	or	 r16,r0,r24
	bsr	 _abort
	align	 4
@L1141:
	subu	 r23,r23,1
	st	 r23,r20,24
	subu	 r24,r24,1
	br.n	 @L1044
	st	 r24,r21,24
	align	 4
@L696:
	or	 r15,r0,r22
@L699:
	ld.bu	 r25,r0,r24
	st.b	 r25,r0,r23
	addu	 r24,r24,1
	addu	 r23,r23,1
	mask	 r11,r25,0xff
	or.u	 r13,r0,hi16(@L1120)
	cmp	 r12,r11,122
	bb0.n	 ls,r12,@L730
	or	 r13,r13,lo16(@L1120)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L1120:
	word	 @L1028
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L1011
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L772
	word	 @L706
	word	 @L923
	word	 @L730
	word	 @L730
	word	 @L772
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L813
	word	 @L935
	word	 @L935
	word	 @L935
	word	 @L935
	word	 @L935
	word	 @L935
	word	 @L935
	word	 @L935
	word	 @L935
	word	 @L935
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L730
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L730
	word	 @L701
	word	 @L730
	word	 @L730
	word	 @L925
	word	 @L730
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	word	 @L925
	align	 4
@L1140:
	br.n	 @L699
	subu	 r24,r24,1
	align	 4
@L1139:
	bsr.n	 _line_for_error
	ld	 r2,r31,164
	or.u	 r3,r0,hi16(@LC122)
	or	 r3,r3,lo16(@LC122)
	bsr.n	 _error_with_line
	subu	 r1,r1,@L1236
@L1237:
	align	 4
@L701:
	cmp	 r13,r24,r19
	bb1	 hs,r13,@L699
	ld.bu	 r12,r0,r24
	mask	 r13,r12,0xff
	cmp	 r13,r13,10
	bb1	 ne,r13,@L703
	ld	 r13,r21,12
	addu	 r24,r24,1
	subu	 r23,r23,1
	addu	 r13,r13,1
	br.n	 @L699
	st	 r13,r21,12
	align	 4
@L703:
	bcnd	 gt0,r17,@L705
	st.b	 r12,r0,r23
	br.n	 @L1234
	addu	 r24,r24,1
	align	 4
@L706:
	or.u	 r13,r0,hi16(_assertions_flag)
	ld	 r13,r13,lo16(_assertions_flag)
	bcnd	 eq0,r13,@L707
	or.u	 r14,r0,hi16(_is_hor_space)
	ld.bu	 r13,r0,r24
	or	 r14,r14,lo16(_is_hor_space)
	ld.bu	 r13,r13,r14
	bcnd.n	 eq0,r13,@L709
	or.u	 r13,r0,hi16(_is_hor_space)
	or	 r12,r13,lo16(_is_hor_space)
	addu	 r24,r24,1
@L1207:
	ld.bu	 r13,r0,r24
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L1207
	addu	 r24,r24,1
	subu	 r24,r24,1
@L709:
	ld.bu	 r11,r0,r24
	or.u	 r13,r0,hi16(_is_idchar)
	or	 r10,r13,lo16(_is_idchar)
	mask	 r12,r11,0xff
	ld.bu	 r13,r12,r10
	bcnd	 eq0,r13,@L1132
	or	 r12,r0,r10
@L718:
	addu	 r24,r24,1
	st.b	 r11,r0,r23
	ld.bu	 r11,r0,r24
	mask	 r13,r11,0xff
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L718
	addu	 r23,r23,1
@L1132:
	or.u	 r14,r0,hi16(_is_hor_space)
	ld.bu	 r13,r0,r24
	or	 r14,r14,lo16(_is_hor_space)
	ld.bu	 r13,r13,r14
	bcnd.n	 eq0,r13,@L1133
	or.u	 r13,r0,hi16(_is_hor_space)
	or	 r12,r13,lo16(_is_hor_space)
	addu	 r24,r24,1
@L1208:
	ld.bu	 r13,r0,r24
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L1208
	addu	 r24,r24,1
	subu	 r24,r24,1
@L1133:
	ld.bu	 r13,r0,r24
	cmp	 r13,r13,40
	bb1.n	 ne,r13,@L707
	or	 r2,r0,r21
	bsr.n	 _skip_paren_group
	st	 r24,r21,24
	ld	 r4,r21,24
	or	 r2,r0,r24
	or	 r3,r0,r23
	bsr.n	 _bcopy
	subu	 r4,r4,r24
	ld	 r13,r21,24
	subu	 r12,r13,r24
	or	 r24,r0,r13
	addu	 r23,r23,r12
@L707:
	ld	 r13,r21,28
	bcnd	 ne0,r13,@L730
	ld	 r13,r0,r21
	bcnd	 ne0,r13,@L731
	ld	 r13,r21,20
	cmp	 r13,r16,r13
	bb0	 ne,r13,@L730
@L731:
	bcnd	 ne0,r17,@L705
	bcnd.n	 eq0,r16,@L730
	or.u	 r13,r0,hi16(_traditional)
	ld	 r13,r13,lo16(_traditional)
	bcnd.n	 ne0,r13,@L734
	or	 r12,r0,r16
	or.u	 r14,r0,hi16(_cplusplus_comments)
	ld	 r10,r14,lo16(_cplusplus_comments)
@L737:
	or.u	 r14,r0,hi16(_is_hor_space)
@L1209:
	ld.bu	 r11,r0,r12
	or	 r14,r14,lo16(_is_hor_space)
	ld.bu	 r13,r11,r14
	bcnd	 eq0,r13,@L738
	addu	 r12,r12,1
	br.n	 @L1209
	or.u	 r14,r0,hi16(_is_hor_space)
	align	 4
@L738:
	cmp	 r13,r11,92
	bb1	 ne,r13,@L740
	ld.bu	 r13,r12,1
	cmp	 r13,r13,10
	bb0	 ne,r13,@L744
@L740:
	ld.bu	 r13,r0,r12
	cmp	 r13,r13,47
	bb1	 ne,r13,@L742
	ld.bu	 r13,r12,1
	cmp	 r13,r13,42
	bb1	 ne,r13,@L742
	addu	 r12,r12,2
@L1196:
	ld.bu	 r13,r0,r12
	cmp	 r13,r13,42
	bb1.n	 ne,r13,@L1196
	addu	 r12,r12,1
	subu	 r12,r12,1
	ld.bu	 r13,r12,1
	cmp	 r13,r13,47
	bb1.n	 ne,r13,@L1196
	addu	 r12,r12,1
	subu	 r12,r12,1
@L744:
	br.n	 @L737
	addu	 r12,r12,2
	align	 4
@L742:
	bcnd	 eq0,r10,@L734
	ld.bu	 r13,r0,r12
	cmp	 r13,r13,47
	bb0	 eq,r13,@L734
	ld.bu	 r13,r12,1
	cmp	 r13,r13,47
	bb0	 eq,r13,@L734
	addu	 r12,r12,2
	ld.bu	 r13,r0,r12
	cmp	 r13,r13,10
	bb1.n	 eq,r13,@L737
	addu	 r12,r12,1
@L749:
	ld.bu	 r13,r0,r12
	cmp	 r13,r13,10
	bb1.n	 ne,r13,@L749
	addu	 r12,r12,1
	br.n	 @L1209
	or.u	 r14,r0,hi16(_is_hor_space)
	align	 4
@L734:
	addu	 r13,r12,1
	cmp	 r13,r13,r24
	bb1	 ne,r13,@L730
	st	 r24,r21,24
	subu	 r23,r23,1
	or	 r2,r0,r21
	or	 r3,r0,r20
	bsr.n	 _handle_directive
	st	 r23,r20,24
	bcnd.n	 ne0,r2,@L756
	or.u	 r13,r0,hi16(_no_output)
	ld	 r13,r13,lo16(_no_output)
	bcnd.n	 eq0,r13,@L757
	or.u	 r14,r0,hi16(_instack)
	ld	 r13,r15,lo16(_indepth)
	mul	 r2,r13,44
	or	 r14,r14,lo16(_instack)
	ld	 r13,r2,r14
	bcnd.n	 eq0,r13,@L757
	or.u	 r14,r0,hi16(_instack)
	or	 r14,r14,lo16(_instack)
	or	 r3,r0,1
	addu	 r2,r2,r14
	bsr.n	 _skip_if_group
	addu	 r1,r1,@L1238
@L1239:
	align	 4
@L757:
	br.n	 @L730
	addu	 r23,r23,1
	align	 4
@L756:
	ld	 r13,r13,lo16(_no_output)
	bcnd.n	 eq0,r13,@L764
	or.u	 r14,r0,hi16(_instack)
	ld	 r13,r15,lo16(_indepth)
	mul	 r2,r13,44
	or	 r14,r14,lo16(_instack)
	ld	 r13,r2,r14
	bcnd.n	 eq0,r13,@L764
	or.u	 r14,r0,hi16(_instack)
	or	 r14,r14,lo16(_instack)
	or	 r3,r0,1
	bsr.n	 _skip_if_group
	addu	 r2,r2,r14
@L764:
	ld	 r23,r20,24
@L1205:
	ld	 r13,r15,lo16(_indepth)
	mul	 r13,r13,44
	or.u	 r14,r0,hi16(_instack)
	or	 r14,r14,lo16(_instack)
	ld	 r12,r20,20
	addu	 r21,r13,r14
	ld	 r13,r20,16
	ld	 r10,r21,20
	ld	 r11,r21,16
	subu	 r12,r23,r12
	ld	 r24,r21,24
	addu	 r19,r10,r11
	subu	 r13,r13,r12
	subu	 r3,r19,r24
	cmp	 r13,r13,r3
	bb1.n	 gt,r13,@L769
	st	 r23,r20,24
	bsr.n	 _grow_outbuf
	or	 r2,r0,r20
@L769:
	ld	 r23,r20,24
@L1194:
	br.n	 @L699
	or	 r16,r0,r24
	align	 4
@L772:
	bcnd	 ne0,r17,@L705
	ld	 r14,r21,12
	mask	 r25,r25,0xff
	st	 r14,r31,164
	cmp	 r22,r25,39
@L776:
	cmp	 r13,r24,r19
@L1211:
	bb1	 lo,r13,@L777
@L1134:
	ld	 r12,r21,28
	bcnd.n	 eq0,r12,@L778
	or	 r13,r0,31
	st	 r13,r12,12
	ld	 r2,r21,36
	bcnd	 eq0,r2,@L782
	bsr	 _free
@L782:
	ld	 r13,r15,lo16(_indepth)
	subu	 r13,r13,1
	st	 r13,r15,lo16(_indepth)
	mul	 r13,r13,44
	or.u	 r14,r0,hi16(_instack)
	or	 r14,r14,lo16(_instack)
	addu	 r21,r13,r14
	ld	 r13,r20,20
	ld	 r12,r20,16
	ld	 r10,r21,20
	ld	 r11,r21,16
	ld	 r24,r21,24
	subu	 r13,r23,r13
	addu	 r19,r10,r11
	subu	 r12,r12,r13
	subu	 r3,r19,r24
	cmp	 r12,r12,r3
	bb1.n	 gt,r12,@L788
	st	 r23,r20,24
	bsr.n	 _grow_outbuf
	or	 r2,r0,r20
@L788:
	ld	 r23,r20,24
	br.n	 @L776
	or	 r16,r0,0
	align	 4
@L778:
	or.u	 r13,r0,hi16(_traditional)
	ld	 r13,r13,lo16(_traditional)
	bcnd	 ne0,r13,@L699
	bsr.n	 _line_for_error
	ld	 r2,r31,164
	or.u	 r3,r0,hi16(@LC120)
	bsr.n	 _error_with_line
	or	 r3,r3,lo16(@LC120)
	or.u	 r3,r0,hi16(@LC121)
	ld	 r2,r31,140
	or	 r3,r3,lo16(@LC121)
	st	 r0,r31,140
	bsr.n	 _error_with_line
	subu	 r1,r1,@L1240
@L1241:
	align	 4
@L777:
	ld.bu	 r13,r0,r24
	st.b	 r13,r0,r23
	ld.bu	 r12,r0,r24
	addu	 r23,r23,1
	cmp	 r13,r12,39
	bb0.n	 ne,r13,@L807
	addu	 r24,r24,1
	bb1.n	 gt,r13,@L811
	cmp	 r13,r12,92
	cmp	 r13,r12,10
	bb0.n	 ne,r13,@L792
	cmp	 r13,r12,34
	bb0.n	 ne,r13,@L1210
	subu	 r13,r0,1
	br.n	 @L1211
	cmp	 r13,r24,r19
	align	 4
@L811:
	bb0.n	 ne,r13,@L797
	cmp	 r13,r24,r19
	br	 @L1211
	align	 4
@L792:
	ld	 r13,r21,12
	addu	 r13,r13,1
	st	 r13,r21,12
	or.u	 r12,r0,hi16(_traditional)
	ld	 r13,r20,12
	ld	 r12,r12,lo16(_traditional)
	addu	 r13,r13,1
	bcnd.n	 ne0,r12,@L1194
	st	 r13,r20,12
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	cmp	 r13,r13,0
	or.c	 r13,r22,r13
	extu	 r13,r13,1<eq>
	bcnd	 ne0,r13,@L1139
	ld	 r14,r31,140
	bcnd.n	 ne0,r14,@L1211
	cmp	 r13,r24,r19
	ld	 r13,r21,12
	subu	 r13,r13,1
	br.n	 @L776
	st	 r13,r31,140
	align	 4
@L797:
	bb1	 hs,r13,@L1134
	ld.bu	 r12,r0,r24
	cmp	 r13,r12,10
	bb1.n	 ne,r13,@L799
	cmp	 r13,r12,92
	ld	 r13,r21,12
	subu	 r23,r23,1
	addu	 r24,r24,1
	addu	 r13,r13,1
	br.n	 @L776
	st	 r13,r21,12
	align	 4
@L799:
	bb0	 eq,r13,@L802
@L805:
	ld.bu	 r13,r24,1
	cmp	 r13,r13,10
	bb0	 eq,r13,@L802
	ld	 r13,r21,12
	addu	 r24,r24,2
	addu	 r13,r13,1
	st	 r13,r21,12
	ld.bu	 r13,r0,r24
	cmp	 r13,r13,92
	bb1	 eq,r13,@L805
@L802:
	ld.bu	 r13,r0,r24
	addu	 r24,r24,1
	st.b	 r13,r0,r23
	br.n	 @L776
	addu	 r23,r23,1
	align	 4
@L807:
	subu	 r13,r0,1
@L1210:
	ld.bu	 r13,r24,r13
	cmp	 r13,r13,r25
	bb1	 eq,r13,@L699
	cmp	 r13,r24,r19
	br	 @L1211
	align	 4
@L813:
	ld.bu	 r13,r0,r24
	cmp	 r13,r13,92
	bb0	 eq,r13,@L814
	ld.bu	 r13,r24,1
	cmp	 r13,r13,10
	bb0	 eq,r13,@L814
	or	 r8,r0,r24
	or	 r11,r0,r24
	or	 r10,r0,0
@L818:
	ld.bu	 r13,r0,r11
	cmp	 r13,r13,92
	bb0	 eq,r13,@L817
	ld.bu	 r12,r11,1
	cmp	 r13,r12,10
	bb1.n	 ne,r13,@L820
	cmp	 r13,r12,13
	addu	 r11,r11,2
	br.n	 @L818
	addu	 r10,r10,1
	align	 4
@L820:
	bb0	 eq,r13,@L817
	ld.bu	 r13,r11,2
	cmp	 r13,r13,10
	bb0	 eq,r13,@L817
	addu	 r11,r11,3
	br.n	 @L818
	addu	 r10,r10,1
	align	 4
@L817:
	bcnd	 eq0,r10,@L814
	ld.bu	 r7,r0,r11
	mask	 r13,r7,0xff
	cmp	 r6,r13,47
	cmp	 r9,r13,42
	or	 r13,r6,r9
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 ne0,r13,@L814
	or	 r13,r9,r6
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L1212
	or	 r13,r0,r10
@L830:
	st.b	 r7,r0,r8
	addu	 r11,r11,1
	ld.bu	 r7,r0,r11
	mask	 r13,r7,0xff
	cmp	 r12,r13,42
	cmp	 r13,r13,47
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 ne0,r12,@L830
	addu	 r8,r8,1
	or	 r13,r0,r10
@L1212:
	bcnd.n	 le0,r13,@L814
	subu	 r10,r10,1
	or	 r11,r0,92
	or	 r12,r0,10
@L834:
	st.b	 r11,r0,r8
	addu	 r8,r8,1
	or	 r13,r0,r10
	subu	 r10,r10,1
	st.b	 r12,r0,r8
	bcnd.n	 gt0,r13,@L834
	addu	 r8,r8,1
@L814:
	ld.bu	 r12,r0,r24
	cmp	 r13,r12,42
	bb0	 ne,r13,@L836
	or.u	 r14,r0,hi16(_cplusplus_comments)
	ld	 r13,r14,lo16(_cplusplus_comments)
	bcnd.n	 eq0,r13,@L730
	cmp	 r13,r12,47
	bb1	 ne,r13,@L730
@L836:
	ld	 r13,r21,28
	bcnd	 ne0,r13,@L730
	bcnd.n	 ne0,r17,@L705
	cmp	 r13,r12,47
	bb1.n	 ne,r13,@L840
	or.u	 r13,r0,hi16(_lint)
	or.u	 r14,r0,hi16(_put_out_comments)
	ld	 r13,r14,lo16(_put_out_comments)
	subu	 r24,r24,1
	bcnd.n	 ne0,r13,@L841
	subu	 r23,r23,1
	br.n	 @L1197
	or	 r13,r0,32
	align	 4
@L841:
	or	 r13,r0,47
	st.b	 r13,r0,r23
	addu	 r23,r23,1
@L1197:
	st.b	 r13,r0,r23
	addu	 r23,r23,1
	cmp	 r13,r24,r19
	bb1.n	 hs,r13,@L699
	addu	 r2,r24,2
@L845:
	ld.bu	 r13,r0,r24
	cmp	 r13,r13,10
	bb1.n	 ne,r13,@L843
	addu	 r24,r24,1
	or.u	 r14,r0,hi16(_put_out_comments)
	ld	 r13,r14,lo16(_put_out_comments)
	bcnd.n	 eq0,r13,@L699
	subu	 r24,r24,1
	br.n	 @L1213
	subu	 r4,r24,r2
	align	 4
@L843:
	cmp	 r13,r24,r19
	bb1	 lo,r13,@L845
	br	 @L699
	align	 4
@L840:
	ld	 r14,r21,12
	ld	 r13,r13,lo16(_lint)
	addu	 r24,r24,1
	bcnd.n	 eq0,r13,@L849
	st	 r14,r31,164
	st	 r0,r31,92
	or.u	 r14,r0,hi16(_is_hor_space)
	ld.bu	 r13,r0,r24
	or	 r14,r14,lo16(_is_hor_space)
	or	 r25,r0,r24
	ld.bu	 r13,r13,r14
	addu	 r18,r31,96
	addu	 r14,r31,88
	bcnd.n	 eq0,r13,@L852
	st	 r14,r31,148
	or.u	 r13,r0,hi16(_is_hor_space)
	or	 r12,r13,lo16(_is_hor_space)
	addu	 r25,r25,1
@L1214:
	ld.bu	 r13,r0,r25
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L1214
	addu	 r25,r25,1
	subu	 r25,r25,1
@L852:
	cmp	 r13,r25,r19
	bb0.n	 lo,r13,@L863
	subu	 r22,r19,r25
	cmp	 r13,r22,9
	bb0.n	 gt,r13,@L860
	or	 r2,r0,r25
	or.u	 r3,r0,hi16(@LC111)
	or	 r4,r0,10
	bsr.n	 _strncmp
	or	 r3,r3,lo16(@LC111)
	bcnd.n	 ne0,r2,@L1215
	cmp	 r13,r22,7
	or	 r13,r0,10
	or.u	 r12,r0,hi16(@LC112)
	st	 r13,r0,r18
	br.n	 @L850
	or	 r22,r12,lo16(@LC112)
	align	 4
@L860:
	cmp	 r13,r22,7
@L1215:
	bb0.n	 gt,r13,@L861
	or	 r2,r0,r25
	or.u	 r3,r0,hi16(@LC113)
	or	 r4,r0,8
	bsr.n	 _strncmp
	or	 r3,r3,lo16(@LC113)
	bcnd.n	 ne0,r2,@L1216
	cmp	 r13,r22,10
	or	 r13,r0,8
	or.u	 r12,r0,hi16(@LC114)
	st	 r13,r0,r18
	br.n	 @L850
	or	 r22,r12,lo16(@LC114)
	align	 4
@L861:
	cmp	 r13,r22,10
@L1216:
	bb0.n	 gt,r13,@L862
	or	 r2,r0,r25
	or.u	 r3,r0,hi16(@LC115)
	or	 r4,r0,11
	bsr.n	 _strncmp
	or	 r3,r3,lo16(@LC115)
	bcnd.n	 ne0,r2,@L1217
	cmp	 r13,r22,6
	or	 r13,r0,11
	or.u	 r12,r0,hi16(@LC116)
	st	 r13,r0,r18
	br.n	 @L850
	or	 r22,r12,lo16(@LC116)
	align	 4
@L862:
	cmp	 r13,r22,6
@L1217:
	bb0.n	 gt,r13,@L863
	or	 r2,r0,r25
	or.u	 r3,r0,hi16(@LC117)
	or	 r4,r0,7
	bsr.n	 _strncmp
	or	 r3,r3,lo16(@LC117)
	bcnd.n	 ne0,r2,@L863
	or	 r13,r0,7
	st	 r13,r0,r18
	subu	 r22,r22,7
	bcnd.n	 eq0,r22,@L865
	addu	 r25,r25,7
	or.u	 r13,r0,hi16(___lc_ctype)
	ld	 r4,r13,lo16(___lc_ctype)
	ld	 r13,r4,28
	bcnd	 ne0,r13,@L866
	ld.bu	 r13,r0,r25
	ld	 r12,r4,64
	ld	 r13,r12[r13]
	bb1.n	 (31-27),r13,@L864
	or.u	 r13,r0,hi16(@LC118)
	br	 @L1218
	align	 4
@L866:
	ld.bu	 r2,r0,r25
	jsr.n	 r13
	or	 r3,r0,16
	bcnd	 ne0,r2,@L864
@L865:
	or.u	 r13,r0,hi16(@LC118)
@L1218:
	br.n	 @L850
	or	 r22,r13,lo16(@LC118)
	align	 4
@L864:
	ld	 r14,r31,148
	cmp	 r11,r25,r19
	bb0.n	 lo,r11,@L869
	st	 r25,r0,r14
	subu	 r13,r19,r25
	or.u	 r22,r0,hi16(___lc_ctype)
	bb1.n	 ge,r11,@L1153
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L875
	cmp	 r13,r12,1
	bb1.n	 le,r13,@L1153
	cmp	 r13,r12,2
	bb1	 le,r13,@L1154
	ld	 r4,r22,lo16(___lc_ctype)
	ld	 r13,r4,28
	bcnd	 ne0,r13,@L1157
	ld.bu	 r13,r0,r25
	ld	 r12,r4,64
	ld	 r13,r12[r13]
	bb0	 (31-27),r13,@L869
	br.n	 @L1232
	addu	 r25,r25,1
	align	 4
@L1157:
	ld.bu	 r2,r0,r25
	jsr.n	 r13
	or	 r3,r0,16
	bcnd	 eq0,r2,@L869
	addu	 r25,r25,1
@L1154:
	ld	 r4,r22,lo16(___lc_ctype)
@L1232:
	ld	 r13,r4,28
	bcnd	 ne0,r13,@L1161
	ld.bu	 r13,r0,r25
	ld	 r12,r4,64
	ld	 r13,r12[r13]
	bb0	 (31-27),r13,@L869
	br.n	 @L1153
	addu	 r25,r25,1
	align	 4
@L1161:
	ld.bu	 r2,r0,r25
	jsr.n	 r13
	or	 r3,r0,16
	bcnd	 eq0,r2,@L869
	addu	 r25,r25,1
@L1153:
	ld	 r4,r22,lo16(___lc_ctype)
	ld	 r13,r4,28
	bcnd	 eq0,r13,@L1206
	br	 @L1181
	align	 4
@L875:
	ld	 r4,r22,lo16(___lc_ctype)
	ld	 r13,r4,28
	bcnd	 ne0,r13,@L1169
	ld.bu	 r13,r0,r25
	ld	 r12,r4,64
	ld	 r13,r12[r13]
	bb0	 (31-27),r13,@L869
	br	 @L1219
	align	 4
@L1169:
	ld.bu	 r2,r0,r25
	jsr.n	 r13
	or	 r3,r0,16
	bcnd	 eq0,r2,@L869
	ld	 r4,r22,lo16(___lc_ctype)
@L1219:
	ld	 r13,r4,28
	bcnd.n	 ne0,r13,@L1173
	addu	 r25,r25,1
	ld.bu	 r13,r0,r25
	ld	 r12,r4,64
	ld	 r13,r12[r13]
	bb0	 (31-27),r13,@L869
	br	 @L1172
	align	 4
@L1173:
	ld.bu	 r2,r0,r25
	jsr.n	 r13
	or	 r3,r0,16
	bcnd	 eq0,r2,@L869
@L1172:
	ld	 r4,r22,lo16(___lc_ctype)
	ld	 r13,r4,28
	bcnd.n	 ne0,r13,@L1177
	addu	 r25,r25,1
	ld.bu	 r13,r0,r25
	ld	 r12,r4,64
	ld	 r13,r12[r13]
	bb0	 (31-27),r13,@L869
	br	 @L1220
	align	 4
@L1177:
	ld.bu	 r2,r0,r25
	jsr.n	 r13
	or	 r3,r0,16
	bcnd	 eq0,r2,@L869
	ld	 r4,r22,lo16(___lc_ctype)
@L1220:
	ld	 r13,r4,28
	bcnd.n	 ne0,r13,@L1181
	addu	 r25,r25,1
@L1206:
	ld.bu	 r13,r0,r25
	ld	 r12,r4,64
	ld	 r13,r12[r13]
	bb0	 (31-27),r13,@L869
	br.n	 @L1233
	addu	 r25,r25,1
	align	 4
@L1181:
	ld.bu	 r2,r0,r25
	jsr.n	 r13
	or	 r3,r0,16
	bcnd	 eq0,r2,@L869
	addu	 r25,r25,1
@L1233:
	cmp	 r13,r25,r19
	bb1	 lo,r13,@L875
@L869:
	ld	 r14,r31,148
	or.u	 r13,r0,hi16(@LC119)
	ld	 r12,r0,r14
	or	 r22,r13,lo16(@LC119)
	subu	 r12,r25,r12
	br.n	 @L850
	st	 r12,r31,92
	align	 4
@L863:
	or	 r22,r0,0
@L850:
	bcnd.n	 eq0,r22,@L849
	or	 r3,r0,r23
	or	 r4,r0,13
	subu	 r12,r0,1
	or	 r13,r0,10
	or.u	 r2,r0,hi16(@LC123)
	st.b	 r13,r23,r12
	or	 r2,r2,lo16(@LC123)
	bsr.n	 _bcopy
	addu	 r23,r23,13
	ld	 r4,r31,96
	or	 r2,r0,r22
	bsr.n	 _bcopy
	or	 r3,r0,r23
	ld	 r13,r31,96
	ld	 r12,r31,92
	bcnd.n	 eq0,r12,@L877
	addu	 r23,r23,r13
	or	 r13,r0,32
	st.b	 r13,r0,r23
	ld	 r2,r31,88
	addu	 r23,r23,1
	ld	 r4,r31,92
	bsr.n	 _bcopy
	or	 r3,r0,r23
	ld	 r13,r31,92
	addu	 r23,r23,r13
@L877:
	or	 r2,r0,r21
	or	 r3,r0,r20
	or	 r4,r0,0
	bsr.n	 _output_line_command
	or	 r5,r0,0
	or	 r13,r0,32
	st.b	 r13,r0,r23
	addu	 r23,r23,1
	or	 r13,r0,47
	st.b	 r13,r0,r23
	addu	 r23,r23,1
@L849:
	or.u	 r14,r0,hi16(_put_out_comments)
	ld	 r13,r14,lo16(_put_out_comments)
	bcnd.n	 ne0,r13,@L878
	or	 r13,r0,42
	or.u	 r13,r0,hi16(_traditional)
	ld	 r13,r13,lo16(_traditional)
	bcnd	 eq0,r13,@L879
	subu	 r23,r23,1
	br.n	 @L1235
	cmp	 r13,r24,r19
	align	 4
@L879:
	subu	 r12,r0,1
	or	 r13,r0,32
	br.n	 @L881
	st.b	 r13,r23,r12
	align	 4
@L878:
	st.b	 r13,r0,r23
	addu	 r23,r23,1
@L881:
	cmp	 r13,r24,r19
@L1235:
	bb0.n	 lo,r13,@L1135
	or	 r22,r0,r24
	or	 r18,r0,92
	or	 r25,r0,10
@L884:
	ld.bu	 r13,r0,r24
	cmp	 r12,r13,42
	bb0.n	 ne,r12,@L888
	addu	 r24,r24,1
	bb1	 gt,r12,@L918
	cmp	 r13,r13,10
	bb0.n	 ne,r13,@L914
	or.u	 r14,r0,hi16(_put_out_comments)
	br.n	 @L1221
	cmp	 r13,r24,r19
	align	 4
@L918:
	cmp	 r13,r13,47
	bb1.n	 ne,r13,@L1221
	cmp	 r13,r24,r19
	or.u	 r13,r0,hi16(_warn_comments)
	ld	 r13,r13,lo16(_warn_comments)
	cmp	 r12,r24,r19
	cmp	 r13,r13,0
	rot	 r11,r13,24
	and.c	 r13,r12,r11
	extu	 r13,r13,1<lo>
	bcnd.n	 eq0,r13,@L1221
	cmp	 r13,r24,r19
	ld.bu	 r13,r0,r24
	cmp	 r13,r13,42
	bb1.n	 ne,r13,@L1221
	cmp	 r13,r24,r19
	or.u	 r2,r0,hi16(@LC124)
	or	 r2,r2,lo16(@LC124)
	bsr.n	 _warning
	addu	 r1,r1,@L1242
@L1243:
	align	 4
@L888:
	ld.bu	 r13,r0,r24
	cmp	 r13,r13,92
	bb1.n	 ne,r13,@L1222
	cmp	 r13,r24,r19
	ld.bu	 r13,r24,1
	cmp	 r13,r13,10
	bb1.n	 ne,r13,@L1222
	cmp	 r13,r24,r19
	or	 r7,r0,r24
	or	 r11,r0,r24
	or	 r8,r0,0
@L893:
	ld.bu	 r13,r0,r11
	cmp	 r13,r13,92
	bb0	 eq,r13,@L892
	ld.bu	 r12,r11,1
	cmp	 r13,r12,10
	bb1.n	 ne,r13,@L895
	cmp	 r13,r12,13
	addu	 r11,r11,2
	br.n	 @L893
	addu	 r8,r8,1
	align	 4
@L895:
	bb0	 eq,r13,@L892
	ld.bu	 r13,r11,2
	cmp	 r13,r13,10
	bb0	 eq,r13,@L892
	addu	 r11,r11,3
	br.n	 @L893
	addu	 r8,r8,1
	align	 4
@L892:
	bcnd	 eq0,r8,@L889
	ld.bu	 r6,r0,r11
	mask	 r13,r6,0xff
	cmp	 r9,r13,47
	cmp	 r10,r13,42
	or	 r13,r9,r10
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 ne0,r13,@L1222
	cmp	 r13,r24,r19
	or	 r13,r10,r9
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L1223
	or	 r13,r0,r8
@L905:
	st.b	 r6,r0,r7
	addu	 r11,r11,1
	ld.bu	 r6,r0,r11
	mask	 r13,r6,0xff
	cmp	 r12,r13,42
	cmp	 r13,r13,47
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 ne0,r12,@L905
	addu	 r7,r7,1
	or	 r13,r0,r8
@L1223:
	bcnd.n	 le0,r13,@L889
	subu	 r8,r8,1
@L909:
	st.b	 r18,r0,r7
	addu	 r7,r7,1
	or	 r13,r0,r8
	subu	 r8,r8,1
	st.b	 r25,r0,r7
	bcnd.n	 gt0,r13,@L909
	addu	 r7,r7,1
@L889:
	cmp	 r13,r24,r19
@L1222:
	bb0	 lo,r13,@L1135
	ld.bu	 r13,r0,r24
	cmp	 r13,r13,47
	bb0.n	 ne,r13,@L1224
	cmp	 r13,r24,r19
	br	 @L1221
	align	 4
@L914:
	ld	 r13,r21,12
	ld	 r12,r14,lo16(_put_out_comments)
	addu	 r13,r13,1
	bcnd.n	 ne0,r12,@L915
	st	 r13,r21,12
	st.b	 r25,r0,r23
	addu	 r23,r23,1
@L915:
	ld	 r13,r20,12
	addu	 r13,r13,1
	st	 r13,r20,12
@L882:
	cmp	 r13,r24,r19
@L1221:
	bb1.n	 lo,r13,@L884
	cmp	 r13,r24,r19
@L1224:
	bb1.n	 lo,r13,@L920
	or.u	 r14,r0,hi16(_put_out_comments)
@L1135:
	bsr.n	 _line_for_error
	ld	 r2,r31,164
	or.u	 r3,r0,hi16(@LC125)
	or	 r3,r3,lo16(@LC125)
	bsr.n	 _error_with_line
	subu	 r1,r1,@L1244
@L1245:
	align	 4
@L920:
	ld	 r13,r14,lo16(_put_out_comments)
	bcnd.n	 eq0,r13,@L699
	addu	 r24,r24,1
	or	 r2,r0,r22
	subu	 r4,r24,r2
@L1213:
	or	 r3,r0,r23
	addu	 r23,r23,r4
	bsr.n	 _bcopy
	subu	 r1,r1,@L1246
@L1247:
	align	 4
@L923:
	or.u	 r13,r0,hi16(_dollars_in_ident)
	ld	 r13,r13,lo16(_dollars_in_ident)
	bcnd	 eq0,r13,@L730
	br	 @L925
	align	 4
@L935:
	bcnd	 ne0,r17,@L925
	cmp	 r13,r24,r19
	bb0	 hs,r13,@L1199
	br	 @L699
	align	 4
@L944:
	ld.bu	 r13,r24,1
	cmp	 r13,r13,10
	bb0	 eq,r13,@L941
	ld	 r13,r21,12
	addu	 r24,r24,2
	cmp	 r12,r24,r19
	addu	 r13,r13,1
	bb0.n	 lo,r12,@L941
	st	 r13,r21,12
@L1199:
	ld.bu	 r13,r0,r24
	cmp	 r13,r13,92
	bb1	 eq,r13,@L944
@L941:
	or.u	 r13,r0,hi16(___lc_ctype)
	ld	 r4,r13,lo16(___lc_ctype)
	ld	 r13,r4,28
	ld.bu	 r25,r0,r24
	bcnd.n	 ne0,r13,@L946
	addu	 r24,r24,1
	ld	 r13,r4,64
	mask	 r12,r25,0xff
	ld	 r13,r13[r12]
	bb1.n	 (31-30),r13,@L1225
	mask	 r13,r25,0xff
	br.n	 @L1226
	cmp	 r13,r12,46
	align	 4
@L946:
	mask	 r2,r25,0xff
	jsr.n	 r13
	or	 r3,r0,2
	bcnd.n	 ne0,r2,@L1225
	mask	 r13,r25,0xff
	mask	 r12,r25,0xff
	cmp	 r13,r12,46
@L1226:
	bb1.n	 ne,r13,@L1227
	cmp	 r13,r12,95
	ld.bu	 r13,r0,r24
	cmp	 r13,r13,46
	bb1.n	 ne,r13,@L1225
	mask	 r13,r25,0xff
	cmp	 r13,r12,95
@L1227:
	bb1	 ne,r13,@L1140
	mask	 r13,r25,0xff
@L1225:
	cmp	 r12,r13,101
	cmp	 r13,r13,69
	or	 r12,r12,r13
	st.b	 r25,r0,r23
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L937
	addu	 r23,r23,1
	cmp	 r13,r24,r19
	bb1	 hs,r13,@L699
	br	 @L1200
	align	 4
@L954:
	ld.bu	 r13,r24,1
	cmp	 r13,r13,10
	bb0	 eq,r13,@L951
	ld	 r13,r21,12
	addu	 r24,r24,2
	cmp	 r12,r24,r19
	addu	 r13,r13,1
	bb1.n	 hs,r12,@L699
	st	 r13,r21,12
@L1200:
	ld.bu	 r13,r0,r24
	cmp	 r13,r13,92
	bb1	 eq,r13,@L954
@L951:
	cmp	 r13,r24,r19
	bb1	 hs,r13,@L699
	ld.bu	 r11,r0,r24
	mask	 r12,r11,0xff
	cmp	 r13,r12,43
	cmp	 r12,r12,45
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L1228
	cmp	 r13,r24,r19
	st.b	 r11,r0,r23
	or.u	 r13,r0,hi16(_traditional)
	ld	 r13,r13,lo16(_traditional)
	addu	 r24,r24,1
	bcnd.n	 ne0,r13,@L699
	addu	 r23,r23,1
@L937:
	cmp	 r13,r24,r19
@L1228:
	bb1	 lo,r13,@L1199
	br	 @L699
	align	 4
@L925:
	ld	 r14,r31,116
	mask	 r13,r25,0xff
	addu	 r17,r17,1
	lda	 r14,r13[r14]
	br.n	 @L699
	st	 r14,r31,116
	align	 4
@L1011:
	ld	 r13,r21,28
	bcnd	 eq0,r13,@L1012
	ld.bu	 r11,r0,r24
	mask	 r12,r11,0xff
	cmp	 r13,r12,45
	bb1	 ne,r13,@L1013
	ld	 r14,r31,132
	bcnd	 ne0,r14,@L1014
	or	 r17,r0,0
	st	 r0,r31,116
@L1014:
	ld	 r14,r31,108
	bcnd.n	 ne0,r14,@L1015
	addu	 r24,r24,1
	br.n	 @L699
	subu	 r23,r23,1
	align	 4
@L1015:
	or	 r13,r0,45
	st.b	 r13,r0,r23
	br.n	 @L699
	addu	 r23,r23,1
	align	 4
@L1013:
	or.u	 r13,r0,hi16(_is_space)
	or	 r13,r13,lo16(_is_space)
	ld.bu	 r13,r12,r13
	bcnd	 eq0,r13,@L1018
	bcnd	 gt0,r17,@L705
	ld	 r14,r31,108
	bcnd.n	 ne0,r14,@L1020
	addu	 r24,r24,1
	subu	 r13,r0,1
	cmp	 r12,r12,10
	bb1.n	 ne,r12,@L699
	st.b	 r11,r23,r13
	ld	 r13,r20,12
	addu	 r13,r13,1
	br.n	 @L699
	st	 r13,r20,12
	align	 4
@L1020:
	st.b	 r11,r0,r23
@L1234:
	br.n	 @L699
	addu	 r23,r23,1
	align	 4
@L1018:
	bsr	 _abort
	align	 4
@L1012:
	bcnd	 gt0,r17,@L705
	ld	 r13,r21,12
	addu	 r13,r13,1
	st	 r13,r21,12
	ld	 r12,r20,12
	addu	 r12,r12,1
	st	 r12,r20,12
	ld	 r13,r21,12
	cmp	 r13,r13,r12
	bb1.n	 eq,r13,@L699
	or	 r16,r0,r24
	or	 r2,r0,r21
	or	 r3,r0,r20
	or	 r4,r0,1
	or	 r5,r0,0
	bsr.n	 _output_line_command
	st	 r23,r20,24
	ld	 r11,r20,24
	ld	 r9,r20,20
	ld	 r13,r20,16
	ld	 r12,r21,24
	ld	 r10,r21,20
	subu	 r11,r11,r9
	ld	 r9,r21,16
	subu	 r12,r12,r10
	subu	 r13,r13,r11
	subu	 r3,r9,r12
	cmp	 r13,r13,r3
	bb1	 gt,r13,@L1027
	bsr.n	 _grow_outbuf
	or	 r2,r0,r20
@L1027:
	ld	 r23,r20,24
	br	 @L699
	align	 4
@L1028:
	cmp	 r13,r24,r19
	bb1	 ls,r13,@L730
	ld	 r13,r21,28
	bcnd.n	 eq0,r13,@L1030
	or.u	 r13,r0,hi16(_traditional)
	ld	 r13,r13,lo16(_traditional)
	cmp	 r12,r17,0
	cmp	 r13,r13,0
	or	 r13,r13,r12
	subu	 r23,r23,1
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L1031
	subu	 r24,r24,1
	ld	 r13,r15,lo16(_indepth)
	subu	 r13,r13,1
	mul	 r13,r13,44
	or.u	 r14,r0,hi16(_instack)
	or	 r14,r14,lo16(_instack)
	addu	 r13,r13,r14
	ld	 r12,r13,24
	or.u	 r13,r0,hi16(_is_idchar)
	ld.bu	 r12,r0,r12
	or	 r13,r13,lo16(_is_idchar)
	ld.bu	 r13,r12,r13
	bcnd	 eq0,r13,@L1201
@L1031:
	ld	 r12,r21,28
	or	 r13,r0,31
	st	 r13,r12,12
	ld	 r2,r21,36
	bcnd	 eq0,r2,@L1035
	bsr	 _free
@L1035:
	ld	 r13,r15,lo16(_indepth)
	subu	 r13,r13,1
	st	 r13,r15,lo16(_indepth)
	mul	 r13,r13,44
	or.u	 r14,r0,hi16(_instack)
	or	 r14,r14,lo16(_instack)
	ld	 r12,r20,20
	addu	 r21,r13,r14
	ld	 r13,r20,16
	ld	 r10,r21,20
	ld	 r11,r21,16
	ld	 r24,r21,24
	subu	 r12,r23,r12
	addu	 r19,r10,r11
	subu	 r13,r13,r12
	subu	 r3,r19,r24
	cmp	 r13,r13,r3
	bb1.n	 gt,r13,@L1041
	st	 r23,r20,24
	bsr.n	 _grow_outbuf
	or	 r2,r0,r20
@L1041:
	ld	 r23,r20,24
	br.n	 @L699
	or	 r16,r0,0
	align	 4
@L1030:
	bcnd	 eq0,r17,@L1141
@L705:
	subu	 r24,r24,1
	subu	 r23,r23,1
@L1201:
	or	 r14,r0,1
	st	 r14,r31,124
@L730:
	bcnd	 le0,r17,@L699
	or.u	 r13,r0,hi16(_pcp_outfile)
	ld	 r13,r13,lo16(_pcp_outfile)
	bcnd.n	 eq0,r13,@L1049
	or.u	 r13,r0,hi16(_pcp_inside_if)
	ld	 r13,r13,lo16(_pcp_inside_if)
	bcnd	 eq0,r13,@L1047
@L1049:
	ld	 r14,r31,116
	and.u	 r11,r14,0x7fff
	bcnd.n	 ge0,r11,@L1051
	subu	 r12,r0,r11
	divu	 r12,r12,1403
	br.n	 @L1050
	subu	 r12,r0,r12
	align	 4
@L1142:
	or	 r2,r0,r25
	bsr.n	 _pcstring_used
	addu	 r1,r1,@L1248
@L1249:
	align	 4
@L1143:
	or	 r24,r0,r8
	st	 r7,r21,12
	br.n	 @L1047
	st	 r10,r20,12
	align	 4
@L1051:
	divu	 r12,r11,1403
@L1050:
	mul	 r12,r12,1403
	or.u	 r13,r0,hi16(_hashtab)
	or	 r13,r13,lo16(_hashtab)
	subu	 r12,r11,r12
	ld	 r25,r13[r12]
	bcnd	 eq0,r25,@L1047
@L1055:
	ld	 r13,r25,16
	cmp	 r13,r13,r17
	bb1	 ne,r13,@L1054
	ld	 r9,r25,20
	ld	 r14,r31,124
	subu	 r11,r23,r17
	subu	 r13,r14,1
	or	 r10,r0,r17
	addu	 r11,r13,r11
@L1058:
	ld.bu	 r13,r0,r9
	ld.bu	 r12,r0,r11
	addu	 r11,r11,1
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L1054
	addu	 r9,r9,1
	subu	 r10,r10,1
	bcnd	 ne0,r10,@L1058
	ld	 r14,r31,124
	bcnd	 ne0,r14,@L1064
	subu	 r24,r24,1
	subu	 r23,r23,1
@L1064:
	ld	 r11,r20,20
	ld	 r12,r25,12
	subu	 r13,r23,r11
	subu	 r18,r13,r17
	cmp	 r13,r12,34
	ld	 r22,r20,12
	bb1	 eq,r13,@L1142
	cmp	 r13,r12,32
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L1066
	ld	 r14,r31,108
	bcnd	 eq0,r14,@L1047
	ld	 r13,r20,24
	ld	 r12,r20,16
	subu	 r13,r13,r11
	subu	 r11,r19,r24
	subu	 r12,r12,r13
	addu	 r3,r11,2
	cmp	 r12,r12,r3
	bb1	 gt,r12,@L1069
	bsr.n	 _grow_outbuf
	or	 r2,r0,r20
@L1069:
	or	 r13,r0,10
	st.b	 r13,r0,r23
	addu	 r23,r23,1
	or	 r13,r0,45
	st.b	 r13,r0,r23
	br.n	 @L1047
	addu	 r23,r23,1
	align	 4
@L1066:
	subu	 r13,r12,31
	cmp	 r13,r13,1
	bb0	 ls,r13,@L1070
	ld	 r13,r25,24
	ld	 r13,r0,r13
	bcnd	 lt0,r13,@L1070
	ld	 r7,r21,12
	or	 r8,r0,r24
	or	 r9,r0,r23
	or	 r10,r0,r22
@L1073:
	cmp	 r13,r24,r19
	bb1	 ne,r13,@L1074
	ld	 r12,r21,28
	bcnd.n	 eq0,r12,@L1074
	or	 r13,r0,31
	st	 r13,r12,12
	ld	 r2,r21,36
	bcnd	 eq0,r2,@L1078
	bsr	 _free
@L1078:
	ld	 r13,r15,lo16(_indepth)
	subu	 r13,r13,1
	st	 r13,r15,lo16(_indepth)
	mul	 r13,r13,44
	or.u	 r14,r0,hi16(_instack)
	or	 r14,r14,lo16(_instack)
	addu	 r21,r13,r14
	ld	 r13,r20,20
	ld	 r12,r20,16
	ld	 r10,r21,20
	ld	 r11,r21,16
	ld	 r24,r21,24
	subu	 r13,r23,r13
	addu	 r19,r10,r11
	subu	 r12,r12,r13
	subu	 r3,r19,r24
	cmp	 r12,r12,r3
	bb1.n	 gt,r12,@L1084
	st	 r23,r20,24
	bsr.n	 _grow_outbuf
	or	 r2,r0,r20
@L1084:
	ld	 r23,r20,24
	or	 r16,r0,0
	or	 r8,r0,r24
	ld	 r7,r21,12
	ld	 r10,r20,12
	br.n	 @L1073
	or	 r9,r0,r23
	align	 4
@L1074:
	ld.bu	 r13,r0,r24
	cmp	 r13,r13,47
	bb1.n	 ne,r13,@L1087
	addu	 r13,r24,1
	cmp	 r13,r13,r19
	bb0	 ne,r13,@L1087
	ld.bu	 r13,r24,1
	cmp	 r13,r13,42
	bb1.n	 ne,r13,@L1087
	or.u	 r14,r0,hi16(_put_out_comments)
	ld	 r13,r14,lo16(_put_out_comments)
	bcnd.n	 eq0,r13,@L1088
	or	 r13,r0,47
	st.b	 r13,r0,r23
	addu	 r23,r23,1
	br.n	 @L1202
	or	 r13,r0,42
	align	 4
@L1088:
	or.u	 r13,r0,hi16(_traditional)
	ld	 r13,r13,lo16(_traditional)
	bcnd.n	 ne0,r13,@L1089
	or	 r13,r0,32
@L1202:
	st.b	 r13,r0,r23
	addu	 r23,r23,1
@L1089:
	br.n	 @L1091
	addu	 r24,r24,2
	align	 4
@L1098:
	ld.bu	 r12,r0,r24
	cmp	 r13,r12,42
	bb1.n	 ne,r13,@L1229
	cmp	 r13,r12,10
	ld.bu	 r13,r24,1
	cmp	 r13,r13,47
	bb0.n	 ne,r13,@L1092
	cmp	 r13,r12,10
@L1229:
	bb1.n	 ne,r13,@L1230
	or.u	 r14,r0,hi16(_put_out_comments)
	ld	 r13,r21,12
	addu	 r13,r13,1
	st	 r13,r21,12
	ld	 r13,r20,12
	addu	 r13,r13,1
	st	 r13,r20,12
@L1230:
	ld	 r13,r14,lo16(_put_out_comments)
	bcnd	 eq0,r13,@L1096
	ld.bu	 r13,r0,r24
	addu	 r24,r24,1
	st.b	 r13,r0,r23
	br.n	 @L1091
	addu	 r23,r23,1
	align	 4
@L1096:
	addu	 r24,r24,1
@L1091:
	addu	 r13,r24,1
	cmp	 r13,r13,r19
	bb1	 ne,r13,@L1098
@L1092:
	or.u	 r14,r0,hi16(_put_out_comments)
	ld	 r13,r14,lo16(_put_out_comments)
	bcnd.n	 eq0,r13,@L1073
	addu	 r24,r24,2
	or	 r13,r0,42
	st.b	 r13,r0,r23
	addu	 r23,r23,1
	br.n	 @L1203
	or	 r13,r0,47
	align	 4
@L1087:
	ld.bu	 r11,r0,r24
	or.u	 r13,r0,hi16(_is_space)
	or	 r13,r13,lo16(_is_space)
	mask	 r12,r11,0xff
	ld.bu	 r13,r12,r13
	bcnd	 eq0,r13,@L1072
	st.b	 r11,r0,r23
	addu	 r24,r24,1
	subu	 r13,r0,1
	ld.bu	 r13,r24,r13
	cmp	 r13,r13,10
	bb1.n	 ne,r13,@L1073
	addu	 r23,r23,1
	ld	 r13,r21,28
	bcnd	 ne0,r13,@L1103
	ld	 r13,r21,12
	addu	 r13,r13,1
	st	 r13,r21,12
	ld	 r13,r20,12
	addu	 r13,r13,1
	br.n	 @L1073
	st	 r13,r20,12
	align	 4
@L1103:
	ld	 r14,r31,108
	bcnd	 ne0,r14,@L1105
	ld.bu	 r12,r0,r24
	cmp	 r13,r12,45
	bb1.n	 ne,r13,@L1106
	subu	 r23,r23,1
	br.n	 @L1073
	addu	 r24,r24,1
	align	 4
@L1106:
	cmp	 r13,r12,10
	bb1	 ne,r13,@L1105
	ld	 r13,r20,12
	addu	 r13,r13,1
	st	 r13,r20,12
@L1105:
	ld.bu	 r13,r0,r24
	addu	 r24,r24,1
@L1203:
	st.b	 r13,r0,r23
	br.n	 @L1073
	addu	 r23,r23,1
	align	 4
@L1072:
	ld.bu	 r13,r0,r24
	cmp	 r13,r13,40
	bb1.n	 ne,r13,@L1143
	or	 r23,r0,r9
@L1070:
	ld	 r13,r20,20
	or	 r2,r0,r25
	st	 r22,r20,12
	or	 r3,r0,r20
	st	 r24,r21,24
	addu	 r23,r13,r18
	bsr.n	 _macroexpand
	st	 r23,r20,24
	ld	 r23,r20,24
	ld	 r13,r15,lo16(_indepth)
	mul	 r13,r13,44
	or.u	 r14,r0,hi16(_instack)
	or	 r14,r14,lo16(_instack)
	ld	 r12,r20,16
	addu	 r21,r13,r14
	ld	 r13,r20,20
	ld	 r10,r21,20
	ld	 r11,r21,16
	ld	 r24,r21,24
	subu	 r13,r23,r13
	addu	 r19,r10,r11
	subu	 r12,r12,r13
	subu	 r3,r19,r24
	cmp	 r12,r12,r3
	bb1.n	 gt,r12,@L1117
	st	 r23,r20,24
	bsr.n	 _grow_outbuf
	or	 r2,r0,r20
@L1117:
	ld	 r23,r20,24
	br.n	 @L1047
	or	 r16,r0,0
	align	 4
@L1054:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L1055
@L1047:
	st	 r0,r31,116
	st	 r0,r31,124
	or	 r17,r0,0
	br.n	 @L699
	st	 r0,r31,132
	align	 4
@L1044:
	or.u	 r13,r0,hi16(_if_stack)
	ld	 r12,r13,lo16(_if_stack)
	ld	 r13,r21,32
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L1122
	ld	 r12,r12,20
	cmp	 r13,r12,7
	bb0	 ne,r13,@L1124
	bb0.n	 ls,r13,@L1131
	cmp	 r13,r12,5
	bb0	 ne,r13,@L1125
	cmp	 r13,r12,6
	bb0.n	 ne,r13,@L1126
	or.u	 r13,r0,hi16(@LC128)
	br.n	 @L1231
	or.u	 r13,r0,hi16(_if_stack)
	align	 4
@L1131:
	cmp	 r13,r12,8
	bb0	 ne,r13,@L1127
	cmp	 r13,r12,10
	bb0.n	 ne,r13,@L1128
	or.u	 r13,r0,hi16(@LC130)
	br.n	 @L1231
	or.u	 r13,r0,hi16(_if_stack)
	align	 4
@L1124:
	or.u	 r13,r0,hi16(@LC126)
	br.n	 @L1204
	or	 r13,r13,lo16(@LC126)
	align	 4
@L1125:
	or.u	 r13,r0,hi16(@LC127)
	br.n	 @L1204
	or	 r13,r13,lo16(@LC127)
	align	 4
@L1126:
	br.n	 @L1204
	or	 r13,r13,lo16(@LC128)
	align	 4
@L1127:
	or.u	 r13,r0,hi16(@LC129)
	br.n	 @L1204
	or	 r13,r13,lo16(@LC129)
	align	 4
@L1128:
	or	 r13,r13,lo16(@LC130)
@L1204:
	st	 r13,r31,156
	or.u	 r13,r0,hi16(_if_stack)
@L1231:
	ld	 r13,r13,lo16(_if_stack)
	bsr.n	 _line_for_error
	ld	 r2,r13,8
	or.u	 r3,r0,hi16(@LC131)
	ld	 r4,r31,156
	bsr.n	 _error_with_line
	or	 r3,r3,lo16(@LC131)
@L1122:
	ld	 r12,r21,32
@Lte3:
	ld	 r1,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	ld.d	 r14,r31,32
	or.u	 r13,r0,hi16(_if_stack)
	addu	 r31,r31,176
	jmp.n	 r1
	st	 r12,r13,lo16(_if_stack)
	def	 @L1248,@L1047-@L1249
	def	 @L1246,@L1247-@L699
	def	 @L1244,@L1245-@L699
	def	 @L1242,@L882-@L1243
	def	 @L1240,@L1241-@L699
	def	 @L1238,@L1205-@L1239
	def	 @L1236,@L1237-@L699

data
	align	 8
@LC132:
	string	 "macro or `#include' recursion too deep\000"
text
	align	 8
_expand_to_temp_buffer:
	subu	 r31,r31,128
	or.u	 r13,r0,hi16(_assertions_flag)
	st	 r19,r31,36
	ld	 r19,r13,lo16(_assertions_flag)
	st	 r1,r31,68
	st	 r30,r31,64
	addu	 r30,r31,64
	st.d	 r22,r31,48
	or	 r22,r0,r12
	st.d	 r20,r31,40
	st	 r5,r13,lo16(_assertions_flag)
	or.u	 r13,r0,hi16(_indepth)
	st.d	 r24,r31,56
@Ltb4:
	subu	 r25,r3,r2
	ld	 r20,r13,lo16(_indepth)
	bcnd.n	 ge0,r25,@L1251
	or	 r21,r0,r4
	bsr	 _abort
	align	 4
@L1251:
	addu	 r13,r25,16
	and	 r13,r13,0xfff0
	subu	 r31,r31,r13
	addu	 r24,r31,32
	cmp	 r13,r2,r3
	bb0.n	 ne,r13,@L1253
	or	 r12,r0,r24
	bb1.n	 ge,r13,@L1260
	mask	 r11,r25,3
	bcnd.n	 eq0,r11,@L1254
	cmp	 r13,r11,1
	bb1.n	 le,r13,@L1260
	cmp	 r13,r11,2
	bb1	 le,r13,@L1261
	ld.bu	 r13,r0,r2
	addu	 r2,r2,1
	addu	 r12,r31,33
	st.b	 r13,r31,32
@L1261:
	ld.bu	 r13,r0,r2
	addu	 r2,r2,1
	st.b	 r13,r0,r12
	addu	 r12,r12,1
@L1260:
	ld.bu	 r13,r0,r2
	addu	 r2,r2,1
	st.b	 r13,r0,r12
	cmp	 r13,r2,r3
	bb0.n	 ne,r13,@L1253
	addu	 r12,r12,1
@L1254:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r12
	ld.bu	 r13,r2,1
	st.b	 r13,r12,1
	ld.bu	 r13,r2,2
	st.b	 r13,r12,2
	ld.bu	 r13,r2,3
	addu	 r2,r2,4
	st.b	 r13,r12,3
	cmp	 r13,r2,r3
	bb1.n	 ne,r13,@L1254
	addu	 r12,r12,4
@L1253:
	mak	 r2,r25,0<1>
	or.u	 r23,r0,hi16(_indepth)
	st.b	 r0,r24,r25
	addu	 r2,r2,100
	bsr.n	 _xmalloc
	st	 r2,r30,24
	ld	 r11,r23,lo16(_indepth)
	st	 r2,r30,28
	st	 r2,r30,32
	st	 r0,r30,8
	st	 r0,r30,36
	cmp	 r13,r11,198
	bb0.n	 gt,r13,@L1256
	st	 r0,r30,44
	mul	 r13,r11,44
	or.u	 r12,r0,hi16(_instack)
	or	 r12,r12,lo16(_instack)
	addu	 r13,r13,r12
	bsr.n	 _line_for_error
	ld	 r2,r13,12
	or.u	 r3,r0,hi16(@LC132)
	bsr.n	 _error_with_line
	or	 r3,r3,lo16(@LC132)
	subu	 r3,r30,44
	ld	 r4,r3,52
	br.n	 @L1280
	subu	 r2,r22,52
	align	 4
@L1256:
	addu	 r11,r11,1
	mul	 r12,r11,44
	or.u	 r13,r0,hi16(_instack)
	or	 r13,r13,lo16(_instack)
	st	 r11,r23,lo16(_indepth)
	addu	 r12,r12,r13
	or.u	 r13,r0,hi16(_if_stack)
	st.b	 r0,r12,40
	ld	 r13,r13,lo16(_if_stack)
	st	 r0,r0,r12
	st	 r0,r12,4
	st	 r0,r12,28
	st	 r0,r12,36
	st	 r25,r12,16
	st	 r24,r12,24
	st	 r24,r12,20
	addu	 r2,r30,8
	st	 r13,r12,32
	or	 r13,r0,1
	st	 r13,r30,20
	or	 r3,r0,r21
	bsr.n	 _rescan
	st	 r13,r12,12
	ld	 r13,r23,lo16(_indepth)
	subu	 r13,r13,1
	cmp	 r12,r13,r20
	bb0.n	 ne,r12,@L1257
	st	 r13,r23,lo16(_indepth)
	bsr	 _abort
	align	 4
@L1257:
	ld	 r13,r30,32
	ld	 r12,r30,28
	subu	 r3,r30,44
	subu	 r13,r13,r12
	st	 r13,r30,24
	ld	 r4,r3,52
	or.u	 r13,r0,hi16(_assertions_flag)
	subu	 r2,r22,52
	st	 r19,r13,lo16(_assertions_flag)
@L1280:
	bsr	 ___movstrSI96x44
@Lte4:
	subu	 r31,r30,64
	ld	 r1,r31,68
	ld	 r30,r31,64
	ld	 r19,r31,36
	ld.d	 r24,r31,56
	or	 r2,r0,r22
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,128

data
	align	 8
@LC133:
	string	 "%s in preprocessing directive\000"
	align	 8
@LC134:
	string	 "formfeed\000"
	align	 8
@LC135:
	string	 "vertical tab\000"
	align	 4
_line_directive_table.18:
	word	 4
	word	 _do_line
	word	 @LC136
	word	 12
	zero	 4
	align	 8
@LC136:
	string	 "line\000"
	align	 8
@LC137:
	string	 "`#' followed by integer\000"
	align	 8
@LC138:
	string	 "invalid preprocessor directive\000"
	align	 8
@LC139:
	string	 "invalid preprocessor directive name\000"
	align	 8
@LC140:
	string	 "__NeXT__\000"
	align	 8
@LC141:
	string	 "%s in preprocessing directive\000"
	align	 8
@LC142:
	string	 "formfeed\000"
	align	 8
@LC143:
	string	 "vertical tab\000"
text
	align	 8
_handle_directive:
	subu	 r31,r31,112
	st	 r1,r31,84
	st	 r30,r31,80
	st.d	 r24,r31,72
	or.u	 r13,r0,hi16(_is_hor_space)
	st.d	 r22,r31,64
	or.u	 r12,r0,hi16(@LC133)
	st.d	 r20,r31,56
	addu	 r30,r31,80
	st.d	 r18,r31,48
	or	 r21,r0,r2
	st.d	 r16,r31,40
	or	 r22,r0,r3
	st.d	 r14,r31,32
@Ltb5:
	or	 r24,r13,lo16(_is_hor_space)
	ld	 r23,r21,24
	or	 r25,r12,lo16(@LC133)
	or.u	 r12,r0,hi16(_directive_start)
	st	 r0,r30,8
	subu	 r13,r23,1
	st	 r13,r12,lo16(_directive_start)
@L1284:
	ld.bu	 r12,r0,r23
	mask	 r11,r12,0xff
	ld.bu	 r13,r11,r24
	bcnd.n	 eq0,r13,@L1285
	subu	 r13,r12,11
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L1286
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	bcnd.n	 eq0,r13,@L1286
	cmp	 r13,r11,12
	bb1.n	 ne,r13,@L1287
	or.u	 r13,r0,hi16(@LC135)
	or.u	 r13,r0,hi16(@LC134)
	br.n	 @L1288
	or	 r3,r13,lo16(@LC134)
	align	 4
@L1287:
	or	 r3,r13,lo16(@LC135)
@L1288:
	bsr.n	 _pedwarn
	or	 r2,r0,r25
@L1286:
	br.n	 @L1284
	addu	 r23,r23,1
	align	 4
@L1285:
	cmp	 r13,r11,47
	bb1	 ne,r13,@L1290
	ld.bu	 r13,r23,1
	cmp	 r13,r13,42
	bb1.n	 ne,r13,@L1290
	or	 r2,r0,r21
	addu	 r3,r21,12
	or	 r4,r0,0
	bsr.n	 _skip_to_end_of_comment
	st	 r23,r21,24
	ld	 r23,r21,24
	br	 @L1284
	align	 4
@L1290:
	ld.bu	 r13,r0,r23
	cmp	 r13,r13,92
	bb0	 eq,r13,@L1283
	ld.bu	 r13,r23,1
	cmp	 r13,r13,10
	bb0	 eq,r13,@L1283
	ld	 r13,r21,12
	addu	 r23,r23,2
	addu	 r13,r13,1
	br.n	 @L1284
	st	 r13,r21,12
	align	 4
@L1283:
	or	 r24,r0,r23
	or	 r5,r0,92
	or.u	 r13,r0,hi16(_is_idchar)
	or	 r6,r0,10
	or	 r7,r13,lo16(_is_idchar)
@L1297:
	ld.bu	 r12,r0,r24
	ld.bu	 r13,r12,r7
	bcnd.n	 ne0,r13,@L1560
	cmp	 r13,r12,92
	bb0	 eq,r13,@L1300
	ld.bu	 r13,r24,1
	cmp	 r13,r13,10
	bb0	 eq,r13,@L1300
	or	 r9,r0,r24
	or	 r11,r0,r24
	or	 r10,r0,0
@L1304:
	ld.bu	 r13,r0,r11
	cmp	 r13,r13,92
	bb0	 eq,r13,@L1303
	ld.bu	 r12,r11,1
	cmp	 r13,r12,10
	bb1.n	 ne,r13,@L1306
	cmp	 r13,r12,13
	addu	 r11,r11,2
	br.n	 @L1304
	addu	 r10,r10,1
	align	 4
@L1306:
	bb0	 eq,r13,@L1303
	ld.bu	 r13,r11,2
	cmp	 r13,r13,10
	bb0	 eq,r13,@L1303
	addu	 r11,r11,3
	br.n	 @L1304
	addu	 r10,r10,1
	align	 4
@L1303:
	bcnd	 eq0,r10,@L1300
	ld.bu	 r12,r0,r11
	mask	 r13,r12,0xff
	ld.bu	 r13,r13,r7
	bcnd.n	 eq0,r13,@L1300
	or.u	 r13,r0,hi16(_is_idchar)
	or	 r8,r13,lo16(_is_idchar)
@L1316:
	addu	 r11,r11,1
	st.b	 r12,r0,r9
	ld.bu	 r12,r0,r11
	mask	 r13,r12,0xff
	ld.bu	 r13,r13,r8
	bcnd.n	 ne0,r13,@L1316
	addu	 r9,r9,1
	or	 r13,r0,r10
	bcnd.n	 le0,r13,@L1300
	subu	 r10,r10,1
@L1320:
	st.b	 r5,r0,r9
	addu	 r9,r9,1
	or	 r13,r0,r10
	subu	 r10,r10,1
	st.b	 r6,r0,r9
	bcnd.n	 gt0,r13,@L1320
	addu	 r9,r9,1
@L1300:
	ld.bu	 r13,r0,r24
	ld.bu	 r13,r13,r7
	bcnd.n	 eq0,r13,@L1296
	or	 r18,r0,r24
@L1560:
	br.n	 @L1297
	addu	 r24,r24,1
	align	 4
@L1296:
	subu	 r25,r24,r23
	bcnd.n	 ne0,r25,@L1515
	or	 r20,r0,r23
	ld.bu	 r13,r0,r24
	cmp	 r13,r13,10
	bb1.n	 ne,r13,@L1563
	or.u	 r13,r0,hi16(_is_idchar)
	or	 r2,r0,1
	br.n	 @L1514
	st	 r24,r21,24
	align	 4
@L1515:
	or.u	 r13,r0,hi16(_is_idstart)
	ld.bu	 r12,r0,r23
	or	 r13,r13,lo16(_is_idstart)
	ld.bu	 r13,r12,r13
	bcnd.n	 ne0,r13,@L1326
	or.u	 r13,r0,hi16(_directive_table)
	or.u	 r13,r0,hi16(_is_idchar)
@L1563:
	ld.bu	 r12,r0,r20
	or	 r11,r13,lo16(_is_idchar)
	ld.bu	 r13,r12,r11
	bcnd.n	 eq0,r13,@L1329
	or	 r12,r0,r20
@L1330:
	ld.bu	 r13,r0,r12
	subu	 r13,r13,48
	mask	 r13,r13,0xff
	cmp	 r13,r13,9
	bb0	 ls,r13,@L1329
	addu	 r12,r12,1
	ld.bu	 r13,r0,r12
	ld.bu	 r13,r13,r11
	bcnd	 ne0,r13,@L1330
@L1329:
	cmp	 r13,r12,r20
	bb0.n	 ne,r13,@L1516
	or.u	 r13,r0,hi16(_is_idchar)
	ld.bu	 r12,r0,r12
	or	 r13,r13,lo16(_is_idchar)
	ld.bu	 r13,r12,r13
	bcnd.n	 ne0,r13,@L1564
	or.u	 r13,r0,hi16(_lang_asm)
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	bcnd.n	 eq0,r13,@L1334
	or.u	 r2,r0,hi16(@LC137)
	bsr.n	 _pedwarn
	or	 r2,r2,lo16(@LC137)
@L1334:
	or.u	 r13,r0,hi16(_line_directive_table.18)
	or	 r18,r0,r20
	br.n	 @L1335
	or	 r19,r13,lo16(_line_directive_table.18)
	align	 4
@L1516:
	ld.bu	 r3,r0,r20
	cmp	 r13,r3,35
	bb0.n	 ne,r13,@L1565
	addu	 r12,r12,1
	or.u	 r13,r0,hi16(_is_hor_space)
	or	 r13,r13,lo16(_is_hor_space)
	ld.bu	 r13,r3,r13
	bcnd.n	 eq0,r13,@L1338
	subu	 r12,r12,1
	addu	 r12,r12,1
@L1565:
	ld.bu	 r11,r0,r12
	cmp	 r13,r11,35
	bb1.n	 eq,r13,@L1565
	addu	 r12,r12,1
	subu	 r12,r12,1
	or.u	 r13,r0,hi16(_is_hor_space)
	or	 r13,r13,lo16(_is_hor_space)
	ld.bu	 r13,r11,r13
	bcnd.n	 ne0,r13,@L1565
	addu	 r12,r12,1
	subu	 r12,r12,1
@L1338:
	ld.bu	 r13,r0,r12
	cmp	 r13,r13,10
	bb1.n	 ne,r13,@L1336
	or.u	 r13,r0,hi16(_lang_asm)
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	bcnd.n	 eq0,r13,@L1345
	or.u	 r13,r0,hi16(_lang_asm)
	ld	 r13,r13,lo16(_lang_asm)
	bcnd.n	 ne0,r13,@L1514
	or	 r2,r0,0
	or.u	 r2,r0,hi16(@LC138)
	or	 r2,r2,lo16(@LC138)
	bsr.n	 _warning
	addu	 r1,r1,@L1582
@L1583:
	align	 4
@L1336:
@L1564:
	ld	 r13,r13,lo16(_lang_asm)
	bcnd.n	 ne0,r13,@L1514
	or	 r2,r0,0
	or.u	 r2,r0,hi16(@LC139)
	or	 r2,r2,lo16(@LC139)
	bsr.n	 _error
	addu	 r1,r1,@L1584
@L1585:
	align	 4
@L1326:
	ld	 r12,r13,lo16(_directive_table)
	bcnd.n	 le0,r12,@L1345
	or	 r19,r13,lo16(_directive_table)
	ld	 r13,r0,r19
	cmp	 r13,r13,r25
@L1579:
	bb1	 ne,r13,@L1346
	ld	 r2,r19,8
	or	 r3,r0,r20
	bsr.n	 _strncmp
	or	 r4,r0,r25
	bcnd.n	 ne0,r2,@L1346
	or	 r14,r0,0
@L1335:
	ld	 r11,r21,20
	or.u	 r13,r0,hi16(_traditional)
	ld	 r12,r21,16
	ld	 r13,r13,lo16(_traditional)
	or	 r15,r0,0
	st	 r0,r30,12
	bcnd.n	 eq0,r13,@L1349
	addu	 r24,r11,r12
	ld.b	 r13,r19,17
	cmp	 r13,r13,0
	extu	 r15,r13,1<ne>
@L1349:
	ld	 r13,r19,12
	cmp	 r13,r13,4
	bb1.n	 ne,r13,@L1350
	or.u	 r13,r0,hi16(_objc)
	ld	 r13,r13,lo16(_objc)
	bcnd.n	 ne0,r13,@L1350
	or.u	 r2,r0,hi16(@LC140)
	subu	 r3,r0,1
	or	 r2,r2,lo16(@LC140)
	bsr.n	 _lookup
	or	 r4,r0,r3
	bcnd.n	 eq0,r2,@L1514
	or	 r2,r0,0
@L1350:
	or	 r20,r0,r18
	cmp	 r13,r18,r24
	bb0.n	 lo,r13,@L1352
	or	 r23,r0,r20
@L1353:
	ld.bu	 r11,r0,r23
	mask	 r12,r11,0xff
	cmp	 r13,r12,47
	bb0.n	 ne,r13,@L1369
	addu	 r23,r23,1
	bb1.n	 gt,r13,@L1405
	cmp	 r13,r12,60
	cmp	 r13,r12,34
	bb0	 ne,r13,@L1359
	bb1.n	 gt,r13,@L1406
	cmp	 r13,r12,39
	cmp	 r13,r12,10
	bb0	 ne,r13,@L1402
	bb0.n	 ge,r13,@L1566
	cmp	 r13,r23,r24
	cmp	 r13,r12,12
	bb1.n	 gt,r13,@L1566
	cmp	 r13,r23,r24
	br.n	 @L1398
	or.u	 r13,r0,hi16(_pedantic)
	align	 4
@L1406:
	bb0.n	 ne,r13,@L1359
	cmp	 r13,r23,r24
	br	 @L1566
	align	 4
@L1405:
	bb0.n	 ne,r13,@L1363
	cmp	 r13,r12,92
	bb1.n	 ne,r13,@L1566
	cmp	 r13,r23,r24
	bb0	 lo,r13,@L1352
	ld.bu	 r13,r0,r23
	cmp	 r13,r13,10
	bb1	 ne,r13,@L1357
	ld	 r12,r21,12
	or	 r13,r0,1
	st	 r13,r30,8
	addu	 r12,r12,1
	st	 r12,r21,12
@L1357:
	br.n	 @L1351
	addu	 r23,r23,1
	align	 4
@L1359:
	ld	 r4,r21,12
	subu	 r2,r23,1
	or	 r3,r0,r24
	addu	 r5,r21,12
	addu	 r6,r30,8
	bsr.n	 _skip_quoted_string
	addu	 r7,r30,12
	ld	 r13,r30,12
	bcnd.n	 eq0,r13,@L1351
	or	 r23,r0,r2
	or.u	 r13,r0,hi16(_traditional)
	ld	 r13,r13,lo16(_traditional)
	bcnd.n	 ne0,r13,@L1352
	or	 r2,r0,1
	br.n	 @L1514
	st	 r23,r21,24
	align	 4
@L1363:
	ld.b	 r13,r19,16
	bcnd.n	 eq0,r13,@L1566
	cmp	 r13,r23,r24
	ld.bu	 r13,r0,r23
	cmp	 r12,r13,0
	cmp	 r13,r13,62
	or	 r12,r12,r13
	extu	 r13,r12,1<eq>
	xor	 r12,r13,1
	bcnd.n	 eq0,r12,@L1566
	cmp	 r13,r23,r24
	addu	 r23,r23,1
@L1567:
	ld.bu	 r13,r0,r23
	cmp	 r12,r13,0
	cmp	 r13,r13,62
	or	 r12,r12,r13
	extu	 r13,r12,1<eq>
	xor	 r12,r13,1
	bcnd.n	 ne0,r12,@L1567
	addu	 r23,r23,1
	subu	 r23,r23,1
	br.n	 @L1566
	cmp	 r13,r23,r24
	align	 4
@L1369:
	ld.bu	 r13,r0,r23
	cmp	 r13,r13,92
	bb0	 eq,r13,@L1370
	ld.bu	 r13,r23,1
	cmp	 r13,r13,10
	bb0	 eq,r13,@L1370
	or	 r6,r0,r23
	or	 r11,r0,r23
	or	 r8,r0,0
@L1374:
	ld.bu	 r13,r0,r11
	cmp	 r13,r13,92
	bb0	 eq,r13,@L1373
	ld.bu	 r12,r11,1
	cmp	 r13,r12,10
	bb1.n	 ne,r13,@L1376
	cmp	 r13,r12,13
	addu	 r11,r11,2
	br.n	 @L1374
	addu	 r8,r8,1
	align	 4
@L1376:
	bb0	 eq,r13,@L1373
	ld.bu	 r13,r11,2
	cmp	 r13,r13,10
	bb0	 eq,r13,@L1373
	addu	 r11,r11,3
	br.n	 @L1374
	addu	 r8,r8,1
	align	 4
@L1373:
	bcnd	 eq0,r8,@L1370
	ld.bu	 r7,r0,r11
	mask	 r13,r7,0xff
	cmp	 r9,r13,47
	cmp	 r10,r13,42
	or	 r13,r9,r10
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 ne0,r13,@L1370
	or	 r13,r10,r9
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L1568
	or	 r13,r0,r8
@L1386:
	st.b	 r7,r0,r6
	addu	 r11,r11,1
	ld.bu	 r7,r0,r11
	mask	 r13,r7,0xff
	cmp	 r12,r13,42
	cmp	 r13,r13,47
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 ne0,r12,@L1386
	addu	 r6,r6,1
	or	 r13,r0,r8
@L1568:
	bcnd.n	 le0,r13,@L1370
	subu	 r8,r8,1
	or	 r11,r0,92
	or	 r12,r0,10
@L1390:
	st.b	 r11,r0,r6
	addu	 r6,r6,1
	or	 r13,r0,r8
	subu	 r8,r8,1
	st.b	 r12,r0,r6
	bcnd.n	 gt0,r13,@L1390
	addu	 r6,r6,1
@L1370:
	ld.bu	 r12,r0,r23
	cmp	 r13,r12,42
	bb0.n	 ne,r13,@L1393
	or.u	 r13,r0,hi16(_cplusplus_comments)
	ld	 r13,r13,lo16(_cplusplus_comments)
	bcnd.n	 eq0,r13,@L1566
	cmp	 r13,r23,r24
	cmp	 r13,r12,47
	bb1.n	 ne,r13,@L1566
	cmp	 r13,r23,r24
@L1393:
	or	 r2,r0,r21
	addu	 r3,r21,12
	or	 r4,r0,0
	addu	 r13,r23,1
	bsr.n	 _skip_to_end_of_comment
	st	 r13,r21,24
	subu	 r25,r23,1
	ld	 r23,r21,24
	cmp	 r13,r23,r24
	bb0	 ne,r13,@L1395
	ld.bu	 r13,r0,r23
	cmp	 r13,r13,10
	bb1	 ne,r13,@L1394
@L1395:
	br.n	 @L1362
	or	 r23,r0,r25
	align	 4
@L1394:
	bcnd.n	 ne0,r15,@L1566
	cmp	 r13,r23,r24
	ld	 r13,r30,8
	addu	 r13,r13,1
	br.n	 @L1351
	st	 r13,r30,8
	align	 4
@L1398:
	ld	 r13,r13,lo16(_pedantic)
	bcnd.n	 eq0,r13,@L1566
	cmp	 r13,r23,r24
	mask	 r13,r11,0xff
	or.u	 r12,r0,hi16(@LC141)
	cmp	 r13,r13,12
	bb1.n	 ne,r13,@L1400
	or	 r2,r12,lo16(@LC141)
	or.u	 r13,r0,hi16(@LC142)
	br.n	 @L1401
	or	 r3,r13,lo16(@LC142)
	align	 4
@L1400:
	or.u	 r13,r0,hi16(@LC143)
	or	 r3,r13,lo16(@LC143)
@L1401:
	bsr.n	 _pedwarn
	addu	 r1,r1,@L1586
@L1587:
	align	 4
@L1402:
	br.n	 @L1352
	subu	 r23,r23,1
	align	 4
@L1351:
	cmp	 r13,r23,r24
@L1566:
	bb1	 lo,r13,@L1353
@L1352:
	st	 r23,r21,24
@L1362:
	or.u	 r13,r0,hi16(_no_output)
	ld	 r16,r21,24
	ld	 r13,r13,lo16(_no_output)
	bcnd.n	 ne0,r13,@L1408
	st	 r16,r30,28
	ld.b	 r13,r19,18
	bcnd.n	 eq0,r13,@L1408
	or.u	 r13,r0,hi16(_put_out_comments)
	ld	 r13,r13,lo16(_put_out_comments)
	bcnd	 eq0,r13,@L1408
	ld	 r12,r22,24
	ld	 r11,r22,20
	ld	 r13,r22,16
	subu	 r12,r12,r11
	ld	 r11,r0,r19
	subu	 r13,r13,r12
	addu	 r3,r11,2
	cmp	 r13,r13,r3
	bb1	 gt,r13,@L1410
	bsr.n	 _grow_outbuf
	or	 r2,r0,r22
@L1410:
	ld	 r12,r22,24
	ld	 r13,r22,20
	cmp	 r13,r12,r13
	bb1.n	 ls,r13,@L1580
	subu	 r13,r0,1
	ld.bu	 r13,r12,r13
	cmp	 r13,r13,10
	bb0	 ne,r13,@L1580
	ld	 r13,r22,12
	ld	 r12,r22,24
	addu	 r13,r13,1
	st	 r13,r22,12
	addu	 r13,r12,1
	st	 r13,r22,24
	or	 r13,r0,10
	st.b	 r13,r0,r12
	ld	 r12,r22,24
@L1580:
	addu	 r13,r12,1
	st	 r13,r22,24
	or	 r13,r0,35
	st.b	 r13,r0,r12
	ld	 r2,r19,8
	ld	 r3,r22,24
	bsr.n	 _bcopy
	ld	 r4,r0,r19
	ld	 r11,r22,24
	ld	 r13,r0,r19
	ld	 r12,r22,20
	addu	 r11,r11,r13
	ld	 r13,r22,16
	subu	 r12,r11,r12
	subu	 r25,r23,r20
	subu	 r13,r13,r12
	cmp	 r13,r13,r25
	bb1.n	 gt,r13,@L1413
	st	 r11,r22,24
	or	 r2,r0,r22
	bsr.n	 _grow_outbuf
	or	 r3,r0,r25
@L1413:
	or	 r2,r0,r20
	ld	 r3,r22,24
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r22,24
	addu	 r13,r13,r25
	subu	 r25,r25,1
	bcnd.n	 lt0,r25,@L1415
	st	 r13,r22,24
	xor.c	 r13,r25,r0
	bcnd.n	 lt0,r25,@L1528
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L1416
	cmp	 r13,r12,3
	bb1.n	 ge,r13,@L1528
	cmp	 r13,r12,2
	bb1	 ge,r13,@L1529
	ld.bu	 r13,r20,r25
	cmp	 r13,r13,10
	bb1	 ne,r13,@L1531
	ld	 r13,r22,12
	addu	 r13,r13,1
	st	 r13,r22,12
@L1531:
	subu	 r25,r25,1
@L1529:
	ld.bu	 r13,r20,r25
	cmp	 r13,r13,10
	bb1	 ne,r13,@L1534
	ld	 r13,r22,12
	addu	 r13,r13,1
	st	 r13,r22,12
@L1534:
	subu	 r25,r25,1
@L1528:
	ld.bu	 r13,r20,r25
	cmp	 r13,r13,10
	bb1	 ne,r13,@L1537
	ld	 r13,r22,12
	addu	 r13,r13,1
	st	 r13,r22,12
@L1537:
	subu	 r25,r25,1
	bcnd	 lt0,r25,@L1415
@L1416:
	ld.bu	 r13,r20,r25
	cmp	 r13,r13,10
	bb1.n	 ne,r13,@L1569
	subu	 r13,r25,1
	ld	 r13,r22,12
	addu	 r13,r13,1
	st	 r13,r22,12
	subu	 r13,r25,1
@L1569:
	ld.bu	 r13,r20,r13
	cmp	 r13,r13,10
	bb1.n	 ne,r13,@L1570
	subu	 r13,r25,2
	ld	 r13,r22,12
	addu	 r13,r13,1
	st	 r13,r22,12
	subu	 r13,r25,2
@L1570:
	ld.bu	 r13,r20,r13
	cmp	 r13,r13,10
	bb1.n	 ne,r13,@L1571
	subu	 r13,r25,3
	ld	 r13,r22,12
	addu	 r13,r13,1
	st	 r13,r22,12
	subu	 r13,r25,3
@L1571:
	ld.bu	 r13,r20,r13
	cmp	 r13,r13,10
	bb1	 ne,r13,@L1549
	ld	 r13,r22,12
	addu	 r13,r13,1
	st	 r13,r22,12
@L1549:
	subu	 r25,r25,4
	bcnd	 ge0,r25,@L1416
@L1415:
	addu	 r14,r30,16
@L1408:
	ld	 r13,r30,8
	bcnd.n	 eq0,r13,@L1419
	subu	 r13,r23,r20
	addu	 r13,r13,20
	and	 r13,r13,0xfff0
	subu	 r31,r31,r13
	or	 r25,r0,r20
	addu	 r24,r31,32
	cmp	 r13,r25,r23
	bb0.n	 lo,r13,@L1421
	or	 r20,r0,r24
	subu	 r17,r0,1
	or.u	 r13,r0,hi16(_is_space)
	or.u	 r12,r0,hi16(_is_hor_space)
	or	 r18,r13,lo16(_is_space)
@L1422:
	ld.bu	 r10,r0,r25
	st.b	 r10,r0,r24
	mask	 r12,r10,0xff
	addu	 r25,r25,1
	cmp	 r13,r12,47
	bb0.n	 ne,r13,@L1470
	addu	 r24,r24,1
	bb1.n	 gt,r13,@L1483
	cmp	 r13,r12,60
	cmp	 r13,r12,34
	bb0	 ne,r13,@L1461
	bb1.n	 gt,r13,@L1484
	cmp	 r13,r12,39
	cmp	 r13,r12,10
	bb0.n	 ne,r13,@L1424
	cmp	 r13,r25,r23
	br	 @L1572
	align	 4
@L1484:
	bb0.n	 ne,r13,@L1461
	cmp	 r13,r25,r23
	br	 @L1572
	align	 4
@L1483:
	bb0.n	 ne,r13,@L1425
	cmp	 r13,r12,92
	bb0.n	 ne,r13,@L1433
	cmp	 r13,r25,r23
	br	 @L1572
	align	 4
@L1424:
	bsr	 _abort
	align	 4
@L1425:
	ld.b	 r13,r19,16
	bcnd.n	 eq0,r13,@L1572
	cmp	 r13,r25,r23
	extu	 r13,r13,1<lo>
	bcnd.n	 eq0,r13,@L1572
	cmp	 r13,r25,r23
@L1429:
	ld.bu	 r10,r0,r25
	addu	 r25,r25,1
	mask	 r13,r10,0xff
	cmp	 r12,r25,r23
	cmp	 r13,r13,92
	rot	 r11,r13,24
	and	 r13,r11,r12
	extu	 r13,r13,1<lo>
	bcnd	 eq0,r13,@L1430
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,10
	bb1	 ne,r13,@L1430
	addu	 r25,r25,1
	br.n	 @L1581
	mask	 r13,r10,0xff
	align	 4
@L1430:
	st.b	 r10,r0,r24
	addu	 r24,r24,1
	mask	 r13,r10,0xff
@L1581:
	cmp	 r12,r25,r23
	cmp	 r13,r13,62
	rot	 r11,r13,24
	and.c	 r13,r12,r11
	extu	 r13,r13,1<lo>
	bcnd.n	 ne0,r13,@L1429
	cmp	 r13,r25,r23
	br	 @L1572
	align	 4
@L1433:
	ld.bu	 r12,r0,r25
	mask	 r13,r12,0xff
	cmp	 r13,r13,10
	bb1	 ne,r13,@L1434
	subu	 r24,r24,1
	cmp	 r13,r24,r20
	bb0.n	 ne,r13,@L1435
	addu	 r25,r25,1
	ld.bu	 r13,r24,r17
	ld.bu	 r13,r13,r18
	bcnd	 eq0,r13,@L1435
@L1440:
	ld.bu	 r13,r24,r17
	ld.bu	 r13,r13,r18
	bcnd	 eq0,r13,@L1437
	subu	 r24,r24,1
	cmp	 r13,r24,r20
	bb1	 ne,r13,@L1440
@L1437:
	or.u	 r16,r0,hi16(_is_hor_space)
	ld.bu	 r13,r0,r25
	or	 r16,r16,lo16(_is_hor_space)
	ld.bu	 r13,r13,r16
	bcnd.n	 eq0,r13,@L1420
	addu	 r24,r24,1
	or.u	 r13,r0,hi16(_is_hor_space)
	or	 r12,r13,lo16(_is_hor_space)
	addu	 r25,r25,1
@L1573:
	ld.bu	 r13,r0,r25
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L1573
	addu	 r25,r25,1
	subu	 r25,r25,1
	br.n	 @L1572
	cmp	 r13,r25,r23
	align	 4
@L1435:
	ld.bu	 r12,r0,r25
	mask	 r13,r12,0xff
	ld.bu	 r13,r13,r18
	bcnd.n	 eq0,r13,@L1572
	cmp	 r13,r25,r23
	addu	 r25,r25,1
	st.b	 r12,r0,r24
	or.u	 r16,r0,hi16(_is_hor_space)
	ld.bu	 r13,r0,r25
	or	 r16,r16,lo16(_is_hor_space)
	ld.bu	 r13,r13,r16
	bcnd.n	 eq0,r13,@L1420
	addu	 r24,r24,1
	or.u	 r13,r0,hi16(_is_hor_space)
	or	 r12,r13,lo16(_is_hor_space)
	addu	 r25,r25,1
@L1574:
	ld.bu	 r13,r0,r25
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L1574
	addu	 r25,r25,1
	subu	 r25,r25,1
	br.n	 @L1572
	cmp	 r13,r25,r23
	align	 4
@L1434:
	st.b	 r12,r0,r24
	addu	 r25,r25,1
	br.n	 @L1420
	addu	 r24,r24,1
	align	 4
@L1461:
	ld	 r4,r21,12
	subu	 r2,r25,1
	or	 r3,r0,r23
	or	 r5,r0,0
	or	 r6,r0,0
	bsr.n	 _skip_quoted_string
	or	 r7,r0,0
	cmp	 r13,r25,r2
	bb0.n	 ne,r13,@L1572
	cmp	 r13,r25,r23
	or	 r11,r0,92
@L1464:
	ld.bu	 r12,r0,r25
	mask	 r13,r12,0xff
	cmp	 r13,r13,92
	bb1.n	 ne,r13,@L1465
	addu	 r25,r25,1
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,10
	bb0	 ne,r13,@L1466
	st.b	 r11,r0,r24
	br.n	 @L1462
	addu	 r24,r24,1
	align	 4
@L1466:
	br.n	 @L1462
	addu	 r25,r25,1
	align	 4
@L1465:
	st.b	 r12,r0,r24
	addu	 r24,r24,1
@L1462:
	cmp	 r13,r25,r2
	bb1.n	 ne,r13,@L1464
	cmp	 r13,r25,r23
	br	 @L1572
	align	 4
@L1470:
	ld.bu	 r12,r0,r25
	cmp	 r13,r12,42
	bb0.n	 ne,r13,@L1472
	or.u	 r13,r0,hi16(_cplusplus_comments)
	ld	 r13,r13,lo16(_cplusplus_comments)
	bcnd.n	 eq0,r13,@L1572
	cmp	 r13,r25,r23
	cmp	 r13,r12,47
	bb1.n	 ne,r13,@L1572
	cmp	 r13,r25,r23
@L1472:
	or	 r2,r0,r21
	or	 r3,r0,r14
	or	 r4,r0,0
	addu	 r13,r25,1
	bsr.n	 _skip_to_end_of_comment
	st	 r13,r21,24
	bcnd	 eq0,r15,@L1473
	ld	 r13,r21,24
	cmp	 r13,r25,r13
	bb0	 ne,r13,@L1478
@L1476:
	ld.bu	 r13,r0,r25
	st.b	 r13,r0,r24
	ld	 r13,r21,24
	addu	 r25,r25,1
	cmp	 r13,r25,r13
	bb1.n	 ne,r13,@L1476
	addu	 r24,r24,1
	br	 @L1478
	align	 4
@L1473:
	or.u	 r13,r0,hi16(_traditional)
	ld	 r13,r13,lo16(_traditional)
	bcnd	 eq0,r13,@L1479
	subu	 r24,r24,1
	br	 @L1478
	align	 4
@L1479:
	or	 r13,r0,32
	st.b	 r13,r24,r17
@L1478:
	ld	 r25,r21,24
@L1420:
	cmp	 r13,r25,r23
@L1572:
	bb1	 lo,r13,@L1422
@L1421:
	br.n	 @L1486
	st.b	 r0,r0,r24
	align	 4
@L1419:
	or	 r24,r0,r23
@L1486:
	or.u	 r13,r0,hi16(_no_output)
	ld	 r13,r13,lo16(_no_output)
	cmp	 r12,r14,0
	cmp	 r13,r13,0
	ld	 r16,r30,28
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L1487
	st	 r16,r21,24
	ld.b	 r13,r19,18
	bcnd	 ne0,r13,@L1488
	ld	 r13,r19,12
	cmp	 r13,r13,1
	bb1.n	 ne,r13,@L1575
	or	 r2,r0,r20
	or.u	 r13,r0,hi16(_dump_macros)
	ld	 r13,r13,lo16(_dump_macros)
	subu	 r13,r13,2
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L1576
	or	 r3,r0,r24
@L1488:
	ld	 r12,r22,24
	ld	 r11,r22,20
	ld	 r13,r22,16
	subu	 r12,r12,r11
	ld	 r11,r0,r19
	subu	 r13,r13,r12
	addu	 r3,r11,1
	cmp	 r13,r13,r3
	bb1	 gt,r13,@L1490
	bsr.n	 _grow_outbuf
	or	 r2,r0,r22
@L1490:
	ld	 r12,r22,24
	addu	 r13,r12,1
	st	 r13,r22,24
	or	 r13,r0,35
	st.b	 r13,r0,r12
	ld	 r2,r19,8
	ld	 r3,r22,24
	bsr.n	 _bcopy
	ld	 r4,r0,r19
	ld	 r12,r22,24
	ld	 r13,r0,r19
	addu	 r11,r12,r13
	st	 r11,r22,24
	ld.b	 r13,r19,18
	bcnd.n	 ne0,r13,@L1492
	or.u	 r13,r0,hi16(_dump_macros)
	ld	 r12,r13,lo16(_dump_macros)
	cmp	 r13,r12,3
	bb1	 ne,r13,@L1491
@L1492:
	ld	 r12,r22,20
	ld	 r13,r22,16
	subu	 r12,r11,r12
	subu	 r25,r24,r20
	subu	 r13,r13,r12
	cmp	 r13,r13,r25
	bb1.n	 gt,r13,@L1494
	or	 r2,r0,r22
	bsr.n	 _grow_outbuf
	or	 r3,r0,r25
@L1494:
	br.n	 @L1562
	or	 r2,r0,r20
	align	 4
@L1491:
	ld	 r13,r19,12
	cmp	 r13,r13,1
	bb1.n	 ne,r13,@L1575
	or	 r2,r0,r20
	cmp	 r13,r12,2
	bb1.n	 ne,r13,@L1575
	or.u	 r13,r0,hi16(_is_hor_space)
	ld.bu	 r12,r0,r20
	or	 r11,r13,lo16(_is_hor_space)
	ld.bu	 r13,r12,r11
	bcnd.n	 eq0,r13,@L1498
	or	 r3,r0,r20
	or	 r12,r0,r11
	addu	 r3,r3,1
@L1577:
	ld.bu	 r13,r0,r3
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L1577
	addu	 r3,r3,1
	subu	 r3,r3,1
@L1498:
	or	 r23,r0,r3
	or.u	 r13,r0,hi16(_is_idchar)
	ld.bu	 r12,r0,r23
	or	 r11,r13,lo16(_is_idchar)
	ld.bu	 r13,r12,r11
	bcnd.n	 eq0,r13,@L1506
	or	 r12,r0,r11
	addu	 r3,r3,1
@L1578:
	ld.bu	 r13,r0,r3
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L1578
	addu	 r3,r3,1
	subu	 r3,r3,1
@L1506:
	ld	 r13,r22,24
	ld	 r11,r22,20
	ld	 r12,r22,16
	subu	 r25,r3,r23
	subu	 r13,r13,r11
	addu	 r3,r25,1
	subu	 r12,r12,r13
	cmp	 r12,r12,r3
	bb1	 gt,r12,@L1510
	bsr.n	 _grow_outbuf
	or	 r2,r0,r22
@L1510:
	ld	 r12,r22,24
	addu	 r13,r12,1
	st	 r13,r22,24
	or	 r13,r0,32
	st.b	 r13,r0,r12
	or	 r2,r0,r23
@L1562:
	ld	 r3,r22,24
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r22,24
	addu	 r13,r13,r25
	st	 r13,r22,24
@L1487:
	or	 r2,r0,r20
@L1575:
	or	 r3,r0,r24
@L1576:
	or	 r4,r0,r22
	ld	 r13,r19,4
	jsr.n	 r13
	or	 r5,r0,r19
	ld	 r11,r22,24
	ld	 r9,r22,20
	ld	 r13,r22,16
	ld	 r12,r21,24
	ld	 r10,r21,20
	subu	 r11,r11,r9
	ld	 r9,r21,16
	subu	 r12,r12,r10
	subu	 r13,r13,r11
	subu	 r3,r9,r12
	cmp	 r13,r13,r3
	bb0.n	 le,r13,@L1514
	or	 r2,r0,1
	bsr.n	 _grow_outbuf
	or	 r2,r0,r22
	br.n	 @L1514
	or	 r2,r0,1
	align	 4
@L1346:
	addu	 r19,r19,20
	ld	 r13,r0,r19
	bcnd.n	 gt0,r13,@L1579
	cmp	 r13,r13,r25
@L1345:
	or	 r2,r0,0
@L1514:
@Lte5:
	subu	 r31,r30,80
	ld	 r1,r31,84
	ld	 r30,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	ld.d	 r14,r31,32
	jmp.n	 r1
	addu	 r31,r31,112
	def	 @L1586,@L1351-@L1587
	def	 @L1584,@L1345-@L1585
	def	 @L1582,@L1345-@L1583

	bss	 _timebuf.21,4,4
data
	align	 4
_monthnames:
	word	 @LC144
	word	 @LC145
	word	 @LC146
	word	 @LC147
	word	 @LC148
	word	 @LC149
	word	 @LC150
	word	 @LC151
	word	 @LC152
	word	 @LC153
	word	 @LC154
	word	 @LC155
	align	 8
@LC155:
	string	 "Dec\000"
	align	 8
@LC154:
	string	 "Nov\000"
	align	 8
@LC153:
	string	 "Oct\000"
	align	 8
@LC152:
	string	 "Sep\000"
	align	 8
@LC151:
	string	 "Aug\000"
	align	 8
@LC150:
	string	 "Jul\000"
	align	 8
@LC149:
	string	 "Jun\000"
	align	 8
@LC148:
	string	 "May\000"
	align	 8
@LC147:
	string	 "Apr\000"
	align	 8
@LC146:
	string	 "Mar\000"
	align	 8
@LC145:
	string	 "Feb\000"
	align	 8
@LC144:
	string	 "Jan\000"
	align	 8
@LC156:
	string	 "Predefined macro `%s' used inside `#if' during pr"
	string	 "ecompilation\000"
	align	 8
@LC157:
	string	 "cccp error: not in any file?!\000"
	align	 8
@LC158:
	string	 "\"%s\"\000"
	align	 8
@LC159:
	string	 "\"\"\000"
	align	 8
@LC160:
	string	 "%d\000"
	align	 8
@LC161:
	string	 "\"%s\"\000"
	align	 8
@LC162:
	string	 "%s\000"
	align	 8
@LC163:
	string	 "long unsigned int\000"
	align	 8
@LC164:
	string	 "%s\000"
	align	 8
@LC165:
	string	 "long int\000"
	align	 8
@LC166:
	string	 "%s\000"
	align	 8
@LC167:
	string	 "short unsigned int\000"
	align	 8
@LC168:
	string	 "%d\000"
	align	 8
@LC169:
	string	 "#define %s %d\n\000"
	align	 8
@LC170:
	string	 "%d\000"
	align	 8
@LC171:
	string	 "\"%s %2d %4d\"\000"
	align	 8
@LC172:
	string	 "\"%02d:%02d:%02d\"\000"
	align	 8
@LC173:
	string	 " 0 \000"
	align	 8
@LC174:
	string	 "#define %s\n\000"
	align	 8
@LC175:
	string	 " 1 \000"
	align	 8
@LC176:
	string	 "#undef \000"
	align	 8
@LC177:
	string	 "`defined' without an identifier\000"
	align	 8
@LC178:
	string	 "cccp error: invalid special hash type\000"
text
	align	 8
_special_symbol:
	or.u	 r13,r0,hi16(_pcp_outfile)
	ld	 r13,r13,lo16(_pcp_outfile)
	subu	 r31,r31,80
	st	 r30,r31,64
	addu	 r30,r31,64
	st.d	 r24,r31,56
	or	 r25,r0,r2
	st.d	 r20,r31,40
	or	 r20,r0,r3
	st	 r1,r31,68
	or	 r24,r0,0
	st	 r19,r31,36
	or	 r19,r0,0
	bcnd.n	 eq0,r13,@L1591
	st.d	 r22,r31,48
@Ltb6:
	or.u	 r13,r0,hi16(_pcp_inside_if)
	ld	 r13,r13,lo16(_pcp_inside_if)
	bcnd	 eq0,r13,@L1591
	ld	 r13,r25,12
	cmp	 r12,r13,33
	cmp	 r13,r13,30
	or	 r12,r12,r13
	extu	 r13,r12,1<eq>
	xor	 r12,r13,1
	bcnd	 eq0,r12,@L1591
	or.u	 r2,r0,hi16(@LC156)
	ld	 r3,r25,20
	bsr.n	 _error
	or	 r2,r2,lo16(@LC156)
@L1591:
	or.u	 r13,r0,hi16(_indepth)
	ld	 r8,r13,lo16(_indepth)
	bcnd.n	 lt0,r8,@L1593
	or.u	 r13,r0,hi16(_instack)
	mul	 r11,r8,44
	or	 r10,r13,lo16(_instack)
@L1595:
	or	 r12,r0,r11
	ld	 r13,r12,r10
	bcnd.n	 ne0,r13,@L1675
	subu	 r8,r8,1
	bcnd.n	 ge0,r8,@L1595
	subu	 r11,r12,44
@L1593:
	bcnd.n	 ne0,r24,@L1598
	or.u	 r2,r0,hi16(@LC157)
	or	 r2,r2,lo16(@LC157)
	bsr.n	 _error
	addu	 r1,r1,@L1705
@L1706:
	align	 4
@L1675:
	br.n	 @L1593
	addu	 r24,r11,r10
	align	 4
@L1598:
	ld	 r13,r25,12
	subu	 r11,r13,20
	or.u	 r13,r0,hi16(@L1671)
	cmp	 r12,r11,13
	bb0.n	 ls,r12,@L1670
	or	 r13,r13,lo16(@L1671)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L1671:
	word	 @L1619
	word	 @L1621
	word	 @L1601
	word	 @L1601
	word	 @L1606
	word	 @L1613
	word	 @L1614
	word	 @L1615
	word	 @L1616
	word	 @L1621
	word	 @L1617
	word	 @L1670
	word	 @L1670
	word	 @L1626
	align	 4
@L1601:
	ld	 r13,r25,12
	cmp	 r13,r13,22
	bb1.n	 ne,r13,@L1602
	or.u	 r13,r0,hi16(_instack+4)
	ld	 r25,r24,4
	br	 @L1603
	align	 4
@L1602:
	ld	 r25,r13,lo16(_instack+4)
@L1603:
	bcnd.n	 eq0,r25,@L1604
	or.u	 r13,r0,hi16(@LC159)
	bsr.n	 _strlen
	or	 r2,r0,r25
	addu	 r2,r2,18
	and	 r2,r2,0xfff0
	or	 r4,r0,r25
	subu	 r31,r31,r2
	or.u	 r3,r0,hi16(@LC158)
	addu	 r23,r31,32
	br.n	 @L1701
	or	 r3,r3,lo16(@LC158)
	align	 4
@L1604:
	br.n	 @L1599
	or	 r23,r13,lo16(@LC159)
	align	 4
@L1606:
	or.u	 r13,r0,hi16(_indepth)
	ld	 r8,r13,lo16(_indepth)
	bcnd.n	 lt0,r8,@L1608
	or	 r4,r0,0
	mul	 r9,r8,44
	or.u	 r13,r0,hi16(_instack)
	xor.c	 r12,r8,r0
	or	 r7,r13,lo16(_instack)
	bcnd.n	 lt0,r8,@L1683
	mask	 r12,r12,3
	bcnd.n	 eq0,r12,@L1610
	cmp	 r13,r12,3
	bb1.n	 ge,r13,@L1683
	cmp	 r13,r12,2
	bb1	 ge,r13,@L1684
	ld	 r13,r9,r7
	subu	 r9,r9,44
	cmp	 r13,r13,0
	subu	 r8,r8,1
	extu	 r4,r13,1<ne>
@L1684:
	ld	 r13,r9,r7
	cmp	 r13,r13,0
	subu	 r9,r9,44
	extu	 r13,r13,1<ne>
	subu	 r8,r8,1
	addu	 r4,r4,r13
@L1683:
	ld	 r13,r9,r7
	cmp	 r13,r13,0
	subu	 r9,r9,44
	extu	 r13,r13,1<ne>
	subu	 r8,r8,1
	bcnd.n	 lt0,r8,@L1608
	addu	 r4,r4,r13
@L1610:
	ld	 r13,r9,r7
	subu	 r12,r9,44
	subu	 r10,r9,132
	subu	 r8,r8,4
	cmp	 r13,r13,0
	ld	 r11,r12,r7
	extu	 r13,r13,1<ne>
	subu	 r12,r9,88
	addu	 r4,r4,r13
	ld	 r13,r12,r7
	cmp	 r11,r11,0
	ld	 r12,r10,r7
	extu	 r11,r11,1<ne>
	cmp	 r13,r13,0
	cmp	 r12,r12,0
	extu	 r13,r13,1<ne>
	addu	 r4,r4,r11
	extu	 r12,r12,1<ne>
	addu	 r4,r4,r13
	subu	 r9,r9,176
	bcnd.n	 ge0,r8,@L1610
	addu	 r4,r4,r12
@L1608:
	subu	 r31,r31,16
	subu	 r4,r4,1
	or.u	 r3,r0,hi16(@LC160)
	addu	 r23,r31,32
	br.n	 @L1701
	or	 r3,r3,lo16(@LC160)
	align	 4
@L1613:
	or.u	 r25,r0,hi16(_version_string)
	bsr.n	 _strlen
	ld	 r2,r25,lo16(_version_string)
	addu	 r2,r2,18
	and	 r2,r2,0xfff0
	ld	 r4,r25,lo16(_version_string)
	subu	 r31,r31,r2
	or.u	 r3,r0,hi16(@LC161)
	addu	 r23,r31,32
	br.n	 @L1701
	or	 r3,r3,lo16(@LC161)
	align	 4
@L1614:
	subu	 r31,r31,32
	or.u	 r3,r0,hi16(@LC162)
	or.u	 r4,r0,hi16(@LC163)
	addu	 r23,r31,32
	or	 r3,r3,lo16(@LC162)
	br.n	 @L1701
	or	 r4,r4,lo16(@LC163)
	align	 4
@L1615:
	subu	 r31,r31,16
	or.u	 r3,r0,hi16(@LC164)
	or.u	 r4,r0,hi16(@LC165)
	addu	 r23,r31,32
	or	 r3,r3,lo16(@LC164)
	br.n	 @L1701
	or	 r4,r4,lo16(@LC165)
	align	 4
@L1616:
	subu	 r31,r31,32
	or.u	 r3,r0,hi16(@LC166)
	or.u	 r4,r0,hi16(@LC167)
	addu	 r23,r31,32
	or	 r3,r3,lo16(@LC166)
	br.n	 @L1701
	or	 r4,r4,lo16(@LC167)
	align	 4
@L1617:
	ld	 r4,r25,24
	subu	 r31,r31,16
	or.u	 r3,r0,hi16(@LC168)
	addu	 r23,r31,32
	or	 r3,r3,lo16(@LC168)
	bsr.n	 _sprintf
	or	 r2,r0,r23
	or.u	 r13,r0,hi16(_pcp_inside_if)
	ld	 r13,r13,lo16(_pcp_inside_if)
	bcnd.n	 eq0,r13,@L1599
	or.u	 r13,r0,hi16(_pcp_outfile)
	ld	 r2,r13,lo16(_pcp_outfile)
	bcnd	 eq0,r2,@L1599
	ld	 r4,r25,20
	or.u	 r3,r0,hi16(@LC169)
	ld	 r5,r25,24
	or	 r3,r3,lo16(@LC169)
	bsr.n	 _fprintf
	addu	 r1,r1,@L1707
@L1708:
	align	 4
@L1619:
	ld	 r4,r24,12
	subu	 r31,r31,16
	or.u	 r3,r0,hi16(@LC170)
	addu	 r23,r31,32
	or	 r3,r3,lo16(@LC170)
@L1701:
	or	 r2,r0,r23
	bsr.n	 _sprintf
	addu	 r1,r1,@L1709
@L1710:
	align	 4
@L1621:
	or.u	 r24,r0,hi16(_timebuf.21)
	subu	 r31,r31,32
	ld	 r13,r24,lo16(_timebuf.21)
	bcnd.n	 ne0,r13,@L1623
	addu	 r23,r31,32
	bsr.n	 _time
	or	 r2,r0,0
	st	 r2,r30,8
	bsr.n	 _localtime
	addu	 r2,r30,8
	st	 r2,r24,lo16(_timebuf.21)
@L1623:
	ld	 r13,r25,12
	cmp	 r13,r13,21
	ld	 r6,r24,lo16(_timebuf.21)
	bb1.n	 ne,r13,@L1624
	or	 r2,r0,r23
	ld	 r5,r6,12
	or.u	 r3,r0,hi16(@LC171)
	ld	 r12,r6,16
	or.u	 r13,r0,hi16(_monthnames)
	ld	 r6,r6,20
	or	 r13,r13,lo16(_monthnames)
	or	 r3,r3,lo16(@LC171)
	ld	 r4,r13[r12]
	addu	 r6,r6,1900
	bsr.n	 _sprintf
	addu	 r1,r1,@L1711
@L1712:
	align	 4
@L1624:
	ld	 r4,r6,8
	ld	 r5,r6,4
	or.u	 r3,r0,hi16(@LC172)
	ld	 r6,r0,r6
	or	 r3,r3,lo16(@LC172)
	bsr.n	 _sprintf
	addu	 r1,r1,@L1713
@L1714:
	align	 4
@L1626:
	or.u	 r13,r0,hi16(_indepth)
	ld	 r12,r13,lo16(_indepth)
	mul	 r12,r12,44
	or.u	 r13,r0,hi16(_instack)
	or	 r13,r13,lo16(_instack)
	addu	 r24,r12,r13
	ld	 r11,r24,24
	or.u	 r13,r0,hi16(_is_hor_space)
	ld.bu	 r12,r0,r11
	or	 r10,r13,lo16(_is_hor_space)
	or.u	 r13,r0,hi16(@LC173)
	ld.bu	 r12,r12,r10
	bcnd.n	 eq0,r12,@L1628
	or	 r23,r13,lo16(@LC173)
@L1632:
	addu	 r12,r11,1
	or	 r13,r0,r11
	st	 r12,r24,24
	ld.bu	 r13,r13,1
	ld.bu	 r13,r13,r10
	bcnd.n	 ne0,r13,@L1632
	or	 r11,r0,r12
@L1628:
	ld	 r12,r24,24
	ld.bu	 r13,r0,r12
	cmp	 r13,r13,40
	bb0.n	 eq,r13,@L1635
	addu	 r13,r12,1
	st	 r13,r24,24
	or.u	 r13,r0,hi16(_is_hor_space)
	ld.bu	 r12,r12,1
	or	 r11,r13,lo16(_is_hor_space)
	ld.bu	 r13,r12,r11
	bcnd.n	 eq0,r13,@L1635
	addu	 r19,r19,1
@L1641:
	ld	 r12,r24,24
	addu	 r13,r12,1
	st	 r13,r24,24
	ld.bu	 r13,r12,1
	ld.bu	 r13,r13,r11
	bcnd	 ne0,r13,@L1641
@L1635:
	ld	 r2,r24,24
	or.u	 r13,r0,hi16(_is_idstart)
	ld.bu	 r12,r0,r2
	or	 r13,r13,lo16(_is_idstart)
	ld.bu	 r13,r12,r13
	bcnd.n	 eq0,r13,@L1645
	subu	 r3,r0,1
	bsr.n	 _lookup
	or	 r4,r0,r3
	or	 r25,r0,r2
	bcnd.n	 eq0,r25,@L1646
	or.u	 r13,r0,hi16(_pcp_outfile)
	ld	 r2,r13,lo16(_pcp_outfile)
	bcnd.n	 eq0,r2,@L1647
	or.u	 r13,r0,hi16(_pcp_inside_if)
	ld	 r13,r13,lo16(_pcp_inside_if)
	bcnd	 eq0,r13,@L1647
	ld	 r13,r25,24
	ld	 r13,r13,8
	bcnd.n	 eq0,r13,@L1647
	or.u	 r3,r0,hi16(@LC174)
	ld	 r4,r25,20
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC174)
@L1647:
	or.u	 r13,r0,hi16(@LC175)
	br.n	 @L1648
	or	 r23,r13,lo16(@LC175)
	align	 4
@L1646:
	or.u	 r22,r0,hi16(_pcp_outfile)
	ld	 r2,r22,lo16(_pcp_outfile)
	bcnd.n	 eq0,r2,@L1648
	or.u	 r13,r0,hi16(_pcp_inside_if)
	ld	 r13,r13,lo16(_pcp_inside_if)
	bcnd.n	 eq0,r13,@L1648
	or.u	 r3,r0,hi16(@LC176)
	ld	 r25,r24,24
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC176)
	ld.bu	 r2,r0,r25
	or.u	 r13,r0,hi16(_is_idchar)
	or	 r11,r13,lo16(_is_idchar)
	mask	 r12,r2,0xff
	ld.bu	 r13,r12,r11
	bcnd	 eq0,r13,@L1651
	or	 r21,r0,r22
	or	 r22,r0,r11
@L1652:
	ld	 r3,r21,lo16(_pcp_outfile)
	mask	 r2,r2,0xff
	bsr.n	 _fputc
	addu	 r25,r25,1
	ld.bu	 r2,r0,r25
	mask	 r13,r2,0xff
	ld.bu	 r13,r13,r22
	bcnd	 ne0,r13,@L1652
@L1651:
	or.u	 r13,r0,hi16(_pcp_outfile)
	ld	 r3,r13,lo16(_pcp_outfile)
	ld	 r13,r0,r3
	subu	 r13,r13,1
	bcnd.n	 ge0,r13,@L1654
	st	 r13,r0,r3
	or	 r2,r0,10
	bsr.n	 __flsbuf
	addu	 r1,r1,@L1715
@L1716:
	align	 4
@L1654:
	ld	 r13,r3,4
	addu	 r12,r13,1
	st	 r12,r3,4
	or	 r12,r0,10
	st.b	 r12,r0,r13
@L1648:
	ld	 r11,r24,24
	or.u	 r13,r0,hi16(_is_idchar)
	ld.bu	 r12,r0,r11
	or	 r10,r13,lo16(_is_idchar)
	ld.bu	 r13,r12,r10
	bcnd.n	 eq0,r13,@L1702
	or.u	 r13,r0,hi16(_is_hor_space)
@L1658:
	addu	 r12,r11,1
	or	 r13,r0,r11
	st	 r12,r24,24
	ld.bu	 r13,r13,1
	ld.bu	 r13,r13,r10
	bcnd.n	 ne0,r13,@L1658
	or	 r11,r0,r12
	ld	 r11,r24,24
	or.u	 r13,r0,hi16(_is_hor_space)
	ld.bu	 r12,r0,r11
@L1702:
	or	 r10,r13,lo16(_is_hor_space)
	ld.bu	 r13,r12,r10
	bcnd	 eq0,r13,@L1674
@L1665:
	addu	 r12,r11,1
	or	 r13,r0,r11
	st	 r12,r24,24
	ld.bu	 r13,r13,1
	ld.bu	 r13,r13,r10
	bcnd.n	 ne0,r13,@L1665
	or	 r11,r0,r12
@L1674:
	bcnd	 eq0,r19,@L1599
	ld	 r12,r24,24
	ld.bu	 r13,r0,r12
	cmp	 r13,r13,41
	bb1.n	 ne,r13,@L1703
	or.u	 r2,r0,hi16(@LC177)
	addu	 r13,r12,1
	br.n	 @L1599
	st	 r13,r24,24
	align	 4
@L1645:
	or.u	 r2,r0,hi16(@LC177)
@L1703:
	or	 r2,r2,lo16(@LC177)
	bsr.n	 _error
	addu	 r1,r1,@L1717
@L1718:
	align	 4
@L1670:
	or.u	 r2,r0,hi16(@LC178)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC178)
	bsr	 _abort
	align	 4
@L1599:
	bsr.n	 _strlen
	or	 r2,r0,r23
	ld	 r13,r20,24
	ld	 r11,r20,20
	ld	 r12,r20,16
	subu	 r13,r13,r11
	or	 r25,r0,r2
	subu	 r12,r12,r13
	cmp	 r12,r12,r25
	bb1.n	 gt,r12,@L1704
	or	 r2,r0,r23
	or	 r2,r0,r20
	bsr.n	 _grow_outbuf
	or	 r3,r0,r25
	or	 r2,r0,r23
@L1704:
	ld	 r3,r20,24
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r20,24
	addu	 r13,r13,r25
	st	 r13,r20,24
@L1590:
@Lte6:
	subu	 r31,r30,64
	ld	 r1,r31,68
	ld	 r30,r31,64
	ld	 r19,r31,36
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80
	def	 @L1717,@L1599-@L1718
	def	 @L1715,@L1648-@L1716
	def	 @L1713,@L1599-@L1714
	def	 @L1711,@L1599-@L1712
	def	 @L1709,@L1599-@L1710
	def	 @L1707,@L1599-@L1708
	def	 @L1705,@L1590-@L1706

data
	align	 4
_import_warning.26:
	word	 0
	align	 8
@LC179:
	string	 "using `#import' is not recommended\000"
	align	 8
@LC180:
	string	 "The fact that a certain header file need not be p"
	string	 "rocessed more than once\n\000"
	align	 8
@LC181:
	string	 "should be indicated in the header file, not where"
	string	 " it is used.\n\000"
	align	 8
@LC182:
	string	 "The best way to do this is with a conditional of "
	string	 "this form:\n\n\000"
	align	 8
@LC183:
	string	 "  #ifndef _FOO_H_INCLUDED\n\000"
	align	 8
@LC184:
	string	 "  #define _FOO_H_INCLUDED\n\000"
	align	 8
@LC185:
	string	 "  ... <real contents of file> ...\n\000"
	align	 8
@LC186:
	string	 "  #endif /* Not _FOO_H_INCLUDED */\n\n\000"
	align	 8
@LC187:
	string	 "Then users can use `#include' any number of times"
	string	 ".\n\000"
	align	 8
@LC188:
	string	 "GNU C automatically avoids processing the file mo"
	string	 "re than once\n\000"
	align	 8
@LC189:
	string	 "when it is equipped with such a conditional.\n\000"
	align	 8
@LC190:
	string	 "`#import' expects \"fname\" or <fname>\000"
	align	 8
@LC191:
	string	 "`#include' expects \"fname\" or <fname>\000"
	align	 8
@LC192:
	string	 "/\000"
	align	 8
@LC193:
	string	 "No include path in which to find %s\000"
	align	 8
@LC194:
	string	 "\000"
	align	 8
@LC195:
	string	 "/\000"
	align	 8
@LC196:
	string	 " \000"
	align	 8
@LC197:
	string	 "\000"
	align	 8
@LC198:
	string	 " \000"
	align	 8
@LC199:
	string	 "%s\n\000"
	align	 8
@LC200:
	string	 "%s%d\000"
text
	align	 8
_do_include:
	subu	 r31,r31,320
	st	 r1,r31,84
	st	 r30,r31,80
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	addu	 r30,r31,80
	st.d	 r20,r31,56
	or	 r21,r0,r2
	st.d	 r18,r31,48
	or	 r24,r0,r3
	st.d	 r16,r31,40
	or	 r20,r0,0
	st.d	 r14,r31,32
@Ltb7:
	or	 r15,r0,0
	ld	 r13,r5,12
	or	 r16,r0,0
	subu	 r19,r0,1
	st	 r4,r30,228
	cmp	 r12,r13,4
	cmp	 r13,r13,3
	extu	 r17,r12,1<eq>
	or.u	 r12,r0,hi16(_include)
	ld	 r18,r12,lo16(_include)
	bcnd.n	 eq0,r17,@L1721
	extu	 r14,r13,1<eq>
	or.u	 r13,r0,hi16(_warn_import)
	ld	 r13,r13,lo16(_warn_import)
	bcnd.n	 eq0,r13,@L1721
	or.u	 r13,r0,hi16(_inhibit_warnings)
	ld	 r13,r13,lo16(_inhibit_warnings)
	bcnd.n	 ne0,r13,@L1874
	or	 r22,r0,r21
	or.u	 r13,r0,hi16(_indepth)
	ld	 r12,r13,lo16(_indepth)
	mul	 r12,r12,44
	or.u	 r13,r0,hi16(_instack)
	or	 r13,r13,lo16(_instack)
	addu	 r12,r12,r13
	ld.b	 r13,r12,40
	bcnd.n	 ne0,r13,@L1875
	or.u	 r13,r0,hi16(_is_hor_space)
	or.u	 r12,r0,hi16(_import_warning.26)
	ld	 r13,r12,lo16(_import_warning.26)
	bcnd.n	 ne0,r13,@L1875
	or.u	 r13,r0,hi16(_is_hor_space)
	or.u	 r2,r0,hi16(@LC179)
	or	 r13,r0,1
	or	 r2,r2,lo16(@LC179)
	bsr.n	 _warning
	st	 r13,r12,lo16(_import_warning.26)
	or.u	 r25,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC180)
	or	 r25,r25,lo16(__iob+64)
	or	 r3,r3,lo16(@LC180)
	bsr.n	 _fprintf
	or	 r2,r0,r25
	or.u	 r3,r0,hi16(@LC181)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC181)
	or.u	 r3,r0,hi16(@LC182)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC182)
	or.u	 r3,r0,hi16(@LC183)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC183)
	or.u	 r3,r0,hi16(@LC184)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC184)
	or.u	 r3,r0,hi16(@LC185)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC185)
	or.u	 r3,r0,hi16(@LC186)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC186)
	or.u	 r3,r0,hi16(@LC187)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC187)
	or.u	 r3,r0,hi16(@LC188)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC188)
	or.u	 r3,r0,hi16(@LC189)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC189)
@L1721:
	or	 r22,r0,r21
@L1874:
	or.u	 r13,r0,hi16(_is_hor_space)
@L1875:
	ld.bu	 r12,r0,r22
	or	 r11,r13,lo16(_is_hor_space)
	ld.bu	 r13,r12,r11
	bcnd	 eq0,r13,@L1723
	or	 r12,r0,r11
	addu	 r22,r22,1
@L1876:
	ld.bu	 r13,r0,r22
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L1876
	addu	 r22,r22,1
	subu	 r22,r22,1
@L1723:
	cmp	 r13,r24,r22
	bb0.n	 ne,r13,@L1731
	or.u	 r13,r0,hi16(_is_hor_space)
	subu	 r11,r0,1
	or	 r12,r13,lo16(_is_hor_space)
@L1734:
	ld.bu	 r13,r24,r11
	ld.bu	 r13,r13,r12
	bcnd	 eq0,r13,@L1731
	subu	 r24,r24,1
	cmp	 r13,r24,r22
	bb1	 ne,r13,@L1734
@L1731:
	ld.bu	 r12,r0,r22
	cmp	 r13,r12,34
	bb0.n	 ne,r13,@L1736
	addu	 r22,r22,1
	cmp	 r13,r12,60
	bb0.n	 ne,r13,@L1765
	cmp	 r13,r22,r24
	br	 @L1753
	align	 4
@L1736:
	subu	 r13,r24,r22
	addu	 r13,r13,16
	and	 r13,r13,0xfff0
	subu	 r31,r31,r13
	or	 r12,r0,r22
	addu	 r22,r31,32
	cmp	 r13,r12,r24
	bb0.n	 ne,r13,@L1738
	or	 r23,r0,r22
	or.u	 r13,r0,hi16(_is_hor_space)
	or	 r10,r13,lo16(_is_hor_space)
@L1744:
	ld.bu	 r11,r0,r12
	mask	 r13,r11,0xff
	cmp	 r13,r13,34
	bb0	 ne,r13,@L1741
	addu	 r12,r12,1
	st.b	 r11,r0,r23
	cmp	 r13,r12,r24
	bb1.n	 ne,r13,@L1744
	addu	 r23,r23,1
@L1741:
	addu	 r12,r12,1
	cmp	 r13,r12,r24
	bb0.n	 ne,r13,@L1877
	or.u	 r13,r0,hi16(_ignore_srcdir)
@L1750:
	ld.bu	 r13,r0,r12
	ld.bu	 r13,r13,r10
	bcnd	 eq0,r13,@L1747
	addu	 r12,r12,1
	cmp	 r13,r12,r24
	bb1	 ne,r13,@L1750
@L1747:
	cmp	 r13,r12,r24
	bb0	 ne,r13,@L1753
	ld.bu	 r13,r0,r12
	cmp	 r13,r13,34
	bb1.n	 ne,r13,@L1753
	addu	 r12,r12,1
	cmp	 r13,r12,r24
	bb1	 ne,r13,@L1744
@L1738:
	or.u	 r13,r0,hi16(_ignore_srcdir)
@L1877:
	st.b	 r0,r0,r23
	ld	 r13,r13,lo16(_ignore_srcdir)
	bcnd.n	 ne0,r13,@L1735
	addu	 r23,r23,1
	or.u	 r13,r0,hi16(_indepth)
	ld	 r13,r13,lo16(_indepth)
	mul	 r13,r13,44
	or.u	 r12,r0,hi16(_instack)
	or	 r12,r12,lo16(_instack)
	addu	 r11,r13,r12
	cmp	 r13,r11,r12
	bb1.n	 lo,r13,@L1735
	or.u	 r21,r0,hi16(_max_include_len)
@L1759:
	ld	 r24,r11,4
	bcnd.n	 eq0,r24,@L1758
	subu	 r11,r11,44
	st	 r18,r30,8
	or	 r2,r0,r24
	or	 r3,r0,47
	bsr.n	 _rindex
	addu	 r18,r30,8
	bcnd.n	 eq0,r2,@L1761
	subu	 r25,r2,r24
	addu	 r13,r25,16
	and	 r13,r13,0xfff0
	subu	 r31,r31,r13
	or	 r3,r0,r24
	addu	 r2,r31,32
	or	 r4,r0,r25
	bsr.n	 _strncpy
	st	 r2,r30,12
	ld	 r13,r30,12
	st.b	 r0,r13,r25
	ld	 r13,r21,lo16(_max_include_len)
	cmp	 r13,r25,r13
	bb0	 gt,r13,@L1735
	st	 r25,r21,lo16(_max_include_len)
	br	 @L1735
	align	 4
@L1761:
	br.n	 @L1735
	st	 r0,r30,12
	align	 4
@L1758:
	cmp	 r13,r11,r12
	bb1	 lo,r13,@L1735
	br	 @L1759
	align	 4
@L1765:
	bb0.n	 ne,r13,@L1767
	or	 r23,r0,r22
@L1770:
	ld.bu	 r13,r0,r23
	cmp	 r13,r13,62
	bb0	 ne,r13,@L1853
	addu	 r23,r23,1
	cmp	 r13,r23,r24
	bb1	 ne,r13,@L1770
@L1767:
	ld.bu	 r13,r0,r23
	cmp	 r13,r13,62
	bb1	 ne,r13,@L1753
@L1853:
	addu	 r13,r23,1
	cmp	 r13,r13,r24
	bb1.n	 ne,r13,@L1753
	or.u	 r13,r0,hi16(_first_bracket_include)
	ld	 r13,r13,lo16(_first_bracket_include)
	bcnd.n	 eq0,r13,@L1735
	or	 r16,r0,1
	br.n	 @L1735
	or	 r18,r0,r13
	align	 4
@L1753:
	bcnd.n	 eq0,r15,@L1774
	or	 r2,r0,r21
	bcnd.n	 eq0,r17,@L1775
	or.u	 r2,r0,hi16(@LC190)
	br.n	 @L1871
	or	 r2,r2,lo16(@LC190)
	align	 4
@L1775:
	or.u	 r2,r0,hi16(@LC191)
	or	 r2,r2,lo16(@LC191)
@L1871:
	bsr.n	 _error
	addu	 r1,r1,@L1885
@L1886:
	align	 4
@L1774:
	or	 r3,r0,r24
	or	 r4,r0,0
	or	 r5,r0,0
	bsr.n	 _expand_to_temp_buffer
	addu	 r12,r30,24
	ld	 r4,r30,48
	ld	 r2,r30,44
	subu	 r4,r4,r2
	addu	 r13,r4,16
	and	 r13,r13,0xfff0
	subu	 r31,r31,r13
	addu	 r21,r31,32
	bsr.n	 _bcopy
	or	 r3,r0,r21
	ld	 r13,r30,48
	ld	 r2,r30,44
	subu	 r13,r13,r2
	or	 r15,r0,1
	addu	 r24,r21,r13
	bsr.n	 _free
	subu	 r1,r1,@L1887
@L1888:
	align	 4
@L1735:
	bcnd.n	 eq0,r14,@L1779
	or.u	 r13,r0,hi16(_indepth)
	ld	 r13,r13,lo16(_indepth)
	mul	 r13,r13,44
	or.u	 r12,r0,hi16(_instack)
	or	 r12,r12,lo16(_instack)
	addu	 r11,r13,r12
	cmp	 r13,r11,r12
	bb1.n	 lo,r13,@L1878
	or.u	 r13,r0,hi16(_max_include_len)
@L1783:
	ld	 r13,r0,r11
	bcnd	 eq0,r13,@L1782
	ld	 r13,r11,8
	bcnd	 eq0,r13,@L1779
	ld	 r18,r0,r13
	br.n	 @L1878
	or.u	 r13,r0,hi16(_max_include_len)
	align	 4
@L1782:
	subu	 r11,r11,44
	cmp	 r13,r11,r12
	bb1	 hs,r13,@L1783
@L1779:
	or.u	 r13,r0,hi16(_max_include_len)
@L1878:
	ld	 r2,r13,lo16(_max_include_len)
	subu	 r25,r23,r22
	addu	 r2,r2,r25
	bsr.n	 _xmalloc
	addu	 r2,r2,2
	ld.bu	 r13,r0,r22
	cmp	 r13,r13,47
	bb1.n	 ne,r13,@L1787
	or	 r24,r0,r2
	or	 r3,r0,r22
	bsr.n	 _strncpy
	or	 r4,r0,r25
	or	 r2,r0,r24
	bsr.n	 _redundant_include_p
	st.b	 r0,r24,r25
	bcnd	 ne0,r2,@L1820
	bcnd.n	 eq0,r17,@L1789
	or	 r2,r0,r24
	bsr.n	 _lookup_import
	addu	 r1,r1,@L1889
@L1890:
	align	 4
@L1789:
	or	 r3,r0,0
	bsr.n	 _open
	or	 r4,r0,438
@L1872:
	or	 r19,r0,r2
	addu	 r13,r19,2
	bcnd.n	 ne0,r13,@L1792
	or	 r2,r0,0
	br	 @L1879
	align	 4
@L1787:
	or	 r20,r0,r18
	bcnd	 eq0,r20,@L1792
@L1796:
	ld	 r3,r20,4
	bcnd	 eq0,r3,@L1797
	ld.b	 r13,r0,r3
	bcnd	 eq0,r13,@L1795
	bsr.n	 _strcpy
	or	 r2,r0,r24
	or.u	 r3,r0,hi16(@LC192)
	or	 r2,r0,r24
	bsr.n	 _strcat
	or	 r3,r3,lo16(@LC192)
	bsr.n	 _strlen
	or	 r2,r0,r24
	addu	 r2,r2,r25
	br.n	 @L1799
	st.b	 r0,r24,r2
	align	 4
@L1797:
	st.b	 r0,r0,r24
@L1799:
	or	 r2,r0,r24
	or	 r3,r0,r22
	bsr.n	 _strncat
	or	 r4,r0,r25
	bcnd.n	 eq0,r17,@L1800
	or	 r2,r0,r24
	bsr.n	 _lookup_import
	addu	 r1,r1,@L1891
@L1892:
	align	 4
@L1800:
	or	 r3,r0,0
	bsr.n	 _open
	or	 r4,r0,438
@L1873:
	or	 r19,r0,r2
	addu	 r13,r19,2
	bcnd.n	 eq0,r13,@L1879
	or	 r2,r0,0
	bsr.n	 _redundant_include_p
	or	 r2,r0,r24
	bcnd	 ne0,r2,@L1856
	bcnd.n	 ge0,r19,@L1880
	or.u	 r13,r0,hi16(_dont_repeat_files)
@L1795:
	ld	 r20,r0,r20
	bcnd	 ne0,r20,@L1796
@L1792:
	bcnd.n	 ge0,r19,@L1806
	or.u	 r13,r0,hi16(_dont_repeat_files)
	or	 r2,r0,r24
	or	 r3,r0,r22
	bsr.n	 _strncpy
	or	 r4,r0,r25
	bcnd.n	 eq0,r18,@L1807
	st.b	 r0,r24,r25
	or	 r2,r0,r24
	bsr.n	 _error_from_errno
	addu	 r1,r1,@L1893
@L1894:
	align	 4
@L1857:
	bsr.n	 _deps_output
	or	 r3,r0,0
	or.u	 r2,r0,hi16(@LC195)
	or	 r3,r0,0
	or	 r2,r2,lo16(@LC195)
	bsr.n	 _deps_output
	addu	 r1,r1,@L1895
@L1896:
	align	 4
@L1807:
	or.u	 r2,r0,hi16(@LC193)
	or	 r3,r0,r24
	bsr.n	 _error
	or	 r2,r2,lo16(@LC193)
@L1808:
	or.u	 r13,r0,hi16(_print_deps)
	or	 r12,r0,0
	bcnd.n	 ne0,r16,@L1811
	or	 r11,r13,lo16(_print_deps)
	or.u	 r13,r0,hi16(_system_include_depth)
	ld	 r13,r13,lo16(_system_include_depth)
	bcnd	 le0,r13,@L1810
@L1811:
	or	 r12,r0,1
@L1810:
	ld	 r13,r0,r11
	cmp	 r13,r13,r12
	bb0.n	 gt,r13,@L1820
	or.u	 r2,r0,hi16(@LC194)
	or	 r3,r0,0
	bsr.n	 _deps_output
	or	 r2,r2,lo16(@LC194)
	bcnd.n	 eq0,r16,@L1812
	or	 r20,r0,r18
	bcnd.n	 eq0,r20,@L1881
	or	 r2,r0,r22
@L1816:
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L1815
	ld.b	 r13,r0,r2
	bcnd	 ne0,r13,@L1857
@L1815:
	ld	 r20,r0,r20
	bcnd	 ne0,r20,@L1816
@L1812:
	or	 r2,r0,r22
@L1881:
	bsr.n	 _deps_output
	or	 r3,r0,r25
	or.u	 r2,r0,hi16(@LC196)
	or	 r3,r0,0
	or	 r2,r2,lo16(@LC196)
	bsr.n	 _deps_output
	addu	 r1,r1,@L1897
@L1898:
	align	 4
@L1806:
@L1880:
	ld	 r25,r13,lo16(_dont_repeat_files)
	bcnd.n	 eq0,r25,@L1882
	or.u	 r13,r0,hi16(_all_include_files)
@L1824:
	ld	 r2,r25,4
	bsr.n	 _strcmp
	or	 r3,r0,r24
	bcnd	 eq0,r2,@L1856
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L1824
	or.u	 r13,r0,hi16(_all_include_files)
@L1882:
	ld	 r25,r13,lo16(_all_include_files)
	bcnd	 eq0,r25,@L1854
@L1830:
	ld	 r2,r25,4
	bsr.n	 _strcmp
	or	 r3,r0,r24
	bcnd	 eq0,r2,@L1828
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L1830
@L1828:
	bcnd.n	 ne0,r25,@L1883
	or.u	 r13,r0,hi16(_print_include_names)
@L1854:
	bsr.n	 _xmalloc
	or	 r2,r0,12
	or.u	 r12,r0,hi16(_all_include_files)
	ld	 r13,r12,lo16(_all_include_files)
	or	 r25,r0,r2
	st	 r0,r25,8
	st	 r13,r0,r25
	or	 r2,r0,r24
	bsr.n	 _savestring
	st	 r25,r12,lo16(_all_include_files)
	or	 r12,r0,0
	or.u	 r13,r0,hi16(_print_deps)
	st	 r2,r25,4
	bcnd.n	 ne0,r16,@L1836
	or	 r11,r13,lo16(_print_deps)
	or.u	 r13,r0,hi16(_system_include_depth)
	ld	 r13,r13,lo16(_system_include_depth)
	bcnd	 le0,r13,@L1835
@L1836:
	or	 r12,r0,1
@L1835:
	ld	 r13,r0,r11
	cmp	 r13,r13,r12
	bb0	 gt,r13,@L1833
	or.u	 r2,r0,hi16(@LC197)
	or	 r3,r0,0
	bsr.n	 _deps_output
	or	 r2,r2,lo16(@LC197)
	or	 r2,r0,r24
	bsr.n	 _deps_output
	or	 r3,r0,0
	or.u	 r2,r0,hi16(@LC198)
	or	 r3,r0,0
	bsr.n	 _deps_output
	or	 r2,r2,lo16(@LC198)
@L1833:
	or.u	 r13,r0,hi16(_print_include_names)
@L1883:
	ld	 r13,r13,lo16(_print_include_names)
	bcnd.n	 eq0,r13,@L1837
	or	 r4,r0,r24
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC199)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC199)
@L1837:
	bcnd.n	 eq0,r16,@L1838
	or.u	 r12,r0,hi16(_system_include_depth)
	ld	 r13,r12,lo16(_system_include_depth)
	addu	 r13,r13,1
	st	 r13,r12,lo16(_system_include_depth)
@L1838:
	or	 r2,r0,r19
	bsr.n	 _add_import
	or	 r3,r0,r24
	bsr.n	 _strlen
	or	 r2,r0,r24
	addu	 r13,r2,45
	and	 r13,r13,0xfff0
	or	 r2,r0,r19
	subu	 r31,r31,r13
	addu	 r3,r30,72
	bsr.n	 _fstat
	addu	 r21,r31,32
	or.u	 r13,r0,hi16(_no_precomp)
	ld	 r13,r13,lo16(_no_precomp)
	or	 r22,r0,0
	bcnd.n	 ne0,r13,@L1839
	or	 r23,r0,0
	or	 r2,r0,r21
@L1884:
	or	 r4,r0,r24
	or.u	 r3,r0,hi16(@LC200)
	or	 r5,r0,r23
	bsr.n	 _sprintf
	or	 r3,r3,lo16(@LC200)
	or	 r2,r0,r21
	or	 r3,r0,0
	bsr.n	 _open
	or	 r4,r0,438
	or	 r25,r0,r2
	addu	 r13,r25,1
	bcnd.n	 eq0,r13,@L1842
	addu	 r23,r23,1
	bsr.n	 _fstat
	addu	 r3,r30,144
	addu	 r2,r30,76
	addu	 r3,r30,148
	bsr.n	 _bcmp
	or	 r4,r0,4
	bcnd	 ne0,r2,@L1845
	ld	 r13,r30,72
	ld	 r12,r30,144
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L1844
	or	 r2,r0,r25
@L1845:
	or	 r2,r0,r25
	or	 r3,r0,r24
	bsr.n	 _check_precompiled
	addu	 r4,r30,216
	or	 r22,r0,r2
	or	 r2,r0,r25
	bsr.n	 _close
	addu	 r1,r1,@L1899
@L1900:
	align	 4
@L1844:
	bsr.n	 _close
	addu	 r1,r1,@L1901
@L1902:
	align	 4
@L1842:
	subu	 r13,r0,1
	cmp	 r12,r22,0
	cmp	 r13,r25,r13
	and.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L1884
	or	 r2,r0,r21
@L1839:
	bcnd	 eq0,r22,@L1848
	bsr.n	 _strlen
	or	 r2,r0,r21
	bsr.n	 _xmalloc
	addu	 r2,r2,1
	bsr.n	 _strcpy
	or	 r3,r0,r21
	ld	 r3,r30,216
	ld	 r5,r30,228
	or	 r2,r0,r22
	or	 r4,r0,r24
	bsr.n	 _pcfinclude
	addu	 r1,r1,@L1903
@L1904:
	align	 4
@L1856:
	or	 r2,r0,r19
	bsr.n	 _close
	addu	 r1,r1,@L1905
@L1906:
	align	 4
@L1848:
	bsr.n	 _is_system_include
	or	 r2,r0,r24
	ld	 r4,r30,228
	or	 r5,r0,r2
	or	 r2,r0,r19
	or	 r3,r0,r24
	bsr.n	 _finclude
	or	 r6,r0,r20
@L1849:
	bcnd.n	 eq0,r16,@L1820
	or.u	 r12,r0,hi16(_system_include_depth)
	ld	 r13,r12,lo16(_system_include_depth)
	subu	 r13,r13,1
	st	 r13,r12,lo16(_system_include_depth)
@L1820:
	or	 r2,r0,0
@L1879:
@Lte7:
	subu	 r31,r30,80
	ld	 r1,r31,84
	ld	 r30,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	ld.d	 r14,r31,32
	jmp.n	 r1
	addu	 r31,r31,320
	def	 @L1905,@L1820-@L1906
	def	 @L1903,@L1849-@L1904
	def	 @L1901,@L1839-@L1902
	def	 @L1899,@L1842-@L1900
	def	 @L1897,@L1820-@L1898
	def	 @L1895,@L1812-@L1896
	def	 @L1893,@L1808-@L1894
	def	 @L1891,@L1873-@L1892
	def	 @L1889,@L1872-@L1890
	def	 @L1887,@L1888-@L1721
	def	 @L1885,@L1820-@L1886

	align	 8
_redundant_include_p:
	subu	 r31,r31,64
	or.u	 r13,r0,hi16(_all_include_files)
	st.d	 r24,r31,40
	ld	 r25,r13,lo16(_all_include_files)
	or	 r24,r0,r2
	bcnd.n	 eq0,r25,@L1916
	st	 r1,r31,48
@Ltb8:
@L1918:
	ld	 r3,r25,4
	bsr.n	 _strcmp
	or	 r2,r0,r24
	bcnd	 ne0,r2,@L1917
	ld	 r2,r25,8
	bcnd.n	 eq0,r2,@L1917
	subu	 r3,r0,1
	bsr.n	 _lookup
	or	 r4,r0,r3
	bcnd.n	 ne0,r2,@L1921
	or	 r2,r0,1
@L1917:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L1918
@L1916:
	or	 r2,r0,0
@L1921:
@Lte8:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
_is_system_include:
	subu	 r31,r31,64
	or.u	 r13,r0,hi16(_first_system_include)
	st.d	 r24,r31,40
	ld	 r24,r13,lo16(_first_system_include)
	st.d	 r22,r31,32
	or	 r22,r0,r2
	bcnd.n	 eq0,r24,@L1933
	st	 r1,r31,48
@Ltb9:
@L1935:
	ld	 r25,r24,4
	bcnd	 eq0,r25,@L1934
	bsr.n	 _strlen
	or	 r2,r0,r25
	or	 r23,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,r22
	bsr.n	 _strncmp
	or	 r4,r0,r23
	bcnd	 ne0,r2,@L1934
	ld.b	 r13,r22,r23
	cmp	 r13,r13,47
	bb0.n	 ne,r13,@L1939
	or	 r2,r0,1
@L1934:
	ld	 r24,r0,r24
	bcnd	 ne0,r24,@L1935
@L1933:
	or	 r2,r0,0
@L1939:
@Lte9:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	ld.d	 r22,r31,32
	jmp.n	 r1
	addu	 r31,r31,64

data
	align	 8
@LC201:
	string	 "macro or `#include' recursion too deep\000"
	align	 8
@LC202:
	string	 "file does not end in newline\000"
text
	align	 8
_finclude:
	subu	 r31,r31,80
	st.d	 r22,r31,48
	or	 r22,r0,r2
	st.d	 r20,r31,40
	or	 r21,r0,r3
	st.d	 r18,r31,32
	or	 r19,r0,r4
	st.d	 r24,r31,56
	or.u	 r25,r0,hi16(_indepth)
	or	 r24,r0,r5
	ld	 r12,r25,lo16(_indepth)
	or	 r23,r0,r6
	or	 r18,r0,0
	cmp	 r13,r12,198
	bb0.n	 gt,r13,@L1986
	st	 r1,r31,64
@Ltb10:
	mul	 r13,r12,44
	or.u	 r12,r0,hi16(_instack)
	or	 r12,r12,lo16(_instack)
	addu	 r13,r13,r12
	bsr.n	 _line_for_error
	ld	 r2,r13,12
	or.u	 r3,r0,hi16(@LC201)
	or	 r3,r3,lo16(@LC201)
	bsr.n	 _error_with_line
	addu	 r1,r1,@L2032
@L2033:
	align	 4
@L1986:
	or	 r2,r0,r22
	addu	 r3,r31,72
	bsr.n	 _file_size_and_mode
	addu	 r4,r31,76
	bcnd.n	 ge0,r2,@L1987
	or.u	 r13,r0,hi16(_instack+44)
	bsr.n	 _perror_with_name
	or	 r2,r0,r21
	or	 r2,r0,r22
	bsr.n	 _close
	addu	 r1,r1,@L2034
@L2035:
	align	 4
@L1987:
	ld	 r12,r25,lo16(_indepth)
	mul	 r12,r12,44
	or	 r13,r13,lo16(_instack+44)
	addu	 r20,r12,r13
	or	 r3,r0,44
	bsr.n	 _bzero
	or	 r2,r0,r20
	or.u	 r13,r0,hi16(_if_stack)
	ld	 r11,r13,lo16(_if_stack)
	st.b	 r24,r20,40
	ld	 r12,r31,72
	st	 r21,r0,r20
	st	 r21,r20,4
	st	 r0,r20,16
	or	 r13,r0,1
	st	 r13,r20,12
	mask	 r12,r12,61440
	st	 r23,r20,8
	cmp	 r12,r12,32768
	bb1.n	 ne,r12,@L1988
	st	 r11,r20,32
	ld	 r2,r31,76
	bsr.n	 _xmalloc
	addu	 r2,r2,2
	ld	 r4,r31,76
	st	 r2,r20,20
	bcnd.n	 le0,r4,@L1996
	st	 r2,r20,24
@L1991:
	ld	 r13,r20,20
	ld	 r3,r20,16
	or	 r2,r0,r22
	bsr.n	 _read
	addu	 r3,r13,r3
	bcnd	 gt0,r2,@L1992
	bcnd	 eq0,r2,@L1996
	br	 @L1994
	align	 4
@L1992:
	ld	 r13,r20,16
	ld	 r12,r31,76
	addu	 r13,r13,r2
	st	 r13,r20,16
	subu	 r12,r12,r2
	st	 r12,r31,76
	bcnd.n	 gt0,r12,@L1991
	or	 r4,r0,r12
	br	 @L1996
	align	 4
@L1988:
	st	 r0,r31,76
	or	 r2,r0,2002
	bsr.n	 _xmalloc
	or	 r23,r0,2000
	or	 r24,r0,r2
	st	 r24,r20,20
	or	 r25,r0,r24
@L1997:
	ld	 r4,r31,76
	or	 r2,r0,r22
	or	 r3,r0,r25
	bsr.n	 _read
	subu	 r4,r23,r4
	bcnd	 lt0,r2,@L1994
	bcnd.n	 eq0,r2,@L1998
	addu	 r25,r25,r2
	ld	 r13,r31,76
	addu	 r13,r13,r2
	cmp	 r12,r23,r13
	bb1.n	 ne,r12,@L1997
	st	 r13,r31,76
	mak	 r23,r23,0<1>
	or	 r2,r0,r24
	bsr.n	 _xrealloc
	addu	 r3,r23,2
	ld	 r13,r31,76
	or	 r24,r0,r2
	st	 r24,r20,20
	br.n	 @L1997
	addu	 r25,r24,r13
	align	 4
@L1998:
	ld	 r13,r20,20
	ld	 r12,r31,76
	st	 r13,r20,24
	st	 r12,r20,16
@L1996:
	bsr.n	 _close
	or	 r2,r0,r22
	or.u	 r10,r0,hi16(_indepth)
	or.u	 r9,r0,hi16(_input_file_stack_tick)
	ld	 r13,r10,lo16(_indepth)
	or.u	 r11,r0,hi16(_no_trigraphs)
	ld	 r12,r9,lo16(_input_file_stack_tick)
	ld	 r11,r11,lo16(_no_trigraphs)
	addu	 r13,r13,1
	st	 r13,r10,lo16(_indepth)
	addu	 r12,r12,1
	bcnd.n	 ne0,r11,@L2003
	st	 r12,r9,lo16(_input_file_stack_tick)
	ld	 r22,r20,20
	or	 r24,r0,r22
	or	 r21,r0,r22
@L2005:
	or	 r2,r0,r24
	bsr.n	 _index
	or	 r3,r0,63
	or	 r24,r0,r2
	bcnd.n	 eq0,r24,@L2006
	addu	 r24,r24,1
	ld.bu	 r13,r0,r24
	cmp	 r13,r13,63
	bb1	 ne,r13,@L2005
	addu	 r24,r24,1
	ld.bu	 r13,r0,r24
	subu	 r11,r13,33
	or.u	 r13,r0,hi16(@L2021)
	cmp	 r12,r11,30
	bb1.n	 hi,r12,@L2005
	or	 r13,r13,lo16(@L2021)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L2021:
	word	 @L2016
	word	 @L2005
	word	 @L2005
	word	 @L2005
	word	 @L2005
	word	 @L2005
	word	 @L2014
	word	 @L2011
	word	 @L2013
	word	 @L2005
	word	 @L2005
	word	 @L2005
	word	 @L2018
	word	 @L2005
	word	 @L2012
	word	 @L2005
	word	 @L2005
	word	 @L2005
	word	 @L2005
	word	 @L2005
	word	 @L2005
	word	 @L2005
	word	 @L2005
	word	 @L2005
	word	 @L2005
	word	 @L2005
	word	 @L2005
	word	 @L2015
	word	 @L2010
	word	 @L2017
	word	 @L2019
	align	 4
@L2010:
	br.n	 @L2009
	or	 r25,r0,35
	align	 4
@L2011:
	br.n	 @L2009
	or	 r25,r0,91
	align	 4
@L2012:
	br.n	 @L2009
	or	 r25,r0,92
	align	 4
@L2013:
	br.n	 @L2009
	or	 r25,r0,93
	align	 4
@L2014:
	br.n	 @L2009
	or	 r25,r0,94
	align	 4
@L2015:
	br.n	 @L2009
	or	 r25,r0,123
	align	 4
@L2016:
	br.n	 @L2009
	or	 r25,r0,124
	align	 4
@L2017:
	br.n	 @L2009
	or	 r25,r0,125
	align	 4
@L2018:
	br.n	 @L2009
	or	 r25,r0,126
	align	 4
@L2019:
	br.n	 @L2005
	subu	 r24,r24,1
	align	 4
@L2009:
	subu	 r13,r24,r21
	subu	 r23,r13,2
	cmp	 r13,r22,r21
	cmp	 r12,r23,0
	rot	 r11,r13,30
	and.c	 r13,r12,r11
	extu	 r13,r13,1<gt>
	bcnd.n	 eq0,r13,@L2022
	or	 r2,r0,r21
	or	 r3,r0,r22
	bsr.n	 _bcopy
	or	 r4,r0,r23
@L2022:
	addu	 r22,r22,r23
	addu	 r21,r24,1
	st.b	 r25,r0,r22
	addu	 r22,r22,1
	br.n	 @L2005
	or	 r24,r0,r21
	align	 4
@L2006:
	ld	 r13,r20,20
	ld	 r12,r20,16
	subu	 r13,r21,r13
	subu	 r23,r12,r13
	cmp	 r13,r22,r21
	cmp	 r12,r23,0
	rot	 r11,r13,30
	and.c	 r13,r12,r11
	extu	 r13,r13,1<gt>
	bcnd.n	 eq0,r13,@L2023
	or	 r2,r0,r21
	or	 r3,r0,r22
	bsr.n	 _bcopy
	or	 r4,r0,r23
@L2023:
	ld	 r13,r20,16
	subu	 r11,r21,r22
	ld	 r12,r20,20
	subu	 r13,r13,r11
	st	 r13,r20,16
	st.b	 r0,r12,r13
	or.u	 r13,r0,hi16(_warn_trigraphs)
	ld	 r13,r13,lo16(_warn_trigraphs)
	cmp	 r12,r21,r22
	cmp	 r13,r13,0
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd	 eq0,r13,@L2003
	extu	 r3,r11,0<31>
	or.u	 r2,r0,hi16(@LC110)
	addu	 r3,r11,r3
	or	 r2,r2,lo16(@LC110)
	bsr.n	 _warning
	ext	 r3,r3,0<1>
@L2003:
	ld	 r11,r20,16
	bcnd	 le0,r11,@L2027
	ld	 r13,r20,20
	subu	 r12,r0,1
	addu	 r13,r11,r13
	ld.bu	 r13,r13,r12
	cmp	 r13,r13,10
	bb1	 ne,r13,@L2026
@L2027:
	cmp	 r13,r11,1
	bb0	 gt,r13,@L2025
	ld	 r13,r20,20
	subu	 r12,r0,2
	addu	 r13,r11,r13
	ld.bu	 r13,r13,r12
	cmp	 r13,r13,92
	bb1	 ne,r13,@L2025
@L2026:
	ld	 r12,r20,16
	ld	 r11,r20,20
	or	 r18,r0,1
	addu	 r13,r12,1
	st	 r13,r20,16
	or	 r13,r0,10
	st.b	 r13,r11,r12
@L2025:
	ld	 r12,r20,20
	ld	 r13,r20,16
	or	 r2,r0,r20
	or	 r3,r0,r19
	or	 r4,r0,0
	or	 r5,r0,1
	bsr.n	 _output_line_command
	st.b	 r0,r12,r13
	or	 r2,r0,r19
	bsr.n	 _rescan
	or	 r3,r0,0
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	subu	 r12,r0,r18
	cmp	 r13,r13,0
	subu	 r12,r0,r12
	extu	 r13,r13,1<ne>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L2028
	or.u	 r2,r0,hi16(@LC202)
	bsr.n	 _pedwarn
	or	 r2,r2,lo16(@LC202)
@L2028:
	or.u	 r9,r0,hi16(_indepth)
	or	 r3,r0,r19
	or	 r4,r0,0
	ld	 r12,r9,lo16(_indepth)
	or.u	 r11,r0,hi16(_input_file_stack_tick)
	or.u	 r2,r0,hi16(_instack)
	subu	 r12,r12,1
	ld	 r13,r11,lo16(_input_file_stack_tick)
	mul	 r10,r12,44
	or	 r5,r0,2
	or	 r2,r2,lo16(_instack)
	st	 r12,r9,lo16(_indepth)
	addu	 r13,r13,1
	addu	 r2,r10,r2
	st	 r13,r11,lo16(_input_file_stack_tick)
	bsr.n	 _output_line_command
	addu	 r1,r1,@L2036
@L2037:
	align	 4
@L1994:
	bsr.n	 _perror_with_name
	or	 r2,r0,r21
	bsr.n	 _close
	or	 r2,r0,r22
@L2031:
	bsr.n	 _free
	ld	 r2,r20,20
@L1985:
@Lte10:
	ld	 r1,r31,64
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	ld.d	 r18,r31,32
	jmp.n	 r1
	addu	 r31,r31,80
	def	 @L2036,@L2031-@L2037
	def	 @L2034,@L1985-@L2035
	def	 @L2032,@L1985-@L2033

	align	 8
_lookup_import:
	subu	 r31,r31,128
	st	 r1,r31,48
	st.d	 r24,r31,40
	or	 r24,r0,r2
	st.d	 r22,r31,32
@Ltb11:
	ld.b	 r13,r0,r24
	or	 r10,r0,0
	bcnd.n	 eq0,r13,@L2079
	or	 r11,r0,r24
@L2080:
	ld.b	 r12,r0,r11
	addu	 r11,r11,1
	ld.b	 r13,r0,r11
	bcnd.n	 ne0,r13,@L2080
	addu	 r10,r10,r12
@L2079:
	bcnd.n	 ge0,r10,@L2083
	subu	 r12,r0,r10
	divu	 r13,r12,31
	br.n	 @L2082
	subu	 r13,r0,r13
	align	 4
@L2083:
	divu	 r13,r10,31
@L2082:
	mak	 r12,r13,0<5>
	subu	 r12,r12,r13
	or.u	 r13,r0,hi16(_import_hash_table)
	subu	 r12,r10,r12
	or	 r13,r13,lo16(_import_hash_table)
	ld	 r25,r13[r12]
	bcnd.n	 eq0,r25,@L2147
	or	 r2,r0,r24
@L2086:
	ld	 r3,r0,r25
	bsr.n	 _strcmp
	or	 r2,r0,r24
	bcnd	 eq0,r2,@L2146
	ld	 r25,r25,12
	bcnd.n	 ne0,r25,@L2086
	or	 r2,r0,r24
@L2147:
	or	 r3,r0,0
	bsr.n	 _open
	or	 r4,r0,438
	or	 r22,r0,r2
	bcnd	 lt0,r22,@L2100
	br.n	 @L2089
	or	 r2,r0,r22
	align	 4
@L2102:
	bsr.n	 _close
	or	 r2,r0,r22
@L2146:
	br.n	 @L2100
	subu	 r2,r0,2
	align	 4
@L2089:
	bsr.n	 _fstat
	addu	 r3,r31,56
	or.u	 r13,r0,hi16(_import_hash_table)
	ld	 r25,r13,lo16(_import_hash_table)
	or	 r24,r0,0
	bcnd.n	 eq0,r25,@L2109
	or	 r23,r13,lo16(_import_hash_table)
	addu	 r2,r25,4
@L2148:
	addu	 r3,r31,60
	bsr.n	 _bcmp
	or	 r4,r0,4
	bcnd	 ne0,r2,@L2112
	ld	 r13,r25,8
	ld	 r12,r31,56
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L2102
@L2112:
	ld	 r25,r25,12
	bcnd.n	 ne0,r25,@L2148
	addu	 r2,r25,4
@L2109:
	addu	 r24,r24,1
	ld	 r25,r23[r24]
	bcnd.n	 eq0,r25,@L2114
	addu	 r2,r25,4
@L2149:
	addu	 r3,r31,60
	bsr.n	 _bcmp
	or	 r4,r0,4
	bcnd	 ne0,r2,@L2117
	ld	 r13,r25,8
	ld	 r12,r31,56
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L2102
@L2117:
	ld	 r25,r25,12
	bcnd.n	 ne0,r25,@L2149
	addu	 r2,r25,4
@L2114:
	addu	 r24,r24,1
	ld	 r25,r23[r24]
	bcnd.n	 eq0,r25,@L2119
	addu	 r2,r25,4
@L2150:
	addu	 r3,r31,60
	bsr.n	 _bcmp
	or	 r4,r0,4
	bcnd	 ne0,r2,@L2122
	ld	 r13,r25,8
	ld	 r12,r31,56
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L2102
@L2122:
	ld	 r25,r25,12
	bcnd.n	 ne0,r25,@L2150
	addu	 r2,r25,4
@L2119:
	addu	 r24,r24,1
	cmp	 r13,r24,30
	bb0.n	 le,r13,@L2100
	or	 r2,r0,r22
@L2093:
	ld	 r25,r23[r24]
	bcnd.n	 eq0,r25,@L2151
	addu	 r13,r24,1
	addu	 r2,r25,4
@L2152:
	addu	 r3,r31,60
	bsr.n	 _bcmp
	or	 r4,r0,4
	bcnd	 ne0,r2,@L2127
	ld	 r13,r25,8
	ld	 r12,r31,56
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L2102
@L2127:
	ld	 r25,r25,12
	bcnd.n	 ne0,r25,@L2152
	addu	 r2,r25,4
	addu	 r13,r24,1
@L2151:
	ld	 r25,r23[r13]
	bcnd.n	 eq0,r25,@L2153
	addu	 r13,r24,2
	addu	 r2,r25,4
@L2154:
	addu	 r3,r31,60
	bsr.n	 _bcmp
	or	 r4,r0,4
	bcnd	 ne0,r2,@L2132
	ld	 r13,r25,8
	ld	 r12,r31,56
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L2102
@L2132:
	ld	 r25,r25,12
	bcnd.n	 ne0,r25,@L2154
	addu	 r2,r25,4
	addu	 r13,r24,2
@L2153:
	ld	 r25,r23[r13]
	bcnd.n	 eq0,r25,@L2155
	addu	 r13,r24,3
	addu	 r2,r25,4
@L2156:
	addu	 r3,r31,60
	bsr.n	 _bcmp
	or	 r4,r0,4
	bcnd	 ne0,r2,@L2137
	ld	 r13,r25,8
	ld	 r12,r31,56
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L2102
@L2137:
	ld	 r25,r25,12
	bcnd.n	 ne0,r25,@L2156
	addu	 r2,r25,4
	addu	 r13,r24,3
@L2155:
	ld	 r25,r23[r13]
	bcnd.n	 eq0,r25,@L2139
	addu	 r2,r25,4
@L2157:
	addu	 r3,r31,60
	bsr.n	 _bcmp
	or	 r4,r0,4
	bcnd	 ne0,r2,@L2142
	ld	 r13,r25,8
	ld	 r12,r31,56
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L2102
@L2142:
	ld	 r25,r25,12
	bcnd.n	 ne0,r25,@L2157
	addu	 r2,r25,4
@L2139:
	addu	 r24,r24,4
	cmp	 r13,r24,30
	bb1.n	 le,r13,@L2093
	or	 r2,r0,r22
@L2100:
@Lte11:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	ld.d	 r22,r31,32
	jmp.n	 r1
	addu	 r31,r31,128

	align	 8
_add_import:
	subu	 r31,r31,128
	st	 r1,r31,48
	st	 r23,r31,36
	or	 r23,r0,r3
	st.d	 r24,r31,40
@Ltb12:
	ld.b	 r13,r0,r23
	or	 r10,r0,0
	bcnd.n	 eq0,r13,@L2169
	or	 r11,r0,r23
@L2170:
	ld.b	 r12,r0,r11
	addu	 r11,r11,1
	ld.b	 r13,r0,r11
	bcnd.n	 ne0,r13,@L2170
	addu	 r10,r10,r12
@L2169:
	bcnd.n	 ge0,r10,@L2173
	subu	 r24,r0,r10
	divu	 r13,r24,31
	br.n	 @L2172
	subu	 r13,r0,r13
	align	 4
@L2173:
	divu	 r13,r10,31
@L2172:
	mak	 r24,r13,0<5>
	subu	 r24,r24,r13
	addu	 r3,r31,56
	bsr.n	 _fstat
	subu	 r24,r10,r24
	bsr.n	 _xmalloc
	or	 r2,r0,16
	or	 r25,r0,r2
	bsr.n	 _strlen
	or	 r2,r0,r23
	bsr.n	 _xmalloc
	addu	 r2,r2,1
	or	 r3,r0,r23
	bsr.n	 _strcpy
	st	 r2,r0,r25
	addu	 r2,r31,60
	addu	 r3,r25,4
	bsr.n	 _bcopy
	or	 r4,r0,4
	ld	 r12,r31,56
	or.u	 r13,r0,hi16(_import_hash_table)
	st	 r12,r25,8
	or	 r13,r13,lo16(_import_hash_table)
	ld	 r12,r13[r24]
	st	 r12,r25,12
	st	 r25,r13[r24]
@Lte12:
	ld	 r1,r31,48
	ld	 r23,r31,36
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,128

	align	 8
_check_precompiled:
	or.u	 r13,r0,hi16(_pcp_outfile)
	ld	 r13,r13,lo16(_pcp_outfile)
	subu	 r31,r31,64
	st.d	 r22,r31,32
	or	 r23,r0,r2
	or	 r22,r0,r4
	st.d	 r24,r31,40
	or	 r25,r0,0
	bcnd.n	 ne0,r13,@L2216
	st	 r1,r31,48
@Ltb13:
	or	 r2,r0,r23
	addu	 r3,r31,56
	bsr.n	 _file_size_and_mode
	addu	 r4,r31,60
	bcnd	 lt0,r2,@L2216
	ld	 r13,r31,56
	mask	 r13,r13,61440
	cmp	 r13,r13,32768
	bb1	 ne,r13,@L2197
	ld	 r2,r31,60
	bsr.n	 _xmalloc
	addu	 r2,r2,2
	ld	 r4,r31,60
	bcnd.n	 le0,r4,@L2205
	or	 r24,r0,r2
@L2200:
	or	 r2,r0,r23
	bsr.n	 _read
	addu	 r3,r24,r25
	bcnd	 lt0,r2,@L2202
	bcnd	 eq0,r2,@L2205
	addu	 r25,r25,r2
	ld	 r13,r31,60
	subu	 r13,r13,r2
	st	 r13,r31,60
	bcnd.n	 gt0,r13,@L2200
	or	 r4,r0,r13
	br	 @L2205
	align	 4
@L2197:
	bsr	 _abort
	align	 4
@L2205:
	bcnd.n	 le0,r25,@L2206
	subu	 r13,r0,1
	addu	 r12,r25,r24
	ld.b	 r13,r12,r13
	cmp	 r13,r13,10
	bb0.n	 ne,r13,@L2206
	or	 r13,r0,10
	st.b	 r13,r0,r12
	addu	 r25,r25,1
@L2206:
	or	 r2,r0,r24
	st.b	 r0,r24,r25
	addu	 r13,r24,r25
	bsr.n	 _check_preconditions
	st	 r13,r0,r22
	bcnd	 eq0,r2,@L2202
	ld.b	 r13,r0,r24
	bcnd.n	 eq0,r13,@L2209
	or	 r2,r0,r24
	addu	 r2,r2,1
@L2217:
	ld.b	 r13,r0,r2
	bcnd.n	 ne0,r13,@L2217
	addu	 r2,r2,1
	subu	 r2,r2,1
@L2209:
	br.n	 @L2213
	addu	 r2,r2,1
	align	 4
@L2202:
	bsr.n	 _free
	or	 r2,r0,r24
@L2216:
	or	 r2,r0,0
@L2213:
@Lte13:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	ld.d	 r22,r31,32
	jmp.n	 r1
	addu	 r31,r31,64

data
	align	 8
@LC203:
	string	 "Bad format encountered while reading precompiled "
	string	 "file\000"
	align	 8
@LC204:
	string	 "define\000"
	align	 8
@LC205:
	string	 "undef\000"
	align	 8
@LC206:
	string	 "Bad format encountered while reading precompiled "
	string	 "file\000"
text
	align	 8
_check_preconditions:
	subu	 r31,r31,80
	st	 r1,r31,48
	st.d	 r24,r31,40
	or	 r25,r0,r2
	st	 r23,r31,36
@Ltb14:
	ld.b	 r13,r0,r25
	bcnd.n	 eq0,r13,@L2242
	or.u	 r13,r0,hi16(_is_hor_space)
	or	 r23,r13,lo16(_is_hor_space)
@L2243:
	or	 r2,r0,r25
	bsr.n	 _index
	or	 r3,r0,10
	ld.b	 r13,r0,r25
	addu	 r25,r25,1
	cmp	 r13,r13,35
	bb0.n	 ne,r13,@L2244
	or	 r24,r0,r2
	or.u	 r2,r0,hi16(@LC203)
	br.n	 @L2265
	or	 r2,r2,lo16(@LC203)
	align	 4
@L2244:
	or	 r2,r0,r25
	or.u	 r3,r0,hi16(@LC204)
	or	 r4,r0,6
	bsr.n	 _strncmp
	or	 r3,r3,lo16(@LC204)
	bcnd.n	 ne0,r2,@L2245
	or	 r2,r0,r25
	addu	 r2,r25,6
	or	 r3,r0,r24
	or	 r4,r0,0
	bsr.n	 _create_definition
	addu	 r12,r31,56
	ld	 r13,r31,56
	bcnd	 ne0,r13,@L2246
	bsr	 _abort
	align	 4
@L2246:
	ld	 r2,r31,60
	ld	 r3,r31,64
	bsr.n	 _lookup
	subu	 r4,r0,1
	or	 r12,r0,r2
	bcnd	 eq0,r12,@L2267
	ld	 r11,r12,12
	subu	 r13,r11,30
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L2267
	cmp	 r13,r11,31
	bb1	 ne,r13,@L2249
	ld	 r2,r31,56
	bsr.n	 _compare_defs
	ld	 r3,r12,24
	bcnd	 ne0,r2,@L2249
	ld	 r12,r31,56
	ld	 r13,r12,4
	cmp	 r13,r13,2
	bb1	 ne,r13,@L2267
	ld	 r12,r12,12
	ld.bu	 r13,r0,r12
	cmp	 r13,r13,10
	bb1	 ne,r13,@L2267
	ld.bu	 r13,r12,1
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L2249
	or	 r2,r0,0
	br	 @L2262
	align	 4
@L2245:
	or.u	 r3,r0,hi16(@LC205)
	or	 r4,r0,5
	bsr.n	 _strncmp
	or	 r3,r3,lo16(@LC205)
	bcnd.n	 ne0,r2,@L2250
	addu	 r25,r25,5
	ld.b	 r13,r0,r25
	ld.bu	 r13,r13,r23
	bcnd.n	 eq0,r13,@L2252
	or.u	 r13,r0,hi16(_is_hor_space)
	or	 r12,r13,lo16(_is_hor_space)
	addu	 r25,r25,1
@L2268:
	ld.b	 r13,r0,r25
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L2268
	addu	 r25,r25,1
	subu	 r25,r25,1
@L2252:
	or.u	 r13,r0,hi16(_is_idchar)
	ld.b	 r12,r0,r25
	or	 r11,r13,lo16(_is_idchar)
	ld.bu	 r13,r12,r11
	bcnd.n	 eq0,r13,@L2256
	or	 r2,r0,r25
	or	 r12,r0,r11
	addu	 r25,r25,1
@L2269:
	ld.b	 r13,r0,r25
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L2269
	addu	 r25,r25,1
	subu	 r25,r25,1
@L2256:
	subu	 r3,r25,r2
	bsr.n	 _lookup
	subu	 r4,r0,1
	bcnd	 eq0,r2,@L2249
@L2267:
	br.n	 @L2262
	or	 r2,r0,0
	align	 4
@L2250:
	or.u	 r2,r0,hi16(@LC206)
	or	 r2,r2,lo16(@LC206)
@L2265:
	bsr.n	 _error
	subu	 r1,r1,@L2270
@L2271:
	align	 4
@L2249:
	ld.b	 r13,r24,1
	bcnd.n	 ne0,r13,@L2243
	addu	 r25,r24,1
@L2242:
	or	 r2,r0,1
@L2262:
@Lte14:
	ld	 r1,r31,48
	ld	 r23,r31,36
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,80
	def	 @L2270,@L2271-@L2267

	align	 8
_pcfinclude:
	subu	 r31,r31,144
	st	 r1,r31,80
	st	 r15,r31,36
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	st.d	 r18,r31,48
	or	 r25,r0,r2
	st.d	 r16,r31,40
@Ltb15:
	ld.bu	 r20,r0,r25
	addu	 r25,r25,1
	ld.bu	 r12,r0,r25
	mak	 r13,r20,0<8>
	addu	 r25,r25,1
	or	 r20,r13,r12
	ld.bu	 r12,r0,r25
	mak	 r13,r20,0<8>
	addu	 r25,r25,1
	or	 r20,r13,r12
	ld.bu	 r12,r0,r25
	mak	 r13,r20,0<8>
	or	 r20,r13,r12
	or	 r17,r0,r4
	subu	 r20,r20,1
	or	 r16,r0,r5
	addu	 r13,r20,1
	bcnd.n	 eq0,r13,@L2302
	addu	 r25,r25,1
	or	 r19,r0,1
	or.u	 r13,r0,hi16(_outbuf+20)
	or.u	 r12,r0,hi16(_is_hor_space)
	or	 r15,r13,lo16(_outbuf+20)
	or	 r18,r12,lo16(_is_hor_space)
	mask	 r12,r25,3
@L2331:
	bcnd.n	 eq0,r12,@L2304
	addu	 r13,r25,4
	subu	 r25,r13,r12
@L2304:
	or	 r22,r0,r25
	addu	 r25,r25,28
	ld.bu	 r13,r0,r25
	bcnd.n	 eq0,r13,@L2306
	or	 r2,r0,r25
	addu	 r25,r25,1
@L2330:
	ld.bu	 r13,r0,r25
	bcnd.n	 ne0,r13,@L2330
	addu	 r25,r25,1
	subu	 r25,r25,1
@L2306:
	addu	 r12,r31,88
	or	 r4,r0,0
	or	 r3,r0,r25
	bsr.n	 _expand_to_temp_buffer
	or	 r5,r0,0
	ld	 r13,r31,108
	st	 r13,r0,r22
	ld	 r13,r31,104
	st	 r13,r22,4
	st	 r0,r22,8
	st	 r17,r22,16
	or.u	 r13,r0,hi16(_outbuf+24)
	ld	 r12,r0,r15
	or.u	 r10,r0,hi16(_stringlist_tailp)
	ld	 r13,r13,lo16(_outbuf+24)
	ld	 r11,r10,lo16(_stringlist_tailp)
	st	 r0,r22,20
	subu	 r13,r13,r12
	st	 r13,r22,24
	addu	 r25,r25,1
	st	 r22,r0,r11
	addu	 r13,r22,20
	st	 r13,r10,lo16(_stringlist_tailp)
	ld.bu	 r24,r0,r25
	addu	 r25,r25,1
	ld.bu	 r12,r0,r25
	mak	 r13,r24,0<8>
	addu	 r25,r25,1
	or	 r24,r13,r12
	ld.bu	 r12,r0,r25
	mak	 r13,r24,0<8>
	addu	 r25,r25,1
	or	 r24,r13,r12
	ld.bu	 r12,r0,r25
	mak	 r13,r24,0<8>
	or	 r24,r13,r12
	addu	 r13,r24,1
	bcnd.n	 ne0,r13,@L2310
	addu	 r25,r25,1
	br.n	 @L2301
	st	 r19,r22,8
	align	 4
@L2310:
	subu	 r24,r24,1
	addu	 r13,r24,1
	bcnd	 eq0,r13,@L2301
@L2315:
	or	 r23,r0,r25
	addu	 r25,r25,8
	bsr.n	 _strlen
	or	 r2,r0,r25
	addu	 r12,r31,88
	addu	 r21,r25,r2
	or	 r2,r0,r25
	or	 r4,r0,0
	or	 r5,r0,0
	or	 r3,r0,r21
	bsr.n	 _expand_to_temp_buffer
	st	 r22,r0,r23
	ld	 r13,r31,108
	st	 r13,r31,112
	ld.bu	 r13,r0,r13
	ld.bu	 r13,r13,r18
	bcnd.n	 eq0,r13,@L2317
	or.u	 r13,r0,hi16(_is_hor_space)
	or	 r11,r13,lo16(_is_hor_space)
@L2318:
	ld	 r12,r31,112
	addu	 r13,r12,1
	st	 r13,r31,112
	ld.bu	 r13,r12,1
	ld.bu	 r13,r13,r11
	bcnd	 ne0,r13,@L2318
@L2317:
	ld	 r2,r31,112
	or.u	 r13,r0,hi16(_is_idstart)
	ld.bu	 r12,r0,r2
	or	 r13,r13,lo16(_is_idstart)
	ld.bu	 r13,r12,r13
	bcnd	 eq0,r13,@L2324
	ld	 r13,r31,108
	ld	 r12,r31,104
	addu	 r13,r13,r12
	cmp	 r13,r2,r13
	bb0.n	 ne,r13,@L2324
	subu	 r3,r0,1
	bsr.n	 _lookup
	or	 r4,r0,r3
	bcnd	 ne0,r2,@L2322
	st	 r0,r23,4
	ld	 r2,r31,112
	subu	 r3,r0,1
	or	 r4,r0,34
	or	 r5,r0,0
	or	 r6,r0,r23
	or	 r7,r0,r3
	bsr.n	 _install
	addu	 r1,r1,@L2332
@L2333:
	align	 4
@L2322:
	ld	 r13,r2,12
	cmp	 r13,r13,34
	bb1	 ne,r13,@L2324
	ld	 r13,r2,24
	st	 r13,r23,4
	br.n	 @L2314
	st	 r23,r2,24
	align	 4
@L2324:
	st	 r19,r22,8
@L2314:
	ld	 r2,r31,108
	bsr.n	 _free
	subu	 r24,r24,1
	addu	 r13,r24,1
	bcnd.n	 ne0,r13,@L2315
	addu	 r25,r21,1
@L2301:
	subu	 r20,r20,1
	addu	 r13,r20,1
	bcnd.n	 ne0,r13,@L2331
	mask	 r12,r25,3
@L2302:
	or.u	 r13,r0,hi16(_indepth)
	ld	 r13,r13,lo16(_indepth)
	or	 r3,r0,r16
	mul	 r13,r13,44
	or.u	 r2,r0,hi16(_instack)
	or	 r4,r0,0
	or	 r2,r2,lo16(_instack)
	or	 r5,r0,1
	bsr.n	 _output_line_command
	addu	 r2,r13,r2
@Lte15:
	ld	 r1,r31,80
	ld	 r15,r31,36
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	jmp.n	 r1
	addu	 r31,r31,144
	def	 @L2332,@L2314-@L2333

	align	 8
_pcstring_used:
	subu	 r31,r31,48
	st	 r1,r31,36
@Ltb16:
	ld	 r12,r2,24
	bcnd.n	 eq0,r12,@L2342
	or	 r11,r0,1
@L2344:
	ld	 r13,r0,r12
	st	 r11,r13,8
	ld	 r12,r12,4
	bcnd	 ne0,r12,@L2344
@L2342:
	bsr	 _delete_macro
@Lte16:
	ld	 r1,r31,36
	jmp.n	 r1
	addu	 r31,r31,48

data
	align	 8
@LC207:
	string	 "\n# %d \"%s\"\n\000"
text
	align	 8
_write_output:
	subu	 r31,r31,80
	st	 r1,r31,64
	st	 r19,r31,36
	st.d	 r24,r31,56
	st.d	 r22,r31,48
	or	 r2,r0,80
	bsr.n	 _xmalloc
	st.d	 r20,r31,40
@Ltb17:
	or.u	 r13,r0,hi16(_outbuf+20)
	ld	 r23,r13,lo16(_outbuf+20)
	or	 r13,r13,lo16(_outbuf+20)
	ld	 r12,r13,4
	or.u	 r13,r0,hi16(_stringlist)
	ld	 r24,r13,lo16(_stringlist)
	cmp	 r12,r23,r12
	cmp	 r13,r24,0
	rot	 r11,r13,24
	or.c	 r13,r12,r11
	or	 r21,r0,80
	extu	 r13,r13,1<lo>
	bcnd.n	 eq0,r13,@L2360
	or	 r22,r0,r2
	or.u	 r13,r0,hi16(__iob+32)
	or.u	 r19,r0,hi16(_outbuf+24)
	or	 r20,r13,lo16(__iob+32)
@L2361:
	bcnd.n	 eq0,r24,@L2366
	or.u	 r13,r0,hi16(_outbuf+20)
	ld	 r13,r13,lo16(_outbuf+20)
	ld	 r12,r24,24
	subu	 r4,r23,r13
	cmp	 r13,r4,r12
	bb1.n	 ne,r13,@L2367
	subu	 r25,r12,r4
	ld	 r13,r24,8
	bcnd	 eq0,r13,@L2363
	bsr.n	 _strlen
	ld	 r2,r24,16
	cmp	 r2,r2,r21
	bb0.n	 gt,r2,@L2364
	mak	 r3,r21,0<1>
	or	 r2,r0,r22
	bsr.n	 _xrealloc
	or	 r21,r0,r3
	or	 r22,r0,r2
@L2364:
	or	 r2,r0,r22
	ld	 r4,r24,12
	or.u	 r3,r0,hi16(@LC207)
	ld	 r5,r24,16
	bsr.n	 _sprintf
	or	 r3,r3,lo16(@LC207)
	or	 r2,r0,r22
	bsr.n	 _strlen
	ld.h	 r25,r20,18
	or	 r3,r0,r22
	or	 r4,r0,r2
	bsr.n	 _write
	or	 r2,r0,r25
	ld.h	 r2,r20,18
	ld	 r3,r0,r24
	bsr.n	 _write
	ld	 r4,r24,4
@L2363:
	ld	 r24,r24,20
	br	 @L2359
	align	 4
@L2366:
	ld	 r13,r19,lo16(_outbuf+24)
	subu	 r25,r13,r23
@L2367:
	ld.h	 r2,r20,18
	or	 r4,r0,r25
	or	 r3,r0,r23
	bsr.n	 _write
	addu	 r23,r23,r4
@L2359:
	ld	 r13,r19,lo16(_outbuf+24)
	cmp	 r12,r24,0
	cmp	 r13,r23,r13
	rot	 r11,r12,24
	or.c	 r12,r13,r11
	extu	 r12,r12,1<lo>
	bcnd	 ne0,r12,@L2361
@L2360:
@Lte17:
	ld	 r1,r31,64
	ld	 r19,r31,36
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80

data
	align	 8
@LC208:
	string	 "macro\000"
	align	 8
@LC209:
	string	 "another parameter follows `%s'\000"
	align	 8
@LC210:
	string	 "invalid character in macro parameter name\000"
	align	 8
@LC211:
	string	 "badly punctuated parameter list in `#define'\000"
	align	 8
@LC212:
	string	 "unterminated parameter list in `#define'\000"
	align	 8
@LC213:
	string	 "duplicate argument name `%s' in `#define'\000"
	align	 8
@LC214:
	string	 "\000"
text
	align	 8
_create_definition:
	subu	 r31,r31,144
	or.u	 r13,r0,hi16(_indepth)
	st.d	 r16,r31,40
	or	 r17,r0,r12
	ld	 r12,r13,lo16(_indepth)
	st	 r1,r31,84
	st	 r30,r31,80
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	mul	 r12,r12,44
	or.u	 r13,r0,hi16(_instack)
	st.d	 r18,r31,48
	or	 r13,r13,lo16(_instack)
	st.d	 r14,r31,32
	addu	 r12,r12,r13
	ld	 r10,r12,12
	ld	 r12,r12,4
	addu	 r30,r31,80
@Ltb18:
	st	 r10,r30,44
	or	 r24,r0,r2
	st	 r12,r30,52
	or.u	 r13,r0,hi16(_is_hor_space)
	ld.bu	 r12,r0,r24
	or	 r11,r13,lo16(_is_hor_space)
	or	 r19,r0,0
	ld.bu	 r13,r12,r11
	or	 r16,r0,0
	or	 r20,r0,r3
	bcnd.n	 eq0,r13,@L2375
	st	 r4,r30,28
	or	 r12,r0,r11
	addu	 r24,r24,1
@L2448:
	ld.bu	 r13,r0,r24
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L2448
	addu	 r24,r24,1
	subu	 r24,r24,1
@L2375:
	or	 r14,r0,r24
	or.u	 r3,r0,hi16(@LC208)
	or	 r2,r0,r14
	bsr.n	 _check_macro_name
	or	 r3,r3,lo16(@LC208)
	st	 r2,r30,36
	addu	 r24,r14,r2
	ld.bu	 r12,r0,r24
	cmp	 r13,r12,40
	bb1.n	 ne,r13,@L2378
	or.u	 r13,r0,hi16(_is_hor_space)
	addu	 r24,r24,1
	ld.bu	 r12,r0,r24
	or	 r11,r13,lo16(_is_hor_space)
	ld.bu	 r13,r12,r11
	or	 r18,r0,0
	bcnd.n	 eq0,r13,@L2380
	or	 r21,r0,0
	or	 r12,r0,r11
	addu	 r24,r24,1
@L2449:
	ld.bu	 r13,r0,r24
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L2449
	addu	 r24,r24,1
	subu	 r24,r24,1
@L2380:
	ld.bu	 r13,r0,r24
	cmp	 r13,r13,41
	bb0.n	 ne,r13,@L2435
	or.u	 r13,r0,hi16(_is_hor_space)
	or.u	 r15,r0,hi16(_rest_extension)
	subu	 r31,r31,32
@L2455:
	st	 r24,r31,36
	st	 r21,r31,44
	addu	 r21,r21,1
	st	 r18,r31,32
	addu	 r23,r31,32
	st.b	 r0,r31,48
	bcnd.n	 eq0,r19,@L2390
	or	 r18,r0,r23
	or.u	 r2,r0,hi16(@LC209)
	or	 r3,r15,lo16(_rest_extension)
	bsr.n	 _pedwarn
	or	 r2,r2,lo16(@LC209)
@L2390:
	or.u	 r13,r0,hi16(_is_idstart)
	ld.bu	 r12,r0,r24
	or	 r13,r13,lo16(_is_idstart)
	ld.bu	 r13,r12,r13
	bcnd.n	 ne0,r13,@L2450
	or.u	 r13,r0,hi16(_is_idchar)
	or.u	 r2,r0,hi16(@LC210)
	bsr.n	 _pedwarn
	or	 r2,r2,lo16(@LC210)
	or.u	 r13,r0,hi16(_is_idchar)
	ld.bu	 r12,r0,r24
@L2450:
	or	 r11,r13,lo16(_is_idchar)
	ld.bu	 r13,r12,r11
	bcnd	 eq0,r13,@L2393
	or	 r22,r0,r11
	subu	 r25,r20,r24
	subu	 r25,r25,1
@L2451:
	cmp	 r13,r25,3
	bb1.n	 ls,r13,@L2392
	addu	 r24,r24,1
	or	 r2,r15,lo16(_rest_extension)
	or	 r3,r0,r24
	bsr.n	 _strncmp
	or	 r4,r0,3
	bcnd.n	 eq0,r2,@L2436
	or	 r13,r0,1
@L2392:
	ld.bu	 r13,r0,r24
	ld.bu	 r13,r13,r22
	bcnd.n	 ne0,r13,@L2451
	subu	 r25,r25,1
	addu	 r25,r25,1
@L2393:
	ld	 r13,r23,4
	subu	 r11,r24,r13
	bcnd.n	 eq0,r19,@L2397
	st	 r11,r23,8
	addu	 r24,r24,3
@L2397:
	or.u	 r10,r0,hi16(_is_hor_space)
	ld.bu	 r13,r0,r24
	or	 r10,r10,lo16(_is_hor_space)
	addu	 r12,r16,2
	ld.bu	 r13,r13,r10
	bcnd.n	 eq0,r13,@L2399
	addu	 r16,r12,r11
	or.u	 r13,r0,hi16(_is_hor_space)
	or	 r12,r13,lo16(_is_hor_space)
	addu	 r24,r24,1
@L2452:
	ld.bu	 r13,r0,r24
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L2452
	addu	 r24,r24,1
	subu	 r24,r24,1
@L2399:
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L2407
	ld.bu	 r13,r0,r24
	cmp	 r11,r13,44
	cmp	 r13,r13,41
	or	 r13,r11,r13
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd	 eq0,r13,@L2406
@L2407:
	or.u	 r2,r0,hi16(@LC211)
	br.n	 @L2446
	or	 r2,r2,lo16(@LC211)
	align	 4
@L2436:
	st.b	 r13,r23,16
	br.n	 @L2393
	or	 r19,r0,1
	align	 4
@L2406:
	bb1.n	 ne,r11,@L2453
	cmp	 r13,r24,r20
	addu	 r24,r24,1
	or.u	 r10,r0,hi16(_is_hor_space)
	ld.bu	 r13,r0,r24
	or	 r10,r10,lo16(_is_hor_space)
	ld.bu	 r13,r13,r10
	bcnd.n	 eq0,r13,@L2409
	or.u	 r13,r0,hi16(_is_hor_space)
	or	 r12,r13,lo16(_is_hor_space)
	addu	 r24,r24,1
@L2454:
	ld.bu	 r13,r0,r24
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L2454
	addu	 r24,r24,1
	subu	 r24,r24,1
@L2409:
	cmp	 r13,r24,r20
@L2453:
	bb0	 lo,r13,@L2437
	ld	 r25,r0,r23
	bcnd	 eq0,r25,@L2387
@L2422:
	ld	 r4,r23,8
	ld	 r13,r25,8
	cmp	 r13,r4,r13
	bb1	 ne,r13,@L2421
	ld	 r2,r23,4
	bsr.n	 _strncmp
	ld	 r3,r25,4
	bcnd	 eq0,r2,@L2438
@L2421:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L2422
@L2387:
	ld.bu	 r13,r0,r24
	cmp	 r13,r13,41
	bb1.n	 ne,r13,@L2455
	subu	 r31,r31,32
	addu	 r31,r31,32
@L2435:
	addu	 r24,r24,1
	cmp	 r13,r24,r20
	bb0	 lo,r13,@L2426
	ld.bu	 r13,r0,r24
	cmp	 r12,r13,32
	cmp	 r13,r13,9
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	addu	 r24,r24,r12
@L2426:
	or	 r2,r0,r24
	or	 r3,r0,r20
	or	 r4,r0,r21
	or	 r5,r0,r18
	or	 r25,r0,0
	bsr.n	 _collect_expansion
	or	 r24,r0,r5
	or	 r23,r0,r2
	addu	 r2,r16,1
	bsr.n	 _xmalloc
	st.b	 r19,r23,24
	bcnd.n	 eq0,r24,@L2428
	st	 r2,r23,32
	or	 r22,r0,44
@L2430:
	ld	 r2,r24,4
	ld	 r3,r23,32
	ld	 r4,r24,8
	bsr.n	 _bcopy
	addu	 r3,r3,r25
	ld	 r13,r24,8
	ld	 r12,r0,r24
	bcnd.n	 eq0,r12,@L2429
	addu	 r25,r25,r13
	ld	 r13,r23,32
	st.b	 r22,r13,r25
	ld	 r12,r23,32
	addu	 r25,r25,1
	or	 r13,r0,32
	st.b	 r13,r12,r25
	addu	 r25,r25,1
@L2429:
	ld	 r24,r0,r24
	bcnd	 ne0,r24,@L2430
@L2428:
	ld	 r13,r23,32
	br.n	 @L2433
	st.b	 r0,r13,r25
	align	 4
@L2378:
	or	 r13,r13,lo16(_is_hor_space)
	ld.bu	 r2,r12,r13
	or	 r3,r0,r20
	cmp	 r2,r2,0
	subu	 r4,r0,1
	extu	 r2,r2,1<ne>
	or	 r5,r0,0
	bsr.n	 _collect_expansion
	addu	 r2,r24,r2
	or.u	 r13,r0,hi16(@LC214)
	or	 r23,r0,r2
	or	 r13,r13,lo16(@LC214)
	st	 r13,r23,32
@L2433:
	ld	 r10,r30,44
	st	 r10,r23,16
	ld	 r10,r30,28
	cmp	 r13,r10,0
	ld	 r10,r30,52
	st	 r10,r23,20
	ld	 r10,r30,36
	extu	 r13,r13,1<eq>
	st	 r13,r23,8
	st	 r23,r30,8
	st	 r14,r30,12
	st	 r10,r30,16
	st	 r23,r0,r17
	ld	 r13,r30,16
	br.n	 @L2447
	st	 r14,r17,4
	align	 4
@L2438:
	ld	 r4,r23,8
	addu	 r13,r4,16
	and	 r13,r13,0xfff0
	subu	 r31,r31,r13
	addu	 r25,r31,32
	ld	 r3,r23,4
	bsr.n	 _strncpy
	or	 r2,r0,r25
	ld	 r13,r23,8
	or.u	 r2,r0,hi16(@LC213)
	or	 r3,r0,r25
	or	 r2,r2,lo16(@LC213)
	st.b	 r0,r3,r13
	bsr.n	 _error
	addu	 r1,r1,@L2456
@L2457:
	align	 4
@L2437:
	or.u	 r2,r0,hi16(@LC212)
	or	 r2,r2,lo16(@LC212)
@L2446:
	bsr	 _error
@L2408:
	ld	 r12,r30,12
	st	 r0,r30,8
	st	 r0,r0,r17
	ld	 r13,r30,16
	st	 r12,r17,4
@L2447:
	st	 r13,r17,8
@Lte18:
	subu	 r31,r30,80
	ld	 r1,r31,84
	ld	 r30,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	or	 r2,r0,r17
	ld.d	 r16,r31,40
	ld.d	 r14,r31,32
	jmp.n	 r1
	addu	 r31,r31,144
	def	 @L2456,@L2408-@L2457

data
	align	 8
@LC215:
	string	 "' redefined\000"
	align	 8
@LC216:
	string	 "this is the location of the previous definition\000"
text
	align	 8
_do_define:
	or.u	 r13,r0,hi16(_pcp_outfile)
	ld	 r13,r13,lo16(_pcp_outfile)
	subu	 r31,r31,96
	st	 r30,r31,64
	addu	 r30,r31,64
	st.d	 r22,r31,48
	or	 r23,r0,r2
	st.d	 r24,r31,56
	or	 r24,r0,r4
	st.d	 r20,r31,40
	or	 r21,r0,r3
	cmp	 r12,r24,0
	cmp	 r13,r13,0
	or	 r20,r0,r5
	or	 r13,r13,r12
	st	 r1,r31,68
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L2459
	st	 r19,r31,36
@Ltb19:
	ld	 r11,r24,24
	ld	 r13,r24,20
	ld	 r12,r24,16
	subu	 r11,r11,r13
	subu	 r13,r21,r23
	ld	 r25,r0,r20
	addu	 r13,r13,1
	subu	 r12,r12,r11
	addu	 r3,r25,r13
	cmp	 r12,r12,r3
	bb0	 ls,r12,@L2462
	bsr.n	 _grow_outbuf
	or	 r2,r0,r24
@L2462:
	ld	 r12,r24,24
	addu	 r13,r12,1
	st	 r13,r24,24
	or	 r13,r0,35
	st.b	 r13,r0,r12
	ld	 r2,r20,8
	ld	 r3,r24,24
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r24,24
	addu	 r4,r13,r25
	cmp	 r13,r21,r23
	bb0.n	 ne,r13,@L2463
	st	 r4,r24,24
	ld.bu	 r13,r0,r23
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L2463
	addu	 r13,r4,1
	st	 r13,r24,24
	or	 r13,r0,32
	st.b	 r13,r0,r4
@L2463:
	or	 r2,r0,r23
	subu	 r25,r21,r23
	ld	 r3,r24,24
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r24,24
	addu	 r13,r13,r25
	st	 r13,r24,24
@L2459:
	or	 r2,r0,r23
	or	 r3,r0,r21
	or	 r4,r0,r24
	bsr.n	 _create_definition
	addu	 r12,r30,8
	ld	 r13,r30,8
	bcnd.n	 eq0,r13,@L2465
	or	 r2,r0,1
	ld	 r2,r30,12
	ld	 r3,r30,16
	bsr.n	 _hashf
	or	 r4,r0,1403
	or	 r19,r0,r2
	ld	 r2,r30,12
	ld	 r3,r30,16
	bsr.n	 _lookup
	or	 r4,r0,r19
	or	 r22,r0,r2
	bcnd	 eq0,r22,@L2466
	ld	 r12,r22,12
	cmp	 r13,r12,34
	bb1.n	 ne,r13,@L2467
	or	 r11,r0,0
	br.n	 @L2468
	or	 r11,r0,1
	align	 4
@L2467:
	cmp	 r13,r12,31
	bb1.n	 ne,r13,@L2469
	cmp	 r13,r12,30
	ld	 r2,r30,8
	bsr.n	 _compare_defs
	ld	 r3,r22,24
	cmp	 r2,r2,0
	br.n	 @L2468
	extu	 r11,r2,1<eq>
	align	 4
@L2469:
	bb1.n	 ne,r13,@L2468
	or.u	 r13,r0,hi16(_done_initializing)
	ld	 r13,r13,lo16(_done_initializing)
	cmp	 r13,r13,0
	extu	 r11,r13,1<eq>
@L2468:
	bcnd.n	 ne0,r11,@L2486
	or	 r13,r0,31
	or.u	 r13,r0,hi16(_debug_output)
	ld	 r13,r13,lo16(_debug_output)
	cmp	 r12,r24,0
	cmp	 r13,r13,0
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd	 eq0,r13,@L2473
	ld	 r11,r24,24
	ld	 r13,r24,20
	ld	 r12,r24,16
	subu	 r11,r11,r13
	subu	 r13,r21,r23
	ld	 r25,r0,r20
	addu	 r13,r13,1
	subu	 r12,r12,r11
	addu	 r3,r25,r13
	cmp	 r12,r12,r3
	bb0	 ls,r12,@L2476
	bsr.n	 _grow_outbuf
	or	 r2,r0,r24
@L2476:
	ld	 r12,r24,24
	addu	 r13,r12,1
	st	 r13,r24,24
	or	 r13,r0,35
	st.b	 r13,r0,r12
	ld	 r2,r20,8
	ld	 r3,r24,24
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r24,24
	addu	 r4,r13,r25
	cmp	 r13,r21,r23
	bb0.n	 ne,r13,@L2477
	st	 r4,r24,24
	ld.bu	 r13,r0,r23
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L2477
	addu	 r13,r4,1
	st	 r13,r24,24
	or	 r13,r0,32
	st.b	 r13,r0,r4
@L2477:
	or	 r2,r0,r23
	subu	 r25,r21,r2
	ld	 r3,r24,24
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r24,24
	addu	 r13,r13,r25
	st	 r13,r24,24
@L2473:
	ld	 r13,r30,16
	addu	 r13,r13,37
	and	 r13,r13,0xfff0
	subu	 r31,r31,r13
	or	 r13,r0,96
	st.b	 r13,r31,32
	ld	 r2,r30,12
	ld	 r4,r30,16
	addu	 r3,r31,33
	bsr.n	 _bcopy
	addu	 r25,r31,32
	or.u	 r3,r0,hi16(@LC215)
	ld	 r2,r30,16
	or	 r3,r3,lo16(@LC215)
	subu	 r3,r3,4
	addu	 r2,r25,r2
	ld.bu	 r5,r3,4
	bsr.n	 ___movstrQI16x12
	subu	 r2,r2,3
	bsr.n	 _pedwarn
	or	 r2,r0,r25
	ld	 r13,r22,12
	cmp	 r13,r13,31
	bb1.n	 ne,r13,@L2486
	or	 r13,r0,31
	ld	 r13,r22,24
	ld	 r2,r13,20
	or.u	 r4,r0,hi16(@LC216)
	ld	 r3,r13,16
	bsr.n	 _pedwarn_with_file_and_line
	or	 r4,r4,lo16(@LC216)
	or	 r13,r0,31
@L2486:
	st	 r13,r22,12
	ld	 r13,r30,8
	br.n	 @L2479
	st	 r13,r22,24
	align	 4
@L2466:
	or.u	 r13,r0,hi16(_debug_output)
	ld	 r13,r13,lo16(_debug_output)
	cmp	 r12,r24,0
	cmp	 r13,r13,0
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd	 eq0,r13,@L2480
	ld	 r11,r24,24
	ld	 r13,r24,20
	ld	 r12,r24,16
	subu	 r11,r11,r13
	subu	 r13,r21,r23
	ld	 r25,r0,r20
	addu	 r13,r13,1
	subu	 r12,r12,r11
	addu	 r3,r25,r13
	cmp	 r12,r12,r3
	bb0	 ls,r12,@L2483
	bsr.n	 _grow_outbuf
	or	 r2,r0,r24
@L2483:
	ld	 r12,r24,24
	addu	 r13,r12,1
	st	 r13,r24,24
	or	 r13,r0,35
	st.b	 r13,r0,r12
	ld	 r2,r20,8
	ld	 r3,r24,24
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r24,24
	addu	 r4,r13,r25
	cmp	 r13,r21,r23
	bb0.n	 ne,r13,@L2484
	st	 r4,r24,24
	ld.bu	 r13,r0,r23
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L2484
	addu	 r13,r4,1
	st	 r13,r24,24
	or	 r13,r0,32
	st.b	 r13,r0,r4
@L2484:
	or	 r2,r0,r23
	subu	 r25,r21,r2
	ld	 r3,r24,24
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r24,24
	addu	 r13,r13,r25
	st	 r13,r24,24
@L2480:
	ld	 r2,r30,12
	or	 r4,r0,31
	ld	 r3,r30,16
	or	 r5,r0,0
	ld	 r6,r30,8
	bsr.n	 _install
	or	 r7,r0,r19
@L2479:
	or	 r2,r0,0
@L2465:
@Lte19:
	subu	 r31,r30,64
	ld	 r1,r31,68
	ld	 r30,r31,64
	ld	 r19,r31,36
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,96

data
	align	 8
@LC217:
	string	 "invalid %s name\000"
	align	 8
@LC218:
	string	 "invalid %s name `%s'\000"
	align	 8
@LC219:
	string	 "defined\000"
	align	 8
@LC220:
	string	 "invalid %s name `defined'\000"
text
	align	 8
_check_macro_name:
	subu	 r31,r31,64
	st	 r1,r31,52
	st	 r30,r31,48
	st	 r23,r31,36
	or	 r11,r0,r2
	st.d	 r24,r31,40
	or.u	 r13,r0,hi16(_is_idchar)
	ld.bu	 r12,r0,r11
	or	 r10,r13,lo16(_is_idchar)
	addu	 r30,r31,48
@Ltb20:
	ld.bu	 r13,r12,r10
	bcnd.n	 eq0,r13,@L2489
	or	 r23,r0,r3
	or	 r12,r0,r10
	addu	 r2,r2,1
@L2500:
	ld.bu	 r13,r0,r2
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L2500
	addu	 r2,r2,1
	subu	 r2,r2,1
@L2489:
	subu	 r24,r2,r11
	bcnd.n	 ne0,r24,@L2493
	or.u	 r13,r0,hi16(_is_idstart)
	or.u	 r2,r0,hi16(@LC217)
	or	 r3,r0,r23
	br.n	 @L2499
	or	 r2,r2,lo16(@LC217)
	align	 4
@L2493:
	ld.bu	 r12,r0,r11
	or	 r13,r13,lo16(_is_idstart)
	ld.bu	 r13,r12,r13
	bcnd.n	 ne0,r13,@L2495
	or	 r2,r0,r11
	addu	 r13,r24,16
	and	 r13,r13,0xfff0
	subu	 r31,r31,r13
	addu	 r25,r31,32
	or	 r4,r0,r24
	bsr.n	 _bcopy
	or	 r3,r0,r25
	or	 r3,r0,r23
	or.u	 r2,r0,hi16(@LC218)
	or	 r4,r0,r25
	or	 r2,r2,lo16(@LC218)
	st.b	 r0,r4,r24
	bsr.n	 _error
	addu	 r1,r1,@L2501
@L2502:
	align	 4
@L2495:
	or.u	 r3,r0,hi16(@LC219)
	or	 r4,r0,7
	bsr.n	 _strncmp
	or	 r3,r3,lo16(@LC219)
	bcnd.n	 ne0,r2,@L2494
	cmp	 r13,r24,7
	bb1.n	 ne,r13,@L2494
	or.u	 r2,r0,hi16(@LC220)
	or	 r3,r0,r23
	or	 r2,r2,lo16(@LC220)
@L2499:
	bsr	 _error
@L2494:
@Lte20:
	subu	 r31,r30,48
	ld	 r1,r31,52
	ld	 r30,r31,48
	ld	 r23,r31,36
	or	 r2,r0,r24
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64
	def	 @L2501,@L2494-@L2502

	align	 8
_compare_defs:
	subu	 r31,r31,80
	st	 r1,r31,64
	st	 r19,r31,36
	st.d	 r24,r31,56
	st.d	 r20,r31,40
	or	 r20,r0,r2
	st.d	 r22,r31,48
@Ltb21:
	or	 r19,r0,r3
	ld	 r13,r0,r20
	ld	 r12,r0,r19
	ld	 r23,r20,12
	cmp	 r13,r13,r12
	ld	 r22,r19,12
	bb1.n	 ne,r13,@L2533
	or	 r21,r0,1
	ld	 r2,r20,32
	bsr.n	 _strcmp
	ld	 r3,r19,32
	bcnd	 ne0,r2,@L2533
	ld	 r24,r20,28
	ld	 r25,r19,28
	cmp	 r13,r24,0
	cmp	 r12,r25,0
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L2534
	cmp	 r13,r24,r25
@L2523:
	ld	 r4,r24,8
	ld	 r13,r25,8
	cmp	 r13,r4,r13
	bb1.n	 ne,r13,@L2535
	or	 r2,r0,r23
	bsr.n	 _strncmp
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L2526
	ld	 r4,r24,8
@L2535:
	ld	 r6,r25,8
	or	 r2,r0,r21
	or	 r3,r0,r23
	or	 r5,r0,r22
	bsr.n	 _comp_def_part
	or	 r7,r0,0
	bcnd.n	 ne0,r2,@L2531
	or	 r2,r0,1
@L2526:
	ld	 r13,r24,12
	ld	 r12,r25,12
	cmp	 r13,r13,r12
	bb0.n	 eq,r13,@L2531
	or	 r2,r0,1
	ld	 r12,r24,4
	ld	 r13,r25,4
	and	 r12,r12,0xff00
	and	 r13,r13,0xff00
	cmp	 r12,r12,r13
	bb0	 eq,r12,@L2531
	ld	 r11,r24,8
	ld	 r24,r0,r24
	ld	 r10,r25,8
	ld	 r25,r0,r25
	cmp	 r13,r24,0
	cmp	 r12,r25,0
	or	 r21,r0,0
	or	 r13,r13,r12
	addu	 r23,r23,r11
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 ne0,r13,@L2523
	addu	 r22,r22,r10
	cmp	 r13,r24,r25
@L2534:
	bb0.n	 ne,r13,@L2529
	or	 r2,r0,r21
@L2533:
	br.n	 @L2531
	or	 r2,r0,1
	align	 4
@L2529:
	ld	 r13,r20,12
	ld	 r4,r20,4
	ld	 r12,r19,12
	ld	 r6,r19,4
	or	 r3,r0,r23
	or	 r5,r0,r22
	or	 r7,r0,1
	subu	 r13,r3,r13
	subu	 r12,r5,r12
	subu	 r4,r4,r13
	bsr.n	 _comp_def_part
	subu	 r6,r6,r12
	cmp	 r2,r2,0
	extu	 r2,r2,1<ne>
@L2531:
@Lte21:
	ld	 r1,r31,64
	ld	 r19,r31,36
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80

	align	 8
_comp_def_part:
@Ltb22:
	addu	 r13,r3,r4
	bcnd.n	 eq0,r2,@L2578
	addu	 r6,r5,r6
	cmp	 r9,r3,r13
	bb0.n	 ne,r9,@L2580
	or.u	 r9,r0,hi16(_is_space)
	or	 r8,r9,lo16(_is_space)
@L2583:
	ld.bu	 r9,r0,r3
	ld.bu	 r9,r9,r8
	bcnd	 eq0,r9,@L2580
	addu	 r3,r3,1
	cmp	 r9,r3,r13
	bb1	 ne,r9,@L2583
@L2580:
	cmp	 r9,r5,r6
	bb0.n	 ne,r9,@L2578
	or.u	 r9,r0,hi16(_is_space)
	or	 r8,r9,lo16(_is_space)
@L2588:
	ld.bu	 r9,r0,r5
	ld.bu	 r9,r9,r8
	bcnd	 eq0,r9,@L2578
	addu	 r5,r5,1
	cmp	 r9,r5,r6
	bb1	 ne,r9,@L2588
@L2578:
	bcnd.n	 eq0,r7,@L2589
	cmp	 r9,r3,r13
	bb0.n	 ne,r9,@L2591
	or.u	 r9,r0,hi16(_is_space)
	subu	 r7,r0,1
	or	 r8,r9,lo16(_is_space)
@L2594:
	ld.bu	 r9,r13,r7
	ld.bu	 r9,r9,r8
	bcnd	 eq0,r9,@L2591
	subu	 r13,r13,1
	cmp	 r9,r3,r13
	bb1	 ne,r9,@L2594
@L2591:
	cmp	 r9,r5,r6
	bb0.n	 ne,r9,@L2589
	or.u	 r9,r0,hi16(_is_space)
	subu	 r7,r0,1
	or	 r8,r9,lo16(_is_space)
@L2599:
	ld.bu	 r9,r6,r7
	ld.bu	 r9,r9,r8
	bcnd	 eq0,r9,@L2589
	subu	 r6,r6,1
	cmp	 r9,r5,r6
	bb1	 ne,r9,@L2599
@L2589:
	cmp	 r9,r3,r13
	cmp	 r8,r5,r6
	or	 r9,r9,r8
	extu	 r8,r9,1<eq>
	xor	 r9,r8,1
	bcnd.n	 eq0,r9,@L2601
	or.u	 r9,r0,hi16(_is_space)
	or	 r7,r9,lo16(_is_space)
@L2602:
	ld.bu	 r9,r0,r3
	ld.bu	 r9,r9,r7
	bcnd	 eq0,r9,@L2603
	ld.bu	 r9,r0,r5
	ld.bu	 r9,r9,r7
	bcnd.n	 eq0,r9,@L2603
	cmp	 r9,r3,r13
	bb0.n	 ne,r9,@L2624
	cmp	 r9,r5,r6
@L2608:
	ld.bu	 r9,r0,r3
	ld.bu	 r9,r9,r7
	bcnd	 eq0,r9,@L2605
	addu	 r3,r3,1
	cmp	 r9,r3,r13
	bb1	 ne,r9,@L2608
@L2605:
	cmp	 r9,r5,r6
@L2624:
	bb0.n	 ne,r9,@L2625
	cmp	 r9,r3,r13
	ld.bu	 r9,r0,r5
	ld.bu	 r9,r9,r7
	bcnd	 eq0,r9,@L2600
	addu	 r5,r5,1
	br.n	 @L2624
	cmp	 r9,r5,r6
	align	 4
@L2603:
	ld.bu	 r9,r0,r3
	ld.bu	 r8,r0,r5
	cmp	 r9,r9,r8
	bb0	 eq,r9,@L2601
	addu	 r3,r3,1
	addu	 r5,r5,1
@L2600:
	cmp	 r9,r3,r13
@L2625:
	cmp	 r8,r5,r6
	or	 r9,r9,r8
	extu	 r8,r9,1<eq>
	xor	 r9,r8,1
	bcnd	 ne0,r9,@L2602
@L2601:
	cmp	 r2,r3,r13
	cmp	 r9,r5,r6
	and	 r2,r2,r9
	extu	 r9,r2,1<eq>
	jmp.n	 r1
	xor	 r2,r9,1
@Lte22:

data
	align	 8
@LC221:
	string	 "`##' at start of macro definition\000"
	align	 8
@LC222:
	string	 "`##' at end of macro definition\000"
	align	 8
@LC223:
	string	 "`#' operator is not followed by a macro argument "
	string	 "name\000"
	align	 8
@LC224:
	string	 "macro argument `%.*s' is stringified.\000"
	align	 8
@LC225:
	string	 "macro arg `%.*s' would be stringified with -tradi"
	string	 "tional.\000"
	align	 8
@LC226:
	string	 "`#' operator should be followed by a macro argume"
	string	 "nt name\000"
text
	align	 8
_collect_expansion:
	subu	 r31,r31,144
	st	 r1,r31,80
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	st.d	 r18,r31,48
	st.d	 r16,r31,40
	st.d	 r14,r31,32
@Ltb23:
	st	 r3,r31,92
	or	 r24,r0,r2
	st	 r4,r31,100
	or	 r15,r0,0
	st	 r5,r31,108
	or	 r19,r0,0
	st	 r0,r31,116
	cmp	 r13,r3,r24
	bb0.n	 lo,r13,@L2758
	st	 r0,r31,124
	bsr	 _abort
	align	 4
@L2758:
	ld	 r9,r31,92
	or	 r25,r0,r24
	cmp	 r13,r25,r9
	ld	 r21,r31,92
	bb0.n	 lo,r13,@L2957
	or.u	 r13,r0,hi16(_is_space)
	subu	 r11,r0,1
	or	 r12,r13,lo16(_is_space)
@L2763:
	ld.bu	 r13,r21,r11
	ld.bu	 r13,r13,r12
	bcnd	 eq0,r13,@L2760
	subu	 r21,r21,1
	cmp	 r13,r25,r21
	bb1	 lo,r13,@L2763
@L2760:
	cmp	 r13,r25,r21
	bb0.n	 lo,r13,@L2765
	or.u	 r13,r0,hi16(_is_space)
	or	 r12,r13,lo16(_is_space)
@L2768:
	ld.bu	 r13,r0,r25
	ld.bu	 r13,r13,r12
	bcnd	 eq0,r13,@L2765
	addu	 r25,r25,1
	cmp	 r13,r25,r21
	bb1	 lo,r13,@L2768
@L2765:
	ld	 r9,r31,92
@L2957:
	subu	 r13,r25,r24
	mak	 r13,r13,0<1>
	subu	 r12,r9,r21
	addu	 r13,r13,36
	lda.h	 r12,r13[r12]
	subu	 r13,r21,r25
	addu	 r12,r12,r13
	addu	 r12,r12,3
	st	 r12,r31,132
	ld	 r3,r31,132
	bsr.n	 _xcalloc
	or	 r2,r0,1
	ld	 r9,r31,100
	or	 r14,r0,r2
	or	 r25,r0,r24
	st	 r9,r0,r14
	addu	 r13,r14,36
	st	 r13,r14,12
	or	 r24,r0,r13
	cmp	 r13,r25,r21
	bb0.n	 lo,r13,@L2770
	or	 r16,r0,r24
	or.u	 r13,r0,hi16(_is_space)
	or	 r11,r0,10
	or	 r12,r13,lo16(_is_space)
@L2773:
	ld.bu	 r13,r0,r25
	ld.bu	 r13,r13,r12
	bcnd	 eq0,r13,@L2770
	st.b	 r11,r0,r24
	ld.bu	 r13,r0,r25
	addu	 r24,r24,1
	addu	 r25,r25,1
	st.b	 r13,r0,r24
	cmp	 r13,r25,r21
	bb1.n	 lo,r13,@L2773
	addu	 r24,r24,1
@L2770:
	subu	 r13,r21,r25
	cmp	 r13,r13,1
	bb0	 gt,r13,@L2774
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,35
	bb1.n	 ne,r13,@L2948
	cmp	 r13,r25,r21
	ld.bu	 r13,r25,1
	cmp	 r13,r13,35
	bb1.n	 ne,r13,@L2948
	cmp	 r13,r25,r21
	or.u	 r2,r0,hi16(@LC221)
	or	 r2,r2,lo16(@LC221)
	bsr.n	 _error
	addu	 r25,r25,2
@L2774:
	cmp	 r13,r25,r21
@L2948:
	bb0.n	 lo,r13,@L2776
	or.u	 r13,r0,hi16(_is_hor_space)
	subu	 r17,r0,1
@L2777:
	ld.bu	 r18,r0,r25
	or.u	 r9,r0,hi16(_traditional)
	st.b	 r18,r0,r24
	ld	 r13,r9,lo16(_traditional)
	addu	 r25,r25,1
	addu	 r24,r24,1
	bcnd.n	 ne0,r13,@L2778
	st	 r0,r31,140
	mask	 r12,r18,0xff
	cmp	 r13,r12,35
	bb0	 ne,r13,@L2789
	bb1.n	 gt,r13,@L2820
	cmp	 r13,r12,39
	cmp	 r13,r12,34
	bb0	 ne,r13,@L2781
	br	 @L2821
	align	 4
@L2820:
	bb0.n	 ne,r13,@L2781
	cmp	 r13,r12,92
	bb0.n	 ne,r13,@L2785
	cmp	 r13,r25,r21
	br	 @L2821
	align	 4
@L2781:
	bcnd.n	 ne0,r19,@L2949
	mask	 r13,r18,0xff
	br.n	 @L2821
	mask	 r19,r18,0xff
	align	 4
@L2785:
	bb0	 lo,r13,@L2786
	ld.bu	 r11,r0,r25
	mask	 r13,r11,0xff
	cmp	 r12,r19,0
	cmp	 r13,r13,35
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L2786
	subu	 r24,r24,1
	addu	 r25,r25,1
	st.b	 r11,r0,r24
	br.n	 @L2821
	addu	 r24,r24,1
	align	 4
@L2786:
	cmp	 r13,r25,r21
	cmp	 r12,r19,0
	rot	 r11,r12,24
	and.c	 r12,r13,r11
	extu	 r12,r12,1<lo>
	bcnd	 eq0,r12,@L2821
	ld.bu	 r13,r0,r25
	addu	 r25,r25,1
	st.b	 r13,r0,r24
	br.n	 @L2821
	addu	 r24,r24,1
	align	 4
@L2789:
	bcnd.n	 ne0,r19,@L2821
	cmp	 r13,r25,r21
	bb0	 lo,r13,@L2791
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,35
	bb1.n	 ne,r13,@L2950
	or.u	 r9,r0,hi16(_is_hor_space)
	br.n	 @L2951
	subu	 r24,r24,1
	align	 4
@L2796:
	ld.bu	 r13,r24,r17
	or	 r9,r9,lo16(_is_hor_space)
	ld.bu	 r13,r13,r9
	bcnd	 eq0,r13,@L2793
	subu	 r24,r24,1
@L2951:
	cmp	 r13,r24,r16
	bb1.n	 hi,r13,@L2796
	or.u	 r9,r0,hi16(_is_hor_space)
@L2793:
	addu	 r25,r25,1
	or.u	 r9,r0,hi16(_is_hor_space)
	ld.bu	 r13,r0,r25
	or	 r9,r9,lo16(_is_hor_space)
	ld.bu	 r13,r13,r9
	bcnd.n	 eq0,r13,@L2798
	or.u	 r13,r0,hi16(_is_hor_space)
	or	 r12,r13,lo16(_is_hor_space)
	addu	 r25,r25,1
@L2952:
	ld.bu	 r13,r0,r25
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L2952
	addu	 r25,r25,1
	subu	 r25,r25,1
@L2798:
	cmp	 r13,r25,r21
	bb0.n	 eq,r13,@L2821
	st	 r25,r31,116
	or.u	 r2,r0,hi16(@LC222)
	or	 r2,r2,lo16(@LC222)
	bsr.n	 _error
	addu	 r1,r1,@L2958
@L2959:
	align	 4
@L2791:
	or.u	 r9,r0,hi16(_is_hor_space)
@L2950:
	ld.bu	 r13,r0,r25
	or	 r9,r9,lo16(_is_hor_space)
	ld.bu	 r13,r13,r9
	bcnd.n	 eq0,r13,@L2808
	subu	 r24,r24,1
	or.u	 r13,r0,hi16(_is_hor_space)
	or	 r12,r13,lo16(_is_hor_space)
	addu	 r25,r25,1
@L2953:
	ld.bu	 r13,r0,r25
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L2953
	addu	 r25,r25,1
	subu	 r25,r25,1
@L2808:
	cmp	 r13,r25,r21
	bb0	 ne,r13,@L2816
	ld.bu	 r12,r0,r25
	or.u	 r13,r0,hi16(_is_idstart)
	ld	 r9,r31,100
	or	 r13,r13,lo16(_is_idstart)
	ld.bu	 r12,r12,r13
	cmp	 r13,r9,0
	cmp	 r12,r12,0
	rot	 r11,r13,2
	or.c	 r13,r12,r11
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L2815
@L2816:
	or.u	 r2,r0,hi16(@LC223)
	or	 r2,r2,lo16(@LC223)
	bsr.n	 _error
	addu	 r1,r1,@L2960
@L2961:
	align	 4
@L2815:
	br.n	 @L2821
	st	 r25,r31,124
	align	 4
@L2778:
	mask	 r12,r18,0xff
	cmp	 r13,r12,39
	bb0	 ne,r13,@L2824
	bb1.n	 gt,r13,@L2841
	cmp	 r13,r12,47
	cmp	 r13,r12,34
	bb0	 ne,r13,@L2824
	br	 @L2821
	align	 4
@L2841:
	bb0.n	 ne,r13,@L2831
	cmp	 r13,r12,92
	bb0.n	 ne,r13,@L2828
	cmp	 r13,r19,0
	br	 @L2821
	align	 4
@L2824:
	bcnd.n	 eq0,r19,@L2825
	mask	 r13,r18,0xff
@L2949:
	cmp	 r13,r13,r19
	ext	 r13,r13,1<ne>
	br.n	 @L2821
	and	 r19,r19,r13
	align	 4
@L2825:
	br.n	 @L2821
	mask	 r19,r18,0xff
	align	 4
@L2828:
	cmp	 r12,r25,r21
	rot	 r11,r13,24
	and.c	 r13,r12,r11
	extu	 r13,r13,1<lo>
	bcnd	 eq0,r13,@L2821
	ld.bu	 r11,r0,r25
	mask	 r12,r11,0xff
	cmp	 r13,r12,r19
	bb0.n	 ne,r13,@L2830
	cmp	 r13,r12,92
	bb0	 eq,r13,@L2821
@L2830:
	st.b	 r11,r0,r24
	addu	 r25,r25,1
	br.n	 @L2775
	addu	 r24,r24,1
	align	 4
@L2831:
	bcnd	 ne0,r19,@L2821
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,42
	bb0	 eq,r13,@L2821
	addu	 r25,r25,1
	cmp	 r11,r25,r21
	bb0.n	 lo,r11,@L2821
	subu	 r24,r24,1
	subu	 r13,r21,r25
	subu	 r10,r0,2
	bb1.n	 ge,r11,@L2945
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L2838
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L2945
	cmp	 r13,r12,2
	bb0	 gt,r13,@L2946
	br	 @L2947
	align	 4
@L2838:
	ld.bu	 r13,r25,r10
	cmp	 r13,r13,42
	bb1	 ne,r13,@L2924
	ld.bu	 r13,r25,r17
	cmp	 r13,r13,47
	bb0	 ne,r13,@L2821
@L2924:
	addu	 r25,r25,1
@L2947:
	ld.bu	 r13,r25,r10
	cmp	 r13,r13,42
	bb1	 ne,r13,@L2927
	ld.bu	 r13,r25,r17
	cmp	 r13,r13,47
	bb0	 ne,r13,@L2821
@L2927:
	addu	 r25,r25,1
@L2946:
	ld.bu	 r13,r25,r10
	cmp	 r13,r13,42
	bb1	 ne,r13,@L2930
	ld.bu	 r13,r25,r17
	cmp	 r13,r13,47
	bb0	 ne,r13,@L2821
@L2930:
	addu	 r25,r25,1
@L2945:
	ld.bu	 r13,r25,r10
	cmp	 r13,r13,42
	bb1	 ne,r13,@L2933
	ld.bu	 r13,r25,r17
	cmp	 r13,r13,47
	bb0	 ne,r13,@L2821
@L2933:
	addu	 r25,r25,1
	cmp	 r13,r25,r21
	bb1	 lo,r13,@L2838
@L2821:
	ld	 r9,r31,100
	or.u	 r13,r0,hi16(_is_idchar)
	mask	 r12,r18,0xff
	or	 r10,r13,lo16(_is_idchar)
	ld.bu	 r13,r12,r10
	cmp	 r12,r9,0
	cmp	 r13,r13,0
	rot	 r11,r13,30
	and.c	 r13,r12,r11
	extu	 r13,r13,1<gt>
	bcnd.n	 eq0,r13,@L2954
	cmp	 r13,r25,r21
	subu	 r24,r24,1
	bb0.n	 ne,r13,@L2844
	subu	 r20,r25,1
	or	 r12,r0,r10
@L2847:
	ld.bu	 r13,r0,r25
	ld.bu	 r13,r13,r12
	bcnd	 eq0,r13,@L2844
	addu	 r25,r25,1
	cmp	 r13,r25,r21
	bb1	 ne,r13,@L2847
@L2844:
	or.u	 r13,r0,hi16(_is_idstart)
	mask	 r12,r18,0xff
	or	 r13,r13,lo16(_is_idstart)
	ld.bu	 r13,r12,r13
	bcnd.n	 eq0,r13,@L2848
	subu	 r22,r25,r20
	ld	 r23,r31,108
	bcnd	 eq0,r23,@L2848
@L2852:
	ld	 r2,r23,4
	ld.bu	 r13,r0,r2
	mask	 r12,r18,0xff
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L2851
	ld	 r13,r23,8
	cmp	 r13,r13,r22
	bb1.n	 ne,r13,@L2851
	or	 r3,r0,r20
	bsr.n	 _strncmp
	or	 r4,r0,r22
	bcnd	 ne0,r2,@L2851
	bcnd.n	 eq0,r19,@L2854
	or.u	 r13,r0,hi16(_warn_stringify)
	ld	 r13,r13,lo16(_warn_stringify)
	bcnd.n	 eq0,r13,@L2854
	or.u	 r9,r0,hi16(_traditional)
	ld	 r13,r9,lo16(_traditional)
	bcnd	 eq0,r13,@L2855
	ld	 r4,r23,4
	or.u	 r2,r0,hi16(@LC224)
	or	 r3,r0,r22
	br.n	 @L2944
	or	 r2,r2,lo16(@LC224)
	align	 4
@L2855:
	ld	 r4,r23,4
	or.u	 r2,r0,hi16(@LC225)
	or	 r3,r0,r22
	or	 r2,r2,lo16(@LC225)
@L2944:
	bsr	 _warning
@L2854:
	or.u	 r9,r0,hi16(_traditional)
	cmp	 r12,r19,0
	ld	 r13,r9,lo16(_traditional)
	extu	 r22,r12,1<ne>
	cmp	 r13,r13,0
	extu	 r13,r13,1<eq>
	and	 r13,r13,r22
	bcnd	 ne0,r13,@L2848
	bsr.n	 _xmalloc
	or	 r2,r0,16
	st	 r0,r0,r2
	ld	 r9,r31,116
	cmp	 r13,r9,r20
	st.b	 r0,r2,6
	extu	 r13,r13,1<eq>
	st.b	 r13,r2,5
	ld.bu	 r13,r23,16
	or.u	 r9,r0,hi16(_traditional)
	st.b	 r13,r2,7
	ld	 r13,r9,lo16(_traditional)
	bcnd.n	 ne0,r13,@L2859
	or	 r13,r0,r22
	ld	 r9,r31,124
	cmp	 r13,r9,r20
	extu	 r13,r13,1<eq>
@L2859:
	bcnd.n	 ne0,r15,@L2860
	st.b	 r13,r2,4
	br.n	 @L2861
	st	 r2,r14,28
	align	 4
@L2860:
	st	 r2,r0,r15
@L2861:
	ld	 r13,r23,12
	st	 r13,r2,12
	subu	 r13,r24,r16
	st	 r13,r2,8
	or.u	 r9,r0,hi16(_is_hor_space)
	ld.bu	 r13,r0,r25
	or	 r9,r9,lo16(_is_hor_space)
	ld.bu	 r13,r13,r9
	or	 r15,r0,r2
	bcnd.n	 eq0,r13,@L2863
	or	 r12,r0,r25
	or.u	 r13,r0,hi16(_is_hor_space)
	or	 r11,r13,lo16(_is_hor_space)
	addu	 r12,r12,1
@L2955:
	ld.bu	 r13,r0,r12
	ld.bu	 r13,r13,r11
	bcnd.n	 ne0,r13,@L2955
	addu	 r12,r12,1
	subu	 r12,r12,1
@L2863:
	addu	 r13,r12,2
	cmp	 r13,r13,r21
	bb0	 ls,r13,@L2870
	ld.bu	 r13,r0,r12
	cmp	 r13,r13,35
	bb1	 ne,r13,@L2870
	ld.bu	 r13,r12,1
	cmp	 r13,r13,35
	bb1.n	 ne,r13,@L2956
	or	 r9,r0,1
	or	 r13,r0,1
	st.b	 r13,r2,6
@L2870:
	or	 r9,r0,1
@L2956:
	st	 r9,r31,140
	br.n	 @L2848
	or	 r16,r0,r24
	align	 4
@L2851:
	ld	 r23,r0,r23
	bcnd	 ne0,r23,@L2852
@L2848:
	ld	 r9,r31,140
	bcnd.n	 ne0,r9,@L2954
	cmp	 r13,r25,r21
	or	 r10,r0,r25
	or	 r25,r0,r20
	cmp	 r11,r25,r10
	bb0.n	 ne,r11,@L2874
	subu	 r13,r10,r25
	bb1.n	 ge,r11,@L2891
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L2875
	cmp	 r13,r12,1
	bb1.n	 le,r13,@L2891
	cmp	 r13,r12,2
	bb1	 le,r13,@L2892
	ld.bu	 r13,r0,r25
	addu	 r25,r25,1
	st.b	 r13,r0,r24
	addu	 r24,r24,1
@L2892:
	ld.bu	 r13,r0,r25
	addu	 r25,r25,1
	st.b	 r13,r0,r24
	addu	 r24,r24,1
@L2891:
	ld.bu	 r13,r0,r25
	addu	 r25,r25,1
	st.b	 r13,r0,r24
	cmp	 r13,r25,r10
	bb0.n	 ne,r13,@L2874
	addu	 r24,r24,1
@L2875:
	ld.bu	 r13,r0,r25
	st.b	 r13,r0,r24
	ld.bu	 r13,r25,1
	st.b	 r13,r24,1
	ld.bu	 r13,r25,2
	st.b	 r13,r24,2
	ld.bu	 r13,r25,3
	addu	 r25,r25,4
	st.b	 r13,r24,3
	cmp	 r13,r25,r10
	bb1.n	 ne,r13,@L2875
	addu	 r24,r24,4
@L2874:
	ld	 r9,r31,124
	cmp	 r13,r9,r20
	bb1.n	 ne,r13,@L2954
	cmp	 r13,r25,r21
	or.u	 r2,r0,hi16(@LC226)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC226)
@L2775:
	cmp	 r13,r25,r21
@L2954:
	bb1	 lo,r13,@L2777
@L2776:
	ld	 r9,r31,92
	cmp	 r13,r21,r9
	bb0.n	 lo,r13,@L2879
	or.u	 r13,r0,hi16(_is_space)
	or	 r11,r0,10
	or	 r12,r13,lo16(_is_space)
@L2884:
	ld.bu	 r13,r0,r21
	ld.bu	 r13,r13,r12
	bcnd	 eq0,r13,@L2885
	st.b	 r11,r0,r24
	ld.bu	 r13,r0,r21
	addu	 r24,r24,1
	st.b	 r13,r0,r24
	ld	 r9,r31,92
	addu	 r21,r21,1
	cmp	 r13,r21,r9
	bb0.n	 lo,r13,@L2885
	addu	 r24,r24,1
	br	 @L2884
	align	 4
@L2879:
	or.u	 r13,r0,hi16(_traditional)
	ld	 r13,r13,lo16(_traditional)
	cmp	 r12,r19,0
	cmp	 r13,r13,0
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L2885
	or	 r13,r0,10
	st.b	 r13,r0,r24
	addu	 r24,r24,1
	or	 r13,r0,32
	st.b	 r13,r0,r24
	addu	 r24,r24,1
@L2885:
	st.b	 r0,r0,r24
	ld	 r12,r14,12
	subu	 r12,r24,r12
	ld	 r9,r31,132
	addu	 r13,r12,1
	cmp	 r13,r13,r9
	bb0.n	 gt,r13,@L2887
	st	 r12,r14,4
	bsr	 _abort
	align	 4
@L2887:
@Lte23:
	ld	 r1,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	or	 r2,r0,r14
	ld.d	 r14,r31,32
	jmp.n	 r1
	addu	 r31,r31,144
	def	 @L2960,@L2821-@L2961
	def	 @L2958,@L2821-@L2959

data
	align	 8
@LC227:
	string	 "ANSI C does not allow `#assert'\000"
	align	 8
@LC228:
	string	 "assertion\000"
	align	 8
@LC229:
	string	 "missing token-sequence in `#assert'\000"
	align	 8
@LC230:
	string	 "empty token-sequence in `#assert'\000"
	align	 8
@LC231:
	string	 "defined\000"
	align	 8
@LC232:
	string	 "`defined' redefined as assertion\000"
text
	align	 8
_do_assert:
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	subu	 r31,r31,80
	st	 r1,r31,64
	st.d	 r24,r31,56
	or	 r25,r0,r2
	st.d	 r22,r31,48
	or	 r22,r0,r3
	bcnd.n	 eq0,r13,@L2998
	st	 r21,r31,44
@Ltb24:
	or.u	 r13,r0,hi16(_done_initializing)
	ld	 r13,r13,lo16(_done_initializing)
	bcnd.n	 eq0,r13,@L2998
	or.u	 r13,r0,hi16(_indepth)
	ld	 r12,r13,lo16(_indepth)
	mul	 r12,r12,44
	or.u	 r13,r0,hi16(_instack)
	or	 r13,r13,lo16(_instack)
	addu	 r12,r12,r13
	ld.b	 r13,r12,40
	bcnd	 ne0,r13,@L2998
	or.u	 r2,r0,hi16(@LC227)
	bsr.n	 _pedwarn
	or	 r2,r2,lo16(@LC227)
@L2998:
	st	 r25,r31,72
	or.u	 r13,r0,hi16(_is_hor_space)
	ld.bu	 r12,r0,r25
	or	 r11,r13,lo16(_is_hor_space)
	ld.bu	 r13,r12,r11
	bcnd.n	 eq0,r13,@L3038
	or.u	 r3,r0,hi16(@LC228)
@L3001:
	ld	 r12,r31,72
	addu	 r13,r12,1
	st	 r13,r31,72
	ld.bu	 r13,r12,1
	ld.bu	 r13,r13,r11
	bcnd.n	 ne0,r13,@L3001
	or.u	 r3,r0,hi16(@LC228)
@L3038:
	ld	 r23,r31,72
	or	 r3,r3,lo16(@LC228)
	bsr.n	 _check_macro_name
	or	 r2,r0,r23
	ld	 r13,r31,72
	or	 r24,r0,r2
	addu	 r13,r13,r24
	st	 r13,r31,72
	or.u	 r12,r0,hi16(_is_hor_space)
	ld.bu	 r13,r0,r13
	or	 r12,r12,lo16(_is_hor_space)
	ld.bu	 r13,r13,r12
	bcnd	 eq0,r13,@L3004
	or	 r11,r0,r12
@L3008:
	ld	 r12,r31,72
	addu	 r13,r12,1
	st	 r13,r31,72
	ld.bu	 r13,r12,1
	ld.bu	 r13,r13,r11
	bcnd	 ne0,r13,@L3008
@L3004:
	ld	 r12,r31,72
	ld.bu	 r13,r0,r12
	cmp	 r13,r13,40
	bb0.n	 ne,r13,@L3011
	or.u	 r2,r0,hi16(@LC229)
	br.n	 @L3037
	or	 r2,r2,lo16(@LC229)
	align	 4
@L3011:
	st	 r0,r31,76
	addu	 r13,r12,1
	st	 r13,r31,72
	or.u	 r13,r0,hi16(_is_hor_space)
	ld.bu	 r12,r12,1
	or	 r11,r13,lo16(_is_hor_space)
	ld.bu	 r13,r12,r11
	bcnd.n	 eq0,r13,@L3039
	addu	 r2,r31,72
@L3017:
	ld	 r12,r31,72
	addu	 r13,r12,1
	st	 r13,r31,72
	ld.bu	 r13,r12,1
	ld.bu	 r13,r13,r11
	bcnd.n	 ne0,r13,@L3017
	addu	 r2,r31,72
@L3039:
	or	 r3,r0,r22
	bsr.n	 _read_token_list
	addu	 r4,r31,76
	ld	 r13,r31,76
	bcnd.n	 eq0,r13,@L3020
	or	 r21,r0,r2
	br.n	 @L3032
	or	 r2,r0,1
	align	 4
@L3020:
	bcnd.n	 ne0,r21,@L3021
	or.u	 r2,r0,hi16(@LC230)
	or	 r2,r2,lo16(@LC230)
@L3037:
	bsr	 _error
	br.n	 @L3032
	or	 r2,r0,1
	align	 4
@L3021:
	ld	 r12,r31,72
	addu	 r13,r12,1
	st	 r13,r31,72
	or.u	 r13,r0,hi16(_is_hor_space)
	ld.bu	 r12,r12,1
	or	 r11,r13,lo16(_is_hor_space)
	ld.bu	 r13,r12,r11
	bcnd.n	 eq0,r13,@L3040
	or	 r2,r0,r23
@L3027:
	ld	 r12,r31,72
	addu	 r13,r12,1
	st	 r13,r31,72
	ld.bu	 r13,r12,1
	ld.bu	 r13,r13,r11
	bcnd.n	 ne0,r13,@L3027
	or	 r2,r0,r23
@L3040:
	or	 r3,r0,r24
	bsr.n	 _hashf
	or	 r4,r0,37
	or	 r22,r0,r2
	bsr.n	 _xmalloc
	or	 r2,r0,8
	or	 r25,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r24
	bsr.n	 _assertion_lookup
	or	 r4,r0,r22
	or	 r12,r0,r2
	bcnd.n	 ne0,r12,@L3030
	cmp	 r13,r24,7
	bb0.n	 eq,r13,@L3041
	or	 r2,r0,r23
	or.u	 r3,r0,hi16(@LC231)
	or	 r4,r0,7
	bsr.n	 _strncmp
	or	 r3,r3,lo16(@LC231)
	bcnd.n	 ne0,r2,@L3031
	or.u	 r2,r0,hi16(@LC232)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC232)
@L3031:
	or	 r2,r0,r23
@L3041:
	or	 r3,r0,r24
	bsr.n	 _assertion_install
	or	 r4,r0,r22
	or	 r12,r0,r2
@L3030:
	st	 r21,r25,4
	ld	 r13,r12,20
	st	 r13,r0,r25
	or	 r2,r0,0
	st	 r25,r12,20
@L3032:
@Lte24:
	ld	 r1,r31,64
	ld	 r21,r31,44
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	jmp.n	 r1
	addu	 r31,r31,80

data
	align	 8
@LC233:
	string	 "ANSI C does not allow `#unassert'\000"
	align	 8
@LC234:
	string	 "assertion\000"
	align	 8
@LC235:
	string	 "empty token list in `#unassert'\000"
text
	align	 8
_do_unassert:
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	subu	 r31,r31,80
	st.d	 r24,r31,56
	or	 r25,r0,r2
	st.d	 r22,r31,48
	or	 r22,r0,r3
	st	 r21,r31,44
	or	 r21,r0,0
	or	 r23,r0,0
	bcnd.n	 eq0,r13,@L3092
	st	 r1,r31,64
@Ltb25:
	or.u	 r13,r0,hi16(_done_initializing)
	ld	 r13,r13,lo16(_done_initializing)
	bcnd.n	 eq0,r13,@L3092
	or.u	 r13,r0,hi16(_indepth)
	ld	 r12,r13,lo16(_indepth)
	mul	 r12,r12,44
	or.u	 r13,r0,hi16(_instack)
	or	 r13,r13,lo16(_instack)
	addu	 r12,r12,r13
	ld.b	 r13,r12,40
	bcnd	 ne0,r13,@L3092
	or.u	 r2,r0,hi16(@LC233)
	bsr.n	 _pedwarn
	or	 r2,r2,lo16(@LC233)
@L3092:
	st	 r25,r31,72
	or.u	 r13,r0,hi16(_is_hor_space)
	ld.bu	 r12,r0,r25
	or	 r11,r13,lo16(_is_hor_space)
	ld.bu	 r13,r12,r11
	bcnd.n	 eq0,r13,@L3149
	or.u	 r3,r0,hi16(@LC234)
@L3095:
	ld	 r12,r31,72
	addu	 r13,r12,1
	st	 r13,r31,72
	ld.bu	 r13,r12,1
	ld.bu	 r13,r13,r11
	bcnd.n	 ne0,r13,@L3095
	or.u	 r3,r0,hi16(@LC234)
@L3149:
	ld	 r24,r31,72
	or	 r3,r3,lo16(@LC234)
	bsr.n	 _check_macro_name
	or	 r2,r0,r24
	ld	 r13,r31,72
	or	 r25,r0,r2
	addu	 r13,r13,r25
	st	 r13,r31,72
	or.u	 r12,r0,hi16(_is_hor_space)
	ld.bu	 r13,r0,r13
	or	 r12,r12,lo16(_is_hor_space)
	ld.bu	 r13,r13,r12
	bcnd	 eq0,r13,@L3098
	or	 r11,r0,r12
@L3102:
	ld	 r12,r31,72
	addu	 r13,r12,1
	st	 r13,r31,72
	ld.bu	 r13,r12,1
	ld.bu	 r13,r13,r11
	bcnd	 ne0,r13,@L3102
@L3098:
	ld	 r12,r31,72
	ld.bu	 r13,r0,r12
	cmp	 r13,r13,40
	bb1.n	 ne,r13,@L3150
	or	 r2,r0,r24
	st	 r0,r31,76
	addu	 r13,r12,1
	st	 r13,r31,72
	or.u	 r13,r0,hi16(_is_hor_space)
	ld.bu	 r12,r12,1
	or	 r11,r13,lo16(_is_hor_space)
	ld.bu	 r13,r12,r11
	bcnd.n	 eq0,r13,@L3151
	addu	 r2,r31,72
@L3111:
	ld	 r12,r31,72
	addu	 r13,r12,1
	st	 r13,r31,72
	ld.bu	 r13,r12,1
	ld.bu	 r13,r13,r11
	bcnd.n	 ne0,r13,@L3111
	addu	 r2,r31,72
@L3151:
	or	 r3,r0,r22
	bsr.n	 _read_token_list
	addu	 r4,r31,76
	ld	 r13,r31,76
	bcnd.n	 ne0,r13,@L3148
	or	 r21,r0,r2
	bcnd.n	 ne0,r21,@L3115
	or.u	 r2,r0,hi16(@LC235)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC235)
@L3148:
	br.n	 @L3140
	or	 r2,r0,1
	align	 4
@L3115:
	ld	 r12,r31,72
	addu	 r13,r12,1
	st	 r13,r31,72
	or.u	 r13,r0,hi16(_is_hor_space)
	ld.bu	 r12,r12,1
	or	 r11,r13,lo16(_is_hor_space)
	ld.bu	 r13,r12,r11
	bcnd.n	 eq0,r13,@L3105
	or	 r23,r0,1
@L3121:
	ld	 r12,r31,72
	addu	 r13,r12,1
	st	 r13,r31,72
	ld.bu	 r13,r12,1
	ld.bu	 r13,r13,r11
	bcnd	 ne0,r13,@L3121
@L3105:
	or	 r2,r0,r24
@L3150:
	or	 r3,r0,r25
	bsr.n	 _hashf
	or	 r4,r0,37
	or	 r4,r0,r2
	or	 r2,r0,r24
	bsr.n	 _assertion_lookup
	or	 r3,r0,r25
	or	 r22,r0,r2
	bcnd	 eq0,r22,@L3148
	bcnd	 ne0,r23,@L3125
	ld	 r24,r22,20
	bcnd.n	 eq0,r24,@L3152
	or	 r2,r0,r22
@L3129:
	ld	 r2,r24,4
	bsr.n	 _free_token_list
	ld	 r25,r0,r24
	or	 r2,r0,r24
	bsr.n	 _free
	or	 r24,r0,r25
	bcnd.n	 ne0,r24,@L3129
	or	 r2,r0,r22
@L3152:
	bsr.n	 _delete_assertion
	addu	 r1,r1,@L3153
@L3154:
	align	 4
@L3125:
	ld	 r24,r22,20
	bcnd.n	 eq0,r24,@L3131
	or	 r23,r0,0
@L3134:
	ld	 r2,r24,4
	or	 r3,r0,r21
	bsr.n	 _compare_token_lists
	ld	 r25,r0,r24
	bcnd	 eq0,r2,@L3135
	bcnd	 eq0,r23,@L3136
	st	 r25,r0,r23
	br	 @L3137
	align	 4
@L3136:
	ld	 r13,r0,r24
	st	 r13,r22,20
@L3137:
	bsr.n	 _free_token_list
	ld	 r2,r24,4
	or	 r2,r0,r24
	bsr.n	 _free
	addu	 r1,r1,@L3155
@L3156:
	align	 4
@L3135:
	or	 r23,r0,r24
@L3138:
	or	 r24,r0,r25
	bcnd	 ne0,r24,@L3134
@L3131:
	or	 r2,r0,0
@L3140:
@Lte25:
	ld	 r1,r31,64
	ld	 r21,r31,44
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	jmp.n	 r1
	addu	 r31,r31,80
	def	 @L3155,@L3138-@L3156
	def	 @L3153,@L3131-@L3154

data
	align	 8
@LC236:
	string	 "ANSI C does not allow testing assertions\000"
text
	align	 8
	global	 _check_assertion
_check_assertion:
	subu	 r31,r31,80
	st	 r1,r31,64
	st	 r21,r31,44
	st.d	 r24,r31,56
	st.d	 r22,r31,48
@Ltb26:
	or	 r25,r0,r2
	or	 r24,r0,r3
	or	 r21,r0,r4
	or	 r4,r0,37
	bsr.n	 _hashf
	or	 r22,r0,r5
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	bcnd.n	 eq0,r13,@L3167
	or	 r23,r0,r2
	or.u	 r13,r0,hi16(_indepth)
	ld	 r12,r13,lo16(_indepth)
	mul	 r12,r12,44
	or.u	 r13,r0,hi16(_instack)
	or	 r13,r13,lo16(_instack)
	addu	 r12,r12,r13
	ld.b	 r13,r12,40
	bcnd.n	 ne0,r13,@L3167
	or.u	 r2,r0,hi16(@LC236)
	bsr.n	 _pedwarn
	or	 r2,r2,lo16(@LC236)
@L3167:
	or	 r2,r0,r25
	or	 r3,r0,r24
	bsr.n	 _assertion_lookup
	or	 r4,r0,r23
	bcnd	 eq0,r2,@L3171
	bcnd	 ne0,r21,@L3169
@L3178:
	br.n	 @L3175
	or	 r2,r0,1
	align	 4
@L3169:
	ld	 r25,r2,20
	bcnd.n	 eq0,r25,@L3175
	or	 r2,r0,0
@L3172:
	ld	 r2,r25,4
	bsr.n	 _compare_token_lists
	or	 r3,r0,r22
	bcnd	 ne0,r2,@L3178
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L3172
@L3171:
	or	 r2,r0,0
@L3175:
@Lte26:
	ld	 r1,r31,64
	ld	 r21,r31,44
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	jmp.n	 r1
	addu	 r31,r31,80

	align	 8
_compare_token_lists:
	subu	 r31,r31,64
	st.d	 r24,r31,40
	or	 r25,r0,r2
	or	 r24,r0,r3
	cmp	 r13,r25,0
	cmp	 r12,r24,0
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L3188
	st	 r1,r31,48
@Ltb27:
@L3189:
	ld	 r4,r25,8
	ld	 r13,r24,8
	cmp	 r13,r4,r13
	bb0.n	 eq,r13,@L3193
	or	 r2,r0,0
	ld	 r2,r25,4
	bsr.n	 _strncmp
	ld	 r3,r24,4
	bcnd.n	 ne0,r2,@L3193
	or	 r2,r0,0
	ld	 r25,r0,r25
	ld	 r24,r0,r24
	cmp	 r13,r25,0
	cmp	 r12,r24,0
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd	 ne0,r13,@L3189
@L3188:
	cmp	 r2,r25,r24
	extu	 r2,r2,1<eq>
@L3193:
@Lte27:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

data
	align	 8
@LC237:
	string	 "unterminated token sequence in `#assert' or `#una"
	string	 "ssert'\000"
text
	align	 8
_read_token_list:
	subu	 r31,r31,96
	st	 r1,r31,80
	st.d	 r24,r31,72
	or.u	 r13,r0,hi16(_is_hor_space)
	st.d	 r16,r31,40
	or	 r16,r0,r2
	st.d	 r20,r31,56
	or	 r21,r0,r3
	st.d	 r22,r31,64
	or	 r17,r0,r4
	st.d	 r18,r31,48
@Ltb28:
	or	 r20,r0,0
	ld	 r23,r0,r16
	or	 r22,r0,1
	or	 r18,r13,lo16(_is_hor_space)
	st	 r0,r0,r17
@L3230:
	st	 r0,r31,88
	ld.bu	 r9,r0,r23
	mask	 r12,r9,0xff
	cmp	 r13,r12,40
	bb1.n	 ne,r13,@L3231
	or	 r19,r0,r23
	addu	 r23,r23,1
	br.n	 @L3232
	addu	 r22,r22,1
	align	 4
@L3231:
	cmp	 r13,r12,41
	bb1.n	 ne,r13,@L3233
	cmp	 r10,r12,34
	subu	 r22,r22,1
	bcnd	 eq0,r22,@L3229
	addu	 r23,r23,1
	br	 @L3232
	align	 4
@L3233:
	cmp	 r11,r12,39
	or	 r13,r10,r11
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L3236
	or	 r2,r0,r23
	or	 r3,r0,r21
	or	 r4,r0,0
	or	 r5,r0,0
	or	 r6,r0,0
	bsr.n	 _skip_quoted_string
	addu	 r7,r31,88
	br.n	 @L3232
	or	 r23,r0,r2
	align	 4
@L3236:
	ld.bu	 r13,r12,r18
	bcnd.n	 ne0,r13,@L3232
	subu	 r13,r9,40
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb0.n	 hi,r13,@L3232
	or	 r13,r10,r11
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L3232
	cmp	 r13,r23,r21
@L3262:
	bb0	 ne,r13,@L3232
	addu	 r23,r23,1
	ld.bu	 r11,r0,r23
	mask	 r12,r11,0xff
	ld.bu	 r13,r12,r18
	bcnd.n	 ne0,r13,@L3232
	subu	 r13,r11,40
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb0.n	 hi,r13,@L3232
	cmp	 r13,r12,34
	cmp	 r12,r12,39
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 ne0,r13,@L3262
	cmp	 r13,r23,r21
@L3232:
	bsr.n	 _xmalloc
	or	 r2,r0,20
	subu	 r24,r23,r19
	or	 r25,r0,r2
	bsr.n	 _xmalloc
	addu	 r2,r24,1
	or	 r3,r0,r2
	or	 r2,r0,r19
	or	 r4,r0,r24
	bsr.n	 _bcopy
	st	 r3,r25,4
	ld	 r13,r25,4
	st.b	 r0,r13,r24
	st	 r20,r0,r25
	or	 r20,r0,r25
	st	 r24,r20,8
	ld.bu	 r13,r0,r23
	ld.bu	 r13,r13,r18
	bcnd.n	 eq0,r13,@L3244
	or.u	 r13,r0,hi16(_is_hor_space)
	or	 r12,r13,lo16(_is_hor_space)
	addu	 r23,r23,1
@L3263:
	ld.bu	 r13,r0,r23
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L3263
	addu	 r23,r23,1
	subu	 r23,r23,1
@L3244:
	cmp	 r13,r23,r21
	bb1.n	 lo,r13,@L3228
	or.u	 r2,r0,hi16(@LC237)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC237)
	subu	 r13,r0,1
	st	 r13,r0,r17
	br.n	 @L3258
	or	 r2,r0,0
	align	 4
@L3228:
	bcnd	 gt0,r22,@L3230
@L3229:
	st	 r23,r0,r16
	or	 r25,r0,r20
	bcnd.n	 eq0,r25,@L3258
	or	 r2,r0,0
@L3256:
	ld	 r13,r0,r25
	st	 r2,r0,r25
	or	 r2,r0,r25
	or	 r25,r0,r13
	bcnd	 ne0,r25,@L3256
@L3258:
@Lte28:
	ld	 r1,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	jmp.n	 r1
	addu	 r31,r31,96

	align	 8
_free_token_list:
	subu	 r31,r31,64
	st.d	 r24,r31,40
	or	 r24,r0,r2
	bcnd.n	 eq0,r24,@L3271
	st	 r1,r31,48
@Ltb29:
@L3272:
	ld	 r2,r24,4
	bsr.n	 _free
	ld	 r25,r0,r24
	or	 r2,r0,r24
	bsr.n	 _free
	or	 r24,r0,r25
	bcnd	 ne0,r24,@L3272
@L3271:
@Lte29:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
_assertion_install:
	subu	 r31,r31,64
	st	 r23,r31,36
	or	 r23,r0,r2
	st.d	 r24,r31,40
	or	 r24,r0,r3
	or	 r25,r0,r4
	st	 r1,r31,48
@Ltb30:
	bsr.n	 _xmalloc
	addu	 r2,r24,25
	or.u	 r12,r0,hi16(_assertion_hashtab)
	or	 r12,r12,lo16(_assertion_hashtab)
	or	 r9,r0,r2
	lda	 r13,r12[r25]
	st	 r13,r9,8
	ld	 r13,r12[r25]
	st	 r13,r0,r9
	st	 r9,r12[r25]
	ld	 r13,r0,r9
	bcnd.n	 eq0,r13,@L3283
	st	 r0,r9,4
	st	 r9,r13,4
@L3283:
	or	 r2,r0,r23
	st	 r24,r9,12
	or	 r11,r0,0
	st	 r0,r9,20
	addu	 r13,r9,24
	st	 r13,r9,16
	bcnd.n	 le0,r24,@L3285
	or	 r12,r0,r13
	mask	 r10,r24,3
	bcnd.n	 eq0,r10,@L3287
	cmp	 r13,r10,1
	bb0.n	 gt,r13,@L3291
	cmp	 r13,r10,2
	bb0	 gt,r13,@L3292
	ld.bu	 r13,r0,r2
	st.b	 r13,r9,24
	addu	 r2,r2,1
	addu	 r12,r9,25
	or	 r11,r0,1
@L3292:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r12
	addu	 r2,r2,1
	addu	 r12,r12,1
	addu	 r11,r11,1
@L3291:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r12
	addu	 r11,r11,1
	addu	 r2,r2,1
	cmp	 r13,r11,r24
	bb0.n	 lt,r13,@L3285
	addu	 r12,r12,1
@L3287:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r12
	ld.bu	 r13,r2,1
	st.b	 r13,r12,1
	ld.bu	 r13,r2,2
	st.b	 r13,r12,2
	ld.bu	 r13,r2,3
	addu	 r2,r2,4
	addu	 r11,r11,4
	st.b	 r13,r12,3
	cmp	 r13,r11,r24
	bb1.n	 lt,r13,@L3287
	addu	 r12,r12,4
@L3285:
	ld	 r13,r9,16
	st.b	 r0,r13,r24
@Lte30:
	ld	 r1,r31,48
	ld	 r23,r31,36
	or	 r2,r0,r9
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
_assertion_lookup:
	subu	 r31,r31,64
	st	 r1,r31,48
	or.u	 r13,r0,hi16(_assertion_hashtab)
	st	 r23,r31,36
	or	 r13,r13,lo16(_assertion_hashtab)
	st.d	 r24,r31,40
@Ltb31:
	ld	 r25,r13[r4]
	or	 r23,r0,r2
	bcnd.n	 eq0,r25,@L3316
	or	 r24,r0,r3
@L3317:
	ld	 r13,r25,12
	cmp	 r13,r13,r24
	bb1	 ne,r13,@L3318
	ld	 r2,r25,16
	or	 r3,r0,r23
	bsr.n	 _strncmp
	or	 r4,r0,r24
	bcnd.n	 eq0,r2,@L3320
	or	 r2,r0,r25
@L3318:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L3317
@L3316:
	or	 r2,r0,0
@L3320:
@Lte31:
	ld	 r1,r31,48
	ld	 r23,r31,36
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
_delete_assertion:
	subu	 r31,r31,48
	st	 r1,r31,36
@Ltb32:
	ld	 r12,r2,4
	bcnd	 eq0,r12,@L3327
	ld	 r13,r0,r2
	st	 r13,r0,r12
@L3327:
	ld	 r12,r0,r2
	bcnd	 eq0,r12,@L3328
	ld	 r13,r2,4
	st	 r13,r12,4
@L3328:
	ld	 r12,r2,8
	ld	 r13,r0,r12
	cmp	 r13,r2,r13
	bb1	 ne,r13,@L3329
	ld	 r13,r0,r2
	st	 r13,r0,r12
@L3329:
	bsr	 _free
@Lte32:
	ld	 r1,r31,36
	jmp.n	 r1
	addu	 r31,r31,48

data
	align	 8
@LC238:
	string	 "invalid format `#line' command\000"
	bss	 _fname_table.85,148,8
	align	 8
@LC239:
	string	 "invalid format `#line' command\000"
	align	 8
@LC240:
	string	 "invalid format `#line' command\000"
	align	 8
@LC241:
	string	 "invalid format `#line' command\000"
	align	 8
@LC242:
	string	 "invalid format `#line' command\000"
text
	align	 8
_do_line:
	or.u	 r13,r0,hi16(_indepth)
	ld	 r11,r13,lo16(_indepth)
	subu	 r31,r31,128
	or	 r5,r0,0
	st.d	 r20,r31,40
	or	 r20,r0,r4
	or	 r4,r0,0
	st	 r1,r31,64
	or.u	 r13,r0,hi16(_instack)
	st.d	 r24,r31,56
	mul	 r11,r11,44
	addu	 r12,r31,72
	st.d	 r22,r31,48
	or	 r13,r13,lo16(_instack)
	st.d	 r18,r31,32
@Ltb33:
	bsr.n	 _expand_to_temp_buffer
	addu	 r21,r11,r13
	ld	 r25,r31,92
	or.u	 r13,r0,hi16(_is_hor_space)
	ld.bu	 r12,r0,r25
	or	 r11,r13,lo16(_is_hor_space)
	ld.bu	 r13,r12,r11
	bcnd.n	 eq0,r13,@L3408
	or	 r19,r0,0
	or	 r12,r0,r11
	addu	 r25,r25,1
@L3494:
	ld.bu	 r13,r0,r25
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L3494
	addu	 r25,r25,1
	subu	 r25,r25,1
@L3408:
	or.u	 r13,r0,hi16(___lc_ctype)
	ld	 r4,r13,lo16(___lc_ctype)
	ld	 r13,r4,28
	bcnd	 ne0,r13,@L3416
	ld.bu	 r13,r0,r25
	ld	 r12,r4,64
	ld	 r13,r12[r13]
	bb1.n	 (31-27),r13,@L3415
	or.u	 r2,r0,hi16(@LC238)
	br	 @L3495
	align	 4
@L3416:
	ld.bu	 r2,r0,r25
	jsr.n	 r13
	or	 r3,r0,16
	bcnd.n	 ne0,r2,@L3415
	or.u	 r2,r0,hi16(@LC238)
@L3495:
	or	 r2,r2,lo16(@LC238)
	bsr.n	 _error
	addu	 r1,r1,@L3506
@L3507:
	align	 4
@L3415:
	bsr.n	 _atoi
	or	 r2,r0,r25
	or.u	 r13,r0,hi16(___lc_ctype)
	ld	 r12,r13,lo16(___lc_ctype)
	ld	 r13,r12,28
	br.n	 @L3493
	subu	 r18,r2,1
	align	 4
@L3421:
	ld	 r4,r13,lo16(___lc_ctype)
	ld.bu	 r2,r0,r25
	ld	 r13,r4,28
	jsr.n	 r13
	or	 r3,r0,16
	bcnd.n	 eq0,r2,@L3496
	or.u	 r13,r0,hi16(_is_hor_space)
	or.u	 r13,r0,hi16(___lc_ctype)
@L3497:
	ld	 r12,r13,lo16(___lc_ctype)
	ld	 r13,r12,28
	addu	 r25,r25,1
@L3493:
	bcnd.n	 ne0,r13,@L3421
	or.u	 r13,r0,hi16(___lc_ctype)
	ld.bu	 r13,r0,r25
	ld	 r12,r12,64
	ld	 r13,r12[r13]
	bb1.n	 (31-27),r13,@L3497
	or.u	 r13,r0,hi16(___lc_ctype)
	or.u	 r13,r0,hi16(_is_hor_space)
@L3496:
	ld.bu	 r12,r0,r25
	or	 r11,r13,lo16(_is_hor_space)
	ld.bu	 r13,r12,r11
	bcnd.n	 eq0,r13,@L3483
	or	 r12,r0,r11
	addu	 r25,r25,1
@L3498:
	ld.bu	 r13,r0,r25
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L3498
	addu	 r25,r25,1
	subu	 r25,r25,1
@L3483:
	ld.bu	 r12,r0,r25
	cmp	 r13,r12,34
	bb1.n	 ne,r13,@L3432
	addu	 r22,r25,1
	ld.bu	 r13,r0,r22
	cmp	 r12,r13,0
	cmp	 r13,r13,34
	or	 r12,r12,r13
	extu	 r13,r12,1<eq>
	xor	 r12,r13,1
	bcnd.n	 eq0,r12,@L3434
	or	 r25,r0,r22
	addu	 r25,r25,1
@L3499:
	ld.bu	 r13,r0,r25
	cmp	 r12,r13,0
	cmp	 r13,r13,34
	or	 r12,r12,r13
	extu	 r13,r12,1<eq>
	xor	 r12,r13,1
	bcnd.n	 ne0,r12,@L3499
	addu	 r25,r25,1
	subu	 r25,r25,1
@L3434:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,34
	bb0.n	 ne,r13,@L3437
	or.u	 r2,r0,hi16(@LC239)
	or	 r2,r2,lo16(@LC239)
	bsr.n	 _error
	addu	 r1,r1,@L3508
@L3509:
	align	 4
@L3437:
	subu	 r23,r25,r22
	addu	 r25,r25,1
	or.u	 r13,r0,hi16(_is_hor_space)
	ld.bu	 r12,r0,r25
	or	 r11,r13,lo16(_is_hor_space)
	ld.bu	 r13,r12,r11
	bcnd.n	 eq0,r13,@L3439
	or	 r12,r0,r11
	addu	 r25,r25,1
@L3500:
	ld.bu	 r13,r0,r25
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L3500
	addu	 r25,r25,1
	subu	 r25,r25,1
@L3439:
	ld.bu	 r12,r0,r25
	bcnd.n	 eq0,r12,@L3446
	cmp	 r13,r12,49
	bb1.n	 ne,r13,@L3447
	cmp	 r13,r12,50
	br.n	 @L3448
	or	 r19,r0,1
	align	 4
@L3447:
	bb1.n	 ne,r13,@L3449
	cmp	 r13,r12,51
	br.n	 @L3448
	or	 r19,r0,2
	align	 4
@L3449:
	bb0.n	 ne,r13,@L3451
	or.u	 r2,r0,hi16(@LC240)
	or	 r2,r2,lo16(@LC240)
	bsr.n	 _error
	addu	 r1,r1,@L3510
@L3511:
	align	 4
@L3451:
	or	 r13,r0,1
	st.b	 r13,r21,40
@L3448:
	addu	 r25,r25,1
	or.u	 r13,r0,hi16(_is_hor_space)
	ld.bu	 r12,r0,r25
	or	 r11,r13,lo16(_is_hor_space)
	ld.bu	 r13,r12,r11
	bcnd	 eq0,r13,@L3454
	or	 r12,r0,r11
	addu	 r25,r25,1
@L3501:
	ld.bu	 r13,r0,r25
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L3501
	addu	 r25,r25,1
	subu	 r25,r25,1
@L3454:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,51
	bb0	 eq,r13,@L3461
	addu	 r25,r25,1
	or	 r13,r0,1
	st.b	 r13,r21,40
	or.u	 r13,r0,hi16(_is_hor_space)
	ld.bu	 r12,r0,r25
	or	 r11,r13,lo16(_is_hor_space)
	ld.bu	 r13,r12,r11
	bcnd	 eq0,r13,@L3461
	or	 r12,r0,r11
	addu	 r25,r25,1
@L3502:
	ld.bu	 r13,r0,r25
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L3502
	addu	 r25,r25,1
	subu	 r25,r25,1
@L3461:
	ld.bu	 r13,r0,r25
	bcnd.n	 eq0,r13,@L3446
	or.u	 r2,r0,hi16(@LC241)
	or	 r2,r2,lo16(@LC241)
	bsr.n	 _error
	addu	 r1,r1,@L3512
@L3513:
	align	 4
@L3485:
	ld	 r13,r25,24
	br.n	 @L3472
	st	 r13,r21,4
	align	 4
@L3446:
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _hashf
	or	 r4,r0,37
	or.u	 r13,r0,hi16(_fname_table.85)
	or	 r13,r13,lo16(_fname_table.85)
	lda	 r24,r13[r2]
	ld	 r25,r0,r24
	bcnd.n	 eq0,r25,@L3503
	or	 r2,r0,1
@L3474:
	ld	 r13,r25,16
	cmp	 r13,r13,r23
	bb1	 ne,r13,@L3473
	ld	 r2,r25,24
	or	 r3,r0,r22
	bsr.n	 _strncmp
	or	 r4,r0,r23
	bcnd	 eq0,r2,@L3485
@L3473:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L3474
@L3472:
	bcnd.n	 ne0,r25,@L3504
	or	 r2,r0,r21
	or	 r2,r0,1
@L3503:
	bsr.n	 _xcalloc
	addu	 r3,r23,29
	ld	 r13,r0,r24
	or	 r25,r0,r2
	st	 r13,r0,r25
	st	 r25,r0,r24
	st	 r23,r25,16
	addu	 r13,r25,28
	st	 r13,r25,24
	st	 r13,r21,4
	or	 r2,r0,r22
	ld	 r3,r25,24
	or	 r4,r0,r23
	bsr.n	 _bcopy
	addu	 r1,r1,@L3514
@L3515:
	align	 4
@L3432:
	bcnd.n	 eq0,r12,@L3478
	or.u	 r2,r0,hi16(@LC242)
	or	 r2,r2,lo16(@LC242)
	bsr.n	 _error
	addu	 r1,r1,@L3516
@L3517:
	align	 4
@L3478:
	or	 r2,r0,r21
@L3504:
	or	 r3,r0,r20
	or	 r4,r0,0
	or	 r5,r0,r19
	bsr.n	 _output_line_command
	st	 r18,r21,12
	ld	 r11,r20,24
	ld	 r9,r20,20
	ld	 r13,r20,16
	ld	 r12,r21,24
	ld	 r10,r21,20
	subu	 r11,r11,r9
	ld	 r9,r21,16
	subu	 r12,r12,r10
	subu	 r13,r13,r11
	subu	 r3,r9,r12
	cmp	 r13,r13,r3
	bb1.n	 gt,r13,@L3505
	or	 r2,r0,0
	bsr.n	 _grow_outbuf
	or	 r2,r0,r20
@L3481:
	or	 r2,r0,0
@L3505:
@Lte33:
	ld	 r1,r31,64
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	ld.d	 r18,r31,32
	jmp.n	 r1
	addu	 r31,r31,128
	def	 @L3516,@L3481-@L3517
	def	 @L3514,@L3478-@L3515
	def	 @L3512,@L3481-@L3513
	def	 @L3510,@L3481-@L3511
	def	 @L3508,@L3481-@L3509
	def	 @L3506,@L3481-@L3507

data
	align	 8
@LC243:
	string	 "macro\000"
	align	 8
@LC244:
	string	 "undefining `%s'\000"
	align	 8
@LC245:
	string	 "garbage after `#undef' directive\000"
text
	align	 8
_do_undef:
	or.u	 r13,r0,hi16(_pcp_outfile)
	ld	 r13,r13,lo16(_pcp_outfile)
	subu	 r31,r31,96
	st.d	 r22,r31,64
	or	 r23,r0,r2
	st.d	 r18,r31,48
	or	 r19,r0,r3
	st.d	 r24,r31,72
	or	 r24,r0,r4
	st.d	 r16,r31,40
	or	 r17,r0,r5
	cmp	 r12,r24,0
	cmp	 r13,r13,0
	st	 r1,r31,80
	or	 r13,r13,r12
	st.d	 r20,r31,56
@Ltb34:
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L3552
	or	 r21,r0,r23
	ld	 r11,r24,24
	ld	 r13,r24,20
	ld	 r12,r24,16
	subu	 r11,r11,r13
	subu	 r13,r19,r23
	ld	 r25,r0,r17
	addu	 r13,r13,1
	subu	 r12,r12,r11
	addu	 r3,r25,r13
	cmp	 r12,r12,r3
	bb0	 ls,r12,@L3555
	bsr.n	 _grow_outbuf
	or	 r2,r0,r24
@L3555:
	ld	 r12,r24,24
	addu	 r13,r12,1
	st	 r13,r24,24
	or	 r13,r0,35
	st.b	 r13,r0,r12
	ld	 r2,r17,8
	ld	 r3,r24,24
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r24,24
	addu	 r4,r13,r25
	cmp	 r13,r19,r23
	bb0.n	 ne,r13,@L3556
	st	 r4,r24,24
	ld.bu	 r13,r0,r23
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L3556
	addu	 r13,r4,1
	st	 r13,r24,24
	or	 r13,r0,32
	st.b	 r13,r0,r4
@L3556:
	or	 r2,r0,r23
	subu	 r25,r19,r23
	ld	 r3,r24,24
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r24,24
	addu	 r13,r13,r25
	st	 r13,r24,24
@L3552:
	or.u	 r13,r0,hi16(_is_hor_space)
	ld.bu	 r12,r0,r23
	or	 r11,r13,lo16(_is_hor_space)
	ld.bu	 r13,r12,r11
	bcnd.n	 eq0,r13,@L3558
	or	 r12,r0,r11
	addu	 r23,r23,1
@L3586:
	ld.bu	 r13,r0,r23
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L3586
	addu	 r23,r23,1
	subu	 r23,r23,1
@L3558:
	or	 r2,r0,r23
	or.u	 r3,r0,hi16(@LC243)
	subu	 r20,r19,r21
	or	 r3,r3,lo16(@LC243)
	bsr.n	 _check_macro_name
	addu	 r16,r20,1
	or	 r18,r0,r2
@L3565:
	or	 r2,r0,r23
	or	 r3,r0,r18
	bsr.n	 _lookup
	subu	 r4,r0,1
	or	 r22,r0,r2
	bcnd.n	 eq0,r22,@L3566
	or.u	 r13,r0,hi16(_debug_output)
	ld	 r13,r13,lo16(_debug_output)
	cmp	 r12,r24,0
	cmp	 r13,r13,0
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd	 eq0,r13,@L3568
	ld	 r13,r24,24
	ld	 r11,r24,20
	ld	 r25,r0,r17
	ld	 r12,r24,16
	subu	 r13,r13,r11
	addu	 r3,r25,r16
	subu	 r12,r12,r13
	cmp	 r12,r12,r3
	bb0	 ls,r12,@L3571
	bsr.n	 _grow_outbuf
	or	 r2,r0,r24
@L3571:
	ld	 r12,r24,24
	addu	 r13,r12,1
	st	 r13,r24,24
	or	 r13,r0,35
	st.b	 r13,r0,r12
	ld	 r2,r17,8
	ld	 r3,r24,24
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r24,24
	addu	 r4,r13,r25
	cmp	 r13,r19,r21
	bb0.n	 ne,r13,@L3572
	st	 r4,r24,24
	ld.bu	 r13,r0,r21
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L3572
	addu	 r13,r4,1
	st	 r13,r24,24
	or	 r13,r0,32
	st.b	 r13,r0,r4
@L3572:
	or	 r2,r0,r21
	ld	 r3,r24,24
	bsr.n	 _bcopy
	or	 r4,r0,r20
	ld	 r13,r24,24
	addu	 r13,r13,r20
	st	 r13,r24,24
@L3568:
	ld	 r13,r22,12
	cmp	 r13,r13,31
	bb0.n	 ne,r13,@L3573
	or.u	 r2,r0,hi16(@LC244)
	ld	 r3,r22,20
	bsr.n	 _warning
	or	 r2,r2,lo16(@LC244)
@L3573:
	or	 r2,r0,r22
	bsr.n	 _delete_macro
	subu	 r1,r1,@L3588
@L3589:
	align	 4
@L3566:
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	bcnd.n	 eq0,r13,@L3574
	addu	 r23,r23,r18
	or.u	 r13,r0,hi16(_is_hor_space)
	ld.bu	 r12,r0,r23
	or	 r11,r13,lo16(_is_hor_space)
	ld.bu	 r13,r12,r11
	bcnd	 eq0,r13,@L3576
	or	 r12,r0,r11
	addu	 r23,r23,1
@L3587:
	ld.bu	 r13,r0,r23
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L3587
	addu	 r23,r23,1
	subu	 r23,r23,1
@L3576:
	cmp	 r13,r23,r19
	bb0.n	 ne,r13,@L3574
	or.u	 r2,r0,hi16(@LC245)
	bsr.n	 _pedwarn
	or	 r2,r2,lo16(@LC245)
@L3574:
@Lte34:
	ld	 r1,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	or	 r2,r0,0
	ld.d	 r16,r31,40
	jmp.n	 r1
	addu	 r31,r31,96
	def	 @L3588,@L3589-@L3565

data
	align	 8
@LC246:
	string	 "#error %s\000"
text
	align	 8
_do_error:
	subu	 r31,r31,64
	st.d	 r24,r31,40
	or	 r24,r0,r2
	subu	 r25,r3,r24
	st	 r1,r31,48
	addu	 r2,r25,1
	bsr.n	 _xmalloc
	st	 r23,r31,36
@Ltb35:
	or	 r23,r0,r2
	or	 r2,r0,r24
	or	 r4,r0,r25
	bsr.n	 _bcopy
	or	 r3,r0,r23
	st.b	 r0,r23,r25
	or.u	 r13,r0,hi16(_is_hor_space)
	ld.b	 r12,r0,r23
	or	 r11,r13,lo16(_is_hor_space)
	ld.bu	 r13,r12,r11
	bcnd.n	 eq0,r13,@L3601
	or	 r12,r0,r11
	addu	 r23,r23,1
@L3609:
	ld.b	 r13,r0,r23
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L3609
	addu	 r23,r23,1
	subu	 r23,r23,1
@L3601:
	or.u	 r2,r0,hi16(@LC246)
	or	 r3,r0,r23
	bsr.n	 _error
	or	 r2,r2,lo16(@LC246)
	bsr.n	 _exit
	or	 r2,r0,33
	align	 4
@Lte35:

data
	align	 8
@LC247:
	string	 "#warning %s\000"
text
	align	 8
_do_warning:
	subu	 r31,r31,64
	st.d	 r24,r31,40
	or	 r24,r0,r2
	subu	 r25,r3,r24
	st	 r1,r31,48
	addu	 r2,r25,1
	bsr.n	 _xmalloc
	st	 r23,r31,36
@Ltb36:
	or	 r23,r0,r2
	or	 r2,r0,r24
	or	 r4,r0,r25
	bsr.n	 _bcopy
	or	 r3,r0,r23
	st.b	 r0,r23,r25
	or.u	 r13,r0,hi16(_is_hor_space)
	ld.b	 r12,r0,r23
	or	 r11,r13,lo16(_is_hor_space)
	ld.bu	 r13,r12,r11
	bcnd.n	 eq0,r13,@L3621
	or	 r12,r0,r11
	addu	 r23,r23,1
@L3629:
	ld.b	 r13,r0,r23
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L3629
	addu	 r23,r23,1
	subu	 r23,r23,1
@L3621:
	or.u	 r2,r0,hi16(@LC247)
	or	 r3,r0,r23
	bsr.n	 _warning
	or	 r2,r2,lo16(@LC247)
@Lte36:
	ld	 r1,r31,48
	ld	 r23,r31,36
	ld.d	 r24,r31,40
	or	 r2,r0,0
	jmp.n	 r1
	addu	 r31,r31,64

data
	align	 8
@LC248:
	string	 "ANSI C does not allow `#ident'\000"
text
	align	 8
_do_ident:
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	subu	 r31,r31,48
	bcnd.n	 eq0,r13,@L3641
	st	 r1,r31,36
@Ltb37:
	or.u	 r13,r0,hi16(_indepth)
	ld	 r12,r13,lo16(_indepth)
	mul	 r12,r12,44
	or.u	 r13,r0,hi16(_instack)
	or	 r13,r13,lo16(_instack)
	addu	 r12,r12,r13
	ld.b	 r13,r12,40
	bcnd.n	 ne0,r13,@L3641
	or.u	 r2,r0,hi16(@LC248)
	bsr.n	 _pedwarn
	or	 r2,r2,lo16(@LC248)
@L3641:
@Lte37:
	ld	 r1,r31,36
	or	 r2,r0,0
	jmp.n	 r1
	addu	 r31,r31,48

data
	align	 8
@LC249:
	string	 "once\000"
	align	 8
@LC250:
	string	 "`#pragma once' is obsolete\000"
	align	 8
@LC251:
	string	 "implementation\000"
	align	 8
@LC252:
	string	 "`#pragma implementation' for `%s' appears after f"
	string	 "ile is included\000"
text
	align	 8
_do_pragma:
	subu	 r31,r31,64
	st	 r1,r31,48
	st.d	 r24,r31,40
	or	 r24,r0,r2
	st	 r23,r31,36
@Ltb38:
@L3716:
	ld.bu	 r13,r0,r24
	cmp	 r12,r13,32
	cmp	 r13,r13,9
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 ne0,r12,@L3716
	addu	 r24,r24,1
	subu	 r24,r24,1
	or	 r2,r0,r24
	or.u	 r3,r0,hi16(@LC249)
	or	 r4,r0,4
	bsr.n	 _strncmp
	or	 r3,r3,lo16(@LC249)
	bcnd	 ne0,r2,@L3681
	or.u	 r23,r0,hi16(_indepth)
	ld	 r13,r23,lo16(_indepth)
	mul	 r13,r13,44
	or.u	 r12,r0,hi16(_instack)
	or	 r25,r12,lo16(_instack)
	addu	 r13,r13,r25
	ld.b	 r13,r13,40
	bcnd	 ne0,r13,@L3682
	or.u	 r2,r0,hi16(@LC250)
	bsr.n	 _warning
	or	 r2,r2,lo16(@LC250)
@L3682:
	ld	 r11,r23,lo16(_indepth)
	bcnd.n	 lt0,r11,@L3685
	or	 r23,r0,0
	or	 r12,r0,r25
	mul	 r9,r11,44
@L3687:
	or	 r10,r0,r9
	ld	 r13,r10,r12
	bcnd.n	 ne0,r13,@L3711
	subu	 r11,r11,1
	bcnd.n	 ge0,r11,@L3687
	subu	 r9,r10,44
@L3685:
	bcnd.n	 eq0,r23,@L3717
	or	 r2,r0,r24
	bsr.n	 _xmalloc
	or	 r2,r0,12
	or.u	 r12,r0,hi16(_dont_repeat_files)
	ld	 r13,r12,lo16(_dont_repeat_files)
	or	 r25,r0,r2
	st	 r13,r0,r25
	ld	 r2,r0,r23
	bsr.n	 _savestring
	st	 r25,r12,lo16(_dont_repeat_files)
	st	 r2,r25,4
	st	 r0,r25,8
@L3681:
	or	 r2,r0,r24
@L3717:
	or.u	 r3,r0,hi16(@LC251)
	or	 r4,r0,14
	bsr.n	 _strncmp
	or	 r3,r3,lo16(@LC251)
	bcnd.n	 ne0,r2,@L3691
	or.u	 r13,r0,hi16(_is_hor_space)
	ld.bu	 r12,r24,14
	or	 r11,r13,lo16(_is_hor_space)
	ld.bu	 r13,r12,r11
	bcnd.n	 eq0,r13,@L3693
	addu	 r2,r24,14
	or	 r12,r0,r11
	addu	 r2,r2,1
@L3718:
	ld.bu	 r13,r0,r2
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L3718
	addu	 r2,r2,1
	subu	 r2,r2,1
@L3693:
	ld.bu	 r13,r0,r2
	cmp	 r12,r13,10
	cmp	 r13,r13,34
	or.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L3700
	addu	 r24,r2,1
	br.n	 @L3719
	or	 r2,r0,0
	align	 4
@L3711:
	br.n	 @L3685
	addu	 r23,r9,r12
	align	 4
@L3700:
	or	 r3,r0,34
	bsr.n	 _index
	or	 r2,r0,r24
	bcnd	 eq0,r2,@L3701
	st.b	 r0,r0,r2
@L3701:
	or.u	 r13,r0,hi16(_all_include_files)
	ld	 r25,r13,lo16(_all_include_files)
	bcnd.n	 eq0,r25,@L3691
	or.u	 r23,r0,hi16(@LC252)
@L3705:
	ld	 r2,r25,4
	bsr.n	 _rindex
	or	 r3,r0,47
	bcnd.n	 ne0,r2,@L3707
	addu	 r2,r2,1
	ld	 r2,r25,4
@L3707:
	bcnd	 eq0,r2,@L3704
	bsr.n	 _strcmp
	or	 r3,r0,r24
	bcnd.n	 ne0,r2,@L3704
	or	 r2,r23,lo16(@LC252)
	bsr.n	 _warning
	or	 r3,r0,r24
@L3704:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L3705
@L3691:
	or	 r2,r0,0
@L3719:
@Lte38:
	ld	 r1,r31,48
	ld	 r23,r31,36
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

data
	align	 8
@LC253:
	string	 "ANSI C does not allow `#sccs'\000"
text
	align	 8
_do_if:
	subu	 r31,r31,48
	or.u	 r13,r0,hi16(_indepth)
	st	 r25,r31,32
	ld	 r25,r13,lo16(_indepth)
	mul	 r25,r25,44
	or.u	 r13,r0,hi16(_instack)
	subu	 r3,r3,r2
	or	 r13,r13,lo16(_instack)
	st	 r1,r31,36
@Ltb39:
	bsr.n	 _eval_if_expression
	addu	 r25,r25,r13
	cmp	 r3,r2,0
	or	 r4,r0,7
	or	 r5,r0,0
	extu	 r3,r3,1<eq>
	bsr.n	 _conditional_skip
	or	 r2,r0,r25
@Lte39:
	ld	 r1,r31,36
	ld	 r25,r31,32
	or	 r2,r0,0
	jmp.n	 r1
	addu	 r31,r31,48

data
	align	 8
@LC254:
	string	 "`#elif' not within a conditional\000"
	align	 8
@LC255:
	string	 "`#elif' after `#else'\000"
	align	 8
@LC256:
	string	 " (matches line %d\000"
	align	 8
@LC257:
	string	 ", file %s\000"
	align	 8
@LC258:
	string	 ")\n\000"
text
	align	 8
_do_elif:
	or.u	 r13,r0,hi16(_indepth)
	ld	 r12,r13,lo16(_indepth)
	subu	 r31,r31,80
	st	 r1,r31,64
	st.d	 r24,r31,56
	or.u	 r13,r0,hi16(_instack)
	st.d	 r22,r31,48
	mul	 r12,r12,44
	or.u	 r24,r0,hi16(_if_stack)
	st.d	 r20,r31,40
@Ltb40:
	or	 r13,r13,lo16(_instack)
	ld	 r11,r24,lo16(_if_stack)
	addu	 r25,r12,r13
	ld	 r13,r25,32
	or	 r22,r0,r2
	or	 r21,r0,r3
	cmp	 r13,r11,r13
	bb1.n	 ne,r13,@L3734
	or	 r20,r0,r4
	or.u	 r2,r0,hi16(@LC254)
	or	 r2,r2,lo16(@LC254)
	bsr.n	 _error
	addu	 r1,r1,@L3744
@L3745:
	align	 4
@L3734:
	ld	 r13,r11,20
	cmp	 r12,r13,7
	cmp	 r13,r13,10
	or	 r12,r12,r13
	extu	 r13,r12,1<eq>
	xor	 r12,r13,1
	bcnd.n	 eq0,r12,@L3736
	or.u	 r2,r0,hi16(@LC255)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC255)
	ld	 r12,r24,lo16(_if_stack)
	or.u	 r3,r0,hi16(@LC256)
	or.u	 r13,r0,hi16(__iob+64)
	or	 r3,r3,lo16(@LC256)
	or	 r23,r13,lo16(__iob+64)
	ld	 r4,r12,8
	bsr.n	 _fprintf
	or	 r2,r0,r23
	ld	 r13,r24,lo16(_if_stack)
	ld	 r2,r13,4
	bcnd	 eq0,r2,@L3737
	ld	 r13,r0,r25
	bcnd	 eq0,r13,@L3737
	bsr.n	 _strcmp
	ld	 r3,r25,4
	bcnd.n	 eq0,r2,@L3737
	or	 r2,r0,r23
	ld	 r13,r24,lo16(_if_stack)
	or.u	 r3,r0,hi16(@LC257)
	ld	 r4,r13,4
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC257)
@L3737:
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC258)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC258)
@L3736:
	or.u	 r24,r0,hi16(_if_stack)
	ld	 r13,r24,lo16(_if_stack)
	ld	 r11,r13,12
	or	 r12,r0,10
	bcnd.n	 ne0,r11,@L3743
	st	 r12,r13,20
	or	 r2,r0,r22
	bsr.n	 _eval_if_expression
	subu	 r3,r21,r2
	bcnd.n	 ne0,r2,@L3740
	or	 r2,r0,r25
@L3743:
	or	 r2,r0,r25
	or	 r3,r0,0
	bsr.n	 _skip_if_group
	addu	 r1,r1,@L3746
@L3747:
	align	 4
@L3740:
	ld	 r12,r24,lo16(_if_stack)
	or	 r3,r0,r20
	ld	 r13,r12,12
	or	 r4,r0,1
	or	 r5,r0,0
	addu	 r13,r13,1
	bsr.n	 _output_line_command
	st	 r13,r12,12
@L3739:
	or	 r2,r0,0
@Lte40:
	ld	 r1,r31,64
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80
	def	 @L3746,@L3739-@L3747
	def	 @L3744,@L3739-@L3745

data
	align	 8
@LC259:
	string	 "defined\000"
text
	align	 8
_eval_if_expression:
	subu	 r31,r31,112
	or	 r4,r0,33
	or	 r5,r0,0
	st	 r23,r31,36
	or	 r6,r0,0
	st.d	 r24,r31,40
	or	 r25,r0,r2
	or	 r23,r0,r3
	or.u	 r2,r0,hi16(@LC259)
	subu	 r3,r0,1
	or	 r2,r2,lo16(@LC259)
	st	 r1,r31,48
@Ltb41:
	bsr.n	 _install
	or	 r7,r0,r3
	or	 r24,r0,r2
	or	 r2,r0,r25
	or	 r4,r0,0
	or	 r5,r0,1
	or.u	 r25,r0,hi16(_pcp_inside_if)
	or	 r13,r0,1
	addu	 r12,r31,56
	addu	 r3,r2,r23
	bsr.n	 _expand_to_temp_buffer
	st	 r13,r25,lo16(_pcp_inside_if)
	or	 r2,r0,r24
	bsr.n	 _delete_macro
	st	 r0,r25,lo16(_pcp_inside_if)
	bsr.n	 _parse_c_expression
	ld	 r2,r31,76
	or	 r25,r0,r2
	bsr.n	 _free
	ld	 r2,r31,76
@Lte41:
	ld	 r1,r31,48
	ld	 r23,r31,36
	or	 r2,r0,r25
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,112

data
	align	 8
@LC260:
	string	 "`#%s' with no argument\000"
	align	 8
@LC261:
	string	 "`#%s' argument starts with punctuation\000"
	align	 8
@LC262:
	string	 "`#%s' argument starts with a digit\000"
	align	 8
@LC263:
	string	 "garbage at end of `#%s' argument\000"
	align	 8
@LC264:
	string	 "#define %s\n\000"
	align	 8
@LC265:
	string	 "#undef \000"
text
	align	 8
_do_xifdef:
	or.u	 r13,r0,hi16(_indepth)
	ld	 r12,r13,lo16(_indepth)
	subu	 r31,r31,96
	st	 r1,r31,80
	st.d	 r24,r31,72
	or	 r24,r0,r2
	st.d	 r22,r31,64
	or	 r23,r0,r3
	st.d	 r20,r31,56
	mul	 r12,r12,44
	or.u	 r13,r0,hi16(_instack)
	st.d	 r18,r31,48
	or	 r13,r13,lo16(_instack)
	st.d	 r16,r31,40
@Ltb42:
	addu	 r20,r12,r13
	or	 r18,r0,r5
	ld	 r13,r0,r20
	or	 r16,r0,0
	bcnd.n	 eq0,r13,@L3798
	or	 r17,r0,0
	ld	 r13,r18,12
	cmp	 r13,r13,6
	bb1.n	 ne,r13,@L3850
	or.u	 r13,r0,hi16(_is_hor_space)
	or.u	 r13,r0,hi16(_directive_start)
	ld	 r12,r20,20
	ld	 r13,r13,lo16(_directive_start)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L3800
	or.u	 r13,r0,hi16(_is_space)
	or	 r22,r13,lo16(_is_space)
@L3801:
	ld.bu	 r13,r0,r12
	ext	 r11,r13,8<0>
	ld.bu	 r13,r11,r22
	bcnd.n	 ne0,r13,@L3799
	addu	 r12,r12,1
	cmp	 r13,r11,47
	bb1	 ne,r13,@L3798
	ld	 r25,r20,24
	cmp	 r13,r12,r25
	bb0	 ne,r13,@L3798
	ld.bu	 r13,r0,r12
	cmp	 r13,r13,42
	bb1.n	 ne,r13,@L3798
	or	 r2,r0,r20
	addu	 r3,r31,88
	or	 r4,r0,1
	addu	 r13,r12,1
	bsr.n	 _skip_to_end_of_comment
	st	 r13,r20,24
	st	 r25,r20,24
	or	 r12,r0,r2
@L3799:
	or.u	 r13,r0,hi16(_directive_start)
	ld	 r13,r13,lo16(_directive_start)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L3801
@L3800:
	or	 r16,r0,1
@L3798:
	or.u	 r13,r0,hi16(_is_hor_space)
@L3850:
	ld.bu	 r12,r0,r24
	or	 r11,r13,lo16(_is_hor_space)
	ld.bu	 r13,r12,r11
	bcnd	 eq0,r13,@L3809
	or	 r12,r0,r11
	addu	 r24,r24,1
@L3851:
	ld.bu	 r13,r0,r24
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L3851
	addu	 r24,r24,1
	subu	 r24,r24,1
@L3809:
	cmp	 r13,r23,r24
	bb0.n	 ne,r13,@L3817
	or.u	 r13,r0,hi16(_is_hor_space)
	subu	 r11,r0,1
	or	 r12,r13,lo16(_is_hor_space)
@L3820:
	ld.bu	 r13,r23,r11
	ld.bu	 r13,r13,r12
	bcnd	 eq0,r13,@L3817
	subu	 r23,r23,1
	cmp	 r13,r23,r24
	bb1	 ne,r13,@L3820
@L3817:
	or.u	 r13,r0,hi16(_is_idchar)
	ld.bu	 r12,r0,r24
	or	 r11,r13,lo16(_is_idchar)
	ld.bu	 r13,r12,r11
	bcnd.n	 eq0,r13,@L3822
	or	 r22,r0,r24
	or	 r12,r0,r11
	addu	 r22,r22,1
@L3852:
	ld.bu	 r13,r0,r22
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L3852
	addu	 r22,r22,1
	subu	 r22,r22,1
@L3822:
	cmp	 r13,r22,r24
	bb1.n	 ne,r13,@L3826
	or.u	 r13,r0,hi16(_pedantic)
	or.u	 r12,r0,hi16(_traditional)
	ld	 r13,r18,12
	ld	 r12,r12,lo16(_traditional)
	cmp	 r13,r13,5
	bcnd.n	 ne0,r12,@L3830
	extu	 r21,r13,1<eq>
	cmp	 r13,r24,r23
	bb1.n	 ne,r13,@L3828
	or.u	 r13,r0,hi16(@LC261)
	or.u	 r13,r0,hi16(@LC260)
	br.n	 @L3829
	or	 r2,r13,lo16(@LC260)
	align	 4
@L3828:
	or	 r2,r13,lo16(@LC261)
@L3829:
	ld	 r3,r18,8
	bsr.n	 _pedwarn
	addu	 r1,r1,@L3854
@L3855:
	align	 4
@L3826:
	ld	 r13,r13,lo16(_pedantic)
	bcnd	 eq0,r13,@L3831
	ld.bu	 r13,r0,r24
	subu	 r13,r13,48
	mask	 r13,r13,0xff
	cmp	 r13,r13,9
	bb0.n	 ls,r13,@L3831
	or.u	 r2,r0,hi16(@LC262)
	ld	 r3,r18,8
	br.n	 @L3849
	or	 r2,r2,lo16(@LC262)
	align	 4
@L3831:
	cmp	 r13,r22,r23
	bb0.n	 ne,r13,@L3832
	or.u	 r13,r0,hi16(_traditional)
	ld	 r13,r13,lo16(_traditional)
	bcnd.n	 ne0,r13,@L3853
	or	 r2,r0,r24
	or.u	 r2,r0,hi16(@LC263)
	ld	 r3,r18,8
	or	 r2,r2,lo16(@LC263)
@L3849:
	bsr	 _pedwarn
@L3832:
	or	 r2,r0,r24
@L3853:
	subu	 r3,r22,r24
	bsr.n	 _lookup
	subu	 r4,r0,1
	or.u	 r13,r0,hi16(_pcp_outfile)
	ld	 r12,r13,lo16(_pcp_outfile)
	bcnd.n	 eq0,r12,@L3834
	or	 r23,r0,r2
	bcnd	 eq0,r23,@L3835
	ld	 r13,r23,24
	ld	 r13,r13,8
	bcnd	 eq0,r13,@L3835
	ld	 r4,r23,20
	or.u	 r3,r0,hi16(@LC264)
	or	 r2,r0,r12
	or	 r3,r3,lo16(@LC264)
	bsr.n	 _fprintf
	addu	 r1,r1,@L3856
@L3857:
	align	 4
@L3835:
	or.u	 r21,r0,hi16(_pcp_outfile)
	or.u	 r3,r0,hi16(@LC265)
	ld	 r2,r21,lo16(_pcp_outfile)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC265)
	or.u	 r13,r0,hi16(_is_idchar)
	ld.bu	 r12,r0,r24
	or	 r11,r13,lo16(_is_idchar)
	ld.bu	 r13,r12,r11
	bcnd.n	 eq0,r13,@L3838
	or	 r25,r0,r24
	or	 r19,r0,r21
	or	 r21,r0,r11
@L3839:
	ld.bu	 r2,r0,r25
	ld	 r3,r19,lo16(_pcp_outfile)
	bsr.n	 _fputc
	addu	 r25,r25,1
	ld.bu	 r13,r0,r25
	ld.bu	 r13,r13,r21
	bcnd	 ne0,r13,@L3839
@L3838:
	or.u	 r13,r0,hi16(_pcp_outfile)
	ld	 r3,r13,lo16(_pcp_outfile)
	ld	 r13,r0,r3
	subu	 r13,r13,1
	bcnd.n	 ge0,r13,@L3841
	st	 r13,r0,r3
	or	 r2,r0,10
	bsr.n	 __flsbuf
	addu	 r1,r1,@L3858
@L3859:
	align	 4
@L3841:
	ld	 r13,r3,4
	addu	 r12,r13,1
	st	 r12,r3,4
	or	 r12,r0,10
	st.b	 r12,r0,r13
@L3834:
	ld	 r13,r18,12
	cmp	 r12,r23,0
	extu	 r12,r12,1<eq>
	cmp	 r13,r13,6
	extu	 r13,r13,1<eq>
	xor	 r21,r12,r13
	subu	 r13,r21,1
	subu	 r12,r0,r16
	mask	 r13,r13,1
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L3830
	subu	 r25,r22,r24
	bsr.n	 _xmalloc
	addu	 r2,r25,1
	or	 r17,r0,r2
	or	 r2,r0,r24
	or	 r4,r0,r25
	bsr.n	 _bcopy
	or	 r3,r0,r17
	st.b	 r0,r17,r25
@L3830:
	or	 r2,r0,r20
	or	 r3,r0,r21
	or	 r4,r0,7
	bsr.n	 _conditional_skip
	or	 r5,r0,r17
@Lte42:
	ld	 r1,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	or	 r2,r0,0
	ld.d	 r16,r31,40
	jmp.n	 r1
	addu	 r31,r31,96
	def	 @L3858,@L3834-@L3859
	def	 @L3856,@L3834-@L3857
	def	 @L3854,@L3830-@L3855

	align	 8
_conditional_skip:
	subu	 r31,r31,64
	st.d	 r22,r31,32
	or	 r22,r0,r2
	or	 r23,r0,r3
	st.d	 r24,r31,40
	or	 r24,r0,r4
	or	 r25,r0,r5
	or	 r2,r0,1
	st	 r1,r31,48
@Ltb43:
	bsr.n	 _xcalloc
	or	 r3,r0,24
	ld	 r13,r22,4
	or	 r10,r0,r2
	st	 r13,r10,4
	or.u	 r11,r0,hi16(_if_stack)
	ld	 r13,r22,12
	ld	 r12,r11,lo16(_if_stack)
	st	 r13,r10,8
	st	 r12,r0,r10
	st	 r25,r10,16
	st	 r10,r11,lo16(_if_stack)
	bcnd.n	 eq0,r23,@L3864
	st	 r24,r10,20
	or	 r2,r0,r22
	or	 r3,r0,0
	bsr.n	 _skip_if_group
	addu	 r1,r1,@L3866
@L3867:
	align	 4
@L3864:
	ld	 r13,r10,12
	or.u	 r3,r0,hi16(_outbuf)
	or	 r2,r0,r22
	or	 r4,r0,1
	or	 r5,r0,0
	or	 r3,r3,lo16(_outbuf)
	addu	 r13,r13,1
	bsr.n	 _output_line_command
	st	 r13,r10,12
@L3863:
@Lte43:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	ld.d	 r22,r31,32
	jmp.n	 r1
	addu	 r31,r31,64
	def	 @L3866,@L3863-@L3867

data
	align	 8
@LC266:
	string	 "`#' followed by integer\000"
	align	 8
@LC267:
	string	 "invalid preprocessor directive\000"
	align	 8
@LC268:
	string	 "invalid preprocessor directive name\000"
	align	 8
@LC269:
	string	 "`#%s' not within a conditional\000"
	align	 8
@LC270:
	string	 "`#else' or `#elif' after `#else'\000"
	align	 8
@LC271:
	string	 "invalid preprocessor directive name\000"
text
	align	 8
_skip_if_group:
	subu	 r31,r31,96
	st	 r1,r31,80
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	st.d	 r18,r31,48
	st.d	 r16,r31,40
	st.d	 r14,r31,32
@Ltb44:
	or	 r21,r0,r2
	st	 r3,r31,92
	ld	 r25,r21,24
	ld	 r12,r21,20
	ld	 r13,r21,16
	addu	 r18,r12,r13
	or.u	 r13,r0,hi16(_if_stack)
	cmp	 r12,r25,r18
	ld	 r16,r13,lo16(_if_stack)
	bb0.n	 lo,r12,@L4027
	or	 r15,r0,r25
	or.u	 r13,r0,hi16(_is_hor_space)
	or	 r14,r0,92
	or	 r17,r13,lo16(_is_hor_space)
@L4028:
	ld.bu	 r12,r0,r25
	cmp	 r13,r12,39
	bb0.n	 ne,r13,@L4056
	addu	 r25,r25,1
	bb1.n	 gt,r13,@L4179
	cmp	 r13,r12,47
	cmp	 r13,r12,34
	bb0	 ne,r13,@L4056
	bb1.n	 gt,r13,@L4180
	cmp	 r13,r12,35
	cmp	 r13,r12,10
	bb0.n	 ne,r13,@L4060
	cmp	 r13,r25,r18
	br	 @L4200
	align	 4
@L4180:
	bb0.n	 ne,r13,@L4061
	subu	 r13,r25,1
	br.n	 @L4200
	cmp	 r13,r25,r18
	align	 4
@L4179:
	bb0.n	 ne,r13,@L4030
	cmp	 r13,r12,92
	bb0.n	 ne,r13,@L4057
	cmp	 r13,r25,r18
	br	 @L4200
	align	 4
@L4030:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,92
	bb0	 eq,r13,@L4031
	ld.bu	 r13,r25,1
	cmp	 r13,r13,10
	bb0	 eq,r13,@L4031
	or	 r8,r0,r25
	or	 r11,r0,r25
	or	 r10,r0,0
@L4035:
	ld.bu	 r13,r0,r11
	cmp	 r13,r13,92
	bb0	 eq,r13,@L4034
	ld.bu	 r12,r11,1
	cmp	 r13,r12,10
	bb1.n	 ne,r13,@L4037
	cmp	 r13,r12,13
	addu	 r11,r11,2
	br.n	 @L4035
	addu	 r10,r10,1
	align	 4
@L4037:
	bb0	 eq,r13,@L4034
	ld.bu	 r13,r11,2
	cmp	 r13,r13,10
	bb0	 eq,r13,@L4034
	addu	 r11,r11,3
	br.n	 @L4035
	addu	 r10,r10,1
	align	 4
@L4034:
	bcnd	 eq0,r10,@L4031
	ld.bu	 r7,r0,r11
	mask	 r13,r7,0xff
	cmp	 r6,r13,47
	cmp	 r9,r13,42
	or	 r13,r6,r9
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 ne0,r13,@L4031
	or	 r13,r9,r6
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L4201
	or	 r13,r0,r10
@L4047:
	st.b	 r7,r0,r8
	addu	 r11,r11,1
	ld.bu	 r7,r0,r11
	mask	 r13,r7,0xff
	cmp	 r12,r13,42
	cmp	 r13,r13,47
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 ne0,r12,@L4047
	addu	 r8,r8,1
	or	 r13,r0,r10
@L4201:
	bcnd.n	 le0,r13,@L4031
	subu	 r10,r10,1
@L4051:
	st.b	 r14,r0,r8
	addu	 r8,r8,1
	or	 r13,r0,r10
	subu	 r10,r10,1
	or	 r19,r0,10
	st.b	 r19,r0,r8
	bcnd.n	 gt0,r13,@L4051
	addu	 r8,r8,1
@L4031:
	ld.bu	 r12,r0,r25
	cmp	 r13,r12,42
	bb0.n	 ne,r13,@L4054
	or.u	 r19,r0,hi16(_cplusplus_comments)
	ld	 r13,r19,lo16(_cplusplus_comments)
	bcnd.n	 eq0,r13,@L4200
	cmp	 r13,r25,r18
	cmp	 r13,r12,47
	bb1.n	 ne,r13,@L4200
	cmp	 r13,r25,r18
@L4054:
	addu	 r25,r25,1
	or	 r2,r0,r21
	addu	 r3,r21,12
	or	 r4,r0,0
	bsr.n	 _skip_to_end_of_comment
	st	 r25,r21,24
	br.n	 @L4026
	or	 r25,r0,r2
	align	 4
@L4056:
	ld	 r4,r21,12
	subu	 r2,r25,1
	or	 r3,r0,r18
	addu	 r5,r21,12
	or	 r6,r0,0
	bsr.n	 _skip_quoted_string
	or	 r7,r0,0
	br.n	 @L4026
	or	 r25,r0,r2
	align	 4
@L4057:
	bb0	 lo,r13,@L4027
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,10
	bb1	 ne,r13,@L4059
	ld	 r13,r21,12
	addu	 r13,r13,1
	st	 r13,r21,12
@L4059:
	br.n	 @L4026
	addu	 r25,r25,1
	align	 4
@L4060:
	ld	 r13,r21,12
	or	 r15,r0,r25
	addu	 r13,r13,1
	br.n	 @L4026
	st	 r13,r21,12
	align	 4
@L4061:
	bcnd.n	 eq0,r15,@L4026
	st	 r13,r21,24
	or.u	 r19,r0,hi16(_cplusplus_comments)
	or	 r25,r0,r15
	ld	 r11,r19,lo16(_cplusplus_comments)
@L4065:
	ld.bu	 r12,r0,r25
	ld.bu	 r13,r12,r17
	bcnd	 eq0,r13,@L4066
	addu	 r25,r25,1
	br	 @L4065
	align	 4
@L4066:
	cmp	 r13,r12,92
	bb1	 ne,r13,@L4068
	ld.bu	 r13,r25,1
	cmp	 r13,r13,10
	bb0	 ne,r13,@L4072
@L4068:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,47
	bb1	 ne,r13,@L4070
	ld.bu	 r13,r25,1
	cmp	 r13,r13,42
	bb1	 ne,r13,@L4070
	addu	 r25,r25,2
@L4195:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,42
	bb1.n	 ne,r13,@L4195
	addu	 r25,r25,1
	subu	 r25,r25,1
	ld.bu	 r13,r25,1
	cmp	 r13,r13,47
	bb1.n	 ne,r13,@L4195
	addu	 r25,r25,1
	subu	 r25,r25,1
@L4072:
	br.n	 @L4065
	addu	 r25,r25,2
	align	 4
@L4070:
	bcnd	 eq0,r11,@L4064
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,47
	bb0	 eq,r13,@L4064
	ld.bu	 r13,r25,1
	cmp	 r13,r13,47
	bb0	 eq,r13,@L4064
	addu	 r25,r25,2
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,10
	bb1.n	 eq,r13,@L4065
	addu	 r25,r25,1
@L4077:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,10
	bb1.n	 ne,r13,@L4077
	addu	 r25,r25,1
	br	 @L4065
	align	 4
@L4064:
	ld	 r12,r21,24
	cmp	 r13,r25,r12
	bb0	 ne,r13,@L4083
	addu	 r25,r12,1
	br.n	 @L4200
	cmp	 r13,r25,r18
	align	 4
@L4083:
	or.u	 r19,r0,hi16(_cplusplus_comments)
	addu	 r25,r25,1
	ld	 r11,r19,lo16(_cplusplus_comments)
@L4086:
	ld.bu	 r12,r0,r25
	ld.bu	 r13,r12,r17
	bcnd	 eq0,r13,@L4087
	addu	 r25,r25,1
	br	 @L4086
	align	 4
@L4087:
	cmp	 r13,r12,92
	bb1	 ne,r13,@L4089
	ld.bu	 r13,r25,1
	cmp	 r13,r13,10
	bb0	 ne,r13,@L4093
@L4089:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,47
	bb1	 ne,r13,@L4091
	ld.bu	 r13,r25,1
	cmp	 r13,r13,42
	bb1	 ne,r13,@L4091
	addu	 r25,r25,2
	br	 @L4196
	align	 4
@L4094:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,10
	bb1	 ne,r13,@L4095
	ld	 r13,r21,12
	addu	 r13,r13,1
	st	 r13,r21,12
@L4095:
	addu	 r25,r25,1
@L4196:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,42
	bb1	 ne,r13,@L4094
	ld.bu	 r13,r25,1
	cmp	 r13,r13,47
	bb1	 ne,r13,@L4094
@L4093:
	br.n	 @L4086
	addu	 r25,r25,2
	align	 4
@L4091:
	bcnd	 eq0,r11,@L4085
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,47
	bb0	 eq,r13,@L4085
	ld.bu	 r13,r25,1
	cmp	 r13,r13,47
	bb0	 eq,r13,@L4085
	addu	 r25,r25,2
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,10
	bb1.n	 eq,r13,@L4086
	addu	 r25,r25,1
@L4099:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,10
	bb1.n	 ne,r13,@L4099
	addu	 r25,r25,1
	br	 @L4086
	align	 4
@L4085:
	or.u	 r13,r0,hi16(_is_idchar)
	or	 r20,r0,r25
	or	 r7,r13,lo16(_is_idchar)
@L4107:
	ld.bu	 r12,r0,r25
	ld.bu	 r13,r12,r7
	bcnd.n	 ne0,r13,@L4197
	cmp	 r13,r12,92
	bb0	 eq,r13,@L4110
	ld.bu	 r13,r25,1
	cmp	 r13,r13,10
	bb0	 eq,r13,@L4110
	or	 r9,r0,r25
	or	 r11,r0,r25
	or	 r10,r0,0
@L4114:
	ld.bu	 r13,r0,r11
	cmp	 r13,r13,92
	bb0	 eq,r13,@L4113
	ld.bu	 r12,r11,1
	cmp	 r13,r12,10
	bb1.n	 ne,r13,@L4116
	cmp	 r13,r12,13
	addu	 r11,r11,2
	br.n	 @L4114
	addu	 r10,r10,1
	align	 4
@L4116:
	bb0	 eq,r13,@L4113
	ld.bu	 r13,r11,2
	cmp	 r13,r13,10
	bb0	 eq,r13,@L4113
	addu	 r11,r11,3
	br.n	 @L4114
	addu	 r10,r10,1
	align	 4
@L4113:
	bcnd	 eq0,r10,@L4110
	ld.bu	 r12,r0,r11
	mask	 r13,r12,0xff
	ld.bu	 r13,r13,r7
	bcnd.n	 eq0,r13,@L4110
	or.u	 r13,r0,hi16(_is_idchar)
	or	 r8,r13,lo16(_is_idchar)
@L4126:
	addu	 r11,r11,1
	st.b	 r12,r0,r9
	ld.bu	 r12,r0,r11
	mask	 r13,r12,0xff
	ld.bu	 r13,r13,r8
	bcnd.n	 ne0,r13,@L4126
	addu	 r9,r9,1
	or	 r13,r0,r10
	bcnd.n	 le0,r13,@L4110
	subu	 r10,r10,1
@L4130:
	st.b	 r14,r0,r9
	addu	 r9,r9,1
	or	 r13,r0,r10
	subu	 r10,r10,1
	or	 r19,r0,10
	st.b	 r19,r0,r9
	bcnd.n	 gt0,r13,@L4130
	addu	 r9,r9,1
@L4110:
	ld.bu	 r13,r0,r25
	ld.bu	 r13,r13,r7
	bcnd.n	 eq0,r13,@L4106
	subu	 r23,r25,r20
@L4197:
	br.n	 @L4107
	addu	 r25,r25,1
	align	 4
@L4106:
	bcnd.n	 ne0,r23,@L4182
	or	 r8,r0,r20
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,10
	bb0.n	 ne,r13,@L4200
	cmp	 r13,r25,r18
	br.n	 @L4202
	or	 r11,r0,r8
	align	 4
@L4182:
	or.u	 r13,r0,hi16(_is_idstart)
	ld.bu	 r12,r0,r20
	or	 r13,r13,lo16(_is_idstart)
	ld.bu	 r13,r12,r13
	bcnd.n	 ne0,r13,@L4136
	or.u	 r13,r0,hi16(_directive_table)
	or	 r11,r0,r8
@L4202:
	or.u	 r13,r0,hi16(_is_idchar)
	ld.bu	 r10,r0,r11
	or	 r9,r13,lo16(_is_idchar)
	mask	 r12,r10,0xff
	ld.bu	 r13,r12,r9
	bcnd	 eq0,r13,@L4139
	or	 r12,r0,r9
	subu	 r13,r10,48
@L4203:
	mask	 r13,r13,0xff
	cmp	 r13,r13,9
	bb0	 ls,r13,@L4139
	addu	 r11,r11,1
	ld.bu	 r10,r0,r11
	mask	 r13,r10,0xff
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L4203
	subu	 r13,r10,48
@L4139:
	cmp	 r13,r11,r8
	bb1.n	 eq,r13,@L4199
	or.u	 r13,r0,hi16(_is_idchar)
	ld.bu	 r12,r0,r11
	or	 r13,r13,lo16(_is_idchar)
	ld.bu	 r13,r12,r13
	bcnd.n	 ne0,r13,@L4204
	or.u	 r13,r0,hi16(_lang_asm)
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	bcnd.n	 eq0,r13,@L4200
	cmp	 r13,r25,r18
	or.u	 r2,r0,hi16(@LC266)
	br.n	 @L4198
	or	 r2,r2,lo16(@LC266)
	align	 4
@L4199:
	ld.bu	 r12,r0,r11
	cmp	 r13,r12,35
	bb1.n	 eq,r13,@L4199
	addu	 r11,r11,1
	subu	 r11,r11,1
	ld.bu	 r13,r12,r17
	bcnd.n	 ne0,r13,@L4199
	addu	 r11,r11,1
	subu	 r11,r11,1
	ld.bu	 r13,r0,r11
	cmp	 r13,r13,10
	bb1.n	 ne,r13,@L4145
	or.u	 r13,r0,hi16(_lang_asm)
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	bcnd.n	 eq0,r13,@L4200
	cmp	 r13,r25,r18
	or.u	 r13,r0,hi16(_lang_asm)
	ld	 r13,r13,lo16(_lang_asm)
	bcnd.n	 ne0,r13,@L4200
	cmp	 r13,r25,r18
	or.u	 r2,r0,hi16(@LC267)
	br.n	 @L4198
	or	 r2,r2,lo16(@LC267)
	align	 4
@L4145:
@L4204:
	ld	 r13,r13,lo16(_lang_asm)
	bcnd.n	 ne0,r13,@L4200
	cmp	 r13,r25,r18
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	bcnd.n	 eq0,r13,@L4200
	cmp	 r13,r25,r18
	or.u	 r2,r0,hi16(@LC268)
	br.n	 @L4198
	or	 r2,r2,lo16(@LC268)
	align	 4
@L4185:
	or.u	 r2,r0,hi16(@LC269)
	ld	 r3,r24,8
	or	 r2,r2,lo16(@LC269)
	bsr.n	 _error
	addu	 r1,r1,@L4208
@L4209:
	align	 4
@L4136:
	ld	 r12,r13,lo16(_directive_table)
	bcnd.n	 lt0,r12,@L4184
	or	 r24,r13,lo16(_directive_table)
	or.u	 r13,r0,hi16(_instack)
	or.u	 r22,r0,hi16(_if_stack)
	ld	 r13,r0,r24
	cmp	 r13,r23,r13
@L4207:
	bb1	 ne,r13,@L4155
	ld	 r3,r24,8
	or	 r2,r0,r20
	bsr.n	 _strncmp
	or	 r4,r0,r23
	bcnd	 ne0,r2,@L4155
	ld	 r19,r31,92
	bcnd	 ne0,r19,@L4025
	ld	 r12,r24,12
	cmp	 r13,r12,8
	bb0	 ne,r13,@L4164
	bb1.n	 ls,r13,@L4174
	cmp	 r13,r12,10
	bb0.n	 ne,r13,@L4166
	cmp	 r13,r12,15
	bb0.n	 ne,r13,@L4205
	or.u	 r13,r0,hi16(_pedantic)
	br	 @L4154
	align	 4
@L4174:
	cmp	 r13,r12,5
	bb0.n	 hs,r13,@L4154
	or	 r2,r0,1
	bsr.n	 _xcalloc
	or	 r3,r0,24
	ld	 r13,r22,lo16(_if_stack)
	st	 r13,r0,r2
	ld	 r13,r21,12
	st	 r13,r2,8
	ld	 r13,r21,4
	st	 r13,r2,4
	ld	 r13,r24,12
	st	 r2,r22,lo16(_if_stack)
	br.n	 @L4154
	st	 r13,r2,20
	align	 4
@L4164:
	or.u	 r13,r0,hi16(_pedantic)
@L4205:
	ld	 r13,r13,lo16(_pedantic)
	bcnd.n	 eq0,r13,@L4206
	or.u	 r13,r0,hi16(_indepth)
	ld	 r13,r22,lo16(_if_stack)
	cmp	 r13,r13,r16
	bb0.n	 ne,r13,@L4206
	or.u	 r13,r0,hi16(_indepth)
	bsr.n	 _validate_else
	or	 r2,r0,r25
@L4166:
	or.u	 r13,r0,hi16(_indepth)
@L4206:
	ld	 r13,r13,lo16(_indepth)
	mul	 r13,r13,44
	or.u	 r19,r0,hi16(_instack)
	or	 r19,r19,lo16(_instack)
	ld	 r2,r22,lo16(_if_stack)
	addu	 r13,r13,r19
	ld	 r13,r13,32
	cmp	 r13,r2,r13
	bb1.n	 eq,r13,@L4185
	cmp	 r13,r2,r16
	bb0	 ne,r13,@L4025
	ld	 r13,r24,12
	cmp	 r13,r13,15
	bb0	 ne,r13,@L4170
	ld	 r13,r2,20
	cmp	 r13,r13,8
	bb1.n	 ne,r13,@L4171
	or.u	 r2,r0,hi16(@LC270)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC270)
@L4171:
	ld	 r12,r22,lo16(_if_stack)
	ld	 r13,r24,12
	br.n	 @L4154
	st	 r13,r12,20
	align	 4
@L4170:
	ld	 r13,r0,r2
	st	 r13,r22,lo16(_if_stack)
	bsr.n	 _free
	addu	 r1,r1,@L4210
@L4211:
	align	 4
@L4155:
	addu	 r24,r24,20
	ld	 r13,r0,r24
	bcnd.n	 ge0,r13,@L4207
	cmp	 r13,r23,r13
@L4154:
	ld	 r13,r0,r24
	bcnd.n	 ge0,r13,@L4200
	cmp	 r13,r25,r18
@L4184:
	or.u	 r13,r0,hi16(_lang_asm)
	ld	 r13,r13,lo16(_lang_asm)
	bcnd.n	 ne0,r13,@L4200
	cmp	 r13,r25,r18
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	bcnd.n	 eq0,r13,@L4200
	cmp	 r13,r25,r18
	or.u	 r2,r0,hi16(@LC271)
	or	 r2,r2,lo16(@LC271)
@L4198:
	bsr	 _pedwarn
@L4026:
	cmp	 r13,r25,r18
@L4200:
	bb1	 lo,r13,@L4028
@L4027:
	st	 r25,r21,24
@L4025:
@Lte44:
	ld	 r1,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	ld.d	 r14,r31,32
	jmp.n	 r1
	addu	 r31,r31,96
	def	 @L4210,@L4154-@L4211
	def	 @L4208,@L4154-@L4209

data
	align	 8
@LC272:
	string	 "text following `#else' violates ANSI standard\000"
	align	 8
@LC273:
	string	 "`#else' not within a conditional\000"
	align	 8
@LC274:
	string	 "`#else' after `#else'\000"
	align	 8
@LC275:
	string	 " (matches line %d\000"
	align	 8
@LC276:
	string	 ", file %s\000"
	align	 8
@LC277:
	string	 ")\n\000"
text
	align	 8
_do_else:
	or.u	 r13,r0,hi16(_indepth)
	or.u	 r11,r0,hi16(_pedantic)
	ld	 r12,r13,lo16(_indepth)
	ld	 r11,r11,lo16(_pedantic)
	subu	 r31,r31,96
	st	 r1,r31,80
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	or	 r23,r0,r4
	st.d	 r18,r31,48
	mul	 r12,r12,44
	or.u	 r13,r0,hi16(_instack)
	st.d	 r16,r31,40
	or	 r13,r13,lo16(_instack)
	st.d	 r14,r31,32
@Ltb45:
	bcnd.n	 eq0,r11,@L4387
	addu	 r21,r12,r13
	or.u	 r13,r0,hi16(_is_hor_space)
	ld.bu	 r12,r0,r2
	or	 r11,r13,lo16(_is_hor_space)
	ld.bu	 r13,r12,r11
	bcnd	 eq0,r13,@L4389
	or	 r12,r0,r11
	addu	 r2,r2,1
@L4580:
	ld.bu	 r13,r0,r2
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L4580
	addu	 r2,r2,1
	subu	 r2,r2,1
@L4389:
	cmp	 r13,r2,r3
	bb0	 ne,r13,@L4387
	or.u	 r2,r0,hi16(@LC272)
	bsr.n	 _pedwarn
	or	 r2,r2,lo16(@LC272)
@L4387:
	or.u	 r13,r0,hi16(_indepth)
	ld	 r12,r13,lo16(_indepth)
	mul	 r12,r12,44
	or.u	 r13,r0,hi16(_instack)
	or.u	 r24,r0,hi16(_if_stack)
	or	 r13,r13,lo16(_instack)
	ld	 r11,r24,lo16(_if_stack)
	addu	 r12,r12,r13
	ld	 r13,r12,32
	cmp	 r13,r11,r13
	bb1.n	 ne,r13,@L4397
	or.u	 r2,r0,hi16(@LC273)
	or	 r2,r2,lo16(@LC273)
	bsr.n	 _error
	addu	 r1,r1,@L4591
@L4592:
	align	 4
@L4397:
	ld	 r13,r11,20
	cmp	 r12,r13,7
	cmp	 r13,r13,10
	or	 r12,r12,r13
	extu	 r13,r12,1<eq>
	xor	 r12,r13,1
	bcnd.n	 eq0,r12,@L4399
	st	 r0,r11,16
	or.u	 r2,r0,hi16(@LC274)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC274)
	or.u	 r12,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC275)
	ld	 r13,r24,lo16(_if_stack)
	or	 r3,r3,lo16(@LC275)
	or	 r25,r12,lo16(__iob+64)
	ld	 r4,r13,8
	bsr.n	 _fprintf
	or	 r2,r0,r25
	ld	 r13,r24,lo16(_if_stack)
	ld	 r3,r21,4
	bsr.n	 _strcmp
	ld	 r2,r13,4
	bcnd.n	 eq0,r2,@L4400
	or	 r2,r0,r25
	ld	 r13,r24,lo16(_if_stack)
	or.u	 r3,r0,hi16(@LC276)
	ld	 r4,r13,4
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC276)
@L4400:
	or.u	 r3,r0,hi16(@LC277)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC277)
@L4399:
	or.u	 r13,r0,hi16(_if_stack)
	ld	 r11,r13,lo16(_if_stack)
	ld	 r12,r11,12
	or	 r13,r0,8
	bcnd.n	 eq0,r12,@L4401
	st	 r13,r11,20
	ld	 r13,r21,20
	ld	 r12,r21,16
	ld	 r25,r21,24
	addu	 r18,r13,r12
	or	 r16,r0,r11
	cmp	 r13,r25,r18
	bb0.n	 lo,r13,@L4404
	or	 r15,r0,r25
	or.u	 r13,r0,hi16(_is_hor_space)
	or	 r14,r0,10
	or	 r17,r13,lo16(_is_hor_space)
@L4405:
	ld.bu	 r12,r0,r25
	cmp	 r13,r12,39
	bb0.n	 ne,r13,@L4433
	addu	 r25,r25,1
	bb1.n	 gt,r13,@L4556
	cmp	 r13,r12,47
	cmp	 r13,r12,34
	bb0	 ne,r13,@L4433
	bb1.n	 gt,r13,@L4557
	cmp	 r13,r12,35
	cmp	 r13,r12,10
	bb0.n	 ne,r13,@L4437
	cmp	 r13,r25,r18
	br	 @L4581
	align	 4
@L4557:
	bb0.n	 ne,r13,@L4438
	subu	 r13,r25,1
	br.n	 @L4581
	cmp	 r13,r25,r18
	align	 4
@L4556:
	bb0.n	 ne,r13,@L4407
	cmp	 r13,r12,92
	bb0.n	 ne,r13,@L4434
	cmp	 r13,r25,r18
	br	 @L4581
	align	 4
@L4407:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,92
	bb0	 eq,r13,@L4408
	ld.bu	 r13,r25,1
	cmp	 r13,r13,10
	bb0	 eq,r13,@L4408
	or	 r8,r0,r25
	or	 r11,r0,r25
	or	 r10,r0,0
@L4412:
	ld.bu	 r13,r0,r11
	cmp	 r13,r13,92
	bb0	 eq,r13,@L4411
	ld.bu	 r12,r11,1
	cmp	 r13,r12,10
	bb1.n	 ne,r13,@L4414
	cmp	 r13,r12,13
	addu	 r11,r11,2
	br.n	 @L4412
	addu	 r10,r10,1
	align	 4
@L4414:
	bb0	 eq,r13,@L4411
	ld.bu	 r13,r11,2
	cmp	 r13,r13,10
	bb0	 eq,r13,@L4411
	addu	 r11,r11,3
	br.n	 @L4412
	addu	 r10,r10,1
	align	 4
@L4411:
	bcnd	 eq0,r10,@L4408
	ld.bu	 r7,r0,r11
	mask	 r13,r7,0xff
	cmp	 r6,r13,47
	cmp	 r9,r13,42
	or	 r13,r6,r9
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 ne0,r13,@L4408
	or	 r13,r9,r6
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L4582
	or	 r13,r0,r10
@L4424:
	st.b	 r7,r0,r8
	addu	 r11,r11,1
	ld.bu	 r7,r0,r11
	mask	 r13,r7,0xff
	cmp	 r12,r13,42
	cmp	 r13,r13,47
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 ne0,r12,@L4424
	addu	 r8,r8,1
	or	 r13,r0,r10
@L4582:
	bcnd.n	 le0,r13,@L4408
	subu	 r10,r10,1
	or	 r19,r0,92
@L4589:
	st.b	 r19,r0,r8
	addu	 r8,r8,1
	or	 r13,r0,r10
	subu	 r10,r10,1
	st.b	 r14,r0,r8
	bcnd.n	 gt0,r13,@L4589
	addu	 r8,r8,1
@L4408:
	ld.bu	 r12,r0,r25
	cmp	 r13,r12,42
	bb0.n	 ne,r13,@L4431
	or.u	 r19,r0,hi16(_cplusplus_comments)
	ld	 r13,r19,lo16(_cplusplus_comments)
	bcnd.n	 eq0,r13,@L4581
	cmp	 r13,r25,r18
	cmp	 r13,r12,47
	bb1.n	 ne,r13,@L4581
	cmp	 r13,r25,r18
@L4431:
	addu	 r25,r25,1
	or	 r2,r0,r21
	addu	 r3,r21,12
	or	 r4,r0,0
	bsr.n	 _skip_to_end_of_comment
	st	 r25,r21,24
	br.n	 @L4403
	or	 r25,r0,r2
	align	 4
@L4433:
	ld	 r4,r21,12
	subu	 r2,r25,1
	or	 r3,r0,r18
	addu	 r5,r21,12
	or	 r6,r0,0
	bsr.n	 _skip_quoted_string
	or	 r7,r0,0
	br.n	 @L4403
	or	 r25,r0,r2
	align	 4
@L4434:
	bb0	 lo,r13,@L4404
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,10
	bb1	 ne,r13,@L4436
	ld	 r13,r21,12
	addu	 r13,r13,1
	st	 r13,r21,12
@L4436:
	br.n	 @L4403
	addu	 r25,r25,1
	align	 4
@L4437:
	ld	 r13,r21,12
	or	 r15,r0,r25
	addu	 r13,r13,1
	br.n	 @L4403
	st	 r13,r21,12
	align	 4
@L4438:
	bcnd.n	 eq0,r15,@L4403
	st	 r13,r21,24
	or.u	 r19,r0,hi16(_cplusplus_comments)
	or	 r25,r0,r15
	ld	 r11,r19,lo16(_cplusplus_comments)
@L4442:
	ld.bu	 r12,r0,r25
	ld.bu	 r13,r12,r17
	bcnd	 eq0,r13,@L4443
	addu	 r25,r25,1
	br	 @L4442
	align	 4
@L4443:
	cmp	 r13,r12,92
	bb1	 ne,r13,@L4445
	ld.bu	 r13,r25,1
	cmp	 r13,r13,10
	bb0	 ne,r13,@L4449
@L4445:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,47
	bb1	 ne,r13,@L4447
	ld.bu	 r13,r25,1
	cmp	 r13,r13,42
	bb1	 ne,r13,@L4447
	addu	 r25,r25,2
@L4575:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,42
	bb1.n	 ne,r13,@L4575
	addu	 r25,r25,1
	subu	 r25,r25,1
	ld.bu	 r13,r25,1
	cmp	 r13,r13,47
	bb1.n	 ne,r13,@L4575
	addu	 r25,r25,1
	subu	 r25,r25,1
@L4449:
	br.n	 @L4442
	addu	 r25,r25,2
	align	 4
@L4447:
	bcnd	 eq0,r11,@L4441
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,47
	bb0	 eq,r13,@L4441
	ld.bu	 r13,r25,1
	cmp	 r13,r13,47
	bb0	 eq,r13,@L4441
	addu	 r25,r25,2
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,10
	bb1.n	 eq,r13,@L4442
	addu	 r25,r25,1
@L4454:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,10
	bb1.n	 ne,r13,@L4454
	addu	 r25,r25,1
	br	 @L4442
	align	 4
@L4441:
	ld	 r12,r21,24
	cmp	 r13,r25,r12
	bb0	 ne,r13,@L4460
	addu	 r25,r12,1
	br.n	 @L4581
	cmp	 r13,r25,r18
	align	 4
@L4460:
	or.u	 r19,r0,hi16(_cplusplus_comments)
	addu	 r25,r25,1
	ld	 r11,r19,lo16(_cplusplus_comments)
@L4463:
	ld.bu	 r12,r0,r25
	ld.bu	 r13,r12,r17
	bcnd	 eq0,r13,@L4464
	addu	 r25,r25,1
	br	 @L4463
	align	 4
@L4464:
	cmp	 r13,r12,92
	bb1	 ne,r13,@L4466
	ld.bu	 r13,r25,1
	cmp	 r13,r13,10
	bb0	 ne,r13,@L4470
@L4466:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,47
	bb1	 ne,r13,@L4468
	ld.bu	 r13,r25,1
	cmp	 r13,r13,42
	bb1	 ne,r13,@L4468
	addu	 r25,r25,2
	br	 @L4576
	align	 4
@L4471:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,10
	bb1	 ne,r13,@L4472
	ld	 r13,r21,12
	addu	 r13,r13,1
	st	 r13,r21,12
@L4472:
	addu	 r25,r25,1
@L4576:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,42
	bb1	 ne,r13,@L4471
	ld.bu	 r13,r25,1
	cmp	 r13,r13,47
	bb1	 ne,r13,@L4471
@L4470:
	br.n	 @L4463
	addu	 r25,r25,2
	align	 4
@L4468:
	bcnd	 eq0,r11,@L4462
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,47
	bb0	 eq,r13,@L4462
	ld.bu	 r13,r25,1
	cmp	 r13,r13,47
	bb0	 eq,r13,@L4462
	addu	 r25,r25,2
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,10
	bb1.n	 eq,r13,@L4463
	addu	 r25,r25,1
@L4476:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,10
	bb1.n	 ne,r13,@L4476
	addu	 r25,r25,1
	br	 @L4463
	align	 4
@L4462:
	or.u	 r13,r0,hi16(_is_idchar)
	or	 r20,r0,r25
	or	 r7,r13,lo16(_is_idchar)
@L4484:
	ld.bu	 r12,r0,r25
	ld.bu	 r13,r12,r7
	bcnd.n	 ne0,r13,@L4577
	cmp	 r13,r12,92
	bb0	 eq,r13,@L4487
	ld.bu	 r13,r25,1
	cmp	 r13,r13,10
	bb0	 eq,r13,@L4487
	or	 r9,r0,r25
	or	 r11,r0,r25
	or	 r10,r0,0
@L4491:
	ld.bu	 r13,r0,r11
	cmp	 r13,r13,92
	bb0	 eq,r13,@L4490
	ld.bu	 r12,r11,1
	cmp	 r13,r12,10
	bb1.n	 ne,r13,@L4493
	cmp	 r13,r12,13
	addu	 r11,r11,2
	br.n	 @L4491
	addu	 r10,r10,1
	align	 4
@L4493:
	bb0	 eq,r13,@L4490
	ld.bu	 r13,r11,2
	cmp	 r13,r13,10
	bb0	 eq,r13,@L4490
	addu	 r11,r11,3
	br.n	 @L4491
	addu	 r10,r10,1
	align	 4
@L4490:
	bcnd	 eq0,r10,@L4487
	ld.bu	 r12,r0,r11
	mask	 r13,r12,0xff
	ld.bu	 r13,r13,r7
	bcnd.n	 eq0,r13,@L4487
	or.u	 r13,r0,hi16(_is_idchar)
	or	 r8,r13,lo16(_is_idchar)
@L4503:
	addu	 r11,r11,1
	st.b	 r12,r0,r9
	ld.bu	 r12,r0,r11
	mask	 r13,r12,0xff
	ld.bu	 r13,r13,r8
	bcnd.n	 ne0,r13,@L4503
	addu	 r9,r9,1
	or	 r13,r0,r10
	bcnd.n	 le0,r13,@L4487
	subu	 r10,r10,1
	or	 r19,r0,92
@L4590:
	st.b	 r19,r0,r9
	addu	 r9,r9,1
	or	 r13,r0,r10
	subu	 r10,r10,1
	st.b	 r14,r0,r9
	bcnd.n	 gt0,r13,@L4590
	addu	 r9,r9,1
@L4487:
	ld.bu	 r13,r0,r25
	ld.bu	 r13,r13,r7
	bcnd.n	 eq0,r13,@L4483
	subu	 r23,r25,r20
@L4577:
	br.n	 @L4484
	addu	 r25,r25,1
	align	 4
@L4483:
	bcnd.n	 ne0,r23,@L4561
	or	 r8,r0,r20
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,10
	bb0.n	 ne,r13,@L4581
	cmp	 r13,r25,r18
	br.n	 @L4583
	or	 r11,r0,r8
	align	 4
@L4561:
	or.u	 r13,r0,hi16(_is_idstart)
	ld.bu	 r12,r0,r20
	or	 r13,r13,lo16(_is_idstart)
	ld.bu	 r13,r12,r13
	bcnd.n	 ne0,r13,@L4513
	or.u	 r13,r0,hi16(_directive_table)
	or	 r11,r0,r8
@L4583:
	or.u	 r13,r0,hi16(_is_idchar)
	ld.bu	 r10,r0,r11
	or	 r9,r13,lo16(_is_idchar)
	mask	 r12,r10,0xff
	ld.bu	 r13,r12,r9
	bcnd	 eq0,r13,@L4516
	or	 r12,r0,r9
	subu	 r13,r10,48
@L4584:
	mask	 r13,r13,0xff
	cmp	 r13,r13,9
	bb0	 ls,r13,@L4516
	addu	 r11,r11,1
	ld.bu	 r10,r0,r11
	mask	 r13,r10,0xff
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L4584
	subu	 r13,r10,48
@L4516:
	cmp	 r13,r11,r8
	bb1.n	 eq,r13,@L4579
	or.u	 r13,r0,hi16(_is_idchar)
	ld.bu	 r12,r0,r11
	or	 r13,r13,lo16(_is_idchar)
	ld.bu	 r13,r12,r13
	bcnd.n	 ne0,r13,@L4585
	or.u	 r13,r0,hi16(_lang_asm)
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	bcnd.n	 eq0,r13,@L4581
	cmp	 r13,r25,r18
	or.u	 r2,r0,hi16(@LC266)
	br.n	 @L4578
	or	 r2,r2,lo16(@LC266)
	align	 4
@L4579:
	ld.bu	 r12,r0,r11
	cmp	 r13,r12,35
	bb1.n	 eq,r13,@L4579
	addu	 r11,r11,1
	subu	 r11,r11,1
	ld.bu	 r13,r12,r17
	bcnd.n	 ne0,r13,@L4579
	addu	 r11,r11,1
	subu	 r11,r11,1
	ld.bu	 r13,r0,r11
	cmp	 r13,r13,10
	bb1.n	 ne,r13,@L4522
	or.u	 r13,r0,hi16(_lang_asm)
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	bcnd.n	 eq0,r13,@L4581
	cmp	 r13,r25,r18
	or.u	 r13,r0,hi16(_lang_asm)
	ld	 r13,r13,lo16(_lang_asm)
	bcnd.n	 ne0,r13,@L4581
	cmp	 r13,r25,r18
	or.u	 r2,r0,hi16(@LC267)
	br.n	 @L4578
	or	 r2,r2,lo16(@LC267)
	align	 4
@L4522:
@L4585:
	ld	 r13,r13,lo16(_lang_asm)
	bcnd.n	 ne0,r13,@L4581
	cmp	 r13,r25,r18
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	bcnd.n	 eq0,r13,@L4581
	cmp	 r13,r25,r18
	or.u	 r2,r0,hi16(@LC268)
	br.n	 @L4578
	or	 r2,r2,lo16(@LC268)
	align	 4
@L4564:
	or.u	 r2,r0,hi16(@LC269)
	ld	 r3,r24,8
	or	 r2,r2,lo16(@LC269)
	bsr.n	 _error
	addu	 r1,r1,@L4593
@L4594:
	align	 4
@L4513:
	ld	 r12,r13,lo16(_directive_table)
	bcnd.n	 lt0,r12,@L4563
	or	 r24,r13,lo16(_directive_table)
	or.u	 r13,r0,hi16(_instack)
	or.u	 r22,r0,hi16(_if_stack)
	ld	 r13,r0,r24
	cmp	 r13,r23,r13
@L4588:
	bb1	 ne,r13,@L4532
	ld	 r3,r24,8
	or	 r2,r0,r20
	bsr.n	 _strncmp
	or	 r4,r0,r23
	bcnd	 ne0,r2,@L4532
	ld	 r12,r24,12
	cmp	 r13,r12,8
	bb0	 ne,r13,@L4541
	bb1.n	 ls,r13,@L4551
	cmp	 r13,r12,10
	bb0.n	 ne,r13,@L4543
	cmp	 r13,r12,15
	bb0.n	 ne,r13,@L4586
	or.u	 r13,r0,hi16(_pedantic)
	br	 @L4531
	align	 4
@L4551:
	cmp	 r13,r12,5
	bb0.n	 hs,r13,@L4531
	or	 r2,r0,1
	bsr.n	 _xcalloc
	or	 r3,r0,24
	ld	 r13,r22,lo16(_if_stack)
	st	 r13,r0,r2
	ld	 r13,r21,12
	st	 r13,r2,8
	ld	 r13,r21,4
	st	 r13,r2,4
	ld	 r13,r24,12
	st	 r2,r22,lo16(_if_stack)
	br.n	 @L4531
	st	 r13,r2,20
	align	 4
@L4541:
	or.u	 r13,r0,hi16(_pedantic)
@L4586:
	ld	 r13,r13,lo16(_pedantic)
	bcnd.n	 eq0,r13,@L4587
	or.u	 r13,r0,hi16(_indepth)
	ld	 r13,r22,lo16(_if_stack)
	cmp	 r13,r13,r16
	bb0.n	 ne,r13,@L4587
	or.u	 r13,r0,hi16(_indepth)
	bsr.n	 _validate_else
	or	 r2,r0,r25
@L4543:
	or.u	 r13,r0,hi16(_indepth)
@L4587:
	ld	 r13,r13,lo16(_indepth)
	mul	 r13,r13,44
	or.u	 r19,r0,hi16(_instack)
	or	 r19,r19,lo16(_instack)
	ld	 r2,r22,lo16(_if_stack)
	addu	 r13,r13,r19
	ld	 r13,r13,32
	cmp	 r13,r2,r13
	bb1.n	 eq,r13,@L4564
	cmp	 r13,r2,r16
	bb0	 ne,r13,@L4559
	ld	 r13,r24,12
	cmp	 r13,r13,15
	bb0	 ne,r13,@L4547
	ld	 r13,r2,20
	cmp	 r13,r13,8
	bb1.n	 ne,r13,@L4548
	or.u	 r2,r0,hi16(@LC270)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC270)
@L4548:
	ld	 r12,r22,lo16(_if_stack)
	ld	 r13,r24,12
	br.n	 @L4531
	st	 r13,r12,20
	align	 4
@L4547:
	ld	 r13,r0,r2
	st	 r13,r22,lo16(_if_stack)
	bsr.n	 _free
	addu	 r1,r1,@L4595
@L4596:
	align	 4
@L4532:
	addu	 r24,r24,20
	ld	 r13,r0,r24
	bcnd.n	 ge0,r13,@L4588
	cmp	 r13,r23,r13
@L4531:
	ld	 r13,r0,r24
	bcnd.n	 ge0,r13,@L4581
	cmp	 r13,r25,r18
@L4563:
	or.u	 r13,r0,hi16(_lang_asm)
	ld	 r13,r13,lo16(_lang_asm)
	bcnd.n	 ne0,r13,@L4581
	cmp	 r13,r25,r18
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	bcnd.n	 eq0,r13,@L4581
	cmp	 r13,r25,r18
	or.u	 r2,r0,hi16(@LC271)
	or	 r2,r2,lo16(@LC271)
@L4578:
	bsr	 _pedwarn
@L4403:
	cmp	 r13,r25,r18
@L4581:
	bb1	 lo,r13,@L4405
@L4404:
	br.n	 @L4559
	st	 r25,r21,24
	align	 4
@L4401:
	or	 r2,r0,r21
	or	 r3,r0,r23
	or	 r4,r0,1
	or	 r5,r0,0
	or	 r13,r0,1
	bsr.n	 _output_line_command
	st	 r13,r11,12
@L4559:
	or	 r2,r0,0
@Lte45:
	ld	 r1,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	ld.d	 r14,r31,32
	jmp.n	 r1
	addu	 r31,r31,96
	def	 @L4595,@L4531-@L4596
	def	 @L4593,@L4531-@L4594
	def	 @L4591,@L4559-@L4592

data
	align	 8
@LC278:
	string	 "text following `#endif' violates ANSI standard\000"
	align	 8
@LC279:
	string	 "unbalanced `#endif'\000"
text
	align	 8
_do_endif:
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	subu	 r31,r31,80
	st	 r1,r31,64
	st	 r21,r31,44
	st.d	 r24,r31,56
	or	 r21,r0,r4
	bcnd.n	 eq0,r13,@L4634
	st.d	 r22,r31,48
@Ltb46:
	or.u	 r13,r0,hi16(_is_hor_space)
	ld.bu	 r12,r0,r2
	or	 r11,r13,lo16(_is_hor_space)
	ld.bu	 r13,r12,r11
	bcnd	 eq0,r13,@L4636
	or	 r12,r0,r11
	addu	 r2,r2,1
@L4674:
	ld.bu	 r13,r0,r2
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L4674
	addu	 r2,r2,1
	subu	 r2,r2,1
@L4636:
	cmp	 r13,r2,r3
	bb0.n	 ne,r13,@L4634
	or.u	 r2,r0,hi16(@LC278)
	bsr.n	 _pedwarn
	or	 r2,r2,lo16(@LC278)
@L4634:
	or.u	 r13,r0,hi16(_indepth)
	ld	 r12,r13,lo16(_indepth)
	mul	 r12,r12,44
	or.u	 r13,r0,hi16(_instack)
	or.u	 r10,r0,hi16(_if_stack)
	or	 r13,r13,lo16(_instack)
	ld	 r2,r10,lo16(_if_stack)
	addu	 r11,r12,r13
	ld	 r13,r11,32
	cmp	 r13,r2,r13
	bb1.n	 ne,r13,@L4644
	or	 r22,r0,r2
	or.u	 r2,r0,hi16(@LC279)
	or	 r2,r2,lo16(@LC279)
	bsr.n	 _error
	addu	 r1,r1,@L4676
@L4677:
	align	 4
@L4644:
	ld	 r13,r0,r22
	ld	 r12,r22,16
	bcnd.n	 eq0,r12,@L4646
	st	 r13,r10,lo16(_if_stack)
	or	 r24,r0,r11
	ld	 r12,r24,20
	ld	 r13,r24,16
	ld	 r11,r24,24
	addu	 r23,r12,r13
@L4673:
	cmp	 r13,r11,r23
@L4675:
	bb0	 ne,r13,@L4648
	ld.bu	 r13,r0,r11
	mask	 r12,r13,0xff
	cmp	 r13,r12,32
	bb1.n	 eq,r13,@L4673
	addu	 r11,r11,1
	bb1.n	 gt,r13,@L4659
	cmp	 r13,r12,47
	cmp	 r13,r12,10
	bb0.n	 le,r13,@L4646
	cmp	 r13,r12,9
	bb0.n	 ge,r13,@L4646
	cmp	 r13,r11,r23
	br	 @L4675
	align	 4
@L4659:
	bb0.n	 eq,r13,@L4646
	cmp	 r13,r11,r23
	bb0	 ne,r13,@L4648
	ld.bu	 r13,r0,r11
	cmp	 r13,r13,42
	bb1.n	 ne,r13,@L4675
	cmp	 r13,r11,r23
	ld	 r25,r24,24
	or	 r2,r0,r24
	addu	 r3,r31,72
	or	 r4,r0,1
	addu	 r13,r11,1
	bsr.n	 _skip_to_end_of_comment
	st	 r13,r24,24
	st	 r25,r24,24
	br.n	 @L4673
	or	 r11,r0,r2
	align	 4
@L4648:
	or.u	 r13,r0,hi16(_indepth)
	ld	 r13,r13,lo16(_indepth)
	bcnd.n	 eq0,r13,@L4646
	or.u	 r13,r0,hi16(_all_include_files)
	ld	 r24,r0,r24
	ld	 r25,r13,lo16(_all_include_files)
	ld	 r23,r22,16
	bcnd	 eq0,r25,@L4664
@L4666:
	ld	 r2,r25,4
	bsr.n	 _strcmp
	or	 r3,r0,r24
	bcnd	 eq0,r2,@L4669
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L4666
@L4664:
	bsr	 _abort
	align	 4
@L4669:
	st	 r23,r25,8
@L4646:
	bsr.n	 _free
	or	 r2,r0,r22
	or.u	 r13,r0,hi16(_indepth)
	ld	 r13,r13,lo16(_indepth)
	or.u	 r2,r0,hi16(_instack)
	mul	 r13,r13,44
	or	 r3,r0,r21
	or	 r4,r0,1
	or	 r2,r2,lo16(_instack)
	or	 r5,r0,0
	bsr.n	 _output_line_command
	addu	 r2,r13,r2
@L4645:
@Lte46:
	ld	 r1,r31,64
	ld	 r21,r31,44
	ld.d	 r24,r31,56
	or	 r2,r0,0
	ld.d	 r22,r31,48
	jmp.n	 r1
	addu	 r31,r31,80
	def	 @L4676,@L4645-@L4677

data
	align	 8
@LC280:
	string	 "text following `#else' or `#endif' violates ANSI "
	string	 "standard\000"
text
	align	 8
_validate_else:
	subu	 r31,r31,48
	or	 r4,r0,92
	or	 r5,r0,10
	st	 r1,r31,36
@Ltb47:
@L4749:
	ld.bu	 r13,r0,r2
	cmp	 r13,r13,92
@L4825:
	bb1.n	 ne,r13,@L4823
	or.u	 r13,r0,hi16(_is_hor_space)
	ld.bu	 r13,r2,1
	cmp	 r13,r13,10
	bb1	 ne,r13,@L4750
	addu	 r2,r2,2
@L4750:
	or.u	 r13,r0,hi16(_is_hor_space)
@L4823:
	ld.bu	 r12,r0,r2
	or	 r13,r13,lo16(_is_hor_space)
	ld.bu	 r13,r12,r13
	bcnd	 eq0,r13,@L4751
	addu	 r2,r2,1
	br	 @L4749
	align	 4
@L4814:
	br.n	 @L4749
	addu	 r2,r2,2
	align	 4
@L4751:
	cmp	 r13,r12,47
	bb0	 eq,r13,@L4748
	ld.bu	 r13,r2,1
	cmp	 r13,r13,92
	bb0	 eq,r13,@L4754
	ld.bu	 r13,r2,2
	cmp	 r13,r13,10
	bb0	 eq,r13,@L4754
	addu	 r9,r2,1
	or	 r10,r0,0
	or	 r11,r0,r9
@L4758:
	ld.bu	 r13,r0,r11
	cmp	 r13,r13,92
	bb0	 eq,r13,@L4757
	ld.bu	 r12,r11,1
	cmp	 r13,r12,10
	bb1.n	 ne,r13,@L4760
	cmp	 r13,r12,13
	addu	 r11,r11,2
	br.n	 @L4758
	addu	 r10,r10,1
	align	 4
@L4760:
	bb0	 eq,r13,@L4757
	ld.bu	 r13,r11,2
	cmp	 r13,r13,10
	bb0	 eq,r13,@L4757
	addu	 r11,r11,3
	br.n	 @L4758
	addu	 r10,r10,1
	align	 4
@L4757:
	bcnd	 eq0,r10,@L4754
	ld.bu	 r7,r0,r11
	mask	 r13,r7,0xff
	cmp	 r6,r13,47
	cmp	 r8,r13,42
	or	 r13,r6,r8
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 ne0,r13,@L4754
	or	 r13,r8,r6
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L4824
	or	 r13,r0,r10
@L4770:
	st.b	 r7,r0,r9
	addu	 r11,r11,1
	ld.bu	 r7,r0,r11
	mask	 r13,r7,0xff
	cmp	 r12,r13,42
	cmp	 r13,r13,47
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 ne0,r12,@L4770
	addu	 r9,r9,1
	or	 r13,r0,r10
@L4824:
	bcnd.n	 le0,r13,@L4754
	subu	 r10,r10,1
@L4774:
	st.b	 r4,r0,r9
	addu	 r9,r9,1
	or	 r13,r0,r10
	subu	 r10,r10,1
	st.b	 r5,r0,r9
	bcnd.n	 gt0,r13,@L4774
	addu	 r9,r9,1
@L4754:
	ld.bu	 r12,r2,1
	cmp	 r13,r12,42
	bb1.n	 ne,r13,@L4776
	or.u	 r13,r0,hi16(_cplusplus_comments)
	addu	 r2,r2,2
	ld.bu	 r13,r0,r2
	bcnd.n	 eq0,r13,@L4825
	cmp	 r13,r13,92
@L4779:
	ld.bu	 r13,r2,1
	cmp	 r13,r13,92
	bb0	 eq,r13,@L4780
	ld.bu	 r13,r2,2
	cmp	 r13,r13,10
	bb0	 eq,r13,@L4780
	addu	 r7,r2,1
	or	 r8,r0,0
	or	 r11,r0,r7
@L4784:
	ld.bu	 r13,r0,r11
	cmp	 r13,r13,92
	bb0	 eq,r13,@L4783
	ld.bu	 r12,r11,1
	cmp	 r13,r12,10
	bb1.n	 ne,r13,@L4786
	cmp	 r13,r12,13
	addu	 r11,r11,2
	br.n	 @L4784
	addu	 r8,r8,1
	align	 4
@L4786:
	bb0	 eq,r13,@L4783
	ld.bu	 r13,r11,2
	cmp	 r13,r13,10
	bb0	 eq,r13,@L4783
	addu	 r11,r11,3
	br.n	 @L4784
	addu	 r8,r8,1
	align	 4
@L4783:
	bcnd	 eq0,r8,@L4780
	ld.bu	 r6,r0,r11
	mask	 r13,r6,0xff
	cmp	 r9,r13,47
	cmp	 r10,r13,42
	or	 r13,r9,r10
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 ne0,r13,@L4780
	or	 r13,r10,r9
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L4826
	or	 r13,r0,r8
@L4796:
	st.b	 r6,r0,r7
	addu	 r11,r11,1
	ld.bu	 r6,r0,r11
	mask	 r13,r6,0xff
	cmp	 r12,r13,42
	cmp	 r13,r13,47
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 ne0,r12,@L4796
	addu	 r7,r7,1
	or	 r13,r0,r8
@L4826:
	bcnd.n	 le0,r13,@L4780
	subu	 r8,r8,1
@L4800:
	st.b	 r4,r0,r7
	addu	 r7,r7,1
	or	 r13,r0,r8
	subu	 r8,r8,1
	st.b	 r5,r0,r7
	bcnd.n	 gt0,r13,@L4800
	addu	 r7,r7,1
@L4780:
	ld.bu	 r13,r0,r2
	cmp	 r13,r13,42
	bb1	 ne,r13,@L4802
	ld.bu	 r13,r2,1
	cmp	 r13,r13,47
	bb1	 eq,r13,@L4814
@L4802:
	addu	 r2,r2,1
	ld.bu	 r13,r0,r2
	bcnd.n	 ne0,r13,@L4779
	cmp	 r13,r13,92
	br	 @L4825
	align	 4
@L4776:
	ld	 r13,r13,lo16(_cplusplus_comments)
	bcnd.n	 eq0,r13,@L4749
	cmp	 r13,r12,47
	bb1	 ne,r13,@L4749
	addu	 r2,r2,2
@L4822:
	ld.bu	 r13,r0,r2
	bcnd.n	 eq0,r13,@L4825
	cmp	 r13,r13,92
	ld.bu	 r13,r0,r2
	cmp	 r13,r13,10
	bb1.n	 eq,r13,@L4749
	addu	 r2,r2,1
	br	 @L4822
	align	 4
@L4748:
	ld.bu	 r13,r0,r2
	cmp	 r12,r13,0
	cmp	 r13,r13,10
	or	 r12,r12,r13
	extu	 r13,r12,1<eq>
	xor	 r12,r13,1
	bcnd.n	 eq0,r12,@L4813
	or.u	 r2,r0,hi16(@LC280)
	bsr.n	 _pedwarn
	or	 r2,r2,lo16(@LC280)
@L4813:
@Lte47:
	ld	 r1,r31,36
	jmp.n	 r1
	addu	 r31,r31,48

data
	align	 8
@LC281:
	string	 "`/*' within comment\000"
text
	align	 8
_skip_to_end_of_comment:
	or.u	 r13,r0,hi16(_put_out_comments)
	ld	 r13,r13,lo16(_put_out_comments)
	subu	 r31,r31,80
	st	 r1,r31,64
	st.d	 r20,r31,40
	or	 r20,r0,r2
	st.d	 r24,r31,56
	or	 r21,r0,r3
	st.d	 r18,r31,32
	or	 r18,r0,r4
	st.d	 r22,r31,48
@Ltb48:
	cmp	 r12,r21,0
	ld	 r25,r20,24
	cmp	 r13,r13,0
	ld	 r11,r20,20
	and.c	 r13,r12,r13
	ld	 r12,r20,16
	extu	 r22,r13,1<eq>
	or.u	 r13,r0,hi16(_outbuf)
	addu	 r23,r11,r12
	bcnd.n	 eq0,r22,@L4882
	or	 r24,r13,lo16(_outbuf)
	ld	 r12,r24,24
	addu	 r13,r12,1
	st	 r13,r24,24
	or	 r13,r0,47
	st.b	 r13,r0,r12
	ld	 r12,r24,24
	addu	 r13,r12,1
	st	 r13,r24,24
	or	 r13,r0,42
	st.b	 r13,r0,r12
@L4882:
	or.u	 r13,r0,hi16(_cplusplus_comments)
	ld	 r13,r13,lo16(_cplusplus_comments)
	bcnd.n	 eq0,r13,@L4883
	subu	 r13,r0,1
	ld.bu	 r13,r25,r13
	cmp	 r13,r13,47
	bb1	 ne,r13,@L4883
	bcnd.n	 eq0,r22,@L4884
	cmp	 r11,r25,r23
	bb0.n	 lo,r11,@L4886
	subu	 r13,r23,r25
	bb1.n	 ge,r11,@L4979
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L4887
	cmp	 r13,r12,1
	bb1.n	 le,r13,@L4979
	cmp	 r13,r12,2
	bb1	 le,r13,@L4981
	br	 @L4983
	align	 4
@L4887:
	ld	 r11,r24,24
	addu	 r13,r11,1
	st	 r13,r24,24
	ld.bu	 r12,r0,r25
	mask	 r13,r12,0xff
	addu	 r25,r25,1
	cmp	 r13,r13,10
	bb0.n	 ne,r13,@L4936
	st.b	 r12,r0,r11
@L4983:
	ld	 r11,r24,24
	addu	 r13,r11,1
	st	 r13,r24,24
	ld.bu	 r12,r0,r25
	mask	 r13,r12,0xff
	addu	 r25,r25,1
	cmp	 r13,r13,10
	bb0.n	 ne,r13,@L4936
	st.b	 r12,r0,r11
@L4981:
	ld	 r11,r24,24
	addu	 r13,r11,1
	st	 r13,r24,24
	ld.bu	 r12,r0,r25
	mask	 r13,r12,0xff
	addu	 r25,r25,1
	cmp	 r13,r13,10
	bb0.n	 ne,r13,@L4936
	st.b	 r12,r0,r11
@L4979:
	ld	 r11,r24,24
	addu	 r13,r11,1
	st	 r13,r24,24
	ld.bu	 r12,r0,r25
	mask	 r13,r12,0xff
	addu	 r25,r25,1
	cmp	 r13,r13,10
	bb0.n	 ne,r13,@L4936
	st.b	 r12,r0,r11
	cmp	 r13,r25,r23
	bb1	 lo,r13,@L4887
@L4886:
	ld	 r11,r24,24
	subu	 r12,r0,1
	or	 r13,r0,42
	st.b	 r13,r11,r12
	ld	 r12,r24,24
	addu	 r13,r12,1
	st	 r13,r24,24
	or	 r13,r0,47
	st.b	 r13,r0,r12
	ld	 r12,r24,24
	addu	 r13,r12,1
	st	 r13,r24,24
	or	 r13,r0,10
	br.n	 @L4897
	st.b	 r13,r0,r12
	align	 4
@L4936:
	br.n	 @L4886
	subu	 r25,r25,1
	align	 4
@L4937:
	br.n	 @L4897
	subu	 r25,r25,1
	align	 4
@L4884:
	bb0.n	 lo,r11,@L4897
	subu	 r13,r23,r25
	bb1.n	 ge,r11,@L4980
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L4893
	cmp	 r13,r12,1
	bb1.n	 le,r13,@L4980
	cmp	 r13,r12,2
	bb1	 le,r13,@L4982
	br	 @L4984
	align	 4
@L4893:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,10
	bb1.n	 eq,r13,@L4937
	addu	 r25,r25,1
@L4984:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,10
	bb1.n	 eq,r13,@L4937
	addu	 r25,r25,1
@L4982:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,10
	bb1.n	 eq,r13,@L4937
	addu	 r25,r25,1
@L4980:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,10
	bb1.n	 eq,r13,@L4937
	addu	 r25,r25,1
	cmp	 r13,r25,r23
	bb1.n	 lo,r13,@L4893
	or	 r2,r0,r25
	br	 @L4985
	align	 4
@L4883:
	cmp	 r13,r25,r23
	bb0.n	 lo,r13,@L4897
	or	 r19,r0,92
@L4898:
	bcnd	 eq0,r22,@L4899
	ld	 r13,r24,24
	addu	 r12,r13,1
	st	 r12,r24,24
	ld.bu	 r12,r0,r25
	st.b	 r12,r0,r13
@L4899:
	ld.bu	 r13,r0,r25
	cmp	 r12,r13,42
	bb0.n	 ne,r12,@L4906
	addu	 r25,r25,1
	bb1	 gt,r12,@L4933
	cmp	 r13,r13,10
	bb0.n	 ne,r13,@L4903
	cmp	 r13,r25,r23
	br	 @L4986
	align	 4
@L4933:
	cmp	 r13,r13,47
	bb1.n	 ne,r13,@L4986
	cmp	 r13,r25,r23
	or.u	 r13,r0,hi16(_warn_comments)
	ld	 r13,r13,lo16(_warn_comments)
	cmp	 r12,r18,0
	cmp	 r13,r13,0
	and.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L4986
	cmp	 r13,r25,r23
	bb0	 lo,r13,@L4897
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,42
	bb1.n	 ne,r13,@L4986
	cmp	 r13,r25,r23
	or.u	 r2,r0,hi16(@LC281)
	or	 r2,r2,lo16(@LC281)
	bsr.n	 _warning
	addu	 r1,r1,@L4988
@L4989:
	align	 4
@L4903:
	bcnd	 eq0,r21,@L4904
	ld	 r13,r0,r21
	addu	 r13,r13,1
	st	 r13,r0,r21
@L4904:
	bcnd.n	 eq0,r22,@L4986
	cmp	 r13,r25,r23
	ld	 r13,r24,12
	addu	 r13,r13,1
	br.n	 @L4896
	st	 r13,r24,12
	align	 4
@L4906:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,92
	bb0	 eq,r13,@L4907
	ld.bu	 r13,r25,1
	cmp	 r13,r13,10
	bb0	 eq,r13,@L4907
	or	 r8,r0,r25
	or	 r11,r0,r25
	or	 r10,r0,0
@L4911:
	ld.bu	 r13,r0,r11
	cmp	 r13,r13,92
	bb0	 eq,r13,@L4910
	ld.bu	 r12,r11,1
	cmp	 r13,r12,10
	bb1.n	 ne,r13,@L4913
	cmp	 r13,r12,13
	addu	 r11,r11,2
	br.n	 @L4911
	addu	 r10,r10,1
	align	 4
@L4913:
	bb0	 eq,r13,@L4910
	ld.bu	 r13,r11,2
	cmp	 r13,r13,10
	bb0	 eq,r13,@L4910
	addu	 r11,r11,3
	br.n	 @L4911
	addu	 r10,r10,1
	align	 4
@L4910:
	bcnd	 eq0,r10,@L4907
	ld.bu	 r7,r0,r11
	mask	 r13,r7,0xff
	cmp	 r6,r13,47
	cmp	 r9,r13,42
	or	 r13,r6,r9
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 ne0,r13,@L4907
	or	 r13,r9,r6
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L4987
	or	 r13,r0,r10
@L4923:
	st.b	 r7,r0,r8
	addu	 r11,r11,1
	ld.bu	 r7,r0,r11
	mask	 r13,r7,0xff
	cmp	 r12,r13,42
	cmp	 r13,r13,47
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 ne0,r12,@L4923
	addu	 r8,r8,1
	or	 r13,r0,r10
@L4987:
	bcnd.n	 le0,r13,@L4907
	subu	 r10,r10,1
	or	 r12,r0,10
@L4927:
	st.b	 r19,r0,r8
	addu	 r8,r8,1
	or	 r13,r0,r10
	subu	 r10,r10,1
	st.b	 r12,r0,r8
	bcnd.n	 gt0,r13,@L4927
	addu	 r8,r8,1
@L4907:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,47
	bb1	 ne,r13,@L4896
	bcnd	 eq0,r22,@L4930
	ld	 r13,r24,24
	addu	 r12,r13,1
	st	 r12,r24,24
	or	 r12,r0,47
	st.b	 r12,r0,r13
@L4930:
	addu	 r25,r25,1
	st	 r25,r20,24
	br.n	 @L4935
	or	 r2,r0,r25
	align	 4
@L4896:
	cmp	 r13,r25,r23
@L4986:
	bb1	 lo,r13,@L4898
@L4897:
	or	 r2,r0,r25
@L4985:
	st	 r2,r20,24
@L4935:
@Lte48:
	ld	 r1,r31,64
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	ld.d	 r18,r31,32
	jmp.n	 r1
	addu	 r31,r31,80
	def	 @L4988,@L4896-@L4989

data
	align	 8
@LC282:
	string	 "unterminated string or character constant\000"
	align	 8
@LC283:
	string	 "unterminated character constant\000"
text
	align	 8
_skip_quoted_string:
	subu	 r31,r31,64
	st	 r1,r31,48
	st	 r23,r31,36
	st.d	 r24,r31,40
@Ltb49:
	or	 r25,r0,r2
	or	 r2,r0,r4
	ld.bu	 r13,r0,r25
	or	 r24,r0,r7
	or	 r23,r0,1
	mask	 r11,r13,0xff
	addu	 r25,r25,1
	cmp	 r10,r11,39
@L5021:
	cmp	 r13,r25,r3
@L5050:
	bb1	 lo,r13,@L5022
	bsr	 _line_for_error
	or.u	 r3,r0,hi16(@LC282)
	br.n	 @L5047
	or	 r3,r3,lo16(@LC282)
	align	 4
@L5022:
	ld.bu	 r13,r0,r25
	mask	 r12,r13,0xff
	cmp	 r13,r12,92
	bb1.n	 ne,r13,@L5024
	addu	 r25,r25,1
	br	 @L5048
	align	 4
@L5031:
	ld.bu	 r13,r25,1
	cmp	 r13,r13,10
	bb0	 eq,r13,@L5026
	bcnd	 eq0,r6,@L5029
	st	 r23,r0,r6
@L5029:
	bcnd	 eq0,r5,@L5030
	ld	 r13,r0,r5
	addu	 r13,r13,1
	st	 r13,r0,r5
@L5030:
	addu	 r25,r25,2
@L5048:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,92
	bb1	 eq,r13,@L5031
@L5026:
	ld.bu	 r12,r0,r25
	cmp	 r13,r5,0
	cmp	 r12,r12,10
	and.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5032
	bcnd	 eq0,r6,@L5033
	st	 r23,r0,r6
@L5033:
	ld	 r13,r0,r5
	addu	 r13,r13,1
	st	 r13,r0,r5
@L5032:
	br.n	 @L5021
	addu	 r25,r25,1
	align	 4
@L5024:
	cmp	 r13,r12,10
	bb1.n	 ne,r13,@L5035
	cmp	 r13,r12,r11
	or.u	 r13,r0,hi16(_traditional)
	ld	 r13,r13,lo16(_traditional)
	bcnd	 eq0,r13,@L5036
	subu	 r25,r25,1
	br	 @L5049
	align	 4
@L5036:
	bb1	 ne,r10,@L5040
	bsr.n	 _line_for_error
	subu	 r25,r25,1
	or.u	 r3,r0,hi16(@LC283)
	or	 r3,r3,lo16(@LC283)
@L5047:
	bsr	 _error_with_line
@L5049:
	bcnd	 eq0,r24,@L5020
	st	 r23,r0,r24
	br	 @L5020
	align	 4
@L5040:
	bcnd.n	 eq0,r5,@L5050
	cmp	 r13,r25,r3
	ld	 r13,r0,r5
	addu	 r13,r13,1
	br.n	 @L5021
	st	 r13,r0,r5
	align	 4
@L5035:
	bb1.n	 ne,r13,@L5050
	cmp	 r13,r25,r3
@L5020:
@Lte49:
	ld	 r1,r31,48
	ld	 r23,r31,36
	or	 r2,r0,r25
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
_skip_paren_group:
	subu	 r31,r31,96
	st	 r1,r31,80
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	st.d	 r18,r31,48
	or	 r22,r0,r2
	st.d	 r16,r31,40
@Ltb50:
	ld	 r13,r22,20
	ld	 r12,r22,16
	ld	 r2,r22,24
	addu	 r18,r13,r12
	or	 r19,r0,0
	cmp	 r13,r2,r18
	bb0.n	 ne,r13,@L5152
	st	 r0,r31,88
	or	 r16,r0,10
	or	 r17,r0,92
@L5153:
	ld.bu	 r12,r0,r2
	cmp	 r13,r12,40
	bb0.n	 ne,r13,@L5155
	addu	 r2,r2,1
	bb1.n	 gt,r13,@L5247
	cmp	 r13,r12,41
	cmp	 r13,r12,34
	bb0.n	 ne,r13,@L5215
	cmp	 r13,r12,39
	bb0.n	 ne,r13,@L5215
	cmp	 r13,r2,r18
	br	 @L5302
	align	 4
@L5247:
	bb0.n	 ne,r13,@L5156
	cmp	 r13,r12,47
	bb0.n	 ne,r13,@L5158
	cmp	 r13,r2,r18
	br	 @L5302
	align	 4
@L5155:
	br.n	 @L5151
	addu	 r19,r19,1
	align	 4
@L5156:
	subu	 r19,r19,1
	bcnd.n	 ne0,r19,@L5302
	cmp	 r13,r2,r18
	br.n	 @L5303
	st	 r2,r22,24
	align	 4
@L5158:
	ld.bu	 r13,r0,r2
	cmp	 r13,r13,42
	bb1	 ne,r13,@L5215
	ld	 r10,r22,20
	ld	 r12,r22,16
	st	 r2,r22,24
	or.u	 r13,r0,hi16(_cplusplus_comments)
	or	 r25,r0,r2
	addu	 r21,r31,88
	or	 r20,r0,0
	ld	 r11,r13,lo16(_cplusplus_comments)
	or.u	 r13,r0,hi16(_outbuf)
	addu	 r24,r10,r12
	bcnd.n	 eq0,r11,@L5175
	or	 r23,r13,lo16(_outbuf)
	subu	 r13,r0,1
	ld.bu	 r13,r2,r13
	cmp	 r13,r13,47
	bb1.n	 ne,r13,@L5304
	cmp	 r13,r25,r24
	br.n	 @L5163
	cmp	 r13,r2,r24
	align	 4
@L5251:
	br.n	 @L5176
	subu	 r25,r25,1
	align	 4
@L5163:
	bb0.n	 lo,r13,@L5176
	subu	 r13,r24,r25
	cmp	 r12,r25,r24
	bb1.n	 ge,r12,@L5297
	mask	 r11,r13,3
	bcnd.n	 eq0,r11,@L5172
	cmp	 r13,r11,1
	bb1.n	 le,r13,@L5297
	cmp	 r13,r11,2
	bb1	 le,r13,@L5300
	br	 @L5301
	align	 4
@L5172:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,10
	bb0.n	 ne,r13,@L5251
	addu	 r25,r25,1
@L5301:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,10
	bb0.n	 ne,r13,@L5251
	addu	 r25,r25,1
@L5300:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,10
	bb0.n	 ne,r13,@L5251
	addu	 r25,r25,1
@L5297:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,10
	bb0.n	 ne,r13,@L5251
	addu	 r25,r25,1
	cmp	 r13,r25,r24
	bb1	 lo,r13,@L5172
	st	 r25,r22,24
	br	 @L5305
	align	 4
@L5252:
	bsr.n	 _line_for_error
	or	 r2,r0,0
	or.u	 r3,r0,hi16(@LC282)
	br.n	 @L5298
	or	 r3,r3,lo16(@LC282)
	align	 4
@L5253:
	or	 r13,r0,1
	st	 r13,r0,r24
	br.n	 @L5218
	subu	 r25,r25,1
	align	 4
@L5177:
	bcnd	 eq0,r20,@L5178
	ld	 r13,r23,24
	addu	 r12,r13,1
	st	 r12,r23,24
	ld.bu	 r12,r0,r25
	st.b	 r12,r0,r13
@L5178:
	ld.bu	 r13,r0,r25
	cmp	 r12,r13,42
	bb0.n	 ne,r12,@L5185
	addu	 r25,r25,1
	bb1	 gt,r12,@L5212
	cmp	 r13,r13,10
	bb0.n	 ne,r13,@L5182
	cmp	 r13,r25,r24
	br	 @L5304
	align	 4
@L5212:
	cmp	 r13,r13,47
	bb1.n	 ne,r13,@L5304
	cmp	 r13,r25,r24
	or.u	 r13,r0,hi16(_warn_comments)
	ld	 r13,r13,lo16(_warn_comments)
	bcnd.n	 eq0,r13,@L5304
	cmp	 r13,r25,r24
	bb0	 lo,r13,@L5176
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,42
	bb1.n	 ne,r13,@L5304
	cmp	 r13,r25,r24
	or.u	 r2,r0,hi16(@LC281)
	or	 r2,r2,lo16(@LC281)
	bsr.n	 _warning
	addu	 r1,r1,@L5308
@L5309:
	align	 4
@L5182:
	bcnd	 eq0,r21,@L5183
	ld	 r13,r0,r21
	addu	 r13,r13,1
	st	 r13,r0,r21
@L5183:
	bcnd.n	 eq0,r20,@L5304
	cmp	 r13,r25,r24
	ld	 r13,r23,12
	addu	 r13,r13,1
	br.n	 @L5175
	st	 r13,r23,12
	align	 4
@L5185:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,92
	bb0	 eq,r13,@L5186
	ld.bu	 r13,r25,1
	cmp	 r13,r13,10
	bb0	 eq,r13,@L5186
	or	 r7,r0,r25
	or	 r11,r0,r25
	or	 r8,r0,0
@L5190:
	ld.bu	 r13,r0,r11
	cmp	 r13,r13,92
	bb0	 eq,r13,@L5189
	ld.bu	 r12,r11,1
	cmp	 r13,r12,10
	bb1.n	 ne,r13,@L5192
	cmp	 r13,r12,13
	addu	 r11,r11,2
	br.n	 @L5190
	addu	 r8,r8,1
	align	 4
@L5192:
	bb0	 eq,r13,@L5189
	ld.bu	 r13,r11,2
	cmp	 r13,r13,10
	bb0	 eq,r13,@L5189
	addu	 r11,r11,3
	br.n	 @L5190
	addu	 r8,r8,1
	align	 4
@L5189:
	bcnd	 eq0,r8,@L5186
	ld.bu	 r6,r0,r11
	mask	 r13,r6,0xff
	cmp	 r9,r13,47
	cmp	 r10,r13,42
	or	 r13,r9,r10
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 ne0,r13,@L5186
	or	 r13,r10,r9
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L5306
	or	 r13,r0,r8
@L5202:
	st.b	 r6,r0,r7
	addu	 r11,r11,1
	ld.bu	 r6,r0,r11
	mask	 r13,r6,0xff
	cmp	 r12,r13,42
	cmp	 r13,r13,47
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 ne0,r12,@L5202
	addu	 r7,r7,1
	or	 r13,r0,r8
@L5306:
	bcnd.n	 le0,r13,@L5186
	subu	 r8,r8,1
@L5206:
	st.b	 r17,r0,r7
	addu	 r7,r7,1
	or	 r13,r0,r8
	subu	 r8,r8,1
	st.b	 r16,r0,r7
	bcnd.n	 gt0,r13,@L5206
	addu	 r7,r7,1
@L5186:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,47
	bb1	 ne,r13,@L5175
	bcnd	 eq0,r20,@L5209
	ld	 r13,r23,24
	addu	 r12,r13,1
	st	 r12,r23,24
	or	 r12,r0,47
	st.b	 r12,r0,r13
@L5209:
	br.n	 @L5176
	addu	 r25,r25,1
	align	 4
@L5175:
	cmp	 r13,r25,r24
@L5304:
	bb1	 lo,r13,@L5177
@L5176:
	st	 r25,r22,24
@L5305:
	ld	 r2,r22,24
@L5215:
	st	 r0,r31,92
	subu	 r25,r2,1
	ld.bu	 r13,r0,r25
	addu	 r24,r31,92
	mask	 r11,r13,0xff
	or	 r25,r0,r2
	cmp	 r10,r11,39
@L5219:
	cmp	 r13,r25,r18
@L5307:
	bb1	 hs,r13,@L5252
	ld.bu	 r13,r0,r25
	mask	 r12,r13,0xff
	cmp	 r13,r12,92
	bb1.n	 ne,r13,@L5222
	addu	 r25,r25,1
	br	 @L5299
	align	 4
@L5229:
	ld.bu	 r13,r25,1
	cmp	 r13,r13,10
	bb0	 eq,r13,@L5224
	addu	 r25,r25,2
@L5299:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,92
	bb1	 eq,r13,@L5229
@L5224:
	br.n	 @L5219
	addu	 r25,r25,1
	align	 4
@L5222:
	cmp	 r13,r12,10
	bb1.n	 ne,r13,@L5233
	cmp	 r13,r12,r11
	or.u	 r13,r0,hi16(_traditional)
	ld	 r13,r13,lo16(_traditional)
	bcnd	 ne0,r13,@L5253
	bb1.n	 ne,r10,@L5307
	cmp	 r13,r25,r18
	bsr.n	 _line_for_error
	or	 r2,r0,0
	or.u	 r3,r0,hi16(@LC283)
	or	 r3,r3,lo16(@LC283)
	subu	 r25,r25,1
@L5298:
	bsr	 _error_with_line
	or	 r13,r0,1
	br.n	 @L5218
	st	 r13,r0,r24
	align	 4
@L5233:
	bb1.n	 ne,r13,@L5307
	cmp	 r13,r25,r18
@L5218:
	ld	 r13,r31,92
	bcnd.n	 ne0,r13,@L5152
	or	 r2,r0,r25
@L5151:
	cmp	 r13,r2,r18
@L5302:
	bb1	 ne,r13,@L5153
@L5152:
	st	 r2,r22,24
@L5303:
@Lte50:
	ld	 r1,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	jmp.n	 r1
	addu	 r31,r31,96
	def	 @L5308,@L5175-@L5309

data
	align	 8
@LC284:
	string	 "# %d \"%s\"\000"
	align	 8
@LC285:
	string	 " 1\000"
	align	 8
@LC286:
	string	 " 2\000"
	align	 8
@LC287:
	string	 " 3\000"
text
	align	 8
_output_line_command:
	or.u	 r13,r0,hi16(_no_line_commands)
	ld	 r13,r13,lo16(_no_line_commands)
	subu	 r31,r31,80
	st	 r30,r31,64
	addu	 r30,r31,64
	st.d	 r24,r31,56
	or	 r24,r0,r2
	st	 r1,r31,68
	or	 r25,r0,r3
	st.d	 r22,r31,48
	or	 r23,r0,r5
	bcnd.n	 ne0,r13,@L5332
	st	 r21,r31,44
@Ltb51:
	ld	 r13,r0,r24
	bcnd.n	 eq0,r13,@L5332
	or.u	 r13,r0,hi16(_no_output)
	ld	 r13,r13,lo16(_no_output)
	bcnd	 ne0,r13,@L5332
	bcnd	 eq0,r4,@L5313
	ld	 r11,r24,12
	ld	 r13,r25,12
	cmp	 r12,r11,r13
	bb0	 ne,r12,@L5310
	bb0.n	 gt,r12,@L5313
	addu	 r13,r13,8
	cmp	 r13,r11,r13
	bb1	 ge,r13,@L5313
	ld	 r13,r25,24
	ld	 r11,r25,20
	ld	 r12,r25,16
	subu	 r13,r13,r11
	subu	 r12,r12,r13
	cmp	 r12,r12,10
	bb1.n	 gt,r12,@L5317
	or	 r2,r0,r25
	bsr.n	 _grow_outbuf
	or	 r3,r0,10
@L5317:
	ld	 r13,r24,12
	ld	 r12,r25,12
	cmp	 r13,r13,r12
	bb0.n	 gt,r13,@L5310
	or	 r11,r0,10
@L5320:
	ld	 r12,r25,24
	addu	 r13,r12,1
	st	 r13,r25,24
	st.b	 r11,r0,r12
	ld	 r12,r25,12
	addu	 r12,r12,1
	st	 r12,r25,12
	ld	 r13,r24,12
	cmp	 r13,r13,r12
	bb1	 gt,r13,@L5320
	subu	 r31,r30,64
	br	 @L5333
	align	 4
@L5313:
	ld	 r13,r24,12
	bcnd	 ne0,r13,@L5322
	ld	 r11,r24,24
	ld	 r13,r24,20
	ld	 r12,r24,16
	subu	 r13,r11,r13
	cmp	 r13,r13,r12
	bb1	 ge,r13,@L5322
	ld.bu	 r13,r0,r11
	cmp	 r13,r13,10
	bb1	 ne,r13,@L5322
	ld	 r13,r24,24
	or	 r12,r0,1
	st	 r12,r24,12
	addu	 r13,r13,1
	st	 r13,r24,24
@L5322:
	bsr.n	 _strlen
	ld	 r2,r24,4
	addu	 r2,r2,115
	ld	 r4,r24,12
	and	 r2,r2,0xfff0
	ld	 r5,r24,4
	subu	 r31,r31,r2
	or.u	 r3,r0,hi16(@LC284)
	addu	 r22,r31,32
	or	 r3,r3,lo16(@LC284)
	bsr.n	 _sprintf
	or	 r2,r0,r22
	bcnd.n	 eq0,r23,@L5323
	cmp	 r13,r23,1
	bb1.n	 ne,r13,@L5324
	or.u	 r13,r0,hi16(@LC286)
	or.u	 r13,r0,hi16(@LC285)
	br.n	 @L5325
	or	 r3,r13,lo16(@LC285)
	align	 4
@L5324:
	or	 r3,r13,lo16(@LC286)
@L5325:
	bsr.n	 _strcat
	or	 r2,r0,r22
@L5323:
	ld.b	 r13,r24,40
	bcnd.n	 eq0,r13,@L5326
	or.u	 r3,r0,hi16(@LC287)
	or	 r2,r0,r22
	bsr.n	 _strcat
	or	 r3,r3,lo16(@LC287)
@L5326:
	bsr.n	 _strlen
	or	 r2,r0,r22
	or	 r23,r0,r2
	or	 r21,r0,10
	st.b	 r21,r22,r23
	ld	 r13,r25,24
	ld	 r11,r25,20
	ld	 r12,r25,16
	addu	 r23,r23,1
	subu	 r13,r13,r11
	addu	 r3,r23,1
	subu	 r12,r12,r13
	cmp	 r12,r12,r3
	bb1	 gt,r12,@L5328
	bsr.n	 _grow_outbuf
	or	 r2,r0,r25
@L5328:
	ld	 r12,r25,24
	ld	 r13,r25,20
	cmp	 r13,r12,r13
	bb0.n	 hi,r13,@L5329
	subu	 r13,r0,1
	ld.bu	 r13,r12,r13
	cmp	 r13,r13,10
	bb0.n	 ne,r13,@L5329
	addu	 r13,r12,1
	st	 r13,r25,24
	st.b	 r21,r0,r12
@L5329:
	or	 r2,r0,r22
	ld	 r3,r25,24
	bsr.n	 _bcopy
	or	 r4,r0,r23
	ld	 r13,r25,24
	addu	 r13,r13,r23
	st	 r13,r25,24
@L5332:
	ld	 r13,r24,12
	st	 r13,r25,12
@L5310:
@Lte51:
	subu	 r31,r30,64
@L5333:
	ld	 r1,r31,68
	ld	 r30,r31,64
	ld	 r21,r31,44
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	jmp.n	 r1
	addu	 r31,r31,80

data
	align	 8
@LC288:
	string	 "macro or `#include' recursion too deep\000"
	align	 8
@LC289:
	string	 "\000"
	align	 8
@LC290:
	string	 "arguments given to macro `%s'\000"
	align	 8
@LC291:
	string	 "macro `%s' used without args\000"
	align	 8
@LC292:
	string	 "macro `%s' used with just one arg\000"
	align	 8
@LC293:
	string	 "macro `%s' used with only %d args\000"
	align	 8
@LC294:
	string	 "macro `%s' used with too many (%d) args\000"
	align	 8
@LC295:
	string	 "\\%03o\000"
text
	align	 8
_macroexpand:
	or.u	 r13,r0,hi16(_indepth)
	ld	 r11,r13,lo16(_indepth)
	subu	 r31,r31,144
	st	 r1,r31,84
	st	 r30,r31,80
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	st.d	 r18,r31,48
	st.d	 r16,r31,40
	addu	 r30,r31,80
	st.d	 r14,r31,32
@Ltb52:
	or.u	 r13,r0,hi16(_instack)
	st	 r2,r30,12
	mul	 r12,r11,44
	ld	 r7,r2,24
	or	 r13,r13,lo16(_instack)
	st	 r7,r30,28
	addu	 r12,r12,r13
	cmp	 r11,r11,198
	ld	 r19,r12,12
	bb0	 gt,r11,@L5335
	bsr.n	 _line_for_error
	or	 r2,r0,r19
	or.u	 r3,r0,hi16(@LC288)
	or	 r3,r3,lo16(@LC288)
	bsr.n	 _error_with_line
	addu	 r1,r1,@L5583
@L5584:
	align	 4
@L5335:
	ld	 r8,r30,12
	ld	 r13,r8,12
	cmp	 r13,r13,31
	bb0.n	 ne,r13,@L5336
	or.u	 r13,r0,hi16(_pcp_inside_if)
	ld	 r2,r30,12
	bsr.n	 _special_symbol
	addu	 r1,r1,@L5585
@L5586:
	align	 4
@L5501:
	bsr.n	 _line_for_error
	or	 r2,r0,r19
	or	 r3,r0,r22
	bsr.n	 _error_with_line
	addu	 r1,r1,@L5587
@L5588:
	align	 4
@L5336:
	ld	 r13,r13,lo16(_pcp_inside_if)
	bcnd.n	 eq0,r13,@L5337
	or.u	 r13,r0,hi16(_pcp_outfile)
	ld	 r3,r13,lo16(_pcp_outfile)
	bcnd	 eq0,r3,@L5337
	ld	 r7,r30,28
	ld	 r13,r7,8
	bcnd	 eq0,r13,@L5337
	bsr.n	 _dump_single_macro
	ld	 r2,r30,12
@L5337:
	ld	 r8,r30,28
	ld	 r8,r0,r8
	bcnd.n	 lt0,r8,@L5338
	st	 r8,r30,20
	addu	 r13,r8,1
	mak	 r13,r13,0<5>
	or	 r22,r0,0
	subu	 r31,r31,r13
	or	 r24,r0,0
	addu	 r7,r31,32
	bcnd.n	 le0,r8,@L5340
	st	 r7,r30,44
	ld	 r12,r30,44
	or.u	 r13,r0,hi16(@LC289)
	mask	 r11,r8,3
	bcnd.n	 eq0,r11,@L5342
	or	 r10,r13,lo16(@LC289)
	cmp	 r13,r11,1
	bb0.n	 gt,r13,@L5548
	cmp	 r13,r11,2
	bb0	 gt,r13,@L5549
	st	 r10,r31,36
	st	 r10,r31,32
	st	 r0,r31,48
	st	 r0,r31,44
	st	 r0,r31,40
	st	 r0,r31,56
	addu	 r12,r31,64
	st	 r0,r31,52
	or	 r24,r0,1
	st.b	 r0,r31,62
@L5549:
	st	 r10,r12,4
	st	 r10,r0,r12
	st	 r0,r12,16
	st	 r0,r12,12
	st	 r0,r12,8
	st	 r0,r12,24
	st	 r0,r12,20
	st.b	 r0,r12,30
	addu	 r12,r12,32
	addu	 r24,r24,1
@L5548:
	st.b	 r0,r12,30
	ld	 r8,r30,20
	st	 r10,r12,4
	st	 r10,r0,r12
	st	 r0,r12,16
	st	 r0,r12,12
	st	 r0,r12,8
	st	 r0,r12,24
	addu	 r24,r24,1
	st	 r0,r12,20
	cmp	 r13,r24,r8
	bb0.n	 lt,r13,@L5340
	addu	 r12,r12,32
@L5342:
	st.b	 r0,r12,30
	st.b	 r0,r12,62
	st.b	 r0,r12,94
	st.b	 r0,r12,126
	ld	 r7,r30,20
	st	 r10,r12,4
	st	 r10,r0,r12
	st	 r0,r12,16
	st	 r0,r12,12
	st	 r0,r12,8
	st	 r0,r12,24
	st	 r0,r12,20
	st	 r10,r12,36
	st	 r10,r12,32
	st	 r0,r12,48
	st	 r0,r12,44
	st	 r0,r12,40
	st	 r0,r12,56
	st	 r0,r12,52
	st	 r10,r12,68
	st	 r10,r12,64
	st	 r0,r12,80
	st	 r0,r12,76
	st	 r0,r12,72
	st	 r0,r12,88
	st	 r0,r12,84
	st	 r10,r12,100
	st	 r10,r12,96
	st	 r0,r12,112
	st	 r0,r12,108
	st	 r0,r12,104
	st	 r0,r12,120
	addu	 r24,r24,4
	st	 r0,r12,116
	cmp	 r13,r24,r7
	bb1.n	 lt,r13,@L5342
	addu	 r12,r12,128
@L5340:
	ld	 r25,r30,44
	or	 r24,r0,0
	or	 r23,r0,0
	or.u	 r13,r0,hi16(_instack)
	or.u	 r20,r0,hi16(_indepth)
	or	 r21,r13,lo16(_instack)
@L5344:
	ld	 r12,r20,lo16(_indepth)
	mul	 r12,r12,44
	addu	 r12,r12,r21
	ld	 r13,r12,24
	addu	 r13,r13,1
	bcnd.n	 ne0,r23,@L5346
	st	 r13,r12,24
	ld	 r8,r30,20
	cmp	 r13,r24,r8
	bb0.n	 ge,r13,@L5349
	cmp	 r13,r8,0
	cmp	 r12,r24,0
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L5348
	or	 r3,r0,0
@L5349:
	ld	 r7,r30,20
	subu	 r13,r7,1
	cmp	 r13,r24,r13
	bb1	 ne,r13,@L5350
	ld	 r8,r30,28
	ld.b	 r13,r8,24
	bcnd	 eq0,r13,@L5350
	or	 r23,r0,1
@L5350:
	or	 r2,r0,r25
	br.n	 @L5565
	or	 r3,r0,r23
	align	 4
@L5348:
	or	 r2,r0,0
@L5565:
	bsr	 _macarg
	or	 r22,r0,r2
	bcnd.n	 ne0,r22,@L5501
	addu	 r25,r25,32
	addu	 r24,r24,1
@L5346:
	ld	 r13,r20,lo16(_indepth)
	mul	 r13,r13,44
	addu	 r13,r13,r21
	ld	 r13,r13,24
	ld.bu	 r13,r0,r13
	cmp	 r13,r13,41
	bb1	 ne,r13,@L5344
@L5345:
	cmp	 r13,r24,1
	bb1	 ne,r13,@L5354
	ld	 r7,r30,44
	ld	 r12,r0,r7
	ld	 r13,r7,8
	addu	 r11,r12,r13
	cmp	 r13,r12,r11
	bb0.n	 ne,r13,@L5356
	or.u	 r13,r0,hi16(_is_space)
	or	 r10,r13,lo16(_is_space)
@L5359:
	ld.bu	 r13,r0,r12
	ld.bu	 r13,r13,r10
	bcnd	 eq0,r13,@L5356
	addu	 r12,r12,1
	cmp	 r13,r12,r11
	bb1	 ne,r13,@L5359
@L5356:
	cmp	 r13,r12,r11
	ext	 r13,r13,1<ne>
	and	 r24,r24,r13
@L5354:
	ld	 r8,r30,20
	cmp	 r11,r24,0
	cmp	 r13,r8,0
	rot	 r12,r13,30
	and	 r13,r12,r11
	extu	 r13,r13,1<gt>
	bcnd.n	 eq0,r13,@L5361
	st	 r0,r30,36
	bcnd.n	 ne0,r22,@L5568
	or.u	 r13,r0,hi16(_indepth)
	ld	 r7,r30,12
	or.u	 r2,r0,hi16(@LC290)
	ld	 r3,r7,20
	or	 r2,r2,lo16(@LC290)
	bsr.n	 _error
	addu	 r1,r1,@L5589
@L5590:
	align	 4
@L5361:
	ld	 r8,r30,20
	cmp	 r13,r24,r8
	bb1	 ge,r13,@L5364
	cmp	 r13,r8,1
	and	 r13,r13,r11
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L5365
	or.u	 r13,r0,hi16(_traditional)
	ld	 r13,r13,lo16(_traditional)
	bcnd.n	 ne0,r13,@L5568
	or.u	 r13,r0,hi16(_indepth)
@L5365:
	ld	 r7,r30,20
	subu	 r13,r7,1
	cmp	 r13,r24,r13
	bb1	 ne,r13,@L5367
	ld	 r8,r30,28
	ld.b	 r13,r8,24
	bcnd.n	 eq0,r13,@L5367
	or	 r7,r0,1
	br.n	 @L5363
	st	 r7,r30,36
	align	 4
@L5367:
	bcnd.n	 ne0,r22,@L5568
	or.u	 r13,r0,hi16(_indepth)
	bcnd.n	 ne0,r24,@L5371
	cmp	 r13,r24,1
	ld	 r8,r30,12
	or.u	 r2,r0,hi16(@LC291)
	ld	 r3,r8,20
	or	 r2,r2,lo16(@LC291)
	bsr.n	 _error
	addu	 r1,r1,@L5591
@L5592:
	align	 4
@L5371:
	bb1.n	 ne,r13,@L5373
	or.u	 r2,r0,hi16(@LC293)
	ld	 r7,r30,12
	or.u	 r2,r0,hi16(@LC292)
	ld	 r3,r7,20
	or	 r2,r2,lo16(@LC292)
	bsr.n	 _error
	addu	 r1,r1,@L5593
@L5594:
	align	 4
@L5373:
	ld	 r8,r30,12
	or	 r4,r0,r24
	ld	 r3,r8,20
	br.n	 @L5566
	or	 r2,r2,lo16(@LC293)
	align	 4
@L5364:
	bb0	 gt,r13,@L5363
	bcnd.n	 ne0,r22,@L5568
	or.u	 r13,r0,hi16(_indepth)
	ld	 r7,r30,12
	or.u	 r2,r0,hi16(@LC294)
	or	 r4,r0,r24
	ld	 r3,r7,20
	or	 r2,r2,lo16(@LC294)
@L5566:
	bsr	 _error
@L5363:
	or.u	 r13,r0,hi16(_indepth)
@L5568:
	ld	 r12,r13,lo16(_indepth)
	mul	 r12,r12,44
	or.u	 r13,r0,hi16(_instack)
	or	 r13,r13,lo16(_instack)
	addu	 r12,r12,r13
	ld	 r13,r12,24
	ld	 r8,r30,20
	addu	 r13,r13,1
	bcnd.n	 ne0,r8,@L5378
	st	 r13,r12,24
	ld	 r7,r30,28
	ld	 r16,r7,12
	ld	 r15,r7,4
	br.n	 @L5569
	or.u	 r11,r0,hi16(_indepth)
	align	 4
@L5378:
	ld	 r8,r30,28
	ld	 r15,r8,4
	ld	 r20,r8,28
	ld	 r7,r8,12
	bcnd.n	 eq0,r20,@L5381
	st	 r7,r30,52
	or.u	 r9,r0,hi16(_traditional)
	set	 r10,r0,16<8>
@L5383:
	ld.b	 r13,r20,4
	bcnd	 eq0,r13,@L5384
	ld	 r13,r20,12
	ld	 r8,r30,44
	mak	 r13,r13,0<5>
	addu	 r13,r8,r13
	ld	 r13,r13,16
	br.n	 @L5570
	addu	 r15,r15,r13
	align	 4
@L5384:
	ld	 r13,r20,4
	and	 r13,r13,r10
	bcnd	 ne0,r13,@L5387
	ld	 r13,r9,lo16(_traditional)
	bcnd	 eq0,r13,@L5386
@L5387:
	ld	 r13,r20,12
	ld	 r7,r30,44
	mak	 r13,r13,0<5>
	addu	 r13,r7,r13
	ld	 r13,r13,8
	br.n	 @L5570
	addu	 r15,r15,r13
	align	 4
@L5386:
	ld	 r13,r20,12
	ld	 r8,r30,44
	mak	 r13,r13,0<5>
	addu	 r13,r8,r13
	ld	 r13,r13,12
	addu	 r15,r15,r13
@L5570:
	ld	 r13,r20,12
	ld	 r7,r30,44
	mak	 r13,r13,0<5>
	addu	 r11,r7,r13
	ld.bu	 r12,r11,30
	ext	 r13,r12,8<0>
	cmp	 r13,r13,9
	bb1.n	 gt,r13,@L5382
	addu	 r13,r12,1
	st.b	 r13,r11,30
@L5382:
	ld	 r20,r0,r20
	bcnd	 ne0,r20,@L5383
@L5381:
	addu	 r2,r15,1
	bsr.n	 _xmalloc
	st	 r0,r30,60
	ld	 r8,r30,28
	or	 r23,r0,0
	ld	 r20,r8,28
	or	 r16,r0,r2
	bcnd.n	 eq0,r20,@L5579
	or	 r11,r0,0
	or.u	 r13,r0,hi16(_is_space)
	or	 r14,r13,lo16(_is_space)
@L5394:
	ld	 r13,r20,12
	ld	 r12,r20,8
	ld	 r7,r30,44
	mak	 r13,r13,0<5>
	or	 r24,r0,0
	bcnd.n	 le0,r12,@L5396
	addu	 r22,r7,r13
	addu	 r12,r23,r16
@L5398:
	ld	 r8,r30,36
	bcnd	 eq0,r8,@L5400
	ld.b	 r13,r20,7
	bcnd	 eq0,r13,@L5401
	ld.b	 r13,r20,5
	bcnd	 ne0,r13,@L5397
@L5401:
	bcnd	 eq0,r11,@L5400
	ld.b	 r13,r11,7
	bcnd	 eq0,r13,@L5400
	ld.b	 r13,r11,6
	bcnd	 ne0,r13,@L5397
@L5400:
	ld	 r7,r30,52
	ld	 r8,r30,60
	ld.bu	 r13,r7,r8
	addu	 r23,r23,1
	st.b	 r13,r0,r12
	addu	 r12,r12,1
@L5397:
	ld	 r13,r20,8
	addu	 r24,r24,1
	ld	 r7,r30,60
	cmp	 r13,r24,r13
	addu	 r7,r7,1
	bb1.n	 lt,r13,@L5398
	st	 r7,r30,60
@L5396:
	ld.b	 r13,r20,4
	bcnd	 eq0,r13,@L5403
	ld	 r19,r22,8
	or	 r17,r0,0
	or	 r18,r0,0
	bcnd.n	 le0,r19,@L5410
	or	 r24,r0,0
	ld	 r12,r0,r22
@L5408:
	ld.bu	 r25,r12,r24
	ld.bu	 r13,r25,r14
	bcnd	 eq0,r13,@L5405
	addu	 r24,r24,1
	cmp	 r13,r24,r19
	bb1	 lt,r13,@L5408
@L5405:
	cmp	 r13,r24,r19
	bb1.n	 ge,r13,@L5571
	or.u	 r13,r0,hi16(_traditional)
	ld	 r13,r0,r22
	subu	 r11,r0,1
	addu	 r12,r19,r13
@L5413:
	ld.bu	 r25,r12,r11
	ld.bu	 r13,r25,r14
	bcnd	 eq0,r13,@L5410
	subu	 r19,r19,1
	cmp	 r13,r24,r19
	bb1.n	 lt,r13,@L5413
	subu	 r12,r12,1
@L5410:
	or.u	 r13,r0,hi16(_traditional)
@L5571:
	ld	 r13,r13,lo16(_traditional)
	bcnd.n	 ne0,r13,@L5572
	cmp	 r13,r24,r19
	or	 r13,r0,34
	st.b	 r13,r16,r23
	addu	 r23,r23,1
	cmp	 r13,r24,r19
@L5572:
	bb0.n	 lt,r13,@L5573
	or.u	 r13,r0,hi16(_traditional)
	addu	 r21,r23,r16
@L5418:
	ld	 r12,r0,r22
	ld.bu	 r25,r12,r24
	cmp	 r13,r25,10
	bb1.n	 ne,r13,@L5419
	addu	 r13,r24,r12
	ld.bu	 r13,r13,1
	cmp	 r13,r13,10
	bb0	 ne,r13,@L5419
	addu	 r24,r24,1
	br.n	 @L5580
	addu	 r24,r24,1
	align	 4
@L5419:
	bcnd.n	 ne0,r18,@L5420
	cmp	 r13,r25,10
	bb1	 ne,r13,@L5421
	ld	 r13,r0,r22
	addu	 r13,r24,r13
	ld.bu	 r13,r13,1
	cmp	 r13,r13,10
	bb1.n	 eq,r13,@L5574
	cmp	 r13,r25,10
	br	 @L5420
	align	 4
@L5421:
	ld.bu	 r13,r25,r14
	bcnd.n	 eq0,r13,@L5420
	cmp	 r13,r25,10
@L5574:
	bb1	 ne,r13,@L5500
	ld	 r13,r0,r22
	addu	 r13,r24,r13
	ld.bu	 r13,r13,1
	ld.bu	 r13,r13,r14
	bcnd	 eq0,r13,@L5424
	addu	 r24,r24,2
	br	 @L5427
	align	 4
@L5500:
	ld.bu	 r13,r25,r14
	bcnd	 eq0,r13,@L5424
	addu	 r24,r24,1
@L5427:
	ld	 r13,r0,r22
	ld.bu	 r25,r13,r24
	br.n	 @L5574
	cmp	 r13,r25,10
	align	 4
@L5424:
	subu	 r24,r24,1
	or	 r25,r0,32
@L5420:
	bcnd	 eq0,r17,@L5431
	or	 r17,r0,0
	br.n	 @L5581
	cmp	 r13,r25,34
	align	 4
@L5431:
	cmp	 r13,r25,92
	bb1	 ne,r13,@L5433
	or	 r17,r0,1
@L5433:
	bcnd.n	 eq0,r18,@L5434
	cmp	 r13,r25,r18
	ext	 r13,r13,1<ne>
	br.n	 @L5432
	and	 r18,r18,r13
	align	 4
@L5434:
	cmp	 r13,r25,34
	cmp	 r12,r25,39
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5432
	or	 r18,r0,r25
@L5432:
	cmp	 r13,r25,34
@L5581:
	bb0.n	 ne,r13,@L5439
	cmp	 r13,r18,0
	cmp	 r12,r25,92
	and.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L5575
	or.u	 r13,r0,hi16(___lc_ctype)
@L5439:
	or	 r13,r0,92
	st.b	 r13,r0,r21
	addu	 r21,r21,1
	addu	 r23,r23,1
	or.u	 r13,r0,hi16(___lc_ctype)
@L5575:
	ld	 r4,r13,lo16(___lc_ctype)
	ld	 r13,r4,28
	bcnd.n	 ne0,r13,@L5441
	or	 r2,r0,r25
	ld	 r13,r4,64
	ld	 r13,r13[r25]
	bb1.n	 (31-24),r13,@L5442
	or	 r2,r0,r21
	br	 @L5576
	align	 4
@L5441:
	jsr.n	 r13
	or	 r3,r0,128
	bcnd.n	 eq0,r2,@L5440
	or	 r2,r0,r21
@L5442:
	st.b	 r25,r0,r21
	addu	 r21,r21,1
	br.n	 @L5417
	addu	 r23,r23,1
	align	 4
@L5440:
@L5576:
	or	 r4,r0,r25
	or.u	 r3,r0,hi16(@LC295)
	addu	 r21,r21,4
	or	 r3,r3,lo16(@LC295)
	bsr.n	 _sprintf
	addu	 r23,r23,4
@L5417:
	addu	 r24,r24,1
@L5580:
	cmp	 r13,r24,r19
	bb1.n	 lt,r13,@L5418
	or.u	 r13,r0,hi16(_traditional)
@L5573:
	ld	 r13,r13,lo16(_traditional)
	bcnd.n	 ne0,r13,@L5577
	cmp	 r13,r23,r15
	or	 r13,r0,34
	st.b	 r13,r16,r23
	br.n	 @L5446
	addu	 r23,r23,1
	align	 4
@L5403:
	ld	 r13,r20,4
	and.u	 r13,r13,0xff
	and	 r13,r13,0xff00
	bcnd.n	 ne0,r13,@L5448
	or.u	 r13,r0,hi16(_traditional)
	ld	 r13,r13,lo16(_traditional)
	bcnd	 eq0,r13,@L5447
@L5448:
	ld	 r2,r0,r22
	ld	 r13,r22,8
	ld.b	 r12,r20,5
	bcnd.n	 eq0,r12,@L5449
	addu	 r4,r2,r13
	cmp	 r13,r2,r4
	bb0	 ne,r13,@L5456
@L5454:
	ld.bu	 r13,r0,r2
	ld.bu	 r13,r13,r14
	bcnd	 eq0,r13,@L5451
	addu	 r2,r2,1
	cmp	 r13,r2,r4
	bb1	 ne,r13,@L5454
@L5451:
	cmp	 r13,r2,r4
	bb0.n	 ne,r13,@L5456
	or.u	 r13,r0,hi16(_is_idchar)
	addu	 r11,r23,r16
	or	 r10,r13,lo16(_is_idchar)
@L5459:
	ld.bu	 r12,r0,r2
	mask	 r13,r12,0xff
	ld.bu	 r13,r13,r10
	bcnd	 eq0,r13,@L5456
	st.b	 r12,r0,r11
	addu	 r2,r2,1
	addu	 r11,r11,1
	cmp	 r13,r2,r4
	bb1.n	 ne,r13,@L5459
	addu	 r23,r23,1
@L5456:
	ld.bu	 r13,r0,r2
	cmp	 r13,r13,10
	bb1	 ne,r13,@L5449
	ld.bu	 r13,r2,1
	cmp	 r13,r13,45
	bb1	 ne,r13,@L5449
	addu	 r2,r2,2
@L5449:
	ld.b	 r13,r20,6
	bcnd.n	 eq0,r13,@L5461
	cmp	 r13,r2,r4
	bb0.n	 ne,r13,@L5461
	subu	 r11,r0,1
@L5464:
	ld.bu	 r12,r4,r11
	ld.bu	 r13,r12,r14
	bcnd	 eq0,r13,@L5465
	subu	 r4,r4,1
	br.n	 @L5582
	cmp	 r13,r2,r4
	align	 4
@L5465:
	cmp	 r13,r12,45
	bb0.n	 eq,r13,@L5461
	subu	 r12,r4,1
	cmp	 r13,r12,r2
	bb0.n	 ne,r13,@L5578
	addu	 r13,r12,1
@L5472:
	ld.bu	 r13,r12,r11
	cmp	 r13,r13,10
	bb0	 eq,r13,@L5469
	subu	 r12,r12,1
	cmp	 r13,r12,r2
	bb1	 ne,r13,@L5472
@L5469:
	addu	 r13,r12,1
@L5578:
	subu	 r13,r4,r13
	bb0	 (31-31),r13,@L5461
	subu	 r4,r4,2
	cmp	 r13,r2,r4
@L5582:
	bb1	 ne,r13,@L5464
@L5461:
	subu	 r4,r4,r2
	addu	 r3,r16,r23
	addu	 r23,r23,r4
	bsr.n	 _bcopy
	addu	 r1,r1,@L5595
@L5596:
	align	 4
@L5447:
	ld	 r2,r22,4
	ld	 r4,r22,12
	bsr.n	 _bcopy
	addu	 r3,r16,r23
	ld.b	 r13,r22,30
	ld	 r12,r22,12
	cmp	 r13,r13,1
	bb0.n	 gt,r13,@L5446
	addu	 r23,r23,r12
	ld.b	 r13,r22,28
	bcnd	 le0,r13,@L5446
	ld	 r2,r22,4
	ld	 r3,r22,12
	or	 r13,r0,1
	bsr.n	 _delete_newlines
	st.b	 r13,r22,30
	st	 r2,r22,12
@L5446:
	cmp	 r13,r23,r15
@L5577:
	bb1.n	 le,r13,@L5393
	or	 r11,r0,r20
	bsr	 _abort
	align	 4
@L5393:
	ld	 r20,r0,r11
	bcnd	 ne0,r20,@L5394
	ld	 r8,r30,28
@L5579:
	ld	 r24,r30,60
	ld	 r13,r8,4
	cmp	 r13,r24,r13
	bb0.n	 lt,r13,@L5482
	cmp	 r13,r11,0
	addu	 r12,r23,r16
	extu	 r10,r13,1<eq>
@L5484:
	ld	 r7,r30,52
	ld.bu	 r13,r7,r24
	cmp	 r13,r13,41
	ld	 r8,r30,36
	ext	 r13,r13,1<ne>
	and	 r8,r8,r13
	cmp	 r13,r8,0
	extu	 r13,r13,1<eq>
	or	 r13,r13,r10
	bcnd.n	 ne0,r13,@L5487
	st	 r8,r30,36
	ld.b	 r13,r11,7
	bcnd	 eq0,r13,@L5487
	ld.b	 r13,r11,6
	bcnd	 ne0,r13,@L5483
@L5487:
	ld	 r7,r30,52
	ld.bu	 r13,r7,r24
	addu	 r23,r23,1
	st.b	 r13,r0,r12
	addu	 r12,r12,1
@L5483:
	ld	 r8,r30,28
	ld	 r13,r8,4
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1	 lt,r13,@L5484
@L5482:
	st.b	 r0,r16,r23
	ld	 r7,r30,20
	or	 r15,r0,r23
	bcnd.n	 le0,r7,@L5496
	or	 r24,r0,0
	mask	 r12,r7,3
	ld	 r25,r30,44
	bcnd.n	 eq0,r12,@L5492
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L5504
	cmp	 r13,r12,2
	bb0	 gt,r13,@L5505
	ld	 r2,r25,20
	bcnd	 eq0,r2,@L5509
	bsr	 _free
@L5509:
	ld	 r2,r25,24
	bcnd	 eq0,r2,@L5507
	bsr	 _free
@L5507:
	addu	 r25,r25,32
	or	 r24,r0,1
@L5505:
	ld	 r2,r25,20
	bcnd	 eq0,r2,@L5513
	bsr	 _free
@L5513:
	ld	 r2,r25,24
	bcnd	 eq0,r2,@L5511
	bsr	 _free
@L5511:
	addu	 r25,r25,32
	addu	 r24,r24,1
@L5504:
	ld	 r2,r25,20
	bcnd	 eq0,r2,@L5517
	bsr	 _free
@L5517:
	ld	 r2,r25,24
	bcnd	 eq0,r2,@L5515
	bsr	 _free
@L5515:
	ld	 r8,r30,20
	addu	 r24,r24,1
	cmp	 r13,r24,r8
	bb1.n	 ge,r13,@L5496
	addu	 r25,r25,32
@L5492:
	ld	 r2,r25,20
	bcnd	 eq0,r2,@L5521
	bsr	 _free
@L5521:
	ld	 r2,r25,24
	bcnd	 eq0,r2,@L5519
	bsr	 _free
@L5519:
	ld	 r2,r25,52
	bcnd	 eq0,r2,@L5525
	bsr	 _free
@L5525:
	ld	 r2,r25,56
	bcnd	 eq0,r2,@L5523
	bsr	 _free
@L5523:
	ld	 r2,r25,84
	bcnd	 eq0,r2,@L5529
	bsr	 _free
@L5529:
	ld	 r2,r25,88
	bcnd	 eq0,r2,@L5527
	bsr	 _free
@L5527:
	ld	 r2,r25,116
	bcnd	 eq0,r2,@L5533
	bsr	 _free
@L5533:
	ld	 r2,r25,120
	bcnd	 eq0,r2,@L5531
	bsr	 _free
@L5531:
	ld	 r7,r30,20
	addu	 r24,r24,4
	cmp	 r13,r24,r7
	bb1.n	 lt,r13,@L5492
	addu	 r25,r25,128
	br.n	 @L5569
	or.u	 r11,r0,hi16(_indepth)
	align	 4
@L5338:
	ld	 r8,r30,28
	ld	 r16,r8,12
	ld	 r15,r8,4
@L5496:
	or.u	 r11,r0,hi16(_indepth)
@L5569:
	ld	 r12,r11,lo16(_indepth)
	addu	 r12,r12,1
	or.u	 r13,r0,hi16(_instack)
	mul	 r10,r12,44
	ld	 r7,r30,20
	or	 r13,r13,lo16(_instack)
	st	 r12,r11,lo16(_indepth)
	addu	 r10,r10,r13
	st	 r0,r0,r10
	st	 r0,r10,4
	st	 r0,r10,12
	st	 r16,r10,20
	st	 r15,r10,16
	bcnd.n	 le0,r7,@L5497
	st	 r16,r10,24
	br.n	 @L5498
	st	 r16,r10,36
	align	 4
@L5497:
	st	 r0,r10,36
@L5498:
	or.u	 r13,r0,hi16(_if_stack)
	ld	 r12,r13,lo16(_if_stack)
	st.b	 r0,r10,40
	or.u	 r13,r0,hi16(_traditional)
	ld	 r8,r30,12
	ld	 r13,r13,lo16(_traditional)
	st	 r8,r10,28
	bcnd.n	 ne0,r13,@L5334
	st	 r12,r10,32
	or	 r13,r0,32
	st	 r13,r8,12
@L5334:
@Lte52:
	subu	 r31,r30,80
	ld	 r1,r31,84
	ld	 r30,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	ld.d	 r14,r31,32
	jmp.n	 r1
	addu	 r31,r31,144
	def	 @L5595,@L5446-@L5596
	def	 @L5593,@L5363-@L5594
	def	 @L5591,@L5363-@L5592
	def	 @L5589,@L5363-@L5590
	def	 @L5587,@L5345-@L5588
	def	 @L5585,@L5334-@L5586
	def	 @L5583,@L5334-@L5584

data
	align	 8
@LC296:
	string	 "unterminated macro call\000"
text
	align	 8
_macarg:
	or.u	 r13,r0,hi16(_indepth)
	ld	 r12,r13,lo16(_indepth)
	subu	 r31,r31,160
	st	 r1,r31,80
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	or	 r21,r0,r2
	st.d	 r16,r31,40
	or	 r16,r0,r3
	st.d	 r18,r31,48
@Ltb53:
	mul	 r12,r12,44
	or.u	 r13,r0,hi16(_instack)
	st	 r0,r31,88
	or	 r13,r13,lo16(_instack)
	st	 r0,r31,92
	addu	 r25,r12,r13
	addu	 r4,r31,88
	ld	 r13,r25,20
	addu	 r5,r31,92
	ld	 r3,r25,16
	addu	 r6,r31,96
	ld	 r2,r25,24
	or	 r7,r0,r16
	addu	 r3,r13,r3
	bsr.n	 _macarg1
	st	 r0,r31,96
	ld	 r13,r0,r25
	bcnd.n	 eq0,r13,@L5636
	or	 r24,r0,r2
	ld	 r13,r31,92
	bcnd	 ne0,r13,@L5635
	ld	 r13,r31,96
	bcnd	 ne0,r13,@L5635
@L5636:
	ld	 r13,r25,20
	ld	 r12,r25,16
	addu	 r13,r13,r12
	cmp	 r13,r24,r13
	bb0	 ne,r13,@L5635
	bcnd	 eq0,r21,@L5637
	ld	 r13,r25,24
	st	 r13,r0,r21
	ld	 r13,r25,24
	ld	 r12,r31,92
	subu	 r13,r24,r13
	st	 r13,r21,8
	st.b	 r12,r21,28
@L5637:
	br.n	 @L5638
	st	 r24,r25,24
	align	 4
@L5635:
	ld	 r13,r25,24
	ld	 r20,r31,92
	subu	 r23,r24,r13
	addu	 r2,r23,r20
	bsr.n	 _xmalloc
	addu	 r2,r2,1
	or	 r22,r0,r2
	or	 r4,r0,r23
	ld	 r2,r25,24
	bsr.n	 _bcopy
	or	 r3,r0,r22
	ld	 r12,r25,12
	ld	 r10,r31,92
	ld	 r13,r25,20
	ld	 r11,r25,16
	or	 r19,r0,0
	st	 r24,r25,24
	addu	 r13,r13,r11
	addu	 r12,r12,r10
	cmp	 r13,r24,r13
	bb0.n	 eq,r13,@L5640
	st	 r12,r25,12
	or.u	 r13,r0,hi16(_instack)
	or.u	 r18,r0,hi16(_indepth)
	or	 r17,r13,lo16(_instack)
@L5641:
	ld	 r13,r18,lo16(_indepth)
	mul	 r13,r13,44
	addu	 r13,r13,r17
	ld	 r13,r13,28
	bcnd	 eq0,r13,@L5673
	ld	 r12,r25,28
	or	 r13,r0,31
	st	 r13,r12,12
	ld	 r2,r25,36
	bcnd	 eq0,r2,@L5643
	bsr	 _free
@L5643:
	ld	 r12,r18,lo16(_indepth)
	subu	 r12,r12,1
	mul	 r13,r12,44
	addu	 r25,r13,r17
	ld	 r2,r25,24
	ld	 r13,r25,20
	addu	 r4,r31,88
	ld	 r3,r25,16
	addu	 r5,r31,92
	addu	 r6,r31,96
	st	 r12,r18,lo16(_indepth)
	or	 r7,r0,r16
	st	 r0,r31,92
	addu	 r3,r13,r3
	bsr.n	 _macarg1
	st	 r0,r31,96
	ld	 r13,r25,24
	or	 r24,r0,r2
	ld	 r12,r31,92
	or	 r19,r0,r23
	subu	 r13,r24,r13
	addu	 r20,r20,r12
	addu	 r23,r23,r13
	addu	 r3,r23,r20
	or	 r2,r0,r22
	bsr.n	 _xrealloc
	addu	 r3,r3,1
	or	 r22,r0,r2
	ld	 r2,r25,24
	addu	 r3,r22,r23
	subu	 r4,r24,r2
	bsr.n	 _bcopy
	subu	 r3,r3,r4
	ld	 r11,r25,12
	ld	 r10,r31,92
	ld	 r13,r25,20
	ld	 r12,r25,16
	st	 r24,r25,24
	addu	 r13,r13,r12
	addu	 r11,r11,r10
	cmp	 r13,r24,r13
	bb1.n	 eq,r13,@L5641
	st	 r11,r25,12
@L5640:
	bcnd.n	 eq0,r21,@L5671
	or	 r2,r0,0
	ld	 r13,r31,92
	st.b	 r13,r21,28
	ld	 r13,r31,96
	st.b	 r13,r21,29
	ld	 r4,r31,92
	st	 r22,r0,r21
	st	 r23,r21,8
	bcnd.n	 ne0,r4,@L5647
	st	 r22,r21,20
	ld	 r13,r31,96
	bcnd	 eq0,r13,@L5646
@L5647:
	ld	 r13,r0,r25
	bcnd	 eq0,r13,@L5646
	ld	 r2,r0,r21
	ld	 r3,r21,8
	addu	 r2,r2,r19
	bsr.n	 _discard_comments
	subu	 r3,r3,r19
	addu	 r2,r19,r2
	st	 r2,r21,8
@L5646:
	ld	 r12,r0,r21
	ld	 r13,r21,8
	st.b	 r0,r12,r13
	ld	 r13,r21,8
	addu	 r12,r23,r20
	cmp	 r13,r13,r12
	bb0	 gt,r13,@L5638
	bsr	 _abort
	align	 4
@L5673:
	bsr.n	 _free
	or	 r2,r0,r22
	or.u	 r2,r0,hi16(@LC296)
	br.n	 @L5671
	or	 r2,r2,lo16(@LC296)
	align	 4
@L5638:
	bcnd	 eq0,r21,@L5649
	ld	 r2,r0,r21
	or	 r4,r0,1
	ld	 r3,r21,8
	or	 r5,r0,0
	addu	 r12,r31,104
	bsr.n	 _expand_to_temp_buffer
	addu	 r3,r2,r3
	ld	 r24,r0,r21
	ld	 r13,r31,124
	st	 r13,r21,4
	ld	 r13,r31,120
	ld	 r12,r21,8
	st	 r13,r21,12
	ld	 r13,r31,124
	addu	 r23,r24,r12
	cmp	 r12,r24,r23
	bb0.n	 ne,r12,@L5656
	st	 r13,r21,24
	or.u	 r13,r0,hi16(_is_space)
	or	 r12,r13,lo16(_is_space)
@L5654:
	ld.bu	 r13,r0,r24
	ld.bu	 r13,r13,r12
	bcnd	 eq0,r13,@L5651
	addu	 r24,r24,1
	cmp	 r13,r24,r23
	bb1	 ne,r13,@L5654
@L5651:
	cmp	 r13,r24,r23
	bb0.n	 ne,r13,@L5656
	or.u	 r13,r0,hi16(_is_space)
	subu	 r11,r0,1
	or	 r12,r13,lo16(_is_space)
@L5659:
	ld.bu	 r13,r23,r11
	ld.bu	 r13,r13,r12
	bcnd	 eq0,r13,@L5656
	subu	 r23,r23,1
	cmp	 r13,r24,r23
	bb1	 ne,r13,@L5659
@L5656:
	or.u	 r13,r0,hi16(_traditional)
	ld	 r13,r13,lo16(_traditional)
	cmp	 r13,r13,0
	ext	 r13,r13,1<eq>
	cmp	 r12,r24,r23
	bb0.n	 ne,r12,@L5672
	mask	 r25,r13,2
	subu	 r13,r23,r24
	bb1.n	 ge,r12,@L5676
	mask	 r13,r13,1
	bcnd	 eq0,r13,@L5664
@L5676:
	ld.bu	 r13,r0,r24
	mask	 r2,r13,0xff
	cmp	 r13,r2,34
	cmp	 r12,r2,92
	or	 r13,r13,r12
	addu	 r24,r24,1
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L5697
	addu	 r25,r25,1
	or.u	 r13,r0,hi16(___lc_ctype)
	ld	 r4,r13,lo16(___lc_ctype)
	ld	 r13,r4,28
	bcnd	 eq0,r13,@L5698
	br	 @L5692
	align	 4
@L5664:
	ld.bu	 r2,r0,r24
	cmp	 r12,r2,34
	cmp	 r13,r2,92
	or	 r12,r12,r13
	addu	 r25,r25,1
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L5685
	addu	 r22,r24,1
	br.n	 @L5683
	addu	 r25,r25,1
	align	 4
@L5685:
	or.u	 r13,r0,hi16(___lc_ctype)
	ld	 r4,r13,lo16(___lc_ctype)
	ld	 r13,r4,28
	bcnd	 ne0,r13,@L5686
	ld	 r13,r4,64
	ld	 r13,r13[r2]
	bb1	 (31-24),r13,@L5683
	addu	 r25,r25,3
	br	 @L5683
	align	 4
@L5686:
	jsr.n	 r13
	or	 r3,r0,128
	bcnd	 ne0,r2,@L5683
	addu	 r25,r25,3
@L5683:
	ld.bu	 r2,r0,r22
	cmp	 r12,r2,34
	cmp	 r13,r2,92
	or	 r12,r12,r13
	addu	 r24,r24,2
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L5691
	addu	 r25,r25,1
@L5697:
	br.n	 @L5689
	addu	 r25,r25,1
	align	 4
@L5691:
	or.u	 r13,r0,hi16(___lc_ctype)
	ld	 r4,r13,lo16(___lc_ctype)
	ld	 r13,r4,28
	bcnd	 ne0,r13,@L5692
@L5698:
	ld	 r13,r4,64
	ld	 r13,r13[r2]
	bb1.n	 (31-24),r13,@L5699
	cmp	 r13,r24,r23
	br.n	 @L5699
	addu	 r25,r25,3
	align	 4
@L5692:
	jsr.n	 r13
	or	 r3,r0,128
	bcnd.n	 ne0,r2,@L5699
	cmp	 r13,r24,r23
	addu	 r25,r25,3
@L5689:
	cmp	 r13,r24,r23
@L5699:
	bb1	 ne,r13,@L5664
@L5672:
	st	 r25,r21,16
@L5649:
	or	 r2,r0,0
@L5671:
@Lte53:
	ld	 r1,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	jmp.n	 r1
	addu	 r31,r31,160

	align	 8
_macarg1:
	subu	 r31,r31,64
	cmp	 r9,r2,r3
	st.d	 r22,r31,32
	or	 r23,r0,r6
	st	 r1,r31,48
	or	 r22,r0,r7
	bb0.n	 lo,r9,@L5892
	st.d	 r24,r31,40
@Ltb54:
	or	 r24,r0,92
	or	 r25,r0,10
@L5799:
	ld.bu	 r8,r0,r2
	cmp	 r9,r8,41
	bb0	 ne,r9,@L5802
	bb1.n	 gt,r9,@L5889
	cmp	 r9,r8,47
	cmp	 r9,r8,39
	bb0	 ne,r9,@L5868
	bb1.n	 gt,r9,@L5801
	cmp	 r9,r8,10
	bb0.n	 ne,r9,@L5833
	cmp	 r9,r8,34
	bb0	 ne,r9,@L5868
	addu	 r2,r2,1
	br	 @L5923
	align	 4
@L5889:
	bb0	 ne,r9,@L5808
	bb1.n	 gt,r9,@L5890
	cmp	 r9,r8,92
	cmp	 r9,r8,44
	bb0.n	 ne,r9,@L5885
	cmp	 r8,r22,0
	br.n	 @L5923
	addu	 r2,r2,1
	align	 4
@L5890:
	bb0.n	 ne,r9,@L5804
	addu	 r8,r2,1
	br.n	 @L5923
	addu	 r2,r2,1
	align	 4
@L5801:
	ld	 r9,r0,r4
	addu	 r9,r9,1
	br.n	 @L5800
	st	 r9,r0,r4
	align	 4
@L5802:
	ld	 r9,r0,r4
	subu	 r9,r9,1
	bcnd.n	 ge0,r9,@L5800
	st	 r9,r0,r4
	br	 @L5892
	align	 4
@L5804:
	cmp	 r9,r8,r3
	bb0.n	 lo,r9,@L5800
	or.u	 r9,r0,hi16(_traditional)
	ld	 r9,r9,lo16(_traditional)
	bcnd	 eq0,r9,@L5800
	or	 r2,r0,r8
	ld.bu	 r9,r0,r2
	cmp	 r9,r9,10
	bb0	 ne,r9,@L5833
	br.n	 @L5923
	addu	 r2,r2,1
	align	 4
@L5808:
	ld.bu	 r9,r2,1
	cmp	 r9,r9,92
	bb1.n	 ne,r9,@L5924
	or.u	 r9,r0,hi16(_cplusplus_comments)
	ld.bu	 r9,r2,2
	cmp	 r9,r9,10
	bb1.n	 ne,r9,@L5924
	or.u	 r9,r0,hi16(_cplusplus_comments)
	addu	 r11,r2,1
	or	 r12,r0,0
	or	 r13,r0,r11
@L5813:
	ld.bu	 r9,r0,r13
	cmp	 r9,r9,92
	bb0	 eq,r9,@L5812
	ld.bu	 r8,r13,1
	cmp	 r9,r8,10
	bb1.n	 ne,r9,@L5815
	cmp	 r9,r8,13
	addu	 r13,r13,2
	br.n	 @L5813
	addu	 r12,r12,1
	align	 4
@L5815:
	bb0	 eq,r9,@L5812
	ld.bu	 r9,r13,2
	cmp	 r9,r9,10
	bb0	 eq,r9,@L5812
	addu	 r13,r13,3
	br.n	 @L5813
	addu	 r12,r12,1
	align	 4
@L5812:
	bcnd	 eq0,r12,@L5809
	ld.bu	 r1,r0,r13
	mask	 r9,r1,0xff
	cmp	 r7,r9,47
	cmp	 r10,r9,42
	or	 r9,r7,r10
	extu	 r8,r9,1<eq>
	xor	 r9,r8,1
	bcnd.n	 ne0,r9,@L5924
	or.u	 r9,r0,hi16(_cplusplus_comments)
	or	 r9,r10,r7
	extu	 r9,r9,1<eq>
	bcnd.n	 eq0,r9,@L5925
	or	 r9,r0,r12
@L5825:
	st.b	 r1,r0,r11
	addu	 r13,r13,1
	ld.bu	 r1,r0,r13
	mask	 r9,r1,0xff
	cmp	 r8,r9,42
	cmp	 r9,r9,47
	or	 r8,r8,r9
	extu	 r8,r8,1<eq>
	bcnd.n	 ne0,r8,@L5825
	addu	 r11,r11,1
	or	 r9,r0,r12
@L5925:
	bcnd.n	 le0,r9,@L5809
	subu	 r12,r12,1
@L5829:
	st.b	 r24,r0,r11
	addu	 r11,r11,1
	or	 r9,r0,r12
	subu	 r12,r12,1
	st.b	 r25,r0,r11
	bcnd.n	 gt0,r9,@L5829
	addu	 r11,r11,1
@L5809:
	or.u	 r9,r0,hi16(_cplusplus_comments)
@L5924:
	ld	 r9,r9,lo16(_cplusplus_comments)
	bcnd	 eq0,r9,@L5831
	ld.bu	 r9,r2,1
	cmp	 r9,r9,47
	bb1	 ne,r9,@L5831
	addu	 r2,r2,2
	or	 r9,r0,1
	cmp	 r13,r2,r3
	bb0.n	 lo,r13,@L5833
	st	 r9,r0,r23
	subu	 r9,r3,r2
	bb1.n	 ge,r13,@L5920
	mask	 r8,r9,3
	bcnd.n	 eq0,r8,@L5836
	cmp	 r9,r8,1
	bb1.n	 le,r9,@L5920
	cmp	 r9,r8,2
	bb1	 le,r9,@L5921
	br	 @L5922
	align	 4
@L5836:
	ld.bu	 r9,r0,r2
	cmp	 r9,r9,10
	bb0.n	 ne,r9,@L5833
	addu	 r2,r2,1
@L5922:
	ld.bu	 r9,r0,r2
	cmp	 r9,r9,10
	bb0.n	 ne,r9,@L5833
	addu	 r2,r2,1
@L5921:
	ld.bu	 r9,r0,r2
	cmp	 r9,r9,10
	bb0.n	 ne,r9,@L5833
	addu	 r2,r2,1
@L5920:
	ld.bu	 r9,r0,r2
	cmp	 r9,r9,10
	bb0.n	 ne,r9,@L5833
	addu	 r2,r2,1
	cmp	 r9,r2,r3
	bb1	 lo,r9,@L5836
@L5833:
	ld	 r9,r0,r5
	addu	 r9,r9,1
	br.n	 @L5800
	st	 r9,r0,r5
	align	 4
@L5831:
	ld.bu	 r9,r2,1
	cmp	 r9,r9,42
	bb1.n	 ne,r9,@L5800
	addu	 r9,r2,1
	cmp	 r9,r9,r3
	bb0	 lo,r9,@L5800
	addu	 r2,r2,2
	addu	 r13,r2,1
	or	 r9,r0,1
	cmp	 r8,r13,r3
	bb0.n	 lo,r8,@L5800
	st	 r9,r0,r23
	or	 r6,r0,r13
@L5841:
	ld.bu	 r9,r0,r2
	cmp	 r9,r9,42
	bb1	 ne,r9,@L5864
	ld.bu	 r9,r2,1
	cmp	 r9,r9,92
	bb0	 eq,r9,@L5842
	ld.bu	 r9,r2,2
	cmp	 r9,r9,10
	bb0	 eq,r9,@L5842
	or	 r1,r0,r13
	or	 r10,r0,0
@L5846:
	ld.bu	 r9,r0,r13
	cmp	 r9,r9,92
	bb0	 eq,r9,@L5845
	ld.bu	 r8,r13,1
	cmp	 r9,r8,10
	bb1.n	 ne,r9,@L5848
	cmp	 r9,r8,13
	addu	 r13,r13,2
	br.n	 @L5846
	addu	 r10,r10,1
	align	 4
@L5848:
	bb0	 eq,r9,@L5845
	ld.bu	 r9,r13,2
	cmp	 r9,r9,10
	bb0	 eq,r9,@L5845
	addu	 r13,r13,3
	br.n	 @L5846
	addu	 r10,r10,1
	align	 4
@L5845:
	bcnd	 eq0,r10,@L5842
	ld.bu	 r7,r0,r13
	mask	 r9,r7,0xff
	cmp	 r11,r9,47
	cmp	 r12,r9,42
	or	 r9,r11,r12
	extu	 r8,r9,1<eq>
	xor	 r9,r8,1
	bcnd.n	 ne0,r9,@L5842
	or	 r9,r12,r11
	extu	 r9,r9,1<eq>
	bcnd.n	 eq0,r9,@L5926
	or	 r9,r0,r10
@L5858:
	st.b	 r7,r0,r1
	addu	 r13,r13,1
	ld.bu	 r7,r0,r13
	mask	 r9,r7,0xff
	cmp	 r8,r9,42
	cmp	 r9,r9,47
	or	 r8,r8,r9
	extu	 r8,r8,1<eq>
	bcnd.n	 ne0,r8,@L5858
	addu	 r1,r1,1
	or	 r9,r0,r10
@L5926:
	bcnd.n	 le0,r9,@L5842
	subu	 r10,r10,1
@L5862:
	st.b	 r24,r0,r1
	addu	 r1,r1,1
	or	 r9,r0,r10
	subu	 r10,r10,1
	st.b	 r25,r0,r1
	bcnd.n	 gt0,r9,@L5862
	addu	 r1,r1,1
@L5842:
	ld.bu	 r9,r0,r2
	cmp	 r9,r9,42
	bb1	 ne,r9,@L5864
	ld.bu	 r9,r2,1
	cmp	 r9,r9,47
	bb0	 ne,r9,@L5800
@L5864:
	ld.bu	 r9,r0,r2
	cmp	 r9,r9,10
	bb1	 ne,r9,@L5865
	ld	 r9,r0,r5
	addu	 r9,r9,1
	st	 r9,r0,r5
@L5865:
	addu	 r6,r6,1
	or	 r13,r0,r6
	cmp	 r9,r13,r3
	bb1.n	 lo,r9,@L5841
	addu	 r2,r2,1
	br.n	 @L5923
	addu	 r2,r2,1
	align	 4
@L5868:
	ld.bu	 r13,r0,r2
	addu	 r2,r2,1
	addu	 r9,r2,1
	cmp	 r9,r9,r3
	bb0.n	 lo,r9,@L5800
	cmp	 r12,r13,39
@L5884:
	ld.bu	 r8,r0,r2
	cmp	 r9,r8,r13
	bb0.n	 ne,r9,@L5800
	cmp	 r9,r8,92
	bb0	 eq,r9,@L5874
	addu	 r2,r2,1
	ld.bu	 r9,r0,r2
	cmp	 r9,r9,10
	bb1	 ne,r9,@L5875
	ld	 r9,r0,r5
	addu	 r9,r9,1
	st	 r9,r0,r5
@L5875:
	ld.bu	 r9,r0,r2
	cmp	 r9,r9,92
	bb1	 ne,r9,@L5871
	ld.bu	 r9,r2,1
	cmp	 r9,r9,10
	bb1	 ne,r9,@L5871
	addu	 r2,r2,2
	br	 @L5875
	align	 4
@L5874:
	ld.bu	 r9,r0,r2
	cmp	 r9,r9,10
	bb1	 ne,r9,@L5871
	ld	 r9,r0,r5
	addu	 r9,r9,1
	bb0.n	 ne,r12,@L5800
	st	 r9,r0,r5
@L5871:
	addu	 r2,r2,1
	addu	 r9,r2,1
	cmp	 r9,r9,r3
	bb0	 lo,r9,@L5800
	br	 @L5884
	align	 4
@L5885:
	ld	 r9,r0,r4
	cmp	 r9,r9,0
	and	 r9,r9,r8
	extu	 r9,r9,1<eq>
	bcnd	 ne0,r9,@L5892
@L5800:
	addu	 r2,r2,1
@L5923:
	cmp	 r9,r2,r3
	bb1	 lo,r9,@L5799
@L5892:
@Lte54:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	ld.d	 r22,r31,32
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
_discard_comments:
	subu	 r31,r31,64
	st.d	 r24,r31,40
	or	 r25,r0,r2
	bcnd.n	 le0,r4,@L6017
	st	 r1,r31,48
@Ltb55:
	addu	 r10,r25,r3
	or	 r1,r0,r25
	cmp	 r9,r25,r10
	bb0.n	 ne,r9,@L6017
	addu	 r2,r10,r4
	subu	 r9,r25,r10
	cmp	 r8,r10,r25
	bb1.n	 le,r8,@L6116
	mask	 r7,r9,3
	bcnd.n	 eq0,r7,@L6136
	subu	 r9,r10,1
	cmp	 r9,r7,3
	bb1.n	 ge,r9,@L6116
	cmp	 r9,r7,2
	bb1	 ge,r9,@L6117
	subu	 r10,r10,1
	ld.bu	 r9,r0,r10
	subu	 r2,r2,1
	st.b	 r9,r0,r2
@L6117:
	subu	 r10,r10,1
	ld.bu	 r9,r0,r10
	subu	 r2,r2,1
	st.b	 r9,r0,r2
@L6116:
	subu	 r10,r10,1
	ld.bu	 r9,r0,r10
	br.n	 @L6133
	subu	 r2,r2,1
	align	 4
@L6020:
	subu	 r9,r10,1
@L6136:
	ld.bu	 r8,r0,r9
	subu	 r9,r2,1
	st.b	 r8,r0,r9
	subu	 r9,r10,2
	ld.bu	 r8,r0,r9
	subu	 r9,r2,2
	st.b	 r8,r0,r9
	subu	 r9,r10,3
	ld.bu	 r8,r0,r9
	subu	 r9,r2,3
	subu	 r10,r10,4
	st.b	 r8,r0,r9
	ld.bu	 r9,r0,r10
	subu	 r2,r2,4
@L6133:
	cmp	 r8,r1,r10
	bb1.n	 ne,r8,@L6020
	st.b	 r9,r0,r2
@L6017:
	addu	 r9,r25,r3
	addu	 r10,r25,r4
	addu	 r1,r9,r4
	cmp	 r9,r10,r1
	bb0.n	 lo,r9,@L6023
	or	 r2,r0,r25
	or	 r3,r0,10
	or	 r24,r0,92
@L6024:
	ld.bu	 r8,r0,r10
	addu	 r10,r10,1
	st.b	 r8,r0,r2
	cmp	 r9,r8,39
	bb0.n	 ne,r9,@L6088
	addu	 r2,r2,1
	bb1.n	 gt,r9,@L6103
	cmp	 r9,r8,47
	cmp	 r9,r8,10
	bb0.n	 ne,r9,@L6026
	cmp	 r9,r8,34
	bb0.n	 ne,r9,@L6137
	cmp	 r9,r10,r1
	br	 @L6138
	align	 4
@L6103:
	bb0.n	 ne,r9,@L6029
	cmp	 r9,r8,92
	bb0.n	 ne,r9,@L6027
	cmp	 r9,r10,r1
	br	 @L6138
	align	 4
@L6026:
	st.b	 r3,r0,r2
	br.n	 @L6022
	addu	 r2,r2,1
	align	 4
@L6027:
	ld.bu	 r9,r0,r10
	cmp	 r9,r9,10
	bb1.n	 ne,r9,@L6138
	cmp	 r9,r10,r1
	subu	 r2,r2,1
	br.n	 @L6022
	addu	 r10,r10,1
	align	 4
@L6029:
	ld.bu	 r9,r0,r10
	cmp	 r9,r9,92
	bb1.n	 ne,r9,@L6139
	or.u	 r9,r0,hi16(_cplusplus_comments)
	ld.bu	 r9,r10,1
	cmp	 r9,r9,10
	bb1.n	 ne,r9,@L6139
	or.u	 r9,r0,hi16(_cplusplus_comments)
	or	 r12,r0,r10
	or	 r7,r0,r10
	or	 r6,r0,0
@L6034:
	ld.bu	 r9,r0,r7
	cmp	 r9,r9,92
	bb0	 eq,r9,@L6033
	ld.bu	 r8,r7,1
	cmp	 r9,r8,10
	bb1.n	 ne,r9,@L6036
	cmp	 r9,r8,13
	addu	 r7,r7,2
	br.n	 @L6034
	addu	 r6,r6,1
	align	 4
@L6036:
	bb0	 eq,r9,@L6033
	ld.bu	 r9,r7,2
	cmp	 r9,r9,10
	bb0	 eq,r9,@L6033
	addu	 r7,r7,3
	br.n	 @L6034
	addu	 r6,r6,1
	align	 4
@L6033:
	bcnd	 eq0,r6,@L6030
	ld.bu	 r11,r0,r7
	mask	 r9,r11,0xff
	cmp	 r5,r9,47
	cmp	 r13,r9,42
	or	 r9,r5,r13
	extu	 r8,r9,1<eq>
	xor	 r9,r8,1
	bcnd.n	 ne0,r9,@L6139
	or.u	 r9,r0,hi16(_cplusplus_comments)
	or	 r9,r13,r5
	extu	 r9,r9,1<eq>
	bcnd.n	 eq0,r9,@L6140
	or	 r9,r0,r6
@L6046:
	st.b	 r11,r0,r12
	addu	 r7,r7,1
	ld.bu	 r11,r0,r7
	mask	 r9,r11,0xff
	cmp	 r8,r9,42
	cmp	 r9,r9,47
	or	 r8,r8,r9
	extu	 r8,r8,1<eq>
	bcnd.n	 ne0,r8,@L6046
	addu	 r12,r12,1
	or	 r9,r0,r6
@L6140:
	bcnd.n	 le0,r9,@L6030
	subu	 r6,r6,1
@L6050:
	st.b	 r24,r0,r12
	addu	 r12,r12,1
	or	 r9,r0,r6
	subu	 r6,r6,1
	st.b	 r3,r0,r12
	bcnd.n	 gt0,r9,@L6050
	addu	 r12,r12,1
@L6030:
	or.u	 r9,r0,hi16(_cplusplus_comments)
@L6139:
	ld	 r9,r9,lo16(_cplusplus_comments)
	bcnd	 eq0,r9,@L6052
	ld.bu	 r9,r0,r10
	cmp	 r9,r9,47
	bb0	 eq,r9,@L6052
	addu	 r10,r10,1
	cmp	 r9,r10,r1
	subu	 r2,r2,1
@L6134:
	bb0	 lo,r9,@L6023
	ld.bu	 r9,r0,r10
	cmp	 r9,r9,10
	bb1.n	 eq,r9,@L6022
	addu	 r10,r10,1
	br.n	 @L6134
	cmp	 r9,r10,r1
	align	 4
@L6052:
	ld.bu	 r9,r0,r10
	cmp	 r9,r9,42
	bb1.n	 ne,r9,@L6138
	cmp	 r9,r10,r1
	addu	 r8,r10,1
	cmp	 r9,r8,r1
	bb0.n	 lo,r9,@L6138
	cmp	 r9,r10,r1
	or	 r10,r0,r8
	addu	 r8,r10,1
	cmp	 r9,r8,r1
	bb0.n	 lo,r9,@L6061
	subu	 r2,r2,1
	or	 r4,r0,r8
@L6062:
	ld.bu	 r9,r0,r10
	cmp	 r9,r9,42
	bb1	 ne,r9,@L6085
	ld.bu	 r9,r10,1
	cmp	 r9,r9,92
	bb0	 eq,r9,@L6063
	ld.bu	 r9,r10,2
	cmp	 r9,r9,10
	bb0	 eq,r9,@L6063
	or	 r11,r0,r8
	or	 r12,r0,0
	or	 r7,r0,r11
@L6067:
	ld.bu	 r9,r0,r7
	cmp	 r9,r9,92
	bb0	 eq,r9,@L6066
	ld.bu	 r8,r7,1
	cmp	 r9,r8,10
	bb1.n	 ne,r9,@L6069
	cmp	 r9,r8,13
	addu	 r7,r7,2
	br.n	 @L6067
	addu	 r12,r12,1
	align	 4
@L6069:
	bb0	 eq,r9,@L6066
	ld.bu	 r9,r7,2
	cmp	 r9,r9,10
	bb0	 eq,r9,@L6066
	addu	 r7,r7,3
	br.n	 @L6067
	addu	 r12,r12,1
	align	 4
@L6066:
	bcnd	 eq0,r12,@L6063
	ld.bu	 r5,r0,r7
	mask	 r9,r5,0xff
	cmp	 r13,r9,47
	cmp	 r6,r9,42
	or	 r9,r13,r6
	extu	 r8,r9,1<eq>
	xor	 r9,r8,1
	bcnd.n	 ne0,r9,@L6063
	or	 r9,r6,r13
	extu	 r9,r9,1<eq>
	bcnd.n	 eq0,r9,@L6141
	or	 r9,r0,r12
@L6079:
	st.b	 r5,r0,r11
	addu	 r7,r7,1
	ld.bu	 r5,r0,r7
	mask	 r9,r5,0xff
	cmp	 r8,r9,42
	cmp	 r9,r9,47
	or	 r8,r8,r9
	extu	 r8,r8,1<eq>
	bcnd.n	 ne0,r8,@L6079
	addu	 r11,r11,1
	or	 r9,r0,r12
@L6141:
	bcnd.n	 le0,r9,@L6063
	subu	 r12,r12,1
@L6083:
	st.b	 r24,r0,r11
	addu	 r11,r11,1
	or	 r9,r0,r12
	subu	 r12,r12,1
	st.b	 r3,r0,r11
	bcnd.n	 gt0,r9,@L6083
	addu	 r11,r11,1
@L6063:
	ld.bu	 r9,r0,r10
	cmp	 r9,r9,42
	bb1	 ne,r9,@L6085
	ld.bu	 r9,r10,1
	cmp	 r9,r9,47
	bb0	 ne,r9,@L6061
@L6085:
	addu	 r4,r4,1
	or	 r8,r0,r4
	cmp	 r9,r8,r1
	bb1.n	 lo,r9,@L6062
	addu	 r10,r10,1
@L6061:
	br.n	 @L6022
	addu	 r10,r10,2
	align	 4
@L6088:
	cmp	 r9,r10,r1
@L6137:
	bb0.n	 lo,r9,@L6023
	or	 r13,r0,r8
	cmp	 r9,r8,39
	extu	 r6,r9,1<eq>
@L6091:
	ld.bu	 r8,r0,r10
	addu	 r10,r10,1
	st.b	 r8,r0,r2
	cmp	 r9,r8,r13
	bb1.n	 eq,r9,@L6022
	addu	 r2,r2,1
	cmp	 r9,r8,10
	extu	 r9,r9,1<eq>
	and	 r9,r9,r6
	bcnd.n	 ne0,r9,@L6022
	cmp	 r9,r8,92
	cmp	 r8,r10,r1
	rot	 r7,r9,24
	and	 r9,r7,r8
	extu	 r9,r9,1<lo>
	bcnd.n	 eq0,r9,@L6142
	cmp	 r9,r10,r1
	br	 @L6135
	align	 4
@L6099:
	ld.bu	 r9,r10,1
	cmp	 r9,r9,10
	bb0	 eq,r9,@L6096
	addu	 r10,r10,2
@L6135:
	ld.bu	 r9,r0,r10
	cmp	 r9,r9,92
	bb1	 eq,r9,@L6099
@L6096:
	ld.bu	 r9,r0,r10
	addu	 r10,r10,1
	st.b	 r9,r0,r2
	addu	 r2,r2,1
	cmp	 r9,r10,r1
@L6142:
	bb1	 lo,r9,@L6091
@L6022:
	cmp	 r9,r10,r1
@L6138:
	bb1	 lo,r9,@L6024
@L6023:
@Lte55:
	ld	 r1,r31,48
	subu	 r2,r2,r25
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
_delete_newlines:
@Ltb56:
	or	 r10,r0,r2
	addu	 r11,r10,r3
	cmp	 r9,r10,r11
	bb0.n	 lo,r9,@L6164
	or	 r7,r0,r10
@L6165:
	ld.bu	 r8,r0,r7
	addu	 r7,r7,1
	st.b	 r8,r0,r2
	cmp	 r9,r8,34
	bb0.n	 ne,r9,@L6170
	addu	 r2,r2,1
	bb1.n	 gt,r9,@L6179
	cmp	 r9,r8,39
	cmp	 r9,r8,10
	bb0.n	 ne,r9,@L6167
	cmp	 r9,r7,r11
	br	 @L6200
	align	 4
@L6179:
	bb0.n	 ne,r9,@L6201
	cmp	 r6,r7,r11
	br.n	 @L6200
	cmp	 r9,r7,r11
	align	 4
@L6167:
	ld.bu	 r9,r0,r7
	cmp	 r9,r9,10
	bb1.n	 ne,r9,@L6200
	cmp	 r9,r7,r11
	addu	 r7,r7,1
	br.n	 @L6163
	subu	 r2,r2,1
	align	 4
@L6170:
	cmp	 r6,r7,r11
@L6201:
	bb0.n	 lo,r6,@L6164
	or	 r12,r0,r8
	cmp	 r9,r8,39
	subu	 r8,r11,r7
	extu	 r13,r9,1<eq>
	bb1.n	 ge,r6,@L6183
	mask	 r8,r8,3
	bcnd.n	 eq0,r8,@L6173
	cmp	 r9,r8,1
	bb1.n	 le,r9,@L6183
	cmp	 r9,r8,2
	bb1	 le,r9,@L6184
	ld.bu	 r8,r0,r7
	addu	 r7,r7,1
	st.b	 r8,r0,r2
	cmp	 r9,r8,r12
	bb1.n	 eq,r9,@L6163
	addu	 r2,r2,1
	cmp	 r9,r8,10
	extu	 r9,r9,1<eq>
	and	 r9,r9,r13
	bcnd.n	 ne0,r9,@L6200
	cmp	 r9,r7,r11
@L6184:
	ld.bu	 r8,r0,r7
	addu	 r7,r7,1
	st.b	 r8,r0,r2
	cmp	 r9,r8,r12
	bb1.n	 eq,r9,@L6163
	addu	 r2,r2,1
	cmp	 r9,r8,10
	extu	 r9,r9,1<eq>
	and	 r9,r9,r13
	bcnd.n	 ne0,r9,@L6200
	cmp	 r9,r7,r11
@L6183:
	ld.bu	 r8,r0,r7
	addu	 r7,r7,1
	st.b	 r8,r0,r2
	cmp	 r9,r8,r12
	bb1.n	 eq,r9,@L6163
	addu	 r2,r2,1
	cmp	 r9,r8,10
	extu	 r9,r9,1<eq>
	and	 r9,r9,r13
	bcnd.n	 ne0,r9,@L6163
	cmp	 r9,r7,r11
	bb0	 lo,r9,@L6164
@L6173:
	ld.bu	 r8,r0,r7
	addu	 r7,r7,1
	st.b	 r8,r0,r2
	cmp	 r9,r8,r12
	bb1.n	 eq,r9,@L6163
	addu	 r2,r2,1
	cmp	 r9,r8,10
	extu	 r9,r9,1<eq>
	and	 r9,r9,r13
	bcnd	 ne0,r9,@L6163
	ld.bu	 r8,r0,r7
	addu	 r7,r7,1
	st.b	 r8,r0,r2
	cmp	 r9,r8,r12
	bb1.n	 eq,r9,@L6163
	addu	 r2,r2,1
	cmp	 r9,r8,10
	extu	 r9,r9,1<eq>
	and	 r9,r9,r13
	bcnd	 ne0,r9,@L6163
	ld.bu	 r8,r0,r7
	addu	 r7,r7,1
	st.b	 r8,r0,r2
	cmp	 r9,r8,r12
	bb1.n	 eq,r9,@L6163
	addu	 r2,r2,1
	cmp	 r9,r8,10
	extu	 r9,r9,1<eq>
	and	 r9,r9,r13
	bcnd	 ne0,r9,@L6163
	ld.bu	 r8,r0,r7
	addu	 r7,r7,1
	st.b	 r8,r0,r2
	cmp	 r9,r8,r12
	bb1.n	 eq,r9,@L6163
	addu	 r2,r2,1
	cmp	 r9,r8,10
	extu	 r9,r9,1<eq>
	and	 r9,r9,r13
	bcnd.n	 ne0,r9,@L6163
	cmp	 r9,r7,r11
	bb1	 lo,r9,@L6173
@L6163:
	cmp	 r9,r7,r11
@L6200:
	bb1	 lo,r9,@L6165
@L6164:
	jmp.n	 r1
	subu	 r2,r2,r10
@Lte56:

data
	align	 8
@LC297:
	string	 "%s:%d: \000"
	align	 8
@LC298:
	string	 "\n\000"
text
	align	 8
	global	 _error
_error:
	subu	 r31,r31,80
	st.d	 r24,r31,56
	or	 r24,r0,r2
	st.d	 r22,r31,48
	or	 r23,r0,r3
	or	 r22,r0,r4
	st	 r21,r31,44
	st	 r1,r31,64
@Ltb57:
	bsr.n	 _print_containing_files
	or	 r21,r0,r5
	or.u	 r13,r0,hi16(_indepth)
	ld	 r9,r13,lo16(_indepth)
	bcnd.n	 lt0,r9,@L6212
	or	 r25,r0,0
	or.u	 r12,r0,hi16(_instack)
	mul	 r13,r9,44
	or	 r8,r12,lo16(_instack)
	xor.c	 r12,r9,r0
	mask	 r12,r12,3
	addu	 r11,r13,r8
	bcnd.n	 lt0,r9,@L6220
	or	 r10,r0,r13
	bcnd.n	 eq0,r12,@L6214
	cmp	 r13,r12,3
	bb1.n	 ge,r13,@L6220
	cmp	 r13,r12,2
	bb1	 ge,r13,@L6221
	ld	 r13,r0,r11
	bcnd	 ne0,r13,@L6244
	subu	 r11,r11,44
	subu	 r10,r10,44
	subu	 r9,r9,1
@L6221:
	ld	 r13,r10,r8
	bcnd	 ne0,r13,@L6244
	subu	 r11,r11,44
	subu	 r10,r10,44
	subu	 r9,r9,1
@L6220:
	ld	 r13,r10,r8
	bcnd	 ne0,r13,@L6244
	subu	 r11,r11,44
	subu	 r9,r9,1
	bcnd.n	 lt0,r9,@L6212
	subu	 r10,r10,44
@L6214:
	ld	 r13,r10,r8
	bcnd.n	 ne0,r13,@L6244
	subu	 r13,r10,44
	ld	 r13,r13,r8
	bcnd.n	 ne0,r13,@L6244
	subu	 r11,r11,44
	subu	 r13,r10,88
	ld	 r13,r13,r8
	bcnd.n	 ne0,r13,@L6244
	subu	 r11,r11,44
	subu	 r13,r10,132
	ld	 r13,r13,r8
	bcnd.n	 eq0,r13,@L6241
	subu	 r11,r11,44
@L6244:
	br.n	 @L6212
	or	 r25,r0,r11
	align	 4
@L6241:
	subu	 r11,r11,44
	subu	 r9,r9,4
	bcnd.n	 ge0,r9,@L6214
	subu	 r10,r10,176
@L6212:
	bcnd	 eq0,r25,@L6217
	ld	 r4,r25,4
	ld	 r5,r25,12
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC297)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC297)
@L6217:
	or	 r3,r0,r24
	or.u	 r25,r0,hi16(__iob+64)
	or	 r4,r0,r23
	or	 r5,r0,r22
	or	 r25,r25,lo16(__iob+64)
	or	 r6,r0,r21
	bsr.n	 _fprintf
	or	 r2,r0,r25
	or.u	 r3,r0,hi16(@LC298)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC298)
@Lte57:
	ld	 r1,r31,64
	ld	 r21,r31,44
	ld.d	 r24,r31,56
	or.u	 r12,r0,hi16(_errors)
	ld	 r13,r12,lo16(_errors)
	ld.d	 r22,r31,48
	addu	 r31,r31,80
	addu	 r13,r13,1
	jmp.n	 r1
	st	 r13,r12,lo16(_errors)

data
	align	 8
@LC299:
	string	 "%s:%d: \000"
	align	 8
@LC300:
	string	 "%s: %s\n\000"
	align	 8
@LC301:
	string	 "%s: undocumented I/O error\n\000"
text
	align	 8
_error_from_errno:
	subu	 r31,r31,64
	st.d	 r24,r31,40
	st	 r1,r31,48
@Ltb58:
	bsr.n	 _print_containing_files
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_indepth)
	ld	 r11,r13,lo16(_indepth)
	bcnd.n	 lt0,r11,@L6257
	or	 r25,r0,0
	or.u	 r13,r0,hi16(_instack)
	mul	 r10,r11,44
	or	 r9,r13,lo16(_instack)
@L6259:
	or	 r12,r0,r10
	ld	 r13,r12,r9
	bcnd.n	 ne0,r13,@L6265
	subu	 r11,r11,1
	bcnd.n	 ge0,r11,@L6259
	subu	 r10,r12,44
@L6257:
	bcnd	 eq0,r25,@L6262
	ld	 r4,r25,4
	ld	 r5,r25,12
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC299)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC299)
@L6262:
	or.u	 r13,r0,hi16(_errno)
	ld	 r12,r13,lo16(_errno)
	or.u	 r13,r0,hi16(_sys_nerr)
	ld	 r13,r13,lo16(_sys_nerr)
	cmp	 r13,r12,r13
	bb0.n	 lt,r13,@L6263
	or	 r4,r0,r24
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r13,r0,hi16(_sys_errlist)
	or.u	 r3,r0,hi16(@LC300)
	or	 r13,r13,lo16(_sys_errlist)
	or	 r2,r2,lo16(__iob+64)
	ld	 r5,r13[r12]
	or	 r3,r3,lo16(@LC300)
	bsr.n	 _fprintf
	addu	 r1,r1,@L6267
@L6268:
	align	 4
@L6265:
	br.n	 @L6257
	addu	 r25,r10,r9
	align	 4
@L6263:
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC301)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC301)
@L6264:
	or.u	 r12,r0,hi16(_errors)
@Lte58:
	ld	 r1,r31,48
	ld	 r13,r12,lo16(_errors)
	ld.d	 r24,r31,40
	addu	 r31,r31,64
	addu	 r13,r13,1
	jmp.n	 r1
	st	 r13,r12,lo16(_errors)
	def	 @L6267,@L6264-@L6268

data
	align	 8
@LC302:
	string	 "%s:%d: \000"
	align	 8
@LC303:
	string	 "warning: \000"
	align	 8
@LC304:
	string	 "\n\000"
text
	align	 8
	global	 _warning
_warning:
	or.u	 r13,r0,hi16(_inhibit_warnings)
	ld	 r13,r13,lo16(_inhibit_warnings)
	subu	 r31,r31,80
	st.d	 r24,r31,56
	or	 r24,r0,r2
	st.d	 r22,r31,48
	or	 r23,r0,r3
	or	 r22,r0,r4
	st	 r21,r31,44
	or	 r21,r0,r5
	or	 r25,r0,0
	bcnd.n	 ne0,r13,@L6279
	st	 r1,r31,64
@Ltb59:
	or.u	 r13,r0,hi16(_warnings_are_errors)
	ld	 r13,r13,lo16(_warnings_are_errors)
	bcnd.n	 eq0,r13,@L6281
	or.u	 r12,r0,hi16(_errors)
	ld	 r13,r12,lo16(_errors)
	addu	 r13,r13,1
	st	 r13,r12,lo16(_errors)
@L6281:
	bsr	 _print_containing_files
	or.u	 r13,r0,hi16(_indepth)
	ld	 r9,r13,lo16(_indepth)
	bcnd.n	 lt0,r9,@L6283
	or.u	 r12,r0,hi16(_instack)
	mul	 r13,r9,44
	or	 r8,r12,lo16(_instack)
	xor.c	 r12,r9,r0
	mask	 r12,r12,3
	addu	 r11,r13,r8
	bcnd.n	 lt0,r9,@L6291
	or	 r10,r0,r13
	bcnd.n	 eq0,r12,@L6285
	cmp	 r13,r12,3
	bb1.n	 ge,r13,@L6291
	cmp	 r13,r12,2
	bb1	 ge,r13,@L6292
	ld	 r13,r0,r11
	bcnd	 ne0,r13,@L6315
	subu	 r11,r11,44
	subu	 r10,r10,44
	subu	 r9,r9,1
@L6292:
	ld	 r13,r10,r8
	bcnd	 ne0,r13,@L6315
	subu	 r11,r11,44
	subu	 r10,r10,44
	subu	 r9,r9,1
@L6291:
	ld	 r13,r10,r8
	bcnd	 ne0,r13,@L6315
	subu	 r11,r11,44
	subu	 r9,r9,1
	bcnd.n	 lt0,r9,@L6283
	subu	 r10,r10,44
@L6285:
	ld	 r13,r10,r8
	bcnd.n	 ne0,r13,@L6315
	subu	 r13,r10,44
	ld	 r13,r13,r8
	bcnd.n	 ne0,r13,@L6315
	subu	 r11,r11,44
	subu	 r13,r10,88
	ld	 r13,r13,r8
	bcnd.n	 ne0,r13,@L6315
	subu	 r11,r11,44
	subu	 r13,r10,132
	ld	 r13,r13,r8
	bcnd.n	 eq0,r13,@L6312
	subu	 r11,r11,44
@L6315:
	br.n	 @L6283
	or	 r25,r0,r11
	align	 4
@L6312:
	subu	 r11,r11,44
	subu	 r9,r9,4
	bcnd.n	 ge0,r9,@L6285
	subu	 r10,r10,176
@L6283:
	bcnd	 eq0,r25,@L6288
	ld	 r4,r25,4
	ld	 r5,r25,12
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC302)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC302)
@L6288:
	or.u	 r25,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC303)
	or	 r25,r25,lo16(__iob+64)
	or	 r3,r3,lo16(@LC303)
	bsr.n	 _fprintf
	or	 r2,r0,r25
	or	 r2,r0,r25
	or	 r3,r0,r24
	or	 r4,r0,r23
	or	 r5,r0,r22
	bsr.n	 _fprintf
	or	 r6,r0,r21
	or.u	 r3,r0,hi16(@LC304)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC304)
@L6279:
@Lte59:
	ld	 r1,r31,64
	ld	 r21,r31,44
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	jmp.n	 r1
	addu	 r31,r31,80

data
	align	 8
@LC305:
	string	 "%s:%d: \000"
	align	 8
@LC306:
	string	 "\n\000"
text
	align	 8
_error_with_line:
	subu	 r31,r31,80
	st.d	 r24,r31,56
	or	 r24,r0,r2
	st.d	 r22,r31,48
	or	 r23,r0,r3
	or	 r22,r0,r4
	st.d	 r20,r31,40
	or	 r21,r0,r5
	st	 r1,r31,64
@Ltb60:
	bsr.n	 _print_containing_files
	or	 r20,r0,r6
	or.u	 r13,r0,hi16(_indepth)
	ld	 r9,r13,lo16(_indepth)
	bcnd.n	 lt0,r9,@L6326
	or	 r25,r0,0
	or.u	 r12,r0,hi16(_instack)
	mul	 r13,r9,44
	or	 r8,r12,lo16(_instack)
	xor.c	 r12,r9,r0
	mask	 r12,r12,3
	addu	 r11,r13,r8
	bcnd.n	 lt0,r9,@L6334
	or	 r10,r0,r13
	bcnd.n	 eq0,r12,@L6328
	cmp	 r13,r12,3
	bb1.n	 ge,r13,@L6334
	cmp	 r13,r12,2
	bb1	 ge,r13,@L6335
	ld	 r13,r0,r11
	bcnd	 ne0,r13,@L6358
	subu	 r11,r11,44
	subu	 r10,r10,44
	subu	 r9,r9,1
@L6335:
	ld	 r13,r10,r8
	bcnd	 ne0,r13,@L6358
	subu	 r11,r11,44
	subu	 r10,r10,44
	subu	 r9,r9,1
@L6334:
	ld	 r13,r10,r8
	bcnd	 ne0,r13,@L6358
	subu	 r11,r11,44
	subu	 r9,r9,1
	bcnd.n	 lt0,r9,@L6326
	subu	 r10,r10,44
@L6328:
	ld	 r13,r10,r8
	bcnd.n	 ne0,r13,@L6358
	subu	 r13,r10,44
	ld	 r13,r13,r8
	bcnd.n	 ne0,r13,@L6358
	subu	 r11,r11,44
	subu	 r13,r10,88
	ld	 r13,r13,r8
	bcnd.n	 ne0,r13,@L6358
	subu	 r11,r11,44
	subu	 r13,r10,132
	ld	 r13,r13,r8
	bcnd.n	 eq0,r13,@L6355
	subu	 r11,r11,44
@L6358:
	br.n	 @L6326
	or	 r25,r0,r11
	align	 4
@L6355:
	subu	 r11,r11,44
	subu	 r9,r9,4
	bcnd.n	 ge0,r9,@L6328
	subu	 r10,r10,176
@L6326:
	bcnd	 eq0,r25,@L6331
	ld	 r4,r25,4
	or	 r5,r0,r24
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC305)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC305)
@L6331:
	or	 r3,r0,r23
	or.u	 r25,r0,hi16(__iob+64)
	or	 r4,r0,r22
	or	 r5,r0,r21
	or	 r25,r25,lo16(__iob+64)
	or	 r6,r0,r20
	bsr.n	 _fprintf
	or	 r2,r0,r25
	or.u	 r3,r0,hi16(@LC306)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC306)
@Lte60:
	ld	 r1,r31,64
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	or.u	 r12,r0,hi16(_errors)
	ld	 r13,r12,lo16(_errors)
	ld.d	 r20,r31,40
	addu	 r31,r31,80
	addu	 r13,r13,1
	jmp.n	 r1
	st	 r13,r12,lo16(_errors)

	align	 8
	global	 _pedwarn
_pedwarn:
	or.u	 r13,r0,hi16(_pedantic_errors)
	ld	 r13,r13,lo16(_pedantic_errors)
	subu	 r31,r31,80
	st.d	 r24,r31,56
	or	 r24,r0,r2
	st.d	 r22,r31,48
	or	 r23,r0,r3
	or	 r22,r0,r4
	st	 r21,r31,44
	or	 r21,r0,r5
	bcnd.n	 eq0,r13,@L6381
	st	 r1,r31,64
@Ltb61:
	bsr.n	 _print_containing_files
	or	 r25,r0,0
	or.u	 r13,r0,hi16(_indepth)
	ld	 r11,r13,lo16(_indepth)
	bcnd.n	 lt0,r11,@L6384
	or.u	 r13,r0,hi16(_instack)
	mul	 r10,r11,44
	or	 r9,r13,lo16(_instack)
@L6386:
	or	 r12,r0,r10
	ld	 r13,r12,r9
	bcnd.n	 ne0,r13,@L6401
	subu	 r11,r11,1
	bcnd.n	 ge0,r11,@L6386
	subu	 r10,r12,44
@L6384:
	bcnd	 eq0,r25,@L6389
	ld	 r4,r25,4
	ld	 r5,r25,12
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC297)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC297)
@L6389:
	or	 r3,r0,r24
	or	 r4,r0,r23
	or.u	 r25,r0,hi16(__iob+64)
	or	 r5,r0,r22
	or	 r25,r25,lo16(__iob+64)
	or	 r6,r0,r21
	bsr.n	 _fprintf
	or	 r2,r0,r25
	or.u	 r3,r0,hi16(@LC298)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC298)
	or.u	 r12,r0,hi16(_errors)
	ld	 r13,r12,lo16(_errors)
	addu	 r13,r13,1
	br.n	 @L6390
	st	 r13,r12,lo16(_errors)
	align	 4
@L6401:
	br.n	 @L6384
	addu	 r25,r10,r9
	align	 4
@L6402:
	br.n	 @L6395
	addu	 r25,r12,r10
	align	 4
@L6381:
	or.u	 r13,r0,hi16(_inhibit_warnings)
	ld	 r13,r13,lo16(_inhibit_warnings)
	bcnd.n	 ne0,r13,@L6390
	or	 r25,r0,0
	or.u	 r13,r0,hi16(_warnings_are_errors)
	ld	 r13,r13,lo16(_warnings_are_errors)
	bcnd.n	 eq0,r13,@L6393
	or.u	 r12,r0,hi16(_errors)
	ld	 r13,r12,lo16(_errors)
	addu	 r13,r13,1
	st	 r13,r12,lo16(_errors)
@L6393:
	bsr	 _print_containing_files
	or.u	 r13,r0,hi16(_indepth)
	ld	 r11,r13,lo16(_indepth)
	bcnd.n	 lt0,r11,@L6395
	or.u	 r13,r0,hi16(_instack)
	mul	 r12,r11,44
	or	 r10,r13,lo16(_instack)
@L6397:
	ld	 r13,r12,r10
	bcnd.n	 ne0,r13,@L6402
	subu	 r11,r11,1
	bcnd.n	 ge0,r11,@L6397
	subu	 r12,r12,44
@L6395:
	bcnd	 eq0,r25,@L6400
	ld	 r4,r25,4
	ld	 r5,r25,12
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC302)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC302)
@L6400:
	or.u	 r25,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC303)
	or	 r25,r25,lo16(__iob+64)
	or	 r3,r3,lo16(@LC303)
	bsr.n	 _fprintf
	or	 r2,r0,r25
	or	 r2,r0,r25
	or	 r3,r0,r24
	or	 r4,r0,r23
	or	 r5,r0,r22
	bsr.n	 _fprintf
	or	 r6,r0,r21
	or.u	 r3,r0,hi16(@LC304)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC304)
@L6390:
@Lte61:
	ld	 r1,r31,64
	ld	 r21,r31,44
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	jmp.n	 r1
	addu	 r31,r31,80

data
	align	 8
@LC307:
	string	 "%s:%d: \000"
	align	 8
@LC308:
	string	 "warning: \000"
	align	 8
@LC309:
	string	 "\n\000"
text
	align	 8
_pedwarn_with_file_and_line:
	subu	 r31,r31,80
	st.d	 r24,r31,56
	or.u	 r25,r0,hi16(_pedantic_errors)
	st.d	 r22,r31,48
	or	 r24,r0,r4
	ld	 r13,r25,lo16(_pedantic_errors)
	or	 r23,r0,r5
	or	 r22,r0,r6
	st	 r21,r31,44
	or	 r21,r0,r7
	bcnd.n	 ne0,r13,@L6412
	st	 r1,r31,64
@Ltb62:
	or.u	 r13,r0,hi16(_inhibit_warnings)
	ld	 r13,r13,lo16(_inhibit_warnings)
	bcnd	 ne0,r13,@L6411
@L6412:
	bcnd.n	 eq0,r2,@L6413
	or	 r4,r0,r2
	or	 r5,r0,r3
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC307)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC307)
@L6413:
	ld	 r13,r25,lo16(_pedantic_errors)
	bcnd.n	 ne0,r13,@L6417
	or.u	 r12,r0,hi16(_errors)
	or.u	 r13,r0,hi16(_warnings_are_errors)
	ld	 r13,r13,lo16(_warnings_are_errors)
	bcnd.n	 eq0,r13,@L6418
	or.u	 r13,r0,hi16(_pedantic_errors)
@L6417:
	ld	 r13,r12,lo16(_errors)
	addu	 r13,r13,1
	st	 r13,r12,lo16(_errors)
	or.u	 r13,r0,hi16(_pedantic_errors)
@L6418:
	ld	 r13,r13,lo16(_pedantic_errors)
	bcnd.n	 ne0,r13,@L6419
	or	 r3,r0,r24
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC308)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC308)
	or	 r3,r0,r24
@L6419:
	or.u	 r25,r0,hi16(__iob+64)
	or	 r4,r0,r23
	or	 r5,r0,r22
	or	 r25,r25,lo16(__iob+64)
	or	 r6,r0,r21
	bsr.n	 _fprintf
	or	 r2,r0,r25
	or.u	 r3,r0,hi16(@LC309)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC309)
@L6411:
@Lte62:
	ld	 r1,r31,64
	ld	 r21,r31,44
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	jmp.n	 r1
	addu	 r31,r31,80

data
	align	 8
@LC310:
	string	 "In file included\000"
	align	 8
@LC311:
	string	 ",\000"
	align	 8
@LC312:
	string	 " from %s:%d\000"
	align	 8
@LC313:
	string	 ":\n\000"
text
	align	 8
_print_containing_files:
	or.u	 r13,r0,hi16(_last_error_tick)
	ld	 r12,r13,lo16(_last_error_tick)
	or.u	 r13,r0,hi16(_input_file_stack_tick)
	ld	 r13,r13,lo16(_input_file_stack_tick)
	subu	 r31,r31,80
	st	 r1,r31,64
	st.d	 r24,r31,56
	or	 r24,r0,0
	st.d	 r20,r31,40
	or	 r20,r0,1
	st	 r19,r31,36
	cmp	 r12,r12,r13
	bb0.n	 ne,r12,@L6438
	st.d	 r22,r31,48
@Ltb63:
	or.u	 r13,r0,hi16(_indepth)
	ld	 r25,r13,lo16(_indepth)
	bcnd.n	 lt0,r25,@L6441
	or.u	 r12,r0,hi16(_instack)
	mul	 r13,r25,44
	or	 r9,r12,lo16(_instack)
	xor.c	 r12,r25,r0
	mask	 r12,r12,3
	addu	 r11,r13,r9
	bcnd.n	 lt0,r25,@L6476
	or	 r10,r0,r13
	bcnd.n	 eq0,r12,@L6443
	cmp	 r13,r12,3
	bb1.n	 ge,r13,@L6476
	cmp	 r13,r12,2
	bb1	 ge,r13,@L6477
	ld	 r13,r0,r11
	bcnd	 ne0,r13,@L6500
	subu	 r11,r11,44
	subu	 r10,r10,44
	subu	 r25,r25,1
@L6477:
	ld	 r13,r10,r9
	bcnd	 ne0,r13,@L6500
	subu	 r11,r11,44
	subu	 r10,r10,44
	subu	 r25,r25,1
@L6476:
	ld	 r13,r10,r9
	bcnd	 ne0,r13,@L6500
	subu	 r11,r11,44
	subu	 r25,r25,1
	bcnd.n	 lt0,r25,@L6441
	subu	 r10,r10,44
@L6443:
	ld	 r13,r10,r9
	bcnd.n	 ne0,r13,@L6500
	subu	 r13,r10,44
	ld	 r13,r13,r9
	subu	 r11,r11,44
	bcnd.n	 ne0,r13,@L6500
	subu	 r25,r25,1
	subu	 r13,r10,88
	ld	 r13,r13,r9
	subu	 r11,r11,44
	bcnd.n	 ne0,r13,@L6500
	subu	 r25,r25,1
	subu	 r13,r10,132
	ld	 r13,r13,r9
	subu	 r11,r11,44
	bcnd.n	 eq0,r13,@L6497
	subu	 r25,r25,1
@L6500:
	br.n	 @L6441
	or	 r24,r0,r11
	align	 4
@L6497:
	subu	 r11,r11,44
	subu	 r25,r25,1
	bcnd.n	 ge0,r25,@L6443
	subu	 r10,r10,176
@L6441:
	bcnd.n	 eq0,r24,@L6438
	subu	 r25,r25,1
	bcnd.n	 lt0,r25,@L6448
	or.u	 r12,r0,hi16(_instack)
	mul	 r13,r25,44
	or	 r19,r12,lo16(_instack)
	addu	 r23,r13,r19
	or	 r22,r0,r13
	xor.c	 r13,r25,r0
	or.u	 r21,r0,hi16(__iob+64)
	bcnd.n	 lt0,r25,@L6458
	mask	 r13,r13,1
	bcnd	 eq0,r13,@L6450
@L6458:
	ld	 r13,r0,r23
	bcnd	 eq0,r13,@L6459
	bcnd.n	 eq0,r20,@L6461
	or	 r24,r0,r23
	or.u	 r3,r0,hi16(@LC310)
	or	 r2,r21,lo16(__iob+64)
	or	 r3,r3,lo16(@LC310)
	br.n	 @L6501
	or	 r20,r0,0
	align	 4
@L6461:
	or.u	 r3,r0,hi16(@LC311)
	or	 r2,r21,lo16(__iob+64)
	or	 r3,r3,lo16(@LC311)
@L6501:
	bsr	 _fprintf
	ld	 r4,r24,4
	ld	 r5,r24,12
	or.u	 r3,r0,hi16(@LC312)
	or	 r2,r21,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC312)
@L6459:
	subu	 r23,r23,44
	subu	 r25,r25,1
	bcnd.n	 lt0,r25,@L6448
	subu	 r22,r22,44
@L6450:
	ld	 r13,r22,r19
	bcnd	 eq0,r13,@L6464
	bcnd.n	 eq0,r20,@L6466
	or	 r24,r0,r23
	or.u	 r3,r0,hi16(@LC310)
	or	 r2,r21,lo16(__iob+64)
	or	 r3,r3,lo16(@LC310)
	br.n	 @L6502
	or	 r20,r0,0
	align	 4
@L6466:
	or.u	 r3,r0,hi16(@LC311)
	or	 r2,r21,lo16(__iob+64)
	or	 r3,r3,lo16(@LC311)
@L6502:
	bsr	 _fprintf
	ld	 r4,r24,4
	ld	 r5,r24,12
	or.u	 r3,r0,hi16(@LC312)
	or	 r2,r21,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC312)
@L6464:
	subu	 r13,r22,44
	ld	 r13,r13,r19
	bcnd.n	 eq0,r13,@L6469
	subu	 r23,r23,44
	bcnd.n	 eq0,r20,@L6471
	or	 r24,r0,r23
	or.u	 r3,r0,hi16(@LC310)
	or	 r2,r21,lo16(__iob+64)
	or	 r3,r3,lo16(@LC310)
	br.n	 @L6503
	or	 r20,r0,0
	align	 4
@L6471:
	or.u	 r3,r0,hi16(@LC311)
	or	 r2,r21,lo16(__iob+64)
	or	 r3,r3,lo16(@LC311)
@L6503:
	bsr	 _fprintf
	ld	 r4,r24,4
	ld	 r5,r24,12
	or.u	 r3,r0,hi16(@LC312)
	or	 r2,r21,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC312)
@L6469:
	subu	 r23,r23,44
	subu	 r25,r25,2
	bcnd.n	 ge0,r25,@L6450
	subu	 r22,r22,88
@L6448:
	bcnd.n	 ne0,r20,@L6504
	or.u	 r13,r0,hi16(_input_file_stack_tick)
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC313)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC313)
	or.u	 r13,r0,hi16(_input_file_stack_tick)
@L6504:
	ld	 r12,r13,lo16(_input_file_stack_tick)
	or.u	 r13,r0,hi16(_last_error_tick)
	st	 r12,r13,lo16(_last_error_tick)
@L6438:
@Lte63:
	ld	 r1,r31,64
	ld	 r19,r31,36
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80

	align	 8
_line_for_error:
	or.u	 r13,r0,hi16(_indepth)
	ld	 r11,r13,lo16(_indepth)
	subu	 r31,r31,48
	bcnd.n	 lt0,r11,@L6515
	st	 r1,r31,36
@Ltb64:
	mul	 r12,r11,44
	or.u	 r13,r0,hi16(_instack)
	or	 r9,r13,lo16(_instack)
	addu	 r10,r12,r9
@L6517:
	ld	 r13,r12,r9
	bcnd.n	 ne0,r13,@L6522
	subu	 r10,r10,44
	subu	 r11,r11,1
	bcnd.n	 lt0,r11,@L6523
	subu	 r12,r12,44
	ld	 r2,r10,12
	br	 @L6517
	align	 4
@L6515:
	bsr	 _abort
	align	 4
@L6523:
	or	 r2,r0,0
@L6522:
@Lte64:
	ld	 r1,r31,36
	jmp.n	 r1
	addu	 r31,r31,48

	align	 8
_grow_outbuf:
	subu	 r31,r31,64
	st.d	 r24,r31,40
	or	 r25,r0,r2
	st	 r1,r31,48
@Ltb65:
	ld	 r13,r25,24
	ld	 r12,r25,20
	ld	 r9,r25,16
	subu	 r13,r13,r12
	subu	 r13,r9,r13
	cmp	 r13,r13,r3
	bb0.n	 le,r13,@L6533
	or	 r2,r0,0
	lda.h	 r13,r3[r3]
	ld	 r12,r25,24
	extu	 r11,r13,0<31>
	ld	 r10,r25,20
	addu	 r13,r13,r11
	ext	 r13,r13,0<1>
	subu	 r12,r12,r10
	mak	 r11,r9,0<1>
	addu	 r12,r13,r12
	cmp	 r13,r12,r11
	bb0.n	 gt,r13,@L6531
	st	 r11,r25,16
	st	 r12,r25,16
@L6531:
	ld	 r2,r25,20
	bsr.n	 _xrealloc
	ld	 r3,r25,16
	or	 r24,r0,r2
	bcnd	 ne0,r24,@L6532
	bsr	 _memory_full
@L6532:
	ld	 r13,r25,24
	ld	 r12,r25,20
	or	 r2,r0,0
	subu	 r13,r13,r12
	st	 r24,r25,20
	addu	 r13,r24,r13
	st	 r13,r25,24
@L6533:
@Lte65:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
_install:
	subu	 r31,r31,80
	st	 r1,r31,64
	st.d	 r24,r31,56
	st.d	 r22,r31,48
	st.d	 r20,r31,40
@Ltb66:
	or	 r23,r0,r2
	or	 r24,r0,r3
	or	 r22,r0,r4
	or	 r21,r0,r5
	or	 r20,r0,r6
	bcnd.n	 ge0,r24,@L6550
	or	 r25,r0,r7
	or	 r11,r0,r23
	or.u	 r13,r0,hi16(_is_idchar)
	ld.bu	 r12,r0,r11
	or	 r10,r13,lo16(_is_idchar)
	ld.bu	 r13,r12,r10
	bcnd	 eq0,r13,@L6552
	or	 r12,r0,r10
	addu	 r11,r11,1
@L6584:
	ld.bu	 r13,r0,r11
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L6584
	addu	 r11,r11,1
	subu	 r11,r11,1
@L6552:
	subu	 r24,r11,r23
@L6550:
	bcnd.n	 ge0,r25,@L6555
	or	 r2,r0,r23
	or	 r3,r0,r24
	bsr.n	 _hashf
	or	 r4,r0,1403
	or	 r25,r0,r2
@L6555:
	bsr.n	 _xmalloc
	addu	 r2,r24,29
	or.u	 r13,r0,hi16(_hashtab)
	or	 r13,r13,lo16(_hashtab)
	or	 r9,r0,r2
	lda	 r12,r13[r25]
	st	 r12,r9,8
	ld	 r12,r13[r25]
	st	 r12,r0,r9
	st	 r9,r13[r25]
	ld	 r13,r0,r9
	bcnd.n	 eq0,r13,@L6556
	st	 r0,r9,4
	st	 r9,r13,4
@L6556:
	st	 r22,r9,12
	ld	 r13,r9,12
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L6557
	st	 r24,r9,16
	br.n	 @L6558
	st	 r21,r9,24
	align	 4
@L6557:
	st	 r20,r9,24
@L6558:
	addu	 r13,r9,28
	st	 r13,r9,20
	or	 r2,r0,r23
	or	 r12,r0,0
	bcnd.n	 le0,r24,@L6560
	or	 r11,r0,r13
	mask	 r10,r24,3
	bcnd.n	 eq0,r10,@L6562
	cmp	 r13,r10,1
	bb0.n	 gt,r13,@L6566
	cmp	 r13,r10,2
	bb0	 gt,r13,@L6567
	ld.bu	 r13,r0,r2
	st.b	 r13,r9,28
	addu	 r2,r2,1
	addu	 r11,r9,29
	or	 r12,r0,1
@L6567:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	addu	 r2,r2,1
	addu	 r11,r11,1
	addu	 r12,r12,1
@L6566:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	addu	 r12,r12,1
	addu	 r2,r2,1
	cmp	 r13,r12,r24
	bb0.n	 lt,r13,@L6560
	addu	 r11,r11,1
@L6562:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	ld.bu	 r13,r2,1
	st.b	 r13,r11,1
	ld.bu	 r13,r2,2
	st.b	 r13,r11,2
	ld.bu	 r13,r2,3
	addu	 r2,r2,4
	addu	 r12,r12,4
	st.b	 r13,r11,3
	cmp	 r13,r12,r24
	bb1.n	 lt,r13,@L6562
	addu	 r11,r11,4
@L6560:
	ld	 r13,r9,20
	st.b	 r0,r13,r24
@Lte66:
	ld	 r1,r31,64
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	or	 r2,r0,r9
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80

	align	 8
	global	 _lookup
_lookup:
	subu	 r31,r31,64
	st	 r23,r31,36
	or	 r23,r0,r2
	st.d	 r24,r31,40
	or	 r24,r0,r3
	or	 r2,r0,r4
	bcnd.n	 ge0,r24,@L6599
	st	 r1,r31,48
@Ltb67:
	or.u	 r13,r0,hi16(_is_idchar)
	ld.bu	 r12,r0,r23
	or	 r11,r13,lo16(_is_idchar)
	ld.bu	 r13,r12,r11
	bcnd.n	 eq0,r13,@L6601
	or	 r3,r0,r23
	or	 r12,r0,r11
	addu	 r3,r3,1
@L6614:
	ld.bu	 r13,r0,r3
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L6614
	addu	 r3,r3,1
	subu	 r3,r3,1
@L6601:
	subu	 r24,r3,r23
@L6599:
	bcnd.n	 ge0,r2,@L6615
	or.u	 r13,r0,hi16(_hashtab)
	or	 r2,r0,r23
	or	 r3,r0,r24
	bsr.n	 _hashf
	or	 r4,r0,1403
	or.u	 r13,r0,hi16(_hashtab)
@L6615:
	or	 r13,r13,lo16(_hashtab)
	ld	 r25,r13[r2]
	bcnd.n	 eq0,r25,@L6611
	or	 r2,r0,0
@L6608:
	ld	 r13,r25,16
	cmp	 r13,r13,r24
	bb1	 ne,r13,@L6609
	ld	 r2,r25,20
	or	 r3,r0,r23
	bsr.n	 _strncmp
	or	 r4,r0,r24
	bcnd.n	 eq0,r2,@L6611
	or	 r2,r0,r25
@L6609:
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L6608
	or	 r2,r0,0
@L6611:
@Lte67:
	ld	 r1,r31,48
	ld	 r23,r31,36
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
_delete_macro:
	subu	 r31,r31,48
	st	 r1,r31,36
@Ltb68:
	ld	 r12,r2,4
	bcnd	 eq0,r12,@L6621
	ld	 r13,r0,r2
	st	 r13,r0,r12
@L6621:
	ld	 r12,r0,r2
	bcnd	 eq0,r12,@L6622
	ld	 r13,r2,4
	st	 r13,r12,4
@L6622:
	ld	 r12,r2,8
	ld	 r13,r0,r12
	cmp	 r13,r2,r13
	bb1	 ne,r13,@L6623
	ld	 r13,r0,r2
	st	 r13,r0,r12
@L6623:
	bsr	 _free
@Lte68:
	ld	 r1,r31,36
	jmp.n	 r1
	addu	 r31,r31,48

	align	 8
_hashf:
@Ltb69:
	bcnd.n	 eq0,r3,@L6636
	or	 r8,r0,0
@L6637:
	ld.bu	 r9,r0,r2
	addu	 r2,r2,1
	subu	 r3,r3,1
	bcnd.n	 ne0,r3,@L6637
	lda	 r8,r9[r8]
@L6636:
	and.u	 r9,r8,0x7fff
	bcnd.n	 gt0,r4,@L6640
	subu	 r8,r0,r4
	bcnd.n	 ge0,r9,@L6641
	subu	 r2,r0,r9
	divu	 r2,r2,r8
	bcnd	 ne0,r4,@L6639
@L6643:
	tb0	 0,r0,503
	br	 @L6639
	align	 4
@L6641:
	divu	 r2,r9,r8
	bcnd	 eq0,r4,@L6643
	subu	 r2,r0,r2
	br	 @L6639
	align	 4
@L6640:
	bcnd.n	 ge0,r9,@L6642
	subu	 r2,r0,r9
	divu	 r2,r2,r4
	br.n	 @L6639
	subu	 r2,r0,r2
	align	 4
@L6642:
	divu	 r2,r9,r4
@L6639:
	mul	 r2,r2,r4
	jmp.n	 r1
	subu	 r2,r9,r2
@Lte69:

data
	align	 8
@LC314:
	string	 "#define %s\000"
	align	 8
@LC315:
	string	 "(\000"
	align	 8
@LC316:
	string	 ", \000"
	align	 8
@LC317:
	string	 ")\000"
	align	 8
@LC318:
	string	 " \000"
	align	 8
@LC319:
	string	 " #\000"
	align	 8
@LC320:
	string	 " ## \000"
	align	 8
@LC321:
	string	 " ## \000"
	align	 8
@LC322:
	string	 "\n\000"
text
	align	 8
_dump_single_macro:
	subu	 r31,r31,80
	st	 r1,r31,64
	st	 r21,r31,44
	st.d	 r24,r31,56
	or	 r13,r0,r2
	st.d	 r22,r31,48
@Ltb70:
	or	 r23,r0,r3
	ld	 r4,r13,20
	or.u	 r3,r0,hi16(@LC314)
	ld	 r22,r13,24
	or	 r2,r0,r23
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC314)
	ld	 r13,r0,r22
	bcnd	 lt0,r13,@L6663
	or.u	 r3,r0,hi16(@LC315)
	or	 r2,r0,r23
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC315)
	ld	 r13,r0,r22
	bcnd.n	 le0,r13,@L6665
	or	 r25,r0,0
	or.u	 r24,r0,hi16(@LC316)
	or	 r2,r0,r22
@L6680:
	or	 r3,r0,r25
	bsr.n	 _dump_arg_n
	or	 r4,r0,r23
	ld	 r13,r0,r22
	addu	 r25,r25,1
	cmp	 r13,r25,r13
	bb1.n	 ge,r13,@L6666
	or	 r2,r0,r23
	bsr.n	 _fprintf
	or	 r3,r24,lo16(@LC316)
@L6666:
	ld	 r13,r0,r22
	cmp	 r13,r25,r13
	bb1.n	 lt,r13,@L6680
	or	 r2,r0,r22
@L6665:
	or.u	 r3,r0,hi16(@LC317)
	or	 r2,r0,r23
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC317)
@L6663:
	or.u	 r3,r0,hi16(@LC318)
	or	 r2,r0,r23
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC318)
	ld	 r25,r22,28
	or	 r21,r0,0
	bcnd.n	 eq0,r25,@L6671
	or	 r24,r0,0
@L6673:
	ld	 r2,r22,12
	or	 r3,r0,r21
	ld	 r4,r25,8
	bsr.n	 _dump_defn_1
	or	 r5,r0,r23
	ld	 r13,r25,8
	cmp	 r12,r13,0
	ld.b	 r11,r25,4
	ext	 r12,r12,1<eq>
	addu	 r21,r21,r13
	bcnd.n	 eq0,r11,@L6675
	and	 r24,r24,r12
	or.u	 r3,r0,hi16(@LC319)
	or	 r2,r0,r23
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC319)
@L6675:
	ld.b	 r13,r25,5
	cmp	 r12,r24,0
	cmp	 r13,r13,0
	and.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L6676
	or.u	 r3,r0,hi16(@LC320)
	or	 r2,r0,r23
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC320)
@L6676:
	ld	 r3,r25,12
	or	 r2,r0,r22
	bsr.n	 _dump_arg_n
	or	 r4,r0,r23
	ld.b	 r13,r25,6
	bcnd.n	 eq0,r13,@L6672
	or	 r24,r0,0
	or.u	 r3,r0,hi16(@LC321)
	or	 r2,r0,r23
	or	 r3,r3,lo16(@LC321)
	bsr.n	 _fprintf
	or	 r24,r0,1
@L6672:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L6673
@L6671:
	or	 r3,r0,r21
	ld	 r4,r22,4
	or	 r5,r0,r23
	ld	 r2,r22,12
	bsr.n	 _dump_defn_1
	subu	 r4,r4,r3
	or.u	 r3,r0,hi16(@LC322)
	or	 r2,r0,r23
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC322)
@Lte70:
	ld	 r1,r31,64
	ld	 r21,r31,44
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	jmp.n	 r1
	addu	 r31,r31,80

	align	 8
_dump_all_macros:
	subu	 r31,r31,80
	st	 r1,r31,64
	st.d	 r24,r31,56
	st.d	 r18,r31,32
	or	 r19,r0,0
	st.d	 r22,r31,48
	or.u	 r18,r0,hi16(@LC316)
	st.d	 r20,r31,40
@Ltb71:
	or.u	 r13,r0,hi16(_hashtab)
@L6741:
	or	 r13,r13,lo16(_hashtab)
	ld	 r20,r13[r19]
	bcnd	 eq0,r20,@L6713
@L6718:
	ld	 r13,r20,12
	cmp	 r13,r13,31
	bb1	 ne,r13,@L6717
	ld	 r4,r20,20
	ld	 r23,r20,24
	or.u	 r13,r0,hi16(__iob+32)
	or.u	 r3,r0,hi16(@LC314)
	or	 r21,r13,lo16(__iob+32)
	or	 r3,r3,lo16(@LC314)
	bsr.n	 _fprintf
	or	 r2,r0,r21
	ld	 r13,r0,r23
	bcnd	 lt0,r13,@L6721
	or.u	 r3,r0,hi16(@LC315)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC315)
	ld	 r13,r0,r23
	bcnd.n	 le0,r13,@L6723
	or	 r25,r0,0
	or	 r2,r0,r23
@L6740:
	or	 r3,r0,r25
	bsr.n	 _dump_arg_n
	or	 r4,r0,r21
	ld	 r13,r0,r23
	addu	 r25,r25,1
	cmp	 r13,r25,r13
	bb1.n	 ge,r13,@L6724
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r18,lo16(@LC316)
@L6724:
	ld	 r13,r0,r23
	cmp	 r13,r25,r13
	bb1.n	 lt,r13,@L6740
	or	 r2,r0,r23
@L6723:
	or.u	 r3,r0,hi16(@LC317)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC317)
@L6721:
	or.u	 r3,r0,hi16(@LC318)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC318)
	ld	 r25,r23,28
	or	 r22,r0,0
	bcnd.n	 eq0,r25,@L6729
	or	 r24,r0,0
@L6731:
	ld	 r2,r23,12
	or	 r3,r0,r22
	ld	 r4,r25,8
	bsr.n	 _dump_defn_1
	or	 r5,r0,r21
	ld	 r13,r25,8
	cmp	 r12,r13,0
	ld.b	 r11,r25,4
	ext	 r12,r12,1<eq>
	addu	 r22,r22,r13
	bcnd.n	 eq0,r11,@L6733
	and	 r24,r24,r12
	or.u	 r3,r0,hi16(@LC319)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC319)
@L6733:
	ld.b	 r13,r25,5
	cmp	 r12,r24,0
	cmp	 r13,r13,0
	and.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L6734
	or.u	 r3,r0,hi16(@LC320)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC320)
@L6734:
	ld	 r3,r25,12
	or	 r2,r0,r23
	bsr.n	 _dump_arg_n
	or	 r4,r0,r21
	ld.b	 r13,r25,6
	bcnd.n	 eq0,r13,@L6730
	or	 r24,r0,0
	or.u	 r3,r0,hi16(@LC321)
	or	 r2,r0,r21
	or	 r3,r3,lo16(@LC321)
	bsr.n	 _fprintf
	or	 r24,r0,1
@L6730:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L6731
@L6729:
	ld	 r2,r23,12
	ld	 r4,r23,4
	or	 r3,r0,r22
	or	 r5,r0,r21
	bsr.n	 _dump_defn_1
	subu	 r4,r4,r3
	or.u	 r3,r0,hi16(@LC322)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC322)
@L6717:
	ld	 r20,r0,r20
	bcnd	 ne0,r20,@L6718
@L6713:
	addu	 r19,r19,1
	cmp	 r13,r19,1402
	bb1.n	 le,r13,@L6741
	or.u	 r13,r0,hi16(_hashtab)
@Lte71:
	ld	 r1,r31,64
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	ld.d	 r18,r31,32
	jmp.n	 r1
	addu	 r31,r31,80

	align	 8
_dump_defn_1:
	subu	 r31,r31,64
	st.d	 r24,r31,40
	addu	 r25,r2,r3
	st	 r23,r31,36
	addu	 r23,r25,r4
	st	 r1,r31,48
@Ltb72:
	cmp	 r13,r25,r23
	bb0.n	 lo,r13,@L6782
	or	 r24,r0,r5
@L6783:
	ld.bu	 r13,r0,r25
	cmp	 r13,r13,10
	bb0.n	 ne,r13,@L6822
	addu	 r25,r25,1
	subu	 r25,r25,1
	ld	 r13,r0,r24
	subu	 r13,r13,1
	bcnd.n	 ge0,r13,@L6785
	st	 r13,r0,r24
	ld.bu	 r2,r0,r25
	or	 r3,r0,r24
	bsr.n	 __flsbuf
	addu	 r1,r1,@L6823
@L6824:
	align	 4
@L6785:
	ld	 r13,r24,4
	addu	 r12,r13,1
	st	 r12,r24,4
	ld.bu	 r12,r0,r25
	st.b	 r12,r0,r13
@L6787:
	addu	 r25,r25,1
@L6822:
	cmp	 r13,r25,r23
	bb1	 lo,r13,@L6783
@L6782:
@Lte72:
	ld	 r1,r31,48
	ld	 r23,r31,36
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64
	def	 @L6823,@L6787-@L6824

	align	 8
_dump_arg_n:
	subu	 r31,r31,64
	st	 r1,r31,48
	st.d	 r22,r31,32
	or	 r22,r0,r2
	st.d	 r24,r31,40
@Ltb73:
	ld	 r13,r0,r22
	addu	 r3,r3,1
	cmp	 r13,r3,r13
	ld	 r25,r22,32
	bb1.n	 ge,r13,@L6850
	or	 r23,r0,r4
	or	 r24,r0,r3
@L6839:
	or	 r2,r0,r25
	bsr.n	 _index
	or	 r3,r0,32
	ld	 r13,r0,r22
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lt,r13,@L6839
	addu	 r25,r2,1
	br	 @L6850
	align	 4
@L6843:
	ld	 r13,r0,r23
	subu	 r13,r13,1
	bcnd.n	 ge0,r13,@L6844
	st	 r13,r0,r23
	ld.bu	 r2,r0,r25
	or	 r3,r0,r23
	bsr.n	 __flsbuf
	addu	 r1,r1,@L6851
@L6852:
	align	 4
@L6844:
	ld	 r13,r23,4
	addu	 r12,r13,1
	st	 r12,r23,4
	ld.bu	 r12,r0,r25
	st.b	 r12,r0,r13
@L6845:
	addu	 r25,r25,1
@L6850:
	ld.bu	 r13,r0,r25
	cmp	 r12,r13,0
	cmp	 r13,r13,44
	or	 r12,r12,r13
	extu	 r13,r12,1<eq>
	xor	 r12,r13,1
@Lte73:
	bcnd	 ne0,r12,@L6843
	ld.d	 r24,r31,40
	ld	 r1,r31,48
	ld.d	 r22,r31,32
	jmp.n	 r1
	addu	 r31,r31,64
	def	 @L6851,@L6845-@L6852

	align	 8
_initialize_char_syntax:
@Ltb74:
	or	 r7,r0,97
	or	 r6,r0,1
	or.u	 r9,r0,hi16(_is_idchar-32)
	or.u	 r8,r0,hi16(_is_idstart-32)
	or	 r11,r9,lo16(_is_idchar-32)
	or	 r13,r8,lo16(_is_idstart-32)
	addu	 r10,r11,32
	addu	 r12,r13,32
@L6868:
	st.b	 r6,r7,r11
	st.b	 r6,r7,r10
	st.b	 r6,r7,r13
	addu	 r9,r7,1
	st.b	 r6,r7,r12
	st.b	 r6,r9,r11
	st.b	 r6,r9,r10
	addu	 r7,r7,2
	st.b	 r6,r9,r13
	cmp	 r8,r7,122
	bb1.n	 le,r8,@L6868
	st.b	 r6,r9,r12
	or.u	 r7,r0,hi16(_is_idchar)
	or	 r7,r7,lo16(_is_idchar)
	or	 r9,r0,1
	st.b	 r9,r7,48
	st.b	 r9,r7,49
	st.b	 r9,r7,50
	st.b	 r9,r7,51
	st.b	 r9,r7,52
	st.b	 r9,r7,53
	st.b	 r9,r7,54
	st.b	 r9,r7,55
	st.b	 r9,r7,56
	st.b	 r9,r7,57
	st.b	 r9,r7,95
	or.u	 r13,r0,hi16(_is_idstart)
	or.u	 r8,r0,hi16(_is_hor_space)
	or	 r13,r13,lo16(_is_idstart)
	or	 r8,r8,lo16(_is_hor_space)
	st.b	 r9,r13,95
	st.b	 r9,r8,32
	st.b	 r9,r8,9
	st.b	 r9,r8,11
	st.b	 r9,r8,12
	or.u	 r6,r0,hi16(_dollars_in_ident)
	st.b	 r9,r8,13
	or.u	 r8,r0,hi16(_is_space)
	ld	 r6,r6,lo16(_dollars_in_ident)
	or	 r8,r8,lo16(_is_space)
	st.b	 r9,r8,32
	st.b	 r9,r8,9
	st.b	 r9,r8,11
	st.b	 r9,r8,12
	st.b	 r9,r8,10
	st.b	 r9,r8,13
	st.b	 r6,r7,36
	jmp.n	 r1
	st.b	 r6,r13,36
@Lte74:

data
	align	 8
@LC323:
	string	 "__LINE__\000"
	align	 8
@LC324:
	string	 "__DATE__\000"
	align	 8
@LC325:
	string	 "__FILE__\000"
	align	 8
@LC326:
	string	 "__BASE_FILE__\000"
	align	 8
@LC327:
	string	 "__INCLUDE_LEVEL__\000"
	align	 8
@LC328:
	string	 "__VERSION__\000"
	align	 8
@LC329:
	string	 "__SIZE_TYPE__\000"
	align	 8
@LC330:
	string	 "__PTRDIFF_TYPE__ \000"
	align	 8
@LC331:
	string	 "__WCHAR_TYPE__\000"
	align	 8
@LC332:
	string	 "__TIME__\000"
	align	 8
@LC333:
	string	 "__STDC__\000"
	align	 8
@LC334:
	string	 "__OBJC__\000"
	align	 8
@LC335:
	string	 " __BASE_FILE__ \"%s\"\n\000"
	align	 8
@LC336:
	string	 " __VERSION__ \"%s\"\n\000"
	align	 8
@LC337:
	string	 " __SIZE_TYPE__ %s\n\000"
	align	 8
@LC338:
	string	 "long unsigned int\000"
	align	 8
@LC339:
	string	 " __PTRDIFF_TYPE__ %s\n\000"
	align	 8
@LC340:
	string	 "long int\000"
	align	 8
@LC341:
	string	 " __WCHAR_TYPE__ %s\n\000"
	align	 8
@LC342:
	string	 "short unsigned int\000"
	align	 8
@LC343:
	string	 " __DATE__ \"%s %2d %4d\"\n\000"
	align	 8
@LC344:
	string	 " __TIME__ \"%02d:%02d:%02d\"\n\000"
	align	 8
@LC345:
	string	 " __STDC__ 1\000"
	align	 8
@LC346:
	string	 " __OBJC__ 1\000"
text
	align	 8
_initialize_builtins:
	or.u	 r12,r0,hi16(@LC323)
	ld.bu	 r11,r12,lo16(@LC323)
	subu	 r31,r31,2128
	or.u	 r13,r0,hi16(_is_idchar)
	st	 r19,r31,36
	or	 r19,r0,r2
	st.d	 r24,r31,56
	or	 r24,r0,r3
	st.d	 r22,r31,48
	subu	 r23,r0,1
	st	 r1,r31,64
	or	 r10,r13,lo16(_is_idchar)
	st.d	 r20,r31,40
@Ltb75:
	or	 r22,r12,lo16(@LC323)
	ld.bu	 r13,r11,r10
	or	 r21,r0,20
	bcnd.n	 eq0,r13,@L6903
	or	 r11,r0,r22
	or	 r12,r0,r10
	addu	 r11,r11,1
@L7363:
	ld.bu	 r13,r0,r11
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L7363
	addu	 r11,r11,1
	subu	 r11,r11,1
@L6903:
	bcnd.n	 ge0,r23,@L6906
	subu	 r25,r11,r22
	or	 r2,r0,r22
	or	 r3,r0,r25
	bsr.n	 _hashf
	or	 r4,r0,1403
	or	 r23,r0,r2
@L6906:
	bsr.n	 _xmalloc
	addu	 r2,r25,29
	or.u	 r13,r0,hi16(_hashtab)
	or	 r13,r13,lo16(_hashtab)
	or	 r9,r0,r2
	lda	 r12,r13[r23]
	st	 r12,r9,8
	ld	 r12,r13[r23]
	st	 r12,r0,r9
	st	 r9,r13[r23]
	ld	 r13,r0,r9
	bcnd.n	 eq0,r13,@L6907
	st	 r0,r9,4
	st	 r9,r13,4
@L6907:
	st	 r21,r9,12
	st	 r25,r9,16
	st	 r0,r9,24
	addu	 r13,r9,28
	st	 r13,r9,20
	or	 r2,r0,r22
	or	 r12,r0,0
	bcnd.n	 le0,r25,@L6911
	or	 r11,r0,r13
	mask	 r10,r25,3
	bcnd.n	 eq0,r10,@L6913
	cmp	 r13,r10,1
	bb0.n	 gt,r13,@L7345
	cmp	 r13,r10,2
	bb0	 gt,r13,@L7346
	ld.bu	 r13,r0,r2
	st.b	 r13,r9,28
	addu	 r2,r2,1
	addu	 r11,r9,29
	or	 r12,r0,1
@L7346:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	addu	 r2,r2,1
	addu	 r11,r11,1
	addu	 r12,r12,1
@L7345:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	addu	 r12,r12,1
	addu	 r2,r2,1
	cmp	 r13,r12,r25
	bb0.n	 lt,r13,@L6911
	addu	 r11,r11,1
@L6913:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	ld.bu	 r13,r2,1
	st.b	 r13,r11,1
	ld.bu	 r13,r2,2
	st.b	 r13,r11,2
	ld.bu	 r13,r2,3
	addu	 r2,r2,4
	addu	 r12,r12,4
	st.b	 r13,r11,3
	cmp	 r13,r12,r25
	bb1.n	 lt,r13,@L6913
	addu	 r11,r11,4
@L6911:
	ld	 r13,r9,20
	subu	 r23,r0,1
	or.u	 r12,r0,hi16(@LC324)
	st.b	 r0,r13,r25
	or.u	 r13,r0,hi16(_is_idchar)
	ld.bu	 r11,r12,lo16(@LC324)
	or	 r10,r13,lo16(_is_idchar)
	or	 r22,r12,lo16(@LC324)
	ld.bu	 r13,r11,r10
	or	 r21,r0,21
	bcnd.n	 eq0,r13,@L6918
	or	 r11,r0,r22
	or	 r12,r0,r10
	addu	 r11,r11,1
@L7364:
	ld.bu	 r13,r0,r11
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L7364
	addu	 r11,r11,1
	subu	 r11,r11,1
@L6918:
	bcnd.n	 ge0,r23,@L6921
	subu	 r25,r11,r22
	or	 r2,r0,r22
	or	 r3,r0,r25
	bsr.n	 _hashf
	or	 r4,r0,1403
	or	 r23,r0,r2
@L6921:
	bsr.n	 _xmalloc
	addu	 r2,r25,29
	or.u	 r13,r0,hi16(_hashtab)
	or	 r13,r13,lo16(_hashtab)
	or	 r9,r0,r2
	lda	 r12,r13[r23]
	st	 r12,r9,8
	ld	 r12,r13[r23]
	st	 r12,r0,r9
	st	 r9,r13[r23]
	ld	 r13,r0,r9
	bcnd.n	 eq0,r13,@L6922
	st	 r0,r9,4
	st	 r9,r13,4
@L6922:
	st	 r21,r9,12
	st	 r25,r9,16
	st	 r0,r9,24
	addu	 r13,r9,28
	st	 r13,r9,20
	or	 r2,r0,r22
	or	 r12,r0,0
	bcnd.n	 le0,r25,@L6926
	or	 r11,r0,r13
	mask	 r10,r25,3
	bcnd.n	 eq0,r10,@L6928
	cmp	 r13,r10,1
	bb0.n	 gt,r13,@L7325
	cmp	 r13,r10,2
	bb0	 gt,r13,@L7326
	ld.bu	 r13,r0,r2
	st.b	 r13,r9,28
	addu	 r2,r2,1
	addu	 r11,r9,29
	or	 r12,r0,1
@L7326:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	addu	 r2,r2,1
	addu	 r11,r11,1
	addu	 r12,r12,1
@L7325:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	addu	 r12,r12,1
	addu	 r2,r2,1
	cmp	 r13,r12,r25
	bb0.n	 lt,r13,@L6926
	addu	 r11,r11,1
@L6928:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	ld.bu	 r13,r2,1
	st.b	 r13,r11,1
	ld.bu	 r13,r2,2
	st.b	 r13,r11,2
	ld.bu	 r13,r2,3
	addu	 r2,r2,4
	addu	 r12,r12,4
	st.b	 r13,r11,3
	cmp	 r13,r12,r25
	bb1.n	 lt,r13,@L6928
	addu	 r11,r11,4
@L6926:
	ld	 r13,r9,20
	subu	 r23,r0,1
	or.u	 r12,r0,hi16(@LC325)
	st.b	 r0,r13,r25
	or.u	 r13,r0,hi16(_is_idchar)
	ld.bu	 r11,r12,lo16(@LC325)
	or	 r10,r13,lo16(_is_idchar)
	or	 r22,r12,lo16(@LC325)
	ld.bu	 r13,r11,r10
	or	 r21,r0,22
	bcnd.n	 eq0,r13,@L6933
	or	 r11,r0,r22
	or	 r12,r0,r10
	addu	 r11,r11,1
@L7365:
	ld.bu	 r13,r0,r11
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L7365
	addu	 r11,r11,1
	subu	 r11,r11,1
@L6933:
	bcnd.n	 ge0,r23,@L6936
	subu	 r25,r11,r22
	or	 r2,r0,r22
	or	 r3,r0,r25
	bsr.n	 _hashf
	or	 r4,r0,1403
	or	 r23,r0,r2
@L6936:
	bsr.n	 _xmalloc
	addu	 r2,r25,29
	or.u	 r13,r0,hi16(_hashtab)
	or	 r13,r13,lo16(_hashtab)
	or	 r9,r0,r2
	lda	 r12,r13[r23]
	st	 r12,r9,8
	ld	 r12,r13[r23]
	st	 r12,r0,r9
	st	 r9,r13[r23]
	ld	 r13,r0,r9
	bcnd.n	 eq0,r13,@L6937
	st	 r0,r9,4
	st	 r9,r13,4
@L6937:
	st	 r21,r9,12
	st	 r25,r9,16
	st	 r0,r9,24
	addu	 r13,r9,28
	st	 r13,r9,20
	or	 r2,r0,r22
	or	 r12,r0,0
	bcnd.n	 le0,r25,@L6941
	or	 r11,r0,r13
	mask	 r10,r25,3
	bcnd.n	 eq0,r10,@L6943
	cmp	 r13,r10,1
	bb0.n	 gt,r13,@L7305
	cmp	 r13,r10,2
	bb0	 gt,r13,@L7306
	ld.bu	 r13,r0,r2
	st.b	 r13,r9,28
	addu	 r2,r2,1
	addu	 r11,r9,29
	or	 r12,r0,1
@L7306:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	addu	 r2,r2,1
	addu	 r11,r11,1
	addu	 r12,r12,1
@L7305:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	addu	 r12,r12,1
	addu	 r2,r2,1
	cmp	 r13,r12,r25
	bb0.n	 lt,r13,@L6941
	addu	 r11,r11,1
@L6943:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	ld.bu	 r13,r2,1
	st.b	 r13,r11,1
	ld.bu	 r13,r2,2
	st.b	 r13,r11,2
	ld.bu	 r13,r2,3
	addu	 r2,r2,4
	addu	 r12,r12,4
	st.b	 r13,r11,3
	cmp	 r13,r12,r25
	bb1.n	 lt,r13,@L6943
	addu	 r11,r11,4
@L6941:
	ld	 r13,r9,20
	subu	 r23,r0,1
	or.u	 r12,r0,hi16(@LC326)
	st.b	 r0,r13,r25
	or.u	 r13,r0,hi16(_is_idchar)
	ld.bu	 r11,r12,lo16(@LC326)
	or	 r10,r13,lo16(_is_idchar)
	or	 r22,r12,lo16(@LC326)
	ld.bu	 r13,r11,r10
	or	 r21,r0,23
	bcnd.n	 eq0,r13,@L6948
	or	 r11,r0,r22
	or	 r12,r0,r10
	addu	 r11,r11,1
@L7366:
	ld.bu	 r13,r0,r11
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L7366
	addu	 r11,r11,1
	subu	 r11,r11,1
@L6948:
	bcnd.n	 ge0,r23,@L6951
	subu	 r25,r11,r22
	or	 r2,r0,r22
	or	 r3,r0,r25
	bsr.n	 _hashf
	or	 r4,r0,1403
	or	 r23,r0,r2
@L6951:
	bsr.n	 _xmalloc
	addu	 r2,r25,29
	or.u	 r13,r0,hi16(_hashtab)
	or	 r13,r13,lo16(_hashtab)
	or	 r9,r0,r2
	lda	 r12,r13[r23]
	st	 r12,r9,8
	ld	 r12,r13[r23]
	st	 r12,r0,r9
	st	 r9,r13[r23]
	ld	 r13,r0,r9
	bcnd.n	 eq0,r13,@L6952
	st	 r0,r9,4
	st	 r9,r13,4
@L6952:
	st	 r21,r9,12
	st	 r25,r9,16
	st	 r0,r9,24
	addu	 r13,r9,28
	st	 r13,r9,20
	or	 r2,r0,r22
	or	 r12,r0,0
	bcnd.n	 le0,r25,@L6956
	or	 r11,r0,r13
	mask	 r10,r25,3
	bcnd.n	 eq0,r10,@L6958
	cmp	 r13,r10,1
	bb0.n	 gt,r13,@L7285
	cmp	 r13,r10,2
	bb0	 gt,r13,@L7286
	ld.bu	 r13,r0,r2
	st.b	 r13,r9,28
	addu	 r2,r2,1
	addu	 r11,r9,29
	or	 r12,r0,1
@L7286:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	addu	 r2,r2,1
	addu	 r11,r11,1
	addu	 r12,r12,1
@L7285:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	addu	 r12,r12,1
	addu	 r2,r2,1
	cmp	 r13,r12,r25
	bb0.n	 lt,r13,@L6956
	addu	 r11,r11,1
@L6958:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	ld.bu	 r13,r2,1
	st.b	 r13,r11,1
	ld.bu	 r13,r2,2
	st.b	 r13,r11,2
	ld.bu	 r13,r2,3
	addu	 r2,r2,4
	addu	 r12,r12,4
	st.b	 r13,r11,3
	cmp	 r13,r12,r25
	bb1.n	 lt,r13,@L6958
	addu	 r11,r11,4
@L6956:
	ld	 r13,r9,20
	subu	 r23,r0,1
	or.u	 r12,r0,hi16(@LC327)
	st.b	 r0,r13,r25
	or.u	 r13,r0,hi16(_is_idchar)
	ld.bu	 r11,r12,lo16(@LC327)
	or	 r10,r13,lo16(_is_idchar)
	or	 r22,r12,lo16(@LC327)
	ld.bu	 r13,r11,r10
	or	 r21,r0,24
	bcnd.n	 eq0,r13,@L6963
	or	 r11,r0,r22
	or	 r12,r0,r10
	addu	 r11,r11,1
@L7367:
	ld.bu	 r13,r0,r11
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L7367
	addu	 r11,r11,1
	subu	 r11,r11,1
@L6963:
	bcnd.n	 ge0,r23,@L6966
	subu	 r25,r11,r22
	or	 r2,r0,r22
	or	 r3,r0,r25
	bsr.n	 _hashf
	or	 r4,r0,1403
	or	 r23,r0,r2
@L6966:
	bsr.n	 _xmalloc
	addu	 r2,r25,29
	or.u	 r13,r0,hi16(_hashtab)
	or	 r13,r13,lo16(_hashtab)
	or	 r9,r0,r2
	lda	 r12,r13[r23]
	st	 r12,r9,8
	ld	 r12,r13[r23]
	st	 r12,r0,r9
	st	 r9,r13[r23]
	ld	 r13,r0,r9
	bcnd.n	 eq0,r13,@L6967
	st	 r0,r9,4
	st	 r9,r13,4
@L6967:
	st	 r21,r9,12
	st	 r25,r9,16
	st	 r0,r9,24
	addu	 r13,r9,28
	st	 r13,r9,20
	or	 r2,r0,r22
	or	 r12,r0,0
	bcnd.n	 le0,r25,@L6971
	or	 r11,r0,r13
	mask	 r10,r25,3
	bcnd.n	 eq0,r10,@L6973
	cmp	 r13,r10,1
	bb0.n	 gt,r13,@L7265
	cmp	 r13,r10,2
	bb0	 gt,r13,@L7266
	ld.bu	 r13,r0,r2
	st.b	 r13,r9,28
	addu	 r2,r2,1
	addu	 r11,r9,29
	or	 r12,r0,1
@L7266:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	addu	 r2,r2,1
	addu	 r11,r11,1
	addu	 r12,r12,1
@L7265:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	addu	 r12,r12,1
	addu	 r2,r2,1
	cmp	 r13,r12,r25
	bb0.n	 lt,r13,@L6971
	addu	 r11,r11,1
@L6973:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	ld.bu	 r13,r2,1
	st.b	 r13,r11,1
	ld.bu	 r13,r2,2
	st.b	 r13,r11,2
	ld.bu	 r13,r2,3
	addu	 r2,r2,4
	addu	 r12,r12,4
	st.b	 r13,r11,3
	cmp	 r13,r12,r25
	bb1.n	 lt,r13,@L6973
	addu	 r11,r11,4
@L6971:
	ld	 r13,r9,20
	subu	 r23,r0,1
	or.u	 r12,r0,hi16(@LC328)
	st.b	 r0,r13,r25
	or.u	 r13,r0,hi16(_is_idchar)
	ld.bu	 r11,r12,lo16(@LC328)
	or	 r10,r13,lo16(_is_idchar)
	or	 r22,r12,lo16(@LC328)
	ld.bu	 r13,r11,r10
	or	 r21,r0,25
	bcnd.n	 eq0,r13,@L6978
	or	 r11,r0,r22
	or	 r12,r0,r10
	addu	 r11,r11,1
@L7368:
	ld.bu	 r13,r0,r11
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L7368
	addu	 r11,r11,1
	subu	 r11,r11,1
@L6978:
	bcnd.n	 ge0,r23,@L6981
	subu	 r25,r11,r22
	or	 r2,r0,r22
	or	 r3,r0,r25
	bsr.n	 _hashf
	or	 r4,r0,1403
	or	 r23,r0,r2
@L6981:
	bsr.n	 _xmalloc
	addu	 r2,r25,29
	or.u	 r13,r0,hi16(_hashtab)
	or	 r13,r13,lo16(_hashtab)
	or	 r9,r0,r2
	lda	 r12,r13[r23]
	st	 r12,r9,8
	ld	 r12,r13[r23]
	st	 r12,r0,r9
	st	 r9,r13[r23]
	ld	 r13,r0,r9
	bcnd.n	 eq0,r13,@L6982
	st	 r0,r9,4
	st	 r9,r13,4
@L6982:
	st	 r21,r9,12
	st	 r25,r9,16
	st	 r0,r9,24
	addu	 r13,r9,28
	st	 r13,r9,20
	or	 r2,r0,r22
	or	 r12,r0,0
	bcnd.n	 le0,r25,@L6986
	or	 r11,r0,r13
	mask	 r10,r25,3
	bcnd.n	 eq0,r10,@L6988
	cmp	 r13,r10,1
	bb0.n	 gt,r13,@L7245
	cmp	 r13,r10,2
	bb0	 gt,r13,@L7246
	ld.bu	 r13,r0,r2
	st.b	 r13,r9,28
	addu	 r2,r2,1
	addu	 r11,r9,29
	or	 r12,r0,1
@L7246:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	addu	 r2,r2,1
	addu	 r11,r11,1
	addu	 r12,r12,1
@L7245:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	addu	 r12,r12,1
	addu	 r2,r2,1
	cmp	 r13,r12,r25
	bb0.n	 lt,r13,@L6986
	addu	 r11,r11,1
@L6988:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	ld.bu	 r13,r2,1
	st.b	 r13,r11,1
	ld.bu	 r13,r2,2
	st.b	 r13,r11,2
	ld.bu	 r13,r2,3
	addu	 r2,r2,4
	addu	 r12,r12,4
	st.b	 r13,r11,3
	cmp	 r13,r12,r25
	bb1.n	 lt,r13,@L6988
	addu	 r11,r11,4
@L6986:
	ld	 r13,r9,20
	subu	 r23,r0,1
	or.u	 r12,r0,hi16(@LC329)
	st.b	 r0,r13,r25
	or.u	 r13,r0,hi16(_is_idchar)
	ld.bu	 r11,r12,lo16(@LC329)
	or	 r10,r13,lo16(_is_idchar)
	or	 r22,r12,lo16(@LC329)
	ld.bu	 r13,r11,r10
	or	 r21,r0,26
	bcnd.n	 eq0,r13,@L6993
	or	 r11,r0,r22
	or	 r12,r0,r10
	addu	 r11,r11,1
@L7369:
	ld.bu	 r13,r0,r11
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L7369
	addu	 r11,r11,1
	subu	 r11,r11,1
@L6993:
	bcnd.n	 ge0,r23,@L6996
	subu	 r25,r11,r22
	or	 r2,r0,r22
	or	 r3,r0,r25
	bsr.n	 _hashf
	or	 r4,r0,1403
	or	 r23,r0,r2
@L6996:
	bsr.n	 _xmalloc
	addu	 r2,r25,29
	or.u	 r13,r0,hi16(_hashtab)
	or	 r13,r13,lo16(_hashtab)
	or	 r9,r0,r2
	lda	 r12,r13[r23]
	st	 r12,r9,8
	ld	 r12,r13[r23]
	st	 r12,r0,r9
	st	 r9,r13[r23]
	ld	 r13,r0,r9
	bcnd.n	 eq0,r13,@L6997
	st	 r0,r9,4
	st	 r9,r13,4
@L6997:
	st	 r21,r9,12
	st	 r25,r9,16
	st	 r0,r9,24
	addu	 r13,r9,28
	st	 r13,r9,20
	or	 r2,r0,r22
	or	 r12,r0,0
	bcnd.n	 le0,r25,@L7001
	or	 r11,r0,r13
	mask	 r10,r25,3
	bcnd.n	 eq0,r10,@L7003
	cmp	 r13,r10,1
	bb0.n	 gt,r13,@L7225
	cmp	 r13,r10,2
	bb0	 gt,r13,@L7226
	ld.bu	 r13,r0,r2
	st.b	 r13,r9,28
	addu	 r2,r2,1
	addu	 r11,r9,29
	or	 r12,r0,1
@L7226:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	addu	 r2,r2,1
	addu	 r11,r11,1
	addu	 r12,r12,1
@L7225:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	addu	 r12,r12,1
	addu	 r2,r2,1
	cmp	 r13,r12,r25
	bb0.n	 lt,r13,@L7001
	addu	 r11,r11,1
@L7003:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	ld.bu	 r13,r2,1
	st.b	 r13,r11,1
	ld.bu	 r13,r2,2
	st.b	 r13,r11,2
	ld.bu	 r13,r2,3
	addu	 r2,r2,4
	addu	 r12,r12,4
	st.b	 r13,r11,3
	cmp	 r13,r12,r25
	bb1.n	 lt,r13,@L7003
	addu	 r11,r11,4
@L7001:
	ld	 r13,r9,20
	subu	 r23,r0,1
	or.u	 r12,r0,hi16(@LC330)
	st.b	 r0,r13,r25
	or.u	 r13,r0,hi16(_is_idchar)
	ld.bu	 r11,r12,lo16(@LC330)
	or	 r10,r13,lo16(_is_idchar)
	or	 r22,r12,lo16(@LC330)
	ld.bu	 r13,r11,r10
	or	 r21,r0,27
	bcnd.n	 eq0,r13,@L7008
	or	 r11,r0,r22
	or	 r12,r0,r10
	addu	 r11,r11,1
@L7370:
	ld.bu	 r13,r0,r11
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L7370
	addu	 r11,r11,1
	subu	 r11,r11,1
@L7008:
	bcnd.n	 ge0,r23,@L7011
	subu	 r25,r11,r22
	or	 r2,r0,r22
	or	 r3,r0,r25
	bsr.n	 _hashf
	or	 r4,r0,1403
	or	 r23,r0,r2
@L7011:
	bsr.n	 _xmalloc
	addu	 r2,r25,29
	or.u	 r13,r0,hi16(_hashtab)
	or	 r13,r13,lo16(_hashtab)
	or	 r9,r0,r2
	lda	 r12,r13[r23]
	st	 r12,r9,8
	ld	 r12,r13[r23]
	st	 r12,r0,r9
	st	 r9,r13[r23]
	ld	 r13,r0,r9
	bcnd.n	 eq0,r13,@L7012
	st	 r0,r9,4
	st	 r9,r13,4
@L7012:
	st	 r21,r9,12
	st	 r25,r9,16
	st	 r0,r9,24
	addu	 r13,r9,28
	st	 r13,r9,20
	or	 r2,r0,r22
	or	 r12,r0,0
	bcnd.n	 le0,r25,@L7016
	or	 r11,r0,r13
	mask	 r10,r25,3
	bcnd.n	 eq0,r10,@L7018
	cmp	 r13,r10,1
	bb0.n	 gt,r13,@L7205
	cmp	 r13,r10,2
	bb0	 gt,r13,@L7206
	ld.bu	 r13,r0,r2
	st.b	 r13,r9,28
	addu	 r2,r2,1
	addu	 r11,r9,29
	or	 r12,r0,1
@L7206:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	addu	 r2,r2,1
	addu	 r11,r11,1
	addu	 r12,r12,1
@L7205:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	addu	 r12,r12,1
	addu	 r2,r2,1
	cmp	 r13,r12,r25
	bb0.n	 lt,r13,@L7016
	addu	 r11,r11,1
@L7018:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	ld.bu	 r13,r2,1
	st.b	 r13,r11,1
	ld.bu	 r13,r2,2
	st.b	 r13,r11,2
	ld.bu	 r13,r2,3
	addu	 r2,r2,4
	addu	 r12,r12,4
	st.b	 r13,r11,3
	cmp	 r13,r12,r25
	bb1.n	 lt,r13,@L7018
	addu	 r11,r11,4
@L7016:
	ld	 r13,r9,20
	subu	 r23,r0,1
	or.u	 r12,r0,hi16(@LC331)
	st.b	 r0,r13,r25
	or.u	 r13,r0,hi16(_is_idchar)
	ld.bu	 r11,r12,lo16(@LC331)
	or	 r10,r13,lo16(_is_idchar)
	or	 r22,r12,lo16(@LC331)
	ld.bu	 r13,r11,r10
	or	 r21,r0,28
	bcnd.n	 eq0,r13,@L7023
	or	 r11,r0,r22
	or	 r12,r0,r10
	addu	 r11,r11,1
@L7371:
	ld.bu	 r13,r0,r11
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L7371
	addu	 r11,r11,1
	subu	 r11,r11,1
@L7023:
	bcnd.n	 ge0,r23,@L7026
	subu	 r25,r11,r22
	or	 r2,r0,r22
	or	 r3,r0,r25
	bsr.n	 _hashf
	or	 r4,r0,1403
	or	 r23,r0,r2
@L7026:
	bsr.n	 _xmalloc
	addu	 r2,r25,29
	or.u	 r13,r0,hi16(_hashtab)
	or	 r13,r13,lo16(_hashtab)
	or	 r9,r0,r2
	lda	 r12,r13[r23]
	st	 r12,r9,8
	ld	 r12,r13[r23]
	st	 r12,r0,r9
	st	 r9,r13[r23]
	ld	 r13,r0,r9
	bcnd.n	 eq0,r13,@L7027
	st	 r0,r9,4
	st	 r9,r13,4
@L7027:
	st	 r21,r9,12
	st	 r25,r9,16
	st	 r0,r9,24
	addu	 r13,r9,28
	st	 r13,r9,20
	or	 r2,r0,r22
	or	 r12,r0,0
	bcnd.n	 le0,r25,@L7031
	or	 r11,r0,r13
	mask	 r10,r25,3
	bcnd.n	 eq0,r10,@L7033
	cmp	 r13,r10,1
	bb0.n	 gt,r13,@L7185
	cmp	 r13,r10,2
	bb0	 gt,r13,@L7186
	ld.bu	 r13,r0,r2
	st.b	 r13,r9,28
	addu	 r2,r2,1
	addu	 r11,r9,29
	or	 r12,r0,1
@L7186:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	addu	 r2,r2,1
	addu	 r11,r11,1
	addu	 r12,r12,1
@L7185:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	addu	 r12,r12,1
	addu	 r2,r2,1
	cmp	 r13,r12,r25
	bb0.n	 lt,r13,@L7031
	addu	 r11,r11,1
@L7033:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	ld.bu	 r13,r2,1
	st.b	 r13,r11,1
	ld.bu	 r13,r2,2
	st.b	 r13,r11,2
	ld.bu	 r13,r2,3
	addu	 r2,r2,4
	addu	 r12,r12,4
	st.b	 r13,r11,3
	cmp	 r13,r12,r25
	bb1.n	 lt,r13,@L7033
	addu	 r11,r11,4
@L7031:
	ld	 r13,r9,20
	subu	 r23,r0,1
	or.u	 r12,r0,hi16(@LC332)
	st.b	 r0,r13,r25
	or.u	 r13,r0,hi16(_is_idchar)
	ld.bu	 r11,r12,lo16(@LC332)
	or	 r10,r13,lo16(_is_idchar)
	or	 r22,r12,lo16(@LC332)
	ld.bu	 r13,r11,r10
	or	 r21,r0,29
	bcnd.n	 eq0,r13,@L7038
	or	 r11,r0,r22
	or	 r12,r0,r10
	addu	 r11,r11,1
@L7372:
	ld.bu	 r13,r0,r11
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L7372
	addu	 r11,r11,1
	subu	 r11,r11,1
@L7038:
	bcnd.n	 ge0,r23,@L7041
	subu	 r25,r11,r22
	or	 r2,r0,r22
	or	 r3,r0,r25
	bsr.n	 _hashf
	or	 r4,r0,1403
	or	 r23,r0,r2
@L7041:
	bsr.n	 _xmalloc
	addu	 r2,r25,29
	or.u	 r13,r0,hi16(_hashtab)
	or	 r13,r13,lo16(_hashtab)
	or	 r9,r0,r2
	lda	 r12,r13[r23]
	st	 r12,r9,8
	ld	 r12,r13[r23]
	st	 r12,r0,r9
	st	 r9,r13[r23]
	ld	 r13,r0,r9
	bcnd.n	 eq0,r13,@L7042
	st	 r0,r9,4
	st	 r9,r13,4
@L7042:
	st	 r21,r9,12
	st	 r25,r9,16
	st	 r0,r9,24
	addu	 r13,r9,28
	st	 r13,r9,20
	or	 r2,r0,r22
	or	 r12,r0,0
	bcnd.n	 le0,r25,@L7046
	or	 r11,r0,r13
	mask	 r10,r25,3
	bcnd.n	 eq0,r10,@L7048
	cmp	 r13,r10,1
	bb0.n	 gt,r13,@L7165
	cmp	 r13,r10,2
	bb0	 gt,r13,@L7166
	ld.bu	 r13,r0,r2
	st.b	 r13,r9,28
	addu	 r2,r2,1
	addu	 r11,r9,29
	or	 r12,r0,1
@L7166:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	addu	 r2,r2,1
	addu	 r11,r11,1
	addu	 r12,r12,1
@L7165:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	addu	 r12,r12,1
	addu	 r2,r2,1
	cmp	 r13,r12,r25
	bb0.n	 lt,r13,@L7046
	addu	 r11,r11,1
@L7048:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r11
	ld.bu	 r13,r2,1
	st.b	 r13,r11,1
	ld.bu	 r13,r2,2
	st.b	 r13,r11,2
	ld.bu	 r13,r2,3
	addu	 r2,r2,4
	addu	 r12,r12,4
	st.b	 r13,r11,3
	cmp	 r13,r12,r25
	bb1.n	 lt,r13,@L7048
	addu	 r11,r11,4
@L7046:
	ld	 r13,r9,20
	st.b	 r0,r13,r25
	or.u	 r13,r0,hi16(_traditional)
	ld	 r13,r13,lo16(_traditional)
	bcnd.n	 ne0,r13,@L7373
	or.u	 r13,r0,hi16(_objc)
	or.u	 r12,r0,hi16(@LC333)
	subu	 r23,r0,1
	or.u	 r13,r0,hi16(_is_idchar)
	ld.bu	 r11,r12,lo16(@LC333)
	or	 r22,r12,lo16(@LC333)
	or	 r12,r13,lo16(_is_idchar)
	or	 r21,r0,30
	ld.bu	 r13,r11,r12
	or	 r20,r0,1
	bcnd.n	 eq0,r13,@L7054
	or	 r10,r0,r22
	addu	 r10,r10,1
@L7374:
	ld.bu	 r13,r0,r10
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L7374
	addu	 r10,r10,1
	subu	 r10,r10,1
@L7054:
	bcnd.n	 ge0,r23,@L7057
	subu	 r25,r10,r22
	or	 r2,r0,r22
	or	 r3,r0,r25
	bsr.n	 _hashf
	or	 r4,r0,1403
	or	 r23,r0,r2
@L7057:
	bsr.n	 _xmalloc
	addu	 r2,r25,29
	or.u	 r13,r0,hi16(_hashtab)
	or	 r13,r13,lo16(_hashtab)
	or	 r9,r0,r2
	lda	 r12,r13[r23]
	st	 r12,r9,8
	ld	 r12,r13[r23]
	st	 r12,r0,r9
	st	 r9,r13[r23]
	ld	 r13,r0,r9
	bcnd.n	 eq0,r13,@L7058
	st	 r0,r9,4
	st	 r9,r13,4
@L7058:
	st	 r21,r9,12
	ld	 r13,r9,12
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L7059
	st	 r25,r9,16
	br.n	 @L7060
	st	 r20,r9,24
	align	 4
@L7059:
	st	 r0,r9,24
@L7060:
	addu	 r13,r9,28
	st	 r13,r9,20
	or	 r2,r0,r22
	or	 r12,r0,0
	bcnd.n	 le0,r25,@L7062
	or	 r10,r0,r13
	mask	 r11,r25,3
	bcnd.n	 eq0,r11,@L7064
	cmp	 r13,r11,1
	bb0.n	 gt,r13,@L7145
	cmp	 r13,r11,2
	bb0	 gt,r13,@L7146
	ld.bu	 r13,r0,r2
	st.b	 r13,r9,28
	addu	 r2,r2,1
	addu	 r10,r9,29
	or	 r12,r0,1
@L7146:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r10
	addu	 r2,r2,1
	addu	 r10,r10,1
	addu	 r12,r12,1
@L7145:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r10
	addu	 r12,r12,1
	addu	 r2,r2,1
	cmp	 r13,r12,r25
	bb0.n	 lt,r13,@L7062
	addu	 r10,r10,1
@L7064:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r10
	ld.bu	 r13,r2,1
	st.b	 r13,r10,1
	ld.bu	 r13,r2,2
	st.b	 r13,r10,2
	ld.bu	 r13,r2,3
	addu	 r2,r2,4
	addu	 r12,r12,4
	st.b	 r13,r10,3
	cmp	 r13,r12,r25
	bb1.n	 lt,r13,@L7064
	addu	 r10,r10,4
@L7062:
	ld	 r13,r9,20
	st.b	 r0,r13,r25
	or.u	 r13,r0,hi16(_objc)
@L7373:
	ld	 r13,r13,lo16(_objc)
	bcnd	 eq0,r13,@L7066
	or.u	 r12,r0,hi16(@LC334)
	subu	 r23,r0,1
	or.u	 r13,r0,hi16(_is_idchar)
	ld.bu	 r11,r12,lo16(@LC334)
	or	 r22,r12,lo16(@LC334)
	or	 r12,r13,lo16(_is_idchar)
	or	 r21,r0,30
	ld.bu	 r13,r11,r12
	or	 r20,r0,1
	bcnd.n	 eq0,r13,@L7070
	or	 r10,r0,r22
	addu	 r10,r10,1
@L7375:
	ld.bu	 r13,r0,r10
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L7375
	addu	 r10,r10,1
	subu	 r10,r10,1
@L7070:
	bcnd.n	 ge0,r23,@L7073
	subu	 r25,r10,r22
	or	 r2,r0,r22
	or	 r3,r0,r25
	bsr.n	 _hashf
	or	 r4,r0,1403
	or	 r23,r0,r2
@L7073:
	bsr.n	 _xmalloc
	addu	 r2,r25,29
	or.u	 r13,r0,hi16(_hashtab)
	or	 r13,r13,lo16(_hashtab)
	or	 r9,r0,r2
	lda	 r12,r13[r23]
	st	 r12,r9,8
	ld	 r12,r13[r23]
	st	 r12,r0,r9
	st	 r9,r13[r23]
	ld	 r13,r0,r9
	bcnd.n	 eq0,r13,@L7074
	st	 r0,r9,4
	st	 r9,r13,4
@L7074:
	st	 r21,r9,12
	ld	 r13,r9,12
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L7075
	st	 r25,r9,16
	br.n	 @L7076
	st	 r20,r9,24
	align	 4
@L7075:
	st	 r0,r9,24
@L7076:
	addu	 r13,r9,28
	st	 r13,r9,20
	or	 r2,r0,r22
	or	 r12,r0,0
	bcnd.n	 le0,r25,@L7078
	or	 r10,r0,r13
	mask	 r11,r25,3
	bcnd.n	 eq0,r11,@L7080
	cmp	 r13,r11,1
	bb0.n	 gt,r13,@L7125
	cmp	 r13,r11,2
	bb0	 gt,r13,@L7126
	ld.bu	 r13,r0,r2
	st.b	 r13,r9,28
	addu	 r2,r2,1
	addu	 r10,r9,29
	or	 r12,r0,1
@L7126:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r10
	addu	 r2,r2,1
	addu	 r10,r10,1
	addu	 r12,r12,1
@L7125:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r10
	addu	 r12,r12,1
	addu	 r2,r2,1
	cmp	 r13,r12,r25
	bb0.n	 lt,r13,@L7078
	addu	 r10,r10,1
@L7080:
	ld.bu	 r13,r0,r2
	st.b	 r13,r0,r10
	ld.bu	 r13,r2,1
	st.b	 r13,r10,1
	ld.bu	 r13,r2,2
	st.b	 r13,r10,2
	ld.bu	 r13,r2,3
	addu	 r2,r2,4
	addu	 r12,r12,4
	st.b	 r13,r10,3
	cmp	 r13,r12,r25
	bb1.n	 lt,r13,@L7080
	addu	 r10,r10,4
@L7078:
	ld	 r13,r9,20
	st.b	 r0,r13,r25
@L7066:
	or.u	 r13,r0,hi16(_debug_output)
	ld	 r13,r13,lo16(_debug_output)
	bcnd.n	 eq0,r13,@L7082
	or.u	 r25,r0,hi16(_timebuf.21)
	or.u	 r23,r0,hi16(_directive_table)
	ld	 r13,r25,lo16(_timebuf.21)
	bcnd.n	 ne0,r13,@L7084
	or	 r21,r23,lo16(_directive_table)
	bsr.n	 _time
	or	 r2,r0,0
	st	 r2,r31,2120
	bsr.n	 _localtime
	addu	 r2,r31,2120
	st	 r2,r25,lo16(_timebuf.21)
@L7084:
	addu	 r2,r31,72
	or.u	 r13,r0,hi16(_instack+4)
	or.u	 r3,r0,hi16(@LC335)
	ld	 r4,r13,lo16(_instack+4)
	or	 r3,r3,lo16(@LC335)
	bsr.n	 _sprintf
	ld	 r20,r25,lo16(_timebuf.21)
	or	 r2,r0,r19
	or	 r3,r0,r24
	or	 r4,r0,0
	bsr.n	 _output_line_command
	or	 r5,r0,0
	bsr.n	 _strlen
	addu	 r2,r31,72
	ld	 r25,r23,lo16(_directive_table)
	ld	 r13,r24,24
	ld	 r11,r24,20
	ld	 r12,r24,16
	subu	 r13,r13,r11
	addu	 r11,r2,1
	subu	 r12,r12,r13
	addu	 r3,r25,r11
	addu	 r23,r31,72
	cmp	 r12,r12,r3
	bb0.n	 ls,r12,@L7087
	addu	 r22,r23,r2
	bsr.n	 _grow_outbuf
	or	 r2,r0,r24
@L7087:
	ld	 r12,r24,24
	addu	 r13,r12,1
	st	 r13,r24,24
	or	 r13,r0,35
	st.b	 r13,r0,r12
	ld	 r2,r21,8
	ld	 r3,r24,24
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r24,24
	addu	 r4,r13,r25
	cmp	 r13,r22,r23
	bb0.n	 ne,r13,@L7088
	st	 r4,r24,24
	ld.bu	 r13,r31,72
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L7088
	addu	 r13,r4,1
	st	 r13,r24,24
	or	 r13,r0,32
	st.b	 r13,r0,r4
@L7088:
	ld	 r3,r24,24
	subu	 r25,r22,r23
	or	 r2,r0,r23
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r24,24
	addu	 r2,r31,72
	or.u	 r12,r0,hi16(_version_string)
	or.u	 r3,r0,hi16(@LC336)
	ld	 r4,r12,lo16(_version_string)
	or	 r3,r3,lo16(@LC336)
	addu	 r13,r13,r25
	bsr.n	 _sprintf
	st	 r13,r24,24
	or	 r2,r0,r19
	or	 r3,r0,r24
	or	 r4,r0,0
	bsr.n	 _output_line_command
	or	 r5,r0,0
	bsr.n	 _strlen
	addu	 r2,r31,72
	ld	 r25,r0,r21
	ld	 r13,r24,24
	ld	 r11,r24,20
	ld	 r12,r24,16
	subu	 r13,r13,r11
	addu	 r11,r2,1
	subu	 r12,r12,r13
	addu	 r3,r25,r11
	addu	 r23,r31,72
	cmp	 r12,r12,r3
	bb0.n	 ls,r12,@L7091
	addu	 r22,r23,r2
	bsr.n	 _grow_outbuf
	or	 r2,r0,r24
@L7091:
	ld	 r12,r24,24
	addu	 r13,r12,1
	st	 r13,r24,24
	or	 r13,r0,35
	st.b	 r13,r0,r12
	ld	 r2,r21,8
	ld	 r3,r24,24
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r24,24
	addu	 r4,r13,r25
	cmp	 r13,r22,r23
	bb0.n	 ne,r13,@L7092
	st	 r4,r24,24
	ld.bu	 r13,r31,72
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L7092
	addu	 r13,r4,1
	st	 r13,r24,24
	or	 r13,r0,32
	st.b	 r13,r0,r4
@L7092:
	ld	 r3,r24,24
	subu	 r25,r22,r23
	or	 r2,r0,r23
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r24,24
	addu	 r2,r31,72
	or.u	 r3,r0,hi16(@LC337)
	or.u	 r4,r0,hi16(@LC338)
	or	 r3,r3,lo16(@LC337)
	or	 r4,r4,lo16(@LC338)
	addu	 r13,r13,r25
	bsr.n	 _sprintf
	st	 r13,r24,24
	or	 r2,r0,r19
	or	 r3,r0,r24
	or	 r4,r0,0
	bsr.n	 _output_line_command
	or	 r5,r0,0
	bsr.n	 _strlen
	addu	 r2,r31,72
	ld	 r25,r0,r21
	ld	 r13,r24,24
	ld	 r11,r24,20
	ld	 r12,r24,16
	subu	 r13,r13,r11
	addu	 r11,r2,1
	subu	 r12,r12,r13
	addu	 r3,r25,r11
	addu	 r23,r31,72
	cmp	 r12,r12,r3
	bb0.n	 ls,r12,@L7095
	addu	 r22,r23,r2
	bsr.n	 _grow_outbuf
	or	 r2,r0,r24
@L7095:
	ld	 r12,r24,24
	addu	 r13,r12,1
	st	 r13,r24,24
	or	 r13,r0,35
	st.b	 r13,r0,r12
	ld	 r2,r21,8
	ld	 r3,r24,24
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r24,24
	addu	 r4,r13,r25
	cmp	 r13,r22,r23
	bb0.n	 ne,r13,@L7096
	st	 r4,r24,24
	ld.bu	 r13,r31,72
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L7096
	addu	 r13,r4,1
	st	 r13,r24,24
	or	 r13,r0,32
	st.b	 r13,r0,r4
@L7096:
	ld	 r3,r24,24
	subu	 r25,r22,r23
	or	 r2,r0,r23
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r24,24
	addu	 r2,r31,72
	or.u	 r3,r0,hi16(@LC339)
	or.u	 r4,r0,hi16(@LC340)
	or	 r3,r3,lo16(@LC339)
	or	 r4,r4,lo16(@LC340)
	addu	 r13,r13,r25
	bsr.n	 _sprintf
	st	 r13,r24,24
	or	 r2,r0,r19
	or	 r3,r0,r24
	or	 r4,r0,0
	bsr.n	 _output_line_command
	or	 r5,r0,0
	bsr.n	 _strlen
	addu	 r2,r31,72
	ld	 r25,r0,r21
	ld	 r13,r24,24
	ld	 r11,r24,20
	ld	 r12,r24,16
	subu	 r13,r13,r11
	addu	 r11,r2,1
	subu	 r12,r12,r13
	addu	 r3,r25,r11
	addu	 r23,r31,72
	cmp	 r12,r12,r3
	bb0.n	 ls,r12,@L7099
	addu	 r22,r23,r2
	bsr.n	 _grow_outbuf
	or	 r2,r0,r24
@L7099:
	ld	 r12,r24,24
	addu	 r13,r12,1
	st	 r13,r24,24
	or	 r13,r0,35
	st.b	 r13,r0,r12
	ld	 r2,r21,8
	ld	 r3,r24,24
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r24,24
	addu	 r4,r13,r25
	cmp	 r13,r22,r23
	bb0.n	 ne,r13,@L7100
	st	 r4,r24,24
	ld.bu	 r13,r31,72
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L7100
	addu	 r13,r4,1
	st	 r13,r24,24
	or	 r13,r0,32
	st.b	 r13,r0,r4
@L7100:
	ld	 r3,r24,24
	subu	 r25,r22,r23
	or	 r2,r0,r23
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r24,24
	addu	 r2,r31,72
	or.u	 r3,r0,hi16(@LC341)
	or.u	 r4,r0,hi16(@LC342)
	or	 r3,r3,lo16(@LC341)
	or	 r4,r4,lo16(@LC342)
	addu	 r13,r13,r25
	bsr.n	 _sprintf
	st	 r13,r24,24
	or	 r2,r0,r19
	or	 r3,r0,r24
	or	 r4,r0,0
	bsr.n	 _output_line_command
	or	 r5,r0,0
	bsr.n	 _strlen
	addu	 r2,r31,72
	ld	 r25,r0,r21
	ld	 r13,r24,24
	ld	 r11,r24,20
	ld	 r12,r24,16
	subu	 r13,r13,r11
	addu	 r11,r2,1
	subu	 r12,r12,r13
	addu	 r3,r25,r11
	addu	 r23,r31,72
	cmp	 r12,r12,r3
	bb0.n	 ls,r12,@L7103
	addu	 r22,r23,r2
	bsr.n	 _grow_outbuf
	or	 r2,r0,r24
@L7103:
	ld	 r12,r24,24
	addu	 r13,r12,1
	st	 r13,r24,24
	or	 r13,r0,35
	st.b	 r13,r0,r12
	ld	 r2,r21,8
	ld	 r3,r24,24
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r24,24
	addu	 r4,r13,r25
	cmp	 r13,r22,r23
	bb0.n	 ne,r13,@L7104
	st	 r4,r24,24
	ld.bu	 r13,r31,72
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L7104
	addu	 r13,r4,1
	st	 r13,r24,24
	or	 r13,r0,32
	st.b	 r13,r0,r4
@L7104:
	ld	 r3,r24,24
	subu	 r25,r22,r23
	or	 r2,r0,r23
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r24,24
	addu	 r13,r13,r25
	st	 r13,r24,24
	addu	 r2,r31,72
	ld	 r5,r20,12
	or.u	 r3,r0,hi16(@LC343)
	ld	 r12,r20,16
	or.u	 r13,r0,hi16(_monthnames)
	ld	 r6,r20,20
	or	 r13,r13,lo16(_monthnames)
	or	 r3,r3,lo16(@LC343)
	ld	 r4,r13[r12]
	bsr.n	 _sprintf
	addu	 r6,r6,1900
	or	 r2,r0,r19
	or	 r3,r0,r24
	or	 r4,r0,0
	bsr.n	 _output_line_command
	or	 r5,r0,0
	bsr.n	 _strlen
	addu	 r2,r31,72
	ld	 r25,r0,r21
	ld	 r13,r24,24
	ld	 r11,r24,20
	ld	 r12,r24,16
	subu	 r13,r13,r11
	addu	 r11,r2,1
	subu	 r12,r12,r13
	addu	 r3,r25,r11
	addu	 r23,r31,72
	cmp	 r12,r12,r3
	bb0.n	 ls,r12,@L7107
	addu	 r22,r23,r2
	bsr.n	 _grow_outbuf
	or	 r2,r0,r24
@L7107:
	ld	 r12,r24,24
	addu	 r13,r12,1
	st	 r13,r24,24
	or	 r13,r0,35
	st.b	 r13,r0,r12
	ld	 r2,r21,8
	ld	 r3,r24,24
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r24,24
	addu	 r4,r13,r25
	cmp	 r13,r22,r23
	bb0.n	 ne,r13,@L7108
	st	 r4,r24,24
	ld.bu	 r13,r31,72
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L7108
	addu	 r13,r4,1
	st	 r13,r24,24
	or	 r13,r0,32
	st.b	 r13,r0,r4
@L7108:
	ld	 r3,r24,24
	subu	 r25,r22,r23
	or	 r2,r0,r23
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r24,24
	addu	 r13,r13,r25
	st	 r13,r24,24
	ld	 r4,r20,8
	addu	 r2,r31,72
	ld	 r5,r20,4
	or.u	 r3,r0,hi16(@LC344)
	ld	 r6,r0,r20
	bsr.n	 _sprintf
	or	 r3,r3,lo16(@LC344)
	or	 r2,r0,r19
	or	 r3,r0,r24
	or	 r4,r0,0
	bsr.n	 _output_line_command
	or	 r5,r0,0
	bsr.n	 _strlen
	addu	 r2,r31,72
	ld	 r25,r0,r21
	ld	 r13,r24,24
	ld	 r11,r24,20
	ld	 r12,r24,16
	subu	 r13,r13,r11
	addu	 r11,r2,1
	subu	 r12,r12,r13
	addu	 r3,r25,r11
	addu	 r23,r31,72
	cmp	 r12,r12,r3
	bb0.n	 ls,r12,@L7111
	addu	 r22,r23,r2
	bsr.n	 _grow_outbuf
	or	 r2,r0,r24
@L7111:
	ld	 r12,r24,24
	addu	 r13,r12,1
	st	 r13,r24,24
	or	 r13,r0,35
	st.b	 r13,r0,r12
	ld	 r2,r21,8
	ld	 r3,r24,24
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r24,24
	addu	 r4,r13,r25
	cmp	 r13,r22,r23
	bb0.n	 ne,r13,@L7112
	st	 r4,r24,24
	ld.bu	 r13,r31,72
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L7112
	addu	 r13,r4,1
	st	 r13,r24,24
	or	 r13,r0,32
	st.b	 r13,r0,r4
@L7112:
	or	 r2,r0,r23
	subu	 r25,r22,r2
	ld	 r3,r24,24
	bsr.n	 _bcopy
	or	 r4,r0,r25
	or.u	 r12,r0,hi16(_traditional)
	ld	 r13,r24,24
	ld	 r12,r12,lo16(_traditional)
	addu	 r13,r13,r25
	bcnd.n	 ne0,r12,@L7113
	st	 r13,r24,24
	or.u	 r3,r0,hi16(@LC345)
	addu	 r2,r31,72
	bsr.n	 _sprintf
	or	 r3,r3,lo16(@LC345)
	or	 r2,r0,r19
	or	 r3,r0,r24
	or	 r4,r0,0
	bsr.n	 _output_line_command
	or	 r5,r0,0
	bsr.n	 _strlen
	addu	 r2,r31,72
	ld	 r25,r0,r21
	ld	 r13,r24,24
	ld	 r11,r24,20
	ld	 r12,r24,16
	subu	 r13,r13,r11
	addu	 r11,r2,1
	subu	 r12,r12,r13
	addu	 r3,r25,r11
	addu	 r23,r31,72
	cmp	 r12,r12,r3
	bb0.n	 ls,r12,@L7116
	addu	 r22,r23,r2
	bsr.n	 _grow_outbuf
	or	 r2,r0,r24
@L7116:
	ld	 r12,r24,24
	addu	 r13,r12,1
	st	 r13,r24,24
	or	 r13,r0,35
	st.b	 r13,r0,r12
	ld	 r2,r21,8
	ld	 r3,r24,24
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r24,24
	addu	 r4,r13,r25
	cmp	 r13,r22,r23
	bb0.n	 ne,r13,@L7117
	st	 r4,r24,24
	ld.bu	 r13,r31,72
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L7117
	addu	 r13,r4,1
	st	 r13,r24,24
	or	 r13,r0,32
	st.b	 r13,r0,r4
@L7117:
	or	 r2,r0,r23
	subu	 r25,r22,r2
	ld	 r3,r24,24
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r24,24
	addu	 r13,r13,r25
	st	 r13,r24,24
@L7113:
	or.u	 r13,r0,hi16(_objc)
	ld	 r13,r13,lo16(_objc)
	bcnd.n	 eq0,r13,@L7082
	or.u	 r3,r0,hi16(@LC346)
	addu	 r2,r31,72
	bsr.n	 _sprintf
	or	 r3,r3,lo16(@LC346)
	or	 r2,r0,r19
	or	 r3,r0,r24
	or	 r4,r0,0
	bsr.n	 _output_line_command
	or	 r5,r0,0
	bsr.n	 _strlen
	addu	 r2,r31,72
	ld	 r25,r0,r21
	ld	 r13,r24,24
	ld	 r11,r24,20
	ld	 r12,r24,16
	subu	 r13,r13,r11
	addu	 r11,r2,1
	subu	 r12,r12,r13
	addu	 r3,r25,r11
	addu	 r23,r31,72
	cmp	 r12,r12,r3
	bb0.n	 ls,r12,@L7121
	addu	 r22,r23,r2
	bsr.n	 _grow_outbuf
	or	 r2,r0,r24
@L7121:
	ld	 r12,r24,24
	addu	 r13,r12,1
	st	 r13,r24,24
	or	 r13,r0,35
	st.b	 r13,r0,r12
	ld	 r2,r21,8
	ld	 r3,r24,24
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r24,24
	addu	 r4,r13,r25
	cmp	 r13,r22,r23
	bb0.n	 ne,r13,@L7122
	st	 r4,r24,24
	ld.bu	 r13,r31,72
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L7122
	addu	 r13,r4,1
	st	 r13,r24,24
	or	 r13,r0,32
	st.b	 r13,r0,r4
@L7122:
	or	 r2,r0,r23
	subu	 r25,r22,r2
	ld	 r3,r24,24
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r24,24
	addu	 r13,r13,r25
	st	 r13,r24,24
@L7082:
@Lte75:
	ld	 r1,r31,64
	ld	 r19,r31,36
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,2128

data
	align	 8
@LC347:
	string	 "malformed option `-D %s'\000"
	align	 8
@LC348:
	string	 " 1\000"
	align	 8
@LC349:
	string	 "malformed option `-D %s'\000"
	align	 8
@LC350:
	string	 "*Initialization*\000"
text
	align	 8
_make_definition:
	subu	 r31,r31,80
	st	 r1,r31,68
	st	 r30,r31,64
	st	 r21,r31,44
	st.d	 r22,r31,48
	or	 r22,r0,r2
	st.d	 r24,r31,56
	or	 r23,r0,r22
	or.u	 r13,r0,hi16(_is_idstart)
	ld.bu	 r12,r0,r23
	or	 r13,r13,lo16(_is_idstart)
	ld.bu	 r13,r12,r13
	addu	 r30,r31,64
@Ltb76:
	bcnd.n	 ne0,r13,@L7377
	or	 r21,r0,r3
	or.u	 r2,r0,hi16(@LC347)
	or	 r3,r0,r23
	or	 r2,r2,lo16(@LC347)
	bsr.n	 _error
	addu	 r1,r1,@L7406
@L7407:
	align	 4
@L7377:
	or.u	 r13,r0,hi16(_is_idchar)
	ld.bu	 r12,r23,1
	or	 r11,r13,lo16(_is_idchar)
	ld.bu	 r13,r12,r11
	bcnd.n	 eq0,r13,@L7379
	addu	 r24,r23,1
	or	 r12,r0,r11
	addu	 r24,r24,1
@L7404:
	ld.bu	 r13,r0,r24
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L7404
	addu	 r24,r24,1
	subu	 r24,r24,1
@L7379:
	ld.bu	 r13,r0,r24
	bcnd.n	 ne0,r13,@L7382
	cmp	 r13,r13,61
	subu	 r13,r24,r23
	addu	 r13,r13,19
	and	 r13,r13,0xfff0
	subu	 r31,r31,r13
	addu	 r23,r31,32
	or	 r3,r0,r22
	bsr.n	 _strcpy
	or	 r2,r0,r23
	or.u	 r3,r0,hi16(@LC348)
	or	 r2,r0,r23
	or	 r3,r3,lo16(@LC348)
	bsr.n	 _strcat
	addu	 r1,r1,@L7408
@L7409:
	align	 4
@L7382:
	bb0.n	 ne,r13,@L7384
	or.u	 r2,r0,hi16(@LC349)
	or	 r3,r0,r22
	or	 r2,r2,lo16(@LC349)
	bsr.n	 _error
	addu	 r1,r1,@L7410
@L7411:
	align	 4
@L7384:
	bsr.n	 _strlen
	or	 r2,r0,r22
	mak	 r2,r2,0<1>
	addu	 r2,r2,16
	and	 r2,r2,0xfff0
	or	 r3,r0,r22
	subu	 r31,r31,r2
	subu	 r25,r24,r22
	addu	 r23,r31,32
	or	 r4,r0,r25
	or	 r2,r0,r23
	bsr.n	 _strncpy
	addu	 r24,r24,1
	or	 r13,r0,32
	st.b	 r13,r23,r25
	ld.bu	 r10,r0,r24
	subu	 r13,r24,r22
	mask	 r12,r10,0xff
	bcnd.n	 eq0,r12,@L7387
	addu	 r11,r23,r13
	or	 r9,r0,10
	mask	 r13,r10,0xff
	cmp	 r13,r13,92
@L7405:
	bb1	 ne,r13,@L7389
	ld.bu	 r13,r24,1
	cmp	 r13,r13,10
	bb1	 ne,r13,@L7389
	addu	 r24,r24,2
	br	 @L7386
	align	 4
@L7389:
	ld.bu	 r12,r0,r24
	mask	 r13,r12,0xff
	cmp	 r13,r13,10
	bb1	 ne,r13,@L7391
	st.b	 r9,r0,r11
	addu	 r11,r11,1
	addu	 r24,r24,1
	br.n	 @L7402
	st.b	 r9,r0,r11
	align	 4
@L7391:
	st.b	 r12,r0,r11
	addu	 r24,r24,1
@L7402:
	addu	 r11,r11,1
@L7386:
	ld.bu	 r10,r0,r24
	mask	 r13,r10,0xff
	bcnd.n	 ne0,r13,@L7405
	cmp	 r13,r13,92
@L7387:
	st.b	 r0,r0,r11
@L7383:
	or.u	 r11,r0,hi16(_indepth)
	ld	 r13,r11,lo16(_indepth)
	addu	 r13,r13,1
	or.u	 r12,r0,hi16(_instack)
	mul	 r25,r13,44
	or	 r12,r12,lo16(_instack)
	st	 r13,r11,lo16(_indepth)
	or.u	 r13,r0,hi16(@LC350)
	addu	 r25,r25,r12
	or	 r13,r13,lo16(@LC350)
	st	 r13,r0,r25
	st	 r13,r25,4
	st	 r23,r25,24
	or	 r2,r0,r23
	bsr.n	 _strlen
	st	 r23,r25,20
	or.u	 r13,r0,hi16(_if_stack)
	ld	 r12,r13,lo16(_if_stack)
	st	 r2,r25,16
	st	 r0,r25,28
	st	 r0,r25,36
	or	 r13,r0,1
	st	 r13,r25,12
	st	 r12,r25,32
	or.u	 r13,r0,hi16(_directive_table)
	st.b	 r0,r25,40
	or	 r24,r13,lo16(_directive_table)
@L7403:
	ld	 r13,r24,12
	cmp	 r13,r13,1
	bb1.n	 ne,r13,@L7403
	addu	 r24,r24,20
	subu	 r24,r24,20
	bsr.n	 _strlen
	or	 r2,r0,r23
	addu	 r3,r23,r2
	or	 r2,r0,r23
	or	 r4,r0,r21
	bsr.n	 _do_define
	or	 r5,r0,r24
	or.u	 r12,r0,hi16(_indepth)
	ld	 r13,r12,lo16(_indepth)
	subu	 r13,r13,1
	st	 r13,r12,lo16(_indepth)
@L7376:
@Lte76:
	subu	 r31,r30,64
	ld	 r1,r31,68
	ld	 r30,r31,64
	ld	 r21,r31,44
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	jmp.n	 r1
	addu	 r31,r31,80
	def	 @L7410,@L7376-@L7411
	def	 @L7408,@L7383-@L7409
	def	 @L7406,@L7376-@L7407

data
	align	 8
@LC351:
	string	 "*undef*\000"
text
	align	 8
_make_undef:
	or.u	 r11,r0,hi16(_indepth)
	ld	 r13,r11,lo16(_indepth)
	subu	 r31,r31,96
	st	 r1,r31,80
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	or.u	 r12,r0,hi16(_instack)
	st.d	 r20,r31,56
	addu	 r13,r13,1
	st.d	 r18,r31,48
	mul	 r25,r13,44
	st.d	 r16,r31,40
@Ltb77:
	or	 r12,r12,lo16(_instack)
	st	 r13,r11,lo16(_indepth)
	or.u	 r13,r0,hi16(@LC351)
	addu	 r25,r25,r12
	or	 r13,r13,lo16(@LC351)
	st	 r13,r0,r25
	or	 r23,r0,r2
	st	 r13,r25,4
	or	 r24,r0,r3
	st	 r23,r25,24
	bsr.n	 _strlen
	st	 r23,r25,20
	or.u	 r13,r0,hi16(_if_stack)
	ld	 r12,r13,lo16(_if_stack)
	st	 r2,r25,16
	st	 r0,r25,28
	st	 r0,r25,36
	or	 r13,r0,1
	st	 r13,r25,12
	st	 r12,r25,32
	or.u	 r13,r0,hi16(_directive_table)
	st.b	 r0,r25,40
	or	 r21,r13,lo16(_directive_table)
@L7493:
	ld	 r13,r21,12
	cmp	 r13,r13,11
	bb1.n	 ne,r13,@L7493
	addu	 r21,r21,20
	subu	 r21,r21,20
	bsr.n	 _strlen
	or	 r2,r0,r23
	or.u	 r13,r0,hi16(_pcp_outfile)
	ld	 r13,r13,lo16(_pcp_outfile)
	cmp	 r12,r24,0
	cmp	 r13,r13,0
	or	 r13,r13,r12
	addu	 r18,r23,r2
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L7458
	or	 r20,r0,r23
	ld	 r11,r24,24
	ld	 r13,r24,20
	ld	 r12,r24,16
	subu	 r11,r11,r13
	subu	 r13,r18,r23
	ld	 r25,r0,r21
	addu	 r13,r13,1
	subu	 r12,r12,r11
	addu	 r3,r25,r13
	cmp	 r12,r12,r3
	bb0	 ls,r12,@L7461
	bsr.n	 _grow_outbuf
	or	 r2,r0,r24
@L7461:
	ld	 r12,r24,24
	addu	 r13,r12,1
	st	 r13,r24,24
	or	 r13,r0,35
	st.b	 r13,r0,r12
	ld	 r2,r21,8
	ld	 r3,r24,24
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r24,24
	addu	 r4,r13,r25
	cmp	 r13,r18,r23
	bb0.n	 ne,r13,@L7462
	st	 r4,r24,24
	ld.bu	 r13,r0,r23
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L7462
	addu	 r13,r4,1
	st	 r13,r24,24
	or	 r13,r0,32
	st.b	 r13,r0,r4
@L7462:
	or	 r2,r0,r23
	subu	 r25,r18,r23
	ld	 r3,r24,24
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r24,24
	addu	 r13,r13,r25
	st	 r13,r24,24
@L7458:
	or.u	 r13,r0,hi16(_is_hor_space)
	ld.bu	 r12,r0,r23
	or	 r11,r13,lo16(_is_hor_space)
	ld.bu	 r13,r12,r11
	bcnd.n	 eq0,r13,@L7464
	or	 r12,r0,r11
	addu	 r23,r23,1
@L7494:
	ld.bu	 r13,r0,r23
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L7494
	addu	 r23,r23,1
	subu	 r23,r23,1
@L7464:
	or	 r2,r0,r23
	or.u	 r3,r0,hi16(@LC243)
	subu	 r19,r18,r20
	or	 r3,r3,lo16(@LC243)
	bsr.n	 _check_macro_name
	addu	 r16,r19,1
	or	 r17,r0,r2
@L7471:
	or	 r2,r0,r23
	or	 r3,r0,r17
	bsr.n	 _lookup
	subu	 r4,r0,1
	or	 r22,r0,r2
	bcnd.n	 eq0,r22,@L7472
	or.u	 r13,r0,hi16(_debug_output)
	ld	 r13,r13,lo16(_debug_output)
	cmp	 r12,r24,0
	cmp	 r13,r13,0
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd	 eq0,r13,@L7474
	ld	 r13,r24,24
	ld	 r11,r24,20
	ld	 r25,r0,r21
	ld	 r12,r24,16
	subu	 r13,r13,r11
	addu	 r3,r25,r16
	subu	 r12,r12,r13
	cmp	 r12,r12,r3
	bb0	 ls,r12,@L7477
	bsr.n	 _grow_outbuf
	or	 r2,r0,r24
@L7477:
	ld	 r12,r24,24
	addu	 r13,r12,1
	st	 r13,r24,24
	or	 r13,r0,35
	st.b	 r13,r0,r12
	ld	 r2,r21,8
	ld	 r3,r24,24
	bsr.n	 _bcopy
	or	 r4,r0,r25
	ld	 r13,r24,24
	addu	 r4,r13,r25
	cmp	 r13,r18,r20
	bb0.n	 ne,r13,@L7478
	st	 r4,r24,24
	ld.bu	 r13,r0,r20
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L7478
	addu	 r13,r4,1
	st	 r13,r24,24
	or	 r13,r0,32
	st.b	 r13,r0,r4
@L7478:
	or	 r2,r0,r20
	ld	 r3,r24,24
	bsr.n	 _bcopy
	or	 r4,r0,r19
	ld	 r13,r24,24
	addu	 r13,r13,r19
	st	 r13,r24,24
@L7474:
	ld	 r13,r22,12
	cmp	 r13,r13,31
	bb0.n	 ne,r13,@L7479
	or.u	 r2,r0,hi16(@LC244)
	ld	 r3,r22,20
	bsr.n	 _warning
	or	 r2,r2,lo16(@LC244)
@L7479:
	or	 r2,r0,r22
	bsr.n	 _delete_macro
	subu	 r1,r1,@L7496
@L7497:
	align	 4
@L7472:
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	bcnd.n	 eq0,r13,@L7457
	addu	 r23,r23,r17
	or.u	 r13,r0,hi16(_is_hor_space)
	ld.bu	 r12,r0,r23
	or	 r11,r13,lo16(_is_hor_space)
	ld.bu	 r13,r12,r11
	bcnd	 eq0,r13,@L7482
	or	 r12,r0,r11
	addu	 r23,r23,1
@L7495:
	ld.bu	 r13,r0,r23
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L7495
	addu	 r23,r23,1
	subu	 r23,r23,1
@L7482:
	cmp	 r13,r23,r18
	bb0.n	 ne,r13,@L7457
	or.u	 r2,r0,hi16(@LC245)
	bsr.n	 _pedwarn
	or	 r2,r2,lo16(@LC245)
@L7457:
@Lte77:
	ld	 r1,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	or.u	 r12,r0,hi16(_indepth)
	ld.d	 r18,r31,48
	ld	 r13,r12,lo16(_indepth)
	ld.d	 r16,r31,40
	addu	 r31,r31,96
	subu	 r13,r13,1
	jmp.n	 r1
	st	 r13,r12,lo16(_indepth)
	def	 @L7496,@L7497-@L7471

data
	align	 8
@LC352:
	string	 "malformed option `%s %s'\000"
	align	 8
@LC353:
	string	 "malformed option `%s %s'\000"
	align	 8
@LC354:
	string	 "*Initialization*\000"
text
	align	 8
_make_assertion:
	subu	 r31,r31,80
	st	 r1,r31,68
	st	 r30,r31,64
	st	 r21,r31,44
	st.d	 r24,r31,56
	st.d	 r22,r31,48
	or	 r25,r0,r3
	or	 r23,r0,r2
	or	 r2,r0,r25
	bsr.n	 _strlen
	addu	 r30,r31,64
@Ltb78:
	addu	 r2,r2,16
	and	 r2,r2,0xfff0
	subu	 r31,r31,r2
	addu	 r24,r31,32
	or	 r3,r0,r25
	bsr.n	 _strcpy
	or	 r2,r0,r24
	ld.bu	 r13,r31,32
	or	 r12,r0,r24
	bcnd.n	 eq0,r13,@L7500
	or	 r11,r0,r24
	ld.bu	 r13,r0,r11
	cmp	 r13,r13,92
@L7566:
	bb1	 ne,r13,@L7502
	ld.bu	 r13,r11,1
	cmp	 r13,r13,10
	bb1	 ne,r13,@L7502
	addu	 r11,r11,2
	br	 @L7499
	align	 4
@L7502:
	ld.bu	 r13,r0,r11
	addu	 r11,r11,1
	st.b	 r13,r0,r12
	addu	 r12,r12,1
@L7499:
	ld.bu	 r13,r0,r11
	bcnd.n	 ne0,r13,@L7566
	cmp	 r13,r13,92
@L7500:
	st.b	 r0,r0,r12
	or.u	 r13,r0,hi16(_is_idstart)
	ld.bu	 r12,r0,r24
	or	 r13,r13,lo16(_is_idstart)
	ld.bu	 r13,r12,r13
	bcnd.n	 ne0,r13,@L7505
	or.u	 r13,r0,hi16(_is_idchar)
	or	 r3,r0,r23
	or.u	 r2,r0,hi16(@LC352)
	or	 r4,r0,r25
	or	 r2,r2,lo16(@LC352)
	bsr.n	 _error
	addu	 r1,r1,@L7572
@L7573:
	align	 4
@L7505:
	ld.bu	 r12,r24,1
	or	 r10,r13,lo16(_is_idchar)
	ld.bu	 r13,r12,r10
	bcnd.n	 eq0,r13,@L7564
	addu	 r11,r24,1
	or	 r12,r0,r10
	addu	 r11,r11,1
@L7567:
	ld.bu	 r13,r0,r11
	ld.bu	 r13,r13,r12
	bcnd.n	 ne0,r13,@L7567
	addu	 r11,r11,1
	subu	 r11,r11,1
@L7564:
	ld.bu	 r13,r0,r11
	cmp	 r12,r13,32
	cmp	 r13,r13,9
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 ne0,r12,@L7564
	addu	 r11,r11,1
	subu	 r11,r11,1
	ld.bu	 r13,r0,r11
	cmp	 r12,r13,0
	cmp	 r13,r13,40
	or	 r12,r12,r13
	extu	 r13,r12,1<eq>
	xor	 r12,r13,1
	bcnd.n	 eq0,r12,@L7514
	or	 r3,r0,r23
	or.u	 r2,r0,hi16(@LC353)
	or	 r4,r0,r25
	or	 r2,r2,lo16(@LC353)
	bsr.n	 _error
	addu	 r1,r1,@L7574
@L7575:
	align	 4
@L7514:
	or.u	 r11,r0,hi16(_indepth)
	ld	 r13,r11,lo16(_indepth)
	addu	 r13,r13,1
	or.u	 r12,r0,hi16(_instack)
	mul	 r25,r13,44
	or	 r12,r12,lo16(_instack)
	st	 r13,r11,lo16(_indepth)
	or.u	 r13,r0,hi16(@LC354)
	addu	 r25,r25,r12
	or	 r13,r13,lo16(@LC354)
	st	 r13,r0,r25
	st	 r13,r25,4
	st	 r24,r25,24
	or	 r2,r0,r24
	bsr.n	 _strlen
	st	 r24,r25,20
	or.u	 r13,r0,hi16(_if_stack)
	ld	 r12,r13,lo16(_if_stack)
	st	 r2,r25,16
	st	 r0,r25,28
	st	 r0,r25,36
	or	 r13,r0,1
	st	 r13,r25,12
	st	 r12,r25,32
	or.u	 r13,r0,hi16(_directive_table)
	st.b	 r0,r25,40
	or	 r12,r13,lo16(_directive_table)
@L7517:
	ld	 r13,r12,12
	cmp	 r13,r13,18
	bb1.n	 ne,r13,@L7517
	addu	 r12,r12,20
	bsr.n	 _strlen
	or	 r2,r0,r24
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	bcnd.n	 eq0,r13,@L7521
	addu	 r25,r24,r2
	or.u	 r13,r0,hi16(_done_initializing)
	ld	 r13,r13,lo16(_done_initializing)
	bcnd.n	 eq0,r13,@L7521
	or.u	 r13,r0,hi16(_indepth)
	ld	 r12,r13,lo16(_indepth)
	mul	 r12,r12,44
	or.u	 r13,r0,hi16(_instack)
	or	 r13,r13,lo16(_instack)
	addu	 r12,r12,r13
	ld.b	 r13,r12,40
	bcnd	 ne0,r13,@L7521
	or.u	 r2,r0,hi16(@LC227)
	bsr.n	 _pedwarn
	or	 r2,r2,lo16(@LC227)
@L7521:
	st	 r24,r30,8
	or.u	 r13,r0,hi16(_is_hor_space)
	ld.bu	 r12,r0,r24
	or	 r11,r13,lo16(_is_hor_space)
	ld.bu	 r13,r12,r11
	bcnd.n	 eq0,r13,@L7568
	or.u	 r3,r0,hi16(@LC228)
@L7524:
	ld	 r12,r30,8
	addu	 r13,r12,1
	st	 r13,r30,8
	ld.bu	 r13,r12,1
	ld.bu	 r13,r13,r11
	bcnd.n	 ne0,r13,@L7524
	or.u	 r3,r0,hi16(@LC228)
@L7568:
	ld	 r23,r30,8
	or	 r3,r3,lo16(@LC228)
	bsr.n	 _check_macro_name
	or	 r2,r0,r23
	ld	 r13,r30,8
	or	 r24,r0,r2
	addu	 r13,r13,r24
	st	 r13,r30,8
	or.u	 r12,r0,hi16(_is_hor_space)
	ld.bu	 r13,r0,r13
	or	 r12,r12,lo16(_is_hor_space)
	ld.bu	 r13,r13,r12
	bcnd	 eq0,r13,@L7527
	or	 r11,r0,r12
@L7531:
	ld	 r12,r30,8
	addu	 r13,r12,1
	st	 r13,r30,8
	ld.bu	 r13,r12,1
	ld.bu	 r13,r13,r11
	bcnd	 ne0,r13,@L7531
@L7527:
	ld	 r12,r30,8
	ld.bu	 r13,r0,r12
	cmp	 r13,r13,40
	bb0.n	 ne,r13,@L7534
	or.u	 r2,r0,hi16(@LC229)
	or	 r2,r2,lo16(@LC229)
	bsr.n	 _error
	addu	 r1,r1,@L7576
@L7577:
	align	 4
@L7534:
	st	 r0,r30,12
	addu	 r13,r12,1
	st	 r13,r30,8
	or.u	 r13,r0,hi16(_is_hor_space)
	ld.bu	 r12,r12,1
	or	 r11,r13,lo16(_is_hor_space)
	ld.bu	 r13,r12,r11
	bcnd.n	 eq0,r13,@L7569
	addu	 r2,r30,8
@L7540:
	ld	 r12,r30,8
	addu	 r13,r12,1
	st	 r13,r30,8
	ld.bu	 r13,r12,1
	ld.bu	 r13,r13,r11
	bcnd.n	 ne0,r13,@L7540
	addu	 r2,r30,8
@L7569:
	or	 r3,r0,r25
	bsr.n	 _read_token_list
	addu	 r4,r30,12
	ld	 r13,r30,12
	bcnd.n	 ne0,r13,@L7520
	or	 r21,r0,r2
	bcnd.n	 ne0,r21,@L7544
	or.u	 r2,r0,hi16(@LC230)
	or	 r2,r2,lo16(@LC230)
	bsr.n	 _error
	addu	 r1,r1,@L7578
@L7579:
	align	 4
@L7544:
	ld	 r12,r30,8
	addu	 r13,r12,1
	st	 r13,r30,8
	or.u	 r13,r0,hi16(_is_hor_space)
	ld.bu	 r12,r12,1
	or	 r11,r13,lo16(_is_hor_space)
	ld.bu	 r13,r12,r11
	bcnd.n	 eq0,r13,@L7570
	or	 r2,r0,r23
@L7550:
	ld	 r12,r30,8
	addu	 r13,r12,1
	st	 r13,r30,8
	ld.bu	 r13,r12,1
	ld.bu	 r13,r13,r11
	bcnd.n	 ne0,r13,@L7550
	or	 r2,r0,r23
@L7570:
	or	 r3,r0,r24
	bsr.n	 _hashf
	or	 r4,r0,37
	or	 r22,r0,r2
	bsr.n	 _xmalloc
	or	 r2,r0,8
	or	 r25,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r24
	bsr.n	 _assertion_lookup
	or	 r4,r0,r22
	bcnd.n	 ne0,r2,@L7553
	cmp	 r13,r24,7
	bb0.n	 eq,r13,@L7571
	or	 r2,r0,r23
	or.u	 r3,r0,hi16(@LC231)
	or	 r4,r0,7
	bsr.n	 _strncmp
	or	 r3,r3,lo16(@LC231)
	bcnd.n	 ne0,r2,@L7571
	or	 r2,r0,r23
	or.u	 r2,r0,hi16(@LC232)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC232)
	or	 r2,r0,r23
@L7571:
	or	 r3,r0,r24
	bsr.n	 _assertion_install
	or	 r4,r0,r22
@L7553:
	st	 r21,r25,4
	ld	 r13,r2,20
	st	 r13,r0,r25
	st	 r25,r2,20
@L7520:
	or.u	 r12,r0,hi16(_indepth)
	ld	 r13,r12,lo16(_indepth)
	subu	 r13,r13,1
	st	 r13,r12,lo16(_indepth)
@L7498:
@Lte78:
	subu	 r31,r30,64
	ld	 r1,r31,68
	ld	 r30,r31,64
	ld	 r21,r31,44
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	jmp.n	 r1
	addu	 r31,r31,80
	def	 @L7578,@L7520-@L7579
	def	 @L7576,@L7520-@L7577
	def	 @L7574,@L7498-@L7575
	def	 @L7572,@L7498-@L7573

	align	 8
_append_include_chain:
	subu	 r31,r31,64
	st	 r23,r31,36
	or	 r23,r0,r3
	cmp	 r13,r2,0
	cmp	 r12,r23,0
	or	 r13,r13,r12
	st	 r1,r31,48
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L7590
	st.d	 r24,r31,40
@Ltb79:
	or.u	 r12,r0,hi16(_include)
	ld	 r13,r12,lo16(_include)
	bcnd.n	 ne0,r13,@L7592
	or.u	 r13,r0,hi16(_last_include)
	br.n	 @L7593
	st	 r2,r12,lo16(_include)
	align	 4
@L7592:
	ld	 r13,r13,lo16(_last_include)
	st	 r2,r0,r13
@L7593:
	or.u	 r12,r0,hi16(_first_bracket_include)
	ld	 r13,r12,lo16(_first_bracket_include)
	bcnd	 ne0,r13,@L7594
	st	 r2,r12,lo16(_first_bracket_include)
@L7594:
	or	 r25,r0,r2
	or.u	 r24,r0,hi16(_max_include_len)
@L7595:
	bsr.n	 _strlen
	ld	 r2,r25,4
	ld	 r13,r24,lo16(_max_include_len)
	cmp	 r13,r2,r13
	bb0	 gt,r13,@L7598
	st	 r2,r24,lo16(_max_include_len)
@L7598:
	cmp	 r13,r25,r23
	bb0	 ne,r13,@L7596
	ld	 r25,r0,r25
	br	 @L7595
	align	 4
@L7596:
	or.u	 r13,r0,hi16(_last_include)
	st	 r0,r0,r23
	st	 r23,r13,lo16(_last_include)
@L7590:
@Lte79:
	ld	 r1,r31,48
	ld	 r23,r31,36
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

data
	align	 8
@LC355:
	string	 "\\\n  \000"
text
	align	 8
_deps_output:
	subu	 r31,r31,64
	st.d	 r22,r31,32
	or	 r22,r0,r2
	st.d	 r24,r31,40
	or	 r24,r0,r3
	bcnd.n	 ne0,r24,@L7607
	st	 r1,r31,48
@Ltb80:
	bsr	 _strlen
	or	 r24,r0,r2
	bcnd.n	 ne0,r24,@L7609
	or.u	 r23,r0,hi16(_deps_size)
	or.u	 r25,r0,hi16(_deps_column)
	ld	 r13,r25,lo16(_deps_column)
	bcnd.n	 eq0,r13,@L7609
	cmp	 r13,r13,75
	bb1	 ls,r13,@L7609
	or.u	 r2,r0,hi16(@LC355)
	or	 r3,r0,0
	bsr.n	 _deps_output
	or	 r2,r2,lo16(@LC355)
	st	 r0,r25,lo16(_deps_column)
@L7607:
	or.u	 r23,r0,hi16(_deps_size)
@L7609:
	ld	 r13,r23,lo16(_deps_size)
	or.u	 r11,r0,hi16(_deps_allocated_size)
	addu	 r3,r13,r24
	ld	 r12,r11,lo16(_deps_allocated_size)
	addu	 r13,r3,1
	cmp	 r13,r13,r12
	bb1.n	 ls,r13,@L7608
	or.u	 r25,r0,hi16(_deps_buffer)
	addu	 r3,r3,50
	ld	 r2,r25,lo16(_deps_buffer)
	mak	 r3,r3,0<1>
	bsr.n	 _xrealloc
	st	 r3,r11,lo16(_deps_allocated_size)
	st	 r2,r25,lo16(_deps_buffer)
@L7608:
	or.u	 r25,r0,hi16(_deps_buffer)
	ld	 r3,r23,lo16(_deps_size)
	ld	 r13,r25,lo16(_deps_buffer)
	or	 r2,r0,r22
	or	 r4,r0,r24
	bsr.n	 _bcopy
	addu	 r3,r13,r3
	ld	 r12,r23,lo16(_deps_size)
	or.u	 r11,r0,hi16(_deps_column)
	ld	 r10,r25,lo16(_deps_buffer)
	ld	 r13,r11,lo16(_deps_column)
	addu	 r12,r12,r24
	st	 r12,r23,lo16(_deps_size)
	addu	 r13,r13,r24
	st	 r13,r11,lo16(_deps_column)
	st.b	 r0,r10,r12
@Lte80:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	ld.d	 r22,r31,32
	jmp.n	 r1
	addu	 r31,r31,64

data
	align	 8
@LC356:
	string	 "%s: \000"
	align	 8
@LC357:
	string	 "\n\000"
text
	align	 8
_fatal:
	or.u	 r13,r0,hi16(_progname)
	ld	 r4,r13,lo16(_progname)
	subu	 r31,r31,64
	st	 r23,r31,36
	st.d	 r24,r31,40
	or	 r24,r0,r2
	or	 r23,r0,r3
	or.u	 r25,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC356)
	or	 r25,r25,lo16(__iob+64)
	or	 r3,r3,lo16(@LC356)
	st	 r1,r31,48
@Ltb81:
	bsr.n	 _fprintf
	or	 r2,r0,r25
	or	 r2,r0,r25
	or	 r3,r0,r24
	bsr.n	 _fprintf
	or	 r4,r0,r23
	or.u	 r3,r0,hi16(@LC357)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC357)
	bsr.n	 _exit
	or	 r2,r0,33
	align	 4
@Lte81:

data
	align	 8
@LC358:
	string	 "Internal gcc abort.\000"
text
	align	 8
	global	 _fancy_abort
_fancy_abort:
	or.u	 r2,r0,hi16(@LC358)
	subu	 r31,r31,48
	st	 r1,r31,36
@Ltb82:
	bsr.n	 _fatal
	or	 r2,r2,lo16(@LC358)
@Lte82:
	ld	 r1,r31,36
	jmp.n	 r1
	addu	 r31,r31,48

data
	align	 8
@LC359:
	string	 "%s: \000"
	align	 8
@LC360:
	string	 "%s: %s\n\000"
	align	 8
@LC361:
	string	 "%s: undocumented I/O error\n\000"
text
	align	 8
_perror_with_name:
	or.u	 r13,r0,hi16(_progname)
	ld	 r4,r13,lo16(_progname)
	subu	 r31,r31,64
	or.u	 r3,r0,hi16(@LC359)
	st.d	 r24,r31,40
	or.u	 r13,r0,hi16(__iob+64)
	or	 r24,r0,r2
	or	 r25,r13,lo16(__iob+64)
	or	 r3,r3,lo16(@LC359)
	st	 r1,r31,48
@Ltb83:
	bsr.n	 _fprintf
	or	 r2,r0,r25
	or.u	 r13,r0,hi16(_errno)
	ld	 r12,r13,lo16(_errno)
	or.u	 r13,r0,hi16(_sys_nerr)
	ld	 r13,r13,lo16(_sys_nerr)
	cmp	 r13,r12,r13
	bb1.n	 ge,r13,@L7618
	or	 r2,r0,r25
	or.u	 r13,r0,hi16(_sys_errlist)
	or	 r4,r0,r24
	or	 r13,r13,lo16(_sys_errlist)
	or.u	 r3,r0,hi16(@LC360)
	ld	 r5,r13[r12]
	or	 r3,r3,lo16(@LC360)
	bsr.n	 _fprintf
	addu	 r1,r1,@L7620
@L7621:
	align	 4
@L7618:
	or.u	 r3,r0,hi16(@LC361)
	or	 r4,r0,r24
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC361)
@L7619:
	or.u	 r12,r0,hi16(_errors)
@Lte83:
	ld	 r1,r31,48
	ld	 r13,r12,lo16(_errors)
	ld.d	 r24,r31,40
	addu	 r31,r31,64
	addu	 r13,r13,1
	jmp.n	 r1
	st	 r13,r12,lo16(_errors)
	def	 @L7620,@L7619-@L7621

	align	 8
_pfatal_with_name:
	or.u	 r13,r0,hi16(_progname)
	ld	 r4,r13,lo16(_progname)
	subu	 r31,r31,64
	or.u	 r3,r0,hi16(@LC359)
	st.d	 r24,r31,40
	or.u	 r13,r0,hi16(__iob+64)
	or	 r24,r0,r2
	or	 r25,r13,lo16(__iob+64)
	or	 r3,r3,lo16(@LC359)
	st	 r1,r31,48
@Ltb84:
	bsr.n	 _fprintf
	or	 r2,r0,r25
	or.u	 r13,r0,hi16(_errno)
	ld	 r12,r13,lo16(_errno)
	or.u	 r13,r0,hi16(_sys_nerr)
	ld	 r13,r13,lo16(_sys_nerr)
	cmp	 r13,r12,r13
	bb1.n	 ge,r13,@L7628
	or	 r2,r0,r25
	or.u	 r13,r0,hi16(_sys_errlist)
	or	 r4,r0,r24
	or	 r13,r13,lo16(_sys_errlist)
	or.u	 r3,r0,hi16(@LC360)
	ld	 r5,r13[r12]
	or	 r3,r3,lo16(@LC360)
	bsr.n	 _fprintf
	addu	 r1,r1,@L7630
@L7631:
	align	 4
@L7628:
	or.u	 r3,r0,hi16(@LC361)
	or	 r4,r0,r24
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC361)
@L7629:
	or.u	 r12,r0,hi16(_errors)
	ld	 r13,r12,lo16(_errors)
	or	 r2,r0,33
	addu	 r13,r13,1
	bsr.n	 _exit
	st	 r13,r12,lo16(_errors)
	align	 4
@Lte84:
	def	 @L7630,@L7629-@L7631

data
	align	 8
@LC362:
	string	 "Memory exhausted.\000"
text
	align	 8
_memory_full:
	or.u	 r2,r0,hi16(@LC362)
	subu	 r31,r31,48
	st	 r1,r31,36
@Ltb85:
	bsr.n	 _fatal
	or	 r2,r2,lo16(@LC362)
@Lte85:
	ld	 r1,r31,36
	jmp.n	 r1
	addu	 r31,r31,48

	align	 8
	global	 _xmalloc
_xmalloc:
	subu	 r31,r31,48
	st	 r1,r31,36
@Ltb86:
	bsr	 _malloc
	bcnd	 ne0,r2,@L7638
	or.u	 r2,r0,hi16(@LC362)
	bsr.n	 _fatal
	or	 r2,r2,lo16(@LC362)
	or	 r2,r0,0
@L7638:
@Lte86:
	ld	 r1,r31,36
	jmp.n	 r1
	addu	 r31,r31,48

	align	 8
_xrealloc:
	subu	 r31,r31,48
	st	 r1,r31,36
@Ltb87:
	bsr	 _realloc
	bcnd	 ne0,r2,@L7645
	or.u	 r2,r0,hi16(@LC362)
	bsr.n	 _fatal
	or	 r2,r2,lo16(@LC362)
	or	 r2,r0,0
@L7645:
@Lte87:
	ld	 r1,r31,36
	jmp.n	 r1
	addu	 r31,r31,48

	align	 8
_xcalloc:
	subu	 r31,r31,64
	st.d	 r24,r31,40
	mul	 r25,r2,r3
	st	 r1,r31,48
@Ltb88:
	bsr.n	 _malloc
	or	 r2,r0,r25
	or	 r24,r0,r2
	bcnd.n	 eq0,r24,@L7663
	cmp	 r13,r25,100
	bb1.n	 ls,r13,@L7664
	or	 r3,r0,r25
	bsr.n	 _bzero
	addu	 r1,r1,@L7716
@L7717:
	align	 4
@L7664:
	addu	 r13,r24,r25
	subu	 r8,r13,4
	or	 r12,r0,r24
	cmp	 r9,r24,r8
	bb0.n	 lo,r9,@L7667
	subu	 r11,r25,4
	subu	 r13,r8,r24
	bb1.n	 ge,r9,@L7698
	mask	 r10,r13,15
	bcnd.n	 eq0,r10,@L7668
	cmp	 r13,r10,4
	bb1.n	 le,r13,@L7698
	cmp	 r13,r10,8
	bb1.n	 le,r13,@L7699
	cmp	 r13,r10,13
	bb1	 ge,r13,@L7668
	addu	 r12,r24,4
	st	 r0,r0,r24
@L7699:
	st	 r0,r0,r12
	addu	 r12,r12,4
@L7698:
	st	 r0,r0,r12
	addu	 r12,r12,4
	cmp	 r13,r12,r8
	bb0.n	 lo,r13,@L7715
	xor.c	 r13,r11,r0
@L7668:
	st	 r0,r0,r12
	st	 r0,r12,4
	st	 r0,r12,8
	st	 r0,r12,12
	addu	 r12,r12,16
	cmp	 r13,r12,r8
	bb1	 lo,r13,@L7668
@L7667:
	xor.c	 r13,r11,r0
@L7715:
	ext	 r13,r13,0<31>
	and	 r11,r11,r13
	cmp	 r9,r11,r25
	bb0.n	 lo,r9,@L7665
	subu	 r13,r25,r11
	addu	 r12,r11,r24
	bb1.n	 ge,r9,@L7679
	mask	 r10,r13,3
	bcnd.n	 eq0,r10,@L7673
	cmp	 r13,r10,1
	bb1.n	 le,r13,@L7679
	cmp	 r13,r10,2
	bb1	 le,r13,@L7680
	st.b	 r0,r0,r12
	addu	 r12,r12,1
	addu	 r11,r11,1
@L7680:
	st.b	 r0,r0,r12
	addu	 r12,r12,1
	addu	 r11,r11,1
@L7679:
	addu	 r11,r11,1
	st.b	 r0,r0,r12
	cmp	 r13,r11,r25
	bb0.n	 lo,r13,@L7665
	addu	 r12,r12,1
@L7673:
	st.b	 r0,r0,r12
	st.b	 r0,r12,1
	st.b	 r0,r12,2
	addu	 r11,r11,4
	st.b	 r0,r12,3
	cmp	 r13,r11,r25
	bb1.n	 lo,r13,@L7673
	addu	 r12,r12,4
@L7665:
	br.n	 @L7676
	or	 r2,r0,r24
	align	 4
@L7663:
	or.u	 r2,r0,hi16(@LC362)
	bsr.n	 _fatal
	or	 r2,r2,lo16(@LC362)
	or	 r2,r0,0
@L7676:
@Lte88:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64
	def	 @L7716,@L7665-@L7717

	align	 8
_savestring:
	subu	 r31,r31,64
	st.d	 r24,r31,40
	st	 r1,r31,48
@Ltb89:
	bsr.n	 _strlen
	or	 r24,r0,r2
	bsr.n	 _malloc
	addu	 r2,r2,1
	bcnd.n	 ne0,r2,@L7723
	or	 r25,r0,r2
	or.u	 r2,r0,hi16(@LC362)
	or	 r2,r2,lo16(@LC362)
	bsr.n	 _fatal
	or	 r25,r0,0
@L7723:
	or	 r2,r0,r25
	bsr.n	 _strcpy
	or	 r3,r0,r24
@Lte89:
	ld	 r1,r31,48
	or	 r2,r0,r25
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
_file_size_and_mode:
	subu	 r31,r31,128
	st	 r1,r31,48
	st.d	 r24,r31,40
@Ltb90:
	or	 r25,r0,r3
	addu	 r3,r31,56
	bsr.n	 _fstat
	or	 r24,r0,r4
	bcnd.n	 lt0,r2,@L7734
	subu	 r2,r0,1
	bcnd	 eq0,r25,@L7732
	ld	 r13,r31,64
	st	 r13,r0,r25
@L7732:
	bcnd.n	 eq0,r24,@L7734
	or	 r2,r0,0
	ld	 r13,r31,84
	st	 r13,r0,r24
@L7734:
@Lte90:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,128

	bss	 _progname,4,4
	bss	 _cplusplus,4,4
	bss	 _cplusplus_comments,4,4
	bss	 _objc,4,4
	bss	 _lang_asm,4,4
	bss	 _max_include_len,4,4
	bss	 _no_line_commands,4,4
	bss	 _pcp_outfile,4,4
	bss	 _pcp_inside_if,4,4
	bss	 _no_precomp,4,4
	comm	 _pedantic,4
	bss	 _pedantic_errors,4,4
	bss	 _warn_comments,4,4
	bss	 _warn_stringify,4,4
	bss	 _warn_trigraphs,4,4
	bss	 _warnings_are_errors,4,4
	comm	 _traditional,4
	bss	 _no_output,4,4
	bss	 _instack,8800,8
	bss	 _last_error_tick,4,4
	bss	 _input_file_stack_tick,4,4
	bss	 _outbuf,44,8
	bss	 _include_prefix,4,4
	bss	 _stringlist,4,4
	bss	 _hashtab,5612,8
	bss	 _assertion_hashtab,148,8
	bss	 _assertions_flag,4,4
	comm	 _directive_start,4
	comm	 _is_idchar,256
	comm	 _is_idstart,256
	comm	 _is_hor_space,256
	bss	 _is_space,256,8
	bss	 _dollars_in_ident,4,4
	bss	 _deps_buffer,4,4
	bss	 _deps_allocated_size,4,4
	bss	 _deps_size,4,4
	bss	 _deps_column,4,4
	bss	 _ignore_srcdir,4,4
	bss	 _import_hash_table,124,8
