/*
*********************************************************************************************************
*                                                uC/OS-II
*                                          The Real-Time Kernel
*                                             CORE FUNCTIONS
*
*                          (c) Copyright 1992-2006, Jean J. Labrosse, Weston, FL
*                                           All Rights Reserved
*
* File    : OS_CORE.C
* By      : Jean J. Labrosse
* Version : V2.83
*********************************************************************************************************
*/

#ifndef  OS_MASTER_FILE
#define  OS_GLOBALS
#include <ucos_ii.h>
#endif

/*
*********************************************************************************************************
*                                       PRIORITY RESOLUTION TABLE
*
* Note: Index into table is bit pattern to resolve highest priority
*       Indexed value corresponds to highest priority bit position (i.e. 0..7)
*********************************************************************************************************
*/

INT8U  const  OSUnMapTbl[256] = {
    0, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,       /* 0x00 to 0x0F                             */
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,       /* 0x10 to 0x1F                             */
    5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,       /* 0x20 to 0x2F                             */
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,       /* 0x30 to 0x3F                             */
    6, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,       /* 0x40 to 0x4F                             */
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,       /* 0x50 to 0x5F                             */
    5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,       /* 0x60 to 0x6F                             */
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,       /* 0x70 to 0x7F                             */
    7, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,       /* 0x80 to 0x8F                             */
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,       /* 0x90 to 0x9F                             */
    5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,       /* 0xA0 to 0xAF                             */
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,       /* 0xB0 to 0xBF                             */
    6, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,       /* 0xC0 to 0xCF                             */
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,       /* 0xD0 to 0xDF                             */
    5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0,       /* 0xE0 to 0xEF                             */
    4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0        /* 0xF0 to 0xFF                             */
};

/*$PAGE*/
/*
*********************************************************************************************************
*                                       FUNCTION PROTOTYPES
*********************************************************************************************************
*/

static  void  OS_InitEventList(void);

static  void  OS_InitMisc(void);

static  void  OS_InitRdyList(void);

static  void  OS_InitTaskIdle(void);

#if OS_TASK_STAT_EN > 0
static  void  OS_InitTaskStat(void);
#endif

static  void  OS_InitTCBList(void);

static  void  OS_SchedNew(void);

/*$PAGE*/
/*
*********************************************************************************************************
*                         GET THE NAME OF A SEMAPHORE, MUTEX, MAILBOX or QUEUE
*
* Description: This function is used to obtain the name assigned to a semaphore, mutex, mailbox or queue.
*
* Arguments  : pevent    is a pointer to the event group.  'pevent' can point either to a semaphore,
*                        a mutex, a mailbox or a queue.  Where this function is concerned, the actual
*                        type is irrelevant.
*
*              pname     is a pointer to an ASCII string that will receive the name of the semaphore,
*                        mutex, mailbox or queue.  The string must be able to hold at least
*                        OS_EVENT_NAME_SIZE characters.
*
*              err       is a pointer to an error code that can contain one of the following values:
*
*                        OS_NO_ERR                  if the name was copied to 'pname'
*                        OS_ERR_EVENT_TYPE          if 'pevent' is not pointing to the proper event
*                                                   control block type.
*                        OS_ERR_PNAME_NULL          You passed a NULL pointer for 'pname'
*                        OS_ERR_PEVENT_NULL         if you passed a NULL pointer for 'pevent'
*
* Returns    : The length of the string or 0 if the 'pevent' is a NULL pointer.
*********************************************************************************************************
*/

#if OS_EVENT_EN && (OS_EVENT_NAME_SIZE > 1)
INT8U  OSEventNameGet (OS_EVENT *pevent, INT8U *pname, INT8U *err)
{
    INT8U      len;
#if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
    OS_CPU_SR  cpu_sr = 0;
#endif



#if OS_ARG_CHK_EN > 0
    if (err == (INT8U *)0) {                     /* Validate 'err'                                     */
        return (0);
    }
    if (pevent == (OS_EVENT *)0) {               /* Is 'pevent' a NULL pointer?                        */
        *err = OS_ERR_PEVENT_NULL;
        return (0);
    }
    if (pname == (INT8U *)0) {                   /* Is 'pname' a NULL pointer?                         */
        *err = OS_ERR_PNAME_NULL;
        return (0);
    }
#endif
    switch (pevent->OSEventType) {
        case OS_EVENT_TYPE_SEM:
        case OS_EVENT_TYPE_MUTEX:
        case OS_EVENT_TYPE_MBOX:
        case OS_EVENT_TYPE_Q:
             break;

        default:
             *err = OS_ERR_EVENT_TYPE;
             return (0);
    }
    OS_ENTER_CRITICAL();
    len  = OS_StrCopy(pname, pevent->OSEventName);    /* Copy name from OS_EVENT                       */
    OS_EXIT_CRITICAL();
    *err = OS_NO_ERR;
    return (len);
}
#endif

/*$PAGE*/
/*
*********************************************************************************************************
*                         ASSIGN A NAME TO A SEMAPHORE, MUTEX, MAILBOX or QUEUE
*
* Description: This function assigns a name to a semaphore, mutex, mailbox or queue.
*
* Arguments  : pevent    is a pointer to the event group.  'pevent' can point either to a semaphore,
*                        a mutex, a mailbox or a queue.  Where this function is concerned, it doesn't
*                        matter the actual type.
*
*              pname     is a pointer to an ASCII string that will be used as the name of the semaphore,
*                        mutex, mailbox or queue.  The string must be able to hold at least
*                        OS_EVENT_NAME_SIZE characters.
*
*              err       is a pointer to an error code that can contain one of the following values:
*
*                        OS_NO_ERR                  if the requested task is resumed
*                        OS_ERR_EVENT_TYPE          if 'pevent' is not pointing to the proper event
*                                                   control block type.
*                        OS_ERR_PNAME_NULL          You passed a NULL pointer for 'pname'
*                        OS_ERR_PEVENT_NULL         if you passed a NULL pointer for 'pevent'
*
* Returns    : None
*********************************************************************************************************
*/

#if OS_EVENT_EN && (OS_EVENT_NAME_SIZE > 1)
void  OSEventNameSet (OS_EVENT *pevent, INT8U *pname, INT8U *err)
{
    INT8U      len;
#if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
    OS_CPU_SR  cpu_sr = 0;
#endif



#if OS_ARG_CHK_EN > 0
    if (err == (INT8U *)0) {                     /* Validate 'err'                                     */
        return;
    }
    if (pevent == (OS_EVENT *)0) {               /* Is 'pevent' a NULL pointer?                        */
        *err = OS_ERR_PEVENT_NULL;
        return;
    }
    if (pname == (INT8U *)0) {                    /* Is 'pname' a NULL pointer?                         */
        *err = OS_ERR_PNAME_NULL;
        return;
    }
#endif
    switch (pevent->OSEventType) {
        case OS_EVENT_TYPE_SEM:
        case OS_EVENT_TYPE_MUTEX:
        case OS_EVENT_TYPE_MBOX:
        case OS_EVENT_TYPE_Q:
             break;

        default:
             *err = OS_ERR_EVENT_TYPE;
             return;
    }
    OS_ENTER_CRITICAL();
    len = OS_StrLen(pname);                           /* Can we fit the string in the storage area?    */
    if (len > (OS_EVENT_NAME_SIZE - 1)) {             /* No                                            */
        OS_EXIT_CRITICAL();
        *err = OS_ERR_EVENT_NAME_TOO_LONG;
        return;
    }
    (void)OS_StrCopy(pevent->OSEventName, pname);     /* Yes, copy name to the event control block     */
    OS_EXIT_CRITICAL();
    *err = OS_NO_ERR;
}
#endif

/*$PAGE*/
/*
*********************************************************************************************************
*                                             INITIALIZATION
*
* Description: This function is used to initialize the internals of uC/OS-II and MUST be called prior to
*              creating any uC/OS-II object and, prior to calling OSStart().
*
* Arguments  : none
*
* Returns    : none
*********************************************************************************************************
*/

void  OSInit (void)
{
#if OS_VERSION >= 204
    OSInitHookBegin();                                           /* Call port specific initialization code   */
#endif

    OS_InitMisc();                                               /* Initialize miscellaneous variables       */

    OS_InitRdyList();                                            /* Initialize the Ready List                */

    OS_InitTCBList();                                            /* Initialize the free list of OS_TCBs      */

    OS_InitEventList();                                          /* Initialize the free list of OS_EVENTs    */

#if (OS_VERSION >= 251) && (OS_FLAG_EN > 0) && (OS_MAX_FLAGS > 0)
    OS_FlagInit();                                               /* Initialize the event flag structures     */
#endif

#if (OS_MEM_EN > 0) && (OS_MAX_MEM_PART > 0)
    OS_MemInit();                                                /* Initialize the memory manager            */
#endif

#if (OS_Q_EN > 0) && (OS_MAX_QS > 0)
    OS_QInit();                                                  /* Initialize the message queue structures  */
#endif

    OS_InitTaskIdle();                                           /* Create the Idle Task                     */
#if OS_TASK_STAT_EN > 0
    OS_InitTaskStat();                                           /* Create the Statistic Task                */
#endif

#if OS_TMR_EN > 0
    OSTmr_Init();                                                /* Initialize the Timer Manager             */
#endif

#if OS_VERSION >= 204
    OSInitHookEnd();                                             /* Call port specific init. code            */
#endif

#if OS_VERSION >= 270 && OS_DEBUG_EN > 0
    OSDebugInit();
#endif
}
/*$PAGE*/
/*
*********************************************************************************************************
*                                              ENTER ISR
*
* Description: This function is used to notify uC/OS-II that you are about to service an interrupt
*              service routine (ISR).  This allows uC/OS-II to keep track of interrupt nesting and thus
*              only perform rescheduling at the last nested ISR.
*
* Arguments  : none
*
* Returns    : none
*
* Notes      : 1) This function should be called ith interrupts already disabled
*              2) Your ISR can directly increment OSIntNesting without calling this function because
*                 OSIntNesting has been declared 'global'.
*              3) You MUST still call OSIntExit() even though you increment OSIntNesting directly.
*              4) You MUST invoke OSIntEnter() and OSIntExit() in pair.  In other words, for every call
*                 to OSIntEnter() at the beginning of the ISR you MUST have a call to OSIntExit() at the
*                 end of the ISR.
*              5) You are allowed to nest interrupts up to 255 levels deep.
*              6) I removed the OS_ENTER_CRITICAL() and OS_EXIT_CRITICAL() around the increment because
*                 OSIntEnter() is always called with interrupts disabled.
*********************************************************************************************************
*/

void  OSIntEnter (void)
{
    if (OSRunning == OS_TRUE) {
        if (OSIntNesting < 255u) {
            OSIntNesting++;                      /* Increment ISR nesting level                        */
        }
    }
}
/*$PAGE*/
/*
*********************************************************************************************************
*                                               EXIT ISR
*
* Description: This function is used to notify uC/OS-II that you have completed serviving an ISR.  When
*              the last nested ISR has completed, uC/OS-II will call the scheduler to determine whether
*              a new, high-priority task, is ready to run.
*
* Arguments  : none
*
* Returns    : none
*
* Notes      : 1) You MUST invoke OSIntEnter() and OSIntExit() in pair.  In other words, for every call
*                 to OSIntEnter() at the beginning of the ISR you MUST have a call to OSIntExit() at the
*                 end of the ISR.
*              2) Rescheduling is prevented when the scheduler is locked (see OS_SchedLock())
*********************************************************************************************************
*/

void  OSIntExit (void)
{
#if OS_CRITICAL_METHOD == 3                                /* Allocate storage for CPU status register */
    OS_CPU_SR  cpu_sr = 0;
#endif



    if (OSRunning == OS_TRUE) {
        OS_ENTER_CRITICAL();
        if (OSIntNesting > 0) {                            /* Prevent OSIntNesting from wrapping       */
            OSIntNesting--;
        }
        if (OSIntNesting == 0) {                           /* Reschedule only if all ISRs complete ... */
            if (OSLockNesting == 0) {                      /* ... and not locked.                      */
                OS_SchedNew();
                if (OSPrioHighRdy != OSPrioCur) {          /* No Ctx Sw if current task is highest rdy */
                    OSTCBHighRdy  = OSTCBPrioTbl[OSPrioHighRdy];
#if OS_TASK_PROFILE_EN > 0
                    OSTCBHighRdy->OSTCBCtxSwCtr++;         /* Inc. # of context switches to this task  */
#endif
                    OSCtxSwCtr++;                          /* Keep track of the number of ctx switches */
                    OSIntCtxSw();                          /* Perform interrupt level ctx switch       */
                }
            }
        }
        OS_EXIT_CRITICAL();
    }
}
/*$PAGE*/
/*
*********************************************************************************************************
*                                          PREVENT SCHEDULING
*
* Description: This function is used to prevent rescheduling to take place.  This allows your application
*              to prevent context switches until you are ready to permit context switching.
*
* Arguments  : none
*
* Returns    : none
*
* Notes      : 1) You MUST invoke OSSchedLock() and OSSchedUnlock() in pair.  In other words, for every
*                 call to OSSchedLock() you MUST have a call to OSSchedUnlock().
*********************************************************************************************************
*/

#if OS_SCHED_LOCK_EN > 0
void  OSSchedLock (void)
{
#if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
    OS_CPU_SR  cpu_sr = 0;
#endif



    if (OSRunning == OS_TRUE) {                  /* Make sure multitasking is running                  */
        OS_ENTER_CRITICAL();
        if (OSIntNesting == 0) {                 /* Can't call from an ISR                             */
            if (OSLockNesting < 255u) {          /* Prevent OSLockNesting from wrapping back to 0      */
                OSLockNesting++;                 /* Increment lock nesting level                       */
            }
        }
        OS_EXIT_CRITICAL();
    }
}
#endif

/*$PAGE*/
/*
*********************************************************************************************************
*                                          ENABLE SCHEDULING
*
* Description: This function is used to re-allow rescheduling.
*
* Arguments  : none
*
* Returns    : none
*
* Notes      : 1) You MUST invoke OSSchedLock() and OSSchedUnlock() in pair.  In other words, for every
*                 call to OSSchedLock() you MUST have a call to OSSchedUnlock().
*********************************************************************************************************
*/

#if OS_SCHED_LOCK_EN > 0
void  OSSchedUnlock (void)
{
#if OS_CRITICAL_METHOD == 3                                /* Allocate storage for CPU status register */
    OS_CPU_SR  cpu_sr = 0;
#endif



    if (OSRunning == OS_TRUE) {                            /* Make sure multitasking is running        */
        OS_ENTER_CRITICAL();
        if (OSLockNesting > 0) {                           /* Do not decrement if already 0            */
            OSLockNesting--;                               /* Decrement lock nesting level             */
            if (OSLockNesting == 0) {                      /* See if scheduler is enabled and ...      */
                if (OSIntNesting == 0) {                   /* ... not in an ISR                        */
                    OS_EXIT_CRITICAL();
                    OS_Sched();                            /* See if a HPT is ready                    */
                } else {
                    OS_EXIT_CRITICAL();
                }
            } else {
                OS_EXIT_CRITICAL();
            }
        } else {
            OS_EXIT_CRITICAL();
        }
    }
}
#endif

/*$PAGE*/
/*
*********************************************************************************************************
*                                          START MULTITASKING
*
* Description: This function is used to start the multitasking process which lets uC/OS-II manages the
*              task that you have created.  Before you can call OSStart(), you MUST have called OSInit()
*              and you MUST have created at least one task.
*
* Arguments  : none
*
* Returns    : none
*
* Note       : OSStartHighRdy() MUST:
*                 a) Call OSTaskSwHook() then,
*                 b) Set OSRunning to OS_TRUE.
*                 c) Load the context of the task pointed to by OSTCBHighRdy.
*                 d_ Execute the task.
*********************************************************************************************************
*/

void  OSStart (void)
{
    if (OSRunning == OS_FALSE) {
        OS_SchedNew();                               /* Find highest priority's task priority number   */
        OSPrioCur     = OSPrioHighRdy;
        OSTCBHighRdy  = OSTCBPrioTbl[OSPrioHighRdy]; /* Point to highest priority task ready to run    */
        OSTCBCur      = OSTCBHighRdy;
        OSStartHighRdy();                            /* Execute target specific code to start task     */
    }
}
/*$PAGE*/
/*
*********************************************************************************************************
*                                        STATISTICS INITIALIZATION
*
* Description: This function is called by your application to establish CPU usage by first determining
*              how high a 32-bit counter would count to in 1 second if no other tasks were to execute
*              during that time.  CPU usage is then determined by a low priority task which keeps track
*              of this 32-bit counter every second but this time, with other tasks running.  CPU usage is
*              determined by:
*
*                                             OSIdleCtr
*                 CPU Usage (%) = 100 * (1 - ------------)
*                                            OSIdleCtrMax
*
* Arguments  : none
*
* Returns    : none
*********************************************************************************************************
*/

#if OS_TASK_STAT_EN > 0
void  OSStatInit (void)
{
#if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
    OS_CPU_SR  cpu_sr = 0;
#endif



    OSTimeDly(2);                                /* Synchronize with clock tick                        */
    OS_ENTER_CRITICAL();
    OSIdleCtr    = 0L;                           /* Clear idle counter                                 */
    OS_EXIT_CRITICAL();
    OSTimeDly(OS_TICKS_PER_SEC / 10);            /* Determine MAX. idle counter value for 1/10 second  */
    OS_ENTER_CRITICAL();
    OSIdleCtrMax = OSIdleCtr;                    /* Store maximum idle counter count in 1/10 second    */
    OSStatRdy    = OS_TRUE;
    OS_EXIT_CRITICAL();
}
#endif
/*$PAGE*/
/*
*********************************************************************************************************
*                                         PROCESS SYSTEM TICK
*
* Description: This function is used to signal to uC/OS-II the occurrence of a 'system tick' (also known
*              as a 'clock tick').  This function should be called by the ticker ISR but, can also be
*              called by a high priority task.
*
* Arguments  : none
*
* Returns    : none
*********************************************************************************************************
*/

void  OSTimeTick (void)
{
    OS_TCB    *ptcb;
#if OS_TICK_STEP_EN > 0
    BOOLEAN    step;
#endif
#if OS_CRITICAL_METHOD == 3                                /* Allocate storage for CPU status register     */
    OS_CPU_SR  cpu_sr = 0;
#endif



#if OS_TIME_TICK_HOOK_EN > 0
    OSTimeTickHook();                                      /* Call user definable hook                     */
#endif
#if OS_TIME_GET_SET_EN > 0
    OS_ENTER_CRITICAL();                                   /* Update the 32-bit tick counter               */
    OSTime++;
    OS_EXIT_CRITICAL();
#endif
    if (OSRunning == OS_TRUE) {
#if OS_TICK_STEP_EN > 0
        switch (OSTickStepState) {                         /* Determine whether we need to process a tick  */
            case OS_TICK_STEP_DIS:                         /* Yes, stepping is disabled                    */
                 step = OS_TRUE;
                 break;

            case OS_TICK_STEP_WAIT:                        /* No,  waiting for uC/OS-View to set ...       */
                 step = OS_FALSE;                          /*      .. OSTickStepState to OS_TICK_STEP_ONCE */
                 break;

            case OS_TICK_STEP_ONCE:                        /* Yes, process tick once and wait for next ... */
                 step            = OS_TRUE;                /*      ... step command from uC/OS-View        */
                 OSTickStepState = OS_TICK_STEP_WAIT;
                 break;

            default:                                       /* Invalid case, correct situation              */
                 step            = OS_TRUE;
                 OSTickStepState = OS_TICK_STEP_DIS;
                 break;
        }
        if (step == OS_FALSE) {                            /* Return if waiting for step command           */
            return;
        }
#endif
        ptcb = OSTCBList;                                  /* Point at first TCB in TCB list               */
        while (ptcb->OSTCBPrio != OS_TASK_IDLE_PRIO) {     /* Go through all TCBs in TCB list              */
            OS_ENTER_CRITICAL();
            if (ptcb->OSTCBDly != 0) {                     /* No, Delayed or waiting for event with TO     */
                if (--ptcb->OSTCBDly == 0) {               /* Decrement nbr of ticks to end of delay       */
                                                           /* Check for timeout                            */
                    if ((ptcb->OSTCBStat & OS_STAT_PEND_ANY) != OS_STAT_RDY) {
                        ptcb->OSTCBStat   &= ~OS_STAT_PEND_ANY;                /* Yes, Clear status flag   */
                        ptcb->OSTCBPendTO  = OS_TRUE;                          /* Indicate PEND timeout    */
                    } else {
                        ptcb->OSTCBPendTO  = OS_FALSE;
                    }

                    if ((ptcb->OSTCBStat & OS_STAT_SUSPEND) == OS_STAT_RDY) {  /* Is task suspended?       */
                        OSRdyGrp               |= ptcb->OSTCBBitY;             /* No,  Make ready          */
                        OSRdyTbl[ptcb->OSTCBY] |= ptcb->OSTCBBitX;
                    }
                }
            }
            ptcb = ptcb->OSTCBNext;                        /* Point at next TCB in TCB list                */
            OS_EXIT_CRITICAL();
        }
    }
}
/*$PAGE*/
/*
*********************************************************************************************************
*                                             GET VERSION
*
* Description: This function is used to return the version number of uC/OS-II.  The returned value
*              corresponds to uC/OS-II's version number multiplied by 100.  In other words, version 2.00
*              would be returned as 200.
*
* Arguments  : none
*
* Returns    : the version number of uC/OS-II multiplied by 100.
*********************************************************************************************************
*/

INT16U  OSVersion (void)
{
    return (OS_VERSION);
}

/*$PAGE*/
/*
*********************************************************************************************************
*                                            DUMMY FUNCTION
*
* Description: This function doesn't do anything.  It is called by OSTaskDel().
*
* Arguments  : none
*
* Returns    : none
*********************************************************************************************************
*/

#if OS_TASK_DEL_EN > 0
void  OS_Dummy (void)
{
}
#endif

/*$PAGE*/
/*
*********************************************************************************************************
*                             MAKE TASK READY TO RUN BASED ON EVENT OCCURING
*
* Description: This function is called by other uC/OS-II services and is used to ready a task that was
*              waiting for an event to occur.
*
* Arguments  : pevent    is a pointer to the event control block corresponding to the event.
*
*              msg       is a pointer to a message.  This pointer is used by message oriented services
*                        such as MAILBOXEs and QUEUEs.  The pointer is not used when called by other
*                        service functions.
*
*              msk       is a mask that is used to clear the status byte of the TCB.  For example,
*                        OSSemPost() will pass OS_STAT_SEM, OSMboxPost() will pass OS_STAT_MBOX etc.
*
* Returns    : none
*
* Note       : This function is INTERNAL to uC/OS-II and your application should not call it.
*********************************************************************************************************
*/
#if OS_EVENT_EN
INT8U  OS_EventTaskRdy (OS_EVENT *pevent, void *msg, INT8U msk)
{
    OS_TCB  *ptcb;
    INT8U    x;
    INT8U    y;
    INT8U    prio;
#if OS_LOWEST_PRIO <= 63
    INT8U    bitx;
    INT8U    bity;
#else
    INT16U   bitx;
    INT16U   bity;
    INT16U  *ptbl;
#endif


#if OS_LOWEST_PRIO <= 63
    y     = OSUnMapTbl[pevent->OSEventGrp];             /* Find HPT waiting for message                */
    bity  = (INT8U)(1 << y);
    x     = OSUnMapTbl[pevent->OSEventTbl[y]];
    bitx  = (INT8U)(1 << x);
    prio  = (INT8U)((y << 3) + x);                      /* Find priority of task getting the msg       */
#else
    if ((pevent->OSEventGrp & 0xFF) != 0) {             /* Find HPT waiting for message                */
        y = OSUnMapTbl[pevent->OSEventGrp & 0xFF];
    } else {
        y = OSUnMapTbl[(pevent->OSEventGrp >> 8) & 0xFF] + 8;
    }
    bity = (INT16U)(1 << y);
    ptbl = &pevent->OSEventTbl[y];
    if ((*ptbl & 0xFF) != 0) {
        x = OSUnMapTbl[*ptbl & 0xFF];
    } else {
        x = OSUnMapTbl[(*ptbl >> 8) & 0xFF] + 8;
    }
    bitx = (INT16U)(1 << x);
    prio = (INT8U)((y << 4) + x);                       /* Find priority of task getting the msg       */
#endif

    pevent->OSEventTbl[y] &= ~bitx;                     /* Remove this task from the waiting list      */
    if (pevent->OSEventTbl[y] == 0) {
        pevent->OSEventGrp &= ~bity;                    /* Clr group bit if this was only task pending */
    }
    ptcb                 =  OSTCBPrioTbl[prio];         /* Point to this task's OS_TCB                 */
    ptcb->OSTCBDly       =  0;                          /* Prevent OSTimeTick() from readying task     */
    ptcb->OSTCBEventPtr  = (OS_EVENT *)0;               /* Unlink ECB from this task                   */
#if ((OS_Q_EN > 0) && (OS_MAX_QS > 0)) || (OS_MBOX_EN > 0)
    ptcb->OSTCBMsg       = msg;                         /* Send message directly to waiting task       */
#else
    msg                  = msg;                         /* Prevent compiler warning if not used        */
#endif
    ptcb->OSTCBPendTO    = OS_FALSE;                    /* Cancel 'any' timeout because of post        */
    ptcb->OSTCBStat     &= ~msk;                        /* Clear bit associated with event type        */
    if (ptcb->OSTCBStat == OS_STAT_RDY) {               /* See if task is ready (could be susp'd)      */
        OSRdyGrp        |=  bity;                       /* Put task in the ready to run list           */
        OSRdyTbl[y]     |=  bitx;
    }
    return (prio);
}
#endif
/*$PAGE*/
/*
*********************************************************************************************************
*                                   MAKE TASK WAIT FOR EVENT TO OCCUR
*
* Description: This function is called by other uC/OS-II services to suspend a task because an event has
*              not occurred.
*
* Arguments  : pevent   is a pointer to the event control block for which the task will be waiting for.
*
* Returns    : none
*
* Note       : This function is INTERNAL to uC/OS-II and your application should not call it.
*********************************************************************************************************
*/
#if OS_EVENT_EN
void  OS_EventTaskWait (OS_EVENT *pevent)
{
    INT8U  y;


    OSTCBCur->OSTCBEventPtr = pevent;             /* Store pointer to event control block in TCB       */
    y                       = OSTCBCur->OSTCBY;   /* Task no longer ready                              */
    OSRdyTbl[y]            &= ~OSTCBCur->OSTCBBitX;
    if (OSRdyTbl[y] == 0) {
        OSRdyGrp &= ~OSTCBCur->OSTCBBitY;         /* Clear event grp bit if this was only task pending */
    }
    pevent->OSEventTbl[OSTCBCur->OSTCBY] |= OSTCBCur->OSTCBBitX;          /* Put task in waiting list  */
    pevent->OSEventGrp                   |= OSTCBCur->OSTCBBitY;
}
#endif
/*$PAGE*/
/*
*********************************************************************************************************
*                              MAKE TASK READY TO RUN BASED ON EVENT TIMEOUT
*
* Description: This function is called by other uC/OS-II services to make a task ready to run because a
*              timeout occurred.
*
* Arguments  : pevent   is a pointer to the event control block which is readying a task.
*
* Returns    : none
*
* Note       : This function is INTERNAL to uC/OS-II and your application should not call it.
*********************************************************************************************************
*/
#if OS_EVENT_EN
void  OS_EventTO (OS_EVENT *pevent)
{
    INT8U  y;


    y                      = OSTCBCur->OSTCBY;
    pevent->OSEventTbl[y] &= ~OSTCBCur->OSTCBBitX;     /* Remove task from wait list                   */
    if (pevent->OSEventTbl[y] == 0x00) {
        pevent->OSEventGrp &= ~OSTCBCur->OSTCBBitY;
    }
    OSTCBCur->OSTCBPendTO   = OS_FALSE;                /* Clear the Pend Timeout flag                  */
    OSTCBCur->OSTCBStat     = OS_STAT_RDY;             /* Set status to ready                          */
    OSTCBCur->OSTCBEventPtr = (OS_EVENT *)0;           /* No longer waiting for event                  */
}
#endif
/*$PAGE*/
/*
*********************************************************************************************************
*                                 INITIALIZE EVENT CONTROL BLOCK'S WAIT LIST
*
* Description: This function is called by other uC/OS-II services to initialize the event wait list.
*
* Arguments  : pevent    is a pointer to the event control block allocated to the event.
*
* Returns    : none
*
* Note       : This function is INTERNAL to uC/OS-II and your application should not call it.
*********************************************************************************************************
*/
#if OS_EVENT_EN
void  OS_EventWaitListInit (OS_EVENT *pevent)
{
#if OS_LOWEST_PRIO <= 63
    INT8U  *ptbl;
#else
    INT16U *ptbl;
#endif
    INT8U   i;


    pevent->OSEventGrp = 0;                      /* No task waiting on event                           */
    ptbl               = &pevent->OSEventTbl[0];

    for (i = 0; i < OS_EVENT_TBL_SIZE; i++) {
        *ptbl++ = 0;
    }
}
#endif
/*$PAGE*/
/*
*********************************************************************************************************
*                                             INITIALIZATION
*                           INITIALIZE THE FREE LIST OF EVENT CONTROL BLOCKS
*
* Description: This function is called by OSInit() to initialize the free list of event control blocks.
*
* Arguments  : none
*
* Returns    : none
*********************************************************************************************************
*/

static  void  OS_InitEventList (void)
{
#if OS_EVENT_EN && (OS_MAX_EVENTS > 0)
#if (OS_MAX_EVENTS > 1)
    INT16U     i;
    OS_EVENT  *pevent1;
    OS_EVENT  *pevent2;


    OS_MemClr((INT8U *)&OSEventTbl[0], sizeof(OSEventTbl)); /* Clear the event table                   */
    pevent1 = &OSEventTbl[0];
    pevent2 = &OSEventTbl[1];
    for (i = 0; i < (OS_MAX_EVENTS - 1); i++) {             /* Init. list of free EVENT control blocks */
        pevent1->OSEventType    = OS_EVENT_TYPE_UNUSED;
        pevent1->OSEventPtr     = pevent2;
#if OS_EVENT_NAME_SIZE > 1
        pevent1->OSEventName[0] = '?';                      /* Unknown name                            */
        pevent1->OSEventName[1] = OS_ASCII_NUL;
#endif
        pevent1++;
        pevent2++;
    }
    pevent1->OSEventType            = OS_EVENT_TYPE_UNUSED;
    pevent1->OSEventPtr             = (OS_EVENT *)0;
#if OS_EVENT_NAME_SIZE > 1
    pevent1->OSEventName[0]         = '?';
    pevent1->OSEventName[1]         = OS_ASCII_NUL;
#endif
    OSEventFreeList                 = &OSEventTbl[0];
#else
    OSEventFreeList                 = &OSEventTbl[0];       /* Only have ONE event control block       */
    OSEventFreeList->OSEventType    = OS_EVENT_TYPE_UNUSED;
    OSEventFreeList->OSEventPtr     = (OS_EVENT *)0;
#if OS_EVENT_NAME_SIZE > 1
    OSEventFreeList->OSEventName[0] = '?';                  /* Unknown name                            */
    OSEventFreeList->OSEventName[1] = OS_ASCII_NUL;
#endif
#endif
#endif
}
/*$PAGE*/
/*
*********************************************************************************************************
*                                             INITIALIZATION
*                                    INITIALIZE MISCELLANEOUS VARIABLES
*
* Description: This function is called by OSInit() to initialize miscellaneous variables.
*
* Arguments  : none
*
* Returns    : none
*********************************************************************************************************
*/

static  void  OS_InitMisc (void)
{
#if OS_TIME_GET_SET_EN > 0
    OSTime        = 0L;                                    /* Clear the 32-bit system clock            */
#endif

    OSIntNesting  = 0;                                     /* Clear the interrupt nesting counter      */
    OSLockNesting = 0;                                     /* Clear the scheduling lock counter        */

    OSTaskCtr     = 0;                                     /* Clear the number of tasks                */

    OSRunning     = OS_FALSE;                              /* Indicate that multitasking not started   */

    OSCtxSwCtr    = 0;                                     /* Clear the context switch counter         */
    OSIdleCtr     = 0L;                                    /* Clear the 32-bit idle counter            */

#if OS_TASK_STAT_EN > 0
    OSIdleCtrRun  = 0L;
    OSIdleCtrMax  = 0L;
    OSStatRdy     = OS_FALSE;                              /* Statistic task is not ready              */
#endif
}
/*$PAGE*/
/*
*********************************************************************************************************
*                                             INITIALIZATION
*                                       INITIALIZE THE READY LIST
*
* Description: This function is called by OSInit() to initialize the Ready List.
*
* Arguments  : none
*
* Returns    : none
*********************************************************************************************************
*/

static  void  OS_InitRdyList (void)
{
    INT8U    i;
#if OS_LOWEST_PRIO <= 63
    INT8U   *prdytbl;
#else
    INT16U  *prdytbl;
#endif


    OSRdyGrp      = 0;                                     /* Clear the ready list                     */
    prdytbl       = &OSRdyTbl[0];
    for (i = 0; i < OS_RDY_TBL_SIZE; i++) {
        *prdytbl++ = 0;
    }

    OSPrioCur     = 0;
    OSPrioHighRdy = 0;

    OSTCBHighRdy  = (OS_TCB *)0;
    OSTCBCur      = (OS_TCB *)0;
}

/*$PAGE*/
/*
*********************************************************************************************************
*                                             INITIALIZATION
*                                         CREATING THE IDLE TASK
*
* Description: This function creates the Idle Task.
*
* Arguments  : none
*
* Returns    : none
*********************************************************************************************************
*/

static  void  OS_InitTaskIdle (void)
{
#if OS_TASK_NAME_SIZE > 7
    INT8U  err;
#endif


#if OS_TASK_CREATE_EXT_EN > 0
    #if OS_STK_GROWTH == 1
    (void)OSTaskCreateExt(OS_TaskIdle,
                          (void *)0,                                 /* No arguments passed to OS_TaskIdle() */
                          &OSTaskIdleStk[OS_TASK_IDLE_STK_SIZE - 1], /* Set Top-Of-Stack                     */
                          OS_TASK_IDLE_PRIO,                         /* Lowest priority level                */
                          OS_TASK_IDLE_ID,
                          &OSTaskIdleStk[0],                         /* Set Bottom-Of-Stack                  */
                          OS_TASK_IDLE_STK_SIZE,
                          (void *)0,                                 /* No TCB extension                     */
                          OS_TASK_OPT_STK_CHK | OS_TASK_OPT_STK_CLR);/* Enable stack checking + clear stack  */
    #else
    (void)OSTaskCreateExt(OS_TaskIdle,
                          (void *)0,                                 /* No arguments passed to OS_TaskIdle() */
                          &OSTaskIdleStk[0],                         /* Set Top-Of-Stack                     */
                          OS_TASK_IDLE_PRIO,                         /* Lowest priority level                */
                          OS_TASK_IDLE_ID,
                          &OSTaskIdleStk[OS_TASK_IDLE_STK_SIZE - 1], /* Set Bottom-Of-Stack                  */
                          OS_TASK_IDLE_STK_SIZE,
                          (void *)0,                                 /* No TCB extension                     */
                          OS_TASK_OPT_STK_CHK | OS_TASK_OPT_STK_CLR);/* Enable stack checking + clear stack  */
    #endif
#else
    #if OS_STK_GROWTH == 1
    (void)OSTaskCreate(OS_TaskIdle,
                       (void *)0,
                       &OSTaskIdleStk[OS_TASK_IDLE_STK_SIZE - 1],
                       OS_TASK_IDLE_PRIO);
    #else
    (void)OSTaskCreate(OS_TaskIdle,
                       (void *)0,
                       &OSTaskIdleStk[0],
                       OS_TASK_IDLE_PRIO);
    #endif
#endif

#if OS_TASK_NAME_SIZE > 14
    OSTaskNameSet(OS_TASK_IDLE_PRIO, (INT8U *)"uC/OS-II Idle", &err);
#else
#if OS_TASK_NAME_SIZE > 7
    OSTaskNameSet(OS_TASK_IDLE_PRIO, (INT8U *)"OS-Idle", &err);
#endif
#endif
}
/*$PAGE*/
/*
*********************************************************************************************************
*                                             INITIALIZATION
*                                      CREATING THE STATISTIC TASK
*
* Description: This function creates the Statistic Task.
*
* Arguments  : none
*
* Returns    : none
*********************************************************************************************************
*/

#if OS_TASK_STAT_EN > 0
static  void  OS_InitTaskStat (void)
{
#if OS_TASK_NAME_SIZE > 7
    INT8U  err;
#endif


#if OS_TASK_CREATE_EXT_EN > 0
    #if OS_STK_GROWTH == 1
    (void)OSTaskCreateExt(OS_TaskStat,
                          (void *)0,                                   /* No args passed to OS_TaskStat()*/
                          &OSTaskStatStk[OS_TASK_STAT_STK_SIZE - 1],   /* Set Top-Of-Stack               */
                          OS_TASK_STAT_PRIO,                           /* One higher than the idle task  */
                          OS_TASK_STAT_ID,
                          &OSTaskStatStk[0],                           /* Set Bottom-Of-Stack            */
                          OS_TASK_STAT_STK_SIZE,
                          (void *)0,                                   /* No TCB extension               */
                          OS_TASK_OPT_STK_CHK | OS_TASK_OPT_STK_CLR);  /* Enable stack checking + clear  */
    #else
    (void)OSTaskCreateExt(OS_TaskStat,
                          (void *)0,                                   /* No args passed to OS_TaskStat()*/
                          &OSTaskStatStk[0],                           /* Set Top-Of-Stack               */
                          OS_TASK_STAT_PRIO,                           /* One higher than the idle task  */
                          OS_TASK_STAT_ID,
                          &OSTaskStatStk[OS_TASK_STAT_STK_SIZE - 1],   /* Set Bottom-Of-Stack            */
                          OS_TASK_STAT_STK_SIZE,
                          (void *)0,                                   /* No TCB extension               */
                          OS_TASK_OPT_STK_CHK | OS_TASK_OPT_STK_CLR);  /* Enable stack checking + clear  */
    #endif
#else
    #if OS_STK_GROWTH == 1
    (void)OSTaskCreate(OS_TaskStat,
                       (void *)0,                                      /* No args passed to OS_TaskStat()*/
                       &OSTaskStatStk[OS_TASK_STAT_STK_SIZE - 1],      /* Set Top-Of-Stack               */
                       OS_TASK_STAT_PRIO);                             /* One higher than the idle task  */
    #else
    (void)OSTaskCreate(OS_TaskStat,
                       (void *)0,                                      /* No args passed to OS_TaskStat()*/
                       &OSTaskStatStk[0],                              /* Set Top-Of-Stack               */
                       OS_TASK_STAT_PRIO);                             /* One higher than the idle task  */
    #endif
#endif

#if OS_TASK_NAME_SIZE > 14
    OSTaskNameSet(OS_TASK_STAT_PRIO, (INT8U *)"uC/OS-II Stat", &err);
#else
#if OS_TASK_NAME_SIZE > 7
    OSTaskNameSet(OS_TASK_STAT_PRIO, (INT8U *)"OS-Stat", &err);
#endif
#endif
}
#endif
/*$PAGE*/
/*
*********************************************************************************************************
*                                             INITIALIZATION
*                            INITIALIZE THE FREE LIST OF TASK CONTROL BLOCKS
*
* Description: This function is called by OSInit() to initialize the free list of OS_TCBs.
*
* Arguments  : none
*
* Returns    : none
*********************************************************************************************************
*/

static  void  OS_InitTCBList (void)
{
    INT8U    i;
    OS_TCB  *ptcb1;
    OS_TCB  *ptcb2;


    OS_MemClr((INT8U *)&OSTCBTbl[0],     sizeof(OSTCBTbl));      /* Clear all the TCBs                 */
    OS_MemClr((INT8U *)&OSTCBPrioTbl[0], sizeof(OSTCBPrioTbl));  /* Clear the priority table           */
    ptcb1 = &OSTCBTbl[0];
    ptcb2 = &OSTCBTbl[1];
    for (i = 0; i < (OS_MAX_TASKS + OS_N_SYS_TASKS - 1); i++) {  /* Init. list of free TCBs            */
        ptcb1->OSTCBNext = ptcb2;
#if OS_TASK_NAME_SIZE > 1
        ptcb1->OSTCBTaskName[0] = '?';                           /* Unknown name                       */
        ptcb1->OSTCBTaskName[1] = OS_ASCII_NUL;
#endif
        ptcb1++;
        ptcb2++;
    }
    ptcb1->OSTCBNext = (OS_TCB *)0;                              /* Last OS_TCB                        */
#if OS_TASK_NAME_SIZE > 1
    ptcb1->OSTCBTaskName[0] = '?';                               /* Unknown name                       */
    ptcb1->OSTCBTaskName[1] = OS_ASCII_NUL;
#endif
    OSTCBList               = (OS_TCB *)0;                       /* TCB lists initializations          */
    OSTCBFreeList           = &OSTCBTbl[0];
}
/*$PAGE*/
/*
*********************************************************************************************************
*                                        CLEAR A SECTION OF MEMORY
*
* Description: This function is called by other uC/OS-II services to clear a contiguous block of RAM.
*
* Arguments  : pdest    is the start of the RAM to clear (i.e. write 0x00 to)
*
*              size     is the number of bytes to clear.
*
* Returns    : none
*
* Notes      : 1) This function is INTERNAL to uC/OS-II and your application should not call it.
*              2) Note that we can only clear up to 64K bytes of RAM.  This is not an issue because none
*                 of the uses of this function gets close to this limit.
*              3) The clear is done one byte at a time since this will work on any processor irrespective
*                 of the alignment of the destination.
*********************************************************************************************************
*/

void  OS_MemClr (INT8U *pdest, INT16U size)
{
    while (size > 0) {
        *pdest++ = (INT8U)0;
        size--;
    }
}
/*$PAGE*/
/*
*********************************************************************************************************
*                                        COPY A BLOCK OF MEMORY
*
* Description: This function is called by other uC/OS-II services to copy a block of memory from one
*              location to another.
*
* Arguments  : pdest    is a pointer to the 'destination' memory block
*
*              psrc     is a pointer to the 'source'      memory block
*
*              size     is the number of bytes to copy.
*
* Returns    : none
*
* Notes      : 1) This function is INTERNAL to uC/OS-II and your application should not call it.  There is
*                 no provision to handle overlapping memory copy.  However, that's not a problem since this
*                 is not a situation that will happen.
*              2) Note that we can only copy up to 64K bytes of RAM
*              3) The copy is done one byte at a time since this will work on any processor irrespective
*                 of the alignment of the source and destination.
*********************************************************************************************************
*/

void  OS_MemCopy (INT8U *pdest, INT8U *psrc, INT16U size)
{
    while (size > 0) {
        *pdest++ = *psrc++;
        size--;
    }
}
/*$PAGE*/
/*
*********************************************************************************************************
*                                              SCHEDULER
*
* Description: This function is called by other uC/OS-II services to determine whether a new, high
*              priority task has been made ready to run.  This function is invoked by TASK level code
*              and is not used to reschedule tasks from ISRs (see OSIntExit() for ISR rescheduling).
*
* Arguments  : none
*
* Returns    : none
*
* Notes      : 1) This function is INTERNAL to uC/OS-II and your application should not call it.
*              2) Rescheduling is prevented when the scheduler is locked (see OS_SchedLock())
*********************************************************************************************************
*/

void  OS_Sched (void)
{
#if OS_CRITICAL_METHOD == 3                            /* Allocate storage for CPU status register     */
    OS_CPU_SR  cpu_sr = 0;
#endif



    OS_ENTER_CRITICAL();
    if (OSIntNesting == 0) {                           /* Schedule only if all ISRs done and ...       */
        if (OSLockNesting == 0) {                      /* ... scheduler is not locked                  */
            OS_SchedNew();
            if (OSPrioHighRdy != OSPrioCur) {          /* No Ctx Sw if current task is highest rdy     */
                OSTCBHighRdy = OSTCBPrioTbl[OSPrioHighRdy];
#if OS_TASK_PROFILE_EN > 0
                OSTCBHighRdy->OSTCBCtxSwCtr++;         /* Inc. # of context switches to this task      */
#endif
                OSCtxSwCtr++;                          /* Increment context switch counter             */
                OS_TASK_SW();                          /* Perform a context switch                     */
            }
        }
    }
    OS_EXIT_CRITICAL();
}


/*
*********************************************************************************************************
*                              FIND HIGHEST PRIORITY TASK READY TO RUN
*
* Description: This function is called by other uC/OS-II services to determine the highest priority task
*              that is ready to run.  The global variable 'OSPrioHighRdy' is changed accordingly.
*
* Arguments  : none
*
* Returns    : none
*
* Notes      : 1) This function is INTERNAL to uC/OS-II and your application should not call it.
*              2) Interrupts are assumed to be disabled when this function is called.
*********************************************************************************************************
*/

static  void  OS_SchedNew (void)
{
#if OS_LOWEST_PRIO <= 63                         /* See if we support up to 64 tasks                   */
    INT8U   y;


    y             = OSUnMapTbl[OSRdyGrp];
    OSPrioHighRdy = (INT8U)((y << 3) + OSUnMapTbl[OSRdyTbl[y]]);
#else                                            /* We support up to 256 tasks                         */
    INT8U   y;
    INT16U *ptbl;


    if ((OSRdyGrp & 0xFF) != 0) {
        y = OSUnMapTbl[OSRdyGrp & 0xFF];
    } else {
        y = OSUnMapTbl[(OSRdyGrp >> 8) & 0xFF] + 8;
    }
    ptbl = &OSRdyTbl[y];
    if ((*ptbl & 0xFF) != 0) {
        OSPrioHighRdy = (INT8U)((y << 4) + OSUnMapTbl[(*ptbl & 0xFF)]);
    } else {
        OSPrioHighRdy = (INT8U)((y << 4) + OSUnMapTbl[(*ptbl >> 8) & 0xFF] + 8);
    }
#endif
}

/*$PAGE*/
/*
*********************************************************************************************************
*                                        COPY AN ASCII STRING
*
* Description: This function is called by other uC/OS-II services to copy an ASCII string from a 'source'
*              string to a 'destination' string.
*
* Arguments  : pdest    is a pointer to the string that will be receiving the copy.  Note that there MUST
*                       be sufficient space in the destination storage area to receive this string.
*
*              psrc     is a pointer to the source string.  The source string MUST NOT be greater than
*                       254 characters.
*
* Returns    : The size of the string (excluding the NUL terminating character)
*
* Notes      : 1) This function is INTERNAL to uC/OS-II and your application should not call it.
*********************************************************************************************************
*/

#if (OS_EVENT_NAME_SIZE > 1) || (OS_FLAG_NAME_SIZE > 1) || (OS_MEM_NAME_SIZE > 1) || (OS_TASK_NAME_SIZE > 1) || (OS_TMR_CFG_NAME_SIZE > 1)
INT8U  OS_StrCopy (INT8U *pdest, INT8U *psrc)
{
    INT8U  len;


    len = 0;
    while (*psrc != OS_ASCII_NUL) {
        *pdest++ = *psrc++;
        len++;
    }
    *pdest = OS_ASCII_NUL;
    return (len);
}
#endif
/*$PAGE*/
/*
*********************************************************************************************************
*                                DETERMINE THE LENGTH OF AN ASCII STRING
*
* Description: This function is called by other uC/OS-II services to determine the size of an ASCII string
*              (excluding the NUL character).
*
* Arguments  : psrc     is a pointer to the string for which we need to know the size.
*
* Returns    : The size of the string (excluding the NUL terminating character)
*
* Notes      : 1) This function is INTERNAL to uC/OS-II and your application should not call it.
*              2) The string to check must be less than 255 characters long.
*********************************************************************************************************
*/

#if (OS_EVENT_NAME_SIZE > 1) || (OS_FLAG_NAME_SIZE > 1) || (OS_MEM_NAME_SIZE > 1) || (OS_TASK_NAME_SIZE > 1) || (OS_TMR_CFG_NAME_SIZE > 1)
INT8U  OS_StrLen (INT8U *psrc)
{
    INT8U  len;


    len = 0;
    while (*psrc != OS_ASCII_NUL) {
        psrc++;
        len++;
    }
    return (len);
}
#endif
/*$PAGE*/
/*
*********************************************************************************************************
*                                              IDLE TASK
*
* Description: This task is internal to uC/OS-II and executes whenever no other higher priority tasks
*              executes because they are ALL waiting for event(s) to occur.
*
* Arguments  : none
*
* Returns    : none
*
* Note(s)    : 1) OSTaskIdleHook() is called after the critical section to ensure that interrupts will be
*                 enabled for at least a few instructions.  On some processors (ex. Philips XA), enabling
*                 and then disabling interrupts didn't allow the processor enough time to have interrupts
*                 enabled before they were disabled again.  uC/OS-II would thus never recognize
*                 interrupts.
*              2) This hook has been added to allow you to do such things as STOP the CPU to conserve
*                 power.
*********************************************************************************************************
*/

void  OS_TaskIdle (void *p_arg)
{
#if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
    OS_CPU_SR  cpu_sr = 0;
#endif



    (void)p_arg;                                 /* Prevent compiler warning for not using 'parg'      */
    for (;;) {
        OS_ENTER_CRITICAL();
        OSIdleCtr++;
        OS_EXIT_CRITICAL();
        OSTaskIdleHook();                        /* Call user definable HOOK                           */
    }
}
/*$PAGE*/
/*
*********************************************************************************************************
*                                            STATISTICS TASK
*
* Description: This task is internal to uC/OS-II and is used to compute some statistics about the
*              multitasking environment.  Specifically, OS_TaskStat() computes the CPU usage.
*              CPU usage is determined by:
*
*                                          OSIdleCtr
*                 OSCPUUsage = 100 * (1 - ------------)     (units are in %)
*                                         OSIdleCtrMax
*
* Arguments  : parg     this pointer is not used at this time.
*
* Returns    : none
*
* Notes      : 1) This task runs at a priority level higher than the idle task.  In fact, it runs at the
*                 next higher priority, OS_TASK_IDLE_PRIO-1.
*              2) You can disable this task by setting the configuration #define OS_TASK_STAT_EN to 0.
*              3) You MUST have at least a delay of 2/10 seconds to allow for the system to establish the
*                 maximum value for the idle counter.
*********************************************************************************************************
*/

#if OS_TASK_STAT_EN > 0
void  OS_TaskStat (void *p_arg)
{
    INT32U     run;
    INT32U     max;
    INT8S      usage;
#if OS_CRITICAL_METHOD == 3                      /* Allocate storage for CPU status register           */
    OS_CPU_SR  cpu_sr = 0;
#endif



    p_arg = p_arg;                               /* Prevent compiler warning for not using 'parg'      */
    while (OSStatRdy == OS_FALSE) {
        OSTimeDly(2 * OS_TICKS_PER_SEC / 10);    /* Wait until statistic task is ready                 */
    }
    max = OSIdleCtrMax / 100L;
    for (;;) {
        OS_ENTER_CRITICAL();
        OSIdleCtrRun = OSIdleCtr;                /* Obtain the of the idle counter for the past second */
        run          = OSIdleCtr;
        OSIdleCtr    = 0L;                       /* Reset the idle counter for the next second         */
        OS_EXIT_CRITICAL();
        if (max > 0L) {
            usage = (INT8S)(100L - run / max);
            if (usage >= 0) {                    /* Make sure we don't have a negative percentage      */
                OSCPUUsage = usage;
            } else {
                OSCPUUsage = 0;
            }
        } else {
            OSCPUUsage = 0;
            max        = OSIdleCtrMax / 100L;
        }
        OSTaskStatHook();                        /* Invoke user definable hook                         */
#if (OS_TASK_STAT_STK_CHK_EN > 0) && (OS_TASK_CREATE_EXT_EN > 0)
        OS_TaskStatStkChk();                     /* Check the stacks for each task                     */
#endif
        OSTimeDly(OS_TICKS_PER_SEC / 10);        /* Accumulate OSIdleCtr for the next 1/10 second      */
    }
}
#endif
/*$PAGE*/
/*
*********************************************************************************************************
*                                      CHECK ALL TASK STACKS
*
* Description: This function is called by OS_TaskStat() to check the stacks of each active task.
*
* Arguments  : none
*
* Returns    : none
*********************************************************************************************************
*/

#if (OS_TASK_STAT_STK_CHK_EN > 0) && (OS_TASK_CREATE_EXT_EN > 0)
void  OS_TaskStatStkChk (void)
{
    OS_TCB      *ptcb;
    OS_STK_DATA  stk_data;
    INT8U        err;
    INT8U        prio;


    for (prio = 0; prio <= OS_TASK_IDLE_PRIO; prio++) {
        err = OSTaskStkChk(prio, &stk_data);
        if (err == OS_NO_ERR) {
            ptcb = OSTCBPrioTbl[prio];
            if (ptcb != (OS_TCB *)0) {                               /* Make sure task 'ptcb' is ...   */
                if (ptcb != (OS_TCB *)1) {                           /* ... still valid.               */
#if OS_TASK_PROFILE_EN > 0
                    #if OS_STK_GROWTH == 1
                    ptcb->OSTCBStkBase = ptcb->OSTCBStkBottom + ptcb->OSTCBStkSize;
                    #else
                    ptcb->OSTCBStkBase = ptcb->OSTCBStkBottom - ptcb->OSTCBStkSize;
                    #endif
                    ptcb->OSTCBStkUsed = stk_data.OSUsed;            /* Store the number of bytes used */
#endif
                }
            }
        }
    }
}
#endif
/*$PAGE*/
/*
*********************************************************************************************************
*                                            INITIALIZE TCB
*
* Description: This function is internal to uC/OS-II and is used to initialize a Task Control Block when
*              a task is created (see OSTaskCreate() and OSTaskCreateExt()).
*
* Arguments  : prio          is the priority of the task being created
*
*              ptos          is a pointer to the task's top-of-stack assuming that the CPU registers
*                            have been placed on the stack.  Note that the top-of-stack corresponds to a
*                            'high' memory location is OS_STK_GROWTH is set to 1 and a 'low' memory
*                            location if OS_STK_GROWTH is set to 0.  Note that stack growth is CPU
*                            specific.
*
*              pbos          is a pointer to the bottom of stack.  A NULL pointer is passed if called by
*                            'OSTaskCreate()'.
*
*              id            is the task's ID (0..65535)
*
*              stk_size      is the size of the stack (in 'stack units').  If the stack units are INT8Us
*                            then, 'stk_size' contains the number of bytes for the stack.  If the stack
*                            units are INT32Us then, the stack contains '4 * stk_size' bytes.  The stack
*                            units are established by the #define constant OS_STK which is CPU
*                            specific.  'stk_size' is 0 if called by 'OSTaskCreate()'.
*
*              pext          is a pointer to a user supplied memory area that is used to extend the task
*                            control block.  This allows you to store the contents of floating-point
*                            registers, MMU registers or anything else you could find useful during a
*                            context switch.  You can even assign a name to each task and store this name
*                            in this TCB extension.  A NULL pointer is passed if called by OSTaskCreate().
*
*              opt           options as passed to 'OSTaskCreateExt()' or,
*                            0 if called from 'OSTaskCreate()'.
*
* Returns    : OS_NO_ERR         if the call was successful
*              OS_NO_MORE_TCB    if there are no more free TCBs to be allocated and thus, the task cannot
*                                be created.
*
* Note       : This function is INTERNAL to uC/OS-II and your application should not call it.
*********************************************************************************************************
*/

INT8U  OS_TCBInit (INT8U prio, OS_STK *ptos, OS_STK *pbos, INT16U id, INT32U stk_size, void *pext, INT16U opt)
{
    OS_TCB    *ptcb;
#if OS_CRITICAL_METHOD == 3                                /* Allocate storage for CPU status register */
    OS_CPU_SR  cpu_sr = 0;
#endif



    OS_ENTER_CRITICAL();
    ptcb = OSTCBFreeList;                                  /* Get a free TCB from the free TCB list    */
    if (ptcb != (OS_TCB *)0) {
        OSTCBFreeList        = ptcb->OSTCBNext;            /* Update pointer to free TCB list          */
        OS_EXIT_CRITICAL();
        ptcb->OSTCBStkPtr    = ptos;                       /* Load Stack pointer in TCB                */
        ptcb->OSTCBPrio      = prio;                       /* Load task priority into TCB              */
        ptcb->OSTCBStat      = OS_STAT_RDY;                /* Task is ready to run                     */
        ptcb->OSTCBPendTO    = OS_FALSE;                   /* Clear the Pend timeout flag              */
        ptcb->OSTCBDly       = 0;                          /* Task is not delayed                      */

#if OS_TASK_CREATE_EXT_EN > 0
        ptcb->OSTCBExtPtr    = pext;                       /* Store pointer to TCB extension           */
        ptcb->OSTCBStkSize   = stk_size;                   /* Store stack size                         */
        ptcb->OSTCBStkBottom = pbos;                       /* Store pointer to bottom of stack         */
        ptcb->OSTCBOpt       = opt;                        /* Store task options                       */
        ptcb->OSTCBId        = id;                         /* Store task ID                            */
#else
        pext                 = pext;                       /* Prevent compiler warning if not used     */
        stk_size             = stk_size;
        pbos                 = pbos;
        opt                  = opt;
        id                   = id;
#endif

#if OS_TASK_DEL_EN > 0
        ptcb->OSTCBDelReq    = OS_NO_ERR;
#endif

#if OS_LOWEST_PRIO <= 63
        ptcb->OSTCBY         = (INT8U)(prio >> 3);         /* Pre-compute X, Y, BitX and BitY          */
        ptcb->OSTCBBitY      = (INT8U)(1 << ptcb->OSTCBY);
        ptcb->OSTCBX         = (INT8U)(prio & 0x07);
        ptcb->OSTCBBitX      = (INT8U)(1 << ptcb->OSTCBX);
#else
        ptcb->OSTCBY         = (INT8U)((prio >> 4) & 0xFF);/* Pre-compute X, Y, BitX and BitY          */
        ptcb->OSTCBBitY      = (INT16U)(1 << ptcb->OSTCBY);
        ptcb->OSTCBX         = (INT8U)(prio & 0x0F);
        ptcb->OSTCBBitX      = (INT16U)(1 << ptcb->OSTCBX);
#endif

#if OS_EVENT_EN
        ptcb->OSTCBEventPtr  = (OS_EVENT *)0;              /* Task is not pending on an event          */
#endif

#if (OS_VERSION >= 251) && (OS_FLAG_EN > 0) && (OS_MAX_FLAGS > 0) && (OS_TASK_DEL_EN > 0)
        ptcb->OSTCBFlagNode  = (OS_FLAG_NODE *)0;          /* Task is not pending on an event flag     */
#endif

#if (OS_MBOX_EN > 0) || ((OS_Q_EN > 0) && (OS_MAX_QS > 0))
        ptcb->OSTCBMsg       = (void *)0;                  /* No message received                      */
#endif

#if OS_TASK_PROFILE_EN > 0
        ptcb->OSTCBCtxSwCtr    = 0L;                       /* Initialize profiling variables           */
        ptcb->OSTCBCyclesStart = 0L;
        ptcb->OSTCBCyclesTot   = 0L;
        ptcb->OSTCBStkBase     = (OS_STK *)0;
        ptcb->OSTCBStkUsed     = 0L;
#endif

#if OS_TASK_NAME_SIZE > 1
        ptcb->OSTCBTaskName[0] = '?';                      /* Unknown name at task creation            */
        ptcb->OSTCBTaskName[1] = OS_ASCII_NUL;
#endif

#if OS_VERSION >= 204
        OSTCBInitHook(ptcb);
#endif

        OSTaskCreateHook(ptcb);                            /* Call user defined hook                   */

        OS_ENTER_CRITICAL();
        OSTCBPrioTbl[prio] = ptcb;
        ptcb->OSTCBNext    = OSTCBList;                    /* Link into TCB chain                      */
        ptcb->OSTCBPrev    = (OS_TCB *)0;
        if (OSTCBList != (OS_TCB *)0) {
            OSTCBList->OSTCBPrev = ptcb;
        }
        OSTCBList               = ptcb;
        OSRdyGrp               |= ptcb->OSTCBBitY;         /* Make task ready to run                   */
        OSRdyTbl[ptcb->OSTCBY] |= ptcb->OSTCBBitX;
        OSTaskCtr++;                                       /* Increment the #tasks counter             */
        OS_EXIT_CRITICAL();
        return (OS_NO_ERR);
    }
    OS_EXIT_CRITICAL();
    return (OS_NO_MORE_TCB);
}
