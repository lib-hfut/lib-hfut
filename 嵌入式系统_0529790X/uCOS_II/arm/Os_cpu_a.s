;*********************************************************************************************************
;                                               uC/OS-II
;                                         The Real-Time Kernel
;
;                          (c) Copyright 1992-2003, Jean J. Labrosse, Weston, FL
;                                          All Rights Reserved
;
;                                               ARM920T Port
;                                            ADS v1.2 Compiler
;                                             Samsung S3C2440A
;
; File    : os_cpu_a.s refrence to ucos application note for arm AN-1014
; Des	  : S3C2440 uC/OS-II Port 
; by      : tangxiaofeng xidian 503
; History : 
;  OSCtxSw(), OSIntCtxSw()  OSStartHighRdy() OS_CPU_IRQ_ISR() OSTickISR()
;******************************************************************************************************** */

SRCPND   	EQU  0x4a000000    ; Source pending
INTPND   	EQU  0x4a000010    ; Interrupt request status

rEINTPEND   EQU  0x560000a8
INTOFFSET   EQU  0x4a000014


USERMODE    EQU 	0x10
FIQMODE     EQU 	0x11
IRQMODE     EQU 	0x12
SVCMODE     EQU 	0x13
ABORTMODE   EQU 	0x17
UNDEFMODE   EQU 	0x1b
MODEMASK    EQU 	0x1f
NOINT       EQU 	0xc0

;*********************************************************************************************************
;                                    EXPORT and EXTERNAL REFERENCES
;*********************************************************************************************************/
	IMPORT  OSRunning
	IMPORT  OSTCBCur
	IMPORT  OSTCBHighRdy
	IMPORT  OSPrioCur
	IMPORT  OSPrioHighRdy
	IMPORT  OSIntNesting
	
			
	IMPORT  OSIntEnter
	IMPORT  OSIntExit
	IMPORT  OSTaskSwHook
	IMPORT  OSTimeTick
	
	IMPORT  HandleEINT0
	

	EXPORT  OSStartHighRdy
	EXPORT  OSCtxSw
	EXPORT  OSTickISR	
	EXPORT  OSIntCtxSw

	EXPORT  OSCPUSaveSR
	EXPORT  OSCPURestoreSR
	
	EXPORT  OS_CPU_IRQ_ISR
	
	
	AREA UCOS_ARM, CODE, READONLY
	
;*********************************************************************************************************
;                                          START MULTITASKING
;                                       void OSStartHighRdy(void)
;
; The stack frame is assumed to look as follows:
;
;							    Entry Point(Task Name)				(High memory)
;                               LR(R14)
;                               R12
;                               R11
;                               R10
;                               R9
;                               R8
;                               R7
;                               R6
;                               R5
;                               R4
;                               R3
;                               R2
;                               R1
;                               R0 : argument
; OSTCBHighRdy->OSTCBStkPtr --> CPSR								(Low memory)
;
; Note : OSStartHighRdy() MUST:
;           a) Call OSTaskSwHook() then,
;           b) Set OSRunning to TRUE,
;           c) Switch to the highest priority task.
;********************************************************************************************************** */
OSStartHighRdy  
	;----------------------------------------------------------------------------------	
	; OSRunning = TRUE;
	;----------------------------------------------------------------------------------	
	
	MSR     CPSR_cxsf,#SVCMODE|NOINT     ;Switch to SVC mode with IRQ&FIQ disable
	
	BL		OSTaskSwHook            ;Call user define Task switch hook
	
	LDR		R0, =OSRunning          ; OSRunning =TRUE
	MOV		R1, #1
	STRB 	R1, [R0]

	;----------------------------------------------------------------------------------		
	; 		SP = OSTCBHighRdy->OSTCBStkPtr;
	;----------------------------------------------------------------------------------	
	LDR 	R0, =OSTCBHighRdy
	LDR 	R0, [R0]         
	LDR 	SP, [R0]         

	;----------------------------------------------------------------------------------		
	; Prepare to return to proper mode
	;----------------------------------------------------------------------------------	
	LDMFD 	SP!, {R0}  
	MSR 	SPSR_cxsf, R0
	LDMFD 	SP!, {R0-R12, LR, PC}^


;**********************************************************************************************************
;                                PERFORM A CONTEXT SWITCH (From task level)
;                                           void OSCtxSw(void)
;
; Note(s): 	   1) Upon entry: 
;              	  OSTCBCur      points to the OS_TCB of the task to suspend
;              	  OSTCBHighRdy  points to the OS_TCB of the task to resume
;
;          	   2) The stack frame of the task to suspend looks as follows:
;                                                   
;                                                   PC                    (High memory)
;				  									LR(R14)					
;           					                    R12
; 			                      			        R11
;           		                			    R10
;                   		           			 	R9
;                           		    			R8
;                               					R7
;                               					R6
;                               					R5
;                               					R4
;                               					R3
;                               					R2
;                               					R1
;                               					R0
; 						OSTCBCur->OSTCBStkPtr ----> CPSR					(Low memory)
;
;
;          	   3) The stack frame of the task to resume looks as follows:
;
;			  		  								PC				(High memory)
;                                                   LR(R14)	
;			           			                    R12
;           		            			        R11
;                   		        			    R10
;                           		   			 	R9
;                               					R8
;                               					R7
;			                               			R6
;           		                    			R5
;                   		            			R4
;                           		    			R3
;                               					R2
;                               					R1
;			                               			R0
; 					OSTCBHighRdy->OSTCBStkPtr ---->	CPSR					(Low memory)
;*********************************************************************************************************/
OSCtxSw
	
	STMFD	SP!, {LR}           ;PC
	STMFD	SP!, {R0-R12, LR}   ;R0-R12 LR
	MRS		R0,  CPSR       ;Push CPSR
	STMFD	SP!, {R0}	
		
	;----------------------------------------------------------------------------------
	; 		OSTCBCur->OSTCBStkPtr = SP
	;----------------------------------------------------------------------------------		
	LDR		R0, =OSTCBCur
	LDR		R0, [R0]
	STR		SP, [R0]
	
	;----------------------------------------------------------------------------------		
	; OSTaskSwHook();
	;---------------------------------------------------------------------------------	
	BL 		OSTaskSwHook

	;----------------------------------------------------------------------------------			
	; OSTCBCur = OSTCBHighRdy;
	;----------------------------------------------------------------------------------		
	LDR		R0, =OSTCBHighRdy
	LDR		R1, =OSTCBCur
	LDR		R0, [R0]
	STR		R0, [R1]
	
	;----------------------------------------------------------------------------------		
	; OSPrioCur = OSPrioHighRdy;
	;----------------------------------------------------------------------------------		
	LDR		R0, =OSPrioHighRdy
	LDR		R1, =OSPrioCur
	LDRB	R0, [R0]
	STRB	R0, [R1]
	
	;----------------------------------------------------------------------------------		
	;  OSTCBHighRdy->OSTCBStkPtr;
	;----------------------------------------------------------------------------------		
	LDR		R0, =OSTCBHighRdy
	LDR		R0, [R0]
	LDR		SP, [R0]

	;----------------------------------------------------------------------------------	
	;Restore New task context
	;----------------------------------------------------------------------------------	
	LDMFD 	SP!, {R0}		;POP CPSR
	MSR 	SPSR_cxsf, R0
	LDMFD 	SP!, {R0-R12, LR, PC}^	

	
;*********************************************************************************************************
;                                            TICK HANDLER
;
; Description:  
;     This handles all the Timer0(INT_TIMER0) interrupt which is used to generate the uC/OS-II tick.
;*********************************************************************************************************/

OSTickISR
	MOV     R5,LR	
	MOV 	R1, #1
	MOV		R1, R1, LSL #10		; Timer0 Source Pending Reg.
	LDR 	R0, =SRCPND
	LDR     R2, [R0]
	ORR     R1, R1,R2
	STR 	R1, [R0]

	LDR		R0, =INTPND
	LDR		R1, [R0]
	STR		R1, [R0]		

	;----------------------------------------------------------------------------------		
	; OSTimeTick();
	;----------------------------------------------------------------------------------	
	BL		OSTimeTick
	
  	
	MOV    PC, R5        		; Return 	
	
;*********************************************************************************************************
;                                PERFORM A CONTEXT SWITCH (From an ISR)
;                                        void OSIntCtxSw(void)
;
; Description: 1) This code performs a context switch if a higher priority task has been made ready-to-run
;               	during an ISR.
;
;          	   2) The stack frame of the task to suspend looks as follows:
;
;				  									PC					(High memory)
;                                                   LR(R14)
;           					                    R12
; 			                      			        R11
;           		                			    R10
;                   		           			 	R9
;                           		    			R8
;                               					R7
;                               					R6
;                               					R5
;                               					R4
;                               					R3
;                               					R2
;                               					R1
;                               					R0
;                               					
; 						OSTCBCur->OSTCBStkPtr ----> CPSR					(Low memory)
;
;
;          	   3) The stack frame of the task to resume looks as follows:
;
;			  		  								PC					(High memory)
;                                                   LR(R14)	
;			           			                    R12
;           		            			        R11
;                   		        			    R10
;                           		   			 	R9
;                               					R8
;                               					R7
;			                               			R6
;           		                    			R5
;                   		            			R4
;                           		    			R3
;                               					R2
;                               					R1
;			                               			R0
; 					OSTCBHighRdy->OSTCBStkPtr ---->	CPSR					(Low memory)
;*********************************************************************************************************/
OSIntCtxSw
	;----------------------------------------------------------------------------------		
	; Call OSTaskSwHook();
	;----------------------------------------------------------------------------------	
	BL 		OSTaskSwHook
	
	;----------------------------------------------------------------------------------			
	; OSTCBCur = OSTCBHighRdy;
	;----------------------------------------------------------------------------------		
	LDR		R0, =OSTCBHighRdy
	LDR		R1, =OSTCBCur
	LDR		R0, [R0]
	STR		R0, [R1]
	
	;----------------------------------------------------------------------------------		
	; OSPrioCur = OSPrioHighRdy;
	;----------------------------------------------------------------------------------		
	LDR		R0, =OSPrioHighRdy
	LDR		R1, =OSPrioCur
	LDRB	R0, [R0]
	STRB	R0, [R1]
	
	;----------------------------------------------------------------------------------		
	; 		SP = OSTCBHighRdy->OSTCBStkPtr;
	;----------------------------------------------------------------------------------		
	LDR		R0, =OSTCBHighRdy
	LDR		R0, [R0]
	LDR		SP, [R0]
	
	;----------------------------------------------------------------------------------	
	; Restore New Task context
	;----------------------------------------------------------------------------------	
	LDMFD 	SP!, {R0}              ;POP CPSR
	MSR 	SPSR_cxsf, R0
	LDMFD 	SP!, {R0-R12, LR, PC}^	
	

	
OS_CPU_IRQ_ISR 	

	STMFD   SP!, {R1-R3}			; We will use R1-R3 as temporary registers
;----------------------------------------------------------------------------
;   R1--SP
;	R2--PC 
;   R3--SPSR
;------------------------------------------------------------------------
	MOV     R1, SP
	ADD     SP, SP, #12             ;Adjust IRQ stack pointer
	SUB     R2, LR, #4              ;Adjust PC for return address to task

	MRS     R3, SPSR				; Copy SPSR (Task CPSR)
	
   

	MSR     CPSR_cxsf, #SVCMODE|NOINT   ;Change to SVC mode

									; SAVE TASK''S CONTEXT ONTO OLD TASK''S STACK
									
	STMFD   SP!, {R2}				; Push task''s PC 
	STMFD   SP!, {R4-R12, LR}		; Push task''s LR,R12-R4
	
	LDMFD   R1!, {R4-R6}			; Load Task''s R1-R3 from IRQ stack 
	STMFD   SP!, {R4-R6}			; Push Task''s R1-R3 to SVC stack
	STMFD   SP!, {R0}			    ; Push Task''s R0 to SVC stack
	
	STMFD   SP!, {R3}				; Push task''s CPSR
	
	LDR     R0,=OSIntNesting        ;OSIntNesting++
	LDRB    R1,[R0]
	ADD     R1,R1,#1
	STRB    R1,[R0] 
	
	CMP     R1,#1                   ;if(OSIntNesting==1){
	BNE     %F1
	 
	LDR     R4,=OSTCBCur            ;OSTCBHighRdy->OSTCBStkPtr=SP;
	LDR     R5,[R4]
	STR     SP,[R5]                 ;}
	
1
	MSR    CPSR_c,#IRQMODE|NOINT    ;Change to IRQ mode to use IRQ stack to handle interrupt
	
	LDR     R0, =INTOFFSET
    LDR     R0, [R0]
       
    LDR     R1, IRQIsrVect
    MOV     LR, PC                          ; Save LR befor jump to the C function we need return back
    LDR     PC, [R1, R0, LSL #2]            ; Call OS_CPU_IRQ_ISR_handler();   
    
    MSR		CPSR_c,#SVCMODE|NOINT   ;Change to SVC mode
    BL 		OSIntExit           ;Call OSIntExit
    
    LDMFD   SP!,{R4}               ;POP the task''s CPSR 
    MSR		SPSR_cxsf,R4
    LDMFD   SP!,{R0-R12,LR,PC}^	   ;POP new Task''s context

IRQIsrVect DCD HandleEINT0	
    
;*********************************************************************************************************
;                                   CRITICAL SECTION METHOD 3 FUNCTIONS
;
; Description: Disable/Enable interrupts by preserving the state of interrupts.  Generally speaking you
;              would store the state of the interrupt disable flag in the local variable 'cpu_sr' and then
;              disable interrupts.  'cpu_sr' is allocated in all of uC/OS-II''s functions that need to 
;              disable interrupts.  You would restore the interrupt disable state by copying back 'cpu_sr'
;              into the CPU''s status register.
;
; Prototypes : OS_CPU_SR  OSCPUSaveSR(void);
;              void       OSCPURestoreSR(OS_CPU_SR cpu_sr);
;
;
; Note(s)    : 1) These functions are used in general like this:
;
;                 void Task (void *p_arg)
;                 {
;                 #if OS_CRITICAL_METHOD == 3          /* Allocate storage for CPU status register */
;                     OS_CPU_SR  cpu_sr;
;                 #endif
;
;                          :
;                          :
;                     OS_ENTER_CRITICAL();             /* cpu_sr = OSCPUSaveSR();                */
;                          :
;                          :
;                     OS_EXIT_CRITICAL();              /* OSCPURestoreSR(cpu_sr);                */
;                          :
;                          :
;                 }
;
;              2) OSCPUSaveSR() is implemented as recommended by Atmel''s application note:
;
;                    "Disabling Interrupts at Processor Level"
;*********************************************************************************************************
OSCPUSaveSR
	MRS     R0, CPSR				; Set IRQ and FIQ bits in CPSR to disable all interrupts
	ORR     R1, R0, #0xC0
	MSR     CPSR_c, R1
	MRS     R1, CPSR				; Confirm that CPSR contains the proper interrupt disable flags
	AND     R1, R1, #0xC0
	CMP     R1, #0xC0
	BNE     OSCPUSaveSR				; Not properly disabled (try again)
	MOV     PC, LR					; Disabled, return the original CPSR contents in R0

OSCPURestoreSR
	MSR     CPSR_c, R0
	MOV     PC, LR
	        
	END
