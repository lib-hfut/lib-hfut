/*
*********************************************************************************************************
*                                                uC/OS-II
*                                          The Real-Time Kernel
*
*                          (c) Copyright 1992-2006, Jean J. Labrosse, Weston, FL
*                                           All Rights Reserved
*
* File    : uCOS_II.C
* By      : Jean J. Labrosse
* Version : V2.83
*********************************************************************************************************
*/

#define  OS_GLOBALS                           /* Declare GLOBAL variables                              */
#include <ucos_ii.h>


#define  OS_MASTER_FILE                       /* Prevent the following files from including includes.h */
#include <os_core.c>
#include <os_flag.c>
#include <os_mbox.c>
#include <os_mem.c>
#include <os_mutex.c>
#include <os_q.c>
#include <os_sem.c>
#include <os_task.c>
#include <os_time.c>
#include <os_tmr.c>
