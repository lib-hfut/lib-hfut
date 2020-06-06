	file	 "expr.i"
data

; cc1 (2.7.2.2) arguments: -O -fdefer-pop -fomit-frame-pointer
; -fcse-follow-jumps -fcse-skip-blocks -fexpensive-optimizations
; -fthread-jumps -fstrength-reduce -funroll-loops -fwritable-strings
; -fpeephole -fforce-mem -ffunction-cse -finline-functions -finline
; -freg-struct-return -fdelayed-branch -frerun-cse-after-loop
; -fschedule-insns -fschedule-insns2 -fcommon -fgnu-linker -m88110 -m88100
; -m88000 -mno-ocs-debug-info -mno-ocs-frame-position -mcheck-zero-division

gcc2_compiled.:
	global	 _do_preexpand_calls
	align	 4
_do_preexpand_calls:
	word	 1
text
	align	 8
	global	 _init_expr_once
_init_expr_once:
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r4,r13,lo16(_stack_pointer_rtx)
	subu	 r31,r31,96
	st	 r1,r31,80
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	or	 r2,r0,55
	st.d	 r18,r31,48
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	st.d	 r16,r31,40
@Ltb0:
	or	 r18,r0,r2
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	or	 r2,r0,55
	ld	 r4,r13,lo16(_frame_pointer_rtx)
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr.n	 _start_sequence
	or	 r20,r0,r2
	or	 r2,r0,40
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,0
	bsr.n	 _emit_insn
	or	 r25,r0,0
	or	 r21,r0,r2
	or	 r16,r0,1
	or.u	 r13,r0,hi16(_direct_load)
	or.u	 r12,r0,hi16(_direct_store)
	ld	 r24,r21,16
	or	 r17,r13,lo16(_direct_load)
	or	 r19,r12,lo16(_direct_store)
	cmp	 r13,r25,0
@L41:
	st.b	 r0,r25,r19
	cmp	 r12,r25,16
	st.b	 r0,r25,r17
	or	 r13,r13,r12
	st.b	 r25,r18,2
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L25
	st.b	 r25,r20,2
	ld.b	 r13,r25,r17
	br.n	 @L39
	or	 r22,r0,0
	align	 4
@L29:
@L40:
	or	 r13,r13,lo16(_hard_regno_mode_ok)
	ld	 r13,r13[r22]
	ext	 r13,r13,r25
	bb0.n	 (31-31),r13,@L28
	or	 r2,r0,51
	or	 r3,r0,r25
	bsr.n	 _gen_rtx
	or	 r4,r0,r22
	st	 r18,r24,8
	or	 r23,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,r21
	addu	 r4,r31,88
	bsr.n	 _recog
	st	 r23,r24,4
	bcnd	 lt0,r2,@L32
	st.b	 r16,r25,r17
@L32:
	st	 r20,r24,8
	or	 r2,r0,r24
	or	 r3,r0,r21
	addu	 r4,r31,88
	bsr.n	 _recog
	st	 r23,r24,4
	bcnd	 lt0,r2,@L33
	st.b	 r16,r25,r17
@L33:
	st	 r23,r24,8
	or	 r2,r0,r24
	or	 r3,r0,r21
	addu	 r4,r31,88
	bsr.n	 _recog
	st	 r18,r24,4
	bcnd	 lt0,r2,@L34
	st.b	 r16,r25,r19
@L34:
	st	 r23,r24,8
	or	 r2,r0,r24
	or	 r3,r0,r21
	addu	 r4,r31,88
	bsr.n	 _recog
	st	 r20,r24,4
	bcnd	 lt0,r2,@L28
	st.b	 r16,r25,r19
@L28:
	addu	 r22,r22,1
	cmp	 r13,r22,63
	bb0	 le,r13,@L25
	ld.b	 r13,r25,r17
@L39:
	bcnd.n	 eq0,r13,@L40
	or.u	 r13,r0,hi16(_hard_regno_mode_ok)
	ld.b	 r13,r25,r19
	bcnd.n	 eq0,r13,@L29
	or.u	 r13,r0,hi16(_hard_regno_mode_ok)
@L25:
	or.u	 r13,r0,hi16(_movstr_optab)
	or	 r23,r13,lo16(_movstr_optab)
	or	 r13,r0,210
	st	 r13,r23[r25]
	addu	 r25,r25,1
	cmp	 r13,r25,20
	bb1.n	 le,r13,@L41
	cmp	 r13,r25,0
	bsr	 _end_sequence
	or	 r13,r0,77
	st	 r13,r23,16
@Lte0:
	ld	 r1,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	jmp.n	 r1
	addu	 r31,r31,96

	align	 8
	global	 _init_expr
_init_expr:
	subu	 r31,r31,48
	st	 r1,r31,36
@Ltb1:
	bsr	 _init_queue
@Lte1:
	ld	 r1,r31,36
	or.u	 r13,r0,hi16(_pending_stack_adjust)
	st	 r0,r13,lo16(_pending_stack_adjust)
	or.u	 r13,r0,hi16(_inhibit_defer_pop)
	st	 r0,r13,lo16(_inhibit_defer_pop)
	or.u	 r13,r0,hi16(_cleanups_this_call)
	st	 r0,r13,lo16(_cleanups_this_call)
	or.u	 r13,r0,hi16(_saveregs_value)
	st	 r0,r13,lo16(_saveregs_value)
	or.u	 r13,r0,hi16(_forced_labels)
	addu	 r31,r31,48
	jmp.n	 r1
	st	 r0,r13,lo16(_forced_labels)

	align	 8
	global	 _save_expr_status
_save_expr_status:
	subu	 r31,r31,48
	st	 r25,r31,32
	st	 r1,r31,36
@Ltb2:
	bsr.n	 _emit_queue
	or	 r25,r0,r2
	or.u	 r5,r0,hi16(_pending_stack_adjust)
	or.u	 r4,r0,hi16(_inhibit_defer_pop)
	ld	 r9,r5,lo16(_pending_stack_adjust)
	or.u	 r6,r0,hi16(_cleanups_this_call)
	ld	 r10,r4,lo16(_inhibit_defer_pop)
	or.u	 r7,r0,hi16(_saveregs_value)
	ld	 r11,r6,lo16(_cleanups_this_call)
	or.u	 r8,r0,hi16(_forced_labels)
	ld	 r13,r7,lo16(_saveregs_value)
	ld	 r12,r8,lo16(_forced_labels)
	st	 r9,r25,212
	st	 r10,r25,216
	st	 r11,r25,220
	st	 r13,r25,224
	st	 r12,r25,228
@Lte2:
	ld	 r1,r31,36
	ld	 r25,r31,32
	st	 r0,r5,lo16(_pending_stack_adjust)
	st	 r0,r4,lo16(_inhibit_defer_pop)
	st	 r0,r6,lo16(_cleanups_this_call)
	st	 r0,r7,lo16(_saveregs_value)
	addu	 r31,r31,48
	jmp.n	 r1
	st	 r0,r8,lo16(_forced_labels)

	align	 8
	global	 _restore_expr_status
_restore_expr_status:
@Ltb3:
	ld	 r8,r2,212
	or.u	 r9,r0,hi16(_pending_stack_adjust)
	st	 r8,r9,lo16(_pending_stack_adjust)
	ld	 r8,r2,216
	or.u	 r9,r0,hi16(_inhibit_defer_pop)
	st	 r8,r9,lo16(_inhibit_defer_pop)
	ld	 r8,r2,220
	or.u	 r9,r0,hi16(_cleanups_this_call)
	st	 r8,r9,lo16(_cleanups_this_call)
	ld	 r8,r2,224
	or.u	 r9,r0,hi16(_saveregs_value)
	st	 r8,r9,lo16(_saveregs_value)
	ld	 r8,r2,228
	or.u	 r9,r0,hi16(_forced_labels)
	jmp.n	 r1
	st	 r8,r9,lo16(_forced_labels)
@Lte3:

	align	 8
	global	 _protect_from_queue
_protect_from_queue:
	subu	 r31,r31,64
	st	 r1,r31,48
	st.d	 r24,r31,40
	or	 r24,r0,r2
	st	 r23,r31,36
@Ltb4:
	ld.hu	 r11,r0,r24
	cmp	 r13,r11,59
	bb0.n	 ne,r13,@L59
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L68
	cmp	 r13,r11,63
	ld.bu	 r13,r24,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L60
	ld	 r23,r24,4
	ld.hu	 r13,r0,r23
	cmp	 r12,r3,0
	cmp	 r13,r13,59
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L60
	ld	 r13,r23,4
	st	 r13,r24,4
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L63
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r24,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r24
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	br.n	 @L67
	or	 r2,r0,r25
	align	 4
@L60:
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L62
	cmp	 r13,r11,63
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L63
	st	 r2,r24,4
	align	 4
@L62:
@L68:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L63
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,4
	ld	 r2,r24,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,8
@L63:
	br.n	 @L67
	or	 r2,r0,r24
	align	 4
@L59:
	ld	 r13,r24,8
	bcnd	 ne0,r13,@L65
	ld	 r2,r24,4
	br	 @L67
	align	 4
@L65:
	ld	 r2,r24,12
	bcnd	 ne0,r2,@L67
	ld	 r13,r24,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r24,4
	bsr.n	 _gen_move_insn
	st	 r2,r24,12
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	ld	 r2,r24,12
@L67:
@Lte4:
	ld	 r1,r31,48
	ld	 r23,r31,36
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
_queued_subexp_p:
	subu	 r31,r31,64
	st.d	 r24,r31,40
	or	 r25,r0,r2
	st	 r1,r31,48
@Ltb5:
	ld.hu	 r12,r0,r25
	cmp	 r13,r12,64
	bb0.n	 ls,r13,@L92
	cmp	 r13,r12,63
	bb0.n	 lo,r13,@L87
	cmp	 r13,r12,55
	bb0.n	 ne,r13,@L84
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L93
	or	 r2,r0,1
	br.n	 @L93
	or	 r2,r0,0
	align	 4
@L92:
	cmp	 r13,r12,66
	bb0.n	 ne,r13,@L87
	or	 r2,r0,0
	br	 @L93
	align	 4
@L84:
	ld	 r2,r25,4
	bsr.n	 _queued_subexp_p
	addu	 r1,r1,@L94
@L95:
	align	 4
@L87:
	ld	 r2,r25,4
	bsr.n	 _queued_subexp_p
	or	 r24,r0,0
	bcnd	 ne0,r2,@L89
	bsr.n	 _queued_subexp_p
	ld	 r2,r25,8
	bcnd.n	 eq0,r2,@L93
	or	 r2,r0,r24
@L89:
	or	 r24,r0,1
	or	 r2,r0,r24
@L93:
@Lte5:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64
	def	 @L94,@L93-@L95

	align	 8
	global	 _emit_queue
_emit_queue:
	subu	 r31,r31,64
	or.u	 r13,r0,hi16(_pending_chain)
	st.d	 r24,r31,40
	ld	 r25,r13,lo16(_pending_chain)
	bcnd.n	 eq0,r25,@L103
	st	 r1,r31,48
@Ltb6:
	or	 r24,r0,r13
@L104:
	bsr.n	 _emit_insn
	ld	 r2,r25,16
	ld	 r13,r25,20
	st	 r2,r25,8
	or	 r25,r0,r13
	bcnd.n	 ne0,r25,@L104
	st	 r25,r24,lo16(_pending_chain)
@L103:
@Lte6:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
_init_queue:
	or.u	 r13,r0,hi16(_pending_chain)
	ld	 r13,r13,lo16(_pending_chain)
	subu	 r31,r31,48
	bcnd.n	 eq0,r13,@L110
	st	 r1,r31,36
@Ltb7:
	bsr	 _abort
	align	 4
@L110:
@Lte7:
	ld	 r1,r31,36
	jmp.n	 r1
	addu	 r31,r31,48

	align	 8
	global	 _convert_move
_convert_move:
	subu	 r31,r31,96
	st	 r1,r31,80
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	or.u	 r13,r0,hi16(_mode_class)
	st.d	 r18,r31,48
	or	 r21,r0,r2
	st.d	 r16,r31,40
@Ltb8:
	or	 r23,r0,r3
	ld.bu	 r20,r21,2
	or	 r13,r13,lo16(_mode_class)
	ld.bu	 r22,r23,2
	ld	 r12,r13[r20]
	ld	 r13,r13[r22]
	or	 r19,r0,r4
	cmp	 r12,r12,2
	cmp	 r13,r13,2
	extu	 r18,r12,1<eq>
	or	 r17,r0,99
	bcnd.n	 eq0,r19,@L224
	extu	 r16,r13,1<eq>
	or	 r17,r0,100
@L224:
	ld.hu	 r12,r0,r21
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L227
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L230
	cmp	 r13,r12,63
	ld	 r2,r21,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L231
	st	 r2,r21,4
	align	 4
@L230:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L231
	ld	 r2,r21,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r21,4
	ld	 r2,r21,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r21,8
@L231:
	br.n	 @L226
	or	 r2,r0,r21
	align	 4
@L227:
	ld	 r13,r21,8
	bcnd	 ne0,r13,@L233
	ld	 r2,r21,4
	br	 @L226
	align	 4
@L233:
	ld	 r2,r21,12
	bcnd	 ne0,r2,@L226
	ld	 r13,r21,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r21,4
	bsr.n	 _gen_move_insn
	st	 r2,r21,12
	bsr.n	 _emit_insn_before
	ld	 r3,r21,8
	ld	 r2,r21,12
@L226:
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L236
	or	 r21,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L376
	cmp	 r13,r12,63
	ld.bu	 r13,r23,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L237
	ld	 r24,r23,4
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L237
	ld	 r13,r24,4
	st	 r13,r23,4
	ld	 r13,r24,8
	bcnd	 eq0,r13,@L240
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r23,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r23
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	br.n	 @L235
	or	 r2,r0,r25
	align	 4
@L237:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L239
	cmp	 r13,r12,63
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L240
	st	 r2,r23,4
	align	 4
@L239:
@L376:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L240
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,4
	ld	 r2,r23,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,8
@L240:
	br.n	 @L235
	or	 r2,r0,r23
	align	 4
@L236:
	ld	 r13,r23,8
	bcnd	 ne0,r13,@L242
	ld	 r2,r23,4
	br.n	 @L377
	cmp	 r13,r18,r16
	align	 4
@L242:
	ld	 r2,r23,12
	bcnd.n	 ne0,r2,@L377
	cmp	 r13,r18,r16
	ld	 r13,r23,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r23,4
	bsr.n	 _gen_move_insn
	st	 r2,r23,12
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	ld	 r2,r23,12
@L235:
	cmp	 r13,r18,r16
@L377:
	bb0.n	 ne,r13,@L244
	or	 r23,r0,r2
	bsr	 _abort
	align	 4
@L244:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	ld	 r11,r0,r23
	and	 r13,r11,0x8
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L378
	ld	 r13,r23,4
	or.u	 r12,r0,hi16(_mode_size)
	ld.bu	 r13,r13,2
	or	 r12,r12,lo16(_mode_size)
	ld	 r13,r12[r13]
	ld	 r12,r12[r20]
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L245
	extu	 r13,r11,1<5>
	cmp	 r13,r13,r19
	bb1.n	 ne,r13,@L245
	or	 r2,r0,r20
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	or	 r22,r0,r20
	or	 r23,r0,r2
@L245:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
@L378:
	ld	 r13,r0,r21
	and	 r13,r13,0x8
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L246
	cmp	 r13,r20,r22
	bsr	 _abort
	align	 4
@L246:
	bb0.n	 ne,r13,@L379
	or	 r2,r0,r21
	bcnd	 ne0,r22,@L247
	ld.hu	 r12,r0,r23
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L379
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L379
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L247
@L379:
	or	 r3,r0,r23
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L390
@L391:
	align	 4
@L247:
	bcnd.n	 eq0,r18,@L249
	cmp	 r5,r22,8
	cmp	 r13,r20,9
	extu	 r11,r5,1<eq>
	extu	 r7,r13,1<eq>
	and	 r13,r11,r7
	bcnd.n	 ne0,r13,@L370
	or	 r2,r0,108
	cmp	 r6,r20,11
	extu	 r12,r6,1<eq>
	and	 r13,r11,r12
	bcnd.n	 ne0,r13,@L370
	or	 r2,r0,109
	cmp	 r8,r22,9
	extu	 r9,r8,1<eq>
	and	 r13,r9,r12
	bcnd.n	 eq0,r13,@L252
	cmp	 r4,r20,11
	br.n	 @L370
	or	 r2,r0,110
	align	 4
@L252:
	cmp	 r10,r20,8
	extu	 r11,r10,1<eq>
	and	 r13,r9,r11
	bcnd.n	 ne0,r13,@L370
	or	 r2,r0,111
	cmp	 r9,r22,11
	extu	 r12,r9,1<eq>
	and	 r13,r12,r11
	bcnd.n	 ne0,r13,@L370
	or	 r2,r0,112
	and	 r13,r12,r7
	bcnd.n	 eq0,r13,@L255
	cmp	 r12,r20,9
	or	 r2,r0,113
@L370:
	or	 r3,r0,r21
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L392
@L393:
	align	 4
@L255:
	bb0.n	 ne,r8,@L265
	or	 r2,r0,0
	bb0.n	 ls,r8,@L287
	cmp	 r13,r22,10
	bb0.n	 ne,r5,@L257
	cmp	 r13,r20,10
	br	 @L256
	align	 4
@L287:
	bb0	 ne,r13,@L273
	bb0	 ne,r9,@L279
	br	 @L256
	align	 4
@L257:
	bb0	 ne,r13,@L260
	bb0	 ls,r13,@L264
	bb0.n	 ne,r12,@L259
	or.u	 r13,r0,hi16(_extendsfdf2_libfunc)
	br	 @L256
	align	 4
@L264:
	bb0.n	 ne,r4,@L261
	or.u	 r13,r0,hi16(_extendsftf2_libfunc)
	br	 @L256
	align	 4
@L259:
	ld	 r2,r13,lo16(_extendsfdf2_libfunc)
	br	 @L256
	align	 4
@L260:
	or.u	 r13,r0,hi16(_extendsfxf2_libfunc)
	ld	 r2,r13,lo16(_extendsfxf2_libfunc)
	br	 @L256
	align	 4
@L261:
	ld	 r2,r13,lo16(_extendsftf2_libfunc)
	br	 @L256
	align	 4
@L265:
	cmp	 r13,r20,10
	bb0	 ne,r13,@L268
	bb0	 ls,r13,@L272
	bb0.n	 ne,r10,@L267
	or.u	 r13,r0,hi16(_truncdfsf2_libfunc)
	br	 @L256
	align	 4
@L272:
	bb0.n	 ne,r6,@L269
	or.u	 r13,r0,hi16(_extenddftf2_libfunc)
	br	 @L256
	align	 4
@L267:
	ld	 r2,r13,lo16(_truncdfsf2_libfunc)
	br	 @L256
	align	 4
@L268:
	or.u	 r13,r0,hi16(_extenddfxf2_libfunc)
	ld	 r2,r13,lo16(_extenddfxf2_libfunc)
	br	 @L256
	align	 4
@L269:
	ld	 r2,r13,lo16(_extenddftf2_libfunc)
	br	 @L256
	align	 4
@L273:
	bb0.n	 ne,r10,@L275
	or.u	 r13,r0,hi16(_truncxfsf2_libfunc)
	bb0.n	 ne,r12,@L276
	or.u	 r13,r0,hi16(_truncxfdf2_libfunc)
	br	 @L256
	align	 4
@L275:
	ld	 r2,r13,lo16(_truncxfsf2_libfunc)
	br	 @L256
	align	 4
@L276:
	ld	 r2,r13,lo16(_truncxfdf2_libfunc)
	br	 @L256
	align	 4
@L279:
	bb0.n	 ne,r10,@L281
	or.u	 r13,r0,hi16(_trunctfsf2_libfunc)
	bb0.n	 ne,r12,@L282
	or.u	 r13,r0,hi16(_trunctfdf2_libfunc)
	br	 @L256
	align	 4
@L281:
	ld	 r2,r13,lo16(_trunctfsf2_libfunc)
	br	 @L256
	align	 4
@L282:
	ld	 r2,r13,lo16(_trunctfdf2_libfunc)
@L256:
	bcnd.n	 ne0,r2,@L288
	or	 r3,r0,1
	bsr	 _abort
	align	 4
@L288:
	or	 r4,r0,r20
	or	 r5,r0,1
	or	 r6,r0,r23
	bsr.n	 _emit_library_call
	or	 r7,r0,r22
	or	 r2,r0,r20
	bsr.n	 _hard_libcall_value
	addu	 r1,r1,@L394
@L395:
	align	 4
@L249:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r24,r13,lo16(_mode_size)
	ld	 r13,r24[r22]
	ld	 r12,r24[r20]
	mak	 r13,r13,0<3>
	mak	 r11,r12,0<3>
	cmp	 r13,r13,r11
	bb1.n	 ge,r13,@L380
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r11,32
	bb0.n	 gt,r13,@L289
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L290
	addu	 r13,r12,6
@L290:
	or	 r2,r0,r20
	or	 r3,r0,r22
	or	 r4,r0,r19
	bsr.n	 _can_extend_p
	ext	 r18,r13,0<2>
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb1.n	 ne,r13,@L381
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r24[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L293
	or.u	 r24,r0,hi16(_word_mode)
	or	 r2,r0,r20
	ld	 r3,r24,lo16(_word_mode)
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0	 ne,r13,@L293
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r21
	or	 r3,r0,r23
	bsr.n	 _convert_move
	or	 r4,r0,r19
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r21
	or	 r4,r0,r2
	or	 r2,r0,r25
	br.n	 @L372
	or	 r3,r0,r21
	align	 4
@L293:
	bsr	 _start_sequence
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L295
	or	 r25,r0,r22
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r25,r13,lo16(_word_mode)
	br.n	 @L382
	or	 r2,r0,r25
	align	 4
@L295:
	or	 r2,r0,r25
@L382:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
	or	 r24,r0,r2
	or	 r2,r0,r25
	bsr.n	 _gen_lowpart
	or	 r3,r0,r21
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
	bcnd.n	 eq0,r19,@L299
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r24,r13,lo16(_const0_rtx)
	br.n	 @L383
	or.u	 r13,r0,hi16(_mode_size)
	align	 4
@L299:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r2,r13[r25]
	mak	 r2,r2,0<3>
	bsr.n	 _size_int
	subu	 r2,r2,1
	or	 r5,r0,r2
	or	 r2,r0,78
	or	 r3,r0,r25
	or	 r4,r0,r24
	or	 r6,r0,0
	bsr.n	 _expand_shift
	or	 r7,r0,0
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_word_mode)
	or	 r4,r0,1
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _convert_to_mode
	or	 r3,r0,r24
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_mode_size)
@L383:
	or	 r13,r13,lo16(_mode_size)
	ld	 r2,r13[r25]
	bcnd	 ge0,r2,@L301
	addu	 r2,r2,3
@L301:
	ext	 r22,r2,0<2>
	cmp	 r13,r22,r18
	bb0.n	 lt,r13,@L303
	subu	 r13,r18,r22
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L305
	subu	 r25,r18,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L339
	cmp	 r13,r12,2
	bb0.n	 gt,r13,@L340
	or	 r2,r0,r21
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r20
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L344
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L344:
	bb1	 eq,r13,@L342
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L342:
	addu	 r22,r22,1
@L340:
	or	 r2,r0,r21
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r20
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L348
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L348:
	bb1	 eq,r13,@L346
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L346:
	addu	 r22,r22,1
@L339:
	or	 r2,r0,r21
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r20
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L352
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L352:
	bb1	 eq,r13,@L350
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L350:
	addu	 r22,r22,1
	cmp	 r13,r22,r18
	bb0	 lt,r13,@L303
@L305:
	or	 r2,r0,r21
@L384:
	subu	 r3,r25,1
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r20
	bcnd.n	 ne0,r2,@L356
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L356:
	bb1	 eq,r13,@L354
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L354:
	or	 r2,r0,r21
	subu	 r3,r25,2
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r20
	bcnd.n	 ne0,r2,@L360
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L360:
	bb1	 eq,r13,@L358
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L358:
	or	 r2,r0,r21
	subu	 r3,r25,3
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r20
	bcnd.n	 ne0,r2,@L364
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L364:
	bb1	 eq,r13,@L362
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L362:
	or	 r2,r0,r21
	or	 r4,r0,1
	subu	 r25,r25,4
	or	 r5,r0,r20
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L368
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L368:
	bb1	 eq,r13,@L366
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L366:
	addu	 r22,r22,4
	cmp	 r13,r22,r18
	bb1.n	 lt,r13,@L384
	or	 r2,r0,r21
@L303:
	bsr	 _get_insns
	bsr.n	 _end_sequence
	or	 r25,r0,r2
	or	 r2,r0,r17
	or	 r3,r0,r20
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r6,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,r21
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_no_conflict_block
	addu	 r1,r1,@L396
@L397:
	align	 4
@L289:
	or.u	 r13,r0,hi16(_mode_size)
@L380:
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,32
	bb0.n	 gt,r13,@L309
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	or	 r2,r0,r21
	br.n	 @L373
	or	 r4,r0,0
	align	 4
@L309:
	cmp	 r13,r20,3
	bb1.n	 ne,r13,@L310
	cmp	 r13,r22,3
	cmp	 r13,r22,4
	bb0.n	 ne,r13,@L311
	or	 r2,r0,4
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
@L311:
	bsr	 _abort
	align	 4
@L310:
	bb1.n	 ne,r13,@L385
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r20,4
	bb0.n	 ne,r13,@L313
	or	 r2,r0,4
	or	 r3,r0,r23
	or	 r4,r0,r19
	bsr.n	 _convert_to_mode
	or	 r22,r0,4
	br.n	 @L312
	or	 r23,r0,r2
	align	 4
@L313:
	bsr	 _abort
	align	 4
@L312:
	or.u	 r13,r0,hi16(_mode_size)
@L385:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r20]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb1.n	 ge,r12,@L386
	or.u	 r13,r0,hi16(_mode_size)
	ld	 r13,r0,r23
	or.u	 r12,r0,0x37
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L317
	or.u	 r13,r0,hi16(_direct_load)
	or	 r13,r13,lo16(_direct_load)
	ld.b	 r13,r20,r13
	bcnd	 eq0,r13,@L317
	bsr.n	 _mode_dependent_address_p
	ld	 r2,r23,4
	bcnd.n	 eq0,r2,@L387
	or	 r2,r0,r20
@L317:
	ld.hu	 r13,r0,r23
	cmp	 r12,r13,51
	cmp	 r13,r13,53
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L315
	or	 r2,r0,r20
@L387:
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	addu	 r1,r1,@L398
@L399:
	align	 4
@L315:
	or.u	 r13,r0,hi16(_mode_size)
@L386:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r20]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb0.n	 gt,r12,@L318
	or	 r2,r0,r20
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0.n	 ne,r13,@L319
	or.u	 r13,r0,hi16(_optimize)
@L381:
	ld	 r13,r13,lo16(_optimize)
	bcnd	 le0,r13,@L320
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L388
	or	 r2,r0,r25
	or	 r2,r0,r22
	bsr.n	 _force_reg
	or	 r3,r0,r23
	or	 r23,r0,r2
@L320:
	or	 r2,r0,r25
@L388:
	or	 r3,r0,r21
	or	 r4,r0,r23
@L372:
	or	 r5,r0,r17
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L400
@L401:
	align	 4
@L319:
	or	 r25,r0,r22
	bcnd.n	 eq0,r25,@L323
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r24,r13,lo16(_mode_wider_mode)
	or	 r2,r0,r20
@L389:
	or	 r3,r0,r25
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	cmp	 r2,r2,210
	bb1.n	 eq,r2,@L324
	or	 r2,r0,r25
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	cmp	 r2,r2,210
	bb0.n	 eq,r2,@L335
	or	 r2,r0,r25
@L324:
	ld	 r25,r24[r25]
	bcnd.n	 ne0,r25,@L389
	or	 r2,r0,r20
@L323:
	bsr	 _abort
	align	 4
@L318:
	cmp	 r13,r22,6
	extu	 r11,r13,1<eq>
	cmp	 r13,r20,4
	extu	 r13,r13,1<eq>
	and	 r13,r11,r13
	bcnd.n	 eq0,r13,@L328
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L402
@L403:
	align	 4
@L328:
	cmp	 r13,r20,2
	extu	 r9,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L329
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L404
@L405:
	align	 4
@L329:
	cmp	 r13,r20,1
	extu	 r10,r13,1<eq>
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L330
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L406
@L407:
	align	 4
@L330:
	cmp	 r13,r22,4
	extu	 r11,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L331
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L408
@L409:
	align	 4
@L331:
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L332
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L410
@L411:
	align	 4
@L332:
	cmp	 r13,r22,2
	extu	 r13,r13,1<eq>
	and	 r13,r13,r10
	bcnd.n	 eq0,r13,@L333
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L412
@L413:
	align	 4
@L333:
	bb1.n	 ge,r12,@L334
	or	 r2,r0,r20
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	bsr.n	 _force_reg
	or	 r2,r0,r20
@L371:
	or	 r3,r0,r2
	or	 r2,r0,r21
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L414
@L415:
	align	 4
@L334:
	bsr	 _abort
	align	 4
@L335:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
@L374:
	or	 r3,r0,r2
	or	 r2,r0,r21
	or	 r4,r0,r19
@L373:
	bsr	 _convert_move
@L223:
@Lte8:
	ld	 r1,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	jmp.n	 r1
	addu	 r31,r31,96
	def	 @L414,@L223-@L415
	def	 @L412,@L374-@L413
	def	 @L410,@L374-@L411
	def	 @L408,@L374-@L409
	def	 @L406,@L374-@L407
	def	 @L404,@L374-@L405
	def	 @L402,@L374-@L403
	def	 @L400,@L223-@L401
	def	 @L398,@L371-@L399
	def	 @L396,@L223-@L397
	def	 @L394,@L371-@L395
	def	 @L392,@L223-@L393
	def	 @L390,@L223-@L391

	align	 8
	global	 _convert_to_mode
_convert_to_mode:
	subu	 r31,r31,96
	st	 r1,r31,80
	st	 r15,r31,36
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	st.d	 r18,r31,48
	or	 r25,r0,r3
	st.d	 r16,r31,40
@Ltb9:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	ld	 r11,r0,r25
	and	 r13,r11,0x8
	or	 r24,r0,r2
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L536
	or	 r19,r0,r4
	ld	 r13,r25,4
	or.u	 r12,r0,hi16(_mode_size)
	ld.bu	 r13,r13,2
	or	 r12,r12,lo16(_mode_size)
	ld	 r13,r12[r13]
	ld	 r12,r12[r24]
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L536
	extu	 r13,r11,1<5>
	cmp	 r13,r13,r19
	bb1	 ne,r13,@L536
	bsr	 _gen_lowpart
	or	 r25,r0,r2
@L536:
	ld.bu	 r13,r25,2
	cmp	 r13,r24,r13
	bb0.n	 ne,r13,@L654
	or	 r2,r0,r25
	bcnd.n	 eq0,r19,@L538
	or.u	 r13,r0,hi16(_mode_class)
	or	 r13,r13,lo16(_mode_class)
	ld	 r13,r13[r24]
	cmp	 r13,r13,1
	bb1.n	 ne,r13,@L538
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r24]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,64
	bb1	 ne,r13,@L538
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb1	 ne,r13,@L655
	ld	 r2,r25,4
	bcnd.n	 ge0,r2,@L538
	or	 r3,r0,0
	or	 r4,r0,r24
	bsr.n	 _immed_double_const
	addu	 r1,r1,@L715
@L716:
	align	 4
@L538:
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb0.n	 ne,r13,@L697
	or	 r2,r0,r24
@L655:
	or.u	 r13,r0,hi16(_mode_class)
	or	 r12,r13,lo16(_mode_class)
	ld	 r13,r12[r24]
	cmp	 r13,r13,1
	bb1.n	 ne,r13,@L698
	or	 r2,r0,r24
	ld.bu	 r11,r25,2
	ld	 r13,r12[r11]
	cmp	 r13,r13,1
	bb1	 ne,r13,@L698
	ld.hu	 r10,r0,r25
	cmp	 r13,r10,47
	bb0.n	 ne,r13,@L697
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r24]
	ld	 r13,r13[r11]
	cmp	 r12,r12,r13
	bb1	 gt,r12,@L698
	ld	 r13,r0,r25
	or.u	 r12,r0,0x37
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L699
	cmp	 r13,r10,51
	or.u	 r13,r0,hi16(_direct_load)
	or	 r13,r13,lo16(_direct_load)
	ld.b	 r13,r24,r13
	bcnd.n	 ne0,r13,@L700
	or	 r3,r0,r25
	cmp	 r13,r10,51
@L699:
	bb1.n	 ne,r13,@L539
	or	 r2,r0,r24
@L697:
	or	 r3,r0,r25
@L700:
	bsr.n	 _gen_lowpart
	addu	 r1,r1,@L717
@L718:
	align	 4
@L539:
@L698:
	bsr.n	 _gen_reg_rtx
	or	 r23,r0,r25
	ld.bu	 r22,r23,2
	or	 r17,r0,r2
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r21,r17,2
	or	 r13,r13,lo16(_mode_class)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	or	 r16,r0,99
	cmp	 r12,r12,2
	cmp	 r13,r13,2
	extu	 r18,r12,1<eq>
	or	 r20,r0,r17
	bcnd.n	 eq0,r19,@L543
	extu	 r15,r13,1<eq>
	or	 r16,r0,100
@L543:
	ld.hu	 r12,r0,r17
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L546
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L549
	cmp	 r13,r12,63
	ld	 r2,r17,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L550
	st	 r2,r17,4
	align	 4
@L549:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L550
	ld	 r2,r20,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r20,4
	ld	 r2,r20,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r20,8
@L550:
	br.n	 @L545
	or	 r2,r0,r20
	align	 4
@L546:
	ld	 r13,r17,8
	bcnd	 ne0,r13,@L552
	ld	 r2,r17,4
	br	 @L545
	align	 4
@L552:
	ld	 r2,r17,12
	bcnd	 ne0,r2,@L545
	ld	 r13,r17,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r17,4
	bsr.n	 _gen_move_insn
	st	 r2,r17,12
	bsr.n	 _emit_insn_before
	ld	 r3,r17,8
	ld	 r2,r17,12
@L545:
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L555
	or	 r20,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L701
	cmp	 r13,r12,63
	ld.bu	 r13,r23,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L556
	ld	 r24,r23,4
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L556
	ld	 r13,r24,4
	st	 r13,r23,4
	ld	 r13,r24,8
	bcnd	 eq0,r13,@L559
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r23,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r23
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	br.n	 @L554
	or	 r2,r0,r25
	align	 4
@L556:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L558
	cmp	 r13,r12,63
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L559
	st	 r2,r23,4
	align	 4
@L558:
@L701:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L559
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,4
	ld	 r2,r23,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,8
@L559:
	br.n	 @L554
	or	 r2,r0,r23
	align	 4
@L555:
	ld	 r13,r23,8
	bcnd	 ne0,r13,@L561
	ld	 r2,r23,4
	br.n	 @L702
	cmp	 r13,r18,r15
	align	 4
@L561:
	ld	 r2,r23,12
	bcnd.n	 ne0,r2,@L702
	cmp	 r13,r18,r15
	ld	 r13,r23,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r23,4
	bsr.n	 _gen_move_insn
	st	 r2,r23,12
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	ld	 r2,r23,12
@L554:
	cmp	 r13,r18,r15
@L702:
	bb0.n	 ne,r13,@L563
	or	 r23,r0,r2
	bsr	 _abort
	align	 4
@L563:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	ld	 r11,r0,r23
	and	 r13,r11,0x8
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L703
	ld	 r13,r23,4
	or.u	 r12,r0,hi16(_mode_size)
	ld.bu	 r13,r13,2
	or	 r12,r12,lo16(_mode_size)
	ld	 r13,r12[r13]
	ld	 r12,r12[r21]
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L564
	extu	 r13,r11,1<5>
	cmp	 r13,r13,r19
	bb1.n	 ne,r13,@L564
	or	 r2,r0,r21
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	or	 r22,r0,r21
	or	 r23,r0,r2
@L564:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
@L703:
	ld	 r13,r0,r20
	and	 r13,r13,0x8
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L565
	cmp	 r13,r21,r22
	bsr	 _abort
	align	 4
@L565:
	bb0.n	 ne,r13,@L704
	or	 r2,r0,r20
	bcnd	 ne0,r22,@L566
	ld.hu	 r12,r0,r23
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L704
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L704
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L566
@L704:
	or	 r3,r0,r23
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L719
@L720:
	align	 4
@L566:
	bcnd.n	 eq0,r18,@L568
	cmp	 r5,r22,8
	cmp	 r13,r21,9
	extu	 r11,r5,1<eq>
	extu	 r7,r13,1<eq>
	and	 r13,r11,r7
	bcnd.n	 ne0,r13,@L691
	or	 r2,r0,108
	cmp	 r6,r21,11
	extu	 r12,r6,1<eq>
	and	 r13,r11,r12
	bcnd.n	 ne0,r13,@L691
	or	 r2,r0,109
	cmp	 r8,r22,9
	extu	 r9,r8,1<eq>
	and	 r13,r9,r12
	bcnd.n	 eq0,r13,@L571
	cmp	 r4,r21,11
	br.n	 @L691
	or	 r2,r0,110
	align	 4
@L571:
	cmp	 r10,r21,8
	extu	 r11,r10,1<eq>
	and	 r13,r9,r11
	bcnd.n	 ne0,r13,@L691
	or	 r2,r0,111
	cmp	 r9,r22,11
	extu	 r12,r9,1<eq>
	and	 r13,r12,r11
	bcnd.n	 ne0,r13,@L691
	or	 r2,r0,112
	and	 r13,r12,r7
	bcnd.n	 eq0,r13,@L574
	cmp	 r12,r21,9
	or	 r2,r0,113
@L691:
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L721
@L722:
	align	 4
@L574:
	bb0.n	 ne,r8,@L584
	or	 r2,r0,0
	bb0.n	 ls,r8,@L606
	cmp	 r13,r22,10
	bb0.n	 ne,r5,@L576
	cmp	 r13,r21,10
	br	 @L575
	align	 4
@L606:
	bb0	 ne,r13,@L592
	bb0	 ne,r9,@L598
	br	 @L575
	align	 4
@L576:
	bb0	 ne,r13,@L579
	bb0	 ls,r13,@L583
	bb0.n	 ne,r12,@L578
	or.u	 r13,r0,hi16(_extendsfdf2_libfunc)
	br	 @L575
	align	 4
@L583:
	bb0.n	 ne,r4,@L580
	or.u	 r13,r0,hi16(_extendsftf2_libfunc)
	br	 @L575
	align	 4
@L578:
	ld	 r2,r13,lo16(_extendsfdf2_libfunc)
	br	 @L575
	align	 4
@L579:
	or.u	 r13,r0,hi16(_extendsfxf2_libfunc)
	ld	 r2,r13,lo16(_extendsfxf2_libfunc)
	br	 @L575
	align	 4
@L580:
	ld	 r2,r13,lo16(_extendsftf2_libfunc)
	br	 @L575
	align	 4
@L584:
	cmp	 r13,r21,10
	bb0	 ne,r13,@L587
	bb0	 ls,r13,@L591
	bb0.n	 ne,r10,@L586
	or.u	 r13,r0,hi16(_truncdfsf2_libfunc)
	br	 @L575
	align	 4
@L591:
	bb0.n	 ne,r6,@L588
	or.u	 r13,r0,hi16(_extenddftf2_libfunc)
	br	 @L575
	align	 4
@L586:
	ld	 r2,r13,lo16(_truncdfsf2_libfunc)
	br	 @L575
	align	 4
@L587:
	or.u	 r13,r0,hi16(_extenddfxf2_libfunc)
	ld	 r2,r13,lo16(_extenddfxf2_libfunc)
	br	 @L575
	align	 4
@L588:
	ld	 r2,r13,lo16(_extenddftf2_libfunc)
	br	 @L575
	align	 4
@L592:
	bb0.n	 ne,r10,@L594
	or.u	 r13,r0,hi16(_truncxfsf2_libfunc)
	bb0.n	 ne,r12,@L595
	or.u	 r13,r0,hi16(_truncxfdf2_libfunc)
	br	 @L575
	align	 4
@L594:
	ld	 r2,r13,lo16(_truncxfsf2_libfunc)
	br	 @L575
	align	 4
@L595:
	ld	 r2,r13,lo16(_truncxfdf2_libfunc)
	br	 @L575
	align	 4
@L598:
	bb0.n	 ne,r10,@L600
	or.u	 r13,r0,hi16(_trunctfsf2_libfunc)
	bb0.n	 ne,r12,@L601
	or.u	 r13,r0,hi16(_trunctfdf2_libfunc)
	br	 @L575
	align	 4
@L600:
	ld	 r2,r13,lo16(_trunctfsf2_libfunc)
	br	 @L575
	align	 4
@L601:
	ld	 r2,r13,lo16(_trunctfdf2_libfunc)
@L575:
	bcnd.n	 ne0,r2,@L607
	or	 r3,r0,1
	bsr	 _abort
	align	 4
@L607:
	or	 r4,r0,r21
	or	 r5,r0,1
	or	 r6,r0,r23
	bsr.n	 _emit_library_call
	or	 r7,r0,r22
	or	 r2,r0,r21
	bsr.n	 _hard_libcall_value
	addu	 r1,r1,@L723
@L724:
	align	 4
@L568:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r24,r13,lo16(_mode_size)
	ld	 r13,r24[r22]
	ld	 r12,r24[r21]
	mak	 r13,r13,0<3>
	mak	 r11,r12,0<3>
	cmp	 r13,r13,r11
	bb1.n	 ge,r13,@L705
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r11,32
	bb0.n	 gt,r13,@L608
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L609
	addu	 r13,r12,6
@L609:
	or	 r2,r0,r21
	or	 r3,r0,r22
	or	 r4,r0,r19
	bsr.n	 _can_extend_p
	ext	 r18,r13,0<2>
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb1.n	 ne,r13,@L706
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r24[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L612
	or.u	 r24,r0,hi16(_word_mode)
	or	 r2,r0,r21
	ld	 r3,r24,lo16(_word_mode)
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0	 ne,r13,@L612
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r3,r0,r23
	bsr.n	 _convert_move
	or	 r4,r0,r19
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r4,r0,r2
	or	 r2,r0,r25
	br.n	 @L693
	or	 r3,r0,r20
	align	 4
@L612:
	bsr	 _start_sequence
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L614
	or	 r25,r0,r22
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r25,r13,lo16(_word_mode)
	br.n	 @L707
	or	 r2,r0,r25
	align	 4
@L614:
	or	 r2,r0,r25
@L707:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
	or	 r24,r0,r2
	or	 r2,r0,r25
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
	bcnd.n	 eq0,r19,@L618
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r24,r13,lo16(_const0_rtx)
	br.n	 @L708
	or.u	 r13,r0,hi16(_mode_size)
	align	 4
@L618:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r2,r13[r25]
	mak	 r2,r2,0<3>
	bsr.n	 _size_int
	subu	 r2,r2,1
	or	 r5,r0,r2
	or	 r2,r0,78
	or	 r3,r0,r25
	or	 r4,r0,r24
	or	 r6,r0,0
	bsr.n	 _expand_shift
	or	 r7,r0,0
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_word_mode)
	or	 r4,r0,1
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _convert_to_mode
	or	 r3,r0,r24
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_mode_size)
@L708:
	or	 r13,r13,lo16(_mode_size)
	ld	 r2,r13[r25]
	bcnd	 ge0,r2,@L620
	addu	 r2,r2,3
@L620:
	ext	 r22,r2,0<2>
	cmp	 r13,r22,r18
	bb0.n	 lt,r13,@L622
	subu	 r13,r18,r22
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L624
	subu	 r25,r18,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L660
	cmp	 r13,r12,2
	bb0.n	 gt,r13,@L661
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L665
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L665:
	bb1	 eq,r13,@L663
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L663:
	addu	 r22,r22,1
@L661:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L669
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L669:
	bb1	 eq,r13,@L667
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L667:
	addu	 r22,r22,1
@L660:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L673
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L673:
	bb1	 eq,r13,@L671
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L671:
	addu	 r22,r22,1
	cmp	 r13,r22,r18
	bb0	 lt,r13,@L622
@L624:
	or	 r2,r0,r20
@L709:
	subu	 r3,r25,1
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L677
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L677:
	bb1	 eq,r13,@L675
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L675:
	or	 r2,r0,r20
	subu	 r3,r25,2
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L681
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L681:
	bb1	 eq,r13,@L679
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L679:
	or	 r2,r0,r20
	subu	 r3,r25,3
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L685
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L685:
	bb1	 eq,r13,@L683
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L683:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,4
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L689
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L689:
	bb1	 eq,r13,@L687
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L687:
	addu	 r22,r22,4
	cmp	 r13,r22,r18
	bb1.n	 lt,r13,@L709
	or	 r2,r0,r20
@L622:
	bsr	 _get_insns
	bsr.n	 _end_sequence
	or	 r25,r0,r2
	or	 r2,r0,r16
	or	 r3,r0,r21
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r6,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_no_conflict_block
	addu	 r1,r1,@L725
@L726:
	align	 4
@L608:
	or.u	 r13,r0,hi16(_mode_size)
@L705:
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,32
	bb0.n	 gt,r13,@L628
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	or	 r2,r0,r20
	br.n	 @L694
	or	 r4,r0,0
	align	 4
@L628:
	cmp	 r13,r21,3
	bb1.n	 ne,r13,@L629
	cmp	 r13,r22,3
	cmp	 r13,r22,4
	bb0.n	 ne,r13,@L630
	or	 r2,r0,4
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
@L630:
	bsr	 _abort
	align	 4
@L629:
	bb1.n	 ne,r13,@L710
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r21,4
	bb0.n	 ne,r13,@L632
	or	 r2,r0,4
	or	 r3,r0,r23
	or	 r4,r0,r19
	bsr.n	 _convert_to_mode
	or	 r22,r0,4
	br.n	 @L631
	or	 r23,r0,r2
	align	 4
@L632:
	bsr	 _abort
	align	 4
@L631:
	or.u	 r13,r0,hi16(_mode_size)
@L710:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb1.n	 ge,r12,@L711
	or.u	 r13,r0,hi16(_mode_size)
	ld	 r13,r0,r23
	or.u	 r12,r0,0x37
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L636
	or.u	 r13,r0,hi16(_direct_load)
	or	 r13,r13,lo16(_direct_load)
	ld.b	 r13,r21,r13
	bcnd	 eq0,r13,@L636
	bsr.n	 _mode_dependent_address_p
	ld	 r2,r23,4
	bcnd.n	 eq0,r2,@L712
	or	 r2,r0,r21
@L636:
	ld.hu	 r13,r0,r23
	cmp	 r12,r13,51
	cmp	 r13,r13,53
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L634
	or	 r2,r0,r21
@L712:
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	addu	 r1,r1,@L727
@L728:
	align	 4
@L634:
	or.u	 r13,r0,hi16(_mode_size)
@L711:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb0.n	 gt,r12,@L637
	or	 r2,r0,r21
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0.n	 ne,r13,@L638
	or.u	 r13,r0,hi16(_optimize)
@L706:
	ld	 r13,r13,lo16(_optimize)
	bcnd	 le0,r13,@L639
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L713
	or	 r2,r0,r25
	or	 r2,r0,r22
	bsr.n	 _force_reg
	or	 r3,r0,r23
	or	 r23,r0,r2
@L639:
	or	 r2,r0,r25
@L713:
	or	 r3,r0,r20
	or	 r4,r0,r23
@L693:
	or	 r5,r0,r16
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L729
@L730:
	align	 4
@L638:
	or	 r25,r0,r22
	bcnd.n	 eq0,r25,@L642
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r24,r13,lo16(_mode_wider_mode)
	or	 r2,r0,r21
@L714:
	or	 r3,r0,r25
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	cmp	 r2,r2,210
	bb1.n	 eq,r2,@L643
	or	 r2,r0,r25
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	cmp	 r2,r2,210
	bb0.n	 eq,r2,@L656
	or	 r2,r0,r25
@L643:
	ld	 r25,r24[r25]
	bcnd.n	 ne0,r25,@L714
	or	 r2,r0,r21
@L642:
	bsr	 _abort
	align	 4
@L637:
	cmp	 r13,r22,6
	extu	 r11,r13,1<eq>
	cmp	 r13,r21,4
	extu	 r13,r13,1<eq>
	and	 r13,r11,r13
	bcnd.n	 eq0,r13,@L647
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L731
@L732:
	align	 4
@L647:
	cmp	 r13,r21,2
	extu	 r9,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L648
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L733
@L734:
	align	 4
@L648:
	cmp	 r13,r21,1
	extu	 r10,r13,1<eq>
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L649
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L735
@L736:
	align	 4
@L649:
	cmp	 r13,r22,4
	extu	 r11,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L650
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L737
@L738:
	align	 4
@L650:
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L651
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L739
@L740:
	align	 4
@L651:
	cmp	 r13,r22,2
	extu	 r13,r13,1<eq>
	and	 r13,r13,r10
	bcnd.n	 eq0,r13,@L652
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L741
@L742:
	align	 4
@L652:
	bb1.n	 ge,r12,@L653
	or	 r2,r0,r21
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	bsr.n	 _force_reg
	or	 r2,r0,r21
@L692:
	or	 r3,r0,r2
	or	 r2,r0,r20
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L743
@L744:
	align	 4
@L653:
	bsr	 _abort
	align	 4
@L656:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
@L695:
	or	 r3,r0,r2
	or	 r2,r0,r20
	or	 r4,r0,r19
@L694:
	bsr	 _convert_move
@L542:
	or	 r2,r0,r17
@L654:
@Lte9:
	ld	 r1,r31,80
	ld	 r15,r31,36
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	jmp.n	 r1
	addu	 r31,r31,96
	def	 @L743,@L542-@L744
	def	 @L741,@L695-@L742
	def	 @L739,@L695-@L740
	def	 @L737,@L695-@L738
	def	 @L735,@L695-@L736
	def	 @L733,@L695-@L734
	def	 @L731,@L695-@L732
	def	 @L729,@L542-@L730
	def	 @L727,@L692-@L728
	def	 @L725,@L542-@L726
	def	 @L723,@L692-@L724
	def	 @L721,@L542-@L722
	def	 @L719,@L542-@L720
	def	 @L717,@L654-@L718
	def	 @L715,@L654-@L716

	align	 8
_move_by_pieces_ninsns:
@Ltb10:
	cmp	 r9,r3,8
	cmp	 r8,r3,7
	or	 r9,r9,r8
	or	 r11,r0,0
	extu	 r9,r9,1<gt>
	bcnd.n	 eq0,r9,@L792
	or	 r6,r0,9
	or	 r3,r0,8
@L792:
	or.u	 r9,r0,hi16(_mode_size)
	or	 r12,r9,lo16(_mode_size)
	or.u	 r9,r0,hi16(_class_narrowest_mode+4)
@L811:
	ld	 r8,r9,lo16(_class_narrowest_mode+4)
	bcnd.n	 eq0,r8,@L797
	or	 r7,r0,0
	or.u	 r9,r0,hi16(_mode_wider_mode)
	or	 r13,r9,lo16(_mode_wider_mode)
@L799:
	ld	 r9,r12[r8]
	cmp	 r9,r9,r6
	bb1	 ge,r9,@L798
	or	 r7,r0,r8
@L798:
	ld	 r8,r13[r8]
	bcnd	 ne0,r8,@L799
@L797:
	bcnd.n	 eq0,r7,@L794
	or.u	 r9,r0,hi16(_mov_optab)
	ld	 r9,r9,lo16(_mov_optab)
	lda.d	 r9,r9[r7]
	ld	 r9,r9,4
	cmp	 r9,r9,210
	bb0	 ne,r9,@L803
	ld	 r8,r12[r7]
	cmp	 r9,r8,8
	bb1.n	 gt,r9,@L804
	cmp	 r9,r3,7
	cmp	 r9,r3,r8
	bb0	 ge,r9,@L803
	br	 @L810
	align	 4
@L804:
	bb0	 gt,r9,@L803
	ld	 r8,r12[r7]
@L810:
	divu	 r9,r2,r8
	bcnd	 ne0,r8,@L806
	tb0	 0,r0,503
@L806:
	bcnd.n	 ne0,r8,@L807
	addu	 r11,r11,r9
	tb0	 0,r0,503
@L807:
	mul	 r9,r9,r8
	subu	 r2,r2,r9
@L803:
	ld	 r6,r12[r7]
	cmp	 r9,r6,1
	bb1.n	 gt,r9,@L811
	or.u	 r9,r0,hi16(_class_narrowest_mode+4)
@L794:
	jmp.n	 r1
	or	 r2,r0,r11
@Lte10:

	align	 8
_move_by_pieces_1:
	subu	 r31,r31,80
	st	 r1,r31,64
	or.u	 r13,r0,hi16(_mode_size)
	st.d	 r20,r31,40
	or	 r21,r0,r3
	st.d	 r24,r31,56
	or	 r13,r13,lo16(_mode_size)
	st.d	 r22,r31,48
@Ltb11:
	or	 r24,r0,r4
	ld	 r22,r13[r21]
	ld	 r13,r24,32
	cmp	 r13,r13,r22
	bb0.n	 ge,r13,@L825
	or	 r20,r0,r2
@L826:
	ld	 r13,r24,40
	bcnd	 eq0,r13,@L827
	ld	 r13,r24,36
	subu	 r13,r13,r22
	st	 r13,r24,36
@L827:
	ld	 r13,r24,8
	bcnd	 eq0,r13,@L828
	ld	 r4,r24,4
	or	 r2,r0,55
	or	 r3,r0,r21
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L836
@L837:
	align	 4
@L828:
	ld	 r2,r24,4
	ld	 r3,r24,36
	bsr.n	 _plus_constant_wide
	ld	 r25,r0,r24
	or	 r4,r0,r2
	or	 r2,r0,r25
	bsr.n	 _change_address
	or	 r3,r0,r21
@L834:
	ld	 r13,r24,24
	bcnd.n	 eq0,r13,@L830
	or	 r23,r0,r2
	ld	 r4,r24,20
	or	 r2,r0,55
	or	 r3,r0,r21
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L838
@L839:
	align	 4
@L830:
	ld	 r2,r24,20
	ld	 r3,r24,36
	bsr.n	 _plus_constant_wide
	ld	 r25,r24,16
	or	 r4,r0,r2
	or	 r2,r0,r25
	bsr.n	 _change_address
	or	 r3,r0,r21
@L835:
	or	 r3,r0,r2
	jsr.n	 r20
	or	 r2,r0,r23
	bsr	 _emit_insn
	ld	 r13,r24,40
	bcnd	 ne0,r13,@L832
	ld	 r13,r24,36
	addu	 r13,r13,r22
	st	 r13,r24,36
@L832:
	ld	 r13,r24,32
	subu	 r13,r13,r22
	cmp	 r12,r13,r22
	bb1.n	 ge,r12,@L826
	st	 r13,r24,32
@L825:
@Lte11:
	ld	 r1,r31,64
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80
	def	 @L838,@L835-@L839
	def	 @L836,@L834-@L837

	align	 8
	global	 _emit_block_move
_emit_block_move:
	subu	 r31,r31,224
	st	 r1,r31,96
	st.d	 r24,r31,88
	st.d	 r22,r31,80
	st.d	 r20,r31,72
	st.d	 r18,r31,64
	st.d	 r16,r31,56
	st.d	 r14,r31,48
@Ltb12:
	st	 r2,r31,156
	st	 r3,r31,212
	ld.bu	 r13,r2,2
	or	 r16,r0,r4
	cmp	 r13,r13,16
	bb0.n	 ne,r13,@L841
	or	 r23,r0,r5
	bsr	 _abort
	align	 4
@L841:
	ld	 r14,r31,212
	ld.bu	 r13,r14,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L842
	bsr	 _abort
	align	 4
@L842:
	ld	 r18,r31,156
	ld.hu	 r12,r0,r18
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L1297
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L847
	cmp	 r13,r12,63
	ld	 r2,r18,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L848
	st	 r2,r18,4
	align	 4
@L847:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L848
	ld	 r14,r31,156
	ld	 r2,r14,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r14,4
	ld	 r2,r14,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r14,8
@L848:
	ld	 r2,r31,156
	br	 @L843
	align	 4
@L1297:
	ld	 r13,r18,8
	bcnd	 ne0,r13,@L850
	ld	 r2,r18,4
	br	 @L843
	align	 4
@L850:
	ld	 r14,r31,156
	ld	 r2,r14,12
	bcnd	 ne0,r2,@L843
	ld	 r18,r31,156
	ld	 r13,r18,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r18,4
	bsr.n	 _gen_move_insn
	st	 r2,r18,12
	bsr.n	 _emit_insn_before
	ld	 r3,r18,8
	ld	 r2,r18,12
@L843:
	ld	 r14,r31,212
	ld.hu	 r12,r0,r14
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L853
	st	 r2,r31,156
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L1261
	cmp	 r13,r12,63
	ld.bu	 r13,r14,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L854
	ld	 r24,r14,4
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L854
	ld	 r13,r24,4
	st	 r13,r14,4
	ld	 r13,r24,8
	bcnd	 eq0,r13,@L857
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r14,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	ld	 r3,r31,212
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	br.n	 @L852
	or	 r2,r0,r25
	align	 4
@L854:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L856
	cmp	 r13,r12,63
	ld	 r18,r31,212
	ld	 r2,r18,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L857
	st	 r2,r18,4
	align	 4
@L856:
@L1261:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L857
	ld	 r14,r31,212
	ld	 r2,r14,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r14,4
	ld	 r2,r14,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r14,8
@L857:
	ld	 r2,r31,212
	br	 @L852
	align	 4
@L853:
	ld	 r18,r31,212
	ld	 r13,r18,8
	bcnd	 ne0,r13,@L859
	ld	 r2,r18,4
	br	 @L852
	align	 4
@L859:
	ld	 r14,r31,212
	ld	 r2,r14,12
	bcnd	 ne0,r2,@L852
	ld	 r18,r31,212
	ld	 r13,r18,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r18,4
	bsr.n	 _gen_move_insn
	st	 r2,r18,12
	bsr.n	 _emit_insn_before
	ld	 r3,r18,8
	ld	 r2,r18,12
@L852:
	ld.hu	 r12,r0,r16
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L862
	st	 r2,r31,212
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L1262
	cmp	 r13,r12,63
	ld.bu	 r13,r16,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L863
	ld	 r24,r16,4
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L863
	ld	 r13,r24,4
	st	 r13,r16,4
	ld	 r13,r24,8
	bcnd.n	 eq0,r13,@L861
	or	 r3,r0,r16
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r16,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r16
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	br.n	 @L861
	or	 r3,r0,r25
	align	 4
@L863:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L865
	cmp	 r13,r12,63
	ld	 r2,r16,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L866
	st	 r2,r16,4
	align	 4
@L865:
@L1262:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L866
	ld	 r2,r16,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r16,4
	ld	 r2,r16,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r16,8
@L866:
	br.n	 @L861
	or	 r3,r0,r16
	align	 4
@L862:
	ld	 r13,r16,8
	bcnd	 ne0,r13,@L868
	ld	 r3,r16,4
	br	 @L861
	align	 4
@L868:
	ld	 r3,r16,12
	bcnd	 ne0,r3,@L861
	ld	 r13,r16,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r16,4
	bsr.n	 _gen_move_insn
	st	 r2,r16,12
	bsr.n	 _emit_insn_before
	ld	 r3,r16,8
	ld	 r3,r16,12
@L861:
	ld	 r14,r31,156
	ld.hu	 r13,r0,r14
	cmp	 r13,r13,55
	bb0.n	 ne,r13,@L870
	or	 r16,r0,r3
	bsr	 _abort
	align	 4
@L870:
	ld	 r18,r31,212
	ld.hu	 r13,r0,r18
	cmp	 r13,r13,55
	bb0	 ne,r13,@L871
	bsr	 _abort
	align	 4
@L871:
	bcnd	 ne0,r16,@L872
	bsr	 _abort
	align	 4
@L872:
	ld.hu	 r13,r0,r16
	cmp	 r13,r13,46
	bb1.n	 ne,r13,@L1263
	or	 r2,r0,46
	ld	 r7,r16,4
	cmp	 r13,r23,8
	cmp	 r12,r23,7
	or	 r5,r0,r23
	or	 r13,r13,r12
	or	 r6,r0,0
	extu	 r13,r13,1<gt>
	bcnd.n	 eq0,r13,@L875
	or	 r10,r0,9
	or	 r5,r0,8
@L875:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r8,r13,lo16(_mode_size)
	or.u	 r13,r0,hi16(_class_narrowest_mode+4)
@L1265:
	ld	 r12,r13,lo16(_class_narrowest_mode+4)
	bcnd.n	 eq0,r12,@L880
	or	 r11,r0,0
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r9,r13,lo16(_mode_wider_mode)
@L882:
	ld	 r13,r8[r12]
	cmp	 r13,r13,r10
	bb1	 ge,r13,@L881
	or	 r11,r0,r12
@L881:
	ld	 r12,r9[r12]
	bcnd	 ne0,r12,@L882
@L880:
	bcnd.n	 eq0,r11,@L877
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r13,r13,lo16(_mov_optab)
	lda.d	 r13,r13[r11]
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L886
	ld	 r12,r8[r11]
	cmp	 r13,r12,8
	bb1.n	 gt,r13,@L887
	cmp	 r13,r5,7
	cmp	 r13,r5,r12
	bb0	 ge,r13,@L886
	br	 @L1264
	align	 4
@L887:
	bb0	 gt,r13,@L886
	ld	 r12,r8[r11]
@L1264:
	divu	 r13,r7,r12
	bcnd	 ne0,r12,@L889
	tb0	 0,r0,503
@L889:
	bcnd.n	 ne0,r12,@L890
	addu	 r6,r6,r13
	tb0	 0,r0,503
@L890:
	mul	 r13,r13,r12
	subu	 r7,r7,r13
@L886:
	ld	 r10,r8[r11]
	cmp	 r13,r10,1
	bb1.n	 gt,r13,@L1265
	or.u	 r13,r0,hi16(_class_narrowest_mode+4)
@L877:
	cmp	 r13,r6,1
	bb1.n	 gt,r13,@L873
	or	 r2,r0,46
	ld	 r2,r16,4
	ld	 r14,r31,156
	ld	 r18,r31,212
	ld	 r24,r14,4
	ld	 r25,r18,4
	st	 r0,r31,140
	st	 r24,r31,108
	st	 r25,r31,124
	st	 r14,r31,104
	st	 r18,r31,120
	ld.hu	 r11,r0,r24
	subu	 r13,r11,85
	or	 r22,r0,r23
	mask	 r13,r13,0xffff
	or	 r23,r0,9
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L894
	or	 r12,r0,0
	subu	 r13,r11,87
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb0	 ls,r13,@L893
@L894:
	or	 r12,r0,1
@L893:
	st	 r12,r31,112
	ld.hu	 r12,r0,r25
	subu	 r13,r12,85
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L896
	or	 r11,r0,0
	subu	 r13,r12,87
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb0	 ls,r13,@L895
@L896:
	or	 r11,r0,1
@L895:
	st	 r11,r31,128
	st	 r0,r31,132
	st	 r0,r31,116
	ld.hu	 r13,r0,r24
	cmp	 r12,r13,85
	cmp	 r13,r13,87
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L897
	st	 r12,r31,144
	st	 r2,r31,140
@L897:
	bcnd.n	 eq0,r11,@L899
	st	 r2,r31,136
	ld	 r13,r31,112
	bcnd.n	 ne0,r13,@L1266
	cmp	 r13,r22,8
@L899:
	bsr.n	 _move_by_pieces_ninsns
	or	 r3,r0,r22
	cmp	 r2,r2,2
	bb0.n	 gt,r2,@L1266
	cmp	 r13,r22,8
	ld	 r13,r31,128
	bcnd	 ne0,r13,@L900
	ld.hu	 r12,r0,r25
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L901
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L901
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L900
@L901:
	bsr.n	 _copy_addr_to_reg
	or	 r2,r0,r25
	st	 r2,r31,124
@L900:
	ld	 r13,r31,112
	bcnd.n	 ne0,r13,@L1266
	cmp	 r13,r22,8
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L903
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L903
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L1266
	cmp	 r13,r22,8
@L903:
	bsr.n	 _copy_addr_to_reg
	or	 r2,r0,r24
	st	 r2,r31,108
	cmp	 r13,r22,8
@L1266:
	cmp	 r12,r22,7
	or	 r13,r13,r12
	extu	 r13,r13,1<gt>
	bcnd	 eq0,r13,@L904
	or	 r22,r0,8
@L904:
	cmp	 r13,r23,1
	bb0.n	 gt,r13,@L906
	or.u	 r13,r0,hi16(_mode_size)
	or	 r24,r13,lo16(_mode_size)
	or.u	 r13,r0,hi16(_class_narrowest_mode+4)
@L1268:
	ld	 r12,r13,lo16(_class_narrowest_mode+4)
	bcnd.n	 eq0,r12,@L909
	or	 r25,r0,0
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r11,r13,lo16(_mode_wider_mode)
@L911:
	ld	 r13,r24[r12]
	cmp	 r13,r13,r23
	bb1	 ge,r13,@L910
	or	 r25,r0,r12
@L910:
	ld	 r12,r11[r12]
	bcnd	 ne0,r12,@L911
@L909:
	bcnd.n	 eq0,r25,@L906
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r13,r13,lo16(_mov_optab)
	lda.d	 r13,r13[r25]
	ld	 r11,r13,4
	cmp	 r13,r11,210
	bb0	 ne,r13,@L915
	ld	 r12,r24[r25]
	cmp	 r13,r12,8
	bb1.n	 gt,r13,@L916
	cmp	 r13,r22,7
	cmp	 r13,r22,r12
	bb1.n	 ge,r13,@L1267
	or.u	 r13,r0,hi16(_insn_gen_function)
	br	 @L915
	align	 4
@L916:
	bb0.n	 gt,r13,@L915
	or.u	 r13,r0,hi16(_insn_gen_function)
@L1267:
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r3,r0,r25
	ld	 r2,r13[r11]
	bsr.n	 _move_by_pieces_1
	addu	 r4,r31,104
@L915:
	ld	 r23,r24[r25]
	cmp	 r13,r23,1
	bb1.n	 gt,r13,@L1268
	or.u	 r13,r0,hi16(_class_narrowest_mode+4)
@L906:
	ld	 r13,r31,136
	bcnd	 eq0,r13,@L840
	bsr	 _abort
	align	 4
@L873:
@L1263:
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or.u	 r13,r0,hi16(_class_narrowest_mode+4)
	ld	 r17,r13,lo16(_class_narrowest_mode+4)
	bcnd.n	 eq0,r17,@L922
	st	 r2,r31,164
	or.u	 r13,r0,hi16(_mode_size)
	or.u	 r12,r0,hi16(_mode_class)
	or	 r15,r13,lo16(_mode_size)
	or.u	 r13,r0,hi16(_movstr_optab)
@L1281:
	or	 r13,r13,lo16(_movstr_optab)
	ld	 r13,r13[r17]
	st	 r13,r31,172
	cmp	 r13,r13,210
	bb0.n	 ne,r13,@L1269
	or.u	 r13,r0,hi16(_mode_wider_mode)
	ld	 r13,r15[r17]
	mak	 r12,r13,0<3>
	cmp	 r13,r12,31
	ld	 r11,r16,4
	bb1.n	 gt,r13,@L927
	or	 r13,r0,1
	mak	 r13,r13,r12
	subu	 r13,r13,1
	cmp	 r13,r11,r13
	bb0.n	 ls,r13,@L1269
	or.u	 r13,r0,hi16(_mode_wider_mode)
@L927:
	ld	 r14,r31,172
	mul	 r25,r14,40
	or.u	 r13,r0,hi16(_insn_operand_predicate)
	or	 r24,r13,lo16(_insn_operand_predicate)
	ld	 r13,r25,r24
	bcnd	 eq0,r13,@L928
	ld	 r2,r31,156
	jsr.n	 r13
	or	 r3,r0,16
	bcnd.n	 eq0,r2,@L1269
	or.u	 r13,r0,hi16(_mode_wider_mode)
@L928:
	addu	 r25,r25,r24
	ld	 r13,r25,4
	bcnd	 eq0,r13,@L929
	ld	 r2,r31,212
	jsr.n	 r13
	or	 r3,r0,16
	bcnd.n	 eq0,r2,@L1269
	or.u	 r13,r0,hi16(_mode_wider_mode)
@L929:
	ld	 r13,r25,12
	bcnd	 eq0,r13,@L930
	ld	 r2,r31,164
	jsr.n	 r13
	or	 r3,r0,0
	bcnd.n	 eq0,r2,@L1269
	or.u	 r13,r0,hi16(_mode_wider_mode)
@L930:
	bsr.n	 _get_last_insn
	or	 r25,r0,r16
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	ld	 r11,r0,r16
	and	 r13,r11,0x8
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L932
	st	 r2,r31,180
	ld	 r13,r16,4
	ld.bu	 r13,r13,2
	ld	 r12,r15[r17]
	ld	 r13,r15[r13]
	cmp	 r13,r13,r12
	bb0	 ge,r13,@L932
	bb0.n	 (31-26),r11,@L932
	or	 r2,r0,r17
	bsr.n	 _gen_lowpart
	or	 r3,r0,r16
	or	 r25,r0,r2
@L932:
	ld.bu	 r13,r25,2
	cmp	 r13,r17,r13
	bb0.n	 ne,r13,@L931
	or.u	 r18,r0,hi16(_mode_class)
	or	 r18,r18,lo16(_mode_class)
	ld	 r13,r18[r17]
	cmp	 r13,r13,1
	bb1	 ne,r13,@L934
	ld	 r13,r15[r17]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,64
	bb1	 ne,r13,@L934
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb1	 ne,r13,@L1173
	ld	 r2,r25,4
	bcnd.n	 ge0,r2,@L934
	or	 r3,r0,0
	bsr.n	 _immed_double_const
	or	 r4,r0,r17
	br.n	 @L931
	or	 r25,r0,r2
	align	 4
@L934:
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb0.n	 ne,r13,@L1270
	or	 r2,r0,r17
@L1173:
	or.u	 r14,r0,hi16(_mode_class)
	or	 r14,r14,lo16(_mode_class)
	ld	 r13,r14[r17]
	cmp	 r13,r13,1
	bb1	 ne,r13,@L935
	ld.bu	 r12,r25,2
	ld	 r13,r14[r12]
	cmp	 r13,r13,1
	bb1	 ne,r13,@L935
	ld.hu	 r11,r0,r25
	cmp	 r13,r11,47
	bb0	 ne,r13,@L936
	ld	 r13,r15[r17]
	ld	 r12,r15[r12]
	cmp	 r13,r13,r12
	bb1	 gt,r13,@L935
	ld	 r13,r0,r25
	or.u	 r12,r0,0x37
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L1271
	cmp	 r13,r11,51
	or.u	 r13,r0,hi16(_direct_load)
	or	 r13,r13,lo16(_direct_load)
	ld.b	 r13,r17,r13
	bcnd.n	 ne0,r13,@L1270
	or	 r2,r0,r17
	cmp	 r13,r11,51
@L1271:
	bb1	 ne,r13,@L935
@L936:
	or	 r2,r0,r17
@L1270:
	bsr.n	 _gen_lowpart
	or	 r3,r0,r25
	br.n	 @L931
	or	 r25,r0,r2
	align	 4
@L935:
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,r17
	or	 r19,r0,r2
	or	 r23,r0,r25
	or.u	 r18,r0,hi16(_mode_class)
	ld.bu	 r21,r19,2
	or	 r18,r18,lo16(_mode_class)
	ld.bu	 r22,r23,2
	ld	 r13,r18[r21]
	ld	 r12,r18[r22]
	cmp	 r13,r13,2
	extu	 r13,r13,1<eq>
	st	 r13,r31,196
	cmp	 r12,r12,2
	ld.hu	 r11,r0,r19
	or	 r20,r0,r19
	extu	 r12,r12,1<eq>
	cmp	 r13,r11,59
	bb0.n	 ne,r13,@L942
	st	 r12,r31,188
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L945
	cmp	 r13,r11,63
	ld	 r2,r19,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L946
	st	 r2,r19,4
	align	 4
@L945:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L946
	ld	 r2,r19,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r19,4
	ld	 r2,r19,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r19,8
@L946:
	br.n	 @L941
	or	 r2,r0,r20
	align	 4
@L942:
	ld	 r13,r19,8
	bcnd	 ne0,r13,@L948
	ld	 r2,r19,4
	br	 @L941
	align	 4
@L948:
	ld	 r2,r19,12
	bcnd	 ne0,r2,@L941
	ld	 r13,r19,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r19,4
	bsr.n	 _gen_move_insn
	st	 r2,r19,12
	bsr.n	 _emit_insn_before
	ld	 r3,r19,8
	ld	 r2,r19,12
@L941:
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L951
	or	 r20,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L1272
	cmp	 r13,r12,63
	ld.bu	 r13,r23,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L952
	ld	 r24,r23,4
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L952
	ld	 r13,r24,4
	st	 r13,r23,4
	ld	 r13,r24,8
	bcnd	 eq0,r13,@L955
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r23,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r23
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	br.n	 @L950
	or	 r2,r0,r25
	align	 4
@L952:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L954
	cmp	 r13,r12,63
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L955
	st	 r2,r23,4
	align	 4
@L954:
@L1272:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L955
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,4
	ld	 r2,r23,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,8
@L955:
	br.n	 @L950
	or	 r2,r0,r23
	align	 4
@L951:
	ld	 r13,r23,8
	bcnd	 ne0,r13,@L957
	ld	 r2,r23,4
	br	 @L950
	align	 4
@L957:
	ld	 r2,r23,12
	bcnd	 ne0,r2,@L950
	ld	 r13,r23,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r23,4
	bsr.n	 _gen_move_insn
	st	 r2,r23,12
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	ld	 r2,r23,12
@L950:
	ld	 r14,r31,196
	ld	 r18,r31,188
	cmp	 r13,r14,r18
	bb0.n	 ne,r13,@L959
	or	 r23,r0,r2
	bsr	 _abort
	align	 4
@L959:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	ld	 r11,r0,r23
	and	 r13,r11,0x8
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L1273
	ld	 r13,r23,4
	ld.bu	 r13,r13,2
	ld	 r12,r15[r21]
	ld	 r13,r15[r13]
	cmp	 r13,r13,r12
	bb0	 ge,r13,@L960
	bb0.n	 (31-26),r11,@L960
	or	 r2,r0,r21
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	or	 r22,r0,r21
	or	 r23,r0,r2
@L960:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
@L1273:
	ld	 r13,r0,r20
	and	 r13,r13,0x8
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L961
	cmp	 r13,r21,r22
	bsr	 _abort
	align	 4
@L961:
	bb0.n	 ne,r13,@L1274
	or	 r2,r0,r20
	bcnd	 ne0,r22,@L962
	ld.hu	 r12,r0,r23
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1274
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1274
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L962
@L1274:
	or	 r3,r0,r23
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L1298
@L1299:
	align	 4
@L962:
	ld	 r14,r31,196
	bcnd.n	 eq0,r14,@L964
	cmp	 r5,r22,8
	cmp	 r13,r21,9
	extu	 r11,r5,1<eq>
	extu	 r7,r13,1<eq>
	and	 r13,r11,r7
	bcnd.n	 ne0,r13,@L1249
	or	 r2,r0,108
	cmp	 r6,r21,11
	extu	 r12,r6,1<eq>
	and	 r13,r11,r12
	bcnd.n	 ne0,r13,@L1249
	or	 r2,r0,109
	cmp	 r8,r22,9
	extu	 r10,r8,1<eq>
	and	 r13,r10,r12
	bcnd.n	 eq0,r13,@L967
	cmp	 r4,r21,11
	br.n	 @L1249
	or	 r2,r0,110
	align	 4
@L967:
	cmp	 r9,r21,8
	extu	 r11,r9,1<eq>
	and	 r13,r10,r11
	bcnd.n	 ne0,r13,@L1249
	or	 r2,r0,111
	cmp	 r10,r22,11
	extu	 r12,r10,1<eq>
	and	 r13,r12,r11
	bcnd.n	 ne0,r13,@L1249
	or	 r2,r0,112
	and	 r13,r12,r7
	bcnd.n	 eq0,r13,@L970
	cmp	 r12,r21,9
	or	 r2,r0,113
@L1249:
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L1300
@L1301:
	align	 4
@L970:
	bb0.n	 ne,r8,@L980
	or	 r2,r0,0
	bb0.n	 ls,r8,@L1002
	cmp	 r13,r22,10
	bb0.n	 ne,r5,@L972
	cmp	 r13,r21,10
	br	 @L971
	align	 4
@L1002:
	bb0	 ne,r13,@L988
	bb0	 ne,r10,@L994
	br	 @L971
	align	 4
@L972:
	bb0	 ne,r13,@L975
	bb0	 ls,r13,@L979
	bb0.n	 ne,r12,@L974
	or.u	 r13,r0,hi16(_extendsfdf2_libfunc)
	br	 @L971
	align	 4
@L979:
	bb0.n	 ne,r4,@L976
	or.u	 r13,r0,hi16(_extendsftf2_libfunc)
	br	 @L971
	align	 4
@L974:
	ld	 r2,r13,lo16(_extendsfdf2_libfunc)
	br	 @L971
	align	 4
@L975:
	or.u	 r13,r0,hi16(_extendsfxf2_libfunc)
	ld	 r2,r13,lo16(_extendsfxf2_libfunc)
	br	 @L971
	align	 4
@L976:
	ld	 r2,r13,lo16(_extendsftf2_libfunc)
	br	 @L971
	align	 4
@L980:
	cmp	 r13,r21,10
	bb0	 ne,r13,@L983
	bb0	 ls,r13,@L987
	bb0.n	 ne,r9,@L982
	or.u	 r13,r0,hi16(_truncdfsf2_libfunc)
	br	 @L971
	align	 4
@L987:
	bb0.n	 ne,r6,@L984
	or.u	 r13,r0,hi16(_extenddftf2_libfunc)
	br	 @L971
	align	 4
@L982:
	ld	 r2,r13,lo16(_truncdfsf2_libfunc)
	br	 @L971
	align	 4
@L983:
	or.u	 r13,r0,hi16(_extenddfxf2_libfunc)
	ld	 r2,r13,lo16(_extenddfxf2_libfunc)
	br	 @L971
	align	 4
@L984:
	ld	 r2,r13,lo16(_extenddftf2_libfunc)
	br	 @L971
	align	 4
@L988:
	bb0.n	 ne,r9,@L990
	or.u	 r13,r0,hi16(_truncxfsf2_libfunc)
	bb0.n	 ne,r12,@L991
	or.u	 r13,r0,hi16(_truncxfdf2_libfunc)
	br	 @L971
	align	 4
@L990:
	ld	 r2,r13,lo16(_truncxfsf2_libfunc)
	br	 @L971
	align	 4
@L991:
	ld	 r2,r13,lo16(_truncxfdf2_libfunc)
	br	 @L971
	align	 4
@L994:
	bb0.n	 ne,r9,@L996
	or.u	 r13,r0,hi16(_trunctfsf2_libfunc)
	bb0.n	 ne,r12,@L997
	or.u	 r13,r0,hi16(_trunctfdf2_libfunc)
	br	 @L971
	align	 4
@L996:
	ld	 r2,r13,lo16(_trunctfsf2_libfunc)
	br	 @L971
	align	 4
@L997:
	ld	 r2,r13,lo16(_trunctfdf2_libfunc)
@L971:
	bcnd.n	 ne0,r2,@L1003
	or	 r3,r0,1
	bsr	 _abort
	align	 4
@L1003:
	or	 r4,r0,r21
	or	 r5,r0,1
	or	 r6,r0,r23
	bsr.n	 _emit_library_call
	or	 r7,r0,r22
	or	 r2,r0,r21
	bsr.n	 _hard_libcall_value
	addu	 r1,r1,@L1302
@L1303:
	align	 4
@L964:
	ld	 r13,r15[r22]
	ld	 r11,r15[r21]
	mak	 r13,r13,0<3>
	mak	 r12,r11,0<3>
	cmp	 r13,r13,r12
	bb1.n	 ge,r13,@L1004
	cmp	 r13,r12,32
	bb0.n	 gt,r13,@L1004
	addu	 r13,r11,3
	bcnd	 ge0,r13,@L1005
	addu	 r13,r11,6
@L1005:
	ext	 r13,r13,0<2>
	or	 r2,r0,r21
	or	 r3,r0,r22
	or	 r4,r0,1
	bsr.n	 _can_extend_p
	st	 r13,r31,196
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb1.n	 ne,r13,@L1275
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r15[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L1008
	or.u	 r24,r0,hi16(_word_mode)
	or	 r2,r0,r21
	ld	 r3,r24,lo16(_word_mode)
	bsr.n	 _can_extend_p
	or	 r4,r0,1
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0	 ne,r13,@L1008
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r3,r0,r23
	bsr.n	 _convert_move
	or	 r4,r0,1
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r4,r0,r2
	or	 r2,r0,r25
	br.n	 @L1251
	or	 r3,r0,r20
	align	 4
@L1008:
	bsr	 _start_sequence
	ld	 r13,r15[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L1010
	or	 r24,r0,r22
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r24,r13,lo16(_word_mode)
	br.n	 @L1276
	or	 r2,r0,r24
	align	 4
@L1010:
	or	 r2,r0,r24
@L1276:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,1
	or	 r25,r0,r2
	or	 r2,r0,r24
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	bsr.n	 _emit_move_insn
	or	 r3,r0,r25
	ld	 r2,r15[r24]
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r24,r13,lo16(_const0_rtx)
	bcnd	 ge0,r2,@L1016
	addu	 r2,r2,3
@L1016:
	ld	 r18,r31,196
	ext	 r22,r2,0<2>
	cmp	 r13,r22,r18
	bb0.n	 lt,r13,@L1018
	subu	 r13,r18,r22
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L1020
	subu	 r25,r18,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L1215
	cmp	 r13,r12,2
	bb0.n	 gt,r13,@L1216
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L1220
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L1220:
	bb1	 eq,r13,@L1218
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L1218:
	addu	 r22,r22,1
@L1216:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L1224
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L1224:
	bb1	 eq,r13,@L1222
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L1222:
	addu	 r22,r22,1
@L1215:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L1228
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L1228:
	bb1	 eq,r13,@L1226
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L1226:
	ld	 r14,r31,196
	addu	 r22,r22,1
	cmp	 r13,r22,r14
	bb0	 lt,r13,@L1018
@L1020:
	or	 r2,r0,r20
@L1277:
	subu	 r3,r25,1
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L1232
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L1232:
	bb1	 eq,r13,@L1230
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L1230:
	or	 r2,r0,r20
	subu	 r3,r25,2
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L1236
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L1236:
	bb1	 eq,r13,@L1234
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L1234:
	or	 r2,r0,r20
	subu	 r3,r25,3
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L1240
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L1240:
	bb1	 eq,r13,@L1238
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L1238:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,4
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L1244
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L1244:
	bb1	 eq,r13,@L1242
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L1242:
	ld	 r18,r31,196
	addu	 r22,r22,4
	cmp	 r13,r22,r18
	bb1.n	 lt,r13,@L1277
	or	 r2,r0,r20
@L1018:
	bsr	 _get_insns
	bsr.n	 _end_sequence
	or	 r25,r0,r2
	or	 r2,r0,100
	or	 r3,r0,r21
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r6,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_no_conflict_block
	addu	 r1,r1,@L1304
@L1305:
	align	 4
@L1004:
	ld	 r13,r15[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,32
	bb0.n	 gt,r13,@L1024
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	or	 r2,r0,r20
	br.n	 @L1252
	or	 r4,r0,0
	align	 4
@L1024:
	cmp	 r13,r21,3
	bb1.n	 ne,r13,@L1025
	cmp	 r13,r22,3
	cmp	 r13,r22,4
	bb0.n	 ne,r13,@L1026
	or	 r2,r0,4
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,1
@L1026:
	bsr	 _abort
	align	 4
@L1025:
	bb1.n	 ne,r13,@L1027
	cmp	 r13,r21,4
	bb0.n	 ne,r13,@L1028
	or	 r2,r0,4
	or	 r3,r0,r23
	or	 r4,r0,1
	bsr.n	 _convert_to_mode
	or	 r22,r0,4
	br.n	 @L1027
	or	 r23,r0,r2
	align	 4
@L1028:
	bsr	 _abort
	align	 4
@L1027:
	ld	 r12,r15[r21]
	ld	 r13,r15[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb1	 ge,r12,@L1030
	ld	 r13,r0,r23
	or.u	 r12,r0,0x37
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L1032
	or.u	 r13,r0,hi16(_direct_load)
	or	 r13,r13,lo16(_direct_load)
	ld.b	 r13,r21,r13
	bcnd	 eq0,r13,@L1032
	bsr.n	 _mode_dependent_address_p
	ld	 r2,r23,4
	bcnd.n	 eq0,r2,@L1278
	or	 r2,r0,r21
@L1032:
	ld.hu	 r13,r0,r23
	cmp	 r12,r13,51
	cmp	 r13,r13,53
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L1030
	or	 r2,r0,r21
@L1278:
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	addu	 r1,r1,@L1306
@L1307:
	align	 4
@L1030:
	ld	 r12,r15[r21]
	ld	 r13,r15[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb0.n	 gt,r12,@L1033
	or	 r2,r0,r21
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,1
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0.n	 ne,r13,@L1034
	or.u	 r13,r0,hi16(_optimize)
@L1275:
	ld	 r13,r13,lo16(_optimize)
	bcnd	 le0,r13,@L1035
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L1279
	or	 r2,r0,r25
	or	 r2,r0,r22
	bsr.n	 _force_reg
	or	 r3,r0,r23
	or	 r23,r0,r2
@L1035:
	or	 r2,r0,r25
@L1279:
	or	 r3,r0,r20
	or	 r4,r0,r23
@L1251:
	or	 r5,r0,100
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L1308
@L1309:
	align	 4
@L1034:
	or	 r25,r0,r22
	bcnd.n	 eq0,r25,@L1038
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r24,r13,lo16(_mode_wider_mode)
	or	 r2,r0,r21
@L1280:
	or	 r3,r0,r25
	bsr.n	 _can_extend_p
	or	 r4,r0,1
	cmp	 r2,r2,210
	bb1.n	 eq,r2,@L1039
	or	 r2,r0,r25
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,1
	cmp	 r2,r2,210
	bb1.n	 ne,r2,@L1175
	or	 r2,r0,r25
@L1039:
	ld	 r25,r24[r25]
	bcnd.n	 ne0,r25,@L1280
	or	 r2,r0,r21
@L1038:
	bsr	 _abort
	align	 4
@L1033:
	cmp	 r13,r22,6
	extu	 r11,r13,1<eq>
	cmp	 r13,r21,4
	extu	 r13,r13,1<eq>
	and	 r13,r11,r13
	bcnd.n	 eq0,r13,@L1043
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L1310
@L1311:
	align	 4
@L1043:
	cmp	 r13,r21,2
	extu	 r9,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L1044
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L1312
@L1313:
	align	 4
@L1044:
	cmp	 r13,r21,1
	extu	 r10,r13,1<eq>
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L1045
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L1314
@L1315:
	align	 4
@L1045:
	cmp	 r13,r22,4
	extu	 r11,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L1046
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L1316
@L1317:
	align	 4
@L1046:
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L1047
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L1318
@L1319:
	align	 4
@L1047:
	cmp	 r13,r22,2
	extu	 r13,r13,1<eq>
	and	 r13,r13,r10
	bcnd.n	 eq0,r13,@L1048
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L1320
@L1321:
	align	 4
@L1048:
	bb1.n	 ge,r12,@L1049
	or	 r2,r0,r21
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	bsr.n	 _force_reg
	or	 r2,r0,r21
@L1250:
	or	 r3,r0,r2
	or	 r2,r0,r20
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L1322
@L1323:
	align	 4
@L1049:
	bsr	 _abort
	align	 4
@L1175:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,1
@L1253:
	or	 r3,r0,r2
	or	 r2,r0,r20
	or	 r4,r0,1
@L1252:
	bsr	 _convert_move
@L938:
	or	 r25,r0,r19
@L931:
	ld	 r14,r31,172
	mul	 r12,r14,40
	or.u	 r13,r0,hi16(_insn_operand_predicate)
	or	 r13,r13,lo16(_insn_operand_predicate)
	addu	 r12,r12,r13
	ld	 r13,r12,8
	bcnd.n	 eq0,r13,@L1050
	or	 r2,r0,r25
	jsr.n	 r13
	or	 r3,r0,r17
	bcnd.n	 ne0,r2,@L1050
	or	 r2,r0,r17
	bsr.n	 _copy_to_mode_reg
	or	 r3,r0,r25
	or	 r25,r0,r2
@L1050:
	ld	 r2,r31,156
	ld	 r3,r31,212
	ld	 r18,r31,172
	or.u	 r13,r0,hi16(_insn_gen_function)
	ld	 r5,r31,164
	or	 r13,r13,lo16(_insn_gen_function)
	ld	 r13,r13[r18]
	jsr.n	 r13
	or	 r4,r0,r25
	bcnd	 ne0,r2,@L1176
	bsr.n	 _delete_insns_since
	ld	 r2,r31,180
	or.u	 r13,r0,hi16(_mode_wider_mode)
@L1269:
	or	 r13,r13,lo16(_mode_wider_mode)
	ld	 r17,r13[r17]
	bcnd.n	 ne0,r17,@L1281
	or.u	 r13,r0,hi16(_movstr_optab)
@L922:
	or	 r25,r0,r16
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	ld	 r11,r0,r25
	and	 r13,r11,0x8
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L1055
	or	 r24,r0,4
	ld	 r13,r25,4
	or.u	 r12,r0,hi16(_mode_size)
	ld.bu	 r13,r13,2
	or	 r12,r12,lo16(_mode_size)
	ld	 r13,r12[r13]
	ld	 r12,r12,16
	cmp	 r13,r13,r12
	bb0	 ge,r13,@L1055
	bb0.n	 (31-26),r11,@L1055
	or	 r2,r0,4
	bsr.n	 _gen_lowpart
	or	 r3,r0,r25
	or	 r25,r0,r2
@L1055:
	ld.bu	 r13,r25,2
	cmp	 r13,r24,r13
	bb1.n	 ne,r13,@L1056
	or.u	 r13,r0,hi16(_mode_class+16)
	br.n	 @L1054
	or	 r2,r0,r25
	align	 4
@L1056:
	ld	 r13,r13,lo16(_mode_class+16)
	cmp	 r13,r13,1
	bb1.n	 ne,r13,@L1057
	or.u	 r13,r0,hi16(_mode_size+16)
	ld	 r13,r13,lo16(_mode_size+16)
	mak	 r13,r13,0<3>
	cmp	 r13,r13,64
	bb1	 ne,r13,@L1057
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb1	 ne,r13,@L1174
	ld	 r2,r25,4
	bcnd.n	 ge0,r2,@L1057
	or	 r3,r0,0
	or	 r4,r0,4
	bsr.n	 _immed_double_const
	addu	 r1,r1,@L1324
@L1325:
	align	 4
@L1057:
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb0.n	 ne,r13,@L1282
	or	 r2,r0,4
@L1174:
	or.u	 r13,r0,hi16(_mode_class)
	or	 r12,r13,lo16(_mode_class)
	ld	 r13,r12,16
	cmp	 r13,r13,1
	bb1	 ne,r13,@L1058
	ld.bu	 r11,r25,2
	ld	 r13,r12[r11]
	cmp	 r13,r13,1
	bb1	 ne,r13,@L1058
	ld.hu	 r10,r0,r25
	cmp	 r13,r10,47
	bb0.n	 ne,r13,@L1059
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13,16
	ld	 r13,r13[r11]
	cmp	 r12,r12,r13
	bb1	 gt,r12,@L1058
	ld	 r13,r0,r25
	or.u	 r12,r0,0x37
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L1283
	cmp	 r13,r10,51
	or.u	 r13,r0,hi16(_direct_load+4)
	ld.b	 r13,r13,lo16(_direct_load+4)
	bcnd.n	 ne0,r13,@L1282
	or	 r2,r0,4
	cmp	 r13,r10,51
@L1283:
	bb1	 ne,r13,@L1058
@L1059:
	or	 r2,r0,4
@L1282:
	or	 r3,r0,r25
	bsr.n	 _gen_lowpart
	addu	 r1,r1,@L1326
@L1327:
	align	 4
@L1058:
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,4
	or	 r19,r0,r2
	or	 r23,r0,r25
	ld.bu	 r21,r19,2
	ld.bu	 r22,r23,2
	or.u	 r12,r0,hi16(_mode_class)
	ld.hu	 r11,r0,r19
	or	 r12,r12,lo16(_mode_class)
	ld	 r13,r12[r21]
	or	 r16,r0,100
	ld	 r12,r12[r22]
	or	 r20,r0,r19
	cmp	 r13,r13,2
	cmp	 r12,r12,2
	extu	 r15,r13,1<eq>
	cmp	 r13,r11,59
	bb0.n	 ne,r13,@L1065
	extu	 r17,r12,1<eq>
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L1068
	cmp	 r13,r11,63
	ld	 r2,r19,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L1069
	st	 r2,r19,4
	align	 4
@L1068:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L1069
	ld	 r2,r19,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r19,4
	ld	 r2,r19,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r19,8
@L1069:
	br.n	 @L1064
	or	 r2,r0,r20
	align	 4
@L1065:
	ld	 r13,r19,8
	bcnd	 ne0,r13,@L1071
	ld	 r2,r19,4
	br	 @L1064
	align	 4
@L1071:
	ld	 r2,r19,12
	bcnd	 ne0,r2,@L1064
	ld	 r13,r19,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r19,4
	bsr.n	 _gen_move_insn
	st	 r2,r19,12
	bsr.n	 _emit_insn_before
	ld	 r3,r19,8
	ld	 r2,r19,12
@L1064:
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L1074
	or	 r20,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L1284
	cmp	 r13,r12,63
	ld.bu	 r13,r23,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L1075
	ld	 r24,r23,4
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L1075
	ld	 r13,r24,4
	st	 r13,r23,4
	ld	 r13,r24,8
	bcnd	 eq0,r13,@L1078
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r23,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r23
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	br.n	 @L1073
	or	 r2,r0,r25
	align	 4
@L1075:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L1077
	cmp	 r13,r12,63
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L1078
	st	 r2,r23,4
	align	 4
@L1077:
@L1284:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L1078
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,4
	ld	 r2,r23,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,8
@L1078:
	br.n	 @L1073
	or	 r2,r0,r23
	align	 4
@L1074:
	ld	 r13,r23,8
	bcnd	 ne0,r13,@L1080
	ld	 r2,r23,4
	br.n	 @L1285
	cmp	 r13,r15,r17
	align	 4
@L1080:
	ld	 r2,r23,12
	bcnd.n	 ne0,r2,@L1285
	cmp	 r13,r15,r17
	ld	 r13,r23,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r23,4
	bsr.n	 _gen_move_insn
	st	 r2,r23,12
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	ld	 r2,r23,12
@L1073:
	cmp	 r13,r15,r17
@L1285:
	bb0.n	 ne,r13,@L1082
	or	 r23,r0,r2
	bsr	 _abort
	align	 4
@L1082:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	ld	 r11,r0,r23
	and	 r13,r11,0x8
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L1286
	ld	 r13,r23,4
	or.u	 r12,r0,hi16(_mode_size)
	ld.bu	 r13,r13,2
	or	 r12,r12,lo16(_mode_size)
	ld	 r13,r12[r13]
	ld	 r12,r12[r21]
	cmp	 r13,r13,r12
	bb0	 ge,r13,@L1083
	bb0.n	 (31-26),r11,@L1083
	or	 r2,r0,r21
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	or	 r22,r0,r21
	or	 r23,r0,r2
@L1083:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
@L1286:
	ld	 r13,r0,r20
	and	 r13,r13,0x8
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L1084
	cmp	 r13,r21,r22
	bsr	 _abort
	align	 4
@L1084:
	bb0.n	 ne,r13,@L1287
	or	 r2,r0,r20
	bcnd	 ne0,r22,@L1085
	ld.hu	 r12,r0,r23
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1287
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1287
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L1085
@L1287:
	or	 r3,r0,r23
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L1328
@L1329:
	align	 4
@L1085:
	bcnd.n	 eq0,r15,@L1087
	cmp	 r5,r22,8
	cmp	 r13,r21,9
	extu	 r11,r5,1<eq>
	extu	 r7,r13,1<eq>
	and	 r13,r11,r7
	bcnd.n	 ne0,r13,@L1254
	or	 r2,r0,108
	cmp	 r6,r21,11
	extu	 r12,r6,1<eq>
	and	 r13,r11,r12
	bcnd.n	 ne0,r13,@L1254
	or	 r2,r0,109
	cmp	 r8,r22,9
	extu	 r9,r8,1<eq>
	and	 r13,r9,r12
	bcnd.n	 eq0,r13,@L1090
	cmp	 r4,r21,11
	br.n	 @L1254
	or	 r2,r0,110
	align	 4
@L1090:
	cmp	 r10,r21,8
	extu	 r11,r10,1<eq>
	and	 r13,r9,r11
	bcnd.n	 ne0,r13,@L1254
	or	 r2,r0,111
	cmp	 r9,r22,11
	extu	 r12,r9,1<eq>
	and	 r13,r12,r11
	bcnd.n	 ne0,r13,@L1254
	or	 r2,r0,112
	and	 r13,r12,r7
	bcnd.n	 eq0,r13,@L1093
	cmp	 r12,r21,9
	or	 r2,r0,113
@L1254:
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L1330
@L1331:
	align	 4
@L1093:
	bb0.n	 ne,r8,@L1103
	or	 r2,r0,0
	bb0.n	 ls,r8,@L1125
	cmp	 r13,r22,10
	bb0.n	 ne,r5,@L1095
	cmp	 r13,r21,10
	br	 @L1094
	align	 4
@L1125:
	bb0	 ne,r13,@L1111
	bb0	 ne,r9,@L1117
	br	 @L1094
	align	 4
@L1095:
	bb0	 ne,r13,@L1098
	bb0	 ls,r13,@L1102
	bb0.n	 ne,r12,@L1097
	or.u	 r13,r0,hi16(_extendsfdf2_libfunc)
	br	 @L1094
	align	 4
@L1102:
	bb0.n	 ne,r4,@L1099
	or.u	 r13,r0,hi16(_extendsftf2_libfunc)
	br	 @L1094
	align	 4
@L1097:
	ld	 r2,r13,lo16(_extendsfdf2_libfunc)
	br	 @L1094
	align	 4
@L1098:
	or.u	 r13,r0,hi16(_extendsfxf2_libfunc)
	ld	 r2,r13,lo16(_extendsfxf2_libfunc)
	br	 @L1094
	align	 4
@L1099:
	ld	 r2,r13,lo16(_extendsftf2_libfunc)
	br	 @L1094
	align	 4
@L1103:
	cmp	 r13,r21,10
	bb0	 ne,r13,@L1106
	bb0	 ls,r13,@L1110
	bb0.n	 ne,r10,@L1105
	or.u	 r13,r0,hi16(_truncdfsf2_libfunc)
	br	 @L1094
	align	 4
@L1110:
	bb0.n	 ne,r6,@L1107
	or.u	 r13,r0,hi16(_extenddftf2_libfunc)
	br	 @L1094
	align	 4
@L1105:
	ld	 r2,r13,lo16(_truncdfsf2_libfunc)
	br	 @L1094
	align	 4
@L1106:
	or.u	 r13,r0,hi16(_extenddfxf2_libfunc)
	ld	 r2,r13,lo16(_extenddfxf2_libfunc)
	br	 @L1094
	align	 4
@L1107:
	ld	 r2,r13,lo16(_extenddftf2_libfunc)
	br	 @L1094
	align	 4
@L1111:
	bb0.n	 ne,r10,@L1113
	or.u	 r13,r0,hi16(_truncxfsf2_libfunc)
	bb0.n	 ne,r12,@L1114
	or.u	 r13,r0,hi16(_truncxfdf2_libfunc)
	br	 @L1094
	align	 4
@L1113:
	ld	 r2,r13,lo16(_truncxfsf2_libfunc)
	br	 @L1094
	align	 4
@L1114:
	ld	 r2,r13,lo16(_truncxfdf2_libfunc)
	br	 @L1094
	align	 4
@L1117:
	bb0.n	 ne,r10,@L1119
	or.u	 r13,r0,hi16(_trunctfsf2_libfunc)
	bb0.n	 ne,r12,@L1120
	or.u	 r13,r0,hi16(_trunctfdf2_libfunc)
	br	 @L1094
	align	 4
@L1119:
	ld	 r2,r13,lo16(_trunctfsf2_libfunc)
	br	 @L1094
	align	 4
@L1120:
	ld	 r2,r13,lo16(_trunctfdf2_libfunc)
@L1094:
	bcnd.n	 ne0,r2,@L1126
	or	 r3,r0,1
	bsr	 _abort
	align	 4
@L1126:
	or	 r4,r0,r21
	or	 r5,r0,1
	or	 r6,r0,r23
	bsr.n	 _emit_library_call
	or	 r7,r0,r22
	or	 r2,r0,r21
	bsr.n	 _hard_libcall_value
	addu	 r1,r1,@L1332
@L1333:
	align	 4
@L1087:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r24,r13,lo16(_mode_size)
	ld	 r13,r24[r22]
	ld	 r12,r24[r21]
	mak	 r13,r13,0<3>
	mak	 r11,r12,0<3>
	cmp	 r13,r13,r11
	bb1.n	 ge,r13,@L1288
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r11,32
	bb0.n	 gt,r13,@L1127
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L1128
	addu	 r13,r12,6
@L1128:
	or	 r2,r0,r21
	or	 r3,r0,r22
	or	 r4,r0,1
	bsr.n	 _can_extend_p
	ext	 r17,r13,0<2>
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb1.n	 ne,r13,@L1289
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r24[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L1131
	or.u	 r24,r0,hi16(_word_mode)
	or	 r2,r0,r21
	ld	 r3,r24,lo16(_word_mode)
	bsr.n	 _can_extend_p
	or	 r4,r0,1
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0	 ne,r13,@L1131
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r3,r0,r23
	bsr.n	 _convert_move
	or	 r4,r0,1
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r4,r0,r2
	or	 r2,r0,r25
	br.n	 @L1256
	or	 r3,r0,r20
	align	 4
@L1131:
	bsr	 _start_sequence
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L1133
	or	 r24,r0,r22
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r24,r13,lo16(_word_mode)
	br.n	 @L1290
	or	 r2,r0,r24
	align	 4
@L1133:
	or	 r2,r0,r24
@L1290:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,1
	or	 r25,r0,r2
	or	 r2,r0,r24
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	bsr.n	 _emit_move_insn
	or	 r3,r0,r25
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r2,r13[r24]
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r24,r13,lo16(_const0_rtx)
	bcnd	 ge0,r2,@L1139
	addu	 r2,r2,3
@L1139:
	ext	 r22,r2,0<2>
	cmp	 r13,r22,r17
	bb0.n	 lt,r13,@L1141
	subu	 r13,r17,r22
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L1143
	subu	 r25,r17,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L1181
	cmp	 r13,r12,2
	bb0.n	 gt,r13,@L1182
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L1186
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L1186:
	bb1	 eq,r13,@L1184
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L1184:
	addu	 r22,r22,1
@L1182:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L1190
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L1190:
	bb1	 eq,r13,@L1188
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L1188:
	addu	 r22,r22,1
@L1181:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L1194
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L1194:
	bb1	 eq,r13,@L1192
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L1192:
	addu	 r22,r22,1
	cmp	 r13,r22,r17
	bb0	 lt,r13,@L1141
@L1143:
	or	 r2,r0,r20
@L1291:
	subu	 r3,r25,1
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L1198
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L1198:
	bb1	 eq,r13,@L1196
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L1196:
	or	 r2,r0,r20
	subu	 r3,r25,2
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L1202
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L1202:
	bb1	 eq,r13,@L1200
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L1200:
	or	 r2,r0,r20
	subu	 r3,r25,3
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L1206
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L1206:
	bb1	 eq,r13,@L1204
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L1204:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,4
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L1210
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L1210:
	bb1	 eq,r13,@L1208
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L1208:
	addu	 r22,r22,4
	cmp	 r13,r22,r17
	bb1.n	 lt,r13,@L1291
	or	 r2,r0,r20
@L1141:
	bsr	 _get_insns
	bsr.n	 _end_sequence
	or	 r25,r0,r2
	or	 r2,r0,r16
	or	 r3,r0,r21
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r6,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_no_conflict_block
	addu	 r1,r1,@L1334
@L1335:
	align	 4
@L1127:
	or.u	 r13,r0,hi16(_mode_size)
@L1288:
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,32
	bb0.n	 gt,r13,@L1147
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	or	 r2,r0,r20
	br.n	 @L1257
	or	 r4,r0,0
	align	 4
@L1147:
	cmp	 r13,r21,3
	bb1.n	 ne,r13,@L1148
	cmp	 r13,r22,3
	cmp	 r13,r22,4
	bb0.n	 ne,r13,@L1149
	or	 r2,r0,4
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,1
@L1149:
	bsr	 _abort
	align	 4
@L1148:
	bb1.n	 ne,r13,@L1292
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r21,4
	bb0.n	 ne,r13,@L1151
	or	 r2,r0,4
	or	 r3,r0,r23
	or	 r4,r0,1
	bsr.n	 _convert_to_mode
	or	 r22,r0,4
	br.n	 @L1150
	or	 r23,r0,r2
	align	 4
@L1151:
	bsr	 _abort
	align	 4
@L1150:
	or.u	 r13,r0,hi16(_mode_size)
@L1292:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb1.n	 ge,r12,@L1293
	or.u	 r13,r0,hi16(_mode_size)
	ld	 r13,r0,r23
	or.u	 r12,r0,0x37
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L1155
	or.u	 r13,r0,hi16(_direct_load)
	or	 r13,r13,lo16(_direct_load)
	ld.b	 r13,r21,r13
	bcnd	 eq0,r13,@L1155
	bsr.n	 _mode_dependent_address_p
	ld	 r2,r23,4
	bcnd.n	 eq0,r2,@L1294
	or	 r2,r0,r21
@L1155:
	ld.hu	 r13,r0,r23
	cmp	 r12,r13,51
	cmp	 r13,r13,53
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L1153
	or	 r2,r0,r21
@L1294:
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	addu	 r1,r1,@L1336
@L1337:
	align	 4
@L1153:
	or.u	 r13,r0,hi16(_mode_size)
@L1293:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb0.n	 gt,r12,@L1156
	or	 r2,r0,r21
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,1
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0.n	 ne,r13,@L1157
	or.u	 r13,r0,hi16(_optimize)
@L1289:
	ld	 r13,r13,lo16(_optimize)
	bcnd	 le0,r13,@L1158
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L1295
	or	 r2,r0,r25
	or	 r2,r0,r22
	bsr.n	 _force_reg
	or	 r3,r0,r23
	or	 r23,r0,r2
@L1158:
	or	 r2,r0,r25
@L1295:
	or	 r3,r0,r20
	or	 r4,r0,r23
@L1256:
	or	 r5,r0,r16
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L1338
@L1339:
	align	 4
@L1157:
	or	 r25,r0,r22
	bcnd.n	 eq0,r25,@L1161
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r24,r13,lo16(_mode_wider_mode)
	or	 r2,r0,r21
@L1296:
	or	 r3,r0,r25
	bsr.n	 _can_extend_p
	or	 r4,r0,1
	cmp	 r2,r2,210
	bb1.n	 eq,r2,@L1162
	or	 r2,r0,r25
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,1
	cmp	 r2,r2,210
	bb0.n	 eq,r2,@L1177
	or	 r2,r0,r25
@L1162:
	ld	 r25,r24[r25]
	bcnd.n	 ne0,r25,@L1296
	or	 r2,r0,r21
@L1161:
	bsr	 _abort
	align	 4
@L1156:
	cmp	 r13,r22,6
	extu	 r11,r13,1<eq>
	cmp	 r13,r21,4
	extu	 r13,r13,1<eq>
	and	 r13,r11,r13
	bcnd.n	 eq0,r13,@L1166
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L1340
@L1341:
	align	 4
@L1166:
	cmp	 r13,r21,2
	extu	 r9,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L1167
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L1342
@L1343:
	align	 4
@L1167:
	cmp	 r13,r21,1
	extu	 r10,r13,1<eq>
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L1168
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L1344
@L1345:
	align	 4
@L1168:
	cmp	 r13,r22,4
	extu	 r11,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L1169
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L1346
@L1347:
	align	 4
@L1169:
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L1170
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L1348
@L1349:
	align	 4
@L1170:
	cmp	 r13,r22,2
	extu	 r13,r13,1<eq>
	and	 r13,r13,r10
	bcnd.n	 eq0,r13,@L1171
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L1350
@L1351:
	align	 4
@L1171:
	bb1.n	 ge,r12,@L1172
	or	 r2,r0,r21
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	bsr.n	 _force_reg
	or	 r2,r0,r21
@L1255:
	or	 r3,r0,r2
	or	 r2,r0,r20
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L1352
@L1353:
	align	 4
@L1172:
	bsr	 _abort
	align	 4
@L1176:
	bsr.n	 _emit_insn
	addu	 r1,r1,@L1354
@L1355:
	align	 4
@L1177:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,1
@L1258:
	or	 r3,r0,r2
	or	 r2,r0,r20
	or	 r4,r0,1
@L1257:
	bsr	 _convert_move
@L1061:
	or	 r2,r0,r19
@L1054:
	ld	 r14,r31,156
	ld	 r18,r31,212
	or	 r3,r0,0
	ld	 r6,r14,4
	or	 r4,r0,0
	ld	 r8,r18,4
	or.u	 r13,r0,hi16(_memcpy_libfunc)
	or	 r5,r0,3
	st	 r2,r31,32
	or	 r7,r0,4
	ld	 r2,r13,lo16(_memcpy_libfunc)
	or	 r9,r0,4
	or	 r13,r0,4
	bsr.n	 _emit_library_call
	st	 r13,r31,36
@L840:
@Lte12:
	ld	 r1,r31,96
	ld.d	 r24,r31,88
	ld.d	 r22,r31,80
	ld.d	 r20,r31,72
	ld.d	 r18,r31,64
	ld.d	 r16,r31,56
	ld.d	 r14,r31,48
	jmp.n	 r1
	addu	 r31,r31,224
	def	 @L1354,@L840-@L1355
	def	 @L1352,@L1061-@L1353
	def	 @L1350,@L1258-@L1351
	def	 @L1348,@L1258-@L1349
	def	 @L1346,@L1258-@L1347
	def	 @L1344,@L1258-@L1345
	def	 @L1342,@L1258-@L1343
	def	 @L1340,@L1258-@L1341
	def	 @L1338,@L1061-@L1339
	def	 @L1336,@L1255-@L1337
	def	 @L1334,@L1061-@L1335
	def	 @L1332,@L1255-@L1333
	def	 @L1330,@L1061-@L1331
	def	 @L1328,@L1061-@L1329
	def	 @L1326,@L1054-@L1327
	def	 @L1324,@L1054-@L1325
	def	 @L1322,@L938-@L1323
	def	 @L1320,@L1253-@L1321
	def	 @L1318,@L1253-@L1319
	def	 @L1316,@L1253-@L1317
	def	 @L1314,@L1253-@L1315
	def	 @L1312,@L1253-@L1313
	def	 @L1310,@L1253-@L1311
	def	 @L1308,@L938-@L1309
	def	 @L1306,@L1250-@L1307
	def	 @L1304,@L938-@L1305
	def	 @L1302,@L1250-@L1303
	def	 @L1300,@L938-@L1301
	def	 @L1298,@L938-@L1299

	align	 8
	global	 _move_block_to_reg
_move_block_to_reg:
	subu	 r31,r31,80
	st	 r1,r31,64
	st	 r19,r31,36
	st.d	 r24,r31,56
	st.d	 r22,r31,48
	or	 r22,r0,r3
	st.d	 r20,r31,40
@Ltb13:
	ld.hu	 r12,r0,r22
	subu	 r13,r12,56
	or	 r25,r0,r2
	mask	 r13,r13,0xffff
	or	 r19,r0,r4
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1366
	or	 r21,r0,r5
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1366
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L1365
@L1366:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,47
	bb1	 ne,r13,@L1365
	ld.bu	 r13,r22,2
	bcnd.n	 eq0,r13,@L1365
	or	 r2,r0,r21
	bsr.n	 _force_const_mem
	or	 r3,r0,r22
	bsr	 _validize_mem
	or	 r22,r0,r2
@L1365:
	bcnd.n	 le0,r19,@L1368
	or	 r24,r0,0
	or	 r23,r0,r25
	mask	 r12,r19,3
	bcnd.n	 eq0,r12,@L1370
	or.u	 r20,r0,hi16(_word_mode)
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L1374
	cmp	 r13,r12,2
	bb0.n	 gt,r13,@L1375
	or	 r2,r0,51
	ld	 r3,r20,lo16(_word_mode)
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r25,r0,r2
	or	 r2,r0,r22
	or	 r3,r0,0
	or	 r4,r0,r21
	bsr.n	 _operand_subword_force
	addu	 r23,r23,1
	or	 r3,r0,r2
	or	 r2,r0,r25
	bsr.n	 _emit_move_insn
	or	 r24,r0,1
@L1375:
	ld	 r3,r20,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r25,r0,r2
	or	 r2,r0,r22
	or	 r3,r0,r24
	or	 r4,r0,r21
	bsr.n	 _operand_subword_force
	addu	 r23,r23,1
	or	 r3,r0,r2
	or	 r2,r0,r25
	bsr.n	 _emit_move_insn
	addu	 r24,r24,1
@L1374:
	ld	 r3,r20,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r25,r0,r2
	or	 r2,r0,r22
	or	 r3,r0,r24
	bsr.n	 _operand_subword_force
	or	 r4,r0,r21
	or	 r3,r0,r2
	or	 r2,r0,r25
	bsr.n	 _emit_move_insn
	addu	 r24,r24,1
	cmp	 r13,r24,r19
	bb0.n	 lt,r13,@L1368
	addu	 r23,r23,1
@L1370:
	ld	 r3,r20,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r25,r0,r2
	or	 r2,r0,r22
	or	 r3,r0,r24
	bsr.n	 _operand_subword_force
	or	 r4,r0,r21
	or	 r3,r0,r2
	bsr.n	 _emit_move_insn
	or	 r2,r0,r25
	ld	 r3,r20,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	addu	 r4,r23,1
	addu	 r3,r24,1
	or	 r25,r0,r2
	or	 r2,r0,r22
	bsr.n	 _operand_subword_force
	or	 r4,r0,r21
	or	 r3,r0,r2
	bsr.n	 _emit_move_insn
	or	 r2,r0,r25
	ld	 r3,r20,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	addu	 r4,r23,2
	addu	 r3,r24,2
	or	 r25,r0,r2
	or	 r2,r0,r22
	bsr.n	 _operand_subword_force
	or	 r4,r0,r21
	or	 r3,r0,r2
	bsr.n	 _emit_move_insn
	or	 r2,r0,r25
	ld	 r3,r20,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	addu	 r4,r23,3
	addu	 r3,r24,3
	or	 r25,r0,r2
	or	 r2,r0,r22
	bsr.n	 _operand_subword_force
	or	 r4,r0,r21
	or	 r3,r0,r2
	or	 r2,r0,r25
	bsr.n	 _emit_move_insn
	addu	 r24,r24,4
	cmp	 r13,r24,r19
	bb1.n	 lt,r13,@L1370
	addu	 r23,r23,4
@L1368:
@Lte13:
	ld	 r1,r31,64
	ld	 r19,r31,36
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80

	align	 8
	global	 _move_block_from_reg
_move_block_from_reg:
	subu	 r31,r31,80
	st	 r1,r31,64
	st.d	 r20,r31,40
	or	 r21,r0,r3
	st	 r19,r31,36
	or	 r19,r0,r4
	st.d	 r22,r31,48
	or	 r23,r0,0
	bcnd.n	 le0,r19,@L1400
	st.d	 r24,r31,56
@Ltb14:
	or	 r22,r0,r2
	mask	 r12,r19,3
	bcnd.n	 eq0,r12,@L1402
	or.u	 r20,r0,hi16(_word_mode)
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L1407
	cmp	 r13,r12,2
	bb0.n	 gt,r13,@L1408
	or	 r2,r0,r21
	or	 r3,r0,0
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,16
	or	 r25,r0,r2
	bcnd.n	 ne0,r25,@L1411
	or	 r2,r0,51
	bsr	 _abort
	align	 4
@L1411:
	ld	 r3,r20,lo16(_word_mode)
	or	 r4,r0,r22
	bsr.n	 _gen_rtx
	addu	 r22,r22,1
	or	 r3,r0,r2
	or	 r2,r0,r25
	bsr.n	 _emit_move_insn
	or	 r23,r0,1
@L1408:
	or	 r2,r0,r21
	or	 r3,r0,r23
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,16
	or	 r25,r0,r2
	bcnd.n	 ne0,r25,@L1414
	or	 r2,r0,51
	bsr	 _abort
	align	 4
@L1414:
	ld	 r3,r20,lo16(_word_mode)
	or	 r4,r0,r22
	bsr.n	 _gen_rtx
	addu	 r22,r22,1
	or	 r3,r0,r2
	or	 r2,r0,r25
	bsr.n	 _emit_move_insn
	addu	 r23,r23,1
@L1407:
	or	 r2,r0,r21
	or	 r3,r0,r23
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,16
	or	 r25,r0,r2
	bcnd.n	 ne0,r25,@L1417
	or	 r2,r0,51
	bsr	 _abort
	align	 4
@L1417:
	ld	 r3,r20,lo16(_word_mode)
	bsr.n	 _gen_rtx
	or	 r4,r0,r22
	or	 r3,r0,r2
	or	 r2,r0,r25
	bsr.n	 _emit_move_insn
	addu	 r23,r23,1
	cmp	 r13,r23,r19
	bb0.n	 lt,r13,@L1400
	addu	 r22,r22,1
@L1402:
	or	 r2,r0,r21
	or	 r3,r0,r23
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,16
	or	 r25,r0,r2
	bcnd	 ne0,r25,@L1420
	bsr	 _abort
	align	 4
@L1420:
	ld	 r3,r20,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	or	 r4,r0,r22
	or	 r3,r0,r2
	bsr.n	 _emit_move_insn
	or	 r2,r0,r25
	or	 r2,r0,r21
	addu	 r3,r23,1
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,16
	or	 r24,r0,r2
	bcnd.n	 ne0,r24,@L1423
	addu	 r25,r22,1
	bsr	 _abort
	align	 4
@L1423:
	ld	 r3,r20,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r3,r0,r2
	bsr.n	 _emit_move_insn
	or	 r2,r0,r24
	or	 r2,r0,r21
	addu	 r3,r23,2
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,16
	or	 r24,r0,r2
	bcnd.n	 ne0,r24,@L1426
	addu	 r25,r22,2
	bsr	 _abort
	align	 4
@L1426:
	ld	 r3,r20,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r3,r0,r2
	bsr.n	 _emit_move_insn
	or	 r2,r0,r24
	or	 r2,r0,r21
	addu	 r3,r23,3
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,16
	or	 r24,r0,r2
	bcnd.n	 ne0,r24,@L1429
	addu	 r25,r22,3
	bsr	 _abort
	align	 4
@L1429:
	ld	 r3,r20,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r3,r0,r2
	or	 r2,r0,r24
	bsr.n	 _emit_move_insn
	addu	 r23,r23,4
	cmp	 r13,r23,r19
	bb1.n	 lt,r13,@L1402
	addu	 r22,r22,4
@L1400:
@Lte14:
	ld	 r1,r31,64
	ld	 r19,r31,36
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80

	align	 8
	global	 _use_regs
_use_regs:
	subu	 r31,r31,64
	st.d	 r22,r31,32
	or	 r22,r0,r3
	st.d	 r24,r31,40
	or	 r24,r0,0
	bcnd.n	 le0,r22,@L1439
	st	 r1,r31,48
@Ltb15:
	or	 r25,r0,r2
	mask	 r12,r22,3
	bcnd.n	 eq0,r12,@L1441
	or.u	 r23,r0,hi16(_word_mode)
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L1445
	cmp	 r13,r12,2
	bb0	 gt,r13,@L1446
	ld	 r3,r23,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,41
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	addu	 r25,r25,1
	bsr.n	 _emit_insn
	or	 r24,r0,1
@L1446:
	ld	 r3,r23,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,41
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	addu	 r25,r25,1
	bsr.n	 _emit_insn
	addu	 r24,r24,1
@L1445:
	ld	 r3,r23,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,41
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr.n	 _emit_insn
	addu	 r24,r24,1
	cmp	 r13,r24,r22
	bb0.n	 lt,r13,@L1439
	addu	 r25,r25,1
@L1441:
	ld	 r3,r23,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,41
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr.n	 _emit_insn
	addu	 r24,r24,4
	ld	 r3,r23,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	addu	 r4,r25,1
	or	 r4,r0,r2
	or	 r2,r0,41
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr	 _emit_insn
	ld	 r3,r23,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	addu	 r4,r25,2
	or	 r4,r0,r2
	or	 r2,r0,41
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr	 _emit_insn
	ld	 r3,r23,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	addu	 r4,r25,3
	or	 r4,r0,r2
	or	 r2,r0,41
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr.n	 _emit_insn
	addu	 r25,r25,4
	cmp	 r13,r24,r22
	bb1	 lt,r13,@L1441
@L1439:
@Lte15:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	ld.d	 r22,r31,32
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
	global	 _clear_storage
_clear_storage:
	subu	 r31,r31,64
	st	 r25,r31,48
	or	 r25,r0,r2
	st	 r1,r31,52
@Ltb16:
	ld.bu	 r13,r25,2
	cmp	 r13,r13,16
	bb1.n	 ne,r13,@L1469
	or	 r4,r0,r3
	or	 r2,r0,46
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	ld	 r6,r25,4
	st	 r2,r31,32
	or.u	 r13,r0,hi16(_memset_libfunc)
	or	 r3,r0,0
	or	 r4,r0,0
	or	 r5,r0,3
	ld	 r2,r13,lo16(_memset_libfunc)
	or.u	 r13,r0,hi16(_const0_rtx)
	or	 r7,r0,4
	ld	 r8,r13,lo16(_const0_rtx)
	or	 r9,r0,4
	or	 r13,r0,4
	st	 r13,r31,36
	bsr.n	 _emit_library_call
	addu	 r1,r1,@L1471
@L1472:
	align	 4
@L1469:
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r3,r13,lo16(_const0_rtx)
	bsr.n	 _emit_move_insn
	or	 r2,r0,r25
@L1470:
@Lte16:
	ld	 r1,r31,52
	ld	 r25,r31,48
	jmp.n	 r1
	addu	 r31,r31,64
	def	 @L1471,@L1470-@L1472

	align	 8
	global	 _emit_move_insn
_emit_move_insn:
	subu	 r31,r31,80
	st	 r1,r31,64
	st.d	 r24,r31,56
	st.d	 r22,r31,48
	st.d	 r20,r31,40
	or	 r22,r0,r2
	st.d	 r18,r31,32
@Ltb17:
	or.u	 r13,r0,hi16(_mode_class)
	ld.hu	 r11,r0,r22
	ld.bu	 r21,r22,2
	or	 r13,r13,lo16(_mode_class)
	cmp	 r12,r11,59
	ld	 r19,r13[r21]
	bb0.n	 ne,r12,@L1534
	or	 r24,r0,r3
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L1537
	cmp	 r13,r11,63
	ld	 r2,r22,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L1538
	st	 r2,r22,4
	align	 4
@L1537:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L1538
	ld	 r2,r22,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r22,4
	ld	 r2,r22,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r22,8
@L1538:
	br.n	 @L1533
	or	 r2,r0,r22
	align	 4
@L1534:
	ld	 r13,r22,8
	bcnd	 ne0,r13,@L1540
	ld	 r2,r22,4
	br	 @L1533
	align	 4
@L1540:
	ld	 r2,r22,12
	bcnd	 ne0,r2,@L1533
	ld	 r13,r22,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r22,4
	bsr.n	 _gen_move_insn
	st	 r2,r22,12
	bsr.n	 _emit_insn_before
	ld	 r3,r22,8
	ld	 r2,r22,12
@L1533:
	ld.hu	 r12,r0,r24
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L1543
	or	 r22,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L1595
	cmp	 r13,r12,63
	ld.bu	 r13,r24,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L1544
	ld	 r23,r24,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L1544
	ld	 r13,r23,4
	st	 r13,r24,4
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L1547
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r24,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r24
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	br.n	 @L1542
	or	 r2,r0,r25
	align	 4
@L1544:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L1546
	cmp	 r13,r12,63
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L1547
	st	 r2,r24,4
	align	 4
@L1546:
@L1595:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L1547
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,4
	ld	 r2,r24,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,8
@L1547:
	br.n	 @L1542
	or	 r2,r0,r24
	align	 4
@L1543:
	ld	 r13,r24,8
	bcnd	 ne0,r13,@L1549
	ld	 r2,r24,4
	br.n	 @L1596
	cmp	 r13,r21,16
	align	 4
@L1549:
	ld	 r2,r24,12
	bcnd.n	 ne0,r2,@L1596
	cmp	 r13,r21,16
	ld	 r13,r24,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r24,4
	bsr.n	 _gen_move_insn
	st	 r2,r24,12
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	ld	 r2,r24,12
@L1542:
	cmp	 r13,r21,16
@L1596:
	bb0.n	 ne,r13,@L1552
	or	 r24,r0,r2
	ld.bu	 r13,r24,2
	cmp	 r13,r13,r21
	bb0	 ne,r13,@L1551
	ld.bu	 r13,r24,2
	bcnd	 eq0,r13,@L1551
@L1552:
	bsr	 _abort
	align	 4
@L1551:
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1554
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1554
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L1553
@L1554:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,47
	bb1	 ne,r13,@L1553
	ld.bu	 r13,r24,2
	bcnd.n	 eq0,r13,@L1553
	or	 r2,r0,r21
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
@L1553:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,55
	bb1	 ne,r13,@L1555
	ld.bu	 r2,r22,2
	bsr.n	 _memory_address_p
	ld	 r3,r22,4
	bcnd.n	 ne0,r2,@L1597
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld.bu	 r3,r22,2
	bsr.n	 _push_operand
	or	 r2,r0,r22
	bcnd.n	 eq0,r2,@L1556
	or.u	 r13,r0,hi16(_flag_force_addr)
@L1597:
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L1555
	ld	 r13,r22,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1556
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1556
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L1555
@L1556:
	ld	 r4,r22,4
	or	 r2,r0,r22
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r22,r0,r2
@L1555:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L1598
	cmp	 r13,r21,16
	ld.bu	 r2,r24,2
	bsr.n	 _memory_address_p
	ld	 r3,r24,4
	bcnd.n	 eq0,r2,@L1559
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L1558
	ld	 r13,r24,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1559
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1559
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L1598
	cmp	 r13,r21,16
@L1559:
	ld	 r4,r24,4
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L1558:
	cmp	 r13,r21,16
@L1598:
	bb1.n	 ne,r13,@L1560
	subu	 r13,r19,5
	bsr	 _abort
	align	 4
@L1560:
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L1561
	or.u	 r13,r0,hi16(_mode_unit_size)
	or	 r13,r13,lo16(_mode_unit_size)
	ld	 r12,r13[r21]
	or	 r3,r0,2
	cmp	 r13,r19,5
	bb1.n	 ne,r13,@L1562
	mak	 r2,r12,0<3>
	or	 r3,r0,1
@L1562:
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	or	 r20,r0,r2
@L1561:
	or.u	 r23,r0,hi16(_mov_optab)
	ld	 r11,r23,lo16(_mov_optab)
	lda.d	 r13,r11[r21]
	ld	 r12,r13,4
	cmp	 r13,r12,210
	bb0.n	 ne,r13,@L1564
	or.u	 r13,r0,hi16(_insn_gen_function)
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r2,r0,r22
	ld	 r13,r13[r12]
	jsr.n	 r13
	or	 r3,r0,r24
	bsr.n	 _emit_insn
	addu	 r1,r1,@L1600
@L1601:
	align	 4
@L1564:
	cmp	 r12,r20,16
	subu	 r13,r19,5
	extu	 r12,r12,1<ne>
	cmp	 r13,r13,1
	extu	 r13,r13,1<ls>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L1566
	mak	 r25,r20,0<3>
	addu	 r13,r11,r25
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L1566
	ld.bu	 r3,r22,2
	bsr.n	 _push_operand
	or	 r2,r0,r22
	bsr.n	 _get_last_insn
	or	 r21,r0,r2
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L1567
	or	 r18,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r22
	bsr	 _emit_insn
@L1567:
	ld	 r13,r23,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	addu	 r13,r13,r25
	ld	 r23,r13,4
	bcnd.n	 eq0,r21,@L1568
	or	 r19,r12,lo16(_insn_gen_function)
	or	 r2,r0,r22
	or	 r3,r0,r20
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L1602
@L1603:
	align	 4
@L1568:
	or	 r2,r0,r20
	bsr.n	 _gen_highpart
	or	 r3,r0,r22
@L1592:
	or	 r25,r0,r2
	or	 r2,r0,r20
	bsr.n	 _gen_highpart
	or	 r3,r0,r24
	ld	 r13,r19[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r13,r13,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	lda.d	 r13,r13[r20]
	ld	 r23,r13,4
	bcnd.n	 eq0,r21,@L1570
	or	 r19,r12,lo16(_insn_gen_function)
	or	 r2,r0,r22
	or	 r3,r0,r20
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L1604
@L1605:
	align	 4
@L1570:
	or	 r2,r0,r20
	bsr.n	 _gen_lowpart
	or	 r3,r0,r22
@L1593:
	or	 r25,r0,r2
	or	 r2,r0,r20
	bsr.n	 _gen_lowpart
	or	 r3,r0,r24
	ld	 r13,r19[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	bcnd	 eq0,r18,@L1573
	ld	 r24,r18,12
	br	 @L1574
	align	 4
@L1573:
	bsr	 _get_insns
	or	 r24,r0,r2
@L1574:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	st	 r2,r24,28
	bsr.n	 _get_last_insn
	addu	 r1,r1,@L1606
@L1607:
	align	 4
@L1566:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r20,r13,lo16(_mode_size)
	ld	 r13,r20[r21]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L1576
	bsr.n	 _get_last_insn
	or	 r23,r0,0
	or	 r19,r0,r2
	or	 r25,r0,0
@L1577:
	ld	 r12,r20[r21]
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L1581
	addu	 r13,r12,6
@L1581:
	ext	 r13,r13,0<2>
	cmp	 r13,r25,r13
	bb0.n	 lt,r13,@L1578
	or	 r2,r0,r22
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	or	 r23,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	or	 r3,r0,r2
	bcnd.n	 ne0,r3,@L1599
	cmp	 r13,r23,0
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1583
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1583
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L1582
	or	 r2,r0,r24
@L1583:
	or	 r2,r0,r21
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r3,r0,r25
	or	 r4,r0,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	addu	 r1,r1,@L1608
@L1609:
	align	 4
@L1582:
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r21
@L1594:
	or	 r3,r0,r2
	cmp	 r13,r23,0
@L1599:
	cmp	 r12,r3,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L1586
	or	 r2,r0,r23
	bsr	 _abort
	align	 4
@L1586:
	bsr.n	 _emit_move_insn
	addu	 r25,r25,1
	br.n	 @L1577
	or	 r23,r0,r2
	align	 4
@L1578:
	bcnd	 eq0,r19,@L1588
	ld	 r24,r19,12
	br	 @L1589
	align	 4
@L1588:
	bsr	 _get_insns
	or	 r24,r0,r2
@L1589:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	st	 r2,r24,28
	br.n	 @L1591
	or	 r2,r0,r23
	align	 4
@L1576:
	bsr	 _abort
	align	 4
@L1591:
@Lte17:
	ld	 r1,r31,64
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	ld.d	 r18,r31,32
	jmp.n	 r1
	addu	 r31,r31,80
	def	 @L1608,@L1594-@L1609
	def	 @L1606,@L1591-@L1607
	def	 @L1604,@L1593-@L1605
	def	 @L1602,@L1592-@L1603
	def	 @L1600,@L1591-@L1601

	align	 8
	global	 _push_block
_push_block:
	subu	 r31,r31,64
	st	 r1,r31,48
	st.d	 r24,r31,40
	or	 r10,r0,r2
	st.d	 r22,r31,32
@Ltb18:
	ld.hu	 r12,r0,r10
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	or	 r23,r0,r3
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1620
	or	 r22,r0,r4
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1620
	mask	 r11,r12,0xffff
	cmp	 r13,r11,49
	cmp	 r12,r11,113
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L1619
	cmp	 r13,r11,51
@L1620:
	or	 r2,r0,r10
	or	 r3,r0,r23
	bsr.n	 _plus_constant_wide
	addu	 r1,r1,@L1627
@L1628:
	align	 4
@L1619:
	cmp	 r12,r23,0
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L1626
	or	 r2,r0,r10
	or	 r2,r0,4
	bsr.n	 _copy_to_mode_reg
	or	 r3,r0,r10
	bcnd.n	 eq0,r23,@L1624
	or	 r24,r0,r2
	or	 r2,r0,46
	or	 r3,r0,0
	or.u	 r13,r0,hi16(_add_optab)
	or	 r4,r0,r23
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_add_optab)
	or	 r5,r0,r2
	or	 r2,r0,4
	or	 r4,r0,r24
	or	 r7,r0,0
	or	 r8,r0,3
	or	 r6,r0,r4
	bsr.n	 _expand_binop
	or	 r3,r0,r25
	or	 r24,r0,r2
@L1624:
	or	 r2,r0,r24
@L1626:
	bsr	 _anti_adjust_stack
	cmp	 r13,r23,0
	cmp	 r12,r22,0
	or	 r13,r13,r12
	or.u	 r12,r0,hi16(_virtual_outgoing_args_rtx)
	extu	 r11,r13,1<eq>
	xor	 r13,r11,1
	ld	 r3,r12,lo16(_virtual_outgoing_args_rtx)
	bcnd.n	 eq0,r13,@L1625
	or	 r2,r0,r3
	bsr.n	 _plus_constant_wide
	or	 r3,r0,r23
	or	 r3,r0,r2
@L1625:
	or.u	 r13,r0,hi16(_class_narrowest_mode+4)
	bsr.n	 _memory_address
	ld	 r2,r13,lo16(_class_narrowest_mode+4)
@Lte18:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	ld.d	 r22,r31,32
	jmp.n	 r1
	addu	 r31,r31,64
	def	 @L1627,@L1626-@L1628

	align	 8
	global	 _gen_push_operand
_gen_push_operand:
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	subu	 r31,r31,48
	ld	 r4,r13,lo16(_stack_pointer_rtx)
	or	 r2,r0,85
	st	 r1,r31,36
@Ltb19:
	bsr.n	 _gen_rtx
	or	 r3,r0,4
@Lte19:
	ld	 r1,r31,36
	jmp.n	 r1
	addu	 r31,r31,48

	align	 8
	global	 _emit_push_insn
_emit_push_insn:
	subu	 r31,r31,208
	st.d	 r20,r31,72
	ld	 r21,r31,244
	st	 r1,r31,96
	st.d	 r24,r31,88
	st.d	 r22,r31,80
	or	 r20,r0,r2
	st.d	 r16,r31,56
	or	 r17,r0,r3
	st.d	 r18,r31,64
	or	 r2,r0,r4
	st.d	 r14,r31,48
@Ltb20:
	or	 r22,r0,r5
	st	 r7,r31,156
	or	 r14,r0,r6
	st	 r8,r31,164
	cmp	 r13,r17,16
	bb1.n	 ne,r13,@L1807
	st	 r9,r31,172
	bcnd	 eq0,r2,@L1805
	ld	 r13,r2,16
	ld.bu	 r13,r13,8
	cmp	 r13,r13,25
	bb1.n	 ne,r13,@L2011
	or	 r15,r0,1
	bsr	 _int_size_in_bytes
	cmp	 r2,r2,3
	bb0.n	 gt,r2,@L2011
	or	 r15,r0,2
	br.n	 @L2011
	or	 r15,r0,1
	align	 4
@L1807:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r17]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L2011
	or	 r15,r0,1
	br.n	 @L2011
	or	 r15,r0,2
	align	 4
@L1805:
	or	 r15,r0,1
@L2011:
	st	 r15,r31,180
	ld.hu	 r12,r0,r20
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L1814
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L2020
	cmp	 r13,r12,63
	ld.bu	 r13,r20,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L1815
	ld	 r24,r20,4
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L1815
	ld	 r13,r24,4
	st	 r13,r20,4
	ld	 r13,r24,8
	bcnd	 eq0,r13,@L1818
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r20,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r20
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	br.n	 @L1813
	or	 r2,r0,r25
	align	 4
@L1815:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L1817
	cmp	 r13,r12,63
	ld	 r2,r20,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L1818
	st	 r2,r20,4
	align	 4
@L1817:
@L2020:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L1818
	ld	 r2,r20,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r20,4
	ld	 r2,r20,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r20,8
@L1818:
	br.n	 @L1813
	or	 r2,r0,r20
	align	 4
@L1814:
	ld	 r13,r20,8
	bcnd	 ne0,r13,@L1820
	ld	 r2,r20,4
	br.n	 @L2021
	or	 r20,r0,r2
	align	 4
@L1820:
	ld	 r2,r20,12
	bcnd	 ne0,r2,@L1813
	ld	 r13,r20,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r20,4
	bsr.n	 _gen_move_insn
	st	 r2,r20,12
	bsr.n	 _emit_insn_before
	ld	 r3,r20,8
	ld	 r2,r20,12
@L1813:
	or	 r20,r0,r2
@L2021:
	cmp	 r13,r17,16
	bb1.n	 ne,r13,@L1822
	or	 r18,r0,r20
	ld	 r15,r31,156
	mak	 r25,r15,0<2>
	bcnd.n	 ge0,r25,@L1823
	or	 r13,r0,r25
	addu	 r13,r25,3
@L1823:
	and	 r13,r13,0xfffc
	bcnd.n	 ne0,r22,@L1824
	subu	 r13,r25,r13
	bsr	 _abort
	align	 4
@L1824:
	ld	 r15,r31,156
	bcnd.n	 eq0,r15,@L2036
	subu	 r25,r25,r13
	ld	 r2,r20,4
	bsr.n	 _plus_constant_wide
	or	 r3,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,r20
	bsr.n	 _change_address
	or	 r3,r0,16
	or	 r18,r0,r2
	ld	 r15,r31,156
@L2036:
	bcnd.n	 eq0,r15,@L1826
	or	 r23,r0,r25
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,46
	bb1.n	 ne,r13,@L1827
	or	 r2,r0,46
	ld	 r4,r22,4
	or	 r3,r0,0
	subu	 r4,r4,r23
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L2037
@L2038:
	align	 4
@L1827:
	ld.bu	 r24,r22,2
	or	 r3,r0,0
	or.u	 r13,r0,hi16(_sub_optab)
	or	 r4,r0,r23
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_sub_optab)
	or	 r4,r0,r22
	or	 r6,r0,0
	or	 r7,r0,0
	or	 r8,r0,3
	or	 r5,r0,r2
	or	 r2,r0,r24
	bsr.n	 _expand_binop
	or	 r3,r0,r25
@L2012:
	or	 r22,r0,r2
@L1826:
	ld	 r15,r31,240
	bcnd	 ne0,r15,@L1829
	ld.hu	 r11,r0,r22
	ld	 r15,r31,180
	subu	 r13,r11,56
	mask	 r13,r13,0xffff
	cmp	 r12,r15,2
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1832
	extu	 r23,r12,1<eq>
	subu	 r13,r11,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1832
	mask	 r11,r11,0xffff
	cmp	 r13,r11,49
	cmp	 r12,r11,113
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L1831
	cmp	 r13,r11,51
@L1832:
	ld	 r3,r31,172
	or	 r2,r0,r22
	bsr.n	 _plus_constant_wide
	addu	 r1,r1,@L2039
@L2040:
	align	 4
@L1831:
	ld	 r15,r31,172
	cmp	 r12,r15,0
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L2013
	or	 r2,r0,r22
	or	 r2,r0,4
	bsr.n	 _copy_to_mode_reg
	or	 r3,r0,r22
	ld	 r15,r31,172
	bcnd.n	 eq0,r15,@L1836
	or	 r24,r0,r2
	ld	 r4,r31,172
	or	 r2,r0,46
	or.u	 r13,r0,hi16(_add_optab)
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_add_optab)
	or	 r5,r0,r2
	or	 r2,r0,4
	or	 r4,r0,r24
	or	 r7,r0,0
	or	 r8,r0,3
	or	 r6,r0,r4
	bsr.n	 _expand_binop
	or	 r3,r0,r25
	or	 r24,r0,r2
@L1836:
	or	 r2,r0,r24
@L2013:
	bsr	 _anti_adjust_stack
	ld	 r15,r31,172
	subu	 r12,r0,r23
	cmp	 r13,r15,0
	subu	 r12,r0,r12
	extu	 r13,r13,1<ne>
	or.u	 r11,r0,hi16(_virtual_outgoing_args_rtx)
	and	 r13,r13,r12
	ld	 r3,r11,lo16(_virtual_outgoing_args_rtx)
	bcnd.n	 eq0,r13,@L1837
	or	 r2,r0,r3
	bsr.n	 _plus_constant_wide
	ld	 r3,r31,172
	or	 r3,r0,r2
@L1837:
	or.u	 r13,r0,hi16(_class_narrowest_mode+4)
	ld	 r2,r13,lo16(_class_narrowest_mode+4)
	br.n	 @L2014
	st	 r0,r31,172
	align	 4
@L1829:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,46
	bb1.n	 ne,r13,@L1839
	or	 r2,r0,63
	ld	 r3,r21,4
	ld	 r2,r31,240
	br.n	 @L2015
	addu	 r3,r23,r3
	align	 4
@L1839:
	ld	 r4,r31,240
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r5,r0,r21
	or	 r3,r0,r23
@L2015:
	bsr	 _plus_constant_wide
	or	 r3,r0,r2
	or	 r2,r0,16
@L2014:
	bsr	 _memory_address
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,46
	bb1.n	 ne,r13,@L1841
	or	 r4,r0,r2
	ld	 r7,r22,4
	cmp	 r13,r14,8
	cmp	 r12,r14,7
	or	 r5,r0,r14
	or	 r13,r13,r12
	or	 r6,r0,0
	extu	 r13,r13,1<gt>
	bcnd.n	 eq0,r13,@L1843
	or	 r10,r0,9
	or	 r5,r0,8
@L1843:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r8,r13,lo16(_mode_size)
	or.u	 r13,r0,hi16(_class_narrowest_mode+4)
@L2023:
	ld	 r12,r13,lo16(_class_narrowest_mode+4)
	bcnd.n	 eq0,r12,@L1848
	or	 r11,r0,0
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r9,r13,lo16(_mode_wider_mode)
@L1850:
	ld	 r13,r8[r12]
	cmp	 r13,r13,r10
	bb1	 ge,r13,@L1849
	or	 r11,r0,r12
@L1849:
	ld	 r12,r9[r12]
	bcnd	 ne0,r12,@L1850
@L1848:
	bcnd.n	 eq0,r11,@L1845
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r13,r13,lo16(_mov_optab)
	lda.d	 r13,r13[r11]
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L1854
	ld	 r12,r8[r11]
	cmp	 r13,r12,8
	bb1.n	 gt,r13,@L1855
	cmp	 r13,r5,7
	cmp	 r13,r5,r12
	bb0	 ge,r13,@L1854
	br	 @L2022
	align	 4
@L1855:
	bb0	 gt,r13,@L1854
	ld	 r12,r8[r11]
@L2022:
	divu	 r13,r7,r12
	bcnd	 ne0,r12,@L1857
	tb0	 0,r0,503
@L1857:
	bcnd.n	 ne0,r12,@L1858
	addu	 r6,r6,r13
	tb0	 0,r0,503
@L1858:
	mul	 r13,r13,r12
	subu	 r7,r7,r13
@L1854:
	ld	 r10,r8[r11]
	cmp	 r13,r10,1
	bb1.n	 gt,r13,@L2023
	or.u	 r13,r0,hi16(_class_narrowest_mode+4)
@L1845:
	cmp	 r13,r6,1
	bb1.n	 gt,r13,@L2024
	or	 r2,r0,55
	bsr.n	 _gen_rtx
	or	 r3,r0,16
	ld	 r3,r22,4
	ld	 r24,r2,4
	ld	 r25,r18,4
	st	 r0,r31,140
	st	 r24,r31,108
	st	 r25,r31,124
	st	 r2,r31,104
	st	 r18,r31,120
	ld.hu	 r11,r0,r24
	subu	 r13,r11,85
	or	 r22,r0,r14
	mask	 r13,r13,0xffff
	or	 r23,r0,9
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1862
	or	 r12,r0,0
	subu	 r13,r11,87
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb0	 ls,r13,@L1861
@L1862:
	or	 r12,r0,1
@L1861:
	st	 r12,r31,112
	ld.hu	 r12,r0,r25
	subu	 r13,r12,85
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1864
	or	 r11,r0,0
	subu	 r13,r12,87
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb0	 ls,r13,@L1863
@L1864:
	or	 r11,r0,1
@L1863:
	st	 r11,r31,128
	st	 r0,r31,132
	st	 r0,r31,116
	ld.hu	 r13,r0,r24
	cmp	 r12,r13,85
	cmp	 r13,r13,87
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L1865
	st	 r12,r31,144
	st	 r3,r31,140
@L1865:
	bcnd.n	 eq0,r11,@L1867
	st	 r3,r31,136
	ld	 r13,r31,112
	bcnd.n	 ne0,r13,@L2025
	cmp	 r13,r22,8
@L1867:
	or	 r2,r0,r3
	bsr.n	 _move_by_pieces_ninsns
	or	 r3,r0,r22
	cmp	 r2,r2,2
	bb0.n	 gt,r2,@L2025
	cmp	 r13,r22,8
	ld	 r13,r31,128
	bcnd	 ne0,r13,@L1868
	ld.hu	 r12,r0,r25
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1869
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1869
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L1868
@L1869:
	bsr.n	 _copy_addr_to_reg
	or	 r2,r0,r25
	st	 r2,r31,124
@L1868:
	ld	 r13,r31,112
	bcnd.n	 ne0,r13,@L2025
	cmp	 r13,r22,8
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1871
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1871
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L2025
	cmp	 r13,r22,8
@L1871:
	bsr.n	 _copy_addr_to_reg
	or	 r2,r0,r24
	st	 r2,r31,108
	cmp	 r13,r22,8
@L2025:
	cmp	 r12,r22,7
	or	 r13,r13,r12
	extu	 r13,r13,1<gt>
	bcnd	 eq0,r13,@L1872
	or	 r22,r0,8
@L1872:
	cmp	 r13,r23,1
	bb0.n	 gt,r13,@L1874
	or.u	 r13,r0,hi16(_mode_size)
	or	 r24,r13,lo16(_mode_size)
	or.u	 r13,r0,hi16(_class_narrowest_mode+4)
@L2027:
	ld	 r12,r13,lo16(_class_narrowest_mode+4)
	bcnd.n	 eq0,r12,@L1877
	or	 r25,r0,0
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r11,r13,lo16(_mode_wider_mode)
@L1879:
	ld	 r13,r24[r12]
	cmp	 r13,r13,r23
	bb1	 ge,r13,@L1878
	or	 r25,r0,r12
@L1878:
	ld	 r12,r11[r12]
	bcnd	 ne0,r12,@L1879
@L1877:
	bcnd.n	 eq0,r25,@L1874
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r13,r13,lo16(_mov_optab)
	lda.d	 r13,r13[r25]
	ld	 r11,r13,4
	cmp	 r13,r11,210
	bb0	 ne,r13,@L1883
	ld	 r12,r24[r25]
	cmp	 r13,r12,8
	bb1.n	 gt,r13,@L1884
	cmp	 r13,r22,7
	cmp	 r13,r22,r12
	bb1.n	 ge,r13,@L2026
	or.u	 r13,r0,hi16(_insn_gen_function)
	br	 @L1883
	align	 4
@L1884:
	bb0.n	 gt,r13,@L1883
	or.u	 r13,r0,hi16(_insn_gen_function)
@L2026:
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r3,r0,r25
	ld	 r2,r13[r11]
	bsr.n	 _move_by_pieces_1
	addu	 r4,r31,104
@L1883:
	ld	 r23,r24[r25]
	cmp	 r13,r23,1
	bb1.n	 gt,r13,@L2027
	or.u	 r13,r0,hi16(_class_narrowest_mode+4)
@L1874:
	ld	 r13,r31,136
	bcnd	 eq0,r13,@L1888
	bsr	 _abort
	align	 4
@L1841:
	or	 r2,r0,55
@L2024:
	bsr.n	 _gen_rtx
	or	 r3,r0,16
	or	 r25,r0,r2
	or	 r2,r0,46
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r14
	or	 r5,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,r18
	bsr.n	 _gen_movstrsi
	or	 r4,r0,r22
	bsr.n	 _emit_insn
	addu	 r1,r1,@L2041
@L2042:
	align	 4
@L1822:
	ld	 r15,r31,156
	bcnd.n	 le0,r15,@L1891
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r11,r13[r17]
	bcnd	 ge0,r11,@L1892
	addu	 r11,r11,3
@L1892:
	ld	 r15,r31,172
	cmp	 r12,r15,0
	ld	 r15,r31,240
	ext	 r16,r11,0<2>
	cmp	 r13,r15,0
	ld	 r21,r21,4
	and.c	 r12,r13,r12
	or	 r18,r0,0
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L1893
	st	 r21,r31,196
	ld	 r15,r31,180
	cmp	 r13,r15,0
	cmp	 r12,r15,2
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L1893
	or	 r2,r0,46
	ld	 r4,r31,172
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr	 _anti_adjust_stack
@L1893:
	ld	 r15,r31,240
	ld.hu	 r11,r0,r20
	cmp	 r13,r15,0
	ld	 r15,r31,156
	ext	 r13,r13,1<ne>
	subu	 r12,r11,56
	and	 r18,r18,r13
	mask	 r12,r12,0xffff
	subu	 r19,r15,r18
	cmp	 r12,r12,1
	bb1.n	 ls,r12,@L1896
	or	 r21,r0,r19
	subu	 r13,r11,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1896
	mask	 r13,r11,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L1895
@L1896:
	ld.hu	 r13,r0,r20
	cmp	 r13,r13,47
	bb1	 ne,r13,@L1895
	ld.bu	 r13,r20,2
	bcnd.n	 eq0,r13,@L1895
	or	 r2,r0,r17
	bsr.n	 _force_const_mem
	or	 r3,r0,r20
	bsr	 _validize_mem
	or	 r20,r0,r2
@L1895:
	ld.hu	 r13,r0,r20
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L2028
	or	 r23,r0,r21
	ld	 r13,r20,4
	cmp	 r13,r13,63
	bb1.n	 gt,r13,@L2029
	cmp	 r13,r23,r16
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r12,r20,2
	or	 r13,r13,lo16(_mode_class)
	ld	 r13,r13[r12]
	cmp	 r13,r13,1
	bb0.n	 ne,r13,@L2029
	cmp	 r13,r23,r16
	bsr.n	 _copy_to_reg
	or	 r2,r0,r20
	or	 r20,r0,r2
	or	 r23,r0,r21
@L2028:
	cmp	 r13,r23,r16
@L2029:
	bb1.n	 ge,r13,@L1888
	subu	 r13,r16,r23
	bb0.n	 (31-31),r13,@L2030
	addu	 r22,r21,r18
	addu	 r13,r23,r18
	cmp	 r13,r23,r13
	bb1.n	 lt,r13,@L1999
	or	 r2,r0,r20
	or	 r3,r0,r23
	bsr.n	 _operand_subword_force
	or	 r4,r0,r17
	ld	 r15,r31,196
	or	 r25,r0,r2
	or	 r2,r0,46
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	lda	 r4,r15[r19]
	ld	 r15,r31,240
	st	 r2,r31,36
	or	 r2,r0,r25
	or	 r4,r0,0
	or	 r5,r0,0
	or	 r6,r0,r14
	or.u	 r13,r0,hi16(_word_mode)
	or	 r7,r0,0
	ld	 r3,r13,lo16(_word_mode)
	or	 r8,r0,0
	or	 r9,r0,0
	bsr.n	 _emit_push_insn
	st	 r15,r31,32
@L1999:
	addu	 r23,r23,1
	cmp	 r13,r23,r16
	bb1.n	 ge,r13,@L1888
	addu	 r22,r21,r18
@L2030:
	cmp	 r13,r23,r22
	bb1.n	 lt,r13,@L2002
	or	 r2,r0,r20
	or	 r3,r0,r23
	bsr.n	 _operand_subword_force
	or	 r4,r0,r17
	ld	 r15,r31,196
	or	 r25,r0,r2
	subu	 r4,r23,r21
	or	 r2,r0,46
	addu	 r4,r4,r19
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	lda	 r4,r15[r4]
	ld	 r15,r31,240
	st	 r2,r31,36
	or	 r2,r0,r25
	or	 r4,r0,0
	or	 r5,r0,0
	or	 r6,r0,r14
	or.u	 r13,r0,hi16(_word_mode)
	or	 r7,r0,0
	ld	 r3,r13,lo16(_word_mode)
	or	 r8,r0,0
	or	 r9,r0,0
	bsr.n	 _emit_push_insn
	st	 r15,r31,32
@L2002:
	addu	 r24,r23,1
	cmp	 r13,r24,r22
	bb1.n	 lt,r13,@L2005
	or	 r2,r0,r20
	or	 r3,r0,r24
	bsr.n	 _operand_subword_force
	or	 r4,r0,r17
	ld	 r15,r31,196
	or	 r25,r0,r2
	subu	 r4,r24,r21
	or	 r2,r0,46
	addu	 r4,r4,r19
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	lda	 r4,r15[r4]
	ld	 r15,r31,240
	st	 r2,r31,36
	or	 r2,r0,r25
	or	 r4,r0,0
	or	 r5,r0,0
	or	 r6,r0,r14
	or.u	 r13,r0,hi16(_word_mode)
	or	 r7,r0,0
	ld	 r3,r13,lo16(_word_mode)
	or	 r8,r0,0
	or	 r9,r0,0
	bsr.n	 _emit_push_insn
	st	 r15,r31,32
@L2005:
	addu	 r23,r23,2
	cmp	 r13,r23,r16
	bb1.n	 lt,r13,@L2030
	addu	 r22,r21,r18
	br	 @L1888
	align	 4
@L1891:
	ld	 r15,r31,172
	cmp	 r13,r15,0
	ld	 r15,r31,240
	cmp	 r12,r15,0
	and.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L1905
	ld	 r15,r31,180
	cmp	 r13,r15,0
	cmp	 r12,r15,2
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L1905
	or	 r2,r0,46
	ld	 r4,r31,172
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr	 _anti_adjust_stack
@L1905:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,46
	bb1	 ne,r13,@L1906
	ld	 r3,r21,4
	ld	 r2,r31,240
	bsr.n	 _plus_constant_wide
	addu	 r1,r1,@L2043
@L2044:
	align	 4
@L1906:
	ld	 r4,r31,240
	or	 r2,r0,63
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r5,r0,r21
@L2016:
	or	 r3,r0,r2
	bsr.n	 _memory_address
	or	 r2,r0,r17
	or	 r4,r0,r2
	or	 r2,r0,55
	bsr.n	 _gen_rtx
	or	 r3,r0,r17
	or	 r22,r0,r2
	ld.hu	 r11,r0,r22
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r21,r22,2
	or	 r13,r13,lo16(_mode_class)
	cmp	 r12,r11,59
	ld	 r18,r13[r21]
	bb0.n	 ne,r12,@L1910
	or	 r24,r0,r20
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L1913
	cmp	 r13,r11,63
	ld	 r2,r22,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L1914
	st	 r2,r22,4
	align	 4
@L1913:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L1914
	ld	 r2,r22,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r22,4
	ld	 r2,r22,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r22,8
@L1914:
	br.n	 @L1909
	or	 r2,r0,r22
	align	 4
@L1910:
	ld	 r13,r22,8
	bcnd	 ne0,r13,@L1916
	ld	 r2,r22,4
	br	 @L1909
	align	 4
@L1916:
	ld	 r2,r22,12
	bcnd	 ne0,r2,@L1909
	ld	 r13,r22,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r22,4
	bsr.n	 _gen_move_insn
	st	 r2,r22,12
	bsr.n	 _emit_insn_before
	ld	 r3,r22,8
	ld	 r2,r22,12
@L1909:
	ld.hu	 r12,r0,r24
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L1919
	or	 r22,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L2031
	cmp	 r13,r12,63
	ld.bu	 r13,r24,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L1920
	ld	 r23,r24,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L1920
	ld	 r13,r23,4
	st	 r13,r24,4
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L1923
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r24,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r24
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	br.n	 @L1918
	or	 r2,r0,r25
	align	 4
@L1920:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L1922
	cmp	 r13,r12,63
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L1923
	st	 r2,r24,4
	align	 4
@L1922:
@L2031:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L1923
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,4
	ld	 r2,r24,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,8
@L1923:
	br.n	 @L1918
	or	 r2,r0,r24
	align	 4
@L1919:
	ld	 r13,r24,8
	bcnd	 ne0,r13,@L1925
	ld	 r2,r24,4
	br.n	 @L2032
	cmp	 r13,r21,16
	align	 4
@L1925:
	ld	 r2,r24,12
	bcnd.n	 ne0,r2,@L2032
	cmp	 r13,r21,16
	ld	 r13,r24,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r24,4
	bsr.n	 _gen_move_insn
	st	 r2,r24,12
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	ld	 r2,r24,12
@L1918:
	cmp	 r13,r21,16
@L2032:
	bb0.n	 ne,r13,@L1928
	or	 r24,r0,r2
	ld.bu	 r13,r24,2
	cmp	 r13,r13,r21
	bb0	 ne,r13,@L1927
	ld.bu	 r13,r24,2
	bcnd	 eq0,r13,@L1927
@L1928:
	bsr	 _abort
	align	 4
@L1927:
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1930
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1930
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L1929
@L1930:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,47
	bb1	 ne,r13,@L1929
	ld.bu	 r13,r24,2
	bcnd.n	 eq0,r13,@L1929
	or	 r2,r0,r21
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
@L1929:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,55
	bb1	 ne,r13,@L1931
	ld.bu	 r2,r22,2
	bsr.n	 _memory_address_p
	ld	 r3,r22,4
	bcnd.n	 ne0,r2,@L2033
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld.bu	 r3,r22,2
	bsr.n	 _push_operand
	or	 r2,r0,r22
	bcnd.n	 eq0,r2,@L1932
	or.u	 r13,r0,hi16(_flag_force_addr)
@L2033:
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L1931
	ld	 r13,r22,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1932
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1932
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L1931
@L1932:
	ld	 r4,r22,4
	or	 r2,r0,r22
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r22,r0,r2
@L1931:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L2034
	cmp	 r13,r21,16
	ld.bu	 r2,r24,2
	bsr.n	 _memory_address_p
	ld	 r3,r24,4
	bcnd.n	 eq0,r2,@L1935
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L1934
	ld	 r13,r24,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1935
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1935
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L2034
	cmp	 r13,r21,16
@L1935:
	ld	 r4,r24,4
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L1934:
	cmp	 r13,r21,16
@L2034:
	bb1.n	 ne,r13,@L1936
	subu	 r13,r18,5
	bsr	 _abort
	align	 4
@L1936:
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L1937
	or.u	 r13,r0,hi16(_mode_unit_size)
	or	 r13,r13,lo16(_mode_unit_size)
	ld	 r12,r13[r21]
	or	 r3,r0,2
	cmp	 r13,r18,5
	bb1.n	 ne,r13,@L1938
	mak	 r2,r12,0<3>
	or	 r3,r0,1
@L1938:
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	or	 r19,r0,r2
@L1937:
	or.u	 r23,r0,hi16(_mov_optab)
	ld	 r11,r23,lo16(_mov_optab)
	lda.d	 r13,r11[r21]
	ld	 r12,r13,4
	cmp	 r13,r12,210
	bb0.n	 ne,r13,@L1940
	or.u	 r13,r0,hi16(_insn_gen_function)
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r2,r0,r22
	ld	 r13,r13[r12]
	jsr.n	 r13
	or	 r3,r0,r24
	bsr.n	 _emit_insn
	addu	 r1,r1,@L2045
@L2046:
	align	 4
@L1940:
	cmp	 r12,r19,16
	subu	 r13,r18,5
	extu	 r12,r12,1<ne>
	cmp	 r13,r13,1
	extu	 r13,r13,1<ls>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L1942
	mak	 r25,r19,0<3>
	addu	 r13,r11,r25
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L1942
	ld.bu	 r3,r22,2
	bsr.n	 _push_operand
	or	 r2,r0,r22
	bsr.n	 _get_last_insn
	or	 r21,r0,r2
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L1943
	or	 r16,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r22
	bsr	 _emit_insn
@L1943:
	ld	 r13,r23,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	addu	 r13,r13,r25
	ld	 r23,r13,4
	bcnd.n	 eq0,r21,@L1944
	or	 r18,r12,lo16(_insn_gen_function)
	or	 r2,r0,r22
	or	 r3,r0,r19
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L2047
@L2048:
	align	 4
@L1944:
	or	 r2,r0,r19
	bsr.n	 _gen_highpart
	or	 r3,r0,r22
@L2017:
	or	 r25,r0,r2
	or	 r2,r0,r19
	bsr.n	 _gen_highpart
	or	 r3,r0,r24
	ld	 r13,r18[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r13,r13,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	lda.d	 r13,r13[r19]
	ld	 r23,r13,4
	bcnd.n	 eq0,r21,@L1946
	or	 r18,r12,lo16(_insn_gen_function)
	or	 r2,r0,r22
	or	 r3,r0,r19
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L2049
@L2050:
	align	 4
@L1946:
	or	 r2,r0,r19
	bsr.n	 _gen_lowpart
	or	 r3,r0,r22
@L2018:
	or	 r25,r0,r2
	or	 r2,r0,r19
	bsr.n	 _gen_lowpart
	or	 r3,r0,r24
	ld	 r13,r18[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	bcnd	 eq0,r16,@L1949
	ld	 r24,r16,12
	br	 @L1950
	align	 4
@L1949:
	bsr	 _get_insns
	or	 r24,r0,r2
@L1950:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	st	 r2,r24,28
	bsr.n	 _get_last_insn
	addu	 r1,r1,@L2051
@L2052:
	align	 4
@L1942:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r23,r13,lo16(_mode_size)
	ld	 r13,r23[r21]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L1952
	bsr.n	 _get_last_insn
	or	 r25,r0,0
	or	 r19,r0,r2
	or	 r18,r0,r23
@L1953:
	ld	 r12,r18[r21]
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L1957
	addu	 r13,r12,6
@L1957:
	ext	 r13,r13,0<2>
	cmp	 r13,r25,r13
	bb0.n	 lt,r13,@L1954
	or	 r2,r0,r22
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	or	 r23,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	or	 r3,r0,r2
	bcnd.n	 ne0,r3,@L2035
	cmp	 r13,r23,0
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1959
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1959
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L1958
	or	 r2,r0,r24
@L1959:
	or	 r2,r0,r21
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r3,r0,r25
	or	 r4,r0,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	addu	 r1,r1,@L2053
@L2054:
	align	 4
@L1958:
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r21
@L2019:
	or	 r3,r0,r2
	cmp	 r13,r23,0
@L2035:
	cmp	 r12,r3,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L1962
	or	 r2,r0,r23
	bsr	 _abort
	align	 4
@L1962:
	addu	 r25,r25,1
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L2055
@L2056:
	align	 4
@L1954:
	bcnd	 eq0,r19,@L1964
	ld	 r24,r19,12
	br	 @L1965
	align	 4
@L1964:
	bsr	 _get_insns
	or	 r24,r0,r2
@L1965:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	br.n	 @L1888
	st	 r2,r24,28
	align	 4
@L1952:
	bsr	 _abort
	align	 4
@L1888:
	ld	 r15,r31,156
	bcnd	 le0,r15,@L1967
	or	 r22,r0,r20
	ld.hu	 r12,r0,r22
	subu	 r13,r12,56
	ld	 r15,r31,164
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	ld	 r25,r15,4
	bb1.n	 ls,r13,@L1970
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L1970
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L1969
@L1970:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,47
	bb1	 ne,r13,@L1969
	ld.bu	 r13,r22,2
	bcnd.n	 eq0,r13,@L1969
	or	 r2,r0,r17
	bsr.n	 _force_const_mem
	or	 r3,r0,r22
	bsr	 _validize_mem
	or	 r22,r0,r2
@L1969:
	ld	 r15,r31,156
	bcnd.n	 le0,r15,@L1967
	or	 r24,r0,0
	or	 r23,r0,r25
	mask	 r12,r15,3
	bcnd.n	 eq0,r12,@L1974
	or.u	 r21,r0,hi16(_word_mode)
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L1979
	cmp	 r13,r12,2
	bb0	 gt,r13,@L1980
	or	 r2,r0,51
	ld	 r3,r21,lo16(_word_mode)
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r25,r0,r2
	or	 r2,r0,r22
	or	 r3,r0,0
	or	 r4,r0,r17
	bsr.n	 _operand_subword_force
	addu	 r23,r23,1
	or	 r3,r0,r2
	or	 r2,r0,r25
	bsr.n	 _emit_move_insn
	or	 r24,r0,1
@L1980:
	ld	 r3,r21,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r25,r0,r2
	or	 r2,r0,r22
	or	 r3,r0,r24
	or	 r4,r0,r17
	bsr.n	 _operand_subword_force
	addu	 r23,r23,1
	or	 r3,r0,r2
	or	 r2,r0,r25
	bsr.n	 _emit_move_insn
	addu	 r24,r24,1
@L1979:
	ld	 r3,r21,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r25,r0,r2
	or	 r2,r0,r22
	or	 r3,r0,r24
	bsr.n	 _operand_subword_force
	or	 r4,r0,r17
	or	 r3,r0,r2
	bsr.n	 _emit_move_insn
	or	 r2,r0,r25
	ld	 r15,r31,156
	addu	 r24,r24,1
	cmp	 r13,r24,r15
	bb0.n	 lt,r13,@L1967
	addu	 r23,r23,1
@L1974:
	ld	 r3,r21,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r25,r0,r2
	or	 r2,r0,r22
	or	 r3,r0,r24
	bsr.n	 _operand_subword_force
	or	 r4,r0,r17
	or	 r3,r0,r2
	bsr.n	 _emit_move_insn
	or	 r2,r0,r25
	ld	 r3,r21,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	addu	 r4,r23,1
	addu	 r3,r24,1
	or	 r25,r0,r2
	or	 r2,r0,r22
	bsr.n	 _operand_subword_force
	or	 r4,r0,r17
	or	 r3,r0,r2
	bsr.n	 _emit_move_insn
	or	 r2,r0,r25
	ld	 r3,r21,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	addu	 r4,r23,2
	addu	 r3,r24,2
	or	 r25,r0,r2
	or	 r2,r0,r22
	bsr.n	 _operand_subword_force
	or	 r4,r0,r17
	or	 r3,r0,r2
	bsr.n	 _emit_move_insn
	or	 r2,r0,r25
	ld	 r3,r21,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	addu	 r4,r23,3
	addu	 r3,r24,3
	or	 r25,r0,r2
	or	 r2,r0,r22
	bsr.n	 _operand_subword_force
	or	 r4,r0,r17
	or	 r3,r0,r2
	bsr.n	 _emit_move_insn
	or	 r2,r0,r25
	ld	 r15,r31,156
	addu	 r24,r24,4
	cmp	 r13,r24,r15
	bb1.n	 lt,r13,@L1974
	addu	 r23,r23,4
@L1967:
	ld	 r15,r31,172
	cmp	 r13,r15,0
	ld	 r15,r31,240
	cmp	 r12,r15,0
	and.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L1976
	ld	 r15,r31,180
	cmp	 r13,r15,2
	bb1.n	 ne,r13,@L1976
	or	 r2,r0,46
	ld	 r4,r31,172
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr	 _anti_adjust_stack
@L1976:
@Lte20:
	ld	 r1,r31,96
	ld.d	 r24,r31,88
	ld.d	 r22,r31,80
	ld.d	 r20,r31,72
	ld.d	 r18,r31,64
	ld.d	 r16,r31,56
	ld.d	 r14,r31,48
	jmp.n	 r1
	addu	 r31,r31,208
	def	 @L2055,@L2056-@L1953
	def	 @L2053,@L2019-@L2054
	def	 @L2051,@L1888-@L2052
	def	 @L2049,@L2018-@L2050
	def	 @L2047,@L2017-@L2048
	def	 @L2045,@L1888-@L2046
	def	 @L2043,@L2016-@L2044
	def	 @L2041,@L1888-@L2042
	def	 @L2039,@L2013-@L2040
	def	 @L2037,@L2012-@L2038

	align	 8
	global	 _emit_library_call
_emit_library_call:
	subu	 r31,r31,320
	st	 r1,r31,100
	st	 r30,r31,96
	st.d	 r24,r31,88
	st.d	 r22,r31,80
	st.d	 r20,r31,72
	st.d	 r18,r31,64
	st.d	 r16,r31,56
	addu	 r30,r31,96
	st.d	 r14,r31,48
@Ltb21:
	ld	 r16,r30,228
	ld	 r17,r30,232
	st	 r16,r30,148
	ld	 r16,r30,236
	st	 r17,r30,84
	st	 r2,r30,100
	ld	 r17,r30,100
	st	 r16,r30,92
	st	 r17,r30,108
	ld	 r17,r30,92
	mak	 r13,r16,0<5>
	st	 r2,r30,224
	subu	 r31,r31,r13
	or.u	 r13,r0,hi16(_inhibit_defer_pop)
	ld	 r13,r13,lo16(_inhibit_defer_pop)
	st	 r0,r30,116
	st	 r0,r30,8
	or	 r14,r0,0
	st	 r0,r30,12
	addu	 r16,r31,48
	st	 r16,r30,132
	addu	 r22,r30,240
	bcnd.n	 le0,r17,@L2059
	st	 r13,r30,140
	ld	 r23,r30,132
	or	 r15,r0,8
	or.u	 r19,r0,hi16(_target_flags)
	or.u	 r13,r0,hi16(_mode_unit_size)
	or	 r18,r0,0
	or	 r20,r13,lo16(_mode_unit_size)
@L2061:
	addu	 r22,r22,4
	subu	 r13,r0,4
	ld	 r2,r22,r13
	addu	 r22,r22,4
	ld	 r24,r22,r13
	cmp	 r13,r24,16
	bb0	 ne,r13,@L2063
	ld.bu	 r13,r2,2
	cmp	 r13,r13,r24
	bb0	 ne,r13,@L2062
	ld.bu	 r13,r2,2
	bcnd	 eq0,r13,@L2062
@L2063:
	bsr	 _abort
	align	 4
@L2062:
	ld.hu	 r11,r0,r2
	mask	 r10,r11,0xffff
	cmp	 r13,r10,51
	cmp	 r12,r10,55
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L2064
	subu	 r13,r11,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2066
	subu	 r13,r11,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2066
	cmp	 r13,r10,49
	cmp	 r12,r10,113
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd	 ne0,r13,@L2065
@L2066:
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,47
	bb1	 ne,r13,@L2064
	ld.bu	 r13,r2,2
	bcnd	 eq0,r13,@L2064
@L2065:
	bsr.n	 _force_operand
	or	 r3,r0,0
@L2064:
	ld	 r16,r30,132
	st	 r2,r16,r18
	cmp	 r13,r24,11
	bb1.n	 ne,r13,@L2067
	st	 r24,r23,4
	bsr	 _abort
	align	 4
@L2067:
	ld	 r13,r19,lo16(_target_flags)
	bb0.n	 (31-26),r13,@L2070
	or	 r25,r0,r23
	ld	 r13,r20[r24]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L2070
	bb1.n	 (31-31),r14,@L2072
	cmp	 r13,r14,5
	addu	 r13,r14,1
	cmp	 r13,r13,5
	bb0.n	 gt,r13,@L2071
	or	 r2,r0,0
	br	 @L2069
	align	 4
@L2072:
	bb0.n	 gt,r13,@L2071
	or	 r2,r0,0
	br	 @L2069
	align	 4
@L2070:
	cmp	 r13,r14,5
	bb1.n	 gt,r13,@L2068
	or	 r2,r0,0
@L2071:
	ld	 r13,r19,lo16(_target_flags)
	bb0	 (31-26),r13,@L2074
	ld	 r13,r20[r24]
	cmp	 r13,r13,4
	bb0.n	 gt,r13,@L2075
	addu	 r4,r14,8
	bb1.n	 (31-31),r14,@L2462
	or	 r2,r0,51
	br.n	 @L2462
	addu	 r4,r14,9
	align	 4
@L2074:
	addu	 r4,r14,8
@L2075:
	or	 r2,r0,51
@L2462:
	or	 r3,r0,r24
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L2486
@L2487:
	align	 4
@L2068:
@L2069:
	st	 r2,r25,r15
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L2078
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,2
	bb1	 ne,r13,@L2078
	bsr	 _abort
	align	 4
@L2078:
	ld	 r13,r19,lo16(_target_flags)
	bb0.n	 (31-26),r13,@L2081
	or	 r21,r0,r23
	ld	 r13,r20[r24]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L2081
	bb1.n	 (31-31),r14,@L2083
	cmp	 r13,r14,5
	addu	 r13,r14,1
	cmp	 r13,r13,5
	bb0.n	 gt,r13,@L2082
	or	 r13,r0,0
	br	 @L2080
	align	 4
@L2083:
	bb0.n	 gt,r13,@L2082
	or	 r13,r0,0
	br	 @L2080
	align	 4
@L2081:
	cmp	 r13,r14,5
	bb1.n	 gt,r13,@L2080
	or	 r13,r0,0
@L2082:
	ld	 r13,r19,lo16(_target_flags)
	bb0	 (31-26),r13,@L2085
	ld	 r13,r20[r24]
	cmp	 r13,r13,4
	bb0.n	 gt,r13,@L2085
	xor	 r25,r14,1
	mask	 r25,r25,1
	br.n	 @L2086
	addu	 r25,r25,r14
	align	 4
@L2085:
	or	 r25,r0,r14
@L2086:
	cmp	 r13,r24,16
	bb1.n	 ne,r13,@L2087
	or.u	 r13,r0,hi16(_mode_size)
	bsr.n	 _int_size_in_bytes
	or	 r2,r0,0
	addu	 r13,r2,3
	bcnd	 ge0,r13,@L2089
	addu	 r13,r2,6
@L2089:
	ext	 r13,r13,0<2>
	addu	 r13,r25,r13
	subu	 r13,r13,6
	bcnd.n	 gt0,r13,@L2088
	or	 r13,r0,0
	br	 @L2080
	align	 4
@L2087:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r24]
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L2090
	addu	 r13,r12,6
@L2090:
	ext	 r13,r13,0<2>
	addu	 r13,r25,r13
	subu	 r13,r13,6
	bcnd.n	 le0,r13,@L2079
	or	 r13,r0,0
@L2088:
	ld	 r13,r19,lo16(_target_flags)
	bb0	 (31-26),r13,@L2091
	ld	 r13,r20[r24]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L2091
	bb1	 (31-31),r14,@L2091
	or	 r13,r0,5
	br.n	 @L2080
	subu	 r13,r13,r14
	align	 4
@L2091:
	or	 r13,r0,6
	subu	 r13,r13,r14
@L2079:
@L2080:
	st	 r13,r21,12
	ld	 r13,r23,8
	bcnd.n	 eq0,r13,@L2095
	or	 r4,r0,0
	ld	 r13,r23,12
	cmp	 r13,r13,0
	extu	 r4,r13,1<eq>
@L2095:
	or	 r2,r0,r24
	or	 r3,r0,0
	or	 r5,r0,0
	addu	 r6,r30,8
	addu	 r7,r23,16
	bsr.n	 _locate_and_pad_parm
	addu	 r8,r23,24
	ld	 r13,r23,28
	bcnd	 eq0,r13,@L2096
	bsr	 _abort
	align	 4
@L2096:
	ld	 r13,r30,8
	ld	 r12,r23,24
	addu	 r13,r13,r12
	st	 r13,r30,8
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L2099
	ld	 r13,r23,12
	bcnd	 eq0,r13,@L2098
@L2099:
	bsr	 _abort
	align	 4
@L2098:
	ld	 r13,r19,lo16(_target_flags)
	bb0	 (31-26),r13,@L2100
	ld	 r13,r20[r24]
	cmp	 r13,r13,4
	bb0.n	 gt,r13,@L2100
	xor	 r25,r14,1
	mask	 r25,r25,1
	br.n	 @L2101
	addu	 r25,r25,r14
	align	 4
@L2100:
	or	 r25,r0,r14
@L2101:
	cmp	 r13,r24,16
	bb0.n	 ne,r13,@L2102
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r2,r13[r24]
	br.n	 @L2463
	addu	 r13,r2,3
	align	 4
@L2102:
	bsr.n	 _int_size_in_bytes
	or	 r2,r0,0
	addu	 r13,r2,3
@L2463:
	bcnd	 ge0,r13,@L2105
	addu	 r13,r2,6
@L2105:
	ext	 r13,r13,0<2>
	addu	 r14,r25,r13
	ld	 r17,r30,116
	addu	 r23,r23,32
	ld	 r16,r30,92
	addu	 r17,r17,1
	addu	 r18,r18,32
	cmp	 r13,r17,r16
	bb1.n	 lt,r13,@L2061
	st	 r17,r30,116
@L2059:
	bsr.n	 _assemble_external_libcall
	ld	 r2,r30,100
	ld	 r12,r30,8
	addu	 r13,r12,7
	bcnd	 ge0,r13,@L2107
	addu	 r13,r12,14
@L2107:
	and	 r13,r13,0xfff8
	or	 r12,r0,r13
	cmp	 r13,r12,24
	bb1.n	 ge,r13,@L2108
	st	 r12,r30,8
	or	 r12,r0,24
@L2108:
	or.u	 r11,r0,hi16(_current_function_outgoing_args_size)
	ld	 r13,r11,lo16(_current_function_outgoing_args_size)
	cmp	 r13,r12,r13
	bb0.n	 gt,r13,@L2109
	st	 r12,r30,8
	st	 r12,r11,lo16(_current_function_outgoing_args_size)
@L2109:
	or	 r2,r0,46
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _gen_rtx
	st	 r0,r30,8
	or	 r3,r0,r2
	ld.hu	 r12,r0,r3
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2112
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2112
	mask	 r11,r12,0xffff
	cmp	 r13,r11,49
	cmp	 r12,r11,113
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L2111
	cmp	 r13,r11,51
@L2112:
	or	 r2,r0,r3
	or	 r3,r0,0
	bsr.n	 _plus_constant_wide
	addu	 r1,r1,@L2488
@L2489:
	align	 4
@L2111:
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L2448
	or	 r2,r0,r3
	bsr.n	 _copy_to_mode_reg
	or	 r2,r0,4
@L2448:
	bsr	 _anti_adjust_stack
	or.u	 r13,r0,hi16(_class_narrowest_mode+4)
	ld	 r2,r13,lo16(_class_narrowest_mode+4)
	or.u	 r13,r0,hi16(_virtual_outgoing_args_rtx)
	ld	 r3,r13,lo16(_virtual_outgoing_args_rtx)
	st	 r0,r30,76
	bsr.n	 _memory_address
	st	 r0,r30,116
	ld	 r17,r30,92
	bcnd.n	 le0,r17,@L2119
	st	 r2,r30,124
@L2121:
	ld	 r16,r30,76
	ld	 r17,r30,132
	mak	 r13,r16,0<5>
	addu	 r13,r17,r13
	ld	 r16,r13,8
	ld	 r17,r13,12
	ld	 r15,r13,4
	ld	 r25,r0,r13
	cmp	 r11,r16,0
	cmp	 r12,r17,0
	or.c	 r12,r11,r12
	st	 r16,r30,156
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L2122
	st	 r17,r30,164
	ld	 r16,r30,116
	ld	 r17,r30,132
	mak	 r13,r16,0<5>
	or	 r2,r0,46
	addu	 r13,r17,r13
	or	 r3,r0,0
	ld	 r4,r13,16
	or	 r20,r0,r25
	or	 r22,r0,0
	st	 r0,r30,172
	or	 r16,r0,1
	bsr.n	 _gen_rtx
	st	 r16,r30,180
	cmp	 r13,r15,16
	bb0.n	 ne,r13,@L2124
	or	 r21,r0,r2
	or.u	 r17,r0,hi16(_mode_size)
	or	 r17,r17,lo16(_mode_size)
	ld	 r13,r17[r15]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1	 gt,r13,@L2124
	or	 r16,r0,2
	st	 r16,r30,180
@L2124:
	ld.hu	 r12,r0,r20
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L2133
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L2464
	cmp	 r13,r12,63
	ld.bu	 r13,r20,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L2134
	ld	 r24,r20,4
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L2134
	ld	 r13,r24,4
	st	 r13,r20,4
	ld	 r13,r24,8
	bcnd	 eq0,r13,@L2137
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r20,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r20
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	br.n	 @L2132
	or	 r2,r0,r25
	align	 4
@L2134:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L2136
	cmp	 r13,r12,63
	ld	 r2,r20,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L2137
	st	 r2,r20,4
	align	 4
@L2136:
@L2464:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L2137
	ld	 r2,r20,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r20,4
	ld	 r2,r20,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r20,8
@L2137:
	br.n	 @L2132
	or	 r2,r0,r20
	align	 4
@L2133:
	ld	 r13,r20,8
	bcnd	 ne0,r13,@L2139
	ld	 r2,r20,4
	br.n	 @L2465
	or	 r20,r0,r2
	align	 4
@L2139:
	ld	 r2,r20,12
	bcnd	 ne0,r2,@L2132
	ld	 r13,r20,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r20,4
	bsr.n	 _gen_move_insn
	st	 r2,r20,12
	bsr.n	 _emit_insn_before
	ld	 r3,r20,8
	ld	 r2,r20,12
@L2132:
	or	 r20,r0,r2
@L2465:
	cmp	 r13,r15,16
	bb1.n	 ne,r13,@L2141
	or	 r19,r0,r20
	ld	 r17,r30,164
	mak	 r25,r17,0<2>
	bcnd.n	 ge0,r25,@L2142
	or	 r13,r0,r25
	addu	 r13,r25,3
@L2142:
	and	 r13,r13,0xfffc
	bcnd.n	 ne0,r22,@L2143
	subu	 r13,r25,r13
	bsr	 _abort
	align	 4
@L2143:
	ld	 r16,r30,164
	bcnd.n	 eq0,r16,@L2144
	subu	 r25,r25,r13
	ld	 r2,r20,4
	bsr.n	 _plus_constant_wide
	or	 r3,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,r20
	bsr.n	 _change_address
	or	 r3,r0,16
	or	 r19,r0,r2
@L2144:
	ld	 r17,r30,164
	bcnd.n	 eq0,r17,@L2145
	or	 r23,r0,r25
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,46
	bb1.n	 ne,r13,@L2146
	or	 r2,r0,46
	ld	 r4,r22,4
	or	 r3,r0,0
	subu	 r4,r4,r23
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L2490
@L2491:
	align	 4
@L2146:
	ld.bu	 r24,r22,2
	or	 r3,r0,0
	or.u	 r13,r0,hi16(_sub_optab)
	or	 r4,r0,r23
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_sub_optab)
	or	 r4,r0,r22
	or	 r6,r0,0
	or	 r7,r0,0
	or	 r8,r0,3
	or	 r5,r0,r2
	or	 r2,r0,r24
	bsr.n	 _expand_binop
	or	 r3,r0,r25
@L2449:
	or	 r22,r0,r2
@L2145:
	ld	 r16,r30,124
	bcnd	 ne0,r16,@L2148
	ld.hu	 r11,r0,r22
	ld	 r17,r30,180
	subu	 r13,r11,56
	mask	 r13,r13,0xffff
	cmp	 r12,r17,2
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2151
	extu	 r23,r12,1<eq>
	subu	 r13,r11,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2151
	mask	 r11,r11,0xffff
	cmp	 r13,r11,49
	cmp	 r12,r11,113
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L2150
	cmp	 r12,r11,51
@L2151:
	ld	 r3,r30,172
	or	 r2,r0,r22
	bsr.n	 _plus_constant_wide
	addu	 r1,r1,@L2492
@L2493:
	align	 4
@L2150:
	ld	 r16,r30,172
	xor.c	 r13,r16,r0
	extu	 r12,r12,1<eq>
	subu	 r13,r0,r13
	and	 r12,r12,r13
	bcnd.n	 ne0,r12,@L2450
	or	 r2,r0,r22
	or	 r2,r0,4
	bsr.n	 _copy_to_mode_reg
	or	 r3,r0,r22
	ld	 r17,r30,172
	bcnd.n	 eq0,r17,@L2155
	or	 r24,r0,r2
	ld	 r4,r30,172
	or	 r2,r0,46
	or.u	 r13,r0,hi16(_add_optab)
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_add_optab)
	or	 r5,r0,r2
	or	 r2,r0,4
	or	 r4,r0,r24
	or	 r7,r0,0
	or	 r8,r0,3
	or	 r6,r0,r4
	bsr.n	 _expand_binop
	or	 r3,r0,r25
	or	 r24,r0,r2
@L2155:
	or	 r2,r0,r24
@L2450:
	bsr	 _anti_adjust_stack
	subu	 r13,r0,r23
	ld	 r16,r30,172
	mask	 r13,r13,1
	or.u	 r12,r0,hi16(_virtual_outgoing_args_rtx)
	and	 r13,r13,r16
	ld	 r3,r12,lo16(_virtual_outgoing_args_rtx)
	bcnd.n	 eq0,r13,@L2156
	or	 r2,r0,r3
	bsr.n	 _plus_constant_wide
	ld	 r3,r30,172
	or	 r3,r0,r2
@L2156:
	or.u	 r13,r0,hi16(_class_narrowest_mode+4)
	ld	 r2,r13,lo16(_class_narrowest_mode+4)
	br.n	 @L2451
	st	 r0,r30,172
	align	 4
@L2148:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,46
	bb1.n	 ne,r13,@L2158
	or	 r2,r0,63
	ld	 r3,r21,4
	ld	 r2,r30,124
	br.n	 @L2452
	addu	 r3,r23,r3
	align	 4
@L2158:
	ld	 r4,r30,124
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r5,r0,r21
	or	 r3,r0,r23
@L2452:
	bsr	 _plus_constant_wide
	or	 r3,r0,r2
	or	 r2,r0,16
@L2451:
	bsr	 _memory_address
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,46
	bb1.n	 ne,r13,@L2160
	or	 r4,r0,r2
	ld	 r7,r22,4
	or	 r8,r0,0
	or	 r10,r0,9
	or	 r6,r0,r8
	or.u	 r13,r0,hi16(_class_narrowest_mode+4)
@L2467:
	ld	 r12,r13,lo16(_class_narrowest_mode+4)
	bcnd.n	 eq0,r12,@L2167
	or	 r11,r0,0
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r9,r13,lo16(_mode_wider_mode)
@L2169:
	or.u	 r17,r0,hi16(_mode_size)
	or	 r17,r17,lo16(_mode_size)
	ld	 r13,r17[r12]
	cmp	 r13,r13,r10
	bb1	 ge,r13,@L2168
	or	 r11,r0,r12
@L2168:
	ld	 r12,r9[r12]
	bcnd	 ne0,r12,@L2169
@L2167:
	bcnd.n	 eq0,r11,@L2164
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r13,r13,lo16(_mov_optab)
	lda.d	 r13,r13[r11]
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0.n	 ne,r13,@L2173
	or.u	 r16,r0,hi16(_mode_size)
	or	 r16,r16,lo16(_mode_size)
	ld	 r12,r16[r11]
	cmp	 r13,r12,8
	bb1.n	 gt,r13,@L2174
	cmp	 r13,r6,7
	cmp	 r13,r6,r12
	bb1.n	 ge,r13,@L2175
	or.u	 r16,r0,hi16(_mode_size)
	br	 @L2466
	align	 4
@L2174:
	bb0.n	 gt,r13,@L2466
	or.u	 r16,r0,hi16(_mode_size)
@L2175:
	or.u	 r17,r0,hi16(_mode_size)
	or	 r17,r17,lo16(_mode_size)
	ld	 r12,r17[r11]
	divu	 r13,r7,r12
	bcnd	 ne0,r12,@L2176
	tb0	 0,r0,503
@L2176:
	bcnd.n	 ne0,r12,@L2177
	addu	 r8,r8,r13
	tb0	 0,r0,503
@L2177:
	mul	 r13,r13,r12
	subu	 r7,r7,r13
@L2173:
	or.u	 r16,r0,hi16(_mode_size)
@L2466:
	or	 r16,r16,lo16(_mode_size)
	ld	 r10,r16[r11]
	cmp	 r13,r10,1
	bb1.n	 gt,r13,@L2467
	or.u	 r13,r0,hi16(_class_narrowest_mode+4)
@L2164:
	cmp	 r13,r8,1
	bb1.n	 gt,r13,@L2468
	or	 r2,r0,55
	bsr.n	 _gen_rtx
	or	 r3,r0,16
	ld	 r3,r22,4
	ld	 r22,r2,4
	ld	 r25,r19,4
	st	 r0,r30,52
	st	 r22,r30,20
	st	 r25,r30,36
	st	 r2,r30,16
	st	 r19,r30,32
	ld.hu	 r11,r0,r22
	subu	 r13,r11,85
	or	 r24,r0,0
	mask	 r13,r13,0xffff
	or	 r23,r0,9
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2181
	or	 r12,r0,0
	subu	 r13,r11,87
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb0	 ls,r13,@L2180
@L2181:
	or	 r12,r0,1
@L2180:
	st	 r12,r30,24
	ld.hu	 r12,r0,r25
	subu	 r13,r12,85
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2183
	or	 r11,r0,0
	subu	 r13,r12,87
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb0	 ls,r13,@L2182
@L2183:
	or	 r11,r0,1
@L2182:
	st	 r11,r30,40
	st	 r0,r30,44
	st	 r0,r30,28
	ld.hu	 r13,r0,r22
	cmp	 r12,r13,85
	cmp	 r13,r13,87
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L2184
	st	 r12,r30,56
	st	 r3,r30,52
@L2184:
	bcnd.n	 eq0,r11,@L2186
	st	 r3,r30,48
	ld	 r13,r30,24
	bcnd	 ne0,r13,@L2185
@L2186:
	or	 r2,r0,r3
	bsr.n	 _move_by_pieces_ninsns
	or	 r3,r0,r24
	cmp	 r2,r2,2
	bb0	 gt,r2,@L2185
	ld	 r13,r30,40
	bcnd	 ne0,r13,@L2187
	ld.hu	 r12,r0,r25
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2188
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2188
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L2187
@L2188:
	bsr.n	 _copy_addr_to_reg
	or	 r2,r0,r25
	st	 r2,r30,36
@L2187:
	ld	 r13,r30,24
	bcnd	 ne0,r13,@L2185
	ld.hu	 r12,r0,r22
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2190
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2190
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L2185
@L2190:
	bsr.n	 _copy_addr_to_reg
	or	 r2,r0,r22
	st	 r2,r30,20
@L2185:
	bcnd	 eq0,r24,@L2453
	or	 r24,r0,8
	br.n	 @L2469
	cmp	 r13,r23,1
	align	 4
@L2194:
	ld	 r12,r13,lo16(_class_narrowest_mode+4)
	bcnd.n	 eq0,r12,@L2196
	or	 r25,r0,0
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r11,r13,lo16(_mode_wider_mode)
@L2198:
	or.u	 r17,r0,hi16(_mode_size)
	or	 r17,r17,lo16(_mode_size)
	ld	 r13,r17[r12]
	cmp	 r13,r13,r23
	bb1	 ge,r13,@L2197
	or	 r25,r0,r12
@L2197:
	ld	 r12,r11[r12]
	bcnd	 ne0,r12,@L2198
@L2196:
	bcnd.n	 eq0,r25,@L2193
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r13,r13,lo16(_mov_optab)
	lda.d	 r13,r13[r25]
	ld	 r11,r13,4
	cmp	 r13,r11,210
	bb0.n	 ne,r13,@L2202
	or.u	 r16,r0,hi16(_mode_size)
	or	 r16,r16,lo16(_mode_size)
	ld	 r12,r16[r25]
	cmp	 r13,r12,8
	bb1.n	 gt,r13,@L2203
	cmp	 r13,r24,7
	cmp	 r13,r24,r12
	bb1.n	 ge,r13,@L2470
	or.u	 r13,r0,hi16(_insn_gen_function)
	br.n	 @L2471
	or.u	 r17,r0,hi16(_mode_size)
	align	 4
@L2203:
	bb0.n	 gt,r13,@L2202
	or.u	 r13,r0,hi16(_insn_gen_function)
@L2470:
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r3,r0,r25
	ld	 r2,r13[r11]
	bsr.n	 _move_by_pieces_1
	addu	 r4,r30,16
@L2202:
	or.u	 r17,r0,hi16(_mode_size)
@L2471:
	or	 r17,r17,lo16(_mode_size)
	ld	 r23,r17[r25]
@L2453:
	cmp	 r13,r23,1
@L2469:
	bb1.n	 gt,r13,@L2194
	or.u	 r13,r0,hi16(_class_narrowest_mode+4)
@L2193:
	ld	 r13,r30,48
	bcnd	 eq0,r13,@L2207
	bsr	 _abort
	align	 4
@L2160:
	or	 r2,r0,55
@L2468:
	bsr.n	 _gen_rtx
	or	 r3,r0,16
	or	 r25,r0,r2
	or	 r2,r0,46
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,0
	or	 r5,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,r19
	bsr.n	 _gen_movstrsi
	or	 r4,r0,r22
	bsr.n	 _emit_insn
	addu	 r1,r1,@L2494
@L2495:
	align	 4
@L2141:
	ld	 r16,r30,164
	bcnd.n	 le0,r16,@L2210
	or.u	 r17,r0,hi16(_mode_size)
	or	 r17,r17,lo16(_mode_size)
	ld	 r11,r17[r15]
	bcnd	 ge0,r11,@L2211
	addu	 r11,r11,3
@L2211:
	ld	 r16,r30,124
	ext	 r11,r11,0<2>
	ld	 r17,r30,172
	or	 r18,r0,0
	ld	 r21,r21,4
	cmp	 r12,r16,0
	subu	 r13,r0,r17
	extu	 r12,r12,1<eq>
	st	 r21,r30,212
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L2212
	st	 r11,r30,220
	ld	 r16,r30,180
	cmp	 r13,r16,0
	cmp	 r12,r16,2
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L2212
	or	 r2,r0,46
	ld	 r4,r30,172
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr	 _anti_adjust_stack
@L2212:
	ld	 r17,r30,124
	ld.hu	 r11,r0,r20
	cmp	 r13,r17,0
	ld	 r16,r30,164
	ext	 r13,r13,1<ne>
	subu	 r12,r11,56
	and	 r18,r18,r13
	mask	 r12,r12,0xffff
	subu	 r19,r16,r18
	cmp	 r12,r12,1
	bb1.n	 ls,r12,@L2215
	or	 r21,r0,r19
	subu	 r13,r11,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2215
	mask	 r13,r11,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L2214
@L2215:
	ld.hu	 r13,r0,r20
	cmp	 r13,r13,47
	bb1	 ne,r13,@L2214
	ld.bu	 r13,r20,2
	bcnd.n	 eq0,r13,@L2214
	or	 r2,r0,r15
	bsr.n	 _force_const_mem
	or	 r3,r0,r20
	bsr	 _validize_mem
	or	 r20,r0,r2
@L2214:
	ld.hu	 r13,r0,r20
	cmp	 r13,r13,51
	bb1	 ne,r13,@L2216
	ld	 r13,r20,4
	cmp	 r13,r13,63
	bb1.n	 gt,r13,@L2216
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r12,r20,2
	or	 r13,r13,lo16(_mode_class)
	ld	 r13,r13[r12]
	cmp	 r13,r13,1
	bb0	 ne,r13,@L2216
	bsr.n	 _copy_to_reg
	or	 r2,r0,r20
	or	 r20,r0,r2
@L2216:
	ld	 r17,r30,220
	or	 r23,r0,r21
	cmp	 r13,r23,r17
	bb1.n	 ge,r13,@L2207
	subu	 r13,r17,r23
	bb0.n	 (31-31),r13,@L2472
	addu	 r22,r21,r18
	addu	 r13,r23,r18
	cmp	 r13,r23,r13
	bb1.n	 lt,r13,@L2436
	or	 r2,r0,r20
	or	 r3,r0,r23
	bsr.n	 _operand_subword_force
	or	 r4,r0,r15
	ld	 r16,r30,212
	or	 r25,r0,r2
	or	 r2,r0,46
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	lda	 r4,r16[r19]
	st	 r2,r31,36
	ld	 r17,r30,124
	or	 r2,r0,r25
	or	 r4,r0,0
	or	 r5,r0,0
	or	 r6,r0,0
	or.u	 r13,r0,hi16(_word_mode)
	or	 r7,r0,0
	ld	 r3,r13,lo16(_word_mode)
	or	 r8,r0,0
	or	 r9,r0,0
	bsr.n	 _emit_push_insn
	st	 r17,r31,32
@L2436:
	ld	 r16,r30,220
	addu	 r23,r23,1
	cmp	 r13,r23,r16
	bb1.n	 ge,r13,@L2207
	addu	 r22,r21,r18
@L2472:
	cmp	 r13,r23,r22
	bb1.n	 lt,r13,@L2439
	or	 r2,r0,r20
	or	 r3,r0,r23
	bsr.n	 _operand_subword_force
	or	 r4,r0,r15
	ld	 r17,r30,212
	or	 r25,r0,r2
	subu	 r4,r23,r21
	or	 r2,r0,46
	addu	 r4,r4,r19
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	lda	 r4,r17[r4]
	st	 r2,r31,36
	ld	 r16,r30,124
	or	 r2,r0,r25
	or	 r4,r0,0
	or	 r5,r0,0
	or	 r6,r0,0
	or.u	 r13,r0,hi16(_word_mode)
	or	 r7,r0,0
	ld	 r3,r13,lo16(_word_mode)
	or	 r8,r0,0
	or	 r9,r0,0
	bsr.n	 _emit_push_insn
	st	 r16,r31,32
@L2439:
	addu	 r24,r23,1
	cmp	 r13,r24,r22
	bb1.n	 lt,r13,@L2442
	or	 r2,r0,r20
	or	 r3,r0,r24
	bsr.n	 _operand_subword_force
	or	 r4,r0,r15
	ld	 r17,r30,212
	or	 r25,r0,r2
	subu	 r4,r24,r21
	or	 r2,r0,46
	addu	 r4,r4,r19
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	lda	 r4,r17[r4]
	st	 r2,r31,36
	ld	 r16,r30,124
	or	 r2,r0,r25
	or	 r4,r0,0
	or	 r5,r0,0
	or	 r6,r0,0
	or.u	 r13,r0,hi16(_word_mode)
	or	 r7,r0,0
	ld	 r3,r13,lo16(_word_mode)
	or	 r8,r0,0
	or	 r9,r0,0
	bsr.n	 _emit_push_insn
	st	 r16,r31,32
@L2442:
	ld	 r17,r30,220
	addu	 r23,r23,2
	cmp	 r13,r23,r17
	bb1.n	 lt,r13,@L2472
	addu	 r22,r21,r18
	br	 @L2207
	align	 4
@L2210:
	ld	 r16,r30,124
	ld	 r17,r30,172
	cmp	 r12,r16,0
	subu	 r13,r0,r17
	extu	 r12,r12,1<eq>
	and	 r13,r13,r12
	bcnd	 eq0,r13,@L2224
	ld	 r16,r30,180
	cmp	 r13,r16,0
	cmp	 r12,r16,2
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L2224
	or	 r2,r0,46
	ld	 r4,r30,172
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr	 _anti_adjust_stack
@L2224:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,46
	bb1	 ne,r13,@L2225
	ld	 r3,r21,4
	ld	 r2,r30,124
	bsr.n	 _plus_constant_wide
	addu	 r1,r1,@L2496
@L2497:
	align	 4
@L2225:
	ld	 r4,r30,124
	or	 r2,r0,63
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r5,r0,r21
@L2454:
	or	 r3,r0,r2
	bsr.n	 _memory_address
	or	 r2,r0,r15
	or	 r4,r0,r2
	or	 r2,r0,55
	bsr.n	 _gen_rtx
	or	 r3,r0,r15
	or	 r22,r0,r2
	ld.hu	 r11,r0,r22
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r21,r22,2
	or	 r13,r13,lo16(_mode_class)
	cmp	 r12,r11,59
	ld	 r19,r13[r21]
	bb0.n	 ne,r12,@L2229
	or	 r23,r0,r20
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L2232
	cmp	 r13,r11,63
	ld	 r2,r22,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L2233
	st	 r2,r22,4
	align	 4
@L2232:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L2233
	ld	 r2,r22,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r22,4
	ld	 r2,r22,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r22,8
@L2233:
	br.n	 @L2228
	or	 r2,r0,r22
	align	 4
@L2229:
	ld	 r13,r22,8
	bcnd	 ne0,r13,@L2235
	ld	 r2,r22,4
	br	 @L2228
	align	 4
@L2235:
	ld	 r2,r22,12
	bcnd	 ne0,r2,@L2228
	ld	 r13,r22,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r22,4
	bsr.n	 _gen_move_insn
	st	 r2,r22,12
	bsr.n	 _emit_insn_before
	ld	 r3,r22,8
	ld	 r2,r22,12
@L2228:
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L2238
	or	 r22,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L2473
	cmp	 r13,r12,63
	ld.bu	 r13,r23,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L2239
	ld	 r24,r23,4
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L2239
	ld	 r13,r24,4
	st	 r13,r23,4
	ld	 r13,r24,8
	bcnd	 eq0,r13,@L2242
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r23,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r23
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	br.n	 @L2237
	or	 r2,r0,r25
	align	 4
@L2239:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L2241
	cmp	 r13,r12,63
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L2242
	st	 r2,r23,4
	align	 4
@L2241:
@L2473:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L2242
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,4
	ld	 r2,r23,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,8
@L2242:
	br.n	 @L2237
	or	 r2,r0,r23
	align	 4
@L2238:
	ld	 r13,r23,8
	bcnd	 ne0,r13,@L2244
	ld	 r2,r23,4
	br.n	 @L2474
	cmp	 r13,r21,16
	align	 4
@L2244:
	ld	 r2,r23,12
	bcnd.n	 ne0,r2,@L2474
	cmp	 r13,r21,16
	ld	 r13,r23,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r23,4
	bsr.n	 _gen_move_insn
	st	 r2,r23,12
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	ld	 r2,r23,12
@L2237:
	cmp	 r13,r21,16
@L2474:
	bb0.n	 ne,r13,@L2247
	or	 r23,r0,r2
	ld.bu	 r13,r23,2
	cmp	 r13,r13,r21
	bb0	 ne,r13,@L2246
	ld.bu	 r13,r23,2
	bcnd	 eq0,r13,@L2246
@L2247:
	bsr	 _abort
	align	 4
@L2246:
	ld.hu	 r12,r0,r23
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2249
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2249
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L2248
@L2249:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,47
	bb1	 ne,r13,@L2248
	ld.bu	 r13,r23,2
	bcnd.n	 eq0,r13,@L2248
	or	 r2,r0,r21
	bsr.n	 _force_const_mem
	or	 r3,r0,r23
	or	 r23,r0,r2
@L2248:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,55
	bb1	 ne,r13,@L2250
	ld.bu	 r2,r22,2
	bsr.n	 _memory_address_p
	ld	 r3,r22,4
	bcnd.n	 ne0,r2,@L2475
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld.bu	 r3,r22,2
	bsr.n	 _push_operand
	or	 r2,r0,r22
	bcnd.n	 eq0,r2,@L2251
	or.u	 r13,r0,hi16(_flag_force_addr)
@L2475:
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L2250
	ld	 r13,r22,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2251
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2251
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L2250
@L2251:
	ld	 r4,r22,4
	or	 r2,r0,r22
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r22,r0,r2
@L2250:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L2476
	cmp	 r13,r21,16
	ld.bu	 r2,r23,2
	bsr.n	 _memory_address_p
	ld	 r3,r23,4
	bcnd.n	 eq0,r2,@L2254
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L2253
	ld	 r13,r23,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2254
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2254
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L2476
	cmp	 r13,r21,16
@L2254:
	ld	 r4,r23,4
	or	 r2,r0,r23
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r23,r0,r2
@L2253:
	cmp	 r13,r21,16
@L2476:
	bb1.n	 ne,r13,@L2255
	subu	 r13,r19,5
	bsr	 _abort
	align	 4
@L2255:
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L2256
	or.u	 r13,r0,hi16(_mode_unit_size)
	or	 r13,r13,lo16(_mode_unit_size)
	ld	 r12,r13[r21]
	or	 r3,r0,2
	cmp	 r13,r19,5
	bb1.n	 ne,r13,@L2257
	mak	 r2,r12,0<3>
	or	 r3,r0,1
@L2257:
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	st	 r2,r30,188
@L2256:
	or.u	 r24,r0,hi16(_mov_optab)
	ld	 r11,r24,lo16(_mov_optab)
	lda.d	 r13,r11[r21]
	ld	 r12,r13,4
	cmp	 r13,r12,210
	bb0.n	 ne,r13,@L2259
	or.u	 r13,r0,hi16(_insn_gen_function)
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r2,r0,r22
	ld	 r13,r13[r12]
	jsr.n	 r13
	or	 r3,r0,r23
	bsr.n	 _emit_insn
	addu	 r1,r1,@L2498
@L2499:
	align	 4
@L2259:
	subu	 r12,r19,5
	ld	 r17,r30,188
	cmp	 r12,r12,1
	extu	 r12,r12,1<ls>
	cmp	 r13,r17,16
	extu	 r13,r13,1<ne>
	and	 r12,r12,r13
	bcnd.n	 eq0,r12,@L2261
	mak	 r25,r17,0<3>
	addu	 r13,r11,r25
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L2261
	ld.bu	 r3,r22,2
	bsr.n	 _push_operand
	or	 r2,r0,r22
	bsr.n	 _get_last_insn
	or	 r21,r0,r2
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L2262
	or	 r18,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r22
	bsr	 _emit_insn
@L2262:
	ld	 r13,r24,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	addu	 r13,r13,r25
	ld	 r24,r13,4
	bcnd.n	 eq0,r21,@L2263
	or	 r19,r12,lo16(_insn_gen_function)
	ld	 r3,r30,188
	or	 r2,r0,r22
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L2500
@L2501:
	align	 4
@L2263:
	ld	 r2,r30,188
	bsr.n	 _gen_highpart
	or	 r3,r0,r22
@L2455:
	or	 r25,r0,r2
	ld	 r2,r30,188
	bsr.n	 _gen_highpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	ld	 r13,r19[r24]
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r16,r30,188
	ld	 r13,r13,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	lda.d	 r13,r13[r16]
	ld	 r24,r13,4
	bcnd.n	 eq0,r21,@L2265
	or	 r19,r12,lo16(_insn_gen_function)
	ld	 r3,r30,188
	or	 r2,r0,r22
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L2502
@L2503:
	align	 4
@L2265:
	ld	 r2,r30,188
	bsr.n	 _gen_lowpart
	or	 r3,r0,r22
@L2456:
	or	 r25,r0,r2
	ld	 r2,r30,188
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	ld	 r13,r19[r24]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	bcnd	 eq0,r18,@L2268
	ld	 r24,r18,12
	br	 @L2269
	align	 4
@L2268:
	bsr	 _get_insns
	or	 r24,r0,r2
@L2269:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	st	 r2,r24,28
	bsr.n	 _get_last_insn
	addu	 r1,r1,@L2504
@L2505:
	align	 4
@L2261:
	or.u	 r17,r0,hi16(_mode_size)
	or	 r17,r17,lo16(_mode_size)
	ld	 r13,r17[r21]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L2271
	bsr.n	 _get_last_insn
	or	 r25,r0,0
	or	 r19,r0,r2
@L2272:
	or.u	 r16,r0,hi16(_mode_size)
	or	 r16,r16,lo16(_mode_size)
	ld	 r12,r16[r21]
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L2276
	addu	 r13,r12,6
@L2276:
	ext	 r13,r13,0<2>
	cmp	 r13,r25,r13
	bb0.n	 lt,r13,@L2273
	or	 r2,r0,r22
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	or	 r24,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	or	 r3,r0,r2
	bcnd.n	 ne0,r3,@L2477
	cmp	 r13,r24,0
	ld.hu	 r12,r0,r23
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2278
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2278
	mask	 r12,r12,0xffff
	cmp	 r13,r12,49
	cmp	 r12,r12,113
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L2277
	or	 r2,r0,r23
@L2278:
	or	 r2,r0,r21
	bsr.n	 _force_const_mem
	or	 r3,r0,r23
	or	 r23,r0,r2
	or	 r3,r0,r25
	or	 r4,r0,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	addu	 r1,r1,@L2506
@L2507:
	align	 4
@L2277:
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r21
@L2457:
	or	 r3,r0,r2
	cmp	 r13,r24,0
@L2477:
	cmp	 r12,r3,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L2281
	or	 r2,r0,r24
	bsr	 _abort
	align	 4
@L2281:
	addu	 r25,r25,1
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L2508
@L2509:
	align	 4
@L2273:
	bcnd	 eq0,r19,@L2283
	ld	 r24,r19,12
	br	 @L2284
	align	 4
@L2283:
	bsr	 _get_insns
	or	 r24,r0,r2
@L2284:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	br.n	 @L2207
	st	 r2,r24,28
	align	 4
@L2271:
	bsr	 _abort
	align	 4
@L2207:
	ld	 r17,r30,164
	bcnd	 le0,r17,@L2286
	or	 r22,r0,r20
	ld.hu	 r12,r0,r22
	subu	 r13,r12,56
	ld	 r16,r30,156
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	ld	 r25,r16,4
	bb1.n	 ls,r13,@L2289
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2289
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L2478
@L2289:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,47
	bb1	 ne,r13,@L2288
	ld.bu	 r13,r22,2
	bcnd.n	 eq0,r13,@L2288
	or	 r2,r0,r15
	bsr.n	 _force_const_mem
	or	 r3,r0,r22
	bsr	 _validize_mem
	or	 r22,r0,r2
@L2288:
	ld	 r17,r30,164
@L2478:
	bcnd.n	 le0,r17,@L2286
	or	 r24,r0,0
	or	 r23,r0,r25
	mask	 r12,r17,3
	bcnd.n	 eq0,r12,@L2293
	or.u	 r21,r0,hi16(_word_mode)
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L2416
	cmp	 r13,r12,2
	bb0	 gt,r13,@L2417
	or	 r2,r0,51
	ld	 r3,r21,lo16(_word_mode)
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r25,r0,r2
	or	 r2,r0,r22
	or	 r3,r0,0
	or	 r4,r0,r15
	bsr.n	 _operand_subword_force
	addu	 r23,r23,1
	or	 r3,r0,r2
	or	 r2,r0,r25
	bsr.n	 _emit_move_insn
	or	 r24,r0,1
@L2417:
	ld	 r3,r21,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r25,r0,r2
	or	 r2,r0,r22
	or	 r3,r0,r24
	or	 r4,r0,r15
	bsr.n	 _operand_subword_force
	addu	 r23,r23,1
	or	 r3,r0,r2
	or	 r2,r0,r25
	bsr.n	 _emit_move_insn
	addu	 r24,r24,1
@L2416:
	ld	 r3,r21,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r25,r0,r2
	or	 r2,r0,r22
	or	 r3,r0,r24
	bsr.n	 _operand_subword_force
	or	 r4,r0,r15
	or	 r3,r0,r2
	bsr.n	 _emit_move_insn
	or	 r2,r0,r25
	ld	 r16,r30,164
	addu	 r24,r24,1
	cmp	 r13,r24,r16
	bb0.n	 lt,r13,@L2286
	addu	 r23,r23,1
@L2293:
	ld	 r3,r21,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r25,r0,r2
	or	 r2,r0,r22
	or	 r3,r0,r24
	bsr.n	 _operand_subword_force
	or	 r4,r0,r15
	or	 r3,r0,r2
	bsr.n	 _emit_move_insn
	or	 r2,r0,r25
	ld	 r3,r21,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	addu	 r4,r23,1
	addu	 r3,r24,1
	or	 r25,r0,r2
	or	 r2,r0,r22
	bsr.n	 _operand_subword_force
	or	 r4,r0,r15
	or	 r3,r0,r2
	bsr.n	 _emit_move_insn
	or	 r2,r0,r25
	ld	 r3,r21,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	addu	 r4,r23,2
	addu	 r3,r24,2
	or	 r25,r0,r2
	or	 r2,r0,r22
	bsr.n	 _operand_subword_force
	or	 r4,r0,r15
	or	 r3,r0,r2
	bsr.n	 _emit_move_insn
	or	 r2,r0,r25
	ld	 r3,r21,lo16(_word_mode)
	or	 r2,r0,51
	bsr.n	 _gen_rtx
	addu	 r4,r23,3
	addu	 r3,r24,3
	or	 r25,r0,r2
	or	 r2,r0,r22
	bsr.n	 _operand_subword_force
	or	 r4,r0,r15
	or	 r3,r0,r2
	bsr.n	 _emit_move_insn
	or	 r2,r0,r25
	ld	 r17,r30,164
	addu	 r24,r24,4
	cmp	 r13,r24,r17
	bb1.n	 lt,r13,@L2293
	addu	 r23,r23,4
@L2286:
	ld	 r16,r30,124
	ld	 r17,r30,172
	cmp	 r12,r16,0
	subu	 r13,r0,r17
	extu	 r12,r12,1<eq>
	and	 r13,r13,r12
	bcnd	 eq0,r13,@L2122
	ld	 r16,r30,180
	cmp	 r13,r16,2
	bb1.n	 ne,r13,@L2122
	or	 r2,r0,46
	ld	 r4,r30,172
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr	 _anti_adjust_stack
@L2122:
	ld	 r17,r30,116
	or.u	 r13,r0,hi16(_inhibit_defer_pop)
	ld	 r16,r30,76
	ld	 r12,r13,lo16(_inhibit_defer_pop)
	addu	 r16,r16,1
	st	 r16,r30,76
	ld	 r16,r30,92
	addu	 r17,r17,1
	st	 r17,r30,116
	addu	 r12,r12,1
	cmp	 r11,r17,r16
	bb1.n	 lt,r11,@L2121
	st	 r12,r13,lo16(_inhibit_defer_pop)
@L2119:
	ld	 r17,r30,92
	st	 r0,r30,76
	bcnd.n	 le0,r17,@L2298
	st	 r0,r30,116
	or.u	 r18,r0,hi16(_mov_optab)
	or.u	 r13,r0,hi16(_insn_gen_function)
	or.u	 r12,r0,hi16(_mode_size)
	or	 r19,r13,lo16(_insn_gen_function)
	or	 r15,r12,lo16(_mode_size)
@L2300:
	ld	 r16,r30,76
	ld	 r17,r30,132
	mak	 r13,r16,0<5>
	addu	 r13,r17,r13
	ld	 r3,r13,8
	ld	 r12,r13,12
	cmp	 r11,r3,0
	cmp	 r12,r12,0
	and.c	 r11,r12,r11
	extu	 r11,r11,1<eq>
	ld	 r2,r0,r13
	bcnd.n	 eq0,r11,@L2301
	or	 r22,r0,r3
	ld.hu	 r11,r0,r22
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r21,r22,2
	or	 r13,r13,lo16(_mode_class)
	cmp	 r12,r11,59
	ld	 r20,r13[r21]
	bb0.n	 ne,r12,@L2304
	or	 r23,r0,r2
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L2307
	cmp	 r13,r11,63
	ld	 r2,r22,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L2308
	st	 r2,r22,4
	align	 4
@L2307:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L2308
	ld	 r2,r22,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r22,4
	ld	 r2,r22,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r22,8
@L2308:
	br.n	 @L2303
	or	 r2,r0,r22
	align	 4
@L2304:
	ld	 r13,r22,8
	bcnd	 ne0,r13,@L2310
	ld	 r2,r22,4
	br	 @L2303
	align	 4
@L2310:
	ld	 r2,r22,12
	bcnd	 ne0,r2,@L2303
	ld	 r13,r22,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r22,4
	bsr.n	 _gen_move_insn
	st	 r2,r22,12
	bsr.n	 _emit_insn_before
	ld	 r3,r22,8
	ld	 r2,r22,12
@L2303:
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L2313
	or	 r22,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L2479
	cmp	 r13,r12,63
	ld.bu	 r13,r23,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L2314
	ld	 r24,r23,4
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L2314
	ld	 r13,r24,4
	st	 r13,r23,4
	ld	 r13,r24,8
	bcnd	 eq0,r13,@L2317
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r23,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r23
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	br.n	 @L2312
	or	 r2,r0,r25
	align	 4
@L2314:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L2316
	cmp	 r13,r12,63
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L2317
	st	 r2,r23,4
	align	 4
@L2316:
@L2479:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L2317
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,4
	ld	 r2,r23,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,8
@L2317:
	br.n	 @L2312
	or	 r2,r0,r23
	align	 4
@L2313:
	ld	 r13,r23,8
	bcnd	 ne0,r13,@L2319
	ld	 r2,r23,4
	br.n	 @L2480
	cmp	 r13,r21,16
	align	 4
@L2319:
	ld	 r2,r23,12
	bcnd.n	 ne0,r2,@L2480
	cmp	 r13,r21,16
	ld	 r13,r23,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r23,4
	bsr.n	 _gen_move_insn
	st	 r2,r23,12
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	ld	 r2,r23,12
@L2312:
	cmp	 r13,r21,16
@L2480:
	bb0.n	 ne,r13,@L2322
	or	 r23,r0,r2
	ld.bu	 r13,r23,2
	cmp	 r13,r13,r21
	bb0	 ne,r13,@L2321
	ld.bu	 r13,r23,2
	bcnd	 eq0,r13,@L2321
@L2322:
	bsr	 _abort
	align	 4
@L2321:
	ld.hu	 r12,r0,r23
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2324
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2324
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L2323
@L2324:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,47
	bb1	 ne,r13,@L2323
	ld.bu	 r13,r23,2
	bcnd.n	 eq0,r13,@L2323
	or	 r2,r0,r21
	bsr.n	 _force_const_mem
	or	 r3,r0,r23
	or	 r23,r0,r2
@L2323:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,55
	bb1	 ne,r13,@L2325
	ld.bu	 r2,r22,2
	bsr.n	 _memory_address_p
	ld	 r3,r22,4
	bcnd.n	 ne0,r2,@L2481
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld.bu	 r3,r22,2
	bsr.n	 _push_operand
	or	 r2,r0,r22
	bcnd.n	 eq0,r2,@L2326
	or.u	 r13,r0,hi16(_flag_force_addr)
@L2481:
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L2325
	ld	 r13,r22,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2326
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2326
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L2325
@L2326:
	ld	 r4,r22,4
	or	 r2,r0,r22
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r22,r0,r2
@L2325:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L2482
	cmp	 r13,r21,16
	ld.bu	 r2,r23,2
	bsr.n	 _memory_address_p
	ld	 r3,r23,4
	bcnd.n	 eq0,r2,@L2329
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L2328
	ld	 r13,r23,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2329
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2329
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L2482
	cmp	 r13,r21,16
@L2329:
	ld	 r4,r23,4
	or	 r2,r0,r23
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r23,r0,r2
@L2328:
	cmp	 r13,r21,16
@L2482:
	bb1.n	 ne,r13,@L2330
	subu	 r13,r20,5
	bsr	 _abort
	align	 4
@L2330:
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L2331
	or.u	 r13,r0,hi16(_mode_unit_size)
	or	 r13,r13,lo16(_mode_unit_size)
	ld	 r12,r13[r21]
	or	 r3,r0,2
	cmp	 r13,r20,5
	bb1.n	 ne,r13,@L2332
	mak	 r2,r12,0<3>
	or	 r3,r0,1
@L2332:
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	st	 r2,r30,196
@L2331:
	ld	 r11,r18,lo16(_mov_optab)
	lda.d	 r13,r11[r21]
	ld	 r12,r13,4
	cmp	 r13,r12,210
	bb0	 ne,r13,@L2334
	ld	 r13,r19[r12]
	or	 r2,r0,r22
	jsr.n	 r13
	or	 r3,r0,r23
	bsr.n	 _emit_insn
	addu	 r1,r1,@L2510
@L2511:
	align	 4
@L2334:
	subu	 r12,r20,5
	ld	 r16,r30,196
	cmp	 r12,r12,1
	extu	 r12,r12,1<ls>
	cmp	 r13,r16,16
	extu	 r13,r13,1<ne>
	and	 r12,r12,r13
	bcnd.n	 eq0,r12,@L2336
	mak	 r25,r16,0<3>
	addu	 r13,r11,r25
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L2336
	ld.bu	 r3,r22,2
	bsr.n	 _push_operand
	or	 r2,r0,r22
	bsr.n	 _get_last_insn
	or	 r21,r0,r2
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L2337
	or	 r20,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r22
	bsr	 _emit_insn
@L2337:
	ld	 r13,r18,lo16(_mov_optab)
	addu	 r13,r13,r25
	ld	 r24,r13,4
	bcnd	 eq0,r21,@L2338
	or	 r2,r0,r22
	ld	 r3,r30,196
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L2512
@L2513:
	align	 4
@L2338:
	ld	 r2,r30,196
	bsr.n	 _gen_highpart
	or	 r3,r0,r22
@L2458:
	or	 r25,r0,r2
	ld	 r2,r30,196
	bsr.n	 _gen_highpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	ld	 r13,r19[r24]
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	ld	 r13,r18,lo16(_mov_optab)
	ld	 r17,r30,196
	lda.d	 r13,r13[r17]
	ld	 r24,r13,4
	bcnd	 eq0,r21,@L2340
	or	 r2,r0,r22
	ld	 r3,r30,196
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L2514
@L2515:
	align	 4
@L2340:
	ld	 r2,r30,196
	bsr.n	 _gen_lowpart
	or	 r3,r0,r22
@L2459:
	or	 r25,r0,r2
	ld	 r2,r30,196
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	ld	 r13,r19[r24]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	bcnd	 eq0,r20,@L2343
	ld	 r24,r20,12
	br	 @L2344
	align	 4
@L2343:
	bsr	 _get_insns
	or	 r24,r0,r2
@L2344:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	st	 r2,r24,28
	bsr.n	 _get_last_insn
	addu	 r1,r1,@L2516
@L2517:
	align	 4
@L2336:
	ld	 r13,r15[r21]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L2346
	bsr.n	 _get_last_insn
	or	 r25,r0,0
	or	 r20,r0,r2
@L2347:
	ld	 r12,r15[r21]
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L2351
	addu	 r13,r12,6
@L2351:
	ext	 r13,r13,0<2>
	cmp	 r13,r25,r13
	bb0.n	 lt,r13,@L2348
	or	 r2,r0,r22
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	or	 r24,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	or	 r3,r0,r2
	bcnd.n	 ne0,r3,@L2483
	cmp	 r13,r24,0
	ld.hu	 r12,r0,r23
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2353
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2353
	mask	 r12,r12,0xffff
	cmp	 r13,r12,49
	cmp	 r12,r12,113
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L2352
	or	 r2,r0,r23
@L2353:
	or	 r2,r0,r21
	bsr.n	 _force_const_mem
	or	 r3,r0,r23
	or	 r23,r0,r2
	or	 r3,r0,r25
	or	 r4,r0,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	addu	 r1,r1,@L2518
@L2519:
	align	 4
@L2352:
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r21
@L2460:
	or	 r3,r0,r2
	cmp	 r13,r24,0
@L2483:
	cmp	 r12,r3,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L2356
	or	 r2,r0,r24
	bsr	 _abort
	align	 4
@L2356:
	addu	 r25,r25,1
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L2520
@L2521:
	align	 4
@L2348:
	bcnd	 eq0,r20,@L2358
	ld	 r24,r20,12
	br	 @L2359
	align	 4
@L2358:
	bsr	 _get_insns
	or	 r24,r0,r2
@L2359:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	br.n	 @L2301
	st	 r2,r24,28
	align	 4
@L2346:
	bsr	 _abort
	align	 4
@L2301:
	ld	 r16,r30,116
	or.u	 r13,r0,hi16(_inhibit_defer_pop)
	ld	 r17,r30,76
	ld	 r12,r13,lo16(_inhibit_defer_pop)
	addu	 r17,r17,1
	st	 r17,r30,76
	ld	 r17,r30,92
	addu	 r16,r16,1
	st	 r16,r30,116
	addu	 r12,r12,1
	cmp	 r11,r16,r17
	bb1.n	 lt,r11,@L2300
	st	 r12,r13,lo16(_inhibit_defer_pop)
@L2298:
	ld	 r16,r30,148
	bcnd.n	 ne0,r16,@L2362
	or.u	 r13,r0,hi16(_pending_chain)
	ld	 r25,r13,lo16(_pending_chain)
	bcnd	 eq0,r25,@L2362
	or	 r24,r0,r13
@L2366:
	bsr.n	 _emit_insn
	ld	 r2,r25,16
	ld	 r13,r25,20
	st	 r2,r25,8
	or	 r25,r0,r13
	bcnd.n	 ne0,r25,@L2366
	st	 r25,r24,lo16(_pending_chain)
@L2362:
	bsr	 _start_sequence
	ld	 r17,r30,92
	bcnd.n	 le0,r17,@L2369
	st	 r0,r30,116
	mask	 r12,r17,3
	ld	 r25,r30,132
	bcnd.n	 eq0,r12,@L2371
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L2389
	cmp	 r13,r12,2
	bb0	 gt,r13,@L2390
	ld	 r4,r25,8
	bcnd.n	 eq0,r4,@L2392
	or	 r2,r0,41
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr	 _emit_insn
@L2392:
	or	 r16,r0,1
	st	 r16,r30,116
	addu	 r25,r25,32
@L2390:
	ld	 r4,r25,8
	bcnd.n	 eq0,r4,@L2395
	or	 r2,r0,41
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr	 _emit_insn
@L2395:
	ld	 r17,r30,116
	addu	 r25,r25,32
	addu	 r17,r17,1
	st	 r17,r30,116
@L2389:
	ld	 r4,r25,8
	bcnd.n	 eq0,r4,@L2398
	or	 r2,r0,41
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr	 _emit_insn
@L2398:
	ld	 r16,r30,116
	ld	 r17,r30,92
	addu	 r16,r16,1
	addu	 r25,r25,32
	cmp	 r13,r16,r17
	bb0.n	 lt,r13,@L2369
	st	 r16,r30,116
@L2371:
	ld	 r4,r25,8
	bcnd.n	 eq0,r4,@L2401
	or	 r2,r0,41
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr	 _emit_insn
@L2401:
	ld	 r4,r25,40
	bcnd.n	 eq0,r4,@L2404
	or	 r2,r0,41
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr	 _emit_insn
@L2404:
	ld	 r4,r25,72
	bcnd.n	 eq0,r4,@L2407
	or	 r2,r0,41
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr	 _emit_insn
@L2407:
	ld	 r4,r25,104
	bcnd.n	 eq0,r4,@L2410
	or	 r2,r0,41
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr	 _emit_insn
@L2410:
	ld	 r16,r30,116
	ld	 r17,r30,92
	addu	 r16,r16,4
	addu	 r25,r25,128
	cmp	 r13,r16,r17
	bb1.n	 lt,r13,@L2371
	st	 r16,r30,116
@L2369:
	bsr	 _get_insns
	bsr.n	 _end_sequence
	st	 r2,r30,64
	or	 r3,r0,0
	ld	 r2,r30,100
	bsr.n	 _prepare_call_address
	addu	 r4,r30,64
	ld	 r16,r30,108
	or.u	 r12,r0,hi16(_inhibit_defer_pop)
	st	 r2,r30,100
	ld	 r13,r12,lo16(_inhibit_defer_pop)
	ld	 r2,r16,4
	addu	 r13,r13,1
	bsr.n	 _get_identifier
	st	 r13,r12,lo16(_inhibit_defer_pop)
	or.u	 r13,r0,hi16(_target_flags)
	ld	 r13,r13,lo16(_target_flags)
	bb0.n	 (31-26),r13,@L2376
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_mode_unit_size)
	ld	 r13,r13,lo16(_mode_unit_size)
	cmp	 r13,r13,4
	bb0	 gt,r13,@L2376
	bb1.n	 (31-31),r14,@L2378
	cmp	 r13,r14,5
	addu	 r13,r14,1
	cmp	 r13,r13,5
	bb0.n	 gt,r13,@L2484
	or.u	 r13,r0,hi16(_void_type_node)
	br.n	 @L2375
	or	 r25,r0,0
	align	 4
@L2378:
	bb0.n	 gt,r13,@L2484
	or.u	 r13,r0,hi16(_void_type_node)
	br.n	 @L2375
	or	 r25,r0,0
	align	 4
@L2376:
	cmp	 r13,r14,5
	bb1.n	 gt,r13,@L2375
	or	 r25,r0,0
	or.u	 r13,r0,hi16(_void_type_node)
@L2484:
	ld	 r13,r13,lo16(_void_type_node)
	bcnd	 eq0,r13,@L2380
	ld	 r13,r13,8
	bb1.n	 (31-11),r13,@L2374
	or	 r25,r0,0
@L2380:
	or.u	 r13,r0,hi16(_target_flags)
	ld	 r13,r13,lo16(_target_flags)
	bb0.n	 (31-26),r13,@L2381
	or.u	 r13,r0,hi16(_mode_unit_size)
	ld	 r13,r13,lo16(_mode_unit_size)
	cmp	 r13,r13,4
	bb0.n	 gt,r13,@L2382
	addu	 r4,r14,8
	bb1.n	 (31-31),r14,@L2485
	or	 r2,r0,51
	br.n	 @L2485
	addu	 r4,r14,9
	align	 4
@L2381:
	addu	 r4,r14,8
@L2382:
	or	 r2,r0,51
@L2485:
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	or	 r25,r0,r2
@L2374:
@L2375:
	ld	 r17,r30,84
	bcnd.n	 eq0,r17,@L2385
	or	 r7,r0,0
	bsr.n	 _hard_libcall_value
	ld	 r2,r30,84
	or	 r7,r0,r2
@L2385:
	ld	 r2,r30,100
	ld	 r4,r30,8
	ld	 r9,r30,64
	or	 r3,r0,r24
	ld	 r16,r30,140
	or	 r5,r0,0
	ld	 r17,r30,148
	or	 r6,r0,r25
	addu	 r8,r16,1
	bsr.n	 _emit_call_1
	st	 r17,r31,32
	or.u	 r12,r0,hi16(_inhibit_defer_pop)
@Lte21:
	subu	 r31,r30,96
	ld	 r13,r12,lo16(_inhibit_defer_pop)
	ld	 r1,r31,100
	ld	 r30,r31,96
	ld.d	 r24,r31,88
	ld.d	 r22,r31,80
	ld.d	 r20,r31,72
	ld.d	 r18,r31,64
	ld.d	 r16,r31,56
	ld.d	 r14,r31,48
	addu	 r31,r31,320
	subu	 r13,r13,1
	jmp.n	 r1
	st	 r13,r12,lo16(_inhibit_defer_pop)
	def	 @L2520,@L2521-@L2347
	def	 @L2518,@L2460-@L2519
	def	 @L2516,@L2301-@L2517
	def	 @L2514,@L2459-@L2515
	def	 @L2512,@L2458-@L2513
	def	 @L2510,@L2301-@L2511
	def	 @L2508,@L2509-@L2272
	def	 @L2506,@L2457-@L2507
	def	 @L2504,@L2207-@L2505
	def	 @L2502,@L2456-@L2503
	def	 @L2500,@L2455-@L2501
	def	 @L2498,@L2207-@L2499
	def	 @L2496,@L2454-@L2497
	def	 @L2494,@L2207-@L2495
	def	 @L2492,@L2450-@L2493
	def	 @L2490,@L2449-@L2491
	def	 @L2488,@L2448-@L2489
	def	 @L2486,@L2069-@L2487

	align	 8
	global	 _expand_assignment
_expand_assignment:
	subu	 r31,r31,112
	st	 r1,r31,80
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	or	 r23,r0,r2
	st.d	 r20,r31,56
@Ltb22:
	ld.bu	 r13,r23,8
	or	 r21,r0,r3
	or	 r20,r0,r4
	mask	 r12,r13,0xff
	bcnd.n	 ne0,r12,@L2536
	or	 r24,r0,0
	or	 r2,r0,r21
	or	 r3,r0,0
	or	 r4,r0,0
	or	 r5,r0,0
	bsr.n	 _expand_expr
	addu	 r1,r1,@L2552
@L2553:
	align	 4
@L2536:
	subu	 r13,r13,37
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2538
	cmp	 r13,r12,42
	bb1	 ne,r13,@L2537
	ld	 r13,r23,20
	ld.bu	 r13,r13,8
	cmp	 r13,r13,25
	bb1	 ne,r13,@L2537
	ld	 r13,r23,4
	ld	 r13,r13,16
	ld.bu	 r13,r13,8
	cmp	 r13,r13,25
	bb1	 ne,r13,@L2537
@L2538:
	or	 r2,r0,r23
	addu	 r3,r31,88
	addu	 r4,r31,92
	addu	 r5,r31,96
	addu	 r6,r31,100
	addu	 r7,r31,104
	addu	 r8,r31,108
	bsr.n	 _get_inner_reference
	st	 r0,r31,108
	ld	 r12,r31,100
	cmp	 r13,r20,0
	cmp	 r12,r12,0
	and.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L2539
	or	 r22,r0,r2
	bsr	 _stabilize_reference
	or	 r22,r0,r2
@L2539:
	or	 r2,r0,r22
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld	 r13,r31,96
	bcnd.n	 eq0,r13,@L2540
	or	 r24,r0,r2
	or	 r2,r0,r13
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb0.n	 ne,r13,@L2541
	or	 r3,r0,r2
	bsr	 _abort
	align	 4
@L2541:
	or	 r2,r0,4
	bsr.n	 _force_reg
	ld	 r25,r24,4
	or	 r5,r0,r2
	or	 r2,r0,63
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L2540:
	ld	 r13,r31,108
	bcnd	 eq0,r13,@L2542
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1	 ne,r13,@L2542
	ld	 r13,r0,r24
	or	 r13,r13,16
	st	 r13,r0,r24
@L2542:
	bsr.n	 _int_size_in_bytes
	ld	 r2,r22,4
	ld	 r3,r31,88
	ld	 r4,r31,92
	ld	 r5,r31,100
	bcnd.n	 eq0,r20,@L2544
	or	 r12,r0,r2
	ld	 r13,r23,4
	ld.bu	 r7,r13,24
	br	 @L2545
	align	 4
@L2544:
	or	 r7,r0,0
@L2545:
	ld	 r13,r22,4
	ld	 r9,r13,28
	or	 r2,r0,r24
	ld	 r8,r31,104
	or	 r6,r0,r21
	extu	 r9,r9,0<3>
	st	 r12,r31,32
	bsr.n	 _store_field
	addu	 r1,r1,@L2554
@L2555:
	align	 4
@L2537:
	bcnd.n	 ne0,r24,@L2546
	or	 r2,r0,r23
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r24,r0,r2
@L2546:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,35
	bb0.n	 eq,r13,@L2550
	or	 r2,r0,r21
	ld.bu	 r13,r21,8
	cmp	 r13,r13,39
	bb0.n	 eq,r13,@L2551
	or	 r3,r0,r24
	or.u	 r13,r0,hi16(_current_function_returns_struct)
	ld	 r13,r13,lo16(_current_function_returns_struct)
	bcnd.n	 eq0,r13,@L2551
	or.u	 r13,r0,hi16(_current_function_returns_pcc_struct)
	ld	 r13,r13,lo16(_current_function_returns_pcc_struct)
	bcnd	 ne0,r13,@L2551
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r25,r0,r2
	bsr.n	 _expr_size
	or	 r2,r0,r21
	ld	 r6,r24,4
	ld	 r8,r25,4
	st	 r2,r31,32
	or	 r3,r0,0
	or	 r4,r0,0
	or	 r5,r0,3
	or.u	 r13,r0,hi16(_memcpy_libfunc)
	or	 r7,r0,4
	ld	 r2,r13,lo16(_memcpy_libfunc)
	or	 r9,r0,4
	or	 r13,r0,4
	bsr.n	 _emit_library_call
	st	 r13,r31,36
	bsr.n	 _preserve_temp_slots
	or	 r2,r0,r24
	bsr	 _free_temp_slots
	br.n	 @L2548
	or	 r2,r0,r24
	align	 4
@L2550:
	or	 r3,r0,r24
@L2551:
	bsr.n	 _store_expr
	or	 r4,r0,r20
@L2549:
	bsr.n	 _preserve_temp_slots
	or	 r25,r0,r2
	bsr	 _free_temp_slots
	or	 r2,r0,r25
@L2548:
@Lte22:
	ld	 r1,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	jmp.n	 r1
	addu	 r31,r31,112
	def	 @L2554,@L2549-@L2555
	def	 @L2552,@L2548-@L2553

	align	 8
	global	 _store_expr
_store_expr:
	subu	 r31,r31,144
	st	 r1,r31,96
	st.d	 r24,r31,88
	st.d	 r22,r31,80
	st.d	 r20,r31,72
	st.d	 r18,r31,64
	st.d	 r16,r31,56
	or	 r20,r0,r2
	st.d	 r14,r31,48
@Ltb23:
	ld.bu	 r12,r20,8
	or	 r18,r0,r3
	or	 r23,r0,r4
	cmp	 r13,r12,44
	bb1.n	 ne,r13,@L2557
	st	 r0,r31,108
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r2,r20,16
	or	 r4,r0,0
	ld	 r3,r13,lo16(_const0_rtx)
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or.u	 r13,r0,hi16(_pending_chain)
	ld	 r25,r13,lo16(_pending_chain)
	bcnd.n	 eq0,r25,@L2558
	or	 r24,r0,r13
@L2561:
	bsr.n	 _emit_insn
	ld	 r2,r25,16
	ld	 r13,r25,20
	st	 r2,r25,8
	or	 r25,r0,r13
	bcnd.n	 ne0,r25,@L2561
	st	 r25,r24,lo16(_pending_chain)
@L2558:
	ld	 r2,r20,20
	or	 r3,r0,r18
	or	 r4,r0,r23
	bsr.n	 _store_expr
	addu	 r1,r1,@L3297
@L3298:
	align	 4
@L2557:
	cmp	 r13,r12,48
	bb1	 ne,r13,@L2564
	ld.bu	 r13,r18,2
	cmp	 r13,r13,16
	bb1	 ne,r13,@L2564
	bsr	 _gen_label_rtx
	bsr.n	 _gen_label_rtx
	or	 r22,r0,r2
	or.u	 r13,r0,hi16(_pending_chain)
	ld	 r25,r13,lo16(_pending_chain)
	bcnd.n	 eq0,r25,@L2565
	or	 r21,r0,r2
	or	 r24,r0,r13
@L2568:
	bsr.n	 _emit_insn
	ld	 r2,r25,16
	ld	 r13,r25,20
	st	 r2,r25,8
	or	 r25,r0,r13
	bcnd.n	 ne0,r25,@L2568
	st	 r25,r24,lo16(_pending_chain)
@L2565:
	ld.hu	 r12,r0,r18
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L2571
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L2574
	cmp	 r13,r12,63
	ld	 r2,r18,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L2575
	st	 r2,r18,4
	align	 4
@L2574:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L2575
	ld	 r2,r18,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r18,4
	ld	 r2,r18,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r18,8
@L2575:
	br.n	 @L2570
	or	 r2,r0,r18
	align	 4
@L2571:
	ld	 r13,r18,8
	bcnd	 ne0,r13,@L2577
	ld	 r2,r18,4
	br.n	 @L3242
	or.u	 r12,r0,hi16(_inhibit_defer_pop)
	align	 4
@L2577:
	ld	 r2,r18,12
	bcnd.n	 ne0,r2,@L3242
	or.u	 r12,r0,hi16(_inhibit_defer_pop)
	ld	 r13,r18,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r18,4
	bsr.n	 _gen_move_insn
	st	 r2,r18,12
	bsr.n	 _emit_insn_before
	ld	 r3,r18,8
	ld	 r2,r18,12
@L2570:
	or.u	 r12,r0,hi16(_inhibit_defer_pop)
@L3242:
	ld	 r13,r12,lo16(_inhibit_defer_pop)
	or	 r18,r0,r2
	ld	 r2,r20,16
	or	 r3,r0,r22
	addu	 r13,r13,1
	bsr.n	 _jumpifnot
	st	 r13,r12,lo16(_inhibit_defer_pop)
	or	 r3,r0,r18
	ld	 r2,r20,20
	bsr.n	 _store_expr
	or	 r4,r0,r23
	or.u	 r13,r0,hi16(_pending_chain)
	ld	 r25,r13,lo16(_pending_chain)
	bcnd	 eq0,r25,@L2579
	or	 r24,r0,r13
@L2582:
	bsr.n	 _emit_insn
	ld	 r2,r25,16
	ld	 r13,r25,20
	st	 r2,r25,8
	or	 r25,r0,r13
	bcnd.n	 ne0,r25,@L2582
	st	 r25,r24,lo16(_pending_chain)
@L2579:
	bsr.n	 _gen_jump
	or	 r2,r0,r21
	bsr	 _emit_jump_insn
	bsr	 _emit_barrier
	bsr.n	 _emit_label
	or	 r2,r0,r22
	ld	 r2,r20,24
	or	 r3,r0,r18
	bsr.n	 _store_expr
	or	 r4,r0,r23
	or.u	 r13,r0,hi16(_pending_chain)
	ld	 r25,r13,lo16(_pending_chain)
	bcnd.n	 eq0,r25,@L2584
	or	 r24,r0,r13
@L2587:
	bsr.n	 _emit_insn
	ld	 r2,r25,16
	ld	 r13,r25,20
	st	 r2,r25,8
	or	 r25,r0,r13
	bcnd.n	 ne0,r25,@L2587
	st	 r25,r24,lo16(_pending_chain)
@L2584:
	bsr.n	 _emit_label
	or	 r2,r0,r21
	or.u	 r12,r0,hi16(_inhibit_defer_pop)
	ld	 r13,r12,lo16(_inhibit_defer_pop)
	or	 r2,r0,r18
	subu	 r13,r13,1
	br.n	 @L3102
	st	 r13,r12,lo16(_inhibit_defer_pop)
	align	 4
@L2564:
	bcnd	 eq0,r23,@L2590
	ld.hu	 r13,r0,r18
	cmp	 r13,r13,55
	bb1	 ne,r13,@L2590
	ld.bu	 r13,r18,2
	cmp	 r13,r13,16
	bb0.n	 ne,r13,@L2590
	or.u	 r13,r0,hi16(_cse_not_expected)
	ld	 r3,r13,lo16(_cse_not_expected)
	ld.bu	 r4,r18,2
	cmp	 r3,r3,0
	or	 r2,r0,r20
	ext	 r3,r3,1<eq>
	or	 r5,r0,0
	bsr.n	 _expand_expr
	and	 r3,r18,r3
	or	 r16,r0,r2
	ld.bu	 r13,r16,2
	cmp	 r12,r13,16
	cmp	 r13,r13,0
	or	 r12,r12,r13
	extu	 r13,r12,1<eq>
	xor	 r12,r13,1
	bcnd.n	 eq0,r12,@L3241
	or	 r14,r0,1
	bsr	 _copy_to_reg
	br.n	 @L3241
	or	 r16,r0,r2
	align	 4
@L2590:
	ld.hu	 r12,r0,r18
	cmp	 r13,r12,64
	bb0.n	 ls,r13,@L2607
	cmp	 r13,r12,63
	bb0.n	 lo,r13,@L2602
	cmp	 r13,r12,55
	bb0.n	 ne,r13,@L2599
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L2596
	or	 r2,r0,1
	br.n	 @L2596
	or	 r2,r0,0
	align	 4
@L2607:
	cmp	 r13,r12,66
	bb0.n	 ne,r13,@L2602
	or	 r2,r0,0
	br	 @L2596
	align	 4
@L2599:
	ld	 r2,r18,4
	bsr.n	 _queued_subexp_p
	addu	 r1,r1,@L3299
@L3300:
	align	 4
@L2602:
	ld	 r2,r18,4
	bsr.n	 _queued_subexp_p
	or	 r25,r0,0
	bcnd	 ne0,r2,@L2604
	bsr.n	 _queued_subexp_p
	ld	 r2,r18,8
	bcnd.n	 eq0,r2,@L2596
	or	 r2,r0,r25
@L2604:
	or	 r25,r0,1
	or	 r2,r0,r25
@L2596:
	bcnd	 eq0,r2,@L2595
	ld.bu	 r13,r18,2
	cmp	 r12,r13,16
	cmp	 r13,r13,0
	or	 r12,r12,r13
	extu	 r13,r12,1<eq>
	xor	 r12,r13,1
	bcnd.n	 eq0,r12,@L2608
	or	 r2,r0,r20
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r18,2
	ld.bu	 r4,r18,2
	or	 r16,r0,r2
	or	 r2,r0,r20
	or	 r5,r0,0
	br.n	 @L3213
	or	 r3,r0,r16
	align	 4
@L2608:
	ld.bu	 r4,r18,2
	or	 r3,r0,0
	or	 r5,r0,0
@L3213:
	bsr.n	 _expand_expr
	or	 r14,r0,1
	br.n	 @L3241
	or	 r16,r0,r2
	align	 4
@L2595:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	ld	 r4,r0,r18
	and	 r13,r4,0x8
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L2611
	extu	 r4,r4,8<8>
	or	 r2,r0,r20
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld	 r21,r18,4
	ld	 r11,r0,r18
	or	 r16,r0,r2
	ld.bu	 r22,r16,2
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r20,r21,2
	or	 r13,r13,lo16(_mode_class)
	ld	 r12,r13[r20]
	or	 r17,r0,99
	ld	 r13,r13[r22]
	extu	 r19,r11,1<5>
	cmp	 r12,r12,2
	cmp	 r13,r13,2
	extu	 r18,r12,1<eq>
	or	 r23,r0,r16
	bcnd.n	 eq0,r19,@L2613
	extu	 r15,r13,1<eq>
	or	 r17,r0,100
@L2613:
	ld.hu	 r12,r0,r21
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L2616
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L2619
	cmp	 r13,r12,63
	ld	 r2,r21,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L2620
	st	 r2,r21,4
	align	 4
@L2619:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L2620
	ld	 r2,r21,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r21,4
	ld	 r2,r21,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r21,8
@L2620:
	br.n	 @L2615
	or	 r2,r0,r21
	align	 4
@L2616:
	ld	 r13,r21,8
	bcnd	 ne0,r13,@L2622
	ld	 r2,r21,4
	br	 @L2615
	align	 4
@L2622:
	ld	 r2,r21,12
	bcnd	 ne0,r2,@L2615
	ld	 r13,r21,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r21,4
	bsr.n	 _gen_move_insn
	st	 r2,r21,12
	bsr.n	 _emit_insn_before
	ld	 r3,r21,8
	ld	 r2,r21,12
@L2615:
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L2625
	or	 r21,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L3243
	cmp	 r13,r12,63
	ld.bu	 r13,r23,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L2626
	ld	 r24,r23,4
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L2626
	ld	 r13,r24,4
	st	 r13,r23,4
	ld	 r13,r24,8
	bcnd	 eq0,r13,@L2629
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r23,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r23
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	br.n	 @L2624
	or	 r2,r0,r25
	align	 4
@L2626:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L2628
	cmp	 r13,r12,63
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L2629
	st	 r2,r23,4
	align	 4
@L2628:
@L3243:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L2629
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,4
	ld	 r2,r23,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,8
@L2629:
	br.n	 @L2624
	or	 r2,r0,r23
	align	 4
@L2625:
	ld	 r13,r23,8
	bcnd	 ne0,r13,@L2631
	ld	 r2,r23,4
	br.n	 @L3244
	cmp	 r13,r18,r15
	align	 4
@L2631:
	ld	 r2,r23,12
	bcnd.n	 ne0,r2,@L3244
	cmp	 r13,r18,r15
	ld	 r13,r23,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r23,4
	bsr.n	 _gen_move_insn
	st	 r2,r23,12
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	ld	 r2,r23,12
@L2624:
	cmp	 r13,r18,r15
@L3244:
	bb0.n	 ne,r13,@L2633
	or	 r23,r0,r2
	bsr	 _abort
	align	 4
@L2633:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	ld	 r11,r0,r23
	and	 r13,r11,0x8
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L3245
	ld	 r13,r23,4
	or.u	 r12,r0,hi16(_mode_size)
	ld.bu	 r13,r13,2
	or	 r12,r12,lo16(_mode_size)
	ld	 r13,r12[r13]
	ld	 r12,r12[r20]
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L2634
	extu	 r13,r11,1<5>
	cmp	 r13,r13,r19
	bb1.n	 ne,r13,@L2634
	or	 r2,r0,r20
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	or	 r22,r0,r20
	or	 r23,r0,r2
@L2634:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
@L3245:
	ld	 r13,r0,r21
	and	 r13,r13,0x8
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L2635
	cmp	 r13,r20,r22
	bsr	 _abort
	align	 4
@L2635:
	bb0.n	 ne,r13,@L3246
	or	 r2,r0,r21
	bcnd	 ne0,r22,@L2636
	ld.hu	 r12,r0,r23
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3246
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3246
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L2636
@L3246:
	or	 r3,r0,r23
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L3301
@L3302:
	align	 4
@L2636:
	bcnd.n	 eq0,r18,@L2638
	cmp	 r5,r22,8
	cmp	 r13,r20,9
	extu	 r11,r5,1<eq>
	extu	 r7,r13,1<eq>
	and	 r13,r11,r7
	bcnd.n	 ne0,r13,@L3214
	or	 r2,r0,108
	cmp	 r6,r20,11
	extu	 r12,r6,1<eq>
	and	 r13,r11,r12
	bcnd.n	 ne0,r13,@L3214
	or	 r2,r0,109
	cmp	 r8,r22,9
	extu	 r9,r8,1<eq>
	and	 r13,r9,r12
	bcnd.n	 eq0,r13,@L2641
	cmp	 r4,r20,11
	br.n	 @L3214
	or	 r2,r0,110
	align	 4
@L2641:
	cmp	 r10,r20,8
	extu	 r11,r10,1<eq>
	and	 r13,r9,r11
	bcnd.n	 ne0,r13,@L3214
	or	 r2,r0,111
	cmp	 r9,r22,11
	extu	 r12,r9,1<eq>
	and	 r13,r12,r11
	bcnd.n	 ne0,r13,@L3214
	or	 r2,r0,112
	and	 r13,r12,r7
	bcnd.n	 eq0,r13,@L2644
	cmp	 r12,r20,9
	or	 r2,r0,113
@L3214:
	or	 r3,r0,r21
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L3303
@L3304:
	align	 4
@L2644:
	bb0.n	 ne,r8,@L2654
	or	 r2,r0,0
	bb0.n	 ls,r8,@L2676
	cmp	 r13,r22,10
	bb0.n	 ne,r5,@L2646
	cmp	 r13,r20,10
	br	 @L2645
	align	 4
@L2676:
	bb0	 ne,r13,@L2662
	bb0	 ne,r9,@L2668
	br	 @L2645
	align	 4
@L2646:
	bb0	 ne,r13,@L2649
	bb0	 ls,r13,@L2653
	bb0.n	 ne,r12,@L2648
	or.u	 r13,r0,hi16(_extendsfdf2_libfunc)
	br	 @L2645
	align	 4
@L2653:
	bb0.n	 ne,r4,@L2650
	or.u	 r13,r0,hi16(_extendsftf2_libfunc)
	br	 @L2645
	align	 4
@L2648:
	ld	 r2,r13,lo16(_extendsfdf2_libfunc)
	br	 @L2645
	align	 4
@L2649:
	or.u	 r13,r0,hi16(_extendsfxf2_libfunc)
	ld	 r2,r13,lo16(_extendsfxf2_libfunc)
	br	 @L2645
	align	 4
@L2650:
	ld	 r2,r13,lo16(_extendsftf2_libfunc)
	br	 @L2645
	align	 4
@L2654:
	cmp	 r13,r20,10
	bb0	 ne,r13,@L2657
	bb0	 ls,r13,@L2661
	bb0.n	 ne,r10,@L2656
	or.u	 r13,r0,hi16(_truncdfsf2_libfunc)
	br	 @L2645
	align	 4
@L2661:
	bb0.n	 ne,r6,@L2658
	or.u	 r13,r0,hi16(_extenddftf2_libfunc)
	br	 @L2645
	align	 4
@L2656:
	ld	 r2,r13,lo16(_truncdfsf2_libfunc)
	br	 @L2645
	align	 4
@L2657:
	or.u	 r13,r0,hi16(_extenddfxf2_libfunc)
	ld	 r2,r13,lo16(_extenddfxf2_libfunc)
	br	 @L2645
	align	 4
@L2658:
	ld	 r2,r13,lo16(_extenddftf2_libfunc)
	br	 @L2645
	align	 4
@L2662:
	bb0.n	 ne,r10,@L2664
	or.u	 r13,r0,hi16(_truncxfsf2_libfunc)
	bb0.n	 ne,r12,@L2665
	or.u	 r13,r0,hi16(_truncxfdf2_libfunc)
	br	 @L2645
	align	 4
@L2664:
	ld	 r2,r13,lo16(_truncxfsf2_libfunc)
	br	 @L2645
	align	 4
@L2665:
	ld	 r2,r13,lo16(_truncxfdf2_libfunc)
	br	 @L2645
	align	 4
@L2668:
	bb0.n	 ne,r10,@L2670
	or.u	 r13,r0,hi16(_trunctfsf2_libfunc)
	bb0.n	 ne,r12,@L2671
	or.u	 r13,r0,hi16(_trunctfdf2_libfunc)
	br	 @L2645
	align	 4
@L2670:
	ld	 r2,r13,lo16(_trunctfsf2_libfunc)
	br	 @L2645
	align	 4
@L2671:
	ld	 r2,r13,lo16(_trunctfdf2_libfunc)
@L2645:
	bcnd.n	 ne0,r2,@L2677
	or	 r3,r0,1
	bsr	 _abort
	align	 4
@L2677:
	or	 r4,r0,r20
	or	 r5,r0,1
	or	 r6,r0,r23
	bsr.n	 _emit_library_call
	or	 r7,r0,r22
	or	 r2,r0,r20
	bsr.n	 _hard_libcall_value
	addu	 r1,r1,@L3305
@L3306:
	align	 4
@L2638:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r24,r13,lo16(_mode_size)
	ld	 r13,r24[r22]
	ld	 r12,r24[r20]
	mak	 r13,r13,0<3>
	mak	 r11,r12,0<3>
	cmp	 r13,r13,r11
	bb1.n	 ge,r13,@L3247
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r11,32
	bb0.n	 gt,r13,@L2678
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L2679
	addu	 r13,r12,6
@L2679:
	or	 r2,r0,r20
	or	 r3,r0,r22
	or	 r4,r0,r19
	bsr.n	 _can_extend_p
	ext	 r18,r13,0<2>
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb1.n	 ne,r13,@L3248
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r24[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L2682
	or.u	 r24,r0,hi16(_word_mode)
	or	 r2,r0,r20
	ld	 r3,r24,lo16(_word_mode)
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0	 ne,r13,@L2682
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r21
	or	 r3,r0,r23
	bsr.n	 _convert_move
	or	 r4,r0,r19
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r21
	or	 r4,r0,r2
	or	 r2,r0,r25
	br.n	 @L3216
	or	 r3,r0,r21
	align	 4
@L2682:
	bsr	 _start_sequence
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L2684
	or	 r25,r0,r22
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r25,r13,lo16(_word_mode)
	br.n	 @L3249
	or	 r2,r0,r25
	align	 4
@L2684:
	or	 r2,r0,r25
@L3249:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
	or	 r24,r0,r2
	or	 r2,r0,r25
	bsr.n	 _gen_lowpart
	or	 r3,r0,r21
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
	bcnd.n	 eq0,r19,@L2688
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r24,r13,lo16(_const0_rtx)
	br.n	 @L3250
	or.u	 r13,r0,hi16(_mode_size)
	align	 4
@L2688:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r2,r13[r25]
	mak	 r2,r2,0<3>
	bsr.n	 _size_int
	subu	 r2,r2,1
	or	 r5,r0,r2
	or	 r2,r0,78
	or	 r3,r0,r25
	or	 r4,r0,r24
	or	 r6,r0,0
	bsr.n	 _expand_shift
	or	 r7,r0,0
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_word_mode)
	or	 r4,r0,1
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _convert_to_mode
	or	 r3,r0,r24
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_mode_size)
@L3250:
	or	 r13,r13,lo16(_mode_size)
	ld	 r2,r13[r25]
	bcnd	 ge0,r2,@L2690
	addu	 r2,r2,3
@L2690:
	ext	 r22,r2,0<2>
	cmp	 r13,r22,r18
	bb0.n	 lt,r13,@L2692
	subu	 r13,r18,r22
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L2694
	subu	 r25,r18,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L3178
	cmp	 r13,r12,2
	bb0.n	 gt,r13,@L3179
	or	 r2,r0,r21
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r20
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L3183
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L3183:
	bb1	 eq,r13,@L3181
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L3181:
	addu	 r22,r22,1
@L3179:
	or	 r2,r0,r21
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r20
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L3187
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L3187:
	bb1	 eq,r13,@L3185
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L3185:
	addu	 r22,r22,1
@L3178:
	or	 r2,r0,r21
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r20
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L3191
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L3191:
	bb1	 eq,r13,@L3189
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L3189:
	addu	 r22,r22,1
	cmp	 r13,r22,r18
	bb0	 lt,r13,@L2692
@L2694:
	or	 r2,r0,r21
@L3251:
	subu	 r3,r25,1
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r20
	bcnd.n	 ne0,r2,@L3195
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L3195:
	bb1	 eq,r13,@L3193
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L3193:
	or	 r2,r0,r21
	subu	 r3,r25,2
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r20
	bcnd.n	 ne0,r2,@L3199
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L3199:
	bb1	 eq,r13,@L3197
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L3197:
	or	 r2,r0,r21
	subu	 r3,r25,3
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r20
	bcnd.n	 ne0,r2,@L3203
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L3203:
	bb1	 eq,r13,@L3201
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L3201:
	or	 r2,r0,r21
	or	 r4,r0,1
	subu	 r25,r25,4
	or	 r5,r0,r20
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L3207
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L3207:
	bb1	 eq,r13,@L3205
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L3205:
	addu	 r22,r22,4
	cmp	 r13,r22,r18
	bb1.n	 lt,r13,@L3251
	or	 r2,r0,r21
@L2692:
	bsr	 _get_insns
	bsr.n	 _end_sequence
	or	 r25,r0,r2
	or	 r2,r0,r17
	or	 r3,r0,r20
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r6,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,r21
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_no_conflict_block
	addu	 r1,r1,@L3307
@L3308:
	align	 4
@L2678:
	or.u	 r13,r0,hi16(_mode_size)
@L3247:
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,32
	bb0.n	 gt,r13,@L2698
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	or	 r2,r0,r21
	br.n	 @L3217
	or	 r4,r0,0
	align	 4
@L2698:
	cmp	 r13,r20,3
	bb1.n	 ne,r13,@L2699
	cmp	 r13,r22,3
	cmp	 r13,r22,4
	bb0.n	 ne,r13,@L2700
	or	 r2,r0,4
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
@L2700:
	bsr	 _abort
	align	 4
@L2699:
	bb1.n	 ne,r13,@L3252
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r20,4
	bb0.n	 ne,r13,@L2702
	or	 r2,r0,4
	or	 r3,r0,r23
	or	 r4,r0,r19
	bsr.n	 _convert_to_mode
	or	 r22,r0,4
	br.n	 @L2701
	or	 r23,r0,r2
	align	 4
@L2702:
	bsr	 _abort
	align	 4
@L2701:
	or.u	 r13,r0,hi16(_mode_size)
@L3252:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r20]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb1.n	 ge,r12,@L3253
	or.u	 r13,r0,hi16(_mode_size)
	ld	 r13,r0,r23
	or.u	 r12,r0,0x37
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L2706
	or.u	 r13,r0,hi16(_direct_load)
	or	 r13,r13,lo16(_direct_load)
	ld.b	 r13,r20,r13
	bcnd	 eq0,r13,@L2706
	bsr.n	 _mode_dependent_address_p
	ld	 r2,r23,4
	bcnd.n	 eq0,r2,@L3254
	or	 r2,r0,r20
@L2706:
	ld.hu	 r13,r0,r23
	cmp	 r12,r13,51
	cmp	 r13,r13,53
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L2704
	or	 r2,r0,r20
@L3254:
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	addu	 r1,r1,@L3309
@L3310:
	align	 4
@L2704:
	or.u	 r13,r0,hi16(_mode_size)
@L3253:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r20]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb0.n	 gt,r12,@L2707
	or	 r2,r0,r20
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0.n	 ne,r13,@L2708
	or.u	 r13,r0,hi16(_optimize)
@L3248:
	ld	 r13,r13,lo16(_optimize)
	bcnd	 le0,r13,@L2709
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L3255
	or	 r2,r0,r25
	or	 r2,r0,r22
	bsr.n	 _force_reg
	or	 r3,r0,r23
	or	 r23,r0,r2
@L2709:
	or	 r2,r0,r25
@L3255:
	or	 r3,r0,r21
	or	 r4,r0,r23
@L3216:
	or	 r5,r0,r17
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L3311
@L3312:
	align	 4
@L2708:
	or	 r25,r0,r22
	bcnd.n	 eq0,r25,@L2712
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r24,r13,lo16(_mode_wider_mode)
	or	 r2,r0,r20
@L3256:
	or	 r3,r0,r25
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	cmp	 r2,r2,210
	bb1.n	 eq,r2,@L2713
	or	 r2,r0,r25
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	cmp	 r2,r2,210
	bb1.n	 ne,r2,@L3104
	or	 r2,r0,r25
@L2713:
	ld	 r25,r24[r25]
	bcnd.n	 ne0,r25,@L3256
	or	 r2,r0,r20
@L2712:
	bsr	 _abort
	align	 4
@L2707:
	cmp	 r13,r22,6
	extu	 r11,r13,1<eq>
	cmp	 r13,r20,4
	extu	 r13,r13,1<eq>
	and	 r13,r11,r13
	bcnd.n	 eq0,r13,@L2717
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L3313
@L3314:
	align	 4
@L2717:
	cmp	 r13,r20,2
	extu	 r9,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L2718
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L3315
@L3316:
	align	 4
@L2718:
	cmp	 r13,r20,1
	extu	 r10,r13,1<eq>
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L2719
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L3317
@L3318:
	align	 4
@L2719:
	cmp	 r13,r22,4
	extu	 r11,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L2720
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L3319
@L3320:
	align	 4
@L2720:
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L2721
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L3321
@L3322:
	align	 4
@L2721:
	cmp	 r13,r22,2
	extu	 r13,r13,1<eq>
	and	 r13,r13,r10
	bcnd.n	 eq0,r13,@L2722
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L3323
@L3324:
	align	 4
@L2722:
	bb1	 ge,r12,@L2723
	or	 r2,r0,r20
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	bsr.n	 _force_reg
	or	 r2,r0,r20
@L3215:
	or	 r3,r0,r2
	or	 r2,r0,r21
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L3325
@L3326:
	align	 4
@L2723:
	bsr	 _abort
	align	 4
@L3104:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
@L3218:
	or	 r3,r0,r2
	or	 r2,r0,r21
	or	 r4,r0,r19
@L3217:
	bsr	 _convert_move
@L2612:
	br.n	 @L3102
	or	 r2,r0,r16
	align	 4
@L2611:
	or	 r2,r0,r20
	or	 r3,r0,r18
	bsr.n	 _expand_expr
	or	 r5,r0,0
	bcnd.n	 eq0,r18,@L2726
	or	 r16,r0,r2
	ld.hu	 r13,r0,r18
	cmp	 r13,r13,51
	bb1	 ne,r13,@L2726
	ld	 r13,r18,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L3257
	cmp	 r13,r16,r18
@L2726:
	ld.hu	 r12,r0,r16
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2727
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2727
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L3257
	cmp	 r13,r16,r18
@L2727:
	or	 r14,r0,1
@L3241:
	st	 r14,r31,108
	cmp	 r13,r16,r18
@L3257:
	bb0	 ne,r13,@L2728
	ld.bu	 r13,r20,8
	bcnd	 eq0,r13,@L2728
	ld.hu	 r12,r0,r18
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L2730
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L2733
	cmp	 r13,r12,63
	ld	 r2,r18,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L2734
	st	 r2,r18,4
	align	 4
@L2733:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L2734
	ld	 r2,r18,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r18,4
	ld	 r2,r18,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r18,8
@L2734:
	br.n	 @L2729
	or	 r2,r0,r18
	align	 4
@L2730:
	ld	 r13,r18,8
	bcnd	 ne0,r13,@L2736
	ld	 r2,r18,4
	br.n	 @L3258
	or	 r18,r0,r2
	align	 4
@L2736:
	ld	 r2,r18,12
	bcnd	 ne0,r2,@L2729
	ld	 r13,r18,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r18,4
	bsr.n	 _gen_move_insn
	st	 r2,r18,12
	bsr.n	 _emit_insn_before
	ld	 r3,r18,8
	ld	 r2,r18,12
@L2729:
	or	 r18,r0,r2
@L3258:
	ld.bu	 r12,r16,2
	ld.bu	 r2,r18,2
	cmp	 r13,r12,r2
	bb0	 ne,r13,@L2738
	bcnd	 eq0,r12,@L2738
	ld	 r13,r20,4
	ld	 r13,r13,8
	ld	 r14,r31,108
	bcnd.n	 eq0,r14,@L2739
	extu	 r19,r13,1<17>
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	ld	 r11,r0,r16
	and	 r13,r11,0x8
	or	 r25,r0,r16
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L2741
	or	 r24,r0,r2
	ld	 r13,r16,4
	or.u	 r12,r0,hi16(_mode_size)
	ld.bu	 r13,r13,2
	or	 r12,r12,lo16(_mode_size)
	ld	 r13,r12[r13]
	ld	 r12,r12[r24]
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L2741
	extu	 r13,r11,1<5>
	cmp	 r13,r13,r19
	bb1	 ne,r13,@L2741
	bsr.n	 _gen_lowpart
	or	 r3,r0,r16
	or	 r25,r0,r2
@L2741:
	ld.bu	 r13,r25,2
	cmp	 r13,r24,r13
	bb0.n	 ne,r13,@L2740
	or	 r16,r0,r25
	bcnd.n	 eq0,r19,@L2743
	or.u	 r13,r0,hi16(_mode_class)
	or	 r13,r13,lo16(_mode_class)
	ld	 r13,r13[r24]
	cmp	 r13,r13,1
	bb1.n	 ne,r13,@L2743
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r24]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,64
	bb1	 ne,r13,@L2743
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb1	 ne,r13,@L3103
	ld	 r2,r25,4
	bcnd.n	 ge0,r2,@L2743
	or	 r3,r0,0
	bsr.n	 _immed_double_const
	or	 r4,r0,r24
	br.n	 @L2740
	or	 r16,r0,r2
	align	 4
@L2743:
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb0.n	 ne,r13,@L3259
	or	 r2,r0,r24
@L3103:
	or.u	 r13,r0,hi16(_mode_class)
	or	 r12,r13,lo16(_mode_class)
	ld	 r13,r12[r24]
	cmp	 r13,r13,1
	bb1.n	 ne,r13,@L3260
	or	 r2,r0,r24
	ld.bu	 r11,r25,2
	ld	 r13,r12[r11]
	cmp	 r13,r13,1
	bb1	 ne,r13,@L3260
	ld.hu	 r10,r0,r25
	cmp	 r13,r10,47
	bb0.n	 ne,r13,@L3259
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r24]
	ld	 r13,r13[r11]
	cmp	 r12,r12,r13
	bb1	 gt,r12,@L3260
	ld	 r13,r0,r25
	or.u	 r12,r0,0x37
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L3261
	cmp	 r13,r10,51
	or.u	 r13,r0,hi16(_direct_load)
	or	 r13,r13,lo16(_direct_load)
	ld.b	 r13,r24,r13
	bcnd.n	 ne0,r13,@L3259
	cmp	 r13,r10,51
@L3261:
	bb1.n	 ne,r13,@L2744
	or	 r2,r0,r24
@L3259:
	bsr.n	 _gen_lowpart
	or	 r3,r0,r25
	br.n	 @L2740
	or	 r16,r0,r2
	align	 4
@L2744:
@L3260:
	bsr.n	 _gen_reg_rtx
	or	 r23,r0,r25
	ld.bu	 r22,r23,2
	or	 r16,r0,r2
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r21,r16,2
	or	 r13,r13,lo16(_mode_class)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	or	 r15,r0,99
	cmp	 r12,r12,2
	cmp	 r13,r13,2
	extu	 r17,r12,1<eq>
	or	 r20,r0,r16
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r19,@L2748
	st	 r13,r31,116
	or	 r15,r0,100
@L2748:
	ld.hu	 r12,r0,r16
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L2751
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L2754
	cmp	 r13,r12,63
	ld	 r2,r16,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L2755
	st	 r2,r16,4
	align	 4
@L2754:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L2755
	ld	 r2,r20,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r20,4
	ld	 r2,r20,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r20,8
@L2755:
	br.n	 @L2750
	or	 r2,r0,r20
	align	 4
@L2751:
	ld	 r13,r16,8
	bcnd	 ne0,r13,@L2757
	ld	 r2,r16,4
	br	 @L2750
	align	 4
@L2757:
	ld	 r2,r16,12
	bcnd	 ne0,r2,@L2750
	ld	 r13,r16,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r16,4
	bsr.n	 _gen_move_insn
	st	 r2,r16,12
	bsr.n	 _emit_insn_before
	ld	 r3,r16,8
	ld	 r2,r16,12
@L2750:
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L2760
	or	 r20,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L3262
	cmp	 r13,r12,63
	ld.bu	 r13,r23,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L2761
	ld	 r24,r23,4
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L2761
	ld	 r13,r24,4
	st	 r13,r23,4
	ld	 r13,r24,8
	bcnd	 eq0,r13,@L2764
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r23,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r23
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	br.n	 @L2759
	or	 r2,r0,r25
	align	 4
@L2761:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L2763
	cmp	 r13,r12,63
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L2764
	st	 r2,r23,4
	align	 4
@L2763:
@L3262:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L2764
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,4
	ld	 r2,r23,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,8
@L2764:
	br.n	 @L2759
	or	 r2,r0,r23
	align	 4
@L2760:
	ld	 r13,r23,8
	bcnd	 ne0,r13,@L2766
	ld	 r2,r23,4
	br	 @L2759
	align	 4
@L2766:
	ld	 r2,r23,12
	bcnd	 ne0,r2,@L2759
	ld	 r13,r23,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r23,4
	bsr.n	 _gen_move_insn
	st	 r2,r23,12
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	ld	 r2,r23,12
@L2759:
	ld	 r14,r31,116
	cmp	 r13,r17,r14
	bb0.n	 ne,r13,@L2768
	or	 r23,r0,r2
	bsr	 _abort
	align	 4
@L2768:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	ld	 r11,r0,r23
	and	 r13,r11,0x8
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L3263
	ld	 r13,r23,4
	or.u	 r12,r0,hi16(_mode_size)
	ld.bu	 r13,r13,2
	or	 r12,r12,lo16(_mode_size)
	ld	 r13,r12[r13]
	ld	 r12,r12[r21]
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L2769
	extu	 r13,r11,1<5>
	cmp	 r13,r13,r19
	bb1.n	 ne,r13,@L2769
	or	 r2,r0,r21
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	or	 r22,r0,r21
	or	 r23,r0,r2
@L2769:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
@L3263:
	ld	 r13,r0,r20
	and	 r13,r13,0x8
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L2770
	cmp	 r13,r21,r22
	bsr	 _abort
	align	 4
@L2770:
	bb0.n	 ne,r13,@L3264
	or	 r2,r0,r20
	bcnd	 ne0,r22,@L2771
	ld.hu	 r12,r0,r23
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3264
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3264
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L2771
@L3264:
	or	 r3,r0,r23
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L3327
@L3328:
	align	 4
@L2771:
	bcnd.n	 eq0,r17,@L2773
	cmp	 r5,r22,8
	cmp	 r13,r21,9
	extu	 r11,r5,1<eq>
	extu	 r7,r13,1<eq>
	and	 r13,r11,r7
	bcnd.n	 ne0,r13,@L3219
	or	 r2,r0,108
	cmp	 r6,r21,11
	extu	 r12,r6,1<eq>
	and	 r13,r11,r12
	bcnd.n	 ne0,r13,@L3219
	or	 r2,r0,109
	cmp	 r8,r22,9
	extu	 r9,r8,1<eq>
	and	 r13,r9,r12
	bcnd.n	 eq0,r13,@L2776
	cmp	 r4,r21,11
	br.n	 @L3219
	or	 r2,r0,110
	align	 4
@L2776:
	cmp	 r10,r21,8
	extu	 r11,r10,1<eq>
	and	 r13,r9,r11
	bcnd.n	 ne0,r13,@L3219
	or	 r2,r0,111
	cmp	 r9,r22,11
	extu	 r12,r9,1<eq>
	and	 r13,r12,r11
	bcnd.n	 ne0,r13,@L3219
	or	 r2,r0,112
	and	 r13,r12,r7
	bcnd.n	 eq0,r13,@L2779
	cmp	 r12,r21,9
	or	 r2,r0,113
@L3219:
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L3329
@L3330:
	align	 4
@L2779:
	bb0.n	 ne,r8,@L2789
	or	 r2,r0,0
	bb0.n	 ls,r8,@L2811
	cmp	 r13,r22,10
	bb0.n	 ne,r5,@L2781
	cmp	 r13,r21,10
	br	 @L2780
	align	 4
@L2811:
	bb0	 ne,r13,@L2797
	bb0	 ne,r9,@L2803
	br	 @L2780
	align	 4
@L2781:
	bb0	 ne,r13,@L2784
	bb0	 ls,r13,@L2788
	bb0.n	 ne,r12,@L2783
	or.u	 r13,r0,hi16(_extendsfdf2_libfunc)
	br	 @L2780
	align	 4
@L2788:
	bb0.n	 ne,r4,@L2785
	or.u	 r13,r0,hi16(_extendsftf2_libfunc)
	br	 @L2780
	align	 4
@L2783:
	ld	 r2,r13,lo16(_extendsfdf2_libfunc)
	br	 @L2780
	align	 4
@L2784:
	or.u	 r13,r0,hi16(_extendsfxf2_libfunc)
	ld	 r2,r13,lo16(_extendsfxf2_libfunc)
	br	 @L2780
	align	 4
@L2785:
	ld	 r2,r13,lo16(_extendsftf2_libfunc)
	br	 @L2780
	align	 4
@L2789:
	cmp	 r13,r21,10
	bb0	 ne,r13,@L2792
	bb0	 ls,r13,@L2796
	bb0.n	 ne,r10,@L2791
	or.u	 r13,r0,hi16(_truncdfsf2_libfunc)
	br	 @L2780
	align	 4
@L2796:
	bb0.n	 ne,r6,@L2793
	or.u	 r13,r0,hi16(_extenddftf2_libfunc)
	br	 @L2780
	align	 4
@L2791:
	ld	 r2,r13,lo16(_truncdfsf2_libfunc)
	br	 @L2780
	align	 4
@L2792:
	or.u	 r13,r0,hi16(_extenddfxf2_libfunc)
	ld	 r2,r13,lo16(_extenddfxf2_libfunc)
	br	 @L2780
	align	 4
@L2793:
	ld	 r2,r13,lo16(_extenddftf2_libfunc)
	br	 @L2780
	align	 4
@L2797:
	bb0.n	 ne,r10,@L2799
	or.u	 r13,r0,hi16(_truncxfsf2_libfunc)
	bb0.n	 ne,r12,@L2800
	or.u	 r13,r0,hi16(_truncxfdf2_libfunc)
	br	 @L2780
	align	 4
@L2799:
	ld	 r2,r13,lo16(_truncxfsf2_libfunc)
	br	 @L2780
	align	 4
@L2800:
	ld	 r2,r13,lo16(_truncxfdf2_libfunc)
	br	 @L2780
	align	 4
@L2803:
	bb0.n	 ne,r10,@L2805
	or.u	 r13,r0,hi16(_trunctfsf2_libfunc)
	bb0.n	 ne,r12,@L2806
	or.u	 r13,r0,hi16(_trunctfdf2_libfunc)
	br	 @L2780
	align	 4
@L2805:
	ld	 r2,r13,lo16(_trunctfsf2_libfunc)
	br	 @L2780
	align	 4
@L2806:
	ld	 r2,r13,lo16(_trunctfdf2_libfunc)
@L2780:
	bcnd.n	 ne0,r2,@L2812
	or	 r3,r0,1
	bsr	 _abort
	align	 4
@L2812:
	or	 r4,r0,r21
	or	 r5,r0,1
	or	 r6,r0,r23
	bsr.n	 _emit_library_call
	or	 r7,r0,r22
	or	 r2,r0,r21
	bsr.n	 _hard_libcall_value
	addu	 r1,r1,@L3331
@L3332:
	align	 4
@L2773:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r24,r13,lo16(_mode_size)
	ld	 r13,r24[r22]
	ld	 r12,r24[r21]
	mak	 r13,r13,0<3>
	mak	 r11,r12,0<3>
	cmp	 r13,r13,r11
	bb1.n	 ge,r13,@L3265
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r11,32
	bb0.n	 gt,r13,@L2813
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L2814
	addu	 r13,r12,6
@L2814:
	or	 r2,r0,r21
	or	 r3,r0,r22
	or	 r4,r0,r19
	bsr.n	 _can_extend_p
	ext	 r17,r13,0<2>
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb1.n	 ne,r13,@L3266
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r24[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L2817
	or.u	 r24,r0,hi16(_word_mode)
	or	 r2,r0,r21
	ld	 r3,r24,lo16(_word_mode)
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0	 ne,r13,@L2817
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r3,r0,r23
	bsr.n	 _convert_move
	or	 r4,r0,r19
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r4,r0,r2
	or	 r2,r0,r25
	br.n	 @L3221
	or	 r3,r0,r20
	align	 4
@L2817:
	bsr	 _start_sequence
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L2819
	or	 r25,r0,r22
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r25,r13,lo16(_word_mode)
	br.n	 @L3267
	or	 r2,r0,r25
	align	 4
@L2819:
	or	 r2,r0,r25
@L3267:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
	or	 r24,r0,r2
	or	 r2,r0,r25
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
	bcnd.n	 eq0,r19,@L2823
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r24,r13,lo16(_const0_rtx)
	br.n	 @L3268
	or.u	 r13,r0,hi16(_mode_size)
	align	 4
@L2823:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r2,r13[r25]
	mak	 r2,r2,0<3>
	bsr.n	 _size_int
	subu	 r2,r2,1
	or	 r5,r0,r2
	or	 r2,r0,78
	or	 r3,r0,r25
	or	 r4,r0,r24
	or	 r6,r0,0
	bsr.n	 _expand_shift
	or	 r7,r0,0
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_word_mode)
	or	 r4,r0,1
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _convert_to_mode
	or	 r3,r0,r24
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_mode_size)
@L3268:
	or	 r13,r13,lo16(_mode_size)
	ld	 r2,r13[r25]
	bcnd	 ge0,r2,@L2825
	addu	 r2,r2,3
@L2825:
	ext	 r22,r2,0<2>
	cmp	 r13,r22,r17
	bb0.n	 lt,r13,@L2827
	subu	 r13,r17,r22
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L2829
	subu	 r25,r17,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L3144
	cmp	 r13,r12,2
	bb0.n	 gt,r13,@L3145
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L3149
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L3149:
	bb1	 eq,r13,@L3147
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L3147:
	addu	 r22,r22,1
@L3145:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L3153
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L3153:
	bb1	 eq,r13,@L3151
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L3151:
	addu	 r22,r22,1
@L3144:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L3157
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L3157:
	bb1	 eq,r13,@L3155
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L3155:
	addu	 r22,r22,1
	cmp	 r13,r22,r17
	bb0	 lt,r13,@L2827
@L2829:
	or	 r2,r0,r20
@L3269:
	subu	 r3,r25,1
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L3161
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L3161:
	bb1	 eq,r13,@L3159
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L3159:
	or	 r2,r0,r20
	subu	 r3,r25,2
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L3165
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L3165:
	bb1	 eq,r13,@L3163
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L3163:
	or	 r2,r0,r20
	subu	 r3,r25,3
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L3169
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L3169:
	bb1	 eq,r13,@L3167
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L3167:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,4
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L3173
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L3173:
	bb1	 eq,r13,@L3171
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L3171:
	addu	 r22,r22,4
	cmp	 r13,r22,r17
	bb1.n	 lt,r13,@L3269
	or	 r2,r0,r20
@L2827:
	bsr	 _get_insns
	bsr.n	 _end_sequence
	or	 r25,r0,r2
	or	 r2,r0,r15
	or	 r3,r0,r21
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r6,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_no_conflict_block
	addu	 r1,r1,@L3333
@L3334:
	align	 4
@L2813:
	or.u	 r13,r0,hi16(_mode_size)
@L3265:
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,32
	bb0.n	 gt,r13,@L2833
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	or	 r2,r0,r20
	br.n	 @L3222
	or	 r4,r0,0
	align	 4
@L2833:
	cmp	 r13,r21,3
	bb1.n	 ne,r13,@L2834
	cmp	 r13,r22,3
	cmp	 r13,r22,4
	bb0.n	 ne,r13,@L2835
	or	 r2,r0,4
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
@L2835:
	bsr	 _abort
	align	 4
@L2834:
	bb1.n	 ne,r13,@L3270
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r21,4
	bb0.n	 ne,r13,@L2837
	or	 r2,r0,4
	or	 r3,r0,r23
	or	 r4,r0,r19
	bsr.n	 _convert_to_mode
	or	 r22,r0,4
	br.n	 @L2836
	or	 r23,r0,r2
	align	 4
@L2837:
	bsr	 _abort
	align	 4
@L2836:
	or.u	 r13,r0,hi16(_mode_size)
@L3270:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb1.n	 ge,r12,@L3271
	or.u	 r13,r0,hi16(_mode_size)
	ld	 r13,r0,r23
	or.u	 r12,r0,0x37
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L2841
	or.u	 r13,r0,hi16(_direct_load)
	or	 r13,r13,lo16(_direct_load)
	ld.b	 r13,r21,r13
	bcnd	 eq0,r13,@L2841
	bsr.n	 _mode_dependent_address_p
	ld	 r2,r23,4
	bcnd.n	 eq0,r2,@L3272
	or	 r2,r0,r21
@L2841:
	ld.hu	 r13,r0,r23
	cmp	 r12,r13,51
	cmp	 r13,r13,53
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L2839
	or	 r2,r0,r21
@L3272:
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	addu	 r1,r1,@L3335
@L3336:
	align	 4
@L2839:
	or.u	 r13,r0,hi16(_mode_size)
@L3271:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb0.n	 gt,r12,@L2842
	or	 r2,r0,r21
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0.n	 ne,r13,@L2843
	or.u	 r13,r0,hi16(_optimize)
@L3266:
	ld	 r13,r13,lo16(_optimize)
	bcnd	 le0,r13,@L2844
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L3273
	or	 r2,r0,r25
	or	 r2,r0,r22
	bsr.n	 _force_reg
	or	 r3,r0,r23
	or	 r23,r0,r2
@L2844:
	or	 r2,r0,r25
@L3273:
	or	 r3,r0,r20
	or	 r4,r0,r23
@L3221:
	or	 r5,r0,r15
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L3337
@L3338:
	align	 4
@L2843:
	or	 r25,r0,r22
	bcnd.n	 eq0,r25,@L2847
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r24,r13,lo16(_mode_wider_mode)
	or	 r2,r0,r21
@L3274:
	or	 r3,r0,r25
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	cmp	 r2,r2,210
	bb1.n	 eq,r2,@L2848
	or	 r2,r0,r25
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	cmp	 r2,r2,210
	bb1.n	 ne,r2,@L3105
	or	 r2,r0,r25
@L2848:
	ld	 r25,r24[r25]
	bcnd.n	 ne0,r25,@L3274
	or	 r2,r0,r21
@L2847:
	bsr	 _abort
	align	 4
@L2842:
	cmp	 r13,r22,6
	extu	 r11,r13,1<eq>
	cmp	 r13,r21,4
	extu	 r13,r13,1<eq>
	and	 r13,r11,r13
	bcnd.n	 eq0,r13,@L2852
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L3339
@L3340:
	align	 4
@L2852:
	cmp	 r13,r21,2
	extu	 r9,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L2853
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L3341
@L3342:
	align	 4
@L2853:
	cmp	 r13,r21,1
	extu	 r10,r13,1<eq>
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L2854
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L3343
@L3344:
	align	 4
@L2854:
	cmp	 r13,r22,4
	extu	 r11,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L2855
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L3345
@L3346:
	align	 4
@L2855:
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L2856
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L3347
@L3348:
	align	 4
@L2856:
	cmp	 r13,r22,2
	extu	 r13,r13,1<eq>
	and	 r13,r13,r10
	bcnd.n	 eq0,r13,@L2857
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L3349
@L3350:
	align	 4
@L2857:
	bb1.n	 ge,r12,@L2858
	or	 r2,r0,r21
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	bsr.n	 _force_reg
	or	 r2,r0,r21
@L3220:
	or	 r3,r0,r2
	or	 r2,r0,r20
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L3351
@L3352:
	align	 4
@L2858:
	bsr	 _abort
	align	 4
@L3105:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
@L3223:
	or	 r3,r0,r2
	or	 r2,r0,r20
	or	 r4,r0,r19
@L3222:
	bsr	 _convert_move
@L2740:
	ld.hu	 r11,r0,r18
	ld.bu	 r22,r18,2
	or	 r21,r0,r18
	or.u	 r13,r0,hi16(_mode_class)
	or	 r13,r13,lo16(_mode_class)
	cmp	 r12,r11,59
	ld	 r20,r13[r22]
	bb0.n	 ne,r12,@L2861
	or	 r24,r0,r16
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L2864
	cmp	 r13,r11,63
	ld	 r2,r18,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L2865
	st	 r2,r18,4
	align	 4
@L2864:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L2865
	ld	 r2,r18,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r18,4
	ld	 r2,r18,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r18,8
@L2865:
	br.n	 @L2860
	or	 r2,r0,r21
	align	 4
@L2861:
	ld	 r13,r18,8
	bcnd	 ne0,r13,@L2867
	ld	 r2,r18,4
	br	 @L2860
	align	 4
@L2867:
	ld	 r2,r18,12
	bcnd	 ne0,r2,@L2860
	ld	 r13,r18,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r18,4
	bsr.n	 _gen_move_insn
	st	 r2,r18,12
	bsr.n	 _emit_insn_before
	ld	 r3,r18,8
	ld	 r2,r18,12
@L2860:
	ld.hu	 r12,r0,r24
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L2870
	or	 r21,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L3275
	cmp	 r13,r12,63
	ld.bu	 r13,r24,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L2871
	ld	 r23,r24,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L2871
	ld	 r13,r23,4
	st	 r13,r24,4
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L2874
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r24,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r24
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	br.n	 @L2869
	or	 r2,r0,r25
	align	 4
@L2871:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L2873
	cmp	 r13,r12,63
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L2874
	st	 r2,r24,4
	align	 4
@L2873:
@L3275:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L2874
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,4
	ld	 r2,r24,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,8
@L2874:
	br.n	 @L2869
	or	 r2,r0,r24
	align	 4
@L2870:
	ld	 r13,r24,8
	bcnd	 ne0,r13,@L2876
	ld	 r2,r24,4
	br.n	 @L3276
	cmp	 r13,r22,16
	align	 4
@L2876:
	ld	 r2,r24,12
	bcnd.n	 ne0,r2,@L3276
	cmp	 r13,r22,16
	ld	 r13,r24,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r24,4
	bsr.n	 _gen_move_insn
	st	 r2,r24,12
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	ld	 r2,r24,12
@L2869:
	cmp	 r13,r22,16
@L3276:
	bb0.n	 ne,r13,@L2879
	or	 r24,r0,r2
	ld.bu	 r13,r24,2
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L2878
	ld.bu	 r13,r24,2
	bcnd	 eq0,r13,@L2878
@L2879:
	bsr	 _abort
	align	 4
@L2878:
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2881
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2881
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L2880
@L2881:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,47
	bb1	 ne,r13,@L2880
	ld.bu	 r13,r24,2
	bcnd.n	 eq0,r13,@L2880
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
@L2880:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,55
	bb1	 ne,r13,@L2882
	ld.bu	 r2,r21,2
	bsr.n	 _memory_address_p
	ld	 r3,r21,4
	bcnd.n	 ne0,r2,@L3277
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bcnd.n	 eq0,r2,@L2883
	or.u	 r13,r0,hi16(_flag_force_addr)
@L3277:
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L2882
	ld	 r13,r21,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2883
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2883
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L2882
@L2883:
	ld	 r4,r21,4
	or	 r2,r0,r21
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r21,r0,r2
@L2882:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L3278
	cmp	 r13,r22,16
	ld.bu	 r2,r24,2
	bsr.n	 _memory_address_p
	ld	 r3,r24,4
	bcnd.n	 eq0,r2,@L2886
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L2885
	ld	 r13,r24,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2886
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2886
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L3278
	cmp	 r13,r22,16
@L2886:
	ld	 r4,r24,4
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L2885:
	cmp	 r13,r22,16
@L3278:
	bb1.n	 ne,r13,@L2887
	subu	 r13,r20,5
	bsr	 _abort
	align	 4
@L2887:
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L2888
	or.u	 r13,r0,hi16(_mode_unit_size)
	or	 r13,r13,lo16(_mode_unit_size)
	ld	 r12,r13[r22]
	or	 r3,r0,2
	cmp	 r13,r20,5
	bb1.n	 ne,r13,@L2889
	mak	 r2,r12,0<3>
	or	 r3,r0,1
@L2889:
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	st	 r2,r31,132
@L2888:
	or.u	 r23,r0,hi16(_mov_optab)
	ld	 r11,r23,lo16(_mov_optab)
	lda.d	 r13,r11[r22]
	ld	 r12,r13,4
	cmp	 r13,r12,210
	bb1.n	 ne,r13,@L3279
	or.u	 r13,r0,hi16(_insn_gen_function)
	subu	 r13,r20,5
	ld	 r14,r31,132
	cmp	 r13,r13,1
	extu	 r13,r13,1<ls>
	cmp	 r12,r14,16
	extu	 r12,r12,1<ne>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L2893
	mak	 r25,r14,0<3>
	addu	 r13,r11,r25
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L2893
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bsr.n	 _get_last_insn
	or	 r22,r0,r2
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L2894
	or	 r19,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r21
	bsr	 _emit_insn
@L2894:
	ld	 r13,r23,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	addu	 r13,r13,r25
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L2895
	or	 r20,r12,lo16(_insn_gen_function)
	ld	 r3,r31,132
	or	 r2,r0,r21
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L3353
@L3354:
	align	 4
@L2895:
	ld	 r2,r31,132
	bsr.n	 _gen_highpart
	or	 r3,r0,r21
@L3225:
	or	 r25,r0,r2
	ld	 r2,r31,132
	bsr.n	 _gen_highpart
	or	 r3,r0,r24
	or	 r3,r0,r2
	ld	 r13,r20[r23]
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r14,r31,132
	ld	 r13,r13,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	lda.d	 r13,r13[r14]
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L2897
	or	 r20,r12,lo16(_insn_gen_function)
	ld	 r3,r31,132
	or	 r2,r0,r21
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L3355
@L3356:
	align	 4
@L2897:
	ld	 r2,r31,132
	bsr.n	 _gen_lowpart
	or	 r3,r0,r21
@L3226:
	or	 r25,r0,r2
	ld	 r2,r31,132
	bsr.n	 _gen_lowpart
	or	 r3,r0,r24
	ld	 r13,r20[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	bcnd	 eq0,r19,@L3083
	ld	 r24,r19,12
	br	 @L3084
	align	 4
@L2893:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r23,r13,lo16(_mode_size)
	ld	 r13,r23[r22]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L2903
	bsr.n	 _get_last_insn
	or	 r25,r0,0
	or	 r20,r0,r2
	or	 r19,r0,r23
@L2904:
	ld	 r12,r19[r22]
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L2908
	addu	 r13,r12,6
@L2908:
	ext	 r13,r13,0<2>
	cmp	 r13,r25,r13
	bb0.n	 lt,r13,@L2905
	or	 r2,r0,r21
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r23,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r3,r0,r2
	bcnd.n	 ne0,r3,@L3280
	cmp	 r13,r23,0
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2910
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L2910
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L2909
	or	 r2,r0,r24
@L2910:
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r3,r0,r25
	or	 r4,r0,1
	or	 r5,r0,r22
	bsr.n	 _operand_subword
	addu	 r1,r1,@L3357
@L3358:
	align	 4
@L2909:
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r22
@L3227:
	or	 r3,r0,r2
	cmp	 r13,r23,0
@L3280:
	cmp	 r12,r3,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L2913
	or	 r2,r0,r23
	bsr	 _abort
	align	 4
@L2913:
	addu	 r25,r25,1
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L3359
@L3360:
	align	 4
@L2905:
	bcnd	 eq0,r20,@L3098
	br	 @L3239
	align	 4
@L2903:
	bsr	 _abort
	align	 4
@L2739:
	ld.bu	 r22,r16,2
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r21,r18,2
	or	 r13,r13,lo16(_mode_class)
	ld	 r12,r13[r21]
	or	 r20,r0,r18
	ld	 r13,r13[r22]
	or	 r23,r0,r16
	cmp	 r12,r12,2
	cmp	 r13,r13,2
	extu	 r17,r12,1<eq>
	or	 r15,r0,99
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r19,@L2920
	st	 r13,r31,132
	or	 r15,r0,100
@L2920:
	ld.hu	 r12,r0,r18
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L2923
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L2926
	cmp	 r13,r12,63
	ld	 r2,r18,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L2927
	st	 r2,r18,4
	align	 4
@L2926:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L2927
	ld	 r2,r18,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r18,4
	ld	 r2,r18,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r18,8
@L2927:
	br.n	 @L2922
	or	 r2,r0,r20
	align	 4
@L2923:
	ld	 r13,r18,8
	bcnd	 ne0,r13,@L2929
	ld	 r2,r18,4
	br	 @L2922
	align	 4
@L2929:
	ld	 r2,r18,12
	bcnd	 ne0,r2,@L2922
	ld	 r13,r18,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r18,4
	bsr.n	 _gen_move_insn
	st	 r2,r18,12
	bsr.n	 _emit_insn_before
	ld	 r3,r18,8
	ld	 r2,r18,12
@L2922:
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L2932
	or	 r20,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L3281
	cmp	 r13,r12,63
	ld.bu	 r13,r23,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L2933
	ld	 r24,r23,4
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L2933
	ld	 r13,r24,4
	st	 r13,r23,4
	ld	 r13,r24,8
	bcnd	 eq0,r13,@L2936
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r23,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r23
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	br.n	 @L2931
	or	 r2,r0,r25
	align	 4
@L2933:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L2935
	cmp	 r13,r12,63
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L2936
	st	 r2,r23,4
	align	 4
@L2935:
@L3281:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L2936
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,4
	ld	 r2,r23,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,8
@L2936:
	br.n	 @L2931
	or	 r2,r0,r23
	align	 4
@L2932:
	ld	 r13,r23,8
	bcnd	 ne0,r13,@L2938
	ld	 r2,r23,4
	br	 @L2931
	align	 4
@L2938:
	ld	 r2,r23,12
	bcnd	 ne0,r2,@L2931
	ld	 r13,r23,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r23,4
	bsr.n	 _gen_move_insn
	st	 r2,r23,12
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	ld	 r2,r23,12
@L2931:
	ld	 r14,r31,132
	cmp	 r13,r17,r14
	bb0.n	 ne,r13,@L2940
	or	 r23,r0,r2
	bsr	 _abort
	align	 4
@L2940:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	ld	 r11,r0,r23
	and	 r13,r11,0x8
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L3282
	ld	 r13,r23,4
	or.u	 r12,r0,hi16(_mode_size)
	ld.bu	 r13,r13,2
	or	 r12,r12,lo16(_mode_size)
	ld	 r13,r12[r13]
	ld	 r12,r12[r21]
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L2941
	extu	 r13,r11,1<5>
	cmp	 r13,r13,r19
	bb1.n	 ne,r13,@L2941
	or	 r2,r0,r21
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	or	 r22,r0,r21
	or	 r23,r0,r2
@L2941:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
@L3282:
	ld	 r13,r0,r20
	and	 r13,r13,0x8
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L2942
	cmp	 r13,r21,r22
	bsr	 _abort
	align	 4
@L2942:
	bb0.n	 ne,r13,@L3283
	or	 r2,r0,r20
	bcnd	 ne0,r22,@L2943
	ld.hu	 r12,r0,r23
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3283
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3283
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L2943
@L3283:
	or	 r3,r0,r23
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L3361
@L3362:
	align	 4
@L2943:
	bcnd.n	 eq0,r17,@L2945
	cmp	 r5,r22,8
	cmp	 r13,r21,9
	extu	 r11,r5,1<eq>
	extu	 r7,r13,1<eq>
	and	 r13,r11,r7
	bcnd.n	 ne0,r13,@L3228
	or	 r2,r0,108
	cmp	 r6,r21,11
	extu	 r12,r6,1<eq>
	and	 r13,r11,r12
	bcnd.n	 ne0,r13,@L3228
	or	 r2,r0,109
	cmp	 r8,r22,9
	extu	 r9,r8,1<eq>
	and	 r13,r9,r12
	bcnd.n	 eq0,r13,@L2948
	cmp	 r4,r21,11
	br.n	 @L3228
	or	 r2,r0,110
	align	 4
@L2948:
	cmp	 r10,r21,8
	extu	 r11,r10,1<eq>
	and	 r13,r9,r11
	bcnd.n	 ne0,r13,@L3228
	or	 r2,r0,111
	cmp	 r9,r22,11
	extu	 r12,r9,1<eq>
	and	 r13,r12,r11
	bcnd.n	 ne0,r13,@L3228
	or	 r2,r0,112
	and	 r13,r12,r7
	bcnd.n	 eq0,r13,@L2951
	cmp	 r12,r21,9
	or	 r2,r0,113
@L3228:
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L3363
@L3364:
	align	 4
@L2951:
	bb0.n	 ne,r8,@L2961
	or	 r2,r0,0
	bb0.n	 ls,r8,@L2983
	cmp	 r13,r22,10
	bb0.n	 ne,r5,@L2953
	cmp	 r13,r21,10
	br	 @L2952
	align	 4
@L2983:
	bb0	 ne,r13,@L2969
	bb0	 ne,r9,@L2975
	br	 @L2952
	align	 4
@L2953:
	bb0	 ne,r13,@L2956
	bb0	 ls,r13,@L2960
	bb0.n	 ne,r12,@L2955
	or.u	 r13,r0,hi16(_extendsfdf2_libfunc)
	br	 @L2952
	align	 4
@L2960:
	bb0.n	 ne,r4,@L2957
	or.u	 r13,r0,hi16(_extendsftf2_libfunc)
	br	 @L2952
	align	 4
@L2955:
	ld	 r2,r13,lo16(_extendsfdf2_libfunc)
	br	 @L2952
	align	 4
@L2956:
	or.u	 r13,r0,hi16(_extendsfxf2_libfunc)
	ld	 r2,r13,lo16(_extendsfxf2_libfunc)
	br	 @L2952
	align	 4
@L2957:
	ld	 r2,r13,lo16(_extendsftf2_libfunc)
	br	 @L2952
	align	 4
@L2961:
	cmp	 r13,r21,10
	bb0	 ne,r13,@L2964
	bb0	 ls,r13,@L2968
	bb0.n	 ne,r10,@L2963
	or.u	 r13,r0,hi16(_truncdfsf2_libfunc)
	br	 @L2952
	align	 4
@L2968:
	bb0.n	 ne,r6,@L2965
	or.u	 r13,r0,hi16(_extenddftf2_libfunc)
	br	 @L2952
	align	 4
@L2963:
	ld	 r2,r13,lo16(_truncdfsf2_libfunc)
	br	 @L2952
	align	 4
@L2964:
	or.u	 r13,r0,hi16(_extenddfxf2_libfunc)
	ld	 r2,r13,lo16(_extenddfxf2_libfunc)
	br	 @L2952
	align	 4
@L2965:
	ld	 r2,r13,lo16(_extenddftf2_libfunc)
	br	 @L2952
	align	 4
@L2969:
	bb0.n	 ne,r10,@L2971
	or.u	 r13,r0,hi16(_truncxfsf2_libfunc)
	bb0.n	 ne,r12,@L2972
	or.u	 r13,r0,hi16(_truncxfdf2_libfunc)
	br	 @L2952
	align	 4
@L2971:
	ld	 r2,r13,lo16(_truncxfsf2_libfunc)
	br	 @L2952
	align	 4
@L2972:
	ld	 r2,r13,lo16(_truncxfdf2_libfunc)
	br	 @L2952
	align	 4
@L2975:
	bb0.n	 ne,r10,@L2977
	or.u	 r13,r0,hi16(_trunctfsf2_libfunc)
	bb0.n	 ne,r12,@L2978
	or.u	 r13,r0,hi16(_trunctfdf2_libfunc)
	br	 @L2952
	align	 4
@L2977:
	ld	 r2,r13,lo16(_trunctfsf2_libfunc)
	br	 @L2952
	align	 4
@L2978:
	ld	 r2,r13,lo16(_trunctfdf2_libfunc)
@L2952:
	bcnd.n	 ne0,r2,@L2984
	or	 r3,r0,1
	bsr	 _abort
	align	 4
@L2984:
	or	 r4,r0,r21
	or	 r5,r0,1
	or	 r6,r0,r23
	bsr.n	 _emit_library_call
	or	 r7,r0,r22
	or	 r2,r0,r21
	bsr.n	 _hard_libcall_value
	addu	 r1,r1,@L3365
@L3366:
	align	 4
@L2945:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r24,r13,lo16(_mode_size)
	ld	 r13,r24[r22]
	ld	 r12,r24[r21]
	mak	 r13,r13,0<3>
	mak	 r11,r12,0<3>
	cmp	 r13,r13,r11
	bb1.n	 ge,r13,@L3284
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r11,32
	bb0.n	 gt,r13,@L2985
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L2986
	addu	 r13,r12,6
@L2986:
	or	 r2,r0,r21
	or	 r3,r0,r22
	or	 r4,r0,r19
	bsr.n	 _can_extend_p
	ext	 r17,r13,0<2>
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb1.n	 ne,r13,@L3285
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r24[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L2989
	or.u	 r24,r0,hi16(_word_mode)
	or	 r2,r0,r21
	ld	 r3,r24,lo16(_word_mode)
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0	 ne,r13,@L2989
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r3,r0,r23
	bsr.n	 _convert_move
	or	 r4,r0,r19
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r4,r0,r2
	or	 r2,r0,r25
	br.n	 @L3230
	or	 r3,r0,r20
	align	 4
@L2989:
	bsr	 _start_sequence
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L2991
	or	 r25,r0,r22
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r25,r13,lo16(_word_mode)
	br.n	 @L3286
	or	 r2,r0,r25
	align	 4
@L2991:
	or	 r2,r0,r25
@L3286:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
	or	 r24,r0,r2
	or	 r2,r0,r25
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
	bcnd.n	 eq0,r19,@L2995
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r24,r13,lo16(_const0_rtx)
	br.n	 @L3287
	or.u	 r13,r0,hi16(_mode_size)
	align	 4
@L2995:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r2,r13[r25]
	mak	 r2,r2,0<3>
	bsr.n	 _size_int
	subu	 r2,r2,1
	or	 r5,r0,r2
	or	 r2,r0,78
	or	 r3,r0,r25
	or	 r4,r0,r24
	or	 r6,r0,0
	bsr.n	 _expand_shift
	or	 r7,r0,0
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_word_mode)
	or	 r4,r0,1
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _convert_to_mode
	or	 r3,r0,r24
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_mode_size)
@L3287:
	or	 r13,r13,lo16(_mode_size)
	ld	 r2,r13[r25]
	bcnd	 ge0,r2,@L2997
	addu	 r2,r2,3
@L2997:
	ext	 r22,r2,0<2>
	cmp	 r13,r22,r17
	bb0.n	 lt,r13,@L2999
	subu	 r13,r17,r22
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L3001
	subu	 r25,r17,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L3110
	cmp	 r13,r12,2
	bb0.n	 gt,r13,@L3111
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L3115
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L3115:
	bb1	 eq,r13,@L3113
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L3113:
	addu	 r22,r22,1
@L3111:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L3119
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L3119:
	bb1	 eq,r13,@L3117
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L3117:
	addu	 r22,r22,1
@L3110:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L3123
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L3123:
	bb1	 eq,r13,@L3121
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L3121:
	addu	 r22,r22,1
	cmp	 r13,r22,r17
	bb0	 lt,r13,@L2999
@L3001:
	or	 r2,r0,r20
	subu	 r3,r25,1
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L3127
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L3127:
	bb1	 eq,r13,@L3125
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L3125:
	or	 r2,r0,r20
	subu	 r3,r25,2
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L3131
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L3131:
	bb1	 eq,r13,@L3129
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L3129:
	or	 r2,r0,r20
	subu	 r3,r25,3
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L3135
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L3135:
	bb1	 eq,r13,@L3133
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L3133:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,4
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L3139
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L3139:
	bb1	 eq,r13,@L3137
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L3137:
	addu	 r22,r22,4
	cmp	 r13,r22,r17
	bb1	 lt,r13,@L3001
@L2999:
	bsr	 _get_insns
	bsr.n	 _end_sequence
	or	 r25,r0,r2
	or	 r2,r0,r15
	or	 r3,r0,r21
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r6,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_no_conflict_block
	addu	 r1,r1,@L3367
@L3368:
	align	 4
@L2985:
	or.u	 r13,r0,hi16(_mode_size)
@L3284:
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,32
	bb0.n	 gt,r13,@L3005
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	or	 r2,r0,r20
	br.n	 @L3231
	or	 r4,r0,0
	align	 4
@L3005:
	cmp	 r13,r21,3
	bb1.n	 ne,r13,@L3006
	cmp	 r13,r22,3
	cmp	 r13,r22,4
	bb0.n	 ne,r13,@L3007
	or	 r2,r0,4
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
@L3007:
	bsr	 _abort
	align	 4
@L3006:
	bb1.n	 ne,r13,@L3288
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r21,4
	bb0.n	 ne,r13,@L3009
	or	 r2,r0,4
	or	 r3,r0,r23
	or	 r4,r0,r19
	bsr.n	 _convert_to_mode
	or	 r22,r0,4
	br.n	 @L3008
	or	 r23,r0,r2
	align	 4
@L3009:
	bsr	 _abort
	align	 4
@L3008:
	or.u	 r13,r0,hi16(_mode_size)
@L3288:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb1.n	 ge,r12,@L3289
	or.u	 r13,r0,hi16(_mode_size)
	ld	 r13,r0,r23
	or.u	 r12,r0,0x37
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L3013
	or.u	 r13,r0,hi16(_direct_load)
	or	 r13,r13,lo16(_direct_load)
	ld.b	 r13,r21,r13
	bcnd	 eq0,r13,@L3013
	bsr.n	 _mode_dependent_address_p
	ld	 r2,r23,4
	bcnd.n	 eq0,r2,@L3290
	or	 r2,r0,r21
@L3013:
	ld.hu	 r13,r0,r23
	cmp	 r12,r13,51
	cmp	 r13,r13,53
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L3011
	or	 r2,r0,r21
@L3290:
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	addu	 r1,r1,@L3369
@L3370:
	align	 4
@L3011:
	or.u	 r13,r0,hi16(_mode_size)
@L3289:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb0.n	 gt,r12,@L3014
	or	 r2,r0,r21
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0.n	 ne,r13,@L3015
	or.u	 r13,r0,hi16(_optimize)
@L3285:
	ld	 r13,r13,lo16(_optimize)
	bcnd	 le0,r13,@L3016
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,53
	bb1	 ne,r13,@L3016
	or	 r2,r0,r22
	bsr.n	 _force_reg
	or	 r3,r0,r23
	or	 r23,r0,r2
@L3016:
	or	 r2,r0,r25
	or	 r3,r0,r20
	or	 r4,r0,r23
@L3230:
	or	 r5,r0,r15
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L3371
@L3372:
	align	 4
@L3015:
	or	 r25,r0,r22
	bcnd.n	 eq0,r25,@L3019
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r24,r13,lo16(_mode_wider_mode)
	or	 r2,r0,r21
@L3291:
	or	 r3,r0,r25
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	cmp	 r2,r2,210
	bb1.n	 eq,r2,@L3020
	or	 r2,r0,r25
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	cmp	 r2,r2,210
	bb1.n	 ne,r2,@L3106
	or	 r2,r0,r25
@L3020:
	ld	 r25,r24[r25]
	bcnd.n	 ne0,r25,@L3291
	or	 r2,r0,r21
@L3019:
	bsr	 _abort
	align	 4
@L3014:
	cmp	 r13,r22,6
	extu	 r11,r13,1<eq>
	cmp	 r13,r21,4
	extu	 r13,r13,1<eq>
	and	 r13,r11,r13
	bcnd.n	 eq0,r13,@L3024
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L3373
@L3374:
	align	 4
@L3024:
	cmp	 r13,r21,2
	extu	 r9,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L3025
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L3375
@L3376:
	align	 4
@L3025:
	cmp	 r13,r21,1
	extu	 r10,r13,1<eq>
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L3026
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L3377
@L3378:
	align	 4
@L3026:
	cmp	 r13,r22,4
	extu	 r11,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L3027
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L3379
@L3380:
	align	 4
@L3027:
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L3028
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L3381
@L3382:
	align	 4
@L3028:
	cmp	 r13,r22,2
	extu	 r13,r13,1<eq>
	and	 r13,r13,r10
	bcnd.n	 eq0,r13,@L3029
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L3383
@L3384:
	align	 4
@L3029:
	bb1.n	 ge,r12,@L3030
	or	 r2,r0,r21
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	bsr.n	 _force_reg
	or	 r2,r0,r21
@L3229:
	or	 r3,r0,r2
	or	 r2,r0,r20
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L3385
@L3386:
	align	 4
@L3030:
	bsr	 _abort
	align	 4
@L2738:
	ld.bu	 r13,r16,2
	cmp	 r13,r13,16
	bb1.n	 ne,r13,@L3040
	or	 r21,r0,r18
	ld.bu	 r13,r20,8
	cmp	 r13,r13,28
	bb1	 ne,r13,@L3032
	bsr.n	 _expr_size
	or	 r2,r0,r20
	or	 r21,r0,r2
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,46
	bb1	 ne,r13,@L3033
	ld	 r13,r21,4
	ld	 r12,r20,16
	cmp	 r13,r13,r12
	bb1	 ge,r13,@L3033
	ld	 r13,r20,4
	or	 r2,r0,r18
	ld	 r5,r13,28
	or	 r3,r0,r16
	br.n	 @L3233
	or	 r4,r0,r21
	align	 4
@L3033:
	ld	 r13,r20,4
	or.u	 r24,r0,hi16(_sizetype)
	ld	 r22,r24,lo16(_sizetype)
	or	 r2,r0,8
	bsr.n	 _size_int
	ld	 r25,r13,16
	or	 r4,r0,r2
	or	 r2,r0,57
	bsr.n	 _size_binop
	or	 r3,r0,r25
	or	 r23,r0,r2
	ld	 r2,r20,16
	or	 r3,r0,0
	bsr.n	 _build_int_2_wide
	ld	 r25,r24,lo16(_sizetype)
	or	 r3,r0,r2
	bsr.n	 _convert
	or	 r2,r0,r25
	or	 r5,r0,r2
	or	 r2,r0,73
	or	 r3,r0,r22
	bsr.n	 _build
	or	 r4,r0,r23
	bsr.n	 _fold
	or	 r24,r0,0
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld	 r13,r20,4
	or	 r25,r0,r2
	or	 r2,r0,r18
	ld	 r5,r13,28
	or	 r3,r0,r16
	or	 r4,r0,r25
	bsr.n	 _emit_block_move
	extu	 r5,r5,0<3>
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb1	 ne,r13,@L3035
	ld	 r2,r18,4
	bsr.n	 _plus_constant_wide
	ld	 r3,r20,16
	ld	 r3,r20,16
	or	 r16,r0,r2
	or	 r2,r0,r21
	bsr.n	 _plus_constant_wide
	subu	 r3,r0,r3
	br.n	 @L3036
	or	 r21,r0,r2
	align	 4
@L3035:
	ld	 r3,r18,4
	bsr.n	 _force_reg
	or	 r2,r0,4
	or	 r16,r0,r2
	or	 r2,r0,4
	or	 r5,r0,r25
	or	 r6,r0,0
	or	 r7,r0,0
	or.u	 r13,r0,hi16(_add_optab)
	or	 r8,r0,3
	ld	 r3,r13,lo16(_add_optab)
	bsr.n	 _expand_binop
	or	 r4,r0,r16
	or	 r16,r0,r2
	or	 r2,r0,4
	or	 r4,r0,r21
	or	 r5,r0,r25
	or	 r6,r0,0
	or.u	 r13,r0,hi16(_sub_optab)
	or	 r7,r0,0
	ld	 r3,r13,lo16(_sub_optab)
	bsr.n	 _expand_binop
	or	 r8,r0,3
	or	 r21,r0,r2
	or	 r4,r0,94
	or	 r5,r0,0
	or.u	 r13,r0,hi16(_const0_rtx)
	or	 r7,r0,0
	ld	 r3,r13,lo16(_const0_rtx)
	or	 r8,r0,0
	bsr.n	 _emit_cmp_insn
	ld.bu	 r6,r21,2
	bsr	 _gen_label_rtx
	bsr.n	 _gen_blt
	or	 r24,r0,r2
	bsr	 _emit_jump_insn
@L3036:
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r8,r13,lo16(_const0_rtx)
	cmp	 r13,r21,r8
	bb0	 ne,r13,@L3037
	st	 r21,r31,32
	or	 r3,r0,0
	or	 r4,r0,0
	or	 r5,r0,3
	or.u	 r13,r0,hi16(_memset_libfunc)
	or	 r6,r0,r16
	or	 r7,r0,4
	ld	 r2,r13,lo16(_memset_libfunc)
	or	 r9,r0,4
	or	 r13,r0,4
	bsr.n	 _emit_library_call
	st	 r13,r31,36
@L3037:
	bcnd	 eq0,r24,@L2728
	or	 r2,r0,r24
	bsr.n	 _emit_label
	addu	 r1,r1,@L3387
@L3388:
	align	 4
@L3032:
	bsr.n	 _expr_size
	or	 r2,r0,r20
	ld	 r13,r20,4
	or	 r4,r0,r2
	ld	 r5,r13,28
	or	 r2,r0,r18
	or	 r3,r0,r16
@L3233:
	extu	 r5,r5,0<3>
	bsr.n	 _emit_block_move
	addu	 r1,r1,@L3389
@L3390:
	align	 4
@L3040:
	ld.hu	 r11,r0,r18
	ld.bu	 r22,r18,2
	or.u	 r13,r0,hi16(_mode_class)
	or	 r13,r13,lo16(_mode_class)
	cmp	 r12,r11,59
	ld	 r20,r13[r22]
	bb0.n	 ne,r12,@L3044
	or	 r24,r0,r16
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L3047
	cmp	 r13,r11,63
	ld	 r2,r18,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L3048
	st	 r2,r18,4
	align	 4
@L3047:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L3048
	ld	 r2,r18,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r18,4
	ld	 r2,r18,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r18,8
@L3048:
	br.n	 @L3043
	or	 r2,r0,r21
	align	 4
@L3044:
	ld	 r13,r18,8
	bcnd	 ne0,r13,@L3050
	ld	 r2,r18,4
	br	 @L3043
	align	 4
@L3050:
	ld	 r2,r18,12
	bcnd	 ne0,r2,@L3043
	ld	 r13,r18,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r18,4
	bsr.n	 _gen_move_insn
	st	 r2,r18,12
	bsr.n	 _emit_insn_before
	ld	 r3,r18,8
	ld	 r2,r18,12
@L3043:
	ld.hu	 r12,r0,r24
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L3053
	or	 r21,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L3292
	cmp	 r13,r12,63
	ld.bu	 r13,r24,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L3054
	ld	 r23,r24,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L3054
	ld	 r13,r23,4
	st	 r13,r24,4
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L3057
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r24,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r24
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	br.n	 @L3052
	or	 r2,r0,r25
	align	 4
@L3054:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L3056
	cmp	 r13,r12,63
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L3057
	st	 r2,r24,4
	align	 4
@L3056:
@L3292:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L3057
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,4
	ld	 r2,r24,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,8
@L3057:
	br.n	 @L3052
	or	 r2,r0,r24
	align	 4
@L3053:
	ld	 r13,r24,8
	bcnd	 ne0,r13,@L3059
	ld	 r2,r24,4
	br.n	 @L3293
	cmp	 r13,r22,16
	align	 4
@L3059:
	ld	 r2,r24,12
	bcnd.n	 ne0,r2,@L3293
	cmp	 r13,r22,16
	ld	 r13,r24,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r24,4
	bsr.n	 _gen_move_insn
	st	 r2,r24,12
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	ld	 r2,r24,12
@L3052:
	cmp	 r13,r22,16
@L3293:
	bb0.n	 ne,r13,@L3062
	or	 r24,r0,r2
	ld.bu	 r13,r24,2
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L3061
	ld.bu	 r13,r24,2
	bcnd	 eq0,r13,@L3061
@L3062:
	bsr	 _abort
	align	 4
@L3061:
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3064
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3064
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L3063
@L3064:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,47
	bb1	 ne,r13,@L3063
	ld.bu	 r13,r24,2
	bcnd.n	 eq0,r13,@L3063
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
@L3063:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,55
	bb1	 ne,r13,@L3065
	ld.bu	 r2,r21,2
	bsr.n	 _memory_address_p
	ld	 r3,r21,4
	bcnd.n	 ne0,r2,@L3294
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bcnd.n	 eq0,r2,@L3066
	or.u	 r13,r0,hi16(_flag_force_addr)
@L3294:
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L3065
	ld	 r13,r21,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3066
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3066
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L3065
@L3066:
	ld	 r4,r21,4
	or	 r2,r0,r21
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r21,r0,r2
@L3065:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L3295
	cmp	 r13,r22,16
	ld.bu	 r2,r24,2
	bsr.n	 _memory_address_p
	ld	 r3,r24,4
	bcnd.n	 eq0,r2,@L3069
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L3068
	ld	 r13,r24,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3069
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3069
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L3295
	cmp	 r13,r22,16
@L3069:
	ld	 r4,r24,4
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L3068:
	cmp	 r13,r22,16
@L3295:
	bb1.n	 ne,r13,@L3070
	subu	 r13,r20,5
	bsr	 _abort
	align	 4
@L3070:
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L3071
	or.u	 r13,r0,hi16(_mode_unit_size)
	or	 r13,r13,lo16(_mode_unit_size)
	ld	 r12,r13[r22]
	or	 r3,r0,2
	cmp	 r13,r20,5
	bb1.n	 ne,r13,@L3072
	mak	 r2,r12,0<3>
	or	 r3,r0,1
@L3072:
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	or	 r19,r0,r2
@L3071:
	or.u	 r23,r0,hi16(_mov_optab)
	ld	 r11,r23,lo16(_mov_optab)
	lda.d	 r13,r11[r22]
	ld	 r12,r13,4
	cmp	 r13,r12,210
	bb0.n	 ne,r13,@L3074
	or.u	 r13,r0,hi16(_insn_gen_function)
@L3279:
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r2,r0,r21
	ld	 r13,r13[r12]
	jsr.n	 r13
	or	 r3,r0,r24
	bsr.n	 _emit_insn
	addu	 r1,r1,@L3391
@L3392:
	align	 4
@L3074:
	cmp	 r12,r19,16
	subu	 r13,r20,5
	extu	 r12,r12,1<ne>
	cmp	 r13,r13,1
	extu	 r13,r13,1<ls>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L3076
	mak	 r25,r19,0<3>
	addu	 r13,r11,r25
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L3076
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bsr.n	 _get_last_insn
	or	 r22,r0,r2
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L3077
	or	 r17,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r21
	bsr	 _emit_insn
@L3077:
	ld	 r13,r23,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	addu	 r13,r13,r25
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L3078
	or	 r20,r12,lo16(_insn_gen_function)
	or	 r2,r0,r21
	or	 r3,r0,r19
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L3393
@L3394:
	align	 4
@L3078:
	or	 r2,r0,r19
	bsr.n	 _gen_highpart
	or	 r3,r0,r21
@L3234:
	or	 r25,r0,r2
	or	 r2,r0,r19
	bsr.n	 _gen_highpart
	or	 r3,r0,r24
	ld	 r13,r20[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r13,r13,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	lda.d	 r13,r13[r19]
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L3080
	or	 r20,r12,lo16(_insn_gen_function)
	or	 r2,r0,r21
	or	 r3,r0,r19
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L3395
@L3396:
	align	 4
@L3080:
	or	 r2,r0,r19
	bsr.n	 _gen_lowpart
	or	 r3,r0,r21
@L3235:
	or	 r25,r0,r2
	or	 r2,r0,r19
	bsr.n	 _gen_lowpart
	or	 r3,r0,r24
	ld	 r13,r20[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	bcnd	 eq0,r17,@L3083
	ld	 r24,r17,12
	br	 @L3084
	align	 4
@L3083:
	bsr	 _get_insns
	or	 r24,r0,r2
@L3084:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	st	 r2,r24,28
	bsr.n	 _get_last_insn
	addu	 r1,r1,@L3397
@L3398:
	align	 4
@L3076:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r23,r13,lo16(_mode_size)
	ld	 r13,r23[r22]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L3086
	bsr.n	 _get_last_insn
	or	 r25,r0,0
	or	 r20,r0,r2
	or	 r19,r0,r23
@L3087:
	ld	 r12,r19[r22]
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L3091
	addu	 r13,r12,6
@L3091:
	ext	 r13,r13,0<2>
	cmp	 r13,r25,r13
	bb0.n	 lt,r13,@L3088
	or	 r2,r0,r21
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r23,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r3,r0,r2
	bcnd.n	 ne0,r3,@L3296
	cmp	 r13,r23,0
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3093
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3093
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L3092
	or	 r2,r0,r24
@L3093:
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r3,r0,r25
	or	 r4,r0,1
	or	 r5,r0,r22
	bsr.n	 _operand_subword
	addu	 r1,r1,@L3399
@L3400:
	align	 4
@L3092:
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r22
@L3236:
	or	 r3,r0,r2
	cmp	 r13,r23,0
@L3296:
	cmp	 r12,r3,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L3096
	or	 r2,r0,r23
	bsr	 _abort
	align	 4
@L3096:
	addu	 r25,r25,1
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L3401
@L3402:
	align	 4
@L3088:
	bcnd	 eq0,r20,@L3098
@L3239:
	ld	 r24,r20,12
	br	 @L3099
	align	 4
@L3098:
	bsr	 _get_insns
	or	 r24,r0,r2
@L3099:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	br.n	 @L2728
	st	 r2,r24,28
	align	 4
@L3086:
	bsr	 _abort
	align	 4
@L3106:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
@L3232:
	or	 r3,r0,r2
	or	 r2,r0,r20
	or	 r4,r0,r19
@L3231:
	bsr	 _convert_move
@L2728:
	ld	 r14,r31,108
	bcnd.n	 ne0,r14,@L3102
	or	 r2,r0,r16
	or	 r2,r0,r18
@L3102:
@Lte23:
	ld	 r1,r31,96
	ld.d	 r24,r31,88
	ld.d	 r22,r31,80
	ld.d	 r20,r31,72
	ld.d	 r18,r31,64
	ld.d	 r16,r31,56
	ld.d	 r14,r31,48
	jmp.n	 r1
	addu	 r31,r31,144
	def	 @L3401,@L3402-@L3087
	def	 @L3399,@L3236-@L3400
	def	 @L3397,@L2728-@L3398
	def	 @L3395,@L3235-@L3396
	def	 @L3393,@L3234-@L3394
	def	 @L3391,@L2728-@L3392
	def	 @L3389,@L2728-@L3390
	def	 @L3387,@L2728-@L3388
	def	 @L3385,@L2728-@L3386
	def	 @L3383,@L3232-@L3384
	def	 @L3381,@L3232-@L3382
	def	 @L3379,@L3232-@L3380
	def	 @L3377,@L3232-@L3378
	def	 @L3375,@L3232-@L3376
	def	 @L3373,@L3232-@L3374
	def	 @L3371,@L2728-@L3372
	def	 @L3369,@L3229-@L3370
	def	 @L3367,@L2728-@L3368
	def	 @L3365,@L3229-@L3366
	def	 @L3363,@L2728-@L3364
	def	 @L3361,@L2728-@L3362
	def	 @L3359,@L3360-@L2904
	def	 @L3357,@L3227-@L3358
	def	 @L3355,@L3226-@L3356
	def	 @L3353,@L3225-@L3354
	def	 @L3351,@L2740-@L3352
	def	 @L3349,@L3223-@L3350
	def	 @L3347,@L3223-@L3348
	def	 @L3345,@L3223-@L3346
	def	 @L3343,@L3223-@L3344
	def	 @L3341,@L3223-@L3342
	def	 @L3339,@L3223-@L3340
	def	 @L3337,@L2740-@L3338
	def	 @L3335,@L3220-@L3336
	def	 @L3333,@L2740-@L3334
	def	 @L3331,@L3220-@L3332
	def	 @L3329,@L2740-@L3330
	def	 @L3327,@L2740-@L3328
	def	 @L3325,@L2612-@L3326
	def	 @L3323,@L3218-@L3324
	def	 @L3321,@L3218-@L3322
	def	 @L3319,@L3218-@L3320
	def	 @L3317,@L3218-@L3318
	def	 @L3315,@L3218-@L3316
	def	 @L3313,@L3218-@L3314
	def	 @L3311,@L2612-@L3312
	def	 @L3309,@L3215-@L3310
	def	 @L3307,@L2612-@L3308
	def	 @L3305,@L3215-@L3306
	def	 @L3303,@L2612-@L3304
	def	 @L3301,@L2612-@L3302
	def	 @L3299,@L2596-@L3300
	def	 @L3297,@L3102-@L3298

	align	 8
_store_field:
	subu	 r31,r31,144
	st	 r1,r31,96
	st.d	 r24,r31,88
	st.d	 r18,r31,64
	or	 r19,r0,r2
	st.d	 r14,r31,48
	or	 r15,r0,r3
	st.d	 r22,r31,80
	or	 r14,r0,r5
	st.d	 r20,r31,72
	or	 r22,r0,r7
	st.d	 r16,r31,56
@Ltb24:
	or	 r24,r0,r8
	st	 r4,r31,108
	or	 r25,r0,0
	st	 r6,r31,116
	cmp	 r13,r15,31
	bb1.n	 gt,r13,@L3629
	st	 r9,r31,124
	or	 r13,r0,1
	mak	 r13,r13,r15
	subu	 r25,r13,1
@L3629:
	cmp	 r13,r14,16
	bb1	 ne,r13,@L3630
	ld.hu	 r13,r0,r19
	cmp	 r12,r13,51
	cmp	 r13,r13,53
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L3630
	ld.bu	 r2,r19,2
	or.u	 r25,r0,hi16(_mode_size)
	ld.bu	 r13,r19,2
	or	 r25,r25,lo16(_mode_size)
	ld	 r3,r25[r13]
	bsr.n	 _assign_stack_temp
	or	 r4,r0,0
	bsr.n	 _copy_rtx
	or	 r20,r0,r2
	st	 r2,r31,132
	or	 r13,r0,16
	st.b	 r13,r2,2
	ld.bu	 r13,r19,2
	ld	 r13,r25[r13]
	mak	 r13,r13,0<3>
	cmp	 r13,r15,r13
	bb0	 ne,r13,@L3631
	ld.hu	 r11,r0,r20
	ld.bu	 r22,r20,2
	or	 r21,r0,r20
	or.u	 r13,r0,hi16(_mode_class)
	or	 r13,r13,lo16(_mode_class)
	cmp	 r12,r11,59
	ld	 r17,r13[r22]
	bb0.n	 ne,r12,@L3634
	or	 r24,r0,r19
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L3637
	cmp	 r13,r11,63
	ld	 r2,r20,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L3638
	st	 r2,r20,4
	align	 4
@L3637:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L3638
	ld	 r2,r20,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r20,4
	ld	 r2,r20,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r20,8
@L3638:
	br.n	 @L3633
	or	 r2,r0,r21
	align	 4
@L3634:
	ld	 r13,r20,8
	bcnd	 ne0,r13,@L3640
	ld	 r2,r20,4
	br	 @L3633
	align	 4
@L3640:
	ld	 r2,r20,12
	bcnd	 ne0,r2,@L3633
	ld	 r13,r20,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r20,4
	bsr.n	 _gen_move_insn
	st	 r2,r20,12
	bsr.n	 _emit_insn_before
	ld	 r3,r20,8
	ld	 r2,r20,12
@L3633:
	ld.hu	 r12,r0,r24
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L3643
	or	 r21,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L3768
	cmp	 r13,r12,63
	ld.bu	 r13,r24,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L3644
	ld	 r23,r24,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L3644
	ld	 r13,r23,4
	st	 r13,r24,4
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L3647
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r24,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r24
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	br.n	 @L3642
	or	 r2,r0,r25
	align	 4
@L3644:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L3646
	cmp	 r13,r12,63
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L3647
	st	 r2,r24,4
	align	 4
@L3646:
@L3768:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L3647
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,4
	ld	 r2,r24,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,8
@L3647:
	br.n	 @L3642
	or	 r2,r0,r24
	align	 4
@L3643:
	ld	 r13,r24,8
	bcnd	 ne0,r13,@L3649
	ld	 r2,r24,4
	br.n	 @L3769
	cmp	 r13,r22,16
	align	 4
@L3649:
	ld	 r2,r24,12
	bcnd.n	 ne0,r2,@L3769
	cmp	 r13,r22,16
	ld	 r13,r24,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r24,4
	bsr.n	 _gen_move_insn
	st	 r2,r24,12
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	ld	 r2,r24,12
@L3642:
	cmp	 r13,r22,16
@L3769:
	bb0.n	 ne,r13,@L3652
	or	 r24,r0,r2
	ld.bu	 r13,r24,2
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L3651
	ld.bu	 r13,r24,2
	bcnd	 eq0,r13,@L3651
@L3652:
	bsr	 _abort
	align	 4
@L3651:
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3654
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3654
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L3653
@L3654:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,47
	bb1	 ne,r13,@L3653
	ld.bu	 r13,r24,2
	bcnd.n	 eq0,r13,@L3653
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
@L3653:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,55
	bb1	 ne,r13,@L3655
	ld.bu	 r2,r21,2
	bsr.n	 _memory_address_p
	ld	 r3,r21,4
	bcnd.n	 ne0,r2,@L3770
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bcnd.n	 eq0,r2,@L3656
	or.u	 r13,r0,hi16(_flag_force_addr)
@L3770:
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L3655
	ld	 r13,r21,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3656
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3656
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L3655
@L3656:
	ld	 r4,r21,4
	or	 r2,r0,r21
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r21,r0,r2
@L3655:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L3771
	cmp	 r13,r22,16
	ld.bu	 r2,r24,2
	bsr.n	 _memory_address_p
	ld	 r3,r24,4
	bcnd.n	 eq0,r2,@L3659
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L3658
	ld	 r13,r24,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3659
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3659
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L3771
	cmp	 r13,r22,16
@L3659:
	ld	 r4,r24,4
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L3658:
	cmp	 r13,r22,16
@L3771:
	bb1.n	 ne,r13,@L3660
	subu	 r13,r17,5
	bsr	 _abort
	align	 4
@L3660:
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L3661
	or.u	 r13,r0,hi16(_mode_unit_size)
	or	 r13,r13,lo16(_mode_unit_size)
	ld	 r12,r13[r22]
	or	 r3,r0,2
	cmp	 r13,r17,5
	bb1.n	 ne,r13,@L3662
	mak	 r2,r12,0<3>
	or	 r3,r0,1
@L3662:
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	or	 r18,r0,r2
@L3661:
	or.u	 r23,r0,hi16(_mov_optab)
	ld	 r11,r23,lo16(_mov_optab)
	lda.d	 r13,r11[r22]
	ld	 r12,r13,4
	cmp	 r13,r12,210
	bb0.n	 ne,r13,@L3664
	or.u	 r13,r0,hi16(_insn_gen_function)
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r2,r0,r21
	ld	 r13,r13[r12]
	jsr.n	 r13
	or	 r3,r0,r24
	bsr.n	 _emit_insn
	addu	 r1,r1,@L3779
@L3780:
	align	 4
@L3664:
	cmp	 r12,r18,16
	subu	 r13,r17,5
	extu	 r12,r12,1<ne>
	cmp	 r13,r13,1
	extu	 r13,r13,1<ls>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L3666
	mak	 r25,r18,0<3>
	addu	 r13,r11,r25
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L3666
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bsr.n	 _get_last_insn
	or	 r22,r0,r2
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L3667
	or	 r16,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r21
	bsr	 _emit_insn
@L3667:
	ld	 r13,r23,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	addu	 r13,r13,r25
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L3668
	or	 r17,r12,lo16(_insn_gen_function)
	or	 r2,r0,r21
	or	 r3,r0,r18
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L3781
@L3782:
	align	 4
@L3668:
	or	 r2,r0,r18
	bsr.n	 _gen_highpart
	or	 r3,r0,r21
@L3762:
	or	 r25,r0,r2
	or	 r2,r0,r18
	bsr.n	 _gen_highpart
	or	 r3,r0,r24
	ld	 r13,r17[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r13,r13,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	lda.d	 r13,r13[r18]
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L3670
	or	 r17,r12,lo16(_insn_gen_function)
	or	 r2,r0,r21
	or	 r3,r0,r18
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L3783
@L3784:
	align	 4
@L3670:
	or	 r2,r0,r18
	bsr.n	 _gen_lowpart
	or	 r3,r0,r21
@L3763:
	or	 r25,r0,r2
	or	 r2,r0,r18
	bsr.n	 _gen_lowpart
	or	 r3,r0,r24
	ld	 r13,r17[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	bcnd	 eq0,r16,@L3673
	ld	 r24,r16,12
	br	 @L3674
	align	 4
@L3673:
	bsr	 _get_insns
	or	 r24,r0,r2
@L3674:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	st	 r2,r24,28
	bsr.n	 _get_last_insn
	addu	 r1,r1,@L3785
@L3786:
	align	 4
@L3666:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r23,r13,lo16(_mode_size)
	ld	 r13,r23[r22]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L3676
	bsr.n	 _get_last_insn
	or	 r25,r0,0
	or	 r18,r0,r2
	or	 r17,r0,r23
@L3677:
	ld	 r12,r17[r22]
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L3681
	addu	 r13,r12,6
@L3681:
	ext	 r13,r13,0<2>
	cmp	 r13,r25,r13
	bb0.n	 lt,r13,@L3678
	or	 r2,r0,r21
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r23,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r3,r0,r2
	bcnd.n	 ne0,r3,@L3772
	cmp	 r13,r23,0
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3683
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3683
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L3682
	or	 r2,r0,r24
@L3683:
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r3,r0,r25
	or	 r4,r0,1
	or	 r5,r0,r22
	bsr.n	 _operand_subword
	addu	 r1,r1,@L3787
@L3788:
	align	 4
@L3682:
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r22
@L3764:
	or	 r3,r0,r2
	cmp	 r13,r23,0
@L3772:
	cmp	 r12,r3,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L3686
	or	 r2,r0,r23
	bsr	 _abort
	align	 4
@L3686:
	addu	 r25,r25,1
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L3789
@L3790:
	align	 4
@L3678:
	bcnd	 eq0,r18,@L3688
	ld	 r24,r18,12
	br	 @L3689
	align	 4
@L3688:
	bsr	 _get_insns
	or	 r24,r0,r2
@L3689:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	br.n	 @L3631
	st	 r2,r24,28
	align	 4
@L3676:
	bsr	 _abort
	align	 4
@L3631:
	ld	 r10,r31,176
	or	 r3,r0,r15
	ld	 r2,r31,132
	or	 r5,r0,r14
	ld	 r4,r31,108
	or	 r7,r0,0
	ld	 r6,r31,116
	or	 r8,r0,0
	ld	 r9,r31,124
	or	 r21,r0,r19
	or	 r24,r0,r20
	bsr.n	 _store_field
	st	 r10,r31,32
	ld.hu	 r11,r0,r19
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r22,r19,2
	or	 r13,r13,lo16(_mode_class)
	cmp	 r12,r11,59
	ld	 r20,r13[r22]
	bb0.n	 ne,r12,@L3693
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L3696
	cmp	 r13,r11,63
	ld	 r2,r19,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L3697
	st	 r2,r19,4
	align	 4
@L3696:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L3697
	ld	 r2,r19,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r19,4
	ld	 r2,r19,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r19,8
@L3697:
	br.n	 @L3692
	or	 r2,r0,r21
	align	 4
@L3693:
	ld	 r13,r19,8
	bcnd	 ne0,r13,@L3699
	ld	 r2,r19,4
	br	 @L3692
	align	 4
@L3699:
	ld	 r2,r19,12
	bcnd	 ne0,r2,@L3692
	ld	 r13,r19,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r19,4
	bsr.n	 _gen_move_insn
	st	 r2,r19,12
	bsr.n	 _emit_insn_before
	ld	 r3,r19,8
	ld	 r2,r19,12
@L3692:
	ld.hu	 r12,r0,r24
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L3702
	or	 r21,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L3773
	cmp	 r13,r12,63
	ld.bu	 r13,r24,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L3703
	ld	 r23,r24,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L3703
	ld	 r13,r23,4
	st	 r13,r24,4
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L3706
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r24,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r24
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	br.n	 @L3701
	or	 r2,r0,r25
	align	 4
@L3703:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L3705
	cmp	 r13,r12,63
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L3706
	st	 r2,r24,4
	align	 4
@L3705:
@L3773:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L3706
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,4
	ld	 r2,r24,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,8
@L3706:
	br.n	 @L3701
	or	 r2,r0,r24
	align	 4
@L3702:
	ld	 r13,r24,8
	bcnd	 ne0,r13,@L3708
	ld	 r2,r24,4
	br.n	 @L3774
	cmp	 r13,r22,16
	align	 4
@L3708:
	ld	 r2,r24,12
	bcnd.n	 ne0,r2,@L3774
	cmp	 r13,r22,16
	ld	 r13,r24,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r24,4
	bsr.n	 _gen_move_insn
	st	 r2,r24,12
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	ld	 r2,r24,12
@L3701:
	cmp	 r13,r22,16
@L3774:
	bb0.n	 ne,r13,@L3711
	or	 r24,r0,r2
	ld.bu	 r13,r24,2
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L3710
	ld.bu	 r13,r24,2
	bcnd	 eq0,r13,@L3710
@L3711:
	bsr	 _abort
	align	 4
@L3710:
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3713
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3713
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L3712
@L3713:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,47
	bb1	 ne,r13,@L3712
	ld.bu	 r13,r24,2
	bcnd.n	 eq0,r13,@L3712
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
@L3712:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,55
	bb1	 ne,r13,@L3714
	ld.bu	 r2,r21,2
	bsr.n	 _memory_address_p
	ld	 r3,r21,4
	bcnd.n	 ne0,r2,@L3775
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bcnd.n	 eq0,r2,@L3715
	or.u	 r13,r0,hi16(_flag_force_addr)
@L3775:
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L3714
	ld	 r13,r21,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3715
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3715
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L3714
@L3715:
	ld	 r4,r21,4
	or	 r2,r0,r21
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r21,r0,r2
@L3714:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L3776
	cmp	 r13,r22,16
	ld.bu	 r2,r24,2
	bsr.n	 _memory_address_p
	ld	 r3,r24,4
	bcnd.n	 eq0,r2,@L3718
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L3717
	ld	 r13,r24,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3718
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3718
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L3776
	cmp	 r13,r22,16
@L3718:
	ld	 r4,r24,4
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L3717:
	cmp	 r13,r22,16
@L3776:
	bb1.n	 ne,r13,@L3719
	subu	 r13,r20,5
	bsr	 _abort
	align	 4
@L3719:
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L3720
	or.u	 r13,r0,hi16(_mode_unit_size)
	or	 r13,r13,lo16(_mode_unit_size)
	ld	 r12,r13[r22]
	or	 r3,r0,2
	cmp	 r13,r20,5
	bb1.n	 ne,r13,@L3721
	mak	 r2,r12,0<3>
	or	 r3,r0,1
@L3721:
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	st	 r2,r31,140
@L3720:
	or.u	 r23,r0,hi16(_mov_optab)
	ld	 r11,r23,lo16(_mov_optab)
	lda.d	 r13,r11[r22]
	ld	 r12,r13,4
	cmp	 r13,r12,210
	bb0.n	 ne,r13,@L3723
	or.u	 r13,r0,hi16(_insn_gen_function)
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r2,r0,r21
	ld	 r13,r13[r12]
	jsr.n	 r13
	or	 r3,r0,r24
	bsr.n	 _emit_insn
	addu	 r1,r1,@L3791
@L3792:
	align	 4
@L3723:
	subu	 r13,r20,5
	ld	 r10,r31,140
	cmp	 r13,r13,1
	extu	 r13,r13,1<ls>
	cmp	 r12,r10,16
	extu	 r12,r12,1<ne>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L3725
	mak	 r25,r10,0<3>
	addu	 r13,r11,r25
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L3725
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bsr.n	 _get_last_insn
	or	 r22,r0,r2
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L3726
	or	 r18,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r21
	bsr	 _emit_insn
@L3726:
	ld	 r13,r23,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	addu	 r13,r13,r25
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L3727
	or	 r20,r12,lo16(_insn_gen_function)
	ld	 r3,r31,140
	or	 r2,r0,r21
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L3793
@L3794:
	align	 4
@L3727:
	ld	 r2,r31,140
	bsr.n	 _gen_highpart
	or	 r3,r0,r21
@L3765:
	or	 r25,r0,r2
	ld	 r2,r31,140
	bsr.n	 _gen_highpart
	or	 r3,r0,r24
	or	 r3,r0,r2
	ld	 r13,r20[r23]
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r10,r31,140
	ld	 r13,r13,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	lda.d	 r13,r13[r10]
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L3729
	or	 r20,r12,lo16(_insn_gen_function)
	ld	 r3,r31,140
	or	 r2,r0,r21
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L3795
@L3796:
	align	 4
@L3729:
	ld	 r2,r31,140
	bsr.n	 _gen_lowpart
	or	 r3,r0,r21
@L3766:
	or	 r25,r0,r2
	ld	 r2,r31,140
	bsr.n	 _gen_lowpart
	or	 r3,r0,r24
	ld	 r13,r20[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	bcnd	 eq0,r18,@L3732
	ld	 r24,r18,12
	br	 @L3733
	align	 4
@L3732:
	bsr	 _get_insns
	or	 r24,r0,r2
@L3733:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	st	 r2,r24,28
	bsr.n	 _get_last_insn
	addu	 r1,r1,@L3797
@L3798:
	align	 4
@L3725:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r23,r13,lo16(_mode_size)
	ld	 r13,r23[r22]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L3735
	bsr.n	 _get_last_insn
	or	 r25,r0,0
	or	 r20,r0,r2
	or	 r18,r0,r23
@L3736:
	ld	 r12,r18[r22]
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L3740
	addu	 r13,r12,6
@L3740:
	ext	 r13,r13,0<2>
	cmp	 r13,r25,r13
	bb0.n	 lt,r13,@L3737
	or	 r2,r0,r21
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r23,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r3,r0,r2
	bcnd.n	 ne0,r3,@L3777
	cmp	 r13,r23,0
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3742
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3742
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L3741
	or	 r2,r0,r24
@L3742:
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r3,r0,r25
	or	 r4,r0,1
	or	 r5,r0,r22
	bsr.n	 _operand_subword
	addu	 r1,r1,@L3799
@L3800:
	align	 4
@L3741:
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r22
@L3767:
	or	 r3,r0,r2
	cmp	 r13,r23,0
@L3777:
	cmp	 r12,r3,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L3745
	or	 r2,r0,r23
	bsr	 _abort
	align	 4
@L3745:
	addu	 r25,r25,1
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L3801
@L3802:
	align	 4
@L3737:
	bcnd	 eq0,r20,@L3747
	ld	 r24,r20,12
	br	 @L3748
	align	 4
@L3747:
	bsr	 _get_insns
	or	 r24,r0,r2
@L3748:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	br.n	 @L3691
	st	 r2,r24,28
	align	 4
@L3735:
	bsr	 _abort
	align	 4
@L3691:
	br.n	 @L3761
	or	 r2,r0,r19
	align	 4
@L3630:
	bcnd.n	 eq0,r14,@L3751
	cmp	 r13,r14,16
	bb0.n	 ne,r13,@L3752
	or.u	 r13,r0,hi16(_direct_store)
	or	 r13,r13,lo16(_direct_store)
	ld.b	 r13,r14,r13
	bcnd	 eq0,r13,@L3751
@L3752:
	ld.hu	 r13,r0,r19
	cmp	 r12,r13,51
	cmp	 r13,r13,53
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L3750
@L3751:
	ld	 r2,r31,116
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld	 r4,r31,108
	ld	 r7,r31,124
	ld	 r8,r31,176
	or	 r23,r0,r2
	or	 r2,r0,r19
	or	 r3,r0,r15
	or	 r5,r0,r14
	bsr.n	 _store_bit_field
	or	 r6,r0,r23
	bcnd.n	 eq0,r22,@L3753
	or.u	 r13,r0,hi16(_const0_rtx)
	bcnd	 eq0,r25,@L3754
	ld	 r13,r0,r19
	or.u	 r12,r0,0x37
	or	 r12,r12,0x10
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L3778
	or	 r2,r0,r19
	bcnd.n	 eq0,r24,@L3755
	or	 r2,r0,46
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r3,r0,r2
	or	 r2,r0,r23
	or	 r4,r0,0
	bsr.n	 _expand_and
	addu	 r1,r1,@L3803
@L3804:
	align	 4
@L3755:
	ld.bu	 r24,r23,2
	bcnd	 ne0,r24,@L3756
	or	 r24,r0,r22
@L3756:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r2,r13[r24]
	mak	 r2,r2,0<3>
	or	 r3,r0,0
	bsr.n	 _build_int_2_wide
	subu	 r2,r2,r15
	or	 r25,r0,r2
	or	 r2,r0,77
	or	 r3,r0,r24
	or	 r4,r0,r23
	or	 r6,r0,0
	or	 r7,r0,0
	bsr.n	 _expand_shift
	or	 r5,r0,r25
	or	 r23,r0,r2
	or	 r2,r0,78
	or	 r3,r0,r24
	or	 r5,r0,r25
	or	 r6,r0,0
	or	 r7,r0,0
	or	 r4,r0,r23
	bsr.n	 _expand_shift
	addu	 r1,r1,@L3805
@L3806:
	align	 4
@L3754:
	or	 r2,r0,r19
@L3778:
	or	 r3,r0,r15
	ld	 r4,r31,108
	or	 r5,r0,r24
	ld	 r9,r31,124
	or	 r6,r0,0
	ld	 r10,r31,176
	or	 r7,r0,r22
	or	 r8,r0,0
	st	 r10,r31,32
	bsr.n	 _extract_bit_field
	addu	 r1,r1,@L3807
@L3808:
	align	 4
@L3753:
	ld	 r2,r13,lo16(_const0_rtx)
	br	 @L3761
	align	 4
@L3750:
	ld	 r2,r19,4
	bcnd	 eq0,r22,@L3758
	ld.hu	 r12,r0,r2
	mask	 r11,r12,0xffff
	cmp	 r13,r11,51
	bb0.n	 ne,r13,@L3758
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3758
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3758
	cmp	 r13,r11,49
	cmp	 r12,r11,113
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L3758
	cmp	 r13,r11,63
	bb1	 ne,r13,@L3759
	ld	 r13,r2,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,46
	bb1.n	 ne,r13,@L3759
	or.u	 r13,r0,hi16(_virtual_incoming_args_rtx)
	ld	 r12,r2,4
	ld	 r13,r13,lo16(_virtual_incoming_args_rtx)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L3758
	or.u	 r13,r0,hi16(_virtual_stack_vars_rtx)
	ld	 r13,r13,lo16(_virtual_stack_vars_rtx)
	cmp	 r13,r12,r13
	bb0	 ne,r13,@L3758
@L3759:
	bsr	 _copy_to_reg
@L3758:
	ld	 r4,r31,108
	bcnd	 ge0,r4,@L3760
	addu	 r4,r4,7
@L3760:
	bsr.n	 _plus_constant_wide
	ext	 r3,r4,0<3>
	or	 r4,r0,r2
	or	 r2,r0,r19
	bsr.n	 _change_address
	or	 r3,r0,r14
	or	 r3,r0,r2
	ld	 r13,r0,r3
	cmp	 r4,r22,0
	ld	 r2,r31,116
	extu	 r4,r4,1<ne>
	or	 r13,r13,8
	bsr.n	 _store_expr
	st	 r13,r0,r3
@L3761:
@Lte24:
	ld	 r1,r31,96
	ld.d	 r24,r31,88
	ld.d	 r22,r31,80
	ld.d	 r20,r31,72
	ld.d	 r18,r31,64
	ld.d	 r16,r31,56
	ld.d	 r14,r31,48
	jmp.n	 r1
	addu	 r31,r31,144
	def	 @L3807,@L3761-@L3808
	def	 @L3805,@L3761-@L3806
	def	 @L3803,@L3761-@L3804
	def	 @L3801,@L3802-@L3736
	def	 @L3799,@L3767-@L3800
	def	 @L3797,@L3691-@L3798
	def	 @L3795,@L3766-@L3796
	def	 @L3793,@L3765-@L3794
	def	 @L3791,@L3691-@L3792
	def	 @L3789,@L3790-@L3677
	def	 @L3787,@L3764-@L3788
	def	 @L3785,@L3631-@L3786
	def	 @L3783,@L3763-@L3784
	def	 @L3781,@L3762-@L3782
	def	 @L3779,@L3631-@L3780

	align	 8
	global	 _get_inner_reference
_get_inner_reference:
	subu	 r31,r31,96
	st	 r1,r31,80
	or	 r11,r0,0
	st.d	 r24,r31,72
	or	 r24,r0,r2
	st.d	 r20,r31,56
	or	 r20,r0,r3
	st.d	 r22,r31,64
	or	 r22,r0,r4
	st	 r17,r31,44
	or	 r17,r0,r5
	st.d	 r18,r31,48
@Ltb25:
	or	 r18,r0,r6
	ld.bu	 r12,r24,8
	or	 r19,r0,r8
	or	 r21,r0,0
	cmp	 r13,r12,37
	bb1.n	 ne,r13,@L3852
	or	 r23,r0,0
	ld	 r12,r24,20
	ld	 r13,r12,28
	ld	 r11,r12,20
	bb1	 (31-12),r13,@L3853
	ld.bu	 r21,r12,28
@L3853:
	ld	 r13,r12,8
	br.n	 @L3896
	extu	 r13,r13,1<17>
	align	 4
@L3852:
	cmp	 r13,r12,38
	bb1.n	 ne,r13,@L3855
	or.u	 r13,r0,hi16(_mode_size)
	ld	 r13,r24,8
	ld	 r11,r24,20
	br.n	 @L3896
	extu	 r13,r13,1<17>
	align	 4
@L3855:
	ld	 r12,r24,4
	ld.bu	 r21,r12,24
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r21]
	mak	 r13,r13,0<3>
	st	 r13,r0,r20
	ld	 r13,r24,4
	ld	 r13,r13,8
	extu	 r13,r13,1<17>
@L3896:
	bcnd.n	 eq0,r11,@L3857
	st	 r13,r0,r7
	ld.bu	 r13,r11,8
	cmp	 r13,r13,25
	bb0.n	 ne,r13,@L3858
	subu	 r13,r0,1
	st	 r13,r0,r20
	br.n	 @L3857
	or	 r21,r0,16
	align	 4
@L3858:
	ld	 r13,r11,12
	st	 r13,r0,r20
@L3857:
	st	 r0,r0,r22
@L3862:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,39
	bb1.n	 ne,r13,@L3863
	or.u	 r13,r0,hi16(_flag_volatile)
	ld	 r13,r13,lo16(_flag_volatile)
	bcnd.n	 eq0,r13,@L3863
	or	 r13,r0,1
	st	 r13,r0,r19
@L3863:
	ld.bu	 r12,r24,8
	subu	 r13,r12,37
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L3864
	mask	 r13,r12,0xff
	cmp	 r13,r13,37
	bb1	 ne,r13,@L3865
	ld	 r13,r24,20
	ld	 r25,r13,40
	br	 @L3866
	align	 4
@L3865:
	ld	 r25,r24,24
@L3866:
	ld.bu	 r12,r25,8
	cmp	 r13,r12,53
	bb1.n	 ne,r13,@L3867
	cmp	 r13,r12,25
	ld	 r12,r25,16
	ld.bu	 r13,r12,8
	cmp	 r13,r13,25
	bb1	 ne,r13,@L3868
	ld	 r25,r25,20
	br.n	 @L3869
	or	 r3,r0,r12
	align	 4
@L3868:
	ld	 r3,r25,20
	ld.bu	 r13,r3,8
	cmp	 r13,r13,25
	bb0.n	 ne,r13,@L3869
	or	 r25,r0,r12
	bsr	 _abort
	align	 4
@L3869:
	ld	 r13,r0,r22
	ld	 r12,r3,12
	addu	 r13,r13,r12
	bcnd.n	 eq0,r23,@L3877
	st	 r13,r0,r22
	bsr.n	 _size_int
	or	 r2,r0,8
	or	 r4,r0,r2
	or	 r2,r0,58
	bsr.n	 _size_binop
	or	 r3,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,53
	br.n	 @L3894
	or	 r3,r0,r23
	align	 4
@L3867:
	bb1	 ne,r13,@L3875
	ld	 r13,r0,r22
	ld	 r12,r25,12
	br.n	 @L3897
	addu	 r13,r13,r12
	align	 4
@L3875:
	bcnd	 eq0,r23,@L3877
	bsr.n	 _size_int
	or	 r2,r0,8
	or	 r4,r0,r2
	or	 r2,r0,58
	bsr.n	 _size_binop
	or	 r3,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,53
	br.n	 @L3894
	or	 r3,r0,r23
	align	 4
@L3877:
	bsr.n	 _size_int
	or	 r2,r0,8
	or	 r4,r0,r2
	or	 r2,r0,58
	or	 r3,r0,r25
@L3894:
	bsr	 _size_binop
	br.n	 @L3879
	or	 r23,r0,r2
	align	 4
@L3864:
	cmp	 r13,r13,42
	bb1	 ne,r13,@L3880
	ld	 r12,r24,20
	ld.bu	 r13,r12,8
	cmp	 r13,r13,25
	bb1	 ne,r13,@L3880
	ld	 r13,r24,4
	ld	 r11,r13,16
	ld.bu	 r13,r11,8
	cmp	 r13,r13,25
	bb1	 ne,r13,@L3880
	ld	 r12,r12,12
	ld	 r13,r11,12
	mul	 r12,r12,r13
	ld	 r13,r0,r22
	addu	 r13,r13,r12
@L3897:
	br.n	 @L3879
	st	 r13,r0,r22
	align	 4
@L3880:
	ld.bu	 r12,r24,8
	mask	 r13,r12,0xff
	cmp	 r13,r13,103
	bb0.n	 ne,r13,@L3879
	subu	 r13,r12,101
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb0	 ls,r13,@L3861
	ld	 r13,r24,16
	ld	 r12,r24,4
	ld	 r11,r13,4
	ld.bu	 r13,r12,24
	ld.bu	 r12,r11,24
	cmp	 r13,r13,r12
	bb0	 eq,r13,@L3861
@L3879:
	ld	 r13,r24,8
	bb0.n	 (31-12),r13,@L3884
	or	 r13,r0,1
	st	 r13,r0,r19
@L3884:
	ld	 r24,r24,16
	br	 @L3862
	align	 4
@L3861:
	bcnd	 ne0,r21,@L3886
	ld	 r12,r0,r20
	ld	 r4,r0,r22
	bcnd.n	 gt0,r12,@L3888
	subu	 r11,r0,r12
	bcnd.n	 ge0,r4,@L3889
	subu	 r13,r0,r4
	divu	 r13,r13,r11
	bcnd	 ne0,r12,@L3887
@L3891:
	tb0	 0,r0,503
	br	 @L3887
	align	 4
@L3889:
	divu	 r13,r4,r11
	bcnd	 eq0,r12,@L3891
	subu	 r13,r0,r13
	br	 @L3887
	align	 4
@L3888:
	bcnd.n	 ge0,r4,@L3890
	subu	 r13,r0,r4
	divu	 r13,r13,r12
	br.n	 @L3887
	subu	 r13,r0,r13
	align	 4
@L3890:
	divu	 r13,r4,r12
@L3887:
	ld	 r2,r0,r20
	mul	 r13,r13,r2
	subu	 r13,r4,r13
	bcnd.n	 ne0,r13,@L3886
	or	 r3,r0,1
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	or	 r21,r0,r2
	cmp	 r13,r21,16
	ext	 r13,r13,1<ne>
	and	 r21,r21,r13
@L3886:
	st	 r21,r0,r18
	st	 r23,r0,r17
@Lte25:
	ld	 r1,r31,80
	ld	 r17,r31,44
	or	 r2,r0,r24
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	jmp.n	 r1
	addu	 r31,r31,96

	align	 8
	global	 _force_operand
_force_operand:
	subu	 r31,r31,80
	st.d	 r22,r31,48
	or	 r23,r0,r2
	st	 r21,r31,44
	or	 r21,r0,r3
	or	 r22,r0,0
	st.d	 r24,r31,56
	or	 r24,r0,0
	bcnd.n	 eq0,r21,@L3912
	st	 r1,r31,64
@Ltb26:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,51
	ext	 r13,r13,1<eq>
	and	 r24,r21,r13
@L3912:
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,63
	bb1.n	 ne,r13,@L3914
	cmp	 r13,r12,64
	or.u	 r13,r0,hi16(_add_optab)
	ld	 r22,r13,lo16(_add_optab)
	br	 @L3915
	align	 4
@L3914:
	bb1.n	 ne,r13,@L3916
	cmp	 r13,r12,66
	or.u	 r13,r0,hi16(_sub_optab)
	ld	 r22,r13,lo16(_sub_optab)
	br	 @L3915
	align	 4
@L3916:
	bb1	 ne,r13,@L3915
	ld	 r25,r23,8
	ld.hu	 r12,r0,r25
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3919
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3919
	mask	 r11,r12,0xffff
	cmp	 r13,r11,49
	cmp	 r12,r11,113
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L3919
	cmp	 r13,r11,51
	cmp	 r12,r25,r24
	or.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	subu	 r13,r13,1
	and	 r24,r24,r13
@L3919:
	ld	 r2,r23,4
	bsr.n	 _force_operand
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,0
	bsr.n	 _force_operand
	ld.bu	 r25,r23,2
	or	 r3,r0,r24
	or	 r5,r0,r21
	or	 r6,r0,0
	or	 r4,r0,r2
	or	 r2,r0,r25
	bsr.n	 _expand_mult
	addu	 r1,r1,@L3926
@L3927:
	align	 4
@L3915:
	bcnd	 eq0,r22,@L3920
	ld	 r25,r23,8
	ld.hu	 r12,r0,r25
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3921
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L3921
	mask	 r11,r12,0xffff
	cmp	 r13,r11,49
	cmp	 r12,r11,113
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L3921
	cmp	 r13,r11,51
	cmp	 r12,r25,r24
	or.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	subu	 r13,r13,1
	and	 r24,r24,r13
@L3921:
	or.u	 r13,r0,hi16(_sub_optab)
	ld	 r13,r13,lo16(_sub_optab)
	cmp	 r13,r22,r13
	bb1.n	 ne,r13,@L3925
	or.u	 r13,r0,hi16(_add_optab)
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb1.n	 ne,r13,@L3925
	or.u	 r13,r0,hi16(_add_optab)
	ld.bu	 r2,r23,2
	or	 r3,r0,r25
	bsr.n	 _negate_rtx
	ld	 r22,r13,lo16(_add_optab)
	or	 r25,r0,r2
	or.u	 r13,r0,hi16(_add_optab)
@L3925:
	ld	 r13,r13,lo16(_add_optab)
	cmp	 r13,r22,r13
	bb0	 eq,r13,@L3923
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb0	 eq,r13,@L3923
	ld	 r4,r23,4
	ld.hu	 r13,r0,r4
	cmp	 r13,r13,63
	bb0	 eq,r13,@L3923
	ld	 r4,r4,4
	ld.hu	 r13,r0,r4
	cmp	 r13,r13,51
	bb0	 eq,r13,@L3923
	ld	 r13,r4,4
	subu	 r13,r13,64
	cmp	 r13,r13,3
	bb0	 ls,r13,@L3923
	ld.bu	 r2,r23,2
	or	 r3,r0,r22
	or	 r5,r0,r25
	or	 r6,r0,r24
	or	 r7,r0,0
	bsr.n	 _expand_binop
	or	 r8,r0,3
	ld	 r13,r23,4
	or	 r24,r0,r2
	ld	 r2,r13,8
	or	 r3,r0,0
	bsr.n	 _force_operand
	ld.bu	 r25,r23,2
	or	 r5,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,r22
	or	 r4,r0,r24
	or	 r6,r0,r21
	or	 r7,r0,0
	or	 r8,r0,3
	bsr.n	 _expand_binop
	addu	 r1,r1,@L3928
@L3929:
	align	 4
@L3923:
	ld	 r2,r23,4
	bsr.n	 _force_operand
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,0
	bsr.n	 _force_operand
	ld.bu	 r25,r23,2
	or	 r3,r0,r22
	or	 r4,r0,r24
	or	 r6,r0,r21
	or	 r7,r0,0
	or	 r8,r0,3
	or	 r5,r0,r2
	or	 r2,r0,r25
	bsr.n	 _expand_binop
	addu	 r1,r1,@L3930
@L3931:
	align	 4
@L3920:
	or	 r2,r0,r23
@L3924:
@Lte26:
	ld	 r1,r31,64
	ld	 r21,r31,44
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	jmp.n	 r1
	addu	 r31,r31,80
	def	 @L3930,@L3924-@L3931
	def	 @L3928,@L3924-@L3929
	def	 @L3926,@L3924-@L3927

	align	 8
_save_noncopied_parts:
	subu	 r31,r31,80
	st.d	 r20,r31,40
	or	 r20,r0,r2
	st.d	 r22,r31,48
	or	 r22,r0,r3
	st	 r1,r31,64
	or	 r23,r0,0
	bcnd.n	 eq0,r22,@L3943
	st.d	 r24,r31,56
@Ltb27:
@L3945:
	ld	 r3,r22,16
	ld.bu	 r13,r3,8
	cmp	 r13,r13,3
	bb1.n	 ne,r13,@L3946
	or	 r2,r0,37
	bsr.n	 _save_noncopied_parts
	or	 r2,r0,r20
	or	 r3,r0,r2
	bsr.n	 _chainon
	or	 r2,r0,r23
	br.n	 @L3944
	or	 r23,r0,r2
	align	 4
@L3946:
	ld	 r24,r3,4
	or	 r4,r0,r20
	or	 r5,r0,r3
	bsr.n	 _build
	or	 r3,r0,r24
	or	 r21,r0,r2
	or	 r2,r0,r24
	bsr.n	 _int_size_in_bytes
	ld.bu	 r25,r24,24
	or	 r4,r0,0
	or	 r3,r0,r2
	bsr.n	 _assign_stack_temp
	or	 r2,r0,r25
	or	 r25,r0,r2
	ld.bu	 r2,r24,24
	bsr.n	 _memory_address_p
	ld	 r3,r25,4
	bcnd.n	 ne0,r2,@L3950
	or	 r2,r0,105
	ld.bu	 r3,r24,24
	or	 r2,r0,r25
	bsr.n	 _change_address
	or	 r4,r0,0
	or	 r25,r0,r2
	or	 r2,r0,105
@L3950:
	or	 r3,r0,r24
	or	 r4,r0,0
	bsr.n	 _build
	or	 r5,r0,r25
	or	 r3,r0,r2
	or	 r2,r0,r21
	bsr.n	 _tree_cons
	or	 r4,r0,r23
	or	 r23,r0,r2
	ld	 r13,r23,16
	ld	 r2,r23,12
	ld	 r3,r13,20
	bsr.n	 _store_expr
	or	 r4,r0,0
@L3944:
	ld	 r22,r0,r22
	bcnd	 ne0,r22,@L3945
@L3943:
@Lte27:
	ld	 r1,r31,64
	ld.d	 r24,r31,56
	or	 r2,r0,r23
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80

	align	 8
_init_noncopied_parts:
	subu	 r31,r31,64
	st	 r23,r31,36
	or	 r23,r0,r2
	st.d	 r24,r31,40
	or	 r25,r0,r3
	or	 r24,r0,0
	bcnd.n	 eq0,r25,@L3961
	st	 r1,r31,48
@Ltb28:
@L3963:
	ld	 r5,r25,16
	ld.bu	 r13,r5,8
	cmp	 r13,r13,3
	bb1.n	 ne,r13,@L3964
	or	 r2,r0,37
	or	 r2,r0,r23
	bsr.n	 _init_noncopied_parts
	or	 r3,r0,r5
	or	 r3,r0,r2
	or	 r2,r0,r24
	bsr.n	 _chainon
	addu	 r1,r1,@L3969
@L3970:
	align	 4
@L3964:
	ld	 r3,r5,4
	bsr.n	 _build
	or	 r4,r0,r23
	or	 r3,r0,r2
	ld	 r2,r25,12
	bsr.n	 _tree_cons
	or	 r4,r0,r24
@L3968:
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L3963
	or	 r24,r0,r2
@L3961:
@Lte28:
	ld	 r1,r31,48
	ld	 r23,r31,36
	or	 r2,r0,r24
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64
	def	 @L3969,@L3968-@L3970

	align	 8
_safe_from_p:
	subu	 r31,r31,80
	st.d	 r22,r31,48
	or	 r23,r0,r2
	st	 r1,r31,64
	or	 r22,r0,r3
	st.d	 r20,r31,40
	or	 r21,r0,0
	bcnd.n	 eq0,r23,@L4070
	st.d	 r24,r31,56
@Ltb29:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,53
	bb1	 ne,r13,@L4025
	ld	 r23,r23,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,51
	bb1	 ne,r13,@L4025
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L4075
	or	 r2,r0,0
@L4025:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L4108
	or.u	 r13,r0,hi16(_tree_code_type)
	or.u	 r13,r0,hi16(_virtual_outgoing_args_rtx)
	ld	 r12,r23,4
	ld	 r11,r13,lo16(_virtual_outgoing_args_rtx)
	cmp	 r13,r12,r11
	bb0	 ne,r13,@L4070
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L4108
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r13,r12,4
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L4070
	or.u	 r13,r0,hi16(_tree_code_type)
@L4108:
	ld.bu	 r12,r22,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r13,r0,r13
	subu	 r11,r13,49
	or.u	 r13,r0,hi16(@L4068)
	cmp	 r12,r11,71
	bb0.n	 ls,r12,@L4029
	or	 r13,r13,lo16(@L4068)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L4068:
	word	 @L4038
	word	 @L4040
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4040
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4070
	word	 @L4030
	word	 @L4043
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4043
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4029
	word	 @L4032
	align	 4
@L4030:
	ld	 r21,r22,64
	br	 @L4029
	align	 4
@L4032:
	ld.bu	 r13,r22,8
	cmp	 r13,r13,3
	bb0.n	 eq,r13,@L4075
	or	 r2,r0,0
	ld	 r3,r22,16
	bcnd.n	 eq0,r3,@L4035
	or	 r25,r0,0
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L4075
	or	 r2,r0,r25
@L4035:
	ld	 r3,r0,r22
	bcnd	 eq0,r3,@L4074
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L4075
	or	 r2,r0,r25
	br.n	 @L4109
	or	 r25,r0,1
	align	 4
@L4038:
	ld	 r3,r22,16
	br.n	 @L4110
	or	 r2,r0,r23
	align	 4
@L4040:
	ld	 r3,r22,16
	or	 r2,r0,r23
	bsr.n	 _safe_from_p
	or	 r25,r0,0
	bcnd	 eq0,r2,@L4073
	ld	 r3,r22,20
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	cmp	 r2,r2,0
	br.n	 @L4073
	extu	 r25,r2,1<ne>
	align	 4
@L4043:
	ld.bu	 r13,r22,8
	subu	 r11,r13,39
	or.u	 r13,r0,hi16(@L4059)
	cmp	 r12,r11,67
	bb0.n	 ls,r12,@L4044
	or	 r13,r13,lo16(@L4059)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L4059:
	word	 @L4046
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4057
	word	 @L4048
	word	 @L4058
	word	 @L4055
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4044
	word	 @L4056
	word	 @L4053
	word	 @L4045
	align	 4
@L4045:
	ld	 r2,r22,16
	bsr.n	 _staticp
	addu	 r1,r1,@L4113
@L4114:
	align	 4
@L4046:
	ld.hu	 r13,r0,r23
	br.n	 @L4106
	cmp	 r13,r13,55
	align	 4
@L4048:
	ld	 r21,r22,24
	bcnd	 ne0,r21,@L4076
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,51
	bb1.n	 ne,r13,@L4106
	cmp	 r13,r12,55
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L4107
	cmp	 r13,r12,55
@L4106:
	bb1.n	 ne,r13,@L4044
	or	 r2,r0,0
	br	 @L4075
	align	 4
@L4053:
	ld	 r21,r22,20
	bcnd	 ne0,r21,@L4076
@L4107:
	br.n	 @L4075
	or	 r2,r0,0
	align	 4
@L4055:
	ld	 r21,r22,20
	br	 @L4044
	align	 4
@L4056:
	ld	 r21,r22,24
	br	 @L4044
	align	 4
@L4057:
	ld	 r3,r22,20
	or	 r2,r0,r23
@L4110:
	bsr.n	 _safe_from_p
	addu	 r1,r1,@L4115
@L4116:
	align	 4
@L4058:
	bsr	 _abort
	align	 4
@L4044:
	bcnd.n	 ne0,r21,@L4076
	or.u	 r13,r0,hi16(_tree_code_length)
	ld.bu	 r12,r22,8
	ld	 r13,r13,lo16(_tree_code_length)
	ld	 r20,r13[r12]
	cmp	 r13,r21,r20
	bb0.n	 lt,r13,@L4029
	or	 r24,r0,0
	mask	 r12,r20,3
	bcnd.n	 eq0,r12,@L4065
	or	 r25,r0,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L4080
	cmp	 r13,r12,2
	bb0	 gt,r13,@L4081
	ld	 r3,r22,16
	bcnd	 eq0,r3,@L4083
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L4075
	or	 r2,r0,0
@L4083:
	addu	 r25,r22,4
	or	 r24,r0,1
@L4081:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L4086
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L4075
	or	 r2,r0,0
@L4086:
	addu	 r25,r25,4
	addu	 r24,r24,1
@L4080:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L4089
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L4075
	or	 r2,r0,0
@L4089:
	addu	 r24,r24,1
	cmp	 r13,r24,r20
	bb0.n	 lt,r13,@L4029
	addu	 r25,r25,4
@L4065:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L4092
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L4075
	or	 r2,r0,0
@L4092:
	ld	 r3,r25,20
	bcnd	 eq0,r3,@L4095
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L4075
	or	 r2,r0,0
@L4095:
	ld	 r3,r25,24
	bcnd	 eq0,r3,@L4098
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L4075
	or	 r2,r0,0
@L4098:
	ld	 r3,r25,28
	bcnd	 eq0,r3,@L4101
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L4075
	or	 r2,r0,0
@L4101:
	addu	 r24,r24,4
	cmp	 r13,r24,r20
	bb1.n	 lt,r13,@L4065
	addu	 r25,r25,16
@L4029:
	bcnd.n	 eq0,r21,@L4075
	or	 r2,r0,1
@L4076:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L4111
	or	 r2,r0,r23
	ld	 r21,r21,4
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L4112
	or	 r3,r0,r21
	ld	 r13,r21,4
	cmp	 r13,r13,63
	bb1	 le,r13,@L4107
@L4111:
	or	 r3,r0,r21
@L4112:
	bsr.n	 _rtx_equal_p
	or	 r25,r0,0
	bcnd	 ne0,r2,@L4073
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1	 ne,r13,@L4074
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,55
	bb1	 ne,r13,@L4074
	ld	 r13,r22,8
	bb0.n	 (31-13),r13,@L4075
	or	 r2,r0,r25
@L4074:
	or	 r25,r0,1
@L4073:
@L4109:
	br.n	 @L4075
	or	 r2,r0,r25
	align	 4
@L4070:
	or	 r2,r0,1
@L4075:
@Lte29:
	ld	 r1,r31,64
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80
	def	 @L4115,@L4075-@L4116
	def	 @L4113,@L4075-@L4114

data
	align	 8
@LC0:
	string	 "prior parameter's size depends on `%s'\000"
	align	 8
@LC1:
	string	 "aggregate value in COND_EXPR\000"
	align	 8
@LC2:
	string	 "aggregate value in COND_EXPR\000"
	align	 8
@LC3:
	string	 "aggregate value in COND_EXPR\000"
text
	align	 8
	global	 _expand_expr
_expand_expr:
	subu	 r31,r31,384
	st	 r1,r31,96
	st.d	 r24,r31,88
	st.d	 r22,r31,80
	st.d	 r20,r31,72
	st.d	 r18,r31,64
	st.d	 r16,r31,56
	st.d	 r14,r31,48
@Ltb30:
	or	 r20,r0,r2
	st	 r4,r31,164
	ld	 r15,r20,4
	st	 r15,r31,172
	ld	 r13,r15,8
	extu	 r13,r13,1<17>
	st	 r13,r31,120
	ld.bu	 r14,r15,24
	or	 r17,r0,r3
	ld.bu	 r15,r20,8
	or	 r19,r0,r5
	or	 r16,r0,0
	bcnd.n	 eq0,r17,@L4121
	st	 r15,r31,180
	ld.hu	 r13,r0,r17
	cmp	 r13,r13,51
	ext	 r13,r13,1<eq>
	and	 r16,r17,r13
@L4121:
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r13,r13,lo16(_const0_rtx)
	cmp	 r13,r17,r13
	st	 r17,r31,372
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r16,@L4123
	st	 r13,r31,188
	ld	 r13,r16,4
	cmp	 r13,r13,63
	ext	 r13,r13,1<gt>
	and	 r16,r16,r13
@L4123:
	bsr	 _preserve_subexpressions_p
	cmp	 r2,r2,0
	ld	 r15,r31,188
	ext	 r2,r2,1<eq>
	bcnd.n	 eq0,r15,@L4125
	and	 r16,r16,r2
	or	 r17,r0,0
	st	 r0,r31,372
@L4125:
	or.u	 r13,r0,hi16(_cse_not_expected)
	ld	 r12,r13,lo16(_cse_not_expected)
	cmp	 r13,r14,16
	cmp	 r12,r12,0
	and.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L4126
	bcnd	 eq0,r17,@L4126
	ld.hu	 r13,r0,r17
	cmp	 r13,r13,51
	bb1	 ne,r13,@L4127
	ld	 r13,r17,4
	cmp	 r13,r13,63
	bb1	 gt,r13,@L4126
@L4127:
	or	 r17,r0,r16
@L4126:
	ld	 r15,r31,188
	bcnd	 eq0,r15,@L4128
	cmp	 r13,r14,0
	ld	 r12,r20,8
	extu	 r13,r13,1<ne>
	extu	 r12,r12,1<19>
	and	 r12,r12,r13
	bcnd	 eq0,r12,@L4128
	cmp	 r13,r14,16
	bb0	 ne,r13,@L4128
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,r14
	or	 r17,r0,r2
	or	 r2,r0,r20
	or	 r4,r0,0
	or	 r5,r0,r19
	bsr.n	 _expand_expr
	or	 r3,r0,r17
	or	 r19,r0,r2
	cmp	 r13,r19,r17
	bb0	 ne,r13,@L8004
	ld.hu	 r11,r0,r17
	ld.bu	 r22,r17,2
	or	 r21,r0,r17
	or.u	 r13,r0,hi16(_mode_class)
	or	 r13,r13,lo16(_mode_class)
	cmp	 r12,r11,59
	ld	 r20,r13[r22]
	bb0.n	 ne,r12,@L4132
	or	 r24,r0,r19
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L4135
	cmp	 r13,r11,63
	ld	 r2,r17,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L4136
	st	 r2,r17,4
	align	 4
@L4135:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L4136
	ld	 r2,r17,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r17,4
	ld	 r2,r17,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r17,8
@L4136:
	br.n	 @L4131
	or	 r2,r0,r21
	align	 4
@L4132:
	ld	 r13,r17,8
	bcnd	 ne0,r13,@L4138
	ld	 r2,r17,4
	br	 @L4131
	align	 4
@L4138:
	ld	 r2,r17,12
	bcnd	 ne0,r2,@L4131
	ld	 r13,r17,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r17,4
	bsr.n	 _gen_move_insn
	st	 r2,r17,12
	bsr.n	 _emit_insn_before
	ld	 r3,r17,8
	ld	 r2,r17,12
@L4131:
	ld.hu	 r12,r0,r24
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L4141
	or	 r21,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L8006
	cmp	 r13,r12,63
	ld.bu	 r13,r24,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L4142
	ld	 r23,r24,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L4142
	ld	 r13,r23,4
	st	 r13,r24,4
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L4145
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r24,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r24
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	br.n	 @L4140
	or	 r2,r0,r25
	align	 4
@L4142:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L4144
	cmp	 r13,r12,63
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L4145
	st	 r2,r24,4
	align	 4
@L4144:
@L8006:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L4145
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,4
	ld	 r2,r24,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,8
@L4145:
	br.n	 @L4140
	or	 r2,r0,r24
	align	 4
@L4141:
	ld	 r13,r24,8
	bcnd	 ne0,r13,@L4147
	ld	 r2,r24,4
	br.n	 @L8007
	cmp	 r13,r22,16
	align	 4
@L4147:
	ld	 r2,r24,12
	bcnd.n	 ne0,r2,@L8007
	cmp	 r13,r22,16
	ld	 r13,r24,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r24,4
	bsr.n	 _gen_move_insn
	st	 r2,r24,12
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	ld	 r2,r24,12
@L4140:
	cmp	 r13,r22,16
@L8007:
	bb0.n	 ne,r13,@L4150
	or	 r24,r0,r2
	ld.bu	 r13,r24,2
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L4149
	ld.bu	 r13,r24,2
	bcnd	 eq0,r13,@L4149
@L4150:
	bsr	 _abort
	align	 4
@L4149:
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4152
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4152
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L4151
@L4152:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,47
	bb1	 ne,r13,@L4151
	ld.bu	 r13,r24,2
	bcnd.n	 eq0,r13,@L4151
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
@L4151:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,55
	bb1	 ne,r13,@L4153
	ld.bu	 r2,r21,2
	bsr.n	 _memory_address_p
	ld	 r3,r21,4
	bcnd.n	 ne0,r2,@L8008
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bcnd.n	 eq0,r2,@L4154
	or.u	 r13,r0,hi16(_flag_force_addr)
@L8008:
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L4153
	ld	 r13,r21,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4154
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4154
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L4153
@L4154:
	ld	 r4,r21,4
	or	 r2,r0,r21
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r21,r0,r2
@L4153:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8009
	cmp	 r13,r22,16
	ld.bu	 r2,r24,2
	bsr.n	 _memory_address_p
	ld	 r3,r24,4
	bcnd.n	 eq0,r2,@L4157
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L4156
	ld	 r13,r24,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4157
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4157
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L8009
	cmp	 r13,r22,16
@L4157:
	ld	 r4,r24,4
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L4156:
	cmp	 r13,r22,16
@L8009:
	bb1.n	 ne,r13,@L4158
	subu	 r13,r20,5
	bsr	 _abort
	align	 4
@L4158:
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L4159
	or.u	 r13,r0,hi16(_mode_unit_size)
	or	 r13,r13,lo16(_mode_unit_size)
	ld	 r12,r13[r22]
	or	 r3,r0,2
	cmp	 r13,r20,5
	bb1.n	 ne,r13,@L4160
	mak	 r2,r12,0<3>
	or	 r3,r0,1
@L4160:
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	or	 r18,r0,r2
@L4159:
	or.u	 r23,r0,hi16(_mov_optab)
	ld	 r11,r23,lo16(_mov_optab)
	lda.d	 r13,r11[r22]
	ld	 r12,r13,4
	cmp	 r13,r12,210
	bb0.n	 ne,r13,@L4162
	or.u	 r13,r0,hi16(_insn_gen_function)
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r2,r0,r21
	ld	 r13,r13[r12]
	jsr.n	 r13
	or	 r3,r0,r24
	bsr	 _emit_insn
	br	 @L8004
	align	 4
@L4162:
	cmp	 r12,r18,16
	subu	 r13,r20,5
	extu	 r12,r12,1<ne>
	cmp	 r13,r13,1
	extu	 r13,r13,1<ls>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L4164
	mak	 r25,r18,0<3>
	addu	 r13,r11,r25
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L4164
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bsr.n	 _get_last_insn
	or	 r22,r0,r2
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L4165
	or	 r19,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r21
	bsr	 _emit_insn
@L4165:
	ld	 r13,r23,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	addu	 r13,r13,r25
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L4166
	or	 r20,r12,lo16(_insn_gen_function)
	or	 r2,r0,r21
	or	 r3,r0,r18
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8293
@L8294:
	align	 4
@L4166:
	or	 r2,r0,r18
	bsr.n	 _gen_highpart
	or	 r3,r0,r21
@L7811:
	or	 r25,r0,r2
	or	 r2,r0,r18
	bsr.n	 _gen_highpart
	or	 r3,r0,r24
	ld	 r13,r20[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r13,r13,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	lda.d	 r13,r13[r18]
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L4168
	or	 r20,r12,lo16(_insn_gen_function)
	or	 r2,r0,r21
	or	 r3,r0,r18
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8295
@L8296:
	align	 4
@L4168:
	or	 r2,r0,r18
	bsr.n	 _gen_lowpart
	or	 r3,r0,r21
@L7812:
	or	 r25,r0,r2
	or	 r2,r0,r18
	bsr.n	 _gen_lowpart
	or	 r3,r0,r24
	ld	 r13,r20[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	bcnd	 eq0,r19,@L4171
	ld	 r24,r19,12
	br	 @L4172
	align	 4
@L4171:
	bsr	 _get_insns
	or	 r24,r0,r2
@L4172:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	st	 r2,r24,28
	bsr	 _get_last_insn
	br	 @L8004
	align	 4
@L4164:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r23,r13,lo16(_mode_size)
	ld	 r13,r23[r22]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L4174
	bsr.n	 _get_last_insn
	or	 r25,r0,0
	or	 r20,r0,r2
	or	 r19,r0,r23
@L4175:
	ld	 r12,r19[r22]
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L4179
	addu	 r13,r12,6
@L4179:
	ext	 r13,r13,0<2>
	cmp	 r13,r25,r13
	bb0.n	 lt,r13,@L4176
	or	 r2,r0,r21
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r23,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r3,r0,r2
	bcnd.n	 ne0,r3,@L8010
	cmp	 r13,r23,0
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4181
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4181
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L4180
	or	 r2,r0,r24
@L4181:
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r3,r0,r25
	or	 r4,r0,1
	or	 r5,r0,r22
	bsr.n	 _operand_subword
	addu	 r1,r1,@L8297
@L8298:
	align	 4
@L4180:
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r22
@L7813:
	or	 r3,r0,r2
	cmp	 r13,r23,0
@L8010:
	cmp	 r12,r3,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L4184
	or	 r2,r0,r23
	bsr	 _abort
	align	 4
@L4184:
	addu	 r25,r25,1
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L8299
@L8300:
	align	 4
@L4176:
	bcnd	 eq0,r20,@L4186
	ld	 r24,r20,12
	br	 @L4187
	align	 4
@L4186:
	bsr	 _get_insns
	or	 r24,r0,r2
@L4187:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	br.n	 @L8004
	st	 r2,r24,28
	align	 4
@L4174:
	bsr	 _abort
	align	 4
@L4128:
	ld	 r15,r31,180
	or.u	 r13,r0,hi16(@L7145)
	cmp	 r12,r15,121
	bb0.n	 ls,r12,@L7144
	or	 r13,r13,lo16(@L7145)
	ld	 r13,r13[r15]
	jmp	 r13
	align	 4
@L7145:
	word	 @L7143
	word	 @L7144
	word	 @L7144
	word	 @L7144
	word	 @L7144
	word	 @L7144
	word	 @L7144
	word	 @L7144
	word	 @L7144
	word	 @L7144
	word	 @L7144
	word	 @L7144
	word	 @L7144
	word	 @L7144
	word	 @L7144
	word	 @L7144
	word	 @L7144
	word	 @L7144
	word	 @L7144
	word	 @L7144
	word	 @L7144
	word	 @L7144
	word	 @L7144
	word	 @L7144
	word	 @L7144
	word	 @L4212
	word	 @L4214
	word	 @L4216
	word	 @L4216
	word	 @L4199
	word	 @L4190
	word	 @L4213
	word	 @L7144
	word	 @L4199
	word	 @L4195
	word	 @L4199
	word	 @L7144
	word	 @L4559
	word	 @L4559
	word	 @L4404
	word	 @L4803
	word	 @L4806
	word	 @L4412
	word	 @L4244
	word	 @L6274
	word	 @L6784
	word	 @L6741
	word	 @L6734
	word	 @L6282
	word	 @L4235
	word	 @L4940
	word	 @L7144
	word	 @L4938
	word	 @L5333
	word	 @L5438
	word	 @L5441
	word	 @L5526
	word	 @L5526
	word	 @L5526
	word	 @L5526
	word	 @L5584
	word	 @L5584
	word	 @L5584
	word	 @L5584
	word	 @L5580
	word	 @L5526
	word	 @L5641
	word	 @L5640
	word	 @L5640
	word	 @L5640
	word	 @L5643
	word	 @L7144
	word	 @L5646
	word	 @L5829
	word	 @L5829
	word	 @L5648
	word	 @L6082
	word	 @L6092
	word	 @L6092
	word	 @L6092
	word	 @L6092
	word	 @L6087
	word	 @L6088
	word	 @L6085
	word	 @L7144
	word	 @L6080
	word	 @L6216
	word	 @L6216
	word	 @L6085
	word	 @L6087
	word	 @L6272
	word	 @L6151
	word	 @L6151
	word	 @L6151
	word	 @L6151
	word	 @L6151
	word	 @L6151
	word	 @L4807
	word	 @L7144
	word	 @L7144
	word	 @L7144
	word	 @L4946
	word	 @L4946
	word	 @L4946
	word	 @L4219
	word	 @L4242
	word	 @L6857
	word	 @L4946
	word	 @L6891
	word	 @L6892
	word	 @L7018
	word	 @L7016
	word	 @L7017
	word	 @L6854
	word	 @L6854
	word	 @L6856
	word	 @L6856
	word	 @L7144
	word	 @L7144
	word	 @L7144
	word	 @L4233
	word	 @L4234
	align	 4
@L4190:
	bsr.n	 _decl_function_context
	or	 r2,r0,r20
	or.u	 r13,r0,hi16(_current_function_decl)
	or	 r24,r0,r2
	ld	 r13,r13,lo16(_current_function_decl)
	cmp	 r12,r24,0
	cmp	 r13,r24,r13
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L4191
	cmp	 r13,r19,3
	bsr	 _find_function_data
	or	 r25,r0,r2
	ld	 r2,r25,324
	bsr.n	 _push_obstacks
	ld	 r3,r25,328
	bsr.n	 _label_rtx
	or	 r2,r0,r20
	or	 r4,r0,r2
	or	 r2,r0,2
	ld	 r5,r25,228
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	st	 r2,r25,228
	bsr.n	 _pop_obstacks
	addu	 r1,r1,@L8301
@L8302:
	align	 4
@L4191:
	bb1.n	 ne,r13,@L4192
	or	 r2,r0,r20
	bsr.n	 _label_rtx
	or.u	 r25,r0,hi16(_forced_labels)
	ld	 r5,r25,lo16(_forced_labels)
	or	 r4,r0,r2
	or	 r2,r0,2
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	st	 r2,r25,lo16(_forced_labels)
@L4192:
	bsr.n	 _label_rtx
	or	 r2,r0,r20
	or	 r4,r0,r2
	or	 r2,r0,56
	bsr.n	 _gen_rtx
	or	 r3,r0,4
	or	 r4,r0,r2
	or	 r2,r0,55
	bsr.n	 _gen_rtx
	or	 r3,r0,4
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r13,r13,lo16(_current_function_decl)
	cmp	 r12,r24,0
	cmp	 r13,r24,r13
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L7199
	or	 r19,r0,r2
	ld	 r12,r19,4
	ld	 r13,r0,r12
	or	 r13,r13,16
	br.n	 @L7199
	st	 r13,r0,r12
	align	 4
@L4195:
	ld	 r13,r20,64
	bcnd.n	 ne0,r13,@L4200
	or.u	 r3,r0,hi16(@LC0)
	or	 r2,r0,r20
	bsr.n	 _error_with_decl
	or	 r3,r3,lo16(@LC0)
	or.u	 r13,r0,hi16(_const_tiny_rtx)
	or	 r13,r13,lo16(_const_tiny_rtx)
	ld	 r2,r13[r14]
	br	 @L7200
	align	 4
@L4199:
	ld	 r13,r20,64
	bcnd	 ne0,r13,@L4200
	bsr	 _abort
	align	 4
@L4200:
	ld	 r13,r20,8
	or	 r2,r0,r20
	or	 r13,r13,32768
	bsr.n	 _decl_function_context
	st	 r13,r20,8
	bcnd.n	 eq0,r2,@L4201
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r13,r13,lo16(_current_function_decl)
	cmp	 r13,r2,r13
	bb0.n	 ne,r13,@L4201
	or.u	 r13,r0,hi16(_inline_function_decl)
	ld	 r13,r13,lo16(_inline_function_decl)
	cmp	 r13,r2,r13
	bb0	 ne,r13,@L4201
	ld	 r12,r20,64
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,55
	bb1	 ne,r13,@L4202
	ld	 r13,r12,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4201
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4201
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r13,r12,1<eq>
	xor	 r12,r13,1
	bcnd	 eq0,r12,@L4201
@L4202:
	ld	 r13,r20,28
	or	 r2,r0,r20
	or.u	 r13,r13,0x40
	bsr.n	 _mark_addressable
	st	 r13,r20,28
	ld	 r2,r20,64
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,55
	bb0	 ne,r13,@L4203
	bsr	 _abort
	align	 4
@L4203:
	ld	 r4,r2,4
	ld.hu	 r13,r0,r4
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L4204
	or	 r2,r0,r4
	ld	 r2,r4,4
	bsr.n	 _fix_lexical_addr
	or	 r3,r0,r20
	or	 r4,r0,r2
	or	 r2,r0,55
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L8303
@L8304:
	align	 4
@L4204:
	bsr.n	 _fix_lexical_addr
	or	 r3,r0,r20
@L7815:
	or	 r4,r0,r2
	ld	 r2,r20,64
	br.n	 @L8011
	or	 r3,r0,r14
	align	 4
@L4201:
	ld	 r2,r20,64
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,55
	bb1	 ne,r13,@L4206
	ld	 r4,r2,4
	ld.hu	 r13,r0,r4
	cmp	 r13,r13,51
	bb1	 ne,r13,@L4206
	ld.bu	 r3,r2,2
	bsr	 _change_address
	br	 @L7200
	align	 4
@L4206:
	ld	 r11,r20,64
	ld.hu	 r12,r0,r11
	cmp	 r13,r19,2
	cmp	 r12,r12,55
	and.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L4207
	cmp	 r13,r19,1
	cmp	 r12,r19,3
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd	 eq0,r13,@L4207
	ld.bu	 r2,r20,28
	bsr.n	 _memory_address_p
	ld	 r3,r11,4
	bcnd.n	 eq0,r2,@L4209
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L4207
	ld	 r13,r20,64
	ld	 r13,r13,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4209
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4209
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L4207
@L4209:
	ld	 r25,r20,64
	br	 @L7817
	align	 4
@L4207:
	ld	 r4,r20,64
	ld.hu	 r13,r0,r4
	cmp	 r13,r13,51
	bb1	 ne,r13,@L4210
	ld.bu	 r12,r4,2
	cmp	 r13,r12,r14
	bb0	 ne,r13,@L4210
	ld.bu	 r13,r20,28
	cmp	 r13,r13,r12
	bb0.n	 ne,r13,@L8012
	or	 r2,r0,53
	bsr	 _abort
	align	 4
@L4210:
	ld	 r2,r20,64
	br	 @L7200
	align	 4
@L4212:
	ld	 r2,r20,12
	ld	 r3,r20,16
@L7863:
	or	 r4,r0,r14
	bsr	 _immed_double_const
	br	 @L7200
	align	 4
@L4213:
	ld	 r2,r20,48
	br.n	 @L6281
	or	 r3,r0,r17
	align	 4
@L4214:
	or	 r2,r0,r20
	bsr	 _immed_real_const
	br	 @L7200
	align	 4
@L4216:
	ld	 r13,r20,12
	bcnd	 ne0,r13,@L4217
	bsr.n	 _output_constant_def
	or	 r2,r0,r20
@L4217:
	ld	 r11,r20,12
	ld.hu	 r12,r0,r11
	cmp	 r13,r19,2
	cmp	 r12,r12,55
	and.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L4218
	cmp	 r13,r19,3
	cmp	 r12,r19,1
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd	 eq0,r13,@L4218
	ld	 r3,r11,4
	bsr.n	 _memory_address_p
	or	 r2,r0,r14
	bcnd	 ne0,r2,@L4218
	ld	 r25,r20,12
@L7817:
	bsr.n	 _copy_rtx
	ld	 r2,r25,4
	or	 r4,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,0
	bsr	 _change_address
	br	 @L7200
	align	 4
@L4218:
	ld	 r2,r20,12
	br	 @L7200
	align	 4
@L4219:
	bsr.n	 _decl_function_context
	or	 r2,r0,r20
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r13,r13,lo16(_current_function_decl)
	cmp	 r13,r2,r13
	bb0.n	 ne,r13,@L4221
	or.u	 r13,r0,hi16(_inline_function_decl)
	ld	 r13,r13,lo16(_inline_function_decl)
	cmp	 r13,r2,r13
	bb1	 ne,r13,@L4220
@L4221:
	or	 r2,r0,0
@L4220:
	bcnd	 eq0,r2,@L4222
	ld	 r19,r20,24
	bcnd	 eq0,r19,@L4225
	ld.hu	 r13,r0,r19
	cmp	 r13,r13,51
	bb1	 ne,r13,@L4223
	bsr.n	 _put_var_into_stack
	or	 r2,r0,r20
	ld	 r19,r20,24
@L4223:
	bcnd	 eq0,r19,@L4225
	ld.hu	 r13,r0,r19
	cmp	 r13,r13,55
	bb0	 ne,r13,@L4224
@L4225:
	bsr	 _abort
	align	 4
@L4224:
	ld	 r2,r19,4
	bsr.n	 _fix_lexical_addr
	or	 r3,r0,r20
	or	 r4,r0,r2
	or	 r2,r0,r19
	or	 r3,r0,r14
@L8011:
	bsr	 _change_address
	br	 @L7200
	align	 4
@L4222:
	ld	 r13,r20,24
	bcnd.n	 ne0,r13,@L4226
	cmp	 r13,r14,16
	bb1.n	 ne,r13,@L4227
	or	 r11,r0,r14
	bsr.n	 _int_size_in_bytes
	ld	 r2,r20,4
	or	 r3,r0,r2
	or	 r2,r0,16
	or	 r4,r0,0
	bsr.n	 _assign_stack_temp
	addu	 r1,r1,@L8305
@L8306:
	align	 4
@L4227:
	ld	 r15,r31,172
	ld.bu	 r2,r15,8
	mask	 r13,r2,0xff
	cmp	 r12,r13,7
	cmp	 r13,r13,10
	or	 r12,r12,r13
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,r11
@L7819:
	or	 r19,r0,r2
	ld	 r2,r20,16
	or	 r3,r0,r19
	or	 r4,r0,0
	bsr.n	 _store_expr
	st	 r19,r20,24
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd	 ne0,r13,@L4226
	ld.hu	 r13,r0,r19
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L4226
	or	 r2,r0,2
	or.u	 r25,r0,hi16(_save_expr_regs)
	or	 r3,r0,0
	ld	 r5,r25,lo16(_save_expr_regs)
	bsr.n	 _gen_rtx
	or	 r4,r0,r19
	st	 r2,r25,lo16(_save_expr_regs)
@L4226:
	ld	 r4,r20,24
	ld.hu	 r13,r0,r4
	cmp	 r13,r13,51
	bb1	 ne,r13,@L4232
	ld.bu	 r13,r4,2
	cmp	 r13,r13,r14
	bb0.n	 ne,r13,@L4232
	or	 r2,r0,53
@L8012:
	or	 r3,r0,r14
	bsr.n	 _gen_rtx
	or	 r5,r0,0
	or	 r19,r0,r2
	ld	 r13,r0,r19
	ld	 r11,r31,120
	or	 r13,r13,8
	mak	 r11,r11,1<5>
	and	 r12,r13,0xffdf
	st	 r13,r0,r2
	or	 r12,r12,r11
	br.n	 @L7200
	st	 r12,r0,r2
	align	 4
@L4232:
	ld	 r2,r20,24
	br	 @L7200
	align	 4
@L4233:
	bsr	 _gen_label_rtx
	or	 r25,r0,r2
	ld	 r2,r20,16
	or	 r4,r0,0
	bsr.n	 _do_jump
	or	 r3,r0,r25
	bsr.n	 _expand_exit_loop
	or	 r2,r0,0
	or	 r2,r0,r25
	bsr	 _emit_label
	br	 @L7143
	align	 4
@L4234:
	bsr.n	 _expand_start_loop
	or	 r2,r0,1
	bsr.n	 _expand_expr_stmt
	ld	 r2,r20,16
	bsr	 _expand_end_loop
	br	 @L7143
	align	 4
@L4235:
	or	 r2,r0,0
	bsr.n	 _expand_start_bindings
	ld	 r25,r20,16
	ld	 r2,r20,24
	bcnd	 eq0,r2,@L4236
	ld	 r13,r2,8
	bb1	 (31-16),r13,@L4236
	bsr	 _insert_block
@L4236:
	bcnd	 eq0,r25,@L4238
@L4239:
	ld	 r13,r25,64
	bcnd	 ne0,r13,@L4240
	bsr.n	 _expand_decl
	or	 r2,r0,r25
@L4240:
	bsr.n	 _expand_decl_init
	or	 r2,r0,r25
	ld	 r25,r0,r25
	bcnd	 ne0,r25,@L4239
@L4238:
	ld	 r2,r20,20
	ld	 r4,r31,164
	or	 r3,r0,r17
	bsr.n	 _expand_expr
	or	 r5,r0,r19
	or	 r19,r0,r2
	ld	 r2,r20,16
	or	 r3,r0,0
	or	 r4,r0,0
	bsr	 _expand_end_bindings
	br	 @L7199
	align	 4
@L4242:
	or.u	 r25,r0,hi16(_const0_rtx)
	ld	 r2,r20,16
	ld	 r13,r25,lo16(_const0_rtx)
	cmp	 r13,r2,r13
	bb1	 ne,r13,@L4243
	bsr	 _abort
	align	 4
@L4243:
	bsr	 _emit_insns
	ld	 r2,r20,20
	ld	 r13,r25,lo16(_const0_rtx)
	br.n	 @L7200
	st	 r13,r20,16
	align	 4
@L4244:
	ld	 r12,r20,8
	bb0.n	 (31-18),r12,@L4245
	cmp	 r13,r14,16
	bb0	 ne,r13,@L4246
	bb0	 (31-11),r12,@L4245
@L4246:
	bsr.n	 _output_constant_def
	or	 r2,r0,r20
	subu	 r13,r19,2
	cmp	 r12,r19,1
	cmp	 r13,r13,1
	rot	 r11,r12,26
	and.c	 r12,r13,r11
	extu	 r12,r12,1<hi>
	bcnd.n	 eq0,r12,@L7862
	or	 r25,r0,r2
	ld.bu	 r2,r25,2
	bsr.n	 _memory_address_p
	ld	 r3,r25,4
	bcnd.n	 ne0,r2,@L7200
	or	 r2,r0,r25
	ld	 r4,r25,4
	bsr.n	 _change_address
	or	 r3,r0,0
	br.n	 @L7862
	or	 r25,r0,r2
	align	 4
@L4245:
	ld	 r15,r31,188
	bcnd	 eq0,r15,@L4248
	ld	 r25,r20,20
	bcnd.n	 eq0,r25,@L7143
	or.u	 r24,r0,hi16(_const0_rtx)
@L4252:
	ld	 r2,r25,16
	or	 r4,r0,0
	ld	 r3,r24,lo16(_const0_rtx)
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L4252
	or.u	 r13,r0,hi16(_const0_rtx)
	br	 @L8013
	align	 4
@L4248:
	bcnd	 eq0,r17,@L4256
	ld.hu	 r13,r0,r17
	or	 r23,r0,r17
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L4259
	or	 r22,r0,0
	ld	 r23,r17,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,51
	bb1	 ne,r13,@L4259
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L4257
	or	 r2,r0,0
@L4259:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8014
	or.u	 r13,r0,hi16(_tree_code_type)
	or.u	 r13,r0,hi16(_virtual_outgoing_args_rtx)
	ld	 r12,r23,4
	ld	 r11,r13,lo16(_virtual_outgoing_args_rtx)
	cmp	 r13,r12,r11
	bb0	 ne,r13,@L4304
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L8014
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r13,r12,4
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L4304
	or.u	 r13,r0,hi16(_tree_code_type)
@L8014:
	ld.bu	 r12,r20,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r13,r0,r13
	subu	 r11,r13,49
	or.u	 r13,r0,hi16(@L4302)
	cmp	 r12,r11,71
	bb0.n	 ls,r12,@L4263
	or	 r13,r13,lo16(@L4302)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L4302:
	word	 @L4272
	word	 @L4274
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4274
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4304
	word	 @L4264
	word	 @L4277
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4277
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4263
	word	 @L4266
	align	 4
@L4264:
	ld	 r22,r20,64
	br	 @L4263
	align	 4
@L4266:
	ld.bu	 r13,r20,8
	cmp	 r13,r13,3
	bb1.n	 ne,r13,@L4257
	or	 r2,r0,0
	ld	 r3,r20,16
	bcnd.n	 eq0,r3,@L4269
	or	 r25,r0,0
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L4257
	or	 r2,r0,r25
@L4269:
	ld	 r3,r0,r20
	bcnd	 eq0,r3,@L4308
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L4257
	or	 r2,r0,r25
	br.n	 @L8015
	or	 r25,r0,1
	align	 4
@L4272:
	ld	 r3,r20,16
	br.n	 @L8016
	or	 r2,r0,r23
	align	 4
@L4274:
	ld	 r3,r20,16
	or	 r2,r0,r23
	bsr.n	 _safe_from_p
	or	 r25,r0,0
	bcnd	 eq0,r2,@L4307
	ld	 r3,r20,20
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	cmp	 r2,r2,0
	br.n	 @L4307
	extu	 r25,r2,1<ne>
	align	 4
@L4277:
	ld.bu	 r13,r20,8
	subu	 r11,r13,39
	or.u	 r13,r0,hi16(@L4293)
	cmp	 r12,r11,67
	bb0.n	 ls,r12,@L4278
	or	 r13,r13,lo16(@L4293)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L4293:
	word	 @L4280
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4291
	word	 @L4282
	word	 @L4292
	word	 @L4289
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4278
	word	 @L4290
	word	 @L4287
	word	 @L4279
	align	 4
@L4279:
	ld	 r2,r20,16
	bsr.n	 _staticp
	addu	 r1,r1,@L8307
@L8308:
	align	 4
@L4280:
	ld.hu	 r13,r0,r23
	br.n	 @L7822
	cmp	 r13,r13,55
	align	 4
@L4282:
	ld	 r22,r20,24
	bcnd	 ne0,r22,@L7203
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,51
	bb1.n	 ne,r13,@L7822
	cmp	 r13,r12,55
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L7823
	cmp	 r13,r12,55
@L7822:
	bb1.n	 ne,r13,@L4278
	or	 r2,r0,0
	br	 @L4257
	align	 4
@L4287:
	ld	 r22,r20,20
	bcnd	 ne0,r22,@L7203
@L7823:
	br.n	 @L4257
	or	 r2,r0,0
	align	 4
@L4289:
	ld	 r22,r20,20
	br	 @L4278
	align	 4
@L4290:
	ld	 r22,r20,24
	br	 @L4278
	align	 4
@L4291:
	ld	 r3,r20,20
	or	 r2,r0,r23
@L8016:
	bsr.n	 _safe_from_p
	addu	 r1,r1,@L8309
@L8310:
	align	 4
@L4292:
	bsr	 _abort
	align	 4
@L4278:
	bcnd.n	 ne0,r22,@L7203
	or.u	 r13,r0,hi16(_tree_code_length)
	ld.bu	 r12,r20,8
	ld	 r13,r13,lo16(_tree_code_length)
	ld	 r21,r13[r12]
	cmp	 r13,r22,r21
	bb0.n	 lt,r13,@L4263
	or	 r24,r0,0
	mask	 r12,r21,3
	bcnd.n	 eq0,r12,@L4299
	or	 r25,r0,r20
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L7785
	cmp	 r13,r12,2
	bb0	 gt,r13,@L7786
	ld	 r3,r20,16
	bcnd	 eq0,r3,@L7788
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L4257
	or	 r2,r0,0
@L7788:
	addu	 r25,r20,4
	or	 r24,r0,1
@L7786:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7791
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L4257
	or	 r2,r0,0
@L7791:
	addu	 r25,r25,4
	addu	 r24,r24,1
@L7785:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7794
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L4257
	or	 r2,r0,0
@L7794:
	addu	 r24,r24,1
	cmp	 r13,r24,r21
	bb0.n	 lt,r13,@L4263
	addu	 r25,r25,4
@L4299:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7797
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L4257
	or	 r2,r0,0
@L7797:
	ld	 r3,r25,20
	bcnd	 eq0,r3,@L7800
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L4257
	or	 r2,r0,0
@L7800:
	ld	 r3,r25,24
	bcnd	 eq0,r3,@L7803
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L4257
	or	 r2,r0,0
@L7803:
	ld	 r3,r25,28
	bcnd	 eq0,r3,@L7806
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L4257
	or	 r2,r0,0
@L7806:
	addu	 r24,r24,4
	cmp	 r13,r24,r21
	bb1.n	 lt,r13,@L4299
	addu	 r25,r25,16
@L4263:
	bcnd.n	 eq0,r22,@L4257
	or	 r2,r0,1
@L7203:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L8017
	or	 r2,r0,r23
	ld	 r22,r22,4
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L8018
	or	 r3,r0,r22
	ld	 r13,r22,4
	cmp	 r13,r13,63
	bb1	 le,r13,@L7823
@L8017:
	or	 r3,r0,r22
@L8018:
	bsr.n	 _rtx_equal_p
	or	 r25,r0,0
	bcnd	 ne0,r2,@L4307
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1	 ne,r13,@L4308
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,55
	bb1	 ne,r13,@L4308
	ld	 r13,r20,8
	bb0.n	 (31-13),r13,@L4257
	or	 r2,r0,r25
@L4308:
	or	 r25,r0,1
@L4307:
@L8015:
	br.n	 @L4257
	or	 r2,r0,r25
	align	 4
@L4304:
	or	 r2,r0,1
@L4257:
	bcnd	 ne0,r2,@L4255
@L4256:
	cmp	 r13,r14,16
	bb0	 ne,r13,@L4309
	ld	 r13,r20,8
	bb1.n	 (31-11),r13,@L4309
	or	 r2,r0,r14
	bsr.n	 _gen_reg_rtx
	addu	 r1,r1,@L8311
@L8312:
	align	 4
@L4309:
	bsr.n	 _int_size_in_bytes
	ld	 r2,r31,172
	or	 r3,r0,r2
	or	 r2,r0,r14
	bsr.n	 _assign_stack_temp
	or	 r4,r0,0
	bcnd	 eq0,r17,@L4311
	ld	 r12,r0,r2
	ld	 r13,r0,r17
	and	 r12,r12,0xfff7
	mask	 r13,r13,8
	or	 r12,r12,r13
	st	 r12,r0,r2
@L4311:
	or	 r17,r0,r2
@L4255:
	ld	 r18,r20,4
	ld.bu	 r12,r18,8
	subu	 r13,r12,21
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L4313
	mask	 r13,r12,0xff
	cmp	 r13,r13,22
	bb0	 ne,r13,@L4377
	ld.hu	 r13,r0,r17
	cmp	 r13,r13,51
	bb1	 ne,r13,@L4316
	ld	 r13,r20,8
	bb0.n	 (31-18),r13,@L4316
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r24,r13,lo16(_const0_rtx)
	ld.hu	 r11,r0,r24
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r22,r17,2
	or	 r13,r13,lo16(_mode_class)
	cmp	 r12,r11,59
	ld	 r19,r13[r22]
	bb0.n	 ne,r12,@L4328
	or	 r21,r0,r17
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L8019
	cmp	 r13,r11,63
	ld.bu	 r13,r24,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L4329
	ld	 r23,r24,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L4329
	ld	 r13,r23,4
	st	 r13,r24,4
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L4332
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r24,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r24
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	br.n	 @L4327
	or	 r2,r0,r25
	align	 4
@L4329:
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L4331
	cmp	 r13,r11,63
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L4332
	st	 r2,r24,4
	align	 4
@L4331:
@L8019:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L4332
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,4
	ld	 r2,r24,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,8
@L4332:
	br.n	 @L4327
	or	 r2,r0,r24
	align	 4
@L4328:
	ld	 r13,r24,8
	bcnd	 ne0,r13,@L4334
	ld	 r2,r24,4
	br.n	 @L8020
	cmp	 r13,r22,16
	align	 4
@L4334:
	ld	 r2,r24,12
	bcnd.n	 ne0,r2,@L8020
	cmp	 r13,r22,16
	ld	 r13,r24,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r24,4
	bsr.n	 _gen_move_insn
	st	 r2,r24,12
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	ld	 r2,r24,12
@L4327:
	cmp	 r13,r22,16
@L8020:
	bb0.n	 ne,r13,@L4337
	or	 r24,r0,r2
	ld.bu	 r13,r24,2
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L4336
	ld.bu	 r13,r24,2
	bcnd	 eq0,r13,@L4336
@L4337:
	bsr	 _abort
	align	 4
@L4336:
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4339
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4339
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L4338
@L4339:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,47
	bb1	 ne,r13,@L4338
	ld.bu	 r13,r24,2
	bcnd.n	 eq0,r13,@L4338
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
@L4338:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,55
	bb1	 ne,r13,@L4340
	ld.bu	 r2,r21,2
	bsr.n	 _memory_address_p
	ld	 r3,r21,4
	bcnd.n	 ne0,r2,@L8021
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bcnd.n	 eq0,r2,@L4341
	or.u	 r13,r0,hi16(_flag_force_addr)
@L8021:
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L4340
	ld	 r13,r21,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4341
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4341
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L4340
@L4341:
	ld	 r4,r21,4
	or	 r2,r0,r21
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r21,r0,r2
@L4340:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8022
	cmp	 r13,r22,16
	ld.bu	 r2,r24,2
	bsr.n	 _memory_address_p
	ld	 r3,r24,4
	bcnd.n	 eq0,r2,@L4344
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L4343
	ld	 r13,r24,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4344
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4344
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L8022
	cmp	 r13,r22,16
@L4344:
	ld	 r4,r24,4
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L4343:
	cmp	 r13,r22,16
@L8022:
	bb1.n	 ne,r13,@L4345
	subu	 r13,r19,5
	bsr	 _abort
	align	 4
@L4345:
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L4346
	or.u	 r13,r0,hi16(_mode_unit_size)
	or	 r13,r13,lo16(_mode_unit_size)
	ld	 r12,r13[r22]
	or	 r3,r0,2
	cmp	 r13,r19,5
	bb1.n	 ne,r13,@L4347
	mak	 r2,r12,0<3>
	or	 r3,r0,1
@L4347:
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	st	 r2,r31,196
@L4346:
	or.u	 r23,r0,hi16(_mov_optab)
	ld	 r11,r23,lo16(_mov_optab)
	lda.d	 r13,r11[r22]
	ld	 r12,r13,4
	cmp	 r13,r12,210
	bb0.n	 ne,r13,@L4349
	or.u	 r13,r0,hi16(_insn_gen_function)
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r2,r0,r21
	ld	 r13,r13[r12]
	or	 r3,r0,r24
	jsr.n	 r13
	addu	 r1,r1,@L8313
@L8314:
	align	 4
@L4349:
	subu	 r13,r19,5
	ld	 r15,r31,196
	cmp	 r13,r13,1
	extu	 r13,r13,1<ls>
	cmp	 r12,r15,16
	extu	 r12,r12,1<ne>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L4351
	mak	 r25,r15,0<3>
	addu	 r13,r11,r25
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L4351
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bsr.n	 _get_last_insn
	or	 r22,r0,r2
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L4352
	or	 r16,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r21
	bsr	 _emit_insn
@L4352:
	ld	 r13,r23,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	addu	 r13,r13,r25
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L4353
	or	 r19,r12,lo16(_insn_gen_function)
	ld	 r3,r31,196
	or	 r2,r0,r21
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8315
@L8316:
	align	 4
@L4353:
	ld	 r2,r31,196
	bsr.n	 _gen_highpart
	or	 r3,r0,r21
@L7825:
	or	 r25,r0,r2
	ld	 r2,r31,196
	bsr.n	 _gen_highpart
	or	 r3,r0,r24
	or	 r3,r0,r2
	ld	 r13,r19[r23]
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r15,r31,196
	ld	 r13,r13,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	lda.d	 r13,r13[r15]
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L4355
	or	 r19,r12,lo16(_insn_gen_function)
	ld	 r3,r31,196
	or	 r2,r0,r21
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8317
@L8318:
	align	 4
@L4355:
	ld	 r2,r31,196
	bsr.n	 _gen_lowpart
	or	 r3,r0,r21
@L7826:
	or	 r25,r0,r2
	ld	 r2,r31,196
	bsr.n	 _gen_lowpart
	or	 r3,r0,r24
	ld	 r13,r19[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	bcnd	 eq0,r16,@L4358
	ld	 r24,r16,12
	br	 @L4359
	align	 4
@L4358:
	bsr	 _get_insns
	or	 r24,r0,r2
@L4359:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	st	 r2,r24,28
	bsr.n	 _get_last_insn
	addu	 r1,r1,@L8319
@L8320:
	align	 4
@L4351:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r23,r13,lo16(_mode_size)
	ld	 r13,r23[r22]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L4361
	bsr.n	 _get_last_insn
	or	 r25,r0,0
	or	 r19,r0,r2
	or	 r16,r0,r23
@L4362:
	ld	 r12,r16[r22]
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L4366
	addu	 r13,r12,6
@L4366:
	ext	 r13,r13,0<2>
	cmp	 r13,r25,r13
	bb0.n	 lt,r13,@L4363
	or	 r2,r0,r21
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r23,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r3,r0,r2
	bcnd.n	 ne0,r3,@L8023
	cmp	 r13,r23,0
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4368
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4368
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L4367
	or	 r2,r0,r24
@L4368:
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r3,r0,r25
	or	 r4,r0,1
	or	 r5,r0,r22
	bsr.n	 _operand_subword
	addu	 r1,r1,@L8321
@L8322:
	align	 4
@L4367:
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r22
@L7827:
	or	 r3,r0,r2
	cmp	 r13,r23,0
@L8023:
	cmp	 r12,r3,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L4371
	or	 r2,r0,r23
	bsr	 _abort
	align	 4
@L4371:
	addu	 r25,r25,1
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L8323
@L8324:
	align	 4
@L4363:
	bcnd	 eq0,r19,@L4373
	ld	 r24,r19,12
	br	 @L4374
	align	 4
@L4373:
	bsr	 _get_insns
	or	 r24,r0,r2
@L4374:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	br.n	 @L4315
	st	 r2,r24,28
	align	 4
@L4361:
	bsr	 _abort
	align	 4
@L4316:
	bsr.n	 _list_length
	ld	 r2,r20,20
	or	 r25,r0,r2
	bsr.n	 _list_length
	ld	 r2,r18,12
	cmp	 r25,r25,r2
	bb0.n	 ne,r25,@L8024
	or	 r2,r0,42
	bsr.n	 _int_size_in_bytes
	or	 r2,r0,r18
	ld.bu	 r13,r17,2
	cmp	 r13,r13,16
	bb1.n	 ne,r13,@L4379
	or	 r4,r0,r2
	or	 r2,r0,46
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	ld	 r6,r17,4
	st	 r2,r31,32
	or	 r3,r0,0
	or	 r4,r0,0
	or.u	 r13,r0,hi16(_memset_libfunc)
	or	 r5,r0,3
	ld	 r2,r13,lo16(_memset_libfunc)
	or.u	 r13,r0,hi16(_const0_rtx)
	or	 r7,r0,4
	ld	 r8,r13,lo16(_const0_rtx)
	or	 r9,r0,4
	or	 r13,r0,4
	st	 r13,r31,36
	bsr.n	 _emit_library_call
	addu	 r1,r1,@L8325
@L8326:
	align	 4
@L4379:
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r3,r13,lo16(_const0_rtx)
	or	 r2,r0,r17
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L8327
@L8328:
	align	 4
@L4377:
	or	 r2,r0,42
@L8024:
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r17
@L7824:
	bsr	 _emit_insn
@L4315:
	ld	 r23,r20,20
	bcnd.n	 eq0,r23,@L7200
	or	 r2,r0,r17
@L4385:
	ld	 r11,r23,12
	bcnd	 eq0,r11,@L4384
	ld	 r13,r11,28
	ld	 r10,r11,40
	ld.bu	 r24,r11,28
	ld	 r11,r11,20
	mask.u	 r13,r13,0x8
	ld.bu	 r12,r10,8
	cmp	 r13,r13,0
	ld	 r22,r11,12
	ext	 r13,r13,1<eq>
	cmp	 r12,r12,25
	bb0.n	 ne,r12,@L4388
	and	 r24,r24,r13
	bsr	 _abort
	align	 4
@L4388:
	or	 r2,r0,r18
	bsr.n	 _int_size_in_bytes
	ld	 r25,r10,12
	ld	 r6,r23,16
	ld	 r9,r18,28
	st	 r2,r31,32
	or	 r2,r0,r17
	or	 r3,r0,r22
	or	 r5,r0,r24
	or	 r7,r0,0
	or	 r8,r0,0
	or	 r4,r0,r25
	bsr.n	 _store_field
	extu	 r9,r9,0<3>
@L4384:
	ld	 r23,r0,r23
	bcnd.n	 ne0,r23,@L4385
	or	 r2,r0,r17
	br	 @L7200
	align	 4
@L4313:
	cmp	 r13,r13,18
	bb1	 ne,r13,@L4391
	ld	 r13,r18,12
	ld	 r2,r20,20
	ld	 r12,r13,52
	ld	 r13,r13,56
	ld	 r24,r12,12
	ld	 r25,r13,12
	bsr.n	 _list_length
	ld	 r19,r18,4
	subu	 r25,r25,r24
	addu	 r4,r25,1
	cmp	 r2,r2,r4
	bb0	 ge,r2,@L4393
	ld.hu	 r13,r0,r17
	cmp	 r13,r13,51
	bb1	 ne,r13,@L4392
	ld	 r13,r20,8
	bb0.n	 (31-18),r13,@L8025
	or	 r2,r0,42
@L4393:
	ld.bu	 r13,r17,2
	cmp	 r13,r13,16
	bb1.n	 ne,r13,@L4395
	or.u	 r13,r0,hi16(_const0_rtx)
	or	 r2,r0,46
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	ld	 r6,r17,4
	st	 r2,r31,32
	or	 r3,r0,0
	or	 r4,r0,0
	or.u	 r13,r0,hi16(_memset_libfunc)
	or	 r5,r0,3
	ld	 r2,r13,lo16(_memset_libfunc)
	or.u	 r13,r0,hi16(_const0_rtx)
	or	 r7,r0,4
	ld	 r8,r13,lo16(_const0_rtx)
	or	 r9,r0,4
	or	 r13,r0,4
	st	 r13,r31,36
	bsr.n	 _emit_library_call
	addu	 r1,r1,@L8329
@L8330:
	align	 4
@L4395:
	ld	 r3,r13,lo16(_const0_rtx)
	or	 r2,r0,r17
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L8331
@L8332:
	align	 4
@L4392:
	or	 r2,r0,42
@L8025:
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r17
	bsr	 _emit_insn
@L4397:
	ld	 r22,r20,20
	bcnd.n	 eq0,r22,@L8004
	or	 r21,r0,0
	or.u	 r13,r0,hi16(_mode_size)
	or	 r20,r13,lo16(_mode_size)
@L4401:
	ld	 r13,r19,16
	ld.bu	 r23,r19,24
	ld	 r24,r13,12
	ld	 r25,r20[r23]
	or	 r2,r0,r18
	mul	 r24,r21,r24
	bsr.n	 _int_size_in_bytes
	mak	 r25,r25,0<3>
	ld	 r6,r22,16
	ld	 r9,r18,28
	st	 r2,r31,32
	or	 r2,r0,r17
	or	 r5,r0,r23
	or	 r7,r0,0
	or	 r8,r0,0
	or	 r3,r0,r25
	extu	 r9,r9,0<3>
	bsr.n	 _store_field
	or	 r4,r0,r24
	ld	 r22,r0,r22
	bcnd.n	 ne0,r22,@L4401
	addu	 r21,r21,1
	br.n	 @L7200
	or	 r2,r0,r17
	align	 4
@L4391:
	bsr	 _abort
	align	 4
@L4404:
	ld	 r25,r20,16
	ld.bu	 r13,r25,8
	cmp	 r13,r13,104
	bb1.n	 ne,r13,@L8026
	or	 r2,r0,r25
	ld	 r13,r25,24
	bcnd.n	 ne0,r13,@L8027
	or	 r3,r0,0
	ld	 r2,r25,16
	ld.bu	 r13,r2,8
	bcnd	 eq0,r13,@L4405
	ld	 r13,r25,4
	ld.bu	 r13,r13,24
	cmp	 r13,r13,4
	bb1	 ne,r13,@L4405
	ld	 r13,r2,4
	ld.bu	 r13,r13,24
	cmp	 r13,r13,4
	bb1	 ne,r13,@L4405
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,1
	or	 r19,r0,r2
	or	 r2,r0,r14
	bsr.n	 _memory_address
	or	 r3,r0,r19
	bsr	 _copy_all_regs
	or	 r18,r0,r2
	br.n	 @L4406
	st	 r18,r25,24
	align	 4
@L4405:
	or	 r2,r0,r25
@L8026:
	or	 r3,r0,0
@L8027:
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,1
	or	 r18,r0,r2
	or	 r2,r0,r14
	bsr.n	 _memory_address
	or	 r3,r0,r18
	or	 r18,r0,r2
@L4406:
	or	 r2,r0,55
	or	 r3,r0,r14
	bsr.n	 _gen_rtx
	or	 r4,r0,r18
	ld	 r11,r20,16
	ld.bu	 r12,r11,8
	cmp	 r13,r12,53
	bb0.n	 ne,r13,@L8005
	or	 r19,r0,r2
	cmp	 r13,r12,104
	bb1	 ne,r13,@L4409
	ld	 r13,r11,16
	ld.bu	 r13,r13,8
	cmp	 r13,r13,53
	bb0	 ne,r13,@L8005
@L4409:
	ld	 r13,r20,4
	ld.bu	 r11,r13,8
	cmp	 r13,r11,18
	cmp	 r12,r11,21
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L8005
	cmp	 r13,r11,22
	bb0	 ne,r13,@L8005
	ld.bu	 r13,r25,8
	cmp	 r13,r13,106
	bb1	 ne,r13,@L8003
	ld	 r2,r25,16
	bcnd	 eq0,r2,@L8003
	ld	 r13,r2,4
	ld.bu	 r11,r13,8
	cmp	 r13,r11,18
	cmp	 r12,r11,21
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L8005
	cmp	 r13,r11,22
	bb0	 ne,r13,@L8005
	br	 @L8003
	align	 4
@L4412:
	ld	 r12,r20,20
	ld.bu	 r13,r12,8
	cmp	 r13,r13,25
	bb1	 ne,r13,@L4414
	ld	 r15,r31,172
	ld	 r13,r15,16
	ld.bu	 r13,r13,8
	cmp	 r13,r13,25
	bb0	 ne,r13,@L4413
@L4414:
	ld	 r4,r20,8
	extu	 r3,r4,1<18>
	ld	 r2,r31,172
	bsr.n	 _build_type_variant
	extu	 r4,r4,1<19>
	bsr.n	 _build_pointer_type
	or	 r25,r0,r2
	or	 r3,r0,r2
	ld	 r4,r20,16
	bsr.n	 _build1
	or	 r2,r0,106
	ld	 r23,r20,20
	ld	 r13,r23,4
	ld.bu	 r13,r13,25
	cmp	 r13,r13,32
	bb0.n	 ne,r13,@L4415
	or	 r22,r0,r2
	or	 r2,r0,32
	bsr.n	 _type_for_size
	or	 r3,r0,0
	bsr.n	 _convert
	or	 r3,r0,r23
	or	 r23,r0,r2
@L4415:
	or.u	 r24,r0,0xff7f
	or	 r24,r24,0xffff
	ld	 r13,r22,8
	and	 r13,r13,r24
	st	 r13,r22,8
	ld	 r2,r31,172
	bsr.n	 _size_in_bytes
	ld	 r25,r25,32
	or	 r5,r0,r2
	or	 r2,r0,55
	or	 r4,r0,r23
	bsr.n	 _build
	or	 r3,r0,r25
	bsr	 _fold
	or	 r5,r0,r2
	or	 r2,r0,53
	or	 r3,r0,r25
	bsr.n	 _build
	or	 r4,r0,r22
	bsr	 _fold
	or	 r4,r0,r2
	ld	 r3,r31,172
	bsr.n	 _build1
	or	 r2,r0,39
	ld	 r12,r2,8
	ld	 r13,r20,8
	and	 r12,r12,r24
	mask.u	 r13,r13,0x80
	or	 r12,r12,r13
	st	 r12,r2,8
	ld	 r13,r20,8
	and.u	 r12,r12,0xfff7
	mask.u	 r13,r13,0x8
	or	 r12,r12,r13
	st	 r12,r2,8
	and.u	 r11,r12,0xfffb
	ld	 r13,r20,8
	or	 r3,r0,r17
	ld	 r4,r31,164
	mask.u	 r13,r13,0x4
	or	 r5,r0,r19
	or	 r11,r11,r13
	st	 r11,r2,8
	bsr	 _expand_expr
	br	 @L7200
	align	 4
@L4413:
	ld	 r25,r20,16
	ld.bu	 r13,r25,8
	cmp	 r13,r13,28
	bb1	 ne,r13,@L4416
	ld	 r13,r12,16
	bcnd	 ne0,r13,@L4416
	ld	 r12,r12,12
	ld	 r13,r25,16
	cmp	 r13,r12,r13
	bb1	 ge,r13,@L4416
	ld	 r13,r25,4
	or.u	 r24,r0,hi16(_integer_type_node)
	ld	 r11,r13,4
	ld	 r13,r24,lo16(_integer_type_node)
	cmp	 r13,r11,r13
	bb1.n	 ne,r13,@L4417
	or.u	 r13,r0,hi16(_char_type_node)
	ld	 r13,r25,20
	ld	 r2,r13[r12]
	bsr.n	 _build_int_2_wide
	or	 r3,r0,0
	or	 r20,r0,r2
	ld	 r4,r31,164
	or	 r3,r0,r17
	ld	 r13,r24,lo16(_integer_type_node)
	or	 r5,r0,r19
	st	 r13,r2,4
	bsr	 _expand_expr
	br	 @L7200
	align	 4
@L4417:
	ld	 r13,r13,lo16(_char_type_node)
	cmp	 r13,r11,r13
	bb1	 ne,r13,@L4416
	ld	 r13,r25,20
	ld.b	 r2,r13,r12
	bsr.n	 _build_int_2_wide
	or	 r3,r0,0
	ld	 r13,r24,lo16(_integer_type_node)
	or	 r20,r0,r2
	st	 r13,r20,4
	ld	 r13,r25,4
	ld	 r2,r13,4
	or	 r3,r0,r20
	bsr	 _convert
	br	 @L7828
	align	 4
@L4416:
	ld	 r11,r20,16
	ld	 r10,r11,8
	or.u	 r12,r0,0x2b00
	mask.u	 r13,r10,0xff80
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L4419
	mask.u	 r13,r10,0x84
	bsr.n	 _fold
	ld	 r2,r20,20
	ld.bu	 r13,r2,8
	cmp	 r13,r13,25
	bb1	 ne,r13,@L4559
	ld	 r13,r2,16
	bcnd	 ne0,r13,@L4559
	ld	 r13,r20,16
	ld	 r13,r13,20
	ld	 r2,r2,12
	bcnd.n	 eq0,r13,@L4559
	addu	 r2,r2,1
	subu	 r2,r2,1
@L8028:
	bcnd	 eq0,r2,@L4422
	ld	 r13,r0,r13
	bcnd.n	 ne0,r13,@L8028
	subu	 r2,r2,1
	addu	 r2,r2,1
@L4422:
	bcnd	 eq0,r13,@L4559
	ld	 r2,r13,16
	bsr	 _fold
	br	 @L7828
	align	 4
@L4419:
	or.u	 r12,r0,0x4
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L4559
	ld	 r13,r11,4
	ld.bu	 r13,r13,8
	cmp	 r13,r13,18
	bb1	 ne,r13,@L4559
	ld.bu	 r13,r11,8
	cmp	 r13,r13,33
	bb1	 ne,r13,@L4559
	ld	 r12,r11,48
	bcnd.n	 eq0,r12,@L4559
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd	 le0,r13,@L4559
	ld.bu	 r13,r12,8
	bcnd	 eq0,r13,@L4559
	bsr.n	 _fold
	ld	 r2,r20,20
	ld.bu	 r13,r2,8
	cmp	 r13,r13,25
	bb1	 ne,r13,@L4559
	ld	 r13,r2,16
	bcnd	 ne0,r13,@L4559
	ld	 r13,r20,16
	ld	 r12,r13,48
	ld.bu	 r10,r12,8
	cmp	 r13,r10,43
	ld	 r11,r2,12
	bb1	 ne,r13,@L4430
	ld	 r12,r12,20
	bcnd.n	 eq0,r12,@L4559
	addu	 r2,r11,1
	subu	 r2,r2,1
@L8029:
	bcnd	 eq0,r2,@L4432
	ld	 r12,r0,r12
	bcnd.n	 ne0,r12,@L8029
	subu	 r2,r2,1
	addu	 r2,r2,1
@L4432:
	bcnd	 eq0,r12,@L4559
	ld	 r2,r12,16
	bsr	 _fold
	br	 @L7828
	align	 4
@L4430:
	cmp	 r13,r10,28
	bb1	 ne,r13,@L4559
	ld	 r13,r12,16
	cmp	 r13,r11,r13
	bb1	 ge,r13,@L4559
	ld	 r13,r12,20
	or	 r2,r0,46
	ld.b	 r4,r13,r11
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	or	 r19,r0,r2
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	ld	 r11,r0,r19
	and	 r13,r11,0x8
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L4440
	or	 r25,r0,r19
	ld	 r13,r19,4
	or.u	 r12,r0,hi16(_mode_size)
	ld.bu	 r13,r13,2
	or	 r12,r12,lo16(_mode_size)
	ld	 r13,r12[r13]
	ld	 r12,r12[r14]
	cmp	 r13,r13,r12
	bb0	 ge,r13,@L4440
	bb1.n	 (31-26),r11,@L4440
	or	 r2,r0,r14
	bsr.n	 _gen_lowpart
	or	 r3,r0,r19
	or	 r25,r0,r2
@L4440:
	ld	 r9,r0,r25
	extu	 r13,r9,8<8>
	cmp	 r13,r14,r13
	bb1	 ne,r13,@L4442
@L7862:
	br.n	 @L7200
	or	 r2,r0,r25
	align	 4
@L4442:
	ld.hu	 r10,r0,r25
	cmp	 r13,r10,46
	bb0.n	 ne,r13,@L4444
	or.u	 r13,r0,hi16(_mode_class)
	or	 r12,r13,lo16(_mode_class)
	ld	 r13,r12[r14]
	cmp	 r13,r13,1
	bb1	 ne,r13,@L4443
	ld.bu	 r11,r25,2
	ld	 r13,r12[r11]
	cmp	 r13,r13,1
	bb1.n	 ne,r13,@L4443
	cmp	 r13,r10,47
	bb0.n	 ne,r13,@L4444
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r14]
	ld	 r13,r13[r11]
	cmp	 r12,r12,r13
	bb1.n	 gt,r12,@L4443
	and	 r13,r9,0x10
	or.u	 r12,r0,0x37
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L8030
	cmp	 r13,r10,51
	or.u	 r13,r0,hi16(_direct_load)
	or	 r13,r13,lo16(_direct_load)
	ld.b	 r13,r14,r13
	bcnd.n	 ne0,r13,@L8031
	or	 r2,r0,r14
	cmp	 r13,r10,51
@L8030:
	bb1	 ne,r13,@L4443
@L4444:
	or	 r2,r0,r14
@L8031:
	or	 r3,r0,r25
@L8091:
	bsr	 _gen_lowpart
	br	 @L7200
	align	 4
@L4443:
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,r14
	or	 r19,r0,r2
	or	 r23,r0,r25
	ld.bu	 r21,r19,2
	ld.bu	 r22,r23,2
	or.u	 r12,r0,hi16(_mode_class)
	ld.hu	 r11,r0,r19
	or	 r12,r12,lo16(_mode_class)
	ld	 r13,r12[r21]
	or	 r16,r0,99
	ld	 r12,r12[r22]
	or	 r20,r0,r19
	cmp	 r13,r13,2
	cmp	 r12,r12,2
	extu	 r18,r13,1<eq>
	cmp	 r13,r11,59
	bb0.n	 ne,r13,@L4450
	extu	 r17,r12,1<eq>
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L4453
	cmp	 r13,r11,63
	ld	 r2,r19,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L4454
	st	 r2,r19,4
	align	 4
@L4453:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L4454
	ld	 r2,r19,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r19,4
	ld	 r2,r19,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r19,8
@L4454:
	br.n	 @L4449
	or	 r2,r0,r20
	align	 4
@L4450:
	ld	 r13,r19,8
	bcnd	 ne0,r13,@L4456
	ld	 r2,r19,4
	br	 @L4449
	align	 4
@L4456:
	ld	 r2,r19,12
	bcnd	 ne0,r2,@L4449
	ld	 r13,r19,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r19,4
	bsr.n	 _gen_move_insn
	st	 r2,r19,12
	bsr.n	 _emit_insn_before
	ld	 r3,r19,8
	ld	 r2,r19,12
@L4449:
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L4459
	or	 r20,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L8032
	cmp	 r13,r12,63
	ld.bu	 r13,r23,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L4460
	ld	 r24,r23,4
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L4460
	ld	 r13,r24,4
	st	 r13,r23,4
	ld	 r13,r24,8
	bcnd	 eq0,r13,@L4463
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r23,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r23
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	br.n	 @L4458
	or	 r2,r0,r25
	align	 4
@L4460:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L4462
	cmp	 r13,r12,63
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L4463
	st	 r2,r23,4
	align	 4
@L4462:
@L8032:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L4463
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,4
	ld	 r2,r23,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,8
@L4463:
	br.n	 @L4458
	or	 r2,r0,r23
	align	 4
@L4459:
	ld	 r13,r23,8
	bcnd	 ne0,r13,@L4465
	ld	 r2,r23,4
	br.n	 @L8033
	cmp	 r13,r18,r17
	align	 4
@L4465:
	ld	 r2,r23,12
	bcnd.n	 ne0,r2,@L8033
	cmp	 r13,r18,r17
	ld	 r13,r23,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r23,4
	bsr.n	 _gen_move_insn
	st	 r2,r23,12
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	ld	 r2,r23,12
@L4458:
	cmp	 r13,r18,r17
@L8033:
	bb0.n	 ne,r13,@L4467
	or	 r23,r0,r2
	bsr	 _abort
	align	 4
@L4467:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	ld	 r11,r0,r23
	and	 r13,r11,0x8
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L8034
	ld	 r13,r23,4
	or.u	 r12,r0,hi16(_mode_size)
	ld.bu	 r13,r13,2
	or	 r12,r12,lo16(_mode_size)
	ld	 r13,r12[r13]
	ld	 r12,r12[r21]
	cmp	 r13,r13,r12
	bb0	 ge,r13,@L4468
	bb1.n	 (31-26),r11,@L4468
	or	 r2,r0,r21
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	or	 r22,r0,r21
	or	 r23,r0,r2
@L4468:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
@L8034:
	ld	 r13,r0,r20
	and	 r13,r13,0x8
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L4469
	cmp	 r13,r21,r22
	bsr	 _abort
	align	 4
@L4469:
	bb0.n	 ne,r13,@L8035
	or	 r2,r0,r20
	bcnd	 ne0,r22,@L4470
	ld.hu	 r12,r0,r23
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L8035
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L8035
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L4470
@L8035:
	or	 r3,r0,r23
	bsr	 _emit_move_insn
	br	 @L7199
	align	 4
@L4470:
	bcnd.n	 eq0,r18,@L4472
	cmp	 r5,r22,8
	cmp	 r13,r21,9
	extu	 r11,r5,1<eq>
	extu	 r7,r13,1<eq>
	and	 r13,r11,r7
	bcnd.n	 ne0,r13,@L7829
	or	 r2,r0,108
	cmp	 r6,r21,11
	extu	 r12,r6,1<eq>
	and	 r13,r11,r12
	bcnd.n	 ne0,r13,@L7829
	or	 r2,r0,109
	cmp	 r8,r22,9
	extu	 r9,r8,1<eq>
	and	 r13,r9,r12
	bcnd.n	 eq0,r13,@L4475
	cmp	 r4,r21,11
	br.n	 @L7829
	or	 r2,r0,110
	align	 4
@L4475:
	cmp	 r10,r21,8
	extu	 r11,r10,1<eq>
	and	 r13,r9,r11
	bcnd.n	 ne0,r13,@L7829
	or	 r2,r0,111
	cmp	 r9,r22,11
	extu	 r12,r9,1<eq>
	and	 r13,r12,r11
	bcnd.n	 ne0,r13,@L7829
	or	 r2,r0,112
	and	 r13,r12,r7
	bcnd.n	 eq0,r13,@L4478
	cmp	 r12,r21,9
	or	 r2,r0,113
@L7829:
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr	 _emit_unop_insn
	br	 @L7199
	align	 4
@L4478:
	bb0.n	 ne,r8,@L4488
	or	 r2,r0,0
	bb0.n	 ls,r8,@L4510
	cmp	 r13,r22,10
	bb0.n	 ne,r5,@L4480
	cmp	 r13,r21,10
	br	 @L4479
	align	 4
@L4510:
	bb0	 ne,r13,@L4496
	bb0	 ne,r9,@L4502
	br	 @L4479
	align	 4
@L4480:
	bb0	 ne,r13,@L4483
	bb0	 ls,r13,@L4487
	bb0.n	 ne,r12,@L4482
	or.u	 r13,r0,hi16(_extendsfdf2_libfunc)
	br	 @L4479
	align	 4
@L4487:
	bb0.n	 ne,r4,@L4484
	or.u	 r13,r0,hi16(_extendsftf2_libfunc)
	br	 @L4479
	align	 4
@L4482:
	ld	 r2,r13,lo16(_extendsfdf2_libfunc)
	br	 @L4479
	align	 4
@L4483:
	or.u	 r13,r0,hi16(_extendsfxf2_libfunc)
	ld	 r2,r13,lo16(_extendsfxf2_libfunc)
	br	 @L4479
	align	 4
@L4484:
	ld	 r2,r13,lo16(_extendsftf2_libfunc)
	br	 @L4479
	align	 4
@L4488:
	cmp	 r13,r21,10
	bb0	 ne,r13,@L4491
	bb0	 ls,r13,@L4495
	bb0.n	 ne,r10,@L4490
	or.u	 r13,r0,hi16(_truncdfsf2_libfunc)
	br	 @L4479
	align	 4
@L4495:
	bb0.n	 ne,r6,@L4492
	or.u	 r13,r0,hi16(_extenddftf2_libfunc)
	br	 @L4479
	align	 4
@L4490:
	ld	 r2,r13,lo16(_truncdfsf2_libfunc)
	br	 @L4479
	align	 4
@L4491:
	or.u	 r13,r0,hi16(_extenddfxf2_libfunc)
	ld	 r2,r13,lo16(_extenddfxf2_libfunc)
	br	 @L4479
	align	 4
@L4492:
	ld	 r2,r13,lo16(_extenddftf2_libfunc)
	br	 @L4479
	align	 4
@L4496:
	bb0.n	 ne,r10,@L4498
	or.u	 r13,r0,hi16(_truncxfsf2_libfunc)
	bb0.n	 ne,r12,@L4499
	or.u	 r13,r0,hi16(_truncxfdf2_libfunc)
	br	 @L4479
	align	 4
@L4498:
	ld	 r2,r13,lo16(_truncxfsf2_libfunc)
	br	 @L4479
	align	 4
@L4499:
	ld	 r2,r13,lo16(_truncxfdf2_libfunc)
	br	 @L4479
	align	 4
@L4502:
	bb0.n	 ne,r10,@L4504
	or.u	 r13,r0,hi16(_trunctfsf2_libfunc)
	bb0.n	 ne,r12,@L4505
	or.u	 r13,r0,hi16(_trunctfdf2_libfunc)
	br	 @L4479
	align	 4
@L4504:
	ld	 r2,r13,lo16(_trunctfsf2_libfunc)
	br	 @L4479
	align	 4
@L4505:
	ld	 r2,r13,lo16(_trunctfdf2_libfunc)
@L4479:
	bcnd.n	 ne0,r2,@L4511
	or	 r3,r0,1
	bsr	 _abort
	align	 4
@L4511:
	or	 r4,r0,r21
	or	 r5,r0,1
	or	 r6,r0,r23
	bsr.n	 _emit_library_call
	or	 r7,r0,r22
	or	 r2,r0,r21
	bsr.n	 _hard_libcall_value
	addu	 r1,r1,@L8333
@L8334:
	align	 4
@L4472:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r24,r13,lo16(_mode_size)
	ld	 r13,r24[r22]
	ld	 r12,r24[r21]
	mak	 r13,r13,0<3>
	mak	 r11,r12,0<3>
	cmp	 r13,r13,r11
	bb1.n	 ge,r13,@L8036
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r11,32
	bb0.n	 gt,r13,@L4512
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L4513
	addu	 r13,r12,6
@L4513:
	or	 r2,r0,r21
	or	 r3,r0,r22
	or	 r4,r0,0
	bsr.n	 _can_extend_p
	ext	 r18,r13,0<2>
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb1.n	 ne,r13,@L8037
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r24[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L4516
	or.u	 r24,r0,hi16(_word_mode)
	or	 r2,r0,r21
	ld	 r3,r24,lo16(_word_mode)
	bsr.n	 _can_extend_p
	or	 r4,r0,0
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0	 ne,r13,@L4516
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r3,r0,r23
	bsr.n	 _convert_move
	or	 r4,r0,0
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r4,r0,r2
	or	 r2,r0,r25
	br.n	 @L7831
	or	 r3,r0,r20
	align	 4
@L4516:
	bsr	 _start_sequence
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L4518
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r22,r13,lo16(_word_mode)
@L4518:
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,0
	or	 r24,r0,r2
	or	 r2,r0,r22
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
	or.u	 r25,r0,hi16(_mode_size)
	or	 r25,r25,lo16(_mode_size)
	ld	 r2,r25[r22]
	mak	 r2,r2,0<3>
	bsr.n	 _size_int
	subu	 r2,r2,1
	or	 r5,r0,r2
	or	 r2,r0,78
	or	 r3,r0,r22
	or	 r4,r0,r24
	or	 r6,r0,0
	bsr.n	 _expand_shift
	or	 r7,r0,0
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_word_mode)
	or	 r4,r0,1
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _convert_to_mode
	or	 r3,r0,r24
	ld	 r3,r25[r22]
	bcnd.n	 ge0,r3,@L4524
	or	 r24,r0,r2
	addu	 r3,r3,3
@L4524:
	ext	 r22,r3,0<2>
	cmp	 r13,r22,r18
	bb0.n	 lt,r13,@L4526
	subu	 r13,r18,r22
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L4528
	subu	 r25,r18,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L7748
	cmp	 r13,r12,2
	bb0.n	 gt,r13,@L7749
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L7753
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7753:
	bb1	 eq,r13,@L7751
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7751:
	addu	 r22,r22,1
@L7749:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L7757
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7757:
	bb1	 eq,r13,@L7755
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7755:
	addu	 r22,r22,1
@L7748:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L7761
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7761:
	bb1	 eq,r13,@L7759
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7759:
	addu	 r22,r22,1
	cmp	 r13,r22,r18
	bb0	 lt,r13,@L4526
@L4528:
	or	 r2,r0,r20
@L8038:
	subu	 r3,r25,1
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L7765
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7765:
	bb1	 eq,r13,@L7763
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7763:
	or	 r2,r0,r20
	subu	 r3,r25,2
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L7769
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7769:
	bb1	 eq,r13,@L7767
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7767:
	or	 r2,r0,r20
	subu	 r3,r25,3
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L7773
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7773:
	bb1	 eq,r13,@L7771
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7771:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,4
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L7777
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7777:
	bb1	 eq,r13,@L7775
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7775:
	addu	 r22,r22,4
	cmp	 r13,r22,r18
	bb1.n	 lt,r13,@L8038
	or	 r2,r0,r20
@L4526:
	bsr	 _get_insns
	bsr.n	 _end_sequence
	or	 r25,r0,r2
	or	 r2,r0,r16
	or	 r3,r0,r21
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r6,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr	 _emit_no_conflict_block
	br	 @L7199
	align	 4
@L4512:
	or.u	 r13,r0,hi16(_mode_size)
@L8036:
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,32
	bb0.n	 gt,r13,@L4532
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r2,r13,lo16(_word_mode)
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	addu	 r1,r1,@L8335
@L8336:
	align	 4
@L4532:
	cmp	 r13,r21,3
	bb1.n	 ne,r13,@L4533
	cmp	 r13,r22,3
	cmp	 r13,r22,4
	bb0.n	 ne,r13,@L4534
	or	 r2,r0,4
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,0
@L4534:
	bsr	 _abort
	align	 4
@L4533:
	bb1.n	 ne,r13,@L8039
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r21,4
	bb0.n	 ne,r13,@L4536
	or	 r2,r0,4
	or	 r3,r0,r23
	or	 r4,r0,0
	bsr.n	 _convert_to_mode
	or	 r22,r0,4
	br.n	 @L4535
	or	 r23,r0,r2
	align	 4
@L4536:
	bsr	 _abort
	align	 4
@L4535:
	or.u	 r13,r0,hi16(_mode_size)
@L8039:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb1.n	 ge,r12,@L8040
	or.u	 r13,r0,hi16(_mode_size)
	ld	 r13,r0,r23
	or.u	 r12,r0,0x37
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L4540
	or.u	 r13,r0,hi16(_direct_load)
	or	 r13,r13,lo16(_direct_load)
	ld.b	 r13,r21,r13
	bcnd	 eq0,r13,@L4540
	bsr.n	 _mode_dependent_address_p
	ld	 r2,r23,4
	bcnd.n	 eq0,r2,@L8041
	or	 r2,r0,r21
@L4540:
	ld.hu	 r13,r0,r23
	cmp	 r12,r13,51
	cmp	 r13,r13,53
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L4538
	or	 r2,r0,r21
@L8041:
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	addu	 r1,r1,@L8337
@L8338:
	align	 4
@L4538:
	or.u	 r13,r0,hi16(_mode_size)
@L8040:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb0.n	 gt,r12,@L4541
	or	 r2,r0,r21
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,0
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0.n	 ne,r13,@L4542
	or.u	 r13,r0,hi16(_optimize)
@L8037:
	ld	 r13,r13,lo16(_optimize)
	bcnd	 le0,r13,@L4543
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L8042
	or	 r2,r0,r25
	or	 r2,r0,r22
	bsr.n	 _force_reg
	or	 r3,r0,r23
	or	 r23,r0,r2
@L4543:
	or	 r2,r0,r25
@L8042:
	or	 r3,r0,r20
	or	 r4,r0,r23
@L7831:
	or	 r5,r0,r16
	bsr	 _emit_unop_insn
	br	 @L7199
	align	 4
@L4542:
	or	 r25,r0,r22
	bcnd.n	 eq0,r25,@L4546
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r24,r13,lo16(_mode_wider_mode)
	or	 r2,r0,r21
@L8043:
	or	 r3,r0,r25
	bsr.n	 _can_extend_p
	or	 r4,r0,0
	cmp	 r2,r2,210
	bb1.n	 eq,r2,@L4547
	or	 r2,r0,r25
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,0
	cmp	 r2,r2,210
	bb1.n	 ne,r2,@L7220
	or	 r2,r0,r25
@L4547:
	ld	 r25,r24[r25]
	bcnd.n	 ne0,r25,@L8043
	or	 r2,r0,r21
@L4546:
	bsr	 _abort
	align	 4
@L4541:
	cmp	 r13,r22,6
	extu	 r11,r13,1<eq>
	cmp	 r13,r21,4
	extu	 r13,r13,1<eq>
	and	 r13,r11,r13
	bcnd.n	 eq0,r13,@L4551
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L8339
@L8340:
	align	 4
@L4551:
	cmp	 r13,r21,2
	extu	 r9,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L4552
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L8341
@L8342:
	align	 4
@L4552:
	cmp	 r13,r21,1
	extu	 r10,r13,1<eq>
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L4553
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L8343
@L8344:
	align	 4
@L4553:
	cmp	 r13,r22,4
	extu	 r11,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L4554
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L8345
@L8346:
	align	 4
@L4554:
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L4555
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L8347
@L8348:
	align	 4
@L4555:
	cmp	 r13,r22,2
	extu	 r13,r13,1<eq>
	and	 r13,r13,r10
	bcnd.n	 eq0,r13,@L4556
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L8349
@L8350:
	align	 4
@L4556:
	bb1.n	 ge,r12,@L4557
	or	 r2,r0,r21
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	bsr.n	 _force_reg
	or	 r2,r0,r21
@L7830:
	or	 r3,r0,r2
	or	 r2,r0,r20
	bsr	 _emit_move_insn
	br	 @L7199
	align	 4
@L4557:
	bsr	 _abort
	align	 4
@L7220:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,0
@L7832:
	or	 r3,r0,r2
	or	 r2,r0,r20
	or	 r4,r0,0
	bsr	 _convert_move
	br	 @L7199
	align	 4
@L4559:
	ld	 r15,r31,180
	cmp	 r13,r15,42
	bb0	 ne,r13,@L4560
	ld	 r12,r20,16
	ld.bu	 r13,r12,8
	cmp	 r13,r13,43
	bb0	 eq,r13,@L4560
	ld	 r12,r12,20
	bcnd	 eq0,r12,@L4560
	ld	 r11,r20,20
@L4564:
	ld	 r13,r12,12
	cmp	 r13,r13,r11
	bb0	 ne,r13,@L7221
	ld	 r12,r0,r12
	bcnd	 ne0,r12,@L4564
@L4560:
	st	 r0,r31,124
	ld.bu	 r12,r20,8
	or	 r24,r0,r20
	or	 r10,r0,0
	or	 r22,r0,0
	or	 r23,r0,0
	addu	 r18,r31,104
	cmp	 r13,r12,37
	bb1.n	 ne,r13,@L4568
	addu	 r21,r31,124
	ld	 r2,r20,20
	ld	 r13,r2,28
	ld	 r10,r2,20
	bb1	 (31-12),r13,@L4569
	ld.bu	 r22,r2,28
@L4569:
	ld	 r13,r2,8
	br.n	 @L8044
	extu	 r13,r13,1<17>
	align	 4
@L4568:
	cmp	 r13,r12,38
	bb1.n	 ne,r13,@L4571
	or.u	 r12,r0,hi16(_mode_size)
	ld	 r13,r20,8
	ld	 r10,r20,20
	extu	 r13,r13,1<17>
@L8044:
	br.n	 @L4570
	st	 r13,r31,120
	align	 4
@L4571:
	ld	 r13,r20,4
	ld	 r11,r20,4
	ld.bu	 r22,r13,24
	or	 r12,r12,lo16(_mode_size)
	ld	 r13,r11,8
	ld	 r12,r12[r22]
	extu	 r13,r13,1<17>
	st	 r13,r31,120
	mak	 r12,r12,0<3>
	st	 r12,r31,104
@L4570:
	bcnd	 eq0,r10,@L4573
	ld.bu	 r13,r10,8
	cmp	 r13,r13,25
	bb0.n	 ne,r13,@L4574
	subu	 r13,r0,1
	st	 r13,r0,r18
	br.n	 @L4573
	or	 r22,r0,16
	align	 4
@L4574:
	ld	 r13,r10,12
	st	 r13,r0,r18
@L4573:
	st	 r0,r31,108
@L4578:
	ld.bu	 r13,r24,8
	cmp	 r13,r13,39
	bb1.n	 ne,r13,@L4579
	or.u	 r13,r0,hi16(_flag_volatile)
	ld	 r13,r13,lo16(_flag_volatile)
	bcnd.n	 eq0,r13,@L4579
	or	 r13,r0,1
	st	 r13,r0,r21
@L4579:
	ld.bu	 r12,r24,8
	subu	 r13,r12,37
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L4580
	mask	 r13,r12,0xff
	cmp	 r13,r13,37
	bb1	 ne,r13,@L4581
	ld	 r13,r24,20
	ld	 r25,r13,40
	br	 @L4582
	align	 4
@L4581:
	ld	 r25,r24,24
@L4582:
	ld.bu	 r12,r25,8
	cmp	 r13,r12,53
	bb1.n	 ne,r13,@L4583
	cmp	 r13,r12,25
	ld	 r12,r25,16
	ld.bu	 r13,r12,8
	cmp	 r13,r13,25
	bb1	 ne,r13,@L4584
	ld	 r25,r25,20
	br.n	 @L4585
	or	 r3,r0,r12
	align	 4
@L4584:
	ld	 r3,r25,20
	ld.bu	 r13,r3,8
	cmp	 r13,r13,25
	bb0.n	 ne,r13,@L4585
	or	 r25,r0,r12
	bsr	 _abort
	align	 4
@L4585:
	ld	 r13,r31,108
	ld	 r12,r3,12
	addu	 r13,r13,r12
	bcnd.n	 eq0,r23,@L4593
	st	 r13,r31,108
	bsr.n	 _size_int
	or	 r2,r0,8
	or	 r4,r0,r2
	or	 r2,r0,58
	bsr.n	 _size_binop
	or	 r3,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,53
	br.n	 @L7834
	or	 r3,r0,r23
	align	 4
@L4583:
	bb1	 ne,r13,@L4591
	ld	 r12,r25,12
	ld	 r13,r31,108
	br.n	 @L8045
	addu	 r13,r13,r12
	align	 4
@L4591:
	bcnd	 eq0,r23,@L4593
	bsr.n	 _size_int
	or	 r2,r0,8
	or	 r4,r0,r2
	or	 r2,r0,58
	bsr.n	 _size_binop
	or	 r3,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,53
	br.n	 @L7834
	or	 r3,r0,r23
	align	 4
@L4593:
	bsr.n	 _size_int
	or	 r2,r0,8
	or	 r4,r0,r2
	or	 r2,r0,58
	or	 r3,r0,r25
@L7834:
	bsr	 _size_binop
	br.n	 @L4595
	or	 r23,r0,r2
	align	 4
@L4580:
	cmp	 r13,r13,42
	bb1	 ne,r13,@L4596
	ld	 r12,r24,20
	ld.bu	 r13,r12,8
	cmp	 r13,r13,25
	bb1	 ne,r13,@L4596
	ld	 r13,r24,4
	ld	 r11,r13,16
	ld.bu	 r13,r11,8
	cmp	 r13,r13,25
	bb1	 ne,r13,@L4596
	ld	 r12,r12,12
	ld	 r13,r11,12
	mul	 r12,r12,r13
	ld	 r13,r31,108
	addu	 r13,r13,r12
@L8045:
	br.n	 @L4595
	st	 r13,r31,108
	align	 4
@L4596:
	ld.bu	 r12,r24,8
	mask	 r13,r12,0xff
	cmp	 r13,r13,103
	bb0.n	 ne,r13,@L4595
	subu	 r13,r12,101
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb0	 ls,r13,@L4577
	ld	 r13,r24,16
	ld	 r12,r24,4
	ld	 r11,r13,4
	ld.bu	 r13,r12,24
	ld.bu	 r12,r11,24
	cmp	 r13,r13,r12
	bb0	 eq,r13,@L4577
@L4595:
	ld	 r13,r24,8
	bb0.n	 (31-12),r13,@L4600
	or	 r13,r0,1
	st	 r13,r0,r21
@L4600:
	ld	 r24,r24,16
	br	 @L4578
	align	 4
@L4577:
	bcnd	 ne0,r22,@L4602
	ld	 r11,r0,r18
	ld	 r12,r31,108
	bcnd.n	 gt0,r11,@L4604
	subu	 r10,r0,r11
	bcnd.n	 ge0,r12,@L4605
	subu	 r13,r0,r12
	divu	 r13,r13,r10
	bcnd	 ne0,r11,@L4603
@L4607:
	tb0	 0,r0,503
	br	 @L4603
	align	 4
@L4605:
	divu	 r13,r12,r10
	bcnd	 eq0,r11,@L4607
	subu	 r13,r0,r13
	br	 @L4603
	align	 4
@L4604:
	bcnd.n	 ge0,r12,@L4606
	subu	 r13,r0,r12
	divu	 r13,r13,r11
	br.n	 @L4603
	subu	 r13,r0,r13
	align	 4
@L4606:
	divu	 r13,r12,r11
@L4603:
	ld	 r2,r0,r18
	mul	 r13,r13,r2
	subu	 r13,r12,r13
	bcnd.n	 ne0,r13,@L4602
	or	 r3,r0,1
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	or	 r22,r0,r2
	cmp	 r13,r22,16
	ext	 r13,r13,1<ne>
	and	 r22,r22,r13
@L4602:
	st	 r22,r31,116
	or	 r3,r0,0
	or	 r4,r0,0
	or	 r22,r0,r24
	or	 r5,r0,1
	or	 r2,r0,r22
	bsr.n	 _expand_expr
	st	 r23,r31,112
	or	 r18,r0,r2
	ld.hu	 r12,r0,r18
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4610
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4610
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L4609
@L4610:
	ld.hu	 r13,r0,r18
	ld	 r12,r22,4
	cmp	 r13,r13,47
	ld.bu	 r2,r12,24
	bb1.n	 ne,r13,@L8046
	or	 r3,r0,r18
	ld.bu	 r13,r18,2
	bcnd	 ne0,r13,@L4611
@L8046:
	bsr.n	 _force_reg
	addu	 r1,r1,@L8351
@L8352:
	align	 4
@L4611:
	bsr.n	 _force_const_mem
	or	 r3,r0,r18
	bsr	 _validize_mem
@L7836:
	or	 r18,r0,r2
@L4609:
	ld	 r2,r31,112
	bcnd	 eq0,r2,@L4614
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld.hu	 r13,r0,r18
	cmp	 r13,r13,55
	bb0.n	 ne,r13,@L4615
	or	 r3,r0,r2
	bsr	 _abort
	align	 4
@L4615:
	or	 r2,r0,4
	bsr.n	 _force_reg
	ld	 r25,r18,4
	or	 r5,r0,r2
	or	 r2,r0,63
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,r18
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r18,r0,r2
@L4614:
	ld.hu	 r13,r0,r18
	cmp	 r13,r13,55
	bb1	 ne,r13,@L4616
	ld	 r13,r31,124
	bcnd	 eq0,r13,@L4616
	ld	 r13,r0,r18
	bb1	 (31-27),r13,@L4616
	bsr.n	 _copy_rtx
	or	 r2,r0,r18
	or	 r18,r0,r2
	ld	 r13,r0,r18
	or	 r13,r13,16
	st	 r13,r0,r18
@L4616:
	ld	 r12,r31,116
	bcnd.n	 eq0,r12,@L4618
	cmp	 r13,r12,16
	bb0.n	 ne,r13,@L4619
	or.u	 r13,r0,hi16(_direct_load)
	or	 r13,r13,lo16(_direct_load)
	ld.b	 r12,r12,r13
	cmp	 r13,r19,2
	cmp	 r12,r12,0
	and.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L4619
	cmp	 r13,r19,1
	cmp	 r12,r19,3
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 ne0,r13,@L8047
	cmp	 r13,r14,16
@L4619:
	ld.hu	 r13,r0,r18
	cmp	 r12,r13,51
	cmp	 r13,r13,53
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L4617
	subu	 r13,r19,1
@L4618:
	cmp	 r13,r14,16
@L8047:
	bb1.n	 ne,r13,@L4621
	or	 r24,r0,r14
	ld	 r2,r31,104
	or	 r3,r0,1
	bsr.n	 _mode_for_size
	or	 r4,r0,1
	or	 r24,r0,r2
	cmp	 r13,r24,16
	bb1	 ne,r13,@L4621
	bsr	 _abort
	align	 4
@L4621:
	bsr.n	 _validize_mem
	or	 r2,r0,r18
	or	 r25,r0,r2
	bsr.n	 _int_size_in_bytes
	ld	 r2,r22,4
	ld	 r3,r31,104
	ld	 r4,r31,108
	ld	 r13,r22,4
	ld	 r5,r31,120
	or	 r6,r0,r17
	ld	 r9,r13,28
	or	 r7,r0,r24
	or	 r8,r0,r24
	st	 r2,r31,32
	or	 r2,r0,r25
	bsr.n	 _extract_bit_field
	extu	 r9,r9,0<3>
	cmp	 r13,r14,16
	bb1.n	 ne,r13,@L7976
	or	 r18,r0,r2
	ld	 r3,r31,104
	bcnd	 ge0,r3,@L4623
	addu	 r3,r3,7
@L4623:
	ext	 r3,r3,0<3>
	or	 r2,r0,r24
	bsr.n	 _assign_stack_temp
	or	 r4,r0,0
	or	 r20,r0,r2
	or	 r24,r0,r18
	ld.hu	 r11,r0,r20
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r22,r20,2
	or	 r13,r13,lo16(_mode_class)
	cmp	 r12,r11,59
	ld	 r19,r13[r22]
	bb0.n	 ne,r12,@L4626
	or	 r21,r0,r20
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L4629
	cmp	 r13,r11,63
	ld	 r2,r20,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L4630
	st	 r2,r20,4
	align	 4
@L4629:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L4630
	ld	 r2,r20,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r20,4
	ld	 r2,r20,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r20,8
@L4630:
	br.n	 @L4625
	or	 r2,r0,r21
	align	 4
@L4626:
	ld	 r13,r20,8
	bcnd	 ne0,r13,@L4632
	ld	 r2,r20,4
	br	 @L4625
	align	 4
@L4632:
	ld	 r2,r20,12
	bcnd	 ne0,r2,@L4625
	ld	 r13,r20,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r20,4
	bsr.n	 _gen_move_insn
	st	 r2,r20,12
	bsr.n	 _emit_insn_before
	ld	 r3,r20,8
	ld	 r2,r20,12
@L4625:
	ld.hu	 r12,r0,r24
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L4635
	or	 r21,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L8048
	cmp	 r13,r12,63
	ld.bu	 r13,r24,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L4636
	ld	 r23,r24,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L4636
	ld	 r13,r23,4
	st	 r13,r24,4
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L4639
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r24,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r24
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	br.n	 @L4634
	or	 r2,r0,r25
	align	 4
@L4636:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L4638
	cmp	 r13,r12,63
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L4639
	st	 r2,r24,4
	align	 4
@L4638:
@L8048:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L4639
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,4
	ld	 r2,r24,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,8
@L4639:
	br.n	 @L4634
	or	 r2,r0,r24
	align	 4
@L4635:
	ld	 r13,r24,8
	bcnd	 ne0,r13,@L4641
	ld	 r2,r24,4
	br.n	 @L8049
	cmp	 r13,r22,16
	align	 4
@L4641:
	ld	 r2,r24,12
	bcnd.n	 ne0,r2,@L8049
	cmp	 r13,r22,16
	ld	 r13,r24,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r24,4
	bsr.n	 _gen_move_insn
	st	 r2,r24,12
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	ld	 r2,r24,12
@L4634:
	cmp	 r13,r22,16
@L8049:
	bb0.n	 ne,r13,@L4644
	or	 r24,r0,r2
	ld.bu	 r13,r24,2
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L4643
	ld.bu	 r13,r24,2
	bcnd	 eq0,r13,@L4643
@L4644:
	bsr	 _abort
	align	 4
@L4643:
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4646
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4646
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L4645
@L4646:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,47
	bb1	 ne,r13,@L4645
	ld.bu	 r13,r24,2
	bcnd.n	 eq0,r13,@L4645
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
@L4645:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,55
	bb1	 ne,r13,@L4647
	ld.bu	 r2,r21,2
	bsr.n	 _memory_address_p
	ld	 r3,r21,4
	bcnd.n	 ne0,r2,@L8050
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bcnd.n	 eq0,r2,@L4648
	or.u	 r13,r0,hi16(_flag_force_addr)
@L8050:
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L4647
	ld	 r13,r21,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4648
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4648
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L4647
@L4648:
	ld	 r4,r21,4
	or	 r2,r0,r21
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r21,r0,r2
@L4647:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8051
	cmp	 r13,r22,16
	ld.bu	 r2,r24,2
	bsr.n	 _memory_address_p
	ld	 r3,r24,4
	bcnd.n	 eq0,r2,@L4651
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L4650
	ld	 r13,r24,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4651
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4651
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L8051
	cmp	 r13,r22,16
@L4651:
	ld	 r4,r24,4
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L4650:
	cmp	 r13,r22,16
@L8051:
	bb1.n	 ne,r13,@L4652
	subu	 r13,r19,5
	bsr	 _abort
	align	 4
@L4652:
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L4653
	or.u	 r13,r0,hi16(_mode_unit_size)
	or	 r13,r13,lo16(_mode_unit_size)
	ld	 r12,r13[r22]
	or	 r3,r0,2
	cmp	 r13,r19,5
	bb1.n	 ne,r13,@L4654
	mak	 r2,r12,0<3>
	or	 r3,r0,1
@L4654:
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	st	 r2,r31,204
@L4653:
	or.u	 r23,r0,hi16(_mov_optab)
	ld	 r11,r23,lo16(_mov_optab)
	lda.d	 r13,r11[r22]
	ld	 r12,r13,4
	cmp	 r13,r12,210
	bb0.n	 ne,r13,@L4656
	or.u	 r13,r0,hi16(_insn_gen_function)
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r2,r0,r21
	ld	 r13,r13[r12]
	jsr.n	 r13
	or	 r3,r0,r24
	bsr.n	 _emit_insn
	addu	 r1,r1,@L8353
@L8354:
	align	 4
@L4656:
	subu	 r13,r19,5
	ld	 r15,r31,204
	cmp	 r13,r13,1
	extu	 r13,r13,1<ls>
	cmp	 r12,r15,16
	extu	 r12,r12,1<ne>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L4658
	mak	 r25,r15,0<3>
	addu	 r13,r11,r25
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L4658
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bsr.n	 _get_last_insn
	or	 r22,r0,r2
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L4659
	or	 r18,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r21
	bsr	 _emit_insn
@L4659:
	ld	 r13,r23,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	addu	 r13,r13,r25
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L4660
	or	 r19,r12,lo16(_insn_gen_function)
	ld	 r3,r31,204
	or	 r2,r0,r21
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8355
@L8356:
	align	 4
@L4660:
	ld	 r2,r31,204
	bsr.n	 _gen_highpart
	or	 r3,r0,r21
@L7837:
	or	 r25,r0,r2
	ld	 r2,r31,204
	bsr.n	 _gen_highpart
	or	 r3,r0,r24
	or	 r3,r0,r2
	ld	 r13,r19[r23]
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r15,r31,204
	ld	 r13,r13,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	lda.d	 r13,r13[r15]
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L4662
	or	 r19,r12,lo16(_insn_gen_function)
	ld	 r3,r31,204
	or	 r2,r0,r21
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8357
@L8358:
	align	 4
@L4662:
	ld	 r2,r31,204
	bsr.n	 _gen_lowpart
	or	 r3,r0,r21
@L7838:
	or	 r25,r0,r2
	ld	 r2,r31,204
	bsr.n	 _gen_lowpart
	or	 r3,r0,r24
	ld	 r13,r19[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	bcnd	 eq0,r18,@L4665
	ld	 r24,r18,12
	br	 @L4666
	align	 4
@L4665:
	bsr	 _get_insns
	or	 r24,r0,r2
@L4666:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	st	 r2,r24,28
	bsr.n	 _get_last_insn
	addu	 r1,r1,@L8359
@L8360:
	align	 4
@L4658:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r23,r13,lo16(_mode_size)
	ld	 r13,r23[r22]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L4668
	bsr.n	 _get_last_insn
	or	 r25,r0,0
	or	 r19,r0,r2
	or	 r18,r0,r23
@L4669:
	ld	 r12,r18[r22]
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L4673
	addu	 r13,r12,6
@L4673:
	ext	 r13,r13,0<2>
	cmp	 r13,r25,r13
	bb0.n	 lt,r13,@L4670
	or	 r2,r0,r21
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r23,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r3,r0,r2
	bcnd.n	 ne0,r3,@L8052
	cmp	 r13,r23,0
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4675
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4675
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L4674
	or	 r2,r0,r24
@L4675:
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r3,r0,r25
	or	 r4,r0,1
	or	 r5,r0,r22
	bsr.n	 _operand_subword
	addu	 r1,r1,@L8361
@L8362:
	align	 4
@L4674:
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r22
@L7839:
	or	 r3,r0,r2
	cmp	 r13,r23,0
@L8052:
	cmp	 r12,r3,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L4678
	or	 r2,r0,r23
	bsr	 _abort
	align	 4
@L4678:
	addu	 r25,r25,1
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L8363
@L8364:
	align	 4
@L4670:
	bcnd	 eq0,r19,@L4680
	ld	 r24,r19,12
	br	 @L4681
	align	 4
@L4680:
	bsr	 _get_insns
	or	 r24,r0,r2
@L4681:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	br.n	 @L4624
	st	 r2,r24,28
	align	 4
@L4668:
	bsr	 _abort
	align	 4
@L4624:
	bsr.n	 _copy_rtx
	or	 r2,r0,r20
	or	 r18,r0,r2
	or	 r13,r0,16
	br.n	 @L7976
	st.b	 r13,r18,2
	align	 4
@L4617:
	cmp	 r12,r19,3
	cmp	 r13,r13,1
	rot	 r11,r13,6
	or.c	 r13,r12,r11
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L4683
	ld	 r2,r18,4
	ld	 r3,r31,108
	ld	 r25,r31,116
	bcnd	 ge0,r3,@L4684
	addu	 r3,r3,7
@L4684:
	bsr.n	 _plus_constant_wide
	ext	 r3,r3,0<3>
	or	 r4,r0,r2
	or	 r2,r0,55
	or	 r3,r0,r25
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L8365
@L8366:
	align	 4
@L4683:
	ld	 r3,r31,108
	ld	 r25,r31,116
	ld	 r2,r18,4
	bcnd	 ge0,r3,@L4686
	addu	 r3,r3,7
@L4686:
	bsr.n	 _plus_constant_wide
	ext	 r3,r3,0<3>
	or	 r4,r0,r2
	or	 r2,r0,r18
	bsr.n	 _change_address
	or	 r3,r0,r25
@L7840:
	or	 r18,r0,r2
	ld	 r11,r0,r18
	or	 r11,r11,8
	ld	 r12,r31,124
	extu	 r13,r11,1<4>
	ld	 r10,r31,116
	or	 r13,r13,r12
	and	 r12,r11,0xffef
	mak	 r13,r13,1<4>
	st	 r11,r0,r18
	or	 r12,r12,r13
	cmp	 r13,r14,r10
	bb0.n	 ne,r13,@L7976
	st	 r12,r0,r18
	cmp	 r13,r10,16
	bb0	 ne,r13,@L7976
	ld	 r15,r31,164
	cmp	 r13,r10,r15
	bb0	 ne,r13,@L7976
	bcnd	 ne0,r17,@L4689
	ld	 r2,r31,164
	bcnd	 ne0,r2,@L4690
	or	 r2,r0,r14
@L4690:
	bsr	 _gen_reg_rtx
	or	 r17,r0,r2
@L4689:
	ld.bu	 r21,r17,2
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r22,r18,2
	or	 r13,r13,lo16(_mode_class)
	ld	 r12,r13[r21]
	or	 r20,r0,r17
	ld	 r13,r13[r22]
	or	 r23,r0,r18
	ld	 r19,r31,120
	cmp	 r12,r12,2
	cmp	 r13,r13,2
	extu	 r18,r12,1<eq>
	or	 r16,r0,99
	bcnd.n	 eq0,r19,@L4692
	extu	 r14,r13,1<eq>
	or	 r16,r0,100
@L4692:
	ld.hu	 r12,r0,r17
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L4695
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L4698
	cmp	 r13,r12,63
	ld	 r2,r17,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L4699
	st	 r2,r17,4
	align	 4
@L4698:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L4699
	ld	 r2,r20,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r20,4
	ld	 r2,r20,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r20,8
@L4699:
	br.n	 @L4694
	or	 r2,r0,r20
	align	 4
@L4695:
	ld	 r13,r17,8
	bcnd	 ne0,r13,@L4701
	ld	 r2,r17,4
	br	 @L4694
	align	 4
@L4701:
	ld	 r2,r17,12
	bcnd	 ne0,r2,@L4694
	ld	 r13,r17,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r17,4
	bsr.n	 _gen_move_insn
	st	 r2,r17,12
	bsr.n	 _emit_insn_before
	ld	 r3,r17,8
	ld	 r2,r17,12
@L4694:
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L4704
	or	 r20,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L8053
	cmp	 r13,r12,63
	ld.bu	 r13,r23,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L4705
	ld	 r24,r23,4
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L4705
	ld	 r13,r24,4
	st	 r13,r23,4
	ld	 r13,r24,8
	bcnd	 eq0,r13,@L4708
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r23,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r23
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	br.n	 @L4703
	or	 r2,r0,r25
	align	 4
@L4705:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L4707
	cmp	 r13,r12,63
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L4708
	st	 r2,r23,4
	align	 4
@L4707:
@L8053:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L4708
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,4
	ld	 r2,r23,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,8
@L4708:
	br.n	 @L4703
	or	 r2,r0,r23
	align	 4
@L4704:
	ld	 r13,r23,8
	bcnd	 ne0,r13,@L4710
	ld	 r2,r23,4
	br.n	 @L8054
	cmp	 r13,r18,r14
	align	 4
@L4710:
	ld	 r2,r23,12
	bcnd.n	 ne0,r2,@L8054
	cmp	 r13,r18,r14
	ld	 r13,r23,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r23,4
	bsr.n	 _gen_move_insn
	st	 r2,r23,12
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	ld	 r2,r23,12
@L4703:
	cmp	 r13,r18,r14
@L8054:
	bb0.n	 ne,r13,@L4712
	or	 r23,r0,r2
	bsr	 _abort
	align	 4
@L4712:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	ld	 r11,r0,r23
	and	 r13,r11,0x8
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L8055
	ld	 r13,r23,4
	or.u	 r12,r0,hi16(_mode_size)
	ld.bu	 r13,r13,2
	or	 r12,r12,lo16(_mode_size)
	ld	 r13,r12[r13]
	ld	 r12,r12[r21]
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L4713
	extu	 r13,r11,1<5>
	cmp	 r13,r13,r19
	bb1.n	 ne,r13,@L4713
	or	 r2,r0,r21
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	or	 r22,r0,r21
	or	 r23,r0,r2
@L4713:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
@L8055:
	ld	 r13,r0,r20
	and	 r13,r13,0x8
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L4714
	cmp	 r13,r21,r22
	bsr	 _abort
	align	 4
@L4714:
	bb0.n	 ne,r13,@L8056
	or	 r2,r0,r20
	bcnd	 ne0,r22,@L4715
	ld.hu	 r12,r0,r23
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L8056
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L8056
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L4715
@L8056:
	or	 r3,r0,r23
	bsr	 _emit_move_insn
	br	 @L8004
	align	 4
@L4715:
	bcnd.n	 eq0,r18,@L4717
	cmp	 r5,r22,8
	cmp	 r13,r21,9
	extu	 r11,r5,1<eq>
	extu	 r7,r13,1<eq>
	and	 r13,r11,r7
	bcnd.n	 ne0,r13,@L7841
	or	 r2,r0,108
	cmp	 r6,r21,11
	extu	 r12,r6,1<eq>
	and	 r13,r11,r12
	bcnd.n	 ne0,r13,@L7841
	or	 r2,r0,109
	cmp	 r8,r22,9
	extu	 r9,r8,1<eq>
	and	 r13,r9,r12
	bcnd.n	 eq0,r13,@L4720
	cmp	 r4,r21,11
	br.n	 @L7841
	or	 r2,r0,110
	align	 4
@L4720:
	cmp	 r10,r21,8
	extu	 r11,r10,1<eq>
	and	 r13,r9,r11
	bcnd.n	 ne0,r13,@L7841
	or	 r2,r0,111
	cmp	 r9,r22,11
	extu	 r12,r9,1<eq>
	and	 r13,r12,r11
	bcnd.n	 ne0,r13,@L7841
	or	 r2,r0,112
	and	 r13,r12,r7
	bcnd.n	 eq0,r13,@L4723
	cmp	 r12,r21,9
	or	 r2,r0,113
@L7841:
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr	 _emit_unop_insn
	br	 @L8004
	align	 4
@L4723:
	bb0.n	 ne,r8,@L4733
	or	 r2,r0,0
	bb0.n	 ls,r8,@L4755
	cmp	 r13,r22,10
	bb0.n	 ne,r5,@L4725
	cmp	 r13,r21,10
	br	 @L4724
	align	 4
@L4755:
	bb0	 ne,r13,@L4741
	bb0	 ne,r9,@L4747
	br	 @L4724
	align	 4
@L4725:
	bb0	 ne,r13,@L4728
	bb0	 ls,r13,@L4732
	bb0.n	 ne,r12,@L4727
	or.u	 r13,r0,hi16(_extendsfdf2_libfunc)
	br	 @L4724
	align	 4
@L4732:
	bb0.n	 ne,r4,@L4729
	or.u	 r13,r0,hi16(_extendsftf2_libfunc)
	br	 @L4724
	align	 4
@L4727:
	ld	 r2,r13,lo16(_extendsfdf2_libfunc)
	br	 @L4724
	align	 4
@L4728:
	or.u	 r13,r0,hi16(_extendsfxf2_libfunc)
	ld	 r2,r13,lo16(_extendsfxf2_libfunc)
	br	 @L4724
	align	 4
@L4729:
	ld	 r2,r13,lo16(_extendsftf2_libfunc)
	br	 @L4724
	align	 4
@L4733:
	cmp	 r13,r21,10
	bb0	 ne,r13,@L4736
	bb0	 ls,r13,@L4740
	bb0.n	 ne,r10,@L4735
	or.u	 r13,r0,hi16(_truncdfsf2_libfunc)
	br	 @L4724
	align	 4
@L4740:
	bb0.n	 ne,r6,@L4737
	or.u	 r13,r0,hi16(_extenddftf2_libfunc)
	br	 @L4724
	align	 4
@L4735:
	ld	 r2,r13,lo16(_truncdfsf2_libfunc)
	br	 @L4724
	align	 4
@L4736:
	or.u	 r13,r0,hi16(_extenddfxf2_libfunc)
	ld	 r2,r13,lo16(_extenddfxf2_libfunc)
	br	 @L4724
	align	 4
@L4737:
	ld	 r2,r13,lo16(_extenddftf2_libfunc)
	br	 @L4724
	align	 4
@L4741:
	bb0.n	 ne,r10,@L4743
	or.u	 r13,r0,hi16(_truncxfsf2_libfunc)
	bb0.n	 ne,r12,@L4744
	or.u	 r13,r0,hi16(_truncxfdf2_libfunc)
	br	 @L4724
	align	 4
@L4743:
	ld	 r2,r13,lo16(_truncxfsf2_libfunc)
	br	 @L4724
	align	 4
@L4744:
	ld	 r2,r13,lo16(_truncxfdf2_libfunc)
	br	 @L4724
	align	 4
@L4747:
	bb0.n	 ne,r10,@L4749
	or.u	 r13,r0,hi16(_trunctfsf2_libfunc)
	bb0.n	 ne,r12,@L4750
	or.u	 r13,r0,hi16(_trunctfdf2_libfunc)
	br	 @L4724
	align	 4
@L4749:
	ld	 r2,r13,lo16(_trunctfsf2_libfunc)
	br	 @L4724
	align	 4
@L4750:
	ld	 r2,r13,lo16(_trunctfdf2_libfunc)
@L4724:
	bcnd.n	 ne0,r2,@L4756
	or	 r3,r0,1
	bsr	 _abort
	align	 4
@L4756:
	or	 r4,r0,r21
	or	 r5,r0,1
	or	 r6,r0,r23
	bsr.n	 _emit_library_call
	or	 r7,r0,r22
	or	 r2,r0,r21
	bsr.n	 _hard_libcall_value
	addu	 r1,r1,@L8367
@L8368:
	align	 4
@L4717:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r24,r13,lo16(_mode_size)
	ld	 r13,r24[r22]
	ld	 r12,r24[r21]
	mak	 r13,r13,0<3>
	mak	 r11,r12,0<3>
	cmp	 r13,r13,r11
	bb1.n	 ge,r13,@L8057
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r11,32
	bb0.n	 gt,r13,@L4757
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L4758
	addu	 r13,r12,6
@L4758:
	or	 r2,r0,r21
	or	 r3,r0,r22
	or	 r4,r0,r19
	bsr.n	 _can_extend_p
	ext	 r18,r13,0<2>
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb1.n	 ne,r13,@L8058
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r24[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L4761
	or.u	 r24,r0,hi16(_word_mode)
	or	 r2,r0,r21
	ld	 r3,r24,lo16(_word_mode)
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0	 ne,r13,@L4761
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r3,r0,r23
	bsr.n	 _convert_move
	or	 r4,r0,r19
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r4,r0,r2
	or	 r2,r0,r25
	br.n	 @L7843
	or	 r3,r0,r20
	align	 4
@L4761:
	bsr	 _start_sequence
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L4763
	or	 r25,r0,r22
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r25,r13,lo16(_word_mode)
	br.n	 @L8059
	or	 r2,r0,r25
	align	 4
@L4763:
	or	 r2,r0,r25
@L8059:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
	or	 r24,r0,r2
	or	 r2,r0,r25
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
	bcnd.n	 eq0,r19,@L4767
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r24,r13,lo16(_const0_rtx)
	br.n	 @L8060
	or.u	 r13,r0,hi16(_mode_size)
	align	 4
@L4767:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r2,r13[r25]
	mak	 r2,r2,0<3>
	bsr.n	 _size_int
	subu	 r2,r2,1
	or	 r5,r0,r2
	or	 r2,r0,78
	or	 r3,r0,r25
	or	 r4,r0,r24
	or	 r6,r0,0
	bsr.n	 _expand_shift
	or	 r7,r0,0
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_word_mode)
	or	 r4,r0,1
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _convert_to_mode
	or	 r3,r0,r24
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_mode_size)
@L8060:
	or	 r13,r13,lo16(_mode_size)
	ld	 r2,r13[r25]
	bcnd	 ge0,r2,@L4769
	addu	 r2,r2,3
@L4769:
	ext	 r22,r2,0<2>
	cmp	 r13,r22,r18
	bb0.n	 lt,r13,@L4771
	subu	 r13,r18,r22
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L4773
	subu	 r25,r18,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L7713
	cmp	 r13,r12,2
	bb0.n	 gt,r13,@L7714
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L7718
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7718:
	bb1	 eq,r13,@L7716
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7716:
	addu	 r22,r22,1
@L7714:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L7722
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7722:
	bb1	 eq,r13,@L7720
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7720:
	addu	 r22,r22,1
@L7713:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L7726
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7726:
	bb1	 eq,r13,@L7724
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7724:
	addu	 r22,r22,1
	cmp	 r13,r22,r18
	bb0	 lt,r13,@L4771
@L4773:
	or	 r2,r0,r20
@L8061:
	subu	 r3,r25,1
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L7730
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7730:
	bb1	 eq,r13,@L7728
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7728:
	or	 r2,r0,r20
	subu	 r3,r25,2
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L7734
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7734:
	bb1	 eq,r13,@L7732
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7732:
	or	 r2,r0,r20
	subu	 r3,r25,3
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L7738
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7738:
	bb1	 eq,r13,@L7736
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7736:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,4
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L7742
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7742:
	bb1	 eq,r13,@L7740
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7740:
	addu	 r22,r22,4
	cmp	 r13,r22,r18
	bb1.n	 lt,r13,@L8061
	or	 r2,r0,r20
@L4771:
	bsr	 _get_insns
	bsr.n	 _end_sequence
	or	 r25,r0,r2
	or	 r2,r0,r16
	or	 r3,r0,r21
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r6,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr	 _emit_no_conflict_block
	br	 @L8004
	align	 4
@L4757:
	or.u	 r13,r0,hi16(_mode_size)
@L8057:
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,32
	bb0.n	 gt,r13,@L4777
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	or	 r2,r0,r20
	br.n	 @L7844
	or	 r4,r0,0
	align	 4
@L4777:
	cmp	 r13,r21,3
	bb1.n	 ne,r13,@L4778
	cmp	 r13,r22,3
	cmp	 r13,r22,4
	bb0.n	 ne,r13,@L4779
	or	 r2,r0,4
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
@L4779:
	bsr	 _abort
	align	 4
@L4778:
	bb1.n	 ne,r13,@L8062
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r21,4
	bb0.n	 ne,r13,@L4781
	or	 r2,r0,4
	or	 r3,r0,r23
	or	 r4,r0,r19
	bsr.n	 _convert_to_mode
	or	 r22,r0,4
	br.n	 @L4780
	or	 r23,r0,r2
	align	 4
@L4781:
	bsr	 _abort
	align	 4
@L4780:
	or.u	 r13,r0,hi16(_mode_size)
@L8062:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb1.n	 ge,r12,@L8063
	or.u	 r13,r0,hi16(_mode_size)
	ld	 r13,r0,r23
	or.u	 r12,r0,0x37
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L4785
	or.u	 r13,r0,hi16(_direct_load)
	or	 r13,r13,lo16(_direct_load)
	ld.b	 r13,r21,r13
	bcnd	 eq0,r13,@L4785
	bsr.n	 _mode_dependent_address_p
	ld	 r2,r23,4
	bcnd.n	 eq0,r2,@L8064
	or	 r2,r0,r21
@L4785:
	ld.hu	 r13,r0,r23
	cmp	 r12,r13,51
	cmp	 r13,r13,53
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L4783
	or	 r2,r0,r21
@L8064:
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	addu	 r1,r1,@L8369
@L8370:
	align	 4
@L4783:
	or.u	 r13,r0,hi16(_mode_size)
@L8063:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb0.n	 gt,r12,@L4786
	or	 r2,r0,r21
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0.n	 ne,r13,@L4787
	or.u	 r13,r0,hi16(_optimize)
@L8058:
	ld	 r13,r13,lo16(_optimize)
	bcnd	 le0,r13,@L4788
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L8065
	or	 r2,r0,r25
	or	 r2,r0,r22
	bsr.n	 _force_reg
	or	 r3,r0,r23
	or	 r23,r0,r2
@L4788:
	or	 r2,r0,r25
@L8065:
	or	 r3,r0,r20
	or	 r4,r0,r23
@L7843:
	or	 r5,r0,r16
	bsr	 _emit_unop_insn
	br	 @L8004
	align	 4
@L4787:
	or	 r25,r0,r22
	bcnd.n	 eq0,r25,@L4791
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r24,r13,lo16(_mode_wider_mode)
	or	 r2,r0,r21
@L8066:
	or	 r3,r0,r25
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	cmp	 r2,r2,210
	bb1.n	 eq,r2,@L4792
	or	 r2,r0,r25
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	cmp	 r2,r2,210
	bb1.n	 ne,r2,@L7222
	or	 r2,r0,r25
@L4792:
	ld	 r25,r24[r25]
	bcnd.n	 ne0,r25,@L8066
	or	 r2,r0,r21
@L4791:
	bsr	 _abort
	align	 4
@L4786:
	cmp	 r13,r22,6
	extu	 r11,r13,1<eq>
	cmp	 r13,r21,4
	extu	 r13,r13,1<eq>
	and	 r13,r11,r13
	bcnd.n	 eq0,r13,@L4796
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L8371
@L8372:
	align	 4
@L4796:
	cmp	 r13,r21,2
	extu	 r9,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L4797
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L8373
@L8374:
	align	 4
@L4797:
	cmp	 r13,r21,1
	extu	 r10,r13,1<eq>
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L4798
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L8375
@L8376:
	align	 4
@L4798:
	cmp	 r13,r22,4
	extu	 r11,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L4799
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L8377
@L8378:
	align	 4
@L4799:
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L4800
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L8379
@L8380:
	align	 4
@L4800:
	cmp	 r13,r22,2
	extu	 r13,r13,1<eq>
	and	 r13,r13,r10
	bcnd.n	 eq0,r13,@L4801
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L8381
@L8382:
	align	 4
@L4801:
	bb1.n	 ge,r12,@L4802
	or	 r2,r0,r21
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	bsr.n	 _force_reg
	or	 r2,r0,r21
@L7842:
	or	 r3,r0,r2
	or	 r2,r0,r20
	bsr	 _emit_move_insn
	br	 @L8004
	align	 4
@L4802:
	bsr	 _abort
	align	 4
@L7222:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
@L7845:
	or	 r3,r0,r2
	or	 r2,r0,r20
	or	 r4,r0,r19
@L7844:
	bsr	 _convert_move
	br	 @L8004
	align	 4
@L4803:
	ld	 r3,r20,16
	or	 r2,r0,106
	bsr.n	 _build_unary_op
	or	 r4,r0,0
	ld	 r5,r20,20
	ld	 r3,r31,172
	or	 r4,r0,r2
	bsr.n	 _build
	or	 r2,r0,53
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,1
	or	 r18,r0,r2
	or	 r2,r0,r14
	bsr.n	 _memory_address
	or	 r3,r0,r18
	or	 r4,r0,r2
	or	 r2,r0,55
	bsr.n	 _gen_rtx
	or	 r3,r0,r14
	or	 r19,r0,r2
@L8005:
	ld	 r13,r0,r19
	or	 r13,r13,8
	st	 r13,r0,r19
@L8003:
	ld	 r13,r20,8
	bb1.n	 (31-12),r13,@L4805
	or	 r12,r0,0
	or.u	 r13,r0,hi16(_flag_volatile)
	ld	 r13,r13,lo16(_flag_volatile)
	bcnd	 eq0,r13,@L4804
@L4805:
	or	 r12,r0,1
@L4804:
	ld	 r13,r0,r19
	mak	 r12,r12,0<4>
	and	 r13,r13,0xffef
	or	 r2,r0,r19
	or	 r13,r13,r12
	br.n	 @L7200
	st	 r13,r0,r2
	align	 4
@L4806:
	bsr	 _abort
	align	 4
@L4807:
	bsr.n	 _preexpand_calls
	or	 r2,r0,r20
	ld	 r21,r20,16
	ld	 r13,r21,4
	ld	 r25,r20,20
	ld	 r12,r13,12
	ld	 r13,r25,4
	ld	 r23,r12,52
	ld	 r22,r12,56
	ld.bu	 r19,r13,24
	bcnd.n	 ne0,r17,@L8067
	or	 r2,r0,r22
	ld	 r13,r20,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,24
	or	 r17,r0,r2
	or	 r2,r0,r22
@L8067:
	bsr.n	 _tree_int_cst_lt
	or	 r3,r0,r23
	bcnd.n	 ne0,r2,@L8013
	or.u	 r13,r0,hi16(_const0_rtx)
	or	 r2,r0,r25
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r24,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r23,r0,r2
	or	 r2,r0,r22
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r25,r0,r2
	or	 r2,r0,r21
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,46
	ld	 r22,r2,4
	bb1	 ne,r13,@L4812
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,46
	bb1	 ne,r13,@L4810
	ld	 r13,r24,4
	ld	 r12,r23,4
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L8013
	or.u	 r13,r0,hi16(_const0_rtx)
@L4810:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,46
	bb1	 ne,r13,@L4812
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb1	 ne,r13,@L4812
	ld	 r13,r25,4
	ld	 r12,r24,4
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L8013
	or.u	 r13,r0,hi16(_const0_rtx)
@L4812:
	bsr	 _gen_label_rtx
	bsr.n	 _gen_label_rtx
	or	 r18,r0,r2
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,46
	bb1.n	 ne,r13,@L4815
	or	 r16,r0,r2
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,46
	bb0	 ne,r13,@L4814
@L4815:
	ld.bu	 r6,r24,2
	or	 r2,r0,r24
	or	 r3,r0,r23
	or	 r4,r0,94
	or	 r5,r0,0
	or	 r7,r0,0
	bsr.n	 _emit_cmp_insn
	or	 r8,r0,0
	bsr.n	 _gen_blt
	or	 r2,r0,r16
	bsr	 _emit_jump_insn
@L4814:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,46
	bb1	 ne,r13,@L4817
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb0	 ne,r13,@L4816
@L4817:
	ld.bu	 r6,r24,2
	or	 r2,r0,r24
	or	 r3,r0,r25
	or	 r4,r0,92
	or	 r5,r0,0
	or	 r7,r0,0
	bsr.n	 _emit_cmp_insn
	or	 r8,r0,0
	bsr.n	 _gen_bgt
	or	 r2,r0,r16
	bsr	 _emit_jump_insn
@L4816:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,46
	bb1.n	 ne,r13,@L4818
	or.u	 r13,r0,hi16(_and_optab)
	ld	 r4,r23,4
	or	 r2,r0,46
	or	 r3,r0,0
	and	 r4,r4,0xfeff
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L8383
@L8384:
	align	 4
@L4818:
	or	 r2,r0,46
	or	 r3,r0,0
	subu	 r4,r0,257
	bsr.n	 _gen_rtx
	ld	 r25,r13,lo16(_and_optab)
	or	 r5,r0,r2
	or	 r2,r0,r19
	or	 r4,r0,r23
	or	 r6,r0,0
	or	 r7,r0,0
	or	 r8,r0,3
	bsr.n	 _expand_binop
	or	 r3,r0,r25
@L7846:
	or	 r5,r0,r2
	or	 r2,r0,r19
	or	 r4,r0,r24
	or	 r6,r0,0
	or.u	 r13,r0,hi16(_sub_optab)
	or	 r7,r0,0
	ld	 r3,r13,lo16(_sub_optab)
	bsr.n	 _expand_binop
	or	 r8,r0,3
	or	 r25,r0,r2
	or	 r2,r0,46
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,8
	or	 r6,r0,r2
	or	 r2,r0,0
	or	 r3,r0,56
	or	 r4,r0,r19
	or	 r5,r0,r25
	or	 r7,r0,0
	bsr.n	 _expand_divmod
	or	 r8,r0,0
	or	 r2,r0,46
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,8
	or	 r6,r0,r2
	or	 r2,r0,1
	or	 r3,r0,60
	or	 r4,r0,r19
	or	 r5,r0,r24
	or	 r7,r0,0
	bsr.n	 _expand_divmod
	or	 r8,r0,0
	or	 r23,r0,r2
	or	 r2,r0,r19
	or.u	 r13,r0,hi16(_add_optab)
	or	 r4,r0,r25
	or.u	 r24,r0,hi16(_byte_mode)
	ld	 r3,r13,lo16(_add_optab)
	or	 r5,r0,r22
	bsr.n	 _expand_binop
	ld	 r25,r24,lo16(_byte_mode)
	or	 r3,r0,r2
	bsr.n	 _memory_address
	or	 r2,r0,r25
	ld	 r25,r24,lo16(_byte_mode)
	or	 r4,r0,r2
	or	 r2,r0,55
	bsr.n	 _gen_rtx
	or	 r3,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,78
	or	 r3,r0,r25
	or	 r5,r0,r23
	or	 r6,r0,0
	bsr.n	 _expand_shift
	or	 r7,r0,1
	or	 r4,r0,r2
	or	 r2,r0,4
	or.u	 r13,r0,hi16(_and_optab)
	or	 r6,r0,r17
	ld	 r3,r13,lo16(_and_optab)
	or.u	 r13,r0,hi16(_const1_rtx)
	or	 r7,r0,1
	ld	 r5,r13,lo16(_const1_rtx)
	bsr.n	 _expand_binop
	or	 r8,r0,3
	ld.hu	 r11,r0,r17
	or	 r21,r0,r17
	ld.bu	 r22,r17,2
	or.u	 r13,r0,hi16(_mode_class)
	or	 r13,r13,lo16(_mode_class)
	cmp	 r12,r11,59
	ld	 r20,r13[r22]
	bb0.n	 ne,r12,@L4822
	or	 r24,r0,r2
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L4825
	cmp	 r13,r11,63
	ld	 r2,r17,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L4826
	st	 r2,r17,4
	align	 4
@L4825:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L4826
	ld	 r2,r17,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r17,4
	ld	 r2,r17,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r17,8
@L4826:
	br.n	 @L4821
	or	 r2,r0,r21
	align	 4
@L4822:
	ld	 r13,r17,8
	bcnd	 ne0,r13,@L4828
	ld	 r2,r17,4
	br	 @L4821
	align	 4
@L4828:
	ld	 r2,r17,12
	bcnd	 ne0,r2,@L4821
	ld	 r13,r17,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r17,4
	bsr.n	 _gen_move_insn
	st	 r2,r17,12
	bsr.n	 _emit_insn_before
	ld	 r3,r17,8
	ld	 r2,r17,12
@L4821:
	ld.hu	 r12,r0,r24
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L4831
	or	 r21,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L8068
	cmp	 r13,r12,63
	ld.bu	 r13,r24,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L4832
	ld	 r23,r24,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L4832
	ld	 r13,r23,4
	st	 r13,r24,4
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L4835
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r24,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r24
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	br.n	 @L4830
	or	 r2,r0,r25
	align	 4
@L4832:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L4834
	cmp	 r13,r12,63
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L4835
	st	 r2,r24,4
	align	 4
@L4834:
@L8068:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L4835
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,4
	ld	 r2,r24,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,8
@L4835:
	br.n	 @L4830
	or	 r2,r0,r24
	align	 4
@L4831:
	ld	 r13,r24,8
	bcnd	 ne0,r13,@L4837
	ld	 r2,r24,4
	br.n	 @L8069
	cmp	 r13,r22,16
	align	 4
@L4837:
	ld	 r2,r24,12
	bcnd.n	 ne0,r2,@L8069
	cmp	 r13,r22,16
	ld	 r13,r24,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r24,4
	bsr.n	 _gen_move_insn
	st	 r2,r24,12
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	ld	 r2,r24,12
@L4830:
	cmp	 r13,r22,16
@L8069:
	bb0.n	 ne,r13,@L4840
	or	 r24,r0,r2
	ld.bu	 r13,r24,2
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L4839
	ld.bu	 r13,r24,2
	bcnd	 eq0,r13,@L4839
@L4840:
	bsr	 _abort
	align	 4
@L4839:
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4842
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4842
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L4841
@L4842:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,47
	bb1	 ne,r13,@L4841
	ld.bu	 r13,r24,2
	bcnd.n	 eq0,r13,@L4841
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
@L4841:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,55
	bb1	 ne,r13,@L4843
	ld.bu	 r2,r21,2
	bsr.n	 _memory_address_p
	ld	 r3,r21,4
	bcnd.n	 ne0,r2,@L8070
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bcnd.n	 eq0,r2,@L4844
	or.u	 r13,r0,hi16(_flag_force_addr)
@L8070:
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L4843
	ld	 r13,r21,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4844
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4844
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L4843
@L4844:
	ld	 r4,r21,4
	or	 r2,r0,r21
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r21,r0,r2
@L4843:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8071
	cmp	 r13,r22,16
	ld.bu	 r2,r24,2
	bsr.n	 _memory_address_p
	ld	 r3,r24,4
	bcnd.n	 eq0,r2,@L4847
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L4846
	ld	 r13,r24,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4847
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4847
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L8071
	cmp	 r13,r22,16
@L4847:
	ld	 r4,r24,4
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L4846:
	cmp	 r13,r22,16
@L8071:
	bb1.n	 ne,r13,@L4848
	subu	 r13,r20,5
	bsr	 _abort
	align	 4
@L4848:
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L4849
	or.u	 r13,r0,hi16(_mode_unit_size)
	or	 r13,r13,lo16(_mode_unit_size)
	ld	 r12,r13[r22]
	or	 r3,r0,2
	cmp	 r13,r20,5
	bb1.n	 ne,r13,@L4850
	mak	 r2,r12,0<3>
	or	 r3,r0,1
@L4850:
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	st	 r2,r31,212
@L4849:
	or.u	 r23,r0,hi16(_mov_optab)
	ld	 r11,r23,lo16(_mov_optab)
	lda.d	 r13,r11[r22]
	ld	 r12,r13,4
	cmp	 r13,r12,210
	bb0.n	 ne,r13,@L4852
	or.u	 r13,r0,hi16(_insn_gen_function)
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r2,r0,r21
	ld	 r13,r13[r12]
	jsr.n	 r13
	or	 r3,r0,r24
	bsr.n	 _emit_insn
	addu	 r1,r1,@L8385
@L8386:
	align	 4
@L4852:
	subu	 r13,r20,5
	ld	 r15,r31,212
	cmp	 r13,r13,1
	extu	 r13,r13,1<ls>
	cmp	 r12,r15,16
	extu	 r12,r12,1<ne>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L4854
	mak	 r25,r15,0<3>
	addu	 r13,r11,r25
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L4854
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bsr.n	 _get_last_insn
	or	 r22,r0,r2
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L4855
	or	 r19,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r21
	bsr	 _emit_insn
@L4855:
	ld	 r13,r23,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	addu	 r13,r13,r25
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L4856
	or	 r20,r12,lo16(_insn_gen_function)
	ld	 r3,r31,212
	or	 r2,r0,r21
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8387
@L8388:
	align	 4
@L4856:
	ld	 r2,r31,212
	bsr.n	 _gen_highpart
	or	 r3,r0,r21
@L7847:
	or	 r25,r0,r2
	ld	 r2,r31,212
	bsr.n	 _gen_highpart
	or	 r3,r0,r24
	or	 r3,r0,r2
	ld	 r13,r20[r23]
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r15,r31,212
	ld	 r13,r13,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	lda.d	 r13,r13[r15]
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L4858
	or	 r20,r12,lo16(_insn_gen_function)
	ld	 r3,r31,212
	or	 r2,r0,r21
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8389
@L8390:
	align	 4
@L4858:
	ld	 r2,r31,212
	bsr.n	 _gen_lowpart
	or	 r3,r0,r21
@L7848:
	or	 r25,r0,r2
	ld	 r2,r31,212
	bsr.n	 _gen_lowpart
	or	 r3,r0,r24
	ld	 r13,r20[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	bcnd	 eq0,r19,@L4861
	ld	 r24,r19,12
	br	 @L4862
	align	 4
@L4861:
	bsr	 _get_insns
	or	 r24,r0,r2
@L4862:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	st	 r2,r24,28
	bsr.n	 _get_last_insn
	addu	 r1,r1,@L8391
@L8392:
	align	 4
@L4854:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r23,r13,lo16(_mode_size)
	ld	 r13,r23[r22]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L4864
	bsr.n	 _get_last_insn
	or	 r25,r0,0
	or	 r20,r0,r2
	or	 r19,r0,r23
@L4865:
	ld	 r12,r19[r22]
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L4869
	addu	 r13,r12,6
@L4869:
	ext	 r13,r13,0<2>
	cmp	 r13,r25,r13
	bb0.n	 lt,r13,@L4866
	or	 r2,r0,r21
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r23,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r3,r0,r2
	bcnd.n	 ne0,r3,@L8072
	cmp	 r13,r23,0
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4871
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4871
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L4870
	or	 r2,r0,r24
@L4871:
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r3,r0,r25
	or	 r4,r0,1
	or	 r5,r0,r22
	bsr.n	 _operand_subword
	addu	 r1,r1,@L8393
@L8394:
	align	 4
@L4870:
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r22
@L7849:
	or	 r3,r0,r2
	cmp	 r13,r23,0
@L8072:
	cmp	 r12,r3,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L4874
	or	 r2,r0,r23
	bsr	 _abort
	align	 4
@L4874:
	addu	 r25,r25,1
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L8395
@L8396:
	align	 4
@L4866:
	bcnd	 eq0,r20,@L4876
	ld	 r24,r20,12
	br	 @L4877
	align	 4
@L4876:
	bsr	 _get_insns
	or	 r24,r0,r2
@L4877:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	br.n	 @L4820
	st	 r2,r24,28
	align	 4
@L4864:
	bsr	 _abort
	align	 4
@L4820:
	bsr.n	 _emit_jump
	or	 r2,r0,r18
	bsr.n	 _emit_label
	or	 r2,r0,r16
	ld.hu	 r11,r0,r17
	ld.bu	 r22,r17,2
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r24,r13,lo16(_const0_rtx)
	or.u	 r13,r0,hi16(_mode_class)
	or	 r13,r13,lo16(_mode_class)
	cmp	 r12,r11,59
	ld	 r20,r13[r22]
	bb0.n	 ne,r12,@L4881
	or	 r21,r0,r17
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L4884
	cmp	 r13,r11,63
	ld	 r2,r17,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L4885
	st	 r2,r17,4
	align	 4
@L4884:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L4885
	ld	 r2,r17,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r17,4
	ld	 r2,r17,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r17,8
@L4885:
	br.n	 @L4880
	or	 r2,r0,r21
	align	 4
@L4881:
	ld	 r13,r17,8
	bcnd	 ne0,r13,@L4887
	ld	 r2,r17,4
	br	 @L4880
	align	 4
@L4887:
	ld	 r2,r17,12
	bcnd	 ne0,r2,@L4880
	ld	 r13,r17,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r17,4
	bsr.n	 _gen_move_insn
	st	 r2,r17,12
	bsr.n	 _emit_insn_before
	ld	 r3,r17,8
	ld	 r2,r17,12
@L4880:
	ld.hu	 r12,r0,r24
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L4890
	or	 r21,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L8073
	cmp	 r13,r12,63
	ld.bu	 r13,r24,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L4891
	ld	 r23,r24,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L4891
	ld	 r13,r23,4
	st	 r13,r24,4
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L4894
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r24,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r24
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	br.n	 @L4889
	or	 r2,r0,r25
	align	 4
@L4891:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L4893
	cmp	 r13,r12,63
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L4894
	st	 r2,r24,4
	align	 4
@L4893:
@L8073:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L4894
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,4
	ld	 r2,r24,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,8
@L4894:
	br.n	 @L4889
	or	 r2,r0,r24
	align	 4
@L4890:
	ld	 r13,r24,8
	bcnd	 ne0,r13,@L4896
	ld	 r2,r24,4
	br.n	 @L8074
	cmp	 r13,r22,16
	align	 4
@L4896:
	ld	 r2,r24,12
	bcnd.n	 ne0,r2,@L8074
	cmp	 r13,r22,16
	ld	 r13,r24,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r24,4
	bsr.n	 _gen_move_insn
	st	 r2,r24,12
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	ld	 r2,r24,12
@L4889:
	cmp	 r13,r22,16
@L8074:
	bb0.n	 ne,r13,@L4899
	or	 r24,r0,r2
	ld.bu	 r13,r24,2
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L4898
	ld.bu	 r13,r24,2
	bcnd	 eq0,r13,@L4898
@L4899:
	bsr	 _abort
	align	 4
@L4898:
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4901
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4901
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L4900
@L4901:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,47
	bb1	 ne,r13,@L4900
	ld.bu	 r13,r24,2
	bcnd.n	 eq0,r13,@L4900
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
@L4900:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,55
	bb1	 ne,r13,@L4902
	ld.bu	 r2,r21,2
	bsr.n	 _memory_address_p
	ld	 r3,r21,4
	bcnd.n	 ne0,r2,@L8075
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bcnd.n	 eq0,r2,@L4903
	or.u	 r13,r0,hi16(_flag_force_addr)
@L8075:
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L4902
	ld	 r13,r21,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4903
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4903
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L4902
@L4903:
	ld	 r4,r21,4
	or	 r2,r0,r21
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r21,r0,r2
@L4902:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8076
	cmp	 r13,r22,16
	ld.bu	 r2,r24,2
	bsr.n	 _memory_address_p
	ld	 r3,r24,4
	bcnd.n	 eq0,r2,@L4906
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L4905
	ld	 r13,r24,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4906
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4906
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L8076
	cmp	 r13,r22,16
@L4906:
	ld	 r4,r24,4
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L4905:
	cmp	 r13,r22,16
@L8076:
	bb1.n	 ne,r13,@L4907
	subu	 r13,r20,5
	bsr	 _abort
	align	 4
@L4907:
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L4908
	or.u	 r13,r0,hi16(_mode_unit_size)
	or	 r13,r13,lo16(_mode_unit_size)
	ld	 r12,r13[r22]
	or	 r3,r0,2
	cmp	 r13,r20,5
	bb1.n	 ne,r13,@L4909
	mak	 r2,r12,0<3>
	or	 r3,r0,1
@L4909:
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	st	 r2,r31,220
@L4908:
	or.u	 r23,r0,hi16(_mov_optab)
	ld	 r11,r23,lo16(_mov_optab)
	lda.d	 r13,r11[r22]
	ld	 r12,r13,4
	cmp	 r13,r12,210
	bb0.n	 ne,r13,@L4911
	or.u	 r13,r0,hi16(_insn_gen_function)
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r2,r0,r21
	ld	 r13,r13[r12]
	jsr.n	 r13
	or	 r3,r0,r24
	bsr.n	 _emit_insn
	addu	 r1,r1,@L8397
@L8398:
	align	 4
@L4911:
	subu	 r13,r20,5
	ld	 r15,r31,220
	cmp	 r13,r13,1
	extu	 r13,r13,1<ls>
	cmp	 r12,r15,16
	extu	 r12,r12,1<ne>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L4913
	mak	 r25,r15,0<3>
	addu	 r13,r11,r25
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L4913
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bsr.n	 _get_last_insn
	or	 r22,r0,r2
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L4914
	or	 r19,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r21
	bsr	 _emit_insn
@L4914:
	ld	 r13,r23,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	addu	 r13,r13,r25
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L4915
	or	 r20,r12,lo16(_insn_gen_function)
	ld	 r3,r31,220
	or	 r2,r0,r21
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8399
@L8400:
	align	 4
@L4915:
	ld	 r2,r31,220
	bsr.n	 _gen_highpart
	or	 r3,r0,r21
@L7850:
	or	 r25,r0,r2
	ld	 r2,r31,220
	bsr.n	 _gen_highpart
	or	 r3,r0,r24
	or	 r3,r0,r2
	ld	 r13,r20[r23]
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r15,r31,220
	ld	 r13,r13,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	lda.d	 r13,r13[r15]
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L4917
	or	 r20,r12,lo16(_insn_gen_function)
	ld	 r3,r31,220
	or	 r2,r0,r21
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8401
@L8402:
	align	 4
@L4917:
	ld	 r2,r31,220
	bsr.n	 _gen_lowpart
	or	 r3,r0,r21
@L7851:
	or	 r25,r0,r2
	ld	 r2,r31,220
	bsr.n	 _gen_lowpart
	or	 r3,r0,r24
	ld	 r13,r20[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	bcnd	 eq0,r19,@L4920
	ld	 r24,r19,12
	br	 @L4921
	align	 4
@L4920:
	bsr	 _get_insns
	or	 r24,r0,r2
@L4921:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	st	 r2,r24,28
	bsr.n	 _get_last_insn
	addu	 r1,r1,@L8403
@L8404:
	align	 4
@L4913:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r23,r13,lo16(_mode_size)
	ld	 r13,r23[r22]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L4923
	bsr.n	 _get_last_insn
	or	 r25,r0,0
	or	 r20,r0,r2
	or	 r19,r0,r23
@L4924:
	ld	 r12,r19[r22]
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L4928
	addu	 r13,r12,6
@L4928:
	ext	 r13,r13,0<2>
	cmp	 r13,r25,r13
	bb0.n	 lt,r13,@L4925
	or	 r2,r0,r21
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r23,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r3,r0,r2
	bcnd.n	 ne0,r3,@L8077
	cmp	 r13,r23,0
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4930
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4930
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L4929
	or	 r2,r0,r24
@L4930:
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r3,r0,r25
	or	 r4,r0,1
	or	 r5,r0,r22
	bsr.n	 _operand_subword
	addu	 r1,r1,@L8405
@L8406:
	align	 4
@L4929:
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r22
@L7852:
	or	 r3,r0,r2
	cmp	 r13,r23,0
@L8077:
	cmp	 r12,r3,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L4933
	or	 r2,r0,r23
	bsr	 _abort
	align	 4
@L4933:
	addu	 r25,r25,1
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L8407
@L8408:
	align	 4
@L4925:
	bcnd	 eq0,r20,@L4935
	ld	 r24,r20,12
	br	 @L4936
	align	 4
@L4935:
	bsr	 _get_insns
	or	 r24,r0,r2
@L4936:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	br.n	 @L4879
	st	 r2,r24,28
	align	 4
@L4923:
	bsr	 _abort
	align	 4
@L4879:
	br.n	 @L7853
	or	 r2,r0,r18
	align	 4
@L4938:
	ld	 r13,r20,20
	bcnd.n	 ne0,r13,@L4939
	or	 r3,r0,r17
	ld	 r4,r31,164
	ld	 r2,r20,16
	bsr.n	 _expand_expr
	or	 r5,r0,r19
	ld	 r3,r20,24
	or.u	 r25,r0,hi16(_cleanups_this_call)
	st	 r2,r20,20
	ld	 r4,r25,lo16(_cleanups_this_call)
	bsr.n	 _tree_cons
	or	 r2,r0,0
	st	 r2,r25,lo16(_cleanups_this_call)
	st	 r0,r20,24
@L4939:
	ld	 r2,r20,20
	br	 @L7200
	align	 4
@L4940:
	ld	 r12,r20,16
	ld.bu	 r13,r12,8
	cmp	 r13,r13,106
	bb1	 ne,r13,@L4941
	ld	 r12,r12,16
	ld.bu	 r13,r12,8
	cmp	 r13,r13,29
	bb1	 ne,r13,@L4941
	ld	 r13,r12,28
	bb0.n	 (31-12),r13,@L4941
	or	 r2,r0,r20
	ld	 r5,r31,164
	ld	 r6,r31,188
	or	 r3,r0,r17
	or	 r4,r0,r16
	bsr	 _expand_builtin
	br	 @L7200
	align	 4
@L4941:
	ld	 r2,r20,24
	bcnd	 ne0,r2,@L7200
	or	 r2,r0,r20
	ld	 r4,r31,188
	or	 r3,r0,r17
	bsr	 _expand_call
	br	 @L7200
	align	 4
@L4946:
	ld	 r15,r31,172
	ld.bu	 r11,r15,8
	ld	 r15,r31,188
	cmp	 r12,r11,6
	subu	 r13,r0,r15
	extu	 r12,r12,1<eq>
	subu	 r13,r0,r13
	or	 r12,r12,r13
	bcnd.n	 eq0,r12,@L4947
	or.u	 r25,r0,hi16(_const0_rtx)
	ld	 r2,r20,16
	or	 r4,r0,0
	ld	 r3,r25,lo16(_const0_rtx)
	bsr.n	 _expand_expr
	or	 r5,r0,r19
	ld	 r2,r25,lo16(_const0_rtx)
	br	 @L7200
	align	 4
@L4947:
	ld	 r2,r20,16
	ld	 r12,r2,4
	ld.bu	 r13,r12,24
	cmp	 r13,r14,r13
	bb1.n	 ne,r13,@L4948
	cmp	 r13,r11,22
	or	 r3,r0,r17
	br.n	 @L7854
	or	 r4,r0,0
	align	 4
@L4948:
	bb1.n	 ne,r13,@L4949
	or	 r3,r0,0
	bcnd.n	 ne0,r17,@L4950
	or	 r25,r0,r12
	cmp	 r13,r14,16
	bb1	 ne,r13,@L4951
	ld	 r15,r31,172
	ld	 r2,r15,16
	bcnd	 eq0,r2,@L4953
	ld.bu	 r13,r2,8
	cmp	 r13,r13,25
	bb0	 ne,r13,@L4952
@L4953:
	bsr	 _abort
	align	 4
@L4952:
	ld	 r2,r2,12
	addu	 r3,r2,7
	bcnd	 ge0,r3,@L4954
	addu	 r3,r2,14
@L4954:
	ext	 r3,r3,0<3>
	or	 r2,r0,16
	or	 r4,r0,0
	bsr.n	 _assign_stack_temp
	addu	 r1,r1,@L8409
@L8410:
	align	 4
@L4951:
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,r14
@L7855:
	or	 r17,r0,r2
@L4950:
	ld.hu	 r12,r0,r17
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L4956
	cmp	 r13,r12,51
	ld.bu	 r3,r25,24
	or	 r2,r0,r17
	or	 r4,r0,0
	bsr.n	 _change_address
	ld	 r25,r20,16
	or	 r3,r0,r2
	or	 r2,r0,r25
	or	 r4,r0,0
	bsr.n	 _store_expr
	addu	 r1,r1,@L8411
@L8412:
	align	 4
@L4956:
	bb1	 ne,r13,@L4958
	ld	 r13,r20,16
	ld	 r2,r13,4
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r24,r25,24
	or	 r23,r13,lo16(_mode_size)
	bsr.n	 _int_size_in_bytes
	ld	 r25,r23[r24]
	st	 r2,r31,228
	mak	 r25,r25,0<3>
	st	 r25,r31,372
	cmp	 r13,r24,16
	ld	 r14,r20,16
	bb1	 ne,r13,@L4961
	ld.hu	 r13,r0,r17
	cmp	 r12,r13,51
	cmp	 r13,r13,53
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L4961
	ld.bu	 r13,r17,2
	ld.bu	 r2,r17,2
	ld	 r3,r23[r13]
	bsr.n	 _assign_stack_temp
	or	 r4,r0,0
	bsr.n	 _copy_rtx
	or	 r19,r0,r2
	st	 r2,r31,236
	or	 r13,r0,16
	st.b	 r13,r2,2
	ld.bu	 r13,r17,2
	ld	 r13,r23[r13]
	ld	 r15,r31,372
	mak	 r13,r13,0<3>
	cmp	 r13,r15,r13
	bb0	 ne,r13,@L4962
	ld.hu	 r11,r0,r19
	ld.bu	 r21,r19,2
	or	 r20,r0,r19
	or.u	 r13,r0,hi16(_mode_class)
	or	 r13,r13,lo16(_mode_class)
	cmp	 r12,r11,59
	ld	 r18,r13[r21]
	bb0.n	 ne,r12,@L4965
	or	 r23,r0,r17
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L4968
	cmp	 r13,r11,63
	ld	 r2,r19,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L4969
	st	 r2,r19,4
	align	 4
@L4968:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L4969
	ld	 r2,r19,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r19,4
	ld	 r2,r19,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r19,8
@L4969:
	br.n	 @L4964
	or	 r2,r0,r20
	align	 4
@L4965:
	ld	 r13,r19,8
	bcnd	 ne0,r13,@L4971
	ld	 r2,r19,4
	br	 @L4964
	align	 4
@L4971:
	ld	 r2,r19,12
	bcnd	 ne0,r2,@L4964
	ld	 r13,r19,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r19,4
	bsr.n	 _gen_move_insn
	st	 r2,r19,12
	bsr.n	 _emit_insn_before
	ld	 r3,r19,8
	ld	 r2,r19,12
@L4964:
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L4974
	or	 r20,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L8078
	cmp	 r13,r12,63
	ld.bu	 r13,r23,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L4975
	ld	 r22,r23,4
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L4975
	ld	 r13,r22,4
	st	 r13,r23,4
	ld	 r13,r22,8
	bcnd	 eq0,r13,@L4978
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r23,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r23
	bsr.n	 _emit_insn_before
	ld	 r3,r22,8
	br.n	 @L4973
	or	 r2,r0,r25
	align	 4
@L4975:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L4977
	cmp	 r13,r12,63
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L4978
	st	 r2,r23,4
	align	 4
@L4977:
@L8078:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L4978
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,4
	ld	 r2,r23,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,8
@L4978:
	br.n	 @L4973
	or	 r2,r0,r23
	align	 4
@L4974:
	ld	 r13,r23,8
	bcnd	 ne0,r13,@L4980
	ld	 r2,r23,4
	br.n	 @L8079
	cmp	 r13,r21,16
	align	 4
@L4980:
	ld	 r2,r23,12
	bcnd.n	 ne0,r2,@L8079
	cmp	 r13,r21,16
	ld	 r13,r23,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r23,4
	bsr.n	 _gen_move_insn
	st	 r2,r23,12
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	ld	 r2,r23,12
@L4973:
	cmp	 r13,r21,16
@L8079:
	bb0.n	 ne,r13,@L4983
	or	 r23,r0,r2
	ld.bu	 r13,r23,2
	cmp	 r13,r13,r21
	bb0	 ne,r13,@L4982
	ld.bu	 r13,r23,2
	bcnd	 eq0,r13,@L4982
@L4983:
	bsr	 _abort
	align	 4
@L4982:
	ld.hu	 r12,r0,r23
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4985
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4985
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L4984
@L4985:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,47
	bb1	 ne,r13,@L4984
	ld.bu	 r13,r23,2
	bcnd.n	 eq0,r13,@L4984
	or	 r2,r0,r21
	bsr.n	 _force_const_mem
	or	 r3,r0,r23
	or	 r23,r0,r2
@L4984:
	ld.hu	 r13,r0,r20
	cmp	 r13,r13,55
	bb1	 ne,r13,@L4986
	ld.bu	 r2,r20,2
	bsr.n	 _memory_address_p
	ld	 r3,r20,4
	bcnd.n	 ne0,r2,@L8080
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld.bu	 r3,r20,2
	bsr.n	 _push_operand
	or	 r2,r0,r20
	bcnd.n	 eq0,r2,@L4987
	or.u	 r13,r0,hi16(_flag_force_addr)
@L8080:
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L4986
	ld	 r13,r20,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4987
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4987
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L4986
@L4987:
	ld	 r4,r20,4
	or	 r2,r0,r20
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r20,r0,r2
@L4986:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8081
	cmp	 r13,r21,16
	ld.bu	 r2,r23,2
	bsr.n	 _memory_address_p
	ld	 r3,r23,4
	bcnd.n	 eq0,r2,@L4990
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L4989
	ld	 r13,r23,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4990
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L4990
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L8081
	cmp	 r13,r21,16
@L4990:
	ld	 r4,r23,4
	or	 r2,r0,r23
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r23,r0,r2
@L4989:
	cmp	 r13,r21,16
@L8081:
	bb1.n	 ne,r13,@L4991
	subu	 r13,r18,5
	bsr	 _abort
	align	 4
@L4991:
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L4992
	or.u	 r13,r0,hi16(_mode_unit_size)
	or	 r13,r13,lo16(_mode_unit_size)
	ld	 r12,r13[r21]
	or	 r3,r0,2
	cmp	 r13,r18,5
	bb1.n	 ne,r13,@L4993
	mak	 r2,r12,0<3>
	or	 r3,r0,1
@L4993:
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	st	 r2,r31,244
@L4992:
	or.u	 r22,r0,hi16(_mov_optab)
	ld	 r11,r22,lo16(_mov_optab)
	lda.d	 r13,r11[r21]
	ld	 r12,r13,4
	cmp	 r13,r12,210
	bb0.n	 ne,r13,@L4995
	or.u	 r13,r0,hi16(_insn_gen_function)
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r2,r0,r20
	ld	 r13,r13[r12]
	jsr.n	 r13
	or	 r3,r0,r23
	bsr.n	 _emit_insn
	addu	 r1,r1,@L8413
@L8414:
	align	 4
@L4995:
	subu	 r13,r18,5
	ld	 r15,r31,244
	cmp	 r13,r13,1
	extu	 r13,r13,1<ls>
	cmp	 r12,r15,16
	extu	 r12,r12,1<ne>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L4997
	mak	 r25,r15,0<3>
	addu	 r13,r11,r25
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L4997
	ld.bu	 r3,r20,2
	bsr.n	 _push_operand
	or	 r2,r0,r20
	bsr.n	 _get_last_insn
	or	 r21,r0,r2
	ld.hu	 r13,r0,r20
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L4998
	or	 r16,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r20
	bsr	 _emit_insn
@L4998:
	ld	 r13,r22,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	addu	 r13,r13,r25
	ld	 r22,r13,4
	bcnd.n	 eq0,r21,@L4999
	or	 r18,r12,lo16(_insn_gen_function)
	ld	 r3,r31,244
	or	 r2,r0,r20
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8415
@L8416:
	align	 4
@L4999:
	ld	 r2,r31,244
	bsr.n	 _gen_highpart
	or	 r3,r0,r20
@L7856:
	or	 r25,r0,r2
	ld	 r2,r31,244
	bsr.n	 _gen_highpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	ld	 r13,r18[r22]
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r15,r31,244
	ld	 r13,r13,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	lda.d	 r13,r13[r15]
	ld	 r22,r13,4
	bcnd.n	 eq0,r21,@L5001
	or	 r18,r12,lo16(_insn_gen_function)
	ld	 r3,r31,244
	or	 r2,r0,r20
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8417
@L8418:
	align	 4
@L5001:
	ld	 r2,r31,244
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
@L7857:
	or	 r25,r0,r2
	ld	 r2,r31,244
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	ld	 r13,r18[r22]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	bcnd	 eq0,r16,@L5004
	ld	 r23,r16,12
	br	 @L5005
	align	 4
@L5004:
	bsr	 _get_insns
	or	 r23,r0,r2
@L5005:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	st	 r2,r25,28
	ld	 r5,r23,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	st	 r2,r23,28
	bsr.n	 _get_last_insn
	addu	 r1,r1,@L8419
@L8420:
	align	 4
@L4997:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r22,r13,lo16(_mode_size)
	ld	 r13,r22[r21]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L5007
	bsr.n	 _get_last_insn
	or	 r25,r0,0
	or	 r18,r0,r2
	or	 r16,r0,r22
@L5008:
	ld	 r12,r16[r21]
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L5012
	addu	 r13,r12,6
@L5012:
	ext	 r13,r13,0<2>
	cmp	 r13,r25,r13
	bb0.n	 lt,r13,@L5009
	or	 r2,r0,r20
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	or	 r22,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	or	 r3,r0,r2
	bcnd.n	 ne0,r3,@L8082
	cmp	 r13,r22,0
	ld.hu	 r12,r0,r23
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5014
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5014
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L5013
	or	 r2,r0,r23
@L5014:
	or	 r2,r0,r21
	bsr.n	 _force_const_mem
	or	 r3,r0,r23
	or	 r23,r0,r2
	or	 r3,r0,r25
	or	 r4,r0,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	addu	 r1,r1,@L8421
@L8422:
	align	 4
@L5013:
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r21
@L7858:
	or	 r3,r0,r2
	cmp	 r13,r22,0
@L8082:
	cmp	 r12,r3,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L5017
	or	 r2,r0,r22
	bsr	 _abort
	align	 4
@L5017:
	addu	 r25,r25,1
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L8423
@L8424:
	align	 4
@L5009:
	bcnd	 eq0,r18,@L5019
	ld	 r23,r18,12
	br	 @L5020
	align	 4
@L5019:
	bsr	 _get_insns
	or	 r23,r0,r2
@L5020:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	st	 r2,r25,28
	ld	 r5,r23,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	br.n	 @L4962
	st	 r2,r23,28
	align	 4
@L5007:
	bsr	 _abort
	align	 4
@L4962:
	or	 r4,r0,0
	or	 r5,r0,r24
	or	 r6,r0,r14
	or	 r7,r0,0
	ld	 r15,r31,228
	or	 r8,r0,0
	ld	 r2,r31,236
	or	 r9,r0,1
	ld	 r3,r31,372
	or	 r21,r0,r17
	or	 r24,r0,r19
	bsr.n	 _store_field
	st	 r15,r31,32
	ld.hu	 r11,r0,r17
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r22,r17,2
	or	 r13,r13,lo16(_mode_class)
	cmp	 r12,r11,59
	ld	 r20,r13[r22]
	bb0.n	 ne,r12,@L5024
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L5027
	cmp	 r13,r11,63
	ld	 r2,r17,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L5028
	st	 r2,r17,4
	align	 4
@L5027:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5028
	ld	 r2,r17,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r17,4
	ld	 r2,r17,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r17,8
@L5028:
	br.n	 @L5023
	or	 r2,r0,r21
	align	 4
@L5024:
	ld	 r13,r17,8
	bcnd	 ne0,r13,@L5030
	ld	 r2,r17,4
	br	 @L5023
	align	 4
@L5030:
	ld	 r2,r17,12
	bcnd	 ne0,r2,@L5023
	ld	 r13,r17,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r17,4
	bsr.n	 _gen_move_insn
	st	 r2,r17,12
	bsr.n	 _emit_insn_before
	ld	 r3,r17,8
	ld	 r2,r17,12
@L5023:
	ld.hu	 r12,r0,r24
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L5033
	or	 r21,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L8083
	cmp	 r13,r12,63
	ld.bu	 r13,r24,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L5034
	ld	 r23,r24,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5034
	ld	 r13,r23,4
	st	 r13,r24,4
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L5037
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r24,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r24
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	br.n	 @L5032
	or	 r2,r0,r25
	align	 4
@L5034:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L5036
	cmp	 r13,r12,63
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L5037
	st	 r2,r24,4
	align	 4
@L5036:
@L8083:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5037
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,4
	ld	 r2,r24,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,8
@L5037:
	br.n	 @L5032
	or	 r2,r0,r24
	align	 4
@L5033:
	ld	 r13,r24,8
	bcnd	 ne0,r13,@L5039
	ld	 r2,r24,4
	br.n	 @L8084
	cmp	 r13,r22,16
	align	 4
@L5039:
	ld	 r2,r24,12
	bcnd.n	 ne0,r2,@L8084
	cmp	 r13,r22,16
	ld	 r13,r24,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r24,4
	bsr.n	 _gen_move_insn
	st	 r2,r24,12
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	ld	 r2,r24,12
@L5032:
	cmp	 r13,r22,16
@L8084:
	bb0.n	 ne,r13,@L5042
	or	 r24,r0,r2
	ld.bu	 r13,r24,2
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L5041
	ld.bu	 r13,r24,2
	bcnd	 eq0,r13,@L5041
@L5042:
	bsr	 _abort
	align	 4
@L5041:
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5044
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5044
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L5043
@L5044:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,47
	bb1	 ne,r13,@L5043
	ld.bu	 r13,r24,2
	bcnd.n	 eq0,r13,@L5043
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
@L5043:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,55
	bb1	 ne,r13,@L5045
	ld.bu	 r2,r21,2
	bsr.n	 _memory_address_p
	ld	 r3,r21,4
	bcnd.n	 ne0,r2,@L8085
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bcnd.n	 eq0,r2,@L5046
	or.u	 r13,r0,hi16(_flag_force_addr)
@L8085:
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L5045
	ld	 r13,r21,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5046
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5046
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L5045
@L5046:
	ld	 r4,r21,4
	or	 r2,r0,r21
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r21,r0,r2
@L5045:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8086
	cmp	 r13,r22,16
	ld.bu	 r2,r24,2
	bsr.n	 _memory_address_p
	ld	 r3,r24,4
	bcnd.n	 eq0,r2,@L5049
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L5048
	ld	 r13,r24,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5049
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5049
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L8086
	cmp	 r13,r22,16
@L5049:
	ld	 r4,r24,4
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L5048:
	cmp	 r13,r22,16
@L8086:
	bb1.n	 ne,r13,@L5050
	subu	 r13,r20,5
	bsr	 _abort
	align	 4
@L5050:
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L5051
	or.u	 r13,r0,hi16(_mode_unit_size)
	or	 r13,r13,lo16(_mode_unit_size)
	ld	 r12,r13[r22]
	or	 r3,r0,2
	cmp	 r13,r20,5
	bb1.n	 ne,r13,@L5052
	mak	 r2,r12,0<3>
	or	 r3,r0,1
@L5052:
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	st	 r2,r31,252
@L5051:
	or.u	 r23,r0,hi16(_mov_optab)
	ld	 r11,r23,lo16(_mov_optab)
	lda.d	 r13,r11[r22]
	ld	 r12,r13,4
	cmp	 r13,r12,210
	bb0.n	 ne,r13,@L5054
	or.u	 r13,r0,hi16(_insn_gen_function)
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r2,r0,r21
	ld	 r13,r13[r12]
	jsr.n	 r13
	or	 r3,r0,r24
	bsr.n	 _emit_insn
	addu	 r1,r1,@L8425
@L8426:
	align	 4
@L5054:
	subu	 r13,r20,5
	ld	 r15,r31,252
	cmp	 r13,r13,1
	extu	 r13,r13,1<ls>
	cmp	 r12,r15,16
	extu	 r12,r12,1<ne>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L5056
	mak	 r25,r15,0<3>
	addu	 r13,r11,r25
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L5056
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bsr.n	 _get_last_insn
	or	 r22,r0,r2
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L5057
	or	 r19,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r21
	bsr	 _emit_insn
@L5057:
	ld	 r13,r23,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	addu	 r13,r13,r25
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L5058
	or	 r20,r12,lo16(_insn_gen_function)
	ld	 r3,r31,252
	or	 r2,r0,r21
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8427
@L8428:
	align	 4
@L5058:
	ld	 r2,r31,252
	bsr.n	 _gen_highpart
	or	 r3,r0,r21
@L7859:
	or	 r25,r0,r2
	ld	 r2,r31,252
	bsr.n	 _gen_highpart
	or	 r3,r0,r24
	or	 r3,r0,r2
	ld	 r13,r20[r23]
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r15,r31,252
	ld	 r13,r13,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	lda.d	 r13,r13[r15]
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L5060
	or	 r20,r12,lo16(_insn_gen_function)
	ld	 r3,r31,252
	or	 r2,r0,r21
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8429
@L8430:
	align	 4
@L5060:
	ld	 r2,r31,252
	bsr.n	 _gen_lowpart
	or	 r3,r0,r21
@L7860:
	or	 r25,r0,r2
	ld	 r2,r31,252
	bsr.n	 _gen_lowpart
	or	 r3,r0,r24
	ld	 r13,r20[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	bcnd	 eq0,r19,@L5063
	ld	 r24,r19,12
	br	 @L5064
	align	 4
@L5063:
	bsr	 _get_insns
	or	 r24,r0,r2
@L5064:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	st	 r2,r24,28
	bsr.n	 _get_last_insn
	addu	 r1,r1,@L8431
@L8432:
	align	 4
@L5056:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r23,r13,lo16(_mode_size)
	ld	 r13,r23[r22]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L5066
	bsr.n	 _get_last_insn
	or	 r25,r0,0
	or	 r20,r0,r2
	or	 r19,r0,r23
@L5067:
	ld	 r12,r19[r22]
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L5071
	addu	 r13,r12,6
@L5071:
	ext	 r13,r13,0<2>
	cmp	 r13,r25,r13
	bb0.n	 lt,r13,@L5068
	or	 r2,r0,r21
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r23,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r3,r0,r2
	bcnd.n	 ne0,r3,@L8087
	cmp	 r13,r23,0
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5073
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5073
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L5072
	or	 r2,r0,r24
@L5073:
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r3,r0,r25
	or	 r4,r0,1
	or	 r5,r0,r22
	bsr.n	 _operand_subword
	addu	 r1,r1,@L8433
@L8434:
	align	 4
@L5072:
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r22
@L7861:
	or	 r3,r0,r2
	cmp	 r13,r23,0
@L8087:
	cmp	 r12,r3,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L5076
	or	 r2,r0,r23
	bsr	 _abort
	align	 4
@L5076:
	addu	 r25,r25,1
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L8435
@L8436:
	align	 4
@L5068:
	bcnd	 eq0,r20,@L5078
	ld	 r24,r20,12
	br	 @L5079
	align	 4
@L5078:
	bsr	 _get_insns
	or	 r24,r0,r2
@L5079:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	br.n	 @L8004
	st	 r2,r24,28
	align	 4
@L5066:
	bsr	 _abort
	align	 4
@L4961:
	bcnd.n	 eq0,r24,@L5082
	cmp	 r13,r24,16
	bb0.n	 ne,r13,@L5083
	or.u	 r13,r0,hi16(_direct_store)
	or	 r13,r13,lo16(_direct_store)
	ld.b	 r13,r24,r13
	bcnd.n	 eq0,r13,@L8088
	or	 r2,r0,r14
@L5083:
	ld.hu	 r13,r0,r17
	cmp	 r12,r13,51
	cmp	 r13,r13,53
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L5081
@L5082:
	or	 r2,r0,r14
@L8088:
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld	 r3,r31,372
	ld	 r8,r31,228
	or	 r6,r0,r2
	or	 r2,r0,r17
	or	 r4,r0,0
	or	 r5,r0,r24
	or	 r7,r0,1
	bsr.n	 _store_bit_field
	addu	 r1,r1,@L8437
@L8438:
	align	 4
@L5081:
	ld	 r2,r17,4
	bsr.n	 _plus_constant_wide
	or	 r3,r0,0
	or	 r4,r0,r2
	or	 r2,r0,r17
	bsr.n	 _change_address
	or	 r3,r0,r24
	or	 r3,r0,r2
	ld	 r13,r0,r3
	or	 r2,r0,r14
	or	 r4,r0,0
	or	 r13,r13,8
	st	 r13,r0,r3
	bsr.n	 _store_expr
	addu	 r1,r1,@L8439
@L8440:
	align	 4
@L4958:
	bsr	 _abort
	align	 4
@L4949:
	or	 r4,r0,r14
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r18,r0,r2
	ld.bu	 r13,r18,2
	cmp	 r13,r13,r14
	bb0	 ne,r13,@L7976
	ld.bu	 r13,r18,2
	bcnd.n	 eq0,r13,@L7976
	cmp	 r13,r19,3
	bb1.n	 ne,r13,@L5095
	or.u	 r13,r0,hi16(_flag_force_mem)
	ld	 r13,r31,120
	bcnd.n	 eq0,r13,@L5096
	or	 r2,r0,99
	or	 r2,r0,100
@L5096:
	or	 r3,r0,r14
	or	 r4,r0,r18
	bsr	 _gen_rtx
	br	 @L7200
	align	 4
@L5095:
	ld	 r13,r13,lo16(_flag_force_mem)
	bcnd	 eq0,r13,@L5098
	ld.hu	 r13,r0,r18
	cmp	 r13,r13,55
	bb1	 ne,r13,@L5098
	bsr.n	 _copy_to_reg
	or	 r2,r0,r18
	or	 r18,r0,r2
@L5098:
	bcnd.n	 ne0,r17,@L5099
	or	 r23,r0,r18
	ld	 r13,r20,16
	ld	 r10,r0,r18
	or.u	 r11,r0,0x35
	or	 r11,r11,0x8
	ld	 r12,r13,4
	and	 r13,r10,0x8
	ld	 r12,r12,8
	or	 r25,r0,r18
	cmp	 r13,r13,r11
	bb1.n	 ne,r13,@L5101
	extu	 r19,r12,1<17>
	ld	 r13,r18,4
	or.u	 r12,r0,hi16(_mode_size)
	ld.bu	 r13,r13,2
	or	 r12,r12,lo16(_mode_size)
	ld	 r13,r12[r13]
	ld	 r12,r12[r14]
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L5101
	extu	 r13,r10,1<5>
	cmp	 r13,r13,r19
	bb1.n	 ne,r13,@L5101
	or	 r2,r0,r14
	bsr.n	 _gen_lowpart
	or	 r3,r0,r18
	or	 r25,r0,r2
@L5101:
	ld.bu	 r13,r25,2
	cmp	 r13,r14,r13
	bb0.n	 ne,r13,@L7200
	or	 r2,r0,r25
	bcnd.n	 eq0,r19,@L5103
	or.u	 r13,r0,hi16(_mode_class)
	or	 r13,r13,lo16(_mode_class)
	ld	 r13,r13[r14]
	cmp	 r13,r13,1
	bb1.n	 ne,r13,@L5103
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r14]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,64
	bb1	 ne,r13,@L5103
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb1	 ne,r13,@L7204
	ld	 r2,r25,4
	bcnd.n	 lt0,r2,@L7863
	or	 r3,r0,0
@L5103:
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb1.n	 eq,r13,@L8031
	or	 r2,r0,r14
@L7204:
	or.u	 r13,r0,hi16(_mode_class)
	or	 r12,r13,lo16(_mode_class)
	ld	 r13,r12[r14]
	cmp	 r13,r13,1
	bb1.n	 ne,r13,@L8089
	or	 r2,r0,r14
	ld.bu	 r11,r25,2
	ld	 r13,r12[r11]
	cmp	 r13,r13,1
	bb1	 ne,r13,@L8089
	ld.hu	 r10,r0,r25
	cmp	 r13,r10,47
	bb1.n	 eq,r13,@L8031
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r14]
	ld	 r13,r13[r11]
	cmp	 r12,r12,r13
	bb1	 gt,r12,@L8089
	ld	 r13,r0,r25
	or.u	 r12,r0,0x37
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L8090
	cmp	 r13,r10,51
	or.u	 r13,r0,hi16(_direct_load)
	or	 r13,r13,lo16(_direct_load)
	ld.b	 r13,r14,r13
	bcnd.n	 ne0,r13,@L8091
	or	 r3,r0,r25
	cmp	 r13,r10,51
@L8090:
	bb1.n	 eq,r13,@L4444
	or	 r2,r0,r14
@L8089:
	bsr.n	 _gen_reg_rtx
	or	 r23,r0,r25
	ld.bu	 r22,r23,2
	or	 r17,r0,r2
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r21,r17,2
	or	 r13,r13,lo16(_mode_class)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	or	 r16,r0,99
	cmp	 r12,r12,2
	cmp	 r13,r13,2
	extu	 r18,r12,1<eq>
	or	 r20,r0,r17
	bcnd.n	 eq0,r19,@L5108
	extu	 r14,r13,1<eq>
	or	 r16,r0,100
@L5108:
	ld.hu	 r12,r0,r17
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L5111
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L5114
	cmp	 r13,r12,63
	ld	 r2,r17,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L5115
	st	 r2,r17,4
	align	 4
@L5114:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5115
	ld	 r2,r20,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r20,4
	ld	 r2,r20,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r20,8
@L5115:
	br.n	 @L5110
	or	 r2,r0,r20
	align	 4
@L5111:
	ld	 r13,r17,8
	bcnd	 ne0,r13,@L5117
	ld	 r2,r17,4
	br	 @L5110
	align	 4
@L5117:
	ld	 r2,r17,12
	bcnd	 ne0,r2,@L5110
	ld	 r13,r17,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r17,4
	bsr.n	 _gen_move_insn
	st	 r2,r17,12
	bsr.n	 _emit_insn_before
	ld	 r3,r17,8
	ld	 r2,r17,12
@L5110:
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L5120
	or	 r20,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L8092
	cmp	 r13,r12,63
	ld.bu	 r13,r23,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L5121
	ld	 r24,r23,4
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5121
	ld	 r13,r24,4
	st	 r13,r23,4
	ld	 r13,r24,8
	bcnd	 eq0,r13,@L5124
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r23,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r23
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	br.n	 @L5119
	or	 r2,r0,r25
	align	 4
@L5121:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L5123
	cmp	 r13,r12,63
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L5124
	st	 r2,r23,4
	align	 4
@L5123:
@L8092:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5124
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,4
	ld	 r2,r23,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,8
@L5124:
	br.n	 @L5119
	or	 r2,r0,r23
	align	 4
@L5120:
	ld	 r13,r23,8
	bcnd	 ne0,r13,@L5126
	ld	 r2,r23,4
	br.n	 @L8093
	cmp	 r13,r18,r14
	align	 4
@L5126:
	ld	 r2,r23,12
	bcnd.n	 ne0,r2,@L8093
	cmp	 r13,r18,r14
	ld	 r13,r23,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r23,4
	bsr.n	 _gen_move_insn
	st	 r2,r23,12
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	ld	 r2,r23,12
@L5119:
	cmp	 r13,r18,r14
@L8093:
	bb0.n	 ne,r13,@L5128
	or	 r23,r0,r2
	bsr	 _abort
	align	 4
@L5128:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	ld	 r11,r0,r23
	and	 r13,r11,0x8
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L8094
	ld	 r13,r23,4
	or.u	 r12,r0,hi16(_mode_size)
	ld.bu	 r13,r13,2
	or	 r12,r12,lo16(_mode_size)
	ld	 r13,r12[r13]
	ld	 r12,r12[r21]
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L5129
	extu	 r13,r11,1<5>
	cmp	 r13,r13,r19
	bb1.n	 ne,r13,@L5129
	or	 r2,r0,r21
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	or	 r22,r0,r21
	or	 r23,r0,r2
@L5129:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
@L8094:
	ld	 r13,r0,r20
	and	 r13,r13,0x8
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L5130
	cmp	 r13,r21,r22
	bsr	 _abort
	align	 4
@L5130:
	bb0.n	 ne,r13,@L8095
	or	 r2,r0,r20
	bcnd	 ne0,r22,@L5131
	ld.hu	 r12,r0,r23
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L8095
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L8095
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L5131
@L8095:
	or	 r3,r0,r23
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L8441
@L8442:
	align	 4
@L5131:
	bcnd.n	 eq0,r18,@L5133
	cmp	 r5,r22,8
	cmp	 r13,r21,9
	extu	 r11,r5,1<eq>
	extu	 r7,r13,1<eq>
	and	 r13,r11,r7
	bcnd.n	 ne0,r13,@L7864
	or	 r2,r0,108
	cmp	 r6,r21,11
	extu	 r12,r6,1<eq>
	and	 r13,r11,r12
	bcnd.n	 ne0,r13,@L7864
	or	 r2,r0,109
	cmp	 r8,r22,9
	extu	 r9,r8,1<eq>
	and	 r13,r9,r12
	bcnd.n	 eq0,r13,@L5136
	cmp	 r4,r21,11
	br.n	 @L7864
	or	 r2,r0,110
	align	 4
@L5136:
	cmp	 r10,r21,8
	extu	 r11,r10,1<eq>
	and	 r13,r9,r11
	bcnd.n	 ne0,r13,@L7864
	or	 r2,r0,111
	cmp	 r9,r22,11
	extu	 r12,r9,1<eq>
	and	 r13,r12,r11
	bcnd.n	 ne0,r13,@L7864
	or	 r2,r0,112
	and	 r13,r12,r7
	bcnd.n	 eq0,r13,@L5139
	cmp	 r12,r21,9
	or	 r2,r0,113
@L7864:
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L8443
@L8444:
	align	 4
@L5139:
	bb0.n	 ne,r8,@L5149
	or	 r2,r0,0
	bb0.n	 ls,r8,@L5171
	cmp	 r13,r22,10
	bb0.n	 ne,r5,@L5141
	cmp	 r13,r21,10
	br	 @L5140
	align	 4
@L5171:
	bb0	 ne,r13,@L5157
	bb0	 ne,r9,@L5163
	br	 @L5140
	align	 4
@L5141:
	bb0	 ne,r13,@L5144
	bb0	 ls,r13,@L5148
	bb0.n	 ne,r12,@L5143
	or.u	 r13,r0,hi16(_extendsfdf2_libfunc)
	br	 @L5140
	align	 4
@L5148:
	bb0.n	 ne,r4,@L5145
	or.u	 r13,r0,hi16(_extendsftf2_libfunc)
	br	 @L5140
	align	 4
@L5143:
	ld	 r2,r13,lo16(_extendsfdf2_libfunc)
	br	 @L5140
	align	 4
@L5144:
	or.u	 r13,r0,hi16(_extendsfxf2_libfunc)
	ld	 r2,r13,lo16(_extendsfxf2_libfunc)
	br	 @L5140
	align	 4
@L5145:
	ld	 r2,r13,lo16(_extendsftf2_libfunc)
	br	 @L5140
	align	 4
@L5149:
	cmp	 r13,r21,10
	bb0	 ne,r13,@L5152
	bb0	 ls,r13,@L5156
	bb0.n	 ne,r10,@L5151
	or.u	 r13,r0,hi16(_truncdfsf2_libfunc)
	br	 @L5140
	align	 4
@L5156:
	bb0.n	 ne,r6,@L5153
	or.u	 r13,r0,hi16(_extenddftf2_libfunc)
	br	 @L5140
	align	 4
@L5151:
	ld	 r2,r13,lo16(_truncdfsf2_libfunc)
	br	 @L5140
	align	 4
@L5152:
	or.u	 r13,r0,hi16(_extenddfxf2_libfunc)
	ld	 r2,r13,lo16(_extenddfxf2_libfunc)
	br	 @L5140
	align	 4
@L5153:
	ld	 r2,r13,lo16(_extenddftf2_libfunc)
	br	 @L5140
	align	 4
@L5157:
	bb0.n	 ne,r10,@L5159
	or.u	 r13,r0,hi16(_truncxfsf2_libfunc)
	bb0.n	 ne,r12,@L5160
	or.u	 r13,r0,hi16(_truncxfdf2_libfunc)
	br	 @L5140
	align	 4
@L5159:
	ld	 r2,r13,lo16(_truncxfsf2_libfunc)
	br	 @L5140
	align	 4
@L5160:
	ld	 r2,r13,lo16(_truncxfdf2_libfunc)
	br	 @L5140
	align	 4
@L5163:
	bb0.n	 ne,r10,@L5165
	or.u	 r13,r0,hi16(_trunctfsf2_libfunc)
	bb0.n	 ne,r12,@L5166
	or.u	 r13,r0,hi16(_trunctfdf2_libfunc)
	br	 @L5140
	align	 4
@L5165:
	ld	 r2,r13,lo16(_trunctfsf2_libfunc)
	br	 @L5140
	align	 4
@L5166:
	ld	 r2,r13,lo16(_trunctfdf2_libfunc)
@L5140:
	bcnd.n	 ne0,r2,@L5172
	or	 r3,r0,1
	bsr	 _abort
	align	 4
@L5172:
	or	 r4,r0,r21
	or	 r5,r0,1
	or	 r6,r0,r23
	bsr.n	 _emit_library_call
	or	 r7,r0,r22
	or	 r2,r0,r21
	bsr.n	 _hard_libcall_value
	addu	 r1,r1,@L8445
@L8446:
	align	 4
@L5133:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r24,r13,lo16(_mode_size)
	ld	 r13,r24[r22]
	ld	 r12,r24[r21]
	mak	 r13,r13,0<3>
	mak	 r11,r12,0<3>
	cmp	 r13,r13,r11
	bb1.n	 ge,r13,@L8096
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r11,32
	bb0.n	 gt,r13,@L5173
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L5174
	addu	 r13,r12,6
@L5174:
	or	 r2,r0,r21
	or	 r3,r0,r22
	or	 r4,r0,r19
	bsr.n	 _can_extend_p
	ext	 r18,r13,0<2>
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb1.n	 ne,r13,@L8097
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r24[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L5177
	or.u	 r24,r0,hi16(_word_mode)
	or	 r2,r0,r21
	ld	 r3,r24,lo16(_word_mode)
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0	 ne,r13,@L5177
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r3,r0,r23
	bsr.n	 _convert_move
	or	 r4,r0,r19
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r4,r0,r2
	or	 r2,r0,r25
	br.n	 @L7866
	or	 r3,r0,r20
	align	 4
@L5177:
	bsr	 _start_sequence
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L5179
	or	 r25,r0,r22
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r25,r13,lo16(_word_mode)
	br.n	 @L8098
	or	 r2,r0,r25
	align	 4
@L5179:
	or	 r2,r0,r25
@L8098:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
	or	 r24,r0,r2
	or	 r2,r0,r25
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
	bcnd.n	 eq0,r19,@L5183
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r24,r13,lo16(_const0_rtx)
	br.n	 @L8099
	or.u	 r13,r0,hi16(_mode_size)
	align	 4
@L5183:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r2,r13[r25]
	mak	 r2,r2,0<3>
	bsr.n	 _size_int
	subu	 r2,r2,1
	or	 r5,r0,r2
	or	 r2,r0,78
	or	 r3,r0,r25
	or	 r4,r0,r24
	or	 r6,r0,0
	bsr.n	 _expand_shift
	or	 r7,r0,0
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_word_mode)
	or	 r4,r0,1
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _convert_to_mode
	or	 r3,r0,r24
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_mode_size)
@L8099:
	or	 r13,r13,lo16(_mode_size)
	ld	 r2,r13[r25]
	bcnd	 ge0,r2,@L5185
	addu	 r2,r2,3
@L5185:
	ext	 r22,r2,0<2>
	cmp	 r13,r22,r18
	bb0.n	 lt,r13,@L5187
	subu	 r13,r18,r22
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L5189
	subu	 r25,r18,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L7679
	cmp	 r13,r12,2
	bb0.n	 gt,r13,@L7680
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L7684
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7684:
	bb1	 eq,r13,@L7682
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7682:
	addu	 r22,r22,1
@L7680:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L7688
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7688:
	bb1	 eq,r13,@L7686
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7686:
	addu	 r22,r22,1
@L7679:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L7692
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7692:
	bb1	 eq,r13,@L7690
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7690:
	addu	 r22,r22,1
	cmp	 r13,r22,r18
	bb0	 lt,r13,@L5187
@L5189:
	or	 r2,r0,r20
@L8100:
	subu	 r3,r25,1
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L7696
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7696:
	bb1	 eq,r13,@L7694
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7694:
	or	 r2,r0,r20
	subu	 r3,r25,2
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L7700
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7700:
	bb1	 eq,r13,@L7698
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7698:
	or	 r2,r0,r20
	subu	 r3,r25,3
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L7704
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7704:
	bb1	 eq,r13,@L7702
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7702:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,4
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L7708
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7708:
	bb1	 eq,r13,@L7706
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7706:
	addu	 r22,r22,4
	cmp	 r13,r22,r18
	bb1.n	 lt,r13,@L8100
	or	 r2,r0,r20
@L5187:
	bsr	 _get_insns
	bsr.n	 _end_sequence
	or	 r25,r0,r2
	or	 r2,r0,r16
	or	 r3,r0,r21
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r6,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_no_conflict_block
	addu	 r1,r1,@L8447
@L8448:
	align	 4
@L5173:
	or.u	 r13,r0,hi16(_mode_size)
@L8096:
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,32
	bb0.n	 gt,r13,@L5193
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	or	 r2,r0,r20
	br.n	 @L7867
	or	 r4,r0,0
	align	 4
@L5193:
	cmp	 r13,r21,3
	bb1.n	 ne,r13,@L5194
	cmp	 r13,r22,3
	cmp	 r13,r22,4
	bb0.n	 ne,r13,@L5195
	or	 r2,r0,4
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
@L5195:
	bsr	 _abort
	align	 4
@L5194:
	bb1.n	 ne,r13,@L8101
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r21,4
	bb0.n	 ne,r13,@L5197
	or	 r2,r0,4
	or	 r3,r0,r23
	or	 r4,r0,r19
	bsr.n	 _convert_to_mode
	or	 r22,r0,4
	br.n	 @L5196
	or	 r23,r0,r2
	align	 4
@L5197:
	bsr	 _abort
	align	 4
@L5196:
	or.u	 r13,r0,hi16(_mode_size)
@L8101:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb1.n	 ge,r12,@L8102
	or.u	 r13,r0,hi16(_mode_size)
	ld	 r13,r0,r23
	or.u	 r12,r0,0x37
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L5201
	or.u	 r13,r0,hi16(_direct_load)
	or	 r13,r13,lo16(_direct_load)
	ld.b	 r13,r21,r13
	bcnd	 eq0,r13,@L5201
	bsr.n	 _mode_dependent_address_p
	ld	 r2,r23,4
	bcnd.n	 eq0,r2,@L8103
	or	 r2,r0,r21
@L5201:
	ld.hu	 r13,r0,r23
	cmp	 r12,r13,51
	cmp	 r13,r13,53
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L5199
	or	 r2,r0,r21
@L8103:
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	addu	 r1,r1,@L8449
@L8450:
	align	 4
@L5199:
	or.u	 r13,r0,hi16(_mode_size)
@L8102:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb0.n	 gt,r12,@L5202
	or	 r2,r0,r21
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0.n	 ne,r13,@L5203
	or.u	 r13,r0,hi16(_optimize)
@L8097:
	ld	 r13,r13,lo16(_optimize)
	bcnd	 le0,r13,@L5204
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L8104
	or	 r2,r0,r25
	or	 r2,r0,r22
	bsr.n	 _force_reg
	or	 r3,r0,r23
	or	 r23,r0,r2
@L5204:
	or	 r2,r0,r25
@L8104:
	or	 r3,r0,r20
	or	 r4,r0,r23
@L7866:
	or	 r5,r0,r16
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L8451
@L8452:
	align	 4
@L5203:
	or	 r25,r0,r22
	bcnd.n	 eq0,r25,@L5207
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r24,r13,lo16(_mode_wider_mode)
	or	 r2,r0,r21
@L8105:
	or	 r3,r0,r25
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	cmp	 r2,r2,210
	bb1.n	 eq,r2,@L5208
	or	 r2,r0,r25
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	cmp	 r2,r2,210
	bb1.n	 ne,r2,@L7223
	or	 r2,r0,r25
@L5208:
	ld	 r25,r24[r25]
	bcnd.n	 ne0,r25,@L8105
	or	 r2,r0,r21
@L5207:
	bsr	 _abort
	align	 4
@L5202:
	cmp	 r13,r22,6
	extu	 r11,r13,1<eq>
	cmp	 r13,r21,4
	extu	 r13,r13,1<eq>
	and	 r13,r11,r13
	bcnd.n	 eq0,r13,@L5212
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L8453
@L8454:
	align	 4
@L5212:
	cmp	 r13,r21,2
	extu	 r9,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L5213
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L8455
@L8456:
	align	 4
@L5213:
	cmp	 r13,r21,1
	extu	 r10,r13,1<eq>
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L5214
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L8457
@L8458:
	align	 4
@L5214:
	cmp	 r13,r22,4
	extu	 r11,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L5215
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L8459
@L8460:
	align	 4
@L5215:
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L5216
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L8461
@L8462:
	align	 4
@L5216:
	cmp	 r13,r22,2
	extu	 r13,r13,1<eq>
	and	 r13,r13,r10
	bcnd.n	 eq0,r13,@L5217
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L8463
@L8464:
	align	 4
@L5217:
	bb1.n	 ge,r12,@L5218
	or	 r2,r0,r21
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	bsr.n	 _force_reg
	or	 r2,r0,r21
@L7865:
	or	 r3,r0,r2
	or	 r2,r0,r20
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L8465
@L8466:
	align	 4
@L5218:
	bsr	 _abort
	align	 4
@L7223:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
@L7868:
	or	 r3,r0,r2
	or	 r2,r0,r20
	or	 r4,r0,r19
@L7867:
	bsr.n	 _convert_move
	addu	 r1,r1,@L8467
@L8468:
	align	 4
@L5099:
	ld	 r13,r20,16
	ld.bu	 r21,r17,2
	ld	 r12,r13,4
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r22,r18,2
	or	 r13,r13,lo16(_mode_class)
	ld	 r11,r12,8
	or	 r20,r0,r17
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	extu	 r19,r11,1<17>
	cmp	 r12,r12,2
	cmp	 r13,r13,2
	extu	 r18,r12,1<eq>
	or	 r16,r0,99
	bcnd.n	 eq0,r19,@L5221
	extu	 r14,r13,1<eq>
	or	 r16,r0,100
@L5221:
	ld.hu	 r12,r0,r17
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L5224
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L5227
	cmp	 r13,r12,63
	ld	 r2,r17,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L5228
	st	 r2,r17,4
	align	 4
@L5227:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5228
	ld	 r2,r17,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r17,4
	ld	 r2,r17,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r17,8
@L5228:
	br.n	 @L5223
	or	 r2,r0,r20
	align	 4
@L5224:
	ld	 r13,r17,8
	bcnd	 ne0,r13,@L5230
	ld	 r2,r17,4
	br	 @L5223
	align	 4
@L5230:
	ld	 r2,r17,12
	bcnd	 ne0,r2,@L5223
	ld	 r13,r17,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r17,4
	bsr.n	 _gen_move_insn
	st	 r2,r17,12
	bsr.n	 _emit_insn_before
	ld	 r3,r17,8
	ld	 r2,r17,12
@L5223:
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L5233
	or	 r20,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L8106
	cmp	 r13,r12,63
	ld.bu	 r13,r23,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L5234
	ld	 r24,r23,4
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5234
	ld	 r13,r24,4
	st	 r13,r23,4
	ld	 r13,r24,8
	bcnd	 eq0,r13,@L5237
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r23,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r23
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	br.n	 @L5232
	or	 r2,r0,r25
	align	 4
@L5234:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L5236
	cmp	 r13,r12,63
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L5237
	st	 r2,r23,4
	align	 4
@L5236:
@L8106:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5237
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,4
	ld	 r2,r23,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,8
@L5237:
	br.n	 @L5232
	or	 r2,r0,r23
	align	 4
@L5233:
	ld	 r13,r23,8
	bcnd	 ne0,r13,@L5239
	ld	 r2,r23,4
	br.n	 @L8107
	cmp	 r13,r18,r14
	align	 4
@L5239:
	ld	 r2,r23,12
	bcnd.n	 ne0,r2,@L8107
	cmp	 r13,r18,r14
	ld	 r13,r23,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r23,4
	bsr.n	 _gen_move_insn
	st	 r2,r23,12
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	ld	 r2,r23,12
@L5232:
	cmp	 r13,r18,r14
@L8107:
	bb0.n	 ne,r13,@L5241
	or	 r23,r0,r2
	bsr	 _abort
	align	 4
@L5241:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	ld	 r11,r0,r23
	and	 r13,r11,0x8
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L8108
	ld	 r13,r23,4
	or.u	 r12,r0,hi16(_mode_size)
	ld.bu	 r13,r13,2
	or	 r12,r12,lo16(_mode_size)
	ld	 r13,r12[r13]
	ld	 r12,r12[r21]
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L5242
	extu	 r13,r11,1<5>
	cmp	 r13,r13,r19
	bb1.n	 ne,r13,@L5242
	or	 r2,r0,r21
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	or	 r22,r0,r21
	or	 r23,r0,r2
@L5242:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
@L8108:
	ld	 r13,r0,r20
	and	 r13,r13,0x8
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L5243
	cmp	 r13,r21,r22
	bsr	 _abort
	align	 4
@L5243:
	bb0.n	 ne,r13,@L8109
	or	 r2,r0,r20
	bcnd	 ne0,r22,@L5244
	ld.hu	 r12,r0,r23
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L8109
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L8109
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L5244
@L8109:
	or	 r3,r0,r23
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L8469
@L8470:
	align	 4
@L5244:
	bcnd.n	 eq0,r18,@L5246
	cmp	 r5,r22,8
	cmp	 r13,r21,9
	extu	 r11,r5,1<eq>
	extu	 r7,r13,1<eq>
	and	 r13,r11,r7
	bcnd.n	 ne0,r13,@L7869
	or	 r2,r0,108
	cmp	 r6,r21,11
	extu	 r12,r6,1<eq>
	and	 r13,r11,r12
	bcnd.n	 ne0,r13,@L7869
	or	 r2,r0,109
	cmp	 r8,r22,9
	extu	 r9,r8,1<eq>
	and	 r13,r9,r12
	bcnd.n	 eq0,r13,@L5249
	cmp	 r4,r21,11
	br.n	 @L7869
	or	 r2,r0,110
	align	 4
@L5249:
	cmp	 r10,r21,8
	extu	 r11,r10,1<eq>
	and	 r13,r9,r11
	bcnd.n	 ne0,r13,@L7869
	or	 r2,r0,111
	cmp	 r9,r22,11
	extu	 r12,r9,1<eq>
	and	 r13,r12,r11
	bcnd.n	 ne0,r13,@L7869
	or	 r2,r0,112
	and	 r13,r12,r7
	bcnd.n	 eq0,r13,@L5252
	cmp	 r12,r21,9
	or	 r2,r0,113
@L7869:
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L8471
@L8472:
	align	 4
@L5252:
	bb0.n	 ne,r8,@L5262
	or	 r2,r0,0
	bb0.n	 ls,r8,@L5284
	cmp	 r13,r22,10
	bb0.n	 ne,r5,@L5254
	cmp	 r13,r21,10
	br	 @L5253
	align	 4
@L5284:
	bb0	 ne,r13,@L5270
	bb0	 ne,r9,@L5276
	br	 @L5253
	align	 4
@L5254:
	bb0	 ne,r13,@L5257
	bb0	 ls,r13,@L5261
	bb0.n	 ne,r12,@L5256
	or.u	 r13,r0,hi16(_extendsfdf2_libfunc)
	br	 @L5253
	align	 4
@L5261:
	bb0.n	 ne,r4,@L5258
	or.u	 r13,r0,hi16(_extendsftf2_libfunc)
	br	 @L5253
	align	 4
@L5256:
	ld	 r2,r13,lo16(_extendsfdf2_libfunc)
	br	 @L5253
	align	 4
@L5257:
	or.u	 r13,r0,hi16(_extendsfxf2_libfunc)
	ld	 r2,r13,lo16(_extendsfxf2_libfunc)
	br	 @L5253
	align	 4
@L5258:
	ld	 r2,r13,lo16(_extendsftf2_libfunc)
	br	 @L5253
	align	 4
@L5262:
	cmp	 r13,r21,10
	bb0	 ne,r13,@L5265
	bb0	 ls,r13,@L5269
	bb0.n	 ne,r10,@L5264
	or.u	 r13,r0,hi16(_truncdfsf2_libfunc)
	br	 @L5253
	align	 4
@L5269:
	bb0.n	 ne,r6,@L5266
	or.u	 r13,r0,hi16(_extenddftf2_libfunc)
	br	 @L5253
	align	 4
@L5264:
	ld	 r2,r13,lo16(_truncdfsf2_libfunc)
	br	 @L5253
	align	 4
@L5265:
	or.u	 r13,r0,hi16(_extenddfxf2_libfunc)
	ld	 r2,r13,lo16(_extenddfxf2_libfunc)
	br	 @L5253
	align	 4
@L5266:
	ld	 r2,r13,lo16(_extenddftf2_libfunc)
	br	 @L5253
	align	 4
@L5270:
	bb0.n	 ne,r10,@L5272
	or.u	 r13,r0,hi16(_truncxfsf2_libfunc)
	bb0.n	 ne,r12,@L5273
	or.u	 r13,r0,hi16(_truncxfdf2_libfunc)
	br	 @L5253
	align	 4
@L5272:
	ld	 r2,r13,lo16(_truncxfsf2_libfunc)
	br	 @L5253
	align	 4
@L5273:
	ld	 r2,r13,lo16(_truncxfdf2_libfunc)
	br	 @L5253
	align	 4
@L5276:
	bb0.n	 ne,r10,@L5278
	or.u	 r13,r0,hi16(_trunctfsf2_libfunc)
	bb0.n	 ne,r12,@L5279
	or.u	 r13,r0,hi16(_trunctfdf2_libfunc)
	br	 @L5253
	align	 4
@L5278:
	ld	 r2,r13,lo16(_trunctfsf2_libfunc)
	br	 @L5253
	align	 4
@L5279:
	ld	 r2,r13,lo16(_trunctfdf2_libfunc)
@L5253:
	bcnd.n	 ne0,r2,@L5285
	or	 r3,r0,1
	bsr	 _abort
	align	 4
@L5285:
	or	 r4,r0,r21
	or	 r5,r0,1
	or	 r6,r0,r23
	bsr.n	 _emit_library_call
	or	 r7,r0,r22
	or	 r2,r0,r21
	bsr.n	 _hard_libcall_value
	addu	 r1,r1,@L8473
@L8474:
	align	 4
@L5246:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r24,r13,lo16(_mode_size)
	ld	 r13,r24[r22]
	ld	 r12,r24[r21]
	mak	 r13,r13,0<3>
	mak	 r11,r12,0<3>
	cmp	 r13,r13,r11
	bb1.n	 ge,r13,@L8110
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r11,32
	bb0.n	 gt,r13,@L5286
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L5287
	addu	 r13,r12,6
@L5287:
	or	 r2,r0,r21
	or	 r3,r0,r22
	or	 r4,r0,r19
	bsr.n	 _can_extend_p
	ext	 r18,r13,0<2>
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb1.n	 ne,r13,@L8111
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r24[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L5290
	or.u	 r24,r0,hi16(_word_mode)
	or	 r2,r0,r21
	ld	 r3,r24,lo16(_word_mode)
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0	 ne,r13,@L5290
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r3,r0,r23
	bsr.n	 _convert_move
	or	 r4,r0,r19
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r4,r0,r2
	or	 r2,r0,r25
	br.n	 @L7871
	or	 r3,r0,r20
	align	 4
@L5290:
	bsr	 _start_sequence
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L5292
	or	 r25,r0,r22
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r25,r13,lo16(_word_mode)
	br.n	 @L8112
	or	 r2,r0,r25
	align	 4
@L5292:
	or	 r2,r0,r25
@L8112:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
	or	 r24,r0,r2
	or	 r2,r0,r25
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
	bcnd.n	 eq0,r19,@L5296
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r24,r13,lo16(_const0_rtx)
	br.n	 @L8113
	or.u	 r13,r0,hi16(_mode_size)
	align	 4
@L5296:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r2,r13[r25]
	mak	 r2,r2,0<3>
	bsr.n	 _size_int
	subu	 r2,r2,1
	or	 r5,r0,r2
	or	 r2,r0,78
	or	 r3,r0,r25
	or	 r4,r0,r24
	or	 r6,r0,0
	bsr.n	 _expand_shift
	or	 r7,r0,0
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_word_mode)
	or	 r4,r0,1
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _convert_to_mode
	or	 r3,r0,r24
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_mode_size)
@L8113:
	or	 r13,r13,lo16(_mode_size)
	ld	 r2,r13[r25]
	bcnd	 ge0,r2,@L5298
	addu	 r2,r2,3
@L5298:
	ext	 r22,r2,0<2>
	cmp	 r13,r22,r18
	bb0.n	 lt,r13,@L5300
	subu	 r13,r18,r22
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L5302
	subu	 r25,r18,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L7645
	cmp	 r13,r12,2
	bb0.n	 gt,r13,@L7646
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L7650
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7650:
	bb1	 eq,r13,@L7648
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7648:
	addu	 r22,r22,1
@L7646:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L7654
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7654:
	bb1	 eq,r13,@L7652
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7652:
	addu	 r22,r22,1
@L7645:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L7658
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7658:
	bb1	 eq,r13,@L7656
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7656:
	addu	 r22,r22,1
	cmp	 r13,r22,r18
	bb0	 lt,r13,@L5300
@L5302:
	or	 r2,r0,r20
@L8114:
	subu	 r3,r25,1
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L7662
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7662:
	bb1	 eq,r13,@L7660
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7660:
	or	 r2,r0,r20
	subu	 r3,r25,2
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L7666
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7666:
	bb1	 eq,r13,@L7664
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7664:
	or	 r2,r0,r20
	subu	 r3,r25,3
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L7670
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7670:
	bb1	 eq,r13,@L7668
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7668:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,4
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L7674
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7674:
	bb1	 eq,r13,@L7672
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7672:
	addu	 r22,r22,4
	cmp	 r13,r22,r18
	bb1.n	 lt,r13,@L8114
	or	 r2,r0,r20
@L5300:
	bsr	 _get_insns
	bsr.n	 _end_sequence
	or	 r25,r0,r2
	or	 r2,r0,r16
	or	 r3,r0,r21
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r6,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_no_conflict_block
	addu	 r1,r1,@L8475
@L8476:
	align	 4
@L5286:
	or.u	 r13,r0,hi16(_mode_size)
@L8110:
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,32
	bb0.n	 gt,r13,@L5306
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	or	 r2,r0,r20
	br.n	 @L7872
	or	 r4,r0,0
	align	 4
@L5306:
	cmp	 r13,r21,3
	bb1.n	 ne,r13,@L5307
	cmp	 r13,r22,3
	cmp	 r13,r22,4
	bb0.n	 ne,r13,@L5308
	or	 r2,r0,4
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
@L5308:
	bsr	 _abort
	align	 4
@L5307:
	bb1.n	 ne,r13,@L8115
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r21,4
	bb0.n	 ne,r13,@L5310
	or	 r2,r0,4
	or	 r3,r0,r23
	or	 r4,r0,r19
	bsr.n	 _convert_to_mode
	or	 r22,r0,4
	br.n	 @L5309
	or	 r23,r0,r2
	align	 4
@L5310:
	bsr	 _abort
	align	 4
@L5309:
	or.u	 r13,r0,hi16(_mode_size)
@L8115:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb1.n	 ge,r12,@L8116
	or.u	 r13,r0,hi16(_mode_size)
	ld	 r13,r0,r23
	or.u	 r12,r0,0x37
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L5314
	or.u	 r13,r0,hi16(_direct_load)
	or	 r13,r13,lo16(_direct_load)
	ld.b	 r13,r21,r13
	bcnd	 eq0,r13,@L5314
	bsr.n	 _mode_dependent_address_p
	ld	 r2,r23,4
	bcnd.n	 eq0,r2,@L8117
	or	 r2,r0,r21
@L5314:
	ld.hu	 r13,r0,r23
	cmp	 r12,r13,51
	cmp	 r13,r13,53
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L5312
	or	 r2,r0,r21
@L8117:
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	addu	 r1,r1,@L8477
@L8478:
	align	 4
@L5312:
	or.u	 r13,r0,hi16(_mode_size)
@L8116:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb0.n	 gt,r12,@L5315
	or	 r2,r0,r21
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0.n	 ne,r13,@L5316
	or.u	 r13,r0,hi16(_optimize)
@L8111:
	ld	 r13,r13,lo16(_optimize)
	bcnd	 le0,r13,@L5317
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L8118
	or	 r2,r0,r25
	or	 r2,r0,r22
	bsr.n	 _force_reg
	or	 r3,r0,r23
	or	 r23,r0,r2
@L5317:
	or	 r2,r0,r25
@L8118:
	or	 r3,r0,r20
	or	 r4,r0,r23
@L7871:
	or	 r5,r0,r16
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L8479
@L8480:
	align	 4
@L5316:
	or	 r25,r0,r22
	bcnd.n	 eq0,r25,@L5320
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r24,r13,lo16(_mode_wider_mode)
	or	 r2,r0,r21
@L8119:
	or	 r3,r0,r25
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	cmp	 r2,r2,210
	bb1.n	 eq,r2,@L5321
	or	 r2,r0,r25
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	cmp	 r2,r2,210
	bb1.n	 ne,r2,@L7224
	or	 r2,r0,r25
@L5321:
	ld	 r25,r24[r25]
	bcnd.n	 ne0,r25,@L8119
	or	 r2,r0,r21
@L5320:
	bsr	 _abort
	align	 4
@L5315:
	cmp	 r13,r22,6
	extu	 r11,r13,1<eq>
	cmp	 r13,r21,4
	extu	 r13,r13,1<eq>
	and	 r13,r11,r13
	bcnd.n	 eq0,r13,@L5325
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L8481
@L8482:
	align	 4
@L5325:
	cmp	 r13,r21,2
	extu	 r9,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L5326
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L8483
@L8484:
	align	 4
@L5326:
	cmp	 r13,r21,1
	extu	 r10,r13,1<eq>
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L5327
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L8485
@L8486:
	align	 4
@L5327:
	cmp	 r13,r22,4
	extu	 r11,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L5328
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L8487
@L8488:
	align	 4
@L5328:
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L5329
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L8489
@L8490:
	align	 4
@L5329:
	cmp	 r13,r22,2
	extu	 r13,r13,1<eq>
	and	 r13,r13,r10
	bcnd.n	 eq0,r13,@L5330
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L8491
@L8492:
	align	 4
@L5330:
	bb1.n	 ge,r12,@L5331
	or	 r2,r0,r21
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	bsr.n	 _force_reg
	or	 r2,r0,r21
@L7870:
	or	 r3,r0,r2
	or	 r2,r0,r20
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L8493
@L8494:
	align	 4
@L5331:
	bsr	 _abort
	align	 4
@L7224:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
@L7873:
	or	 r3,r0,r2
	or	 r2,r0,r20
	or	 r4,r0,r19
@L7872:
	bsr.n	 _convert_move
	addu	 r1,r1,@L8495
@L8496:
	align	 4
@L5333:
	ld	 r11,r20,16
	or.u	 r12,r0,hi16(_add_optab)
	ld.bu	 r13,r11,8
	ld	 r12,r12,lo16(_add_optab)
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L5334
	st	 r12,r31,372
	ld	 r13,r11,20
	ld.bu	 r13,r13,8
	cmp	 r13,r13,25
	bb1	 ne,r13,@L5334
	ld	 r12,r20,20
	ld.bu	 r13,r12,8
	cmp	 r13,r13,105
	bb1.n	 ne,r13,@L5334
	or.u	 r13,r0,hi16(_frame_pointer_rtx)
	ld	 r12,r12,20
	ld	 r13,r13,lo16(_frame_pointer_rtx)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L5335
	or.u	 r13,r0,hi16(_stack_pointer_rtx)
	ld	 r13,r13,lo16(_stack_pointer_rtx)
	cmp	 r13,r12,r13
	bb0.n	 ne,r13,@L5335
	or.u	 r13,r0,hi16(_arg_pointer_rtx)
	ld	 r13,r13,lo16(_arg_pointer_rtx)
	cmp	 r13,r12,r13
	bb1	 ne,r13,@L5334
@L5335:
	ld	 r13,r20,16
	ld	 r11,r20,20
	ld	 r12,r20,16
	ld	 r13,r13,16
	st	 r13,r20,20
	st	 r11,r12,16
@L5334:
	ld	 r13,r20,16
	ld.bu	 r13,r13,8
	cmp	 r13,r13,25
	bb1.n	 ne,r13,@L5336
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r14]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,32
	bb1.n	 gt,r13,@L5336
	cmp	 r24,r19,1
	cmp	 r25,r19,3
	or	 r13,r24,r25
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L5337
	cmp	 r13,r14,4
	bb1	 ne,r13,@L5336
@L5337:
	ld	 r2,r20,20
	or	 r3,r0,r16
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,1
	ld	 r13,r20,16
	bsr.n	 _plus_constant_wide
	ld	 r3,r13,12
	or	 r13,r24,r25
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L5338
	or	 r16,r0,r2
	or	 r23,r0,0
	or	 r24,r0,0
	bcnd.n	 eq0,r17,@L5340
	or	 r22,r0,r16
	ld.hu	 r13,r0,r17
	cmp	 r13,r13,51
	ext	 r13,r13,1<eq>
	and	 r24,r17,r13
@L5340:
	ld.hu	 r12,r0,r16
	cmp	 r13,r12,63
	bb1.n	 ne,r13,@L5342
	cmp	 r13,r12,64
	or.u	 r13,r0,hi16(_add_optab)
	ld	 r23,r13,lo16(_add_optab)
	br	 @L5343
	align	 4
@L5342:
	bb1.n	 ne,r13,@L5344
	cmp	 r13,r12,66
	or.u	 r13,r0,hi16(_sub_optab)
	ld	 r23,r13,lo16(_sub_optab)
	br	 @L5343
	align	 4
@L5344:
	bb1	 ne,r13,@L5343
	ld	 r25,r16,8
	ld.hu	 r12,r0,r25
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5347
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5347
	mask	 r11,r12,0xffff
	cmp	 r13,r11,49
	cmp	 r12,r11,113
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L5347
	cmp	 r13,r11,51
	cmp	 r12,r25,r24
	or.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	subu	 r13,r13,1
	and	 r24,r24,r13
@L5347:
	ld	 r2,r22,4
	bsr.n	 _force_operand
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,0
	bsr.n	 _force_operand
	ld.bu	 r25,r22,2
	or	 r3,r0,r24
	or	 r5,r0,r17
	or	 r6,r0,0
	or	 r4,r0,r2
	bsr.n	 _expand_mult
	or	 r2,r0,r25
	br.n	 @L5338
	or	 r16,r0,r2
	align	 4
@L5343:
	bcnd	 eq0,r23,@L5348
	ld	 r25,r22,8
	ld.hu	 r12,r0,r25
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5349
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5349
	mask	 r11,r12,0xffff
	cmp	 r13,r11,49
	cmp	 r12,r11,113
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L5349
	cmp	 r13,r11,51
	cmp	 r12,r25,r24
	or.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	subu	 r13,r13,1
	and	 r24,r24,r13
@L5349:
	or.u	 r13,r0,hi16(_sub_optab)
	ld	 r13,r13,lo16(_sub_optab)
	cmp	 r13,r23,r13
	bb1.n	 ne,r13,@L8120
	or.u	 r13,r0,hi16(_add_optab)
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb1.n	 ne,r13,@L8120
	or.u	 r13,r0,hi16(_add_optab)
	ld.bu	 r2,r22,2
	or	 r3,r0,r25
	bsr.n	 _negate_rtx
	ld	 r23,r13,lo16(_add_optab)
	or	 r25,r0,r2
	or.u	 r13,r0,hi16(_add_optab)
@L8120:
	ld	 r13,r13,lo16(_add_optab)
	cmp	 r13,r23,r13
	bb1	 ne,r13,@L5351
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb1	 ne,r13,@L5351
	ld	 r4,r22,4
	ld.hu	 r13,r0,r4
	cmp	 r13,r13,63
	bb1	 ne,r13,@L5351
	ld	 r4,r4,4
	ld.hu	 r13,r0,r4
	cmp	 r13,r13,51
	bb1	 ne,r13,@L5351
	ld	 r13,r4,4
	subu	 r13,r13,64
	cmp	 r13,r13,3
	bb0	 ls,r13,@L5351
	ld.bu	 r2,r22,2
	or	 r3,r0,r23
	or	 r5,r0,r25
	or	 r6,r0,r24
	or	 r7,r0,0
	bsr.n	 _expand_binop
	or	 r8,r0,3
	ld	 r13,r22,4
	or	 r24,r0,r2
	ld	 r2,r13,8
	or	 r3,r0,0
	bsr.n	 _force_operand
	ld.bu	 r25,r22,2
	or	 r5,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,r23
	or	 r4,r0,r24
	or	 r6,r0,r17
	or	 r7,r0,0
	br.n	 @L7874
	or	 r8,r0,3
	align	 4
@L5351:
	ld	 r2,r22,4
	bsr.n	 _force_operand
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,0
	bsr.n	 _force_operand
	ld.bu	 r25,r22,2
	or	 r3,r0,r23
	or	 r4,r0,r24
	or	 r6,r0,r17
	or	 r7,r0,0
	or	 r8,r0,3
	or	 r5,r0,r2
	or	 r2,r0,r25
@L7874:
	bsr	 _expand_binop
	br.n	 @L5338
	or	 r16,r0,r2
	align	 4
@L5348:
	or	 r16,r0,r22
@L5338:
	br.n	 @L7200
	or	 r2,r0,r16
	align	 4
@L5336:
	ld	 r13,r20,20
	ld.bu	 r13,r13,8
	cmp	 r13,r13,25
	bb1.n	 ne,r13,@L8121
	cmp	 r13,r19,1
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r14]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,32
	bb1.n	 gt,r13,@L8121
	cmp	 r13,r19,1
	cmp	 r24,r19,1
	cmp	 r25,r19,3
	or	 r13,r24,r25
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L5354
	cmp	 r13,r14,4
	bb1.n	 ne,r13,@L5352
	cmp	 r13,r19,1
@L5354:
	ld	 r2,r20,16
	or	 r3,r0,r16
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,1
	ld	 r13,r20,20
	bsr.n	 _plus_constant_wide
	ld	 r3,r13,12
	or	 r13,r24,r25
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L7976
	or	 r18,r0,r2
	or	 r23,r0,0
	or	 r24,r0,0
	bcnd.n	 eq0,r17,@L5357
	or	 r22,r0,r18
	ld.hu	 r13,r0,r17
	cmp	 r13,r13,51
	ext	 r13,r13,1<eq>
	and	 r24,r17,r13
@L5357:
	ld.hu	 r12,r0,r18
	cmp	 r13,r12,63
	bb1.n	 ne,r13,@L5359
	cmp	 r13,r12,64
	or.u	 r13,r0,hi16(_add_optab)
	ld	 r23,r13,lo16(_add_optab)
	br	 @L5360
	align	 4
@L5359:
	bb1.n	 ne,r13,@L5361
	cmp	 r13,r12,66
	or.u	 r13,r0,hi16(_sub_optab)
	ld	 r23,r13,lo16(_sub_optab)
	br	 @L5360
	align	 4
@L5361:
	bb1	 ne,r13,@L5360
	ld	 r25,r18,8
	ld.hu	 r12,r0,r25
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5364
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5364
	mask	 r11,r12,0xffff
	cmp	 r13,r11,49
	cmp	 r12,r11,113
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L5364
	cmp	 r13,r11,51
	cmp	 r12,r25,r24
	or.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	subu	 r13,r13,1
	and	 r24,r24,r13
@L5364:
	ld	 r2,r22,4
	bsr.n	 _force_operand
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,0
	bsr.n	 _force_operand
	ld.bu	 r25,r22,2
	or	 r3,r0,r24
	or	 r5,r0,r17
	or	 r6,r0,0
	or	 r4,r0,r2
	bsr.n	 _expand_mult
	or	 r2,r0,r25
	br.n	 @L7976
	or	 r18,r0,r2
	align	 4
@L5360:
	bcnd	 eq0,r23,@L5365
	ld	 r25,r22,8
	ld.hu	 r12,r0,r25
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5366
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5366
	mask	 r11,r12,0xffff
	cmp	 r13,r11,49
	cmp	 r12,r11,113
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L5366
	cmp	 r13,r11,51
	cmp	 r12,r25,r24
	or.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	subu	 r13,r13,1
	and	 r24,r24,r13
@L5366:
	or.u	 r13,r0,hi16(_sub_optab)
	ld	 r13,r13,lo16(_sub_optab)
	cmp	 r13,r23,r13
	bb1.n	 ne,r13,@L8122
	or.u	 r13,r0,hi16(_add_optab)
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb1.n	 ne,r13,@L8122
	or.u	 r13,r0,hi16(_add_optab)
	ld.bu	 r2,r22,2
	or	 r3,r0,r25
	bsr.n	 _negate_rtx
	ld	 r23,r13,lo16(_add_optab)
	or	 r25,r0,r2
	or.u	 r13,r0,hi16(_add_optab)
@L8122:
	ld	 r13,r13,lo16(_add_optab)
	cmp	 r13,r23,r13
	bb1	 ne,r13,@L5368
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb1	 ne,r13,@L5368
	ld	 r4,r22,4
	ld.hu	 r13,r0,r4
	cmp	 r13,r13,63
	bb1	 ne,r13,@L5368
	ld	 r4,r4,4
	ld.hu	 r13,r0,r4
	cmp	 r13,r13,51
	bb1	 ne,r13,@L5368
	ld	 r13,r4,4
	subu	 r13,r13,64
	cmp	 r13,r13,3
	bb0	 ls,r13,@L5368
	ld.bu	 r2,r22,2
	or	 r3,r0,r23
	or	 r5,r0,r25
	or	 r6,r0,r24
	or	 r7,r0,0
	bsr.n	 _expand_binop
	or	 r8,r0,3
	ld	 r13,r22,4
	or	 r24,r0,r2
	ld	 r2,r13,8
	or	 r3,r0,0
	bsr.n	 _force_operand
	ld.bu	 r25,r22,2
	or	 r5,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,r23
	or	 r4,r0,r24
	or	 r6,r0,r17
	or	 r7,r0,0
	br.n	 @L7875
	or	 r8,r0,3
	align	 4
@L5368:
	ld	 r2,r22,4
	bsr.n	 _force_operand
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,0
	bsr.n	 _force_operand
	ld.bu	 r25,r22,2
	or	 r3,r0,r23
	or	 r4,r0,r24
	or	 r6,r0,r17
	or	 r7,r0,0
	or	 r8,r0,3
	or	 r5,r0,r2
	or	 r2,r0,r25
@L7875:
	bsr	 _expand_binop
	br.n	 @L7976
	or	 r18,r0,r2
	align	 4
@L5365:
	br.n	 @L7976
	or	 r18,r0,r22
	align	 4
@L5352:
@L8121:
	cmp	 r12,r19,3
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 ne0,r13,@L8123
	or	 r2,r0,r20
	cmp	 r13,r14,4
	bb1.n	 ne,r13,@L8124
	or	 r23,r0,r16
	or	 r2,r0,r20
	bsr.n	 _preexpand_calls
	or	 r21,r0,0
	ld	 r22,r20,20
	bcnd	 eq0,r16,@L5420
	ld.hu	 r13,r0,r16
	cmp	 r13,r13,53
	bb1	 ne,r13,@L5375
	ld	 r23,r16,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,51
	bb1	 ne,r13,@L5375
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L5373
	or	 r3,r0,0
@L5375:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8125
	or.u	 r13,r0,hi16(_tree_code_type)
	or.u	 r13,r0,hi16(_virtual_outgoing_args_rtx)
	ld	 r12,r23,4
	ld	 r11,r13,lo16(_virtual_outgoing_args_rtx)
	cmp	 r13,r12,r11
	bb0	 ne,r13,@L5420
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L8125
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r13,r12,4
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L5420
	or.u	 r13,r0,hi16(_tree_code_type)
@L8125:
	ld.bu	 r12,r22,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r13,r0,r13
	subu	 r11,r13,49
	or.u	 r13,r0,hi16(@L5418)
	cmp	 r12,r11,71
	bb0.n	 ls,r12,@L5379
	or	 r13,r13,lo16(@L5418)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L5418:
	word	 @L5388
	word	 @L5390
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5390
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5420
	word	 @L5380
	word	 @L5393
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5393
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5379
	word	 @L5382
	align	 4
@L5380:
	ld	 r21,r22,64
	br	 @L5379
	align	 4
@L5382:
	ld.bu	 r13,r22,8
	cmp	 r13,r13,3
	bb1.n	 ne,r13,@L5373
	or	 r3,r0,0
	ld	 r3,r22,16
	bcnd.n	 eq0,r3,@L5385
	or	 r25,r0,0
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5373
	or	 r3,r0,r25
@L5385:
	ld	 r3,r0,r22
	bcnd	 eq0,r3,@L5424
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd	 eq0,r2,@L8126
	or	 r25,r0,1
	br	 @L8126
	align	 4
@L5388:
	ld	 r3,r22,16
	br	 @L7877
	align	 4
@L5390:
	ld	 r3,r22,16
	or	 r2,r0,r23
	bsr.n	 _safe_from_p
	or	 r25,r0,0
	bcnd	 eq0,r2,@L5423
	ld	 r3,r22,20
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	cmp	 r2,r2,0
	br.n	 @L5423
	extu	 r25,r2,1<ne>
	align	 4
@L5393:
	ld.bu	 r13,r22,8
	subu	 r11,r13,39
	or.u	 r13,r0,hi16(@L5409)
	cmp	 r12,r11,67
	bb0.n	 ls,r12,@L5394
	or	 r13,r13,lo16(@L5409)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L5409:
	word	 @L5396
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5407
	word	 @L5398
	word	 @L5408
	word	 @L5405
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5394
	word	 @L5406
	word	 @L5403
	word	 @L5395
	align	 4
@L5395:
	bsr.n	 _staticp
	ld	 r2,r22,16
	br.n	 @L5373
	or	 r3,r0,r2
	align	 4
@L5396:
	ld.hu	 r13,r0,r23
	br.n	 @L7878
	cmp	 r13,r13,55
	align	 4
@L5398:
	ld	 r21,r22,24
	bcnd	 ne0,r21,@L7205
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,51
	bb1.n	 ne,r13,@L7878
	cmp	 r13,r12,55
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L7879
	cmp	 r13,r12,55
@L7878:
	bb1.n	 ne,r13,@L5394
	or	 r3,r0,0
	br	 @L5373
	align	 4
@L5403:
	ld	 r21,r22,20
	bcnd	 ne0,r21,@L7205
@L7879:
	br.n	 @L5373
	or	 r3,r0,0
	align	 4
@L5405:
	ld	 r21,r22,20
	br	 @L5394
	align	 4
@L5406:
	ld	 r21,r22,24
	br	 @L5394
	align	 4
@L5407:
	ld	 r3,r22,20
@L7877:
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	br.n	 @L5373
	or	 r3,r0,r2
	align	 4
@L5408:
	bsr	 _abort
	align	 4
@L5394:
	bcnd.n	 ne0,r21,@L7205
	or.u	 r13,r0,hi16(_tree_code_length)
	ld.bu	 r12,r22,8
	ld	 r13,r13,lo16(_tree_code_length)
	ld	 r18,r13[r12]
	cmp	 r13,r21,r18
	bb0.n	 lt,r13,@L5379
	or	 r24,r0,0
	mask	 r12,r18,3
	bcnd.n	 eq0,r12,@L5415
	or	 r25,r0,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L7618
	cmp	 r13,r12,2
	bb0	 gt,r13,@L7619
	ld	 r3,r22,16
	bcnd	 eq0,r3,@L7621
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5373
	or	 r3,r0,0
@L7621:
	addu	 r25,r22,4
	or	 r24,r0,1
@L7619:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7624
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5373
	or	 r3,r0,0
@L7624:
	addu	 r25,r25,4
	addu	 r24,r24,1
@L7618:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7627
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5373
	or	 r3,r0,0
@L7627:
	addu	 r24,r24,1
	cmp	 r13,r24,r18
	bb0.n	 lt,r13,@L5379
	addu	 r25,r25,4
@L5415:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7630
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5373
	or	 r3,r0,0
@L7630:
	ld	 r3,r25,20
	bcnd	 eq0,r3,@L7633
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5373
	or	 r3,r0,0
@L7633:
	ld	 r3,r25,24
	bcnd	 eq0,r3,@L7636
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5373
	or	 r3,r0,0
@L7636:
	ld	 r3,r25,28
	bcnd	 eq0,r3,@L7639
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5373
	or	 r3,r0,0
@L7639:
	addu	 r24,r24,4
	cmp	 r13,r24,r18
	bb1.n	 lt,r13,@L5415
	addu	 r25,r25,16
@L5379:
	bcnd.n	 eq0,r21,@L5373
	or	 r3,r0,1
@L7205:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L8127
	or	 r2,r0,r23
	ld	 r21,r21,4
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L8128
	or	 r3,r0,r21
	ld	 r13,r21,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L5373
	or	 r3,r0,0
@L8127:
	or	 r3,r0,r21
@L8128:
	bsr.n	 _rtx_equal_p
	or	 r25,r0,0
	bcnd.n	 ne0,r2,@L5373
	or	 r3,r0,r25
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1	 ne,r13,@L5424
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,55
	bb1	 ne,r13,@L5424
	ld	 r13,r22,8
	bb0	 (31-13),r13,@L5373
@L5424:
	or	 r25,r0,1
@L5423:
@L8126:
	br.n	 @L5373
	or	 r3,r0,r25
	align	 4
@L5420:
	or	 r3,r0,1
@L5373:
	ld	 r2,r20,16
	cmp	 r3,r3,0
	or	 r4,r0,0
	ext	 r3,r3,1<ne>
	or	 r5,r0,r19
	bsr.n	 _expand_expr
	and	 r3,r16,r3
	or	 r18,r0,r2
	ld	 r2,r20,20
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,r19
	ld.hu	 r13,r0,r18
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L5425
	or	 r16,r0,r2
	ld	 r13,r18,8
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5426
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5426
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L5425
@L5426:
	or	 r19,r0,r18
	or	 r18,r0,r16
	or	 r16,r0,r19
@L5425:
	ld.hu	 r13,r0,r16
	cmp	 r13,r13,63
	bb1	 ne,r13,@L5427
	ld	 r13,r16,8
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5428
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5428
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L5427
@L5428:
	ld	 r4,r16,4
	or.u	 r13,r0,hi16(_const0_rtx)
	or	 r2,r0,63
	ld	 r13,r13,lo16(_const0_rtx)
	or	 r3,r0,r14
	or	 r5,r0,r18
	bsr.n	 _simplify_binary_operation
	st	 r13,r31,128
	or	 r19,r0,r2
	bcnd	 eq0,r19,@L5429
	or	 r18,r0,r19
	br.n	 @L8292
	or	 r2,r0,r18
	align	 4
@L5429:
	ld.hu	 r13,r0,r18
	cmp	 r13,r13,66
	bb1.n	 ne,r13,@L5431
	or	 r2,r0,63
	ld	 r5,r16,4
	or	 r3,r0,r14
	br.n	 @L7880
	or	 r4,r0,r18
	align	 4
@L5431:
	ld	 r4,r16,4
	or	 r3,r0,r14
	or	 r5,r0,r18
@L7880:
	bsr	 _gen_rtx
	or	 r18,r0,r2
	or	 r2,r0,r18
@L8292:
	bsr.n	 _eliminate_constant_term
	addu	 r3,r31,128
	ld	 r4,r31,128
	ld	 r5,r16,8
	or	 r18,r0,r2
	or	 r2,r0,63
	bsr.n	 _simplify_binary_operation
	or	 r3,r0,r14
	or	 r19,r0,r2
	bcnd	 eq0,r19,@L5433
	or	 r16,r0,r19
	br	 @L5427
	align	 4
@L5433:
	ld	 r4,r31,128
	ld	 r5,r16,8
	or	 r2,r0,63
	bsr.n	 _gen_rtx
	or	 r3,r0,r14
	or	 r16,r0,r2
@L5427:
	ld.hu	 r12,r0,r18
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5436
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5436
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 ne0,r12,@L8129
	or	 r19,r0,r16
	ld.hu	 r13,r0,r16
	cmp	 r13,r13,66
	bb1.n	 ne,r13,@L8130
	or	 r2,r0,63
@L5436:
	or	 r19,r0,r16
@L8129:
	or	 r16,r0,r18
	or	 r18,r0,r19
	or	 r2,r0,63
@L8130:
	or	 r3,r0,r14
	or	 r4,r0,r18
	bsr.n	 _simplify_binary_operation
	or	 r5,r0,r16
	or	 r19,r0,r2
	bcnd	 ne0,r19,@L7200
	or	 r2,r0,63
	or	 r3,r0,r14
	or	 r4,r0,r18
	or	 r5,r0,r16
	bsr	 _gen_rtx
	br	 @L7200
	align	 4
@L5438:
	cmp	 r13,r19,1
	cmp	 r12,r19,3
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5439
	bsr.n	 _really_constant_p
	ld	 r2,r20,16
	bcnd	 eq0,r2,@L5439
	bsr.n	 _really_constant_p
	ld	 r2,r20,20
	bcnd	 eq0,r2,@L5439
	ld	 r2,r20,16
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,r19
	or	 r25,r0,r2
	ld	 r2,r20,20
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,r19
	or	 r5,r0,r2
	br.n	 @L7881
	or	 r2,r0,64
	align	 4
@L5439:
	ld	 r4,r20,20
	ld.bu	 r13,r4,8
	cmp	 r13,r13,25
	bb1.n	 ne,r13,@L5440
	or.u	 r13,r0,hi16(_sub_optab)
	ld	 r3,r31,172
	or	 r2,r0,72
	bsr.n	 _build1
	ld	 r25,r20,16
	bsr	 _fold
	ld	 r3,r31,172
	or	 r5,r0,r2
	or	 r2,r0,53
	bsr.n	 _build
	or	 r4,r0,r25
	br.n	 @L5333
	or	 r20,r0,r2
	align	 4
@L5440:
	ld	 r13,r13,lo16(_sub_optab)
	br.n	 @L5371
	st	 r13,r31,372
	align	 4
@L5441:
	bsr.n	 _preexpand_calls
	or	 r2,r0,r20
	ld	 r12,r20,16
	ld.bu	 r13,r12,8
	cmp	 r13,r13,25
	bb1.n	 ne,r13,@L8131
	cmp	 r13,r19,1
	ld	 r13,r20,20
	st	 r13,r20,16
	st	 r12,r20,20
	cmp	 r13,r19,1
@L8131:
	cmp	 r12,r14,4
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5443
	ld	 r13,r20,20
	ld.bu	 r13,r13,8
	cmp	 r13,r13,25
	bb1.n	 ne,r13,@L5443
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r14]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,32
	bb1	 gt,r13,@L5443
	ld	 r2,r20,16
	or	 r3,r0,r16
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,1
	or	 r18,r0,r2
	ld.hu	 r13,r0,r18
	cmp	 r13,r13,63
	bb1	 ne,r13,@L5444
	ld	 r13,r18,8
	ld.hu	 r13,r0,r13
	cmp	 r13,r13,46
	bb1	 ne,r13,@L5444
	ld	 r13,r20,20
	or	 r2,r0,46
	ld	 r4,r13,12
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	ld	 r25,r18,4
	or	 r5,r0,r2
	or	 r2,r0,66
	or	 r3,r0,r14
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	ld	 r13,r20,20
	ld	 r12,r18,8
	ld	 r13,r13,12
	ld	 r4,r12,4
	mul	 r4,r13,r4
	or	 r25,r0,r2
	or	 r2,r0,46
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	or	 r5,r0,r2
	or	 r2,r0,63
@L7881:
	or	 r3,r0,r14
	or	 r4,r0,r25
	bsr	 _gen_rtx
	br	 @L7200
	align	 4
@L5444:
	ld.hu	 r12,r0,r18
	cmp	 r13,r12,51
	bb0.n	 ne,r13,@L5459
	or	 r22,r0,0
	or	 r24,r0,0
	cmp	 r13,r12,63
	bb1.n	 ne,r13,@L5449
	or	 r23,r0,r18
	or.u	 r13,r0,hi16(_add_optab)
	ld	 r22,r13,lo16(_add_optab)
	br	 @L5450
	align	 4
@L5449:
	cmp	 r13,r12,64
	bb1.n	 ne,r13,@L5451
	cmp	 r13,r12,66
	or.u	 r13,r0,hi16(_sub_optab)
	ld	 r22,r13,lo16(_sub_optab)
	br	 @L5450
	align	 4
@L5451:
	bb1	 ne,r13,@L5450
	ld	 r25,r18,8
	ld.hu	 r12,r0,r25
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5454
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1	 ls,r13,@L5454
	or	 r24,r0,0
@L5454:
	ld	 r2,r23,4
	bsr.n	 _force_operand
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,0
	bsr.n	 _force_operand
	ld.bu	 r25,r23,2
	or	 r3,r0,r24
	or	 r5,r0,0
	or	 r6,r0,0
	or	 r4,r0,r2
	bsr.n	 _expand_mult
	or	 r2,r0,r25
	br.n	 @L5445
	or	 r18,r0,r2
	align	 4
@L5450:
	bcnd	 eq0,r22,@L5455
	ld	 r25,r23,8
	ld.hu	 r12,r0,r25
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5456
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5456
	mask	 r11,r12,0xffff
	cmp	 r13,r11,49
	cmp	 r12,r11,113
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L5456
	cmp	 r13,r11,51
	cmp	 r12,r25,r24
	or.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	subu	 r13,r13,1
	and	 r24,r24,r13
@L5456:
	or.u	 r13,r0,hi16(_sub_optab)
	ld	 r13,r13,lo16(_sub_optab)
	cmp	 r13,r22,r13
	bb1.n	 ne,r13,@L8132
	or.u	 r13,r0,hi16(_add_optab)
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb1.n	 ne,r13,@L8132
	or.u	 r13,r0,hi16(_add_optab)
	ld.bu	 r2,r23,2
	or	 r3,r0,r25
	bsr.n	 _negate_rtx
	ld	 r22,r13,lo16(_add_optab)
	or	 r25,r0,r2
	or.u	 r13,r0,hi16(_add_optab)
@L8132:
	ld	 r13,r13,lo16(_add_optab)
	cmp	 r13,r22,r13
	bb1	 ne,r13,@L5458
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb1	 ne,r13,@L5458
	ld	 r4,r23,4
	ld.hu	 r13,r0,r4
	cmp	 r13,r13,63
	bb1	 ne,r13,@L5458
	ld	 r4,r4,4
	ld.hu	 r13,r0,r4
	cmp	 r13,r13,51
	bb1	 ne,r13,@L5458
	ld	 r13,r4,4
	subu	 r13,r13,64
	cmp	 r13,r13,3
	bb0	 ls,r13,@L5458
	ld.bu	 r2,r23,2
	or	 r3,r0,r22
	or	 r5,r0,r25
	or	 r6,r0,r24
	or	 r7,r0,0
	bsr.n	 _expand_binop
	or	 r8,r0,3
	ld	 r13,r23,4
	or	 r24,r0,r2
	ld	 r2,r13,8
	or	 r3,r0,0
	bsr.n	 _force_operand
	ld.bu	 r25,r23,2
	or	 r5,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,r22
	or	 r4,r0,r24
	or	 r6,r0,0
	or	 r7,r0,0
	br.n	 @L7882
	or	 r8,r0,3
	align	 4
@L5458:
	ld	 r2,r23,4
	bsr.n	 _force_operand
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,0
	bsr.n	 _force_operand
	ld.bu	 r25,r23,2
	or	 r3,r0,r22
	or	 r4,r0,r24
	or	 r6,r0,0
	or	 r7,r0,0
	or	 r8,r0,3
	or	 r5,r0,r2
	or	 r2,r0,r25
@L7882:
	bsr	 _expand_binop
	br.n	 @L5445
	or	 r18,r0,r2
	align	 4
@L5455:
	or	 r18,r0,r23
@L5445:
	ld.hu	 r13,r0,r18
	cmp	 r13,r13,51
	bb0.n	 ne,r13,@L5459
	or	 r2,r0,r14
	bsr.n	 _copy_to_mode_reg
	or	 r3,r0,r18
	or	 r18,r0,r2
@L5459:
	ld	 r13,r20,20
	or	 r2,r0,46
	ld	 r4,r13,12
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	or	 r5,r0,r2
	or	 r2,r0,66
	or	 r3,r0,r14
	or	 r4,r0,r18
	bsr	 _gen_rtx
	br	 @L7200
	align	 4
@L5443:
	ld	 r22,r20,20
	or	 r23,r0,r16
	bcnd.n	 eq0,r16,@L5508
	or	 r21,r0,0
	ld.hu	 r13,r0,r16
	cmp	 r13,r13,53
	bb1	 ne,r13,@L5463
	ld	 r23,r16,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,51
	bb1	 ne,r13,@L5463
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L5461
	or	 r2,r0,0
@L5463:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8133
	or.u	 r13,r0,hi16(_tree_code_type)
	or.u	 r13,r0,hi16(_virtual_outgoing_args_rtx)
	ld	 r12,r23,4
	ld	 r11,r13,lo16(_virtual_outgoing_args_rtx)
	cmp	 r13,r12,r11
	bb0	 ne,r13,@L5508
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L8133
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r13,r12,4
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L5508
	or.u	 r13,r0,hi16(_tree_code_type)
@L8133:
	ld.bu	 r12,r22,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r13,r0,r13
	subu	 r11,r13,49
	or.u	 r13,r0,hi16(@L5506)
	cmp	 r12,r11,71
	bb0.n	 ls,r12,@L5467
	or	 r13,r13,lo16(@L5506)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L5506:
	word	 @L5476
	word	 @L5478
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5478
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5508
	word	 @L5468
	word	 @L5481
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5481
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5467
	word	 @L5470
	align	 4
@L5468:
	ld	 r21,r22,64
	br	 @L5467
	align	 4
@L5470:
	ld.bu	 r13,r22,8
	cmp	 r13,r13,3
	bb1.n	 ne,r13,@L5461
	or	 r2,r0,0
	ld	 r3,r22,16
	bcnd.n	 eq0,r3,@L5473
	or	 r25,r0,0
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5461
	or	 r2,r0,r25
@L5473:
	ld	 r3,r0,r22
	bcnd	 eq0,r3,@L5512
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5461
	or	 r2,r0,r25
	br.n	 @L8134
	or	 r25,r0,1
	align	 4
@L5476:
	ld	 r3,r22,16
	br.n	 @L8135
	or	 r2,r0,r23
	align	 4
@L5478:
	ld	 r3,r22,16
	or	 r2,r0,r23
	bsr.n	 _safe_from_p
	or	 r25,r0,0
	bcnd	 eq0,r2,@L5511
	ld	 r3,r22,20
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	cmp	 r2,r2,0
	br.n	 @L5511
	extu	 r25,r2,1<ne>
	align	 4
@L5481:
	ld.bu	 r13,r22,8
	subu	 r11,r13,39
	or.u	 r13,r0,hi16(@L5497)
	cmp	 r12,r11,67
	bb0.n	 ls,r12,@L5482
	or	 r13,r13,lo16(@L5497)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L5497:
	word	 @L5484
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5495
	word	 @L5486
	word	 @L5496
	word	 @L5493
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5482
	word	 @L5494
	word	 @L5491
	word	 @L5483
	align	 4
@L5483:
	ld	 r2,r22,16
	bsr.n	 _staticp
	addu	 r1,r1,@L8497
@L8498:
	align	 4
@L5484:
	ld.hu	 r13,r0,r23
	br.n	 @L7885
	cmp	 r13,r13,55
	align	 4
@L5486:
	ld	 r21,r22,24
	bcnd	 ne0,r21,@L7206
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,51
	bb1.n	 ne,r13,@L7885
	cmp	 r13,r12,55
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L7886
	cmp	 r13,r12,55
@L7885:
	bb1.n	 ne,r13,@L5482
	or	 r2,r0,0
	br	 @L5461
	align	 4
@L5491:
	ld	 r21,r22,20
	bcnd	 ne0,r21,@L7206
@L7886:
	br.n	 @L5461
	or	 r2,r0,0
	align	 4
@L5493:
	ld	 r21,r22,20
	br	 @L5482
	align	 4
@L5494:
	ld	 r21,r22,24
	br	 @L5482
	align	 4
@L5495:
	ld	 r3,r22,20
	or	 r2,r0,r23
@L8135:
	bsr.n	 _safe_from_p
	addu	 r1,r1,@L8499
@L8500:
	align	 4
@L5496:
	bsr	 _abort
	align	 4
@L5482:
	bcnd.n	 ne0,r21,@L7206
	or.u	 r13,r0,hi16(_tree_code_length)
	ld.bu	 r12,r22,8
	ld	 r13,r13,lo16(_tree_code_length)
	ld	 r19,r13[r12]
	cmp	 r13,r21,r19
	bb0.n	 lt,r13,@L5467
	or	 r24,r0,0
	mask	 r12,r19,3
	bcnd.n	 eq0,r12,@L5503
	or	 r25,r0,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L7592
	cmp	 r13,r12,2
	bb0	 gt,r13,@L7593
	ld	 r3,r22,16
	bcnd	 eq0,r3,@L7595
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5461
	or	 r2,r0,0
@L7595:
	addu	 r25,r22,4
	or	 r24,r0,1
@L7593:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7598
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5461
	or	 r2,r0,0
@L7598:
	addu	 r25,r25,4
	addu	 r24,r24,1
@L7592:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7601
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5461
	or	 r2,r0,0
@L7601:
	addu	 r24,r24,1
	cmp	 r13,r24,r19
	bb0.n	 lt,r13,@L5467
	addu	 r25,r25,4
@L5503:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7604
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5461
	or	 r2,r0,0
@L7604:
	ld	 r3,r25,20
	bcnd	 eq0,r3,@L7607
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5461
	or	 r2,r0,0
@L7607:
	ld	 r3,r25,24
	bcnd	 eq0,r3,@L7610
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5461
	or	 r2,r0,0
@L7610:
	ld	 r3,r25,28
	bcnd	 eq0,r3,@L7613
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5461
	or	 r2,r0,0
@L7613:
	addu	 r24,r24,4
	cmp	 r13,r24,r19
	bb1.n	 lt,r13,@L5503
	addu	 r25,r25,16
@L5467:
	bcnd.n	 eq0,r21,@L5461
	or	 r2,r0,1
@L7206:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L8136
	or	 r2,r0,r23
	ld	 r21,r21,4
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L8137
	or	 r3,r0,r21
	ld	 r13,r21,4
	cmp	 r13,r13,63
	bb1	 le,r13,@L7886
@L8136:
	or	 r3,r0,r21
@L8137:
	bsr.n	 _rtx_equal_p
	or	 r25,r0,0
	bcnd	 ne0,r2,@L5511
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1	 ne,r13,@L5512
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,55
	bb1	 ne,r13,@L5512
	ld	 r13,r22,8
	bb0.n	 (31-13),r13,@L5461
	or	 r2,r0,r25
@L5512:
	or	 r25,r0,1
@L5511:
@L8134:
	br.n	 @L5461
	or	 r2,r0,r25
	align	 4
@L5508:
	or	 r2,r0,1
@L5461:
	ld	 r11,r20,16
	cmp	 r13,r2,0
	ld.bu	 r12,r11,8
	ext	 r13,r13,1<ne>
	cmp	 r12,r12,102
	bb1.n	 ne,r12,@L5513
	and	 r16,r16,r13
	ld	 r15,r31,172
	ld.bu	 r13,r15,8
	cmp	 r13,r13,7
	bb1	 ne,r13,@L5513
	ld	 r13,r11,16
	ld	 r12,r11,4
	ld	 r3,r13,4
	ld.bu	 r12,r12,25
	ld.bu	 r13,r3,25
	cmp	 r13,r13,r12
	bb0	 lo,r13,@L5513
	ld	 r2,r20,20
	ld.bu	 r13,r2,8
	cmp	 r13,r13,25
	bb1	 ne,r13,@L5515
	bsr	 _int_fits_type_p
	bcnd	 eq0,r2,@L5515
	ld	 r11,r20,20
	ld	 r12,r11,4
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r12,24
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r12]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,32
	bb1	 gt,r13,@L5514
	bsr.n	 _exact_log2_wide
	ld	 r2,r11,12
	bcnd	 lt0,r2,@L5514
@L5515:
	ld	 r12,r20,20
	ld.bu	 r13,r12,8
	cmp	 r13,r13,102
	bb1	 ne,r13,@L5513
	ld	 r13,r20,16
	ld	 r12,r12,16
	ld	 r13,r13,16
	ld	 r11,r12,4
	ld	 r10,r13,4
	ld.bu	 r13,r11,25
	ld.bu	 r12,r10,25
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L5513
	ld	 r13,r11,8
	ld	 r12,r10,8
	or.u	 r11,r0,0x2
	and	 r13,r13,r11
	and	 r12,r12,r11
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L5513
@L5514:
	ld	 r13,r20,16
	ld	 r13,r13,16
	ld	 r13,r13,4
	ld	 r12,r13,8
	ld.bu	 r11,r13,24
	bb0.n	 (31-14),r12,@L5516
	or.u	 r13,r0,hi16(_umul_widen_optab)
	ld	 r13,r13,lo16(_umul_widen_optab)
	br.n	 @L8138
	st	 r13,r31,372
	align	 4
@L5516:
	or.u	 r13,r0,hi16(_smul_widen_optab)
	ld	 r13,r13,lo16(_smul_widen_optab)
	st	 r13,r31,372
@L8138:
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r13,r13,lo16(_mode_wider_mode)
	ld	 r13,r13[r11]
	cmp	 r13,r14,r13
	bb1	 ne,r13,@L5513
	ld	 r15,r31,372
	lda.d	 r13,r15[r14]
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L5513
	ld	 r13,r20,16
	or	 r3,r0,0
	or	 r4,r0,0
	ld	 r2,r13,16
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld	 r3,r20,20
	ld.bu	 r13,r3,8
	cmp	 r13,r13,25
	bb1.n	 ne,r13,@L5519
	or	 r18,r0,r2
	br.n	 @L7888
	or	 r2,r0,r3
	align	 4
@L5519:
	ld	 r2,r3,16
	br.n	 @L8139
	or	 r3,r0,0
	align	 4
@L5513:
	ld	 r2,r20,16
	or	 r3,r0,r16
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r18,r0,r2
	ld	 r2,r20,20
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld	 r6,r31,120
	or	 r16,r0,r2
	or	 r2,r0,r14
	or	 r3,r0,r18
	or	 r5,r0,r17
	or	 r4,r0,r16
	bsr	 _expand_mult
	br	 @L7200
	align	 4
@L5526:
	or	 r2,r0,r20
	or	 r23,r0,r16
	bsr.n	 _preexpand_calls
	or	 r21,r0,0
	ld	 r22,r20,20
	bcnd	 eq0,r16,@L5575
	ld.hu	 r13,r0,r16
	cmp	 r13,r13,53
	bb1	 ne,r13,@L5530
	ld	 r23,r16,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,51
	bb1	 ne,r13,@L5530
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L5528
	or	 r3,r0,0
@L5530:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8140
	or.u	 r13,r0,hi16(_tree_code_type)
	or.u	 r13,r0,hi16(_virtual_outgoing_args_rtx)
	ld	 r12,r23,4
	ld	 r11,r13,lo16(_virtual_outgoing_args_rtx)
	cmp	 r13,r12,r11
	bb0	 ne,r13,@L5575
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L8140
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r13,r12,4
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L5575
	or.u	 r13,r0,hi16(_tree_code_type)
@L8140:
	ld.bu	 r12,r22,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r13,r0,r13
	subu	 r11,r13,49
	or.u	 r13,r0,hi16(@L5573)
	cmp	 r12,r11,71
	bb0.n	 ls,r12,@L5534
	or	 r13,r13,lo16(@L5573)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L5573:
	word	 @L5543
	word	 @L5545
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5545
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5575
	word	 @L5535
	word	 @L5548
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5548
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5534
	word	 @L5537
	align	 4
@L5535:
	ld	 r21,r22,64
	br	 @L5534
	align	 4
@L5537:
	ld.bu	 r13,r22,8
	cmp	 r13,r13,3
	bb1.n	 ne,r13,@L5528
	or	 r3,r0,0
	ld	 r3,r22,16
	bcnd.n	 eq0,r3,@L5540
	or	 r25,r0,0
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5528
	or	 r3,r0,r25
@L5540:
	ld	 r3,r0,r22
	bcnd	 eq0,r3,@L5579
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd	 eq0,r2,@L8141
	or	 r25,r0,1
	br	 @L8141
	align	 4
@L5543:
	ld	 r3,r22,16
	br	 @L7890
	align	 4
@L5545:
	ld	 r3,r22,16
	or	 r2,r0,r23
	bsr.n	 _safe_from_p
	or	 r25,r0,0
	bcnd	 eq0,r2,@L5578
	ld	 r3,r22,20
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	cmp	 r2,r2,0
	br.n	 @L5578
	extu	 r25,r2,1<ne>
	align	 4
@L5548:
	ld.bu	 r13,r22,8
	subu	 r11,r13,39
	or.u	 r13,r0,hi16(@L5564)
	cmp	 r12,r11,67
	bb0.n	 ls,r12,@L5549
	or	 r13,r13,lo16(@L5564)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L5564:
	word	 @L5551
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5562
	word	 @L5553
	word	 @L5563
	word	 @L5560
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5549
	word	 @L5561
	word	 @L5558
	word	 @L5550
	align	 4
@L5550:
	bsr.n	 _staticp
	ld	 r2,r22,16
	br.n	 @L5528
	or	 r3,r0,r2
	align	 4
@L5551:
	ld.hu	 r13,r0,r23
	br.n	 @L7891
	cmp	 r13,r13,55
	align	 4
@L5553:
	ld	 r21,r22,24
	bcnd	 ne0,r21,@L7207
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,51
	bb1.n	 ne,r13,@L7891
	cmp	 r13,r12,55
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L7892
	cmp	 r13,r12,55
@L7891:
	bb1.n	 ne,r13,@L5549
	or	 r3,r0,0
	br	 @L5528
	align	 4
@L5558:
	ld	 r21,r22,20
	bcnd	 ne0,r21,@L7207
@L7892:
	br.n	 @L5528
	or	 r3,r0,0
	align	 4
@L5560:
	ld	 r21,r22,20
	br	 @L5549
	align	 4
@L5561:
	ld	 r21,r22,24
	br	 @L5549
	align	 4
@L5562:
	ld	 r3,r22,20
@L7890:
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	br.n	 @L5528
	or	 r3,r0,r2
	align	 4
@L5563:
	bsr	 _abort
	align	 4
@L5549:
	bcnd.n	 ne0,r21,@L7207
	or.u	 r13,r0,hi16(_tree_code_length)
	ld.bu	 r12,r22,8
	ld	 r13,r13,lo16(_tree_code_length)
	ld	 r19,r13[r12]
	cmp	 r13,r21,r19
	bb0.n	 lt,r13,@L5534
	or	 r24,r0,0
	mask	 r12,r19,3
	bcnd.n	 eq0,r12,@L5570
	or	 r25,r0,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L7566
	cmp	 r13,r12,2
	bb0	 gt,r13,@L7567
	ld	 r3,r22,16
	bcnd	 eq0,r3,@L7569
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5528
	or	 r3,r0,0
@L7569:
	addu	 r25,r22,4
	or	 r24,r0,1
@L7567:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7572
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5528
	or	 r3,r0,0
@L7572:
	addu	 r25,r25,4
	addu	 r24,r24,1
@L7566:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7575
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5528
	or	 r3,r0,0
@L7575:
	addu	 r24,r24,1
	cmp	 r13,r24,r19
	bb0.n	 lt,r13,@L5534
	addu	 r25,r25,4
@L5570:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7578
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5528
	or	 r3,r0,0
@L7578:
	ld	 r3,r25,20
	bcnd	 eq0,r3,@L7581
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5528
	or	 r3,r0,0
@L7581:
	ld	 r3,r25,24
	bcnd	 eq0,r3,@L7584
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5528
	or	 r3,r0,0
@L7584:
	ld	 r3,r25,28
	bcnd	 eq0,r3,@L7587
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5528
	or	 r3,r0,0
@L7587:
	addu	 r24,r24,4
	cmp	 r13,r24,r19
	bb1.n	 lt,r13,@L5570
	addu	 r25,r25,16
@L5534:
	bcnd.n	 eq0,r21,@L5528
	or	 r3,r0,1
@L7207:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L8142
	or	 r2,r0,r23
	ld	 r21,r21,4
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L8143
	or	 r3,r0,r21
	ld	 r13,r21,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L5528
	or	 r3,r0,0
@L8142:
	or	 r3,r0,r21
@L8143:
	bsr.n	 _rtx_equal_p
	or	 r25,r0,0
	bcnd.n	 ne0,r2,@L5528
	or	 r3,r0,r25
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1	 ne,r13,@L5579
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,55
	bb1	 ne,r13,@L5579
	ld	 r13,r22,8
	bb0	 (31-13),r13,@L5528
@L5579:
	or	 r25,r0,1
@L5578:
@L8141:
	br.n	 @L5528
	or	 r3,r0,r25
	align	 4
@L5575:
	or	 r3,r0,1
@L5528:
	ld	 r2,r20,16
	cmp	 r3,r3,0
	or	 r4,r0,0
	ext	 r3,r3,1<ne>
	or	 r5,r0,0
	bsr.n	 _expand_expr
	and	 r3,r16,r3
	or	 r18,r0,r2
	ld	 r2,r20,20
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld	 r8,r31,120
	ld	 r3,r31,180
	or	 r16,r0,r2
	br.n	 @L7893
	or	 r2,r0,0
	align	 4
@L5580:
	or.u	 r13,r0,hi16(_flodiv_optab)
	ld	 r13,r13,lo16(_flodiv_optab)
	br.n	 @L5371
	st	 r13,r31,372
	align	 4
@L5584:
	or	 r2,r0,r20
	or	 r23,r0,r16
	bsr.n	 _preexpand_calls
	or	 r21,r0,0
	ld	 r22,r20,20
	bcnd	 eq0,r16,@L5633
	ld.hu	 r13,r0,r16
	cmp	 r13,r13,53
	bb1	 ne,r13,@L5588
	ld	 r23,r16,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,51
	bb1	 ne,r13,@L5588
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L5586
	or	 r3,r0,0
@L5588:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8144
	or.u	 r13,r0,hi16(_tree_code_type)
	or.u	 r13,r0,hi16(_virtual_outgoing_args_rtx)
	ld	 r12,r23,4
	ld	 r11,r13,lo16(_virtual_outgoing_args_rtx)
	cmp	 r13,r12,r11
	bb0	 ne,r13,@L5633
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L8144
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r13,r12,4
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L5633
	or.u	 r13,r0,hi16(_tree_code_type)
@L8144:
	ld.bu	 r12,r22,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r13,r0,r13
	subu	 r11,r13,49
	or.u	 r13,r0,hi16(@L5631)
	cmp	 r12,r11,71
	bb0.n	 ls,r12,@L5592
	or	 r13,r13,lo16(@L5631)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L5631:
	word	 @L5601
	word	 @L5603
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5603
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5633
	word	 @L5593
	word	 @L5606
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5606
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5592
	word	 @L5595
	align	 4
@L5593:
	ld	 r21,r22,64
	br	 @L5592
	align	 4
@L5595:
	ld.bu	 r13,r22,8
	cmp	 r13,r13,3
	bb1.n	 ne,r13,@L5586
	or	 r3,r0,0
	ld	 r3,r22,16
	bcnd.n	 eq0,r3,@L5598
	or	 r25,r0,0
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5586
	or	 r3,r0,r25
@L5598:
	ld	 r3,r0,r22
	bcnd	 eq0,r3,@L5637
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd	 eq0,r2,@L8145
	or	 r25,r0,1
	br	 @L8145
	align	 4
@L5601:
	ld	 r3,r22,16
	br	 @L7895
	align	 4
@L5603:
	ld	 r3,r22,16
	or	 r2,r0,r23
	bsr.n	 _safe_from_p
	or	 r25,r0,0
	bcnd	 eq0,r2,@L5636
	ld	 r3,r22,20
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	cmp	 r2,r2,0
	br.n	 @L5636
	extu	 r25,r2,1<ne>
	align	 4
@L5606:
	ld.bu	 r13,r22,8
	subu	 r11,r13,39
	or.u	 r13,r0,hi16(@L5622)
	cmp	 r12,r11,67
	bb0.n	 ls,r12,@L5607
	or	 r13,r13,lo16(@L5622)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L5622:
	word	 @L5609
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5620
	word	 @L5611
	word	 @L5621
	word	 @L5618
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5607
	word	 @L5619
	word	 @L5616
	word	 @L5608
	align	 4
@L5608:
	bsr.n	 _staticp
	ld	 r2,r22,16
	br.n	 @L5586
	or	 r3,r0,r2
	align	 4
@L5609:
	ld.hu	 r13,r0,r23
	br.n	 @L7896
	cmp	 r13,r13,55
	align	 4
@L5611:
	ld	 r21,r22,24
	bcnd	 ne0,r21,@L7208
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,51
	bb1.n	 ne,r13,@L7896
	cmp	 r13,r12,55
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L7897
	cmp	 r13,r12,55
@L7896:
	bb1.n	 ne,r13,@L5607
	or	 r3,r0,0
	br	 @L5586
	align	 4
@L5616:
	ld	 r21,r22,20
	bcnd	 ne0,r21,@L7208
@L7897:
	br.n	 @L5586
	or	 r3,r0,0
	align	 4
@L5618:
	ld	 r21,r22,20
	br	 @L5607
	align	 4
@L5619:
	ld	 r21,r22,24
	br	 @L5607
	align	 4
@L5620:
	ld	 r3,r22,20
@L7895:
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	br.n	 @L5586
	or	 r3,r0,r2
	align	 4
@L5621:
	bsr	 _abort
	align	 4
@L5607:
	bcnd.n	 ne0,r21,@L7208
	or.u	 r13,r0,hi16(_tree_code_length)
	ld.bu	 r12,r22,8
	ld	 r13,r13,lo16(_tree_code_length)
	ld	 r19,r13[r12]
	cmp	 r13,r21,r19
	bb0.n	 lt,r13,@L5592
	or	 r24,r0,0
	mask	 r12,r19,3
	bcnd.n	 eq0,r12,@L5628
	or	 r25,r0,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L7540
	cmp	 r13,r12,2
	bb0	 gt,r13,@L7541
	ld	 r3,r22,16
	bcnd	 eq0,r3,@L7543
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5586
	or	 r3,r0,0
@L7543:
	addu	 r25,r22,4
	or	 r24,r0,1
@L7541:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7546
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5586
	or	 r3,r0,0
@L7546:
	addu	 r25,r25,4
	addu	 r24,r24,1
@L7540:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7549
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5586
	or	 r3,r0,0
@L7549:
	addu	 r24,r24,1
	cmp	 r13,r24,r19
	bb0.n	 lt,r13,@L5592
	addu	 r25,r25,4
@L5628:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7552
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5586
	or	 r3,r0,0
@L7552:
	ld	 r3,r25,20
	bcnd	 eq0,r3,@L7555
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5586
	or	 r3,r0,0
@L7555:
	ld	 r3,r25,24
	bcnd	 eq0,r3,@L7558
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5586
	or	 r3,r0,0
@L7558:
	ld	 r3,r25,28
	bcnd	 eq0,r3,@L7561
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5586
	or	 r3,r0,0
@L7561:
	addu	 r24,r24,4
	cmp	 r13,r24,r19
	bb1.n	 lt,r13,@L5628
	addu	 r25,r25,16
@L5592:
	bcnd.n	 eq0,r21,@L5586
	or	 r3,r0,1
@L7208:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L8146
	or	 r2,r0,r23
	ld	 r21,r21,4
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L8147
	or	 r3,r0,r21
	ld	 r13,r21,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L5586
	or	 r3,r0,0
@L8146:
	or	 r3,r0,r21
@L8147:
	bsr.n	 _rtx_equal_p
	or	 r25,r0,0
	bcnd.n	 ne0,r2,@L5586
	or	 r3,r0,r25
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1	 ne,r13,@L5637
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,55
	bb1	 ne,r13,@L5637
	ld	 r13,r22,8
	bb0	 (31-13),r13,@L5586
@L5637:
	or	 r25,r0,1
@L5636:
@L8145:
	br.n	 @L5586
	or	 r3,r0,r25
	align	 4
@L5633:
	or	 r3,r0,1
@L5586:
	ld	 r2,r20,16
	cmp	 r3,r3,0
	or	 r4,r0,0
	ext	 r3,r3,1<ne>
	or	 r5,r0,0
	bsr.n	 _expand_expr
	and	 r3,r16,r3
	or	 r18,r0,r2
	ld	 r2,r20,20
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld	 r8,r31,120
	ld	 r3,r31,180
	or	 r16,r0,r2
	or	 r2,r0,1
@L7893:
	or	 r4,r0,r14
	or	 r5,r0,r18
	or	 r7,r0,r17
	or	 r6,r0,r16
	bsr	 _expand_divmod
	br	 @L7200
	align	 4
@L5640:
	bsr	 _abort
	align	 4
@L5641:
	ld	 r2,r20,16
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	bcnd.n	 ne0,r17,@L5642
	or	 r18,r0,r2
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,r14
	or	 r17,r0,r2
@L5642:
	ld	 r4,r31,120
	or	 r2,r0,r17
	bsr.n	 _expand_fix
	or	 r3,r0,r18
@L8004:
	br.n	 @L7200
	or	 r2,r0,r17
	align	 4
@L5643:
	ld	 r2,r20,16
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	bcnd.n	 ne0,r17,@L5644
	or	 r18,r0,r2
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,r14
	or	 r17,r0,r2
@L5644:
	ld.bu	 r13,r18,2
	bcnd	 ne0,r13,@L5645
	ld	 r13,r20,16
	ld	 r13,r13,4
	ld.bu	 r2,r13,24
	bsr.n	 _copy_to_mode_reg
	or	 r3,r0,r18
	or	 r18,r0,r2
@L5645:
	ld	 r13,r20,16
	ld	 r13,r13,4
	ld	 r4,r13,8
	or	 r2,r0,r17
	or	 r3,r0,r18
	extu	 r4,r4,1<17>
	bsr.n	 _expand_float
	subu	 r1,r1,@L8501
@L8502:
	align	 4
@L5646:
	ld	 r2,r20,16
	or	 r3,r0,r17
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r18,r0,r2
	or	 r2,r0,r14
	or	 r5,r0,r17
	or.u	 r13,r0,hi16(_neg_optab)
	or	 r6,r0,0
	ld	 r3,r13,lo16(_neg_optab)
	bsr.n	 _expand_unop
	or	 r4,r0,r18
	or	 r19,r0,r2
	bcnd.n	 ne0,r19,@L7200
	or	 r2,r0,r19
	bsr	 _abort
	align	 4
@L5648:
	or	 r3,r0,r16
	or	 r4,r0,0
	ld	 r2,r20,16
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld	 r13,r20,16
	ld	 r12,r13,4
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r12,r12,24
	or	 r13,r13,lo16(_mode_class)
	ld	 r13,r13[r12]
	subu	 r13,r13,5
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L5649
	or	 r18,r0,r2
	ld	 r5,r31,120
	or	 r2,r0,r12
	or	 r3,r0,r18
	or	 r4,r0,r17
	bsr	 _expand_complex_abs
	br	 @L7200
	align	 4
@L5649:
	ld	 r15,r31,172
	ld	 r13,r15,8
	bb0.n	 (31-14),r13,@L5650
	or	 r2,r0,r14
@L7976:
	br.n	 @L7200
	or	 r2,r0,r18
	align	 4
@L5650:
	or	 r4,r0,r18
	or.u	 r13,r0,hi16(_abs_optab)
	or	 r5,r0,r17
	ld	 r3,r13,lo16(_abs_optab)
	bsr.n	 _expand_unop
	or	 r6,r0,0
	or	 r19,r0,r2
	bcnd	 ne0,r19,@L7200
	bsr	 _gen_label_rtx
	ld	 r17,r31,372
	bcnd.n	 eq0,r17,@L5656
	or	 r19,r0,r2
	ld.hu	 r13,r0,r17
	ld	 r22,r20,16
	or	 r23,r0,r17
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L5659
	or	 r21,r0,0
	ld	 r23,r17,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,51
	bb1	 ne,r13,@L5659
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0	 gt,r13,@L7901
@L5659:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8148
	or.u	 r13,r0,hi16(_tree_code_type)
	or.u	 r13,r0,hi16(_virtual_outgoing_args_rtx)
	ld	 r12,r23,4
	ld	 r11,r13,lo16(_virtual_outgoing_args_rtx)
	cmp	 r13,r12,r11
	bb0	 ne,r13,@L5704
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L8148
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r13,r12,4
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L5704
	or.u	 r13,r0,hi16(_tree_code_type)
@L8148:
	ld.bu	 r12,r22,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r13,r0,r13
	subu	 r11,r13,49
	or.u	 r13,r0,hi16(@L5702)
	cmp	 r12,r11,71
	bb0.n	 ls,r12,@L5663
	or	 r13,r13,lo16(@L5702)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L5702:
	word	 @L5672
	word	 @L5674
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5674
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5704
	word	 @L5664
	word	 @L5677
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5677
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5663
	word	 @L5666
	align	 4
@L5664:
	ld	 r21,r22,64
	br	 @L5663
	align	 4
@L5666:
	ld.bu	 r13,r22,8
	cmp	 r13,r13,3
	bb1.n	 ne,r13,@L5657
	or	 r2,r0,0
	ld	 r3,r22,16
	bcnd.n	 eq0,r3,@L5669
	or	 r25,r0,0
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5657
	or	 r2,r0,r25
@L5669:
	ld	 r3,r0,r22
	bcnd	 eq0,r3,@L5708
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5657
	or	 r2,r0,r25
	br.n	 @L8149
	or	 r25,r0,1
	align	 4
@L5672:
	ld	 r3,r22,16
	br.n	 @L8150
	or	 r2,r0,r23
	align	 4
@L5674:
	ld	 r3,r22,16
	or	 r2,r0,r23
	bsr.n	 _safe_from_p
	or	 r25,r0,0
	bcnd	 eq0,r2,@L5707
	ld	 r3,r22,20
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	cmp	 r2,r2,0
	br.n	 @L5707
	extu	 r25,r2,1<ne>
	align	 4
@L5677:
	ld.bu	 r13,r22,8
	subu	 r11,r13,39
	or.u	 r13,r0,hi16(@L5693)
	cmp	 r12,r11,67
	bb0.n	 ls,r12,@L5678
	or	 r13,r13,lo16(@L5693)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L5693:
	word	 @L5680
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5691
	word	 @L5682
	word	 @L5692
	word	 @L5689
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5678
	word	 @L5690
	word	 @L5687
	word	 @L5679
	align	 4
@L5679:
	ld	 r2,r22,16
	bsr.n	 _staticp
	addu	 r1,r1,@L8503
@L8504:
	align	 4
@L5680:
	ld.hu	 r13,r0,r23
	br.n	 @L7900
	cmp	 r13,r13,55
	align	 4
@L5682:
	ld	 r21,r22,24
	bcnd	 ne0,r21,@L7209
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,51
	bb1.n	 ne,r13,@L7900
	cmp	 r13,r12,55
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L7901
	cmp	 r13,r12,55
@L7900:
	bb1.n	 ne,r13,@L5678
	or	 r2,r0,0
	br	 @L5657
	align	 4
@L5687:
	ld	 r21,r22,20
	bcnd	 ne0,r21,@L7209
@L7901:
	br.n	 @L5657
	or	 r2,r0,0
	align	 4
@L5689:
	ld	 r21,r22,20
	br	 @L5678
	align	 4
@L5690:
	ld	 r21,r22,24
	br	 @L5678
	align	 4
@L5691:
	ld	 r3,r22,20
	or	 r2,r0,r23
@L8150:
	bsr.n	 _safe_from_p
	addu	 r1,r1,@L8505
@L8506:
	align	 4
@L5692:
	bsr	 _abort
	align	 4
@L5678:
	bcnd.n	 ne0,r21,@L7209
	or.u	 r13,r0,hi16(_tree_code_length)
	ld.bu	 r12,r22,8
	ld	 r13,r13,lo16(_tree_code_length)
	ld	 r20,r13[r12]
	cmp	 r13,r21,r20
	bb0.n	 lt,r13,@L5663
	or	 r24,r0,0
	mask	 r12,r20,3
	bcnd.n	 eq0,r12,@L5699
	or	 r25,r0,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L7514
	cmp	 r13,r12,2
	bb0	 gt,r13,@L7515
	ld	 r3,r22,16
	bcnd	 eq0,r3,@L7517
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5657
	or	 r2,r0,0
@L7517:
	addu	 r25,r22,4
	or	 r24,r0,1
@L7515:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7520
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5657
	or	 r2,r0,0
@L7520:
	addu	 r25,r25,4
	addu	 r24,r24,1
@L7514:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7523
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5657
	or	 r2,r0,0
@L7523:
	addu	 r24,r24,1
	cmp	 r13,r24,r20
	bb0.n	 lt,r13,@L5663
	addu	 r25,r25,4
@L5699:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7526
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5657
	or	 r2,r0,0
@L7526:
	ld	 r3,r25,20
	bcnd	 eq0,r3,@L7529
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5657
	or	 r2,r0,0
@L7529:
	ld	 r3,r25,24
	bcnd	 eq0,r3,@L7532
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5657
	or	 r2,r0,0
@L7532:
	ld	 r3,r25,28
	bcnd	 eq0,r3,@L7535
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5657
	or	 r2,r0,0
@L7535:
	addu	 r24,r24,4
	cmp	 r13,r24,r20
	bb1.n	 lt,r13,@L5699
	addu	 r25,r25,16
@L5663:
	bcnd.n	 eq0,r21,@L5657
	or	 r2,r0,1
@L7209:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L8151
	or	 r2,r0,r23
	ld	 r21,r21,4
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L8152
	or	 r3,r0,r21
	ld	 r13,r21,4
	cmp	 r13,r13,63
	bb1	 le,r13,@L7901
@L8151:
	or	 r3,r0,r21
@L8152:
	bsr.n	 _rtx_equal_p
	or	 r25,r0,0
	bcnd	 ne0,r2,@L5707
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1	 ne,r13,@L5708
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,55
	bb1	 ne,r13,@L5708
	ld	 r13,r22,8
	bb0.n	 (31-13),r13,@L5657
	or	 r2,r0,r25
@L5708:
	or	 r25,r0,1
@L5707:
@L8149:
	br.n	 @L5657
	or	 r2,r0,r25
	align	 4
@L5704:
	or	 r2,r0,1
@L5657:
	bcnd	 eq0,r2,@L5656
	ld.hu	 r13,r0,r17
	cmp	 r13,r13,51
	bb1	 ne,r13,@L5655
	ld	 r13,r17,4
	cmp	 r13,r13,63
	bb1	 gt,r13,@L5655
@L5656:
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,r14
	or	 r17,r0,r2
@L5655:
	ld.hu	 r11,r0,r17
	ld.bu	 r22,r17,2
	or	 r21,r0,r17
	or.u	 r13,r0,hi16(_mode_class)
	or	 r13,r13,lo16(_mode_class)
	cmp	 r12,r11,59
	ld	 r20,r13[r22]
	bb0.n	 ne,r12,@L5711
	or	 r24,r0,r18
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L5714
	cmp	 r13,r11,63
	ld	 r2,r17,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L5715
	st	 r2,r17,4
	align	 4
@L5714:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5715
	ld	 r2,r17,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r17,4
	ld	 r2,r17,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r17,8
@L5715:
	br.n	 @L5710
	or	 r2,r0,r21
	align	 4
@L5711:
	ld	 r13,r17,8
	bcnd	 ne0,r13,@L5717
	ld	 r2,r17,4
	br	 @L5710
	align	 4
@L5717:
	ld	 r2,r17,12
	bcnd	 ne0,r2,@L5710
	ld	 r13,r17,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r17,4
	bsr.n	 _gen_move_insn
	st	 r2,r17,12
	bsr.n	 _emit_insn_before
	ld	 r3,r17,8
	ld	 r2,r17,12
@L5710:
	ld.hu	 r12,r0,r24
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L5720
	or	 r21,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L8153
	cmp	 r13,r12,63
	ld.bu	 r13,r24,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L5721
	ld	 r23,r24,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5721
	ld	 r13,r23,4
	st	 r13,r24,4
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L5724
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r24,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r24
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	br.n	 @L5719
	or	 r2,r0,r25
	align	 4
@L5721:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L5723
	cmp	 r13,r12,63
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L5724
	st	 r2,r24,4
	align	 4
@L5723:
@L8153:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5724
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,4
	ld	 r2,r24,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,8
@L5724:
	br.n	 @L5719
	or	 r2,r0,r24
	align	 4
@L5720:
	ld	 r13,r24,8
	bcnd	 ne0,r13,@L5726
	ld	 r2,r24,4
	br.n	 @L8154
	cmp	 r13,r22,16
	align	 4
@L5726:
	ld	 r2,r24,12
	bcnd.n	 ne0,r2,@L8154
	cmp	 r13,r22,16
	ld	 r13,r24,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r24,4
	bsr.n	 _gen_move_insn
	st	 r2,r24,12
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	ld	 r2,r24,12
@L5719:
	cmp	 r13,r22,16
@L8154:
	bb0.n	 ne,r13,@L5729
	or	 r24,r0,r2
	ld.bu	 r13,r24,2
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L5728
	ld.bu	 r13,r24,2
	bcnd	 eq0,r13,@L5728
@L5729:
	bsr	 _abort
	align	 4
@L5728:
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5731
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5731
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L5730
@L5731:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,47
	bb1	 ne,r13,@L5730
	ld.bu	 r13,r24,2
	bcnd.n	 eq0,r13,@L5730
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
@L5730:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,55
	bb1	 ne,r13,@L5732
	ld.bu	 r2,r21,2
	bsr.n	 _memory_address_p
	ld	 r3,r21,4
	bcnd.n	 ne0,r2,@L8155
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bcnd.n	 eq0,r2,@L5733
	or.u	 r13,r0,hi16(_flag_force_addr)
@L8155:
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L5732
	ld	 r13,r21,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5733
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5733
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L5732
@L5733:
	ld	 r4,r21,4
	or	 r2,r0,r21
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r21,r0,r2
@L5732:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8156
	cmp	 r13,r22,16
	ld.bu	 r2,r24,2
	bsr.n	 _memory_address_p
	ld	 r3,r24,4
	bcnd.n	 eq0,r2,@L5736
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L5735
	ld	 r13,r24,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5736
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5736
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L8156
	cmp	 r13,r22,16
@L5736:
	ld	 r4,r24,4
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L5735:
	cmp	 r13,r22,16
@L8156:
	bb1.n	 ne,r13,@L5737
	subu	 r13,r20,5
	bsr	 _abort
	align	 4
@L5737:
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L5738
	or.u	 r13,r0,hi16(_mode_unit_size)
	or	 r13,r13,lo16(_mode_unit_size)
	ld	 r12,r13[r22]
	or	 r3,r0,2
	cmp	 r13,r20,5
	bb1.n	 ne,r13,@L5739
	mak	 r2,r12,0<3>
	or	 r3,r0,1
@L5739:
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	st	 r2,r31,260
@L5738:
	or.u	 r23,r0,hi16(_mov_optab)
	ld	 r11,r23,lo16(_mov_optab)
	lda.d	 r13,r11[r22]
	ld	 r12,r13,4
	cmp	 r13,r12,210
	bb0.n	 ne,r13,@L5741
	or.u	 r13,r0,hi16(_insn_gen_function)
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r2,r0,r21
	ld	 r13,r13[r12]
	jsr.n	 r13
	or	 r3,r0,r24
	bsr.n	 _emit_insn
	addu	 r1,r1,@L8507
@L8508:
	align	 4
@L5741:
	subu	 r13,r20,5
	ld	 r15,r31,260
	cmp	 r13,r13,1
	extu	 r13,r13,1<ls>
	cmp	 r12,r15,16
	extu	 r12,r12,1<ne>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L5743
	mak	 r25,r15,0<3>
	addu	 r13,r11,r25
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L5743
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bsr.n	 _get_last_insn
	or	 r22,r0,r2
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L5744
	or	 r18,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r21
	bsr	 _emit_insn
@L5744:
	ld	 r13,r23,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	addu	 r13,r13,r25
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L5745
	or	 r20,r12,lo16(_insn_gen_function)
	ld	 r3,r31,260
	or	 r2,r0,r21
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8509
@L8510:
	align	 4
@L5745:
	ld	 r2,r31,260
	bsr.n	 _gen_highpart
	or	 r3,r0,r21
@L7902:
	or	 r25,r0,r2
	ld	 r2,r31,260
	bsr.n	 _gen_highpart
	or	 r3,r0,r24
	or	 r3,r0,r2
	ld	 r13,r20[r23]
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r15,r31,260
	ld	 r13,r13,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	lda.d	 r13,r13[r15]
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L5747
	or	 r20,r12,lo16(_insn_gen_function)
	ld	 r3,r31,260
	or	 r2,r0,r21
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8511
@L8512:
	align	 4
@L5747:
	ld	 r2,r31,260
	bsr.n	 _gen_lowpart
	or	 r3,r0,r21
@L7903:
	or	 r25,r0,r2
	ld	 r2,r31,260
	bsr.n	 _gen_lowpart
	or	 r3,r0,r24
	ld	 r13,r20[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	bcnd	 eq0,r18,@L5750
	ld	 r24,r18,12
	br	 @L5751
	align	 4
@L5750:
	bsr	 _get_insns
	or	 r24,r0,r2
@L5751:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	st	 r2,r24,28
	bsr.n	 _get_last_insn
	addu	 r1,r1,@L8513
@L8514:
	align	 4
@L5743:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r23,r13,lo16(_mode_size)
	ld	 r13,r23[r22]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L5753
	bsr.n	 _get_last_insn
	or	 r25,r0,0
	or	 r20,r0,r2
	or	 r18,r0,r23
@L5754:
	ld	 r12,r18[r22]
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L5758
	addu	 r13,r12,6
@L5758:
	ext	 r13,r13,0<2>
	cmp	 r13,r25,r13
	bb0.n	 lt,r13,@L5755
	or	 r2,r0,r21
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r23,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r3,r0,r2
	bcnd.n	 ne0,r3,@L8157
	cmp	 r13,r23,0
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5760
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5760
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L5759
	or	 r2,r0,r24
@L5760:
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r3,r0,r25
	or	 r4,r0,1
	or	 r5,r0,r22
	bsr.n	 _operand_subword
	addu	 r1,r1,@L8515
@L8516:
	align	 4
@L5759:
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r22
@L7904:
	or	 r3,r0,r2
	cmp	 r13,r23,0
@L8157:
	cmp	 r12,r3,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L5763
	or	 r2,r0,r23
	bsr	 _abort
	align	 4
@L5763:
	addu	 r25,r25,1
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L8517
@L8518:
	align	 4
@L5755:
	bcnd	 eq0,r20,@L5765
	ld	 r24,r20,12
	br	 @L5766
	align	 4
@L5765:
	bsr	 _get_insns
	or	 r24,r0,r2
@L5766:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	br.n	 @L5709
	st	 r2,r24,28
	align	 4
@L5753:
	bsr	 _abort
	align	 4
@L5709:
	ld	 r2,r31,172
	or.u	 r13,r0,hi16(_integer_zero_node)
	bsr.n	 _convert
	ld	 r3,r13,lo16(_integer_zero_node)
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r3,r0,r2
	or	 r2,r0,r17
	or	 r4,r0,91
	or	 r5,r0,0
	or	 r6,r0,r14
	or	 r7,r0,0
	bsr.n	 _emit_cmp_insn
	or	 r8,r0,0
	or.u	 r12,r0,hi16(_inhibit_defer_pop)
	ld	 r13,r12,lo16(_inhibit_defer_pop)
	or	 r2,r0,r19
	addu	 r13,r13,1
	bsr.n	 _gen_bge
	st	 r13,r12,lo16(_inhibit_defer_pop)
	bsr	 _emit_jump_insn
	or	 r2,r0,r14
	or	 r4,r0,r17
	or.u	 r13,r0,hi16(_neg_optab)
	or	 r5,r0,r17
	ld	 r3,r13,lo16(_neg_optab)
	bsr.n	 _expand_unop
	or	 r6,r0,0
	or	 r18,r0,r2
	cmp	 r13,r18,r17
	bb0	 ne,r13,@L5768
	ld.hu	 r11,r0,r17
	ld.bu	 r22,r17,2
	or	 r21,r0,r17
	or.u	 r13,r0,hi16(_mode_class)
	or	 r13,r13,lo16(_mode_class)
	cmp	 r12,r11,59
	ld	 r20,r13[r22]
	bb0.n	 ne,r12,@L5771
	or	 r24,r0,r18
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L5774
	cmp	 r13,r11,63
	ld	 r2,r17,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L5775
	st	 r2,r17,4
	align	 4
@L5774:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5775
	ld	 r2,r17,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r17,4
	ld	 r2,r17,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r17,8
@L5775:
	br.n	 @L5770
	or	 r2,r0,r21
	align	 4
@L5771:
	ld	 r13,r17,8
	bcnd	 ne0,r13,@L5777
	ld	 r2,r17,4
	br	 @L5770
	align	 4
@L5777:
	ld	 r2,r17,12
	bcnd	 ne0,r2,@L5770
	ld	 r13,r17,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r17,4
	bsr.n	 _gen_move_insn
	st	 r2,r17,12
	bsr.n	 _emit_insn_before
	ld	 r3,r17,8
	ld	 r2,r17,12
@L5770:
	ld.hu	 r12,r0,r24
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L5780
	or	 r21,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L8158
	cmp	 r13,r12,63
	ld.bu	 r13,r24,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L5781
	ld	 r23,r24,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5781
	ld	 r13,r23,4
	st	 r13,r24,4
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L5784
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r24,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r24
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	br.n	 @L5779
	or	 r2,r0,r25
	align	 4
@L5781:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L5783
	cmp	 r13,r12,63
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L5784
	st	 r2,r24,4
	align	 4
@L5783:
@L8158:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5784
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,4
	ld	 r2,r24,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,8
@L5784:
	br.n	 @L5779
	or	 r2,r0,r24
	align	 4
@L5780:
	ld	 r13,r24,8
	bcnd	 ne0,r13,@L5786
	ld	 r2,r24,4
	br.n	 @L8159
	cmp	 r13,r22,16
	align	 4
@L5786:
	ld	 r2,r24,12
	bcnd.n	 ne0,r2,@L8159
	cmp	 r13,r22,16
	ld	 r13,r24,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r24,4
	bsr.n	 _gen_move_insn
	st	 r2,r24,12
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	ld	 r2,r24,12
@L5779:
	cmp	 r13,r22,16
@L8159:
	bb0.n	 ne,r13,@L5789
	or	 r24,r0,r2
	ld.bu	 r13,r24,2
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L5788
	ld.bu	 r13,r24,2
	bcnd	 eq0,r13,@L5788
@L5789:
	bsr	 _abort
	align	 4
@L5788:
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5791
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5791
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L5790
@L5791:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,47
	bb1	 ne,r13,@L5790
	ld.bu	 r13,r24,2
	bcnd.n	 eq0,r13,@L5790
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
@L5790:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,55
	bb1	 ne,r13,@L5792
	ld.bu	 r2,r21,2
	bsr.n	 _memory_address_p
	ld	 r3,r21,4
	bcnd.n	 ne0,r2,@L8160
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bcnd.n	 eq0,r2,@L5793
	or.u	 r13,r0,hi16(_flag_force_addr)
@L8160:
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L5792
	ld	 r13,r21,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5793
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5793
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L5792
@L5793:
	ld	 r4,r21,4
	or	 r2,r0,r21
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r21,r0,r2
@L5792:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8161
	cmp	 r13,r22,16
	ld.bu	 r2,r24,2
	bsr.n	 _memory_address_p
	ld	 r3,r24,4
	bcnd.n	 eq0,r2,@L5796
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L5795
	ld	 r13,r24,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5796
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5796
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L8161
	cmp	 r13,r22,16
@L5796:
	ld	 r4,r24,4
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L5795:
	cmp	 r13,r22,16
@L8161:
	bb1.n	 ne,r13,@L5797
	subu	 r13,r20,5
	bsr	 _abort
	align	 4
@L5797:
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L5798
	or.u	 r13,r0,hi16(_mode_unit_size)
	or	 r13,r13,lo16(_mode_unit_size)
	ld	 r12,r13[r22]
	or	 r3,r0,2
	cmp	 r13,r20,5
	bb1.n	 ne,r13,@L5799
	mak	 r2,r12,0<3>
	or	 r3,r0,1
@L5799:
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	st	 r2,r31,268
@L5798:
	or.u	 r23,r0,hi16(_mov_optab)
	ld	 r11,r23,lo16(_mov_optab)
	lda.d	 r13,r11[r22]
	ld	 r12,r13,4
	cmp	 r13,r12,210
	bb0.n	 ne,r13,@L5801
	or.u	 r13,r0,hi16(_insn_gen_function)
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r2,r0,r21
	ld	 r13,r13[r12]
	jsr.n	 r13
	or	 r3,r0,r24
	bsr.n	 _emit_insn
	addu	 r1,r1,@L8519
@L8520:
	align	 4
@L5801:
	subu	 r13,r20,5
	ld	 r15,r31,268
	cmp	 r13,r13,1
	extu	 r13,r13,1<ls>
	cmp	 r12,r15,16
	extu	 r12,r12,1<ne>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L5803
	mak	 r25,r15,0<3>
	addu	 r13,r11,r25
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L5803
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bsr.n	 _get_last_insn
	or	 r22,r0,r2
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L5804
	or	 r18,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r21
	bsr	 _emit_insn
@L5804:
	ld	 r13,r23,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	addu	 r13,r13,r25
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L5805
	or	 r20,r12,lo16(_insn_gen_function)
	ld	 r3,r31,268
	or	 r2,r0,r21
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8521
@L8522:
	align	 4
@L5805:
	ld	 r2,r31,268
	bsr.n	 _gen_highpart
	or	 r3,r0,r21
@L7905:
	or	 r25,r0,r2
	ld	 r2,r31,268
	bsr.n	 _gen_highpart
	or	 r3,r0,r24
	or	 r3,r0,r2
	ld	 r13,r20[r23]
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r15,r31,268
	ld	 r13,r13,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	lda.d	 r13,r13[r15]
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L5807
	or	 r20,r12,lo16(_insn_gen_function)
	ld	 r3,r31,268
	or	 r2,r0,r21
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8523
@L8524:
	align	 4
@L5807:
	ld	 r2,r31,268
	bsr.n	 _gen_lowpart
	or	 r3,r0,r21
@L7906:
	or	 r25,r0,r2
	ld	 r2,r31,268
	bsr.n	 _gen_lowpart
	or	 r3,r0,r24
	ld	 r13,r20[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	bcnd	 eq0,r18,@L5810
	ld	 r24,r18,12
	br	 @L5811
	align	 4
@L5810:
	bsr	 _get_insns
	or	 r24,r0,r2
@L5811:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	st	 r2,r24,28
	bsr.n	 _get_last_insn
	addu	 r1,r1,@L8525
@L8526:
	align	 4
@L5803:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r23,r13,lo16(_mode_size)
	ld	 r13,r23[r22]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L5813
	bsr.n	 _get_last_insn
	or	 r25,r0,0
	or	 r20,r0,r2
	or	 r18,r0,r23
@L5814:
	ld	 r12,r18[r22]
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L5818
	addu	 r13,r12,6
@L5818:
	ext	 r13,r13,0<2>
	cmp	 r13,r25,r13
	bb0.n	 lt,r13,@L5815
	or	 r2,r0,r21
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r23,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r3,r0,r2
	bcnd.n	 ne0,r3,@L8162
	cmp	 r13,r23,0
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5820
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5820
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L5819
	or	 r2,r0,r24
@L5820:
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r3,r0,r25
	or	 r4,r0,1
	or	 r5,r0,r22
	bsr.n	 _operand_subword
	addu	 r1,r1,@L8527
@L8528:
	align	 4
@L5819:
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r22
@L7907:
	or	 r3,r0,r2
	cmp	 r13,r23,0
@L8162:
	cmp	 r12,r3,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L5823
	or	 r2,r0,r23
	bsr	 _abort
	align	 4
@L5823:
	addu	 r25,r25,1
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L8529
@L8530:
	align	 4
@L5815:
	bcnd	 eq0,r20,@L5825
	ld	 r24,r20,12
	br	 @L5826
	align	 4
@L5825:
	bsr	 _get_insns
	or	 r24,r0,r2
@L5826:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	br.n	 @L5768
	st	 r2,r24,28
	align	 4
@L5813:
	bsr	 _abort
	align	 4
@L5768:
	bsr.n	 _emit_label
	or	 r2,r0,r19
	or.u	 r12,r0,hi16(_inhibit_defer_pop)
	ld	 r13,r12,lo16(_inhibit_defer_pop)
	or	 r2,r0,r17
	subu	 r13,r13,1
	br.n	 @L7200
	st	 r13,r12,lo16(_inhibit_defer_pop)
	align	 4
@L5829:
	ld	 r17,r31,372
	bcnd	 eq0,r17,@L5831
	ld.hu	 r13,r0,r17
	ld	 r22,r20,20
	or	 r23,r0,r17
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L5834
	or	 r21,r0,0
	ld	 r23,r17,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,51
	bb1	 ne,r13,@L5834
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L5832
	or	 r2,r0,0
@L5834:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8163
	or.u	 r13,r0,hi16(_tree_code_type)
	or.u	 r13,r0,hi16(_virtual_outgoing_args_rtx)
	ld	 r12,r23,4
	ld	 r11,r13,lo16(_virtual_outgoing_args_rtx)
	cmp	 r13,r12,r11
	bb0	 ne,r13,@L5879
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L8163
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r13,r12,4
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L5879
	or.u	 r13,r0,hi16(_tree_code_type)
@L8163:
	ld.bu	 r12,r22,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r13,r0,r13
	subu	 r11,r13,49
	or.u	 r13,r0,hi16(@L5877)
	cmp	 r12,r11,71
	bb0.n	 ls,r12,@L5838
	or	 r13,r13,lo16(@L5877)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L5877:
	word	 @L5847
	word	 @L5849
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5849
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5879
	word	 @L5839
	word	 @L5852
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5852
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5838
	word	 @L5841
	align	 4
@L5839:
	ld	 r21,r22,64
	br	 @L5838
	align	 4
@L5841:
	ld.bu	 r13,r22,8
	cmp	 r13,r13,3
	bb1.n	 ne,r13,@L5832
	or	 r2,r0,0
	ld	 r3,r22,16
	bcnd.n	 eq0,r3,@L5844
	or	 r25,r0,0
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5832
	or	 r2,r0,r25
@L5844:
	ld	 r3,r0,r22
	bcnd	 eq0,r3,@L5883
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5832
	or	 r2,r0,r25
	br.n	 @L8164
	or	 r25,r0,1
	align	 4
@L5847:
	ld	 r3,r22,16
	br.n	 @L8165
	or	 r2,r0,r23
	align	 4
@L5849:
	ld	 r3,r22,16
	or	 r2,r0,r23
	bsr.n	 _safe_from_p
	or	 r25,r0,0
	bcnd	 eq0,r2,@L5882
	ld	 r3,r22,20
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	cmp	 r2,r2,0
	br.n	 @L5882
	extu	 r25,r2,1<ne>
	align	 4
@L5852:
	ld.bu	 r13,r22,8
	subu	 r11,r13,39
	or.u	 r13,r0,hi16(@L5868)
	cmp	 r12,r11,67
	bb0.n	 ls,r12,@L5853
	or	 r13,r13,lo16(@L5868)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L5868:
	word	 @L5855
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5866
	word	 @L5857
	word	 @L5867
	word	 @L5864
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5853
	word	 @L5865
	word	 @L5862
	word	 @L5854
	align	 4
@L5854:
	ld	 r2,r22,16
	bsr.n	 _staticp
	addu	 r1,r1,@L8531
@L8532:
	align	 4
@L5855:
	ld.hu	 r13,r0,r23
	br.n	 @L7910
	cmp	 r13,r13,55
	align	 4
@L5857:
	ld	 r21,r22,24
	bcnd	 ne0,r21,@L7210
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,51
	bb1.n	 ne,r13,@L7910
	cmp	 r13,r12,55
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L7911
	cmp	 r13,r12,55
@L7910:
	bb1.n	 ne,r13,@L5853
	or	 r2,r0,0
	br	 @L5832
	align	 4
@L5862:
	ld	 r21,r22,20
	bcnd	 ne0,r21,@L7210
@L7911:
	br.n	 @L5832
	or	 r2,r0,0
	align	 4
@L5864:
	ld	 r21,r22,20
	br	 @L5853
	align	 4
@L5865:
	ld	 r21,r22,24
	br	 @L5853
	align	 4
@L5866:
	ld	 r3,r22,20
	or	 r2,r0,r23
@L8165:
	bsr.n	 _safe_from_p
	addu	 r1,r1,@L8533
@L8534:
	align	 4
@L5867:
	bsr	 _abort
	align	 4
@L5853:
	bcnd.n	 ne0,r21,@L7210
	or.u	 r13,r0,hi16(_tree_code_length)
	ld.bu	 r12,r22,8
	ld	 r13,r13,lo16(_tree_code_length)
	ld	 r19,r13[r12]
	cmp	 r13,r21,r19
	bb0.n	 lt,r13,@L5838
	or	 r24,r0,0
	mask	 r12,r19,3
	bcnd.n	 eq0,r12,@L5874
	or	 r25,r0,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L7488
	cmp	 r13,r12,2
	bb0	 gt,r13,@L7489
	ld	 r3,r22,16
	bcnd	 eq0,r3,@L7491
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5832
	or	 r2,r0,0
@L7491:
	addu	 r25,r22,4
	or	 r24,r0,1
@L7489:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7494
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5832
	or	 r2,r0,0
@L7494:
	addu	 r25,r25,4
	addu	 r24,r24,1
@L7488:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7497
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5832
	or	 r2,r0,0
@L7497:
	addu	 r24,r24,1
	cmp	 r13,r24,r19
	bb0.n	 lt,r13,@L5838
	addu	 r25,r25,4
@L5874:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7500
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5832
	or	 r2,r0,0
@L7500:
	ld	 r3,r25,20
	bcnd	 eq0,r3,@L7503
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5832
	or	 r2,r0,0
@L7503:
	ld	 r3,r25,24
	bcnd	 eq0,r3,@L7506
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5832
	or	 r2,r0,0
@L7506:
	ld	 r3,r25,28
	bcnd	 eq0,r3,@L7509
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L5832
	or	 r2,r0,0
@L7509:
	addu	 r24,r24,4
	cmp	 r13,r24,r19
	bb1.n	 lt,r13,@L5874
	addu	 r25,r25,16
@L5838:
	bcnd.n	 eq0,r21,@L5832
	or	 r2,r0,1
@L7210:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L8166
	or	 r2,r0,r23
	ld	 r21,r21,4
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L8167
	or	 r3,r0,r21
	ld	 r13,r21,4
	cmp	 r13,r13,63
	bb1	 le,r13,@L7911
@L8166:
	or	 r3,r0,r21
@L8167:
	bsr.n	 _rtx_equal_p
	or	 r25,r0,0
	bcnd	 ne0,r2,@L5882
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1	 ne,r13,@L5883
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,55
	bb1	 ne,r13,@L5883
	ld	 r13,r22,8
	bb0.n	 (31-13),r13,@L5832
	or	 r2,r0,r25
@L5883:
	or	 r25,r0,1
@L5882:
@L8164:
	br.n	 @L5832
	or	 r2,r0,r25
	align	 4
@L5879:
	or	 r2,r0,1
@L5832:
	bcnd	 eq0,r2,@L5831
	ld.hu	 r13,r0,r17
	cmp	 r13,r13,51
	bb1	 ne,r13,@L5830
	ld	 r13,r17,4
	cmp	 r13,r13,63
	bb1	 gt,r13,@L5830
@L5831:
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,r14
	or	 r17,r0,r2
@L5830:
	ld	 r2,r20,20
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r16,r0,r2
	ld	 r2,r20,16
	or	 r3,r0,r17
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld	 r15,r31,172
	ld	 r13,r15,8
	bb0.n	 (31-14),r13,@L5884
	or	 r18,r0,r2
	ld	 r15,r31,180
	cmp	 r13,r15,73
	bb1.n	 ne,r13,@L5886
	or.u	 r13,r0,hi16(_umax_optab)
	or.u	 r13,r0,hi16(_umin_optab)
	ld	 r13,r13,lo16(_umin_optab)
	br.n	 @L8168
	st	 r13,r31,372
	align	 4
@L5886:
	ld	 r13,r13,lo16(_umax_optab)
	br.n	 @L8168
	st	 r13,r31,372
	align	 4
@L5884:
	ld	 r15,r31,180
	cmp	 r13,r15,73
	bb1.n	 ne,r13,@L5888
	or.u	 r13,r0,hi16(_smax_optab)
	or.u	 r13,r0,hi16(_smin_optab)
	ld	 r13,r13,lo16(_smin_optab)
	br.n	 @L8168
	st	 r13,r31,372
	align	 4
@L5888:
	ld	 r13,r13,lo16(_smax_optab)
	st	 r13,r31,372
@L8168:
	ld	 r7,r31,120
	ld	 r3,r31,372
	or	 r2,r0,r14
	or	 r4,r0,r18
	or	 r5,r0,r16
	or	 r6,r0,r17
	bsr.n	 _expand_binop
	or	 r8,r0,2
	or	 r19,r0,r2
	bcnd.n	 ne0,r19,@L7200
	cmp	 r13,r17,r18
	bb0	 ne,r13,@L5891
	ld.hu	 r11,r0,r17
	ld.bu	 r22,r17,2
	or	 r21,r0,r17
	or.u	 r13,r0,hi16(_mode_class)
	or	 r13,r13,lo16(_mode_class)
	cmp	 r12,r11,59
	ld	 r19,r13[r22]
	bb0.n	 ne,r12,@L5894
	or	 r24,r0,r18
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L5897
	cmp	 r13,r11,63
	ld	 r2,r17,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L5898
	st	 r2,r17,4
	align	 4
@L5897:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5898
	ld	 r2,r17,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r17,4
	ld	 r2,r17,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r17,8
@L5898:
	br.n	 @L5893
	or	 r2,r0,r21
	align	 4
@L5894:
	ld	 r13,r17,8
	bcnd	 ne0,r13,@L5900
	ld	 r2,r17,4
	br	 @L5893
	align	 4
@L5900:
	ld	 r2,r17,12
	bcnd	 ne0,r2,@L5893
	ld	 r13,r17,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r17,4
	bsr.n	 _gen_move_insn
	st	 r2,r17,12
	bsr.n	 _emit_insn_before
	ld	 r3,r17,8
	ld	 r2,r17,12
@L5893:
	ld.hu	 r12,r0,r24
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L5903
	or	 r21,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L8169
	cmp	 r13,r12,63
	ld.bu	 r13,r24,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L5904
	ld	 r23,r24,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5904
	ld	 r13,r23,4
	st	 r13,r24,4
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L5907
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r24,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r24
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	br.n	 @L5902
	or	 r2,r0,r25
	align	 4
@L5904:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L5906
	cmp	 r13,r12,63
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L5907
	st	 r2,r24,4
	align	 4
@L5906:
@L8169:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5907
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,4
	ld	 r2,r24,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,8
@L5907:
	br.n	 @L5902
	or	 r2,r0,r24
	align	 4
@L5903:
	ld	 r13,r24,8
	bcnd	 ne0,r13,@L5909
	ld	 r2,r24,4
	br.n	 @L8170
	cmp	 r13,r22,16
	align	 4
@L5909:
	ld	 r2,r24,12
	bcnd.n	 ne0,r2,@L8170
	cmp	 r13,r22,16
	ld	 r13,r24,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r24,4
	bsr.n	 _gen_move_insn
	st	 r2,r24,12
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	ld	 r2,r24,12
@L5902:
	cmp	 r13,r22,16
@L8170:
	bb0.n	 ne,r13,@L5912
	or	 r24,r0,r2
	ld.bu	 r13,r24,2
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L5911
	ld.bu	 r13,r24,2
	bcnd	 eq0,r13,@L5911
@L5912:
	bsr	 _abort
	align	 4
@L5911:
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5914
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5914
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L5913
@L5914:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,47
	bb1	 ne,r13,@L5913
	ld.bu	 r13,r24,2
	bcnd.n	 eq0,r13,@L5913
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
@L5913:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,55
	bb1	 ne,r13,@L5915
	ld.bu	 r2,r21,2
	bsr.n	 _memory_address_p
	ld	 r3,r21,4
	bcnd.n	 ne0,r2,@L8171
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bcnd.n	 eq0,r2,@L5916
	or.u	 r13,r0,hi16(_flag_force_addr)
@L8171:
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L5915
	ld	 r13,r21,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5916
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5916
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L5915
@L5916:
	ld	 r4,r21,4
	or	 r2,r0,r21
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r21,r0,r2
@L5915:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8172
	cmp	 r13,r22,16
	ld.bu	 r2,r24,2
	bsr.n	 _memory_address_p
	ld	 r3,r24,4
	bcnd.n	 eq0,r2,@L5919
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L5918
	ld	 r13,r24,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5919
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5919
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L8172
	cmp	 r13,r22,16
@L5919:
	ld	 r4,r24,4
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L5918:
	cmp	 r13,r22,16
@L8172:
	bb1.n	 ne,r13,@L5920
	subu	 r13,r19,5
	bsr	 _abort
	align	 4
@L5920:
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L5921
	or.u	 r13,r0,hi16(_mode_unit_size)
	or	 r13,r13,lo16(_mode_unit_size)
	ld	 r12,r13[r22]
	or	 r3,r0,2
	cmp	 r13,r19,5
	bb1.n	 ne,r13,@L5922
	mak	 r2,r12,0<3>
	or	 r3,r0,1
@L5922:
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	st	 r2,r31,276
@L5921:
	or.u	 r23,r0,hi16(_mov_optab)
	ld	 r11,r23,lo16(_mov_optab)
	lda.d	 r13,r11[r22]
	ld	 r12,r13,4
	cmp	 r13,r12,210
	bb0.n	 ne,r13,@L5924
	or.u	 r13,r0,hi16(_insn_gen_function)
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r2,r0,r21
	ld	 r13,r13[r12]
	jsr.n	 r13
	or	 r3,r0,r24
	bsr.n	 _emit_insn
	addu	 r1,r1,@L8535
@L8536:
	align	 4
@L5924:
	subu	 r13,r19,5
	ld	 r15,r31,276
	cmp	 r13,r13,1
	extu	 r13,r13,1<ls>
	cmp	 r12,r15,16
	extu	 r12,r12,1<ne>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L5926
	mak	 r25,r15,0<3>
	addu	 r13,r11,r25
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L5926
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bsr.n	 _get_last_insn
	or	 r22,r0,r2
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L5927
	or	 r18,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r21
	bsr	 _emit_insn
@L5927:
	ld	 r13,r23,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	addu	 r13,r13,r25
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L5928
	or	 r19,r12,lo16(_insn_gen_function)
	ld	 r3,r31,276
	or	 r2,r0,r21
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8537
@L8538:
	align	 4
@L5928:
	ld	 r2,r31,276
	bsr.n	 _gen_highpart
	or	 r3,r0,r21
@L7913:
	or	 r25,r0,r2
	ld	 r2,r31,276
	bsr.n	 _gen_highpart
	or	 r3,r0,r24
	or	 r3,r0,r2
	ld	 r13,r19[r23]
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r15,r31,276
	ld	 r13,r13,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	lda.d	 r13,r13[r15]
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L5930
	or	 r19,r12,lo16(_insn_gen_function)
	ld	 r3,r31,276
	or	 r2,r0,r21
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8539
@L8540:
	align	 4
@L5930:
	ld	 r2,r31,276
	bsr.n	 _gen_lowpart
	or	 r3,r0,r21
@L7914:
	or	 r25,r0,r2
	ld	 r2,r31,276
	bsr.n	 _gen_lowpart
	or	 r3,r0,r24
	ld	 r13,r19[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	bcnd	 eq0,r18,@L5933
	ld	 r24,r18,12
	br	 @L5934
	align	 4
@L5933:
	bsr	 _get_insns
	or	 r24,r0,r2
@L5934:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	st	 r2,r24,28
	bsr.n	 _get_last_insn
	addu	 r1,r1,@L8541
@L8542:
	align	 4
@L5926:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r23,r13,lo16(_mode_size)
	ld	 r13,r23[r22]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L5936
	bsr.n	 _get_last_insn
	or	 r25,r0,0
	or	 r19,r0,r2
	or	 r18,r0,r23
@L5937:
	ld	 r12,r18[r22]
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L5941
	addu	 r13,r12,6
@L5941:
	ext	 r13,r13,0<2>
	cmp	 r13,r25,r13
	bb0.n	 lt,r13,@L5938
	or	 r2,r0,r21
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r23,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r3,r0,r2
	bcnd.n	 ne0,r3,@L8173
	cmp	 r13,r23,0
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5943
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5943
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L5942
	or	 r2,r0,r24
@L5943:
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r3,r0,r25
	or	 r4,r0,1
	or	 r5,r0,r22
	bsr.n	 _operand_subword
	addu	 r1,r1,@L8543
@L8544:
	align	 4
@L5942:
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r22
@L7915:
	or	 r3,r0,r2
	cmp	 r13,r23,0
@L8173:
	cmp	 r12,r3,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L5946
	or	 r2,r0,r23
	bsr	 _abort
	align	 4
@L5946:
	addu	 r25,r25,1
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L8545
@L8546:
	align	 4
@L5938:
	bcnd	 eq0,r19,@L5948
	ld	 r24,r19,12
	br	 @L5949
	align	 4
@L5948:
	bsr	 _get_insns
	or	 r24,r0,r2
@L5949:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	br.n	 @L5891
	st	 r2,r24,28
	align	 4
@L5936:
	bsr	 _abort
	align	 4
@L5891:
	bsr	 _gen_label_rtx
	ld	 r15,r31,180
	cmp	 r13,r15,74
	bb1.n	 ne,r13,@L5951
	or	 r18,r0,r2
	ld	 r13,r20,20
	ld	 r13,r13,4
	ld	 r13,r13,8
	bb0.n	 (31-14),r13,@L5952
	or	 r2,r0,r17
	or	 r3,r0,r16
	or	 r4,r0,95
	br.n	 @L7916
	or	 r5,r0,1
	align	 4
@L5952:
	or	 r3,r0,r16
	br.n	 @L7917
	or	 r4,r0,91
	align	 4
@L5951:
	ld	 r13,r20,20
	ld	 r13,r13,4
	ld	 r13,r13,8
	bb0.n	 (31-14),r13,@L5955
	or	 r2,r0,r17
	or	 r3,r0,r16
	or	 r4,r0,97
	br.n	 @L7916
	or	 r5,r0,1
	align	 4
@L5955:
	or	 r3,r0,r16
	or	 r4,r0,93
@L7917:
	or	 r5,r0,0
@L7916:
	or	 r6,r0,r14
	or	 r7,r0,0
	bsr.n	 _compare_from_rtx
	or	 r8,r0,0
	or	 r19,r0,r2
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r13,r13,lo16(_const0_rtx)
	cmp	 r13,r19,r13
	bb1.n	 ne,r13,@L5957
	or.u	 r13,r0,hi16(_const_true_rtx)
	ld.hu	 r11,r0,r17
	ld.bu	 r22,r17,2
	or	 r21,r0,r17
	or.u	 r13,r0,hi16(_mode_class)
	or	 r13,r13,lo16(_mode_class)
	cmp	 r12,r11,59
	ld	 r20,r13[r22]
	bb0.n	 ne,r12,@L5960
	or	 r24,r0,r16
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L5963
	cmp	 r13,r11,63
	ld	 r2,r17,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L5964
	st	 r2,r17,4
	align	 4
@L5963:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5964
	ld	 r2,r17,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r17,4
	ld	 r2,r17,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r17,8
@L5964:
	br.n	 @L5959
	or	 r2,r0,r21
	align	 4
@L5960:
	ld	 r13,r17,8
	bcnd	 ne0,r13,@L5966
	ld	 r2,r17,4
	br	 @L5959
	align	 4
@L5966:
	ld	 r2,r17,12
	bcnd	 ne0,r2,@L5959
	ld	 r13,r17,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r17,4
	bsr.n	 _gen_move_insn
	st	 r2,r17,12
	bsr.n	 _emit_insn_before
	ld	 r3,r17,8
	ld	 r2,r17,12
@L5959:
	ld.hu	 r12,r0,r24
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L5969
	or	 r21,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L8174
	cmp	 r13,r12,63
	ld.bu	 r13,r24,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L5970
	ld	 r23,r24,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5970
	ld	 r13,r23,4
	st	 r13,r24,4
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L5973
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r24,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r24
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	br.n	 @L5968
	or	 r2,r0,r25
	align	 4
@L5970:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L5972
	cmp	 r13,r12,63
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L5973
	st	 r2,r24,4
	align	 4
@L5972:
@L8174:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L5973
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,4
	ld	 r2,r24,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,8
@L5973:
	br.n	 @L5968
	or	 r2,r0,r24
	align	 4
@L5969:
	ld	 r13,r24,8
	bcnd	 ne0,r13,@L5975
	ld	 r2,r24,4
	br.n	 @L8175
	cmp	 r13,r22,16
	align	 4
@L5975:
	ld	 r2,r24,12
	bcnd.n	 ne0,r2,@L8175
	cmp	 r13,r22,16
	ld	 r13,r24,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r24,4
	bsr.n	 _gen_move_insn
	st	 r2,r24,12
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	ld	 r2,r24,12
@L5968:
	cmp	 r13,r22,16
@L8175:
	bb0.n	 ne,r13,@L5978
	or	 r24,r0,r2
	ld.bu	 r13,r24,2
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L5977
	ld.bu	 r13,r24,2
	bcnd	 eq0,r13,@L5977
@L5978:
	bsr	 _abort
	align	 4
@L5977:
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5980
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5980
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L5979
@L5980:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,47
	bb1	 ne,r13,@L5979
	ld.bu	 r13,r24,2
	bcnd.n	 eq0,r13,@L5979
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
@L5979:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,55
	bb1	 ne,r13,@L5981
	ld.bu	 r2,r21,2
	bsr.n	 _memory_address_p
	ld	 r3,r21,4
	bcnd.n	 ne0,r2,@L8176
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bcnd.n	 eq0,r2,@L5982
	or.u	 r13,r0,hi16(_flag_force_addr)
@L8176:
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L5981
	ld	 r13,r21,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5982
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5982
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L5981
@L5982:
	ld	 r4,r21,4
	or	 r2,r0,r21
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r21,r0,r2
@L5981:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8177
	cmp	 r13,r22,16
	ld.bu	 r2,r24,2
	bsr.n	 _memory_address_p
	ld	 r3,r24,4
	bcnd.n	 eq0,r2,@L5985
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L5984
	ld	 r13,r24,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5985
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L5985
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L8177
	cmp	 r13,r22,16
@L5985:
	ld	 r4,r24,4
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L5984:
	cmp	 r13,r22,16
@L8177:
	bb1.n	 ne,r13,@L5986
	subu	 r13,r20,5
	bsr	 _abort
	align	 4
@L5986:
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L5987
	or.u	 r13,r0,hi16(_mode_unit_size)
	or	 r13,r13,lo16(_mode_unit_size)
	ld	 r12,r13[r22]
	or	 r3,r0,2
	cmp	 r13,r20,5
	bb1.n	 ne,r13,@L5988
	mak	 r2,r12,0<3>
	or	 r3,r0,1
@L5988:
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	st	 r2,r31,284
@L5987:
	or.u	 r23,r0,hi16(_mov_optab)
	ld	 r11,r23,lo16(_mov_optab)
	lda.d	 r13,r11[r22]
	ld	 r12,r13,4
	cmp	 r13,r12,210
	bb1.n	 ne,r13,@L8178
	or.u	 r13,r0,hi16(_insn_gen_function)
	subu	 r13,r20,5
	ld	 r15,r31,284
	cmp	 r13,r13,1
	extu	 r13,r13,1<ls>
	cmp	 r12,r15,16
	extu	 r12,r12,1<ne>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L5992
	mak	 r25,r15,0<3>
	addu	 r13,r11,r25
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L5992
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bsr.n	 _get_last_insn
	or	 r22,r0,r2
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L5993
	or	 r19,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r21
	bsr	 _emit_insn
@L5993:
	ld	 r13,r23,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	addu	 r13,r13,r25
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L5994
	or	 r20,r12,lo16(_insn_gen_function)
	ld	 r3,r31,284
	or	 r2,r0,r21
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8547
@L8548:
	align	 4
@L5994:
	ld	 r2,r31,284
	bsr.n	 _gen_highpart
	or	 r3,r0,r21
@L7919:
	or	 r25,r0,r2
	ld	 r2,r31,284
	bsr.n	 _gen_highpart
	or	 r3,r0,r24
	or	 r3,r0,r2
	ld	 r13,r20[r23]
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r15,r31,284
	ld	 r13,r13,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	lda.d	 r13,r13[r15]
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L5996
	or	 r20,r12,lo16(_insn_gen_function)
	ld	 r3,r31,284
	or	 r2,r0,r21
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8549
@L8550:
	align	 4
@L5996:
	ld	 r2,r31,284
	bsr.n	 _gen_lowpart
	or	 r3,r0,r21
@L7920:
	or	 r25,r0,r2
	ld	 r2,r31,284
	bsr.n	 _gen_lowpart
	or	 r3,r0,r24
	ld	 r13,r20[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	bcnd	 eq0,r19,@L6062
	br	 @L7998
	align	 4
@L5992:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r23,r13,lo16(_mode_size)
	ld	 r13,r23[r22]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L6002
	bsr.n	 _get_last_insn
	or	 r25,r0,0
	or	 r20,r0,r2
	or	 r19,r0,r23
@L6003:
	ld	 r12,r19[r22]
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L6007
	addu	 r13,r12,6
@L6007:
	ext	 r13,r13,0<2>
	cmp	 r13,r25,r13
	bb0.n	 lt,r13,@L6004
	or	 r2,r0,r21
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r23,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r3,r0,r2
	bcnd.n	 ne0,r3,@L8179
	cmp	 r13,r23,0
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6009
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6009
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L6008
	or	 r2,r0,r24
@L6009:
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r3,r0,r25
	or	 r4,r0,1
	or	 r5,r0,r22
	bsr.n	 _operand_subword
	addu	 r1,r1,@L8551
@L8552:
	align	 4
@L6008:
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r22
@L7921:
	or	 r3,r0,r2
	cmp	 r13,r23,0
@L8179:
	cmp	 r12,r3,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L6012
	or	 r2,r0,r23
	bsr	 _abort
	align	 4
@L6012:
	addu	 r25,r25,1
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L8553
@L8554:
	align	 4
@L6004:
	bcnd	 eq0,r20,@L6077
	br	 @L7999
	align	 4
@L6002:
	bsr	 _abort
	align	 4
@L5957:
	ld	 r13,r13,lo16(_const_true_rtx)
	cmp	 r13,r19,r13
	bb0.n	 ne,r13,@L6017
	or.u	 r13,r0,hi16(_bcc_gen_fctn)
	ld.hu	 r12,r0,r19
	or	 r13,r13,lo16(_bcc_gen_fctn)
	ld	 r13,r13[r12]
	bcnd	 eq0,r13,@L6019
	jsr.n	 r13
	or	 r2,r0,r18
	bsr.n	 _emit_jump_insn
	addu	 r1,r1,@L8555
@L8556:
	align	 4
@L6019:
	bsr	 _abort
	align	 4
@L6020:
	ld.hu	 r11,r0,r17
	ld.bu	 r22,r17,2
	or	 r21,r0,r17
	or.u	 r13,r0,hi16(_mode_class)
	or	 r13,r13,lo16(_mode_class)
	cmp	 r12,r11,59
	ld	 r20,r13[r22]
	bb0.n	 ne,r12,@L6023
	or	 r24,r0,r16
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L6026
	cmp	 r13,r11,63
	ld	 r2,r17,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L6027
	st	 r2,r17,4
	align	 4
@L6026:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L6027
	ld	 r2,r17,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r17,4
	ld	 r2,r17,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r17,8
@L6027:
	br.n	 @L6022
	or	 r2,r0,r21
	align	 4
@L6023:
	ld	 r13,r17,8
	bcnd	 ne0,r13,@L6029
	ld	 r2,r17,4
	br	 @L6022
	align	 4
@L6029:
	ld	 r2,r17,12
	bcnd	 ne0,r2,@L6022
	ld	 r13,r17,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r17,4
	bsr.n	 _gen_move_insn
	st	 r2,r17,12
	bsr.n	 _emit_insn_before
	ld	 r3,r17,8
	ld	 r2,r17,12
@L6022:
	ld.hu	 r12,r0,r24
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L6032
	or	 r21,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L8180
	cmp	 r13,r12,63
	ld.bu	 r13,r24,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L6033
	ld	 r23,r24,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L6033
	ld	 r13,r23,4
	st	 r13,r24,4
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L6036
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r24,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r24
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	br.n	 @L6031
	or	 r2,r0,r25
	align	 4
@L6033:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L6035
	cmp	 r13,r12,63
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L6036
	st	 r2,r24,4
	align	 4
@L6035:
@L8180:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L6036
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,4
	ld	 r2,r24,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,8
@L6036:
	br.n	 @L6031
	or	 r2,r0,r24
	align	 4
@L6032:
	ld	 r13,r24,8
	bcnd	 ne0,r13,@L6038
	ld	 r2,r24,4
	br.n	 @L8181
	cmp	 r13,r22,16
	align	 4
@L6038:
	ld	 r2,r24,12
	bcnd.n	 ne0,r2,@L8181
	cmp	 r13,r22,16
	ld	 r13,r24,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r24,4
	bsr.n	 _gen_move_insn
	st	 r2,r24,12
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	ld	 r2,r24,12
@L6031:
	cmp	 r13,r22,16
@L8181:
	bb0.n	 ne,r13,@L6041
	or	 r24,r0,r2
	ld.bu	 r13,r24,2
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L6040
	ld.bu	 r13,r24,2
	bcnd	 eq0,r13,@L6040
@L6041:
	bsr	 _abort
	align	 4
@L6040:
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6043
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6043
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L6042
@L6043:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,47
	bb1	 ne,r13,@L6042
	ld.bu	 r13,r24,2
	bcnd.n	 eq0,r13,@L6042
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
@L6042:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,55
	bb1	 ne,r13,@L6044
	ld.bu	 r2,r21,2
	bsr.n	 _memory_address_p
	ld	 r3,r21,4
	bcnd.n	 ne0,r2,@L8182
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bcnd.n	 eq0,r2,@L6045
	or.u	 r13,r0,hi16(_flag_force_addr)
@L8182:
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L6044
	ld	 r13,r21,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6045
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6045
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L6044
@L6045:
	ld	 r4,r21,4
	or	 r2,r0,r21
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r21,r0,r2
@L6044:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8183
	cmp	 r13,r22,16
	ld.bu	 r2,r24,2
	bsr.n	 _memory_address_p
	ld	 r3,r24,4
	bcnd.n	 eq0,r2,@L6048
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L6047
	ld	 r13,r24,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6048
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6048
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L8183
	cmp	 r13,r22,16
@L6048:
	ld	 r4,r24,4
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L6047:
	cmp	 r13,r22,16
@L8183:
	bb1.n	 ne,r13,@L6049
	subu	 r13,r20,5
	bsr	 _abort
	align	 4
@L6049:
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L6050
	or.u	 r13,r0,hi16(_mode_unit_size)
	or	 r13,r13,lo16(_mode_unit_size)
	ld	 r12,r13[r22]
	or	 r3,r0,2
	cmp	 r13,r20,5
	bb1.n	 ne,r13,@L6051
	mak	 r2,r12,0<3>
	or	 r3,r0,1
@L6051:
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	st	 r2,r31,292
@L6050:
	or.u	 r23,r0,hi16(_mov_optab)
	ld	 r11,r23,lo16(_mov_optab)
	lda.d	 r13,r11[r22]
	ld	 r12,r13,4
	cmp	 r13,r12,210
	bb0.n	 ne,r13,@L6053
	or.u	 r13,r0,hi16(_insn_gen_function)
@L8178:
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r2,r0,r21
	ld	 r13,r13[r12]
	jsr.n	 r13
	or	 r3,r0,r24
	bsr.n	 _emit_insn
	addu	 r1,r1,@L8557
@L8558:
	align	 4
@L6053:
	subu	 r13,r20,5
	ld	 r15,r31,292
	cmp	 r13,r13,1
	extu	 r13,r13,1<ls>
	cmp	 r12,r15,16
	extu	 r12,r12,1<ne>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L6055
	mak	 r25,r15,0<3>
	addu	 r13,r11,r25
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L6055
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bsr.n	 _get_last_insn
	or	 r22,r0,r2
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L6056
	or	 r19,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r21
	bsr	 _emit_insn
@L6056:
	ld	 r13,r23,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	addu	 r13,r13,r25
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L6057
	or	 r20,r12,lo16(_insn_gen_function)
	ld	 r3,r31,292
	or	 r2,r0,r21
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8559
@L8560:
	align	 4
@L6057:
	ld	 r2,r31,292
	bsr.n	 _gen_highpart
	or	 r3,r0,r21
@L7922:
	or	 r25,r0,r2
	ld	 r2,r31,292
	bsr.n	 _gen_highpart
	or	 r3,r0,r24
	or	 r3,r0,r2
	ld	 r13,r20[r23]
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r15,r31,292
	ld	 r13,r13,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	lda.d	 r13,r13[r15]
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L6059
	or	 r20,r12,lo16(_insn_gen_function)
	ld	 r3,r31,292
	or	 r2,r0,r21
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8561
@L8562:
	align	 4
@L6059:
	ld	 r2,r31,292
	bsr.n	 _gen_lowpart
	or	 r3,r0,r21
@L7923:
	or	 r25,r0,r2
	ld	 r2,r31,292
	bsr.n	 _gen_lowpart
	or	 r3,r0,r24
	ld	 r13,r20[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	bcnd	 eq0,r19,@L6062
@L7998:
	ld	 r24,r19,12
	br	 @L6063
	align	 4
@L6062:
	bsr	 _get_insns
	or	 r24,r0,r2
@L6063:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	st	 r2,r24,28
	bsr.n	 _get_last_insn
	addu	 r1,r1,@L8563
@L8564:
	align	 4
@L6055:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r23,r13,lo16(_mode_size)
	ld	 r13,r23[r22]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L6065
	bsr.n	 _get_last_insn
	or	 r25,r0,0
	or	 r20,r0,r2
	or	 r19,r0,r23
@L6066:
	ld	 r12,r19[r22]
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L6070
	addu	 r13,r12,6
@L6070:
	ext	 r13,r13,0<2>
	cmp	 r13,r25,r13
	bb0.n	 lt,r13,@L6067
	or	 r2,r0,r21
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r23,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r3,r0,r2
	bcnd.n	 ne0,r3,@L8184
	cmp	 r13,r23,0
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6072
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6072
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L6071
	or	 r2,r0,r24
@L6072:
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r3,r0,r25
	or	 r4,r0,1
	or	 r5,r0,r22
	bsr.n	 _operand_subword
	addu	 r1,r1,@L8565
@L8566:
	align	 4
@L6071:
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r22
@L7924:
	or	 r3,r0,r2
	cmp	 r13,r23,0
@L8184:
	cmp	 r12,r3,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L6075
	or	 r2,r0,r23
	bsr	 _abort
	align	 4
@L6075:
	addu	 r25,r25,1
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L8567
@L8568:
	align	 4
@L6067:
	bcnd	 eq0,r20,@L6077
@L7999:
	ld	 r24,r20,12
	br	 @L6078
	align	 4
@L6077:
	bsr	 _get_insns
	or	 r24,r0,r2
@L6078:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	br.n	 @L6017
	st	 r2,r24,28
	align	 4
@L6065:
	bsr	 _abort
	align	 4
@L6017:
	br.n	 @L7853
	or	 r2,r0,r18
	align	 4
@L6080:
	ld	 r2,r20,16
	or	 r3,r0,r16
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r18,r0,r2
	or	 r2,r0,r14
	or	 r5,r0,r17
	or.u	 r13,r0,hi16(_one_cmpl_optab)
	or	 r6,r0,1
	ld	 r3,r13,lo16(_one_cmpl_optab)
	bsr.n	 _expand_unop
	or	 r4,r0,r18
	or	 r19,r0,r2
	bcnd.n	 ne0,r19,@L7200
	or	 r2,r0,r19
	bsr	 _abort
	align	 4
@L6082:
	ld	 r2,r20,16
	or	 r3,r0,r16
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r18,r0,r2
	or	 r2,r0,r14
	or	 r5,r0,r17
	or.u	 r13,r0,hi16(_ffs_optab)
	or	 r6,r0,1
	ld	 r3,r13,lo16(_ffs_optab)
	bsr.n	 _expand_unop
	or	 r4,r0,r18
	or	 r19,r0,r2
	bcnd.n	 ne0,r19,@L7200
	or	 r2,r0,r19
	bsr	 _abort
	align	 4
@L6085:
	or.u	 r13,r0,hi16(_and_optab)
	ld	 r13,r13,lo16(_and_optab)
	br.n	 @L5371
	st	 r13,r31,372
	align	 4
@L6087:
	or.u	 r13,r0,hi16(_ior_optab)
	ld	 r13,r13,lo16(_ior_optab)
	br.n	 @L5371
	st	 r13,r31,372
	align	 4
@L6088:
	or.u	 r13,r0,hi16(_xor_optab)
	ld	 r13,r13,lo16(_xor_optab)
	br.n	 @L5371
	st	 r13,r31,372
	align	 4
@L6092:
	or	 r2,r0,r20
	or	 r23,r0,r16
	bsr.n	 _preexpand_calls
	or	 r21,r0,0
	ld	 r22,r20,20
	bcnd	 eq0,r16,@L6141
	ld.hu	 r13,r0,r16
	cmp	 r13,r13,53
	bb1	 ne,r13,@L6096
	ld	 r23,r16,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,51
	bb1	 ne,r13,@L6096
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L6094
	or	 r3,r0,0
@L6096:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8185
	or.u	 r13,r0,hi16(_tree_code_type)
	or.u	 r13,r0,hi16(_virtual_outgoing_args_rtx)
	ld	 r12,r23,4
	ld	 r11,r13,lo16(_virtual_outgoing_args_rtx)
	cmp	 r13,r12,r11
	bb0	 ne,r13,@L6141
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L8185
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r13,r12,4
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L6141
	or.u	 r13,r0,hi16(_tree_code_type)
@L8185:
	ld.bu	 r12,r22,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r13,r0,r13
	subu	 r11,r13,49
	or.u	 r13,r0,hi16(@L6139)
	cmp	 r12,r11,71
	bb0.n	 ls,r12,@L6100
	or	 r13,r13,lo16(@L6139)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L6139:
	word	 @L6109
	word	 @L6111
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6111
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6141
	word	 @L6101
	word	 @L6114
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6114
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6100
	word	 @L6103
	align	 4
@L6101:
	ld	 r21,r22,64
	br	 @L6100
	align	 4
@L6103:
	ld.bu	 r13,r22,8
	cmp	 r13,r13,3
	bb1.n	 ne,r13,@L6094
	or	 r3,r0,0
	ld	 r3,r22,16
	bcnd.n	 eq0,r3,@L6106
	or	 r25,r0,0
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6094
	or	 r3,r0,r25
@L6106:
	ld	 r3,r0,r22
	bcnd	 eq0,r3,@L6145
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd	 eq0,r2,@L8186
	or	 r25,r0,1
	br	 @L8186
	align	 4
@L6109:
	ld	 r3,r22,16
	br	 @L7926
	align	 4
@L6111:
	ld	 r3,r22,16
	or	 r2,r0,r23
	bsr.n	 _safe_from_p
	or	 r25,r0,0
	bcnd	 eq0,r2,@L6144
	ld	 r3,r22,20
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	cmp	 r2,r2,0
	br.n	 @L6144
	extu	 r25,r2,1<ne>
	align	 4
@L6114:
	ld.bu	 r13,r22,8
	subu	 r11,r13,39
	or.u	 r13,r0,hi16(@L6130)
	cmp	 r12,r11,67
	bb0.n	 ls,r12,@L6115
	or	 r13,r13,lo16(@L6130)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L6130:
	word	 @L6117
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6128
	word	 @L6119
	word	 @L6129
	word	 @L6126
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6115
	word	 @L6127
	word	 @L6124
	word	 @L6116
	align	 4
@L6116:
	bsr.n	 _staticp
	ld	 r2,r22,16
	br.n	 @L6094
	or	 r3,r0,r2
	align	 4
@L6117:
	ld.hu	 r13,r0,r23
	br.n	 @L7927
	cmp	 r13,r13,55
	align	 4
@L6119:
	ld	 r21,r22,24
	bcnd	 ne0,r21,@L7211
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,51
	bb1.n	 ne,r13,@L7927
	cmp	 r13,r12,55
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L7928
	cmp	 r13,r12,55
@L7927:
	bb1.n	 ne,r13,@L6115
	or	 r3,r0,0
	br	 @L6094
	align	 4
@L6124:
	ld	 r21,r22,20
	bcnd	 ne0,r21,@L7211
@L7928:
	br.n	 @L6094
	or	 r3,r0,0
	align	 4
@L6126:
	ld	 r21,r22,20
	br	 @L6115
	align	 4
@L6127:
	ld	 r21,r22,24
	br	 @L6115
	align	 4
@L6128:
	ld	 r3,r22,20
@L7926:
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	br.n	 @L6094
	or	 r3,r0,r2
	align	 4
@L6129:
	bsr	 _abort
	align	 4
@L6115:
	bcnd.n	 ne0,r21,@L7211
	or.u	 r13,r0,hi16(_tree_code_length)
	ld.bu	 r12,r22,8
	ld	 r13,r13,lo16(_tree_code_length)
	ld	 r19,r13[r12]
	cmp	 r13,r21,r19
	bb0.n	 lt,r13,@L6100
	or	 r24,r0,0
	mask	 r12,r19,3
	bcnd.n	 eq0,r12,@L6136
	or	 r25,r0,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L7462
	cmp	 r13,r12,2
	bb0	 gt,r13,@L7463
	ld	 r3,r22,16
	bcnd	 eq0,r3,@L7465
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6094
	or	 r3,r0,0
@L7465:
	addu	 r25,r22,4
	or	 r24,r0,1
@L7463:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7468
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6094
	or	 r3,r0,0
@L7468:
	addu	 r25,r25,4
	addu	 r24,r24,1
@L7462:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7471
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6094
	or	 r3,r0,0
@L7471:
	addu	 r24,r24,1
	cmp	 r13,r24,r19
	bb0.n	 lt,r13,@L6100
	addu	 r25,r25,4
@L6136:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7474
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6094
	or	 r3,r0,0
@L7474:
	ld	 r3,r25,20
	bcnd	 eq0,r3,@L7477
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6094
	or	 r3,r0,0
@L7477:
	ld	 r3,r25,24
	bcnd	 eq0,r3,@L7480
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6094
	or	 r3,r0,0
@L7480:
	ld	 r3,r25,28
	bcnd	 eq0,r3,@L7483
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6094
	or	 r3,r0,0
@L7483:
	addu	 r24,r24,4
	cmp	 r13,r24,r19
	bb1.n	 lt,r13,@L6136
	addu	 r25,r25,16
@L6100:
	bcnd.n	 eq0,r21,@L6094
	or	 r3,r0,1
@L7211:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L8187
	or	 r2,r0,r23
	ld	 r21,r21,4
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L8188
	or	 r3,r0,r21
	ld	 r13,r21,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L6094
	or	 r3,r0,0
@L8187:
	or	 r3,r0,r21
@L8188:
	bsr.n	 _rtx_equal_p
	or	 r25,r0,0
	bcnd.n	 ne0,r2,@L6094
	or	 r3,r0,r25
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1	 ne,r13,@L6145
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,55
	bb1	 ne,r13,@L6145
	ld	 r13,r22,8
	bb0	 (31-13),r13,@L6094
@L6145:
	or	 r25,r0,1
@L6144:
@L8186:
	br.n	 @L6094
	or	 r3,r0,r25
	align	 4
@L6141:
	or	 r3,r0,1
@L6094:
	ld	 r2,r20,16
	cmp	 r3,r3,0
	or	 r4,r0,0
	ext	 r3,r3,1<ne>
	or	 r5,r0,0
	bsr.n	 _expand_expr
	and	 r3,r16,r3
	ld	 r5,r20,20
	ld	 r7,r31,120
	or	 r18,r0,r2
	ld	 r2,r31,180
	or	 r3,r0,r14
	or	 r6,r0,r17
	or	 r4,r0,r18
	bsr	 _expand_shift
	br	 @L7200
	align	 4
@L6151:
	bsr.n	 _preexpand_calls
	or	 r2,r0,r20
	ld	 r4,r31,164
	bcnd	 ne0,r4,@L6152
	or	 r4,r0,r14
@L6152:
	or	 r2,r0,r20
	or	 r3,r0,r17
	bsr.n	 _do_store_flag
	or	 r5,r0,0
	or	 r19,r0,r2
	bcnd	 ne0,r19,@L7200
	ld	 r15,r31,180
	cmp	 r13,r15,96
	bb1	 ne,r13,@L6216
	bsr.n	 _integer_zerop
	ld	 r2,r20,20
	bcnd	 eq0,r2,@L6216
	ld	 r15,r31,372
	bcnd	 eq0,r15,@L6216
	ld.hu	 r13,r0,r15
	cmp	 r13,r13,51
	bb1	 ne,r13,@L6216
	ld	 r2,r20,16
	ld	 r13,r2,4
	ld.bu	 r12,r15,2
	ld.bu	 r13,r13,24
	cmp	 r12,r12,r13
	bb1.n	 ne,r12,@L6216
	or	 r4,r0,0
	ld	 r3,r31,372
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r19,r0,r2
	cmp	 r13,r19,r15
	bb0	 ne,r13,@L6155
	bsr	 _copy_to_reg
	or	 r19,r0,r2
@L6155:
	bsr.n	 _gen_label_rtx
	or	 r21,r0,r19
	or	 r16,r0,r2
	or	 r2,r0,r19
	or	 r4,r0,90
	ld.bu	 r6,r19,2
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r7,r31,120
	or	 r5,r0,0
	ld	 r3,r13,lo16(_const0_rtx)
	bsr.n	 _emit_cmp_insn
	or	 r8,r0,0
	bsr.n	 _gen_beq
	or	 r2,r0,r16
	bsr	 _emit_jump_insn
	or.u	 r13,r0,hi16(_const1_rtx)
	ld.hu	 r11,r0,r19
	ld	 r24,r13,lo16(_const1_rtx)
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r22,r19,2
	or	 r13,r13,lo16(_mode_class)
	cmp	 r12,r11,59
	ld	 r20,r13[r22]
	bb0.n	 ne,r12,@L6158
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L6161
	cmp	 r13,r11,63
	ld	 r2,r19,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L6162
	st	 r2,r19,4
	align	 4
@L6161:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L6162
	ld	 r2,r19,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r19,4
	ld	 r2,r19,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r19,8
@L6162:
	br.n	 @L6157
	or	 r2,r0,r21
	align	 4
@L6158:
	ld	 r13,r19,8
	bcnd	 ne0,r13,@L6164
	ld	 r2,r19,4
	br	 @L6157
	align	 4
@L6164:
	ld	 r2,r19,12
	bcnd	 ne0,r2,@L6157
	ld	 r13,r19,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r19,4
	bsr.n	 _gen_move_insn
	st	 r2,r19,12
	bsr.n	 _emit_insn_before
	ld	 r3,r19,8
	ld	 r2,r19,12
@L6157:
	ld.hu	 r12,r0,r24
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L6167
	or	 r21,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L8189
	cmp	 r13,r12,63
	ld.bu	 r13,r24,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L6168
	ld	 r23,r24,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L6168
	ld	 r13,r23,4
	st	 r13,r24,4
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L6171
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r24,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r24
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	br.n	 @L6166
	or	 r2,r0,r25
	align	 4
@L6168:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L6170
	cmp	 r13,r12,63
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L6171
	st	 r2,r24,4
	align	 4
@L6170:
@L8189:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L6171
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,4
	ld	 r2,r24,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,8
@L6171:
	br.n	 @L6166
	or	 r2,r0,r24
	align	 4
@L6167:
	ld	 r13,r24,8
	bcnd	 ne0,r13,@L6173
	ld	 r2,r24,4
	br.n	 @L8190
	cmp	 r13,r22,16
	align	 4
@L6173:
	ld	 r2,r24,12
	bcnd.n	 ne0,r2,@L8190
	cmp	 r13,r22,16
	ld	 r13,r24,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r24,4
	bsr.n	 _gen_move_insn
	st	 r2,r24,12
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	ld	 r2,r24,12
@L6166:
	cmp	 r13,r22,16
@L8190:
	bb0.n	 ne,r13,@L6176
	or	 r24,r0,r2
	ld.bu	 r13,r24,2
	cmp	 r13,r13,r22
	bb0	 ne,r13,@L6175
	ld.bu	 r13,r24,2
	bcnd	 eq0,r13,@L6175
@L6176:
	bsr	 _abort
	align	 4
@L6175:
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6178
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6178
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L6177
@L6178:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,47
	bb1	 ne,r13,@L6177
	ld.bu	 r13,r24,2
	bcnd.n	 eq0,r13,@L6177
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
@L6177:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,55
	bb1	 ne,r13,@L6179
	ld.bu	 r2,r21,2
	bsr.n	 _memory_address_p
	ld	 r3,r21,4
	bcnd.n	 ne0,r2,@L8191
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bcnd.n	 eq0,r2,@L6180
	or.u	 r13,r0,hi16(_flag_force_addr)
@L8191:
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L6179
	ld	 r13,r21,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6180
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6180
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L6179
@L6180:
	ld	 r4,r21,4
	or	 r2,r0,r21
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r21,r0,r2
@L6179:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8192
	cmp	 r13,r22,16
	ld.bu	 r2,r24,2
	bsr.n	 _memory_address_p
	ld	 r3,r24,4
	bcnd.n	 eq0,r2,@L6183
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L6182
	ld	 r13,r24,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6183
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6183
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L8192
	cmp	 r13,r22,16
@L6183:
	ld	 r4,r24,4
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L6182:
	cmp	 r13,r22,16
@L8192:
	bb1.n	 ne,r13,@L6184
	subu	 r13,r20,5
	bsr	 _abort
	align	 4
@L6184:
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L6185
	or.u	 r13,r0,hi16(_mode_unit_size)
	or	 r13,r13,lo16(_mode_unit_size)
	ld	 r12,r13[r22]
	or	 r3,r0,2
	cmp	 r13,r20,5
	bb1.n	 ne,r13,@L6186
	mak	 r2,r12,0<3>
	or	 r3,r0,1
@L6186:
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	st	 r2,r31,300
@L6185:
	or.u	 r23,r0,hi16(_mov_optab)
	ld	 r11,r23,lo16(_mov_optab)
	lda.d	 r13,r11[r22]
	ld	 r12,r13,4
	cmp	 r13,r12,210
	bb0.n	 ne,r13,@L6188
	or.u	 r13,r0,hi16(_insn_gen_function)
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r2,r0,r21
	ld	 r13,r13[r12]
	jsr.n	 r13
	or	 r3,r0,r24
	bsr.n	 _emit_insn
	addu	 r1,r1,@L8569
@L8570:
	align	 4
@L6188:
	subu	 r13,r20,5
	ld	 r15,r31,300
	cmp	 r13,r13,1
	extu	 r13,r13,1<ls>
	cmp	 r12,r15,16
	extu	 r12,r12,1<ne>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L6190
	mak	 r25,r15,0<3>
	addu	 r13,r11,r25
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L6190
	ld.bu	 r3,r21,2
	bsr.n	 _push_operand
	or	 r2,r0,r21
	bsr.n	 _get_last_insn
	or	 r22,r0,r2
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L6191
	or	 r18,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r21
	bsr	 _emit_insn
@L6191:
	ld	 r13,r23,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	addu	 r13,r13,r25
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L6192
	or	 r20,r12,lo16(_insn_gen_function)
	ld	 r3,r31,300
	or	 r2,r0,r21
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8571
@L8572:
	align	 4
@L6192:
	ld	 r2,r31,300
	bsr.n	 _gen_highpart
	or	 r3,r0,r21
@L7929:
	or	 r25,r0,r2
	ld	 r2,r31,300
	bsr.n	 _gen_highpart
	or	 r3,r0,r24
	or	 r3,r0,r2
	ld	 r13,r20[r23]
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r15,r31,300
	ld	 r13,r13,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	lda.d	 r13,r13[r15]
	ld	 r23,r13,4
	bcnd.n	 eq0,r22,@L6194
	or	 r20,r12,lo16(_insn_gen_function)
	ld	 r3,r31,300
	or	 r2,r0,r21
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8573
@L8574:
	align	 4
@L6194:
	ld	 r2,r31,300
	bsr.n	 _gen_lowpart
	or	 r3,r0,r21
@L7930:
	or	 r25,r0,r2
	ld	 r2,r31,300
	bsr.n	 _gen_lowpart
	or	 r3,r0,r24
	ld	 r13,r20[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	bcnd	 eq0,r18,@L6197
	ld	 r24,r18,12
	br	 @L6198
	align	 4
@L6197:
	bsr	 _get_insns
	or	 r24,r0,r2
@L6198:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	st	 r2,r24,28
	bsr.n	 _get_last_insn
	addu	 r1,r1,@L8575
@L8576:
	align	 4
@L6190:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r23,r13,lo16(_mode_size)
	ld	 r13,r23[r22]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L6200
	bsr.n	 _get_last_insn
	or	 r25,r0,0
	or	 r20,r0,r2
	or	 r18,r0,r23
@L6201:
	ld	 r12,r18[r22]
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L6205
	addu	 r13,r12,6
@L6205:
	ext	 r13,r13,0<2>
	cmp	 r13,r25,r13
	bb0.n	 lt,r13,@L6202
	or	 r2,r0,r21
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r23,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r22
	or	 r3,r0,r2
	bcnd.n	 ne0,r3,@L8193
	cmp	 r13,r23,0
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6207
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6207
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L6206
	or	 r2,r0,r24
@L6207:
	or	 r2,r0,r22
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r3,r0,r25
	or	 r4,r0,1
	or	 r5,r0,r22
	bsr.n	 _operand_subword
	addu	 r1,r1,@L8577
@L8578:
	align	 4
@L6206:
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r22
@L7931:
	or	 r3,r0,r2
	cmp	 r13,r23,0
@L8193:
	cmp	 r12,r3,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L6210
	or	 r2,r0,r23
	bsr	 _abort
	align	 4
@L6210:
	addu	 r25,r25,1
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L8579
@L8580:
	align	 4
@L6202:
	bcnd	 eq0,r20,@L6212
	ld	 r24,r20,12
	br	 @L6213
	align	 4
@L6212:
	bsr	 _get_insns
	or	 r24,r0,r2
@L6213:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	br.n	 @L6156
	st	 r2,r24,28
	align	 4
@L6200:
	bsr	 _abort
	align	 4
@L6156:
	or	 r2,r0,r16
	bsr	 _emit_label
	br	 @L7199
	align	 4
@L6216:
	bcnd	 eq0,r17,@L6218
	ld.hu	 r13,r0,r17
	or	 r23,r0,r17
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L6221
	or	 r22,r0,0
	ld	 r23,r17,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,51
	bb1	 ne,r13,@L6221
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L6219
	or	 r2,r0,0
@L6221:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8194
	or.u	 r13,r0,hi16(_tree_code_type)
	or.u	 r13,r0,hi16(_virtual_outgoing_args_rtx)
	ld	 r12,r23,4
	ld	 r11,r13,lo16(_virtual_outgoing_args_rtx)
	cmp	 r13,r12,r11
	bb0	 ne,r13,@L6266
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L8194
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r13,r12,4
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L6266
	or.u	 r13,r0,hi16(_tree_code_type)
@L8194:
	ld.bu	 r12,r20,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r13,r0,r13
	subu	 r11,r13,49
	or.u	 r13,r0,hi16(@L6264)
	cmp	 r12,r11,71
	bb0.n	 ls,r12,@L6225
	or	 r13,r13,lo16(@L6264)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L6264:
	word	 @L6234
	word	 @L6236
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6236
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6266
	word	 @L6226
	word	 @L6239
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6239
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6225
	word	 @L6228
	align	 4
@L6226:
	ld	 r22,r20,64
	br	 @L6225
	align	 4
@L6228:
	ld.bu	 r13,r20,8
	cmp	 r13,r13,3
	bb1.n	 ne,r13,@L6219
	or	 r2,r0,0
	ld	 r3,r20,16
	bcnd.n	 eq0,r3,@L6231
	or	 r25,r0,0
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6219
	or	 r2,r0,r25
@L6231:
	ld	 r3,r0,r20
	bcnd	 eq0,r3,@L6270
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6219
	or	 r2,r0,r25
	br.n	 @L8195
	or	 r25,r0,1
	align	 4
@L6234:
	ld	 r3,r20,16
	br.n	 @L8196
	or	 r2,r0,r23
	align	 4
@L6236:
	ld	 r3,r20,16
	or	 r2,r0,r23
	bsr.n	 _safe_from_p
	or	 r25,r0,0
	bcnd	 eq0,r2,@L6269
	ld	 r3,r20,20
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	cmp	 r2,r2,0
	br.n	 @L6269
	extu	 r25,r2,1<ne>
	align	 4
@L6239:
	ld.bu	 r13,r20,8
	subu	 r11,r13,39
	or.u	 r13,r0,hi16(@L6255)
	cmp	 r12,r11,67
	bb0.n	 ls,r12,@L6240
	or	 r13,r13,lo16(@L6255)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L6255:
	word	 @L6242
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6253
	word	 @L6244
	word	 @L6254
	word	 @L6251
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6240
	word	 @L6252
	word	 @L6249
	word	 @L6241
	align	 4
@L6241:
	ld	 r2,r20,16
	bsr.n	 _staticp
	addu	 r1,r1,@L8581
@L8582:
	align	 4
@L6242:
	ld.hu	 r13,r0,r23
	br.n	 @L7934
	cmp	 r13,r13,55
	align	 4
@L6244:
	ld	 r22,r20,24
	bcnd	 ne0,r22,@L7212
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,51
	bb1.n	 ne,r13,@L7934
	cmp	 r13,r12,55
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L7935
	cmp	 r13,r12,55
@L7934:
	bb1.n	 ne,r13,@L6240
	or	 r2,r0,0
	br	 @L6219
	align	 4
@L6249:
	ld	 r22,r20,20
	bcnd	 ne0,r22,@L7212
@L7935:
	br.n	 @L6219
	or	 r2,r0,0
	align	 4
@L6251:
	ld	 r22,r20,20
	br	 @L6240
	align	 4
@L6252:
	ld	 r22,r20,24
	br	 @L6240
	align	 4
@L6253:
	ld	 r3,r20,20
	or	 r2,r0,r23
@L8196:
	bsr.n	 _safe_from_p
	addu	 r1,r1,@L8583
@L8584:
	align	 4
@L6254:
	bsr	 _abort
	align	 4
@L6240:
	bcnd.n	 ne0,r22,@L7212
	or.u	 r13,r0,hi16(_tree_code_length)
	ld.bu	 r12,r20,8
	ld	 r13,r13,lo16(_tree_code_length)
	ld	 r21,r13[r12]
	cmp	 r13,r22,r21
	bb0.n	 lt,r13,@L6225
	or	 r24,r0,0
	mask	 r12,r21,3
	bcnd.n	 eq0,r12,@L6261
	or	 r25,r0,r20
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L7436
	cmp	 r13,r12,2
	bb0	 gt,r13,@L7437
	ld	 r3,r20,16
	bcnd	 eq0,r3,@L7439
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6219
	or	 r2,r0,0
@L7439:
	addu	 r25,r20,4
	or	 r24,r0,1
@L7437:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7442
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6219
	or	 r2,r0,0
@L7442:
	addu	 r25,r25,4
	addu	 r24,r24,1
@L7436:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7445
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6219
	or	 r2,r0,0
@L7445:
	addu	 r24,r24,1
	cmp	 r13,r24,r21
	bb0.n	 lt,r13,@L6225
	addu	 r25,r25,4
@L6261:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7448
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6219
	or	 r2,r0,0
@L7448:
	ld	 r3,r25,20
	bcnd	 eq0,r3,@L7451
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6219
	or	 r2,r0,0
@L7451:
	ld	 r3,r25,24
	bcnd	 eq0,r3,@L7454
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6219
	or	 r2,r0,0
@L7454:
	ld	 r3,r25,28
	bcnd	 eq0,r3,@L7457
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6219
	or	 r2,r0,0
@L7457:
	addu	 r24,r24,4
	cmp	 r13,r24,r21
	bb1.n	 lt,r13,@L6261
	addu	 r25,r25,16
@L6225:
	bcnd.n	 eq0,r22,@L6219
	or	 r2,r0,1
@L7212:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L8197
	or	 r2,r0,r23
	ld	 r22,r22,4
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L8198
	or	 r3,r0,r22
	ld	 r13,r22,4
	cmp	 r13,r13,63
	bb1	 le,r13,@L7935
@L8197:
	or	 r3,r0,r22
@L8198:
	bsr.n	 _rtx_equal_p
	or	 r25,r0,0
	bcnd	 ne0,r2,@L6269
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1	 ne,r13,@L6270
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,55
	bb1	 ne,r13,@L6270
	ld	 r13,r20,8
	bb0.n	 (31-13),r13,@L6219
	or	 r2,r0,r25
@L6270:
	or	 r25,r0,1
@L6269:
@L8195:
	br.n	 @L6219
	or	 r2,r0,r25
	align	 4
@L6266:
	or	 r2,r0,1
@L6219:
	bcnd.n	 eq0,r2,@L6218
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd	 ne0,r13,@L6217
	ld.hu	 r13,r0,r17
	cmp	 r13,r13,51
	bb1	 ne,r13,@L6217
	ld	 r13,r17,4
	cmp	 r13,r13,63
	bb1	 gt,r13,@L6217
@L6218:
	ld	 r2,r31,164
	bcnd	 ne0,r2,@L6271
	or	 r2,r0,r14
@L6271:
	bsr	 _gen_reg_rtx
	or	 r17,r0,r2
@L6217:
	bsr.n	 _emit_clr_insn
	or	 r2,r0,r17
	bsr	 _gen_label_rtx
	or	 r16,r0,r2
	or	 r2,r0,r20
	bsr.n	 _jumpifnot
	or	 r3,r0,r16
	bsr.n	 _emit_0_to_1_insn
	or	 r2,r0,r17
	or	 r2,r0,r16
@L7853:
	bsr.n	 _emit_label
	subu	 r1,r1,@L8585
@L8586:
	align	 4
@L6272:
	ld	 r2,r20,16
	or	 r3,r0,r17
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r18,r0,r2
	or	 r2,r0,r14
	or	 r6,r0,r17
	or.u	 r13,r0,hi16(_xor_optab)
	or	 r7,r0,1
	ld	 r3,r13,lo16(_xor_optab)
	or.u	 r13,r0,hi16(_const1_rtx)
	or	 r8,r0,3
	ld	 r5,r13,lo16(_const1_rtx)
	bsr.n	 _expand_binop
	or	 r4,r0,r18
	or	 r19,r0,r2
	bcnd.n	 ne0,r19,@L7200
	or	 r2,r0,r19
	bsr	 _abort
	align	 4
@L6274:
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r2,r20,16
	or	 r4,r0,0
	ld	 r3,r13,lo16(_const0_rtx)
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or.u	 r13,r0,hi16(_pending_chain)
	ld	 r25,r13,lo16(_pending_chain)
	bcnd	 eq0,r25,@L6275
	or	 r24,r0,r13
@L6278:
	bsr.n	 _emit_insn
	ld	 r2,r25,16
	ld	 r13,r25,20
	st	 r2,r25,8
	or	 r25,r0,r13
	bcnd.n	 ne0,r25,@L6278
	st	 r25,r24,lo16(_pending_chain)
@L6275:
	ld	 r15,r31,188
	ld	 r2,r20,20
	bcnd.n	 eq0,r15,@L6280
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r3,r13,lo16(_const0_rtx)
	br.n	 @L8199
	or	 r4,r0,0
	align	 4
@L6280:
	or	 r3,r0,r17
@L6281:
	or	 r4,r0,0
@L8199:
	or	 r5,r0,0
	bsr	 _expand_expr
	br	 @L7200
	align	 4
@L6282:
	or.u	 r13,r0,hi16(_cleanups_this_call)
	ld	 r2,r20,20
	ld	 r15,r13,lo16(_cleanups_this_call)
	st	 r0,r31,308
	st	 r0,r31,316
	st	 r15,r31,324
	or	 r16,r0,0
	bsr.n	 _integer_onep
	st	 r0,r13,lo16(_cleanups_this_call)
	bcnd	 eq0,r2,@L6283
	bsr.n	 _integer_zerop
	ld	 r2,r20,24
	bcnd.n	 eq0,r2,@L6283
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r2,r20,16
	ld	 r13,r13,lo16(_tree_code_type)
	ld.bu	 r12,r2,8
	ld	 r13,r13[r12]
	ld.b	 r13,r0,r13
	cmp	 r13,r13,60
	bb1.n	 ne,r13,@L6283
	or	 r3,r0,r17
	or	 r4,r0,r14
	bsr.n	 _expand_expr
	or	 r5,r0,r19
	or	 r18,r0,r2
	ld.bu	 r13,r18,2
	cmp	 r13,r13,r14
	bb0	 ne,r13,@L7200
	bcnd	 ne0,r17,@L6285
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,r14
	or	 r17,r0,r2
@L6285:
	ld.bu	 r21,r17,2
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r22,r18,2
	or	 r13,r13,lo16(_mode_class)
	ld	 r12,r13[r21]
	or	 r20,r0,r17
	ld	 r13,r13[r22]
	or	 r23,r0,r18
	ld	 r19,r31,120
	cmp	 r12,r12,2
	cmp	 r13,r13,2
	extu	 r18,r12,1<eq>
	or	 r16,r0,99
	bcnd.n	 eq0,r19,@L6287
	extu	 r14,r13,1<eq>
	or	 r16,r0,100
@L6287:
	ld.hu	 r12,r0,r17
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L6290
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L6293
	cmp	 r13,r12,63
	ld	 r2,r17,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L6294
	st	 r2,r17,4
	align	 4
@L6293:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L6294
	ld	 r2,r17,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r17,4
	ld	 r2,r17,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r17,8
@L6294:
	br.n	 @L6289
	or	 r2,r0,r20
	align	 4
@L6290:
	ld	 r13,r17,8
	bcnd	 ne0,r13,@L6296
	ld	 r2,r17,4
	br	 @L6289
	align	 4
@L6296:
	ld	 r2,r17,12
	bcnd	 ne0,r2,@L6289
	ld	 r13,r17,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r17,4
	bsr.n	 _gen_move_insn
	st	 r2,r17,12
	bsr.n	 _emit_insn_before
	ld	 r3,r17,8
	ld	 r2,r17,12
@L6289:
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L6299
	or	 r20,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L8200
	cmp	 r13,r12,63
	ld.bu	 r13,r23,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L6300
	ld	 r24,r23,4
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L6300
	ld	 r13,r24,4
	st	 r13,r23,4
	ld	 r13,r24,8
	bcnd	 eq0,r13,@L6303
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r23,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r23
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	br.n	 @L6298
	or	 r2,r0,r25
	align	 4
@L6300:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L6302
	cmp	 r13,r12,63
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L6303
	st	 r2,r23,4
	align	 4
@L6302:
@L8200:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L6303
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,4
	ld	 r2,r23,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,8
@L6303:
	br.n	 @L6298
	or	 r2,r0,r23
	align	 4
@L6299:
	ld	 r13,r23,8
	bcnd	 ne0,r13,@L6305
	ld	 r2,r23,4
	br.n	 @L8201
	cmp	 r13,r18,r14
	align	 4
@L6305:
	ld	 r2,r23,12
	bcnd.n	 ne0,r2,@L8201
	cmp	 r13,r18,r14
	ld	 r13,r23,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r23,4
	bsr.n	 _gen_move_insn
	st	 r2,r23,12
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	ld	 r2,r23,12
@L6298:
	cmp	 r13,r18,r14
@L8201:
	bb0.n	 ne,r13,@L6307
	or	 r23,r0,r2
	bsr	 _abort
	align	 4
@L6307:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	ld	 r11,r0,r23
	and	 r13,r11,0x8
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L8202
	ld	 r13,r23,4
	or.u	 r12,r0,hi16(_mode_size)
	ld.bu	 r13,r13,2
	or	 r12,r12,lo16(_mode_size)
	ld	 r13,r12[r13]
	ld	 r12,r12[r21]
	cmp	 r13,r13,r12
	bb0.n	 ge,r13,@L6308
	extu	 r13,r11,1<5>
	cmp	 r13,r13,r19
	bb1.n	 ne,r13,@L6308
	or	 r2,r0,r21
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	or	 r22,r0,r21
	or	 r23,r0,r2
@L6308:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
@L8202:
	ld	 r13,r0,r20
	and	 r13,r13,0x8
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L6309
	cmp	 r13,r21,r22
	bsr	 _abort
	align	 4
@L6309:
	bb0.n	 ne,r13,@L8203
	or	 r2,r0,r20
	bcnd	 ne0,r22,@L6310
	ld.hu	 r12,r0,r23
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L8203
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L8203
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L6310
@L8203:
	or	 r3,r0,r23
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L8587
@L8588:
	align	 4
@L6310:
	bcnd.n	 eq0,r18,@L6312
	cmp	 r5,r22,8
	cmp	 r13,r21,9
	extu	 r11,r5,1<eq>
	extu	 r7,r13,1<eq>
	and	 r13,r11,r7
	bcnd.n	 ne0,r13,@L7936
	or	 r2,r0,108
	cmp	 r6,r21,11
	extu	 r12,r6,1<eq>
	and	 r13,r11,r12
	bcnd.n	 ne0,r13,@L7936
	or	 r2,r0,109
	cmp	 r8,r22,9
	extu	 r9,r8,1<eq>
	and	 r13,r9,r12
	bcnd.n	 eq0,r13,@L6315
	cmp	 r4,r21,11
	br.n	 @L7936
	or	 r2,r0,110
	align	 4
@L6315:
	cmp	 r10,r21,8
	extu	 r11,r10,1<eq>
	and	 r13,r9,r11
	bcnd.n	 ne0,r13,@L7936
	or	 r2,r0,111
	cmp	 r9,r22,11
	extu	 r12,r9,1<eq>
	and	 r13,r12,r11
	bcnd.n	 ne0,r13,@L7936
	or	 r2,r0,112
	and	 r13,r12,r7
	bcnd.n	 eq0,r13,@L6318
	cmp	 r12,r21,9
	or	 r2,r0,113
@L7936:
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_unop_insn
	subu	 r1,r1,@L8589
@L8590:
	align	 4
@L6318:
	bb0.n	 ne,r8,@L6328
	or	 r2,r0,0
	bb0.n	 ls,r8,@L6350
	cmp	 r13,r22,10
	bb0.n	 ne,r5,@L6320
	cmp	 r13,r21,10
	br	 @L6319
	align	 4
@L6350:
	bb0	 ne,r13,@L6336
	bb0	 ne,r9,@L6342
	br	 @L6319
	align	 4
@L6320:
	bb0	 ne,r13,@L6323
	bb0	 ls,r13,@L6327
	bb0.n	 ne,r12,@L6322
	or.u	 r13,r0,hi16(_extendsfdf2_libfunc)
	br	 @L6319
	align	 4
@L6327:
	bb0.n	 ne,r4,@L6324
	or.u	 r13,r0,hi16(_extendsftf2_libfunc)
	br	 @L6319
	align	 4
@L6322:
	ld	 r2,r13,lo16(_extendsfdf2_libfunc)
	br	 @L6319
	align	 4
@L6323:
	or.u	 r13,r0,hi16(_extendsfxf2_libfunc)
	ld	 r2,r13,lo16(_extendsfxf2_libfunc)
	br	 @L6319
	align	 4
@L6324:
	ld	 r2,r13,lo16(_extendsftf2_libfunc)
	br	 @L6319
	align	 4
@L6328:
	cmp	 r13,r21,10
	bb0	 ne,r13,@L6331
	bb0	 ls,r13,@L6335
	bb0.n	 ne,r10,@L6330
	or.u	 r13,r0,hi16(_truncdfsf2_libfunc)
	br	 @L6319
	align	 4
@L6335:
	bb0.n	 ne,r6,@L6332
	or.u	 r13,r0,hi16(_extenddftf2_libfunc)
	br	 @L6319
	align	 4
@L6330:
	ld	 r2,r13,lo16(_truncdfsf2_libfunc)
	br	 @L6319
	align	 4
@L6331:
	or.u	 r13,r0,hi16(_extenddfxf2_libfunc)
	ld	 r2,r13,lo16(_extenddfxf2_libfunc)
	br	 @L6319
	align	 4
@L6332:
	ld	 r2,r13,lo16(_extenddftf2_libfunc)
	br	 @L6319
	align	 4
@L6336:
	bb0.n	 ne,r10,@L6338
	or.u	 r13,r0,hi16(_truncxfsf2_libfunc)
	bb0.n	 ne,r12,@L6339
	or.u	 r13,r0,hi16(_truncxfdf2_libfunc)
	br	 @L6319
	align	 4
@L6338:
	ld	 r2,r13,lo16(_truncxfsf2_libfunc)
	br	 @L6319
	align	 4
@L6339:
	ld	 r2,r13,lo16(_truncxfdf2_libfunc)
	br	 @L6319
	align	 4
@L6342:
	bb0.n	 ne,r10,@L6344
	or.u	 r13,r0,hi16(_trunctfsf2_libfunc)
	bb0.n	 ne,r12,@L6345
	or.u	 r13,r0,hi16(_trunctfdf2_libfunc)
	br	 @L6319
	align	 4
@L6344:
	ld	 r2,r13,lo16(_trunctfsf2_libfunc)
	br	 @L6319
	align	 4
@L6345:
	ld	 r2,r13,lo16(_trunctfdf2_libfunc)
@L6319:
	bcnd.n	 ne0,r2,@L6351
	or	 r3,r0,1
	bsr	 _abort
	align	 4
@L6351:
	or	 r4,r0,r21
	or	 r5,r0,1
	or	 r6,r0,r23
	bsr.n	 _emit_library_call
	or	 r7,r0,r22
	or	 r2,r0,r21
	bsr.n	 _hard_libcall_value
	addu	 r1,r1,@L8591
@L8592:
	align	 4
@L6312:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r24,r13,lo16(_mode_size)
	ld	 r13,r24[r22]
	ld	 r12,r24[r21]
	mak	 r13,r13,0<3>
	mak	 r11,r12,0<3>
	cmp	 r13,r13,r11
	bb1.n	 ge,r13,@L8204
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r11,32
	bb0.n	 gt,r13,@L6352
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L6353
	addu	 r13,r12,6
@L6353:
	or	 r2,r0,r21
	or	 r3,r0,r22
	or	 r4,r0,r19
	bsr.n	 _can_extend_p
	ext	 r18,r13,0<2>
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb1.n	 ne,r13,@L8205
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r24[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L6356
	or.u	 r24,r0,hi16(_word_mode)
	or	 r2,r0,r21
	ld	 r3,r24,lo16(_word_mode)
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0	 ne,r13,@L6356
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r3,r0,r23
	bsr.n	 _convert_move
	or	 r4,r0,r19
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r4,r0,r2
	or	 r2,r0,r25
	br.n	 @L7938
	or	 r3,r0,r20
	align	 4
@L6356:
	bsr	 _start_sequence
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L6358
	or	 r25,r0,r22
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r25,r13,lo16(_word_mode)
	br.n	 @L8206
	or	 r2,r0,r25
	align	 4
@L6358:
	or	 r2,r0,r25
@L8206:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
	or	 r24,r0,r2
	or	 r2,r0,r25
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
	bcnd.n	 eq0,r19,@L6362
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r24,r13,lo16(_const0_rtx)
	br.n	 @L8207
	or.u	 r13,r0,hi16(_mode_size)
	align	 4
@L6362:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r2,r13[r25]
	mak	 r2,r2,0<3>
	bsr.n	 _size_int
	subu	 r2,r2,1
	or	 r5,r0,r2
	or	 r2,r0,78
	or	 r3,r0,r25
	or	 r4,r0,r24
	or	 r6,r0,0
	bsr.n	 _expand_shift
	or	 r7,r0,0
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_word_mode)
	or	 r4,r0,1
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _convert_to_mode
	or	 r3,r0,r24
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_mode_size)
@L8207:
	or	 r13,r13,lo16(_mode_size)
	ld	 r2,r13[r25]
	bcnd	 ge0,r2,@L6364
	addu	 r2,r2,3
@L6364:
	ext	 r22,r2,0<2>
	cmp	 r13,r22,r18
	bb0.n	 lt,r13,@L6366
	subu	 r13,r18,r22
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L6368
	subu	 r25,r18,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L7402
	cmp	 r13,r12,2
	bb0.n	 gt,r13,@L7403
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L7407
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7407:
	bb1	 eq,r13,@L7405
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7405:
	addu	 r22,r22,1
@L7403:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L7411
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7411:
	bb1	 eq,r13,@L7409
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7409:
	addu	 r22,r22,1
@L7402:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L7415
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7415:
	bb1	 eq,r13,@L7413
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7413:
	addu	 r22,r22,1
	cmp	 r13,r22,r18
	bb0	 lt,r13,@L6366
@L6368:
	or	 r2,r0,r20
@L8208:
	subu	 r3,r25,1
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L7419
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7419:
	bb1	 eq,r13,@L7417
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7417:
	or	 r2,r0,r20
	subu	 r3,r25,2
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L7423
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7423:
	bb1	 eq,r13,@L7421
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7421:
	or	 r2,r0,r20
	subu	 r3,r25,3
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L7427
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7427:
	bb1	 eq,r13,@L7425
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7425:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,4
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L7431
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L7431:
	bb1	 eq,r13,@L7429
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L7429:
	addu	 r22,r22,4
	cmp	 r13,r22,r18
	bb1.n	 lt,r13,@L8208
	or	 r2,r0,r20
@L6366:
	bsr	 _get_insns
	bsr.n	 _end_sequence
	or	 r25,r0,r2
	or	 r2,r0,r16
	or	 r3,r0,r21
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r6,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_no_conflict_block
	subu	 r1,r1,@L8593
@L8594:
	align	 4
@L6352:
	or.u	 r13,r0,hi16(_mode_size)
@L8204:
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,32
	bb0.n	 gt,r13,@L6372
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	or	 r2,r0,r20
	br.n	 @L7939
	or	 r4,r0,0
	align	 4
@L6372:
	cmp	 r13,r21,3
	bb1.n	 ne,r13,@L6373
	cmp	 r13,r22,3
	cmp	 r13,r22,4
	bb0.n	 ne,r13,@L6374
	or	 r2,r0,4
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
@L6374:
	bsr	 _abort
	align	 4
@L6373:
	bb1.n	 ne,r13,@L8209
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r21,4
	bb0.n	 ne,r13,@L6376
	or	 r2,r0,4
	or	 r3,r0,r23
	or	 r4,r0,r19
	bsr.n	 _convert_to_mode
	or	 r22,r0,4
	br.n	 @L6375
	or	 r23,r0,r2
	align	 4
@L6376:
	bsr	 _abort
	align	 4
@L6375:
	or.u	 r13,r0,hi16(_mode_size)
@L8209:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb1.n	 ge,r12,@L8210
	or.u	 r13,r0,hi16(_mode_size)
	ld	 r13,r0,r23
	or.u	 r12,r0,0x37
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L6380
	or.u	 r13,r0,hi16(_direct_load)
	or	 r13,r13,lo16(_direct_load)
	ld.b	 r13,r21,r13
	bcnd	 eq0,r13,@L6380
	bsr.n	 _mode_dependent_address_p
	ld	 r2,r23,4
	bcnd.n	 eq0,r2,@L8211
	or	 r2,r0,r21
@L6380:
	ld.hu	 r13,r0,r23
	cmp	 r12,r13,51
	cmp	 r13,r13,53
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L6378
	or	 r2,r0,r21
@L8211:
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	addu	 r1,r1,@L8595
@L8596:
	align	 4
@L6378:
	or.u	 r13,r0,hi16(_mode_size)
@L8210:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb0.n	 gt,r12,@L6381
	or	 r2,r0,r21
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0.n	 ne,r13,@L6382
	or.u	 r13,r0,hi16(_optimize)
@L8205:
	ld	 r13,r13,lo16(_optimize)
	bcnd	 le0,r13,@L6383
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L8212
	or	 r2,r0,r25
	or	 r2,r0,r22
	bsr.n	 _force_reg
	or	 r3,r0,r23
	or	 r23,r0,r2
@L6383:
	or	 r2,r0,r25
@L8212:
	or	 r3,r0,r20
	or	 r4,r0,r23
@L7938:
	or	 r5,r0,r16
	bsr.n	 _emit_unop_insn
	subu	 r1,r1,@L8597
@L8598:
	align	 4
@L6382:
	or	 r25,r0,r22
	bcnd.n	 eq0,r25,@L6386
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r24,r13,lo16(_mode_wider_mode)
	or	 r2,r0,r21
@L8213:
	or	 r3,r0,r25
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	cmp	 r2,r2,210
	bb1.n	 eq,r2,@L6387
	or	 r2,r0,r25
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,r19
	cmp	 r2,r2,210
	bb1.n	 ne,r2,@L7233
	or	 r2,r0,r25
@L6387:
	ld	 r25,r24[r25]
	bcnd.n	 ne0,r25,@L8213
	or	 r2,r0,r21
@L6386:
	bsr	 _abort
	align	 4
@L6381:
	cmp	 r13,r22,6
	extu	 r11,r13,1<eq>
	cmp	 r13,r21,4
	extu	 r13,r13,1<eq>
	and	 r13,r11,r13
	bcnd.n	 eq0,r13,@L6391
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L8599
@L8600:
	align	 4
@L6391:
	cmp	 r13,r21,2
	extu	 r9,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L6392
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L8601
@L8602:
	align	 4
@L6392:
	cmp	 r13,r21,1
	extu	 r10,r13,1<eq>
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L6393
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L8603
@L8604:
	align	 4
@L6393:
	cmp	 r13,r22,4
	extu	 r11,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L6394
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L8605
@L8606:
	align	 4
@L6394:
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L6395
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L8607
@L8608:
	align	 4
@L6395:
	cmp	 r13,r22,2
	extu	 r13,r13,1<eq>
	and	 r13,r13,r10
	bcnd.n	 eq0,r13,@L6396
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L8609
@L8610:
	align	 4
@L6396:
	bb1.n	 ge,r12,@L6397
	or	 r2,r0,r21
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	bsr.n	 _force_reg
	or	 r2,r0,r21
@L7937:
	or	 r3,r0,r2
	or	 r2,r0,r20
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L8611
@L8612:
	align	 4
@L6397:
	bsr	 _abort
	align	 4
@L7233:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,r19
@L7940:
	or	 r3,r0,r2
	or	 r2,r0,r20
	or	 r4,r0,r19
@L7939:
	bsr.n	 _convert_move
	subu	 r1,r1,@L8613
@L8614:
	align	 4
@L6283:
	ld	 r15,r31,188
	cmp	 r12,r14,0
	subu	 r13,r0,r15
	extu	 r12,r12,1<eq>
	subu	 r13,r0,r13
	or	 r12,r12,r13
	bcnd.n	 ne0,r12,@L6399
	or	 r19,r0,0
	ld	 r15,r31,372
	bcnd	 eq0,r15,@L6400
	ld.hu	 r13,r0,r15
	ld	 r23,r31,372
	cmp	 r13,r13,53
	ld	 r22,r20,16
	bb1.n	 ne,r13,@L6403
	or	 r21,r0,0
	ld	 r23,r15,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,51
	bb1	 ne,r13,@L6403
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L6401
	or	 r2,r0,0
@L6403:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8214
	or.u	 r13,r0,hi16(_tree_code_type)
	or.u	 r13,r0,hi16(_virtual_outgoing_args_rtx)
	ld	 r12,r23,4
	ld	 r11,r13,lo16(_virtual_outgoing_args_rtx)
	cmp	 r13,r12,r11
	bb0	 ne,r13,@L6448
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L8214
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r13,r12,4
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L6448
	or.u	 r13,r0,hi16(_tree_code_type)
@L8214:
	ld.bu	 r12,r22,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r13,r0,r13
	subu	 r11,r13,49
	or.u	 r13,r0,hi16(@L6446)
	cmp	 r12,r11,71
	bb0.n	 ls,r12,@L6407
	or	 r13,r13,lo16(@L6446)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L6446:
	word	 @L6416
	word	 @L6418
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6418
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6448
	word	 @L6408
	word	 @L6421
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6421
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6407
	word	 @L6410
	align	 4
@L6408:
	ld	 r21,r22,64
	br	 @L6407
	align	 4
@L6410:
	ld.bu	 r13,r22,8
	cmp	 r13,r13,3
	bb1.n	 ne,r13,@L6401
	or	 r2,r0,0
	ld	 r3,r22,16
	bcnd.n	 eq0,r3,@L6413
	or	 r25,r0,0
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6401
	or	 r2,r0,r25
@L6413:
	ld	 r3,r0,r22
	bcnd	 eq0,r3,@L6452
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6401
	or	 r2,r0,r25
	br.n	 @L8215
	or	 r25,r0,1
	align	 4
@L6416:
	ld	 r3,r22,16
	br.n	 @L8216
	or	 r2,r0,r23
	align	 4
@L6418:
	ld	 r3,r22,16
	or	 r2,r0,r23
	bsr.n	 _safe_from_p
	or	 r25,r0,0
	bcnd	 eq0,r2,@L6451
	ld	 r3,r22,20
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	cmp	 r2,r2,0
	br.n	 @L6451
	extu	 r25,r2,1<ne>
	align	 4
@L6421:
	ld.bu	 r13,r22,8
	subu	 r11,r13,39
	or.u	 r13,r0,hi16(@L6437)
	cmp	 r12,r11,67
	bb0.n	 ls,r12,@L6422
	or	 r13,r13,lo16(@L6437)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L6437:
	word	 @L6424
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6435
	word	 @L6426
	word	 @L6436
	word	 @L6433
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6422
	word	 @L6434
	word	 @L6431
	word	 @L6423
	align	 4
@L6423:
	ld	 r2,r22,16
	bsr.n	 _staticp
	addu	 r1,r1,@L8615
@L8616:
	align	 4
@L6424:
	ld.hu	 r13,r0,r23
	br.n	 @L7943
	cmp	 r13,r13,55
	align	 4
@L6426:
	ld	 r21,r22,24
	bcnd	 ne0,r21,@L7213
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,51
	bb1.n	 ne,r13,@L7943
	cmp	 r13,r12,55
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L7944
	cmp	 r13,r12,55
@L7943:
	bb1.n	 ne,r13,@L6422
	or	 r2,r0,0
	br	 @L6401
	align	 4
@L6431:
	ld	 r21,r22,20
	bcnd	 ne0,r21,@L7213
@L7944:
	br.n	 @L6401
	or	 r2,r0,0
	align	 4
@L6433:
	ld	 r21,r22,20
	br	 @L6422
	align	 4
@L6434:
	ld	 r21,r22,24
	br	 @L6422
	align	 4
@L6435:
	ld	 r3,r22,20
	or	 r2,r0,r23
@L8216:
	bsr.n	 _safe_from_p
	addu	 r1,r1,@L8617
@L8618:
	align	 4
@L6436:
	bsr	 _abort
	align	 4
@L6422:
	bcnd.n	 ne0,r21,@L7213
	or.u	 r13,r0,hi16(_tree_code_length)
	ld.bu	 r12,r22,8
	ld	 r13,r13,lo16(_tree_code_length)
	ld	 r19,r13[r12]
	cmp	 r13,r21,r19
	bb0.n	 lt,r13,@L6407
	or	 r24,r0,0
	mask	 r12,r19,3
	bcnd.n	 eq0,r12,@L6443
	or	 r25,r0,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L7375
	cmp	 r13,r12,2
	bb0	 gt,r13,@L7376
	ld	 r3,r22,16
	bcnd	 eq0,r3,@L7378
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6401
	or	 r2,r0,0
@L7378:
	addu	 r25,r22,4
	or	 r24,r0,1
@L7376:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7381
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6401
	or	 r2,r0,0
@L7381:
	addu	 r25,r25,4
	addu	 r24,r24,1
@L7375:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7384
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6401
	or	 r2,r0,0
@L7384:
	addu	 r24,r24,1
	cmp	 r13,r24,r19
	bb0.n	 lt,r13,@L6407
	addu	 r25,r25,4
@L6443:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7387
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6401
	or	 r2,r0,0
@L7387:
	ld	 r3,r25,20
	bcnd	 eq0,r3,@L7390
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6401
	or	 r2,r0,0
@L7390:
	ld	 r3,r25,24
	bcnd	 eq0,r3,@L7393
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6401
	or	 r2,r0,0
@L7393:
	ld	 r3,r25,28
	bcnd	 eq0,r3,@L7396
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6401
	or	 r2,r0,0
@L7396:
	addu	 r24,r24,4
	cmp	 r13,r24,r19
	bb1.n	 lt,r13,@L6443
	addu	 r25,r25,16
@L6407:
	bcnd.n	 eq0,r21,@L6401
	or	 r2,r0,1
@L7213:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L8217
	or	 r2,r0,r23
	ld	 r21,r21,4
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L8218
	or	 r3,r0,r21
	ld	 r13,r21,4
	cmp	 r13,r13,63
	bb1	 le,r13,@L7944
@L8217:
	or	 r3,r0,r21
@L8218:
	bsr.n	 _rtx_equal_p
	or	 r25,r0,0
	bcnd	 ne0,r2,@L6451
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1	 ne,r13,@L6452
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,55
	bb1	 ne,r13,@L6452
	ld	 r13,r22,8
	bb0.n	 (31-13),r13,@L6401
	or	 r2,r0,r25
@L6452:
	or	 r25,r0,1
@L6451:
@L8215:
	br.n	 @L6401
	or	 r2,r0,r25
	align	 4
@L6448:
	or	 r2,r0,1
@L6401:
	bcnd.n	 eq0,r2,@L8219
	cmp	 r13,r14,16
	ld	 r19,r31,372
	br.n	 @L8220
	or.u	 r13,r0,hi16(_tree_code_type)
	align	 4
@L6400:
	cmp	 r13,r14,16
@L8219:
	bb1	 ne,r13,@L6454
	ld	 r15,r31,172
	ld	 r12,r15,16
	bcnd	 eq0,r12,@L6456
	ld.bu	 r13,r12,8
	cmp	 r13,r13,25
	bb0	 ne,r13,@L6455
@L6456:
	bsr	 _abort
	align	 4
@L6455:
	ld	 r13,r12,12
	addu	 r3,r13,7
	bcnd	 ge0,r3,@L6457
	addu	 r3,r13,14
@L6457:
	ext	 r3,r3,0<3>
	or	 r2,r0,16
	or	 r4,r0,0
	bsr.n	 _assign_stack_temp
	addu	 r1,r1,@L8619
@L8620:
	align	 4
@L6454:
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,r14
@L7945:
	or	 r19,r0,r2
@L6399:
	or.u	 r13,r0,hi16(_tree_code_type)
@L8220:
	ld	 r11,r20,20
	ld	 r13,r13,lo16(_tree_code_type)
	ld.bu	 r12,r11,8
	ld	 r13,r13[r12]
	ld.b	 r13,r0,r13
	cmp	 r13,r13,50
	bb1.n	 ne,r13,@L8221
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r2,r20,24
	ld	 r3,r11,16
	bsr.n	 _operand_equal_p
	or	 r4,r0,0
	bcnd	 eq0,r2,@L6459
	ld	 r16,r20,24
	ld	 r15,r20,20
	br.n	 @L6460
	st	 r15,r31,308
	align	 4
@L6459:
	or.u	 r13,r0,hi16(_tree_code_type)
@L8221:
	ld	 r11,r20,24
	ld	 r13,r13,lo16(_tree_code_type)
	ld.bu	 r12,r11,8
	ld	 r13,r13[r12]
	ld.b	 r13,r0,r13
	cmp	 r13,r13,50
	bb1.n	 ne,r13,@L8222
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r2,r20,20
	ld	 r3,r11,16
	bsr.n	 _operand_equal_p
	or	 r4,r0,0
	bcnd	 eq0,r2,@L6461
	ld	 r16,r20,20
	ld	 r15,r20,24
	br.n	 @L6460
	st	 r15,r31,308
	align	 4
@L6461:
	or.u	 r13,r0,hi16(_tree_code_type)
@L8222:
	ld	 r11,r20,20
	ld	 r13,r13,lo16(_tree_code_type)
	ld.bu	 r12,r11,8
	ld	 r13,r13[r12]
	ld.b	 r13,r0,r13
	cmp	 r13,r13,49
	bb1.n	 ne,r13,@L8223
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r2,r20,24
	ld	 r3,r11,16
	bsr.n	 _operand_equal_p
	or	 r4,r0,0
	bcnd	 eq0,r2,@L6463
	ld	 r16,r20,24
	ld	 r15,r20,20
	br.n	 @L6460
	st	 r15,r31,316
	align	 4
@L6463:
	or.u	 r13,r0,hi16(_tree_code_type)
@L8223:
	ld	 r11,r20,24
	ld	 r13,r13,lo16(_tree_code_type)
	ld.bu	 r12,r11,8
	ld	 r13,r13[r12]
	ld.b	 r13,r0,r13
	cmp	 r13,r13,49
	bb1	 ne,r13,@L6460
	ld	 r2,r20,20
	ld	 r3,r11,16
	bsr.n	 _operand_equal_p
	or	 r4,r0,0
	bcnd	 eq0,r2,@L6460
	ld	 r16,r20,20
	ld	 r15,r20,24
	st	 r15,r31,316
@L6460:
	ld	 r15,r31,308
	cmp	 r13,r16,0
	cmp	 r12,r15,0
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd	 eq0,r13,@L6466
	ld	 r13,r20,16
	ld	 r13,r13,8
	bb1.n	 (31-8),r13,@L8224
	or.u	 r12,r0,hi16(_inhibit_defer_pop)
	ld.bu	 r12,r15,8
	subu	 r13,r12,53
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L8289
	subu	 r13,r12,81
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L8289
	mask	 r13,r12,0xff
	cmp	 r13,r13,83
	bb1.n	 ne,r13,@L8224
	or.u	 r12,r0,hi16(_inhibit_defer_pop)
	ld	 r15,r31,308
@L8289:
	bsr.n	 _integer_onep
	ld	 r2,r15,20
	bcnd	 eq0,r2,@L6466
	ld	 r13,r20,16
	or.u	 r12,r0,hi16(_tree_code_type)
	ld.bu	 r11,r13,8
	ld	 r13,r12,lo16(_tree_code_type)
	ld	 r13,r13[r11]
	ld.b	 r13,r0,r13
	cmp	 r13,r13,60
	bb1.n	 ne,r13,@L8224
	or.u	 r12,r0,hi16(_inhibit_defer_pop)
	ld.bu	 r12,r15,8
	cmp	 r13,r12,53
	bb0.n	 ne,r13,@L6468
	cmp	 r13,r12,54
	bb0.n	 ne,r13,@L6470
	cmp	 r13,r12,81
	bb0.n	 ne,r13,@L6472
	cmp	 r13,r12,82
	bb1.n	 ne,r13,@L6474
	or.u	 r13,r0,hi16(_and_optab)
	or.u	 r13,r0,hi16(_xor_optab)
	ld	 r18,r13,lo16(_xor_optab)
	br	 @L6469
	align	 4
@L6474:
	ld	 r18,r13,lo16(_and_optab)
	br	 @L6469
	align	 4
@L6472:
	or.u	 r13,r0,hi16(_ior_optab)
	ld	 r18,r13,lo16(_ior_optab)
	br	 @L6469
	align	 4
@L6470:
	or.u	 r13,r0,hi16(_sub_optab)
	ld	 r18,r13,lo16(_sub_optab)
	br	 @L6469
	align	 4
@L6468:
	or.u	 r13,r0,hi16(_add_optab)
	ld	 r18,r13,lo16(_add_optab)
@L6469:
	ld	 r13,r20,20
	cmp	 r13,r16,r13
	bb1	 ne,r13,@L6476
	bsr.n	 _invert_truthvalue
	ld	 r2,r20,16
	st	 r2,r20,16
@L6476:
	ld	 r17,r20,16
	or	 r23,r0,r19
	bcnd.n	 eq0,r19,@L6526
	or	 r22,r0,0
	ld.hu	 r13,r0,r19
	cmp	 r13,r13,53
	bb1	 ne,r13,@L6481
	ld	 r23,r19,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,51
	bb1	 ne,r13,@L6481
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L6479
	or	 r3,r0,0
@L6481:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8225
	or.u	 r13,r0,hi16(_tree_code_type)
	or.u	 r13,r0,hi16(_virtual_outgoing_args_rtx)
	ld	 r12,r23,4
	ld	 r11,r13,lo16(_virtual_outgoing_args_rtx)
	cmp	 r13,r12,r11
	bb0	 ne,r13,@L6526
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L8225
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r13,r12,4
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L6526
	or.u	 r13,r0,hi16(_tree_code_type)
@L8225:
	ld.bu	 r12,r16,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r13,r0,r13
	subu	 r11,r13,49
	or.u	 r13,r0,hi16(@L6524)
	cmp	 r12,r11,71
	bb0.n	 ls,r12,@L6485
	or	 r13,r13,lo16(@L6524)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L6524:
	word	 @L6494
	word	 @L6496
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6496
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6526
	word	 @L6486
	word	 @L6499
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6499
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6485
	word	 @L6488
	align	 4
@L6486:
	ld	 r22,r16,64
	br	 @L6485
	align	 4
@L6488:
	ld.bu	 r13,r16,8
	cmp	 r13,r13,3
	bb1.n	 ne,r13,@L6479
	or	 r3,r0,0
	ld	 r3,r16,16
	bcnd.n	 eq0,r3,@L6491
	or	 r25,r0,0
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6479
	or	 r3,r0,r25
@L6491:
	ld	 r3,r0,r16
	bcnd	 eq0,r3,@L6530
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd	 eq0,r2,@L8226
	or	 r25,r0,1
	br	 @L8226
	align	 4
@L6494:
	ld	 r3,r16,16
	br	 @L7948
	align	 4
@L6496:
	ld	 r3,r16,16
	or	 r2,r0,r23
	bsr.n	 _safe_from_p
	or	 r25,r0,0
	bcnd	 eq0,r2,@L6529
	ld	 r3,r16,20
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	cmp	 r2,r2,0
	br.n	 @L6529
	extu	 r25,r2,1<ne>
	align	 4
@L6499:
	ld.bu	 r13,r16,8
	subu	 r11,r13,39
	or.u	 r13,r0,hi16(@L6515)
	cmp	 r12,r11,67
	bb0.n	 ls,r12,@L6500
	or	 r13,r13,lo16(@L6515)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L6515:
	word	 @L6502
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6513
	word	 @L6504
	word	 @L6514
	word	 @L6511
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6500
	word	 @L6512
	word	 @L6509
	word	 @L6501
	align	 4
@L6501:
	bsr.n	 _staticp
	ld	 r2,r16,16
	br.n	 @L6479
	or	 r3,r0,r2
	align	 4
@L6502:
	ld.hu	 r13,r0,r23
	br.n	 @L7949
	cmp	 r13,r13,55
	align	 4
@L6504:
	ld	 r22,r16,24
	bcnd	 ne0,r22,@L7214
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,51
	bb1.n	 ne,r13,@L7949
	cmp	 r13,r12,55
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L7950
	cmp	 r13,r12,55
@L7949:
	bb1.n	 ne,r13,@L6500
	or	 r3,r0,0
	br	 @L6479
	align	 4
@L6509:
	ld	 r22,r16,20
	bcnd	 ne0,r22,@L7214
@L7950:
	br.n	 @L6479
	or	 r3,r0,0
	align	 4
@L6511:
	ld	 r22,r16,20
	br	 @L6500
	align	 4
@L6512:
	ld	 r22,r16,24
	br	 @L6500
	align	 4
@L6513:
	ld	 r3,r16,20
@L7948:
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	br.n	 @L6479
	or	 r3,r0,r2
	align	 4
@L6514:
	bsr	 _abort
	align	 4
@L6500:
	bcnd.n	 ne0,r22,@L7214
	or.u	 r13,r0,hi16(_tree_code_length)
	ld.bu	 r12,r16,8
	ld	 r13,r13,lo16(_tree_code_length)
	ld	 r21,r13[r12]
	cmp	 r13,r22,r21
	bb0.n	 lt,r13,@L6485
	or	 r24,r0,0
	mask	 r12,r21,3
	bcnd.n	 eq0,r12,@L6521
	or	 r25,r0,r16
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L7349
	cmp	 r13,r12,2
	bb0	 gt,r13,@L7350
	ld	 r3,r16,16
	bcnd	 eq0,r3,@L7352
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6479
	or	 r3,r0,0
@L7352:
	addu	 r25,r16,4
	or	 r24,r0,1
@L7350:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7355
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6479
	or	 r3,r0,0
@L7355:
	addu	 r25,r25,4
	addu	 r24,r24,1
@L7349:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7358
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6479
	or	 r3,r0,0
@L7358:
	addu	 r24,r24,1
	cmp	 r13,r24,r21
	bb0.n	 lt,r13,@L6485
	addu	 r25,r25,4
@L6521:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7361
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6479
	or	 r3,r0,0
@L7361:
	ld	 r3,r25,20
	bcnd	 eq0,r3,@L7364
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6479
	or	 r3,r0,0
@L7364:
	ld	 r3,r25,24
	bcnd	 eq0,r3,@L7367
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6479
	or	 r3,r0,0
@L7367:
	ld	 r3,r25,28
	bcnd	 eq0,r3,@L7370
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6479
	or	 r3,r0,0
@L7370:
	addu	 r24,r24,4
	cmp	 r13,r24,r21
	bb1.n	 lt,r13,@L6521
	addu	 r25,r25,16
@L6485:
	bcnd.n	 eq0,r22,@L6479
	or	 r3,r0,1
@L7214:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L8227
	or	 r2,r0,r23
	ld	 r22,r22,4
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L8228
	or	 r3,r0,r22
	ld	 r13,r22,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L6479
	or	 r3,r0,0
@L8227:
	or	 r3,r0,r22
@L8228:
	bsr.n	 _rtx_equal_p
	or	 r25,r0,0
	bcnd.n	 ne0,r2,@L6479
	or	 r3,r0,r25
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1	 ne,r13,@L6530
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,55
	bb1	 ne,r13,@L6530
	ld	 r13,r16,8
	bb0.n	 (31-13),r13,@L8291
	or	 r2,r0,r17
@L6530:
	or	 r25,r0,1
@L6529:
@L8226:
	br.n	 @L6479
	or	 r3,r0,r25
	align	 4
@L6526:
	or	 r3,r0,1
@L6479:
	or	 r2,r0,r17
@L8291:
	cmp	 r3,r3,0
	or	 r4,r0,r14
	ext	 r3,r3,1<ne>
	or	 r5,r0,1
	bsr.n	 _do_store_flag
	and	 r3,r19,r3
	or	 r25,r0,r2
	bcnd.n	 eq0,r25,@L6531
	or	 r2,r0,r16
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld	 r7,r31,120
	or	 r16,r0,r2
	or	 r2,r0,r14
	or	 r3,r0,r18
	or	 r5,r0,r25
	or	 r6,r0,r19
	or	 r8,r0,3
	or	 r4,r0,r16
	bsr.n	 _expand_binop
	addu	 r1,r1,@L8621
@L8622:
	align	 4
@L6531:
	ld	 r13,r20,20
	cmp	 r13,r16,r13
	bb1.n	 ne,r13,@L8224
	or.u	 r12,r0,hi16(_inhibit_defer_pop)
	bsr.n	 _invert_truthvalue
	ld	 r2,r20,16
	st	 r2,r20,16
@L6466:
	or.u	 r12,r0,hi16(_inhibit_defer_pop)
@L8224:
	ld	 r13,r12,lo16(_inhibit_defer_pop)
	addu	 r13,r13,1
	bsr.n	 _gen_label_rtx
	st	 r13,r12,lo16(_inhibit_defer_pop)
	bcnd.n	 eq0,r16,@L6534
	or	 r18,r0,r2
	ld	 r13,r20,16
	ld	 r13,r13,8
	bb1	 (31-8),r13,@L6534
	bcnd	 eq0,r19,@L6535
	ld	 r15,r31,308
	bcnd	 eq0,r15,@L6538
	ld.hu	 r13,r0,r19
	ld	 r22,r15,20
	or	 r23,r0,r19
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L6541
	or	 r21,r0,0
	ld	 r23,r19,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,51
	bb1	 ne,r13,@L6541
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0	 gt,r13,@L7954
@L6541:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8229
	or.u	 r13,r0,hi16(_tree_code_type)
	or.u	 r13,r0,hi16(_virtual_outgoing_args_rtx)
	ld	 r12,r23,4
	ld	 r11,r13,lo16(_virtual_outgoing_args_rtx)
	cmp	 r13,r12,r11
	bb0	 ne,r13,@L6586
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L8229
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r13,r12,4
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L6586
	or.u	 r13,r0,hi16(_tree_code_type)
@L8229:
	ld.bu	 r12,r22,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r13,r0,r13
	subu	 r11,r13,49
	or.u	 r13,r0,hi16(@L6584)
	cmp	 r12,r11,71
	bb0.n	 ls,r12,@L6545
	or	 r13,r13,lo16(@L6584)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L6584:
	word	 @L6554
	word	 @L6556
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6556
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6586
	word	 @L6546
	word	 @L6559
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6559
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6545
	word	 @L6548
	align	 4
@L6546:
	ld	 r21,r22,64
	br	 @L6545
	align	 4
@L6548:
	ld.bu	 r13,r22,8
	cmp	 r13,r13,3
	bb1.n	 ne,r13,@L6539
	or	 r2,r0,0
	ld	 r3,r22,16
	bcnd.n	 eq0,r3,@L6551
	or	 r25,r0,0
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6539
	or	 r2,r0,r25
@L6551:
	ld	 r3,r0,r22
	bcnd	 eq0,r3,@L6590
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6539
	or	 r2,r0,r25
	br.n	 @L8230
	or	 r25,r0,1
	align	 4
@L6554:
	ld	 r3,r22,16
	br.n	 @L8231
	or	 r2,r0,r23
	align	 4
@L6556:
	ld	 r3,r22,16
	or	 r2,r0,r23
	bsr.n	 _safe_from_p
	or	 r25,r0,0
	bcnd	 eq0,r2,@L6589
	ld	 r3,r22,20
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	cmp	 r2,r2,0
	br.n	 @L6589
	extu	 r25,r2,1<ne>
	align	 4
@L6559:
	ld.bu	 r13,r22,8
	subu	 r11,r13,39
	or.u	 r13,r0,hi16(@L6575)
	cmp	 r12,r11,67
	bb0.n	 ls,r12,@L6560
	or	 r13,r13,lo16(@L6575)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L6575:
	word	 @L6562
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6573
	word	 @L6564
	word	 @L6574
	word	 @L6571
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6560
	word	 @L6572
	word	 @L6569
	word	 @L6561
	align	 4
@L6561:
	ld	 r2,r22,16
	bsr.n	 _staticp
	addu	 r1,r1,@L8623
@L8624:
	align	 4
@L6562:
	ld.hu	 r13,r0,r23
	br.n	 @L7953
	cmp	 r13,r13,55
	align	 4
@L6564:
	ld	 r21,r22,24
	bcnd	 ne0,r21,@L7215
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,51
	bb1.n	 ne,r13,@L7953
	cmp	 r13,r12,55
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L7954
	cmp	 r13,r12,55
@L7953:
	bb1.n	 ne,r13,@L6560
	or	 r2,r0,0
	br	 @L6539
	align	 4
@L6569:
	ld	 r21,r22,20
	bcnd	 ne0,r21,@L7215
@L7954:
	br.n	 @L6539
	or	 r2,r0,0
	align	 4
@L6571:
	ld	 r21,r22,20
	br	 @L6560
	align	 4
@L6572:
	ld	 r21,r22,24
	br	 @L6560
	align	 4
@L6573:
	ld	 r3,r22,20
	or	 r2,r0,r23
@L8231:
	bsr.n	 _safe_from_p
	addu	 r1,r1,@L8625
@L8626:
	align	 4
@L6574:
	bsr	 _abort
	align	 4
@L6560:
	bcnd.n	 ne0,r21,@L7215
	or.u	 r13,r0,hi16(_tree_code_length)
	ld.bu	 r12,r22,8
	ld	 r13,r13,lo16(_tree_code_length)
	ld	 r17,r13[r12]
	cmp	 r13,r21,r17
	bb0.n	 lt,r13,@L6545
	or	 r24,r0,0
	mask	 r12,r17,3
	bcnd.n	 eq0,r12,@L6581
	or	 r25,r0,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L7323
	cmp	 r13,r12,2
	bb0	 gt,r13,@L7324
	ld	 r3,r22,16
	bcnd	 eq0,r3,@L7326
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6539
	or	 r2,r0,0
@L7326:
	addu	 r25,r22,4
	or	 r24,r0,1
@L7324:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7329
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6539
	or	 r2,r0,0
@L7329:
	addu	 r25,r25,4
	addu	 r24,r24,1
@L7323:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7332
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6539
	or	 r2,r0,0
@L7332:
	addu	 r24,r24,1
	cmp	 r13,r24,r17
	bb0.n	 lt,r13,@L6545
	addu	 r25,r25,4
@L6581:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7335
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6539
	or	 r2,r0,0
@L7335:
	ld	 r3,r25,20
	bcnd	 eq0,r3,@L7338
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6539
	or	 r2,r0,0
@L7338:
	ld	 r3,r25,24
	bcnd	 eq0,r3,@L7341
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6539
	or	 r2,r0,0
@L7341:
	ld	 r3,r25,28
	bcnd	 eq0,r3,@L7344
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6539
	or	 r2,r0,0
@L7344:
	addu	 r24,r24,4
	cmp	 r13,r24,r17
	bb1.n	 lt,r13,@L6581
	addu	 r25,r25,16
@L6545:
	bcnd.n	 eq0,r21,@L6539
	or	 r2,r0,1
@L7215:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L8232
	or	 r2,r0,r23
	ld	 r21,r21,4
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L8233
	or	 r3,r0,r21
	ld	 r13,r21,4
	cmp	 r13,r13,63
	bb1	 le,r13,@L7954
@L8232:
	or	 r3,r0,r21
@L8233:
	bsr.n	 _rtx_equal_p
	or	 r25,r0,0
	bcnd	 ne0,r2,@L6589
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1	 ne,r13,@L6590
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,55
	bb1	 ne,r13,@L6590
	ld	 r13,r22,8
	bb0.n	 (31-13),r13,@L6539
	or	 r2,r0,r25
@L6590:
	or	 r25,r0,1
@L6589:
@L8230:
	br.n	 @L6539
	or	 r2,r0,r25
	align	 4
@L6586:
	or	 r2,r0,1
@L6539:
	bcnd	 eq0,r2,@L6537
@L6538:
	ld.hu	 r13,r0,r19
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L8234
	or	 r2,r0,r16
	ld	 r13,r19,4
	cmp	 r13,r13,63
	bb1.n	 gt,r13,@L8235
	or	 r3,r0,r19
@L6537:
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,r14
	or	 r19,r0,r2
	or	 r2,r0,r16
@L8234:
	or	 r3,r0,r19
@L8235:
	or	 r4,r0,0
	bsr.n	 _store_expr
	addu	 r1,r1,@L8627
@L8628:
	align	 4
@L6535:
	ld	 r15,r31,188
	bcnd.n	 eq0,r15,@L6592
	or.u	 r13,r0,hi16(_const1_rtx)
	ld	 r3,r13,lo16(_const1_rtx)
	br.n	 @L8236
	or	 r2,r0,r16
	align	 4
@L6592:
	or	 r3,r0,0
	or	 r2,r0,r16
@L8236:
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
@L6591:
	or.u	 r25,r0,hi16(_cleanups_this_call)
	ld	 r13,r25,lo16(_cleanups_this_call)
	bcnd	 eq0,r13,@L6594
	or.u	 r2,r0,hi16(@LC1)
	bsr.n	 _sorry
	or	 r2,r2,lo16(@LC1)
	st	 r0,r25,lo16(_cleanups_this_call)
@L6594:
	ld	 r13,r20,20
	cmp	 r13,r16,r13
	bb1	 ne,r13,@L6595
	ld	 r2,r20,16
	or	 r3,r0,r18
	bsr.n	 _jumpif
	addu	 r1,r1,@L8629
@L8630:
	align	 4
@L6595:
	ld	 r2,r20,16
	bsr.n	 _jumpifnot
	or	 r3,r0,r18
@L6596:
	ld	 r15,r31,308
	cmp	 r12,r19,0
	cmp	 r13,r15,0
	and.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L8290
	ld	 r2,r15,20
	ld	 r15,r31,188
	bcnd.n	 eq0,r15,@L6598
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r3,r13,lo16(_const0_rtx)
	br.n	 @L8237
	or	 r4,r0,0
	align	 4
@L6598:
	or	 r3,r0,0
	or	 r4,r0,0
@L8237:
	or	 r5,r0,0
	bsr.n	 _expand_expr
	addu	 r1,r1,@L8631
@L8632:
	align	 4
@L8290:
	bcnd.n	 eq0,r15,@L6601
	or	 r3,r0,r19
	ld	 r2,r31,172
	bsr.n	 _make_tree
	ld.bu	 r25,r15,8
	ld	 r5,r15,20
	or	 r4,r0,r2
	ld	 r3,r31,172
	or	 r2,r0,r25
	bsr.n	 _build
	addu	 r1,r1,@L8633
@L8634:
	align	 4
@L6601:
	ld	 r15,r31,316
	ld	 r2,r31,172
	bsr.n	 _make_tree
	ld.bu	 r25,r15,8
	or	 r4,r0,r2
	ld	 r3,r31,172
	bsr.n	 _build1
	or	 r2,r0,r25
@L7955:
	or	 r3,r0,r19
	bsr.n	 _store_expr
	or	 r4,r0,0
@L6600:
	br.n	 @L6603
	or	 r16,r0,r18
	align	 4
@L6534:
	bcnd.n	 eq0,r19,@L6659
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r11,r20,16
	ld	 r13,r13,lo16(_tree_code_type)
	ld.bu	 r12,r11,8
	ld	 r13,r13[r12]
	ld.b	 r13,r0,r13
	cmp	 r13,r13,60
	bb1	 ne,r13,@L6604
	bsr.n	 _integer_zerop
	ld	 r2,r11,20
	bcnd	 eq0,r2,@L6604
	ld	 r13,r20,16
	ld	 r3,r20,20
	ld	 r2,r13,16
	bsr.n	 _operand_equal_p
	or	 r4,r0,0
	bcnd	 eq0,r2,@L6604
	ld	 r13,r20,16
	ld	 r13,r13,8
	bb1	 (31-8),r13,@L6604
	ld.hu	 r13,r0,r19
	ld	 r22,r20,24
	or	 r23,r0,r19
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L6607
	or	 r21,r0,0
	ld	 r23,r19,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,51
	bb1	 ne,r13,@L6607
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L6605
	or	 r2,r0,0
@L6607:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8238
	or.u	 r13,r0,hi16(_tree_code_type)
	or.u	 r13,r0,hi16(_virtual_outgoing_args_rtx)
	ld	 r12,r23,4
	ld	 r11,r13,lo16(_virtual_outgoing_args_rtx)
	cmp	 r13,r12,r11
	bb0	 ne,r13,@L6652
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L8238
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r13,r12,4
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L6652
	or.u	 r13,r0,hi16(_tree_code_type)
@L8238:
	ld.bu	 r12,r22,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r13,r0,r13
	subu	 r11,r13,49
	or.u	 r13,r0,hi16(@L6650)
	cmp	 r12,r11,71
	bb0.n	 ls,r12,@L6611
	or	 r13,r13,lo16(@L6650)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L6650:
	word	 @L6620
	word	 @L6622
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6622
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6652
	word	 @L6612
	word	 @L6625
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6625
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6611
	word	 @L6614
	align	 4
@L6612:
	ld	 r21,r22,64
	br	 @L6611
	align	 4
@L6614:
	ld.bu	 r13,r22,8
	cmp	 r13,r13,3
	bb1.n	 ne,r13,@L6605
	or	 r2,r0,0
	ld	 r3,r22,16
	bcnd.n	 eq0,r3,@L6617
	or	 r25,r0,0
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6605
	or	 r2,r0,r25
@L6617:
	ld	 r3,r0,r22
	bcnd	 eq0,r3,@L6656
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6605
	or	 r2,r0,r25
	br.n	 @L8239
	or	 r25,r0,1
	align	 4
@L6620:
	ld	 r3,r22,16
	br.n	 @L8240
	or	 r2,r0,r23
	align	 4
@L6622:
	ld	 r3,r22,16
	or	 r2,r0,r23
	bsr.n	 _safe_from_p
	or	 r25,r0,0
	bcnd	 eq0,r2,@L6655
	ld	 r3,r22,20
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	cmp	 r2,r2,0
	br.n	 @L6655
	extu	 r25,r2,1<ne>
	align	 4
@L6625:
	ld.bu	 r13,r22,8
	subu	 r11,r13,39
	or.u	 r13,r0,hi16(@L6641)
	cmp	 r12,r11,67
	bb0.n	 ls,r12,@L6626
	or	 r13,r13,lo16(@L6641)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L6641:
	word	 @L6628
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6639
	word	 @L6630
	word	 @L6640
	word	 @L6637
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6626
	word	 @L6638
	word	 @L6635
	word	 @L6627
	align	 4
@L6627:
	ld	 r2,r22,16
	bsr.n	 _staticp
	addu	 r1,r1,@L8635
@L8636:
	align	 4
@L6628:
	ld.hu	 r13,r0,r23
	br.n	 @L7958
	cmp	 r13,r13,55
	align	 4
@L6630:
	ld	 r21,r22,24
	bcnd	 ne0,r21,@L7216
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,51
	bb1.n	 ne,r13,@L7958
	cmp	 r13,r12,55
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L7959
	cmp	 r13,r12,55
@L7958:
	bb1.n	 ne,r13,@L6626
	or	 r2,r0,0
	br	 @L6605
	align	 4
@L6635:
	ld	 r21,r22,20
	bcnd	 ne0,r21,@L7216
@L7959:
	br.n	 @L6605
	or	 r2,r0,0
	align	 4
@L6637:
	ld	 r21,r22,20
	br	 @L6626
	align	 4
@L6638:
	ld	 r21,r22,24
	br	 @L6626
	align	 4
@L6639:
	ld	 r3,r22,20
	or	 r2,r0,r23
@L8240:
	bsr.n	 _safe_from_p
	addu	 r1,r1,@L8637
@L8638:
	align	 4
@L6640:
	bsr	 _abort
	align	 4
@L6626:
	bcnd.n	 ne0,r21,@L7216
	or.u	 r13,r0,hi16(_tree_code_length)
	ld.bu	 r12,r22,8
	ld	 r13,r13,lo16(_tree_code_length)
	ld	 r17,r13[r12]
	cmp	 r13,r21,r17
	bb0.n	 lt,r13,@L6611
	or	 r24,r0,0
	mask	 r12,r17,3
	bcnd.n	 eq0,r12,@L6647
	or	 r25,r0,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L7297
	cmp	 r13,r12,2
	bb0	 gt,r13,@L7298
	ld	 r3,r22,16
	bcnd	 eq0,r3,@L7300
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6605
	or	 r2,r0,0
@L7300:
	addu	 r25,r22,4
	or	 r24,r0,1
@L7298:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7303
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6605
	or	 r2,r0,0
@L7303:
	addu	 r25,r25,4
	addu	 r24,r24,1
@L7297:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7306
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6605
	or	 r2,r0,0
@L7306:
	addu	 r24,r24,1
	cmp	 r13,r24,r17
	bb0.n	 lt,r13,@L6611
	addu	 r25,r25,4
@L6647:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7309
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6605
	or	 r2,r0,0
@L7309:
	ld	 r3,r25,20
	bcnd	 eq0,r3,@L7312
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6605
	or	 r2,r0,0
@L7312:
	ld	 r3,r25,24
	bcnd	 eq0,r3,@L7315
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6605
	or	 r2,r0,0
@L7315:
	ld	 r3,r25,28
	bcnd	 eq0,r3,@L7318
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6605
	or	 r2,r0,0
@L7318:
	addu	 r24,r24,4
	cmp	 r13,r24,r17
	bb1.n	 lt,r13,@L6647
	addu	 r25,r25,16
@L6611:
	bcnd.n	 eq0,r21,@L6605
	or	 r2,r0,1
@L7216:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L8241
	or	 r2,r0,r23
	ld	 r21,r21,4
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L8242
	or	 r3,r0,r21
	ld	 r13,r21,4
	cmp	 r13,r13,63
	bb1	 le,r13,@L7959
@L8241:
	or	 r3,r0,r21
@L8242:
	bsr.n	 _rtx_equal_p
	or	 r25,r0,0
	bcnd	 ne0,r2,@L6655
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1	 ne,r13,@L6656
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,55
	bb1	 ne,r13,@L6656
	ld	 r13,r22,8
	bb0.n	 (31-13),r13,@L6605
	or	 r2,r0,r25
@L6656:
	or	 r25,r0,1
@L6655:
@L8239:
	br.n	 @L6605
	or	 r2,r0,r25
	align	 4
@L6652:
	or	 r2,r0,1
@L6605:
	bcnd	 eq0,r2,@L6604
	ld.hu	 r13,r0,r19
	cmp	 r13,r13,51
	bb1	 ne,r13,@L6657
	ld	 r13,r19,4
	cmp	 r13,r13,63
	bb1	 gt,r13,@L6657
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,r14
	or	 r19,r0,r2
@L6657:
	ld	 r2,r20,20
	or	 r3,r0,r19
	bsr.n	 _store_expr
	or	 r4,r0,0
	ld	 r2,r20,16
	bsr.n	 _jumpif
	or	 r3,r0,r18
	ld	 r2,r20,24
	br.n	 @L8243
	or	 r3,r0,r19
	align	 4
@L6604:
	bcnd.n	 eq0,r19,@L6659
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r11,r20,16
	ld	 r13,r13,lo16(_tree_code_type)
	ld.bu	 r12,r11,8
	ld	 r13,r13[r12]
	ld.b	 r13,r0,r13
	cmp	 r13,r13,60
	bb1	 ne,r13,@L6659
	bsr.n	 _integer_zerop
	ld	 r2,r11,20
	bcnd	 eq0,r2,@L6659
	ld	 r13,r20,16
	ld	 r3,r20,24
	ld	 r2,r13,16
	bsr.n	 _operand_equal_p
	or	 r4,r0,0
	bcnd	 eq0,r2,@L6659
	ld	 r13,r20,16
	ld	 r13,r13,8
	bb1	 (31-8),r13,@L6659
	ld.hu	 r13,r0,r19
	ld	 r22,r20,20
	or	 r23,r0,r19
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L6662
	or	 r21,r0,0
	ld	 r23,r19,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,51
	bb1	 ne,r13,@L6662
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L6660
	or	 r2,r0,0
@L6662:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8244
	or.u	 r13,r0,hi16(_tree_code_type)
	or.u	 r13,r0,hi16(_virtual_outgoing_args_rtx)
	ld	 r12,r23,4
	ld	 r11,r13,lo16(_virtual_outgoing_args_rtx)
	cmp	 r13,r12,r11
	bb0	 ne,r13,@L6707
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L8244
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r13,r12,4
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L6707
	or.u	 r13,r0,hi16(_tree_code_type)
@L8244:
	ld.bu	 r12,r22,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r13,r0,r13
	subu	 r11,r13,49
	or.u	 r13,r0,hi16(@L6705)
	cmp	 r12,r11,71
	bb0.n	 ls,r12,@L6666
	or	 r13,r13,lo16(@L6705)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L6705:
	word	 @L6675
	word	 @L6677
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6677
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6707
	word	 @L6667
	word	 @L6680
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6680
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6666
	word	 @L6669
	align	 4
@L6667:
	ld	 r21,r22,64
	br	 @L6666
	align	 4
@L6669:
	ld.bu	 r13,r22,8
	cmp	 r13,r13,3
	bb1.n	 ne,r13,@L6660
	or	 r2,r0,0
	ld	 r3,r22,16
	bcnd.n	 eq0,r3,@L6672
	or	 r25,r0,0
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6660
	or	 r2,r0,r25
@L6672:
	ld	 r3,r0,r22
	bcnd	 eq0,r3,@L6711
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6660
	or	 r2,r0,r25
	br.n	 @L8245
	or	 r25,r0,1
	align	 4
@L6675:
	ld	 r3,r22,16
	br.n	 @L8246
	or	 r2,r0,r23
	align	 4
@L6677:
	ld	 r3,r22,16
	or	 r2,r0,r23
	bsr.n	 _safe_from_p
	or	 r25,r0,0
	bcnd	 eq0,r2,@L6710
	ld	 r3,r22,20
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	cmp	 r2,r2,0
	br.n	 @L6710
	extu	 r25,r2,1<ne>
	align	 4
@L6680:
	ld.bu	 r13,r22,8
	subu	 r11,r13,39
	or.u	 r13,r0,hi16(@L6696)
	cmp	 r12,r11,67
	bb0.n	 ls,r12,@L6681
	or	 r13,r13,lo16(@L6696)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L6696:
	word	 @L6683
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6694
	word	 @L6685
	word	 @L6695
	word	 @L6692
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6681
	word	 @L6693
	word	 @L6690
	word	 @L6682
	align	 4
@L6682:
	ld	 r2,r22,16
	bsr.n	 _staticp
	addu	 r1,r1,@L8639
@L8640:
	align	 4
@L6683:
	ld.hu	 r13,r0,r23
	br.n	 @L7963
	cmp	 r13,r13,55
	align	 4
@L6685:
	ld	 r21,r22,24
	bcnd	 ne0,r21,@L7217
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,51
	bb1.n	 ne,r13,@L7963
	cmp	 r13,r12,55
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L7964
	cmp	 r13,r12,55
@L7963:
	bb1.n	 ne,r13,@L6681
	or	 r2,r0,0
	br	 @L6660
	align	 4
@L6690:
	ld	 r21,r22,20
	bcnd	 ne0,r21,@L7217
@L7964:
	br.n	 @L6660
	or	 r2,r0,0
	align	 4
@L6692:
	ld	 r21,r22,20
	br	 @L6681
	align	 4
@L6693:
	ld	 r21,r22,24
	br	 @L6681
	align	 4
@L6694:
	ld	 r3,r22,20
	or	 r2,r0,r23
@L8246:
	bsr.n	 _safe_from_p
	addu	 r1,r1,@L8641
@L8642:
	align	 4
@L6695:
	bsr	 _abort
	align	 4
@L6681:
	bcnd.n	 ne0,r21,@L7217
	or.u	 r13,r0,hi16(_tree_code_length)
	ld.bu	 r12,r22,8
	ld	 r13,r13,lo16(_tree_code_length)
	ld	 r17,r13[r12]
	cmp	 r13,r21,r17
	bb0.n	 lt,r13,@L6666
	or	 r24,r0,0
	mask	 r12,r17,3
	bcnd.n	 eq0,r12,@L6702
	or	 r25,r0,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L7271
	cmp	 r13,r12,2
	bb0	 gt,r13,@L7272
	ld	 r3,r22,16
	bcnd	 eq0,r3,@L7274
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6660
	or	 r2,r0,0
@L7274:
	addu	 r25,r22,4
	or	 r24,r0,1
@L7272:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7277
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6660
	or	 r2,r0,0
@L7277:
	addu	 r25,r25,4
	addu	 r24,r24,1
@L7271:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7280
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6660
	or	 r2,r0,0
@L7280:
	addu	 r24,r24,1
	cmp	 r13,r24,r17
	bb0.n	 lt,r13,@L6666
	addu	 r25,r25,4
@L6702:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7283
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6660
	or	 r2,r0,0
@L7283:
	ld	 r3,r25,20
	bcnd	 eq0,r3,@L7286
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6660
	or	 r2,r0,0
@L7286:
	ld	 r3,r25,24
	bcnd	 eq0,r3,@L7289
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6660
	or	 r2,r0,0
@L7289:
	ld	 r3,r25,28
	bcnd	 eq0,r3,@L7292
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L6660
	or	 r2,r0,0
@L7292:
	addu	 r24,r24,4
	cmp	 r13,r24,r17
	bb1.n	 lt,r13,@L6702
	addu	 r25,r25,16
@L6666:
	bcnd.n	 eq0,r21,@L6660
	or	 r2,r0,1
@L7217:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L8247
	or	 r2,r0,r23
	ld	 r21,r21,4
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L8248
	or	 r3,r0,r21
	ld	 r13,r21,4
	cmp	 r13,r13,63
	bb1	 le,r13,@L7964
@L8247:
	or	 r3,r0,r21
@L8248:
	bsr.n	 _rtx_equal_p
	or	 r25,r0,0
	bcnd	 ne0,r2,@L6710
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1	 ne,r13,@L6711
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,55
	bb1	 ne,r13,@L6711
	ld	 r13,r22,8
	bb0.n	 (31-13),r13,@L6660
	or	 r2,r0,r25
@L6711:
	or	 r25,r0,1
@L6710:
@L8245:
	br.n	 @L6660
	or	 r2,r0,r25
	align	 4
@L6707:
	or	 r2,r0,1
@L6660:
	bcnd	 eq0,r2,@L6659
	ld.hu	 r13,r0,r19
	cmp	 r13,r13,51
	bb1	 ne,r13,@L6712
	ld	 r13,r19,4
	cmp	 r13,r13,63
	bb1	 gt,r13,@L6712
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,r14
	or	 r19,r0,r2
@L6712:
	ld	 r2,r20,24
	or	 r3,r0,r19
	bsr.n	 _store_expr
	or	 r4,r0,0
	ld	 r2,r20,16
	bsr.n	 _jumpifnot
	or	 r3,r0,r18
	ld	 r2,r20,20
	or	 r3,r0,r19
@L8243:
	or	 r4,r0,0
	or	 r16,r0,r18
	bsr.n	 _store_expr
	addu	 r1,r1,@L8643
@L8644:
	align	 4
@L6659:
	bsr	 _gen_label_rtx
	or	 r16,r0,r2
	ld	 r2,r20,16
	bsr.n	 _jumpifnot
	or	 r3,r0,r18
	bcnd	 eq0,r19,@L6714
	ld	 r2,r20,20
	or	 r3,r0,r19
	or	 r4,r0,0
	bsr.n	 _store_expr
	addu	 r1,r1,@L8645
@L8646:
	align	 4
@L6714:
	ld	 r15,r31,188
	ld	 r2,r20,20
	bcnd.n	 eq0,r15,@L6716
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r3,r13,lo16(_const0_rtx)
	br.n	 @L8249
	or	 r4,r0,0
	align	 4
@L6716:
	or	 r3,r0,0
	or	 r4,r0,0
@L8249:
	bsr.n	 _expand_expr
	or	 r5,r0,0
@L6715:
	or.u	 r25,r0,hi16(_cleanups_this_call)
	ld	 r13,r25,lo16(_cleanups_this_call)
	bcnd	 eq0,r13,@L6718
	or.u	 r2,r0,hi16(@LC2)
	bsr.n	 _sorry
	or	 r2,r2,lo16(@LC2)
	st	 r0,r25,lo16(_cleanups_this_call)
@L6718:
	or.u	 r13,r0,hi16(_pending_chain)
	ld	 r25,r13,lo16(_pending_chain)
	bcnd	 eq0,r25,@L6719
	or	 r24,r0,r13
@L6722:
	bsr.n	 _emit_insn
	ld	 r2,r25,16
	ld	 r13,r25,20
	st	 r2,r25,8
	or	 r25,r0,r13
	bcnd.n	 ne0,r25,@L6722
	st	 r25,r24,lo16(_pending_chain)
@L6719:
	bsr.n	 _gen_jump
	or	 r2,r0,r16
	bsr	 _emit_jump_insn
	bsr	 _emit_barrier
	bsr.n	 _emit_label
	or	 r2,r0,r18
	bcnd	 eq0,r19,@L6724
	ld	 r2,r20,24
	or	 r3,r0,r19
	or	 r4,r0,0
	bsr.n	 _store_expr
	addu	 r1,r1,@L8647
@L8648:
	align	 4
@L6724:
	ld	 r15,r31,188
	ld	 r2,r20,24
	bcnd.n	 eq0,r15,@L6726
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r3,r13,lo16(_const0_rtx)
	br.n	 @L8250
	or	 r4,r0,0
	align	 4
@L6726:
	or	 r3,r0,0
	or	 r4,r0,0
@L8250:
	bsr.n	 _expand_expr
	or	 r5,r0,0
@L6603:
	or.u	 r25,r0,hi16(_cleanups_this_call)
	ld	 r13,r25,lo16(_cleanups_this_call)
	bcnd	 eq0,r13,@L6728
	or.u	 r2,r0,hi16(@LC3)
	bsr.n	 _sorry
	or	 r2,r2,lo16(@LC3)
	st	 r0,r25,lo16(_cleanups_this_call)
@L6728:
	or.u	 r13,r0,hi16(_pending_chain)
	ld	 r25,r13,lo16(_pending_chain)
	bcnd.n	 eq0,r25,@L6729
	or	 r24,r0,r13
@L6732:
	bsr.n	 _emit_insn
	ld	 r2,r25,16
	ld	 r13,r25,20
	st	 r2,r25,8
	or	 r25,r0,r13
	bcnd.n	 ne0,r25,@L6732
	st	 r25,r24,lo16(_pending_chain)
@L6729:
	bsr.n	 _emit_label
	or	 r2,r0,r16
	or.u	 r13,r0,hi16(_inhibit_defer_pop)
	ld	 r15,r31,324
	ld	 r12,r13,lo16(_inhibit_defer_pop)
	or.u	 r11,r0,hi16(_cleanups_this_call)
	or	 r2,r0,r19
	st	 r15,r11,lo16(_cleanups_this_call)
	subu	 r12,r12,1
	br.n	 @L7200
	st	 r12,r13,lo16(_inhibit_defer_pop)
	align	 4
@L6734:
	ld	 r25,r20,16
	ld.bu	 r13,r25,8
	cmp	 r13,r13,33
	bb0	 ne,r13,@L6735
	bsr	 _abort
	align	 4
@L6735:
	bcnd	 ne0,r17,@L6736
	ld	 r2,r25,64
	bcnd	 eq0,r2,@L6737
	ld	 r13,r20,20
	bcnd.n	 ne0,r13,@L6740
	or	 r17,r0,r2
	br	 @L7200
	align	 4
@L6737:
	bsr.n	 _int_size_in_bytes
	ld	 r2,r31,172
	or	 r3,r0,r2
	or	 r2,r0,r14
	bsr.n	 _assign_stack_temp
	or	 r4,r0,0
	bsr.n	 _preserve_temp_slots
	or	 r17,r0,r2
@L6736:
	st	 r17,r25,64
@L6740:
	ld	 r2,r20,20
	ld	 r4,r31,164
	or	 r3,r0,r17
	or	 r5,r0,r19
	st	 r0,r20,20
	bsr.n	 _expand_expr
	addu	 r1,r1,@L8649
@L8650:
	align	 4
@L6741:
	ld	 r21,r20,16
	ld	 r15,r31,188
	or	 r18,r0,0
	ld	 r22,r20,20
	or	 r24,r0,0
	ld.bu	 r12,r21,8
	subu	 r13,r15,1
	ld	 r20,r21,4
	mask	 r11,r12,0xff
	bcnd.n	 ne0,r11,@L6743
	subu	 r19,r0,r13
	or	 r2,r0,r22
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	br.n	 @L6742
	or	 r19,r0,r2
	align	 4
@L6743:
	subu	 r13,r12,37
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6745
	cmp	 r13,r11,42
	bb1	 ne,r13,@L6744
	ld	 r13,r21,20
	ld.bu	 r13,r13,8
	cmp	 r13,r13,25
	bb1	 ne,r13,@L6744
	ld	 r13,r20,16
	ld.bu	 r13,r13,8
	cmp	 r13,r13,25
	bb1	 ne,r13,@L6744
@L6745:
	or	 r2,r0,r21
	addu	 r3,r31,136
	addu	 r4,r31,140
	addu	 r5,r31,144
	addu	 r6,r31,148
	addu	 r7,r31,152
	addu	 r8,r31,156
	bsr.n	 _get_inner_reference
	st	 r0,r31,156
	ld	 r13,r31,148
	subu	 r12,r0,r19
	cmp	 r13,r13,0
	subu	 r12,r0,r12
	extu	 r13,r13,1<eq>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L6746
	or	 r23,r0,r2
	bsr	 _stabilize_reference
	or	 r23,r0,r2
@L6746:
	or	 r2,r0,r23
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld	 r13,r31,144
	bcnd.n	 eq0,r13,@L6747
	or	 r24,r0,r2
	or	 r2,r0,r13
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb0.n	 ne,r13,@L6748
	or	 r3,r0,r2
	bsr	 _abort
	align	 4
@L6748:
	or	 r2,r0,4
	bsr.n	 _force_reg
	ld	 r25,r24,4
	or	 r5,r0,r2
	or	 r2,r0,63
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L6747:
	ld	 r13,r31,156
	bcnd	 eq0,r13,@L6749
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1	 ne,r13,@L6749
	ld	 r13,r0,r24
	or	 r13,r13,16
	st	 r13,r0,r24
@L6749:
	bsr.n	 _int_size_in_bytes
	ld	 r2,r23,4
	ld	 r3,r31,136
	ld	 r4,r31,140
	ld	 r5,r31,148
	bcnd.n	 eq0,r19,@L6751
	or	 r12,r0,r2
	ld	 r13,r21,4
	ld.bu	 r7,r13,24
	br	 @L6752
	align	 4
@L6751:
	or	 r7,r0,0
@L6752:
	ld	 r13,r23,4
	ld	 r9,r13,28
	or	 r2,r0,r24
	ld	 r8,r31,152
	or	 r6,r0,r22
	extu	 r9,r9,0<3>
	st	 r12,r31,32
	bsr.n	 _store_field
	addu	 r1,r1,@L8651
@L8652:
	align	 4
@L6744:
	bcnd.n	 ne0,r24,@L6753
	or	 r2,r0,r21
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r24,r0,r2
@L6753:
	ld.bu	 r13,r21,8
	cmp	 r13,r13,35
	bb1.n	 ne,r13,@L8251
	or	 r2,r0,r22
	ld.bu	 r13,r22,8
	cmp	 r13,r13,39
	bb1.n	 ne,r13,@L8252
	or	 r3,r0,r24
	or.u	 r13,r0,hi16(_current_function_returns_struct)
	ld	 r13,r13,lo16(_current_function_returns_struct)
	bcnd.n	 eq0,r13,@L8252
	or.u	 r13,r0,hi16(_current_function_returns_pcc_struct)
	ld	 r13,r13,lo16(_current_function_returns_pcc_struct)
	bcnd	 ne0,r13,@L8252
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r25,r0,r2
	bsr.n	 _expr_size
	or	 r2,r0,r22
	ld	 r6,r24,4
	ld	 r8,r25,4
	st	 r2,r31,32
	or	 r3,r0,0
	or	 r4,r0,0
	or	 r5,r0,3
	or.u	 r13,r0,hi16(_memcpy_libfunc)
	or	 r7,r0,4
	ld	 r2,r13,lo16(_memcpy_libfunc)
	or	 r9,r0,4
	or	 r13,r0,4
	bsr.n	 _emit_library_call
	st	 r13,r31,36
	br.n	 @L7966
	or	 r2,r0,r24
	align	 4
@L8251:
	or	 r3,r0,r24
@L8252:
	bsr.n	 _store_expr
	or	 r4,r0,r19
@L7965:
	or	 r25,r0,r2
@L7966:
	bsr.n	 _preserve_temp_slots
	or	 r19,r0,r2
	bsr	 _free_temp_slots
@L6742:
	ld	 r13,r20,72
	bcnd	 eq0,r13,@L6755
	ld.bu	 r2,r22,8
	subu	 r13,r2,33
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6758
	mask	 r2,r2,0xff
	cmp	 r13,r2,50
	cmp	 r12,r2,47
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L6756
	or	 r13,r0,1
	cmp	 r13,r2,37
	cmp	 r12,r2,42
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L6757
	or	 r13,r0,0
@L6758:
	or	 r13,r0,1
@L6757:
@L6756:
	bcnd	 ne0,r13,@L6755
	bsr.n	 _stabilize_reference
	or	 r2,r0,r21
	ld	 r25,r20,72
	or	 r24,r0,0
	bcnd.n	 eq0,r25,@L6761
	or	 r23,r0,r2
@L6763:
	ld	 r5,r25,16
	ld.bu	 r13,r5,8
	cmp	 r13,r13,3
	bb1.n	 ne,r13,@L6764
	or	 r2,r0,37
	or	 r2,r0,r23
	bsr.n	 _init_noncopied_parts
	or	 r3,r0,r5
	or	 r3,r0,r2
	or	 r2,r0,r24
	bsr.n	 _chainon
	addu	 r1,r1,@L8653
@L8654:
	align	 4
@L6764:
	ld	 r3,r5,4
	bsr.n	 _build
	or	 r4,r0,r23
	or	 r3,r0,r2
	ld	 r2,r25,12
	bsr.n	 _tree_cons
	or	 r4,r0,r24
@L7967:
	ld	 r25,r0,r25
	bcnd.n	 ne0,r25,@L6763
	or	 r24,r0,r2
@L6761:
	or	 r18,r0,r24
@L6755:
	bcnd	 eq0,r18,@L7199
@L6769:
	ld	 r25,r18,16
	ld.bu	 r13,r25,8
	mask	 r12,r13,0xff
	ld	 r22,r18,12
	bcnd.n	 ne0,r12,@L6771
	or	 r24,r0,0
	or	 r2,r0,r22
	or	 r3,r0,0
	or	 r4,r0,0
	or	 r5,r0,0
	bsr.n	 _expand_expr
	addu	 r1,r1,@L8655
@L8656:
	align	 4
@L6771:
	subu	 r13,r13,37
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6773
	cmp	 r13,r12,42
	bb1	 ne,r13,@L6772
	ld	 r13,r25,20
	ld.bu	 r13,r13,8
	cmp	 r13,r13,25
	bb1	 ne,r13,@L6772
	ld	 r13,r25,4
	ld	 r13,r13,16
	ld.bu	 r13,r13,8
	cmp	 r13,r13,25
	bb1	 ne,r13,@L6772
@L6773:
	or	 r2,r0,r25
	addu	 r3,r31,136
	addu	 r4,r31,140
	addu	 r5,r31,144
	addu	 r6,r31,148
	addu	 r7,r31,152
	addu	 r8,r31,156
	bsr.n	 _get_inner_reference
	st	 r0,r31,156
	or	 r3,r0,0
	or	 r4,r0,0
	or	 r23,r0,r2
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld	 r13,r31,144
	bcnd.n	 eq0,r13,@L6775
	or	 r24,r0,r2
	or	 r2,r0,r13
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb0.n	 ne,r13,@L6776
	or	 r3,r0,r2
	bsr	 _abort
	align	 4
@L6776:
	or	 r2,r0,4
	bsr.n	 _force_reg
	ld	 r25,r24,4
	or	 r5,r0,r2
	or	 r2,r0,63
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L6775:
	ld	 r13,r31,156
	bcnd	 eq0,r13,@L6777
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1	 ne,r13,@L6777
	ld	 r13,r0,r24
	or	 r13,r13,16
	st	 r13,r0,r24
@L6777:
	bsr.n	 _int_size_in_bytes
	ld	 r2,r23,4
	ld	 r3,r31,136
	ld	 r4,r31,140
	ld	 r5,r31,148
	ld	 r13,r23,4
	ld	 r8,r31,152
	ld	 r9,r13,28
	or	 r6,r0,r22
	or	 r7,r0,0
	st	 r2,r31,32
	or	 r2,r0,r24
	extu	 r9,r9,0<3>
	bsr.n	 _store_field
	addu	 r1,r1,@L8657
@L8658:
	align	 4
@L6772:
	bcnd.n	 ne0,r24,@L6781
	or	 r2,r0,r25
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r24,r0,r2
@L6781:
	ld.bu	 r13,r25,8
	cmp	 r13,r13,35
	bb1.n	 ne,r13,@L8253
	or	 r2,r0,r22
	ld.bu	 r13,r22,8
	cmp	 r13,r13,39
	bb1.n	 ne,r13,@L8254
	or	 r3,r0,r24
	or.u	 r13,r0,hi16(_current_function_returns_struct)
	ld	 r13,r13,lo16(_current_function_returns_struct)
	bcnd.n	 eq0,r13,@L8254
	or.u	 r13,r0,hi16(_current_function_returns_pcc_struct)
	ld	 r13,r13,lo16(_current_function_returns_pcc_struct)
	bcnd	 ne0,r13,@L8254
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r25,r0,r2
	bsr.n	 _expr_size
	or	 r2,r0,r22
	ld	 r6,r24,4
	ld	 r8,r25,4
	st	 r2,r31,32
	or	 r3,r0,0
	or	 r4,r0,0
	or	 r5,r0,3
	or.u	 r13,r0,hi16(_memcpy_libfunc)
	or	 r7,r0,4
	ld	 r2,r13,lo16(_memcpy_libfunc)
	or	 r9,r0,4
	or	 r13,r0,4
	bsr.n	 _emit_library_call
	st	 r13,r31,36
	br.n	 @L7968
	or	 r2,r0,r24
	align	 4
@L8253:
	or	 r3,r0,r24
@L8254:
	bsr.n	 _store_expr
	or	 r4,r0,0
@L7968:
	bsr	 _preserve_temp_slots
	bsr	 _free_temp_slots
@L6770:
	ld	 r18,r0,r18
	bcnd	 ne0,r18,@L6769
	or	 r2,r0,r19
	br	 @L7200
	align	 4
@L6784:
	ld	 r19,r20,16
	ld.bu	 r11,r19,8
	cmp	 r13,r11,33
	cmp	 r12,r11,35
	or	 r13,r13,r12
	ld	 r18,r20,20
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	ld	 r25,r19,4
	bcnd.n	 eq0,r13,@L6785
	or	 r21,r0,0
	cmp	 r13,r11,34
	bb0	 ne,r13,@L6785
	bsr.n	 _preexpand_calls
	or	 r2,r0,r20
@L6785:
	ld	 r15,r31,188
	bcnd	 eq0,r15,@L6786
	ld.bu	 r13,r19,8
	cmp	 r13,r13,37
	bb1	 ne,r13,@L6786
	ld.bu	 r13,r18,8
	cmp	 r12,r13,81
	cmp	 r13,r13,83
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L6786
	ld	 r13,r18,16
	cmp	 r13,r13,r19
	bb1	 ne,r13,@L6786
	ld	 r12,r18,20
	ld.bu	 r13,r12,8
	cmp	 r13,r13,37
	bb1	 ne,r13,@L6786
	ld	 r13,r19,20
	ld	 r13,r13,20
	ld	 r13,r13,12
	cmp	 r13,r13,1
	bb1	 ne,r13,@L6786
	ld	 r13,r12,20
	ld	 r13,r13,20
	ld	 r13,r13,12
	cmp	 r13,r13,1
	bb1	 ne,r13,@L6786
	bsr	 _gen_label_rtx
	ld.bu	 r4,r18,8
	or	 r21,r0,r2
	cmp	 r3,r4,81
	cmp	 r4,r4,83
	ext	 r3,r3,1<eq>
	ld	 r2,r18,20
	ext	 r4,r4,1<eq>
	and	 r3,r21,r3
	bsr.n	 _do_jump
	and	 r4,r21,r4
	ld.bu	 r13,r18,8
	cmp	 r13,r13,81
	ld	 r2,r18,4
	bb1.n	 ne,r13,@L6791
	or.u	 r13,r0,hi16(_integer_zero_node)
	or.u	 r13,r0,hi16(_integer_one_node)
	ld	 r3,r13,lo16(_integer_one_node)
	br	 @L6792
	align	 4
@L6791:
	ld	 r3,r13,lo16(_integer_zero_node)
@L6792:
	bsr.n	 _convert
	or	 r24,r0,0
	ld.bu	 r13,r19,8
	mask	 r12,r13,0xff
	bcnd.n	 ne0,r12,@L6794
	or	 r22,r0,r2
	or	 r3,r0,0
	or	 r4,r0,0
	or	 r5,r0,0
	bsr.n	 _expand_expr
	addu	 r1,r1,@L8659
@L8660:
	align	 4
@L6794:
	subu	 r13,r13,37
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6796
	cmp	 r13,r12,42
	bb1	 ne,r13,@L6795
	ld	 r13,r19,20
	ld.bu	 r13,r13,8
	cmp	 r13,r13,25
	bb1	 ne,r13,@L6795
	ld	 r13,r19,4
	ld	 r13,r13,16
	ld.bu	 r13,r13,8
	cmp	 r13,r13,25
	bb1	 ne,r13,@L6795
@L6796:
	or	 r2,r0,r19
	addu	 r3,r31,136
	addu	 r4,r31,140
	addu	 r5,r31,144
	addu	 r6,r31,148
	addu	 r7,r31,152
	addu	 r8,r31,156
	bsr.n	 _get_inner_reference
	st	 r0,r31,156
	or	 r3,r0,0
	or	 r4,r0,0
	or	 r23,r0,r2
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld	 r13,r31,144
	bcnd.n	 eq0,r13,@L6798
	or	 r24,r0,r2
	or	 r2,r0,r13
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb0.n	 ne,r13,@L6799
	or	 r3,r0,r2
	bsr	 _abort
	align	 4
@L6799:
	or	 r2,r0,4
	bsr.n	 _force_reg
	ld	 r25,r24,4
	or	 r5,r0,r2
	or	 r2,r0,63
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L6798:
	ld	 r13,r31,156
	bcnd	 eq0,r13,@L6800
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1	 ne,r13,@L6800
	ld	 r13,r0,r24
	or	 r13,r13,16
	st	 r13,r0,r24
@L6800:
	bsr.n	 _int_size_in_bytes
	ld	 r2,r23,4
	ld	 r3,r31,136
	ld	 r4,r31,140
	ld	 r5,r31,148
	ld	 r13,r23,4
	ld	 r8,r31,152
	ld	 r9,r13,28
	or	 r6,r0,r22
	or	 r7,r0,0
	st	 r2,r31,32
	or	 r2,r0,r24
	extu	 r9,r9,0<3>
	bsr.n	 _store_field
	addu	 r1,r1,@L8661
@L8662:
	align	 4
@L6795:
	bcnd.n	 ne0,r24,@L6804
	or	 r2,r0,r19
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r24,r0,r2
@L6804:
	ld.bu	 r13,r19,8
	cmp	 r13,r13,35
	bb1.n	 ne,r13,@L8255
	or	 r2,r0,r22
	ld.bu	 r13,r22,8
	cmp	 r13,r13,39
	bb1.n	 ne,r13,@L8256
	or	 r3,r0,r24
	or.u	 r13,r0,hi16(_current_function_returns_struct)
	ld	 r13,r13,lo16(_current_function_returns_struct)
	bcnd.n	 eq0,r13,@L8256
	or.u	 r13,r0,hi16(_current_function_returns_pcc_struct)
	ld	 r13,r13,lo16(_current_function_returns_pcc_struct)
	bcnd	 ne0,r13,@L8256
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r25,r0,r2
	bsr.n	 _expr_size
	or	 r2,r0,r22
	ld	 r6,r24,4
	ld	 r8,r25,4
	st	 r2,r31,32
	or	 r3,r0,0
	or	 r4,r0,0
	or	 r5,r0,3
	or.u	 r13,r0,hi16(_memcpy_libfunc)
	or	 r7,r0,4
	ld	 r2,r13,lo16(_memcpy_libfunc)
	or	 r9,r0,4
	or	 r13,r0,4
	bsr.n	 _emit_library_call
	st	 r13,r31,36
	br.n	 @L7969
	or	 r2,r0,r24
	align	 4
@L8255:
	or	 r3,r0,r24
@L8256:
	bsr.n	 _store_expr
	or	 r4,r0,0
@L7969:
	bsr	 _preserve_temp_slots
	bsr	 _free_temp_slots
@L6793:
	bsr	 _do_pending_stack_adjust
	or	 r2,r0,r21
	bsr.n	 _emit_label
	addu	 r1,r1,@L8663
@L8664:
	align	 4
@L6786:
	ld	 r13,r25,72
	bcnd	 eq0,r13,@L6806
	ld.bu	 r12,r19,8
	subu	 r13,r12,33
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6810
	mask	 r11,r12,0xff
	cmp	 r13,r11,50
	cmp	 r12,r11,47
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L6808
	or	 r13,r0,1
	cmp	 r13,r11,37
	cmp	 r12,r11,42
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L6809
	or	 r13,r0,0
@L6810:
	or	 r13,r0,1
@L6809:
@L6808:
	bcnd	 eq0,r13,@L6807
	ld.bu	 r12,r18,8
	subu	 r13,r12,33
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6813
	mask	 r11,r12,0xff
	cmp	 r13,r11,50
	cmp	 r12,r11,47
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L6811
	or	 r13,r0,1
	cmp	 r13,r11,37
	cmp	 r12,r11,42
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L6812
	or	 r13,r0,0
@L6813:
	or	 r13,r0,1
@L6812:
@L6811:
	bcnd	 ne0,r13,@L6806
@L6807:
	bsr.n	 _stabilize_reference
	or	 r2,r0,r19
	ld	 r22,r25,72
	or	 r23,r0,0
	bcnd.n	 eq0,r22,@L6816
	or	 r20,r0,r2
@L6818:
	ld	 r3,r22,16
	ld.bu	 r13,r3,8
	cmp	 r13,r13,3
	bb1.n	 ne,r13,@L6819
	or	 r2,r0,37
	bsr.n	 _save_noncopied_parts
	or	 r2,r0,r20
	or	 r3,r0,r2
	bsr.n	 _chainon
	or	 r2,r0,r23
	br.n	 @L6817
	or	 r23,r0,r2
	align	 4
@L6819:
	ld	 r24,r3,4
	or	 r4,r0,r20
	or	 r5,r0,r3
	bsr.n	 _build
	or	 r3,r0,r24
	or	 r21,r0,r2
	or	 r2,r0,r24
	bsr.n	 _int_size_in_bytes
	ld.bu	 r25,r24,24
	or	 r4,r0,0
	or	 r3,r0,r2
	bsr.n	 _assign_stack_temp
	or	 r2,r0,r25
	or	 r25,r0,r2
	ld.bu	 r2,r24,24
	bsr.n	 _memory_address_p
	ld	 r3,r25,4
	bcnd.n	 ne0,r2,@L8257
	or	 r2,r0,105
	ld.bu	 r3,r24,24
	or	 r2,r0,r25
	bsr.n	 _change_address
	or	 r4,r0,0
	or	 r25,r0,r2
	or	 r2,r0,105
@L8257:
	or	 r3,r0,r24
	or	 r4,r0,0
	bsr.n	 _build
	or	 r5,r0,r25
	or	 r3,r0,r2
	or	 r2,r0,r21
	bsr.n	 _tree_cons
	or	 r4,r0,r23
	or	 r23,r0,r2
	ld	 r13,r23,16
	ld	 r2,r23,12
	ld	 r3,r13,20
	bsr.n	 _store_expr
	or	 r4,r0,0
@L6817:
	ld	 r22,r0,r22
	bcnd	 ne0,r22,@L6818
@L6816:
	or	 r21,r0,r23
@L6806:
	ld	 r15,r31,188
	ld.bu	 r12,r19,8
	or	 r24,r0,0
	subu	 r13,r15,1
	mask	 r11,r12,0xff
	bcnd.n	 ne0,r11,@L6824
	subu	 r22,r0,r13
	or	 r2,r0,r18
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	br.n	 @L6823
	or	 r19,r0,r2
	align	 4
@L6824:
	subu	 r13,r12,37
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6826
	cmp	 r13,r11,42
	bb1	 ne,r13,@L6825
	ld	 r13,r19,20
	ld.bu	 r13,r13,8
	cmp	 r13,r13,25
	bb1	 ne,r13,@L6825
	ld	 r13,r19,4
	ld	 r13,r13,16
	ld.bu	 r13,r13,8
	cmp	 r13,r13,25
	bb1	 ne,r13,@L6825
@L6826:
	or	 r2,r0,r19
	addu	 r3,r31,136
	addu	 r4,r31,140
	addu	 r5,r31,144
	addu	 r6,r31,148
	addu	 r7,r31,152
	addu	 r8,r31,156
	bsr.n	 _get_inner_reference
	st	 r0,r31,156
	ld	 r13,r31,148
	subu	 r12,r0,r22
	cmp	 r13,r13,0
	subu	 r12,r0,r12
	extu	 r13,r13,1<eq>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L6827
	or	 r23,r0,r2
	bsr	 _stabilize_reference
	or	 r23,r0,r2
@L6827:
	or	 r2,r0,r23
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld	 r13,r31,144
	bcnd.n	 eq0,r13,@L6828
	or	 r24,r0,r2
	or	 r2,r0,r13
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb0.n	 ne,r13,@L6829
	or	 r3,r0,r2
	bsr	 _abort
	align	 4
@L6829:
	or	 r2,r0,4
	bsr.n	 _force_reg
	ld	 r25,r24,4
	or	 r5,r0,r2
	or	 r2,r0,63
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L6828:
	ld	 r13,r31,156
	bcnd	 eq0,r13,@L6830
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1	 ne,r13,@L6830
	ld	 r13,r0,r24
	or	 r13,r13,16
	st	 r13,r0,r24
@L6830:
	bsr.n	 _int_size_in_bytes
	ld	 r2,r23,4
	ld	 r3,r31,136
	ld	 r4,r31,140
	ld	 r5,r31,148
	bcnd.n	 eq0,r22,@L6832
	or	 r12,r0,r2
	ld	 r13,r19,4
	ld.bu	 r7,r13,24
	br	 @L6833
	align	 4
@L6832:
	or	 r7,r0,0
@L6833:
	ld	 r13,r23,4
	ld	 r9,r13,28
	or	 r2,r0,r24
	ld	 r8,r31,152
	or	 r6,r0,r18
	extu	 r9,r9,0<3>
	st	 r12,r31,32
	bsr.n	 _store_field
	addu	 r1,r1,@L8665
@L8666:
	align	 4
@L6825:
	bcnd.n	 ne0,r24,@L6834
	or	 r2,r0,r19
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r24,r0,r2
@L6834:
	ld.bu	 r13,r19,8
	cmp	 r13,r13,35
	bb1.n	 ne,r13,@L8258
	or	 r2,r0,r18
	ld.bu	 r13,r18,8
	cmp	 r13,r13,39
	bb1.n	 ne,r13,@L8259
	or	 r3,r0,r24
	or.u	 r13,r0,hi16(_current_function_returns_struct)
	ld	 r13,r13,lo16(_current_function_returns_struct)
	bcnd.n	 eq0,r13,@L8259
	or.u	 r13,r0,hi16(_current_function_returns_pcc_struct)
	ld	 r13,r13,lo16(_current_function_returns_pcc_struct)
	bcnd	 ne0,r13,@L8259
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r25,r0,r2
	bsr.n	 _expr_size
	or	 r2,r0,r18
	ld	 r6,r24,4
	ld	 r8,r25,4
	st	 r2,r31,32
	or	 r3,r0,0
	or	 r4,r0,0
	or	 r5,r0,3
	or.u	 r13,r0,hi16(_memcpy_libfunc)
	or	 r7,r0,4
	ld	 r2,r13,lo16(_memcpy_libfunc)
	or	 r9,r0,4
	or	 r13,r0,4
	bsr.n	 _emit_library_call
	st	 r13,r31,36
	br.n	 @L7971
	or	 r2,r0,r24
	align	 4
@L8258:
	or	 r3,r0,r24
@L8259:
	bsr.n	 _store_expr
	or	 r4,r0,r22
@L7970:
	or	 r25,r0,r2
@L7971:
	bsr.n	 _preserve_temp_slots
	or	 r19,r0,r2
	bsr	 _free_temp_slots
@L6823:
	bcnd.n	 eq0,r21,@L7200
	or	 r2,r0,r19
@L6838:
	ld	 r25,r21,12
	ld.bu	 r13,r25,8
	mask	 r12,r13,0xff
	ld	 r22,r21,16
	bcnd.n	 ne0,r12,@L6840
	or	 r24,r0,0
	or	 r2,r0,r22
	or	 r3,r0,0
	or	 r4,r0,0
	or	 r5,r0,0
	bsr.n	 _expand_expr
	addu	 r1,r1,@L8667
@L8668:
	align	 4
@L6840:
	subu	 r13,r13,37
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6842
	cmp	 r13,r12,42
	bb1	 ne,r13,@L6841
	ld	 r13,r25,20
	ld.bu	 r13,r13,8
	cmp	 r13,r13,25
	bb1	 ne,r13,@L6841
	ld	 r13,r25,4
	ld	 r13,r13,16
	ld.bu	 r13,r13,8
	cmp	 r13,r13,25
	bb1	 ne,r13,@L6841
@L6842:
	or	 r2,r0,r25
	addu	 r3,r31,136
	addu	 r4,r31,140
	addu	 r5,r31,144
	addu	 r6,r31,148
	addu	 r7,r31,152
	addu	 r8,r31,156
	bsr.n	 _get_inner_reference
	st	 r0,r31,156
	or	 r3,r0,0
	or	 r4,r0,0
	or	 r23,r0,r2
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld	 r13,r31,144
	bcnd.n	 eq0,r13,@L6844
	or	 r24,r0,r2
	or	 r2,r0,r13
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb0.n	 ne,r13,@L6845
	or	 r3,r0,r2
	bsr	 _abort
	align	 4
@L6845:
	or	 r2,r0,4
	bsr.n	 _force_reg
	ld	 r25,r24,4
	or	 r5,r0,r2
	or	 r2,r0,63
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L6844:
	ld	 r13,r31,156
	bcnd	 eq0,r13,@L6846
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1	 ne,r13,@L6846
	ld	 r13,r0,r24
	or	 r13,r13,16
	st	 r13,r0,r24
@L6846:
	bsr.n	 _int_size_in_bytes
	ld	 r2,r23,4
	ld	 r3,r31,136
	ld	 r4,r31,140
	ld	 r5,r31,148
	ld	 r13,r23,4
	ld	 r8,r31,152
	ld	 r9,r13,28
	or	 r6,r0,r22
	or	 r7,r0,0
	st	 r2,r31,32
	or	 r2,r0,r24
	extu	 r9,r9,0<3>
	bsr.n	 _store_field
	addu	 r1,r1,@L8669
@L8670:
	align	 4
@L6841:
	bcnd.n	 ne0,r24,@L6850
	or	 r2,r0,r25
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r24,r0,r2
@L6850:
	ld.bu	 r13,r25,8
	cmp	 r13,r13,35
	bb1.n	 ne,r13,@L8260
	or	 r2,r0,r22
	ld.bu	 r13,r22,8
	cmp	 r13,r13,39
	bb1.n	 ne,r13,@L8261
	or	 r3,r0,r24
	or.u	 r13,r0,hi16(_current_function_returns_struct)
	ld	 r13,r13,lo16(_current_function_returns_struct)
	bcnd.n	 eq0,r13,@L8261
	or.u	 r13,r0,hi16(_current_function_returns_pcc_struct)
	ld	 r13,r13,lo16(_current_function_returns_pcc_struct)
	bcnd	 ne0,r13,@L8261
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r25,r0,r2
	bsr.n	 _expr_size
	or	 r2,r0,r22
	ld	 r6,r24,4
	ld	 r8,r25,4
	st	 r2,r31,32
	or	 r3,r0,0
	or	 r4,r0,0
	or	 r5,r0,3
	or.u	 r13,r0,hi16(_memcpy_libfunc)
	or	 r7,r0,4
	ld	 r2,r13,lo16(_memcpy_libfunc)
	or	 r9,r0,4
	or	 r13,r0,4
	bsr.n	 _emit_library_call
	st	 r13,r31,36
	br.n	 @L7972
	or	 r2,r0,r24
	align	 4
@L8260:
	or	 r3,r0,r24
@L8261:
	bsr.n	 _store_expr
	or	 r4,r0,0
@L7972:
	bsr	 _preserve_temp_slots
	bsr	 _free_temp_slots
@L6839:
	ld	 r21,r0,r21
	bcnd	 ne0,r21,@L6838
	or	 r2,r0,r19
	br	 @L7200
	align	 4
@L6854:
	or	 r2,r0,r20
	or	 r3,r0,0
	bsr.n	 _expand_increment
	addu	 r1,r1,@L8671
@L8672:
	align	 4
@L6856:
	ld	 r15,r31,188
	subu	 r3,r15,1
	or	 r2,r0,r20
	subu	 r3,r0,r3
	bsr.n	 _expand_increment
	addu	 r1,r1,@L8673
@L8674:
	align	 4
@L6857:
	ld	 r2,r20,16
	ld.bu	 r13,r2,8
	cmp	 r13,r13,29
	bb1.n	 ne,r13,@L8262
	cmp	 r13,r19,3
	bsr	 _decl_function_context
	bcnd	 eq0,r2,@L6858
	ld	 r2,r20,16
	bsr.n	 _trampoline_address
	or	 r23,r0,0
	or	 r18,r0,r2
	or	 r24,r0,0
	bcnd.n	 eq0,r17,@L6860
	or	 r22,r0,r18
	ld.hu	 r13,r0,r17
	cmp	 r13,r13,51
	ext	 r13,r13,1<eq>
	and	 r24,r17,r13
@L6860:
	ld.hu	 r12,r0,r18
	cmp	 r13,r12,63
	bb1.n	 ne,r13,@L6862
	cmp	 r13,r12,64
	or.u	 r13,r0,hi16(_add_optab)
	ld	 r23,r13,lo16(_add_optab)
	br	 @L6863
	align	 4
@L6862:
	bb1.n	 ne,r13,@L6864
	cmp	 r13,r12,66
	or.u	 r13,r0,hi16(_sub_optab)
	ld	 r23,r13,lo16(_sub_optab)
	br	 @L6863
	align	 4
@L6864:
	bb1	 ne,r13,@L6863
	ld	 r25,r18,8
	ld.hu	 r12,r0,r25
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6867
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6867
	mask	 r11,r12,0xffff
	cmp	 r13,r11,49
	cmp	 r12,r11,113
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L6867
	cmp	 r13,r11,51
	cmp	 r12,r25,r24
	or.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	subu	 r13,r13,1
	and	 r24,r24,r13
@L6867:
	ld	 r2,r22,4
	bsr.n	 _force_operand
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r2,r0,r25
	ld.bu	 r25,r22,2
	br.n	 @L7973
	or	 r3,r0,0
	align	 4
@L6863:
	bcnd	 eq0,r23,@L6868
	ld	 r25,r22,8
	ld.hu	 r12,r0,r25
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6869
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6869
	mask	 r11,r12,0xffff
	cmp	 r13,r11,49
	cmp	 r12,r11,113
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L6869
	cmp	 r13,r11,51
	cmp	 r12,r25,r24
	or.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	subu	 r13,r13,1
	and	 r24,r24,r13
@L6869:
	or.u	 r13,r0,hi16(_sub_optab)
	ld	 r13,r13,lo16(_sub_optab)
	cmp	 r13,r23,r13
	bb1.n	 ne,r13,@L8263
	or.u	 r13,r0,hi16(_add_optab)
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb1.n	 ne,r13,@L8263
	or.u	 r13,r0,hi16(_add_optab)
	ld.bu	 r2,r22,2
	or	 r3,r0,r25
	bsr.n	 _negate_rtx
	ld	 r23,r13,lo16(_add_optab)
	or	 r25,r0,r2
	or.u	 r13,r0,hi16(_add_optab)
@L8263:
	ld	 r13,r13,lo16(_add_optab)
	cmp	 r13,r23,r13
	bb1	 ne,r13,@L6871
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb1	 ne,r13,@L6871
	ld	 r4,r22,4
	ld.hu	 r13,r0,r4
	cmp	 r13,r13,63
	bb1	 ne,r13,@L6871
	ld	 r4,r4,4
	ld.hu	 r13,r0,r4
	cmp	 r13,r13,51
	bb1	 ne,r13,@L6871
	ld	 r13,r4,4
	subu	 r13,r13,64
	cmp	 r13,r13,3
	bb0	 ls,r13,@L6871
	ld.bu	 r2,r22,2
	or	 r3,r0,r23
	or	 r5,r0,r25
	or	 r6,r0,r24
	or	 r7,r0,0
	bsr.n	 _expand_binop
	or	 r8,r0,3
	ld	 r13,r22,4
	or	 r24,r0,r2
	ld	 r2,r13,8
	or	 r3,r0,0
	bsr.n	 _force_operand
	ld.bu	 r25,r22,2
	or	 r5,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,r23
	or	 r4,r0,r24
	or	 r6,r0,r17
	or	 r7,r0,0
	br.n	 @L7974
	or	 r8,r0,3
	align	 4
@L6871:
	ld	 r2,r22,4
	bsr.n	 _force_operand
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,0
	bsr.n	 _force_operand
	ld.bu	 r25,r22,2
	br.n	 @L7975
	or	 r3,r0,r23
	align	 4
@L6868:
	br.n	 @L6872
	or	 r18,r0,r22
	align	 4
@L6858:
	cmp	 r13,r19,3
	ld	 r2,r20,16
@L8262:
	ext	 r25,r13,1<eq>
	or	 r3,r0,0
	mask	 r5,r25,3
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r5,2
	or	 r18,r0,r2
	ld.hu	 r13,r0,r18
	cmp	 r13,r13,55
	bb0.n	 ne,r13,@L6875
	cmp	 r13,r19,1
	bsr	 _abort
	align	 4
@L6875:
	subu	 r12,r0,r25
	extu	 r13,r13,1<eq>
	or	 r13,r13,r12
	bcnd	 eq0,r13,@L6876
	ld	 r2,r18,4
	br	 @L7200
	align	 4
@L6876:
	ld	 r23,r18,4
	or	 r22,r0,0
	bcnd.n	 eq0,r17,@L6878
	or	 r24,r0,0
	ld.hu	 r13,r0,r17
	cmp	 r13,r13,51
	ext	 r13,r13,1<eq>
	and	 r24,r17,r13
@L6878:
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,63
	bb1.n	 ne,r13,@L6880
	cmp	 r13,r12,64
	or.u	 r13,r0,hi16(_add_optab)
	ld	 r22,r13,lo16(_add_optab)
	br	 @L6881
	align	 4
@L6880:
	bb1.n	 ne,r13,@L6882
	cmp	 r13,r12,66
	or.u	 r13,r0,hi16(_sub_optab)
	ld	 r22,r13,lo16(_sub_optab)
	br	 @L6881
	align	 4
@L6882:
	bb1	 ne,r13,@L6881
	ld	 r25,r23,8
	ld.hu	 r12,r0,r25
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6885
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6885
	mask	 r11,r12,0xffff
	cmp	 r13,r11,49
	cmp	 r12,r11,113
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L6885
	cmp	 r13,r11,51
	cmp	 r12,r25,r24
	or.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	subu	 r13,r13,1
	and	 r24,r24,r13
@L6885:
	ld	 r2,r23,4
	bsr.n	 _force_operand
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,0
	ld.bu	 r25,r23,2
@L7973:
	bsr	 _force_operand
	or	 r3,r0,r24
	or	 r5,r0,r17
	or	 r6,r0,0
	or	 r4,r0,r2
	bsr.n	 _expand_mult
	or	 r2,r0,r25
	br.n	 @L6872
	or	 r18,r0,r2
	align	 4
@L6881:
	bcnd	 eq0,r22,@L6886
	ld	 r25,r23,8
	ld.hu	 r12,r0,r25
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6887
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6887
	mask	 r11,r12,0xffff
	cmp	 r13,r11,49
	cmp	 r12,r11,113
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L6887
	cmp	 r13,r11,51
	cmp	 r12,r25,r24
	or.c	 r13,r12,r13
	extu	 r13,r13,1<eq>
	subu	 r13,r13,1
	and	 r24,r24,r13
@L6887:
	or.u	 r13,r0,hi16(_sub_optab)
	ld	 r13,r13,lo16(_sub_optab)
	cmp	 r13,r22,r13
	bb1.n	 ne,r13,@L8264
	or.u	 r13,r0,hi16(_add_optab)
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb1.n	 ne,r13,@L8264
	or.u	 r13,r0,hi16(_add_optab)
	ld.bu	 r2,r23,2
	or	 r3,r0,r25
	bsr.n	 _negate_rtx
	ld	 r22,r13,lo16(_add_optab)
	or	 r25,r0,r2
	or.u	 r13,r0,hi16(_add_optab)
@L8264:
	ld	 r13,r13,lo16(_add_optab)
	cmp	 r13,r22,r13
	bb1	 ne,r13,@L6889
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb1	 ne,r13,@L6889
	ld	 r4,r23,4
	ld.hu	 r13,r0,r4
	cmp	 r13,r13,63
	bb1	 ne,r13,@L6889
	ld	 r4,r4,4
	ld.hu	 r13,r0,r4
	cmp	 r13,r13,51
	bb1	 ne,r13,@L6889
	ld	 r13,r4,4
	subu	 r13,r13,64
	cmp	 r13,r13,3
	bb0	 ls,r13,@L6889
	ld.bu	 r2,r23,2
	or	 r3,r0,r22
	or	 r5,r0,r25
	or	 r6,r0,r24
	or	 r7,r0,0
	bsr.n	 _expand_binop
	or	 r8,r0,3
	ld	 r13,r23,4
	or	 r24,r0,r2
	ld	 r2,r13,8
	or	 r3,r0,0
	bsr.n	 _force_operand
	ld.bu	 r25,r23,2
	or	 r5,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,r22
	or	 r4,r0,r24
	or	 r6,r0,r17
	or	 r7,r0,0
	br.n	 @L7974
	or	 r8,r0,3
	align	 4
@L6889:
	ld	 r2,r23,4
	bsr.n	 _force_operand
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,0
	bsr.n	 _force_operand
	ld.bu	 r25,r23,2
	or	 r3,r0,r22
@L7975:
	or	 r4,r0,r24
	or	 r6,r0,r17
	or	 r7,r0,0
	or	 r8,r0,3
	or	 r5,r0,r2
	or	 r2,r0,r25
@L7974:
	bsr	 _expand_binop
	br.n	 @L6872
	or	 r18,r0,r2
	align	 4
@L6886:
	or	 r18,r0,r23
@L6872:
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L7976
	ld.hu	 r13,r0,r18
	cmp	 r13,r13,51
	bb1.n	 eq,r13,@L7976
	or	 r2,r0,4
	or	 r3,r0,r18
	bsr.n	 _force_reg
	addu	 r1,r1,@L8675
@L8676:
	align	 4
@L6891:
	bsr	 _abort
	align	 4
@L6892:
	ld	 r13,r20,4
	ld	 r13,r13,4
	ld	 r2,r20,16
	or	 r3,r0,0
	ld.bu	 r13,r13,24
	or	 r4,r0,0
	or	 r5,r0,0
	bsr.n	 _expand_expr
	st	 r13,r31,372
	or	 r18,r0,r2
	or	 r3,r0,0
	or	 r4,r0,0
	ld	 r2,r20,20
	bsr.n	 _expand_expr
	or	 r5,r0,0
	bcnd.n	 ne0,r17,@L6893
	or	 r16,r0,r2
	ld	 r13,r20,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,24
	or	 r17,r0,r2
@L6893:
	bsr	 _get_last_insn
	ld.hu	 r13,r0,r17
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L6894
	or	 r14,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r17
	bsr	 _emit_insn
@L6894:
	ld	 r2,r31,372
	bsr.n	 _gen_realpart
	or	 r3,r0,r17
	or	 r22,r0,r2
	ld.hu	 r11,r0,r22
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r21,r22,2
	or	 r13,r13,lo16(_mode_class)
	cmp	 r12,r11,59
	ld	 r20,r13[r21]
	bb0.n	 ne,r12,@L6897
	or	 r24,r0,r18
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L6900
	cmp	 r13,r11,63
	ld	 r2,r22,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L6901
	st	 r2,r22,4
	align	 4
@L6900:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L6901
	ld	 r2,r22,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r22,4
	ld	 r2,r22,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r22,8
@L6901:
	br.n	 @L6896
	or	 r2,r0,r22
	align	 4
@L6897:
	ld	 r13,r22,8
	bcnd	 ne0,r13,@L6903
	ld	 r2,r22,4
	br	 @L6896
	align	 4
@L6903:
	ld	 r2,r22,12
	bcnd	 ne0,r2,@L6896
	ld	 r13,r22,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r22,4
	bsr.n	 _gen_move_insn
	st	 r2,r22,12
	bsr.n	 _emit_insn_before
	ld	 r3,r22,8
	ld	 r2,r22,12
@L6896:
	ld.hu	 r12,r0,r24
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L6906
	or	 r22,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L8265
	cmp	 r13,r12,63
	ld.bu	 r13,r24,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L6907
	ld	 r23,r24,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L6907
	ld	 r13,r23,4
	st	 r13,r24,4
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L6910
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r24,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r24
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	br.n	 @L6905
	or	 r2,r0,r25
	align	 4
@L6907:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L6909
	cmp	 r13,r12,63
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L6910
	st	 r2,r24,4
	align	 4
@L6909:
@L8265:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L6910
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,4
	ld	 r2,r24,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,8
@L6910:
	br.n	 @L6905
	or	 r2,r0,r24
	align	 4
@L6906:
	ld	 r13,r24,8
	bcnd	 ne0,r13,@L6912
	ld	 r2,r24,4
	br.n	 @L8266
	cmp	 r13,r21,16
	align	 4
@L6912:
	ld	 r2,r24,12
	bcnd.n	 ne0,r2,@L8266
	cmp	 r13,r21,16
	ld	 r13,r24,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r24,4
	bsr.n	 _gen_move_insn
	st	 r2,r24,12
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	ld	 r2,r24,12
@L6905:
	cmp	 r13,r21,16
@L8266:
	bb0.n	 ne,r13,@L6915
	or	 r24,r0,r2
	ld.bu	 r13,r24,2
	cmp	 r13,r13,r21
	bb0	 ne,r13,@L6914
	ld.bu	 r13,r24,2
	bcnd	 eq0,r13,@L6914
@L6915:
	bsr	 _abort
	align	 4
@L6914:
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6917
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6917
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L6916
@L6917:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,47
	bb1	 ne,r13,@L6916
	ld.bu	 r13,r24,2
	bcnd.n	 eq0,r13,@L6916
	or	 r2,r0,r21
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
@L6916:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,55
	bb1	 ne,r13,@L6918
	ld.bu	 r2,r22,2
	bsr.n	 _memory_address_p
	ld	 r3,r22,4
	bcnd.n	 ne0,r2,@L8267
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld.bu	 r3,r22,2
	bsr.n	 _push_operand
	or	 r2,r0,r22
	bcnd.n	 eq0,r2,@L6919
	or.u	 r13,r0,hi16(_flag_force_addr)
@L8267:
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L6918
	ld	 r13,r22,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6919
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6919
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L6918
@L6919:
	ld	 r4,r22,4
	or	 r2,r0,r22
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r22,r0,r2
@L6918:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8268
	cmp	 r13,r21,16
	ld.bu	 r2,r24,2
	bsr.n	 _memory_address_p
	ld	 r3,r24,4
	bcnd.n	 eq0,r2,@L6922
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L6921
	ld	 r13,r24,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6922
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6922
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L8268
	cmp	 r13,r21,16
@L6922:
	ld	 r4,r24,4
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L6921:
	cmp	 r13,r21,16
@L8268:
	bb1.n	 ne,r13,@L6923
	subu	 r13,r20,5
	bsr	 _abort
	align	 4
@L6923:
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L6924
	or.u	 r13,r0,hi16(_mode_unit_size)
	or	 r13,r13,lo16(_mode_unit_size)
	ld	 r12,r13[r21]
	or	 r3,r0,2
	cmp	 r13,r20,5
	bb1.n	 ne,r13,@L6925
	mak	 r2,r12,0<3>
	or	 r3,r0,1
@L6925:
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	st	 r2,r31,332
@L6924:
	or.u	 r23,r0,hi16(_mov_optab)
	ld	 r11,r23,lo16(_mov_optab)
	lda.d	 r13,r11[r21]
	ld	 r12,r13,4
	cmp	 r13,r12,210
	bb0.n	 ne,r13,@L6927
	or.u	 r13,r0,hi16(_insn_gen_function)
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r2,r0,r22
	ld	 r13,r13[r12]
	jsr.n	 r13
	or	 r3,r0,r24
	bsr.n	 _emit_insn
	addu	 r1,r1,@L8677
@L8678:
	align	 4
@L6927:
	subu	 r13,r20,5
	ld	 r15,r31,332
	cmp	 r13,r13,1
	extu	 r13,r13,1<ls>
	cmp	 r12,r15,16
	extu	 r12,r12,1<ne>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L6929
	mak	 r25,r15,0<3>
	addu	 r13,r11,r25
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L6929
	ld.bu	 r3,r22,2
	bsr.n	 _push_operand
	or	 r2,r0,r22
	bsr.n	 _get_last_insn
	or	 r21,r0,r2
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L6930
	or	 r19,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r22
	bsr	 _emit_insn
@L6930:
	ld	 r13,r23,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	addu	 r13,r13,r25
	ld	 r23,r13,4
	bcnd.n	 eq0,r21,@L6931
	or	 r20,r12,lo16(_insn_gen_function)
	ld	 r3,r31,332
	or	 r2,r0,r22
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8679
@L8680:
	align	 4
@L6931:
	ld	 r2,r31,332
	bsr.n	 _gen_highpart
	or	 r3,r0,r22
@L7977:
	or	 r25,r0,r2
	ld	 r2,r31,332
	bsr.n	 _gen_highpart
	or	 r3,r0,r24
	or	 r3,r0,r2
	ld	 r13,r20[r23]
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r15,r31,332
	ld	 r13,r13,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	lda.d	 r13,r13[r15]
	ld	 r23,r13,4
	bcnd.n	 eq0,r21,@L6933
	or	 r20,r12,lo16(_insn_gen_function)
	ld	 r3,r31,332
	or	 r2,r0,r22
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8681
@L8682:
	align	 4
@L6933:
	ld	 r2,r31,332
	bsr.n	 _gen_lowpart
	or	 r3,r0,r22
@L7978:
	or	 r25,r0,r2
	ld	 r2,r31,332
	bsr.n	 _gen_lowpart
	or	 r3,r0,r24
	ld	 r13,r20[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	bcnd	 eq0,r19,@L6936
	ld	 r24,r19,12
	br	 @L6937
	align	 4
@L6936:
	bsr	 _get_insns
	or	 r24,r0,r2
@L6937:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	st	 r2,r24,28
	bsr.n	 _get_last_insn
	addu	 r1,r1,@L8683
@L8684:
	align	 4
@L6929:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r23,r13,lo16(_mode_size)
	ld	 r13,r23[r21]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L6939
	bsr.n	 _get_last_insn
	or	 r25,r0,0
	or	 r20,r0,r2
	or	 r19,r0,r23
@L6940:
	ld	 r12,r19[r21]
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L6944
	addu	 r13,r12,6
@L6944:
	ext	 r13,r13,0<2>
	cmp	 r13,r25,r13
	bb0.n	 lt,r13,@L6941
	or	 r2,r0,r22
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	or	 r23,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	or	 r3,r0,r2
	bcnd.n	 ne0,r3,@L8269
	cmp	 r13,r23,0
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6946
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6946
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L6945
	or	 r2,r0,r24
@L6946:
	or	 r2,r0,r21
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r3,r0,r25
	or	 r4,r0,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	addu	 r1,r1,@L8685
@L8686:
	align	 4
@L6945:
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r21
@L7979:
	or	 r3,r0,r2
	cmp	 r13,r23,0
@L8269:
	cmp	 r12,r3,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L6949
	or	 r2,r0,r23
	bsr	 _abort
	align	 4
@L6949:
	addu	 r25,r25,1
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L8687
@L8688:
	align	 4
@L6941:
	bcnd	 eq0,r20,@L6951
	ld	 r24,r20,12
	br	 @L6952
	align	 4
@L6951:
	bsr	 _get_insns
	or	 r24,r0,r2
@L6952:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	br.n	 @L6895
	st	 r2,r24,28
	align	 4
@L6939:
	bsr	 _abort
	align	 4
@L6895:
	ld	 r2,r31,372
	bsr.n	 _gen_imagpart
	or	 r3,r0,r17
	or	 r22,r0,r2
	ld.hu	 r11,r0,r22
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r21,r22,2
	or	 r13,r13,lo16(_mode_class)
	cmp	 r12,r11,59
	ld	 r20,r13[r21]
	bb0.n	 ne,r12,@L6956
	or	 r24,r0,r16
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L6959
	cmp	 r13,r11,63
	ld	 r2,r22,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L6960
	st	 r2,r22,4
	align	 4
@L6959:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L6960
	ld	 r2,r22,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r22,4
	ld	 r2,r22,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r22,8
@L6960:
	br.n	 @L6955
	or	 r2,r0,r22
	align	 4
@L6956:
	ld	 r13,r22,8
	bcnd	 ne0,r13,@L6962
	ld	 r2,r22,4
	br	 @L6955
	align	 4
@L6962:
	ld	 r2,r22,12
	bcnd	 ne0,r2,@L6955
	ld	 r13,r22,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r22,4
	bsr.n	 _gen_move_insn
	st	 r2,r22,12
	bsr.n	 _emit_insn_before
	ld	 r3,r22,8
	ld	 r2,r22,12
@L6955:
	ld.hu	 r12,r0,r24
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L6965
	or	 r22,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L8270
	cmp	 r13,r12,63
	ld.bu	 r13,r24,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L6966
	ld	 r23,r24,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L6966
	ld	 r13,r23,4
	st	 r13,r24,4
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L6969
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r24,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r24
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	br.n	 @L6964
	or	 r2,r0,r25
	align	 4
@L6966:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L6968
	cmp	 r13,r12,63
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L6969
	st	 r2,r24,4
	align	 4
@L6968:
@L8270:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L6969
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,4
	ld	 r2,r24,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,8
@L6969:
	br.n	 @L6964
	or	 r2,r0,r24
	align	 4
@L6965:
	ld	 r13,r24,8
	bcnd	 ne0,r13,@L6971
	ld	 r2,r24,4
	br.n	 @L8271
	cmp	 r13,r21,16
	align	 4
@L6971:
	ld	 r2,r24,12
	bcnd.n	 ne0,r2,@L8271
	cmp	 r13,r21,16
	ld	 r13,r24,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r24,4
	bsr.n	 _gen_move_insn
	st	 r2,r24,12
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	ld	 r2,r24,12
@L6964:
	cmp	 r13,r21,16
@L8271:
	bb0.n	 ne,r13,@L6974
	or	 r24,r0,r2
	ld.bu	 r13,r24,2
	cmp	 r13,r13,r21
	bb0	 ne,r13,@L6973
	ld.bu	 r13,r24,2
	bcnd	 eq0,r13,@L6973
@L6974:
	bsr	 _abort
	align	 4
@L6973:
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6976
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6976
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L6975
@L6976:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,47
	bb1	 ne,r13,@L6975
	ld.bu	 r13,r24,2
	bcnd.n	 eq0,r13,@L6975
	or	 r2,r0,r21
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
@L6975:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,55
	bb1	 ne,r13,@L6977
	ld.bu	 r2,r22,2
	bsr.n	 _memory_address_p
	ld	 r3,r22,4
	bcnd.n	 ne0,r2,@L8272
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld.bu	 r3,r22,2
	bsr.n	 _push_operand
	or	 r2,r0,r22
	bcnd.n	 eq0,r2,@L6978
	or.u	 r13,r0,hi16(_flag_force_addr)
@L8272:
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L6977
	ld	 r13,r22,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6978
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6978
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L6977
@L6978:
	ld	 r4,r22,4
	or	 r2,r0,r22
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r22,r0,r2
@L6977:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8273
	cmp	 r13,r21,16
	ld.bu	 r2,r24,2
	bsr.n	 _memory_address_p
	ld	 r3,r24,4
	bcnd.n	 eq0,r2,@L6981
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L6980
	ld	 r13,r24,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6981
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L6981
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L8273
	cmp	 r13,r21,16
@L6981:
	ld	 r4,r24,4
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L6980:
	cmp	 r13,r21,16
@L8273:
	bb1.n	 ne,r13,@L6982
	subu	 r13,r20,5
	bsr	 _abort
	align	 4
@L6982:
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L6983
	or.u	 r13,r0,hi16(_mode_unit_size)
	or	 r13,r13,lo16(_mode_unit_size)
	ld	 r12,r13[r21]
	or	 r3,r0,2
	cmp	 r13,r20,5
	bb1.n	 ne,r13,@L6984
	mak	 r2,r12,0<3>
	or	 r3,r0,1
@L6984:
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	st	 r2,r31,340
@L6983:
	or.u	 r23,r0,hi16(_mov_optab)
	ld	 r11,r23,lo16(_mov_optab)
	lda.d	 r13,r11[r21]
	ld	 r12,r13,4
	cmp	 r13,r12,210
	bb0.n	 ne,r13,@L6986
	or.u	 r13,r0,hi16(_insn_gen_function)
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r2,r0,r22
	ld	 r13,r13[r12]
	jsr.n	 r13
	or	 r3,r0,r24
	bsr.n	 _emit_insn
	addu	 r1,r1,@L8689
@L8690:
	align	 4
@L6986:
	subu	 r13,r20,5
	ld	 r15,r31,340
	cmp	 r13,r13,1
	extu	 r13,r13,1<ls>
	cmp	 r12,r15,16
	extu	 r12,r12,1<ne>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L6988
	mak	 r25,r15,0<3>
	addu	 r13,r11,r25
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L6988
	ld.bu	 r3,r22,2
	bsr.n	 _push_operand
	or	 r2,r0,r22
	bsr.n	 _get_last_insn
	or	 r21,r0,r2
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L6989
	or	 r19,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r22
	bsr	 _emit_insn
@L6989:
	ld	 r13,r23,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	addu	 r13,r13,r25
	ld	 r23,r13,4
	bcnd.n	 eq0,r21,@L6990
	or	 r20,r12,lo16(_insn_gen_function)
	ld	 r3,r31,340
	or	 r2,r0,r22
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8691
@L8692:
	align	 4
@L6990:
	ld	 r2,r31,340
	bsr.n	 _gen_highpart
	or	 r3,r0,r22
@L7980:
	or	 r25,r0,r2
	ld	 r2,r31,340
	bsr.n	 _gen_highpart
	or	 r3,r0,r24
	or	 r3,r0,r2
	ld	 r13,r20[r23]
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r15,r31,340
	ld	 r13,r13,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	lda.d	 r13,r13[r15]
	ld	 r23,r13,4
	bcnd.n	 eq0,r21,@L6992
	or	 r20,r12,lo16(_insn_gen_function)
	ld	 r3,r31,340
	or	 r2,r0,r22
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8693
@L8694:
	align	 4
@L6992:
	ld	 r2,r31,340
	bsr.n	 _gen_lowpart
	or	 r3,r0,r22
@L7981:
	or	 r25,r0,r2
	ld	 r2,r31,340
	bsr.n	 _gen_lowpart
	or	 r3,r0,r24
	ld	 r13,r20[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	bcnd	 eq0,r19,@L6995
	ld	 r24,r19,12
	br	 @L6996
	align	 4
@L6995:
	bsr	 _get_insns
	or	 r24,r0,r2
@L6996:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	st	 r2,r24,28
	bsr.n	 _get_last_insn
	addu	 r1,r1,@L8695
@L8696:
	align	 4
@L6988:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r23,r13,lo16(_mode_size)
	ld	 r13,r23[r21]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L6998
	bsr.n	 _get_last_insn
	or	 r25,r0,0
	or	 r20,r0,r2
	or	 r19,r0,r23
@L6999:
	ld	 r12,r19[r21]
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L7003
	addu	 r13,r12,6
@L7003:
	ext	 r13,r13,0<2>
	cmp	 r13,r25,r13
	bb0.n	 lt,r13,@L7000
	or	 r2,r0,r22
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	or	 r23,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	or	 r3,r0,r2
	bcnd.n	 ne0,r3,@L8274
	cmp	 r13,r23,0
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L7005
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L7005
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L7004
	or	 r2,r0,r24
@L7005:
	or	 r2,r0,r21
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r3,r0,r25
	or	 r4,r0,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	addu	 r1,r1,@L8697
@L8698:
	align	 4
@L7004:
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r21
@L7982:
	or	 r3,r0,r2
	cmp	 r13,r23,0
@L8274:
	cmp	 r12,r3,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L7008
	or	 r2,r0,r23
	bsr	 _abort
	align	 4
@L7008:
	addu	 r25,r25,1
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L8699
@L8700:
	align	 4
@L7000:
	bcnd	 eq0,r20,@L7010
	ld	 r24,r20,12
	br	 @L7011
	align	 4
@L7010:
	bsr	 _get_insns
	or	 r24,r0,r2
@L7011:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	br.n	 @L6954
	st	 r2,r24,28
	align	 4
@L6998:
	bsr	 _abort
	align	 4
@L6954:
	bcnd	 eq0,r14,@L7141
	br	 @L8002
	align	 4
@L7016:
	ld	 r2,r20,16
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r18,r0,r2
	or	 r2,r0,r14
	or	 r3,r0,r18
	bsr.n	 _gen_realpart
	addu	 r1,r1,@L8701
@L8702:
	align	 4
@L7017:
	ld	 r2,r20,16
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r18,r0,r2
	or	 r2,r0,r14
	or	 r3,r0,r18
	bsr.n	 _gen_imagpart
	addu	 r1,r1,@L8703
@L8704:
	align	 4
@L7018:
	ld	 r13,r20,4
	or	 r3,r0,0
	ld	 r13,r13,4
	or	 r4,r0,0
	ld	 r2,r20,16
	or	 r5,r0,0
	bsr.n	 _expand_expr
	ld.bu	 r16,r13,24
	bcnd.n	 ne0,r17,@L7019
	or	 r18,r0,r2
	ld	 r13,r20,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,24
	or	 r17,r0,r2
@L7019:
	bsr	 _get_last_insn
	ld.hu	 r13,r0,r17
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L7020
	or	 r14,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r17
	bsr	 _emit_insn
@L7020:
	or	 r2,r0,r16
	bsr.n	 _gen_realpart
	or	 r3,r0,r17
	or	 r25,r0,r2
	or	 r2,r0,r16
	bsr.n	 _gen_realpart
	or	 r3,r0,r18
	or	 r22,r0,r25
	ld.hu	 r11,r0,r22
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r21,r22,2
	or	 r13,r13,lo16(_mode_class)
	cmp	 r12,r11,59
	ld	 r20,r13[r21]
	bb0.n	 ne,r12,@L7023
	or	 r24,r0,r2
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L7026
	cmp	 r13,r11,63
	ld	 r2,r22,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L7027
	st	 r2,r22,4
	align	 4
@L7026:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L7027
	ld	 r2,r22,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r22,4
	ld	 r2,r22,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r22,8
@L7027:
	br.n	 @L7022
	or	 r2,r0,r22
	align	 4
@L7023:
	ld	 r13,r22,8
	bcnd	 ne0,r13,@L7029
	ld	 r2,r22,4
	br	 @L7022
	align	 4
@L7029:
	ld	 r2,r22,12
	bcnd	 ne0,r2,@L7022
	ld	 r13,r22,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r22,4
	bsr.n	 _gen_move_insn
	st	 r2,r22,12
	bsr.n	 _emit_insn_before
	ld	 r3,r22,8
	ld	 r2,r22,12
@L7022:
	ld.hu	 r12,r0,r24
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L7032
	or	 r22,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L8275
	cmp	 r13,r12,63
	ld.bu	 r13,r24,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L7033
	ld	 r23,r24,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L7033
	ld	 r13,r23,4
	st	 r13,r24,4
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L7036
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r24,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r24
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	br.n	 @L7031
	or	 r2,r0,r25
	align	 4
@L7033:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L7035
	cmp	 r13,r12,63
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L7036
	st	 r2,r24,4
	align	 4
@L7035:
@L8275:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L7036
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,4
	ld	 r2,r24,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,8
@L7036:
	br.n	 @L7031
	or	 r2,r0,r24
	align	 4
@L7032:
	ld	 r13,r24,8
	bcnd	 ne0,r13,@L7038
	ld	 r2,r24,4
	br.n	 @L8276
	cmp	 r13,r21,16
	align	 4
@L7038:
	ld	 r2,r24,12
	bcnd.n	 ne0,r2,@L8276
	cmp	 r13,r21,16
	ld	 r13,r24,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r24,4
	bsr.n	 _gen_move_insn
	st	 r2,r24,12
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	ld	 r2,r24,12
@L7031:
	cmp	 r13,r21,16
@L8276:
	bb0.n	 ne,r13,@L7041
	or	 r24,r0,r2
	ld.bu	 r13,r24,2
	cmp	 r13,r13,r21
	bb0	 ne,r13,@L7040
	ld.bu	 r13,r24,2
	bcnd	 eq0,r13,@L7040
@L7041:
	bsr	 _abort
	align	 4
@L7040:
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L7043
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L7043
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L7042
@L7043:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,47
	bb1	 ne,r13,@L7042
	ld.bu	 r13,r24,2
	bcnd.n	 eq0,r13,@L7042
	or	 r2,r0,r21
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
@L7042:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,55
	bb1	 ne,r13,@L7044
	ld.bu	 r2,r22,2
	bsr.n	 _memory_address_p
	ld	 r3,r22,4
	bcnd.n	 ne0,r2,@L8277
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld.bu	 r3,r22,2
	bsr.n	 _push_operand
	or	 r2,r0,r22
	bcnd.n	 eq0,r2,@L7045
	or.u	 r13,r0,hi16(_flag_force_addr)
@L8277:
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L7044
	ld	 r13,r22,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L7045
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L7045
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L7044
@L7045:
	ld	 r4,r22,4
	or	 r2,r0,r22
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r22,r0,r2
@L7044:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8278
	cmp	 r13,r21,16
	ld.bu	 r2,r24,2
	bsr.n	 _memory_address_p
	ld	 r3,r24,4
	bcnd.n	 eq0,r2,@L7048
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L7047
	ld	 r13,r24,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L7048
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L7048
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L8278
	cmp	 r13,r21,16
@L7048:
	ld	 r4,r24,4
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L7047:
	cmp	 r13,r21,16
@L8278:
	bb1.n	 ne,r13,@L7049
	subu	 r13,r20,5
	bsr	 _abort
	align	 4
@L7049:
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L7050
	or.u	 r13,r0,hi16(_mode_unit_size)
	or	 r13,r13,lo16(_mode_unit_size)
	ld	 r12,r13[r21]
	or	 r3,r0,2
	cmp	 r13,r20,5
	bb1.n	 ne,r13,@L7051
	mak	 r2,r12,0<3>
	or	 r3,r0,1
@L7051:
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	st	 r2,r31,348
@L7050:
	or.u	 r23,r0,hi16(_mov_optab)
	ld	 r11,r23,lo16(_mov_optab)
	lda.d	 r13,r11[r21]
	ld	 r12,r13,4
	cmp	 r13,r12,210
	bb0.n	 ne,r13,@L7053
	or.u	 r13,r0,hi16(_insn_gen_function)
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r2,r0,r22
	ld	 r13,r13[r12]
	jsr.n	 r13
	or	 r3,r0,r24
	bsr.n	 _emit_insn
	addu	 r1,r1,@L8705
@L8706:
	align	 4
@L7053:
	subu	 r13,r20,5
	ld	 r15,r31,348
	cmp	 r13,r13,1
	extu	 r13,r13,1<ls>
	cmp	 r12,r15,16
	extu	 r12,r12,1<ne>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L7055
	mak	 r25,r15,0<3>
	addu	 r13,r11,r25
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L7055
	ld.bu	 r3,r22,2
	bsr.n	 _push_operand
	or	 r2,r0,r22
	bsr.n	 _get_last_insn
	or	 r21,r0,r2
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L7056
	or	 r19,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r22
	bsr	 _emit_insn
@L7056:
	ld	 r13,r23,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	addu	 r13,r13,r25
	ld	 r23,r13,4
	bcnd.n	 eq0,r21,@L7057
	or	 r20,r12,lo16(_insn_gen_function)
	ld	 r3,r31,348
	or	 r2,r0,r22
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8707
@L8708:
	align	 4
@L7057:
	ld	 r2,r31,348
	bsr.n	 _gen_highpart
	or	 r3,r0,r22
@L7983:
	or	 r25,r0,r2
	ld	 r2,r31,348
	bsr.n	 _gen_highpart
	or	 r3,r0,r24
	or	 r3,r0,r2
	ld	 r13,r20[r23]
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r15,r31,348
	ld	 r13,r13,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	lda.d	 r13,r13[r15]
	ld	 r23,r13,4
	bcnd.n	 eq0,r21,@L7059
	or	 r20,r12,lo16(_insn_gen_function)
	ld	 r3,r31,348
	or	 r2,r0,r22
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8709
@L8710:
	align	 4
@L7059:
	ld	 r2,r31,348
	bsr.n	 _gen_lowpart
	or	 r3,r0,r22
@L7984:
	or	 r25,r0,r2
	ld	 r2,r31,348
	bsr.n	 _gen_lowpart
	or	 r3,r0,r24
	ld	 r13,r20[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	bcnd	 eq0,r19,@L7062
	ld	 r24,r19,12
	br	 @L7063
	align	 4
@L7062:
	bsr	 _get_insns
	or	 r24,r0,r2
@L7063:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	st	 r2,r24,28
	bsr.n	 _get_last_insn
	addu	 r1,r1,@L8711
@L8712:
	align	 4
@L7055:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r23,r13,lo16(_mode_size)
	ld	 r13,r23[r21]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L7065
	bsr.n	 _get_last_insn
	or	 r25,r0,0
	or	 r20,r0,r2
	or	 r19,r0,r23
@L7066:
	ld	 r12,r19[r21]
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L7070
	addu	 r13,r12,6
@L7070:
	ext	 r13,r13,0<2>
	cmp	 r13,r25,r13
	bb0.n	 lt,r13,@L7067
	or	 r2,r0,r22
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	or	 r23,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	or	 r3,r0,r2
	bcnd.n	 ne0,r3,@L8279
	cmp	 r13,r23,0
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L7072
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L7072
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L7071
	or	 r2,r0,r24
@L7072:
	or	 r2,r0,r21
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r3,r0,r25
	or	 r4,r0,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	addu	 r1,r1,@L8713
@L8714:
	align	 4
@L7071:
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r21
@L7985:
	or	 r3,r0,r2
	cmp	 r13,r23,0
@L8279:
	cmp	 r12,r3,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L7075
	or	 r2,r0,r23
	bsr	 _abort
	align	 4
@L7075:
	addu	 r25,r25,1
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L8715
@L8716:
	align	 4
@L7067:
	bcnd	 eq0,r20,@L7077
	ld	 r24,r20,12
	br	 @L7078
	align	 4
@L7077:
	bsr	 _get_insns
	or	 r24,r0,r2
@L7078:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	br.n	 @L7021
	st	 r2,r24,28
	align	 4
@L7065:
	bsr	 _abort
	align	 4
@L7021:
	or	 r2,r0,r16
	bsr.n	 _gen_imagpart
	or	 r3,r0,r17
	or	 r24,r0,r2
	or	 r2,r0,r16
	or.u	 r13,r0,hi16(_neg_optab)
	or	 r3,r0,r18
	bsr.n	 _gen_imagpart
	ld	 r25,r13,lo16(_neg_optab)
	or	 r4,r0,r2
	or	 r2,r0,r16
	or	 r5,r0,r24
	or	 r6,r0,0
	bsr.n	 _expand_unop
	or	 r3,r0,r25
	or	 r19,r0,r2
	cmp	 r13,r19,r24
	bb0.n	 ne,r13,@L7080
	or	 r22,r0,r24
	ld.hu	 r11,r0,r22
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r21,r22,2
	or	 r13,r13,lo16(_mode_class)
	cmp	 r12,r11,59
	ld	 r20,r13[r21]
	bb0.n	 ne,r12,@L7083
	or	 r24,r0,r19
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L7086
	cmp	 r13,r11,63
	ld	 r2,r22,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L7087
	st	 r2,r22,4
	align	 4
@L7086:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L7087
	ld	 r2,r22,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r22,4
	ld	 r2,r22,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r22,8
@L7087:
	br.n	 @L7082
	or	 r2,r0,r22
	align	 4
@L7083:
	ld	 r13,r22,8
	bcnd	 ne0,r13,@L7089
	ld	 r2,r22,4
	br	 @L7082
	align	 4
@L7089:
	ld	 r2,r22,12
	bcnd	 ne0,r2,@L7082
	ld	 r13,r22,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r22,4
	bsr.n	 _gen_move_insn
	st	 r2,r22,12
	bsr.n	 _emit_insn_before
	ld	 r3,r22,8
	ld	 r2,r22,12
@L7082:
	ld.hu	 r12,r0,r24
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L7092
	or	 r22,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L8280
	cmp	 r13,r12,63
	ld.bu	 r13,r24,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L7093
	ld	 r23,r24,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L7093
	ld	 r13,r23,4
	st	 r13,r24,4
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L7096
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r24,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r24
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	br.n	 @L7091
	or	 r2,r0,r25
	align	 4
@L7093:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L7095
	cmp	 r13,r12,63
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L7096
	st	 r2,r24,4
	align	 4
@L7095:
@L8280:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L7096
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,4
	ld	 r2,r24,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,8
@L7096:
	br.n	 @L7091
	or	 r2,r0,r24
	align	 4
@L7092:
	ld	 r13,r24,8
	bcnd	 ne0,r13,@L7098
	ld	 r2,r24,4
	br.n	 @L8281
	cmp	 r13,r21,16
	align	 4
@L7098:
	ld	 r2,r24,12
	bcnd.n	 ne0,r2,@L8281
	cmp	 r13,r21,16
	ld	 r13,r24,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r24,4
	bsr.n	 _gen_move_insn
	st	 r2,r24,12
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	ld	 r2,r24,12
@L7091:
	cmp	 r13,r21,16
@L8281:
	bb0.n	 ne,r13,@L7101
	or	 r24,r0,r2
	ld.bu	 r13,r24,2
	cmp	 r13,r13,r21
	bb0	 ne,r13,@L7100
	ld.bu	 r13,r24,2
	bcnd	 eq0,r13,@L7100
@L7101:
	bsr	 _abort
	align	 4
@L7100:
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L7103
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L7103
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L7102
@L7103:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,47
	bb1	 ne,r13,@L7102
	ld.bu	 r13,r24,2
	bcnd.n	 eq0,r13,@L7102
	or	 r2,r0,r21
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
@L7102:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,55
	bb1	 ne,r13,@L7104
	ld.bu	 r2,r22,2
	bsr.n	 _memory_address_p
	ld	 r3,r22,4
	bcnd.n	 ne0,r2,@L8282
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld.bu	 r3,r22,2
	bsr.n	 _push_operand
	or	 r2,r0,r22
	bcnd.n	 eq0,r2,@L7105
	or.u	 r13,r0,hi16(_flag_force_addr)
@L8282:
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L7104
	ld	 r13,r22,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L7105
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L7105
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L7104
@L7105:
	ld	 r4,r22,4
	or	 r2,r0,r22
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r22,r0,r2
@L7104:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8283
	cmp	 r13,r21,16
	ld.bu	 r2,r24,2
	bsr.n	 _memory_address_p
	ld	 r3,r24,4
	bcnd.n	 eq0,r2,@L7108
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L7107
	ld	 r13,r24,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L7108
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L7108
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L8283
	cmp	 r13,r21,16
@L7108:
	ld	 r4,r24,4
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L7107:
	cmp	 r13,r21,16
@L8283:
	bb1.n	 ne,r13,@L7109
	subu	 r13,r20,5
	bsr	 _abort
	align	 4
@L7109:
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L7110
	or.u	 r13,r0,hi16(_mode_unit_size)
	or	 r13,r13,lo16(_mode_unit_size)
	ld	 r12,r13[r21]
	or	 r3,r0,2
	cmp	 r13,r20,5
	bb1.n	 ne,r13,@L7111
	mak	 r2,r12,0<3>
	or	 r3,r0,1
@L7111:
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	st	 r2,r31,356
@L7110:
	or.u	 r23,r0,hi16(_mov_optab)
	ld	 r11,r23,lo16(_mov_optab)
	lda.d	 r13,r11[r21]
	ld	 r12,r13,4
	cmp	 r13,r12,210
	bb0.n	 ne,r13,@L7113
	or.u	 r13,r0,hi16(_insn_gen_function)
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r2,r0,r22
	ld	 r13,r13[r12]
	jsr.n	 r13
	or	 r3,r0,r24
	bsr.n	 _emit_insn
	addu	 r1,r1,@L8717
@L8718:
	align	 4
@L7113:
	subu	 r13,r20,5
	ld	 r15,r31,356
	cmp	 r13,r13,1
	extu	 r13,r13,1<ls>
	cmp	 r12,r15,16
	extu	 r12,r12,1<ne>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L7115
	mak	 r25,r15,0<3>
	addu	 r13,r11,r25
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L7115
	ld.bu	 r3,r22,2
	bsr.n	 _push_operand
	or	 r2,r0,r22
	bsr.n	 _get_last_insn
	or	 r21,r0,r2
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L7116
	or	 r19,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r22
	bsr	 _emit_insn
@L7116:
	ld	 r13,r23,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	addu	 r13,r13,r25
	ld	 r23,r13,4
	bcnd.n	 eq0,r21,@L7117
	or	 r20,r12,lo16(_insn_gen_function)
	ld	 r3,r31,356
	or	 r2,r0,r22
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8719
@L8720:
	align	 4
@L7117:
	ld	 r2,r31,356
	bsr.n	 _gen_highpart
	or	 r3,r0,r22
@L7986:
	or	 r25,r0,r2
	ld	 r2,r31,356
	bsr.n	 _gen_highpart
	or	 r3,r0,r24
	or	 r3,r0,r2
	ld	 r13,r20[r23]
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r15,r31,356
	ld	 r13,r13,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	lda.d	 r13,r13[r15]
	ld	 r23,r13,4
	bcnd.n	 eq0,r21,@L7119
	or	 r20,r12,lo16(_insn_gen_function)
	ld	 r3,r31,356
	or	 r2,r0,r22
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L8721
@L8722:
	align	 4
@L7119:
	ld	 r2,r31,356
	bsr.n	 _gen_lowpart
	or	 r3,r0,r22
@L7987:
	or	 r25,r0,r2
	ld	 r2,r31,356
	bsr.n	 _gen_lowpart
	or	 r3,r0,r24
	ld	 r13,r20[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	bcnd	 eq0,r19,@L7122
	ld	 r24,r19,12
	br	 @L7123
	align	 4
@L7122:
	bsr	 _get_insns
	or	 r24,r0,r2
@L7123:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	st	 r2,r24,28
	bsr.n	 _get_last_insn
	addu	 r1,r1,@L8723
@L8724:
	align	 4
@L7115:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r23,r13,lo16(_mode_size)
	ld	 r13,r23[r21]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L7125
	bsr.n	 _get_last_insn
	or	 r25,r0,0
	or	 r20,r0,r2
	or	 r19,r0,r23
@L7126:
	ld	 r12,r19[r21]
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L7130
	addu	 r13,r12,6
@L7130:
	ext	 r13,r13,0<2>
	cmp	 r13,r25,r13
	bb0.n	 lt,r13,@L7127
	or	 r2,r0,r22
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	or	 r23,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	or	 r3,r0,r2
	bcnd.n	 ne0,r3,@L8284
	cmp	 r13,r23,0
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L7132
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L7132
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L7131
	or	 r2,r0,r24
@L7132:
	or	 r2,r0,r21
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r3,r0,r25
	or	 r4,r0,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	addu	 r1,r1,@L8725
@L8726:
	align	 4
@L7131:
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r21
@L7988:
	or	 r3,r0,r2
	cmp	 r13,r23,0
@L8284:
	cmp	 r12,r3,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L7135
	or	 r2,r0,r23
	bsr	 _abort
	align	 4
@L7135:
	addu	 r25,r25,1
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L8727
@L8728:
	align	 4
@L7127:
	bcnd	 eq0,r20,@L7137
	ld	 r24,r20,12
	br	 @L7138
	align	 4
@L7137:
	bsr	 _get_insns
	or	 r24,r0,r2
@L7138:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	br.n	 @L7080
	st	 r2,r24,28
	align	 4
@L7125:
	bsr	 _abort
	align	 4
@L7080:
	bcnd	 eq0,r14,@L7141
@L8002:
	ld	 r24,r14,12
	br	 @L7142
	align	 4
@L7141:
	bsr	 _get_insns
	or	 r24,r0,r2
@L7142:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	br.n	 @L8004
	st	 r2,r24,28
	align	 4
@L7143:
	or.u	 r13,r0,hi16(_const0_rtx)
@L8013:
	ld	 r2,r13,lo16(_const0_rtx)
	br	 @L7200
	align	 4
@L7144:
	ld	 r4,r31,164
	or	 r2,r0,r20
	or.u	 r13,r0,hi16(_lang_expand_expr)
	or	 r3,r0,r17
	ld	 r13,r13,lo16(_lang_expand_expr)
	or	 r5,r0,r19
	jsr.n	 r13
	addu	 r1,r1,@L8729
@L8730:
	align	 4
@L5371:
	or	 r2,r0,r20
@L8123:
	or	 r23,r0,r16
@L8124:
	bsr.n	 _preexpand_calls
	or	 r21,r0,0
	ld	 r22,r20,20
	bcnd	 eq0,r16,@L7194
	ld.hu	 r13,r0,r16
	cmp	 r13,r13,53
	bb1	 ne,r13,@L7149
	ld	 r23,r16,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,51
	bb1	 ne,r13,@L7149
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L7147
	or	 r3,r0,0
@L7149:
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L8285
	or.u	 r13,r0,hi16(_tree_code_type)
	or.u	 r13,r0,hi16(_virtual_outgoing_args_rtx)
	ld	 r12,r23,4
	ld	 r11,r13,lo16(_virtual_outgoing_args_rtx)
	cmp	 r13,r12,r11
	bb0	 ne,r13,@L7194
	ld.hu	 r13,r0,r12
	cmp	 r13,r13,63
	bb1.n	 ne,r13,@L8285
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r13,r12,4
	cmp	 r13,r13,r11
	bb0.n	 ne,r13,@L7194
	or.u	 r13,r0,hi16(_tree_code_type)
@L8285:
	ld.bu	 r12,r22,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r13,r0,r13
	subu	 r11,r13,49
	or.u	 r13,r0,hi16(@L7192)
	cmp	 r12,r11,71
	bb0.n	 ls,r12,@L7153
	or	 r13,r13,lo16(@L7192)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L7192:
	word	 @L7162
	word	 @L7164
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7164
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7194
	word	 @L7154
	word	 @L7167
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7167
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7153
	word	 @L7156
	align	 4
@L7154:
	ld	 r21,r22,64
	br	 @L7153
	align	 4
@L7156:
	ld.bu	 r13,r22,8
	cmp	 r13,r13,3
	bb1.n	 ne,r13,@L7147
	or	 r3,r0,0
	ld	 r3,r22,16
	bcnd.n	 eq0,r3,@L7159
	or	 r25,r0,0
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L7147
	or	 r3,r0,r25
@L7159:
	ld	 r3,r0,r22
	bcnd	 eq0,r3,@L7198
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd	 eq0,r2,@L8286
	or	 r25,r0,1
	br	 @L8286
	align	 4
@L7162:
	ld	 r3,r22,16
	br	 @L7991
	align	 4
@L7164:
	ld	 r3,r22,16
	or	 r2,r0,r23
	bsr.n	 _safe_from_p
	or	 r25,r0,0
	bcnd	 eq0,r2,@L7197
	ld	 r3,r22,20
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	cmp	 r2,r2,0
	br.n	 @L7197
	extu	 r25,r2,1<ne>
	align	 4
@L7167:
	ld.bu	 r13,r22,8
	subu	 r11,r13,39
	or.u	 r13,r0,hi16(@L7183)
	cmp	 r12,r11,67
	bb0.n	 ls,r12,@L7168
	or	 r13,r13,lo16(@L7183)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L7183:
	word	 @L7170
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7181
	word	 @L7172
	word	 @L7182
	word	 @L7179
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7168
	word	 @L7180
	word	 @L7177
	word	 @L7169
	align	 4
@L7169:
	bsr.n	 _staticp
	ld	 r2,r22,16
	br.n	 @L7147
	or	 r3,r0,r2
	align	 4
@L7170:
	ld.hu	 r13,r0,r23
	br.n	 @L7992
	cmp	 r13,r13,55
	align	 4
@L7172:
	ld	 r21,r22,24
	bcnd	 ne0,r21,@L7218
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,51
	bb1.n	 ne,r13,@L7992
	cmp	 r13,r12,55
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L7993
	cmp	 r13,r12,55
@L7992:
	bb1.n	 ne,r13,@L7168
	or	 r3,r0,0
	br	 @L7147
	align	 4
@L7177:
	ld	 r21,r22,20
	bcnd	 ne0,r21,@L7218
@L7993:
	br.n	 @L7147
	or	 r3,r0,0
	align	 4
@L7179:
	ld	 r21,r22,20
	br	 @L7168
	align	 4
@L7180:
	ld	 r21,r22,24
	br	 @L7168
	align	 4
@L7181:
	ld	 r3,r22,20
@L7991:
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	br.n	 @L7147
	or	 r3,r0,r2
	align	 4
@L7182:
	bsr	 _abort
	align	 4
@L7168:
	bcnd.n	 ne0,r21,@L7218
	or.u	 r13,r0,hi16(_tree_code_length)
	ld.bu	 r12,r22,8
	ld	 r13,r13,lo16(_tree_code_length)
	ld	 r19,r13[r12]
	cmp	 r13,r21,r19
	bb0.n	 lt,r13,@L7153
	or	 r24,r0,0
	mask	 r12,r19,3
	bcnd.n	 eq0,r12,@L7189
	or	 r25,r0,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L7242
	cmp	 r13,r12,2
	bb0	 gt,r13,@L7243
	ld	 r3,r22,16
	bcnd	 eq0,r3,@L7245
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L7147
	or	 r3,r0,0
@L7245:
	addu	 r25,r22,4
	or	 r24,r0,1
@L7243:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7248
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L7147
	or	 r3,r0,0
@L7248:
	addu	 r25,r25,4
	addu	 r24,r24,1
@L7242:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7251
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L7147
	or	 r3,r0,0
@L7251:
	addu	 r24,r24,1
	cmp	 r13,r24,r19
	bb0.n	 lt,r13,@L7153
	addu	 r25,r25,4
@L7189:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L7254
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L7147
	or	 r3,r0,0
@L7254:
	ld	 r3,r25,20
	bcnd	 eq0,r3,@L7257
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L7147
	or	 r3,r0,0
@L7257:
	ld	 r3,r25,24
	bcnd	 eq0,r3,@L7260
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L7147
	or	 r3,r0,0
@L7260:
	ld	 r3,r25,28
	bcnd	 eq0,r3,@L7263
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L7147
	or	 r3,r0,0
@L7263:
	addu	 r24,r24,4
	cmp	 r13,r24,r19
	bb1.n	 lt,r13,@L7189
	addu	 r25,r25,16
@L7153:
	bcnd.n	 eq0,r21,@L7147
	or	 r3,r0,1
@L7218:
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L8287
	or	 r2,r0,r23
	ld	 r21,r21,4
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L8288
	or	 r3,r0,r21
	ld	 r13,r21,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L7147
	or	 r3,r0,0
@L8287:
	or	 r3,r0,r21
@L8288:
	bsr.n	 _rtx_equal_p
	or	 r25,r0,0
	bcnd.n	 ne0,r2,@L7147
	or	 r3,r0,r25
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1	 ne,r13,@L7198
	ld.hu	 r13,r0,r21
	cmp	 r13,r13,55
	bb1	 ne,r13,@L7198
	ld	 r13,r22,8
	bb0	 (31-13),r13,@L7147
@L7198:
	or	 r25,r0,1
@L7197:
@L8286:
	br.n	 @L7147
	or	 r3,r0,r25
	align	 4
@L7194:
	or	 r3,r0,1
@L7147:
	ld	 r2,r20,16
	cmp	 r3,r3,0
	or	 r4,r0,0
	ext	 r3,r3,1<ne>
	or	 r5,r0,0
	bsr.n	 _expand_expr
	and	 r3,r16,r3
	or	 r18,r0,r2
	ld	 r2,r20,20
@L7888:
	or	 r3,r0,0
@L8139:
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r16,r0,r2
	ld	 r7,r31,120
	ld	 r3,r31,372
	or	 r2,r0,r14
	or	 r4,r0,r18
	or	 r5,r0,r16
	or	 r6,r0,r17
	bsr.n	 _expand_binop
	or	 r8,r0,3
	or	 r19,r0,r2
	bcnd.n	 ne0,r19,@L7200
	or	 r2,r0,r19
	bsr	 _abort
	align	 4
@L7221:
	ld	 r2,r12,16
@L7828:
	or	 r3,r0,r17
	ld	 r4,r31,164
@L7854:
	or	 r5,r0,r19
	bsr.n	 _expand_expr
	addu	 r1,r1,@L8731
@L8732:
	align	 4
@L7199:
	or	 r2,r0,r19
@L7200:
@Lte30:
	ld	 r1,r31,96
	ld.d	 r24,r31,88
	ld.d	 r22,r31,80
	ld.d	 r20,r31,72
	ld.d	 r18,r31,64
	ld.d	 r16,r31,56
	ld.d	 r14,r31,48
	jmp.n	 r1
	addu	 r31,r31,384
	def	 @L8731,@L7200-@L8732
	def	 @L8729,@L7200-@L8730
	def	 @L8727,@L8728-@L7126
	def	 @L8725,@L7988-@L8726
	def	 @L8723,@L7080-@L8724
	def	 @L8721,@L7987-@L8722
	def	 @L8719,@L7986-@L8720
	def	 @L8717,@L7080-@L8718
	def	 @L8715,@L8716-@L7066
	def	 @L8713,@L7985-@L8714
	def	 @L8711,@L7021-@L8712
	def	 @L8709,@L7984-@L8710
	def	 @L8707,@L7983-@L8708
	def	 @L8705,@L7021-@L8706
	def	 @L8703,@L7200-@L8704
	def	 @L8701,@L7200-@L8702
	def	 @L8699,@L8700-@L6999
	def	 @L8697,@L7982-@L8698
	def	 @L8695,@L6954-@L8696
	def	 @L8693,@L7981-@L8694
	def	 @L8691,@L7980-@L8692
	def	 @L8689,@L6954-@L8690
	def	 @L8687,@L8688-@L6940
	def	 @L8685,@L7979-@L8686
	def	 @L8683,@L6895-@L8684
	def	 @L8681,@L7978-@L8682
	def	 @L8679,@L7977-@L8680
	def	 @L8677,@L6895-@L8678
	def	 @L8675,@L7200-@L8676
	def	 @L8673,@L7200-@L8674
	def	 @L8671,@L7200-@L8672
	def	 @L8669,@L7972-@L8670
	def	 @L8667,@L6839-@L8668
	def	 @L8665,@L7970-@L8666
	def	 @L8663,@L7143-@L8664
	def	 @L8661,@L7969-@L8662
	def	 @L8659,@L6793-@L8660
	def	 @L8657,@L7968-@L8658
	def	 @L8655,@L6770-@L8656
	def	 @L8653,@L7967-@L8654
	def	 @L8651,@L7965-@L8652
	def	 @L8649,@L7200-@L8650
	def	 @L8647,@L6603-@L8648
	def	 @L8645,@L6715-@L8646
	def	 @L8643,@L6603-@L8644
	def	 @L8641,@L6660-@L8642
	def	 @L8639,@L6660-@L8640
	def	 @L8637,@L6605-@L8638
	def	 @L8635,@L6605-@L8636
	def	 @L8633,@L7955-@L8634
	def	 @L8631,@L6600-@L8632
	def	 @L8629,@L6596-@L8630
	def	 @L8627,@L6591-@L8628
	def	 @L8625,@L6539-@L8626
	def	 @L8623,@L6539-@L8624
	def	 @L8621,@L7200-@L8622
	def	 @L8619,@L7945-@L8620
	def	 @L8617,@L6401-@L8618
	def	 @L8615,@L6401-@L8616
	def	 @L8613,@L8614-@L8004
	def	 @L8611,@L8612-@L8004
	def	 @L8609,@L7940-@L8610
	def	 @L8607,@L7940-@L8608
	def	 @L8605,@L7940-@L8606
	def	 @L8603,@L7940-@L8604
	def	 @L8601,@L7940-@L8602
	def	 @L8599,@L7940-@L8600
	def	 @L8597,@L8598-@L8004
	def	 @L8595,@L7937-@L8596
	def	 @L8593,@L8594-@L8004
	def	 @L8591,@L7937-@L8592
	def	 @L8589,@L8590-@L8004
	def	 @L8587,@L8588-@L8004
	def	 @L8585,@L8586-@L8004
	def	 @L8583,@L6219-@L8584
	def	 @L8581,@L6219-@L8582
	def	 @L8579,@L8580-@L6201
	def	 @L8577,@L7931-@L8578
	def	 @L8575,@L6156-@L8576
	def	 @L8573,@L7930-@L8574
	def	 @L8571,@L7929-@L8572
	def	 @L8569,@L6156-@L8570
	def	 @L8567,@L8568-@L6066
	def	 @L8565,@L7924-@L8566
	def	 @L8563,@L6017-@L8564
	def	 @L8561,@L7923-@L8562
	def	 @L8559,@L7922-@L8560
	def	 @L8557,@L6017-@L8558
	def	 @L8555,@L6020-@L8556
	def	 @L8553,@L8554-@L6003
	def	 @L8551,@L7921-@L8552
	def	 @L8549,@L7920-@L8550
	def	 @L8547,@L7919-@L8548
	def	 @L8545,@L8546-@L5937
	def	 @L8543,@L7915-@L8544
	def	 @L8541,@L5891-@L8542
	def	 @L8539,@L7914-@L8540
	def	 @L8537,@L7913-@L8538
	def	 @L8535,@L5891-@L8536
	def	 @L8533,@L5832-@L8534
	def	 @L8531,@L5832-@L8532
	def	 @L8529,@L8530-@L5814
	def	 @L8527,@L7907-@L8528
	def	 @L8525,@L5768-@L8526
	def	 @L8523,@L7906-@L8524
	def	 @L8521,@L7905-@L8522
	def	 @L8519,@L5768-@L8520
	def	 @L8517,@L8518-@L5754
	def	 @L8515,@L7904-@L8516
	def	 @L8513,@L5709-@L8514
	def	 @L8511,@L7903-@L8512
	def	 @L8509,@L7902-@L8510
	def	 @L8507,@L5709-@L8508
	def	 @L8505,@L5657-@L8506
	def	 @L8503,@L5657-@L8504
	def	 @L8501,@L8502-@L8004
	def	 @L8499,@L5461-@L8500
	def	 @L8497,@L5461-@L8498
	def	 @L8495,@L8004-@L8496
	def	 @L8493,@L8004-@L8494
	def	 @L8491,@L7873-@L8492
	def	 @L8489,@L7873-@L8490
	def	 @L8487,@L7873-@L8488
	def	 @L8485,@L7873-@L8486
	def	 @L8483,@L7873-@L8484
	def	 @L8481,@L7873-@L8482
	def	 @L8479,@L8004-@L8480
	def	 @L8477,@L7870-@L8478
	def	 @L8475,@L8004-@L8476
	def	 @L8473,@L7870-@L8474
	def	 @L8471,@L8004-@L8472
	def	 @L8469,@L8004-@L8470
	def	 @L8467,@L8004-@L8468
	def	 @L8465,@L8004-@L8466
	def	 @L8463,@L7868-@L8464
	def	 @L8461,@L7868-@L8462
	def	 @L8459,@L7868-@L8460
	def	 @L8457,@L7868-@L8458
	def	 @L8455,@L7868-@L8456
	def	 @L8453,@L7868-@L8454
	def	 @L8451,@L8004-@L8452
	def	 @L8449,@L7865-@L8450
	def	 @L8447,@L8004-@L8448
	def	 @L8445,@L7865-@L8446
	def	 @L8443,@L8004-@L8444
	def	 @L8441,@L8004-@L8442
	def	 @L8439,@L8004-@L8440
	def	 @L8437,@L8004-@L8438
	def	 @L8435,@L8436-@L5067
	def	 @L8433,@L7861-@L8434
	def	 @L8431,@L8004-@L8432
	def	 @L8429,@L7860-@L8430
	def	 @L8427,@L7859-@L8428
	def	 @L8425,@L8004-@L8426
	def	 @L8423,@L8424-@L5008
	def	 @L8421,@L7858-@L8422
	def	 @L8419,@L4962-@L8420
	def	 @L8417,@L7857-@L8418
	def	 @L8415,@L7856-@L8416
	def	 @L8413,@L4962-@L8414
	def	 @L8411,@L8004-@L8412
	def	 @L8409,@L7855-@L8410
	def	 @L8407,@L8408-@L4924
	def	 @L8405,@L7852-@L8406
	def	 @L8403,@L4879-@L8404
	def	 @L8401,@L7851-@L8402
	def	 @L8399,@L7850-@L8400
	def	 @L8397,@L4879-@L8398
	def	 @L8395,@L8396-@L4865
	def	 @L8393,@L7849-@L8394
	def	 @L8391,@L4820-@L8392
	def	 @L8389,@L7848-@L8390
	def	 @L8387,@L7847-@L8388
	def	 @L8385,@L4820-@L8386
	def	 @L8383,@L7846-@L8384
	def	 @L8381,@L7845-@L8382
	def	 @L8379,@L7845-@L8380
	def	 @L8377,@L7845-@L8378
	def	 @L8375,@L7845-@L8376
	def	 @L8373,@L7845-@L8374
	def	 @L8371,@L7845-@L8372
	def	 @L8369,@L7842-@L8370
	def	 @L8367,@L7842-@L8368
	def	 @L8365,@L7840-@L8366
	def	 @L8363,@L8364-@L4669
	def	 @L8361,@L7839-@L8362
	def	 @L8359,@L4624-@L8360
	def	 @L8357,@L7838-@L8358
	def	 @L8355,@L7837-@L8356
	def	 @L8353,@L4624-@L8354
	def	 @L8351,@L7836-@L8352
	def	 @L8349,@L7832-@L8350
	def	 @L8347,@L7832-@L8348
	def	 @L8345,@L7832-@L8346
	def	 @L8343,@L7832-@L8344
	def	 @L8341,@L7832-@L8342
	def	 @L8339,@L7832-@L8340
	def	 @L8337,@L7830-@L8338
	def	 @L8335,@L7832-@L8336
	def	 @L8333,@L7830-@L8334
	def	 @L8331,@L4397-@L8332
	def	 @L8329,@L4397-@L8330
	def	 @L8327,@L4315-@L8328
	def	 @L8325,@L4315-@L8326
	def	 @L8323,@L8324-@L4362
	def	 @L8321,@L7827-@L8322
	def	 @L8319,@L4315-@L8320
	def	 @L8317,@L7826-@L8318
	def	 @L8315,@L7825-@L8316
	def	 @L8313,@L7824-@L8314
	def	 @L8311,@L4311-@L8312
	def	 @L8309,@L4257-@L8310
	def	 @L8307,@L4257-@L8308
	def	 @L8305,@L7819-@L8306
	def	 @L8303,@L7815-@L8304
	def	 @L8301,@L4192-@L8302
	def	 @L8299,@L8300-@L4175
	def	 @L8297,@L7813-@L8298
	def	 @L8295,@L7812-@L8296
	def	 @L8293,@L7811-@L8294

data
	align	 8
@LC4:
	string	 "offset outside bounds of constant string\000"
	align	 8
@LC5:
	string	 "`va_start' used within `({...})'\000"
	align	 8
@LC6:
	string	 "CUMULATIVE_ARGS type defined badly; see %s, line "
	string	 "%d\000"
	align	 8
@LC7:
	string	 "expr.c\000"
	align	 8
@LC8:
	string	 "argument of __builtin_args_info must be constant\000"
	align	 8
@LC9:
	string	 "argument of __builtin_args_info out of range\000"
	align	 8
@LC10:
	string	 "missing argument in __builtin_args_info\000"
	align	 8
@LC11:
	string	 "`va_start' used in function with fixed args\000"
	align	 8
@LC12:
	string	 "invalid arg to __builtin_return_address\000"
	align	 8
@LC13:
	string	 "invalid arg to __builtin_return_address\000"
	align	 8
@LC14:
	string	 "built-in function %s not currently supported\000"
text
	align	 8
_expand_builtin:
	subu	 r31,r31,96
	st	 r1,r31,80
	st	 r15,r31,36
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	st.d	 r18,r31,48
	or	 r21,r0,r2
	st.d	 r16,r31,40
@Ltb31:
	or.u	 r12,r0,hi16(@L9375)
	ld	 r13,r21,16
	or	 r18,r0,r3
	or	 r25,r0,r4
	ld	 r19,r13,16
	or	 r23,r0,r5
	or	 r15,r0,r6
	ld	 r13,r19,68
	ld	 r11,r21,4
	subu	 r10,r13,1
	ld	 r24,r21,20
	cmp	 r13,r10,28
	ld.bu	 r17,r11,24
	bb0.n	 ls,r13,@L9374
	or	 r12,r12,lo16(@L9375)
	ld	 r13,r12[r10]
	jmp	 r13
	align	 4
@L9375:
	word	 @L8912
	word	 @L8835
	word	 @L8835
	word	 @L8835
	word	 @L8916
	word	 @L9374
	word	 @L9374
	word	 @L9374
	word	 @L9374
	word	 @L9374
	word	 @L9374
	word	 @L9292
	word	 @L8832
	word	 @L9374
	word	 @L9248
	word	 @L8832
	word	 @L8921
	word	 @L8838
	word	 @L8838
	word	 @L8838
	word	 @L9374
	word	 @L9374
	word	 @L8858
	word	 @L8872
	word	 @L8869
	word	 @L8861
	word	 @L8893
	word	 @L8899
	word	 @L8899
	align	 4
@L8835:
	bsr	 _abort
	align	 4
@L8838:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L9513
	or	 r2,r0,r21
	bcnd	 eq0,r24,@L8841
	ld	 r12,r24,16
	ld	 r13,r12,4
	ld.bu	 r13,r13,8
	cmp	 r13,r13,8
	bb0	 ne,r13,@L8840
@L8841:
	ld	 r13,r21,4
	or.u	 r12,r0,hi16(_const_tiny_rtx)
	ld.bu	 r13,r13,24
	or	 r12,r12,lo16(_const_tiny_rtx)
	ld	 r2,r12[r13]
	br	 @L9376
	align	 4
@L8840:
	ld.bu	 r13,r12,8
	subu	 r13,r13,33
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L9514
	or	 r3,r0,r25
	bsr.n	 _copy_node
	or	 r2,r0,r21
	or	 r21,r0,r2
	bsr.n	 _copy_node
	or	 r2,r0,r24
	or	 r24,r0,r2
	st	 r24,r21,20
	bsr.n	 _save_expr
	ld	 r2,r24,16
	st	 r2,r24,16
	or	 r3,r0,r25
@L9514:
	or	 r4,r0,0
	ld	 r2,r24,16
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld	 r13,r21,4
	or	 r23,r0,r2
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,24
	or.u	 r13,r0,hi16(_pending_chain)
	ld	 r25,r13,lo16(_pending_chain)
	bcnd.n	 eq0,r25,@L8843
	or	 r18,r0,r2
	or	 r22,r0,r13
@L8846:
	bsr.n	 _emit_insn
	ld	 r2,r25,16
	ld	 r13,r25,20
	st	 r2,r25,8
	or	 r25,r0,r13
	bcnd.n	 ne0,r25,@L8846
	st	 r25,r22,lo16(_pending_chain)
@L8843:
	bsr	 _start_sequence
	ld	 r13,r19,68
	cmp	 r12,r13,19
	bb0	 ne,r12,@L8849
	bb0	 ls,r12,@L8854
	cmp	 r13,r13,18
	bb0.n	 ne,r13,@L8851
	or.u	 r13,r0,hi16(_sqrt_optab)
	br	 @L8852
	align	 4
@L8854:
	cmp	 r13,r13,20
	bb0.n	 ne,r13,@L8850
	or.u	 r13,r0,hi16(_cos_optab)
	br	 @L8852
	align	 4
@L8849:
	or.u	 r13,r0,hi16(_sin_optab)
	ld	 r3,r13,lo16(_sin_optab)
	br	 @L8848
	align	 4
@L8850:
	ld	 r3,r13,lo16(_cos_optab)
	br	 @L8848
	align	 4
@L8851:
	ld	 r3,r13,lo16(_sqrt_optab)
	br	 @L8848
	align	 4
@L8852:
	bsr	 _abort
	align	 4
@L8848:
	ld	 r13,r24,16
	ld	 r13,r13,4
	or	 r4,r0,r23
	or	 r5,r0,r18
	ld.bu	 r2,r13,24
	bsr.n	 _expand_unop
	or	 r6,r0,0
	or	 r18,r0,r2
	bcnd.n	 ne0,r18,@L8855
	or.u	 r13,r0,hi16(_flag_fast_math)
	bsr.n	 _end_sequence
	addu	 r1,r1,@L9554
@L9555:
	align	 4
@L8855:
	ld	 r13,r13,lo16(_flag_fast_math)
	bcnd	 ne0,r13,@L8856
	bsr.n	 _gen_label_rtx
	or.u	 r25,r0,hi16(_inhibit_defer_pop)
	ld.bu	 r6,r18,2
	or	 r24,r0,r2
	or	 r2,r0,r18
	or	 r3,r0,r18
	or	 r4,r0,90
	or	 r5,r0,0
	or	 r7,r0,0
	bsr.n	 _emit_cmp_insn
	or	 r8,r0,0
	bsr.n	 _gen_beq
	or	 r2,r0,r24
	bsr	 _emit_jump_insn
	or	 r2,r0,r21
	ld	 r13,r25,lo16(_inhibit_defer_pop)
	or	 r3,r0,r18
	or	 r4,r0,0
	addu	 r13,r13,1
	bsr.n	 _expand_call
	st	 r13,r25,lo16(_inhibit_defer_pop)
	ld	 r13,r25,lo16(_inhibit_defer_pop)
	or	 r2,r0,r24
	subu	 r13,r13,1
	bsr.n	 _emit_label
	st	 r13,r25,lo16(_inhibit_defer_pop)
@L8856:
	bsr	 _get_insns
	bsr.n	 _end_sequence
	or	 r25,r0,r2
	bsr.n	 _emit_insns
	or	 r2,r0,r25
@L9494:
	br.n	 @L9376
	or	 r2,r0,r18
	align	 4
@L8858:
	or.u	 r23,r0,hi16(_saveregs_value)
	ld	 r2,r23,lo16(_saveregs_value)
	bcnd	 ne0,r2,@L9376
	bsr	 _start_sequence
	or	 r2,r0,51
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,24
	or	 r4,r0,r2
	or	 r2,r0,41
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr	 _emit_insn
	or	 r2,r0,51
	or	 r3,r0,6
	bsr.n	 _gen_rtx
	or	 r4,r0,28
	or	 r4,r0,r2
	or	 r2,r0,41
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr	 _emit_insn
	or	 r2,r0,r21
	or	 r3,r0,r18
	bsr.n	 _expand_call
	or	 r4,r0,r15
	bsr.n	 _get_insns
	or	 r25,r0,r2
	bsr.n	 _end_sequence
	or	 r24,r0,r2
	bsr.n	 _in_sequence_p
	st	 r25,r23,lo16(_saveregs_value)
	bcnd	 eq0,r2,@L8860
	or.u	 r2,r0,hi16(@LC5)
	bsr.n	 _error
	or	 r2,r2,lo16(@LC5)
	br.n	 @L9376
	or	 r2,r0,r25
	align	 4
@L8860:
	bsr	 _get_insns
	ld	 r3,r2,12
	bsr.n	 _emit_insns_before
	or	 r2,r0,r24
	br.n	 @L9376
	or	 r2,r0,r25
	align	 4
@L8861:
	or.u	 r13,r0,hi16(_current_function_args_info)
	bcnd.n	 eq0,r24,@L8863
	or	 r11,r13,lo16(_current_function_args_info)
	ld	 r2,r24,16
	ld.bu	 r13,r2,8
	cmp	 r13,r13,25
	bb0	 ne,r13,@L8864
	or.u	 r2,r0,hi16(@LC8)
	br.n	 @L9512
	or	 r2,r2,lo16(@LC8)
	align	 4
@L8864:
	ld	 r2,r2,12
	cmp	 r13,r2,1
	extu	 r12,r2,0<31>
	extu	 r13,r13,1<ge>
	or	 r12,r12,r13
	bcnd	 eq0,r12,@L8866
	or.u	 r2,r0,hi16(@LC9)
	br.n	 @L9512
	or	 r2,r2,lo16(@LC9)
	align	 4
@L8866:
	ld	 r4,r11[r2]
	or	 r2,r0,46
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L9556
@L9557:
	align	 4
@L8863:
	or.u	 r2,r0,hi16(@LC10)
	br.n	 @L9512
	or	 r2,r2,lo16(@LC10)
	align	 4
@L8869:
	or.u	 r13,r0,hi16(_current_function_decl)
	ld	 r13,r13,lo16(_current_function_decl)
	ld	 r13,r13,4
	ld	 r2,r13,12
	bcnd	 eq0,r2,@L8871
	bsr	 _tree_last
	or.u	 r12,r0,hi16(_void_type_node)
	ld	 r13,r2,16
	ld	 r12,r12,lo16(_void_type_node)
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L8870
	or.u	 r13,r0,hi16(_add_optab)
@L8871:
	or.u	 r2,r0,hi16(@LC11)
	or	 r2,r2,lo16(@LC11)
@L9512:
	bsr.n	 _error
	addu	 r1,r1,@L9558
@L9559:
	align	 4
@L8870:
	or	 r2,r0,4
	ld	 r3,r13,lo16(_add_optab)
	or.u	 r13,r0,hi16(_current_function_internal_arg_pointer)
	or	 r6,r0,0
	ld	 r4,r13,lo16(_current_function_internal_arg_pointer)
	or.u	 r13,r0,hi16(_current_function_arg_offset_rtx)
	or	 r7,r0,0
	ld	 r5,r13,lo16(_current_function_arg_offset_rtx)
	or	 r8,r0,3
	bsr.n	 _expand_binop
	addu	 r1,r1,@L9560
@L9561:
	align	 4
@L8872:
	bcnd	 eq0,r24,@L8873
	ld	 r13,r24,16
	ld	 r13,r13,4
	ld.bu	 r12,r13,8
	cmp	 r13,r12,6
	bb1.n	 ne,r13,@L8874
	cmp	 r13,r12,7
	or	 r2,r0,46
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L9562
@L9563:
	align	 4
@L8874:
	bb1.n	 ne,r13,@L8875
	cmp	 r13,r12,12
	or	 r2,r0,46
	or	 r3,r0,0
	or	 r4,r0,1
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L9564
@L9565:
	align	 4
@L8875:
	bb1.n	 ne,r13,@L8876
	cmp	 r13,r12,10
	or	 r2,r0,46
	or	 r3,r0,0
	or	 r4,r0,2
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L9566
@L9567:
	align	 4
@L8876:
	bb1.n	 ne,r13,@L8877
	cmp	 r13,r12,11
	or	 r2,r0,46
	or	 r3,r0,0
	or	 r4,r0,3
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L9568
@L9569:
	align	 4
@L8877:
	bb1.n	 ne,r13,@L8878
	cmp	 r13,r12,13
	or	 r2,r0,46
	or	 r3,r0,0
	or	 r4,r0,4
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L9570
@L9571:
	align	 4
@L8878:
	bb1.n	 ne,r13,@L8879
	cmp	 r13,r12,15
	or	 r2,r0,46
	or	 r3,r0,0
	or	 r4,r0,5
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L9572
@L9573:
	align	 4
@L8879:
	bb1.n	 ne,r13,@L8880
	cmp	 r13,r12,14
	or	 r2,r0,46
	or	 r3,r0,0
	or	 r4,r0,6
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L9574
@L9575:
	align	 4
@L8880:
	bb1.n	 ne,r13,@L8881
	cmp	 r13,r12,8
	or	 r2,r0,46
	or	 r3,r0,0
	or	 r4,r0,7
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L9576
@L9577:
	align	 4
@L8881:
	bb1.n	 ne,r13,@L8882
	cmp	 r13,r12,9
	or	 r2,r0,46
	or	 r3,r0,0
	or	 r4,r0,8
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L9578
@L9579:
	align	 4
@L8882:
	bb1.n	 ne,r13,@L8883
	cmp	 r13,r12,23
	or	 r2,r0,46
	or	 r3,r0,0
	or	 r4,r0,9
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L9580
@L9581:
	align	 4
@L8883:
	bb1.n	 ne,r13,@L8884
	cmp	 r13,r12,16
	or	 r2,r0,46
	or	 r3,r0,0
	or	 r4,r0,10
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L9582
@L9583:
	align	 4
@L8884:
	bb1.n	 ne,r13,@L8885
	cmp	 r13,r12,21
	or	 r2,r0,46
	or	 r3,r0,0
	or	 r4,r0,11
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L9584
@L9585:
	align	 4
@L8885:
	bb1.n	 ne,r13,@L8886
	cmp	 r13,r12,22
	or	 r2,r0,46
	or	 r3,r0,0
	or	 r4,r0,12
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L9586
@L9587:
	align	 4
@L8886:
	bb1.n	 ne,r13,@L8887
	cmp	 r13,r12,18
	or	 r2,r0,46
	or	 r3,r0,0
	or	 r4,r0,13
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L9588
@L9589:
	align	 4
@L8887:
	bb1.n	 ne,r13,@L8888
	cmp	 r13,r12,20
	or	 r2,r0,46
	or	 r3,r0,0
	or	 r4,r0,14
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L9590
@L9591:
	align	 4
@L8888:
	bb1.n	 ne,r13,@L8889
	cmp	 r13,r12,19
	or	 r2,r0,46
	or	 r3,r0,0
	or	 r4,r0,15
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L9592
@L9593:
	align	 4
@L8889:
	bb1.n	 ne,r13,@L8890
	cmp	 r13,r12,17
	or	 r2,r0,46
	or	 r3,r0,0
	or	 r4,r0,16
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L9594
@L9595:
	align	 4
@L8890:
	bb1.n	 ne,r13,@L8891
	cmp	 r13,r12,24
	or	 r2,r0,46
	or	 r3,r0,0
	or	 r4,r0,17
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L9596
@L9597:
	align	 4
@L8891:
	bb1.n	 ne,r13,@L9515
	or	 r2,r0,46
	or	 r3,r0,0
	or	 r4,r0,18
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L9598
@L9599:
	align	 4
@L8873:
	or	 r2,r0,46
@L9515:
	or	 r3,r0,0
	subu	 r4,r0,1
	bsr.n	 _gen_rtx
	addu	 r1,r1,@L9600
@L9601:
	align	 4
@L8893:
	bcnd	 eq0,r24,@L9295
	ld	 r13,r24,16
	or.u	 r12,r0,hi16(_tree_code_type)
	ld.bu	 r11,r13,8
	ld	 r13,r12,lo16(_tree_code_type)
	ld	 r13,r13[r11]
	ld.b	 r13,r0,r13
	cmp	 r13,r13,99
	bb1.n	 ne,r13,@L9516
	or.u	 r13,r0,hi16(_const0_rtx)
	or.u	 r13,r0,hi16(_const1_rtx)
	ld	 r2,r13,lo16(_const1_rtx)
	br	 @L9376
	align	 4
@L8899:
	bcnd	 eq0,r24,@L9295
	ld	 r2,r24,16
	ld.bu	 r13,r2,8
	cmp	 r13,r13,25
	bb0	 ne,r13,@L8902
	or.u	 r2,r0,hi16(@LC12)
	br.n	 @L9512
	or	 r2,r2,lo16(@LC12)
	align	 4
@L8902:
	or.u	 r13,r0,hi16(_integer_zero_node)
	bsr.n	 _tree_int_cst_lt
	ld	 r3,r13,lo16(_integer_zero_node)
	bcnd.n	 eq0,r2,@L8904
	or.u	 r2,r0,hi16(@LC13)
	br.n	 @L9512
	or	 r2,r2,lo16(@LC13)
	align	 4
@L8904:
	ld	 r13,r24,16
	or.u	 r12,r0,hi16(_frame_pointer_rtx)
	ld	 r24,r13,12
	ld	 r4,r12,lo16(_frame_pointer_rtx)
	bcnd.n	 le0,r24,@L8907
	or	 r25,r0,0
	mask	 r12,r24,3
	bcnd.n	 eq0,r12,@L9517
	or	 r2,r0,4
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L9553
	cmp	 r13,r12,2
	bb0	 gt,r13,@L9518
	bsr.n	 _memory_address
	or	 r3,r0,r4
	or	 r4,r0,r2
	or	 r2,r0,55
	bsr.n	 _gen_rtx
	or	 r3,r0,4
	bsr.n	 _copy_to_reg
	or	 r25,r0,1
	or	 r4,r0,r2
	or	 r2,r0,4
@L9518:
	bsr.n	 _memory_address
	or	 r3,r0,r4
	or	 r4,r0,r2
	or	 r2,r0,55
	bsr.n	 _gen_rtx
	or	 r3,r0,4
	bsr.n	 _copy_to_reg
	addu	 r25,r25,1
	or	 r4,r0,r2
	or	 r2,r0,4
@L9553:
	bsr.n	 _memory_address
	or	 r3,r0,r4
	or	 r4,r0,r2
	or	 r2,r0,55
	bsr.n	 _gen_rtx
	or	 r3,r0,4
	bsr.n	 _copy_to_reg
	addu	 r25,r25,1
	cmp	 r13,r25,r24
	bb0.n	 lt,r13,@L8907
	or	 r4,r0,r2
@L8909:
	or	 r2,r0,4
@L9517:
	bsr.n	 _memory_address
	or	 r3,r0,r4
	or	 r4,r0,r2
	or	 r2,r0,55
	bsr.n	 _gen_rtx
	or	 r3,r0,4
	bsr.n	 _copy_to_reg
	addu	 r25,r25,4
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address
	or	 r3,r0,r4
	or	 r4,r0,r2
	or	 r2,r0,55
	bsr.n	 _gen_rtx
	or	 r3,r0,4
	bsr	 _copy_to_reg
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address
	or	 r3,r0,r4
	or	 r4,r0,r2
	or	 r2,r0,55
	bsr.n	 _gen_rtx
	or	 r3,r0,4
	bsr	 _copy_to_reg
	or	 r4,r0,r2
	or	 r2,r0,4
	bsr.n	 _memory_address
	or	 r3,r0,r4
	or	 r4,r0,r2
	or	 r2,r0,55
	bsr.n	 _gen_rtx
	or	 r3,r0,4
	bsr	 _copy_to_reg
	cmp	 r13,r25,r24
	bb1.n	 lt,r13,@L8909
	or	 r4,r0,r2
@L8907:
	ld	 r13,r19,68
	cmp	 r13,r13,28
	bb1.n	 ne,r13,@L8911
	or.u	 r13,r0,hi16(_mode_size+16)
	br.n	 @L9376
	or	 r2,r0,r4
	align	 4
@L8911:
	ld	 r3,r13,lo16(_mode_size+16)
	bsr.n	 _plus_constant_wide
	or	 r2,r0,r4
	or	 r3,r0,r2
	bsr.n	 _memory_address
	or	 r2,r0,4
	or	 r4,r0,r2
	or	 r2,r0,55
	bsr.n	 _gen_rtx
	or	 r3,r0,4
	bsr.n	 _copy_to_reg
	addu	 r1,r1,@L9602
@L9603:
	align	 4
@L8912:
	bcnd	 eq0,r24,@L9295
	ld	 r13,r24,16
	ld	 r13,r13,4
	ld.bu	 r13,r13,8
	cmp	 r13,r13,7
	bb1.n	 ne,r13,@L9516
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r2,r24,16
	or	 r3,r0,0
	or	 r4,r0,0
	or	 r5,r0,0
	or.u	 r12,r0,hi16(_current_function_calls_alloca)
	or	 r13,r0,1
	bsr.n	 _expand_expr
	st	 r13,r12,lo16(_current_function_calls_alloca)
	or	 r3,r0,r18
	bsr.n	 _allocate_dynamic_stack_space
	or	 r4,r0,8
	or.u	 r13,r0,hi16(_nonlocal_goto_handler_slot)
	ld	 r13,r13,lo16(_nonlocal_goto_handler_slot)
	bcnd.n	 eq0,r13,@L9494
	or	 r18,r0,r2
	or	 r2,r0,2
	or.u	 r3,r0,hi16(_nonlocal_goto_stack_level)
	or	 r4,r0,0
	or	 r3,r3,lo16(_nonlocal_goto_stack_level)
	bsr.n	 _emit_stack_save
	subu	 r1,r1,@L9604
@L9605:
	align	 4
@L8916:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L9513
	or	 r2,r0,r21
	bcnd	 eq0,r24,@L9295
	ld	 r2,r24,16
	ld	 r13,r2,4
	ld.bu	 r13,r13,8
	cmp	 r13,r13,7
	bb1.n	 ne,r13,@L9516
	or.u	 r13,r0,hi16(_const0_rtx)
	or	 r3,r0,r25
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld	 r13,r24,16
	or	 r23,r0,r2
	ld	 r12,r13,4
	or.u	 r13,r0,hi16(_ffs_optab)
	or	 r5,r0,r18
	ld	 r3,r13,lo16(_ffs_optab)
	or	 r6,r0,1
	ld.bu	 r2,r12,24
	bsr.n	 _expand_unop
	or	 r4,r0,r23
	or	 r18,r0,r2
	bcnd.n	 ne0,r18,@L9376
	or	 r2,r0,r18
	bsr	 _abort
	align	 4
@L8921:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L9513
	or	 r2,r0,r21
	bcnd	 eq0,r24,@L9295
	ld	 r2,r24,16
	ld	 r13,r2,4
	ld.bu	 r13,r13,8
	cmp	 r13,r13,13
	bb1.n	 ne,r13,@L9516
	or.u	 r13,r0,hi16(_const0_rtx)
	or	 r24,r0,r2
	ld.bu	 r12,r24,8
	subu	 r13,r12,101
	mask	 r13,r13,0xff
	addu	 r8,r31,88
	cmp	 r13,r13,1
	br.n	 @L9484
	or	 r10,r0,r24
	align	 4
@L8932:
	ld	 r11,r10,16
	ld	 r13,r10,4
	ld	 r12,r11,4
	ld.bu	 r13,r13,24
	ld.bu	 r12,r12,24
	cmp	 r13,r13,r12
	bb0	 eq,r13,@L8929
	or	 r10,r0,r11
	ld.bu	 r12,r10,8
	subu	 r13,r12,101
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
@L9484:
	bb1.n	 ls,r13,@L8932
	mask	 r13,r12,0xff
	cmp	 r13,r13,103
	bb1	 eq,r13,@L8932
@L8929:
	ld.bu	 r13,r10,8
	cmp	 r13,r13,106
	bb1	 ne,r13,@L8934
	ld	 r13,r10,16
	ld.bu	 r13,r13,8
	cmp	 r13,r13,28
	bb1.n	 ne,r13,@L8934
	or.u	 r13,r0,hi16(_integer_zero_node)
	ld	 r13,r13,lo16(_integer_zero_node)
	st	 r13,r0,r8
	ld	 r13,r10,16
	br.n	 @L9519
	or	 r2,r0,r13
	align	 4
@L8934:
	ld.bu	 r13,r10,8
	cmp	 r13,r13,53
	bb1	 ne,r13,@L8935
	ld	 r9,r10,16
	ld.bu	 r12,r9,8
	subu	 r13,r12,101
	mask	 r13,r13,0xff
	ld	 r10,r10,20
	br.n	 @L9485
	cmp	 r13,r13,1
	align	 4
@L8941:
	ld	 r11,r9,16
	ld	 r13,r9,4
	ld	 r12,r11,4
	ld.bu	 r13,r13,24
	ld.bu	 r12,r12,24
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L9486
	or	 r9,r0,r11
	ld.bu	 r12,r9,8
	subu	 r13,r12,101
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
@L9485:
	bb1.n	 ls,r13,@L8941
	mask	 r13,r12,0xff
	cmp	 r13,r13,103
	bb1	 eq,r13,@L8941
	br	 @L9486
	align	 4
@L8947:
	ld	 r11,r10,16
	ld	 r13,r10,4
	ld	 r12,r11,4
	ld.bu	 r13,r13,24
	ld.bu	 r12,r12,24
	cmp	 r13,r13,r12
	bb0	 eq,r13,@L8944
	or	 r10,r0,r11
@L9486:
	ld.bu	 r12,r10,8
	subu	 r13,r12,101
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L8947
	mask	 r13,r12,0xff
	cmp	 r13,r13,103
	bb1	 eq,r13,@L8947
@L8944:
	ld.bu	 r13,r9,8
	cmp	 r13,r13,106
	bb1	 ne,r13,@L8949
	ld	 r13,r9,16
	ld.bu	 r13,r13,8
	cmp	 r13,r13,28
	bb1	 ne,r13,@L8949
	st	 r10,r0,r8
	ld	 r13,r9,16
	br.n	 @L9519
	or	 r2,r0,r13
	align	 4
@L8949:
	ld.bu	 r13,r10,8
	cmp	 r13,r13,106
	bb1.n	 ne,r13,@L8927
	or	 r13,r0,0
	ld	 r13,r10,16
	ld.bu	 r13,r13,8
	cmp	 r13,r13,28
	bb1.n	 ne,r13,@L8927
	or	 r13,r0,0
	st	 r9,r0,r8
	ld	 r13,r10,16
	br.n	 @L9519
	or	 r2,r0,r13
	align	 4
@L8935:
	or	 r13,r0,0
@L8927:
	or	 r2,r0,r13
@L9519:
	bcnd	 eq0,r2,@L9488
	ld	 r10,r2,16
	ld	 r12,r31,88
	ld	 r2,r2,20
	bcnd	 eq0,r12,@L9377
	ld.bu	 r13,r12,8
	cmp	 r13,r13,25
	bb0	 ne,r13,@L8960
	bcnd.n	 le0,r10,@L8955
	or	 r12,r0,0
@L8957:
	ld.b	 r13,r2,r12
	bcnd.n	 eq0,r13,@L9488
	addu	 r12,r12,1
	cmp	 r13,r12,r10
	bb1	 lt,r13,@L8957
@L8955:
	bsr.n	 _size_int
	or	 r2,r0,r10
	ld	 r4,r31,88
	or	 r3,r0,r2
	or	 r2,r0,54
	bsr.n	 _size_binop
	addu	 r1,r1,@L9606
@L9607:
	align	 4
@L9377:
	br.n	 @L8961
	or	 r11,r0,0
	align	 4
@L8960:
	ld	 r13,r12,16
	bcnd	 ne0,r13,@L9488
	ld	 r11,r12,12
@L8961:
	cmp	 r13,r11,r10
	extu	 r12,r11,0<31>
	extu	 r13,r13,1<gt>
	or	 r12,r12,r13
	bcnd	 eq0,r12,@L8963
	or.u	 r2,r0,hi16(@LC4)
	bsr.n	 _warning
	or	 r2,r2,lo16(@LC4)
@L9488:
	br.n	 @L8926
	or	 r2,r0,0
	align	 4
@L8963:
	bsr.n	 _strlen
	addu	 r2,r2,r11
	bsr	 _size_int
@L8926:
	ld	 r12,r24,4
	ld.bu	 r13,r12,8
	or	 r9,r0,r24
	cmp	 r13,r13,13
	bb0.n	 ne,r13,@L8965
	or	 r8,r0,64
	br.n	 @L8964
	or	 r12,r0,0
	align	 4
@L8965:
	ld	 r13,r12,4
	ld	 r10,r13,28
	cmp	 r13,r10,64
	bb1	 ls,r13,@L8966
	or	 r10,r0,64
@L8966:
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r7,r13,lo16(_tree_code_type)
@L8969:
	ld.bu	 r12,r9,8
	cmp	 r13,r12,103
	bb0.n	 ls,r13,@L8997
	cmp	 r13,r12,101
	bb0.n	 lo,r13,@L8973
	cmp	 r13,r12,53
	bb0.n	 ne,r13,@L8977
	or	 r12,r0,r10
	br	 @L8964
	align	 4
@L8997:
	cmp	 r13,r12,106
	bb0.n	 ne,r13,@L8983
	or	 r12,r0,r10
	br	 @L8964
	align	 4
@L8973:
	ld	 r9,r9,16
	ld	 r12,r9,4
	ld.bu	 r13,r12,8
	cmp	 r13,r13,13
	bb1	 ne,r13,@L8995
	ld	 r13,r12,4
	ld	 r12,r13,28
	cmp	 r13,r12,r8
	bb1	 ls,r13,@L8975
	or	 r12,r0,r8
@L8975:
	cmp	 r13,r10,r12
	bb1	 hs,r13,@L8969
	or	 r10,r0,r12
	br	 @L8969
	align	 4
@L8977:
	ld	 r12,r9,20
	ld.bu	 r13,r12,8
	cmp	 r13,r13,25
	bb1	 ne,r13,@L8995
	ld	 r13,r12,12
	br.n	 @L9489
	mak	 r12,r13,0<3>
	align	 4
@L8981:
	extu	 r8,r8,0<1>
@L9489:
	subu	 r13,r8,1
	and	 r13,r12,r13
	bcnd	 ne0,r13,@L8981
	ld	 r9,r9,16
	br	 @L8969
	align	 4
@L8983:
	ld	 r9,r9,16
	ld.bu	 r11,r9,8
	cmp	 r13,r11,29
	bb1.n	 ne,r13,@L8984
	cmp	 r13,r10,32
	bb0	 lo,r13,@L8986
	or	 r10,r0,32
	br.n	 @L9520
	cmp	 r13,r10,r8
	align	 4
@L8984:
	ld	 r13,r7[r11]
	ld.b	 r12,r0,r13
	cmp	 r13,r12,100
	bb1.n	 ne,r13,@L8987
	cmp	 r13,r12,99
	ld	 r11,r9,68
	cmp	 r13,r10,r11
	bb0.n	 ls,r13,@L8992
	or	 r12,r0,r10
	br.n	 @L8992
	or	 r12,r0,r11
	align	 4
@L8987:
	bb1.n	 ne,r13,@L9520
	cmp	 r13,r10,r8
	cmp	 r13,r11,28
	cmp	 r12,r10,63
	rot	 r11,r13,26
	or.c	 r13,r12,r11
	extu	 r13,r13,1<hi>
	bcnd.n	 eq0,r13,@L8992
	or	 r12,r0,64
	or	 r12,r0,r10
@L8992:
	or	 r10,r0,r12
@L8986:
	cmp	 r13,r10,r8
@L9520:
	bb0.n	 hi,r13,@L8964
	or	 r12,r0,r10
	br.n	 @L8964
	or	 r12,r0,r8
	align	 4
@L8995:
	or	 r12,r0,r10
@L8964:
	or	 r4,r0,r12
	bcnd	 ge0,r4,@L8999
	addu	 r4,r4,7
@L8999:
	or	 r25,r0,r17
	bcnd.n	 eq0,r2,@L9000
	ext	 r16,r4,0<3>
	or	 r3,r0,r18
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _expand_expr
	addu	 r1,r1,@L9608
@L9609:
	align	 4
@L9000:
	bcnd.n	 eq0,r16,@L9513
	or	 r2,r0,r21
	bcnd.n	 eq0,r17,@L9513
	or.u	 r13,r0,hi16(_strlen_optab)
	or.u	 r12,r0,hi16(_mode_wider_mode)
	ld	 r11,r13,lo16(_strlen_optab)
	or	 r12,r12,lo16(_mode_wider_mode)
	lda.d	 r13,r11[r25]
@L9521:
	ld	 r20,r13,4
	cmp	 r13,r20,210
	bb0	 eq,r13,@L9003
	ld	 r25,r12[r25]
	bcnd.n	 ne0,r25,@L9521
	lda.d	 r13,r11[r25]
@L9003:
	bcnd.n	 eq0,r25,@L9513
	or	 r2,r0,r21
	bcnd.n	 eq0,r18,@L9009
	or	 r19,r0,r18
	ld.hu	 r13,r0,r18
	cmp	 r13,r13,51
	bb1	 ne,r13,@L9009
	ld.bu	 r13,r18,2
	cmp	 r13,r13,r25
	bb1	 ne,r13,@L9009
	ld	 r13,r18,4
	cmp	 r13,r13,63
	bb1	 gt,r13,@L9008
@L9009:
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,r25
	or	 r19,r0,r2
@L9008:
	mul	 r22,r20,40
	or.u	 r13,r0,hi16(_insn_operand_predicate)
	or	 r23,r13,lo16(_insn_operand_predicate)
	or	 r2,r0,r19
	ld	 r13,r22,r23
	jsr.n	 r13
	or	 r3,r0,r25
	bcnd	 ne0,r2,@L9010
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,r25
	or	 r19,r0,r2
@L9010:
	or	 r2,r0,r24
	or	 r3,r0,0
	or	 r4,r0,4
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r3,r0,r2
	bsr.n	 _memory_address
	or	 r2,r0,16
	or	 r24,r0,r2
	addu	 r21,r22,r23
	ld	 r13,r21,4
	jsr.n	 r13
	or	 r3,r0,4
	bcnd.n	 ne0,r2,@L9522
	or.u	 r13,r0,hi16(_insn_operand_mode)
	or	 r2,r0,4
	bsr.n	 _copy_to_mode_reg
	or	 r3,r0,r24
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_insn_operand_mode)
@L9522:
	or.u	 r12,r0,hi16(_const0_rtx)
	or	 r13,r13,lo16(_insn_operand_mode)
	ld	 r23,r12,lo16(_const0_rtx)
	addu	 r13,r22,r13
	ld	 r25,r13,8
	ld	 r13,r21,8
	or	 r2,r0,r23
	jsr.n	 r13
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L9523
	or	 r2,r0,55
	or	 r2,r0,r25
	bsr.n	 _copy_to_mode_reg
	or	 r3,r0,r23
	or	 r23,r0,r2
	or	 r2,r0,55
@L9523:
	or	 r3,r0,16
	or.u	 r25,r0,hi16(_insn_gen_function)
	or	 r4,r0,r24
	bsr.n	 _gen_rtx
	or	 r25,r25,lo16(_insn_gen_function)
	or	 r24,r0,r2
	or	 r2,r0,46
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r16
	ld	 r13,r25[r20]
	or	 r5,r0,r2
	or	 r2,r0,r19
	or	 r3,r0,r24
	jsr.n	 r13
	or	 r4,r0,r23
	bsr	 _emit_insn
	ld	 r11,r0,r19
	extu	 r2,r11,8<8>
	cmp	 r13,r2,r17
	bb1	 ne,r13,@L9013
@L9499:
	br.n	 @L9376
	or	 r2,r0,r19
	align	 4
@L9013:
	bcnd	 eq0,r18,@L9015
	ld.bu	 r21,r18,2
	ld.hu	 r11,r0,r18
	or.u	 r12,r0,hi16(_mode_class)
	or	 r20,r0,r18
	or	 r12,r12,lo16(_mode_class)
	or	 r22,r0,r2
	ld	 r13,r12[r21]
	or	 r23,r0,r19
	ld	 r12,r12[r22]
	or	 r16,r0,99
	cmp	 r13,r13,2
	cmp	 r12,r12,2
	extu	 r17,r13,1<eq>
	cmp	 r13,r11,59
	bb0.n	 ne,r13,@L9020
	extu	 r19,r12,1<eq>
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L9023
	cmp	 r13,r11,63
	ld	 r2,r18,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L9024
	st	 r2,r18,4
	align	 4
@L9023:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L9024
	ld	 r2,r18,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r18,4
	ld	 r2,r18,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r18,8
@L9024:
	br.n	 @L9019
	or	 r2,r0,r20
	align	 4
@L9020:
	ld	 r13,r18,8
	bcnd	 ne0,r13,@L9026
	ld	 r2,r18,4
	br	 @L9019
	align	 4
@L9026:
	ld	 r2,r18,12
	bcnd	 ne0,r2,@L9019
	ld	 r13,r18,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r18,4
	bsr.n	 _gen_move_insn
	st	 r2,r18,12
	bsr.n	 _emit_insn_before
	ld	 r3,r18,8
	ld	 r2,r18,12
@L9019:
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L9029
	or	 r20,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L9524
	cmp	 r13,r12,63
	ld.bu	 r13,r23,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L9030
	ld	 r24,r23,4
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L9030
	ld	 r13,r24,4
	st	 r13,r23,4
	ld	 r13,r24,8
	bcnd	 eq0,r13,@L9033
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r23,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r23
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	br.n	 @L9028
	or	 r2,r0,r25
	align	 4
@L9030:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L9032
	cmp	 r13,r12,63
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L9033
	st	 r2,r23,4
	align	 4
@L9032:
@L9524:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L9033
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,4
	ld	 r2,r23,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,8
@L9033:
	br.n	 @L9028
	or	 r2,r0,r23
	align	 4
@L9029:
	ld	 r13,r23,8
	bcnd	 ne0,r13,@L9035
	ld	 r2,r23,4
	br.n	 @L9525
	cmp	 r13,r17,r19
	align	 4
@L9035:
	ld	 r2,r23,12
	bcnd.n	 ne0,r2,@L9525
	cmp	 r13,r17,r19
	ld	 r13,r23,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r23,4
	bsr.n	 _gen_move_insn
	st	 r2,r23,12
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	ld	 r2,r23,12
@L9028:
	cmp	 r13,r17,r19
@L9525:
	bb0.n	 ne,r13,@L9037
	or	 r23,r0,r2
	bsr	 _abort
	align	 4
@L9037:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	ld	 r11,r0,r23
	and	 r13,r11,0x8
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L9526
	ld	 r13,r23,4
	or.u	 r12,r0,hi16(_mode_size)
	ld.bu	 r13,r13,2
	or	 r12,r12,lo16(_mode_size)
	ld	 r13,r12[r13]
	ld	 r12,r12[r21]
	cmp	 r13,r13,r12
	bb0	 ge,r13,@L9038
	bb1.n	 (31-26),r11,@L9038
	or	 r2,r0,r21
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	or	 r22,r0,r21
	or	 r23,r0,r2
@L9038:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
@L9526:
	ld	 r13,r0,r20
	and	 r13,r13,0x8
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L9039
	cmp	 r13,r21,r22
	bsr	 _abort
	align	 4
@L9039:
	bb0.n	 ne,r13,@L9527
	or	 r2,r0,r20
	bcnd	 ne0,r22,@L9040
	ld.hu	 r12,r0,r23
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L9527
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L9527
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L9040
@L9527:
	or	 r3,r0,r23
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L9610
@L9611:
	align	 4
@L9040:
	bcnd.n	 eq0,r17,@L9042
	cmp	 r5,r22,8
	cmp	 r13,r21,9
	extu	 r11,r5,1<eq>
	extu	 r7,r13,1<eq>
	and	 r13,r11,r7
	bcnd.n	 ne0,r13,@L9490
	or	 r2,r0,108
	cmp	 r6,r21,11
	extu	 r12,r6,1<eq>
	and	 r13,r11,r12
	bcnd.n	 ne0,r13,@L9490
	or	 r2,r0,109
	cmp	 r8,r22,9
	extu	 r9,r8,1<eq>
	and	 r13,r9,r12
	bcnd.n	 eq0,r13,@L9045
	cmp	 r4,r21,11
	br.n	 @L9490
	or	 r2,r0,110
	align	 4
@L9045:
	cmp	 r10,r21,8
	extu	 r11,r10,1<eq>
	and	 r13,r9,r11
	bcnd.n	 ne0,r13,@L9490
	or	 r2,r0,111
	cmp	 r9,r22,11
	extu	 r12,r9,1<eq>
	and	 r13,r12,r11
	bcnd.n	 ne0,r13,@L9490
	or	 r2,r0,112
	and	 r13,r12,r7
	bcnd.n	 eq0,r13,@L9048
	cmp	 r12,r21,9
	or	 r2,r0,113
@L9490:
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_unop_insn
	subu	 r1,r1,@L9612
@L9613:
	align	 4
@L9048:
	bb0.n	 ne,r8,@L9058
	or	 r2,r0,0
	bb0.n	 ls,r8,@L9080
	cmp	 r13,r22,10
	bb0.n	 ne,r5,@L9050
	cmp	 r13,r21,10
	br	 @L9049
	align	 4
@L9080:
	bb0	 ne,r13,@L9066
	bb0	 ne,r9,@L9072
	br	 @L9049
	align	 4
@L9050:
	bb0	 ne,r13,@L9053
	bb0	 ls,r13,@L9057
	bb0.n	 ne,r12,@L9052
	or.u	 r13,r0,hi16(_extendsfdf2_libfunc)
	br	 @L9049
	align	 4
@L9057:
	bb0.n	 ne,r4,@L9054
	or.u	 r13,r0,hi16(_extendsftf2_libfunc)
	br	 @L9049
	align	 4
@L9052:
	ld	 r2,r13,lo16(_extendsfdf2_libfunc)
	br	 @L9049
	align	 4
@L9053:
	or.u	 r13,r0,hi16(_extendsfxf2_libfunc)
	ld	 r2,r13,lo16(_extendsfxf2_libfunc)
	br	 @L9049
	align	 4
@L9054:
	ld	 r2,r13,lo16(_extendsftf2_libfunc)
	br	 @L9049
	align	 4
@L9058:
	cmp	 r13,r21,10
	bb0	 ne,r13,@L9061
	bb0	 ls,r13,@L9065
	bb0.n	 ne,r10,@L9060
	or.u	 r13,r0,hi16(_truncdfsf2_libfunc)
	br	 @L9049
	align	 4
@L9065:
	bb0.n	 ne,r6,@L9062
	or.u	 r13,r0,hi16(_extenddftf2_libfunc)
	br	 @L9049
	align	 4
@L9060:
	ld	 r2,r13,lo16(_truncdfsf2_libfunc)
	br	 @L9049
	align	 4
@L9061:
	or.u	 r13,r0,hi16(_extenddfxf2_libfunc)
	ld	 r2,r13,lo16(_extenddfxf2_libfunc)
	br	 @L9049
	align	 4
@L9062:
	ld	 r2,r13,lo16(_extenddftf2_libfunc)
	br	 @L9049
	align	 4
@L9066:
	bb0.n	 ne,r10,@L9068
	or.u	 r13,r0,hi16(_truncxfsf2_libfunc)
	bb0.n	 ne,r12,@L9069
	or.u	 r13,r0,hi16(_truncxfdf2_libfunc)
	br	 @L9049
	align	 4
@L9068:
	ld	 r2,r13,lo16(_truncxfsf2_libfunc)
	br	 @L9049
	align	 4
@L9069:
	ld	 r2,r13,lo16(_truncxfdf2_libfunc)
	br	 @L9049
	align	 4
@L9072:
	bb0.n	 ne,r10,@L9074
	or.u	 r13,r0,hi16(_trunctfsf2_libfunc)
	bb0.n	 ne,r12,@L9075
	or.u	 r13,r0,hi16(_trunctfdf2_libfunc)
	br	 @L9049
	align	 4
@L9074:
	ld	 r2,r13,lo16(_trunctfsf2_libfunc)
	br	 @L9049
	align	 4
@L9075:
	ld	 r2,r13,lo16(_trunctfdf2_libfunc)
@L9049:
	bcnd.n	 ne0,r2,@L9081
	or	 r3,r0,1
	bsr	 _abort
	align	 4
@L9081:
	or	 r4,r0,r21
	or	 r5,r0,1
	or	 r6,r0,r23
	bsr.n	 _emit_library_call
	or	 r7,r0,r22
	or	 r2,r0,r21
	bsr.n	 _hard_libcall_value
	addu	 r1,r1,@L9614
@L9615:
	align	 4
@L9042:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r24,r13,lo16(_mode_size)
	ld	 r13,r24[r22]
	ld	 r12,r24[r21]
	mak	 r13,r13,0<3>
	mak	 r11,r12,0<3>
	cmp	 r13,r13,r11
	bb1.n	 ge,r13,@L9528
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r11,32
	bb0.n	 gt,r13,@L9082
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L9083
	addu	 r13,r12,6
@L9083:
	or	 r2,r0,r21
	or	 r3,r0,r22
	or	 r4,r0,0
	bsr.n	 _can_extend_p
	ext	 r19,r13,0<2>
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb1.n	 ne,r13,@L9529
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r24[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L9086
	or.u	 r24,r0,hi16(_word_mode)
	or	 r2,r0,r21
	ld	 r3,r24,lo16(_word_mode)
	bsr.n	 _can_extend_p
	or	 r4,r0,0
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0	 ne,r13,@L9086
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r3,r0,r23
	bsr.n	 _convert_move
	or	 r4,r0,0
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r4,r0,r2
	or	 r2,r0,r25
	br.n	 @L9492
	or	 r3,r0,r20
	align	 4
@L9086:
	bsr	 _start_sequence
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L9088
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r22,r13,lo16(_word_mode)
@L9088:
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,0
	or	 r24,r0,r2
	or	 r2,r0,r22
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
	or.u	 r25,r0,hi16(_mode_size)
	or	 r25,r25,lo16(_mode_size)
	ld	 r2,r25[r22]
	mak	 r2,r2,0<3>
	bsr.n	 _size_int
	subu	 r2,r2,1
	or	 r5,r0,r2
	or	 r2,r0,78
	or	 r3,r0,r22
	or	 r4,r0,r24
	or	 r6,r0,0
	bsr.n	 _expand_shift
	or	 r7,r0,0
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_word_mode)
	or	 r4,r0,1
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _convert_to_mode
	or	 r3,r0,r24
	ld	 r3,r25[r22]
	bcnd.n	 ge0,r3,@L9094
	or	 r24,r0,r2
	addu	 r3,r3,3
@L9094:
	ext	 r22,r3,0<2>
	cmp	 r13,r22,r19
	bb0.n	 lt,r13,@L9096
	subu	 r13,r19,r22
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L9098
	subu	 r25,r19,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L9429
	cmp	 r13,r12,2
	bb0.n	 gt,r13,@L9430
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L9434
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L9434:
	bb1	 eq,r13,@L9432
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L9432:
	addu	 r22,r22,1
@L9430:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L9438
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L9438:
	bb1	 eq,r13,@L9436
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L9436:
	addu	 r22,r22,1
@L9429:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L9442
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L9442:
	bb1	 eq,r13,@L9440
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L9440:
	addu	 r22,r22,1
	cmp	 r13,r22,r19
	bb0	 lt,r13,@L9096
@L9098:
	or	 r2,r0,r20
@L9530:
	subu	 r3,r25,1
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L9446
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L9446:
	bb1	 eq,r13,@L9444
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L9444:
	or	 r2,r0,r20
	subu	 r3,r25,2
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L9450
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L9450:
	bb1	 eq,r13,@L9448
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L9448:
	or	 r2,r0,r20
	subu	 r3,r25,3
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L9454
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L9454:
	bb1	 eq,r13,@L9452
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L9452:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,4
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L9458
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L9458:
	bb1	 eq,r13,@L9456
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L9456:
	addu	 r22,r22,4
	cmp	 r13,r22,r19
	bb1.n	 lt,r13,@L9530
	or	 r2,r0,r20
@L9096:
	bsr	 _get_insns
	bsr.n	 _end_sequence
	or	 r25,r0,r2
	or	 r2,r0,r16
	or	 r3,r0,r21
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r6,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_no_conflict_block
	subu	 r1,r1,@L9616
@L9617:
	align	 4
@L9082:
	or.u	 r13,r0,hi16(_mode_size)
@L9528:
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,32
	bb0.n	 gt,r13,@L9102
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r2,r13,lo16(_word_mode)
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	addu	 r1,r1,@L9618
@L9619:
	align	 4
@L9102:
	cmp	 r13,r21,3
	bb1.n	 ne,r13,@L9103
	cmp	 r13,r22,3
	cmp	 r13,r22,4
	bb0.n	 ne,r13,@L9104
	or	 r2,r0,4
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,0
@L9104:
	bsr	 _abort
	align	 4
@L9103:
	bb1.n	 ne,r13,@L9531
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r21,4
	bb0.n	 ne,r13,@L9106
	or	 r2,r0,4
	or	 r3,r0,r23
	or	 r4,r0,0
	bsr.n	 _convert_to_mode
	or	 r22,r0,4
	br.n	 @L9105
	or	 r23,r0,r2
	align	 4
@L9106:
	bsr	 _abort
	align	 4
@L9105:
	or.u	 r13,r0,hi16(_mode_size)
@L9531:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb1.n	 ge,r12,@L9532
	or.u	 r13,r0,hi16(_mode_size)
	ld	 r13,r0,r23
	or.u	 r12,r0,0x37
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L9110
	or.u	 r13,r0,hi16(_direct_load)
	or	 r13,r13,lo16(_direct_load)
	ld.b	 r13,r21,r13
	bcnd	 eq0,r13,@L9110
	bsr.n	 _mode_dependent_address_p
	ld	 r2,r23,4
	bcnd.n	 eq0,r2,@L9533
	or	 r2,r0,r21
@L9110:
	ld.hu	 r13,r0,r23
	cmp	 r12,r13,51
	cmp	 r13,r13,53
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L9108
	or	 r2,r0,r21
@L9533:
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	addu	 r1,r1,@L9620
@L9621:
	align	 4
@L9108:
	or.u	 r13,r0,hi16(_mode_size)
@L9532:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb0.n	 gt,r12,@L9111
	or	 r2,r0,r21
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,0
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0.n	 ne,r13,@L9112
	or.u	 r13,r0,hi16(_optimize)
@L9529:
	ld	 r13,r13,lo16(_optimize)
	bcnd	 le0,r13,@L9113
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L9534
	or	 r2,r0,r25
	or	 r2,r0,r22
	bsr.n	 _force_reg
	or	 r3,r0,r23
	or	 r23,r0,r2
@L9113:
	or	 r2,r0,r25
@L9534:
	or	 r3,r0,r20
	or	 r4,r0,r23
@L9492:
	or	 r5,r0,r16
	bsr.n	 _emit_unop_insn
	subu	 r1,r1,@L9622
@L9623:
	align	 4
@L9112:
	or	 r25,r0,r22
	bcnd.n	 eq0,r25,@L9116
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r24,r13,lo16(_mode_wider_mode)
	or	 r2,r0,r21
@L9535:
	or	 r3,r0,r25
	bsr.n	 _can_extend_p
	or	 r4,r0,0
	cmp	 r2,r2,210
	bb1.n	 eq,r2,@L9117
	or	 r2,r0,r25
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,0
	cmp	 r2,r2,210
	bb1.n	 ne,r2,@L9382
	or	 r2,r0,r25
@L9117:
	ld	 r25,r24[r25]
	bcnd.n	 ne0,r25,@L9535
	or	 r2,r0,r21
@L9116:
	bsr	 _abort
	align	 4
@L9111:
	cmp	 r13,r22,6
	extu	 r11,r13,1<eq>
	cmp	 r13,r21,4
	extu	 r13,r13,1<eq>
	and	 r13,r11,r13
	bcnd.n	 eq0,r13,@L9121
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L9624
@L9625:
	align	 4
@L9121:
	cmp	 r13,r21,2
	extu	 r9,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L9122
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L9626
@L9627:
	align	 4
@L9122:
	cmp	 r13,r21,1
	extu	 r10,r13,1<eq>
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L9123
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L9628
@L9629:
	align	 4
@L9123:
	cmp	 r13,r22,4
	extu	 r11,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L9124
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L9630
@L9631:
	align	 4
@L9124:
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L9125
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L9632
@L9633:
	align	 4
@L9125:
	cmp	 r13,r22,2
	extu	 r13,r13,1<eq>
	and	 r13,r13,r10
	bcnd.n	 eq0,r13,@L9126
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L9634
@L9635:
	align	 4
@L9126:
	bb1.n	 ge,r12,@L9127
	or	 r2,r0,r21
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	bsr.n	 _force_reg
	or	 r2,r0,r21
@L9491:
	or	 r3,r0,r2
	or	 r2,r0,r20
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L9636
@L9637:
	align	 4
@L9127:
	bsr	 _abort
	align	 4
@L9382:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,0
@L9493:
	or	 r3,r0,r2
	or	 r2,r0,r20
	or	 r4,r0,0
	bsr.n	 _convert_move
	subu	 r1,r1,@L9638
@L9639:
	align	 4
@L9015:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	and	 r13,r11,0x8
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L9130
	or	 r25,r0,r19
	ld	 r13,r25,4
	or.u	 r12,r0,hi16(_mode_size)
	ld.bu	 r13,r13,2
	or	 r12,r12,lo16(_mode_size)
	ld	 r13,r12[r13]
	ld	 r12,r12[r17]
	cmp	 r13,r13,r12
	bb0	 ge,r13,@L9130
	bb1.n	 (31-26),r11,@L9130
	or	 r2,r0,r17
	bsr.n	 _gen_lowpart
	or	 r3,r0,r25
	or	 r25,r0,r2
@L9130:
	ld	 r9,r0,r25
	extu	 r13,r9,8<8>
	cmp	 r13,r17,r13
	bb0.n	 ne,r13,@L9376
	or	 r2,r0,r25
	ld.hu	 r10,r0,r25
	cmp	 r13,r10,46
	bb0.n	 ne,r13,@L9134
	or.u	 r13,r0,hi16(_mode_class)
	or	 r12,r13,lo16(_mode_class)
	ld	 r13,r12[r17]
	cmp	 r13,r13,1
	bb1	 ne,r13,@L9133
	ld.bu	 r11,r25,2
	ld	 r13,r12[r11]
	cmp	 r13,r13,1
	bb1.n	 ne,r13,@L9133
	cmp	 r13,r10,47
	bb0.n	 ne,r13,@L9134
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r17]
	ld	 r13,r13[r11]
	cmp	 r12,r12,r13
	bb1.n	 gt,r12,@L9133
	and	 r13,r9,0x10
	or.u	 r12,r0,0x37
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L9536
	cmp	 r13,r10,51
	or.u	 r13,r0,hi16(_direct_load)
	or	 r13,r13,lo16(_direct_load)
	ld.b	 r13,r17,r13
	bcnd.n	 ne0,r13,@L9537
	or	 r2,r0,r17
	cmp	 r13,r10,51
@L9536:
	bb1	 ne,r13,@L9133
@L9134:
	or	 r2,r0,r17
@L9537:
	or	 r3,r0,r25
	bsr.n	 _gen_lowpart
	addu	 r1,r1,@L9640
@L9641:
	align	 4
@L9133:
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,r17
	or	 r19,r0,r2
	or	 r23,r0,r25
	ld.bu	 r21,r19,2
	ld.bu	 r22,r23,2
	or.u	 r12,r0,hi16(_mode_class)
	ld.hu	 r11,r0,r19
	or	 r12,r12,lo16(_mode_class)
	ld	 r13,r12[r21]
	or	 r16,r0,99
	ld	 r12,r12[r22]
	or	 r20,r0,r19
	cmp	 r13,r13,2
	cmp	 r12,r12,2
	extu	 r18,r13,1<eq>
	cmp	 r13,r11,59
	bb0.n	 ne,r13,@L9140
	extu	 r17,r12,1<eq>
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L9143
	cmp	 r13,r11,63
	ld	 r2,r19,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L9144
	st	 r2,r19,4
	align	 4
@L9143:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L9144
	ld	 r2,r19,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r19,4
	ld	 r2,r19,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r19,8
@L9144:
	br.n	 @L9139
	or	 r2,r0,r20
	align	 4
@L9140:
	ld	 r13,r19,8
	bcnd	 ne0,r13,@L9146
	ld	 r2,r19,4
	br	 @L9139
	align	 4
@L9146:
	ld	 r2,r19,12
	bcnd	 ne0,r2,@L9139
	ld	 r13,r19,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r19,4
	bsr.n	 _gen_move_insn
	st	 r2,r19,12
	bsr.n	 _emit_insn_before
	ld	 r3,r19,8
	ld	 r2,r19,12
@L9139:
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L9149
	or	 r20,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L9538
	cmp	 r13,r12,63
	ld.bu	 r13,r23,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L9150
	ld	 r24,r23,4
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L9150
	ld	 r13,r24,4
	st	 r13,r23,4
	ld	 r13,r24,8
	bcnd	 eq0,r13,@L9153
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r23,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r23
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	br.n	 @L9148
	or	 r2,r0,r25
	align	 4
@L9150:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L9152
	cmp	 r13,r12,63
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L9153
	st	 r2,r23,4
	align	 4
@L9152:
@L9538:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L9153
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,4
	ld	 r2,r23,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,8
@L9153:
	br.n	 @L9148
	or	 r2,r0,r23
	align	 4
@L9149:
	ld	 r13,r23,8
	bcnd	 ne0,r13,@L9155
	ld	 r2,r23,4
	br.n	 @L9539
	cmp	 r13,r18,r17
	align	 4
@L9155:
	ld	 r2,r23,12
	bcnd.n	 ne0,r2,@L9539
	cmp	 r13,r18,r17
	ld	 r13,r23,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r23,4
	bsr.n	 _gen_move_insn
	st	 r2,r23,12
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	ld	 r2,r23,12
@L9148:
	cmp	 r13,r18,r17
@L9539:
	bb0.n	 ne,r13,@L9157
	or	 r23,r0,r2
	bsr	 _abort
	align	 4
@L9157:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	ld	 r11,r0,r23
	and	 r13,r11,0x8
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L9540
	ld	 r13,r23,4
	or.u	 r12,r0,hi16(_mode_size)
	ld.bu	 r13,r13,2
	or	 r12,r12,lo16(_mode_size)
	ld	 r13,r12[r13]
	ld	 r12,r12[r21]
	cmp	 r13,r13,r12
	bb0	 ge,r13,@L9158
	bb1.n	 (31-26),r11,@L9158
	or	 r2,r0,r21
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	or	 r22,r0,r21
	or	 r23,r0,r2
@L9158:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
@L9540:
	ld	 r13,r0,r20
	and	 r13,r13,0x8
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L9159
	cmp	 r13,r21,r22
	bsr	 _abort
	align	 4
@L9159:
	bb0.n	 ne,r13,@L9541
	or	 r2,r0,r20
	bcnd	 ne0,r22,@L9160
	ld.hu	 r12,r0,r23
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L9541
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L9541
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L9160
@L9541:
	or	 r3,r0,r23
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L9642
@L9643:
	align	 4
@L9160:
	bcnd.n	 eq0,r18,@L9162
	cmp	 r5,r22,8
	cmp	 r13,r21,9
	extu	 r11,r5,1<eq>
	extu	 r7,r13,1<eq>
	and	 r13,r11,r7
	bcnd.n	 ne0,r13,@L9495
	or	 r2,r0,108
	cmp	 r6,r21,11
	extu	 r12,r6,1<eq>
	and	 r13,r11,r12
	bcnd.n	 ne0,r13,@L9495
	or	 r2,r0,109
	cmp	 r8,r22,9
	extu	 r9,r8,1<eq>
	and	 r13,r9,r12
	bcnd.n	 eq0,r13,@L9165
	cmp	 r4,r21,11
	br.n	 @L9495
	or	 r2,r0,110
	align	 4
@L9165:
	cmp	 r10,r21,8
	extu	 r11,r10,1<eq>
	and	 r13,r9,r11
	bcnd.n	 ne0,r13,@L9495
	or	 r2,r0,111
	cmp	 r9,r22,11
	extu	 r12,r9,1<eq>
	and	 r13,r12,r11
	bcnd.n	 ne0,r13,@L9495
	or	 r2,r0,112
	and	 r13,r12,r7
	bcnd.n	 eq0,r13,@L9168
	cmp	 r12,r21,9
	or	 r2,r0,113
@L9495:
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_unop_insn
	subu	 r1,r1,@L9644
@L9645:
	align	 4
@L9168:
	bb0.n	 ne,r8,@L9178
	or	 r2,r0,0
	bb0.n	 ls,r8,@L9200
	cmp	 r13,r22,10
	bb0.n	 ne,r5,@L9170
	cmp	 r13,r21,10
	br	 @L9169
	align	 4
@L9200:
	bb0	 ne,r13,@L9186
	bb0	 ne,r9,@L9192
	br	 @L9169
	align	 4
@L9170:
	bb0	 ne,r13,@L9173
	bb0	 ls,r13,@L9177
	bb0.n	 ne,r12,@L9172
	or.u	 r13,r0,hi16(_extendsfdf2_libfunc)
	br	 @L9169
	align	 4
@L9177:
	bb0.n	 ne,r4,@L9174
	or.u	 r13,r0,hi16(_extendsftf2_libfunc)
	br	 @L9169
	align	 4
@L9172:
	ld	 r2,r13,lo16(_extendsfdf2_libfunc)
	br	 @L9169
	align	 4
@L9173:
	or.u	 r13,r0,hi16(_extendsfxf2_libfunc)
	ld	 r2,r13,lo16(_extendsfxf2_libfunc)
	br	 @L9169
	align	 4
@L9174:
	ld	 r2,r13,lo16(_extendsftf2_libfunc)
	br	 @L9169
	align	 4
@L9178:
	cmp	 r13,r21,10
	bb0	 ne,r13,@L9181
	bb0	 ls,r13,@L9185
	bb0.n	 ne,r10,@L9180
	or.u	 r13,r0,hi16(_truncdfsf2_libfunc)
	br	 @L9169
	align	 4
@L9185:
	bb0.n	 ne,r6,@L9182
	or.u	 r13,r0,hi16(_extenddftf2_libfunc)
	br	 @L9169
	align	 4
@L9180:
	ld	 r2,r13,lo16(_truncdfsf2_libfunc)
	br	 @L9169
	align	 4
@L9181:
	or.u	 r13,r0,hi16(_extenddfxf2_libfunc)
	ld	 r2,r13,lo16(_extenddfxf2_libfunc)
	br	 @L9169
	align	 4
@L9182:
	ld	 r2,r13,lo16(_extenddftf2_libfunc)
	br	 @L9169
	align	 4
@L9186:
	bb0.n	 ne,r10,@L9188
	or.u	 r13,r0,hi16(_truncxfsf2_libfunc)
	bb0.n	 ne,r12,@L9189
	or.u	 r13,r0,hi16(_truncxfdf2_libfunc)
	br	 @L9169
	align	 4
@L9188:
	ld	 r2,r13,lo16(_truncxfsf2_libfunc)
	br	 @L9169
	align	 4
@L9189:
	ld	 r2,r13,lo16(_truncxfdf2_libfunc)
	br	 @L9169
	align	 4
@L9192:
	bb0.n	 ne,r10,@L9194
	or.u	 r13,r0,hi16(_trunctfsf2_libfunc)
	bb0.n	 ne,r12,@L9195
	or.u	 r13,r0,hi16(_trunctfdf2_libfunc)
	br	 @L9169
	align	 4
@L9194:
	ld	 r2,r13,lo16(_trunctfsf2_libfunc)
	br	 @L9169
	align	 4
@L9195:
	ld	 r2,r13,lo16(_trunctfdf2_libfunc)
@L9169:
	bcnd.n	 ne0,r2,@L9201
	or	 r3,r0,1
	bsr	 _abort
	align	 4
@L9201:
	or	 r4,r0,r21
	or	 r5,r0,1
	or	 r6,r0,r23
	bsr.n	 _emit_library_call
	or	 r7,r0,r22
	or	 r2,r0,r21
	bsr.n	 _hard_libcall_value
	addu	 r1,r1,@L9646
@L9647:
	align	 4
@L9162:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r24,r13,lo16(_mode_size)
	ld	 r13,r24[r22]
	ld	 r12,r24[r21]
	mak	 r13,r13,0<3>
	mak	 r11,r12,0<3>
	cmp	 r13,r13,r11
	bb1.n	 ge,r13,@L9542
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r11,32
	bb0.n	 gt,r13,@L9202
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L9203
	addu	 r13,r12,6
@L9203:
	or	 r2,r0,r21
	or	 r3,r0,r22
	or	 r4,r0,0
	bsr.n	 _can_extend_p
	ext	 r18,r13,0<2>
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb1.n	 ne,r13,@L9543
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r24[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L9206
	or.u	 r24,r0,hi16(_word_mode)
	or	 r2,r0,r21
	ld	 r3,r24,lo16(_word_mode)
	bsr.n	 _can_extend_p
	or	 r4,r0,0
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0	 ne,r13,@L9206
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r3,r0,r23
	bsr.n	 _convert_move
	or	 r4,r0,0
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r4,r0,r2
	or	 r2,r0,r25
	br.n	 @L9497
	or	 r3,r0,r20
	align	 4
@L9206:
	bsr	 _start_sequence
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L9208
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r22,r13,lo16(_word_mode)
@L9208:
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,0
	or	 r24,r0,r2
	or	 r2,r0,r22
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
	or.u	 r25,r0,hi16(_mode_size)
	or	 r25,r25,lo16(_mode_size)
	ld	 r2,r25[r22]
	mak	 r2,r2,0<3>
	bsr.n	 _size_int
	subu	 r2,r2,1
	or	 r5,r0,r2
	or	 r2,r0,78
	or	 r3,r0,r22
	or	 r4,r0,r24
	or	 r6,r0,0
	bsr.n	 _expand_shift
	or	 r7,r0,0
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_word_mode)
	or	 r4,r0,1
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _convert_to_mode
	or	 r3,r0,r24
	ld	 r3,r25[r22]
	bcnd.n	 ge0,r3,@L9214
	or	 r24,r0,r2
	addu	 r3,r3,3
@L9214:
	ext	 r22,r3,0<2>
	cmp	 r13,r22,r18
	bb0.n	 lt,r13,@L9216
	subu	 r13,r18,r22
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L9218
	subu	 r25,r18,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L9395
	cmp	 r13,r12,2
	bb0.n	 gt,r13,@L9396
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L9400
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L9400:
	bb1	 eq,r13,@L9398
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L9398:
	addu	 r22,r22,1
@L9396:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L9404
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L9404:
	bb1	 eq,r13,@L9402
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L9402:
	addu	 r22,r22,1
@L9395:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L9408
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L9408:
	bb1	 eq,r13,@L9406
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L9406:
	addu	 r22,r22,1
	cmp	 r13,r22,r18
	bb0	 lt,r13,@L9216
@L9218:
	or	 r2,r0,r20
@L9544:
	subu	 r3,r25,1
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L9412
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L9412:
	bb1	 eq,r13,@L9410
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L9410:
	or	 r2,r0,r20
	subu	 r3,r25,2
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L9416
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L9416:
	bb1	 eq,r13,@L9414
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L9414:
	or	 r2,r0,r20
	subu	 r3,r25,3
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L9420
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L9420:
	bb1	 eq,r13,@L9418
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L9418:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,4
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L9424
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L9424:
	bb1	 eq,r13,@L9422
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L9422:
	addu	 r22,r22,4
	cmp	 r13,r22,r18
	bb1.n	 lt,r13,@L9544
	or	 r2,r0,r20
@L9216:
	bsr	 _get_insns
	bsr.n	 _end_sequence
	or	 r25,r0,r2
	or	 r2,r0,r16
	or	 r3,r0,r21
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r6,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_no_conflict_block
	subu	 r1,r1,@L9648
@L9649:
	align	 4
@L9202:
	or.u	 r13,r0,hi16(_mode_size)
@L9542:
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,32
	bb0.n	 gt,r13,@L9222
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r2,r13,lo16(_word_mode)
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	addu	 r1,r1,@L9650
@L9651:
	align	 4
@L9222:
	cmp	 r13,r21,3
	bb1.n	 ne,r13,@L9223
	cmp	 r13,r22,3
	cmp	 r13,r22,4
	bb0.n	 ne,r13,@L9224
	or	 r2,r0,4
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,0
@L9224:
	bsr	 _abort
	align	 4
@L9223:
	bb1.n	 ne,r13,@L9545
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r21,4
	bb0.n	 ne,r13,@L9226
	or	 r2,r0,4
	or	 r3,r0,r23
	or	 r4,r0,0
	bsr.n	 _convert_to_mode
	or	 r22,r0,4
	br.n	 @L9225
	or	 r23,r0,r2
	align	 4
@L9226:
	bsr	 _abort
	align	 4
@L9225:
	or.u	 r13,r0,hi16(_mode_size)
@L9545:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb1.n	 ge,r12,@L9546
	or.u	 r13,r0,hi16(_mode_size)
	ld	 r13,r0,r23
	or.u	 r12,r0,0x37
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L9230
	or.u	 r13,r0,hi16(_direct_load)
	or	 r13,r13,lo16(_direct_load)
	ld.b	 r13,r21,r13
	bcnd	 eq0,r13,@L9230
	bsr.n	 _mode_dependent_address_p
	ld	 r2,r23,4
	bcnd.n	 eq0,r2,@L9547
	or	 r2,r0,r21
@L9230:
	ld.hu	 r13,r0,r23
	cmp	 r12,r13,51
	cmp	 r13,r13,53
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L9228
	or	 r2,r0,r21
@L9547:
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	addu	 r1,r1,@L9652
@L9653:
	align	 4
@L9228:
	or.u	 r13,r0,hi16(_mode_size)
@L9546:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb0.n	 gt,r12,@L9231
	or	 r2,r0,r21
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,0
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0.n	 ne,r13,@L9232
	or.u	 r13,r0,hi16(_optimize)
@L9543:
	ld	 r13,r13,lo16(_optimize)
	bcnd	 le0,r13,@L9233
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L9548
	or	 r2,r0,r25
	or	 r2,r0,r22
	bsr.n	 _force_reg
	or	 r3,r0,r23
	or	 r23,r0,r2
@L9233:
	or	 r2,r0,r25
@L9548:
	or	 r3,r0,r20
	or	 r4,r0,r23
@L9497:
	or	 r5,r0,r16
	bsr.n	 _emit_unop_insn
	subu	 r1,r1,@L9654
@L9655:
	align	 4
@L9232:
	or	 r25,r0,r22
	bcnd.n	 eq0,r25,@L9236
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r24,r13,lo16(_mode_wider_mode)
	or	 r2,r0,r21
@L9549:
	or	 r3,r0,r25
	bsr.n	 _can_extend_p
	or	 r4,r0,0
	cmp	 r2,r2,210
	bb1.n	 eq,r2,@L9237
	or	 r2,r0,r25
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,0
	cmp	 r2,r2,210
	bb1.n	 ne,r2,@L9383
	or	 r2,r0,r25
@L9237:
	ld	 r25,r24[r25]
	bcnd.n	 ne0,r25,@L9549
	or	 r2,r0,r21
@L9236:
	bsr	 _abort
	align	 4
@L9231:
	cmp	 r13,r22,6
	extu	 r11,r13,1<eq>
	cmp	 r13,r21,4
	extu	 r13,r13,1<eq>
	and	 r13,r11,r13
	bcnd.n	 eq0,r13,@L9241
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L9656
@L9657:
	align	 4
@L9241:
	cmp	 r13,r21,2
	extu	 r9,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L9242
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L9658
@L9659:
	align	 4
@L9242:
	cmp	 r13,r21,1
	extu	 r10,r13,1<eq>
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L9243
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L9660
@L9661:
	align	 4
@L9243:
	cmp	 r13,r22,4
	extu	 r11,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L9244
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L9662
@L9663:
	align	 4
@L9244:
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L9245
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L9664
@L9665:
	align	 4
@L9245:
	cmp	 r13,r22,2
	extu	 r13,r13,1<eq>
	and	 r13,r13,r10
	bcnd.n	 eq0,r13,@L9246
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L9666
@L9667:
	align	 4
@L9246:
	bb1.n	 ge,r12,@L9247
	or	 r2,r0,r21
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	bsr.n	 _force_reg
	or	 r2,r0,r21
@L9496:
	or	 r3,r0,r2
	or	 r2,r0,r20
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L9668
@L9669:
	align	 4
@L9247:
	bsr	 _abort
	align	 4
@L9383:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,0
@L9498:
	or	 r3,r0,r2
	or	 r2,r0,r20
	or	 r4,r0,0
	bsr.n	 _convert_move
	subu	 r1,r1,@L9670
@L9671:
	align	 4
@L9248:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd.n	 eq0,r13,@L9513
	or	 r2,r0,r21
	bcnd	 eq0,r24,@L9295
	ld	 r13,r24,16
	ld	 r13,r13,4
	ld.bu	 r13,r13,8
	cmp	 r13,r13,13
	bb1.n	 ne,r13,@L9516
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r13,r0,r24
	bcnd	 eq0,r13,@L9295
	ld	 r12,r13,16
	ld	 r13,r12,4
	ld.bu	 r13,r13,8
	cmp	 r13,r13,13
	bb1.n	 ne,r13,@L9516
	or.u	 r13,r0,hi16(_const0_rtx)
	or	 r2,r0,r12
	ld.bu	 r12,r2,8
	subu	 r13,r12,101
	mask	 r13,r13,0xff
	addu	 r8,r31,88
	cmp	 r13,r13,1
	br.n	 @L9500
	or	 r10,r0,r2
	align	 4
@L9259:
	ld	 r11,r10,16
	ld	 r13,r10,4
	ld	 r12,r11,4
	ld.bu	 r13,r13,24
	ld.bu	 r12,r12,24
	cmp	 r13,r13,r12
	bb0	 eq,r13,@L9256
	or	 r10,r0,r11
	ld.bu	 r12,r10,8
	subu	 r13,r12,101
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
@L9500:
	bb1.n	 ls,r13,@L9259
	mask	 r13,r12,0xff
	cmp	 r13,r13,103
	bb1	 eq,r13,@L9259
@L9256:
	ld.bu	 r13,r10,8
	cmp	 r13,r13,106
	bb1	 ne,r13,@L9261
	ld	 r13,r10,16
	ld.bu	 r13,r13,8
	cmp	 r13,r13,28
	bb1.n	 ne,r13,@L9261
	or.u	 r13,r0,hi16(_integer_zero_node)
	ld	 r13,r13,lo16(_integer_zero_node)
	st	 r13,r0,r8
	ld	 r13,r10,16
	br.n	 @L9550
	or	 r2,r0,r13
	align	 4
@L9261:
	ld.bu	 r13,r10,8
	cmp	 r13,r13,53
	bb1	 ne,r13,@L9262
	ld	 r9,r10,16
	ld.bu	 r12,r9,8
	subu	 r13,r12,101
	mask	 r13,r13,0xff
	ld	 r10,r10,20
	br.n	 @L9501
	cmp	 r13,r13,1
	align	 4
@L9268:
	ld	 r11,r9,16
	ld	 r13,r9,4
	ld	 r12,r11,4
	ld.bu	 r13,r13,24
	ld.bu	 r12,r12,24
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L9502
	or	 r9,r0,r11
	ld.bu	 r12,r9,8
	subu	 r13,r12,101
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
@L9501:
	bb1.n	 ls,r13,@L9268
	mask	 r13,r12,0xff
	cmp	 r13,r13,103
	bb1	 eq,r13,@L9268
	br	 @L9502
	align	 4
@L9274:
	ld	 r11,r10,16
	ld	 r13,r10,4
	ld	 r12,r11,4
	ld.bu	 r13,r13,24
	ld.bu	 r12,r12,24
	cmp	 r13,r13,r12
	bb0	 eq,r13,@L9271
	or	 r10,r0,r11
@L9502:
	ld.bu	 r12,r10,8
	subu	 r13,r12,101
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L9274
	mask	 r13,r12,0xff
	cmp	 r13,r13,103
	bb1	 eq,r13,@L9274
@L9271:
	ld.bu	 r13,r9,8
	cmp	 r13,r13,106
	bb1	 ne,r13,@L9276
	ld	 r13,r9,16
	ld.bu	 r13,r13,8
	cmp	 r13,r13,28
	bb1	 ne,r13,@L9276
	st	 r10,r0,r8
	ld	 r13,r9,16
	br.n	 @L9550
	or	 r2,r0,r13
	align	 4
@L9276:
	ld.bu	 r13,r10,8
	cmp	 r13,r13,106
	bb1.n	 ne,r13,@L9254
	or	 r13,r0,0
	ld	 r13,r10,16
	ld.bu	 r13,r13,8
	cmp	 r13,r13,28
	bb1.n	 ne,r13,@L9254
	or	 r13,r0,0
	st	 r9,r0,r8
	ld	 r13,r10,16
	br.n	 @L9550
	or	 r2,r0,r13
	align	 4
@L9262:
	or	 r13,r0,0
@L9254:
	or	 r2,r0,r13
@L9550:
	bcnd	 eq0,r2,@L9505
	ld	 r10,r2,16
	ld	 r12,r31,88
	ld	 r2,r2,20
	bcnd	 eq0,r12,@L9378
	ld.bu	 r13,r12,8
	cmp	 r13,r13,25
	bb0	 ne,r13,@L9287
	bcnd.n	 le0,r10,@L9282
	or	 r12,r0,0
@L9284:
	ld.b	 r13,r2,r12
	bcnd.n	 eq0,r13,@L9505
	addu	 r12,r12,1
	cmp	 r13,r12,r10
	bb1	 lt,r13,@L9284
@L9282:
	bsr.n	 _size_int
	or	 r2,r0,r10
	ld	 r4,r31,88
	or	 r3,r0,r2
	or	 r2,r0,54
	bsr.n	 _size_binop
	addu	 r1,r1,@L9672
@L9673:
	align	 4
@L9378:
	br.n	 @L9288
	or	 r11,r0,0
	align	 4
@L9287:
	ld	 r13,r12,16
	bcnd.n	 ne0,r13,@L9253
	or	 r3,r0,0
	ld	 r11,r12,12
@L9288:
	cmp	 r13,r11,r10
	extu	 r12,r11,0<31>
	extu	 r13,r13,1<gt>
	or	 r12,r12,r13
	bcnd	 eq0,r12,@L9290
	or.u	 r2,r0,hi16(@LC4)
	bsr.n	 _warning
	or	 r2,r2,lo16(@LC4)
@L9505:
	br.n	 @L9253
	or	 r3,r0,0
	align	 4
@L9290:
	bsr.n	 _strlen
	addu	 r2,r2,r11
	bsr	 _size_int
@L9504:
	or	 r3,r0,r2
@L9253:
	bcnd.n	 eq0,r3,@L8832
	or.u	 r13,r0,hi16(_integer_one_node)
	ld	 r4,r13,lo16(_integer_one_node)
	bsr.n	 _size_binop
	or	 r2,r0,53
	or	 r3,r0,r2
	bsr.n	 _build_tree_list
	or	 r2,r0,0
	or	 r3,r0,r2
	bsr.n	 _chainon
	or	 r2,r0,r24
@L9292:
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r13,lo16(_optimize)
	bcnd	 eq0,r13,@L8832
	bcnd	 eq0,r24,@L9295
	ld	 r7,r24,16
	ld	 r13,r7,4
	ld.bu	 r13,r13,8
	cmp	 r13,r13,13
	bb1	 ne,r13,@L9295
	ld	 r12,r0,r24
	bcnd	 eq0,r12,@L9295
	ld	 r10,r12,16
	ld	 r11,r10,4
	ld.bu	 r13,r11,8
	cmp	 r13,r13,13
	bb1.n	 ne,r13,@L9516
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r13,r0,r12
	bcnd	 eq0,r13,@L9295
	ld	 r2,r13,16
	ld	 r13,r2,4
	ld.bu	 r13,r13,8
	cmp	 r13,r13,7
	bb0.n	 ne,r13,@L9294
	or	 r8,r0,64
@L9295:
	or.u	 r13,r0,hi16(_const0_rtx)
@L9516:
	ld	 r2,r13,lo16(_const0_rtx)
	br	 @L9376
	align	 4
@L9294:
	ld	 r13,r11,4
	or	 r17,r0,r10
	ld	 r9,r13,28
	or	 r6,r0,r7
	cmp	 r13,r9,64
	bb1.n	 ls,r13,@L9299
	or	 r16,r0,r2
	or	 r9,r0,64
@L9299:
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r7,r13,lo16(_tree_code_type)
@L9302:
	ld.bu	 r12,r10,8
	cmp	 r13,r12,103
	bb0.n	 ls,r13,@L9330
	cmp	 r13,r12,101
	bb0.n	 lo,r13,@L9306
	cmp	 r13,r12,53
	bb0.n	 ne,r13,@L9310
	or	 r12,r0,r9
	br	 @L9297
	align	 4
@L9330:
	cmp	 r13,r12,106
	bb0.n	 ne,r13,@L9316
	or	 r12,r0,r9
	br	 @L9297
	align	 4
@L9306:
	ld	 r10,r10,16
	ld	 r12,r10,4
	ld.bu	 r13,r12,8
	cmp	 r13,r13,13
	bb1	 ne,r13,@L9328
	ld	 r13,r12,4
	ld	 r12,r13,28
	cmp	 r13,r12,r8
	bb1	 ls,r13,@L9308
	or	 r12,r0,r8
@L9308:
	cmp	 r13,r9,r12
	bb1	 hs,r13,@L9302
	or	 r9,r0,r12
	br	 @L9302
	align	 4
@L9310:
	ld	 r12,r10,20
	ld.bu	 r13,r12,8
	cmp	 r13,r13,25
	bb1	 ne,r13,@L9328
	ld	 r13,r12,12
	br.n	 @L9506
	mak	 r12,r13,0<3>
	align	 4
@L9314:
	extu	 r8,r8,0<1>
@L9506:
	subu	 r13,r8,1
	and	 r13,r12,r13
	bcnd	 ne0,r13,@L9314
	ld	 r10,r10,16
	br	 @L9302
	align	 4
@L9316:
	ld	 r10,r10,16
	ld.bu	 r11,r10,8
	cmp	 r13,r11,29
	bb1.n	 ne,r13,@L9317
	cmp	 r13,r9,32
	bb0	 lo,r13,@L9319
	or	 r9,r0,32
	br.n	 @L9551
	cmp	 r13,r9,r8
	align	 4
@L9317:
	ld	 r13,r7[r11]
	ld.b	 r12,r0,r13
	cmp	 r13,r12,100
	bb1.n	 ne,r13,@L9320
	cmp	 r13,r12,99
	ld	 r11,r10,68
	cmp	 r13,r9,r11
	bb0.n	 ls,r13,@L9325
	or	 r12,r0,r9
	br.n	 @L9325
	or	 r12,r0,r11
	align	 4
@L9320:
	bb1.n	 ne,r13,@L9551
	cmp	 r13,r9,r8
	cmp	 r13,r11,28
	cmp	 r12,r9,63
	rot	 r11,r13,26
	or.c	 r13,r12,r11
	extu	 r13,r13,1<hi>
	bcnd.n	 eq0,r13,@L9325
	or	 r12,r0,64
	or	 r12,r0,r9
@L9325:
	or	 r9,r0,r12
@L9319:
	cmp	 r13,r9,r8
@L9551:
	bb0.n	 hi,r13,@L9297
	or	 r12,r0,r9
	br.n	 @L9297
	or	 r12,r0,r8
	align	 4
@L9328:
	or	 r12,r0,r9
@L9297:
	bcnd	 ge0,r12,@L9332
	addu	 r12,r12,7
@L9332:
	ld	 r11,r6,4
	ld.bu	 r13,r11,8
	ext	 r20,r12,0<3>
	or	 r9,r0,r6
	cmp	 r13,r13,13
	bb0.n	 ne,r13,@L9334
	or	 r8,r0,64
	br.n	 @L9333
	or	 r12,r0,0
	align	 4
@L9334:
	ld	 r13,r11,4
	ld	 r10,r13,28
	cmp	 r13,r10,64
	bb1	 ls,r13,@L9335
	or	 r10,r0,64
@L9335:
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r7,r13,lo16(_tree_code_type)
@L9338:
	ld.bu	 r12,r9,8
	cmp	 r13,r12,103
	bb0.n	 ls,r13,@L9366
	cmp	 r13,r12,101
	bb0.n	 lo,r13,@L9342
	cmp	 r13,r12,53
	bb0.n	 ne,r13,@L9346
	or	 r12,r0,r10
	br	 @L9333
	align	 4
@L9366:
	cmp	 r13,r12,106
	bb0.n	 ne,r13,@L9352
	or	 r12,r0,r10
	br	 @L9333
	align	 4
@L9342:
	ld	 r9,r9,16
	ld	 r12,r9,4
	ld.bu	 r13,r12,8
	cmp	 r13,r13,13
	bb1	 ne,r13,@L9364
	ld	 r13,r12,4
	ld	 r12,r13,28
	cmp	 r13,r12,r8
	bb1	 ls,r13,@L9344
	or	 r12,r0,r8
@L9344:
	cmp	 r13,r10,r12
	bb1	 hs,r13,@L9338
	or	 r10,r0,r12
	br	 @L9338
	align	 4
@L9346:
	ld	 r12,r9,20
	ld.bu	 r13,r12,8
	cmp	 r13,r13,25
	bb1	 ne,r13,@L9364
	ld	 r13,r12,12
	br.n	 @L9507
	mak	 r12,r13,0<3>
	align	 4
@L9350:
	extu	 r8,r8,0<1>
@L9507:
	subu	 r13,r8,1
	and	 r13,r12,r13
	bcnd	 ne0,r13,@L9350
	ld	 r9,r9,16
	br	 @L9338
	align	 4
@L9352:
	ld	 r9,r9,16
	ld.bu	 r11,r9,8
	cmp	 r13,r11,29
	bb1.n	 ne,r13,@L9353
	cmp	 r13,r10,32
	bb0	 lo,r13,@L9355
	or	 r10,r0,32
	br.n	 @L9552
	cmp	 r13,r10,r8
	align	 4
@L9353:
	ld	 r13,r7[r11]
	ld.b	 r12,r0,r13
	cmp	 r13,r12,100
	bb1.n	 ne,r13,@L9356
	cmp	 r13,r12,99
	ld	 r11,r9,68
	cmp	 r13,r10,r11
	bb0.n	 ls,r13,@L9361
	or	 r12,r0,r10
	br.n	 @L9361
	or	 r12,r0,r11
	align	 4
@L9356:
	bb1.n	 ne,r13,@L9552
	cmp	 r13,r10,r8
	cmp	 r13,r11,28
	cmp	 r12,r10,63
	rot	 r11,r13,26
	or.c	 r13,r12,r11
	extu	 r13,r13,1<hi>
	bcnd.n	 eq0,r13,@L9361
	or	 r12,r0,64
	or	 r12,r0,r10
@L9361:
	or	 r10,r0,r12
@L9355:
	cmp	 r13,r10,r8
@L9552:
	bb0.n	 hi,r13,@L9333
	or	 r12,r0,r10
	br.n	 @L9333
	or	 r12,r0,r8
	align	 4
@L9364:
	or	 r12,r0,r10
@L9333:
	bcnd	 ge0,r12,@L9368
	addu	 r12,r12,7
@L9368:
	ext	 r25,r12,0<3>
	cmp	 r13,r20,0
	cmp	 r12,r25,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L9369
	ld	 r13,r19,68
	cmp	 r13,r13,15
	bb0.n	 eq,r13,@L9513
	or	 r2,r0,r21
	ld	 r13,r0,r24
	br.n	 @L9513
	st	 r0,r0,r13
	align	 4
@L9369:
	or	 r2,r0,r6
	or	 r3,r0,0
	or	 r4,r0,4
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r22,r0,r2
	or	 r2,r0,16
	bsr.n	 _memory_address
	or	 r3,r0,r22
	or	 r4,r0,r2
	or	 r2,r0,55
	bsr.n	 _gen_rtx
	or	 r3,r0,16
	or	 r23,r0,r2
	or	 r2,r0,r17
	or	 r3,r0,0
	or	 r4,r0,4
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r3,r0,r2
	bsr.n	 _memory_address
	or	 r2,r0,16
	or	 r4,r0,r2
	or	 r2,r0,55
	bsr.n	 _gen_rtx
	or	 r3,r0,16
	or	 r24,r0,r2
	or	 r2,r0,r16
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r5,r0,r20
	cmp	 r13,r5,r25
	bb0.n	 gt,r13,@L9371
	or	 r4,r0,r2
	or	 r5,r0,r25
@L9371:
	or	 r2,r0,r23
	bsr.n	 _emit_block_move
	or	 r3,r0,r24
	br.n	 @L9376
	or	 r2,r0,r22
	align	 4
@L9374:
	ld	 r13,r19,32
	or.u	 r2,r0,hi16(@LC14)
	ld	 r3,r13,16
	bsr.n	 _error
	or	 r2,r2,lo16(@LC14)
@L8832:
	or	 r2,r0,r21
@L9513:
	or	 r3,r0,r18
	bsr.n	 _expand_call
	or	 r4,r0,r15
@L9376:
@Lte31:
	ld	 r1,r31,80
	ld	 r15,r31,36
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	jmp.n	 r1
	addu	 r31,r31,96
	def	 @L9672,@L9504-@L9673
	def	 @L9670,@L9671-@L9499
	def	 @L9668,@L9669-@L9499
	def	 @L9666,@L9498-@L9667
	def	 @L9664,@L9498-@L9665
	def	 @L9662,@L9498-@L9663
	def	 @L9660,@L9498-@L9661
	def	 @L9658,@L9498-@L9659
	def	 @L9656,@L9498-@L9657
	def	 @L9654,@L9655-@L9499
	def	 @L9652,@L9496-@L9653
	def	 @L9650,@L9498-@L9651
	def	 @L9648,@L9649-@L9499
	def	 @L9646,@L9496-@L9647
	def	 @L9644,@L9645-@L9499
	def	 @L9642,@L9643-@L9499
	def	 @L9640,@L9376-@L9641
	def	 @L9638,@L9639-@L9494
	def	 @L9636,@L9637-@L9494
	def	 @L9634,@L9493-@L9635
	def	 @L9632,@L9493-@L9633
	def	 @L9630,@L9493-@L9631
	def	 @L9628,@L9493-@L9629
	def	 @L9626,@L9493-@L9627
	def	 @L9624,@L9493-@L9625
	def	 @L9622,@L9623-@L9494
	def	 @L9620,@L9491-@L9621
	def	 @L9618,@L9493-@L9619
	def	 @L9616,@L9617-@L9494
	def	 @L9614,@L9491-@L9615
	def	 @L9612,@L9613-@L9494
	def	 @L9610,@L9611-@L9494
	def	 @L9608,@L9376-@L9609
	def	 @L9606,@L8926-@L9607
	def	 @L9604,@L9605-@L9494
	def	 @L9602,@L9376-@L9603
	def	 @L9600,@L9376-@L9601
	def	 @L9598,@L9376-@L9599
	def	 @L9596,@L9376-@L9597
	def	 @L9594,@L9376-@L9595
	def	 @L9592,@L9376-@L9593
	def	 @L9590,@L9376-@L9591
	def	 @L9588,@L9376-@L9589
	def	 @L9586,@L9376-@L9587
	def	 @L9584,@L9376-@L9585
	def	 @L9582,@L9376-@L9583
	def	 @L9580,@L9376-@L9581
	def	 @L9578,@L9376-@L9579
	def	 @L9576,@L9376-@L9577
	def	 @L9574,@L9376-@L9575
	def	 @L9572,@L9376-@L9573
	def	 @L9570,@L9376-@L9571
	def	 @L9568,@L9376-@L9569
	def	 @L9566,@L9376-@L9567
	def	 @L9564,@L9376-@L9565
	def	 @L9562,@L9376-@L9563
	def	 @L9560,@L9376-@L9561
	def	 @L9558,@L9295-@L9559
	def	 @L9556,@L9376-@L9557
	def	 @L9554,@L8832-@L9555

	align	 8
_expand_increment:
	subu	 r31,r31,128
	st	 r1,r31,96
	st	 r15,r31,52
	st.d	 r24,r31,88
	st.d	 r22,r31,80
	st.d	 r20,r31,72
	st.d	 r18,r31,64
	or	 r20,r0,r2
	st.d	 r16,r31,56
@Ltb32:
	ld	 r23,r20,16
	ld	 r13,r20,4
	or.u	 r12,r0,hi16(_add_optab)
	ld.bu	 r11,r23,8
	ld	 r19,r12,lo16(_add_optab)
	cmp	 r12,r11,38
	ld.bu	 r18,r13,24
	bb0.n	 ne,r12,@L9767
	or	 r15,r0,r3
	cmp	 r13,r11,37
	bb1	 ne,r13,@L9766
	ld	 r13,r23,16
	ld.bu	 r13,r13,8
	cmp	 r13,r13,39
	bb1	 ne,r13,@L9767
	ld	 r13,r23,20
	ld	 r13,r13,28
	bb0	 (31-12),r13,@L9766
@L9767:
	bsr.n	 _stabilize_reference
	or	 r2,r0,r23
	or	 r23,r0,r2
@L9766:
	bsr	 _get_last_insn
	or	 r16,r0,r2
	or	 r2,r0,r23
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r22,r0,r2
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	ld	 r13,r0,r22
	and	 r13,r13,0x8
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L9768
	bsr.n	 _copy_to_reg
	ld	 r2,r22,4
	st	 r2,r22,4
@L9768:
	ld.hu	 r13,r0,r22
	cmp	 r12,r13,53
	cmp	 r13,r13,51
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L9769
	or	 r24,r0,0
	bsr	 _get_last_insn
	cmp	 r2,r16,r2
	extu	 r24,r2,1<ne>
@L9769:
	ld	 r2,r20,20
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld.bu	 r13,r20,8
	cmp	 r12,r13,115
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L9770
	or	 r25,r0,r2
	or.u	 r13,r0,hi16(_sub_optab)
	ld	 r19,r13,lo16(_sub_optab)
@L9770:
	bcnd.n	 eq0,r24,@L9771
	or.u	 r13,r0,hi16(_add_optab)
	ld	 r13,r13,lo16(_add_optab)
	cmp	 r13,r19,r13
	bb1.n	 ne,r13,@L9772
	or	 r2,r0,54
	or	 r2,r0,53
@L9772:
	ld	 r3,r20,4
	ld	 r5,r20,20
	bsr.n	 _build
	or	 r4,r0,r23
	ld.bu	 r12,r23,8
	cmp	 r13,r15,0
	or	 r24,r0,0
	or	 r20,r0,r2
	mask	 r11,r12,0xff
	bcnd.n	 ne0,r11,@L9775
	extu	 r19,r13,1<eq>
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	br.n	 @L9774
	or	 r16,r0,r2
	align	 4
@L9775:
	subu	 r13,r12,37
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L9777
	cmp	 r13,r11,42
	bb1	 ne,r13,@L9776
	ld	 r13,r23,20
	ld.bu	 r13,r13,8
	cmp	 r13,r13,25
	bb1	 ne,r13,@L9776
	ld	 r13,r23,4
	ld	 r13,r13,16
	ld.bu	 r13,r13,8
	cmp	 r13,r13,25
	bb1	 ne,r13,@L9776
@L9777:
	or	 r2,r0,r23
	addu	 r3,r31,104
	addu	 r4,r31,108
	addu	 r5,r31,112
	addu	 r6,r31,116
	addu	 r7,r31,120
	addu	 r8,r31,124
	bsr.n	 _get_inner_reference
	st	 r0,r31,124
	ld	 r13,r31,116
	subu	 r12,r0,r19
	cmp	 r13,r13,0
	subu	 r12,r0,r12
	extu	 r13,r13,1<eq>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L9778
	or	 r21,r0,r2
	bsr	 _stabilize_reference
	or	 r21,r0,r2
@L9778:
	or	 r2,r0,r21
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld	 r13,r31,112
	bcnd.n	 eq0,r13,@L9779
	or	 r24,r0,r2
	or	 r2,r0,r13
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb0.n	 ne,r13,@L9780
	or	 r3,r0,r2
	bsr	 _abort
	align	 4
@L9780:
	or	 r2,r0,4
	bsr.n	 _force_reg
	ld	 r25,r24,4
	or	 r5,r0,r2
	or	 r2,r0,63
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L9779:
	ld	 r13,r31,124
	bcnd	 eq0,r13,@L9781
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1	 ne,r13,@L9781
	ld	 r13,r0,r24
	or	 r13,r13,16
	st	 r13,r0,r24
@L9781:
	bsr.n	 _int_size_in_bytes
	ld	 r2,r21,4
	ld	 r3,r31,104
	ld	 r4,r31,108
	ld	 r5,r31,116
	bcnd.n	 eq0,r19,@L9783
	or	 r12,r0,r2
	ld	 r13,r23,4
	ld.bu	 r7,r13,24
	br	 @L9784
	align	 4
@L9783:
	or	 r7,r0,0
@L9784:
	ld	 r13,r21,4
	ld	 r9,r13,28
	or	 r2,r0,r24
	ld	 r8,r31,120
	or	 r6,r0,r20
	extu	 r9,r9,0<3>
	st	 r12,r31,32
	bsr.n	 _store_field
	addu	 r1,r1,@L9871
@L9872:
	align	 4
@L9776:
	bcnd.n	 ne0,r24,@L9785
	or	 r2,r0,r23
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r24,r0,r2
@L9785:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,35
	bb1.n	 ne,r13,@L9862
	or	 r2,r0,r20
	ld.bu	 r13,r20,8
	cmp	 r13,r13,39
	bb1.n	 ne,r13,@L9863
	or	 r3,r0,r24
	or.u	 r13,r0,hi16(_current_function_returns_struct)
	ld	 r13,r13,lo16(_current_function_returns_struct)
	bcnd.n	 eq0,r13,@L9863
	or.u	 r13,r0,hi16(_current_function_returns_pcc_struct)
	ld	 r13,r13,lo16(_current_function_returns_pcc_struct)
	bcnd	 ne0,r13,@L9863
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r25,r0,r2
	bsr.n	 _expr_size
	or	 r2,r0,r20
	ld	 r6,r24,4
	ld	 r8,r25,4
	st	 r2,r31,32
	or	 r3,r0,0
	or	 r4,r0,0
	or	 r5,r0,3
	or.u	 r13,r0,hi16(_memcpy_libfunc)
	or	 r7,r0,4
	ld	 r2,r13,lo16(_memcpy_libfunc)
	or	 r9,r0,4
	or	 r13,r0,4
	bsr.n	 _emit_library_call
	st	 r13,r31,36
	br.n	 @L9858
	or	 r2,r0,r24
	align	 4
@L9862:
	or	 r3,r0,r24
@L9863:
	bsr.n	 _store_expr
	or	 r4,r0,r19
@L9857:
	or	 r25,r0,r2
@L9858:
	bsr.n	 _preserve_temp_slots
	or	 r16,r0,r2
	bsr	 _free_temp_slots
@L9774:
	bcnd.n	 eq0,r15,@L9856
	or	 r2,r0,r16
	br.n	 @L9856
	or	 r2,r0,r22
	align	 4
@L9771:
	or.u	 r13,r0,hi16(_sub_optab)
	ld	 r13,r13,lo16(_sub_optab)
	cmp	 r13,r19,r13
	bb1	 ne,r13,@L9789
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb1	 ne,r13,@L9789
	ld	 r4,r25,4
	or	 r2,r0,46
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	subu	 r4,r0,r4
	or.u	 r13,r0,hi16(_add_optab)
	or	 r25,r0,r2
	ld	 r19,r13,lo16(_add_optab)
@L9789:
	bcnd.n	 eq0,r15,@L9794
	lda.d	 r13,r19[r18]
	ld	 r23,r13,4
	cmp	 r13,r23,210
	bb0.n	 ne,r13,@L9790
	or.u	 r13,r0,hi16(_insn_operand_predicate)
	mul	 r24,r23,40
	or	 r21,r13,lo16(_insn_operand_predicate)
	or	 r2,r0,r22
	ld	 r13,r24,r21
	jsr.n	 r13
	or	 r3,r0,r18
	bcnd.n	 eq0,r2,@L9790
	addu	 r24,r24,r21
	or	 r2,r0,r22
	ld	 r13,r24,4
	jsr.n	 r13
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L9790
	ld	 r13,r24,8
	or	 r2,r0,r25
	jsr.n	 r13
	or	 r3,r0,r18
	bcnd.n	 ne0,r2,@L9864
	or.u	 r13,r0,hi16(_insn_gen_function)
	or	 r2,r0,r18
	bsr.n	 _force_reg
	or	 r3,r0,r25
	or	 r25,r0,r2
	or.u	 r13,r0,hi16(_insn_gen_function)
@L9864:
	or	 r2,r0,r22
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r3,r0,r22
	ld	 r13,r13[r23]
	jsr.n	 r13
	or	 r4,r0,r25
	ld.bu	 r3,r22,2
	or.u	 r25,r0,hi16(_pending_chain)
	or	 r7,r0,r2
	or	 r2,r0,59
	or	 r4,r0,r22
	or	 r5,r0,0
	ld	 r8,r25,lo16(_pending_chain)
	bsr.n	 _gen_rtx
	or	 r6,r0,0
	br.n	 @L9856
	st	 r2,r25,lo16(_pending_chain)
	align	 4
@L9790:
	bcnd.n	 eq0,r15,@L9865
	or	 r2,r0,r22
	bsr.n	 _copy_to_reg
	or	 r2,r0,r22
	or	 r16,r0,r2
	br.n	 @L9795
	or	 r24,r0,r16
	align	 4
@L9794:
	or	 r2,r0,r22
@L9865:
	bsr.n	 _copy_rtx
	or	 r24,r0,r22
	or	 r16,r0,r2
@L9795:
	ld	 r13,r20,4
	or	 r2,r0,r18
	or	 r3,r0,r19
	or	 r4,r0,r24
	or	 r5,r0,r25
	ld	 r7,r13,8
	or	 r6,r0,r22
	or	 r8,r0,3
	bsr.n	 _expand_binop
	extu	 r7,r7,1<17>
	or	 r25,r0,r2
	cmp	 r13,r25,r22
	bb0	 ne,r13,@L9796
	ld.hu	 r11,r0,r22
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r21,r22,2
	or	 r13,r13,lo16(_mode_class)
	cmp	 r12,r11,59
	ld	 r20,r13[r21]
	bb0.n	 ne,r12,@L9799
	or	 r24,r0,r25
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L9802
	cmp	 r13,r11,63
	ld	 r2,r22,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L9803
	st	 r2,r22,4
	align	 4
@L9802:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L9803
	ld	 r2,r22,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r22,4
	ld	 r2,r22,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r22,8
@L9803:
	br.n	 @L9798
	or	 r2,r0,r22
	align	 4
@L9799:
	ld	 r13,r22,8
	bcnd	 ne0,r13,@L9805
	ld	 r2,r22,4
	br	 @L9798
	align	 4
@L9805:
	ld	 r2,r22,12
	bcnd	 ne0,r2,@L9798
	ld	 r13,r22,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r22,4
	bsr.n	 _gen_move_insn
	st	 r2,r22,12
	bsr.n	 _emit_insn_before
	ld	 r3,r22,8
	ld	 r2,r22,12
@L9798:
	ld.hu	 r12,r0,r24
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L9808
	or	 r22,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L9866
	cmp	 r13,r12,63
	ld.bu	 r13,r24,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L9809
	ld	 r23,r24,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L9809
	ld	 r13,r23,4
	st	 r13,r24,4
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L9812
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r24,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r24
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	br.n	 @L9807
	or	 r2,r0,r25
	align	 4
@L9809:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L9811
	cmp	 r13,r12,63
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L9812
	st	 r2,r24,4
	align	 4
@L9811:
@L9866:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L9812
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,4
	ld	 r2,r24,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,8
@L9812:
	br.n	 @L9807
	or	 r2,r0,r24
	align	 4
@L9808:
	ld	 r13,r24,8
	bcnd	 ne0,r13,@L9814
	ld	 r2,r24,4
	br.n	 @L9867
	cmp	 r13,r21,16
	align	 4
@L9814:
	ld	 r2,r24,12
	bcnd.n	 ne0,r2,@L9867
	cmp	 r13,r21,16
	ld	 r13,r24,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r24,4
	bsr.n	 _gen_move_insn
	st	 r2,r24,12
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	ld	 r2,r24,12
@L9807:
	cmp	 r13,r21,16
@L9867:
	bb0.n	 ne,r13,@L9817
	or	 r24,r0,r2
	ld.bu	 r13,r24,2
	cmp	 r13,r13,r21
	bb0	 ne,r13,@L9816
	ld.bu	 r13,r24,2
	bcnd	 eq0,r13,@L9816
@L9817:
	bsr	 _abort
	align	 4
@L9816:
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L9819
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L9819
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L9818
@L9819:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,47
	bb1	 ne,r13,@L9818
	ld.bu	 r13,r24,2
	bcnd.n	 eq0,r13,@L9818
	or	 r2,r0,r21
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
@L9818:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,55
	bb1	 ne,r13,@L9820
	ld.bu	 r2,r22,2
	bsr.n	 _memory_address_p
	ld	 r3,r22,4
	bcnd.n	 ne0,r2,@L9868
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld.bu	 r3,r22,2
	bsr.n	 _push_operand
	or	 r2,r0,r22
	bcnd.n	 eq0,r2,@L9821
	or.u	 r13,r0,hi16(_flag_force_addr)
@L9868:
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L9820
	ld	 r13,r22,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L9821
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L9821
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L9820
@L9821:
	ld	 r4,r22,4
	or	 r2,r0,r22
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r22,r0,r2
@L9820:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L9869
	cmp	 r13,r21,16
	ld.bu	 r2,r24,2
	bsr.n	 _memory_address_p
	ld	 r3,r24,4
	bcnd.n	 eq0,r2,@L9824
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L9823
	ld	 r13,r24,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L9824
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L9824
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L9869
	cmp	 r13,r21,16
@L9824:
	ld	 r4,r24,4
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L9823:
	cmp	 r13,r21,16
@L9869:
	bb1.n	 ne,r13,@L9825
	subu	 r13,r20,5
	bsr	 _abort
	align	 4
@L9825:
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L9826
	or.u	 r13,r0,hi16(_mode_unit_size)
	or	 r13,r13,lo16(_mode_unit_size)
	ld	 r12,r13[r21]
	or	 r3,r0,2
	cmp	 r13,r20,5
	bb1.n	 ne,r13,@L9827
	mak	 r2,r12,0<3>
	or	 r3,r0,1
@L9827:
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	or	 r17,r0,r2
@L9826:
	or.u	 r23,r0,hi16(_mov_optab)
	ld	 r11,r23,lo16(_mov_optab)
	lda.d	 r13,r11[r21]
	ld	 r12,r13,4
	cmp	 r13,r12,210
	bb0.n	 ne,r13,@L9829
	or.u	 r13,r0,hi16(_insn_gen_function)
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r2,r0,r22
	ld	 r13,r13[r12]
	jsr.n	 r13
	or	 r3,r0,r24
	bsr.n	 _emit_insn
	addu	 r1,r1,@L9873
@L9874:
	align	 4
@L9829:
	cmp	 r12,r17,16
	subu	 r13,r20,5
	extu	 r12,r12,1<ne>
	cmp	 r13,r13,1
	extu	 r13,r13,1<ls>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L9831
	mak	 r25,r17,0<3>
	addu	 r13,r11,r25
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L9831
	ld.bu	 r3,r22,2
	bsr.n	 _push_operand
	or	 r2,r0,r22
	bsr.n	 _get_last_insn
	or	 r21,r0,r2
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L9832
	or	 r19,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r22
	bsr	 _emit_insn
@L9832:
	ld	 r13,r23,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	addu	 r13,r13,r25
	ld	 r23,r13,4
	bcnd.n	 eq0,r21,@L9833
	or	 r20,r12,lo16(_insn_gen_function)
	or	 r2,r0,r22
	or	 r3,r0,r17
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L9875
@L9876:
	align	 4
@L9833:
	or	 r2,r0,r17
	bsr.n	 _gen_highpart
	or	 r3,r0,r22
@L9859:
	or	 r25,r0,r2
	or	 r2,r0,r17
	bsr.n	 _gen_highpart
	or	 r3,r0,r24
	ld	 r13,r20[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r13,r13,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	lda.d	 r13,r13[r17]
	ld	 r23,r13,4
	bcnd.n	 eq0,r21,@L9835
	or	 r20,r12,lo16(_insn_gen_function)
	or	 r2,r0,r22
	or	 r3,r0,r17
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L9877
@L9878:
	align	 4
@L9835:
	or	 r2,r0,r17
	bsr.n	 _gen_lowpart
	or	 r3,r0,r22
@L9860:
	or	 r25,r0,r2
	or	 r2,r0,r17
	bsr.n	 _gen_lowpart
	or	 r3,r0,r24
	ld	 r13,r20[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	bcnd	 eq0,r19,@L9838
	ld	 r24,r19,12
	br	 @L9839
	align	 4
@L9838:
	bsr	 _get_insns
	or	 r24,r0,r2
@L9839:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	st	 r2,r24,28
	bsr.n	 _get_last_insn
	addu	 r1,r1,@L9879
@L9880:
	align	 4
@L9831:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r23,r13,lo16(_mode_size)
	ld	 r13,r23[r21]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L9841
	bsr.n	 _get_last_insn
	or	 r25,r0,0
	or	 r20,r0,r2
	or	 r19,r0,r23
@L9842:
	ld	 r12,r19[r21]
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L9846
	addu	 r13,r12,6
@L9846:
	ext	 r13,r13,0<2>
	cmp	 r13,r25,r13
	bb0.n	 lt,r13,@L9843
	or	 r2,r0,r22
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	or	 r23,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	or	 r3,r0,r2
	bcnd.n	 ne0,r3,@L9870
	cmp	 r13,r23,0
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L9848
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L9848
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L9847
	or	 r2,r0,r24
@L9848:
	or	 r2,r0,r21
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r3,r0,r25
	or	 r4,r0,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	addu	 r1,r1,@L9881
@L9882:
	align	 4
@L9847:
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r21
@L9861:
	or	 r3,r0,r2
	cmp	 r13,r23,0
@L9870:
	cmp	 r12,r3,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L9851
	or	 r2,r0,r23
	bsr	 _abort
	align	 4
@L9851:
	addu	 r25,r25,1
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L9883
@L9884:
	align	 4
@L9843:
	bcnd	 eq0,r20,@L9853
	ld	 r24,r20,12
	br	 @L9854
	align	 4
@L9853:
	bsr	 _get_insns
	or	 r24,r0,r2
@L9854:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	br.n	 @L9796
	st	 r2,r24,28
	align	 4
@L9841:
	bsr	 _abort
	align	 4
@L9796:
	or	 r2,r0,r16
@L9856:
@Lte32:
	ld	 r1,r31,96
	ld	 r15,r31,52
	ld.d	 r24,r31,88
	ld.d	 r22,r31,80
	ld.d	 r20,r31,72
	ld.d	 r18,r31,64
	ld.d	 r16,r31,56
	jmp.n	 r1
	addu	 r31,r31,128
	def	 @L9883,@L9884-@L9842
	def	 @L9881,@L9861-@L9882
	def	 @L9879,@L9796-@L9880
	def	 @L9877,@L9860-@L9878
	def	 @L9875,@L9859-@L9876
	def	 @L9873,@L9796-@L9874
	def	 @L9871,@L9857-@L9872

	align	 8
_preexpand_calls:
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r13,r13,lo16(_tree_code_type)
	subu	 r31,r31,64
	st	 r1,r31,48
	st.d	 r24,r31,40
	or	 r25,r0,r2
	st	 r23,r31,36
@Ltb33:
	ld.bu	 r10,r25,8
	or.u	 r12,r0,hi16(_do_preexpand_calls)
	ld	 r13,r13[r10]
	ld	 r12,r12,lo16(_do_preexpand_calls)
	ld.b	 r11,r0,r13
	bcnd.n	 eq0,r12,@L9915
	cmp	 r13,r11,101
	cmp	 r12,r11,60
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L9917
	subu	 r13,r11,49
	cmp	 r12,r11,114
	cmp	 r13,r13,1
	rot	 r11,r12,26
	and.c	 r12,r13,r11
	extu	 r12,r12,1<hi>
	bcnd	 ne0,r12,@L9915
@L9917:
	cmp	 r13,r10,52
	bb0	 ne,r13,@L9915
	bb0.n	 ls,r13,@L9934
	cmp	 r13,r10,44
	bb0	 ne,r13,@L9926
	bb0.n	 ls,r13,@L9935
	cmp	 r13,r10,5
	bb0.n	 ne,r13,@L9915
	or.u	 r13,r0,hi16(_tree_code_length)
	br	 @L9960
	align	 4
@L9935:
	cmp	 r13,r10,48
	bb0.n	 ne,r13,@L9926
	cmp	 r13,r10,50
	bb0.n	 ne,r13,@L9919
	or.u	 r13,r0,hi16(_tree_code_length)
	br	 @L9960
	align	 4
@L9934:
	cmp	 r13,r10,104
	bb0	 ne,r13,@L9930
	bb0.n	 ls,r13,@L9936
	cmp	 r13,r10,87
	bb0.n	 ls,r13,@L9918
	cmp	 r13,r10,86
	bb1.n	 lo,r13,@L9960
	or.u	 r13,r0,hi16(_tree_code_length)
	br	 @L9926
	align	 4
@L9936:
	cmp	 r13,r10,105
	bb0.n	 ne,r13,@L9915
	or.u	 r13,r0,hi16(_tree_code_length)
	br	 @L9960
	align	 4
@L9919:
	ld	 r13,r25,24
	bcnd	 ne0,r13,@L9915
	ld	 r12,r25,16
	ld.bu	 r13,r12,8
	cmp	 r13,r13,106
	bb1.n	 ne,r13,@L9961
	or	 r2,r0,r25
	ld	 r12,r12,16
	ld.bu	 r13,r12,8
	cmp	 r13,r13,29
	bb1.n	 ne,r13,@L9962
	or	 r3,r0,0
	ld	 r13,r12,28
	bb1	 (31-12),r13,@L9915
@L9961:
	or	 r3,r0,0
@L9962:
	bsr.n	 _expand_call
	or	 r4,r0,0
	br.n	 @L9915
	st	 r2,r25,24
	align	 4
@L9926:
	bsr.n	 _do_pending_stack_adjust
	addu	 r1,r1,@L9963
@L9964:
	align	 4
@L9930:
	ld	 r13,r25,24
	bcnd	 ne0,r13,@L9915
@L9918:
	or.u	 r13,r0,hi16(_tree_code_length)
@L9960:
	ld.bu	 r12,r25,8
	ld	 r13,r13,lo16(_tree_code_length)
	ld	 r23,r13[r12]
	bcnd.n	 le0,r23,@L9915
	or	 r24,r0,0
	bb0	 (31-31),r23,@L9940
	ld	 r2,r25,16
	bcnd.n	 eq0,r2,@L9948
	or.u	 r13,r0,hi16(_tree_code_type)
	ld.bu	 r12,r2,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r11,r0,r13
	cmp	 r13,r11,101
	cmp	 r12,r11,60
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L9950
	subu	 r13,r11,49
	cmp	 r12,r11,114
	cmp	 r13,r13,1
	rot	 r11,r13,6
	or.c	 r13,r12,r11
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L9948
@L9950:
	bsr	 _preexpand_calls
@L9948:
	addu	 r24,r24,1
	cmp	 r13,r24,r23
	bb0.n	 lt,r13,@L9915
	addu	 r25,r25,4
@L9940:
	ld	 r2,r25,16
	bcnd.n	 eq0,r2,@L9952
	or.u	 r13,r0,hi16(_tree_code_type)
	ld.bu	 r12,r2,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r11,r0,r13
	cmp	 r13,r11,101
	cmp	 r12,r11,60
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L9954
	subu	 r13,r11,49
	cmp	 r12,r11,114
	cmp	 r13,r13,1
	rot	 r11,r13,6
	or.c	 r13,r12,r11
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L9952
@L9954:
	bsr	 _preexpand_calls
@L9952:
	ld	 r2,r25,20
	bcnd.n	 eq0,r2,@L9956
	or.u	 r13,r0,hi16(_tree_code_type)
	ld.bu	 r12,r2,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r11,r0,r13
	cmp	 r13,r11,101
	cmp	 r12,r11,60
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L9958
	subu	 r13,r11,49
	cmp	 r12,r11,114
	cmp	 r13,r13,1
	rot	 r11,r13,6
	or.c	 r13,r12,r11
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L9956
@L9958:
	bsr	 _preexpand_calls
@L9956:
	addu	 r24,r24,2
	cmp	 r13,r24,r23
	bb1.n	 lt,r13,@L9940
	addu	 r25,r25,8
@L9915:
@Lte33:
	ld	 r1,r31,48
	ld	 r23,r31,36
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64
	def	 @L9963,@L9915-@L9964

	align	 8
	global	 _init_pending_stack_adjust
_init_pending_stack_adjust:
@Ltb34:
	or.u	 r9,r0,hi16(_pending_stack_adjust)
	jmp.n	 r1
	st	 r0,r9,lo16(_pending_stack_adjust)
@Lte34:

	align	 8
	global	 _clear_pending_stack_adjust
_clear_pending_stack_adjust:
	or.u	 r13,r0,hi16(_flag_omit_frame_pointer)
	ld	 r13,r13,lo16(_flag_omit_frame_pointer)
	subu	 r31,r31,48
	bcnd.n	 ne0,r13,@L9972
	st	 r1,r31,36
@Ltb35:
	bsr	 _get_frame_size
	bcnd.n	 ne0,r2,@L9975
	or.u	 r13,r0,hi16(_current_function_decl)
	or.u	 r13,r0,hi16(_current_function_calls_alloca)
	ld	 r13,r13,lo16(_current_function_calls_alloca)
	bcnd.n	 ne0,r13,@L9975
	or.u	 r13,r0,hi16(_current_function_decl)
	or.u	 r13,r0,hi16(_current_function_outgoing_args_size)
	ld	 r13,r13,lo16(_current_function_outgoing_args_size)
	bcnd.n	 eq0,r13,@L9972
	or.u	 r13,r0,hi16(_current_function_decl)
@L9975:
	ld	 r13,r13,lo16(_current_function_decl)
	ld	 r13,r13,28
	bb0.n	 (31-11),r13,@L9974
	or.u	 r13,r0,hi16(_flag_no_inline)
	ld	 r13,r13,lo16(_flag_no_inline)
	bcnd	 eq0,r13,@L9972
@L9974:
	or.u	 r13,r0,hi16(_flag_inline_functions)
	ld	 r13,r13,lo16(_flag_inline_functions)
	bcnd.n	 ne0,r13,@L9972
	or.u	 r13,r0,hi16(_pending_stack_adjust)
	st	 r0,r13,lo16(_pending_stack_adjust)
@L9972:
@Lte35:
	ld	 r1,r31,36
	jmp.n	 r1
	addu	 r31,r31,48

	align	 8
	global	 _do_pending_stack_adjust
_do_pending_stack_adjust:
	or.u	 r13,r0,hi16(_inhibit_defer_pop)
	ld	 r13,r13,lo16(_inhibit_defer_pop)
	subu	 r31,r31,48
	st	 r1,r31,36
	bcnd.n	 ne0,r13,@L9980
	st	 r25,r31,32
@Ltb36:
	or.u	 r25,r0,hi16(_pending_stack_adjust)
	ld	 r4,r25,lo16(_pending_stack_adjust)
	bcnd.n	 eq0,r4,@L9981
	or	 r2,r0,46
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr	 _adjust_stack
@L9981:
	st	 r0,r25,lo16(_pending_stack_adjust)
@L9980:
@Lte36:
	ld	 r1,r31,36
	ld	 r25,r31,32
	jmp.n	 r1
	addu	 r31,r31,48

	align	 8
	global	 _expand_cleanups_to
_expand_cleanups_to:
	or.u	 r12,r0,hi16(_cleanups_this_call)
	ld	 r13,r12,lo16(_cleanups_this_call)
	subu	 r31,r31,64
	st.d	 r24,r31,40
	or	 r24,r0,r2
	cmp	 r13,r13,r24
	bb0.n	 ne,r13,@L9989
	st	 r1,r31,48
@Ltb37:
	or	 r25,r0,r12
@L9990:
	ld	 r13,r25,lo16(_cleanups_this_call)
	or	 r3,r0,0
	or	 r4,r0,0
	ld	 r2,r13,16
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld	 r13,r25,lo16(_cleanups_this_call)
	ld	 r13,r0,r13
	cmp	 r12,r13,r24
	bb1.n	 ne,r12,@L9990
	st	 r13,r25,lo16(_cleanups_this_call)
@L9989:
@Lte37:
	ld	 r1,r31,48
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64

	align	 8
	global	 _jumpifnot
_jumpifnot:
	subu	 r31,r31,48
	st	 r1,r31,36
@Ltb38:
	bsr.n	 _do_jump
	or	 r4,r0,0
@Lte38:
	ld	 r1,r31,36
	jmp.n	 r1
	addu	 r31,r31,48

	align	 8
	global	 _jumpif
_jumpif:
	subu	 r31,r31,48
	or	 r4,r0,r3
	st	 r1,r31,36
@Ltb39:
	bsr.n	 _do_jump
	or	 r3,r0,0
@Lte39:
	ld	 r1,r31,36
	jmp.n	 r1
	addu	 r31,r31,48

	align	 8
	global	 _do_jump
_do_jump:
	subu	 r31,r31,112
	or.u	 r13,r0,hi16(_pending_chain)
	st.d	 r24,r31,72
	ld	 r25,r13,lo16(_pending_chain)
	st	 r1,r31,80
	st	 r15,r31,36
	or	 r24,r0,r2
	st.d	 r20,r31,56
	or	 r21,r0,r3
	st.d	 r22,r31,64
	or	 r20,r0,r4
	st.d	 r16,r31,40
	or	 r16,r0,0
	st.d	 r18,r31,48
@Ltb40:
	ld.bu	 r23,r24,8
	bcnd.n	 eq0,r25,@L10150
	or	 r18,r0,0
	or	 r22,r0,r13
@L10153:
	bsr.n	 _emit_insn
	ld	 r2,r25,16
	ld	 r13,r25,20
	st	 r2,r25,8
	or	 r25,r0,r13
	bcnd.n	 ne0,r25,@L10153
	st	 r25,r22,lo16(_pending_chain)
@L10150:
	or.u	 r13,r0,hi16(@L10284)
	cmp	 r12,r23,107
	bb0.n	 ls,r12,@L10164
	or	 r13,r13,lo16(@L10284)
	ld	 r13,r13[r23]
	jmp	 r13
	align	 4
@L10284:
	word	 @L10155
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10157
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10192
	word	 @L10192
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10192
	word	 @L10164
	word	 @L10181
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10236
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10173
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10304
	word	 @L10164
	word	 @L10164
	word	 @L10304
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10304
	word	 @L10304
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10177
	word	 @L10179
	word	 @L10164
	word	 @L10164
	word	 @L10306
	word	 @L10258
	word	 @L10261
	word	 @L10264
	word	 @L10267
	word	 @L10248
	word	 @L10253
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10165
	word	 @L10161
	word	 @L10304
	word	 @L10164
	word	 @L10164
	word	 @L10164
	word	 @L10304
	align	 4
@L10157:
	or	 r2,r0,r24
	bsr.n	 _integer_zerop
	or	 r25,r0,r20
	bcnd	 eq0,r2,@L10158
	or	 r25,r0,r21
@L10158:
	bcnd.n	 eq0,r25,@L10155
	or	 r2,r0,r25
	bsr.n	 _emit_jump
	addu	 r1,r1,@L10328
@L10329:
	align	 4
@L10161:
	ld	 r13,r24,16
	ld.bu	 r12,r13,8
	subu	 r13,r12,37
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L10164
	mask	 r13,r12,0xff
	cmp	 r13,r13,42
	bb0.n	 ne,r13,@L10316
	or	 r2,r0,r24
@L10165:
	ld	 r13,r24,16
	ld	 r12,r24,4
	ld	 r11,r13,4
	ld.bu	 r13,r12,25
	ld.bu	 r12,r11,25
	cmp	 r13,r13,r12
	bb1.n	 lo,r13,@L10316
	or	 r2,r0,r24
	br	 @L10304
	align	 4
@L10173:
	ld	 r3,r24,4
	ld	 r4,r24,16
	ld	 r5,r24,20
	bsr.n	 _build
	or	 r2,r0,96
	or	 r3,r0,89
	br.n	 @L10305
	or	 r4,r0,89
	align	 4
@L10177:
	bcnd	 ne0,r21,@L10178
	bsr	 _gen_label_rtx
	or	 r16,r0,r2
	or	 r21,r0,r2
@L10178:
	ld	 r2,r24,16
	or	 r3,r0,r21
	bsr.n	 _do_jump
	or	 r4,r0,0
	ld	 r2,r24,20
	br.n	 @L10317
	or	 r3,r0,r21
	align	 4
@L10179:
	bcnd	 ne0,r20,@L10180
	bsr	 _gen_label_rtx
	or	 r16,r0,r2
	or	 r20,r0,r2
@L10180:
	ld	 r2,r24,16
	or	 r3,r0,0
	bsr.n	 _do_jump
	or	 r4,r0,r20
	ld	 r2,r24,20
	br.n	 @L10317
	or	 r3,r0,r21
	align	 4
@L10181:
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r2,r24,16
	or	 r4,r0,0
	ld	 r3,r13,lo16(_const0_rtx)
	bsr.n	 _expand_expr
	or	 r5,r0,0
	bsr	 _free_temp_slots
	or.u	 r13,r0,hi16(_pending_chain)
	ld	 r25,r13,lo16(_pending_chain)
	bcnd	 eq0,r25,@L10182
	or	 r23,r0,r13
@L10185:
	bsr.n	 _emit_insn
	ld	 r2,r25,16
	ld	 r13,r25,20
	st	 r2,r25,8
	or	 r25,r0,r13
	bcnd.n	 ne0,r25,@L10185
	st	 r25,r23,lo16(_pending_chain)
@L10182:
	or.u	 r13,r0,hi16(_inhibit_defer_pop)
	ld	 r13,r13,lo16(_inhibit_defer_pop)
	bcnd.n	 ne0,r13,@L10187
	or.u	 r25,r0,hi16(_pending_stack_adjust)
	ld	 r4,r25,lo16(_pending_stack_adjust)
	bcnd.n	 eq0,r4,@L10189
	or	 r2,r0,46
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr	 _adjust_stack
@L10189:
	st	 r0,r25,lo16(_pending_stack_adjust)
@L10187:
	ld	 r2,r24,20
	br.n	 @L10317
	or	 r3,r0,r21
	align	 4
@L10192:
	st	 r0,r31,108
	ld.bu	 r12,r24,8
	or	 r23,r0,r24
	or	 r10,r0,0
	or	 r19,r0,0
	or	 r22,r0,0
	addu	 r15,r31,88
	cmp	 r13,r12,37
	bb1.n	 ne,r13,@L10194
	addu	 r17,r31,108
	ld	 r12,r24,20
	ld	 r13,r12,28
	ld	 r10,r12,20
	bb1	 (31-12),r13,@L10195
	ld.bu	 r19,r12,28
@L10195:
	ld	 r13,r12,8
	br.n	 @L10318
	extu	 r13,r13,1<17>
	align	 4
@L10194:
	cmp	 r13,r12,38
	bb1.n	 ne,r13,@L10197
	or.u	 r12,r0,hi16(_mode_size)
	ld	 r13,r24,8
	ld	 r10,r24,20
	extu	 r13,r13,1<17>
@L10318:
	br.n	 @L10196
	st	 r13,r31,104
	align	 4
@L10197:
	ld	 r13,r24,4
	ld	 r11,r24,4
	ld.bu	 r19,r13,24
	or	 r12,r12,lo16(_mode_size)
	ld	 r13,r11,8
	ld	 r12,r12[r19]
	extu	 r13,r13,1<17>
	st	 r13,r31,104
	mak	 r12,r12,0<3>
	st	 r12,r31,88
@L10196:
	bcnd	 eq0,r10,@L10199
	ld.bu	 r13,r10,8
	cmp	 r13,r13,25
	bb0.n	 ne,r13,@L10200
	subu	 r13,r0,1
	st	 r13,r0,r15
	br.n	 @L10199
	or	 r19,r0,16
	align	 4
@L10200:
	ld	 r13,r10,12
	st	 r13,r0,r15
@L10199:
	st	 r0,r31,92
@L10204:
	ld.bu	 r13,r23,8
	cmp	 r13,r13,39
	bb1.n	 ne,r13,@L10205
	or.u	 r13,r0,hi16(_flag_volatile)
	ld	 r13,r13,lo16(_flag_volatile)
	bcnd.n	 eq0,r13,@L10205
	or	 r13,r0,1
	st	 r13,r0,r17
@L10205:
	ld.bu	 r12,r23,8
	subu	 r13,r12,37
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L10206
	mask	 r13,r12,0xff
	cmp	 r13,r13,37
	bb1	 ne,r13,@L10207
	ld	 r13,r23,20
	ld	 r25,r13,40
	br	 @L10208
	align	 4
@L10207:
	ld	 r25,r23,24
@L10208:
	ld.bu	 r12,r25,8
	cmp	 r13,r12,53
	bb1.n	 ne,r13,@L10209
	cmp	 r13,r12,25
	ld	 r12,r25,16
	ld.bu	 r13,r12,8
	cmp	 r13,r13,25
	bb1	 ne,r13,@L10210
	ld	 r25,r25,20
	br.n	 @L10211
	or	 r3,r0,r12
	align	 4
@L10210:
	ld	 r3,r25,20
	ld.bu	 r13,r3,8
	cmp	 r13,r13,25
	bb0.n	 ne,r13,@L10211
	or	 r25,r0,r12
	bsr	 _abort
	align	 4
@L10211:
	ld	 r13,r31,92
	ld	 r12,r3,12
	addu	 r13,r13,r12
	bcnd.n	 eq0,r22,@L10219
	st	 r13,r31,92
	bsr.n	 _size_int
	or	 r2,r0,8
	or	 r4,r0,r2
	or	 r2,r0,58
	bsr.n	 _size_binop
	or	 r3,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,53
	br.n	 @L10309
	or	 r3,r0,r22
	align	 4
@L10209:
	bb1	 ne,r13,@L10217
	ld	 r12,r25,12
	ld	 r13,r31,92
	br.n	 @L10319
	addu	 r13,r13,r12
	align	 4
@L10217:
	bcnd	 eq0,r22,@L10219
	bsr.n	 _size_int
	or	 r2,r0,8
	or	 r4,r0,r2
	or	 r2,r0,58
	bsr.n	 _size_binop
	or	 r3,r0,r25
	or	 r4,r0,r2
	or	 r2,r0,53
	br.n	 @L10309
	or	 r3,r0,r22
	align	 4
@L10219:
	bsr.n	 _size_int
	or	 r2,r0,8
	or	 r4,r0,r2
	or	 r2,r0,58
	or	 r3,r0,r25
@L10309:
	bsr	 _size_binop
	br.n	 @L10221
	or	 r22,r0,r2
	align	 4
@L10206:
	cmp	 r13,r13,42
	bb1	 ne,r13,@L10222
	ld	 r12,r23,20
	ld.bu	 r13,r12,8
	cmp	 r13,r13,25
	bb1	 ne,r13,@L10222
	ld	 r13,r23,4
	ld	 r11,r13,16
	ld.bu	 r13,r11,8
	cmp	 r13,r13,25
	bb1	 ne,r13,@L10222
	ld	 r12,r12,12
	ld	 r13,r11,12
	mul	 r12,r12,r13
	ld	 r13,r31,92
	addu	 r13,r13,r12
@L10319:
	br.n	 @L10221
	st	 r13,r31,92
	align	 4
@L10222:
	ld.bu	 r12,r23,8
	mask	 r13,r12,0xff
	cmp	 r13,r13,103
	bb0.n	 ne,r13,@L10221
	subu	 r13,r12,101
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb0	 ls,r13,@L10203
	ld	 r13,r23,16
	ld	 r12,r23,4
	ld	 r11,r13,4
	ld.bu	 r13,r12,24
	ld.bu	 r12,r11,24
	cmp	 r13,r13,r12
	bb0	 eq,r13,@L10203
@L10221:
	ld	 r13,r23,8
	bb0.n	 (31-12),r13,@L10226
	or	 r13,r0,1
	st	 r13,r0,r17
@L10226:
	ld	 r23,r23,16
	br	 @L10204
	align	 4
@L10203:
	bcnd	 ne0,r19,@L10228
	ld	 r11,r0,r15
	ld	 r12,r31,92
	bcnd.n	 gt0,r11,@L10230
	subu	 r10,r0,r11
	bcnd.n	 ge0,r12,@L10231
	subu	 r13,r0,r12
	divu	 r13,r13,r10
	bcnd	 ne0,r11,@L10229
@L10233:
	tb0	 0,r0,503
	br	 @L10229
	align	 4
@L10231:
	divu	 r13,r12,r10
	bcnd	 eq0,r11,@L10233
	subu	 r13,r0,r13
	br	 @L10229
	align	 4
@L10230:
	bcnd.n	 ge0,r12,@L10232
	subu	 r13,r0,r12
	divu	 r13,r13,r11
	br.n	 @L10229
	subu	 r13,r0,r13
	align	 4
@L10232:
	divu	 r13,r12,r11
@L10229:
	ld	 r2,r0,r15
	mul	 r13,r13,r2
	subu	 r13,r12,r13
	bcnd.n	 ne0,r13,@L10228
	or	 r3,r0,1
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	or	 r19,r0,r2
	cmp	 r13,r19,16
	ext	 r13,r13,1<ne>
	and	 r19,r19,r13
@L10228:
	ld	 r2,r31,88
	ld	 r3,r31,104
	st	 r19,r31,100
	st	 r22,r31,96
	bsr.n	 _type_for_size
	addu	 r1,r1,@L10330
@L10331:
	align	 4
@L10236:
	bsr.n	 _integer_onep
	ld	 r2,r24,20
	bcnd	 eq0,r2,@L10237
	bsr.n	 _integer_zerop
	ld	 r2,r24,24
	bcnd	 ne0,r2,@L10304
@L10237:
	bsr.n	 _integer_zerop
	ld	 r2,r24,20
	bcnd	 eq0,r2,@L10239
	bsr.n	 _integer_onep
	ld	 r2,r24,24
	bcnd	 ne0,r2,@L10306
@L10239:
	bsr	 _gen_label_rtx
	bsr.n	 _gen_label_rtx
	or	 r23,r0,r2
	or	 r16,r0,r2
	ld	 r2,r24,16
	or	 r4,r0,0
	bsr.n	 _do_jump
	or	 r3,r0,r23
	ld	 r2,r24,20
	bcnd.n	 ne0,r21,@L10241
	or	 r3,r0,r21
	or	 r3,r0,r16
@L10241:
	bcnd.n	 ne0,r20,@L10242
	or	 r4,r0,r20
	or	 r4,r0,r16
@L10242:
	bsr	 _do_jump
	or.u	 r13,r0,hi16(_inhibit_defer_pop)
	ld	 r13,r13,lo16(_inhibit_defer_pop)
	bcnd.n	 ne0,r13,@L10243
	or.u	 r25,r0,hi16(_pending_stack_adjust)
	ld	 r4,r25,lo16(_pending_stack_adjust)
	bcnd.n	 eq0,r4,@L10245
	or	 r2,r0,46
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr	 _adjust_stack
@L10245:
	st	 r0,r25,lo16(_pending_stack_adjust)
@L10243:
	bsr.n	 _emit_label
	or	 r2,r0,r23
	ld	 r2,r24,24
	bcnd.n	 ne0,r21,@L10246
	or	 r3,r0,r21
	or	 r3,r0,r16
@L10246:
	bcnd.n	 ne0,r20,@L10312
	or	 r4,r0,r20
	br.n	 @L10312
	or	 r4,r0,r16
	align	 4
@L10248:
	bsr.n	 _integer_zerop
	ld	 r2,r24,20
	bcnd	 eq0,r2,@L10249
@L10306:
	ld	 r2,r24,16
	or	 r3,r0,r20
	or	 r4,r0,r21
@L10312:
	bsr.n	 _do_jump
	addu	 r1,r1,@L10332
@L10333:
	align	 4
@L10249:
	ld	 r13,r24,16
	ld	 r12,r13,4
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r2,r12,24
	or	 r13,r13,lo16(_mode_class)
	ld	 r13,r13[r2]
	cmp	 r13,r13,1
	bb1	 ne,r13,@L10251
	bsr	 _can_compare_p
	bcnd.n	 ne0,r2,@L10320
	or	 r2,r0,r24
	or	 r3,r0,r21
	or	 r4,r0,r20
	bsr.n	 _do_jump_by_parts_equality
	addu	 r1,r1,@L10334
@L10335:
	align	 4
@L10251:
	or	 r2,r0,r24
@L10320:
	or	 r3,r0,90
	br.n	 @L10305
	or	 r4,r0,90
	align	 4
@L10253:
	bsr.n	 _integer_zerop
	ld	 r2,r24,20
	bcnd	 eq0,r2,@L10254
@L10304:
	ld	 r2,r24,16
	or	 r3,r0,r21
@L10317:
	br.n	 @L10312
	or	 r4,r0,r20
	align	 4
@L10254:
	ld	 r13,r24,16
	ld	 r12,r13,4
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r2,r12,24
	or	 r13,r13,lo16(_mode_class)
	ld	 r13,r13[r2]
	cmp	 r13,r13,1
	bb1	 ne,r13,@L10256
	bsr	 _can_compare_p
	bcnd.n	 ne0,r2,@L10321
	or	 r2,r0,r24
	or	 r3,r0,r20
	or	 r4,r0,r21
	bsr.n	 _do_jump_by_parts_equality
	addu	 r1,r1,@L10336
@L10337:
	align	 4
@L10256:
	or	 r2,r0,r24
@L10321:
	or	 r3,r0,89
	br.n	 @L10305
	or	 r4,r0,89
	align	 4
@L10258:
	ld	 r13,r24,16
	ld	 r12,r13,4
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r2,r12,24
	or	 r13,r13,lo16(_mode_class)
	ld	 r13,r13[r2]
	cmp	 r13,r13,1
	bb1	 ne,r13,@L10259
	bsr	 _can_compare_p
	bcnd.n	 ne0,r2,@L10322
	or	 r2,r0,r24
	br.n	 @L10313
	or	 r3,r0,1
	align	 4
@L10259:
	or	 r2,r0,r24
@L10322:
	or	 r3,r0,94
	br.n	 @L10305
	or	 r4,r0,98
	align	 4
@L10261:
	ld	 r13,r24,16
	ld	 r12,r13,4
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r2,r12,24
	or	 r13,r13,lo16(_mode_class)
	ld	 r13,r13[r2]
	cmp	 r13,r13,1
	bb1	 ne,r13,@L10262
	bsr	 _can_compare_p
	bcnd.n	 ne0,r2,@L10323
	or	 r2,r0,r24
	br.n	 @L10314
	or	 r3,r0,0
	align	 4
@L10262:
	or	 r2,r0,r24
@L10323:
	or	 r3,r0,93
	br.n	 @L10305
	or	 r4,r0,97
	align	 4
@L10264:
	ld	 r13,r24,16
	ld	 r12,r13,4
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r2,r12,24
	or	 r13,r13,lo16(_mode_class)
	ld	 r13,r13[r2]
	cmp	 r13,r13,1
	bb1	 ne,r13,@L10265
	bsr	 _can_compare_p
	bcnd.n	 ne0,r2,@L10324
	or	 r2,r0,r24
	or	 r3,r0,0
@L10313:
	or	 r4,r0,r21
	or	 r5,r0,r20
	bsr.n	 _do_jump_by_parts_greater
	addu	 r1,r1,@L10338
@L10339:
	align	 4
@L10265:
	or	 r2,r0,r24
@L10324:
	or	 r3,r0,92
	br.n	 @L10305
	or	 r4,r0,96
	align	 4
@L10267:
	ld	 r13,r24,16
	ld	 r12,r13,4
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r2,r12,24
	or	 r13,r13,lo16(_mode_class)
	ld	 r13,r13[r2]
	cmp	 r13,r13,1
	bb1	 ne,r13,@L10268
	bsr	 _can_compare_p
	bcnd.n	 ne0,r2,@L10325
	or	 r2,r0,r24
	or	 r3,r0,1
@L10314:
	or	 r4,r0,r20
	or	 r5,r0,r21
	bsr.n	 _do_jump_by_parts_greater
	addu	 r1,r1,@L10340
@L10341:
	align	 4
@L10268:
	or	 r2,r0,r24
@L10325:
	or	 r3,r0,91
	or	 r4,r0,95
@L10305:
	bsr	 _compare
	br.n	 @L10155
	or	 r18,r0,r2
	align	 4
@L10164:
	or	 r2,r0,r24
@L10316:
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or.u	 r13,r0,hi16(_inhibit_defer_pop)
	ld	 r13,r13,lo16(_inhibit_defer_pop)
	bcnd.n	 ne0,r13,@L10271
	or	 r25,r0,r2
	or.u	 r23,r0,hi16(_pending_stack_adjust)
	ld	 r4,r23,lo16(_pending_stack_adjust)
	bcnd.n	 eq0,r4,@L10273
	or	 r2,r0,46
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr	 _adjust_stack
@L10273:
	st	 r0,r23,lo16(_pending_stack_adjust)
@L10271:
	ld.hu	 r12,r0,r25
	cmp	 r13,r12,46
	bb1.n	 ne,r13,@L10274
	cmp	 r13,r12,56
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r13,r13,lo16(_const0_rtx)
	cmp	 r13,r25,r13
	bb1.n	 ne,r13,@L10326
	or.u	 r13,r0,hi16(_const_true_rtx)
	br.n	 @L10155
	or	 r18,r0,r25
	align	 4
@L10274:
	bb1.n	 ne,r13,@L10278
	or.u	 r13,r0,hi16(_mode_class)
	or.u	 r13,r0,hi16(_const_true_rtx)
@L10326:
	ld	 r18,r13,lo16(_const_true_rtx)
	br.n	 @L10327
	or.u	 r13,r0,hi16(_pending_chain)
	align	 4
@L10278:
	ld.bu	 r12,r25,2
	or	 r13,r13,lo16(_mode_class)
	ld	 r13,r13[r12]
	cmp	 r13,r13,1
	bb1	 ne,r13,@L10280
	bsr.n	 _can_compare_p
	ld.bu	 r2,r25,2
	bcnd.n	 ne0,r2,@L10280
	or	 r2,r0,r25
	or	 r3,r0,r20
	or	 r4,r0,r21
	bsr.n	 _do_jump_by_parts_equality_rtx
	addu	 r1,r1,@L10342
@L10343:
	align	 4
@L10280:
	ld.bu	 r11,r25,2
	bcnd	 eq0,r11,@L10282
	ld	 r13,r24,4
	or	 r2,r0,r25
	or.u	 r12,r0,hi16(_const_tiny_rtx)
	or	 r4,r0,89
	or	 r7,r0,0
	ld.bu	 r6,r2,2
	or	 r12,r12,lo16(_const_tiny_rtx)
	ld	 r5,r13,8
	or	 r8,r0,0
	ld	 r3,r12[r11]
	bsr.n	 _compare_from_rtx
	extu	 r5,r5,1<17>
	br.n	 @L10155
	or	 r18,r0,r2
	align	 4
@L10282:
	bsr	 _abort
	align	 4
@L10155:
	or.u	 r13,r0,hi16(_pending_chain)
@L10327:
	ld	 r25,r13,lo16(_pending_chain)
	bcnd	 eq0,r25,@L10285
	or	 r24,r0,r13
@L10288:
	bsr.n	 _emit_insn
	ld	 r2,r25,16
	ld	 r13,r25,20
	st	 r2,r25,8
	or	 r25,r0,r13
	bcnd.n	 ne0,r25,@L10288
	st	 r25,r24,lo16(_pending_chain)
@L10285:
	or.u	 r13,r0,hi16(_const_true_rtx)
	ld	 r13,r13,lo16(_const_true_rtx)
	cmp	 r13,r18,r13
	bb1	 ne,r13,@L10290
	bcnd.n	 eq0,r20,@L10292
	or	 r2,r0,r20
	bsr.n	 _emit_jump
	addu	 r1,r1,@L10344
@L10345:
	align	 4
@L10290:
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r13,r13,lo16(_const0_rtx)
	cmp	 r13,r18,r13
	bb1	 ne,r13,@L10293
	bcnd.n	 eq0,r21,@L10292
	or	 r2,r0,r21
	bsr.n	 _emit_jump
	addu	 r1,r1,@L10346
@L10347:
	align	 4
@L10293:
	bcnd.n	 eq0,r18,@L10292
	or	 r2,r0,r18
	or	 r3,r0,r21
	bsr.n	 _do_jump_for_compare
	or	 r4,r0,r20
@L10292:
	bsr	 _free_temp_slots
	bcnd.n	 eq0,r16,@L10297
	or.u	 r13,r0,hi16(_inhibit_defer_pop)
	ld	 r13,r13,lo16(_inhibit_defer_pop)
	bcnd.n	 ne0,r13,@L10298
	or.u	 r25,r0,hi16(_pending_stack_adjust)
	ld	 r4,r25,lo16(_pending_stack_adjust)
	bcnd.n	 eq0,r4,@L10300
	or	 r2,r0,46
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr	 _adjust_stack
@L10300:
	st	 r0,r25,lo16(_pending_stack_adjust)
@L10298:
	bsr.n	 _emit_label
	or	 r2,r0,r16
@L10297:
@Lte40:
	ld	 r1,r31,80
	ld	 r15,r31,36
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	jmp.n	 r1
	addu	 r31,r31,112
	def	 @L10346,@L10292-@L10347
	def	 @L10344,@L10292-@L10345
	def	 @L10342,@L10155-@L10343
	def	 @L10340,@L10155-@L10341
	def	 @L10338,@L10155-@L10339
	def	 @L10336,@L10155-@L10337
	def	 @L10334,@L10155-@L10335
	def	 @L10332,@L10155-@L10333
	def	 @L10330,@L10164-@L10331
	def	 @L10328,@L10155-@L10329

	align	 8
_do_jump_by_parts_greater:
	subu	 r31,r31,112
	st	 r1,r31,80
	st.d	 r24,r31,72
	or	 r24,r0,r2
	st.d	 r22,r31,64
	or	 r25,r0,r3
	st.d	 r20,r31,56
	or	 r22,r0,r4
	st.d	 r18,r31,48
	or	 r21,r0,r5
	st.d	 r16,r31,40
	or	 r3,r0,0
	st.d	 r14,r31,32
@Ltb41:
	lda	 r13,r24[r25]
	or	 r4,r0,0
	ld	 r2,r13,16
	bsr.n	 _expand_expr
	or	 r5,r0,0
	addu	 r13,r24,16
	bcnd.n	 ne0,r25,@L10372
	st	 r2,r31,92
	addu	 r13,r24,20
@L10372:
	or	 r3,r0,0
	or	 r4,r0,0
	ld	 r2,r0,r13
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld	 r13,r24,16
	ld	 r10,r13,4
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r18,r10,24
	or	 r13,r13,lo16(_mode_size)
	ld	 r11,r13[r18]
	bcnd.n	 ge0,r11,@L10373
	st	 r2,r31,100
	addu	 r11,r11,3
@L10373:
	cmp	 r13,r21,0
	cmp	 r12,r22,0
	ext	 r17,r11,0<2>
	or	 r13,r13,r12
	ld	 r12,r10,8
	extu	 r13,r13,1<eq>
	or	 r19,r0,0
	bcnd.n	 eq0,r13,@L10374
	extu	 r20,r12,1<17>
	bsr	 _gen_label_rtx
	or	 r19,r0,r2
@L10374:
	bcnd	 ne0,r21,@L10375
	or	 r21,r0,r19
@L10375:
	bcnd	 ne0,r22,@L10376
	or	 r22,r0,r19
@L10376:
	bcnd.n	 le0,r17,@L10378
	or	 r25,r0,0
	or.u	 r14,r0,hi16(_word_mode)
	or.u	 r15,r0,hi16(_const_true_rtx)
	or.u	 r16,r0,hi16(_const0_rtx)
@L10380:
	ld	 r2,r31,92
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r18
	or	 r23,r0,r2
	ld	 r2,r31,100
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r18
	cmp	 r13,r25,0
	extu	 r13,r13,1<gt>
	or	 r4,r0,92
	or	 r13,r13,r20
	bcnd.n	 eq0,r13,@L10383
	or	 r24,r0,r2
	or	 r4,r0,96
@L10383:
	ld	 r6,r14,lo16(_word_mode)
	or	 r2,r0,r23
	or	 r3,r0,r24
	or	 r5,r0,r20
	or	 r7,r0,0
	bsr.n	 _compare_from_rtx
	or	 r8,r0,0
	ld	 r13,r15,lo16(_const_true_rtx)
	cmp	 r13,r2,r13
	bb1	 ne,r13,@L10385
	or	 r2,r0,r21
	bsr.n	 _emit_jump
	addu	 r1,r1,@L10394
@L10395:
	align	 4
@L10385:
	ld	 r13,r16,lo16(_const0_rtx)
	cmp	 r13,r2,r13
	bb0.n	 ne,r13,@L10386
	or	 r3,r0,0
	bsr.n	 _do_jump_for_compare
	or	 r4,r0,r21
@L10386:
	ld	 r6,r14,lo16(_word_mode)
	or	 r2,r0,r23
	or	 r3,r0,r24
	or	 r4,r0,89
	or	 r5,r0,r20
	or	 r7,r0,0
	bsr.n	 _compare_from_rtx
	or	 r8,r0,0
	ld	 r13,r15,lo16(_const_true_rtx)
	cmp	 r13,r2,r13
	bb1	 ne,r13,@L10388
	or	 r2,r0,r22
	bsr.n	 _emit_jump
	addu	 r1,r1,@L10396
@L10397:
	align	 4
@L10388:
	ld	 r13,r16,lo16(_const0_rtx)
	cmp	 r13,r2,r13
	bb1.n	 eq,r13,@L10379
	or	 r3,r0,0
	bsr.n	 _do_jump_for_compare
	or	 r4,r0,r22
@L10379:
	addu	 r25,r25,1
	cmp	 r13,r25,r17
	bb1	 lt,r13,@L10380
@L10378:
	bcnd	 eq0,r22,@L10392
	bsr.n	 _emit_jump
	or	 r2,r0,r22
@L10392:
	bcnd	 eq0,r19,@L10393
	bsr.n	 _emit_label
	or	 r2,r0,r19
@L10393:
@Lte41:
	ld	 r1,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	ld.d	 r14,r31,32
	jmp.n	 r1
	addu	 r31,r31,112
	def	 @L10396,@L10379-@L10397
	def	 @L10394,@L10386-@L10395

	align	 8
_do_jump_by_parts_equality:
	subu	 r31,r31,96
	st	 r1,r31,80
	st	 r15,r31,36
	st.d	 r24,r31,72
	or	 r5,r0,0
	st.d	 r20,r31,56
	or	 r20,r0,r2
	st.d	 r22,r31,64
	or	 r21,r0,r3
	st.d	 r18,r31,48
	or	 r15,r0,r4
	st.d	 r16,r31,40
@Ltb42:
	or	 r3,r0,0
	ld	 r2,r20,16
	bsr.n	 _expand_expr
	or	 r4,r0,0
	or	 r17,r0,r2
	or	 r3,r0,0
	or	 r4,r0,0
	ld	 r2,r20,20
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld	 r13,r20,16
	ld	 r12,r13,4
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r22,r12,24
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	bcnd.n	 ge0,r13,@L10412
	or	 r18,r0,r2
	addu	 r13,r13,3
@L10412:
	or	 r16,r0,0
	bcnd.n	 ne0,r21,@L10413
	ext	 r19,r13,0<2>
	bsr	 _gen_label_rtx
	or	 r16,r0,r2
	or	 r21,r0,r16
@L10413:
	bcnd.n	 le0,r19,@L10415
	or	 r23,r0,0
	bb0.n	 (31-31),r19,@L10439
	or	 r2,r0,r17
	or	 r3,r0,0
	bsr.n	 _operand_subword_force
	or	 r4,r0,r22
	or	 r25,r0,r2
	or	 r2,r0,r18
	or	 r3,r0,0
	bsr.n	 _operand_subword_force
	or	 r4,r0,r22
	ld	 r13,r20,4
	or	 r3,r0,r2
	or	 r2,r0,r25
	or	 r4,r0,90
	or	 r7,r0,0
	ld	 r5,r13,8
	or.u	 r13,r0,hi16(_word_mode)
	or	 r8,r0,0
	ld	 r6,r13,lo16(_word_mode)
	bsr.n	 _compare_from_rtx
	extu	 r5,r5,1<17>
	or.u	 r13,r0,hi16(_const_true_rtx)
	ld	 r13,r13,lo16(_const_true_rtx)
	cmp	 r13,r2,r13
	bb1.n	 ne,r13,@L10429
	or.u	 r13,r0,hi16(_const0_rtx)
	or	 r2,r0,r21
	bsr.n	 _emit_jump
	addu	 r1,r1,@L10440
@L10441:
	align	 4
@L10429:
	ld	 r13,r13,lo16(_const0_rtx)
	cmp	 r13,r2,r13
	bb1.n	 eq,r13,@L10427
	or	 r3,r0,r21
	bsr.n	 _do_jump_for_compare
	or	 r4,r0,0
@L10427:
	addu	 r23,r23,1
	cmp	 r13,r23,r19
	bb0.n	 lt,r13,@L10415
	or	 r2,r0,r17
@L10439:
	or	 r3,r0,r23
	bsr.n	 _operand_subword_force
	or	 r4,r0,r22
	or	 r25,r0,r2
	or	 r2,r0,r18
	or	 r3,r0,r23
	bsr.n	 _operand_subword_force
	or	 r4,r0,r22
	ld	 r13,r20,4
	or	 r3,r0,r2
	or	 r2,r0,r25
	or	 r4,r0,90
	or	 r7,r0,0
	ld	 r5,r13,8
	or.u	 r13,r0,hi16(_word_mode)
	or	 r8,r0,0
	ld	 r6,r13,lo16(_word_mode)
	bsr.n	 _compare_from_rtx
	extu	 r5,r5,1<17>
	or.u	 r13,r0,hi16(_const_true_rtx)
	ld	 r13,r13,lo16(_const_true_rtx)
	cmp	 r13,r2,r13
	bb1.n	 ne,r13,@L10433
	or.u	 r13,r0,hi16(_const0_rtx)
	or	 r2,r0,r21
	bsr.n	 _emit_jump
	addu	 r1,r1,@L10442
@L10443:
	align	 4
@L10433:
	ld	 r13,r13,lo16(_const0_rtx)
	cmp	 r13,r2,r13
	bb1.n	 eq,r13,@L10431
	or	 r3,r0,r21
	bsr.n	 _do_jump_for_compare
	or	 r4,r0,0
@L10431:
	or	 r2,r0,r17
	addu	 r25,r23,1
	or	 r4,r0,r22
	bsr.n	 _operand_subword_force
	or	 r3,r0,r25
	or	 r24,r0,r2
	or	 r2,r0,r18
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r22
	ld	 r13,r20,4
	or	 r3,r0,r2
	or	 r2,r0,r24
	or	 r4,r0,90
	or	 r7,r0,0
	ld	 r5,r13,8
	or.u	 r13,r0,hi16(_word_mode)
	or	 r8,r0,0
	ld	 r6,r13,lo16(_word_mode)
	bsr.n	 _compare_from_rtx
	extu	 r5,r5,1<17>
	or.u	 r13,r0,hi16(_const_true_rtx)
	ld	 r13,r13,lo16(_const_true_rtx)
	cmp	 r13,r2,r13
	bb1.n	 ne,r13,@L10437
	or.u	 r13,r0,hi16(_const0_rtx)
	or	 r2,r0,r21
	bsr.n	 _emit_jump
	addu	 r1,r1,@L10444
@L10445:
	align	 4
@L10437:
	ld	 r13,r13,lo16(_const0_rtx)
	cmp	 r13,r2,r13
	bb1.n	 eq,r13,@L10435
	or	 r3,r0,r21
	bsr.n	 _do_jump_for_compare
	or	 r4,r0,0
@L10435:
	addu	 r23,r23,2
	cmp	 r13,r23,r19
	bb1.n	 lt,r13,@L10439
	or	 r2,r0,r17
@L10415:
	bcnd	 eq0,r15,@L10422
	bsr.n	 _emit_jump
	or	 r2,r0,r15
@L10422:
	bcnd	 eq0,r16,@L10423
	bsr.n	 _emit_label
	or	 r2,r0,r16
@L10423:
@Lte42:
	ld	 r1,r31,80
	ld	 r15,r31,36
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	jmp.n	 r1
	addu	 r31,r31,96
	def	 @L10444,@L10435-@L10445
	def	 @L10442,@L10431-@L10443
	def	 @L10440,@L10427-@L10441

	align	 8
_do_jump_by_parts_equality_rtx:
	subu	 r31,r31,80
	st	 r1,r31,64
	st	 r19,r31,36
	st.d	 r24,r31,56
	st.d	 r22,r31,48
	or	 r23,r0,r2
	st.d	 r20,r31,40
@Ltb43:
	or.u	 r13,r0,hi16(_mode_size)
	ld.bu	 r12,r23,2
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r12]
	or	 r24,r0,r3
	bcnd.n	 ge0,r13,@L10460
	or	 r19,r0,r4
	addu	 r13,r13,3
@L10460:
	or	 r20,r0,0
	bcnd.n	 ne0,r24,@L10461
	ext	 r21,r13,0<2>
	bsr	 _gen_label_rtx
	or	 r20,r0,r2
	or	 r24,r0,r20
@L10461:
	bcnd.n	 le0,r21,@L10463
	or	 r25,r0,0
	bb0.n	 (31-31),r21,@L10465
	or.u	 r22,r0,hi16(_const0_rtx)
	ld.bu	 r4,r23,2
	or	 r2,r0,r23
	bsr.n	 _operand_subword_force
	or	 r3,r0,0
	ld	 r3,r22,lo16(_const0_rtx)
	or	 r4,r0,90
	or	 r5,r0,1
	or.u	 r13,r0,hi16(_word_mode)
	or	 r7,r0,0
	ld	 r6,r13,lo16(_word_mode)
	bsr.n	 _compare_from_rtx
	or	 r8,r0,0
	or.u	 r13,r0,hi16(_const_true_rtx)
	ld	 r13,r13,lo16(_const_true_rtx)
	cmp	 r13,r2,r13
	bb1	 ne,r13,@L10477
	or	 r2,r0,r24
	bsr.n	 _emit_jump
	addu	 r1,r1,@L10487
@L10488:
	align	 4
@L10477:
	ld	 r13,r22,lo16(_const0_rtx)
	cmp	 r13,r2,r13
	bb1.n	 eq,r13,@L10475
	or	 r3,r0,r24
	bsr.n	 _do_jump_for_compare
	or	 r4,r0,0
@L10475:
	addu	 r25,r25,1
	cmp	 r13,r25,r21
	bb0	 lt,r13,@L10463
@L10465:
	ld.bu	 r4,r23,2
	or	 r2,r0,r23
	bsr.n	 _operand_subword_force
	or	 r3,r0,r25
	ld	 r3,r22,lo16(_const0_rtx)
	or	 r4,r0,90
	or	 r5,r0,1
	or.u	 r13,r0,hi16(_word_mode)
	or	 r7,r0,0
	ld	 r6,r13,lo16(_word_mode)
	bsr.n	 _compare_from_rtx
	or	 r8,r0,0
	or.u	 r13,r0,hi16(_const_true_rtx)
	ld	 r13,r13,lo16(_const_true_rtx)
	cmp	 r13,r2,r13
	bb1	 ne,r13,@L10481
	or	 r2,r0,r24
	bsr.n	 _emit_jump
	addu	 r1,r1,@L10489
@L10490:
	align	 4
@L10481:
	ld	 r13,r22,lo16(_const0_rtx)
	cmp	 r13,r2,r13
	bb1.n	 eq,r13,@L10479
	or	 r3,r0,r24
	bsr.n	 _do_jump_for_compare
	or	 r4,r0,0
@L10479:
	ld.bu	 r4,r23,2
	or	 r2,r0,r23
	bsr.n	 _operand_subword_force
	addu	 r3,r25,1
	ld	 r3,r22,lo16(_const0_rtx)
	or	 r4,r0,90
	or	 r5,r0,1
	or.u	 r13,r0,hi16(_word_mode)
	or	 r7,r0,0
	ld	 r6,r13,lo16(_word_mode)
	bsr.n	 _compare_from_rtx
	or	 r8,r0,0
	or.u	 r13,r0,hi16(_const_true_rtx)
	ld	 r13,r13,lo16(_const_true_rtx)
	cmp	 r13,r2,r13
	bb1	 ne,r13,@L10485
	or	 r2,r0,r24
	bsr.n	 _emit_jump
	addu	 r1,r1,@L10491
@L10492:
	align	 4
@L10485:
	ld	 r13,r22,lo16(_const0_rtx)
	cmp	 r13,r2,r13
	bb1.n	 eq,r13,@L10483
	or	 r3,r0,r24
	bsr.n	 _do_jump_for_compare
	or	 r4,r0,0
@L10483:
	addu	 r25,r25,2
	cmp	 r13,r25,r21
	bb1	 lt,r13,@L10465
@L10463:
	bcnd	 eq0,r19,@L10470
	bsr.n	 _emit_jump
	or	 r2,r0,r19
@L10470:
	bcnd	 eq0,r20,@L10471
	bsr.n	 _emit_label
	or	 r2,r0,r20
@L10471:
@Lte43:
	ld	 r1,r31,64
	ld	 r19,r31,36
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80
	def	 @L10491,@L10483-@L10492
	def	 @L10489,@L10479-@L10490
	def	 @L10487,@L10475-@L10488

	align	 8
_do_jump_for_compare:
	subu	 r31,r31,64
	st.d	 r24,r31,40
	or	 r24,r0,r2
	st	 r23,r31,36
	or	 r23,r0,r3
	or	 r25,r0,r4
	bcnd.n	 eq0,r25,@L10514
	st	 r1,r31,48
@Ltb44:
	or.u	 r13,r0,hi16(_bcc_gen_fctn)
	ld.hu	 r12,r0,r24
	or	 r13,r13,lo16(_bcc_gen_fctn)
	ld	 r13,r13[r12]
	bcnd	 eq0,r13,@L10515
	jsr.n	 r13
	or	 r2,r0,r25
	bsr.n	 _emit_jump_insn
	addu	 r1,r1,@L10534
@L10535:
	align	 4
@L10515:
	bsr	 _abort
	align	 4
@L10516:
	bcnd.n	 eq0,r23,@L10518
	or	 r2,r0,r23
	bsr.n	 _emit_jump
	addu	 r1,r1,@L10536
@L10537:
	align	 4
@L10514:
	bcnd	 eq0,r23,@L10518
	bsr	 _get_last_insn
	or.u	 r13,r0,hi16(_bcc_gen_fctn)
	ld.hu	 r12,r0,r24
	or	 r13,r13,lo16(_bcc_gen_fctn)
	ld	 r13,r13[r12]
	ld	 r25,r2,8
	bcnd.n	 eq0,r13,@L10520
	or	 r24,r0,0
	jsr.n	 r13
	or	 r2,r0,r23
	bsr.n	 _emit_jump_insn
	addu	 r1,r1,@L10538
@L10539:
	align	 4
@L10520:
	bsr	 _abort
	align	 4
@L10521:
	bcnd	 ne0,r25,@L10522
	bsr.n	 _get_insns
	addu	 r1,r1,@L10540
@L10541:
	align	 4
@L10522:
	ld	 r2,r25,12
	br	 @L10526
	align	 4
@L10527:
	ld.hu	 r13,r0,r2
	cmp	 r13,r13,27
	bb1	 ne,r13,@L10526
	bcnd.n	 eq0,r24,@L10529
	or	 r24,r0,r2
	bsr	 _abort
	align	 4
@L10529:
@L10526:
	ld	 r2,r2,12
	bcnd	 ne0,r2,@L10527
	bsr	 _get_last_insn
	cmp	 r2,r24,r2
	bb0.n	 ne,r2,@L10531
	or	 r2,r0,r24
	bsr	 _abort
	align	 4
@L10531:
	bsr.n	 _invert_jump
	or	 r3,r0,r23
	bcnd	 ne0,r2,@L10518
	bsr	 _gen_label_rtx
	or	 r25,r0,r2
	or	 r2,r0,r24
	bsr.n	 _redirect_jump
	or	 r3,r0,r25
	bsr.n	 _emit_jump
	or	 r2,r0,r23
	bsr.n	 _emit_label
	or	 r2,r0,r25
@L10518:
@Lte44:
	ld	 r1,r31,48
	ld	 r23,r31,36
	ld.d	 r24,r31,40
	jmp.n	 r1
	addu	 r31,r31,64
	def	 @L10540,@L10526-@L10541
	def	 @L10538,@L10521-@L10539
	def	 @L10536,@L10518-@L10537
	def	 @L10534,@L10516-@L10535

	align	 8
_compare:
	subu	 r31,r31,80
	st	 r1,r31,64
	or	 r5,r0,0
	st.d	 r24,r31,56
	or	 r24,r0,r2
	st.d	 r20,r31,40
	or	 r20,r0,r3
	st	 r19,r31,36
	or	 r25,r0,r4
	st.d	 r22,r31,48
@Ltb45:
	or	 r3,r0,0
	ld	 r2,r24,16
	bsr.n	 _expand_expr
	or	 r4,r0,0
	or	 r19,r0,r2
	or	 r3,r0,0
	or	 r4,r0,0
	ld	 r2,r24,20
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld	 r11,r24,16
	ld	 r12,r11,4
	ld	 r13,r12,8
	or	 r23,r0,r25
	extu	 r25,r13,1<17>
	ld.bu	 r22,r12,24
	bcnd.n	 ne0,r25,@L10548
	or	 r21,r0,r2
	or	 r23,r0,r20
@L10548:
	cmp	 r13,r22,16
	bb1.n	 ne,r13,@L10550
	or	 r7,r0,0
	bsr.n	 _expr_size
	or	 r2,r0,r11
	or	 r7,r0,r2
@L10550:
	or	 r2,r0,r19
	ld	 r13,r24,4
	or	 r3,r0,r21
	or	 r4,r0,r23
	ld	 r8,r13,28
	or	 r5,r0,r25
	or	 r6,r0,r22
	bsr.n	 _compare_from_rtx
	extu	 r8,r8,0<3>
@Lte45:
	ld	 r1,r31,64
	ld	 r19,r31,36
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	jmp.n	 r1
	addu	 r31,r31,80

	align	 8
	global	 _compare_from_rtx
_compare_from_rtx:
	subu	 r31,r31,80
	st	 r1,r31,64
	st.d	 r24,r31,56
	st.d	 r22,r31,48
	st.d	 r20,r31,40
	st.d	 r18,r31,32
@Ltb46:
	or	 r25,r0,r2
	or	 r24,r0,r3
	ld.hu	 r13,r0,r25
	or	 r23,r0,r4
	or	 r19,r0,r5
	subu	 r13,r13,46
	or	 r21,r0,r6
	mask	 r13,r13,0xffff
	or	 r20,r0,r7
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L10560
	or	 r18,r0,r8
	or	 r13,r0,r25
	or	 r25,r0,r24
	or	 r2,r0,r23
	bsr.n	 _swap_condition
	or	 r24,r0,r13
	or	 r23,r0,r2
@L10560:
	or.u	 r13,r0,hi16(_flag_force_mem)
	ld	 r13,r13,lo16(_flag_force_mem)
	bcnd.n	 eq0,r13,@L10567
	or.u	 r13,r0,hi16(_inhibit_defer_pop)
	bsr.n	 _force_not_mem
	or	 r2,r0,r25
	or	 r25,r0,r2
	bsr.n	 _force_not_mem
	or	 r2,r0,r24
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_inhibit_defer_pop)
@L10567:
	ld	 r13,r13,lo16(_inhibit_defer_pop)
	bcnd.n	 ne0,r13,@L10562
	or.u	 r22,r0,hi16(_pending_stack_adjust)
	ld	 r4,r22,lo16(_pending_stack_adjust)
	bcnd.n	 eq0,r4,@L10564
	or	 r2,r0,46
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr	 _adjust_stack
@L10564:
	st	 r0,r22,lo16(_pending_stack_adjust)
@L10562:
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb0.n	 eq,r13,@L10568
	or	 r2,r0,r25
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,46
	bb1.n	 ne,r13,@L10569
	or	 r3,r0,r24
	or	 r2,r0,r23
	or	 r3,r0,r21
	or	 r4,r0,r25
	or	 r5,r0,r24
	bsr.n	 _simplify_relational_operation
	addu	 r1,r1,@L10570
@L10571:
	align	 4
@L10568:
	or	 r3,r0,r24
@L10569:
	or	 r4,r0,r23
	or	 r5,r0,r20
	or	 r6,r0,r21
	or	 r7,r0,r19
	bsr.n	 _emit_cmp_insn
	or	 r8,r0,r18
	or.u	 r13,r0,hi16(_cc0_rtx)
	ld	 r4,r13,lo16(_cc0_rtx)
	or.u	 r13,r0,hi16(_const0_rtx)
	or	 r2,r0,r23
	ld	 r5,r13,lo16(_const0_rtx)
	bsr.n	 _gen_rtx
	or	 r3,r0,0
@L10566:
@Lte46:
	ld	 r1,r31,64
	ld.d	 r24,r31,56
	ld.d	 r22,r31,48
	ld.d	 r20,r31,40
	ld.d	 r18,r31,32
	jmp.n	 r1
	addu	 r31,r31,80
	def	 @L10570,@L10566-@L10571

	align	 8
_do_store_flag:
	subu	 r31,r31,144
	st	 r1,r31,80
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	st.d	 r20,r31,56
	st.d	 r18,r31,48
	st.d	 r16,r31,40
	st.d	 r14,r31,32
@Ltb47:
	or	 r25,r0,r2
	st	 r3,r31,92
	ld.bu	 r13,r25,8
	or	 r16,r0,r4
	ld	 r18,r31,92
	or	 r24,r0,r5
	cmp	 r13,r13,90
	bb1.n	 ne,r13,@L10573
	st	 r0,r31,116
	or	 r9,r0,1
	st	 r9,r31,116
	ld	 r25,r25,16
@L10573:
	ld	 r19,r25,16
	ld	 r9,r19,4
	st	 r9,r31,100
	ld.bu	 r9,r9,24
	st	 r9,r31,108
	ld	 r9,r31,100
	ld	 r12,r9,8
	ld	 r9,r31,108
	ld	 r21,r25,20
	cmp	 r13,r9,16
	bb0.n	 ne,r13,@L10808
	extu	 r14,r12,1<17>
	br	 @L11170
	align	 4
@L10579:
	ld	 r11,r19,16
	ld	 r13,r19,4
	ld	 r12,r11,4
	ld.bu	 r13,r13,24
	ld.bu	 r12,r12,24
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L11171
	or	 r19,r0,r11
@L11170:
	ld.bu	 r12,r19,8
	subu	 r13,r12,101
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L10579
	mask	 r13,r12,0xff
	cmp	 r13,r13,103
	bb1	 eq,r13,@L10579
	br	 @L11171
	align	 4
@L10585:
	ld	 r11,r21,16
	ld	 r13,r21,4
	ld	 r12,r11,4
	ld.bu	 r13,r13,24
	ld.bu	 r12,r12,24
	cmp	 r13,r13,r12
	bb0	 eq,r13,@L10582
	or	 r21,r0,r11
@L11171:
	ld.bu	 r12,r21,8
	subu	 r13,r12,101
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L10585
	mask	 r13,r12,0xff
	cmp	 r13,r13,103
	bb1	 eq,r13,@L10585
@L10582:
	ld.bu	 r12,r25,8
	cmp	 r13,r12,93
	bb0	 ne,r13,@L10604
	bb0.n	 ls,r13,@L10620
	cmp	 r13,r12,91
	bb0.n	 ne,r13,@L10590
	cmp	 r13,r12,92
	bb0	 ne,r13,@L10597
	br	 @L10618
	align	 4
@L10620:
	cmp	 r13,r12,95
	bb0.n	 ne,r13,@L10587
	or	 r17,r0,90
	bb1.n	 lo,r13,@L10611
	cmp	 r13,r12,96
	bb0.n	 ne,r13,@L10587
	or	 r17,r0,89
	br	 @L10618
	align	 4
@L10590:
	bsr.n	 _integer_onep
	or	 r2,r0,r21
	bcnd.n	 eq0,r2,@L10591
	or.u	 r13,r0,hi16(_integer_zero_node)
	ld	 r21,r13,lo16(_integer_zero_node)
	br.n	 @L11172
	or	 r17,r0,93
	align	 4
@L10591:
	br.n	 @L11173
	or	 r17,r0,94
	align	 4
@L10597:
	bsr.n	 _integer_all_onesp
	or	 r2,r0,r21
	bcnd.n	 eq0,r2,@L10598
	or.u	 r13,r0,hi16(_integer_zero_node)
	or	 r17,r0,94
	ld	 r21,r13,lo16(_integer_zero_node)
@L11173:
	bcnd	 eq0,r14,@L10587
	or	 r17,r0,98
	br	 @L10587
	align	 4
@L10598:
	or	 r17,r0,93
@L11172:
	bcnd	 eq0,r14,@L10587
	or	 r17,r0,97
	br	 @L10587
	align	 4
@L10604:
	bsr.n	 _integer_all_onesp
	or	 r2,r0,r21
	bcnd.n	 eq0,r2,@L10605
	subu	 r13,r0,r14
	or.u	 r12,r0,hi16(_integer_zero_node)
	mask	 r13,r13,95
	ld	 r21,r12,lo16(_integer_zero_node)
	br.n	 @L10587
	or	 r17,r13,91
	align	 4
@L10605:
	br.n	 @L11174
	or	 r17,r0,92
	align	 4
@L10611:
	bsr.n	 _integer_onep
	or	 r2,r0,r21
	bcnd.n	 eq0,r2,@L10612
	or.u	 r13,r0,hi16(_integer_zero_node)
	or	 r17,r0,92
	ld	 r21,r13,lo16(_integer_zero_node)
@L11174:
	bcnd	 eq0,r14,@L10587
	or	 r17,r0,96
	br	 @L10587
	align	 4
@L10612:
	subu	 r13,r0,r14
	mask	 r13,r13,95
	br.n	 @L10587
	or	 r17,r13,91
	align	 4
@L10618:
	bsr	 _abort
	align	 4
@L10587:
	ld.bu	 r13,r19,8
	subu	 r13,r13,25
	mask	 r13,r13,0xff
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L10621
	or	 r13,r0,r19
	or	 r19,r0,r21
	or	 r2,r0,r17
	bsr.n	 _swap_condition
	or	 r21,r0,r13
	or	 r17,r0,r2
@L10621:
	subu	 r13,r17,89
	cmp	 r13,r13,1
	bb0	 ls,r13,@L10622
	ld.bu	 r13,r19,8
	cmp	 r13,r13,83
	bb1	 ne,r13,@L10622
	bsr.n	 _integer_zerop
	or	 r2,r0,r21
	bcnd	 eq0,r2,@L10622
	bsr.n	 _integer_pow2p
	ld	 r2,r19,20
	bcnd	 eq0,r2,@L10622
	ld	 r9,r31,100
	ld.bu	 r13,r9,25
	cmp	 r13,r13,32
	bb0.n	 ls,r13,@L10622
	or	 r3,r0,0
	or	 r4,r0,0
	ld	 r2,r19,20
	bsr.n	 _expand_expr
	or	 r5,r0,0
	bsr.n	 _exact_log2_wide
	ld	 r2,r2,4
	bcnd.n	 eq0,r18,@L10624
	st	 r2,r31,124
	ld.hu	 r13,r0,r18
	cmp	 r13,r13,51
	bb1	 ne,r13,@L10624
	ld.bu	 r13,r18,2
	ld	 r9,r31,108
	cmp	 r13,r13,r9
	bb1.n	 ne,r13,@L10624
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r21,r19,16
	ld	 r13,r13,lo16(_tree_code_type)
	ld.bu	 r12,r21,8
	ld	 r13,r13[r12]
	ld.b	 r13,r0,r13
	or	 r22,r0,0
	or	 r23,r0,r18
	subu	 r11,r13,49
	or.u	 r13,r0,hi16(@L10670)
	cmp	 r12,r11,71
	bb0.n	 ls,r12,@L10631
	or	 r13,r13,lo16(@L10670)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L10670:
	word	 @L10640
	word	 @L10642
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10642
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10672
	word	 @L10632
	word	 @L10645
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10645
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10631
	word	 @L10634
	align	 4
@L10632:
	ld	 r22,r21,64
	br	 @L10631
	align	 4
@L10634:
	ld.bu	 r13,r21,8
	cmp	 r13,r13,3
	bb1.n	 ne,r13,@L10625
	or	 r2,r0,0
	ld	 r3,r21,16
	bcnd.n	 eq0,r3,@L10637
	or	 r25,r0,0
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L10625
	or	 r2,r0,r25
@L10637:
	ld	 r3,r0,r21
	bcnd	 eq0,r3,@L10676
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L10625
	or	 r2,r0,r25
	br.n	 @L11194
	or	 r25,r0,1
	align	 4
@L10640:
	ld	 r3,r21,16
	br.n	 @L11195
	or	 r2,r0,r23
	align	 4
@L10642:
	ld	 r3,r21,16
	or	 r2,r0,r23
	bsr.n	 _safe_from_p
	or	 r25,r0,0
	bcnd	 eq0,r2,@L10675
	ld	 r3,r21,20
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	cmp	 r2,r2,0
	br.n	 @L10675
	extu	 r25,r2,1<ne>
	align	 4
@L10645:
	ld.bu	 r13,r21,8
	subu	 r11,r13,39
	or.u	 r13,r0,hi16(@L10661)
	cmp	 r12,r11,67
	bb0.n	 ls,r12,@L10646
	or	 r13,r13,lo16(@L10661)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L10661:
	word	 @L10648
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10659
	word	 @L10650
	word	 @L10660
	word	 @L10657
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10646
	word	 @L10658
	word	 @L10655
	word	 @L10647
	align	 4
@L10647:
	ld	 r2,r21,16
	bsr.n	 _staticp
	addu	 r1,r1,@L11237
@L11238:
	align	 4
@L10648:
	ld.hu	 r13,r0,r23
	br.n	 @L11176
	cmp	 r13,r13,55
	align	 4
@L10650:
	ld	 r22,r21,24
	bcnd	 ne0,r22,@L11063
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,51
	bb1.n	 ne,r13,@L11176
	cmp	 r13,r12,55
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L11177
	cmp	 r13,r12,55
@L11176:
	bb1.n	 ne,r13,@L10646
	or	 r2,r0,0
	br	 @L10625
	align	 4
@L10655:
	ld	 r22,r21,20
	bcnd	 ne0,r22,@L11063
@L11177:
	br.n	 @L10625
	or	 r2,r0,0
	align	 4
@L10657:
	ld	 r22,r21,20
	br	 @L10646
	align	 4
@L10658:
	ld	 r22,r21,24
	br	 @L10646
	align	 4
@L10659:
	ld	 r3,r21,20
	or	 r2,r0,r23
@L11195:
	bsr.n	 _safe_from_p
	addu	 r1,r1,@L11239
@L11240:
	align	 4
@L10660:
	bsr	 _abort
	align	 4
@L10646:
	bcnd.n	 ne0,r22,@L11063
	or.u	 r13,r0,hi16(_tree_code_length)
	ld.bu	 r12,r21,8
	ld	 r13,r13,lo16(_tree_code_length)
	ld	 r20,r13[r12]
	cmp	 r13,r22,r20
	bb0.n	 lt,r13,@L10631
	or	 r24,r0,0
	mask	 r12,r20,3
	bcnd.n	 eq0,r12,@L10667
	or	 r25,r0,r21
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L11146
	cmp	 r13,r12,2
	bb0	 gt,r13,@L11147
	ld	 r3,r21,16
	bcnd	 eq0,r3,@L11149
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L10625
	or	 r2,r0,0
@L11149:
	addu	 r25,r21,4
	or	 r24,r0,1
@L11147:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L11152
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L10625
	or	 r2,r0,0
@L11152:
	addu	 r25,r25,4
	addu	 r24,r24,1
@L11146:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L11155
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L10625
	or	 r2,r0,0
@L11155:
	addu	 r24,r24,1
	cmp	 r13,r24,r20
	bb0.n	 lt,r13,@L10631
	addu	 r25,r25,4
@L10667:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L11158
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L10625
	or	 r2,r0,0
@L11158:
	ld	 r3,r25,20
	bcnd	 eq0,r3,@L11161
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L10625
	or	 r2,r0,0
@L11161:
	ld	 r3,r25,24
	bcnd	 eq0,r3,@L11164
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L10625
	or	 r2,r0,0
@L11164:
	ld	 r3,r25,28
	bcnd	 eq0,r3,@L11167
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L10625
	or	 r2,r0,0
@L11167:
	addu	 r24,r24,4
	cmp	 r13,r24,r20
	bb1.n	 lt,r13,@L10667
	addu	 r25,r25,16
@L10631:
	bcnd.n	 eq0,r22,@L10625
	or	 r2,r0,1
@L11063:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L11196
	or	 r2,r0,r23
	ld	 r22,r22,4
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L11197
	or	 r3,r0,r22
	ld	 r13,r22,4
	cmp	 r13,r13,63
	bb1	 le,r13,@L11177
@L11196:
	or	 r3,r0,r22
@L11197:
	bsr.n	 _rtx_equal_p
	or	 r25,r0,0
	bcnd	 ne0,r2,@L10675
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1	 ne,r13,@L10676
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,55
	bb1	 ne,r13,@L10676
	ld	 r13,r21,8
	bb0.n	 (31-13),r13,@L10625
	or	 r2,r0,r25
@L10676:
	or	 r25,r0,1
@L10675:
@L11194:
	br.n	 @L10625
	or	 r2,r0,r25
	align	 4
@L10672:
	or	 r2,r0,1
@L10625:
	bcnd	 ne0,r2,@L10623
@L10624:
	or	 r18,r0,0
@L10623:
	ld	 r2,r19,16
	or	 r3,r0,r18
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld	 r9,r31,124
	bcnd.n	 eq0,r9,@L10677
	or	 r20,r0,r2
	ld	 r2,r31,124
	bsr.n	 _size_int
	ld.bu	 r25,r20,2
	ld	 r6,r31,92
	or	 r5,r0,r2
	or	 r2,r0,78
	or	 r4,r0,r20
	or	 r7,r0,1
	bsr.n	 _expand_shift
	or	 r3,r0,r25
	or	 r20,r0,r2
@L10677:
	ld	 r11,r0,r20
	extu	 r13,r11,8<8>
	cmp	 r13,r13,r16
	bb0.n	 ne,r13,@L10678
	and	 r13,r11,0x8
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L10680
	or	 r25,r0,r20
	ld	 r13,r20,4
	or.u	 r12,r0,hi16(_mode_size)
	ld.bu	 r13,r13,2
	or	 r12,r12,lo16(_mode_size)
	ld	 r13,r12[r13]
	ld	 r12,r12[r16]
	cmp	 r13,r13,r12
	bb0	 ge,r13,@L10680
	bb0.n	 (31-26),r11,@L10680
	or	 r2,r0,r16
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r25,r0,r2
@L10680:
	ld.bu	 r13,r25,2
	cmp	 r13,r16,r13
	bb1.n	 ne,r13,@L10681
	or.u	 r13,r0,hi16(_mode_class)
	br.n	 @L10678
	or	 r20,r0,r25
	align	 4
@L10681:
	or	 r13,r13,lo16(_mode_class)
	ld	 r13,r13[r16]
	cmp	 r13,r13,1
	bb1.n	 ne,r13,@L10682
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r16]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,64
	bb1	 ne,r13,@L10682
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb1	 ne,r13,@L11064
	ld	 r2,r25,4
	bcnd.n	 ge0,r2,@L10682
	or	 r3,r0,0
	bsr.n	 _immed_double_const
	or	 r4,r0,r16
	br.n	 @L10678
	or	 r20,r0,r2
	align	 4
@L10682:
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb0.n	 ne,r13,@L11198
	or	 r2,r0,r16
@L11064:
	or.u	 r13,r0,hi16(_mode_class)
	or	 r12,r13,lo16(_mode_class)
	ld	 r13,r12[r16]
	cmp	 r13,r13,1
	bb1	 ne,r13,@L10683
	ld.bu	 r11,r25,2
	ld	 r13,r12[r11]
	cmp	 r13,r13,1
	bb1	 ne,r13,@L10683
	ld.hu	 r10,r0,r25
	cmp	 r13,r10,47
	bb0.n	 ne,r13,@L10684
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r16]
	ld	 r13,r13[r11]
	cmp	 r12,r12,r13
	bb1	 gt,r12,@L10683
	ld	 r13,r0,r25
	or.u	 r12,r0,0x37
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L11199
	cmp	 r13,r10,51
	or.u	 r13,r0,hi16(_direct_load)
	or	 r13,r13,lo16(_direct_load)
	ld.b	 r13,r16,r13
	bcnd.n	 ne0,r13,@L11198
	or	 r2,r0,r16
	cmp	 r13,r10,51
@L11199:
	bb1	 ne,r13,@L10683
@L10684:
	or	 r2,r0,r16
@L11198:
	bsr.n	 _gen_lowpart
	or	 r3,r0,r25
	br.n	 @L10678
	or	 r20,r0,r2
	align	 4
@L10683:
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,r16
	or	 r19,r0,r2
	or	 r23,r0,r25
	ld.bu	 r21,r19,2
	ld.bu	 r22,r23,2
	or.u	 r12,r0,hi16(_mode_class)
	ld.hu	 r11,r0,r19
	or	 r12,r12,lo16(_mode_class)
	ld	 r13,r12[r21]
	or	 r14,r0,100
	ld	 r12,r12[r22]
	or	 r20,r0,r19
	cmp	 r13,r13,2
	cmp	 r12,r12,2
	extu	 r18,r13,1<eq>
	cmp	 r13,r11,59
	bb0.n	 ne,r13,@L10690
	extu	 r15,r12,1<eq>
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L10693
	cmp	 r13,r11,63
	ld	 r2,r19,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L10694
	st	 r2,r19,4
	align	 4
@L10693:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L10694
	ld	 r2,r19,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r19,4
	ld	 r2,r19,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r19,8
@L10694:
	br.n	 @L10689
	or	 r2,r0,r20
	align	 4
@L10690:
	ld	 r13,r19,8
	bcnd	 ne0,r13,@L10696
	ld	 r2,r19,4
	br	 @L10689
	align	 4
@L10696:
	ld	 r2,r19,12
	bcnd	 ne0,r2,@L10689
	ld	 r13,r19,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r19,4
	bsr.n	 _gen_move_insn
	st	 r2,r19,12
	bsr.n	 _emit_insn_before
	ld	 r3,r19,8
	ld	 r2,r19,12
@L10689:
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L10699
	or	 r20,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L11200
	cmp	 r13,r12,63
	ld.bu	 r13,r23,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L10700
	ld	 r24,r23,4
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L10700
	ld	 r13,r24,4
	st	 r13,r23,4
	ld	 r13,r24,8
	bcnd	 eq0,r13,@L10703
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r23,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r23
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	br.n	 @L10698
	or	 r2,r0,r25
	align	 4
@L10700:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L10702
	cmp	 r13,r12,63
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L10703
	st	 r2,r23,4
	align	 4
@L10702:
@L11200:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L10703
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,4
	ld	 r2,r23,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,8
@L10703:
	br.n	 @L10698
	or	 r2,r0,r23
	align	 4
@L10699:
	ld	 r13,r23,8
	bcnd	 ne0,r13,@L10705
	ld	 r2,r23,4
	br.n	 @L11201
	cmp	 r13,r18,r15
	align	 4
@L10705:
	ld	 r2,r23,12
	bcnd.n	 ne0,r2,@L11201
	cmp	 r13,r18,r15
	ld	 r13,r23,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r23,4
	bsr.n	 _gen_move_insn
	st	 r2,r23,12
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	ld	 r2,r23,12
@L10698:
	cmp	 r13,r18,r15
@L11201:
	bb0.n	 ne,r13,@L10707
	or	 r23,r0,r2
	bsr	 _abort
	align	 4
@L10707:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	ld	 r11,r0,r23
	and	 r13,r11,0x8
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L11202
	ld	 r13,r23,4
	or.u	 r12,r0,hi16(_mode_size)
	ld.bu	 r13,r13,2
	or	 r12,r12,lo16(_mode_size)
	ld	 r13,r12[r13]
	ld	 r12,r12[r21]
	cmp	 r13,r13,r12
	bb0	 ge,r13,@L10708
	bb0.n	 (31-26),r11,@L10708
	or	 r2,r0,r21
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	or	 r22,r0,r21
	or	 r23,r0,r2
@L10708:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
@L11202:
	ld	 r13,r0,r20
	and	 r13,r13,0x8
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L10709
	cmp	 r13,r21,r22
	bsr	 _abort
	align	 4
@L10709:
	bb0.n	 ne,r13,@L11203
	or	 r2,r0,r20
	bcnd	 ne0,r22,@L10710
	ld.hu	 r12,r0,r23
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L11203
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L11203
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L10710
@L11203:
	or	 r3,r0,r23
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L11241
@L11242:
	align	 4
@L10710:
	bcnd.n	 eq0,r18,@L10712
	cmp	 r5,r22,8
	cmp	 r13,r21,9
	extu	 r11,r5,1<eq>
	extu	 r7,r13,1<eq>
	and	 r13,r11,r7
	bcnd.n	 ne0,r13,@L11178
	or	 r2,r0,108
	cmp	 r6,r21,11
	extu	 r12,r6,1<eq>
	and	 r13,r11,r12
	bcnd.n	 ne0,r13,@L11178
	or	 r2,r0,109
	cmp	 r8,r22,9
	extu	 r25,r8,1<eq>
	and	 r13,r25,r12
	bcnd.n	 eq0,r13,@L10715
	cmp	 r4,r21,11
	br.n	 @L11178
	or	 r2,r0,110
	align	 4
@L10715:
	cmp	 r10,r21,8
	extu	 r11,r10,1<eq>
	and	 r13,r25,r11
	bcnd.n	 ne0,r13,@L11178
	or	 r2,r0,111
	cmp	 r25,r22,11
	extu	 r12,r25,1<eq>
	and	 r13,r12,r11
	bcnd.n	 ne0,r13,@L11178
	or	 r2,r0,112
	and	 r13,r12,r7
	bcnd.n	 eq0,r13,@L10718
	cmp	 r12,r21,9
	or	 r2,r0,113
@L11178:
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L11243
@L11244:
	align	 4
@L10718:
	bb0.n	 ne,r8,@L10728
	or	 r2,r0,0
	bb0.n	 ls,r8,@L10750
	cmp	 r13,r22,10
	bb0.n	 ne,r5,@L10720
	cmp	 r13,r21,10
	br	 @L10719
	align	 4
@L10750:
	bb0	 ne,r13,@L10736
	bb0	 ne,r25,@L10742
	br	 @L10719
	align	 4
@L10720:
	bb0	 ne,r13,@L10723
	bb0	 ls,r13,@L10727
	bb0.n	 ne,r12,@L10722
	or.u	 r13,r0,hi16(_extendsfdf2_libfunc)
	br	 @L10719
	align	 4
@L10727:
	bb0.n	 ne,r4,@L10724
	or.u	 r13,r0,hi16(_extendsftf2_libfunc)
	br	 @L10719
	align	 4
@L10722:
	ld	 r2,r13,lo16(_extendsfdf2_libfunc)
	br	 @L10719
	align	 4
@L10723:
	or.u	 r13,r0,hi16(_extendsfxf2_libfunc)
	ld	 r2,r13,lo16(_extendsfxf2_libfunc)
	br	 @L10719
	align	 4
@L10724:
	ld	 r2,r13,lo16(_extendsftf2_libfunc)
	br	 @L10719
	align	 4
@L10728:
	cmp	 r13,r21,10
	bb0	 ne,r13,@L10731
	bb0	 ls,r13,@L10735
	bb0.n	 ne,r10,@L10730
	or.u	 r13,r0,hi16(_truncdfsf2_libfunc)
	br	 @L10719
	align	 4
@L10735:
	bb0.n	 ne,r6,@L10732
	or.u	 r13,r0,hi16(_extenddftf2_libfunc)
	br	 @L10719
	align	 4
@L10730:
	ld	 r2,r13,lo16(_truncdfsf2_libfunc)
	br	 @L10719
	align	 4
@L10731:
	or.u	 r13,r0,hi16(_extenddfxf2_libfunc)
	ld	 r2,r13,lo16(_extenddfxf2_libfunc)
	br	 @L10719
	align	 4
@L10732:
	ld	 r2,r13,lo16(_extenddftf2_libfunc)
	br	 @L10719
	align	 4
@L10736:
	bb0.n	 ne,r10,@L10738
	or.u	 r13,r0,hi16(_truncxfsf2_libfunc)
	bb0.n	 ne,r12,@L10739
	or.u	 r13,r0,hi16(_truncxfdf2_libfunc)
	br	 @L10719
	align	 4
@L10738:
	ld	 r2,r13,lo16(_truncxfsf2_libfunc)
	br	 @L10719
	align	 4
@L10739:
	ld	 r2,r13,lo16(_truncxfdf2_libfunc)
	br	 @L10719
	align	 4
@L10742:
	bb0.n	 ne,r10,@L10744
	or.u	 r13,r0,hi16(_trunctfsf2_libfunc)
	bb0.n	 ne,r12,@L10745
	or.u	 r13,r0,hi16(_trunctfdf2_libfunc)
	br	 @L10719
	align	 4
@L10744:
	ld	 r2,r13,lo16(_trunctfsf2_libfunc)
	br	 @L10719
	align	 4
@L10745:
	ld	 r2,r13,lo16(_trunctfdf2_libfunc)
@L10719:
	bcnd.n	 ne0,r2,@L10751
	or	 r3,r0,1
	bsr	 _abort
	align	 4
@L10751:
	or	 r4,r0,r21
	or	 r5,r0,1
	or	 r6,r0,r23
	bsr.n	 _emit_library_call
	or	 r7,r0,r22
	or	 r2,r0,r21
	bsr.n	 _hard_libcall_value
	addu	 r1,r1,@L11245
@L11246:
	align	 4
@L10712:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r24,r13,lo16(_mode_size)
	ld	 r13,r24[r22]
	ld	 r12,r24[r21]
	mak	 r13,r13,0<3>
	mak	 r11,r12,0<3>
	cmp	 r13,r13,r11
	bb1.n	 ge,r13,@L11204
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r11,32
	bb0.n	 gt,r13,@L10752
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L10753
	addu	 r13,r12,6
@L10753:
	or	 r2,r0,r21
	or	 r3,r0,r22
	or	 r4,r0,1
	bsr.n	 _can_extend_p
	ext	 r18,r13,0<2>
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb1.n	 ne,r13,@L11205
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r24[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L10756
	or.u	 r24,r0,hi16(_word_mode)
	or	 r2,r0,r21
	ld	 r3,r24,lo16(_word_mode)
	bsr.n	 _can_extend_p
	or	 r4,r0,1
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0	 ne,r13,@L10756
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r3,r0,r23
	bsr.n	 _convert_move
	or	 r4,r0,1
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r4,r0,r2
	or	 r2,r0,r25
	br.n	 @L11180
	or	 r3,r0,r20
	align	 4
@L10756:
	bsr	 _start_sequence
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L10758
	or	 r24,r0,r22
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r24,r13,lo16(_word_mode)
	br.n	 @L11206
	or	 r2,r0,r24
	align	 4
@L10758:
	or	 r2,r0,r24
@L11206:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,1
	or	 r25,r0,r2
	or	 r2,r0,r24
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	bsr.n	 _emit_move_insn
	or	 r3,r0,r25
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r2,r13[r24]
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r24,r13,lo16(_const0_rtx)
	bcnd	 ge0,r2,@L10764
	addu	 r2,r2,3
@L10764:
	ext	 r22,r2,0<2>
	cmp	 r13,r22,r18
	bb0.n	 lt,r13,@L10766
	subu	 r13,r18,r22
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L10768
	subu	 r25,r18,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L11113
	cmp	 r13,r12,2
	bb0.n	 gt,r13,@L11114
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L11118
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L11118:
	bb1	 eq,r13,@L11116
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L11116:
	addu	 r22,r22,1
@L11114:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L11122
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L11122:
	bb1	 eq,r13,@L11120
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L11120:
	addu	 r22,r22,1
@L11113:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L11126
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L11126:
	bb1	 eq,r13,@L11124
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L11124:
	addu	 r22,r22,1
	cmp	 r13,r22,r18
	bb0	 lt,r13,@L10766
@L10768:
	or	 r2,r0,r20
@L11207:
	subu	 r3,r25,1
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L11130
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L11130:
	bb1	 eq,r13,@L11128
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L11128:
	or	 r2,r0,r20
	subu	 r3,r25,2
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L11134
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L11134:
	bb1	 eq,r13,@L11132
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L11132:
	or	 r2,r0,r20
	subu	 r3,r25,3
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L11138
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L11138:
	bb1	 eq,r13,@L11136
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L11136:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,4
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L11142
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L11142:
	bb1	 eq,r13,@L11140
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L11140:
	addu	 r22,r22,4
	cmp	 r13,r22,r18
	bb1.n	 lt,r13,@L11207
	or	 r2,r0,r20
@L10766:
	bsr	 _get_insns
	bsr.n	 _end_sequence
	or	 r25,r0,r2
	or	 r2,r0,r14
	or	 r3,r0,r21
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r6,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_no_conflict_block
	addu	 r1,r1,@L11247
@L11248:
	align	 4
@L10752:
	or.u	 r13,r0,hi16(_mode_size)
@L11204:
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,32
	bb0.n	 gt,r13,@L10772
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	or	 r2,r0,r20
	br.n	 @L11181
	or	 r4,r0,0
	align	 4
@L10772:
	cmp	 r13,r21,3
	bb1.n	 ne,r13,@L10773
	cmp	 r13,r22,3
	cmp	 r13,r22,4
	bb0.n	 ne,r13,@L10774
	or	 r2,r0,4
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,1
@L10774:
	bsr	 _abort
	align	 4
@L10773:
	bb1.n	 ne,r13,@L11208
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r21,4
	bb0.n	 ne,r13,@L10776
	or	 r2,r0,4
	or	 r3,r0,r23
	or	 r4,r0,1
	bsr.n	 _convert_to_mode
	or	 r22,r0,4
	br.n	 @L10775
	or	 r23,r0,r2
	align	 4
@L10776:
	bsr	 _abort
	align	 4
@L10775:
	or.u	 r13,r0,hi16(_mode_size)
@L11208:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb1.n	 ge,r12,@L11209
	or.u	 r13,r0,hi16(_mode_size)
	ld	 r13,r0,r23
	or.u	 r12,r0,0x37
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L10780
	or.u	 r13,r0,hi16(_direct_load)
	or	 r13,r13,lo16(_direct_load)
	ld.b	 r13,r21,r13
	bcnd	 eq0,r13,@L10780
	bsr.n	 _mode_dependent_address_p
	ld	 r2,r23,4
	bcnd.n	 eq0,r2,@L11210
	or	 r2,r0,r21
@L10780:
	ld.hu	 r13,r0,r23
	cmp	 r12,r13,51
	cmp	 r13,r13,53
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L10778
	or	 r2,r0,r21
@L11210:
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	addu	 r1,r1,@L11249
@L11250:
	align	 4
@L10778:
	or.u	 r13,r0,hi16(_mode_size)
@L11209:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb0.n	 gt,r12,@L10781
	or	 r2,r0,r21
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,1
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0.n	 ne,r13,@L10782
	or.u	 r13,r0,hi16(_optimize)
@L11205:
	ld	 r13,r13,lo16(_optimize)
	bcnd	 le0,r13,@L10783
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L11211
	or	 r2,r0,r25
	or	 r2,r0,r22
	bsr.n	 _force_reg
	or	 r3,r0,r23
	or	 r23,r0,r2
@L10783:
	or	 r2,r0,r25
@L11211:
	or	 r3,r0,r20
	or	 r4,r0,r23
@L11180:
	or	 r5,r0,r14
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L11251
@L11252:
	align	 4
@L10782:
	or	 r25,r0,r22
	bcnd.n	 eq0,r25,@L10786
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r24,r13,lo16(_mode_wider_mode)
	or	 r2,r0,r21
@L11212:
	or	 r3,r0,r25
	bsr.n	 _can_extend_p
	or	 r4,r0,1
	cmp	 r2,r2,210
	bb1.n	 eq,r2,@L10787
	or	 r2,r0,r25
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,1
	cmp	 r2,r2,210
	bb1.n	 ne,r2,@L11067
	or	 r2,r0,r25
@L10787:
	ld	 r25,r24[r25]
	bcnd.n	 ne0,r25,@L11212
	or	 r2,r0,r21
@L10786:
	bsr	 _abort
	align	 4
@L10781:
	cmp	 r13,r22,6
	extu	 r11,r13,1<eq>
	cmp	 r13,r21,4
	extu	 r13,r13,1<eq>
	and	 r13,r11,r13
	bcnd.n	 eq0,r13,@L10791
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L11253
@L11254:
	align	 4
@L10791:
	cmp	 r13,r21,2
	extu	 r25,r13,1<eq>
	and	 r13,r11,r25
	bcnd.n	 eq0,r13,@L10792
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L11255
@L11256:
	align	 4
@L10792:
	cmp	 r13,r21,1
	extu	 r10,r13,1<eq>
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L10793
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L11257
@L11258:
	align	 4
@L10793:
	cmp	 r13,r22,4
	extu	 r11,r13,1<eq>
	and	 r13,r11,r25
	bcnd.n	 eq0,r13,@L10794
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L11259
@L11260:
	align	 4
@L10794:
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L10795
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L11261
@L11262:
	align	 4
@L10795:
	cmp	 r13,r22,2
	extu	 r13,r13,1<eq>
	and	 r13,r13,r10
	bcnd.n	 eq0,r13,@L10796
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L11263
@L11264:
	align	 4
@L10796:
	bb1.n	 ge,r12,@L10797
	or	 r2,r0,r21
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	bsr.n	 _force_reg
	or	 r2,r0,r21
@L11179:
	or	 r3,r0,r2
	or	 r2,r0,r20
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L11265
@L11266:
	align	 4
@L10797:
	bsr	 _abort
	align	 4
@L11067:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,1
@L11182:
	or	 r3,r0,r2
	or	 r2,r0,r20
	or	 r4,r0,1
@L11181:
	bsr	 _convert_move
@L10686:
	or	 r20,r0,r19
@L10678:
	ld	 r9,r31,100
	ld.bu	 r13,r9,25
	ld	 r9,r31,124
	subu	 r13,r13,1
	cmp	 r13,r9,r13
	bb0.n	 ne,r13,@L10798
	or.u	 r13,r0,hi16(_const1_rtx)
	ld	 r4,r31,92
	ld	 r3,r13,lo16(_const1_rtx)
	bsr.n	 _expand_and
	or	 r2,r0,r20
	or	 r20,r0,r2
@L10798:
	ld	 r9,r31,116
	cmp	 r13,r17,90
	cmp	 r12,r9,0
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L10800
	cmp	 r13,r17,89
	and.c	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L10799
@L10800:
	ld	 r6,r31,92
	or	 r2,r0,r16
	or.u	 r13,r0,hi16(_xor_optab)
	or	 r4,r0,r20
	ld	 r3,r13,lo16(_xor_optab)
	or.u	 r13,r0,hi16(_const1_rtx)
	or	 r7,r0,0
	ld	 r5,r13,lo16(_const1_rtx)
	bsr.n	 _expand_binop
	or	 r8,r0,3
	or	 r20,r0,r2
@L10799:
	br.n	 @L11062
	or	 r2,r0,r20
	align	 4
@L10622:
	bsr.n	 _can_compare_p
	ld	 r2,r31,108
	bcnd.n	 eq0,r2,@L10808
	or.u	 r13,r0,hi16(_setcc_gen_code)
	or	 r13,r13,lo16(_setcc_gen_code)
	ld	 r12,r13[r17]
	cmp	 r13,r12,210
	bb0	 ne,r13,@L10803
	bcnd.n	 eq0,r24,@L11213
	or.u	 r13,r0,hi16(_tree_code_type)
	mul	 r13,r12,40
	or.u	 r12,r0,hi16(_insn_operand_mode)
	or	 r12,r12,lo16(_insn_operand_mode)
	ld	 r13,r13,r12
	cmp	 r13,r13,r16
	bb0.n	 ne,r13,@L11213
	or.u	 r13,r0,hi16(_tree_code_type)
@L10803:
	cmp	 r13,r17,94
	bb1.n	 ne,r13,@L11214
	cmp	 r13,r24,0
	bsr.n	 _integer_zerop
	or	 r2,r0,r21
	bcnd.n	 ne0,r2,@L11213
	or.u	 r13,r0,hi16(_tree_code_type)
	cmp	 r13,r24,0
@L11214:
	cmp	 r12,r17,91
	and	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L10804
	bsr.n	 _integer_zerop
	or	 r2,r0,r21
	bcnd.n	 ne0,r2,@L11213
	or.u	 r13,r0,hi16(_tree_code_type)
@L10804:
	bcnd.n	 ne0,r24,@L11062
	or	 r2,r0,0
	subu	 r13,r17,89
	cmp	 r13,r13,1
	bb0	 ls,r13,@L11062
	ld	 r9,r31,100
	ld.bu	 r13,r9,8
	cmp	 r13,r13,8
	bb0.n	 ne,r13,@L11062
	or.u	 r13,r0,hi16(_abs_optab)
	ld	 r9,r31,108
	ld	 r13,r13,lo16(_abs_optab)
	mak	 r12,r9,0<3>
	addu	 r13,r13,r12
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb1.n	 ne,r13,@L11213
	or.u	 r13,r0,hi16(_tree_code_type)
	or.u	 r13,r0,hi16(_ffs_optab)
	ld	 r13,r13,lo16(_ffs_optab)
	addu	 r13,r13,r12
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb1.n	 ne,r13,@L10802
	or.u	 r13,r0,hi16(_tree_code_type)
@L10808:
	br.n	 @L11062
	or	 r2,r0,0
	align	 4
@L10802:
@L11213:
	ld.bu	 r10,r25,8
	ld	 r13,r13,lo16(_tree_code_type)
	or.u	 r12,r0,hi16(_do_preexpand_calls)
	ld	 r13,r13[r10]
	ld	 r12,r12,lo16(_do_preexpand_calls)
	ld.b	 r11,r0,r13
	bcnd.n	 eq0,r12,@L10811
	cmp	 r13,r11,101
	cmp	 r12,r11,60
	or	 r13,r13,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L10813
	subu	 r13,r11,49
	cmp	 r12,r11,114
	cmp	 r13,r13,1
	rot	 r11,r12,26
	and.c	 r12,r13,r11
	extu	 r12,r12,1<hi>
	bcnd	 ne0,r12,@L10811
@L10813:
	cmp	 r13,r10,52
	bb0	 ne,r13,@L10811
	bb0.n	 ls,r13,@L10830
	cmp	 r13,r10,44
	bb0	 ne,r13,@L10822
	bb0.n	 ls,r13,@L10831
	cmp	 r13,r10,5
	bb0.n	 ne,r13,@L10811
	or.u	 r13,r0,hi16(_tree_code_length)
	br	 @L11215
	align	 4
@L10831:
	cmp	 r13,r10,48
	bb0.n	 ne,r13,@L10822
	cmp	 r13,r10,50
	bb0.n	 ne,r13,@L10815
	or.u	 r13,r0,hi16(_tree_code_length)
	br	 @L11215
	align	 4
@L10830:
	cmp	 r13,r10,104
	bb0	 ne,r13,@L10826
	bb0.n	 ls,r13,@L10832
	cmp	 r13,r10,87
	bb0.n	 ls,r13,@L10814
	cmp	 r13,r10,86
	bb1.n	 lo,r13,@L11215
	or.u	 r13,r0,hi16(_tree_code_length)
	br	 @L10822
	align	 4
@L10832:
	cmp	 r13,r10,105
	bb0.n	 ne,r13,@L10811
	or.u	 r13,r0,hi16(_tree_code_length)
	br	 @L11215
	align	 4
@L10815:
	ld	 r13,r25,24
	bcnd	 ne0,r13,@L10811
	ld	 r12,r25,16
	ld.bu	 r13,r12,8
	cmp	 r13,r13,106
	bb1.n	 ne,r13,@L11216
	or	 r2,r0,r25
	ld	 r12,r12,16
	ld.bu	 r13,r12,8
	cmp	 r13,r13,29
	bb1.n	 ne,r13,@L11217
	or	 r3,r0,0
	ld	 r13,r12,28
	bb1	 (31-12),r13,@L10811
@L11216:
	or	 r3,r0,0
@L11217:
	bsr.n	 _expand_call
	or	 r4,r0,0
	br.n	 @L10811
	st	 r2,r25,24
	align	 4
@L10822:
	bsr.n	 _do_pending_stack_adjust
	addu	 r1,r1,@L11267
@L11268:
	align	 4
@L10826:
	ld	 r13,r25,24
	bcnd	 ne0,r13,@L10811
@L10814:
	or.u	 r13,r0,hi16(_tree_code_length)
@L11215:
	ld.bu	 r12,r25,8
	ld	 r13,r13,lo16(_tree_code_length)
	ld	 r23,r13[r12]
	bcnd.n	 le0,r23,@L10811
	or	 r24,r0,0
	bb0	 (31-31),r23,@L10836
	ld	 r2,r25,16
	bcnd.n	 eq0,r2,@L11098
	or.u	 r13,r0,hi16(_tree_code_type)
	ld.bu	 r12,r2,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r11,r0,r13
	cmp	 r13,r11,101
	cmp	 r12,r11,60
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L11100
	subu	 r13,r11,49
	cmp	 r12,r11,114
	cmp	 r13,r13,1
	rot	 r11,r13,6
	or.c	 r13,r12,r11
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L11098
@L11100:
	bsr	 _preexpand_calls
@L11098:
	addu	 r24,r24,1
	cmp	 r13,r24,r23
	bb0.n	 lt,r13,@L10811
	addu	 r25,r25,4
@L10836:
	ld	 r2,r25,16
	bcnd.n	 eq0,r2,@L11102
	or.u	 r13,r0,hi16(_tree_code_type)
	ld.bu	 r12,r2,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r11,r0,r13
	cmp	 r13,r11,101
	cmp	 r12,r11,60
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L11104
	subu	 r13,r11,49
	cmp	 r12,r11,114
	cmp	 r13,r13,1
	rot	 r11,r13,6
	or.c	 r13,r12,r11
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L11102
@L11104:
	bsr	 _preexpand_calls
@L11102:
	ld	 r2,r25,20
	bcnd.n	 eq0,r2,@L11106
	or.u	 r13,r0,hi16(_tree_code_type)
	ld.bu	 r12,r2,8
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r11,r0,r13
	cmp	 r13,r11,101
	cmp	 r12,r11,60
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L11108
	subu	 r13,r11,49
	cmp	 r12,r11,114
	cmp	 r13,r13,1
	rot	 r11,r13,6
	or.c	 r13,r12,r11
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L11106
@L11108:
	bsr	 _preexpand_calls
@L11106:
	addu	 r24,r24,2
	cmp	 r13,r24,r23
	bb1.n	 lt,r13,@L10836
	addu	 r25,r25,8
@L10811:
	bcnd	 eq0,r18,@L10842
	ld.hu	 r13,r0,r18
	cmp	 r13,r13,51
	bb1	 ne,r13,@L10842
	ld.bu	 r13,r18,2
	ld	 r9,r31,108
	cmp	 r13,r13,r9
	bb1	 ne,r13,@L10842
	ld.bu	 r12,r21,8
	or.u	 r13,r0,hi16(_tree_code_type)
	ld	 r13,r13,lo16(_tree_code_type)
	ld	 r13,r13[r12]
	ld.b	 r13,r0,r13
	or	 r22,r0,0
	or	 r23,r0,r18
	subu	 r11,r13,49
	or.u	 r13,r0,hi16(@L10888)
	cmp	 r12,r11,71
	bb0.n	 ls,r12,@L10849
	or	 r13,r13,lo16(@L10888)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L10888:
	word	 @L10858
	word	 @L10860
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10860
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10890
	word	 @L10850
	word	 @L10863
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10863
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10849
	word	 @L10852
	align	 4
@L10850:
	ld	 r22,r21,64
	br	 @L10849
	align	 4
@L10852:
	ld.bu	 r13,r21,8
	cmp	 r13,r13,3
	bb1.n	 ne,r13,@L10843
	or	 r2,r0,0
	ld	 r3,r21,16
	bcnd.n	 eq0,r3,@L10855
	or	 r25,r0,0
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L10843
	or	 r2,r0,r25
@L10855:
	ld	 r3,r0,r21
	bcnd	 eq0,r3,@L10894
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L10843
	or	 r2,r0,r25
	br.n	 @L11218
	or	 r25,r0,1
	align	 4
@L10858:
	ld	 r3,r21,16
	br.n	 @L11219
	or	 r2,r0,r23
	align	 4
@L10860:
	ld	 r3,r21,16
	or	 r2,r0,r23
	bsr.n	 _safe_from_p
	or	 r25,r0,0
	bcnd	 eq0,r2,@L10893
	ld	 r3,r21,20
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	cmp	 r2,r2,0
	br.n	 @L10893
	extu	 r25,r2,1<ne>
	align	 4
@L10863:
	ld.bu	 r13,r21,8
	subu	 r11,r13,39
	or.u	 r13,r0,hi16(@L10879)
	cmp	 r12,r11,67
	bb0.n	 ls,r12,@L10864
	or	 r13,r13,lo16(@L10879)
	ld	 r13,r13[r11]
	jmp	 r13
	align	 4
@L10879:
	word	 @L10866
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10877
	word	 @L10868
	word	 @L10878
	word	 @L10875
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10864
	word	 @L10876
	word	 @L10873
	word	 @L10865
	align	 4
@L10865:
	ld	 r2,r21,16
	bsr.n	 _staticp
	addu	 r1,r1,@L11269
@L11270:
	align	 4
@L10866:
	ld.hu	 r13,r0,r23
	br.n	 @L11184
	cmp	 r13,r13,55
	align	 4
@L10868:
	ld	 r22,r21,24
	bcnd	 ne0,r22,@L11065
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,51
	bb1.n	 ne,r13,@L11184
	cmp	 r13,r12,55
	ld	 r13,r23,4
	cmp	 r13,r13,63
	bb0.n	 gt,r13,@L11185
	cmp	 r13,r12,55
@L11184:
	bb1.n	 ne,r13,@L10864
	or	 r2,r0,0
	br	 @L10843
	align	 4
@L10873:
	ld	 r22,r21,20
	bcnd	 ne0,r22,@L11065
@L11185:
	br.n	 @L10843
	or	 r2,r0,0
	align	 4
@L10875:
	ld	 r22,r21,20
	br	 @L10864
	align	 4
@L10876:
	ld	 r22,r21,24
	br	 @L10864
	align	 4
@L10877:
	ld	 r3,r21,20
	or	 r2,r0,r23
@L11219:
	bsr.n	 _safe_from_p
	addu	 r1,r1,@L11271
@L11272:
	align	 4
@L10878:
	bsr	 _abort
	align	 4
@L10864:
	bcnd.n	 ne0,r22,@L11065
	or.u	 r13,r0,hi16(_tree_code_length)
	ld.bu	 r12,r21,8
	ld	 r13,r13,lo16(_tree_code_length)
	ld	 r20,r13[r12]
	cmp	 r13,r22,r20
	bb0.n	 lt,r13,@L10849
	or	 r24,r0,0
	mask	 r12,r20,3
	bcnd.n	 eq0,r12,@L10885
	or	 r25,r0,r21
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L11071
	cmp	 r13,r12,2
	bb0	 gt,r13,@L11072
	ld	 r3,r21,16
	bcnd	 eq0,r3,@L11074
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L10843
	or	 r2,r0,0
@L11074:
	addu	 r25,r21,4
	or	 r24,r0,1
@L11072:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L11077
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L10843
	or	 r2,r0,0
@L11077:
	addu	 r25,r25,4
	addu	 r24,r24,1
@L11071:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L11080
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L10843
	or	 r2,r0,0
@L11080:
	addu	 r24,r24,1
	cmp	 r13,r24,r20
	bb0.n	 lt,r13,@L10849
	addu	 r25,r25,4
@L10885:
	ld	 r3,r25,16
	bcnd	 eq0,r3,@L11083
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L10843
	or	 r2,r0,0
@L11083:
	ld	 r3,r25,20
	bcnd	 eq0,r3,@L11086
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L10843
	or	 r2,r0,0
@L11086:
	ld	 r3,r25,24
	bcnd	 eq0,r3,@L11089
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L10843
	or	 r2,r0,0
@L11089:
	ld	 r3,r25,28
	bcnd	 eq0,r3,@L11092
	bsr.n	 _safe_from_p
	or	 r2,r0,r23
	bcnd.n	 eq0,r2,@L10843
	or	 r2,r0,0
@L11092:
	addu	 r24,r24,4
	cmp	 r13,r24,r20
	bb1.n	 lt,r13,@L10885
	addu	 r25,r25,16
@L10849:
	bcnd.n	 eq0,r22,@L10843
	or	 r2,r0,1
@L11065:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L11220
	or	 r2,r0,r23
	ld	 r22,r22,4
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L11221
	or	 r3,r0,r22
	ld	 r13,r22,4
	cmp	 r13,r13,63
	bb1	 le,r13,@L11185
@L11220:
	or	 r3,r0,r22
@L11221:
	bsr.n	 _rtx_equal_p
	or	 r25,r0,0
	bcnd	 ne0,r2,@L10893
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,55
	bb1	 ne,r13,@L10894
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,55
	bb1	 ne,r13,@L10894
	ld	 r13,r21,8
	bb0.n	 (31-13),r13,@L10843
	or	 r2,r0,r25
@L10894:
	or	 r25,r0,1
@L10893:
@L11218:
	br.n	 @L10843
	or	 r2,r0,r25
	align	 4
@L10890:
	or	 r2,r0,1
@L10843:
	bcnd.n	 ne0,r2,@L11222
	or	 r2,r0,r19
@L10842:
	or	 r18,r0,0
	or	 r2,r0,r19
@L11222:
	or	 r3,r0,r18
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	or	 r20,r0,r2
	or	 r2,r0,r21
	or	 r3,r0,0
	or	 r4,r0,0
	bsr.n	 _expand_expr
	or	 r5,r0,0
	ld	 r9,r31,92
	bcnd.n	 ne0,r9,@L10895
	or	 r18,r0,r2
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,r16
	st	 r2,r31,92
@L10895:
	ld.hu	 r12,r0,r20
	cmp	 r13,r12,64
	bb0.n	 ls,r13,@L10909
	cmp	 r13,r12,63
	bb0.n	 lo,r13,@L10904
	cmp	 r13,r12,55
	bb0.n	 ne,r13,@L10901
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L10898
	or	 r2,r0,1
	br.n	 @L10898
	or	 r2,r0,0
	align	 4
@L10909:
	cmp	 r13,r12,66
	bb0.n	 ne,r13,@L10904
	or	 r2,r0,0
	br	 @L10898
	align	 4
@L10901:
	ld	 r2,r20,4
	bsr.n	 _queued_subexp_p
	addu	 r1,r1,@L11273
@L11274:
	align	 4
@L10904:
	ld	 r2,r20,4
	bsr.n	 _queued_subexp_p
	or	 r25,r0,0
	bcnd	 ne0,r2,@L10906
	bsr.n	 _queued_subexp_p
	ld	 r2,r20,8
	bcnd.n	 eq0,r2,@L10898
	or	 r2,r0,r25
@L10906:
	or	 r25,r0,1
	or	 r2,r0,r25
@L10898:
	bcnd.n	 eq0,r2,@L10896
	or	 r24,r0,r20
	bsr.n	 _copy_rtx
	or	 r2,r0,r20
	or	 r24,r0,r2
@L10896:
	ld.hu	 r12,r0,r18
	cmp	 r13,r12,64
	bb0.n	 ls,r13,@L10923
	cmp	 r13,r12,63
	bb0.n	 lo,r13,@L10918
	cmp	 r13,r12,55
	bb0.n	 ne,r13,@L10915
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L10912
	or	 r2,r0,1
	br.n	 @L10912
	or	 r2,r0,0
	align	 4
@L10923:
	cmp	 r13,r12,66
	bb0.n	 ne,r13,@L10918
	or	 r2,r0,0
	br	 @L10912
	align	 4
@L10915:
	ld	 r2,r18,4
	bsr.n	 _queued_subexp_p
	addu	 r1,r1,@L11275
@L11276:
	align	 4
@L10918:
	ld	 r2,r18,4
	bsr.n	 _queued_subexp_p
	or	 r25,r0,0
	bcnd	 ne0,r2,@L10920
	bsr.n	 _queued_subexp_p
	ld	 r2,r18,8
	bcnd.n	 eq0,r2,@L10912
	or	 r2,r0,r25
@L10920:
	or	 r25,r0,1
	or	 r2,r0,r25
@L10912:
	bcnd.n	 eq0,r2,@L10910
	or	 r5,r0,r18
	bsr.n	 _copy_rtx
	or	 r2,r0,r18
	or	 r5,r0,r2
@L10910:
	ld	 r2,r31,92
	ld	 r6,r31,108
	or	 r3,r0,r17
	or	 r4,r0,r24
	or	 r7,r0,r14
	bsr.n	 _emit_store_flag
	or	 r8,r0,1
	or	 r4,r0,r2
	bcnd	 eq0,r4,@L10924
	ld	 r9,r31,116
	bcnd.n	 eq0,r9,@L10925
	or	 r2,r0,r16
	or.u	 r13,r0,hi16(_xor_optab)
	or	 r6,r0,r4
	ld	 r3,r13,lo16(_xor_optab)
	or.u	 r13,r0,hi16(_const1_rtx)
	or	 r7,r0,0
	ld	 r5,r13,lo16(_const1_rtx)
	bsr.n	 _expand_binop
	or	 r8,r0,3
	or	 r4,r0,r2
@L10925:
	br.n	 @L11062
	or	 r2,r0,r4
	align	 4
@L10924:
	ld	 r9,r31,92
	bcnd	 eq0,r9,@L11223
	ld.hu	 r13,r0,r9
	cmp	 r13,r13,51
	bb1	 ne,r13,@L11223
	ld	 r2,r31,92
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r20
	bcnd	 ne0,r2,@L10927
	ld	 r2,r31,92
	bsr.n	 _reg_mentioned_p
	or	 r3,r0,r18
	bcnd	 eq0,r2,@L10926
@L10927:
	ld	 r9,r31,92
@L11223:
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r9,2
	st	 r2,r31,92
@L10926:
	ld	 r9,r31,116
	ld	 r3,r31,92
	bcnd.n	 eq0,r9,@L10928
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r2,r13,lo16(_const0_rtx)
	br.n	 @L11224
	or	 r22,r0,r3
	align	 4
@L10928:
	or.u	 r13,r0,hi16(_const1_rtx)
	ld	 r2,r13,lo16(_const1_rtx)
	or	 r22,r0,r3
@L11224:
	ld.hu	 r11,r0,r22
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r21,r22,2
	or	 r13,r13,lo16(_mode_class)
	cmp	 r12,r11,59
	ld	 r19,r13[r21]
	bb0.n	 ne,r12,@L10932
	or	 r24,r0,r2
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L10935
	cmp	 r13,r11,63
	ld	 r2,r22,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L10936
	st	 r2,r22,4
	align	 4
@L10935:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L10936
	ld	 r2,r22,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r22,4
	ld	 r2,r22,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r22,8
@L10936:
	br.n	 @L10931
	or	 r2,r0,r22
	align	 4
@L10932:
	ld	 r13,r22,8
	bcnd	 ne0,r13,@L10938
	ld	 r2,r22,4
	br	 @L10931
	align	 4
@L10938:
	ld	 r2,r22,12
	bcnd	 ne0,r2,@L10931
	ld	 r13,r22,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r22,4
	bsr.n	 _gen_move_insn
	st	 r2,r22,12
	bsr.n	 _emit_insn_before
	ld	 r3,r22,8
	ld	 r2,r22,12
@L10931:
	ld.hu	 r12,r0,r24
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L10941
	or	 r22,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L11225
	cmp	 r13,r12,63
	ld.bu	 r13,r24,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L10942
	ld	 r23,r24,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L10942
	ld	 r13,r23,4
	st	 r13,r24,4
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L10945
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r24,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r24
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	br.n	 @L10940
	or	 r2,r0,r25
	align	 4
@L10942:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L10944
	cmp	 r13,r12,63
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L10945
	st	 r2,r24,4
	align	 4
@L10944:
@L11225:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L10945
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,4
	ld	 r2,r24,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,8
@L10945:
	br.n	 @L10940
	or	 r2,r0,r24
	align	 4
@L10941:
	ld	 r13,r24,8
	bcnd	 ne0,r13,@L10947
	ld	 r2,r24,4
	br.n	 @L11226
	cmp	 r13,r21,16
	align	 4
@L10947:
	ld	 r2,r24,12
	bcnd.n	 ne0,r2,@L11226
	cmp	 r13,r21,16
	ld	 r13,r24,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r24,4
	bsr.n	 _gen_move_insn
	st	 r2,r24,12
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	ld	 r2,r24,12
@L10940:
	cmp	 r13,r21,16
@L11226:
	bb0.n	 ne,r13,@L10950
	or	 r24,r0,r2
	ld.bu	 r13,r24,2
	cmp	 r13,r13,r21
	bb0	 ne,r13,@L10949
	ld.bu	 r13,r24,2
	bcnd	 eq0,r13,@L10949
@L10950:
	bsr	 _abort
	align	 4
@L10949:
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L10952
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L10952
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L10951
@L10952:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,47
	bb1	 ne,r13,@L10951
	ld.bu	 r13,r24,2
	bcnd.n	 eq0,r13,@L10951
	or	 r2,r0,r21
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
@L10951:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,55
	bb1	 ne,r13,@L10953
	ld.bu	 r2,r22,2
	bsr.n	 _memory_address_p
	ld	 r3,r22,4
	bcnd.n	 ne0,r2,@L11227
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld.bu	 r3,r22,2
	bsr.n	 _push_operand
	or	 r2,r0,r22
	bcnd.n	 eq0,r2,@L10954
	or.u	 r13,r0,hi16(_flag_force_addr)
@L11227:
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L10953
	ld	 r13,r22,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L10954
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L10954
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L10953
@L10954:
	ld	 r4,r22,4
	or	 r2,r0,r22
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r22,r0,r2
@L10953:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L11228
	cmp	 r13,r21,16
	ld.bu	 r2,r24,2
	bsr.n	 _memory_address_p
	ld	 r3,r24,4
	bcnd.n	 eq0,r2,@L10957
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L10956
	ld	 r13,r24,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L10957
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L10957
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L11228
	cmp	 r13,r21,16
@L10957:
	ld	 r4,r24,4
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L10956:
	cmp	 r13,r21,16
@L11228:
	bb1.n	 ne,r13,@L10958
	subu	 r13,r19,5
	bsr	 _abort
	align	 4
@L10958:
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L10959
	or.u	 r13,r0,hi16(_mode_unit_size)
	or	 r13,r13,lo16(_mode_unit_size)
	ld	 r12,r13[r21]
	or	 r3,r0,2
	cmp	 r13,r19,5
	bb1.n	 ne,r13,@L10960
	mak	 r2,r12,0<3>
	or	 r3,r0,1
@L10960:
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	or	 r15,r0,r2
@L10959:
	or.u	 r23,r0,hi16(_mov_optab)
	ld	 r11,r23,lo16(_mov_optab)
	lda.d	 r13,r11[r21]
	ld	 r12,r13,4
	cmp	 r13,r12,210
	bb0.n	 ne,r13,@L10962
	or.u	 r13,r0,hi16(_insn_gen_function)
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r2,r0,r22
	ld	 r13,r13[r12]
	jsr.n	 r13
	or	 r3,r0,r24
	bsr.n	 _emit_insn
	addu	 r1,r1,@L11277
@L11278:
	align	 4
@L10962:
	cmp	 r12,r15,16
	subu	 r13,r19,5
	extu	 r12,r12,1<ne>
	cmp	 r13,r13,1
	extu	 r13,r13,1<ls>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L10964
	mak	 r25,r15,0<3>
	addu	 r13,r11,r25
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L10964
	ld.bu	 r3,r22,2
	bsr.n	 _push_operand
	or	 r2,r0,r22
	bsr.n	 _get_last_insn
	or	 r21,r0,r2
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L10965
	or	 r16,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r22
	bsr	 _emit_insn
@L10965:
	ld	 r13,r23,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	addu	 r13,r13,r25
	ld	 r23,r13,4
	bcnd.n	 eq0,r21,@L10966
	or	 r19,r12,lo16(_insn_gen_function)
	or	 r2,r0,r22
	or	 r3,r0,r15
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L11279
@L11280:
	align	 4
@L10966:
	or	 r2,r0,r15
	bsr.n	 _gen_highpart
	or	 r3,r0,r22
@L11186:
	or	 r25,r0,r2
	or	 r2,r0,r15
	bsr.n	 _gen_highpart
	or	 r3,r0,r24
	ld	 r13,r19[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r13,r13,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	lda.d	 r13,r13[r15]
	ld	 r23,r13,4
	bcnd.n	 eq0,r21,@L10968
	or	 r19,r12,lo16(_insn_gen_function)
	or	 r2,r0,r22
	or	 r3,r0,r15
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L11281
@L11282:
	align	 4
@L10968:
	or	 r2,r0,r15
	bsr.n	 _gen_lowpart
	or	 r3,r0,r22
@L11187:
	or	 r25,r0,r2
	or	 r2,r0,r15
	bsr.n	 _gen_lowpart
	or	 r3,r0,r24
	ld	 r13,r19[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	bcnd	 eq0,r16,@L10971
	ld	 r24,r16,12
	br	 @L10972
	align	 4
@L10971:
	bsr	 _get_insns
	or	 r24,r0,r2
@L10972:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	st	 r2,r24,28
	bsr.n	 _get_last_insn
	addu	 r1,r1,@L11283
@L11284:
	align	 4
@L10964:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r23,r13,lo16(_mode_size)
	ld	 r13,r23[r21]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L10974
	bsr.n	 _get_last_insn
	or	 r25,r0,0
	or	 r19,r0,r2
	or	 r16,r0,r23
@L10975:
	ld	 r12,r16[r21]
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L10979
	addu	 r13,r12,6
@L10979:
	ext	 r13,r13,0<2>
	cmp	 r13,r25,r13
	bb0.n	 lt,r13,@L10976
	or	 r2,r0,r22
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	or	 r23,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	or	 r3,r0,r2
	bcnd.n	 ne0,r3,@L11229
	cmp	 r13,r23,0
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L10981
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L10981
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L10980
	or	 r2,r0,r24
@L10981:
	or	 r2,r0,r21
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r3,r0,r25
	or	 r4,r0,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	addu	 r1,r1,@L11285
@L11286:
	align	 4
@L10980:
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r21
@L11188:
	or	 r3,r0,r2
	cmp	 r13,r23,0
@L11229:
	cmp	 r12,r3,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L10984
	or	 r2,r0,r23
	bsr	 _abort
	align	 4
@L10984:
	addu	 r25,r25,1
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L11287
@L11288:
	align	 4
@L10976:
	bcnd	 eq0,r19,@L10986
	ld	 r24,r19,12
	br	 @L10987
	align	 4
@L10986:
	bsr	 _get_insns
	or	 r24,r0,r2
@L10987:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	br.n	 @L10930
	st	 r2,r24,28
	align	 4
@L10974:
	bsr	 _abort
	align	 4
@L10930:
	or	 r24,r0,r20
	ld.hu	 r13,r0,r24
	subu	 r13,r13,46
	mask	 r13,r13,0xffff
	or	 r25,r0,r18
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L10990
	or	 r23,r0,r17
	or	 r24,r0,r25
	or	 r2,r0,r17
	bsr.n	 _swap_condition
	or	 r25,r0,r20
	or	 r23,r0,r2
@L10990:
	or.u	 r13,r0,hi16(_flag_force_mem)
	ld	 r13,r13,lo16(_flag_force_mem)
	bcnd.n	 eq0,r13,@L11230
	or.u	 r13,r0,hi16(_inhibit_defer_pop)
	bsr.n	 _force_not_mem
	or	 r2,r0,r24
	or	 r24,r0,r2
	bsr.n	 _force_not_mem
	or	 r2,r0,r25
	or	 r25,r0,r2
	or.u	 r13,r0,hi16(_inhibit_defer_pop)
@L11230:
	ld	 r13,r13,lo16(_inhibit_defer_pop)
	bcnd.n	 ne0,r13,@L10992
	or.u	 r22,r0,hi16(_pending_stack_adjust)
	ld	 r4,r22,lo16(_pending_stack_adjust)
	bcnd.n	 eq0,r4,@L10994
	or	 r2,r0,46
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	bsr	 _adjust_stack
@L10994:
	st	 r0,r22,lo16(_pending_stack_adjust)
@L10992:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,46
	bb1	 ne,r13,@L10995
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb1	 ne,r13,@L10995
	ld	 r3,r31,108
	or	 r2,r0,r23
	or	 r4,r0,r24
	or	 r5,r0,r25
	bsr.n	 _simplify_relational_operation
	addu	 r1,r1,@L11289
@L11290:
	align	 4
@L10995:
	ld	 r6,r31,108
	or	 r2,r0,r24
	or	 r3,r0,r25
	or	 r4,r0,r23
	or	 r5,r0,0
	or	 r7,r0,r14
	bsr.n	 _emit_cmp_insn
	or	 r8,r0,0
	or.u	 r13,r0,hi16(_cc0_rtx)
	ld	 r4,r13,lo16(_cc0_rtx)
	or.u	 r13,r0,hi16(_const0_rtx)
	or	 r2,r0,r23
	ld	 r5,r13,lo16(_const0_rtx)
	bsr.n	 _gen_rtx
	or	 r3,r0,0
@L11189:
	or	 r4,r0,r2
	ld.hu	 r13,r0,r4
	cmp	 r13,r13,46
	bb1.n	 ne,r13,@L10996
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r9,r31,116
	ld	 r11,r13,lo16(_const0_rtx)
	cmp	 r12,r9,0
	cmp	 r2,r4,r11
	and	 r13,r2,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 ne0,r13,@L10999
	or	 r13,r2,r12
	extu	 r12,r13,1<eq>
	xor	 r13,r12,1
	bcnd.n	 eq0,r13,@L10997
	or.u	 r13,r0,hi16(_const1_rtx)
@L10999:
	br.n	 @L11062
	or	 r2,r0,r11
	align	 4
@L10997:
	ld	 r2,r13,lo16(_const1_rtx)
	br	 @L11062
	align	 4
@L10996:
	bsr	 _gen_label_rtx
	or.u	 r13,r0,hi16(_bcc_gen_fctn)
	or	 r13,r13,lo16(_bcc_gen_fctn)
	ld	 r3,r13[r17]
	bcnd.n	 ne0,r3,@L11000
	or	 r18,r0,r2
	bsr	 _abort
	align	 4
@L11000:
	jsr.n	 r3
	or	 r2,r0,r18
	bsr	 _emit_jump_insn
	ld	 r9,r31,116
	ld	 r3,r31,92
	bcnd.n	 eq0,r9,@L11001
	or.u	 r13,r0,hi16(_const1_rtx)
	ld	 r2,r13,lo16(_const1_rtx)
	br.n	 @L11231
	or	 r22,r0,r3
	align	 4
@L11001:
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r2,r13,lo16(_const0_rtx)
	or	 r22,r0,r3
@L11231:
	ld.hu	 r11,r0,r22
	or.u	 r13,r0,hi16(_mode_class)
	ld.bu	 r21,r22,2
	or	 r13,r13,lo16(_mode_class)
	cmp	 r12,r11,59
	ld	 r20,r13[r21]
	bb0.n	 ne,r12,@L11005
	or	 r24,r0,r2
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L11008
	cmp	 r13,r11,63
	ld	 r2,r22,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L11009
	st	 r2,r22,4
	align	 4
@L11008:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L11009
	ld	 r2,r22,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r22,4
	ld	 r2,r22,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r22,8
@L11009:
	br.n	 @L11004
	or	 r2,r0,r22
	align	 4
@L11005:
	ld	 r13,r22,8
	bcnd	 ne0,r13,@L11011
	ld	 r2,r22,4
	br	 @L11004
	align	 4
@L11011:
	ld	 r2,r22,12
	bcnd	 ne0,r2,@L11004
	ld	 r13,r22,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r22,4
	bsr.n	 _gen_move_insn
	st	 r2,r22,12
	bsr.n	 _emit_insn_before
	ld	 r3,r22,8
	ld	 r2,r22,12
@L11004:
	ld.hu	 r12,r0,r24
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L11014
	or	 r22,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L11232
	cmp	 r13,r12,63
	ld.bu	 r13,r24,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L11015
	ld	 r23,r24,4
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L11015
	ld	 r13,r23,4
	st	 r13,r24,4
	ld	 r13,r23,8
	bcnd	 eq0,r13,@L11018
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r24,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r24
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	br.n	 @L11013
	or	 r2,r0,r25
	align	 4
@L11015:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L11017
	cmp	 r13,r12,63
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L11018
	st	 r2,r24,4
	align	 4
@L11017:
@L11232:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L11018
	ld	 r2,r24,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,4
	ld	 r2,r24,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r24,8
@L11018:
	br.n	 @L11013
	or	 r2,r0,r24
	align	 4
@L11014:
	ld	 r13,r24,8
	bcnd	 ne0,r13,@L11020
	ld	 r2,r24,4
	br.n	 @L11233
	cmp	 r13,r21,16
	align	 4
@L11020:
	ld	 r2,r24,12
	bcnd.n	 ne0,r2,@L11233
	cmp	 r13,r21,16
	ld	 r13,r24,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r24,4
	bsr.n	 _gen_move_insn
	st	 r2,r24,12
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	ld	 r2,r24,12
@L11013:
	cmp	 r13,r21,16
@L11233:
	bb0.n	 ne,r13,@L11023
	or	 r24,r0,r2
	ld.bu	 r13,r24,2
	cmp	 r13,r13,r21
	bb0	 ne,r13,@L11022
	ld.bu	 r13,r24,2
	bcnd	 eq0,r13,@L11022
@L11023:
	bsr	 _abort
	align	 4
@L11022:
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L11025
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L11025
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L11024
@L11025:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,47
	bb1	 ne,r13,@L11024
	ld.bu	 r13,r24,2
	bcnd.n	 eq0,r13,@L11024
	or	 r2,r0,r21
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
@L11024:
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,55
	bb1	 ne,r13,@L11026
	ld.bu	 r2,r22,2
	bsr.n	 _memory_address_p
	ld	 r3,r22,4
	bcnd.n	 ne0,r2,@L11234
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld.bu	 r3,r22,2
	bsr.n	 _push_operand
	or	 r2,r0,r22
	bcnd.n	 eq0,r2,@L11027
	or.u	 r13,r0,hi16(_flag_force_addr)
@L11234:
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L11026
	ld	 r13,r22,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L11027
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L11027
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L11026
@L11027:
	ld	 r4,r22,4
	or	 r2,r0,r22
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r22,r0,r2
@L11026:
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,55
	bb1.n	 ne,r13,@L11235
	cmp	 r13,r21,16
	ld.bu	 r2,r24,2
	bsr.n	 _memory_address_p
	ld	 r3,r24,4
	bcnd.n	 eq0,r2,@L11030
	or.u	 r13,r0,hi16(_flag_force_addr)
	ld	 r13,r13,lo16(_flag_force_addr)
	bcnd	 eq0,r13,@L11029
	ld	 r13,r24,4
	ld.hu	 r12,r0,r13
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L11030
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L11030
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L11235
	cmp	 r13,r21,16
@L11030:
	ld	 r4,r24,4
	or	 r2,r0,r24
	bsr.n	 _change_address
	or	 r3,r0,0
	or	 r24,r0,r2
@L11029:
	cmp	 r13,r21,16
@L11235:
	bb1.n	 ne,r13,@L11031
	subu	 r13,r20,5
	bsr	 _abort
	align	 4
@L11031:
	cmp	 r13,r13,1
	bb0.n	 ls,r13,@L11032
	or.u	 r13,r0,hi16(_mode_unit_size)
	or	 r13,r13,lo16(_mode_unit_size)
	ld	 r12,r13[r21]
	or	 r3,r0,2
	cmp	 r13,r20,5
	bb1.n	 ne,r13,@L11033
	mak	 r2,r12,0<3>
	or	 r3,r0,1
@L11033:
	bsr.n	 _mode_for_size
	or	 r4,r0,0
	st	 r2,r31,132
@L11032:
	or.u	 r23,r0,hi16(_mov_optab)
	ld	 r11,r23,lo16(_mov_optab)
	lda.d	 r13,r11[r21]
	ld	 r12,r13,4
	cmp	 r13,r12,210
	bb0.n	 ne,r13,@L11035
	or.u	 r13,r0,hi16(_insn_gen_function)
	or	 r13,r13,lo16(_insn_gen_function)
	or	 r2,r0,r22
	ld	 r13,r13[r12]
	jsr.n	 r13
	or	 r3,r0,r24
	bsr.n	 _emit_insn
	addu	 r1,r1,@L11291
@L11292:
	align	 4
@L11035:
	subu	 r13,r20,5
	ld	 r9,r31,132
	cmp	 r13,r13,1
	extu	 r13,r13,1<ls>
	cmp	 r12,r9,16
	extu	 r12,r12,1<ne>
	and	 r13,r13,r12
	bcnd.n	 eq0,r13,@L11037
	mak	 r25,r9,0<3>
	addu	 r13,r11,r25
	ld	 r13,r13,4
	cmp	 r13,r13,210
	bb0	 ne,r13,@L11037
	ld.bu	 r3,r22,2
	bsr.n	 _push_operand
	or	 r2,r0,r22
	bsr.n	 _get_last_insn
	or	 r21,r0,r2
	ld.hu	 r13,r0,r22
	cmp	 r13,r13,51
	bb1.n	 ne,r13,@L11038
	or	 r19,r0,r2
	or	 r2,r0,42
	or	 r3,r0,0
	bsr.n	 _gen_rtx
	or	 r4,r0,r22
	bsr	 _emit_insn
@L11038:
	ld	 r13,r23,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	addu	 r13,r13,r25
	ld	 r23,r13,4
	bcnd.n	 eq0,r21,@L11039
	or	 r20,r12,lo16(_insn_gen_function)
	ld	 r3,r31,132
	or	 r2,r0,r22
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L11293
@L11294:
	align	 4
@L11039:
	ld	 r2,r31,132
	bsr.n	 _gen_highpart
	or	 r3,r0,r22
@L11190:
	or	 r25,r0,r2
	ld	 r2,r31,132
	bsr.n	 _gen_highpart
	or	 r3,r0,r24
	or	 r3,r0,r2
	ld	 r13,r20[r23]
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	or.u	 r13,r0,hi16(_mov_optab)
	ld	 r9,r31,132
	ld	 r13,r13,lo16(_mov_optab)
	or.u	 r12,r0,hi16(_insn_gen_function)
	lda.d	 r13,r13[r9]
	ld	 r23,r13,4
	bcnd.n	 eq0,r21,@L11041
	or	 r20,r12,lo16(_insn_gen_function)
	ld	 r3,r31,132
	or	 r2,r0,r22
	or	 r4,r0,0
	bsr.n	 _change_address
	addu	 r1,r1,@L11295
@L11296:
	align	 4
@L11041:
	ld	 r2,r31,132
	bsr.n	 _gen_lowpart
	or	 r3,r0,r22
@L11191:
	or	 r25,r0,r2
	ld	 r2,r31,132
	bsr.n	 _gen_lowpart
	or	 r3,r0,r24
	ld	 r13,r20[r23]
	or	 r3,r0,r2
	jsr.n	 r13
	or	 r2,r0,r25
	bsr	 _emit_insn
	bcnd	 eq0,r19,@L11044
	ld	 r24,r19,12
	br	 @L11045
	align	 4
@L11044:
	bsr	 _get_insns
	or	 r24,r0,r2
@L11045:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	st	 r2,r24,28
	bsr.n	 _get_last_insn
	addu	 r1,r1,@L11297
@L11298:
	align	 4
@L11037:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r23,r13,lo16(_mode_size)
	ld	 r13,r23[r21]
	cmp	 r13,r13,4
	bb0	 gt,r13,@L11047
	bsr.n	 _get_last_insn
	or	 r25,r0,0
	or	 r20,r0,r2
	or	 r19,r0,r23
@L11048:
	ld	 r12,r19[r21]
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L11052
	addu	 r13,r12,6
@L11052:
	ext	 r13,r13,0<2>
	cmp	 r13,r25,r13
	bb0.n	 lt,r13,@L11049
	or	 r2,r0,r22
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	or	 r23,r0,r2
	or	 r2,r0,r24
	or	 r3,r0,r25
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	or	 r3,r0,r2
	bcnd.n	 ne0,r3,@L11236
	cmp	 r13,r23,0
	ld.hu	 r12,r0,r24
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L11054
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L11054
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L11053
	or	 r2,r0,r24
@L11054:
	or	 r2,r0,r21
	bsr.n	 _force_const_mem
	or	 r3,r0,r24
	or	 r24,r0,r2
	or	 r3,r0,r25
	or	 r4,r0,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	addu	 r1,r1,@L11299
@L11300:
	align	 4
@L11053:
	or	 r3,r0,r25
	bsr.n	 _operand_subword_force
	or	 r4,r0,r21
@L11192:
	or	 r3,r0,r2
	cmp	 r13,r23,0
@L11236:
	cmp	 r12,r3,0
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd.n	 eq0,r13,@L11057
	or	 r2,r0,r23
	bsr	 _abort
	align	 4
@L11057:
	addu	 r25,r25,1
	bsr.n	 _emit_move_insn
	subu	 r1,r1,@L11301
@L11302:
	align	 4
@L11049:
	bcnd	 eq0,r20,@L11059
	ld	 r24,r20,12
	br	 @L11060
	align	 4
@L11059:
	bsr	 _get_insns
	or	 r24,r0,r2
@L11060:
	bsr	 _get_last_insn
	or	 r25,r0,r2
	or	 r2,r0,3
	or	 r3,r0,6
	ld	 r5,r25,28
	bsr.n	 _gen_rtx
	or	 r4,r0,r24
	st	 r2,r25,28
	ld	 r5,r24,28
	or	 r2,r0,3
	or	 r3,r0,7
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	br.n	 @L11003
	st	 r2,r24,28
	align	 4
@L11047:
	bsr	 _abort
	align	 4
@L11003:
	bsr.n	 _emit_label
	or	 r2,r0,r18
	ld	 r2,r31,92
@L11062:
@Lte47:
	ld	 r1,r31,80
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	ld.d	 r14,r31,32
	jmp.n	 r1
	addu	 r31,r31,144
	def	 @L11301,@L11302-@L11048
	def	 @L11299,@L11192-@L11300
	def	 @L11297,@L11003-@L11298
	def	 @L11295,@L11191-@L11296
	def	 @L11293,@L11190-@L11294
	def	 @L11291,@L11003-@L11292
	def	 @L11289,@L11189-@L11290
	def	 @L11287,@L11288-@L10975
	def	 @L11285,@L11188-@L11286
	def	 @L11283,@L10930-@L11284
	def	 @L11281,@L11187-@L11282
	def	 @L11279,@L11186-@L11280
	def	 @L11277,@L10930-@L11278
	def	 @L11275,@L10912-@L11276
	def	 @L11273,@L10898-@L11274
	def	 @L11271,@L10843-@L11272
	def	 @L11269,@L10843-@L11270
	def	 @L11267,@L10811-@L11268
	def	 @L11265,@L10686-@L11266
	def	 @L11263,@L11182-@L11264
	def	 @L11261,@L11182-@L11262
	def	 @L11259,@L11182-@L11260
	def	 @L11257,@L11182-@L11258
	def	 @L11255,@L11182-@L11256
	def	 @L11253,@L11182-@L11254
	def	 @L11251,@L10686-@L11252
	def	 @L11249,@L11179-@L11250
	def	 @L11247,@L10686-@L11248
	def	 @L11245,@L11179-@L11246
	def	 @L11243,@L10686-@L11244
	def	 @L11241,@L10686-@L11242
	def	 @L11239,@L10625-@L11240
	def	 @L11237,@L10625-@L11238

	align	 8
	global	 _do_tablejump
_do_tablejump:
	subu	 r31,r31,96
	st	 r1,r31,80
	st	 r15,r31,36
	st.d	 r24,r31,72
	st.d	 r22,r31,64
	or	 r7,r0,0
	st.d	 r20,r31,56
	or	 r8,r0,0
	st.d	 r18,r31,48
	or	 r23,r0,r2
	or	 r25,r0,r3
	or	 r2,r0,r4
	or	 r4,r0,98
	or	 r15,r0,r5
	or	 r5,r0,0
	or	 r24,r0,r6
	or	 r3,r0,r23
	or	 r6,r0,r25
	bsr.n	 _emit_cmp_insn
	st.d	 r16,r31,40
@Ltb48:
	bsr.n	 _gen_bltu
	or	 r2,r0,r24
	bsr.n	 _emit_jump_insn
	cmp	 r25,r25,4
	bb0	 ne,r25,@L11304
	ld	 r11,r0,r23
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	and	 r13,r11,0x8
	or	 r25,r0,r23
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L11306
	or	 r24,r0,4
	ld	 r13,r23,4
	or.u	 r12,r0,hi16(_mode_size)
	ld.bu	 r13,r13,2
	or	 r12,r12,lo16(_mode_size)
	ld	 r13,r12[r13]
	ld	 r12,r12,16
	cmp	 r13,r13,r12
	bb0	 ge,r13,@L11306
	bb0.n	 (31-26),r11,@L11306
	or	 r2,r0,4
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r25,r0,r2
@L11306:
	ld.bu	 r13,r25,2
	cmp	 r13,r24,r13
	bb1.n	 ne,r13,@L11307
	or.u	 r13,r0,hi16(_mode_class+16)
	br.n	 @L11305
	or	 r2,r0,r25
	align	 4
@L11307:
	ld	 r13,r13,lo16(_mode_class+16)
	cmp	 r13,r13,1
	bb1.n	 ne,r13,@L11308
	or.u	 r13,r0,hi16(_mode_size+16)
	ld	 r13,r13,lo16(_mode_size+16)
	mak	 r13,r13,0<3>
	cmp	 r13,r13,64
	bb1	 ne,r13,@L11308
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb1	 ne,r13,@L11537
	ld	 r2,r25,4
	bcnd.n	 ge0,r2,@L11308
	or	 r3,r0,0
	or	 r4,r0,4
	bsr.n	 _immed_double_const
	addu	 r1,r1,@L11644
@L11645:
	align	 4
@L11308:
	ld.hu	 r13,r0,r25
	cmp	 r13,r13,46
	bb0.n	 ne,r13,@L11619
	or	 r2,r0,4
@L11537:
	or.u	 r13,r0,hi16(_mode_class)
	or	 r12,r13,lo16(_mode_class)
	ld	 r13,r12,16
	cmp	 r13,r13,1
	bb1	 ne,r13,@L11309
	ld.bu	 r11,r25,2
	ld	 r13,r12[r11]
	cmp	 r13,r13,1
	bb1	 ne,r13,@L11309
	ld.hu	 r10,r0,r25
	cmp	 r13,r10,47
	bb0.n	 ne,r13,@L11310
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13,16
	ld	 r13,r13[r11]
	cmp	 r12,r12,r13
	bb1	 gt,r12,@L11309
	ld	 r13,r0,r25
	or.u	 r12,r0,0x37
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L11620
	cmp	 r13,r10,51
	or.u	 r13,r0,hi16(_direct_load+4)
	ld.b	 r13,r13,lo16(_direct_load+4)
	bcnd.n	 ne0,r13,@L11619
	or	 r2,r0,4
	cmp	 r13,r10,51
@L11620:
	bb1	 ne,r13,@L11309
@L11310:
	or	 r2,r0,4
@L11619:
	or	 r3,r0,r25
	bsr.n	 _gen_lowpart
	addu	 r1,r1,@L11646
@L11647:
	align	 4
@L11309:
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,4
	or	 r19,r0,r2
	or	 r23,r0,r25
	ld.bu	 r21,r19,2
	ld.bu	 r22,r23,2
	or.u	 r12,r0,hi16(_mode_class)
	ld.hu	 r11,r0,r19
	or	 r12,r12,lo16(_mode_class)
	ld	 r13,r12[r21]
	or	 r16,r0,100
	ld	 r12,r12[r22]
	or	 r20,r0,r19
	cmp	 r13,r13,2
	cmp	 r12,r12,2
	extu	 r18,r13,1<eq>
	cmp	 r13,r11,59
	bb0.n	 ne,r13,@L11316
	extu	 r17,r12,1<eq>
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L11319
	cmp	 r13,r11,63
	ld	 r2,r19,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L11320
	st	 r2,r19,4
	align	 4
@L11319:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L11320
	ld	 r2,r19,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r19,4
	ld	 r2,r19,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r19,8
@L11320:
	br.n	 @L11315
	or	 r2,r0,r20
	align	 4
@L11316:
	ld	 r13,r19,8
	bcnd	 ne0,r13,@L11322
	ld	 r2,r19,4
	br	 @L11315
	align	 4
@L11322:
	ld	 r2,r19,12
	bcnd	 ne0,r2,@L11315
	ld	 r13,r19,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r19,4
	bsr.n	 _gen_move_insn
	st	 r2,r19,12
	bsr.n	 _emit_insn_before
	ld	 r3,r19,8
	ld	 r2,r19,12
@L11315:
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L11325
	or	 r20,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L11621
	cmp	 r13,r12,63
	ld.bu	 r13,r23,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L11326
	ld	 r24,r23,4
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L11326
	ld	 r13,r24,4
	st	 r13,r23,4
	ld	 r13,r24,8
	bcnd	 eq0,r13,@L11329
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r23,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r23
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	br.n	 @L11324
	or	 r2,r0,r25
	align	 4
@L11326:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L11328
	cmp	 r13,r12,63
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L11329
	st	 r2,r23,4
	align	 4
@L11328:
@L11621:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L11329
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,4
	ld	 r2,r23,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,8
@L11329:
	br.n	 @L11324
	or	 r2,r0,r23
	align	 4
@L11325:
	ld	 r13,r23,8
	bcnd	 ne0,r13,@L11331
	ld	 r2,r23,4
	br.n	 @L11622
	cmp	 r13,r18,r17
	align	 4
@L11331:
	ld	 r2,r23,12
	bcnd.n	 ne0,r2,@L11622
	cmp	 r13,r18,r17
	ld	 r13,r23,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r23,4
	bsr.n	 _gen_move_insn
	st	 r2,r23,12
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	ld	 r2,r23,12
@L11324:
	cmp	 r13,r18,r17
@L11622:
	bb0.n	 ne,r13,@L11333
	or	 r23,r0,r2
	bsr	 _abort
	align	 4
@L11333:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	ld	 r11,r0,r23
	and	 r13,r11,0x8
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L11623
	ld	 r13,r23,4
	or.u	 r12,r0,hi16(_mode_size)
	ld.bu	 r13,r13,2
	or	 r12,r12,lo16(_mode_size)
	ld	 r13,r12[r13]
	ld	 r12,r12[r21]
	cmp	 r13,r13,r12
	bb0	 ge,r13,@L11334
	bb0.n	 (31-26),r11,@L11334
	or	 r2,r0,r21
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	or	 r22,r0,r21
	or	 r23,r0,r2
@L11334:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
@L11623:
	ld	 r13,r0,r20
	and	 r13,r13,0x8
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L11335
	cmp	 r13,r21,r22
	bsr	 _abort
	align	 4
@L11335:
	bb0.n	 ne,r13,@L11624
	or	 r2,r0,r20
	bcnd	 ne0,r22,@L11336
	ld.hu	 r12,r0,r23
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L11624
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L11624
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L11336
@L11624:
	or	 r3,r0,r23
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L11648
@L11649:
	align	 4
@L11336:
	bcnd.n	 eq0,r18,@L11338
	cmp	 r5,r22,8
	cmp	 r13,r21,9
	extu	 r11,r5,1<eq>
	extu	 r7,r13,1<eq>
	and	 r13,r11,r7
	bcnd.n	 ne0,r13,@L11608
	or	 r2,r0,108
	cmp	 r6,r21,11
	extu	 r12,r6,1<eq>
	and	 r13,r11,r12
	bcnd.n	 ne0,r13,@L11608
	or	 r2,r0,109
	cmp	 r8,r22,9
	extu	 r9,r8,1<eq>
	and	 r13,r9,r12
	bcnd.n	 eq0,r13,@L11341
	cmp	 r4,r21,11
	br.n	 @L11608
	or	 r2,r0,110
	align	 4
@L11341:
	cmp	 r10,r21,8
	extu	 r11,r10,1<eq>
	and	 r13,r9,r11
	bcnd.n	 ne0,r13,@L11608
	or	 r2,r0,111
	cmp	 r9,r22,11
	extu	 r12,r9,1<eq>
	and	 r13,r12,r11
	bcnd.n	 ne0,r13,@L11608
	or	 r2,r0,112
	and	 r13,r12,r7
	bcnd.n	 eq0,r13,@L11344
	cmp	 r12,r21,9
	or	 r2,r0,113
@L11608:
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L11650
@L11651:
	align	 4
@L11344:
	bb0.n	 ne,r8,@L11354
	or	 r2,r0,0
	bb0.n	 ls,r8,@L11376
	cmp	 r13,r22,10
	bb0.n	 ne,r5,@L11346
	cmp	 r13,r21,10
	br	 @L11345
	align	 4
@L11376:
	bb0	 ne,r13,@L11362
	bb0	 ne,r9,@L11368
	br	 @L11345
	align	 4
@L11346:
	bb0	 ne,r13,@L11349
	bb0	 ls,r13,@L11353
	bb0.n	 ne,r12,@L11348
	or.u	 r13,r0,hi16(_extendsfdf2_libfunc)
	br	 @L11345
	align	 4
@L11353:
	bb0.n	 ne,r4,@L11350
	or.u	 r13,r0,hi16(_extendsftf2_libfunc)
	br	 @L11345
	align	 4
@L11348:
	ld	 r2,r13,lo16(_extendsfdf2_libfunc)
	br	 @L11345
	align	 4
@L11349:
	or.u	 r13,r0,hi16(_extendsfxf2_libfunc)
	ld	 r2,r13,lo16(_extendsfxf2_libfunc)
	br	 @L11345
	align	 4
@L11350:
	ld	 r2,r13,lo16(_extendsftf2_libfunc)
	br	 @L11345
	align	 4
@L11354:
	cmp	 r13,r21,10
	bb0	 ne,r13,@L11357
	bb0	 ls,r13,@L11361
	bb0.n	 ne,r10,@L11356
	or.u	 r13,r0,hi16(_truncdfsf2_libfunc)
	br	 @L11345
	align	 4
@L11361:
	bb0.n	 ne,r6,@L11358
	or.u	 r13,r0,hi16(_extenddftf2_libfunc)
	br	 @L11345
	align	 4
@L11356:
	ld	 r2,r13,lo16(_truncdfsf2_libfunc)
	br	 @L11345
	align	 4
@L11357:
	or.u	 r13,r0,hi16(_extenddfxf2_libfunc)
	ld	 r2,r13,lo16(_extenddfxf2_libfunc)
	br	 @L11345
	align	 4
@L11358:
	ld	 r2,r13,lo16(_extenddftf2_libfunc)
	br	 @L11345
	align	 4
@L11362:
	bb0.n	 ne,r10,@L11364
	or.u	 r13,r0,hi16(_truncxfsf2_libfunc)
	bb0.n	 ne,r12,@L11365
	or.u	 r13,r0,hi16(_truncxfdf2_libfunc)
	br	 @L11345
	align	 4
@L11364:
	ld	 r2,r13,lo16(_truncxfsf2_libfunc)
	br	 @L11345
	align	 4
@L11365:
	ld	 r2,r13,lo16(_truncxfdf2_libfunc)
	br	 @L11345
	align	 4
@L11368:
	bb0.n	 ne,r10,@L11370
	or.u	 r13,r0,hi16(_trunctfsf2_libfunc)
	bb0.n	 ne,r12,@L11371
	or.u	 r13,r0,hi16(_trunctfdf2_libfunc)
	br	 @L11345
	align	 4
@L11370:
	ld	 r2,r13,lo16(_trunctfsf2_libfunc)
	br	 @L11345
	align	 4
@L11371:
	ld	 r2,r13,lo16(_trunctfdf2_libfunc)
@L11345:
	bcnd.n	 ne0,r2,@L11377
	or	 r3,r0,1
	bsr	 _abort
	align	 4
@L11377:
	or	 r4,r0,r21
	or	 r5,r0,1
	or	 r6,r0,r23
	bsr.n	 _emit_library_call
	or	 r7,r0,r22
	or	 r2,r0,r21
	bsr.n	 _hard_libcall_value
	addu	 r1,r1,@L11652
@L11653:
	align	 4
@L11338:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r24,r13,lo16(_mode_size)
	ld	 r13,r24[r22]
	ld	 r12,r24[r21]
	mak	 r13,r13,0<3>
	mak	 r11,r12,0<3>
	cmp	 r13,r13,r11
	bb1.n	 ge,r13,@L11625
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r11,32
	bb0.n	 gt,r13,@L11378
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L11379
	addu	 r13,r12,6
@L11379:
	or	 r2,r0,r21
	or	 r3,r0,r22
	or	 r4,r0,1
	bsr.n	 _can_extend_p
	ext	 r18,r13,0<2>
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb1.n	 ne,r13,@L11626
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r24[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L11382
	or.u	 r24,r0,hi16(_word_mode)
	or	 r2,r0,r21
	ld	 r3,r24,lo16(_word_mode)
	bsr.n	 _can_extend_p
	or	 r4,r0,1
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0	 ne,r13,@L11382
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r3,r0,r23
	bsr.n	 _convert_move
	or	 r4,r0,1
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r4,r0,r2
	or	 r2,r0,r25
	br.n	 @L11610
	or	 r3,r0,r20
	align	 4
@L11382:
	bsr	 _start_sequence
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L11384
	or	 r24,r0,r22
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r24,r13,lo16(_word_mode)
	br.n	 @L11627
	or	 r2,r0,r24
	align	 4
@L11384:
	or	 r2,r0,r24
@L11627:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,1
	or	 r25,r0,r2
	or	 r2,r0,r24
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	bsr.n	 _emit_move_insn
	or	 r3,r0,r25
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r2,r13[r24]
	or.u	 r13,r0,hi16(_const0_rtx)
	ld	 r24,r13,lo16(_const0_rtx)
	bcnd	 ge0,r2,@L11390
	addu	 r2,r2,3
@L11390:
	ext	 r22,r2,0<2>
	cmp	 r13,r22,r18
	bb0.n	 lt,r13,@L11392
	subu	 r13,r18,r22
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L11394
	subu	 r25,r18,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L11577
	cmp	 r13,r12,2
	bb0.n	 gt,r13,@L11578
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L11582
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L11582:
	bb1	 eq,r13,@L11580
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L11580:
	addu	 r22,r22,1
@L11578:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L11586
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L11586:
	bb1	 eq,r13,@L11584
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L11584:
	addu	 r22,r22,1
@L11577:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L11590
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L11590:
	bb1	 eq,r13,@L11588
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L11588:
	addu	 r22,r22,1
	cmp	 r13,r22,r18
	bb0	 lt,r13,@L11392
@L11394:
	or	 r2,r0,r20
	subu	 r3,r25,1
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L11594
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L11594:
	bb1	 eq,r13,@L11592
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L11592:
	or	 r2,r0,r20
	subu	 r3,r25,2
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L11598
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L11598:
	bb1	 eq,r13,@L11596
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L11596:
	or	 r2,r0,r20
	subu	 r3,r25,3
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L11602
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L11602:
	bb1	 eq,r13,@L11600
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L11600:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,4
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L11606
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L11606:
	bb1	 eq,r13,@L11604
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L11604:
	addu	 r22,r22,4
	cmp	 r13,r22,r18
	bb1	 lt,r13,@L11394
@L11392:
	bsr	 _get_insns
	bsr.n	 _end_sequence
	or	 r25,r0,r2
	or	 r2,r0,r16
	or	 r3,r0,r21
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r6,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_no_conflict_block
	addu	 r1,r1,@L11654
@L11655:
	align	 4
@L11378:
	or.u	 r13,r0,hi16(_mode_size)
@L11625:
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,32
	bb0.n	 gt,r13,@L11398
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	or	 r2,r0,r20
	br.n	 @L11611
	or	 r4,r0,0
	align	 4
@L11398:
	cmp	 r13,r21,3
	bb1.n	 ne,r13,@L11399
	cmp	 r13,r22,3
	cmp	 r13,r22,4
	bb0.n	 ne,r13,@L11400
	or	 r2,r0,4
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,1
@L11400:
	bsr	 _abort
	align	 4
@L11399:
	bb1.n	 ne,r13,@L11628
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r21,4
	bb0.n	 ne,r13,@L11402
	or	 r2,r0,4
	or	 r3,r0,r23
	or	 r4,r0,1
	bsr.n	 _convert_to_mode
	or	 r22,r0,4
	br.n	 @L11401
	or	 r23,r0,r2
	align	 4
@L11402:
	bsr	 _abort
	align	 4
@L11401:
	or.u	 r13,r0,hi16(_mode_size)
@L11628:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb1.n	 ge,r12,@L11629
	or.u	 r13,r0,hi16(_mode_size)
	ld	 r13,r0,r23
	or.u	 r12,r0,0x37
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L11406
	or.u	 r13,r0,hi16(_direct_load)
	or	 r13,r13,lo16(_direct_load)
	ld.b	 r13,r21,r13
	bcnd	 eq0,r13,@L11406
	bsr.n	 _mode_dependent_address_p
	ld	 r2,r23,4
	bcnd.n	 eq0,r2,@L11630
	or	 r2,r0,r21
@L11406:
	ld.hu	 r13,r0,r23
	cmp	 r12,r13,51
	cmp	 r13,r13,53
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L11404
	or	 r2,r0,r21
@L11630:
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	addu	 r1,r1,@L11656
@L11657:
	align	 4
@L11404:
	or.u	 r13,r0,hi16(_mode_size)
@L11629:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb0.n	 gt,r12,@L11407
	or	 r2,r0,r21
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,1
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0.n	 ne,r13,@L11408
	or.u	 r13,r0,hi16(_optimize)
@L11626:
	ld	 r13,r13,lo16(_optimize)
	bcnd	 le0,r13,@L11409
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,53
	bb1	 ne,r13,@L11409
	or	 r2,r0,r22
	bsr.n	 _force_reg
	or	 r3,r0,r23
	or	 r23,r0,r2
@L11409:
	or	 r2,r0,r25
	or	 r3,r0,r20
	or	 r4,r0,r23
@L11610:
	or	 r5,r0,r16
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L11658
@L11659:
	align	 4
@L11408:
	or	 r25,r0,r22
	bcnd.n	 eq0,r25,@L11412
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r24,r13,lo16(_mode_wider_mode)
	or	 r2,r0,r21
@L11631:
	or	 r3,r0,r25
	bsr.n	 _can_extend_p
	or	 r4,r0,1
	cmp	 r2,r2,210
	bb1.n	 eq,r2,@L11413
	or	 r2,r0,r25
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,1
	cmp	 r2,r2,210
	bb1.n	 ne,r2,@L11538
	or	 r2,r0,r25
@L11413:
	ld	 r25,r24[r25]
	bcnd.n	 ne0,r25,@L11631
	or	 r2,r0,r21
@L11412:
	bsr	 _abort
	align	 4
@L11407:
	cmp	 r13,r22,6
	extu	 r11,r13,1<eq>
	cmp	 r13,r21,4
	extu	 r13,r13,1<eq>
	and	 r13,r11,r13
	bcnd.n	 eq0,r13,@L11417
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L11660
@L11661:
	align	 4
@L11417:
	cmp	 r13,r21,2
	extu	 r9,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L11418
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L11662
@L11663:
	align	 4
@L11418:
	cmp	 r13,r21,1
	extu	 r10,r13,1<eq>
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L11419
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L11664
@L11665:
	align	 4
@L11419:
	cmp	 r13,r22,4
	extu	 r11,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L11420
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L11666
@L11667:
	align	 4
@L11420:
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L11421
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L11668
@L11669:
	align	 4
@L11421:
	cmp	 r13,r22,2
	extu	 r13,r13,1<eq>
	and	 r13,r13,r10
	bcnd.n	 eq0,r13,@L11422
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L11670
@L11671:
	align	 4
@L11422:
	bb1	 ge,r12,@L11423
	or	 r2,r0,r21
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	bsr.n	 _force_reg
	or	 r2,r0,r21
@L11609:
	or	 r3,r0,r2
	or	 r2,r0,r20
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L11672
@L11673:
	align	 4
@L11423:
	bsr	 _abort
	align	 4
@L11538:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,1
@L11612:
	or	 r3,r0,r2
	or	 r2,r0,r20
	or	 r4,r0,1
@L11611:
	bsr	 _convert_move
@L11312:
	or	 r2,r0,r19
@L11305:
	or	 r23,r0,r2
@L11304:
	or.u	 r13,r0,hi16(_mode_size+16)
	or	 r2,r0,46
	ld	 r4,r13,lo16(_mode_size+16)
	bsr.n	 _gen_rtx
	or	 r3,r0,0
	or	 r5,r0,r2
	or	 r2,r0,66
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r25,r0,r2
	or	 r2,r0,56
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r15
	or	 r5,r0,r2
	or	 r2,r0,63
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r25
	or	 r3,r0,r2
	bsr.n	 _memory_address_noforce
	or	 r2,r0,4
	or	 r23,r0,r2
	bsr.n	 _gen_reg_rtx
	or	 r2,r0,4
	or	 r19,r0,r2
	or	 r2,r0,55
	or	 r3,r0,4
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	ld	 r11,r0,r2
	or.u	 r12,r0,hi16(_mode_class)
	or	 r11,r11,32
	st	 r11,r0,r2
	or	 r20,r0,r19
	ld.bu	 r21,r19,2
	or	 r12,r12,lo16(_mode_class)
	extu	 r22,r11,8<8>
	ld	 r13,r12[r21]
	or	 r23,r0,r2
	ld	 r12,r12[r22]
	or	 r16,r0,99
	ld.hu	 r11,r0,r19
	cmp	 r13,r13,2
	cmp	 r12,r12,2
	extu	 r18,r13,1<eq>
	cmp	 r13,r11,59
	bb0.n	 ne,r13,@L11428
	extu	 r17,r12,1<eq>
	cmp	 r13,r11,55
	bb1.n	 ne,r13,@L11431
	cmp	 r13,r11,63
	ld	 r2,r19,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L11432
	st	 r2,r19,4
	align	 4
@L11431:
	cmp	 r12,r11,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L11432
	ld	 r2,r19,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r19,4
	ld	 r2,r19,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r19,8
@L11432:
	br.n	 @L11427
	or	 r2,r0,r20
	align	 4
@L11428:
	ld	 r13,r19,8
	bcnd	 ne0,r13,@L11434
	ld	 r2,r19,4
	br	 @L11427
	align	 4
@L11434:
	ld	 r2,r19,12
	bcnd	 ne0,r2,@L11427
	ld	 r13,r19,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r19,4
	bsr.n	 _gen_move_insn
	st	 r2,r19,12
	bsr.n	 _emit_insn_before
	ld	 r3,r19,8
	ld	 r2,r19,12
@L11427:
	ld.hu	 r12,r0,r23
	cmp	 r13,r12,59
	bb0.n	 ne,r13,@L11437
	or	 r20,r0,r2
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L11632
	cmp	 r13,r12,63
	ld.bu	 r13,r23,2
	cmp	 r13,r13,16
	bb0	 ne,r13,@L11438
	ld	 r24,r23,4
	ld.hu	 r13,r0,r24
	cmp	 r13,r13,59
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L11438
	ld	 r13,r24,4
	st	 r13,r23,4
	ld	 r13,r24,8
	bcnd	 eq0,r13,@L11441
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r23,2
	or	 r25,r0,r2
	bsr.n	 _gen_move_insn
	or	 r3,r0,r23
	bsr.n	 _emit_insn_before
	ld	 r3,r24,8
	br.n	 @L11436
	or	 r2,r0,r25
	align	 4
@L11438:
	cmp	 r13,r12,55
	bb1.n	 ne,r13,@L11440
	cmp	 r13,r12,63
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	br.n	 @L11441
	st	 r2,r23,4
	align	 4
@L11440:
@L11632:
	cmp	 r12,r12,66
	or	 r13,r13,r12
	extu	 r13,r13,1<eq>
	bcnd	 eq0,r13,@L11441
	ld	 r2,r23,4
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,4
	ld	 r2,r23,8
	bsr.n	 _protect_from_queue
	or	 r3,r0,0
	st	 r2,r23,8
@L11441:
	br.n	 @L11436
	or	 r2,r0,r23
	align	 4
@L11437:
	ld	 r13,r23,8
	bcnd	 ne0,r13,@L11443
	ld	 r2,r23,4
	br.n	 @L11633
	cmp	 r13,r18,r17
	align	 4
@L11443:
	ld	 r2,r23,12
	bcnd.n	 ne0,r2,@L11633
	cmp	 r13,r18,r17
	ld	 r13,r23,4
	bsr.n	 _gen_reg_rtx
	ld.bu	 r2,r13,2
	ld	 r3,r23,4
	bsr.n	 _gen_move_insn
	st	 r2,r23,12
	bsr.n	 _emit_insn_before
	ld	 r3,r23,8
	ld	 r2,r23,12
@L11436:
	cmp	 r13,r18,r17
@L11633:
	bb0.n	 ne,r13,@L11445
	or	 r23,r0,r2
	bsr	 _abort
	align	 4
@L11445:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
	ld	 r11,r0,r23
	and	 r13,r11,0x8
	cmp	 r13,r13,r12
	bb1	 ne,r13,@L11634
	ld	 r13,r23,4
	or.u	 r12,r0,hi16(_mode_size)
	ld.bu	 r13,r13,2
	or	 r12,r12,lo16(_mode_size)
	ld	 r13,r12[r13]
	ld	 r12,r12[r21]
	cmp	 r13,r13,r12
	bb0	 ge,r13,@L11446
	bb1.n	 (31-26),r11,@L11446
	or	 r2,r0,r21
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	or	 r22,r0,r21
	or	 r23,r0,r2
@L11446:
	or.u	 r12,r0,0x35
	or	 r12,r12,0x8
@L11634:
	ld	 r13,r0,r20
	and	 r13,r13,0x8
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L11447
	cmp	 r13,r21,r22
	bsr	 _abort
	align	 4
@L11447:
	bb0.n	 ne,r13,@L11635
	or	 r2,r0,r20
	bcnd	 ne0,r22,@L11448
	ld.hu	 r12,r0,r23
	subu	 r13,r12,56
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L11635
	subu	 r13,r12,46
	mask	 r13,r13,0xffff
	cmp	 r13,r13,1
	bb1.n	 ls,r13,@L11635
	mask	 r13,r12,0xffff
	cmp	 r12,r13,49
	cmp	 r13,r13,113
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd	 eq0,r12,@L11448
@L11635:
	or	 r3,r0,r23
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L11674
@L11675:
	align	 4
@L11448:
	bcnd.n	 eq0,r18,@L11450
	cmp	 r5,r22,8
	cmp	 r13,r21,9
	extu	 r11,r5,1<eq>
	extu	 r7,r13,1<eq>
	and	 r13,r11,r7
	bcnd.n	 ne0,r13,@L11613
	or	 r2,r0,108
	cmp	 r6,r21,11
	extu	 r12,r6,1<eq>
	and	 r13,r11,r12
	bcnd.n	 ne0,r13,@L11613
	or	 r2,r0,109
	cmp	 r8,r22,9
	extu	 r9,r8,1<eq>
	and	 r13,r9,r12
	bcnd.n	 eq0,r13,@L11453
	cmp	 r4,r21,11
	br.n	 @L11613
	or	 r2,r0,110
	align	 4
@L11453:
	cmp	 r10,r21,8
	extu	 r11,r10,1<eq>
	and	 r13,r9,r11
	bcnd.n	 ne0,r13,@L11613
	or	 r2,r0,111
	cmp	 r9,r22,11
	extu	 r12,r9,1<eq>
	and	 r13,r12,r11
	bcnd.n	 ne0,r13,@L11613
	or	 r2,r0,112
	and	 r13,r12,r7
	bcnd.n	 eq0,r13,@L11456
	cmp	 r12,r21,9
	or	 r2,r0,113
@L11613:
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L11676
@L11677:
	align	 4
@L11456:
	bb0.n	 ne,r8,@L11466
	or	 r2,r0,0
	bb0.n	 ls,r8,@L11488
	cmp	 r13,r22,10
	bb0.n	 ne,r5,@L11458
	cmp	 r13,r21,10
	br	 @L11457
	align	 4
@L11488:
	bb0	 ne,r13,@L11474
	bb0	 ne,r9,@L11480
	br	 @L11457
	align	 4
@L11458:
	bb0	 ne,r13,@L11461
	bb0	 ls,r13,@L11465
	bb0.n	 ne,r12,@L11460
	or.u	 r13,r0,hi16(_extendsfdf2_libfunc)
	br	 @L11457
	align	 4
@L11465:
	bb0.n	 ne,r4,@L11462
	or.u	 r13,r0,hi16(_extendsftf2_libfunc)
	br	 @L11457
	align	 4
@L11460:
	ld	 r2,r13,lo16(_extendsfdf2_libfunc)
	br	 @L11457
	align	 4
@L11461:
	or.u	 r13,r0,hi16(_extendsfxf2_libfunc)
	ld	 r2,r13,lo16(_extendsfxf2_libfunc)
	br	 @L11457
	align	 4
@L11462:
	ld	 r2,r13,lo16(_extendsftf2_libfunc)
	br	 @L11457
	align	 4
@L11466:
	cmp	 r13,r21,10
	bb0	 ne,r13,@L11469
	bb0	 ls,r13,@L11473
	bb0.n	 ne,r10,@L11468
	or.u	 r13,r0,hi16(_truncdfsf2_libfunc)
	br	 @L11457
	align	 4
@L11473:
	bb0.n	 ne,r6,@L11470
	or.u	 r13,r0,hi16(_extenddftf2_libfunc)
	br	 @L11457
	align	 4
@L11468:
	ld	 r2,r13,lo16(_truncdfsf2_libfunc)
	br	 @L11457
	align	 4
@L11469:
	or.u	 r13,r0,hi16(_extenddfxf2_libfunc)
	ld	 r2,r13,lo16(_extenddfxf2_libfunc)
	br	 @L11457
	align	 4
@L11470:
	ld	 r2,r13,lo16(_extenddftf2_libfunc)
	br	 @L11457
	align	 4
@L11474:
	bb0.n	 ne,r10,@L11476
	or.u	 r13,r0,hi16(_truncxfsf2_libfunc)
	bb0.n	 ne,r12,@L11477
	or.u	 r13,r0,hi16(_truncxfdf2_libfunc)
	br	 @L11457
	align	 4
@L11476:
	ld	 r2,r13,lo16(_truncxfsf2_libfunc)
	br	 @L11457
	align	 4
@L11477:
	ld	 r2,r13,lo16(_truncxfdf2_libfunc)
	br	 @L11457
	align	 4
@L11480:
	bb0.n	 ne,r10,@L11482
	or.u	 r13,r0,hi16(_trunctfsf2_libfunc)
	bb0.n	 ne,r12,@L11483
	or.u	 r13,r0,hi16(_trunctfdf2_libfunc)
	br	 @L11457
	align	 4
@L11482:
	ld	 r2,r13,lo16(_trunctfsf2_libfunc)
	br	 @L11457
	align	 4
@L11483:
	ld	 r2,r13,lo16(_trunctfdf2_libfunc)
@L11457:
	bcnd.n	 ne0,r2,@L11489
	or	 r3,r0,1
	bsr	 _abort
	align	 4
@L11489:
	or	 r4,r0,r21
	or	 r5,r0,1
	or	 r6,r0,r23
	bsr.n	 _emit_library_call
	or	 r7,r0,r22
	or	 r2,r0,r21
	bsr.n	 _hard_libcall_value
	addu	 r1,r1,@L11678
@L11679:
	align	 4
@L11450:
	or.u	 r13,r0,hi16(_mode_size)
	or	 r24,r13,lo16(_mode_size)
	ld	 r13,r24[r22]
	ld	 r12,r24[r21]
	mak	 r13,r13,0<3>
	mak	 r11,r12,0<3>
	cmp	 r13,r13,r11
	bb1.n	 ge,r13,@L11636
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r11,32
	bb0.n	 gt,r13,@L11490
	addu	 r13,r12,3
	bcnd	 ge0,r13,@L11491
	addu	 r13,r12,6
@L11491:
	or	 r2,r0,r21
	or	 r3,r0,r22
	or	 r4,r0,0
	bsr.n	 _can_extend_p
	ext	 r18,r13,0<2>
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb1.n	 ne,r13,@L11637
	or.u	 r13,r0,hi16(_optimize)
	ld	 r13,r24[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L11494
	or.u	 r24,r0,hi16(_word_mode)
	or	 r2,r0,r21
	ld	 r3,r24,lo16(_word_mode)
	bsr.n	 _can_extend_p
	or	 r4,r0,0
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0	 ne,r13,@L11494
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r3,r0,r23
	bsr.n	 _convert_move
	or	 r4,r0,0
	ld	 r2,r24,lo16(_word_mode)
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	or	 r4,r0,r2
	or	 r2,r0,r25
	br.n	 @L11615
	or	 r3,r0,r20
	align	 4
@L11494:
	bsr	 _start_sequence
	or.u	 r13,r0,hi16(_mode_size)
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,31
	bb1.n	 gt,r13,@L11496
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r22,r13,lo16(_word_mode)
@L11496:
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,0
	or	 r24,r0,r2
	or	 r2,r0,r22
	bsr.n	 _gen_lowpart
	or	 r3,r0,r20
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
	or.u	 r25,r0,hi16(_mode_size)
	or	 r25,r25,lo16(_mode_size)
	ld	 r2,r25[r22]
	mak	 r2,r2,0<3>
	bsr.n	 _size_int
	subu	 r2,r2,1
	or	 r5,r0,r2
	or	 r2,r0,78
	or	 r3,r0,r22
	or	 r4,r0,r24
	or	 r6,r0,0
	bsr.n	 _expand_shift
	or	 r7,r0,0
	or	 r24,r0,r2
	or.u	 r13,r0,hi16(_word_mode)
	or	 r4,r0,1
	ld	 r2,r13,lo16(_word_mode)
	bsr.n	 _convert_to_mode
	or	 r3,r0,r24
	ld	 r3,r25[r22]
	bcnd.n	 ge0,r3,@L11502
	or	 r24,r0,r2
	addu	 r3,r3,3
@L11502:
	ext	 r22,r3,0<2>
	cmp	 r13,r22,r18
	bb0.n	 lt,r13,@L11504
	subu	 r13,r18,r22
	mask	 r12,r13,3
	bcnd.n	 eq0,r12,@L11506
	subu	 r25,r18,r22
	cmp	 r13,r12,1
	bb0.n	 gt,r13,@L11543
	cmp	 r13,r12,2
	bb0.n	 gt,r13,@L11544
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L11548
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L11548:
	bb1	 eq,r13,@L11546
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L11546:
	addu	 r22,r22,1
@L11544:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L11552
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L11552:
	bb1	 eq,r13,@L11550
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L11550:
	addu	 r22,r22,1
@L11543:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,1
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L11556
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L11556:
	bb1	 eq,r13,@L11554
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L11554:
	addu	 r22,r22,1
	cmp	 r13,r22,r18
	bb0	 lt,r13,@L11504
@L11506:
	or	 r2,r0,r20
@L11638:
	subu	 r3,r25,1
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L11560
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L11560:
	bb1	 eq,r13,@L11558
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L11558:
	or	 r2,r0,r20
	subu	 r3,r25,2
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L11564
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L11564:
	bb1	 eq,r13,@L11562
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L11562:
	or	 r2,r0,r20
	subu	 r3,r25,3
	or	 r4,r0,1
	bsr.n	 _operand_subword
	or	 r5,r0,r21
	bcnd.n	 ne0,r2,@L11568
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L11568:
	bb1	 eq,r13,@L11566
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L11566:
	or	 r2,r0,r20
	or	 r4,r0,1
	subu	 r25,r25,4
	or	 r5,r0,r21
	bsr.n	 _operand_subword
	or	 r3,r0,r25
	bcnd.n	 ne0,r2,@L11572
	cmp	 r13,r24,r2
	bsr	 _abort
	align	 4
@L11572:
	bb1	 eq,r13,@L11570
	bsr.n	 _emit_move_insn
	or	 r3,r0,r24
@L11570:
	addu	 r22,r22,4
	cmp	 r13,r22,r18
	bb1.n	 lt,r13,@L11638
	or	 r2,r0,r20
@L11504:
	bsr	 _get_insns
	bsr.n	 _end_sequence
	or	 r25,r0,r2
	or	 r2,r0,r16
	or	 r3,r0,r21
	bsr.n	 _gen_rtx
	or	 r4,r0,r23
	or	 r6,r0,r2
	or	 r2,r0,r25
	or	 r3,r0,r20
	or	 r4,r0,r23
	or	 r5,r0,0
	bsr.n	 _emit_no_conflict_block
	addu	 r1,r1,@L11680
@L11681:
	align	 4
@L11490:
	or.u	 r13,r0,hi16(_mode_size)
@L11636:
	or	 r13,r13,lo16(_mode_size)
	ld	 r13,r13[r22]
	mak	 r13,r13,0<3>
	cmp	 r13,r13,32
	bb0.n	 gt,r13,@L11510
	or.u	 r13,r0,hi16(_word_mode)
	ld	 r2,r13,lo16(_word_mode)
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	addu	 r1,r1,@L11682
@L11683:
	align	 4
@L11510:
	cmp	 r13,r21,3
	bb1.n	 ne,r13,@L11511
	cmp	 r13,r22,3
	cmp	 r13,r22,4
	bb0.n	 ne,r13,@L11512
	or	 r2,r0,4
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,0
@L11512:
	bsr	 _abort
	align	 4
@L11511:
	bb1.n	 ne,r13,@L11639
	or.u	 r13,r0,hi16(_mode_size)
	cmp	 r13,r21,4
	bb0.n	 ne,r13,@L11514
	or	 r2,r0,4
	or	 r3,r0,r23
	or	 r4,r0,0
	bsr.n	 _convert_to_mode
	or	 r22,r0,4
	br.n	 @L11513
	or	 r23,r0,r2
	align	 4
@L11514:
	bsr	 _abort
	align	 4
@L11513:
	or.u	 r13,r0,hi16(_mode_size)
@L11639:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb1.n	 ge,r12,@L11640
	or.u	 r13,r0,hi16(_mode_size)
	ld	 r13,r0,r23
	or.u	 r12,r0,0x37
	and	 r13,r13,0x10
	cmp	 r13,r13,r12
	bb1.n	 ne,r13,@L11518
	or.u	 r13,r0,hi16(_direct_load)
	or	 r13,r13,lo16(_direct_load)
	ld.b	 r13,r21,r13
	bcnd	 eq0,r13,@L11518
	bsr.n	 _mode_dependent_address_p
	ld	 r2,r23,4
	bcnd.n	 eq0,r2,@L11641
	or	 r2,r0,r21
@L11518:
	ld.hu	 r13,r0,r23
	cmp	 r12,r13,51
	cmp	 r13,r13,53
	or	 r12,r12,r13
	extu	 r12,r12,1<eq>
	bcnd.n	 eq0,r12,@L11516
	or	 r2,r0,r21
@L11641:
	or	 r3,r0,r23
	bsr.n	 _gen_lowpart
	addu	 r1,r1,@L11684
@L11685:
	align	 4
@L11516:
	or.u	 r13,r0,hi16(_mode_size)
@L11640:
	or	 r13,r13,lo16(_mode_size)
	ld	 r12,r13[r21]
	ld	 r13,r13[r22]
	mak	 r12,r12,0<3>
	mak	 r13,r13,0<3>
	cmp	 r12,r12,r13
	bb0.n	 gt,r12,@L11519
	or	 r2,r0,r21
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,0
	or	 r25,r0,r2
	cmp	 r13,r25,210
	bb0.n	 ne,r13,@L11520
	or.u	 r13,r0,hi16(_optimize)
@L11637:
	ld	 r13,r13,lo16(_optimize)
	bcnd	 le0,r13,@L11521
	ld.hu	 r13,r0,r23
	cmp	 r13,r13,53
	bb1.n	 ne,r13,@L11642
	or	 r2,r0,r25
	or	 r2,r0,r22
	bsr.n	 _force_reg
	or	 r3,r0,r23
	or	 r23,r0,r2
@L11521:
	or	 r2,r0,r25
@L11642:
	or	 r3,r0,r20
	or	 r4,r0,r23
@L11615:
	or	 r5,r0,r16
	bsr.n	 _emit_unop_insn
	addu	 r1,r1,@L11686
@L11687:
	align	 4
@L11520:
	or	 r25,r0,r22
	bcnd.n	 eq0,r25,@L11524
	or.u	 r13,r0,hi16(_mode_wider_mode)
	or	 r24,r13,lo16(_mode_wider_mode)
	or	 r2,r0,r21
@L11643:
	or	 r3,r0,r25
	bsr.n	 _can_extend_p
	or	 r4,r0,0
	cmp	 r2,r2,210
	bb1.n	 eq,r2,@L11525
	or	 r2,r0,r25
	or	 r3,r0,r22
	bsr.n	 _can_extend_p
	or	 r4,r0,0
	cmp	 r2,r2,210
	bb1.n	 ne,r2,@L11539
	or	 r2,r0,r25
@L11525:
	ld	 r25,r24[r25]
	bcnd.n	 ne0,r25,@L11643
	or	 r2,r0,r21
@L11524:
	bsr	 _abort
	align	 4
@L11519:
	cmp	 r13,r22,6
	extu	 r11,r13,1<eq>
	cmp	 r13,r21,4
	extu	 r13,r13,1<eq>
	and	 r13,r11,r13
	bcnd.n	 eq0,r13,@L11529
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L11688
@L11689:
	align	 4
@L11529:
	cmp	 r13,r21,2
	extu	 r9,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L11530
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L11690
@L11691:
	align	 4
@L11530:
	cmp	 r13,r21,1
	extu	 r10,r13,1<eq>
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L11531
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L11692
@L11693:
	align	 4
@L11531:
	cmp	 r13,r22,4
	extu	 r11,r13,1<eq>
	and	 r13,r11,r9
	bcnd.n	 eq0,r13,@L11532
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L11694
@L11695:
	align	 4
@L11532:
	and	 r13,r11,r10
	bcnd.n	 eq0,r13,@L11533
	or	 r2,r0,r22
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L11696
@L11697:
	align	 4
@L11533:
	cmp	 r13,r22,2
	extu	 r13,r13,1<eq>
	and	 r13,r13,r10
	bcnd.n	 eq0,r13,@L11534
	or	 r3,r0,r23
	bsr.n	 _force_reg
	addu	 r1,r1,@L11698
@L11699:
	align	 4
@L11534:
	bb1.n	 ge,r12,@L11535
	or	 r2,r0,r21
	bsr.n	 _gen_lowpart
	or	 r3,r0,r23
	or	 r3,r0,r2
	bsr.n	 _force_reg
	or	 r2,r0,r21
@L11614:
	or	 r3,r0,r2
	or	 r2,r0,r20
	bsr.n	 _emit_move_insn
	addu	 r1,r1,@L11700
@L11701:
	align	 4
@L11535:
	bsr	 _abort
	align	 4
@L11539:
	or	 r3,r0,r23
	bsr.n	 _convert_to_mode
	or	 r4,r0,0
@L11616:
	or	 r3,r0,r2
	or	 r2,r0,r20
	bsr.n	 _convert_move
	or	 r4,r0,0
@L11424:
	or	 r2,r0,r19
	bsr.n	 _gen_tablejump
	or	 r3,r0,r15
	bsr	 _emit_jump_insn
	or.u	 r13,r0,hi16(_flag_pic)
	ld	 r13,r13,lo16(_flag_pic)
	bcnd	 ne0,r13,@L11536
	bsr	 _emit_barrier
@L11536:
@Lte48:
	ld	 r1,r31,80
	ld	 r15,r31,36
	ld.d	 r24,r31,72
	ld.d	 r22,r31,64
	ld.d	 r20,r31,56
	ld.d	 r18,r31,48
	ld.d	 r16,r31,40
	jmp.n	 r1
	addu	 r31,r31,96
	def	 @L11700,@L11424-@L11701
	def	 @L11698,@L11616-@L11699
	def	 @L11696,@L11616-@L11697
	def	 @L11694,@L11616-@L11695
	def	 @L11692,@L11616-@L11693
	def	 @L11690,@L11616-@L11691
	def	 @L11688,@L11616-@L11689
	def	 @L11686,@L11424-@L11687
	def	 @L11684,@L11614-@L11685
	def	 @L11682,@L11616-@L11683
	def	 @L11680,@L11424-@L11681
	def	 @L11678,@L11614-@L11679
	def	 @L11676,@L11424-@L11677
	def	 @L11674,@L11424-@L11675
	def	 @L11672,@L11312-@L11673
	def	 @L11670,@L11612-@L11671
	def	 @L11668,@L11612-@L11669
	def	 @L11666,@L11612-@L11667
	def	 @L11664,@L11612-@L11665
	def	 @L11662,@L11612-@L11663
	def	 @L11660,@L11612-@L11661
	def	 @L11658,@L11312-@L11659
	def	 @L11656,@L11609-@L11657
	def	 @L11654,@L11312-@L11655
	def	 @L11652,@L11609-@L11653
	def	 @L11650,@L11312-@L11651
	def	 @L11648,@L11312-@L11649
	def	 @L11646,@L11305-@L11647
	def	 @L11644,@L11305-@L11645

	comm	 _cse_not_expected,4
	comm	 _inhibit_defer_pop,4
	comm	 _pending_stack_adjust,4
	comm	 _cleanups_this_call,4
	bss	 _saveregs_value,4,4
	bss	 _direct_load,21,8
	bss	 _direct_store,21,8
	bss	 _movstr_optab,84,8
	bss	 _pending_chain,4,4
