	file	 "cp-decl.i"
data

; cc1 (2.7.2.2) arguments: -O -fdefer-pop -fomit-frame-pointer
; -fcse-follow-jumps -fcse-skip-blocks -fexpensive-optimizations
; -fthread-jumps -fstrength-reduce -funroll-loops -fwritable-strings
; -fpeephole -fforce-mem -ffunction-cse -finline-functions -finline
; -freg-struct-return -fdelayed-branch -frerun-cse-after-loop
; -fschedule-insns -fschedule-insns2 -fcommon -fgnu-linker -m88110 -m88100
; -m88000 -mno-ocs-debug-info -mno-ocs-frame-position -mcheck-zero-division

gcc2_compiled.:
	global	 _language_string
	align	 8
@LC0:
	string	 "GNU C++\000"
	align	 4
_language_string:
	word	 @LC0
text
	align	 8
	global	 _push_decl_level
_push_decl_level:
	subu	 r31,r31,64
	or	 r4,r0,16
	st	 r2,r31,40
	or	 r2,r0,r3
	st	 r1,r31,36
@Ltb0:
	bsr.n	 _push_stack_level
	addu	 r3,r31,40
@Lte0:
	ld	 r1,r31,36
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
	global	 _global_bindings_p
_global_bindings_p:
@Ltb1:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r2,r9,lo16(_current_binding_level)
	or.u	 r9,r0,hi16(_global_binding_level)
	ld	 r9,r9,lo16(_global_binding_level)
	cmp	 r2,r2,r9
	jmp.n	 r1
	extu	 r2,r2,1<eq>
@Lte1:

	align	 8
	global	 _keep_next_level
_keep_next_level:
@Ltb2:
	or.u	 r8,r0,hi16(_keep_next_level_flag)
	or	 r9,r0,1
	jmp.n	 r1
	st	 r9,r8,lo16(_keep_next_level_flag)
@Lte2:

	align	 8
	global	 _kept_level_p
_kept_level_p:
@Ltb3:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r8,r9,lo16(_current_binding_level)
	ld	 r9,r8,20
	bcnd.n	 ne0,r9,@L29
	or	 r2,r0,0
	ld	 r7,r8,32
	mask	 r9,r7,3584
	bcnd	 ne0,r9,@L29
	ld	 r9,r0,r8
	bcnd	 ne0,r9,@L29
	ld	 r9,r8,4
	bcnd	 eq0,r9,@L30
	bb1	 (31-23),r7,@L30
@L29:
	or	 r2,r0,1
@L30:
	jmp	 r1
@Lte3:

	align	 8
	global	 _declare_parm_level
_declare_parm_level:
@Ltb4:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r8,r9,lo16(_current_binding_level)
	ld	 r9,r8,32
	and	 r9,r9,0xfff
	or	 r9,r9,4096
	jmp.n	 r1
	st	 r9,r8,32
@Lte4:

	align	 8
	global	 _declare_implicit_exception
_declare_implicit_exception:
@Ltb5:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r8,r9,lo16(_current_binding_level)
	ld	 r9,r8,32
	and	 r9,r9,0xfff
	or	 r9,r9,12288
	jmp.n	 r1
	st	 r9,r8,32
@Lte5:

	align	 8
	global	 _have_exceptions_p
_have_exceptions_p:
@Ltb6:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r9,r9,lo16(_current_binding_level)
	ld	 r2,r9,32
	jmp.n	 r1
	extu	 r2,r2,1<4>
@Lte6:

	align	 8
	global	 _declare_uninstantiated_type_level
_declare_uninstantiated_type_level:
@Ltb7:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r8,r9,lo16(_current_binding_level)
	ld	 r9,r8,32
	or	 r9,r9,8
	jmp.n	 r1
	st	 r9,r8,32
@Lte7:

	align	 8
	global	 _uninstantiated_type_level_p
_uninstantiated_type_level_p:
@Ltb8:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r9,r9,lo16(_current_binding_level)
	ld	 r2,r9,32
	jmp.n	 r1
	extu	 r2,r2,1<3>
@Lte8:

	align	 8
	global	 _declare_pseudo_global_level
_declare_pseudo_global_level:
@Ltb9:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r8,r9,lo16(_current_binding_level)
	ld	 r9,r8,32
	or	 r9,r9,4
	jmp.n	 r1
	st	 r9,r8,32
@Lte9:

	align	 8
	global	 _pseudo_global_level_p
_pseudo_global_level_p:
@Ltb10:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r9,r9,lo16(_current_binding_level)
	ld	 r2,r9,32
	jmp.n	 r1
	extu	 r2,r2,1<2>
@Lte10:

	align	 8
	global	 _pushlevel
_pushlevel:
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	subu	 r31,r31,64
	st	 r23,r31,36
	or	 r23,r0,r2
	st	 r1,r31,48
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L53
	st.d	 r24,r31,40
@Ltb11:
	or.u	 r13,r0,hi16(_named_labels)
	ld	 r2,r13,lo16(_named_labels)
	cmp	 r2,r2,0
	or	 r3,r0,134
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
@L53:
	or.u	 r12,r0,hi16(_free_binding_level)
	ld	 r2,r12,lo16(_free_binding_level)
	bcnd.n	 eq0,r2,@L54
	or	 r25,r0,r2
	ld	 r13,r25,28
	br.n	 @L55
	st	 r13,r12,lo16(_free_binding_level)
	align	 4
@L54:
	bsr.n	 _xmalloc
	or	 r2,r0,36
	or	 r25,r0,r2
@L55:
	or.u	 r3,r0,hi16(_clear_binding_level)
	subu	 r2,r25,60
	ld	 r4,r3,lo16(_clear_binding_level)
	or	 r3,r3,lo16(_clear_binding_level)
	or.u	 r13,r0,hi16(_keep_next_level_flag)
	subu	 r3,r3,60
	bsr.n	 ___movstrSI96x36
	ld	 r24,r13,lo16(_keep_next_level_flag)
	or.u	 r12,r0,hi16(_class_binding_level)
	ld	 r13,r12,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L57
	st	 r13,r25,28
	br.n	 @L58
	st	 r0,r12,lo16(_class_binding_level)
	align	 4
@L57:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	st	 r13,r25,28
@L58:
	ld	 r13,r25,32
	mak	 r12,r23,1<8>
	and	 r13,r13,0xfeff
	mak	 r11,r24,3<9>
	or	 r13,r13,r12
	or	 r2,r0,r25
	or	 r13,r13,160
	or.u	 r12,r0,hi16(_current_binding_level)
	and	 r13,r13,0xf1ff
	st	 r2,r12,lo16(_current_binding_level)
	or	 r13,r13,r11
	bsr.n	 _GNU_xref_start_scope
	st	 r13,r2,32
@Lte11:
	ld	 r1,r31,48
	ld	 r23,r31,36
	ld.d	 r24,r31,40
	or.u	 r13,r0,hi16(_keep_next_level_flag)
	addu	 r31,r31,64
	jmp.n	 r1
	st	 r0,r13,lo16(_keep_next_level_flag)

	align	 8
	global	 _pushlevel_temporary
_pushlevel_temporary:
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	subu	 r31,r31,64
	st	 r23,r31,36
	or	 r23,r0,r2
	st	 r1,r31,48
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L69
	st.d	 r24,r31,40
@Ltb12:
	or.u	 r13,r0,hi16(_named_labels)
	ld	 r2,r13,lo16(_named_labels)
	cmp	 r2,r2,0
	or	 r3,r0,134
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
@L69:
	or.u	 r12,r0,hi16(_free_binding_level)
	ld	 r2,r12,lo16(_free_binding_level)
	bcnd.n	 eq0,r2,@L70
	or	 r25,r0,r2
	ld	 r13,r25,28
	br.n	 @L71
	st	 r13,r12,lo16(_free_binding_level)
	align	 4
@L70:
	bsr.n	 _xmalloc
	or	 r2,r0,36
	or	 r25,r0,r2
@L71:
	or.u	 r3,r0,hi16(_clear_binding_level)
	subu	 r2,r25,60
	ld	 r4,r3,lo16(_clear_binding_level)
	or	 r3,r3,lo16(_clear_binding_level)
	or.u	 r13,r0,hi16(_keep_next_level_flag)
	subu	 r3,r3,60
	bsr.n	 ___movstrSI96x36
	ld	 r24,r13,lo16(_keep_next_level_flag)
	or.u	 r12,r0,hi16(_class_binding_level)
	ld	 r13,r12,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L73
	st	 r13,r25,28
	br.n	 @L74
	st	 r0,r12,lo16(_class_binding_level)
	align	 4
@L73:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	st	 r13,r25,28
@L74:
	ld	 r13,r25,32
	mak	 r12,r23,1<8>
	and	 r13,r13,0xfeff
	or	 r2,r0,r25
	or	 r13,r13,r12
	or.u	 r25,r0,hi16(_current_binding_level)
	or	 r13,r13,160
	mak	 r12,r24,3<9>
	and	 r13,r13,0xf1ff
	st	 r2,r25,lo16(_current_binding_level)
	or	 r13,r13,r12
	bsr.n	 _GNU_xref_start_scope
	st	 r13,r2,32
	ld	 r11,r25,lo16(_current_binding_level)
	ld	 r13,r11,32
	or.u	 r12,r0,hi16(_keep_next_level_flag)
	and	 r13,r13,0xf1ff
	st	 r0,r12,lo16(_keep_next_level_flag)
	or	 r13,r13,1024
	bsr.n	 _clear_last_expr
	st	 r13,r11,32
	bsr.n	 _expand_start_bindings
	or	 r2,r0,0
@Lte12:
	ld	 r1,r31,48
	ld	 r23,r31,36
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

data
	align	 8
@LC1:
	string	 "label `%s' used but not defined\000"
	align	 8
@LC2:
	string	 "label `%s' defined but not used\000"
text
	align	 8
	global	 _poplevel
_poplevel:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	subu	 r31,r31,96
	st	 r1,r31,80
	st	 r15,r31,36
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	st.d	 r18,r31,48
	or	 r20,r0,r2
	st.d	 r16,r31,40
@Ltb13:
	or	 r24,r0,r4
	ld	 r13,r13,32
	or	 r15,r0,r3
	or	 r21,r0,r24
	mask	 r18,r13,61440
	mask	 r13,r13,3584
	cmp	 r12,r18,12288
	cmp	 r13,r13,1024
	bb1.n	 ne,r13,@L162
	extu	 r18,r12,1<eq>
	or	 r21,r0,0
@L162:
	bcnd.n	 lt0,r21,@L164
	or	 r16,r0,r24
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r19,r13,4
	br	 @L165
	align	 4
@L164:
	or	 r19,r0,0
@L165:
	bcnd.n	 lt0,r21,@L166
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r22,r13,20
	br.n	 @L257
	or.u	 r25,r0,hi16(_current_binding_level)
	align	 4
@L166:
	or	 r22,r0,0
	or.u	 r25,r0,hi16(_current_binding_level)
@L257:
	ld	 r2,r25,lo16(_current_binding_level)
	ld	 r6,r2,32
	extu	 r4,r6,4<12>
	extu	 r5,r6,3<9>
	ld	 r3,r2,28
	bsr.n	 _GNU_xref_end_scope
	extu	 r6,r6,1<8>
	ld	 r2,r25,lo16(_current_binding_level)
	ld	 r13,r2,32
	mask	 r13,r13,3584
	cmp	 r13,r13,512
	bb1	 ne,r13,@L168
	or	 r20,r0,1
@L168:
	bcnd	 eq0,r15,@L169
	bsr.n	 _nreverse
	ld	 r2,r0,r2
	ld	 r13,r25,lo16(_current_binding_level)
	or	 r24,r0,r2
	br.n	 @L170
	st	 r24,r0,r13
	align	 4
@L169:
	ld	 r24,r0,r2
@L170:
	bcnd.n	 eq0,r24,@L172
	or	 r25,r0,r24
	or.u	 r23,r0,0x1d00
@L174:
	ld	 r12,r25,8
	mask.u	 r13,r12,0xff01
	cmp	 r13,r13,r23
	bb1	 ne,r13,@L173
	ld	 r13,r25,48
	bcnd	 eq0,r13,@L173
	bb0	 (31-11),r12,@L173
	bsr.n	 _output_inline_function
	or	 r2,r0,r25
@L173:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L174
@L172:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r13,24
	cmp	 r13,r12,0
	extu	 r17,r13,1<ne>
	bcnd.n	 eq0,r17,@L177
	or	 r23,r0,0
	br.n	 @L178
	or	 r23,r0,r12
	align	 4
@L177:
	cmp	 r12,r20,1
	cmp	 r13,r21,0
	or.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L178
	bsr.n	 _make_node
	or	 r2,r0,5
	or	 r23,r0,r2
@L178:
	bcnd	 eq0,r23,@L180
	st	 r24,r23,16
	st	 r19,r23,20
	or	 r2,r0,r23
	bsr.n	 _remember_end_note
	st	 r22,r23,24
@L180:
	bcnd	 lt0,r20,@L181
	bcnd.n	 eq0,r22,@L181
	or	 r25,r0,r22
@L185:
	st	 r23,r25,28
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L185
@L181:
	or	 r25,r0,r24
	bcnd	 eq0,r25,@L188
	or.u	 r10,r0,0x80
	or.u	 r11,r0,0x10
@L190:
	ld	 r13,r25,32
	bcnd	 eq0,r13,@L189
	ld	 r13,r25,28
	and	 r13,r13,r10
	bcnd	 eq0,r13,@L192
	ld	 r13,r25,8
	bb0	 (31-16),r13,@L263
	ld	 r12,r25,60
	ld	 r13,r12,8
	or	 r13,r13,32768
	st	 r13,r12,8
	ld	 r13,r25,8
@L263:
	and	 r13,r13,r11
	bcnd	 eq0,r13,@L192
	ld	 r12,r25,60
	ld	 r13,r12,8
	or	 r13,r13,r11
	st	 r13,r12,8
@L192:
	ld	 r13,r25,32
	st	 r0,r13,24
@L189:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L190
@L188:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r25,r13,8
	bcnd.n	 eq0,r25,@L258
	or.u	 r13,r0,hi16(_current_binding_level)
@L199:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,24
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L199
	or.u	 r13,r0,hi16(_current_binding_level)
@L258:
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r25,r13,12
	bcnd.n	 eq0,r25,@L259
	or.u	 r13,r0,hi16(_current_binding_level)
@L204:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,28
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L204
	or.u	 r13,r0,hi16(_current_binding_level)
@L259:
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r25,r13,16
	bcnd	 eq0,r25,@L207
@L209:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,4
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L209
@L207:
	bcnd.n	 eq0,r21,@L211
	or.u	 r13,r0,hi16(_named_labels)
	ld	 r25,r13,lo16(_named_labels)
	bcnd.n	 eq0,r25,@L264
	st	 r0,r23,16
@L215:
	ld	 r24,r25,16
	ld	 r13,r24,48
	bcnd.n	 ne0,r13,@L216
	or.u	 r13,r0,hi16(_warn_unused)
	or.u	 r3,r0,hi16(@LC1)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC1)
	ld	 r4,r24,32
	or.u	 r13,r0,hi16(_input_filename)
	ld	 r2,r13,lo16(_input_filename)
	or	 r3,r0,1
	bsr.n	 _define_label
	addu	 r1,r1,@L265
@L266:
	align	 4
@L216:
	ld	 r13,r13,lo16(_warn_unused)
	bcnd	 eq0,r13,@L217
	ld	 r13,r24,8
	bb1	 (31-16),r13,@L217
	or.u	 r3,r0,hi16(@LC2)
	or	 r2,r0,r24
	bsr.n	 _warning_with_decl
	or	 r3,r3,lo16(@LC2)
@L217:
	ld	 r13,r24,32
	ld	 r13,r13,36
	bcnd.n	 ne0,r13,@L220
	or	 r2,r0,1
	bsr.n	 _perm_calloc
	or	 r3,r0,20
	ld	 r13,r24,32
	st	 r2,r13,36
@L220:
	ld	 r13,r24,32
	ld	 r13,r13,36
	st	 r0,r0,r13
	ld	 r13,r23,16
	st	 r13,r0,r24
	st	 r24,r23,16
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L215
	or.u	 r13,r0,hi16(_named_labels)
@L264:
	st	 r0,r13,lo16(_named_labels)
@L211:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r10,r13,lo16(_current_binding_level)
	ld	 r11,r10,28
	bcnd.n	 eq0,r11,@L222
	or.u	 r13,r0,hi16(_named_label_uses)
	ld	 r12,r13,lo16(_named_label_uses)
	bcnd.n	 eq0,r12,@L260
	or.u	 r13,r0,hi16(_current_binding_level)
@L226:
	ld	 r13,r12,4
	cmp	 r13,r13,r10
	bb1	 ne,r13,@L225
	st	 r11,r12,4
	ld	 r13,r0,r11
	st	 r13,r12,12
@L225:
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L226
@L222:
	or.u	 r13,r0,hi16(_current_binding_level)
@L260:
	ld	 r11,r13,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r11,32
	ld	 r13,r13,lo16(_global_binding_level)
	bcnd.n	 eq0,r13,@L230
	extu	 r24,r12,3<9>
	cmp	 r13,r11,r13
	bb1.n	 ne,r13,@L261
	or.u	 r9,r0,hi16(_current_binding_level)
	bsr.n	 _my_friendly_abort
	or	 r2,r0,123
@L230:
	or.u	 r9,r0,hi16(_current_binding_level)
@L261:
	or.u	 r11,r0,hi16(_free_binding_level)
	ld	 r12,r9,lo16(_current_binding_level)
	ld	 r13,r11,lo16(_free_binding_level)
	ld	 r10,r12,28
	st	 r13,r12,28
	ld	 r13,r10,32
	mask	 r13,r13,61440
	st	 r12,r11,lo16(_free_binding_level)
	cmp	 r13,r13,8192
	bb0.n	 eq,r13,@L229
	st	 r10,r9,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_class_binding_level)
	or	 r11,r0,r9
	st	 r10,r13,lo16(_class_binding_level)
@L233:
	ld	 r13,r11,lo16(_current_binding_level)
	ld	 r12,r13,28
	ld	 r13,r12,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb1.n	 eq,r13,@L233
	st	 r12,r11,lo16(_current_binding_level)
@L229:
	bcnd.n	 eq0,r21,@L237
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r13,r13,lo16(_current_function_decl)
	br.n	 @L238
	st	 r23,r13,48
	align	 4
@L237:
	bcnd	 eq0,r23,@L239
	bcnd.n	 ne0,r17,@L262
	cmp	 r13,r24,2
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r2,r13,20
	br.n	 @L256
	or	 r3,r0,r23
	align	 4
@L239:
	bcnd.n	 eq0,r22,@L238
	cmp	 r13,r20,2
	bb1.n	 ne,r13,@L243
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r3,r13,20
	br.n	 @L256
	or	 r2,r0,r22
	align	 4
@L243:
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r2,r13,20
	or	 r3,r0,r22
@L256:
	bsr	 _chainon
	ld	 r13,r25,lo16(_current_binding_level)
	st	 r2,r13,20
@L238:
	cmp	 r13,r24,2
@L262:
	cmp	 r12,r18,0
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L245
	bsr	 _getdecls
	or	 r3,r0,r20
	bsr.n	 _expand_end_bindings
	or	 r4,r0,1
	or	 r2,r0,r20
	or	 r3,r0,r15
	bsr.n	 _poplevel
	or	 r4,r0,r16
	or	 r23,r0,r2
@L245:
	bcnd	 eq0,r23,@L246
	ld	 r13,r23,8
	or	 r13,r13,32768
	st	 r13,r23,8
@L246:
@Lte13:
	ld	 r1,r31,80
	ld	 r15,r31,36
	ld.d	 r24,r31,72
	or	 r2,r0,r23
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	jmp.n	 r1
	addu	 r31,r31,96
	def	 @L265,@L217-@L266

	align	 8
	global	 _delete_block
_delete_block:
@Ltb14:
	or.u	 r7,r0,hi16(_current_binding_level)
	ld	 r8,r7,lo16(_current_binding_level)
	ld	 r9,r8,20
	cmp	 r9,r9,r2
	bb1	 ne,r9,@L277
	ld	 r9,r0,r2
	st	 r9,r8,20
@L277:
	ld	 r9,r7,lo16(_current_binding_level)
	ld	 r8,r9,20
	bcnd	 eq0,r8,@L279
@L281:
	ld	 r7,r0,r8
	cmp	 r9,r7,r2
	bb1	 ne,r9,@L282
	ld	 r9,r0,r2
	br.n	 @L278
	st	 r9,r0,r8
	align	 4
@L282:
	or	 r8,r0,r7
@L278:
	bcnd	 ne0,r8,@L281
@L279:
	ld	 r9,r2,8
	st	 r0,r0,r2
	and	 r9,r9,0x7fff
	jmp.n	 r1
	st	 r9,r2,8
@Lte14:

	align	 8
	global	 _insert_block
_insert_block:
	subu	 r31,r31,48
	st	 r1,r31,36
	or	 r3,r0,r2
	st	 r25,r31,32
@Ltb15:
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r3,8
	ld	 r12,r25,lo16(_current_binding_level)
	or	 r13,r13,32768
	st	 r13,r3,8
	bsr.n	 _chainon
	ld	 r2,r12,20
	ld	 r13,r25,lo16(_current_binding_level)
	st	 r2,r13,20
@Lte15:
	ld	 r1,r31,36
	ld	 r25,r31,32
	jmp.n	 r1
	addu	 r31,r31,48

	align	 8
	global	 _add_block_current_level
_add_block_current_level:
	subu	 r31,r31,48
	st	 r25,r31,32
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r25,lo16(_current_binding_level)
	st	 r1,r31,36
@Ltb16:
	or	 r3,r0,r2
	bsr.n	 _chainon
	ld	 r2,r13,20
	ld	 r13,r25,lo16(_current_binding_level)
	st	 r2,r13,20
@Lte16:
	ld	 r1,r31,36
	ld	 r25,r31,32
	jmp.n	 r1
	addu	 r31,r31,48

	align	 8
	global	 _set_block
_set_block:
@Ltb17:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r9,r9,lo16(_current_binding_level)
	jmp.n	 r1
	st	 r2,r9,24
@Lte17:

	align	 8
	global	 _pushlevel_class
_pushlevel_class:
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	subu	 r31,r31,80
	st	 r1,r31,48
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L307
	st.d	 r24,r31,40
@Ltb18:
	or.u	 r13,r0,hi16(_named_labels)
	ld	 r2,r13,lo16(_named_labels)
	cmp	 r2,r2,0
	or	 r3,r0,134
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
@L307:
	or.u	 r12,r0,hi16(_free_binding_level)
	ld	 r2,r12,lo16(_free_binding_level)
	bcnd.n	 eq0,r2,@L308
	or	 r25,r0,r2
	ld	 r13,r25,28
	br.n	 @L309
	st	 r13,r12,lo16(_free_binding_level)
	align	 4
@L308:
	bsr.n	 _xmalloc
	or	 r2,r0,36
	or	 r25,r0,r2
@L309:
	or.u	 r3,r0,hi16(_clear_binding_level)
	subu	 r2,r25,60
	ld	 r4,r3,lo16(_clear_binding_level)
	or	 r3,r3,lo16(_clear_binding_level)
	or.u	 r13,r0,hi16(_keep_next_level_flag)
	subu	 r3,r3,60
	bsr.n	 ___movstrSI96x36
	ld	 r24,r13,lo16(_keep_next_level_flag)
	or.u	 r12,r0,hi16(_class_binding_level)
	ld	 r13,r12,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L311
	st	 r13,r25,28
	br.n	 @L312
	st	 r0,r12,lo16(_class_binding_level)
	align	 4
@L311:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	st	 r13,r25,28
@L312:
	mak	 r12,r24,3<9>
	ld	 r13,r25,32
	or	 r2,r0,r25
	or.u	 r25,r0,hi16(_current_binding_level)
	or	 r13,r13,160
	or.u	 r24,r0,hi16(_decl_stack)
	and	 r13,r13,0xf0ff
	st	 r2,r25,lo16(_current_binding_level)
	or	 r13,r13,r12
	bsr.n	 _GNU_xref_start_scope
	st	 r13,r2,32
	addu	 r3,r31,56
	ld	 r13,r24,lo16(_decl_stack)
	or	 r4,r0,16
	or.u	 r2,r0,hi16(_decl_obstack)
	st	 r13,r31,56
	or.u	 r13,r0,hi16(_keep_next_level_flag)
	or	 r2,r2,lo16(_decl_obstack)
	bsr.n	 _push_stack_level
	st	 r0,r13,lo16(_keep_next_level_flag)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r12,32
	or.u	 r11,r0,hi16(_class_binding_level)
	st	 r2,r24,lo16(_decl_stack)
	and	 r13,r13,0xfff
	st	 r12,r11,lo16(_class_binding_level)
	or	 r13,r13,8192
	st	 r13,r12,32
@L314:
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r12,r13,28
	ld	 r13,r12,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb1.n	 eq,r13,@L314
	st	 r12,r25,lo16(_current_binding_level)
@Lte18:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,80

data
	align	 8
@LC3:
	string	 "syntax error too serious\000"
text
	align	 8
	global	 _poplevel_class
_poplevel_class:
	subu	 r31,r31,96
	or.u	 r13,r0,hi16(_class_binding_level)
	st.d	 r24,r31,72
	ld	 r25,r13,lo16(_class_binding_level)
	st	 r1,r31,80
	st	 r15,r31,36
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	st.d	 r18,r31,48
	or	 r23,r0,0
	bcnd.n	 ne0,r25,@L436
	st.d	 r16,r31,40
@Ltb19:
	or.u	 r12,r0,hi16(_current_binding_level)
	ld	 r13,r12,lo16(_current_binding_level)
	bcnd.n	 eq0,r13,@L551
	or	 r22,r0,r12
@L439:
	ld	 r13,r12,lo16(_current_binding_level)
	ld	 r13,r13,32
	or	 r20,r0,0
	or	 r18,r0,0
	mask	 r17,r13,61440
	mask	 r13,r13,3584
	cmp	 r12,r17,12288
	cmp	 r13,r13,1024
	bb1.n	 ne,r13,@L442
	extu	 r17,r12,1<eq>
	or	 r18,r0,r20
@L442:
	bcnd.n	 lt0,r18,@L444
	or	 r15,r0,0
	ld	 r13,r22,lo16(_current_binding_level)
	ld	 r19,r13,4
	br	 @L445
	align	 4
@L444:
	or	 r19,r0,0
@L445:
	bcnd.n	 lt0,r18,@L446
	or	 r21,r0,0
	ld	 r13,r22,lo16(_current_binding_level)
	ld	 r21,r13,20
@L446:
	ld	 r2,r22,lo16(_current_binding_level)
	ld	 r6,r2,32
	extu	 r4,r6,4<12>
	extu	 r5,r6,3<9>
	ld	 r3,r2,28
	bsr.n	 _GNU_xref_end_scope
	extu	 r6,r6,1<8>
	ld	 r12,r22,lo16(_current_binding_level)
	ld	 r13,r12,32
	mask	 r13,r13,3584
	cmp	 r13,r13,512
	bb1	 ne,r13,@L449
	or	 r20,r0,1
@L449:
	ld	 r24,r0,r12
	bcnd.n	 eq0,r24,@L452
	or	 r25,r0,r24
	or.u	 r23,r0,0x1d00
@L454:
	ld	 r12,r25,8
	mask.u	 r13,r12,0xff01
	cmp	 r13,r13,r23
	bb1	 ne,r13,@L453
	ld	 r13,r25,48
	bcnd	 eq0,r13,@L453
	bb0	 (31-11),r12,@L453
	bsr.n	 _output_inline_function
	or	 r2,r0,r25
@L453:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L454
@L452:
	ld	 r13,r22,lo16(_current_binding_level)
	ld	 r12,r13,24
	cmp	 r13,r12,0
	extu	 r16,r13,1<ne>
	bcnd.n	 eq0,r16,@L457
	or	 r23,r0,0
	br.n	 @L458
	or	 r23,r0,r12
	align	 4
@L457:
	subu	 r13,r0,r18
	or	 r13,r13,r20
	bcnd	 eq0,r13,@L458
	bsr.n	 _make_node
	or	 r2,r0,5
	or	 r23,r0,r2
@L458:
	bcnd	 eq0,r23,@L460
	st	 r24,r23,16
	st	 r19,r23,20
	or	 r2,r0,r23
	bsr.n	 _remember_end_note
	st	 r21,r23,24
@L460:
	bcnd	 lt0,r20,@L461
	bcnd.n	 eq0,r21,@L461
	or	 r25,r0,r21
@L465:
	st	 r23,r25,28
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L465
@L461:
	or	 r25,r0,r24
	bcnd	 eq0,r25,@L468
@L470:
	ld	 r13,r25,32
	bcnd	 eq0,r13,@L469
	ld	 r13,r25,28
	bb0	 (31-8),r13,@L472
	ld	 r13,r25,8
	bb0	 (31-16),r13,@L598
	ld	 r12,r25,60
	ld	 r13,r12,8
	or	 r13,r13,32768
	st	 r13,r12,8
	ld	 r13,r25,8
@L598:
	bb0	 (31-11),r13,@L472
	ld	 r12,r25,60
	ld	 r13,r12,8
	or.u	 r13,r13,0x10
	st	 r13,r12,8
@L472:
	ld	 r13,r25,32
	st	 r0,r13,24
@L469:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L470
@L468:
	ld	 r13,r22,lo16(_current_binding_level)
	ld	 r25,r13,8
	bcnd	 eq0,r25,@L592
@L479:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,24
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L479
	ld	 r13,r22,lo16(_current_binding_level)
@L592:
	ld	 r25,r13,12
	bcnd	 eq0,r25,@L482
@L484:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,28
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L484
@L482:
	ld	 r13,r22,lo16(_current_binding_level)
	ld	 r25,r13,16
	bcnd	 eq0,r25,@L487
@L489:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,4
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L489
@L487:
	bcnd.n	 eq0,r18,@L491
	or.u	 r13,r0,hi16(_named_labels)
	ld	 r25,r13,lo16(_named_labels)
	bcnd.n	 eq0,r25,@L599
	st	 r0,r23,16
@L495:
	ld	 r24,r25,16
	ld	 r13,r24,48
	bcnd.n	 ne0,r13,@L496
	or.u	 r13,r0,hi16(_warn_unused)
	or.u	 r3,r0,hi16(@LC1)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC1)
	ld	 r4,r24,32
	or.u	 r13,r0,hi16(_input_filename)
	ld	 r2,r13,lo16(_input_filename)
	or	 r3,r0,1
	bsr.n	 _define_label
	addu	 r1,r1,@L600
@L601:
	align	 4
@L496:
	ld	 r13,r13,lo16(_warn_unused)
	bcnd	 eq0,r13,@L497
	ld	 r13,r24,8
	bb1	 (31-16),r13,@L497
	or.u	 r3,r0,hi16(@LC2)
	or	 r2,r0,r24
	bsr.n	 _warning_with_decl
	or	 r3,r3,lo16(@LC2)
@L497:
	ld	 r13,r24,32
	ld	 r13,r13,36
	bcnd.n	 ne0,r13,@L500
	or	 r2,r0,1
	bsr.n	 _perm_calloc
	or	 r3,r0,20
	ld	 r13,r24,32
	st	 r2,r13,36
@L500:
	ld	 r13,r24,32
	ld	 r13,r13,36
	st	 r0,r0,r13
	ld	 r13,r23,16
	st	 r13,r0,r24
	st	 r24,r23,16
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L495
	or.u	 r13,r0,hi16(_named_labels)
@L599:
	st	 r0,r13,lo16(_named_labels)
@L491:
	ld	 r10,r22,lo16(_current_binding_level)
	ld	 r11,r10,28
	bcnd.n	 eq0,r11,@L502
	or.u	 r13,r0,hi16(_named_label_uses)
	ld	 r12,r13,lo16(_named_label_uses)
	bcnd	 eq0,r12,@L502
@L506:
	ld	 r13,r12,4
	cmp	 r13,r13,r10
	bb1	 ne,r13,@L505
	st	 r11,r12,4
	ld	 r13,r0,r11
	st	 r13,r12,12
@L505:
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L506
@L502:
	ld	 r11,r22,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r11,32
	ld	 r13,r13,lo16(_global_binding_level)
	bcnd.n	 eq0,r13,@L510
	extu	 r25,r12,3<9>
	cmp	 r13,r11,r13
	bb1.n	 ne,r13,@L593
	or.u	 r11,r0,hi16(_free_binding_level)
	bsr.n	 _my_friendly_abort
	or	 r2,r0,123
@L510:
	or.u	 r11,r0,hi16(_free_binding_level)
@L593:
	ld	 r12,r22,lo16(_current_binding_level)
	ld	 r13,r11,lo16(_free_binding_level)
	ld	 r10,r12,28
	st	 r13,r12,28
	ld	 r13,r10,32
	mask	 r13,r13,61440
	st	 r12,r11,lo16(_free_binding_level)
	cmp	 r13,r13,8192
	bb0.n	 eq,r13,@L509
	st	 r10,r22,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_class_binding_level)
	st	 r10,r13,lo16(_class_binding_level)
@L513:
	ld	 r13,r22,lo16(_current_binding_level)
	ld	 r12,r13,28
	ld	 r13,r12,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb1.n	 eq,r13,@L513
	st	 r12,r22,lo16(_current_binding_level)
@L509:
	bcnd.n	 eq0,r18,@L517
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r13,r13,lo16(_current_function_decl)
	br.n	 @L518
	st	 r23,r13,48
	align	 4
@L517:
	bcnd	 eq0,r23,@L519
	bcnd.n	 ne0,r16,@L594
	cmp	 r13,r25,2
	ld	 r13,r22,lo16(_current_binding_level)
	ld	 r2,r13,20
	br.n	 @L590
	or	 r3,r0,r23
	align	 4
@L519:
	bcnd.n	 eq0,r21,@L518
	cmp	 r13,r20,2
	bb1.n	 ne,r13,@L523
	or	 r3,r0,r21
	ld	 r13,r22,lo16(_current_binding_level)
	ld	 r3,r13,20
	br.n	 @L590
	or	 r2,r0,r21
	align	 4
@L523:
	ld	 r13,r22,lo16(_current_binding_level)
	ld	 r2,r13,20
@L590:
	bsr	 _chainon
	ld	 r13,r22,lo16(_current_binding_level)
	st	 r2,r13,20
@L518:
	cmp	 r13,r25,2
@L594:
	cmp	 r12,r17,0
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L525
	bsr	 _getdecls
	or	 r3,r0,r20
	bsr.n	 _expand_end_bindings
	or	 r4,r0,1
	or	 r2,r0,r20
	or	 r3,r0,0
	bsr.n	 _poplevel
	or	 r4,r0,r15
	or	 r23,r0,r2
@L525:
	bcnd	 eq0,r23,@L526
	ld	 r13,r23,8
	or	 r13,r13,32768
	st	 r13,r23,8
@L526:
	or.u	 r12,r0,hi16(_current_binding_level)
	ld	 r13,r12,lo16(_current_binding_level)
	bcnd.n	 eq0,r13,@L551
	or.u	 r13,r0,hi16(_class_binding_level)
	ld	 r13,r13,lo16(_class_binding_level)
	bcnd.n	 eq0,r13,@L439
	or.u	 r13,r0,hi16(_class_binding_level)
	br	 @L595
	align	 4
@L551:
	or.u	 r2,r0,hi16(@LC3)
	bsr.n	 _fatal
	or	 r2,r2,lo16(@LC3)
	or.u	 r13,r0,hi16(_class_binding_level)
@L595:
	ld	 r25,r13,lo16(_class_binding_level)
@L436:
	or.u	 r13,r0,hi16(_decl_stack)
	ld	 r2,r13,lo16(_decl_stack)
	ld	 r13,r2,4
	ld	 r9,r2,8
	ld	 r12,r13,12
	cmp	 r10,r12,r9
	bb0.n	 ne,r10,@L531
	subu	 r13,r9,r12
	bb1.n	 le,r10,@L557
	mask	 r11,r13,15
	bcnd.n	 eq0,r11,@L596
	subu	 r13,r12,4
	cmp	 r13,r11,12
	bb1.n	 ge,r13,@L557
	cmp	 r13,r11,8
	bb1.n	 ge,r13,@L558
	cmp	 r13,r11,3
	bb0.n	 gt,r13,@L596
	subu	 r13,r12,4
	subu	 r12,r12,4
	ld	 r13,r0,r12
	bcnd	 eq0,r13,@L558
	ld	 r13,r13,32
	st	 r0,r13,28
@L558:
	subu	 r12,r12,4
	ld	 r13,r0,r12
	bcnd	 eq0,r13,@L557
	ld	 r13,r13,32
	st	 r0,r13,28
@L557:
	br.n	 @L591
	subu	 r12,r12,4
	align	 4
@L532:
@L596:
	ld	 r13,r0,r13
	bcnd	 eq0,r13,@L569
	ld	 r13,r13,32
	st	 r0,r13,28
@L569:
	subu	 r13,r12,8
	ld	 r13,r0,r13
	bcnd	 eq0,r13,@L572
	ld	 r13,r13,32
	st	 r0,r13,28
@L572:
	subu	 r13,r12,12
	ld	 r13,r0,r13
	bcnd	 eq0,r13,@L575
	ld	 r13,r13,32
	st	 r0,r13,28
@L575:
	subu	 r12,r12,16
@L591:
	ld	 r13,r0,r12
	bcnd	 eq0,r13,@L578
	ld	 r13,r13,32
	st	 r0,r13,28
@L578:
	cmp	 r13,r12,r9
	bb1.n	 ne,r13,@L532
	subu	 r13,r12,4
@L531:
	bsr	 _pop_stack_level
	ld	 r11,r25,8
	or.u	 r13,r0,hi16(_decl_stack)
	bcnd.n	 eq0,r11,@L536
	st	 r2,r13,lo16(_decl_stack)
@L538:
	ld	 r12,r11,12
	ld	 r13,r11,16
	st	 r13,r12,24
	ld	 r11,r0,r11
	bcnd	 ne0,r11,@L538
@L536:
	ld	 r11,r25,12
	bcnd	 eq0,r11,@L541
@L543:
	ld	 r12,r11,12
	ld	 r13,r11,16
	st	 r13,r12,28
	ld	 r11,r0,r11
	bcnd	 ne0,r11,@L543
@L541:
	ld	 r11,r25,16
	bcnd.n	 eq0,r11,@L597
	or.u	 r24,r0,hi16(_class_binding_level)
@L548:
	ld	 r12,r11,12
	ld	 r13,r11,16
	st	 r13,r12,4
	ld	 r11,r0,r11
	bcnd.n	 ne0,r11,@L548
	or.u	 r24,r0,hi16(_class_binding_level)
@L597:
	ld	 r2,r24,lo16(_class_binding_level)
	ld	 r6,r2,32
	extu	 r4,r6,4<12>
	extu	 r5,r6,3<9>
	ld	 r3,r2,28
	bsr.n	 _GNU_xref_end_scope
	extu	 r6,r6,1<8>
	ld	 r12,r25,28
	ld	 r13,r12,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb0.n	 ne,r13,@L550
	st	 r12,r24,lo16(_class_binding_level)
	st	 r0,r24,lo16(_class_binding_level)
@L550:
	or.u	 r12,r0,hi16(_free_binding_level)
	ld	 r13,r12,lo16(_free_binding_level)
	st	 r13,r25,28
@Lte19:
	ld	 r1,r31,80
	ld	 r15,r31,36
	st	 r25,r12,lo16(_free_binding_level)
	ld.d	 r24,r31,72
	or	 r2,r0,r23
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	jmp.n	 r1
	addu	 r31,r31,96
	def	 @L600,@L497-@L601

	global	 _no_print_functions
data
	align	 4
_no_print_functions:
	word	 0
	global	 _no_print_builtins
	align	 4
_no_print_builtins:
	word	 0
	align	 8
@LC4:
	string	 " blocks=\000"
	align	 8
@LC5:
	string	 "%x\000"
	align	 8
@LC6:
	string	 " n_incomplete=%d parm_flag=%d keep=%d\000"
	align	 8
@LC7:
	string	 " tag-transparent\000"
	align	 8
@LC8:
	string	 " more-cleanups-ok\000"
	align	 8
@LC9:
	string	 " have-cleanups\000"
	align	 8
@LC10:
	string	 " more-exceptions-ok\000"
	align	 8
@LC11:
	string	 " have-exceptions\000"
	align	 8
@LC12:
	string	 "\n\000"
	align	 8
@LC13:
	string	 " names:\t\000"
	align	 8
@LC14:
	string	 "<built-in>\000"
	align	 8
@LC15:
	string	 "\n\t\000"
	align	 8
@LC16:
	string	 "\000"
	align	 8
@LC17:
	string	 "\n\000"
	align	 8
@LC18:
	string	 " tags:\t\000"
	align	 8
@LC19:
	string	 "\n\t\000"
	align	 8
@LC20:
	string	 "<unnamed-typedef\000"
	align	 8
@LC21:
	string	 ">\000"
	align	 8
@LC22:
	string	 "\000"
	align	 8
@LC23:
	string	 "<typedef\000"
	align	 8
@LC24:
	string	 "\000"
	align	 8
@LC25:
	string	 ">\000"
	align	 8
@LC26:
	string	 "\n\000"
	align	 8
@LC27:
	string	 " shadowed:\000"
	align	 8
@LC28:
	string	 " %s \000"
	align	 8
@LC29:
	string	 "\n\000"
	align	 8
@LC30:
	string	 " class-shadowed:\000"
	align	 8
@LC31:
	string	 " %s \000"
	align	 8
@LC32:
	string	 "\n\000"
	align	 8
@LC33:
	string	 " type-shadowed:\000"
	align	 8
@LC34:
	string	 " %s \000"
	align	 8
@LC35:
	string	 "\n\000"
text
	align	 8
	global	 _print_binding_level
_print_binding_level:
	subu	 r31,r31,80
	or.u	 r3,r0,hi16(@LC4)
	st.d	 r22,r31,48
	or	 r22,r0,r2
	st.d	 r20,r31,40
	or.u	 r21,r0,hi16(__iob+64)
	st.d	 r24,r31,56
	or	 r25,r21,lo16(__iob+64)
	or	 r3,r3,lo16(@LC4)
	st	 r1,r31,64
@Ltb20:
	bsr.n	 _fprintf
	or	 r2,r0,r25
	or.u	 r3,r0,hi16(@LC5)
	or	 r2,r0,r25
	ld	 r4,r22,20
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC5)
	or	 r2,r0,r25
	ld	 r6,r22,32
	or.u	 r3,r0,hi16(@LC6)
	ld.hu	 r4,r22,32
	extu	 r5,r6,4<12>
	or	 r3,r3,lo16(@LC6)
	bsr.n	 _fprintf
	extu	 r6,r6,3<9>
	ld	 r13,r22,32
	bb0.n	 (31-23),r13,@L713
	or	 r23,r0,0
	or.u	 r3,r0,hi16(@LC7)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC7)
	ld	 r13,r22,32
@L713:
	bb0	 (31-24),r13,@L657
	or.u	 r3,r0,hi16(@LC8)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC8)
@L657:
	ld	 r13,r22,32
	bb0	 (31-25),r13,@L714
	or.u	 r3,r0,hi16(@LC9)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC9)
	ld	 r13,r22,32
@L714:
	bb0	 (31-26),r13,@L659
	or.u	 r3,r0,hi16(@LC10)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC10)
@L659:
	ld	 r13,r22,32
	bb0	 (31-27),r13,@L660
	or.u	 r3,r0,hi16(@LC11)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC11)
@L660:
	or.u	 r3,r0,hi16(@LC12)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC12)
	ld	 r13,r0,r22
	bcnd	 eq0,r13,@L661
	or.u	 r3,r0,hi16(@LC13)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC13)
	ld	 r24,r0,r22
	bcnd.n	 eq0,r24,@L663
	or.u	 r13,r0,hi16(_no_print_functions)
@L712:
	ld	 r13,r13,lo16(_no_print_functions)
	bcnd	 eq0,r13,@L666
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1	 eq,r13,@L664
@L666:
	or.u	 r13,r0,hi16(_no_print_builtins)
	ld	 r13,r13,lo16(_no_print_builtins)
	bcnd	 eq0,r13,@L667
	ld.bu	 r13,r24,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L667
	or.u	 r3,r0,hi16(@LC14)
	ld	 r2,r24,12
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC14)
	bcnd	 eq0,r2,@L664
@L667:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	ext	 r13,r13,1<eq>
	mask	 r13,r13,3
	or	 r25,r13,2
	addu	 r23,r23,r25
	cmp	 r13,r23,6
	bb0	 gt,r13,@L670
	or.u	 r3,r0,hi16(@LC15)
	or	 r2,r21,lo16(__iob+64)
	or	 r3,r3,lo16(@LC15)
	bsr.n	 _fprintf
	or	 r23,r0,r25
@L670:
	or	 r2,r21,lo16(__iob+64)
	or	 r4,r0,r24
	or.u	 r3,r0,hi16(@LC16)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC16)
	ld.bu	 r13,r24,8
	bcnd	 eq0,r13,@L663
@L664:
	ld	 r24,r0,r24
	bcnd.n	 ne0,r24,@L712
	or.u	 r13,r0,hi16(_no_print_functions)
@L663:
	bcnd.n	 eq0,r23,@L661
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC17)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC17)
@L661:
	ld	 r13,r22,4
	bcnd	 eq0,r13,@L674
	or.u	 r21,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC18)
	or	 r25,r21,lo16(__iob+64)
	or	 r3,r3,lo16(@LC18)
	bsr.n	 _fprintf
	or	 r2,r0,r25
	ld	 r24,r22,4
	bcnd.n	 eq0,r24,@L676
	or	 r23,r0,0
	or	 r20,r0,r21
	or	 r21,r0,r25
@L678:
	ld	 r12,r24,12
	bcnd	 ne0,r12,@L679
	or	 r25,r0,3
	br.n	 @L715
	addu	 r23,r23,r25
	align	 4
@L679:
	ld	 r13,r24,16
	ld	 r13,r13,48
	ld	 r13,r13,32
	cmp	 r13,r12,r13
	bb1.n	 ne,r13,@L680
	or	 r25,r0,4
	or	 r25,r0,2
@L680:
	addu	 r23,r23,r25
@L715:
	cmp	 r13,r23,5
	bb0.n	 gt,r13,@L683
	or.u	 r3,r0,hi16(@LC19)
	or	 r2,r20,lo16(__iob+64)
	or	 r3,r3,lo16(@LC19)
	bsr.n	 _fprintf
	or	 r23,r0,r25
@L683:
	ld	 r4,r24,12
	bcnd	 ne0,r4,@L684
	ld	 r4,r24,16
	or	 r2,r0,r21
	or.u	 r3,r0,hi16(@LC20)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC20)
	or.u	 r3,r0,hi16(@LC21)
	or	 r2,r0,r21
	br.n	 @L711
	or	 r3,r3,lo16(@LC21)
	align	 4
@L684:
	ld	 r12,r24,16
	ld	 r13,r12,48
	ld	 r13,r13,32
	cmp	 r13,r4,r13
	bb1.n	 ne,r13,@L686
	or	 r2,r0,r21
	or	 r2,r20,lo16(__iob+64)
	or	 r4,r0,r12
	or.u	 r3,r0,hi16(@LC22)
	or	 r5,r0,0
	or	 r3,r3,lo16(@LC22)
	bsr.n	 _print_node_brief
	addu	 r1,r1,@L716
@L717:
	align	 4
@L686:
	or.u	 r3,r0,hi16(@LC23)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC23)
	ld	 r4,r24,16
	or	 r2,r0,r21
	or.u	 r3,r0,hi16(@LC24)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC24)
	or.u	 r3,r0,hi16(@LC25)
	or	 r2,r0,r21
	or	 r3,r3,lo16(@LC25)
@L711:
	bsr	 _fprintf
@L677:
	ld	 r24,r0,r24
	bcnd	 ne0,r24,@L678
@L676:
	bcnd.n	 eq0,r23,@L674
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC26)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC26)
@L674:
	ld	 r13,r22,8
	bcnd	 eq0,r13,@L690
	or.u	 r25,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC27)
	or	 r2,r25,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC27)
	ld	 r24,r22,8
	bcnd	 eq0,r24,@L692
	or	 r23,r0,r25
	or.u	 r25,r0,hi16(@LC28)
@L694:
	ld	 r13,r24,12
	or	 r2,r23,lo16(__iob+64)
	ld	 r4,r13,16
	bsr.n	 _fprintf
	or	 r3,r25,lo16(@LC28)
	ld	 r24,r0,r24
	bcnd	 ne0,r24,@L694
@L692:
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC29)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC29)
@L690:
	ld	 r13,r22,12
	bcnd	 eq0,r13,@L696
	or.u	 r25,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC30)
	or	 r2,r25,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC30)
	ld	 r24,r22,12
	bcnd	 eq0,r24,@L698
	or	 r23,r0,r25
	or.u	 r25,r0,hi16(@LC31)
@L700:
	ld	 r13,r24,12
	or	 r2,r23,lo16(__iob+64)
	ld	 r4,r13,16
	bsr.n	 _fprintf
	or	 r3,r25,lo16(@LC31)
	ld	 r24,r0,r24
	bcnd	 ne0,r24,@L700
@L698:
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC32)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC32)
@L696:
	ld	 r13,r22,16
	bcnd.n	 eq0,r13,@L702
	or.u	 r25,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC33)
	or	 r2,r25,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC33)
	ld	 r24,r22,16
	bcnd.n	 eq0,r24,@L704
	or	 r23,r0,r25
	or.u	 r25,r0,hi16(@LC34)
@L706:
	ld	 r13,r24,12
	or	 r2,r23,lo16(__iob+64)
	ld	 r4,r13,16
	bsr.n	 _fprintf
	or	 r3,r25,lo16(@LC34)
	ld	 r24,r0,r24
	bcnd	 ne0,r24,@L706
@L704:
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC35)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC35)
@L702:
@Lte20:
	ld	 r1,r31,64
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80
	def	 @L716,@L677-@L717

data
	align	 8
@LC36:
	string	 "binding level \000"
	align	 8
@LC37:
	string	 "%x\000"
	align	 8
@LC38:
	string	 "\n\000"
text
	align	 8
	global	 _print_other_binding_stack
_print_other_binding_stack:
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	subu	 r31,r31,80
	st	 r1,r31,64
	st.d	 r22,r31,48
	or	 r22,r0,r2
	st.d	 r24,r31,56
	cmp	 r13,r22,r13
	bb0.n	 ne,r13,@L779
	st.d	 r20,r31,40
@Ltb21:
	or.u	 r20,r0,hi16(__iob+64)
	or	 r21,r20,lo16(__iob+64)
	or.u	 r3,r0,hi16(@LC36)
@L842:
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC36)
	or	 r2,r0,r21
	or.u	 r3,r0,hi16(@LC37)
	or	 r4,r0,r22
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC37)
	or.u	 r3,r0,hi16(@LC38)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC38)
	or.u	 r3,r0,hi16(@LC4)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC4)
	ld	 r4,r22,20
	or.u	 r3,r0,hi16(@LC5)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC5)
	ld.hu	 r4,r22,32
	ld	 r6,r22,32
	or	 r2,r0,r21
	or.u	 r3,r0,hi16(@LC6)
	extu	 r5,r6,4<12>
	or	 r3,r3,lo16(@LC6)
	bsr.n	 _fprintf
	extu	 r6,r6,3<9>
	ld	 r13,r22,32
	bb0.n	 (31-23),r13,@L843
	or	 r23,r0,0
	or.u	 r3,r0,hi16(@LC7)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC7)
	ld	 r13,r22,32
@L843:
	bb0	 (31-24),r13,@L784
	or.u	 r3,r0,hi16(@LC8)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC8)
@L784:
	ld	 r13,r22,32
	bb0	 (31-25),r13,@L844
	or.u	 r3,r0,hi16(@LC9)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC9)
	ld	 r13,r22,32
@L844:
	bb0	 (31-26),r13,@L786
	or.u	 r3,r0,hi16(@LC10)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC10)
@L786:
	ld	 r13,r22,32
	bb0	 (31-27),r13,@L787
	or.u	 r3,r0,hi16(@LC11)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC11)
@L787:
	or.u	 r3,r0,hi16(@LC12)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC12)
	ld	 r13,r0,r22
	bcnd	 eq0,r13,@L788
	or.u	 r3,r0,hi16(@LC13)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC13)
	ld	 r25,r0,r22
	bcnd.n	 eq0,r25,@L790
	or.u	 r13,r0,hi16(_no_print_functions)
@L840:
	ld	 r13,r13,lo16(_no_print_functions)
	bcnd	 eq0,r13,@L793
	ld.bu	 r13,r25,8
	cmp	 r13,r13,29
	bb1	 eq,r13,@L791
@L793:
	or.u	 r13,r0,hi16(_no_print_builtins)
	ld	 r13,r13,lo16(_no_print_builtins)
	bcnd	 eq0,r13,@L794
	ld.bu	 r13,r25,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L794
	or.u	 r3,r0,hi16(@LC14)
	ld	 r2,r25,12
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC14)
	bcnd	 eq0,r2,@L791
@L794:
	ld.bu	 r13,r25,8
	cmp	 r13,r13,29
	ext	 r13,r13,1<eq>
	mask	 r13,r13,3
	or	 r24,r13,2
	addu	 r23,r23,r24
	cmp	 r13,r23,6
	bb0	 gt,r13,@L797
	or.u	 r3,r0,hi16(@LC15)
	or	 r2,r20,lo16(__iob+64)
	or	 r3,r3,lo16(@LC15)
	bsr.n	 _fprintf
	or	 r23,r0,r24
@L797:
	or	 r2,r20,lo16(__iob+64)
	or	 r4,r0,r25
	or.u	 r3,r0,hi16(@LC16)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC16)
	ld.bu	 r13,r25,8
	bcnd	 eq0,r13,@L790
@L791:
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L840
	or.u	 r13,r0,hi16(_no_print_functions)
@L790:
	bcnd	 eq0,r23,@L788
	or.u	 r3,r0,hi16(@LC17)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC17)
@L788:
	ld	 r13,r22,4
	bcnd	 eq0,r13,@L801
	or.u	 r3,r0,hi16(@LC18)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC18)
	ld	 r25,r22,4
	bcnd.n	 eq0,r25,@L803
	or	 r23,r0,0
@L805:
	ld	 r12,r25,12
	bcnd	 ne0,r12,@L806
	or	 r24,r0,3
	br.n	 @L845
	addu	 r23,r23,r24
	align	 4
@L806:
	ld	 r13,r25,16
	ld	 r13,r13,48
	ld	 r13,r13,32
	cmp	 r13,r12,r13
	bb1.n	 ne,r13,@L807
	or	 r24,r0,4
	or	 r24,r0,2
@L807:
	addu	 r23,r23,r24
@L845:
	cmp	 r13,r23,5
	bb0.n	 gt,r13,@L810
	or.u	 r3,r0,hi16(@LC19)
	or	 r2,r20,lo16(__iob+64)
	or	 r3,r3,lo16(@LC19)
	bsr.n	 _fprintf
	or	 r23,r0,r24
@L810:
	ld	 r4,r25,12
	bcnd	 ne0,r4,@L811
	ld	 r4,r25,16
	or	 r2,r0,r21
	or.u	 r3,r0,hi16(@LC20)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC20)
	or.u	 r3,r0,hi16(@LC21)
	or	 r2,r0,r21
	br.n	 @L839
	or	 r3,r3,lo16(@LC21)
	align	 4
@L811:
	ld	 r12,r25,16
	ld	 r13,r12,48
	ld	 r13,r13,32
	cmp	 r13,r4,r13
	bb1.n	 ne,r13,@L813
	or	 r2,r0,r21
	or	 r2,r20,lo16(__iob+64)
	or	 r4,r0,r12
	or.u	 r3,r0,hi16(@LC22)
	or	 r5,r0,0
	or	 r3,r3,lo16(@LC22)
	bsr.n	 _print_node_brief
	addu	 r1,r1,@L846
@L847:
	align	 4
@L813:
	or.u	 r3,r0,hi16(@LC23)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC23)
	ld	 r4,r25,16
	or	 r2,r0,r21
	or.u	 r3,r0,hi16(@LC24)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC24)
	or.u	 r3,r0,hi16(@LC25)
	or	 r2,r0,r21
	or	 r3,r3,lo16(@LC25)
@L839:
	bsr	 _fprintf
@L804:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L805
@L803:
	bcnd	 eq0,r23,@L801
	or.u	 r3,r0,hi16(@LC26)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC26)
@L801:
	ld	 r13,r22,8
	bcnd	 eq0,r13,@L817
	or.u	 r3,r0,hi16(@LC27)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC27)
	ld	 r25,r22,8
	bcnd	 eq0,r25,@L819
	or.u	 r24,r0,hi16(@LC28)
@L821:
	ld	 r13,r25,12
	or	 r2,r20,lo16(__iob+64)
	ld	 r4,r13,16
	bsr.n	 _fprintf
	or	 r3,r24,lo16(@LC28)
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L821
@L819:
	or.u	 r3,r0,hi16(@LC29)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC29)
@L817:
	ld	 r13,r22,12
	bcnd	 eq0,r13,@L823
	or.u	 r3,r0,hi16(@LC30)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC30)
	ld	 r25,r22,12
	bcnd	 eq0,r25,@L825
	or.u	 r24,r0,hi16(@LC31)
@L827:
	ld	 r13,r25,12
	or	 r2,r20,lo16(__iob+64)
	ld	 r4,r13,16
	bsr.n	 _fprintf
	or	 r3,r24,lo16(@LC31)
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L827
@L825:
	or.u	 r3,r0,hi16(@LC32)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC32)
@L823:
	ld	 r13,r22,16
	bcnd.n	 eq0,r13,@L841
	or.u	 r13,r0,hi16(_global_binding_level)
	or.u	 r3,r0,hi16(@LC33)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC33)
	ld	 r25,r22,16
	bcnd	 eq0,r25,@L831
	or.u	 r24,r0,hi16(@LC34)
@L833:
	ld	 r13,r25,12
	or	 r2,r20,lo16(__iob+64)
	ld	 r4,r13,16
	bsr.n	 _fprintf
	or	 r3,r24,lo16(@LC34)
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L833
@L831:
	or.u	 r3,r0,hi16(@LC35)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC35)
	or.u	 r13,r0,hi16(_global_binding_level)
@L841:
	ld	 r22,r22,28
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r22,r13
	bb1.n	 ne,r13,@L842
	or.u	 r3,r0,hi16(@LC36)
@L779:
@Lte21:
	ld	 r1,r31,64
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80
	def	 @L846,@L804-@L847

data
	align	 8
@LC39:
	string	 "current_binding_level=\000"
	align	 8
@LC40:
	string	 "%x\000"
	align	 8
@LC41:
	string	 "\nclass_binding_level=\000"
	align	 8
@LC42:
	string	 "%x\000"
	align	 8
@LC43:
	string	 "\nglobal_binding_level=\000"
	align	 8
@LC44:
	string	 "%x\000"
	align	 8
@LC45:
	string	 "\n\000"
	align	 8
@LC46:
	string	 "global:\n\000"
text
	align	 8
	global	 _print_binding_stack
_print_binding_stack:
	subu	 r31,r31,80
	st	 r1,r31,64
	st.d	 r24,r31,56
	or.u	 r3,r0,hi16(@LC39)
	st.d	 r22,r31,48
	or.u	 r25,r0,hi16(__iob+64)
	st.d	 r20,r31,40
@Ltb22:
	or	 r25,r25,lo16(__iob+64)
	or	 r3,r3,lo16(@LC39)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or.u	 r23,r0,hi16(_current_binding_level)
	ld	 r4,r23,lo16(_current_binding_level)
	or.u	 r3,r0,hi16(@LC40)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC40)
	or.u	 r3,r0,hi16(@LC41)
	or	 r2,r0,r25
	or	 r3,r3,lo16(@LC41)
	bsr.n	 _fprintf
	or.u	 r24,r0,hi16(_class_binding_level)
	ld	 r4,r24,lo16(_class_binding_level)
	or.u	 r3,r0,hi16(@LC42)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC42)
	or.u	 r3,r0,hi16(@LC43)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC43)
	or	 r2,r0,r25
	or.u	 r13,r0,hi16(_global_binding_level)
	or.u	 r3,r0,hi16(@LC44)
	ld	 r4,r13,lo16(_global_binding_level)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC44)
	or.u	 r3,r0,hi16(@LC45)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC45)
	ld	 r13,r24,lo16(_class_binding_level)
	bcnd.n	 eq0,r13,@L972
	or	 r4,r0,r13
	ld	 r12,r23,lo16(_current_binding_level)
	cmp	 r13,r4,r12
@L1103:
	bb0	 ne,r13,@L974
	ld	 r4,r4,28
	bcnd.n	 ne0,r4,@L1103
	cmp	 r13,r4,r12
@L974:
	bcnd.n	 eq0,r4,@L979
	or.u	 r13,r0,hi16(_class_binding_level)
	ld	 r4,r13,lo16(_class_binding_level)
	br.n	 @L1104
	or.u	 r13,r0,hi16(_global_binding_level)
	align	 4
@L979:
	br.n	 @L981
	or	 r4,r0,r12
	align	 4
@L972:
	ld	 r4,r23,lo16(_current_binding_level)
@L981:
	or.u	 r13,r0,hi16(_global_binding_level)
@L1104:
	ld	 r13,r13,lo16(_global_binding_level)
	or	 r22,r0,r4
	cmp	 r13,r22,r13
	bb0	 ne,r13,@L982
	or.u	 r20,r0,hi16(__iob+64)
	or	 r21,r20,lo16(__iob+64)
@L986:
	or.u	 r3,r0,hi16(@LC36)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC36)
	or	 r2,r0,r21
	or.u	 r3,r0,hi16(@LC37)
	or	 r4,r0,r22
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC37)
	or.u	 r3,r0,hi16(@LC38)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC38)
	or.u	 r3,r0,hi16(@LC4)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC4)
	ld	 r4,r22,20
	or.u	 r3,r0,hi16(@LC5)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC5)
	ld.hu	 r4,r22,32
	ld	 r6,r22,32
	or	 r2,r0,r21
	or.u	 r3,r0,hi16(@LC6)
	extu	 r5,r6,4<12>
	or	 r3,r3,lo16(@LC6)
	bsr.n	 _fprintf
	extu	 r6,r6,3<9>
	ld	 r13,r22,32
	bb0.n	 (31-23),r13,@L1108
	or	 r23,r0,0
	or.u	 r3,r0,hi16(@LC7)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC7)
	ld	 r13,r22,32
@L1108:
	bb0	 (31-24),r13,@L989
	or.u	 r3,r0,hi16(@LC8)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC8)
@L989:
	ld	 r13,r22,32
	bb0	 (31-25),r13,@L1109
	or.u	 r3,r0,hi16(@LC9)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC9)
	ld	 r13,r22,32
@L1109:
	bb0	 (31-26),r13,@L991
	or.u	 r3,r0,hi16(@LC10)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC10)
@L991:
	ld	 r13,r22,32
	bb0	 (31-27),r13,@L992
	or.u	 r3,r0,hi16(@LC11)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC11)
@L992:
	or.u	 r3,r0,hi16(@LC12)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC12)
	ld	 r13,r0,r22
	bcnd	 eq0,r13,@L993
	or.u	 r3,r0,hi16(@LC13)
	or	 r2,r0,r21
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC13)
	ld	 r25,r0,r22
	bcnd.n	 eq0,r25,@L995
	or.u	 r13,r0,hi16(_no_print_functions)
@L1105:
	ld	 r13,r13,lo16(_no_print_functions)
	bcnd	 eq0,r13,@L998
	ld.bu	 r13,r25,8
	cmp	 r13,r13,29
	bb1	 eq,r13,@L996
@L998:
	or.u	 r13,r0,hi16(_no_print_builtins)
	ld	 r13,r13,lo16(_no_print_builtins)
	bcnd	 eq0,r13,@L999
	ld.bu	 r13,r25,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L999
	or.u	 r3,r0,hi16(@LC14)
	ld	 r2,r25,12
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC14)
	bcnd	 eq0,r2,@L996
@L999:
	ld.bu	 r13,r25,8
	cmp	 r13,r13,29
	ext	 r13,r13,1<eq>
	mask	 r13,r13,3
	or	 r24,r13,2
	addu	 r23,r23,r24
	cmp	 r13,r23,6
	bb0	 gt,r13,@L1002
	or.u	 r3,r0,hi16(@LC15)
	or	 r2,r20,lo16(__iob+64)
	or	 r3,r3,lo16(@LC15)
	bsr.n	 _fprintf
	or	 r23,r0,r24
@L1002:
	or	 r2,r20,lo16(__iob+64)
	or	 r4,r0,r25
	or.u	 r3,r0,hi16(@LC16)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC16)
	ld.bu	 r13,r25,8
	bcnd	 eq0,r13,@L995
@L996:
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L1105
	or.u	 r13,r0,hi16(_no_print_functions)
@L995:
	bcnd	 eq0,r23,@L993
	or.u	 r3,r0,hi16(@LC17)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC17)
@L993:
	ld	 r13,r22,4
	bcnd	 eq0,r13,@L1006
	or.u	 r3,r0,hi16(@LC18)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC18)
	ld	 r25,r22,4
	bcnd.n	 eq0,r25,@L1008
	or	 r23,r0,0
@L1010:
	ld	 r12,r25,12
	bcnd	 ne0,r12,@L1011
	or	 r24,r0,3
	br.n	 @L1112
	addu	 r23,r23,r24
	align	 4
@L1011:
	ld	 r13,r25,16
	ld	 r13,r13,48
	ld	 r13,r13,32
	cmp	 r13,r12,r13
	bb1.n	 ne,r13,@L1012
	or	 r24,r0,4
	or	 r24,r0,2
@L1012:
	addu	 r23,r23,r24
@L1112:
	cmp	 r13,r23,5
	bb0.n	 gt,r13,@L1015
	or.u	 r3,r0,hi16(@LC19)
	or	 r2,r20,lo16(__iob+64)
	or	 r3,r3,lo16(@LC19)
	bsr.n	 _fprintf
	or	 r23,r0,r24
@L1015:
	ld	 r4,r25,12
	bcnd	 ne0,r4,@L1016
	ld	 r4,r25,16
	or	 r2,r0,r21
	or.u	 r3,r0,hi16(@LC20)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC20)
	or.u	 r3,r0,hi16(@LC21)
	or	 r2,r0,r21
	br.n	 @L1101
	or	 r3,r3,lo16(@LC21)
	align	 4
@L1016:
	ld	 r12,r25,16
	ld	 r13,r12,48
	ld	 r13,r13,32
	cmp	 r13,r4,r13
	bb1.n	 ne,r13,@L1018
	or	 r2,r0,r21
	or	 r2,r20,lo16(__iob+64)
	or	 r4,r0,r12
	or.u	 r3,r0,hi16(@LC22)
	or	 r5,r0,0
	or	 r3,r3,lo16(@LC22)
	bsr.n	 _print_node_brief
	addu	 r1,r1,@L1114
@L1115:
	align	 4
@L1018:
	or.u	 r3,r0,hi16(@LC23)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC23)
	ld	 r4,r25,16
	or	 r2,r0,r21
	or.u	 r3,r0,hi16(@LC24)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC24)
	or.u	 r3,r0,hi16(@LC25)
	or	 r2,r0,r21
	or	 r3,r3,lo16(@LC25)
@L1101:
	bsr	 _fprintf
@L1009:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L1010
@L1008:
	bcnd	 eq0,r23,@L1006
	or.u	 r3,r0,hi16(@LC26)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC26)
@L1006:
	ld	 r13,r22,8
	bcnd	 eq0,r13,@L1022
	or.u	 r3,r0,hi16(@LC27)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC27)
	ld	 r25,r22,8
	bcnd	 eq0,r25,@L1024
	or.u	 r24,r0,hi16(@LC28)
@L1026:
	ld	 r13,r25,12
	or	 r2,r20,lo16(__iob+64)
	ld	 r4,r13,16
	bsr.n	 _fprintf
	or	 r3,r24,lo16(@LC28)
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L1026
@L1024:
	or.u	 r3,r0,hi16(@LC29)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC29)
@L1022:
	ld	 r13,r22,12
	bcnd	 eq0,r13,@L1028
	or.u	 r3,r0,hi16(@LC30)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC30)
	ld	 r25,r22,12
	bcnd	 eq0,r25,@L1030
	or.u	 r24,r0,hi16(@LC31)
@L1032:
	ld	 r13,r25,12
	or	 r2,r20,lo16(__iob+64)
	ld	 r4,r13,16
	bsr.n	 _fprintf
	or	 r3,r24,lo16(@LC31)
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L1032
@L1030:
	or.u	 r3,r0,hi16(@LC32)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC32)
@L1028:
	ld	 r13,r22,16
	bcnd.n	 eq0,r13,@L1106
	or.u	 r13,r0,hi16(_global_binding_level)
	or.u	 r3,r0,hi16(@LC33)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC33)
	ld	 r25,r22,16
	bcnd	 eq0,r25,@L1036
	or.u	 r24,r0,hi16(@LC34)
@L1038:
	ld	 r13,r25,12
	or	 r2,r20,lo16(__iob+64)
	ld	 r4,r13,16
	bsr.n	 _fprintf
	or	 r3,r24,lo16(@LC34)
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L1038
@L1036:
	or.u	 r3,r0,hi16(@LC35)
	or	 r2,r20,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC35)
	or.u	 r13,r0,hi16(_global_binding_level)
@L1106:
	ld	 r22,r22,28
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r22,r13
	bb1	 ne,r13,@L986
@L982:
	or.u	 r21,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC46)
	or	 r25,r21,lo16(__iob+64)
	or	 r3,r3,lo16(@LC46)
	bsr.n	 _fprintf
	or	 r2,r0,r25
	or	 r2,r0,r25
	or.u	 r3,r0,hi16(@LC4)
	or.u	 r13,r0,hi16(_global_binding_level)
	or	 r3,r3,lo16(@LC4)
	bsr.n	 _fprintf
	ld	 r22,r13,lo16(_global_binding_level)
	or	 r2,r0,r25
	or.u	 r3,r0,hi16(@LC5)
	ld	 r4,r22,20
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC5)
	ld.hu	 r4,r22,32
	ld	 r6,r22,32
	or	 r2,r0,r25
	or.u	 r3,r0,hi16(@LC6)
	extu	 r5,r6,4<12>
	or	 r3,r3,lo16(@LC6)
	bsr.n	 _fprintf
	extu	 r6,r6,3<9>
	ld	 r13,r22,32
	bb0.n	 (31-23),r13,@L1110
	or	 r23,r0,0
	or.u	 r3,r0,hi16(@LC7)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC7)
	ld	 r13,r22,32
@L1110:
	bb0	 (31-24),r13,@L1043
	or.u	 r3,r0,hi16(@LC8)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC8)
@L1043:
	ld	 r13,r22,32
	bb0	 (31-25),r13,@L1111
	or.u	 r3,r0,hi16(@LC9)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC9)
	ld	 r13,r22,32
@L1111:
	bb0	 (31-26),r13,@L1045
	or.u	 r3,r0,hi16(@LC10)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC10)
@L1045:
	ld	 r13,r22,32
	bb0	 (31-27),r13,@L1046
	or.u	 r3,r0,hi16(@LC11)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC11)
@L1046:
	or.u	 r3,r0,hi16(@LC12)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC12)
	ld	 r13,r0,r22
	bcnd	 eq0,r13,@L1047
	or.u	 r3,r0,hi16(@LC13)
	or	 r2,r0,r25
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC13)
	ld	 r24,r0,r22
	bcnd.n	 eq0,r24,@L1049
	or.u	 r13,r0,hi16(_no_print_functions)
@L1107:
	ld	 r13,r13,lo16(_no_print_functions)
	bcnd	 eq0,r13,@L1052
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1	 eq,r13,@L1050
@L1052:
	or.u	 r13,r0,hi16(_no_print_builtins)
	ld	 r13,r13,lo16(_no_print_builtins)
	bcnd	 eq0,r13,@L1053
	ld.bu	 r13,r24,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L1053
	or.u	 r3,r0,hi16(@LC14)
	ld	 r2,r24,12
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC14)
	bcnd	 eq0,r2,@L1050
@L1053:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	ext	 r13,r13,1<eq>
	mask	 r13,r13,3
	or	 r25,r13,2
	addu	 r23,r23,r25
	cmp	 r13,r23,6
	bb0	 gt,r13,@L1056
	or.u	 r3,r0,hi16(@LC15)
	or	 r2,r21,lo16(__iob+64)
	or	 r3,r3,lo16(@LC15)
	bsr.n	 _fprintf
	or	 r23,r0,r25
@L1056:
	or	 r2,r21,lo16(__iob+64)
	or	 r4,r0,r24
	or.u	 r3,r0,hi16(@LC16)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC16)
	ld.bu	 r13,r24,8
	bcnd	 eq0,r13,@L1049
@L1050:
	ld	 r24,r0,r24
	bcnd.n	 ne0,r24,@L1107
	or.u	 r13,r0,hi16(_no_print_functions)
@L1049:
	bcnd.n	 eq0,r23,@L1047
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC17)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC17)
@L1047:
	ld	 r13,r22,4
	bcnd	 eq0,r13,@L1060
	or.u	 r21,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC18)
	or	 r25,r21,lo16(__iob+64)
	or	 r3,r3,lo16(@LC18)
	bsr.n	 _fprintf
	or	 r2,r0,r25
	ld	 r24,r22,4
	bcnd.n	 eq0,r24,@L1062
	or	 r23,r0,0
	or	 r20,r0,r21
	or	 r21,r0,r25
@L1064:
	ld	 r12,r24,12
	bcnd	 ne0,r12,@L1065
	or	 r25,r0,3
	br.n	 @L1113
	addu	 r23,r23,r25
	align	 4
@L1065:
	ld	 r13,r24,16
	ld	 r13,r13,48
	ld	 r13,r13,32
	cmp	 r13,r12,r13
	bb1.n	 ne,r13,@L1066
	or	 r25,r0,4
	or	 r25,r0,2
@L1066:
	addu	 r23,r23,r25
@L1113:
	cmp	 r13,r23,5
	bb0.n	 gt,r13,@L1069
	or.u	 r3,r0,hi16(@LC19)
	or	 r2,r20,lo16(__iob+64)
	or	 r3,r3,lo16(@LC19)
	bsr.n	 _fprintf
	or	 r23,r0,r25
@L1069:
	ld	 r4,r24,12
	bcnd	 ne0,r4,@L1070
	ld	 r4,r24,16
	or	 r2,r0,r21
	or.u	 r3,r0,hi16(@LC20)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC20)
	or.u	 r3,r0,hi16(@LC21)
	or	 r2,r0,r21
	br.n	 @L1102
	or	 r3,r3,lo16(@LC21)
	align	 4
@L1070:
	ld	 r12,r24,16
	ld	 r13,r12,48
	ld	 r13,r13,32
	cmp	 r13,r4,r13
	bb1.n	 ne,r13,@L1072
	or	 r2,r0,r21
	or	 r2,r20,lo16(__iob+64)
	or	 r4,r0,r12
	or.u	 r3,r0,hi16(@LC22)
	or	 r5,r0,0
	or	 r3,r3,lo16(@LC22)
	bsr.n	 _print_node_brief
	addu	 r1,r1,@L1116
@L1117:
	align	 4
@L1072:
	or.u	 r3,r0,hi16(@LC23)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC23)
	ld	 r4,r24,16
	or	 r2,r0,r21
	or.u	 r3,r0,hi16(@LC24)
	or	 r5,r0,0
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC24)
	or.u	 r3,r0,hi16(@LC25)
	or	 r2,r0,r21
	or	 r3,r3,lo16(@LC25)
@L1102:
	bsr	 _fprintf
@L1063:
	ld	 r24,r0,r24
	bcnd	 ne0,r24,@L1064
@L1062:
	bcnd.n	 eq0,r23,@L1060
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC26)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC26)
@L1060:
	ld	 r13,r22,8
	bcnd	 eq0,r13,@L1076
	or.u	 r25,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC27)
	or	 r2,r25,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC27)
	ld	 r24,r22,8
	bcnd	 eq0,r24,@L1078
	or	 r23,r0,r25
	or.u	 r25,r0,hi16(@LC28)
@L1080:
	ld	 r13,r24,12
	or	 r2,r23,lo16(__iob+64)
	ld	 r4,r13,16
	bsr.n	 _fprintf
	or	 r3,r25,lo16(@LC28)
	ld	 r24,r0,r24
	bcnd	 ne0,r24,@L1080
@L1078:
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC29)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC29)
@L1076:
	ld	 r13,r22,12
	bcnd	 eq0,r13,@L1082
	or.u	 r25,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC30)
	or	 r2,r25,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC30)
	ld	 r24,r22,12
	bcnd	 eq0,r24,@L1084
	or	 r23,r0,r25
	or.u	 r25,r0,hi16(@LC31)
@L1086:
	ld	 r13,r24,12
	or	 r2,r23,lo16(__iob+64)
	ld	 r4,r13,16
	bsr.n	 _fprintf
	or	 r3,r25,lo16(@LC31)
	ld	 r24,r0,r24
	bcnd	 ne0,r24,@L1086
@L1084:
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC32)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC32)
@L1082:
	ld	 r13,r22,16
	bcnd.n	 eq0,r13,@L1041
	or.u	 r25,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC33)
	or	 r2,r25,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC33)
	ld	 r24,r22,16
	bcnd.n	 eq0,r24,@L1090
	or	 r23,r0,r25
	or.u	 r25,r0,hi16(@LC34)
@L1092:
	ld	 r13,r24,12
	or	 r2,r23,lo16(__iob+64)
	ld	 r4,r13,16
	bsr.n	 _fprintf
	or	 r3,r25,lo16(@LC34)
	ld	 r24,r0,r24
	bcnd	 ne0,r24,@L1092
@L1090:
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC35)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _fprintf
	or	 r3,r3,lo16(@LC35)
@L1041:
@Lte22:
	ld	 r1,r31,64
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80
	def	 @L1116,@L1063-@L1117
	def	 @L1114,@L1009-@L1115

	align	 8
	global	 _push_to_top_level
_push_to_top_level:
	subu	 r31,r31,80
	st	 r1,r31,64
	st	 r19,r31,36
	st.d	 r24,r31,56
	st.d	 r22,r31,48
	or	 r2,r0,32
	bsr.n	 _xmalloc
	st.d	 r20,r31,40
@Ltb23:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r22,r13,lo16(_current_binding_level)
	or	 r21,r0,0
	bcnd.n	 eq0,r22,@L1148
	or	 r20,r0,r2
	or.u	 r19,r0,hi16(_global_binding_level)
@L1150:
	ld	 r23,r0,r22
	bcnd	 eq0,r23,@L1152
@L1154:
	ld	 r13,r19,lo16(_global_binding_level)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1153
	ld	 r25,r23,60
	bcnd	 eq0,r25,@L1153
	ld	 r13,r25,24
	bcnd	 ne0,r13,@L1156
	ld	 r13,r25,28
	bcnd	 eq0,r13,@L1153
@L1156:
	bcnd.n	 eq0,r21,@L1159
	or	 r12,r0,r21
@L1161:
	ld	 r13,r12,16
	cmp	 r13,r13,r25
	bb1	 eq,r13,@L1153
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L1161
@L1159:
	bsr.n	 _make_tree_vec
	or	 r2,r0,4
	bcnd.n	 eq0,r25,@L1165
	or	 r24,r0,r2
	ld.bu	 r2,r25,8
	cmp	 r2,r2,1
	or	 r3,r0,135
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	st	 r25,r24,16
	ld	 r13,r25,4
	st	 r13,r24,20
	ld	 r13,r25,24
	st	 r13,r24,24
	ld	 r13,r25,28
	st	 r13,r24,28
	or	 r2,r0,r25
	st	 r0,r25,24
	bsr.n	 _adjust_type_value
	st	 r0,r2,28
@L1165:
	st	 r21,r0,r24
	or	 r21,r0,r24
@L1153:
	ld	 r23,r0,r23
	bcnd	 ne0,r23,@L1154
@L1152:
	ld	 r13,r19,lo16(_global_binding_level)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1149
	ld	 r23,r22,16
	bcnd	 eq0,r23,@L1149
@L1171:
	ld	 r12,r23,12
	ld	 r13,r23,16
	st	 r13,r12,4
	ld	 r23,r0,r23
	bcnd	 ne0,r23,@L1171
@L1149:
	ld	 r22,r22,28
	bcnd	 ne0,r22,@L1150
@L1148:
	or.u	 r7,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r25,r7,lo16(_current_binding_level)
	or.u	 r24,r0,hi16(_current_class_name)
	ld	 r2,r13,lo16(_global_binding_level)
	or.u	 r3,r0,hi16(_current_class_type)
	ld	 r4,r24,lo16(_current_class_name)
	or.u	 r10,r0,hi16(_current_class_decl)
	ld	 r6,r3,lo16(_current_class_type)
	or.u	 r5,r0,hi16(_current_function_decl)
	ld	 r11,r10,lo16(_current_class_decl)
	or.u	 r9,r0,hi16(_class_binding_level)
	ld	 r12,r5,lo16(_current_function_decl)
	or.u	 r8,r0,hi16(_current_saved_scope)
	ld	 r13,r9,lo16(_class_binding_level)
	ld	 r1,r8,lo16(_current_saved_scope)
	st	 r21,r20,4
	st	 r25,r0,r20
	st	 r4,r20,12
	st	 r6,r20,16
	st	 r11,r20,20
	st	 r12,r20,24
	st	 r13,r20,28
	st	 r1,r20,8
@Lte23:
	ld	 r1,r31,64
	ld	 r19,r31,36
	st	 r0,r24,lo16(_current_class_name)
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	st	 r20,r8,lo16(_current_saved_scope)
	ld.d	 r20,r31,40
	st	 r2,r7,lo16(_current_binding_level)
	st	 r0,r10,lo16(_current_class_decl)
	st	 r0,r3,lo16(_current_class_type)
	st	 r0,r5,lo16(_current_function_decl)
	addu	 r31,r31,80
	jmp.n	 r1
	st	 r0,r9,lo16(_class_binding_level)

	align	 8
	global	 _pop_from_top_level
_pop_from_top_level:
	or.u	 r10,r0,hi16(_current_saved_scope)
	ld	 r2,r10,lo16(_current_saved_scope)
	subu	 r31,r31,48
	st	 r1,r31,36
@Ltb24:
	ld	 r9,r2,4
	ld	 r12,r0,r2
	ld	 r11,r2,8
	or.u	 r13,r0,hi16(_current_binding_level)
	st	 r12,r13,lo16(_current_binding_level)
	bcnd.n	 eq0,r9,@L1188
	st	 r11,r10,lo16(_current_saved_scope)
@L1190:
	ld	 r12,r9,16
	bcnd	 eq0,r12,@L1189
	ld	 r13,r9,20
	st	 r13,r12,4
	ld	 r13,r9,24
	st	 r13,r12,24
	ld	 r13,r9,28
	st	 r13,r12,28
@L1189:
	ld	 r9,r0,r9
	bcnd	 ne0,r9,@L1190
@L1188:
	ld	 r12,r2,12
	ld	 r11,r2,16
	or.u	 r13,r0,hi16(_current_class_name)
	st	 r12,r13,lo16(_current_class_name)
	ld	 r12,r2,20
	or.u	 r13,r0,hi16(_current_class_type)
	st	 r11,r13,lo16(_current_class_type)
	or.u	 r13,r0,hi16(_current_class_decl)
	bcnd.n	 eq0,r11,@L1193
	st	 r12,r13,lo16(_current_class_decl)
	ld	 r13,r11,80
	ld	 r12,r13,96
	or.u	 r13,r0,hi16(_C_C_D)
	br.n	 @L1194
	st	 r12,r13,lo16(_C_C_D)
	align	 4
@L1193:
	or.u	 r13,r0,hi16(_C_C_D)
	st	 r0,r13,lo16(_C_C_D)
@L1194:
	ld	 r12,r2,24
	or.u	 r13,r0,hi16(_current_function_decl)
	st	 r12,r13,lo16(_current_function_decl)
	ld	 r12,r2,28
	or.u	 r13,r0,hi16(_class_binding_level)
	bsr.n	 _free
	st	 r12,r13,lo16(_class_binding_level)
@Lte24:
	ld	 r1,r31,36
	jmp.n	 r1
	addu	 r31,r31,48

	align	 8
	global	 _set_identifier_type_value
_set_identifier_type_value:
	subu	 r31,r31,64
	or.u	 r13,r0,hi16(_global_binding_level)
	st.d	 r24,r31,40
	or.u	 r24,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	ld	 r12,r24,lo16(_current_binding_level)
	or	 r25,r0,r2
	st	 r23,r31,36
	or	 r23,r0,r3
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L1201
	st	 r1,r31,48
@Ltb25:
	ld	 r3,r25,4
	bsr.n	 _tree_cons
	ld	 r4,r12,16
	ld	 r13,r24,lo16(_current_binding_level)
	br.n	 @L1202
	st	 r2,r13,16
	align	 4
@L1201:
	or.u	 r24,r0,hi16(_class_binding_level)
	ld	 r13,r24,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L1202
	ld	 r3,r25,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r24,lo16(_class_binding_level)
	st	 r2,r13,16
@L1202:
	st	 r23,r25,4
@Lte25:
	ld	 r1,r31,48
	ld	 r23,r31,36
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
	global	 _set_identifier_local_value
_set_identifier_local_value:
	subu	 r31,r31,64
	or.u	 r13,r0,hi16(_global_binding_level)
	st.d	 r24,r31,40
	or.u	 r24,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	ld	 r12,r24,lo16(_current_binding_level)
	or	 r25,r0,r2
	st	 r23,r31,36
	or	 r23,r0,r3
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L1210
	st	 r1,r31,48
@Ltb26:
	ld	 r3,r25,24
	bsr.n	 _tree_cons
	ld	 r4,r12,8
	ld	 r13,r24,lo16(_current_binding_level)
	br.n	 @L1211
	st	 r2,r13,8
	align	 4
@L1210:
	or.u	 r24,r0,hi16(_class_binding_level)
	ld	 r13,r24,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L1211
	ld	 r3,r25,24
	ld	 r4,r13,8
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r24,lo16(_class_binding_level)
	st	 r2,r13,8
@L1211:
	st	 r23,r25,24
@Lte26:
	ld	 r1,r31,48
	ld	 r23,r31,36
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

data
	align	 8
@LC47:
	string	 "%s::%s\000"
text
	align	 8
_set_nested_typename:
	subu	 r31,r31,64
	st	 r1,r31,52
	st	 r30,r31,48
	st.d	 r22,r31,32
	or	 r23,r0,r2
	st.d	 r24,r31,40
	addu	 r30,r31,48
@Ltb27:
	ld.bu	 r2,r23,8
	or	 r25,r0,r3
	or	 r24,r0,r4
	cmp	 r2,r2,32
	or	 r3,r0,136
	extu	 r2,r2,1<eq>
	bsr.n	 _my_friendly_assert
	or	 r22,r0,r5
	bcnd	 eq0,r25,@L1215
	ld.bu	 r2,r25,8
	cmp	 r2,r2,1
	or	 r3,r0,137
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	ld.bu	 r2,r24,8
	cmp	 r2,r2,1
	or	 r3,r0,138
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	ld	 r13,r24,12
	ld	 r12,r25,12
	addu	 r13,r13,r12
	addu	 r13,r13,19
	or.u	 r3,r0,hi16(@LC47)
	and	 r13,r13,0xfff0
	ld	 r4,r25,16
	subu	 r31,r31,r13
	ld	 r5,r24,16
	addu	 r25,r31,32
	or	 r3,r3,lo16(@LC47)
	bsr.n	 _sprintf
	or	 r2,r0,r25
	bsr.n	 _get_identifier
	or	 r2,r0,r25
	st	 r2,r23,40
	br.n	 @L1216
	st	 r22,r2,4
	align	 4
@L1215:
	st	 r24,r23,40
@L1216:
@Lte27:
	subu	 r31,r30,48
	ld	 r1,r31,52
	ld	 r30,r31,48
	ld.d	 r24,r31,40
	ld.d	 r22,r31,32
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
	global	 _pushtag
_pushtag:
	or.u	 r13,r0,hi16(_class_binding_level)
	ld	 r13,r13,lo16(_class_binding_level)
	subu	 r31,r31,80
	st	 r1,r31,64
	st.d	 r24,r31,56
	or	 r24,r0,r2
	st.d	 r22,r31,48
	or	 r23,r0,r3
	bcnd.n	 eq0,r13,@L1265
	st.d	 r20,r31,40
@Ltb28:
	br.n	 @L1266
	or	 r22,r0,r13
	align	 4
@L1265:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r22,r13,lo16(_current_binding_level)
	ld	 r13,r22,32
	bb0.n	 (31-23),r13,@L1317
	or.u	 r13,r0,hi16(_global_binding_level)
@L1269:
	ld	 r22,r22,28
	ld	 r13,r22,32
	bb1	 (31-23),r13,@L1269
@L1266:
	or.u	 r13,r0,hi16(_global_binding_level)
@L1317:
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r22,r13
	bb1.n	 ne,r13,@L1271
	or	 r2,r0,r24
	ld	 r4,r22,4
	or	 r3,r0,r23
	bsr.n	 _perm_tree_cons
	addu	 r1,r1,@L1323
@L1324:
	align	 4
@L1271:
	ld	 r4,r22,4
	bsr.n	 _saveable_tree_cons
	or	 r3,r0,r23
@L1312:
	bcnd.n	 eq0,r24,@L1273
	st	 r2,r22,4
	ld	 r13,r23,48
	bcnd	 ne0,r13,@L1274
	st	 r24,r23,48
@L1274:
	ld	 r13,r24,4
	cmp	 r13,r13,r23
	bb0	 ne,r13,@L1275
	ld.bu	 r13,r23,8
	cmp	 r13,r13,21
	bb1.n	 ne,r13,@L1318
	or.u	 r13,r0,hi16(_current_class_type)
	or.u	 r13,r0,hi16(_class_binding_level)
	ld	 r13,r13,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L1276
	ld	 r13,r23,80
	ld	 r13,r0,r13
	bb1	 (31-28),r13,@L1275
@L1276:
	or.u	 r13,r0,hi16(_current_class_type)
@L1318:
	ld	 r11,r13,lo16(_current_class_type)
	bcnd	 eq0,r11,@L1278
	ld	 r13,r11,16
	bcnd.n	 eq0,r13,@L1277
	or	 r4,r0,r23
@L1278:
	or.u	 r13,r0,hi16(_current_lang_name)
	or.u	 r12,r0,hi16(_lang_name_cplusplus)
	ld	 r13,r13,lo16(_current_lang_name)
	ld	 r12,r12,lo16(_lang_name_cplusplus)
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L1279
	or	 r25,r0,0
	bcnd.n	 eq0,r11,@L1280
	or	 r3,r0,0
	ld	 r3,r11,48
@L1280:
	bsr.n	 _lookup_nested_type
	or	 r2,r0,r23
	or	 r25,r0,r2
@L1279:
	bcnd.n	 ne0,r25,@L1283
	or	 r2,r0,32
	or	 r3,r0,r24
	bsr.n	 _build_decl
	or	 r4,r0,r23
	or	 r25,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,1
	bsr.n	 _build_overload_name
	or	 r4,r0,1
	bsr.n	 _get_identifier
	or.u	 r21,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r21,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	st	 r2,r25,60
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L1285
	st	 r0,r25,16
	ld	 r3,r24,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r21,lo16(_current_binding_level)
	br.n	 @L1319
	st	 r2,r13,16
	align	 4
@L1285:
	or.u	 r21,r0,hi16(_class_binding_level)
	ld	 r13,r21,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L1286
	ld	 r3,r24,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r21,lo16(_class_binding_level)
	st	 r2,r13,16
@L1286:
@L1319:
	br.n	 @L1288
	st	 r23,r24,4
	align	 4
@L1283:
	ld	 r25,r25,48
@L1288:
	ld	 r12,r24,16
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1	 ne,r13,@L1290
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb0	 ne,r13,@L1320
@L1290:
	ld	 r13,r23,48
	bcnd	 eq0,r13,@L1294
	ld.bu	 r13,r13,8
	cmp	 r13,r13,32
	bb1.n	 ne,r13,@L1321
	or.u	 r13,r0,hi16(_class_binding_level)
	or	 r2,r0,r24
	bsr.n	 _lookup_name
	or	 r3,r0,1
	ld	 r13,r23,48
	cmp	 r2,r2,r13
	bb0.n	 ne,r2,@L1294
	or.u	 r13,r0,hi16(_class_binding_level)
@L1321:
	ld	 r13,r13,lo16(_class_binding_level)
	bcnd.n	 ne0,r13,@L1314
	or	 r2,r0,r25
	bsr.n	 _pushdecl
	addu	 r1,r1,@L1325
@L1326:
	align	 4
@L1277:
	or	 r2,r0,32
	or	 r3,r0,r24
	bsr.n	 _build_lang_field_decl
	or.u	 r21,r0,hi16(_current_binding_level)
	ld	 r12,r21,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L1296
	or	 r25,r0,r2
	ld	 r3,r24,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r21,lo16(_current_binding_level)
	br.n	 @L1297
	st	 r2,r13,16
	align	 4
@L1296:
	or.u	 r21,r0,hi16(_class_binding_level)
	ld	 r13,r21,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L1297
	ld	 r3,r24,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r21,lo16(_class_binding_level)
	st	 r2,r13,16
@L1297:
	or	 r2,r0,r25
	st	 r23,r24,4
@L1314:
	bsr	 _pushdecl_class_level
@L1315:
	or	 r25,r0,r2
@L1294:
	ld	 r12,r24,16
@L1320:
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1.n	 ne,r13,@L1322
	or.u	 r20,r0,hi16(_current_class_type)
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb1	 ne,r13,@L1322
	ld	 r13,r25,28
	or.u	 r13,r13,0x2
	st	 r13,r25,28
	or.u	 r20,r0,hi16(_current_class_type)
@L1322:
	ld	 r11,r20,lo16(_current_class_type)
	bcnd.n	 ne0,r11,@L1302
	st	 r25,r23,48
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r13,r13,lo16(_current_function_decl)
	bcnd	 eq0,r13,@L1301
@L1302:
	or.u	 r13,r0,hi16(_current_lang_name)
	or.u	 r12,r0,hi16(_lang_name_cplusplus)
	ld	 r13,r13,lo16(_current_lang_name)
	ld	 r12,r12,lo16(_lang_name_cplusplus)
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L1300
	or.u	 r21,r0,hi16(_current_function_decl)
@L1301:
	br.n	 @L1275
	st	 r24,r25,40
	align	 4
@L1300:
	ld	 r13,r21,lo16(_current_function_decl)
	bcnd.n	 eq0,r13,@L1304
	or	 r2,r0,r25
	or	 r4,r0,r24
	ld	 r3,r13,60
	bsr.n	 _set_nested_typename
	or	 r5,r0,r23
	ld	 r13,r21,lo16(_current_function_decl)
	br.n	 @L1275
	st	 r13,r25,36
	align	 4
@L1304:
	ld	 r13,r11,16
	bcnd	 ne0,r13,@L1275
	ld	 r13,r11,48
	or	 r2,r0,r25
	or	 r4,r0,r24
	ld	 r3,r13,40
	bsr.n	 _set_nested_typename
	or	 r5,r0,r23
	ld	 r13,r20,lo16(_current_class_type)
	ld	 r12,r25,80
	st	 r13,r25,36
	st	 r13,r12,8
@L1275:
	ld	 r13,r22,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb1	 ne,r13,@L1273
	ld	 r13,r23,8
	or.u	 r12,r0,hi16(_current_class_type)
	ld	 r11,r23,48
	ld	 r12,r12,lo16(_current_class_type)
	or	 r13,r13,512
	st	 r13,r23,8
	st	 r11,r24,28
	ld	 r13,r12,16
	bcnd	 ne0,r13,@L1273
	ld	 r12,r12,80
	ld	 r13,r22,4
	st	 r13,r12,48
@L1273:
	ld	 r12,r23,48
	ld.bu	 r13,r12,8
	cmp	 r13,r13,32
	bb0.n	 eq,r13,@L1309
	or	 r2,r0,32
	br.n	 @L1310
	st	 r12,r0,r23
	align	 4
@L1309:
	or	 r3,r0,0
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr	 _pushdecl
	st	 r2,r0,r23
@L1310:
@Lte28:
	ld	 r1,r31,64
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80
	def	 @L1325,@L1315-@L1326
	def	 @L1323,@L1312-@L1324

data
	align	 4
_anon_cnt:
	word	 0
	align	 8
@LC48:
	string	 "$_%d\000"
text
	align	 8
	global	 _make_anon_name
_make_anon_name:
	or.u	 r12,r0,hi16(_anon_cnt)
	ld	 r4,r12,lo16(_anon_cnt)
	subu	 r31,r31,80
	or.u	 r3,r0,hi16(@LC48)
	st	 r1,r31,36
@Ltb29:
	addu	 r2,r31,40
	or	 r3,r3,lo16(@LC48)
	addu	 r13,r4,1
	bsr.n	 _sprintf
	st	 r13,r12,lo16(_anon_cnt)
	bsr.n	 _get_identifier
	addu	 r2,r31,40
@Lte29:
	ld	 r1,r31,36
	jmp.n	 r1
	addu	 r31,r31,80

data
	align	 4
_last_cnt.68:
	word	 0
text
	align	 8
	global	 _clear_anon_tags
_clear_anon_tags:
@Ltb30:
	or.u	 r9,r0,hi16(_last_cnt.68)
	or.u	 r8,r0,hi16(_anon_cnt)
	ld	 r9,r9,lo16(_last_cnt.68)
	ld	 r8,r8,lo16(_anon_cnt)
	cmp	 r9,r9,r8
	bb0.n	 ne,r9,@L1356
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r8,r9,lo16(_current_binding_level)
	ld	 r9,r8,32
	bb0	 (31-23),r9,@L1344
@L1345:
	ld	 r8,r8,28
	ld	 r9,r8,32
	bb1	 (31-23),r9,@L1345
@L1344:
	ld	 r8,r8,4
	bcnd.n	 eq0,r8,@L1355
	or.u	 r9,r0,hi16(_anon_cnt)
@L1349:
	ld	 r9,r8,12
	bcnd	 eq0,r9,@L1348
	ld	 r7,r9,16
	ld.b	 r9,r0,r7
	cmp	 r9,r9,36
	bb1	 ne,r9,@L1351
	ld.b	 r9,r7,1
	cmp	 r9,r9,95
	bb1	 ne,r9,@L1351
	st	 r0,r8,12
@L1351:
	ld	 r8,r0,r8
	bcnd	 ne0,r8,@L1349
@L1348:
	or.u	 r9,r0,hi16(_anon_cnt)
@L1355:
	ld	 r8,r9,lo16(_anon_cnt)
	or.u	 r9,r0,hi16(_last_cnt.68)
	st	 r8,r9,lo16(_last_cnt.68)
@L1356:
	jmp	 r1
@Lte30:

data
	align	 8
@LC49:
	string	 "`%s' redeclared as member function\000"
	align	 8
@LC50:
	string	 "`%s' redeclared as non-member function\000"
	align	 8
@LC51:
	string	 "declaration of `%s' with different language linka"
	string	 "ge\000"
	align	 8
@LC52:
	string	 "previous declaration here\000"
	align	 8
@LC53:
	string	 "`%s' redeclared as different kind of symbol\000"
	align	 8
@LC54:
	string	 "previous declaration of `%s'\000"
	align	 8
@LC55:
	string	 "declaration of `%s'\000"
	align	 8
@LC56:
	string	 "conflicts with built-in declaration `%s'\000"
	align	 8
@LC57:
	string	 "conflicting types for `%s'\000"
	align	 8
@LC58:
	string	 "A parameter list with an ellipsis can't match\000"
	align	 8
@LC59:
	string	 "an empty parameter name list declaration.\000"
	align	 8
@LC60:
	string	 "An argument type that has a default promotion\000"
	align	 8
@LC61:
	string	 "can't match an empty parameter name list declarat"
	string	 "ion.\000"
	align	 8
@LC62:
	string	 "previous declaration of `%s'\000"
	align	 8
@LC63:
	string	 "constructor cannot take as argument the type bein"
	string	 "g constructed\000"
	align	 8
@LC64:
	string	 "`%s' previously defined here\000"
	align	 8
@LC65:
	string	 "`%s' previously declared here\000"
	align	 8
@LC66:
	string	 "prototype for `%s'\000"
	align	 8
@LC67:
	string	 "follows non-prototype definition here\000"
	align	 8
@LC68:
	string	 "type qualifiers for `%s' conflict with previous d"
	string	 "ecl\000"
	align	 8
@LC69:
	string	 "redundant redeclaration of `%s' in same scope\000"
	align	 8
@LC70:
	string	 "previous declaration of `%s'\000"
	align	 8
@LC71:
	string	 "declaration of `%s' raises different exceptions.."
	string	 ".\000"
	align	 8
@LC72:
	string	 "...from previous declaration here\000"
text
	align	 8
_duplicate_decls:
	subu	 r31,r31,144
	st	 r1,r31,80
	st	 r17,r31,44
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	or	 r23,r0,r3
	st.d	 r18,r31,48
@Ltb31:
	ld.bu	 r13,r23,8
	or	 r24,r0,r2
	cmp	 r13,r13,3
	ld	 r17,r23,24
	bb1.n	 ne,r13,@L1519
	or	 r18,r0,0
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L1401
	ld	 r13,r23,16
	bcnd.n	 ne0,r13,@L1374
	or	 r25,r0,r23
	or	 r2,r0,1
	br.n	 @L1518
	st	 r24,r23,16
	align	 4
@L1374:
	bcnd.n	 eq0,r23,@L1518
	or	 r2,r0,1
@L1377:
	ld	 r9,r25,16
	st	 r24,r31,88
	st	 r9,r31,92
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L1380
	ld.bu	 r13,r9,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L1380
	ld	 r13,r24,4
	ld	 r12,r9,4
	ld	 r11,r13,12
	ld	 r10,r12,12
	st	 r13,r31,120
	st	 r12,r31,128
	st	 r11,r31,124
	st	 r10,r31,132
	ld.bu	 r13,r13,8
	cmp	 r13,r13,16
	bb1	 ne,r13,@L1381
	ld	 r13,r9,80
	ld	 r13,r0,r13
	bb0.n	 (31-13),r13,@L1381
	addu	 r2,r31,120
	addu	 r3,r31,88
	br.n	 @L1523
	addu	 r4,r31,124
	align	 4
@L1381:
	ld	 r13,r31,128
	ld.bu	 r13,r13,8
	cmp	 r13,r13,16
	bb1	 ne,r13,@L1382
	ld	 r13,r31,88
	ld	 r13,r13,80
	ld	 r13,r0,r13
	bb0.n	 (31-13),r13,@L1382
	addu	 r2,r31,128
	addu	 r3,r31,92
	addu	 r4,r31,132
@L1523:
	bsr	 _revert_static_member_fn
@L1382:
	ld	 r11,r31,120
	ld	 r10,r31,128
	ld.bu	 r12,r11,8
	ld.bu	 r13,r10,8
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L1384
	cmp	 r13,r12,14
	bb1.n	 ne,r13,@L1385
	or.u	 r3,r0,hi16(@LC49)
	ld	 r2,r31,88
	br.n	 @L1524
	or	 r3,r3,lo16(@LC49)
	align	 4
@L1385:
	or.u	 r3,r0,hi16(@LC50)
	ld	 r2,r31,88
	or	 r3,r3,lo16(@LC50)
@L1524:
	bsr	 _compiler_error_with_decl
	br.n	 @L1379
	or	 r2,r0,0
	align	 4
@L1384:
	ld	 r13,r11,4
	ld	 r12,r10,4
	ld	 r2,r13,64
	ld	 r3,r12,64
	bsr.n	 _comptypes
	or	 r4,r0,1
	bcnd.n	 eq0,r2,@L1387
	or	 r4,r0,1
	ld	 r2,r31,124
	ld	 r3,r31,132
	bsr.n	 _compparms
	addu	 r1,r1,@L1535
@L1536:
	align	 4
@L1387:
	br.n	 @L1379
	or	 r2,r0,0
	align	 4
@L1380:
	ld	 r13,r31,88
	or.u	 r12,r0,hi16(_error_mark_node)
	ld	 r2,r13,4
	ld	 r13,r12,lo16(_error_mark_node)
	cmp	 r13,r2,r13
	bb1	 ne,r13,@L1390
	ld	 r13,r31,92
	ld	 r13,r13,4
	cmp	 r13,r13,r2
	br.n	 @L1379
	extu	 r2,r13,1<eq>
	align	 4
@L1390:
	ld	 r13,r31,92
	ld	 r3,r13,4
	bcnd.n	 ne0,r3,@L1392
	cmp	 r13,r2,0
	br.n	 @L1379
	extu	 r2,r13,1<eq>
	align	 4
@L1392:
	bsr.n	 _comptypes
	or	 r4,r0,1
@L1379:
	bcnd	 eq0,r2,@L1378
	ld.bu	 r13,r24,8
	cmp	 r13,r13,33
	bb0	 ne,r13,@L1395
	ld	 r13,r25,16
	ld	 r12,r24,80
	ld	 r11,r13,80
	ld.bu	 r13,r0,r12
	ld.bu	 r12,r0,r11
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L1395
	or.u	 r3,r0,hi16(@LC51)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC51)
	or.u	 r3,r0,hi16(@LC52)
	ld	 r2,r25,16
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC52)
@L1395:
	br.n	 @L1376
	or	 r20,r0,1
	align	 4
@L1378:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L1377
@L1376:
	bcnd	 eq0,r25,@L1517
	ld	 r23,r23,16
	br	 @L1400
	align	 4
@L1519:
	ld	 r13,r23,80
	bcnd	 eq0,r13,@L1401
	ld	 r13,r0,r13
	extu	 r13,r13,1<19>
	subu	 r13,r0,r13
	subu	 r18,r0,r13
@L1401:
	st	 r24,r31,88
	st	 r23,r31,92
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L1404
	ld.bu	 r13,r23,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L1404
	ld	 r13,r24,4
	ld	 r12,r23,4
	ld	 r11,r13,12
	ld	 r10,r12,12
	st	 r13,r31,120
	st	 r12,r31,128
	st	 r11,r31,124
	st	 r10,r31,132
	ld.bu	 r13,r13,8
	cmp	 r13,r13,16
	bb1	 ne,r13,@L1405
	ld	 r13,r23,80
	ld	 r13,r0,r13
	bb0.n	 (31-13),r13,@L1405
	addu	 r2,r31,120
	addu	 r3,r31,88
	br.n	 @L1525
	addu	 r4,r31,124
	align	 4
@L1405:
	ld	 r13,r31,128
	ld.bu	 r13,r13,8
	cmp	 r13,r13,16
	bb1	 ne,r13,@L1406
	ld	 r13,r31,88
	ld	 r13,r13,80
	ld	 r13,r0,r13
	bb0.n	 (31-13),r13,@L1406
	addu	 r2,r31,128
	addu	 r3,r31,92
	addu	 r4,r31,132
@L1525:
	bsr	 _revert_static_member_fn
@L1406:
	ld	 r11,r31,120
	ld	 r10,r31,128
	ld.bu	 r12,r11,8
	ld.bu	 r13,r10,8
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L1408
	cmp	 r13,r12,14
	bb1.n	 ne,r13,@L1409
	or.u	 r3,r0,hi16(@LC49)
	ld	 r2,r31,88
	br.n	 @L1526
	or	 r3,r3,lo16(@LC49)
	align	 4
@L1409:
	or.u	 r3,r0,hi16(@LC50)
	ld	 r2,r31,88
	or	 r3,r3,lo16(@LC50)
@L1526:
	bsr.n	 _compiler_error_with_decl
	or	 r20,r0,0
	br	 @L1400
	align	 4
@L1408:
	ld	 r13,r11,4
	ld	 r12,r10,4
	ld	 r2,r13,64
	ld	 r3,r12,64
	bsr.n	 _comptypes
	or	 r4,r0,1
	bcnd.n	 eq0,r2,@L1411
	or	 r4,r0,1
	ld	 r2,r31,124
	ld	 r3,r31,132
	bsr.n	 _compparms
	addu	 r1,r1,@L1537
@L1538:
	align	 4
@L1411:
	br.n	 @L1413
	or	 r2,r0,0
	align	 4
@L1404:
	ld	 r13,r31,88
	or.u	 r12,r0,hi16(_error_mark_node)
	ld	 r2,r13,4
	ld	 r13,r12,lo16(_error_mark_node)
	cmp	 r13,r2,r13
	bb1	 ne,r13,@L1414
	ld	 r13,r31,92
	ld	 r13,r13,4
	cmp	 r13,r13,r2
	br.n	 @L1413
	extu	 r2,r13,1<eq>
	align	 4
@L1414:
	ld	 r13,r31,92
	ld	 r3,r13,4
	bcnd.n	 ne0,r3,@L1416
	cmp	 r13,r2,0
	br.n	 @L1413
	extu	 r2,r13,1<eq>
	align	 4
@L1416:
	bsr.n	 _comptypes
	or	 r4,r0,1
@L1413:
	or	 r20,r0,r2
@L1400:
	ld	 r13,r24,4
	bcnd	 eq0,r13,@L1420
	ld.bu	 r13,r13,8
	bcnd	 eq0,r13,@L1419
@L1420:
	ld	 r13,r23,4
	bcnd	 eq0,r13,@L1418
	ld.bu	 r13,r13,8
	bcnd	 ne0,r13,@L1418
@L1419:
	or	 r20,r0,0
@L1418:
	ld.bu	 r12,r23,8
	ld.bu	 r13,r24,8
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L1421
	or.u	 r3,r0,hi16(@LC53)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC53)
	ld.bu	 r13,r23,8
	cmp	 r13,r13,3
	bb1	 ne,r13,@L1422
	ld	 r23,r23,16
@L1422:
	or.u	 r3,r0,hi16(@LC54)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC54)
	br.n	 @L1518
	or	 r2,r0,0
	align	 4
@L1421:
	cmp	 r13,r12,29
	bb1.n	 ne,r13,@L1528
	or.u	 r13,r0,hi16(_flag_traditional)
	ld	 r13,r23,76
	bcnd	 eq0,r13,@L1424
	st	 r13,r24,76
@L1424:
	ld	 r13,r23,36
	bcnd	 eq0,r13,@L1425
	st	 r13,r24,36
@L1425:
	ld	 r13,r23,80
	ld	 r12,r13,8
	bcnd	 eq0,r12,@L1426
	ld	 r13,r24,80
	st	 r12,r13,8
@L1426:
	ld	 r12,r24,80
	ld	 r13,r12,28
	bcnd	 ne0,r13,@L1529
	ld	 r13,r23,80
	ld	 r13,r13,28
	st	 r13,r12,28
	ld	 r12,r24,80
@L1529:
	ld	 r13,r12,20
	bcnd.n	 ne0,r13,@L1528
	or.u	 r13,r0,hi16(_flag_traditional)
	ld	 r13,r23,80
	ld	 r13,r13,20
	st	 r13,r12,20
	or.u	 r13,r0,hi16(_flag_traditional)
@L1528:
	ld	 r13,r13,lo16(_flag_traditional)
	bcnd	 eq0,r13,@L1429
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L1429
	ld	 r13,r24,60
	ld	 r13,r13,36
	bcnd	 ne0,r13,@L1430
	bcnd	 eq0,r23,@L1432
	br	 @L1429
	align	 4
@L1430:
	ld	 r13,r13,4
	cmp	 r13,r13,r23
	bb0	 ne,r13,@L1432
@L1429:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L1433
	ld	 r13,r23,28
	bb0	 (31-12),r13,@L1433
	bcnd.n	 ne0,r20,@L1432
	or.u	 r3,r0,hi16(@LC55)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC55)
	or.u	 r3,r0,hi16(@LC56)
	or	 r2,r0,r23
	br.n	 @L1527
	or	 r3,r3,lo16(@LC56)
	align	 4
@L1521:
	bsr.n	 _error
	or	 r2,r2,lo16(@LC58)
	or.u	 r2,r0,hi16(@LC59)
	or	 r2,r2,lo16(@LC59)
	bsr.n	 _error
	addu	 r1,r1,@L1539
@L1540:
	align	 4
@L1433:
	bcnd.n	 ne0,r20,@L1436
	or	 r2,r0,r24
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r25,r23,4
	ld	 r12,r13,lo16(_current_class_type)
	ld	 r21,r24,4
	bcnd.n	 eq0,r12,@L1438
	or	 r22,r0,0
	ld	 r13,r24,60
	ld	 r13,r13,36
	bcnd	 eq0,r13,@L1438
	ld	 r13,r13,16
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L1437
@L1438:
	or.u	 r3,r0,hi16(@LC57)
	or	 r2,r0,r24
	or	 r3,r3,lo16(@LC57)
	bsr.n	 _error_with_decl
	or	 r22,r0,1
@L1437:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,29
	bb0	 eq,r13,@L1441
	ld	 r2,r25,4
	ld	 r3,r21,4
	bsr.n	 _comptypes
	or	 r4,r0,1
	bcnd	 eq0,r2,@L1441
	ld	 r13,r25,12
	bcnd	 ne0,r13,@L1443
	ld	 r13,r23,48
	bcnd	 eq0,r13,@L1442
@L1443:
	ld	 r13,r21,12
	bcnd	 ne0,r13,@L1441
	ld	 r13,r24,48
	bcnd	 ne0,r13,@L1441
@L1442:
	ld	 r10,r25,12
	bcnd.n	 ne0,r10,@L1448
	or.u	 r9,r0,hi16(_float_type_node)
	ld	 r10,r21,12
	bcnd	 eq0,r10,@L1441
@L1448:
	ld	 r13,r0,r10
	ld	 r12,r10,16
	bcnd.n	 ne0,r13,@L1449
	or.u	 r13,r0,hi16(_void_type_node)
	ld	 r13,r13,lo16(_void_type_node)
	cmp	 r13,r12,r13
	bb1.n	 ne,r13,@L1521
	or.u	 r2,r0,hi16(@LC58)
@L1449:
	ld	 r11,r12,64
	ld	 r13,r9,lo16(_float_type_node)
	cmp	 r13,r11,r13
	bb0	 ne,r13,@L1451
	ld.bu	 r13,r12,8
	cmp	 r13,r13,7
	bb1.n	 ne,r13,@L1447
	or.u	 r13,r0,hi16(_char_type_node)
	ld	 r13,r13,lo16(_char_type_node)
	cmp	 r13,r11,r13
	bb0.n	 ne,r13,@L1451
	or.u	 r13,r0,hi16(_signed_char_type_node)
	ld	 r13,r13,lo16(_signed_char_type_node)
	cmp	 r13,r11,r13
	bb0.n	 ne,r13,@L1451
	or.u	 r13,r0,hi16(_unsigned_char_type_node)
	ld	 r13,r13,lo16(_unsigned_char_type_node)
	cmp	 r13,r11,r13
	bb0.n	 ne,r13,@L1451
	or.u	 r13,r0,hi16(_short_integer_type_node)
	ld	 r13,r13,lo16(_short_integer_type_node)
	cmp	 r13,r11,r13
	bb0.n	 ne,r13,@L1451
	or.u	 r13,r0,hi16(_short_unsigned_type_node)
	ld	 r13,r13,lo16(_short_unsigned_type_node)
	cmp	 r13,r11,r13
	bb1	 ne,r13,@L1447
@L1451:
	or.u	 r2,r0,hi16(@LC60)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC60)
	or.u	 r2,r0,hi16(@LC61)
	or	 r2,r2,lo16(@LC61)
	bsr.n	 _error
	addu	 r1,r1,@L1541
@L1542:
	align	 4
@L1447:
	ld	 r10,r0,r10
	bcnd	 ne0,r10,@L1448
@L1441:
	bcnd	 eq0,r22,@L1453
	or.u	 r3,r0,hi16(@LC62)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC62)
@L1453:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L1432
	ld	 r13,r24,80
	ld	 r13,r0,r13
	bb0	 (31-9),r13,@L1432
	ld	 r13,r21,12
	ld	 r22,r0,r13
	bcnd	 eq0,r22,@L1432
	ld	 r2,r22,16
	ld	 r12,r21,56
	ld	 r13,r2,64
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L1432
	ld	 r13,r24,40
	bsr.n	 _build_reference_type
	ld	 r25,r0,r13
	bsr.n	 _hash_tree_chain
	ld	 r3,r0,r22
	ld	 r13,r22,16
	ld	 r13,r13,36
	st	 r13,r25,4
	st	 r13,r25,48
	or	 r4,r0,r2
	ld	 r2,r21,56
	bsr.n	 _build_cplus_method_type
	ld	 r3,r21,4
	or.u	 r13,r0,hi16(@LC63)
	st	 r2,r24,4
	bsr.n	 _error
	or	 r2,r13,lo16(@LC63)
	ld	 r13,r24,60
	ld	 r13,r13,36
	bcnd.n	 ne0,r13,@L1457
	or	 r2,r0,1
	bsr.n	 _perm_calloc
	or	 r3,r0,20
	ld	 r13,r24,60
	st	 r2,r13,36
@L1457:
	ld	 r13,r24,60
	or.u	 r12,r0,hi16(_current_class_type)
	ld	 r11,r13,36
	ld	 r13,r12,lo16(_current_class_type)
	br.n	 @L1432
	st	 r13,r11,16
	align	 4
@L1436:
	bsr.n	 _redeclaration_error_message
	or	 r3,r0,r23
	or	 r3,r0,r2
	bcnd	 eq0,r3,@L1459
	bsr.n	 _error_with_decl
	or	 r2,r0,r24
	ld	 r13,r23,32
	bcnd	 eq0,r13,@L1463
	ld	 r13,r23,48
	bcnd.n	 eq0,r13,@L1461
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L1530
	or.u	 r13,r0,hi16(@LC65)
	or.u	 r13,r0,hi16(@LC64)
	br.n	 @L1462
	or	 r3,r13,lo16(@LC64)
	align	 4
@L1461:
	or.u	 r13,r0,hi16(@LC65)
@L1530:
	or	 r3,r13,lo16(@LC65)
@L1462:
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L1543
@L1544:
	align	 4
@L1459:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,29
	bb1.n	 ne,r13,@L1531
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r23,48
	bcnd	 eq0,r13,@L1463
	ld	 r13,r23,4
	ld	 r13,r13,12
	bcnd.n	 ne0,r13,@L1531
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r24,4
	ld	 r13,r13,12
	bcnd	 eq0,r13,@L1463
	or.u	 r3,r0,hi16(@LC66)
	or	 r2,r0,r24
	bsr.n	 _warning_with_decl
	or	 r3,r3,lo16(@LC66)
	or.u	 r3,r0,hi16(@LC67)
	or	 r2,r0,r23
	bsr.n	 _warning_with_decl
	or	 r3,r3,lo16(@LC67)
@L1463:
	or.u	 r13,r0,hi16(_pedantic)
@L1531:
	ld	 r13,r13,lo16(_pedantic)
	bcnd	 eq0,r13,@L1432
	ld	 r13,r24,8
	ld	 r12,r23,8
	or.u	 r11,r0,0xc
	and	 r13,r13,r11
	and	 r12,r12,r11
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L1432
	or.u	 r3,r0,hi16(@LC68)
	or	 r2,r0,r24
	or	 r3,r3,lo16(@LC68)
@L1527:
	bsr	 _error_with_decl
@L1432:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L1466
	ld	 r13,r24,4
	ld	 r12,r13,80
	bcnd	 eq0,r12,@L1466
	ld	 r13,r23,4
	ld	 r13,r13,80
	bcnd	 eq0,r13,@L1466
	ld	 r13,r13,16
	st	 r13,r12,16
	ld	 r13,r23,4
	ld	 r12,r24,4
	ld	 r13,r13,80
	ld	 r12,r12,80
	ld	 r13,r13,100
	st	 r13,r12,100
@L1466:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1.n	 ne,r13,@L1468
	or	 r19,r0,0
	ld	 r13,r24,48
	cmp	 r13,r13,0
	extu	 r19,r13,1<ne>
@L1468:
	or.u	 r13,r0,hi16(_warn_redundant_decls)
	ld	 r13,r13,lo16(_warn_redundant_decls)
	bcnd	 eq0,r13,@L1469
	ld	 r13,r23,16
	bcnd	 eq0,r13,@L1469
	bcnd	 eq0,r19,@L1470
	ld	 r13,r23,48
	bcnd	 eq0,r13,@L1469
@L1470:
	or.u	 r3,r0,hi16(@LC69)
	or	 r2,r0,r24
	bsr.n	 _warning_with_decl
	or	 r3,r3,lo16(@LC69)
	or.u	 r3,r0,hi16(@LC70)
	or	 r2,r0,r23
	bsr.n	 _warning_with_decl
	or	 r3,r3,lo16(@LC70)
@L1469:
	bcnd	 eq0,r20,@L1471
	ld	 r21,r23,4
	ld	 r2,r24,4
	bsr.n	 _common_type
	or	 r3,r0,r21
	ld.bu	 r12,r24,8
	cmp	 r13,r12,33
	bb1.n	 ne,r13,@L1472
	or	 r22,r0,r2
	ld	 r13,r23,28
	bb0	 (31-19),r13,@L1474
	ld	 r13,r24,28
	or	 r13,r13,4096
	br.n	 @L1474
	st	 r13,r24,28
	align	 4
@L1472:
	cmp	 r13,r12,29
	bb1	 ne,r13,@L1474
	ld	 r13,r24,4
	ld	 r12,r23,4
	ld	 r4,r13,72
	ld	 r13,r12,72
	cmp	 r13,r4,r13
	bb0	 ne,r13,@L1474
	ld	 r13,r24,80
	ld	 r25,r13,8
	or	 r3,r0,r22
	bsr.n	 _build_exception_variant
	or	 r2,r0,r25
	st	 r2,r24,4
	or	 r2,r0,r25
	ld	 r4,r21,72
	bsr.n	 _build_exception_variant
	or	 r3,r0,r22
	or	 r3,r0,r2
	st	 r3,r23,4
	bsr.n	 _compexcepttypes
	ld	 r2,r24,4
	bcnd	 ne0,r2,@L1474
	or.u	 r3,r0,hi16(@LC71)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC71)
	or.u	 r3,r0,hi16(@LC72)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC72)
@L1474:
	st	 r22,r23,4
	cmp	 r13,r21,r22
	bb0.n	 ne,r13,@L1477
	st	 r22,r24,4
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r22,r13
	bb0	 ne,r13,@L1478
	bsr.n	 _layout_type
	or	 r2,r0,r22
@L1478:
	ld.bu	 r11,r24,8
	cmp	 r13,r11,29
	cmp	 r12,r11,32
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L1480
	cmp	 r13,r11,31
	bb0.n	 ne,r13,@L1480
	or	 r2,r0,r24
	or	 r3,r0,0
	bsr.n	 _layout_decl
	addu	 r1,r1,@L1545
@L1546:
	align	 4
@L1477:
	ld	 r13,r23,20
	st	 r13,r24,20
@L1480:
	ld	 r13,r24,8
	bb0.n	 (31-13),r13,@L1532
	or.u	 r12,r0,0x4
	ld	 r13,r23,8
	or	 r13,r13,r12
	st	 r13,r23,8
	ld	 r13,r24,8
@L1532:
	bb0.n	 (31-12),r13,@L1482
	or.u	 r12,r0,0x8
	ld	 r13,r23,8
	or	 r13,r13,r12
	st	 r13,r23,8
@L1482:
	ld	 r13,r24,48
	bcnd	 ne0,r13,@L1483
	ld	 r13,r23,48
	st	 r13,r24,48
@L1483:
	ld	 r13,r23,80
	bcnd	 eq0,r13,@L1486
	ld	 r13,r0,r13
	bb0	 (31-16),r13,@L1485
@L1486:
	or.u	 r13,r0,hi16(_abort_fndecl)
	ld	 r12,r13,lo16(_abort_fndecl)
	ld	 r13,r23,64
	ld	 r12,r12,64
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L1487
@L1485:
	ld	 r13,r23,64
	br.n	 @L1487
	st	 r13,r24,64
	align	 4
@L1471:
	or.u	 r13,r0,hi16(_static_aggregates)
	ld	 r3,r13,lo16(_static_aggregates)
	bsr.n	 _value_member
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L1488
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	st	 r13,r2,16
@L1488:
	ld	 r12,r24,4
	ld	 r13,r23,8
	st	 r12,r23,4
	ld	 r12,r24,8
	and.u	 r13,r13,0xfffb
	mask.u	 r12,r12,0x4
	or	 r13,r13,r12
	st	 r13,r23,8
	ld	 r12,r24,8
	and.u	 r13,r13,0xfff7
	mask.u	 r12,r12,0x8
	or	 r13,r13,r12
	st	 r13,r23,8
	ld	 r12,r24,8
	and.u	 r13,r13,0xff7f
	mask.u	 r12,r12,0x80
	or	 r13,r13,r12
	st	 r13,r23,8
@L1487:
	ld	 r13,r24,28
	bb0	 (31-8),r13,@L1489
	ld	 r13,r24,8
	ld	 r12,r23,8
	ld	 r11,r24,28
	and	 r13,r13,0xdfff
	mask	 r12,r12,8192
	or	 r13,r13,r12
	st	 r13,r24,8
	ld	 r13,r23,28
	and.u	 r11,r11,0xff7f
	ld.bu	 r12,r24,8
	mask.u	 r13,r13,0x80
	cmp	 r12,r12,29
	or	 r11,r11,r13
	bb1.n	 ne,r12,@L1490
	st	 r11,r24,28
	ld	 r13,r23,8
	bb1	 (31-19),r13,@L1491
	ld	 r13,r24,8
	and	 r13,r13,0xefff
	st	 r13,r24,8
@L1491:
	ld	 r12,r23,8
	ld	 r13,r24,8
	and	 r12,r12,0xefff
	mask	 r13,r13,4096
	or	 r12,r12,r13
	bb1.n	 (31-19),r12,@L1494
	st	 r12,r23,8
	ld	 r12,r23,60
	ld	 r13,r12,8
	and	 r13,r13,0xefff
	br.n	 @L1494
	st	 r13,r12,8
	align	 4
@L1490:
	ld	 r12,r24,8
	ld	 r13,r23,8
	and	 r12,r12,0xefff
	mask	 r13,r13,4096
	or	 r12,r12,r13
	br.n	 @L1494
	st	 r12,r24,8
	align	 4
@L1489:
	ld	 r12,r23,8
	ld	 r13,r24,8
	and	 r12,r12,0xdfff
	mask	 r13,r13,8192
	or	 r12,r12,r13
	st	 r12,r23,8
	ld	 r11,r24,8
	or.u	 r12,r0,0x2104
	or	 r12,r12,0x2000
	and.u	 r13,r11,0xff04
	and	 r13,r13,0x2000
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L1495
	ld	 r13,r24,28
	bb1.n	 (31-19),r13,@L1495
	and	 r13,r11,0xefff
	st	 r13,r24,8
@L1495:
	ld	 r12,r23,8
	ld	 r13,r24,8
	and	 r12,r12,0xefff
	mask	 r13,r13,4096
	or	 r12,r12,r13
	st	 r12,r23,8
@L1494:
	ld	 r13,r24,28
	bb0.n	 (31-11),r13,@L1533
	or.u	 r12,r0,0x10
	ld	 r13,r23,48
	bcnd	 ne0,r13,@L1496
	ld	 r13,r23,28
	or	 r13,r13,r12
	st	 r13,r23,28
@L1496:
	ld	 r13,r24,28
@L1533:
	and.u	 r11,r13,0xffef
	ld	 r13,r23,28
	ld.bu	 r12,r24,8
	mask.u	 r13,r13,0x10
	cmp	 r12,r12,29
	or	 r11,r11,r13
	bb1.n	 ne,r12,@L1497
	st	 r11,r24,28
	bcnd	 eq0,r19,@L1498
	ld	 r13,r23,80
	ld	 r12,r24,80
	ld.bu	 r13,r0,r13
	br.n	 @L1497
	st.b	 r13,r0,r12
	align	 4
@L1498:
	ld	 r13,r23,28
	bb0.n	 (31-12),r13,@L1500
	or.u	 r12,r0,0x8
	or	 r13,r11,r12
	st	 r13,r24,28
	ld	 r13,r23,68
	st	 r13,r24,68
	ld	 r13,r23,64
	br.n	 @L1501
	st	 r13,r24,64
	align	 4
@L1500:
	ld	 r13,r23,68
	st	 r13,r24,68
@L1501:
	ld	 r13,r23,44
	st	 r13,r24,44
	ld	 r13,r23,72
	bcnd.n	 eq0,r13,@L1502
	st	 r13,r24,72
	ld	 r13,r23,48
	st	 r13,r24,48
@L1502:
	ld	 r13,r23,40
	bcnd	 eq0,r13,@L1497
	st	 r13,r24,40
@L1497:
	ld	 r12,r24,8
	ld	 r13,r23,8
	and.u	 r12,r12,0xffef
	mask.u	 r13,r13,0x10
	or	 r12,r12,r13
	st	 r12,r24,8
	ld	 r13,r23,8
	and.u	 r12,r12,0xfffe
	mask.u	 r13,r13,0x1
	or	 r12,r12,r13
	st	 r12,r24,8
	ld	 r13,r23,80
	bcnd	 eq0,r13,@L1534
	ld	 r12,r24,28
	ld	 r13,r23,28
	and	 r12,r12,0xf7ff
	mask	 r13,r13,2048
	or	 r12,r12,r13
	st	 r12,r24,28
	ld	 r13,r23,80
@L1534:
	ld	 r19,r23,24
	bcnd	 eq0,r13,@L1505
	ld	 r13,r0,r13
	br.n	 @L1506
	extu	 r20,r13,1<19>
	align	 4
@L1505:
	or	 r20,r0,0
@L1506:
	ld.bu	 r12,r24,8
	cmp	 r13,r12,29
	bb1.n	 ne,r13,@L1507
	or.u	 r13,r0,hi16(_tree_code_length)
	ld	 r25,r23,80
	addu	 r2,r24,12
	addu	 r3,r23,12
	or	 r4,r0,72
	bsr.n	 _bcopy
	ld	 r22,r24,80
	or.u	 r12,r0,hi16(_permanent_obstack+24)
	ld	 r13,r12,lo16(_permanent_obstack+24)
	or	 r21,r12,lo16(_permanent_obstack+24)
	addu	 r12,r13,116
	subu	 r11,r21,12
	and.c	 r13,r12,r13
	ld	 r12,r0,r11
	addu	 r13,r24,r13
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L1508
	ld	 r13,r24,80
	or	 r2,r0,r22
	or	 r3,r0,r25
	st	 r23,r13,16
	or	 r4,r0,32
	bsr.n	 _bcopy
	st	 r3,r23,80
	subu	 r11,r21,24
	ld	 r10,r11,4
	subu	 r2,r24,r10
	bcnd.n	 le0,r2,@L1509
	st	 r2,r11,20
	ld	 r13,r11,16
	subu	 r13,r13,r10
	cmp	 r13,r2,r13
	bb1.n	 ge,r13,@L1509
	addu	 r13,r10,r2
	st	 r13,r11,8
	br.n	 @L1515
	st	 r13,r11,12
	align	 4
@L1509:
	or.u	 r2,r0,hi16(_permanent_obstack)
	or	 r2,r2,lo16(_permanent_obstack)
	ld	 r13,r2,4
	ld	 r3,r2,20
	addu	 r3,r13,r3
	bsr.n	 __obstack_free
	addu	 r1,r1,@L1547
@L1548:
	align	 4
@L1508:
	ld	 r13,r0,r25
	bb0	 (31-17),r13,@L1515
	ld	 r13,r23,80
	ld	 r13,r13,16
	cmp	 r13,r13,r23
	bb1.n	 ne,r13,@L1515
	or.u	 r12,r0,hi16(_free_lang_decl_chain)
	ld	 r13,r12,lo16(_free_lang_decl_chain)
	st	 r13,r0,r25
	br.n	 @L1515
	st	 r25,r12,lo16(_free_lang_decl_chain)
	align	 4
@L1507:
	ld	 r13,r13,lo16(_tree_code_length)
	ld	 r4,r13[r12]
	addu	 r2,r24,12
	mak	 r4,r4,0<2>
	addu	 r3,r23,12
	bsr.n	 _bcopy
	addu	 r4,r4,72
@L1515:
	bcnd.n	 eq0,r18,@L1516
	st	 r17,r23,24
	ld	 r12,r23,80
	ld	 r13,r0,r12
	or.u	 r13,r13,0x8
	st	 r13,r0,r12
@L1516:
	ld	 r11,r23,80
	bcnd.n	 eq0,r11,@L1517
	st	 r19,r23,24
	ld	 r13,r0,r11
	and.u	 r12,r13,0xfff7
	extu	 r13,r13,1<19>
	or	 r13,r13,r20
	mak	 r13,r13,0<19>
	or	 r12,r12,r13
	st	 r12,r0,r11
@L1517:
	or	 r2,r0,1
@L1518:
@Lte31:
	ld	 r1,r31,80
	ld	 r17,r31,44
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	jmp.n	 r1
	addu	 r31,r31,144
	def	 @L1547,@L1515-@L1548
	def	 @L1545,@L1480-@L1546
	def	 @L1543,@L1463-@L1544
	def	 @L1541,@L1441-@L1542
	def	 @L1539,@L1441-@L1540
	def	 @L1537,@L1413-@L1538
	def	 @L1535,@L1379-@L1536

	align	 8
	global	 _adjust_type_value
_adjust_type_value:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r12,r13,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	subu	 r31,r31,48
	st	 r25,r31,32
	or	 r25,r0,r2
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L1560
	st	 r1,r31,36
@Ltb32:
	or.u	 r13,r0,hi16(_class_binding_level)
	ld	 r13,r13,lo16(_class_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L1561
	ld	 r12,r25,24
	bcnd	 eq0,r12,@L1564
	ld.bu	 r13,r12,8
	cmp	 r13,r13,32
	bb1.n	 ne,r13,@L1569
	or.u	 r13,r0,hi16(_current_class_type)
@L1563:
	ld	 r13,r12,4
	br.n	 @L1559
	st	 r13,r25,4
	align	 4
@L1561:
	bsr.n	 _my_friendly_abort
	or	 r2,r0,7
@L1564:
	or.u	 r13,r0,hi16(_current_class_type)
@L1569:
	ld	 r13,r13,lo16(_current_class_type)
	bcnd	 eq0,r13,@L1560
	ld	 r12,r25,28
	bcnd	 eq0,r12,@L1560
	ld.bu	 r13,r12,8
	cmp	 r13,r13,32
	bb1	 eq,r13,@L1563
@L1560:
	ld	 r12,r25,20
	bcnd	 eq0,r12,@L1559
	ld.bu	 r11,r12,8
	cmp	 r13,r11,32
	bb1.n	 eq,r13,@L1563
	cmp	 r13,r11,129
	bb1	 ne,r13,@L1559
	st	 r0,r25,4
@L1559:
@Lte32:
	ld	 r1,r31,36
	ld	 r25,r31,32
	jmp.n	 r1
	addu	 r31,r31,48

data
	align	 8
@LC73:
	string	 "`%s' used prior to declaration\000"
	align	 8
@LC74:
	string	 "parse errors have confused me too much\000"
	align	 8
@LC75:
	string	 "`%s' was declared implicitly `extern' and later `"
	string	 "static'\000"
	align	 8
@LC76:
	string	 "`%s' was declared `extern' and later `static'\000"
	align	 8
@LC77:
	string	 "previous declaration of `%s'\000"
	align	 8
@LC78:
	string	 "type mismatch with previous external decl\000"
	align	 8
@LC79:
	string	 "previous external decl of `%s'\000"
	align	 8
@LC80:
	string	 "`%s' was previously implicitly declared to return"
	string	 " `int'\000"
	align	 8
@LC81:
	string	 "`%s' was declared implicitly `extern' and later `"
	string	 "static'\000"
	align	 8
@LC82:
	string	 "`%s' was declared `extern' and later `static'\000"
	align	 8
@LC83:
	string	 "extern declaration of `%s' doesn't match global o"
	string	 "ne\000"
	align	 8
@LC84:
	string	 "declaration of `%s' shadows a parameter\000"
	align	 8
@LC85:
	string	 "declaration of `%s' shadows a parameter\000"
	align	 8
@LC86:
	string	 "declaration of `%s' shadows a member of `this'\000"
	align	 8
@LC87:
	string	 "declaration of `%s' shadows previous local\000"
	align	 8
@LC88:
	string	 "declaration of `%s' shadows global declaration\000"
	align	 8
@LC89:
	string	 "too many incomplete variables at this point\000"
text
	align	 8
	global	 _pushdecl
_pushdecl:
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r11,r13,lo16(_current_function_decl)
	subu	 r31,r31,96
	st	 r1,r31,80
	st	 r15,r31,36
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	st.d	 r18,r31,48
	or	 r24,r0,r2
	st.d	 r16,r31,40
@Ltb33:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r20,r24,60
	cmp	 r12,r24,r11
	ld	 r15,r13,lo16(_current_binding_level)
	bb0	 ne,r12,@L1571
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L1572
	ld	 r13,r24,28
	bb1	 (31-13),r13,@L1571
@L1572:
	st	 r11,r24,36
@L1571:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L1573
	ld	 r20,r24,32
@L1573:
	bcnd	 eq0,r20,@L1574
	bsr.n	 _lookup_name_current_level
	or	 r2,r0,r20
	or	 r18,r0,r2
	bcnd.n	 eq0,r18,@L1584
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r18,r13
	bb1.n	 ne,r13,@L1575
	or.u	 r3,r0,hi16(@LC73)
	or	 r2,r0,r24
	or	 r3,r3,lo16(@LC73)
	bsr.n	 _error_with_decl
	or	 r18,r0,0
@L1575:
	bcnd	 eq0,r18,@L1584
	ld.bu	 r13,r18,8
	cmp	 r13,r13,34
	bb1	 ne,r13,@L1577
	ld	 r13,r18,36
	bcnd	 ne0,r13,@L1577
	or.u	 r2,r0,hi16(@LC74)
	bsr.n	 _fatal
	or	 r2,r2,lo16(@LC74)
@L1577:
	ld	 r23,r18,12
	ld	 r22,r18,16
	bcnd	 eq0,r18,@L1584
	ld.bu	 r12,r18,8
	ld.bu	 r11,r24,8
	cmp	 r13,r12,r11
	bb0.n	 ne,r13,@L1579
	cmp	 r13,r12,32
	bb0.n	 ne,r13,@L1584
	cmp	 r13,r11,32
	bb0.n	 ne,r13,@L1740
	or	 r2,r0,r24
	bsr.n	 _duplicate_decls
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L1584
@L1743:
	br.n	 @L1739
	or	 r2,r0,r18
	align	 4
@L1579:
	or	 r2,r0,r24
	bsr.n	 _duplicate_decls
	or	 r3,r0,r18
	bcnd.n	 eq0,r2,@L1584
	or.u	 r13,r0,hi16(_flag_traditional)
	ld	 r13,r13,lo16(_flag_traditional)
	bcnd	 ne0,r13,@L1743
	ld	 r13,r20,8
	bb0	 (31-19),r13,@L1743
	ld	 r13,r24,8
	bb1	 (31-19),r13,@L1743
	ld	 r13,r24,28
	mask.u	 r13,r13,0x90
	bcnd.n	 ne0,r13,@L1743
	or.u	 r12,r0,hi16(_current_function_decl)
	ld	 r13,r12,lo16(_current_function_decl)
	cmp	 r13,r13,r24
	bb1	 ne,r13,@L1587
	st	 r18,r12,lo16(_current_function_decl)
@L1587:
	ld	 r2,r20,36
	bcnd	 eq0,r2,@L1588
	ld	 r13,r2,4
	bcnd.n	 eq0,r13,@L1588
	or.u	 r25,r0,hi16(@LC75)
	or	 r2,r0,r18
	br.n	 @L1742
	or	 r25,r25,lo16(@LC75)
	align	 4
@L1588:
	or.u	 r25,r0,hi16(@LC76)
	or	 r2,r0,r18
	or	 r25,r25,lo16(@LC76)
@L1742:
	bsr	 _lang_printable_name
	or	 r3,r0,r2
	bsr.n	 _warning
	or	 r2,r0,r25
	or.u	 r25,r0,hi16(@LC77)
	or	 r2,r0,r18
	bsr.n	 _lang_printable_name
	or	 r25,r25,lo16(@LC77)
	or	 r5,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r22
	or	 r4,r0,r25
	bsr.n	 _warning_with_file_and_line
	subu	 r1,r1,@L1768
@L1769:
	align	 4
@L1584:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L1592
@L1740:
	ld	 r11,r24,4
	ld	 r17,r11,48
	bcnd	 eq0,r17,@L1594
	ld.bu	 r13,r17,8
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L1593
	or.u	 r13,r0,hi16(_current_binding_level)
@L1594:
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L1597
	or	 r17,r0,r24
	br.n	 @L1597
	st	 r24,r11,48
	align	 4
@L1593:
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r10,r13,lo16(_current_binding_level)
	ld	 r13,r12,lo16(_global_binding_level)
	cmp	 r13,r10,r13
	extu	 r13,r13,1<eq>
	ld	 r23,r17,32
	bcnd	 eq0,r13,@L1597
	ld	 r12,r23,16
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1	 ne,r13,@L1597
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb1.n	 ne,r13,@L1597
	or.u	 r13,r0,hi16(_class_binding_level)
	st	 r24,r11,48
	ld	 r13,r13,lo16(_class_binding_level)
	ld	 r22,r24,4
	bcnd.n	 ne0,r13,@L1602
	or	 r21,r0,r13
	or	 r21,r0,r10
	ld	 r13,r21,32
	bb0.n	 (31-23),r13,@L1753
	or.u	 r13,r0,hi16(_global_binding_level)
@L1605:
	ld	 r21,r21,28
	ld	 r13,r21,32
	bb1	 (31-23),r13,@L1605
@L1602:
	or.u	 r13,r0,hi16(_global_binding_level)
@L1753:
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r21,r13
	bb1.n	 ne,r13,@L1607
	or	 r2,r0,r23
	ld	 r4,r21,4
	or	 r3,r0,r22
	bsr.n	 _perm_tree_cons
	addu	 r1,r1,@L1770
@L1771:
	align	 4
@L1607:
	ld	 r4,r21,4
	bsr.n	 _saveable_tree_cons
	or	 r3,r0,r22
@L1744:
	bcnd.n	 eq0,r23,@L1609
	st	 r2,r21,4
	ld	 r13,r22,48
	bcnd	 ne0,r13,@L1610
	st	 r23,r22,48
@L1610:
	ld	 r13,r23,4
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L1611
	ld.bu	 r13,r22,8
	cmp	 r13,r13,21
	bb1.n	 ne,r13,@L1754
	or.u	 r13,r0,hi16(_current_class_type)
	or.u	 r13,r0,hi16(_class_binding_level)
	ld	 r13,r13,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L1612
	ld	 r13,r22,80
	ld	 r13,r0,r13
	bb1	 (31-28),r13,@L1611
@L1612:
	or.u	 r13,r0,hi16(_current_class_type)
@L1754:
	ld	 r11,r13,lo16(_current_class_type)
	bcnd	 eq0,r11,@L1614
	ld	 r13,r11,16
	bcnd.n	 eq0,r13,@L1613
	or	 r4,r0,r22
@L1614:
	or.u	 r13,r0,hi16(_current_lang_name)
	or.u	 r12,r0,hi16(_lang_name_cplusplus)
	ld	 r13,r13,lo16(_current_lang_name)
	ld	 r12,r12,lo16(_lang_name_cplusplus)
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L1615
	or	 r25,r0,0
	bcnd.n	 eq0,r11,@L1616
	or	 r3,r0,0
	ld	 r3,r11,48
@L1616:
	bsr.n	 _lookup_nested_type
	or	 r2,r0,r22
	or	 r25,r0,r2
@L1615:
	bcnd.n	 ne0,r25,@L1619
	or	 r2,r0,32
	or	 r3,r0,r23
	bsr.n	 _build_decl
	or	 r4,r0,r22
	or	 r25,r0,r2
	or	 r2,r0,r22
	or	 r3,r0,1
	bsr.n	 _build_overload_name
	or	 r4,r0,1
	bsr.n	 _get_identifier
	or.u	 r19,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r19,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	st	 r2,r25,60
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L1621
	st	 r0,r25,16
	ld	 r3,r23,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r23
	ld	 r13,r19,lo16(_current_binding_level)
	br.n	 @L1755
	st	 r2,r13,16
	align	 4
@L1621:
	or.u	 r19,r0,hi16(_class_binding_level)
	ld	 r13,r19,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L1622
	ld	 r3,r23,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r23
	ld	 r13,r19,lo16(_class_binding_level)
	st	 r2,r13,16
@L1622:
@L1755:
	br.n	 @L1624
	st	 r22,r23,4
	align	 4
@L1619:
	ld	 r25,r25,48
@L1624:
	ld	 r12,r23,16
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1	 ne,r13,@L1626
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb0	 ne,r13,@L1756
@L1626:
	ld	 r13,r22,48
	bcnd	 eq0,r13,@L1630
	ld.bu	 r13,r13,8
	cmp	 r13,r13,32
	bb1.n	 ne,r13,@L1757
	or.u	 r13,r0,hi16(_class_binding_level)
	or	 r2,r0,r23
	bsr.n	 _lookup_name
	or	 r3,r0,1
	ld	 r13,r22,48
	cmp	 r2,r2,r13
	bb0.n	 ne,r2,@L1630
	or.u	 r13,r0,hi16(_class_binding_level)
@L1757:
	ld	 r13,r13,lo16(_class_binding_level)
	bcnd.n	 ne0,r13,@L1746
	or	 r2,r0,r25
	bsr.n	 _pushdecl
	addu	 r1,r1,@L1772
@L1773:
	align	 4
@L1613:
	or	 r2,r0,32
	or	 r3,r0,r23
	bsr.n	 _build_lang_field_decl
	or.u	 r19,r0,hi16(_current_binding_level)
	ld	 r12,r19,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L1632
	or	 r25,r0,r2
	ld	 r3,r23,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r23
	ld	 r13,r19,lo16(_current_binding_level)
	br.n	 @L1633
	st	 r2,r13,16
	align	 4
@L1632:
	or.u	 r19,r0,hi16(_class_binding_level)
	ld	 r13,r19,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L1633
	ld	 r3,r23,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r23
	ld	 r13,r19,lo16(_class_binding_level)
	st	 r2,r13,16
@L1633:
	or	 r2,r0,r25
	st	 r22,r23,4
@L1746:
	bsr	 _pushdecl_class_level
@L1747:
	or	 r25,r0,r2
@L1630:
	ld	 r12,r23,16
@L1756:
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1.n	 ne,r13,@L1758
	or.u	 r16,r0,hi16(_current_class_type)
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb1	 ne,r13,@L1758
	ld	 r13,r25,28
	or.u	 r13,r13,0x2
	st	 r13,r25,28
	or.u	 r16,r0,hi16(_current_class_type)
@L1758:
	ld	 r11,r16,lo16(_current_class_type)
	bcnd.n	 ne0,r11,@L1638
	st	 r25,r22,48
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r13,r13,lo16(_current_function_decl)
	bcnd	 eq0,r13,@L1637
@L1638:
	or.u	 r13,r0,hi16(_current_lang_name)
	or.u	 r12,r0,hi16(_lang_name_cplusplus)
	ld	 r13,r13,lo16(_current_lang_name)
	ld	 r12,r12,lo16(_lang_name_cplusplus)
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L1636
	or.u	 r19,r0,hi16(_current_function_decl)
@L1637:
	br.n	 @L1611
	st	 r23,r25,40
	align	 4
@L1636:
	ld	 r13,r19,lo16(_current_function_decl)
	bcnd.n	 eq0,r13,@L1640
	or	 r2,r0,r25
	or	 r4,r0,r23
	ld	 r3,r13,60
	bsr.n	 _set_nested_typename
	or	 r5,r0,r22
	ld	 r13,r19,lo16(_current_function_decl)
	br.n	 @L1611
	st	 r13,r25,36
	align	 4
@L1640:
	ld	 r13,r11,16
	bcnd	 ne0,r13,@L1611
	ld	 r13,r11,48
	or	 r2,r0,r25
	or	 r4,r0,r23
	ld	 r3,r13,40
	bsr.n	 _set_nested_typename
	or	 r5,r0,r22
	ld	 r13,r16,lo16(_current_class_type)
	ld	 r12,r25,80
	st	 r13,r25,36
	st	 r13,r12,8
@L1611:
	ld	 r13,r21,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb1	 ne,r13,@L1609
	ld	 r13,r22,8
	or.u	 r12,r0,hi16(_current_class_type)
	ld	 r11,r22,48
	ld	 r12,r12,lo16(_current_class_type)
	or	 r13,r13,512
	st	 r13,r22,8
	st	 r11,r23,28
	ld	 r13,r12,16
	bcnd	 ne0,r13,@L1609
	ld	 r12,r12,80
	ld	 r13,r21,4
	st	 r13,r12,48
@L1609:
	ld	 r12,r22,48
	ld.bu	 r13,r12,8
	cmp	 r13,r13,32
	bb1.n	 ne,r13,@L1645
	or	 r3,r0,0
	br.n	 @L1597
	st	 r12,r0,r22
	align	 4
@L1645:
	or	 r2,r0,32
	bsr.n	 _build_decl
	or	 r4,r0,r22
	bsr	 _pushdecl
	st	 r2,r0,r22
@L1597:
	ld.bu	 r2,r17,8
	cmp	 r2,r2,32
	or	 r3,r0,140
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	ld	 r4,r17,32
	bcnd	 eq0,r4,@L1647
	ld	 r13,r17,40
	bcnd.n	 ne0,r13,@L1647
	or.u	 r13,r0,hi16(_current_class_name)
	ld	 r5,r24,4
	ld	 r3,r13,lo16(_current_class_name)
	bsr.n	 _set_nested_typename
	or	 r2,r0,r24
@L1647:
	ld	 r11,r24,4
	ld	 r13,r11,48
	bcnd	 eq0,r13,@L1592
	ld	 r13,r13,32
	bcnd.n	 eq0,r13,@L1592
	or.u	 r23,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r23,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	ld	 r25,r24,32
	bb0.n	 ne,r13,@L1650
	or	 r22,r0,r11
	ld	 r3,r25,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r23,lo16(_current_binding_level)
	br.n	 @L1651
	st	 r2,r13,16
	align	 4
@L1650:
	or.u	 r23,r0,hi16(_class_binding_level)
	ld	 r13,r23,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L1651
	ld	 r3,r25,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r23,lo16(_class_binding_level)
	st	 r2,r13,16
@L1651:
	st	 r22,r25,4
@L1592:
	ld	 r10,r24,28
	bb0.n	 (31-8),r10,@L1653
	or.u	 r11,r0,0x80
	ld	 r12,r20,20
	bcnd	 eq0,r12,@L1653
	ld	 r13,r12,28
	and	 r13,r13,r11
	bcnd	 ne0,r13,@L1654
	ld	 r13,r12,8
	bb0.n	 (31-19),r13,@L1759
	or.u	 r13,r0,hi16(_flag_traditional)
@L1654:
	bb1.n	 (31-11),r10,@L1759
	or.u	 r13,r0,hi16(_flag_traditional)
	ld	 r2,r24,4
	ld	 r3,r12,4
	bsr.n	 _comptypes
	or	 r4,r0,1
	bcnd.n	 ne0,r2,@L1759
	or.u	 r13,r0,hi16(_flag_traditional)
	or.u	 r3,r0,hi16(@LC78)
	or	 r2,r0,r24
	bsr.n	 _warning_with_decl
	or	 r3,r3,lo16(@LC78)
	or.u	 r3,r0,hi16(@LC79)
	ld	 r2,r20,20
	bsr.n	 _warning_with_decl
	or	 r3,r3,lo16(@LC79)
@L1653:
	or.u	 r13,r0,hi16(_flag_traditional)
@L1759:
	ld	 r13,r13,lo16(_flag_traditional)
	bcnd	 eq0,r13,@L1656
	ld	 r13,r24,28
	bb0.n	 (31-8),r13,@L1656
	or	 r2,r0,r20
	bsr.n	 _lookup_name
	or	 r3,r0,0
	bcnd.n	 ne0,r2,@L1760
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r15,r13,lo16(_global_binding_level)
@L1656:
	or.u	 r13,r0,hi16(_global_binding_level)
@L1760:
	ld	 r12,r13,lo16(_global_binding_level)
	cmp	 r13,r15,r12
	bb1.n	 ne,r13,@L1657
	or.u	 r22,r0,hi16(_current_binding_level)
	ld	 r11,r24,8
	or.u	 r12,r0,0x2104
	mask.u	 r13,r11,0xff04
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L1658
	ld	 r13,r24,28
	bb1.n	 (31-19),r13,@L1658
	and	 r13,r11,0xefff
	st	 r13,r24,8
@L1658:
	ld	 r13,r20,20
	bcnd	 ne0,r13,@L1659
	ld	 r13,r24,8
	bb0	 (31-19),r13,@L1659
	ld	 r13,r20,8
	or	 r13,r13,4096
	st	 r13,r20,8
@L1659:
	ld.bu	 r13,r24,8
	cmp	 r12,r18,0
	cmp	 r13,r13,32
	or.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd	 ne0,r13,@L1661
	ld.bu	 r13,r18,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L1660
@L1661:
	st	 r24,r20,20
@L1660:
	ld	 r13,r20,36
	bcnd	 eq0,r13,@L1672
	ld	 r13,r13,4
	bcnd	 eq0,r13,@L1662
	ld	 r13,r13,8
	bb0	 (31-16),r13,@L1662
	ld	 r13,r24,8
	or	 r13,r13,32768
	st	 r13,r24,8
@L1662:
	ld	 r13,r20,36
	bcnd	 eq0,r13,@L1672
	ld	 r13,r13,4
	bcnd	 eq0,r13,@L1667
	ld	 r13,r13,8
	bb0.n	 (31-11),r13,@L1667
	or.u	 r12,r0,0x10
	ld	 r13,r24,8
	or	 r13,r13,r12
	st	 r13,r24,8
@L1667:
	ld	 r13,r20,36
	bcnd	 eq0,r13,@L1672
	ld	 r13,r13,4
	bcnd	 eq0,r13,@L1672
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1.n	 ne,r13,@L1761
	or.u	 r25,r0,hi16(@LC80)
	or.u	 r12,r0,hi16(_integer_type_node)
	ld	 r13,r24,4
	ld	 r12,r12,lo16(_integer_type_node)
	ld	 r13,r13,4
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L1672
@L1761:
	or	 r2,r0,r24
	bsr.n	 _lang_printable_name
	or	 r25,r25,lo16(@LC80)
	or	 r3,r0,r2
	bsr.n	 _warning
	or	 r2,r0,r25
@L1672:
	ld	 r13,r20,8
	bb0	 (31-19),r13,@L1681
	ld.bu	 r13,r24,8
	cmp	 r13,r13,32
	bb0	 ne,r13,@L1681
	ld	 r13,r24,8
	bb1	 (31-19),r13,@L1681
	ld	 r13,r24,28
	bb1	 (31-8),r13,@L1681
	ld	 r13,r20,36
	bcnd	 eq0,r13,@L1677
	ld	 r13,r13,4
	bcnd.n	 eq0,r13,@L1677
	or.u	 r25,r0,hi16(@LC81)
	or	 r2,r0,r24
	br.n	 @L1750
	or	 r25,r25,lo16(@LC81)
	align	 4
@L1677:
	or.u	 r25,r0,hi16(@LC82)
	or	 r2,r0,r24
	or	 r25,r25,lo16(@LC82)
@L1750:
	bsr	 _lang_printable_name
	or	 r3,r0,r2
	or	 r2,r0,r25
	bsr.n	 _warning
	addu	 r1,r1,@L1774
@L1775:
	align	 4
@L1657:
	ld	 r11,r22,lo16(_current_binding_level)
	ld	 r23,r20,24
	cmp	 r13,r11,r12
	ld	 r25,r20,20
	bb0.n	 ne,r13,@L1683
	or	 r2,r0,r20
	ld	 r4,r11,8
	bsr.n	 _tree_cons
	or	 r3,r0,r23
	ld	 r13,r22,lo16(_current_binding_level)
	br.n	 @L1762
	st	 r2,r13,8
	align	 4
@L1683:
	or.u	 r22,r0,hi16(_class_binding_level)
	ld	 r13,r22,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L1762
	ld	 r4,r13,8
	bsr.n	 _tree_cons
	or	 r3,r0,r23
	ld	 r13,r22,lo16(_class_binding_level)
	st	 r2,r13,8
@L1762:
	bcnd.n	 ne0,r23,@L1686
	st	 r24,r20,24
	ld	 r13,r24,28
	or.u	 r12,r0,0x80
	mask.u	 r13,r13,0x90
	cmp	 r13,r13,r12
	cmp	 r12,r25,0
	and.c	 r12,r13,r12
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L1686
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1.n	 ne,r13,@L1763
	cmp	 r13,r23,0
	ld.bu	 r13,r25,8
	cmp	 r13,r13,29
	bb1.n	 ne,r13,@L1763
	cmp	 r13,r23,0
	ld	 r2,r24,4
	ld	 r3,r25,4
	bsr.n	 _comptypes
	or	 r4,r0,1
	bcnd.n	 ne0,r2,@L1687
	or.u	 r3,r0,hi16(@LC83)
	or	 r2,r0,r24
	or	 r3,r3,lo16(@LC83)
	bsr.n	 _warning_with_decl
	addu	 r1,r1,@L1776
@L1777:
	align	 4
@L1687:
	ld	 r11,r25,28
	bb0	 (31-11),r11,@L1689
	ld	 r12,r24,28
	or.u	 r13,r0,hi16(_current_function_decl)
	and.u	 r12,r12,0xffef
	ld	 r13,r13,lo16(_current_function_decl)
	mask.u	 r11,r11,0x10
	or	 r10,r0,0
	cmp	 r13,r13,r25
	or	 r12,r12,r11
	bb0.n	 ne,r13,@L1690
	st	 r12,r24,28
	ld	 r10,r25,48
@L1690:
	st	 r10,r24,48
	ld	 r13,r25,72
	st	 r13,r24,72
	ld	 r13,r25,40
	st	 r13,r24,40
	ld	 r13,r25,44
	ld	 r12,r24,8
	st	 r13,r24,44
	ld	 r13,r25,8
	and.u	 r12,r12,0xfffe
	mask.u	 r13,r13,0x1
	st	 r25,r24,52
	or	 r12,r12,r13
	st	 r12,r24,8
@L1689:
	ld	 r12,r25,28
	bb0	 (31-12),r12,@L1692
	ld	 r13,r24,28
	and.u	 r13,r13,0xfff7
	mask.u	 r12,r12,0x8
	or	 r13,r13,r12
	st	 r13,r24,28
	ld	 r13,r25,68
	st	 r13,r24,68
@L1692:
	ld	 r12,r25,4
	ld	 r13,r12,12
	bcnd	 eq0,r13,@L1686
	ld	 r13,r25,48
	bcnd	 eq0,r13,@L1686
	ld	 r13,r24,4
	ld	 r13,r13,12
	bcnd	 ne0,r13,@L1686
	st	 r12,r24,4
@L1686:
	cmp	 r13,r23,0
@L1763:
	cmp	 r12,r25,0
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L1694
	ld	 r13,r24,28
	bb0	 (31-8),r13,@L1694
	ld	 r13,r24,8
	bb0	 (31-19),r13,@L1694
	ld	 r13,r20,8
	or	 r13,r13,4096
	st	 r13,r20,8
@L1694:
	ld	 r13,r24,52
	bcnd	 ne0,r13,@L1696
	bcnd	 eq0,r23,@L1697
	ld	 r13,r24,28
	bb1.n	 (31-8),r13,@L1764
	or.u	 r13,r0,hi16(_warn_shadow)
	ld.bu	 r13,r23,8
	cmp	 r13,r13,34
	bb1.n	 ne,r13,@L1764
	or.u	 r13,r0,hi16(_warn_shadow)
	ld.bu	 r13,r24,8
	cmp	 r13,r13,34
	bb0.n	 ne,r13,@L1697
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_cleanup_label)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_cleanup_label)
	ld	 r13,r13,28
	bcnd	 eq0,r12,@L1698
	ld	 r13,r13,28
@L1698:
	ld	 r13,r13,32
	mask	 r13,r13,61440
	cmp	 r13,r13,4096
	bb1.n	 ne,r13,@L1696
	or.u	 r2,r0,hi16(@LC84)
	ld	 r3,r20,16
	br.n	 @L1752
	or	 r2,r2,lo16(@LC84)
	align	 4
@L1697:
	or.u	 r13,r0,hi16(_warn_shadow)
@L1764:
	ld	 r13,r13,lo16(_warn_shadow)
	bcnd	 eq0,r13,@L1696
	ld	 r13,r24,28
	bb1	 (31-8),r13,@L1696
	ld	 r13,r24,16
	bcnd	 eq0,r13,@L1696
	ld	 r13,r24,52
	bcnd	 ne0,r13,@L1696
	bcnd.n	 eq0,r23,@L1702
	or	 r2,r0,0
	ld.bu	 r13,r23,8
	cmp	 r13,r13,34
	bb1.n	 ne,r13,@L1702
	or.u	 r13,r0,hi16(@LC85)
	br.n	 @L1703
	or	 r2,r13,lo16(@LC85)
	align	 4
@L1702:
	ld	 r13,r20,28
	bcnd.n	 eq0,r13,@L1704
	or.u	 r13,r0,hi16(@LC86)
	br.n	 @L1703
	or	 r2,r13,lo16(@LC86)
	align	 4
@L1704:
	bcnd.n	 eq0,r23,@L1706
	or.u	 r13,r0,hi16(@LC87)
	br.n	 @L1703
	or	 r2,r13,lo16(@LC87)
	align	 4
@L1706:
	bcnd.n	 eq0,r25,@L1703
	or.u	 r13,r0,hi16(@LC88)
	or	 r2,r13,lo16(@LC88)
@L1703:
	bcnd	 eq0,r2,@L1696
	ld	 r3,r20,16
@L1752:
	bsr	 _warning
@L1696:
	bcnd.n	 eq0,r23,@L1681
	or	 r2,r0,r20
	ld	 r4,r15,8
	bsr.n	 _tree_cons
	or	 r3,r0,r23
	st	 r2,r15,8
@L1681:
	ld.bu	 r13,r24,8
	addu	 r13,r13,128
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb1	 ls,r13,@L1574
	ld	 r12,r24,4
	ld	 r13,r12,16
	bcnd	 ne0,r13,@L1574
	ld.bu	 r13,r12,8
	cmp	 r13,r13,18
	bb1	 ne,r13,@L1713
	ld	 r13,r12,4
	ld	 r13,r13,24
	bb1	 (31-22),r13,@L1712
@L1713:
	ld	 r13,r12,24
	bb0	 (31-22),r13,@L1574
@L1712:
	ld.hu	 r13,r15,32
	addu	 r13,r13,1
	mask	 r12,r13,0xffff
	bcnd.n	 ne0,r12,@L1574
	st.h	 r13,r15,32
	or.u	 r2,r0,hi16(@LC89)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC89)
@L1574:
	ld.bu	 r12,r24,8
	cmp	 r13,r20,0
	cmp	 r12,r12,32
	and.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L1715
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r12,r13,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L1717
	or.u	 r13,r0,hi16(_class_binding_level)
	ld	 r13,r13,lo16(_class_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L1718
	ld	 r12,r20,24
	bcnd	 eq0,r12,@L1721
	ld.bu	 r13,r12,8
	cmp	 r13,r13,32
	bb1.n	 ne,r13,@L1765
	or.u	 r13,r0,hi16(_current_class_type)
@L1720:
	ld	 r13,r12,4
	br.n	 @L1716
	st	 r13,r20,4
	align	 4
@L1718:
	bsr.n	 _my_friendly_abort
	or	 r2,r0,7
@L1721:
	or.u	 r13,r0,hi16(_current_class_type)
@L1765:
	ld	 r13,r13,lo16(_current_class_type)
	bcnd	 eq0,r13,@L1717
	ld	 r12,r20,28
	bcnd	 eq0,r12,@L1717
	ld.bu	 r13,r12,8
	cmp	 r13,r13,32
	bb1	 eq,r13,@L1720
@L1717:
	ld	 r12,r20,20
	bcnd	 eq0,r12,@L1716
	ld.bu	 r11,r12,8
	cmp	 r13,r11,32
	bb1.n	 eq,r13,@L1720
	cmp	 r13,r11,129
	bb1	 ne,r13,@L1716
	st	 r0,r20,4
@L1716:
	or.u	 r13,r0,hi16(_current_class_name)
	ld	 r3,r13,lo16(_current_class_name)
	bcnd	 eq0,r3,@L1715
	ld	 r13,r24,40
	bcnd.n	 ne0,r13,@L1766
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r4,r24,32
	ld	 r5,r24,4
	bsr.n	 _set_nested_typename
	or	 r2,r0,r24
	or.u	 r13,r0,hi16(_current_binding_level)
@L1766:
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r11,r13,lo16(_current_binding_level)
	ld	 r13,r12,lo16(_global_binding_level)
	cmp	 r13,r11,r13
	ld	 r25,r24,40
	bb0.n	 ne,r13,@L1729
	or.u	 r13,r0,hi16(_class_binding_level)
	ld	 r13,r13,lo16(_class_binding_level)
	cmp	 r13,r11,r13
	bb0	 ne,r13,@L1730
	ld	 r12,r25,24
	bcnd	 eq0,r12,@L1733
	ld.bu	 r13,r12,8
	cmp	 r13,r13,32
	bb1.n	 ne,r13,@L1767
	or.u	 r13,r0,hi16(_current_class_type)
@L1732:
	ld	 r13,r12,4
	br.n	 @L1715
	st	 r13,r25,4
	align	 4
@L1730:
	bsr.n	 _my_friendly_abort
	or	 r2,r0,7
@L1733:
	or.u	 r13,r0,hi16(_current_class_type)
@L1767:
	ld	 r13,r13,lo16(_current_class_type)
	bcnd	 eq0,r13,@L1729
	ld	 r12,r25,28
	bcnd	 eq0,r12,@L1729
	ld.bu	 r13,r12,8
	cmp	 r13,r13,32
	bb1	 eq,r13,@L1732
@L1729:
	ld	 r12,r25,20
	bcnd	 eq0,r12,@L1715
	ld.bu	 r11,r12,8
	cmp	 r13,r11,32
	bb1.n	 eq,r13,@L1732
	cmp	 r13,r11,129
	bb1	 ne,r13,@L1715
	st	 r0,r25,4
@L1715:
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r0,r15
	ld	 r13,r13,lo16(_global_binding_level)
	st	 r12,r0,r24
	cmp	 r13,r15,r13
	bb0.n	 eq,r13,@L1738
	st	 r24,r0,r15
	ld	 r13,r24,8
	bb1.n	 (31-10),r13,@L1739
	or	 r2,r0,r24
	bsr.n	 _my_friendly_abort
	or	 r2,r0,124
@L1738:
	or	 r2,r0,r24
@L1739:
@Lte33:
	ld	 r1,r31,80
	ld	 r15,r31,36
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	jmp.n	 r1
	addu	 r31,r31,96
	def	 @L1776,@L1686-@L1777
	def	 @L1774,@L1681-@L1775
	def	 @L1772,@L1747-@L1773
	def	 @L1770,@L1744-@L1771
	def	 @L1768,@L1769-@L1743

	align	 8
	global	 _pushdecl_top_level
_pushdecl_top_level:
	subu	 r31,r31,64
	st.d	 r24,r31,40
	or.u	 r25,r0,hi16(_current_binding_level)
	st.d	 r22,r31,32
	or.u	 r22,r0,hi16(_global_binding_level)
	ld	 r24,r25,lo16(_current_binding_level)
	ld	 r13,r22,lo16(_global_binding_level)
	or	 r23,r0,r2
	st	 r1,r31,48
@Ltb34:
	bsr.n	 _pushdecl
	st	 r13,r25,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_class_binding_level)
	ld	 r13,r13,lo16(_class_binding_level)
	or	 r8,r0,r2
	bcnd.n	 eq0,r13,@L1795
	st	 r24,r25,lo16(_current_binding_level)
	or	 r24,r0,r13
@L1795:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,32
	bb0	 eq,r13,@L1796
	ld	 r10,r23,32
	ld	 r12,r22,lo16(_global_binding_level)
	cmp	 r13,r24,r12
	bb0.n	 ne,r13,@L1798
	or	 r11,r0,0
	or	 r9,r0,r12
@L1800:
	ld	 r12,r24,16
	bcnd	 eq0,r12,@L1799
@L1804:
	ld	 r13,r12,12
	cmp	 r13,r13,r10
	bb1	 ne,r13,@L1803
	addu	 r11,r12,16
@L1803:
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L1804
@L1799:
	ld	 r24,r24,28
	cmp	 r13,r24,r9
	bb1	 ne,r13,@L1800
@L1798:
	ld	 r2,r23,4
	bcnd	 ne0,r11,@L1808
	st	 r2,r10,4
	br	 @L1796
	align	 4
@L1808:
	st	 r2,r0,r11
@L1796:
@Lte34:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	or	 r2,r0,r8
	ld.d	 r22,r31,32
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
	global	 _push_overloaded_decl_top_level
_push_overloaded_decl_top_level:
	subu	 r31,r31,64
	or.u	 r13,r0,hi16(_global_binding_level)
	st.d	 r24,r31,40
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	ld	 r24,r25,lo16(_current_binding_level)
	st	 r1,r31,48
@Ltb35:
	bsr.n	 _push_overloaded_decl
	st	 r13,r25,lo16(_current_binding_level)
@Lte35:
	ld	 r1,r31,48
	st	 r24,r25,lo16(_current_binding_level)
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
	global	 _pushdecl_class_level
_pushdecl_class_level:
	subu	 r31,r31,64
	st	 r1,r31,48
	st.d	 r24,r31,40
	or	 r24,r0,r2
	st	 r23,r31,36
@Ltb36:
	ld	 r23,r24,32
	bcnd	 eq0,r23,@L1821
	ld	 r3,r23,28
	bcnd.n	 eq0,r3,@L1822
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	ld	 r4,r13,12
	bsr.n	 _tree_cons
	or	 r2,r0,r23
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,12
@L1822:
	or.u	 r25,r0,hi16(_decl_obstack+12)
	st	 r24,r23,28
	or	 r2,r25,lo16(_decl_obstack+12)
	ld	 r13,r25,lo16(_decl_obstack+12)
	ld	 r12,r2,4
	addu	 r13,r13,4
	cmp	 r13,r13,r12
	bb1.n	 ls,r13,@L1824
	subu	 r2,r2,12
	bsr.n	 __obstack_newchunk
	or	 r3,r0,4
@L1824:
	ld	 r12,r25,lo16(_decl_obstack+12)
	addu	 r13,r12,4
	st	 r13,r25,lo16(_decl_obstack+12)
	st	 r24,r0,r12
	ld.bu	 r13,r24,8
	cmp	 r13,r13,32
	bb0	 eq,r13,@L1821
	ld	 r13,r24,40
	bcnd	 ne0,r13,@L1821
	ld	 r5,r24,4
	or.u	 r13,r0,hi16(_current_class_name)
	or	 r2,r0,r24
	ld	 r3,r13,lo16(_current_class_name)
	bsr.n	 _set_nested_typename
	or	 r4,r0,r23
@L1821:
@Lte36:
	ld	 r1,r31,48
	ld	 r23,r31,36
	or	 r2,r0,r24
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
	global	 _overloaded_globals_p
_overloaded_globals_p:
	subu	 r31,r31,48
	st	 r25,r31,32
	or	 r25,r0,r2
	st	 r1,r31,36
@Ltb37:
	ld.bu	 r2,r25,8
	cmp	 r2,r2,3
	or	 r3,r0,142
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	ld	 r13,r25,8
	bb1.n	 (31-22),r13,@L1832
	subu	 r2,r0,1
	ld	 r13,r25,12
	ld.bu	 r2,r13,8
	cmp	 r2,r2,1
	extu	 r2,r2,1<eq>
@L1832:
@Lte37:
	ld	 r1,r31,36
	ld	 r25,r31,32
	jmp.n	 r1
	addu	 r31,r31,48

data
	align	 8
@LC90:
	string	 "C-language function `%s' overloaded here\000"
	align	 8
@LC91:
	string	 "Previous C-language version of this function was "
	string	 "`%s'\000"
	align	 8
@LC92:
	string	 "conflicting language contexts for declaration of "
	string	 "`%s';\000"
	align	 8
@LC93:
	string	 "conflicts with previous declaration here\000"
	align	 8
@LC94:
	string	 "non-function declaration `%s'\000"
	align	 8
@LC95:
	string	 "conflicts with function declaration `%s'\000"
	align	 8
@LC96:
	string	 "conflicting language contexts for declaration of "
	string	 "`%s';\000"
	align	 8
@LC97:
	string	 "conflicts with previous declaration here\000"
	align	 8
@LC98:
	string	 "C-language function `%s' overloaded here\000"
	align	 8
@LC99:
	string	 "Previous C-language version of this function was "
	string	 "`%s'\000"
text
	align	 8
	global	 _push_overloaded_decl
_push_overloaded_decl:
	subu	 r31,r31,80
	st	 r1,r31,64
	st.d	 r24,r31,56
	st.d	 r22,r31,48
	or	 r23,r0,r2
	st.d	 r20,r31,40
@Ltb38:
	ld	 r22,r23,32
	ld	 r13,r23,28
	ld	 r24,r22,20
	or	 r20,r0,r3
	or	 r13,r13,1024
	bcnd.n	 eq0,r24,@L1868
	st	 r13,r23,28
	ld.bu	 r12,r24,8
	cmp	 r13,r12,3
	bb0	 ne,r13,@L1869
	ld	 r13,r23,80
	ld.bu	 r13,r0,r13
	bcnd.n	 ne0,r13,@L1870
	cmp	 r13,r12,29
	bb1	 ne,r13,@L1871
	ld	 r13,r24,80
	ld.bu	 r13,r0,r13
	bcnd.n	 ne0,r13,@L1870
	or.u	 r3,r0,hi16(@LC90)
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC90)
	or.u	 r3,r0,hi16(@LC91)
	or	 r2,r0,r24
	or	 r3,r3,lo16(@LC91)
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L1908
@L1909:
	align	 4
@L1871:
	bsr.n	 _my_friendly_abort
	or	 r2,r0,9
@L1870:
	bcnd.n	 eq0,r20,@L1874
	or.u	 r13,r0,hi16(_flag_traditional)
	ld	 r13,r13,lo16(_flag_traditional)
	bcnd	 ne0,r13,@L1874
	ld	 r13,r24,8
	bb0.n	 (31-10),r13,@L1874
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L1874
	or.u	 r25,r0,hi16(_overloads_to_forget)
	or	 r2,r0,r22
	ld	 r4,r25,lo16(_overloads_to_forget)
	bsr.n	 _tree_cons
	or	 r3,r0,r24
	st	 r2,r25,lo16(_overloads_to_forget)
@L1874:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,106
	bb1	 ne,r13,@L1876
	ld	 r24,r24,16
@L1876:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1.n	 ne,r13,@L1906
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r24,80
	ld	 r12,r23,80
	ld.bu	 r13,r0,r13
	ld.bu	 r12,r0,r12
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L1877
	ld	 r2,r24,4
	ld	 r3,r23,4
	bsr.n	 _comptypes
	or	 r4,r0,1
	bcnd.n	 eq0,r2,@L1877
	or.u	 r13,r0,hi16(_current_lang_stack)
	or.u	 r12,r0,hi16(_current_lang_base)
	ld	 r13,r13,lo16(_current_lang_stack)
	ld	 r12,r12,lo16(_current_lang_base)
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L1878
	or.u	 r3,r0,hi16(@LC92)
	ld	 r13,r24,80
	ld	 r12,r23,80
	ld.bu	 r13,r0,r13
	or	 r2,r0,r24
	br.n	 @L1901
	st.b	 r13,r0,r12
	align	 4
@L1878:
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC92)
	or.u	 r3,r0,hi16(@LC93)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC93)
@L1877:
	or.u	 r13,r0,hi16(_pedantic)
@L1906:
	ld	 r13,r13,lo16(_pedantic)
	bcnd	 eq0,r13,@L1880
	ld.bu	 r13,r24,8
	cmp	 r13,r13,33
	bb1.n	 ne,r13,@L1880
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13,132
	ld.b	 r2,r0,r13
	cmp	 r2,r2,100
	or	 r3,r0,143
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	or.u	 r3,r0,hi16(@LC94)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC94)
	or.u	 r3,r0,hi16(@LC95)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC95)
@L1880:
	or	 r2,r0,r22
	or	 r3,r0,r24
	bsr.n	 _tree_cons
	or	 r4,r0,0
	or	 r24,r0,r2
	ld	 r2,r24,12
	br.n	 @L1905
	or	 r3,r0,r23
	align	 4
@L1869:
	ld	 r13,r24,16
	bcnd.n	 ne0,r13,@L1881
	or	 r2,r0,r23
	br.n	 @L1901
	st	 r2,r24,16
	align	 4
@L1881:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,129
	bb0	 ne,r13,@L1868
	or	 r25,r0,r24
	ld	 r21,r23,60
@L1886:
	ld	 r11,r25,16
	ld.bu	 r13,r11,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L1887
	ld	 r13,r11,80
	ld	 r12,r23,80
	ld.bu	 r13,r0,r13
	ld.bu	 r12,r0,r12
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L1887
	ld	 r2,r11,4
	ld	 r3,r23,4
	bsr.n	 _comptypes
	or	 r4,r0,1
	bcnd	 eq0,r2,@L1887
	or.u	 r3,r0,hi16(@LC96)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC96)
	or.u	 r3,r0,hi16(@LC97)
	ld	 r2,r25,16
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC97)
@L1887:
	ld	 r12,r25,16
	ld.bu	 r13,r12,8
	cmp	 r13,r13,129
	bb1	 eq,r13,@L1885
	ld	 r13,r12,60
	cmp	 r13,r13,r21
	bb0.n	 ne,r13,@L1901
	or	 r2,r0,r23
@L1885:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L1886
@L1868:
	ld	 r13,r23,80
	ld.bu	 r13,r0,r13
	bcnd	 ne0,r13,@L1890
	bcnd.n	 eq0,r24,@L1890
	or	 r25,r0,r24
@L1895:
	ld	 r13,r25,16
	ld	 r13,r13,80
	ld.bu	 r13,r0,r13
	cmp	 r13,r13,1
	bb0	 eq,r13,@L1892
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L1895
@L1892:
	bcnd	 eq0,r25,@L1890
	or.u	 r3,r0,hi16(@LC98)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC98)
	or.u	 r3,r0,hi16(@LC99)
	ld	 r2,r25,16
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC99)
@L1890:
	bcnd.n	 eq0,r20,@L1897
	or.u	 r13,r0,hi16(_flag_traditional)
	ld	 r13,r13,lo16(_flag_traditional)
	bcnd.n	 ne0,r13,@L1907
	or	 r2,r0,r22
	bcnd	 eq0,r24,@L1898
	ld	 r13,r24,8
	bb0	 (31-10),r13,@L1907
@L1898:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r12,r13,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd	 ne0,r13,@L1897
	ld	 r13,r12,32
	bb1.n	 (31-29),r13,@L1907
	or	 r2,r0,r22
	or.u	 r25,r0,hi16(_overloads_to_forget)
	ld	 r4,r25,lo16(_overloads_to_forget)
	bsr.n	 _tree_cons
	or	 r3,r0,r24
	st	 r2,r25,lo16(_overloads_to_forget)
@L1897:
	or	 r2,r0,r22
@L1907:
	or	 r3,r0,r23
@L1905:
	bsr.n	 _tree_cons
	or	 r4,r0,r24
	or.u	 r13,r0,hi16(_unknown_type_node)
	ld	 r13,r13,lo16(_unknown_type_node)
	or	 r24,r0,r2
	st	 r24,r22,20
	or	 r2,r0,r23
	st	 r13,r24,4
@L1901:
@Lte38:
	ld	 r1,r31,64
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80
	def	 @L1908,@L1870-@L1909

data
	align	 8
@LC100:
	string	 "implicit declaration of function `%s'\000"
text
	align	 8
	global	 _implicitly_declare
_implicitly_declare:
	subu	 r31,r31,64
	st	 r1,r31,48
	st.d	 r24,r31,40
@Ltb39:
	bsr.n	 _allocation_temporary_p
	or	 r24,r0,r2
	bsr.n	 _push_obstacks_nochange
	or	 r25,r0,r2
	bcnd.n	 eq0,r25,@L1919
	or.u	 r13,r0,hi16(_flag_traditional)
	ld	 r13,r13,lo16(_flag_traditional)
	bcnd.n	 ne0,r13,@L1920
	or.u	 r13,r0,hi16(_warn_implicit)
	ld	 r13,r13,lo16(_warn_implicit)
	bcnd.n	 eq0,r13,@L1920
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L1926
	or.u	 r13,r0,hi16(_default_function_type)
@L1920:
	bsr	 _end_temporary_allocation
@L1919:
	or.u	 r13,r0,hi16(_default_function_type)
@L1926:
	or	 r2,r0,29
	ld	 r4,r13,lo16(_default_function_type)
	bsr.n	 _build_lang_decl
	or	 r3,r0,r24
	or	 r25,r0,r2
	ld	 r13,r25,28
	ld	 r12,r25,8
	or.u	 r13,r13,0x80
	st	 r13,r25,28
	or	 r12,r12,4096
	bsr.n	 _pushdecl
	st	 r12,r25,8
	or	 r2,r0,r25
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _rest_of_decl_compilation
	or	 r5,r0,0
	or.u	 r13,r0,hi16(_warn_implicit)
	ld	 r13,r13,lo16(_warn_implicit)
	bcnd	 eq0,r13,@L1921
	ld	 r13,r24,36
	bcnd	 eq0,r13,@L1923
	ld	 r13,r13,4
	bcnd	 ne0,r13,@L1921
@L1923:
	or.u	 r2,r0,hi16(@LC100)
	ld	 r3,r24,16
	bsr.n	 _pedwarn
	or	 r2,r2,lo16(@LC100)
@L1921:
	ld	 r13,r24,36
	bcnd.n	 ne0,r13,@L1927
	or	 r2,r0,1
	bsr.n	 _perm_calloc
	or	 r3,r0,20
	st	 r2,r24,36
	ld	 r13,r24,36
@L1927:
	bsr.n	 _pop_obstacks
	st	 r25,r13,4
@Lte39:
	ld	 r1,r31,48
	or	 r2,r0,r25
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

data
	align	 8
@LC101:
	string	 "redefinition of `%s'\000"
	align	 8
@LC102:
	string	 "`%s' not declared in class\000"
	align	 8
@LC103:
	string	 "redefinition of `%s'\000"
	align	 8
@LC104:
	string	 "redefinition of `%s'\000"
	align	 8
@LC105:
	string	 "conflicting declarations of `%s'\000"
	align	 8
@LC106:
	string	 "redeclaration of `%s'\000"
text
	align	 8
_redeclaration_error_message:
@Ltb40:
	ld.bu	 r8,r2,8
	cmp	 r9,r8,32
	bb1.n	 ne,r9,@L1949
	cmp	 r9,r8,29
	ld	 r9,r3,4
	ld	 r8,r2,4
	cmp	 r9,r9,r8
	bb1.n	 ne,r9,@L1950
	or.u	 r2,r0,hi16(@LC101)
@L1969:
	jmp.n	 r1
	or	 r2,r0,0
	align	 4
@L1950:
	jmp.n	 r1
	or	 r2,r2,lo16(@LC101)
	align	 4
@L1949:
	bb1.n	 ne,r9,@L1953
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r9,r3,80
	bcnd	 eq0,r9,@L1954
	ld	 r9,r0,r9
	bb1	 (31-16),r9,@L1969
@L1954:
	ld	 r9,r3,48
	bcnd	 eq0,r9,@L1969
	ld	 r9,r2,48
	bcnd	 eq0,r9,@L1969
	ld	 r8,r3,28
	or.u	 r9,r0,0x90
	and	 r8,r8,r9
	cmp	 r9,r8,r9
	bb1	 ne,r9,@L1956
	ld	 r9,r2,28
	and	 r9,r9,r8
	cmp	 r9,r9,r8
	bb0	 eq,r9,@L1969
@L1956:
	ld	 r9,r3,32
	bcnd	 ne0,r9,@L1957
	or.u	 r2,r0,hi16(@LC102)
	jmp.n	 r1
	or	 r2,r2,lo16(@LC102)
	align	 4
@L1957:
	or.u	 r2,r0,hi16(@LC103)
	jmp.n	 r1
	or	 r2,r2,lo16(@LC103)
	align	 4
@L1953:
	or.u	 r8,r0,hi16(_global_binding_level)
	ld	 r9,r9,lo16(_current_binding_level)
	ld	 r8,r8,lo16(_global_binding_level)
	cmp	 r9,r9,r8
	bb1	 ne,r9,@L1960
	ld	 r9,r2,28
	bb1.n	 (31-8),r9,@L1969
	or.u	 r8,r0,0x80
	ld	 r9,r3,28
	and	 r9,r9,r8
	bcnd	 ne0,r9,@L1969
	ld	 r9,r3,48
	bcnd	 eq0,r9,@L1963
	ld	 r9,r2,48
	bcnd	 eq0,r9,@L1963
	or.u	 r2,r0,hi16(@LC104)
	jmp.n	 r1
	or	 r2,r2,lo16(@LC104)
	align	 4
@L1963:
	ld	 r8,r3,8
	ld	 r9,r2,8
	mask	 r8,r8,4096
	mask	 r9,r9,4096
	cmp	 r8,r8,r9
	bb1.n	 eq,r8,@L1969
	or.u	 r2,r0,hi16(@LC105)
	jmp.n	 r1
	or	 r2,r2,lo16(@LC105)
	align	 4
@L1960:
	ld	 r9,r2,28
	bb0.n	 (31-8),r9,@L1967
	or.u	 r8,r0,0x80
	ld	 r9,r3,28
	and	 r9,r9,r8
	bcnd	 ne0,r9,@L1966
@L1967:
	or.u	 r2,r0,hi16(@LC106)
	jmp.n	 r1
	or	 r2,r2,lo16(@LC106)
	align	 4
@L1966:
	jmp.n	 r1
	or	 r2,r0,0
@Lte40:

	align	 8
	global	 _lookup_label
_lookup_label:
	subu	 r31,r31,64
	st	 r1,r31,48
	st.d	 r22,r31,32
	or	 r22,r0,r2
	st.d	 r24,r31,40
@Ltb41:
	ld	 r13,r22,36
	bcnd.n	 eq0,r13,@L1981
	or	 r23,r0,0
	ld	 r23,r0,r13
@L1981:
	bcnd	 eq0,r23,@L1984
	ld	 r13,r23,16
	bcnd	 ne0,r13,@L1983
@L1984:
	or.u	 r13,r0,hi16(_named_label_uses)
	ld	 r11,r13,lo16(_named_label_uses)
	bcnd.n	 eq0,r11,@L1985
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r12,r13,lo16(_current_binding_level)
	ld	 r13,r11,12
	ld	 r12,r0,r12
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L1991
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r11,16
	cmp	 r13,r13,r23
	bb0	 ne,r13,@L1983
@L1985:
	or.u	 r25,r0,hi16(_current_binding_level)
@L1991:
	or.u	 r24,r0,hi16(_named_label_uses)
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r4,r24,lo16(_named_label_uses)
	ld	 r2,r0,r13
	bsr.n	 _tree_cons
	or	 r3,r0,r23
	ld	 r13,r25,lo16(_current_binding_level)
	st	 r2,r24,lo16(_named_label_uses)
	st	 r13,r2,4
@L1983:
	bcnd.n	 eq0,r23,@L1986
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r12,r23,36
	ld	 r13,r13,lo16(_current_function_decl)
	cmp	 r12,r12,r13
	bb0	 ne,r12,@L1987
	ld	 r13,r23,8
	bb1.n	 (31-23),r13,@L1990
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr.n	 _shadow_label
	addu	 r1,r1,@L1993
@L1994:
	align	 4
@L1987:
	br.n	 @L1990
	or	 r2,r0,r23
	align	 4
@L1986:
	or.u	 r13,r0,hi16(_void_type_node)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_void_type_node)
	bsr.n	 _build_decl
	or	 r3,r0,r22
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r11,r13,lo16(_current_function_decl)
	or	 r23,r0,r2
	or.u	 r12,r0,hi16(_input_filename)
	st.b	 r0,r23,28
	or.u	 r13,r0,hi16(_lineno)
	ld	 r12,r12,lo16(_input_filename)
	ld	 r13,r13,lo16(_lineno)
	st	 r11,r23,36
	st	 r12,r23,12
	st	 r13,r23,16
	ld	 r13,r22,36
	bcnd.n	 ne0,r13,@L1992
	or.u	 r25,r0,hi16(_named_labels)
	or	 r2,r0,1
	bsr.n	 _perm_calloc
	or	 r3,r0,20
	st	 r2,r22,36
	or.u	 r25,r0,hi16(_named_labels)
	ld	 r13,r22,36
@L1992:
	ld	 r4,r25,lo16(_named_labels)
	or	 r2,r0,0
	or	 r3,r0,r23
	bsr.n	 _tree_cons
	st	 r23,r0,r13
	or.u	 r13,r0,hi16(_named_label_uses)
	ld	 r13,r13,lo16(_named_label_uses)
	st	 r2,r25,lo16(_named_labels)
	or	 r2,r0,r23
	st	 r2,r13,16
@L1990:
@Lte41:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	ld.d	 r22,r31,32
	jmp.n	 r1
	addu	 r31,r31,64
	def	 @L1993,@L1990-@L1994

	align	 8
	global	 _shadow_label
_shadow_label:
	subu	 r31,r31,64
	st	 r1,r31,48
	st.d	 r22,r31,32
	or	 r22,r0,r2
	st.d	 r24,r31,40
@Ltb42:
	ld	 r13,r22,36
	bcnd.n	 eq0,r13,@L2014
	or	 r24,r0,0
	ld	 r24,r0,r13
@L2014:
	bcnd	 eq0,r24,@L2016
	or.u	 r25,r0,hi16(_shadowed_labels)
	or	 r2,r0,0
	ld	 r4,r25,lo16(_shadowed_labels)
	bsr.n	 _tree_cons
	or	 r3,r0,r24
	ld	 r13,r22,36
	bcnd.n	 ne0,r13,@L2018
	st	 r2,r25,lo16(_shadowed_labels)
	or	 r2,r0,1
	bsr.n	 _perm_calloc
	or	 r3,r0,20
	st	 r2,r22,36
@L2018:
	ld	 r13,r22,36
	st	 r0,r0,r13
	ld	 r13,r24,36
	bcnd.n	 ne0,r13,@L2031
	or	 r2,r0,1
	bsr.n	 _perm_calloc
	or	 r3,r0,20
	st	 r2,r24,36
	ld	 r13,r24,36
@L2031:
	st	 r0,r0,r13
@L2016:
	ld	 r13,r22,36
	bcnd.n	 eq0,r13,@L2022
	or	 r23,r0,0
	ld	 r23,r0,r13
@L2022:
	bcnd	 eq0,r23,@L2025
	ld	 r13,r23,16
	bcnd	 ne0,r13,@L2024
@L2025:
	or.u	 r13,r0,hi16(_named_label_uses)
	ld	 r11,r13,lo16(_named_label_uses)
	bcnd.n	 eq0,r11,@L2026
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r12,r13,lo16(_current_binding_level)
	ld	 r13,r11,12
	ld	 r12,r0,r12
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L2026
	ld	 r13,r11,16
	cmp	 r13,r13,r23
	bb0	 ne,r13,@L2024
@L2026:
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r24,r0,hi16(_named_label_uses)
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r4,r24,lo16(_named_label_uses)
	ld	 r2,r0,r13
	bsr.n	 _tree_cons
	or	 r3,r0,r23
	ld	 r13,r25,lo16(_current_binding_level)
	st	 r2,r24,lo16(_named_label_uses)
	st	 r13,r2,4
@L2024:
	bcnd.n	 eq0,r23,@L2027
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r12,r23,36
	ld	 r13,r13,lo16(_current_function_decl)
	cmp	 r12,r12,r13
	bb0	 ne,r12,@L2028
	ld	 r13,r23,8
	bb1.n	 (31-23),r13,@L2021
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr.n	 _shadow_label
	addu	 r1,r1,@L2033
@L2034:
	align	 4
@L2028:
	br.n	 @L2021
	or	 r2,r0,r23
	align	 4
@L2027:
	or.u	 r13,r0,hi16(_void_type_node)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_void_type_node)
	bsr.n	 _build_decl
	or	 r3,r0,r22
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r11,r13,lo16(_current_function_decl)
	or	 r23,r0,r2
	or.u	 r12,r0,hi16(_input_filename)
	st.b	 r0,r23,28
	or.u	 r13,r0,hi16(_lineno)
	ld	 r12,r12,lo16(_input_filename)
	ld	 r13,r13,lo16(_lineno)
	st	 r11,r23,36
	st	 r12,r23,12
	st	 r13,r23,16
	ld	 r13,r22,36
	bcnd.n	 ne0,r13,@L2032
	or.u	 r25,r0,hi16(_named_labels)
	or	 r2,r0,1
	bsr.n	 _perm_calloc
	or	 r3,r0,20
	st	 r2,r22,36
	or.u	 r25,r0,hi16(_named_labels)
	ld	 r13,r22,36
@L2032:
	ld	 r4,r25,lo16(_named_labels)
	or	 r2,r0,0
	or	 r3,r0,r23
	bsr.n	 _tree_cons
	st	 r23,r0,r13
	or.u	 r13,r0,hi16(_named_label_uses)
	ld	 r13,r13,lo16(_named_label_uses)
	st	 r2,r25,lo16(_named_labels)
	or	 r2,r0,r23
	st	 r2,r13,16
@L2021:
@Lte42:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	ld.d	 r22,r31,32
	jmp.n	 r1
	addu	 r31,r31,64
	def	 @L2033,@L2021-@L2034

data
	align	 8
@LC107:
	string	 "duplicate label `%s'\000"
	align	 8
@LC108:
	string	 "_$tmp_\000"
	align	 8
@LC109:
	string	 "invalid jump to label `%s'\000"
	align	 8
@LC110:
	string	 "crosses initialization of `%s'\000"
text
	align	 8
	global	 _define_label
_define_label:
	subu	 r31,r31,80
	st	 r1,r31,64
	st	 r19,r31,36
	st.d	 r24,r31,56
	st.d	 r22,r31,48
	or	 r22,r0,r4
	st.d	 r20,r31,40
@Ltb43:
	or	 r20,r0,r2
	ld	 r13,r22,36
	or	 r19,r0,r3
	bcnd.n	 eq0,r13,@L2090
	or	 r23,r0,0
	ld	 r23,r0,r13
@L2090:
	bcnd	 eq0,r23,@L2093
	ld	 r13,r23,16
	bcnd	 ne0,r13,@L2092
@L2093:
	or.u	 r13,r0,hi16(_named_label_uses)
	ld	 r11,r13,lo16(_named_label_uses)
	bcnd.n	 eq0,r11,@L2094
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r12,r13,lo16(_current_binding_level)
	ld	 r13,r11,12
	ld	 r12,r0,r12
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L2144
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r11,16
	cmp	 r13,r13,r23
	bb0	 ne,r13,@L2092
@L2094:
	or.u	 r25,r0,hi16(_current_binding_level)
@L2144:
	or.u	 r24,r0,hi16(_named_label_uses)
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r4,r24,lo16(_named_label_uses)
	ld	 r2,r0,r13
	bsr.n	 _tree_cons
	or	 r3,r0,r23
	ld	 r13,r25,lo16(_current_binding_level)
	st	 r2,r24,lo16(_named_label_uses)
	st	 r13,r2,4
@L2092:
	bcnd.n	 eq0,r23,@L2095
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r12,r23,36
	ld	 r13,r13,lo16(_current_function_decl)
	cmp	 r12,r12,r13
	bb0	 ne,r12,@L2096
	ld	 r13,r23,8
	bb1.n	 (31-23),r13,@L2089
	or	 r24,r0,r23
	bsr.n	 _shadow_label
	or	 r2,r0,r22
	br.n	 @L2089
	or	 r24,r0,r2
	align	 4
@L2096:
	br.n	 @L2089
	or	 r24,r0,r23
	align	 4
@L2095:
	or.u	 r13,r0,hi16(_void_type_node)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_void_type_node)
	bsr.n	 _build_decl
	or	 r3,r0,r22
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r11,r13,lo16(_current_function_decl)
	or	 r23,r0,r2
	or.u	 r12,r0,hi16(_input_filename)
	st.b	 r0,r23,28
	or.u	 r13,r0,hi16(_lineno)
	ld	 r12,r12,lo16(_input_filename)
	ld	 r13,r13,lo16(_lineno)
	st	 r11,r23,36
	st	 r12,r23,12
	st	 r13,r23,16
	ld	 r13,r22,36
	bcnd.n	 ne0,r13,@L2145
	or.u	 r25,r0,hi16(_named_labels)
	or	 r2,r0,1
	bsr.n	 _perm_calloc
	or	 r3,r0,20
	st	 r2,r22,36
	or.u	 r25,r0,hi16(_named_labels)
	ld	 r13,r22,36
@L2145:
	ld	 r4,r25,lo16(_named_labels)
	or	 r2,r0,0
	or	 r3,r0,r23
	bsr.n	 _tree_cons
	st	 r23,r0,r13
	or.u	 r13,r0,hi16(_named_label_uses)
	ld	 r13,r13,lo16(_named_label_uses)
	st	 r2,r25,lo16(_named_labels)
	or	 r24,r0,r23
	st	 r24,r13,16
@L2089:
	or.u	 r21,r0,hi16(_current_binding_level)
	ld	 r12,r21,lo16(_current_binding_level)
	ld	 r13,r12,32
	and	 r13,r13,0xff7f
	bcnd.n	 eq0,r24,@L2099
	st	 r13,r12,32
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r12,r24,36
	ld	 r13,r13,lo16(_current_function_decl)
	cmp	 r12,r12,r13
	bb0.n	 ne,r12,@L2099
	or.u	 r25,r0,hi16(_shadowed_labels)
	or	 r2,r0,0
	ld	 r4,r25,lo16(_shadowed_labels)
	bsr.n	 _tree_cons
	or	 r3,r0,r24
	ld	 r13,r22,36
	bcnd.n	 ne0,r13,@L2101
	st	 r2,r25,lo16(_shadowed_labels)
	or	 r2,r0,1
	bsr.n	 _perm_calloc
	or	 r3,r0,20
	st	 r2,r22,36
@L2101:
	ld	 r13,r22,36
	st	 r0,r0,r13
	ld	 r13,r22,36
	bcnd.n	 eq0,r13,@L2103
	or	 r23,r0,0
	ld	 r23,r0,r13
@L2103:
	bcnd	 eq0,r23,@L2106
	ld	 r13,r23,16
	bcnd	 ne0,r13,@L2105
@L2106:
	or.u	 r13,r0,hi16(_named_label_uses)
	ld	 r11,r13,lo16(_named_label_uses)
	bcnd	 eq0,r11,@L2107
	ld	 r12,r11,12
	ld	 r13,r21,lo16(_current_binding_level)
	ld	 r13,r0,r13
	cmp	 r12,r12,r13
	bb1	 ne,r12,@L2107
	ld	 r13,r11,16
	cmp	 r13,r13,r23
	bb0	 ne,r13,@L2105
@L2107:
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r24,r0,hi16(_named_label_uses)
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r4,r24,lo16(_named_label_uses)
	ld	 r2,r0,r13
	bsr.n	 _tree_cons
	or	 r3,r0,r23
	ld	 r13,r25,lo16(_current_binding_level)
	st	 r2,r24,lo16(_named_label_uses)
	st	 r13,r2,4
@L2105:
	bcnd.n	 eq0,r23,@L2108
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r12,r23,36
	ld	 r13,r13,lo16(_current_function_decl)
	cmp	 r12,r12,r13
	bb0	 ne,r12,@L2109
	ld	 r13,r23,8
	bb1.n	 (31-23),r13,@L2099
	or	 r24,r0,r23
	bsr.n	 _shadow_label
	or	 r2,r0,r22
	br.n	 @L2099
	or	 r24,r0,r2
	align	 4
@L2109:
	br.n	 @L2099
	or	 r24,r0,r23
	align	 4
@L2108:
	or.u	 r13,r0,hi16(_void_type_node)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_void_type_node)
	bsr.n	 _build_decl
	or	 r3,r0,r22
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r11,r13,lo16(_current_function_decl)
	or	 r23,r0,r2
	or.u	 r12,r0,hi16(_input_filename)
	st.b	 r0,r23,28
	or.u	 r13,r0,hi16(_lineno)
	ld	 r12,r12,lo16(_input_filename)
	ld	 r13,r13,lo16(_lineno)
	st	 r11,r23,36
	st	 r12,r23,12
	st	 r13,r23,16
	ld	 r13,r22,36
	bcnd.n	 ne0,r13,@L2146
	or.u	 r25,r0,hi16(_named_labels)
	or	 r2,r0,1
	bsr.n	 _perm_calloc
	or	 r3,r0,20
	st	 r2,r22,36
	or.u	 r25,r0,hi16(_named_labels)
	ld	 r13,r22,36
@L2146:
	ld	 r4,r25,lo16(_named_labels)
	or	 r2,r0,0
	or	 r3,r0,r23
	bsr.n	 _tree_cons
	st	 r23,r0,r13
	or.u	 r13,r0,hi16(_named_label_uses)
	ld	 r13,r13,lo16(_named_label_uses)
	st	 r2,r25,lo16(_named_labels)
	or	 r24,r0,r23
	st	 r24,r13,16
@L2099:
	ld	 r13,r24,48
	bcnd.n	 eq0,r13,@L2112
	or.u	 r3,r0,hi16(@LC107)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC107)
	br.n	 @L2141
	or	 r2,r0,0
	align	 4
@L2112:
	or.u	 r13,r0,hi16(_named_label_uses)
	ld	 r23,r13,lo16(_named_label_uses)
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	st	 r20,r24,12
	st	 r19,r24,16
	or	 r20,r0,0
	bcnd.n	 eq0,r23,@L2115
	st	 r13,r24,48
@L2117:
	ld	 r13,r23,16
	cmp	 r13,r13,r24
	bb1.n	 ne,r13,@L2116
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r22,r13,lo16(_current_binding_level)
@L2121:
	ld	 r13,r23,4
	cmp	 r13,r22,r13
	ld	 r25,r0,r22
	bb1.n	 ne,r13,@L2143
	or	 r21,r0,0
	ld	 r21,r23,12
	br.n	 @L2147
	cmp	 r13,r25,r21
	align	 4
@L2126:
	ld.bu	 r13,r25,8
	cmp	 r13,r13,33
	bb1	 ne,r13,@L2127
	ld	 r13,r25,32
	or	 r4,r0,6
	or.u	 r3,r0,hi16(@LC108)
	ld	 r2,r13,16
	bsr.n	 _strncmp
	or	 r3,r3,lo16(@LC108)
	bcnd	 eq0,r2,@L2127
	ld	 r12,r25,48
	bcnd.n	 eq0,r12,@L2129
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L2128
@L2129:
	ld	 r13,r25,4
	ld	 r13,r13,24
	bb0	 (31-20),r13,@L2127
@L2128:
	ld	 r13,r24,36
	bcnd	 eq0,r13,@L2132
	ld	 r13,r13,16
	bcnd	 ne0,r13,@L2130
@L2132:
	or.u	 r3,r0,hi16(@LC109)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC109)
@L2130:
	ld	 r13,r24,36
	bcnd.n	 ne0,r13,@L2148
	or.u	 r13,r0,hi16(_current_function_decl)
	or	 r2,r0,1
	bsr.n	 _perm_calloc
	or	 r3,r0,20
	st	 r2,r24,36
	or.u	 r13,r0,hi16(_current_function_decl)
@L2148:
	ld	 r12,r24,36
	or.u	 r3,r0,hi16(@LC110)
	ld	 r13,r13,lo16(_current_function_decl)
	or	 r2,r0,r25
	or	 r3,r3,lo16(@LC110)
	bsr.n	 _error_with_decl
	st	 r13,r12,16
@L2127:
	ld	 r25,r0,r25
@L2143:
	cmp	 r13,r25,r21
@L2147:
	bb1	 ne,r13,@L2126
	ld	 r13,r23,4
	cmp	 r13,r22,r13
	bb0	 ne,r13,@L2120
	ld	 r22,r22,28
	br	 @L2121
	align	 4
@L2120:
	bcnd	 eq0,r20,@L2138
	ld	 r13,r0,r23
	br.n	 @L2116
	st	 r13,r0,r20
	align	 4
@L2138:
	ld	 r12,r0,r23
	or.u	 r13,r0,hi16(_named_label_uses)
	st	 r12,r13,lo16(_named_label_uses)
@L2116:
	or	 r20,r0,r23
	ld	 r23,r0,r23
	bcnd	 ne0,r23,@L2117
@L2115:
	or.u	 r13,r0,hi16(_current_function_return_value)
	or	 r2,r0,r24
	st	 r0,r13,lo16(_current_function_return_value)
@L2141:
@Lte43:
	ld	 r1,r31,64
	ld	 r19,r31,36
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80

data
	align	 4
_explained.99:
	word	 0
	align	 8
@LC111:
	string	 "destructor needed for `%s'\000"
	align	 8
@LC112:
	string	 "where case label appears here\000"
	align	 8
@LC113:
	string	 "(enclose actions of previous case statements requ"
	string	 "iring\000"
	align	 8
@LC114:
	string	 "destructors in their own binding contours.)\000"
text
	align	 8
	global	 _define_case_label
_define_case_label:
	subu	 r31,r31,48
	st	 r1,r31,36
	bsr.n	 _last_cleanup_this_contour
	st	 r25,r31,32
@Ltb44:
	bcnd.n	 eq0,r2,@L2153
	or.u	 r3,r0,hi16(@LC111)
	ld	 r2,r2,12
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC111)
	or.u	 r2,r0,hi16(@LC112)
	or	 r2,r2,lo16(@LC112)
	bsr.n	 _error
	or.u	 r25,r0,hi16(_explained.99)
	ld	 r13,r25,lo16(_explained.99)
	bcnd.n	 ne0,r13,@L2155
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r2,r0,hi16(@LC113)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC113)
	or.u	 r2,r0,hi16(@LC114)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC114)
	or	 r13,r0,1
	st	 r13,r25,lo16(_explained.99)
@L2153:
	or.u	 r13,r0,hi16(_current_binding_level)
@L2155:
	ld	 r11,r13,lo16(_current_binding_level)
	ld	 r13,r11,32
	or.u	 r12,r0,hi16(_current_function_return_value)
	st	 r0,r12,lo16(_current_function_return_value)
	and	 r13,r13,0xff7f
	st	 r13,r11,32
@Lte44:
	ld	 r1,r31,36
	ld	 r25,r31,32
	jmp.n	 r1
	addu	 r31,r31,48

	align	 8
	global	 _getdecls
_getdecls:
@Ltb45:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r9,r9,lo16(_current_binding_level)
	ld	 r2,r0,r9
	jmp	 r1
@Lte45:

	align	 8
	global	 _gettags
_gettags:
@Ltb46:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r9,r9,lo16(_current_binding_level)
	ld	 r2,r9,4
	jmp	 r1
@Lte46:

data
	align	 8
@LC115:
	string	 "`%s' defined as wrong kind of tag\000"
	align	 8
@LC116:
	string	 "`%s' defined as wrong kind of tag in class scope\000"
text
	align	 8
	global	 _set_current_level_tags_transparency
_set_current_level_tags_transparency:
@Ltb47:
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r8,r9,lo16(_current_binding_level)
	ld	 r9,r8,32
	mak	 r2,r2,1<8>
	and	 r9,r9,0xfeff
	or	 r9,r9,r2
	jmp.n	 r1
	st	 r9,r8,32
@Lte47:

	align	 8
	global	 _typedecl_for_tag
_typedecl_for_tag:
@Ltb48:
	or	 r7,r0,r2
	ld	 r2,r7,48
	ld.bu	 r9,r2,8
	or.u	 r8,r0,hi16(_current_binding_level)
	cmp	 r9,r9,32
	ld	 r8,r8,lo16(_current_binding_level)
	bb1	 ne,r9,@L2238
	jmp	 r1
	align	 4
@L2238:
	bcnd	 eq0,r8,@L2240
@L2241:
	ld	 r2,r0,r8
	bcnd	 eq0,r2,@L2247
@L2244:
	ld.bu	 r9,r2,8
	cmp	 r9,r9,32
	bb1	 ne,r9,@L2245
	ld	 r9,r2,4
	cmp	 r9,r9,r7
	bb0	 ne,r9,@L2243
@L2245:
	ld	 r2,r0,r2
	bcnd	 ne0,r2,@L2244
@L2243:
	bcnd	 ne0,r2,@L2253
@L2247:
	ld	 r8,r8,28
	bcnd	 ne0,r8,@L2241
@L2240:
	jmp.n	 r1
	or	 r2,r0,0
	align	 4
@L2253:
	jmp	 r1
@Lte48:

data
	align	 8
@LC117:
	string	 "Tried to globalize already-global type \000"
text
	align	 8
_lookup_nested_type:
	subu	 r31,r31,64
	st	 r1,r31,48
	st.d	 r24,r31,40
@Ltb49:
	or	 r25,r0,r3
	br.n	 @L2400
	or	 r24,r0,r2
	align	 4
@L2414:
	ld	 r2,r2,16
	br	 @L2412
	align	 4
@L2402:
	ld.bu	 r12,r25,8
	cmp	 r13,r12,29
	bb0.n	 ne,r13,@L2406
	cmp	 r13,r12,32
	bb1	 ne,r13,@L2409
	ld	 r13,r25,4
	ld	 r13,r13,80
	ld	 r3,r13,48
	bsr.n	 _value_member
	or	 r2,r0,r24
	bcnd	 ne0,r2,@L2414
	ld	 r25,r25,36
	br	 @L2400
	align	 4
@L2406:
	ld	 r13,r24,48
	ld	 r2,r13,32
	bcnd.n	 eq0,r2,@L2416
	or	 r3,r0,1
	bsr.n	 _lookup_name
	addu	 r1,r1,@L2417
@L2418:
	align	 4
@L2409:
	bsr.n	 _my_friendly_abort
	or	 r2,r0,12
@L2400:
	bcnd	 ne0,r25,@L2402
@L2416:
	or	 r2,r0,0
@L2412:
@Lte49:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64
	def	 @L2417,@L2412-@L2418

	align	 8
	global	 _lookup_name
_lookup_name:
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	subu	 r31,r31,64
	st.d	 r24,r31,40
	or	 r25,r0,r2
	or	 r24,r0,r3
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L2438
	st	 r1,r31,48
@Ltb50:
	ld	 r2,r25,24
	bcnd.n	 ne0,r2,@L2439
	or	 r3,r0,r2
@L2438:
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r2,r13,lo16(_current_class_type)
	bcnd	 eq0,r2,@L2440
	ld	 r3,r25,28
	bcnd	 ne0,r3,@L2457
	ld	 r13,r2,16
	bcnd	 ne0,r13,@L2441
	ld	 r13,r2,80
	ld	 r13,r0,r13
	bb0	 (31-24),r13,@L2441
	subu	 r5,r0,1
	or	 r3,r0,r25
	cmp	 r5,r24,r5
	or	 r4,r0,0
	bsr.n	 _lookup_field
	extu	 r5,r5,1<eq>
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	or	 r3,r0,r2
	cmp	 r13,r3,r13
	bb0	 ne,r13,@L2455
	bcnd	 eq0,r3,@L2456
	ld.bu	 r13,r3,8
	cmp	 r13,r13,32
	ext	 r13,r13,1<eq>
	and	 r3,r3,r13
@L2441:
	bcnd	 ne0,r3,@L2457
@L2456:
	bsr.n	 _lookup_nested_field
	or	 r2,r0,r25
	or	 r3,r0,r2
	bcnd	 ne0,r3,@L2457
@L2440:
	ld	 r3,r25,20
@L2439:
	bcnd.n	 eq0,r3,@L2455
	or	 r2,r0,r3
@L2457:
	ld.bu	 r13,r3,8
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L2447
	or.u	 r13,r0,hi16(_looking_for_typename)
	ld	 r11,r13,lo16(_looking_for_typename)
	bcnd	 lt0,r11,@L2447
	ld	 r2,r25,4
	bcnd	 eq0,r2,@L2450
	ld	 r4,r2,48
	cmp	 r13,r24,0
	extu	 r13,r13,1<gt>
	cmp	 r12,r3,r4
	extu	 r12,r12,1<eq>
	or	 r12,r12,r13
	bcnd	 ne0,r12,@L2452
	bcnd	 le0,r11,@L2451
@L2452:
	br.n	 @L2455
	or	 r2,r0,r4
	align	 4
@L2451:
	bcnd.n	 eq0,r24,@L2447
	or	 r2,r0,r25
	bsr.n	 _arbitrate_lookup
	addu	 r1,r1,@L2458
@L2459:
	align	 4
@L2450:
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r2,r3,4
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r2,r13
	bb0	 ne,r13,@L2455
@L2447:
	or	 r2,r0,r3
@L2455:
@Lte50:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64
	def	 @L2458,@L2455-@L2459

	align	 8
_lookup_name_current_level:
@Ltb51:
	or.u	 r9,r0,hi16(_current_binding_level)
	or	 r8,r0,r2
	ld	 r2,r9,lo16(_current_binding_level)
	or.u	 r9,r0,hi16(_global_binding_level)
	ld	 r9,r9,lo16(_global_binding_level)
	cmp	 r9,r2,r9
	bb1	 ne,r9,@L2470
	ld	 r2,r8,20
	jmp	 r1
	align	 4
@L2470:
	ld	 r9,r8,24
	bcnd	 ne0,r9,@L2480
	or	 r2,r0,0
	jmp	 r1
	align	 4
@L2475:
	ld	 r9,r2,32
	cmp	 r9,r9,r8
	bb0	 ne,r9,@L2481
@L2480:
	ld	 r2,r0,r2
	bcnd	 ne0,r2,@L2475
@L2481:
	jmp	 r1
@Lte51:

data
	align	 8
@LC118:
	string	 "C++\000"
	align	 8
@LC119:
	string	 "C\000"
	align	 8
@LC120:
	string	 "this\000"
	align	 8
@LC121:
	string	 "__in$chrg\000"
	align	 8
@LC122:
	string	 "char\000"
	align	 8
@LC123:
	string	 "long int\000"
	align	 8
@LC124:
	string	 "unsigned int\000"
	align	 8
@LC125:
	string	 "long unsigned int\000"
	align	 8
@LC126:
	string	 "unsigned long\000"
	align	 8
@LC127:
	string	 "long unsigned int\000"
	align	 8
@LC128:
	string	 "long int\000"
	align	 8
@LC129:
	string	 "short int\000"
	align	 8
@LC130:
	string	 "long long int\000"
	align	 8
@LC131:
	string	 "short unsigned int\000"
	align	 8
@LC132:
	string	 "unsigned short\000"
	align	 8
@LC133:
	string	 "long long unsigned int\000"
	align	 8
@LC134:
	string	 "long long unsigned\000"
	align	 8
@LC135:
	string	 "signed char\000"
	align	 8
@LC136:
	string	 "unsigned char\000"
	align	 8
@LC137:
	string	 "long double\000"
	align	 8
@LC138:
	string	 "__builtin_constant_p\000"
	align	 8
@LC139:
	string	 "__builtin_alloca\000"
	align	 8
@LC140:
	string	 "alloca\000"
	align	 8
@LC141:
	string	 "__builtin_abs\000"
	align	 8
@LC142:
	string	 "__builtin_fabs\000"
	align	 8
@LC143:
	string	 "__builtin_labs\000"
	align	 8
@LC144:
	string	 "__builtin_ffs\000"
	align	 8
@LC145:
	string	 "__builtin_fsqrt\000"
	align	 8
@LC146:
	string	 "__builtin_sin\000"
	align	 8
@LC147:
	string	 "__builtin_cos\000"
	align	 8
@LC148:
	string	 "__builtin_saveregs\000"
	align	 8
@LC149:
	string	 "__builtin_classify_type\000"
	align	 8
@LC150:
	string	 "__builtin_next_arg\000"
	align	 8
@LC151:
	string	 "__builtin_memcpy\000"
	align	 8
@LC152:
	string	 "memcpy\000"
	align	 8
@LC153:
	string	 "__builtin_memcmp\000"
	align	 8
@LC154:
	string	 "memcmp\000"
	align	 8
@LC155:
	string	 "__builtin_strcmp\000"
	align	 8
@LC156:
	string	 "strcmp\000"
	align	 8
@LC157:
	string	 "__builtin_strcpy\000"
	align	 8
@LC158:
	string	 "strcpy\000"
	align	 8
@LC159:
	string	 "__builtin_strlen\000"
	align	 8
@LC160:
	string	 "strlen\000"
	align	 8
@LC161:
	string	 "memcpy\000"
	align	 8
@LC162:
	string	 "memcmp\000"
	align	 8
@LC163:
	string	 "strcmp\000"
	align	 8
@LC164:
	string	 "strcpy\000"
	align	 8
@LC165:
	string	 "strlen\000"
	align	 8
@LC166:
	string	 "unknown type\000"
	align	 8
@LC167:
	string	 "short unsigned int\000"
	align	 8
@LC168:
	string	 "__wchar_t\000"
	align	 8
@LC169:
	string	 "__gc_main\000"
	align	 8
@LC170:
	string	 "__gc_main\000"
	align	 8
@LC171:
	string	 "delta\000"
	align	 8
@LC172:
	string	 "index\000"
	align	 8
@LC173:
	string	 "pfn\000"
	align	 8
@LC174:
	string	 "$vtbl_ptr_type\000"
	align	 8
@LC175:
	string	 "delta2\000"
	align	 8
@LC176:
	string	 "$vtbl_ptr_type\000"
	align	 8
@LC177:
	string	 "name\000"
	align	 8
@LC178:
	string	 "size\000"
	align	 8
@LC179:
	string	 "bits\000"
	align	 8
@LC180:
	string	 "points_to\000"
	align	 8
@LC181:
	string	 "ivars_count\000"
	align	 8
@LC182:
	string	 "meths_count\000"
	align	 8
@LC183:
	string	 "ivars\000"
	align	 8
@LC184:
	string	 "meths\000"
	align	 8
@LC185:
	string	 "parents\000"
	align	 8
@LC186:
	string	 "vbases\000"
	align	 8
@LC187:
	string	 "offsets\000"
	align	 8
@LC188:
	string	 "__t_desc\000"
	align	 8
@LC189:
	string	 "name\000"
	align	 8
@LC190:
	string	 "offset\000"
	align	 8
@LC191:
	string	 "type\000"
	align	 8
@LC192:
	string	 "__i_desc\000"
	align	 8
@LC193:
	string	 "name\000"
	align	 8
@LC194:
	string	 "vindex\000"
	align	 8
@LC195:
	string	 "vcontext\000"
	align	 8
@LC196:
	string	 "return_type\000"
	align	 8
@LC197:
	string	 "address\000"
	align	 8
@LC198:
	string	 "parm_count\000"
	align	 8
@LC199:
	string	 "required_parms\000"
	align	 8
@LC200:
	string	 "parm_types\000"
	align	 8
@LC201:
	string	 "__m_desc\000"
	align	 8
@LC202:
	string	 "abort\000"
	align	 8
@LC203:
	string	 "__unhandled_exception\000"
text
	align	 8
	global	 _init_decl_processing
_init_decl_processing:
	subu	 r31,r31,240
	st	 r1,r31,80
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	st.d	 r18,r31,48
	or.u	 r2,r0,hi16(@LC118)
	st.d	 r16,r31,40
	or	 r2,r2,lo16(@LC118)
	bsr.n	 _get_identifier
	st.d	 r14,r31,32
@Ltb52:
	or.u	 r13,r0,hi16(_lang_name_cplusplus)
	or.u	 r12,r0,hi16(@LC119)
	st	 r2,r13,lo16(_lang_name_cplusplus)
	or	 r2,r12,lo16(@LC119)
	bsr.n	 _get_identifier
	or.u	 r22,r0,hi16(_named_labels)
	or.u	 r23,r0,hi16(_current_binding_level)
	st	 r0,r22,lo16(_named_labels)
	or.u	 r13,r0,hi16(_lang_name_c)
	st	 r0,r23,lo16(_current_binding_level)
	or.u	 r24,r0,hi16(_free_binding_level)
	st	 r2,r13,lo16(_lang_name_c)
	or.u	 r13,r0,hi16(_current_lang_name)
	st	 r0,r24,lo16(_free_binding_level)
	or.u	 r3,r0,hi16(_sigsegv)
	st	 r2,r13,lo16(_current_lang_name)
	or.u	 r13,r0,hi16(_current_function_decl)
	or	 r3,r3,lo16(_sigsegv)
	st	 r0,r13,lo16(_current_function_decl)
	or.u	 r13,r0,hi16(_named_label_uses)
	or	 r2,r0,11
	bsr.n	 _signal
	st	 r0,r13,lo16(_named_label_uses)
	or.u	 r2,r0,hi16(_decl_obstack)
	bsr.n	 _gcc_obstack_init
	or	 r2,r2,lo16(_decl_obstack)
	or.u	 r13,r0,hi16(_flag_dossier)
	ld	 r13,r13,lo16(_flag_dossier)
	bcnd.n	 eq0,r13,@L2550
	or	 r2,r0,400
	or.u	 r13,r0,hi16(_builtin_type_tdescs_max)
	or	 r12,r0,100
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	bsr.n	 _xmalloc
	st	 r12,r13,lo16(_builtin_type_tdescs_max)
	st	 r2,r25,lo16(_builtin_type_tdescs_arr)
@L2550:
	bsr.n	 _make_node
	or	 r2,r0,0
	ld	 r13,r2,8
	or.u	 r25,r0,hi16(_error_mark_node)
	st	 r2,r2,4
	or	 r3,r0,r2
	st	 r2,r25,lo16(_error_mark_node)
	or.u	 r13,r13,0x20
	bsr.n	 _build_tree_list
	st	 r13,r2,8
	ld	 r10,r25,lo16(_error_mark_node)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r23,lo16(_current_binding_level)
	ld	 r11,r12,lo16(_global_binding_level)
	st	 r10,r2,4
	or.u	 r12,r0,hi16(_error_mark_list)
	cmp	 r13,r13,r11
	bb1.n	 ne,r13,@L2552
	st	 r2,r12,lo16(_error_mark_list)
	ld	 r2,r22,lo16(_named_labels)
	cmp	 r2,r2,0
	or	 r3,r0,134
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
@L2552:
	ld	 r2,r24,lo16(_free_binding_level)
	bcnd.n	 eq0,r2,@L2553
	or	 r25,r0,r2
	ld	 r13,r25,28
	br.n	 @L2554
	st	 r13,r24,lo16(_free_binding_level)
	align	 4
@L2553:
	bsr.n	 _xmalloc
	or	 r2,r0,36
	or	 r25,r0,r2
@L2554:
	or.u	 r3,r0,hi16(_clear_binding_level)
	subu	 r2,r25,60
	ld	 r4,r3,lo16(_clear_binding_level)
	or	 r3,r3,lo16(_clear_binding_level)
	or.u	 r13,r0,hi16(_keep_next_level_flag)
	subu	 r3,r3,60
	bsr.n	 ___movstrSI96x36
	ld	 r24,r13,lo16(_keep_next_level_flag)
	or.u	 r12,r0,hi16(_class_binding_level)
	ld	 r13,r12,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2556
	st	 r13,r25,28
	br.n	 @L2557
	st	 r0,r12,lo16(_class_binding_level)
	align	 4
@L2556:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	st	 r13,r25,28
@L2557:
	ld	 r13,r25,32
	mak	 r12,r24,3<9>
	or	 r2,r0,r25
	or	 r13,r13,160
	or.u	 r23,r0,hi16(_current_binding_level)
	and	 r13,r13,0xf0ff
	st	 r2,r23,lo16(_current_binding_level)
	or	 r13,r13,r12
	bsr.n	 _GNU_xref_start_scope
	st	 r13,r2,32
	ld	 r13,r23,lo16(_current_binding_level)
	or.u	 r22,r0,hi16(_global_binding_level)
	or.u	 r2,r0,hi16(@LC120)
	st	 r13,r22,lo16(_global_binding_level)
	or.u	 r13,r0,hi16(_keep_next_level_flag)
	or	 r2,r2,lo16(@LC120)
	bsr.n	 _get_identifier
	st	 r0,r13,lo16(_keep_next_level_flag)
	or.u	 r13,r0,hi16(_this_identifier)
	or.u	 r12,r0,hi16(@LC121)
	st	 r2,r13,lo16(_this_identifier)
	bsr.n	 _get_identifier
	or	 r2,r12,lo16(@LC121)
	or.u	 r13,r0,hi16(_in_charge_identifier)
	st	 r2,r13,lo16(_in_charge_identifier)
	bsr.n	 _make_signed_type
	or	 r2,r0,32
	or.u	 r13,r0,hi16(_ridpointers+4)
	ld	 r25,r13,lo16(_ridpointers+4)
	or.u	 r13,r0,hi16(_integer_type_node)
	or	 r24,r0,r2
	bcnd.n	 eq0,r25,@L2567
	st	 r2,r13,lo16(_integer_type_node)
	or	 r2,r0,32
	or	 r3,r0,r25
	bsr.n	 _build_decl
	or	 r4,r0,r24
	bsr	 _pushdecl
	ld	 r12,r23,lo16(_current_binding_level)
	ld	 r13,r22,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2575
	ld	 r3,r25,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r23,lo16(_current_binding_level)
	br.n	 @L2576
	st	 r2,r13,16
	align	 4
@L2575:
	or.u	 r23,r0,hi16(_class_binding_level)
	ld	 r13,r23,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2576
	ld	 r3,r25,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r23,lo16(_class_binding_level)
	st	 r2,r13,16
@L2576:
	st	 r0,r25,4
@L2567:
	or.u	 r13,r0,hi16(_flag_dossier)
	ld	 r13,r13,lo16(_flag_dossier)
	bcnd.n	 eq0,r13,@L2558
	or.u	 r23,r0,hi16(_builtin_type_tdescs_len)
	or.u	 r11,r0,hi16(_builtin_type_tdescs_max)
	ld	 r13,r23,lo16(_builtin_type_tdescs_len)
	ld	 r12,r11,lo16(_builtin_type_tdescs_max)
	addu	 r13,r13,5
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L2579
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	mak	 r3,r12,0<3>
	ld	 r2,r25,lo16(_builtin_type_tdescs_arr)
	mak	 r13,r12,0<1>
	bsr.n	 _xrealloc
	st	 r13,r11,lo16(_builtin_type_tdescs_max)
	st	 r2,r25,lo16(_builtin_type_tdescs_arr)
@L2579:
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r23,lo16(_builtin_type_tdescs_len)
	st	 r24,r11[r12]
	ld.bu	 r13,r24,8
	cmp	 r13,r13,13
	bb0	 ne,r13,@L2580
	bsr.n	 _build_pointer_type
	or	 r2,r0,r24
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r24,32
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r23,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2580:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,6
	bb0.n	 ne,r13,@L3235
	or.u	 r13,r0,hi16(_flag_signed_char)
	bsr.n	 _build_reference_type
	or	 r2,r0,r24
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r24,36
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r23,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2558:
	or.u	 r13,r0,hi16(_flag_signed_char)
@L3235:
	ld	 r12,r13,lo16(_flag_signed_char)
	or.u	 r13,r0,hi16(_char_type_node)
	bcnd.n	 eq0,r12,@L2582
	or	 r25,r13,lo16(_char_type_node)
	or	 r2,r0,8
	bsr.n	 _make_signed_type
	addu	 r1,r1,@L3272
@L3273:
	align	 4
@L2582:
	bsr.n	 _make_unsigned_type
	or	 r2,r0,8
@L2583:
	st	 r2,r0,r25
	or.u	 r13,r0,hi16(_char_type_node)
	or	 r25,r0,0
	or.u	 r12,r0,hi16(@LC122)
	ld	 r23,r13,lo16(_char_type_node)
	or.u	 r13,r0,hi16(_ridpointers+8)
	or	 r2,r12,lo16(@LC122)
	ld	 r24,r13,lo16(_ridpointers+8)
	bcnd.n	 eq0,r2,@L2586
	or	 r21,r0,2
	bsr	 _get_identifier
	or	 r25,r0,r2
@L2586:
	bcnd.n	 eq0,r25,@L2587
	or	 r2,r0,32
	or	 r3,r0,r25
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r22,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r22,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L2589
	or	 r20,r0,r2
	ld	 r3,r25,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_current_binding_level)
	br.n	 @L2590
	st	 r2,r13,16
	align	 4
@L2589:
	or.u	 r22,r0,hi16(_class_binding_level)
	ld	 r13,r22,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2590
	ld	 r3,r25,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_class_binding_level)
	st	 r2,r13,16
@L2590:
	cmp	 r13,r21,31
	bb1.n	 gt,r13,@L2587
	st	 r0,r25,4
	st	 r20,r25,20
@L2587:
	bcnd.n	 eq0,r24,@L3236
	or.u	 r13,r0,hi16(_flag_dossier)
	bcnd.n	 eq0,r25,@L2594
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2596
	ld	 r3,r24,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L2597
	st	 r2,r13,16
	align	 4
@L2596:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2597
	ld	 r3,r24,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L2597:
	st	 r0,r24,4
	br.n	 @L2593
	st	 r20,r24,20
	align	 4
@L2594:
	or	 r2,r0,32
	or	 r3,r0,r24
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2601
	ld	 r3,r24,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L2602
	st	 r2,r13,16
	align	 4
@L2601:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2602
	ld	 r3,r24,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L2602:
	st	 r0,r24,4
@L2593:
	or.u	 r13,r0,hi16(_flag_dossier)
@L3236:
	ld	 r13,r13,lo16(_flag_dossier)
	bcnd.n	 eq0,r13,@L2584
	or.u	 r24,r0,hi16(_builtin_type_tdescs_len)
	or.u	 r11,r0,hi16(_builtin_type_tdescs_max)
	ld	 r13,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r11,lo16(_builtin_type_tdescs_max)
	addu	 r13,r13,5
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L2605
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	mak	 r3,r12,0<3>
	ld	 r2,r25,lo16(_builtin_type_tdescs_arr)
	mak	 r13,r12,0<1>
	bsr.n	 _xrealloc
	st	 r13,r11,lo16(_builtin_type_tdescs_max)
	st	 r2,r25,lo16(_builtin_type_tdescs_arr)
@L2605:
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r23,r11[r12]
	ld.bu	 r13,r23,8
	cmp	 r13,r13,13
	bb0	 ne,r13,@L2606
	bsr.n	 _build_pointer_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,32
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2606:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,6
	bb0	 ne,r13,@L2584
	bsr.n	 _build_reference_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,36
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2584:
	bsr.n	 _make_signed_type
	or	 r2,r0,64
	or.u	 r13,r0,hi16(_long_integer_type_node)
	st	 r2,r13,lo16(_long_integer_type_node)
	or.u	 r13,r0,hi16(_ridpointers+56)
	or	 r25,r0,0
	ld	 r24,r13,lo16(_ridpointers+56)
	or.u	 r13,r0,hi16(@LC123)
	or	 r21,r0,14
	or	 r13,r13,lo16(@LC123)
	bcnd.n	 eq0,r13,@L2610
	or	 r23,r0,r2
	bsr.n	 _get_identifier
	or	 r2,r0,r13
	or	 r25,r0,r2
@L2610:
	bcnd.n	 eq0,r25,@L2611
	or	 r2,r0,32
	or	 r3,r0,r25
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r22,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r22,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L2613
	or	 r19,r0,r2
	ld	 r3,r25,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_current_binding_level)
	br.n	 @L2614
	st	 r2,r13,16
	align	 4
@L2613:
	or.u	 r22,r0,hi16(_class_binding_level)
	ld	 r13,r22,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2614
	ld	 r3,r25,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_class_binding_level)
	st	 r2,r13,16
@L2614:
	cmp	 r13,r21,31
	bb1.n	 gt,r13,@L2611
	st	 r0,r25,4
	st	 r19,r25,20
@L2611:
	bcnd.n	 eq0,r24,@L3237
	or.u	 r13,r0,hi16(_flag_dossier)
	bcnd.n	 eq0,r25,@L2618
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2620
	ld	 r3,r24,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L2621
	st	 r2,r13,16
	align	 4
@L2620:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2621
	ld	 r3,r24,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L2621:
	st	 r0,r24,4
	br.n	 @L2617
	st	 r19,r24,20
	align	 4
@L2618:
	or	 r2,r0,32
	or	 r3,r0,r24
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2625
	ld	 r3,r24,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L2626
	st	 r2,r13,16
	align	 4
@L2625:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2626
	ld	 r3,r24,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L2626:
	st	 r0,r24,4
@L2617:
	or.u	 r13,r0,hi16(_flag_dossier)
@L3237:
	ld	 r13,r13,lo16(_flag_dossier)
	bcnd.n	 eq0,r13,@L2608
	or.u	 r24,r0,hi16(_builtin_type_tdescs_len)
	or.u	 r11,r0,hi16(_builtin_type_tdescs_max)
	ld	 r13,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r11,lo16(_builtin_type_tdescs_max)
	addu	 r13,r13,5
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L2629
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	mak	 r3,r12,0<3>
	ld	 r2,r25,lo16(_builtin_type_tdescs_arr)
	mak	 r13,r12,0<1>
	bsr.n	 _xrealloc
	st	 r13,r11,lo16(_builtin_type_tdescs_max)
	st	 r2,r25,lo16(_builtin_type_tdescs_arr)
@L2629:
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r23,r11[r12]
	ld.bu	 r13,r23,8
	cmp	 r13,r13,13
	bb0	 ne,r13,@L2630
	bsr.n	 _build_pointer_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,32
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2630:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,6
	bb0	 ne,r13,@L2608
	bsr.n	 _build_reference_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,36
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2608:
	bsr.n	 _make_unsigned_type
	or	 r2,r0,32
	or.u	 r13,r0,hi16(_unsigned_type_node)
	st	 r2,r13,lo16(_unsigned_type_node)
	or.u	 r13,r0,hi16(_ridpointers+48)
	or	 r25,r0,0
	ld	 r24,r13,lo16(_ridpointers+48)
	or.u	 r13,r0,hi16(@LC124)
	or	 r21,r0,12
	or	 r13,r13,lo16(@LC124)
	bcnd.n	 eq0,r13,@L2634
	or	 r23,r0,r2
	bsr.n	 _get_identifier
	or	 r2,r0,r13
	or	 r25,r0,r2
@L2634:
	bcnd.n	 eq0,r25,@L2635
	or	 r2,r0,32
	or	 r3,r0,r25
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r22,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r22,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L2637
	or	 r18,r0,r2
	ld	 r3,r25,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_current_binding_level)
	br.n	 @L2638
	st	 r2,r13,16
	align	 4
@L2637:
	or.u	 r22,r0,hi16(_class_binding_level)
	ld	 r13,r22,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2638
	ld	 r3,r25,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_class_binding_level)
	st	 r2,r13,16
@L2638:
	cmp	 r13,r21,31
	bb1.n	 gt,r13,@L2635
	st	 r0,r25,4
	st	 r18,r25,20
@L2635:
	bcnd.n	 eq0,r24,@L3238
	or.u	 r13,r0,hi16(_flag_dossier)
	bcnd.n	 eq0,r25,@L2642
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2644
	ld	 r3,r24,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L2645
	st	 r2,r13,16
	align	 4
@L2644:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2645
	ld	 r3,r24,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L2645:
	st	 r0,r24,4
	br.n	 @L2641
	st	 r18,r24,20
	align	 4
@L2642:
	or	 r2,r0,32
	or	 r3,r0,r24
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2649
	ld	 r3,r24,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L2650
	st	 r2,r13,16
	align	 4
@L2649:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2650
	ld	 r3,r24,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L2650:
	st	 r0,r24,4
@L2641:
	or.u	 r13,r0,hi16(_flag_dossier)
@L3238:
	ld	 r13,r13,lo16(_flag_dossier)
	bcnd	 eq0,r13,@L2632
	or.u	 r24,r0,hi16(_builtin_type_tdescs_len)
	or.u	 r11,r0,hi16(_builtin_type_tdescs_max)
	ld	 r13,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r11,lo16(_builtin_type_tdescs_max)
	addu	 r13,r13,5
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L2653
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	mak	 r3,r12,0<3>
	ld	 r2,r25,lo16(_builtin_type_tdescs_arr)
	mak	 r13,r12,0<1>
	bsr.n	 _xrealloc
	st	 r13,r11,lo16(_builtin_type_tdescs_max)
	st	 r2,r25,lo16(_builtin_type_tdescs_arr)
@L2653:
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r23,r11[r12]
	ld.bu	 r13,r23,8
	cmp	 r13,r13,13
	bb0	 ne,r13,@L2654
	bsr.n	 _build_pointer_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,32
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2654:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,6
	bb0.n	 ne,r13,@L3239
	or	 r2,r0,64
	bsr.n	 _build_reference_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,36
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2632:
	or	 r2,r0,64
@L3239:
	bsr.n	 _make_unsigned_type
	or	 r25,r0,0
	or.u	 r13,r0,hi16(_long_unsigned_type_node)
	or	 r21,r0,32
	st	 r2,r13,lo16(_long_unsigned_type_node)
	or.u	 r13,r0,hi16(@LC125)
	or	 r23,r0,r2
	or	 r13,r13,lo16(@LC125)
	bcnd.n	 eq0,r13,@L2658
	or	 r24,r0,0
	bsr.n	 _get_identifier
	or	 r2,r0,r13
	or	 r25,r0,r2
@L2658:
	bcnd.n	 eq0,r25,@L2659
	or	 r2,r0,32
	or	 r3,r0,r25
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r22,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r22,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L2661
	or	 r17,r0,r2
	ld	 r3,r25,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_current_binding_level)
	br.n	 @L2662
	st	 r2,r13,16
	align	 4
@L2661:
	or.u	 r22,r0,hi16(_class_binding_level)
	ld	 r13,r22,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2662
	ld	 r3,r25,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_class_binding_level)
	st	 r2,r13,16
@L2662:
	cmp	 r13,r21,31
	bb1.n	 gt,r13,@L2659
	st	 r0,r25,4
	st	 r17,r25,20
@L2659:
	bcnd.n	 eq0,r24,@L3240
	or.u	 r13,r0,hi16(_flag_dossier)
	bcnd.n	 eq0,r25,@L2666
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2668
	ld	 r3,r0,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L2669
	st	 r2,r13,16
	align	 4
@L2668:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2669
	ld	 r3,r0,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L2669:
	st	 r0,r24,4
	br.n	 @L2665
	st	 r17,r24,20
	align	 4
@L2666:
	or	 r2,r0,32
	or	 r3,r0,r24
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2673
	ld	 r3,r0,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L2674
	st	 r2,r13,16
	align	 4
@L2673:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2674
	ld	 r3,r0,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L2674:
	st	 r0,r24,4
@L2665:
	or.u	 r13,r0,hi16(_flag_dossier)
@L3240:
	ld	 r13,r13,lo16(_flag_dossier)
	bcnd	 eq0,r13,@L2656
	or.u	 r24,r0,hi16(_builtin_type_tdescs_len)
	or.u	 r11,r0,hi16(_builtin_type_tdescs_max)
	ld	 r13,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r11,lo16(_builtin_type_tdescs_max)
	addu	 r13,r13,5
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L2677
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	mak	 r3,r12,0<3>
	ld	 r2,r25,lo16(_builtin_type_tdescs_arr)
	mak	 r13,r12,0<1>
	bsr.n	 _xrealloc
	st	 r13,r11,lo16(_builtin_type_tdescs_max)
	st	 r2,r25,lo16(_builtin_type_tdescs_arr)
@L2677:
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r23,r11[r12]
	ld.bu	 r13,r23,8
	cmp	 r13,r13,13
	bb0	 ne,r13,@L2678
	bsr.n	 _build_pointer_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,32
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2678:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,6
	bb0.n	 ne,r13,@L3241
	or.u	 r13,r0,hi16(_long_unsigned_type_node)
	bsr.n	 _build_reference_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,36
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2656:
	or.u	 r13,r0,hi16(_long_unsigned_type_node)
@L3241:
	or	 r25,r0,0
	ld	 r23,r13,lo16(_long_unsigned_type_node)
	or.u	 r13,r0,hi16(@LC126)
	or	 r21,r0,32
	or	 r2,r13,lo16(@LC126)
	bcnd.n	 eq0,r2,@L2682
	or	 r24,r0,0
	bsr	 _get_identifier
	or	 r25,r0,r2
@L2682:
	bcnd.n	 eq0,r25,@L2683
	or	 r2,r0,32
	or	 r3,r0,r25
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r22,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r22,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L2685
	or	 r16,r0,r2
	ld	 r3,r25,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_current_binding_level)
	br.n	 @L2686
	st	 r2,r13,16
	align	 4
@L2685:
	or.u	 r22,r0,hi16(_class_binding_level)
	ld	 r13,r22,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2686
	ld	 r3,r25,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_class_binding_level)
	st	 r2,r13,16
@L2686:
	cmp	 r13,r21,31
	bb1.n	 gt,r13,@L2683
	st	 r0,r25,4
	st	 r16,r25,20
@L2683:
	bcnd.n	 eq0,r24,@L3242
	or.u	 r13,r0,hi16(_flag_dossier)
	bcnd.n	 eq0,r25,@L2690
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2692
	ld	 r3,r0,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L2693
	st	 r2,r13,16
	align	 4
@L2692:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2693
	ld	 r3,r0,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L2693:
	st	 r0,r24,4
	br.n	 @L2689
	st	 r16,r24,20
	align	 4
@L2690:
	or	 r2,r0,32
	or	 r3,r0,r24
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2697
	ld	 r3,r0,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L2698
	st	 r2,r13,16
	align	 4
@L2697:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2698
	ld	 r3,r0,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L2698:
	st	 r0,r24,4
@L2689:
	or.u	 r13,r0,hi16(_flag_dossier)
@L3242:
	ld	 r13,r13,lo16(_flag_dossier)
	bcnd.n	 eq0,r13,@L2680
	or.u	 r24,r0,hi16(_builtin_type_tdescs_len)
	or.u	 r11,r0,hi16(_builtin_type_tdescs_max)
	ld	 r13,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r11,lo16(_builtin_type_tdescs_max)
	addu	 r13,r13,5
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L2701
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	mak	 r3,r12,0<3>
	ld	 r2,r25,lo16(_builtin_type_tdescs_arr)
	mak	 r13,r12,0<1>
	bsr.n	 _xrealloc
	st	 r13,r11,lo16(_builtin_type_tdescs_max)
	st	 r2,r25,lo16(_builtin_type_tdescs_arr)
@L2701:
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r23,r11[r12]
	ld.bu	 r13,r23,8
	cmp	 r13,r13,13
	bb0	 ne,r13,@L2702
	bsr.n	 _build_pointer_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,32
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2702:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,6
	bb0.n	 ne,r13,@L3243
	or.u	 r13,r0,hi16(_flag_traditional)
	bsr.n	 _build_reference_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,36
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2680:
	or.u	 r13,r0,hi16(_flag_traditional)
@L3243:
	ld	 r13,r13,lo16(_flag_traditional)
	bcnd.n	 eq0,r13,@L2704
	or.u	 r13,r0,hi16(_long_integer_type_node)
	ld	 r12,r13,lo16(_long_integer_type_node)
	br.n	 @L3244
	or.u	 r13,r0,hi16(_sizetype)
	align	 4
@L2704:
	or.u	 r2,r0,hi16(@LC127)
	bsr.n	 _get_identifier
	or	 r2,r2,lo16(@LC127)
	ld	 r13,r2,20
	ld	 r12,r13,4
	or.u	 r13,r0,hi16(_sizetype)
@L3244:
	st	 r12,r13,lo16(_sizetype)
	or.u	 r2,r0,hi16(@LC128)
	bsr.n	 _get_identifier
	or	 r2,r2,lo16(@LC128)
	or.u	 r13,r0,hi16(_integer_type_node)
	ld	 r12,r2,20
	ld	 r13,r13,lo16(_integer_type_node)
	ld	 r9,r12,4
	or.u	 r12,r0,hi16(_sizetype)
	ld	 r11,r13,16
	or.u	 r13,r0,hi16(_char_type_node)
	ld	 r10,r12,lo16(_sizetype)
	ld	 r12,r13,lo16(_char_type_node)
	or.u	 r13,r0,hi16(_unsigned_type_node)
	st	 r10,r11,4
	ld	 r11,r13,lo16(_unsigned_type_node)
	ld	 r12,r12,16
	st	 r10,r12,4
	or.u	 r13,r0,hi16(_long_unsigned_type_node)
	ld	 r12,r11,16
	ld	 r11,r13,lo16(_long_unsigned_type_node)
	or.u	 r13,r0,hi16(_long_integer_type_node)
	ld	 r13,r13,lo16(_long_integer_type_node)
	st	 r10,r12,4
	ld	 r12,r11,16
	st	 r10,r12,4
	ld	 r12,r13,16
	or.u	 r13,r0,hi16(_ptrdiff_type_node)
	st	 r9,r13,lo16(_ptrdiff_type_node)
	or	 r2,r0,16
	bsr.n	 _make_signed_type
	st	 r10,r12,4
	or.u	 r13,r0,hi16(_short_integer_type_node)
	or	 r25,r0,0
	st	 r2,r13,lo16(_short_integer_type_node)
	or.u	 r13,r0,hi16(@LC129)
	or	 r21,r0,13
	or	 r12,r13,lo16(@LC129)
	or.u	 r13,r0,hi16(_ridpointers+52)
	ld	 r24,r13,lo16(_ridpointers+52)
	bcnd.n	 eq0,r12,@L2708
	or	 r23,r0,r2
	bsr.n	 _get_identifier
	or	 r2,r0,r12
	or	 r25,r0,r2
@L2708:
	bcnd.n	 eq0,r25,@L2709
	or	 r2,r0,32
	or	 r3,r0,r25
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r22,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r22,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L2711
	or	 r15,r0,r2
	ld	 r3,r25,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_current_binding_level)
	br.n	 @L2712
	st	 r2,r13,16
	align	 4
@L2711:
	or.u	 r22,r0,hi16(_class_binding_level)
	ld	 r13,r22,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2712
	ld	 r3,r25,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_class_binding_level)
	st	 r2,r13,16
@L2712:
	cmp	 r13,r21,31
	bb1.n	 gt,r13,@L2709
	st	 r0,r25,4
	st	 r15,r25,20
@L2709:
	bcnd.n	 eq0,r24,@L3245
	or.u	 r13,r0,hi16(_flag_dossier)
	bcnd.n	 eq0,r25,@L2716
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2718
	ld	 r3,r24,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L2719
	st	 r2,r13,16
	align	 4
@L2718:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2719
	ld	 r3,r24,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L2719:
	st	 r0,r24,4
	br.n	 @L2715
	st	 r15,r24,20
	align	 4
@L2716:
	or	 r2,r0,32
	or	 r3,r0,r24
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2723
	ld	 r3,r24,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L2724
	st	 r2,r13,16
	align	 4
@L2723:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2724
	ld	 r3,r24,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L2724:
	st	 r0,r24,4
@L2715:
	or.u	 r13,r0,hi16(_flag_dossier)
@L3245:
	ld	 r13,r13,lo16(_flag_dossier)
	bcnd	 eq0,r13,@L2706
	or.u	 r24,r0,hi16(_builtin_type_tdescs_len)
	or.u	 r11,r0,hi16(_builtin_type_tdescs_max)
	ld	 r13,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r11,lo16(_builtin_type_tdescs_max)
	addu	 r13,r13,5
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L2727
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	mak	 r3,r12,0<3>
	ld	 r2,r25,lo16(_builtin_type_tdescs_arr)
	mak	 r13,r12,0<1>
	bsr.n	 _xrealloc
	st	 r13,r11,lo16(_builtin_type_tdescs_max)
	st	 r2,r25,lo16(_builtin_type_tdescs_arr)
@L2727:
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r23,r11[r12]
	ld.bu	 r13,r23,8
	cmp	 r13,r13,13
	bb0	 ne,r13,@L2728
	bsr.n	 _build_pointer_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,32
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2728:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,6
	bb0.n	 ne,r13,@L3246
	or	 r2,r0,64
	bsr.n	 _build_reference_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,36
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2706:
	or	 r2,r0,64
@L3246:
	bsr.n	 _make_signed_type
	or	 r25,r0,0
	or.u	 r13,r0,hi16(_long_long_integer_type_node)
	or	 r21,r0,32
	st	 r2,r13,lo16(_long_long_integer_type_node)
	or.u	 r13,r0,hi16(@LC130)
	or	 r23,r0,r2
	or	 r13,r13,lo16(@LC130)
	bcnd.n	 eq0,r13,@L2732
	or	 r24,r0,0
	bsr.n	 _get_identifier
	or	 r2,r0,r13
	or	 r25,r0,r2
@L2732:
	bcnd.n	 eq0,r25,@L2733
	or	 r2,r0,32
	or	 r3,r0,r25
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r22,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r22,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L2735
	or	 r14,r0,r2
	ld	 r3,r25,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_current_binding_level)
	br.n	 @L2736
	st	 r2,r13,16
	align	 4
@L2735:
	or.u	 r22,r0,hi16(_class_binding_level)
	ld	 r13,r22,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2736
	ld	 r3,r25,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_class_binding_level)
	st	 r2,r13,16
@L2736:
	cmp	 r13,r21,31
	bb1.n	 gt,r13,@L2733
	st	 r0,r25,4
	st	 r14,r25,20
@L2733:
	bcnd.n	 eq0,r24,@L3247
	or.u	 r13,r0,hi16(_flag_dossier)
	bcnd.n	 eq0,r25,@L2740
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2742
	ld	 r3,r0,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L2743
	st	 r2,r13,16
	align	 4
@L2742:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2743
	ld	 r3,r0,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L2743:
	st	 r0,r24,4
	br.n	 @L2739
	st	 r14,r24,20
	align	 4
@L2740:
	or	 r2,r0,32
	or	 r3,r0,r24
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2747
	ld	 r3,r0,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L2748
	st	 r2,r13,16
	align	 4
@L2747:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2748
	ld	 r3,r0,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L2748:
	st	 r0,r24,4
@L2739:
	or.u	 r13,r0,hi16(_flag_dossier)
@L3247:
	ld	 r13,r13,lo16(_flag_dossier)
	bcnd	 eq0,r13,@L2730
	or.u	 r24,r0,hi16(_builtin_type_tdescs_len)
	or.u	 r11,r0,hi16(_builtin_type_tdescs_max)
	ld	 r13,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r11,lo16(_builtin_type_tdescs_max)
	addu	 r13,r13,5
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L2751
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	mak	 r3,r12,0<3>
	ld	 r2,r25,lo16(_builtin_type_tdescs_arr)
	mak	 r13,r12,0<1>
	bsr.n	 _xrealloc
	st	 r13,r11,lo16(_builtin_type_tdescs_max)
	st	 r2,r25,lo16(_builtin_type_tdescs_arr)
@L2751:
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r23,r11[r12]
	ld.bu	 r13,r23,8
	cmp	 r13,r13,13
	bb0	 ne,r13,@L2752
	bsr.n	 _build_pointer_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,32
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2752:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,6
	bb0.n	 ne,r13,@L3248
	or	 r2,r0,16
	bsr.n	 _build_reference_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,36
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2730:
	or	 r2,r0,16
@L3248:
	bsr.n	 _make_unsigned_type
	or	 r25,r0,0
	or.u	 r13,r0,hi16(_short_unsigned_type_node)
	or	 r21,r0,32
	st	 r2,r13,lo16(_short_unsigned_type_node)
	or.u	 r13,r0,hi16(@LC131)
	or	 r23,r0,r2
	or	 r13,r13,lo16(@LC131)
	bcnd.n	 eq0,r13,@L2756
	or	 r24,r0,0
	bsr.n	 _get_identifier
	or	 r2,r0,r13
	or	 r25,r0,r2
@L2756:
	bcnd.n	 eq0,r25,@L2757
	or	 r2,r0,32
	or	 r3,r0,r25
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r22,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r22,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L2759
	st	 r2,r31,172
	ld	 r3,r25,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_current_binding_level)
	br.n	 @L2760
	st	 r2,r13,16
	align	 4
@L2759:
	or.u	 r22,r0,hi16(_class_binding_level)
	ld	 r13,r22,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2760
	ld	 r3,r25,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_class_binding_level)
	st	 r2,r13,16
@L2760:
	cmp	 r13,r21,31
	bb1.n	 gt,r13,@L2757
	st	 r0,r25,4
	ld	 r8,r31,172
	st	 r8,r25,20
@L2757:
	bcnd.n	 eq0,r24,@L3249
	or.u	 r13,r0,hi16(_flag_dossier)
	bcnd.n	 eq0,r25,@L2764
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2766
	ld	 r3,r0,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L2767
	st	 r2,r13,16
	align	 4
@L2766:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2767
	ld	 r3,r0,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L2767:
	st	 r0,r24,4
	ld	 r8,r31,172
	br.n	 @L2763
	st	 r8,r24,20
	align	 4
@L2764:
	or	 r2,r0,32
	or	 r3,r0,r24
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2771
	ld	 r3,r0,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L2772
	st	 r2,r13,16
	align	 4
@L2771:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2772
	ld	 r3,r0,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L2772:
	st	 r0,r24,4
@L2763:
	or.u	 r13,r0,hi16(_flag_dossier)
@L3249:
	ld	 r13,r13,lo16(_flag_dossier)
	bcnd	 eq0,r13,@L2754
	or.u	 r24,r0,hi16(_builtin_type_tdescs_len)
	or.u	 r11,r0,hi16(_builtin_type_tdescs_max)
	ld	 r13,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r11,lo16(_builtin_type_tdescs_max)
	addu	 r13,r13,5
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L2775
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	mak	 r3,r12,0<3>
	ld	 r2,r25,lo16(_builtin_type_tdescs_arr)
	mak	 r13,r12,0<1>
	bsr.n	 _xrealloc
	st	 r13,r11,lo16(_builtin_type_tdescs_max)
	st	 r2,r25,lo16(_builtin_type_tdescs_arr)
@L2775:
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r23,r11[r12]
	ld.bu	 r13,r23,8
	cmp	 r13,r13,13
	bb0	 ne,r13,@L2776
	bsr.n	 _build_pointer_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,32
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2776:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,6
	bb0.n	 ne,r13,@L3250
	or.u	 r13,r0,hi16(_short_unsigned_type_node)
	bsr.n	 _build_reference_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,36
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2754:
	or.u	 r13,r0,hi16(_short_unsigned_type_node)
@L3250:
	or	 r25,r0,0
	ld	 r23,r13,lo16(_short_unsigned_type_node)
	or.u	 r13,r0,hi16(@LC132)
	or	 r21,r0,32
	or	 r2,r13,lo16(@LC132)
	bcnd.n	 eq0,r2,@L2780
	or	 r24,r0,0
	bsr	 _get_identifier
	or	 r25,r0,r2
@L2780:
	bcnd.n	 eq0,r25,@L2781
	or	 r2,r0,32
	or	 r3,r0,r25
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r22,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r22,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L2783
	st	 r2,r31,180
	ld	 r3,r25,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_current_binding_level)
	br.n	 @L2784
	st	 r2,r13,16
	align	 4
@L2783:
	or.u	 r22,r0,hi16(_class_binding_level)
	ld	 r13,r22,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2784
	ld	 r3,r25,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_class_binding_level)
	st	 r2,r13,16
@L2784:
	cmp	 r13,r21,31
	bb1.n	 gt,r13,@L2781
	st	 r0,r25,4
	ld	 r8,r31,180
	st	 r8,r25,20
@L2781:
	bcnd.n	 eq0,r24,@L3251
	or.u	 r13,r0,hi16(_flag_dossier)
	bcnd.n	 eq0,r25,@L2788
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2790
	ld	 r3,r0,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L2791
	st	 r2,r13,16
	align	 4
@L2790:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2791
	ld	 r3,r0,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L2791:
	st	 r0,r24,4
	ld	 r8,r31,180
	br.n	 @L2787
	st	 r8,r24,20
	align	 4
@L2788:
	or	 r2,r0,32
	or	 r3,r0,r24
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2795
	ld	 r3,r0,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L2796
	st	 r2,r13,16
	align	 4
@L2795:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2796
	ld	 r3,r0,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L2796:
	st	 r0,r24,4
@L2787:
	or.u	 r13,r0,hi16(_flag_dossier)
@L3251:
	ld	 r13,r13,lo16(_flag_dossier)
	bcnd	 eq0,r13,@L2778
	or.u	 r24,r0,hi16(_builtin_type_tdescs_len)
	or.u	 r11,r0,hi16(_builtin_type_tdescs_max)
	ld	 r13,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r11,lo16(_builtin_type_tdescs_max)
	addu	 r13,r13,5
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L2799
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	mak	 r3,r12,0<3>
	ld	 r2,r25,lo16(_builtin_type_tdescs_arr)
	mak	 r13,r12,0<1>
	bsr.n	 _xrealloc
	st	 r13,r11,lo16(_builtin_type_tdescs_max)
	st	 r2,r25,lo16(_builtin_type_tdescs_arr)
@L2799:
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r23,r11[r12]
	ld.bu	 r13,r23,8
	cmp	 r13,r13,13
	bb0	 ne,r13,@L2800
	bsr.n	 _build_pointer_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,32
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2800:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,6
	bb0.n	 ne,r13,@L3252
	or	 r2,r0,64
	bsr.n	 _build_reference_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,36
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2778:
	or	 r2,r0,64
@L3252:
	bsr.n	 _make_unsigned_type
	or	 r25,r0,0
	or.u	 r13,r0,hi16(_long_long_unsigned_type_node)
	or	 r21,r0,32
	st	 r2,r13,lo16(_long_long_unsigned_type_node)
	or.u	 r13,r0,hi16(@LC133)
	or	 r23,r0,r2
	or	 r13,r13,lo16(@LC133)
	bcnd.n	 eq0,r13,@L2804
	or	 r24,r0,0
	bsr.n	 _get_identifier
	or	 r2,r0,r13
	or	 r25,r0,r2
@L2804:
	bcnd.n	 eq0,r25,@L2805
	or	 r2,r0,32
	or	 r3,r0,r25
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r22,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r22,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L2807
	st	 r2,r31,188
	ld	 r3,r25,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_current_binding_level)
	br.n	 @L2808
	st	 r2,r13,16
	align	 4
@L2807:
	or.u	 r22,r0,hi16(_class_binding_level)
	ld	 r13,r22,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2808
	ld	 r3,r25,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_class_binding_level)
	st	 r2,r13,16
@L2808:
	cmp	 r13,r21,31
	bb1.n	 gt,r13,@L2805
	st	 r0,r25,4
	ld	 r8,r31,188
	st	 r8,r25,20
@L2805:
	bcnd.n	 eq0,r24,@L3253
	or.u	 r13,r0,hi16(_flag_dossier)
	bcnd.n	 eq0,r25,@L2812
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2814
	ld	 r3,r0,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L2815
	st	 r2,r13,16
	align	 4
@L2814:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2815
	ld	 r3,r0,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L2815:
	st	 r0,r24,4
	ld	 r8,r31,188
	br.n	 @L2811
	st	 r8,r24,20
	align	 4
@L2812:
	or	 r2,r0,32
	or	 r3,r0,r24
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2819
	ld	 r3,r0,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L2820
	st	 r2,r13,16
	align	 4
@L2819:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2820
	ld	 r3,r0,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L2820:
	st	 r0,r24,4
@L2811:
	or.u	 r13,r0,hi16(_flag_dossier)
@L3253:
	ld	 r13,r13,lo16(_flag_dossier)
	bcnd	 eq0,r13,@L2802
	or.u	 r24,r0,hi16(_builtin_type_tdescs_len)
	or.u	 r11,r0,hi16(_builtin_type_tdescs_max)
	ld	 r13,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r11,lo16(_builtin_type_tdescs_max)
	addu	 r13,r13,5
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L2823
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	mak	 r3,r12,0<3>
	ld	 r2,r25,lo16(_builtin_type_tdescs_arr)
	mak	 r13,r12,0<1>
	bsr.n	 _xrealloc
	st	 r13,r11,lo16(_builtin_type_tdescs_max)
	st	 r2,r25,lo16(_builtin_type_tdescs_arr)
@L2823:
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r23,r11[r12]
	ld.bu	 r13,r23,8
	cmp	 r13,r13,13
	bb0	 ne,r13,@L2824
	bsr.n	 _build_pointer_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,32
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2824:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,6
	bb0.n	 ne,r13,@L3254
	or.u	 r13,r0,hi16(_long_long_unsigned_type_node)
	bsr.n	 _build_reference_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,36
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2802:
	or.u	 r13,r0,hi16(_long_long_unsigned_type_node)
@L3254:
	or	 r25,r0,0
	ld	 r23,r13,lo16(_long_long_unsigned_type_node)
	or.u	 r13,r0,hi16(@LC134)
	or	 r21,r0,32
	or	 r2,r13,lo16(@LC134)
	bcnd.n	 eq0,r2,@L2828
	or	 r24,r0,0
	bsr	 _get_identifier
	or	 r25,r0,r2
@L2828:
	bcnd.n	 eq0,r25,@L2829
	or	 r2,r0,32
	or	 r3,r0,r25
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r22,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r22,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L2831
	st	 r2,r31,196
	ld	 r3,r25,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_current_binding_level)
	br.n	 @L2832
	st	 r2,r13,16
	align	 4
@L2831:
	or.u	 r22,r0,hi16(_class_binding_level)
	ld	 r13,r22,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2832
	ld	 r3,r25,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_class_binding_level)
	st	 r2,r13,16
@L2832:
	cmp	 r13,r21,31
	bb1.n	 gt,r13,@L2829
	st	 r0,r25,4
	ld	 r8,r31,196
	st	 r8,r25,20
@L2829:
	bcnd.n	 eq0,r24,@L3255
	or.u	 r13,r0,hi16(_flag_dossier)
	bcnd.n	 eq0,r25,@L2836
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2838
	ld	 r3,r0,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L2839
	st	 r2,r13,16
	align	 4
@L2838:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2839
	ld	 r3,r0,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L2839:
	st	 r0,r24,4
	ld	 r8,r31,196
	br.n	 @L2835
	st	 r8,r24,20
	align	 4
@L2836:
	or	 r2,r0,32
	or	 r3,r0,r24
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2843
	ld	 r3,r0,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L2844
	st	 r2,r13,16
	align	 4
@L2843:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2844
	ld	 r3,r0,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L2844:
	st	 r0,r24,4
@L2835:
	or.u	 r13,r0,hi16(_flag_dossier)
@L3255:
	ld	 r13,r13,lo16(_flag_dossier)
	bcnd	 eq0,r13,@L2826
	or.u	 r24,r0,hi16(_builtin_type_tdescs_len)
	or.u	 r11,r0,hi16(_builtin_type_tdescs_max)
	ld	 r13,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r11,lo16(_builtin_type_tdescs_max)
	addu	 r13,r13,5
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L2847
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	mak	 r3,r12,0<3>
	ld	 r2,r25,lo16(_builtin_type_tdescs_arr)
	mak	 r13,r12,0<1>
	bsr.n	 _xrealloc
	st	 r13,r11,lo16(_builtin_type_tdescs_max)
	st	 r2,r25,lo16(_builtin_type_tdescs_arr)
@L2847:
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r23,r11[r12]
	ld.bu	 r13,r23,8
	cmp	 r13,r13,13
	bb0	 ne,r13,@L2848
	bsr.n	 _build_pointer_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,32
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2848:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,6
	bb0.n	 ne,r13,@L3256
	or	 r2,r0,8
	bsr.n	 _build_reference_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,36
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2826:
	or	 r2,r0,8
@L3256:
	bsr.n	 _make_signed_type
	or	 r25,r0,0
	or.u	 r13,r0,hi16(_signed_char_type_node)
	or	 r21,r0,32
	st	 r2,r13,lo16(_signed_char_type_node)
	or.u	 r13,r0,hi16(@LC135)
	or	 r23,r0,r2
	or	 r13,r13,lo16(@LC135)
	bcnd.n	 eq0,r13,@L2852
	or	 r24,r0,0
	bsr.n	 _get_identifier
	or	 r2,r0,r13
	or	 r25,r0,r2
@L2852:
	bcnd.n	 eq0,r25,@L2853
	or	 r2,r0,32
	or	 r3,r0,r25
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r22,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r22,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L2855
	st	 r2,r31,204
	ld	 r3,r25,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_current_binding_level)
	br.n	 @L2856
	st	 r2,r13,16
	align	 4
@L2855:
	or.u	 r22,r0,hi16(_class_binding_level)
	ld	 r13,r22,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2856
	ld	 r3,r25,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_class_binding_level)
	st	 r2,r13,16
@L2856:
	cmp	 r13,r21,31
	bb1.n	 gt,r13,@L2853
	st	 r0,r25,4
	ld	 r8,r31,204
	st	 r8,r25,20
@L2853:
	bcnd.n	 eq0,r24,@L3257
	or.u	 r13,r0,hi16(_flag_dossier)
	bcnd.n	 eq0,r25,@L2860
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2862
	ld	 r3,r0,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L2863
	st	 r2,r13,16
	align	 4
@L2862:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2863
	ld	 r3,r0,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L2863:
	st	 r0,r24,4
	ld	 r8,r31,204
	br.n	 @L2859
	st	 r8,r24,20
	align	 4
@L2860:
	or	 r2,r0,32
	or	 r3,r0,r24
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2867
	ld	 r3,r0,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L2868
	st	 r2,r13,16
	align	 4
@L2867:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2868
	ld	 r3,r0,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L2868:
	st	 r0,r24,4
@L2859:
	or.u	 r13,r0,hi16(_flag_dossier)
@L3257:
	ld	 r13,r13,lo16(_flag_dossier)
	bcnd	 eq0,r13,@L2850
	or.u	 r24,r0,hi16(_builtin_type_tdescs_len)
	or.u	 r11,r0,hi16(_builtin_type_tdescs_max)
	ld	 r13,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r11,lo16(_builtin_type_tdescs_max)
	addu	 r13,r13,5
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L2871
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	mak	 r3,r12,0<3>
	ld	 r2,r25,lo16(_builtin_type_tdescs_arr)
	mak	 r13,r12,0<1>
	bsr.n	 _xrealloc
	st	 r13,r11,lo16(_builtin_type_tdescs_max)
	st	 r2,r25,lo16(_builtin_type_tdescs_arr)
@L2871:
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r23,r11[r12]
	ld.bu	 r13,r23,8
	cmp	 r13,r13,13
	bb0	 ne,r13,@L2872
	bsr.n	 _build_pointer_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,32
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2872:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,6
	bb0.n	 ne,r13,@L3258
	or	 r2,r0,8
	bsr.n	 _build_reference_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,36
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2850:
	or	 r2,r0,8
@L3258:
	bsr.n	 _make_unsigned_type
	or	 r25,r0,0
	or.u	 r13,r0,hi16(_unsigned_char_type_node)
	or	 r21,r0,32
	st	 r2,r13,lo16(_unsigned_char_type_node)
	or.u	 r13,r0,hi16(@LC136)
	or	 r23,r0,r2
	or	 r13,r13,lo16(@LC136)
	bcnd.n	 eq0,r13,@L2876
	or	 r24,r0,0
	bsr.n	 _get_identifier
	or	 r2,r0,r13
	or	 r25,r0,r2
@L2876:
	bcnd.n	 eq0,r25,@L2877
	or	 r2,r0,32
	or	 r3,r0,r25
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r22,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r22,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L2879
	st	 r2,r31,212
	ld	 r3,r25,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_current_binding_level)
	br.n	 @L2880
	st	 r2,r13,16
	align	 4
@L2879:
	or.u	 r22,r0,hi16(_class_binding_level)
	ld	 r13,r22,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2880
	ld	 r3,r25,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_class_binding_level)
	st	 r2,r13,16
@L2880:
	cmp	 r13,r21,31
	bb1.n	 gt,r13,@L2877
	st	 r0,r25,4
	ld	 r8,r31,212
	st	 r8,r25,20
@L2877:
	bcnd.n	 eq0,r24,@L3259
	or.u	 r13,r0,hi16(_flag_dossier)
	bcnd.n	 eq0,r25,@L2884
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2886
	ld	 r3,r0,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L2887
	st	 r2,r13,16
	align	 4
@L2886:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2887
	ld	 r3,r0,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L2887:
	st	 r0,r24,4
	ld	 r8,r31,212
	br.n	 @L2883
	st	 r8,r24,20
	align	 4
@L2884:
	or	 r2,r0,32
	or	 r3,r0,r24
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2891
	ld	 r3,r0,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L2892
	st	 r2,r13,16
	align	 4
@L2891:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2892
	ld	 r3,r0,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L2892:
	st	 r0,r24,4
@L2883:
	or.u	 r13,r0,hi16(_flag_dossier)
@L3259:
	ld	 r13,r13,lo16(_flag_dossier)
	bcnd.n	 eq0,r13,@L2874
	or.u	 r24,r0,hi16(_builtin_type_tdescs_len)
	or.u	 r11,r0,hi16(_builtin_type_tdescs_max)
	ld	 r13,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r11,lo16(_builtin_type_tdescs_max)
	addu	 r13,r13,5
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L2895
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	mak	 r3,r12,0<3>
	ld	 r2,r25,lo16(_builtin_type_tdescs_arr)
	mak	 r13,r12,0<1>
	bsr.n	 _xrealloc
	st	 r13,r11,lo16(_builtin_type_tdescs_max)
	st	 r2,r25,lo16(_builtin_type_tdescs_arr)
@L2895:
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r23,r11[r12]
	ld.bu	 r13,r23,8
	cmp	 r13,r13,13
	bb0	 ne,r13,@L2896
	bsr.n	 _build_pointer_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,32
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2896:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,6
	bb0	 ne,r13,@L2874
	bsr.n	 _build_reference_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,36
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2874:
	or.u	 r24,r0,hi16(_mode_size+4)
	ld	 r2,r24,lo16(_mode_size+4)
	bsr.n	 _make_signed_type
	mak	 r2,r2,0<3>
	or	 r4,r0,r2
	or	 r2,r0,32
	or.u	 r13,r0,hi16(_intQI_type_node)
	or	 r3,r0,0
	bsr.n	 _build_decl
	st	 r4,r13,lo16(_intQI_type_node)
	bsr.n	 _pushdecl
	or	 r25,r24,lo16(_mode_size+4)
	ld	 r2,r25,4
	bsr.n	 _make_signed_type
	mak	 r2,r2,0<3>
	or	 r4,r0,r2
	or	 r2,r0,32
	or.u	 r13,r0,hi16(_intHI_type_node)
	or	 r3,r0,0
	bsr.n	 _build_decl
	st	 r4,r13,lo16(_intHI_type_node)
	bsr	 _pushdecl
	ld	 r2,r25,12
	bsr.n	 _make_signed_type
	mak	 r2,r2,0<3>
	or	 r4,r0,r2
	or	 r2,r0,32
	or.u	 r13,r0,hi16(_intSI_type_node)
	or	 r3,r0,0
	bsr.n	 _build_decl
	st	 r4,r13,lo16(_intSI_type_node)
	bsr	 _pushdecl
	ld	 r2,r25,20
	bsr.n	 _make_signed_type
	mak	 r2,r2,0<3>
	or	 r4,r0,r2
	or	 r2,r0,32
	or.u	 r13,r0,hi16(_intDI_type_node)
	or	 r3,r0,0
	bsr.n	 _build_decl
	st	 r4,r13,lo16(_intDI_type_node)
	bsr	 _pushdecl
	ld	 r2,r24,lo16(_mode_size+4)
	bsr.n	 _make_unsigned_type
	mak	 r2,r2,0<3>
	or	 r4,r0,r2
	or	 r2,r0,32
	or.u	 r13,r0,hi16(_unsigned_intQI_type_node)
	or	 r3,r0,0
	bsr.n	 _build_decl
	st	 r4,r13,lo16(_unsigned_intQI_type_node)
	bsr	 _pushdecl
	ld	 r2,r25,4
	bsr.n	 _make_unsigned_type
	mak	 r2,r2,0<3>
	or	 r4,r0,r2
	or	 r2,r0,32
	or.u	 r13,r0,hi16(_unsigned_intHI_type_node)
	or	 r3,r0,0
	bsr.n	 _build_decl
	st	 r4,r13,lo16(_unsigned_intHI_type_node)
	bsr	 _pushdecl
	ld	 r2,r25,12
	bsr.n	 _make_unsigned_type
	mak	 r2,r2,0<3>
	or	 r4,r0,r2
	or	 r2,r0,32
	or.u	 r13,r0,hi16(_unsigned_intSI_type_node)
	or	 r3,r0,0
	bsr.n	 _build_decl
	st	 r4,r13,lo16(_unsigned_intSI_type_node)
	bsr	 _pushdecl
	ld	 r2,r25,20
	bsr.n	 _make_unsigned_type
	mak	 r2,r2,0<3>
	or	 r4,r0,r2
	or	 r2,r0,32
	or.u	 r13,r0,hi16(_unsigned_intDI_type_node)
	or	 r3,r0,0
	bsr.n	 _build_decl
	st	 r4,r13,lo16(_unsigned_intDI_type_node)
	bsr	 _pushdecl
	bsr.n	 _make_node
	or	 r2,r0,8
	or.u	 r12,r0,hi16(_float_type_node)
	st	 r2,r12,lo16(_float_type_node)
	or	 r13,r0,32
	st.b	 r13,r2,25
	or.u	 r13,r0,hi16(_ridpointers+12)
	ld	 r25,r13,lo16(_ridpointers+12)
	ld	 r24,r12,lo16(_float_type_node)
	bcnd.n	 eq0,r25,@L2907
	or	 r2,r0,32
	or	 r3,r0,r25
	bsr.n	 _build_decl
	or	 r4,r0,r24
	bsr.n	 _pushdecl
	or.u	 r23,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r23,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2915
	ld	 r3,r25,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r23,lo16(_current_binding_level)
	br.n	 @L2916
	st	 r2,r13,16
	align	 4
@L2915:
	or.u	 r23,r0,hi16(_class_binding_level)
	ld	 r13,r23,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2916
	ld	 r3,r25,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r23,lo16(_class_binding_level)
	st	 r2,r13,16
@L2916:
	st	 r0,r25,4
@L2907:
	or.u	 r13,r0,hi16(_flag_dossier)
	ld	 r13,r13,lo16(_flag_dossier)
	bcnd.n	 eq0,r13,@L2898
	or.u	 r23,r0,hi16(_builtin_type_tdescs_len)
	or.u	 r11,r0,hi16(_builtin_type_tdescs_max)
	ld	 r13,r23,lo16(_builtin_type_tdescs_len)
	ld	 r12,r11,lo16(_builtin_type_tdescs_max)
	addu	 r13,r13,5
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L2919
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	mak	 r3,r12,0<3>
	ld	 r2,r25,lo16(_builtin_type_tdescs_arr)
	mak	 r13,r12,0<1>
	bsr.n	 _xrealloc
	st	 r13,r11,lo16(_builtin_type_tdescs_max)
	st	 r2,r25,lo16(_builtin_type_tdescs_arr)
@L2919:
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r23,lo16(_builtin_type_tdescs_len)
	st	 r24,r11[r12]
	ld.bu	 r13,r24,8
	cmp	 r13,r13,13
	bb0	 ne,r13,@L2920
	bsr.n	 _build_pointer_type
	or	 r2,r0,r24
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r24,32
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r23,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2920:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,6
	bb0.n	 ne,r13,@L3260
	or.u	 r13,r0,hi16(_float_type_node)
	bsr.n	 _build_reference_type
	or	 r2,r0,r24
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r24,36
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r23,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2898:
	or.u	 r13,r0,hi16(_float_type_node)
@L3260:
	bsr.n	 _layout_type
	ld	 r2,r13,lo16(_float_type_node)
	bsr.n	 _make_node
	or	 r2,r0,8
	or.u	 r13,r0,hi16(_flag_short_double)
	ld	 r12,r13,lo16(_flag_short_double)
	or.u	 r13,r0,hi16(_double_type_node)
	bcnd.n	 eq0,r12,@L2922
	st	 r2,r13,lo16(_double_type_node)
	br.n	 @L3221
	or	 r13,r0,32
	align	 4
@L2922:
	or	 r13,r0,64
@L3221:
	st.b	 r13,r2,25
	or.u	 r13,r0,hi16(_ridpointers+16)
	or.u	 r12,r0,hi16(_double_type_node)
	ld	 r25,r13,lo16(_ridpointers+16)
	ld	 r24,r12,lo16(_double_type_node)
	bcnd.n	 eq0,r25,@L2933
	or	 r2,r0,32
	or	 r3,r0,r25
	bsr.n	 _build_decl
	or	 r4,r0,r24
	bsr.n	 _pushdecl
	or.u	 r23,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r23,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2941
	ld	 r3,r25,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r23,lo16(_current_binding_level)
	br.n	 @L2942
	st	 r2,r13,16
	align	 4
@L2941:
	or.u	 r23,r0,hi16(_class_binding_level)
	ld	 r13,r23,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2942
	ld	 r3,r25,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r23,lo16(_class_binding_level)
	st	 r2,r13,16
@L2942:
	st	 r0,r25,4
@L2933:
	or.u	 r13,r0,hi16(_flag_dossier)
	ld	 r13,r13,lo16(_flag_dossier)
	bcnd.n	 eq0,r13,@L2924
	or.u	 r23,r0,hi16(_builtin_type_tdescs_len)
	or.u	 r11,r0,hi16(_builtin_type_tdescs_max)
	ld	 r13,r23,lo16(_builtin_type_tdescs_len)
	ld	 r12,r11,lo16(_builtin_type_tdescs_max)
	addu	 r13,r13,5
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L2945
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	mak	 r3,r12,0<3>
	ld	 r2,r25,lo16(_builtin_type_tdescs_arr)
	mak	 r13,r12,0<1>
	bsr.n	 _xrealloc
	st	 r13,r11,lo16(_builtin_type_tdescs_max)
	st	 r2,r25,lo16(_builtin_type_tdescs_arr)
@L2945:
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r23,lo16(_builtin_type_tdescs_len)
	st	 r24,r11[r12]
	ld.bu	 r13,r24,8
	cmp	 r13,r13,13
	bb0	 ne,r13,@L2946
	bsr.n	 _build_pointer_type
	or	 r2,r0,r24
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r24,32
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r23,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2946:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,6
	bb0.n	 ne,r13,@L3261
	or.u	 r13,r0,hi16(_double_type_node)
	bsr.n	 _build_reference_type
	or	 r2,r0,r24
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r24,36
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r23,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2924:
	or.u	 r13,r0,hi16(_double_type_node)
@L3261:
	bsr.n	 _layout_type
	ld	 r2,r13,lo16(_double_type_node)
	bsr.n	 _make_node
	or	 r2,r0,8
	or.u	 r12,r0,hi16(_long_double_type_node)
	or	 r13,r0,64
	or	 r25,r0,0
	st	 r2,r12,lo16(_long_double_type_node)
	or	 r21,r0,32
	st.b	 r13,r2,25
	or.u	 r13,r0,hi16(@LC137)
	or	 r2,r13,lo16(@LC137)
	ld	 r23,r12,lo16(_long_double_type_node)
	bcnd.n	 eq0,r2,@L2950
	or	 r24,r0,0
	bsr	 _get_identifier
	or	 r25,r0,r2
@L2950:
	bcnd.n	 eq0,r25,@L2951
	or	 r2,r0,32
	or	 r3,r0,r25
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r22,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r22,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L2953
	st	 r2,r31,220
	ld	 r3,r25,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_current_binding_level)
	br.n	 @L2954
	st	 r2,r13,16
	align	 4
@L2953:
	or.u	 r22,r0,hi16(_class_binding_level)
	ld	 r13,r22,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2954
	ld	 r3,r25,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_class_binding_level)
	st	 r2,r13,16
@L2954:
	cmp	 r13,r21,31
	bb1.n	 gt,r13,@L2951
	st	 r0,r25,4
	ld	 r8,r31,220
	st	 r8,r25,20
@L2951:
	bcnd.n	 eq0,r24,@L3262
	or.u	 r13,r0,hi16(_flag_dossier)
	bcnd.n	 eq0,r25,@L2958
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2960
	ld	 r3,r0,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L2961
	st	 r2,r13,16
	align	 4
@L2960:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2961
	ld	 r3,r0,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L2961:
	st	 r0,r24,4
	ld	 r8,r31,220
	br.n	 @L2957
	st	 r8,r24,20
	align	 4
@L2958:
	or	 r2,r0,32
	or	 r3,r0,r24
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2965
	ld	 r3,r0,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L2966
	st	 r2,r13,16
	align	 4
@L2965:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2966
	ld	 r3,r0,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L2966:
	st	 r0,r24,4
@L2957:
	or.u	 r13,r0,hi16(_flag_dossier)
@L3262:
	ld	 r13,r13,lo16(_flag_dossier)
	bcnd.n	 eq0,r13,@L2948
	or.u	 r24,r0,hi16(_builtin_type_tdescs_len)
	or.u	 r11,r0,hi16(_builtin_type_tdescs_max)
	ld	 r13,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r11,lo16(_builtin_type_tdescs_max)
	addu	 r13,r13,5
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L2969
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	mak	 r3,r12,0<3>
	ld	 r2,r25,lo16(_builtin_type_tdescs_arr)
	mak	 r13,r12,0<1>
	bsr.n	 _xrealloc
	st	 r13,r11,lo16(_builtin_type_tdescs_max)
	st	 r2,r25,lo16(_builtin_type_tdescs_arr)
@L2969:
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r23,r11[r12]
	ld.bu	 r13,r23,8
	cmp	 r13,r13,13
	bb0	 ne,r13,@L2970
	bsr.n	 _build_pointer_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,32
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2970:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,6
	bb0.n	 ne,r13,@L3263
	or.u	 r13,r0,hi16(_long_double_type_node)
	bsr.n	 _build_reference_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,36
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2948:
	or.u	 r13,r0,hi16(_long_double_type_node)
@L3263:
	bsr.n	 _layout_type
	ld	 r2,r13,lo16(_long_double_type_node)
	or	 r2,r0,0
	bsr.n	 _build_int_2_wide
	or	 r3,r0,0
	or.u	 r25,r0,hi16(_integer_type_node)
	or	 r12,r0,r2
	ld	 r11,r25,lo16(_integer_type_node)
	or.u	 r13,r0,hi16(_integer_zero_node)
	or	 r2,r0,1
	st	 r12,r13,lo16(_integer_zero_node)
	or	 r3,r0,0
	bsr.n	 _build_int_2_wide
	st	 r11,r12,4
	or	 r12,r0,r2
	ld	 r11,r25,lo16(_integer_type_node)
	or.u	 r13,r0,hi16(_integer_one_node)
	or	 r2,r0,2
	st	 r12,r13,lo16(_integer_one_node)
	or	 r3,r0,0
	bsr.n	 _build_int_2_wide
	st	 r11,r12,4
	or	 r12,r0,r2
	ld	 r11,r25,lo16(_integer_type_node)
	or.u	 r13,r0,hi16(_integer_two_node)
	or	 r2,r0,3
	st	 r12,r13,lo16(_integer_two_node)
	or	 r3,r0,0
	bsr.n	 _build_int_2_wide
	st	 r11,r12,4
	or	 r12,r0,r2
	or	 r2,r0,43
	ld	 r11,r25,lo16(_integer_type_node)
	or.u	 r13,r0,hi16(_integer_three_node)
	or	 r3,r0,0
	st	 r12,r13,lo16(_integer_three_node)
	or	 r4,r0,0
	bsr.n	 _build_nt
	st	 r11,r12,4
	or.u	 r13,r0,hi16(_empty_init_node)
	st	 r2,r13,lo16(_empty_init_node)
	bsr.n	 _size_int
	or	 r2,r0,0
	or.u	 r13,r0,hi16(_size_zero_node)
	st	 r2,r13,lo16(_size_zero_node)
	bsr.n	 _size_int
	or	 r2,r0,1
	or.u	 r13,r0,hi16(_size_one_node)
	st	 r2,r13,lo16(_size_one_node)
	bsr.n	 _make_node
	or	 r2,r0,6
	or.u	 r13,r0,hi16(_ridpointers+20)
	ld	 r25,r13,lo16(_ridpointers+20)
	or.u	 r13,r0,hi16(_void_type_node)
	or	 r24,r0,r2
	bcnd.n	 eq0,r25,@L2981
	st	 r2,r13,lo16(_void_type_node)
	or	 r2,r0,32
	or	 r3,r0,r25
	bsr.n	 _build_decl
	or	 r4,r0,r24
	bsr.n	 _pushdecl
	or.u	 r23,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r23,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L2989
	ld	 r3,r25,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r23,lo16(_current_binding_level)
	br.n	 @L2990
	st	 r2,r13,16
	align	 4
@L2989:
	or.u	 r23,r0,hi16(_class_binding_level)
	ld	 r13,r23,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L2990
	ld	 r3,r25,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r23,lo16(_class_binding_level)
	st	 r2,r13,16
@L2990:
	st	 r0,r25,4
@L2981:
	or.u	 r13,r0,hi16(_flag_dossier)
	ld	 r13,r13,lo16(_flag_dossier)
	bcnd.n	 eq0,r13,@L2972
	or.u	 r23,r0,hi16(_builtin_type_tdescs_len)
	or.u	 r11,r0,hi16(_builtin_type_tdescs_max)
	ld	 r13,r23,lo16(_builtin_type_tdescs_len)
	ld	 r12,r11,lo16(_builtin_type_tdescs_max)
	addu	 r13,r13,5
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L2993
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	mak	 r3,r12,0<3>
	ld	 r2,r25,lo16(_builtin_type_tdescs_arr)
	mak	 r13,r12,0<1>
	bsr.n	 _xrealloc
	st	 r13,r11,lo16(_builtin_type_tdescs_max)
	st	 r2,r25,lo16(_builtin_type_tdescs_arr)
@L2993:
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r23,lo16(_builtin_type_tdescs_len)
	st	 r24,r11[r12]
	ld.bu	 r13,r24,8
	cmp	 r13,r13,13
	bb0	 ne,r13,@L2994
	bsr.n	 _build_pointer_type
	or	 r2,r0,r24
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r24,32
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r23,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2994:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,6
	bb0	 ne,r13,@L2972
	bsr.n	 _build_reference_type
	or	 r2,r0,r24
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r24,36
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r23,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2972:
	or.u	 r24,r0,hi16(_void_type_node)
	bsr.n	 _layout_type
	ld	 r2,r24,lo16(_void_type_node)
	ld	 r3,r24,lo16(_void_type_node)
	bsr.n	 _build_tree_list
	or	 r2,r0,0
	or	 r12,r0,r2
	or	 r2,r0,0
	or.u	 r11,r0,hi16(_void_list_node)
	ld	 r13,r12,8
	or	 r3,r0,0
	or.u	 r25,r0,hi16(_null_pointer_node)
	st	 r12,r11,lo16(_void_list_node)
	or.u	 r13,r13,0x2
	bsr.n	 _build_int_2_wide
	st	 r13,r12,8
	st	 r2,r25,lo16(_null_pointer_node)
	bsr.n	 _build_pointer_type
	ld	 r2,r24,lo16(_void_type_node)
	ld	 r13,r25,lo16(_null_pointer_node)
	bsr.n	 _layout_type
	st	 r2,r13,4
	or	 r2,r0,0
	bsr.n	 _build_int_2_wide
	or	 r3,r0,0
	or.u	 r25,r0,hi16(_char_type_node)
	ld	 r12,r24,lo16(_void_type_node)
	or	 r11,r0,r2
	ld	 r2,r25,lo16(_char_type_node)
	or.u	 r13,r0,hi16(_void_zero_node)
	st	 r11,r13,lo16(_void_zero_node)
	or.u	 r24,r0,hi16(_string_type_node)
	bsr.n	 _build_pointer_type
	st	 r12,r11,4
	st	 r2,r24,lo16(_string_type_node)
	or	 r3,r0,1
	ld	 r2,r25,lo16(_char_type_node)
	bsr.n	 _build_type_variant
	or	 r4,r0,0
	bsr	 _build_pointer_type
	or.u	 r13,r0,hi16(_const_string_type_node)
	st	 r2,r13,lo16(_const_string_type_node)
	or.u	 r13,r0,hi16(_flag_dossier)
	ld	 r13,r13,lo16(_flag_dossier)
	ld	 r24,r24,lo16(_string_type_node)
	bcnd.n	 eq0,r13,@L2996
	or.u	 r23,r0,hi16(_builtin_type_tdescs_len)
	or.u	 r11,r0,hi16(_builtin_type_tdescs_max)
	ld	 r13,r23,lo16(_builtin_type_tdescs_len)
	ld	 r12,r11,lo16(_builtin_type_tdescs_max)
	addu	 r13,r13,5
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L3017
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	mak	 r3,r12,0<3>
	ld	 r2,r25,lo16(_builtin_type_tdescs_arr)
	mak	 r13,r12,0<1>
	bsr.n	 _xrealloc
	st	 r13,r11,lo16(_builtin_type_tdescs_max)
	st	 r2,r25,lo16(_builtin_type_tdescs_arr)
@L3017:
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r23,lo16(_builtin_type_tdescs_len)
	st	 r24,r11[r12]
	ld.bu	 r13,r24,8
	cmp	 r13,r13,13
	bb0	 ne,r13,@L3018
	bsr.n	 _build_pointer_type
	or	 r2,r0,r24
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r24,32
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r23,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L3018:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,6
	bb0.n	 ne,r13,@L3264
	or.u	 r13,r0,hi16(_char_type_node)
	bsr.n	 _build_reference_type
	or	 r2,r0,r24
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r24,36
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r23,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L2996:
	or.u	 r13,r0,hi16(_char_type_node)
@L3264:
	or.u	 r25,r0,hi16(_unsigned_char_type_node)
	ld	 r2,r13,lo16(_char_type_node)
	bsr.n	 _build_array_type
	ld	 r3,r25,lo16(_unsigned_char_type_node)
	ld	 r3,r25,lo16(_unsigned_char_type_node)
	or.u	 r13,r0,hi16(_char_array_type_node)
	or.u	 r25,r0,hi16(_integer_type_node)
	st	 r2,r13,lo16(_char_array_type_node)
	bsr.n	 _build_array_type
	ld	 r2,r25,lo16(_integer_type_node)
	or.u	 r13,r0,hi16(_int_array_type_node)
	st	 r2,r13,lo16(_int_array_type_node)
	bsr.n	 _make_lang_type
	or	 r2,r0,21
	bsr.n	 _build_pointer_type
	or.u	 r24,r0,hi16(_ptr_type_node)
	or.u	 r13,r0,hi16(_class_star_type_node)
	st	 r2,r13,lo16(_class_star_type_node)
	ld	 r2,r25,lo16(_integer_type_node)
	bsr.n	 _build_function_type
	or	 r3,r0,0
	or.u	 r13,r0,hi16(_default_function_type)
	or.u	 r25,r0,hi16(_void_type_node)
	bsr.n	 _build_pointer_type
	st	 r2,r13,lo16(_default_function_type)
	bsr.n	 _build_pointer_type
	ld	 r2,r25,lo16(_void_type_node)
	st	 r2,r24,lo16(_ptr_type_node)
	or	 r3,r0,1
	ld	 r2,r25,lo16(_void_type_node)
	bsr.n	 _build_type_variant
	or	 r4,r0,0
	bsr	 _build_pointer_type
	or.u	 r13,r0,hi16(_const_ptr_type_node)
	st	 r2,r13,lo16(_const_ptr_type_node)
	or.u	 r13,r0,hi16(_flag_dossier)
	ld	 r13,r13,lo16(_flag_dossier)
	ld	 r24,r24,lo16(_ptr_type_node)
	bcnd	 eq0,r13,@L3020
	or.u	 r23,r0,hi16(_builtin_type_tdescs_len)
	or.u	 r11,r0,hi16(_builtin_type_tdescs_max)
	ld	 r13,r23,lo16(_builtin_type_tdescs_len)
	ld	 r12,r11,lo16(_builtin_type_tdescs_max)
	addu	 r13,r13,5
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L3041
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	mak	 r3,r12,0<3>
	ld	 r2,r25,lo16(_builtin_type_tdescs_arr)
	mak	 r13,r12,0<1>
	bsr.n	 _xrealloc
	st	 r13,r11,lo16(_builtin_type_tdescs_max)
	st	 r2,r25,lo16(_builtin_type_tdescs_arr)
@L3041:
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r23,lo16(_builtin_type_tdescs_len)
	st	 r24,r11[r12]
	ld.bu	 r13,r24,8
	cmp	 r13,r13,13
	bb0	 ne,r13,@L3042
	bsr.n	 _build_pointer_type
	or	 r2,r0,r24
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r24,32
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r23,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L3042:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,6
	bb0.n	 ne,r13,@L3265
	or.u	 r13,r0,hi16(_void_list_node)
	bsr.n	 _build_reference_type
	or	 r2,r0,r24
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r24,36
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r23,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L3020:
	or.u	 r13,r0,hi16(_void_list_node)
@L3265:
	or.u	 r22,r0,hi16(_integer_type_node)
	ld	 r19,r13,lo16(_void_list_node)
	or	 r2,r0,0
	ld	 r3,r22,lo16(_integer_type_node)
	or	 r4,r0,r19
	bsr.n	 _tree_cons
	or.u	 r25,r0,hi16(_double_type_node)
	ld	 r3,r25,lo16(_double_type_node)
	or	 r23,r0,r2
	or	 r2,r0,0
	or	 r4,r0,r19
	bsr.n	 _tree_cons
	or.u	 r18,r0,hi16(_ptr_type_node)
	ld	 r3,r18,lo16(_ptr_type_node)
	or	 r24,r0,r2
	or	 r2,r0,0
	bsr.n	 _tree_cons
	or	 r4,r0,r19
	ld	 r2,r25,lo16(_double_type_node)
	bsr.n	 _build_function_type
	or	 r3,r0,r24
	ld	 r25,r25,lo16(_double_type_node)
	or.u	 r13,r0,hi16(_double_ftype_double)
	or	 r4,r0,r24
	st	 r2,r13,lo16(_double_ftype_double)
	or	 r2,r0,0
	bsr.n	 _tree_cons
	or	 r3,r0,r25
	or	 r3,r0,r2
	bsr.n	 _build_function_type
	or	 r2,r0,r25
	or.u	 r13,r0,hi16(_double_ftype_double_double)
	st	 r2,r13,lo16(_double_ftype_double_double)
	ld	 r2,r22,lo16(_integer_type_node)
	bsr.n	 _build_function_type
	or	 r3,r0,r23
	or.u	 r13,r0,hi16(_long_integer_type_node)
	ld	 r25,r13,lo16(_long_integer_type_node)
	or.u	 r13,r0,hi16(_int_ftype_int)
	or	 r4,r0,r19
	st	 r2,r13,lo16(_int_ftype_int)
	or	 r2,r0,0
	bsr.n	 _tree_cons
	or	 r3,r0,r25
	or	 r3,r0,r2
	bsr.n	 _build_function_type
	or	 r2,r0,r25
	ld	 r25,r18,lo16(_ptr_type_node)
	or.u	 r13,r0,hi16(_long_ftype_long)
	or	 r4,r0,r23
	or.u	 r21,r0,hi16(_void_type_node)
	st	 r2,r13,lo16(_long_ftype_long)
	or	 r2,r0,0
	or	 r3,r0,r25
	bsr.n	 _tree_cons
	ld	 r24,r21,lo16(_void_type_node)
	or	 r4,r0,r2
	or	 r2,r0,0
	bsr.n	 _tree_cons
	or	 r3,r0,r25
	or	 r3,r0,r2
	or	 r2,r0,r24
	bsr.n	 _build_function_type
	or.u	 r20,r0,hi16(_sizetype)
	ld	 r3,r20,lo16(_sizetype)
	ld	 r24,r22,lo16(_integer_type_node)
	or.u	 r13,r0,hi16(_void_ftype_ptr_ptr_int)
	or	 r4,r0,r19
	st	 r2,r13,lo16(_void_ftype_ptr_ptr_int)
	or.u	 r13,r0,hi16(_const_ptr_type_node)
	or	 r2,r0,0
	bsr.n	 _tree_cons
	ld	 r25,r13,lo16(_const_ptr_type_node)
	or	 r4,r0,r2
	or	 r2,r0,0
	bsr.n	 _tree_cons
	or	 r3,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,0
	bsr.n	 _tree_cons
	or	 r3,r0,r25
	or	 r3,r0,r2
	bsr.n	 _build_function_type
	or	 r2,r0,r24
	ld	 r3,r22,lo16(_integer_type_node)
	ld	 r24,r21,lo16(_void_type_node)
	or.u	 r13,r0,hi16(_int_ftype_cptr_cptr_sizet)
	or	 r4,r0,r23
	st	 r2,r13,lo16(_int_ftype_cptr_cptr_sizet)
	or	 r2,r0,0
	bsr.n	 _tree_cons
	ld	 r25,r18,lo16(_ptr_type_node)
	or	 r4,r0,r2
	or	 r2,r0,0
	bsr.n	 _tree_cons
	or	 r3,r0,r25
	or	 r3,r0,r2
	or	 r2,r0,r24
	bsr.n	 _build_function_type
	or.u	 r23,r0,hi16(_const_string_type_node)
	ld	 r3,r23,lo16(_const_string_type_node)
	or.u	 r13,r0,hi16(_void_ftype_ptr_int_int)
	or	 r4,r0,r19
	or.u	 r21,r0,hi16(_string_type_node)
	st	 r2,r13,lo16(_void_ftype_ptr_int_int)
	or	 r2,r0,0
	bsr.n	 _tree_cons
	ld	 r25,r21,lo16(_string_type_node)
	or	 r4,r0,r2
	or	 r2,r0,0
	bsr.n	 _tree_cons
	or	 r3,r0,r25
	or	 r3,r0,r2
	bsr.n	 _build_function_type
	or	 r2,r0,r25
	ld	 r25,r23,lo16(_const_string_type_node)
	or.u	 r13,r0,hi16(_string_ftype_ptr_ptr)
	or	 r4,r0,r19
	st	 r2,r13,lo16(_string_ftype_ptr_ptr)
	or	 r2,r0,0
	or	 r3,r0,r25
	bsr.n	 _tree_cons
	ld	 r24,r22,lo16(_integer_type_node)
	or	 r4,r0,r2
	or	 r2,r0,0
	bsr.n	 _tree_cons
	or	 r3,r0,r25
	or	 r3,r0,r2
	bsr.n	 _build_function_type
	or	 r2,r0,r24
	ld	 r3,r23,lo16(_const_string_type_node)
	or.u	 r13,r0,hi16(_int_ftype_string_string)
	or	 r4,r0,r19
	st	 r2,r13,lo16(_int_ftype_string_string)
	or	 r2,r0,0
	bsr.n	 _tree_cons
	ld	 r25,r20,lo16(_sizetype)
	or	 r3,r0,r2
	bsr.n	 _build_function_type
	or	 r2,r0,r25
	or.u	 r13,r0,hi16(_flag_traditional)
	ld	 r12,r13,lo16(_flag_traditional)
	or.u	 r13,r0,hi16(_sizet_ftype_string)
	bcnd.n	 eq0,r12,@L3044
	st	 r2,r13,lo16(_sizet_ftype_string)
	ld	 r22,r21,lo16(_string_type_node)
	br.n	 @L3266
	or.u	 r13,r0,hi16(_sizetype)
	align	 4
@L3044:
	ld	 r22,r18,lo16(_ptr_type_node)
	or.u	 r13,r0,hi16(_sizetype)
@L3266:
	or.u	 r23,r0,hi16(_ptr_type_node)
	ld	 r3,r13,lo16(_sizetype)
	or	 r2,r0,0
	ld	 r24,r23,lo16(_ptr_type_node)
	or.u	 r13,r0,hi16(_const_ptr_type_node)
	or	 r4,r0,r19
	bsr.n	 _tree_cons
	ld	 r25,r13,lo16(_const_ptr_type_node)
	or	 r4,r0,r2
	or	 r2,r0,0
	bsr.n	 _tree_cons
	or	 r3,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,0
	bsr.n	 _tree_cons
	or	 r3,r0,r24
	or	 r3,r0,r2
	bsr.n	 _build_function_type
	or	 r2,r0,r22
	or	 r20,r0,r2
	ld	 r2,r23,lo16(_ptr_type_node)
	bsr.n	 _build_array_type
	or	 r3,r0,0
	or.u	 r25,r0,hi16(_vtbl_type_node)
	bsr.n	 _layout_type
	st	 r2,r25,lo16(_vtbl_type_node)
	ld	 r2,r25,lo16(_vtbl_type_node)
	or	 r3,r0,1
	bsr.n	 _build_type_variant
	or	 r4,r0,0
	or.u	 r13,r0,hi16(_flag_dossier)
	ld	 r13,r13,lo16(_flag_dossier)
	st	 r2,r25,lo16(_vtbl_type_node)
	bcnd.n	 eq0,r13,@L3046
	or	 r24,r0,r2
	or.u	 r23,r0,hi16(_builtin_type_tdescs_len)
	or.u	 r11,r0,hi16(_builtin_type_tdescs_max)
	ld	 r13,r23,lo16(_builtin_type_tdescs_len)
	ld	 r12,r11,lo16(_builtin_type_tdescs_max)
	addu	 r13,r13,5
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L3067
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	mak	 r3,r12,0<3>
	ld	 r2,r25,lo16(_builtin_type_tdescs_arr)
	mak	 r13,r12,0<1>
	bsr.n	 _xrealloc
	st	 r13,r11,lo16(_builtin_type_tdescs_max)
	st	 r2,r25,lo16(_builtin_type_tdescs_arr)
@L3067:
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r23,lo16(_builtin_type_tdescs_len)
	st	 r24,r11[r12]
	ld.bu	 r13,r24,8
	cmp	 r13,r13,13
	bb0	 ne,r13,@L3068
	bsr.n	 _build_pointer_type
	or	 r2,r0,r24
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r24,32
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r23,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L3068:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,6
	bb0.n	 ne,r13,@L3267
	or	 r4,r0,27
	bsr.n	 _build_reference_type
	or	 r2,r0,r24
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r24,36
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r12,r23,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r23,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L3046:
	or	 r4,r0,27
@L3267:
	or.u	 r22,r0,hi16(_int_ftype_int)
	or	 r6,r0,0
	or.u	 r24,r0,hi16(_pushdecl)
	or.u	 r2,r0,hi16(@LC138)
	ld	 r3,r22,lo16(_int_ftype_int)
	or	 r24,r24,lo16(_pushdecl)
	or	 r2,r2,lo16(@LC138)
	bsr.n	 _define_function
	or	 r5,r0,r24
	or	 r2,r0,0
	or.u	 r13,r0,hi16(_sizetype)
	or	 r4,r0,r19
	or.u	 r21,r0,hi16(_ptr_type_node)
	ld	 r3,r13,lo16(_sizetype)
	or.u	 r25,r0,hi16(@LC139)
	ld	 r23,r21,lo16(_ptr_type_node)
	bsr.n	 _tree_cons
	or	 r25,r25,lo16(@LC139)
	or	 r3,r0,r2
	bsr.n	 _build_function_type
	or	 r2,r0,r23
	or	 r3,r0,r2
	or	 r2,r0,r25
	or	 r4,r0,1
	or.u	 r6,r0,hi16(@LC140)
	or	 r5,r0,r24
	bsr.n	 _define_function
	or	 r6,r6,lo16(@LC140)
	ld	 r3,r22,lo16(_int_ftype_int)
	or	 r4,r0,2
	or	 r5,r0,r24
	or.u	 r2,r0,hi16(@LC141)
	or	 r6,r0,0
	or	 r2,r2,lo16(@LC141)
	bsr.n	 _define_function
	or.u	 r25,r0,hi16(_double_ftype_double)
	ld	 r3,r25,lo16(_double_ftype_double)
	or	 r4,r0,3
	or	 r5,r0,r24
	or.u	 r2,r0,hi16(@LC142)
	or	 r6,r0,0
	bsr.n	 _define_function
	or	 r2,r2,lo16(@LC142)
	or	 r4,r0,4
	or	 r5,r0,r24
	or	 r6,r0,0
	or.u	 r13,r0,hi16(_long_ftype_long)
	or.u	 r2,r0,hi16(@LC143)
	ld	 r3,r13,lo16(_long_ftype_long)
	bsr.n	 _define_function
	or	 r2,r2,lo16(@LC143)
	ld	 r3,r22,lo16(_int_ftype_int)
	or	 r4,r0,5
	or	 r5,r0,r24
	or.u	 r2,r0,hi16(@LC144)
	or	 r6,r0,0
	bsr.n	 _define_function
	or	 r2,r2,lo16(@LC144)
	ld	 r3,r25,lo16(_double_ftype_double)
	or	 r4,r0,18
	or	 r5,r0,r24
	or.u	 r2,r0,hi16(@LC145)
	or	 r6,r0,0
	bsr.n	 _define_function
	or	 r2,r2,lo16(@LC145)
	ld	 r3,r25,lo16(_double_ftype_double)
	or	 r4,r0,19
	or	 r5,r0,r24
	or.u	 r2,r0,hi16(@LC146)
	or	 r6,r0,0
	bsr.n	 _define_function
	or	 r2,r2,lo16(@LC146)
	ld	 r3,r25,lo16(_double_ftype_double)
	or	 r4,r0,20
	or	 r5,r0,r24
	or.u	 r2,r0,hi16(@LC147)
	or	 r6,r0,0
	bsr.n	 _define_function
	or	 r2,r2,lo16(@LC147)
	ld	 r2,r21,lo16(_ptr_type_node)
	or.u	 r25,r0,hi16(@LC148)
	or	 r3,r0,0
	bsr.n	 _build_function_type
	or	 r25,r25,lo16(@LC148)
	or	 r3,r0,r2
	or	 r2,r0,r25
	or	 r4,r0,23
	or	 r5,r0,r24
	bsr.n	 _define_function
	or	 r6,r0,0
	or	 r4,r0,24
	or	 r5,r0,r24
	or	 r6,r0,0
	or.u	 r13,r0,hi16(_default_function_type)
	or.u	 r2,r0,hi16(@LC149)
	ld	 r3,r13,lo16(_default_function_type)
	bsr.n	 _define_function
	or	 r2,r2,lo16(@LC149)
	ld	 r2,r21,lo16(_ptr_type_node)
	or.u	 r25,r0,hi16(@LC150)
	or	 r3,r0,r19
	bsr.n	 _build_function_type
	or	 r25,r25,lo16(@LC150)
	or	 r3,r0,r2
	or	 r2,r0,r25
	or	 r4,r0,25
	or	 r5,r0,r24
	bsr.n	 _define_function
	or	 r6,r0,0
	or	 r3,r0,r20
	or	 r4,r0,12
	or	 r5,r0,r24
	or.u	 r2,r0,hi16(@LC151)
	or.u	 r6,r0,hi16(@LC152)
	or	 r2,r2,lo16(@LC151)
	or	 r6,r6,lo16(@LC152)
	bsr.n	 _define_function
	or.u	 r21,r0,hi16(_int_ftype_cptr_cptr_sizet)
	ld	 r3,r21,lo16(_int_ftype_cptr_cptr_sizet)
	or	 r4,r0,13
	or	 r5,r0,r24
	or.u	 r2,r0,hi16(@LC153)
	or.u	 r6,r0,hi16(@LC154)
	or	 r2,r2,lo16(@LC153)
	or	 r6,r6,lo16(@LC154)
	bsr.n	 _define_function
	or.u	 r22,r0,hi16(_int_ftype_string_string)
	ld	 r3,r22,lo16(_int_ftype_string_string)
	or	 r4,r0,16
	or	 r5,r0,r24
	or.u	 r2,r0,hi16(@LC155)
	or.u	 r6,r0,hi16(@LC156)
	or	 r2,r2,lo16(@LC155)
	or	 r6,r6,lo16(@LC156)
	bsr.n	 _define_function
	or.u	 r23,r0,hi16(_string_ftype_ptr_ptr)
	ld	 r3,r23,lo16(_string_ftype_ptr_ptr)
	or	 r4,r0,15
	or	 r5,r0,r24
	or.u	 r2,r0,hi16(@LC157)
	or.u	 r6,r0,hi16(@LC158)
	or	 r2,r2,lo16(@LC157)
	or	 r6,r6,lo16(@LC158)
	bsr.n	 _define_function
	or.u	 r25,r0,hi16(_sizet_ftype_string)
	ld	 r3,r25,lo16(_sizet_ftype_string)
	or	 r4,r0,17
	or	 r5,r0,r24
	or.u	 r2,r0,hi16(@LC159)
	or.u	 r6,r0,hi16(@LC160)
	or	 r2,r2,lo16(@LC159)
	bsr.n	 _define_function
	or	 r6,r6,lo16(@LC160)
	or	 r3,r0,r20
	or	 r4,r0,12
	or	 r5,r0,r24
	or.u	 r2,r0,hi16(@LC161)
	or	 r6,r0,0
	bsr.n	 _define_function
	or	 r2,r2,lo16(@LC161)
	ld	 r3,r21,lo16(_int_ftype_cptr_cptr_sizet)
	or	 r4,r0,13
	or	 r5,r0,r24
	or.u	 r2,r0,hi16(@LC162)
	or	 r6,r0,0
	bsr.n	 _define_function
	or	 r2,r2,lo16(@LC162)
	ld	 r3,r22,lo16(_int_ftype_string_string)
	or	 r4,r0,16
	or	 r5,r0,r24
	or.u	 r2,r0,hi16(@LC163)
	or	 r6,r0,0
	bsr.n	 _define_function
	or	 r2,r2,lo16(@LC163)
	ld	 r3,r23,lo16(_string_ftype_ptr_ptr)
	or	 r4,r0,15
	or	 r5,r0,r24
	or.u	 r2,r0,hi16(@LC164)
	or	 r6,r0,0
	bsr.n	 _define_function
	or	 r2,r2,lo16(@LC164)
	ld	 r3,r25,lo16(_sizet_ftype_string)
	or	 r4,r0,17
	or	 r5,r0,r24
	or.u	 r2,r0,hi16(@LC165)
	or	 r6,r0,0
	bsr.n	 _define_function
	or	 r2,r2,lo16(@LC165)
	bsr.n	 _make_node
	or	 r2,r0,24
	or.u	 r25,r0,hi16(_unknown_type_node)
	or.u	 r13,r0,hi16(@LC166)
	st	 r2,r25,lo16(_unknown_type_node)
	bsr.n	 _get_identifier
	or	 r2,r13,lo16(@LC166)
	ld	 r4,r25,lo16(_unknown_type_node)
	or	 r3,r0,r2
	bsr.n	 _build_decl
	or	 r2,r0,32
	bsr.n	 _pushdecl
	or.u	 r23,r0,hi16(_signed_wchar_type_node)
	or.u	 r13,r0,hi16(_void_type_node)
	ld	 r11,r13,lo16(_void_type_node)
	ld	 r12,r25,lo16(_unknown_type_node)
	ld	 r13,r11,16
	st	 r13,r12,16
	or	 r13,r0,1
	st	 r13,r12,28
	ld.bu	 r13,r11,24
	st.b	 r13,r12,24
	ld	 r13,r25,lo16(_unknown_type_node)
	st	 r13,r13,4
	or.u	 r2,r0,hi16(@LC167)
	st	 r13,r13,32
	or	 r2,r2,lo16(@LC167)
	bsr.n	 _get_identifier
	st	 r13,r13,36
	ld	 r13,r2,20
	ld	 r13,r13,4
	or.u	 r25,r0,hi16(_wchar_type_node)
	st	 r13,r25,lo16(_wchar_type_node)
	ld.bu	 r24,r13,25
	bsr.n	 _make_signed_type
	or	 r2,r0,r24
	st	 r2,r23,lo16(_signed_wchar_type_node)
	bsr.n	 _make_unsigned_type
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_wchar_type_node)
	ld	 r12,r13,8
	or.u	 r13,r0,hi16(_unsigned_wchar_type_node)
	or	 r25,r25,lo16(_wchar_type_node)
	bb1.n	 (31-14),r12,@L3071
	st	 r2,r13,lo16(_unsigned_wchar_type_node)
	ld	 r2,r23,lo16(_signed_wchar_type_node)
@L3071:
	st	 r2,r0,r25
	or.u	 r13,r0,hi16(_wchar_type_node)
	or	 r25,r0,0
	or.u	 r12,r0,hi16(@LC168)
	ld	 r23,r13,lo16(_wchar_type_node)
	or.u	 r13,r0,hi16(_ridpointers+96)
	or	 r2,r12,lo16(@LC168)
	ld	 r24,r13,lo16(_ridpointers+96)
	bcnd.n	 eq0,r2,@L3074
	or	 r21,r0,24
	bsr	 _get_identifier
	or	 r25,r0,r2
@L3074:
	bcnd.n	 eq0,r25,@L3075
	or	 r2,r0,32
	or	 r3,r0,r25
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r22,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r22,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L3077
	st	 r2,r31,228
	ld	 r3,r25,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_current_binding_level)
	br.n	 @L3078
	st	 r2,r13,16
	align	 4
@L3077:
	or.u	 r22,r0,hi16(_class_binding_level)
	ld	 r13,r22,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L3078
	ld	 r3,r25,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_class_binding_level)
	st	 r2,r13,16
@L3078:
	cmp	 r13,r21,31
	bb1.n	 gt,r13,@L3075
	st	 r0,r25,4
	ld	 r8,r31,228
	st	 r8,r25,20
@L3075:
	bcnd.n	 eq0,r24,@L3268
	or.u	 r13,r0,hi16(_flag_dossier)
	bcnd.n	 eq0,r25,@L3082
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L3084
	ld	 r3,r24,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L3085
	st	 r2,r13,16
	align	 4
@L3084:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L3085
	ld	 r3,r24,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L3085:
	st	 r0,r24,4
	ld	 r8,r31,228
	br.n	 @L3081
	st	 r8,r24,20
	align	 4
@L3082:
	or	 r2,r0,32
	or	 r3,r0,r24
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L3089
	ld	 r3,r24,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L3090
	st	 r2,r13,16
	align	 4
@L3089:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L3090
	ld	 r3,r24,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L3090:
	st	 r0,r24,4
@L3081:
	or.u	 r13,r0,hi16(_flag_dossier)
@L3268:
	ld	 r13,r13,lo16(_flag_dossier)
	bcnd.n	 eq0,r13,@L3072
	or.u	 r24,r0,hi16(_builtin_type_tdescs_len)
	or.u	 r11,r0,hi16(_builtin_type_tdescs_max)
	ld	 r13,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r11,lo16(_builtin_type_tdescs_max)
	addu	 r13,r13,5
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L3093
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	mak	 r3,r12,0<3>
	ld	 r2,r25,lo16(_builtin_type_tdescs_arr)
	mak	 r13,r12,0<1>
	bsr.n	 _xrealloc
	st	 r13,r11,lo16(_builtin_type_tdescs_max)
	st	 r2,r25,lo16(_builtin_type_tdescs_arr)
@L3093:
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r23,r11[r12]
	ld.bu	 r13,r23,8
	cmp	 r13,r13,13
	bb0	 ne,r13,@L3094
	bsr.n	 _build_pointer_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,32
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L3094:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,6
	bb0.n	 ne,r13,@L3269
	or.u	 r13,r0,hi16(_wchar_type_node)
	bsr.n	 _build_reference_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,36
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L3072:
	or.u	 r13,r0,hi16(_wchar_type_node)
@L3269:
	ld	 r2,r13,lo16(_wchar_type_node)
	or.u	 r13,r0,hi16(_unsigned_char_type_node)
	bsr.n	 _build_array_type
	ld	 r3,r13,lo16(_unsigned_char_type_node)
	or.u	 r13,r0,hi16(_flag_gc)
	ld	 r12,r13,lo16(_flag_gc)
	or.u	 r13,r0,hi16(_wchar_array_type_node)
	bcnd.n	 eq0,r12,@L3096
	st	 r2,r13,lo16(_wchar_array_type_node)
	or	 r4,r0,0
	or.u	 r13,r0,hi16(_default_function_type)
	or	 r6,r0,0
	or.u	 r2,r0,hi16(@LC169)
	or.u	 r5,r0,hi16(_pushdecl)
	ld	 r3,r13,lo16(_default_function_type)
	or	 r2,r2,lo16(@LC169)
	bsr.n	 _define_function
	or	 r5,r5,lo16(_pushdecl)
	or.u	 r2,r0,hi16(@LC170)
	bsr.n	 _get_identifier
	or	 r2,r2,lo16(@LC170)
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r12,r13,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r12,r12,r13
	bb0.n	 ne,r12,@L3098
	or	 r25,r0,r2
	ld	 r2,r25,24
	bcnd	 ne0,r2,@L3099
@L3098:
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r12,r13,lo16(_current_class_type)
	bcnd	 eq0,r12,@L3100
	ld	 r2,r25,28
	bcnd	 ne0,r2,@L3159
	ld	 r13,r12,16
	bcnd	 ne0,r13,@L3101
	ld	 r13,r12,80
	ld	 r13,r0,r13
	bb0	 (31-24),r13,@L3101
	or	 r2,r0,r12
	or	 r3,r0,r25
	or	 r4,r0,0
	bsr.n	 _lookup_field
	or	 r5,r0,0
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r2,r13
	bb0	 ne,r13,@L3097
	bcnd	 eq0,r2,@L3158
	ld.bu	 r13,r2,8
	cmp	 r13,r13,32
	ext	 r13,r13,1<eq>
	and	 r2,r2,r13
@L3101:
	bcnd	 ne0,r2,@L3159
@L3158:
	bsr.n	 _lookup_nested_field
	or	 r2,r0,r25
	bcnd	 ne0,r2,@L3159
@L3100:
	ld	 r2,r25,20
@L3099:
	bcnd	 eq0,r2,@L3097
@L3159:
	ld.bu	 r13,r2,8
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L3097
	or.u	 r13,r0,hi16(_looking_for_typename)
	ld	 r12,r13,lo16(_looking_for_typename)
	bcnd	 lt0,r12,@L3097
	ld	 r3,r25,4
	bcnd	 eq0,r3,@L3110
	ld	 r3,r3,48
	cmp	 r13,r2,r3
	extu	 r13,r13,1<eq>
	bcnd	 ne0,r13,@L3230
	bcnd	 le0,r12,@L3097
	or	 r2,r0,r3
	br	 @L3097
	align	 4
@L3110:
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r3,r2,4
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r3,r13
	bb1	 ne,r13,@L3097
@L3230:
	or	 r2,r0,r3
@L3097:
	bsr	 _pushdecl
@L3096:
	bsr.n	 _make_lang_type
	or	 r2,r0,21
	or.u	 r24,r0,hi16(_vtable_entry_type)
	or.u	 r13,r0,hi16(@LC171)
	st	 r2,r24,lo16(_vtable_entry_type)
	bsr.n	 _get_identifier
	or	 r2,r13,lo16(@LC171)
	or.u	 r25,r0,hi16(_short_integer_type_node)
	or	 r3,r0,r2
	ld	 r4,r25,lo16(_short_integer_type_node)
	bsr.n	 _build_lang_field_decl
	or	 r2,r0,36
	or.u	 r13,r0,hi16(@LC172)
	st	 r2,r31,88
	bsr.n	 _get_identifier
	or	 r2,r13,lo16(@LC172)
	or	 r3,r0,r2
	ld	 r4,r25,lo16(_short_integer_type_node)
	bsr.n	 _build_lang_field_decl
	or	 r2,r0,36
	or.u	 r13,r0,hi16(@LC173)
	st	 r2,r31,92
	bsr.n	 _get_identifier
	or	 r2,r13,lo16(@LC173)
	or.u	 r13,r0,hi16(_ptr_type_node)
	or	 r3,r0,r2
	ld	 r4,r13,lo16(_ptr_type_node)
	bsr.n	 _build_lang_field_decl
	or	 r2,r0,36
	addu	 r4,r31,88
	or	 r5,r0,2
	st	 r2,r31,96
	or.u	 r13,r0,hi16(_double_type_node)
	ld	 r2,r24,lo16(_vtable_entry_type)
	or.u	 r3,r0,hi16(@LC174)
	ld	 r6,r13,lo16(_double_type_node)
	bsr.n	 _finish_builtin_type
	or	 r3,r3,lo16(@LC174)
	bsr.n	 _copy_node
	ld	 r2,r31,96
	ld	 r12,r25,lo16(_short_integer_type_node)
	or	 r13,r0,r2
	or.u	 r2,r0,hi16(@LC175)
	st	 r13,r31,100
	or	 r2,r2,lo16(@LC175)
	bsr.n	 _get_identifier
	st	 r12,r13,4
	ld	 r13,r31,100
	st	 r2,r13,32
	ld	 r13,r25,lo16(_short_integer_type_node)
	ld	 r12,r31,100
	ld.bu	 r13,r13,24
	st.b	 r13,r12,28
	ld	 r13,r25,lo16(_short_integer_type_node)
	ld	 r12,r31,100
	ld	 r13,r13,16
	st	 r13,r12,20
	ld	 r12,r31,100
	ld	 r13,r12,8
	ld	 r2,r24,lo16(_vtable_entry_type)
	and.u	 r13,r13,0xfffd
	st	 r13,r12,8
	ld	 r12,r31,96
	or	 r3,r0,1
	ld	 r13,r31,100
	or	 r4,r0,0
	or	 r25,r0,0
	bsr.n	 _build_type_variant
	st	 r13,r0,r12
	or.u	 r13,r0,hi16(@LC176)
	or	 r21,r0,32
	or	 r23,r0,r2
	st	 r2,r24,lo16(_vtable_entry_type)
	or	 r13,r13,lo16(@LC176)
	bcnd.n	 eq0,r13,@L3117
	or	 r24,r0,0
	bsr.n	 _get_identifier
	or	 r2,r0,r13
	or	 r25,r0,r2
@L3117:
	bcnd.n	 eq0,r25,@L3118
	or	 r2,r0,32
	or	 r3,r0,r25
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r22,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r22,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L3120
	st	 r2,r31,236
	ld	 r3,r25,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_current_binding_level)
	br.n	 @L3121
	st	 r2,r13,16
	align	 4
@L3120:
	or.u	 r22,r0,hi16(_class_binding_level)
	ld	 r13,r22,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L3121
	ld	 r3,r25,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r22,lo16(_class_binding_level)
	st	 r2,r13,16
@L3121:
	cmp	 r13,r21,31
	bb1.n	 gt,r13,@L3118
	st	 r0,r25,4
	ld	 r8,r31,236
	st	 r8,r25,20
@L3118:
	bcnd.n	 eq0,r24,@L3270
	or.u	 r22,r0,hi16(_flag_dossier)
	bcnd.n	 eq0,r25,@L3125
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L3127
	ld	 r3,r0,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L3128
	st	 r2,r13,16
	align	 4
@L3127:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L3128
	ld	 r3,r0,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L3128:
	st	 r0,r24,4
	ld	 r8,r31,236
	br.n	 @L3124
	st	 r8,r24,20
	align	 4
@L3125:
	or	 r2,r0,32
	or	 r3,r0,r24
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr.n	 _pushdecl
	or.u	 r25,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L3132
	ld	 r3,r0,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L3133
	st	 r2,r13,16
	align	 4
@L3132:
	or.u	 r25,r0,hi16(_class_binding_level)
	ld	 r13,r25,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L3133
	ld	 r3,r0,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r25,lo16(_class_binding_level)
	st	 r2,r13,16
@L3133:
	st	 r0,r24,4
@L3124:
	or.u	 r22,r0,hi16(_flag_dossier)
@L3270:
	ld	 r13,r22,lo16(_flag_dossier)
	bcnd.n	 eq0,r13,@L3139
	or.u	 r24,r0,hi16(_builtin_type_tdescs_len)
	or.u	 r11,r0,hi16(_builtin_type_tdescs_max)
	ld	 r13,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r11,lo16(_builtin_type_tdescs_max)
	addu	 r13,r13,5
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L3136
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	mak	 r3,r12,0<3>
	ld	 r2,r25,lo16(_builtin_type_tdescs_arr)
	mak	 r13,r12,0<1>
	bsr.n	 _xrealloc
	st	 r13,r11,lo16(_builtin_type_tdescs_max)
	st	 r2,r25,lo16(_builtin_type_tdescs_arr)
@L3136:
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r23,r11[r12]
	ld.bu	 r13,r23,8
	cmp	 r13,r13,13
	bb0	 ne,r13,@L3137
	bsr.n	 _build_pointer_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,32
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L3137:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,6
	bb0	 ne,r13,@L3115
	bsr.n	 _build_reference_type
	or	 r2,r0,r23
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	st	 r2,r13[r12]
	or	 r3,r0,1
	ld	 r2,r23,36
	or	 r4,r0,0
	addu	 r12,r12,1
	bsr.n	 _build_type_variant
	st	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r24,lo16(_builtin_type_tdescs_len)
	ld	 r11,r25,lo16(_builtin_type_tdescs_arr)
	addu	 r13,r12,1
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	st	 r2,r11[r12]
@L3115:
	ld	 r13,r22,lo16(_flag_dossier)
	bcnd.n	 eq0,r13,@L3139
	or	 r2,r0,21
	bsr.n	 _make_lang_type
	or.u	 r23,r0,hi16(___t_desc_type_node)
	st	 r2,r23,lo16(___t_desc_type_node)
	or	 r2,r0,21
	bsr.n	 _make_lang_type
	or.u	 r20,r0,hi16(___i_desc_type_node)
	st	 r2,r20,lo16(___i_desc_type_node)
	bsr.n	 _make_lang_type
	or	 r2,r0,21
	ld	 r13,r23,lo16(___t_desc_type_node)
	or.u	 r17,r0,hi16(___m_desc_type_node)
	st	 r2,r17,lo16(___m_desc_type_node)
	ld	 r2,r13,32
	bsr.n	 _build_array_type
	or	 r3,r0,0
	ld	 r13,r20,lo16(___i_desc_type_node)
	or.u	 r22,r0,hi16(___t_desc_array_type)
	st	 r2,r22,lo16(___t_desc_array_type)
	ld	 r2,r13,32
	bsr.n	 _build_array_type
	or	 r3,r0,0
	ld	 r13,r17,lo16(___m_desc_type_node)
	or.u	 r19,r0,hi16(___i_desc_array_type)
	st	 r2,r19,lo16(___i_desc_array_type)
	ld	 r2,r13,32
	bsr.n	 _build_array_type
	or	 r3,r0,0
	or.u	 r18,r0,hi16(___m_desc_array_type)
	or.u	 r13,r0,hi16(@LC177)
	st	 r2,r18,lo16(___m_desc_array_type)
	or	 r2,r13,lo16(@LC177)
	bsr.n	 _get_identifier
	or.u	 r21,r0,hi16(_string_type_node)
	ld	 r4,r21,lo16(_string_type_node)
	or	 r3,r0,r2
	bsr.n	 _build_lang_field_decl
	or	 r2,r0,36
	or.u	 r13,r0,hi16(@LC178)
	st	 r2,r31,88
	or	 r2,r13,lo16(@LC178)
	bsr.n	 _get_identifier
	or.u	 r25,r0,hi16(_unsigned_type_node)
	ld	 r4,r25,lo16(_unsigned_type_node)
	or	 r3,r0,r2
	bsr.n	 _build_lang_field_decl
	or	 r2,r0,36
	or.u	 r13,r0,hi16(@LC179)
	st	 r2,r31,92
	bsr.n	 _get_identifier
	or	 r2,r13,lo16(@LC179)
	ld	 r4,r25,lo16(_unsigned_type_node)
	or	 r3,r0,r2
	bsr.n	 _build_lang_field_decl
	or	 r2,r0,36
	or.u	 r13,r0,hi16(@LC180)
	st	 r2,r31,96
	bsr.n	 _get_identifier
	or	 r2,r13,lo16(@LC180)
	ld	 r13,r23,lo16(___t_desc_type_node)
	or	 r3,r0,r2
	ld	 r4,r13,32
	bsr.n	 _build_lang_field_decl
	or	 r2,r0,36
	or.u	 r13,r0,hi16(@LC181)
	st	 r2,r31,100
	or	 r2,r13,lo16(@LC181)
	bsr.n	 _get_identifier
	or.u	 r24,r0,hi16(_integer_type_node)
	ld	 r4,r24,lo16(_integer_type_node)
	or	 r3,r0,r2
	bsr.n	 _build_lang_field_decl
	or	 r2,r0,36
	or.u	 r13,r0,hi16(@LC182)
	st	 r2,r31,104
	bsr.n	 _get_identifier
	or	 r2,r13,lo16(@LC182)
	ld	 r4,r24,lo16(_integer_type_node)
	or	 r3,r0,r2
	bsr.n	 _build_lang_field_decl
	or	 r2,r0,36
	or.u	 r13,r0,hi16(@LC183)
	st	 r2,r31,108
	bsr.n	 _get_identifier
	or	 r2,r13,lo16(@LC183)
	or	 r25,r0,r2
	bsr.n	 _build_pointer_type
	ld	 r2,r19,lo16(___i_desc_array_type)
	or	 r4,r0,r2
	or	 r2,r0,36
	bsr.n	 _build_lang_field_decl
	or	 r3,r0,r25
	or.u	 r13,r0,hi16(@LC184)
	st	 r2,r31,112
	bsr.n	 _get_identifier
	or	 r2,r13,lo16(@LC184)
	or	 r25,r0,r2
	bsr.n	 _build_pointer_type
	ld	 r2,r18,lo16(___m_desc_array_type)
	or	 r4,r0,r2
	or	 r2,r0,36
	bsr.n	 _build_lang_field_decl
	or	 r3,r0,r25
	or.u	 r13,r0,hi16(@LC185)
	st	 r2,r31,116
	bsr.n	 _get_identifier
	or	 r2,r13,lo16(@LC185)
	or	 r25,r0,r2
	bsr.n	 _build_pointer_type
	ld	 r2,r22,lo16(___t_desc_array_type)
	or	 r4,r0,r2
	or	 r2,r0,36
	bsr.n	 _build_lang_field_decl
	or	 r3,r0,r25
	or.u	 r13,r0,hi16(@LC186)
	st	 r2,r31,120
	bsr.n	 _get_identifier
	or	 r2,r13,lo16(@LC186)
	or	 r25,r0,r2
	bsr.n	 _build_pointer_type
	ld	 r2,r22,lo16(___t_desc_array_type)
	or	 r4,r0,r2
	or	 r2,r0,36
	bsr.n	 _build_lang_field_decl
	or	 r3,r0,r25
	or.u	 r13,r0,hi16(@LC187)
	st	 r2,r31,124
	bsr.n	 _get_identifier
	or	 r2,r13,lo16(@LC187)
	or	 r25,r0,r2
	bsr.n	 _build_pointer_type
	ld	 r2,r24,lo16(_integer_type_node)
	or	 r4,r0,r2
	or	 r2,r0,36
	bsr.n	 _build_lang_field_decl
	or	 r3,r0,r25
	st	 r2,r31,128
	ld	 r2,r23,lo16(___t_desc_type_node)
	ld	 r6,r24,lo16(_integer_type_node)
	addu	 r4,r31,88
	or.u	 r3,r0,hi16(@LC188)
	or	 r5,r0,10
	bsr.n	 _finish_builtin_type
	or	 r3,r3,lo16(@LC188)
	or.u	 r2,r0,hi16(@LC189)
	bsr.n	 _get_identifier
	or	 r2,r2,lo16(@LC189)
	ld	 r4,r21,lo16(_string_type_node)
	or	 r3,r0,r2
	bsr.n	 _build_lang_field_decl
	or	 r2,r0,36
	or.u	 r13,r0,hi16(@LC190)
	st	 r2,r31,88
	bsr.n	 _get_identifier
	or	 r2,r13,lo16(@LC190)
	ld	 r4,r24,lo16(_integer_type_node)
	or	 r3,r0,r2
	bsr.n	 _build_lang_field_decl
	or	 r2,r0,36
	or.u	 r13,r0,hi16(@LC191)
	st	 r2,r31,92
	bsr.n	 _get_identifier
	or	 r2,r13,lo16(@LC191)
	ld	 r13,r23,lo16(___t_desc_type_node)
	or	 r3,r0,r2
	ld	 r4,r13,32
	bsr.n	 _build_lang_field_decl
	or	 r2,r0,36
	st	 r2,r31,96
	ld	 r2,r20,lo16(___i_desc_type_node)
	ld	 r6,r24,lo16(_integer_type_node)
	addu	 r4,r31,88
	or.u	 r3,r0,hi16(@LC192)
	or	 r5,r0,2
	bsr.n	 _finish_builtin_type
	or	 r3,r3,lo16(@LC192)
	or.u	 r2,r0,hi16(@LC193)
	bsr.n	 _get_identifier
	or	 r2,r2,lo16(@LC193)
	ld	 r4,r21,lo16(_string_type_node)
	or	 r3,r0,r2
	bsr.n	 _build_lang_field_decl
	or	 r2,r0,36
	or.u	 r13,r0,hi16(@LC194)
	st	 r2,r31,88
	bsr.n	 _get_identifier
	or	 r2,r13,lo16(@LC194)
	ld	 r4,r24,lo16(_integer_type_node)
	or	 r3,r0,r2
	bsr.n	 _build_lang_field_decl
	or	 r2,r0,36
	or.u	 r13,r0,hi16(@LC195)
	st	 r2,r31,92
	bsr.n	 _get_identifier
	or	 r2,r13,lo16(@LC195)
	ld	 r13,r23,lo16(___t_desc_type_node)
	or	 r3,r0,r2
	ld	 r4,r13,32
	bsr.n	 _build_lang_field_decl
	or	 r2,r0,36
	or.u	 r13,r0,hi16(@LC196)
	st	 r2,r31,96
	bsr.n	 _get_identifier
	or	 r2,r13,lo16(@LC196)
	ld	 r13,r23,lo16(___t_desc_type_node)
	or	 r3,r0,r2
	ld	 r4,r13,32
	bsr.n	 _build_lang_field_decl
	or	 r2,r0,36
	or.u	 r13,r0,hi16(@LC197)
	st	 r2,r31,100
	bsr.n	 _get_identifier
	or	 r2,r13,lo16(@LC197)
	or.u	 r13,r0,hi16(_default_function_type)
	or	 r25,r0,r2
	bsr.n	 _build_pointer_type
	ld	 r2,r13,lo16(_default_function_type)
	or	 r4,r0,r2
	or	 r2,r0,36
	bsr.n	 _build_lang_field_decl
	or	 r3,r0,r25
	or.u	 r13,r0,hi16(@LC198)
	st	 r2,r31,104
	or	 r2,r13,lo16(@LC198)
	bsr.n	 _get_identifier
	or.u	 r25,r0,hi16(_short_integer_type_node)
	ld	 r4,r25,lo16(_short_integer_type_node)
	or	 r3,r0,r2
	bsr.n	 _build_lang_field_decl
	or	 r2,r0,36
	or.u	 r13,r0,hi16(@LC199)
	st	 r2,r31,108
	bsr.n	 _get_identifier
	or	 r2,r13,lo16(@LC199)
	ld	 r4,r25,lo16(_short_integer_type_node)
	or	 r3,r0,r2
	bsr.n	 _build_lang_field_decl
	or	 r2,r0,36
	or.u	 r13,r0,hi16(@LC200)
	st	 r2,r31,112
	bsr.n	 _get_identifier
	or	 r2,r13,lo16(@LC200)
	ld	 r13,r23,lo16(___t_desc_type_node)
	or	 r25,r0,r2
	ld	 r2,r13,32
	bsr.n	 _build_array_type
	or	 r3,r0,0
	bsr	 _build_pointer_type
	or	 r4,r0,r2
	or	 r2,r0,36
	bsr.n	 _build_lang_field_decl
	or	 r3,r0,r25
	st	 r2,r31,116
	ld	 r2,r17,lo16(___m_desc_type_node)
	ld	 r6,r24,lo16(_integer_type_node)
	addu	 r4,r31,88
	or.u	 r3,r0,hi16(@LC201)
	or	 r5,r0,7
	bsr.n	 _finish_builtin_type
	or	 r3,r3,lo16(@LC201)
@L3139:
	or.u	 r13,r0,hi16(_lang_name_cplusplus)
	or.u	 r12,r0,hi16(_flag_dossier)
	ld	 r11,r13,lo16(_lang_name_cplusplus)
	ld	 r12,r12,lo16(_flag_dossier)
	or.u	 r13,r0,hi16(_current_lang_name)
	bcnd.n	 eq0,r12,@L3140
	st	 r11,r13,lo16(_current_lang_name)
	or.u	 r13,r0,hi16(_builtin_type_tdescs_len)
	ld	 r25,r13,lo16(_builtin_type_tdescs_len)
	bcnd.n	 le0,r25,@L3140
	subu	 r13,r0,r25
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L3143
	or.u	 r24,r0,hi16(_builtin_type_tdescs_arr)
	cmp	 r13,r12,3
	bb1.n	 ge,r13,@L3162
	cmp	 r13,r12,2
	bb1	 ge,r13,@L3163
	subu	 r25,r25,1
	ld	 r13,r24,lo16(_builtin_type_tdescs_arr)
	ld	 r2,r13[r25]
	bsr.n	 _build_t_desc
	or	 r3,r0,0
	ld	 r13,r2,8
	ld	 r12,r2,16
	or.u	 r13,r13,0x1
	st	 r13,r2,8
	ld	 r13,r12,8
	or	 r13,r13,4096
	st	 r13,r12,8
@L3163:
	ld	 r13,r24,lo16(_builtin_type_tdescs_arr)
	subu	 r25,r25,1
	ld	 r2,r13[r25]
	bsr.n	 _build_t_desc
	or	 r3,r0,0
	ld	 r13,r2,8
	ld	 r12,r2,16
	or.u	 r13,r13,0x1
	st	 r13,r2,8
	ld	 r13,r12,8
	or	 r13,r13,4096
	st	 r13,r12,8
@L3162:
	ld	 r13,r24,lo16(_builtin_type_tdescs_arr)
	subu	 r25,r25,1
	ld	 r2,r13[r25]
	br	 @L3234
	align	 4
@L3143:
	ld	 r12,r24,lo16(_builtin_type_tdescs_arr)
	subu	 r13,r25,1
	ld	 r2,r12[r13]
	bsr.n	 _build_t_desc
	or	 r3,r0,0
	ld	 r13,r2,8
	ld	 r12,r2,16
	or.u	 r13,r13,0x1
	st	 r13,r2,8
	ld	 r13,r12,8
	or	 r13,r13,4096
	st	 r13,r12,8
	ld	 r12,r24,lo16(_builtin_type_tdescs_arr)
	subu	 r13,r25,2
	ld	 r2,r12[r13]
	bsr.n	 _build_t_desc
	or	 r3,r0,0
	ld	 r13,r2,8
	ld	 r12,r2,16
	or.u	 r13,r13,0x1
	st	 r13,r2,8
	ld	 r13,r12,8
	or	 r13,r13,4096
	st	 r13,r12,8
	ld	 r12,r24,lo16(_builtin_type_tdescs_arr)
	subu	 r13,r25,3
	ld	 r2,r12[r13]
	bsr.n	 _build_t_desc
	or	 r3,r0,0
	ld	 r13,r2,8
	ld	 r11,r2,16
	or.u	 r13,r13,0x1
	st	 r13,r2,8
	ld	 r13,r11,8
	ld	 r12,r24,lo16(_builtin_type_tdescs_arr)
	subu	 r25,r25,4
	or	 r13,r13,4096
	st	 r13,r11,8
	ld	 r2,r12[r25]
@L3234:
	bsr.n	 _build_t_desc
	or	 r3,r0,0
	ld	 r13,r2,8
	ld	 r12,r2,16
	or.u	 r13,r13,0x1
	st	 r13,r2,8
	ld	 r13,r12,8
	or	 r13,r13,4096
	bcnd.n	 gt0,r25,@L3143
	st	 r13,r12,8
@L3140:
	or.u	 r13,r0,hi16(_sizetype)
	or.u	 r20,r0,hi16(_void_list_node)
	ld	 r3,r13,lo16(_sizetype)
	or.u	 r22,r0,hi16(_ptr_type_node)
	ld	 r4,r20,lo16(_void_list_node)
	ld	 r25,r22,lo16(_ptr_type_node)
	or.u	 r13,r0,hi16(_ansi_opname+508)
	or	 r2,r0,0
	bsr.n	 _tree_cons
	ld	 r23,r13,lo16(_ansi_opname+508)
	or	 r3,r0,r2
	bsr.n	 _build_function_type
	or	 r2,r0,r25
	or	 r24,r0,r2
	or	 r2,r0,r23
	or	 r4,r0,0
	ld	 r3,r24,12
	or.u	 r23,r0,hi16(_push_overloaded_decl_1)
	ld	 r25,r2,16
	bsr.n	 _build_decl_overload
	or	 r23,r23,lo16(_push_overloaded_decl_1)
	ld	 r6,r2,16
	or	 r2,r0,r25
	or	 r3,r0,r24
	or	 r4,r0,0
	bsr.n	 _define_function
	or	 r5,r0,r23
	or.u	 r13,r0,hi16(_ansi_opname+492)
	ld	 r3,r22,lo16(_ptr_type_node)
	ld	 r4,r20,lo16(_void_list_node)
	or.u	 r21,r0,hi16(_void_type_node)
	ld	 r22,r13,lo16(_ansi_opname+492)
	or	 r2,r0,0
	bsr.n	 _tree_cons
	ld	 r25,r21,lo16(_void_type_node)
	or	 r3,r0,r2
	bsr.n	 _build_function_type
	or	 r2,r0,r25
	or	 r24,r0,r2
	or	 r2,r0,r22
	ld	 r3,r24,12
	or	 r4,r0,0
	bsr.n	 _build_decl_overload
	ld	 r25,r2,16
	ld	 r6,r2,16
	or	 r2,r0,r25
	or	 r3,r0,r24
	or	 r4,r0,0
	bsr.n	 _define_function
	or	 r5,r0,r23
	or.u	 r25,r0,hi16(@LC202)
	ld	 r2,r21,lo16(_void_type_node)
	ld	 r3,r20,lo16(_void_list_node)
	bsr.n	 _build_function_type
	or	 r25,r25,lo16(@LC202)
	or	 r3,r0,r2
	or	 r2,r0,r25
	or	 r4,r0,0
	or	 r5,r0,0
	bsr.n	 _define_function
	or	 r6,r0,0
	or.u	 r13,r0,hi16(_abort_fndecl)
	st	 r2,r13,lo16(_abort_fndecl)
	or.u	 r25,r0,hi16(@LC203)
	ld	 r2,r21,lo16(_void_type_node)
	or	 r3,r0,0
	bsr.n	 _build_function_type
	or	 r25,r25,lo16(@LC203)
	or	 r3,r0,r2
	or	 r2,r0,r25
	or	 r4,r0,0
	or	 r5,r0,0
	bsr.n	 _define_function
	or	 r6,r0,0
	or.u	 r13,r0,hi16(_unhandled_exception_fndecl)
	bsr.n	 _init_class_processing
	st	 r2,r13,lo16(_unhandled_exception_fndecl)
	bsr	 _init_init_processing
	bsr	 _init_search_processing
	or.u	 r13,r0,hi16(_flag_handle_exceptions)
	ld	 r12,r13,lo16(_flag_handle_exceptions)
	bcnd.n	 eq0,r12,@L3153
	cmp	 r13,r12,2
	bb1.n	 ne,r13,@L3154
	or.u	 r13,r0,hi16(_flag_this_is_variable)
	st	 r12,r13,lo16(_flag_this_is_variable)
@L3154:
	bsr	 _init_exception_processing
@L3153:
	or.u	 r13,r0,hi16(_flag_gc)
	ld	 r13,r13,lo16(_flag_gc)
	bcnd.n	 eq0,r13,@L3271
	or.u	 r13,r0,hi16(_flag_no_inline)
	bsr	 _init_gc_processing
	or.u	 r13,r0,hi16(_flag_no_inline)
@L3271:
	ld	 r13,r13,lo16(_flag_no_inline)
	bcnd.n	 eq0,r13,@L3156
	or.u	 r13,r0,hi16(_flag_inline_functions)
	st	 r0,r13,lo16(_flag_inline_functions)
	or.u	 r13,r0,hi16(_flag_default_inline)
	st	 r0,r13,lo16(_flag_default_inline)
@L3156:
	or.u	 r13,r0,hi16(_flag_cadillac)
	ld	 r13,r13,lo16(_flag_cadillac)
	bcnd	 eq0,r13,@L3157
	bsr	 _init_cadillac
@L3157:
	bsr	 _declare_function_name
@Lte52:
	ld	 r1,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	or.u	 r12,r0,hi16(_warn_return_type)
	ld.d	 r14,r31,32
	or	 r13,r0,1
	addu	 r31,r31,240
	jmp.n	 r1
	st	 r13,r12,lo16(_warn_return_type)
	def	 @L3272,@L2583-@L3273

	align	 8
	global	 _define_function
_define_function:
	subu	 r31,r31,64
	st.d	 r24,r31,40
	or	 r25,r0,r3
	st.d	 r22,r31,32
	or	 r22,r0,r4
	or	 r24,r0,r5
	st	 r1,r31,48
@Ltb53:
	bsr.n	 _get_identifier
	or	 r23,r0,r6
	or	 r3,r0,r2
	or	 r2,r0,29
	bsr.n	 _build_lang_decl
	or	 r4,r0,r25
	or	 r25,r0,r2
	ld	 r13,r25,28
	ld	 r12,r25,8
	or.u	 r13,r13,0x80
	st	 r13,r25,28
	or	 r12,r12,4096
	bcnd.n	 eq0,r24,@L3279
	st	 r12,r25,8
	jsr	 r24
@L3279:
	bcnd	 eq0,r23,@L3280
	bsr.n	 _get_identifier
	or	 r2,r0,r23
	st	 r2,r25,60
@L3280:
	bsr.n	 _make_function_rtl
	or	 r2,r0,r25
	bcnd	 eq0,r22,@L3281
	ld	 r13,r25,28
	st	 r22,r25,68
	or.u	 r13,r13,0x8
	st	 r13,r25,28
@L3281:
@Lte53:
	ld	 r1,r31,48
	or	 r2,r0,r25
	ld.d	 r24,r31,40
	ld.d	 r22,r31,32
	jmp.n	 r1
	addu	 r31,r31,64

data
	align	 8
@LC204:
	string	 "useless keyword or type name in declaration\000"
	align	 8
@LC205:
	string	 "anonymous union cannot have a function member\000"
	align	 8
@LC206:
	string	 "redeclaration of exception `%s'\000"
	align	 8
@LC207:
	string	 "multiple types in one declaration\000"
text
	align	 8
	global	 _shadow_tag
_shadow_tag:
	subu	 r31,r31,112
	st.d	 r20,r31,56
	st	 r2,r31,92
	ld	 r21,r31,92
	st	 r1,r31,80
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r14,r31,32
	or	 r14,r0,0
	st.d	 r18,r31,48
	or	 r19,r0,0
	st.d	 r16,r31,40
@Ltb54:
	or	 r23,r0,0
	bcnd.n	 eq0,r21,@L3471
	st	 r0,r31,100
	or.u	 r16,r0,hi16(_current_binding_level)
	or.u	 r18,r0,hi16(_class_binding_level)
	or.u	 r17,r0,hi16(@LC116)
	or.u	 r15,r0,hi16(_current_class_type)
@L3473:
	ld	 r10,r21,16
	ld.bu	 r20,r10,8
	subu	 r13,r20,21
	cmp	 r12,r20,10
	cmp	 r13,r13,1
	rot	 r11,r13,6
	or.c	 r13,r12,r11
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L3472
	ld	 r24,r10,48
	bcnd	 ne0,r24,@L3656
	ld	 r12,r16,lo16(_current_binding_level)
	bcnd	 eq0,r12,@L3478
@L3480:
	ld	 r2,r12,4
	bcnd	 eq0,r2,@L3479
@L3484:
	ld	 r13,r2,16
	cmp	 r13,r13,r10
	bb0	 ne,r13,@L3657
	ld	 r2,r0,r2
	bcnd	 ne0,r2,@L3484
@L3479:
	ld	 r12,r12,28
	bcnd	 ne0,r12,@L3480
@L3478:
	or	 r24,r0,0
@L3475:
	bcnd	 eq0,r24,@L3489
@L3656:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L3489
	ld	 r24,r24,32
@L3489:
	ld	 r13,r18,lo16(_class_binding_level)
	bcnd.n	 eq0,r13,@L3490
	or	 r22,r0,r13
@L3495:
	ld	 r12,r24,16
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1	 ne,r13,@L3496
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb1	 ne,r13,@L3496
	ld	 r25,r22,4
	bcnd	 eq0,r25,@L3503
@L3500:
	ld	 r2,r25,16
	ld	 r13,r2,48
	ld	 r13,r13,32
	cmp	 r13,r13,r24
	bb0	 ne,r13,@L3661
	ld	 r25,r0,r25
	bcnd	 eq0,r25,@L3503
	br	 @L3500
	align	 4
@L3496:
	ld	 r25,r22,4
	bcnd	 eq0,r25,@L3503
@L3507:
	ld	 r13,r25,12
	cmp	 r13,r13,r24
	bb1	 ne,r13,@L3506
	ld	 r13,r25,16
	ld.bu	 r12,r13,8
	cmp	 r13,r12,r20
	bb0.n	 ne,r13,@L3579
	cmp	 r13,r20,10
	bb0.n	 ne,r13,@L3510
	cmp	 r13,r12,129
	cmp	 r12,r12,132
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd	 eq0,r13,@L3579
@L3510:
	or.u	 r2,r0,hi16(@LC115)
	ld	 r3,r24,16
	br.n	 @L3681
	or	 r2,r2,lo16(@LC115)
	align	 4
@L3506:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L3507
@L3503:
	ld	 r13,r22,32
	bb0.n	 (31-23),r13,@L3539
	or	 r23,r0,0
	ld	 r11,r15,lo16(_current_class_type)
	bcnd.n	 eq0,r11,@L3494
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r22,28
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r12,r12,r13
	bb1	 ne,r12,@L3494
	or	 r23,r0,r11
	or.u	 r13,r0,hi16(_tree_code_type)
@L3683:
	ld.bu	 r12,r23,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r12,r0,r13
	cmp	 r13,r12,100
	bb1.n	 eq,r13,@L3494
	cmp	 r13,r12,116
	bb1	 ne,r13,@L3535
	ld	 r11,r24,16
	ld.b	 r13,r0,r11
	ld	 r12,r23,80
	cmp	 r13,r13,36
	ld	 r12,r12,48
	bb1	 ne,r13,@L3519
	ld.b	 r13,r11,1
	cmp	 r13,r13,95
	bb1	 ne,r13,@L3519
	bcnd	 eq0,r12,@L3494
@L3522:
	ld	 r13,r12,16
	ld	 r13,r13,48
	ld	 r13,r13,32
	cmp	 r13,r13,r24
	bb0	 ne,r13,@L3579
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L3522
	br	 @L3494
	align	 4
@L3519:
	bcnd	 eq0,r12,@L3494
@L3528:
	ld	 r13,r12,12
	cmp	 r13,r13,r24
	bb0	 ne,r13,@L3682
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L3528
	br	 @L3494
	align	 4
@L3535:
	bsr.n	 _my_friendly_abort
	or	 r2,r0,10
	bcnd.n	 ne0,r23,@L3683
	or.u	 r13,r0,hi16(_tree_code_type)
@L3494:
	ld	 r22,r22,28
	bcnd	 ne0,r22,@L3495
	or	 r23,r0,0
	br	 @L3539
	align	 4
@L3657:
	ld	 r24,r2,12
	br	 @L3475
	align	 4
@L3661:
	br.n	 @L3539
	or	 r23,r0,r2
	align	 4
@L3490:
	ld	 r22,r16,lo16(_current_binding_level)
	bcnd.n	 eq0,r22,@L3539
	or	 r23,r0,0
@L3544:
	ld	 r12,r24,16
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1	 ne,r13,@L3545
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb1	 ne,r13,@L3545
	ld	 r25,r22,4
	bcnd	 eq0,r25,@L3552
@L3549:
	ld	 r2,r25,16
	ld	 r13,r2,48
	ld	 r13,r13,32
	cmp	 r13,r13,r24
	bb1	 eq,r13,@L3661
	ld	 r25,r0,r25
	bcnd	 eq0,r25,@L3552
	br	 @L3549
	align	 4
@L3545:
	ld	 r25,r22,4
	bcnd	 eq0,r25,@L3552
@L3556:
	ld	 r13,r25,12
	cmp	 r13,r13,r24
	bb1	 ne,r13,@L3555
	ld	 r13,r25,16
	ld.bu	 r12,r13,8
	cmp	 r13,r12,r20
	bb0.n	 ne,r13,@L3579
	cmp	 r13,r20,10
	bb0.n	 ne,r13,@L3559
	cmp	 r13,r12,129
	cmp	 r12,r12,132
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd	 eq0,r13,@L3579
@L3559:
	or.u	 r2,r0,hi16(@LC115)
	ld	 r3,r24,16
	br.n	 @L3681
	or	 r2,r2,lo16(@LC115)
	align	 4
@L3555:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L3556
@L3552:
	ld	 r13,r22,32
	bb0.n	 (31-23),r13,@L3539
	or	 r23,r0,0
	ld	 r11,r15,lo16(_current_class_type)
	bcnd.n	 eq0,r11,@L3543
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r22,28
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r12,r12,r13
	bb1	 ne,r12,@L3543
	or	 r23,r0,r11
	or.u	 r13,r0,hi16(_tree_code_type)
@L3684:
	ld.bu	 r12,r23,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r12,r0,r13
	cmp	 r13,r12,100
	bb1.n	 eq,r13,@L3543
	cmp	 r13,r12,116
	bb1	 ne,r13,@L3584
	ld	 r11,r24,16
	ld.b	 r13,r0,r11
	ld	 r12,r23,80
	cmp	 r13,r13,36
	ld	 r12,r12,48
	bb1	 ne,r13,@L3568
	ld.b	 r13,r11,1
	cmp	 r13,r13,95
	bb1	 ne,r13,@L3568
	bcnd	 eq0,r12,@L3543
@L3571:
	ld	 r13,r12,16
	ld	 r13,r13,48
	ld	 r13,r13,32
	cmp	 r13,r13,r24
	bb0	 ne,r13,@L3579
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L3571
	br	 @L3543
	align	 4
@L3568:
	bcnd	 eq0,r12,@L3543
@L3577:
	ld	 r13,r12,12
	cmp	 r13,r13,r24
	bb1	 ne,r13,@L3578
@L3682:
	ld	 r13,r12,16
	ld.bu	 r13,r13,8
	cmp	 r13,r13,r20
	bb0	 ne,r13,@L3579
	ld	 r3,r24,16
	or	 r2,r17,lo16(@LC116)
@L3681:
	bsr	 _error
@L3579:
	ld	 r23,r25,16
	br	 @L3539
	align	 4
@L3578:
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L3577
	br	 @L3543
	align	 4
@L3584:
	bsr.n	 _my_friendly_abort
	or	 r2,r0,10
	bcnd.n	 ne0,r23,@L3684
	or.u	 r13,r0,hi16(_tree_code_type)
@L3543:
	ld	 r22,r22,28
	bcnd.n	 ne0,r22,@L3544
	or	 r23,r0,0
@L3539:
	bcnd.n	 ne0,r23,@L3588
	cmp	 r13,r24,0
	or.u	 r2,r0,hi16(_permanent_obstack)
	or	 r2,r2,lo16(_permanent_obstack)
	bsr.n	 _push_obstacks
	or	 r3,r0,r2
	subu	 r13,r20,21
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L3589
	or	 r2,r0,r20
	bsr.n	 _make_lang_type
	addu	 r1,r1,@L3692
@L3693:
	align	 4
@L3589:
	bsr.n	 _make_node
	or	 r2,r0,r20
@L3675:
	ld	 r13,r18,lo16(_class_binding_level)
	bcnd.n	 eq0,r13,@L3592
	or	 r23,r0,r2
	br.n	 @L3593
	or	 r21,r0,r13
	align	 4
@L3592:
	ld	 r21,r16,lo16(_current_binding_level)
	ld	 r13,r21,32
	bb0.n	 (31-23),r13,@L3685
	or.u	 r13,r0,hi16(_global_binding_level)
@L3596:
	ld	 r21,r21,28
	ld	 r13,r21,32
	bb1	 (31-23),r13,@L3596
@L3593:
	or.u	 r13,r0,hi16(_global_binding_level)
@L3685:
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r21,r13
	bb1.n	 ne,r13,@L3598
	or	 r2,r0,r24
	ld	 r4,r21,4
	or	 r3,r0,r23
	bsr.n	 _perm_tree_cons
	addu	 r1,r1,@L3694
@L3695:
	align	 4
@L3598:
	ld	 r4,r21,4
	bsr.n	 _saveable_tree_cons
	or	 r3,r0,r23
@L3676:
	bcnd.n	 eq0,r24,@L3600
	st	 r2,r21,4
	ld	 r13,r23,48
	bcnd	 ne0,r13,@L3601
	st	 r24,r23,48
@L3601:
	ld	 r13,r24,4
	cmp	 r13,r13,r23
	bb0	 ne,r13,@L3602
	ld.bu	 r13,r23,8
	cmp	 r13,r13,21
	bb1	 ne,r13,@L3603
	ld	 r13,r18,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L3603
	ld	 r13,r23,80
	ld	 r13,r0,r13
	bb1	 (31-28),r13,@L3602
@L3603:
	ld	 r11,r15,lo16(_current_class_type)
	bcnd	 eq0,r11,@L3605
	ld	 r13,r11,16
	bcnd	 eq0,r13,@L3604
@L3605:
	or.u	 r13,r0,hi16(_current_lang_name)
	ld	 r12,r13,lo16(_current_lang_name)
	or.u	 r13,r0,hi16(_lang_name_cplusplus)
	ld	 r13,r13,lo16(_lang_name_cplusplus)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L3606
	or	 r25,r0,0
	bcnd.n	 eq0,r11,@L3607
	or	 r3,r0,0
	ld	 r3,r11,48
@L3607:
	bsr.n	 _lookup_nested_type
	or	 r2,r0,r23
	or	 r25,r0,r2
@L3606:
	bcnd.n	 ne0,r25,@L3610
	or	 r2,r0,32
	or	 r3,r0,r24
	bsr.n	 _build_decl
	or	 r4,r0,r23
	or	 r25,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,1
	bsr.n	 _build_overload_name
	or	 r4,r0,1
	bsr	 _get_identifier
	ld	 r12,r16,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	st	 r2,r25,60
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L3612
	st	 r0,r25,16
	ld	 r3,r24,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r16,lo16(_current_binding_level)
	br.n	 @L3686
	st	 r2,r13,16
	align	 4
@L3612:
	ld	 r13,r18,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L3613
	ld	 r3,r24,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r18,lo16(_class_binding_level)
	st	 r2,r13,16
@L3613:
@L3686:
	br.n	 @L3615
	st	 r23,r24,4
	align	 4
@L3610:
	ld	 r25,r25,48
@L3615:
	ld	 r12,r24,16
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1	 ne,r13,@L3617
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb0	 ne,r13,@L3687
@L3617:
	ld	 r13,r23,48
	bcnd	 eq0,r13,@L3621
	ld.bu	 r13,r13,8
	cmp	 r13,r13,32
	bb1.n	 ne,r13,@L3618
	or	 r2,r0,r24
	bsr.n	 _lookup_name
	or	 r3,r0,1
	ld	 r13,r23,48
	cmp	 r2,r2,r13
	bb0	 ne,r2,@L3621
@L3618:
	ld	 r13,r18,lo16(_class_binding_level)
	bcnd.n	 ne0,r13,@L3678
	or	 r2,r0,r25
	bsr.n	 _pushdecl
	addu	 r1,r1,@L3696
@L3697:
	align	 4
@L3604:
	or	 r2,r0,32
	or	 r3,r0,r24
	bsr.n	 _build_lang_field_decl
	or	 r4,r0,r23
	ld	 r12,r16,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L3623
	or	 r25,r0,r2
	ld	 r3,r24,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r16,lo16(_current_binding_level)
	br.n	 @L3624
	st	 r2,r13,16
	align	 4
@L3623:
	ld	 r13,r18,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L3624
	ld	 r3,r24,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r18,lo16(_class_binding_level)
	st	 r2,r13,16
@L3624:
	or	 r2,r0,r25
	st	 r23,r24,4
@L3678:
	bsr	 _pushdecl_class_level
@L3679:
	or	 r25,r0,r2
@L3621:
	ld	 r12,r24,16
@L3687:
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1	 ne,r13,@L3626
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb1	 ne,r13,@L3626
	ld	 r13,r25,28
	or.u	 r13,r13,0x2
	st	 r13,r25,28
@L3626:
	ld	 r11,r15,lo16(_current_class_type)
	bcnd.n	 ne0,r11,@L3629
	st	 r25,r23,48
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r13,r13,lo16(_current_function_decl)
	bcnd	 eq0,r13,@L3628
@L3629:
	or.u	 r13,r0,hi16(_current_lang_name)
	ld	 r12,r13,lo16(_current_lang_name)
	or.u	 r13,r0,hi16(_lang_name_cplusplus)
	ld	 r13,r13,lo16(_lang_name_cplusplus)
	cmp	 r12,r12,r13
	bb0.n	 ne,r12,@L3627
	or.u	 r22,r0,hi16(_current_function_decl)
@L3628:
	br.n	 @L3602
	st	 r24,r25,40
	align	 4
@L3627:
	ld	 r13,r22,lo16(_current_function_decl)
	bcnd.n	 eq0,r13,@L3631
	or	 r2,r0,r25
	or	 r4,r0,r24
	ld	 r3,r13,60
	bsr.n	 _set_nested_typename
	or	 r5,r0,r23
	ld	 r13,r22,lo16(_current_function_decl)
	br.n	 @L3602
	st	 r13,r25,36
	align	 4
@L3631:
	ld	 r13,r11,16
	bcnd	 ne0,r13,@L3602
	ld	 r13,r11,48
	or	 r2,r0,r25
	or	 r4,r0,r24
	ld	 r3,r13,40
	bsr.n	 _set_nested_typename
	or	 r5,r0,r23
	ld	 r13,r15,lo16(_current_class_type)
	ld	 r12,r25,80
	st	 r13,r25,36
	st	 r13,r12,8
@L3602:
	ld	 r13,r21,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb1	 ne,r13,@L3600
	ld	 r13,r23,8
	ld	 r12,r23,48
	ld	 r11,r15,lo16(_current_class_type)
	or	 r13,r13,512
	st	 r13,r23,8
	st	 r12,r24,28
	ld	 r13,r11,16
	bcnd	 ne0,r13,@L3600
	ld	 r12,r11,80
	ld	 r13,r21,4
	st	 r13,r12,48
@L3600:
	ld	 r12,r23,48
	ld.bu	 r13,r12,8
	cmp	 r13,r13,32
	bb1.n	 ne,r13,@L3636
	or	 r2,r0,32
	br.n	 @L3591
	st	 r12,r0,r23
	align	 4
@L3636:
	or	 r3,r0,0
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr	 _pushdecl
	st	 r2,r0,r23
@L3591:
	bsr.n	 _pop_obstacks
	or	 r19,r0,r20
	br.n	 @L3688
	cmp	 r12,r19,22
	align	 4
@L3588:
	cmp	 r12,r20,10
	or.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L3638
	or	 r19,r0,r20
@L3638:
	bcnd	 eq0,r19,@L3640
	addu	 r14,r14,1
	br	 @L3472
	align	 4
@L3640:
	ld	 r9,r31,100
	bcnd.n	 ne0,r9,@L3689
	or	 r9,r0,1
	or.u	 r2,r0,hi16(@LC204)
	bsr.n	 _warning
	or	 r2,r2,lo16(@LC204)
	or	 r9,r0,1
@L3689:
	st	 r9,r31,100
@L3472:
	ld	 r21,r0,r21
	bcnd	 ne0,r21,@L3473
@L3471:
	cmp	 r12,r19,22
@L3688:
	cmp	 r13,r23,0
	and.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L3644
	ld	 r12,r23,48
	ld.bu	 r13,r12,8
	cmp	 r13,r13,1
	bb1	 ne,r13,@L3690
	ld	 r12,r12,16
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1	 ne,r13,@L3646
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb0	 ne,r13,@L3645
@L3646:
	ld	 r12,r23,48
@L3690:
	ld.bu	 r13,r12,8
	cmp	 r13,r13,32
	bb1.n	 ne,r13,@L3691
	cmp	 r13,r19,21
	ld	 r13,r12,32
	ld	 r12,r13,16
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1.n	 ne,r13,@L3691
	cmp	 r13,r19,21
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb1.n	 ne,r13,@L3691
	cmp	 r13,r19,21
@L3645:
	ld	 r13,r23,12
	bcnd.n	 eq0,r13,@L3647
	or	 r2,r0,0
	ld	 r3,r31,92
	or	 r4,r0,0
	or	 r5,r0,0
	bsr.n	 _grokdeclarator
	or	 r6,r0,0
	bsr.n	 _finish_anon_union
	addu	 r1,r1,@L3698
@L3699:
	align	 4
@L3647:
	or.u	 r2,r0,hi16(@LC205)
	or	 r2,r2,lo16(@LC205)
	bsr.n	 _error
	addu	 r1,r1,@L3700
@L3701:
	align	 4
@L3644:
	cmp	 r13,r19,21
@L3691:
	cmp	 r12,r14,1
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L3650
	ld	 r13,r23,80
	bcnd	 eq0,r13,@L3650
	ld	 r13,r0,r13
	bb0	 (31-28),r13,@L3650
	ld	 r13,r23,16
	bcnd.n	 eq0,r13,@L3651
	or.u	 r3,r0,hi16(@LC206)
	or	 r2,r0,r23
	or	 r3,r3,lo16(@LC206)
	bsr.n	 _error_with_aggr_type
	addu	 r1,r1,@L3702
@L3703:
	align	 4
@L3651:
	or.u	 r2,r0,hi16(_permanent_obstack)
	or	 r2,r2,lo16(_permanent_obstack)
	bsr.n	 _push_obstacks
	or	 r3,r0,r2
	or	 r2,r0,r23
	bsr.n	 _pushclass
	or	 r3,r0,0
	or	 r2,r0,r23
	bsr.n	 _finish_exception
	or	 r3,r0,0
	ld	 r3,r23,48
	ld.bu	 r13,r3,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L3653
	ld	 r3,r3,32
@L3653:
	or	 r2,r0,33
	bsr.n	 _build_lang_field_decl
	or	 r4,r0,r23
	or.u	 r13,r0,hi16(_current_class_name)
	or	 r3,r0,r2
	bsr.n	 _finish_exception_decl
	ld	 r2,r13,lo16(_current_class_name)
	bsr	 _end_exception_decls
	bsr.n	 _pop_obstacks
	addu	 r1,r1,@L3704
@L3705:
	align	 4
@L3650:
	ld	 r9,r31,100
	cmp	 r12,r14,1
	subu	 r13,r9,1
	extu	 r12,r12,1<gt>
	subu	 r13,r0,r13
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L3649
	or.u	 r2,r0,hi16(@LC207)
	bsr.n	 _warning
	or	 r2,r2,lo16(@LC207)
@L3649:
@Lte54:
	ld	 r1,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	ld.d	 r14,r31,32
	jmp.n	 r1
	addu	 r31,r31,112
	def	 @L3704,@L3649-@L3705
	def	 @L3702,@L3649-@L3703
	def	 @L3700,@L3649-@L3701
	def	 @L3698,@L3649-@L3699
	def	 @L3696,@L3679-@L3697
	def	 @L3694,@L3676-@L3695
	def	 @L3692,@L3675-@L3693

	align	 8
	global	 _groktypename
_groktypename:
	subu	 r31,r31,48
	or	 r12,r0,r2
	st	 r1,r31,36
@Ltb55:
	ld.bu	 r13,r12,8
	cmp	 r13,r13,3
	bb1.n	 ne,r13,@L3709
	or	 r2,r0,r12
	ld	 r2,r12,16
	ld	 r3,r12,12
	or	 r4,r0,5
	or	 r5,r0,0
	or	 r6,r0,0
	bsr.n	 _grokdeclarator
	addu	 r1,r1,@L3711
@L3712:
	align	 4
@L3709:
@L3710:
@Lte55:
	ld	 r1,r31,36
	jmp.n	 r1
	addu	 r31,r31,48
	def	 @L3711,@L3710-@L3712

	global	 _debug_temp_inits
data
	align	 4
_debug_temp_inits:
	word	 1
	align	 8
@LC208:
	string	 "extern\000"
	align	 8
@LC209:
	string	 "typedef `%s' is initialized\000"
	align	 8
@LC210:
	string	 "function `%s' is initialized like a variable\000"
	align	 8
@LC211:
	string	 "variable `%s' has initializer but incomplete type"
	string	 "\000"
	align	 8
@LC212:
	string	 "elements of array `%s' have incomplete type\000"
	align	 8
@LC213:
	string	 "aggregate `%s' has incomplete type and cannot be "
	string	 "initialized\000"
	align	 8
@LC214:
	string	 "declaration of `%s' has `extern' and is initializ"
	string	 "ed\000"
	align	 8
@LC215:
	string	 "non-function templates not yet supported\000"
text
	align	 8
	global	 _start_decl
_start_decl:
	or.u	 r13,r0,hi16(_have_extern_spec)
	ld	 r13,r13,lo16(_have_extern_spec)
	subu	 r31,r31,128
	st.d	 r24,r31,56
	or	 r24,r0,r2
	st.d	 r20,r31,40
	or	 r21,r0,r3
	st.d	 r22,r31,48
	or	 r22,r0,r4
	st	 r1,r31,64
	or	 r23,r0,r5
	st	 r19,r31,36
@Ltb56:
	bcnd.n	 eq0,r13,@L3877
	or	 r19,r0,r22
	or.u	 r25,r0,hi16(_used_extern_spec)
	ld	 r13,r25,lo16(_used_extern_spec)
	bcnd.n	 ne0,r13,@L3877
	or.u	 r2,r0,hi16(@LC208)
	bsr.n	 _get_identifier
	or	 r2,r2,lo16(@LC208)
	or	 r3,r0,r2
	or	 r2,r0,0
	bsr.n	 _decl_tree_cons
	or	 r4,r0,r21
	or	 r13,r0,1
	st	 r13,r25,lo16(_used_extern_spec)
	or	 r21,r0,r2
@L3877:
	or	 r2,r0,r24
	or	 r3,r0,r21
	or	 r4,r0,0
	or	 r5,r0,r22
	bsr.n	 _grokdeclarator
	or	 r6,r0,r23
	or	 r24,r0,r2
	bcnd.n	 eq0,r24,@L4049
	or.u	 r13,r0,hi16(_void_type_node)
	ld	 r13,r13,lo16(_void_type_node)
	cmp	 r13,r24,r13
	bb0	 ne,r13,@L4049
	ld	 r12,r24,8
	ld	 r20,r24,4
	bb0	 (31-18),r12,@L3880
	ld	 r13,r20,24
	bb0	 (31-21),r13,@L3880
	bb1.n	 (31-10),r12,@L3880
	or.u	 r25,r0,0x20
	or.u	 r2,r0,hi16(_permanent_obstack)
	or	 r2,r2,lo16(_permanent_obstack)
	bsr.n	 _push_obstacks
	or	 r3,r0,r2
	bsr.n	 _copy_node
	or	 r2,r0,r24
	ld.bu	 r13,r20,8
	cmp	 r13,r13,18
	bb1.n	 ne,r13,@L3881
	or	 r24,r0,r2
	ld	 r3,r20,12
	bcnd	 eq0,r3,@L3881
	ld	 r13,r3,8
	and	 r13,r13,r25
	bcnd	 ne0,r13,@L3881
	bsr.n	 _copy_to_permanent
	ld	 r2,r3,56
	bsr	 _build_index_type
	or	 r3,r0,r2
	bsr.n	 _build_cplus_array_type
	ld	 r2,r20,4
	or	 r20,r0,r2
	st	 r20,r24,4
@L3881:
	bsr	 _pop_obstacks
@L3880:
	ld.bu	 r13,r20,8
	cmp	 r13,r13,21
	bb1	 ne,r13,@L3883
	ld	 r13,r20,80
	ld	 r13,r0,r13
	bb1.n	 (31-28),r13,@L4039
	or	 r2,r0,r24
@L3883:
	bsr	 _push_obstacks_nochange
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L3884
	ld	 r13,r24,28
	bb0	 (31-13),r13,@L3884
	ld	 r13,r24,80
	ld	 r23,r13,8
	br.n	 @L4056
	or.u	 r13,r0,hi16(_processing_template_decl)
	align	 4
@L3884:
	ld	 r23,r24,36
	or.u	 r13,r0,hi16(_processing_template_decl)
@L4056:
	ld	 r13,r13,lo16(_processing_template_decl)
	bcnd	 eq0,r13,@L3886
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1.n	 ne,r13,@L3887
	or.u	 r13,r0,hi16(_last_function_parms)
	bsr.n	 _copy_to_permanent
	ld	 r2,r13,lo16(_last_function_parms)
	ld	 r3,r24,4
	ld.bu	 r13,r3,8
	cmp	 r13,r13,16
	bb1.n	 ne,r13,@L3888
	or	 r25,r0,r2
	ld	 r3,r3,56
	ld.bu	 r13,r3,8
	cmp	 r13,r13,132
	bb0	 ne,r13,@L3888
	bsr.n	 _build_pointer_type
	or	 r2,r0,r3
	or.u	 r13,r0,hi16(_flag_this_is_variable)
	ld	 r3,r13,lo16(_flag_this_is_variable)
	cmp	 r3,r3,0
	or	 r4,r0,0
	bsr.n	 _build_type_variant
	extu	 r3,r3,1<le>
	or.u	 r13,r0,hi16(_this_identifier)
	or	 r3,r0,r2
	ld	 r4,r13,lo16(_this_identifier)
	bsr.n	 _build
	or	 r2,r0,34
	or	 r3,r0,r2
	st	 r25,r0,r3
	or	 r25,r0,r3
@L3888:
	st	 r25,r24,40
@L3887:
	ld	 r3,r24,32
	ld	 r4,r24,4
	bsr.n	 _build_lang_decl
	or	 r2,r0,129
	ld	 r13,r24,8
	and	 r13,r13,0xefff
	st	 r13,r24,8
	ld	 r12,r2,8
	and	 r13,r12,0xefff
	st	 r13,r2,8
	ld	 r13,r24,8
	and	 r12,r12,0xcfff
	mask	 r13,r13,8192
	or	 r12,r12,r13
	st	 r12,r2,8
	ld	 r13,r24,28
	bb0.n	 (31-8),r13,@L3890
	or	 r12,r0,0
	bcnd	 eq0,r23,@L3891
	bb0	 (31-19),r13,@L3890
@L3891:
	or	 r12,r0,1
@L3890:
	ld	 r13,r2,28
	and.u	 r13,r13,0xff7f
	mak	 r12,r12,0<23>
	or	 r13,r13,r12
	st	 r13,r2,28
	ld	 r13,r2,28
	st	 r24,r2,44
	or	 r24,r0,r2
	or	 r13,r13,1024
	st	 r13,r24,28
@L3886:
	bcnd	 eq0,r23,@L3892
	ld	 r13,r23,16
	bcnd	 eq0,r13,@L3892
	ld	 r13,r24,28
	bb1	 (31-19),r13,@L3893
	and.u	 r13,r13,0xff7f
	st	 r13,r24,28
@L3893:
	ld	 r13,r24,80
	bcnd	 eq0,r13,@L3894
	ld	 r13,r24,28
	and	 r13,r13,0xf7ff
	st	 r13,r24,28
@L3894:
	or	 r2,r0,r23
	bsr.n	 _pushclass
	or	 r3,r0,2
@L3892:
	ld	 r13,r20,24
	bb0.n	 (31-21),r13,@L3895
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r12,r13,lo16(_current_binding_level)
	ld	 r13,r12,32
	bb1.n	 (31-24),r13,@L3895
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb1.n	 ne,r13,@L4057
	or.u	 r12,r0,hi16(_free_binding_level)
	or.u	 r13,r0,hi16(_named_labels)
	ld	 r2,r13,lo16(_named_labels)
	cmp	 r2,r2,0
	or	 r3,r0,134
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	or.u	 r12,r0,hi16(_free_binding_level)
@L4057:
	ld	 r2,r12,lo16(_free_binding_level)
	bcnd.n	 eq0,r2,@L3899
	or	 r25,r0,r2
	ld	 r13,r25,28
	br.n	 @L3900
	st	 r13,r12,lo16(_free_binding_level)
	align	 4
@L3899:
	bsr.n	 _xmalloc
	or	 r2,r0,36
	or	 r25,r0,r2
@L3900:
	or.u	 r3,r0,hi16(_clear_binding_level)
	subu	 r2,r25,60
	ld	 r4,r3,lo16(_clear_binding_level)
	or	 r3,r3,lo16(_clear_binding_level)
	or.u	 r13,r0,hi16(_keep_next_level_flag)
	subu	 r3,r3,60
	bsr.n	 ___movstrSI96x36
	ld	 r23,r13,lo16(_keep_next_level_flag)
	or.u	 r12,r0,hi16(_class_binding_level)
	ld	 r13,r12,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L3902
	st	 r13,r25,28
	br.n	 @L3903
	st	 r0,r12,lo16(_class_binding_level)
	align	 4
@L3902:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	st	 r13,r25,28
@L3903:
	ld	 r13,r25,32
	mak	 r12,r23,3<9>
	or	 r2,r0,r25
	or	 r13,r13,416
	or.u	 r25,r0,hi16(_current_binding_level)
	and	 r13,r13,0xf1ff
	st	 r2,r25,lo16(_current_binding_level)
	or	 r13,r13,r12
	bsr.n	 _GNU_xref_start_scope
	st	 r13,r2,32
	ld	 r11,r25,lo16(_current_binding_level)
	ld	 r13,r11,32
	or.u	 r12,r0,hi16(_keep_next_level_flag)
	and	 r13,r13,0xf1ff
	st	 r0,r12,lo16(_keep_next_level_flag)
	or	 r13,r13,1024
	bsr.n	 _clear_last_expr
	st	 r13,r11,32
	bsr.n	 _expand_start_bindings
	or	 r2,r0,0
@L3895:
	bcnd	 eq0,r22,@L4040
	ld.bu	 r12,r24,8
	cmp	 r13,r12,29
	bb0.n	 ne,r13,@L3909
	cmp	 r13,r12,32
	bb1.n	 ne,r13,@L3910
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	bcnd	 ne0,r13,@L3908
	bsr.n	 _list_length
	or	 r2,r0,r21
	cmp	 r2,r2,1
	bb0	 gt,r2,@L3904
@L3908:
	ld	 r13,r24,32
	or.u	 r2,r0,hi16(@LC209)
	ld	 r3,r13,16
	br.n	 @L4050
	or	 r2,r2,lo16(@LC209)
	align	 4
@L3909:
	ld	 r13,r24,32
	or.u	 r2,r0,hi16(@LC210)
	ld	 r3,r13,16
	br.n	 @L4050
	or	 r2,r2,lo16(@LC210)
	align	 4
@L3910:
	ld	 r13,r20,16
	bcnd	 ne0,r13,@L3904
	ld.bu	 r13,r20,8
	cmp	 r13,r13,18
	bb0	 ne,r13,@L3913
	ld	 r13,r24,32
	or.u	 r2,r0,hi16(@LC211)
	ld	 r3,r13,16
	br.n	 @L4050
	or	 r2,r2,lo16(@LC211)
	align	 4
@L3913:
	ld	 r13,r20,4
	ld	 r13,r13,16
	bcnd	 ne0,r13,@L3904
	ld	 r13,r24,32
	or.u	 r2,r0,hi16(@LC212)
	ld	 r3,r13,16
	or	 r2,r2,lo16(@LC212)
@L4050:
	bsr.n	 _error
	or	 r22,r0,0
@L3904:
	bcnd.n	 ne0,r22,@L4058
	or.u	 r13,r0,hi16(_current_binding_level)
@L4040:
	ld.bu	 r13,r24,8
	cmp	 r12,r13,32
	cmp	 r13,r13,129
	or	 r12,r12,r13
	extu	 r13,r12,1<eq>
	xor	 r12,r13,1
	bcnd	 eq0,r12,@L3917
	ld	 r12,r20,24
	bb0	 (31-22),r12,@L3917
	ld	 r13,r24,28
	bb1	 (31-8),r13,@L3917
	ld	 r13,r20,16
	bcnd	 ne0,r13,@L3918
	ld	 r13,r24,32
	or.u	 r2,r0,hi16(@LC213)
	ld	 r3,r13,16
	bsr.n	 _error
	or	 r2,r2,lo16(@LC213)
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	st	 r13,r24,4
	br.n	 @L3917
	or	 r20,r0,r13
	align	 4
@L3918:
	extu	 r22,r12,1<11>
@L3917:
	bcnd.n	 eq0,r22,@L3920
	or.u	 r13,r0,hi16(_current_binding_level)
@L4058:
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L3921
	ld	 r13,r24,28
	bb0	 (31-8),r13,@L3921
	ld	 r13,r24,32
	or.u	 r2,r0,hi16(@LC214)
	ld	 r3,r13,16
	bsr.n	 _warning
	or	 r2,r2,lo16(@LC214)
@L3921:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r11,r24,28
	or.u	 r10,r0,hi16(_global_binding_level)
	ld	 r12,r13,lo16(_current_binding_level)
	ld	 r13,r10,lo16(_global_binding_level)
	and.u	 r11,r11,0xff7f
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L3922
	st	 r11,r24,28
	ld	 r13,r24,8
	or	 r13,r13,8192
	st	 r13,r24,8
@L3922:
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	st	 r13,r24,48
@L3920:
	ld.bu	 r12,r24,8
	cmp	 r13,r12,34
	bb0	 ne,r13,@L3925
	ld	 r13,r24,36
	bcnd.n	 ne0,r13,@L3928
	or	 r23,r0,r24
@L3925:
	cmp	 r13,r12,129
	bb1.n	 ne,r13,@L3926
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L3928
	or	 r23,r0,r24
@L3926:
	ld.bu	 r13,r20,8
	cmp	 r13,r13,24
	bb0.n	 ne,r13,@L3928
	or	 r23,r0,r24
	bsr.n	 _pushdecl
	or	 r2,r0,r24
	or	 r23,r0,r2
	ld.bu	 r13,r23,8
	cmp	 r13,r13,3
	bb1.n	 ne,r13,@L3928
	or	 r2,r0,r24
	bsr.n	 _value_member
	or	 r3,r0,r23
	bcnd	 eq0,r2,@L3930
	ld	 r23,r2,16
	br	 @L3928
	align	 4
@L3930:
	bcnd	 eq0,r23,@L4042
@L3951:
	ld	 r9,r23,16
	st	 r24,r31,72
	st	 r9,r31,76
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L3937
	ld.bu	 r13,r9,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L3937
	ld	 r13,r24,4
	ld	 r12,r9,4
	ld	 r11,r13,12
	ld	 r10,r12,12
	st	 r13,r31,104
	st	 r12,r31,112
	st	 r11,r31,108
	st	 r10,r31,116
	ld.bu	 r13,r13,8
	cmp	 r13,r13,16
	bb1	 ne,r13,@L3938
	ld	 r13,r9,80
	ld	 r13,r0,r13
	bb0.n	 (31-13),r13,@L3938
	addu	 r2,r31,104
	addu	 r3,r31,72
	br.n	 @L4051
	addu	 r4,r31,108
	align	 4
@L3938:
	ld	 r13,r31,112
	ld.bu	 r13,r13,8
	cmp	 r13,r13,16
	bb1	 ne,r13,@L3939
	ld	 r13,r31,72
	ld	 r13,r13,80
	ld	 r13,r0,r13
	bb0.n	 (31-13),r13,@L3939
	addu	 r2,r31,112
	addu	 r3,r31,76
	addu	 r4,r31,116
@L4051:
	bsr	 _revert_static_member_fn
@L3939:
	ld	 r11,r31,104
	ld	 r10,r31,112
	ld.bu	 r12,r11,8
	ld.bu	 r13,r10,8
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L3941
	cmp	 r13,r12,14
	bb1.n	 ne,r13,@L3942
	or.u	 r3,r0,hi16(@LC49)
	ld	 r2,r31,72
	br.n	 @L4052
	or	 r3,r3,lo16(@LC49)
	align	 4
@L3942:
	or.u	 r3,r0,hi16(@LC50)
	ld	 r2,r31,72
	or	 r3,r3,lo16(@LC50)
@L4052:
	bsr	 _compiler_error_with_decl
	br.n	 @L3936
	or	 r2,r0,0
	align	 4
@L3941:
	ld	 r13,r11,4
	ld	 r12,r10,4
	ld	 r2,r13,64
	ld	 r3,r12,64
	bsr.n	 _comptypes
	or	 r4,r0,1
	bcnd.n	 eq0,r2,@L3944
	or	 r4,r0,1
	ld	 r2,r31,108
	ld	 r3,r31,116
	bsr.n	 _compparms
	addu	 r1,r1,@L4064
@L4065:
	align	 4
@L3944:
	br.n	 @L3936
	or	 r2,r0,0
	align	 4
@L3937:
	ld	 r13,r31,72
	or.u	 r12,r0,hi16(_error_mark_node)
	ld	 r2,r13,4
	ld	 r13,r12,lo16(_error_mark_node)
	cmp	 r13,r2,r13
	bb1	 ne,r13,@L3947
	ld	 r13,r31,76
	ld	 r13,r13,4
	cmp	 r13,r13,r2
	br.n	 @L3936
	extu	 r2,r13,1<eq>
	align	 4
@L3947:
	ld	 r13,r31,76
	ld	 r3,r13,4
	bcnd.n	 ne0,r3,@L3949
	cmp	 r13,r2,0
	br.n	 @L3936
	extu	 r2,r13,1<eq>
	align	 4
@L3949:
	bsr.n	 _comptypes
	or	 r4,r0,1
@L3936:
	bcnd	 ne0,r2,@L3933
	ld	 r23,r0,r23
	bcnd	 ne0,r23,@L3951
@L3933:
	bcnd	 ne0,r23,@L3952
@L4042:
	br.n	 @L3928
	or	 r23,r0,r24
	align	 4
@L3952:
	ld	 r23,r23,16
@L3928:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L3954
	ld	 r13,r24,28
	bb0	 (31-21),r13,@L3954
	ld	 r21,r23,32
	ld	 r13,r23,28
	ld	 r24,r21,20
	or	 r22,r0,r23
	or	 r13,r13,1024
	bcnd.n	 eq0,r24,@L3956
	st	 r13,r23,28
	ld.bu	 r12,r24,8
	cmp	 r13,r12,3
	bb0	 ne,r13,@L3957
	ld	 r13,r23,80
	ld.bu	 r13,r0,r13
	bcnd.n	 ne0,r13,@L4059
	or.u	 r13,r0,hi16(_flag_traditional)
	cmp	 r13,r12,29
	bb1	 ne,r13,@L3959
	ld	 r13,r24,80
	ld.bu	 r13,r0,r13
	bcnd.n	 ne0,r13,@L4059
	or.u	 r13,r0,hi16(_flag_traditional)
	or.u	 r3,r0,hi16(@LC90)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC90)
	or.u	 r3,r0,hi16(@LC91)
	or	 r2,r0,r24
	or	 r3,r3,lo16(@LC91)
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L4066
@L4067:
	align	 4
@L3959:
	bsr.n	 _my_friendly_abort
	or	 r2,r0,9
@L3958:
	or.u	 r13,r0,hi16(_flag_traditional)
@L4059:
	ld	 r13,r13,lo16(_flag_traditional)
	bcnd	 ne0,r13,@L3962
	ld	 r13,r24,8
	bb0.n	 (31-10),r13,@L3962
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L3962
	or.u	 r25,r0,hi16(_overloads_to_forget)
	or	 r2,r0,r21
	ld	 r4,r25,lo16(_overloads_to_forget)
	bsr.n	 _tree_cons
	or	 r3,r0,r24
	st	 r2,r25,lo16(_overloads_to_forget)
@L3962:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,106
	bb1	 ne,r13,@L3964
	ld	 r24,r24,16
@L3964:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1.n	 ne,r13,@L4060
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r24,80
	ld	 r12,r22,80
	ld.bu	 r13,r0,r13
	ld.bu	 r12,r0,r12
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L3965
	ld	 r2,r24,4
	ld	 r3,r22,4
	bsr.n	 _comptypes
	or	 r4,r0,1
	bcnd.n	 eq0,r2,@L3965
	or.u	 r13,r0,hi16(_current_lang_stack)
	or.u	 r12,r0,hi16(_current_lang_base)
	ld	 r13,r13,lo16(_current_lang_stack)
	ld	 r12,r12,lo16(_current_lang_base)
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L4053
	or.u	 r3,r0,hi16(@LC92)
	or	 r2,r0,r22
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC92)
	or.u	 r3,r0,hi16(@LC93)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC93)
@L3965:
	or.u	 r13,r0,hi16(_pedantic)
@L4060:
	ld	 r13,r13,lo16(_pedantic)
	bcnd	 eq0,r13,@L3968
	ld.bu	 r13,r24,8
	cmp	 r13,r13,33
	bb1.n	 ne,r13,@L3968
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13,132
	ld.b	 r2,r0,r13
	cmp	 r2,r2,100
	or	 r3,r0,143
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	or.u	 r3,r0,hi16(@LC94)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC94)
	or.u	 r3,r0,hi16(@LC95)
	or	 r2,r0,r22
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC95)
@L3968:
	or	 r2,r0,r21
	or	 r3,r0,r24
	bsr.n	 _tree_cons
	or	 r4,r0,0
	or	 r24,r0,r2
	ld	 r2,r24,12
	br.n	 @L4054
	or	 r3,r0,r22
	align	 4
@L3957:
	ld	 r13,r24,16
	bcnd	 eq0,r13,@L4055
	ld.bu	 r13,r23,8
	cmp	 r13,r13,129
	bb0	 ne,r13,@L3956
	or	 r25,r0,r24
	ld	 r23,r23,60
@L3974:
	ld	 r11,r25,16
	ld.bu	 r13,r11,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L3975
	ld	 r13,r11,80
	ld	 r12,r22,80
	ld.bu	 r13,r0,r13
	ld.bu	 r12,r0,r12
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L3975
	ld	 r2,r11,4
	ld	 r3,r22,4
	bsr.n	 _comptypes
	or	 r4,r0,1
	bcnd	 eq0,r2,@L3975
	or.u	 r3,r0,hi16(@LC96)
	or	 r2,r0,r22
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC96)
	or.u	 r3,r0,hi16(@LC97)
	ld	 r2,r25,16
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC97)
@L3975:
	ld	 r12,r25,16
	ld.bu	 r13,r12,8
	cmp	 r13,r13,129
	bb1	 eq,r13,@L3973
	ld	 r13,r12,60
	cmp	 r13,r13,r23
	bb0	 ne,r13,@L4044
@L3973:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L3974
@L3956:
	ld	 r13,r22,80
	ld.bu	 r13,r0,r13
	bcnd	 ne0,r13,@L3978
	bcnd.n	 eq0,r24,@L3978
	or	 r25,r0,r24
@L3983:
	ld	 r13,r25,16
	ld	 r13,r13,80
	ld.bu	 r13,r0,r13
	cmp	 r13,r13,1
	bb0	 eq,r13,@L3980
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L3983
@L3980:
	bcnd	 eq0,r25,@L3978
	or.u	 r3,r0,hi16(@LC98)
	or	 r2,r0,r22
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC98)
	or.u	 r3,r0,hi16(@LC99)
	ld	 r2,r25,16
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC99)
@L3978:
	or.u	 r13,r0,hi16(_flag_traditional)
	ld	 r13,r13,lo16(_flag_traditional)
	bcnd.n	 ne0,r13,@L4061
	or	 r2,r0,r21
	bcnd	 eq0,r24,@L3986
	ld	 r13,r24,8
	bb0	 (31-10),r13,@L4061
@L3986:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r12,r13,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd	 ne0,r13,@L4025
	ld	 r13,r12,32
	bb1.n	 (31-29),r13,@L4061
	or	 r2,r0,r21
	or.u	 r25,r0,hi16(_overloads_to_forget)
	ld	 r4,r25,lo16(_overloads_to_forget)
	bsr.n	 _tree_cons
	or	 r3,r0,r24
	br.n	 @L4025
	st	 r2,r25,lo16(_overloads_to_forget)
	align	 4
@L3954:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,129
	bb1	 ne,r13,@L3989
	ld	 r2,r24,44
	ld	 r12,r2,36
	bcnd	 eq0,r12,@L3991
	ld.bu	 r2,r12,8
	cmp	 r2,r2,132
	or	 r3,r0,145
	extu	 r2,r2,1<eq>
	bsr.n	 _my_friendly_assert
	addu	 r1,r1,@L4068
@L4069:
	align	 4
@L3991:
	ld.bu	 r2,r2,8
	mask	 r13,r2,0xff
	cmp	 r13,r13,29
	bb1.n	 ne,r13,@L3994
	subu	 r13,r2,32
	ld	 r21,r23,32
	ld	 r13,r23,28
	ld	 r24,r21,20
	or	 r22,r0,r23
	or	 r13,r13,1024
	bcnd.n	 eq0,r24,@L3996
	st	 r13,r23,28
	ld.bu	 r12,r24,8
	cmp	 r13,r12,3
	bb0	 ne,r13,@L3997
	ld	 r13,r23,80
	ld.bu	 r13,r0,r13
	bcnd.n	 ne0,r13,@L4002
	cmp	 r13,r12,29
	bb1	 ne,r13,@L3999
	ld	 r13,r24,80
	ld.bu	 r13,r0,r13
	bcnd.n	 ne0,r13,@L4002
	or.u	 r3,r0,hi16(@LC90)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC90)
	or.u	 r3,r0,hi16(@LC91)
	or	 r2,r0,r24
	or	 r3,r3,lo16(@LC91)
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L4070
@L4071:
	align	 4
@L3999:
	bsr.n	 _my_friendly_abort
	or	 r2,r0,9
@L4002:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,106
	bb1	 ne,r13,@L4004
	ld	 r24,r24,16
@L4004:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1.n	 ne,r13,@L4062
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r24,80
	ld	 r12,r22,80
	ld.bu	 r13,r0,r13
	ld.bu	 r12,r0,r12
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L4005
	ld	 r2,r24,4
	ld	 r3,r22,4
	bsr.n	 _comptypes
	or	 r4,r0,1
	bcnd.n	 eq0,r2,@L4005
	or.u	 r13,r0,hi16(_current_lang_stack)
	or.u	 r12,r0,hi16(_current_lang_base)
	ld	 r13,r13,lo16(_current_lang_stack)
	ld	 r12,r12,lo16(_current_lang_base)
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L4006
	or.u	 r3,r0,hi16(@LC92)
@L4053:
	ld	 r13,r24,80
	ld	 r12,r22,80
	ld.bu	 r13,r0,r13
	or	 r23,r0,r24
	br.n	 @L3989
	st.b	 r13,r0,r12
	align	 4
@L4006:
	or	 r2,r0,r22
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC92)
	or.u	 r3,r0,hi16(@LC93)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC93)
@L4005:
	or.u	 r13,r0,hi16(_pedantic)
@L4062:
	ld	 r13,r13,lo16(_pedantic)
	bcnd	 eq0,r13,@L4008
	ld.bu	 r13,r24,8
	cmp	 r13,r13,33
	bb1.n	 ne,r13,@L4008
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13,132
	ld.b	 r2,r0,r13
	cmp	 r2,r2,100
	or	 r3,r0,143
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	or.u	 r3,r0,hi16(@LC94)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC94)
	or.u	 r3,r0,hi16(@LC95)
	or	 r2,r0,r22
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC95)
@L4008:
	or	 r2,r0,r21
	or	 r3,r0,r24
	bsr.n	 _tree_cons
	or	 r4,r0,0
	or	 r24,r0,r2
	ld	 r2,r24,12
	br.n	 @L4054
	or	 r3,r0,r22
	align	 4
@L3997:
	ld	 r13,r24,16
	bcnd	 ne0,r13,@L4009
@L4055:
	br.n	 @L3989
	st	 r23,r24,16
	align	 4
@L4009:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,129
	bb0	 ne,r13,@L3996
	or	 r25,r0,r24
	ld	 r23,r23,60
@L4014:
	ld	 r11,r25,16
	ld.bu	 r13,r11,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L4015
	ld	 r13,r11,80
	ld	 r12,r22,80
	ld.bu	 r13,r0,r13
	ld.bu	 r12,r0,r12
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L4015
	ld	 r2,r11,4
	ld	 r3,r22,4
	bsr.n	 _comptypes
	or	 r4,r0,1
	bcnd	 eq0,r2,@L4015
	or.u	 r3,r0,hi16(@LC96)
	or	 r2,r0,r22
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC96)
	or.u	 r3,r0,hi16(@LC97)
	ld	 r2,r25,16
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC97)
@L4015:
	ld	 r12,r25,16
	ld.bu	 r13,r12,8
	cmp	 r13,r13,129
	bb1	 eq,r13,@L4013
	ld	 r13,r12,60
	cmp	 r13,r13,r23
	bb0	 ne,r13,@L4044
@L4013:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L4014
@L3996:
	ld	 r13,r22,80
	ld.bu	 r13,r0,r13
	bcnd.n	 ne0,r13,@L4061
	or	 r2,r0,r21
	bcnd.n	 eq0,r24,@L4061
	or	 r25,r0,r24
@L4023:
	ld	 r13,r25,16
	ld	 r13,r13,80
	ld.bu	 r13,r0,r13
	cmp	 r13,r13,1
	bb0	 eq,r13,@L4020
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L4023
@L4020:
	bcnd.n	 eq0,r25,@L4025
	or.u	 r3,r0,hi16(@LC98)
	or	 r2,r0,r22
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC98)
	or.u	 r3,r0,hi16(@LC99)
	ld	 r2,r25,16
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC99)
@L4025:
	or	 r2,r0,r21
@L4061:
	or	 r3,r0,r22
@L4054:
	bsr.n	 _tree_cons
	or	 r4,r0,r24
	or.u	 r13,r0,hi16(_unknown_type_node)
	ld	 r13,r13,lo16(_unknown_type_node)
	or	 r24,r0,r2
	st	 r24,r21,20
	or	 r23,r0,r22
	br.n	 @L3989
	st	 r13,r24,4
	align	 4
@L3994:
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L4030
	or.u	 r2,r0,hi16(@LC215)
	bsr.n	 _sorry
	or	 r2,r2,lo16(@LC215)
@L4049:
	br.n	 @L4039
	or	 r2,r0,0
	align	 4
@L4044:
	br.n	 @L3989
	or	 r23,r0,r22
	align	 4
@L4030:
	bsr.n	 _my_friendly_abort
	or	 r2,r0,14
@L3989:
	bcnd	 eq0,r19,@L4032
	ld.bu	 r12,r23,8
	cmp	 r13,r12,34
	bb0	 ne,r13,@L4032
	ld	 r13,r23,8
	bb0.n	 (31-13),r13,@L4033
	cmp	 r13,r12,33
	cmp	 r12,r12,36
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L4063
	or.u	 r13,r0,hi16(_flag_cadillac)
@L4033:
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L4063
	or.u	 r13,r0,hi16(_flag_cadillac)
	or.u	 r13,r0,hi16(_debug_temp_inits)
	ld	 r13,r13,lo16(_debug_temp_inits)
	bcnd	 eq0,r13,@L4032
	ld	 r13,r20,24
	bb1.n	 (31-20),r13,@L4063
	or.u	 r13,r0,hi16(_flag_cadillac)
	ld.bu	 r13,r20,8
	cmp	 r13,r13,15
	bb0.n	 ne,r13,@L4063
	or.u	 r13,r0,hi16(_flag_cadillac)
	bsr	 _temporary_allocation
@L4032:
	or.u	 r13,r0,hi16(_flag_cadillac)
@L4063:
	ld	 r13,r13,lo16(_flag_cadillac)
	bcnd.n	 eq0,r13,@L4039
	or	 r2,r0,r23
	bsr.n	 _cadillac_start_decl
	or	 r2,r0,r23
@L4038:
	or	 r2,r0,r23
@L4039:
@Lte56:
	ld	 r1,r31,64
	ld	 r19,r31,36
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,128
	def	 @L4070,@L4002-@L4071
	def	 @L4068,@L4038-@L4069
	def	 @L4066,@L3958-@L4067
	def	 @L4064,@L3936-@L4065

data
	align	 8
@LC216:
	string	 "variable declared as reference not initialized\000"
	align	 8
@LC217:
	string	 "initialization of `%s' from dissimilar reference "
	string	 "type\000"
	align	 8
@LC218:
	string	 "cannot initialize a reference to a volatile T wit"
	string	 "h a const T\000"
	align	 8
@LC219:
	string	 "cannot initialize a reference to a const T with a"
	string	 " volatile T\000"
	align	 8
@LC220:
	string	 "cannot initialize a reference to T with a const T"
	string	 "\000"
	align	 8
@LC221:
	string	 "cannot initialize a reference to T with a volatil"
	string	 "e T\000"
	align	 8
@LC222:
	string	 "invalid type conversion for reference\000"
	align	 8
@LC223:
	string	 "ambiguous pointer conversion\000"
	align	 8
@LC224:
	string	 "ambiguous pointer conversion\000"
	align	 8
@LC225:
	string	 "constructor failed to build reference initializer"
	string	 "\000"
	align	 8
@LC226:
	string	 "type mismatch in initialization of `%s' (use `con"
	string	 "st')\000"
	align	 8
@LC227:
	string	 "assignment (not initialization) in declaration\000"
	align	 8
@LC228:
	string	 "shadowing previous type declaration of `%s'\000"
	align	 8
@LC229:
	string	 "`%s' must be initialized by constructor, not by `"
	string	 "{...}'\000"
	align	 8
@LC230:
	string	 "structure `%s' with uninitialized const members\000"
	align	 8
@LC231:
	string	 "structure `%s' with uninitialized reference membe"
	string	 "rs\000"
	align	 8
@LC232:
	string	 "uninitialized const `%s'\000"
	align	 8
@LC233:
	string	 "uninitialized const `%s'\000"
	align	 8
@LC234:
	string	 "initializer fails to determine size of `%s'\000"
	align	 8
@LC235:
	string	 "array size missing in `%s'\000"
	align	 8
@LC236:
	string	 "zero-size array `%s'\000"
	align	 8
@LC237:
	string	 "storage size of `%s' isn't known\000"
	align	 8
@LC238:
	string	 "storage size of `%s' isn't known\000"
	align	 8
@LC239:
	string	 "storage size of `%s' isn't constant\000"
	align	 8
@LC240:
	string	 "parser lost in parsing declaration of `%s'\000"
text
	align	 8
	global	 _finish_decl
_finish_decl:
	subu	 r31,r31,144
	st	 r1,r31,80
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	st.d	 r18,r31,48
	st.d	 r16,r31,40
	or	 r23,r0,r2
	st.d	 r14,r31,32
@Ltb57:
	or	 r22,r0,r3
	st	 r5,r31,100
	or	 r25,r0,r4
	bsr.n	 _allocation_temporary_p
	st	 r0,r31,88
	st	 r0,r31,132
	or	 r15,r0,0
	bcnd.n	 ne0,r23,@L4168
	st	 r2,r31,124
	bcnd.n	 eq0,r22,@L4167
	or.u	 r2,r0,hi16(@LC227)
	or	 r2,r2,lo16(@LC227)
	bsr.n	 _error
	addu	 r1,r1,@L4431
@L4432:
	align	 4
@L4168:
	bcnd	 eq0,r25,@L4170
	ld	 r15,r25,20
	st	 r0,r23,64
@L4170:
	ld	 r13,r23,20
	ld.bu	 r12,r23,8
	ld	 r20,r23,4
	cmp	 r13,r13,0
	cmp	 r12,r12,32
	extu	 r13,r13,1<eq>
	bb1.n	 ne,r12,@L4171
	st	 r13,r31,116
	bcnd	 eq0,r22,@L4172
	ld	 r13,r23,48
	bcnd	 eq0,r13,@L4172
	ld	 r20,r22,4
	st	 r20,r23,4
	st	 r0,r23,48
@L4172:
	ld	 r13,r20,24
	bb0	 (31-22),r13,@L4173
	ld	 r12,r23,32
	bcnd	 eq0,r12,@L4173
	ld	 r13,r12,4
	bcnd	 eq0,r13,@L4174
	ld	 r13,r23,4
	cmp	 r13,r13,r20
	bb0	 ne,r13,@L4174
	or.u	 r2,r0,hi16(@LC228)
	ld	 r3,r12,16
	bsr.n	 _warning
	or	 r2,r2,lo16(@LC228)
@L4174:
	or.u	 r24,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r24,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	ld	 r25,r23,32
	bb0	 ne,r13,@L4176
	ld	 r3,r25,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r24,lo16(_current_binding_level)
	br.n	 @L4177
	st	 r2,r13,16
	align	 4
@L4176:
	or.u	 r24,r0,hi16(_class_binding_level)
	ld	 r13,r24,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L4177
	ld	 r3,r25,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r24,lo16(_class_binding_level)
	st	 r2,r13,16
@L4177:
	st	 r20,r25,4
	ld	 r12,r20,80
	ld	 r13,r12,4
	or.u	 r13,r13,0x4
	st	 r13,r12,4
@L4173:
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r2,r13,lo16(_current_function_decl)
	bsr.n	 _GNU_xref_decl
	or	 r3,r0,r23
	ld	 r4,r23,36
	or	 r2,r0,r23
	or	 r3,r0,0
	cmp	 r4,r4,0
	or	 r5,r0,0
	extu	 r4,r4,1<eq>
	bsr.n	 _rest_of_decl_compilation
	addu	 r1,r1,@L4433
@L4434:
	align	 4
@L4171:
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r20,r13
	bb0	 ne,r13,@L4180
	ld	 r13,r20,24
	bb0	 (31-22),r13,@L4180
	ld	 r13,r20,80
	ld	 r13,r0,r13
	bb0.n	 (31-28),r13,@L4180
	or	 r2,r0,0
	bsr.n	 _finish_exception_decl
	or	 r3,r0,r23
	ld	 r12,r20,80
	ld	 r13,r12,4
	or.u	 r13,r13,0x4
	br.n	 @L4179
	st	 r13,r12,4
	align	 4
@L4180:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,29
	bb0	 ne,r13,@L4181
	bsr.n	 _target_type
	or	 r2,r0,r20
	st	 r2,r31,108
@L4181:
	ld	 r13,r23,28
	bb1	 (31-8),r13,@L4182
	ld	 r12,r23,8
	bb0	 (31-13),r12,@L4182
	ld	 r13,r20,24
	bb0	 (31-20),r13,@L4182
	or	 r9,r0,1
	and.u	 r13,r12,0xfffb
	st	 r13,r23,8
	st	 r9,r31,132
@L4182:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,36
	bb1	 ne,r13,@L4183
	bcnd.n	 eq0,r22,@L4184
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r22,r13
	bb0	 ne,r13,@L4184
	ld	 r2,r22,8
	or	 r3,r0,147
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<21>
@L4184:
	bcnd	 eq0,r15,@L4186
	ld	 r13,r23,4
	or	 r2,r0,r15
	bsr.n	 _get_identifier
	st	 r0,r13,64
	st	 r2,r23,60
	or	 r2,r0,r23
	or	 r3,r0,r15
	or	 r4,r0,0
	bsr.n	 _make_decl_rtl
	addu	 r1,r1,@L4435
@L4436:
	align	 4
@L4183:
	bcnd	 eq0,r22,@L4187
	ld	 r13,r23,48
	bcnd	 eq0,r13,@L4192
@L4187:
	ld	 r12,r23,28
	bb1.n	 (31-8),r12,@L4414
	or.u	 r13,r0,hi16(_current_function_decl)
	ld.bu	 r13,r20,8
	cmp	 r13,r13,15
	bb1.n	 ne,r13,@L4186
	or	 r24,r0,r22
	or	 r25,r0,0
	bcnd.n	 ne0,r22,@L4193
	addu	 r14,r31,88
	ld	 r13,r23,80
	bcnd.n	 eq0,r13,@L4415
	or.u	 r2,r0,hi16(@LC216)
	bb1.n	 (31-20),r12,@L4186
	or	 r22,r0,0
	or.u	 r2,r0,hi16(@LC216)
@L4415:
	or	 r2,r2,lo16(@LC216)
	bsr.n	 _error
	addu	 r1,r1,@L4437
@L4438:
	align	 4
@L4193:
	ld.bu	 r13,r22,8
	cmp	 r13,r13,3
	bb1	 ne,r13,@L4197
	bsr.n	 _build_compound_expr
	or	 r2,r0,r22
	or	 r24,r0,r2
@L4197:
	ld	 r13,r24,4
	ld.bu	 r13,r13,8
	cmp	 r13,r13,15
	extu	 r21,r13,1<eq>
	bcnd.n	 eq0,r21,@L4198
	or	 r22,r0,r24
	bsr.n	 _convert_from_reference
	or	 r2,r0,r24
	or	 r22,r0,r2
@L4198:
	bcnd	 eq0,r21,@L4200
	ld	 r13,r20,4
	ld	 r12,r22,4
	ld	 r2,r13,64
	ld	 r3,r12,64
	bsr.n	 _comptypes
	or	 r4,r0,0
	bcnd.n	 ne0,r2,@L4201
	or.u	 r13,r0,hi16(@LC217)
	br.n	 @L4204
	or	 r25,r13,lo16(@LC217)
	align	 4
@L4201:
	ld	 r13,r24,4
	ld	 r12,r20,4
	ld	 r13,r13,4
	ld	 r12,r12,8
	ld	 r13,r13,8
	extu	 r12,r12,1<18>
	extu	 r13,r13,1<18>
	cmp	 r12,r12,r13
	bb0	 ge,r12,@L4204
	or	 r21,r0,0
	br.n	 @L4204
	or	 r24,r0,r22
	align	 4
@L4200:
	ld	 r13,r20,4
	ld.bu	 r13,r13,8
	cmp	 r13,r13,18
	bb0	 ne,r13,@L4205
	ld	 r13,r24,4
	ld.bu	 r13,r13,8
	cmp	 r13,r13,18
	bb1	 ne,r13,@L4205
	bsr.n	 _default_conversion
	or	 r2,r0,r24
	or	 r24,r0,r2
@L4205:
	ld	 r11,r20,4
	ld	 r10,r24,4
	ld.bu	 r13,r11,8
	ld.bu	 r12,r10,8
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L4206
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r2,r11,64
	ld	 r3,r10,64
	bsr.n	 _comptypes
	or	 r4,r0,0
	bcnd	 eq0,r2,@L4207
	ld	 r13,r20,4
	ld	 r13,r13,8
	bb0	 (31-12),r13,@L4208
	ld	 r13,r24,8
	bb0.n	 (31-13),r13,@L4208
	or.u	 r13,r0,hi16(@LC218)
	br.n	 @L4204
	or	 r25,r13,lo16(@LC218)
	align	 4
@L4208:
	ld	 r13,r20,4
	ld	 r13,r13,8
	bb0	 (31-13),r13,@L4210
	ld	 r13,r24,8
	bb0.n	 (31-12),r13,@L4210
	or.u	 r13,r0,hi16(@LC219)
	br.n	 @L4204
	or	 r25,r13,lo16(@LC219)
	align	 4
@L4210:
	ld	 r13,r20,4
	ld	 r13,r13,8
	mask.u	 r13,r13,0xc
	bcnd	 ne0,r13,@L4204
	ld	 r13,r24,8
	bb0	 (31-13),r13,@L4213
	or.u	 r13,r0,hi16(@LC220)
	br.n	 @L4204
	or	 r25,r13,lo16(@LC220)
	align	 4
@L4213:
	bb0.n	 (31-12),r13,@L4204
	or.u	 r13,r0,hi16(@LC221)
	br.n	 @L4204
	or	 r25,r13,lo16(@LC221)
	align	 4
@L4207:
	ld	 r2,r20,4
	bsr.n	 _convert
	or	 r3,r0,r24
	br.n	 @L4204
	or	 r24,r0,r2
	align	 4
@L4206:
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r24,r13
	bb0	 ne,r13,@L4204
	ld	 r2,r11,64
	ld	 r3,r10,64
	bsr.n	 _comptypes
	or	 r4,r0,0
	bcnd.n	 ne0,r2,@L4204
	or.u	 r13,r0,hi16(@LC222)
	or	 r25,r13,lo16(@LC222)
@L4204:
	bcnd	 eq0,r25,@L4245
	ld	 r13,r22,4
	ld	 r13,r13,24
	bb0.n	 (31-22),r13,@L4220
	or	 r2,r0,101
	or	 r3,r0,r20
	or	 r4,r0,r24
	bsr.n	 _build_type_conversion
	or	 r5,r0,0
	or	 r22,r0,r2
	bcnd.n	 eq0,r22,@L4221
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	or	 r24,r0,r22
	cmp	 r13,r24,r13
	bb1.n	 ne,r13,@L4222
	or	 r25,r0,0
	or.u	 r13,r0,hi16(@LC223)
	or	 r25,r13,lo16(@LC223)
@L4222:
	br.n	 @L4219
	or	 r21,r0,1
	align	 4
@L4221:
	ld	 r3,r20,4
	or	 r2,r0,101
	or	 r4,r0,r24
	bsr.n	 _build_type_conversion
	or	 r5,r0,0
	or	 r22,r0,r2
	bcnd.n	 eq0,r22,@L4219
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	or	 r24,r0,r22
	cmp	 r13,r24,r13
	bb1.n	 ne,r13,@L4226
	or	 r25,r0,0
	or.u	 r13,r0,hi16(@LC224)
	or	 r25,r13,lo16(@LC224)
@L4226:
	br.n	 @L4219
	or	 r21,r0,0
	align	 4
@L4220:
	ld	 r2,r20,4
	ld	 r13,r2,24
	mask	 r13,r13,8704
	cmp	 r13,r13,8704
	bb1.n	 ne,r13,@L4219
	or.u	 r16,r0,hi16(_current_binding_level)
	or.u	 r17,r0,hi16(_global_binding_level)
	ld	 r3,r16,lo16(_current_binding_level)
	ld	 r13,r17,lo16(_global_binding_level)
	cmp	 r3,r3,r13
	bsr.n	 _get_temp_name
	extu	 r3,r3,1<eq>
	or	 r22,r0,r2
	bsr.n	 _constructor_name
	ld	 r2,r20,4
	or	 r25,r0,r2
	or	 r2,r0,0
	bsr.n	 _build_tree_list
	or	 r3,r0,r24
	or	 r4,r0,r2
	or	 r2,r0,r22
	or	 r3,r0,r25
	or	 r5,r0,0
	bsr.n	 _build_method_call
	or	 r6,r0,3
	or	 r22,r0,r2
	bcnd.n	 eq0,r22,@L4231
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r22,r13
	bb1	 ne,r13,@L4230
@L4231:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,33
	bb1.n	 ne,r13,@L4416
	or.u	 r3,r0,hi16(@LC225)
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	st	 r13,r23,40
@L4416:
	or	 r2,r0,r23
	or	 r3,r3,lo16(@LC225)
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L4439
@L4440:
	align	 4
@L4230:
	ld	 r18,r23,4
	ld	 r19,r18,4
	bcnd.n	 eq0,r22,@L4234
	or	 r21,r0,r24
	ld	 r13,r22,20
	ld	 r25,r13,16
	ld.bu	 r13,r25,8
	cmp	 r13,r13,102
	bb1	 ne,r13,@L4235
	ld	 r25,r25,16
@L4235:
	ld.bu	 r2,r25,8
	cmp	 r2,r2,106
	or	 r3,r0,146
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	ld	 r24,r25,16
	br	 @L4236
	align	 4
@L4234:
	ld	 r3,r16,lo16(_current_binding_level)
	ld	 r13,r17,lo16(_global_binding_level)
	cmp	 r3,r3,r13
	or	 r2,r0,r19
	bsr.n	 _get_temp_name
	extu	 r3,r3,1<eq>
	or	 r24,r0,r2
	or	 r2,r0,106
	or	 r4,r0,0
	bsr.n	 _build_unary_op
	or	 r3,r0,r24
	or	 r25,r0,r2
@L4236:
	bsr.n	 _build_pointer_type
	or	 r2,r0,r19
	st	 r2,r25,4
	ld	 r2,r19,32
	bsr.n	 _convert
	or	 r3,r0,r25
	st	 r2,r23,48
	st	 r18,r2,4
	ld	 r13,r19,24
	bb0.n	 (31-20),r13,@L4237
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L4238
	or	 r2,r0,r24
	or	 r3,r0,0
	or	 r4,r0,1
	bsr.n	 _make_decl_rtl
	or.u	 r25,r0,hi16(_static_aggregates)
	ld	 r4,r25,lo16(_static_aggregates)
	or	 r2,r0,r21
	bsr.n	 _perm_tree_cons
	or	 r3,r0,r24
	br.n	 @L4242
	st	 r2,r25,lo16(_static_aggregates)
	align	 4
@L4238:
	bcnd	 eq0,r22,@L4240
	or	 r21,r0,r22
	br.n	 @L4430
	or	 r2,r0,44
	align	 4
@L4240:
	bsr.n	 _constructor_name
	or	 r2,r0,r19
	or	 r25,r0,r2
	or	 r2,r0,0
	bsr.n	 _build_tree_list
	or	 r3,r0,r21
	or	 r4,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,r25
	or	 r5,r0,0
	bsr.n	 _build_method_call
	or	 r6,r0,3
	or	 r21,r0,r2
	or	 r2,r0,44
@L4430:
	or	 r3,r0,r18
	ld	 r5,r23,48
	bsr.n	 _build
	or	 r4,r0,r21
	st	 r2,r23,48
	bsr.n	 _maybe_build_cleanup
	or	 r2,r0,r24
	br.n	 @L4242
	st	 r2,r0,r14
	align	 4
@L4237:
	st	 r21,r24,48
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	or	 r2,r0,r24
	ld	 r11,r12,lo16(_global_binding_level)
	or	 r3,r0,r21
	ld	 r12,r24,8
	cmp	 r13,r13,r11
	or	 r4,r0,0
	extu	 r13,r13,1<eq>
	and	 r12,r12,0xdfff
	mak	 r13,r13,0<13>
	or	 r5,r0,0
	or	 r12,r12,r13
	bsr.n	 _finish_decl
	st	 r12,r24,8
@L4242:
	ld	 r13,r24,8
	br	 @L4407
	align	 4
@L4219:
	bcnd.n	 eq0,r25,@L4245
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r0,r25
@L4406:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,33
	bb1.n	 ne,r13,@L4186
	or	 r22,r0,0
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	br.n	 @L4186
	st	 r13,r23,40
	align	 4
@L4245:
	bsr.n	 _build_pointer_type
	ld	 r2,r20,4
	bcnd.n	 eq0,r21,@L4247
	or	 r25,r0,r2
	ld	 r13,r24,8
	bb0	 (31-8),r13,@L4248
	bsr.n	 _save_expr
	or	 r2,r0,r24
	br.n	 @L4244
	st	 r2,r23,48
	align	 4
@L4248:
	br.n	 @L4244
	st	 r24,r23,48
	align	 4
@L4247:
	bsr.n	 _lvalue_p
	or	 r2,r0,r24
	bcnd.n	 eq0,r2,@L4251
	or	 r2,r0,106
	or	 r3,r0,r24
	bsr.n	 _build_unary_op
	or	 r4,r0,0
	or	 r22,r0,r2
	ld.bu	 r13,r22,8
	cmp	 r13,r13,106
	bb1	 ne,r13,@L4252
	ld	 r12,r22,16
	ld.bu	 r13,r12,8
	cmp	 r13,r13,52
	bb1	 ne,r13,@L4252
	ld	 r13,r12,24
	st	 r13,r0,r14
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r12,r22,16
	ld	 r13,r13,lo16(_error_mark_node)
	st	 r13,r12,24
@L4252:
	ld	 r2,r25,4
	ld	 r13,r2,24
	bb0.n	 (31-22),r13,@L4253
	or	 r3,r0,r22
	bsr.n	 _convert_pointer_to
	addu	 r1,r1,@L4441
@L4442:
	align	 4
@L4253:
	or	 r2,r0,r25
	bsr.n	 _convert
	or	 r3,r0,r22
@L4408:
	st	 r2,r23,48
	bsr.n	 _save_expr
	ld	 r2,r23,48
	or.u	 r13,r0,hi16(_current_class_decl)
	ld	 r13,r13,lo16(_current_class_decl)
	cmp	 r13,r2,r13
	bb1.n	 ne,r13,@L4255
	st	 r2,r23,48
	bsr	 _copy_node
	st	 r2,r23,48
@L4255:
	ld	 r13,r23,48
	br.n	 @L4244
	st	 r20,r13,4
	align	 4
@L4251:
	bsr.n	 _unary_complex_lvalue
	or	 r3,r0,r24
	or	 r3,r0,r2
	bcnd	 eq0,r3,@L4257
	ld.bu	 r13,r3,8
	cmp	 r13,r13,106
	bb1	 ne,r13,@L4258
	ld	 r13,r3,16
	ld.bu	 r13,r13,8
	cmp	 r13,r13,47
	bb1	 ne,r13,@L4258
	bsr	 _save_expr
	or	 r3,r0,r2
@L4258:
	bsr.n	 _convert_pointer_to
	ld	 r2,r25,4
	bsr.n	 _save_expr
	st	 r2,r23,48
	st	 r2,r23,48
	br.n	 @L4244
	st	 r20,r2,4
	align	 4
@L4257:
	ld	 r13,r20,4
	ld	 r13,r13,8
	bb0.n	 (31-13),r13,@L4260
	or.u	 r18,r0,hi16(_current_binding_level)
	ld	 r19,r23,4
	or.u	 r17,r0,hi16(_global_binding_level)
	ld	 r3,r18,lo16(_current_binding_level)
	ld	 r13,r17,lo16(_global_binding_level)
	ld	 r22,r19,4
	cmp	 r3,r3,r13
	extu	 r3,r3,1<eq>
	bsr.n	 _get_temp_name
	or	 r2,r0,r22
	or	 r21,r0,r2
	or	 r2,r0,106
	or	 r4,r0,0
	bsr.n	 _build_unary_op
	or	 r3,r0,r21
	or	 r25,r0,r2
	bsr.n	 _build_pointer_type
	or	 r2,r0,r22
	st	 r2,r25,4
	ld	 r2,r22,32
	bsr.n	 _convert
	or	 r3,r0,r25
	st	 r2,r23,48
	st	 r19,r2,4
	ld	 r13,r22,24
	bb0.n	 (31-20),r13,@L4265
	or	 r4,r0,0
	ld	 r13,r18,lo16(_current_binding_level)
	ld	 r12,r17,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L4268
	or	 r2,r0,r21
	or	 r3,r0,0
	or	 r4,r0,1
	bsr.n	 _make_decl_rtl
	or.u	 r25,r0,hi16(_static_aggregates)
	ld	 r4,r25,lo16(_static_aggregates)
	or	 r2,r0,r24
	bsr.n	 _perm_tree_cons
	or	 r3,r0,r21
	br.n	 @L4270
	st	 r2,r25,lo16(_static_aggregates)
	align	 4
@L4268:
	bsr.n	 _constructor_name
	or	 r2,r0,r22
	or	 r25,r0,r2
	or	 r2,r0,0
	bsr.n	 _build_tree_list
	or	 r3,r0,r24
	or	 r4,r0,r2
	or	 r2,r0,r21
	or	 r3,r0,r25
	or	 r5,r0,0
	bsr.n	 _build_method_call
	or	 r6,r0,3
	ld	 r5,r23,48
	or	 r4,r0,r2
	or	 r2,r0,44
	bsr.n	 _build
	or	 r3,r0,r19
	st	 r2,r23,48
	bsr.n	 _maybe_build_cleanup
	or	 r2,r0,r21
	br.n	 @L4270
	st	 r2,r0,r14
	align	 4
@L4265:
	ld	 r13,r18,lo16(_current_binding_level)
	or	 r2,r0,r21
	ld	 r12,r17,lo16(_global_binding_level)
	or	 r3,r0,r24
	cmp	 r13,r13,r12
	ld	 r12,r21,8
	extu	 r13,r13,1<eq>
	or	 r5,r0,0
	mak	 r13,r13,0<13>
	and	 r12,r12,0xdfff
	st	 r3,r21,48
	or	 r12,r12,r13
	bsr.n	 _finish_decl
	st	 r12,r21,8
@L4270:
	ld	 r13,r21,8
@L4407:
	bb0	 (31-18),r13,@L4244
	bsr.n	 _preserve_initializer
	addu	 r1,r1,@L4443
@L4444:
	align	 4
@L4260:
	or.u	 r3,r0,hi16(@LC226)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC226)
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	st	 r13,r23,48
@L4244:
	ld	 r13,r20,4
	ld	 r13,r13,16
	bcnd	 eq0,r13,@L4273
	bsr.n	 _convert_from_reference
	or	 r2,r0,r23
	ld	 r13,r23,8
	bb0.n	 (31-10),r13,@L4274
	or	 r24,r0,r2
	bsr	 _copy_to_permanent
	or	 r24,r0,r2
@L4274:
	st	 r24,r23,40
@L4273:
	ld	 r13,r23,8
	bb0	 (31-18),r13,@L4192
	ld	 r3,r23,48
	ld	 r13,r3,8
	bb1.n	 (31-9),r13,@L4186
	or	 r22,r0,0
	bsr.n	 _expand_static_init
	or	 r2,r0,r23
	st	 r0,r23,48
@L4192:
	or	 r22,r0,0
@L4186:
	or.u	 r13,r0,hi16(_current_function_decl)
@L4414:
	ld	 r2,r13,lo16(_current_function_decl)
	bsr.n	 _GNU_xref_decl
	or	 r3,r0,r23
	ld.bu	 r12,r23,8
	cmp	 r13,r12,36
	bb0	 ne,r13,@L4278
	ld	 r13,r23,28
	bb1.n	 (31-8),r13,@L4417
	or.u	 r13,r0,hi16(_current_binding_level)
	cmp	 r13,r12,31
	bb1.n	 ne,r13,@L4279
	or	 r2,r0,1
	bsr.n	 _my_friendly_assert
	or	 r3,r0,148
	st	 r22,r23,48
	cmp	 r2,r22,0
	or	 r3,r0,149
	extu	 r2,r2,1<ne>
	or	 r22,r0,0
	bsr.n	 _my_friendly_assert
	addu	 r1,r1,@L4445
@L4446:
	align	 4
@L4279:
	bcnd	 eq0,r22,@L4281
	ld	 r13,r20,24
	bb0	 (31-20),r13,@L4282
	ld.bu	 r13,r20,8
	cmp	 r13,r13,18
	bb1.n	 ne,r13,@L4283
	or	 r2,r0,r20
	or	 r3,r0,r22
	bsr.n	 _digest_init
	or	 r4,r0,0
	br.n	 @L4284
	or	 r22,r0,r2
	align	 4
@L4283:
	ld.bu	 r13,r22,8
	cmp	 r13,r13,43
	bb1.n	 ne,r13,@L4418
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r22,20
	bcnd	 eq0,r13,@L4284
	or.u	 r3,r0,hi16(@LC229)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC229)
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r22,r13,lo16(_error_mark_node)
@L4284:
	or.u	 r13,r0,hi16(_current_binding_level)
@L4418:
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L4419
	or.u	 r13,r0,hi16(_empty_init_node)
	br.n	 @L4420
	or.u	 r13,r0,hi16(_error_mark_node)
	align	 4
@L4282:
	ld.bu	 r13,r22,8
	cmp	 r13,r13,4
	bb0.n	 ne,r13,@L4289
	or	 r2,r0,r23
	bsr.n	 _store_init_value
	or	 r3,r0,r22
	or	 r22,r0,r2
@L4289:
	bcnd.n	 eq0,r22,@L4278
	or.u	 r13,r0,hi16(_error_mark_node)
@L4420:
	ld	 r13,r13,lo16(_error_mark_node)
	br.n	 @L4278
	st	 r13,r23,48
	align	 4
@L4281:
	or.u	 r13,r0,hi16(_tree_code_type)
	ld.bu	 r12,r20,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r13,r0,r13
	cmp	 r13,r13,116
	bb1	 ne,r13,@L4292
	ld	 r13,r20,24
	mask	 r13,r13,2560
	bcnd.n	 eq0,r13,@L4292
	cmp	 r13,r12,18
	bb0.n	 eq,r13,@L4294
	or	 r25,r0,r20
@L4295:
	ld	 r25,r25,4
	ld.bu	 r13,r25,8
	cmp	 r13,r13,18
	bb1	 eq,r13,@L4295
@L4294:
	ld	 r13,r25,80
	ld	 r13,r0,r13
	bb1	 (31-8),r13,@L4297
	bb0	 (31-11),r13,@L4298
	or.u	 r3,r0,hi16(@LC230)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC230)
@L4298:
	ld	 r13,r25,80
	ld	 r13,r0,r13
	bb0	 (31-12),r13,@L4297
	or.u	 r3,r0,hi16(@LC231)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC231)
@L4297:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,33
	bb1.n	 ne,r13,@L4421
	or.u	 r13,r0,hi16(_flag_pic)
	ld	 r13,r20,24
	bb1.n	 (31-20),r13,@L4421
	or.u	 r13,r0,hi16(_flag_pic)
	ld	 r13,r20,8
	bb1.n	 (31-13),r13,@L4301
	or.u	 r12,r0,0x4
	ld	 r13,r23,8
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L4421
	or.u	 r13,r0,hi16(_flag_pic)
@L4301:
	or.u	 r3,r0,hi16(@LC232)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC232)
	or.u	 r13,r0,hi16(_flag_pic)
@L4421:
	ld	 r13,r13,lo16(_flag_pic)
	bcnd.n	 ne0,r13,@L4417
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r23,8
	mask	 r13,r13,12288
	cmp	 r13,r13,12288
	bb1.n	 ne,r13,@L4417
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r23,28
	bb1.n	 (31-8),r13,@L4417
	or.u	 r13,r0,hi16(_current_binding_level)
	ld.bu	 r13,r23,8
	cmp	 r13,r13,33
	bb1.n	 ne,r13,@L4417
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r20,24
	bb0	 (31-20),r13,@L4278
	ld	 r12,r23,48
	bcnd.n	 eq0,r12,@L4303
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r12,r13
	bb1.n	 ne,r13,@L4417
	or.u	 r13,r0,hi16(_current_binding_level)
@L4303:
	or.u	 r13,r0,hi16(_empty_init_node)
@L4419:
	or	 r2,r0,r20
	ld	 r3,r13,lo16(_empty_init_node)
	bsr.n	 _digest_init
	or	 r4,r0,0
	br.n	 @L4278
	st	 r2,r23,48
	align	 4
@L4292:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,33
	bb1.n	 ne,r13,@L4417
	or.u	 r13,r0,hi16(_current_binding_level)
	ld.bu	 r13,r20,8
	cmp	 r13,r13,15
	bb0	 ne,r13,@L4278
	ld	 r13,r20,8
	bb1.n	 (31-13),r13,@L4306
	or.u	 r12,r0,0x4
	ld	 r13,r23,8
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L4417
	or.u	 r13,r0,hi16(_current_binding_level)
@L4306:
	or.u	 r3,r0,hi16(@LC233)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC233)
@L4278:
	or.u	 r13,r0,hi16(_current_binding_level)
@L4417:
	ld	 r12,r13,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	ld	 r9,r31,124
	cmp	 r12,r12,r13
	cmp	 r13,r9,0
	and.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L4307
	bsr	 _end_temporary_allocation
@L4307:
	ld.bu	 r13,r20,8
	cmp	 r13,r13,18
	bb1	 ne,r13,@L4308
	ld	 r13,r20,12
	bcnd	 ne0,r13,@L4308
	ld.bu	 r13,r23,8
	cmp	 r13,r13,32
	bb0	 ne,r13,@L4308
	ld	 r13,r23,8
	bb0.n	 (31-18),r13,@L4309
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	bcnd.n	 eq0,r13,@L4310
	or	 r25,r0,0
	ld	 r13,r23,28
	extu	 r13,r13,1<23>
	subu	 r13,r0,r13
	br.n	 @L4310
	subu	 r25,r0,r13
	align	 4
@L4309:
	ld	 r13,r23,28
	xor.u	 r25,r13,0x80
	extu	 r25,r25,1<23>
@L4310:
	bcnd.n	 ne0,r22,@L4312
	or	 r3,r0,r22
	ld	 r3,r23,48
@L4312:
	or	 r2,r0,r20
	bsr.n	 _complete_array_type
	or	 r4,r0,r25
	or	 r24,r0,r2
	cmp	 r13,r24,1
	bb1.n	 ne,r13,@L4422
	cmp	 r13,r24,2
	or.u	 r3,r0,hi16(@LC234)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC234)
	cmp	 r13,r24,2
@L4422:
	bb1	 ne,r13,@L4314
	bcnd.n	 eq0,r25,@L4315
	or.u	 r3,r0,hi16(@LC235)
	or	 r2,r0,r23
	or	 r3,r3,lo16(@LC235)
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L4447
@L4448:
	align	 4
@L4315:
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	bcnd	 ne0,r13,@L4402
	ld	 r13,r23,8
	bb0	 (31-18),r13,@L4314
	ld	 r13,r23,28
	or.u	 r13,r13,0x80
	st	 r13,r23,28
@L4314:
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	bcnd.n	 eq0,r13,@L4423
	or	 r2,r0,r23
@L4402:
	ld	 r13,r20,12
	bcnd	 eq0,r13,@L4318
	ld	 r2,r13,56
	or.u	 r13,r0,hi16(_integer_zero_node)
	bsr.n	 _tree_int_cst_lt
	ld	 r3,r13,lo16(_integer_zero_node)
	bcnd.n	 eq0,r2,@L4318
	or.u	 r3,r0,hi16(@LC236)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC236)
@L4318:
	or	 r2,r0,r23
@L4423:
	bsr.n	 _layout_decl
	or	 r3,r0,0
@L4308:
	ld.bu	 r12,r23,8
	cmp	 r13,r12,33
	bb1.n	 ne,r13,@L4319
	cmp	 r13,r12,34
	ld	 r13,r23,8
	bb0	 (31-18),r13,@L4320
	ld	 r13,r23,20
	bcnd	 ne0,r13,@L4320
	ld	 r13,r23,28
	bb0	 (31-8),r13,@L4322
	ld	 r13,r23,48
	bcnd.n	 eq0,r13,@L4323
	or	 r22,r0,0
@L4322:
	or.u	 r3,r0,hi16(@LC237)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC237)
	br.n	 @L4323
	or	 r22,r0,0
	align	 4
@L4320:
	ld	 r13,r23,28
	bb1	 (31-8),r13,@L4328
	ld	 r13,r23,20
	bcnd.n	 ne0,r13,@L4324
	or.u	 r3,r0,hi16(@LC238)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC238)
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	br.n	 @L4323
	st	 r13,r23,4
	align	 4
@L4324:
	ld	 r9,r31,108
	ld	 r13,r9,24
	bb0	 (31-22),r13,@L4323
	bsr.n	 _note_debug_info_needed
	ld	 r2,r31,108
@L4323:
	ld	 r13,r23,28
	bb1	 (31-8),r13,@L4328
	ld	 r13,r23,8
	bb0	 (31-18),r13,@L4327
@L4328:
	ld	 r13,r23,20
	bcnd	 eq0,r13,@L4327
	ld	 r13,r13,8
	bb1	 (31-9),r13,@L4327
	or.u	 r3,r0,hi16(@LC239)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC239)
@L4327:
	ld	 r13,r23,28
	bb1	 (31-8),r13,@L4332
	ld	 r13,r20,24
	bb0	 (31-21),r13,@L4332
	bsr	 _suspend_momentary
	bcnd.n	 eq0,r22,@L4330
	or	 r25,r0,r2
	ld.bu	 r13,r22,8
	cmp	 r13,r13,52
	bb1	 ne,r13,@L4330
	ld	 r2,r23,4
	ld	 r3,r22,4
	bsr.n	 _comptypes
	or	 r4,r0,1
	bcnd.n	 eq0,r2,@L4330
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r11,r13,lo16(_current_binding_level)
	ld	 r12,r22,24
	ld	 r13,r11,32
	ld	 r22,r22,16
	or	 r13,r13,64
	st	 r12,r31,88
	and	 r13,r13,0xffdf
	br.n	 @L4331
	st	 r13,r11,32
	align	 4
@L4330:
	bsr.n	 _maybe_build_cleanup
	or	 r2,r0,r23
	st	 r2,r31,88
@L4331:
	or	 r2,r0,r25
	bsr.n	 _resume_momentary
	addu	 r1,r1,@L4449
@L4450:
	align	 4
@L4319:
	bb1	 ne,r13,@L4332
	ld	 r13,r20,24
	bb0	 (31-21),r13,@L4332
	ld	 r9,r31,124
	bcnd	 eq0,r9,@L4334
	bsr	 _end_temporary_allocation
@L4334:
	bsr.n	 _maybe_build_cleanup
	or	 r2,r0,r23
	ld	 r9,r31,124
	bcnd.n	 eq0,r9,@L4332
	st	 r2,r31,88
	bsr	 _resume_temporary_allocation
@L4332:
	ld.bu	 r11,r23,8
	cmp	 r13,r11,33
	cmp	 r12,r11,29
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L4424
	or.u	 r13,r0,hi16(_current_binding_level)
	cmp	 r13,r11,35
	bb1.n	 ne,r13,@L4179
	or.u	 r13,r0,hi16(_current_binding_level)
@L4424:
	ld	 r12,r13,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r11,r13,lo16(_global_binding_level)
	or.u	 r13,r0,hi16(_flag_traditional)
	ld	 r13,r13,lo16(_flag_traditional)
	cmp	 r12,r12,r11
	or	 r21,r0,0
	bcnd.n	 ne0,r13,@L4339
	extu	 r24,r12,1<eq>
	ld	 r13,r23,8
	bb0	 (31-18),r13,@L4338
	ld	 r13,r20,24
	bb0	 (31-21),r13,@L4338
@L4339:
	bsr	 _allocation_temporary_p
	bcnd	 eq0,r2,@L4338
	or	 r21,r0,1
@L4338:
	bcnd	 eq0,r21,@L4340
	bsr	 _end_temporary_allocation
@L4340:
	ld	 r13,r31,88
	bcnd.n	 eq0,r13,@L4341
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r13,r13,32
	mask	 r13,r13,61440
	cmp	 r13,r13,12288
	bb1	 ne,r13,@L4341
	bsr.n	 _pop_implicit_try_blocks
	or	 r2,r0,r23
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r12,32
	and	 r13,r13,0xffdf
	st	 r13,r12,32
@L4341:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,33
	bb1.n	 ne,r13,@L4343
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L4342
	ld	 r13,r23,8
	bb1	 (31-18),r13,@L4342
	bsr.n	 _type_needs_gc_entry
	or	 r2,r0,r20
	bcnd.n	 eq0,r2,@L4342
	or.u	 r13,r0,hi16(_current_function_obstack_index)
	ld	 r2,r13,lo16(_current_function_obstack_index)
	addu	 r2,r2,1
	bsr.n	 _size_int
	st	 r2,r13,lo16(_current_function_obstack_index)
	st	 r2,r23,44
@L4342:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,33
	bb1	 ne,r13,@L4343
	ld	 r13,r23,28
	bb0.n	 (31-13),r13,@L4343
	or	 r2,r0,r23
	br.n	 @L4410
	or	 r3,r0,0
	align	 4
@L4343:
	ld	 r13,r23,8
	or.u	 r12,r0,0x2104
	mask.u	 r13,r13,0xff04
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L4345
	ld	 r2,r23,48
	bcnd.n	 eq0,r2,@L4345
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r2,r13
	bb0.n	 ne,r13,@L4345
	or.u	 r13,r0,hi16(_empty_init_node)
	ld	 r13,r13,lo16(_empty_init_node)
	cmp	 r13,r2,r13
	bb0	 ne,r13,@L4345
	bsr	 _save_expr
	bcnd.n	 eq0,r15,@L4346
	st	 r2,r23,48
	bsr.n	 _get_identifier
	or	 r2,r0,r15
	st	 r2,r23,60
@L4346:
	bcnd	 ne0,r24,@L4403
	ld	 r13,r23,8
	and.u	 r13,r13,0x80
	and	 r13,r13,0x3000
	cmp	 r13,r13,8192
	bb1	 ne,r13,@L4347
	ld	 r13,r23,28
	bb1	 (31-8),r13,@L4347
	ld	 r13,r20,24
	bb1	 (31-21),r13,@L4347
	ld.bu	 r2,r23,28
	cmp	 r13,r2,16
	bb0	 ne,r13,@L4347
	bsr	 _gen_reg_rtx
	or	 r3,r0,r2
	ld	 r2,r23,48
	or	 r4,r0,0
	bsr.n	 _store_expr
	st	 r3,r23,64
	ld	 r13,r23,8
	or.u	 r13,r13,0x1
	br.n	 @L4344
	st	 r13,r23,8
	align	 4
@L4347:
	bcnd.n	 eq0,r24,@L4349
	or	 r2,r0,r23
@L4403:
	ld	 r10,r23,8
	or	 r13,r10,32768
	bb0.n	 (31-18),r13,@L4350
	st	 r13,r23,8
	or.u	 r13,r0,hi16(_interface_unknown)
	ld	 r13,r13,lo16(_interface_unknown)
	bcnd.n	 ne0,r13,@L4425
	or	 r2,r0,r23
	ld	 r12,r23,28
	or.u	 r13,r0,hi16(_interface_only)
	and.u	 r12,r12,0xff7f
	ld	 r11,r13,lo16(_interface_only)
	or	 r13,r10,36864
	mak	 r11,r11,1<23>
	st	 r13,r23,8
	or	 r12,r12,r11
	st	 r12,r23,28
@L4350:
	or	 r2,r0,r23
@L4425:
	or	 r3,r0,r15
@L4410:
	or	 r4,r0,r24
	bsr.n	 _make_decl_rtl
	addu	 r1,r1,@L4451
@L4452:
	align	 4
@L4349:
	or	 r3,r0,r15
	br.n	 @L4411
	or	 r4,r0,0
	align	 4
@L4345:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,33
	bb1.n	 ne,r13,@L4426
	or	 r2,r0,r23
	ld	 r13,r23,80
	bcnd	 eq0,r13,@L4426
	ld	 r12,r23,28
	bb0	 (31-20),r12,@L4426
	ld	 r13,r23,8
	bb0	 (31-18),r13,@L4358
	bcnd.n	 ne0,r22,@L4427
	or	 r3,r0,r15
	or	 r2,r0,r23
	or	 r4,r0,1
	or.u	 r13,r12,0x80
	st	 r13,r23,28
	bsr.n	 _make_decl_rtl
	addu	 r1,r1,@L4453
@L4454:
	align	 4
@L4426:
	or	 r3,r0,r15
@L4427:
	or	 r4,r0,r24
@L4411:
	bsr.n	 _rest_of_decl_compilation
	or	 r5,r0,0
@L4344:
	bcnd.n	 eq0,r21,@L4428
	or.u	 r13,r0,hi16(_error_mark_node)
	bsr	 _resume_temporary_allocation
	or.u	 r13,r0,hi16(_error_mark_node)
@L4428:
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r20,r13
	bb0	 ne,r13,@L4361
	ld	 r13,r20,80
	bcnd	 eq0,r13,@L4361
	ld	 r13,r13,76
	bcnd.n	 eq0,r13,@L4361
	or	 r2,r0,r23
	br.n	 @L4412
	or	 r3,r0,r20
	align	 4
@L4361:
	ld.bu	 r13,r20,8
	cmp	 r12,r13,23
	cmp	 r13,r13,16
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L4362
	ld	 r3,r20,4
	ld	 r13,r3,80
	bcnd	 eq0,r13,@L4362
	ld	 r13,r13,76
	bcnd.n	 eq0,r13,@L4362
	or	 r2,r0,r23
@L4412:
	bsr	 _abstract_virtuals_error
@L4362:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L4364
	ld	 r13,r23,28
	bb0	 (31-21),r13,@L4358
	ld	 r24,r20,12
	or	 r22,r0,0
	ld	 r21,r23,32
	or	 r2,r0,r23
	bsr.n	 _copy_decl_lang_specific
	ld	 r19,r23,80
	bcnd.n	 eq0,r24,@L4367
	or.u	 r13,r0,hi16(_void_list_node)
@L4429:
	ld	 r13,r13,lo16(_void_list_node)
	cmp	 r13,r24,r13
	bb0	 ne,r13,@L4367
	ld	 r13,r24,12
	bcnd	 eq0,r13,@L4370
	bcnd.n	 ne0,r22,@L4371
	or	 r25,r0,r22
	addu	 r25,r20,12
@L4371:
	st	 r0,r0,r25
	or	 r2,r0,r21
	ld	 r3,r20,12
	bsr.n	 _build_decl_overload
	or	 r4,r0,0
	or	 r3,r0,r2
	or	 r2,r0,29
	or	 r4,r0,r20
	bsr.n	 _build_decl
	st	 r24,r0,r25
	ld	 r12,r2,28
	ld	 r13,r23,28
	and.u	 r12,r12,0xff7f
	mask.u	 r13,r13,0x80
	or	 r12,r12,r13
	st	 r12,r2,28
	ld	 r12,r2,8
	ld	 r13,r23,8
	and	 r12,r12,0xefff
	mask	 r13,r13,4096
	or	 r12,r12,r13
	st	 r12,r2,8
	ld	 r11,r23,28
	ld	 r12,r2,28
	ld	 r13,r2,8
	and.u	 r12,r12,0xffef
	st	 r0,r2,48
	set	 r13,r13,2<15>
	mask.u	 r11,r11,0x10
	st	 r13,r2,8
	or	 r12,r12,r11
	st	 r12,r2,28
	ld	 r13,r23,80
	bsr.n	 _pushdecl
	st	 r13,r2,80
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	st	 r13,r2,48
	ld	 r13,r23,64
	st	 r13,r2,64
@L4370:
	or	 r22,r0,r24
	ld	 r24,r0,r24
	bcnd.n	 ne0,r24,@L4429
	or.u	 r13,r0,hi16(_void_list_node)
@L4367:
	br.n	 @L4358
	st	 r19,r23,80
	align	 4
@L4364:
	ld	 r13,r23,28
	bb1	 (31-8),r13,@L4358
	ld	 r13,r23,8
	bb0.n	 (31-18),r13,@L4376
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r20,r13
	bb0.n	 ne,r13,@L4376
	cmp	 r13,r22,0
	ld	 r11,r20,24
	extu	 r13,r13,1<ne>
	extu	 r12,r11,1<11>
	or	 r12,r12,r13
	bcnd.n	 eq0,r12,@L4377
	or	 r2,r0,r23
	or	 r3,r0,r22
	bsr.n	 _expand_static_init
	addu	 r1,r1,@L4455
@L4456:
	align	 4
@L4377:
	bb0.n	 (31-21),r11,@L4378
	or.u	 r25,r0,hi16(_static_aggregates)
	or	 r2,r0,0
	ld	 r4,r25,lo16(_static_aggregates)
	bsr.n	 _perm_tree_cons
	or	 r3,r0,r23
	st	 r2,r25,lo16(_static_aggregates)
@L4378:
	or.u	 r13,r0,hi16(_flag_gc)
	ld	 r13,r13,lo16(_flag_gc)
	bcnd	 eq0,r13,@L4358
	bsr.n	 _type_needs_gc_entry
	or	 r2,r0,r20
	bcnd.n	 eq0,r2,@L4358
	or	 r2,r0,r23
	or	 r3,r0,r20
	bsr.n	 _build_static_gc_entry
	addu	 r1,r1,@L4457
@L4458:
	align	 4
@L4376:
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L4358
	ld	 r9,r31,116
	bcnd	 eq0,r9,@L4383
	ld	 r12,r23,8
	bb1.n	 (31-18),r12,@L4383
	extu	 r13,r12,1<15>
	and.u	 r12,r12,0xffef
	ld	 r11,r23,20
	mak	 r13,r13,0<20>
	or	 r12,r12,r13
	bcnd.n	 ne0,r11,@L4413
	st	 r12,r23,8
	br.n	 @L4413
	st	 r0,r23,48
	align	 4
@L4383:
	ld	 r13,r23,8
	bb1	 (31-15),r13,@L4385
	ld	 r13,r20,16
	bcnd	 ne0,r13,@L4387
	ld.bu	 r13,r20,8
	cmp	 r13,r13,18
	bb1	 ne,r13,@L4385
@L4387:
	ld	 r13,r23,64
	bcnd	 ne0,r13,@L4388
@L4413:
	or	 r2,r0,r23
	bsr.n	 _expand_decl
	addu	 r1,r1,@L4459
@L4460:
	align	 4
@L4388:
	ld	 r3,r31,88
	bcnd	 eq0,r3,@L4385
	bsr.n	 _expand_decl_cleanup
	or	 r2,r0,0
	st	 r0,r31,88
@L4385:
	ld	 r13,r23,20
	bcnd.n	 eq0,r13,@L4358
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r20,r13
	bb0	 ne,r13,@L4358
	bsr.n	 _expand_decl_init
	or	 r2,r0,r23
	bcnd	 ne0,r22,@L4393
	ld	 r13,r20,24
	bb0	 (31-20),r13,@L4394
@L4393:
	ld	 r2,r23,12
	bsr.n	 _emit_line_note
	ld	 r3,r23,16
	or	 r2,r0,r23
	or	 r3,r0,r22
	bsr.n	 _expand_aggr_init
	or	 r4,r0,0
	ld	 r13,r20,24
	bb0	 (31-20),r13,@L4394
	ld	 r13,r23,8
	and	 r13,r13,0x7fff
	st	 r13,r23,8
@L4394:
	ld	 r3,r31,88
	bcnd	 eq0,r3,@L4358
	bsr.n	 _expand_decl_cleanup
	or	 r2,r0,r23
	bcnd	 ne0,r2,@L4358
	or.u	 r3,r0,hi16(@LC240)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC240)
@L4358:
	ld	 r11,r23,36
	bcnd.n	 eq0,r11,@L4179
	or.u	 r13,r0,hi16(_tree_code_type)
	ld.bu	 r12,r11,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r13,r0,r13
	cmp	 r13,r13,116
	bb1	 ne,r13,@L4179
	ld.bu	 r12,r23,8
	cmp	 r13,r12,33
	bb0.n	 ne,r13,@L4398
	cmp	 r13,r12,29
	bb1	 ne,r13,@L4179
	ld	 r13,r11,16
	bcnd.n	 eq0,r13,@L4179
	or.u	 r12,r0,hi16(_current_class_name)
	ld	 r13,r11,48
	ld	 r12,r12,lo16(_current_class_name)
	ld	 r13,r13,32
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L4179
@L4398:
	bsr.n	 _popclass
	or	 r2,r0,1
@L4179:
	ld	 r9,r31,100
	bcnd	 eq0,r9,@L4399
	bsr	 _pop_obstacks
@L4399:
	ld	 r9,r31,132
	bcnd	 eq0,r9,@L4400
	ld	 r13,r23,8
	or.u	 r13,r13,0x4
	st	 r13,r23,8
@L4400:
	or.u	 r13,r0,hi16(_flag_cadillac)
	ld	 r13,r13,lo16(_flag_cadillac)
	bcnd	 eq0,r13,@L4167
	bsr.n	 _cadillac_finish_decl
	or	 r2,r0,r23
@L4167:
@Lte57:
	ld	 r1,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	ld.d	 r14,r31,32
	jmp.n	 r1
	addu	 r31,r31,144
	def	 @L4459,@L4385-@L4460
	def	 @L4457,@L4358-@L4458
	def	 @L4455,@L4378-@L4456
	def	 @L4453,@L4344-@L4454
	def	 @L4451,@L4344-@L4452
	def	 @L4449,@L4332-@L4450
	def	 @L4447,@L4314-@L4448
	def	 @L4445,@L4278-@L4446
	def	 @L4443,@L4244-@L4444
	def	 @L4441,@L4408-@L4442
	def	 @L4439,@L4192-@L4440
	def	 @L4437,@L4406-@L4438
	def	 @L4435,@L4186-@L4436
	def	 @L4433,@L4179-@L4434
	def	 @L4431,@L4167-@L4432

data
	align	 8
@LC241:
	string	 "multiple initializations given for `%s'\000"
text
	align	 8
_expand_static_init:
	subu	 r31,r31,64
	st.d	 r24,r31,40
	or.u	 r25,r0,hi16(_static_aggregates)
	st.d	 r22,r31,32
	or	 r22,r0,r3
	ld	 r3,r25,lo16(_static_aggregates)
	st	 r1,r31,48
@Ltb58:
	bsr.n	 _value_member
	or	 r24,r0,r2
	bcnd	 eq0,r2,@L4472
	ld	 r13,r2,12
	bcnd.n	 eq0,r13,@L4474
	or.u	 r3,r0,hi16(@LC241)
	or	 r2,r0,r24
	or	 r3,r3,lo16(@LC241)
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L4482
@L4483:
	align	 4
@L4472:
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L4475
	or.u	 r2,r0,hi16(_permanent_obstack)
	or	 r2,r2,lo16(_permanent_obstack)
	bsr.n	 _push_obstacks
	or	 r3,r0,r2
	or.u	 r13,r0,hi16(_integer_type_node)
	ld	 r2,r13,lo16(_integer_type_node)
	bsr.n	 _get_temp_name
	or	 r3,r0,1
	or	 r3,r0,0
	or	 r4,r0,0
	or	 r23,r0,r2
	bsr.n	 _rest_of_decl_compilation
	or	 r5,r0,0
	or.u	 r13,r0,hi16(_integer_zero_node)
	or	 r2,r0,95
	ld	 r4,r13,lo16(_integer_zero_node)
	bsr.n	 _build_binary_op
	or	 r3,r0,r23
	bsr.n	 _expand_start_cond
	or	 r3,r0,0
	or	 r2,r0,r23
	or.u	 r13,r0,hi16(_integer_one_node)
	or	 r4,r0,0
	ld	 r3,r13,lo16(_integer_one_node)
	bsr.n	 _expand_assignment
	or	 r5,r0,0
	ld	 r13,r24,4
	ld	 r13,r13,24
	bb0.n	 (31-20),r13,@L4476
	or	 r2,r0,r24
	or	 r3,r0,r22
	bsr.n	 _expand_aggr_init
	or	 r4,r0,0
	bsr.n	 _do_pending_stack_adjust
	addu	 r1,r1,@L4484
@L4485:
	align	 4
@L4476:
	or	 r3,r0,r22
	or	 r4,r0,0
	bsr.n	 _expand_assignment
	or	 r5,r0,0
@L4477:
	bsr	 _expand_end_cond
	ld	 r13,r24,4
	ld	 r13,r13,24
	bb0.n	 (31-21),r13,@L4478
	or.u	 r25,r0,hi16(_static_aggregates)
	or	 r2,r0,r23
	ld	 r4,r25,lo16(_static_aggregates)
	bsr.n	 _perm_tree_cons
	or	 r3,r0,r24
	ld	 r13,r2,8
	st	 r2,r25,lo16(_static_aggregates)
	or	 r13,r13,8192
	st	 r13,r2,8
@L4478:
	bsr.n	 _pop_obstacks
	addu	 r1,r1,@L4486
@L4487:
	align	 4
@L4475:
	ld	 r13,r24,4
	ld	 r13,r13,24
	bb1.n	 (31-20),r13,@L4481
	or	 r2,r0,r22
	bsr	 _preserve_initializer
	or	 r2,r0,r22
@L4481:
	ld	 r4,r25,lo16(_static_aggregates)
	bsr.n	 _perm_tree_cons
	or	 r3,r0,r24
	st	 r2,r25,lo16(_static_aggregates)
@L4474:
@Lte58:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	ld.d	 r22,r31,32
	jmp.n	 r1
	addu	 r31,r31,64
	def	 @L4486,@L4474-@L4487
	def	 @L4484,@L4477-@L4485
	def	 @L4482,@L4474-@L4483

	align	 8
	global	 _complete_array_type
_complete_array_type:
	subu	 r31,r31,64
	st	 r1,r31,48
	st.d	 r24,r31,40
	st.d	 r22,r31,32
@Ltb59:
	or	 r23,r0,r2
	or	 r22,r0,r4
	or	 r25,r0,0
	bcnd.n	 eq0,r3,@L4500
	or	 r24,r0,0
	ld.bu	 r12,r3,8
	cmp	 r13,r12,28
	bb1.n	 ne,r13,@L4501
	cmp	 r13,r12,43
	ld	 r2,r3,16
	or	 r3,r0,0
	br.n	 @L4511
	subu	 r2,r2,1
	align	 4
@L4501:
	bb1.n	 ne,r13,@L4503
	or.u	 r13,r0,hi16(_error_mark_node)
	bsr.n	 _list_length
	ld	 r2,r3,20
	br.n	 @L4512
	subu	 r2,r2,1
	align	 4
@L4503:
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r3,r13
	bb0	 ne,r13,@L4505
	or	 r24,r0,1
@L4505:
	or	 r2,r0,1
@L4512:
	or	 r3,r0,0
@L4511:
	bsr	 _build_int_2_wide
	or	 r25,r0,r2
@L4500:
	bcnd	 ne0,r25,@L4510
	bcnd.n	 eq0,r22,@L4507
	or	 r2,r0,1
	bsr.n	 _build_int_2_wide
	or	 r3,r0,0
	or	 r25,r0,r2
@L4507:
	bcnd.n	 eq0,r25,@L4508
	or	 r24,r0,2
@L4510:
	bsr.n	 _build_index_type
	or	 r2,r0,r25
	st	 r2,r23,12
	ld	 r13,r25,4
	bcnd	 ne0,r13,@L4508
	st	 r2,r25,4
@L4508:
	bsr.n	 _layout_type
	or	 r2,r0,r23
@Lte59:
	ld	 r1,r31,48
	or	 r2,r0,r24
	ld.d	 r24,r31,40
	ld.d	 r22,r31,32
	jmp.n	 r1
	addu	 r31,r31,64

data
	align	 8
@LC242:
	string	 "functions cannot have method qualifiers\000"
	align	 8
@LC243:
	string	 "global operator delete must be declared as taking"
	string	 " a single argument of type void*\000"
	align	 8
@LC244:
	string	 "operator delete cannot be overloaded\000"
	align	 8
@LC245:
	string	 "inconsistent declarations for `%s'\000"
	align	 8
@LC246:
	string	 "inconsistent declarations for `%s'\000"
	align	 8
@LC247:
	string	 "method `%s' may not be declared static\000"
	align	 8
@LC248:
	string	 "(since `%s' declared virtual in base class.)\000"
	align	 8
@LC249:
	string	 "`%s' is not a static member of class `%s'\000"
	align	 8
@LC250:
	string	 "redeclaration of type for `%s'\000"
	align	 8
@LC251:
	string	 "redeclaration of type for `%s'\000"
	align	 8
@LC252:
	string	 "multiple initializations of static member `%s::%s"
	string	 "'\000"
	align	 8
@LC253:
	string	 "initializer lists for field declarations\000"
	align	 8
@LC254:
	string	 "arrays cannot take initializers\000"
	align	 8
@LC255:
	string	 "bad parameter list specification for function `%s"
	string	 "'\000"
	align	 8
@LC256:
	string	 "bad parameter list specification for function\000"
	align	 8
@LC257:
	string	 "destructors must be member functions\000"
	align	 8
@LC258:
	string	 "destructor `%s' must match class name `%s'\000"
	align	 8
@LC259:
	string	 "declarator name missing\000"
	align	 8
@LC260:
	string	 "<nameless>\000"
	align	 8
@LC261:
	string	 "operator `%s' must be declared as a member\000"
	align	 8
@LC262:
	string	 "operator <typename>\000"
	align	 8
@LC263:
	string	 "multiple `::' terms in declarator invalid\000"
	align	 8
@LC264:
	string	 "type `%s' is not derived from type `%s'\000"
	align	 8
@LC265:
	string	 "type name\000"
	align	 8
@LC266:
	string	 "extraneous `int' ignored\000"
	align	 8
@LC267:
	string	 "extraneous `char' ignored\000"
	align	 8
@LC268:
	string	 "extraneous `__wchar_t' ignored\000"
	align	 8
@LC269:
	string	 "multiple declarations `%s' and `%s'\000"
	align	 8
@LC270:
	string	 "duplicate `%s'\000"
	align	 8
@LC271:
	string	 "`long long long' is too long for GCC\000"
	align	 8
@LC272:
	string	 "duplicate `%s'\000"
	align	 8
@LC273:
	string	 "two or more data types in declaration of `%s'\000"
	align	 8
@LC274:
	string	 "`%s' fails to be a typedef or built in type\000"
	align	 8
@LC275:
	string	 "return type specification for destructor invalid\000"
	align	 8
@LC276:
	string	 "return type specification for constructor invalid"
	string	 "\000"
	align	 8
@LC277:
	string	 "short, signed or unsigned invalid for `%s'\000"
	align	 8
@LC278:
	string	 "long, short, signed or unsigned invalid for `%s'\000"
	align	 8
@LC279:
	string	 "long and short specified together for `%s'\000"
	align	 8
@LC280:
	string	 "long or short specified with char for `%s'\000"
	align	 8
@LC281:
	string	 "long or short specified with floating type for `%"
	string	 "s'\000"
	align	 8
@LC282:
	string	 "signed and unsigned given together for `%s'\000"
	align	 8
@LC283:
	string	 "long, short, signed or unsigned used invalidly fo"
	string	 "r `%s'\000"
	align	 8
@LC284:
	string	 "duplicate `const'\000"
	align	 8
@LC285:
	string	 "duplicate `volatile'\000"
	align	 8
@LC286:
	string	 "member `%s' cannot be declared both virtual and s"
	string	 "tatic\000"
	align	 8
@LC287:
	string	 "storage class specifiers invalid in parameter dec"
	string	 "larations\000"
	align	 8
@LC288:
	string	 "typedef declaration invalid in parameter declarat"
	string	 "ion\000"
	align	 8
@LC289:
	string	 "virtual outside class declaration\000"
	align	 8
@LC290:
	string	 "multiple storage classes in declaration of `%s'\000"
	align	 8
@LC291:
	string	 "typedef of `%s' in class scope hides previous dec"
	string	 "laration\000"
	align	 8
@LC292:
	string	 "storage class specified for %s `%s'\000"
	align	 8
@LC293:
	string	 "member operator\000"
	align	 8
@LC294:
	string	 "structure field\000"
	align	 8
@LC295:
	string	 "storage class specified for parameter `%s'\000"
	align	 8
@LC296:
	string	 "storage class specified for typename\000"
	align	 8
@LC297:
	string	 "`%s' initialized and declared `extern'\000"
	align	 8
@LC298:
	string	 "`%s' has both `extern' and initializer\000"
	align	 8
@LC299:
	string	 "nested function `%s' declared `extern'\000"
	align	 8
@LC300:
	string	 "top-level declaration of `%s' specifies `auto'\000"
	align	 8
@LC301:
	string	 "declaration of `%s' as array of voids\000"
	align	 8
@LC302:
	string	 "declaration of `%s' as array of functions\000"
	align	 8
@LC303:
	string	 "size of array `%s' has non-integer type\000"
	align	 8
@LC304:
	string	 "ANSI C++ forbids zero-size array `%s'\000"
	align	 8
@LC305:
	string	 "size of array `%s' is negative\000"
	align	 8
@LC306:
	string	 "ANSI C++ forbids variable-size array `%s'\000"
	align	 8
@LC307:
	string	 "`%s' declared as function returning a function\000"
	align	 8
@LC308:
	string	 "`%s' declared as function returning an array\000"
	align	 8
@LC309:
	string	 "destructor cannot be static member function\000"
	align	 8
@LC310:
	string	 "destructors cannot be declared `const'\000"
	align	 8
@LC311:
	string	 "destructors cannot be declared `volatile'\000"
	align	 8
@LC312:
	string	 "destructor for alien class `%s' cannot be a membe"
	string	 "r\000"
	align	 8
@LC313:
	string	 "constructor cannot be static member function\000"
	align	 8
@LC314:
	string	 "constructors cannot be declared virtual\000"
	align	 8
@LC315:
	string	 "constructors cannot be declared `const'\000"
	align	 8
@LC316:
	string	 "constructors cannot be declared `volatile'\000"
	align	 8
@LC317:
	string	 "return value type specifier for constructor ignor"
	string	 "ed\000"
	align	 8
@LC318:
	string	 "constructor for alien class `%s' cannot be member"
	string	 "\000"
	align	 8
@LC319:
	string	 "virtual functions cannot be friends\000"
	align	 8
@LC320:
	string	 "friend declaration not in class definition\000"
	align	 8
@LC321:
	string	 "destructors cannot be specified with parameters\000"
	align	 8
@LC322:
	string	 "cannot declare %s to references\000"
	align	 8
@LC323:
	string	 "references\000"
	align	 8
@LC324:
	string	 "pointers\000"
	align	 8
@LC325:
	string	 "cannot declare references to functions; use point"
	string	 "er to function instead\000"
	align	 8
@LC326:
	string	 "invalid type: `void &'\000"
	align	 8
@LC327:
	string	 "invalid type modifier within %s declarator\000"
	align	 8
@LC328:
	string	 "reference\000"
	align	 8
@LC329:
	string	 "pointer\000"
	align	 8
@LC330:
	string	 "duplicate `const'\000"
	align	 8
@LC331:
	string	 "duplicate `volatile'\000"
	align	 8
@LC332:
	string	 "cannot declare member `%s::%s' within this class\000"
	align	 8
@LC333:
	string	 "extra qualification `%s' on member `%s' ignored\000"
	align	 8
@LC334:
	string	 "class `%s' does not have any constructors\000"
	align	 8
@LC335:
	string	 "type conversion is not a member of structure `%s'"
	string	 "\000"
	align	 8
@LC336:
	string	 "field `%s' is not a member of structure `%s'\000"
	align	 8
@LC337:
	string	 "cannot declare member `%s::%s' within this class\000"
	align	 8
@LC338:
	string	 "extra qualification `%s' on member `%s' ignored\000"
	align	 8
@LC339:
	string	 "structure `%s' not yet defined\000"
	align	 8
@LC340:
	string	 "type conversion function declared to return incon"
	string	 "gruent type\000"
	align	 8
@LC341:
	string	 "return type specified for type conversion functio"
	string	 "n\000"
	align	 8
@LC342:
	string	 "invalid type qualifier for non-method type\000"
	align	 8
@LC343:
	string	 "trying to make class `%s' a friend of global scop"
	string	 "e\000"
	align	 8
@LC344:
	string	 "variable or field `%s' declared void\000"
	align	 8
@LC345:
	string	 "variable or field declared void\000"
	align	 8
@LC346:
	string	 "cannot use `::' in parameter declaration\000"
	align	 8
@LC347:
	string	 "parameter declared `virtual'\000"
	align	 8
@LC348:
	string	 "`const' and `volatile' function specifiers invali"
	string	 "d in parameter declaration\000"
	align	 8
@LC349:
	string	 "invalid friend declaration\000"
	align	 8
@LC350:
	string	 "invalid raises declaration\000"
	align	 8
@LC351:
	string	 "can't make %s `%s' into a method -- not in a clas"
	string	 "s\000"
	align	 8
@LC352:
	string	 "operator\000"
	align	 8
@LC353:
	string	 "function\000"
	align	 8
@LC354:
	string	 "function `%s' declared virtual inside a union\000"
	align	 8
@LC355:
	string	 "field `%s' has incomplete type\000"
	align	 8
@LC356:
	string	 "field has incomplete type\000"
	align	 8
@LC357:
	string	 "`%s' is neither function nor method; cannot be de"
	string	 "clared friend\000"
	align	 8
@LC358:
	string	 "invalid friend declaration\000"
	align	 8
@LC359:
	string	 "member functions are implicitly friends of their "
	string	 "class\000"
	align	 8
@LC360:
	string	 "field declared `virtual'\000"
	align	 8
@LC361:
	string	 "`const' and `volatile' function specifiers invali"
	string	 "d in field declaration\000"
	align	 8
@LC362:
	string	 "invalid friend declaration\000"
	align	 8
@LC363:
	string	 "invalid raises declaration\000"
	align	 8
@LC364:
	string	 "static member `%s' must be defined separately fro"
	string	 "m its declaration\000"
	align	 8
@LC365:
	string	 "ANSI C++ forbids initialization of %s `%s'\000"
	align	 8
@LC366:
	string	 "const member\000"
	align	 8
@LC367:
	string	 "member\000"
	align	 8
@LC368:
	string	 "invalid storage class for function `%s'\000"
	align	 8
@LC369:
	string	 "invalid storage class for function `%s'\000"
	align	 8
@LC370:
	string	 "virtual non-class function `%s'\000"
	align	 8
@LC371:
	string	 "main\000"
	align	 8
@LC372:
	string	 "builtin_\000"
	align	 8
@LC373:
	string	 "cannot declare member function `%s' to have stati"
	string	 "c linkage\000"
	align	 8
@LC374:
	string	 "main\000"
	align	 8
@LC375:
	string	 "cannot declare function `main' to have static lin"
	string	 "kage\000"
	align	 8
@LC376:
	string	 "main\000"
	align	 8
@LC377:
	string	 "cannot inline function `main'\000"
	align	 8
@LC378:
	string	 "inline declaration ignored for function with `..."
	string	 "'\000"
	align	 8
@LC379:
	string	 "ANSI C++ does not permit `extern inline'\000"
	align	 8
@LC380:
	string	 "ANSI C++ does not permit `extern inline'\000"
	align	 8
@LC381:
	string	 "variable declared `virtual'\000"
	align	 8
@LC382:
	string	 "variable declared `inline'\000"
	align	 8
@LC383:
	string	 "`const' and `volatile' function specifiers invali"
	string	 "d in field declaration\000"
	align	 8
@LC384:
	string	 "invalid friend declaration\000"
	align	 8
@LC385:
	string	 "invalid raises declaration\000"
	align	 8
@LC386:
	string	 "cannot declare member `%s' to have static linkage"
	string	 "\000"
	align	 8
@LC387:
	string	 "cannot explicitly declare member `%s' to have ext"
	string	 "ern linkage\000"
text
	align	 8
	global	 _grokdeclarator
_grokdeclarator:
	subu	 r31,r31,416
	or.u	 r13,r0,hi16(_current_class_type)
	st.d	 r20,r31,56
	ld	 r20,r13,lo16(_current_class_type)
	st	 r1,r31,80
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r18,r31,48
	st.d	 r16,r31,40
	st.d	 r14,r31,32
@Ltb60:
	st	 r3,r31,140
	st	 r4,r31,148
	st	 r5,r31,156
	st	 r6,r31,164
	st	 r0,r31,220
	st	 r0,r31,228
	st	 r0,r31,236
	or	 r17,r0,r2
	st	 r0,r31,252
	or	 r14,r0,0
	st	 r0,r31,260
	or	 r15,r0,0
	st	 r0,r31,268
	or	 r22,r0,0
	st	 r0,r31,276
	or	 r19,r0,0
	st	 r0,r31,284
	or	 r18,r0,0
	st	 r0,r31,292
	or	 r21,r0,0
	st	 r0,r31,300
	cmp	 r12,r4,1
	bb1.n	 ne,r12,@L4626
	st	 r0,r31,308
	or	 r8,r0,1
	st	 r8,r31,252
	br.n	 @L4627
	st	 r0,r31,148
	align	 4
@L4626:
	ld	 r8,r31,148
	cmp	 r13,r8,6
	bb1.n	 ne,r13,@L4628
	cmp	 r13,r8,4
	subu	 r8,r0,1
	br.n	 @L6386
	st	 r8,r31,252
	align	 4
@L4628:
	bb1.n	 ne,r13,@L6443
	or.u	 r13,r0,hi16(_flag_traditional)
	or	 r8,r0,1
	st	 r8,r31,268
@L6386:
	or	 r8,r0,3
	st	 r8,r31,148
@L4627:
	or.u	 r13,r0,hi16(_flag_traditional)
@L6443:
	ld	 r13,r13,lo16(_flag_traditional)
	bcnd.n	 eq0,r13,@L6444
	or	 r23,r0,0
	bsr	 _allocation_temporary_p
	bcnd.n	 eq0,r2,@L6445
	or	 r24,r0,r17
	bsr	 _end_temporary_allocation
@L6444:
	or	 r24,r0,r17
@L6445:
	bcnd.n	 eq0,r24,@L4633
	or	 r16,r0,0
@L4636:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,42
	bb0	 eq,r13,@L4633
	or	 r23,r0,r24
	ld	 r24,r24,16
	bcnd	 ne0,r24,@L4636
@L4633:
	ld	 r8,r31,140
	cmp	 r13,r24,0
	cmp	 r12,r8,0
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd	 eq0,r13,@L4637
	ld.bu	 r13,r24,8
	cmp	 r13,r13,50
	bb1	 ne,r13,@L4637
	ld	 r13,r24,16
	bcnd	 eq0,r13,@L4637
	ld.bu	 r13,r13,8
	cmp	 r12,r13,1
	cmp	 r13,r13,124
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L4637
	ld	 r11,r8,16
	ld.bu	 r13,r11,8
	cmp	 r13,r13,1
	bb1.n	 ne,r13,@L4638
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r12,r13,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r12,r12,r13
	bb0.n	 ne,r12,@L4641
	or	 r25,r0,r11
	ld	 r2,r11,24
	bcnd.n	 ne0,r2,@L4642
	or	 r3,r0,r2
@L4641:
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r2,r13,lo16(_current_class_type)
	bcnd	 eq0,r2,@L4643
	ld	 r3,r25,28
	bcnd	 ne0,r3,@L6260
	ld	 r13,r2,16
	bcnd	 ne0,r13,@L4644
	ld	 r13,r2,80
	ld	 r13,r0,r13
	bb0	 (31-24),r13,@L4644
	subu	 r5,r0,1
	or	 r8,r0,1
	or	 r3,r0,r25
	cmp	 r5,r8,r5
	or	 r4,r0,0
	bsr.n	 _lookup_field
	extu	 r5,r5,1<eq>
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	or	 r3,r0,r2
	cmp	 r13,r3,r13
	bb0	 ne,r13,@L4639
	bcnd	 eq0,r3,@L6259
	ld.bu	 r13,r3,8
	cmp	 r13,r13,32
	ext	 r13,r13,1<eq>
	and	 r3,r3,r13
@L4644:
	bcnd	 ne0,r3,@L6260
@L6259:
	bsr.n	 _lookup_nested_field
	or	 r2,r0,r25
	or	 r3,r0,r2
	bcnd	 ne0,r3,@L6260
@L4643:
	ld	 r3,r25,20
@L4642:
	bcnd.n	 eq0,r3,@L4639
	or	 r2,r0,r3
@L6260:
	ld.bu	 r13,r3,8
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L4650
	or.u	 r13,r0,hi16(_looking_for_typename)
	ld	 r11,r13,lo16(_looking_for_typename)
	bcnd	 lt0,r11,@L4650
	ld	 r4,r25,4
	bcnd	 eq0,r4,@L4653
	ld	 r4,r4,48
	subu	 r13,r0,1
	cmp	 r12,r3,r4
	subu	 r13,r0,r13
	extu	 r12,r12,1<eq>
	or	 r12,r12,r13
	bcnd.n	 ne0,r12,@L4639
	or	 r2,r0,r4
	bcnd	 gt0,r11,@L4639
	or	 r2,r0,r25
	bsr.n	 _arbitrate_lookup
	addu	 r1,r1,@L6509
@L6510:
	align	 4
@L4653:
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r2,r3,4
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r2,r13
	bb0	 ne,r13,@L4639
@L4650:
	br.n	 @L4639
	or	 r2,r0,r3
	align	 4
@L4638:
	ld	 r13,r11,24
	bb0.n	 (31-22),r13,@L4639
	or	 r2,r0,0
	ld	 r2,r11,48
@L4639:
	bcnd	 eq0,r2,@L4660
	ld.bu	 r13,r2,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L4660
	ld	 r13,r2,4
	ld	 r13,r13,24
	bb0	 (31-22),r13,@L4660
	bsr.n	 _parmlist_is_exprlist
	ld	 r2,r24,20
	bcnd	 eq0,r2,@L4660
	ld	 r8,r31,148
	cmp	 r13,r8,3
	bb1	 ne,r13,@L4661
	ld	 r13,r24,20
	ld	 r13,r0,r13
	bcnd.n	 eq0,r13,@L4661
	or.u	 r2,r0,hi16(@LC253)
	bsr.n	 _sorry
	or	 r2,r2,lo16(@LC253)
	ld	 r24,r24,16
	bcnd	 eq0,r23,@L4662
	st	 r24,r23,16
	or	 r24,r0,r17
@L4662:
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	or	 r17,r0,r24
	br.n	 @L4837
	st	 r13,r31,276
	align	 4
@L4661:
	ld	 r8,r24,20
	bcnd.n	 eq0,r23,@L4665
	st	 r8,r31,276
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	cmp	 r12,r8,0
	cmp	 r13,r13,0
	or	 r13,r13,r12
	ld	 r12,r24,16
	extu	 r11,r13,1<eq>
	xor	 r13,r11,1
	bcnd.n	 eq0,r13,@L4667
	st	 r12,r23,16
	or.u	 r2,r0,hi16(@LC254)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC254)
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	br.n	 @L4667
	st	 r13,r31,276
	align	 4
@L4665:
	ld	 r17,r17,16
@L4667:
	ld	 r21,r31,140
	or.u	 r13,r0,hi16(_have_extern_spec)
	ld	 r13,r13,lo16(_have_extern_spec)
	or	 r22,r0,1
	bcnd.n	 eq0,r13,@L4669
	or	 r19,r0,1
	or.u	 r25,r0,hi16(_used_extern_spec)
	ld	 r13,r25,lo16(_used_extern_spec)
	bcnd.n	 ne0,r13,@L4669
	or.u	 r2,r0,hi16(@LC208)
	bsr.n	 _get_identifier
	or	 r2,r2,lo16(@LC208)
	ld	 r4,r31,140
	or	 r3,r0,r2
	bsr.n	 _decl_tree_cons
	or	 r2,r0,0
	st	 r19,r25,lo16(_used_extern_spec)
	or	 r21,r0,r2
@L4669:
	or	 r2,r0,r17
	or	 r3,r0,r21
	or	 r4,r0,0
	or	 r5,r0,r22
	bsr.n	 _grokdeclarator
	or	 r6,r0,0
	or	 r24,r0,r2
	bcnd.n	 eq0,r24,@L4671
	or.u	 r13,r0,hi16(_void_type_node)
	ld	 r13,r13,lo16(_void_type_node)
	cmp	 r13,r24,r13
	bb1	 ne,r13,@L4670
@L4671:
	br.n	 @L4668
	or	 r24,r0,0
	align	 4
@L4670:
	ld	 r12,r24,8
	ld	 r20,r24,4
	bb0	 (31-18),r12,@L4672
	ld	 r13,r20,24
	bb0	 (31-21),r13,@L4672
	bb1.n	 (31-10),r12,@L4672
	or.u	 r2,r0,hi16(_permanent_obstack)
	or	 r2,r2,lo16(_permanent_obstack)
	bsr.n	 _push_obstacks
	or	 r3,r0,r2
	bsr.n	 _copy_node
	or	 r2,r0,r24
	ld.bu	 r13,r20,8
	cmp	 r13,r13,18
	bb1.n	 ne,r13,@L4673
	or	 r24,r0,r2
	ld	 r3,r20,12
	bcnd	 eq0,r3,@L4673
	ld	 r13,r3,8
	bb1	 (31-10),r13,@L4673
	bsr.n	 _copy_to_permanent
	ld	 r2,r3,56
	bsr	 _build_index_type
	or	 r3,r0,r2
	bsr.n	 _build_cplus_array_type
	ld	 r2,r20,4
	or	 r20,r0,r2
	st	 r20,r24,4
@L4673:
	bsr	 _pop_obstacks
@L4672:
	ld.bu	 r13,r20,8
	cmp	 r13,r13,21
	bb1	 ne,r13,@L4675
	ld	 r13,r20,80
	ld	 r13,r0,r13
	bb1	 (31-28),r13,@L4668
@L4675:
	bsr	 _push_obstacks_nochange
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L4676
	ld	 r13,r24,28
	bb0	 (31-13),r13,@L4676
	ld	 r13,r24,80
	ld	 r23,r13,8
	br.n	 @L6446
	or.u	 r13,r0,hi16(_processing_template_decl)
	align	 4
@L4676:
	ld	 r23,r24,36
	or.u	 r13,r0,hi16(_processing_template_decl)
@L6446:
	ld	 r13,r13,lo16(_processing_template_decl)
	bcnd	 eq0,r13,@L4678
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1.n	 ne,r13,@L4679
	or.u	 r13,r0,hi16(_last_function_parms)
	bsr.n	 _copy_to_permanent
	ld	 r2,r13,lo16(_last_function_parms)
	ld	 r3,r24,4
	ld.bu	 r13,r3,8
	cmp	 r13,r13,16
	bb1.n	 ne,r13,@L4680
	or	 r25,r0,r2
	ld	 r3,r3,56
	ld.bu	 r13,r3,8
	cmp	 r13,r13,132
	bb0	 ne,r13,@L4680
	bsr.n	 _build_pointer_type
	or	 r2,r0,r3
	or.u	 r13,r0,hi16(_flag_this_is_variable)
	ld	 r3,r13,lo16(_flag_this_is_variable)
	cmp	 r3,r3,0
	or	 r4,r0,0
	bsr.n	 _build_type_variant
	extu	 r3,r3,1<le>
	or.u	 r13,r0,hi16(_this_identifier)
	or	 r3,r0,r2
	ld	 r4,r13,lo16(_this_identifier)
	bsr.n	 _build
	or	 r2,r0,34
	or	 r3,r0,r2
	st	 r25,r0,r3
	or	 r25,r0,r3
@L4680:
	st	 r25,r24,40
@L4679:
	ld	 r3,r24,32
	ld	 r4,r24,4
	bsr.n	 _build_lang_decl
	or	 r2,r0,129
	ld	 r13,r24,8
	and	 r13,r13,0xefff
	st	 r13,r24,8
	ld	 r12,r2,8
	and	 r13,r12,0xefff
	st	 r13,r2,8
	ld	 r13,r24,8
	and	 r12,r12,0xcfff
	mask	 r13,r13,8192
	or	 r12,r12,r13
	st	 r12,r2,8
	ld	 r13,r24,28
	bb0.n	 (31-8),r13,@L4682
	or	 r12,r0,0
	bcnd	 eq0,r23,@L4683
	bb0	 (31-19),r13,@L4682
@L4683:
	or	 r12,r0,1
@L4682:
	ld	 r13,r2,28
	and.u	 r13,r13,0xff7f
	mak	 r12,r12,0<23>
	or	 r13,r13,r12
	st	 r13,r2,28
	ld	 r13,r2,28
	st	 r24,r2,44
	or	 r24,r0,r2
	or	 r13,r13,1024
	st	 r13,r24,28
@L4678:
	bcnd	 eq0,r23,@L4684
	ld	 r13,r23,16
	bcnd	 eq0,r13,@L4684
	ld	 r13,r24,28
	bb1	 (31-19),r13,@L4685
	and.u	 r13,r13,0xff7f
	st	 r13,r24,28
@L4685:
	ld	 r13,r24,80
	bcnd	 eq0,r13,@L4686
	ld	 r13,r24,28
	and	 r13,r13,0xf7ff
	st	 r13,r24,28
@L4686:
	or	 r2,r0,r23
	bsr.n	 _pushclass
	or	 r3,r0,2
@L4684:
	ld	 r13,r20,24
	bb0.n	 (31-21),r13,@L4687
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r12,r13,lo16(_current_binding_level)
	ld	 r13,r12,32
	bb1.n	 (31-24),r13,@L4687
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb1.n	 ne,r13,@L6447
	or.u	 r12,r0,hi16(_free_binding_level)
	or.u	 r13,r0,hi16(_named_labels)
	ld	 r2,r13,lo16(_named_labels)
	cmp	 r2,r2,0
	or	 r3,r0,134
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	or.u	 r12,r0,hi16(_free_binding_level)
@L6447:
	ld	 r2,r12,lo16(_free_binding_level)
	bcnd.n	 eq0,r2,@L4691
	or	 r25,r0,r2
	ld	 r13,r25,28
	br.n	 @L4692
	st	 r13,r12,lo16(_free_binding_level)
	align	 4
@L4691:
	bsr.n	 _xmalloc
	or	 r2,r0,36
	or	 r25,r0,r2
@L4692:
	or.u	 r3,r0,hi16(_clear_binding_level)
	subu	 r2,r25,60
	ld	 r4,r3,lo16(_clear_binding_level)
	or	 r3,r3,lo16(_clear_binding_level)
	or.u	 r13,r0,hi16(_keep_next_level_flag)
	subu	 r3,r3,60
	bsr.n	 ___movstrSI96x36
	ld	 r23,r13,lo16(_keep_next_level_flag)
	or.u	 r12,r0,hi16(_class_binding_level)
	ld	 r13,r12,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L4694
	st	 r13,r25,28
	br.n	 @L4695
	st	 r0,r12,lo16(_class_binding_level)
	align	 4
@L4694:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	st	 r13,r25,28
@L4695:
	ld	 r13,r25,32
	mak	 r12,r23,3<9>
	or	 r2,r0,r25
	or	 r13,r13,416
	or.u	 r25,r0,hi16(_current_binding_level)
	and	 r13,r13,0xf1ff
	st	 r2,r25,lo16(_current_binding_level)
	or	 r13,r13,r12
	bsr.n	 _GNU_xref_start_scope
	st	 r13,r2,32
	ld	 r11,r25,lo16(_current_binding_level)
	ld	 r13,r11,32
	or.u	 r12,r0,hi16(_keep_next_level_flag)
	and	 r13,r13,0xf1ff
	st	 r0,r12,lo16(_keep_next_level_flag)
	or	 r13,r13,1024
	bsr.n	 _clear_last_expr
	st	 r13,r11,32
	bsr.n	 _expand_start_bindings
	or	 r2,r0,0
@L4687:
	bcnd	 eq0,r22,@L6261
	ld.bu	 r12,r24,8
	cmp	 r13,r12,29
	bb0.n	 ne,r13,@L4701
	cmp	 r13,r12,32
	bb1.n	 ne,r13,@L4702
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	bcnd	 ne0,r13,@L4700
	bsr.n	 _list_length
	or	 r2,r0,r21
	cmp	 r2,r2,1
	bb0	 gt,r2,@L4696
@L4700:
	ld	 r13,r24,32
	or.u	 r2,r0,hi16(@LC209)
	ld	 r3,r13,16
	br.n	 @L6387
	or	 r2,r2,lo16(@LC209)
	align	 4
@L4701:
	ld	 r13,r24,32
	or.u	 r2,r0,hi16(@LC210)
	ld	 r3,r13,16
	br.n	 @L6387
	or	 r2,r2,lo16(@LC210)
	align	 4
@L4702:
	ld	 r13,r20,16
	bcnd	 ne0,r13,@L4696
	ld.bu	 r13,r20,8
	cmp	 r13,r13,18
	bb0	 ne,r13,@L4705
	ld	 r13,r24,32
	or.u	 r2,r0,hi16(@LC211)
	ld	 r3,r13,16
	br.n	 @L6387
	or	 r2,r2,lo16(@LC211)
	align	 4
@L4705:
	ld	 r13,r20,4
	ld	 r13,r13,16
	bcnd	 ne0,r13,@L4696
	ld	 r13,r24,32
	or.u	 r2,r0,hi16(@LC212)
	ld	 r3,r13,16
	or	 r2,r2,lo16(@LC212)
@L6387:
	bsr.n	 _error
	or	 r22,r0,0
@L4696:
	bcnd.n	 ne0,r22,@L6448
	or.u	 r13,r0,hi16(_current_binding_level)
@L6261:
	ld.bu	 r13,r24,8
	cmp	 r12,r13,32
	cmp	 r13,r13,129
	or	 r12,r12,r13
	extu	 r13,r12,1<eq>
	xor	 r12,r13,1
	bcnd	 eq0,r12,@L4709
	ld	 r12,r20,24
	bb0	 (31-22),r12,@L4709
	ld	 r13,r24,28
	bb1	 (31-8),r13,@L4709
	ld	 r13,r20,16
	bcnd	 ne0,r13,@L4710
	ld	 r13,r24,32
	or.u	 r2,r0,hi16(@LC213)
	ld	 r3,r13,16
	bsr.n	 _error
	or	 r2,r2,lo16(@LC213)
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	st	 r13,r24,4
	br.n	 @L4709
	or	 r20,r0,r13
	align	 4
@L4710:
	extu	 r22,r12,1<11>
@L4709:
	bcnd.n	 eq0,r22,@L4712
	or.u	 r13,r0,hi16(_current_binding_level)
@L6448:
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L4713
	ld	 r13,r24,28
	bb0	 (31-8),r13,@L4713
	ld	 r13,r24,32
	or.u	 r2,r0,hi16(@LC214)
	ld	 r3,r13,16
	bsr.n	 _warning
	or	 r2,r2,lo16(@LC214)
@L4713:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r11,r24,28
	or.u	 r10,r0,hi16(_global_binding_level)
	ld	 r12,r13,lo16(_current_binding_level)
	ld	 r13,r10,lo16(_global_binding_level)
	and.u	 r11,r11,0xff7f
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L4714
	st	 r11,r24,28
	ld	 r13,r24,8
	or	 r13,r13,8192
	st	 r13,r24,8
@L4714:
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	st	 r13,r24,48
@L4712:
	ld.bu	 r12,r24,8
	cmp	 r13,r12,34
	bb0	 ne,r13,@L4717
	ld	 r13,r24,36
	bcnd.n	 ne0,r13,@L4720
	or	 r23,r0,r24
@L4717:
	cmp	 r13,r12,129
	bb1.n	 ne,r13,@L4718
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L4720
	or	 r23,r0,r24
@L4718:
	ld.bu	 r13,r20,8
	cmp	 r13,r13,24
	bb0.n	 ne,r13,@L4720
	or	 r23,r0,r24
	bsr.n	 _pushdecl
	or	 r2,r0,r24
	or	 r23,r0,r2
	ld.bu	 r13,r23,8
	cmp	 r13,r13,3
	bb1.n	 ne,r13,@L4720
	or	 r2,r0,r24
	bsr.n	 _value_member
	or	 r3,r0,r23
	bcnd	 eq0,r2,@L4722
	ld	 r23,r2,16
	br	 @L4720
	align	 4
@L4722:
	bcnd	 eq0,r23,@L6263
@L4743:
	ld	 r9,r23,16
	st	 r24,r31,88
	st	 r9,r31,92
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L4729
	ld.bu	 r13,r9,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L4729
	ld	 r13,r24,4
	ld	 r12,r9,4
	ld	 r11,r13,12
	ld	 r10,r12,12
	st	 r13,r31,120
	st	 r12,r31,128
	st	 r11,r31,124
	st	 r10,r31,132
	ld.bu	 r13,r13,8
	cmp	 r13,r13,16
	bb1	 ne,r13,@L4730
	ld	 r13,r9,80
	ld	 r13,r0,r13
	bb0.n	 (31-13),r13,@L4730
	addu	 r2,r31,120
	addu	 r3,r31,88
	br.n	 @L6388
	addu	 r4,r31,124
	align	 4
@L4730:
	ld	 r13,r31,128
	ld.bu	 r13,r13,8
	cmp	 r13,r13,16
	bb1	 ne,r13,@L4731
	ld	 r13,r31,88
	ld	 r13,r13,80
	ld	 r13,r0,r13
	bb0.n	 (31-13),r13,@L4731
	addu	 r2,r31,128
	addu	 r3,r31,92
	addu	 r4,r31,132
@L6388:
	bsr	 _revert_static_member_fn
@L4731:
	ld	 r11,r31,120
	ld	 r10,r31,128
	ld.bu	 r12,r11,8
	ld.bu	 r13,r10,8
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L4733
	cmp	 r13,r12,14
	bb1.n	 ne,r13,@L4734
	or.u	 r3,r0,hi16(@LC49)
	ld	 r2,r31,88
	br.n	 @L6389
	or	 r3,r3,lo16(@LC49)
	align	 4
@L4734:
	or.u	 r3,r0,hi16(@LC50)
	ld	 r2,r31,88
	or	 r3,r3,lo16(@LC50)
@L6389:
	bsr	 _compiler_error_with_decl
	br.n	 @L4728
	or	 r2,r0,0
	align	 4
@L4733:
	ld	 r13,r11,4
	ld	 r12,r10,4
	ld	 r2,r13,64
	ld	 r3,r12,64
	bsr.n	 _comptypes
	or	 r4,r0,1
	bcnd.n	 eq0,r2,@L4736
	or	 r4,r0,1
	ld	 r2,r31,124
	ld	 r3,r31,132
	bsr.n	 _compparms
	addu	 r1,r1,@L6511
@L6512:
	align	 4
@L4736:
	br.n	 @L4728
	or	 r2,r0,0
	align	 4
@L4729:
	ld	 r13,r31,88
	or.u	 r12,r0,hi16(_error_mark_node)
	ld	 r2,r13,4
	ld	 r13,r12,lo16(_error_mark_node)
	cmp	 r13,r2,r13
	bb1	 ne,r13,@L4739
	ld	 r13,r31,92
	ld	 r13,r13,4
	cmp	 r13,r13,r2
	br.n	 @L4728
	extu	 r2,r13,1<eq>
	align	 4
@L4739:
	ld	 r13,r31,92
	ld	 r3,r13,4
	bcnd.n	 ne0,r3,@L4741
	cmp	 r13,r2,0
	br.n	 @L4728
	extu	 r2,r13,1<eq>
	align	 4
@L4741:
	bsr.n	 _comptypes
	or	 r4,r0,1
@L4728:
	bcnd	 ne0,r2,@L4725
	ld	 r23,r0,r23
	bcnd	 ne0,r23,@L4743
@L4725:
	bcnd	 ne0,r23,@L4744
@L6263:
	br.n	 @L4720
	or	 r23,r0,r24
	align	 4
@L4744:
	ld	 r23,r23,16
@L4720:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L4746
	ld	 r13,r24,28
	bb0	 (31-21),r13,@L4746
	ld	 r21,r23,32
	ld	 r13,r23,28
	ld	 r24,r21,20
	or	 r22,r0,r23
	or	 r13,r13,1024
	bcnd.n	 eq0,r24,@L4748
	st	 r13,r23,28
	ld.bu	 r12,r24,8
	cmp	 r13,r12,3
	bb0	 ne,r13,@L4749
	ld	 r13,r23,80
	ld.bu	 r13,r0,r13
	bcnd.n	 ne0,r13,@L6449
	or.u	 r13,r0,hi16(_flag_traditional)
	cmp	 r13,r12,29
	bb1	 ne,r13,@L4751
	ld	 r13,r24,80
	ld.bu	 r13,r0,r13
	bcnd.n	 ne0,r13,@L6449
	or.u	 r13,r0,hi16(_flag_traditional)
	or.u	 r3,r0,hi16(@LC90)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC90)
	or.u	 r3,r0,hi16(@LC91)
	or	 r2,r0,r24
	or	 r3,r3,lo16(@LC91)
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L6513
@L6514:
	align	 4
@L4751:
	bsr.n	 _my_friendly_abort
	or	 r2,r0,9
@L4750:
	or.u	 r13,r0,hi16(_flag_traditional)
@L6449:
	ld	 r13,r13,lo16(_flag_traditional)
	bcnd	 ne0,r13,@L4754
	ld	 r13,r24,8
	bb0.n	 (31-10),r13,@L4754
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L4754
	or.u	 r25,r0,hi16(_overloads_to_forget)
	or	 r2,r0,r21
	ld	 r4,r25,lo16(_overloads_to_forget)
	bsr.n	 _tree_cons
	or	 r3,r0,r24
	st	 r2,r25,lo16(_overloads_to_forget)
@L4754:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,106
	bb1	 ne,r13,@L4756
	ld	 r24,r24,16
@L4756:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1.n	 ne,r13,@L6450
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r24,80
	ld	 r12,r22,80
	ld.bu	 r13,r0,r13
	ld.bu	 r12,r0,r12
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L4757
	ld	 r2,r24,4
	ld	 r3,r22,4
	bsr.n	 _comptypes
	or	 r4,r0,1
	bcnd.n	 eq0,r2,@L4757
	or.u	 r13,r0,hi16(_current_lang_stack)
	or.u	 r12,r0,hi16(_current_lang_base)
	ld	 r13,r13,lo16(_current_lang_stack)
	ld	 r12,r12,lo16(_current_lang_base)
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L6390
	or.u	 r3,r0,hi16(@LC92)
	or	 r2,r0,r22
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC92)
	or.u	 r3,r0,hi16(@LC93)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC93)
@L4757:
	or.u	 r13,r0,hi16(_pedantic)
@L6450:
	ld	 r13,r13,lo16(_pedantic)
	bcnd	 eq0,r13,@L4760
	ld.bu	 r13,r24,8
	cmp	 r13,r13,33
	bb1.n	 ne,r13,@L4760
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13,132
	ld.b	 r2,r0,r13
	cmp	 r2,r2,100
	or	 r3,r0,143
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	or.u	 r3,r0,hi16(@LC94)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC94)
	or.u	 r3,r0,hi16(@LC95)
	or	 r2,r0,r22
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC95)
@L4760:
	or	 r2,r0,r21
	or	 r3,r0,r24
	bsr.n	 _tree_cons
	or	 r4,r0,0
	or	 r24,r0,r2
	ld	 r2,r24,12
	br.n	 @L6391
	or	 r3,r0,r22
	align	 4
@L4749:
	ld	 r13,r24,16
	bcnd	 eq0,r13,@L6392
	ld.bu	 r13,r23,8
	cmp	 r13,r13,129
	bb0	 ne,r13,@L4748
	or	 r25,r0,r24
	ld	 r23,r23,60
@L4766:
	ld	 r11,r25,16
	ld.bu	 r13,r11,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L4767
	ld	 r13,r11,80
	ld	 r12,r22,80
	ld.bu	 r13,r0,r13
	ld.bu	 r12,r0,r12
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L4767
	ld	 r2,r11,4
	ld	 r3,r22,4
	bsr.n	 _comptypes
	or	 r4,r0,1
	bcnd	 eq0,r2,@L4767
	or.u	 r3,r0,hi16(@LC96)
	or	 r2,r0,r22
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC96)
	or.u	 r3,r0,hi16(@LC97)
	ld	 r2,r25,16
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC97)
@L4767:
	ld	 r12,r25,16
	ld.bu	 r13,r12,8
	cmp	 r13,r13,129
	bb1	 eq,r13,@L4765
	ld	 r13,r12,60
	cmp	 r13,r13,r23
	bb0	 ne,r13,@L6286
@L4765:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L4766
@L4748:
	ld	 r13,r22,80
	ld.bu	 r13,r0,r13
	bcnd	 ne0,r13,@L4770
	bcnd.n	 eq0,r24,@L4770
	or	 r25,r0,r24
@L4775:
	ld	 r13,r25,16
	ld	 r13,r13,80
	ld.bu	 r13,r0,r13
	cmp	 r13,r13,1
	bb0	 eq,r13,@L4772
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L4775
@L4772:
	bcnd	 eq0,r25,@L4770
	or.u	 r3,r0,hi16(@LC98)
	or	 r2,r0,r22
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC98)
	or.u	 r3,r0,hi16(@LC99)
	ld	 r2,r25,16
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC99)
@L4770:
	or.u	 r13,r0,hi16(_flag_traditional)
	ld	 r13,r13,lo16(_flag_traditional)
	bcnd.n	 ne0,r13,@L6451
	or	 r2,r0,r21
	bcnd	 eq0,r24,@L4778
	ld	 r13,r24,8
	bb0	 (31-10),r13,@L6451
@L4778:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r12,r13,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd	 ne0,r13,@L4817
	ld	 r13,r12,32
	bb1.n	 (31-29),r13,@L6451
	or	 r2,r0,r21
	or.u	 r25,r0,hi16(_overloads_to_forget)
	ld	 r4,r25,lo16(_overloads_to_forget)
	bsr.n	 _tree_cons
	or	 r3,r0,r24
	br.n	 @L4817
	st	 r2,r25,lo16(_overloads_to_forget)
	align	 4
@L4746:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,129
	bb1	 ne,r13,@L4781
	ld	 r2,r24,44
	ld	 r11,r2,36
	bcnd	 eq0,r11,@L4783
	ld.bu	 r2,r11,8
	cmp	 r2,r2,132
	or	 r3,r0,145
	extu	 r2,r2,1<eq>
	or	 r24,r0,r23
	bsr.n	 _my_friendly_assert
	addu	 r1,r1,@L6515
@L6516:
	align	 4
@L4783:
	ld.bu	 r2,r2,8
	mask	 r13,r2,0xff
	cmp	 r13,r13,29
	bb1.n	 ne,r13,@L4786
	subu	 r13,r2,32
	ld	 r21,r23,32
	ld	 r13,r23,28
	ld	 r24,r21,20
	or	 r22,r0,r23
	or	 r13,r13,1024
	bcnd.n	 eq0,r24,@L4788
	st	 r13,r23,28
	ld.bu	 r12,r24,8
	cmp	 r13,r12,3
	bb0	 ne,r13,@L4789
	ld	 r13,r23,80
	ld.bu	 r13,r0,r13
	bcnd.n	 ne0,r13,@L4794
	cmp	 r13,r12,29
	bb1	 ne,r13,@L4791
	ld	 r13,r24,80
	ld.bu	 r13,r0,r13
	bcnd.n	 ne0,r13,@L4794
	or.u	 r3,r0,hi16(@LC90)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC90)
	or.u	 r3,r0,hi16(@LC91)
	or	 r2,r0,r24
	or	 r3,r3,lo16(@LC91)
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L6517
@L6518:
	align	 4
@L4791:
	bsr.n	 _my_friendly_abort
	or	 r2,r0,9
@L4794:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,106
	bb1	 ne,r13,@L4796
	ld	 r24,r24,16
@L4796:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1.n	 ne,r13,@L6452
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r24,80
	ld	 r12,r22,80
	ld.bu	 r13,r0,r13
	ld.bu	 r12,r0,r12
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L4797
	ld	 r2,r24,4
	ld	 r3,r22,4
	bsr.n	 _comptypes
	or	 r4,r0,1
	bcnd.n	 eq0,r2,@L4797
	or.u	 r13,r0,hi16(_current_lang_stack)
	or.u	 r12,r0,hi16(_current_lang_base)
	ld	 r13,r13,lo16(_current_lang_stack)
	ld	 r12,r12,lo16(_current_lang_base)
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L4798
	or.u	 r3,r0,hi16(@LC92)
@L6390:
	ld	 r13,r24,80
	ld	 r12,r22,80
	ld.bu	 r13,r0,r13
	or	 r23,r0,r24
	br.n	 @L4781
	st.b	 r13,r0,r12
	align	 4
@L4798:
	or	 r2,r0,r22
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC92)
	or.u	 r3,r0,hi16(@LC93)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC93)
@L4797:
	or.u	 r13,r0,hi16(_pedantic)
@L6452:
	ld	 r13,r13,lo16(_pedantic)
	bcnd	 eq0,r13,@L4800
	ld.bu	 r13,r24,8
	cmp	 r13,r13,33
	bb1.n	 ne,r13,@L4800
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13,132
	ld.b	 r2,r0,r13
	cmp	 r2,r2,100
	or	 r3,r0,143
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	or.u	 r3,r0,hi16(@LC94)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC94)
	or.u	 r3,r0,hi16(@LC95)
	or	 r2,r0,r22
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC95)
@L4800:
	or	 r2,r0,r21
	or	 r3,r0,r24
	bsr.n	 _tree_cons
	or	 r4,r0,0
	or	 r24,r0,r2
	ld	 r2,r24,12
	br.n	 @L6391
	or	 r3,r0,r22
	align	 4
@L4789:
	ld	 r13,r24,16
	bcnd	 ne0,r13,@L4801
@L6392:
	br.n	 @L4781
	st	 r23,r24,16
	align	 4
@L4801:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,129
	bb0	 ne,r13,@L4788
	or	 r25,r0,r24
	ld	 r23,r23,60
@L4806:
	ld	 r11,r25,16
	ld.bu	 r13,r11,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L4807
	ld	 r13,r11,80
	ld	 r12,r22,80
	ld.bu	 r13,r0,r13
	ld.bu	 r12,r0,r12
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L4807
	ld	 r2,r11,4
	ld	 r3,r22,4
	bsr.n	 _comptypes
	or	 r4,r0,1
	bcnd	 eq0,r2,@L4807
	or.u	 r3,r0,hi16(@LC96)
	or	 r2,r0,r22
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC96)
	or.u	 r3,r0,hi16(@LC97)
	ld	 r2,r25,16
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC97)
@L4807:
	ld	 r12,r25,16
	ld.bu	 r13,r12,8
	cmp	 r13,r13,129
	bb1	 eq,r13,@L4805
	ld	 r13,r12,60
	cmp	 r13,r13,r23
	bb0	 ne,r13,@L6286
@L4805:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L4806
@L4788:
	ld	 r13,r22,80
	ld.bu	 r13,r0,r13
	bcnd.n	 ne0,r13,@L6451
	or	 r2,r0,r21
	bcnd.n	 eq0,r24,@L6451
	or	 r25,r0,r24
@L4815:
	ld	 r13,r25,16
	ld	 r13,r13,80
	ld.bu	 r13,r0,r13
	cmp	 r13,r13,1
	bb0	 eq,r13,@L4812
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L4815
@L4812:
	bcnd.n	 eq0,r25,@L4817
	or.u	 r3,r0,hi16(@LC98)
	or	 r2,r0,r22
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC98)
	or.u	 r3,r0,hi16(@LC99)
	ld	 r2,r25,16
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC99)
@L4817:
	or	 r2,r0,r21
@L6451:
	or	 r3,r0,r22
@L6391:
	bsr.n	 _tree_cons
	or	 r4,r0,r24
	or.u	 r13,r0,hi16(_unknown_type_node)
	ld	 r13,r13,lo16(_unknown_type_node)
	or	 r24,r0,r2
	st	 r24,r21,20
	or	 r23,r0,r22
	br.n	 @L4781
	st	 r13,r24,4
	align	 4
@L4786:
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L4822
	or.u	 r2,r0,hi16(@LC215)
	or	 r2,r2,lo16(@LC215)
	or	 r24,r0,0
	bsr.n	 _sorry
	addu	 r1,r1,@L6519
@L6520:
	align	 4
@L6286:
	br.n	 @L4781
	or	 r23,r0,r22
	align	 4
@L4822:
	bsr.n	 _my_friendly_abort
	or	 r2,r0,14
@L4781:
	bcnd	 eq0,r19,@L4824
	ld.bu	 r12,r23,8
	cmp	 r13,r12,34
	bb0	 ne,r13,@L4824
	ld	 r13,r23,8
	bb0.n	 (31-13),r13,@L4825
	cmp	 r13,r12,33
	cmp	 r12,r12,36
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L6453
	or.u	 r13,r0,hi16(_flag_cadillac)
@L4825:
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L6453
	or.u	 r13,r0,hi16(_flag_cadillac)
	or.u	 r13,r0,hi16(_debug_temp_inits)
	ld	 r13,r13,lo16(_debug_temp_inits)
	bcnd	 eq0,r13,@L4824
	ld	 r13,r20,24
	bb1.n	 (31-20),r13,@L6453
	or.u	 r13,r0,hi16(_flag_cadillac)
	ld.bu	 r13,r20,8
	cmp	 r13,r13,15
	bb0.n	 ne,r13,@L6453
	or.u	 r13,r0,hi16(_flag_cadillac)
	bsr	 _temporary_allocation
@L4824:
	or.u	 r13,r0,hi16(_flag_cadillac)
@L6453:
	ld	 r13,r13,lo16(_flag_cadillac)
	bcnd.n	 eq0,r13,@L4668
	or	 r24,r0,r23
	bsr.n	 _cadillac_start_decl
	or	 r2,r0,r23
	or	 r24,r0,r23
@L4668:
	ld	 r3,r31,276
	or	 r2,r0,r24
	or	 r4,r0,0
	bsr.n	 _finish_decl
	or	 r5,r0,1
@L6442:
	br.n	 @L6258
	or	 r2,r0,0
	align	 4
@L4660:
	bsr.n	 _parmlist_is_random
	ld	 r2,r24,20
	bcnd	 eq0,r2,@L4837
	ld	 r24,r24,16
	ld.bu	 r13,r24,8
	cmp	 r13,r13,124
	bb1	 ne,r13,@L4832
	ld	 r13,r24,12
	bcnd	 eq0,r13,@L4833
	bsr.n	 _my_friendly_abort
	or	 r2,r0,15
@L4833:
	ld	 r24,r24,20
@L4832:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,1
	bb1	 ne,r13,@L4834
	ld	 r16,r24,16
@L4834:
	bcnd.n	 eq0,r16,@L4835
	or.u	 r2,r0,hi16(@LC255)
	or	 r3,r0,r16
	or	 r2,r2,lo16(@LC255)
	bsr.n	 _error
	addu	 r1,r1,@L6521
@L6522:
	align	 4
@L4835:
	or.u	 r2,r0,hi16(@LC256)
	or	 r2,r2,lo16(@LC256)
	bsr.n	 _error
	addu	 r1,r1,@L6523
@L6524:
	align	 4
@L4637:
	or	 r24,r0,r17
@L4837:
	bcnd	 eq0,r24,@L4839
@L4840:
	ld.bu	 r11,r24,8
	or.u	 r13,r0,hi16(@L4889)
	cmp	 r12,r11,126
	bb0.n	 ls,r12,@L4888
	or	 r13,r13,lo16(@L4889)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L4889:
	word	 @L6397
	word	 @L4857
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4860
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4860
	word	 @L4860
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4853
	word	 @L4888
	word	 @L4888
	word	 @L4853
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L6394
	word	 @L4888
	word	 @L4854
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4843
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4853
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4888
	word	 @L4866
	word	 @L4888
	word	 @L4864
	align	 4
@L4843:
	ld	 r8,r31,300
	cmp	 r2,r8,0
	or	 r3,r0,152
	extu	 r2,r2,1<eq>
	bsr.n	 _my_friendly_assert
	ld	 r23,r24,16
	or	 r25,r0,0
	ld.bu	 r2,r23,8
	or	 r8,r0,1
	or	 r3,r0,153
	st	 r8,r31,300
	cmp	 r2,r2,1
	or	 r8,r0,2
	extu	 r2,r2,1<eq>
	bsr.n	 _my_friendly_assert
	st	 r8,r31,284
	bcnd.n	 ne0,r20,@L4844
	or	 r2,r0,r20
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r13,r13,lo16(_current_class_type)
	bcnd.n	 ne0,r13,@L4845
	or.u	 r13,r0,hi16(_current_class_name)
	or.u	 r2,r0,hi16(@LC257)
	or	 r2,r2,lo16(@LC257)
	st	 r0,r31,300
	bsr.n	 _error
	addu	 r1,r1,@L6525
@L6526:
	align	 4
@L4845:
	ld	 r2,r13,lo16(_current_class_name)
@L4844:
	bsr	 _constructor_name
	cmp	 r13,r2,r23
	bb0	 ne,r13,@L4848
	or	 r25,r0,r2
@L4848:
	bcnd	 eq0,r25,@L4850
	ld	 r3,r23,16
	or.u	 r2,r0,hi16(@LC258)
	ld	 r4,r25,16
	bsr.n	 _error
	or	 r2,r2,lo16(@LC258)
	st	 r25,r24,16
@L4850:
	br.n	 @L4838
	or	 r24,r0,r23
	align	 4
@L4853:
	ld.bu	 r8,r24,8
	st	 r8,r31,260
@L6394:
	ld	 r24,r24,16
	br.n	 @L4838
	or	 r20,r0,0
	align	 4
@L4854:
	ld	 r8,r31,148
	cmp	 r13,r20,0
	cmp	 r12,r8,3
	ld.bu	 r8,r24,8
	and	 r12,r12,r13
	st	 r8,r31,260
	extu	 r12,r12,1<eq>
	ld	 r24,r24,16
	bcnd.n	 eq0,r12,@L4855
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r20,r13,lo16(_current_class_type)
@L4855:
	cmp	 r13,r20,0
	cmp	 r12,r24,0
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd	 eq0,r13,@L4856
	ld	 r8,r31,300
	cmp	 r13,r8,1
	bb0	 ne,r13,@L4856
	bsr.n	 _constructor_name
	or	 r2,r0,r20
	cmp	 r2,r24,r2
	bb1.n	 ne,r2,@L4856
	or	 r8,r0,1
	st	 r8,r31,284
	or	 r18,r0,r20
@L4856:
	br.n	 @L4838
	or	 r20,r0,0
	align	 4
@L4857:
	ld	 r16,r24,16
	st	 r24,r31,292
@L6397:
	br.n	 @L4838
	or	 r24,r0,0
	align	 4
@L4860:
	or.u	 r2,r0,hi16(@LC259)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC259)
	ld	 r8,r24,48
	bcnd.n	 eq0,r8,@L4862
	st	 r8,r31,292
	ld.bu	 r13,r8,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L4861
	ld	 r8,r8,32
	st	 r8,r31,292
@L4861:
	ld	 r8,r31,292
	bcnd	 eq0,r8,@L4862
	ld	 r16,r8,16
	br	 @L4863
	align	 4
@L4862:
	or.u	 r13,r0,hi16(@LC260)
	or	 r16,r13,lo16(@LC260)
@L4863:
	ld	 r4,r31,140
	or	 r2,r0,0
	or	 r3,r0,r24
	bsr.n	 _temp_tree_cons
	or	 r24,r0,0
	br.n	 @L4838
	st	 r2,r31,140
	align	 4
@L4864:
	bcnd.n	 eq0,r20,@L6287
	or	 r20,r0,0
	ld	 r8,r31,300
	or	 r3,r0,154
	cmp	 r2,r8,0
	or	 r8,r0,3
	st	 r8,r31,300
	extu	 r2,r2,1<eq>
	bsr.n	 _my_friendly_assert
	st	 r8,r31,284
	or.u	 r13,r0,hi16(@LC262)
	ld	 r24,r24,16
	br.n	 @L4838
	or	 r16,r13,lo16(@LC262)
	align	 4
@L4866:
	cmp	 r13,r21,1
	bb1	 ne,r13,@L4867
	or.u	 r2,r0,hi16(@LC263)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC263)
@L4867:
	ld	 r25,r24,16
	bcnd.n	 ne0,r25,@L4868
	addu	 r21,r21,1
	br.n	 @L4869
	or	 r20,r0,0
	align	 4
@L4868:
	ld.bu	 r12,r25,8
	subu	 r13,r12,21
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4871
	mask	 r13,r12,0xff
	cmp	 r13,r13,132
	bb1.n	 ne,r13,@L4870
	or	 r2,r0,r25
@L4871:
	br.n	 @L4869
	or	 r20,r0,r25
	align	 4
@L4870:
	bsr.n	 _is_aggr_typedef
	or	 r3,r0,1
	bcnd	 ne0,r2,@L4873
	st	 r0,r24,16
	br	 @L4869
	align	 4
@L4873:
	ld	 r13,r24,20
	bcnd	 eq0,r13,@L4875
	ld.bu	 r13,r13,8
	cmp	 r13,r13,39
	bb1	 ne,r13,@L4875
	ld	 r13,r25,4
	br.n	 @L4869
	st	 r13,r24,16
	align	 4
@L4875:
	bcnd.n	 eq0,r20,@L4881
	or.u	 r13,r0,hi16(_current_class_depth)
	ld	 r12,r24,12
	ld	 r13,r13,lo16(_current_class_depth)
	cmp	 r12,r12,r13
	bb0	 ne,r12,@L6396
	ld	 r2,r25,4
	or	 r3,r0,r20
	or	 r4,r0,0
	bsr.n	 _get_base_distance
	or	 r5,r0,0
	bcnd	 ge0,r2,@L4881
	ld	 r13,r20,48
	ld	 r13,r13,32
	ld	 r3,r25,16
	or.u	 r2,r0,hi16(@LC264)
	ld	 r4,r13,16
	bsr.n	 _error
	or	 r2,r2,lo16(@LC264)
	br.n	 @L4869
	st	 r0,r24,16
	align	 4
@L4881:
	ld	 r20,r25,4
@L6396:
	st	 r20,r24,16
@L4869:
	ld	 r24,r24,20
	bcnd	 eq0,r20,@L4838
	ld.bu	 r13,r24,8
	cmp	 r13,r13,1
	bb1	 ne,r13,@L4884
	bsr.n	 _constructor_name
	or	 r2,r0,r20
	cmp	 r2,r2,r24
	bb1.n	 ne,r2,@L4884
	or	 r8,r0,1
	st	 r8,r31,284
	br.n	 @L4838
	or	 r18,r0,r20
	align	 4
@L4884:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,85
	bb1	 ne,r13,@L4838
	ld	 r13,r24,16
	ld.bu	 r13,r13,8
	cmp	 r13,r13,1
	bb1	 ne,r13,@L4838
	bsr.n	 _constructor_name
	or	 r2,r0,r20
	ld	 r13,r24,16
	cmp	 r13,r2,r13
	bb1.n	 ne,r13,@L4838
	or	 r8,r0,2
	st	 r8,r31,284
	or	 r8,r0,1
	st	 r8,r31,300
	or	 r18,r0,r20
	br.n	 @L4838
	or	 r24,r0,r2
	align	 4
@L4888:
	or	 r2,r0,0
	bsr.n	 _my_friendly_assert
	or	 r3,r0,155
@L4838:
	bcnd	 ne0,r24,@L4840
@L4839:
	bcnd.n	 ne0,r16,@L4891
	or.u	 r13,r0,hi16(@LC265)
	or	 r16,r13,lo16(@LC265)
@L4891:
	ld	 r8,r31,252
	cmp	 r13,r8,0
	ld	 r8,r31,260
	cmp	 r12,r8,50
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 ne0,r13,@L6258
	or	 r2,r0,0
	ld	 r8,r31,148
	bcnd.n	 ne0,r8,@L4893
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	ld	 r13,r13,28
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L4893
	or	 r8,r0,2
	st	 r8,r31,148
@L4893:
	ld	 r21,r31,140
	bcnd.n	 eq0,r21,@L4895
	or.u	 r8,r0,hi16(_ridpointers+4)
	or	 r8,r8,lo16(_ridpointers+4)
	subu	 r20,r8,4
@L4897:
	ld.bu	 r13,r21,8
	cmp	 r13,r13,3
	ld	 r24,r21,16
	bb1	 ne,r13,@L6442
	ld.bu	 r13,r24,8
	cmp	 r13,r13,1
	bb0.n	 eq,r13,@L4899
	or.u	 r13,r0,hi16(_ridpointers+4)
	ld	 r13,r13,lo16(_ridpointers+4)
	cmp	 r13,r24,r13
	bb1	 ne,r13,@L4900
	bcnd.n	 eq0,r22,@L4901
	or.u	 r2,r0,hi16(@LC266)
	or	 r2,r2,lo16(@LC266)
	bsr.n	 _error
	addu	 r1,r1,@L6527
@L6528:
	align	 4
@L4901:
	ld	 r13,r24,20
	or	 r8,r0,1
	st	 r8,r31,220
	ld	 r22,r13,4
	br	 @L4896
	align	 4
@L4900:
	or.u	 r8,r0,hi16(_ridpointers+4)
	or	 r8,r8,lo16(_ridpointers+4)
	ld	 r13,r8,4
	cmp	 r13,r24,r13
	bb1	 ne,r13,@L4904
	bcnd.n	 eq0,r22,@L4905
	or.u	 r2,r0,hi16(@LC267)
	or	 r2,r2,lo16(@LC267)
	bsr.n	 _error
	addu	 r1,r1,@L6529
@L6530:
	align	 4
@L4905:
	ld	 r13,r24,20
	or	 r8,r0,1
	st	 r8,r31,228
	ld	 r22,r13,4
	br	 @L4896
	align	 4
@L4904:
	or.u	 r8,r0,hi16(_ridpointers+4)
	or	 r8,r8,lo16(_ridpointers+4)
	ld	 r13,r8,92
	cmp	 r13,r24,r13
	bb1	 ne,r13,@L4907
	bcnd.n	 eq0,r22,@L4908
	or.u	 r2,r0,hi16(@LC268)
	or	 r2,r2,lo16(@LC268)
	bsr.n	 _error
	addu	 r1,r1,@L6531
@L6532:
	align	 4
@L4908:
	ld	 r13,r24,20
	ld	 r22,r13,4
	br	 @L4896
	align	 4
@L4907:
	ld	 r13,r24,4
	bcnd.n	 eq0,r13,@L4910
	or	 r25,r0,12
	bcnd	 eq0,r22,@L4911
	ld	 r3,r22,16
	or.u	 r2,r0,hi16(@LC269)
	ld	 r4,r24,16
	or	 r2,r2,lo16(@LC269)
	bsr.n	 _error
	addu	 r1,r1,@L6533
@L6534:
	align	 4
@L4911:
	br.n	 @L4896
	or	 r22,r0,r13
	align	 4
@L4910:
@L4916:
	ld	 r13,r20[r25]
	cmp	 r13,r13,r24
	bb1.n	 ne,r13,@L6367
	addu	 r23,r25,1
	cmp	 r13,r25,14
	bb1	 ne,r13,@L6369
	bb0.n	 (31-17),r14,@L6372
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	bcnd.n	 eq0,r13,@L6370
	or.u	 r2,r0,hi16(@LC270)
	ld	 r3,r24,16
	or	 r2,r2,lo16(@LC270)
	bsr.n	 _pedwarn
	addu	 r1,r1,@L6535
@L6536:
	align	 4
@L6370:
	bcnd.n	 eq0,r19,@L6371
	or.u	 r2,r0,hi16(@LC271)
	or	 r2,r2,lo16(@LC271)
	bsr.n	 _error
	addu	 r1,r1,@L6537
@L6538:
	align	 4
@L6371:
	br.n	 @L6372
	or	 r19,r0,1
	align	 4
@L6369:
	ext	 r13,r14,r25
	bb0.n	 (31-31),r13,@L6372
	or.u	 r2,r0,hi16(@LC272)
	ld	 r3,r24,16
	bsr.n	 _warning
	or	 r2,r2,lo16(@LC272)
@L6372:
	or	 r13,r0,1
	mak	 r13,r13,r25
	br.n	 @L4896
	or	 r14,r14,r13
	align	 4
@L6367:
	ld	 r13,r20[r23]
	cmp	 r13,r13,r24
	bb1.n	 ne,r13,@L6374
	cmp	 r13,r23,14
	bb1	 ne,r13,@L6376
	bb0.n	 (31-17),r14,@L6379
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	bcnd.n	 eq0,r13,@L6377
	or.u	 r2,r0,hi16(@LC270)
	ld	 r3,r24,16
	or	 r2,r2,lo16(@LC270)
	bsr.n	 _pedwarn
	addu	 r1,r1,@L6539
@L6540:
	align	 4
@L6377:
	bcnd.n	 eq0,r19,@L6378
	or.u	 r2,r0,hi16(@LC271)
	or	 r2,r2,lo16(@LC271)
	bsr.n	 _error
	addu	 r1,r1,@L6541
@L6542:
	align	 4
@L6378:
	br.n	 @L6379
	or	 r19,r0,1
	align	 4
@L6376:
	ext	 r13,r14,r23
	bb0.n	 (31-31),r13,@L6379
	or.u	 r2,r0,hi16(@LC272)
	ld	 r3,r24,16
	bsr.n	 _warning
	or	 r2,r2,lo16(@LC272)
@L6379:
	or	 r13,r0,1
	mak	 r13,r13,r23
	br.n	 @L4896
	or	 r14,r14,r13
	align	 4
@L6374:
	addu	 r25,r25,2
	cmp	 r13,r25,31
	bb1	 le,r13,@L4916
@L4899:
	bcnd.n	 eq0,r22,@L4926
	or.u	 r2,r0,hi16(@LC273)
	or	 r3,r0,r16
	or	 r2,r2,lo16(@LC273)
	bsr.n	 _error
	addu	 r1,r1,@L6543
@L6544:
	align	 4
@L4926:
	ld.bu	 r12,r24,8
	cmp	 r13,r12,1
	bb1.n	 ne,r13,@L4928
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r12,r13,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r12,r12,r13
	bb0.n	 ne,r12,@L4930
	or	 r25,r0,1
	ld	 r2,r24,24
	bcnd.n	 ne0,r2,@L4931
	or	 r3,r0,r2
@L4930:
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r2,r13,lo16(_current_class_type)
	bcnd	 eq0,r2,@L4932
	ld	 r3,r24,28
	bcnd	 ne0,r3,@L6265
	ld	 r13,r2,16
	bcnd	 ne0,r13,@L4933
	ld	 r13,r2,80
	ld	 r13,r0,r13
	bb0	 (31-24),r13,@L4933
	subu	 r5,r0,1
	or	 r3,r0,r24
	cmp	 r5,r25,r5
	or	 r4,r0,0
	bsr.n	 _lookup_field
	extu	 r5,r5,1<eq>
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	or	 r3,r0,r2
	cmp	 r13,r3,r13
	bb0	 ne,r13,@L4929
	bcnd	 eq0,r3,@L6264
	ld.bu	 r13,r3,8
	cmp	 r13,r13,32
	ext	 r13,r13,1<eq>
	and	 r3,r3,r13
@L4933:
	bcnd	 ne0,r3,@L6265
@L6264:
	bsr.n	 _lookup_nested_field
	or	 r2,r0,r24
	or	 r3,r0,r2
	bcnd	 ne0,r3,@L6265
@L4932:
	ld	 r3,r24,20
@L4931:
	bcnd.n	 eq0,r3,@L4929
	or	 r2,r0,r3
@L6265:
	ld.bu	 r13,r3,8
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L4939
	or.u	 r13,r0,hi16(_looking_for_typename)
	ld	 r11,r13,lo16(_looking_for_typename)
	bcnd	 lt0,r11,@L4939
	ld	 r4,r24,4
	bcnd	 eq0,r4,@L4942
	ld	 r4,r4,48
	subu	 r13,r0,r25
	cmp	 r12,r3,r4
	subu	 r13,r0,r13
	extu	 r12,r12,1<eq>
	or	 r12,r12,r13
	bcnd.n	 ne0,r12,@L4929
	or	 r2,r0,r4
	bcnd	 gt0,r11,@L4929
	or	 r2,r0,r24
	bsr.n	 _arbitrate_lookup
	addu	 r1,r1,@L6545
@L6546:
	align	 4
@L4942:
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r2,r3,4
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r2,r13
	bb0	 ne,r13,@L4929
@L4939:
	or	 r2,r0,r3
@L4929:
	bcnd	 eq0,r2,@L4948
	ld.bu	 r13,r2,8
	cmp	 r13,r13,32
	bb0	 ne,r13,@L4947
@L4948:
	or.u	 r2,r0,hi16(@LC274)
	ld	 r3,r24,16
	or	 r2,r2,lo16(@LC274)
	bsr.n	 _error
	addu	 r1,r1,@L6547
@L6548:
	align	 4
@L4947:
	st	 r2,r31,236
	ld	 r22,r2,4
	br	 @L4896
	align	 4
@L4928:
	bcnd	 eq0,r12,@L4896
	or	 r22,r0,r24
@L4896:
	ld	 r21,r0,r21
	bcnd	 ne0,r21,@L4897
@L4895:
	bcnd.n	 ne0,r22,@L4953
	st	 r22,r31,244
	ld	 r8,r31,284
	cmp	 r13,r8,2
	subu	 r8,r0,1
	bb0.n	 ne,r13,@L6399
	st	 r8,r31,220
	ld	 r8,r31,284
	cmp	 r13,r8,1
	bb1	 ne,r13,@L4956
	ld	 r22,r18,32
	br	 @L4959
	align	 4
@L4956:
	ld	 r8,r31,252
	bcnd.n	 eq0,r8,@L4958
	or.u	 r13,r0,hi16(_explicit_warn_return_type)
	ld	 r8,r31,284
	ld	 r13,r13,lo16(_explicit_warn_return_type)
	cmp	 r12,r8,0
	cmp	 r13,r13,0
	and.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L6454
	or.u	 r13,r0,hi16(_integer_type_node)
	and.u	 r13,r14,0x10
	and	 r13,r13,0x7000
	bcnd.n	 ne0,r13,@L6454
	or.u	 r13,r0,hi16(_integer_type_node)
	or.u	 r12,r0,hi16(_warn_about_return_type)
	or	 r13,r0,1
	st	 r13,r12,lo16(_warn_about_return_type)
@L4958:
	or.u	 r13,r0,hi16(_integer_type_node)
@L6454:
	ld	 r22,r13,lo16(_integer_type_node)
	br	 @L4959
	align	 4
@L4953:
	ld	 r8,r31,284
	cmp	 r13,r8,2
	bb1.n	 ne,r13,@L4960
	cmp	 r13,r8,1
	or.u	 r2,r0,hi16(@LC275)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC275)
@L6399:
	or.u	 r13,r0,hi16(_void_type_node)
	ld	 r22,r13,lo16(_void_type_node)
	br	 @L4959
	align	 4
@L4960:
	bb1.n	 ne,r13,@L4962
	or.u	 r2,r0,hi16(@LC276)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC276)
	ld	 r22,r18,32
	br	 @L4959
	align	 4
@L4962:
	bb0	 (31-6),r14,@L4959
	ld	 r13,r22,24
	bb0	 (31-22),r13,@L4959
	ld	 r13,r22,80
	ld	 r13,r0,r13
	bb1	 (31-30),r13,@L4959
	ld	 r13,r22,16
	bcnd	 ne0,r13,@L4959
	ld	 r2,r22,48
	ld	 r13,r2,32
	ld	 r12,r13,16
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1	 ne,r13,@L4965
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb0	 ne,r13,@L4959
@L4965:
	ld	 r8,r31,148
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r12,r13,lo16(_current_function_decl)
	cmp	 r13,r8,2
	cmp	 r12,r12,0
	and.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L4959
	or	 r21,r0,r2
	ld.bu	 r2,r21,8
	cmp	 r2,r2,32
	or	 r3,r0,144
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	ld	 r12,r21,32
	ld	 r13,r12,20
	cmp	 r13,r13,r21
	bb0	 ne,r13,@L4959
	ld	 r13,r12,4
	bcnd.n	 eq0,r13,@L4968
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	ld	 r3,r13,4
	bsr.n	 _value_member
	or	 r2,r0,r22
	bcnd	 ne0,r2,@L4959
@L4968:
	or.u	 r24,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r24,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	ld	 r25,r21,40
	bb0	 ne,r13,@L4971
	ld	 r3,r25,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r24,lo16(_current_binding_level)
	br.n	 @L4972
	st	 r2,r13,16
	align	 4
@L4971:
	or.u	 r24,r0,hi16(_class_binding_level)
	ld	 r13,r24,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L4972
	ld	 r3,r25,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r24,lo16(_class_binding_level)
	st	 r2,r13,16
@L4972:
	st	 r0,r25,4
	or.u	 r13,r0,hi16(_class_binding_level)
	ld	 r12,r21,32
	ld	 r13,r13,lo16(_class_binding_level)
	st	 r12,r21,40
	bcnd.n	 eq0,r13,@L4974
	st	 r0,r21,36
	br.n	 @L4975
	or	 r25,r0,r13
	align	 4
@L4974:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r25,r13,lo16(_current_binding_level)
@L4975:
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r13,lo16(_global_binding_level)
	cmp	 r13,r25,r12
	bb0	 ne,r13,@L4977
@L4978:
	ld	 r13,r25,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb0.n	 eq,r13,@L4979
	or	 r23,r0,0
	ld	 r24,r25,4
	bcnd	 eq0,r24,@L4979
@L4983:
	ld	 r13,r24,16
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L4985
	or	 r23,r0,r24
	ld	 r24,r0,r24
	bcnd	 ne0,r24,@L4983
@L4979:
	ld	 r25,r25,28
	cmp	 r13,r25,r12
	bb1	 ne,r13,@L4978
@L4977:
	ld	 r13,r25,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb1.n	 ne,r13,@L4959
	or	 r23,r0,0
	ld	 r24,r25,4
	bcnd	 eq0,r24,@L4959
@L4992:
	ld	 r13,r24,16
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L4994
	or	 r23,r0,r24
	ld	 r24,r0,r24
	bcnd	 eq0,r24,@L4959
	br	 @L4992
	align	 4
@L4994:
	or	 r4,r0,r22
	or	 r5,r0,0
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC117)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC117)
	bsr.n	 _my_friendly_abort
	or	 r2,r0,11
@L4985:
	bcnd	 eq0,r23,@L4996
	ld	 r13,r0,r24
	br.n	 @L4997
	st	 r13,r0,r23
	align	 4
@L4996:
	ld	 r13,r0,r24
	st	 r13,r25,4
@L4997:
	or.u	 r23,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r23,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	ld	 r25,r24,12
	cmp	 r13,r12,r13
	ld	 r20,r24,16
	bb0	 ne,r13,@L4999
	ld	 r3,r25,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r23,lo16(_current_binding_level)
	br.n	 @L5000
	st	 r2,r13,16
	align	 4
@L4999:
	or.u	 r23,r0,hi16(_class_binding_level)
	ld	 r13,r23,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L5000
	ld	 r3,r25,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r23,lo16(_class_binding_level)
	st	 r2,r13,16
@L5000:
	st	 r20,r25,4
	or.u	 r25,r0,hi16(_global_binding_level)
	ld	 r2,r24,12
	ld	 r13,r25,lo16(_global_binding_level)
	ld	 r3,r24,16
	bsr.n	 _perm_tree_cons
	ld	 r4,r13,4
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r12,r25,lo16(_global_binding_level)
	ld	 r13,r13,lo16(_current_class_type)
	bcnd.n	 eq0,r13,@L5002
	st	 r2,r12,4
	ld	 r13,r13,80
	ld	 r24,r13,48
	bcnd.n	 eq0,r24,@L5002
	or	 r23,r0,0
@L5006:
	ld	 r13,r24,16
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L5004
	or	 r23,r0,r24
	ld	 r24,r0,r24
	bcnd	 ne0,r24,@L5006
@L5004:
	bcnd.n	 eq0,r24,@L6455
	or.u	 r25,r0,hi16(_current_binding_level)
	bcnd	 eq0,r23,@L5010
	ld	 r13,r0,r24
	br.n	 @L6455
	st	 r13,r0,r23
	align	 4
@L5010:
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r13,r13,lo16(_current_class_type)
	ld	 r12,r13,80
	ld	 r13,r0,r24
	st	 r13,r12,48
@L5002:
	or.u	 r25,r0,hi16(_current_binding_level)
@L6455:
	or.u	 r23,r0,hi16(_global_binding_level)
	ld	 r24,r25,lo16(_current_binding_level)
	ld	 r13,r23,lo16(_global_binding_level)
	or	 r2,r0,r21
	bsr.n	 _pushdecl
	st	 r13,r25,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_class_binding_level)
	ld	 r13,r13,lo16(_class_binding_level)
	bcnd.n	 eq0,r13,@L5013
	st	 r24,r25,lo16(_current_binding_level)
	or	 r24,r0,r13
@L5013:
	ld.bu	 r13,r21,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L4959
	ld	 r10,r21,32
	ld	 r12,r23,lo16(_global_binding_level)
	cmp	 r13,r24,r12
	bb0.n	 ne,r13,@L5016
	or	 r11,r0,0
	or	 r9,r0,r12
@L5018:
	ld	 r12,r24,16
	bcnd	 eq0,r12,@L5017
@L5022:
	ld	 r13,r12,12
	cmp	 r13,r13,r10
	bb1	 ne,r13,@L5021
	addu	 r11,r12,16
@L5021:
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L5022
@L5017:
	ld	 r24,r24,28
	cmp	 r13,r24,r9
	bb1	 ne,r13,@L5018
@L5016:
	ld	 r2,r21,4
	bcnd	 ne0,r11,@L5026
	st	 r2,r10,4
	br	 @L4959
	align	 4
@L5026:
	st	 r2,r0,r11
@L4959:
	bb0.n	 (31-17),r14,@L5028
	or	 r20,r0,0
	or.u	 r13,r0,hi16(_double_type_node)
	ld	 r12,r22,64
	ld	 r13,r13,lo16(_double_type_node)
	cmp	 r12,r12,r13
	bb1	 ne,r12,@L5028
	ld	 r4,r22,8
	or.u	 r13,r0,hi16(_long_double_type_node)
	extu	 r3,r4,1<18>
	ld	 r2,r13,lo16(_long_double_type_node)
	extu	 r4,r4,1<19>
	bsr.n	 _build_type_variant
	and	 r14,r14,0xbfff
	or	 r22,r0,r2
@L5028:
	and.u	 r13,r14,0x10
	and	 r13,r13,0x7000
	bcnd	 eq0,r13,@L5029
	ld.bu	 r12,r22,8
	cmp	 r13,r12,8
	bb1.n	 ne,r13,@L5030
	or	 r25,r0,0
	or.u	 r2,r0,hi16(@LC277)
	or	 r3,r0,r16
	or	 r2,r2,lo16(@LC277)
	bsr.n	 _error
	addu	 r1,r1,@L6549
@L6550:
	align	 4
@L5030:
	cmp	 r13,r12,7
	bb1.n	 ne,r13,@L6456
	or.u	 r2,r0,hi16(@LC278)
	or.u	 r13,r0,hi16(_wchar_type_node)
	ld	 r13,r13,lo16(_wchar_type_node)
	cmp	 r13,r22,r13
	bb1.n	 ne,r13,@L5032
	mask	 r12,r14,24576
	or.u	 r2,r0,hi16(@LC278)
@L6456:
	or	 r3,r0,r16
	or	 r2,r2,lo16(@LC278)
	bsr.n	 _error
	addu	 r1,r1,@L6551
@L6552:
	align	 4
@L5032:
	cmp	 r13,r12,24576
	bb1.n	 ne,r13,@L5035
	cmp	 r13,r12,0
	or.u	 r2,r0,hi16(@LC279)
	or	 r3,r0,r16
	or	 r2,r2,lo16(@LC279)
	bsr.n	 _error
	addu	 r1,r1,@L6553
@L6554:
	align	 4
@L5035:
	ld	 r8,r31,228
	cmp	 r11,r8,0
	or	 r13,r13,r11
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L5037
	or.u	 r2,r0,hi16(@LC280)
	or	 r3,r0,r16
	or	 r2,r2,lo16(@LC280)
	bsr.n	 _error
	addu	 r1,r1,@L6555
@L6556:
	align	 4
@L5037:
	or.u	 r12,r0,0x10
	or	 r12,r12,0x1000
	and	 r13,r14,r12
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L5041
	or.u	 r2,r0,hi16(@LC282)
	or	 r3,r0,r16
	or	 r2,r2,lo16(@LC282)
	bsr.n	 _error
	addu	 r1,r1,@L6557
@L6558:
	align	 4
@L5041:
	ld	 r8,r31,220
	cmp	 r13,r8,0
	and	 r13,r13,r11
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L5031
	or	 r25,r0,1
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	bcnd	 eq0,r13,@L5031
	or.u	 r2,r0,hi16(@LC283)
	or	 r3,r0,r16
	bsr.n	 _pedwarn
	or	 r2,r2,lo16(@LC283)
	or.u	 r13,r0,hi16(_flag_pedantic_errors)
	ld	 r13,r13,lo16(_flag_pedantic_errors)
	cmp	 r13,r13,0
	extu	 r25,r13,1<eq>
@L5031:
	bcnd	 ne0,r25,@L5029
	and.u	 r14,r14,0xffef
	and	 r14,r14,0x8fff
	or	 r19,r0,0
@L5029:
	bb1	 (31-19),r14,@L5047
	ld	 r8,r31,268
	bcnd.n	 eq0,r8,@L5046
	or.u	 r13,r0,hi16(_flag_traditional)
	ld	 r13,r13,lo16(_flag_traditional)
	bcnd.n	 ne0,r13,@L5047
	or.u	 r13,r0,hi16(_flag_signed_bitfields)
	ld	 r13,r13,lo16(_flag_signed_bitfields)
	bcnd	 ne0,r13,@L5046
	ld	 r8,r31,220
	cmp	 r12,r8,0
	ld	 r8,r31,228
	subu	 r13,r0,r8
	extu	 r12,r12,1<ne>
	subu	 r13,r0,r13
	or	 r12,r12,r13
	bcnd	 ne0,r12,@L5049
	ld	 r8,r31,236
	bcnd	 eq0,r8,@L5049
	ld	 r13,r8,28
	bb1	 (31-18),r13,@L5046
@L5049:
	ld.bu	 r13,r22,8
	cmp	 r13,r13,10
	bb0	 ne,r13,@L5046
	bb1.n	 (31-11),r14,@L6457
	or.u	 r13,r0,hi16(_char_type_node)
@L5047:
	bcnd.n	 eq0,r19,@L5050
	or.u	 r13,r0,hi16(_long_long_unsigned_type_node)
	ld	 r22,r13,lo16(_long_long_unsigned_type_node)
	br.n	 @L6458
	extu	 r8,r14,1<21>
	align	 4
@L5050:
	bb0.n	 (31-17),r14,@L5052
	or.u	 r13,r0,hi16(_long_unsigned_type_node)
	ld	 r22,r13,lo16(_long_unsigned_type_node)
	br.n	 @L6458
	extu	 r8,r14,1<21>
	align	 4
@L5052:
	bb0.n	 (31-18),r14,@L5054
	or.u	 r13,r0,hi16(_short_unsigned_type_node)
	ld	 r22,r13,lo16(_short_unsigned_type_node)
	br.n	 @L6458
	extu	 r8,r14,1<21>
	align	 4
@L5054:
	or.u	 r13,r0,hi16(_char_type_node)
	ld	 r13,r13,lo16(_char_type_node)
	cmp	 r13,r22,r13
	bb1.n	 ne,r13,@L5056
	or.u	 r13,r0,hi16(_unsigned_char_type_node)
	ld	 r22,r13,lo16(_unsigned_char_type_node)
	br.n	 @L6458
	extu	 r8,r14,1<21>
	align	 4
@L5056:
	ld	 r8,r31,236
	bcnd.n	 eq0,r8,@L5058
	or.u	 r13,r0,hi16(_unsigned_type_node)
	bsr.n	 _unsigned_type
	or	 r2,r0,r22
	br.n	 @L5060
	or	 r22,r0,r2
	align	 4
@L5058:
	ld	 r22,r13,lo16(_unsigned_type_node)
	br.n	 @L6458
	extu	 r8,r14,1<21>
	align	 4
@L5046:
	bb0.n	 (31-11),r14,@L5061
	or.u	 r13,r0,hi16(_char_type_node)
@L6457:
	ld	 r13,r13,lo16(_char_type_node)
	cmp	 r13,r22,r13
	bb1.n	 ne,r13,@L5061
	or.u	 r13,r0,hi16(_signed_char_type_node)
	ld	 r22,r13,lo16(_signed_char_type_node)
	br.n	 @L6458
	extu	 r8,r14,1<21>
	align	 4
@L5061:
	bcnd.n	 eq0,r19,@L5063
	or.u	 r13,r0,hi16(_long_long_integer_type_node)
	ld	 r22,r13,lo16(_long_long_integer_type_node)
	br.n	 @L6458
	extu	 r8,r14,1<21>
	align	 4
@L5063:
	bb0.n	 (31-17),r14,@L5065
	or.u	 r13,r0,hi16(_long_integer_type_node)
	ld	 r22,r13,lo16(_long_integer_type_node)
	br.n	 @L6458
	extu	 r8,r14,1<21>
	align	 4
@L5065:
	bb0.n	 (31-18),r14,@L5060
	or.u	 r13,r0,hi16(_short_integer_type_node)
	ld	 r22,r13,lo16(_short_integer_type_node)
@L5060:
	extu	 r8,r14,1<21>
@L6458:
	st	 r8,r31,172
	ld	 r13,r22,8
	extu	 r8,r14,1<22>
	st	 r8,r31,180
	ld	 r8,r31,172
	extu	 r12,r13,1<18>
	addu	 r8,r8,r12
	st	 r8,r31,172
	ld	 r8,r31,180
	extu	 r13,r13,1<19>
	addu	 r8,r8,r13
	st	 r8,r31,180
	ld	 r8,r31,172
	st	 r0,r31,212
	cmp	 r13,r8,1
	extu	 r8,r14,1<23>
	bb0.n	 gt,r13,@L5068
	st	 r8,r31,204
	or.u	 r2,r0,hi16(@LC284)
	bsr.n	 _warning
	or	 r2,r2,lo16(@LC284)
@L5068:
	ld	 r8,r31,180
	cmp	 r13,r8,1
	bb0	 gt,r13,@L5069
	or.u	 r2,r0,hi16(@LC285)
	bsr.n	 _warning
	or	 r2,r2,lo16(@LC285)
@L5069:
	mask.u	 r8,r14,0x400
	bb0.n	 (31-15),r14,@L5070
	st	 r8,r31,188
	ld	 r8,r31,148
	cmp	 r13,r8,3
	or	 r8,r0,1
	bb1.n	 ne,r13,@L5070
	st	 r8,r31,212
	or	 r8,r0,2
	st	 r8,r31,212
@L5070:
	ld	 r8,r31,188
	cmp	 r13,r8,0
	ld	 r8,r31,212
	cmp	 r12,r8,2
	and.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L5073
	or.u	 r2,r0,hi16(@LC286)
	or	 r3,r0,r16
	or	 r2,r2,lo16(@LC286)
	bsr.n	 _error
	st	 r0,r31,212
@L5073:
	mask.u	 r8,r14,0x200
	and.u	 r14,r14,0xf9ff
	bcnd.n	 eq0,r14,@L5074
	st	 r8,r31,196
	extu	 r13,r14,1<16>
	ld	 r8,r31,148
	addu	 r15,r15,r13
	extu	 r13,r14,1<17>
	addu	 r15,r15,r13
	cmp	 r25,r8,2
	cmp	 r13,r15,0
	rot	 r12,r25,30
	and	 r13,r12,r13
	extu	 r13,r13,1<gt>
	bcnd	 eq0,r13,@L5077
	or.u	 r2,r0,hi16(@LC287)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC287)
@L5077:
	bb0.n	 (31-12),r14,@L6459
	extu	 r13,r14,1<15>
	bb1	 ne,r25,@L5079
	or.u	 r2,r0,hi16(@LC288)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC288)
@L5079:
	addu	 r15,r15,1
	extu	 r13,r14,1<15>
@L6459:
	addu	 r15,r15,r13
	extu	 r13,r14,1<18>
	addu	 r15,r15,r13
@L5074:
	ld	 r8,r31,188
	bcnd.n	 eq0,r8,@L5082
	or.u	 r13,r0,hi16(_current_class_name)
	ld	 r13,r13,lo16(_current_class_name)
	bcnd.n	 ne0,r13,@L6460
	cmp	 r13,r15,1
	or.u	 r2,r0,hi16(@LC289)
	or	 r2,r2,lo16(@LC289)
	bsr.n	 _error
	st	 r0,r31,188
@L5082:
	cmp	 r13,r15,1
@L6460:
	bb0.n	 gt,r13,@L5083
	or.u	 r2,r0,hi16(@LC290)
	or	 r3,r0,r16
	br.n	 @L6402
	or	 r2,r2,lo16(@LC290)
	align	 4
@L5083:
	ld	 r8,r31,148
	cmp	 r12,r15,0
	cmp	 r13,r8,0
	rot	 r11,r13,30
	and.c	 r13,r12,r11
	extu	 r13,r13,1<gt>
	bcnd.n	 eq0,r13,@L5085
	cmp	 r12,r8,2
	bb0.n	 ne,r12,@L5084
	cmp	 r13,r8,3
	bb1	 ne,r13,@L5353
	bb0.n	 (31-12),r14,@L5088
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r12,r13,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L5090
	or	 r20,r0,3
	or.u	 r13,r0,hi16(_named_labels)
	ld	 r2,r13,lo16(_named_labels)
	cmp	 r2,r2,0
	or	 r3,r0,134
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
@L5090:
	or.u	 r12,r0,hi16(_free_binding_level)
	ld	 r2,r12,lo16(_free_binding_level)
	bcnd.n	 eq0,r2,@L5091
	or	 r25,r0,r2
	ld	 r13,r25,28
	br.n	 @L5092
	st	 r13,r12,lo16(_free_binding_level)
	align	 4
@L5091:
	bsr.n	 _xmalloc
	or	 r2,r0,36
	or	 r25,r0,r2
@L5092:
	or.u	 r3,r0,hi16(_clear_binding_level)
	subu	 r2,r25,60
	ld	 r4,r3,lo16(_clear_binding_level)
	or	 r3,r3,lo16(_clear_binding_level)
	or.u	 r13,r0,hi16(_keep_next_level_flag)
	subu	 r3,r3,60
	bsr.n	 ___movstrSI96x36
	ld	 r24,r13,lo16(_keep_next_level_flag)
	or.u	 r12,r0,hi16(_class_binding_level)
	ld	 r13,r12,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L5094
	st	 r13,r25,28
	br.n	 @L5095
	st	 r0,r12,lo16(_class_binding_level)
	align	 4
@L5094:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	st	 r13,r25,28
@L5095:
	ld	 r13,r25,32
	mak	 r11,r24,3<9>
	or	 r2,r0,r25
	or	 r13,r13,160
	or.u	 r12,r0,hi16(_current_binding_level)
	and	 r13,r13,0xf0ff
	st	 r2,r12,lo16(_current_binding_level)
	or	 r13,r13,r11
	bsr.n	 _GNU_xref_start_scope
	st	 r13,r2,32
	ld	 r21,r31,140
	or.u	 r13,r0,hi16(_have_extern_spec)
	ld	 r22,r31,156
	ld	 r12,r13,lo16(_have_extern_spec)
	or.u	 r13,r0,hi16(_keep_next_level_flag)
	or	 r18,r0,r22
	bcnd.n	 eq0,r12,@L5097
	st	 r0,r13,lo16(_keep_next_level_flag)
	or.u	 r25,r0,hi16(_used_extern_spec)
	ld	 r13,r25,lo16(_used_extern_spec)
	bcnd.n	 ne0,r13,@L5097
	or.u	 r2,r0,hi16(@LC208)
	bsr.n	 _get_identifier
	or	 r2,r2,lo16(@LC208)
	or	 r3,r0,r2
	or	 r2,r0,0
	bsr.n	 _decl_tree_cons
	or	 r4,r0,r21
	or	 r13,r0,1
	st	 r13,r25,lo16(_used_extern_spec)
	or	 r21,r0,r2
@L5097:
	or	 r2,r0,r17
	or	 r3,r0,r21
	or	 r4,r0,0
	or	 r5,r0,r22
	bsr.n	 _grokdeclarator
	or	 r6,r0,0
	or	 r24,r0,r2
	bcnd.n	 eq0,r24,@L5099
	or.u	 r13,r0,hi16(_void_type_node)
	ld	 r13,r13,lo16(_void_type_node)
	cmp	 r13,r24,r13
	bb1	 ne,r13,@L5098
@L5099:
	br.n	 @L5096
	or	 r19,r0,0
	align	 4
@L5098:
	ld	 r12,r24,8
	ld	 r19,r24,4
	bb0	 (31-18),r12,@L5100
	ld	 r13,r19,24
	bb0	 (31-21),r13,@L5100
	bb1.n	 (31-10),r12,@L5100
	or.u	 r2,r0,hi16(_permanent_obstack)
	or	 r2,r2,lo16(_permanent_obstack)
	bsr.n	 _push_obstacks
	or	 r3,r0,r2
	bsr.n	 _copy_node
	or	 r2,r0,r24
	ld.bu	 r13,r19,8
	cmp	 r13,r13,18
	bb1.n	 ne,r13,@L5101
	or	 r24,r0,r2
	ld	 r3,r19,12
	bcnd	 eq0,r3,@L5101
	ld	 r13,r3,8
	bb1	 (31-10),r13,@L5101
	bsr.n	 _copy_to_permanent
	ld	 r2,r3,56
	bsr	 _build_index_type
	or	 r3,r0,r2
	bsr.n	 _build_cplus_array_type
	ld	 r2,r19,4
	or	 r19,r0,r2
	st	 r19,r24,4
@L5101:
	bsr	 _pop_obstacks
@L5100:
	ld.bu	 r13,r19,8
	cmp	 r13,r13,21
	bb1	 ne,r13,@L5103
	ld	 r13,r19,80
	ld	 r13,r0,r13
	bb0	 (31-28),r13,@L5103
	or	 r19,r0,r24
	br	 @L6469
	align	 4
@L5103:
	bsr	 _push_obstacks_nochange
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L5104
	ld	 r13,r24,28
	bb0	 (31-13),r13,@L5104
	ld	 r13,r24,80
	ld	 r23,r13,8
	br.n	 @L6461
	or.u	 r13,r0,hi16(_processing_template_decl)
	align	 4
@L5104:
	ld	 r23,r24,36
	or.u	 r13,r0,hi16(_processing_template_decl)
@L6461:
	ld	 r13,r13,lo16(_processing_template_decl)
	bcnd	 eq0,r13,@L5106
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1.n	 ne,r13,@L5107
	or.u	 r13,r0,hi16(_last_function_parms)
	bsr.n	 _copy_to_permanent
	ld	 r2,r13,lo16(_last_function_parms)
	ld	 r3,r24,4
	ld.bu	 r13,r3,8
	cmp	 r13,r13,16
	bb1.n	 ne,r13,@L5108
	or	 r25,r0,r2
	ld	 r3,r3,56
	ld.bu	 r13,r3,8
	cmp	 r13,r13,132
	bb0	 ne,r13,@L5108
	bsr.n	 _build_pointer_type
	or	 r2,r0,r3
	or.u	 r13,r0,hi16(_flag_this_is_variable)
	ld	 r3,r13,lo16(_flag_this_is_variable)
	cmp	 r3,r3,0
	or	 r4,r0,0
	bsr.n	 _build_type_variant
	extu	 r3,r3,1<le>
	or.u	 r13,r0,hi16(_this_identifier)
	or	 r3,r0,r2
	ld	 r4,r13,lo16(_this_identifier)
	bsr.n	 _build
	or	 r2,r0,34
	or	 r3,r0,r2
	st	 r25,r0,r3
	or	 r25,r0,r3
@L5108:
	st	 r25,r24,40
@L5107:
	ld	 r3,r24,32
	ld	 r4,r24,4
	bsr.n	 _build_lang_decl
	or	 r2,r0,129
	ld	 r13,r24,8
	and	 r13,r13,0xefff
	st	 r13,r24,8
	ld	 r12,r2,8
	and	 r13,r12,0xefff
	st	 r13,r2,8
	ld	 r13,r24,8
	and	 r12,r12,0xcfff
	mask	 r13,r13,8192
	or	 r12,r12,r13
	st	 r12,r2,8
	ld	 r13,r24,28
	bb0.n	 (31-8),r13,@L5110
	or	 r12,r0,0
	bcnd	 eq0,r23,@L5111
	bb0	 (31-19),r13,@L5110
@L5111:
	or	 r12,r0,1
@L5110:
	ld	 r13,r2,28
	and.u	 r13,r13,0xff7f
	mak	 r12,r12,0<23>
	or	 r13,r13,r12
	st	 r13,r2,28
	ld	 r13,r2,28
	st	 r24,r2,44
	or	 r24,r0,r2
	or	 r13,r13,1024
	st	 r13,r24,28
@L5106:
	bcnd	 eq0,r23,@L5112
	ld	 r13,r23,16
	bcnd	 eq0,r13,@L5112
	ld	 r13,r24,28
	bb1	 (31-19),r13,@L5113
	and.u	 r13,r13,0xff7f
	st	 r13,r24,28
@L5113:
	ld	 r13,r24,80
	bcnd	 eq0,r13,@L5114
	ld	 r13,r24,28
	and	 r13,r13,0xf7ff
	st	 r13,r24,28
@L5114:
	or	 r2,r0,r23
	bsr.n	 _pushclass
	or	 r3,r0,2
@L5112:
	ld	 r13,r19,24
	bb0.n	 (31-21),r13,@L5115
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r12,r13,lo16(_current_binding_level)
	ld	 r13,r12,32
	bb1.n	 (31-24),r13,@L5115
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb1.n	 ne,r13,@L6462
	or.u	 r12,r0,hi16(_free_binding_level)
	or.u	 r13,r0,hi16(_named_labels)
	ld	 r2,r13,lo16(_named_labels)
	cmp	 r2,r2,0
	or	 r3,r0,134
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	or.u	 r12,r0,hi16(_free_binding_level)
@L6462:
	ld	 r2,r12,lo16(_free_binding_level)
	bcnd.n	 eq0,r2,@L5119
	or	 r25,r0,r2
	ld	 r13,r25,28
	br.n	 @L5120
	st	 r13,r12,lo16(_free_binding_level)
	align	 4
@L5119:
	bsr.n	 _xmalloc
	or	 r2,r0,36
	or	 r25,r0,r2
@L5120:
	or.u	 r3,r0,hi16(_clear_binding_level)
	subu	 r2,r25,60
	ld	 r4,r3,lo16(_clear_binding_level)
	or	 r3,r3,lo16(_clear_binding_level)
	or.u	 r13,r0,hi16(_keep_next_level_flag)
	subu	 r3,r3,60
	bsr.n	 ___movstrSI96x36
	ld	 r23,r13,lo16(_keep_next_level_flag)
	or.u	 r12,r0,hi16(_class_binding_level)
	ld	 r13,r12,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L5122
	st	 r13,r25,28
	br.n	 @L5123
	st	 r0,r12,lo16(_class_binding_level)
	align	 4
@L5122:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	st	 r13,r25,28
@L5123:
	ld	 r13,r25,32
	mak	 r12,r23,3<9>
	or	 r2,r0,r25
	or	 r13,r13,416
	or.u	 r25,r0,hi16(_current_binding_level)
	and	 r13,r13,0xf1ff
	st	 r2,r25,lo16(_current_binding_level)
	or	 r13,r13,r12
	bsr.n	 _GNU_xref_start_scope
	st	 r13,r2,32
	ld	 r11,r25,lo16(_current_binding_level)
	ld	 r13,r11,32
	or.u	 r12,r0,hi16(_keep_next_level_flag)
	and	 r13,r13,0xf1ff
	st	 r0,r12,lo16(_keep_next_level_flag)
	or	 r13,r13,1024
	bsr.n	 _clear_last_expr
	st	 r13,r11,32
	bsr.n	 _expand_start_bindings
	or	 r2,r0,0
@L5115:
	bcnd	 eq0,r22,@L6267
	ld.bu	 r12,r24,8
	cmp	 r13,r12,29
	bb0.n	 ne,r13,@L5129
	cmp	 r13,r12,32
	bb1.n	 ne,r13,@L5130
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	bcnd	 ne0,r13,@L5128
	bsr.n	 _list_length
	or	 r2,r0,r21
	cmp	 r2,r2,1
	bb0	 gt,r2,@L5124
@L5128:
	ld	 r13,r24,32
	or.u	 r2,r0,hi16(@LC209)
	ld	 r3,r13,16
	br.n	 @L6403
	or	 r2,r2,lo16(@LC209)
	align	 4
@L5129:
	ld	 r13,r24,32
	or.u	 r2,r0,hi16(@LC210)
	ld	 r3,r13,16
	br.n	 @L6403
	or	 r2,r2,lo16(@LC210)
	align	 4
@L5130:
	ld	 r13,r19,16
	bcnd	 ne0,r13,@L5124
	ld.bu	 r13,r19,8
	cmp	 r13,r13,18
	bb0	 ne,r13,@L5133
	ld	 r13,r24,32
	or.u	 r2,r0,hi16(@LC211)
	ld	 r3,r13,16
	br.n	 @L6403
	or	 r2,r2,lo16(@LC211)
	align	 4
@L5133:
	ld	 r13,r19,4
	ld	 r13,r13,16
	bcnd	 ne0,r13,@L5124
	ld	 r13,r24,32
	or.u	 r2,r0,hi16(@LC212)
	ld	 r3,r13,16
	or	 r2,r2,lo16(@LC212)
@L6403:
	bsr.n	 _error
	or	 r22,r0,0
@L5124:
	bcnd.n	 ne0,r22,@L6463
	or.u	 r13,r0,hi16(_current_binding_level)
@L6267:
	ld.bu	 r13,r24,8
	cmp	 r12,r13,32
	cmp	 r13,r13,129
	or	 r12,r12,r13
	extu	 r13,r12,1<eq>
	xor	 r12,r13,1
	bcnd	 eq0,r12,@L5137
	ld	 r12,r19,24
	bb0	 (31-22),r12,@L5137
	ld	 r13,r24,28
	bb1	 (31-8),r13,@L5137
	ld	 r13,r19,16
	bcnd	 ne0,r13,@L5138
	ld	 r13,r24,32
	or.u	 r2,r0,hi16(@LC213)
	ld	 r3,r13,16
	bsr.n	 _error
	or	 r2,r2,lo16(@LC213)
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	st	 r13,r24,4
	br.n	 @L5137
	or	 r19,r0,r13
	align	 4
@L5138:
	extu	 r22,r12,1<11>
@L5137:
	bcnd.n	 eq0,r22,@L5140
	or.u	 r13,r0,hi16(_current_binding_level)
@L6463:
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L5141
	ld	 r13,r24,28
	bb0	 (31-8),r13,@L5141
	ld	 r13,r24,32
	or.u	 r2,r0,hi16(@LC214)
	ld	 r3,r13,16
	bsr.n	 _warning
	or	 r2,r2,lo16(@LC214)
@L5141:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r11,r24,28
	or.u	 r10,r0,hi16(_global_binding_level)
	ld	 r12,r13,lo16(_current_binding_level)
	ld	 r13,r10,lo16(_global_binding_level)
	and.u	 r11,r11,0xff7f
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L5142
	st	 r11,r24,28
	ld	 r13,r24,8
	or	 r13,r13,8192
	st	 r13,r24,8
@L5142:
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	st	 r13,r24,48
@L5140:
	ld.bu	 r12,r24,8
	cmp	 r13,r12,34
	bb0	 ne,r13,@L5145
	ld	 r13,r24,36
	bcnd.n	 ne0,r13,@L5148
	or	 r23,r0,r24
@L5145:
	cmp	 r13,r12,129
	bb1.n	 ne,r13,@L5146
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L5148
	or	 r23,r0,r24
@L5146:
	ld.bu	 r13,r19,8
	cmp	 r13,r13,24
	bb0.n	 ne,r13,@L5148
	or	 r23,r0,r24
	bsr.n	 _pushdecl
	or	 r2,r0,r24
	or	 r23,r0,r2
	ld.bu	 r13,r23,8
	cmp	 r13,r13,3
	bb1.n	 ne,r13,@L5148
	or	 r2,r0,r24
	bsr.n	 _value_member
	or	 r3,r0,r23
	bcnd	 eq0,r2,@L5150
	ld	 r23,r2,16
	br	 @L5148
	align	 4
@L5150:
	bcnd	 eq0,r23,@L6269
@L5171:
	ld	 r9,r23,16
	st	 r24,r31,88
	st	 r9,r31,92
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L5157
	ld.bu	 r13,r9,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L5157
	ld	 r13,r24,4
	ld	 r12,r9,4
	ld	 r11,r13,12
	ld	 r10,r12,12
	st	 r13,r31,120
	st	 r12,r31,128
	st	 r11,r31,124
	st	 r10,r31,132
	ld.bu	 r13,r13,8
	cmp	 r13,r13,16
	bb1	 ne,r13,@L5158
	ld	 r13,r9,80
	ld	 r13,r0,r13
	bb0.n	 (31-13),r13,@L5158
	addu	 r2,r31,120
	addu	 r3,r31,88
	br.n	 @L6404
	addu	 r4,r31,124
	align	 4
@L5158:
	ld	 r13,r31,128
	ld.bu	 r13,r13,8
	cmp	 r13,r13,16
	bb1	 ne,r13,@L5159
	ld	 r13,r31,88
	ld	 r13,r13,80
	ld	 r13,r0,r13
	bb0.n	 (31-13),r13,@L5159
	addu	 r2,r31,128
	addu	 r3,r31,92
	addu	 r4,r31,132
@L6404:
	bsr	 _revert_static_member_fn
@L5159:
	ld	 r11,r31,120
	ld	 r10,r31,128
	ld.bu	 r12,r11,8
	ld.bu	 r13,r10,8
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L5161
	cmp	 r13,r12,14
	bb1.n	 ne,r13,@L5162
	or.u	 r3,r0,hi16(@LC49)
	ld	 r2,r31,88
	br.n	 @L6405
	or	 r3,r3,lo16(@LC49)
	align	 4
@L5162:
	or.u	 r3,r0,hi16(@LC50)
	ld	 r2,r31,88
	or	 r3,r3,lo16(@LC50)
@L6405:
	bsr	 _compiler_error_with_decl
	br.n	 @L5156
	or	 r2,r0,0
	align	 4
@L5161:
	ld	 r13,r11,4
	ld	 r12,r10,4
	ld	 r2,r13,64
	ld	 r3,r12,64
	bsr.n	 _comptypes
	or	 r4,r0,1
	bcnd.n	 eq0,r2,@L5164
	or	 r4,r0,1
	ld	 r2,r31,124
	ld	 r3,r31,132
	bsr.n	 _compparms
	addu	 r1,r1,@L6559
@L6560:
	align	 4
@L5164:
	br.n	 @L5156
	or	 r2,r0,0
	align	 4
@L5157:
	ld	 r13,r31,88
	or.u	 r12,r0,hi16(_error_mark_node)
	ld	 r2,r13,4
	ld	 r13,r12,lo16(_error_mark_node)
	cmp	 r13,r2,r13
	bb1	 ne,r13,@L5167
	ld	 r13,r31,92
	ld	 r13,r13,4
	cmp	 r13,r13,r2
	br.n	 @L5156
	extu	 r2,r13,1<eq>
	align	 4
@L5167:
	ld	 r13,r31,92
	ld	 r3,r13,4
	bcnd.n	 ne0,r3,@L5169
	cmp	 r13,r2,0
	br.n	 @L5156
	extu	 r2,r13,1<eq>
	align	 4
@L5169:
	bsr.n	 _comptypes
	or	 r4,r0,1
@L5156:
	bcnd	 ne0,r2,@L5153
	ld	 r23,r0,r23
	bcnd	 ne0,r23,@L5171
@L5153:
	bcnd	 ne0,r23,@L5172
@L6269:
	br.n	 @L5148
	or	 r23,r0,r24
	align	 4
@L5172:
	ld	 r23,r23,16
@L5148:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L5174
	ld	 r13,r24,28
	bb0	 (31-21),r13,@L5174
	ld	 r21,r23,32
	ld	 r13,r23,28
	ld	 r24,r21,20
	or	 r22,r0,r23
	or	 r13,r13,1024
	bcnd.n	 eq0,r24,@L5176
	st	 r13,r23,28
	ld.bu	 r12,r24,8
	cmp	 r13,r12,3
	bb0	 ne,r13,@L5177
	ld	 r13,r23,80
	ld.bu	 r13,r0,r13
	bcnd.n	 ne0,r13,@L6464
	or.u	 r13,r0,hi16(_flag_traditional)
	cmp	 r13,r12,29
	bb1	 ne,r13,@L5179
	ld	 r13,r24,80
	ld.bu	 r13,r0,r13
	bcnd.n	 ne0,r13,@L6464
	or.u	 r13,r0,hi16(_flag_traditional)
	or.u	 r3,r0,hi16(@LC90)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC90)
	or.u	 r3,r0,hi16(@LC91)
	or	 r2,r0,r24
	or	 r3,r3,lo16(@LC91)
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L6561
@L6562:
	align	 4
@L5179:
	bsr.n	 _my_friendly_abort
	or	 r2,r0,9
@L5178:
	or.u	 r13,r0,hi16(_flag_traditional)
@L6464:
	ld	 r13,r13,lo16(_flag_traditional)
	bcnd	 ne0,r13,@L5182
	ld	 r13,r24,8
	bb0.n	 (31-10),r13,@L5182
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L5182
	or.u	 r25,r0,hi16(_overloads_to_forget)
	or	 r2,r0,r21
	ld	 r4,r25,lo16(_overloads_to_forget)
	bsr.n	 _tree_cons
	or	 r3,r0,r24
	st	 r2,r25,lo16(_overloads_to_forget)
@L5182:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,106
	bb1	 ne,r13,@L5184
	ld	 r24,r24,16
@L5184:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1.n	 ne,r13,@L6465
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r24,80
	ld	 r12,r22,80
	ld.bu	 r13,r0,r13
	ld.bu	 r12,r0,r12
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L5185
	ld	 r2,r24,4
	ld	 r3,r22,4
	bsr.n	 _comptypes
	or	 r4,r0,1
	bcnd.n	 eq0,r2,@L5185
	or.u	 r13,r0,hi16(_current_lang_stack)
	or.u	 r12,r0,hi16(_current_lang_base)
	ld	 r13,r13,lo16(_current_lang_stack)
	ld	 r12,r12,lo16(_current_lang_base)
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L6406
	or.u	 r3,r0,hi16(@LC92)
	or	 r2,r0,r22
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC92)
	or.u	 r3,r0,hi16(@LC93)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC93)
@L5185:
	or.u	 r13,r0,hi16(_pedantic)
@L6465:
	ld	 r13,r13,lo16(_pedantic)
	bcnd	 eq0,r13,@L5188
	ld.bu	 r13,r24,8
	cmp	 r13,r13,33
	bb1.n	 ne,r13,@L5188
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13,132
	ld.b	 r2,r0,r13
	cmp	 r2,r2,100
	or	 r3,r0,143
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	or.u	 r3,r0,hi16(@LC94)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC94)
	or.u	 r3,r0,hi16(@LC95)
	or	 r2,r0,r22
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC95)
@L5188:
	or	 r2,r0,r21
	or	 r3,r0,r24
	bsr.n	 _tree_cons
	or	 r4,r0,0
	or	 r24,r0,r2
	ld	 r2,r24,12
	br.n	 @L6407
	or	 r3,r0,r22
	align	 4
@L5177:
	ld	 r13,r24,16
	bcnd	 eq0,r13,@L6408
	ld.bu	 r13,r23,8
	cmp	 r13,r13,129
	bb0	 ne,r13,@L5176
	or	 r25,r0,r24
	ld	 r23,r23,60
@L5194:
	ld	 r11,r25,16
	ld.bu	 r13,r11,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L5195
	ld	 r13,r11,80
	ld	 r12,r22,80
	ld.bu	 r13,r0,r13
	ld.bu	 r12,r0,r12
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L5195
	ld	 r2,r11,4
	ld	 r3,r22,4
	bsr.n	 _comptypes
	or	 r4,r0,1
	bcnd	 eq0,r2,@L5195
	or.u	 r3,r0,hi16(@LC96)
	or	 r2,r0,r22
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC96)
	or.u	 r3,r0,hi16(@LC97)
	ld	 r2,r25,16
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC97)
@L5195:
	ld	 r12,r25,16
	ld.bu	 r13,r12,8
	cmp	 r13,r13,129
	bb1	 eq,r13,@L5193
	ld	 r13,r12,60
	cmp	 r13,r13,r23
	bb0	 ne,r13,@L6290
@L5193:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L5194
@L5176:
	ld	 r13,r22,80
	ld.bu	 r13,r0,r13
	bcnd	 ne0,r13,@L5198
	bcnd.n	 eq0,r24,@L5198
	or	 r25,r0,r24
@L5203:
	ld	 r13,r25,16
	ld	 r13,r13,80
	ld.bu	 r13,r0,r13
	cmp	 r13,r13,1
	bb0	 eq,r13,@L5200
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L5203
@L5200:
	bcnd	 eq0,r25,@L5198
	or.u	 r3,r0,hi16(@LC98)
	or	 r2,r0,r22
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC98)
	or.u	 r3,r0,hi16(@LC99)
	ld	 r2,r25,16
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC99)
@L5198:
	or.u	 r13,r0,hi16(_flag_traditional)
	ld	 r13,r13,lo16(_flag_traditional)
	bcnd.n	 ne0,r13,@L6466
	or	 r2,r0,r21
	bcnd	 eq0,r24,@L5206
	ld	 r13,r24,8
	bb0	 (31-10),r13,@L6466
@L5206:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r12,r13,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd	 ne0,r13,@L5245
	ld	 r13,r12,32
	bb1.n	 (31-29),r13,@L6466
	or	 r2,r0,r21
	or.u	 r25,r0,hi16(_overloads_to_forget)
	ld	 r4,r25,lo16(_overloads_to_forget)
	bsr.n	 _tree_cons
	or	 r3,r0,r24
	br.n	 @L5245
	st	 r2,r25,lo16(_overloads_to_forget)
	align	 4
@L5174:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,129
	bb1	 ne,r13,@L5209
	ld	 r2,r24,44
	ld	 r12,r2,36
	bcnd	 eq0,r12,@L5211
	ld.bu	 r2,r12,8
	cmp	 r2,r2,132
	or	 r3,r0,145
	extu	 r2,r2,1<eq>
	or	 r19,r0,r23
	bsr.n	 _my_friendly_assert
	addu	 r1,r1,@L6563
@L6564:
	align	 4
@L5211:
	ld.bu	 r2,r2,8
	mask	 r13,r2,0xff
	cmp	 r13,r13,29
	bb1.n	 ne,r13,@L5214
	subu	 r13,r2,32
	ld	 r21,r23,32
	ld	 r13,r23,28
	ld	 r24,r21,20
	or	 r22,r0,r23
	or	 r13,r13,1024
	bcnd.n	 eq0,r24,@L5216
	st	 r13,r23,28
	ld.bu	 r12,r24,8
	cmp	 r13,r12,3
	bb0	 ne,r13,@L5217
	ld	 r13,r23,80
	ld.bu	 r13,r0,r13
	bcnd.n	 ne0,r13,@L5222
	cmp	 r13,r12,29
	bb1	 ne,r13,@L5219
	ld	 r13,r24,80
	ld.bu	 r13,r0,r13
	bcnd.n	 ne0,r13,@L5222
	or.u	 r3,r0,hi16(@LC90)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC90)
	or.u	 r3,r0,hi16(@LC91)
	or	 r2,r0,r24
	or	 r3,r3,lo16(@LC91)
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L6565
@L6566:
	align	 4
@L5219:
	bsr.n	 _my_friendly_abort
	or	 r2,r0,9
@L5222:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,106
	bb1	 ne,r13,@L5224
	ld	 r24,r24,16
@L5224:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1.n	 ne,r13,@L6467
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r24,80
	ld	 r12,r22,80
	ld.bu	 r13,r0,r13
	ld.bu	 r12,r0,r12
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L5225
	ld	 r2,r24,4
	ld	 r3,r22,4
	bsr.n	 _comptypes
	or	 r4,r0,1
	bcnd.n	 eq0,r2,@L5225
	or.u	 r13,r0,hi16(_current_lang_stack)
	or.u	 r12,r0,hi16(_current_lang_base)
	ld	 r13,r13,lo16(_current_lang_stack)
	ld	 r12,r12,lo16(_current_lang_base)
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L5226
	or.u	 r3,r0,hi16(@LC92)
@L6406:
	ld	 r13,r24,80
	ld	 r12,r22,80
	ld.bu	 r13,r0,r13
	or	 r23,r0,r24
	br.n	 @L5209
	st.b	 r13,r0,r12
	align	 4
@L5226:
	or	 r2,r0,r22
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC92)
	or.u	 r3,r0,hi16(@LC93)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC93)
@L5225:
	or.u	 r13,r0,hi16(_pedantic)
@L6467:
	ld	 r13,r13,lo16(_pedantic)
	bcnd	 eq0,r13,@L5228
	ld.bu	 r13,r24,8
	cmp	 r13,r13,33
	bb1.n	 ne,r13,@L5228
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13,132
	ld.b	 r2,r0,r13
	cmp	 r2,r2,100
	or	 r3,r0,143
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	or.u	 r3,r0,hi16(@LC94)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC94)
	or.u	 r3,r0,hi16(@LC95)
	or	 r2,r0,r22
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC95)
@L5228:
	or	 r2,r0,r21
	or	 r3,r0,r24
	bsr.n	 _tree_cons
	or	 r4,r0,0
	or	 r24,r0,r2
	ld	 r2,r24,12
	br.n	 @L6407
	or	 r3,r0,r22
	align	 4
@L5217:
	ld	 r13,r24,16
	bcnd	 ne0,r13,@L5229
@L6408:
	br.n	 @L5209
	st	 r23,r24,16
	align	 4
@L5229:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,129
	bb0	 ne,r13,@L5216
	or	 r25,r0,r24
	ld	 r23,r23,60
@L5234:
	ld	 r11,r25,16
	ld.bu	 r13,r11,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L5235
	ld	 r13,r11,80
	ld	 r12,r22,80
	ld.bu	 r13,r0,r13
	ld.bu	 r12,r0,r12
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L5235
	ld	 r2,r11,4
	ld	 r3,r22,4
	bsr.n	 _comptypes
	or	 r4,r0,1
	bcnd	 eq0,r2,@L5235
	or.u	 r3,r0,hi16(@LC96)
	or	 r2,r0,r22
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC96)
	or.u	 r3,r0,hi16(@LC97)
	ld	 r2,r25,16
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC97)
@L5235:
	ld	 r12,r25,16
	ld.bu	 r13,r12,8
	cmp	 r13,r13,129
	bb1	 eq,r13,@L5233
	ld	 r13,r12,60
	cmp	 r13,r13,r23
	bb0	 ne,r13,@L6290
@L5233:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L5234
@L5216:
	ld	 r13,r22,80
	ld.bu	 r13,r0,r13
	bcnd.n	 ne0,r13,@L6466
	or	 r2,r0,r21
	bcnd.n	 eq0,r24,@L6466
	or	 r25,r0,r24
@L5243:
	ld	 r13,r25,16
	ld	 r13,r13,80
	ld.bu	 r13,r0,r13
	cmp	 r13,r13,1
	bb0	 eq,r13,@L5240
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L5243
@L5240:
	bcnd.n	 eq0,r25,@L5245
	or.u	 r3,r0,hi16(@LC98)
	or	 r2,r0,r22
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC98)
	or.u	 r3,r0,hi16(@LC99)
	ld	 r2,r25,16
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC99)
@L5245:
	or	 r2,r0,r21
@L6466:
	or	 r3,r0,r22
@L6407:
	bsr.n	 _tree_cons
	or	 r4,r0,r24
	or.u	 r13,r0,hi16(_unknown_type_node)
	ld	 r13,r13,lo16(_unknown_type_node)
	or	 r24,r0,r2
	st	 r24,r21,20
	or	 r23,r0,r22
	br.n	 @L5209
	st	 r13,r24,4
	align	 4
@L5214:
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L5250
	or.u	 r2,r0,hi16(@LC215)
	or	 r2,r2,lo16(@LC215)
	or	 r19,r0,0
	bsr.n	 _sorry
	addu	 r1,r1,@L6567
@L6568:
	align	 4
@L6290:
	br.n	 @L5209
	or	 r23,r0,r22
	align	 4
@L5250:
	bsr.n	 _my_friendly_abort
	or	 r2,r0,14
@L5209:
	bcnd	 eq0,r18,@L5252
	ld.bu	 r12,r23,8
	cmp	 r13,r12,34
	bb0	 ne,r13,@L5252
	ld	 r13,r23,8
	bb0.n	 (31-13),r13,@L5253
	cmp	 r13,r12,33
	cmp	 r12,r12,36
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L6468
	or.u	 r13,r0,hi16(_flag_cadillac)
@L5253:
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L6468
	or.u	 r13,r0,hi16(_flag_cadillac)
	or.u	 r13,r0,hi16(_debug_temp_inits)
	ld	 r13,r13,lo16(_debug_temp_inits)
	bcnd	 eq0,r13,@L5252
	ld	 r13,r19,24
	bb1.n	 (31-20),r13,@L6468
	or.u	 r13,r0,hi16(_flag_cadillac)
	ld.bu	 r13,r19,8
	cmp	 r13,r13,15
	bb0.n	 ne,r13,@L6468
	or.u	 r13,r0,hi16(_flag_cadillac)
	bsr	 _temporary_allocation
@L5252:
	or.u	 r13,r0,hi16(_flag_cadillac)
@L6468:
	ld	 r13,r13,lo16(_flag_cadillac)
	bcnd.n	 eq0,r13,@L6469
	or	 r19,r0,r23
	bsr.n	 _cadillac_start_decl
	or	 r2,r0,r23
	or	 r19,r0,r23
@L5096:
@L6469:
	bsr.n	 _permalloc
	or	 r2,r0,12
	bcnd.n	 le0,r20,@L5260
	subu	 r13,r0,r20
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L6470
	subu	 r13,r20,1
	cmp	 r13,r12,3
	bb1.n	 ge,r13,@L6340
	cmp	 r13,r12,2
	bb1	 ge,r13,@L6341
	subu	 r20,r20,1
	st	 r0,r2[r20]
@L6341:
	subu	 r20,r20,1
	st	 r0,r2[r20]
@L6340:
	subu	 r20,r20,1
	bcnd.n	 le0,r20,@L5260
	st	 r0,r2[r20]
@L5261:
	subu	 r13,r20,1
@L6470:
	st	 r0,r2[r13]
	subu	 r13,r20,2
	st	 r0,r2[r13]
	subu	 r13,r20,3
	subu	 r20,r20,4
	st	 r0,r2[r13]
	bcnd.n	 gt0,r20,@L5261
	st	 r0,r2[r20]
@L5260:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	st	 r2,r19,80
	ld	 r13,r13,32
	or	 r21,r0,0
	or	 r20,r0,0
	mask	 r17,r13,61440
	mask	 r13,r13,3584
	cmp	 r12,r17,12288
	cmp	 r13,r13,1024
	bb1.n	 ne,r13,@L5264
	extu	 r17,r12,1<eq>
	or	 r20,r0,r21
@L5264:
	bcnd.n	 lt0,r20,@L5266
	or	 r15,r0,0
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r18,r13,4
	br	 @L5267
	align	 4
@L5266:
	or	 r18,r0,0
@L5267:
	bcnd.n	 lt0,r20,@L5268
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r22,r13,20
	br.n	 @L6471
	or.u	 r25,r0,hi16(_current_binding_level)
	align	 4
@L5268:
	or	 r22,r0,0
	or.u	 r25,r0,hi16(_current_binding_level)
@L6471:
	ld	 r2,r25,lo16(_current_binding_level)
	ld	 r6,r2,32
	extu	 r4,r6,4<12>
	extu	 r5,r6,3<9>
	ld	 r3,r2,28
	bsr.n	 _GNU_xref_end_scope
	extu	 r6,r6,1<8>
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r12,32
	mask	 r13,r13,3584
	cmp	 r13,r13,512
	bb1	 ne,r13,@L5271
	or	 r21,r0,1
@L5271:
	ld	 r24,r0,r12
	bcnd.n	 eq0,r24,@L5274
	or	 r25,r0,r24
	or.u	 r23,r0,0x1d00
@L5276:
	ld	 r12,r25,8
	mask.u	 r13,r12,0xff01
	cmp	 r13,r13,r23
	bb1	 ne,r13,@L5275
	ld	 r13,r25,48
	bcnd	 eq0,r13,@L5275
	bb0	 (31-11),r12,@L5275
	bsr.n	 _output_inline_function
	or	 r2,r0,r25
@L5275:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L5276
@L5274:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r13,24
	cmp	 r13,r12,0
	extu	 r16,r13,1<ne>
	bcnd.n	 eq0,r16,@L5279
	or	 r23,r0,0
	br.n	 @L5280
	or	 r23,r0,r12
	align	 4
@L5279:
	subu	 r13,r0,r20
	or	 r13,r13,r21
	bcnd	 eq0,r13,@L5280
	bsr.n	 _make_node
	or	 r2,r0,5
	or	 r23,r0,r2
@L5280:
	bcnd	 eq0,r23,@L5282
	st	 r24,r23,16
	st	 r18,r23,20
	or	 r2,r0,r23
	bsr.n	 _remember_end_note
	st	 r22,r23,24
@L5282:
	bcnd	 lt0,r21,@L5283
	bcnd.n	 eq0,r22,@L5283
	or	 r25,r0,r22
@L5287:
	st	 r23,r25,28
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L5287
@L5283:
	or	 r25,r0,r24
	bcnd.n	 eq0,r25,@L6472
	or.u	 r13,r0,hi16(_current_binding_level)
@L5292:
	ld	 r13,r25,32
	bcnd	 eq0,r13,@L5291
	ld	 r13,r25,28
	bb0	 (31-8),r13,@L5294
	ld	 r13,r25,8
	bb0	 (31-16),r13,@L6506
	ld	 r12,r25,60
	ld	 r13,r12,8
	or	 r13,r13,32768
	st	 r13,r12,8
	ld	 r13,r25,8
@L6506:
	bb0	 (31-11),r13,@L5294
	ld	 r12,r25,60
	ld	 r13,r12,8
	or.u	 r13,r13,0x10
	st	 r13,r12,8
@L5294:
	ld	 r13,r25,32
	st	 r0,r13,24
@L5291:
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L5292
	or.u	 r13,r0,hi16(_current_binding_level)
@L6472:
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r25,r13,8
	bcnd.n	 eq0,r25,@L6473
	or.u	 r13,r0,hi16(_current_binding_level)
@L5301:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,24
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L5301
	or.u	 r13,r0,hi16(_current_binding_level)
@L6473:
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r25,r13,12
	bcnd.n	 eq0,r25,@L6474
	or.u	 r13,r0,hi16(_current_binding_level)
@L5306:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,28
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L5306
	or.u	 r13,r0,hi16(_current_binding_level)
@L6474:
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r25,r13,16
	bcnd	 eq0,r25,@L5309
@L5311:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,4
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L5311
@L5309:
	bcnd.n	 eq0,r20,@L5313
	or.u	 r13,r0,hi16(_named_labels)
	ld	 r25,r13,lo16(_named_labels)
	bcnd.n	 eq0,r25,@L6507
	st	 r0,r23,16
@L5317:
	ld	 r24,r25,16
	ld	 r13,r24,48
	bcnd.n	 ne0,r13,@L5318
	or.u	 r13,r0,hi16(_warn_unused)
	or.u	 r3,r0,hi16(@LC1)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC1)
	ld	 r4,r24,32
	or.u	 r13,r0,hi16(_input_filename)
	ld	 r2,r13,lo16(_input_filename)
	or	 r3,r0,1
	bsr.n	 _define_label
	addu	 r1,r1,@L6569
@L6570:
	align	 4
@L5318:
	ld	 r13,r13,lo16(_warn_unused)
	bcnd	 eq0,r13,@L5319
	ld	 r13,r24,8
	bb1	 (31-16),r13,@L5319
	or.u	 r3,r0,hi16(@LC2)
	or	 r2,r0,r24
	bsr.n	 _warning_with_decl
	or	 r3,r3,lo16(@LC2)
@L5319:
	ld	 r13,r24,32
	ld	 r13,r13,36
	bcnd.n	 ne0,r13,@L5322
	or	 r2,r0,1
	bsr.n	 _perm_calloc
	or	 r3,r0,20
	ld	 r13,r24,32
	st	 r2,r13,36
@L5322:
	ld	 r13,r24,32
	ld	 r13,r13,36
	st	 r0,r0,r13
	ld	 r13,r23,16
	st	 r13,r0,r24
	st	 r24,r23,16
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L5317
	or.u	 r13,r0,hi16(_named_labels)
@L6507:
	st	 r0,r13,lo16(_named_labels)
@L5313:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r10,r13,lo16(_current_binding_level)
	ld	 r11,r10,28
	bcnd.n	 eq0,r11,@L5324
	or.u	 r13,r0,hi16(_named_label_uses)
	ld	 r12,r13,lo16(_named_label_uses)
	bcnd.n	 eq0,r12,@L6475
	or.u	 r13,r0,hi16(_current_binding_level)
@L5328:
	ld	 r13,r12,4
	cmp	 r13,r13,r10
	bb1	 ne,r13,@L5327
	st	 r11,r12,4
	ld	 r13,r0,r11
	st	 r13,r12,12
@L5327:
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L5328
@L5324:
	or.u	 r13,r0,hi16(_current_binding_level)
@L6475:
	ld	 r11,r13,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r11,32
	ld	 r13,r13,lo16(_global_binding_level)
	bcnd.n	 eq0,r13,@L5332
	extu	 r24,r12,3<9>
	cmp	 r13,r11,r13
	bb1.n	 ne,r13,@L6476
	or.u	 r9,r0,hi16(_current_binding_level)
	bsr.n	 _my_friendly_abort
	or	 r2,r0,123
@L5332:
	or.u	 r9,r0,hi16(_current_binding_level)
@L6476:
	or.u	 r11,r0,hi16(_free_binding_level)
	ld	 r12,r9,lo16(_current_binding_level)
	ld	 r13,r11,lo16(_free_binding_level)
	ld	 r10,r12,28
	st	 r13,r12,28
	ld	 r13,r10,32
	mask	 r13,r13,61440
	st	 r12,r11,lo16(_free_binding_level)
	cmp	 r13,r13,8192
	bb0.n	 eq,r13,@L5331
	st	 r10,r9,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_class_binding_level)
	or	 r11,r0,r9
	st	 r10,r13,lo16(_class_binding_level)
@L5335:
	ld	 r13,r11,lo16(_current_binding_level)
	ld	 r12,r13,28
	ld	 r13,r12,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb1.n	 eq,r13,@L5335
	st	 r12,r11,lo16(_current_binding_level)
@L5331:
	bcnd.n	 eq0,r20,@L5339
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r13,r13,lo16(_current_function_decl)
	br.n	 @L5340
	st	 r23,r13,48
	align	 4
@L5339:
	bcnd	 eq0,r23,@L5341
	bcnd.n	 ne0,r16,@L6477
	cmp	 r13,r24,2
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r2,r13,20
	br.n	 @L6409
	or	 r3,r0,r23
	align	 4
@L5341:
	bcnd.n	 eq0,r22,@L5340
	cmp	 r13,r21,2
	bb1.n	 ne,r13,@L5345
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r3,r13,20
	br.n	 @L6409
	or	 r2,r0,r22
	align	 4
@L5345:
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r2,r13,20
	or	 r3,r0,r22
@L6409:
	bsr	 _chainon
	ld	 r13,r25,lo16(_current_binding_level)
	st	 r2,r13,20
@L5340:
	cmp	 r13,r24,2
@L6477:
	cmp	 r12,r17,0
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5347
	bsr	 _getdecls
	or	 r3,r0,r21
	bsr.n	 _expand_end_bindings
	or	 r4,r0,1
	or	 r2,r0,r21
	or	 r3,r0,0
	bsr.n	 _poplevel
	or	 r4,r0,r15
	or	 r23,r0,r2
@L5347:
	bcnd	 eq0,r23,@L5263
	ld	 r13,r23,8
	or	 r13,r13,32768
	st	 r13,r23,8
@L5263:
	ld	 r13,r19,32
	ld	 r13,r13,28
	bcnd.n	 eq0,r13,@L5349
	or.u	 r3,r0,hi16(@LC291)
	or	 r2,r0,r19
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC291)
@L5349:
	br.n	 @L6258
	or	 r2,r0,r19
	align	 4
@L5088:
	bb1	 (31-15),r14,@L5084
	ld	 r2,r17,16
	ld	 r13,r2,8
	or.u	 r12,r0,hi16(@LC292)
	extu	 r11,r13,1<7>
	bcnd.n	 eq0,r11,@L5354
	or	 r24,r12,lo16(@LC292)
	or.u	 r13,r0,hi16(@LC293)
	br.n	 @L5355
	or	 r25,r13,lo16(@LC293)
	align	 4
@L5354:
	or.u	 r13,r0,hi16(@LC294)
	or	 r25,r13,lo16(@LC294)
@L5355:
	bcnd.n	 eq0,r11,@L5356
	or	 r4,r0,r16
	bsr	 _operator_name_string
	or	 r4,r0,r2
@L5356:
	or	 r2,r0,r24
	or	 r3,r0,r25
	bsr.n	 _error
	addu	 r1,r1,@L6571
@L6572:
	align	 4
@L5353:
	bb1.n	 ne,r12,@L5359
	or.u	 r13,r0,hi16(@LC296)
	or.u	 r13,r0,hi16(@LC295)
	br.n	 @L5360
	or	 r2,r13,lo16(@LC295)
	align	 4
@L5359:
	or	 r2,r13,lo16(@LC296)
@L5360:
	bsr.n	 _error
	or	 r3,r0,r16
@L5358:
	and.u	 r14,r14,0xfff9
	and	 r14,r14,0x7fff
	br	 @L5084
	align	 4
@L5085:
	ld	 r8,r31,156
	extu	 r12,r14,1<17>
	cmp	 r13,r8,0
	extu	 r13,r13,1<ne>
	and	 r12,r12,r13
	bcnd	 eq0,r12,@L5362
	ld	 r8,r31,252
	bcnd.n	 ne0,r8,@L6478
	extu	 r12,r14,1<17>
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L5363
	or.u	 r2,r0,hi16(@LC298)
	or.u	 r2,r0,hi16(@LC297)
	or	 r3,r0,r16
	or	 r2,r2,lo16(@LC297)
	bsr.n	 _warning
	addu	 r1,r1,@L6573
@L6574:
	align	 4
@L5363:
	or	 r3,r0,r16
	br.n	 @L6402
	or	 r2,r2,lo16(@LC298)
	align	 4
@L5362:
	ld	 r8,r31,252
	extu	 r12,r14,1<17>
@L6478:
	cmp	 r13,r8,0
	extu	 r13,r13,1<ne>
	and	 r12,r12,r13
	bcnd.n	 eq0,r12,@L5366
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L6270
	or.u	 r2,r0,hi16(@LC299)
	or	 r3,r0,r16
	br.n	 @L6402
	or	 r2,r2,lo16(@LC299)
	align	 4
@L5366:
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L5084
@L6270:
	bb0.n	 (31-16),r14,@L5084
	or.u	 r2,r0,hi16(@LC300)
	or	 r3,r0,r16
	or	 r2,r2,lo16(@LC300)
@L6402:
	bsr	 _error
@L5084:
	bcnd	 eq0,r17,@L5371
	or.u	 r18,r0,hi16(_global_binding_level)
	or.u	 r19,r0,hi16(_current_binding_level)
	or.u	 r15,r0,hi16(_class_binding_level)
@L5806:
	ld.bu	 r12,r17,8
	cmp	 r13,r12,1
	bb0	 ne,r13,@L5371
	ld.bu	 r11,r22,8
	bcnd.n	 ne0,r11,@L5374
	cmp	 r13,r12,124
	bb1	 ne,r13,@L6440
	ld	 r17,r17,20
	br	 @L5370
	align	 4
@L5374:
	ld	 r8,r31,308
	bcnd	 eq0,r8,@L5377
	bcnd.n	 eq0,r17,@L5378
	cmp	 r13,r12,124
	bb0	 ne,r13,@L5377
@L5378:
	bcnd.n	 ne0,r20,@L6479
	or	 r2,r0,32
	cmp	 r13,r11,16
	bb1	 ne,r13,@L5379
	ld	 r20,r22,56
@L5379:
	bcnd.n	 eq0,r20,@L5377
	or	 r2,r0,32
@L6479:
	or	 r3,r0,0
	bsr.n	 _build_decl
	or	 r4,r0,r22
	ld	 r4,r31,308
	or	 r25,r0,r2
	or	 r2,r0,r20
	or	 r3,r0,r25
	bsr.n	 _grok_method_quals
	st	 r0,r31,308
	ld	 r22,r25,4
	or	 r20,r0,r2
@L5377:
	ld.bu	 r12,r17,8
	cmp	 r13,r12,42
	bb0	 ne,r13,@L5382
	bb0.n	 ls,r13,@L5803
	cmp	 r13,r12,22
	bb0.n	 ls,r13,@L5804
	cmp	 r13,r12,21
	bb0	 lo,r13,@L5800
	bcnd.n	 eq0,r12,@L5800
	cmp	 r13,r12,10
	bb0.n	 ne,r13,@L5800
	or	 r2,r0,0
	br	 @L6480
	align	 4
@L5804:
	cmp	 r13,r12,39
	bb0.n	 ne,r13,@L5582
	or	 r2,r0,0
	br	 @L6480
	align	 4
@L5803:
	cmp	 r13,r12,106
	bb0	 ne,r13,@L5582
	bb0.n	 ls,r13,@L5805
	cmp	 r13,r12,50
	bb0.n	 ne,r13,@L5467
	cmp	 r13,r12,85
	bb0.n	 ne,r13,@L6440
	or	 r2,r0,0
	br	 @L6480
	align	 4
@L5805:
	cmp	 r13,r12,124
	bb0.n	 ne,r13,@L5676
	cmp	 r13,r12,126
	bb0.n	 ne,r13,@L5726
	or	 r2,r0,r17
	br.n	 @L5801
	or	 r2,r0,0
	align	 4
@L5382:
	ld.bu	 r12,r22,8
	subu	 r13,r12,21
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb0	 ls,r13,@L5386
	ld	 r13,r22,80
	ld	 r13,r0,r13
	bb0	 (31-30),r13,@L5385
@L5386:
	mask	 r13,r12,0xff
	cmp	 r13,r13,10
	bb1.n	 ne,r13,@L6481
	or.u	 r13,r0,hi16(_void_type_node)
@L5385:
	ld	 r13,r22,16
	bcnd.n	 ne0,r13,@L6481
	or.u	 r13,r0,hi16(_void_type_node)
	ld	 r13,r22,48
	bcnd	 eq0,r13,@L5387
	ld	 r13,r13,32
	bcnd	 eq0,r13,@L5387
	ld	 r13,r13,4
	bcnd.n	 eq0,r13,@L6481
	or.u	 r13,r0,hi16(_void_type_node)
@L5387:
	ld	 r21,r22,48
	ld.bu	 r2,r21,8
	cmp	 r2,r2,32
	or	 r3,r0,144
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	ld	 r12,r21,32
	ld	 r13,r12,20
	cmp	 r13,r13,r21
	bb0	 ne,r13,@L5383
	ld	 r13,r12,4
	bcnd	 eq0,r13,@L5390
	ld	 r13,r18,lo16(_global_binding_level)
	ld	 r3,r13,4
	bsr.n	 _value_member
	or	 r2,r0,r22
	bcnd.n	 ne0,r2,@L6481
	or.u	 r13,r0,hi16(_void_type_node)
@L5390:
	ld	 r12,r19,lo16(_current_binding_level)
	ld	 r13,r18,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	ld	 r25,r21,40
	bb0	 ne,r13,@L5393
	ld	 r3,r25,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r19,lo16(_current_binding_level)
	br.n	 @L5394
	st	 r2,r13,16
	align	 4
@L5393:
	ld	 r13,r15,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L5394
	ld	 r3,r25,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r15,lo16(_class_binding_level)
	st	 r2,r13,16
@L5394:
	st	 r0,r25,4
	ld	 r13,r21,32
	ld	 r12,r15,lo16(_class_binding_level)
	st	 r13,r21,40
	bcnd.n	 eq0,r12,@L5396
	st	 r0,r21,36
	br.n	 @L5397
	or	 r23,r0,r12
	align	 4
@L5396:
	ld	 r23,r19,lo16(_current_binding_level)
@L5397:
	ld	 r13,r18,lo16(_global_binding_level)
	cmp	 r13,r23,r13
	bb0.n	 ne,r13,@L5399
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r13,lo16(_global_binding_level)
@L5400:
	ld	 r13,r23,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb0.n	 eq,r13,@L5401
	or	 r24,r0,0
	ld	 r25,r23,4
	bcnd	 eq0,r25,@L5401
@L5405:
	ld	 r13,r25,16
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L5407
	or	 r24,r0,r25
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L5405
@L5401:
	ld	 r23,r23,28
	cmp	 r13,r23,r12
	bb1	 ne,r13,@L5400
@L5399:
	ld	 r13,r23,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb1.n	 ne,r13,@L5383
	or	 r24,r0,0
	ld	 r25,r23,4
	bcnd.n	 eq0,r25,@L6481
	or.u	 r13,r0,hi16(_void_type_node)
@L5414:
	ld	 r13,r25,16
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L5416
	or	 r24,r0,r25
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L5414
	or.u	 r13,r0,hi16(_void_type_node)
	br	 @L6481
	align	 4
@L5416:
	or	 r4,r0,r22
	or	 r5,r0,0
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC117)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC117)
	bsr.n	 _my_friendly_abort
	or	 r2,r0,11
@L5407:
	bcnd	 eq0,r24,@L5418
	ld	 r13,r0,r25
	br.n	 @L5419
	st	 r13,r0,r24
	align	 4
@L5418:
	ld	 r13,r0,r25
	st	 r13,r23,4
@L5419:
	ld	 r12,r19,lo16(_current_binding_level)
	ld	 r13,r18,lo16(_global_binding_level)
	ld	 r24,r25,12
	cmp	 r13,r12,r13
	ld	 r23,r25,16
	bb0	 ne,r13,@L5421
	ld	 r3,r24,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r19,lo16(_current_binding_level)
	br.n	 @L5422
	st	 r2,r13,16
	align	 4
@L5421:
	ld	 r13,r15,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L5422
	ld	 r3,r24,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r15,lo16(_class_binding_level)
	st	 r2,r13,16
@L5422:
	st	 r23,r24,4
	ld	 r2,r25,12
	ld	 r13,r18,lo16(_global_binding_level)
	ld	 r3,r25,16
	bsr.n	 _perm_tree_cons
	ld	 r4,r13,4
	or.u	 r8,r0,hi16(_current_class_type)
	ld	 r13,r18,lo16(_global_binding_level)
	ld	 r12,r8,lo16(_current_class_type)
	bcnd.n	 eq0,r12,@L5424
	st	 r2,r13,4
	ld	 r13,r12,80
	ld	 r25,r13,48
	bcnd.n	 eq0,r25,@L5424
	or	 r24,r0,0
@L5428:
	ld	 r13,r25,16
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L5426
	or	 r24,r0,r25
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L5428
@L5426:
	bcnd	 eq0,r25,@L5424
	bcnd	 eq0,r24,@L5432
	ld	 r13,r0,r25
	br.n	 @L5424
	st	 r13,r0,r24
	align	 4
@L5432:
	or.u	 r8,r0,hi16(_current_class_type)
	ld	 r13,r8,lo16(_current_class_type)
	ld	 r12,r13,80
	ld	 r13,r0,r25
	st	 r13,r12,48
@L5424:
	ld	 r25,r19,lo16(_current_binding_level)
	ld	 r13,r18,lo16(_global_binding_level)
	or	 r2,r0,r21
	bsr.n	 _pushdecl
	st	 r13,r19,lo16(_current_binding_level)
	ld	 r13,r15,lo16(_class_binding_level)
	bcnd.n	 eq0,r13,@L5435
	st	 r25,r19,lo16(_current_binding_level)
	or	 r25,r0,r13
@L5435:
	ld.bu	 r13,r21,8
	cmp	 r13,r13,32
	bb1.n	 ne,r13,@L6481
	or.u	 r13,r0,hi16(_void_type_node)
	ld	 r13,r18,lo16(_global_binding_level)
	cmp	 r13,r25,r13
	ld	 r10,r21,32
	bb0.n	 ne,r13,@L5438
	or	 r11,r0,0
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r9,r13,lo16(_global_binding_level)
@L5440:
	ld	 r12,r25,16
	bcnd	 eq0,r12,@L5439
@L5444:
	ld	 r13,r12,12
	cmp	 r13,r13,r10
	bb1	 ne,r13,@L5443
	addu	 r11,r12,16
@L5443:
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L5444
@L5439:
	ld	 r25,r25,28
	cmp	 r13,r25,r9
	bb1	 ne,r13,@L5440
@L5438:
	ld	 r2,r21,4
	bcnd	 ne0,r11,@L5448
	st	 r2,r10,4
	br.n	 @L6481
	or.u	 r13,r0,hi16(_void_type_node)
	align	 4
@L5448:
	st	 r2,r0,r11
@L5383:
	or.u	 r13,r0,hi16(_void_type_node)
@L6481:
	ld	 r12,r22,64
	ld	 r13,r13,lo16(_void_type_node)
	ld	 r25,r17,20
	cmp	 r12,r12,r13
	ld	 r17,r17,16
	bb1.n	 ne,r12,@L5450
	or	 r24,r0,0
	or.u	 r2,r0,hi16(@LC301)
	or	 r3,r0,r16
	bsr.n	 _error
	or	 r2,r2,lo16(@LC301)
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r22,r13,lo16(_error_mark_node)
@L5450:
	ld.bu	 r13,r22,8
	cmp	 r13,r13,23
	bb1.n	 ne,r13,@L6482
	or.u	 r13,r0,hi16(_error_mark_node)
	or.u	 r2,r0,hi16(@LC302)
	or	 r3,r0,r16
	bsr.n	 _error
	or	 r2,r2,lo16(@LC302)
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r22,r13,lo16(_error_mark_node)
	or.u	 r13,r0,hi16(_error_mark_node)
@L6482:
	ld	 r12,r13,lo16(_error_mark_node)
	cmp	 r13,r25,r12
	bb1	 ne,r13,@L5452
	or	 r22,r0,r25
@L5452:
	cmp	 r13,r22,r12
	bb1	 eq,r13,@L5370
	bcnd	 eq0,r25,@L5454
	bsr	 _suspend_momentary
	ld.bu	 r13,r25,8
	cmp	 r13,r13,102
	bb1.n	 ne,r13,@L5455
	or	 r23,r0,r2
	ld	 r11,r25,16
	ld	 r13,r25,4
	ld	 r12,r11,4
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L5455
	or	 r25,r0,r11
@L5455:
	ld.bu	 r13,r25,8
	cmp	 r13,r13,131
	bb0	 ne,r13,@L5457
	ld	 r13,r25,4
	ld.bu	 r13,r13,8
	cmp	 r12,r13,7
	cmp	 r13,r13,10
	or	 r12,r12,r13
	extu	 r13,r12,1<eq>
	xor	 r12,r13,1
	bcnd	 eq0,r12,@L5458
	or.u	 r2,r0,hi16(@LC303)
	or	 r3,r0,r16
	bsr.n	 _error
	or	 r2,r2,lo16(@LC303)
	or.u	 r13,r0,hi16(_integer_one_node)
	ld	 r25,r13,lo16(_integer_one_node)
@L5458:
	ld	 r13,r25,8
	bb0.n	 (31-13),r13,@L5459
	or.u	 r13,r0,hi16(_tree_code_type)
	ld.bu	 r12,r25,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r13,r0,r13
	cmp	 r13,r13,100
	bb1.n	 ne,r13,@L6483
	or.u	 r13,r0,hi16(_pedantic)
	bsr.n	 _decl_constant_value
	or	 r2,r0,r25
	or	 r25,r0,r2
@L5459:
	or.u	 r13,r0,hi16(_pedantic)
@L6483:
	ld	 r13,r13,lo16(_pedantic)
	bcnd	 eq0,r13,@L5460
	bsr.n	 _integer_zerop
	or	 r2,r0,r25
	bcnd	 eq0,r2,@L5460
	or.u	 r2,r0,hi16(@LC304)
	or	 r3,r0,r16
	bsr.n	 _pedwarn
	or	 r2,r2,lo16(@LC304)
@L5460:
	ld	 r13,r25,8
	bb0.n	 (31-9),r13,@L5461
	or.u	 r13,r0,hi16(_integer_zero_node)
	ld	 r11,r13,lo16(_integer_zero_node)
	ld	 r12,r25,16
	ld	 r13,r11,16
	cmp	 r12,r12,r13
	bb0	 ge,r12,@L5463
	bb1.n	 ne,r12,@L6484
	or.u	 r13,r0,hi16(_integer_one_node)
	ld	 r13,r25,12
	ld	 r12,r11,12
	cmp	 r13,r13,r12
	bb0.n	 lo,r13,@L6484
	or.u	 r13,r0,hi16(_integer_one_node)
@L5463:
	or.u	 r2,r0,hi16(@LC305)
	or	 r3,r0,r16
	bsr.n	 _error
	or	 r2,r2,lo16(@LC305)
	or.u	 r13,r0,hi16(_integer_one_node)
	ld	 r25,r13,lo16(_integer_one_node)
	or.u	 r13,r0,hi16(_integer_one_node)
@L6484:
	or	 r2,r0,54
	ld	 r4,r13,lo16(_integer_one_node)
	or	 r3,r0,r25
	bsr.n	 _size_binop
	addu	 r1,r1,@L6575
@L6576:
	align	 4
@L5461:
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	bcnd	 eq0,r13,@L5457
	or.u	 r2,r0,hi16(@LC306)
	or	 r3,r0,r16
	bsr.n	 _pedwarn
	or	 r2,r2,lo16(@LC306)
@L5457:
	or.u	 r13,r0,hi16(_integer_one_node)
	or	 r2,r0,54
	ld	 r4,r13,lo16(_integer_one_node)
	bsr.n	 _build_binary_op
	or	 r3,r0,r25
	bsr	 _variable_size
@L6412:
	bsr	 _build_index_type
	or	 r24,r0,r2
	bsr.n	 _resume_momentary
	or	 r2,r0,r23
@L5454:
	ld	 r8,r31,172
	cmp	 r13,r8,0
	ld	 r8,r31,180
	cmp	 r12,r8,0
	and	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L6485
	or	 r2,r0,r22
	ld	 r3,r31,172
	ld	 r4,r31,180
	bsr.n	 _build_type_variant
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,r22
@L6485:
	or	 r3,r0,r24
	bsr.n	 _build_cplus_array_type
	or	 r20,r0,0
	br.n	 @L5370
	or	 r22,r0,r2
	align	 4
@L5467:
	ld.bu	 r12,r22,8
	subu	 r13,r12,21
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb0	 ls,r13,@L5471
	ld	 r13,r22,80
	ld	 r13,r0,r13
	bb0	 (31-30),r13,@L5470
@L5471:
	mask	 r13,r12,0xff
	cmp	 r13,r13,10
	bb1	 ne,r13,@L5468
@L5470:
	ld	 r13,r22,16
	bcnd	 ne0,r13,@L5468
	ld	 r13,r22,48
	bcnd	 eq0,r13,@L5472
	ld	 r13,r13,32
	bcnd	 eq0,r13,@L5472
	ld	 r13,r13,4
	bcnd	 eq0,r13,@L5468
@L5472:
	ld	 r21,r22,48
	ld.bu	 r2,r21,8
	cmp	 r2,r2,32
	or	 r3,r0,144
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	ld	 r12,r21,32
	ld	 r13,r12,20
	cmp	 r13,r13,r21
	bb0	 ne,r13,@L5468
	ld	 r13,r12,4
	bcnd	 eq0,r13,@L5475
	ld	 r13,r18,lo16(_global_binding_level)
	ld	 r3,r13,4
	bsr.n	 _value_member
	or	 r2,r0,r22
	bcnd	 ne0,r2,@L5468
@L5475:
	ld	 r12,r19,lo16(_current_binding_level)
	ld	 r13,r18,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	ld	 r25,r21,40
	bb0	 ne,r13,@L5478
	ld	 r3,r25,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r19,lo16(_current_binding_level)
	br.n	 @L5479
	st	 r2,r13,16
	align	 4
@L5478:
	ld	 r13,r15,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L5479
	ld	 r3,r25,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r15,lo16(_class_binding_level)
	st	 r2,r13,16
@L5479:
	st	 r0,r25,4
	ld	 r13,r21,32
	ld	 r12,r15,lo16(_class_binding_level)
	st	 r13,r21,40
	bcnd.n	 eq0,r12,@L5481
	st	 r0,r21,36
	br.n	 @L5482
	or	 r23,r0,r12
	align	 4
@L5481:
	ld	 r23,r19,lo16(_current_binding_level)
@L5482:
	ld	 r13,r18,lo16(_global_binding_level)
	cmp	 r13,r23,r13
	bb0.n	 ne,r13,@L5484
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r13,lo16(_global_binding_level)
@L5485:
	ld	 r13,r23,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb0.n	 eq,r13,@L5486
	or	 r24,r0,0
	ld	 r25,r23,4
	bcnd	 eq0,r25,@L5486
@L5490:
	ld	 r13,r25,16
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L5492
	or	 r24,r0,r25
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L5490
@L5486:
	ld	 r23,r23,28
	cmp	 r13,r23,r12
	bb1	 ne,r13,@L5485
@L5484:
	ld	 r13,r23,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb1.n	 ne,r13,@L5468
	or	 r24,r0,0
	ld	 r25,r23,4
	bcnd	 eq0,r25,@L5468
@L5499:
	ld	 r13,r25,16
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L5501
	or	 r24,r0,r25
	ld	 r25,r0,r25
	bcnd	 eq0,r25,@L5468
	br	 @L5499
	align	 4
@L5501:
	or	 r4,r0,r22
	or	 r5,r0,0
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC117)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC117)
	bsr.n	 _my_friendly_abort
	or	 r2,r0,11
@L5492:
	bcnd	 eq0,r24,@L5503
	ld	 r13,r0,r25
	br.n	 @L5504
	st	 r13,r0,r24
	align	 4
@L5503:
	ld	 r13,r0,r25
	st	 r13,r23,4
@L5504:
	ld	 r12,r19,lo16(_current_binding_level)
	ld	 r13,r18,lo16(_global_binding_level)
	ld	 r24,r25,12
	cmp	 r13,r12,r13
	ld	 r23,r25,16
	bb0	 ne,r13,@L5506
	ld	 r3,r24,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r19,lo16(_current_binding_level)
	br.n	 @L5507
	st	 r2,r13,16
	align	 4
@L5506:
	ld	 r13,r15,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L5507
	ld	 r3,r24,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r15,lo16(_class_binding_level)
	st	 r2,r13,16
@L5507:
	st	 r23,r24,4
	ld	 r2,r25,12
	ld	 r13,r18,lo16(_global_binding_level)
	ld	 r3,r25,16
	bsr.n	 _perm_tree_cons
	ld	 r4,r13,4
	or.u	 r8,r0,hi16(_current_class_type)
	ld	 r13,r18,lo16(_global_binding_level)
	ld	 r12,r8,lo16(_current_class_type)
	bcnd.n	 eq0,r12,@L5509
	st	 r2,r13,4
	ld	 r13,r12,80
	ld	 r25,r13,48
	bcnd.n	 eq0,r25,@L5509
	or	 r24,r0,0
@L5513:
	ld	 r13,r25,16
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L5511
	or	 r24,r0,r25
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L5513
@L5511:
	bcnd	 eq0,r25,@L5509
	bcnd	 eq0,r24,@L5517
	ld	 r13,r0,r25
	br.n	 @L5509
	st	 r13,r0,r24
	align	 4
@L5517:
	or.u	 r8,r0,hi16(_current_class_type)
	ld	 r13,r8,lo16(_current_class_type)
	ld	 r12,r13,80
	ld	 r13,r0,r25
	st	 r13,r12,48
@L5509:
	ld	 r25,r19,lo16(_current_binding_level)
	ld	 r13,r18,lo16(_global_binding_level)
	or	 r2,r0,r21
	bsr.n	 _pushdecl
	st	 r13,r19,lo16(_current_binding_level)
	ld	 r13,r15,lo16(_class_binding_level)
	bcnd.n	 eq0,r13,@L5520
	st	 r25,r19,lo16(_current_binding_level)
	or	 r25,r0,r13
@L5520:
	ld.bu	 r13,r21,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L5468
	ld	 r10,r21,32
	ld	 r13,r18,lo16(_global_binding_level)
	cmp	 r13,r25,r13
	bb0.n	 ne,r13,@L5523
	or	 r11,r0,0
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r9,r13,lo16(_global_binding_level)
@L5525:
	ld	 r12,r25,16
	bcnd	 eq0,r12,@L5524
@L5529:
	ld	 r13,r12,12
	cmp	 r13,r13,r10
	bb1	 ne,r13,@L5528
	addu	 r11,r12,16
@L5528:
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L5529
@L5524:
	ld	 r25,r25,28
	cmp	 r13,r25,r9
	bb1	 ne,r13,@L5525
@L5523:
	ld	 r2,r21,4
	bcnd	 ne0,r11,@L5533
	st	 r2,r10,4
	br	 @L5468
	align	 4
@L5533:
	st	 r2,r0,r11
@L5468:
	ld	 r8,r31,172
	cmp	 r13,r8,0
	ld	 r8,r31,180
	cmp	 r12,r8,0
	and	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd	 eq0,r13,@L5535
	ld	 r3,r31,172
	ld	 r4,r31,180
	bsr.n	 _build_type_variant
	or	 r2,r0,r22
	or	 r22,r0,r2
	ld	 r13,r22,24
	bb0	 (31-22),r13,@L5536
	bsr	 _build_pointer_type
@L5536:
	st	 r0,r31,172
	st	 r0,r31,180
@L5535:
	ld.bu	 r13,r22,8
	cmp	 r13,r13,23
	bb1	 ne,r13,@L5537
	or.u	 r2,r0,hi16(@LC307)
	or	 r3,r0,r16
	bsr.n	 _error
	or	 r2,r2,lo16(@LC307)
	or.u	 r13,r0,hi16(_integer_type_node)
	ld	 r22,r13,lo16(_integer_type_node)
@L5537:
	ld.bu	 r13,r22,8
	cmp	 r13,r13,18
	bb1	 ne,r13,@L5538
	or.u	 r2,r0,hi16(@LC308)
	or	 r3,r0,r16
	bsr.n	 _error
	or	 r2,r2,lo16(@LC308)
	or.u	 r13,r0,hi16(_integer_type_node)
	ld	 r22,r13,lo16(_integer_type_node)
@L5538:
	ld	 r8,r31,148
	cmp	 r13,r20,0
	cmp	 r12,r8,3
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5539
	ld	 r8,r31,196
	bcnd.n	 eq0,r8,@L5540
	or.u	 r13,r0,hi16(_current_class_name)
	ld	 r8,r31,292
	ld	 r13,r13,lo16(_current_class_name)
	cmp	 r13,r8,r13
	bb1	 ne,r13,@L5539
@L5540:
	or.u	 r8,r0,hi16(_current_class_type)
	ld	 r20,r8,lo16(_current_class_type)
@L5539:
	ld	 r8,r31,300
	cmp	 r13,r20,0
	extu	 r25,r13,1<ne>
	cmp	 r13,r8,3
	extu	 r13,r13,1<eq>
	and	 r13,r25,r13
	bcnd	 eq0,r13,@L5541
	ld	 r12,r20,80
	ld	 r13,r0,r12
	or.u	 r13,r13,0x8000
	st	 r13,r0,r12
@L5541:
	bcnd	 eq0,r20,@L5542
	bsr.n	 _constructor_name
	or	 r2,r0,r20
	ld	 r8,r31,292
	cmp	 r2,r2,r8
	bb1	 ne,r2,@L5542
	ld	 r8,r31,300
	cmp	 r13,r8,1
	bb1	 ne,r13,@L5543
	ld	 r8,r31,212
	cmp	 r13,r8,2
	bb1	 ne,r13,@L5544
	or.u	 r2,r0,hi16(@LC309)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC309)
@L5544:
	ld	 r13,r22,8
	bb1	 (31-13),r13,@L6291
	bb1	 (31-12),r13,@L6292
	ld	 r8,r31,148
	cmp	 r13,r8,3
	bb1.n	 ne,r13,@L6486
	or.u	 r8,r0,hi16(_current_class_type)
	ld	 r13,r8,lo16(_current_class_type)
	cmp	 r13,r20,r13
	extu	 r13,r13,1<ne>
	or.u	 r12,r0,hi16(@LC312)
	and	 r13,r25,r13
	bcnd.n	 eq0,r13,@L5550
	or	 r2,r12,lo16(@LC312)
	ld	 r13,r20,48
	ld	 r13,r13,32
	bsr.n	 _error
	ld	 r3,r13,16
	br.n	 @L5549
	or	 r13,r0,0
	align	 4
@L5550:
	or	 r13,r0,1
@L5549:
	bcnd.n	 ne0,r13,@L5551
	or.u	 r13,r0,hi16(_void_type_node)
	br	 @L6487
	align	 4
@L5543:
	ld	 r8,r31,212
	cmp	 r13,r8,2
	bb1	 ne,r13,@L5552
	or.u	 r2,r0,hi16(@LC313)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC313)
@L5552:
	ld	 r8,r31,188
	bcnd.n	 eq0,r8,@L5553
	or.u	 r2,r0,hi16(@LC314)
	or	 r2,r2,lo16(@LC314)
	bsr.n	 _pedwarn
	st	 r0,r31,188
@L5553:
	ld	 r2,r22,8
	bb1	 (31-13),r2,@L6293
	bb1	 (31-12),r2,@L6294
	and.u	 r13,r14,0xff7e
	bcnd	 eq0,r13,@L5556
	or.u	 r2,r0,hi16(@LC317)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC317)
@L5556:
	ld	 r8,r31,148
	cmp	 r13,r8,3
	ld	 r22,r20,32
	bb1.n	 ne,r13,@L6486
	or.u	 r8,r0,hi16(_current_class_type)
	ld	 r13,r8,lo16(_current_class_type)
	cmp	 r13,r20,r13
	extu	 r13,r13,1<ne>
	or.u	 r12,r0,hi16(@LC318)
	and	 r13,r25,r13
	bcnd.n	 eq0,r13,@L5560
	or	 r2,r12,lo16(@LC318)
	ld	 r13,r20,48
	ld	 r13,r13,32
	bsr.n	 _error
	ld	 r3,r13,16
	br.n	 @L5559
	or	 r13,r0,0
	align	 4
@L5560:
	or	 r13,r0,1
@L5559:
	bcnd	 eq0,r13,@L6393
	ld	 r13,r20,24
	ld	 r8,r31,284
	or	 r3,r0,156
	cmp	 r2,r8,1
	or	 r13,r13,8192
	extu	 r2,r2,1<eq>
	bsr.n	 _my_friendly_assert
	st	 r13,r20,24
@L5551:
	ld	 r8,r31,148
	cmp	 r13,r8,3
@L6486:
	ld	 r8,r31,212
	ext	 r13,r13,1<ne>
	and	 r8,r8,r13
	br.n	 @L5562
	st	 r8,r31,212
	align	 4
@L5542:
	ld	 r8,r31,196
	cmp	 r13,r8,0
	ld	 r8,r31,188
	cmp	 r12,r8,0
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L5562
	or.u	 r2,r0,hi16(@LC319)
	or	 r2,r2,lo16(@LC319)
	bsr.n	 _error
	xor.u	 r14,r14,0x200
@L5562:
	ld	 r8,r31,148
	cmp	 r12,r8,0
	ld	 r8,r31,196
	cmp	 r13,r8,0
	and.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5564
	or.u	 r2,r0,hi16(@LC320)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC320)
@L5564:
	or.u	 r13,r0,hi16(_flag_traditional)
	ld	 r8,r17,24
	ld	 r13,r13,lo16(_flag_traditional)
	bcnd.n	 eq0,r13,@L5565
	st	 r8,r31,308
	or.u	 r13,r0,hi16(_float_type_node)
	ld	 r12,r22,64
	ld	 r13,r13,lo16(_float_type_node)
	cmp	 r12,r12,r13
	bb1	 ne,r12,@L5565
	ld	 r4,r22,8
	or.u	 r13,r0,hi16(_double_type_node)
	extu	 r3,r4,1<18>
	ld	 r2,r13,lo16(_double_type_node)
	bsr.n	 _build_type_variant
	extu	 r4,r4,1<19>
	or	 r22,r0,r2
@L5565:
	ld	 r2,r17,20
	ld	 r17,r17,16
	bcnd.n	 eq0,r17,@L5566
	or	 r12,r0,r17
	ld.bu	 r13,r17,8
	cmp	 r13,r13,124
	bb1	 ne,r13,@L5566
	ld	 r12,r17,20
@L5566:
	bcnd.n	 eq0,r12,@L5567
	or	 r3,r0,0
	ld.bu	 r12,r12,8
	cmp	 r13,r12,1
	cmp	 r12,r12,126
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	ld	 r8,r31,252
	subu	 r13,r0,r13
	and	 r3,r8,r13
@L5567:
	bsr	 _grokparms
	bcnd.n	 eq0,r17,@L5569
	or	 r11,r0,r2
	ld.bu	 r13,r17,8
	cmp	 r13,r13,85
	bb1.n	 ne,r13,@L5569
	or.u	 r13,r0,hi16(_strict_prototype)
	ld	 r13,r13,lo16(_strict_prototype)
	cmp	 r12,r11,0
	cmp	 r13,r13,0
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	ld	 r17,r17,16
	bcnd	 ne0,r13,@L6415
	bcnd.n	 eq0,r11,@L5574
	or.u	 r13,r0,hi16(_void_list_node)
	ld	 r13,r13,lo16(_void_list_node)
	cmp	 r13,r11,r13
	bb0	 ne,r13,@L5569
@L5574:
	or.u	 r2,r0,hi16(@LC321)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC321)
@L6415:
	or.u	 r13,r0,hi16(_void_list_node)
	ld	 r11,r13,lo16(_void_list_node)
@L5569:
	ld	 r25,r22,8
	mask.u	 r13,r25,0xc
	bcnd.n	 eq0,r13,@L5575
	or.u	 r13,r0,hi16(_flag_traditional)
	ld	 r3,r13,lo16(_flag_traditional)
	cmp	 r3,r3,0
	ext	 r3,r3,1<eq>
	ld	 r2,r22,64
	extu	 r24,r25,1<18>
	and	 r3,r11,r3
	bsr.n	 _build_function_type
	extu	 r25,r25,1<19>
	or	 r3,r0,r24
	bsr.n	 _build_type_variant
	or	 r4,r0,r25
	br.n	 @L5370
	or	 r22,r0,r2
	align	 4
@L5575:
	ld	 r3,r13,lo16(_flag_traditional)
	cmp	 r3,r3,0
	ext	 r3,r3,1<eq>
	or	 r2,r0,r22
	bsr.n	 _build_function_type
	and	 r3,r11,r3
	br.n	 @L5370
	or	 r22,r0,r2
	align	 4
@L5582:
	ld.bu	 r12,r22,8
	subu	 r13,r12,21
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb0	 ls,r13,@L5586
	ld	 r13,r22,80
	ld	 r13,r0,r13
	bb0	 (31-30),r13,@L5585
@L5586:
	mask	 r13,r12,0xff
	cmp	 r13,r13,10
	bb1	 ne,r13,@L5583
@L5585:
	ld	 r13,r22,16
	bcnd	 ne0,r13,@L5583
	ld	 r13,r22,48
	bcnd	 eq0,r13,@L5587
	ld	 r13,r13,32
	bcnd	 eq0,r13,@L5587
	ld	 r13,r13,4
	bcnd	 eq0,r13,@L5583
@L5587:
	ld	 r21,r22,48
	ld.bu	 r2,r21,8
	cmp	 r2,r2,32
	or	 r3,r0,144
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	ld	 r12,r21,32
	ld	 r13,r12,20
	cmp	 r13,r13,r21
	bb0	 ne,r13,@L5583
	ld	 r13,r12,4
	bcnd	 eq0,r13,@L5590
	ld	 r13,r18,lo16(_global_binding_level)
	ld	 r3,r13,4
	bsr.n	 _value_member
	or	 r2,r0,r22
	bcnd	 ne0,r2,@L5583
@L5590:
	ld	 r12,r19,lo16(_current_binding_level)
	ld	 r13,r18,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	ld	 r25,r21,40
	bb0	 ne,r13,@L5593
	ld	 r3,r25,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r19,lo16(_current_binding_level)
	br.n	 @L5594
	st	 r2,r13,16
	align	 4
@L5593:
	ld	 r13,r15,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L5594
	ld	 r3,r25,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r15,lo16(_class_binding_level)
	st	 r2,r13,16
@L5594:
	st	 r0,r25,4
	ld	 r13,r21,32
	ld	 r12,r15,lo16(_class_binding_level)
	st	 r13,r21,40
	bcnd.n	 eq0,r12,@L5596
	st	 r0,r21,36
	br.n	 @L5597
	or	 r23,r0,r12
	align	 4
@L5596:
	ld	 r23,r19,lo16(_current_binding_level)
@L5597:
	ld	 r13,r18,lo16(_global_binding_level)
	cmp	 r13,r23,r13
	bb0.n	 ne,r13,@L5599
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r13,lo16(_global_binding_level)
@L5600:
	ld	 r13,r23,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb0.n	 eq,r13,@L5601
	or	 r24,r0,0
	ld	 r25,r23,4
	bcnd	 eq0,r25,@L5601
@L5605:
	ld	 r13,r25,16
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L5607
	or	 r24,r0,r25
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L5605
@L5601:
	ld	 r23,r23,28
	cmp	 r13,r23,r12
	bb1	 ne,r13,@L5600
@L5599:
	ld	 r13,r23,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb1.n	 ne,r13,@L5583
	or	 r24,r0,0
	ld	 r25,r23,4
	bcnd	 eq0,r25,@L5583
@L5614:
	ld	 r13,r25,16
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L5616
	or	 r24,r0,r25
	ld	 r25,r0,r25
	bcnd	 eq0,r25,@L5583
	br	 @L5614
	align	 4
@L5616:
	or	 r4,r0,r22
	or	 r5,r0,0
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC117)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC117)
	bsr.n	 _my_friendly_abort
	or	 r2,r0,11
@L5607:
	bcnd	 eq0,r24,@L5618
	ld	 r13,r0,r25
	br.n	 @L5619
	st	 r13,r0,r24
	align	 4
@L5618:
	ld	 r13,r0,r25
	st	 r13,r23,4
@L5619:
	ld	 r12,r19,lo16(_current_binding_level)
	ld	 r13,r18,lo16(_global_binding_level)
	ld	 r24,r25,12
	cmp	 r13,r12,r13
	ld	 r23,r25,16
	bb0	 ne,r13,@L5621
	ld	 r3,r24,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r19,lo16(_current_binding_level)
	br.n	 @L5622
	st	 r2,r13,16
	align	 4
@L5621:
	ld	 r13,r15,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L5622
	ld	 r3,r24,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r15,lo16(_class_binding_level)
	st	 r2,r13,16
@L5622:
	st	 r23,r24,4
	ld	 r2,r25,12
	ld	 r13,r18,lo16(_global_binding_level)
	ld	 r3,r25,16
	bsr.n	 _perm_tree_cons
	ld	 r4,r13,4
	or.u	 r8,r0,hi16(_current_class_type)
	ld	 r13,r18,lo16(_global_binding_level)
	ld	 r12,r8,lo16(_current_class_type)
	bcnd.n	 eq0,r12,@L5624
	st	 r2,r13,4
	ld	 r13,r12,80
	ld	 r25,r13,48
	bcnd.n	 eq0,r25,@L5624
	or	 r24,r0,0
@L5628:
	ld	 r13,r25,16
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L5626
	or	 r24,r0,r25
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L5628
@L5626:
	bcnd	 eq0,r25,@L5624
	bcnd	 eq0,r24,@L5632
	ld	 r13,r0,r25
	br.n	 @L5624
	st	 r13,r0,r24
	align	 4
@L5632:
	or.u	 r8,r0,hi16(_current_class_type)
	ld	 r13,r8,lo16(_current_class_type)
	ld	 r12,r13,80
	ld	 r13,r0,r25
	st	 r13,r12,48
@L5624:
	ld	 r25,r19,lo16(_current_binding_level)
	ld	 r13,r18,lo16(_global_binding_level)
	or	 r2,r0,r21
	bsr.n	 _pushdecl
	st	 r13,r19,lo16(_current_binding_level)
	ld	 r13,r15,lo16(_class_binding_level)
	bcnd.n	 eq0,r13,@L5635
	st	 r25,r19,lo16(_current_binding_level)
	or	 r25,r0,r13
@L5635:
	ld.bu	 r13,r21,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L5583
	ld	 r10,r21,32
	ld	 r13,r18,lo16(_global_binding_level)
	cmp	 r13,r25,r13
	bb0.n	 ne,r13,@L5638
	or	 r11,r0,0
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r9,r13,lo16(_global_binding_level)
@L5640:
	ld	 r12,r25,16
	bcnd	 eq0,r12,@L5639
@L5644:
	ld	 r13,r12,12
	cmp	 r13,r13,r10
	bb1	 ne,r13,@L5643
	addu	 r11,r12,16
@L5643:
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L5644
@L5639:
	ld	 r25,r25,28
	cmp	 r13,r25,r9
	bb1	 ne,r13,@L5640
@L5638:
	ld	 r2,r21,4
	bcnd	 ne0,r11,@L5648
	st	 r2,r10,4
	br	 @L5583
	align	 4
@L5648:
	st	 r2,r0,r11
@L5583:
	ld.bu	 r13,r22,8
	cmp	 r13,r13,15
	bb1	 ne,r13,@L5650
	ld.bu	 r13,r17,8
	or.u	 r12,r0,hi16(@LC322)
	cmp	 r13,r13,106
	bb1.n	 ne,r13,@L5651
	or	 r2,r12,lo16(@LC322)
	or.u	 r13,r0,hi16(@LC323)
	br.n	 @L5652
	or	 r3,r13,lo16(@LC323)
	align	 4
@L5651:
	or.u	 r13,r0,hi16(@LC324)
	or	 r3,r13,lo16(@LC324)
@L5652:
	bsr	 _error
@L6440:
	ld	 r17,r17,16
	br	 @L5370
	align	 4
@L5650:
	ld	 r8,r31,172
	cmp	 r13,r8,0
	ld	 r8,r31,180
	cmp	 r12,r8,0
	and	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd	 eq0,r13,@L5653
	ld	 r3,r31,172
	ld	 r4,r31,180
	bsr.n	 _build_type_variant
	or	 r2,r0,r22
	or	 r22,r0,r2
	ld	 r13,r22,24
	bb0	 (31-22),r13,@L5654
	bsr	 _build_pointer_type
@L5654:
	st	 r0,r31,172
	st	 r0,r31,180
@L5653:
	ld.bu	 r13,r17,8
	cmp	 r13,r13,106
	bb1	 ne,r13,@L5655
	ld.bu	 r13,r22,8
	cmp	 r13,r13,23
	bb1.n	 ne,r13,@L5656
	or.u	 r13,r0,hi16(_void_type_node)
	or.u	 r2,r0,hi16(@LC325)
	or	 r2,r2,lo16(@LC325)
	bsr.n	 _error
	addu	 r1,r1,@L6577
@L6578:
	align	 4
@L5656:
	ld	 r12,r22,64
	ld	 r13,r13,lo16(_void_type_node)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L5658
	or	 r2,r0,r22
	or.u	 r2,r0,hi16(@LC326)
	or	 r2,r2,lo16(@LC326)
	bsr.n	 _error
	addu	 r1,r1,@L6579
@L6580:
	align	 4
@L5658:
	bsr.n	 _build_reference_type
	addu	 r1,r1,@L6581
@L6582:
	align	 4
@L5655:
	bsr.n	 _build_pointer_type
	or	 r2,r0,r22
@L6418:
	or	 r22,r0,r2
@L5660:
	ld	 r13,r17,4
	bcnd.n	 eq0,r13,@L5661
	or	 r24,r0,0
	or	 r25,r0,r13
	or.u	 r23,r0,hi16(_ridpointers+84)
	or.u	 r13,r0,hi16(@LC327)
	or	 r20,r23,lo16(_ridpointers+84)
	or	 r21,r13,lo16(@LC327)
@L5665:
	ld	 r12,r25,16
	ld	 r13,r23,lo16(_ridpointers+84)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L5666
	ld	 r8,r31,172
	addu	 r8,r8,1
	br.n	 @L5664
	st	 r8,r31,172
	align	 4
@L5666:
	ld	 r13,r20,4
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L5668
	ld	 r8,r31,180
	addu	 r8,r8,1
	br.n	 @L5664
	st	 r8,r31,180
	align	 4
@L5668:
	bcnd	 ne0,r24,@L5664
	ld.bu	 r13,r17,8
	cmp	 r13,r13,106
	bb1.n	 ne,r13,@L5671
	or	 r24,r0,1
	or.u	 r13,r0,hi16(@LC328)
	br.n	 @L5672
	or	 r3,r13,lo16(@LC328)
	align	 4
@L5671:
	or.u	 r13,r0,hi16(@LC329)
	or	 r3,r13,lo16(@LC329)
@L5672:
	bsr.n	 _error
	or	 r2,r0,r21
@L5664:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L5665
	ld	 r8,r31,172
	cmp	 r13,r8,1
	bb0	 gt,r13,@L5674
	or.u	 r2,r0,hi16(@LC330)
	bsr.n	 _warning
	or	 r2,r2,lo16(@LC330)
@L5674:
	ld	 r8,r31,180
	cmp	 r13,r8,1
	bb0.n	 gt,r13,@L5661
	or.u	 r2,r0,hi16(@LC331)
	bsr.n	 _warning
	or	 r2,r2,lo16(@LC331)
@L5661:
	br.n	 @L6440
	or	 r20,r0,0
	align	 4
@L5676:
	ld	 r24,r17,20
	ld.bu	 r13,r24,8
	cmp	 r13,r13,85
	bb1	 ne,r13,@L5677
	ld	 r24,r24,16
@L5677:
	ld	 r12,r17,12
	bcnd	 eq0,r12,@L5679
	ld	 r8,r31,196
	bcnd.n	 eq0,r8,@L5680
	cmp	 r13,r12,1
	bb0	 gt,r13,@L5679
@L5680:
	or.u	 r13,r0,hi16(_current_class_depth)
	ld	 r13,r13,lo16(_current_class_depth)
	cmp	 r13,r12,r13
	bb1.n	 ne,r13,@L5682
	or	 r2,r0,1
	subu	 r13,r12,1
	st	 r13,r17,12
	bsr.n	 _popclass
	addu	 r1,r1,@L6583
@L6584:
	align	 4
@L5682:
	bsr.n	 _my_friendly_abort
	or	 r2,r0,16
@L5679:
	ld	 r13,r17,16
	bcnd	 ne0,r13,@L5684
@L6421:
	br.n	 @L5370
	or	 r17,r0,r24
	align	 4
@L5684:
	bcnd.n	 eq0,r24,@L5686
	or	 r20,r0,r13
	ld.bu	 r12,r24,8
	cmp	 r13,r12,1
	bb1.n	 ne,r13,@L5687
	cmp	 r13,r12,126
	or.u	 r8,r0,hi16(_current_class_type)
	ld	 r12,r20,64
	ld	 r13,r8,lo16(_current_class_type)
	ld	 r8,r31,196
	cmp	 r12,r12,r13
	cmp	 r13,r8,0
	or.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5688
	ld.bu	 r13,r22,8
	cmp	 r13,r13,23
	bb0	 ne,r13,@L6419
	bb1.n	 ne,r12,@L6296
	or.u	 r13,r0,hi16(_extra_warnings)
	ld	 r13,r13,lo16(_extra_warnings)
	bcnd	 eq0,r13,@L5708
	ld	 r13,r20,48
	ld	 r13,r13,32
	or	 r4,r0,r16
	or.u	 r2,r0,hi16(@LC333)
	ld	 r3,r13,16
	br.n	 @L6441
	or	 r2,r2,lo16(@LC333)
	align	 4
@L5688:
	ld	 r13,r20,16
	bcnd	 ne0,r13,@L5696
	bb0	 (31-12),r14,@L5695
@L5696:
	ld	 r8,r31,220
	subu	 r13,r0,1
	cmp	 r13,r8,r13
	ld	 r8,r31,148
	cmp	 r12,r8,3
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5697
	ld	 r8,r31,252
	bcnd	 ne0,r8,@L5697
	or	 r2,r0,r20
	or	 r3,r0,r24
	or	 r4,r0,0
	bsr.n	 _lookup_field
	or	 r5,r0,0
	or	 r25,r0,r2
	bcnd	 ne0,r25,@L6297
	ld	 r2,r20,68
	or	 r3,r0,r24
	bsr.n	 _lookup_fnfields
	or	 r4,r0,0
	or	 r25,r0,r2
	bcnd	 eq0,r25,@L5699
	ld	 r8,r31,300
	cmp	 r13,r8,1
	bb1	 ne,r13,@L5700
	ld	 r25,r25,16
	br.n	 @L6488
	or	 r2,r0,124
	align	 4
@L5700:
	ld	 r13,r20,56
	bcnd	 eq0,r13,@L6297
	ld	 r12,r25,16
	ld	 r13,r13,16
	cmp	 r13,r12,r13
	bb1.n	 ne,r13,@L6488
	or	 r2,r0,124
	ld	 r13,r12,80
	ld	 r25,r13,28
	bcnd.n	 ne0,r25,@L6489
	or	 r2,r0,0
	or.u	 r2,r0,hi16(@LC334)
	ld	 r3,r24,16
	bsr.n	 _error
	or	 r2,r2,lo16(@LC334)
	or	 r2,r0,0
@L6489:
	bsr.n	 _build_tree_list
	or	 r3,r0,r25
	br.n	 @L6297
	or	 r25,r0,r2
	align	 4
@L5699:
	ld	 r8,r31,300
	cmp	 r13,r8,3
	bb1.n	 ne,r13,@L5704
	or.u	 r2,r0,hi16(@LC336)
	or.u	 r3,r0,hi16(@LC335)
	or	 r2,r0,r20
	or	 r3,r3,lo16(@LC335)
	bsr.n	 _error_with_aggr_type
	addu	 r1,r1,@L6585
@L6586:
	align	 4
@L5704:
	ld	 r13,r20,48
	ld	 r13,r13,32
	ld	 r3,r24,16
	ld	 r4,r13,16
	bsr.n	 _error
	or	 r2,r2,lo16(@LC336)
@L5697:
	ld.bu	 r13,r22,8
	cmp	 r13,r13,23
	bb0.n	 ne,r13,@L6419
	or.u	 r8,r0,hi16(_current_class_type)
	ld	 r12,r8,lo16(_current_class_type)
	bcnd	 eq0,r12,@L5708
	ld	 r13,r20,64
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L6298
	or.u	 r13,r0,hi16(_extra_warnings)
	ld	 r13,r13,lo16(_extra_warnings)
	bcnd	 eq0,r13,@L5708
	ld	 r13,r20,48
	ld	 r13,r13,32
	or	 r4,r0,r16
	or.u	 r2,r0,hi16(@LC338)
	ld	 r3,r13,16
	or	 r2,r2,lo16(@LC338)
@L6441:
	bsr	 _warning
@L5708:
	or	 r2,r0,r20
	bsr.n	 _build_offset_type
	or	 r3,r0,r22
	br.n	 @L6421
	or	 r22,r0,r2
	align	 4
@L5695:
	bsr.n	 _uses_template_parms
	or	 r2,r0,r20
	bcnd	 eq0,r2,@L5713
	ld.bu	 r13,r22,8
	cmp	 r13,r13,23
	bb1.n	 ne,r13,@L5370
	or	 r17,r0,r24
@L6419:
	ld	 r3,r31,172
	ld	 r4,r31,180
	bsr.n	 _build_type_variant
	or	 r2,r0,r20
	ld	 r3,r22,4
	bsr.n	 _build_cplus_method_type
	ld	 r4,r22,12
	br.n	 @L6421
	or	 r22,r0,r2
	align	 4
@L5713:
	ld	 r13,r20,48
	ld	 r13,r13,32
	or.u	 r2,r0,hi16(@LC339)
	ld	 r3,r13,16
	or	 r2,r2,lo16(@LC339)
	bsr.n	 _sorry
	subu	 r1,r1,@L6587
@L6588:
	align	 4
@L5687:
	bb1.n	 ne,r13,@L5717
	cmp	 r13,r12,124
	or	 r2,r0,r24
	bsr.n	 _grokoptypename
	or	 r3,r0,0
	or	 r24,r0,r2
	ld.bu	 r2,r24,8
	cmp	 r2,r2,50
	or	 r3,r0,157
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	ld	 r13,r24,16
	ld	 r22,r13,4
	st	 r13,r17,20
	br.n	 @L6421
	st	 r17,r24,16
	align	 4
@L5717:
	bb1.n	 ne,r13,@L5686
	or	 r2,r0,17
	bsr.n	 _my_friendly_abort
	addu	 r1,r1,@L6589
@L6590:
	align	 4
@L5686:
	ld	 r17,r17,20
	bcnd	 eq0,r17,@L5721
	ld.bu	 r13,r17,8
	cmp	 r13,r13,50
	bb1	 eq,r13,@L5370
@L5721:
	ld.bu	 r13,r22,8
	cmp	 r13,r13,23
	bb1.n	 ne,r13,@L5723
	or	 r2,r0,r20
	ld	 r3,r31,172
	ld	 r4,r31,180
	bsr.n	 _build_type_variant
	or	 r2,r0,r20
	ld	 r3,r22,4
	bsr.n	 _build_cplus_method_type
	ld	 r4,r22,12
	br.n	 @L5370
	or	 r22,r0,r2
	align	 4
@L5723:
	bsr.n	 _build_offset_type
	or	 r3,r0,r22
	br.n	 @L5370
	or	 r22,r0,r2
	align	 4
@L5726:
	bsr.n	 _grokoptypename
	or	 r3,r0,0
	ld	 r8,r31,220
	addu	 r13,r8,1
	bcnd.n	 eq0,r13,@L5727
	or	 r17,r0,r2
	ld	 r13,r17,16
	or	 r2,r0,r22
	ld	 r3,r13,4
	bsr.n	 _comp_target_types
	or	 r4,r0,1
	bcnd.n	 ne0,r2,@L5728
	or.u	 r2,r0,hi16(@LC341)
	or.u	 r2,r0,hi16(@LC340)
	or	 r2,r2,lo16(@LC340)
	bsr.n	 _error
	addu	 r1,r1,@L6591
@L6592:
	align	 4
@L5728:
	bsr.n	 _pedwarn
	or	 r2,r2,lo16(@LC341)
@L5727:
	ld	 r13,r17,16
	ld	 r22,r13,4
	ld.bu	 r12,r22,8
	subu	 r13,r12,21
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb0	 ls,r13,@L5733
	ld	 r13,r22,80
	ld	 r13,r0,r13
	bb0	 (31-30),r13,@L5732
@L5733:
	mask	 r13,r12,0xff
	cmp	 r13,r13,10
	bb1	 ne,r13,@L5370
@L5732:
	ld	 r13,r22,16
	bcnd	 ne0,r13,@L5370
	ld	 r13,r22,48
	bcnd	 eq0,r13,@L5734
	ld	 r13,r13,32
	bcnd	 eq0,r13,@L5734
	ld	 r13,r13,4
	bcnd	 eq0,r13,@L5370
@L5734:
	ld	 r21,r22,48
	ld.bu	 r2,r21,8
	cmp	 r2,r2,32
	or	 r3,r0,144
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	ld	 r12,r21,32
	ld	 r13,r12,20
	cmp	 r13,r13,r21
	bb1	 eq,r13,@L5370
	ld	 r13,r12,4
	bcnd	 eq0,r13,@L5737
	ld	 r13,r18,lo16(_global_binding_level)
	ld	 r3,r13,4
	bsr.n	 _value_member
	or	 r2,r0,r22
	bcnd	 ne0,r2,@L5370
@L5737:
	ld	 r12,r19,lo16(_current_binding_level)
	ld	 r13,r18,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	ld	 r25,r21,40
	bb0	 ne,r13,@L5740
	ld	 r3,r25,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r19,lo16(_current_binding_level)
	br.n	 @L5741
	st	 r2,r13,16
	align	 4
@L5740:
	ld	 r13,r15,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L5741
	ld	 r3,r25,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r15,lo16(_class_binding_level)
	st	 r2,r13,16
@L5741:
	st	 r0,r25,4
	ld	 r13,r21,32
	ld	 r12,r15,lo16(_class_binding_level)
	st	 r13,r21,40
	bcnd.n	 eq0,r12,@L5743
	st	 r0,r21,36
	br.n	 @L5744
	or	 r23,r0,r12
	align	 4
@L5743:
	ld	 r23,r19,lo16(_current_binding_level)
@L5744:
	ld	 r13,r18,lo16(_global_binding_level)
	cmp	 r13,r23,r13
	bb0.n	 ne,r13,@L5746
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r13,lo16(_global_binding_level)
@L5747:
	ld	 r13,r23,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb0.n	 eq,r13,@L5748
	or	 r24,r0,0
	ld	 r25,r23,4
	bcnd	 eq0,r25,@L5748
@L5752:
	ld	 r13,r25,16
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L5754
	or	 r24,r0,r25
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L5752
@L5748:
	ld	 r23,r23,28
	cmp	 r13,r23,r12
	bb1	 ne,r13,@L5747
@L5746:
	ld	 r13,r23,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb1.n	 ne,r13,@L5370
	or	 r24,r0,0
	ld	 r25,r23,4
	bcnd	 eq0,r25,@L5370
@L5761:
	ld	 r13,r25,16
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L5763
	or	 r24,r0,r25
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L5761
	br	 @L5370
	align	 4
@L5763:
	or	 r4,r0,r22
	or	 r5,r0,0
	or.u	 r2,r0,hi16(__iob+64)
	or.u	 r3,r0,hi16(@LC117)
	or	 r2,r2,lo16(__iob+64)
	bsr.n	 _print_node_brief
	or	 r3,r3,lo16(@LC117)
	bsr.n	 _my_friendly_abort
	or	 r2,r0,11
@L5754:
	bcnd	 eq0,r24,@L5765
	ld	 r13,r0,r25
	br.n	 @L5766
	st	 r13,r0,r24
	align	 4
@L5765:
	ld	 r13,r0,r25
	st	 r13,r23,4
@L5766:
	ld	 r12,r19,lo16(_current_binding_level)
	ld	 r13,r18,lo16(_global_binding_level)
	ld	 r24,r25,12
	cmp	 r13,r12,r13
	ld	 r23,r25,16
	bb0	 ne,r13,@L5768
	ld	 r3,r24,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r19,lo16(_current_binding_level)
	br.n	 @L5769
	st	 r2,r13,16
	align	 4
@L5768:
	ld	 r13,r15,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L5769
	ld	 r3,r24,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r15,lo16(_class_binding_level)
	st	 r2,r13,16
@L5769:
	st	 r23,r24,4
	ld	 r2,r25,12
	ld	 r13,r18,lo16(_global_binding_level)
	ld	 r3,r25,16
	bsr.n	 _perm_tree_cons
	ld	 r4,r13,4
	or.u	 r8,r0,hi16(_current_class_type)
	ld	 r13,r18,lo16(_global_binding_level)
	ld	 r12,r8,lo16(_current_class_type)
	bcnd.n	 eq0,r12,@L5771
	st	 r2,r13,4
	ld	 r13,r12,80
	ld	 r25,r13,48
	bcnd.n	 eq0,r25,@L5771
	or	 r24,r0,0
@L5775:
	ld	 r13,r25,16
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L5773
	or	 r24,r0,r25
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L5775
@L5773:
	bcnd	 eq0,r25,@L5771
	bcnd	 eq0,r24,@L5779
	ld	 r13,r0,r25
	br.n	 @L5771
	st	 r13,r0,r24
	align	 4
@L5779:
	or.u	 r8,r0,hi16(_current_class_type)
	ld	 r13,r8,lo16(_current_class_type)
	ld	 r12,r13,80
	ld	 r13,r0,r25
	st	 r13,r12,48
@L5771:
	ld	 r25,r19,lo16(_current_binding_level)
	ld	 r13,r18,lo16(_global_binding_level)
	or	 r2,r0,r21
	bsr.n	 _pushdecl
	st	 r13,r19,lo16(_current_binding_level)
	ld	 r13,r15,lo16(_class_binding_level)
	bcnd.n	 eq0,r13,@L5782
	st	 r25,r19,lo16(_current_binding_level)
	or	 r25,r0,r13
@L5782:
	ld.bu	 r13,r21,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L5370
	ld	 r10,r21,32
	ld	 r13,r18,lo16(_global_binding_level)
	cmp	 r13,r25,r13
	bb0.n	 ne,r13,@L5785
	or	 r11,r0,0
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r9,r13,lo16(_global_binding_level)
@L5787:
	ld	 r12,r25,16
	bcnd	 eq0,r12,@L5786
@L5791:
	ld	 r13,r12,12
	cmp	 r13,r13,r10
	bb1	 ne,r13,@L5790
	addu	 r11,r12,16
@L5790:
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L5791
@L5786:
	ld	 r25,r25,28
	cmp	 r13,r25,r9
	bb1	 ne,r13,@L5787
@L5785:
	ld	 r2,r21,4
	bcnd	 ne0,r11,@L5795
	st	 r2,r10,4
	br	 @L5370
	align	 4
@L5795:
	br.n	 @L5370
	st	 r2,r0,r11
	align	 4
@L5800:
	br.n	 @L5370
	or	 r17,r0,0
	align	 4
@L5801:
@L6480:
	bsr.n	 _my_friendly_assert
	or	 r3,r0,158
@L5370:
	bcnd	 ne0,r17,@L5806
@L5371:
	bb0	 (31-12),r14,@L5807
	ld	 r8,r31,172
	cmp	 r13,r8,0
	ld	 r8,r31,180
	cmp	 r12,r8,0
	and	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd	 eq0,r13,@L5808
	ld	 r3,r31,172
	ld	 r4,r31,180
	bsr.n	 _build_type_variant
	or	 r2,r0,r22
	or	 r22,r0,r2
@L5808:
	ld	 r12,r22,48
	bcnd	 eq0,r12,@L5809
	ld.bu	 r13,r12,8
	cmp	 r13,r13,32
	bb1.n	 ne,r13,@L6490
	or	 r2,r0,32
	ld	 r13,r12,32
	ld	 r12,r13,16
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1.n	 ne,r13,@L6491
	or	 r3,r0,r17
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb1.n	 ne,r13,@L6491
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r11,r13,lo16(_current_binding_level)
	bcnd	 eq0,r11,@L5810
@L5814:
	ld	 r12,r11,4
	bcnd	 eq0,r12,@L5813
@L5818:
	ld	 r13,r12,16
	cmp	 r13,r13,r22
	bb1	 ne,r13,@L5817
	bcnd	 eq0,r17,@L5810
	st	 r17,r12,12
	br	 @L5810
	align	 4
@L5817:
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L5818
@L5813:
	ld	 r11,r11,28
	bcnd	 ne0,r11,@L5814
@L5810:
	ld	 r13,r22,48
	st	 r17,r13,32
@L5809:
	or	 r2,r0,32
@L6490:
	or	 r3,r0,r17
@L6491:
	bsr.n	 _build_decl
	or	 r4,r0,r22
	ld	 r8,r31,308
	bcnd.n	 eq0,r8,@L5823
	or	 r25,r0,r2
	bcnd	 ne0,r20,@L6272
	ld.bu	 r13,r22,8
	cmp	 r13,r13,16
	bb0.n	 ne,r13,@L5825
	or.u	 r3,r0,hi16(@LC342)
	or	 r3,r3,lo16(@LC342)
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L6593
@L6594:
	align	 4
@L5825:
	ld	 r20,r22,56
@L5824:
	bcnd	 eq0,r20,@L5823
@L6272:
	ld	 r4,r31,308
	or	 r2,r0,r20
	bsr.n	 _grok_method_quals
	or	 r3,r0,r25
@L5823:
	bb1	 (31-11),r14,@L5829
	ld	 r8,r31,236
	bcnd	 eq0,r8,@L5828
	ld	 r13,r8,28
	bb0.n	 (31-18),r13,@L6258
	or	 r2,r0,r25
@L5829:
	ld	 r13,r25,28
	or	 r13,r13,8192
	st	 r13,r25,28
@L5828:
	br.n	 @L6258
	or	 r2,r0,r25
	align	 4
@L5807:
	ld	 r8,r31,244
	cmp	 r13,r22,r8
	bb1	 ne,r13,@L5830
	ld.bu	 r13,r22,8
	cmp	 r13,r13,18
	bb1	 ne,r13,@L5830
	ld	 r13,r22,12
	bcnd	 ne0,r13,@L5830
	ld	 r2,r22,4
	bsr.n	 _build_cplus_array_type
	or	 r3,r0,0
	or	 r22,r0,r2
@L5830:
	ld	 r8,r31,148
	cmp	 r13,r8,5
	bb1.n	 ne,r13,@L5831
	or.u	 r13,r0,hi16(_void_type_node)
	ld	 r8,r31,172
	cmp	 r13,r8,0
	ld	 r8,r31,180
	cmp	 r12,r8,0
	and	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd	 eq0,r13,@L5832
	ld	 r3,r31,172
	ld	 r4,r31,180
	bsr.n	 _build_type_variant
	or	 r2,r0,r22
	or	 r22,r0,r2
@L5832:
	ld	 r8,r31,196
	bcnd.n	 eq0,r8,@L5833
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r2,r13,lo16(_current_class_type)
	bcnd	 eq0,r2,@L5834
	ld	 r3,r22,64
	bsr.n	 _make_friend_class
	addu	 r1,r1,@L6595
@L6596:
	align	 4
@L5834:
	ld	 r13,r22,48
	ld	 r13,r13,32
	or.u	 r2,r0,hi16(@LC343)
	ld	 r3,r13,16
	bsr.n	 _error
	or	 r2,r2,lo16(@LC343)
@L5835:
	or.u	 r13,r0,hi16(_void_type_node)
	ld	 r22,r13,lo16(_void_type_node)
	br.n	 @L6258
	or	 r2,r0,r22
	align	 4
@L5833:
	ld	 r8,r31,308
	bcnd.n	 eq0,r8,@L5836
	or	 r2,r0,32
	or	 r3,r0,r17
	bsr.n	 _build_decl
	or	 r4,r0,r22
	bcnd.n	 ne0,r20,@L5838
	or	 r25,r0,r2
	ld.bu	 r2,r22,8
	cmp	 r2,r2,16
	or	 r3,r0,159
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	ld	 r20,r22,56
@L5838:
	or	 r2,r0,r20
	ld	 r4,r31,308
	bsr.n	 _grok_method_quals
	or	 r3,r0,r25
	ld	 r22,r25,4
@L5836:
	br.n	 @L6258
	or	 r2,r0,r22
	align	 4
@L5831:
	ld	 r12,r22,64
	ld	 r13,r13,lo16(_void_type_node)
	ld	 r8,r31,148
	cmp	 r12,r12,r13
	cmp	 r13,r8,2
	and.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L6492
	bcnd	 eq0,r17,@L5840
	ld.bu	 r13,r17,8
	cmp	 r13,r13,1
	bb1.n	 ne,r13,@L6493
	or.u	 r2,r0,hi16(@LC345)
	or.u	 r2,r0,hi16(@LC344)
	or	 r3,r0,r16
	or	 r2,r2,lo16(@LC344)
	bsr.n	 _error
	addu	 r1,r1,@L6597
@L6598:
	align	 4
@L5840:
	or.u	 r2,r0,hi16(@LC345)
@L6493:
	bsr.n	 _error
	or	 r2,r2,lo16(@LC345)
@L5841:
	or.u	 r13,r0,hi16(_integer_type_node)
	ld	 r22,r13,lo16(_integer_type_node)
	ld	 r8,r31,148
@L6492:
	cmp	 r13,r8,2
	bb1	 ne,r13,@L5842
	bcnd.n	 eq0,r20,@L5843
	or	 r25,r0,r22
	or.u	 r2,r0,hi16(@LC346)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC346)
@L5843:
	ld	 r8,r31,188
	bcnd	 eq0,r8,@L5844
	or.u	 r2,r0,hi16(@LC347)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC347)
@L5844:
	ld	 r8,r31,308
	bcnd	 eq0,r8,@L5845
	or.u	 r2,r0,hi16(@LC348)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC348)
@L5845:
	ld	 r8,r31,196
	bcnd	 eq0,r8,@L5846
	or.u	 r2,r0,hi16(@LC349)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC349)
@L5846:
	ld	 r8,r31,164
	bcnd	 eq0,r8,@L5847
	or.u	 r2,r0,hi16(@LC350)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC350)
@L5847:
	ld.bu	 r13,r22,8
	cmp	 r13,r13,15
	bb1	 ne,r13,@L5848
	ld	 r22,r22,4
@L5848:
	ld.bu	 r12,r22,8
	cmp	 r13,r12,18
	bb1.n	 ne,r13,@L5849
	cmp	 r13,r12,23
	cmp	 r13,r25,r22
	bb1	 ne,r13,@L5850
	ld	 r2,r22,4
	ld	 r3,r31,172
	ld	 r4,r31,180
	bsr.n	 _build_type_variant
	st	 r0,r31,172
	br.n	 @L6425
	st	 r0,r31,180
	align	 4
@L5850:
	ld	 r2,r22,4
	br	 @L6425
	align	 4
@L5849:
	bb0.n	 ne,r13,@L6426
	cmp	 r13,r12,14
	bb1	 ne,r13,@L5852
@L6426:
	or	 r2,r0,r22
@L6425:
	bsr	 _build_pointer_type
	or	 r22,r0,r2
@L5852:
	ld.bu	 r13,r25,8
	cmp	 r13,r13,15
	bb1.n	 ne,r13,@L6494
	or	 r2,r0,34
	bsr.n	 _build_reference_type
	or	 r2,r0,r22
	ld	 r3,r31,172
	ld	 r4,r31,180
	st	 r0,r31,180
	bsr.n	 _build_type_variant
	st	 r0,r31,172
	or	 r22,r0,r2
	or	 r2,r0,34
@L6494:
	or	 r3,r0,r17
	bsr.n	 _build_decl
	or	 r4,r0,r22
	or	 r24,r0,r2
	st	 r22,r24,48
	or.u	 r13,r0,hi16(_float_type_node)
	ld	 r12,r22,64
	ld	 r13,r13,lo16(_float_type_node)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L5857
	ld	 r4,r22,8
	or.u	 r13,r0,hi16(_double_type_node)
	ld	 r2,r13,lo16(_double_type_node)
	br.n	 @L6427
	extu	 r3,r4,1<18>
	align	 4
@L5857:
	ld.bu	 r13,r22,8
	cmp	 r13,r13,7
	bb1.n	 ne,r13,@L5864
	or.u	 r13,r0,hi16(_char_type_node)
	ld	 r13,r13,lo16(_char_type_node)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L5860
	or.u	 r13,r0,hi16(_signed_char_type_node)
	ld	 r13,r13,lo16(_signed_char_type_node)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L5860
	or.u	 r13,r0,hi16(_unsigned_char_type_node)
	ld	 r13,r13,lo16(_unsigned_char_type_node)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L5860
	or.u	 r13,r0,hi16(_short_integer_type_node)
	ld	 r13,r13,lo16(_short_integer_type_node)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L5860
	or.u	 r13,r0,hi16(_short_unsigned_type_node)
	ld	 r13,r13,lo16(_short_unsigned_type_node)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L5864
@L5860:
	ld	 r13,r22,8
	bb0.n	 (31-14),r13,@L5861
	or.u	 r13,r0,hi16(_flag_traditional)
	ld	 r13,r13,lo16(_flag_traditional)
	bcnd.n	 ne0,r13,@L6495
	or.u	 r13,r0,hi16(_unsigned_type_node)
	or.u	 r13,r0,hi16(_integer_type_node)
	ld	 r12,r13,lo16(_integer_type_node)
	ld.bu	 r13,r22,25
	ld.bu	 r12,r12,25
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L6496
	or.u	 r13,r0,hi16(_integer_type_node)
	or.u	 r13,r0,hi16(_unsigned_type_node)
@L6495:
	ld	 r2,r13,lo16(_unsigned_type_node)
	br	 @L5863
	align	 4
@L5861:
	or.u	 r13,r0,hi16(_integer_type_node)
@L6496:
	ld	 r2,r13,lo16(_integer_type_node)
@L5863:
	ld	 r4,r22,8
	extu	 r3,r4,1<18>
@L6427:
	bsr.n	 _build_type_variant
	extu	 r4,r4,1<19>
	br.n	 @L5864
	st	 r2,r24,48
	align	 4
@L5842:
	ld	 r8,r31,148
	cmp	 r13,r8,3
	bb1.n	 ne,r13,@L5865
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r22,r13
	bb0	 ne,r13,@L6076
	ld.bu	 r12,r22,8
	cmp	 r13,r12,23
	bb1	 ne,r13,@L5868
	ld	 r8,r31,196
	bcnd	 ne0,r8,@L5869
	bcnd.n	 ne0,r20,@L5871
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r20,r13,lo16(_current_class_type)
	bcnd	 ne0,r20,@L5871
	ld	 r13,r17,8
	or.u	 r12,r0,hi16(@LC351)
	extu	 r11,r13,1<7>
	bcnd.n	 eq0,r11,@L5872
	or	 r24,r12,lo16(@LC351)
	or.u	 r13,r0,hi16(@LC352)
	br.n	 @L5873
	or	 r25,r13,lo16(@LC352)
	align	 4
@L5872:
	or.u	 r13,r0,hi16(@LC353)
	or	 r25,r13,lo16(@LC353)
@L5873:
	bcnd	 eq0,r11,@L5874
	bsr.n	 _operator_name_string
	or	 r2,r0,r17
	br.n	 @L5875
	or	 r4,r0,r2
	align	 4
@L5874:
	ld	 r4,r17,16
@L5875:
	or	 r2,r0,r24
	br.n	 @L6428
	or	 r3,r0,r25
	align	 4
@L5871:
	ld	 r8,r31,188
	bcnd	 eq0,r8,@L5876
	ld.bu	 r13,r20,8
	cmp	 r13,r13,22
	bb1.n	 ne,r13,@L5876
	or.u	 r2,r0,hi16(@LC354)
	ld	 r3,r17,16
	or	 r2,r2,lo16(@LC354)
	bsr.n	 _error
	addu	 r1,r1,@L6599
@L6600:
	align	 4
@L5876:
	ld	 r8,r31,212
	cmp	 r13,r8,1
	bb1.n	 gt,r13,@L5869
	or.u	 r12,r0,hi16(_ansi_opname+508)
	ld	 r13,r12,lo16(_ansi_opname+508)
	cmp	 r13,r17,r13
	bb0.n	 ne,r13,@L5869
	or	 r12,r12,lo16(_ansi_opname+508)
	subu	 r13,r12,16
	ld	 r13,r0,r13
	cmp	 r13,r17,r13
	bb0	 ne,r13,@L5869
	ld	 r4,r31,180
	ld	 r3,r31,172
	bsr.n	 _build_type_variant
	or	 r2,r0,r20
	ld	 r3,r22,4
	bsr.n	 _build_cplus_method_type
	ld	 r4,r22,12
	or	 r22,r0,r2
@L5869:
	ld	 r8,r31,188
	st	 r8,r31,316
	ld	 r8,r31,164
	st	 r8,r31,324
	ld	 r8,r31,196
	ld	 r15,r31,308
	or	 r18,r0,r22
	cmp	 r13,r8,0
	st	 r0,r31,340
	ext	 r13,r13,1<ne>
	bcnd.n	 eq0,r20,@L5882
	st	 r13,r31,332
	ld.bu	 r12,r22,8
	ld	 r13,r20,48
	cmp	 r12,r12,23
	ld.bu	 r11,r13,8
	or	 r19,r0,r13
	extu	 r12,r12,1<eq>
	cmp	 r11,r11,32
	bb1.n	 ne,r11,@L5885
	st	 r12,r31,340
	ld	 r19,r19,32
	br	 @L5885
	align	 4
@L5882:
	or	 r19,r0,0
@L5885:
	ld	 r8,r31,324
	bcnd.n	 eq0,r8,@L5886
	or	 r2,r0,r20
	ld	 r4,r31,324
	bsr.n	 _build_exception_variant
	or	 r3,r0,r18
	or	 r18,r0,r2
	ld	 r8,r18,72
	st	 r8,r31,324
@L5886:
	or	 r2,r0,29
	or	 r3,r0,r17
	bsr.n	 _build_lang_decl
	or	 r4,r0,r18
	ld	 r13,r18,8
	bb0.n	 (31-12),r13,@L5887
	or	 r23,r0,r2
	ld	 r13,r23,8
	or.u	 r13,r13,0x8
	st	 r13,r23,8
@L5887:
	ld	 r8,r31,340
	bcnd	 eq0,r8,@L5888
	ld	 r13,r23,80
	ld	 r12,r0,r13
	or.u	 r12,r12,0x4
	st	 r12,r0,r13
	ld	 r13,r23,80
	st	 r20,r23,36
	st	 r20,r13,8
@L5888:
	ld	 r13,r23,28
	or.u	 r13,r13,0x80
	bcnd.n	 eq0,r15,@L5889
	st	 r13,r23,28
	ld.bu	 r13,r18,8
	cmp	 r13,r13,23
	bb1.n	 ne,r13,@L6497
	or.u	 r13,r0,hi16(_ansi_opname+492)
	or.u	 r2,r0,hi16(@LC242)
	or	 r2,r2,lo16(@LC242)
	bsr.n	 _error
	or	 r15,r0,0
@L5889:
	or.u	 r13,r0,hi16(_ansi_opname+492)
@L6497:
	ld	 r13,r13,lo16(_ansi_opname+492)
	cmp	 r13,r17,r13
	bb1	 ne,r13,@L5890
	ld	 r21,r18,12
	cmp	 r13,r20,0
	cmp	 r12,r21,0
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd	 eq0,r13,@L5891
	ld.bu	 r13,r18,8
	cmp	 r13,r13,16
	bb1	 ne,r13,@L5891
	ld	 r21,r0,r21
@L5891:
	or.u	 r16,r0,hi16(_ptr_type_node)
	or.u	 r25,r0,hi16(_void_list_node)
	ld	 r3,r16,lo16(_ptr_type_node)
	ld	 r4,r25,lo16(_void_list_node)
	bsr.n	 _tree_cons
	or	 r2,r0,0
	or	 r3,r0,r2
	bsr.n	 _type_list_equal
	or	 r2,r0,r21
	or	 r24,r0,r2
	bcnd.n	 ne0,r24,@L5892
	or	 r2,r0,0
	ld	 r4,r25,lo16(_void_list_node)
	or.u	 r13,r0,hi16(_sizetype)
	ld	 r3,r13,lo16(_sizetype)
	bsr.n	 _tree_cons
	ld	 r25,r16,lo16(_ptr_type_node)
	or	 r4,r0,r2
	or	 r2,r0,0
	bsr.n	 _tree_cons
	or	 r3,r0,r25
	or	 r3,r0,r2
	or	 r2,r0,r21
	bsr.n	 _type_list_equal
	addu	 r1,r1,@L6601
@L6602:
	align	 4
@L5892:
@L5893:
	bcnd.n	 ne0,r20,@L5894
	cmp	 r13,r24,0
	bcnd.n	 ne0,r24,@L5890
	or.u	 r2,r0,hi16(@LC243)
	br.n	 @L6429
	or	 r2,r2,lo16(@LC243)
	align	 4
@L5894:
	cmp	 r12,r2,0
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L5890
	or.u	 r2,r0,hi16(@LC244)
	or	 r2,r2,lo16(@LC244)
@L6429:
	bsr	 _error
@L5890:
	ld	 r8,r31,332
	bcnd.n	 lt0,r8,@L5924
	cmp	 r13,r20,0
	ld	 r8,r31,300
	cmp	 r12,r8,0
	and.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5899
	bsr.n	 _constructor_name
	or	 r2,r0,r19
	cmp	 r2,r2,r17
	bb1	 ne,r2,@L5899
	ld	 r12,r23,80
	or	 r2,r0,r20
	or	 r3,r0,r17
	ld	 r13,r0,r12
	or	 r4,r0,r23
	ld	 r5,r31,300
	or	 r6,r0,r15
	or.u	 r13,r13,0x40
	bsr.n	 _grokclassfn
	st	 r13,r0,r12
	ld	 r8,r31,332
	bcnd.n	 eq0,r8,@L5900
	or	 r2,r0,r20
	ld	 r5,r31,300
	or	 r3,r0,r17
	bsr.n	 _check_classfn
	or	 r4,r0,r23
@L5900:
	or	 r2,r0,r20
	bsr.n	 _grok_ctor_properties
	or	 r3,r0,r23
	ld	 r8,r31,332
	bcnd.n	 ne0,r8,@L5924
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	ld	 r25,r23,60
	bb0	 ne,r13,@L5903
	ld	 r2,r25,24
	bcnd	 ne0,r2,@L5904
@L5903:
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r12,r13,lo16(_current_class_type)
	bcnd	 eq0,r12,@L5905
	ld	 r2,r25,28
	bcnd	 ne0,r2,@L6274
	ld	 r13,r12,16
	bcnd	 ne0,r13,@L5906
	ld	 r13,r12,80
	ld	 r13,r0,r13
	bb0	 (31-24),r13,@L5906
	or	 r2,r0,r12
	or	 r3,r0,r25
	or	 r4,r0,0
	bsr.n	 _lookup_field
	or	 r5,r0,0
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r2,r13
	bb0	 ne,r13,@L5912
	bcnd	 eq0,r2,@L6273
	ld.bu	 r13,r2,8
	cmp	 r13,r13,32
	ext	 r13,r13,1<eq>
	and	 r2,r2,r13
@L5906:
	bcnd	 ne0,r2,@L6274
@L6273:
	bsr.n	 _lookup_nested_field
	or	 r2,r0,r25
	bcnd	 ne0,r2,@L6274
@L5905:
	ld	 r2,r25,20
@L5904:
	bcnd	 eq0,r2,@L5912
@L6274:
	ld.bu	 r13,r2,8
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L5912
	or.u	 r13,r0,hi16(_looking_for_typename)
	ld	 r12,r13,lo16(_looking_for_typename)
	bcnd	 lt0,r12,@L5912
	ld	 r3,r25,4
	bcnd	 eq0,r3,@L5915
	ld	 r3,r3,48
	cmp	 r13,r2,r3
	extu	 r13,r13,1<eq>
	bcnd	 ne0,r13,@L6430
	bcnd.n	 gt0,r12,@L5902
	or	 r25,r0,r3
	br.n	 @L5902
	or	 r25,r0,r2
	align	 4
@L5915:
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r3,r2,4
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L5902
	or	 r25,r0,r2
@L6430:
	br.n	 @L5902
	or	 r25,r0,r3
	align	 4
@L5912:
	or	 r25,r0,r2
@L5902:
	bcnd	 ne0,r25,@L5920
	ld	 r13,r23,60
	br.n	 @L5921
	st	 r23,r13,20
	align	 4
@L5920:
	ld.bu	 r13,r25,8
	ld.bu	 r12,r23,8
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L5922
	or.u	 r3,r0,hi16(@LC245)
	or	 r2,r0,r23
	or	 r3,r3,lo16(@LC245)
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L6603
@L6604:
	align	 4
@L5922:
	or	 r3,r0,r25
	or	 r2,r0,r23
	bsr.n	 _duplicate_decls
	or	 r23,r0,r3
@L5921:
	or	 r2,r0,r23
	or	 r3,r0,0
	or	 r4,r0,1
	bsr.n	 _make_decl_rtl
	addu	 r1,r1,@L6605
@L6606:
	align	 4
@L5899:
	bcnd.n	 eq0,r20,@L5925
	or	 r2,r0,r20
	ld	 r5,r31,300
	or	 r3,r0,r19
	or	 r4,r0,r23
	bsr.n	 _grokclassfn
	or	 r6,r0,r15
@L5925:
	ld	 r13,r23,32
	ld	 r13,r13,8
	bb0	 (31-24),r13,@L5926
	ld	 r3,r31,316
	bsr.n	 _grok_op_properties
	or	 r2,r0,r23
@L5926:
	ld	 r8,r31,332
	cmp	 r24,r20,0
	extu	 r13,r24,1<ne>
	subu	 r25,r0,r8
	and	 r13,r13,r25
	bcnd.n	 eq0,r13,@L5927
	or	 r2,r0,r20
	ld	 r5,r31,300
	or	 r3,r0,r19
	bsr.n	 _check_classfn
	or	 r4,r0,r23
@L5927:
	extu	 r13,r24,1<eq>
	or	 r13,r13,r25
	bcnd.n	 ne0,r13,@L5924
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	ld	 r25,r23,60
	bb0	 ne,r13,@L5930
	ld	 r2,r25,24
	bcnd	 ne0,r2,@L5931
@L5930:
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r12,r13,lo16(_current_class_type)
	bcnd	 eq0,r12,@L5932
	ld	 r2,r25,28
	bcnd	 ne0,r2,@L6276
	ld	 r13,r12,16
	bcnd	 ne0,r13,@L5933
	ld	 r13,r12,80
	ld	 r13,r0,r13
	bb0	 (31-24),r13,@L5933
	or	 r2,r0,r12
	or	 r3,r0,r25
	or	 r4,r0,0
	bsr.n	 _lookup_field
	or	 r5,r0,0
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r2,r13
	bb0	 ne,r13,@L5939
	bcnd	 eq0,r2,@L6275
	ld.bu	 r13,r2,8
	cmp	 r13,r13,32
	ext	 r13,r13,1<eq>
	and	 r2,r2,r13
@L5933:
	bcnd	 ne0,r2,@L6276
@L6275:
	bsr.n	 _lookup_nested_field
	or	 r2,r0,r25
	bcnd	 ne0,r2,@L6276
@L5932:
	ld	 r2,r25,20
@L5931:
	bcnd	 eq0,r2,@L5939
@L6276:
	ld.bu	 r13,r2,8
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L5939
	or.u	 r13,r0,hi16(_looking_for_typename)
	ld	 r12,r13,lo16(_looking_for_typename)
	bcnd	 lt0,r12,@L5939
	ld	 r3,r25,4
	bcnd	 eq0,r3,@L5942
	ld	 r3,r3,48
	cmp	 r13,r2,r3
	extu	 r13,r13,1<eq>
	bcnd	 ne0,r13,@L6431
	bcnd.n	 gt0,r12,@L5929
	or	 r24,r0,r3
	br.n	 @L5929
	or	 r24,r0,r2
	align	 4
@L5942:
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r3,r2,4
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L5929
	or	 r24,r0,r2
@L6431:
	br.n	 @L5929
	or	 r24,r0,r3
	align	 4
@L5939:
	or	 r24,r0,r2
@L5929:
	bcnd	 ne0,r24,@L5947
	ld	 r13,r23,60
	br.n	 @L5948
	st	 r23,r13,20
	align	 4
@L5947:
	ld.bu	 r13,r24,8
	ld.bu	 r12,r23,8
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L5949
	or.u	 r3,r0,hi16(@LC246)
	or	 r2,r0,r23
	or	 r3,r3,lo16(@LC246)
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L6607
@L6608:
	align	 4
@L6299:
	or.u	 r3,r0,hi16(@LC247)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC247)
	or.u	 r3,r0,hi16(@LC248)
	or	 r2,r0,r24
	or	 r3,r3,lo16(@LC248)
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L6609
@L6610:
	align	 4
@L5949:
	or	 r3,r0,r24
	or	 r2,r0,r23
	bsr.n	 _duplicate_decls
	or	 r23,r0,r3
@L5948:
	or	 r2,r0,r23
	or	 r3,r0,0
	bsr.n	 _make_decl_rtl
	or	 r4,r0,1
	ld	 r13,r20,68
	ld	 r13,r13,32
	bcnd.n	 eq0,r13,@L5951
	or	 r15,r0,0
	ld	 r15,r13,12
@L5951:
	bcnd.n	 le0,r15,@L5954
	or	 r19,r0,0
	or	 r16,r0,r13
@L5956:
	ld	 r25,r16,16
	ld	 r13,r25,4
	ld	 r13,r13,8
	bb1.n	 (31-24),r13,@L5958
	or.u	 r13,r0,hi16(_flag_all_virtual)
	ld	 r13,r13,lo16(_flag_all_virtual)
	cmp	 r13,r13,1
	bb1	 ne,r13,@L5955
@L5958:
	ld	 r8,r31,300
	cmp	 r13,r8,1
	or	 r2,r0,r25
	extu	 r21,r13,1<eq>
	or	 r3,r0,r23
	bsr.n	 _get_first_matching_virtual
	or	 r4,r0,r21
	or	 r24,r0,r2
	bcnd	 eq0,r24,@L5955
	ld	 r8,r31,340
	bcnd	 ne0,r8,@L6299
	ld	 r2,r25,4
	ld	 r13,r2,8
	or	 r8,r0,1
	bb1.n	 (31-25),r13,@L5962
	st	 r8,r31,316
	ld	 r13,r20,80
	ld	 r13,r0,r13
	bb0	 (31-10),r13,@L5961
@L5962:
	ld	 r12,r24,36
	cmp	 r13,r2,r12
	bb0	 ne,r13,@L5961
	ld	 r2,r12,68
	or	 r3,r0,r23
	bsr.n	 _get_first_matching_virtual
	or	 r4,r0,r21
	or	 r24,r0,r2
@L5961:
	ld	 r3,r23,76
	bsr.n	 _value_member
	or	 r2,r0,r24
	bcnd	 ne0,r2,@L5955
	ld	 r13,r24,4
	ld	 r12,r23,4
	ld	 r13,r13,12
	ld	 r4,r12,12
	ld	 r2,r0,r13
	ld	 r13,r4,16
	ld	 r3,r0,r4
	bsr.n	 _commonparms
	ld	 r25,r13,4
	or	 r4,r0,r2
	ld	 r3,r18,4
	bsr.n	 _build_cplus_method_type
	or	 r2,r0,r25
	ld	 r8,r31,324
	bcnd.n	 eq0,r8,@L5964
	or	 r18,r0,r2
	ld	 r4,r31,324
	or	 r2,r0,r20
	bsr.n	 _build_exception_variant
	or	 r3,r0,r18
	or	 r18,r0,r2
	ld	 r8,r18,72
	st	 r8,r31,324
@L5964:
	ld	 r4,r23,76
	or	 r2,r0,0
	or	 r3,r0,r24
	bsr.n	 _tree_cons
	st	 r18,r23,4
	st	 r2,r23,76
@L5955:
	addu	 r19,r19,1
	cmp	 r13,r19,r15
	bb1.n	 lt,r13,@L5956
	addu	 r16,r16,4
@L5954:
	ld	 r8,r31,316
	bcnd	 eq0,r8,@L5924
	ld	 r13,r23,76
	bcnd.n	 ne0,r13,@L5967
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	st	 r13,r23,76
@L5967:
	ld	 r12,r23,32
	ld	 r13,r12,8
	or	 r13,r13,256
	bcnd.n	 eq0,r20,@L5924
	st	 r13,r12,8
	ld	 r13,r20,80
	ld	 r11,r0,r13
	bb0	 (31-16),r11,@L5924
	ld	 r13,r20,48
	ld	 r13,r13,32
	ld	 r13,r13,32
	bcnd.n	 ne0,r13,@L6498
	or	 r24,r0,r23
	or.u	 r13,r0,hi16(_write_virtuals)
	ld	 r12,r13,lo16(_write_virtuals)
	cmp	 r13,r12,2
	bb0.n	 ne,r13,@L5969
	cmp	 r13,r12,3
	bb1	 ne,r13,@L6498
	bb1	 (31-26),r11,@L6498
@L5969:
	ld	 r13,r23,8
	or	 r13,r13,4096
	st	 r13,r23,8
@L5924:
	or	 r24,r0,r23
@L6498:
	ld	 r13,r23,28
	ld	 r8,r31,204
	and.u	 r13,r13,0xffef
	mak	 r12,r8,0<20>
	or	 r13,r13,r12
	bb1.n	 (31-14),r14,@L5971
	st	 r13,r24,28
	ld	 r8,r31,252
	cmp	 r13,r20,0
	extu	 r13,r13,1<ne>
	xor.c	 r12,r8,r0
	extu	 r12,r12,0<31>
	and	 r13,r13,r12
	bcnd	 ne0,r13,@L5971
	ld	 r8,r31,196
	bcnd.n	 eq0,r8,@L6079
	mask.u	 r13,r14,0x81
	bcnd	 ne0,r13,@L6499
@L5971:
	ld	 r13,r24,8
	or	 r13,r13,4096
	br.n	 @L5867
	st	 r13,r24,8
	align	 4
@L5868:
	cmp	 r13,r12,16
	bb1.n	 ne,r13,@L5973
	cmp	 r13,r12,21
	ld	 r8,r31,188
	st	 r8,r31,348
	ld	 r8,r31,196
	ld	 r15,r31,308
	cmp	 r13,r8,0
	ld	 r8,r31,164
	or	 r18,r0,r22
	st	 r8,r31,356
	ext	 r13,r13,1<ne>
	bcnd.n	 eq0,r20,@L5978
	st	 r13,r31,364
	ld	 r12,r20,48
	ld.bu	 r13,r12,8
	cmp	 r13,r13,32
	bb1.n	 ne,r13,@L5981
	or	 r19,r0,r12
	ld	 r19,r19,32
	br	 @L5981
	align	 4
@L5978:
	or	 r19,r0,0
@L5981:
	ld	 r8,r31,356
	bcnd.n	 eq0,r8,@L5982
	or	 r2,r0,r20
	ld	 r4,r31,356
	bsr.n	 _build_exception_variant
	or	 r3,r0,r18
	or	 r18,r0,r2
	ld	 r8,r18,72
	st	 r8,r31,356
@L5982:
	or	 r2,r0,29
	or	 r3,r0,r17
	bsr.n	 _build_lang_decl
	or	 r4,r0,r18
	ld	 r13,r18,8
	bb0.n	 (31-12),r13,@L5983
	or	 r23,r0,r2
	ld	 r13,r23,8
	or.u	 r13,r13,0x8
	st	 r13,r23,8
@L5983:
	or	 r8,r0,0
	bcnd	 eq0,r8,@L5984
	ld	 r13,r23,80
	ld	 r12,r0,r13
	or.u	 r12,r12,0x4
	st	 r12,r0,r13
	ld	 r13,r23,80
	st	 r20,r23,36
	st	 r20,r13,8
@L5984:
	ld	 r13,r23,28
	or.u	 r13,r13,0x80
	bcnd.n	 eq0,r15,@L5985
	st	 r13,r23,28
	ld.bu	 r13,r18,8
	cmp	 r13,r13,23
	bb1.n	 ne,r13,@L6500
	or.u	 r13,r0,hi16(_ansi_opname+492)
	or.u	 r2,r0,hi16(@LC242)
	or	 r2,r2,lo16(@LC242)
	bsr.n	 _error
	or	 r15,r0,0
@L5985:
	or.u	 r13,r0,hi16(_ansi_opname+492)
@L6500:
	ld	 r13,r13,lo16(_ansi_opname+492)
	cmp	 r13,r17,r13
	bb1	 ne,r13,@L5986
	ld	 r21,r18,12
	cmp	 r13,r20,0
	cmp	 r12,r21,0
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd	 eq0,r13,@L5987
	ld.bu	 r13,r18,8
	cmp	 r13,r13,16
	bb1	 ne,r13,@L5987
	ld	 r21,r0,r21
@L5987:
	or.u	 r16,r0,hi16(_ptr_type_node)
	or.u	 r25,r0,hi16(_void_list_node)
	ld	 r3,r16,lo16(_ptr_type_node)
	ld	 r4,r25,lo16(_void_list_node)
	bsr.n	 _tree_cons
	or	 r2,r0,0
	or	 r3,r0,r2
	bsr.n	 _type_list_equal
	or	 r2,r0,r21
	or	 r24,r0,r2
	bcnd.n	 ne0,r24,@L5988
	or	 r2,r0,0
	ld	 r4,r25,lo16(_void_list_node)
	or.u	 r13,r0,hi16(_sizetype)
	ld	 r3,r13,lo16(_sizetype)
	bsr.n	 _tree_cons
	ld	 r25,r16,lo16(_ptr_type_node)
	or	 r4,r0,r2
	or	 r2,r0,0
	bsr.n	 _tree_cons
	or	 r3,r0,r25
	or	 r3,r0,r2
	or	 r2,r0,r21
	bsr.n	 _type_list_equal
	addu	 r1,r1,@L6611
@L6612:
	align	 4
@L5988:
@L5989:
	bcnd.n	 ne0,r20,@L5990
	cmp	 r13,r24,0
	bcnd.n	 ne0,r24,@L5986
	or.u	 r2,r0,hi16(@LC243)
	br.n	 @L6432
	or	 r2,r2,lo16(@LC243)
	align	 4
@L5990:
	cmp	 r12,r2,0
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L5986
	or.u	 r2,r0,hi16(@LC244)
	or	 r2,r2,lo16(@LC244)
@L6432:
	bsr	 _error
@L5986:
	ld	 r8,r31,364
	bcnd.n	 lt0,r8,@L6020
	cmp	 r13,r20,0
	ld	 r8,r31,300
	cmp	 r12,r8,0
	and.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5995
	bsr.n	 _constructor_name
	or	 r2,r0,r19
	cmp	 r2,r2,r17
	bb1	 ne,r2,@L5995
	ld	 r12,r23,80
	or	 r2,r0,r20
	or	 r3,r0,r17
	ld	 r13,r0,r12
	or	 r4,r0,r23
	ld	 r5,r31,300
	or	 r6,r0,r15
	or.u	 r13,r13,0x40
	bsr.n	 _grokclassfn
	st	 r13,r0,r12
	ld	 r8,r31,364
	bcnd.n	 eq0,r8,@L5996
	or	 r2,r0,r20
	ld	 r5,r31,300
	or	 r3,r0,r17
	bsr.n	 _check_classfn
	or	 r4,r0,r23
@L5996:
	or	 r2,r0,r20
	bsr.n	 _grok_ctor_properties
	or	 r3,r0,r23
	ld	 r8,r31,364
	bcnd.n	 ne0,r8,@L6020
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	ld	 r25,r23,60
	bb0	 ne,r13,@L5999
	ld	 r2,r25,24
	bcnd	 ne0,r2,@L6000
@L5999:
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r12,r13,lo16(_current_class_type)
	bcnd	 eq0,r12,@L6001
	ld	 r2,r25,28
	bcnd	 ne0,r2,@L6278
	ld	 r13,r12,16
	bcnd	 ne0,r13,@L6002
	ld	 r13,r12,80
	ld	 r13,r0,r13
	bb0	 (31-24),r13,@L6002
	or	 r2,r0,r12
	or	 r3,r0,r25
	or	 r4,r0,0
	bsr.n	 _lookup_field
	or	 r5,r0,0
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r2,r13
	bb0	 ne,r13,@L6008
	bcnd	 eq0,r2,@L6277
	ld.bu	 r13,r2,8
	cmp	 r13,r13,32
	ext	 r13,r13,1<eq>
	and	 r2,r2,r13
@L6002:
	bcnd	 ne0,r2,@L6278
@L6277:
	bsr.n	 _lookup_nested_field
	or	 r2,r0,r25
	bcnd	 ne0,r2,@L6278
@L6001:
	ld	 r2,r25,20
@L6000:
	bcnd	 eq0,r2,@L6008
@L6278:
	ld.bu	 r13,r2,8
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L6008
	or.u	 r13,r0,hi16(_looking_for_typename)
	ld	 r12,r13,lo16(_looking_for_typename)
	bcnd	 lt0,r12,@L6008
	ld	 r3,r25,4
	bcnd	 eq0,r3,@L6011
	ld	 r3,r3,48
	cmp	 r13,r2,r3
	extu	 r13,r13,1<eq>
	bcnd	 ne0,r13,@L6433
	bcnd.n	 gt0,r12,@L5998
	or	 r25,r0,r3
	br.n	 @L5998
	or	 r25,r0,r2
	align	 4
@L6011:
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r3,r2,4
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L5998
	or	 r25,r0,r2
@L6433:
	br.n	 @L5998
	or	 r25,r0,r3
	align	 4
@L6008:
	or	 r25,r0,r2
@L5998:
	bcnd	 ne0,r25,@L6016
	ld	 r13,r23,60
	br.n	 @L6017
	st	 r23,r13,20
	align	 4
@L6016:
	ld.bu	 r13,r25,8
	ld.bu	 r12,r23,8
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L6018
	or.u	 r3,r0,hi16(@LC245)
	or	 r2,r0,r23
	or	 r3,r3,lo16(@LC245)
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L6613
@L6614:
	align	 4
@L6018:
	or	 r3,r0,r25
	or	 r2,r0,r23
	bsr.n	 _duplicate_decls
	or	 r23,r0,r3
@L6017:
	or	 r2,r0,r23
	or	 r3,r0,0
	or	 r4,r0,1
	bsr.n	 _make_decl_rtl
	addu	 r1,r1,@L6615
@L6616:
	align	 4
@L5995:
	bcnd.n	 eq0,r20,@L6021
	or	 r2,r0,r20
	ld	 r5,r31,300
	or	 r3,r0,r19
	or	 r4,r0,r23
	bsr.n	 _grokclassfn
	or	 r6,r0,r15
@L6021:
	ld	 r13,r23,32
	ld	 r13,r13,8
	bb0	 (31-24),r13,@L6022
	ld	 r3,r31,348
	bsr.n	 _grok_op_properties
	or	 r2,r0,r23
@L6022:
	ld	 r8,r31,364
	cmp	 r24,r20,0
	extu	 r13,r24,1<ne>
	subu	 r25,r0,r8
	and	 r13,r13,r25
	bcnd.n	 eq0,r13,@L6023
	or	 r2,r0,r20
	ld	 r5,r31,300
	or	 r3,r0,r19
	bsr.n	 _check_classfn
	or	 r4,r0,r23
@L6023:
	extu	 r13,r24,1<eq>
	or	 r13,r13,r25
	bcnd.n	 ne0,r13,@L6020
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	ld	 r25,r23,60
	bb0	 ne,r13,@L6026
	ld	 r2,r25,24
	bcnd	 ne0,r2,@L6027
@L6026:
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r12,r13,lo16(_current_class_type)
	bcnd	 eq0,r12,@L6028
	ld	 r2,r25,28
	bcnd	 ne0,r2,@L6280
	ld	 r13,r12,16
	bcnd	 ne0,r13,@L6029
	ld	 r13,r12,80
	ld	 r13,r0,r13
	bb0	 (31-24),r13,@L6029
	or	 r2,r0,r12
	or	 r3,r0,r25
	or	 r4,r0,0
	bsr.n	 _lookup_field
	or	 r5,r0,0
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r2,r13
	bb0	 ne,r13,@L6035
	bcnd	 eq0,r2,@L6279
	ld.bu	 r13,r2,8
	cmp	 r13,r13,32
	ext	 r13,r13,1<eq>
	and	 r2,r2,r13
@L6029:
	bcnd	 ne0,r2,@L6280
@L6279:
	bsr.n	 _lookup_nested_field
	or	 r2,r0,r25
	bcnd	 ne0,r2,@L6280
@L6028:
	ld	 r2,r25,20
@L6027:
	bcnd	 eq0,r2,@L6035
@L6280:
	ld.bu	 r13,r2,8
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L6035
	or.u	 r13,r0,hi16(_looking_for_typename)
	ld	 r12,r13,lo16(_looking_for_typename)
	bcnd	 lt0,r12,@L6035
	ld	 r3,r25,4
	bcnd	 eq0,r3,@L6038
	ld	 r3,r3,48
	cmp	 r13,r2,r3
	extu	 r13,r13,1<eq>
	bcnd	 ne0,r13,@L6434
	bcnd.n	 gt0,r12,@L6025
	or	 r24,r0,r3
	br.n	 @L6025
	or	 r24,r0,r2
	align	 4
@L6038:
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r3,r2,4
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L6025
	or	 r24,r0,r2
@L6434:
	br.n	 @L6025
	or	 r24,r0,r3
	align	 4
@L6035:
	or	 r24,r0,r2
@L6025:
	bcnd	 ne0,r24,@L6043
	ld	 r13,r23,60
	br.n	 @L6044
	st	 r23,r13,20
	align	 4
@L6043:
	ld.bu	 r13,r24,8
	ld.bu	 r12,r23,8
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L6045
	or.u	 r3,r0,hi16(@LC246)
	or	 r2,r0,r23
	or	 r3,r3,lo16(@LC246)
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L6617
@L6618:
	align	 4
@L6300:
	or.u	 r3,r0,hi16(@LC247)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC247)
	or.u	 r3,r0,hi16(@LC248)
	or	 r2,r0,r24
	or	 r3,r3,lo16(@LC248)
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L6619
@L6620:
	align	 4
@L6045:
	or	 r3,r0,r24
	or	 r2,r0,r23
	bsr.n	 _duplicate_decls
	or	 r23,r0,r3
@L6044:
	or	 r2,r0,r23
	or	 r3,r0,0
	bsr.n	 _make_decl_rtl
	or	 r4,r0,1
	ld	 r13,r20,68
	ld	 r13,r13,32
	bcnd.n	 eq0,r13,@L6047
	or	 r15,r0,0
	ld	 r15,r13,12
@L6047:
	bcnd.n	 le0,r15,@L6050
	or	 r19,r0,0
	or	 r16,r0,r13
@L6052:
	ld	 r25,r16,16
	ld	 r13,r25,4
	ld	 r13,r13,8
	bb1.n	 (31-24),r13,@L6054
	or.u	 r13,r0,hi16(_flag_all_virtual)
	ld	 r13,r13,lo16(_flag_all_virtual)
	cmp	 r13,r13,1
	bb1	 ne,r13,@L6051
@L6054:
	ld	 r8,r31,300
	cmp	 r13,r8,1
	or	 r2,r0,r25
	extu	 r21,r13,1<eq>
	or	 r3,r0,r23
	bsr.n	 _get_first_matching_virtual
	or	 r4,r0,r21
	or	 r24,r0,r2
	bcnd.n	 eq0,r24,@L6051
	or	 r8,r0,0
	bcnd	 ne0,r8,@L6300
	ld	 r2,r25,4
	ld	 r13,r2,8
	or	 r8,r0,1
	bb1.n	 (31-25),r13,@L6058
	st	 r8,r31,348
	ld	 r13,r20,80
	ld	 r13,r0,r13
	bb0	 (31-10),r13,@L6057
@L6058:
	ld	 r12,r24,36
	cmp	 r13,r2,r12
	bb0	 ne,r13,@L6057
	ld	 r2,r12,68
	or	 r3,r0,r23
	bsr.n	 _get_first_matching_virtual
	or	 r4,r0,r21
	or	 r24,r0,r2
@L6057:
	ld	 r3,r23,76
	bsr.n	 _value_member
	or	 r2,r0,r24
	bcnd	 ne0,r2,@L6051
	ld	 r13,r24,4
	ld	 r12,r23,4
	ld	 r13,r13,12
	ld	 r4,r12,12
	ld	 r2,r0,r13
	ld	 r13,r4,16
	ld	 r3,r0,r4
	bsr.n	 _commonparms
	ld	 r25,r13,4
	or	 r4,r0,r2
	ld	 r3,r18,4
	bsr.n	 _build_cplus_method_type
	or	 r2,r0,r25
	ld	 r8,r31,356
	bcnd.n	 eq0,r8,@L6060
	or	 r18,r0,r2
	ld	 r4,r31,356
	or	 r2,r0,r20
	bsr.n	 _build_exception_variant
	or	 r3,r0,r18
	or	 r18,r0,r2
	ld	 r8,r18,72
	st	 r8,r31,356
@L6060:
	ld	 r4,r23,76
	or	 r2,r0,0
	or	 r3,r0,r24
	bsr.n	 _tree_cons
	st	 r18,r23,4
	st	 r2,r23,76
@L6051:
	addu	 r19,r19,1
	cmp	 r13,r19,r15
	bb1.n	 lt,r13,@L6052
	addu	 r16,r16,4
@L6050:
	ld	 r8,r31,348
	bcnd	 eq0,r8,@L6020
	ld	 r13,r23,76
	bcnd.n	 ne0,r13,@L6063
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	st	 r13,r23,76
@L6063:
	ld	 r12,r23,32
	ld	 r13,r12,8
	or	 r13,r13,256
	bcnd.n	 eq0,r20,@L6020
	st	 r13,r12,8
	ld	 r13,r20,80
	ld	 r11,r0,r13
	bb0	 (31-16),r11,@L6020
	ld	 r13,r20,48
	ld	 r13,r13,32
	ld	 r13,r13,32
	bcnd.n	 ne0,r13,@L6501
	or	 r24,r0,r23
	or.u	 r13,r0,hi16(_write_virtuals)
	ld	 r12,r13,lo16(_write_virtuals)
	cmp	 r13,r12,2
	bb0.n	 ne,r13,@L6065
	cmp	 r13,r12,3
	bb1	 ne,r13,@L6501
	bb1	 (31-26),r11,@L6501
@L6065:
	ld	 r13,r23,8
	or	 r13,r13,4096
	st	 r13,r23,8
@L6020:
	or	 r24,r0,r23
@L6501:
	ld	 r13,r23,28
	ld	 r12,r24,8
	ld	 r8,r31,204
	and.u	 r13,r13,0xffef
	mak	 r11,r8,0<20>
	or	 r12,r12,4096
	st	 r12,r24,8
	or	 r13,r13,r11
	br.n	 @L5867
	st	 r13,r24,28
	align	 4
@L5973:
	bb1	 ne,r13,@L6067
	ld	 r13,r22,80
	ld	 r13,r0,r13
	bb0.n	 (31-28),r13,@L6067
	or	 r2,r0,33
	or	 r3,r0,r17
	bsr.n	 _build_lang_field_decl
	or	 r4,r0,r22
	bcnd.n	 ne0,r20,@L6068
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r20,r13,lo16(_current_class_type)
@L6068:
	ld	 r12,r20,48
	ld.bu	 r13,r12,8
	cmp	 r13,r13,32
	bb1.n	 ne,r13,@L6069
	or	 r2,r0,r12
	ld	 r2,r2,32
@L6069:
	or	 r3,r0,r24
	bsr.n	 _finish_exception_decl
	addu	 r1,r1,@L6621
@L6622:
	align	 4
@L6067:
	ld	 r13,r22,16
	ld	 r8,r31,212
	cmp	 r13,r13,0
	cmp	 r12,r8,0
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L6072
	ld.bu	 r13,r22,8
	ld	 r8,r31,156
	cmp	 r13,r13,18
	cmp	 r12,r8,0
	or.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L6072
	bcnd.n	 eq0,r17,@L6073
	or.u	 r2,r0,hi16(@LC355)
	ld	 r3,r17,16
	or	 r2,r2,lo16(@LC355)
	bsr.n	 _error
	addu	 r1,r1,@L6623
@L6624:
	align	 4
@L6073:
	or.u	 r2,r0,hi16(@LC356)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC356)
@L6074:
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r22,r13,lo16(_error_mark_node)
	br.n	 @L5867
	or	 r24,r0,0
	align	 4
@L6072:
	ld	 r8,r31,196
	bcnd.n	 eq0,r8,@L6499
	or	 r24,r0,0
	bcnd.n	 ne0,r17,@L6077
	or.u	 r2,r0,hi16(@LC357)
	or.u	 r2,r0,hi16(@LC358)
	or	 r2,r2,lo16(@LC358)
	bsr.n	 _error
	addu	 r1,r1,@L6625
@L6626:
	align	 4
@L6077:
	ld	 r3,r17,16
	or	 r2,r2,lo16(@LC357)
	bsr.n	 _error
	st	 r0,r31,196
@L6076:
	or	 r24,r0,0
@L5867:
	ld	 r8,r31,196
@L6499:
	bcnd.n	 eq0,r8,@L6079
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r13,r13,lo16(_current_class_type)
	cmp	 r13,r20,r13
	bb1.n	 ne,r13,@L6080
	or.u	 r2,r0,hi16(@LC359)
	or	 r2,r2,lo16(@LC359)
	bsr.n	 _warning
	addu	 r1,r1,@L6627
@L6628:
	align	 4
@L6080:
	bcnd	 eq0,r24,@L6393
	ld	 r13,r24,32
	bcnd.n	 eq0,r13,@L6393
	or	 r2,r0,r20
	ld	 r6,r31,300
	or.u	 r13,r0,hi16(_last_function_parms)
	ld	 r7,r31,308
	or	 r3,r0,r17
	ld	 r5,r13,lo16(_last_function_parms)
	or	 r4,r0,r24
	bsr.n	 _do_friend
	addu	 r1,r1,@L6629
@L6630:
	align	 4
@L6079:
	bcnd	 ne0,r24,@L5864
	ld	 r8,r31,188
	bcnd	 eq0,r8,@L6085
	or.u	 r2,r0,hi16(@LC360)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC360)
@L6085:
	ld	 r8,r31,308
	bcnd	 eq0,r8,@L6086
	or.u	 r2,r0,hi16(@LC361)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC361)
@L6086:
	ld	 r8,r31,196
	bcnd	 eq0,r8,@L6087
	or.u	 r2,r0,hi16(@LC362)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC362)
@L6087:
	ld	 r8,r31,164
	bcnd	 eq0,r8,@L6088
	or.u	 r2,r0,hi16(@LC363)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC363)
@L6088:
	ld	 r8,r31,156
	bcnd	 eq0,r8,@L6089
	ld	 r8,r31,212
	bcnd.n	 eq0,r8,@L6090
	or.u	 r2,r0,hi16(@LC364)
	ld	 r3,r17,16
	or	 r2,r2,lo16(@LC364)
	bsr.n	 _error
	addu	 r1,r1,@L6631
@L6632:
	align	 4
@L6090:
	ld	 r8,r31,172
	bcnd.n	 eq0,r8,@L6508
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	bcnd	 eq0,r13,@L6089
@L6508:
	or.u	 r13,r0,hi16(@LC365)
	bcnd.n	 eq0,r8,@L6094
	or	 r2,r13,lo16(@LC365)
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	bcnd.n	 eq0,r13,@L6094
	or.u	 r13,r0,hi16(@LC366)
	br.n	 @L6095
	or	 r3,r13,lo16(@LC366)
	align	 4
@L6094:
	or.u	 r13,r0,hi16(@LC367)
	or	 r3,r13,lo16(@LC367)
@L6095:
	bsr.n	 _error
	ld	 r4,r17,16
@L6089:
	ld	 r8,r31,212
	bcnd.n	 ne0,r8,@L6502
	or	 r2,r0,33
	ld	 r8,r31,172
	cmp	 r13,r8,0
	ld	 r8,r31,156
	cmp	 r12,r8,0
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L6096
	or	 r3,r0,r17
@L6502:
	or	 r3,r0,r17
	bsr.n	 _build_lang_field_decl
	or	 r4,r0,r22
	ld	 r8,r31,212
	bcnd.n	 ne0,r8,@L6099
	or	 r24,r0,r2
	ld.bu	 r13,r22,8
	cmp	 r13,r13,18
	bb1	 ne,r13,@L6098
@L6099:
	ld	 r13,r24,8
	or	 r13,r13,8192
	st	 r13,r24,8
@L6098:
	ld	 r11,r24,28
	ld	 r8,r31,156
	and.u	 r11,r11,0xff7f
	ld	 r13,r24,8
	cmp	 r12,r8,0
	extu	 r12,r12,1<eq>
	or	 r13,r13,4096
	mak	 r12,r12,0<23>
	st	 r13,r24,8
	or	 r11,r11,r12
	br.n	 @L5864
	st	 r11,r24,28
	align	 4
@L6096:
	or	 r2,r0,36
	bsr.n	 _build_lang_field_decl
	or	 r4,r0,r22
	br.n	 @L5864
	or	 r24,r0,r2
	align	 4
@L5865:
	ld.bu	 r13,r22,8
	cmp	 r12,r13,23
	cmp	 r13,r13,16
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L6102
	st	 r0,r31,372
	bcnd.n	 eq0,r17,@L6442
	st	 r17,r31,380
	and.u	 r13,r14,0x4
	and	 r13,r13,0x8000
	bcnd	 eq0,r13,@L6104
	or.u	 r2,r0,hi16(@LC368)
	or	 r3,r0,r16
	bsr.n	 _error
	or	 r2,r2,lo16(@LC368)
@L6104:
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L6105
	mask.u	 r13,r14,0x81
	bcnd.n	 eq0,r13,@L6105
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_pedantic)
	bcnd	 eq0,r13,@L6105
	or.u	 r2,r0,hi16(@LC369)
	or	 r3,r0,r16
	bsr.n	 _pedwarn
	or	 r2,r2,lo16(@LC369)
@L6105:
	bcnd	 ne0,r20,@L6106
	ld	 r8,r31,188
	bcnd.n	 eq0,r8,@L6107
	or.u	 r2,r0,hi16(@LC370)
	or	 r3,r0,r16
	or	 r2,r2,lo16(@LC370)
	bsr.n	 _error
	st	 r0,r31,188
@L6107:
	or.u	 r13,r0,hi16(_current_lang_name)
	or.u	 r12,r0,hi16(_lang_name_cplusplus)
	ld	 r13,r13,lo16(_current_lang_name)
	ld	 r12,r12,lo16(_lang_name_cplusplus)
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L6111
	ld	 r8,r31,380
	ld	 r13,r8,12
	cmp	 r13,r13,4
	bb1	 ne,r13,@L6503
	ld	 r2,r8,16
	ld.b	 r13,r0,r2
	cmp	 r13,r13,109
	bb1	 ne,r13,@L6503
	or.u	 r3,r0,hi16(@LC371)
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC371)
	bcnd	 eq0,r2,@L6111
	ld	 r8,r31,380
@L6503:
	ld	 r13,r8,12
	cmp	 r13,r13,10
	bb0	 gt,r13,@L6110
	ld	 r2,r8,16
	ld.b	 r13,r0,r2
	cmp	 r13,r13,95
	bb1	 ne,r13,@L6110
	ld.b	 r13,r2,1
	cmp	 r13,r13,95
	bb1	 ne,r13,@L6110
	addu	 r2,r2,2
	or.u	 r3,r0,hi16(@LC372)
	or	 r4,r0,8
	bsr.n	 _strncmp
	or	 r3,r3,lo16(@LC372)
	bcnd	 eq0,r2,@L6111
@L6110:
	ld	 r3,r22,12
	ld	 r2,r31,292
	or	 r4,r0,0
	or	 r8,r0,1
	bsr.n	 _build_decl_overload
	st	 r8,r31,372
	br.n	 @L6111
	or	 r17,r0,r2
	align	 4
@L6106:
	ld.bu	 r13,r22,8
	ld	 r8,r31,212
	cmp	 r13,r13,23
	cmp	 r12,r8,1
	rot	 r11,r12,2
	and.c	 r12,r13,r11
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L6111
	ld	 r3,r31,172
	ld	 r4,r31,180
	bsr.n	 _build_type_variant
	or	 r2,r0,r20
	ld	 r3,r22,4
	bsr.n	 _build_cplus_method_type
	ld	 r4,r22,12
	or	 r22,r0,r2
@L6111:
	ld	 r3,r31,188
	or.u	 r13,r0,hi16(_processing_template_decl)
	ld	 r4,r31,308
	ld	 r13,r13,lo16(_processing_template_decl)
	ld	 r6,r31,164
	bcnd.n	 ne0,r13,@L6113
	or	 r2,r0,r22
	ld	 r8,r31,196
	bcnd.n	 eq0,r8,@L6114
	or	 r12,r0,1
	br.n	 @L6114
	or	 r12,r0,2
	align	 4
@L6113:
	or	 r12,r0,0
@L6114:
	st	 r3,r31,388
	st	 r6,r31,396
	or	 r18,r0,r2
	st	 r0,r31,412
	or	 r15,r0,r4
	bcnd.n	 eq0,r20,@L6119
	st	 r12,r31,404
	ld.bu	 r12,r18,8
	ld	 r13,r20,48
	cmp	 r12,r12,23
	ld.bu	 r11,r13,8
	or	 r19,r0,r13
	extu	 r12,r12,1<eq>
	cmp	 r11,r11,32
	bb1.n	 ne,r11,@L6122
	st	 r12,r31,412
	ld	 r19,r19,32
	br	 @L6122
	align	 4
@L6119:
	or	 r19,r0,0
@L6122:
	ld	 r8,r31,396
	bcnd.n	 eq0,r8,@L6123
	or	 r2,r0,r20
	ld	 r4,r31,396
	bsr.n	 _build_exception_variant
	or	 r3,r0,r18
	or	 r18,r0,r2
	ld	 r8,r18,72
	st	 r8,r31,396
@L6123:
	ld	 r3,r31,380
	or	 r2,r0,29
	bsr.n	 _build_lang_decl
	or	 r4,r0,r18
	ld	 r13,r18,8
	bb0.n	 (31-12),r13,@L6124
	or	 r23,r0,r2
	ld	 r13,r23,8
	or.u	 r13,r13,0x8
	st	 r13,r23,8
@L6124:
	ld	 r8,r31,412
	bcnd	 eq0,r8,@L6125
	ld	 r13,r23,80
	ld	 r12,r0,r13
	or.u	 r12,r12,0x4
	st	 r12,r0,r13
	ld	 r13,r23,80
	st	 r20,r23,36
	st	 r20,r13,8
@L6125:
	ld	 r13,r23,28
	or.u	 r13,r13,0x80
	bcnd.n	 eq0,r15,@L6126
	st	 r13,r23,28
	ld.bu	 r13,r18,8
	cmp	 r13,r13,23
	bb1.n	 ne,r13,@L6504
	or.u	 r13,r0,hi16(_ansi_opname+492)
	or.u	 r2,r0,hi16(@LC242)
	or	 r2,r2,lo16(@LC242)
	bsr.n	 _error
	or	 r15,r0,0
@L6126:
	or.u	 r13,r0,hi16(_ansi_opname+492)
@L6504:
	ld	 r8,r31,380
	ld	 r13,r13,lo16(_ansi_opname+492)
	cmp	 r13,r8,r13
	bb1	 ne,r13,@L6127
	ld	 r21,r18,12
	cmp	 r13,r20,0
	cmp	 r12,r21,0
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd	 eq0,r13,@L6128
	ld.bu	 r13,r18,8
	cmp	 r13,r13,16
	bb1	 ne,r13,@L6128
	ld	 r21,r0,r21
@L6128:
	or.u	 r16,r0,hi16(_ptr_type_node)
	or.u	 r25,r0,hi16(_void_list_node)
	ld	 r3,r16,lo16(_ptr_type_node)
	ld	 r4,r25,lo16(_void_list_node)
	bsr.n	 _tree_cons
	or	 r2,r0,0
	or	 r3,r0,r2
	bsr.n	 _type_list_equal
	or	 r2,r0,r21
	or	 r24,r0,r2
	bcnd.n	 ne0,r24,@L6129
	or	 r2,r0,0
	ld	 r4,r25,lo16(_void_list_node)
	or.u	 r13,r0,hi16(_sizetype)
	ld	 r3,r13,lo16(_sizetype)
	bsr.n	 _tree_cons
	ld	 r25,r16,lo16(_ptr_type_node)
	or	 r4,r0,r2
	or	 r2,r0,0
	bsr.n	 _tree_cons
	or	 r3,r0,r25
	or	 r3,r0,r2
	or	 r2,r0,r21
	bsr.n	 _type_list_equal
	addu	 r1,r1,@L6633
@L6634:
	align	 4
@L6129:
@L6130:
	bcnd.n	 ne0,r20,@L6131
	cmp	 r13,r24,0
	bcnd.n	 ne0,r24,@L6127
	or.u	 r2,r0,hi16(@LC243)
	br.n	 @L6435
	or	 r2,r2,lo16(@LC243)
	align	 4
@L6131:
	cmp	 r12,r2,0
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L6127
	or.u	 r2,r0,hi16(@LC244)
	or	 r2,r2,lo16(@LC244)
@L6435:
	bsr	 _error
@L6127:
	ld	 r8,r31,404
	bcnd	 lt0,r8,@L6161
	ld	 r8,r31,300
	cmp	 r13,r20,0
	cmp	 r12,r8,0
	and.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L6136
	bsr.n	 _constructor_name
	or	 r2,r0,r19
	ld	 r8,r31,380
	cmp	 r2,r2,r8
	bb1	 ne,r2,@L6136
	ld	 r12,r23,80
	ld	 r3,r31,380
	or	 r2,r0,r20
	ld	 r13,r0,r12
	or	 r4,r0,r23
	ld	 r5,r31,300
	or	 r6,r0,r15
	or.u	 r13,r13,0x40
	bsr.n	 _grokclassfn
	st	 r13,r0,r12
	ld	 r8,r31,404
	bcnd.n	 eq0,r8,@L6137
	or	 r2,r0,r20
	ld	 r3,r31,380
	ld	 r5,r31,300
	bsr.n	 _check_classfn
	or	 r4,r0,r23
@L6137:
	or	 r2,r0,r20
	bsr.n	 _grok_ctor_properties
	or	 r3,r0,r23
	ld	 r8,r31,404
	bcnd.n	 ne0,r8,@L6161
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	ld	 r25,r23,60
	bb0	 ne,r13,@L6140
	ld	 r2,r25,24
	bcnd	 ne0,r2,@L6141
@L6140:
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r12,r13,lo16(_current_class_type)
	bcnd	 eq0,r12,@L6142
	ld	 r2,r25,28
	bcnd	 ne0,r2,@L6282
	ld	 r13,r12,16
	bcnd	 ne0,r13,@L6143
	ld	 r13,r12,80
	ld	 r13,r0,r13
	bb0	 (31-24),r13,@L6143
	or	 r2,r0,r12
	or	 r3,r0,r25
	or	 r4,r0,0
	bsr.n	 _lookup_field
	or	 r5,r0,0
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r2,r13
	bb0	 ne,r13,@L6149
	bcnd	 eq0,r2,@L6281
	ld.bu	 r13,r2,8
	cmp	 r13,r13,32
	ext	 r13,r13,1<eq>
	and	 r2,r2,r13
@L6143:
	bcnd	 ne0,r2,@L6282
@L6281:
	bsr.n	 _lookup_nested_field
	or	 r2,r0,r25
	bcnd	 ne0,r2,@L6282
@L6142:
	ld	 r2,r25,20
@L6141:
	bcnd	 eq0,r2,@L6149
@L6282:
	ld.bu	 r13,r2,8
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L6149
	or.u	 r13,r0,hi16(_looking_for_typename)
	ld	 r12,r13,lo16(_looking_for_typename)
	bcnd	 lt0,r12,@L6149
	ld	 r3,r25,4
	bcnd	 eq0,r3,@L6152
	ld	 r3,r3,48
	cmp	 r13,r2,r3
	extu	 r13,r13,1<eq>
	bcnd	 ne0,r13,@L6436
	bcnd.n	 gt0,r12,@L6139
	or	 r25,r0,r3
	br.n	 @L6139
	or	 r25,r0,r2
	align	 4
@L6152:
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r3,r2,4
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L6139
	or	 r25,r0,r2
@L6436:
	br.n	 @L6139
	or	 r25,r0,r3
	align	 4
@L6149:
	or	 r25,r0,r2
@L6139:
	bcnd	 ne0,r25,@L6157
	ld	 r13,r23,60
	br.n	 @L6158
	st	 r23,r13,20
	align	 4
@L6157:
	ld.bu	 r13,r25,8
	ld.bu	 r12,r23,8
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L6159
	or.u	 r3,r0,hi16(@LC245)
	or	 r2,r0,r23
	or	 r3,r3,lo16(@LC245)
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L6635
@L6636:
	align	 4
@L6159:
	or	 r3,r0,r25
	or	 r2,r0,r23
	bsr.n	 _duplicate_decls
	or	 r23,r0,r3
@L6158:
	or	 r2,r0,r23
	or	 r3,r0,0
	or	 r4,r0,1
	bsr.n	 _make_decl_rtl
	addu	 r1,r1,@L6637
@L6638:
	align	 4
@L6136:
	bcnd.n	 eq0,r20,@L6162
	or	 r2,r0,r20
	ld	 r5,r31,300
	or	 r3,r0,r19
	or	 r4,r0,r23
	bsr.n	 _grokclassfn
	or	 r6,r0,r15
@L6162:
	ld	 r13,r23,32
	ld	 r13,r13,8
	bb0	 (31-24),r13,@L6163
	ld	 r3,r31,388
	bsr.n	 _grok_op_properties
	or	 r2,r0,r23
@L6163:
	ld	 r8,r31,404
	cmp	 r24,r20,0
	extu	 r13,r24,1<ne>
	cmp	 r12,r8,0
	extu	 r25,r12,1<ne>
	and	 r13,r13,r25
	bcnd.n	 eq0,r13,@L6164
	or	 r2,r0,r20
	ld	 r5,r31,300
	or	 r3,r0,r19
	bsr.n	 _check_classfn
	or	 r4,r0,r23
@L6164:
	extu	 r13,r24,1<eq>
	or	 r13,r13,r25
	bcnd.n	 ne0,r13,@L6161
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	ld	 r25,r23,60
	bb0	 ne,r13,@L6167
	ld	 r2,r25,24
	bcnd	 ne0,r2,@L6168
@L6167:
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r12,r13,lo16(_current_class_type)
	bcnd	 eq0,r12,@L6169
	ld	 r2,r25,28
	bcnd	 ne0,r2,@L6284
	ld	 r13,r12,16
	bcnd	 ne0,r13,@L6170
	ld	 r13,r12,80
	ld	 r13,r0,r13
	bb0	 (31-24),r13,@L6170
	or	 r2,r0,r12
	or	 r3,r0,r25
	or	 r4,r0,0
	bsr.n	 _lookup_field
	or	 r5,r0,0
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r2,r13
	bb0	 ne,r13,@L6176
	bcnd	 eq0,r2,@L6283
	ld.bu	 r13,r2,8
	cmp	 r13,r13,32
	ext	 r13,r13,1<eq>
	and	 r2,r2,r13
@L6170:
	bcnd	 ne0,r2,@L6284
@L6283:
	bsr.n	 _lookup_nested_field
	or	 r2,r0,r25
	bcnd	 ne0,r2,@L6284
@L6169:
	ld	 r2,r25,20
@L6168:
	bcnd	 eq0,r2,@L6176
@L6284:
	ld.bu	 r13,r2,8
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L6176
	or.u	 r13,r0,hi16(_looking_for_typename)
	ld	 r12,r13,lo16(_looking_for_typename)
	bcnd	 lt0,r12,@L6176
	ld	 r3,r25,4
	bcnd	 eq0,r3,@L6179
	ld	 r3,r3,48
	cmp	 r13,r2,r3
	extu	 r13,r13,1<eq>
	bcnd	 ne0,r13,@L6437
	bcnd.n	 gt0,r12,@L6166
	or	 r24,r0,r3
	br.n	 @L6166
	or	 r24,r0,r2
	align	 4
@L6179:
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r3,r2,4
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L6166
	or	 r24,r0,r2
@L6437:
	br.n	 @L6166
	or	 r24,r0,r3
	align	 4
@L6176:
	or	 r24,r0,r2
@L6166:
	bcnd	 ne0,r24,@L6184
	ld	 r13,r23,60
	br.n	 @L6185
	st	 r23,r13,20
	align	 4
@L6184:
	ld.bu	 r13,r24,8
	ld.bu	 r12,r23,8
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L6186
	or.u	 r3,r0,hi16(@LC246)
	or	 r2,r0,r23
	or	 r3,r3,lo16(@LC246)
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L6639
@L6640:
	align	 4
@L6301:
	or.u	 r3,r0,hi16(@LC247)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC247)
	or.u	 r3,r0,hi16(@LC248)
	or	 r2,r0,r24
	or	 r3,r3,lo16(@LC248)
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L6641
@L6642:
	align	 4
@L6186:
	or	 r3,r0,r24
	or	 r2,r0,r23
	bsr.n	 _duplicate_decls
	or	 r23,r0,r3
@L6185:
	or	 r2,r0,r23
	or	 r3,r0,0
	bsr.n	 _make_decl_rtl
	or	 r4,r0,1
	ld	 r13,r20,68
	ld	 r13,r13,32
	bcnd.n	 eq0,r13,@L6188
	or	 r15,r0,0
	ld	 r15,r13,12
@L6188:
	bcnd.n	 le0,r15,@L6191
	or	 r19,r0,0
	or	 r16,r0,r13
@L6193:
	ld	 r25,r16,16
	ld	 r13,r25,4
	ld	 r13,r13,8
	bb1.n	 (31-24),r13,@L6195
	or.u	 r13,r0,hi16(_flag_all_virtual)
	ld	 r13,r13,lo16(_flag_all_virtual)
	cmp	 r13,r13,1
	bb1	 ne,r13,@L6192
@L6195:
	ld	 r8,r31,300
	cmp	 r13,r8,1
	or	 r2,r0,r25
	extu	 r21,r13,1<eq>
	or	 r3,r0,r23
	bsr.n	 _get_first_matching_virtual
	or	 r4,r0,r21
	or	 r24,r0,r2
	bcnd	 eq0,r24,@L6192
	ld	 r8,r31,412
	bcnd	 ne0,r8,@L6301
	ld	 r2,r25,4
	ld	 r13,r2,8
	or	 r8,r0,1
	bb1.n	 (31-25),r13,@L6199
	st	 r8,r31,388
	ld	 r13,r20,80
	ld	 r13,r0,r13
	bb0	 (31-10),r13,@L6198
@L6199:
	ld	 r12,r24,36
	cmp	 r13,r2,r12
	bb0	 ne,r13,@L6198
	ld	 r2,r12,68
	or	 r3,r0,r23
	bsr.n	 _get_first_matching_virtual
	or	 r4,r0,r21
	or	 r24,r0,r2
@L6198:
	ld	 r3,r23,76
	bsr.n	 _value_member
	or	 r2,r0,r24
	bcnd	 ne0,r2,@L6192
	ld	 r13,r24,4
	ld	 r12,r23,4
	ld	 r13,r13,12
	ld	 r4,r12,12
	ld	 r2,r0,r13
	ld	 r13,r4,16
	ld	 r3,r0,r4
	bsr.n	 _commonparms
	ld	 r25,r13,4
	or	 r4,r0,r2
	ld	 r3,r18,4
	bsr.n	 _build_cplus_method_type
	or	 r2,r0,r25
	ld	 r8,r31,396
	bcnd.n	 eq0,r8,@L6201
	or	 r18,r0,r2
	ld	 r4,r31,396
	or	 r2,r0,r20
	bsr.n	 _build_exception_variant
	or	 r3,r0,r18
	or	 r18,r0,r2
	ld	 r8,r18,72
	st	 r8,r31,396
@L6201:
	ld	 r4,r23,76
	or	 r2,r0,0
	or	 r3,r0,r24
	bsr.n	 _tree_cons
	st	 r18,r23,4
	st	 r2,r23,76
@L6192:
	addu	 r19,r19,1
	cmp	 r13,r19,r15
	bb1.n	 lt,r13,@L6193
	addu	 r16,r16,4
@L6191:
	ld	 r8,r31,388
	bcnd	 eq0,r8,@L6161
	ld	 r13,r23,76
	bcnd.n	 ne0,r13,@L6204
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	st	 r13,r23,76
@L6204:
	ld	 r12,r23,32
	ld	 r13,r12,8
	or	 r13,r13,256
	bcnd.n	 eq0,r20,@L6161
	st	 r13,r12,8
	ld	 r13,r20,80
	ld	 r11,r0,r13
	bb0	 (31-16),r11,@L6161
	ld	 r13,r20,48
	ld	 r13,r13,32
	ld	 r13,r13,32
	bcnd.n	 ne0,r13,@L6161
	or.u	 r13,r0,hi16(_write_virtuals)
	ld	 r12,r13,lo16(_write_virtuals)
	cmp	 r13,r12,2
	bb0.n	 ne,r13,@L6206
	cmp	 r13,r12,3
	bb1	 ne,r13,@L6161
	bb1	 (31-26),r11,@L6161
@L6206:
	ld	 r13,r23,8
	or	 r13,r13,4096
	st	 r13,r23,8
@L6161:
	bcnd.n	 ne0,r20,@L6207
	or	 r24,r0,r23
	st	 r17,r24,60
@L6207:
	ld	 r8,r31,212
	cmp	 r13,r8,1
	bb1	 ne,r13,@L6208
	ld.bu	 r13,r22,8
	cmp	 r13,r13,16
	bb1.n	 ne,r13,@L6209
	or	 r25,r0,0
	or.u	 r3,r0,hi16(@LC373)
	or	 r2,r0,r24
	or	 r3,r3,lo16(@LC373)
	or	 r25,r0,1
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L6643
@L6644:
	align	 4
@L6209:
	ld	 r8,r31,372
	cmp	 r12,r20,0
	subu	 r13,r8,1
	extu	 r12,r12,1<eq>
	subu	 r13,r0,r13
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L6210
	or.u	 r3,r0,hi16(@LC374)
	ld	 r8,r31,380
	ld	 r2,r8,16
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC374)
	bcnd.n	 ne0,r2,@L6210
	or.u	 r2,r0,hi16(@LC375)
	or	 r2,r2,lo16(@LC375)
	bsr.n	 _error
	or	 r25,r0,1
@L6210:
	bcnd	 eq0,r25,@L6208
	and.u	 r14,r14,0xfffe
@L6208:
	bcnd.n	 eq0,r20,@L6215
	or	 r12,r0,0
	ld	 r13,r20,80
	ld	 r13,r0,r13
	mask	 r13,r13,96
	bcnd	 eq0,r13,@L6214
@L6215:
	mask.u	 r13,r14,0x81
	bcnd	 ne0,r13,@L6213
@L6214:
	or	 r12,r0,1
@L6213:
	ld	 r13,r24,8
	mak	 r12,r12,0<12>
	and	 r13,r13,0xefff
	or	 r13,r13,r12
	st	 r13,r24,8
	ld	 r8,r31,204
	bcnd	 eq0,r8,@L6216
	bsr.n	 _tree_last
	ld	 r2,r22,12
	ld	 r8,r31,372
	cmp	 r12,r20,0
	subu	 r13,r8,1
	extu	 r12,r12,1<eq>
	subu	 r13,r0,r13
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L6217
	or	 r25,r0,r2
	ld	 r8,r31,380
	or.u	 r3,r0,hi16(@LC376)
	ld	 r2,r8,16
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC376)
	bcnd.n	 ne0,r2,@L6217
	or.u	 r2,r0,hi16(@LC377)
	or	 r2,r2,lo16(@LC377)
	bsr.n	 _warning
	addu	 r1,r1,@L6645
@L6646:
	align	 4
@L6217:
	bcnd.n	 eq0,r25,@L6219
	or.u	 r13,r0,hi16(_void_list_node)
	ld	 r13,r13,lo16(_void_list_node)
	cmp	 r13,r25,r13
	bb0.n	 ne,r13,@L6219
	or.u	 r2,r0,hi16(@LC378)
	or	 r2,r2,lo16(@LC378)
	bsr.n	 _warning
	addu	 r1,r1,@L6647
@L6648:
	align	 4
@L6219:
	ld	 r13,r24,28
	or.u	 r13,r13,0x10
	st	 r13,r24,28
@L6218:
	bb0.n	 (31-14),r14,@L6216
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r11,r13,lo16(_pedantic)
	or.u	 r12,r0,hi16(_current_extern_inline)
	or	 r13,r0,1
	bcnd.n	 eq0,r11,@L6222
	st	 r13,r12,lo16(_current_extern_inline)
	or.u	 r2,r0,hi16(@LC379)
	or	 r2,r2,lo16(@LC379)
	bsr.n	 _error
	addu	 r1,r1,@L6649
@L6650:
	align	 4
@L6222:
	or.u	 r13,r0,hi16(_flag_ansi)
	ld	 r13,r13,lo16(_flag_ansi)
	bcnd	 eq0,r13,@L6216
	or.u	 r2,r0,hi16(@LC380)
	bsr.n	 _warning
	or	 r2,r2,lo16(@LC380)
@L6216:
	ld	 r8,r31,372
	bcnd	 eq0,r8,@L5864
	ld	 r13,r24,28
	or	 r13,r13,1024
	br.n	 @L5864
	st	 r13,r24,28
	align	 4
@L6102:
	ld	 r8,r31,188
	bcnd	 eq0,r8,@L6227
	or.u	 r2,r0,hi16(@LC381)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC381)
@L6227:
	ld	 r8,r31,204
	bcnd	 eq0,r8,@L6228
	or.u	 r2,r0,hi16(@LC382)
	bsr.n	 _warning
	or	 r2,r2,lo16(@LC382)
@L6228:
	ld	 r8,r31,308
	bcnd	 eq0,r8,@L6229
	or.u	 r2,r0,hi16(@LC383)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC383)
@L6229:
	ld	 r8,r31,196
	bcnd	 eq0,r8,@L6230
	or.u	 r2,r0,hi16(@LC384)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC384)
@L6230:
	ld	 r8,r31,164
	bcnd	 eq0,r8,@L6231
	or.u	 r2,r0,hi16(@LC385)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC385)
@L6231:
	ld.bu	 r13,r22,8
	cmp	 r13,r13,14
	bb1.n	 ne,r13,@L6233
	or	 r24,r0,r22
	ld	 r2,r22,56
	or	 r3,r0,r17
	or	 r4,r0,0
	bsr.n	 _lookup_field
	or	 r5,r0,0
	or	 r25,r0,r2
	bcnd	 eq0,r25,@L6235
	ld.bu	 r13,r25,8
	cmp	 r13,r13,33
	bb0	 ne,r13,@L6234
@L6235:
	ld	 r25,r22,56
	ld	 r13,r25,48
	ld	 r13,r13,32
	ld	 r3,r17,16
	or.u	 r2,r0,hi16(@LC249)
	ld	 r4,r13,16
	bsr.n	 _error
	or	 r2,r2,lo16(@LC249)
	or	 r2,r0,33
	ld	 r4,r22,4
	bsr.n	 _build_lang_field_decl
	or	 r3,r0,r17
	or	 r24,r0,r2
	ld	 r13,r24,80
	st	 r25,r24,36
	br.n	 @L6246
	st	 r25,r13,8
	align	 4
@L6234:
	ld	 r12,r25,4
	ld	 r13,r12,16
	ld	 r11,r22,4
	bcnd.n	 ne0,r13,@L6237
	cmp	 r13,r12,r11
	ld.bu	 r10,r12,8
	ld.bu	 r13,r11,8
	cmp	 r13,r10,r13
	bb1.n	 ne,r13,@L6505
	or.u	 r2,r0,hi16(@LC250)
	cmp	 r13,r10,18
	bb1	 ne,r13,@L6238
	ld	 r13,r12,4
	ld	 r12,r11,4
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L6238
@L6505:
	ld	 r3,r17,16
	br.n	 @L6438
	or	 r2,r2,lo16(@LC250)
	align	 4
@L6238:
	ld	 r13,r11,16
	bcnd	 eq0,r13,@L6242
	st	 r24,r25,4
	br	 @L6242
	align	 4
@L6237:
	bb0.n	 ne,r13,@L6242
	or.u	 r2,r0,hi16(@LC251)
	ld	 r3,r17,16
	or	 r2,r2,lo16(@LC251)
@L6438:
	bsr	 _error
@L6242:
	ld	 r8,r31,156
	bcnd.n	 eq0,r8,@L6246
	or	 r24,r0,r25
	ld	 r12,r24,48
	bcnd	 eq0,r12,@L6246
	ld.bu	 r13,r12,8
	cmp	 r13,r13,43
	bb1	 ne,r13,@L6245
	ld	 r13,r12,20
	bcnd	 eq0,r13,@L6246
@L6245:
	ld	 r13,r24,32
	ld	 r2,r24,36
	or.u	 r3,r0,hi16(@LC252)
	ld	 r4,r13,16
	or	 r3,r3,lo16(@LC252)
	bsr.n	 _error_with_aggr_type
	addu	 r1,r1,@L6651
@L6652:
	align	 4
@L6233:
	or	 r2,r0,33
	or	 r3,r0,r17
	bsr.n	 _build_decl
	or	 r4,r0,r22
	or	 r24,r0,r2
@L6246:
	bb0	 (31-14),r14,@L6247
	ld	 r13,r24,28
	ld	 r8,r31,156
	or	 r13,r13,4096
	cmp	 r12,r8,0
	and.u	 r13,r13,0xff7f
	extu	 r12,r12,1<eq>
	mak	 r12,r12,0<23>
	or	 r13,r13,r12
	st	 r13,r24,28
@L6247:
	ld	 r13,r24,36
	bcnd	 eq0,r13,@L6248
	ld	 r13,r13,24
	bb0	 (31-22),r13,@L6248
	ld	 r11,r24,28
	ld	 r8,r31,156
	and.u	 r11,r11,0xff7f
	ld	 r13,r24,8
	cmp	 r12,r8,0
	extu	 r12,r12,1<eq>
	or	 r13,r13,12288
	mak	 r12,r12,0<23>
	st	 r13,r24,8
	or	 r11,r11,r12
	br.n	 @L6249
	st	 r11,r24,28
	align	 4
@L6248:
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L6250
	extu	 r13,r14,1<16>
	ld	 r11,r24,8
	xor.u	 r12,r14,0x1
	ld	 r13,r24,28
	extu	 r12,r12,1<16>
	and	 r11,r11,0xefff
	mak	 r12,r12,0<12>
	xor.u	 r13,r13,0x80
	or	 r11,r11,r12
	extu	 r13,r13,1<23>
	and	 r12,r11,0xdfff
	mak	 r13,r13,0<13>
	st	 r11,r24,8
	or	 r12,r12,r13
	br.n	 @L6249
	st	 r12,r24,8
	align	 4
@L6287:
	ld	 r13,r24,4
	ld	 r13,r13,16
	or.u	 r2,r0,hi16(@LC261)
	ld	 r3,r13,16
	or	 r2,r2,lo16(@LC261)
	bsr.n	 _error
	subu	 r1,r1,@L6653
@L6654:
	align	 4
@L6291:
	or.u	 r2,r0,hi16(@LC310)
	or	 r2,r2,lo16(@LC310)
	bsr.n	 _error
	addu	 r1,r1,@L6655
@L6656:
	align	 4
@L6292:
	or.u	 r2,r0,hi16(@LC311)
	or	 r2,r2,lo16(@LC311)
	bsr.n	 _error
	addu	 r1,r1,@L6657
@L6658:
	align	 4
@L6293:
	or.u	 r2,r0,hi16(@LC315)
	or	 r2,r2,lo16(@LC315)
	bsr.n	 _error
	addu	 r1,r1,@L6659
@L6660:
	align	 4
@L6294:
	or.u	 r2,r0,hi16(@LC316)
	or	 r2,r2,lo16(@LC316)
	bsr.n	 _error
	addu	 r1,r1,@L6661
@L6662:
	align	 4
@L6296:
	ld	 r13,r20,48
	ld	 r13,r13,32
	or	 r4,r0,r16
	or.u	 r2,r0,hi16(@LC332)
	ld	 r3,r13,16
	br.n	 @L6428
	or	 r2,r2,lo16(@LC332)
	align	 4
@L6297:
	or	 r2,r0,124
@L6488:
	or	 r3,r0,r20
	bsr.n	 _build_nt
	or	 r4,r0,r25
	or	 r3,r0,r2
	or	 r2,r0,36
	bsr.n	 _build_lang_field_decl
	or	 r4,r0,r22
	ld	 r8,r31,276
	or	 r25,r0,r2
	br.n	 @L6258
	st	 r8,r25,48
	align	 4
@L6298:
	ld	 r13,r20,48
	ld	 r13,r13,32
	or	 r4,r0,r16
	or.u	 r2,r0,hi16(@LC337)
	ld	 r3,r13,16
	or	 r2,r2,lo16(@LC337)
@L6428:
	bsr	 _error
@L6393:
	or.u	 r13,r0,hi16(_void_type_node)
@L6487:
	ld	 r2,r13,lo16(_void_type_node)
	br	 @L6258
	align	 4
@L6250:
	ld	 r11,r24,8
	ld	 r12,r24,28
	mak	 r13,r13,0<13>
	and	 r11,r11,0xdfff
	extu	 r12,r12,1<23>
	or	 r11,r11,r13
	mak	 r12,r12,0<12>
	and	 r13,r11,0xefff
	st	 r11,r24,8
	or	 r13,r13,r12
	st	 r13,r24,8
@L6249:
	bcnd	 eq0,r20,@L5864
	ld	 r8,r31,212
	cmp	 r13,r8,1
	bb1	 ne,r13,@L6253
	or.u	 r25,r0,hi16(@LC386)
	or	 r2,r0,r24
	bsr.n	 _lang_printable_name
	or	 r25,r25,lo16(@LC386)
	or	 r3,r0,r2
	and.u	 r14,r14,0xfffe
	bsr.n	 _error
	or	 r2,r0,r25
@L6253:
	bb0	 (31-14),r14,@L5864
	or.u	 r25,r0,hi16(@LC387)
	or	 r2,r0,r24
	bsr.n	 _lang_printable_name
	or	 r25,r25,lo16(@LC387)
	or	 r3,r0,r2
	and.u	 r14,r14,0xfffd
	bsr.n	 _error
	or	 r2,r0,r25
@L5864:
	bb0	 (31-13),r14,@L6255
	ld	 r13,r24,28
	or.u	 r13,r13,0x20
	st	 r13,r24,28
@L6255:
	ld	 r8,r31,172
	bcnd	 eq0,r8,@L6256
	ld.bu	 r13,r22,8
	ld	 r12,r24,8
	cmp	 r13,r13,15
	and.u	 r12,r12,0xfffb
	extu	 r13,r13,1<ne>
	mak	 r13,r13,0<18>
	or	 r12,r12,r13
	st	 r12,r24,8
@L6256:
	ld	 r8,r31,180
	bcnd	 eq0,r8,@L6257
	ld	 r13,r24,8
	or.u	 r13,r13,0x88
	st	 r13,r24,8
@L6257:
	or	 r2,r0,r24
@L6258:
@Lte60:
	ld	 r1,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	ld.d	 r14,r31,32
	jmp.n	 r1
	addu	 r31,r31,416
	def	 @L6661,@L6393-@L6662
	def	 @L6659,@L6393-@L6660
	def	 @L6657,@L6393-@L6658
	def	 @L6655,@L6393-@L6656
	def	 @L6653,@L6654-@L6442
	def	 @L6651,@L6246-@L6652
	def	 @L6649,@L6216-@L6650
	def	 @L6647,@L6218-@L6648
	def	 @L6645,@L6218-@L6646
	def	 @L6643,@L6210-@L6644
	def	 @L6641,@L6191-@L6642
	def	 @L6639,@L6185-@L6640
	def	 @L6637,@L6161-@L6638
	def	 @L6635,@L6158-@L6636
	def	 @L6633,@L6130-@L6634
	def	 @L6631,@L6089-@L6632
	def	 @L6629,@L6258-@L6630
	def	 @L6627,@L6079-@L6628
	def	 @L6625,@L6393-@L6626
	def	 @L6623,@L6074-@L6624
	def	 @L6621,@L6393-@L6622
	def	 @L6619,@L6050-@L6620
	def	 @L6617,@L6044-@L6618
	def	 @L6615,@L6020-@L6616
	def	 @L6613,@L6017-@L6614
	def	 @L6611,@L5989-@L6612
	def	 @L6609,@L5954-@L6610
	def	 @L6607,@L5948-@L6608
	def	 @L6605,@L5924-@L6606
	def	 @L6603,@L5921-@L6604
	def	 @L6601,@L5893-@L6602
	def	 @L6599,@L6393-@L6600
	def	 @L6597,@L5841-@L6598
	def	 @L6595,@L5835-@L6596
	def	 @L6593,@L5824-@L6594
	def	 @L6591,@L5727-@L6592
	def	 @L6589,@L5370-@L6590
	def	 @L6587,@L6588-@L6421
	def	 @L6585,@L5697-@L6586
	def	 @L6583,@L5679-@L6584
	def	 @L6581,@L6418-@L6582
	def	 @L6579,@L5660-@L6580
	def	 @L6577,@L5655-@L6578
	def	 @L6575,@L6412-@L6576
	def	 @L6573,@L5084-@L6574
	def	 @L6571,@L5358-@L6572
	def	 @L6569,@L5319-@L6570
	def	 @L6567,@L5096-@L6568
	def	 @L6565,@L5222-@L6566
	def	 @L6563,@L5096-@L6564
	def	 @L6561,@L5178-@L6562
	def	 @L6559,@L5156-@L6560
	def	 @L6557,@L5031-@L6558
	def	 @L6555,@L5031-@L6556
	def	 @L6553,@L5031-@L6554
	def	 @L6551,@L5031-@L6552
	def	 @L6549,@L5031-@L6550
	def	 @L6547,@L4896-@L6548
	def	 @L6545,@L4929-@L6546
	def	 @L6543,@L4896-@L6544
	def	 @L6541,@L6379-@L6542
	def	 @L6539,@L6379-@L6540
	def	 @L6537,@L6372-@L6538
	def	 @L6535,@L6372-@L6536
	def	 @L6533,@L4896-@L6534
	def	 @L6531,@L4896-@L6532
	def	 @L6529,@L4896-@L6530
	def	 @L6527,@L4896-@L6528
	def	 @L6525,@L4848-@L6526
	def	 @L6523,@L6393-@L6524
	def	 @L6521,@L6393-@L6522
	def	 @L6519,@L4668-@L6520
	def	 @L6517,@L4794-@L6518
	def	 @L6515,@L4668-@L6516
	def	 @L6513,@L4750-@L6514
	def	 @L6511,@L4728-@L6512
	def	 @L6509,@L4639-@L6510

	align	 8
	global	 _parmlist_is_exprlist
_parmlist_is_exprlist:
@Ltb61:
	bcnd	 eq0,r2,@L6684
	ld	 r9,r2,8
	bb1.n	 (31-14),r9,@L6684
	or.u	 r9,r0,hi16(_current_binding_level)
	or.u	 r8,r0,hi16(_global_binding_level)
	ld	 r9,r9,lo16(_current_binding_level)
	ld	 r8,r8,lo16(_global_binding_level)
	cmp	 r9,r9,r8
	bb0	 eq,r9,@L6675
@L6678:
	ld	 r9,r2,16
	ld.bu	 r9,r9,8
	cmp	 r9,r9,1
	bb0	 eq,r9,@L6682
	ld	 r2,r0,r2
	bcnd	 ne0,r2,@L6678
@L6684:
	jmp.n	 r1
	or	 r2,r0,0
	align	 4
@L6682:
	jmp.n	 r1
	or	 r2,r0,1
	align	 4
@L6675:
	jmp.n	 r1
	or	 r2,r0,1
@Lte61:

	align	 8
_parmlist_is_random:
@Ltb62:
	bcnd	 ne0,r2,@L6696
@L6710:
	jmp.n	 r1
	or	 r2,r0,0
	align	 4
@L6696:
	ld.bu	 r9,r2,8
	cmp	 r9,r9,3
	bb1.n	 eq,r9,@L6697
	or.u	 r9,r0,hi16(_void_list_node)
@L6711:
	jmp.n	 r1
	or	 r2,r0,1
	align	 4
@L6697:
	ld	 r6,r9,lo16(_void_list_node)
	or.u	 r9,r0,hi16(_unknown_type_node)
	ld	 r7,r9,lo16(_unknown_type_node)
	cmp	 r9,r2,r6
@L6712:
	bb0	 ne,r9,@L6710
	ld	 r8,r2,16
	ld.bu	 r9,r8,8
	cmp	 r9,r9,3
	bb0	 eq,r9,@L6711
	ld	 r9,r8,4
	cmp	 r9,r9,r7
	bb0	 ne,r9,@L6711
	ld	 r2,r0,r2
	bcnd.n	 ne0,r2,@L6712
	cmp	 r9,r2,r6
	jmp.n	 r1
	or	 r2,r0,0
@Lte62:

data
	align	 8
@LC388:
	string	 "parameter `%s' has incomplete type\000"
	align	 8
@LC389:
	string	 "parameter has incomplete type\000"
	align	 8
@LC390:
	string	 "parameter names (without types) in function decla"
	string	 "ration\000"
	align	 8
@LC391:
	string	 "invalid string constant `%s'\000"
	align	 8
@LC392:
	string	 "invalid integer constant in parameter list, did y"
	string	 "ou forget to give parameter name?\000"
	align	 8
@LC393:
	string	 "parameter `%s' invalidly declared method type\000"
	align	 8
@LC394:
	string	 "parameter invalidly declared method type\000"
	align	 8
@LC395:
	string	 "parameter `%s' invalidly declared offset type\000"
	align	 8
@LC396:
	string	 "parameter invalidly declared offset type\000"
	align	 8
@LC397:
	string	 "`void' in parameter list must be entire list\000"
	align	 8
@LC398:
	string	 "local variable `%s' may not be used as a default "
	string	 "argument\000"
	align	 8
@LC399:
	string	 "all trailing parameters must have default argumen"
	string	 "ts\000"
text
	align	 8
_grokparms:
	subu	 r31,r31,96
	st	 r1,r31,80
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	st.d	 r18,r31,48
	or	 r25,r0,r2
	st.d	 r16,r31,40
	or	 r20,r0,0
	st.d	 r14,r31,32
@Ltb63:
	or	 r16,r0,0
	bcnd.n	 eq0,r25,@L6783
	st	 r3,r31,92
	ld	 r13,r25,16
	ld.bu	 r13,r13,8
	cmp	 r13,r13,1
	bb1.n	 ne,r13,@L6847
	or	 r15,r0,0
	bcnd.n	 ne0,r3,@L6848
	or.u	 r13,r0,hi16(_last_function_parms)
	or.u	 r2,r0,hi16(@LC390)
	bsr.n	 _warning
	or	 r2,r2,lo16(@LC390)
	or.u	 r13,r0,hi16(_last_function_parms)
@L6848:
	or	 r2,r0,0
	br.n	 @L6843
	st	 r25,r13,lo16(_last_function_parms)
	align	 4
@L6783:
	or	 r15,r0,0
@L6847:
	bcnd.n	 eq0,r25,@L6785
	or	 r18,r0,0
	or	 r21,r0,0
	or	 r17,r0,0
	or	 r2,r0,r25
	or.u	 r14,r0,hi16(_void_type_node)
@L6790:
	ld	 r25,r2,16
	or	 r22,r0,r2
	ld	 r13,r14,lo16(_void_type_node)
	ld	 r24,r22,12
	cmp	 r13,r25,r13
	ld	 r19,r0,r22
	bb0	 ne,r13,@L6844
	ld.bu	 r12,r25,8
	cmp	 r13,r12,3
	bb0.n	 ne,r13,@L6791
	cmp	 r13,r12,28
	bb1.n	 ne,r13,@L6792
	cmp	 r13,r12,25
	or.u	 r2,r0,hi16(@LC391)
	ld	 r3,r25,20
	or	 r2,r2,lo16(@LC391)
	bsr.n	 _error
	addu	 r1,r1,@L6851
@L6852:
	align	 4
@L6792:
	bb1.n	 ne,r13,@L6849
	or	 r2,r0,r19
	or.u	 r2,r0,hi16(@LC392)
	or	 r2,r2,lo16(@LC392)
	bsr.n	 _error
	addu	 r1,r1,@L6853
@L6854:
	align	 4
@L6791:
	ld	 r2,r25,16
	ld	 r3,r25,12
	cmp	 r5,r24,0
	or	 r4,r0,2
	or	 r6,r0,0
	bsr.n	 _grokdeclarator
	extu	 r5,r5,1<ne>
	or	 r25,r0,r2
	bcnd	 eq0,r25,@L6789
	ld	 r23,r25,4
	ld	 r13,r14,lo16(_void_type_node)
	ld	 r12,r23,64
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L6797
	or	 r25,r0,r12
	br	 @L6795
	align	 4
@L6797:
	ld.bu	 r12,r23,8
	cmp	 r13,r12,16
	bb1.n	 ne,r13,@L6799
	cmp	 r13,r12,14
	ld	 r13,r25,32
	bcnd	 eq0,r13,@L6800
	or.u	 r2,r0,hi16(@LC393)
	ld	 r3,r13,16
	or	 r2,r2,lo16(@LC393)
	bsr.n	 _error
	addu	 r1,r1,@L6855
@L6856:
	align	 4
@L6800:
	or.u	 r2,r0,hi16(@LC394)
	br.n	 @L6846
	or	 r2,r2,lo16(@LC394)
	align	 4
@L6799:
	bb1.n	 ne,r13,@L6803
	cmp	 r13,r12,21
	ld	 r13,r25,32
	bcnd.n	 eq0,r13,@L6804
	or.u	 r2,r0,hi16(@LC395)
	ld	 r3,r13,16
	or	 r2,r2,lo16(@LC395)
	bsr.n	 _error
	addu	 r1,r1,@L6857
@L6858:
	align	 4
@L6804:
	or.u	 r2,r0,hi16(@LC396)
	or	 r2,r2,lo16(@LC396)
@L6846:
	bsr	 _error
@L6805:
	bsr.n	 _build_pointer_type
	or	 r2,r0,r23
	or	 r23,r0,r2
	br.n	 @L6795
	st	 r23,r25,4
	align	 4
@L6803:
	bb1	 ne,r13,@L6795
	ld	 r13,r23,80
	bcnd	 eq0,r13,@L6795
	ld	 r13,r13,76
	bcnd.n	 eq0,r13,@L6795
	or	 r2,r0,r25
	or	 r3,r0,r23
	bsr.n	 _abstract_virtuals_error
	or	 r18,r0,1
@L6795:
	ld	 r13,r14,lo16(_void_type_node)
	cmp	 r13,r25,r13
	bb1	 ne,r13,@L6808
@L6844:
	bcnd.n	 ne0,r20,@L6809
	or.u	 r13,r0,hi16(_void_list_node)
	ld	 r20,r13,lo16(_void_list_node)
	br.n	 @L6810
	or	 r21,r0,r20
	align	 4
@L6809:
	ld	 r13,r13,lo16(_void_list_node)
	st	 r13,r0,r21
	or	 r21,r0,r13
@L6810:
	bcnd.n	 eq0,r19,@L6788
	or.u	 r13,r0,hi16(_void_list_node)
	ld	 r13,r13,lo16(_void_list_node)
	cmp	 r13,r19,r13
	bb1.n	 ne,r13,@L6850
	or.u	 r2,r0,hi16(@LC397)
	ld	 r13,r0,r19
	bcnd	 eq0,r13,@L6788
@L6850:
	or	 r2,r2,lo16(@LC397)
	bsr.n	 _error
	addu	 r1,r1,@L6859
@L6860:
	align	 4
@L6808:
	ld	 r13,r25,4
	bcnd.n	 ne0,r18,@L6813
	st	 r13,r25,48
	bcnd	 eq0,r24,@L6814
	ld.bu	 r12,r24,8
	cmp	 r13,r12,104
	bb1.n	 ne,r13,@L6815
	addu	 r15,r15,1
	ld	 r13,r24,8
	or	 r13,r13,128
	br.n	 @L6824
	st	 r13,r24,8
	align	 4
@L6815:
	cmp	 r13,r12,33
	bb1.n	 ne,r13,@L6817
	or.u	 r13,r0,hi16(_integer_zero_node)
	ld	 r13,r24,32
	ld	 r13,r13,24
	bcnd.n	 eq0,r13,@L6818
	or.u	 r3,r0,hi16(@LC398)
	or	 r2,r0,r24
	or	 r3,r3,lo16(@LC398)
	or	 r18,r0,1
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L6861
@L6862:
	align	 4
@L6818:
	ld	 r13,r24,8
	bb0.n	 (31-13),r13,@L6824
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13,132
	ld.b	 r13,r0,r13
	cmp	 r13,r13,100
	bb1	 ne,r13,@L6824
	bsr.n	 _decl_constant_value
	or	 r2,r0,r24
	br.n	 @L6824
	or	 r24,r0,r2
	align	 4
@L6817:
	or	 r2,r0,r23
	ld	 r4,r13,lo16(_integer_zero_node)
	bsr.n	 _require_instantiated_type
	or	 r3,r0,r24
	br.n	 @L6824
	or	 r24,r0,r2
	align	 4
@L6814:
	bcnd.n	 eq0,r15,@L6824
	or.u	 r2,r0,hi16(@LC399)
	or	 r2,r2,lo16(@LC399)
	or	 r18,r0,1
	bsr.n	 _error
	addu	 r1,r1,@L6863
@L6864:
	align	 4
@L6813:
	or	 r24,r0,0
@L6824:
	bcnd	 ne0,r16,@L6825
	or	 r16,r0,r25
	br.n	 @L6826
	or	 r17,r0,r16
	align	 4
@L6825:
	st	 r25,r0,r17
	or	 r17,r0,r25
@L6826:
	ld	 r13,r22,8
	bb0	 (31-10),r13,@L6827
	st	 r24,r22,12
	st	 r23,r22,16
	br.n	 @L6828
	st	 r0,r0,r22
	align	 4
@L6827:
	or	 r2,r0,r24
	or	 r3,r0,r23
	bsr.n	 _saveable_tree_cons
	or	 r4,r0,0
	or	 r22,r0,r2
@L6828:
	bcnd	 ne0,r20,@L6829
	or	 r20,r0,r22
	br.n	 @L6789
	or	 r21,r0,r20
	align	 4
@L6829:
	st	 r22,r0,r21
	or	 r21,r0,r22
@L6789:
	or	 r2,r0,r19
@L6849:
	bcnd	 ne0,r2,@L6790
@L6788:
	bcnd	 eq0,r21,@L6832
	st	 r0,r0,r21
@L6832:
	bcnd	 eq0,r17,@L6785
	st	 r0,r0,r17
@L6785:
	ld	 r11,r31,92
	or.u	 r13,r0,hi16(_last_function_parms)
	bcnd.n	 le0,r11,@L6834
	st	 r16,r13,lo16(_last_function_parms)
	or	 r25,r0,r16
	bcnd.n	 eq0,r25,@L6834
	or.u	 r23,r0,hi16(@LC388)
	or.u	 r24,r0,hi16(@LC389)
@L6838:
	ld	 r13,r25,4
	ld	 r13,r13,16
	bcnd	 ne0,r13,@L6839
	ld	 r13,r25,32
	bcnd	 eq0,r13,@L6840
	ld	 r3,r13,16
	or	 r2,r23,lo16(@LC388)
	bsr.n	 _error
	addu	 r1,r1,@L6865
@L6866:
	align	 4
@L6840:
	bsr.n	 _error
	or	 r2,r24,lo16(@LC389)
@L6841:
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	st	 r13,r25,4
@L6839:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L6838
@L6834:
	or	 r2,r0,r20
@L6843:
@Lte63:
	ld	 r1,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	ld.d	 r14,r31,32
	jmp.n	 r1
	addu	 r31,r31,96
	def	 @L6865,@L6841-@L6866
	def	 @L6863,@L6824-@L6864
	def	 @L6861,@L6824-@L6862
	def	 @L6859,@L6788-@L6860
	def	 @L6857,@L6805-@L6858
	def	 @L6855,@L6805-@L6856
	def	 @L6853,@L6789-@L6854
	def	 @L6851,@L6789-@L6852

data
	align	 8
@LC400:
	string	 "invalid constructor; you probably meant `%s (%s&)"
	string	 "'\000"
text
	align	 8
	global	 _grok_ctor_properties
_grok_ctor_properties:
	subu	 r31,r31,64
	st.d	 r24,r31,40
	or	 r24,r0,r3
	st	 r1,r31,48
@Ltb64:
	ld	 r13,r24,4
	ld	 r13,r13,12
	ld	 r10,r0,r13
	bcnd.n	 eq0,r10,@L6885
	or	 r25,r0,r2
	ld	 r9,r10,16
	br	 @L6886
	align	 4
@L6885:
	or.u	 r13,r0,hi16(_void_type_node)
	ld	 r9,r13,lo16(_void_type_node)
@L6886:
	bcnd	 eq0,r10,@L6887
	ld	 r11,r0,r10
	bcnd	 eq0,r11,@L6887
	ld	 r12,r11,16
	ld.bu	 r13,r12,8
	cmp	 r13,r13,15
	bb1	 ne,r13,@L6887
	ld	 r13,r12,4
	ld	 r13,r13,8
	bb0	 (31-25),r13,@L6887
	or	 r10,r0,r11
	or	 r9,r0,r12
@L6887:
	ld.bu	 r13,r9,8
	cmp	 r13,r13,15
	bb1	 ne,r13,@L6888
	ld	 r13,r9,4
	ld	 r13,r13,64
	cmp	 r13,r13,r25
	bb1	 ne,r13,@L6888
	ld	 r12,r0,r10
	bcnd.n	 eq0,r12,@L6890
	or.u	 r13,r0,hi16(_void_list_node)
	ld	 r13,r13,lo16(_void_list_node)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L6890
	ld	 r13,r12,12
	bcnd	 eq0,r13,@L6889
@L6890:
	ld	 r12,r25,80
	ld	 r13,r0,r12
	or.u	 r13,r13,0x1000
	st	 r13,r0,r12
	ld	 r12,r25,80
	ld	 r13,r0,r12
	or.u	 r13,r13,0x800
	st	 r13,r0,r12
	ld	 r13,r9,4
	ld	 r13,r13,8
	bb0.n	 (31-13),r13,@L6893
	or.u	 r11,r0,0x4
	ld	 r12,r25,80
	ld	 r13,r0,r12
	br.n	 @L6901
	or	 r13,r13,r11
	align	 4
@L6889:
	ld	 r12,r25,80
	ld	 r13,r0,r12
	br.n	 @L6901
	or.u	 r13,r13,0x400
	align	 4
@L6888:
	ld	 r13,r9,64
	cmp	 r13,r13,r25
	bb1	 ne,r13,@L6894
	ld	 r12,r0,r10
	bcnd.n	 eq0,r12,@L6895
	or.u	 r13,r0,hi16(_void_list_node)
	ld	 r13,r13,lo16(_void_list_node)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L6895
	ld	 r13,r25,48
	ld	 r13,r13,32
	or.u	 r2,r0,hi16(@LC400)
	ld	 r3,r13,16
	or	 r2,r2,lo16(@LC400)
	bsr.n	 _error
	or	 r4,r0,r3
@L6895:
	ld	 r13,r24,32
	ld	 r13,r13,36
	bcnd.n	 ne0,r13,@L6897
	or	 r2,r0,1
	bsr.n	 _perm_calloc
	or	 r3,r0,20
	ld	 r13,r24,32
	st	 r2,r13,36
@L6897:
	ld	 r13,r24,32
	ld	 r13,r13,36
	st	 r25,r13,16
	ld	 r12,r25,80
	ld	 r13,r0,r12
	br.n	 @L6901
	or.u	 r13,r13,0x400
	align	 4
@L6894:
	ld.bu	 r13,r9,8
	cmp	 r13,r13,6
	bb0	 ne,r13,@L6900
	ld	 r13,r10,12
	bcnd	 eq0,r13,@L6893
@L6900:
	ld	 r12,r25,80
	ld	 r13,r0,r12
	or.u	 r13,r13,0x40
@L6901:
	st	 r13,r0,r12
@L6893:
@Lte64:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

data
	align	 8
@LC401:
	string	 "`operator new' cannot be declared virtual\000"
	align	 8
@LC402:
	string	 "`operator delete' cannot be declared virtual\000"
	align	 8
@LC403:
	string	 "`%s' cannot be a static member function\000"
	align	 8
@LC404:
	string	 "too few arguments to `%s'\000"
text
	align	 8
_grok_op_properties:
	subu	 r31,r31,64
	st.d	 r24,r31,40
	or	 r24,r0,r2
	st	 r1,r31,48
@Ltb65:
	ld	 r13,r24,80
	ld	 r12,r24,4
	ld	 r13,r0,r13
	ld	 r25,r12,12
	bb0	 (31-13),r13,@L6922
	ld	 r11,r24,32
	or.u	 r12,r0,hi16(_ansi_opname+508)
	ld	 r13,r12,lo16(_ansi_opname+508)
	cmp	 r13,r11,r13
	bb1.n	 ne,r13,@L6923
	or	 r12,r12,lo16(_ansi_opname+508)
	bcnd	 eq0,r3,@L6924
	or.u	 r2,r0,hi16(@LC401)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC401)
@L6924:
	bcnd.n	 ne0,r25,@L6925
	or.u	 r13,r0,hi16(_current_class_name)
	or.u	 r13,r0,hi16(_integer_type_node)
	ld	 r2,r13,lo16(_integer_type_node)
	or.u	 r13,r0,hi16(_void_list_node)
	ld	 r3,r13,lo16(_void_list_node)
	or.u	 r13,r0,hi16(_ptr_type_node)
	ld	 r25,r13,lo16(_ptr_type_node)
	br	 @L6940
	align	 4
@L6925:
	ld	 r13,r13,lo16(_current_class_name)
	ld	 r3,r24,4
	ld	 r2,r13,4
	bsr.n	 _coerce_new_type
	addu	 r1,r1,@L6941
@L6942:
	align	 4
@L6923:
	subu	 r13,r12,16
	ld	 r13,r0,r13
	cmp	 r13,r11,r13
	bb1.n	 ne,r13,@L6928
	or	 r2,r0,r24
	bcnd	 eq0,r3,@L6929
	or.u	 r2,r0,hi16(@LC402)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC402)
@L6929:
	bcnd.n	 ne0,r25,@L6930
	or.u	 r13,r0,hi16(_current_class_name)
	or.u	 r13,r0,hi16(_ptr_type_node)
	ld	 r2,r13,lo16(_ptr_type_node)
	or.u	 r13,r0,hi16(_void_list_node)
	ld	 r3,r13,lo16(_void_list_node)
	or.u	 r13,r0,hi16(_void_type_node)
	ld	 r25,r13,lo16(_void_type_node)
@L6940:
	bsr	 _hash_tree_chain
	or	 r3,r0,r2
	bsr.n	 _build_function_type
	or	 r2,r0,r25
	br.n	 @L6921
	st	 r2,r24,4
	align	 4
@L6930:
	ld	 r13,r13,lo16(_current_class_name)
	ld	 r3,r24,4
	ld	 r2,r13,4
	bsr.n	 _coerce_delete_type
	addu	 r1,r1,@L6943
@L6944:
	align	 4
@L6928:
	or.u	 r3,r0,hi16(@LC403)
	or	 r3,r3,lo16(@LC403)
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L6945
@L6946:
	align	 4
@L6922:
	or.u	 r13,r0,hi16(_ansi_opname+180)
	ld	 r12,r24,32
	ld	 r13,r13,lo16(_ansi_opname+180)
	cmp	 r12,r12,r13
	bb0	 eq,r12,@L6921
	bcnd.n	 ne0,r25,@L6935
	or.u	 r3,r0,hi16(@LC404)
	or	 r2,r0,r24
	or	 r3,r3,lo16(@LC404)
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L6947
@L6948:
	align	 4
@L6935:
	ld	 r13,r0,r25
	bcnd	 eq0,r13,@L6936
	ld	 r11,r13,16
	br	 @L6937
	align	 4
@L6936:
	or.u	 r13,r0,hi16(_void_type_node)
	ld	 r11,r13,lo16(_void_type_node)
@L6937:
	ld.bu	 r13,r11,8
	cmp	 r13,r13,15
	bb0.n	 eq,r13,@L6921
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r10,r11,4
	ld	 r13,r13,lo16(_current_class_type)
	cmp	 r13,r10,r13
	bb0	 eq,r13,@L6921
	ld	 r12,r10,80
	ld	 r13,r0,r12
	or	 r13,r13,16384
	st	 r13,r0,r12
	ld	 r12,r10,80
	ld	 r13,r0,r12
	or	 r13,r13,8192
	st	 r13,r0,r12
	ld	 r13,r11,4
	ld	 r13,r13,8
	bb0.n	 (31-13),r13,@L6921
	or.u	 r11,r0,0x4
	ld	 r12,r10,80
	ld	 r13,r0,r12
	or	 r13,r13,r11
	st	 r13,r0,r12
@L6921:
@Lte65:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64
	def	 @L6947,@L6921-@L6948
	def	 @L6945,@L6921-@L6946
	def	 @L6943,@L6921-@L6944
	def	 @L6941,@L6921-@L6942

data
	align	 4
_xref_next_defn:
	word	 0
	align	 8
@LC405:
	string	 "%s::%s\000"
text
	align	 8
	global	 _xref_defn_tag
_xref_defn_tag:
	or.u	 r13,r0,hi16(_class_binding_level)
	ld	 r11,r13,lo16(_class_binding_level)
	subu	 r31,r31,80
	or.u	 r12,r0,hi16(_xref_next_defn)
	st	 r30,r31,64
	addu	 r30,r31,64
	st.d	 r22,r31,48
	or	 r23,r0,r2
	st.d	 r24,r31,56
	or	 r24,r0,r3
	st	 r1,r31,68
	or	 r22,r0,r4
	st	 r21,r31,44
@Ltb66:
	or	 r13,r0,1
	bcnd.n	 eq0,r11,@L6950
	st	 r13,r12,lo16(_xref_next_defn)
	or.u	 r13,r0,hi16(_current_class_name)
	ld	 r13,r13,lo16(_current_class_name)
	ld	 r11,r13,24
	bcnd	 eq0,r11,@L6951
	ld	 r11,r11,32
	br	 @L6952
	align	 4
@L6951:
	or	 r11,r0,r13
@L6952:
	ld	 r13,r24,12
	ld	 r12,r11,12
	addu	 r13,r13,r12
	addu	 r13,r13,19
	ld	 r4,r11,16
	and	 r13,r13,0xfff0
	ld	 r5,r24,16
	subu	 r31,r31,r13
	or.u	 r3,r0,hi16(@LC405)
	addu	 r25,r31,32
	or	 r3,r3,lo16(@LC405)
	bsr.n	 _sprintf
	or	 r2,r0,r25
	bsr.n	 _get_identifier
	or	 r2,r0,r25
	or	 r25,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r24
	bsr.n	 _xref_tag
	or	 r4,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,32
	or	 r3,r0,r25
	or	 r4,r0,r22
	bsr.n	 _build_lang_decl
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r24,r25,lo16(_current_binding_level)
	or.u	 r21,r0,hi16(_global_binding_level)
	or	 r23,r0,r2
	ld	 r13,r21,lo16(_global_binding_level)
	bsr.n	 _pushdecl
	st	 r13,r25,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_class_binding_level)
	ld	 r13,r13,lo16(_class_binding_level)
	bcnd.n	 eq0,r13,@L6954
	st	 r24,r25,lo16(_current_binding_level)
	or	 r24,r0,r13
@L6954:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,32
	bb0	 eq,r13,@L6969
	ld	 r10,r23,32
	ld	 r12,r21,lo16(_global_binding_level)
	cmp	 r13,r24,r12
	bb0.n	 ne,r13,@L6957
	or	 r11,r0,0
	or	 r9,r0,r12
@L6959:
	ld	 r12,r24,16
	bcnd	 eq0,r12,@L6958
@L6963:
	ld	 r13,r12,12
	cmp	 r13,r13,r10
	bb1	 ne,r13,@L6962
	addu	 r11,r12,16
@L6962:
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L6963
@L6958:
	ld	 r24,r24,28
	cmp	 r13,r24,r9
	bb1	 ne,r13,@L6959
@L6957:
	ld	 r2,r23,4
	bcnd	 ne0,r11,@L6967
	st	 r2,r10,4
	br.n	 @L6972
	subu	 r31,r30,64
	align	 4
@L6967:
	br.n	 @L6969
	st	 r2,r0,r11
	align	 4
@L6950:
	or	 r2,r0,r23
	or	 r3,r0,r24
	bsr.n	 _xref_tag
	or	 r4,r0,r22
	or	 r22,r0,r2
@L6969:
@Lte66:
	subu	 r31,r30,64
@L6972:
	ld	 r1,r31,68
	ld	 r30,r31,64
	ld	 r21,r31,44
	ld.d	 r24,r31,56
	or	 r2,r0,r22
	ld.d	 r22,r31,48
	or.u	 r13,r0,hi16(_xref_next_defn)
	addu	 r31,r31,80
	jmp.n	 r1
	st	 r0,r13,lo16(_xref_next_defn)

data
	align	 8
@LC406:
	string	 "derived union `%s' invalid\000"
	align	 8
@LC407:
	string	 "type `%s' is both exception and aggregate type\000"
	align	 8
@LC408:
	string	 "redeclaration of derivation chain of type `%s'\000"
	align	 8
@LC409:
	string	 "base type `%s' fails to be a struct or class type"
	string	 "\000"
	align	 8
@LC410:
	string	 "recursive type `%s' undefined\000"
	align	 8
@LC411:
	string	 "duplicate base type `%s' invalid\000"
text
	align	 8
	global	 _xref_tag
_xref_tag:
	subu	 r31,r31,96
	or.u	 r13,r0,hi16(_class_binding_level)
	st.d	 r20,r31,56
	ld	 r20,r13,lo16(_class_binding_level)
	st	 r1,r31,80
	st	 r15,r31,36
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	or	 r23,r0,r3
	st.d	 r16,r31,40
	or	 r17,r0,r4
	bcnd.n	 ne0,r20,@L6974
	st.d	 r18,r31,48
@Ltb67:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r20,r13,lo16(_current_binding_level)
@L6974:
	ld	 r15,r2,12
	cmp	 r13,r15,2
	bb0	 ne,r13,@L6979
	bb1.n	 lo,r13,@L6978
	cmp	 r13,r15,3
	bb0.n	 ne,r13,@L6981
	cmp	 r13,r15,4
	bb1	 ne,r13,@L6982
@L6978:
	or	 r2,r0,r17
	bsr.n	 _list_length
	or	 r21,r0,21
	br.n	 @L6975
	or	 r18,r0,r2
	align	 4
@L6979:
	bcnd.n	 eq0,r17,@L6980
	or	 r21,r0,22
	or.u	 r2,r0,hi16(@LC406)
	ld	 r3,r23,16
	or	 r2,r2,lo16(@LC406)
	bsr.n	 _error
	or	 r17,r0,0
@L6980:
	br.n	 @L6975
	or	 r18,r0,0
	align	 4
@L6981:
	br.n	 @L6975
	or	 r21,r0,10
	align	 4
@L6982:
	bsr.n	 _my_friendly_abort
	or	 r2,r0,18
@L6975:
	or.u	 r12,r0,hi16(_xref_next_defn)
	ld	 r13,r12,lo16(_xref_next_defn)
	bcnd.n	 eq0,r13,@L6984
	or	 r22,r0,r20
	bcnd.n	 eq0,r20,@L7101
	st	 r0,r12,lo16(_xref_next_defn)
	or.u	 r19,r0,hi16(@LC116)
@L6989:
	ld	 r12,r23,16
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1	 ne,r13,@L6990
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb1	 ne,r13,@L6990
	ld	 r25,r22,4
	bcnd	 eq0,r25,@L6997
@L6994:
	ld	 r2,r25,16
	ld	 r13,r2,48
	ld	 r13,r13,32
	cmp	 r13,r13,r23
	bb0	 ne,r13,@L7352
	ld	 r25,r0,r25
	bcnd	 eq0,r25,@L6997
	br	 @L6994
	align	 4
@L6990:
	ld	 r25,r22,4
	bcnd	 eq0,r25,@L6997
@L7001:
	ld	 r13,r25,12
	cmp	 r13,r13,r23
	bb1	 ne,r13,@L7000
	ld	 r13,r25,16
	ld.bu	 r12,r13,8
	cmp	 r13,r12,r21
	bb0.n	 ne,r13,@L7317
	cmp	 r13,r21,10
	bb0.n	 ne,r13,@L7004
	cmp	 r13,r12,129
	cmp	 r12,r12,132
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd	 eq0,r13,@L7317
@L7004:
	or.u	 r2,r0,hi16(@LC115)
	ld	 r3,r23,16
	or	 r2,r2,lo16(@LC115)
	bsr.n	 _error
	addu	 r1,r1,@L7397
@L7398:
	align	 4
@L7000:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L7001
@L6997:
	ld	 r13,r22,32
	bb0.n	 (31-23),r13,@L7101
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r11,r13,lo16(_current_class_type)
	bcnd.n	 eq0,r11,@L6988
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r22,28
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r12,r12,r13
	bb1	 ne,r12,@L6988
	or	 r24,r0,r11
	or.u	 r13,r0,hi16(_tree_code_type)
@L7372:
	ld.bu	 r12,r24,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r12,r0,r13
	cmp	 r13,r12,100
	bb1.n	 eq,r13,@L6988
	cmp	 r13,r12,116
	bb1	 ne,r13,@L7029
	ld	 r11,r23,16
	ld.b	 r13,r0,r11
	ld	 r12,r24,80
	cmp	 r13,r13,36
	ld	 r12,r12,48
	bb1	 ne,r13,@L7013
	ld.b	 r13,r11,1
	cmp	 r13,r13,95
	bb1	 ne,r13,@L7013
	bcnd	 eq0,r12,@L6988
@L7016:
	ld	 r13,r12,16
	ld	 r13,r13,48
	ld	 r13,r13,32
	cmp	 r13,r13,r23
	bb0	 ne,r13,@L7317
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L7016
	br	 @L6988
	align	 4
@L7013:
	bcnd	 eq0,r12,@L6988
@L7022:
	ld	 r13,r12,12
	cmp	 r13,r13,r23
	bb1	 ne,r13,@L7023
	ld	 r13,r12,16
	ld.bu	 r13,r13,8
	cmp	 r13,r13,r21
	bb0	 ne,r13,@L7317
	ld	 r3,r23,16
	or	 r2,r19,lo16(@LC116)
	bsr.n	 _error
	addu	 r1,r1,@L7399
@L7400:
	align	 4
@L7023:
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L7022
	br	 @L6988
	align	 4
@L7029:
	bsr.n	 _my_friendly_abort
	or	 r2,r0,10
	bcnd.n	 ne0,r24,@L7372
	or.u	 r13,r0,hi16(_tree_code_type)
@L6988:
	ld	 r22,r22,28
	bcnd.n	 ne0,r22,@L6989
	or	 r24,r0,0
	br	 @L7033
	align	 4
@L7318:
	br.n	 @L7034
	or	 r24,r0,r2
	align	 4
@L6984:
	bcnd	 eq0,r20,@L7036
	or.u	 r19,r0,hi16(@LC116)
@L7038:
	ld	 r12,r23,16
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1	 ne,r13,@L7039
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb1	 ne,r13,@L7039
	ld	 r25,r22,4
	bcnd.n	 eq0,r25,@L7373
	or.u	 r13,r0,hi16(_current_class_type)
@L7043:
	ld	 r2,r25,16
	ld	 r13,r2,48
	ld	 r13,r13,32
	cmp	 r13,r13,r23
	bb1	 eq,r13,@L7318
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L7043
	or.u	 r13,r0,hi16(_current_class_type)
	br	 @L7373
	align	 4
@L7039:
	ld	 r25,r22,4
	bcnd.n	 eq0,r25,@L7373
	or.u	 r13,r0,hi16(_current_class_type)
@L7050:
	ld	 r13,r25,12
	cmp	 r13,r13,r23
	bb1	 ne,r13,@L7049
	ld	 r13,r25,16
	ld.bu	 r12,r13,8
	cmp	 r13,r12,r21
	bb0.n	 ne,r13,@L7073
	cmp	 r13,r21,10
	bb0.n	 ne,r13,@L7053
	cmp	 r13,r12,129
	cmp	 r12,r12,132
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd	 eq0,r13,@L7073
@L7053:
	or.u	 r2,r0,hi16(@LC115)
	ld	 r3,r23,16
	br.n	 @L7371
	or	 r2,r2,lo16(@LC115)
	align	 4
@L7049:
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L7050
	or.u	 r13,r0,hi16(_current_class_type)
@L7373:
	ld	 r11,r13,lo16(_current_class_type)
	bcnd.n	 eq0,r11,@L7037
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r22,28
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r12,r12,r13
	bb1	 ne,r12,@L7037
	or	 r24,r0,r11
	or.u	 r13,r0,hi16(_tree_code_type)
@L7374:
	ld.bu	 r12,r24,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r12,r0,r13
	cmp	 r13,r12,100
	bb1.n	 eq,r13,@L7037
	cmp	 r13,r12,116
	bb1	 ne,r13,@L7078
	ld	 r11,r23,16
	ld.b	 r13,r0,r11
	ld	 r12,r24,80
	cmp	 r13,r13,36
	ld	 r12,r12,48
	bb1	 ne,r13,@L7062
	ld.b	 r13,r11,1
	cmp	 r13,r13,95
	bb1	 ne,r13,@L7062
	bcnd	 eq0,r12,@L7037
@L7065:
	ld	 r13,r12,16
	ld	 r13,r13,48
	ld	 r13,r13,32
	cmp	 r13,r13,r23
	bb0	 ne,r13,@L7073
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L7065
	br	 @L7037
	align	 4
@L7062:
	bcnd	 eq0,r12,@L7037
@L7071:
	ld	 r13,r12,12
	cmp	 r13,r13,r23
	bb1	 ne,r13,@L7072
	ld	 r13,r12,16
	ld.bu	 r13,r13,8
	cmp	 r13,r13,r21
	bb0	 ne,r13,@L7073
	ld	 r3,r23,16
	or	 r2,r19,lo16(@LC116)
@L7371:
	bsr	 _error
@L7073:
	ld	 r24,r25,16
	br	 @L7034
	align	 4
@L7072:
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L7071
	br	 @L7037
	align	 4
@L7078:
	bsr.n	 _my_friendly_abort
	or	 r2,r0,10
	bcnd.n	 ne0,r24,@L7374
	or.u	 r13,r0,hi16(_tree_code_type)
@L7037:
	ld	 r22,r22,28
	bcnd	 ne0,r22,@L7038
@L7036:
	or	 r24,r0,0
@L7034:
	bcnd.n	 ne0,r24,@L7033
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r12,r13,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r12,r12,r13
	bb0.n	 ne,r12,@L7084
	or	 r25,r0,1
	ld	 r2,r23,24
	bcnd.n	 ne0,r2,@L7085
	or	 r3,r0,r2
@L7084:
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r2,r13,lo16(_current_class_type)
	bcnd	 eq0,r2,@L7086
	ld	 r3,r23,28
	bcnd	 ne0,r3,@L7314
	ld	 r13,r2,16
	bcnd	 ne0,r13,@L7087
	ld	 r13,r2,80
	ld	 r13,r0,r13
	bb0	 (31-24),r13,@L7087
	subu	 r5,r0,1
	or	 r3,r0,r23
	cmp	 r5,r25,r5
	or	 r4,r0,0
	bsr.n	 _lookup_field
	extu	 r5,r5,1<eq>
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	or	 r3,r0,r2
	cmp	 r13,r3,r13
	bb0.n	 ne,r13,@L7083
	or	 r24,r0,r3
	bcnd	 eq0,r3,@L7313
	ld.bu	 r13,r3,8
	cmp	 r13,r13,32
	ext	 r13,r13,1<eq>
	and	 r3,r3,r13
@L7087:
	bcnd	 ne0,r3,@L7314
@L7313:
	bsr.n	 _lookup_nested_field
	or	 r2,r0,r23
	or	 r3,r0,r2
	bcnd	 ne0,r3,@L7314
@L7086:
	ld	 r3,r23,20
@L7085:
	bcnd.n	 eq0,r3,@L7083
	or	 r24,r0,r3
@L7314:
	ld.bu	 r13,r3,8
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L7093
	or.u	 r13,r0,hi16(_looking_for_typename)
	ld	 r11,r13,lo16(_looking_for_typename)
	bcnd	 lt0,r11,@L7093
	ld	 r4,r23,4
	bcnd	 eq0,r4,@L7096
	ld	 r4,r4,48
	subu	 r13,r0,r25
	cmp	 r12,r3,r4
	subu	 r13,r0,r13
	extu	 r12,r12,1<eq>
	or	 r12,r12,r13
	bcnd.n	 ne0,r12,@L7083
	or	 r24,r0,r4
	bcnd	 gt0,r11,@L7083
	bsr.n	 _arbitrate_lookup
	or	 r2,r0,r23
	br.n	 @L7083
	or	 r24,r0,r2
	align	 4
@L7096:
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r2,r3,4
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r2,r13
	bb1.n	 ne,r13,@L7083
	or	 r24,r0,r3
	br.n	 @L7083
	or	 r24,r0,r2
	align	 4
@L7093:
	or	 r24,r0,r3
@L7083:
	bcnd	 eq0,r24,@L7101
	ld.bu	 r13,r24,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L7101
	ld	 r2,r24,4
	ld.bu	 r13,r2,8
	cmp	 r13,r13,r21
	bb1.n	 ne,r13,@L7033
	or	 r24,r0,0
@L7352:
	br.n	 @L7033
	or	 r24,r0,r2
	align	 4
@L7317:
	ld	 r24,r25,16
	br	 @L7033
	align	 4
@L7101:
	or	 r24,r0,0
@L7033:
	bsr	 _push_obstacks_nochange
	bcnd.n	 ne0,r24,@L7103
	subu	 r13,r21,21
	bsr	 _allocation_temporary_p
	bcnd.n	 eq0,r2,@L7375
	cmp	 r13,r21,10
	bsr	 _end_temporary_allocation
	cmp	 r13,r21,10
@L7375:
	bb1.n	 ne,r13,@L7105
	cmp	 r13,r15,4
	bsr.n	 _make_node
	or	 r2,r0,10
	or.u	 r11,r0,hi16(_unsigned_type_node)
	ld	 r13,r11,lo16(_unsigned_type_node)
	ld.bu	 r13,r13,24
	or	 r24,r0,r2
	st.b	 r13,r24,24
	ld	 r10,r11,lo16(_unsigned_type_node)
	ld	 r13,r24,8
	ld	 r12,r10,28
	st	 r12,r24,28
	or.u	 r13,r13,0x2
	st	 r13,r24,8
	ld.bu	 r13,r10,25
	st.b	 r13,r24,25
	ld	 r12,r11,lo16(_unsigned_type_node)
	ld	 r13,r12,52
	st	 r13,r24,52
	or.u	 r13,r0,hi16(_class_binding_level)
	ld	 r12,r12,56
	ld	 r13,r13,lo16(_class_binding_level)
	bcnd.n	 eq0,r13,@L7107
	st	 r12,r24,56
	br.n	 @L7108
	or	 r22,r0,r13
	align	 4
@L7107:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r22,r13,lo16(_current_binding_level)
	ld	 r13,r22,32
	bb0.n	 (31-23),r13,@L7376
	or.u	 r13,r0,hi16(_global_binding_level)
@L7111:
	ld	 r22,r22,28
	ld	 r13,r22,32
	bb1	 (31-23),r13,@L7111
@L7108:
	or.u	 r13,r0,hi16(_global_binding_level)
@L7376:
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r22,r13
	bb1.n	 ne,r13,@L7113
	or	 r2,r0,r23
	ld	 r4,r22,4
	or	 r3,r0,r24
	bsr.n	 _perm_tree_cons
	addu	 r1,r1,@L7401
@L7402:
	align	 4
@L7113:
	ld	 r4,r22,4
	bsr.n	 _saveable_tree_cons
	or	 r3,r0,r24
@L7353:
	bcnd.n	 eq0,r23,@L7115
	st	 r2,r22,4
	ld	 r13,r24,48
	bcnd	 ne0,r13,@L7116
	st	 r23,r24,48
@L7116:
	ld	 r13,r23,4
	cmp	 r13,r13,r24
	bb0	 ne,r13,@L7117
	ld.bu	 r13,r24,8
	cmp	 r13,r13,21
	bb1.n	 ne,r13,@L7377
	or.u	 r13,r0,hi16(_current_class_type)
	or.u	 r13,r0,hi16(_class_binding_level)
	ld	 r13,r13,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L7118
	ld	 r13,r24,80
	ld	 r13,r0,r13
	bb1	 (31-28),r13,@L7117
@L7118:
	or.u	 r13,r0,hi16(_current_class_type)
@L7377:
	ld	 r11,r13,lo16(_current_class_type)
	bcnd	 eq0,r11,@L7120
	ld	 r13,r11,16
	bcnd.n	 eq0,r13,@L7119
	or	 r4,r0,r24
@L7120:
	or.u	 r13,r0,hi16(_current_lang_name)
	or.u	 r12,r0,hi16(_lang_name_cplusplus)
	ld	 r13,r13,lo16(_current_lang_name)
	ld	 r12,r12,lo16(_lang_name_cplusplus)
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L7121
	or	 r25,r0,0
	bcnd.n	 eq0,r11,@L7122
	or	 r3,r0,0
	ld	 r3,r11,48
@L7122:
	bsr.n	 _lookup_nested_type
	or	 r2,r0,r24
	or	 r25,r0,r2
@L7121:
	bcnd.n	 ne0,r25,@L7125
	or	 r2,r0,32
	or	 r3,r0,r23
	bsr.n	 _build_decl
	or	 r4,r0,r24
	or	 r25,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,1
	bsr.n	 _build_overload_name
	or	 r4,r0,1
	bsr.n	 _get_identifier
	or.u	 r21,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r21,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	st	 r2,r25,60
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L7127
	st	 r0,r25,16
	ld	 r3,r23,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r23
	ld	 r13,r21,lo16(_current_binding_level)
	br.n	 @L7378
	st	 r2,r13,16
	align	 4
@L7127:
	or.u	 r21,r0,hi16(_class_binding_level)
	ld	 r13,r21,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L7128
	ld	 r3,r23,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r23
	ld	 r13,r21,lo16(_class_binding_level)
	st	 r2,r13,16
@L7128:
@L7378:
	br.n	 @L7130
	st	 r24,r23,4
	align	 4
@L7125:
	ld	 r25,r25,48
@L7130:
	ld	 r12,r23,16
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1	 ne,r13,@L7132
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb0	 ne,r13,@L7379
@L7132:
	ld	 r13,r24,48
	bcnd	 eq0,r13,@L7136
	ld.bu	 r13,r13,8
	cmp	 r13,r13,32
	bb1.n	 ne,r13,@L7380
	or.u	 r13,r0,hi16(_class_binding_level)
	or	 r2,r0,r23
	bsr.n	 _lookup_name
	or	 r3,r0,1
	ld	 r13,r24,48
	cmp	 r2,r2,r13
	bb0.n	 ne,r2,@L7136
	or.u	 r13,r0,hi16(_class_binding_level)
@L7380:
	ld	 r13,r13,lo16(_class_binding_level)
	bcnd.n	 ne0,r13,@L7355
	or	 r2,r0,r25
	bsr.n	 _pushdecl
	addu	 r1,r1,@L7403
@L7404:
	align	 4
@L7119:
	or	 r2,r0,32
	or	 r3,r0,r23
	bsr.n	 _build_lang_field_decl
	or.u	 r21,r0,hi16(_current_binding_level)
	ld	 r12,r21,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L7138
	or	 r25,r0,r2
	ld	 r3,r23,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r23
	ld	 r13,r21,lo16(_current_binding_level)
	br.n	 @L7139
	st	 r2,r13,16
	align	 4
@L7138:
	or.u	 r21,r0,hi16(_class_binding_level)
	ld	 r13,r21,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L7139
	ld	 r3,r23,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r23
	ld	 r13,r21,lo16(_class_binding_level)
	st	 r2,r13,16
@L7139:
	or	 r2,r0,r25
	st	 r24,r23,4
@L7355:
	bsr	 _pushdecl_class_level
@L7356:
	or	 r25,r0,r2
@L7136:
	ld	 r12,r23,16
@L7379:
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1.n	 ne,r13,@L7381
	or.u	 r20,r0,hi16(_current_class_type)
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb1	 ne,r13,@L7381
	ld	 r13,r25,28
	or.u	 r13,r13,0x2
	st	 r13,r25,28
	or.u	 r20,r0,hi16(_current_class_type)
@L7381:
	ld	 r11,r20,lo16(_current_class_type)
	bcnd.n	 ne0,r11,@L7144
	st	 r25,r24,48
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r13,r13,lo16(_current_function_decl)
	bcnd	 eq0,r13,@L7143
@L7144:
	or.u	 r13,r0,hi16(_current_lang_name)
	or.u	 r12,r0,hi16(_lang_name_cplusplus)
	ld	 r13,r13,lo16(_current_lang_name)
	ld	 r12,r12,lo16(_lang_name_cplusplus)
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L7142
	or.u	 r21,r0,hi16(_current_function_decl)
@L7143:
	br.n	 @L7117
	st	 r23,r25,40
	align	 4
@L7142:
	ld	 r13,r21,lo16(_current_function_decl)
	bcnd.n	 eq0,r13,@L7146
	or	 r2,r0,r25
	or	 r4,r0,r23
	ld	 r3,r13,60
	bsr.n	 _set_nested_typename
	or	 r5,r0,r24
	ld	 r13,r21,lo16(_current_function_decl)
	br.n	 @L7117
	st	 r13,r25,36
	align	 4
@L7146:
	ld	 r13,r11,16
	bcnd	 ne0,r13,@L7117
	ld	 r13,r11,48
	or	 r2,r0,r25
	or	 r4,r0,r23
	ld	 r3,r13,40
	bsr.n	 _set_nested_typename
	or	 r5,r0,r24
	ld	 r13,r20,lo16(_current_class_type)
	ld	 r12,r25,80
	st	 r13,r25,36
	st	 r13,r12,8
@L7117:
	ld	 r13,r22,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb1	 ne,r13,@L7115
	ld	 r13,r24,8
	or.u	 r12,r0,hi16(_current_class_type)
	ld	 r11,r24,48
	ld	 r12,r12,lo16(_current_class_type)
	or	 r13,r13,512
	st	 r13,r24,8
	st	 r11,r23,28
	ld	 r13,r12,16
	bcnd	 ne0,r13,@L7115
	ld	 r12,r12,80
	ld	 r13,r22,4
	st	 r13,r12,48
@L7115:
	ld	 r12,r24,48
	ld.bu	 r13,r12,8
	cmp	 r13,r13,32
	bb1.n	 ne,r13,@L7151
	or	 r2,r0,32
	br.n	 @L7106
	st	 r12,r0,r24
	align	 4
@L7151:
	or	 r3,r0,0
	bsr.n	 _build_decl
	or	 r4,r0,r24
	bsr	 _pushdecl
	st	 r2,r0,r24
@L7106:
	or.u	 r13,r0,hi16(_flag_cadillac)
	ld	 r13,r13,lo16(_flag_cadillac)
	bcnd.n	 eq0,r13,@L7261
	or	 r2,r0,r24
	bsr.n	 _cadillac_start_enum
	addu	 r1,r1,@L7405
@L7406:
	align	 4
@L7105:
	bb1.n	 ne,r13,@L7155
	or.u	 r13,r0,hi16(_class_binding_level)
	bsr.n	 _make_lang_type
	or	 r2,r0,r21
	or	 r24,r0,r2
	ld	 r11,r24,80
	or.u	 r12,r0,hi16(_class_binding_level)
	ld	 r13,r0,r11
	ld	 r12,r12,lo16(_class_binding_level)
	or	 r13,r13,8
	bcnd.n	 eq0,r12,@L7157
	st	 r13,r0,r11
	br.n	 @L7158
	or	 r22,r0,r12
	align	 4
@L7157:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r22,r13,lo16(_current_binding_level)
	ld	 r13,r22,32
	bb0.n	 (31-23),r13,@L7382
	or.u	 r13,r0,hi16(_global_binding_level)
@L7161:
	ld	 r22,r22,28
	ld	 r13,r22,32
	bb1	 (31-23),r13,@L7161
@L7158:
	or.u	 r13,r0,hi16(_global_binding_level)
@L7382:
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r22,r13
	bb1.n	 ne,r13,@L7163
	or	 r2,r0,r23
	ld	 r4,r22,4
	or	 r3,r0,r24
	bsr.n	 _perm_tree_cons
	addu	 r1,r1,@L7407
@L7408:
	align	 4
@L7163:
	ld	 r4,r22,4
	bsr.n	 _saveable_tree_cons
	or	 r3,r0,r24
@L7358:
	bcnd.n	 eq0,r23,@L7165
	st	 r2,r22,4
	ld	 r13,r24,48
	bcnd	 ne0,r13,@L7166
	st	 r23,r24,48
@L7166:
	ld	 r13,r23,4
	cmp	 r13,r13,r24
	bb0	 ne,r13,@L7167
	ld.bu	 r13,r24,8
	cmp	 r13,r13,21
	bb1.n	 ne,r13,@L7383
	or.u	 r13,r0,hi16(_current_class_type)
	or.u	 r13,r0,hi16(_class_binding_level)
	ld	 r13,r13,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L7168
	ld	 r13,r24,80
	ld	 r13,r0,r13
	bb1	 (31-28),r13,@L7167
@L7168:
	or.u	 r13,r0,hi16(_current_class_type)
@L7383:
	ld	 r11,r13,lo16(_current_class_type)
	bcnd	 eq0,r11,@L7170
	ld	 r13,r11,16
	bcnd.n	 eq0,r13,@L7169
	or	 r4,r0,r24
@L7170:
	or.u	 r13,r0,hi16(_current_lang_name)
	or.u	 r12,r0,hi16(_lang_name_cplusplus)
	ld	 r13,r13,lo16(_current_lang_name)
	ld	 r12,r12,lo16(_lang_name_cplusplus)
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L7171
	or	 r25,r0,0
	bcnd.n	 eq0,r11,@L7172
	or	 r3,r0,0
	ld	 r3,r11,48
@L7172:
	bsr.n	 _lookup_nested_type
	or	 r2,r0,r24
	or	 r25,r0,r2
@L7171:
	bcnd.n	 ne0,r25,@L7175
	or	 r2,r0,32
	or	 r3,r0,r23
	bsr.n	 _build_decl
	or	 r4,r0,r24
	or	 r25,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,1
	bsr.n	 _build_overload_name
	or	 r4,r0,1
	bsr.n	 _get_identifier
	or.u	 r21,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r21,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	st	 r2,r25,60
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L7177
	st	 r0,r25,16
	ld	 r3,r23,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r23
	ld	 r13,r21,lo16(_current_binding_level)
	br.n	 @L7384
	st	 r2,r13,16
	align	 4
@L7177:
	or.u	 r21,r0,hi16(_class_binding_level)
	ld	 r13,r21,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L7178
	ld	 r3,r23,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r23
	ld	 r13,r21,lo16(_class_binding_level)
	st	 r2,r13,16
@L7178:
@L7384:
	br.n	 @L7180
	st	 r24,r23,4
	align	 4
@L7175:
	ld	 r25,r25,48
@L7180:
	ld	 r12,r23,16
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1	 ne,r13,@L7182
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb0	 ne,r13,@L7385
@L7182:
	ld	 r13,r24,48
	bcnd	 eq0,r13,@L7186
	ld.bu	 r13,r13,8
	cmp	 r13,r13,32
	bb1.n	 ne,r13,@L7386
	or.u	 r13,r0,hi16(_class_binding_level)
	or	 r2,r0,r23
	bsr.n	 _lookup_name
	or	 r3,r0,1
	ld	 r13,r24,48
	cmp	 r2,r2,r13
	bb0.n	 ne,r2,@L7186
	or.u	 r13,r0,hi16(_class_binding_level)
@L7386:
	ld	 r13,r13,lo16(_class_binding_level)
	bcnd.n	 ne0,r13,@L7360
	or	 r2,r0,r25
	bsr.n	 _pushdecl
	addu	 r1,r1,@L7409
@L7410:
	align	 4
@L7169:
	or	 r2,r0,32
	or	 r3,r0,r23
	bsr.n	 _build_lang_field_decl
	or.u	 r21,r0,hi16(_current_binding_level)
	ld	 r12,r21,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L7188
	or	 r25,r0,r2
	ld	 r3,r23,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r23
	ld	 r13,r21,lo16(_current_binding_level)
	br.n	 @L7189
	st	 r2,r13,16
	align	 4
@L7188:
	or.u	 r21,r0,hi16(_class_binding_level)
	ld	 r13,r21,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L7189
	ld	 r3,r23,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r23
	ld	 r13,r21,lo16(_class_binding_level)
	st	 r2,r13,16
@L7189:
	or	 r2,r0,r25
	st	 r24,r23,4
@L7360:
	bsr	 _pushdecl_class_level
@L7361:
	or	 r25,r0,r2
@L7186:
	ld	 r12,r23,16
@L7385:
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1.n	 ne,r13,@L7387
	or.u	 r20,r0,hi16(_current_class_type)
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb1	 ne,r13,@L7387
	ld	 r13,r25,28
	or.u	 r13,r13,0x2
	st	 r13,r25,28
	or.u	 r20,r0,hi16(_current_class_type)
@L7387:
	ld	 r11,r20,lo16(_current_class_type)
	bcnd.n	 ne0,r11,@L7194
	st	 r25,r24,48
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r13,r13,lo16(_current_function_decl)
	bcnd	 eq0,r13,@L7193
@L7194:
	or.u	 r13,r0,hi16(_current_lang_name)
	or.u	 r12,r0,hi16(_lang_name_cplusplus)
	ld	 r13,r13,lo16(_current_lang_name)
	ld	 r12,r12,lo16(_lang_name_cplusplus)
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L7192
	or.u	 r21,r0,hi16(_current_function_decl)
@L7193:
	br.n	 @L7167
	st	 r23,r25,40
	align	 4
@L7192:
	ld	 r13,r21,lo16(_current_function_decl)
	bcnd.n	 eq0,r13,@L7196
	or	 r2,r0,r25
	or	 r4,r0,r23
	ld	 r3,r13,60
	bsr.n	 _set_nested_typename
	or	 r5,r0,r24
	ld	 r13,r21,lo16(_current_function_decl)
	br.n	 @L7167
	st	 r13,r25,36
	align	 4
@L7196:
	ld	 r13,r11,16
	bcnd	 ne0,r13,@L7167
	ld	 r13,r11,48
	or	 r2,r0,r25
	or	 r4,r0,r23
	ld	 r3,r13,40
	bsr.n	 _set_nested_typename
	or	 r5,r0,r24
	ld	 r13,r20,lo16(_current_class_type)
	ld	 r12,r25,80
	st	 r13,r25,36
	st	 r13,r12,8
@L7167:
	ld	 r13,r22,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb1	 ne,r13,@L7165
	ld	 r13,r24,8
	or.u	 r12,r0,hi16(_current_class_type)
	ld	 r11,r24,48
	ld	 r12,r12,lo16(_current_class_type)
	or	 r13,r13,512
	st	 r13,r24,8
	st	 r11,r23,28
	ld	 r13,r12,16
	bcnd	 ne0,r13,@L7165
	ld	 r12,r12,80
	ld	 r13,r22,4
	st	 r13,r12,48
@L7165:
	ld	 r12,r24,48
	ld.bu	 r13,r12,8
	cmp	 r13,r13,32
	bb1.n	 ne,r13,@L7201
	or	 r2,r0,32
	br.n	 @L7156
	st	 r12,r0,r24
	align	 4
@L7201:
	or	 r3,r0,0
	bsr.n	 _build_decl
	or	 r4,r0,r24
	bsr	 _pushdecl
	st	 r2,r0,r24
@L7156:
	or.u	 r13,r0,hi16(_flag_cadillac)
	ld	 r13,r13,lo16(_flag_cadillac)
	bcnd.n	 eq0,r13,@L7261
	or	 r2,r0,r24
	br	 @L7388
	align	 4
@L7155:
	or	 r2,r0,r21
	bsr.n	 _make_lang_type
	ld	 r19,r13,lo16(_class_binding_level)
	or.u	 r13,r0,hi16(_write_virtuals)
	ld	 r13,r13,lo16(_write_virtuals)
	cmp	 r12,r13,2
	bb0.n	 ne,r12,@L7208
	or	 r24,r0,r2
	bb0	 gt,r12,@L7212
	cmp	 r13,r13,3
	bb0	 ne,r13,@L7209
	or	 r11,r0,0
	br	 @L7205
	align	 4
@L7212:
	bcnd.n	 lt0,r13,@L7210
	or	 r11,r0,1
	br	 @L7205
	align	 4
@L7208:
	or.u	 r13,r0,hi16(_pending_vtables)
	ld	 r3,r13,lo16(_pending_vtables)
	bsr.n	 _value_member
	or	 r2,r0,r23
	cmp	 r2,r2,0
	br.n	 @L7205
	extu	 r11,r2,1<ne>
	align	 4
@L7209:
	ld	 r13,r24,80
	ld	 r13,r0,r13
	mask	 r11,r13,96
	cmp	 r13,r11,0
	br.n	 @L7205
	extu	 r11,r13,1<eq>
	align	 4
@L7210:
	or	 r11,r0,0
@L7205:
	ld	 r10,r24,80
	or.u	 r12,r0,hi16(_class_binding_level)
	ld	 r13,r0,r10
	mak	 r11,r11,1<15>
	ld	 r12,r12,lo16(_class_binding_level)
	and	 r13,r13,0x7fff
	or	 r13,r13,r11
	bcnd.n	 eq0,r12,@L7214
	st	 r13,r0,r10
	br.n	 @L7215
	or	 r22,r0,r12
	align	 4
@L7214:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r22,r13,lo16(_current_binding_level)
	ld	 r13,r22,32
	bb0.n	 (31-23),r13,@L7389
	or.u	 r13,r0,hi16(_global_binding_level)
@L7218:
	ld	 r22,r22,28
	ld	 r13,r22,32
	bb1	 (31-23),r13,@L7218
@L7215:
	or.u	 r13,r0,hi16(_global_binding_level)
@L7389:
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r22,r13
	bb1.n	 ne,r13,@L7220
	or	 r2,r0,r23
	ld	 r4,r22,4
	or	 r3,r0,r24
	bsr.n	 _perm_tree_cons
	addu	 r1,r1,@L7411
@L7412:
	align	 4
@L7220:
	ld	 r4,r22,4
	bsr.n	 _saveable_tree_cons
	or	 r3,r0,r24
@L7364:
	bcnd.n	 eq0,r23,@L7222
	st	 r2,r22,4
	ld	 r13,r24,48
	bcnd	 ne0,r13,@L7223
	st	 r23,r24,48
@L7223:
	ld	 r13,r23,4
	cmp	 r13,r13,r24
	bb0	 ne,r13,@L7224
	ld.bu	 r13,r24,8
	cmp	 r13,r13,21
	bb1.n	 ne,r13,@L7390
	or.u	 r13,r0,hi16(_current_class_type)
	or.u	 r13,r0,hi16(_class_binding_level)
	ld	 r13,r13,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L7225
	ld	 r13,r24,80
	ld	 r13,r0,r13
	bb1	 (31-28),r13,@L7224
@L7225:
	or.u	 r13,r0,hi16(_current_class_type)
@L7390:
	ld	 r11,r13,lo16(_current_class_type)
	bcnd	 eq0,r11,@L7227
	ld	 r13,r11,16
	bcnd.n	 eq0,r13,@L7226
	or	 r4,r0,r24
@L7227:
	or.u	 r13,r0,hi16(_current_lang_name)
	or.u	 r12,r0,hi16(_lang_name_cplusplus)
	ld	 r13,r13,lo16(_current_lang_name)
	ld	 r12,r12,lo16(_lang_name_cplusplus)
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L7228
	or	 r25,r0,0
	bcnd.n	 eq0,r11,@L7229
	or	 r3,r0,0
	ld	 r3,r11,48
@L7229:
	bsr.n	 _lookup_nested_type
	or	 r2,r0,r24
	or	 r25,r0,r2
@L7228:
	bcnd.n	 ne0,r25,@L7232
	or	 r2,r0,32
	or	 r3,r0,r23
	bsr.n	 _build_decl
	or	 r4,r0,r24
	or	 r25,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,1
	bsr.n	 _build_overload_name
	or	 r4,r0,1
	bsr.n	 _get_identifier
	or.u	 r21,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r21,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	st	 r2,r25,60
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L7234
	st	 r0,r25,16
	ld	 r3,r23,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r23
	ld	 r13,r21,lo16(_current_binding_level)
	br.n	 @L7391
	st	 r2,r13,16
	align	 4
@L7234:
	or.u	 r21,r0,hi16(_class_binding_level)
	ld	 r13,r21,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L7235
	ld	 r3,r23,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r23
	ld	 r13,r21,lo16(_class_binding_level)
	st	 r2,r13,16
@L7235:
@L7391:
	br.n	 @L7237
	st	 r24,r23,4
	align	 4
@L7232:
	ld	 r25,r25,48
@L7237:
	ld	 r12,r23,16
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1	 ne,r13,@L7239
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb0	 ne,r13,@L7392
@L7239:
	ld	 r13,r24,48
	bcnd	 eq0,r13,@L7243
	ld.bu	 r13,r13,8
	cmp	 r13,r13,32
	bb1.n	 ne,r13,@L7393
	or.u	 r13,r0,hi16(_class_binding_level)
	or	 r2,r0,r23
	bsr.n	 _lookup_name
	or	 r3,r0,1
	ld	 r13,r24,48
	cmp	 r2,r2,r13
	bb0.n	 ne,r2,@L7243
	or.u	 r13,r0,hi16(_class_binding_level)
@L7393:
	ld	 r13,r13,lo16(_class_binding_level)
	bcnd.n	 ne0,r13,@L7366
	or	 r2,r0,r25
	bsr.n	 _pushdecl
	addu	 r1,r1,@L7413
@L7414:
	align	 4
@L7226:
	or	 r2,r0,32
	or	 r3,r0,r23
	bsr.n	 _build_lang_field_decl
	or.u	 r21,r0,hi16(_current_binding_level)
	ld	 r12,r21,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L7245
	or	 r25,r0,r2
	ld	 r3,r23,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r23
	ld	 r13,r21,lo16(_current_binding_level)
	br.n	 @L7246
	st	 r2,r13,16
	align	 4
@L7245:
	or.u	 r21,r0,hi16(_class_binding_level)
	ld	 r13,r21,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L7246
	ld	 r3,r23,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r23
	ld	 r13,r21,lo16(_class_binding_level)
	st	 r2,r13,16
@L7246:
	or	 r2,r0,r25
	st	 r24,r23,4
@L7366:
	bsr	 _pushdecl_class_level
@L7367:
	or	 r25,r0,r2
@L7243:
	ld	 r12,r23,16
@L7392:
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1.n	 ne,r13,@L7394
	or.u	 r20,r0,hi16(_current_class_type)
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb1	 ne,r13,@L7394
	ld	 r13,r25,28
	or.u	 r13,r13,0x2
	st	 r13,r25,28
	or.u	 r20,r0,hi16(_current_class_type)
@L7394:
	ld	 r11,r20,lo16(_current_class_type)
	bcnd.n	 ne0,r11,@L7251
	st	 r25,r24,48
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r13,r13,lo16(_current_function_decl)
	bcnd	 eq0,r13,@L7250
@L7251:
	or.u	 r13,r0,hi16(_current_lang_name)
	or.u	 r12,r0,hi16(_lang_name_cplusplus)
	ld	 r13,r13,lo16(_current_lang_name)
	ld	 r12,r12,lo16(_lang_name_cplusplus)
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L7249
	or.u	 r21,r0,hi16(_current_function_decl)
@L7250:
	br.n	 @L7224
	st	 r23,r25,40
	align	 4
@L7249:
	ld	 r13,r21,lo16(_current_function_decl)
	bcnd.n	 eq0,r13,@L7253
	or	 r2,r0,r25
	or	 r4,r0,r23
	ld	 r3,r13,60
	bsr.n	 _set_nested_typename
	or	 r5,r0,r24
	ld	 r13,r21,lo16(_current_function_decl)
	br.n	 @L7224
	st	 r13,r25,36
	align	 4
@L7253:
	ld	 r13,r11,16
	bcnd	 ne0,r13,@L7224
	ld	 r13,r11,48
	or	 r2,r0,r25
	or	 r4,r0,r23
	ld	 r3,r13,40
	bsr.n	 _set_nested_typename
	or	 r5,r0,r24
	ld	 r13,r20,lo16(_current_class_type)
	ld	 r12,r25,80
	st	 r13,r25,36
	st	 r13,r12,8
@L7224:
	ld	 r13,r22,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb1	 ne,r13,@L7222
	ld	 r13,r24,8
	or.u	 r12,r0,hi16(_current_class_type)
	ld	 r11,r24,48
	ld	 r12,r12,lo16(_current_class_type)
	or	 r13,r13,512
	st	 r13,r24,8
	st	 r11,r23,28
	ld	 r13,r12,16
	bcnd	 ne0,r13,@L7222
	ld	 r12,r12,80
	ld	 r13,r22,4
	st	 r13,r12,48
@L7222:
	ld	 r12,r24,48
	ld.bu	 r13,r12,8
	cmp	 r13,r13,32
	bb1.n	 ne,r13,@L7258
	or	 r2,r0,32
	br.n	 @L7213
	st	 r12,r0,r24
	align	 4
@L7258:
	or	 r3,r0,0
	bsr.n	 _build_decl
	or	 r4,r0,r24
	bsr	 _pushdecl
	st	 r2,r0,r24
@L7213:
	or.u	 r13,r0,hi16(_flag_cadillac)
	ld	 r12,r13,lo16(_flag_cadillac)
	or.u	 r13,r0,hi16(_class_binding_level)
	bcnd.n	 eq0,r12,@L7261
	st	 r19,r13,lo16(_class_binding_level)
	or	 r2,r0,r24
@L7388:
	bsr.n	 _cadillac_start_struct
	addu	 r1,r1,@L7415
@L7416:
	align	 4
@L7320:
	or.u	 r2,r0,hi16(@LC408)
	ld	 r3,r23,16
	or	 r2,r2,lo16(@LC408)
	bsr.n	 _error
	addu	 r1,r1,@L7417
@L7418:
	align	 4
@L7103:
	cmp	 r13,r13,1
	bb0	 ls,r13,@L7262
	ld	 r13,r24,24
	bb0	 (31-22),r13,@L7262
	ld	 r13,r24,80
	cmp	 r12,r15,4
	ld	 r13,r0,r13
	extu	 r25,r12,1<eq>
	extu	 r13,r13,1<3>
	xor	 r13,r25,r13
	bcnd	 eq0,r13,@L7262
	or.u	 r2,r0,hi16(@LC407)
	ld	 r3,r23,16
	bsr.n	 _error
	or	 r2,r2,lo16(@LC407)
	ld	 r11,r24,80
	ld	 r13,r0,r11
	mak	 r12,r25,0<3>
	and	 r13,r13,0xfff7
	or	 r13,r13,r12
	st	 r13,r0,r11
@L7262:
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r20,r13
	bb1.n	 ne,r13,@L7264
	or.u	 r13,r0,hi16(_class_binding_level)
	ld	 r13,r13,lo16(_class_binding_level)
	bcnd	 ne0,r13,@L7264
	ld	 r13,r23,20
	bcnd	 ne0,r13,@L7264
	ld	 r13,r24,48
	st	 r13,r23,20
@L7264:
	bcnd	 eq0,r17,@L7274
	ld	 r13,r24,68
	ld	 r13,r13,32
	bcnd.n	 eq0,r13,@L7266
	or	 r25,r0,r17
	or	 r11,r0,r13
@L7270:
	ld	 r13,r11,16
	ld	 r13,r13,4
	ld	 r12,r13,48
	ld	 r13,r25,16
	ld	 r12,r12,32
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L7320
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L7270
	addu	 r11,r11,4
@L7266:
	bcnd	 eq0,r25,@L7274
	bsr	 _end_temporary_allocation
@L7261:
	bcnd	 eq0,r17,@L7274
	ld	 r12,r24,80
	or	 r2,r0,r18
	ld	 r13,r12,4
	or.u	 r25,r0,0x8000
	or	 r21,r0,0
	or	 r13,r13,r25
	bsr.n	 _make_tree_vec
	st	 r13,r12,4
	ld	 r13,r24,68
	or	 r16,r0,r25
	or	 r18,r0,r2
	st	 r18,r13,32
	cmp	 r13,r15,1
@L7395:
	bb1.n	 ne,r13,@L7281
	or	 r20,r0,0
	ld	 r13,r17,12
	cmp	 r12,r13,1
	cmp	 r13,r13,5
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L7280
@L7281:
	or	 r20,r0,1
@L7280:
	ld	 r11,r17,12
	cmp	 r13,r11,6
	cmp	 r12,r11,5
	or	 r13,r13,r12
	cmp	 r12,r11,3
	extu	 r13,r13,1<eq>
	or	 r22,r0,0
	bcnd.n	 ne0,r13,@L7283
	extu	 r19,r12,1<eq>
	cmp	 r13,r11,4
	bb1	 ne,r13,@L7282
@L7283:
	or	 r22,r0,1
@L7282:
	ld	 r13,r17,16
	or	 r4,r0,r20
	ld	 r2,r23,16
	or	 r5,r0,r22
	ld	 r3,r13,16
	or	 r6,r0,0
	bsr.n	 _GNU_xref_hier
	ld	 r25,r13,4
	bcnd	 eq0,r25,@L7286
	ld.bu	 r13,r25,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L7284
	ld	 r25,r25,4
@L7284:
	bcnd	 eq0,r25,@L7286
	ld.bu	 r13,r25,8
	cmp	 r13,r13,21
	bb0	 ne,r13,@L7285
@L7286:
	ld	 r13,r17,16
	or.u	 r2,r0,hi16(@LC409)
	ld	 r3,r13,16
	or	 r2,r2,lo16(@LC409)
	bsr.n	 _error
	addu	 r1,r1,@L7419
@L7420:
	align	 4
@L7285:
	ld	 r13,r25,80
	ld	 r13,r13,4
	and	 r13,r13,r16
	bcnd.n	 eq0,r13,@L7288
	cmp	 r13,r25,r24
	bb1.n	 ne,r13,@L7289
	or.u	 r3,r0,hi16(@LC411)
	or.u	 r3,r0,hi16(@LC410)
	or	 r2,r0,r24
	or	 r3,r3,lo16(@LC410)
	bsr.n	 _error_with_aggr_type
	addu	 r1,r1,@L7421
@L7422:
	align	 4
@L7289:
	or	 r2,r0,r25
	or	 r3,r3,lo16(@LC411)
	bsr.n	 _error_with_aggr_type
	addu	 r1,r1,@L7423
@L7424:
	align	 4
@L7288:
	or.u	 r13,r0,hi16(_integer_zero_node)
	ld	 r12,r25,68
	ld	 r2,r13,lo16(_integer_zero_node)
	ld	 r4,r12,24
	or	 r3,r0,r25
	ld	 r5,r12,28
	bsr.n	 _make_binfo
	or	 r6,r0,0
	lda	 r13,r18[r21]
	st	 r2,r13,16
	ld	 r13,r2,8
	mak	 r12,r20,0<12>
	and	 r13,r13,0xefff
	or	 r13,r13,r12
	mak	 r12,r19,0<10>
	and	 r13,r13,0xfbff
	or	 r13,r13,r12
	mak	 r12,r22,0<13>
	and	 r13,r13,0xdfff
	or	 r13,r13,r12
	st	 r13,r2,8
	ld	 r12,r25,80
	ld	 r13,r12,4
	or	 r13,r13,r16
	bcnd.n	 ne0,r22,@L7292
	st	 r13,r12,4
	ld	 r13,r25,8
	bb0	 (31-25),r13,@L7291
@L7292:
	ld	 r13,r24,8
	or	 r13,r13,320
	st	 r13,r24,8
@L7291:
	ld	 r13,r25,80
	ld	 r13,r0,r13
	bb0	 (31-7),r13,@L7293
	ld	 r12,r24,80
	ld	 r13,r0,r12
	or.u	 r13,r13,0x100
	st	 r13,r0,r12
@L7293:
	ld	 r13,r25,80
	ld	 r13,r13,4
	bb0	 (31-10),r13,@L7294
	ld	 r12,r24,80
	ld	 r13,r12,4
	or.u	 r13,r13,0x20
	st	 r13,r12,4
@L7294:
	ld	 r13,r25,80
	ld	 r13,r0,r13
	bb0	 (31-19),r13,@L7295
	ld	 r12,r24,80
	ld	 r13,r0,r12
	or	 r13,r13,4096
	st	 r13,r0,r12
@L7295:
	ld	 r13,r25,80
	ld	 r13,r0,r13
	bb0	 (31-20),r13,@L7296
	ld	 r12,r24,80
	ld	 r13,r0,r12
	or	 r13,r13,2048
	st	 r13,r0,r12
@L7296:
	ld	 r13,r25,80
	ld	 r13,r0,r13
	bb0	 (31-24),r13,@L7297
	ld	 r12,r24,80
	ld	 r13,r0,r12
	or	 r13,r13,128
	st	 r13,r0,r12
@L7297:
	addu	 r21,r21,1
@L7278:
	ld	 r17,r0,r17
	bcnd.n	 ne0,r17,@L7395
	cmp	 r13,r15,1
	bcnd	 eq0,r21,@L7299
	st	 r21,r18,12
	br.n	 @L7396
	cmp	 r13,r21,1
	align	 4
@L7299:
	ld	 r13,r24,68
	st	 r0,r13,32
	cmp	 r13,r21,1
@L7396:
	bb0	 gt,r13,@L7301
	ld	 r12,r24,80
	ld	 r13,r0,r12
	or.u	 r13,r13,0x20
	br.n	 @L7302
	st	 r13,r0,r12
	align	 4
@L7301:
	bb1	 ne,r13,@L7302
	ld	 r13,r18,16
	ld	 r11,r24,80
	ld	 r13,r13,4
	ld	 r12,r0,r11
	ld	 r13,r13,80
	and.u	 r12,r12,0xffdf
	ld	 r13,r0,r13
	mask.u	 r13,r13,0x20
	or	 r12,r12,r13
	st	 r12,r0,r11
@L7302:
	ld	 r13,r24,80
	ld	 r13,r0,r13
	bb0	 (31-10),r13,@L7304
	ld	 r13,r24,8
	or	 r13,r13,256
	st	 r13,r24,8
@L7304:
	subu	 r21,r21,1
	bcnd	 lt0,r21,@L7306
	set	 r11,r0,31<0>
	xor.c	 r13,r21,r0
	lda	 r2,r18[r21]
	bcnd.n	 lt0,r21,@L7323
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L7307
	cmp	 r13,r12,3
	bb1.n	 ge,r13,@L7323
	cmp	 r13,r12,2
	bb1	 ge,r13,@L7324
	ld	 r13,r2,16
	ld	 r13,r13,4
	ld	 r12,r13,80
	ld	 r13,r12,4
	subu	 r2,r2,4
	subu	 r21,r21,1
	and	 r13,r13,r11
	st	 r13,r12,4
@L7324:
	ld	 r13,r2,16
	ld	 r13,r13,4
	ld	 r12,r13,80
	ld	 r13,r12,4
	subu	 r2,r2,4
	subu	 r21,r21,1
	and	 r13,r13,r11
	st	 r13,r12,4
@L7323:
	ld	 r13,r2,16
	ld	 r13,r13,4
	ld	 r12,r13,80
	ld	 r13,r12,4
	subu	 r2,r2,4
	br.n	 @L7369
	subu	 r21,r21,1
	align	 4
@L7307:
	ld	 r13,r2,16
	ld	 r13,r13,4
	ld	 r12,r13,80
	ld	 r13,r12,4
	and	 r13,r13,r11
	st	 r13,r12,4
	ld	 r13,r2,12
	ld	 r13,r13,4
	ld	 r12,r13,80
	ld	 r13,r12,4
	and	 r13,r13,r11
	st	 r13,r12,4
	ld	 r13,r2,8
	ld	 r13,r13,4
	ld	 r12,r13,80
	ld	 r13,r12,4
	and	 r13,r13,r11
	st	 r13,r12,4
	ld	 r13,r2,4
	ld	 r13,r13,4
	ld	 r12,r13,80
	ld	 r13,r12,4
	subu	 r21,r21,4
	subu	 r2,r2,16
@L7369:
	and	 r13,r13,r11
	bcnd.n	 ge0,r21,@L7307
	st	 r13,r12,4
@L7306:
	ld	 r12,r24,80
	ld	 r13,r12,4
	and.u	 r13,r13,0x7fff
	st	 r13,r12,4
@L7274:
	ld	 r13,r24,16
	bcnd.n	 ne0,r13,@L7309
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r13,r13,lo16(_current_class_type)
	cmp	 r13,r24,r13
	bb0	 ne,r13,@L7309
	ld.bu	 r13,r24,8
	subu	 r13,r13,21
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L7309
	cmp	 r13,r15,1
	bb1	 ne,r13,@L7310
	ld	 r12,r24,80
	ld	 r13,r0,r12
	br.n	 @L7370
	or	 r13,r13,4
	align	 4
@L7310:
	bcnd	 ne0,r15,@L7309
	ld	 r12,r24,80
	ld	 r13,r0,r12
	and	 r13,r13,0xfffb
@L7370:
	st	 r13,r0,r12
@L7309:
	bsr	 _pop_obstacks
@Lte67:
	ld	 r1,r31,80
	ld	 r15,r31,36
	or	 r2,r0,r24
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	jmp.n	 r1
	addu	 r31,r31,96
	def	 @L7423,@L7278-@L7424
	def	 @L7421,@L7278-@L7422
	def	 @L7419,@L7278-@L7420
	def	 @L7417,@L7266-@L7418
	def	 @L7415,@L7261-@L7416
	def	 @L7413,@L7367-@L7414
	def	 @L7411,@L7364-@L7412
	def	 @L7409,@L7361-@L7410
	def	 @L7407,@L7358-@L7408
	def	 @L7405,@L7261-@L7406
	def	 @L7403,@L7356-@L7404
	def	 @L7401,@L7353-@L7402
	def	 @L7399,@L7317-@L7400
	def	 @L7397,@L7317-@L7398

data
	align	 8
@LC412:
	string	 "redeclaration of `enum %s'\000"
text
	align	 8
	global	 _start_enum
_start_enum:
	or.u	 r13,r0,hi16(_class_binding_level)
	ld	 r13,r13,lo16(_class_binding_level)
	subu	 r31,r31,80
	st	 r1,r31,64
	st.d	 r22,r31,48
	or	 r22,r0,r2
	st.d	 r24,r31,56
	or	 r25,r0,0
	bcnd.n	 ne0,r13,@L7527
	st.d	 r20,r31,40
@Ltb68:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
@L7527:
	bcnd	 eq0,r22,@L7528
	or	 r23,r0,r13
	bcnd	 eq0,r23,@L7531
	or.u	 r20,r0,hi16(@LC115)
	or.u	 r21,r0,hi16(@LC116)
@L7533:
	ld	 r12,r22,16
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1	 ne,r13,@L7534
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb1	 ne,r13,@L7534
	ld	 r25,r23,4
	bcnd	 eq0,r25,@L7541
@L7538:
	ld	 r2,r25,16
	ld	 r13,r2,48
	ld	 r13,r13,32
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L7627
	ld	 r25,r0,r25
	bcnd	 eq0,r25,@L7541
	br	 @L7538
	align	 4
@L7534:
	ld	 r25,r23,4
	bcnd	 eq0,r25,@L7541
@L7545:
	ld	 r13,r25,12
	cmp	 r13,r13,r22
	bb1	 ne,r13,@L7544
	ld	 r13,r25,16
	ld.bu	 r13,r13,8
	cmp	 r13,r13,10
	bb0	 ne,r13,@L7629
	ld	 r3,r22,16
	or	 r2,r20,lo16(@LC115)
	bsr.n	 _error
	addu	 r1,r1,@L7647
@L7648:
	align	 4
@L7544:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L7545
@L7541:
	ld	 r13,r23,32
	bb0.n	 (31-23),r13,@L7531
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r11,r13,lo16(_current_class_type)
	bcnd.n	 eq0,r11,@L7532
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r23,28
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r12,r12,r13
	bb1	 ne,r12,@L7532
	or	 r24,r0,r11
	or.u	 r13,r0,hi16(_tree_code_type)
@L7640:
	ld.bu	 r12,r24,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r12,r0,r13
	cmp	 r13,r12,100
	bb1.n	 eq,r13,@L7532
	cmp	 r13,r12,116
	bb1	 ne,r13,@L7573
	ld	 r11,r22,16
	ld.b	 r13,r0,r11
	ld	 r12,r24,80
	cmp	 r13,r13,36
	ld	 r12,r12,48
	bb1	 ne,r13,@L7557
	ld.b	 r13,r11,1
	cmp	 r13,r13,95
	bb1	 ne,r13,@L7557
	bcnd	 eq0,r12,@L7532
@L7560:
	ld	 r13,r12,16
	ld	 r13,r13,48
	ld	 r13,r13,32
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L7629
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L7560
	br	 @L7532
	align	 4
@L7557:
	bcnd	 eq0,r12,@L7532
@L7566:
	ld	 r13,r12,12
	cmp	 r13,r13,r22
	bb1	 ne,r13,@L7567
	ld	 r13,r12,16
	ld.bu	 r13,r13,8
	cmp	 r13,r13,10
	bb0	 ne,r13,@L7629
	ld	 r3,r22,16
	or	 r2,r21,lo16(@LC116)
	bsr.n	 _error
	addu	 r1,r1,@L7649
@L7650:
	align	 4
@L7567:
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L7566
	br	 @L7532
	align	 4
@L7573:
	bsr.n	 _my_friendly_abort
	or	 r2,r0,10
	bcnd.n	 ne0,r24,@L7640
	or.u	 r13,r0,hi16(_tree_code_type)
@L7532:
	ld	 r23,r23,28
	bcnd	 ne0,r23,@L7533
@L7531:
	or	 r25,r0,0
@L7528:
	bcnd	 eq0,r25,@L7578
	ld.bu	 r13,r25,8
	cmp	 r13,r13,10
	bb0	 ne,r13,@L7577
@L7578:
	bsr.n	 _make_node
	or	 r2,r0,10
	or.u	 r13,r0,hi16(_class_binding_level)
	ld	 r13,r13,lo16(_class_binding_level)
	bcnd.n	 eq0,r13,@L7580
	or	 r25,r0,r2
	br.n	 @L7581
	or	 r23,r0,r13
	align	 4
@L7629:
	ld	 r25,r25,16
	br	 @L7528
	align	 4
@L7627:
	br.n	 @L7528
	or	 r25,r0,r2
	align	 4
@L7580:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r23,r13,lo16(_current_binding_level)
	ld	 r13,r23,32
	bb0.n	 (31-23),r13,@L7641
	or.u	 r13,r0,hi16(_global_binding_level)
@L7584:
	ld	 r23,r23,28
	ld	 r13,r23,32
	bb1	 (31-23),r13,@L7584
@L7581:
	or.u	 r13,r0,hi16(_global_binding_level)
@L7641:
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r23,r13
	bb1.n	 ne,r13,@L7586
	or	 r2,r0,r22
	ld	 r4,r23,4
	or	 r3,r0,r25
	bsr.n	 _perm_tree_cons
	addu	 r1,r1,@L7651
@L7652:
	align	 4
@L7586:
	ld	 r4,r23,4
	bsr.n	 _saveable_tree_cons
	or	 r3,r0,r25
@L7635:
	bcnd.n	 eq0,r22,@L7588
	st	 r2,r23,4
	ld	 r13,r25,48
	bcnd	 ne0,r13,@L7589
	st	 r22,r25,48
@L7589:
	ld	 r13,r22,4
	cmp	 r13,r13,r25
	bb0	 ne,r13,@L7590
	ld.bu	 r13,r25,8
	cmp	 r13,r13,21
	bb1.n	 ne,r13,@L7642
	or.u	 r13,r0,hi16(_current_class_type)
	or.u	 r13,r0,hi16(_class_binding_level)
	ld	 r13,r13,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L7591
	ld	 r13,r25,80
	ld	 r13,r0,r13
	bb1	 (31-28),r13,@L7590
@L7591:
	or.u	 r13,r0,hi16(_current_class_type)
@L7642:
	ld	 r11,r13,lo16(_current_class_type)
	bcnd	 eq0,r11,@L7593
	ld	 r13,r11,16
	bcnd.n	 eq0,r13,@L7592
	or	 r4,r0,r25
@L7593:
	or.u	 r13,r0,hi16(_current_lang_name)
	or.u	 r12,r0,hi16(_lang_name_cplusplus)
	ld	 r13,r13,lo16(_current_lang_name)
	ld	 r12,r12,lo16(_lang_name_cplusplus)
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L7594
	or	 r24,r0,0
	bcnd.n	 eq0,r11,@L7595
	or	 r3,r0,0
	ld	 r3,r11,48
@L7595:
	bsr.n	 _lookup_nested_type
	or	 r2,r0,r25
	or	 r24,r0,r2
@L7594:
	bcnd.n	 ne0,r24,@L7598
	or	 r2,r0,32
	or	 r3,r0,r22
	bsr.n	 _build_decl
	or	 r4,r0,r25
	or	 r24,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,1
	bsr.n	 _build_overload_name
	or	 r4,r0,1
	bsr.n	 _get_identifier
	or.u	 r21,r0,hi16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r21,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	st	 r2,r24,60
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L7600
	st	 r0,r24,16
	ld	 r3,r22,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r22
	ld	 r13,r21,lo16(_current_binding_level)
	br.n	 @L7643
	st	 r2,r13,16
	align	 4
@L7600:
	or.u	 r21,r0,hi16(_class_binding_level)
	ld	 r13,r21,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L7601
	ld	 r3,r22,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r22
	ld	 r13,r21,lo16(_class_binding_level)
	st	 r2,r13,16
@L7601:
@L7643:
	br.n	 @L7603
	st	 r25,r22,4
	align	 4
@L7598:
	ld	 r24,r24,48
@L7603:
	ld	 r12,r22,16
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1	 ne,r13,@L7605
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb0	 ne,r13,@L7644
@L7605:
	ld	 r13,r25,48
	bcnd	 eq0,r13,@L7609
	ld.bu	 r13,r13,8
	cmp	 r13,r13,32
	bb1.n	 ne,r13,@L7645
	or.u	 r13,r0,hi16(_class_binding_level)
	or	 r2,r0,r22
	bsr.n	 _lookup_name
	or	 r3,r0,1
	ld	 r13,r25,48
	cmp	 r2,r2,r13
	bb0.n	 ne,r2,@L7609
	or.u	 r13,r0,hi16(_class_binding_level)
@L7645:
	ld	 r13,r13,lo16(_class_binding_level)
	bcnd.n	 ne0,r13,@L7637
	or	 r2,r0,r24
	bsr.n	 _pushdecl
	addu	 r1,r1,@L7653
@L7654:
	align	 4
@L7592:
	or	 r2,r0,32
	or	 r3,r0,r22
	bsr.n	 _build_lang_field_decl
	or.u	 r21,r0,hi16(_current_binding_level)
	ld	 r12,r21,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L7611
	or	 r24,r0,r2
	ld	 r3,r22,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r22
	ld	 r13,r21,lo16(_current_binding_level)
	br.n	 @L7612
	st	 r2,r13,16
	align	 4
@L7611:
	or.u	 r21,r0,hi16(_class_binding_level)
	ld	 r13,r21,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L7612
	ld	 r3,r22,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r22
	ld	 r13,r21,lo16(_class_binding_level)
	st	 r2,r13,16
@L7612:
	or	 r2,r0,r24
	st	 r25,r22,4
@L7637:
	bsr	 _pushdecl_class_level
@L7638:
	or	 r24,r0,r2
@L7609:
	ld	 r12,r22,16
@L7644:
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1.n	 ne,r13,@L7646
	or.u	 r20,r0,hi16(_current_class_type)
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb1	 ne,r13,@L7646
	ld	 r13,r24,28
	or.u	 r13,r13,0x2
	st	 r13,r24,28
	or.u	 r20,r0,hi16(_current_class_type)
@L7646:
	ld	 r11,r20,lo16(_current_class_type)
	bcnd.n	 ne0,r11,@L7617
	st	 r24,r25,48
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r13,r13,lo16(_current_function_decl)
	bcnd	 eq0,r13,@L7616
@L7617:
	or.u	 r13,r0,hi16(_current_lang_name)
	or.u	 r12,r0,hi16(_lang_name_cplusplus)
	ld	 r13,r13,lo16(_current_lang_name)
	ld	 r12,r12,lo16(_lang_name_cplusplus)
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L7615
	or.u	 r21,r0,hi16(_current_function_decl)
@L7616:
	br.n	 @L7590
	st	 r22,r24,40
	align	 4
@L7615:
	ld	 r13,r21,lo16(_current_function_decl)
	bcnd.n	 eq0,r13,@L7619
	or	 r2,r0,r24
	or	 r4,r0,r22
	ld	 r3,r13,60
	bsr.n	 _set_nested_typename
	or	 r5,r0,r25
	ld	 r13,r21,lo16(_current_function_decl)
	br.n	 @L7590
	st	 r13,r24,36
	align	 4
@L7619:
	ld	 r13,r11,16
	bcnd	 ne0,r13,@L7590
	ld	 r13,r11,48
	or	 r2,r0,r24
	or	 r4,r0,r22
	ld	 r3,r13,40
	bsr.n	 _set_nested_typename
	or	 r5,r0,r25
	ld	 r13,r20,lo16(_current_class_type)
	ld	 r12,r24,80
	st	 r13,r24,36
	st	 r13,r12,8
@L7590:
	ld	 r13,r23,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb1	 ne,r13,@L7588
	ld	 r13,r25,8
	or.u	 r12,r0,hi16(_current_class_type)
	ld	 r11,r25,48
	ld	 r12,r12,lo16(_current_class_type)
	or	 r13,r13,512
	st	 r13,r25,8
	st	 r11,r22,28
	ld	 r13,r12,16
	bcnd	 ne0,r13,@L7588
	ld	 r12,r12,80
	ld	 r13,r23,4
	st	 r13,r12,48
@L7588:
	ld	 r12,r25,48
	ld.bu	 r13,r12,8
	cmp	 r13,r13,32
	bb1.n	 ne,r13,@L7624
	or	 r2,r0,32
	br.n	 @L7577
	st	 r12,r0,r25
	align	 4
@L7624:
	or	 r3,r0,0
	bsr.n	 _build_decl
	or	 r4,r0,r25
	bsr	 _pushdecl
	st	 r2,r0,r25
@L7577:
	ld	 r13,r25,12
	bcnd	 eq0,r13,@L7626
	or.u	 r2,r0,hi16(@LC412)
	ld	 r3,r22,16
	bsr.n	 _error
	or	 r2,r2,lo16(@LC412)
	st	 r0,r25,12
@L7626:
	or.u	 r13,r0,hi16(_integer_type_node)
	ld	 r13,r13,lo16(_integer_type_node)
	ld.bu	 r13,r13,25
	st.b	 r13,r25,25
	or	 r2,r0,r25
	bsr.n	 _fixup_unsigned_type
	st	 r0,r25,16
	or.u	 r13,r0,hi16(_integer_zero_node)
	bsr.n	 _copy_node
	ld	 r2,r13,lo16(_integer_zero_node)
	or.u	 r13,r0,hi16(_enum_next_value)
	st	 r2,r13,lo16(_enum_next_value)
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r2,r13,lo16(_current_function_decl)
	bsr.n	 _GNU_xref_decl
	or	 r3,r0,r25
@Lte68:
	ld	 r1,r31,64
	or	 r2,r0,r25
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80
	def	 @L7653,@L7638-@L7654
	def	 @L7651,@L7635-@L7652
	def	 @L7649,@L7629-@L7650
	def	 @L7647,@L7629-@L7648

	align	 8
	global	 _finish_enum
_finish_enum:
	subu	 r31,r31,64
	st.d	 r24,r31,40
	or	 r25,r0,r2
	st	 r1,r31,48
	or	 r24,r0,0
	st	 r23,r31,36
@Ltb69:
	or	 r23,r0,0
	bcnd.n	 eq0,r3,@L7676
	st	 r3,r25,12
	ld	 r13,r3,16
	ld	 r12,r13,12
	st	 r25,r13,4
	ld	 r3,r0,r3
	or	 r23,r0,r12
	bcnd.n	 eq0,r3,@L7676
	or	 r24,r0,r23
@L7680:
	ld	 r13,r3,16
	ld	 r12,r13,12
	cmp	 r13,r12,r24
	bb0	 gt,r13,@L7681
	or	 r24,r0,r12
	br	 @L7682
	align	 4
@L7681:
	cmp	 r13,r12,r23
	bb1	 ge,r13,@L7682
	or	 r23,r0,r12
@L7682:
	ld	 r13,r3,16
	st	 r25,r13,4
	ld	 r3,r0,r3
	bcnd	 ne0,r3,@L7680
@L7676:
	or.u	 r13,r0,hi16(_flag_short_enums)
	ld	 r13,r13,lo16(_flag_short_enums)
	bcnd	 eq0,r13,@L7685
	bcnd.n	 eq0,r24,@L7687
	or	 r12,r0,r24
@L7689:
	ld.bu	 r13,r25,25
	addu	 r13,r13,1
	ext	 r12,r12,0<1>
	bcnd.n	 ne0,r12,@L7689
	st.b	 r13,r25,25
@L7687:
	ld.bu	 r13,r25,25
	bcnd.n	 ne0,r13,@L7697
	or	 r2,r0,r25
	or	 r13,r0,1
	st.b	 r13,r25,25
@L7697:
	bsr.n	 _fixup_unsigned_type
	st	 r0,r25,16
@L7685:
	ld	 r13,r25,56
	bcnd.n	 ge0,r23,@L7692
	st	 r24,r13,12
	ld	 r13,r25,52
	st	 r23,r13,12
	ld	 r12,r25,52
	subu	 r13,r0,1
	st	 r13,r12,16
	ld	 r13,r25,8
	and.u	 r13,r13,0xfffd
	st	 r13,r25,8
@L7692:
	or.u	 r13,r0,hi16(_flag_cadillac)
	ld	 r13,r13,lo16(_flag_cadillac)
	bcnd.n	 eq0,r13,@L7698
	or.u	 r13,r0,hi16(_current_binding_level)
	bsr.n	 _cadillac_finish_enum
	or	 r2,r0,r25
	or.u	 r13,r0,hi16(_current_binding_level)
@L7698:
	ld	 r3,r13,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r3,r3,r13
	or	 r2,r0,r25
	bsr.n	 _rest_of_type_compilation
	extu	 r3,r3,1<eq>
@Lte69:
	ld	 r1,r31,48
	ld	 r23,r31,36
	or	 r2,r0,r25
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

data
	align	 8
@LC413:
	string	 "enumerator value for `%s' not integer constant\000"
text
	align	 8
	global	 _build_enumerator
_build_enumerator:
	subu	 r31,r31,64
	st.d	 r24,r31,40
	or	 r25,r0,r2
	or	 r24,r0,r3
	st	 r23,r31,36
	or	 r23,r0,1
	bcnd.n	 eq0,r24,@L7741
	st	 r1,r31,48
@Ltb70:
	ld	 r13,r24,8
	bb0.n	 (31-13),r13,@L7722
	or.u	 r13,r0,hi16(_tree_code_type)
	ld.bu	 r12,r24,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r13,r0,r13
	cmp	 r13,r13,100
	bb1.n	 ne,r13,@L7722
	or	 r2,r0,r24
	bsr.n	 _decl_constant_value
	or	 r23,r0,0
	or	 r24,r0,r2
@L7722:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,25
	bb0.n	 ne,r13,@L7721
	or.u	 r2,r0,hi16(@LC413)
	ld	 r3,r25,16
	or	 r2,r2,lo16(@LC413)
	bsr.n	 _error
	or	 r24,r0,0
@L7721:
	bcnd	 ne0,r24,@L7743
@L7741:
	or.u	 r13,r0,hi16(_enum_next_value)
	ld	 r24,r13,lo16(_enum_next_value)
	bcnd.n	 eq0,r24,@L7745
	or.u	 r13,r0,hi16(_integer_zero_node)
	br	 @L7743
	align	 4
@L7730:
	ld	 r11,r24,16
	ld	 r13,r24,4
	ld	 r12,r11,4
	cmp	 r13,r13,r12
	bb0	 eq,r13,@L7725
	or	 r24,r0,r11
@L7743:
	ld.bu	 r12,r24,8
	subu	 r13,r12,101
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L7730
	mask	 r13,r12,0xff
	cmp	 r13,r13,103
	bb1	 eq,r13,@L7730
@L7725:
	or.u	 r13,r0,hi16(_integer_zero_node)
@L7745:
	ld	 r13,r13,lo16(_integer_zero_node)
	cmp	 r13,r24,r13
	bb1.n	 ne,r13,@L7732
	or.u	 r13,r0,hi16(_integer_one_node)
	br.n	 @L7744
	or	 r2,r0,0
	align	 4
@L7732:
	ld	 r13,r13,lo16(_integer_one_node)
	cmp	 r13,r24,r13
	bb1.n	 ne,r13,@L7734
	or	 r2,r0,1
@L7744:
	bsr.n	 _build_int_2_wide
	or	 r3,r0,0
	br.n	 @L7733
	or	 r24,r0,r2
	align	 4
@L7734:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,25
	bb1.n	 ne,r13,@L7746
	or	 r2,r0,r25
	bcnd	 eq0,r23,@L7737
	ld	 r13,r24,4
	ld.bu	 r13,r13,8
	cmp	 r13,r13,10
	bb1.n	 ne,r13,@L7747
	or	 r3,r0,r24
@L7737:
	bsr.n	 _copy_node
	or	 r2,r0,r24
	or.u	 r13,r0,hi16(_integer_type_node)
	ld	 r13,r13,lo16(_integer_type_node)
	or	 r24,r0,r2
	st	 r13,r24,4
@L7733:
	or	 r2,r0,r25
@L7746:
	or	 r3,r0,r24
@L7747:
	bsr.n	 _saveable_tree_cons
	or	 r4,r0,0
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r13,r13,lo16(_current_class_type)
	bcnd.n	 eq0,r13,@L7739
	or	 r23,r0,r2
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r13,r13,lo16(_current_function_decl)
	bcnd.n	 eq0,r13,@L7748
	or	 r2,r0,53
@L7739:
	or.u	 r13,r0,hi16(_integer_type_node)
	or	 r2,r0,31
	ld	 r4,r13,lo16(_integer_type_node)
	bsr.n	 _build_decl
	or	 r3,r0,r25
	or	 r25,r0,r2
	bsr.n	 _pushdecl
	st	 r24,r25,48
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r2,r13,lo16(_current_function_decl)
	bsr.n	 _GNU_xref_decl
	or	 r3,r0,r25
	or	 r2,r0,53
@L7748:
	or.u	 r25,r0,hi16(_integer_one_node)
	or	 r3,r0,r24
	ld	 r4,r25,lo16(_integer_one_node)
	bsr.n	 _build_binary_op_nodefault
	or	 r5,r0,53
	ld	 r13,r25,lo16(_integer_one_node)
	or.u	 r25,r0,hi16(_enum_next_value)
	cmp	 r13,r2,r13
	bb1.n	 ne,r13,@L7740
	st	 r2,r25,lo16(_enum_next_value)
	bsr	 _copy_node
	st	 r2,r25,lo16(_enum_next_value)
@L7740:
@Lte70:
	ld	 r1,r31,48
	or	 r2,r0,r23
	ld	 r23,r31,36
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
	global	 _grok_enum_decls
_grok_enum_decls:
	subu	 r31,r31,80
	or.u	 r13,r0,hi16(_class_binding_level)
	st.d	 r24,r31,56
	ld	 r25,r13,lo16(_class_binding_level)
	st	 r1,r31,64
	st.d	 r20,r31,40
	or	 r21,r0,r2
	st	 r19,r31,36
	or	 r24,r0,r3
	bcnd.n	 eq0,r25,@L7778
	st.d	 r22,r31,48
@Ltb71:
@L7771:
	ld	 r3,r25,4
	bsr.n	 _value_member
	or	 r2,r0,r21
	bcnd	 ne0,r2,@L7770
	ld	 r25,r25,28
	bcnd	 ne0,r25,@L7771
@L7770:
	bcnd.n	 eq0,r25,@L7778
	or.u	 r11,r0,hi16(_class_binding_level)
	ld	 r13,r11,lo16(_class_binding_level)
	cmp	 r13,r25,r13
	bb0	 eq,r13,@L7778
	ld	 r13,r2,8
	bb1.n	 (31-11),r13,@L7778
	or.u	 r12,r0,0x10
	or	 r13,r13,r12
	st	 r13,r2,8
	ld	 r23,r21,12
	bcnd.n	 eq0,r23,@L7778
	or.u	 r22,r0,hi16(_decl_obstack+12)
	or	 r19,r0,r11
	or	 r20,r22,lo16(_decl_obstack+12)
	or	 r2,r0,31
@L7789:
	ld	 r3,r23,12
	bsr.n	 _build_lang_field_decl
	or	 r4,r0,r21
	ld	 r13,r2,8
	or.u	 r13,r13,0x4
	st	 r13,r2,8
	ld	 r13,r23,16
	st	 r24,r0,r2
	or	 r24,r0,r2
	st	 r13,r24,48
	ld	 r25,r24,32
	bcnd	 eq0,r25,@L7780
	ld	 r3,r25,28
	bcnd	 eq0,r3,@L7782
	ld	 r13,r19,lo16(_class_binding_level)
	ld	 r4,r13,12
	bsr.n	 _tree_cons
	or	 r2,r0,r25
	ld	 r13,r19,lo16(_class_binding_level)
	st	 r2,r13,12
@L7782:
	st	 r24,r25,28
	ld	 r13,r22,lo16(_decl_obstack+12)
	ld	 r12,r20,4
	addu	 r13,r13,4
	cmp	 r13,r13,r12
	bb1.n	 ls,r13,@L7784
	subu	 r2,r20,12
	bsr.n	 __obstack_newchunk
	or	 r3,r0,4
@L7784:
	ld	 r12,r22,lo16(_decl_obstack+12)
	addu	 r13,r12,4
	st	 r13,r22,lo16(_decl_obstack+12)
	st	 r24,r0,r12
	ld.bu	 r13,r24,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L7780
	ld	 r13,r24,40
	bcnd	 ne0,r13,@L7780
	ld	 r5,r24,4
	or.u	 r13,r0,hi16(_current_class_name)
	or	 r2,r0,r24
	ld	 r3,r13,lo16(_current_class_name)
	bsr.n	 _set_nested_typename
	or	 r4,r0,r25
@L7780:
	ld	 r23,r0,r23
	bcnd.n	 ne0,r23,@L7789
	or	 r2,r0,31
@L7778:
	or	 r2,r0,r24
@Lte71:
	ld	 r1,r31,64
	ld	 r19,r31,36
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80

data
	align	 8
@LC414:
	string	 "extern\000"
	align	 8
@LC415:
	string	 "semicolon missing after declaration of `%s'\000"
	align	 8
@LC416:
	string	 "main\000"
	align	 8
@LC417:
	string	 "return type for `main' changed to integer type\000"
	align	 8
@LC418:
	string	 "`%s' implicitly declared before its definition\000"
	align	 8
@LC419:
	string	 "return-type `%s' is an incomplete type\000"
	align	 8
@LC420:
	string	 "return-type is an incomplete type\000"
	align	 8
@LC421:
	string	 "return-type defaults to `int'\000"
text
	align	 8
	global	 _start_function
_start_function:
	or.u	 r13,r0,hi16(_flag_handle_exceptions)
	ld	 r13,r13,lo16(_flag_handle_exceptions)
	subu	 r31,r31,192
	st	 r1,r31,80
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	st.d	 r18,r31,48
	st.d	 r16,r31,40
	st.d	 r14,r31,32
@Ltb72:
	or	 r24,r0,r2
	st	 r5,r31,140
	or	 r23,r0,r3
	st	 r0,r31,148
	or	 r22,r0,r4
	bcnd.n	 eq0,r13,@L7791
	st	 r0,r31,164
	or.u	 r13,r0,hi16(_EHS_decl)
	ld	 r13,r13,lo16(_EHS_decl)
	bcnd.n	 ne0,r13,@L8195
	or.u	 r25,r0,hi16(_void_list_node)
	bsr	 _init_exception_processing_1
@L7791:
	or.u	 r25,r0,hi16(_void_list_node)
@L8195:
	ld	 r13,r25,lo16(_void_list_node)
	or.u	 r12,r0,hi16(_void_type_node)
	ld	 r2,r13,16
	ld	 r13,r12,lo16(_void_type_node)
	cmp	 r2,r2,r13
	or	 r3,r0,160
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	ld	 r13,r25,lo16(_void_list_node)
	ld	 r2,r0,r13
	cmp	 r2,r2,0
	or	 r3,r0,161
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	or.u	 r13,r0,hi16(_current_function_returns_value)
	st	 r0,r13,lo16(_current_function_returns_value)
	or.u	 r13,r0,hi16(_current_function_returns_null)
	st	 r0,r13,lo16(_current_function_returns_null)
	or.u	 r13,r0,hi16(_warn_about_return_type)
	st	 r0,r13,lo16(_warn_about_return_type)
	or.u	 r13,r0,hi16(_current_extern_inline)
	st	 r0,r13,lo16(_current_extern_inline)
	or.u	 r13,r0,hi16(_current_function_assigns_this)
	st	 r0,r13,lo16(_current_function_assigns_this)
	or.u	 r13,r0,hi16(_current_function_just_assigned_this)
	st	 r0,r13,lo16(_current_function_just_assigned_this)
	or.u	 r13,r0,hi16(_current_function_parms_stored)
	st	 r0,r13,lo16(_current_function_parms_stored)
	or.u	 r13,r0,hi16(_original_result_rtx)
	st	 r0,r13,lo16(_original_result_rtx)
	or.u	 r13,r0,hi16(_current_function_obstack_index)
	st	 r0,r13,lo16(_current_function_obstack_index)
	or.u	 r13,r0,hi16(_current_function_obstack_usage)
	bsr.n	 _clear_temp_name
	st	 r0,r13,lo16(_current_function_obstack_usage)
	or.u	 r13,r0,hi16(_have_extern_spec)
	ld	 r13,r13,lo16(_have_extern_spec)
	bcnd.n	 eq0,r13,@L7792
	or.u	 r25,r0,hi16(_used_extern_spec)
	ld	 r13,r25,lo16(_used_extern_spec)
	bcnd.n	 ne0,r13,@L7792
	or.u	 r2,r0,hi16(@LC414)
	bsr.n	 _get_identifier
	or	 r2,r2,lo16(@LC414)
	or	 r3,r0,r2
	or	 r2,r0,0
	bsr.n	 _decl_tree_cons
	or	 r4,r0,r24
	or	 r13,r0,1
	st	 r13,r25,lo16(_used_extern_spec)
	or	 r24,r0,r2
@L7792:
	ld	 r9,r31,140
	bcnd.n	 eq0,r9,@L7793
	or	 r19,r0,r23
	ld	 r16,r19,4
	ld	 r12,r19,40
	or.u	 r13,r0,hi16(_last_function_parms)
	st	 r12,r13,lo16(_last_function_parms)
	or.u	 r13,r0,hi16(_last_function_parm_tags)
	st	 r0,r13,lo16(_last_function_parm_tags)
	ld.bu	 r13,r16,8
	cmp	 r13,r13,16
	bb1	 ne,r13,@L7794
	ld	 r9,r16,56
	st	 r9,r31,148
@L7794:
	ld	 r9,r31,148
	bcnd	 ne0,r9,@L7795
	ld	 r13,r19,80
	ld	 r13,r0,r13
	bb0	 (31-12),r13,@L7795
	ld	 r13,r0,r19
	ld	 r13,r13,4
	st	 r13,r31,148
	ld.bu	 r13,r13,8
	cmp	 r13,r13,21
	bb0	 ne,r13,@L7796
	st	 r0,r31,148
	br	 @L7795
	align	 4
@L7796:
	or	 r9,r0,1
	st	 r9,r31,164
@L7795:
	ld	 r13,r19,76
	bcnd.n	 eq0,r13,@L7799
	or.u	 r13,r0,hi16(_write_virtuals)
	ld	 r13,r13,lo16(_write_virtuals)
	cmp	 r13,r13,1
	bb0	 gt,r13,@L7799
	ld	 r9,r31,148
	ld	 r13,r9,80
	ld	 r13,r0,r13
	bb1.n	 (31-16),r13,@L8196
	or.u	 r13,r0,hi16(_last_function_parms)
@L7799:
	ld	 r13,r19,8
	or	 r12,r0,0
	bb0.n	 (31-19),r13,@L7800
	or.u	 r11,r0,hi16(_current_extern_inline)
	ld	 r13,r19,28
	extu	 r13,r13,1<20>
	subu	 r13,r0,r13
	subu	 r12,r0,r13
@L7800:
	st	 r12,r11,lo16(_current_extern_inline)
	or.u	 r13,r0,hi16(_last_function_parms)
@L8196:
	ld	 r25,r13,lo16(_last_function_parms)
	bcnd.n	 eq0,r25,@L7809
	or.u	 r23,r0,hi16(@LC388)
	or.u	 r24,r0,hi16(@LC389)
@L7804:
	ld	 r13,r25,4
	ld	 r13,r13,16
	bcnd	 ne0,r13,@L7805
	ld	 r13,r25,32
	bcnd	 eq0,r13,@L7806
	ld	 r3,r13,16
	or	 r2,r23,lo16(@LC388)
	bsr.n	 _error
	addu	 r1,r1,@L8222
@L8223:
	align	 4
@L7806:
	bsr.n	 _error
	or	 r2,r24,lo16(@LC389)
@L7807:
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	st	 r13,r25,4
@L7805:
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L7804
	or.u	 r13,r0,hi16(_warn_implicit)
	br	 @L8197
	align	 4
@L7793:
	or	 r2,r0,r23
	or	 r3,r0,r24
	or	 r4,r0,1
	or	 r5,r0,1
	bsr.n	 _grokdeclarator
	or	 r6,r0,r22
	or	 r19,r0,r2
	bcnd	 eq0,r19,@L7811
	ld.bu	 r13,r19,8
	cmp	 r13,r13,29
	bb0	 ne,r13,@L7810
@L7811:
	br.n	 @L8154
	or	 r2,r0,0
	align	 4
@L7810:
	ld	 r16,r19,4
	ld	 r9,r16,4
	st	 r9,r31,156
	ld	 r13,r9,24
	bb0	 (31-22),r13,@L7812
	ld	 r13,r9,80
	ld	 r13,r13,4
	bb1	 (31-13),r13,@L7812
	or.u	 r3,r0,hi16(@LC415)
	ld	 r2,r31,156
	st	 r0,r31,180
	or	 r3,r3,lo16(@LC415)
	bsr.n	 _error_with_aggr_type
	st	 r0,r31,188
	ld	 r3,r31,156
	bsr.n	 _build_tree_list
	or	 r2,r0,0
	st	 r2,r31,172
	ld	 r21,r31,172
	or	 r18,r0,0
	bcnd.n	 eq0,r21,@L7815
	or	 r23,r0,0
	or.u	 r14,r0,hi16(_current_binding_level)
	or.u	 r17,r0,hi16(_class_binding_level)
	or.u	 r15,r0,hi16(@LC116)
@L7817:
	ld	 r10,r21,16
	ld.bu	 r20,r10,8
	subu	 r13,r20,21
	cmp	 r12,r20,10
	cmp	 r13,r13,1
	rot	 r11,r13,6
	or.c	 r13,r12,r11
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L7816
	ld	 r24,r10,48
	bcnd	 ne0,r24,@L8155
	ld	 r12,r14,lo16(_current_binding_level)
	bcnd	 eq0,r12,@L7822
@L7824:
	ld	 r2,r12,4
	bcnd	 eq0,r2,@L7823
@L7828:
	ld	 r13,r2,16
	cmp	 r13,r13,r10
	bb0	 ne,r13,@L8156
	ld	 r2,r0,r2
	bcnd	 ne0,r2,@L7828
@L7823:
	ld	 r12,r12,28
	bcnd	 ne0,r12,@L7824
@L7822:
	or	 r24,r0,0
@L7819:
	bcnd	 eq0,r24,@L7833
@L8155:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L7833
	ld	 r24,r24,32
@L7833:
	ld	 r13,r17,lo16(_class_binding_level)
	bcnd.n	 eq0,r13,@L7834
	or	 r22,r0,r13
@L7839:
	ld	 r12,r24,16
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1	 ne,r13,@L7840
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb1	 ne,r13,@L7840
	ld	 r25,r22,4
	bcnd	 eq0,r25,@L7847
@L7844:
	ld	 r2,r25,16
	ld	 r13,r2,48
	ld	 r13,r13,32
	cmp	 r13,r13,r24
	bb0	 ne,r13,@L8160
	ld	 r25,r0,r25
	bcnd	 eq0,r25,@L7847
	br	 @L7844
	align	 4
@L7840:
	ld	 r25,r22,4
	bcnd	 eq0,r25,@L7847
@L7851:
	ld	 r13,r25,12
	cmp	 r13,r13,r24
	bb1	 ne,r13,@L7850
	ld	 r13,r25,16
	ld.bu	 r12,r13,8
	cmp	 r13,r12,r20
	bb0.n	 ne,r13,@L7923
	cmp	 r13,r20,10
	bb0.n	 ne,r13,@L7854
	cmp	 r13,r12,129
	cmp	 r12,r12,132
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd	 eq0,r13,@L7923
@L7854:
	or.u	 r2,r0,hi16(@LC115)
	ld	 r3,r24,16
	br.n	 @L8193
	or	 r2,r2,lo16(@LC115)
	align	 4
@L7850:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L7851
@L7847:
	ld	 r13,r22,32
	bb0.n	 (31-23),r13,@L7886
	or.u	 r9,r0,hi16(_current_class_type)
	ld	 r11,r9,lo16(_current_class_type)
	bcnd.n	 eq0,r11,@L7838
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r22,28
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r12,r12,r13
	bb1	 ne,r12,@L7838
	or	 r23,r0,r11
	or.u	 r13,r0,hi16(_tree_code_type)
@L8198:
	ld.bu	 r12,r23,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r12,r0,r13
	cmp	 r13,r12,100
	bb1.n	 eq,r13,@L7838
	cmp	 r13,r12,116
	bb1	 ne,r13,@L7879
	ld	 r11,r24,16
	ld.b	 r13,r0,r11
	ld	 r12,r23,80
	cmp	 r13,r13,36
	ld	 r12,r12,48
	bb1	 ne,r13,@L7863
	ld.b	 r13,r11,1
	cmp	 r13,r13,95
	bb1	 ne,r13,@L7863
	bcnd	 eq0,r12,@L7838
@L7866:
	ld	 r13,r12,16
	ld	 r13,r13,48
	ld	 r13,r13,32
	cmp	 r13,r13,r24
	bb0	 ne,r13,@L7923
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L7866
	br	 @L7838
	align	 4
@L7863:
	bcnd	 eq0,r12,@L7838
@L7872:
	ld	 r13,r12,12
	cmp	 r13,r13,r24
	bb0	 ne,r13,@L8194
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L7872
	br	 @L7838
	align	 4
@L7879:
	bsr.n	 _my_friendly_abort
	or	 r2,r0,10
	bcnd.n	 ne0,r23,@L8198
	or.u	 r13,r0,hi16(_tree_code_type)
@L7838:
	ld	 r22,r22,28
	bcnd	 ne0,r22,@L7839
	or	 r23,r0,0
	br	 @L7883
	align	 4
@L8156:
	ld	 r24,r2,12
	br	 @L7819
	align	 4
@L8160:
	br.n	 @L7883
	or	 r23,r0,r2
	align	 4
@L7834:
	ld	 r22,r14,lo16(_current_binding_level)
	bcnd.n	 eq0,r22,@L7883
	or	 r23,r0,0
@L7888:
	ld	 r12,r24,16
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1	 ne,r13,@L7889
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb1	 ne,r13,@L7889
	ld	 r25,r22,4
	bcnd	 eq0,r25,@L7896
@L7893:
	ld	 r2,r25,16
	ld	 r13,r2,48
	ld	 r13,r13,32
	cmp	 r13,r13,r24
	bb1	 eq,r13,@L8160
	ld	 r25,r0,r25
	bcnd	 eq0,r25,@L7896
	br	 @L7893
	align	 4
@L7889:
	ld	 r25,r22,4
	bcnd	 eq0,r25,@L7896
@L7900:
	ld	 r13,r25,12
	cmp	 r13,r13,r24
	bb1	 ne,r13,@L7899
	ld	 r13,r25,16
	ld.bu	 r12,r13,8
	cmp	 r13,r12,r20
	bb0.n	 ne,r13,@L7923
	cmp	 r13,r20,10
	bb0.n	 ne,r13,@L7903
	cmp	 r13,r12,129
	cmp	 r12,r12,132
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd	 eq0,r13,@L7923
@L7903:
	or.u	 r2,r0,hi16(@LC115)
	ld	 r3,r24,16
	br.n	 @L8193
	or	 r2,r2,lo16(@LC115)
	align	 4
@L7899:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L7900
@L7896:
	ld	 r13,r22,32
	bb0.n	 (31-23),r13,@L7886
	or.u	 r9,r0,hi16(_current_class_type)
	ld	 r11,r9,lo16(_current_class_type)
	bcnd.n	 eq0,r11,@L7887
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r22,28
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r12,r12,r13
	bb1	 ne,r12,@L7887
	or	 r23,r0,r11
	or.u	 r13,r0,hi16(_tree_code_type)
@L8199:
	ld.bu	 r12,r23,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r12,r0,r13
	cmp	 r13,r12,100
	bb1.n	 eq,r13,@L7887
	cmp	 r13,r12,116
	bb1	 ne,r13,@L7928
	ld	 r11,r24,16
	ld.b	 r13,r0,r11
	ld	 r12,r23,80
	cmp	 r13,r13,36
	ld	 r12,r12,48
	bb1	 ne,r13,@L7912
	ld.b	 r13,r11,1
	cmp	 r13,r13,95
	bb1	 ne,r13,@L7912
	bcnd	 eq0,r12,@L7887
@L7915:
	ld	 r13,r12,16
	ld	 r13,r13,48
	ld	 r13,r13,32
	cmp	 r13,r13,r24
	bb0	 ne,r13,@L7923
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L7915
	br	 @L7887
	align	 4
@L7912:
	bcnd	 eq0,r12,@L7887
@L7921:
	ld	 r13,r12,12
	cmp	 r13,r13,r24
	bb1	 ne,r13,@L7922
@L8194:
	ld	 r13,r12,16
	ld.bu	 r13,r13,8
	cmp	 r13,r13,r20
	bb0	 ne,r13,@L7923
	ld	 r3,r24,16
	or	 r2,r15,lo16(@LC116)
@L8193:
	bsr	 _error
@L7923:
	ld	 r23,r25,16
	br	 @L7883
	align	 4
@L7922:
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L7921
	br	 @L7887
	align	 4
@L7928:
	bsr.n	 _my_friendly_abort
	or	 r2,r0,10
	bcnd.n	 ne0,r23,@L8199
	or.u	 r13,r0,hi16(_tree_code_type)
@L7887:
	ld	 r22,r22,28
	bcnd	 ne0,r22,@L7888
@L7886:
	or	 r23,r0,0
@L7883:
	bcnd.n	 ne0,r23,@L7932
	cmp	 r13,r24,0
	or.u	 r2,r0,hi16(_permanent_obstack)
	or	 r2,r2,lo16(_permanent_obstack)
	bsr.n	 _push_obstacks
	or	 r3,r0,r2
	subu	 r13,r20,21
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L7933
	or	 r2,r0,r20
	bsr.n	 _make_lang_type
	addu	 r1,r1,@L8224
@L8225:
	align	 4
@L7933:
	bsr.n	 _make_node
	or	 r2,r0,r20
@L8180:
	ld	 r13,r17,lo16(_class_binding_level)
	bcnd.n	 eq0,r13,@L7936
	or	 r23,r0,r2
	br.n	 @L7937
	or	 r21,r0,r13
	align	 4
@L7936:
	ld	 r21,r14,lo16(_current_binding_level)
	ld	 r13,r21,32
	bb0.n	 (31-23),r13,@L8200
	or.u	 r13,r0,hi16(_global_binding_level)
@L7940:
	ld	 r21,r21,28
	ld	 r13,r21,32
	bb1	 (31-23),r13,@L7940
@L7937:
	or.u	 r13,r0,hi16(_global_binding_level)
@L8200:
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r21,r13
	bb1.n	 ne,r13,@L7942
	or	 r2,r0,r24
	ld	 r4,r21,4
	or	 r3,r0,r23
	bsr.n	 _perm_tree_cons
	addu	 r1,r1,@L8226
@L8227:
	align	 4
@L7942:
	ld	 r4,r21,4
	bsr.n	 _saveable_tree_cons
	or	 r3,r0,r23
@L8181:
	bcnd.n	 eq0,r24,@L7944
	st	 r2,r21,4
	ld	 r13,r23,48
	bcnd	 ne0,r13,@L7945
	st	 r24,r23,48
@L7945:
	ld	 r13,r24,4
	cmp	 r13,r13,r23
	bb0	 ne,r13,@L7946
	ld.bu	 r13,r23,8
	cmp	 r13,r13,21
	bb1.n	 ne,r13,@L8201
	or.u	 r9,r0,hi16(_current_class_type)
	ld	 r13,r17,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L8201
	ld	 r13,r23,80
	ld	 r13,r0,r13
	bb1	 (31-28),r13,@L7946
@L8201:
	ld	 r11,r9,lo16(_current_class_type)
	bcnd	 eq0,r11,@L7949
	ld	 r13,r11,16
	bcnd	 eq0,r13,@L7948
@L7949:
	or.u	 r13,r0,hi16(_current_lang_name)
	ld	 r12,r13,lo16(_current_lang_name)
	or.u	 r13,r0,hi16(_lang_name_cplusplus)
	ld	 r13,r13,lo16(_lang_name_cplusplus)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L7950
	or	 r25,r0,0
	bcnd.n	 eq0,r11,@L7951
	or	 r3,r0,0
	ld	 r3,r11,48
@L7951:
	bsr.n	 _lookup_nested_type
	or	 r2,r0,r23
	or	 r25,r0,r2
@L7950:
	bcnd.n	 ne0,r25,@L7954
	or	 r2,r0,32
	or	 r3,r0,r24
	bsr.n	 _build_decl
	or	 r4,r0,r23
	or	 r25,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,1
	bsr.n	 _build_overload_name
	or	 r4,r0,1
	bsr	 _get_identifier
	ld	 r12,r14,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	st	 r2,r25,60
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L7956
	st	 r0,r25,16
	ld	 r3,r24,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r14,lo16(_current_binding_level)
	br.n	 @L8202
	st	 r2,r13,16
	align	 4
@L7956:
	ld	 r13,r17,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L7957
	ld	 r3,r24,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r17,lo16(_class_binding_level)
	st	 r2,r13,16
@L7957:
@L8202:
	br.n	 @L7959
	st	 r23,r24,4
	align	 4
@L7954:
	ld	 r25,r25,48
@L7959:
	ld	 r12,r24,16
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1	 ne,r13,@L7961
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb0	 ne,r13,@L8203
@L7961:
	ld	 r13,r23,48
	bcnd	 eq0,r13,@L7965
	ld.bu	 r13,r13,8
	cmp	 r13,r13,32
	bb1.n	 ne,r13,@L7962
	or	 r2,r0,r24
	bsr.n	 _lookup_name
	or	 r3,r0,1
	ld	 r13,r23,48
	cmp	 r2,r2,r13
	bb0	 ne,r2,@L7965
@L7962:
	ld	 r13,r17,lo16(_class_binding_level)
	bcnd.n	 ne0,r13,@L8183
	or	 r2,r0,r25
	bsr.n	 _pushdecl
	addu	 r1,r1,@L8228
@L8229:
	align	 4
@L7948:
	or	 r2,r0,32
	or	 r3,r0,r24
	bsr.n	 _build_lang_field_decl
	or	 r4,r0,r23
	ld	 r12,r14,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L7967
	or	 r25,r0,r2
	ld	 r3,r24,4
	ld	 r4,r12,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r14,lo16(_current_binding_level)
	br.n	 @L7968
	st	 r2,r13,16
	align	 4
@L7967:
	ld	 r13,r17,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L7968
	ld	 r3,r24,4
	ld	 r4,r13,16
	bsr.n	 _tree_cons
	or	 r2,r0,r24
	ld	 r13,r17,lo16(_class_binding_level)
	st	 r2,r13,16
@L7968:
	or	 r2,r0,r25
	st	 r23,r24,4
@L8183:
	bsr	 _pushdecl_class_level
@L8184:
	or	 r25,r0,r2
@L7965:
	ld	 r12,r24,16
@L8203:
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1.n	 ne,r13,@L8204
	or.u	 r9,r0,hi16(_current_class_type)
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb1	 ne,r13,@L8204
	ld	 r13,r25,28
	or.u	 r13,r13,0x2
	st	 r13,r25,28
	or.u	 r9,r0,hi16(_current_class_type)
@L8204:
	ld	 r11,r9,lo16(_current_class_type)
	bcnd.n	 ne0,r11,@L7973
	st	 r25,r23,48
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r13,r13,lo16(_current_function_decl)
	bcnd	 eq0,r13,@L7972
@L7973:
	or.u	 r13,r0,hi16(_current_lang_name)
	ld	 r12,r13,lo16(_current_lang_name)
	or.u	 r13,r0,hi16(_lang_name_cplusplus)
	ld	 r13,r13,lo16(_lang_name_cplusplus)
	cmp	 r12,r12,r13
	bb0.n	 ne,r12,@L7971
	or.u	 r22,r0,hi16(_current_function_decl)
@L7972:
	br.n	 @L7946
	st	 r24,r25,40
	align	 4
@L7971:
	ld	 r13,r22,lo16(_current_function_decl)
	bcnd.n	 eq0,r13,@L7975
	or	 r2,r0,r25
	or	 r4,r0,r24
	ld	 r3,r13,60
	bsr.n	 _set_nested_typename
	or	 r5,r0,r23
	ld	 r13,r22,lo16(_current_function_decl)
	br.n	 @L7946
	st	 r13,r25,36
	align	 4
@L7975:
	ld	 r13,r11,16
	bcnd	 ne0,r13,@L7946
	ld	 r13,r11,48
	or	 r2,r0,r25
	or	 r4,r0,r24
	ld	 r3,r13,40
	bsr.n	 _set_nested_typename
	or	 r5,r0,r23
	or.u	 r9,r0,hi16(_current_class_type)
	ld	 r12,r25,80
	ld	 r13,r9,lo16(_current_class_type)
	st	 r13,r25,36
	st	 r13,r12,8
@L7946:
	ld	 r13,r21,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb1	 ne,r13,@L7944
	ld	 r13,r23,8
	or.u	 r9,r0,hi16(_current_class_type)
	ld	 r12,r23,48
	ld	 r11,r9,lo16(_current_class_type)
	or	 r13,r13,512
	st	 r13,r23,8
	st	 r12,r24,28
	ld	 r13,r11,16
	bcnd	 ne0,r13,@L7944
	ld	 r12,r11,80
	ld	 r13,r21,4
	st	 r13,r12,48
@L7944:
	ld	 r12,r23,48
	ld.bu	 r13,r12,8
	cmp	 r13,r13,32
	bb1.n	 ne,r13,@L7980
	or	 r2,r0,32
	br.n	 @L7935
	st	 r12,r0,r23
	align	 4
@L7980:
	or	 r3,r0,0
	bsr.n	 _build_decl
	or	 r4,r0,r23
	bsr	 _pushdecl
	st	 r2,r0,r23
@L7935:
	bsr.n	 _pop_obstacks
	or	 r18,r0,r20
	br.n	 @L8205
	cmp	 r12,r18,22
	align	 4
@L7932:
	cmp	 r12,r20,10
	or.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L7982
	or	 r18,r0,r20
@L7982:
	bcnd	 eq0,r18,@L7984
	ld	 r9,r31,180
	addu	 r9,r9,1
	br.n	 @L7816
	st	 r9,r31,180
	align	 4
@L7984:
	ld	 r9,r31,188
	bcnd.n	 ne0,r9,@L8206
	or	 r9,r0,1
	or.u	 r2,r0,hi16(@LC204)
	bsr.n	 _warning
	or	 r2,r2,lo16(@LC204)
	or	 r9,r0,1
@L8206:
	st	 r9,r31,188
@L7816:
	ld	 r21,r0,r21
	bcnd	 ne0,r21,@L7817
@L7815:
	cmp	 r12,r18,22
@L8205:
	cmp	 r13,r23,0
	and.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L7988
	ld	 r12,r23,48
	ld.bu	 r13,r12,8
	cmp	 r13,r13,1
	bb1	 ne,r13,@L8207
	ld	 r12,r12,16
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1	 ne,r13,@L7990
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb0	 ne,r13,@L7989
@L7990:
	ld	 r12,r23,48
@L8207:
	ld.bu	 r13,r12,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L7988
	ld	 r13,r12,32
	ld	 r12,r13,16
	ld.b	 r13,r0,r12
	cmp	 r13,r13,36
	bb1	 ne,r13,@L7988
	ld.b	 r13,r12,1
	cmp	 r13,r13,95
	bb1	 ne,r13,@L7988
@L7989:
	ld	 r13,r23,12
	bcnd.n	 eq0,r13,@L7991
	or	 r2,r0,0
	ld	 r3,r31,172
	or	 r4,r0,0
	or	 r5,r0,0
	bsr.n	 _grokdeclarator
	or	 r6,r0,0
	bsr.n	 _finish_anon_union
	addu	 r1,r1,@L8230
@L8231:
	align	 4
@L7991:
	or.u	 r2,r0,hi16(@LC205)
	or	 r2,r2,lo16(@LC205)
	bsr.n	 _error
	addu	 r1,r1,@L8232
@L8233:
	align	 4
@L7988:
	ld	 r9,r31,180
	cmp	 r13,r18,21
	cmp	 r12,r9,1
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L8217
	ld	 r13,r23,80
	bcnd	 eq0,r13,@L8217
	ld	 r13,r0,r13
	bb0	 (31-28),r13,@L8217
	ld	 r13,r23,16
	bcnd.n	 eq0,r13,@L7995
	or.u	 r3,r0,hi16(@LC206)
	or	 r2,r0,r23
	or	 r3,r3,lo16(@LC206)
	bsr.n	 _error_with_aggr_type
	addu	 r1,r1,@L8234
@L8235:
	align	 4
@L7995:
	or.u	 r2,r0,hi16(_permanent_obstack)
	or	 r2,r2,lo16(_permanent_obstack)
	bsr.n	 _push_obstacks
	or	 r3,r0,r2
	or	 r2,r0,r23
	bsr.n	 _pushclass
	or	 r3,r0,0
	or	 r2,r0,r23
	bsr.n	 _finish_exception
	or	 r3,r0,0
	ld	 r3,r23,48
	ld.bu	 r13,r3,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L7997
	ld	 r3,r3,32
@L7997:
	or	 r2,r0,33
	bsr.n	 _build_lang_field_decl
	or	 r4,r0,r23
	or.u	 r13,r0,hi16(_current_class_name)
	or	 r3,r0,r2
	bsr.n	 _finish_exception_decl
	ld	 r2,r13,lo16(_current_class_name)
	bsr	 _end_exception_decls
	bsr.n	 _pop_obstacks
	addu	 r1,r1,@L8236
@L8237:
	align	 4
@L8217:
	ld	 r9,r31,188
	subu	 r13,r9,1
	extu	 r12,r12,1<gt>
	subu	 r13,r0,r13
	and	 r13,r13,r12
	bcnd	 eq0,r13,@L7813
	or.u	 r2,r0,hi16(@LC207)
	bsr.n	 _warning
	or	 r2,r2,lo16(@LC207)
@L7813:
	ld	 r9,r31,156
	ld	 r13,r9,80
	ld	 r12,r13,4
	or.u	 r12,r12,0x4
	st	 r12,r13,4
	ld.bu	 r13,r16,8
	cmp	 r13,r13,23
	bb1.n	 ne,r13,@L8000
	or.u	 r13,r0,hi16(_integer_type_node)
	ld	 r3,r16,12
	ld	 r2,r13,lo16(_integer_type_node)
	bsr.n	 _build_function_type
	addu	 r1,r1,@L8238
@L8239:
	align	 4
@L8000:
	ld	 r4,r19,8
	extu	 r3,r4,1<18>
	ld	 r2,r16,56
	bsr.n	 _build_type_variant
	extu	 r4,r4,1<23>
	or.u	 r13,r0,hi16(_integer_type_node)
	ld	 r4,r16,12
	bsr.n	 _build_cplus_method_type
	ld	 r3,r13,lo16(_integer_type_node)
@L8186:
	or	 r16,r0,r2
	st	 r16,r19,4
@L7812:
	ld.bu	 r13,r16,8
	cmp	 r13,r13,16
	bb1	 ne,r13,@L8002
	ld	 r9,r16,56
	br.n	 @L7809
	st	 r9,r31,148
	align	 4
@L8002:
	ld	 r12,r19,32
	ld	 r13,r12,12
	cmp	 r13,r13,4
	bb1.n	 ne,r13,@L8197
	or.u	 r13,r0,hi16(_warn_implicit)
	or.u	 r3,r0,hi16(@LC416)
	ld	 r2,r12,16
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC416)
	bcnd.n	 ne0,r2,@L8197
	or.u	 r13,r0,hi16(_warn_implicit)
	ld	 r13,r19,36
	bcnd.n	 ne0,r13,@L8197
	or.u	 r13,r0,hi16(_warn_implicit)
	or.u	 r12,r0,hi16(_integer_type_node)
	ld	 r13,r19,4
	ld	 r12,r12,lo16(_integer_type_node)
	ld	 r13,r13,4
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L8005
	or.u	 r2,r0,hi16(@LC417)
	bsr.n	 _warning
	or	 r2,r2,lo16(@LC417)
	or.u	 r13,r0,hi16(_default_function_type)
	ld	 r16,r13,lo16(_default_function_type)
	st	 r16,r19,4
@L8005:
	or.u	 r13,r0,hi16(_warn_about_return_type)
	st	 r0,r13,lo16(_warn_about_return_type)
@L7809:
	or.u	 r13,r0,hi16(_warn_implicit)
@L8197:
	ld	 r13,r13,lo16(_warn_implicit)
	bcnd.n	 ne0,r13,@L8208
	or.u	 r13,r0,hi16(_flag_cadillac)
	ld	 r13,r19,32
	ld	 r2,r13,36
	bcnd	 eq0,r2,@L8006
	ld	 r2,r2,4
	bcnd	 eq0,r2,@L8006
	or.u	 r3,r0,hi16(@LC418)
	bsr.n	 _warning_with_decl
	or	 r3,r3,lo16(@LC418)
@L8006:
	or.u	 r13,r0,hi16(_flag_cadillac)
@L8208:
	ld	 r12,r13,lo16(_flag_cadillac)
	or.u	 r13,r0,hi16(_current_function_decl)
	bcnd.n	 eq0,r12,@L8011
	st	 r19,r13,lo16(_current_function_decl)
	or	 r2,r0,r19
	bsr.n	 _cadillac_start_function
	addu	 r1,r1,@L8240
@L8241:
	align	 4
@L8011:
	bsr.n	 _announce_function
	or	 r2,r0,r19
@L8012:
	ld	 r2,r16,4
	ld	 r13,r2,16
	bcnd.n	 ne0,r13,@L8209
	or.u	 r13,r0,hi16(_warn_about_return_type)
	ld	 r13,r2,24
	bb0.n	 (31-22),r13,@L8014
	or.u	 r3,r0,hi16(@LC419)
	or	 r3,r3,lo16(@LC419)
	bsr.n	 _error_with_aggr_type
	addu	 r1,r1,@L8242
@L8243:
	align	 4
@L8014:
	or.u	 r2,r0,hi16(@LC420)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC420)
@L8015:
	ld	 r9,r31,148
	bcnd	 eq0,r9,@L8016
	ld	 r4,r19,8
	extu	 r3,r4,1<18>
	ld	 r2,r31,148
	bsr.n	 _build_type_variant
	extu	 r4,r4,1<23>
	ld	 r13,r19,4
	or.u	 r12,r0,hi16(_void_type_node)
	ld	 r13,r13,12
	ld	 r3,r12,lo16(_void_type_node)
	ld	 r4,r0,r13
	bsr.n	 _build_cplus_method_type
	addu	 r1,r1,@L8244
@L8245:
	align	 4
@L8016:
	or.u	 r13,r0,hi16(_void_type_node)
	ld	 r12,r19,4
	ld	 r2,r13,lo16(_void_type_node)
	bsr.n	 _build_function_type
	ld	 r3,r12,12
@L8187:
	st	 r2,r19,4
	or	 r2,r0,35
	ld	 r4,r16,4
	bsr.n	 _build_decl
	or	 r3,r0,0
	st	 r2,r19,44
	or.u	 r13,r0,hi16(_warn_about_return_type)
@L8209:
	ld	 r13,r13,lo16(_warn_about_return_type)
	bcnd	 eq0,r13,@L8018
	or.u	 r2,r0,hi16(@LC421)
	bsr.n	 _warning
	or	 r2,r2,lo16(@LC421)
@L8018:
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r10,r19,8
	ld	 r12,r13,lo16(_error_mark_node)
	or.u	 r13,r0,hi16(_interface_unknown)
	ld	 r11,r13,lo16(_interface_unknown)
	or	 r25,r0,0
	st	 r12,r19,48
	or	 r13,r10,8192
	bcnd.n	 ne0,r11,@L8019
	st	 r13,r19,8
	ld	 r12,r19,28
	or.u	 r13,r0,hi16(_interface_only)
	and.u	 r12,r12,0xff7f
	ld	 r11,r13,lo16(_interface_only)
	or	 r13,r10,12288
	mak	 r11,r11,1<23>
	st	 r13,r19,8
	br.n	 @L8188
	or	 r12,r12,r11
	align	 4
@L8019:
	or.u	 r13,r0,hi16(_current_extern_inline)
	ld	 r12,r19,28
	ld	 r13,r13,lo16(_current_extern_inline)
	and.u	 r12,r12,0xff7f
	mak	 r13,r13,1<23>
	or	 r12,r12,r13
@L8188:
	st	 r12,r19,28
	ld	 r9,r31,148
	bcnd.n	 ne0,r9,@L8021
	or.u	 r13,r0,hi16(_current_lang_name)
	or.u	 r12,r0,hi16(_lang_name_cplusplus)
	ld	 r13,r13,lo16(_current_lang_name)
	ld	 r12,r12,lo16(_lang_name_cplusplus)
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L8021
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r11,r13,lo16(_current_binding_level)
	ld	 r13,r12,lo16(_global_binding_level)
	cmp	 r13,r11,r13
	ld	 r12,r19,32
	bb1	 ne,r13,@L8023
	ld	 r25,r12,20
	br	 @L8022
	align	 4
@L8023:
	ld	 r13,r12,24
	bcnd.n	 eq0,r13,@L8022
	or	 r25,r0,0
	ld	 r3,r0,r11
	bcnd.n	 eq0,r3,@L8022
	or	 r25,r0,r3
@L8028:
	ld	 r13,r3,32
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L8026
	ld	 r3,r0,r3
	bcnd	 ne0,r3,@L8028
@L8026:
	or	 r25,r0,r3
@L8022:
	bcnd	 eq0,r25,@L8032
	ld.bu	 r13,r25,8
	cmp	 r13,r13,29
	ext	 r13,r13,1<eq>
	and	 r25,r25,r13
	bcnd	 eq0,r25,@L8032
	ld	 r13,r19,32
	ld	 r12,r25,32
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L8032
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r11,r13,lo16(_current_binding_level)
	ld	 r13,r12,lo16(_global_binding_level)
	cmp	 r13,r11,r13
	ld	 r12,r19,60
	bb1	 ne,r13,@L8034
	ld	 r25,r12,20
	br	 @L8033
	align	 4
@L8034:
	ld	 r13,r12,24
	bcnd.n	 eq0,r13,@L8033
	or	 r25,r0,0
	ld	 r3,r0,r11
	bcnd.n	 eq0,r3,@L8033
	or	 r25,r0,r3
@L8039:
	ld	 r13,r3,32
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L8037
	ld	 r3,r0,r3
	bcnd	 ne0,r3,@L8039
@L8037:
	or	 r25,r0,r3
@L8033:
	bcnd	 ne0,r25,@L8032
	or	 r25,r0,r19
@L8032:
	cmp	 r13,r25,0
	cmp	 r12,r25,r19
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd	 eq0,r13,@L8021
	ld	 r13,r19,32
	ld	 r12,r25,32
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L8021
	ld.bu	 r13,r25,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L8044
	st	 r19,r31,88
	st	 r25,r31,92
	ld.bu	 r13,r19,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L8047
	ld.bu	 r13,r25,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L8047
	ld	 r13,r19,4
	ld	 r12,r25,4
	ld	 r11,r13,12
	ld	 r10,r12,12
	st	 r13,r31,120
	st	 r12,r31,128
	st	 r11,r31,124
	st	 r10,r31,132
	ld.bu	 r13,r13,8
	cmp	 r13,r13,16
	bb1	 ne,r13,@L8048
	ld	 r13,r25,80
	ld	 r13,r0,r13
	bb0.n	 (31-13),r13,@L8048
	addu	 r2,r31,120
	addu	 r3,r31,88
	br.n	 @L8189
	addu	 r4,r31,124
	align	 4
@L8048:
	ld	 r13,r31,128
	ld.bu	 r13,r13,8
	cmp	 r13,r13,16
	bb1	 ne,r13,@L8049
	ld	 r13,r31,88
	ld	 r13,r13,80
	ld	 r13,r0,r13
	bb0.n	 (31-13),r13,@L8049
	addu	 r2,r31,128
	addu	 r3,r31,92
	addu	 r4,r31,132
@L8189:
	bsr	 _revert_static_member_fn
@L8049:
	ld	 r11,r31,120
	ld	 r10,r31,128
	ld.bu	 r12,r11,8
	ld.bu	 r13,r10,8
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L8051
	cmp	 r13,r12,14
	bb1.n	 ne,r13,@L8052
	or.u	 r3,r0,hi16(@LC49)
	ld	 r2,r31,88
	br.n	 @L8190
	or	 r3,r3,lo16(@LC49)
	align	 4
@L8052:
	or.u	 r3,r0,hi16(@LC50)
	ld	 r2,r31,88
	or	 r3,r3,lo16(@LC50)
@L8190:
	bsr	 _compiler_error_with_decl
	br.n	 @L8046
	or	 r2,r0,0
	align	 4
@L8051:
	ld	 r13,r11,4
	ld	 r12,r10,4
	ld	 r2,r13,64
	ld	 r3,r12,64
	bsr.n	 _comptypes
	or	 r4,r0,1
	bcnd.n	 eq0,r2,@L8054
	or	 r4,r0,1
	ld	 r2,r31,124
	ld	 r3,r31,132
	bsr.n	 _compparms
	addu	 r1,r1,@L8246
@L8247:
	align	 4
@L8054:
	br.n	 @L8046
	or	 r2,r0,0
	align	 4
@L8047:
	ld	 r13,r31,88
	or.u	 r12,r0,hi16(_error_mark_node)
	ld	 r2,r13,4
	ld	 r13,r12,lo16(_error_mark_node)
	cmp	 r13,r2,r13
	bb1	 ne,r13,@L8057
	ld	 r13,r31,92
	ld	 r13,r13,4
	cmp	 r13,r13,r2
	br.n	 @L8046
	extu	 r2,r13,1<eq>
	align	 4
@L8057:
	ld	 r13,r31,92
	ld	 r3,r13,4
	bcnd.n	 ne0,r3,@L8059
	cmp	 r13,r2,0
	br.n	 @L8046
	extu	 r2,r13,1<eq>
	align	 4
@L8059:
	bsr.n	 _comptypes
	or	 r4,r0,1
@L8046:
	bcnd	 ne0,r2,@L8045
	ld	 r13,r19,4
	ld	 r12,r25,4
	ld	 r2,r13,12
	ld	 r3,r12,12
	bsr.n	 _comp_target_parms
	or	 r4,r0,1
	bcnd	 eq0,r2,@L8044
@L8045:
	ld	 r13,r25,80
	ld	 r25,r13,16
	ld	 r12,r19,28
	ld	 r13,r25,60
	st	 r13,r19,60
	ld	 r13,r25,28
	and	 r11,r12,0xfbff
	mask	 r13,r13,1024
	or	 r11,r11,r13
	st	 r11,r19,28
	ld	 r13,r25,48
	bcnd	 eq0,r13,@L8061
	ld.bu	 r12,r19,8
	cmp	 r13,r12,32
	bb0.n	 ne,r13,@L8061
	cmp	 r13,r12,29
	bb1	 ne,r13,@L8061
	ld	 r13,r25,80
@L8061:
	or	 r2,r0,r19
	bsr.n	 _duplicate_decls
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L8021
	or	 r19,r0,r25
	bsr.n	 _my_friendly_abort
	or	 r2,r0,19
	br.n	 @L8021
	or	 r19,r0,r25
	align	 4
@L8044:
	or	 r25,r0,0
@L8021:
	bcnd.n	 eq0,r25,@L8084
	or.u	 r13,r0,hi16(_current_function_decl)
	br.n	 @L8085
	st	 r25,r13,lo16(_current_function_decl)
	align	 4
@L8084:
	ld	 r9,r31,140
	bcnd	 ne0,r9,@L8086
	bsr.n	 _pushdecl
	or	 r2,r0,r19
	or.u	 r12,r0,hi16(_current_function_decl)
	st	 r2,r12,lo16(_current_function_decl)
	ld.bu	 r13,r2,8
	cmp	 r13,r13,3
	bb1	 ne,r13,@L8087
	ld	 r13,r19,80
	ld	 r19,r13,16
	br.n	 @L8088
	st	 r19,r12,lo16(_current_function_decl)
	align	 4
@L8087:
	or	 r19,r0,r2
	ld	 r13,r2,80
	st	 r19,r13,16
@L8088:
	ld	 r16,r19,4
	br	 @L8085
	align	 4
@L8086:
	st	 r19,r13,lo16(_current_function_decl)
@L8085:
	ld	 r13,r19,28
	bb0	 (31-21),r13,@L8090
	ld	 r22,r19,32
	ld	 r24,r22,20
	or	 r13,r13,1024
	or	 r23,r0,r19
	bcnd.n	 eq0,r24,@L8092
	st	 r13,r19,28
	ld.bu	 r12,r24,8
	cmp	 r13,r12,3
	bb0	 ne,r13,@L8093
	ld	 r13,r19,80
	ld.bu	 r13,r0,r13
	bcnd.n	 ne0,r13,@L8210
	or.u	 r13,r0,hi16(_flag_traditional)
	cmp	 r13,r12,29
	bb1	 ne,r13,@L8095
	ld	 r13,r24,80
	ld.bu	 r13,r0,r13
	bcnd.n	 ne0,r13,@L8210
	or.u	 r13,r0,hi16(_flag_traditional)
	or.u	 r3,r0,hi16(@LC90)
	or	 r2,r0,r19
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC90)
	or.u	 r3,r0,hi16(@LC91)
	or	 r2,r0,r24
	or	 r3,r3,lo16(@LC91)
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L8248
@L8249:
	align	 4
@L8095:
	bsr.n	 _my_friendly_abort
	or	 r2,r0,9
@L8094:
	or.u	 r13,r0,hi16(_flag_traditional)
@L8210:
	ld	 r13,r13,lo16(_flag_traditional)
	bcnd	 ne0,r13,@L8098
	ld	 r13,r24,8
	bb0.n	 (31-10),r13,@L8098
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L8098
	or.u	 r25,r0,hi16(_overloads_to_forget)
	or	 r2,r0,r22
	ld	 r4,r25,lo16(_overloads_to_forget)
	bsr.n	 _tree_cons
	or	 r3,r0,r24
	st	 r2,r25,lo16(_overloads_to_forget)
@L8098:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,106
	bb1	 ne,r13,@L8100
	ld	 r24,r24,16
@L8100:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1.n	 ne,r13,@L8211
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r24,80
	ld	 r12,r23,80
	ld.bu	 r13,r0,r13
	ld.bu	 r12,r0,r12
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L8101
	ld	 r2,r24,4
	ld	 r3,r23,4
	bsr.n	 _comptypes
	or	 r4,r0,1
	bcnd.n	 eq0,r2,@L8101
	or.u	 r13,r0,hi16(_current_lang_stack)
	or.u	 r12,r0,hi16(_current_lang_base)
	ld	 r13,r13,lo16(_current_lang_stack)
	ld	 r12,r12,lo16(_current_lang_base)
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L8102
	or.u	 r3,r0,hi16(@LC92)
	ld	 r13,r24,80
	ld	 r12,r23,80
	ld.bu	 r13,r0,r13
	or	 r19,r0,r24
	br.n	 @L8090
	st.b	 r13,r0,r12
	align	 4
@L8102:
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC92)
	or.u	 r3,r0,hi16(@LC93)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC93)
@L8101:
	or.u	 r13,r0,hi16(_pedantic)
@L8211:
	ld	 r13,r13,lo16(_pedantic)
	bcnd	 eq0,r13,@L8104
	ld.bu	 r13,r24,8
	cmp	 r13,r13,33
	bb1.n	 ne,r13,@L8104
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13,132
	ld.b	 r2,r0,r13
	cmp	 r2,r2,100
	or	 r3,r0,143
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	or.u	 r3,r0,hi16(@LC94)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC94)
	or.u	 r3,r0,hi16(@LC95)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC95)
@L8104:
	or	 r2,r0,r22
	or	 r3,r0,r24
	bsr.n	 _tree_cons
	or	 r4,r0,0
	or	 r24,r0,r2
	ld	 r2,r24,12
	br.n	 @L8191
	or	 r3,r0,r23
	align	 4
@L8093:
	ld	 r13,r24,16
	bcnd	 ne0,r13,@L8105
	st	 r19,r24,16
	br	 @L8090
	align	 4
@L8105:
	ld.bu	 r13,r19,8
	cmp	 r13,r13,129
	bb0	 ne,r13,@L8092
	or	 r25,r0,r24
	ld	 r21,r19,60
@L8110:
	ld	 r11,r25,16
	ld.bu	 r13,r11,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L8111
	ld	 r13,r11,80
	ld	 r12,r23,80
	ld.bu	 r13,r0,r13
	ld.bu	 r12,r0,r12
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L8111
	ld	 r2,r11,4
	ld	 r3,r23,4
	bsr.n	 _comptypes
	or	 r4,r0,1
	bcnd	 eq0,r2,@L8111
	or.u	 r3,r0,hi16(@LC96)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC96)
	or.u	 r3,r0,hi16(@LC97)
	ld	 r2,r25,16
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC97)
@L8111:
	ld	 r12,r25,16
	ld.bu	 r13,r12,8
	cmp	 r13,r13,129
	bb1	 eq,r13,@L8109
	ld	 r13,r12,60
	cmp	 r13,r13,r21
	bb0.n	 ne,r13,@L8090
	or	 r19,r0,r23
@L8109:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L8110
@L8092:
	ld	 r13,r23,80
	ld.bu	 r13,r0,r13
	bcnd	 ne0,r13,@L8114
	bcnd.n	 eq0,r24,@L8114
	or	 r25,r0,r24
@L8119:
	ld	 r13,r25,16
	ld	 r13,r13,80
	ld.bu	 r13,r0,r13
	cmp	 r13,r13,1
	bb0	 eq,r13,@L8116
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L8119
@L8116:
	bcnd	 eq0,r25,@L8114
	or.u	 r3,r0,hi16(@LC98)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC98)
	or.u	 r3,r0,hi16(@LC99)
	ld	 r2,r25,16
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC99)
@L8114:
	or.u	 r13,r0,hi16(_flag_traditional)
	ld	 r13,r13,lo16(_flag_traditional)
	bcnd.n	 ne0,r13,@L8212
	or	 r2,r0,r22
	bcnd	 eq0,r24,@L8122
	ld	 r13,r24,8
	bb0	 (31-10),r13,@L8212
@L8122:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r12,r13,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd	 ne0,r13,@L8121
	ld	 r13,r12,32
	bb1.n	 (31-29),r13,@L8212
	or	 r2,r0,r22
	or.u	 r25,r0,hi16(_overloads_to_forget)
	ld	 r4,r25,lo16(_overloads_to_forget)
	bsr.n	 _tree_cons
	or	 r3,r0,r24
	st	 r2,r25,lo16(_overloads_to_forget)
@L8121:
	or	 r2,r0,r22
@L8212:
	or	 r3,r0,r23
@L8191:
	bsr.n	 _tree_cons
	or	 r4,r0,r24
	or.u	 r13,r0,hi16(_unknown_type_node)
	ld	 r13,r13,lo16(_unknown_type_node)
	or	 r24,r0,r2
	st	 r24,r22,20
	or	 r19,r0,r23
	st	 r13,r24,4
@L8090:
	ld	 r9,r31,148
	bcnd	 eq0,r9,@L8125
	ld	 r13,r19,80
	ld	 r13,r0,r13
	bb0	 (31-13),r13,@L8125
	ld.bu	 r13,r16,8
	cmp	 r13,r13,16
	bb1.n	 ne,r13,@L8213
	or.u	 r13,r0,hi16(_last_function_parms)
	ld	 r13,r16,12
	ld	 r2,r16,4
	bsr.n	 _build_function_type
	ld	 r3,r0,r13
	or	 r16,r0,r2
	st	 r16,r19,4
	or.u	 r13,r0,hi16(_last_function_parms)
@L8213:
	ld	 r12,r13,lo16(_last_function_parms)
	ld	 r12,r0,r12
	st	 r12,r13,lo16(_last_function_parms)
	st	 r0,r31,148
	st	 r12,r19,40
@L8125:
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	ld	 r16,r16,4
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L8128
	st	 r16,r31,156
	or.u	 r13,r0,hi16(_named_labels)
	ld	 r2,r13,lo16(_named_labels)
	cmp	 r2,r2,0
	or	 r3,r0,134
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
@L8128:
	or.u	 r12,r0,hi16(_free_binding_level)
	ld	 r2,r12,lo16(_free_binding_level)
	bcnd.n	 eq0,r2,@L8129
	or	 r25,r0,r2
	ld	 r13,r25,28
	br.n	 @L8130
	st	 r13,r12,lo16(_free_binding_level)
	align	 4
@L8129:
	bsr.n	 _xmalloc
	or	 r2,r0,36
	or	 r25,r0,r2
@L8130:
	or.u	 r3,r0,hi16(_clear_binding_level)
	subu	 r2,r25,60
	ld	 r4,r3,lo16(_clear_binding_level)
	or	 r3,r3,lo16(_clear_binding_level)
	or.u	 r13,r0,hi16(_keep_next_level_flag)
	subu	 r3,r3,60
	bsr.n	 ___movstrSI96x36
	ld	 r24,r13,lo16(_keep_next_level_flag)
	or.u	 r12,r0,hi16(_class_binding_level)
	ld	 r13,r12,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L8132
	st	 r13,r25,28
	br.n	 @L8133
	st	 r0,r12,lo16(_class_binding_level)
	align	 4
@L8132:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	st	 r13,r25,28
@L8133:
	ld	 r13,r25,32
	mak	 r12,r24,3<9>
	or	 r2,r0,r25
	or	 r13,r13,160
	or.u	 r25,r0,hi16(_current_binding_level)
	and	 r13,r13,0xf0ff
	st	 r2,r25,lo16(_current_binding_level)
	or	 r13,r13,r12
	bsr.n	 _GNU_xref_start_scope
	st	 r13,r2,32
	or.u	 r24,r0,hi16(_last_function_parms)
	ld	 r10,r25,lo16(_current_binding_level)
	ld	 r3,r24,lo16(_last_function_parms)
	or.u	 r13,r0,hi16(_keep_next_level_flag)
	st	 r0,r13,lo16(_keep_next_level_flag)
	or.u	 r13,r0,hi16(_current_function_parms)
	st	 r3,r13,lo16(_current_function_parms)
	or.u	 r12,r0,hi16(_last_function_parm_tags)
	ld	 r13,r10,32
	or	 r2,r0,r19
	ld	 r11,r12,lo16(_last_function_parm_tags)
	or.u	 r12,r0,hi16(_current_function_parm_tags)
	and	 r13,r13,0xfff
	st	 r11,r12,lo16(_current_function_parm_tags)
	or	 r13,r13,4096
	bsr.n	 _GNU_xref_function
	st	 r13,r10,32
	bsr.n	 _make_function_rtl
	or	 r2,r0,r19
	ld	 r9,r31,148
	bcnd	 eq0,r9,@L8134
	ld	 r2,r31,148
	bsr.n	 _pushclass
	or	 r3,r0,1
	ld	 r9,r31,164
	bcnd.n	 ne0,r9,@L8141
	or.u	 r25,r0,hi16(_current_class_decl)
	ld	 r13,r24,lo16(_last_function_parms)
	or	 r2,r0,0
	bcnd.n	 eq0,r13,@L8136
	st	 r13,r25,lo16(_current_class_decl)
	ld.bu	 r13,r13,8
	cmp	 r13,r13,34
	extu	 r2,r13,1<eq>
@L8136:
	bsr.n	 _my_friendly_assert
	or	 r3,r0,162
	ld	 r4,r25,lo16(_current_class_decl)
	ld	 r11,r4,4
	ld.bu	 r13,r11,8
	cmp	 r13,r13,13
	bb1.n	 ne,r13,@L8137
	or.u	 r13,r0,hi16(_C_C_D)
	ld	 r9,r31,148
	ld	 r13,r9,80
	ld	 r12,r13,96
	ld	 r25,r11,4
	bcnd.n	 ne0,r12,@L8138
	or.u	 r13,r0,hi16(_C_C_D)
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r3,r13,lo16(_current_class_type)
	bsr.n	 _build1
	or	 r2,r0,39
	ld	 r9,r31,148
	ld	 r12,r9,80
	or.u	 r13,r0,hi16(_C_C_D)
	st	 r2,r13,lo16(_C_C_D)
	br.n	 @L8220
	st	 r2,r12,96
	align	 4
@L8138:
	st	 r4,r12,16
	st	 r12,r13,lo16(_C_C_D)
	or.u	 r13,r0,hi16(_C_C_D)
@L8220:
	ld	 r11,r13,lo16(_C_C_D)
	ld	 r13,r11,8
	ld	 r12,r25,8
	and.u	 r13,r13,0xfffb
	mask.u	 r12,r12,0x4
	or	 r13,r13,r12
	st	 r13,r11,8
	ld	 r12,r25,8
	and.u	 r13,r13,0xff7f
	extu	 r12,r12,1<19>
	mak	 r12,r12,0<23>
	or	 r13,r13,r12
	st	 r13,r11,8
	ld	 r12,r25,8
	and.u	 r13,r13,0xfff7
	mask.u	 r12,r12,0x8
	or	 r13,r13,r12
	br.n	 @L8141
	st	 r13,r11,8
	align	 4
@L8137:
	br.n	 @L8141
	st	 r4,r13,lo16(_C_C_D)
	align	 4
@L8134:
	ld	 r13,r19,80
	ld	 r13,r0,r13
	bb0	 (31-13),r13,@L8142
	ld	 r2,r19,36
	or	 r3,r0,2
	bsr.n	 _pushclass
	addu	 r1,r1,@L8250
@L8251:
	align	 4
@L8142:
	or	 r2,r0,0
	bsr.n	 _push_memoized_context
	or	 r3,r0,1
@L8141:
	bsr	 _temporary_allocation
	ld	 r9,r31,156
	ld.bu	 r13,r9,8
	cmp	 r13,r13,7
	bb1.n	 ne,r13,@L8144
	or.u	 r13,r0,hi16(_char_type_node)
	ld	 r12,r9,64
	ld	 r13,r13,lo16(_char_type_node)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L8221
	or.u	 r13,r0,hi16(_signed_char_type_node)
	ld	 r13,r13,lo16(_signed_char_type_node)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L8221
	or.u	 r13,r0,hi16(_unsigned_char_type_node)
	ld	 r13,r13,lo16(_unsigned_char_type_node)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L8221
	or.u	 r13,r0,hi16(_short_integer_type_node)
	ld	 r13,r13,lo16(_short_integer_type_node)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L8221
	or.u	 r13,r0,hi16(_short_unsigned_type_node)
	ld	 r13,r13,lo16(_short_unsigned_type_node)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L8144
@L8221:
	ld	 r13,r9,8
	bb0.n	 (31-14),r13,@L8146
	or.u	 r13,r0,hi16(_flag_traditional)
	ld	 r13,r13,lo16(_flag_traditional)
	bcnd.n	 ne0,r13,@L8214
	or.u	 r13,r0,hi16(_unsigned_type_node)
	or.u	 r13,r0,hi16(_integer_type_node)
	ld	 r12,r13,lo16(_integer_type_node)
	ld.bu	 r13,r9,25
	ld.bu	 r12,r12,25
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L8215
	or.u	 r13,r0,hi16(_integer_type_node)
	or.u	 r13,r0,hi16(_unsigned_type_node)
@L8214:
	ld	 r13,r13,lo16(_unsigned_type_node)
	br.n	 @L8144
	st	 r13,r31,156
	align	 4
@L8146:
	or.u	 r13,r0,hi16(_integer_type_node)
@L8215:
	ld	 r13,r13,lo16(_integer_type_node)
	st	 r13,r31,156
@L8144:
	ld	 r13,r19,44
	bcnd.n	 ne0,r13,@L8149
	or	 r2,r0,35
	ld	 r4,r31,156
	bsr.n	 _build_decl
	or	 r3,r0,0
	st	 r2,r19,44
@L8149:
	ld	 r13,r19,60
	ld	 r13,r13,16
	ld.b	 r13,r13,1
	cmp	 r13,r13,36
	bb1.n	 ne,r13,@L8150
	or	 r2,r0,30
	or	 r3,r0,0
	bsr.n	 _build_decl
	or	 r4,r0,0
	or.u	 r13,r0,hi16(_dtor_label)
	st	 r2,r13,lo16(_dtor_label)
	or.u	 r13,r0,hi16(_ctor_label)
	br.n	 @L8151
	st	 r0,r13,lo16(_ctor_label)
	align	 4
@L8150:
	ld	 r13,r19,80
	ld	 r12,r0,r13
	or.u	 r13,r0,hi16(_dtor_label)
	bb0.n	 (31-9),r12,@L8151
	st	 r0,r13,lo16(_dtor_label)
	or	 r2,r0,30
	or	 r3,r0,0
	bsr.n	 _build_decl
	or	 r4,r0,0
	or.u	 r13,r0,hi16(_ctor_label)
	st	 r2,r13,lo16(_ctor_label)
@L8151:
	ld	 r13,r19,60
	ld	 r13,r13,8
	bb0.n	 (31-11),r13,@L8153
	or.u	 r12,r0,0x10
	ld	 r13,r19,8
	or	 r13,r13,r12
	st	 r13,r19,8
@L8153:
	or	 r2,r0,1
@L8154:
@Lte72:
	ld	 r1,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	ld.d	 r14,r31,32
	jmp.n	 r1
	addu	 r31,r31,192
	def	 @L8250,@L8141-@L8251
	def	 @L8248,@L8094-@L8249
	def	 @L8246,@L8046-@L8247
	def	 @L8244,@L8187-@L8245
	def	 @L8242,@L8015-@L8243
	def	 @L8240,@L8012-@L8241
	def	 @L8238,@L8186-@L8239
	def	 @L8236,@L7813-@L8237
	def	 @L8234,@L7813-@L8235
	def	 @L8232,@L7813-@L8233
	def	 @L8230,@L7813-@L8231
	def	 @L8228,@L8184-@L8229
	def	 @L8226,@L8181-@L8227
	def	 @L8224,@L8180-@L8225
	def	 @L8222,@L7807-@L8223

data
	align	 8
@LC422:
	string	 "parse errors have confused me too much\000"
	align	 8
@LC423:
	string	 "parameter `%s' declared void\000"
	align	 8
@LC424:
	string	 "main\000"
	align	 8
@LC425:
	string	 "__gc_main\000"
text
	align	 8
	global	 _store_parm_decls
_store_parm_decls:
	subu	 r31,r31,80
	or.u	 r13,r0,hi16(_current_function_decl)
	st.d	 r22,r31,48
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r22,r13,lo16(_current_function_decl)
	ld	 r12,r12,lo16(_global_binding_level)
	or.u	 r11,r0,hi16(_current_function_parms)
	st.d	 r24,r31,56
	ld	 r24,r11,lo16(_current_function_parms)
	st.d	 r20,r31,40
	or.u	 r23,r0,hi16(_current_binding_level)
	st.d	 r18,r31,32
	or.u	 r10,r0,hi16(_current_function_parm_tags)
	ld	 r13,r23,lo16(_current_binding_level)
	or	 r20,r0,0
	ld	 r18,r10,lo16(_current_function_parm_tags)
	or	 r21,r0,0
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L8314
	st	 r1,r31,64
@Ltb73:
	or.u	 r2,r0,hi16(@LC422)
	bsr.n	 _fatal
	or	 r2,r2,lo16(@LC422)
@L8314:
	or.u	 r13,r0,hi16(_input_filename)
	ld	 r3,r13,lo16(_input_filename)
	or.u	 r13,r0,hi16(_lineno)
	ld	 r4,r13,lo16(_lineno)
	bsr.n	 _init_function_start
	or	 r2,r0,r22
	bsr.n	 _declare_function_name
	or.u	 r25,r0,hi16(_flag_handle_exceptions)
	bsr.n	 _expand_start_bindings
	or	 r2,r0,0
	ld	 r13,r25,lo16(_flag_handle_exceptions)
	bcnd	 eq0,r13,@L8316
	bsr	 _setup_exception_throw_decl
	ld	 r13,r23,lo16(_current_binding_level)
	ld	 r19,r0,r13
	ld	 r11,r25,lo16(_flag_handle_exceptions)
	ld	 r12,r0,r19
	bcnd.n	 eq0,r11,@L8316
	st	 r12,r0,r13
	or.u	 r13,r0,hi16(_integer_one_node)
	or	 r3,r0,0
	ld	 r2,r13,lo16(_integer_one_node)
	bsr.n	 _expand_start_try
	or	 r4,r0,1
@L8316:
	bcnd.n	 eq0,r24,@L8317
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	or	 r2,r0,r24
	bsr.n	 _nreverse
	st	 r0,r0,r13
	or	 r25,r0,r2
	bcnd	 eq0,r25,@L8320
@L8322:
	ld.bu	 r13,r25,8
	cmp	 r13,r13,34
	ld	 r23,r0,r25
	bb1.n	 ne,r13,@L8323
	or	 r3,r0,r25
	bsr.n	 _maybe_build_cleanup
	or	 r2,r0,r25
	ld	 r13,r25,32
	bcnd.n	 eq0,r13,@L8328
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_void_type_node)
	ld	 r11,r25,4
	ld	 r13,r13,lo16(_void_type_node)
	ld	 r12,r11,64
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L8326
	or.u	 r3,r0,hi16(@LC423)
	or	 r2,r0,r25
	or	 r3,r3,lo16(@LC423)
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L8380
@L8381:
	align	 4
@L8326:
	ld.bu	 r13,r11,8
	cmp	 r13,r13,15
	bb1	 ne,r13,@L8328
	ld	 r13,r11,4
	ld	 r13,r13,16
	bcnd	 eq0,r13,@L8328
	bsr.n	 _convert_from_reference
	or	 r2,r0,r25
	st	 r2,r25,40
@L8328:
	bsr.n	 _pushdecl
	or	 r2,r0,r25
@L8325:
	bcnd	 eq0,r24,@L8321
	bsr.n	 _expand_decl
	or	 r2,r0,r25
	or	 r2,r0,r25
	or	 r3,r0,r24
	or	 r20,r0,1
	bsr.n	 _expand_decl_cleanup
	addu	 r1,r1,@L8382
@L8383:
	align	 4
@L8323:
	or	 r2,r0,r21
	bsr.n	 _chainon
	st	 r0,r0,r3
	or	 r21,r0,r2
@L8321:
	or	 r25,r0,r23
	bcnd	 ne0,r25,@L8322
@L8320:
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r0,r12
	st	 r13,r22,40
	ld	 r3,r12,4
	bsr.n	 _chainon
	or	 r2,r0,r18
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L8335
	st	 r2,r13,4
	align	 4
@L8317:
	st	 r0,r22,40
@L8335:
	ld	 r3,r22,40
	or	 r2,r0,r21
	bsr.n	 _chainon
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r25,lo16(_current_binding_level)
	or	 r3,r0,r20
	st	 r2,r0,r13
	or	 r2,r0,r22
	bsr.n	 _expand_function_start
	st	 r0,r22,72
	or.u	 r13,r0,hi16(_flag_handle_exceptions)
	ld	 r13,r13,lo16(_flag_handle_exceptions)
	bcnd	 eq0,r13,@L8337
	bsr.n	 _pushdecl
	or	 r2,r0,r19
	bsr.n	 _expand_decl_init
	or	 r2,r0,r19
@L8337:
	bcnd.n	 eq0,r20,@L8338
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L8378
	or.u	 r12,r0,hi16(_free_binding_level)
	or.u	 r13,r0,hi16(_named_labels)
	ld	 r2,r13,lo16(_named_labels)
	cmp	 r2,r2,0
	or	 r3,r0,134
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	or.u	 r12,r0,hi16(_free_binding_level)
@L8378:
	ld	 r2,r12,lo16(_free_binding_level)
	bcnd.n	 eq0,r2,@L8341
	or	 r25,r0,r2
	ld	 r13,r25,28
	br.n	 @L8342
	st	 r13,r12,lo16(_free_binding_level)
	align	 4
@L8341:
	bsr.n	 _xmalloc
	or	 r2,r0,36
	or	 r25,r0,r2
@L8342:
	or.u	 r3,r0,hi16(_clear_binding_level)
	subu	 r2,r25,60
	ld	 r4,r3,lo16(_clear_binding_level)
	or	 r3,r3,lo16(_clear_binding_level)
	or.u	 r13,r0,hi16(_keep_next_level_flag)
	subu	 r3,r3,60
	bsr.n	 ___movstrSI96x36
	ld	 r24,r13,lo16(_keep_next_level_flag)
	or.u	 r12,r0,hi16(_class_binding_level)
	ld	 r13,r12,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L8344
	st	 r13,r25,28
	br.n	 @L8345
	st	 r0,r12,lo16(_class_binding_level)
	align	 4
@L8344:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	st	 r13,r25,28
@L8345:
	ld	 r13,r25,32
	mak	 r11,r24,3<9>
	or	 r2,r0,r25
	or	 r13,r13,160
	or.u	 r12,r0,hi16(_current_binding_level)
	and	 r13,r13,0xf0ff
	st	 r2,r12,lo16(_current_binding_level)
	or	 r13,r13,r11
	bsr.n	 _GNU_xref_start_scope
	st	 r13,r2,32
	or.u	 r13,r0,hi16(_keep_next_level_flag)
	or	 r2,r0,0
	bsr.n	 _expand_start_bindings
	st	 r0,r13,lo16(_keep_next_level_flag)
@L8338:
	or.u	 r25,r0,hi16(_flag_gc)
	ld	 r11,r25,lo16(_flag_gc)
	or.u	 r12,r0,hi16(_current_function_parms_stored)
	or	 r13,r0,1
	bcnd.n	 eq0,r11,@L8346
	st	 r13,r12,lo16(_current_function_parms_stored)
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r3,r13,lo16(_error_mark_node)
	bsr.n	 _build_tree_list
	or	 r2,r0,0
	or	 r3,r0,r2
	or.u	 r13,r0,hi16(_maybe_gc_cleanup)
	or	 r2,r0,0
	bsr.n	 _expand_decl_cleanup
	st	 r3,r13,lo16(_maybe_gc_cleanup)
@L8346:
	ld	 r12,r22,32
	bcnd	 eq0,r12,@L8347
	ld	 r13,r12,12
	cmp	 r13,r13,4
	bb0.n	 eq,r13,@L8347
	or.u	 r3,r0,hi16(@LC424)
	ld	 r2,r12,16
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC424)
	bcnd	 ne0,r2,@L8347
	ld	 r13,r22,36
	bcnd	 ne0,r13,@L8347
	bsr	 _expand_main_function
	ld	 r13,r25,lo16(_flag_gc)
	bcnd.n	 eq0,r13,@L8348
	or.u	 r2,r0,hi16(@LC425)
	bsr.n	 _get_identifier
	or	 r2,r2,lo16(@LC425)
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r12,r13,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r12,r12,r13
	bb0.n	 ne,r12,@L8350
	or	 r25,r0,r2
	ld	 r2,r25,24
	bcnd	 ne0,r2,@L8351
@L8350:
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r12,r13,lo16(_current_class_type)
	bcnd	 eq0,r12,@L8352
	ld	 r2,r25,28
	bcnd	 ne0,r2,@L8375
	ld	 r13,r12,16
	bcnd	 ne0,r13,@L8353
	ld	 r13,r12,80
	ld	 r13,r0,r13
	bb0	 (31-24),r13,@L8353
	or	 r2,r0,r12
	or	 r3,r0,r25
	or	 r4,r0,0
	bsr.n	 _lookup_field
	or	 r5,r0,0
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r2,r13
	bb0	 ne,r13,@L8379
	bcnd	 eq0,r2,@L8374
	ld.bu	 r13,r2,8
	cmp	 r13,r13,32
	ext	 r13,r13,1<eq>
	and	 r2,r2,r13
@L8353:
	bcnd	 ne0,r2,@L8375
@L8374:
	bsr.n	 _lookup_nested_field
	or	 r2,r0,r25
	bcnd	 ne0,r2,@L8375
@L8352:
	ld	 r2,r25,20
@L8351:
	bcnd	 eq0,r2,@L8379
@L8375:
	ld.bu	 r13,r2,8
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L8349
	or.u	 r13,r0,hi16(_looking_for_typename)
	ld	 r12,r13,lo16(_looking_for_typename)
	bcnd	 lt0,r12,@L8349
	ld	 r3,r25,4
	bcnd	 eq0,r3,@L8362
	ld	 r3,r3,48
	cmp	 r13,r2,r3
	extu	 r13,r13,1<eq>
	bcnd	 ne0,r13,@L8377
	bcnd	 le0,r12,@L8379
	or	 r2,r0,r3
	br	 @L8379
	align	 4
@L8362:
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r3,r2,4
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r3,r13
	bb1	 ne,r13,@L8379
@L8377:
	or	 r2,r0,r3
@L8349:
@L8379:
	bsr.n	 _build_function_call
	or	 r3,r0,0
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
@L8348:
	or.u	 r13,r0,hi16(_flag_dossier)
	ld	 r13,r13,lo16(_flag_dossier)
	bcnd.n	 eq0,r13,@L8347
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	bcnd.n	 eq0,r13,@L8347
	or.u	 r2,r0,hi16(_permanent_obstack)
	or	 r2,r2,lo16(_permanent_obstack)
	bsr.n	 _push_obstacks
	or	 r3,r0,r2
	or.u	 r12,r0,hi16(_builtin_type_tdescs_len)
	ld	 r13,r12,lo16(_builtin_type_tdescs_len)
	bcnd.n	 le0,r13,@L8371
	or	 r24,r0,r12
	or	 r23,r0,r25
@L8372:
	ld	 r13,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r23,lo16(_builtin_type_tdescs_arr)
	subu	 r13,r13,1
	ld	 r25,r12[r13]
	or	 r3,r0,0
	or	 r2,r0,r25
	bsr.n	 _build_t_desc
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	or	 r12,r0,r2
	ld	 r13,r12,8
	or	 r2,r0,r25
	or	 r3,r0,2
	and.u	 r13,r13,0xfffe
	bsr.n	 _build_t_desc
	st	 r13,r12,8
	ld	 r13,r24,lo16(_builtin_type_tdescs_len)
	bcnd	 gt0,r13,@L8372
@L8371:
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	bsr.n	 _free
	ld	 r2,r25,lo16(_builtin_type_tdescs_arr)
	bsr.n	 _pop_obstacks
	st	 r0,r25,lo16(_builtin_type_tdescs_arr)
@L8347:
@Lte73:
	ld	 r1,r31,64
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	ld.d	 r18,r31,32
	jmp.n	 r1
	addu	 r31,r31,80
	def	 @L8382,@L8321-@L8383
	def	 @L8380,@L8325-@L8381

data
	align	 8
@LC426:
	string	 "ANSI C++ does not permit named return values\000"
	align	 8
@LC427:
	string	 "return identifier `%s' already in place\000"
	align	 8
@LC428:
	string	 "can't redefine default return value for construct"
	string	 "ors\000"
text
	align	 8
	global	 _store_return_init
_store_return_init:
	or.u	 r13,r0,hi16(_current_function_decl)
	or.u	 r12,r0,hi16(_pedantic)
	ld	 r13,r13,lo16(_current_function_decl)
	ld	 r12,r12,lo16(_pedantic)
	subu	 r31,r31,64
	st	 r1,r31,48
	st.d	 r24,r31,40
	or	 r24,r0,r2
	st	 r23,r31,36
@Ltb74:
	ld	 r25,r13,44
	bcnd.n	 eq0,r12,@L8393
	or	 r23,r0,r3
	or.u	 r2,r0,hi16(@LC426)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC426)
@L8393:
	bcnd	 eq0,r24,@L8394
	ld	 r13,r25,32
	bcnd	 ne0,r13,@L8395
	st	 r24,r25,32
	br.n	 @L8394
	st	 r24,r25,60
	align	 4
@L8395:
	or.u	 r2,r0,hi16(@LC427)
	ld	 r3,r13,16
	bsr.n	 _error
	or	 r2,r2,lo16(@LC427)
@L8394:
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r13,r13,lo16(_current_function_decl)
	ld	 r13,r13,80
	ld	 r13,r0,r13
	bb0.n	 (31-9),r13,@L8397
	or.u	 r2,r0,hi16(@LC428)
	or	 r2,r2,lo16(@LC428)
	bsr.n	 _error
	addu	 r1,r1,@L8400
@L8401:
	align	 4
@L8397:
	ld	 r13,r25,32
	bcnd	 eq0,r13,@L8392
	ld	 r13,r25,28
	bb0	 (31-10),r13,@L8399
	ld	 r12,r25,64
	or.u	 r13,r0,hi16(_original_result_rtx)
	st	 r12,r13,lo16(_original_result_rtx)
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r25,28
	st	 r2,r25,64
@L8399:
	or	 r2,r0,r25
	bsr.n	 _pushdecl
	st	 r23,r25,48
	or	 r2,r0,r25
	or	 r3,r0,r23
	or	 r4,r0,0
	bsr.n	 _finish_decl
	or	 r5,r0,0
@L8392:
@Lte74:
	ld	 r1,r31,48
	ld	 r23,r31,36
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64
	def	 @L8400,@L8392-@L8401

data
	align	 8
@LC429:
	string	 "_vptr$\000"
	align	 8
@LC430:
	string	 "main\000"
	align	 8
@LC431:
	string	 "`volatile' function does return\000"
	align	 8
@LC432:
	string	 "control reaches end of non-void function\000"
	align	 8
@LC433:
	string	 "this function may return with or without a value\000"
text
	align	 8
	global	 _finish_function
_finish_function:
	subu	 r31,r31,160
	or.u	 r13,r0,hi16(_current_function_decl)
	st.d	 r18,r31,48
	or.u	 r12,r0,hi16(_current_function_parms_stored)
	ld	 r19,r13,lo16(_current_function_decl)
	ld	 r13,r12,lo16(_current_function_parms_stored)
	st	 r1,r31,80
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	st.d	 r16,r31,40
	st.d	 r14,r31,32
@Ltb75:
	st	 r2,r31,92
	st	 r0,r31,108
	st	 r0,r31,116
	ld	 r8,r19,4
	or	 r15,r0,r3
	bcnd.n	 ne0,r13,@L8426
	st	 r8,r31,100
	or.u	 r13,r0,hi16(_current_function_parms)
	or.u	 r23,r0,hi16(_current_binding_level)
	or	 r15,r0,0
	ld	 r24,r13,lo16(_current_function_parms)
	or	 r20,r0,0
	ld	 r12,r23,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	or	 r21,r0,0
	ld	 r11,r13,lo16(_global_binding_level)
	or.u	 r13,r0,hi16(_current_function_parm_tags)
	cmp	 r12,r12,r11
	ld	 r16,r13,lo16(_current_function_parm_tags)
	bb1.n	 ne,r12,@L8428
	or	 r22,r0,r19
	or.u	 r2,r0,hi16(@LC422)
	bsr.n	 _fatal
	or	 r2,r2,lo16(@LC422)
@L8428:
	or.u	 r13,r0,hi16(_input_filename)
	ld	 r3,r13,lo16(_input_filename)
	or.u	 r13,r0,hi16(_lineno)
	ld	 r4,r13,lo16(_lineno)
	bsr.n	 _init_function_start
	or	 r2,r0,r19
	bsr.n	 _declare_function_name
	or.u	 r25,r0,hi16(_flag_handle_exceptions)
	bsr.n	 _expand_start_bindings
	or	 r2,r0,0
	ld	 r13,r25,lo16(_flag_handle_exceptions)
	bcnd	 eq0,r13,@L8430
	bsr	 _setup_exception_throw_decl
	ld	 r13,r23,lo16(_current_binding_level)
	ld	 r18,r0,r13
	ld	 r11,r25,lo16(_flag_handle_exceptions)
	ld	 r12,r0,r18
	bcnd.n	 eq0,r11,@L8430
	st	 r12,r0,r13
	or.u	 r13,r0,hi16(_integer_one_node)
	or	 r3,r0,0
	ld	 r2,r13,lo16(_integer_one_node)
	bsr.n	 _expand_start_try
	or	 r4,r0,1
@L8430:
	bcnd.n	 eq0,r24,@L8431
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	or	 r2,r0,r24
	bsr.n	 _nreverse
	st	 r0,r0,r13
	or	 r25,r0,r2
	bcnd	 eq0,r25,@L8434
@L8436:
	ld.bu	 r13,r25,8
	cmp	 r13,r13,34
	ld	 r23,r0,r25
	bb1.n	 ne,r13,@L8437
	or	 r3,r0,r25
	bsr.n	 _maybe_build_cleanup
	or	 r2,r0,r25
	ld	 r13,r25,32
	bcnd.n	 eq0,r13,@L8442
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_void_type_node)
	ld	 r11,r25,4
	ld	 r13,r13,lo16(_void_type_node)
	ld	 r12,r11,64
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L8440
	or.u	 r3,r0,hi16(@LC423)
	or	 r2,r0,r25
	or	 r3,r3,lo16(@LC423)
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L9250
@L9251:
	align	 4
@L8440:
	ld.bu	 r13,r11,8
	cmp	 r13,r13,15
	bb1	 ne,r13,@L8442
	ld	 r13,r11,4
	ld	 r13,r13,16
	bcnd	 eq0,r13,@L8442
	bsr.n	 _convert_from_reference
	or	 r2,r0,r25
	st	 r2,r25,40
@L8442:
	bsr.n	 _pushdecl
	or	 r2,r0,r25
@L8439:
	bcnd	 eq0,r24,@L8435
	bsr.n	 _expand_decl
	or	 r2,r0,r25
	or	 r2,r0,r25
	or	 r3,r0,r24
	or	 r20,r0,1
	bsr.n	 _expand_decl_cleanup
	addu	 r1,r1,@L9252
@L9253:
	align	 4
@L8437:
	or	 r2,r0,r21
	bsr.n	 _chainon
	st	 r0,r0,r3
	or	 r21,r0,r2
@L8435:
	or	 r25,r0,r23
	bcnd	 ne0,r25,@L8436
@L8434:
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r0,r12
	st	 r13,r22,40
	ld	 r3,r12,4
	bsr.n	 _chainon
	or	 r2,r0,r16
	ld	 r13,r25,lo16(_current_binding_level)
	br.n	 @L8449
	st	 r2,r13,4
	align	 4
@L8431:
	st	 r0,r22,40
@L8449:
	ld	 r3,r22,40
	or	 r2,r0,r21
	bsr.n	 _chainon
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r25,lo16(_current_binding_level)
	or	 r3,r0,r20
	st	 r2,r0,r13
	or	 r2,r0,r22
	bsr.n	 _expand_function_start
	st	 r0,r22,72
	or.u	 r13,r0,hi16(_flag_handle_exceptions)
	ld	 r13,r13,lo16(_flag_handle_exceptions)
	bcnd	 eq0,r13,@L8451
	bsr.n	 _pushdecl
	or	 r2,r0,r18
	bsr.n	 _expand_decl_init
	or	 r2,r0,r18
@L8451:
	bcnd.n	 eq0,r20,@L8452
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L9182
	or.u	 r12,r0,hi16(_free_binding_level)
	or.u	 r13,r0,hi16(_named_labels)
	ld	 r2,r13,lo16(_named_labels)
	cmp	 r2,r2,0
	or	 r3,r0,134
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	or.u	 r12,r0,hi16(_free_binding_level)
@L9182:
	ld	 r2,r12,lo16(_free_binding_level)
	bcnd.n	 eq0,r2,@L8455
	or	 r25,r0,r2
	ld	 r13,r25,28
	br.n	 @L8456
	st	 r13,r12,lo16(_free_binding_level)
	align	 4
@L8455:
	bsr.n	 _xmalloc
	or	 r2,r0,36
	or	 r25,r0,r2
@L8456:
	or.u	 r3,r0,hi16(_clear_binding_level)
	subu	 r2,r25,60
	ld	 r4,r3,lo16(_clear_binding_level)
	or	 r3,r3,lo16(_clear_binding_level)
	or.u	 r13,r0,hi16(_keep_next_level_flag)
	subu	 r3,r3,60
	bsr.n	 ___movstrSI96x36
	ld	 r24,r13,lo16(_keep_next_level_flag)
	or.u	 r12,r0,hi16(_class_binding_level)
	ld	 r13,r12,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L8458
	st	 r13,r25,28
	br.n	 @L8459
	st	 r0,r12,lo16(_class_binding_level)
	align	 4
@L8458:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	st	 r13,r25,28
@L8459:
	ld	 r13,r25,32
	mak	 r11,r24,3<9>
	or	 r2,r0,r25
	or	 r13,r13,160
	or.u	 r12,r0,hi16(_current_binding_level)
	and	 r13,r13,0xf0ff
	st	 r2,r12,lo16(_current_binding_level)
	or	 r13,r13,r11
	bsr.n	 _GNU_xref_start_scope
	st	 r13,r2,32
	or.u	 r13,r0,hi16(_keep_next_level_flag)
	or	 r2,r0,0
	bsr.n	 _expand_start_bindings
	st	 r0,r13,lo16(_keep_next_level_flag)
@L8452:
	or.u	 r25,r0,hi16(_flag_gc)
	ld	 r11,r25,lo16(_flag_gc)
	or.u	 r12,r0,hi16(_current_function_parms_stored)
	or	 r13,r0,1
	bcnd.n	 eq0,r11,@L8460
	st	 r13,r12,lo16(_current_function_parms_stored)
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r3,r13,lo16(_error_mark_node)
	bsr.n	 _build_tree_list
	or	 r2,r0,0
	or	 r3,r0,r2
	or.u	 r13,r0,hi16(_maybe_gc_cleanup)
	or	 r2,r0,0
	bsr.n	 _expand_decl_cleanup
	st	 r3,r13,lo16(_maybe_gc_cleanup)
@L8460:
	ld	 r12,r22,32
	bcnd	 eq0,r12,@L8426
	ld	 r13,r12,12
	cmp	 r13,r13,4
	bb1.n	 ne,r13,@L9183
	or.u	 r13,r0,hi16(_write_symbols)
	or.u	 r3,r0,hi16(@LC424)
	ld	 r2,r12,16
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC424)
	bcnd.n	 ne0,r2,@L9183
	or.u	 r13,r0,hi16(_write_symbols)
	ld	 r13,r22,36
	bcnd.n	 ne0,r13,@L9183
	or.u	 r13,r0,hi16(_write_symbols)
	bsr	 _expand_main_function
	ld	 r13,r25,lo16(_flag_gc)
	bcnd.n	 eq0,r13,@L8462
	or.u	 r2,r0,hi16(@LC425)
	bsr.n	 _get_identifier
	or	 r2,r2,lo16(@LC425)
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r12,r13,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_global_binding_level)
	cmp	 r12,r12,r13
	bb0.n	 ne,r12,@L8464
	or	 r25,r0,r2
	ld	 r2,r25,24
	bcnd	 ne0,r2,@L8465
@L8464:
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r12,r13,lo16(_current_class_type)
	bcnd	 eq0,r12,@L8466
	ld	 r2,r25,28
	bcnd	 ne0,r2,@L9086
	ld	 r13,r12,16
	bcnd	 ne0,r13,@L8467
	ld	 r13,r12,80
	ld	 r13,r0,r13
	bb0	 (31-24),r13,@L8467
	or	 r2,r0,r12
	or	 r3,r0,r25
	or	 r4,r0,0
	bsr.n	 _lookup_field
	or	 r5,r0,0
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r2,r13
	bb0	 ne,r13,@L9184
	bcnd	 eq0,r2,@L9085
	ld.bu	 r13,r2,8
	cmp	 r13,r13,32
	ext	 r13,r13,1<eq>
	and	 r2,r2,r13
@L8467:
	bcnd	 ne0,r2,@L9086
@L9085:
	bsr.n	 _lookup_nested_field
	or	 r2,r0,r25
	bcnd	 ne0,r2,@L9086
@L8466:
	ld	 r2,r25,20
@L8465:
	bcnd	 eq0,r2,@L9184
@L9086:
	ld.bu	 r13,r2,8
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L8463
	or.u	 r13,r0,hi16(_looking_for_typename)
	ld	 r12,r13,lo16(_looking_for_typename)
	bcnd	 lt0,r12,@L8463
	ld	 r3,r25,4
	bcnd	 eq0,r3,@L8476
	ld	 r3,r3,48
	cmp	 r13,r2,r3
	extu	 r13,r13,1<eq>
	bcnd	 ne0,r13,@L9172
	bcnd	 le0,r12,@L9184
	or	 r2,r0,r3
	br	 @L9184
	align	 4
@L8476:
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r3,r2,4
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r3,r13
	bb1	 ne,r13,@L9184
@L9172:
	or	 r2,r0,r3
@L8463:
@L9184:
	bsr.n	 _build_function_call
	or	 r3,r0,0
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
@L8462:
	or.u	 r13,r0,hi16(_flag_dossier)
	ld	 r13,r13,lo16(_flag_dossier)
	bcnd	 eq0,r13,@L8426
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	ld	 r13,r25,lo16(_builtin_type_tdescs_arr)
	bcnd.n	 eq0,r13,@L8426
	or.u	 r2,r0,hi16(_permanent_obstack)
	or	 r2,r2,lo16(_permanent_obstack)
	bsr.n	 _push_obstacks
	or	 r3,r0,r2
	or.u	 r12,r0,hi16(_builtin_type_tdescs_len)
	ld	 r13,r12,lo16(_builtin_type_tdescs_len)
	bcnd	 le0,r13,@L8485
	or	 r24,r0,r12
	or	 r23,r0,r25
@L8486:
	ld	 r13,r24,lo16(_builtin_type_tdescs_len)
	ld	 r12,r23,lo16(_builtin_type_tdescs_arr)
	subu	 r13,r13,1
	ld	 r25,r12[r13]
	or	 r3,r0,0
	or	 r2,r0,r25
	bsr.n	 _build_t_desc
	st	 r13,r24,lo16(_builtin_type_tdescs_len)
	or	 r12,r0,r2
	ld	 r13,r12,8
	or	 r2,r0,r25
	or	 r3,r0,2
	and.u	 r13,r13,0xfffe
	bsr.n	 _build_t_desc
	st	 r13,r12,8
	ld	 r13,r24,lo16(_builtin_type_tdescs_len)
	bcnd	 gt0,r13,@L8486
@L8485:
	or.u	 r25,r0,hi16(_builtin_type_tdescs_arr)
	bsr.n	 _free
	ld	 r2,r25,lo16(_builtin_type_tdescs_arr)
	bsr.n	 _pop_obstacks
	st	 r0,r25,lo16(_builtin_type_tdescs_arr)
@L8426:
	or.u	 r13,r0,hi16(_write_symbols)
@L9183:
	ld	 r13,r13,lo16(_write_symbols)
	bcnd	 eq0,r13,@L8488
	ld	 r14,r31,100
	ld.bu	 r13,r14,8
	cmp	 r13,r13,16
	bb0	 ne,r13,@L8488
	bsr.n	 _target_type
	ld	 r2,r31,100
	ld	 r13,r2,24
	bb0	 (31-22),r13,@L8489
	bsr	 _note_debug_info_needed
@L8489:
	ld	 r25,r19,40
	bcnd	 eq0,r25,@L8488
@L8493:
	bsr.n	 _target_type
	ld	 r2,r25,4
	ld	 r13,r2,24
	bb0	 (31-22),r13,@L8492
	bsr	 _note_debug_info_needed
@L8492:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L8493
@L8488:
	bsr	 _do_pending_stack_adjust
	or.u	 r13,r0,hi16(_dtor_label)
	ld	 r13,r13,lo16(_dtor_label)
	bcnd.n	 eq0,r13,@L8496
	or.u	 r13,r0,hi16(_integer_one_node)
	or.u	 r10,r0,hi16(_in_charge_identifier)
	ld	 r23,r13,lo16(_integer_one_node)
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r25,r10,lo16(_in_charge_identifier)
	or.u	 r12,r0,hi16(_current_binding_level)
	ld	 r9,r13,lo16(_current_class_type)
	or.u	 r11,r0,hi16(_global_binding_level)
	ld	 r13,r12,lo16(_current_binding_level)
	ld	 r12,r11,lo16(_global_binding_level)
	ld	 r9,r9,68
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L8498
	st	 r9,r31,148
	ld	 r2,r25,24
	bcnd	 ne0,r2,@L8499
@L8498:
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r12,r13,lo16(_current_class_type)
	bcnd	 eq0,r12,@L8500
	ld	 r2,r25,28
	bcnd	 ne0,r2,@L9088
	ld	 r13,r12,16
	bcnd	 ne0,r13,@L8501
	ld	 r13,r12,80
	ld	 r13,r0,r13
	bb0	 (31-24),r13,@L8501
	or	 r2,r0,r12
	or	 r3,r0,r25
	or	 r4,r0,0
	bsr.n	 _lookup_field
	or	 r5,r0,0
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r2,r13
	bb0.n	 ne,r13,@L8497
	or	 r22,r0,r2
	bcnd	 eq0,r2,@L9087
	ld.bu	 r13,r2,8
	cmp	 r13,r13,32
	ext	 r13,r13,1<eq>
	and	 r2,r2,r13
@L8501:
	bcnd	 ne0,r2,@L9088
@L9087:
	bsr.n	 _lookup_nested_field
	or	 r2,r0,r25
	bcnd	 ne0,r2,@L9088
@L8500:
	ld	 r2,r25,20
@L8499:
	bcnd.n	 eq0,r2,@L8497
	or	 r22,r0,r2
@L9088:
	ld.bu	 r13,r2,8
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L8507
	or.u	 r13,r0,hi16(_looking_for_typename)
	ld	 r12,r13,lo16(_looking_for_typename)
	bcnd	 lt0,r12,@L8507
	ld	 r3,r25,4
	bcnd	 eq0,r3,@L8510
	ld	 r4,r3,48
	cmp	 r13,r2,r4
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L8497
	or	 r22,r0,r4
	bcnd.n	 gt0,r12,@L9248
	or.u	 r13,r0,hi16(_current_function_assigns_this)
	br.n	 @L9248
	or	 r22,r0,r2
	align	 4
@L8510:
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r4,r2,4
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r4,r13
	bb1.n	 ne,r13,@L8497
	or	 r22,r0,r2
	br.n	 @L8497
	or	 r22,r0,r4
	align	 4
@L8507:
	or	 r22,r0,r2
@L8497:
	or.u	 r13,r0,hi16(_current_function_assigns_this)
@L9248:
	ld	 r13,r13,lo16(_current_function_assigns_this)
	bcnd.n	 eq0,r13,@L8515
	or	 r16,r0,0
	or.u	 r13,r0,hi16(_integer_type_node)
	ld	 r3,r13,lo16(_integer_type_node)
	or.u	 r13,r0,hi16(_current_class_decl)
	ld	 r4,r13,lo16(_current_class_decl)
	or.u	 r13,r0,hi16(_integer_zero_node)
	ld	 r5,r13,lo16(_integer_zero_node)
	bsr.n	 _build
	or	 r2,r0,96
	br.n	 @L8516
	or	 r23,r0,r2
	align	 4
@L8515:
	or.u	 r21,r0,hi16(_current_class_type)
	ld	 r13,r21,lo16(_current_class_type)
	ld	 r13,r13,68
	ld	 r13,r13,32
	bcnd.n	 eq0,r13,@L8517
	or	 r25,r0,0
	ld	 r25,r13,12
@L8517:
	bsr	 _get_last_insn
	bsr.n	 _get_first_nonparm_insn
	or	 r20,r0,r2
	or.u	 r13,r0,hi16(_flag_this_is_variable)
	ld	 r13,r13,lo16(_flag_this_is_variable)
	bb0.n	 (31-31),r13,@L8523
	or	 r24,r0,r2
	cmp	 r13,r20,r24
	bb1	 ne,r13,@L8516
	bcnd.n	 eq0,r25,@L8523
	cmp	 r13,r25,1
	bb1.n	 ne,r13,@L9185
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r21,lo16(_current_class_type)
	ld	 r13,r13,68
	ld	 r13,r13,32
	ld	 r13,r13,16
	ld	 r13,r13,4
	ld	 r13,r13,24
	bb0.n	 (31-19),r13,@L9185
	or.u	 r13,r0,hi16(_current_binding_level)
@L8523:
	or	 r16,r0,1
@L8516:
	or.u	 r13,r0,hi16(_current_binding_level)
@L9185:
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L9186
	or.u	 r12,r0,hi16(_free_binding_level)
	or.u	 r13,r0,hi16(_named_labels)
	ld	 r2,r13,lo16(_named_labels)
	cmp	 r2,r2,0
	or	 r3,r0,134
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	or.u	 r12,r0,hi16(_free_binding_level)
@L9186:
	ld	 r2,r12,lo16(_free_binding_level)
	bcnd.n	 eq0,r2,@L8526
	or	 r25,r0,r2
	ld	 r13,r25,28
	br.n	 @L8527
	st	 r13,r12,lo16(_free_binding_level)
	align	 4
@L8526:
	bsr.n	 _xmalloc
	or	 r2,r0,36
	or	 r25,r0,r2
@L8527:
	or.u	 r3,r0,hi16(_clear_binding_level)
	subu	 r2,r25,60
	ld	 r4,r3,lo16(_clear_binding_level)
	or	 r3,r3,lo16(_clear_binding_level)
	or.u	 r13,r0,hi16(_keep_next_level_flag)
	subu	 r3,r3,60
	bsr.n	 ___movstrSI96x36
	ld	 r24,r13,lo16(_keep_next_level_flag)
	or.u	 r12,r0,hi16(_class_binding_level)
	ld	 r13,r12,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L8529
	st	 r13,r25,28
	br.n	 @L8530
	st	 r0,r12,lo16(_class_binding_level)
	align	 4
@L8529:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	st	 r13,r25,28
@L8530:
	ld	 r13,r25,32
	mak	 r11,r24,3<9>
	or	 r2,r0,r25
	or	 r13,r13,160
	or.u	 r12,r0,hi16(_current_binding_level)
	and	 r13,r13,0xf0ff
	st	 r2,r12,lo16(_current_binding_level)
	or	 r13,r13,r11
	bsr.n	 _GNU_xref_start_scope
	st	 r13,r2,32
	or.u	 r11,r0,hi16(_current_function_assigns_this)
	ld	 r12,r11,lo16(_current_function_assigns_this)
	or.u	 r13,r0,hi16(_keep_next_level_flag)
	bcnd.n	 eq0,r12,@L8531
	st	 r0,r13,lo16(_keep_next_level_flag)
	or.u	 r13,r0,hi16(_current_function_just_assigned_this)
	st	 r0,r11,lo16(_current_function_assigns_this)
	st	 r0,r13,lo16(_current_function_just_assigned_this)
@L8531:
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r2,r13,lo16(_current_class_type)
	ld	 r13,r2,24
	ld	 r12,r2,8
	and	 r13,r13,0xefff
	bb1.n	 (31-25),r12,@L8533
	st	 r13,r2,24
	ld	 r13,r2,80
	ld	 r13,r0,r13
	bb0.n	 (31-20),r13,@L8532
	or	 r4,r0,r22
@L8533:
	or.u	 r13,r0,hi16(_C_C_D)
	or	 r5,r0,520
	ld	 r3,r13,lo16(_C_C_D)
	or.u	 r13,r0,hi16(_integer_zero_node)
	ld	 r4,r13,lo16(_integer_zero_node)
	br.n	 @L9174
	or	 r6,r0,0
	align	 4
@L8532:
	or	 r5,r0,520
	or.u	 r13,r0,hi16(_C_C_D)
	or	 r6,r0,0
	ld	 r3,r13,lo16(_C_C_D)
@L9174:
	bsr.n	 _build_delete
	or	 r7,r0,0
	or	 r25,r0,r2
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r25,r13
	bb0	 ne,r13,@L8535
	ld.bu	 r13,r25,8
	cmp	 r13,r13,102
	bb1.n	 ne,r13,@L9187
	or.u	 r13,r0,hi16(_dtor_label)
	or.u	 r13,r0,hi16(_integer_zero_node)
	ld	 r12,r25,16
	ld	 r13,r13,lo16(_integer_zero_node)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L9187
	or.u	 r13,r0,hi16(_dtor_label)
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r13,r13,lo16(_current_class_type)
	ld	 r13,r13,8
	bb0.n	 (31-25),r13,@L8535
	or.u	 r13,r0,hi16(_dtor_label)
@L9187:
	bsr.n	 _expand_label
	ld	 r2,r13,lo16(_dtor_label)
	or.u	 r13,r0,hi16(_integer_one_node)
	ld	 r13,r13,lo16(_integer_one_node)
	cmp	 r13,r23,r13
	bb0.n	 ne,r13,@L8537
	or	 r2,r0,r23
	bsr.n	 _expand_start_cond
	or	 r3,r0,0
@L8537:
	or.u	 r13,r0,hi16(_void_zero_node)
	ld	 r13,r13,lo16(_void_zero_node)
	cmp	 r13,r25,r13
	bb0.n	 ne,r13,@L9188
	or.u	 r13,r0,hi16(_current_class_type)
	bsr.n	 _expand_expr_stmt
	or	 r2,r0,r25
	or.u	 r13,r0,hi16(_current_class_type)
@L9188:
	ld	 r12,r13,lo16(_current_class_type)
	ld	 r13,r12,8
	bb0	 (31-25),r13,@L8539
	ld	 r13,r12,80
	bsr.n	 _copy_list
	ld	 r2,r13,40
	bsr	 _nreverse
	or.u	 r13,r0,hi16(_integer_type_node)
	or	 r25,r0,r2
	ld	 r3,r13,lo16(_integer_type_node)
	or.u	 r13,r0,hi16(_integer_two_node)
	or	 r2,r0,83
	ld	 r5,r13,lo16(_integer_two_node)
	bsr.n	 _build
	or	 r4,r0,r22
	bsr.n	 _expand_start_cond
	or	 r3,r0,0
	bcnd	 eq0,r25,@L8541
	or.u	 r24,r0,hi16(_current_class_decl)
@L8542:
	ld	 r13,r25,4
	ld	 r13,r13,24
	bb0	 (31-21),r13,@L8543
	ld	 r3,r24,lo16(_current_class_decl)
	bsr.n	 _convert_pointer_to_vbase
	or	 r2,r0,r25
	or	 r5,r0,552
	or.u	 r12,r0,hi16(_integer_zero_node)
	ld	 r13,r25,4
	or	 r6,r0,0
	ld	 r4,r12,lo16(_integer_zero_node)
	or	 r3,r0,r2
	ld	 r2,r13,32
	bsr.n	 _build_delete
	or	 r7,r0,0
	bsr	 _expand_expr_stmt
@L8543:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L8542
@L8541:
	bsr	 _expand_end_cond
@L8539:
	bsr	 _do_pending_stack_adjust
	or.u	 r13,r0,hi16(_integer_one_node)
	ld	 r13,r13,lo16(_integer_one_node)
	cmp	 r13,r23,r13
	bb0	 ne,r13,@L8535
	bsr	 _expand_end_cond
@L8535:
	or.u	 r25,r0,hi16(_current_class_type)
	ld	 r2,r25,lo16(_current_class_type)
	ld	 r13,r2,24
	or	 r13,r13,4096
	bsr.n	 _c_sizeof
	st	 r13,r2,24
	ld	 r12,r25,lo16(_current_class_type)
	ld	 r13,r12,80
	ld	 r13,r0,r13
	bb0.n	 (31-20),r13,@L8546
	or	 r25,r0,r2
	ld	 r3,r12,32
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r4,r13,lo16(_error_mark_node)
	bsr.n	 _build1
	or	 r2,r0,102
	or	 r23,r0,r2
	or.u	 r13,r0,hi16(_ansi_opname+492)
	or	 r2,r0,0
	ld	 r24,r13,lo16(_ansi_opname+492)
	or.u	 r13,r0,hi16(_current_class_decl)
	or	 r3,r0,r25
	bsr.n	 _build_tree_list
	ld	 r25,r13,lo16(_current_class_decl)
	or	 r4,r0,r2
	or	 r2,r0,0
	bsr.n	 _tree_cons
	or	 r3,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r24
	or	 r5,r0,0
	bsr.n	 _build_method_call
	or	 r6,r0,3
	br.n	 @L8547
	or	 r25,r0,r2
	align	 4
@L8546:
	ld	 r13,r12,8
	bb0.n	 (31-25),r13,@L8548
	or.u	 r13,r0,hi16(_ptr_type_node)
	ld	 r2,r13,lo16(_ptr_type_node)
	or.u	 r13,r0,hi16(_current_class_decl)
	or	 r4,r0,0
	ld	 r3,r13,lo16(_current_class_decl)
	bsr.n	 _build_x_delete
	or	 r5,r0,r25
	br.n	 @L8547
	or	 r25,r0,r2
	align	 4
@L8548:
	or	 r25,r0,0
@L8547:
	bcnd.n	 eq0,r25,@L8550
	or.u	 r13,r0,hi16(_integer_type_node)
	ld	 r3,r13,lo16(_integer_type_node)
	or.u	 r13,r0,hi16(_integer_one_node)
	or	 r2,r0,83
	ld	 r5,r13,lo16(_integer_one_node)
	bsr.n	 _build
	or	 r4,r0,r22
	bsr.n	 _expand_start_cond
	or	 r3,r0,0
	bsr.n	 _expand_expr_stmt
	or	 r2,r0,r25
	bsr	 _expand_end_cond
@L8550:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	or	 r20,r0,2
	ld	 r13,r13,32
	or	 r21,r0,0
	or	 r24,r0,0
	mask	 r17,r13,61440
	mask	 r13,r13,3584
	cmp	 r12,r17,12288
	cmp	 r13,r13,1024
	bb1.n	 ne,r13,@L8552
	extu	 r17,r12,1<eq>
	or	 r21,r0,r24
@L8552:
	bcnd.n	 lt0,r21,@L8554
	st	 r0,r31,124
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r18,r13,4
	br	 @L8555
	align	 4
@L8554:
	or	 r18,r0,0
@L8555:
	bcnd.n	 lt0,r21,@L8556
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r22,r13,20
	br.n	 @L9189
	or.u	 r25,r0,hi16(_current_binding_level)
	align	 4
@L8556:
	or	 r22,r0,0
	or.u	 r25,r0,hi16(_current_binding_level)
@L9189:
	ld	 r2,r25,lo16(_current_binding_level)
	ld	 r6,r2,32
	extu	 r4,r6,4<12>
	extu	 r5,r6,3<9>
	ld	 r3,r2,28
	bsr.n	 _GNU_xref_end_scope
	extu	 r6,r6,1<8>
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r12,32
	mask	 r13,r13,3584
	cmp	 r13,r13,512
	bb1	 ne,r13,@L8559
	or	 r20,r0,1
@L8559:
	ld	 r24,r0,r12
	bcnd.n	 eq0,r24,@L8562
	or	 r25,r0,r24
	or.u	 r23,r0,0x1d00
@L8564:
	ld	 r12,r25,8
	mask.u	 r13,r12,0xff01
	cmp	 r13,r13,r23
	bb1	 ne,r13,@L8563
	ld	 r13,r25,48
	bcnd	 eq0,r13,@L8563
	bb0	 (31-11),r12,@L8563
	bsr.n	 _output_inline_function
	or	 r2,r0,r25
@L8563:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L8564
@L8562:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r13,24
	cmp	 r13,r12,0
	extu	 r15,r13,1<ne>
	bcnd.n	 eq0,r15,@L8567
	or	 r23,r0,0
	br.n	 @L8568
	or	 r23,r0,r12
	align	 4
@L8567:
	cmp	 r13,r20,1
	subu	 r12,r0,r21
	extu	 r13,r13,1<eq>
	or	 r13,r13,r12
	bcnd	 eq0,r13,@L8568
	bsr.n	 _make_node
	or	 r2,r0,5
	or	 r23,r0,r2
@L8568:
	bcnd	 eq0,r23,@L8570
	st	 r24,r23,16
	st	 r18,r23,20
	or	 r2,r0,r23
	bsr.n	 _remember_end_note
	st	 r22,r23,24
@L8570:
	bcnd	 lt0,r20,@L8571
	bcnd.n	 eq0,r22,@L8571
	or	 r25,r0,r22
@L8575:
	st	 r23,r25,28
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L8575
@L8571:
	or	 r25,r0,r24
	bcnd.n	 eq0,r25,@L9190
	or.u	 r13,r0,hi16(_current_binding_level)
@L8580:
	ld	 r13,r25,32
	bcnd	 eq0,r13,@L8579
	ld	 r13,r25,28
	bb0	 (31-8),r13,@L8582
	ld	 r13,r25,8
	bb0	 (31-16),r13,@L9238
	ld	 r12,r25,60
	ld	 r13,r12,8
	or	 r13,r13,32768
	st	 r13,r12,8
	ld	 r13,r25,8
@L9238:
	bb0	 (31-11),r13,@L8582
	ld	 r12,r25,60
	ld	 r13,r12,8
	or.u	 r13,r13,0x10
	st	 r13,r12,8
@L8582:
	ld	 r13,r25,32
	st	 r0,r13,24
@L8579:
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L8580
	or.u	 r13,r0,hi16(_current_binding_level)
@L9190:
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r25,r13,8
	bcnd.n	 eq0,r25,@L9191
	or.u	 r13,r0,hi16(_current_binding_level)
@L8589:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,24
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L8589
	or.u	 r13,r0,hi16(_current_binding_level)
@L9191:
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r25,r13,12
	bcnd.n	 eq0,r25,@L9192
	or.u	 r13,r0,hi16(_current_binding_level)
@L8594:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,28
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L8594
	or.u	 r13,r0,hi16(_current_binding_level)
@L9192:
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r25,r13,16
	bcnd	 eq0,r25,@L8597
@L8599:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,4
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L8599
@L8597:
	bcnd.n	 eq0,r21,@L8601
	or.u	 r13,r0,hi16(_named_labels)
	ld	 r25,r13,lo16(_named_labels)
	bcnd.n	 eq0,r25,@L9239
	st	 r0,r23,16
@L8605:
	ld	 r24,r25,16
	ld	 r13,r24,48
	bcnd.n	 ne0,r13,@L8606
	or.u	 r13,r0,hi16(_warn_unused)
	or.u	 r3,r0,hi16(@LC1)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC1)
	ld	 r4,r24,32
	or.u	 r13,r0,hi16(_input_filename)
	ld	 r2,r13,lo16(_input_filename)
	or	 r3,r0,1
	bsr.n	 _define_label
	addu	 r1,r1,@L9254
@L9255:
	align	 4
@L8606:
	ld	 r13,r13,lo16(_warn_unused)
	bcnd	 eq0,r13,@L8607
	ld	 r13,r24,8
	bb1	 (31-16),r13,@L8607
	or.u	 r3,r0,hi16(@LC2)
	or	 r2,r0,r24
	bsr.n	 _warning_with_decl
	or	 r3,r3,lo16(@LC2)
@L8607:
	ld	 r13,r24,32
	ld	 r13,r13,36
	bcnd.n	 ne0,r13,@L8610
	or	 r2,r0,1
	bsr.n	 _perm_calloc
	or	 r3,r0,20
	ld	 r13,r24,32
	st	 r2,r13,36
@L8610:
	ld	 r13,r24,32
	ld	 r13,r13,36
	st	 r0,r0,r13
	ld	 r13,r23,16
	st	 r13,r0,r24
	st	 r24,r23,16
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L8605
	or.u	 r13,r0,hi16(_named_labels)
@L9239:
	st	 r0,r13,lo16(_named_labels)
@L8601:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r10,r13,lo16(_current_binding_level)
	ld	 r11,r10,28
	bcnd.n	 eq0,r11,@L8612
	or.u	 r13,r0,hi16(_named_label_uses)
	ld	 r12,r13,lo16(_named_label_uses)
	bcnd.n	 eq0,r12,@L9193
	or.u	 r13,r0,hi16(_current_binding_level)
@L8616:
	ld	 r13,r12,4
	cmp	 r13,r13,r10
	bb1	 ne,r13,@L8615
	st	 r11,r12,4
	ld	 r13,r0,r11
	st	 r13,r12,12
@L8615:
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L8616
@L8612:
	or.u	 r13,r0,hi16(_current_binding_level)
@L9193:
	ld	 r11,r13,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r11,32
	ld	 r13,r13,lo16(_global_binding_level)
	bcnd.n	 eq0,r13,@L8620
	extu	 r24,r12,3<9>
	cmp	 r13,r11,r13
	bb1.n	 ne,r13,@L9194
	or.u	 r9,r0,hi16(_current_binding_level)
	bsr.n	 _my_friendly_abort
	or	 r2,r0,123
@L8620:
	or.u	 r9,r0,hi16(_current_binding_level)
@L9194:
	or.u	 r11,r0,hi16(_free_binding_level)
	ld	 r12,r9,lo16(_current_binding_level)
	ld	 r13,r11,lo16(_free_binding_level)
	ld	 r10,r12,28
	st	 r13,r12,28
	ld	 r13,r10,32
	mask	 r13,r13,61440
	st	 r12,r11,lo16(_free_binding_level)
	cmp	 r13,r13,8192
	bb0.n	 eq,r13,@L8619
	st	 r10,r9,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_class_binding_level)
	or	 r11,r0,r9
	st	 r10,r13,lo16(_class_binding_level)
@L8623:
	ld	 r13,r11,lo16(_current_binding_level)
	ld	 r12,r13,28
	ld	 r13,r12,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb1.n	 eq,r13,@L8623
	st	 r12,r11,lo16(_current_binding_level)
@L8619:
	bcnd.n	 eq0,r21,@L8627
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r13,r13,lo16(_current_function_decl)
	br.n	 @L8628
	st	 r23,r13,48
	align	 4
@L8627:
	bcnd	 eq0,r23,@L8629
	bcnd.n	 ne0,r15,@L9195
	cmp	 r13,r24,2
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r2,r13,20
	br.n	 @L9175
	or	 r3,r0,r23
	align	 4
@L8629:
	bcnd.n	 eq0,r22,@L8628
	cmp	 r13,r20,2
	bb1.n	 ne,r13,@L8633
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r3,r13,20
	br.n	 @L9175
	or	 r2,r0,r22
	align	 4
@L8633:
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r2,r13,20
	or	 r3,r0,r22
@L9175:
	bsr	 _chainon
	ld	 r13,r25,lo16(_current_binding_level)
	st	 r2,r13,20
@L8628:
	cmp	 r13,r24,2
@L9195:
	cmp	 r12,r17,0
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L8635
	bsr	 _getdecls
	or	 r3,r0,r20
	bsr.n	 _expand_end_bindings
	or	 r4,r0,1
	ld	 r4,r31,124
	or	 r2,r0,r20
	bsr.n	 _poplevel
	or	 r3,r0,0
	or	 r23,r0,r2
@L8635:
	bcnd	 eq0,r23,@L8551
	ld	 r13,r23,8
	or	 r13,r13,32768
	st	 r13,r23,8
@L8551:
	bsr	 _get_last_insn
	bsr.n	 _get_first_nonparm_insn
	or	 r20,r0,r2
	or	 r24,r0,r2
	bcnd	 ne0,r24,@L8637
	or	 r24,r0,r20
	br.n	 @L9249
	or.u	 r13,r0,hi16(_current_class_type)
	align	 4
@L8637:
	bsr.n	 _previous_insn
	or	 r2,r0,r24
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_current_class_type)
@L9249:
	ld	 r13,r13,lo16(_current_class_type)
	ld	 r13,r13,80
	ld	 r13,r13,36
	bcnd	 eq0,r13,@L8639
	or	 r25,r0,r13
	ld	 r13,r0,r25
	bcnd	 eq0,r13,@L8641
	or.u	 r22,r0,hi16(_current_class_decl)
	or.u	 r23,r0,hi16(_error_mark_node)
@L8643:
	ld	 r2,r25,12
	ld	 r4,r22,lo16(_current_class_decl)
	bcnd	 eq0,r2,@L8644
	bsr.n	 _convert_pointer_to
	or	 r3,r0,r4
	or	 r4,r0,r2
@L8644:
	ld	 r13,r23,lo16(_error_mark_node)
	cmp	 r13,r4,r13
	bb1	 eq,r13,@L8642
	ld	 r3,r25,16
	bsr.n	 _build_virtual_init
	ld	 r2,r31,148
	bsr	 _expand_expr_stmt
@L8642:
	ld	 r25,r0,r25
	ld	 r13,r0,r25
	bcnd	 ne0,r13,@L8643
@L8641:
	ld	 r2,r31,148
	or.u	 r13,r0,hi16(_current_class_decl)
	ld	 r3,r31,148
	bsr.n	 _build_virtual_init
	ld	 r4,r13,lo16(_current_class_decl)
	bsr	 _expand_expr_stmt
@L8639:
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r13,r13,lo16(_current_class_type)
	ld	 r13,r13,8
	bb0.n	 (31-25),r13,@L8647
	or.u	 r13,r0,hi16(_C_C_D)
	ld	 r2,r31,148
	ld	 r4,r13,lo16(_C_C_D)
	or.u	 r13,r0,hi16(_current_class_decl)
	or	 r6,r0,0
	ld	 r5,r13,lo16(_current_class_decl)
	bsr.n	 _build_vbase_vtables_init
	or	 r3,r0,r2
	bsr	 _expand_expr_stmt
@L8647:
	bcnd.n	 ne0,r16,@L8648
	or.u	 r13,r0,hi16(_current_class_decl)
	ld	 r3,r13,lo16(_current_class_decl)
	or.u	 r13,r0,hi16(_integer_zero_node)
	ld	 r4,r13,lo16(_integer_zero_node)
	bsr.n	 _build_binary_op
	or	 r2,r0,96
	bsr.n	 _expand_start_cond
	or	 r3,r0,0
@L8648:
	bsr	 _get_last_insn
	cmp	 r2,r20,r2
	bb0	 ne,r2,@L8649
	bsr.n	 _next_insn
	or	 r2,r0,r20
	bsr.n	 _get_last_insn
	or	 r25,r0,r2
	or	 r4,r0,r24
	or	 r3,r0,r2
	bsr.n	 _reorder_insns
	or	 r2,r0,r25
@L8649:
	bcnd.n	 ne0,r16,@L9196
	or.u	 r13,r0,hi16(_flag_gc)
	bsr.n	 _expand_end_cond
	addu	 r1,r1,@L9256
@L9257:
	align	 4
@L8496:
	or.u	 r13,r0,hi16(_current_function_assigns_this)
	ld	 r13,r13,lo16(_current_function_assigns_this)
	bcnd.n	 eq0,r13,@L8652
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r12,r13,lo16(_current_function_decl)
	ld	 r13,r12,80
	ld	 r13,r0,r13
	bb0.n	 (31-9),r13,@L8653
	or.u	 r25,r0,hi16(_ctor_label)
	bsr.n	 _expand_label
	ld	 r2,r25,lo16(_ctor_label)
	bcnd.n	 eq0,r15,@L8654
	st	 r0,r25,lo16(_ctor_label)
	or.u	 r13,r0,hi16(_flag_handle_exceptions)
	or.u	 r23,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_flag_handle_exceptions)
	ld	 r12,r23,lo16(_current_binding_level)
	cmp	 r13,r13,2
	ld	 r24,r0,r12
	bb1.n	 ne,r13,@L9197
	cmp	 r25,r24,0
	bsr	 _deactivate_exception_cleanups
@L9197:
	or	 r2,r0,r24
	extu	 r25,r25,1<ne>
	or	 r4,r0,0
	bsr.n	 _expand_end_bindings
	or	 r3,r0,r25
	ld	 r13,r23,lo16(_current_binding_level)
	or	 r21,r0,0
	ld	 r13,r13,32
	or	 r24,r0,0
	or	 r18,r0,r25
	mask	 r17,r13,61440
	mask	 r13,r13,3584
	cmp	 r12,r17,12288
	cmp	 r13,r13,1024
	bb1.n	 ne,r13,@L8658
	extu	 r17,r12,1<eq>
	or	 r21,r0,r24
@L8658:
	bcnd.n	 lt0,r21,@L8660
	or	 r15,r0,0
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r20,r13,4
	br	 @L8661
	align	 4
@L8660:
	or	 r20,r0,0
@L8661:
	bcnd.n	 lt0,r21,@L8662
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r22,r13,20
	br.n	 @L9198
	or.u	 r25,r0,hi16(_current_binding_level)
	align	 4
@L8662:
	or	 r22,r0,0
	or.u	 r25,r0,hi16(_current_binding_level)
@L9198:
	ld	 r2,r25,lo16(_current_binding_level)
	ld	 r6,r2,32
	extu	 r4,r6,4<12>
	extu	 r5,r6,3<9>
	ld	 r3,r2,28
	bsr.n	 _GNU_xref_end_scope
	extu	 r6,r6,1<8>
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r12,32
	mask	 r13,r13,3584
	cmp	 r13,r13,512
	bb1	 ne,r13,@L8665
	or	 r18,r0,1
@L8665:
	ld	 r24,r0,r12
	bcnd.n	 eq0,r24,@L8668
	or	 r25,r0,r24
	or.u	 r23,r0,0x1d00
@L8670:
	ld	 r12,r25,8
	mask.u	 r13,r12,0xff01
	cmp	 r13,r13,r23
	bb1	 ne,r13,@L8669
	ld	 r13,r25,48
	bcnd	 eq0,r13,@L8669
	bb0	 (31-11),r12,@L8669
	bsr.n	 _output_inline_function
	or	 r2,r0,r25
@L8669:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L8670
@L8668:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r13,24
	cmp	 r13,r12,0
	extu	 r16,r13,1<ne>
	bcnd.n	 eq0,r16,@L8673
	or	 r23,r0,0
	br.n	 @L8674
	or	 r23,r0,r12
	align	 4
@L8673:
	subu	 r13,r0,r21
	or	 r13,r13,r18
	bcnd	 eq0,r13,@L8674
	bsr.n	 _make_node
	or	 r2,r0,5
	or	 r23,r0,r2
@L8674:
	bcnd	 eq0,r23,@L8676
	st	 r24,r23,16
	st	 r20,r23,20
	or	 r2,r0,r23
	bsr.n	 _remember_end_note
	st	 r22,r23,24
@L8676:
	bcnd	 lt0,r18,@L8677
	bcnd.n	 eq0,r22,@L8677
	or	 r25,r0,r22
@L8681:
	st	 r23,r25,28
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L8681
@L8677:
	or	 r25,r0,r24
	bcnd.n	 eq0,r25,@L9199
	or.u	 r13,r0,hi16(_current_binding_level)
@L8686:
	ld	 r13,r25,32
	bcnd	 eq0,r13,@L8685
	ld	 r13,r25,28
	bb0	 (31-8),r13,@L8688
	ld	 r13,r25,8
	bb0	 (31-16),r13,@L9240
	ld	 r12,r25,60
	ld	 r13,r12,8
	or	 r13,r13,32768
	st	 r13,r12,8
	ld	 r13,r25,8
@L9240:
	bb0	 (31-11),r13,@L8688
	ld	 r12,r25,60
	ld	 r13,r12,8
	or.u	 r13,r13,0x10
	st	 r13,r12,8
@L8688:
	ld	 r13,r25,32
	st	 r0,r13,24
@L8685:
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L8686
	or.u	 r13,r0,hi16(_current_binding_level)
@L9199:
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r25,r13,8
	bcnd.n	 eq0,r25,@L9200
	or.u	 r13,r0,hi16(_current_binding_level)
@L8695:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,24
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L8695
	or.u	 r13,r0,hi16(_current_binding_level)
@L9200:
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r25,r13,12
	bcnd.n	 eq0,r25,@L9201
	or.u	 r13,r0,hi16(_current_binding_level)
@L8700:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,28
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L8700
	or.u	 r13,r0,hi16(_current_binding_level)
@L9201:
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r25,r13,16
	bcnd	 eq0,r25,@L8703
@L8705:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,4
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L8705
@L8703:
	bcnd.n	 eq0,r21,@L8707
	or.u	 r13,r0,hi16(_named_labels)
	ld	 r25,r13,lo16(_named_labels)
	bcnd.n	 eq0,r25,@L9241
	st	 r0,r23,16
@L8711:
	ld	 r24,r25,16
	ld	 r13,r24,48
	bcnd.n	 ne0,r13,@L8712
	or.u	 r13,r0,hi16(_warn_unused)
	or.u	 r3,r0,hi16(@LC1)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC1)
	ld	 r4,r24,32
	or.u	 r13,r0,hi16(_input_filename)
	ld	 r2,r13,lo16(_input_filename)
	or	 r3,r0,1
	bsr.n	 _define_label
	addu	 r1,r1,@L9258
@L9259:
	align	 4
@L8712:
	ld	 r13,r13,lo16(_warn_unused)
	bcnd	 eq0,r13,@L8713
	ld	 r13,r24,8
	bb1	 (31-16),r13,@L8713
	or.u	 r3,r0,hi16(@LC2)
	or	 r2,r0,r24
	bsr.n	 _warning_with_decl
	or	 r3,r3,lo16(@LC2)
@L8713:
	ld	 r13,r24,32
	ld	 r13,r13,36
	bcnd.n	 ne0,r13,@L8716
	or	 r2,r0,1
	bsr.n	 _perm_calloc
	or	 r3,r0,20
	ld	 r13,r24,32
	st	 r2,r13,36
@L8716:
	ld	 r13,r24,32
	ld	 r13,r13,36
	st	 r0,r0,r13
	ld	 r13,r23,16
	st	 r13,r0,r24
	st	 r24,r23,16
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L8711
	or.u	 r13,r0,hi16(_named_labels)
@L9241:
	st	 r0,r13,lo16(_named_labels)
@L8707:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r10,r13,lo16(_current_binding_level)
	ld	 r11,r10,28
	bcnd.n	 eq0,r11,@L8718
	or.u	 r13,r0,hi16(_named_label_uses)
	ld	 r12,r13,lo16(_named_label_uses)
	bcnd.n	 eq0,r12,@L9202
	or.u	 r13,r0,hi16(_current_binding_level)
@L8722:
	ld	 r13,r12,4
	cmp	 r13,r13,r10
	bb1	 ne,r13,@L8721
	st	 r11,r12,4
	ld	 r13,r0,r11
	st	 r13,r12,12
@L8721:
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L8722
@L8718:
	or.u	 r13,r0,hi16(_current_binding_level)
@L9202:
	ld	 r11,r13,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r11,32
	ld	 r13,r13,lo16(_global_binding_level)
	bcnd.n	 eq0,r13,@L8726
	extu	 r24,r12,3<9>
	cmp	 r13,r11,r13
	bb1.n	 ne,r13,@L9203
	or.u	 r9,r0,hi16(_current_binding_level)
	bsr.n	 _my_friendly_abort
	or	 r2,r0,123
@L8726:
	or.u	 r9,r0,hi16(_current_binding_level)
@L9203:
	or.u	 r11,r0,hi16(_free_binding_level)
	ld	 r12,r9,lo16(_current_binding_level)
	ld	 r13,r11,lo16(_free_binding_level)
	ld	 r10,r12,28
	st	 r13,r12,28
	ld	 r13,r10,32
	mask	 r13,r13,61440
	st	 r12,r11,lo16(_free_binding_level)
	cmp	 r13,r13,8192
	bb0.n	 eq,r13,@L8725
	st	 r10,r9,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_class_binding_level)
	or	 r11,r0,r9
	st	 r10,r13,lo16(_class_binding_level)
@L8729:
	ld	 r13,r11,lo16(_current_binding_level)
	ld	 r12,r13,28
	ld	 r13,r12,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb1.n	 eq,r13,@L8729
	st	 r12,r11,lo16(_current_binding_level)
@L8725:
	bcnd.n	 eq0,r21,@L8733
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r13,r13,lo16(_current_function_decl)
	br.n	 @L8734
	st	 r23,r13,48
	align	 4
@L8733:
	bcnd	 eq0,r23,@L8735
	bcnd.n	 ne0,r16,@L9204
	cmp	 r13,r24,2
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r2,r13,20
	br.n	 @L9176
	or	 r3,r0,r23
	align	 4
@L8735:
	bcnd.n	 eq0,r22,@L8734
	cmp	 r13,r18,2
	bb1.n	 ne,r13,@L8739
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r3,r13,20
	br.n	 @L9176
	or	 r2,r0,r22
	align	 4
@L8739:
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r2,r13,20
	or	 r3,r0,r22
@L9176:
	bsr	 _chainon
	ld	 r13,r25,lo16(_current_binding_level)
	st	 r2,r13,20
@L8734:
	cmp	 r13,r24,2
@L9204:
	cmp	 r12,r17,0
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L8741
	bsr	 _getdecls
	or	 r3,r0,r18
	bsr.n	 _expand_end_bindings
	or	 r4,r0,1
	or	 r2,r0,r18
	or	 r3,r0,0
	bsr.n	 _poplevel
	or	 r4,r0,r15
	or	 r23,r0,r2
@L8741:
	bcnd	 eq0,r23,@L8654
	ld	 r13,r23,8
	or	 r13,r13,32768
	st	 r13,r23,8
@L8654:
	or.u	 r13,r0,hi16(_current_class_decl)
	ld	 r2,r13,lo16(_current_class_decl)
	bsr.n	 _c_expand_return
	addu	 r1,r1,@L9260
@L9261:
	align	 4
@L8653:
	ld	 r13,r12,44
	or.u	 r12,r0,hi16(_void_type_node)
	ld	 r13,r13,4
	ld	 r12,r12,lo16(_void_type_node)
	ld	 r13,r13,64
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L8743
	or.u	 r13,r0,hi16(_return_label)
	ld	 r13,r13,lo16(_return_label)
	bcnd.n	 eq0,r13,@L8743
	or	 r2,r0,30
	or	 r3,r0,0
	bsr.n	 _build_decl
	or	 r4,r0,0
	st	 r2,r31,116
@L8743:
	or.u	 r13,r0,hi16(_current_function_assigns_this)
	st	 r0,r13,lo16(_current_function_assigns_this)
	or.u	 r13,r0,hi16(_current_function_just_assigned_this)
	st	 r0,r13,lo16(_current_function_just_assigned_this)
	or.u	 r13,r0,hi16(_base_init_insns)
	br.n	 @L8651
	st	 r0,r13,lo16(_base_init_insns)
	align	 4
@L8652:
	ld	 r13,r19,80
	ld	 r13,r0,r13
	bb0.n	 (31-9),r13,@L8746
	or.u	 r24,r0,hi16(_current_class_type)
	ld	 r10,r24,lo16(_current_class_type)
	ld	 r13,r10,80
	ld	 r21,r13,76
	st	 r0,r13,76
	ld	 r11,r19,80
	or.u	 r12,r0,hi16(_flag_this_is_variable)
	ld	 r13,r0,r11
	or.u	 r23,r0,0x20
	ld	 r12,r12,lo16(_flag_this_is_variable)
	or	 r13,r13,r23
	bcnd.n	 le0,r12,@L8747
	st	 r13,r0,r11
	or.u	 r25,r0,hi16(_current_class_decl)
	or.u	 r13,r0,hi16(_integer_zero_node)
	ld	 r3,r25,lo16(_current_class_decl)
	ld	 r4,r13,lo16(_integer_zero_node)
	bsr.n	 _build_binary_op
	or	 r2,r0,95
	ld	 r3,r24,lo16(_current_class_type)
	or.u	 r13,r0,hi16(_void_type_node)
	st	 r2,r31,132
	or	 r2,r0,0
	ld	 r4,r13,lo16(_void_type_node)
	or	 r5,r0,0
	bsr.n	 _build_new
	ld	 r25,r25,lo16(_current_class_decl)
	or	 r4,r0,r2
	or	 r2,r0,r25
	bsr.n	 _build_modify_expr
	or	 r3,r0,102
	or.u	 r13,r0,hi16(_flag_handle_exceptions)
	ld	 r13,r13,lo16(_flag_handle_exceptions)
	cmp	 r13,r13,2
	bb1.n	 ne,r13,@L8751
	st	 r2,r31,148
	bsr.n	 _c_sizeof
	ld	 r2,r24,lo16(_current_class_type)
	or	 r25,r0,r2
	or.u	 r13,r0,hi16(_ptr_type_node)
	or	 r2,r0,33
	ld	 r4,r13,lo16(_ptr_type_node)
	bsr.n	 _build_decl
	or	 r3,r0,0
	or	 r17,r0,r2
	or.u	 r12,r0,hi16(_error_mark_node)
	ld	 r13,r17,28
	ld	 r12,r12,lo16(_error_mark_node)
	st	 r12,r17,48
	or	 r13,r13,r23
	bsr.n	 _expand_decl
	st	 r13,r17,28
	bsr.n	 _expand_decl_init
	or	 r2,r0,r17
	ld	 r13,r24,lo16(_current_class_type)
	ld	 r13,r13,80
	ld	 r13,r0,r13
	bb0.n	 (31-20),r13,@L8749
	or	 r2,r0,123
	or	 r3,r0,3
	or	 r4,r0,r17
	or	 r5,r0,r25
	bsr.n	 _build_opfncall
	addu	 r1,r1,@L9262
@L9263:
	align	 4
@L8749:
	ld	 r2,r17,4
	or	 r3,r0,r17
	or	 r5,r0,35
	or.u	 r13,r0,hi16(_integer_three_node)
	or	 r6,r0,1
	ld	 r4,r13,lo16(_integer_three_node)
	bsr.n	 _build_delete
	or	 r7,r0,0
@L9177:
	or	 r22,r0,r2
	or.u	 r13,r0,hi16(_current_class_decl)
	or.u	 r25,r0,hi16(_integer_zero_node)
	ld	 r2,r13,lo16(_current_class_decl)
	ld	 r4,r25,lo16(_integer_zero_node)
	bsr.n	 _build_modify_expr
	or	 r3,r0,102
	or	 r3,r0,r2
	bsr.n	 _build_tree_list
	or	 r2,r0,0
	or	 r4,r0,r2
	or	 r2,r0,0
	bsr.n	 _tree_cons
	or	 r3,r0,r22
	ld	 r5,r25,lo16(_integer_zero_node)
	or.u	 r13,r0,hi16(_integer_type_node)
	or	 r22,r0,r2
	ld	 r23,r13,lo16(_integer_type_node)
	or	 r2,r0,96
	or	 r4,r0,r17
	bsr.n	 _build
	or	 r3,r0,r23
	or	 r24,r0,r2
	bsr.n	 _build_compound_expr
	or	 r2,r0,r22
	ld	 r6,r25,lo16(_integer_zero_node)
	or	 r5,r0,r2
	or	 r2,r0,48
	or	 r3,r0,r23
	bsr.n	 _build
	or	 r4,r0,r24
	or	 r3,r0,r2
	or	 r2,r0,r17
	bsr.n	 _expand_decl_cleanup
	addu	 r1,r1,@L9264
@L9265:
	align	 4
@L8747:
	ld	 r13,r10,80
	ld	 r13,r0,r13
	bb0	 (31-19),r13,@L8751
	ld	 r3,r10,32
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r4,r13,lo16(_error_mark_node)
	bsr.n	 _build1
	or	 r2,r0,102
	or.u	 r13,r0,hi16(_integer_zero_node)
	or	 r24,r0,r2
	ld	 r3,r13,lo16(_integer_zero_node)
	or.u	 r13,r0,hi16(_ansi_opname+508)
	or	 r2,r0,0
	bsr.n	 _build_tree_list
	ld	 r25,r13,lo16(_ansi_opname+508)
	or	 r4,r0,r2
	or	 r2,r0,r24
	or	 r5,r0,0
	or	 r6,r0,3
	bsr.n	 _build_method_call
	or	 r3,r0,r25
@L8751:
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r13,r13,lo16(_current_class_type)
	ld	 r13,r13,80
	bsr.n	 _get_insns
	st	 r21,r13,76
	bsr	 _get_last_insn
	or.u	 r13,r0,hi16(_flag_this_is_variable)
	ld	 r13,r13,lo16(_flag_this_is_variable)
	bcnd.n	 le0,r13,@L8753
	or	 r20,r0,r2
	ld	 r2,r31,132
	bsr.n	 _expand_start_cond
	or	 r3,r0,0
	bsr.n	 _expand_expr_stmt
	ld	 r2,r31,148
	or.u	 r13,r0,hi16(_flag_handle_exceptions)
	ld	 r13,r13,lo16(_flag_handle_exceptions)
	cmp	 r13,r13,2
	bb1.n	 ne,r13,@L8754
	or	 r2,r0,r17
	or.u	 r13,r0,hi16(_current_class_decl)
	or	 r4,r0,0
	ld	 r3,r13,lo16(_current_class_decl)
	bsr.n	 _expand_assignment
	or	 r5,r0,0
@L8754:
	bsr	 _expand_end_cond
@L8753:
	ld	 r13,r19,32
	bcnd	 ne0,r13,@L8755
	ld	 r13,r19,40
	ld	 r3,r0,r13
	bcnd.n	 eq0,r3,@L8755
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r5,r13,lo16(_current_class_type)
	ld	 r13,r5,68
	ld	 r12,r13,32
	bcnd.n	 eq0,r12,@L8757
	or	 r24,r0,0
	ld	 r24,r12,12
@L8757:
	ld	 r13,r5,8
	ld	 r23,r5,12
	bb0.n	 (31-25),r13,@L8759
	or	 r21,r0,r3
	ld	 r21,r0,r21
@L8759:
	subu	 r24,r24,1
	ld	 r21,r21,40
	bcnd	 lt0,r24,@L8761
	lda	 r25,r12[r24]
	xor.c	 r13,r24,r0
	or.u	 r22,r0,hi16(_current_base_init_list)
	bcnd.n	 lt0,r24,@L9119
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L8762
	cmp	 r13,r12,3
	bb1.n	 ge,r13,@L9119
	cmp	 r13,r12,2
	bb1	 ge,r13,@L9120
	ld	 r2,r25,16
	ld	 r13,r2,80
	ld	 r13,r0,r13
	bb0	 (31-4),r13,@L9122
	ld	 r2,r2,48
	ld.bu	 r13,r2,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L9124
	ld	 r2,r2,32
@L9124:
	ld	 r4,r22,lo16(_current_base_init_list)
	bsr.n	 _tree_cons
	or	 r3,r0,r21
	st	 r2,r22,lo16(_current_base_init_list)
@L9122:
	subu	 r25,r25,4
	subu	 r24,r24,1
@L9120:
	ld	 r2,r25,16
	ld	 r13,r2,80
	ld	 r13,r0,r13
	bb0	 (31-4),r13,@L9126
	ld	 r2,r2,48
	ld.bu	 r13,r2,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L9128
	ld	 r2,r2,32
@L9128:
	ld	 r4,r22,lo16(_current_base_init_list)
	bsr.n	 _tree_cons
	or	 r3,r0,r21
	st	 r2,r22,lo16(_current_base_init_list)
@L9126:
	subu	 r25,r25,4
	subu	 r24,r24,1
@L9119:
	ld	 r2,r25,16
	ld	 r13,r2,80
	ld	 r13,r0,r13
	bb0	 (31-4),r13,@L9130
	ld	 r2,r2,48
	ld.bu	 r13,r2,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L9132
	ld	 r2,r2,32
@L9132:
	ld	 r4,r22,lo16(_current_base_init_list)
	bsr.n	 _tree_cons
	or	 r3,r0,r21
	st	 r2,r22,lo16(_current_base_init_list)
@L9130:
	subu	 r24,r24,1
	bcnd.n	 lt0,r24,@L8761
	subu	 r25,r25,4
@L8762:
	ld	 r2,r25,16
	ld	 r13,r2,80
	ld	 r13,r0,r13
	bb0	 (31-4),r13,@L9134
	ld	 r2,r2,48
	ld.bu	 r13,r2,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L9136
	ld	 r2,r2,32
@L9136:
	ld	 r4,r22,lo16(_current_base_init_list)
	bsr.n	 _tree_cons
	or	 r3,r0,r21
	st	 r2,r22,lo16(_current_base_init_list)
@L9134:
	ld	 r2,r25,12
	ld	 r13,r2,80
	ld	 r13,r0,r13
	bb0	 (31-4),r13,@L9138
	ld	 r2,r2,48
	ld.bu	 r13,r2,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L9140
	ld	 r2,r2,32
@L9140:
	ld	 r4,r22,lo16(_current_base_init_list)
	bsr.n	 _tree_cons
	or	 r3,r0,r21
	st	 r2,r22,lo16(_current_base_init_list)
@L9138:
	ld	 r2,r25,8
	ld	 r13,r2,80
	ld	 r13,r0,r13
	bb0	 (31-4),r13,@L9142
	ld	 r2,r2,48
	ld.bu	 r13,r2,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L9144
	ld	 r2,r2,32
@L9144:
	ld	 r4,r22,lo16(_current_base_init_list)
	bsr.n	 _tree_cons
	or	 r3,r0,r21
	st	 r2,r22,lo16(_current_base_init_list)
@L9142:
	ld	 r2,r25,4
	ld	 r13,r2,80
	ld	 r13,r0,r13
	bb0	 (31-4),r13,@L9146
	ld	 r2,r2,48
	ld.bu	 r13,r2,8
	cmp	 r13,r13,32
	bb1	 ne,r13,@L9148
	ld	 r2,r2,32
@L9148:
	ld	 r4,r22,lo16(_current_base_init_list)
	bsr.n	 _tree_cons
	or	 r3,r0,r21
	st	 r2,r22,lo16(_current_base_init_list)
@L9146:
	subu	 r24,r24,4
	bcnd.n	 ge0,r24,@L8762
	subu	 r25,r25,16
@L8761:
	bcnd	 eq0,r23,@L8755
	or.u	 r22,r0,hi16(_current_member_init_list)
@L8769:
	ld	 r13,r23,8
	bb1	 (31-18),r13,@L8768
	ld.bu	 r13,r23,8
	cmp	 r13,r13,36
	bb1	 ne,r13,@L8768
	ld	 r13,r23,32
	bcnd	 eq0,r13,@L8772
	ld	 r2,r13,16
	or.u	 r3,r0,hi16(@LC429)
	or	 r4,r0,6
	bsr.n	 _strncmp
	or	 r3,r3,lo16(@LC429)
	bcnd	 eq0,r2,@L8768
	ld	 r13,r23,32
	ld	 r12,r13,16
	ld.b	 r13,r12,3
	cmp	 r13,r13,36
	bb1	 ne,r13,@L8774
	ld.b	 r13,r12,2
	cmp	 r13,r13,98
	bb1	 ne,r13,@L8774
	ld.b	 r13,r12,1
	cmp	 r13,r13,118
	bb1	 eq,r13,@L8768
@L8774:
	ld	 r13,r23,32
	ld	 r13,r13,28
	cmp	 r13,r13,r23
	bb1	 ne,r13,@L8768
@L8772:
	ld	 r3,r23,4
	or	 r2,r0,37
	or	 r4,r0,r21
	bsr.n	 _build
	or	 r5,r0,r23
	ld	 r13,r23,28
	bb0.n	 (31-10),r13,@L8776
	or	 r24,r0,r2
	ld	 r3,r23,4
	or.u	 r13,r0,hi16(_C_C_D)
	or	 r2,r0,37
	ld	 r4,r13,lo16(_C_C_D)
	bsr.n	 _build
	or	 r5,r0,r23
	br.n	 @L8777
	or	 r25,r0,r2
	align	 4
@L8776:
	or	 r2,r0,0
	or	 r3,r0,r24
	bsr.n	 _build_tree_list
	ld	 r25,r23,32
	or	 r24,r0,r2
@L8777:
	or	 r2,r0,r25
	ld	 r4,r22,lo16(_current_member_init_list)
	bsr.n	 _tree_cons
	or	 r3,r0,r24
	st	 r2,r22,lo16(_current_member_init_list)
@L8768:
	ld	 r23,r0,r23
	bcnd	 ne0,r23,@L8769
@L8755:
	or.u	 r25,r0,hi16(_base_init_insns)
	bsr.n	 _emit_insns
	ld	 r2,r25,lo16(_base_init_insns)
	bsr.n	 _get_first_nonparm_insn
	st	 r0,r25,lo16(_base_init_insns)
	or	 r24,r0,r2
	bcnd	 ne0,r24,@L8779
	or	 r24,r0,r20
	br	 @L8780
	align	 4
@L8779:
	bsr.n	 _previous_insn
	or	 r2,r0,r24
	or	 r24,r0,r2
@L8780:
	bsr	 _get_last_insn
	cmp	 r2,r20,r2
	bb0.n	 ne,r2,@L9205
	or.u	 r25,r0,hi16(_ctor_label)
	bsr.n	 _next_insn
	or	 r2,r0,r20
	bsr.n	 _get_last_insn
	or	 r25,r0,r2
	or	 r4,r0,r24
	or	 r3,r0,r2
	bsr.n	 _reorder_insns
	or	 r2,r0,r25
	or.u	 r25,r0,hi16(_ctor_label)
@L9205:
	bsr.n	 _expand_label
	ld	 r2,r25,lo16(_ctor_label)
	or.u	 r13,r0,hi16(_flag_handle_exceptions)
	ld	 r13,r13,lo16(_flag_handle_exceptions)
	cmp	 r13,r13,2
	bb1.n	 ne,r13,@L8782
	st	 r0,r25,lo16(_ctor_label)
	or	 r2,r0,r17
	or.u	 r13,r0,hi16(_integer_zero_node)
	or	 r4,r0,0
	ld	 r3,r13,lo16(_integer_zero_node)
	bsr.n	 _expand_assignment
	or	 r5,r0,0
	bcnd	 eq0,r15,@L8782
	bsr	 _deactivate_exception_cleanups
@L8782:
	bsr.n	 _pop_implicit_try_blocks
	or	 r2,r0,0
	bcnd.n	 eq0,r15,@L8784
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r25,lo16(_current_binding_level)
	or	 r3,r0,1
	ld	 r2,r0,r13
	bsr.n	 _expand_end_bindings
	or	 r4,r0,0
	ld	 r13,r25,lo16(_current_binding_level)
	or	 r20,r0,1
	ld	 r13,r13,32
	or	 r21,r0,0
	or	 r24,r0,0
	mask	 r17,r13,61440
	mask	 r13,r13,3584
	cmp	 r12,r17,12288
	cmp	 r13,r13,1024
	bb1.n	 ne,r13,@L8787
	extu	 r17,r12,1<eq>
	or	 r21,r0,r24
@L8787:
	bcnd.n	 lt0,r21,@L8789
	or	 r15,r0,0
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r18,r13,4
	br	 @L8790
	align	 4
@L8789:
	or	 r18,r0,0
@L8790:
	bcnd.n	 lt0,r21,@L8791
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r22,r13,20
	br.n	 @L9206
	or.u	 r25,r0,hi16(_current_binding_level)
	align	 4
@L8791:
	or	 r22,r0,0
	or.u	 r25,r0,hi16(_current_binding_level)
@L9206:
	ld	 r2,r25,lo16(_current_binding_level)
	ld	 r6,r2,32
	extu	 r4,r6,4<12>
	extu	 r5,r6,3<9>
	ld	 r3,r2,28
	bsr.n	 _GNU_xref_end_scope
	extu	 r6,r6,1<8>
	ld	 r2,r25,lo16(_current_binding_level)
	ld	 r13,r2,32
	mask	 r13,r13,3584
	cmp	 r13,r13,512
	bb1	 ne,r13,@L8793
	or	 r20,r0,1
@L8793:
	bsr.n	 _nreverse
	ld	 r2,r0,r2
	or	 r24,r0,r2
	ld	 r13,r25,lo16(_current_binding_level)
	or	 r25,r0,r24
	bcnd.n	 eq0,r24,@L8797
	st	 r24,r0,r13
	or.u	 r23,r0,0x1d00
@L8799:
	ld	 r12,r25,8
	mask.u	 r13,r12,0xff01
	cmp	 r13,r13,r23
	bb1	 ne,r13,@L8798
	ld	 r13,r25,48
	bcnd	 eq0,r13,@L8798
	bb0	 (31-11),r12,@L8798
	bsr.n	 _output_inline_function
	or	 r2,r0,r25
@L8798:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L8799
@L8797:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r13,24
	cmp	 r13,r12,0
	extu	 r16,r13,1<ne>
	bcnd.n	 eq0,r16,@L8802
	or	 r23,r0,0
	br.n	 @L8803
	or	 r23,r0,r12
	align	 4
@L8802:
	subu	 r13,r0,r21
	or	 r13,r13,r20
	bcnd	 eq0,r13,@L8803
	bsr.n	 _make_node
	or	 r2,r0,5
	or	 r23,r0,r2
@L8803:
	bcnd	 eq0,r23,@L8805
	st	 r24,r23,16
	st	 r18,r23,20
	or	 r2,r0,r23
	bsr.n	 _remember_end_note
	st	 r22,r23,24
@L8805:
	bcnd	 lt0,r20,@L8806
	bcnd.n	 eq0,r22,@L8806
	or	 r25,r0,r22
@L8810:
	st	 r23,r25,28
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L8810
@L8806:
	or	 r25,r0,r24
	bcnd.n	 eq0,r25,@L9207
	or.u	 r13,r0,hi16(_current_binding_level)
@L8815:
	ld	 r13,r25,32
	bcnd	 eq0,r13,@L8814
	ld	 r13,r25,28
	bb0	 (31-8),r13,@L8817
	ld	 r13,r25,8
	bb0	 (31-16),r13,@L9242
	ld	 r12,r25,60
	ld	 r13,r12,8
	or	 r13,r13,32768
	st	 r13,r12,8
	ld	 r13,r25,8
@L9242:
	bb0	 (31-11),r13,@L8817
	ld	 r12,r25,60
	ld	 r13,r12,8
	or.u	 r13,r13,0x10
	st	 r13,r12,8
@L8817:
	ld	 r13,r25,32
	st	 r0,r13,24
@L8814:
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L8815
	or.u	 r13,r0,hi16(_current_binding_level)
@L9207:
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r25,r13,8
	bcnd.n	 eq0,r25,@L9208
	or.u	 r13,r0,hi16(_current_binding_level)
@L8824:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,24
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L8824
	or.u	 r13,r0,hi16(_current_binding_level)
@L9208:
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r25,r13,12
	bcnd.n	 eq0,r25,@L9209
	or.u	 r13,r0,hi16(_current_binding_level)
@L8829:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,28
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L8829
	or.u	 r13,r0,hi16(_current_binding_level)
@L9209:
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r25,r13,16
	bcnd	 eq0,r25,@L8832
@L8834:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,4
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L8834
@L8832:
	bcnd.n	 eq0,r21,@L8836
	or.u	 r13,r0,hi16(_named_labels)
	ld	 r25,r13,lo16(_named_labels)
	bcnd.n	 eq0,r25,@L9243
	st	 r0,r23,16
@L8840:
	ld	 r24,r25,16
	ld	 r13,r24,48
	bcnd.n	 ne0,r13,@L8841
	or.u	 r13,r0,hi16(_warn_unused)
	or.u	 r3,r0,hi16(@LC1)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC1)
	ld	 r4,r24,32
	or.u	 r13,r0,hi16(_input_filename)
	ld	 r2,r13,lo16(_input_filename)
	or	 r3,r0,1
	bsr.n	 _define_label
	addu	 r1,r1,@L9266
@L9267:
	align	 4
@L8841:
	ld	 r13,r13,lo16(_warn_unused)
	bcnd	 eq0,r13,@L8842
	ld	 r13,r24,8
	bb1	 (31-16),r13,@L8842
	or.u	 r3,r0,hi16(@LC2)
	or	 r2,r0,r24
	bsr.n	 _warning_with_decl
	or	 r3,r3,lo16(@LC2)
@L8842:
	ld	 r13,r24,32
	ld	 r13,r13,36
	bcnd.n	 ne0,r13,@L8845
	or	 r2,r0,1
	bsr.n	 _perm_calloc
	or	 r3,r0,20
	ld	 r13,r24,32
	st	 r2,r13,36
@L8845:
	ld	 r13,r24,32
	ld	 r13,r13,36
	st	 r0,r0,r13
	ld	 r13,r23,16
	st	 r13,r0,r24
	st	 r24,r23,16
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L8840
	or.u	 r13,r0,hi16(_named_labels)
@L9243:
	st	 r0,r13,lo16(_named_labels)
@L8836:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r10,r13,lo16(_current_binding_level)
	ld	 r11,r10,28
	bcnd.n	 eq0,r11,@L8847
	or.u	 r13,r0,hi16(_named_label_uses)
	ld	 r12,r13,lo16(_named_label_uses)
	bcnd.n	 eq0,r12,@L9210
	or.u	 r13,r0,hi16(_current_binding_level)
@L8851:
	ld	 r13,r12,4
	cmp	 r13,r13,r10
	bb1	 ne,r13,@L8850
	st	 r11,r12,4
	ld	 r13,r0,r11
	st	 r13,r12,12
@L8850:
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L8851
@L8847:
	or.u	 r13,r0,hi16(_current_binding_level)
@L9210:
	ld	 r11,r13,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r11,32
	ld	 r13,r13,lo16(_global_binding_level)
	bcnd.n	 eq0,r13,@L8855
	extu	 r24,r12,3<9>
	cmp	 r13,r11,r13
	bb1.n	 ne,r13,@L9211
	or.u	 r9,r0,hi16(_current_binding_level)
	bsr.n	 _my_friendly_abort
	or	 r2,r0,123
@L8855:
	or.u	 r9,r0,hi16(_current_binding_level)
@L9211:
	or.u	 r11,r0,hi16(_free_binding_level)
	ld	 r12,r9,lo16(_current_binding_level)
	ld	 r13,r11,lo16(_free_binding_level)
	ld	 r10,r12,28
	st	 r13,r12,28
	ld	 r13,r10,32
	mask	 r13,r13,61440
	st	 r12,r11,lo16(_free_binding_level)
	cmp	 r13,r13,8192
	bb0.n	 eq,r13,@L8854
	st	 r10,r9,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_class_binding_level)
	or	 r11,r0,r9
	st	 r10,r13,lo16(_class_binding_level)
@L8858:
	ld	 r13,r11,lo16(_current_binding_level)
	ld	 r12,r13,28
	ld	 r13,r12,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb1.n	 eq,r13,@L8858
	st	 r12,r11,lo16(_current_binding_level)
@L8854:
	bcnd.n	 eq0,r21,@L8862
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r13,r13,lo16(_current_function_decl)
	br.n	 @L8863
	st	 r23,r13,48
	align	 4
@L8862:
	bcnd	 eq0,r23,@L8864
	bcnd.n	 ne0,r16,@L9212
	cmp	 r13,r24,2
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r2,r13,20
	br.n	 @L9178
	or	 r3,r0,r23
	align	 4
@L8864:
	bcnd.n	 eq0,r22,@L8863
	cmp	 r13,r20,2
	bb1.n	 ne,r13,@L8868
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r3,r13,20
	br.n	 @L9178
	or	 r2,r0,r22
	align	 4
@L8868:
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r2,r13,20
	or	 r3,r0,r22
@L9178:
	bsr	 _chainon
	ld	 r13,r25,lo16(_current_binding_level)
	st	 r2,r13,20
@L8863:
	cmp	 r13,r24,2
@L9212:
	cmp	 r12,r17,0
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L8870
	bsr	 _getdecls
	or	 r3,r0,r20
	bsr.n	 _expand_end_bindings
	or	 r4,r0,1
	or	 r2,r0,r20
	or	 r3,r0,1
	bsr.n	 _poplevel
	or	 r4,r0,r15
	or	 r23,r0,r2
@L8870:
	bcnd	 eq0,r23,@L8784
	ld	 r13,r23,8
	or	 r13,r13,32768
	st	 r13,r23,8
@L8784:
	or.u	 r13,r0,hi16(_current_class_decl)
	bsr.n	 _c_expand_return
	ld	 r2,r13,lo16(_current_class_decl)
	or.u	 r13,r0,hi16(_current_function_assigns_this)
	st	 r0,r13,lo16(_current_function_assigns_this)
	or.u	 r13,r0,hi16(_current_function_just_assigned_this)
	br.n	 @L8651
	st	 r0,r13,lo16(_current_function_just_assigned_this)
	align	 4
@L8746:
	ld	 r12,r19,32
	ld	 r13,r12,12
	cmp	 r13,r13,4
	bb1.n	 ne,r13,@L9213
	or.u	 r13,r0,hi16(_return_label)
	or.u	 r3,r0,hi16(@LC430)
	ld	 r2,r12,16
	bsr.n	 _strcmp
	or	 r3,r3,lo16(@LC430)
	bcnd.n	 ne0,r2,@L9213
	or.u	 r13,r0,hi16(_return_label)
	ld	 r13,r19,36
	bcnd.n	 ne0,r13,@L8873
	or.u	 r13,r0,hi16(_return_label)
	or.u	 r13,r0,hi16(_integer_zero_node)
	ld	 r2,r13,lo16(_integer_zero_node)
	bsr.n	 _c_expand_return
	addu	 r1,r1,@L9268
@L9269:
	align	 4
@L8873:
@L9213:
	ld	 r13,r13,lo16(_return_label)
	bcnd.n	 eq0,r13,@L8651
	or.u	 r13,r0,hi16(_current_function_return_value)
	ld	 r13,r13,lo16(_current_function_return_value)
	bcnd.n	 ne0,r13,@L9196
	or.u	 r13,r0,hi16(_flag_gc)
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r13,r13,lo16(_current_function_decl)
	ld	 r13,r13,44
	ld	 r13,r13,32
	bcnd.n	 ne0,r13,@L9196
	or.u	 r13,r0,hi16(_flag_gc)
	or	 r2,r0,30
	or	 r3,r0,0
	bsr.n	 _build_decl
	or	 r4,r0,0
	st	 r2,r31,116
@L8651:
	or.u	 r13,r0,hi16(_flag_gc)
@L9196:
	ld	 r13,r13,lo16(_flag_gc)
	bcnd.n	 eq0,r13,@L9214
	or.u	 r13,r0,hi16(_obey_regdecls)
	bsr	 _expand_gc_prologue_and_epilogue
	or.u	 r13,r0,hi16(_obey_regdecls)
@L9214:
	ld	 r13,r13,lo16(_obey_regdecls)
	bcnd.n	 eq0,r13,@L8877
	or.u	 r13,r0,hi16(_current_vtable_decl)
	ld	 r13,r13,lo16(_current_vtable_decl)
	bcnd	 eq0,r13,@L8877
	ld	 r13,r13,16
	bsr.n	 _use_variable
	ld	 r2,r13,64
@L8877:
	ld	 r8,r31,116
	bcnd	 eq0,r8,@L8878
	st	 r19,r8,36
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r14,r31,92
	or.u	 r12,r0,hi16(_input_filename)
	ld	 r13,r13,lo16(_error_mark_node)
	ld	 r12,r12,lo16(_input_filename)
	st	 r14,r8,16
	st	 r13,r8,48
	ld	 r2,r31,116
	bsr.n	 _expand_goto
	st	 r12,r8,12
@L8878:
	or.u	 r13,r0,hi16(_cleanup_label)
	ld	 r13,r13,lo16(_cleanup_label)
	bcnd.n	 eq0,r13,@L8879
	or	 r2,r0,0
	or	 r3,r0,0
	bsr.n	 _expand_end_bindings
	or	 r4,r0,0
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r13,r13,32
	or	 r21,r0,0
	or	 r20,r0,0
	mask	 r17,r13,61440
	mask	 r13,r13,3584
	cmp	 r12,r17,12288
	cmp	 r13,r13,1024
	bb1.n	 ne,r13,@L8881
	extu	 r17,r12,1<eq>
	or	 r20,r0,r21
@L8881:
	bcnd.n	 lt0,r20,@L8883
	or	 r15,r0,0
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r18,r13,4
	br	 @L8884
	align	 4
@L8883:
	or	 r18,r0,0
@L8884:
	bcnd.n	 lt0,r20,@L8885
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r22,r13,20
	br.n	 @L9215
	or.u	 r25,r0,hi16(_current_binding_level)
	align	 4
@L8885:
	or	 r22,r0,0
	or.u	 r25,r0,hi16(_current_binding_level)
@L9215:
	ld	 r2,r25,lo16(_current_binding_level)
	ld	 r6,r2,32
	extu	 r4,r6,4<12>
	extu	 r5,r6,3<9>
	ld	 r3,r2,28
	bsr.n	 _GNU_xref_end_scope
	extu	 r6,r6,1<8>
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r12,32
	mask	 r13,r13,3584
	cmp	 r13,r13,512
	bb1	 ne,r13,@L8888
	or	 r21,r0,1
@L8888:
	ld	 r24,r0,r12
	bcnd.n	 eq0,r24,@L8891
	or	 r25,r0,r24
	or.u	 r23,r0,0x1d00
@L8893:
	ld	 r12,r25,8
	mask.u	 r13,r12,0xff01
	cmp	 r13,r13,r23
	bb1	 ne,r13,@L8892
	ld	 r13,r25,48
	bcnd	 eq0,r13,@L8892
	bb0	 (31-11),r12,@L8892
	bsr.n	 _output_inline_function
	or	 r2,r0,r25
@L8892:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L8893
@L8891:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r13,24
	cmp	 r13,r12,0
	extu	 r16,r13,1<ne>
	bcnd.n	 eq0,r16,@L8896
	or	 r23,r0,0
	br.n	 @L8897
	or	 r23,r0,r12
	align	 4
@L8896:
	subu	 r13,r0,r20
	or	 r13,r13,r21
	bcnd	 eq0,r13,@L8897
	bsr.n	 _make_node
	or	 r2,r0,5
	or	 r23,r0,r2
@L8897:
	bcnd	 eq0,r23,@L8899
	st	 r24,r23,16
	st	 r18,r23,20
	or	 r2,r0,r23
	bsr.n	 _remember_end_note
	st	 r22,r23,24
@L8899:
	bcnd	 lt0,r21,@L8900
	bcnd.n	 eq0,r22,@L8900
	or	 r25,r0,r22
@L8904:
	st	 r23,r25,28
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L8904
@L8900:
	or	 r25,r0,r24
	bcnd.n	 eq0,r25,@L9216
	or.u	 r13,r0,hi16(_current_binding_level)
@L8909:
	ld	 r13,r25,32
	bcnd	 eq0,r13,@L8908
	ld	 r13,r25,28
	bb0	 (31-8),r13,@L8911
	ld	 r13,r25,8
	bb0	 (31-16),r13,@L9244
	ld	 r12,r25,60
	ld	 r13,r12,8
	or	 r13,r13,32768
	st	 r13,r12,8
	ld	 r13,r25,8
@L9244:
	bb0	 (31-11),r13,@L8911
	ld	 r12,r25,60
	ld	 r13,r12,8
	or.u	 r13,r13,0x10
	st	 r13,r12,8
@L8911:
	ld	 r13,r25,32
	st	 r0,r13,24
@L8908:
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L8909
	or.u	 r13,r0,hi16(_current_binding_level)
@L9216:
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r25,r13,8
	bcnd.n	 eq0,r25,@L9217
	or.u	 r13,r0,hi16(_current_binding_level)
@L8918:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,24
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L8918
	or.u	 r13,r0,hi16(_current_binding_level)
@L9217:
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r25,r13,12
	bcnd.n	 eq0,r25,@L9218
	or.u	 r13,r0,hi16(_current_binding_level)
@L8923:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,28
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L8923
	or.u	 r13,r0,hi16(_current_binding_level)
@L9218:
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r25,r13,16
	bcnd	 eq0,r25,@L8926
@L8928:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,4
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L8928
@L8926:
	bcnd.n	 eq0,r20,@L8930
	or.u	 r13,r0,hi16(_named_labels)
	ld	 r25,r13,lo16(_named_labels)
	bcnd.n	 eq0,r25,@L9245
	st	 r0,r23,16
@L8934:
	ld	 r24,r25,16
	ld	 r13,r24,48
	bcnd.n	 ne0,r13,@L8935
	or.u	 r13,r0,hi16(_warn_unused)
	or.u	 r3,r0,hi16(@LC1)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC1)
	ld	 r4,r24,32
	or.u	 r13,r0,hi16(_input_filename)
	ld	 r2,r13,lo16(_input_filename)
	or	 r3,r0,1
	bsr.n	 _define_label
	addu	 r1,r1,@L9270
@L9271:
	align	 4
@L8935:
	ld	 r13,r13,lo16(_warn_unused)
	bcnd	 eq0,r13,@L8936
	ld	 r13,r24,8
	bb1	 (31-16),r13,@L8936
	or.u	 r3,r0,hi16(@LC2)
	or	 r2,r0,r24
	bsr.n	 _warning_with_decl
	or	 r3,r3,lo16(@LC2)
@L8936:
	ld	 r13,r24,32
	ld	 r13,r13,36
	bcnd.n	 ne0,r13,@L8939
	or	 r2,r0,1
	bsr.n	 _perm_calloc
	or	 r3,r0,20
	ld	 r13,r24,32
	st	 r2,r13,36
@L8939:
	ld	 r13,r24,32
	ld	 r13,r13,36
	st	 r0,r0,r13
	ld	 r13,r23,16
	st	 r13,r0,r24
	st	 r24,r23,16
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L8934
	or.u	 r13,r0,hi16(_named_labels)
@L9245:
	st	 r0,r13,lo16(_named_labels)
@L8930:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r10,r13,lo16(_current_binding_level)
	ld	 r11,r10,28
	bcnd.n	 eq0,r11,@L8941
	or.u	 r13,r0,hi16(_named_label_uses)
	ld	 r12,r13,lo16(_named_label_uses)
	bcnd.n	 eq0,r12,@L9219
	or.u	 r13,r0,hi16(_current_binding_level)
@L8945:
	ld	 r13,r12,4
	cmp	 r13,r13,r10
	bb1	 ne,r13,@L8944
	st	 r11,r12,4
	ld	 r13,r0,r11
	st	 r13,r12,12
@L8944:
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L8945
@L8941:
	or.u	 r13,r0,hi16(_current_binding_level)
@L9219:
	ld	 r11,r13,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r11,32
	ld	 r13,r13,lo16(_global_binding_level)
	bcnd.n	 eq0,r13,@L8949
	extu	 r24,r12,3<9>
	cmp	 r13,r11,r13
	bb1.n	 ne,r13,@L9220
	or.u	 r9,r0,hi16(_current_binding_level)
	bsr.n	 _my_friendly_abort
	or	 r2,r0,123
@L8949:
	or.u	 r9,r0,hi16(_current_binding_level)
@L9220:
	or.u	 r11,r0,hi16(_free_binding_level)
	ld	 r12,r9,lo16(_current_binding_level)
	ld	 r13,r11,lo16(_free_binding_level)
	ld	 r10,r12,28
	st	 r13,r12,28
	ld	 r13,r10,32
	mask	 r13,r13,61440
	st	 r12,r11,lo16(_free_binding_level)
	cmp	 r13,r13,8192
	bb0.n	 eq,r13,@L8948
	st	 r10,r9,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_class_binding_level)
	or	 r11,r0,r9
	st	 r10,r13,lo16(_class_binding_level)
@L8952:
	ld	 r13,r11,lo16(_current_binding_level)
	ld	 r12,r13,28
	ld	 r13,r12,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb1.n	 eq,r13,@L8952
	st	 r12,r11,lo16(_current_binding_level)
@L8948:
	bcnd.n	 eq0,r20,@L8956
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r13,r13,lo16(_current_function_decl)
	br.n	 @L8957
	st	 r23,r13,48
	align	 4
@L8956:
	bcnd	 eq0,r23,@L8958
	bcnd.n	 ne0,r16,@L9221
	cmp	 r13,r24,2
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r2,r13,20
	br.n	 @L9179
	or	 r3,r0,r23
	align	 4
@L8958:
	bcnd.n	 eq0,r22,@L8957
	cmp	 r13,r21,2
	bb1.n	 ne,r13,@L8962
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r3,r13,20
	br.n	 @L9179
	or	 r2,r0,r22
	align	 4
@L8962:
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r2,r13,20
	or	 r3,r0,r22
@L9179:
	bsr	 _chainon
	ld	 r13,r25,lo16(_current_binding_level)
	st	 r2,r13,20
@L8957:
	cmp	 r13,r24,2
@L9221:
	cmp	 r12,r17,0
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L8964
	bsr	 _getdecls
	or	 r3,r0,r21
	bsr.n	 _expand_end_bindings
	or	 r4,r0,1
	or	 r2,r0,r21
	or	 r3,r0,0
	bsr.n	 _poplevel
	or	 r4,r0,r15
	or	 r23,r0,r2
@L8964:
	bcnd	 eq0,r23,@L8879
	ld	 r13,r23,8
	or	 r13,r13,32768
	st	 r13,r23,8
@L8879:
	ld	 r11,r19,44
	or.u	 r13,r0,hi16(_flag_traditional)
	ld	 r12,r19,48
	ld	 r13,r13,lo16(_flag_traditional)
	bcnd.n	 eq0,r13,@L8966
	st	 r12,r11,36
	or.u	 r13,r0,hi16(_current_function_calls_setjmp)
	ld	 r13,r13,lo16(_current_function_calls_setjmp)
	bcnd.n	 eq0,r13,@L9222
	or.u	 r13,r0,hi16(_cleanup_label)
	bsr.n	 _setjmp_protect
	ld	 r2,r19,48
@L8966:
	or.u	 r13,r0,hi16(_cleanup_label)
@L9222:
	ld	 r2,r13,lo16(_cleanup_label)
	bcnd.n	 eq0,r2,@L9223
	or.u	 r13,r0,hi16(_exception_throw_decl)
	bsr	 _emit_label
	or.u	 r13,r0,hi16(_exception_throw_decl)
@L9223:
	ld	 r2,r13,lo16(_exception_throw_decl)
	bcnd.n	 eq0,r2,@L8968
	or.u	 r13,r0,hi16(_sets_exception_throw_decl)
	ld	 r13,r13,lo16(_sets_exception_throw_decl)
	bcnd.n	 ne0,r13,@L9224
	or.u	 r13,r0,hi16(_flag_handle_exceptions)
	or.u	 r13,r0,hi16(_integer_zero_node)
	or	 r4,r0,0
	ld	 r3,r13,lo16(_integer_zero_node)
	bsr.n	 _expand_assignment
	or	 r5,r0,0
@L8968:
	or.u	 r13,r0,hi16(_flag_handle_exceptions)
@L9224:
	ld	 r13,r13,lo16(_flag_handle_exceptions)
	bcnd.n	 eq0,r13,@L9225
	or	 r2,r0,0
	bsr	 _expand_end_try
	or	 r2,r0,0
	bsr.n	 _expand_start_except
	or	 r3,r0,0
	bsr	 _expand_end_except
	or	 r2,r0,0
@L9225:
	or	 r3,r0,0
	bsr.n	 _expand_end_bindings
	or	 r4,r0,0
	or.u	 r13,r0,hi16(_original_result_rtx)
	ld	 r3,r13,lo16(_original_result_rtx)
	bcnd	 eq0,r3,@L8970
	bsr.n	 _fixup_result_decl
	ld	 r2,r19,44
@L8970:
	ld	 r8,r31,116
	bcnd.n	 ne0,r8,@L9226
	or.u	 r13,r0,hi16(_return_label)
	or.u	 r13,r0,hi16(_cleanup_label)
	ld	 r13,r13,lo16(_cleanup_label)
	bcnd.n	 eq0,r13,@L8971
	or.u	 r13,r0,hi16(_return_label)
@L9226:
	bsr.n	 _emit_jump
	ld	 r2,r13,lo16(_return_label)
@L8971:
	ld	 r14,r31,116
	bcnd.n	 eq0,r14,@L9227
	or.u	 r13,r0,hi16(_current_class_name)
	bsr.n	 _expand_label
	ld	 r2,r31,116
	or.u	 r13,r0,hi16(_current_class_name)
@L9227:
	ld	 r13,r13,lo16(_current_class_name)
	bcnd.n	 eq0,r13,@L8974
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r13,r13,lo16(_current_class_type)
	or	 r2,r0,1
	st	 r13,r31,108
	bsr.n	 _popclass
	addu	 r1,r1,@L9272
@L9273:
	align	 4
@L8974:
	bsr.n	 _pop_memoized_context
	or	 r2,r0,1
@L8975:
	or.u	 r12,r0,hi16(_overloads_to_forget)
	ld	 r13,r12,lo16(_overloads_to_forget)
	bcnd.n	 eq0,r13,@L8977
	or	 r10,r0,r12
@L8978:
	ld	 r12,r10,lo16(_overloads_to_forget)
	ld	 r11,r12,12
	ld	 r13,r12,16
	st	 r13,r11,20
	ld	 r13,r0,r12
	bcnd.n	 ne0,r13,@L8978
	st	 r13,r10,lo16(_overloads_to_forget)
@L8977:
	or.u	 r13,r0,hi16(_input_filename)
	ld	 r3,r31,92
	ld	 r2,r13,lo16(_input_filename)
	bsr.n	 _expand_function_end
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r13,r13,32
	mask	 r13,r13,61440
	cmp	 r13,r13,4096
	bb0	 ne,r13,@L8980
	bsr.n	 _my_friendly_abort
	or	 r2,r0,122
@L8980:
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r13,r13,32
	or	 r20,r0,1
	or	 r21,r0,1
	mask	 r17,r13,61440
	mask	 r13,r13,3584
	cmp	 r12,r17,12288
	cmp	 r13,r13,1024
	bb1.n	 ne,r13,@L8982
	extu	 r17,r12,1<eq>
	or	 r21,r0,0
@L8982:
	bcnd.n	 lt0,r21,@L8984
	or	 r15,r0,1
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r18,r13,4
	br	 @L8985
	align	 4
@L8984:
	or	 r18,r0,0
@L8985:
	bcnd.n	 lt0,r21,@L8986
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r22,r13,20
	br.n	 @L9228
	or.u	 r25,r0,hi16(_current_binding_level)
	align	 4
@L8986:
	or	 r22,r0,0
	or.u	 r25,r0,hi16(_current_binding_level)
@L9228:
	ld	 r2,r25,lo16(_current_binding_level)
	ld	 r6,r2,32
	extu	 r4,r6,4<12>
	extu	 r5,r6,3<9>
	ld	 r3,r2,28
	bsr.n	 _GNU_xref_end_scope
	extu	 r6,r6,1<8>
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r12,32
	mask	 r13,r13,3584
	cmp	 r13,r13,512
	bb1	 ne,r13,@L8989
	or	 r20,r0,1
@L8989:
	ld	 r24,r0,r12
	bcnd.n	 eq0,r24,@L8992
	or	 r25,r0,r24
	or.u	 r23,r0,0x1d00
@L8994:
	ld	 r12,r25,8
	mask.u	 r13,r12,0xff01
	cmp	 r13,r13,r23
	bb1	 ne,r13,@L8993
	ld	 r13,r25,48
	bcnd	 eq0,r13,@L8993
	bb0	 (31-11),r12,@L8993
	bsr.n	 _output_inline_function
	or	 r2,r0,r25
@L8993:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L8994
@L8992:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r13,24
	cmp	 r13,r12,0
	extu	 r16,r13,1<ne>
	bcnd.n	 eq0,r16,@L8997
	or	 r23,r0,0
	br.n	 @L8998
	or	 r23,r0,r12
	align	 4
@L8997:
	subu	 r13,r0,r21
	subu	 r13,r0,r13
	or	 r13,r13,r20
	bcnd	 eq0,r13,@L8998
	bsr.n	 _make_node
	or	 r2,r0,5
	or	 r23,r0,r2
@L8998:
	bcnd	 eq0,r23,@L9000
	st	 r24,r23,16
	st	 r18,r23,20
	or	 r2,r0,r23
	bsr.n	 _remember_end_note
	st	 r22,r23,24
@L9000:
	bcnd	 lt0,r20,@L9001
	bcnd.n	 eq0,r22,@L9001
	or	 r25,r0,r22
@L9005:
	st	 r23,r25,28
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L9005
@L9001:
	or	 r25,r0,r24
	bcnd.n	 eq0,r25,@L9229
	or.u	 r13,r0,hi16(_current_binding_level)
@L9010:
	ld	 r13,r25,32
	bcnd	 eq0,r13,@L9009
	ld	 r13,r25,28
	bb0	 (31-8),r13,@L9012
	ld	 r13,r25,8
	bb0	 (31-16),r13,@L9246
	ld	 r12,r25,60
	ld	 r13,r12,8
	or	 r13,r13,32768
	st	 r13,r12,8
	ld	 r13,r25,8
@L9246:
	bb0	 (31-11),r13,@L9012
	ld	 r12,r25,60
	ld	 r13,r12,8
	or.u	 r13,r13,0x10
	st	 r13,r12,8
@L9012:
	ld	 r13,r25,32
	st	 r0,r13,24
@L9009:
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L9010
	or.u	 r13,r0,hi16(_current_binding_level)
@L9229:
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r25,r13,8
	bcnd.n	 eq0,r25,@L9230
	or.u	 r13,r0,hi16(_current_binding_level)
@L9019:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,24
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L9019
	or.u	 r13,r0,hi16(_current_binding_level)
@L9230:
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r25,r13,12
	bcnd.n	 eq0,r25,@L9231
	or.u	 r13,r0,hi16(_current_binding_level)
@L9024:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,28
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L9024
	or.u	 r13,r0,hi16(_current_binding_level)
@L9231:
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r25,r13,16
	bcnd	 eq0,r25,@L9027
@L9029:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,4
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L9029
@L9027:
	bcnd.n	 eq0,r21,@L9031
	or.u	 r13,r0,hi16(_named_labels)
	ld	 r25,r13,lo16(_named_labels)
	bcnd.n	 eq0,r25,@L9247
	st	 r0,r23,16
@L9035:
	ld	 r24,r25,16
	ld	 r13,r24,48
	bcnd.n	 ne0,r13,@L9036
	or.u	 r13,r0,hi16(_warn_unused)
	or.u	 r3,r0,hi16(@LC1)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC1)
	ld	 r4,r24,32
	or.u	 r13,r0,hi16(_input_filename)
	ld	 r2,r13,lo16(_input_filename)
	or	 r3,r0,1
	bsr.n	 _define_label
	addu	 r1,r1,@L9274
@L9275:
	align	 4
@L9036:
	ld	 r13,r13,lo16(_warn_unused)
	bcnd	 eq0,r13,@L9037
	ld	 r13,r24,8
	bb1	 (31-16),r13,@L9037
	or.u	 r3,r0,hi16(@LC2)
	or	 r2,r0,r24
	bsr.n	 _warning_with_decl
	or	 r3,r3,lo16(@LC2)
@L9037:
	ld	 r13,r24,32
	ld	 r13,r13,36
	bcnd.n	 ne0,r13,@L9040
	or	 r2,r0,1
	bsr.n	 _perm_calloc
	or	 r3,r0,20
	ld	 r13,r24,32
	st	 r2,r13,36
@L9040:
	ld	 r13,r24,32
	ld	 r13,r13,36
	st	 r0,r0,r13
	ld	 r13,r23,16
	st	 r13,r0,r24
	st	 r24,r23,16
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L9035
	or.u	 r13,r0,hi16(_named_labels)
@L9247:
	st	 r0,r13,lo16(_named_labels)
@L9031:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r10,r13,lo16(_current_binding_level)
	ld	 r11,r10,28
	bcnd.n	 eq0,r11,@L9042
	or.u	 r13,r0,hi16(_named_label_uses)
	ld	 r12,r13,lo16(_named_label_uses)
	bcnd.n	 eq0,r12,@L9232
	or.u	 r13,r0,hi16(_current_binding_level)
@L9046:
	ld	 r13,r12,4
	cmp	 r13,r13,r10
	bb1	 ne,r13,@L9045
	st	 r11,r12,4
	ld	 r13,r0,r11
	st	 r13,r12,12
@L9045:
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L9046
@L9042:
	or.u	 r13,r0,hi16(_current_binding_level)
@L9232:
	ld	 r11,r13,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r11,32
	ld	 r13,r13,lo16(_global_binding_level)
	bcnd.n	 eq0,r13,@L9050
	extu	 r24,r12,3<9>
	cmp	 r13,r11,r13
	bb1.n	 ne,r13,@L9233
	or.u	 r9,r0,hi16(_current_binding_level)
	bsr.n	 _my_friendly_abort
	or	 r2,r0,123
@L9050:
	or.u	 r9,r0,hi16(_current_binding_level)
@L9233:
	or.u	 r11,r0,hi16(_free_binding_level)
	ld	 r12,r9,lo16(_current_binding_level)
	ld	 r13,r11,lo16(_free_binding_level)
	ld	 r10,r12,28
	st	 r13,r12,28
	ld	 r13,r10,32
	mask	 r13,r13,61440
	st	 r12,r11,lo16(_free_binding_level)
	cmp	 r13,r13,8192
	bb0.n	 eq,r13,@L9049
	st	 r10,r9,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_class_binding_level)
	or	 r11,r0,r9
	st	 r10,r13,lo16(_class_binding_level)
@L9053:
	ld	 r13,r11,lo16(_current_binding_level)
	ld	 r12,r13,28
	ld	 r13,r12,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb1.n	 eq,r13,@L9053
	st	 r12,r11,lo16(_current_binding_level)
@L9049:
	bcnd.n	 eq0,r21,@L9057
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r13,r13,lo16(_current_function_decl)
	br.n	 @L9058
	st	 r23,r13,48
	align	 4
@L9057:
	bcnd	 eq0,r23,@L9059
	bcnd.n	 ne0,r16,@L9234
	cmp	 r13,r24,2
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r2,r13,20
	br.n	 @L9180
	or	 r3,r0,r23
	align	 4
@L9059:
	bcnd.n	 eq0,r22,@L9058
	cmp	 r13,r20,2
	bb1.n	 ne,r13,@L9063
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r3,r13,20
	br.n	 @L9180
	or	 r2,r0,r22
	align	 4
@L9063:
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r2,r13,20
	or	 r3,r0,r22
@L9180:
	bsr	 _chainon
	ld	 r13,r25,lo16(_current_binding_level)
	st	 r2,r13,20
@L9058:
	cmp	 r13,r24,2
@L9234:
	cmp	 r12,r17,0
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L9065
	bsr	 _getdecls
	or	 r3,r0,r20
	bsr.n	 _expand_end_bindings
	or	 r4,r0,1
	or	 r2,r0,r20
	or	 r3,r0,0
	bsr.n	 _poplevel
	or	 r4,r0,r15
	or	 r23,r0,r2
@L9065:
	bcnd	 eq0,r23,@L8981
	ld	 r13,r23,8
	or	 r13,r13,32768
	st	 r13,r23,8
@L8981:
	or.u	 r13,r0,hi16(_flag_pic)
	ld	 r12,r19,48
	ld	 r11,r13,lo16(_flag_pic)
	or.u	 r13,r0,hi16(_can_reach_end)
	st	 r0,r13,lo16(_can_reach_end)
	bcnd.n	 eq0,r11,@L9067
	st	 r19,r12,28
	ld	 r13,r19,80
	ld	 r13,r0,r13
	bb1	 (31-9),r13,@L9068
	ld	 r13,r19,60
	ld	 r13,r13,16
	ld.b	 r13,r13,1
	cmp	 r13,r13,36
	bb1	 ne,r13,@L9067
@L9068:
	ld	 r8,r31,100
	ld	 r13,r8,56
	ld	 r13,r13,80
	ld	 r13,r0,r13
	bb0	 (31-27),r13,@L9067
	ld	 r13,r19,28
	and.u	 r13,r13,0xffef
	st	 r13,r19,28
@L9067:
	ld	 r13,r19,28
	bb0	 (31-8),r13,@L9069
	bb0.n	 (31-11),r13,@L9070
	or.u	 r13,r0,hi16(_flag_no_inline)
	ld	 r13,r13,lo16(_flag_no_inline)
	bcnd.n	 ne0,r13,@L9235
	or.u	 r25,r0,hi16(_rtl_dump_and_exit)
	bsr.n	 _function_cannot_inline_p
	or	 r2,r0,r19
	bcnd	 eq0,r2,@L9069
@L9070:
	or.u	 r25,r0,hi16(_rtl_dump_and_exit)
@L9235:
	ld	 r12,r19,28
	or.u	 r13,r0,hi16(_flag_no_inline)
	ld	 r23,r25,lo16(_rtl_dump_and_exit)
	ld	 r11,r13,lo16(_flag_no_inline)
	or	 r13,r0,1
	st	 r13,r25,lo16(_rtl_dump_and_exit)
	bcnd.n	 eq0,r11,@L9071
	extu	 r24,r12,1<20>
	ld	 r13,r19,28
	and.u	 r13,r13,0xffef
	st	 r13,r19,28
@L9071:
	bsr.n	 _rest_of_compilation
	or	 r2,r0,r19
	ld	 r13,r19,28
	and.u	 r13,r13,0xffef
	mak	 r12,r24,0<20>
	st	 r23,r25,lo16(_rtl_dump_and_exit)
	or	 r13,r13,r12
	br.n	 @L9072
	st	 r13,r19,28
	align	 4
@L9069:
	bsr.n	 _rest_of_compilation
	or	 r2,r0,r19
@L9072:
	ld	 r14,r31,108
	bcnd	 eq0,r14,@L9073
	ld	 r13,r19,8
	bb0.n	 (31-15),r13,@L9236
	or.u	 r10,r0,hi16(_current_function_returns_null)
	bsr.n	 _note_debug_info_needed
	ld	 r2,r31,108
@L9073:
	or.u	 r10,r0,hi16(_current_function_returns_null)
@L9236:
	ld	 r11,r19,80
	or.u	 r12,r0,hi16(_can_reach_end)
	ld	 r13,r10,lo16(_current_function_returns_null)
	ld	 r12,r12,lo16(_can_reach_end)
	ld	 r11,r0,r11
	or	 r13,r13,r12
	bb1.n	 (31-9),r11,@L9075
	st	 r13,r10,lo16(_current_function_returns_null)
	ld	 r13,r19,44
	ld	 r13,r13,32
	bcnd	 eq0,r13,@L9074
@L9075:
	st	 r0,r10,lo16(_current_function_returns_null)
@L9074:
	ld	 r13,r19,8
	bb0.n	 (31-12),r13,@L9076
	or.u	 r13,r0,hi16(_current_function_returns_null)
	ld	 r13,r13,lo16(_current_function_returns_null)
	bcnd.n	 eq0,r13,@L9076
	or.u	 r2,r0,hi16(@LC431)
	br.n	 @L9181
	or	 r2,r2,lo16(@LC431)
	align	 4
@L9076:
	or.u	 r13,r0,hi16(_warn_return_type)
	ld	 r13,r13,lo16(_warn_return_type)
	bcnd.n	 eq0,r13,@L9078
	or.u	 r13,r0,hi16(_current_function_returns_null)
	ld	 r13,r13,lo16(_current_function_returns_null)
	bcnd.n	 eq0,r13,@L9078
	or.u	 r12,r0,hi16(_void_type_node)
	ld	 r8,r31,100
	ld	 r13,r8,4
	ld	 r12,r12,lo16(_void_type_node)
	ld	 r13,r13,64
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L9078
	or.u	 r2,r0,hi16(@LC432)
	or	 r2,r2,lo16(@LC432)
	bsr.n	 _pedwarn
	addu	 r1,r1,@L9276
@L9277:
	align	 4
@L9078:
	or.u	 r13,r0,hi16(_extra_warnings)
	ld	 r13,r13,lo16(_extra_warnings)
	bcnd.n	 eq0,r13,@L9077
	or.u	 r13,r0,hi16(_current_function_returns_value)
	ld	 r13,r13,lo16(_current_function_returns_value)
	bcnd.n	 eq0,r13,@L9077
	or.u	 r13,r0,hi16(_current_function_returns_null)
	ld	 r13,r13,lo16(_current_function_returns_null)
	bcnd.n	 eq0,r13,@L9077
	or.u	 r2,r0,hi16(@LC433)
	or	 r2,r2,lo16(@LC433)
@L9181:
	bsr	 _warning
@L9077:
	bsr	 _permanent_allocation
	or.u	 r13,r0,hi16(_flag_cadillac)
	ld	 r13,r13,lo16(_flag_cadillac)
	bcnd	 eq0,r13,@L9081
	bsr.n	 _cadillac_finish_function
	or	 r2,r0,r19
@L9081:
	ld	 r13,r19,72
	bcnd.n	 ne0,r13,@L9237
	or.u	 r13,r0,hi16(_current_function_decl)
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r12,r19,80
	ld	 r13,r13,lo16(_error_mark_node)
	st	 r13,r19,48
	ld	 r13,r0,r12
	bb0	 (31-9),r13,@L9084
	ld	 r14,r31,100
	ld	 r13,r14,56
	ld	 r13,r13,8
	bb1.n	 (31-25),r13,@L9237
	or.u	 r13,r0,hi16(_current_function_decl)
@L9084:
	st	 r0,r19,40
	or.u	 r13,r0,hi16(_current_function_decl)
@L9237:
	st	 r0,r13,lo16(_current_function_decl)
	or.u	 r13,r0,hi16(_named_label_uses)
	bsr.n	 _clear_anon_parm_name
	st	 r0,r13,lo16(_named_label_uses)
@Lte75:
	ld	 r1,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	ld.d	 r14,r31,32
	jmp.n	 r1
	addu	 r31,r31,160
	def	 @L9276,@L9077-@L9277
	def	 @L9274,@L9037-@L9275
	def	 @L9272,@L8975-@L9273
	def	 @L9270,@L8936-@L9271
	def	 @L9268,@L8651-@L9269
	def	 @L9266,@L8842-@L9267
	def	 @L9264,@L8751-@L9265
	def	 @L9262,@L9177-@L9263
	def	 @L9260,@L8743-@L9261
	def	 @L9258,@L8713-@L9259
	def	 @L9256,@L8651-@L9257
	def	 @L9254,@L8607-@L9255
	def	 @L9252,@L8435-@L9253
	def	 @L9250,@L8439-@L9251

data
	align	 8
@LC434:
	string	 "`%s' is already defined in class %s\000"
text
	align	 8
	global	 _start_method
_start_method:
	subu	 r31,r31,64
	or	 r13,r0,r2
	or	 r2,r0,r3
	or	 r6,r0,r4
	or	 r4,r0,6
	st	 r1,r31,48
	or	 r5,r0,0
	st	 r23,r31,36
	or	 r3,r0,r13
	bsr.n	 _grokdeclarator
	st.d	 r24,r31,40
@Ltb76:
	or	 r24,r0,r2
	bcnd.n	 eq0,r24,@L9393
	or.u	 r13,r0,hi16(_void_type_node)
	ld	 r12,r24,64
	ld	 r13,r13,lo16(_void_type_node)
	cmp	 r12,r12,r13
	bb0.n	 ne,r12,@L9392
	or	 r2,r0,r24
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb0	 ne,r13,@L9338
@L9393:
	br.n	 @L9392
	or	 r2,r0,0
	align	 4
@L9338:
	ld	 r12,r24,28
	bb0	 (31-20),r12,@L9339
	ld	 r13,r24,60
	ld	 r12,r13,36
	bcnd.n	 eq0,r12,@L9341
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r12,r12,16
	ld	 r13,r13,lo16(_current_class_type)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L9342
	or.u	 r13,r0,hi16(_void_type_node)
	br	 @L9397
	align	 4
@L9341:
	ld	 r13,r13,lo16(_current_class_type)
	bcnd.n	 eq0,r13,@L9397
	or.u	 r13,r0,hi16(_void_type_node)
@L9342:
	ld	 r13,r24,36
	ld	 r13,r13,48
	ld	 r13,r13,32
	or	 r2,r0,r24
	or.u	 r3,r0,hi16(@LC434)
	ld	 r4,r13,16
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC434)
	or.u	 r13,r0,hi16(_void_type_node)
@L9397:
	ld	 r2,r13,lo16(_void_type_node)
	br	 @L9392
	align	 4
@L9339:
	or.u	 r13,r0,hi16(_flag_default_inline)
	ld	 r13,r13,lo16(_flag_default_inline)
	bcnd.n	 eq0,r13,@L9343
	or.u	 r13,r0,hi16(_processing_template_defn)
	ld	 r13,r13,lo16(_processing_template_defn)
	bcnd.n	 ne0,r13,@L9343
	or.u	 r13,r12,0x10
	st	 r13,r24,28
@L9343:
	bsr	 _preserve_data
	ld	 r12,r24,80
	ld	 r13,r0,r12
	bb1.n	 (31-12),r13,@L9398
	or	 r2,r0,r24
	ld	 r13,r12,28
	bcnd	 eq0,r13,@L9345
	bsr.n	 _copy_node
	or	 r2,r0,r24
	or	 r24,r0,r2
@L9345:
	ld	 r13,r24,80
	ld	 r10,r0,r13
	bb0	 (31-9),r10,@L9346
	ld	 r13,r24,4
	ld	 r13,r13,12
	ld	 r10,r0,r13
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r25,r13,lo16(_current_class_type)
	bcnd	 eq0,r10,@L9348
	ld	 r9,r10,16
	br	 @L9349
	align	 4
@L9348:
	or.u	 r13,r0,hi16(_void_type_node)
	ld	 r9,r13,lo16(_void_type_node)
@L9349:
	bcnd	 eq0,r10,@L9350
	ld	 r11,r0,r10
	bcnd	 eq0,r11,@L9350
	ld	 r12,r11,16
	ld.bu	 r13,r12,8
	cmp	 r13,r13,15
	bb1	 ne,r13,@L9350
	ld	 r13,r12,4
	ld	 r13,r13,8
	bb0	 (31-25),r13,@L9350
	or	 r10,r0,r11
	or	 r9,r0,r12
@L9350:
	ld.bu	 r13,r9,8
	cmp	 r13,r13,15
	bb1	 ne,r13,@L9351
	ld	 r13,r9,4
	ld	 r13,r13,64
	cmp	 r13,r13,r25
	bb1	 ne,r13,@L9351
	ld	 r12,r0,r10
	bcnd.n	 eq0,r12,@L9353
	or.u	 r13,r0,hi16(_void_list_node)
	ld	 r13,r13,lo16(_void_list_node)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L9353
	ld	 r13,r12,12
	bcnd	 eq0,r13,@L9352
@L9353:
	ld	 r12,r25,80
	ld	 r13,r0,r12
	or.u	 r13,r13,0x1000
	st	 r13,r0,r12
	ld	 r12,r25,80
	ld	 r13,r0,r12
	or.u	 r13,r13,0x800
	st	 r13,r0,r12
	ld	 r13,r9,4
	ld	 r13,r13,8
	bb0	 (31-13),r13,@L9344
	ld	 r12,r25,80
	br	 @L9394
	align	 4
@L9352:
	ld	 r12,r25,80
	ld	 r13,r0,r12
	br.n	 @L9395
	or.u	 r13,r13,0x400
	align	 4
@L9351:
	ld	 r13,r9,64
	cmp	 r13,r13,r25
	bb1	 ne,r13,@L9357
	ld	 r12,r0,r10
	bcnd.n	 eq0,r12,@L9358
	or.u	 r13,r0,hi16(_void_list_node)
	ld	 r13,r13,lo16(_void_list_node)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L9358
	ld	 r13,r25,48
	ld	 r13,r13,32
	or.u	 r2,r0,hi16(@LC400)
	ld	 r3,r13,16
	or	 r2,r2,lo16(@LC400)
	bsr.n	 _error
	or	 r4,r0,r3
@L9358:
	ld	 r13,r24,32
	ld	 r13,r13,36
	bcnd.n	 ne0,r13,@L9360
	or	 r2,r0,1
	bsr.n	 _perm_calloc
	or	 r3,r0,20
	ld	 r13,r24,32
	st	 r2,r13,36
@L9360:
	ld	 r13,r24,32
	ld	 r13,r13,36
	st	 r25,r13,16
	ld	 r12,r25,80
	ld	 r13,r0,r12
	br.n	 @L9395
	or.u	 r13,r13,0x400
	align	 4
@L9357:
	ld.bu	 r13,r9,8
	cmp	 r13,r13,6
	bb0	 ne,r13,@L9363
	ld	 r13,r10,12
	bcnd.n	 eq0,r13,@L9398
	or	 r2,r0,r24
@L9363:
	ld	 r12,r25,80
	ld	 r13,r0,r12
	br.n	 @L9395
	or.u	 r13,r13,0x40
	align	 4
@L9346:
	ld	 r11,r24,32
	ld	 r13,r11,8
	bb0	 (31-24),r13,@L9344
	ld	 r13,r24,28
	ld	 r12,r24,4
	ld	 r25,r12,12
	bb0.n	 (31-13),r10,@L9367
	extu	 r9,r13,1<18>
	or.u	 r12,r0,hi16(_ansi_opname+508)
	ld	 r13,r12,lo16(_ansi_opname+508)
	cmp	 r13,r11,r13
	bb1.n	 ne,r13,@L9368
	or	 r12,r12,lo16(_ansi_opname+508)
	bcnd	 eq0,r9,@L9369
	or.u	 r2,r0,hi16(@LC401)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC401)
@L9369:
	bcnd.n	 ne0,r25,@L9370
	or.u	 r13,r0,hi16(_current_class_name)
	or.u	 r13,r0,hi16(_integer_type_node)
	ld	 r2,r13,lo16(_integer_type_node)
	or.u	 r13,r0,hi16(_void_list_node)
	ld	 r3,r13,lo16(_void_list_node)
	or.u	 r13,r0,hi16(_ptr_type_node)
	ld	 r25,r13,lo16(_ptr_type_node)
	br	 @L9396
	align	 4
@L9370:
	ld	 r13,r13,lo16(_current_class_name)
	ld	 r3,r24,4
	ld	 r2,r13,4
	bsr.n	 _coerce_new_type
	addu	 r1,r1,@L9401
@L9402:
	align	 4
@L9368:
	subu	 r13,r12,16
	ld	 r13,r0,r13
	cmp	 r13,r11,r13
	bb1.n	 ne,r13,@L9373
	or.u	 r3,r0,hi16(@LC403)
	bcnd	 eq0,r9,@L9374
	or.u	 r2,r0,hi16(@LC402)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC402)
@L9374:
	bcnd.n	 ne0,r25,@L9375
	or.u	 r13,r0,hi16(_current_class_name)
	or.u	 r13,r0,hi16(_ptr_type_node)
	ld	 r2,r13,lo16(_ptr_type_node)
	or.u	 r13,r0,hi16(_void_list_node)
	ld	 r3,r13,lo16(_void_list_node)
	or.u	 r13,r0,hi16(_void_type_node)
	ld	 r25,r13,lo16(_void_type_node)
@L9396:
	bsr	 _hash_tree_chain
	or	 r3,r0,r2
	bsr.n	 _build_function_type
	or	 r2,r0,r25
	br.n	 @L9344
	st	 r2,r24,4
	align	 4
@L9375:
	ld	 r13,r13,lo16(_current_class_name)
	ld	 r3,r24,4
	ld	 r2,r13,4
	bsr.n	 _coerce_delete_type
	addu	 r1,r1,@L9403
@L9404:
	align	 4
@L9373:
	or	 r2,r0,r24
	or	 r3,r3,lo16(@LC403)
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L9405
@L9406:
	align	 4
@L9367:
	or.u	 r13,r0,hi16(_ansi_opname+180)
	ld	 r13,r13,lo16(_ansi_opname+180)
	cmp	 r13,r11,r13
	bb1.n	 ne,r13,@L9398
	or	 r2,r0,r24
	bcnd.n	 ne0,r25,@L9380
	or.u	 r3,r0,hi16(@LC404)
	or	 r2,r0,r24
	or	 r3,r3,lo16(@LC404)
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L9407
@L9408:
	align	 4
@L9380:
	ld	 r13,r0,r25
	bcnd	 eq0,r13,@L9381
	ld	 r10,r13,16
	br	 @L9382
	align	 4
@L9381:
	or.u	 r13,r0,hi16(_void_type_node)
	ld	 r10,r13,lo16(_void_type_node)
@L9382:
	ld.bu	 r13,r10,8
	cmp	 r13,r13,15
	bb1.n	 ne,r13,@L9398
	or	 r2,r0,r24
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r11,r10,4
	ld	 r13,r13,lo16(_current_class_type)
	cmp	 r13,r11,r13
	bb1.n	 ne,r13,@L9399
	or	 r3,r0,0
	ld	 r12,r11,80
	ld	 r13,r0,r12
	or	 r13,r13,16384
	st	 r13,r0,r12
	ld	 r12,r11,80
	ld	 r13,r0,r12
	or	 r13,r13,8192
	st	 r13,r0,r12
	ld	 r13,r10,4
	ld	 r13,r13,8
	bb0	 (31-13),r13,@L9399
	ld	 r12,r11,80
@L9394:
	ld	 r13,r0,r12
	or.u	 r13,r13,0x4
@L9395:
	st	 r13,r0,r12
@L9344:
	or	 r2,r0,r24
@L9398:
	or	 r3,r0,0
@L9399:
	or	 r4,r0,0
	bsr.n	 _finish_decl
	or	 r5,r0,0
	or.u	 r13,r0,hi16(_current_binding_level)
	or.u	 r12,r0,hi16(_global_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r12,r12,lo16(_global_binding_level)
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L9400
	or.u	 r12,r0,hi16(_free_binding_level)
	or.u	 r13,r0,hi16(_named_labels)
	ld	 r2,r13,lo16(_named_labels)
	cmp	 r2,r2,0
	or	 r3,r0,134
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	or.u	 r12,r0,hi16(_free_binding_level)
@L9400:
	ld	 r2,r12,lo16(_free_binding_level)
	bcnd.n	 eq0,r2,@L9387
	or	 r25,r0,r2
	ld	 r13,r25,28
	br.n	 @L9388
	st	 r13,r12,lo16(_free_binding_level)
	align	 4
@L9387:
	bsr.n	 _xmalloc
	or	 r2,r0,36
	or	 r25,r0,r2
@L9388:
	or.u	 r3,r0,hi16(_clear_binding_level)
	subu	 r2,r25,60
	ld	 r4,r3,lo16(_clear_binding_level)
	or	 r3,r3,lo16(_clear_binding_level)
	or.u	 r13,r0,hi16(_keep_next_level_flag)
	subu	 r3,r3,60
	bsr.n	 ___movstrSI96x36
	ld	 r23,r13,lo16(_keep_next_level_flag)
	or.u	 r12,r0,hi16(_class_binding_level)
	ld	 r13,r12,lo16(_class_binding_level)
	bcnd	 eq0,r13,@L9390
	st	 r13,r25,28
	br.n	 @L9391
	st	 r0,r12,lo16(_class_binding_level)
	align	 4
@L9390:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	st	 r13,r25,28
@L9391:
	ld	 r13,r25,32
	mak	 r12,r23,3<9>
	or	 r2,r0,r25
	or	 r13,r13,160
	or.u	 r25,r0,hi16(_current_binding_level)
	and	 r13,r13,0xf0ff
	st	 r2,r25,lo16(_current_binding_level)
	or	 r13,r13,r12
	bsr.n	 _GNU_xref_start_scope
	st	 r13,r2,32
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r12,32
	and	 r13,r13,0xfff
	or	 r13,r13,4096
	st	 r13,r12,32
	ld	 r13,r24,28
	or.u	 r12,r0,hi16(_keep_next_level_flag)
	or	 r2,r0,r24
	st	 r0,r12,lo16(_keep_next_level_flag)
	or	 r13,r13,2048
	st	 r13,r2,28
@L9392:
@Lte76:
	ld	 r1,r31,48
	ld	 r23,r31,36
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64
	def	 @L9407,@L9344-@L9408
	def	 @L9405,@L9344-@L9406
	def	 @L9403,@L9344-@L9404
	def	 @L9401,@L9344-@L9402

	align	 8
	global	 _finish_method
_finish_method:
	or.u	 r12,r0,hi16(_void_type_node)
	ld	 r12,r12,lo16(_void_type_node)
	subu	 r31,r31,64
	st	 r1,r31,48
	st.d	 r24,r31,40
	or	 r24,r0,r2
	st.d	 r22,r31,32
@Ltb77:
	ld	 r13,r24,64
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L9473
	or	 r23,r0,r24
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r25,r0,r13
	ld	 r22,r24,48
	bcnd.n	 eq0,r25,@L9479
	or.u	 r13,r0,hi16(_current_binding_level)
@L9446:
	ld	 r13,r25,32
	bcnd	 eq0,r13,@L9447
	st	 r0,r13,24
@L9447:
	ld.bu	 r2,r25,8
	cmp	 r2,r2,29
	or	 r3,r0,163
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<ne>
	st	 r0,r25,36
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L9446
	or.u	 r13,r0,hi16(_current_binding_level)
@L9479:
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r25,r13,8
	bcnd.n	 eq0,r25,@L9480
	or.u	 r13,r0,hi16(_current_binding_level)
@L9452:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,24
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L9452
	or.u	 r13,r0,hi16(_current_binding_level)
@L9480:
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r25,r13,12
	bcnd.n	 eq0,r25,@L9481
	or.u	 r13,r0,hi16(_current_binding_level)
@L9457:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,28
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L9457
	or.u	 r13,r0,hi16(_current_binding_level)
@L9481:
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r25,r13,16
	bcnd	 eq0,r25,@L9460
@L9462:
	ld	 r12,r25,12
	ld	 r13,r25,16
	st	 r13,r12,4
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L9462
@L9460:
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r2,r25,lo16(_current_binding_level)
	ld	 r6,r2,32
	extu	 r4,r6,4<12>
	extu	 r5,r6,3<9>
	ld	 r3,r2,28
	bsr.n	 _GNU_xref_end_scope
	extu	 r6,r6,1<8>
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r12,r13,lo16(_global_binding_level)
	bcnd.n	 eq0,r12,@L9482
	or.u	 r9,r0,hi16(_current_binding_level)
	ld	 r13,r25,lo16(_current_binding_level)
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L9483
	or.u	 r11,r0,hi16(_free_binding_level)
	bsr.n	 _my_friendly_abort
	or	 r2,r0,123
	or.u	 r9,r0,hi16(_current_binding_level)
@L9482:
	or.u	 r11,r0,hi16(_free_binding_level)
@L9483:
	ld	 r12,r9,lo16(_current_binding_level)
	ld	 r13,r11,lo16(_free_binding_level)
	ld	 r10,r12,28
	st	 r13,r12,28
	ld	 r13,r10,32
	mask	 r13,r13,61440
	st	 r12,r11,lo16(_free_binding_level)
	cmp	 r13,r13,8192
	bb0.n	 eq,r13,@L9464
	st	 r10,r9,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_class_binding_level)
	or	 r11,r0,r9
	st	 r10,r13,lo16(_class_binding_level)
@L9468:
	ld	 r13,r11,lo16(_current_binding_level)
	ld	 r12,r13,28
	ld	 r13,r12,32
	mask	 r13,r13,61440
	cmp	 r13,r13,8192
	bb1.n	 eq,r13,@L9468
	st	 r12,r11,lo16(_current_binding_level)
@L9464:
	ld	 r13,r23,80
	st	 r22,r23,48
	ld	 r13,r0,r13
	bb0.n	 (31-12),r13,@L9472
	or.u	 r25,r0,hi16(_current_class_type)
	ld	 r13,r25,lo16(_current_class_type)
	or	 r2,r0,0
	ld	 r4,r13,72
	bsr.n	 _tree_cons
	or	 r3,r0,r23
	or.u	 r13,r0,hi16(_void_type_node)
	ld	 r24,r13,lo16(_void_type_node)
	ld	 r13,r25,lo16(_current_class_type)
	st	 r2,r13,72
@L9472:
	or	 r2,r0,r24
@L9473:
@Lte77:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	ld.d	 r22,r31,32
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
	global	 _hack_incomplete_structures
_hack_incomplete_structures:
	subu	 r31,r31,64
	or.u	 r12,r0,hi16(_current_binding_level)
	st.d	 r22,r31,32
	or	 r23,r0,r2
	ld	 r2,r12,lo16(_current_binding_level)
	st	 r1,r31,48
	st.d	 r24,r31,40
@Ltb78:
	ld.hu	 r13,r2,32
	bcnd	 eq0,r13,@L9498
	bcnd	 eq0,r23,@L9498
	ld	 r25,r0,r2
	bcnd.n	 eq0,r25,@L9498
	or	 r22,r0,r12
@L9504:
	ld	 r2,r25,4
	cmp	 r13,r2,r23
	bb0	 ne,r13,@L9506
	bcnd	 eq0,r2,@L9503
	ld.bu	 r13,r2,8
	cmp	 r13,r13,18
	bb1	 ne,r13,@L9503
	ld	 r13,r2,4
	cmp	 r13,r13,r23
	bb1	 ne,r13,@L9503
@L9506:
	ld.bu	 r13,r25,8
	cmp	 r13,r13,32
	bb1.n	 ne,r13,@L9507
	or.u	 r13,r0,hi16(_global_binding_level)
	bsr.n	 _layout_type
	addu	 r1,r1,@L9512
@L9513:
	align	 4
@L9507:
	ld	 r11,r22,lo16(_current_binding_level)
	ld	 r12,r13,lo16(_global_binding_level)
	ld.bu	 r13,r2,8
	cmp	 r12,r12,r11
	cmp	 r13,r13,18
	bb1.n	 ne,r13,@L9509
	extu	 r24,r12,1<eq>
	ld	 r13,r2,4
	cmp	 r13,r13,r23
	bb1	 ne,r13,@L9509
	bsr	 _layout_type
@L9509:
	or	 r2,r0,r25
	bsr.n	 _layout_decl
	or	 r3,r0,0
	or	 r2,r0,r25
	or	 r3,r0,0
	or	 r4,r0,r24
	bsr.n	 _rest_of_decl_compilation
	or	 r5,r0,0
	bcnd	 ne0,r24,@L9508
	bsr.n	 _expand_decl
	or	 r2,r0,r25
	bsr.n	 _maybe_build_cleanup
	or	 r2,r0,r25
	or	 r3,r0,r2
	bsr.n	 _expand_decl_cleanup
	or	 r2,r0,r25
	bsr.n	 _expand_decl_init
	or	 r2,r0,r25
@L9508:
	ld	 r13,r22,lo16(_current_binding_level)
	ld.hu	 r2,r13,32
	cmp	 r2,r2,0
	or	 r3,r0,164
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<ne>
	ld	 r12,r22,lo16(_current_binding_level)
	ld.hu	 r13,r12,32
	subu	 r13,r13,1
	st.h	 r13,r12,32
@L9503:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L9504
@L9498:
@Lte78:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	ld.d	 r22,r31,32
	jmp.n	 r1
	addu	 r31,r31,64
	def	 @L9512,@L9508-@L9513

	align	 8
	global	 _maybe_build_cleanup
_maybe_build_cleanup:
	subu	 r31,r31,80
	st	 r1,r31,64
	st.d	 r24,r31,56
	st.d	 r22,r31,48
	or	 r24,r0,r2
	st.d	 r20,r31,40
@Ltb79:
	ld	 r23,r24,4
	ld	 r13,r23,24
	bb0.n	 (31-21),r13,@L9525
	or.u	 r13,r0,hi16(_building_cleanup)
	ld	 r20,r13,lo16(_building_cleanup)
	or	 r12,r0,1
	st	 r12,r13,lo16(_building_cleanup)
	ld.bu	 r13,r24,8
	or	 r21,r0,0
	cmp	 r13,r13,34
	bb0.n	 ne,r13,@L9526
	or	 r22,r0,515
	bsr	 _suspend_momentary
	or	 r21,r0,r2
@L9526:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,18
	bb0.n	 ne,r13,@L9528
	or	 r25,r0,r24
	bsr.n	 _mark_addressable
	or	 r2,r0,r24
	or	 r2,r0,106
	or	 r3,r0,r24
	bsr.n	 _build_unary_op
	or	 r4,r0,0
	or	 r25,r0,r2
@L9528:
	ld	 r13,r23,8
	bb0.n	 (31-25),r13,@L9530
	or.u	 r13,r0,hi16(_flag_expensive_optimizations)
	ld	 r13,r13,lo16(_flag_expensive_optimizations)
	bcnd	 eq0,r13,@L9529
@L9530:
	or	 r22,r22,8
@L9529:
	ld	 r13,r25,4
	ld	 r12,r13,4
	ld	 r13,r12,8
	bb0	 (31-13),r13,@L9531
	ld	 r13,r12,64
	or	 r2,r0,102
	ld	 r3,r13,32
	bsr.n	 _build1
	or	 r4,r0,r25
	or	 r25,r0,r2
@L9531:
	ld	 r2,r25,4
	or.u	 r13,r0,hi16(_integer_two_node)
	or	 r3,r0,r25
	or	 r5,r0,r22
	or	 r6,r0,0
	ld	 r4,r13,lo16(_integer_two_node)
	bsr.n	 _build_delete
	or	 r7,r0,0
	ld	 r13,r23,8
	bb0.n	 (31-25),r13,@L9532
	or	 r25,r0,r2
	ld	 r13,r23,24
	bb1.n	 (31-19),r13,@L9535
	or.u	 r13,r0,hi16(_current_binding_level)
	or	 r2,r0,r23
	bsr.n	 _build_vbase_delete
	or	 r3,r0,r24
	or	 r3,r0,r2
	bsr.n	 _build_tree_list
	or	 r2,r0,0
	or	 r4,r0,r2
	or	 r2,r0,0
	bsr.n	 _tree_cons
	or	 r3,r0,r25
	bsr	 _build_compound_expr
	or	 r25,r0,r2
@L9532:
	or.u	 r13,r0,hi16(_current_binding_level)
@L9535:
	ld	 r12,r13,lo16(_current_binding_level)
	ld	 r13,r12,32
	or	 r13,r13,64
	and	 r13,r13,0xffdf
	st	 r13,r12,32
	ld.bu	 r13,r24,8
	cmp	 r13,r13,34
	bb0.n	 ne,r13,@L9536
	or.u	 r13,r0,hi16(_building_cleanup)
	bsr.n	 _resume_momentary
	or	 r2,r0,r21
	or.u	 r13,r0,hi16(_building_cleanup)
@L9536:
	or	 r2,r0,r25
	br.n	 @L9534
	st	 r20,r13,lo16(_building_cleanup)
	align	 4
@L9525:
	or	 r2,r0,0
@L9534:
@Lte79:
	ld	 r1,r31,64
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80

data
	align	 8
@LC435:
	string	 "address of overloaded function with no contextual"
	string	 " type information\000"
	align	 8
@LC436:
	string	 "useless reference to a member function name, did "
	string	 "you forget the ()?\000"
	align	 8
@LC437:
	string	 "reference, not call, to function `%s'\000"
	align	 8
@LC438:
	string	 "at this point in file\000"
text
	align	 8
	global	 _cplus_expand_expr_stmt
_cplus_expand_expr_stmt:
	or.u	 r12,r0,hi16(_unknown_type_node)
	ld	 r12,r12,lo16(_unknown_type_node)
	subu	 r31,r31,64
	st	 r1,r31,48
	st.d	 r24,r31,40
	or	 r24,r0,r2
	st	 r23,r31,36
@Ltb80:
	ld	 r13,r24,4
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L9549
	ld.bu	 r2,r24,8
	cmp	 r13,r2,106
	cmp	 r12,r2,3
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L9550
	or.u	 r2,r0,hi16(@LC435)
	or	 r2,r2,lo16(@LC435)
	bsr.n	 _error
	addu	 r1,r1,@L9559
@L9560:
	align	 4
@L9550:
	cmp	 r13,r2,37
	bb0.n	 eq,r13,@L9553
	or.u	 r2,r0,hi16(@LC436)
	or	 r2,r2,lo16(@LC436)
	bsr.n	 _warning
	addu	 r1,r1,@L9561
@L9562:
	align	 4
@L9549:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1.n	 ne,r13,@L9554
	or	 r23,r0,0
	or.u	 r3,r0,hi16(@LC437)
	or	 r2,r0,r24
	bsr.n	 _warning_with_decl
	or	 r3,r3,lo16(@LC437)
	or.u	 r2,r0,hi16(@LC438)
	bsr.n	 _warning
	or	 r2,r2,lo16(@LC438)
@L9554:
	ld	 r13,r24,8
	bb0.n	 (31-17),r13,@L9555
	or.u	 r25,r0,hi16(_flag_handle_exceptions)
	ld	 r2,r25,lo16(_flag_handle_exceptions)
	bsr.n	 _my_friendly_assert
	or	 r3,r0,165
	ld	 r13,r25,lo16(_flag_handle_exceptions)
	cmp	 r13,r13,2
	bb1.n	 ne,r13,@L9555
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r13,r13,32
	bb1.n	 (31-26),r13,@L9557
	or.u	 r13,r0,hi16(_nesting_stack)
	ld	 r12,r13,lo16(_nesting_stack)
	or.u	 r13,r0,hi16(_block_stack)
	ld	 r13,r13,lo16(_block_stack)
	cmp	 r12,r12,r13
	or	 r2,r0,1
	bsr.n	 _cplus_expand_start_try
	extu	 r23,r12,1<ne>
@L9557:
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r12,32
	or	 r13,r13,16
	st	 r13,r12,32
@L9555:
	bsr.n	 _break_out_cleanups
	or	 r2,r0,r24
	bsr	 _expand_expr_stmt
	bcnd	 eq0,r23,@L9553
	bsr.n	 _pop_implicit_try_blocks
	or	 r2,r0,0
@L9553:
	bsr.n	 _expand_cleanups_to
	or	 r2,r0,0
@Lte80:
	ld	 r1,r31,48
	ld	 r23,r31,36
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64
	def	 @L9561,@L9553-@L9562
	def	 @L9559,@L9553-@L9560

	align	 8
	global	 _finish_stmt
_finish_stmt:
	subu	 r31,r31,48
	st	 r25,r31,32
	or.u	 r25,r0,hi16(_current_function_assigns_this)
	ld	 r13,r25,lo16(_current_function_assigns_this)
	bcnd.n	 ne0,r13,@L9570
	st	 r1,r31,36
@Ltb81:
	or.u	 r13,r0,hi16(_current_function_just_assigned_this)
	ld	 r13,r13,lo16(_current_function_just_assigned_this)
	bcnd.n	 eq0,r13,@L9570
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r13,r13,lo16(_current_function_decl)
	ld	 r13,r13,80
	ld	 r13,r0,r13
	bb0.n	 (31-9),r13,@L9573
	or.u	 r13,r0,hi16(_cond_stack)
	ld	 r13,r13,lo16(_cond_stack)
	bcnd.n	 ne0,r13,@L9570
	or.u	 r13,r0,hi16(_loop_stack)
	ld	 r13,r13,lo16(_loop_stack)
	bcnd.n	 ne0,r13,@L9570
	or.u	 r13,r0,hi16(_case_stack)
	ld	 r13,r13,lo16(_case_stack)
	bcnd.n	 ne0,r13,@L9570
	or.u	 r13,r0,hi16(_base_init_insns)
	bsr.n	 _emit_insns
	ld	 r2,r13,lo16(_base_init_insns)
	or.u	 r13,r0,hi16(_current_class_type)
	bsr.n	 _check_base_init
	ld	 r2,r13,lo16(_current_class_type)
@L9573:
	or.u	 r13,r0,hi16(_flag_cadillac)
	ld	 r12,r13,lo16(_flag_cadillac)
	or	 r13,r0,1
	bcnd.n	 eq0,r12,@L9570
	st	 r13,r25,lo16(_current_function_assigns_this)
	bsr	 _cadillac_finish_stmt
@L9570:
@Lte81:
	ld	 r1,r31,36
	ld	 r25,r31,32
	jmp.n	 r1
	addu	 r31,r31,48

data
	align	 8
@LC439:
	string	 "(compiler error)\000"
text
	align	 8
	global	 _pop_implicit_try_blocks
_pop_implicit_try_blocks:
	subu	 r31,r31,80
	st	 r1,r31,64
	st.d	 r24,r31,56
	st.d	 r22,r31,48
	st.d	 r20,r31,40
	or	 r21,r0,r2
	bcnd.n	 eq0,r21,@L9585
	st.d	 r18,r31,32
@Ltb82:
	or.u	 r25,r0,hi16(_current_binding_level)
	ld	 r13,r25,lo16(_current_binding_level)
	ld	 r2,r13,32
	mask	 r2,r2,61440
	cmp	 r2,r2,12288
	or	 r3,r0,166
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	ld	 r12,r25,lo16(_current_binding_level)
	ld	 r13,r0,r21
	st	 r13,r0,r12
@L9585:
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r13,r13,32
	mask	 r13,r13,61440
	cmp	 r13,r13,12288
	bb0	 eq,r13,@L9587
	or.u	 r18,r0,hi16(_current_exception_type)
	or.u	 r19,r0,hi16(_current_exception_decl)
	or.u	 r20,r0,hi16(_current_exception_object)
	or.u	 r2,r0,hi16(@LC439)
@L9592:
	bsr.n	 _get_identifier
	or	 r2,r2,lo16(@LC439)
	ld	 r22,r18,lo16(_current_exception_type)
	or	 r25,r0,r2
	ld	 r23,r19,lo16(_current_exception_decl)
	or	 r2,r0,2
	bsr.n	 _cplus_expand_end_try
	ld	 r24,r20,lo16(_current_exception_object)
	or	 r3,r0,r2
	bsr.n	 _cplus_expand_start_except
	or	 r2,r0,r25
	bsr.n	 _cplus_expand_reraise
	or	 r2,r0,0
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r2,r13,lo16(_error_mark_node)
	st	 r22,r18,lo16(_current_exception_type)
	st	 r23,r19,lo16(_current_exception_decl)
	bsr.n	 _cplus_expand_end_except
	st	 r24,r20,lo16(_current_exception_object)
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r13,r13,lo16(_current_binding_level)
	ld	 r13,r13,32
	mask	 r13,r13,61440
	cmp	 r13,r13,12288
	bb1.n	 eq,r13,@L9592
	or.u	 r2,r0,hi16(@LC439)
@L9587:
	bcnd.n	 eq0,r21,@L9590
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r12,r13,lo16(_current_binding_level)
	ld	 r13,r0,r12
	st	 r13,r0,r21
	st	 r21,r0,r12
@L9590:
@Lte82:
	ld	 r1,r31,64
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	ld.d	 r18,r31,32
	jmp.n	 r1
	addu	 r31,r31,80

data
	align	 8
@LC440:
	string	 "exception cleanup\000"
text
	align	 8
	global	 _push_exception_cleanup
_push_exception_cleanup:
	subu	 r31,r31,80
	st.d	 r24,r31,56
	or	 r25,r0,r2
	st	 r1,r31,64
	or.u	 r2,r0,hi16(@LC440)
	st	 r21,r31,44
	or	 r2,r2,lo16(@LC440)
	bsr.n	 _get_identifier
	st.d	 r22,r31,48
@Ltb83:
	or.u	 r13,r0,hi16(_ptr_type_node)
	or	 r3,r0,r2
	ld	 r4,r13,lo16(_ptr_type_node)
	bsr.n	 _build_decl
	or	 r2,r0,33
	bsr	 _pushdecl
	or	 r24,r0,r2
	ld	 r13,r24,28
	or	 r3,r0,r25
	or.u	 r13,r13,0x20
	bsr.n	 _store_init_value
	st	 r13,r24,28
	bsr.n	 _expand_decl
	or	 r2,r0,r24
	bsr.n	 _expand_decl_init
	or	 r2,r0,r24
	or.u	 r13,r0,hi16(_integer_type_node)
	or	 r2,r0,96
	ld	 r23,r13,lo16(_integer_type_node)
	or.u	 r13,r0,hi16(_integer_zero_node)
	or	 r4,r0,r24
	ld	 r5,r13,lo16(_integer_zero_node)
	bsr.n	 _build
	or	 r3,r0,r23
	or.u	 r13,r0,hi16(_current_binding_level)
	ld	 r12,r13,lo16(_current_binding_level)
	or.u	 r13,r0,hi16(_global_binding_level)
	ld	 r11,r13,lo16(_global_binding_level)
	ld	 r22,r25,4
	or.u	 r13,r0,hi16(_in_charge_identifier)
	cmp	 r12,r12,r11
	ld	 r25,r13,lo16(_in_charge_identifier)
	bb0.n	 ne,r12,@L9614
	or	 r21,r0,r2
	ld	 r2,r25,24
	bcnd	 ne0,r2,@L9615
@L9614:
	or.u	 r13,r0,hi16(_current_class_type)
	ld	 r12,r13,lo16(_current_class_type)
	bcnd	 eq0,r12,@L9616
	ld	 r2,r25,28
	bcnd	 ne0,r2,@L9632
	ld	 r13,r12,16
	bcnd	 ne0,r13,@L9617
	ld	 r13,r12,80
	ld	 r13,r0,r13
	bb0	 (31-24),r13,@L9617
	or	 r2,r0,r12
	or	 r3,r0,r25
	or	 r4,r0,0
	bsr.n	 _lookup_field
	or	 r5,r0,0
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r2,r13
	bb0.n	 ne,r13,@L9613
	or	 r4,r0,r2
	bcnd	 eq0,r2,@L9631
	ld.bu	 r13,r2,8
	cmp	 r13,r13,32
	ext	 r13,r13,1<eq>
	and	 r2,r2,r13
@L9617:
	bcnd	 ne0,r2,@L9632
@L9631:
	bsr.n	 _lookup_nested_field
	or	 r2,r0,r25
	bcnd	 ne0,r2,@L9632
@L9616:
	ld	 r2,r25,20
@L9615:
	bcnd.n	 eq0,r2,@L9613
	or	 r4,r0,r2
@L9632:
	ld.bu	 r13,r2,8
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L9623
	or.u	 r13,r0,hi16(_looking_for_typename)
	ld	 r12,r13,lo16(_looking_for_typename)
	bcnd	 lt0,r12,@L9623
	ld	 r3,r25,4
	bcnd	 eq0,r3,@L9626
	ld	 r4,r3,48
	cmp	 r13,r2,r4
	extu	 r13,r13,1<eq>
	bcnd	 ne0,r13,@L9613
	bcnd	 gt0,r12,@L9613
	or	 r4,r0,r2
	br	 @L9613
	align	 4
@L9626:
	or.u	 r13,r0,hi16(_error_mark_node)
	ld	 r4,r2,4
	ld	 r13,r13,lo16(_error_mark_node)
	cmp	 r13,r4,r13
	bb0	 ne,r13,@L9613
@L9623:
	or	 r4,r0,r2
@L9613:
	or	 r2,r0,r22
	or	 r3,r0,r24
	or	 r5,r0,515
	or	 r6,r0,0
	bsr.n	 _build_delete
	or	 r7,r0,0
	or	 r5,r0,r2
	or	 r2,r0,48
	or.u	 r13,r0,hi16(_integer_zero_node)
	or	 r3,r0,r23
	ld	 r6,r13,lo16(_integer_zero_node)
	bsr.n	 _build
	or	 r4,r0,r21
	or	 r3,r0,r2
	bsr.n	 _expand_decl_cleanup
	or	 r2,r0,r24
@Lte83:
	ld	 r1,r31,64
	ld	 r21,r31,44
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	jmp.n	 r1
	addu	 r31,r31,80

data
	align	 8
@LC441:
	string	 "exception cleanup\000"
text
	align	 8
_deactivate_exception_cleanups:
	subu	 r31,r31,64
	or.u	 r13,r0,hi16(_current_binding_level)
	st.d	 r24,r31,40
	ld	 r24,r13,lo16(_current_binding_level)
	or.u	 r2,r0,hi16(@LC441)
	st	 r1,r31,48
	or	 r2,r2,lo16(@LC441)
	bsr.n	 _get_identifier
	st.d	 r22,r31,32
@Ltb84:
	or.u	 r13,r0,hi16(_class_binding_level)
	ld	 r13,r13,lo16(_class_binding_level)
	cmp	 r13,r24,r13
	bb0.n	 ne,r13,@L9646
	or	 r23,r0,r2
	or.u	 r22,r0,hi16(_integer_zero_node)
@L9647:
	ld	 r13,r24,32
	mask	 r13,r13,61440
	cmp	 r13,r13,12288
	bb0	 eq,r13,@L9648
	ld	 r25,r0,r24
	bcnd.n	 eq0,r25,@L9657
	or.u	 r13,r0,hi16(_class_binding_level)
@L9651:
	ld	 r13,r25,32
	cmp	 r13,r13,r23
	bb1.n	 ne,r13,@L9652
	or	 r2,r0,r25
	ld	 r3,r22,lo16(_integer_zero_node)
	or	 r4,r0,0
	bsr.n	 _expand_assignment
	or	 r5,r0,0
@L9652:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L9651
@L9648:
	or.u	 r13,r0,hi16(_class_binding_level)
@L9657:
	ld	 r24,r24,28
	ld	 r13,r13,lo16(_class_binding_level)
	cmp	 r13,r24,r13
	bb1	 ne,r13,@L9647
@L9646:
@Lte84:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	ld.d	 r22,r31,32
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
_revert_static_member_fn:
	subu	 r31,r31,64
	st	 r1,r31,48
	st	 r23,r31,36
	st.d	 r24,r31,40
@Ltb85:
	or	 r24,r0,r2
	ld	 r13,r0,r4
	ld	 r25,r0,r24
	or	 r23,r0,r3
	ld	 r3,r0,r13
	st	 r3,r0,r4
	bsr.n	 _build_function_type
	ld	 r2,r25,4
	ld	 r4,r25,8
	extu	 r3,r4,1<18>
	bsr.n	 _build_type_variant
	extu	 r4,r4,1<19>
	or	 r3,r0,r2
	ld	 r2,r25,56
	bsr.n	 _build_exception_variant
	ld	 r4,r25,72
	ld	 r13,r0,r23
	or	 r3,r0,r2
	st	 r3,r13,4
	st	 r3,r0,r24
	ld	 r13,r0,r23
	ld	 r12,r13,80
	ld	 r13,r0,r12
	or.u	 r13,r13,0x4
	st	 r13,r0,r12
@Lte85:
	ld	 r1,r31,48
	ld	 r23,r31,36
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

	comm	 _integer_zero_node,4
	comm	 _integer_one_node,4
	comm	 _null_pointer_node,4
	comm	 _error_mark_node,4
	comm	 _void_type_node,4
	comm	 _integer_type_node,4
	comm	 _unsigned_type_node,4
	comm	 _char_type_node,4
	comm	 _current_function_decl,4
	comm	 _double_type_node,4
	comm	 _long_double_type_node,4
	comm	 _float_type_node,4
	comm	 _unsigned_char_type_node,4
	comm	 _signed_char_type_node,4
	comm	 _ptrdiff_type_node,4
	comm	 _short_integer_type_node,4
	comm	 _short_unsigned_type_node,4
	comm	 _long_integer_type_node,4
	comm	 _long_unsigned_type_node,4
	comm	 _long_long_integer_type_node,4
	comm	 _long_long_unsigned_type_node,4
	comm	 _string_type_node,4
	comm	 _char_array_type_node,4
	comm	 _int_array_type_node,4
	comm	 _wchar_array_type_node,4
	comm	 _wchar_type_node,4
	comm	 _signed_wchar_type_node,4
	comm	 _unsigned_wchar_type_node,4
	comm	 _intQI_type_node,4
	comm	 _unsigned_intQI_type_node,4
	comm	 _intHI_type_node,4
	comm	 _unsigned_intHI_type_node,4
	comm	 _intSI_type_node,4
	comm	 _unsigned_intSI_type_node,4
	comm	 _intDI_type_node,4
	comm	 _unsigned_intDI_type_node,4
	comm	 _current_function_returns_value,4
	comm	 _current_function_returns_null,4
	comm	 _current_function_return_value,4
	comm	 _void_list_node,4
	comm	 _void_zero_node,4
	comm	 _default_function_type,4
	comm	 _vtable_entry_type,4
	comm	 ___t_desc_type_node,4
	comm	 ___i_desc_type_node,4
	comm	 ___m_desc_type_node,4
	comm	 _class_star_type_node,4
	comm	 _error_mark_list,4
	comm	 _ptr_type_node,4
	comm	 _class_type_node,4
	comm	 _record_type_node,4
	comm	 _union_type_node,4
	comm	 _enum_type_node,4
	comm	 _exception_type_node,4
	comm	 _unknown_type_node,4
	comm	 _vtbl_mask,4
	comm	 _vtbl_type_node,4
	comm	 _integer_two_node,4
	comm	 _integer_three_node,4
	comm	 _current_function_assigns_this,4
	comm	 _current_function_just_assigned_this,4
	comm	 _current_function_parms_stored,4
	comm	 _current_function_obstack_index,4
	comm	 _current_function_obstack_usage,4
	bss	 _decl_obstack,44,8
	bss	 _decl_stack,4,4
	comm	 _this_identifier,4
	comm	 _in_charge_identifier,4
	comm	 _last_function_parms,4
	comm	 _static_aggregates,4
	comm	 _pending_addressable_inlines,4
	comm	 _const_ptr_type_node,4
	comm	 _const_string_type_node,4
	comm	 _double_ftype_double,4
	comm	 _double_ftype_double_double,4
	comm	 _int_ftype_int,4
	comm	 _long_ftype_long,4
	comm	 _void_ftype_ptr_ptr_int,4
	comm	 _int_ftype_ptr_ptr_int,4
	comm	 _void_ftype_ptr_int_int,4
	comm	 _string_ftype_ptr_ptr,4
	comm	 _int_ftype_string_string,4
	comm	 _sizet_ftype_string,4
	comm	 _int_ftype_cptr_cptr_sizet,4
	comm	 ___t_desc_array_type,4
	comm	 ___i_desc_array_type,4
	comm	 ___m_desc_array_type,4
	comm	 _maybe_gc_cleanup,4
	comm	 _empty_init_node,4
	comm	 _dtor_label,4
	comm	 _ctor_label,4
	comm	 _unhandled_exception_fndecl,4
	comm	 _abort_fndecl,4
	comm	 _original_result_rtx,4
	comm	 _base_init_insns,4
	bss	 _named_label_uses,4,4
	bss	 _overloads_to_forget,4,4
	comm	 _pending_invalid_xref,4
	comm	 _pending_invalid_xref_file,4
	comm	 _pending_invalid_xref_line,4
	bss	 _enum_next_value,4,4
	bss	 _last_function_parm_tags,4,4
	bss	 _current_function_parms,4,4
	bss	 _current_function_parm_tags,4,4
	bss	 _named_labels,4,4
	bss	 _shadowed_labels,4,4
	bss	 _warn_about_return_type,4,4
	bss	 _current_extern_inline,4,4
	bss	 _current_binding_level,4,4
	bss	 _class_binding_level,4,4
	bss	 _free_binding_level,4,4
	bss	 _global_binding_level,4,4
	bss	 _clear_binding_level,36,8
	bss	 _keep_next_level_flag,4,4
	bss	 _current_saved_scope,4,4
	align	 8
_sigsegv:
	subu	 r31,r31,48
	or	 r2,r0,11
	st	 r1,r31,36
@Ltb86:
	bsr.n	 _signal
	or	 r3,r0,0
	bsr.n	 _my_friendly_abort
	or	 r2,r0,0
@Lte86:
	ld	 r1,r31,36
	jmp.n	 r1
	addu	 r31,r31,48

	bss	 _builtin_type_tdescs_arr,4,4
	bss	 _builtin_type_tdescs_len,4,4
	bss	 _builtin_type_tdescs_max,4,4
	align	 8
_push_overloaded_decl_1:
	subu	 r31,r31,80
	st	 r1,r31,64
	st	 r21,r31,44
	st.d	 r22,r31,48
	or	 r23,r0,r2
	st.d	 r24,r31,56
@Ltb87:
	ld	 r21,r23,32
	ld	 r13,r23,28
	ld	 r24,r21,20
	or	 r13,r13,1024
	bcnd.n	 eq0,r24,@L2516
	st	 r13,r23,28
	ld.bu	 r12,r24,8
	cmp	 r13,r12,3
	bb0	 ne,r13,@L2517
	ld	 r13,r23,80
	ld.bu	 r13,r0,r13
	bcnd.n	 ne0,r13,@L2522
	cmp	 r13,r12,29
	bb1	 ne,r13,@L2519
	ld	 r13,r24,80
	ld.bu	 r13,r0,r13
	bcnd.n	 ne0,r13,@L2522
	or.u	 r3,r0,hi16(@LC90)
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC90)
	or.u	 r3,r0,hi16(@LC91)
	or	 r2,r0,r24
	or	 r3,r3,lo16(@LC91)
	bsr.n	 _error_with_decl
	addu	 r1,r1,@L9665
@L9666:
	align	 4
@L2519:
	bsr.n	 _my_friendly_abort
	or	 r2,r0,9
@L2522:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,106
	bb1	 ne,r13,@L2524
	ld	 r24,r24,16
@L2524:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,29
	bb1.n	 ne,r13,@L9663
	or.u	 r13,r0,hi16(_pedantic)
	ld	 r13,r24,80
	ld	 r12,r23,80
	ld.bu	 r13,r0,r13
	ld.bu	 r12,r0,r12
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L2525
	ld	 r2,r24,4
	ld	 r3,r23,4
	bsr.n	 _comptypes
	or	 r4,r0,1
	bcnd.n	 eq0,r2,@L2525
	or.u	 r13,r0,hi16(_current_lang_stack)
	or.u	 r12,r0,hi16(_current_lang_base)
	ld	 r13,r13,lo16(_current_lang_stack)
	ld	 r12,r12,lo16(_current_lang_base)
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L2526
	or.u	 r3,r0,hi16(@LC92)
	ld	 r13,r24,80
	ld	 r12,r23,80
	ld.bu	 r13,r0,r13
	br.n	 @L2515
	st.b	 r13,r0,r12
	align	 4
@L2526:
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC92)
	or.u	 r3,r0,hi16(@LC93)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC93)
@L2525:
	or.u	 r13,r0,hi16(_pedantic)
@L9663:
	ld	 r13,r13,lo16(_pedantic)
	bcnd	 eq0,r13,@L2528
	ld.bu	 r13,r24,8
	cmp	 r13,r13,33
	bb1.n	 ne,r13,@L2528
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13,132
	ld.b	 r2,r0,r13
	cmp	 r2,r2,100
	or	 r3,r0,143
	bsr.n	 _my_friendly_assert
	extu	 r2,r2,1<eq>
	or.u	 r3,r0,hi16(@LC94)
	or	 r2,r0,r24
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC94)
	or.u	 r3,r0,hi16(@LC95)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC95)
@L2528:
	or	 r2,r0,r21
	or	 r3,r0,r24
	bsr.n	 _tree_cons
	or	 r4,r0,0
	or	 r24,r0,r2
	ld	 r2,r24,12
	br.n	 @L9662
	or	 r3,r0,r23
	align	 4
@L2517:
	ld	 r13,r24,16
	bcnd	 ne0,r13,@L2529
	st	 r23,r24,16
	br	 @L2515
	align	 4
@L2529:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,129
	bb0	 ne,r13,@L2516
	or	 r25,r0,r24
	ld	 r22,r23,60
@L2534:
	ld	 r11,r25,16
	ld.bu	 r13,r11,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L2535
	ld	 r13,r11,80
	ld	 r12,r23,80
	ld.bu	 r13,r0,r13
	ld.bu	 r12,r0,r12
	cmp	 r13,r13,r12
	bb0	 ne,r13,@L2535
	ld	 r2,r11,4
	ld	 r3,r23,4
	bsr.n	 _comptypes
	or	 r4,r0,1
	bcnd	 eq0,r2,@L2535
	or.u	 r3,r0,hi16(@LC96)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC96)
	or.u	 r3,r0,hi16(@LC97)
	ld	 r2,r25,16
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC97)
@L2535:
	ld	 r12,r25,16
	ld.bu	 r13,r12,8
	cmp	 r13,r13,129
	bb1	 eq,r13,@L2533
	ld	 r13,r12,60
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L2515
@L2533:
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L2534
@L2516:
	ld	 r13,r23,80
	ld.bu	 r13,r0,r13
	bcnd.n	 ne0,r13,@L9664
	or	 r2,r0,r21
	bcnd.n	 eq0,r24,@L9664
	or	 r25,r0,r24
@L2543:
	ld	 r13,r25,16
	ld	 r13,r13,80
	ld.bu	 r13,r0,r13
	cmp	 r13,r13,1
	bb0	 eq,r13,@L2540
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L2543
@L2540:
	bcnd.n	 eq0,r25,@L2545
	or.u	 r3,r0,hi16(@LC98)
	or	 r2,r0,r23
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC98)
	or.u	 r3,r0,hi16(@LC99)
	ld	 r2,r25,16
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC99)
@L2545:
	or	 r2,r0,r21
@L9664:
	or	 r3,r0,r23
@L9662:
	bsr.n	 _tree_cons
	or	 r4,r0,r24
	or.u	 r13,r0,hi16(_unknown_type_node)
	ld	 r13,r13,lo16(_unknown_type_node)
	or	 r24,r0,r2
	st	 r24,r21,20
	st	 r13,r24,4
@L2515:
@Lte87:
	ld	 r1,r31,64
	ld	 r21,r31,44
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	jmp.n	 r1
	addu	 r31,r31,80
	def	 @L9665,@L2522-@L9666

	comm	 _building_cleanup,4
