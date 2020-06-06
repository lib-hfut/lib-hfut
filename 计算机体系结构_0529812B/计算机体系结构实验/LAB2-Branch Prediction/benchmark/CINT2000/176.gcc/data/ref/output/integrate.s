	file	 "integrate.i"
data

; cc1 (2.7.2.2) arguments: -O -fdefer-pop -fomit-frame-pointer
; -fcse-follow-jumps -fcse-skip-blocks -fexpensive-optimizations
; -fthread-jumps -fstrength-reduce -funroll-loops -fwritable-strings
; -fpeephole -fforce-mem -ffunction-cse -finline-functions -finline
; -freg-struct-return -fdelayed-branch -frerun-cse-after-loop
; -fschedule-insns -fschedule-insns2 -fcommon -fgnu-linker -m88110 -m88100
; -m88000 -mno-ocs-debug-info -mno-ocs-frame-position -mcheck-zero-division

gcc2_compiled.:
	align	 8
@LC0:
	string	 "varargs function cannot be inline\000"
	align	 8
@LC1:
	string	 "function too large to be inline\000"
	align	 8
@LC2:
	string	 "function with large aggregate parameter cannot be"
	string	 " inline\000"
	align	 8
@LC3:
	string	 "no prototype, and parameter address used; cannot "
	string	 "be inline\000"
	align	 8
@LC4:
	string	 "address of an aggregate parameter is used; cannot"
	string	 " be inline\000"
	align	 8
@LC5:
	string	 "function too large to be inline\000"
text
	align	 8
	global	 _function_cannot_inline_p
_function_cannot_inline_p:
	subu	 r31,r31,64
	st	 r1,r31,48
	st.d	 r24,r31,40
	or	 r25,r0,r2
	st	 r23,r31,36
@Ltb0:
	ld	 r13,r25,8
	bsr.n	 _tree_last
	ld	 r2,r13,16
	or	 r24,r0,r2
	bsr.n	 _list_length
	ld	 r2,r25,52
	ld	 r13,r25,12
	extu	 r13,r13,1<9>
	mak	 r13,r13,0<4>
	addu	 r13,r13,8
	addu	 r2,r2,r13
	bcnd.n	 eq0,r24,@L22
	mak	 r23,r2,0<3>
	or.u	 r13,r0,hi16(_void_type_node)
	ld	 r12,r24,20
	ld	 r13,r13,lo16(_void_type_node)
	cmp	 r12,r12,r13
	bb0.n	 ne,r12,@L22
	or.u	 r2,r0,hi16(@LC0)
	br.n	 @L41
	or	 r2,r2,lo16(@LC0)
	align	 4
@L22:
	bsr	 _get_max_uid
	mak	 r13,r23,0<1>
	cmp	 r2,r2,r13
	bb0.n	 gt,r2,@L23
	or.u	 r2,r0,hi16(@LC1)
	br.n	 @L41
	or	 r2,r2,lo16(@LC1)
	align	 4
@L23:
	ld	 r2,r25,52
	bcnd	 eq0,r2,@L25
@L27:
	ld	 r12,r2,8
	ld.bu	 r13,r12,28
	cmp	 r13,r13,26
	bb0	 ne,r13,@L42
	bcnd	 ne0,r24,@L29
	ld	 r13,r2,12
	bb1	 (31-17),r13,@L43
@L29:
	ld.bu	 r13,r12,12
	subu	 r13,r13,19
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb1	 hi,r13,@L26
	ld	 r13,r2,64
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,37
	bb0	 ne,r13,@L44
@L26:
	ld	 r2,r2,4
	bcnd	 ne0,r2,@L27
@L25:
	bsr	 _get_max_uid
	cmp	 r2,r2,r23
	bb0.n	 gt,r2,@L41
	or	 r2,r0,0
	bsr.n	 _get_first_nonparm_insn
	or	 r25,r0,0
	cmp	 r13,r2,0
	br.n	 @L47
	cmp	 r12,r25,r23
	align	 4
@L36:
	ld.hu	 r12,r0,r2
	subu	 r13,r12,13
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L38
	mask	 r13,r12,0xffff
	cmp	 r13,r13,15
	bb1	 ne,r13,@L35
@L38:
	addu	 r25,r25,1
@L35:
	ld	 r2,r2,12
	cmp	 r12,r25,r23
	cmp	 r13,r2,0
@L47:
	rot	 r11,r13,28
	and.c	 r13,r12,r11
	extu	 r13,r13,1<lt>
	bcnd.n	 ne0,r13,@L36
	cmp	 r13,r25,r23
	bb0.n	 ge,r13,@L32
	or.u	 r2,r0,hi16(@LC5)
	br.n	 @L41
	or	 r2,r2,lo16(@LC5)
	align	 4
@L42:
	or.u	 r2,r0,hi16(@LC2)
	br.n	 @L41
	or	 r2,r2,lo16(@LC2)
	align	 4
@L43:
	or.u	 r2,r0,hi16(@LC3)
	br.n	 @L41
	or	 r2,r2,lo16(@LC3)
	align	 4
@L44:
	or.u	 r2,r0,hi16(@LC4)
	br.n	 @L41
	or	 r2,r2,lo16(@LC4)
	align	 4
@L32:
	or	 r2,r0,0
@L41:
@Lte0:
	ld	 r1,r31,48
	ld	 r23,r31,36
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
	global	 _save_for_inline
_save_for_inline:
	subu	 r31,r31,128
	st.d	 r24,r31,72
	or.u	 r25,r0,hi16(_return_label)
	ld	 r13,r25,lo16(_return_label)
	st	 r1,r31,84
	st	 r30,r31,80
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	st.d	 r18,r31,48
	st.d	 r16,r31,40
	addu	 r30,r31,80
	st.d	 r14,r31,32
@Ltb1:
	bcnd.n	 ne0,r13,@L49
	st	 r2,r30,12
	bsr	 _gen_label_rtx
	bsr.n	 _emit_label
	st	 r2,r25,lo16(_return_label)
@L49:
	bsr.n	 _max_label_num
	or.u	 r25,r0,hi16(_max_parm_reg)
	bsr.n	 _get_first_label_num
	or	 r15,r0,r2
	bsr.n	 _max_parm_reg_num
	st	 r2,r30,36
	bsr.n	 _max_reg_num
	st	 r2,r25,lo16(_max_parm_reg)
	ld	 r4,r25,lo16(_max_parm_reg)
	mak	 r4,r4,0<2>
	addu	 r13,r4,15
	and	 r13,r13,0xfff0
	or.u	 r25,r0,hi16(_parmdecl_map)
	subu	 r31,r31,r13
	st	 r2,r30,44
	addu	 r2,r31,32
	or	 r3,r0,0
	bsr.n	 _memset
	st	 r2,r25,lo16(_parmdecl_map)
	ld	 r14,r30,12
	ld	 r12,r14,52
	bcnd.n	 eq0,r12,@L51
	or.u	 r8,r0,0x10
	or.u	 r7,r0,0xffef
	or	 r7,r7,0xffff
	ld	 r10,r25,lo16(_parmdecl_map)
	or.u	 r9,r0,0x4
@L53:
	ld	 r11,r12,64
	ld.hu	 r13,r0,r11
	cmp	 r13,r13,34
	bb1	 ne,r13,@L54
	ld	 r13,r11,4
	st	 r12,r10[r13]
	ld	 r13,r12,12
	br.n	 @L123
	and	 r13,r13,r7
	align	 4
@L54:
	ld	 r13,r12,12
	or	 r13,r13,r8
@L123:
	st	 r13,r12,12
	ld	 r13,r12,12
	or	 r13,r13,r9
	st	 r13,r12,12
	ld	 r12,r12,4
	bcnd	 ne0,r12,@L53
@L51:
	ld	 r4,r30,36
	or.u	 r13,r0,hi16(_max_parm_reg)
	ld	 r7,r30,44
	or	 r2,r0,0
	ld	 r6,r13,lo16(_max_parm_reg)
	or.u	 r13,r0,hi16(_current_function_args_size)
	or	 r3,r0,0
	ld	 r8,r13,lo16(_current_function_args_size)
	bsr.n	 _gen_inline_header_rtx
	or	 r5,r0,r15
	st	 r2,r30,20
	ld	 r16,r2,4
	bsr.n	 _preserve_data
	st	 r16,r30,28
	bsr	 _get_insns
	or	 r22,r0,r2
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,18
	bb0	 ne,r13,@L57
	bsr	 _abort
	align	 4
@L57:
	bsr.n	 _rtx_alloc
	or	 r2,r0,18
	ld	 r13,r22,16
	ld	 r14,r30,44
	or	 r17,r0,r2
	st	 r13,r17,16
	ld	 r13,r22,20
	st	 r13,r17,20
	ld	 r13,r22,4
	or.u	 r12,r0,hi16(_rtx_length+136)
	or	 r18,r0,r17
	st	 r13,r17,4
	mak	 r13,r14,0<2>
	st	 r0,r17,8
	addu	 r13,r13,19
	st	 r0,r17,12
	and	 r13,r13,0xfff0
	subu	 r24,r14,1
	subu	 r31,r31,r13
	ld	 r13,r12,lo16(_rtx_length+136)
	or.u	 r12,r0,hi16(_reg_map)
	addu	 r21,r31,32
	st	 r21,r12,lo16(_reg_map)
	mak	 r13,r13,0<2>
	cmp	 r12,r24,55
	bb0.n	 gt,r12,@L59
	addu	 r3,r13,4
	or.u	 r12,r0,hi16(_maybepermanent_obstack)
	or	 r13,r0,55
	or	 r23,r0,r3
	subu	 r13,r13,r24
	bb0.n	 (31-31),r13,@L61
	or	 r25,r12,lo16(_maybepermanent_obstack)
	ld	 r13,r25,12
	ld	 r12,r25,16
	addu	 r13,r13,r23
	cmp	 r13,r13,r12
	bb1.n	 ls,r13,@L125
	or.u	 r13,r0,hi16(_regno_reg_rtx)
	bsr.n	 __obstack_newchunk
	or	 r2,r0,r25
	or.u	 r13,r0,hi16(_regno_reg_rtx)
@L125:
	ld	 r13,r13,lo16(_regno_reg_rtx)
	ld	 r2,r25,12
	ld	 r3,r13[r24]
	bsr.n	 _memcpy
	or	 r4,r0,r23
	ld	 r13,r25,12
	ld	 r12,r25,24
	ld	 r11,r25,4
	addu	 r13,r13,r23
	ld	 r9,r25,16
	addu	 r10,r13,r12
	and.c	 r12,r10,r12
	st	 r13,r25,12
	subu	 r13,r12,r11
	subu	 r11,r9,r11
	st	 r12,r25,12
	cmp	 r13,r13,r11
	ld	 r12,r25,8
	bb0	 gt,r13,@L112
	st	 r9,r25,12
@L112:
	ld	 r13,r25,12
	ld	 r16,r30,44
	st	 r13,r25,8
	st	 r12,r21[r24]
	subu	 r24,r16,2
	cmp	 r13,r24,55
	bb0	 gt,r13,@L59
@L61:
	ld	 r13,r25,12
	ld	 r12,r25,16
	addu	 r13,r13,r23
	or.u	 r20,r0,hi16(_reg_map)
	cmp	 r13,r13,r12
	ld	 r21,r20,lo16(_reg_map)
	bb1.n	 ls,r13,@L115
	or	 r2,r0,r25
	bsr.n	 __obstack_newchunk
	or	 r3,r0,r23
@L115:
	or.u	 r19,r0,hi16(_regno_reg_rtx)
	ld	 r13,r19,lo16(_regno_reg_rtx)
	ld	 r2,r25,12
	ld	 r3,r13[r24]
	bsr.n	 _memcpy
	or	 r4,r0,r23
	ld	 r13,r25,12
	ld	 r12,r25,24
	ld	 r10,r25,4
	addu	 r13,r13,r23
	ld	 r9,r25,16
	addu	 r11,r13,r12
	and.c	 r12,r11,r12
	st	 r13,r25,12
	subu	 r13,r12,r10
	subu	 r10,r9,r10
	st	 r12,r25,12
	cmp	 r13,r13,r10
	ld	 r12,r25,8
	bb0	 gt,r13,@L116
	st	 r9,r25,12
@L116:
	ld	 r13,r25,12
	st	 r13,r25,8
	st	 r12,r21[r24]
	ld	 r13,r25,12
	ld	 r12,r25,16
	addu	 r13,r13,r23
	cmp	 r13,r13,r12
	ld	 r20,r20,lo16(_reg_map)
	bb1.n	 ls,r13,@L119
	subu	 r21,r24,1
	or	 r2,r0,r25
	bsr.n	 __obstack_newchunk
	or	 r3,r0,r23
@L119:
	ld	 r13,r19,lo16(_regno_reg_rtx)
	ld	 r2,r25,12
	ld	 r3,r13[r21]
	bsr.n	 _memcpy
	or	 r4,r0,r23
	ld	 r13,r25,12
	or	 r10,r0,r25
	addu	 r13,r13,r23
	st	 r13,r25,12
	ld	 r12,r10,24
	ld	 r11,r10,4
	addu	 r13,r13,r12
	ld	 r9,r10,16
	and.c	 r12,r13,r12
	subu	 r13,r12,r11
	subu	 r11,r9,r11
	st	 r12,r10,12
	cmp	 r13,r13,r11
	ld	 r12,r10,8
	bb0	 gt,r13,@L120
	st	 r9,r10,12
@L120:
	ld	 r13,r25,12
	subu	 r24,r24,2
	st	 r13,r25,8
	cmp	 r13,r24,55
	bb1.n	 gt,r13,@L61
	st	 r12,r20[r21]
@L59:
	ld	 r14,r30,44
	or.u	 r13,r0,hi16(_regno_reg_rtx)
	ld	 r2,r13,lo16(_regno_reg_rtx)
	or.u	 r13,r0,hi16(_reg_map)
	subu	 r4,r14,56
	ld	 r3,r13,lo16(_reg_map)
	mak	 r4,r4,0<2>
	addu	 r2,r2,224
	bsr.n	 _memcpy
	addu	 r3,r3,224
	ld	 r16,r30,36
	subu	 r10,r15,r16
	mak	 r13,r10,0<2>
	addu	 r13,r13,15
	ld	 r24,r30,36
	and	 r13,r13,0xfff0
	subu	 r31,r31,r13
	mak	 r12,r24,0<2>
	addu	 r13,r31,32
	or.u	 r11,r0,hi16(_label_map)
	subu	 r13,r13,r12
	cmp	 r12,r24,r15
	bb0.n	 lt,r12,@L68
	st	 r13,r11,lo16(_label_map)
	mask	 r12,r10,3
	bcnd.n	 eq0,r12,@L70
	or	 r23,r0,r11
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L90
	cmp	 r13,r12,2
	bb0	 gt,r13,@L91
	bsr	 _gen_label_rtx
	ld	 r13,r23,lo16(_label_map)
	st	 r2,r13[r24]
	addu	 r24,r24,1
@L91:
	bsr	 _gen_label_rtx
	ld	 r13,r23,lo16(_label_map)
	st	 r2,r13[r24]
	addu	 r24,r24,1
@L90:
	bsr	 _gen_label_rtx
	ld	 r13,r23,lo16(_label_map)
	st	 r2,r13[r24]
	addu	 r24,r24,1
	cmp	 r12,r24,r15
	bb0	 lt,r12,@L68
@L70:
	bsr.n	 _gen_label_rtx
	addu	 r25,r24,3
	ld	 r13,r23,lo16(_label_map)
	bsr.n	 _gen_label_rtx
	st	 r2,r13[r24]
	ld	 r12,r23,lo16(_label_map)
	addu	 r13,r24,1
	bsr.n	 _gen_label_rtx
	st	 r2,r12[r13]
	addu	 r12,r24,2
	ld	 r13,r23,lo16(_label_map)
	addu	 r24,r24,4
	bsr.n	 _gen_label_rtx
	st	 r2,r13[r12]
	ld	 r13,r23,lo16(_label_map)
	cmp	 r12,r24,r15
	bb1.n	 lt,r12,@L70
	st	 r2,r13[r25]
@L68:
	ld	 r14,r30,28
	mak	 r4,r14,0<2>
	addu	 r13,r4,15
	and	 r13,r13,0xfff0
	subu	 r31,r31,r13
	or.u	 r13,r0,hi16(_insn_map)
	addu	 r2,r31,32
	or	 r3,r0,0
	bsr.n	 _memset
	st	 r2,r13,lo16(_insn_map)
@L124:
	ld	 r22,r22,12
	bcnd	 eq0,r22,@L73
	ld.hu	 r2,r0,r22
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	st	 r0,r13,lo16(_orig_asm_operands_vector)
	or.u	 r13,r0,hi16(_copy_asm_operands_vector)
	cmp	 r12,r2,16
	bb0.n	 ne,r12,@L83
	st	 r0,r13,lo16(_copy_asm_operands_vector)
	bb1.n	 ls,r12,@L86
	cmp	 r13,r2,17
	bb0.n	 ne,r13,@L82
	cmp	 r13,r2,18
	bb1	 ne,r13,@L84
	ld	 r13,r22,20
	addu	 r13,r13,6
	bcnd	 eq0,r13,@L124
	bsr.n	 _rtx_alloc
	or	 r2,r0,18
	ld	 r13,r22,16
	or	 r25,r0,r2
	st	 r13,r25,16
	ld	 r13,r22,20
	br.n	 @L76
	st	 r13,r25,20
	align	 4
@L86:
	cmp	 r13,r2,13
	bb1	 lo,r13,@L84
	bsr	 _rtx_alloc
	or	 r25,r0,r2
	bsr.n	 _copy_for_inline
	ld	 r2,r22,16
	st	 r2,r25,16
	subu	 r13,r0,1
	st	 r13,r25,20
	st	 r0,r25,24
	bsr.n	 _copy_for_inline
	ld	 r2,r22,28
	br.n	 @L76
	st	 r2,r25,28
	align	 4
@L82:
	or.u	 r13,r0,hi16(_label_map)
	ld	 r12,r22,16
	ld	 r13,r13,lo16(_label_map)
	ld	 r25,r13[r12]
	br	 @L76
	align	 4
@L83:
	bsr.n	 _rtx_alloc
	or	 r2,r0,16
	br.n	 @L76
	or	 r25,r0,r2
	align	 4
@L84:
	bsr	 _abort
	align	 4
@L76:
	ld	 r13,r22,4
	st	 r13,r25,4
	or.u	 r13,r0,hi16(_insn_map)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_insn_map)
	st	 r25,r13[r12]
	st	 r25,r18,12
	st	 r18,r25,8
	br.n	 @L124
	or	 r18,r0,r25
	align	 4
@L73:
	bsr.n	 _get_first_nonparm_insn
	st	 r0,r18,12
	ld	 r16,r30,20
	bsr.n	 _get_insns
	st	 r2,r16,12
	ld	 r14,r30,12
	st	 r2,r16,16
	bsr.n	 _get_frame_size
	st	 r16,r14,72
	or.u	 r13,r0,hi16(_parmdecl_map)
	st	 r2,r14,68
	st	 r0,r13,lo16(_parmdecl_map)
	or.u	 r13,r0,hi16(_label_map)
	st	 r0,r13,lo16(_label_map)
	or.u	 r13,r0,hi16(_reg_map)
	st	 r0,r13,lo16(_reg_map)
	or	 r2,r0,r17
	ld	 r13,r14,12
	or.u	 r12,r0,hi16(_return_label)
	or	 r3,r0,r18
	st	 r0,r12,lo16(_return_label)
	or	 r13,r13,512
	bsr.n	 _set_new_first_and_last_insn
	st	 r13,r14,12
@Lte1:
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
	addu	 r31,r31,128

	align	 8
_copy_for_inline:
	subu	 r31,r31,96
	st	 r1,r31,80
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	st.d	 r18,r31,48
	or	 r21,r0,r2
	st.d	 r16,r31,40
@Ltb2:
	bcnd.n	 ne0,r21,@L172
	or	 r17,r0,r21
	br.n	 @L216
	or	 r2,r0,0
	align	 4
@L172:
	ld.hu	 r18,r0,r21
	subu	 r11,r18,22
	or.u	 r13,r0,hi16(@L195)
	cmp	 r12,r11,19
	bb0.n	 ls,r12,@L173
	or	 r13,r13,lo16(@L195)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L195:
	word	 @L180
	word	 @L173
	word	 @L173
	word	 @L193
	word	 @L173
	word	 @L173
	word	 @L173
	word	 @L173
	word	 @L215
	word	 @L215
	word	 @L173
	word	 @L215
	word	 @L190
	word	 @L173
	word	 @L173
	word	 @L182
	word	 @L189
	word	 @L215
	word	 @L215
	word	 @L215
	align	 4
@L180:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r17,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L173
	bsr.n	 _rtx_alloc
	or	 r2,r0,22
	ld	 r13,r17,4
	or	 r21,r0,r2
	st	 r13,r21,4
	ld	 r13,r17,8
	st	 r13,r21,8
	or.u	 r13,r0,hi16(_copy_asm_operands_vector)
	ld	 r12,r17,12
	ld	 r13,r13,lo16(_copy_asm_operands_vector)
	st	 r12,r21,12
	st	 r13,r21,16
	ld	 r13,r17,20
	br.n	 @L216
	st	 r13,r2,20
	align	 4
@L182:
	ld	 r10,r21,4
	ld.hu	 r12,r0,r10
	subu	 r13,r12,38
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb0.n	 hi,r13,@L215
	mask	 r11,r12,0xffff
	cmp	 r13,r11,30
	cmp	 r12,r11,32
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L216
	or	 r2,r0,r21
	cmp	 r13,r11,44
	bb1	 ne,r13,@L173
	ld	 r12,r10,4
	br	 @L173
	align	 4
@L189:
	ld	 r13,r17,4
	or.u	 r12,r0,hi16(_label_map)
	ld	 r11,r13,16
	ld	 r13,r12,lo16(_label_map)
	ld.bu	 r3,r17,2
	ld	 r4,r13[r11]
	or	 r2,r0,38
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L218
@L219:
	align	 4
@L190:
	ld	 r12,r21,4
	cmp	 r13,r12,55
	bb0.n	 gt,r13,@L215
	or.u	 r13,r0,hi16(_reg_map)
	ld	 r13,r13,lo16(_reg_map)
	ld	 r2,r13[r12]
	br	 @L216
	align	 4
@L193:
	ld	 r2,r21,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,34
	bb1.n	 ne,r13,@L173
	or.u	 r13,r0,hi16(_max_parm_reg)
	ld	 r2,r2,4
	ld	 r13,r13,lo16(_max_parm_reg)
	cmp	 r13,r2,r13
	bb1.n	 ge,r13,@L173
	cmp	 r13,r2,55
	bb0.n	 gt,r13,@L173
	or.u	 r13,r0,hi16(_parmdecl_map)
	ld	 r13,r13,lo16(_parmdecl_map)
	ld	 r2,r13[r2]
	bcnd	 eq0,r2,@L173
	ld	 r13,r2,12
	and.u	 r13,r13,0xfffb
	st	 r13,r2,12
@L173:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r18
	or.u	 r13,r0,hi16(_rtx_length)
	or	 r25,r13,lo16(_rtx_length)
	ld	 r4,r25[r18]
	or	 r21,r0,r2
	or	 r3,r0,r17
	addu	 r4,r4,1
	bsr.n	 _memcpy
	mak	 r4,r4,0<2>
	or.u	 r13,r0,hi16(_rtx_format)
	ld	 r12,r25[r18]
	or	 r13,r13,lo16(_rtx_format)
	ld	 r19,r13[r18]
	bcnd.n	 le0,r12,@L198
	or	 r20,r0,0
	or	 r16,r0,r25
	or	 r22,r0,r21
@L200:
	ld.b	 r13,r0,r19
	cmp	 r12,r13,101
	bb0.n	 ne,r12,@L202
	addu	 r19,r19,1
	bb1	 gt,r12,@L213
	cmp	 r13,r13,69
	bb0	 ne,r13,@L204
	br	 @L199
	align	 4
@L213:
	cmp	 r13,r13,117
	bb0.n	 ne,r13,@L203
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L199
	align	 4
@L202:
	bsr.n	 _copy_for_inline
	ld	 r2,r22,4
	br.n	 @L199
	st	 r2,r22,4
	align	 4
@L203:
	ld	 r13,r22,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r2,r13[r11]
	br	 @L216
	align	 4
@L204:
	ld	 r3,r22,4
	bcnd	 eq0,r3,@L199
	ld	 r2,r0,r3
	bcnd	 eq0,r2,@L199
	bsr.n	 _gen_rtvec_v
	addu	 r3,r3,4
	st	 r2,r22,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L199
	or	 r24,r0,0
	or	 r23,r0,r22
	or	 r25,r0,0
@L209:
	ld	 r13,r23,4
	addu	 r13,r13,r25
	bsr.n	 _copy_for_inline
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L209
	addu	 r25,r25,4
@L199:
	ld	 r13,r16[r18]
	addu	 r20,r20,1
	cmp	 r13,r20,r13
	bb1.n	 lt,r13,@L200
	addu	 r22,r22,4
@L198:
	cmp	 r13,r18,22
	bb0.n	 eq,r13,@L216
	or	 r2,r0,r21
	or.u	 r12,r0,hi16(_orig_asm_operands_vector)
	ld	 r13,r12,lo16(_orig_asm_operands_vector)
	bcnd	 ne0,r13,@L216
	ld	 r13,r17,16
	st	 r13,r12,lo16(_orig_asm_operands_vector)
	ld	 r12,r21,16
	or.u	 r13,r0,hi16(_copy_asm_operands_vector)
	st	 r12,r13,lo16(_copy_asm_operands_vector)
@L215:
	or	 r2,r0,r21
@L216:
@Lte2:
	ld	 r1,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	jmp.n	 r1
	addu	 r31,r31,96
	def	 @L218,@L216-@L219

	align	 8
	global	 _expand_inline_function
_expand_inline_function:
	subu	 r31,r31,192
	st	 r1,r31,84
	st	 r30,r31,80
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	st.d	 r18,r31,48
	st.d	 r16,r31,40
	addu	 r30,r31,80
	st.d	 r14,r31,32
@Ltb3:
	st	 r2,r30,12
	ld	 r15,r2,72
	ld	 r13,r15,32
	ld	 r8,r15,12
	ld	 r18,r15,20
	st	 r8,r30,44
	ld	 r8,r15,24
	st	 r5,r30,20
	st	 r6,r30,28
	st	 r7,r30,36
	or	 r25,r0,r3
	st	 r0,r30,76
	or	 r14,r0,r4
	st	 r0,r30,84
	or	 r17,r0,0
	st	 r18,r30,60
	addu	 r13,r13,1
	st	 r13,r30,52
	cmp	 r13,r13,55
	bb1.n	 gt,r13,@L221
	st	 r8,r30,68
	bsr	 _abort
	align	 4
@L221:
	ld	 r18,r30,12
	bsr.n	 _list_length
	ld	 r2,r18,52
	or	 r23,r0,r2
	or	 r2,r0,r25
	or.u	 r13,r0,hi16(_first_parm_offset)
	or	 r12,r0,8
	bsr.n	 _list_length
	st	 r12,r13,lo16(_first_parm_offset)
	cmp	 r2,r2,r23
	bb0	 ne,r2,@L222
@L347:
	br.n	 @L320
	subu	 r2,r0,1
	align	 4
@L222:
	ld	 r8,r30,12
	ld	 r24,r8,52
	bcnd.n	 eq0,r24,@L224
	or	 r19,r0,r25
@L226:
	ld	 r13,r19,20
	ld	 r12,r24,52
	ld	 r11,r13,8
	ld.bu	 r12,r12,28
	ld.bu	 r13,r11,28
	cmp	 r13,r12,r13
	bb1.n	 ne,r13,@L347
	cmp	 r13,r12,26
	bb1	 ne,r13,@L225
	ld	 r13,r24,8
	cmp	 r13,r11,r13
	bb0.n	 eq,r13,@L320
	subu	 r2,r0,1
@L225:
	ld	 r24,r24,4
	ld	 r19,r19,4
	bcnd	 ne0,r24,@L226
@L224:
	bsr.n	 _pushlevel
	or	 r2,r0,0
	bsr.n	 _expand_start_bindings
	or	 r2,r0,0
	mak	 r13,r23,0<2>
	ld	 r18,r30,12
	addu	 r13,r13,15
	or	 r19,r0,r25
	and	 r13,r13,0xfff0
	ld	 r24,r18,52
	subu	 r31,r31,r13
	or	 r23,r0,0
	bcnd.n	 eq0,r24,@L352
	addu	 r16,r31,32
@L233:
	ld	 r2,r24,16
	ld	 r3,r24,20
	ld	 r22,r19,20
	ld	 r13,r24,52
	ld	 r12,r24,8
	ld.bu	 r21,r13,28
	ld.bu	 r12,r12,28
	bsr.n	 _emit_note
	st	 r12,r30,100
	ld	 r13,r24,12
	bb0.n	 (31-17),r13,@L234
	mask.u	 r13,r13,0x14
	bsr.n	 _int_size_in_bytes
	ld	 r2,r24,8
	or	 r3,r0,r2
	bsr.n	 _assign_stack_local
	or	 r2,r0,r21
	or	 r25,r0,r2
	ld	 r2,r24,28
	bsr.n	 _memory_address_p
	ld	 r3,r25,4
	bcnd.n	 ne0,r2,@L348
	or	 r2,r0,r22
	bsr.n	 _copy_rtx
	ld	 r2,r25,4
	or	 r4,r0,r2
	or	 r2,r0,r25
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r25,r0,r2
	or	 r2,r0,r22
@L348:
	or	 r3,r0,r25
	or	 r4,r0,0
	bsr.n	 _store_expr
	addu	 r1,r1,@L353
@L354:
	align	 4
@L234:
	or.u	 r12,r0,0x4
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L237
	or	 r2,r0,r22
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,r21
	or	 r25,r0,r2
	or	 r2,r0,r22
	or	 r4,r0,0
	or	 r3,r0,r25
	bsr.n	 _store_expr
	addu	 r1,r1,@L355
@L356:
	align	 4
@L237:
	or	 r3,r0,0
	or	 r4,r0,r21
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r25,r0,r2
	ld.hu	 r11,r0,r25
	mask	 r12,r11,0xffff
	cmp	 r13,r12,34
	bb0.n	 ne,r13,@L236
	subu	 r13,r11,38
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L236
	cmp	 r13,r12,30
	cmp	 r12,r12,32
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd	 eq0,r13,@L236
	bsr	 _copy_to_reg
	or	 r25,r0,r2
@L236:
	ld	 r8,r30,100
	cmp	 r13,r21,r8
	bb0	 ne,r13,@L240
	ld	 r2,r30,100
	bsr.n	 _convert_to_mode
	or	 r3,r0,r25
	or	 r25,r0,r2
@L240:
	st	 r25,r16[r23]
	ld	 r24,r24,4
	ld	 r19,r19,4
	bcnd.n	 ne0,r24,@L233
	addu	 r23,r23,1
	ld	 r18,r30,12
@L352:
	ld	 r2,r18,52
	bsr.n	 _copy_parm_decls
	or	 r3,r0,r16
	bsr	 _emit_queue
	bsr	 _do_pending_stack_adjust
	ld	 r8,r30,36
	bcnd.n	 eq0,r8,@L242
	or.u	 r13,r0,hi16(_struct_value_rtx)
	ld	 r2,r13,lo16(_struct_value_rtx)
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,37
	bb1	 ne,r13,@L243
	ld	 r3,r30,36
	bsr.n	 _force_reg
	or	 r2,r0,4
	br.n	 @L242
	st	 r2,r30,84
	align	 4
@L243:
	ld	 r3,r30,36
	st	 r2,r30,84
	bsr.n	 _emit_move_insn
	ld	 r2,r30,84
@L242:
	ld	 r18,r30,52
	mak	 r4,r18,0<2>
	addu	 r13,r4,15
	and	 r13,r13,0xfff0
	subu	 r31,r31,r13
	or.u	 r13,r0,hi16(_reg_map)
	addu	 r2,r31,32
	or	 r3,r0,0
	bsr.n	 _memset
	st	 r2,r13,lo16(_reg_map)
	ld	 r8,r30,12
	ld	 r25,r8,52
	bcnd	 eq0,r25,@L245
	ld	 r12,r15,36
	or.u	 r22,r0,hi16(_parm_map)
	bcnd.n	 ge0,r12,@L246
	or	 r4,r0,r12
	addu	 r4,r12,3
@L246:
	and	 r4,r4,0xfffc
	addu	 r13,r4,15
	and	 r13,r13,0xfff0
	subu	 r31,r31,r13
	addu	 r2,r31,32
	st	 r2,r22,lo16(_parm_map)
	bsr.n	 _memset
	or	 r3,r0,0
	or.u	 r13,r0,hi16(_first_parm_offset)
	ld	 r12,r13,lo16(_first_parm_offset)
	bcnd	 ge0,r12,@L248
	addu	 r12,r12,3
@L248:
	or	 r24,r0,r25
	or	 r9,r0,r22
	or	 r23,r0,0
	ld	 r13,r9,lo16(_parm_map)
	and	 r12,r12,0xfffc
	or.u	 r25,r0,hi16(_frame_pointer_rtx)
	subu	 r13,r13,r12
	st	 r13,r9,lo16(_parm_map)
@L252:
	ld	 r13,r24,44
	bcnd	 lt0,r13,@L253
	ld	 r12,r16[r23]
	ld	 r11,r9,lo16(_parm_map)
	ext	 r13,r13,0<5>
	br.n	 @L255
	st	 r12,r11[r13]
	align	 4
@L253:
	ld	 r11,r24,64
	ld.hu	 r12,r0,r11
	cmp	 r13,r12,37
	bb1.n	 ne,r13,@L256
	or	 r10,r0,0
	ld	 r11,r11,4
	ld.hu	 r13,r0,r11
	cmp	 r13,r13,44
	bb1	 ne,r13,@L257
	ld	 r13,r11,4
	ld	 r12,r25,lo16(_frame_pointer_rtx)
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L258
	ld	 r12,r11,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb0	 ne,r13,@L343
@L258:
	ld	 r13,r11,8
	ld	 r12,r25,lo16(_frame_pointer_rtx)
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L257
	ld	 r12,r11,4
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L257
@L343:
	or	 r10,r0,r12
@L257:
	bcnd	 eq0,r10,@L261
	ld	 r13,r10,4
	bcnd	 ge0,r13,@L262
	addu	 r13,r13,3
@L262:
	ld	 r11,r9,lo16(_parm_map)
	ld	 r12,r16[r23]
	ext	 r13,r13,0<2>
	br.n	 @L255
	st	 r12,r11[r13]
	align	 4
@L261:
	bsr	 _abort
	align	 4
@L256:
	cmp	 r13,r12,34
	bb0	 ne,r13,@L255
	bsr	 _abort
	align	 4
@L255:
	ld	 r12,r24,64
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,34
	bb1.n	 ne,r13,@L251
	or.u	 r13,r0,hi16(_reg_map)
	ld	 r11,r12,4
	ld	 r12,r13,lo16(_reg_map)
	ld	 r13,r16[r23]
	st	 r13,r12[r11]
@L251:
	ld	 r24,r24,4
	bcnd.n	 ne0,r24,@L252
	addu	 r23,r23,1
	ld	 r18,r30,84
	bcnd.n	 eq0,r18,@L274
	or.u	 r13,r0,hi16(_struct_value_incoming_rtx)
	ld	 r11,r13,lo16(_struct_value_incoming_rtx)
	ld.hu	 r12,r0,r11
	cmp	 r13,r12,34
	bb0.n	 ne,r13,@L274
	cmp	 r13,r12,37
	bb1.n	 ne,r13,@L271
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r11,r11,4
	ld	 r13,r13,lo16(_frame_pointer_rtx)
	ld	 r12,r11,4
	cmp	 r12,r12,r13
	bb1	 ne,r12,@L271
	ld	 r12,r11,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L271
	ld	 r11,r12,4
	bcnd	 ge0,r11,@L272
	addu	 r11,r11,3
@L272:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r8,r30,84
	ld	 r12,r13,lo16(_parm_map)
	ext	 r13,r11,0<2>
	br.n	 @L274
	st	 r8,r12[r13]
	align	 4
@L271:
	bsr	 _abort
	align	 4
@L245:
	or.u	 r13,r0,hi16(_parm_map)
	st	 r0,r13,lo16(_parm_map)
@L274:
	ld	 r18,r30,68
	ld	 r8,r30,60
	subu	 r10,r18,r8
	mak	 r13,r10,0<2>
	addu	 r13,r13,15
	ld	 r23,r30,60
	and	 r13,r13,0xfff0
	subu	 r31,r31,r13
	mak	 r12,r23,0<2>
	addu	 r13,r31,32
	or.u	 r11,r0,hi16(_label_map)
	subu	 r13,r13,r12
	cmp	 r12,r23,r18
	bb0.n	 lt,r12,@L276
	st	 r13,r11,lo16(_label_map)
	mask	 r12,r10,3
	bcnd.n	 eq0,r12,@L278
	or	 r24,r0,r11
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L325
	cmp	 r13,r12,2
	bb0	 gt,r13,@L326
	bsr	 _gen_label_rtx
	ld	 r13,r24,lo16(_label_map)
	st	 r2,r13[r23]
	addu	 r23,r23,1
@L326:
	bsr	 _gen_label_rtx
	ld	 r13,r24,lo16(_label_map)
	st	 r2,r13[r23]
	addu	 r23,r23,1
@L325:
	bsr	 _gen_label_rtx
	ld	 r13,r24,lo16(_label_map)
	ld	 r18,r30,68
	st	 r2,r13[r23]
	addu	 r23,r23,1
	cmp	 r12,r23,r18
	bb0	 lt,r12,@L276
@L278:
	bsr.n	 _gen_label_rtx
	addu	 r25,r23,3
	ld	 r13,r24,lo16(_label_map)
	bsr.n	 _gen_label_rtx
	st	 r2,r13[r23]
	ld	 r12,r24,lo16(_label_map)
	addu	 r13,r23,1
	bsr.n	 _gen_label_rtx
	st	 r2,r12[r13]
	ld	 r13,r24,lo16(_label_map)
	addu	 r12,r23,2
	bsr.n	 _gen_label_rtx
	st	 r2,r13[r12]
	ld	 r8,r30,68
	addu	 r23,r23,4
	ld	 r13,r24,lo16(_label_map)
	cmp	 r12,r23,r8
	bb1.n	 lt,r12,@L278
	st	 r2,r13[r25]
@L276:
	ld	 r13,r15,4
	mak	 r13,r13,0<2>
	addu	 r13,r13,15
	or	 r3,r0,0
	and	 r13,r13,0xfff0
	ld	 r4,r15,4
	subu	 r31,r31,r13
	or.u	 r13,r0,hi16(_insn_map)
	addu	 r2,r31,32
	mak	 r4,r4,0<2>
	bsr.n	 _memset
	st	 r2,r13,lo16(_insn_map)
	ld	 r18,r30,36
	bcnd.n	 ne0,r18,@L349
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r8,r30,28
	ld.bu	 r2,r8,28
	bcnd	 ne0,r2,@L280
@L349:
	br.n	 @L282
	st	 r0,r13,lo16(_inline_target)
	align	 4
@L280:
	ld	 r18,r30,12
	ld	 r13,r18,48
	ld.bu	 r24,r13,28
	bcnd.n	 eq0,r14,@L283
	or	 r25,r0,r2
	ld.hu	 r13,r0,r14
	cmp	 r13,r13,34
	bb1	 ne,r13,@L283
	ld.bu	 r13,r14,2
	cmp	 r13,r13,r25
	bb0.n	 ne,r13,@L344
	or.u	 r13,r0,hi16(_inline_target)
@L283:
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,r25
	or.u	 r13,r0,hi16(_inline_target)
	or	 r14,r0,r2
@L344:
	st	 r14,r13,lo16(_inline_target)
	cmp	 r13,r24,r25
	bb0	 ne,r13,@L282
	or	 r2,r0,35
	or	 r3,r0,r24
	or	 r4,r0,r14
	bsr.n	 _gen_rtx
	or	 r5,r0,0
	or.u	 r13,r0,hi16(_inline_target)
	st	 r2,r13,lo16(_inline_target)
@L282:
	bsr	 _get_frame_size
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	subu	 r3,r0,r2
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	st	 r3,r13,lo16(_fp_delta)
	or	 r3,r0,r2
	bsr.n	 _copy_to_mode_reg
	or	 r2,r0,4
	ld	 r8,r30,12
	ld	 r24,r30,44
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	st	 r2,r13,lo16(_inline_fp_rtx)
	ld	 r3,r8,68
	bsr.n	 _assign_stack_local
	or	 r2,r0,0
	bcnd	 eq0,r24,@L287
@L289:
	ld.hu	 r11,r0,r24
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	or	 r23,r0,0
	st	 r0,r13,lo16(_orig_asm_operands_vector)
	or.u	 r13,r0,hi16(_copy_asm_operands_vector)
	cmp	 r12,r11,15
	bb0.n	 ne,r12,@L304
	st	 r0,r13,lo16(_copy_asm_operands_vector)
	bb0.n	 ls,r12,@L313
	cmp	 r13,r11,13
	bb0.n	 ne,r13,@L291
	cmp	 r13,r11,14
	bb0	 ne,r13,@L301
	br	 @L311
	align	 4
@L313:
	cmp	 r13,r11,17
	bb0	 ne,r13,@L306
	bb1.n	 lo,r13,@L307
	cmp	 r13,r11,18
	bb0	 ne,r13,@L308
	br	 @L311
	align	 4
@L291:
	ld	 r25,r24,16
	bcnd	 eq0,r17,@L292
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,25
	bb1.n	 ne,r13,@L294
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r25,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb0	 ne,r12,@L292
	ld	 r2,r25,8
	bsr.n	 _rtx_equal_p
	or	 r3,r0,r17
	bcnd	 eq0,r2,@L294
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r25,4
	or	 r4,r0,r2
	or	 r2,r0,25
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r5,r0,r17
	bsr.n	 _emit_insn
	or	 r17,r0,0
	or	 r20,r0,r2
	ld	 r13,r0,r20
	br.n	 @L350
	or	 r13,r13,2
	align	 4
@L294:
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,26
	bb1	 ne,r13,@L295
	ld	 r2,r25,4
	bsr.n	 _rtx_equal_p
	or	 r3,r0,r17
	bcnd.n	 eq0,r2,@L295
	or	 r2,r0,25
	or.u	 r13,r0,hi16(_inline_target)
	or	 r3,r0,0
	ld	 r4,r13,lo16(_inline_target)
	bsr.n	 _gen_rtx
	or	 r5,r0,r17
	bsr.n	 _emit_insn
	or	 r17,r0,0
	or	 r20,r0,r2
	ld	 r13,r0,r20
	br.n	 @L350
	or	 r13,r13,2
	align	 4
@L295:
	or	 r17,r0,0
@L292:
	ld.hu	 r11,r0,r25
	cmp	 r13,r11,26
	bb1.n	 ne,r13,@L297
	or	 r20,r0,0
	ld	 r13,r25,4
	or.u	 r12,r0,0x22
	or	 r12,r12,0x2
	ld	 r13,r0,r13
	and	 r13,r13,0x2
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L351
	or.u	 r13,r0,hi16(_insn_map)
@L297:
	cmp	 r13,r11,25
	bb1.n	 ne,r13,@L298
	or.u	 r13,r0,hi16(_cc0_rtx)
	ld	 r12,r25,4
	ld	 r13,r13,lo16(_cc0_rtx)
	cmp	 r12,r12,r13
	bb1	 ne,r12,@L298
	bsr.n	 _try_fold_cc0
	or	 r2,r0,r24
	or	 r23,r0,r2
@L298:
	bcnd	 eq0,r23,@L299
	or	 r24,r0,r23
	br.n	 @L351
	or.u	 r13,r0,hi16(_insn_map)
	align	 4
@L299:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r25
	bsr.n	 _emit_insn
	addu	 r1,r1,@L357
@L358:
	align	 4
@L301:
	ld	 r2,r24,16
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,29
	bb1.n	 ne,r13,@L302
	or	 r17,r0,0
	ld	 r18,r30,76
	bcnd	 ne0,r18,@L303
	bsr	 _gen_label_rtx
	st	 r2,r30,76
@L303:
	ld	 r2,r30,76
	bsr.n	 _emit_jump
	addu	 r1,r1,@L359
@L360:
	align	 4
@L302:
	bsr	 _copy_rtx_and_substitute
	bsr	 _emit_jump_insn
@L346:
	or	 r20,r0,r2
	ld	 r13,r0,r20
	or	 r13,r13,2
@L350:
	br.n	 @L290
	st	 r13,r0,r20
	align	 4
@L304:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r24,16
	bsr	 _emit_call_insn
	or	 r20,r0,r2
	ld	 r13,r0,r20
	or	 r13,r13,2
	st	 r13,r0,r20
	ld	 r12,r24,16
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,25
	bb1	 ne,r13,@L290
	ld	 r17,r12,4
	br.n	 @L351
	or.u	 r13,r0,hi16(_insn_map)
	align	 4
@L306:
	or.u	 r13,r0,hi16(_label_map)
	ld	 r12,r24,16
	ld	 r13,r13,lo16(_label_map)
	ld	 r2,r13[r12]
	bsr.n	 _emit_label
	or	 r17,r0,0
	br.n	 @L290
	or	 r20,r0,r2
	align	 4
@L307:
	bsr	 _emit_barrier
	br.n	 @L290
	or	 r20,r0,r2
	align	 4
@L308:
	ld	 r3,r24,20
	addu	 r13,r3,6
	bcnd.n	 eq0,r13,@L290
	or	 r20,r0,0
	bsr.n	 _emit_note
	ld	 r2,r24,16
	br.n	 @L290
	or	 r20,r0,r2
	align	 4
@L311:
	bsr	 _abort
	align	 4
@L290:
	or.u	 r13,r0,hi16(_insn_map)
@L351:
	ld	 r12,r24,4
	ld	 r13,r13,lo16(_insn_map)
	st	 r20,r13[r12]
	ld	 r24,r24,12
	bcnd	 ne0,r24,@L289
@L287:
	ld	 r8,r30,76
	bcnd	 eq0,r8,@L315
	bsr.n	 _emit_label
	ld	 r2,r30,76
@L315:
	ld	 r18,r30,12
	ld	 r2,r18,60
	bsr.n	 _copy_decl_tree
	or	 r3,r0,0
	bsr	 _getdecls
	or	 r3,r0,1
	bsr.n	 _expand_end_bindings
	or	 r4,r0,1
	or	 r2,r0,1
	or	 r3,r0,1
	bsr.n	 _poplevel
	or	 r4,r0,0
	ld	 r8,r30,20
	or.u	 r13,r0,hi16(_reg_map)
	st	 r0,r13,lo16(_reg_map)
	or.u	 r13,r0,hi16(_label_map)
	bcnd.n	 ne0,r8,@L317
	st	 r0,r13,lo16(_label_map)
	ld	 r18,r30,28
	ld.bu	 r13,r18,28
	bcnd	 ne0,r13,@L316
@L317:
	br.n	 @L320
	or	 r2,r0,0
	align	 4
@L316:
	ld	 r8,r30,36
	bcnd.n	 eq0,r8,@L320
	or	 r2,r0,r14
	bcnd	 ne0,r14,@L320
	ld	 r3,r30,36
	bsr.n	 _memory_address
	or	 r2,r0,26
	or	 r4,r0,r2
	or	 r2,r0,37
	or	 r3,r0,26
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L361
@L362:
	align	 4
@L320:
@Lte3:
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
	def	 @L361,@L320-@L362
	def	 @L359,@L290-@L360
	def	 @L357,@L346-@L358
	def	 @L355,@L236-@L356
	def	 @L353,@L236-@L354

	align	 8
_copy_parm_decls:
	subu	 r31,r31,64
	st	 r23,r31,36
	or	 r23,r0,r3
	st.d	 r24,r31,40
	or	 r25,r0,r2
	or	 r24,r0,0
	bcnd.n	 eq0,r25,@L371
	st	 r1,r31,48
@Ltb4:
@L373:
	ld	 r3,r25,36
	ld	 r4,r25,8
	bsr.n	 _build_decl
	or	 r2,r0,43
	bsr	 _pushdecl
	ld	 r13,r2,12
	or	 r13,r13,256
	st	 r13,r2,12
	ld	 r13,r23[r24]
	st	 r13,r2,64
	ld	 r25,r25,4
	bcnd.n	 ne0,r25,@L373
	addu	 r24,r24,1
@L371:
@Lte4:
	ld	 r1,r31,48
	ld	 r23,r31,36
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
_copy_decl_tree:
	subu	 r31,r31,64
	st.d	 r22,r31,32
	or	 r22,r0,r2
	or	 r23,r0,r3
	st	 r1,r31,48
	or	 r2,r0,0
	bsr.n	 _pushlevel
	st.d	 r24,r31,40
@Ltb5:
	ld	 r25,r22,28
	bcnd	 eq0,r25,@L393
@L395:
	ld.bu	 r2,r25,12
	ld	 r3,r25,36
	bsr.n	 _build_decl
	ld	 r4,r25,8
	ld	 r13,r25,20
	or	 r24,r0,r2
	st	 r13,r24,20
	ld	 r13,r25,16
	st	 r13,r24,16
	ld	 r11,r25,64
	bcnd	 eq0,r11,@L396
	ld.hu	 r13,r0,r11
	cmp	 r13,r13,37
	bb1	 ne,r13,@L397
	ld	 r13,r11,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,38
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L398
	mask	 r13,r12,0xffff
	cmp	 r12,r13,30
	cmp	 r13,r13,32
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L397
@L398:
	br.n	 @L396
	st	 r11,r24,64
	align	 4
@L397:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r25,64
	st	 r2,r24,64
@L396:
	ld	 r13,r24,12
	ld	 r12,r25,12
	and.u	 r13,r13,0xff7f
	mask.u	 r12,r12,0x80
	or	 r13,r13,r12
	st	 r13,r24,12
	ld	 r12,r25,12
	and.u	 r13,r13,0xffdf
	mask.u	 r12,r12,0x20
	or	 r13,r13,r12
	st	 r13,r24,12
	ld	 r12,r25,12
	and.u	 r13,r13,0xffbf
	mask.u	 r12,r12,0x40
	or	 r13,r13,r12
	st	 r13,r24,12
	ld	 r12,r25,12
	and.u	 r13,r13,0xfffd
	mask.u	 r12,r12,0x2
	or	 r13,r13,r12
	st	 r13,r24,12
	ld	 r12,r25,12
	and	 r13,r13,0xbfff
	mask	 r12,r12,16384
	or	 r13,r13,r12
	st	 r13,r24,12
	ld	 r12,r25,12
	and.u	 r13,r13,0xfffb
	mask.u	 r12,r12,0x4
	or	 r13,r13,r12
	st	 r13,r24,12
	ld	 r12,r25,12
	and.u	 r13,r13,0xffef
	mask.u	 r12,r12,0x10
	or	 r13,r13,r12
	or	 r2,r0,r24
	or	 r13,r13,256
	bsr.n	 _pushdecl
	st	 r13,r2,12
	ld	 r25,r25,4
	bcnd	 ne0,r25,@L395
@L393:
	ld	 r25,r22,24
	bcnd.n	 eq0,r25,@L407
	or	 r3,r0,0
	or	 r2,r0,r25
@L408:
	bsr.n	 _copy_decl_tree
	addu	 r3,r23,1
	ld	 r25,r25,4
	bcnd.n	 ne0,r25,@L408
	or	 r2,r0,r25
	or	 r3,r0,0
@L407:
	cmp	 r2,r23,0
	or	 r4,r0,0
	bsr.n	 _poplevel
	extu	 r2,r2,1<gt>
@Lte5:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	ld.d	 r22,r31,32
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
_copy_rtx_and_substitute:
	subu	 r31,r31,96
	st	 r1,r31,80
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	st.d	 r18,r31,48
	st.d	 r16,r31,40
	or	 r18,r0,r2
	bcnd.n	 ne0,r18,@L515
	st.d	 r14,r31,32
@Ltb6:
	br.n	 @L619
	or	 r2,r0,0
	align	 4
@L515:
	ld.hu	 r15,r0,r18
	ld.bu	 r23,r18,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L594)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L516
	or	 r13,r13,lo16(@L594)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L594:
	word	 @L524
	word	 @L516
	word	 @L516
	word	 @L516
	word	 @L516
	word	 @L531
	word	 @L516
	word	 @L516
	word	 @L516
	word	 @L516
	word	 @L516
	word	 @L533
	word	 @L593
	word	 @L530
	word	 @L530
	word	 @L516
	word	 @L530
	word	 @L517
	word	 @L516
	word	 @L516
	word	 @L554
	word	 @L525
	word	 @L530
	word	 @L530
	word	 @L516
	word	 @L516
	word	 @L516
	word	 @L536
	align	 4
@L517:
	ld	 r25,r18,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L518
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r18
	bb0.n	 (31-30),r13,@L519
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L520
	bsr	 _abort
	align	 4
@L520:
	ld.bu	 r13,r4,2
	cmp	 r13,r23,r13
	bb1.n	 ne,r13,@L521
	or	 r2,r0,35
	br.n	 @L619
	or	 r2,r0,r4
	align	 4
@L521:
	br.n	 @L622
	or	 r3,r0,r23
	align	 4
@L519:
	cmp	 r13,r25,14
	bb0.n	 eq,r13,@L619
	or	 r2,r0,r18
	or.u	 r13,r0,hi16(_fp_delta)
	ld	 r3,r13,lo16(_fp_delta)
	bsr.n	 _plus_constant
	addu	 r1,r1,@L632
@L633:
	align	 4
@L518:
	ld	 r13,r24,lo16(_reg_map)
	ld	 r13,r13[r25]
	bcnd	 ne0,r13,@L523
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,r23
	ld	 r13,r24,lo16(_reg_map)
	st	 r2,r13[r25]
@L523:
	ld	 r13,r24,lo16(_reg_map)
	ld	 r2,r13[r25]
	br	 @L619
	align	 4
@L524:
	or.u	 r13,r0,hi16(_label_map)
	ld	 r12,r18,16
	ld	 r13,r13,lo16(_label_map)
	ld	 r2,r13[r12]
	br	 @L619
	align	 4
@L525:
	bsr.n	 _rtx_alloc
	or	 r2,r0,38
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r18,4
	or.u	 r12,r0,hi16(_label_map)
	ld	 r11,r13,16
	ld	 r13,r12,lo16(_label_map)
	ld	 r13,r13[r11]
	br.n	 @L619
	st	 r13,r2,4
	align	 4
@L530:
	br.n	 @L619
	or	 r2,r0,r18
	align	 4
@L531:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r18,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L516
	bsr.n	 _rtx_alloc
	or	 r2,r0,22
	ld	 r13,r18,4
	or	 r22,r0,r2
	st	 r13,r22,4
	ld	 r13,r18,8
	st	 r13,r22,8
	or.u	 r13,r0,hi16(_copy_asm_operands_vector)
	ld	 r12,r18,12
	ld	 r13,r13,lo16(_copy_asm_operands_vector)
	st	 r12,r22,12
	st	 r13,r22,16
	ld	 r13,r18,20
	br.n	 @L619
	st	 r13,r2,20
	align	 4
@L533:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L535
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L516
@L535:
	ld	 r13,r18,4
	ld.bu	 r24,r18,2
	ld	 r2,r13,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r25,r13,2
	or	 r4,r0,r2
	or	 r2,r0,37
	bsr.n	 _gen_rtx
	or	 r3,r0,r25
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	or	 r5,r0,r2
	or	 r2,r0,28
	br.n	 @L623
	or	 r3,r0,r24
	align	 4
@L536:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L540
	ld	 r13,r18,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L537
	bb0.n	 ne,r12,@L540
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L539
	or	 r22,r0,r3
@L540:
	ld	 r22,r18,8
@L539:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L542
	ld	 r5,r22,4
	bcnd.n	 le0,r5,@L543
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r12,r13,lo16(_parm_map)
	ext	 r13,r5,0<2>
	ld	 r22,r12[r13]
	ld	 r2,r22,4
	br	 @L619
	align	 4
@L543:
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r23
@L623:
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L634
@L635:
	align	 4
@L542:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,r23
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or	 r3,r0,r2
	bsr.n	 _force_reg
	or	 r2,r0,r23
	or.u	 r13,r0,hi16(_fp_delta)
	ld	 r3,r13,lo16(_fp_delta)
	bsr.n	 _plus_constant
	addu	 r1,r1,@L636
@L637:
	align	 4
@L537:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L546
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L546
	ld	 r2,r18,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L548
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	ld	 r13,r18,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L638
@L639:
	align	 4
@L548:
	ld	 r13,r18,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L550
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r18,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L640
@L641:
	align	 4
@L550:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L624:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L642
@L643:
	align	 4
@L546:
	ld	 r2,r18,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L625:
	or	 r4,r0,r2
	br.n	 @L619
	or	 r2,r0,r4
	align	 4
@L554:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb0.n	 ne,r13,@L556
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 ne,r13,@L555
@L556:
	or.u	 r13,r0,hi16(_fp_delta)
	ld	 r3,r13,lo16(_fp_delta)
	br	 @L626
	align	 4
@L555:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L630
	or	 r2,r0,r23
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1	 ne,r12,@L557
	or	 r2,r0,r22
	bsr.n	 _copy_rtx_and_substitute
	addu	 r1,r1,@L644
@L645:
	align	 4
@L557:
@L630:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L558
	or	 r2,r0,r22
	bsr.n	 _copy_address
	addu	 r1,r1,@L646
@L647:
	align	 4
@L558:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L559
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L563
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L560
	bb0.n	 ne,r11,@L563
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L562
@L563:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L564
	align	 4
@L562:
	or	 r22,r0,r12
@L564:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L565
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L631
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L566
	bcnd.n	 ge0,r24,@L567
	or	 r3,r0,r24
	addu	 r3,r24,3
@L567:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L570
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L571:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L573
	subu	 r2,r2,1
	addu	 r13,r13,3
@L573:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L572
	bsr	 _abort
	align	 4
@L572:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L571
	addu	 r3,r3,4
@L570:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L575
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L575:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L619
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L619
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 ne,r13,@L577
	cmp	 r13,r12,34
	bsr.n	 _plus_constant
	ld	 r2,r22,4
	or	 r4,r0,r2
	br.n	 @L628
	or	 r2,r0,r22
	align	 4
@L577:
	bb1	 ne,r13,@L578
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L579
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L579:
	or	 r3,r0,r23
	or	 r4,r0,r22
@L622:
	or	 r5,r0,0
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L648
@L649:
	align	 4
@L578:
	bsr	 _abort
	align	 4
@L566:
	or.u	 r13,r0,hi16(_fp_delta)
@L631:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L565
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	or	 r3,r0,r24
@L626:
	bsr	 _plus_constant
@L627:
	or	 r4,r0,r2
	or	 r2,r0,37
	or	 r3,r0,r23
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L650
@L651:
	align	 4
@L565:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L652
@L653:
	align	 4
@L560:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L582
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L583
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L654
@L655:
	align	 4
@L583:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L585
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L656
@L657:
	align	 4
@L585:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L658
@L659:
	align	 4
@L582:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L588
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L660
@L661:
	align	 4
@L588:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L590
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L662
@L663:
	align	 4
@L590:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L664
@L665:
	align	 4
@L559:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L629:
	or	 r4,r0,r2
	or	 r2,r0,r18
@L628:
	or	 r3,r0,r23
	bsr.n	 _change_address
	addu	 r1,r1,@L666
@L667:
	align	 4
@L593:
	bsr	 _abort
	align	 4
@L516:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L597
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r18
	or	 r21,r0,r22
@L599:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L602
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L615
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L598
	cmp	 r13,r12,69
	bb0	 ne,r13,@L604
	br	 @L613
	align	 4
@L615:
	bb0	 ne,r13,@L612
	bb1.n	 gt,r13,@L616
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L612
	br	 @L613
	align	 4
@L616:
	bb0.n	 ne,r13,@L603
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L613
	align	 4
@L602:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L598
	st	 r2,r21,4
	align	 4
@L603:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L598
	st	 r13,r21,4
	align	 4
@L604:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L598
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L598
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L598
	or	 r19,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L609:
	ld	 r13,r19,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L609
	addu	 r25,r25,4
	br	 @L598
	align	 4
@L612:
	ld	 r13,r20,4
	br.n	 @L598
	st	 r13,r21,4
	align	 4
@L613:
	bsr	 _abort
	align	 4
@L598:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L599
	addu	 r21,r21,4
@L597:
	cmp	 r13,r15,22
	bb0.n	 eq,r13,@L619
	or	 r2,r0,r22
	or.u	 r12,r0,hi16(_orig_asm_operands_vector)
	ld	 r13,r12,lo16(_orig_asm_operands_vector)
	bcnd	 ne0,r13,@L619
	ld	 r13,r18,16
	st	 r13,r12,lo16(_orig_asm_operands_vector)
	ld	 r12,r22,16
	or.u	 r13,r0,hi16(_copy_asm_operands_vector)
	st	 r12,r13,lo16(_copy_asm_operands_vector)
	or	 r2,r0,r22
@L619:
@Lte6:
	ld	 r1,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	ld.d	 r14,r31,32
	jmp.n	 r1
	addu	 r31,r31,96
	def	 @L666,@L619-@L667
	def	 @L664,@L629-@L665
	def	 @L662,@L629-@L663
	def	 @L660,@L629-@L661
	def	 @L658,@L629-@L659
	def	 @L656,@L629-@L657
	def	 @L654,@L629-@L655
	def	 @L652,@L629-@L653
	def	 @L650,@L619-@L651
	def	 @L648,@L619-@L649
	def	 @L646,@L627-@L647
	def	 @L644,@L627-@L645
	def	 @L642,@L625-@L643
	def	 @L640,@L624-@L641
	def	 @L638,@L624-@L639
	def	 @L636,@L619-@L637
	def	 @L634,@L619-@L635
	def	 @L632,@L619-@L633

	align	 8
_copy_address:
	subu	 r31,r31,144
	st	 r1,r31,80
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	st.d	 r18,r31,48
	st.d	 r16,r31,40
	or	 r19,r0,r2
	bcnd.n	 ne0,r19,@L669
	st.d	 r14,r31,32
@Ltb7:
@L1243:
	br.n	 @L1232
	or	 r2,r0,0
	align	 4
@L669:
	ld.hu	 r2,r0,r19
	ld.bu	 r25,r19,2
	subu	 r11,r2,17
	or.u	 r13,r0,hi16(@L998)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L670
	or	 r13,r13,lo16(@L998)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L998:
	word	 @L887
	word	 @L670
	word	 @L670
	word	 @L670
	word	 @L670
	word	 @L670
	word	 @L670
	word	 @L670
	word	 @L670
	word	 @L670
	word	 @L670
	word	 @L670
	word	 @L670
	word	 @L997
	word	 @L997
	word	 @L670
	word	 @L997
	word	 @L671
	word	 @L670
	word	 @L670
	word	 @L780
	word	 @L887
	word	 @L997
	word	 @L997
	word	 @L670
	word	 @L670
	word	 @L670
	word	 @L778
	align	 4
@L671:
	ld	 r13,r19,4
	cmp	 r13,r13,14
	bb0	 ne,r13,@L672
	bcnd	 eq0,r19,@L1243
	ld.hu	 r15,r0,r19
	ld.bu	 r23,r19,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L753)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L675
	or	 r13,r13,lo16(@L753)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L753:
	word	 @L683
	word	 @L675
	word	 @L675
	word	 @L675
	word	 @L675
	word	 @L690
	word	 @L675
	word	 @L675
	word	 @L675
	word	 @L675
	word	 @L675
	word	 @L692
	word	 @L752
	word	 @L997
	word	 @L997
	word	 @L675
	word	 @L997
	word	 @L676
	word	 @L675
	word	 @L675
	word	 @L713
	word	 @L684
	word	 @L997
	word	 @L997
	word	 @L675
	word	 @L675
	word	 @L675
	word	 @L695
	align	 4
@L676:
	ld	 r25,r19,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L1286
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r19
	bb0.n	 (31-30),r13,@L678
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L679
	bsr	 _abort
	align	 4
@L679:
	ld.bu	 r13,r4,2
	cmp	 r13,r23,r13
	bb0.n	 ne,r13,@L1285
	or	 r2,r0,35
	or	 r3,r0,r23
@L1250:
	or	 r5,r0,0
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L1301
@L1302:
	align	 4
@L678:
	cmp	 r13,r25,14
	bb0.n	 ne,r13,@L1287
	or.u	 r13,r0,hi16(_fp_delta)
	br.n	 @L1232
	or	 r2,r0,r19
	align	 4
@L677:
@L1286:
	ld	 r13,r24,lo16(_reg_map)
	ld	 r13,r13[r25]
	bcnd	 ne0,r13,@L682
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,r23
	ld	 r13,r24,lo16(_reg_map)
	st	 r2,r13[r25]
@L682:
	ld	 r13,r24,lo16(_reg_map)
	ld	 r2,r13[r25]
	br	 @L1232
	align	 4
@L683:
	or.u	 r13,r0,hi16(_label_map)
	ld	 r12,r19,16
	ld	 r13,r13,lo16(_label_map)
	ld	 r2,r13[r12]
	br	 @L1232
	align	 4
@L684:
	bsr.n	 _rtx_alloc
	or	 r2,r0,38
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r19,4
	or.u	 r12,r0,hi16(_label_map)
	ld	 r11,r13,16
	ld	 r13,r12,lo16(_label_map)
	ld	 r13,r13[r11]
	br.n	 @L1232
	st	 r13,r2,4
	align	 4
@L690:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r19,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L675
@L1263:
	bsr.n	 _rtx_alloc
	or	 r2,r0,22
	ld	 r13,r19,4
	or	 r22,r0,r2
	st	 r13,r22,4
	ld	 r13,r19,8
	st	 r13,r22,8
	or.u	 r13,r0,hi16(_copy_asm_operands_vector)
	ld	 r12,r19,12
	ld	 r13,r13,lo16(_copy_asm_operands_vector)
	st	 r12,r22,12
	st	 r13,r22,16
	ld	 r13,r19,20
	br.n	 @L1232
	st	 r13,r2,20
	align	 4
@L692:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L694
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L675
@L694:
	ld	 r13,r19,4
	ld.bu	 r24,r19,2
	ld	 r2,r13,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r25,r13,2
	or	 r4,r0,r2
	or	 r2,r0,37
	bsr.n	 _gen_rtx
	or	 r3,r0,r25
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,28
	or	 r3,r0,r24
@L1245:
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L1303
@L1304:
	align	 4
@L695:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L699
	ld	 r13,r19,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L696
	bb0.n	 ne,r12,@L699
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L698
	or	 r22,r0,r3
@L699:
	ld	 r22,r19,8
@L698:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L701
	ld	 r5,r22,4
	bcnd.n	 le0,r5,@L702
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r13,r0,hi16(_parm_map)
@L1293:
	ld	 r12,r13,lo16(_parm_map)
	ext	 r13,r5,0<2>
	ld	 r22,r12[r13]
	ld	 r2,r22,4
	br	 @L1232
	align	 4
@L702:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L1245
	or	 r3,r0,r23
	align	 4
@L701:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,r23
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or	 r3,r0,r2
	or	 r2,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L1305
@L1306:
	align	 4
@L696:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L705
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L705
	ld	 r2,r19,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L707
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	ld	 r13,r19,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1307
@L1308:
	align	 4
@L707:
	ld	 r13,r19,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L709
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r19,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1309
@L1310:
	align	 4
@L709:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r19,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L1247:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L1311
@L1312:
	align	 4
@L705:
	ld	 r2,r19,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r19,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L1248:
	or	 r4,r0,r2
@L1285:
	br.n	 @L1232
	or	 r2,r0,r4
	align	 4
@L713:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb0.n	 ne,r13,@L715
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 ne,r13,@L714
@L715:
	or.u	 r13,r0,hi16(_fp_delta)
	ld	 r3,r13,lo16(_fp_delta)
@L1251:
	bsr	 _plus_constant
@L1249:
	or	 r4,r0,r2
	or	 r2,r0,37
	or	 r3,r0,r23
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L1313
@L1314:
	align	 4
@L714:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L1288
	or	 r2,r0,r23
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1	 ne,r12,@L716
	or	 r2,r0,r22
	bsr.n	 _copy_rtx_and_substitute
	subu	 r1,r1,@L1315
@L1316:
	align	 4
@L716:
@L1288:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L717
	or	 r2,r0,r22
	bsr.n	 _copy_address
	subu	 r1,r1,@L1317
@L1318:
	align	 4
@L717:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L718
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L722
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L719
	bb0.n	 ne,r11,@L722
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L721
@L722:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L723
	align	 4
@L721:
	or	 r22,r0,r12
@L723:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L724
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L1289
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L725
	bcnd.n	 ge0,r24,@L726
	or	 r3,r0,r24
	addu	 r3,r24,3
@L726:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L729
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L730:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L732
	subu	 r2,r2,1
	addu	 r13,r13,3
@L732:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L731
	bsr	 _abort
	align	 4
@L731:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L730
	addu	 r3,r3,4
@L729:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L734
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L734:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L1232
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L1232
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 ne,r13,@L736
	cmp	 r13,r12,34
@L1267:
	bsr.n	 _plus_constant
	ld	 r2,r22,4
	or	 r4,r0,r2
	or	 r2,r0,r22
@L1253:
	or	 r3,r0,r23
	bsr.n	 _change_address
	addu	 r1,r1,@L1319
@L1320:
	align	 4
@L736:
	bb1	 ne,r13,@L737
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L738
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L738:
	or	 r3,r0,r23
	br.n	 @L1250
	or	 r4,r0,r22
	align	 4
@L737:
	bsr	 _abort
	align	 4
@L725:
	or.u	 r13,r0,hi16(_fp_delta)
@L1289:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L724
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L1251
	or	 r3,r0,r24
	align	 4
@L724:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L1321
@L1322:
	align	 4
@L719:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L741
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L742
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1323
@L1324:
	align	 4
@L742:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L744
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1325
@L1326:
	align	 4
@L744:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L1327
@L1328:
	align	 4
@L741:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L747
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1329
@L1330:
	align	 4
@L747:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L749
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1331
@L1332:
	align	 4
@L749:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L1333
@L1334:
	align	 4
@L718:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L1252:
	or	 r4,r0,r2
	br.n	 @L1253
	or	 r2,r0,r19
	align	 4
@L752:
	bsr	 _abort
	align	 4
@L675:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L971
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r19
	or	 r21,r0,r22
@L758:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L761
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L774
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L757
	cmp	 r13,r12,69
	bb0	 ne,r13,@L763
	br	 @L772
	align	 4
@L774:
	bb0	 ne,r13,@L771
	bb1.n	 gt,r13,@L775
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L771
	br	 @L772
	align	 4
@L775:
	bb0.n	 ne,r13,@L762
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L772
	align	 4
@L761:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L757
	st	 r2,r21,4
	align	 4
@L762:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L757
	st	 r13,r21,4
	align	 4
@L763:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L757
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L757
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L757
	or	 r18,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L768:
	ld	 r13,r18,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L768
	addu	 r25,r25,4
	br	 @L757
	align	 4
@L771:
	ld	 r13,r20,4
	br.n	 @L757
	st	 r13,r21,4
	align	 4
@L772:
	bsr	 _abort
	align	 4
@L757:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L758
	addu	 r21,r21,4
	br.n	 @L1290
	cmp	 r13,r15,22
	align	 4
@L672:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r2,r13,lo16(_frame_pointer_rtx)
@L1246:
	or.u	 r13,r0,hi16(_fp_delta)
	ld	 r3,r13,lo16(_fp_delta)
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1335
@L1336:
	align	 4
@L778:
	ld	 r12,r19,4
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,34
	bb1	 ne,r13,@L670
	ld	 r13,r12,4
	cmp	 r13,r13,14
	bb1.n	 ne,r13,@L670
	or.u	 r13,r0,hi16(_fp_delta)
@L1287:
	ld	 r3,r13,lo16(_fp_delta)
	or	 r2,r0,r19
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1337
@L1338:
	align	 4
@L780:
	bcnd.n	 ne0,r19,@L782
	or.u	 r13,r0,hi16(@L861)
	br.n	 @L781
	or	 r2,r0,0
	align	 4
@L782:
	ld.hu	 r15,r0,r19
	ld.bu	 r23,r19,2
	subu	 r11,r15,17
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L783
	or	 r13,r13,lo16(@L861)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L861:
	word	 @L791
	word	 @L783
	word	 @L783
	word	 @L783
	word	 @L783
	word	 @L798
	word	 @L783
	word	 @L783
	word	 @L783
	word	 @L783
	word	 @L783
	word	 @L800
	word	 @L860
	word	 @L797
	word	 @L797
	word	 @L783
	word	 @L797
	word	 @L784
	word	 @L783
	word	 @L783
	word	 @L821
	word	 @L792
	word	 @L797
	word	 @L797
	word	 @L783
	word	 @L783
	word	 @L783
	word	 @L803
	align	 4
@L784:
	ld	 r25,r19,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L785
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r19
	bb0.n	 (31-30),r13,@L786
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L787
	bsr	 _abort
	align	 4
@L787:
	ld.bu	 r13,r4,2
	cmp	 r13,r23,r13
	bb1.n	 ne,r13,@L788
	or	 r2,r0,35
	br.n	 @L781
	or	 r2,r0,r4
	align	 4
@L788:
	br.n	 @L1254
	or	 r3,r0,r23
	align	 4
@L786:
	cmp	 r13,r25,14
	bb1.n	 ne,r13,@L781
	or	 r2,r0,r19
	or.u	 r13,r0,hi16(_fp_delta)
	ld	 r3,r13,lo16(_fp_delta)
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1339
@L1340:
	align	 4
@L785:
	ld	 r13,r24,lo16(_reg_map)
	ld	 r13,r13[r25]
	bcnd	 ne0,r13,@L790
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,r23
	ld	 r13,r24,lo16(_reg_map)
	st	 r2,r13[r25]
@L790:
	ld	 r13,r24,lo16(_reg_map)
	ld	 r2,r13[r25]
	br	 @L781
	align	 4
@L791:
	or.u	 r13,r0,hi16(_label_map)
	ld	 r12,r19,16
	ld	 r13,r13,lo16(_label_map)
	ld	 r2,r13[r12]
	br	 @L781
	align	 4
@L792:
	bsr.n	 _rtx_alloc
	or	 r2,r0,38
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r19,4
	or.u	 r12,r0,hi16(_label_map)
	ld	 r11,r13,16
	ld	 r13,r12,lo16(_label_map)
	ld	 r13,r13[r11]
	br.n	 @L781
	st	 r13,r2,4
	align	 4
@L797:
	br.n	 @L781
	or	 r2,r0,r19
	align	 4
@L798:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r19,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L783
	bsr.n	 _rtx_alloc
	or	 r2,r0,22
	ld	 r13,r19,4
	or	 r22,r0,r2
	st	 r13,r22,4
	ld	 r13,r19,8
	st	 r13,r22,8
	or.u	 r13,r0,hi16(_copy_asm_operands_vector)
	ld	 r12,r19,12
	ld	 r13,r13,lo16(_copy_asm_operands_vector)
	st	 r12,r22,12
	st	 r13,r22,16
	ld	 r13,r19,20
	br.n	 @L781
	st	 r13,r2,20
	align	 4
@L800:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L802
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L783
@L802:
	ld	 r13,r19,4
	ld.bu	 r24,r19,2
	ld	 r2,r13,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r25,r13,2
	or	 r4,r0,r2
	or	 r2,r0,37
	bsr.n	 _gen_rtx
	or	 r3,r0,r25
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,28
	br.n	 @L1255
	or	 r3,r0,r24
	align	 4
@L803:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L807
	ld	 r13,r19,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L804
	bb0.n	 ne,r12,@L807
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L806
	or	 r22,r0,r3
@L807:
	ld	 r22,r19,8
@L806:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L809
	ld	 r5,r22,4
	bcnd.n	 le0,r5,@L810
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r12,r13,lo16(_parm_map)
	ext	 r13,r5,0<2>
	ld	 r22,r12[r13]
	ld	 r2,r22,4
	br	 @L781
	align	 4
@L810:
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r23
@L1255:
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L1341
@L1342:
	align	 4
@L809:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,r23
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or	 r3,r0,r2
	bsr.n	 _force_reg
	or	 r2,r0,r23
	or.u	 r13,r0,hi16(_fp_delta)
	ld	 r3,r13,lo16(_fp_delta)
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1343
@L1344:
	align	 4
@L804:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L813
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L813
	ld	 r2,r19,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L815
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	ld	 r13,r19,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1345
@L1346:
	align	 4
@L815:
	ld	 r13,r19,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L817
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r19,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1347
@L1348:
	align	 4
@L817:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r19,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L1256:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L1349
@L1350:
	align	 4
@L813:
	ld	 r2,r19,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r19,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L1257:
	or	 r4,r0,r2
	br.n	 @L781
	or	 r2,r0,r4
	align	 4
@L821:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb0.n	 ne,r13,@L823
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 ne,r13,@L822
@L823:
	or.u	 r13,r0,hi16(_fp_delta)
	ld	 r3,r13,lo16(_fp_delta)
	br	 @L1258
	align	 4
@L822:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L1291
	or	 r2,r0,r23
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1	 ne,r12,@L824
	or	 r2,r0,r22
	bsr.n	 _copy_rtx_and_substitute
	addu	 r1,r1,@L1351
@L1352:
	align	 4
@L824:
@L1291:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L825
	or	 r2,r0,r22
	bsr.n	 _copy_address
	addu	 r1,r1,@L1353
@L1354:
	align	 4
@L825:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L826
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L830
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L827
	bb0.n	 ne,r11,@L830
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L829
@L830:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L831
	align	 4
@L829:
	or	 r22,r0,r12
@L831:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L832
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L1292
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L833
	bcnd.n	 ge0,r24,@L834
	or	 r3,r0,r24
	addu	 r3,r24,3
@L834:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L837
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L838:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L840
	subu	 r2,r2,1
	addu	 r13,r13,3
@L840:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L839
	bsr	 _abort
	align	 4
@L839:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L838
	addu	 r3,r3,4
@L837:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L842
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L842:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L781
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L781
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 ne,r13,@L844
	cmp	 r13,r12,34
	bsr.n	 _plus_constant
	ld	 r2,r22,4
	or	 r4,r0,r2
	br.n	 @L1260
	or	 r2,r0,r22
	align	 4
@L844:
	bb1	 ne,r13,@L845
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L846
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L846:
	or	 r3,r0,r23
	or	 r4,r0,r22
@L1254:
	or	 r5,r0,0
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L1355
@L1356:
	align	 4
@L845:
	bsr	 _abort
	align	 4
@L833:
	or.u	 r13,r0,hi16(_fp_delta)
@L1292:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L832
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	or	 r3,r0,r24
@L1258:
	bsr	 _plus_constant
@L1259:
	or	 r4,r0,r2
	or	 r2,r0,37
	or	 r3,r0,r23
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L1357
@L1358:
	align	 4
@L832:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L1359
@L1360:
	align	 4
@L827:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L849
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L850
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1361
@L1362:
	align	 4
@L850:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L852
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1363
@L1364:
	align	 4
@L852:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L1365
@L1366:
	align	 4
@L849:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L855
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1367
@L1368:
	align	 4
@L855:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L857
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1369
@L1370:
	align	 4
@L857:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L1371
@L1372:
	align	 4
@L826:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L1261:
	or	 r4,r0,r2
	or	 r2,r0,r19
@L1260:
	or	 r3,r0,r23
	bsr.n	 _change_address
	addu	 r1,r1,@L1373
@L1374:
	align	 4
@L860:
	bsr	 _abort
	align	 4
@L783:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L864
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r19
	or	 r21,r0,r22
@L866:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L869
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L882
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L865
	cmp	 r13,r12,69
	bb0	 ne,r13,@L871
	br	 @L880
	align	 4
@L882:
	bb0	 ne,r13,@L879
	bb1.n	 gt,r13,@L883
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L879
	br	 @L880
	align	 4
@L883:
	bb0.n	 ne,r13,@L870
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L880
	align	 4
@L869:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L865
	st	 r2,r21,4
	align	 4
@L870:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L865
	st	 r13,r21,4
	align	 4
@L871:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L865
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L865
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L865
	or	 r18,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L876:
	ld	 r13,r18,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L876
	addu	 r25,r25,4
	br	 @L865
	align	 4
@L879:
	ld	 r13,r20,4
	br.n	 @L865
	st	 r13,r21,4
	align	 4
@L880:
	bsr	 _abort
	align	 4
@L865:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L866
	addu	 r21,r21,4
@L864:
	cmp	 r13,r15,22
	bb1.n	 ne,r13,@L781
	or	 r2,r0,r22
	or.u	 r12,r0,hi16(_orig_asm_operands_vector)
	ld	 r13,r12,lo16(_orig_asm_operands_vector)
	bcnd	 ne0,r13,@L781
	ld	 r13,r19,16
	st	 r13,r12,lo16(_orig_asm_operands_vector)
	ld	 r12,r22,16
	or.u	 r13,r0,hi16(_copy_asm_operands_vector)
	st	 r12,r13,lo16(_copy_asm_operands_vector)
	or	 r2,r0,r22
@L781:
	bsr.n	 _copy_to_reg
	addu	 r1,r1,@L1375
@L1376:
	align	 4
@L887:
	bcnd	 eq0,r19,@L1243
	ld.hu	 r15,r0,r19
	ld.bu	 r23,r19,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L968)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L890
	or	 r13,r13,lo16(@L968)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L968:
	word	 @L683
	word	 @L890
	word	 @L890
	word	 @L890
	word	 @L890
	word	 @L905
	word	 @L890
	word	 @L890
	word	 @L890
	word	 @L890
	word	 @L890
	word	 @L907
	word	 @L967
	word	 @L997
	word	 @L997
	word	 @L890
	word	 @L997
	word	 @L891
	word	 @L890
	word	 @L890
	word	 @L928
	word	 @L684
	word	 @L997
	word	 @L997
	word	 @L890
	word	 @L890
	word	 @L890
	word	 @L910
	align	 4
@L891:
	ld	 r25,r19,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L677
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r19
	bb0.n	 (31-30),r13,@L678
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L679
	bsr	 _abort
	align	 4
@L905:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r19,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L1263
	br	 @L890
	align	 4
@L907:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L694
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L890
	br	 @L694
	align	 4
@L910:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L914
	ld	 r13,r19,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L911
	bb0.n	 ne,r12,@L914
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L913
	or	 r22,r0,r3
@L914:
	ld	 r22,r19,8
@L913:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L916
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L1293
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L1245
	or	 r3,r0,r23
	align	 4
@L916:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,r23
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or	 r3,r0,r2
	or	 r2,r0,r23
	bsr.n	 _force_reg
	subu	 r1,r1,@L1377
@L1378:
	align	 4
@L911:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L705
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L705
	ld	 r2,r19,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L922
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	ld	 r13,r19,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1379
@L1380:
	align	 4
@L922:
	ld	 r13,r19,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L924
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r19,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1381
@L1382:
	align	 4
@L924:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r19,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L1265:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr.n	 _memory_address
	subu	 r1,r1,@L1383
@L1384:
	align	 4
@L928:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L715
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L715
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L931
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L1294
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr.n	 _copy_rtx_and_substitute
	subu	 r1,r1,@L1385
@L1386:
	align	 4
@L931:
	or	 r2,r0,r23
@L1294:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L932
	or	 r2,r0,r22
	bsr.n	 _copy_address
	subu	 r1,r1,@L1387
@L1388:
	align	 4
@L932:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L933
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L937
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L934
	bb0.n	 ne,r11,@L937
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L936
@L937:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L938
	align	 4
@L936:
	or	 r22,r0,r12
@L938:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L939
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L1295
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L940
	bcnd.n	 ge0,r24,@L941
	or	 r3,r0,r24
	addu	 r3,r24,3
@L941:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L944
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L945:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L947
	subu	 r2,r2,1
	addu	 r13,r13,3
@L947:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L946
	bsr	 _abort
	align	 4
@L946:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L945
	addu	 r3,r3,4
@L944:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L949
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L949:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L1232
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L1232
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L1267
	cmp	 r13,r12,34
	bb1	 ne,r13,@L952
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L953
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L953:
	or	 r3,r0,r23
	br.n	 @L1250
	or	 r4,r0,r22
	align	 4
@L952:
	bsr	 _abort
	align	 4
@L940:
	or.u	 r13,r0,hi16(_fp_delta)
@L1295:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L939
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L1251
	or	 r3,r0,r24
	align	 4
@L939:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L1389
@L1390:
	align	 4
@L934:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L956
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L957
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1391
@L1392:
	align	 4
@L957:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L959
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1393
@L1394:
	align	 4
@L959:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L1395
@L1396:
	align	 4
@L956:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L962
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1397
@L1398:
	align	 4
@L962:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L964
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1399
@L1400:
	align	 4
@L964:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L1401
@L1402:
	align	 4
@L933:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L1268:
	or	 r4,r0,r2
	br.n	 @L1253
	or	 r2,r0,r19
	align	 4
@L967:
	bsr	 _abort
	align	 4
@L890:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L971
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r19
	or	 r21,r0,r22
@L973:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L976
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L989
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L972
	cmp	 r13,r12,69
	bb0	 ne,r13,@L978
	br	 @L987
	align	 4
@L989:
	bb0	 ne,r13,@L986
	bb1.n	 gt,r13,@L990
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L986
	br	 @L987
	align	 4
@L990:
	bb0.n	 ne,r13,@L977
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L987
	align	 4
@L976:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L972
	st	 r2,r21,4
	align	 4
@L977:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L972
	st	 r13,r21,4
	align	 4
@L978:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L972
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L972
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L972
	or	 r18,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L983:
	ld	 r13,r18,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L983
	addu	 r25,r25,4
	br	 @L972
	align	 4
@L986:
	ld	 r13,r20,4
	br.n	 @L972
	st	 r13,r21,4
	align	 4
@L987:
	bsr	 _abort
	align	 4
@L972:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L973
	addu	 r21,r21,4
@L971:
	cmp	 r13,r15,22
@L1290:
	bb0.n	 eq,r13,@L1232
	or	 r2,r0,r22
	or.u	 r12,r0,hi16(_orig_asm_operands_vector)
	ld	 r13,r12,lo16(_orig_asm_operands_vector)
	bcnd	 ne0,r13,@L1232
	ld	 r13,r19,16
	st	 r13,r12,lo16(_orig_asm_operands_vector)
	ld	 r12,r22,16
	or.u	 r13,r0,hi16(_copy_asm_operands_vector)
	br.n	 @L1232
	st	 r12,r13,lo16(_copy_asm_operands_vector)
	align	 4
@L997:
	br.n	 @L1232
	or	 r2,r0,r19
	align	 4
@L670:
	bsr	 _rtx_alloc
	st	 r2,r31,92
	st.b	 r25,r2,2
	ld	 r9,r31,92
	ld	 r12,r0,r19
	ld	 r13,r0,r9
	mask	 r12,r12,8
	and	 r13,r13,0xfff7
	or	 r13,r13,r12
	st	 r13,r0,r9
	ld	 r12,r0,r19
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r9
	ld	 r12,r0,r19
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r9
	or.u	 r13,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r9
	or	 r13,r13,lo16(_rtx_length)
	or.u	 r12,r0,hi16(_rtx_format)
	ld	 r13,r13[r11]
	or	 r12,r12,lo16(_rtx_format)
	st	 r0,r31,100
	ld	 r11,r12[r11]
	bcnd.n	 le0,r13,@L1001
	st	 r11,r31,108
	ld	 r9,r31,92
	st	 r19,r31,132
	or.u	 r13,r0,hi16(_mode_size)
	st	 r9,r31,140
@L1003:
	ld	 r9,r31,108
	ld.b	 r12,r0,r9
	addu	 r9,r9,1
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L1006
	st	 r9,r31,108
	bb1.n	 gt,r13,@L1229
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L1002
	cmp	 r13,r12,69
	bb0	 ne,r13,@L1113
	br	 @L1227
	align	 4
@L1229:
	bb0	 ne,r13,@L1226
	bb1.n	 gt,r13,@L1230
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L1226
	br	 @L1227
	align	 4
@L1230:
	bb0.n	 ne,r13,@L1112
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L1227
	align	 4
@L1006:
	ld	 r9,r31,132
	ld	 r19,r9,4
	bcnd.n	 ne0,r19,@L1008
	or.u	 r13,r0,hi16(@L1087)
	br.n	 @L1007
	or	 r2,r0,0
	align	 4
@L1008:
	ld.hu	 r15,r0,r19
	ld.bu	 r22,r19,2
	subu	 r11,r15,17
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L1009
	or	 r13,r13,lo16(@L1087)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L1087:
	word	 @L1017
	word	 @L1009
	word	 @L1009
	word	 @L1009
	word	 @L1009
	word	 @L1024
	word	 @L1009
	word	 @L1009
	word	 @L1009
	word	 @L1009
	word	 @L1009
	word	 @L1026
	word	 @L1086
	word	 @L1023
	word	 @L1023
	word	 @L1009
	word	 @L1023
	word	 @L1010
	word	 @L1009
	word	 @L1009
	word	 @L1047
	word	 @L1018
	word	 @L1023
	word	 @L1023
	word	 @L1009
	word	 @L1009
	word	 @L1009
	word	 @L1029
	align	 4
@L1010:
	ld	 r25,r19,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L1011
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r19
	bb0.n	 (31-30),r13,@L1012
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1013
	bsr	 _abort
	align	 4
@L1013:
	ld.bu	 r13,r4,2
	cmp	 r13,r22,r13
	bb1.n	 ne,r13,@L1014
	or	 r2,r0,35
	br.n	 @L1007
	or	 r2,r0,r4
	align	 4
@L1014:
	br.n	 @L1269
	or	 r3,r0,r22
	align	 4
@L1012:
	cmp	 r13,r25,14
	bb1.n	 ne,r13,@L1007
	or	 r2,r0,r19
	or.u	 r9,r0,hi16(_fp_delta)
	ld	 r3,r9,lo16(_fp_delta)
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1403
@L1404:
	align	 4
@L1011:
	ld	 r13,r24,lo16(_reg_map)
	ld	 r13,r13[r25]
	bcnd	 ne0,r13,@L1016
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,r22
	ld	 r13,r24,lo16(_reg_map)
	st	 r2,r13[r25]
@L1016:
	ld	 r13,r24,lo16(_reg_map)
	ld	 r2,r13[r25]
	br	 @L1007
	align	 4
@L1017:
	or.u	 r13,r0,hi16(_label_map)
	ld	 r12,r19,16
	ld	 r13,r13,lo16(_label_map)
	ld	 r2,r13[r12]
	br	 @L1007
	align	 4
@L1018:
	bsr.n	 _rtx_alloc
	or	 r2,r0,38
	or	 r23,r0,r2
	st.b	 r22,r23,2
	ld	 r13,r19,4
	or.u	 r12,r0,hi16(_label_map)
	ld	 r11,r13,16
	ld	 r13,r12,lo16(_label_map)
	ld	 r13,r13[r11]
	br.n	 @L1007
	st	 r13,r2,4
	align	 4
@L1023:
	br.n	 @L1007
	or	 r2,r0,r19
	align	 4
@L1024:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r19,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L1009
	bsr.n	 _rtx_alloc
	or	 r2,r0,22
	ld	 r13,r19,4
	or	 r23,r0,r2
	st	 r13,r23,4
	ld	 r13,r19,8
	st	 r13,r23,8
	or.u	 r13,r0,hi16(_copy_asm_operands_vector)
	ld	 r12,r19,12
	ld	 r13,r13,lo16(_copy_asm_operands_vector)
	st	 r12,r23,12
	st	 r13,r23,16
	ld	 r13,r19,20
	br.n	 @L1007
	st	 r13,r2,20
	align	 4
@L1026:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L1028
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L1009
@L1028:
	ld	 r13,r19,4
	ld.bu	 r24,r19,2
	ld	 r2,r13,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r25,r13,2
	or	 r4,r0,r2
	or	 r2,r0,37
	bsr.n	 _gen_rtx
	or	 r3,r0,r25
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,28
	br.n	 @L1270
	or	 r3,r0,r24
	align	 4
@L1029:
	or.u	 r9,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r19,4
	ld	 r2,r9,lo16(_frame_pointer_rtx)
	cmp	 r11,r3,r2
	bb0	 ne,r11,@L1033
	ld	 r13,r19,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L1030
	bb0.n	 ne,r11,@L1033
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L1032
	or	 r23,r0,r3
@L1033:
	ld	 r23,r19,8
@L1032:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1035
	ld	 r5,r23,4
	bcnd.n	 le0,r5,@L1036
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r12,r13,lo16(_parm_map)
	ext	 r13,r5,0<2>
	ld	 r23,r12[r13]
	ld	 r2,r23,4
	br	 @L1007
	align	 4
@L1036:
	or.u	 r9,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r9,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r9,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r9,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r22
@L1270:
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L1405
@L1406:
	align	 4
@L1035:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r23
	or.u	 r9,r0,hi16(_frame_pointer_rtx)
	or	 r23,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r22
	ld	 r4,r9,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r23
	or	 r3,r0,r2
	bsr.n	 _force_reg
	or	 r2,r0,r22
	or.u	 r9,r0,hi16(_fp_delta)
	ld	 r3,r9,lo16(_fp_delta)
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1407
@L1408:
	align	 4
@L1030:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1039
	or	 r2,r0,r22
	bsr.n	 _memory_address_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1039
	ld	 r2,r19,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1041
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	ld	 r13,r19,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1409
@L1410:
	align	 4
@L1041:
	ld	 r13,r19,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1043
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r19,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1411
@L1412:
	align	 4
@L1043:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r19,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L1271:
	or	 r4,r0,r2
	or	 r2,r0,r22
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L1413
@L1414:
	align	 4
@L1039:
	ld	 r2,r19,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r19,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L1272:
	or	 r4,r0,r2
	br.n	 @L1007
	or	 r2,r0,r4
	align	 4
@L1047:
	or.u	 r9,r0,hi16(_frame_pointer_rtx)
	ld	 r23,r19,4
	ld	 r2,r9,lo16(_frame_pointer_rtx)
	cmp	 r13,r23,r2
	bb0.n	 ne,r13,@L1049
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r23,r13
	bb1	 ne,r13,@L1048
@L1049:
	or.u	 r9,r0,hi16(_fp_delta)
	ld	 r3,r9,lo16(_fp_delta)
	br	 @L1273
	align	 4
@L1048:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L1296
	or	 r2,r0,r22
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r23,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1	 ne,r12,@L1050
	or	 r2,r0,r23
	bsr.n	 _copy_rtx_and_substitute
	addu	 r1,r1,@L1415
@L1416:
	align	 4
@L1050:
@L1296:
	bsr.n	 _memory_address_p
	or	 r3,r0,r23
	bcnd.n	 ne0,r2,@L1051
	or	 r2,r0,r23
	bsr.n	 _copy_address
	addu	 r1,r1,@L1417
@L1418:
	align	 4
@L1051:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L1052
	or.u	 r9,r0,hi16(_frame_pointer_rtx)
	ld	 r11,r23,4
	ld	 r2,r9,lo16(_frame_pointer_rtx)
	cmp	 r12,r11,r2
	bb0	 ne,r12,@L1056
	ld	 r13,r23,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L1053
	bb0.n	 ne,r12,@L1056
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r11,r13
	bb1	 ne,r13,@L1055
@L1056:
	ld	 r2,r23,4
	ld	 r23,r23,8
	br	 @L1057
	align	 4
@L1055:
	or	 r23,r0,r11
@L1057:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L1058
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r23,4
	bb1.n	 ne,r13,@L1297
	or.u	 r9,r0,hi16(_fp_delta)
	or.u	 r9,r0,hi16(_first_parm_offset)
	ld	 r13,r9,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L1059
	bcnd.n	 ge0,r24,@L1060
	or	 r3,r0,r24
	addu	 r3,r24,3
@L1060:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L1063
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L1064:
	or.u	 r9,r0,hi16(_first_parm_offset)
	ld	 r13,r9,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L1066
	subu	 r2,r2,1
	addu	 r13,r13,3
@L1066:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L1065
	bsr	 _abort
	align	 4
@L1065:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L1064
	addu	 r3,r3,4
@L1063:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r23,r13[r2]
	or.u	 r9,r0,hi16(_mode_size)
	ld.bu	 r12,r23,2
	or	 r9,r9,lo16(_mode_size)
	ld	 r11,r9[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L1068
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L1068:
	ld.bu	 r13,r23,2
	cmp	 r13,r13,r22
	bb0.n	 ne,r13,@L1007
	or	 r2,r0,r23
	bcnd	 eq0,r12,@L1007
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,37
	bb1.n	 ne,r13,@L1070
	cmp	 r13,r12,34
	bsr.n	 _plus_constant
	ld	 r2,r23,4
	or	 r4,r0,r2
	br.n	 @L1275
	or	 r2,r0,r23
	align	 4
@L1070:
	bb1.n	 ne,r13,@L1071
	or.u	 r9,r0,hi16(_mode_size)
	or	 r9,r9,lo16(_mode_size)
	ld	 r13,r9[r22]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L1072
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L1072:
	or	 r3,r0,r22
	or	 r4,r0,r23
@L1269:
	or	 r5,r0,0
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L1419
@L1420:
	align	 4
@L1071:
	bsr	 _abort
	align	 4
@L1059:
	or.u	 r9,r0,hi16(_fp_delta)
@L1297:
	or	 r2,r0,30
	ld	 r4,r9,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r9,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r9,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L1058
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	or	 r3,r0,r24
@L1273:
	bsr	 _plus_constant
@L1274:
	or	 r4,r0,r2
	or	 r2,r0,37
	or	 r3,r0,r22
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L1421
@L1422:
	align	 4
@L1058:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r23
	or.u	 r9,r0,hi16(_frame_pointer_rtx)
	or	 r23,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	ld	 r4,r9,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r23
	or.u	 r9,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r9,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L1423
@L1424:
	align	 4
@L1053:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r23
	bcnd	 eq0,r2,@L1075
	ld	 r2,r23,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1076
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r23,8
	ld	 r13,r23,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1425
@L1426:
	align	 4
@L1076:
	ld	 r13,r23,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1078
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r23,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1427
@L1428:
	align	 4
@L1078:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r23,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r23,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L1429
@L1430:
	align	 4
@L1075:
	ld	 r12,r23,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1081
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r23,4
	ld	 r13,r23,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1431
@L1432:
	align	 4
@L1081:
	ld	 r2,r23,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1083
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r23,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1433
@L1434:
	align	 4
@L1083:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r23,8
	ld.bu	 r3,r23,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L1435
@L1436:
	align	 4
@L1052:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r23
@L1276:
	or	 r4,r0,r2
	or	 r2,r0,r19
@L1275:
	or	 r3,r0,r22
	bsr.n	 _change_address
	addu	 r1,r1,@L1437
@L1438:
	align	 4
@L1086:
	bsr	 _abort
	align	 4
@L1009:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r23,r0,r2
	st.b	 r22,r23,2
	ld	 r13,r0,r23
	ld	 r12,r0,r19
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r23
	ld	 r12,r0,r19
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r23
	ld	 r12,r0,r19
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	or.u	 r12,r0,hi16(_rtx_format)
	st	 r13,r0,r23
	or.u	 r13,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r23
	or	 r10,r13,lo16(_rtx_length)
	or	 r12,r12,lo16(_rtx_format)
	ld	 r13,r10[r11]
	ld	 r16,r12[r11]
	bcnd.n	 le0,r13,@L1090
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r19
	or	 r21,r0,r23
@L1092:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L1095
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L1108
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L1091
	cmp	 r13,r12,69
	bb0	 ne,r13,@L1097
	br	 @L1106
	align	 4
@L1108:
	bb0	 ne,r13,@L1105
	bb1.n	 gt,r13,@L1109
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L1105
	br	 @L1106
	align	 4
@L1109:
	bb0.n	 ne,r13,@L1096
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L1106
	align	 4
@L1095:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L1091
	st	 r2,r21,4
	align	 4
@L1096:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L1091
	st	 r13,r21,4
	align	 4
@L1097:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L1091
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L1091
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L1091
	or	 r18,r0,r20
	or	 r22,r0,r21
	or	 r25,r0,0
@L1102:
	ld	 r13,r18,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r22,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r22,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L1102
	addu	 r25,r25,4
	br	 @L1091
	align	 4
@L1105:
	ld	 r13,r20,4
	br.n	 @L1091
	st	 r13,r21,4
	align	 4
@L1106:
	bsr	 _abort
	align	 4
@L1091:
	ld.hu	 r13,r0,r23
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L1092
	addu	 r21,r21,4
@L1090:
	cmp	 r13,r15,22
	bb1.n	 ne,r13,@L1007
	or	 r2,r0,r23
	or.u	 r12,r0,hi16(_orig_asm_operands_vector)
	ld	 r13,r12,lo16(_orig_asm_operands_vector)
	bcnd	 ne0,r13,@L1007
	ld	 r13,r19,16
	st	 r13,r12,lo16(_orig_asm_operands_vector)
	ld	 r12,r23,16
	or.u	 r13,r0,hi16(_copy_asm_operands_vector)
	st	 r12,r13,lo16(_copy_asm_operands_vector)
	or	 r2,r0,r23
@L1007:
	ld	 r9,r31,140
	br.n	 @L1002
	st	 r2,r9,4
	align	 4
@L1112:
	ld	 r9,r31,132
	ld	 r13,r9,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r9,r31,140
	ld	 r13,r13[r11]
	br.n	 @L1002
	st	 r13,r9,4
	align	 4
@L1113:
	ld	 r9,r31,132
	ld	 r13,r9,4
	ld	 r9,r31,140
	st	 r13,r9,4
	ld	 r9,r31,132
	ld	 r2,r9,4
	bcnd	 eq0,r2,@L1002
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L1002
	bsr.n	 _rtvec_alloc
	or	 r14,r0,0
	ld	 r9,r31,140
	st	 r2,r9,4
	ld	 r13,r0,r2
	bcnd	 eq0,r13,@L1002
	ld	 r9,r31,132
	st	 r9,r31,116
	ld	 r9,r31,140
	st	 r9,r31,124
@L1118:
	ld	 r9,r31,116
	ld	 r13,r9,4
	lda	 r13,r13[r14]
	ld	 r19,r13,4
	bcnd.n	 ne0,r19,@L1120
	or.u	 r13,r0,hi16(@L1199)
	br.n	 @L1119
	or	 r2,r0,0
	align	 4
@L1120:
	ld.hu	 r15,r0,r19
	ld.bu	 r22,r19,2
	subu	 r11,r15,17
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L1121
	or	 r13,r13,lo16(@L1199)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L1199:
	word	 @L1129
	word	 @L1121
	word	 @L1121
	word	 @L1121
	word	 @L1121
	word	 @L1136
	word	 @L1121
	word	 @L1121
	word	 @L1121
	word	 @L1121
	word	 @L1121
	word	 @L1138
	word	 @L1198
	word	 @L1135
	word	 @L1135
	word	 @L1121
	word	 @L1135
	word	 @L1122
	word	 @L1121
	word	 @L1121
	word	 @L1159
	word	 @L1130
	word	 @L1135
	word	 @L1135
	word	 @L1121
	word	 @L1121
	word	 @L1121
	word	 @L1141
	align	 4
@L1122:
	ld	 r25,r19,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L1123
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r19
	bb0.n	 (31-30),r13,@L1124
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1125
	bsr	 _abort
	align	 4
@L1125:
	ld.bu	 r13,r4,2
	cmp	 r13,r22,r13
	bb1.n	 ne,r13,@L1126
	or	 r2,r0,35
	br.n	 @L1119
	or	 r2,r0,r4
	align	 4
@L1126:
	br.n	 @L1277
	or	 r3,r0,r22
	align	 4
@L1124:
	cmp	 r13,r25,14
	bb1.n	 ne,r13,@L1119
	or	 r2,r0,r19
	or.u	 r9,r0,hi16(_fp_delta)
	ld	 r3,r9,lo16(_fp_delta)
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1439
@L1440:
	align	 4
@L1123:
	ld	 r13,r24,lo16(_reg_map)
	ld	 r13,r13[r25]
	bcnd	 ne0,r13,@L1128
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,r22
	ld	 r13,r24,lo16(_reg_map)
	st	 r2,r13[r25]
@L1128:
	ld	 r13,r24,lo16(_reg_map)
	ld	 r2,r13[r25]
	br	 @L1119
	align	 4
@L1129:
	or.u	 r13,r0,hi16(_label_map)
	ld	 r12,r19,16
	ld	 r13,r13,lo16(_label_map)
	ld	 r2,r13[r12]
	br	 @L1119
	align	 4
@L1130:
	bsr.n	 _rtx_alloc
	or	 r2,r0,38
	or	 r23,r0,r2
	st.b	 r22,r23,2
	ld	 r13,r19,4
	or.u	 r12,r0,hi16(_label_map)
	ld	 r11,r13,16
	ld	 r13,r12,lo16(_label_map)
	ld	 r13,r13[r11]
	br.n	 @L1119
	st	 r13,r2,4
	align	 4
@L1135:
	br.n	 @L1119
	or	 r2,r0,r19
	align	 4
@L1136:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r19,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L1121
	bsr.n	 _rtx_alloc
	or	 r2,r0,22
	ld	 r13,r19,4
	or	 r23,r0,r2
	st	 r13,r23,4
	ld	 r13,r19,8
	st	 r13,r23,8
	or.u	 r13,r0,hi16(_copy_asm_operands_vector)
	ld	 r12,r19,12
	ld	 r13,r13,lo16(_copy_asm_operands_vector)
	st	 r12,r23,12
	st	 r13,r23,16
	ld	 r13,r19,20
	br.n	 @L1119
	st	 r13,r2,20
	align	 4
@L1138:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L1140
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L1121
@L1140:
	ld	 r13,r19,4
	ld.bu	 r24,r19,2
	ld	 r2,r13,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r25,r13,2
	or	 r4,r0,r2
	or	 r2,r0,37
	bsr.n	 _gen_rtx
	or	 r3,r0,r25
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,28
	br.n	 @L1278
	or	 r3,r0,r24
	align	 4
@L1141:
	or.u	 r9,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r19,4
	ld	 r2,r9,lo16(_frame_pointer_rtx)
	cmp	 r11,r3,r2
	bb0	 ne,r11,@L1145
	ld	 r13,r19,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L1142
	bb0.n	 ne,r11,@L1145
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L1144
	or	 r23,r0,r3
@L1145:
	ld	 r23,r19,8
@L1144:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1147
	ld	 r5,r23,4
	bcnd.n	 le0,r5,@L1148
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r12,r13,lo16(_parm_map)
	ext	 r13,r5,0<2>
	ld	 r23,r12[r13]
	ld	 r2,r23,4
	br	 @L1119
	align	 4
@L1148:
	or.u	 r9,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r9,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r9,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r9,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r22
@L1278:
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L1441
@L1442:
	align	 4
@L1147:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r23
	or.u	 r9,r0,hi16(_frame_pointer_rtx)
	or	 r23,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r22
	ld	 r4,r9,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r23
	or	 r3,r0,r2
	bsr.n	 _force_reg
	or	 r2,r0,r22
	or.u	 r9,r0,hi16(_fp_delta)
	ld	 r3,r9,lo16(_fp_delta)
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1443
@L1444:
	align	 4
@L1142:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1151
	or	 r2,r0,r22
	bsr.n	 _memory_address_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1151
	ld	 r2,r19,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1153
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	ld	 r13,r19,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1445
@L1446:
	align	 4
@L1153:
	ld	 r13,r19,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1155
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r19,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1447
@L1448:
	align	 4
@L1155:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r19,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L1279:
	or	 r4,r0,r2
	or	 r2,r0,r22
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L1449
@L1450:
	align	 4
@L1151:
	ld	 r2,r19,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r19,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L1280:
	or	 r4,r0,r2
	br.n	 @L1119
	or	 r2,r0,r4
	align	 4
@L1159:
	or.u	 r9,r0,hi16(_frame_pointer_rtx)
	ld	 r23,r19,4
	ld	 r2,r9,lo16(_frame_pointer_rtx)
	cmp	 r13,r23,r2
	bb0.n	 ne,r13,@L1161
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r23,r13
	bb1	 ne,r13,@L1160
@L1161:
	or.u	 r9,r0,hi16(_fp_delta)
	ld	 r3,r9,lo16(_fp_delta)
	br	 @L1281
	align	 4
@L1160:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L1298
	or	 r2,r0,r22
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r23,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1	 ne,r12,@L1162
	or	 r2,r0,r23
	bsr.n	 _copy_rtx_and_substitute
	addu	 r1,r1,@L1451
@L1452:
	align	 4
@L1162:
@L1298:
	bsr.n	 _memory_address_p
	or	 r3,r0,r23
	bcnd.n	 ne0,r2,@L1163
	or	 r2,r0,r23
	bsr.n	 _copy_address
	addu	 r1,r1,@L1453
@L1454:
	align	 4
@L1163:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L1164
	or.u	 r9,r0,hi16(_frame_pointer_rtx)
	ld	 r11,r23,4
	ld	 r2,r9,lo16(_frame_pointer_rtx)
	cmp	 r12,r11,r2
	bb0	 ne,r12,@L1168
	ld	 r13,r23,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L1165
	bb0.n	 ne,r12,@L1168
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r11,r13
	bb1	 ne,r13,@L1167
@L1168:
	ld	 r2,r23,4
	ld	 r23,r23,8
	br	 @L1169
	align	 4
@L1167:
	or	 r23,r0,r11
@L1169:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L1170
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r23,4
	bb1.n	 ne,r13,@L1299
	or.u	 r9,r0,hi16(_fp_delta)
	or.u	 r9,r0,hi16(_first_parm_offset)
	ld	 r13,r9,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L1171
	bcnd.n	 ge0,r24,@L1172
	or	 r3,r0,r24
	addu	 r3,r24,3
@L1172:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L1175
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L1176:
	or.u	 r9,r0,hi16(_first_parm_offset)
	ld	 r13,r9,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L1178
	subu	 r2,r2,1
	addu	 r13,r13,3
@L1178:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L1177
	bsr	 _abort
	align	 4
@L1177:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L1176
	addu	 r3,r3,4
@L1175:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r23,r13[r2]
	or.u	 r9,r0,hi16(_mode_size)
	ld.bu	 r12,r23,2
	or	 r9,r9,lo16(_mode_size)
	ld	 r11,r9[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L1180
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L1180:
	ld.bu	 r13,r23,2
	cmp	 r13,r13,r22
	bb0.n	 ne,r13,@L1119
	or	 r2,r0,r23
	bcnd	 eq0,r12,@L1119
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,37
	bb1.n	 ne,r13,@L1182
	cmp	 r13,r12,34
	bsr.n	 _plus_constant
	ld	 r2,r23,4
	or	 r4,r0,r2
	br.n	 @L1283
	or	 r2,r0,r23
	align	 4
@L1182:
	bb1.n	 ne,r13,@L1183
	or.u	 r9,r0,hi16(_mode_size)
	or	 r9,r9,lo16(_mode_size)
	ld	 r13,r9[r22]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L1184
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L1184:
	or	 r3,r0,r22
	or	 r4,r0,r23
@L1277:
	or	 r5,r0,0
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L1455
@L1456:
	align	 4
@L1183:
	bsr	 _abort
	align	 4
@L1171:
	or.u	 r9,r0,hi16(_fp_delta)
@L1299:
	or	 r2,r0,30
	ld	 r4,r9,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r9,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r9,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L1170
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	or	 r3,r0,r24
@L1281:
	bsr	 _plus_constant
@L1282:
	or	 r4,r0,r2
	or	 r2,r0,37
	or	 r3,r0,r22
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L1457
@L1458:
	align	 4
@L1170:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r23
	or.u	 r9,r0,hi16(_frame_pointer_rtx)
	or	 r23,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	ld	 r4,r9,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r23
	or.u	 r9,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r9,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L1459
@L1460:
	align	 4
@L1165:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r23
	bcnd	 eq0,r2,@L1187
	ld	 r2,r23,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1188
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r23,8
	ld	 r13,r23,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1461
@L1462:
	align	 4
@L1188:
	ld	 r13,r23,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1190
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r23,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1463
@L1464:
	align	 4
@L1190:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r23,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r23,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L1465
@L1466:
	align	 4
@L1187:
	ld	 r12,r23,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1193
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r23,4
	ld	 r13,r23,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1467
@L1468:
	align	 4
@L1193:
	ld	 r2,r23,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1195
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r23,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1469
@L1470:
	align	 4
@L1195:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r23,8
	ld.bu	 r3,r23,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L1471
@L1472:
	align	 4
@L1164:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r23
@L1284:
	or	 r4,r0,r2
	or	 r2,r0,r19
@L1283:
	or	 r3,r0,r22
	bsr.n	 _change_address
	addu	 r1,r1,@L1473
@L1474:
	align	 4
@L1198:
	bsr	 _abort
	align	 4
@L1121:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r23,r0,r2
	st.b	 r22,r23,2
	ld	 r13,r0,r23
	ld	 r12,r0,r19
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r23
	ld	 r12,r0,r19
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r23
	ld	 r12,r0,r19
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or.u	 r11,r0,hi16(_rtx_format)
	or	 r13,r13,r12
	st	 r13,r0,r23
	or.u	 r13,r0,hi16(_rtx_length)
	ld.hu	 r12,r0,r23
	or	 r10,r13,lo16(_rtx_length)
	or	 r11,r11,lo16(_rtx_format)
	ld	 r13,r10[r12]
	ld	 r16,r11[r12]
	bcnd.n	 le0,r13,@L1202
	or	 r17,r0,0
	or	 r20,r0,r19
	or	 r21,r0,r23
@L1204:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L1207
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L1220
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L1203
	cmp	 r13,r12,69
	bb0	 ne,r13,@L1209
	br	 @L1218
	align	 4
@L1220:
	bb0	 ne,r13,@L1217
	bb1.n	 gt,r13,@L1221
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L1217
	br	 @L1218
	align	 4
@L1221:
	bb0.n	 ne,r13,@L1208
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L1218
	align	 4
@L1207:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L1203
	st	 r2,r21,4
	align	 4
@L1208:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L1203
	st	 r13,r21,4
	align	 4
@L1209:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L1203
	ld	 r2,r0,r2
	bcnd.n	 eq0,r2,@L1300
	or.u	 r9,r0,hi16(_rtx_length)
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L1203
	or	 r18,r0,r20
	or	 r22,r0,r21
	or	 r25,r0,0
@L1214:
	ld	 r13,r18,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r22,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r22,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L1214
	addu	 r25,r25,4
	br.n	 @L1300
	or.u	 r9,r0,hi16(_rtx_length)
	align	 4
@L1217:
	ld	 r13,r20,4
	br.n	 @L1203
	st	 r13,r21,4
	align	 4
@L1218:
	bsr	 _abort
	align	 4
@L1203:
	or.u	 r9,r0,hi16(_rtx_length)
@L1300:
	ld.hu	 r13,r0,r23
	or	 r9,r9,lo16(_rtx_length)
	ld	 r13,r9[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L1204
	addu	 r21,r21,4
@L1202:
	cmp	 r13,r15,22
	bb1.n	 ne,r13,@L1119
	or	 r2,r0,r23
	or.u	 r12,r0,hi16(_orig_asm_operands_vector)
	ld	 r13,r12,lo16(_orig_asm_operands_vector)
	bcnd	 ne0,r13,@L1119
	ld	 r13,r19,16
	st	 r13,r12,lo16(_orig_asm_operands_vector)
	ld	 r12,r23,16
	or.u	 r13,r0,hi16(_copy_asm_operands_vector)
	st	 r12,r13,lo16(_copy_asm_operands_vector)
	or	 r2,r0,r23
@L1119:
	ld	 r9,r31,124
	ld	 r13,r9,4
	lda	 r13,r13[r14]
	st	 r2,r13,4
	ld	 r13,r9,4
	ld	 r13,r0,r13
	addu	 r14,r14,1
	cmp	 r13,r14,r13
	bb1	 hs,r13,@L1002
	br	 @L1118
	align	 4
@L1226:
	ld	 r9,r31,132
	ld	 r13,r9,4
	ld	 r9,r31,140
	br.n	 @L1002
	st	 r13,r9,4
	align	 4
@L1227:
	bsr	 _abort
	align	 4
@L1002:
	ld	 r9,r31,92
	or.u	 r13,r0,hi16(_rtx_length)
	ld.hu	 r12,r0,r9
	or	 r13,r13,lo16(_rtx_length)
	ld	 r9,r31,100
	ld	 r13,r13[r12]
	addu	 r9,r9,1
	st	 r9,r31,100
	ld	 r9,r31,132
	addu	 r9,r9,4
	st	 r9,r31,132
	ld	 r9,r31,100
	cmp	 r13,r9,r13
	ld	 r9,r31,140
	addu	 r9,r9,4
	bb1.n	 lt,r13,@L1003
	st	 r9,r31,140
@L1001:
	ld	 r2,r31,92
@L1232:
@Lte7:
	ld	 r1,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	ld.d	 r14,r31,32
	jmp.n	 r1
	addu	 r31,r31,144
	def	 @L1473,@L1119-@L1474
	def	 @L1471,@L1284-@L1472
	def	 @L1469,@L1284-@L1470
	def	 @L1467,@L1284-@L1468
	def	 @L1465,@L1284-@L1466
	def	 @L1463,@L1284-@L1464
	def	 @L1461,@L1284-@L1462
	def	 @L1459,@L1284-@L1460
	def	 @L1457,@L1119-@L1458
	def	 @L1455,@L1119-@L1456
	def	 @L1453,@L1282-@L1454
	def	 @L1451,@L1282-@L1452
	def	 @L1449,@L1280-@L1450
	def	 @L1447,@L1279-@L1448
	def	 @L1445,@L1279-@L1446
	def	 @L1443,@L1119-@L1444
	def	 @L1441,@L1119-@L1442
	def	 @L1439,@L1119-@L1440
	def	 @L1437,@L1007-@L1438
	def	 @L1435,@L1276-@L1436
	def	 @L1433,@L1276-@L1434
	def	 @L1431,@L1276-@L1432
	def	 @L1429,@L1276-@L1430
	def	 @L1427,@L1276-@L1428
	def	 @L1425,@L1276-@L1426
	def	 @L1423,@L1276-@L1424
	def	 @L1421,@L1007-@L1422
	def	 @L1419,@L1007-@L1420
	def	 @L1417,@L1274-@L1418
	def	 @L1415,@L1274-@L1416
	def	 @L1413,@L1272-@L1414
	def	 @L1411,@L1271-@L1412
	def	 @L1409,@L1271-@L1410
	def	 @L1407,@L1007-@L1408
	def	 @L1405,@L1007-@L1406
	def	 @L1403,@L1007-@L1404
	def	 @L1401,@L1268-@L1402
	def	 @L1399,@L1268-@L1400
	def	 @L1397,@L1268-@L1398
	def	 @L1395,@L1268-@L1396
	def	 @L1393,@L1268-@L1394
	def	 @L1391,@L1268-@L1392
	def	 @L1389,@L1268-@L1390
	def	 @L1387,@L1388-@L1249
	def	 @L1385,@L1386-@L1249
	def	 @L1383,@L1384-@L1248
	def	 @L1381,@L1265-@L1382
	def	 @L1379,@L1265-@L1380
	def	 @L1377,@L1378-@L1246
	def	 @L1375,@L1232-@L1376
	def	 @L1373,@L781-@L1374
	def	 @L1371,@L1261-@L1372
	def	 @L1369,@L1261-@L1370
	def	 @L1367,@L1261-@L1368
	def	 @L1365,@L1261-@L1366
	def	 @L1363,@L1261-@L1364
	def	 @L1361,@L1261-@L1362
	def	 @L1359,@L1261-@L1360
	def	 @L1357,@L781-@L1358
	def	 @L1355,@L781-@L1356
	def	 @L1353,@L1259-@L1354
	def	 @L1351,@L1259-@L1352
	def	 @L1349,@L1257-@L1350
	def	 @L1347,@L1256-@L1348
	def	 @L1345,@L1256-@L1346
	def	 @L1343,@L781-@L1344
	def	 @L1341,@L781-@L1342
	def	 @L1339,@L781-@L1340
	def	 @L1337,@L1232-@L1338
	def	 @L1335,@L1232-@L1336
	def	 @L1333,@L1252-@L1334
	def	 @L1331,@L1252-@L1332
	def	 @L1329,@L1252-@L1330
	def	 @L1327,@L1252-@L1328
	def	 @L1325,@L1252-@L1326
	def	 @L1323,@L1252-@L1324
	def	 @L1321,@L1252-@L1322
	def	 @L1319,@L1232-@L1320
	def	 @L1317,@L1318-@L1249
	def	 @L1315,@L1316-@L1249
	def	 @L1313,@L1232-@L1314
	def	 @L1311,@L1248-@L1312
	def	 @L1309,@L1247-@L1310
	def	 @L1307,@L1247-@L1308
	def	 @L1305,@L1246-@L1306
	def	 @L1303,@L1232-@L1304
	def	 @L1301,@L1232-@L1302

	align	 8
_try_fold_cc0:
	subu	 r31,r31,96
	st	 r1,r31,80
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	st.d	 r18,r31,48
	st.d	 r16,r31,40
	st.d	 r14,r31,32
@Ltb8:
	st	 r2,r31,92
	ld	 r13,r2,16
	ld	 r18,r13,8
	bcnd.n	 ne0,r18,@L1477
	or.u	 r13,r0,hi16(@L1556)
	br.n	 @L1476
	or	 r5,r0,0
	align	 4
@L1477:
	ld.hu	 r15,r0,r18
	ld.bu	 r23,r18,2
	subu	 r11,r15,17
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L1478
	or	 r13,r13,lo16(@L1556)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L1556:
	word	 @L1486
	word	 @L1478
	word	 @L1478
	word	 @L1478
	word	 @L1478
	word	 @L1493
	word	 @L1478
	word	 @L1478
	word	 @L1478
	word	 @L1478
	word	 @L1478
	word	 @L1495
	word	 @L1555
	word	 @L1492
	word	 @L1492
	word	 @L1478
	word	 @L1492
	word	 @L1479
	word	 @L1478
	word	 @L1478
	word	 @L1516
	word	 @L1487
	word	 @L1492
	word	 @L1492
	word	 @L1478
	word	 @L1478
	word	 @L1478
	word	 @L1498
	align	 4
@L1479:
	ld	 r25,r18,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L1480
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r18
	bb0.n	 (31-30),r13,@L1481
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1482
	bsr	 _abort
	align	 4
@L1482:
	ld.bu	 r13,r4,2
	cmp	 r13,r23,r13
	bb1.n	 ne,r13,@L1483
	or	 r2,r0,35
	br.n	 @L1476
	or	 r5,r0,r4
	align	 4
@L1483:
	br.n	 @L1606
	or	 r3,r0,r23
	align	 4
@L1481:
	cmp	 r13,r25,14
	bb1.n	 ne,r13,@L1476
	or	 r5,r0,r18
	or.u	 r13,r0,hi16(_fp_delta)
	ld	 r3,r13,lo16(_fp_delta)
	br.n	 @L1607
	or	 r2,r0,r18
	align	 4
@L1480:
	ld	 r13,r24,lo16(_reg_map)
	ld	 r13,r13[r25]
	bcnd	 ne0,r13,@L1485
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,r23
	ld	 r13,r24,lo16(_reg_map)
	st	 r2,r13[r25]
@L1485:
	ld	 r13,r24,lo16(_reg_map)
	ld	 r5,r13[r25]
	br	 @L1476
	align	 4
@L1486:
	or.u	 r13,r0,hi16(_label_map)
	ld	 r12,r18,16
	ld	 r13,r13,lo16(_label_map)
	ld	 r5,r13[r12]
	br	 @L1476
	align	 4
@L1487:
	bsr.n	 _rtx_alloc
	or	 r2,r0,38
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r18,4
	or.u	 r12,r0,hi16(_label_map)
	ld	 r11,r13,16
	ld	 r13,r12,lo16(_label_map)
	ld	 r13,r13[r11]
	or	 r5,r0,r22
	br.n	 @L1476
	st	 r13,r5,4
	align	 4
@L1492:
	br.n	 @L1476
	or	 r5,r0,r18
	align	 4
@L1493:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r18,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L1478
	bsr.n	 _rtx_alloc
	or	 r2,r0,22
	ld	 r13,r18,4
	or	 r22,r0,r2
	st	 r13,r22,4
	ld	 r13,r18,8
	st	 r13,r22,8
	or.u	 r13,r0,hi16(_copy_asm_operands_vector)
	ld	 r12,r18,12
	ld	 r13,r13,lo16(_copy_asm_operands_vector)
	st	 r12,r22,12
	st	 r13,r22,16
	ld	 r13,r18,20
	or	 r5,r0,r22
	br.n	 @L1476
	st	 r13,r5,20
	align	 4
@L1495:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L1497
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L1478
@L1497:
	ld	 r13,r18,4
	ld.bu	 r24,r18,2
	ld	 r2,r13,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r25,r13,2
	or	 r4,r0,r2
	or	 r2,r0,37
	bsr.n	 _gen_rtx
	or	 r3,r0,r25
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	or	 r5,r0,r2
	or	 r2,r0,28
	or	 r3,r0,r24
	br.n	 @L1608
	or	 r4,r0,r25
	align	 4
@L1498:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L1502
	ld	 r13,r18,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L1499
	bb0.n	 ne,r12,@L1502
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L1501
	or	 r22,r0,r3
@L1502:
	ld	 r22,r18,8
@L1501:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1504
	ld	 r5,r22,4
	bcnd.n	 le0,r5,@L1505
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r12,r13,lo16(_parm_map)
	ext	 r13,r5,0<2>
	ld	 r22,r12[r13]
	ld	 r5,r22,4
	br	 @L1476
	align	 4
@L1505:
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r23
	br.n	 @L1608
	or	 r4,r0,r25
	align	 4
@L1504:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,r23
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or	 r3,r0,r2
	bsr.n	 _force_reg
	or	 r2,r0,r23
	or.u	 r13,r0,hi16(_fp_delta)
	ld	 r3,r13,lo16(_fp_delta)
@L1607:
	bsr	 _plus_constant
	br.n	 @L1476
	or	 r5,r0,r2
	align	 4
@L1499:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r18
	bcnd.n	 eq0,r2,@L1508
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L1508
	ld	 r2,r18,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1510
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	ld	 r13,r18,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1619
@L1620:
	align	 4
@L1510:
	ld	 r13,r18,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1512
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r18,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1621
@L1622:
	align	 4
@L1512:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L1609:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L1623
@L1624:
	align	 4
@L1508:
	ld	 r2,r18,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L1610:
	or	 r4,r0,r2
	br.n	 @L1476
	or	 r5,r0,r4
	align	 4
@L1516:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb0.n	 ne,r13,@L1518
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 ne,r13,@L1517
@L1518:
	or.u	 r13,r0,hi16(_fp_delta)
	ld	 r3,r13,lo16(_fp_delta)
	br	 @L1611
	align	 4
@L1517:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L1616
	or	 r2,r0,r23
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1	 ne,r12,@L1519
	or	 r2,r0,r22
	bsr.n	 _copy_rtx_and_substitute
	addu	 r1,r1,@L1625
@L1626:
	align	 4
@L1519:
@L1616:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L1520
	or	 r2,r0,r22
	bsr.n	 _copy_address
	addu	 r1,r1,@L1627
@L1628:
	align	 4
@L1520:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L1521
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L1525
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L1522
	bb0.n	 ne,r11,@L1525
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L1524
@L1525:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L1526
	align	 4
@L1524:
	or	 r22,r0,r12
@L1526:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L1527
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L1617
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L1528
	bcnd.n	 ge0,r24,@L1529
	or	 r3,r0,r24
	addu	 r3,r24,3
@L1529:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L1532
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L1533:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L1535
	subu	 r2,r2,1
	addu	 r13,r13,3
@L1535:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L1534
	bsr	 _abort
	align	 4
@L1534:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L1533
	addu	 r3,r3,4
@L1532:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L1537
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L1537:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L1476
	or	 r5,r0,r22
	bcnd	 eq0,r12,@L1476
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 ne,r13,@L1539
	cmp	 r13,r12,34
	bsr.n	 _plus_constant
	ld	 r2,r22,4
	or	 r4,r0,r2
	br.n	 @L1613
	or	 r2,r0,r22
	align	 4
@L1539:
	bb1	 ne,r13,@L1540
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L1541
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L1541:
	or	 r3,r0,r23
	or	 r4,r0,r22
@L1606:
	or	 r5,r0,0
@L1608:
	bsr	 _gen_rtx
	br.n	 @L1476
	or	 r5,r0,r2
	align	 4
@L1540:
	bsr	 _abort
	align	 4
@L1528:
	or.u	 r13,r0,hi16(_fp_delta)
@L1617:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L1527
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	or	 r3,r0,r24
@L1611:
	bsr	 _plus_constant
@L1612:
	or	 r4,r0,r2
	or	 r2,r0,37
	bsr.n	 _gen_rtx
	or	 r3,r0,r23
	br.n	 @L1476
	or	 r5,r0,r2
	align	 4
@L1527:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L1629
@L1630:
	align	 4
@L1522:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L1544
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1545
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1631
@L1632:
	align	 4
@L1545:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1547
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1633
@L1634:
	align	 4
@L1547:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L1635
@L1636:
	align	 4
@L1544:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1550
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1637
@L1638:
	align	 4
@L1550:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1552
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L1639
@L1640:
	align	 4
@L1552:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L1641
@L1642:
	align	 4
@L1521:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L1614:
	or	 r4,r0,r2
	or	 r2,r0,r18
@L1613:
	bsr.n	 _change_address
	or	 r3,r0,r23
	br.n	 @L1476
	or	 r5,r0,r2
	align	 4
@L1555:
	bsr	 _abort
	align	 4
@L1478:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L1559
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r18
	or	 r21,r0,r22
@L1561:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L1564
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L1577
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L1560
	cmp	 r13,r12,69
	bb0	 ne,r13,@L1566
	br	 @L1575
	align	 4
@L1577:
	bb0	 ne,r13,@L1574
	bb1.n	 gt,r13,@L1578
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L1574
	br	 @L1575
	align	 4
@L1578:
	bb0.n	 ne,r13,@L1565
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L1575
	align	 4
@L1564:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L1560
	st	 r2,r21,4
	align	 4
@L1565:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L1560
	st	 r13,r21,4
	align	 4
@L1566:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L1560
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L1560
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L1560
	or	 r19,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L1571:
	ld	 r13,r19,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L1571
	addu	 r25,r25,4
	br	 @L1560
	align	 4
@L1574:
	ld	 r13,r20,4
	br.n	 @L1560
	st	 r13,r21,4
	align	 4
@L1575:
	bsr	 _abort
	align	 4
@L1560:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L1561
	addu	 r21,r21,4
@L1559:
	cmp	 r13,r15,22
	bb1.n	 ne,r13,@L1476
	or	 r5,r0,r22
	or.u	 r12,r0,hi16(_orig_asm_operands_vector)
	ld	 r13,r12,lo16(_orig_asm_operands_vector)
	bcnd	 ne0,r13,@L1476
	ld	 r13,r18,16
	st	 r13,r12,lo16(_orig_asm_operands_vector)
	ld	 r12,r22,16
	or.u	 r13,r0,hi16(_copy_asm_operands_vector)
	st	 r12,r13,lo16(_copy_asm_operands_vector)
	or	 r5,r0,r22
@L1476:
	ld.hu	 r12,r0,r5
	subu	 r13,r12,38
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1582
	mask	 r13,r12,0xffff
	cmp	 r12,r13,30
	cmp	 r13,r13,32
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L1601
	or	 r2,r0,0
@L1582:
	ld	 r9,r31,92
	ld	 r13,r9,12
	bcnd	 eq0,r13,@L1581
	ld	 r11,r13,16
	ld.hu	 r13,r0,r11
	cmp	 r13,r13,25
	bb0.n	 eq,r13,@L1601
	or	 r2,r0,0
	or.u	 r13,r0,hi16(_pc_rtx)
	ld	 r12,r11,4
	ld	 r13,r13,lo16(_pc_rtx)
	cmp	 r12,r12,r13
	bb0	 eq,r12,@L1601
	ld	 r11,r11,8
	ld.hu	 r13,r0,r11
	cmp	 r13,r13,42
	bb0	 eq,r13,@L1601
	ld	 r2,r11,4
	or.u	 r13,r0,hi16(_rtx_length)
	ld.hu	 r12,r0,r2
	or	 r13,r13,lo16(_rtx_length)
	ld	 r13,r13[r12]
	cmp	 r13,r13,2
	bb0.n	 eq,r13,@L1581
	or.u	 r12,r0,hi16(_cc0_rtx)
	ld	 r13,r2,4
	ld	 r12,r12,lo16(_cc0_rtx)
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L1618
	or.u	 r13,r0,hi16(_cc0_rtx)
	ld	 r6,r2,8
	ld.hu	 r12,r0,r6
	subu	 r13,r12,38
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1586
	mask	 r13,r12,0xffff
	cmp	 r12,r13,30
	cmp	 r13,r13,32
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L1618
	or.u	 r13,r0,hi16(_cc0_rtx)
@L1586:
	bcnd.n	 ne0,r6,@L1584
	or.u	 r13,r0,hi16(_cc0_rtx)
@L1618:
	ld	 r12,r2,8
	ld	 r13,r13,lo16(_cc0_rtx)
	cmp	 r12,r12,r13
	bb0	 eq,r12,@L1581
	ld	 r6,r2,4
	ld.hu	 r12,r0,r6
	subu	 r13,r12,38
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1587
	mask	 r13,r12,0xffff
	cmp	 r12,r13,30
	cmp	 r13,r13,32
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L1581
@L1587:
	bcnd	 eq0,r6,@L1581
@L1584:
	ld	 r3,r11,8
	bsr.n	 _fold_out_const_cc0
	ld	 r4,r11,12
	bcnd	 eq0,r2,@L1581
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,38
	bb1	 ne,r13,@L1589
	ld	 r9,r31,92
	ld	 r11,r9,12
	bcnd	 eq0,r11,@L1602
@L1594:
	ld.hu	 r13,r0,r11
	cmp	 r13,r13,17
	bb0	 ne,r13,@L1591
	ld	 r11,r11,12
	bcnd	 ne0,r11,@L1594
@L1591:
	bcnd.n	 ne0,r11,@L1595
	or.u	 r13,r0,hi16(_label_map)
@L1602:
	bsr	 _abort
	align	 4
@L1595:
	ld	 r12,r11,16
	ld	 r13,r13,lo16(_label_map)
	ld	 r13,r13[r12]
	ld	 r12,r2,4
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L1596
	ld	 r2,r11,8
	br	 @L1601
	align	 4
@L1596:
	bsr.n	 _emit_jump
	addu	 r1,r1,@L1643
@L1644:
	align	 4
@L1589:
	or.u	 r13,r0,hi16(_pc_rtx)
	ld	 r13,r13,lo16(_pc_rtx)
	cmp	 r13,r2,r13
	bb0	 eq,r13,@L1599
@L1615:
	ld	 r9,r31,92
	ld	 r2,r9,12
	br	 @L1601
	align	 4
@L1599:
	bsr	 _abort
	align	 4
@L1581:
	or	 r2,r0,0
@L1601:
@Lte8:
	ld	 r1,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	ld.d	 r14,r31,32
	jmp.n	 r1
	addu	 r31,r31,96
	def	 @L1643,@L1615-@L1644
	def	 @L1641,@L1614-@L1642
	def	 @L1639,@L1614-@L1640
	def	 @L1637,@L1614-@L1638
	def	 @L1635,@L1614-@L1636
	def	 @L1633,@L1614-@L1634
	def	 @L1631,@L1614-@L1632
	def	 @L1629,@L1614-@L1630
	def	 @L1627,@L1612-@L1628
	def	 @L1625,@L1612-@L1626
	def	 @L1623,@L1610-@L1624
	def	 @L1621,@L1609-@L1622
	def	 @L1619,@L1609-@L1620

	align	 8
_fold_out_const_cc0:
	subu	 r31,r31,96
	st	 r1,r31,80
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	or	 r7,r0,r2
	st.d	 r18,r31,48
	or	 r2,r0,r5
	st.d	 r16,r31,40
	or	 r19,r0,r3
	st.d	 r14,r31,32
@Ltb9:
	or	 r3,r0,r6
	ld.hu	 r13,r0,r2
	ld.hu	 r12,r0,r3
	cmp	 r13,r13,30
	or	 r10,r0,1
	extu	 r9,r13,1<eq>
	cmp	 r12,r12,30
	or	 r18,r0,r4
	bcnd.n	 eq0,r9,@L1646
	extu	 r11,r12,1<eq>
	ld	 r10,r2,4
@L1646:
	bcnd.n	 eq0,r11,@L1648
	or	 r8,r0,1
	ld	 r8,r3,4
@L1648:
	ld.hu	 r13,r0,r7
	subu	 r7,r13,67
	or.u	 r13,r0,hi16(@L5913)
	cmp	 r12,r7,9
	bb0.n	 ls,r12,@L1650
	or	 r13,r13,lo16(@L5913)
	ld	 r13,r13[r7]
	jmp	 r13
	align	 4
@L5913:
	word	 @L1651
	word	 @L2078
	word	 @L2505
	word	 @L2931
	word	 @L3357
	word	 @L3783
	word	 @L4209
	word	 @L4635
	word	 @L5061
	word	 @L5487
	align	 4
@L1651:
	cmp	 r9,r9,0
	cmp	 r11,r11,0
	or	 r13,r9,r11
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L1652
	cmp	 r13,r10,r8
	bb0	 ne,r13,@L1653
	bcnd	 eq0,r19,@L1650
	ld.hu	 r15,r0,r19
	ld.bu	 r23,r19,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L1734)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L1656
	or	 r13,r13,lo16(@L1734)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L1734:
	word	 @L1664
	word	 @L1656
	word	 @L1656
	word	 @L1656
	word	 @L1656
	word	 @L1671
	word	 @L1656
	word	 @L1656
	word	 @L1656
	word	 @L1656
	word	 @L1656
	word	 @L1673
	word	 @L1733
	word	 @L1662
	word	 @L1662
	word	 @L1656
	word	 @L1662
	word	 @L1657
	word	 @L1656
	word	 @L1656
	word	 @L1694
	word	 @L1665
	word	 @L1662
	word	 @L1662
	word	 @L1656
	word	 @L1656
	word	 @L1656
	word	 @L1676
	align	 4
@L1657:
	ld	 r25,r19,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r19
	bb0.n	 (31-30),r13,@L1659
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L1660:
	ld.bu	 r13,r4,2
	cmp	 r13,r23,r13
	bb0.n	 ne,r13,@L6131
	or	 r2,r0,35
	or	 r3,r0,r23
@L6000:
	or	 r5,r0,0
	bsr	 _gen_rtx
	br	 @L5915
	align	 4
@L1659:
	cmp	 r13,r25,14
	bb0.n	 eq,r13,@L5915
	or	 r2,r0,r19
	or.u	 r13,r0,hi16(_fp_delta)
@L6143:
	ld	 r3,r13,lo16(_fp_delta)
	or	 r2,r0,r19
	bsr	 _plus_constant
	br	 @L5915
	align	 4
@L1662:
	br.n	 @L5915
	or	 r2,r0,r19
	align	 4
@L1658:
@L6134:
	ld	 r13,r24,lo16(_reg_map)
	ld	 r13,r13[r25]
	bcnd	 ne0,r13,@L1663
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,r23
	ld	 r13,r24,lo16(_reg_map)
	st	 r2,r13[r25]
@L1663:
	ld	 r13,r24,lo16(_reg_map)
	ld	 r2,r13[r25]
	br	 @L5915
	align	 4
@L1664:
	or.u	 r13,r0,hi16(_label_map)
	ld	 r12,r19,16
@L6005:
	ld	 r13,r13,lo16(_label_map)
	ld	 r2,r13[r12]
	br	 @L5915
	align	 4
@L1665:
	bsr.n	 _rtx_alloc
	or	 r2,r0,38
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r19,4
	or.u	 r12,r0,hi16(_label_map)
@L6138:
	ld	 r11,r13,16
	ld	 r13,r12,lo16(_label_map)
	ld	 r13,r13[r11]
	br.n	 @L5915
	st	 r13,r2,4
	align	 4
@L1671:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r19,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L1656
@L6014:
	bsr.n	 _rtx_alloc
	or	 r2,r0,22
	ld	 r13,r19,4
	or	 r22,r0,r2
	st	 r13,r22,4
	ld	 r13,r19,8
	st	 r13,r22,8
	or.u	 r13,r0,hi16(_copy_asm_operands_vector)
	ld	 r12,r19,12
	ld	 r13,r13,lo16(_copy_asm_operands_vector)
	st	 r12,r22,12
	st	 r13,r22,16
	ld	 r13,r19,20
	br.n	 @L5915
	st	 r13,r2,20
	align	 4
@L1673:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L1675
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L1656
@L1675:
	ld	 r13,r19,4
	ld.bu	 r24,r19,2
	ld	 r2,r13,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r25,r13,2
	or	 r4,r0,r2
	or	 r2,r0,37
	bsr.n	 _gen_rtx
	or	 r3,r0,r25
	or	 r25,r0,r2
	ld	 r2,r19,8
@L6007:
	bsr	 _copy_rtx_and_substitute
	or	 r5,r0,r2
	or	 r2,r0,28
	or	 r3,r0,r24
@L5996:
	or	 r4,r0,r25
	bsr	 _gen_rtx
	br	 @L5915
	align	 4
@L1676:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L1680
	ld	 r13,r19,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L1677
	bb0.n	 ne,r12,@L1680
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L1679
	or	 r22,r0,r3
@L1680:
	ld	 r22,r19,8
@L1679:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 le0,r5,@L1683
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r13,r0,hi16(_parm_map)
@L6139:
	ld	 r12,r13,lo16(_parm_map)
	ext	 r13,r5,0<2>
	ld	 r22,r12[r13]
	ld	 r2,r22,4
	br	 @L5915
	align	 4
@L1683:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L1682:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,r23
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or	 r3,r0,r2
	bsr.n	 _force_reg
	or	 r2,r0,r23
	or.u	 r13,r0,hi16(_fp_delta)
	ld	 r3,r13,lo16(_fp_delta)
	bsr	 _plus_constant
	br	 @L5915
	align	 4
@L1677:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	ld	 r2,r19,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1688
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	ld	 r13,r19,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6221
@L6222:
	align	 4
@L1688:
	ld	 r13,r19,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1690
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r19,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6223
@L6224:
	align	 4
@L1690:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r19,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L5997:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6225
@L6226:
	align	 4
@L1686:
	ld	 r2,r19,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r19,2
	or	 r25,r0,r2
	ld	 r2,r19,8
@L6133:
	bsr	 _copy_rtx_and_substitute
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L5998:
	or	 r4,r0,r2
@L6131:
	br.n	 @L5915
	or	 r2,r0,r4
	align	 4
@L1694:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb0.n	 ne,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 ne,r13,@L1695
@L1696:
	or.u	 r13,r0,hi16(_fp_delta)
	ld	 r3,r13,lo16(_fp_delta)
@L6001:
	bsr	 _plus_constant
@L5999:
	or	 r4,r0,r2
	or	 r2,r0,37
	or	 r3,r0,r23
	bsr	 _gen_rtx
	br	 @L5915
	align	 4
@L1695:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L6135
	or	 r2,r0,r23
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1	 ne,r12,@L1697
	or	 r2,r0,r22
	bsr.n	 _copy_rtx_and_substitute
	subu	 r1,r1,@L6227
@L6228:
	align	 4
@L1697:
@L6135:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L1698
	or	 r2,r0,r22
	bsr.n	 _copy_address
	subu	 r1,r1,@L6229
@L6230:
	align	 4
@L1698:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L1699
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L1703
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L1700
	bb0.n	 ne,r11,@L1703
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L1702
@L1703:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L1704
	align	 4
@L1702:
	or	 r22,r0,r12
@L1704:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L1705
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6136
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L1706
	bcnd.n	 ge0,r24,@L1707
	or	 r3,r0,r24
	addu	 r3,r24,3
@L1707:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L1710
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L1711:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L1713
	subu	 r2,r2,1
	addu	 r13,r13,3
@L1713:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L1712
	bsr	 _abort
	align	 4
@L1712:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L1711
	addu	 r3,r3,4
@L1710:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L1715
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L1715:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 ne,r13,@L1717
	cmp	 r13,r12,34
@L6011:
	bsr.n	 _plus_constant
	ld	 r2,r22,4
	or	 r4,r0,r2
	or	 r2,r0,r22
@L6003:
	or	 r3,r0,r23
	bsr	 _change_address
	br	 @L5915
	align	 4
@L1717:
	bb1	 ne,r13,@L1718
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L1719
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L1719:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L1718:
	bsr	 _abort
	align	 4
@L1706:
	or.u	 r13,r0,hi16(_fp_delta)
@L6136:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L1705
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L1705:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6231
@L6232:
	align	 4
@L1700:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L1722
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1723
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6233
@L6234:
	align	 4
@L1723:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1725
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6235
@L6236:
	align	 4
@L1725:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6237
@L6238:
	align	 4
@L1722:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1728
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6239
@L6240:
	align	 4
@L1728:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1730
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6241
@L6242:
	align	 4
@L1730:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6243
@L6244:
	align	 4
@L1699:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6002:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r19
	align	 4
@L1733:
	bsr	 _abort
	align	 4
@L1656:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L1737
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r19
	or	 r21,r0,r22
@L1739:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L1742
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L1755
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L1738
	cmp	 r13,r12,69
	bb0	 ne,r13,@L1744
	br	 @L1753
	align	 4
@L1755:
	bb0	 ne,r13,@L1752
	bb1.n	 gt,r13,@L1756
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L1752
	br	 @L1753
	align	 4
@L1756:
	bb0.n	 ne,r13,@L1743
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L1753
	align	 4
@L1742:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L1738
	st	 r2,r21,4
	align	 4
@L1743:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L1738
	st	 r13,r21,4
	align	 4
@L1744:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L1738
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L1738
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L1738
	or	 r18,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L1749:
	ld	 r13,r18,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L1749
	addu	 r25,r25,4
	br	 @L1738
	align	 4
@L1752:
	ld	 r13,r20,4
	br.n	 @L1738
	st	 r13,r21,4
	align	 4
@L1753:
	bsr	 _abort
	align	 4
@L1738:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L1739
	addu	 r21,r21,4
@L1737:
	cmp	 r13,r15,22
	bb0.n	 eq,r13,@L5915
	or	 r2,r0,r22
	or.u	 r12,r0,hi16(_orig_asm_operands_vector)
	ld	 r13,r12,lo16(_orig_asm_operands_vector)
	bcnd	 ne0,r13,@L5915
	ld	 r13,r19,16
	br.n	 @L6137
	st	 r13,r12,lo16(_orig_asm_operands_vector)
	align	 4
@L1653:
	bcnd	 eq0,r18,@L1650
	ld.hu	 r15,r0,r18
	ld.bu	 r23,r18,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L1840)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L1762
	or	 r13,r13,lo16(@L1840)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L1840:
	word	 @L1770
	word	 @L1762
	word	 @L1762
	word	 @L1762
	word	 @L1762
	word	 @L1777
	word	 @L1762
	word	 @L1762
	word	 @L1762
	word	 @L1762
	word	 @L1762
	word	 @L1779
	word	 @L1839
	word	 @L1768
	word	 @L1768
	word	 @L1762
	word	 @L1768
	word	 @L1763
	word	 @L1762
	word	 @L1762
	word	 @L1800
	word	 @L1771
	word	 @L1768
	word	 @L1768
	word	 @L1762
	word	 @L1762
	word	 @L1762
	word	 @L1782
	align	 4
@L1763:
	ld	 r25,r18,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r18
	bb0.n	 (31-30),r13,@L1765
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L1765:
	cmp	 r13,r25,14
	bb0.n	 eq,r13,@L5915
	or	 r2,r0,r18
	or.u	 r13,r0,hi16(_fp_delta)
@L6146:
	ld	 r3,r13,lo16(_fp_delta)
	or	 r2,r0,r18
	bsr	 _plus_constant
	br	 @L5915
	align	 4
@L1768:
	br.n	 @L5915
	or	 r2,r0,r18
	align	 4
@L1770:
	ld	 r12,r18,16
	br.n	 @L6005
	or.u	 r13,r0,hi16(_label_map)
	align	 4
@L1771:
	bsr.n	 _rtx_alloc
	or	 r2,r0,38
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r18,4
	br.n	 @L6138
	or.u	 r12,r0,hi16(_label_map)
	align	 4
@L1777:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r18,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L1762
@L6019:
	bsr.n	 _rtx_alloc
	or	 r2,r0,22
	ld	 r13,r18,4
	or	 r22,r0,r2
	st	 r13,r22,4
	ld	 r13,r18,8
	st	 r13,r22,8
	or.u	 r13,r0,hi16(_copy_asm_operands_vector)
	ld	 r12,r18,12
	ld	 r13,r13,lo16(_copy_asm_operands_vector)
	st	 r12,r22,12
	st	 r13,r22,16
	ld	 r13,r18,20
	br.n	 @L5915
	st	 r13,r2,20
	align	 4
@L1779:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L1781
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L1762
@L1781:
	ld	 r13,r18,4
	ld.bu	 r24,r18,2
	ld	 r2,r13,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r25,r13,2
	or	 r4,r0,r2
	or	 r2,r0,37
	bsr.n	 _gen_rtx
	or	 r3,r0,r25
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6007
	align	 4
@L1782:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L1786
	ld	 r13,r18,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L1783
	bb0.n	 ne,r12,@L1786
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L1785
	or	 r22,r0,r3
@L1786:
	ld	 r22,r18,8
@L1785:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L1783:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L1792
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L1792
	ld	 r2,r18,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1794
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	ld	 r13,r18,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6245
@L6246:
	align	 4
@L1794:
	ld	 r13,r18,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1796
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r18,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6247
@L6248:
	align	 4
@L1796:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6009:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr.n	 _memory_address
	subu	 r1,r1,@L6249
@L6250:
	align	 4
@L1792:
	ld	 r2,r18,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6133
	align	 4
@L1800:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L1803
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6140
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr.n	 _copy_rtx_and_substitute
	subu	 r1,r1,@L6251
@L6252:
	align	 4
@L1803:
	or	 r2,r0,r23
@L6140:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L1804
	or	 r2,r0,r22
	bsr.n	 _copy_address
	subu	 r1,r1,@L6253
@L6254:
	align	 4
@L1804:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L1805
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L1809
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L1806
	bb0.n	 ne,r11,@L1809
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L1808
@L1809:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L1810
	align	 4
@L1808:
	or	 r22,r0,r12
@L1810:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L1811
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6141
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L1812
	bcnd.n	 ge0,r24,@L1813
	or	 r3,r0,r24
	addu	 r3,r24,3
@L1813:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L1816
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L1817:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L1819
	subu	 r2,r2,1
	addu	 r13,r13,3
@L1819:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L1818
	bsr	 _abort
	align	 4
@L1818:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L1817
	addu	 r3,r3,4
@L1816:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L1821
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L1821:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L1824
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L1825
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L1825:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L1824:
	bsr	 _abort
	align	 4
@L1812:
	or.u	 r13,r0,hi16(_fp_delta)
@L6141:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L1811
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L1811:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6255
@L6256:
	align	 4
@L1806:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L1828
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1829
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6257
@L6258:
	align	 4
@L1829:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1831
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6259
@L6260:
	align	 4
@L1831:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6261
@L6262:
	align	 4
@L1828:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1834
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6263
@L6264:
	align	 4
@L1834:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1836
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6265
@L6266:
	align	 4
@L1836:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6267
@L6268:
	align	 4
@L1805:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6012:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r18
	align	 4
@L1839:
	bsr	 _abort
	align	 4
@L1762:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L5891
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r18
	or	 r21,r0,r22
@L1845:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L1848
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L1861
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L1844
	cmp	 r13,r12,69
	bb0	 ne,r13,@L1850
	br	 @L1859
	align	 4
@L1861:
	bb0	 ne,r13,@L1858
	bb1.n	 gt,r13,@L1862
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L1858
	br	 @L1859
	align	 4
@L1862:
	bb0.n	 ne,r13,@L1849
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L1859
	align	 4
@L1848:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L1844
	st	 r2,r21,4
	align	 4
@L1849:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L1844
	st	 r13,r21,4
	align	 4
@L1850:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L1844
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L1844
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L1844
	or	 r19,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L1855:
	ld	 r13,r19,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L1855
	addu	 r25,r25,4
	br	 @L1844
	align	 4
@L1858:
	ld	 r13,r20,4
	br.n	 @L1844
	st	 r13,r21,4
	align	 4
@L1859:
	bsr	 _abort
	align	 4
@L1844:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L1845
	addu	 r21,r21,4
	br.n	 @L6142
	cmp	 r13,r15,22
	align	 4
@L1652:
	cmp	 r13,r10,0
	cmp	 r12,r8,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L1865
	bcnd	 eq0,r19,@L1650
	ld.hu	 r15,r0,r19
	ld.bu	 r23,r19,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L1946)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L1868
	or	 r13,r13,lo16(@L1946)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L1946:
	word	 @L1664
	word	 @L1868
	word	 @L1868
	word	 @L1868
	word	 @L1868
	word	 @L1883
	word	 @L1868
	word	 @L1868
	word	 @L1868
	word	 @L1868
	word	 @L1868
	word	 @L1885
	word	 @L1945
	word	 @L1662
	word	 @L1662
	word	 @L1868
	word	 @L1662
	word	 @L1869
	word	 @L1868
	word	 @L1868
	word	 @L1906
	word	 @L1665
	word	 @L1662
	word	 @L1662
	word	 @L1868
	word	 @L1868
	word	 @L1868
	word	 @L1888
	align	 4
@L1869:
	ld	 r25,r19,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r19
	bb0.n	 (31-30),r13,@L1871
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L1871:
	cmp	 r13,r25,14
	bb1.n	 eq,r13,@L6143
	or.u	 r13,r0,hi16(_fp_delta)
	br.n	 @L5915
	or	 r2,r0,r19
	align	 4
@L1883:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r19,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6014
	br	 @L1868
	align	 4
@L1885:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L1675
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L1868
	br	 @L1675
	align	 4
@L1888:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L1892
	ld	 r13,r19,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L1889
	bb0.n	 ne,r12,@L1892
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L1891
	or	 r22,r0,r3
@L1892:
	ld	 r22,r19,8
@L1891:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L1889:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	ld	 r2,r19,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1900
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	ld	 r13,r19,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6269
@L6270:
	align	 4
@L1900:
	ld	 r13,r19,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1902
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r19,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6271
@L6272:
	align	 4
@L1902:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r19,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6015:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr.n	 _memory_address
	subu	 r1,r1,@L6273
@L6274:
	align	 4
@L1906:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L1909
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6144
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr.n	 _copy_rtx_and_substitute
	subu	 r1,r1,@L6275
@L6276:
	align	 4
@L1909:
	or	 r2,r0,r23
@L6144:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L1910
	or	 r2,r0,r22
	bsr.n	 _copy_address
	subu	 r1,r1,@L6277
@L6278:
	align	 4
@L1910:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L1911
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L1915
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L1912
	bb0.n	 ne,r11,@L1915
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L1914
@L1915:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L1916
	align	 4
@L1914:
	or	 r22,r0,r12
@L1916:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L1917
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6145
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L1918
	bcnd.n	 ge0,r24,@L1919
	or	 r3,r0,r24
	addu	 r3,r24,3
@L1919:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L1922
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L1923:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L1925
	subu	 r2,r2,1
	addu	 r13,r13,3
@L1925:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L1924
	bsr	 _abort
	align	 4
@L1924:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L1923
	addu	 r3,r3,4
@L1922:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L1927
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L1927:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L1930
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L1931
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L1931:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L1930:
	bsr	 _abort
	align	 4
@L1918:
	or.u	 r13,r0,hi16(_fp_delta)
@L6145:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L1917
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L1917:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6279
@L6280:
	align	 4
@L1912:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L1934
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1935
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6281
@L6282:
	align	 4
@L1935:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1937
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6283
@L6284:
	align	 4
@L1937:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6285
@L6286:
	align	 4
@L1934:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1940
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6287
@L6288:
	align	 4
@L1940:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1942
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6289
@L6290:
	align	 4
@L1942:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6291
@L6292:
	align	 4
@L1911:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6017:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r19
	align	 4
@L1945:
	bsr	 _abort
	align	 4
@L1868:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L1949
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r19
	or	 r21,r0,r22
@L1951:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L1954
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L1967
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L1950
	cmp	 r13,r12,69
	bb0	 ne,r13,@L1956
	br	 @L1965
	align	 4
@L1967:
	bb0	 ne,r13,@L1964
	bb1.n	 gt,r13,@L1968
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L1964
	br	 @L1965
	align	 4
@L1968:
	bb0.n	 ne,r13,@L1955
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L1965
	align	 4
@L1954:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L1950
	st	 r2,r21,4
	align	 4
@L1955:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L1950
	st	 r13,r21,4
	align	 4
@L1956:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L1950
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L1950
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L1950
	or	 r18,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L1961:
	ld	 r13,r18,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L1961
	addu	 r25,r25,4
	br	 @L1950
	align	 4
@L1964:
	ld	 r13,r20,4
	br.n	 @L1950
	st	 r13,r21,4
	align	 4
@L1965:
	bsr	 _abort
	align	 4
@L1950:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L1951
	addu	 r21,r21,4
@L1949:
	cmp	 r13,r15,22
	bb0.n	 eq,r13,@L5915
	or	 r2,r0,r22
	or.u	 r12,r0,hi16(_orig_asm_operands_vector)
	ld	 r13,r12,lo16(_orig_asm_operands_vector)
	bcnd	 ne0,r13,@L5915
	ld	 r13,r19,16
	br.n	 @L6137
	st	 r13,r12,lo16(_orig_asm_operands_vector)
	align	 4
@L1865:
	and	 r13,r9,r11
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L1650
	bsr	 _rtx_equal_p
	bcnd	 eq0,r2,@L1650
	bcnd	 eq0,r18,@L1650
	ld.hu	 r15,r0,r18
	ld.bu	 r23,r18,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L2053)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L1975
	or	 r13,r13,lo16(@L2053)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L2053:
	word	 @L1983
	word	 @L1975
	word	 @L1975
	word	 @L1975
	word	 @L1975
	word	 @L1990
	word	 @L1975
	word	 @L1975
	word	 @L1975
	word	 @L1975
	word	 @L1975
	word	 @L1992
	word	 @L2052
	word	 @L1768
	word	 @L1768
	word	 @L1975
	word	 @L1768
	word	 @L1976
	word	 @L1975
	word	 @L1975
	word	 @L2013
	word	 @L1984
	word	 @L1768
	word	 @L1768
	word	 @L1975
	word	 @L1975
	word	 @L1975
	word	 @L1995
	align	 4
@L1976:
	ld	 r25,r18,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r18
	bb0.n	 (31-30),r13,@L1978
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L1978:
	cmp	 r13,r25,14
	bb1.n	 eq,r13,@L6146
	or.u	 r13,r0,hi16(_fp_delta)
	br.n	 @L5915
	or	 r2,r0,r18
	align	 4
@L1983:
	ld	 r12,r18,16
	br.n	 @L6005
	or.u	 r13,r0,hi16(_label_map)
	align	 4
@L1984:
	bsr.n	 _rtx_alloc
	or	 r2,r0,38
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r18,4
	br.n	 @L6138
	or.u	 r12,r0,hi16(_label_map)
	align	 4
@L1990:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r18,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6019
	br	 @L1975
	align	 4
@L1992:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L1994
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L1975
@L1994:
	ld	 r13,r18,4
	ld.bu	 r24,r18,2
	ld	 r2,r13,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r25,r13,2
	or	 r4,r0,r2
	or	 r2,r0,37
	bsr.n	 _gen_rtx
	or	 r3,r0,r25
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6007
	align	 4
@L1995:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L1999
	ld	 r13,r18,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L1996
	bb0.n	 ne,r12,@L1999
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L1998
	or	 r22,r0,r3
@L1999:
	ld	 r22,r18,8
@L1998:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L1996:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L2005
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L2005
	ld	 r2,r18,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2007
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	ld	 r13,r18,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6293
@L6294:
	align	 4
@L2007:
	ld	 r13,r18,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2009
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r18,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6295
@L6296:
	align	 4
@L2009:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6020:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr.n	 _memory_address
	subu	 r1,r1,@L6297
@L6298:
	align	 4
@L2005:
	ld	 r2,r18,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6133
	align	 4
@L2013:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L2016
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6147
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr.n	 _copy_rtx_and_substitute
	subu	 r1,r1,@L6299
@L6300:
	align	 4
@L2016:
	or	 r2,r0,r23
@L6147:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L2017
	or	 r2,r0,r22
	bsr.n	 _copy_address
	subu	 r1,r1,@L6301
@L6302:
	align	 4
@L2017:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L2018
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L2022
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L2019
	bb0.n	 ne,r11,@L2022
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L2021
@L2022:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L2023
	align	 4
@L2021:
	or	 r22,r0,r12
@L2023:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L2024
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6148
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L2025
	bcnd.n	 ge0,r24,@L2026
	or	 r3,r0,r24
	addu	 r3,r24,3
@L2026:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L2029
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L2030:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L2032
	subu	 r2,r2,1
	addu	 r13,r13,3
@L2032:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L2031
	bsr	 _abort
	align	 4
@L2031:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L2030
	addu	 r3,r3,4
@L2029:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L2034
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L2034:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L2037
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L2038
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L2038:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L2037:
	bsr	 _abort
	align	 4
@L2025:
	or.u	 r13,r0,hi16(_fp_delta)
@L6148:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L2024
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L2024:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6303
@L6304:
	align	 4
@L2019:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L2041
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2042
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6305
@L6306:
	align	 4
@L2042:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2044
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6307
@L6308:
	align	 4
@L2044:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6309
@L6310:
	align	 4
@L2041:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2047
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6311
@L6312:
	align	 4
@L2047:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2049
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6313
@L6314:
	align	 4
@L2049:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6315
@L6316:
	align	 4
@L2018:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6022:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r18
	align	 4
@L2052:
	bsr	 _abort
	align	 4
@L1975:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L5891
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r18
	or	 r21,r0,r22
@L2058:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L2061
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L2074
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L2057
	cmp	 r13,r12,69
	bb0	 ne,r13,@L2063
	br	 @L2072
	align	 4
@L2074:
	bb0	 ne,r13,@L2071
	bb1.n	 gt,r13,@L2075
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L2071
	br	 @L2072
	align	 4
@L2075:
	bb0.n	 ne,r13,@L2062
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L2072
	align	 4
@L2061:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L2057
	st	 r2,r21,4
	align	 4
@L2062:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L2057
	st	 r13,r21,4
	align	 4
@L2063:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L2057
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L2057
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L2057
	or	 r19,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L2068:
	ld	 r13,r19,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L2068
	addu	 r25,r25,4
	br	 @L2057
	align	 4
@L2071:
	ld	 r13,r20,4
	br.n	 @L2057
	st	 r13,r21,4
	align	 4
@L2072:
	bsr	 _abort
	align	 4
@L2057:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L2058
	addu	 r21,r21,4
	br.n	 @L6142
	cmp	 r13,r15,22
	align	 4
@L2078:
	cmp	 r9,r9,0
	cmp	 r11,r11,0
	or	 r13,r9,r11
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L2079
	cmp	 r13,r10,r8
	bb1	 ne,r13,@L2080
	bcnd	 eq0,r19,@L1650
	ld.hu	 r15,r0,r19
	ld.bu	 r23,r19,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L2161)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L2083
	or	 r13,r13,lo16(@L2161)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L2161:
	word	 @L1664
	word	 @L2083
	word	 @L2083
	word	 @L2083
	word	 @L2083
	word	 @L2098
	word	 @L2083
	word	 @L2083
	word	 @L2083
	word	 @L2083
	word	 @L2083
	word	 @L2100
	word	 @L2160
	word	 @L1662
	word	 @L1662
	word	 @L2083
	word	 @L1662
	word	 @L2084
	word	 @L2083
	word	 @L2083
	word	 @L2121
	word	 @L1665
	word	 @L1662
	word	 @L1662
	word	 @L2083
	word	 @L2083
	word	 @L2083
	word	 @L2103
	align	 4
@L2084:
	ld	 r25,r19,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r19
	bb0.n	 (31-30),r13,@L1871
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L2098:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r19,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6014
	br	 @L2083
	align	 4
@L2100:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L1675
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L2083
	br	 @L1675
	align	 4
@L2103:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L2107
	ld	 r13,r19,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L2104
	bb0.n	 ne,r12,@L2107
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L2106
	or	 r22,r0,r3
@L2107:
	ld	 r22,r19,8
@L2106:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L2104:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	ld	 r2,r19,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2115
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	ld	 r13,r19,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6317
@L6318:
	align	 4
@L2115:
	ld	 r13,r19,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2117
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r19,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6319
@L6320:
	align	 4
@L2117:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r19,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6023:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr.n	 _memory_address
	subu	 r1,r1,@L6321
@L6322:
	align	 4
@L2121:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L2124
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6149
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr.n	 _copy_rtx_and_substitute
	subu	 r1,r1,@L6323
@L6324:
	align	 4
@L2124:
	or	 r2,r0,r23
@L6149:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L2125
	or	 r2,r0,r22
	bsr.n	 _copy_address
	subu	 r1,r1,@L6325
@L6326:
	align	 4
@L2125:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L2126
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L2130
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L2127
	bb0.n	 ne,r11,@L2130
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L2129
@L2130:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L2131
	align	 4
@L2129:
	or	 r22,r0,r12
@L2131:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L2132
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6150
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L2133
	bcnd.n	 ge0,r24,@L2134
	or	 r3,r0,r24
	addu	 r3,r24,3
@L2134:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L2137
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L2138:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L2140
	subu	 r2,r2,1
	addu	 r13,r13,3
@L2140:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L2139
	bsr	 _abort
	align	 4
@L2139:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L2138
	addu	 r3,r3,4
@L2137:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L2142
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L2142:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L2145
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L2146
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L2146:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L2145:
	bsr	 _abort
	align	 4
@L2133:
	or.u	 r13,r0,hi16(_fp_delta)
@L6150:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L2132
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L2132:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6327
@L6328:
	align	 4
@L2127:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L2149
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2150
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6329
@L6330:
	align	 4
@L2150:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2152
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6331
@L6332:
	align	 4
@L2152:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6333
@L6334:
	align	 4
@L2149:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2155
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6335
@L6336:
	align	 4
@L2155:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2157
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6337
@L6338:
	align	 4
@L2157:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6339
@L6340:
	align	 4
@L2126:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6025:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r19
	align	 4
@L2160:
	bsr	 _abort
	align	 4
@L2083:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L2164
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r19
	or	 r21,r0,r22
@L2166:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L2169
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L2182
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L2165
	cmp	 r13,r12,69
	bb0	 ne,r13,@L2171
	br	 @L2180
	align	 4
@L2182:
	bb0	 ne,r13,@L2179
	bb1.n	 gt,r13,@L2183
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L2179
	br	 @L2180
	align	 4
@L2183:
	bb0.n	 ne,r13,@L2170
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L2180
	align	 4
@L2169:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L2165
	st	 r2,r21,4
	align	 4
@L2170:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L2165
	st	 r13,r21,4
	align	 4
@L2171:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L2165
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L2165
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L2165
	or	 r18,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L2176:
	ld	 r13,r18,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L2176
	addu	 r25,r25,4
	br	 @L2165
	align	 4
@L2179:
	ld	 r13,r20,4
	br.n	 @L2165
	st	 r13,r21,4
	align	 4
@L2180:
	bsr	 _abort
	align	 4
@L2165:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L2166
	addu	 r21,r21,4
@L2164:
	cmp	 r13,r15,22
	bb0.n	 eq,r13,@L5915
	or	 r2,r0,r22
	or.u	 r12,r0,hi16(_orig_asm_operands_vector)
	ld	 r13,r12,lo16(_orig_asm_operands_vector)
	bcnd	 ne0,r13,@L5915
	ld	 r13,r19,16
	br.n	 @L6137
	st	 r13,r12,lo16(_orig_asm_operands_vector)
	align	 4
@L2080:
	bcnd	 eq0,r18,@L1650
	ld.hu	 r15,r0,r18
	ld.bu	 r23,r18,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L2267)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L2189
	or	 r13,r13,lo16(@L2267)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L2267:
	word	 @L2197
	word	 @L2189
	word	 @L2189
	word	 @L2189
	word	 @L2189
	word	 @L2204
	word	 @L2189
	word	 @L2189
	word	 @L2189
	word	 @L2189
	word	 @L2189
	word	 @L2206
	word	 @L2266
	word	 @L1768
	word	 @L1768
	word	 @L2189
	word	 @L1768
	word	 @L2190
	word	 @L2189
	word	 @L2189
	word	 @L2227
	word	 @L2198
	word	 @L1768
	word	 @L1768
	word	 @L2189
	word	 @L2189
	word	 @L2189
	word	 @L2209
	align	 4
@L2190:
	ld	 r25,r18,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r18
	bb0.n	 (31-30),r13,@L1978
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L2197:
	ld	 r12,r18,16
	br.n	 @L6005
	or.u	 r13,r0,hi16(_label_map)
	align	 4
@L2198:
	bsr.n	 _rtx_alloc
	or	 r2,r0,38
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r18,4
	br.n	 @L6138
	or.u	 r12,r0,hi16(_label_map)
	align	 4
@L2204:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r18,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6019
	br	 @L2189
	align	 4
@L2206:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L2208
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L2189
@L2208:
	ld	 r13,r18,4
	ld.bu	 r24,r18,2
	ld	 r2,r13,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r25,r13,2
	or	 r4,r0,r2
	or	 r2,r0,37
	bsr.n	 _gen_rtx
	or	 r3,r0,r25
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6007
	align	 4
@L2209:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L2213
	ld	 r13,r18,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L2210
	bb0.n	 ne,r12,@L2213
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L2212
	or	 r22,r0,r3
@L2213:
	ld	 r22,r18,8
@L2212:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L2210:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L2219
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L2219
	ld	 r2,r18,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2221
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	ld	 r13,r18,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6341
@L6342:
	align	 4
@L2221:
	ld	 r13,r18,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2223
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r18,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6343
@L6344:
	align	 4
@L2223:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6026:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr.n	 _memory_address
	subu	 r1,r1,@L6345
@L6346:
	align	 4
@L2219:
	ld	 r2,r18,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6133
	align	 4
@L2227:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L2230
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6151
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr.n	 _copy_rtx_and_substitute
	subu	 r1,r1,@L6347
@L6348:
	align	 4
@L2230:
	or	 r2,r0,r23
@L6151:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L2231
	or	 r2,r0,r22
	bsr.n	 _copy_address
	subu	 r1,r1,@L6349
@L6350:
	align	 4
@L2231:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L2232
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L2236
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L2233
	bb0.n	 ne,r11,@L2236
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L2235
@L2236:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L2237
	align	 4
@L2235:
	or	 r22,r0,r12
@L2237:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L2238
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6152
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L2239
	bcnd.n	 ge0,r24,@L2240
	or	 r3,r0,r24
	addu	 r3,r24,3
@L2240:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L2243
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L2244:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L2246
	subu	 r2,r2,1
	addu	 r13,r13,3
@L2246:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L2245
	bsr	 _abort
	align	 4
@L2245:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L2244
	addu	 r3,r3,4
@L2243:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L2248
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L2248:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L2251
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L2252
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L2252:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L2251:
	bsr	 _abort
	align	 4
@L2239:
	or.u	 r13,r0,hi16(_fp_delta)
@L6152:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L2238
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L2238:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6351
@L6352:
	align	 4
@L2233:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L2255
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2256
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6353
@L6354:
	align	 4
@L2256:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2258
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6355
@L6356:
	align	 4
@L2258:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6357
@L6358:
	align	 4
@L2255:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2261
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6359
@L6360:
	align	 4
@L2261:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2263
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6361
@L6362:
	align	 4
@L2263:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6363
@L6364:
	align	 4
@L2232:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6028:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r18
	align	 4
@L2266:
	bsr	 _abort
	align	 4
@L2189:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L5891
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r18
	or	 r21,r0,r22
@L2272:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L2275
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L2288
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L2271
	cmp	 r13,r12,69
	bb0	 ne,r13,@L2277
	br	 @L2286
	align	 4
@L2288:
	bb0	 ne,r13,@L2285
	bb1.n	 gt,r13,@L2289
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L2285
	br	 @L2286
	align	 4
@L2289:
	bb0.n	 ne,r13,@L2276
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L2286
	align	 4
@L2275:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L2271
	st	 r2,r21,4
	align	 4
@L2276:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L2271
	st	 r13,r21,4
	align	 4
@L2277:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L2271
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L2271
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L2271
	or	 r19,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L2282:
	ld	 r13,r19,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L2282
	addu	 r25,r25,4
	br	 @L2271
	align	 4
@L2285:
	ld	 r13,r20,4
	br.n	 @L2271
	st	 r13,r21,4
	align	 4
@L2286:
	bsr	 _abort
	align	 4
@L2271:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L2272
	addu	 r21,r21,4
	br.n	 @L6142
	cmp	 r13,r15,22
	align	 4
@L2079:
	cmp	 r13,r10,0
	cmp	 r12,r8,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L2292
	bcnd	 eq0,r18,@L1650
	ld.hu	 r15,r0,r18
	ld.bu	 r23,r18,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L2373)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L2295
	or	 r13,r13,lo16(@L2373)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L2373:
	word	 @L2303
	word	 @L2295
	word	 @L2295
	word	 @L2295
	word	 @L2295
	word	 @L2310
	word	 @L2295
	word	 @L2295
	word	 @L2295
	word	 @L2295
	word	 @L2295
	word	 @L2312
	word	 @L2372
	word	 @L1768
	word	 @L1768
	word	 @L2295
	word	 @L1768
	word	 @L2296
	word	 @L2295
	word	 @L2295
	word	 @L2333
	word	 @L2304
	word	 @L1768
	word	 @L1768
	word	 @L2295
	word	 @L2295
	word	 @L2295
	word	 @L2315
	align	 4
@L2296:
	ld	 r25,r18,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r18
	bb0.n	 (31-30),r13,@L1978
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L2303:
	ld	 r12,r18,16
	br.n	 @L6005
	or.u	 r13,r0,hi16(_label_map)
	align	 4
@L2304:
	bsr.n	 _rtx_alloc
	or	 r2,r0,38
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r18,4
	br.n	 @L6138
	or.u	 r12,r0,hi16(_label_map)
	align	 4
@L2310:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r18,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6019
	br	 @L2295
	align	 4
@L2312:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L2314
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L2295
@L2314:
	ld	 r13,r18,4
	ld.bu	 r24,r18,2
	ld	 r2,r13,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r25,r13,2
	or	 r4,r0,r2
	or	 r2,r0,37
	bsr.n	 _gen_rtx
	or	 r3,r0,r25
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6007
	align	 4
@L2315:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L2319
	ld	 r13,r18,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L2316
	bb0.n	 ne,r12,@L2319
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L2318
	or	 r22,r0,r3
@L2319:
	ld	 r22,r18,8
@L2318:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L2316:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L2325
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L2325
	ld	 r2,r18,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2327
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	ld	 r13,r18,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6365
@L6366:
	align	 4
@L2327:
	ld	 r13,r18,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2329
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r18,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6367
@L6368:
	align	 4
@L2329:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6029:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr.n	 _memory_address
	subu	 r1,r1,@L6369
@L6370:
	align	 4
@L2325:
	ld	 r2,r18,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6133
	align	 4
@L2333:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L2336
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6153
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr.n	 _copy_rtx_and_substitute
	subu	 r1,r1,@L6371
@L6372:
	align	 4
@L2336:
	or	 r2,r0,r23
@L6153:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L2337
	or	 r2,r0,r22
	bsr.n	 _copy_address
	subu	 r1,r1,@L6373
@L6374:
	align	 4
@L2337:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L2338
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L2342
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L2339
	bb0.n	 ne,r11,@L2342
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L2341
@L2342:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L2343
	align	 4
@L2341:
	or	 r22,r0,r12
@L2343:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L2344
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6154
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L2345
	bcnd.n	 ge0,r24,@L2346
	or	 r3,r0,r24
	addu	 r3,r24,3
@L2346:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L2349
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L2350:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L2352
	subu	 r2,r2,1
	addu	 r13,r13,3
@L2352:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L2351
	bsr	 _abort
	align	 4
@L2351:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L2350
	addu	 r3,r3,4
@L2349:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L2354
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L2354:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L2357
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L2358
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L2358:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L2357:
	bsr	 _abort
	align	 4
@L2345:
	or.u	 r13,r0,hi16(_fp_delta)
@L6154:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L2344
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L2344:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6375
@L6376:
	align	 4
@L2339:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L2361
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2362
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6377
@L6378:
	align	 4
@L2362:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2364
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6379
@L6380:
	align	 4
@L2364:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6381
@L6382:
	align	 4
@L2361:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2367
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6383
@L6384:
	align	 4
@L2367:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2369
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6385
@L6386:
	align	 4
@L2369:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6387
@L6388:
	align	 4
@L2338:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6031:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r18
	align	 4
@L2372:
	bsr	 _abort
	align	 4
@L2295:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L5891
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r18
	or	 r21,r0,r22
@L2378:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L2381
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L2394
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L2377
	cmp	 r13,r12,69
	bb0	 ne,r13,@L2383
	br	 @L2392
	align	 4
@L2394:
	bb0	 ne,r13,@L2391
	bb1.n	 gt,r13,@L2395
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L2391
	br	 @L2392
	align	 4
@L2395:
	bb0.n	 ne,r13,@L2382
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L2392
	align	 4
@L2381:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L2377
	st	 r2,r21,4
	align	 4
@L2382:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L2377
	st	 r13,r21,4
	align	 4
@L2383:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L2377
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L2377
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L2377
	or	 r19,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L2388:
	ld	 r13,r19,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L2388
	addu	 r25,r25,4
	br	 @L2377
	align	 4
@L2391:
	ld	 r13,r20,4
	br.n	 @L2377
	st	 r13,r21,4
	align	 4
@L2392:
	bsr	 _abort
	align	 4
@L2377:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L2378
	addu	 r21,r21,4
	br.n	 @L6142
	cmp	 r13,r15,22
	align	 4
@L2292:
	and	 r13,r9,r11
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L1650
	bsr	 _rtx_equal_p
	bcnd	 eq0,r2,@L1650
	bcnd	 eq0,r19,@L1650
	ld.hu	 r15,r0,r19
	ld.bu	 r23,r19,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L2480)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L2402
	or	 r13,r13,lo16(@L2480)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L2480:
	word	 @L1664
	word	 @L2402
	word	 @L2402
	word	 @L2402
	word	 @L2402
	word	 @L2417
	word	 @L2402
	word	 @L2402
	word	 @L2402
	word	 @L2402
	word	 @L2402
	word	 @L2419
	word	 @L2479
	word	 @L1662
	word	 @L1662
	word	 @L2402
	word	 @L1662
	word	 @L2403
	word	 @L2402
	word	 @L2402
	word	 @L2440
	word	 @L1665
	word	 @L1662
	word	 @L1662
	word	 @L2402
	word	 @L2402
	word	 @L2402
	word	 @L2422
	align	 4
@L2403:
	ld	 r25,r19,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r19
	bb0.n	 (31-30),r13,@L1871
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L2417:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r19,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6014
	br	 @L2402
	align	 4
@L2419:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L1675
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L2402
	br	 @L1675
	align	 4
@L2422:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L2426
	ld	 r13,r19,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L2423
	bb0.n	 ne,r12,@L2426
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L2425
	or	 r22,r0,r3
@L2426:
	ld	 r22,r19,8
@L2425:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L2423:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	ld	 r2,r19,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2434
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	ld	 r13,r19,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6389
@L6390:
	align	 4
@L2434:
	ld	 r13,r19,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2436
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r19,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6391
@L6392:
	align	 4
@L2436:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r19,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6032:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr.n	 _memory_address
	subu	 r1,r1,@L6393
@L6394:
	align	 4
@L2440:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L2443
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6155
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr.n	 _copy_rtx_and_substitute
	subu	 r1,r1,@L6395
@L6396:
	align	 4
@L2443:
	or	 r2,r0,r23
@L6155:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L2444
	or	 r2,r0,r22
	bsr.n	 _copy_address
	subu	 r1,r1,@L6397
@L6398:
	align	 4
@L2444:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L2445
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L2449
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L2446
	bb0.n	 ne,r11,@L2449
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L2448
@L2449:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L2450
	align	 4
@L2448:
	or	 r22,r0,r12
@L2450:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L2451
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6156
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L2452
	bcnd.n	 ge0,r24,@L2453
	or	 r3,r0,r24
	addu	 r3,r24,3
@L2453:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L2456
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L2457:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L2459
	subu	 r2,r2,1
	addu	 r13,r13,3
@L2459:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L2458
	bsr	 _abort
	align	 4
@L2458:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L2457
	addu	 r3,r3,4
@L2456:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L2461
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L2461:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L2464
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L2465
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L2465:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L2464:
	bsr	 _abort
	align	 4
@L2452:
	or.u	 r13,r0,hi16(_fp_delta)
@L6156:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L2451
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L2451:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6399
@L6400:
	align	 4
@L2446:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L2468
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2469
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6401
@L6402:
	align	 4
@L2469:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2471
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6403
@L6404:
	align	 4
@L2471:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6405
@L6406:
	align	 4
@L2468:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2474
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6407
@L6408:
	align	 4
@L2474:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2476
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6409
@L6410:
	align	 4
@L2476:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6411
@L6412:
	align	 4
@L2445:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6034:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r19
	align	 4
@L2479:
	bsr	 _abort
	align	 4
@L2402:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L2483
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r19
	or	 r21,r0,r22
@L2485:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L2488
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L2501
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L2484
	cmp	 r13,r12,69
	bb0	 ne,r13,@L2490
	br	 @L2499
	align	 4
@L2501:
	bb0	 ne,r13,@L2498
	bb1.n	 gt,r13,@L2502
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L2498
	br	 @L2499
	align	 4
@L2502:
	bb0.n	 ne,r13,@L2489
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L2499
	align	 4
@L2488:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L2484
	st	 r2,r21,4
	align	 4
@L2489:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L2484
	st	 r13,r21,4
	align	 4
@L2490:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L2484
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L2484
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L2484
	or	 r18,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L2495:
	ld	 r13,r18,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L2495
	addu	 r25,r25,4
	br	 @L2484
	align	 4
@L2498:
	ld	 r13,r20,4
	br.n	 @L2484
	st	 r13,r21,4
	align	 4
@L2499:
	bsr	 _abort
	align	 4
@L2484:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L2485
	addu	 r21,r21,4
@L2483:
	cmp	 r13,r15,22
	bb0.n	 eq,r13,@L5915
	or	 r2,r0,r22
	or.u	 r12,r0,hi16(_orig_asm_operands_vector)
	ld	 r13,r12,lo16(_orig_asm_operands_vector)
	bcnd	 ne0,r13,@L5915
	ld	 r13,r19,16
	br.n	 @L6137
	st	 r13,r12,lo16(_orig_asm_operands_vector)
	align	 4
@L2505:
	subu	 r13,r0,r11
	subu	 r12,r0,r9
	mask	 r13,r13,1
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L2506
	cmp	 r13,r10,r8
	bb0	 ge,r13,@L2507
	bcnd	 eq0,r19,@L1650
	ld.hu	 r15,r0,r19
	ld.bu	 r23,r19,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L2588)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L2510
	or	 r13,r13,lo16(@L2588)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L2588:
	word	 @L1664
	word	 @L2510
	word	 @L2510
	word	 @L2510
	word	 @L2510
	word	 @L2525
	word	 @L2510
	word	 @L2510
	word	 @L2510
	word	 @L2510
	word	 @L2510
	word	 @L2527
	word	 @L2587
	word	 @L1662
	word	 @L1662
	word	 @L2510
	word	 @L1662
	word	 @L2511
	word	 @L2510
	word	 @L2510
	word	 @L2548
	word	 @L1665
	word	 @L1662
	word	 @L1662
	word	 @L2510
	word	 @L2510
	word	 @L2510
	word	 @L2530
	align	 4
@L2511:
	ld	 r25,r19,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r19
	bb0.n	 (31-30),r13,@L1871
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L2525:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r19,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6014
	br	 @L2510
	align	 4
@L2527:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L1675
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L2510
	br	 @L1675
	align	 4
@L2530:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L2534
	ld	 r13,r19,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L2531
	bb0.n	 ne,r12,@L2534
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L2533
	or	 r22,r0,r3
@L2534:
	ld	 r22,r19,8
@L2533:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L2531:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	ld	 r2,r19,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2542
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	ld	 r13,r19,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6413
@L6414:
	align	 4
@L2542:
	ld	 r13,r19,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2544
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r19,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6415
@L6416:
	align	 4
@L2544:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r19,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6035:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr.n	 _memory_address
	subu	 r1,r1,@L6417
@L6418:
	align	 4
@L2548:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L2551
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6157
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr.n	 _copy_rtx_and_substitute
	subu	 r1,r1,@L6419
@L6420:
	align	 4
@L2551:
	or	 r2,r0,r23
@L6157:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L2552
	or	 r2,r0,r22
	bsr.n	 _copy_address
	subu	 r1,r1,@L6421
@L6422:
	align	 4
@L2552:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L2553
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L2557
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L2554
	bb0.n	 ne,r11,@L2557
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L2556
@L2557:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L2558
	align	 4
@L2556:
	or	 r22,r0,r12
@L2558:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L2559
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6158
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L2560
	bcnd.n	 ge0,r24,@L2561
	or	 r3,r0,r24
	addu	 r3,r24,3
@L2561:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L2564
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L2565:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L2567
	subu	 r2,r2,1
	addu	 r13,r13,3
@L2567:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L2566
	bsr	 _abort
	align	 4
@L2566:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L2565
	addu	 r3,r3,4
@L2564:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L2569
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L2569:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L2572
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L2573
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L2573:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L2572:
	bsr	 _abort
	align	 4
@L2560:
	or.u	 r13,r0,hi16(_fp_delta)
@L6158:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L2559
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L2559:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6423
@L6424:
	align	 4
@L2554:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L2576
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2577
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6425
@L6426:
	align	 4
@L2577:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2579
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6427
@L6428:
	align	 4
@L2579:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6429
@L6430:
	align	 4
@L2576:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2582
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6431
@L6432:
	align	 4
@L2582:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2584
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6433
@L6434:
	align	 4
@L2584:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6435
@L6436:
	align	 4
@L2553:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6037:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r19
	align	 4
@L2587:
	bsr	 _abort
	align	 4
@L2510:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L2591
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r19
	or	 r21,r0,r22
@L2593:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L2596
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L2609
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L2592
	cmp	 r13,r12,69
	bb0	 ne,r13,@L2598
	br	 @L2607
	align	 4
@L2609:
	bb0	 ne,r13,@L2606
	bb1.n	 gt,r13,@L2610
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L2606
	br	 @L2607
	align	 4
@L2610:
	bb0.n	 ne,r13,@L2597
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L2607
	align	 4
@L2596:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L2592
	st	 r2,r21,4
	align	 4
@L2597:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L2592
	st	 r13,r21,4
	align	 4
@L2598:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L2592
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L2592
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L2592
	or	 r18,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L2603:
	ld	 r13,r18,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L2603
	addu	 r25,r25,4
	br	 @L2592
	align	 4
@L2606:
	ld	 r13,r20,4
	br.n	 @L2592
	st	 r13,r21,4
	align	 4
@L2607:
	bsr	 _abort
	align	 4
@L2592:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L2593
	addu	 r21,r21,4
@L2591:
	cmp	 r13,r15,22
	bb0.n	 eq,r13,@L5915
	or	 r2,r0,r22
	or.u	 r12,r0,hi16(_orig_asm_operands_vector)
	ld	 r13,r12,lo16(_orig_asm_operands_vector)
	bcnd	 ne0,r13,@L5915
	ld	 r13,r19,16
	br.n	 @L6137
	st	 r13,r12,lo16(_orig_asm_operands_vector)
	align	 4
@L2507:
	bcnd	 eq0,r18,@L1650
	ld.hu	 r15,r0,r18
	ld.bu	 r23,r18,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L2694)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L2616
	or	 r13,r13,lo16(@L2694)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L2694:
	word	 @L2624
	word	 @L2616
	word	 @L2616
	word	 @L2616
	word	 @L2616
	word	 @L2631
	word	 @L2616
	word	 @L2616
	word	 @L2616
	word	 @L2616
	word	 @L2616
	word	 @L2633
	word	 @L2693
	word	 @L1768
	word	 @L1768
	word	 @L2616
	word	 @L1768
	word	 @L2617
	word	 @L2616
	word	 @L2616
	word	 @L2654
	word	 @L2625
	word	 @L1768
	word	 @L1768
	word	 @L2616
	word	 @L2616
	word	 @L2616
	word	 @L2636
	align	 4
@L2617:
	ld	 r25,r18,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r18
	bb0.n	 (31-30),r13,@L1978
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L2624:
	ld	 r12,r18,16
	br.n	 @L6005
	or.u	 r13,r0,hi16(_label_map)
	align	 4
@L2625:
	bsr.n	 _rtx_alloc
	or	 r2,r0,38
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r18,4
	br.n	 @L6138
	or.u	 r12,r0,hi16(_label_map)
	align	 4
@L2631:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r18,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6019
	br	 @L2616
	align	 4
@L2633:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L2635
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L2616
@L2635:
	ld	 r13,r18,4
	ld.bu	 r24,r18,2
	ld	 r2,r13,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r25,r13,2
	or	 r4,r0,r2
	or	 r2,r0,37
	bsr.n	 _gen_rtx
	or	 r3,r0,r25
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6007
	align	 4
@L2636:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L2640
	ld	 r13,r18,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L2637
	bb0.n	 ne,r12,@L2640
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L2639
	or	 r22,r0,r3
@L2640:
	ld	 r22,r18,8
@L2639:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L2637:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L2646
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L2646
	ld	 r2,r18,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2648
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	ld	 r13,r18,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6437
@L6438:
	align	 4
@L2648:
	ld	 r13,r18,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2650
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r18,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6439
@L6440:
	align	 4
@L2650:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6038:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr.n	 _memory_address
	subu	 r1,r1,@L6441
@L6442:
	align	 4
@L2646:
	ld	 r2,r18,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6133
	align	 4
@L2654:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L2657
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6159
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr.n	 _copy_rtx_and_substitute
	subu	 r1,r1,@L6443
@L6444:
	align	 4
@L2657:
	or	 r2,r0,r23
@L6159:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L2658
	or	 r2,r0,r22
	bsr.n	 _copy_address
	subu	 r1,r1,@L6445
@L6446:
	align	 4
@L2658:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L2659
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L2663
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L2660
	bb0.n	 ne,r11,@L2663
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L2662
@L2663:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L2664
	align	 4
@L2662:
	or	 r22,r0,r12
@L2664:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L2665
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6160
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L2666
	bcnd.n	 ge0,r24,@L2667
	or	 r3,r0,r24
	addu	 r3,r24,3
@L2667:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L2670
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L2671:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L2673
	subu	 r2,r2,1
	addu	 r13,r13,3
@L2673:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L2672
	bsr	 _abort
	align	 4
@L2672:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L2671
	addu	 r3,r3,4
@L2670:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L2675
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L2675:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L2678
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L2679
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L2679:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L2678:
	bsr	 _abort
	align	 4
@L2666:
	or.u	 r13,r0,hi16(_fp_delta)
@L6160:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L2665
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L2665:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6447
@L6448:
	align	 4
@L2660:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L2682
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2683
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6449
@L6450:
	align	 4
@L2683:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2685
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6451
@L6452:
	align	 4
@L2685:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6453
@L6454:
	align	 4
@L2682:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2688
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6455
@L6456:
	align	 4
@L2688:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2690
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6457
@L6458:
	align	 4
@L2690:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6459
@L6460:
	align	 4
@L2659:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6040:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r18
	align	 4
@L2693:
	bsr	 _abort
	align	 4
@L2616:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L5891
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r18
	or	 r21,r0,r22
@L2699:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L2702
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L2715
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L2698
	cmp	 r13,r12,69
	bb0	 ne,r13,@L2704
	br	 @L2713
	align	 4
@L2715:
	bb0	 ne,r13,@L2712
	bb1.n	 gt,r13,@L2716
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L2712
	br	 @L2713
	align	 4
@L2716:
	bb0.n	 ne,r13,@L2703
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L2713
	align	 4
@L2702:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L2698
	st	 r2,r21,4
	align	 4
@L2703:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L2698
	st	 r13,r21,4
	align	 4
@L2704:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L2698
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L2698
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L2698
	or	 r19,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L2709:
	ld	 r13,r19,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L2709
	addu	 r25,r25,4
	br	 @L2698
	align	 4
@L2712:
	ld	 r13,r20,4
	br.n	 @L2698
	st	 r13,r21,4
	align	 4
@L2713:
	bsr	 _abort
	align	 4
@L2698:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L2699
	addu	 r21,r21,4
	br.n	 @L6142
	cmp	 r13,r15,22
	align	 4
@L2506:
	bcnd	 ne0,r10,@L2719
	bcnd	 eq0,r18,@L1650
	ld.hu	 r15,r0,r18
	ld.bu	 r23,r18,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L2800)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L2722
	or	 r13,r13,lo16(@L2800)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L2800:
	word	 @L2730
	word	 @L2722
	word	 @L2722
	word	 @L2722
	word	 @L2722
	word	 @L2737
	word	 @L2722
	word	 @L2722
	word	 @L2722
	word	 @L2722
	word	 @L2722
	word	 @L2739
	word	 @L2799
	word	 @L1768
	word	 @L1768
	word	 @L2722
	word	 @L1768
	word	 @L2723
	word	 @L2722
	word	 @L2722
	word	 @L2760
	word	 @L2731
	word	 @L1768
	word	 @L1768
	word	 @L2722
	word	 @L2722
	word	 @L2722
	word	 @L2742
	align	 4
@L2723:
	ld	 r25,r18,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r18
	bb0.n	 (31-30),r13,@L1978
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L2730:
	ld	 r12,r18,16
	br.n	 @L6005
	or.u	 r13,r0,hi16(_label_map)
	align	 4
@L2731:
	bsr.n	 _rtx_alloc
	or	 r2,r0,38
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r18,4
	br.n	 @L6138
	or.u	 r12,r0,hi16(_label_map)
	align	 4
@L2737:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r18,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6019
	br	 @L2722
	align	 4
@L2739:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L2741
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L2722
@L2741:
	ld	 r13,r18,4
	ld.bu	 r24,r18,2
	ld	 r2,r13,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r25,r13,2
	or	 r4,r0,r2
	or	 r2,r0,37
	bsr.n	 _gen_rtx
	or	 r3,r0,r25
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6007
	align	 4
@L2742:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L2746
	ld	 r13,r18,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L2743
	bb0.n	 ne,r12,@L2746
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L2745
	or	 r22,r0,r3
@L2746:
	ld	 r22,r18,8
@L2745:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L2743:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L2752
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L2752
	ld	 r2,r18,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2754
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	ld	 r13,r18,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6461
@L6462:
	align	 4
@L2754:
	ld	 r13,r18,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2756
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r18,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6463
@L6464:
	align	 4
@L2756:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6041:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr.n	 _memory_address
	subu	 r1,r1,@L6465
@L6466:
	align	 4
@L2752:
	ld	 r2,r18,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6133
	align	 4
@L2760:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L2763
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6161
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr.n	 _copy_rtx_and_substitute
	subu	 r1,r1,@L6467
@L6468:
	align	 4
@L2763:
	or	 r2,r0,r23
@L6161:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L2764
	or	 r2,r0,r22
	bsr.n	 _copy_address
	subu	 r1,r1,@L6469
@L6470:
	align	 4
@L2764:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L2765
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L2769
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L2766
	bb0.n	 ne,r11,@L2769
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L2768
@L2769:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L2770
	align	 4
@L2768:
	or	 r22,r0,r12
@L2770:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L2771
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6162
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L2772
	bcnd.n	 ge0,r24,@L2773
	or	 r3,r0,r24
	addu	 r3,r24,3
@L2773:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L2776
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L2777:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L2779
	subu	 r2,r2,1
	addu	 r13,r13,3
@L2779:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L2778
	bsr	 _abort
	align	 4
@L2778:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L2777
	addu	 r3,r3,4
@L2776:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L2781
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L2781:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L2784
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L2785
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L2785:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L2784:
	bsr	 _abort
	align	 4
@L2772:
	or.u	 r13,r0,hi16(_fp_delta)
@L6162:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L2771
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L2771:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6471
@L6472:
	align	 4
@L2766:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L2788
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2789
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6473
@L6474:
	align	 4
@L2789:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2791
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6475
@L6476:
	align	 4
@L2791:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6477
@L6478:
	align	 4
@L2788:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2794
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6479
@L6480:
	align	 4
@L2794:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2796
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6481
@L6482:
	align	 4
@L2796:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6483
@L6484:
	align	 4
@L2765:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6043:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r18
	align	 4
@L2799:
	bsr	 _abort
	align	 4
@L2722:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L5891
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r18
	or	 r21,r0,r22
@L2805:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L2808
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L2821
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L2804
	cmp	 r13,r12,69
	bb0	 ne,r13,@L2810
	br	 @L2819
	align	 4
@L2821:
	bb0	 ne,r13,@L2818
	bb1.n	 gt,r13,@L2822
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L2818
	br	 @L2819
	align	 4
@L2822:
	bb0.n	 ne,r13,@L2809
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L2819
	align	 4
@L2808:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L2804
	st	 r2,r21,4
	align	 4
@L2809:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L2804
	st	 r13,r21,4
	align	 4
@L2810:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L2804
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L2804
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L2804
	or	 r19,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L2815:
	ld	 r13,r19,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L2815
	addu	 r25,r25,4
	br	 @L2804
	align	 4
@L2818:
	ld	 r13,r20,4
	br.n	 @L2804
	st	 r13,r21,4
	align	 4
@L2819:
	bsr	 _abort
	align	 4
@L2804:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L2805
	addu	 r21,r21,4
	br.n	 @L6142
	cmp	 r13,r15,22
	align	 4
@L2719:
	bcnd.n	 ne0,r8,@L5915
	or	 r2,r0,0
	bcnd	 eq0,r19,@L5915
	ld.hu	 r15,r0,r19
	ld.bu	 r23,r19,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L2906)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L2828
	or	 r13,r13,lo16(@L2906)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L2906:
	word	 @L1664
	word	 @L2828
	word	 @L2828
	word	 @L2828
	word	 @L2828
	word	 @L2843
	word	 @L2828
	word	 @L2828
	word	 @L2828
	word	 @L2828
	word	 @L2828
	word	 @L2845
	word	 @L2905
	word	 @L1662
	word	 @L1662
	word	 @L2828
	word	 @L1662
	word	 @L2829
	word	 @L2828
	word	 @L2828
	word	 @L2866
	word	 @L1665
	word	 @L1662
	word	 @L1662
	word	 @L2828
	word	 @L2828
	word	 @L2828
	word	 @L2848
	align	 4
@L2829:
	ld	 r25,r19,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r19
	bb0.n	 (31-30),r13,@L1871
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L2843:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r19,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6014
	br	 @L2828
	align	 4
@L2845:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L1675
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L2828
	br	 @L1675
	align	 4
@L2848:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L2852
	ld	 r13,r19,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L2849
	bb0.n	 ne,r12,@L2852
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L2851
	or	 r22,r0,r3
@L2852:
	ld	 r22,r19,8
@L2851:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L2849:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	ld	 r2,r19,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2860
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	ld	 r13,r19,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6485
@L6486:
	align	 4
@L2860:
	ld	 r13,r19,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2862
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r19,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6487
@L6488:
	align	 4
@L2862:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r19,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6044:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr.n	 _memory_address
	subu	 r1,r1,@L6489
@L6490:
	align	 4
@L2866:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L2869
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6163
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr.n	 _copy_rtx_and_substitute
	subu	 r1,r1,@L6491
@L6492:
	align	 4
@L2869:
	or	 r2,r0,r23
@L6163:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L2870
	or	 r2,r0,r22
	bsr.n	 _copy_address
	subu	 r1,r1,@L6493
@L6494:
	align	 4
@L2870:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L2871
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L2875
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L2872
	bb0.n	 ne,r11,@L2875
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L2874
@L2875:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L2876
	align	 4
@L2874:
	or	 r22,r0,r12
@L2876:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L2877
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6164
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L2878
	bcnd.n	 ge0,r24,@L2879
	or	 r3,r0,r24
	addu	 r3,r24,3
@L2879:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L2882
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L2883:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L2885
	subu	 r2,r2,1
	addu	 r13,r13,3
@L2885:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L2884
	bsr	 _abort
	align	 4
@L2884:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L2883
	addu	 r3,r3,4
@L2882:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L2887
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L2887:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L2890
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L2891
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L2891:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L2890:
	bsr	 _abort
	align	 4
@L2878:
	or.u	 r13,r0,hi16(_fp_delta)
@L6164:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L2877
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L2877:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6495
@L6496:
	align	 4
@L2872:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L2894
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2895
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6497
@L6498:
	align	 4
@L2895:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2897
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6499
@L6500:
	align	 4
@L2897:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6501
@L6502:
	align	 4
@L2894:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2900
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6503
@L6504:
	align	 4
@L2900:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2902
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6505
@L6506:
	align	 4
@L2902:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6507
@L6508:
	align	 4
@L2871:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6046:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r19
	align	 4
@L2905:
	bsr	 _abort
	align	 4
@L2828:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L2909
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r19
	or	 r21,r0,r22
@L2911:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L2914
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L2927
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L2910
	cmp	 r13,r12,69
	bb0	 ne,r13,@L2916
	br	 @L2925
	align	 4
@L2927:
	bb0	 ne,r13,@L2924
	bb1.n	 gt,r13,@L2928
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L2924
	br	 @L2925
	align	 4
@L2928:
	bb0.n	 ne,r13,@L2915
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L2925
	align	 4
@L2914:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L2910
	st	 r2,r21,4
	align	 4
@L2915:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L2910
	st	 r13,r21,4
	align	 4
@L2916:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L2910
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L2910
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L2910
	or	 r18,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L2921:
	ld	 r13,r18,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L2921
	addu	 r25,r25,4
	br	 @L2910
	align	 4
@L2924:
	ld	 r13,r20,4
	br.n	 @L2910
	st	 r13,r21,4
	align	 4
@L2925:
	bsr	 _abort
	align	 4
@L2910:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L2911
	addu	 r21,r21,4
@L2909:
	cmp	 r13,r15,22
	bb0.n	 eq,r13,@L5915
	or	 r2,r0,r22
	or.u	 r12,r0,hi16(_orig_asm_operands_vector)
	ld	 r13,r12,lo16(_orig_asm_operands_vector)
	bcnd	 ne0,r13,@L5915
	ld	 r13,r19,16
	br.n	 @L6137
	st	 r13,r12,lo16(_orig_asm_operands_vector)
	align	 4
@L2931:
	subu	 r13,r0,r11
	subu	 r12,r0,r9
	mask	 r13,r13,1
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L2932
	cmp	 r13,r10,r8
	bb0	 gt,r13,@L2933
	bcnd	 eq0,r19,@L1650
	ld.hu	 r15,r0,r19
	ld.bu	 r23,r19,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L3014)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L2936
	or	 r13,r13,lo16(@L3014)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L3014:
	word	 @L1664
	word	 @L2936
	word	 @L2936
	word	 @L2936
	word	 @L2936
	word	 @L2951
	word	 @L2936
	word	 @L2936
	word	 @L2936
	word	 @L2936
	word	 @L2936
	word	 @L2953
	word	 @L3013
	word	 @L1662
	word	 @L1662
	word	 @L2936
	word	 @L1662
	word	 @L2937
	word	 @L2936
	word	 @L2936
	word	 @L2974
	word	 @L1665
	word	 @L1662
	word	 @L1662
	word	 @L2936
	word	 @L2936
	word	 @L2936
	word	 @L2956
	align	 4
@L2937:
	ld	 r25,r19,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r19
	bb0.n	 (31-30),r13,@L1871
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L2951:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r19,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6014
	br	 @L2936
	align	 4
@L2953:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L1675
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L2936
	br	 @L1675
	align	 4
@L2956:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L2960
	ld	 r13,r19,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L2957
	bb0.n	 ne,r12,@L2960
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L2959
	or	 r22,r0,r3
@L2960:
	ld	 r22,r19,8
@L2959:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L2957:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	ld	 r2,r19,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2968
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	ld	 r13,r19,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6509
@L6510:
	align	 4
@L2968:
	ld	 r13,r19,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L2970
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r19,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6511
@L6512:
	align	 4
@L2970:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r19,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6047:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr.n	 _memory_address
	subu	 r1,r1,@L6513
@L6514:
	align	 4
@L2974:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L2977
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6165
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr.n	 _copy_rtx_and_substitute
	subu	 r1,r1,@L6515
@L6516:
	align	 4
@L2977:
	or	 r2,r0,r23
@L6165:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L2978
	or	 r2,r0,r22
	bsr.n	 _copy_address
	subu	 r1,r1,@L6517
@L6518:
	align	 4
@L2978:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L2979
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L2983
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L2980
	bb0.n	 ne,r11,@L2983
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L2982
@L2983:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L2984
	align	 4
@L2982:
	or	 r22,r0,r12
@L2984:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L2985
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6166
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L2986
	bcnd.n	 ge0,r24,@L2987
	or	 r3,r0,r24
	addu	 r3,r24,3
@L2987:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L2990
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L2991:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L2993
	subu	 r2,r2,1
	addu	 r13,r13,3
@L2993:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L2992
	bsr	 _abort
	align	 4
@L2992:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L2991
	addu	 r3,r3,4
@L2990:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L2995
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L2995:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L2998
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L2999
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L2999:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L2998:
	bsr	 _abort
	align	 4
@L2986:
	or.u	 r13,r0,hi16(_fp_delta)
@L6166:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L2985
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L2985:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6519
@L6520:
	align	 4
@L2980:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L3002
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3003
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6521
@L6522:
	align	 4
@L3003:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3005
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6523
@L6524:
	align	 4
@L3005:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6525
@L6526:
	align	 4
@L3002:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3008
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6527
@L6528:
	align	 4
@L3008:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3010
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6529
@L6530:
	align	 4
@L3010:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6531
@L6532:
	align	 4
@L2979:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6049:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r19
	align	 4
@L3013:
	bsr	 _abort
	align	 4
@L2936:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L3017
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r19
	or	 r21,r0,r22
@L3019:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L3022
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L3035
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L3018
	cmp	 r13,r12,69
	bb0	 ne,r13,@L3024
	br	 @L3033
	align	 4
@L3035:
	bb0	 ne,r13,@L3032
	bb1.n	 gt,r13,@L3036
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L3032
	br	 @L3033
	align	 4
@L3036:
	bb0.n	 ne,r13,@L3023
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L3033
	align	 4
@L3022:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L3018
	st	 r2,r21,4
	align	 4
@L3023:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L3018
	st	 r13,r21,4
	align	 4
@L3024:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L3018
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L3018
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L3018
	or	 r18,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L3029:
	ld	 r13,r18,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L3029
	addu	 r25,r25,4
	br	 @L3018
	align	 4
@L3032:
	ld	 r13,r20,4
	br.n	 @L3018
	st	 r13,r21,4
	align	 4
@L3033:
	bsr	 _abort
	align	 4
@L3018:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L3019
	addu	 r21,r21,4
@L3017:
	cmp	 r13,r15,22
	bb0.n	 eq,r13,@L5915
	or	 r2,r0,r22
	or.u	 r12,r0,hi16(_orig_asm_operands_vector)
	ld	 r13,r12,lo16(_orig_asm_operands_vector)
	bcnd	 ne0,r13,@L5915
	ld	 r13,r19,16
	br.n	 @L6137
	st	 r13,r12,lo16(_orig_asm_operands_vector)
	align	 4
@L2933:
	bcnd	 eq0,r18,@L1650
	ld.hu	 r15,r0,r18
	ld.bu	 r23,r18,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L3120)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L3042
	or	 r13,r13,lo16(@L3120)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L3120:
	word	 @L3050
	word	 @L3042
	word	 @L3042
	word	 @L3042
	word	 @L3042
	word	 @L3057
	word	 @L3042
	word	 @L3042
	word	 @L3042
	word	 @L3042
	word	 @L3042
	word	 @L3059
	word	 @L3119
	word	 @L1768
	word	 @L1768
	word	 @L3042
	word	 @L1768
	word	 @L3043
	word	 @L3042
	word	 @L3042
	word	 @L3080
	word	 @L3051
	word	 @L1768
	word	 @L1768
	word	 @L3042
	word	 @L3042
	word	 @L3042
	word	 @L3062
	align	 4
@L3043:
	ld	 r25,r18,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r18
	bb0.n	 (31-30),r13,@L1978
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L3050:
	ld	 r12,r18,16
	br.n	 @L6005
	or.u	 r13,r0,hi16(_label_map)
	align	 4
@L3051:
	bsr.n	 _rtx_alloc
	or	 r2,r0,38
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r18,4
	br.n	 @L6138
	or.u	 r12,r0,hi16(_label_map)
	align	 4
@L3057:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r18,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6019
	br	 @L3042
	align	 4
@L3059:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L3061
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L3042
@L3061:
	ld	 r13,r18,4
	ld.bu	 r24,r18,2
	ld	 r2,r13,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r25,r13,2
	or	 r4,r0,r2
	or	 r2,r0,37
	bsr.n	 _gen_rtx
	or	 r3,r0,r25
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6007
	align	 4
@L3062:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L3066
	ld	 r13,r18,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L3063
	bb0.n	 ne,r12,@L3066
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L3065
	or	 r22,r0,r3
@L3066:
	ld	 r22,r18,8
@L3065:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L3063:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L3072
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L3072
	ld	 r2,r18,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3074
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	ld	 r13,r18,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6533
@L6534:
	align	 4
@L3074:
	ld	 r13,r18,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3076
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r18,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6535
@L6536:
	align	 4
@L3076:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6050:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr	 _memory_address
	br	 @L5998
	align	 4
@L3072:
	ld	 r2,r18,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6133
	align	 4
@L3080:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L3083
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6167
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr	 _copy_rtx_and_substitute
	br	 @L5999
	align	 4
@L3083:
	or	 r2,r0,r23
@L6167:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L3084
	or	 r2,r0,r22
	bsr	 _copy_address
	br	 @L5999
	align	 4
@L3084:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L3085
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L3089
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L3086
	bb0.n	 ne,r11,@L3089
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L3088
@L3089:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L3090
	align	 4
@L3088:
	or	 r22,r0,r12
@L3090:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L3091
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6168
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L3092
	bcnd.n	 ge0,r24,@L3093
	or	 r3,r0,r24
	addu	 r3,r24,3
@L3093:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L3096
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L3097:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L3099
	subu	 r2,r2,1
	addu	 r13,r13,3
@L3099:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L3098
	bsr	 _abort
	align	 4
@L3098:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L3097
	addu	 r3,r3,4
@L3096:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L3101
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L3101:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L3104
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L3105
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L3105:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L3104:
	bsr	 _abort
	align	 4
@L3092:
	or.u	 r13,r0,hi16(_fp_delta)
@L6168:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L3091
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L3091:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6537
@L6538:
	align	 4
@L3086:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L3108
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3109
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6539
@L6540:
	align	 4
@L3109:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3111
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6541
@L6542:
	align	 4
@L3111:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6543
@L6544:
	align	 4
@L3108:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3114
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6545
@L6546:
	align	 4
@L3114:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3116
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6547
@L6548:
	align	 4
@L3116:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6549
@L6550:
	align	 4
@L3085:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6052:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r18
	align	 4
@L3119:
	bsr	 _abort
	align	 4
@L3042:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L5891
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r18
	or	 r21,r0,r22
@L3125:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L3128
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L3141
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L3124
	cmp	 r13,r12,69
	bb0	 ne,r13,@L3130
	br	 @L3139
	align	 4
@L3141:
	bb0	 ne,r13,@L3138
	bb1.n	 gt,r13,@L3142
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L3138
	br	 @L3139
	align	 4
@L3142:
	bb0.n	 ne,r13,@L3129
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L3139
	align	 4
@L3128:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L3124
	st	 r2,r21,4
	align	 4
@L3129:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L3124
	st	 r13,r21,4
	align	 4
@L3130:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L3124
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L3124
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L3124
	or	 r19,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L3135:
	ld	 r13,r19,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L3135
	addu	 r25,r25,4
	br	 @L3124
	align	 4
@L3138:
	ld	 r13,r20,4
	br.n	 @L3124
	st	 r13,r21,4
	align	 4
@L3139:
	bsr	 _abort
	align	 4
@L3124:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L3125
	addu	 r21,r21,4
	br.n	 @L6142
	cmp	 r13,r15,22
	align	 4
@L2932:
	bcnd	 ne0,r10,@L3145
	bcnd	 eq0,r18,@L1650
	ld.hu	 r15,r0,r18
	ld.bu	 r23,r18,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L3226)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L3148
	or	 r13,r13,lo16(@L3226)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L3226:
	word	 @L3156
	word	 @L3148
	word	 @L3148
	word	 @L3148
	word	 @L3148
	word	 @L3163
	word	 @L3148
	word	 @L3148
	word	 @L3148
	word	 @L3148
	word	 @L3148
	word	 @L3165
	word	 @L3225
	word	 @L1768
	word	 @L1768
	word	 @L3148
	word	 @L1768
	word	 @L3149
	word	 @L3148
	word	 @L3148
	word	 @L3186
	word	 @L3157
	word	 @L1768
	word	 @L1768
	word	 @L3148
	word	 @L3148
	word	 @L3148
	word	 @L3168
	align	 4
@L3149:
	ld	 r25,r18,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r18
	bb0.n	 (31-30),r13,@L1978
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L3156:
	ld	 r12,r18,16
	br.n	 @L6005
	or.u	 r13,r0,hi16(_label_map)
	align	 4
@L3157:
	bsr.n	 _rtx_alloc
	or	 r2,r0,38
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r18,4
	br.n	 @L6138
	or.u	 r12,r0,hi16(_label_map)
	align	 4
@L3163:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r18,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6019
	br	 @L3148
	align	 4
@L3165:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L3167
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L3148
@L3167:
	ld	 r13,r18,4
	ld.bu	 r24,r18,2
	ld	 r2,r13,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r25,r13,2
	or	 r4,r0,r2
	or	 r2,r0,37
	bsr.n	 _gen_rtx
	or	 r3,r0,r25
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6007
	align	 4
@L3168:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L3172
	ld	 r13,r18,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L3169
	bb0.n	 ne,r12,@L3172
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L3171
	or	 r22,r0,r3
@L3172:
	ld	 r22,r18,8
@L3171:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L3169:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L3178
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L3178
	ld	 r2,r18,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3180
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	ld	 r13,r18,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6551
@L6552:
	align	 4
@L3180:
	ld	 r13,r18,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3182
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r18,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6553
@L6554:
	align	 4
@L3182:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6053:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr	 _memory_address
	br	 @L5998
	align	 4
@L3178:
	ld	 r2,r18,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6133
	align	 4
@L3186:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L3189
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6169
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr	 _copy_rtx_and_substitute
	br	 @L5999
	align	 4
@L3189:
	or	 r2,r0,r23
@L6169:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L3190
	or	 r2,r0,r22
	bsr	 _copy_address
	br	 @L5999
	align	 4
@L3190:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L3191
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L3195
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L3192
	bb0.n	 ne,r11,@L3195
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L3194
@L3195:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L3196
	align	 4
@L3194:
	or	 r22,r0,r12
@L3196:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L3197
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6170
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L3198
	bcnd.n	 ge0,r24,@L3199
	or	 r3,r0,r24
	addu	 r3,r24,3
@L3199:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L3202
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L3203:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L3205
	subu	 r2,r2,1
	addu	 r13,r13,3
@L3205:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L3204
	bsr	 _abort
	align	 4
@L3204:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L3203
	addu	 r3,r3,4
@L3202:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L3207
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L3207:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L3210
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L3211
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L3211:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L3210:
	bsr	 _abort
	align	 4
@L3198:
	or.u	 r13,r0,hi16(_fp_delta)
@L6170:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L3197
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L3197:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6555
@L6556:
	align	 4
@L3192:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L3214
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3215
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6557
@L6558:
	align	 4
@L3215:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3217
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6559
@L6560:
	align	 4
@L3217:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6561
@L6562:
	align	 4
@L3214:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3220
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6563
@L6564:
	align	 4
@L3220:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3222
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6565
@L6566:
	align	 4
@L3222:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6567
@L6568:
	align	 4
@L3191:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6055:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r18
	align	 4
@L3225:
	bsr	 _abort
	align	 4
@L3148:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L5891
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r18
	or	 r21,r0,r22
@L3231:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L3234
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L3247
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L3230
	cmp	 r13,r12,69
	bb0	 ne,r13,@L3236
	br	 @L3245
	align	 4
@L3247:
	bb0	 ne,r13,@L3244
	bb1.n	 gt,r13,@L3248
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L3244
	br	 @L3245
	align	 4
@L3248:
	bb0.n	 ne,r13,@L3235
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L3245
	align	 4
@L3234:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L3230
	st	 r2,r21,4
	align	 4
@L3235:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L3230
	st	 r13,r21,4
	align	 4
@L3236:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L3230
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L3230
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L3230
	or	 r19,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L3241:
	ld	 r13,r19,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L3241
	addu	 r25,r25,4
	br	 @L3230
	align	 4
@L3244:
	ld	 r13,r20,4
	br.n	 @L3230
	st	 r13,r21,4
	align	 4
@L3245:
	bsr	 _abort
	align	 4
@L3230:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L3231
	addu	 r21,r21,4
	br.n	 @L6142
	cmp	 r13,r15,22
	align	 4
@L3145:
	bcnd.n	 ne0,r8,@L5915
	or	 r2,r0,0
	bcnd	 eq0,r19,@L5915
	ld.hu	 r15,r0,r19
	ld.bu	 r23,r19,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L3332)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L3254
	or	 r13,r13,lo16(@L3332)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L3332:
	word	 @L1664
	word	 @L3254
	word	 @L3254
	word	 @L3254
	word	 @L3254
	word	 @L3269
	word	 @L3254
	word	 @L3254
	word	 @L3254
	word	 @L3254
	word	 @L3254
	word	 @L3271
	word	 @L3331
	word	 @L1662
	word	 @L1662
	word	 @L3254
	word	 @L1662
	word	 @L3255
	word	 @L3254
	word	 @L3254
	word	 @L3292
	word	 @L1665
	word	 @L1662
	word	 @L1662
	word	 @L3254
	word	 @L3254
	word	 @L3254
	word	 @L3274
	align	 4
@L3255:
	ld	 r25,r19,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r19
	bb0.n	 (31-30),r13,@L1871
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L3269:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r19,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6014
	br	 @L3254
	align	 4
@L3271:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L1675
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L3254
	br	 @L1675
	align	 4
@L3274:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L3278
	ld	 r13,r19,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L3275
	bb0.n	 ne,r12,@L3278
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L3277
	or	 r22,r0,r3
@L3278:
	ld	 r22,r19,8
@L3277:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L3275:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	ld	 r2,r19,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3286
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	ld	 r13,r19,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6569
@L6570:
	align	 4
@L3286:
	ld	 r13,r19,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3288
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r19,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6571
@L6572:
	align	 4
@L3288:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r19,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6056:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr	 _memory_address
	br	 @L5998
	align	 4
@L3292:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L3295
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6171
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr	 _copy_rtx_and_substitute
	br	 @L5999
	align	 4
@L3295:
	or	 r2,r0,r23
@L6171:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L3296
	or	 r2,r0,r22
	bsr	 _copy_address
	br	 @L5999
	align	 4
@L3296:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L3297
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L3301
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L3298
	bb0.n	 ne,r11,@L3301
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L3300
@L3301:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L3302
	align	 4
@L3300:
	or	 r22,r0,r12
@L3302:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L3303
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6172
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L3304
	bcnd.n	 ge0,r24,@L3305
	or	 r3,r0,r24
	addu	 r3,r24,3
@L3305:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L3308
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L3309:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L3311
	subu	 r2,r2,1
	addu	 r13,r13,3
@L3311:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L3310
	bsr	 _abort
	align	 4
@L3310:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L3309
	addu	 r3,r3,4
@L3308:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L3313
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L3313:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L3316
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L3317
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L3317:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L3316:
	bsr	 _abort
	align	 4
@L3304:
	or.u	 r13,r0,hi16(_fp_delta)
@L6172:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L3303
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L3303:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6573
@L6574:
	align	 4
@L3298:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L3320
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3321
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6575
@L6576:
	align	 4
@L3321:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3323
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6577
@L6578:
	align	 4
@L3323:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6579
@L6580:
	align	 4
@L3320:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3326
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6581
@L6582:
	align	 4
@L3326:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3328
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6583
@L6584:
	align	 4
@L3328:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6585
@L6586:
	align	 4
@L3297:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6058:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r19
	align	 4
@L3331:
	bsr	 _abort
	align	 4
@L3254:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L3335
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r19
	or	 r21,r0,r22
@L3337:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L3340
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L3353
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L3336
	cmp	 r13,r12,69
	bb0	 ne,r13,@L3342
	br	 @L3351
	align	 4
@L3353:
	bb0	 ne,r13,@L3350
	bb1.n	 gt,r13,@L3354
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L3350
	br	 @L3351
	align	 4
@L3354:
	bb0.n	 ne,r13,@L3341
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L3351
	align	 4
@L3340:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L3336
	st	 r2,r21,4
	align	 4
@L3341:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L3336
	st	 r13,r21,4
	align	 4
@L3342:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L3336
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L3336
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L3336
	or	 r18,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L3347:
	ld	 r13,r18,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L3347
	addu	 r25,r25,4
	br	 @L3336
	align	 4
@L3350:
	ld	 r13,r20,4
	br.n	 @L3336
	st	 r13,r21,4
	align	 4
@L3351:
	bsr	 _abort
	align	 4
@L3336:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L3337
	addu	 r21,r21,4
@L3335:
	cmp	 r13,r15,22
	bb0.n	 eq,r13,@L5915
	or	 r2,r0,r22
	or.u	 r12,r0,hi16(_orig_asm_operands_vector)
	ld	 r13,r12,lo16(_orig_asm_operands_vector)
	bcnd	 ne0,r13,@L5915
	ld	 r13,r19,16
	br.n	 @L6137
	st	 r13,r12,lo16(_orig_asm_operands_vector)
	align	 4
@L3357:
	subu	 r13,r0,r11
	subu	 r12,r0,r9
	mask	 r13,r13,1
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L3358
	cmp	 r13,r10,r8
	bb1	 gt,r13,@L3359
	bcnd	 eq0,r19,@L1650
	ld.hu	 r15,r0,r19
	ld.bu	 r23,r19,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L3440)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L3362
	or	 r13,r13,lo16(@L3440)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L3440:
	word	 @L1664
	word	 @L3362
	word	 @L3362
	word	 @L3362
	word	 @L3362
	word	 @L3377
	word	 @L3362
	word	 @L3362
	word	 @L3362
	word	 @L3362
	word	 @L3362
	word	 @L3379
	word	 @L3439
	word	 @L1662
	word	 @L1662
	word	 @L3362
	word	 @L1662
	word	 @L3363
	word	 @L3362
	word	 @L3362
	word	 @L3400
	word	 @L1665
	word	 @L1662
	word	 @L1662
	word	 @L3362
	word	 @L3362
	word	 @L3362
	word	 @L3382
	align	 4
@L3363:
	ld	 r25,r19,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r19
	bb0.n	 (31-30),r13,@L1871
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L3377:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r19,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6014
	br	 @L3362
	align	 4
@L3379:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L1675
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L3362
	br	 @L1675
	align	 4
@L3382:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L3386
	ld	 r13,r19,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L3383
	bb0.n	 ne,r12,@L3386
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L3385
	or	 r22,r0,r3
@L3386:
	ld	 r22,r19,8
@L3385:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L3383:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	ld	 r2,r19,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3394
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	ld	 r13,r19,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6587
@L6588:
	align	 4
@L3394:
	ld	 r13,r19,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3396
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r19,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6589
@L6590:
	align	 4
@L3396:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r19,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6059:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr	 _memory_address
	br	 @L5998
	align	 4
@L3400:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L3403
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6173
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr	 _copy_rtx_and_substitute
	br	 @L5999
	align	 4
@L3403:
	or	 r2,r0,r23
@L6173:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L3404
	or	 r2,r0,r22
	bsr	 _copy_address
	br	 @L5999
	align	 4
@L3404:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L3405
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L3409
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L3406
	bb0.n	 ne,r11,@L3409
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L3408
@L3409:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L3410
	align	 4
@L3408:
	or	 r22,r0,r12
@L3410:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L3411
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6174
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L3412
	bcnd.n	 ge0,r24,@L3413
	or	 r3,r0,r24
	addu	 r3,r24,3
@L3413:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L3416
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L3417:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L3419
	subu	 r2,r2,1
	addu	 r13,r13,3
@L3419:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L3418
	bsr	 _abort
	align	 4
@L3418:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L3417
	addu	 r3,r3,4
@L3416:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L3421
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L3421:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L3424
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L3425
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L3425:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L3424:
	bsr	 _abort
	align	 4
@L3412:
	or.u	 r13,r0,hi16(_fp_delta)
@L6174:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L3411
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L3411:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6591
@L6592:
	align	 4
@L3406:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L3428
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3429
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6593
@L6594:
	align	 4
@L3429:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3431
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6595
@L6596:
	align	 4
@L3431:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6597
@L6598:
	align	 4
@L3428:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3434
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6599
@L6600:
	align	 4
@L3434:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3436
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6601
@L6602:
	align	 4
@L3436:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6603
@L6604:
	align	 4
@L3405:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6061:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r19
	align	 4
@L3439:
	bsr	 _abort
	align	 4
@L3362:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L3443
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r19
	or	 r21,r0,r22
@L3445:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L3448
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L3461
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L3444
	cmp	 r13,r12,69
	bb0	 ne,r13,@L3450
	br	 @L3459
	align	 4
@L3461:
	bb0	 ne,r13,@L3458
	bb1.n	 gt,r13,@L3462
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L3458
	br	 @L3459
	align	 4
@L3462:
	bb0.n	 ne,r13,@L3449
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L3459
	align	 4
@L3448:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L3444
	st	 r2,r21,4
	align	 4
@L3449:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L3444
	st	 r13,r21,4
	align	 4
@L3450:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L3444
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L3444
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L3444
	or	 r18,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L3455:
	ld	 r13,r18,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L3455
	addu	 r25,r25,4
	br	 @L3444
	align	 4
@L3458:
	ld	 r13,r20,4
	br.n	 @L3444
	st	 r13,r21,4
	align	 4
@L3459:
	bsr	 _abort
	align	 4
@L3444:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L3445
	addu	 r21,r21,4
@L3443:
	cmp	 r13,r15,22
	bb0.n	 eq,r13,@L5915
	or	 r2,r0,r22
	or.u	 r12,r0,hi16(_orig_asm_operands_vector)
	ld	 r13,r12,lo16(_orig_asm_operands_vector)
	bcnd	 ne0,r13,@L5915
	ld	 r13,r19,16
	br.n	 @L6137
	st	 r13,r12,lo16(_orig_asm_operands_vector)
	align	 4
@L3359:
	bcnd	 eq0,r18,@L1650
	ld.hu	 r15,r0,r18
	ld.bu	 r23,r18,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L3546)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L3468
	or	 r13,r13,lo16(@L3546)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L3546:
	word	 @L3476
	word	 @L3468
	word	 @L3468
	word	 @L3468
	word	 @L3468
	word	 @L3483
	word	 @L3468
	word	 @L3468
	word	 @L3468
	word	 @L3468
	word	 @L3468
	word	 @L3485
	word	 @L3545
	word	 @L1768
	word	 @L1768
	word	 @L3468
	word	 @L1768
	word	 @L3469
	word	 @L3468
	word	 @L3468
	word	 @L3506
	word	 @L3477
	word	 @L1768
	word	 @L1768
	word	 @L3468
	word	 @L3468
	word	 @L3468
	word	 @L3488
	align	 4
@L3469:
	ld	 r25,r18,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r18
	bb0.n	 (31-30),r13,@L1978
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L3476:
	ld	 r12,r18,16
	br.n	 @L6005
	or.u	 r13,r0,hi16(_label_map)
	align	 4
@L3477:
	bsr.n	 _rtx_alloc
	or	 r2,r0,38
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r18,4
	br.n	 @L6138
	or.u	 r12,r0,hi16(_label_map)
	align	 4
@L3483:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r18,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6019
	br	 @L3468
	align	 4
@L3485:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L3487
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L3468
@L3487:
	ld	 r13,r18,4
	ld.bu	 r24,r18,2
	ld	 r2,r13,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r25,r13,2
	or	 r4,r0,r2
	or	 r2,r0,37
	bsr.n	 _gen_rtx
	or	 r3,r0,r25
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6007
	align	 4
@L3488:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L3492
	ld	 r13,r18,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L3489
	bb0.n	 ne,r12,@L3492
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L3491
	or	 r22,r0,r3
@L3492:
	ld	 r22,r18,8
@L3491:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L3489:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L3498
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L3498
	ld	 r2,r18,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3500
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	ld	 r13,r18,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6605
@L6606:
	align	 4
@L3500:
	ld	 r13,r18,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3502
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r18,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6607
@L6608:
	align	 4
@L3502:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6062:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr	 _memory_address
	br	 @L5998
	align	 4
@L3498:
	ld	 r2,r18,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6133
	align	 4
@L3506:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L3509
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6175
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr	 _copy_rtx_and_substitute
	br	 @L5999
	align	 4
@L3509:
	or	 r2,r0,r23
@L6175:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L3510
	or	 r2,r0,r22
	bsr	 _copy_address
	br	 @L5999
	align	 4
@L3510:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L3511
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L3515
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L3512
	bb0.n	 ne,r11,@L3515
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L3514
@L3515:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L3516
	align	 4
@L3514:
	or	 r22,r0,r12
@L3516:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L3517
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6176
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L3518
	bcnd.n	 ge0,r24,@L3519
	or	 r3,r0,r24
	addu	 r3,r24,3
@L3519:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L3522
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L3523:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L3525
	subu	 r2,r2,1
	addu	 r13,r13,3
@L3525:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L3524
	bsr	 _abort
	align	 4
@L3524:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L3523
	addu	 r3,r3,4
@L3522:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L3527
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L3527:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L3530
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L3531
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L3531:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L3530:
	bsr	 _abort
	align	 4
@L3518:
	or.u	 r13,r0,hi16(_fp_delta)
@L6176:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L3517
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L3517:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6609
@L6610:
	align	 4
@L3512:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L3534
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3535
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6611
@L6612:
	align	 4
@L3535:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3537
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6613
@L6614:
	align	 4
@L3537:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6615
@L6616:
	align	 4
@L3534:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3540
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6617
@L6618:
	align	 4
@L3540:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3542
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6619
@L6620:
	align	 4
@L3542:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6621
@L6622:
	align	 4
@L3511:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6064:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r18
	align	 4
@L3545:
	bsr	 _abort
	align	 4
@L3468:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L5891
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r18
	or	 r21,r0,r22
@L3551:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L3554
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L3567
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L3550
	cmp	 r13,r12,69
	bb0	 ne,r13,@L3556
	br	 @L3565
	align	 4
@L3567:
	bb0	 ne,r13,@L3564
	bb1.n	 gt,r13,@L3568
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L3564
	br	 @L3565
	align	 4
@L3568:
	bb0.n	 ne,r13,@L3555
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L3565
	align	 4
@L3554:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L3550
	st	 r2,r21,4
	align	 4
@L3555:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L3550
	st	 r13,r21,4
	align	 4
@L3556:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L3550
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L3550
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L3550
	or	 r19,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L3561:
	ld	 r13,r19,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L3561
	addu	 r25,r25,4
	br	 @L3550
	align	 4
@L3564:
	ld	 r13,r20,4
	br.n	 @L3550
	st	 r13,r21,4
	align	 4
@L3565:
	bsr	 _abort
	align	 4
@L3550:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L3551
	addu	 r21,r21,4
	br.n	 @L6142
	cmp	 r13,r15,22
	align	 4
@L3358:
	bcnd	 ne0,r10,@L3571
	bcnd	 eq0,r19,@L1650
	ld.hu	 r15,r0,r19
	ld.bu	 r23,r19,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L3652)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L3574
	or	 r13,r13,lo16(@L3652)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L3652:
	word	 @L1664
	word	 @L3574
	word	 @L3574
	word	 @L3574
	word	 @L3574
	word	 @L3589
	word	 @L3574
	word	 @L3574
	word	 @L3574
	word	 @L3574
	word	 @L3574
	word	 @L3591
	word	 @L3651
	word	 @L1662
	word	 @L1662
	word	 @L3574
	word	 @L1662
	word	 @L3575
	word	 @L3574
	word	 @L3574
	word	 @L3612
	word	 @L1665
	word	 @L1662
	word	 @L1662
	word	 @L3574
	word	 @L3574
	word	 @L3574
	word	 @L3594
	align	 4
@L3575:
	ld	 r25,r19,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r19
	bb0.n	 (31-30),r13,@L1871
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L3589:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r19,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6014
	br	 @L3574
	align	 4
@L3591:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L1675
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L3574
	br	 @L1675
	align	 4
@L3594:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L3598
	ld	 r13,r19,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L3595
	bb0.n	 ne,r12,@L3598
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L3597
	or	 r22,r0,r3
@L3598:
	ld	 r22,r19,8
@L3597:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L3595:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	ld	 r2,r19,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3606
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	ld	 r13,r19,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6623
@L6624:
	align	 4
@L3606:
	ld	 r13,r19,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3608
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r19,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6625
@L6626:
	align	 4
@L3608:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r19,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6065:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr	 _memory_address
	br	 @L5998
	align	 4
@L3612:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L3615
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6177
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr	 _copy_rtx_and_substitute
	br	 @L5999
	align	 4
@L3615:
	or	 r2,r0,r23
@L6177:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L3616
	or	 r2,r0,r22
	bsr	 _copy_address
	br	 @L5999
	align	 4
@L3616:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L3617
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L3621
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L3618
	bb0.n	 ne,r11,@L3621
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L3620
@L3621:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L3622
	align	 4
@L3620:
	or	 r22,r0,r12
@L3622:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L3623
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6178
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L3624
	bcnd.n	 ge0,r24,@L3625
	or	 r3,r0,r24
	addu	 r3,r24,3
@L3625:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L3628
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L3629:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L3631
	subu	 r2,r2,1
	addu	 r13,r13,3
@L3631:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L3630
	bsr	 _abort
	align	 4
@L3630:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L3629
	addu	 r3,r3,4
@L3628:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L3633
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L3633:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L3636
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L3637
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L3637:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L3636:
	bsr	 _abort
	align	 4
@L3624:
	or.u	 r13,r0,hi16(_fp_delta)
@L6178:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L3623
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L3623:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6627
@L6628:
	align	 4
@L3618:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L3640
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3641
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6629
@L6630:
	align	 4
@L3641:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3643
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6631
@L6632:
	align	 4
@L3643:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6633
@L6634:
	align	 4
@L3640:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3646
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6635
@L6636:
	align	 4
@L3646:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3648
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6637
@L6638:
	align	 4
@L3648:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6639
@L6640:
	align	 4
@L3617:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6067:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r19
	align	 4
@L3651:
	bsr	 _abort
	align	 4
@L3574:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L3655
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r19
	or	 r21,r0,r22
@L3657:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L3660
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L3673
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L3656
	cmp	 r13,r12,69
	bb0	 ne,r13,@L3662
	br	 @L3671
	align	 4
@L3673:
	bb0	 ne,r13,@L3670
	bb1.n	 gt,r13,@L3674
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L3670
	br	 @L3671
	align	 4
@L3674:
	bb0.n	 ne,r13,@L3661
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L3671
	align	 4
@L3660:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L3656
	st	 r2,r21,4
	align	 4
@L3661:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L3656
	st	 r13,r21,4
	align	 4
@L3662:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L3656
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L3656
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L3656
	or	 r18,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L3667:
	ld	 r13,r18,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L3667
	addu	 r25,r25,4
	br	 @L3656
	align	 4
@L3670:
	ld	 r13,r20,4
	br.n	 @L3656
	st	 r13,r21,4
	align	 4
@L3671:
	bsr	 _abort
	align	 4
@L3656:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L3657
	addu	 r21,r21,4
@L3655:
	cmp	 r13,r15,22
	bb0.n	 eq,r13,@L5915
	or	 r2,r0,r22
	or.u	 r12,r0,hi16(_orig_asm_operands_vector)
	ld	 r13,r12,lo16(_orig_asm_operands_vector)
	bcnd	 ne0,r13,@L5915
	ld	 r13,r19,16
	br.n	 @L6137
	st	 r13,r12,lo16(_orig_asm_operands_vector)
	align	 4
@L3571:
	bcnd.n	 ne0,r8,@L5915
	or	 r2,r0,0
	bcnd	 eq0,r18,@L5915
	ld.hu	 r15,r0,r18
	ld.bu	 r23,r18,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L3758)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L3680
	or	 r13,r13,lo16(@L3758)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L3758:
	word	 @L3688
	word	 @L3680
	word	 @L3680
	word	 @L3680
	word	 @L3680
	word	 @L3695
	word	 @L3680
	word	 @L3680
	word	 @L3680
	word	 @L3680
	word	 @L3680
	word	 @L3697
	word	 @L3757
	word	 @L1768
	word	 @L1768
	word	 @L3680
	word	 @L1768
	word	 @L3681
	word	 @L3680
	word	 @L3680
	word	 @L3718
	word	 @L3689
	word	 @L1768
	word	 @L1768
	word	 @L3680
	word	 @L3680
	word	 @L3680
	word	 @L3700
	align	 4
@L3681:
	ld	 r25,r18,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r18
	bb0.n	 (31-30),r13,@L1978
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L3688:
	ld	 r12,r18,16
	br.n	 @L6005
	or.u	 r13,r0,hi16(_label_map)
	align	 4
@L3689:
	bsr.n	 _rtx_alloc
	or	 r2,r0,38
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r18,4
	br.n	 @L6138
	or.u	 r12,r0,hi16(_label_map)
	align	 4
@L3695:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r18,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6019
	br	 @L3680
	align	 4
@L3697:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L3699
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L3680
@L3699:
	ld	 r13,r18,4
	ld.bu	 r24,r18,2
	ld	 r2,r13,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r25,r13,2
	or	 r4,r0,r2
	or	 r2,r0,37
	bsr.n	 _gen_rtx
	or	 r3,r0,r25
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6007
	align	 4
@L3700:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L3704
	ld	 r13,r18,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L3701
	bb0.n	 ne,r12,@L3704
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L3703
	or	 r22,r0,r3
@L3704:
	ld	 r22,r18,8
@L3703:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L3701:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L3710
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L3710
	ld	 r2,r18,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3712
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	ld	 r13,r18,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6641
@L6642:
	align	 4
@L3712:
	ld	 r13,r18,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3714
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r18,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6643
@L6644:
	align	 4
@L3714:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6068:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr	 _memory_address
	br	 @L5998
	align	 4
@L3710:
	ld	 r2,r18,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6133
	align	 4
@L3718:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L3721
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6179
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr	 _copy_rtx_and_substitute
	br	 @L5999
	align	 4
@L3721:
	or	 r2,r0,r23
@L6179:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L3722
	or	 r2,r0,r22
	bsr	 _copy_address
	br	 @L5999
	align	 4
@L3722:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L3723
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L3727
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L3724
	bb0.n	 ne,r11,@L3727
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L3726
@L3727:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L3728
	align	 4
@L3726:
	or	 r22,r0,r12
@L3728:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L3729
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6180
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L3730
	bcnd.n	 ge0,r24,@L3731
	or	 r3,r0,r24
	addu	 r3,r24,3
@L3731:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L3734
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L3735:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L3737
	subu	 r2,r2,1
	addu	 r13,r13,3
@L3737:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L3736
	bsr	 _abort
	align	 4
@L3736:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L3735
	addu	 r3,r3,4
@L3734:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L3739
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L3739:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L3742
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L3743
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L3743:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L3742:
	bsr	 _abort
	align	 4
@L3730:
	or.u	 r13,r0,hi16(_fp_delta)
@L6180:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L3729
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L3729:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6645
@L6646:
	align	 4
@L3724:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L3746
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3747
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6647
@L6648:
	align	 4
@L3747:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3749
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6649
@L6650:
	align	 4
@L3749:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6651
@L6652:
	align	 4
@L3746:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3752
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6653
@L6654:
	align	 4
@L3752:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3754
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6655
@L6656:
	align	 4
@L3754:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6657
@L6658:
	align	 4
@L3723:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6070:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r18
	align	 4
@L3757:
	bsr	 _abort
	align	 4
@L3680:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L5891
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r18
	or	 r21,r0,r22
@L3763:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L3766
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L3779
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L3762
	cmp	 r13,r12,69
	bb0	 ne,r13,@L3768
	br	 @L3777
	align	 4
@L3779:
	bb0	 ne,r13,@L3776
	bb1.n	 gt,r13,@L3780
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L3776
	br	 @L3777
	align	 4
@L3780:
	bb0.n	 ne,r13,@L3767
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L3777
	align	 4
@L3766:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L3762
	st	 r2,r21,4
	align	 4
@L3767:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L3762
	st	 r13,r21,4
	align	 4
@L3768:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L3762
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L3762
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L3762
	or	 r19,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L3773:
	ld	 r13,r19,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L3773
	addu	 r25,r25,4
	br	 @L3762
	align	 4
@L3776:
	ld	 r13,r20,4
	br.n	 @L3762
	st	 r13,r21,4
	align	 4
@L3777:
	bsr	 _abort
	align	 4
@L3762:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L3763
	addu	 r21,r21,4
	br.n	 @L6142
	cmp	 r13,r15,22
	align	 4
@L3783:
	subu	 r13,r0,r11
	subu	 r12,r0,r9
	mask	 r13,r13,1
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L3784
	cmp	 r13,r10,r8
	bb1	 ge,r13,@L3785
	bcnd	 eq0,r19,@L1650
	ld.hu	 r15,r0,r19
	ld.bu	 r23,r19,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L3866)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L3788
	or	 r13,r13,lo16(@L3866)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L3866:
	word	 @L1664
	word	 @L3788
	word	 @L3788
	word	 @L3788
	word	 @L3788
	word	 @L3803
	word	 @L3788
	word	 @L3788
	word	 @L3788
	word	 @L3788
	word	 @L3788
	word	 @L3805
	word	 @L3865
	word	 @L1662
	word	 @L1662
	word	 @L3788
	word	 @L1662
	word	 @L3789
	word	 @L3788
	word	 @L3788
	word	 @L3826
	word	 @L1665
	word	 @L1662
	word	 @L1662
	word	 @L3788
	word	 @L3788
	word	 @L3788
	word	 @L3808
	align	 4
@L3789:
	ld	 r25,r19,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r19
	bb0.n	 (31-30),r13,@L1871
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L3803:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r19,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6014
	br	 @L3788
	align	 4
@L3805:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L1675
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L3788
	br	 @L1675
	align	 4
@L3808:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L3812
	ld	 r13,r19,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L3809
	bb0.n	 ne,r12,@L3812
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L3811
	or	 r22,r0,r3
@L3812:
	ld	 r22,r19,8
@L3811:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L3809:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	ld	 r2,r19,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3820
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	ld	 r13,r19,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6659
@L6660:
	align	 4
@L3820:
	ld	 r13,r19,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3822
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r19,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6661
@L6662:
	align	 4
@L3822:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r19,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6071:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr	 _memory_address
	br	 @L5998
	align	 4
@L3826:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L3829
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6181
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr	 _copy_rtx_and_substitute
	br	 @L5999
	align	 4
@L3829:
	or	 r2,r0,r23
@L6181:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L3830
	or	 r2,r0,r22
	bsr	 _copy_address
	br	 @L5999
	align	 4
@L3830:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L3831
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L3835
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L3832
	bb0.n	 ne,r11,@L3835
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L3834
@L3835:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L3836
	align	 4
@L3834:
	or	 r22,r0,r12
@L3836:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L3837
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6182
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L3838
	bcnd.n	 ge0,r24,@L3839
	or	 r3,r0,r24
	addu	 r3,r24,3
@L3839:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L3842
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L3843:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L3845
	subu	 r2,r2,1
	addu	 r13,r13,3
@L3845:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L3844
	bsr	 _abort
	align	 4
@L3844:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L3843
	addu	 r3,r3,4
@L3842:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L3847
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L3847:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L3850
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L3851
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L3851:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L3850:
	bsr	 _abort
	align	 4
@L3838:
	or.u	 r13,r0,hi16(_fp_delta)
@L6182:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L3837
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L3837:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6663
@L6664:
	align	 4
@L3832:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L3854
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3855
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6665
@L6666:
	align	 4
@L3855:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3857
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6667
@L6668:
	align	 4
@L3857:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6669
@L6670:
	align	 4
@L3854:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3860
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6671
@L6672:
	align	 4
@L3860:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3862
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6673
@L6674:
	align	 4
@L3862:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6675
@L6676:
	align	 4
@L3831:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6073:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r19
	align	 4
@L3865:
	bsr	 _abort
	align	 4
@L3788:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L3869
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r19
	or	 r21,r0,r22
@L3871:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L3874
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L3887
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L3870
	cmp	 r13,r12,69
	bb0	 ne,r13,@L3876
	br	 @L3885
	align	 4
@L3887:
	bb0	 ne,r13,@L3884
	bb1.n	 gt,r13,@L3888
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L3884
	br	 @L3885
	align	 4
@L3888:
	bb0.n	 ne,r13,@L3875
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L3885
	align	 4
@L3874:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L3870
	st	 r2,r21,4
	align	 4
@L3875:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L3870
	st	 r13,r21,4
	align	 4
@L3876:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L3870
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L3870
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L3870
	or	 r18,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L3881:
	ld	 r13,r18,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L3881
	addu	 r25,r25,4
	br	 @L3870
	align	 4
@L3884:
	ld	 r13,r20,4
	br.n	 @L3870
	st	 r13,r21,4
	align	 4
@L3885:
	bsr	 _abort
	align	 4
@L3870:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L3871
	addu	 r21,r21,4
@L3869:
	cmp	 r13,r15,22
	bb0.n	 eq,r13,@L5915
	or	 r2,r0,r22
	or.u	 r12,r0,hi16(_orig_asm_operands_vector)
	ld	 r13,r12,lo16(_orig_asm_operands_vector)
	bcnd	 ne0,r13,@L5915
	ld	 r13,r19,16
	br.n	 @L6137
	st	 r13,r12,lo16(_orig_asm_operands_vector)
	align	 4
@L3785:
	bcnd	 eq0,r18,@L1650
	ld.hu	 r15,r0,r18
	ld.bu	 r23,r18,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L3972)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L3894
	or	 r13,r13,lo16(@L3972)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L3972:
	word	 @L3902
	word	 @L3894
	word	 @L3894
	word	 @L3894
	word	 @L3894
	word	 @L3909
	word	 @L3894
	word	 @L3894
	word	 @L3894
	word	 @L3894
	word	 @L3894
	word	 @L3911
	word	 @L3971
	word	 @L1768
	word	 @L1768
	word	 @L3894
	word	 @L1768
	word	 @L3895
	word	 @L3894
	word	 @L3894
	word	 @L3932
	word	 @L3903
	word	 @L1768
	word	 @L1768
	word	 @L3894
	word	 @L3894
	word	 @L3894
	word	 @L3914
	align	 4
@L3895:
	ld	 r25,r18,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r18
	bb0.n	 (31-30),r13,@L1978
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L3902:
	ld	 r12,r18,16
	br.n	 @L6005
	or.u	 r13,r0,hi16(_label_map)
	align	 4
@L3903:
	bsr.n	 _rtx_alloc
	or	 r2,r0,38
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r18,4
	br.n	 @L6138
	or.u	 r12,r0,hi16(_label_map)
	align	 4
@L3909:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r18,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6019
	br	 @L3894
	align	 4
@L3911:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L3913
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L3894
@L3913:
	ld	 r13,r18,4
	ld.bu	 r24,r18,2
	ld	 r2,r13,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r25,r13,2
	or	 r4,r0,r2
	or	 r2,r0,37
	bsr.n	 _gen_rtx
	or	 r3,r0,r25
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6007
	align	 4
@L3914:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L3918
	ld	 r13,r18,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L3915
	bb0.n	 ne,r12,@L3918
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L3917
	or	 r22,r0,r3
@L3918:
	ld	 r22,r18,8
@L3917:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L3915:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L3924
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L3924
	ld	 r2,r18,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3926
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	ld	 r13,r18,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6677
@L6678:
	align	 4
@L3926:
	ld	 r13,r18,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3928
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r18,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6679
@L6680:
	align	 4
@L3928:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6074:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr	 _memory_address
	br	 @L5998
	align	 4
@L3924:
	ld	 r2,r18,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6133
	align	 4
@L3932:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L3935
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6183
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr	 _copy_rtx_and_substitute
	br	 @L5999
	align	 4
@L3935:
	or	 r2,r0,r23
@L6183:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L3936
	or	 r2,r0,r22
	bsr	 _copy_address
	br	 @L5999
	align	 4
@L3936:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L3937
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L3941
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L3938
	bb0.n	 ne,r11,@L3941
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L3940
@L3941:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L3942
	align	 4
@L3940:
	or	 r22,r0,r12
@L3942:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L3943
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6184
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L3944
	bcnd.n	 ge0,r24,@L3945
	or	 r3,r0,r24
	addu	 r3,r24,3
@L3945:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L3948
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L3949:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L3951
	subu	 r2,r2,1
	addu	 r13,r13,3
@L3951:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L3950
	bsr	 _abort
	align	 4
@L3950:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L3949
	addu	 r3,r3,4
@L3948:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L3953
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L3953:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L3956
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L3957
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L3957:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L3956:
	bsr	 _abort
	align	 4
@L3944:
	or.u	 r13,r0,hi16(_fp_delta)
@L6184:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L3943
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L3943:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6681
@L6682:
	align	 4
@L3938:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L3960
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3961
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6683
@L6684:
	align	 4
@L3961:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3963
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6685
@L6686:
	align	 4
@L3963:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6687
@L6688:
	align	 4
@L3960:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3966
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6689
@L6690:
	align	 4
@L3966:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L3968
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6691
@L6692:
	align	 4
@L3968:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6693
@L6694:
	align	 4
@L3937:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6076:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r18
	align	 4
@L3971:
	bsr	 _abort
	align	 4
@L3894:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L5891
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r18
	or	 r21,r0,r22
@L3977:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L3980
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L3993
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L3976
	cmp	 r13,r12,69
	bb0	 ne,r13,@L3982
	br	 @L3991
	align	 4
@L3993:
	bb0	 ne,r13,@L3990
	bb1.n	 gt,r13,@L3994
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L3990
	br	 @L3991
	align	 4
@L3994:
	bb0.n	 ne,r13,@L3981
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L3991
	align	 4
@L3980:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L3976
	st	 r2,r21,4
	align	 4
@L3981:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L3976
	st	 r13,r21,4
	align	 4
@L3982:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L3976
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L3976
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L3976
	or	 r19,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L3987:
	ld	 r13,r19,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L3987
	addu	 r25,r25,4
	br	 @L3976
	align	 4
@L3990:
	ld	 r13,r20,4
	br.n	 @L3976
	st	 r13,r21,4
	align	 4
@L3991:
	bsr	 _abort
	align	 4
@L3976:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L3977
	addu	 r21,r21,4
	br.n	 @L6142
	cmp	 r13,r15,22
	align	 4
@L3784:
	bcnd	 ne0,r10,@L3997
	bcnd	 eq0,r19,@L1650
	ld.hu	 r15,r0,r19
	ld.bu	 r23,r19,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L4078)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L4000
	or	 r13,r13,lo16(@L4078)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L4078:
	word	 @L1664
	word	 @L4000
	word	 @L4000
	word	 @L4000
	word	 @L4000
	word	 @L4015
	word	 @L4000
	word	 @L4000
	word	 @L4000
	word	 @L4000
	word	 @L4000
	word	 @L4017
	word	 @L4077
	word	 @L1662
	word	 @L1662
	word	 @L4000
	word	 @L1662
	word	 @L4001
	word	 @L4000
	word	 @L4000
	word	 @L4038
	word	 @L1665
	word	 @L1662
	word	 @L1662
	word	 @L4000
	word	 @L4000
	word	 @L4000
	word	 @L4020
	align	 4
@L4001:
	ld	 r25,r19,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r19
	bb0.n	 (31-30),r13,@L1871
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L4015:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r19,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6014
	br	 @L4000
	align	 4
@L4017:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L1675
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L4000
	br	 @L1675
	align	 4
@L4020:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L4024
	ld	 r13,r19,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L4021
	bb0.n	 ne,r12,@L4024
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L4023
	or	 r22,r0,r3
@L4024:
	ld	 r22,r19,8
@L4023:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L4021:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	ld	 r2,r19,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4032
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	ld	 r13,r19,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6695
@L6696:
	align	 4
@L4032:
	ld	 r13,r19,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4034
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r19,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6697
@L6698:
	align	 4
@L4034:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r19,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6077:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr	 _memory_address
	br	 @L5998
	align	 4
@L4038:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L4041
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6185
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr	 _copy_rtx_and_substitute
	br	 @L5999
	align	 4
@L4041:
	or	 r2,r0,r23
@L6185:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L4042
	or	 r2,r0,r22
	bsr	 _copy_address
	br	 @L5999
	align	 4
@L4042:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L4043
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L4047
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L4044
	bb0.n	 ne,r11,@L4047
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L4046
@L4047:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L4048
	align	 4
@L4046:
	or	 r22,r0,r12
@L4048:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L4049
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6186
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L4050
	bcnd.n	 ge0,r24,@L4051
	or	 r3,r0,r24
	addu	 r3,r24,3
@L4051:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L4054
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L4055:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L4057
	subu	 r2,r2,1
	addu	 r13,r13,3
@L4057:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L4056
	bsr	 _abort
	align	 4
@L4056:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L4055
	addu	 r3,r3,4
@L4054:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L4059
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L4059:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L4062
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L4063
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L4063:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L4062:
	bsr	 _abort
	align	 4
@L4050:
	or.u	 r13,r0,hi16(_fp_delta)
@L6186:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L4049
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L4049:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6699
@L6700:
	align	 4
@L4044:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L4066
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4067
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6701
@L6702:
	align	 4
@L4067:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4069
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6703
@L6704:
	align	 4
@L4069:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6705
@L6706:
	align	 4
@L4066:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4072
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6707
@L6708:
	align	 4
@L4072:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4074
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6709
@L6710:
	align	 4
@L4074:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6711
@L6712:
	align	 4
@L4043:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6079:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r19
	align	 4
@L4077:
	bsr	 _abort
	align	 4
@L4000:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L4081
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r19
	or	 r21,r0,r22
@L4083:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L4086
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L4099
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L4082
	cmp	 r13,r12,69
	bb0	 ne,r13,@L4088
	br	 @L4097
	align	 4
@L4099:
	bb0	 ne,r13,@L4096
	bb1.n	 gt,r13,@L4100
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L4096
	br	 @L4097
	align	 4
@L4100:
	bb0.n	 ne,r13,@L4087
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L4097
	align	 4
@L4086:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L4082
	st	 r2,r21,4
	align	 4
@L4087:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L4082
	st	 r13,r21,4
	align	 4
@L4088:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L4082
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L4082
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L4082
	or	 r18,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L4093:
	ld	 r13,r18,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L4093
	addu	 r25,r25,4
	br	 @L4082
	align	 4
@L4096:
	ld	 r13,r20,4
	br.n	 @L4082
	st	 r13,r21,4
	align	 4
@L4097:
	bsr	 _abort
	align	 4
@L4082:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L4083
	addu	 r21,r21,4
@L4081:
	cmp	 r13,r15,22
	bb0.n	 eq,r13,@L5915
	or	 r2,r0,r22
	or.u	 r12,r0,hi16(_orig_asm_operands_vector)
	ld	 r13,r12,lo16(_orig_asm_operands_vector)
	bcnd	 ne0,r13,@L5915
	ld	 r13,r19,16
	br.n	 @L6137
	st	 r13,r12,lo16(_orig_asm_operands_vector)
	align	 4
@L3997:
	bcnd.n	 ne0,r8,@L5915
	or	 r2,r0,0
	bcnd	 eq0,r18,@L5915
	ld.hu	 r15,r0,r18
	ld.bu	 r23,r18,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L4184)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L4106
	or	 r13,r13,lo16(@L4184)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L4184:
	word	 @L4114
	word	 @L4106
	word	 @L4106
	word	 @L4106
	word	 @L4106
	word	 @L4121
	word	 @L4106
	word	 @L4106
	word	 @L4106
	word	 @L4106
	word	 @L4106
	word	 @L4123
	word	 @L4183
	word	 @L1768
	word	 @L1768
	word	 @L4106
	word	 @L1768
	word	 @L4107
	word	 @L4106
	word	 @L4106
	word	 @L4144
	word	 @L4115
	word	 @L1768
	word	 @L1768
	word	 @L4106
	word	 @L4106
	word	 @L4106
	word	 @L4126
	align	 4
@L4107:
	ld	 r25,r18,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r18
	bb0.n	 (31-30),r13,@L1978
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L4114:
	ld	 r12,r18,16
	br.n	 @L6005
	or.u	 r13,r0,hi16(_label_map)
	align	 4
@L4115:
	bsr.n	 _rtx_alloc
	or	 r2,r0,38
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r18,4
	br.n	 @L6138
	or.u	 r12,r0,hi16(_label_map)
	align	 4
@L4121:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r18,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6019
	br	 @L4106
	align	 4
@L4123:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L4125
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L4106
@L4125:
	ld	 r13,r18,4
	ld.bu	 r24,r18,2
	ld	 r2,r13,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r25,r13,2
	or	 r4,r0,r2
	or	 r2,r0,37
	bsr.n	 _gen_rtx
	or	 r3,r0,r25
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6007
	align	 4
@L4126:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L4130
	ld	 r13,r18,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L4127
	bb0.n	 ne,r12,@L4130
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L4129
	or	 r22,r0,r3
@L4130:
	ld	 r22,r18,8
@L4129:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L4127:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L4136
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L4136
	ld	 r2,r18,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4138
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	ld	 r13,r18,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6713
@L6714:
	align	 4
@L4138:
	ld	 r13,r18,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4140
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r18,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6715
@L6716:
	align	 4
@L4140:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6080:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr	 _memory_address
	br	 @L5998
	align	 4
@L4136:
	ld	 r2,r18,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6133
	align	 4
@L4144:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L4147
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6187
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr	 _copy_rtx_and_substitute
	br	 @L5999
	align	 4
@L4147:
	or	 r2,r0,r23
@L6187:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L4148
	or	 r2,r0,r22
	bsr	 _copy_address
	br	 @L5999
	align	 4
@L4148:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L4149
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L4153
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L4150
	bb0.n	 ne,r11,@L4153
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L4152
@L4153:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L4154
	align	 4
@L4152:
	or	 r22,r0,r12
@L4154:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L4155
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6188
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L4156
	bcnd.n	 ge0,r24,@L4157
	or	 r3,r0,r24
	addu	 r3,r24,3
@L4157:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L4160
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L4161:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L4163
	subu	 r2,r2,1
	addu	 r13,r13,3
@L4163:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L4162
	bsr	 _abort
	align	 4
@L4162:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L4161
	addu	 r3,r3,4
@L4160:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L4165
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L4165:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L4168
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L4169
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L4169:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L4168:
	bsr	 _abort
	align	 4
@L4156:
	or.u	 r13,r0,hi16(_fp_delta)
@L6188:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L4155
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L4155:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6717
@L6718:
	align	 4
@L4150:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L4172
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4173
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6719
@L6720:
	align	 4
@L4173:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4175
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6721
@L6722:
	align	 4
@L4175:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6723
@L6724:
	align	 4
@L4172:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4178
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6725
@L6726:
	align	 4
@L4178:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4180
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6727
@L6728:
	align	 4
@L4180:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6729
@L6730:
	align	 4
@L4149:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6082:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r18
	align	 4
@L4183:
	bsr	 _abort
	align	 4
@L4106:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L5891
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r18
	or	 r21,r0,r22
@L4189:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L4192
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L4205
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L4188
	cmp	 r13,r12,69
	bb0	 ne,r13,@L4194
	br	 @L4203
	align	 4
@L4205:
	bb0	 ne,r13,@L4202
	bb1.n	 gt,r13,@L4206
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L4202
	br	 @L4203
	align	 4
@L4206:
	bb0.n	 ne,r13,@L4193
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L4203
	align	 4
@L4192:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L4188
	st	 r2,r21,4
	align	 4
@L4193:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L4188
	st	 r13,r21,4
	align	 4
@L4194:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L4188
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L4188
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L4188
	or	 r19,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L4199:
	ld	 r13,r19,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L4199
	addu	 r25,r25,4
	br	 @L4188
	align	 4
@L4202:
	ld	 r13,r20,4
	br.n	 @L4188
	st	 r13,r21,4
	align	 4
@L4203:
	bsr	 _abort
	align	 4
@L4188:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L4189
	addu	 r21,r21,4
	br.n	 @L6142
	cmp	 r13,r15,22
	align	 4
@L4209:
	subu	 r13,r0,r11
	subu	 r12,r0,r9
	mask	 r13,r13,1
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L4210
	cmp	 r13,r10,r8
	bb1	 lo,r13,@L4211
	bcnd	 eq0,r19,@L1650
	ld.hu	 r15,r0,r19
	ld.bu	 r23,r19,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L4292)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L4214
	or	 r13,r13,lo16(@L4292)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L4292:
	word	 @L1664
	word	 @L4214
	word	 @L4214
	word	 @L4214
	word	 @L4214
	word	 @L4229
	word	 @L4214
	word	 @L4214
	word	 @L4214
	word	 @L4214
	word	 @L4214
	word	 @L4231
	word	 @L4291
	word	 @L1662
	word	 @L1662
	word	 @L4214
	word	 @L1662
	word	 @L4215
	word	 @L4214
	word	 @L4214
	word	 @L4252
	word	 @L1665
	word	 @L1662
	word	 @L1662
	word	 @L4214
	word	 @L4214
	word	 @L4214
	word	 @L4234
	align	 4
@L4215:
	ld	 r25,r19,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r19
	bb0.n	 (31-30),r13,@L1871
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L4229:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r19,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6014
	br	 @L4214
	align	 4
@L4231:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L1675
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L4214
	br	 @L1675
	align	 4
@L4234:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L4238
	ld	 r13,r19,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L4235
	bb0.n	 ne,r12,@L4238
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L4237
	or	 r22,r0,r3
@L4238:
	ld	 r22,r19,8
@L4237:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L4235:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	ld	 r2,r19,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4246
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	ld	 r13,r19,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6731
@L6732:
	align	 4
@L4246:
	ld	 r13,r19,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4248
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r19,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6733
@L6734:
	align	 4
@L4248:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r19,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6083:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr	 _memory_address
	br	 @L5998
	align	 4
@L4252:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L4255
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6189
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr	 _copy_rtx_and_substitute
	br	 @L5999
	align	 4
@L4255:
	or	 r2,r0,r23
@L6189:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L4256
	or	 r2,r0,r22
	bsr	 _copy_address
	br	 @L5999
	align	 4
@L4256:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L4257
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L4261
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L4258
	bb0.n	 ne,r11,@L4261
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L4260
@L4261:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L4262
	align	 4
@L4260:
	or	 r22,r0,r12
@L4262:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L4263
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6190
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L4264
	bcnd.n	 ge0,r24,@L4265
	or	 r3,r0,r24
	addu	 r3,r24,3
@L4265:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L4268
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L4269:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L4271
	subu	 r2,r2,1
	addu	 r13,r13,3
@L4271:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L4270
	bsr	 _abort
	align	 4
@L4270:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L4269
	addu	 r3,r3,4
@L4268:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L4273
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L4273:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L4276
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L4277
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L4277:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L4276:
	bsr	 _abort
	align	 4
@L4264:
	or.u	 r13,r0,hi16(_fp_delta)
@L6190:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L4263
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L4263:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6735
@L6736:
	align	 4
@L4258:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L4280
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4281
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6737
@L6738:
	align	 4
@L4281:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4283
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6739
@L6740:
	align	 4
@L4283:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6741
@L6742:
	align	 4
@L4280:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4286
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6743
@L6744:
	align	 4
@L4286:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4288
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6745
@L6746:
	align	 4
@L4288:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6747
@L6748:
	align	 4
@L4257:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6085:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r19
	align	 4
@L4291:
	bsr	 _abort
	align	 4
@L4214:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L4295
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r19
	or	 r21,r0,r22
@L4297:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L4300
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L4313
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L4296
	cmp	 r13,r12,69
	bb0	 ne,r13,@L4302
	br	 @L4311
	align	 4
@L4313:
	bb0	 ne,r13,@L4310
	bb1.n	 gt,r13,@L4314
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L4310
	br	 @L4311
	align	 4
@L4314:
	bb0.n	 ne,r13,@L4301
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L4311
	align	 4
@L4300:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L4296
	st	 r2,r21,4
	align	 4
@L4301:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L4296
	st	 r13,r21,4
	align	 4
@L4302:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L4296
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L4296
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L4296
	or	 r18,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L4307:
	ld	 r13,r18,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L4307
	addu	 r25,r25,4
	br	 @L4296
	align	 4
@L4310:
	ld	 r13,r20,4
	br.n	 @L4296
	st	 r13,r21,4
	align	 4
@L4311:
	bsr	 _abort
	align	 4
@L4296:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L4297
	addu	 r21,r21,4
@L4295:
	cmp	 r13,r15,22
	bb0.n	 eq,r13,@L5915
	or	 r2,r0,r22
	or.u	 r12,r0,hi16(_orig_asm_operands_vector)
	ld	 r13,r12,lo16(_orig_asm_operands_vector)
	bcnd	 ne0,r13,@L5915
	ld	 r13,r19,16
	br.n	 @L6137
	st	 r13,r12,lo16(_orig_asm_operands_vector)
	align	 4
@L4211:
	bcnd	 eq0,r18,@L1650
	ld.hu	 r15,r0,r18
	ld.bu	 r23,r18,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L4398)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L4320
	or	 r13,r13,lo16(@L4398)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L4398:
	word	 @L4328
	word	 @L4320
	word	 @L4320
	word	 @L4320
	word	 @L4320
	word	 @L4335
	word	 @L4320
	word	 @L4320
	word	 @L4320
	word	 @L4320
	word	 @L4320
	word	 @L4337
	word	 @L4397
	word	 @L1768
	word	 @L1768
	word	 @L4320
	word	 @L1768
	word	 @L4321
	word	 @L4320
	word	 @L4320
	word	 @L4358
	word	 @L4329
	word	 @L1768
	word	 @L1768
	word	 @L4320
	word	 @L4320
	word	 @L4320
	word	 @L4340
	align	 4
@L4321:
	ld	 r25,r18,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r18
	bb0.n	 (31-30),r13,@L1978
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L4328:
	ld	 r12,r18,16
	br.n	 @L6005
	or.u	 r13,r0,hi16(_label_map)
	align	 4
@L4329:
	bsr.n	 _rtx_alloc
	or	 r2,r0,38
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r18,4
	br.n	 @L6138
	or.u	 r12,r0,hi16(_label_map)
	align	 4
@L4335:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r18,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6019
	br	 @L4320
	align	 4
@L4337:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L4339
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L4320
@L4339:
	ld	 r13,r18,4
	ld.bu	 r24,r18,2
	ld	 r2,r13,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r25,r13,2
	or	 r4,r0,r2
	or	 r2,r0,37
	bsr.n	 _gen_rtx
	or	 r3,r0,r25
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6007
	align	 4
@L4340:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L4344
	ld	 r13,r18,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L4341
	bb0.n	 ne,r12,@L4344
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L4343
	or	 r22,r0,r3
@L4344:
	ld	 r22,r18,8
@L4343:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L4341:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L4350
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L4350
	ld	 r2,r18,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4352
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	ld	 r13,r18,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6749
@L6750:
	align	 4
@L4352:
	ld	 r13,r18,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4354
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r18,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6751
@L6752:
	align	 4
@L4354:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6086:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr	 _memory_address
	br	 @L5998
	align	 4
@L4350:
	ld	 r2,r18,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6133
	align	 4
@L4358:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L4361
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6191
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr	 _copy_rtx_and_substitute
	br	 @L5999
	align	 4
@L4361:
	or	 r2,r0,r23
@L6191:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L4362
	or	 r2,r0,r22
	bsr	 _copy_address
	br	 @L5999
	align	 4
@L4362:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L4363
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L4367
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L4364
	bb0.n	 ne,r11,@L4367
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L4366
@L4367:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L4368
	align	 4
@L4366:
	or	 r22,r0,r12
@L4368:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L4369
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6192
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L4370
	bcnd.n	 ge0,r24,@L4371
	or	 r3,r0,r24
	addu	 r3,r24,3
@L4371:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L4374
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L4375:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L4377
	subu	 r2,r2,1
	addu	 r13,r13,3
@L4377:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L4376
	bsr	 _abort
	align	 4
@L4376:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L4375
	addu	 r3,r3,4
@L4374:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L4379
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L4379:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L4382
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L4383
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L4383:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L4382:
	bsr	 _abort
	align	 4
@L4370:
	or.u	 r13,r0,hi16(_fp_delta)
@L6192:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L4369
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L4369:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6753
@L6754:
	align	 4
@L4364:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L4386
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4387
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6755
@L6756:
	align	 4
@L4387:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4389
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6757
@L6758:
	align	 4
@L4389:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6759
@L6760:
	align	 4
@L4386:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4392
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6761
@L6762:
	align	 4
@L4392:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4394
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6763
@L6764:
	align	 4
@L4394:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6765
@L6766:
	align	 4
@L4363:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6088:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r18
	align	 4
@L4397:
	bsr	 _abort
	align	 4
@L4320:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L5891
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r18
	or	 r21,r0,r22
@L4403:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L4406
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L4419
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L4402
	cmp	 r13,r12,69
	bb0	 ne,r13,@L4408
	br	 @L4417
	align	 4
@L4419:
	bb0	 ne,r13,@L4416
	bb1.n	 gt,r13,@L4420
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L4416
	br	 @L4417
	align	 4
@L4420:
	bb0.n	 ne,r13,@L4407
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L4417
	align	 4
@L4406:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L4402
	st	 r2,r21,4
	align	 4
@L4407:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L4402
	st	 r13,r21,4
	align	 4
@L4408:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L4402
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L4402
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L4402
	or	 r19,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L4413:
	ld	 r13,r19,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L4413
	addu	 r25,r25,4
	br	 @L4402
	align	 4
@L4416:
	ld	 r13,r20,4
	br.n	 @L4402
	st	 r13,r21,4
	align	 4
@L4417:
	bsr	 _abort
	align	 4
@L4402:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L4403
	addu	 r21,r21,4
	br.n	 @L6142
	cmp	 r13,r15,22
	align	 4
@L4210:
	bcnd	 ne0,r10,@L4423
	bcnd	 eq0,r18,@L1650
	ld.hu	 r15,r0,r18
	ld.bu	 r23,r18,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L4504)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L4426
	or	 r13,r13,lo16(@L4504)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L4504:
	word	 @L4434
	word	 @L4426
	word	 @L4426
	word	 @L4426
	word	 @L4426
	word	 @L4441
	word	 @L4426
	word	 @L4426
	word	 @L4426
	word	 @L4426
	word	 @L4426
	word	 @L4443
	word	 @L4503
	word	 @L1768
	word	 @L1768
	word	 @L4426
	word	 @L1768
	word	 @L4427
	word	 @L4426
	word	 @L4426
	word	 @L4464
	word	 @L4435
	word	 @L1768
	word	 @L1768
	word	 @L4426
	word	 @L4426
	word	 @L4426
	word	 @L4446
	align	 4
@L4427:
	ld	 r25,r18,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r18
	bb0.n	 (31-30),r13,@L1978
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L4434:
	ld	 r12,r18,16
	br.n	 @L6005
	or.u	 r13,r0,hi16(_label_map)
	align	 4
@L4435:
	bsr.n	 _rtx_alloc
	or	 r2,r0,38
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r18,4
	br.n	 @L6138
	or.u	 r12,r0,hi16(_label_map)
	align	 4
@L4441:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r18,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6019
	br	 @L4426
	align	 4
@L4443:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L4445
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L4426
@L4445:
	ld	 r13,r18,4
	ld.bu	 r24,r18,2
	ld	 r2,r13,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r25,r13,2
	or	 r4,r0,r2
	or	 r2,r0,37
	bsr.n	 _gen_rtx
	or	 r3,r0,r25
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6007
	align	 4
@L4446:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L4450
	ld	 r13,r18,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L4447
	bb0.n	 ne,r12,@L4450
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L4449
	or	 r22,r0,r3
@L4450:
	ld	 r22,r18,8
@L4449:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L4447:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L4456
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L4456
	ld	 r2,r18,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4458
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	ld	 r13,r18,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6767
@L6768:
	align	 4
@L4458:
	ld	 r13,r18,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4460
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r18,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6769
@L6770:
	align	 4
@L4460:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6089:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr	 _memory_address
	br	 @L5998
	align	 4
@L4456:
	ld	 r2,r18,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6133
	align	 4
@L4464:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L4467
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6193
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr	 _copy_rtx_and_substitute
	br	 @L5999
	align	 4
@L4467:
	or	 r2,r0,r23
@L6193:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L4468
	or	 r2,r0,r22
	bsr	 _copy_address
	br	 @L5999
	align	 4
@L4468:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L4469
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L4473
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L4470
	bb0.n	 ne,r11,@L4473
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L4472
@L4473:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L4474
	align	 4
@L4472:
	or	 r22,r0,r12
@L4474:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L4475
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6194
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L4476
	bcnd.n	 ge0,r24,@L4477
	or	 r3,r0,r24
	addu	 r3,r24,3
@L4477:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L4480
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L4481:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L4483
	subu	 r2,r2,1
	addu	 r13,r13,3
@L4483:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L4482
	bsr	 _abort
	align	 4
@L4482:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L4481
	addu	 r3,r3,4
@L4480:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L4485
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L4485:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L4488
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L4489
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L4489:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L4488:
	bsr	 _abort
	align	 4
@L4476:
	or.u	 r13,r0,hi16(_fp_delta)
@L6194:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L4475
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L4475:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6771
@L6772:
	align	 4
@L4470:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L4492
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4493
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6773
@L6774:
	align	 4
@L4493:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4495
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6775
@L6776:
	align	 4
@L4495:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6777
@L6778:
	align	 4
@L4492:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4498
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6779
@L6780:
	align	 4
@L4498:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4500
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6781
@L6782:
	align	 4
@L4500:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6783
@L6784:
	align	 4
@L4469:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6091:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r18
	align	 4
@L4503:
	bsr	 _abort
	align	 4
@L4426:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L5891
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r18
	or	 r21,r0,r22
@L4509:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L4512
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L4525
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L4508
	cmp	 r13,r12,69
	bb0	 ne,r13,@L4514
	br	 @L4523
	align	 4
@L4525:
	bb0	 ne,r13,@L4522
	bb1.n	 gt,r13,@L4526
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L4522
	br	 @L4523
	align	 4
@L4526:
	bb0.n	 ne,r13,@L4513
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L4523
	align	 4
@L4512:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L4508
	st	 r2,r21,4
	align	 4
@L4513:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L4508
	st	 r13,r21,4
	align	 4
@L4514:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L4508
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L4508
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L4508
	or	 r19,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L4519:
	ld	 r13,r19,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L4519
	addu	 r25,r25,4
	br	 @L4508
	align	 4
@L4522:
	ld	 r13,r20,4
	br.n	 @L4508
	st	 r13,r21,4
	align	 4
@L4523:
	bsr	 _abort
	align	 4
@L4508:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L4509
	addu	 r21,r21,4
	br.n	 @L6142
	cmp	 r13,r15,22
	align	 4
@L4423:
	bcnd.n	 ne0,r8,@L5915
	or	 r2,r0,0
	bcnd	 eq0,r19,@L5915
	ld.hu	 r15,r0,r19
	ld.bu	 r23,r19,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L4610)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L4532
	or	 r13,r13,lo16(@L4610)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L4610:
	word	 @L1664
	word	 @L4532
	word	 @L4532
	word	 @L4532
	word	 @L4532
	word	 @L4547
	word	 @L4532
	word	 @L4532
	word	 @L4532
	word	 @L4532
	word	 @L4532
	word	 @L4549
	word	 @L4609
	word	 @L1662
	word	 @L1662
	word	 @L4532
	word	 @L1662
	word	 @L4533
	word	 @L4532
	word	 @L4532
	word	 @L4570
	word	 @L1665
	word	 @L1662
	word	 @L1662
	word	 @L4532
	word	 @L4532
	word	 @L4532
	word	 @L4552
	align	 4
@L4533:
	ld	 r25,r19,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r19
	bb0.n	 (31-30),r13,@L1871
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L4547:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r19,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6014
	br	 @L4532
	align	 4
@L4549:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L1675
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L4532
	br	 @L1675
	align	 4
@L4552:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L4556
	ld	 r13,r19,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L4553
	bb0.n	 ne,r12,@L4556
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L4555
	or	 r22,r0,r3
@L4556:
	ld	 r22,r19,8
@L4555:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L4553:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	ld	 r2,r19,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4564
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	ld	 r13,r19,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6785
@L6786:
	align	 4
@L4564:
	ld	 r13,r19,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4566
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r19,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6787
@L6788:
	align	 4
@L4566:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r19,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6092:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr	 _memory_address
	br	 @L5998
	align	 4
@L4570:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L4573
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6195
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr	 _copy_rtx_and_substitute
	br	 @L5999
	align	 4
@L4573:
	or	 r2,r0,r23
@L6195:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L4574
	or	 r2,r0,r22
	bsr	 _copy_address
	br	 @L5999
	align	 4
@L4574:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L4575
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L4579
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L4576
	bb0.n	 ne,r11,@L4579
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L4578
@L4579:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L4580
	align	 4
@L4578:
	or	 r22,r0,r12
@L4580:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L4581
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6196
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L4582
	bcnd.n	 ge0,r24,@L4583
	or	 r3,r0,r24
	addu	 r3,r24,3
@L4583:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L4586
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L4587:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L4589
	subu	 r2,r2,1
	addu	 r13,r13,3
@L4589:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L4588
	bsr	 _abort
	align	 4
@L4588:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L4587
	addu	 r3,r3,4
@L4586:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L4591
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L4591:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L4594
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L4595
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L4595:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L4594:
	bsr	 _abort
	align	 4
@L4582:
	or.u	 r13,r0,hi16(_fp_delta)
@L6196:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L4581
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L4581:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6789
@L6790:
	align	 4
@L4576:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L4598
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4599
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6791
@L6792:
	align	 4
@L4599:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4601
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6793
@L6794:
	align	 4
@L4601:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6795
@L6796:
	align	 4
@L4598:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4604
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6797
@L6798:
	align	 4
@L4604:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4606
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6799
@L6800:
	align	 4
@L4606:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6801
@L6802:
	align	 4
@L4575:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6094:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r19
	align	 4
@L4609:
	bsr	 _abort
	align	 4
@L4532:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L4613
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r19
	or	 r21,r0,r22
@L4615:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L4618
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L4631
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L4614
	cmp	 r13,r12,69
	bb0	 ne,r13,@L4620
	br	 @L4629
	align	 4
@L4631:
	bb0	 ne,r13,@L4628
	bb1.n	 gt,r13,@L4632
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L4628
	br	 @L4629
	align	 4
@L4632:
	bb0.n	 ne,r13,@L4619
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L4629
	align	 4
@L4618:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L4614
	st	 r2,r21,4
	align	 4
@L4619:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L4614
	st	 r13,r21,4
	align	 4
@L4620:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L4614
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L4614
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L4614
	or	 r18,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L4625:
	ld	 r13,r18,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L4625
	addu	 r25,r25,4
	br	 @L4614
	align	 4
@L4628:
	ld	 r13,r20,4
	br.n	 @L4614
	st	 r13,r21,4
	align	 4
@L4629:
	bsr	 _abort
	align	 4
@L4614:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L4615
	addu	 r21,r21,4
@L4613:
	cmp	 r13,r15,22
	bb0.n	 eq,r13,@L5915
	or	 r2,r0,r22
	or.u	 r12,r0,hi16(_orig_asm_operands_vector)
	ld	 r13,r12,lo16(_orig_asm_operands_vector)
	bcnd	 ne0,r13,@L5915
	ld	 r13,r19,16
	br.n	 @L6137
	st	 r13,r12,lo16(_orig_asm_operands_vector)
	align	 4
@L4635:
	subu	 r13,r0,r11
	subu	 r12,r0,r9
	mask	 r13,r13,1
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L4636
	cmp	 r13,r10,r8
	bb1	 ls,r13,@L4637
	bcnd	 eq0,r19,@L1650
	ld.hu	 r15,r0,r19
	ld.bu	 r23,r19,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L4718)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L4640
	or	 r13,r13,lo16(@L4718)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L4718:
	word	 @L1664
	word	 @L4640
	word	 @L4640
	word	 @L4640
	word	 @L4640
	word	 @L4655
	word	 @L4640
	word	 @L4640
	word	 @L4640
	word	 @L4640
	word	 @L4640
	word	 @L4657
	word	 @L4717
	word	 @L1662
	word	 @L1662
	word	 @L4640
	word	 @L1662
	word	 @L4641
	word	 @L4640
	word	 @L4640
	word	 @L4678
	word	 @L1665
	word	 @L1662
	word	 @L1662
	word	 @L4640
	word	 @L4640
	word	 @L4640
	word	 @L4660
	align	 4
@L4641:
	ld	 r25,r19,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r19
	bb0.n	 (31-30),r13,@L1871
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L4655:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r19,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6014
	br	 @L4640
	align	 4
@L4657:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L1675
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L4640
	br	 @L1675
	align	 4
@L4660:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L4664
	ld	 r13,r19,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L4661
	bb0.n	 ne,r12,@L4664
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L4663
	or	 r22,r0,r3
@L4664:
	ld	 r22,r19,8
@L4663:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L4661:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	ld	 r2,r19,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4672
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	ld	 r13,r19,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6803
@L6804:
	align	 4
@L4672:
	ld	 r13,r19,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4674
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r19,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6805
@L6806:
	align	 4
@L4674:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r19,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6095:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr	 _memory_address
	br	 @L5998
	align	 4
@L4678:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L4681
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6197
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr	 _copy_rtx_and_substitute
	br	 @L5999
	align	 4
@L4681:
	or	 r2,r0,r23
@L6197:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L4682
	or	 r2,r0,r22
	bsr	 _copy_address
	br	 @L5999
	align	 4
@L4682:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L4683
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L4687
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L4684
	bb0.n	 ne,r11,@L4687
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L4686
@L4687:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L4688
	align	 4
@L4686:
	or	 r22,r0,r12
@L4688:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L4689
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6198
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L4690
	bcnd.n	 ge0,r24,@L4691
	or	 r3,r0,r24
	addu	 r3,r24,3
@L4691:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L4694
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L4695:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L4697
	subu	 r2,r2,1
	addu	 r13,r13,3
@L4697:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L4696
	bsr	 _abort
	align	 4
@L4696:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L4695
	addu	 r3,r3,4
@L4694:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L4699
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L4699:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L4702
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L4703
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L4703:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L4702:
	bsr	 _abort
	align	 4
@L4690:
	or.u	 r13,r0,hi16(_fp_delta)
@L6198:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L4689
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L4689:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6807
@L6808:
	align	 4
@L4684:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L4706
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4707
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6809
@L6810:
	align	 4
@L4707:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4709
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6811
@L6812:
	align	 4
@L4709:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6813
@L6814:
	align	 4
@L4706:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4712
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6815
@L6816:
	align	 4
@L4712:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4714
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6817
@L6818:
	align	 4
@L4714:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6819
@L6820:
	align	 4
@L4683:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6097:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r19
	align	 4
@L4717:
	bsr	 _abort
	align	 4
@L4640:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L4721
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r19
	or	 r21,r0,r22
@L4723:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L4726
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L4739
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L4722
	cmp	 r13,r12,69
	bb0	 ne,r13,@L4728
	br	 @L4737
	align	 4
@L4739:
	bb0	 ne,r13,@L4736
	bb1.n	 gt,r13,@L4740
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L4736
	br	 @L4737
	align	 4
@L4740:
	bb0.n	 ne,r13,@L4727
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L4737
	align	 4
@L4726:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L4722
	st	 r2,r21,4
	align	 4
@L4727:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L4722
	st	 r13,r21,4
	align	 4
@L4728:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L4722
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L4722
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L4722
	or	 r18,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L4733:
	ld	 r13,r18,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L4733
	addu	 r25,r25,4
	br	 @L4722
	align	 4
@L4736:
	ld	 r13,r20,4
	br.n	 @L4722
	st	 r13,r21,4
	align	 4
@L4737:
	bsr	 _abort
	align	 4
@L4722:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L4723
	addu	 r21,r21,4
@L4721:
	cmp	 r13,r15,22
	bb0.n	 eq,r13,@L5915
	or	 r2,r0,r22
	or.u	 r12,r0,hi16(_orig_asm_operands_vector)
	ld	 r13,r12,lo16(_orig_asm_operands_vector)
	bcnd	 ne0,r13,@L5915
	ld	 r13,r19,16
	br.n	 @L6137
	st	 r13,r12,lo16(_orig_asm_operands_vector)
	align	 4
@L4637:
	bcnd	 eq0,r18,@L1650
	ld.hu	 r15,r0,r18
	ld.bu	 r23,r18,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L4824)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L4746
	or	 r13,r13,lo16(@L4824)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L4824:
	word	 @L4754
	word	 @L4746
	word	 @L4746
	word	 @L4746
	word	 @L4746
	word	 @L4761
	word	 @L4746
	word	 @L4746
	word	 @L4746
	word	 @L4746
	word	 @L4746
	word	 @L4763
	word	 @L4823
	word	 @L1768
	word	 @L1768
	word	 @L4746
	word	 @L1768
	word	 @L4747
	word	 @L4746
	word	 @L4746
	word	 @L4784
	word	 @L4755
	word	 @L1768
	word	 @L1768
	word	 @L4746
	word	 @L4746
	word	 @L4746
	word	 @L4766
	align	 4
@L4747:
	ld	 r25,r18,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r18
	bb0.n	 (31-30),r13,@L1978
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L4754:
	ld	 r12,r18,16
	br.n	 @L6005
	or.u	 r13,r0,hi16(_label_map)
	align	 4
@L4755:
	bsr.n	 _rtx_alloc
	or	 r2,r0,38
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r18,4
	br.n	 @L6138
	or.u	 r12,r0,hi16(_label_map)
	align	 4
@L4761:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r18,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6019
	br	 @L4746
	align	 4
@L4763:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L4765
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L4746
@L4765:
	ld	 r13,r18,4
	ld.bu	 r24,r18,2
	ld	 r2,r13,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r25,r13,2
	or	 r4,r0,r2
	or	 r2,r0,37
	bsr.n	 _gen_rtx
	or	 r3,r0,r25
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6007
	align	 4
@L4766:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L4770
	ld	 r13,r18,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L4767
	bb0.n	 ne,r12,@L4770
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L4769
	or	 r22,r0,r3
@L4770:
	ld	 r22,r18,8
@L4769:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L4767:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L4776
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L4776
	ld	 r2,r18,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4778
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	ld	 r13,r18,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6821
@L6822:
	align	 4
@L4778:
	ld	 r13,r18,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4780
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r18,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6823
@L6824:
	align	 4
@L4780:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6098:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr	 _memory_address
	br	 @L5998
	align	 4
@L4776:
	ld	 r2,r18,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6133
	align	 4
@L4784:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L4787
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6199
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr	 _copy_rtx_and_substitute
	br	 @L5999
	align	 4
@L4787:
	or	 r2,r0,r23
@L6199:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L4788
	or	 r2,r0,r22
	bsr	 _copy_address
	br	 @L5999
	align	 4
@L4788:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L4789
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L4793
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L4790
	bb0.n	 ne,r11,@L4793
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L4792
@L4793:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L4794
	align	 4
@L4792:
	or	 r22,r0,r12
@L4794:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L4795
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6200
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L4796
	bcnd.n	 ge0,r24,@L4797
	or	 r3,r0,r24
	addu	 r3,r24,3
@L4797:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L4800
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L4801:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L4803
	subu	 r2,r2,1
	addu	 r13,r13,3
@L4803:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L4802
	bsr	 _abort
	align	 4
@L4802:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L4801
	addu	 r3,r3,4
@L4800:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L4805
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L4805:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L4808
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L4809
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L4809:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L4808:
	bsr	 _abort
	align	 4
@L4796:
	or.u	 r13,r0,hi16(_fp_delta)
@L6200:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L4795
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L4795:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6825
@L6826:
	align	 4
@L4790:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L4812
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4813
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6827
@L6828:
	align	 4
@L4813:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4815
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6829
@L6830:
	align	 4
@L4815:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6831
@L6832:
	align	 4
@L4812:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4818
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6833
@L6834:
	align	 4
@L4818:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4820
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6835
@L6836:
	align	 4
@L4820:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6837
@L6838:
	align	 4
@L4789:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6100:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r18
	align	 4
@L4823:
	bsr	 _abort
	align	 4
@L4746:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L5891
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r18
	or	 r21,r0,r22
@L4829:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L4832
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L4845
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L4828
	cmp	 r13,r12,69
	bb0	 ne,r13,@L4834
	br	 @L4843
	align	 4
@L4845:
	bb0	 ne,r13,@L4842
	bb1.n	 gt,r13,@L4846
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L4842
	br	 @L4843
	align	 4
@L4846:
	bb0.n	 ne,r13,@L4833
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L4843
	align	 4
@L4832:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L4828
	st	 r2,r21,4
	align	 4
@L4833:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L4828
	st	 r13,r21,4
	align	 4
@L4834:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L4828
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L4828
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L4828
	or	 r19,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L4839:
	ld	 r13,r19,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L4839
	addu	 r25,r25,4
	br	 @L4828
	align	 4
@L4842:
	ld	 r13,r20,4
	br.n	 @L4828
	st	 r13,r21,4
	align	 4
@L4843:
	bsr	 _abort
	align	 4
@L4828:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L4829
	addu	 r21,r21,4
	br.n	 @L6142
	cmp	 r13,r15,22
	align	 4
@L4636:
	bcnd	 ne0,r10,@L4849
	bcnd	 eq0,r18,@L1650
	ld.hu	 r15,r0,r18
	ld.bu	 r23,r18,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L4930)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L4852
	or	 r13,r13,lo16(@L4930)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L4930:
	word	 @L4860
	word	 @L4852
	word	 @L4852
	word	 @L4852
	word	 @L4852
	word	 @L4867
	word	 @L4852
	word	 @L4852
	word	 @L4852
	word	 @L4852
	word	 @L4852
	word	 @L4869
	word	 @L4929
	word	 @L1768
	word	 @L1768
	word	 @L4852
	word	 @L1768
	word	 @L4853
	word	 @L4852
	word	 @L4852
	word	 @L4890
	word	 @L4861
	word	 @L1768
	word	 @L1768
	word	 @L4852
	word	 @L4852
	word	 @L4852
	word	 @L4872
	align	 4
@L4853:
	ld	 r25,r18,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r18
	bb0.n	 (31-30),r13,@L1978
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L4860:
	ld	 r12,r18,16
	br.n	 @L6005
	or.u	 r13,r0,hi16(_label_map)
	align	 4
@L4861:
	bsr.n	 _rtx_alloc
	or	 r2,r0,38
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r18,4
	br.n	 @L6138
	or.u	 r12,r0,hi16(_label_map)
	align	 4
@L4867:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r18,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6019
	br	 @L4852
	align	 4
@L4869:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L4871
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L4852
@L4871:
	ld	 r13,r18,4
	ld.bu	 r24,r18,2
	ld	 r2,r13,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r25,r13,2
	or	 r4,r0,r2
	or	 r2,r0,37
	bsr.n	 _gen_rtx
	or	 r3,r0,r25
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6007
	align	 4
@L4872:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L4876
	ld	 r13,r18,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L4873
	bb0.n	 ne,r12,@L4876
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L4875
	or	 r22,r0,r3
@L4876:
	ld	 r22,r18,8
@L4875:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L4873:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L4882
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L4882
	ld	 r2,r18,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4884
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	ld	 r13,r18,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6839
@L6840:
	align	 4
@L4884:
	ld	 r13,r18,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4886
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r18,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6841
@L6842:
	align	 4
@L4886:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6101:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr	 _memory_address
	br	 @L5998
	align	 4
@L4882:
	ld	 r2,r18,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6133
	align	 4
@L4890:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L4893
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6201
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr	 _copy_rtx_and_substitute
	br	 @L5999
	align	 4
@L4893:
	or	 r2,r0,r23
@L6201:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L4894
	or	 r2,r0,r22
	bsr	 _copy_address
	br	 @L5999
	align	 4
@L4894:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L4895
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L4899
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L4896
	bb0.n	 ne,r11,@L4899
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L4898
@L4899:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L4900
	align	 4
@L4898:
	or	 r22,r0,r12
@L4900:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L4901
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6202
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L4902
	bcnd.n	 ge0,r24,@L4903
	or	 r3,r0,r24
	addu	 r3,r24,3
@L4903:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L4906
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L4907:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L4909
	subu	 r2,r2,1
	addu	 r13,r13,3
@L4909:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L4908
	bsr	 _abort
	align	 4
@L4908:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L4907
	addu	 r3,r3,4
@L4906:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L4911
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L4911:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L4914
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L4915
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L4915:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L4914:
	bsr	 _abort
	align	 4
@L4902:
	or.u	 r13,r0,hi16(_fp_delta)
@L6202:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L4901
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L4901:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6843
@L6844:
	align	 4
@L4896:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L4918
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4919
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6845
@L6846:
	align	 4
@L4919:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4921
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6847
@L6848:
	align	 4
@L4921:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6849
@L6850:
	align	 4
@L4918:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4924
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6851
@L6852:
	align	 4
@L4924:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4926
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6853
@L6854:
	align	 4
@L4926:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6855
@L6856:
	align	 4
@L4895:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6103:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r18
	align	 4
@L4929:
	bsr	 _abort
	align	 4
@L4852:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L5891
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r18
	or	 r21,r0,r22
@L4935:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L4938
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L4951
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L4934
	cmp	 r13,r12,69
	bb0	 ne,r13,@L4940
	br	 @L4949
	align	 4
@L4951:
	bb0	 ne,r13,@L4948
	bb1.n	 gt,r13,@L4952
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L4948
	br	 @L4949
	align	 4
@L4952:
	bb0.n	 ne,r13,@L4939
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L4949
	align	 4
@L4938:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L4934
	st	 r2,r21,4
	align	 4
@L4939:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L4934
	st	 r13,r21,4
	align	 4
@L4940:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L4934
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L4934
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L4934
	or	 r19,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L4945:
	ld	 r13,r19,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L4945
	addu	 r25,r25,4
	br	 @L4934
	align	 4
@L4948:
	ld	 r13,r20,4
	br.n	 @L4934
	st	 r13,r21,4
	align	 4
@L4949:
	bsr	 _abort
	align	 4
@L4934:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L4935
	addu	 r21,r21,4
	br.n	 @L6142
	cmp	 r13,r15,22
	align	 4
@L4849:
	bcnd.n	 ne0,r8,@L5915
	or	 r2,r0,0
	bcnd	 eq0,r19,@L5915
	ld.hu	 r15,r0,r19
	ld.bu	 r23,r19,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L5036)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L4958
	or	 r13,r13,lo16(@L5036)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L5036:
	word	 @L1664
	word	 @L4958
	word	 @L4958
	word	 @L4958
	word	 @L4958
	word	 @L4973
	word	 @L4958
	word	 @L4958
	word	 @L4958
	word	 @L4958
	word	 @L4958
	word	 @L4975
	word	 @L5035
	word	 @L1662
	word	 @L1662
	word	 @L4958
	word	 @L1662
	word	 @L4959
	word	 @L4958
	word	 @L4958
	word	 @L4996
	word	 @L1665
	word	 @L1662
	word	 @L1662
	word	 @L4958
	word	 @L4958
	word	 @L4958
	word	 @L4978
	align	 4
@L4959:
	ld	 r25,r19,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r19
	bb0.n	 (31-30),r13,@L1871
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L4973:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r19,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6014
	br	 @L4958
	align	 4
@L4975:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L1675
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L4958
	br	 @L1675
	align	 4
@L4978:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L4982
	ld	 r13,r19,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L4979
	bb0.n	 ne,r12,@L4982
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L4981
	or	 r22,r0,r3
@L4982:
	ld	 r22,r19,8
@L4981:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L4979:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	ld	 r2,r19,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4990
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	ld	 r13,r19,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6857
@L6858:
	align	 4
@L4990:
	ld	 r13,r19,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L4992
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r19,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6859
@L6860:
	align	 4
@L4992:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r19,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6104:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr	 _memory_address
	br	 @L5998
	align	 4
@L4996:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L4999
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6203
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr	 _copy_rtx_and_substitute
	br	 @L5999
	align	 4
@L4999:
	or	 r2,r0,r23
@L6203:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L5000
	or	 r2,r0,r22
	bsr	 _copy_address
	br	 @L5999
	align	 4
@L5000:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L5001
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L5005
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L5002
	bb0.n	 ne,r11,@L5005
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L5004
@L5005:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L5006
	align	 4
@L5004:
	or	 r22,r0,r12
@L5006:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L5007
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6204
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L5008
	bcnd.n	 ge0,r24,@L5009
	or	 r3,r0,r24
	addu	 r3,r24,3
@L5009:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L5012
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L5013:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L5015
	subu	 r2,r2,1
	addu	 r13,r13,3
@L5015:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L5014
	bsr	 _abort
	align	 4
@L5014:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L5013
	addu	 r3,r3,4
@L5012:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L5017
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L5017:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L5020
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L5021
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L5021:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L5020:
	bsr	 _abort
	align	 4
@L5008:
	or.u	 r13,r0,hi16(_fp_delta)
@L6204:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L5007
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L5007:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6861
@L6862:
	align	 4
@L5002:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L5024
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5025
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6863
@L6864:
	align	 4
@L5025:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5027
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6865
@L6866:
	align	 4
@L5027:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6867
@L6868:
	align	 4
@L5024:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5030
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6869
@L6870:
	align	 4
@L5030:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5032
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6871
@L6872:
	align	 4
@L5032:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6873
@L6874:
	align	 4
@L5001:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6106:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r19
	align	 4
@L5035:
	bsr	 _abort
	align	 4
@L4958:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L5039
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r19
	or	 r21,r0,r22
@L5041:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L5044
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L5057
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L5040
	cmp	 r13,r12,69
	bb0	 ne,r13,@L5046
	br	 @L5055
	align	 4
@L5057:
	bb0	 ne,r13,@L5054
	bb1.n	 gt,r13,@L5058
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L5054
	br	 @L5055
	align	 4
@L5058:
	bb0.n	 ne,r13,@L5045
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L5055
	align	 4
@L5044:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L5040
	st	 r2,r21,4
	align	 4
@L5045:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L5040
	st	 r13,r21,4
	align	 4
@L5046:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L5040
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L5040
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L5040
	or	 r18,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L5051:
	ld	 r13,r18,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L5051
	addu	 r25,r25,4
	br	 @L5040
	align	 4
@L5054:
	ld	 r13,r20,4
	br.n	 @L5040
	st	 r13,r21,4
	align	 4
@L5055:
	bsr	 _abort
	align	 4
@L5040:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L5041
	addu	 r21,r21,4
@L5039:
	cmp	 r13,r15,22
	bb0.n	 eq,r13,@L5915
	or	 r2,r0,r22
	or.u	 r12,r0,hi16(_orig_asm_operands_vector)
	ld	 r13,r12,lo16(_orig_asm_operands_vector)
	bcnd	 ne0,r13,@L5915
	ld	 r13,r19,16
	br.n	 @L6137
	st	 r13,r12,lo16(_orig_asm_operands_vector)
	align	 4
@L5061:
	subu	 r13,r0,r11
	subu	 r12,r0,r9
	mask	 r13,r13,1
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L5062
	cmp	 r13,r10,r8
	bb0	 ls,r13,@L5063
	bcnd	 eq0,r19,@L1650
	ld.hu	 r15,r0,r19
	ld.bu	 r23,r19,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L5144)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L5066
	or	 r13,r13,lo16(@L5144)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L5144:
	word	 @L1664
	word	 @L5066
	word	 @L5066
	word	 @L5066
	word	 @L5066
	word	 @L5081
	word	 @L5066
	word	 @L5066
	word	 @L5066
	word	 @L5066
	word	 @L5066
	word	 @L5083
	word	 @L5143
	word	 @L1662
	word	 @L1662
	word	 @L5066
	word	 @L1662
	word	 @L5067
	word	 @L5066
	word	 @L5066
	word	 @L5104
	word	 @L1665
	word	 @L1662
	word	 @L1662
	word	 @L5066
	word	 @L5066
	word	 @L5066
	word	 @L5086
	align	 4
@L5067:
	ld	 r25,r19,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r19
	bb0.n	 (31-30),r13,@L1871
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L5081:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r19,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6014
	br	 @L5066
	align	 4
@L5083:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L1675
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L5066
	br	 @L1675
	align	 4
@L5086:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L5090
	ld	 r13,r19,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L5087
	bb0.n	 ne,r12,@L5090
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L5089
	or	 r22,r0,r3
@L5090:
	ld	 r22,r19,8
@L5089:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L5087:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	ld	 r2,r19,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5098
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	ld	 r13,r19,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6875
@L6876:
	align	 4
@L5098:
	ld	 r13,r19,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5100
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r19,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6877
@L6878:
	align	 4
@L5100:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r19,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6107:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr	 _memory_address
	br	 @L5998
	align	 4
@L5104:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L5107
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6205
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr	 _copy_rtx_and_substitute
	br	 @L5999
	align	 4
@L5107:
	or	 r2,r0,r23
@L6205:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L5108
	or	 r2,r0,r22
	bsr	 _copy_address
	br	 @L5999
	align	 4
@L5108:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L5109
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L5113
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L5110
	bb0.n	 ne,r11,@L5113
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L5112
@L5113:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L5114
	align	 4
@L5112:
	or	 r22,r0,r12
@L5114:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L5115
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6206
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L5116
	bcnd.n	 ge0,r24,@L5117
	or	 r3,r0,r24
	addu	 r3,r24,3
@L5117:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L5120
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L5121:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L5123
	subu	 r2,r2,1
	addu	 r13,r13,3
@L5123:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L5122
	bsr	 _abort
	align	 4
@L5122:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L5121
	addu	 r3,r3,4
@L5120:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L5125
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L5125:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L5128
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L5129
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L5129:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L5128:
	bsr	 _abort
	align	 4
@L5116:
	or.u	 r13,r0,hi16(_fp_delta)
@L6206:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L5115
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L5115:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6879
@L6880:
	align	 4
@L5110:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L5132
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5133
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6881
@L6882:
	align	 4
@L5133:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5135
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6883
@L6884:
	align	 4
@L5135:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6885
@L6886:
	align	 4
@L5132:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5138
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6887
@L6888:
	align	 4
@L5138:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5140
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6889
@L6890:
	align	 4
@L5140:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6891
@L6892:
	align	 4
@L5109:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6109:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r19
	align	 4
@L5143:
	bsr	 _abort
	align	 4
@L5066:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L5147
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r19
	or	 r21,r0,r22
@L5149:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L5152
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L5165
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L5148
	cmp	 r13,r12,69
	bb0	 ne,r13,@L5154
	br	 @L5163
	align	 4
@L5165:
	bb0	 ne,r13,@L5162
	bb1.n	 gt,r13,@L5166
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L5162
	br	 @L5163
	align	 4
@L5166:
	bb0.n	 ne,r13,@L5153
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L5163
	align	 4
@L5152:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L5148
	st	 r2,r21,4
	align	 4
@L5153:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L5148
	st	 r13,r21,4
	align	 4
@L5154:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L5148
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L5148
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L5148
	or	 r18,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L5159:
	ld	 r13,r18,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L5159
	addu	 r25,r25,4
	br	 @L5148
	align	 4
@L5162:
	ld	 r13,r20,4
	br.n	 @L5148
	st	 r13,r21,4
	align	 4
@L5163:
	bsr	 _abort
	align	 4
@L5148:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L5149
	addu	 r21,r21,4
@L5147:
	cmp	 r13,r15,22
	bb0.n	 eq,r13,@L5915
	or	 r2,r0,r22
	or.u	 r12,r0,hi16(_orig_asm_operands_vector)
	ld	 r13,r12,lo16(_orig_asm_operands_vector)
	bcnd	 ne0,r13,@L5915
	ld	 r13,r19,16
	br.n	 @L6137
	st	 r13,r12,lo16(_orig_asm_operands_vector)
	align	 4
@L5063:
	bcnd	 eq0,r18,@L1650
	ld.hu	 r15,r0,r18
	ld.bu	 r23,r18,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L5250)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L5172
	or	 r13,r13,lo16(@L5250)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L5250:
	word	 @L5180
	word	 @L5172
	word	 @L5172
	word	 @L5172
	word	 @L5172
	word	 @L5187
	word	 @L5172
	word	 @L5172
	word	 @L5172
	word	 @L5172
	word	 @L5172
	word	 @L5189
	word	 @L5249
	word	 @L1768
	word	 @L1768
	word	 @L5172
	word	 @L1768
	word	 @L5173
	word	 @L5172
	word	 @L5172
	word	 @L5210
	word	 @L5181
	word	 @L1768
	word	 @L1768
	word	 @L5172
	word	 @L5172
	word	 @L5172
	word	 @L5192
	align	 4
@L5173:
	ld	 r25,r18,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r18
	bb0.n	 (31-30),r13,@L1978
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L5180:
	ld	 r12,r18,16
	br.n	 @L6005
	or.u	 r13,r0,hi16(_label_map)
	align	 4
@L5181:
	bsr.n	 _rtx_alloc
	or	 r2,r0,38
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r18,4
	br.n	 @L6138
	or.u	 r12,r0,hi16(_label_map)
	align	 4
@L5187:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r18,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6019
	br	 @L5172
	align	 4
@L5189:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L5191
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L5172
@L5191:
	ld	 r13,r18,4
	ld.bu	 r24,r18,2
	ld	 r2,r13,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r25,r13,2
	or	 r4,r0,r2
	or	 r2,r0,37
	bsr.n	 _gen_rtx
	or	 r3,r0,r25
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6007
	align	 4
@L5192:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L5196
	ld	 r13,r18,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L5193
	bb0.n	 ne,r12,@L5196
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L5195
	or	 r22,r0,r3
@L5196:
	ld	 r22,r18,8
@L5195:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L5193:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L5202
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L5202
	ld	 r2,r18,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5204
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	ld	 r13,r18,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6893
@L6894:
	align	 4
@L5204:
	ld	 r13,r18,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5206
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r18,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6895
@L6896:
	align	 4
@L5206:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6110:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr	 _memory_address
	br	 @L5998
	align	 4
@L5202:
	ld	 r2,r18,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6133
	align	 4
@L5210:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L5213
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6207
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr	 _copy_rtx_and_substitute
	br	 @L5999
	align	 4
@L5213:
	or	 r2,r0,r23
@L6207:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L5214
	or	 r2,r0,r22
	bsr	 _copy_address
	br	 @L5999
	align	 4
@L5214:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L5215
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L5219
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L5216
	bb0.n	 ne,r11,@L5219
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L5218
@L5219:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L5220
	align	 4
@L5218:
	or	 r22,r0,r12
@L5220:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L5221
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6208
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L5222
	bcnd.n	 ge0,r24,@L5223
	or	 r3,r0,r24
	addu	 r3,r24,3
@L5223:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L5226
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L5227:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L5229
	subu	 r2,r2,1
	addu	 r13,r13,3
@L5229:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L5228
	bsr	 _abort
	align	 4
@L5228:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L5227
	addu	 r3,r3,4
@L5226:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L5231
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L5231:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L5234
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L5235
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L5235:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L5234:
	bsr	 _abort
	align	 4
@L5222:
	or.u	 r13,r0,hi16(_fp_delta)
@L6208:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L5221
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L5221:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6897
@L6898:
	align	 4
@L5216:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L5238
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5239
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6899
@L6900:
	align	 4
@L5239:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5241
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6901
@L6902:
	align	 4
@L5241:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6903
@L6904:
	align	 4
@L5238:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5244
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6905
@L6906:
	align	 4
@L5244:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5246
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6907
@L6908:
	align	 4
@L5246:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6909
@L6910:
	align	 4
@L5215:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6112:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r18
	align	 4
@L5249:
	bsr	 _abort
	align	 4
@L5172:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L5891
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r18
	or	 r21,r0,r22
@L5255:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L5258
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L5271
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L5254
	cmp	 r13,r12,69
	bb0	 ne,r13,@L5260
	br	 @L5269
	align	 4
@L5271:
	bb0	 ne,r13,@L5268
	bb1.n	 gt,r13,@L5272
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L5268
	br	 @L5269
	align	 4
@L5272:
	bb0.n	 ne,r13,@L5259
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L5269
	align	 4
@L5258:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L5254
	st	 r2,r21,4
	align	 4
@L5259:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L5254
	st	 r13,r21,4
	align	 4
@L5260:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L5254
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L5254
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L5254
	or	 r19,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L5265:
	ld	 r13,r19,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L5265
	addu	 r25,r25,4
	br	 @L5254
	align	 4
@L5268:
	ld	 r13,r20,4
	br.n	 @L5254
	st	 r13,r21,4
	align	 4
@L5269:
	bsr	 _abort
	align	 4
@L5254:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L5255
	addu	 r21,r21,4
	br.n	 @L6142
	cmp	 r13,r15,22
	align	 4
@L5062:
	bcnd	 ne0,r10,@L5275
	bcnd	 eq0,r19,@L1650
	ld.hu	 r15,r0,r19
	ld.bu	 r23,r19,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L5356)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L5278
	or	 r13,r13,lo16(@L5356)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L5356:
	word	 @L1664
	word	 @L5278
	word	 @L5278
	word	 @L5278
	word	 @L5278
	word	 @L5293
	word	 @L5278
	word	 @L5278
	word	 @L5278
	word	 @L5278
	word	 @L5278
	word	 @L5295
	word	 @L5355
	word	 @L1662
	word	 @L1662
	word	 @L5278
	word	 @L1662
	word	 @L5279
	word	 @L5278
	word	 @L5278
	word	 @L5316
	word	 @L1665
	word	 @L1662
	word	 @L1662
	word	 @L5278
	word	 @L5278
	word	 @L5278
	word	 @L5298
	align	 4
@L5279:
	ld	 r25,r19,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r19
	bb0.n	 (31-30),r13,@L1871
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L5293:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r19,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6014
	br	 @L5278
	align	 4
@L5295:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L1675
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L5278
	br	 @L1675
	align	 4
@L5298:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L5302
	ld	 r13,r19,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L5299
	bb0.n	 ne,r12,@L5302
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L5301
	or	 r22,r0,r3
@L5302:
	ld	 r22,r19,8
@L5301:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L5299:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	ld	 r2,r19,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5310
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	ld	 r13,r19,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6911
@L6912:
	align	 4
@L5310:
	ld	 r13,r19,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5312
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r19,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6913
@L6914:
	align	 4
@L5312:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r19,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6113:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr	 _memory_address
	br	 @L5998
	align	 4
@L5316:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L5319
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6209
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr	 _copy_rtx_and_substitute
	br	 @L5999
	align	 4
@L5319:
	or	 r2,r0,r23
@L6209:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L5320
	or	 r2,r0,r22
	bsr	 _copy_address
	br	 @L5999
	align	 4
@L5320:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L5321
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L5325
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L5322
	bb0.n	 ne,r11,@L5325
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L5324
@L5325:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L5326
	align	 4
@L5324:
	or	 r22,r0,r12
@L5326:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L5327
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6210
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L5328
	bcnd.n	 ge0,r24,@L5329
	or	 r3,r0,r24
	addu	 r3,r24,3
@L5329:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L5332
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L5333:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L5335
	subu	 r2,r2,1
	addu	 r13,r13,3
@L5335:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L5334
	bsr	 _abort
	align	 4
@L5334:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L5333
	addu	 r3,r3,4
@L5332:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L5337
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L5337:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L5340
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L5341
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L5341:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L5340:
	bsr	 _abort
	align	 4
@L5328:
	or.u	 r13,r0,hi16(_fp_delta)
@L6210:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L5327
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L5327:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6915
@L6916:
	align	 4
@L5322:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L5344
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5345
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6917
@L6918:
	align	 4
@L5345:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5347
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6919
@L6920:
	align	 4
@L5347:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6921
@L6922:
	align	 4
@L5344:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5350
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6923
@L6924:
	align	 4
@L5350:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5352
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6925
@L6926:
	align	 4
@L5352:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6927
@L6928:
	align	 4
@L5321:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6115:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r19
	align	 4
@L5355:
	bsr	 _abort
	align	 4
@L5278:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L5359
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r19
	or	 r21,r0,r22
@L5361:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L5364
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L5377
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L5360
	cmp	 r13,r12,69
	bb0	 ne,r13,@L5366
	br	 @L5375
	align	 4
@L5377:
	bb0	 ne,r13,@L5374
	bb1.n	 gt,r13,@L5378
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L5374
	br	 @L5375
	align	 4
@L5378:
	bb0.n	 ne,r13,@L5365
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L5375
	align	 4
@L5364:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L5360
	st	 r2,r21,4
	align	 4
@L5365:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L5360
	st	 r13,r21,4
	align	 4
@L5366:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L5360
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L5360
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L5360
	or	 r18,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L5371:
	ld	 r13,r18,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L5371
	addu	 r25,r25,4
	br	 @L5360
	align	 4
@L5374:
	ld	 r13,r20,4
	br.n	 @L5360
	st	 r13,r21,4
	align	 4
@L5375:
	bsr	 _abort
	align	 4
@L5360:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L5361
	addu	 r21,r21,4
@L5359:
	cmp	 r13,r15,22
	bb0.n	 eq,r13,@L5915
	or	 r2,r0,r22
	or.u	 r12,r0,hi16(_orig_asm_operands_vector)
	ld	 r13,r12,lo16(_orig_asm_operands_vector)
	bcnd	 ne0,r13,@L5915
	ld	 r13,r19,16
	br.n	 @L6137
	st	 r13,r12,lo16(_orig_asm_operands_vector)
	align	 4
@L5275:
	bcnd.n	 ne0,r8,@L5915
	or	 r2,r0,0
	bcnd	 eq0,r18,@L5915
	ld.hu	 r15,r0,r18
	ld.bu	 r23,r18,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L5462)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L5384
	or	 r13,r13,lo16(@L5462)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L5462:
	word	 @L5392
	word	 @L5384
	word	 @L5384
	word	 @L5384
	word	 @L5384
	word	 @L5399
	word	 @L5384
	word	 @L5384
	word	 @L5384
	word	 @L5384
	word	 @L5384
	word	 @L5401
	word	 @L5461
	word	 @L1768
	word	 @L1768
	word	 @L5384
	word	 @L1768
	word	 @L5385
	word	 @L5384
	word	 @L5384
	word	 @L5422
	word	 @L5393
	word	 @L1768
	word	 @L1768
	word	 @L5384
	word	 @L5384
	word	 @L5384
	word	 @L5404
	align	 4
@L5385:
	ld	 r25,r18,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r18
	bb0.n	 (31-30),r13,@L1978
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L5392:
	ld	 r12,r18,16
	br.n	 @L6005
	or.u	 r13,r0,hi16(_label_map)
	align	 4
@L5393:
	bsr.n	 _rtx_alloc
	or	 r2,r0,38
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r18,4
	br.n	 @L6138
	or.u	 r12,r0,hi16(_label_map)
	align	 4
@L5399:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r18,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6019
	br	 @L5384
	align	 4
@L5401:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L5403
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L5384
@L5403:
	ld	 r13,r18,4
	ld.bu	 r24,r18,2
	ld	 r2,r13,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r25,r13,2
	or	 r4,r0,r2
	or	 r2,r0,37
	bsr.n	 _gen_rtx
	or	 r3,r0,r25
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6007
	align	 4
@L5404:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L5408
	ld	 r13,r18,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L5405
	bb0.n	 ne,r12,@L5408
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L5407
	or	 r22,r0,r3
@L5408:
	ld	 r22,r18,8
@L5407:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L5405:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L5414
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L5414
	ld	 r2,r18,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5416
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	ld	 r13,r18,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6929
@L6930:
	align	 4
@L5416:
	ld	 r13,r18,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5418
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r18,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6931
@L6932:
	align	 4
@L5418:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6116:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr	 _memory_address
	br	 @L5998
	align	 4
@L5414:
	ld	 r2,r18,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6133
	align	 4
@L5422:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L5425
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6211
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr	 _copy_rtx_and_substitute
	br	 @L5999
	align	 4
@L5425:
	or	 r2,r0,r23
@L6211:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L5426
	or	 r2,r0,r22
	bsr	 _copy_address
	br	 @L5999
	align	 4
@L5426:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L5427
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L5431
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L5428
	bb0.n	 ne,r11,@L5431
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L5430
@L5431:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L5432
	align	 4
@L5430:
	or	 r22,r0,r12
@L5432:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L5433
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6212
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L5434
	bcnd.n	 ge0,r24,@L5435
	or	 r3,r0,r24
	addu	 r3,r24,3
@L5435:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L5438
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L5439:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L5441
	subu	 r2,r2,1
	addu	 r13,r13,3
@L5441:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L5440
	bsr	 _abort
	align	 4
@L5440:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L5439
	addu	 r3,r3,4
@L5438:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L5443
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L5443:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L5446
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L5447
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L5447:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L5446:
	bsr	 _abort
	align	 4
@L5434:
	or.u	 r13,r0,hi16(_fp_delta)
@L6212:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L5433
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L5433:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6933
@L6934:
	align	 4
@L5428:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L5450
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5451
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6935
@L6936:
	align	 4
@L5451:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5453
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6937
@L6938:
	align	 4
@L5453:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6939
@L6940:
	align	 4
@L5450:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5456
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6941
@L6942:
	align	 4
@L5456:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5458
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6943
@L6944:
	align	 4
@L5458:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6945
@L6946:
	align	 4
@L5427:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6118:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r18
	align	 4
@L5461:
	bsr	 _abort
	align	 4
@L5384:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L5891
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r18
	or	 r21,r0,r22
@L5467:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L5470
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L5483
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L5466
	cmp	 r13,r12,69
	bb0	 ne,r13,@L5472
	br	 @L5481
	align	 4
@L5483:
	bb0	 ne,r13,@L5480
	bb1.n	 gt,r13,@L5484
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L5480
	br	 @L5481
	align	 4
@L5484:
	bb0.n	 ne,r13,@L5471
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L5481
	align	 4
@L5470:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L5466
	st	 r2,r21,4
	align	 4
@L5471:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L5466
	st	 r13,r21,4
	align	 4
@L5472:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L5466
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L5466
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L5466
	or	 r19,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L5477:
	ld	 r13,r19,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L5477
	addu	 r25,r25,4
	br	 @L5466
	align	 4
@L5480:
	ld	 r13,r20,4
	br.n	 @L5466
	st	 r13,r21,4
	align	 4
@L5481:
	bsr	 _abort
	align	 4
@L5466:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L5467
	addu	 r21,r21,4
	br.n	 @L6142
	cmp	 r13,r15,22
	align	 4
@L5487:
	subu	 r13,r0,r11
	subu	 r12,r0,r9
	mask	 r13,r13,1
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L5488
	cmp	 r13,r10,r8
	bb0	 lo,r13,@L5489
	bcnd	 eq0,r19,@L1650
	ld.hu	 r15,r0,r19
	ld.bu	 r23,r19,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L5570)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L5492
	or	 r13,r13,lo16(@L5570)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L5570:
	word	 @L1664
	word	 @L5492
	word	 @L5492
	word	 @L5492
	word	 @L5492
	word	 @L5507
	word	 @L5492
	word	 @L5492
	word	 @L5492
	word	 @L5492
	word	 @L5492
	word	 @L5509
	word	 @L5569
	word	 @L1662
	word	 @L1662
	word	 @L5492
	word	 @L1662
	word	 @L5493
	word	 @L5492
	word	 @L5492
	word	 @L5530
	word	 @L1665
	word	 @L1662
	word	 @L1662
	word	 @L5492
	word	 @L5492
	word	 @L5492
	word	 @L5512
	align	 4
@L5493:
	ld	 r25,r19,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r19
	bb0.n	 (31-30),r13,@L1871
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L5507:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r19,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6014
	br	 @L5492
	align	 4
@L5509:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L1675
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L5492
	br	 @L1675
	align	 4
@L5512:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L5516
	ld	 r13,r19,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L5513
	bb0.n	 ne,r12,@L5516
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L5515
	or	 r22,r0,r3
@L5516:
	ld	 r22,r19,8
@L5515:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L5513:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	ld	 r2,r19,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5524
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	ld	 r13,r19,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6947
@L6948:
	align	 4
@L5524:
	ld	 r13,r19,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5526
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r19,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6949
@L6950:
	align	 4
@L5526:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r19,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6119:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr	 _memory_address
	br	 @L5998
	align	 4
@L5530:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L5533
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6213
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr	 _copy_rtx_and_substitute
	br	 @L5999
	align	 4
@L5533:
	or	 r2,r0,r23
@L6213:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L5534
	or	 r2,r0,r22
	bsr	 _copy_address
	br	 @L5999
	align	 4
@L5534:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L5535
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L5539
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L5536
	bb0.n	 ne,r11,@L5539
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L5538
@L5539:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L5540
	align	 4
@L5538:
	or	 r22,r0,r12
@L5540:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L5541
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6214
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L5542
	bcnd.n	 ge0,r24,@L5543
	or	 r3,r0,r24
	addu	 r3,r24,3
@L5543:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L5546
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L5547:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L5549
	subu	 r2,r2,1
	addu	 r13,r13,3
@L5549:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L5548
	bsr	 _abort
	align	 4
@L5548:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L5547
	addu	 r3,r3,4
@L5546:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L5551
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L5551:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L5554
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L5555
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L5555:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L5554:
	bsr	 _abort
	align	 4
@L5542:
	or.u	 r13,r0,hi16(_fp_delta)
@L6214:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L5541
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L5541:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6951
@L6952:
	align	 4
@L5536:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L5558
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5559
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6953
@L6954:
	align	 4
@L5559:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5561
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6955
@L6956:
	align	 4
@L5561:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6957
@L6958:
	align	 4
@L5558:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5564
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6959
@L6960:
	align	 4
@L5564:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5566
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6961
@L6962:
	align	 4
@L5566:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6963
@L6964:
	align	 4
@L5535:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6121:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r19
	align	 4
@L5569:
	bsr	 _abort
	align	 4
@L5492:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L5573
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r19
	or	 r21,r0,r22
@L5575:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L5578
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L5591
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L5574
	cmp	 r13,r12,69
	bb0	 ne,r13,@L5580
	br	 @L5589
	align	 4
@L5591:
	bb0	 ne,r13,@L5588
	bb1.n	 gt,r13,@L5592
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L5588
	br	 @L5589
	align	 4
@L5592:
	bb0.n	 ne,r13,@L5579
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L5589
	align	 4
@L5578:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L5574
	st	 r2,r21,4
	align	 4
@L5579:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L5574
	st	 r13,r21,4
	align	 4
@L5580:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L5574
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L5574
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L5574
	or	 r18,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L5585:
	ld	 r13,r18,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L5585
	addu	 r25,r25,4
	br	 @L5574
	align	 4
@L5588:
	ld	 r13,r20,4
	br.n	 @L5574
	st	 r13,r21,4
	align	 4
@L5589:
	bsr	 _abort
	align	 4
@L5574:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L5575
	addu	 r21,r21,4
@L5573:
	cmp	 r13,r15,22
	bb0.n	 eq,r13,@L5915
	or	 r2,r0,r22
	or.u	 r12,r0,hi16(_orig_asm_operands_vector)
	ld	 r13,r12,lo16(_orig_asm_operands_vector)
	bcnd	 ne0,r13,@L5915
	ld	 r13,r19,16
	br.n	 @L6137
	st	 r13,r12,lo16(_orig_asm_operands_vector)
	align	 4
@L5489:
	bcnd	 eq0,r18,@L1650
	ld.hu	 r15,r0,r18
	ld.bu	 r23,r18,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L5676)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L5598
	or	 r13,r13,lo16(@L5676)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L5676:
	word	 @L5606
	word	 @L5598
	word	 @L5598
	word	 @L5598
	word	 @L5598
	word	 @L5613
	word	 @L5598
	word	 @L5598
	word	 @L5598
	word	 @L5598
	word	 @L5598
	word	 @L5615
	word	 @L5675
	word	 @L1768
	word	 @L1768
	word	 @L5598
	word	 @L1768
	word	 @L5599
	word	 @L5598
	word	 @L5598
	word	 @L5636
	word	 @L5607
	word	 @L1768
	word	 @L1768
	word	 @L5598
	word	 @L5598
	word	 @L5598
	word	 @L5618
	align	 4
@L5599:
	ld	 r25,r18,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r18
	bb0.n	 (31-30),r13,@L1978
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L5606:
	ld	 r12,r18,16
	br.n	 @L6005
	or.u	 r13,r0,hi16(_label_map)
	align	 4
@L5607:
	bsr.n	 _rtx_alloc
	or	 r2,r0,38
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r18,4
	br.n	 @L6138
	or.u	 r12,r0,hi16(_label_map)
	align	 4
@L5613:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r18,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6019
	br	 @L5598
	align	 4
@L5615:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L5617
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L5598
@L5617:
	ld	 r13,r18,4
	ld.bu	 r24,r18,2
	ld	 r2,r13,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r25,r13,2
	or	 r4,r0,r2
	or	 r2,r0,37
	bsr.n	 _gen_rtx
	or	 r3,r0,r25
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6007
	align	 4
@L5618:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L5622
	ld	 r13,r18,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L5619
	bb0.n	 ne,r12,@L5622
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L5621
	or	 r22,r0,r3
@L5622:
	ld	 r22,r18,8
@L5621:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L5619:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L5628
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L5628
	ld	 r2,r18,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5630
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	ld	 r13,r18,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6965
@L6966:
	align	 4
@L5630:
	ld	 r13,r18,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5632
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r18,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6967
@L6968:
	align	 4
@L5632:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6122:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr	 _memory_address
	br	 @L5998
	align	 4
@L5628:
	ld	 r2,r18,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6133
	align	 4
@L5636:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L5639
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6215
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr	 _copy_rtx_and_substitute
	br	 @L5999
	align	 4
@L5639:
	or	 r2,r0,r23
@L6215:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L5640
	or	 r2,r0,r22
	bsr	 _copy_address
	br	 @L5999
	align	 4
@L5640:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L5641
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L5645
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L5642
	bb0.n	 ne,r11,@L5645
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L5644
@L5645:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L5646
	align	 4
@L5644:
	or	 r22,r0,r12
@L5646:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L5647
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6216
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L5648
	bcnd.n	 ge0,r24,@L5649
	or	 r3,r0,r24
	addu	 r3,r24,3
@L5649:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L5652
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L5653:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L5655
	subu	 r2,r2,1
	addu	 r13,r13,3
@L5655:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L5654
	bsr	 _abort
	align	 4
@L5654:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L5653
	addu	 r3,r3,4
@L5652:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L5657
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L5657:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L5660
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L5661
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L5661:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L5660:
	bsr	 _abort
	align	 4
@L5648:
	or.u	 r13,r0,hi16(_fp_delta)
@L6216:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L5647
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L5647:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6969
@L6970:
	align	 4
@L5642:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L5664
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5665
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6971
@L6972:
	align	 4
@L5665:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5667
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6973
@L6974:
	align	 4
@L5667:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6975
@L6976:
	align	 4
@L5664:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5670
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6977
@L6978:
	align	 4
@L5670:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5672
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6979
@L6980:
	align	 4
@L5672:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6981
@L6982:
	align	 4
@L5641:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6124:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r18
	align	 4
@L5675:
	bsr	 _abort
	align	 4
@L5598:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L5891
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r18
	or	 r21,r0,r22
@L5681:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L5684
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L5697
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L5680
	cmp	 r13,r12,69
	bb0	 ne,r13,@L5686
	br	 @L5695
	align	 4
@L5697:
	bb0	 ne,r13,@L5694
	bb1.n	 gt,r13,@L5698
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L5694
	br	 @L5695
	align	 4
@L5698:
	bb0.n	 ne,r13,@L5685
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L5695
	align	 4
@L5684:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L5680
	st	 r2,r21,4
	align	 4
@L5685:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L5680
	st	 r13,r21,4
	align	 4
@L5686:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L5680
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L5680
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L5680
	or	 r19,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L5691:
	ld	 r13,r19,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L5691
	addu	 r25,r25,4
	br	 @L5680
	align	 4
@L5694:
	ld	 r13,r20,4
	br.n	 @L5680
	st	 r13,r21,4
	align	 4
@L5695:
	bsr	 _abort
	align	 4
@L5680:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L5681
	addu	 r21,r21,4
	br.n	 @L6142
	cmp	 r13,r15,22
	align	 4
@L5488:
	bcnd	 ne0,r10,@L5701
	bcnd	 eq0,r19,@L1650
	ld.hu	 r15,r0,r19
	ld.bu	 r23,r19,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L5782)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L5704
	or	 r13,r13,lo16(@L5782)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L5782:
	word	 @L1664
	word	 @L5704
	word	 @L5704
	word	 @L5704
	word	 @L5704
	word	 @L5719
	word	 @L5704
	word	 @L5704
	word	 @L5704
	word	 @L5704
	word	 @L5704
	word	 @L5721
	word	 @L5781
	word	 @L1662
	word	 @L1662
	word	 @L5704
	word	 @L1662
	word	 @L5705
	word	 @L5704
	word	 @L5704
	word	 @L5742
	word	 @L1665
	word	 @L1662
	word	 @L1662
	word	 @L5704
	word	 @L5704
	word	 @L5704
	word	 @L5724
	align	 4
@L5705:
	ld	 r25,r19,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L6134
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r19
	bb0.n	 (31-30),r13,@L1871
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L5719:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r19,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6014
	br	 @L5704
	align	 4
@L5721:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L1675
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L5704
	br	 @L1675
	align	 4
@L5724:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L5728
	ld	 r13,r19,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L5725
	bb0.n	 ne,r12,@L5728
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L5727
	or	 r22,r0,r3
@L5728:
	ld	 r22,r19,8
@L5727:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L5725:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r19
	bcnd	 eq0,r2,@L1686
	ld	 r2,r19,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5736
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	ld	 r13,r19,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6983
@L6984:
	align	 4
@L5736:
	ld	 r13,r19,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5738
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r19,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6985
@L6986:
	align	 4
@L5738:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r19,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r19,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6125:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr	 _memory_address
	br	 @L5998
	align	 4
@L5742:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r19,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L5745
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6217
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr	 _copy_rtx_and_substitute
	br	 @L5999
	align	 4
@L5745:
	or	 r2,r0,r23
@L6217:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L5746
	or	 r2,r0,r22
	bsr	 _copy_address
	br	 @L5999
	align	 4
@L5746:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L5747
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L5751
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L5748
	bb0.n	 ne,r11,@L5751
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L5750
@L5751:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L5752
	align	 4
@L5750:
	or	 r22,r0,r12
@L5752:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L5753
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6218
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L5754
	bcnd.n	 ge0,r24,@L5755
	or	 r3,r0,r24
	addu	 r3,r24,3
@L5755:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L5758
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L5759:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L5761
	subu	 r2,r2,1
	addu	 r13,r13,3
@L5761:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L5760
	bsr	 _abort
	align	 4
@L5760:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L5759
	addu	 r3,r3,4
@L5758:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L5763
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L5763:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L5766
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L5767
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L5767:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L5766:
	bsr	 _abort
	align	 4
@L5754:
	or.u	 r13,r0,hi16(_fp_delta)
@L6218:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L5753
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L5753:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L6987
@L6988:
	align	 4
@L5748:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L5770
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5771
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6989
@L6990:
	align	 4
@L5771:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5773
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6991
@L6992:
	align	 4
@L5773:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6993
@L6994:
	align	 4
@L5770:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5776
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6995
@L6996:
	align	 4
@L5776:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5778
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L6997
@L6998:
	align	 4
@L5778:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L6999
@L7000:
	align	 4
@L5747:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6127:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r19
	align	 4
@L5781:
	bsr	 _abort
	align	 4
@L5704:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r19
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L5785
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r19
	or	 r21,r0,r22
@L5787:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L5790
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L5803
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L5786
	cmp	 r13,r12,69
	bb0	 ne,r13,@L5792
	br	 @L5801
	align	 4
@L5803:
	bb0	 ne,r13,@L5800
	bb1.n	 gt,r13,@L5804
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L5800
	br	 @L5801
	align	 4
@L5804:
	bb0.n	 ne,r13,@L5791
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L5801
	align	 4
@L5790:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L5786
	st	 r2,r21,4
	align	 4
@L5791:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L5786
	st	 r13,r21,4
	align	 4
@L5792:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L5786
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L5786
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L5786
	or	 r18,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L5797:
	ld	 r13,r18,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L5797
	addu	 r25,r25,4
	br	 @L5786
	align	 4
@L5800:
	ld	 r13,r20,4
	br.n	 @L5786
	st	 r13,r21,4
	align	 4
@L5801:
	bsr	 _abort
	align	 4
@L5786:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L5787
	addu	 r21,r21,4
@L5785:
	cmp	 r13,r15,22
	bb0.n	 eq,r13,@L5915
	or	 r2,r0,r22
	or.u	 r12,r0,hi16(_orig_asm_operands_vector)
	ld	 r13,r12,lo16(_orig_asm_operands_vector)
	bcnd	 ne0,r13,@L5915
	ld	 r13,r19,16
	br.n	 @L6137
	st	 r13,r12,lo16(_orig_asm_operands_vector)
	align	 4
@L5701:
	bcnd.n	 ne0,r8,@L5915
	or	 r2,r0,0
	bcnd	 eq0,r18,@L5915
	ld.hu	 r15,r0,r18
	ld.bu	 r23,r18,2
	subu	 r11,r15,17
	or.u	 r13,r0,hi16(@L5888)
	cmp	 r12,r11,27
	bb0.n	 ls,r12,@L5810
	or	 r13,r13,lo16(@L5888)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L5888:
	word	 @L5818
	word	 @L5810
	word	 @L5810
	word	 @L5810
	word	 @L5810
	word	 @L5825
	word	 @L5810
	word	 @L5810
	word	 @L5810
	word	 @L5810
	word	 @L5810
	word	 @L5827
	word	 @L5887
	word	 @L1768
	word	 @L1768
	word	 @L5810
	word	 @L1768
	word	 @L5811
	word	 @L5810
	word	 @L5810
	word	 @L5848
	word	 @L5819
	word	 @L1768
	word	 @L1768
	word	 @L5810
	word	 @L5810
	word	 @L5810
	word	 @L5830
	align	 4
@L5811:
	ld	 r25,r18,4
	cmp	 r13,r25,55
	bb1.n	 gt,r13,@L1658
	or.u	 r24,r0,hi16(_reg_map)
	ld	 r13,r0,r18
	bb0.n	 (31-30),r13,@L1978
	or.u	 r13,r0,hi16(_inline_target)
	ld	 r4,r13,lo16(_inline_target)
	bcnd	 ne0,r4,@L1660
	bsr	 _abort
	align	 4
@L5818:
	ld	 r12,r18,16
	br.n	 @L6005
	or.u	 r13,r0,hi16(_label_map)
	align	 4
@L5819:
	bsr.n	 _rtx_alloc
	or	 r2,r0,38
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r18,4
	br.n	 @L6138
	or.u	 r12,r0,hi16(_label_map)
	align	 4
@L5825:
	or.u	 r13,r0,hi16(_orig_asm_operands_vector)
	ld	 r12,r18,16
	ld	 r13,r13,lo16(_orig_asm_operands_vector)
	cmp	 r13,r13,r12
	bb1	 eq,r13,@L6019
	br	 @L5810
	align	 4
@L5827:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L5829
	or.u	 r13,r0,hi16(_flag_no_function_cse)
	ld	 r13,r13,lo16(_flag_no_function_cse)
	bcnd	 eq0,r13,@L5810
@L5829:
	ld	 r13,r18,4
	ld.bu	 r24,r18,2
	ld	 r2,r13,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r25,r13,2
	or	 r4,r0,r2
	or	 r2,r0,37
	bsr.n	 _gen_rtx
	or	 r3,r0,r25
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6007
	align	 4
@L5830:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r3,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r12,r3,r2
	bb0	 ne,r12,@L5834
	ld	 r13,r18,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L5831
	bb0.n	 ne,r12,@L5834
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r3,r13
	bb1.n	 ne,r13,@L5833
	or	 r22,r0,r3
@L5834:
	ld	 r22,r18,8
@L5833:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1	 ne,r13,@L1682
	ld	 r5,r22,4
	bcnd.n	 gt0,r5,@L6139
	or.u	 r13,r0,hi16(_parm_map)
	or.u	 r13,r0,hi16(_fp_delta)
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r5,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	br.n	 @L5996
	or	 r3,r0,r23
	align	 4
@L5831:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L5840
	or	 r2,r0,r23
	bsr.n	 _memory_address_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L5840
	ld	 r2,r18,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5842
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	ld	 r13,r18,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L7001
@L7002:
	align	 4
@L5842:
	ld	 r13,r18,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5844
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r18,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L7003
@L7004:
	align	 4
@L5844:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r18,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
@L6128:
	or	 r4,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r4
	bsr	 _memory_address
	br	 @L5998
	align	 4
@L5840:
	ld	 r2,r18,4
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r18,2
	or	 r25,r0,r2
	ld	 r2,r18,8
	br	 @L6133
	align	 4
@L5848:
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r22,r18,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r22,r2
	bb1.n	 eq,r13,@L1696
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r22,r13
	bb1	 eq,r13,@L1696
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L5851
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r12,r22,4
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6219
	or	 r2,r0,r23
	or	 r2,r0,r22
	bsr	 _copy_rtx_and_substitute
	br	 @L5999
	align	 4
@L5851:
	or	 r2,r0,r23
@L6219:
	bsr.n	 _memory_address_p
	or	 r3,r0,r22
	bcnd.n	 ne0,r2,@L5852
	or	 r2,r0,r22
	bsr	 _copy_address
	br	 @L5999
	align	 4
@L5852:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,44
	bb1.n	 ne,r13,@L5853
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r22,4
	ld	 r2,r13,lo16(_frame_pointer_rtx)
	cmp	 r11,r12,r2
	bb0	 ne,r11,@L5857
	ld	 r13,r22,8
	cmp	 r13,r13,r2
	bb1	 ne,r13,@L5854
	bb0.n	 ne,r11,@L5857
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L5856
@L5857:
	ld	 r2,r22,4
	ld	 r22,r22,8
	br	 @L5858
	align	 4
@L5856:
	or	 r22,r0,r12
@L5858:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,30
	bb1.n	 ne,r13,@L5859
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r2,r13
	ld	 r24,r22,4
	bb1.n	 ne,r13,@L6220
	or.u	 r13,r0,hi16(_fp_delta)
	or.u	 r10,r0,hi16(_first_parm_offset)
	ld	 r13,r10,lo16(_first_parm_offset)
	cmp	 r13,r24,r13
	bb0	 ge,r13,@L5860
	bcnd.n	 ge0,r24,@L5861
	or	 r3,r0,r24
	addu	 r3,r24,3
@L5861:
	or.u	 r11,r0,hi16(_parm_map)
	ext	 r3,r3,0<2>
	ld	 r13,r11,lo16(_parm_map)
	or	 r2,r0,r3
	mak	 r12,r2,0<2>
	ld	 r13,r13[r2]
	bcnd.n	 ne0,r13,@L5864
	subu	 r3,r24,r12
	or	 r12,r0,r11
@L5865:
	ld	 r13,r10,lo16(_first_parm_offset)
	bcnd.n	 ge0,r13,@L5867
	subu	 r2,r2,1
	addu	 r13,r13,3
@L5867:
	ext	 r13,r13,0<2>
	cmp	 r13,r2,r13
	bb1	 ge,r13,@L5866
	bsr	 _abort
	align	 4
@L5866:
	ld	 r13,r12,lo16(_parm_map)
	ld	 r13,r13[r2]
	bcnd.n	 eq0,r13,@L5865
	addu	 r3,r3,4
@L5864:
	or.u	 r13,r0,hi16(_parm_map)
	ld	 r13,r13,lo16(_parm_map)
	ld	 r22,r13[r2]
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r22,2
	or	 r10,r13,lo16(_mode_size)
	ld	 r11,r10[r12]
	cmp	 r13,r11,3
	bb1.n	 gt,r13,@L5869
	subu	 r13,r3,4
	addu	 r3,r13,r11
@L5869:
	ld.bu	 r13,r22,2
	cmp	 r13,r13,r23
	bb0.n	 ne,r13,@L5915
	or	 r2,r0,r22
	bcnd	 eq0,r12,@L5915
	ld.hu	 r12,r0,r22
	cmp	 r13,r12,37
	bb1.n	 eq,r13,@L6011
	cmp	 r13,r12,34
	bb1	 ne,r13,@L5872
	ld	 r13,r10[r23]
	addu	 r13,r3,r13
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L5873
	or	 r2,r0,35
	bsr	 _abort
	align	 4
@L5873:
	or	 r3,r0,r23
	br.n	 @L6000
	or	 r4,r0,r22
	align	 4
@L5872:
	bsr	 _abort
	align	 4
@L5860:
	or.u	 r13,r0,hi16(_fp_delta)
@L6220:
	or	 r2,r0,30
	ld	 r4,r13,lo16(_fp_delta)
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	addu	 r4,r24,r4
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_frame_pointer_rtx)
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address_p
	or	 r3,r0,r4
	bcnd.n	 ne0,r2,@L5859
	or.u	 r13,r0,hi16(_inline_fp_rtx)
	ld	 r2,r13,lo16(_inline_fp_rtx)
	br.n	 @L6001
	or	 r3,r0,r24
	align	 4
@L5859:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
	or	 r22,r0,r2
	or	 r2,r0,44
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r3,r0,4
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r5,r0,r22
	or.u	 r13,r0,hi16(_fp_delta)
	bsr.n	 _plus_constant
	ld	 r3,r13,lo16(_fp_delta)
	or	 r4,r0,r2
	or	 r2,r0,4
	or	 r3,r0,r4
	bsr.n	 _memory_address
	addu	 r1,r1,@L7005
@L7006:
	align	 4
@L5854:
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r22
	bcnd	 eq0,r2,@L5876
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5877
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L7007
@L7008:
	align	 4
@L5877:
	ld	 r13,r22,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5879
	bsr	 _copy_rtx_and_substitute
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L7009
@L7010:
	align	 4
@L5879:
	bsr.n	 _copy_rtx_and_substitute
	ld.bu	 r24,r22,2
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r3,r0,r24
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L7011
@L7012:
	align	 4
@L5876:
	ld	 r12,r22,8
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5882
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,4
	ld	 r13,r22,8
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L7013
@L7014:
	align	 4
@L5882:
	ld	 r2,r22,4
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,30
	bb1	 ne,r13,@L5884
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r12
	ld	 r13,r22,4
	ld	 r3,r13,4
	bsr.n	 _plus_constant
	addu	 r1,r1,@L7015
@L7016:
	align	 4
@L5884:
	bsr	 _copy_rtx_and_substitute
	or	 r25,r0,r2
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r22,8
	ld.bu	 r3,r22,2
	or	 r5,r0,r2
	or	 r2,r0,44
	or	 r4,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L7017
@L7018:
	align	 4
@L5853:
	bsr.n	 _copy_rtx_and_substitute
	or	 r2,r0,r22
@L6130:
	or	 r4,r0,r2
	br.n	 @L6003
	or	 r2,r0,r18
	align	 4
@L5887:
	bsr	 _abort
	align	 4
@L5810:
	bsr.n	 _rtx_alloc
	or	 r2,r0,r15
	or	 r22,r0,r2
	st.b	 r23,r22,2
	ld	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xfff7
	mask	 r12,r12,8
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffef
	mask	 r12,r12,16
	or	 r13,r13,r12
	st	 r13,r0,r22
	ld	 r12,r0,r18
	and	 r13,r13,0xffdf
	mask	 r12,r12,32
	or	 r13,r13,r12
	st	 r13,r0,r22
	or.u	 r13,r0,hi16(_rtx_format)
	or.u	 r12,r0,hi16(_rtx_length)
	ld.hu	 r11,r0,r22
	or	 r10,r12,lo16(_rtx_length)
	or	 r13,r13,lo16(_rtx_format)
	ld	 r12,r10[r11]
	ld	 r16,r13[r11]
	bcnd.n	 le0,r12,@L5891
	or	 r17,r0,0
	or	 r14,r0,r10
	or	 r20,r0,r18
	or	 r21,r0,r22
@L5893:
	ld.b	 r12,r0,r16
	cmp	 r13,r12,101
	bb0.n	 ne,r13,@L5896
	addu	 r16,r16,1
	bb1.n	 gt,r13,@L5909
	cmp	 r13,r12,115
	cmp	 r13,r12,48
	bb1.n	 eq,r13,@L5892
	cmp	 r13,r12,69
	bb0	 ne,r13,@L5898
	br	 @L5907
	align	 4
@L5909:
	bb0	 ne,r13,@L5906
	bb1.n	 gt,r13,@L5910
	cmp	 r13,r12,117
	cmp	 r13,r12,105
	bb0	 ne,r13,@L5906
	br	 @L5907
	align	 4
@L5910:
	bb0.n	 ne,r13,@L5897
	or.u	 r12,r0,hi16(_insn_map)
	br	 @L5907
	align	 4
@L5896:
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r20,4
	br.n	 @L5892
	st	 r2,r21,4
	align	 4
@L5897:
	ld	 r13,r20,4
	ld	 r11,r13,4
	ld	 r13,r12,lo16(_insn_map)
	ld	 r13,r13[r11]
	br.n	 @L5892
	st	 r13,r21,4
	align	 4
@L5898:
	ld	 r13,r20,4
	st	 r13,r21,4
	ld	 r2,r20,4
	bcnd	 eq0,r2,@L5892
	ld	 r2,r0,r2
	bcnd	 eq0,r2,@L5892
	bsr.n	 _rtvec_alloc
	or	 r24,r0,0
	st	 r2,r21,4
	ld	 r13,r0,r2
	bcnd.n	 eq0,r13,@L5892
	or	 r19,r0,r20
	or	 r23,r0,r21
	or	 r25,r0,0
@L5903:
	ld	 r13,r19,4
	addu	 r13,r13,r25
	bsr.n	 _copy_rtx_and_substitute
	ld	 r2,r13,4
	ld	 r13,r23,4
	addu	 r13,r13,r25
	st	 r2,r13,4
	ld	 r13,r23,4
	ld	 r13,r0,r13
	addu	 r24,r24,1
	cmp	 r13,r24,r13
	bb1.n	 lo,r13,@L5903
	addu	 r25,r25,4
	br	 @L5892
	align	 4
@L5906:
	ld	 r13,r20,4
	br.n	 @L5892
	st	 r13,r21,4
	align	 4
@L5907:
	bsr	 _abort
	align	 4
@L5892:
	ld.hu	 r13,r0,r22
	ld	 r13,r14[r13]
	addu	 r17,r17,1
	addu	 r20,r20,4
	cmp	 r13,r17,r13
	bb1.n	 lt,r13,@L5893
	addu	 r21,r21,4
@L5891:
	cmp	 r13,r15,22
@L6142:
	bb0.n	 eq,r13,@L5915
	or	 r2,r0,r22
	or.u	 r12,r0,hi16(_orig_asm_operands_vector)
	ld	 r13,r12,lo16(_orig_asm_operands_vector)
	bcnd	 ne0,r13,@L5915
	ld	 r13,r18,16
	st	 r13,r12,lo16(_orig_asm_operands_vector)
@L6137:
	ld	 r12,r22,16
	or.u	 r13,r0,hi16(_copy_asm_operands_vector)
	st	 r12,r13,lo16(_copy_asm_operands_vector)
	br.n	 @L5915
	or	 r2,r0,r22
	align	 4
@L1650:
	or	 r2,r0,0
@L5915:
@Lte9:
	ld	 r1,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	ld.d	 r14,r31,32
	jmp.n	 r1
	addu	 r31,r31,96
	def	 @L7017,@L6130-@L7018
	def	 @L7015,@L6130-@L7016
	def	 @L7013,@L6130-@L7014
	def	 @L7011,@L6130-@L7012
	def	 @L7009,@L6130-@L7010
	def	 @L7007,@L6130-@L7008
	def	 @L7005,@L6130-@L7006
	def	 @L7003,@L6128-@L7004
	def	 @L7001,@L6128-@L7002
	def	 @L6999,@L6127-@L7000
	def	 @L6997,@L6127-@L6998
	def	 @L6995,@L6127-@L6996
	def	 @L6993,@L6127-@L6994
	def	 @L6991,@L6127-@L6992
	def	 @L6989,@L6127-@L6990
	def	 @L6987,@L6127-@L6988
	def	 @L6985,@L6125-@L6986
	def	 @L6983,@L6125-@L6984
	def	 @L6981,@L6124-@L6982
	def	 @L6979,@L6124-@L6980
	def	 @L6977,@L6124-@L6978
	def	 @L6975,@L6124-@L6976
	def	 @L6973,@L6124-@L6974
	def	 @L6971,@L6124-@L6972
	def	 @L6969,@L6124-@L6970
	def	 @L6967,@L6122-@L6968
	def	 @L6965,@L6122-@L6966
	def	 @L6963,@L6121-@L6964
	def	 @L6961,@L6121-@L6962
	def	 @L6959,@L6121-@L6960
	def	 @L6957,@L6121-@L6958
	def	 @L6955,@L6121-@L6956
	def	 @L6953,@L6121-@L6954
	def	 @L6951,@L6121-@L6952
	def	 @L6949,@L6119-@L6950
	def	 @L6947,@L6119-@L6948
	def	 @L6945,@L6118-@L6946
	def	 @L6943,@L6118-@L6944
	def	 @L6941,@L6118-@L6942
	def	 @L6939,@L6118-@L6940
	def	 @L6937,@L6118-@L6938
	def	 @L6935,@L6118-@L6936
	def	 @L6933,@L6118-@L6934
	def	 @L6931,@L6116-@L6932
	def	 @L6929,@L6116-@L6930
	def	 @L6927,@L6115-@L6928
	def	 @L6925,@L6115-@L6926
	def	 @L6923,@L6115-@L6924
	def	 @L6921,@L6115-@L6922
	def	 @L6919,@L6115-@L6920
	def	 @L6917,@L6115-@L6918
	def	 @L6915,@L6115-@L6916
	def	 @L6913,@L6113-@L6914
	def	 @L6911,@L6113-@L6912
	def	 @L6909,@L6112-@L6910
	def	 @L6907,@L6112-@L6908
	def	 @L6905,@L6112-@L6906
	def	 @L6903,@L6112-@L6904
	def	 @L6901,@L6112-@L6902
	def	 @L6899,@L6112-@L6900
	def	 @L6897,@L6112-@L6898
	def	 @L6895,@L6110-@L6896
	def	 @L6893,@L6110-@L6894
	def	 @L6891,@L6109-@L6892
	def	 @L6889,@L6109-@L6890
	def	 @L6887,@L6109-@L6888
	def	 @L6885,@L6109-@L6886
	def	 @L6883,@L6109-@L6884
	def	 @L6881,@L6109-@L6882
	def	 @L6879,@L6109-@L6880
	def	 @L6877,@L6107-@L6878
	def	 @L6875,@L6107-@L6876
	def	 @L6873,@L6106-@L6874
	def	 @L6871,@L6106-@L6872
	def	 @L6869,@L6106-@L6870
	def	 @L6867,@L6106-@L6868
	def	 @L6865,@L6106-@L6866
	def	 @L6863,@L6106-@L6864
	def	 @L6861,@L6106-@L6862
	def	 @L6859,@L6104-@L6860
	def	 @L6857,@L6104-@L6858
	def	 @L6855,@L6103-@L6856
	def	 @L6853,@L6103-@L6854
	def	 @L6851,@L6103-@L6852
	def	 @L6849,@L6103-@L6850
	def	 @L6847,@L6103-@L6848
	def	 @L6845,@L6103-@L6846
	def	 @L6843,@L6103-@L6844
	def	 @L6841,@L6101-@L6842
	def	 @L6839,@L6101-@L6840
	def	 @L6837,@L6100-@L6838
	def	 @L6835,@L6100-@L6836
	def	 @L6833,@L6100-@L6834
	def	 @L6831,@L6100-@L6832
	def	 @L6829,@L6100-@L6830
	def	 @L6827,@L6100-@L6828
	def	 @L6825,@L6100-@L6826
	def	 @L6823,@L6098-@L6824
	def	 @L6821,@L6098-@L6822
	def	 @L6819,@L6097-@L6820
	def	 @L6817,@L6097-@L6818
	def	 @L6815,@L6097-@L6816
	def	 @L6813,@L6097-@L6814
	def	 @L6811,@L6097-@L6812
	def	 @L6809,@L6097-@L6810
	def	 @L6807,@L6097-@L6808
	def	 @L6805,@L6095-@L6806
	def	 @L6803,@L6095-@L6804
	def	 @L6801,@L6094-@L6802
	def	 @L6799,@L6094-@L6800
	def	 @L6797,@L6094-@L6798
	def	 @L6795,@L6094-@L6796
	def	 @L6793,@L6094-@L6794
	def	 @L6791,@L6094-@L6792
	def	 @L6789,@L6094-@L6790
	def	 @L6787,@L6092-@L6788
	def	 @L6785,@L6092-@L6786
	def	 @L6783,@L6091-@L6784
	def	 @L6781,@L6091-@L6782
	def	 @L6779,@L6091-@L6780
	def	 @L6777,@L6091-@L6778
	def	 @L6775,@L6091-@L6776
	def	 @L6773,@L6091-@L6774
	def	 @L6771,@L6091-@L6772
	def	 @L6769,@L6089-@L6770
	def	 @L6767,@L6089-@L6768
	def	 @L6765,@L6088-@L6766
	def	 @L6763,@L6088-@L6764
	def	 @L6761,@L6088-@L6762
	def	 @L6759,@L6088-@L6760
	def	 @L6757,@L6088-@L6758
	def	 @L6755,@L6088-@L6756
	def	 @L6753,@L6088-@L6754
	def	 @L6751,@L6086-@L6752
	def	 @L6749,@L6086-@L6750
	def	 @L6747,@L6085-@L6748
	def	 @L6745,@L6085-@L6746
	def	 @L6743,@L6085-@L6744
	def	 @L6741,@L6085-@L6742
	def	 @L6739,@L6085-@L6740
	def	 @L6737,@L6085-@L6738
	def	 @L6735,@L6085-@L6736
	def	 @L6733,@L6083-@L6734
	def	 @L6731,@L6083-@L6732
	def	 @L6729,@L6082-@L6730
	def	 @L6727,@L6082-@L6728
	def	 @L6725,@L6082-@L6726
	def	 @L6723,@L6082-@L6724
	def	 @L6721,@L6082-@L6722
	def	 @L6719,@L6082-@L6720
	def	 @L6717,@L6082-@L6718
	def	 @L6715,@L6080-@L6716
	def	 @L6713,@L6080-@L6714
	def	 @L6711,@L6079-@L6712
	def	 @L6709,@L6079-@L6710
	def	 @L6707,@L6079-@L6708
	def	 @L6705,@L6079-@L6706
	def	 @L6703,@L6079-@L6704
	def	 @L6701,@L6079-@L6702
	def	 @L6699,@L6079-@L6700
	def	 @L6697,@L6077-@L6698
	def	 @L6695,@L6077-@L6696
	def	 @L6693,@L6076-@L6694
	def	 @L6691,@L6076-@L6692
	def	 @L6689,@L6076-@L6690
	def	 @L6687,@L6076-@L6688
	def	 @L6685,@L6076-@L6686
	def	 @L6683,@L6076-@L6684
	def	 @L6681,@L6076-@L6682
	def	 @L6679,@L6074-@L6680
	def	 @L6677,@L6074-@L6678
	def	 @L6675,@L6073-@L6676
	def	 @L6673,@L6073-@L6674
	def	 @L6671,@L6073-@L6672
	def	 @L6669,@L6073-@L6670
	def	 @L6667,@L6073-@L6668
	def	 @L6665,@L6073-@L6666
	def	 @L6663,@L6073-@L6664
	def	 @L6661,@L6071-@L6662
	def	 @L6659,@L6071-@L6660
	def	 @L6657,@L6070-@L6658
	def	 @L6655,@L6070-@L6656
	def	 @L6653,@L6070-@L6654
	def	 @L6651,@L6070-@L6652
	def	 @L6649,@L6070-@L6650
	def	 @L6647,@L6070-@L6648
	def	 @L6645,@L6070-@L6646
	def	 @L6643,@L6068-@L6644
	def	 @L6641,@L6068-@L6642
	def	 @L6639,@L6067-@L6640
	def	 @L6637,@L6067-@L6638
	def	 @L6635,@L6067-@L6636
	def	 @L6633,@L6067-@L6634
	def	 @L6631,@L6067-@L6632
	def	 @L6629,@L6067-@L6630
	def	 @L6627,@L6067-@L6628
	def	 @L6625,@L6065-@L6626
	def	 @L6623,@L6065-@L6624
	def	 @L6621,@L6064-@L6622
	def	 @L6619,@L6064-@L6620
	def	 @L6617,@L6064-@L6618
	def	 @L6615,@L6064-@L6616
	def	 @L6613,@L6064-@L6614
	def	 @L6611,@L6064-@L6612
	def	 @L6609,@L6064-@L6610
	def	 @L6607,@L6062-@L6608
	def	 @L6605,@L6062-@L6606
	def	 @L6603,@L6061-@L6604
	def	 @L6601,@L6061-@L6602
	def	 @L6599,@L6061-@L6600
	def	 @L6597,@L6061-@L6598
	def	 @L6595,@L6061-@L6596
	def	 @L6593,@L6061-@L6594
	def	 @L6591,@L6061-@L6592
	def	 @L6589,@L6059-@L6590
	def	 @L6587,@L6059-@L6588
	def	 @L6585,@L6058-@L6586
	def	 @L6583,@L6058-@L6584
	def	 @L6581,@L6058-@L6582
	def	 @L6579,@L6058-@L6580
	def	 @L6577,@L6058-@L6578
	def	 @L6575,@L6058-@L6576
	def	 @L6573,@L6058-@L6574
	def	 @L6571,@L6056-@L6572
	def	 @L6569,@L6056-@L6570
	def	 @L6567,@L6055-@L6568
	def	 @L6565,@L6055-@L6566
	def	 @L6563,@L6055-@L6564
	def	 @L6561,@L6055-@L6562
	def	 @L6559,@L6055-@L6560
	def	 @L6557,@L6055-@L6558
	def	 @L6555,@L6055-@L6556
	def	 @L6553,@L6053-@L6554
	def	 @L6551,@L6053-@L6552
	def	 @L6549,@L6052-@L6550
	def	 @L6547,@L6052-@L6548
	def	 @L6545,@L6052-@L6546
	def	 @L6543,@L6052-@L6544
	def	 @L6541,@L6052-@L6542
	def	 @L6539,@L6052-@L6540
	def	 @L6537,@L6052-@L6538
	def	 @L6535,@L6050-@L6536
	def	 @L6533,@L6050-@L6534
	def	 @L6531,@L6049-@L6532
	def	 @L6529,@L6049-@L6530
	def	 @L6527,@L6049-@L6528
	def	 @L6525,@L6049-@L6526
	def	 @L6523,@L6049-@L6524
	def	 @L6521,@L6049-@L6522
	def	 @L6519,@L6049-@L6520
	def	 @L6517,@L6518-@L5999
	def	 @L6515,@L6516-@L5999
	def	 @L6513,@L6514-@L5998
	def	 @L6511,@L6047-@L6512
	def	 @L6509,@L6047-@L6510
	def	 @L6507,@L6046-@L6508
	def	 @L6505,@L6046-@L6506
	def	 @L6503,@L6046-@L6504
	def	 @L6501,@L6046-@L6502
	def	 @L6499,@L6046-@L6500
	def	 @L6497,@L6046-@L6498
	def	 @L6495,@L6046-@L6496
	def	 @L6493,@L6494-@L5999
	def	 @L6491,@L6492-@L5999
	def	 @L6489,@L6490-@L5998
	def	 @L6487,@L6044-@L6488
	def	 @L6485,@L6044-@L6486
	def	 @L6483,@L6043-@L6484
	def	 @L6481,@L6043-@L6482
	def	 @L6479,@L6043-@L6480
	def	 @L6477,@L6043-@L6478
	def	 @L6475,@L6043-@L6476
	def	 @L6473,@L6043-@L6474
	def	 @L6471,@L6043-@L6472
	def	 @L6469,@L6470-@L5999
	def	 @L6467,@L6468-@L5999
	def	 @L6465,@L6466-@L5998
	def	 @L6463,@L6041-@L6464
	def	 @L6461,@L6041-@L6462
	def	 @L6459,@L6040-@L6460
	def	 @L6457,@L6040-@L6458
	def	 @L6455,@L6040-@L6456
	def	 @L6453,@L6040-@L6454
	def	 @L6451,@L6040-@L6452
	def	 @L6449,@L6040-@L6450
	def	 @L6447,@L6040-@L6448
	def	 @L6445,@L6446-@L5999
	def	 @L6443,@L6444-@L5999
	def	 @L6441,@L6442-@L5998
	def	 @L6439,@L6038-@L6440
	def	 @L6437,@L6038-@L6438
	def	 @L6435,@L6037-@L6436
	def	 @L6433,@L6037-@L6434
	def	 @L6431,@L6037-@L6432
	def	 @L6429,@L6037-@L6430
	def	 @L6427,@L6037-@L6428
	def	 @L6425,@L6037-@L6426
	def	 @L6423,@L6037-@L6424
	def	 @L6421,@L6422-@L5999
	def	 @L6419,@L6420-@L5999
	def	 @L6417,@L6418-@L5998
	def	 @L6415,@L6035-@L6416
	def	 @L6413,@L6035-@L6414
	def	 @L6411,@L6034-@L6412
	def	 @L6409,@L6034-@L6410
	def	 @L6407,@L6034-@L6408
	def	 @L6405,@L6034-@L6406
	def	 @L6403,@L6034-@L6404
	def	 @L6401,@L6034-@L6402
	def	 @L6399,@L6034-@L6400
	def	 @L6397,@L6398-@L5999
	def	 @L6395,@L6396-@L5999
	def	 @L6393,@L6394-@L5998
	def	 @L6391,@L6032-@L6392
	def	 @L6389,@L6032-@L6390
	def	 @L6387,@L6031-@L6388
	def	 @L6385,@L6031-@L6386
	def	 @L6383,@L6031-@L6384
	def	 @L6381,@L6031-@L6382
	def	 @L6379,@L6031-@L6380
	def	 @L6377,@L6031-@L6378
	def	 @L6375,@L6031-@L6376
	def	 @L6373,@L6374-@L5999
	def	 @L6371,@L6372-@L5999
	def	 @L6369,@L6370-@L5998
	def	 @L6367,@L6029-@L6368
	def	 @L6365,@L6029-@L6366
	def	 @L6363,@L6028-@L6364
	def	 @L6361,@L6028-@L6362
	def	 @L6359,@L6028-@L6360
	def	 @L6357,@L6028-@L6358
	def	 @L6355,@L6028-@L6356
	def	 @L6353,@L6028-@L6354
	def	 @L6351,@L6028-@L6352
	def	 @L6349,@L6350-@L5999
	def	 @L6347,@L6348-@L5999
	def	 @L6345,@L6346-@L5998
	def	 @L6343,@L6026-@L6344
	def	 @L6341,@L6026-@L6342
	def	 @L6339,@L6025-@L6340
	def	 @L6337,@L6025-@L6338
	def	 @L6335,@L6025-@L6336
	def	 @L6333,@L6025-@L6334
	def	 @L6331,@L6025-@L6332
	def	 @L6329,@L6025-@L6330
	def	 @L6327,@L6025-@L6328
	def	 @L6325,@L6326-@L5999
	def	 @L6323,@L6324-@L5999
	def	 @L6321,@L6322-@L5998
	def	 @L6319,@L6023-@L6320
	def	 @L6317,@L6023-@L6318
	def	 @L6315,@L6022-@L6316
	def	 @L6313,@L6022-@L6314
	def	 @L6311,@L6022-@L6312
	def	 @L6309,@L6022-@L6310
	def	 @L6307,@L6022-@L6308
	def	 @L6305,@L6022-@L6306
	def	 @L6303,@L6022-@L6304
	def	 @L6301,@L6302-@L5999
	def	 @L6299,@L6300-@L5999
	def	 @L6297,@L6298-@L5998
	def	 @L6295,@L6020-@L6296
	def	 @L6293,@L6020-@L6294
	def	 @L6291,@L6017-@L6292
	def	 @L6289,@L6017-@L6290
	def	 @L6287,@L6017-@L6288
	def	 @L6285,@L6017-@L6286
	def	 @L6283,@L6017-@L6284
	def	 @L6281,@L6017-@L6282
	def	 @L6279,@L6017-@L6280
	def	 @L6277,@L6278-@L5999
	def	 @L6275,@L6276-@L5999
	def	 @L6273,@L6274-@L5998
	def	 @L6271,@L6015-@L6272
	def	 @L6269,@L6015-@L6270
	def	 @L6267,@L6012-@L6268
	def	 @L6265,@L6012-@L6266
	def	 @L6263,@L6012-@L6264
	def	 @L6261,@L6012-@L6262
	def	 @L6259,@L6012-@L6260
	def	 @L6257,@L6012-@L6258
	def	 @L6255,@L6012-@L6256
	def	 @L6253,@L6254-@L5999
	def	 @L6251,@L6252-@L5999
	def	 @L6249,@L6250-@L5998
	def	 @L6247,@L6009-@L6248
	def	 @L6245,@L6009-@L6246
	def	 @L6243,@L6002-@L6244
	def	 @L6241,@L6002-@L6242
	def	 @L6239,@L6002-@L6240
	def	 @L6237,@L6002-@L6238
	def	 @L6235,@L6002-@L6236
	def	 @L6233,@L6002-@L6234
	def	 @L6231,@L6002-@L6232
	def	 @L6229,@L6230-@L5999
	def	 @L6227,@L6228-@L5999
	def	 @L6225,@L5998-@L6226
	def	 @L6223,@L5997-@L6224
	def	 @L6221,@L5997-@L6222

	align	 8
	global	 _output_inline_function
_output_inline_function:
	subu	 r31,r31,64
	st.d	 r24,r31,40
	or	 r25,r0,r2
	st	 r1,r31,48
@Ltb10:
	bsr.n	 _temporary_allocation
	ld	 r24,r25,72
	or.u	 r13,r0,hi16(_current_function_decl)
	or	 r2,r0,r25
	bsr.n	 _expand_function_start
	st	 r25,r13,lo16(_current_function_decl)
	ld	 r3,r25,68
	bsr.n	 _assign_stack_local
	or	 r2,r0,26
	bsr.n	 _restore_reg_data
	ld	 r2,r24,16
	ld	 r2,r25,16
	bsr.n	 _expand_function_end
	ld	 r3,r25,20
	or	 r3,r0,r24
	ld	 r13,r3,12
	bcnd	 eq0,r13,@L7027
@L7028:
	ld	 r3,r3,12
	ld	 r13,r3,12
	bcnd	 ne0,r13,@L7028
@L7027:
	bsr.n	 _set_new_first_and_last_insn
	ld	 r2,r24,16
	bsr.n	 _rest_of_compilation
	or	 r2,r0,r25
	or.u	 r13,r0,hi16(_current_function_decl)
	bsr.n	 _permanent_allocation
	st	 r0,r13,lo16(_current_function_decl)
@Lte10:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

	bss	 _inline_target,4,4
	bss	 _inline_fp_rtx,4,4
	bss	 _parm_map,4,4
	bss	 _fp_addr_p,4,4
	bss	 _fp_delta,4,4
	bss	 _orig_asm_operands_vector,4,4
	bss	 _copy_asm_operands_vector,4,4
	bss	 _reg_map,4,4
	bss	 _label_map,4,4
	bss	 _insn_map,4,4
	bss	 _parmdecl_map,4,4
	bss	 _max_parm_reg,4,4
	bss	 _first_parm_offset,4,4
