 

















































































 



















 







 























 



 





















 















































 













 





 



 


 


 






 







































 








 








 

 




















 




















 









 







 






 





 








 

 








 



































 





 

 






















 
typedef unsigned char __u_char;
typedef unsigned short __u_short;
typedef unsigned int __u_int;
typedef unsigned long __u_long;

typedef unsigned long long int __u_quad_t;
typedef long long int __quad_t;

typedef __quad_t *__qaddr_t;

typedef __u_quad_t __dev_t;		 
typedef __u_int __uid_t;		 
typedef __u_int __gid_t;		 
typedef __u_long __ino_t;		 
typedef __u_int __mode_t;		 
typedef __u_int __nlink_t; 		 
typedef long int __off_t;		 
typedef __quad_t __loff_t;		 
typedef int __pid_t;			 
typedef int __ssize_t;			 

typedef struct
  {
    int __val[2];
  } __fsid_t;				 

 
typedef int __daddr_t;			 
typedef char *__caddr_t;
typedef long int __time_t;
typedef long int __swblk_t;		 

typedef long int __clock_t;

 
typedef unsigned long int __fd_mask;

 


 




 
typedef struct
  {
     
    __fd_mask fds_bits[1024  / (8 * sizeof (__fd_mask)) ];
  } __fd_set;


typedef int __key_t;

typedef unsigned short int __ipc_pid_t;











 





 


 



 




 



 









 





 

 



 

 






























typedef unsigned int size_t;


















 




 



 





 















 




typedef unsigned int wint_t;









typedef int _G_int16_t __attribute__ ((__mode__ (__HI__)));
typedef int _G_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int _G_uint16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int _G_uint32_t __attribute__ ((__mode__ (__SI__)));




 










 




 


























 

 




















 




typedef void *__gnuc_va_list;



 



























 























 
























 



















struct _IO_jump_t;  struct _IO_FILE;

 

typedef void _IO_lock_t;



 

struct _IO_marker {
  struct _IO_marker *_next;
  struct _IO_FILE *_sbuf;
   

   
  int _pos;

};

struct _IO_FILE {
  int _flags;		 


   
   
  char* _IO_read_ptr;	 
  char* _IO_read_end;	 
  char* _IO_read_base;	 
  char* _IO_write_base;	 
  char* _IO_write_ptr;	 
  char* _IO_write_end;	 
  char* _IO_buf_base;	 
  char* _IO_buf_end;	 
   
  char *_IO_save_base;  
  char *_IO_backup_base;   
  char *_IO_save_end;  

  struct _IO_marker *_markers;

  struct _IO_FILE *_chain;

  int _fileno;
  int _blksize;
  __off_t   _offset;


   
  unsigned short _cur_column;
  char _unused;
  char _shortbuf[1];

   

  _IO_lock_t *_lock;
};


typedef struct _IO_FILE _IO_FILE;


struct _IO_FILE_plus;
extern struct _IO_FILE_plus _IO_stdin_, _IO_stdout_, _IO_stderr_;





 
typedef struct
{
  __ssize_t   (*read)  (struct _IO_FILE *, void *, __ssize_t  )  ;
  __ssize_t   (*write)  (struct _IO_FILE *, const void *, __ssize_t  )  ;
  __off_t   (*seek)  (struct _IO_FILE *, __off_t  , int)  ;
  int (*close)  (struct _IO_FILE *)  ;
} _IO_cookie_io_functions_t;

 
struct _IO_cookie_file {
  struct _IO_FILE file;
  const void *vtable;
  void *cookie;
  _IO_cookie_io_functions_t io_functions;
};




extern int __underflow  (_IO_FILE*)  ;
extern int __uflow  (_IO_FILE*)  ;
extern int __overflow  (_IO_FILE*, int)  ;









extern int _IO_getc  (_IO_FILE *__fp)  ;
extern int _IO_putc  (int __c, _IO_FILE *__fp)  ;
extern int _IO_feof  (_IO_FILE *__fp)  ;
extern int _IO_ferror  (_IO_FILE *__fp)  ;

extern int _IO_peekc_locked  (_IO_FILE *__fp)  ;

 


extern void _IO_flockfile  (_IO_FILE *)  ;
extern void _IO_funlockfile  (_IO_FILE *)  ;
extern int _IO_ftrylockfile  (_IO_FILE *)  ;









 










extern int _IO_vfscanf  (_IO_FILE*, const char*, __gnuc_va_list , int*)  ;
extern int _IO_vfprintf  (_IO_FILE*, const char*, __gnuc_va_list )  ;
extern __ssize_t   _IO_padn  (_IO_FILE *, int, __ssize_t  )  ;
extern size_t   _IO_sgetn  (_IO_FILE *, void*, size_t  )  ;

extern __off_t   _IO_seekoff  (_IO_FILE*, __off_t  , int, int)  ;
extern __off_t   _IO_seekpos  (_IO_FILE*, __off_t  , int)  ;

extern void _IO_free_backup_area  (_IO_FILE*)  ;





















  


typedef struct _IO_FILE FILE;
typedef __off_t   fpos_t;





















 



 
extern FILE *stdin, *stdout, *stderr;  









extern void clearerr  (FILE*)  ;
extern int fclose  (FILE*)  ;
extern int feof  (FILE*)  ;
extern int ferror  (FILE*)  ;
extern int fflush  (FILE*)  ;
extern int fgetc  (FILE *)  ;
extern int fgetpos  (FILE* fp, fpos_t *pos)  ;
extern char* fgets  (char*, int, FILE*)  ;
extern FILE* fopen  (__const char*, __const char*)  ;
extern FILE* fopencookie  (void *cookie, __const char *mode,
			       _IO_cookie_io_functions_t io_functions)  ;
extern int fprintf  (FILE*, __const char* format, ...)  ;
extern int fputc  (int, FILE*)  ;
extern int fputs  (__const char *str, FILE *fp)  ;
extern size_t fread  (void*, size_t, size_t, FILE*)  ;
extern FILE* freopen  (__const char*, __const char*, FILE*)  ;
extern int fscanf  (FILE *fp, __const char* format, ...)  ;
extern int fseek  (FILE* fp, long int offset, int whence)  ;
extern int fsetpos  (FILE* fp, __const fpos_t *pos)  ;
extern long int ftell  (FILE* fp)  ;
extern size_t fwrite  (__const void*, size_t, size_t, FILE*)  ;
extern int getc  (FILE *)  ;
extern int getchar  (void)  ;
extern char* gets  (char*)  ;
extern void perror  (__const char *)  ;
extern int printf  (__const char* format, ...)  ;
extern int putc  (int, FILE *)  ;
extern int putchar  (int)  ;
extern int puts  (__const char *str)  ;
extern int remove  (__const char*)  ;
extern int rename  (__const char* _old, __const char* _new)  ;
extern void rewind  (FILE*)  ;
extern int scanf  (__const char* format, ...)  ;
extern void setbuf  (FILE*, char*)  ;
extern void setlinebuf  (FILE*)  ;
extern void setbuffer  (FILE*, char*, int)  ;
extern int setvbuf  (FILE*, char*, int mode, size_t size)  ;
extern int sprintf  (char*, __const char* format, ...)  ;
extern int sscanf  (__const char* string, __const char* format, ...)  ;
extern FILE* tmpfile  (void)  ;
extern char* tmpnam  (char*)  ;

extern char* tmpnam_r  (char*)  ;


extern char *tempnam  (__const char *__dir, __const char *__pfx)  ;

extern char *__stdio_gen_tempname  (char *__buf, size_t bufsize,
					__const char *dir, __const char *pfx,
					int dir_search, size_t *lenptr,
					FILE **streamptr)  ;
extern int ungetc  (int c, FILE* fp)  ;
extern int vfprintf  (FILE *fp, char __const *fmt0, __gnuc_va_list )  ;
extern int vprintf  (char __const *fmt, __gnuc_va_list )  ;
extern int vsprintf  (char* string, __const char* format, __gnuc_va_list )  ;
extern void __libc_fatal  (__const char *__message)  
     __attribute__ ((__noreturn__));


extern int dprintf  (int, __const char *, ...)  ;
extern int vdprintf  (int, __const char *, __gnuc_va_list )  ;
extern int vfscanf  (FILE*, __const char *, __gnuc_va_list )  ;
extern int __vfscanf  (FILE*, __const char *, __gnuc_va_list )  ;
extern int vscanf  (__const char *, __gnuc_va_list )  ;
extern int vsscanf  (__const char *, __const char *, __gnuc_va_list )  ;
extern int __vsscanf  (__const char *, __const char *, __gnuc_va_list )  ;





extern FILE *fdopen  (int, __const char *)  ;
extern int fileno  (FILE*)  ;
extern FILE* popen  (__const char*, __const char*)  ;
extern int pclose  (FILE*)  ;




 
extern char *ctermid  (char *__buf)  ;

 
extern char *cuserid  (char * __buf)  ;



extern int snprintf  (char *, size_t, __const char *, ...)  ;
extern int __snprintf  (char *, size_t, __const char *, ...)  ;
extern int vsnprintf  (char *, size_t, __const char *, __gnuc_va_list )  ;
extern int __vsnprintf  (char *, size_t, __const char *, __gnuc_va_list )  ;




extern int __underflow  (struct _IO_FILE*)  ;
extern int __overflow  (struct _IO_FILE*, int)  ;


extern int sys_nerr;
extern const char *const sys_errlist[];



 

extern void clearerr_locked  (FILE *)  ;
extern void clearerr_unlocked  (FILE *)  ;
extern int feof_locked  (FILE *)  ;
extern int feof_unlocked  (FILE *)  ;
extern int ferror_locked  (FILE*)  ;
extern int ferror_unlocked  (FILE*)  ;
extern int fileno_locked  (FILE *)  ;
extern int fileno_unlocked  (FILE *)  ;
extern int fclose_unlocked  (FILE *)  ;
extern int fflush_locked  (FILE *)  ;
extern int fflush_unlocked  (FILE *)  ;
extern size_t fread_unlocked  (void *, size_t, size_t, FILE *)  ;
extern size_t fwrite_unlocked  (const void *, size_t, size_t, FILE *)  ;

extern int fputc_locked  (int, FILE*)  ;
extern int fputc_unlocked  (int, FILE*)  ;
extern int getc_locked  (FILE *)  ;
extern int getchar_locked  (void)  ;
extern int putc_locked  (int, FILE *)  ;
extern int putchar_locked  (int)  ;









 
extern void flockfile  (FILE *)  ;
extern void funlockfile  (FILE *)  ;
extern int ftrylockfile  (FILE *)  ;

extern int getc_unlocked  (FILE *)  ;
extern int getchar_unlocked  (void)  ;
extern int putc_unlocked  (int, FILE *)  ;
extern int putchar_unlocked  (int)  ;





















 

















 








 








 





 


 



 




 



 









 





 

 



 

 







 




 



























 
















typedef long int wchar_t;
















 





 















 

 
typedef struct
  {
    int quot;			 
    int rem;			 
  } div_t;

 
typedef struct
  {
    long int quot;		 
    long int rem;		 
  } ldiv_t;




 



 





 

extern int __ctype_get_mb_cur_max  (void)  ;


 
extern double atof  (__const char *__nptr)  ;
 
extern int atoi  (__const char *__nptr)  ;
 
extern long int atol  (__const char *__nptr)  ;


 
extern long long int atoll  (__const char *__nptr)  ;


 
extern double strtod  (__const char *__nptr, char **__endptr)  ;



 
extern long int strtol  (__const char *__nptr, char **__endptr,
			     int __base)  ;
 
extern unsigned long int strtoul  (__const char *__nptr,
				       char **__endptr, int __base)  ;


 
extern long long int strtoq  (__const char *__nptr, char **__endptr,
				  int __base)  ;
 
extern unsigned long long int strtouq  (__const char *__nptr,
					    char **__endptr, int __base)  ;



 

 
extern long long int strtoll  (__const char *__nptr, char **__endptr,
				   int __base)  ;
 
extern unsigned long long int strtoull  (__const char *__nptr,
					     char **__endptr, int __base)  ;




 


extern double __strtod_internal  (__const char *__nptr,
				      char **__endptr, int __group)  ;
extern float __strtof_internal  (__const char *__nptr, char **__endptr,
				     int __group)  ;
extern long double  __strtold_internal  (__const char *__nptr,
						char **__endptr, int __group)  ;
extern long int __strtol_internal  (__const char *__nptr, char **__endptr,
					int __base, int __group)  ;
extern unsigned long int __strtoul_internal  (__const char *__nptr,
						  char **__endptr, int __base,
						  int __group)  ;

extern long long int __strtoq_internal  (__const char *__nptr,
					     char **__endptr, int __base,
					     int __group)  ;
extern unsigned long long int __strtouq_internal  (__const char *__nptr,
						       char **__endptr,
						       int __base,
						       int __group)  ;






 


extern char *l64a  (long int __n)  ;

 
extern long int a64l  (__const char *__s)  ;


 

















 








 




typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;


typedef __dev_t dev_t;
typedef __gid_t gid_t;
typedef __ino_t ino_t;
typedef __mode_t mode_t;
typedef __nlink_t nlink_t;
typedef __off_t off_t;
typedef __loff_t loff_t;
typedef __pid_t pid_t;
typedef __uid_t uid_t;


typedef __ssize_t ssize_t;




typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;



typedef __key_t key_t;



 

















 






















 
typedef __time_t time_t;
























 





 


 



 




 



 









 





 

 



 

 







 




 



 





 













 
typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;


 



 



typedef int int8_t __attribute__ ((__mode__ (  __QI__ ))) ;
typedef unsigned int u_int8_t __attribute__ ((__mode__ (  __QI__ ))) ;
typedef int int16_t __attribute__ ((__mode__ (  __HI__ ))) ;
typedef unsigned int u_int16_t __attribute__ ((__mode__ (  __HI__ ))) ;
typedef int int32_t __attribute__ ((__mode__ (  __SI__ ))) ;
typedef unsigned int u_int32_t __attribute__ ((__mode__ (  __SI__ ))) ;
typedef int int64_t __attribute__ ((__mode__ (  __DI__ ))) ;
typedef unsigned int u_int64_t __attribute__ ((__mode__ (  __DI__ ))) ;

typedef int register_t __attribute__ ((__mode__ (__word__)));


 






 
 





















 









 
 














 
 


















 






 


 
 
































 

 

















 
























 

struct timespec
  {
    long int tv_sec;		 
    long int tv_nsec;		 
  };














 

 



struct timeval;

typedef __fd_mask fd_mask;

 
typedef __fd_set fd_set;

 



 




 






 




extern int __select  (int __nfds, __fd_set *__readfds,
			  __fd_set *__writefds, __fd_set *__exceptfds,
			  struct timeval *__timeout)  ;
extern int select  (int __nfds, __fd_set *__readfds,
			__fd_set *__writefds, __fd_set *__exceptfds,
			struct timeval *__timeout)  ;

 


extern int __pselect  (int __nfds, __fd_set *__readfds,
			   __fd_set *__writefds, __fd_set *__exceptfds,
			   struct timespec *__timeout)  ;
extern int pselect  (int __nfds, __fd_set *__readfds,
			 __fd_set *__writefds, __fd_set *__exceptfds,
			 struct timespec *__timeout)  ;


 






 




 



 
extern int32_t __random  (void)  ;
extern int32_t random  (void)  ;

 
extern void __srandom  (unsigned int __seed)  ;
extern void srandom  (unsigned int __seed)  ;

 



extern void *  __initstate  (unsigned int __seed, void *  __statebuf,
				 size_t __statelen)  ;
extern void *  initstate  (unsigned int __seed, void *  __statebuf,
			       size_t __statelen)  ;

 

extern void *  __setstate  (void *  __statebuf)  ;
extern void *  setstate  (void *  __statebuf)  ;



 



struct random_data
  {
    int32_t *fptr;		 
    int32_t *rptr;		 
    int32_t *state;		 
    int rand_type;		 
    int rand_deg;		 
    int rand_sep;		 
    int32_t *end_ptr;		 
  };

extern int __random_r  (struct random_data *__buf, int32_t *__result)  ;
extern int random_r  (struct random_data *__buf, int32_t *__result)  ;

extern int __srandom_r  (unsigned int __seed, struct random_data *__buf)  ;
extern int srandom_r  (unsigned int __seed, struct random_data *__buf)  ;

extern int __initstate_r  (unsigned int __seed, void *  __statebuf,
			       size_t __statelen, struct random_data *__buf)  ;
extern int initstate_r  (unsigned int __seed, void *  __statebuf,
			     size_t __statelen, struct random_data *__buf)  ;

extern int __setstate_r  (void *  __statebuf, struct random_data *__buf)  ;
extern int setstate_r  (void *  __statebuf, struct random_data *__buf)  ;




 
extern int rand  (void)  ;
 
extern void srand  (unsigned int __seed)  ;


 
extern int __rand_r  (unsigned int *__seed)  ;
extern int rand_r  (unsigned int *__seed)  ;




 

 
extern double drand48  (void)  ;
extern double erand48  (unsigned short int __xsubi[3])  ;

 
extern long lrand48  (void)  ;
extern long nrand48  (unsigned short int __xsubi[3])  ;

 
extern long mrand48  (void)  ;
extern long jrand48  (unsigned short int __xsubi[3])  ;

 
extern void srand48  (long __seedval)  ;
extern unsigned short int *seed48  (unsigned short int __seed16v[3])  ;
extern void lcong48  (unsigned short int __param[7])  ;

 
struct drand48_data
  {
    unsigned short int x[3];	 
    unsigned short int a[3];	 
    unsigned short int c;	 
    unsigned short int old_x[3];  
    int init;			 
  };


 
extern int drand48_r  (struct drand48_data *__buffer, double *__result)  ;
extern int erand48_r  (unsigned short int __xsubi[3],
			   struct drand48_data *__buffer, double *__result)  ;

 
extern int lrand48_r  (struct drand48_data *__buffer, long *__result)  ;
extern int nrand48_r  (unsigned short int __xsubi[3],
			   struct drand48_data *__buffer, long *__result)  ;

 
extern int mrand48_r  (struct drand48_data *__buffer, long *__result)  ;
extern int jrand48_r  (unsigned short int __xsubi[3],
			   struct drand48_data *__buffer, long *__result)  ;

 
extern int srand48_r  (long __seedval, struct drand48_data *__buffer)  ;
extern int seed48_r  (unsigned short int __seed16v[3],
			  struct drand48_data *__buffer)  ;
extern int lcong48_r  (unsigned short int __param[7],
			   struct drand48_data *__buffer)  ;


 
extern int __drand48_iterate  (unsigned short int __xsubi[3],
				   struct drand48_data *__buffer)  ;



 
extern void *  malloc  (size_t __size)  ;
 

extern void *  realloc  (void *  __ptr, size_t __size)  ;
 
extern void *  calloc  (size_t __nmemb, size_t __size)  ;
 
extern void free  (void *  __ptr)  ;


 
extern void cfree  (void *  __ptr)  ;



 




























 





 


 



 




 



 









 





 

 



 

 







 




 



 





 












 

 



 
extern void *  __alloca  (size_t __size)  ;
extern void *  alloca  (size_t __size)  ;






 






 
extern void *  valloc  (size_t __size)  ;



 
extern void abort  (void)   __attribute__ ((__noreturn__));


 
extern int atexit  (void (*__func) (void))  ;


 

extern int __on_exit  (void (*__func) (int __status, void *  __arg),
			   void *  __arg)  ;
extern int on_exit  (void (*__func) (int __status, void *  __arg),
			 void *  __arg)  ;


 


extern void exit  (int __status)   __attribute__ ((__noreturn__));


 
extern char *getenv  (__const char *__name)  ;

 

extern char *__secure_getenv  (__const char *__name)  ;


 
 

extern int putenv  (__const char *__string)  ;



 

extern int setenv  (__const char *__name, __const char *__value,
			int __replace)  ;

 
extern void unsetenv  (__const char *__name)  ;



 


extern int __clearenv  (void)  ;
extern int clearenv  (void)  ;




 



extern char *mktemp  (char *__template)  ;

 




extern int mkstemp  (char *__template)  ;



 
extern int system  (__const char *__command)  ;





 





extern char *realpath  (__const char *__name, char *__resolved)  ;



 


typedef int (*__compar_fn_t)  (__const void * , __const void * )  ;




 

extern void *  bsearch  (__const void *  __key, __const void *  __base,
			     size_t __nmemb, size_t __size,
			     __compar_fn_t __compar)  ;

 

extern void qsort  (void *  __base, size_t __nmemb, size_t __size,
			__compar_fn_t __compar)  ;


 
extern int abs  (int __x)   __attribute__ ((__const__));
extern long int labs  (long int __x)   __attribute__ ((__const__));



 

 
extern div_t div  (int __numer, int __denom)   __attribute__ ((__const__));
extern ldiv_t ldiv  (long int __numer, long int __denom)   __attribute__ ((__const__));




 


 


extern char *ecvt  (double __value, int __ndigit, int *__decpt,
			int *__sign)  ;

 


extern char *fcvt  (double __value, int __ndigit, int *__decpt,
			int *__sign)  ;

 


extern char *gcvt  (double __value, int __ndigit, char *__buf)  ;

 
extern char *qecvt  (long double  __value, int __ndigit, int *__decpt,
			 int *__sign)  ;
extern char *qfcvt  (long double  __value, int __ndigit, int *__decpt,
			 int *__sign)  ;
extern char *qgcvt  (long double  __value, int __ndigit, char *__buf)  ;



 

extern int ecvt_r  (double __value, int __ndigit, int *__decpt,
			int *__sign, char *__buf, size_t __len)  ;
extern int fcvt_r  (double __value, int __ndigit, int *__decpt,
			int *__sign, char *__buf, size_t __len)  ;

extern int qecvt_r  (long double  __value, int __ndigit, int *__decpt,
			 int *__sign, char *__buf, size_t __len)  ;
extern int qfcvt_r  (long double  __value, int __ndigit, int *__decpt,
			 int *__sign, char *__buf, size_t __len)  ;




 

extern int mblen  (__const char *__s, size_t __n)  ;
 

extern int mbtowc  (wchar_t *__pwc, __const char *__s, size_t __n)  ;
 

extern int wctomb  (char *__s, wchar_t __wchar)  ;


 
extern size_t mbstowcs  (wchar_t *__pwcs, __const char *__s, size_t __n)  ;
 
extern size_t wcstombs  (char *__s, __const wchar_t *__pwcs, size_t __n)  ;



 



extern int rpmatch  (__const char *__response)  ;









 



 


















 








 

 

 

























 









 







 



 










 


















 

























 

 
extern   double          acos          (double  __x)    ; extern   double         __acos          (double  __x)      ;
 
extern   double          asin          (double  __x)    ; extern   double         __asin          (double  __x)      ;
 
extern   double          atan          (double  __x)    ; extern   double         __atan          (double  __x)      ;
 
extern   double          atan2          (double  __y, double  __x)    ; extern   double         __atan2          (double  __y, double  __x)      ;

 
extern   double          cos          (double  __x)    ; extern   double         __cos          (double  __x)      ;
 
extern   double          sin          (double  __x)    ; extern   double         __sin          (double  __x)      ;
 
extern   double          tan          (double  __x)    ; extern   double         __tan          (double  __x)      ;


 

 
extern   double          cosh          (double  __x)    ; extern   double         __cosh          (double  __x)      ;
 
extern   double          sinh          (double  __x)    ; extern   double         __sinh          (double  __x)      ;
 
extern   double          tanh          (double  __x)    ; extern   double         __tanh          (double  __x)      ;


 
extern   double          acosh          (double  __x)    ; extern   double         __acosh          (double  __x)      ;
 
extern   double          asinh          (double  __x)    ; extern   double         __asinh          (double  __x)      ;
 
extern   double          atanh          (double  __x)    ; extern   double         __atanh          (double  __x)      ;


 

 
extern   double          exp          (double  __x)    ; extern   double         __exp          (double  __x)      ;

 
extern   double          frexp          (double  __x, int *__exponent)    ; extern   double         __frexp          (double  __x, int *__exponent)      ;

 
extern   double          ldexp          (double  __x, int __exponent)    ; extern   double         __ldexp          (double  __x, int __exponent)      ;

 
extern   double          log          (double  __x)    ; extern   double         __log          (double  __x)      ;

 
extern   double          log10          (double  __x)    ; extern   double         __log10          (double  __x)      ;


 
extern   double          expm1          (double  __x)    ; extern   double         __expm1          (double  __x)      ;

 
extern   double          log1p          (double  __x)    ; extern   double         __log1p          (double  __x)      ;

 
extern   double          logb          (double  __x)    ; extern   double         __logb          (double  __x)      ;


 
extern   double          modf          (double  __x, double  *__iptr)    ; extern   double         __modf          (double  __x, double  *__iptr)      ;


 

 
extern   double          pow          (double  __x, double  __y)    ; extern   double         __pow          (double  __x, double  __y)      ;

 
extern   double          sqrt          (double  __x)    ; extern   double         __sqrt          (double  __x)      ;


 
extern   double          cbrt          (double  __x)    ; extern   double         __cbrt          (double  __x)      ;



 

 
extern   double          ceil          (double  __x)    ; extern   double         __ceil          (double  __x)      ;

 
extern   double          fabs          (double  __x)    ; extern   double         __fabs          (double  __x)      ;

 
extern   double          floor          (double  __x)    ; extern   double         __floor          (double  __x)      ;

 
extern   double          fmod          (double  __x, double  __y)    ; extern   double         __fmod          (double  __x, double  __y)      ;




 

extern   int        isinf        (double  __value)   ; extern   int        __isinf        (double  __value)    ;

 
extern   int        finite        (double  __value)   ; extern   int        __finite        (double  __value)    ;

 
extern   double          copysign          (double  __x, double  __y)    ; extern   double         __copysign          (double  __x, double  __y)      ;

 
extern   double          scalbn          (double  __x, int __n)    ; extern   double         __scalbn          (double  __x, int __n)      ;

 
extern   double          drem          (double  __x, double  __y)    ; extern   double         __drem          (double  __x, double  __y)      ;

 
extern   double          significand          (double  __x)    ; extern   double         __significand          (double  __x)      ;





 
extern   int        isnan        (double  __value)   ; extern   int        __isnan        (double  __value)    ;

 
extern   int        ilogb        (double  __x)   ; extern   int        __ilogb        (double  __x)    ;

 
extern   double          hypot          (double  __x, double  __y)    ; extern   double         __hypot          (double  __x, double  __y)      ;


 
extern   double          erf          (double )    ; extern   double         __erf          (double )      ;
extern   double          erfc          (double )    ; extern   double         __erfc          (double )      ;
extern   double          gamma          (double )    ; extern   double         __gamma          (double )      ;
extern   double          j0          (double )    ; extern   double         __j0          (double )      ;
extern   double          j1          (double )    ; extern   double         __j1          (double )      ;
extern   double          jn          (int, double )    ; extern   double         __jn          (int, double )      ;
extern   double          lgamma          (double )    ; extern   double         __lgamma          (double )      ;
extern   double          y0          (double )    ; extern   double         __y0          (double )      ;
extern   double          y1          (double )    ; extern   double         __y1          (double )      ;
extern   double          yn          (int, double )    ; extern   double         __yn          (int, double )      ;




 


extern   double          gamma_r              (double , int *)    ; extern   double         __gamma_r              (double , int *)      ;
extern   double          lgamma_r              (double , int *)    ; extern   double         __lgamma_r              (double , int *)      ;





 

extern   double          rint          (double  __x)    ; extern   double         __rint          (double  __x)      ;

 
extern   double          scalb          (double  __x, double  __n)    ; extern   double         __scalb          (double  __x, double  __n)      ;

 
extern   double          nextafter          (double  __x, double  __y)    ; extern   double         __nextafter          (double  __x, double  __y)      ;

 
extern   double          remainder          (double  __x, double  __y)    ; extern   double         __remainder          (double  __x, double  __y)      ;










 









 


















 

























 

 
extern   float          acosf         (float   __x)    ; extern   float         __acosf         (float   __x)      ;
 
extern   float          asinf         (float   __x)    ; extern   float         __asinf         (float   __x)      ;
 
extern   float          atanf         (float   __x)    ; extern   float         __atanf         (float   __x)      ;
 
extern   float          atan2f         (float   __y, float   __x)    ; extern   float         __atan2f         (float   __y, float   __x)      ;

 
extern   float          cosf         (float   __x)    ; extern   float         __cosf         (float   __x)      ;
 
extern   float          sinf         (float   __x)    ; extern   float         __sinf         (float   __x)      ;
 
extern   float          tanf         (float   __x)    ; extern   float         __tanf         (float   __x)      ;


 

 
extern   float          coshf         (float   __x)    ; extern   float         __coshf         (float   __x)      ;
 
extern   float          sinhf         (float   __x)    ; extern   float         __sinhf         (float   __x)      ;
 
extern   float          tanhf         (float   __x)    ; extern   float         __tanhf         (float   __x)      ;


 
extern   float          acoshf         (float   __x)    ; extern   float         __acoshf         (float   __x)      ;
 
extern   float          asinhf         (float   __x)    ; extern   float         __asinhf         (float   __x)      ;
 
extern   float          atanhf         (float   __x)    ; extern   float         __atanhf         (float   __x)      ;


 

 
extern   float          expf         (float   __x)    ; extern   float         __expf         (float   __x)      ;

 
extern   float          frexpf         (float   __x, int *__exponent)    ; extern   float         __frexpf         (float   __x, int *__exponent)      ;

 
extern   float          ldexpf         (float   __x, int __exponent)    ; extern   float         __ldexpf         (float   __x, int __exponent)      ;

 
extern   float          logf         (float   __x)    ; extern   float         __logf         (float   __x)      ;

 
extern   float          log10f         (float   __x)    ; extern   float         __log10f         (float   __x)      ;


 
extern   float          expm1f         (float   __x)    ; extern   float         __expm1f         (float   __x)      ;

 
extern   float          log1pf         (float   __x)    ; extern   float         __log1pf         (float   __x)      ;

 
extern   float          logbf         (float   __x)    ; extern   float         __logbf         (float   __x)      ;


 
extern   float          modff         (float   __x, float   *__iptr)    ; extern   float         __modff         (float   __x, float   *__iptr)      ;


 

 
extern   float          powf         (float   __x, float   __y)    ; extern   float         __powf         (float   __x, float   __y)      ;

 
extern   float          sqrtf         (float   __x)    ; extern   float         __sqrtf         (float   __x)      ;


 
extern   float          cbrtf         (float   __x)    ; extern   float         __cbrtf         (float   __x)      ;



 

 
extern   float          ceilf         (float   __x)    ; extern   float         __ceilf         (float   __x)      ;

 
extern   float          fabsf         (float   __x)    ; extern   float         __fabsf         (float   __x)      ;

 
extern   float          floorf         (float   __x)    ; extern   float         __floorf         (float   __x)      ;

 
extern   float          fmodf         (float   __x, float   __y)    ; extern   float         __fmodf         (float   __x, float   __y)      ;




 

extern   int       isinff       (float   __value)   ; extern   int       __isinff       (float   __value)    ;

 
extern   int       finitef       (float   __value)   ; extern   int       __finitef       (float   __value)    ;

 
extern   float          copysignf         (float   __x, float   __y)    ; extern   float         __copysignf         (float   __x, float   __y)      ;

 
extern   float          scalbnf         (float   __x, int __n)    ; extern   float         __scalbnf         (float   __x, int __n)      ;

 
extern   float          dremf         (float   __x, float   __y)    ; extern   float         __dremf         (float   __x, float   __y)      ;

 
extern   float          significandf         (float   __x)    ; extern   float         __significandf         (float   __x)      ;





 
extern   int       isnanf       (float   __value)   ; extern   int       __isnanf       (float   __value)    ;

 
extern   int       ilogbf       (float   __x)   ; extern   int       __ilogbf       (float   __x)    ;

 
extern   float          hypotf         (float   __x, float   __y)    ; extern   float         __hypotf         (float   __x, float   __y)      ;


 
extern   float          erff         (float  )    ; extern   float         __erff         (float  )      ;
extern   float          erfcf         (float  )    ; extern   float         __erfcf         (float  )      ;
extern   float          gammaf         (float  )    ; extern   float         __gammaf         (float  )      ;
extern   float          j0f         (float  )    ; extern   float         __j0f         (float  )      ;
extern   float          j1f         (float  )    ; extern   float         __j1f         (float  )      ;
extern   float          jnf         (int, float  )    ; extern   float         __jnf         (int, float  )      ;
extern   float          lgammaf         (float  )    ; extern   float         __lgammaf         (float  )      ;
extern   float          y0f         (float  )    ; extern   float         __y0f         (float  )      ;
extern   float          y1f         (float  )    ; extern   float         __y1f         (float  )      ;
extern   float          ynf         (int, float  )    ; extern   float         __ynf         (int, float  )      ;




 


extern   float          gammaf_r            (float  , int *)    ; extern   float         __gammaf_r            (float  , int *)      ;
extern   float          lgammaf_r            (float  , int *)    ; extern   float         __lgammaf_r            (float  , int *)      ;





 

extern   float          rintf         (float   __x)    ; extern   float         __rintf         (float   __x)      ;

 
extern   float          scalbf         (float   __x, float   __n)    ; extern   float         __scalbf         (float   __x, float   __n)      ;

 
extern   float          nextafterf         (float   __x, float   __y)    ; extern   float         __nextafterf         (float   __x, float   __y)      ;

 
extern   float          remainderf         (float   __x, float   __y)    ; extern   float         __remainderf         (float   __x, float   __y)      ;







 









 


















 

























 

 
extern   long double          acosl         (long double   __x)    ; extern   long double         __acosl         (long double   __x)      ;
 
extern   long double          asinl         (long double   __x)    ; extern   long double         __asinl         (long double   __x)      ;
 
extern   long double          atanl         (long double   __x)    ; extern   long double         __atanl         (long double   __x)      ;
 
extern   long double          atan2l         (long double   __y, long double   __x)    ; extern   long double         __atan2l         (long double   __y, long double   __x)      ;

 
extern   long double          cosl         (long double   __x)    ; extern   long double         __cosl         (long double   __x)      ;
 
extern   long double          sinl         (long double   __x)    ; extern   long double         __sinl         (long double   __x)      ;
 
extern   long double          tanl         (long double   __x)    ; extern   long double         __tanl         (long double   __x)      ;


 

 
extern   long double          coshl         (long double   __x)    ; extern   long double         __coshl         (long double   __x)      ;
 
extern   long double          sinhl         (long double   __x)    ; extern   long double         __sinhl         (long double   __x)      ;
 
extern   long double          tanhl         (long double   __x)    ; extern   long double         __tanhl         (long double   __x)      ;


 
extern   long double          acoshl         (long double   __x)    ; extern   long double         __acoshl         (long double   __x)      ;
 
extern   long double          asinhl         (long double   __x)    ; extern   long double         __asinhl         (long double   __x)      ;
 
extern   long double          atanhl         (long double   __x)    ; extern   long double         __atanhl         (long double   __x)      ;


 

 
extern   long double          expl         (long double   __x)    ; extern   long double         __expl         (long double   __x)      ;

 
extern   long double          frexpl         (long double   __x, int *__exponent)    ; extern   long double         __frexpl         (long double   __x, int *__exponent)      ;

 
extern   long double          ldexpl         (long double   __x, int __exponent)    ; extern   long double         __ldexpl         (long double   __x, int __exponent)      ;

 
extern   long double          logl         (long double   __x)    ; extern   long double         __logl         (long double   __x)      ;

 
extern   long double          log10l         (long double   __x)    ; extern   long double         __log10l         (long double   __x)      ;


 
extern   long double          expm1l         (long double   __x)    ; extern   long double         __expm1l         (long double   __x)      ;

 
extern   long double          log1pl         (long double   __x)    ; extern   long double         __log1pl         (long double   __x)      ;

 
extern   long double          logbl         (long double   __x)    ; extern   long double         __logbl         (long double   __x)      ;


 
extern   long double          modfl         (long double   __x, long double   *__iptr)    ; extern   long double         __modfl         (long double   __x, long double   *__iptr)      ;


 

 
extern   long double          powl         (long double   __x, long double   __y)    ; extern   long double         __powl         (long double   __x, long double   __y)      ;

 
extern   long double          sqrtl         (long double   __x)    ; extern   long double         __sqrtl         (long double   __x)      ;


 
extern   long double          cbrtl         (long double   __x)    ; extern   long double         __cbrtl         (long double   __x)      ;



 

 
extern   long double          ceill         (long double   __x)    ; extern   long double         __ceill         (long double   __x)      ;

 
extern   long double          fabsl         (long double   __x)    ; extern   long double         __fabsl         (long double   __x)      ;

 
extern   long double          floorl         (long double   __x)    ; extern   long double         __floorl         (long double   __x)      ;

 
extern   long double          fmodl         (long double   __x, long double   __y)    ; extern   long double         __fmodl         (long double   __x, long double   __y)      ;




 

extern   int       isinfl       (long double   __value)   ; extern   int       __isinfl       (long double   __value)    ;

 
extern   int       finitel       (long double   __value)   ; extern   int       __finitel       (long double   __value)    ;

 
extern   long double          copysignl         (long double   __x, long double   __y)    ; extern   long double         __copysignl         (long double   __x, long double   __y)      ;

 
extern   long double          scalbnl         (long double   __x, int __n)    ; extern   long double         __scalbnl         (long double   __x, int __n)      ;

 
extern   long double          dreml         (long double   __x, long double   __y)    ; extern   long double         __dreml         (long double   __x, long double   __y)      ;

 
extern   long double          significandl         (long double   __x)    ; extern   long double         __significandl         (long double   __x)      ;





 
extern   int       isnanl       (long double   __value)   ; extern   int       __isnanl       (long double   __value)    ;

 
extern   int       ilogbl       (long double   __x)   ; extern   int       __ilogbl       (long double   __x)    ;

 
extern   long double          hypotl         (long double   __x, long double   __y)    ; extern   long double         __hypotl         (long double   __x, long double   __y)      ;


 
extern   long double          erfl         (long double  )    ; extern   long double         __erfl         (long double  )      ;
extern   long double          erfcl         (long double  )    ; extern   long double         __erfcl         (long double  )      ;
extern   long double          gammal         (long double  )    ; extern   long double         __gammal         (long double  )      ;
extern   long double          j0l         (long double  )    ; extern   long double         __j0l         (long double  )      ;
extern   long double          j1l         (long double  )    ; extern   long double         __j1l         (long double  )      ;
extern   long double          jnl         (int, long double  )    ; extern   long double         __jnl         (int, long double  )      ;
extern   long double          lgammal         (long double  )    ; extern   long double         __lgammal         (long double  )      ;
extern   long double          y0l         (long double  )    ; extern   long double         __y0l         (long double  )      ;
extern   long double          y1l         (long double  )    ; extern   long double         __y1l         (long double  )      ;
extern   long double          ynl         (int, long double  )    ; extern   long double         __ynl         (int, long double  )      ;




 


extern   long double          gammal_r            (long double  , int *)    ; extern   long double         __gammal_r            (long double  , int *)      ;
extern   long double          lgammal_r            (long double  , int *)    ; extern   long double         __lgammal_r            (long double  , int *)      ;





 

extern   long double          rintl         (long double   __x)    ; extern   long double         __rintl         (long double   __x)      ;

 
extern   long double          scalbl         (long double   __x, long double   __n)    ; extern   long double         __scalbl         (long double   __x, long double   __n)      ;

 
extern   long double          nextafterl         (long double   __x, long double   __y)    ; extern   long double         __nextafterl         (long double   __x, long double   __y)      ;

 
extern   long double          remainderl         (long double   __x, long double   __y)    ; extern   long double         __remainderl         (long double   __x, long double   __y)      ;











 
extern int signgam;




 

typedef enum { _IEEE_ = -1, _SVID_, _XOPEN_, _POSIX_ } _LIB_VERSION_TYPE;

 


extern _LIB_VERSION_TYPE _LIB_VERSION;




 





struct exception

  {
    int type;
    char *name;
    double arg1;
    double arg2;
    double retval;
  };


extern int __matherr  (struct exception *)  ;
extern int matherr  (struct exception *)  ;




 







 

 


 

    


    


    


    


    


    


    


    


    


    


    



    


    


    


    


    


    


    


    


    



    


    


    



union __convert_long_double {
  unsigned __convert_long_double_i[4];
  long double __convert_long_double_d;
};


    


    


    


    


    


    









 
















 





 



 




 

















 








 






 

 
extern void __assert_fail  (__const char *__assertion,
				__const char *__file,
				unsigned int __line,
				__const char *__function)  
     __attribute__ ((__noreturn__));

 
extern void __assert_perror_fail  (int __errnum,
				       __const char *__file,
				       unsigned int __line,
				       __const char *__function)  
     __attribute__ ((__noreturn__));

 





 









 

















 










 


 





















typedef int __sig_atomic_t;

 


typedef struct
  {
    unsigned long int __val[(1024 / (8 * sizeof (unsigned long int))) ];
  } __sigset_t;




 












 


 









 


extern int __sigismember (__const __sigset_t *, int);
extern int __sigaddset (__sigset_t *, int);
extern int __sigdelset (__sigset_t *, int);



extern __inline  int	 __sigismember  (  __const  __sigset_t *__set, int __sig)	{	unsigned long int __mask = (((unsigned long) 1) << ((( __sig ) - 1) % (8 * sizeof (unsigned long int)))) ;	unsigned long int __word = ((( __sig ) - 1) / (8 * sizeof (unsigned long int))) ;	return   (__set->__val[__word] & __mask) ? 1 : 0 ;	} 
extern __inline  int	 __sigaddset  (    __sigset_t *__set, int __sig)	{	unsigned long int __mask = (((unsigned long) 1) << ((( __sig ) - 1) % (8 * sizeof (unsigned long int)))) ;	unsigned long int __word = ((( __sig ) - 1) / (8 * sizeof (unsigned long int))) ;	return   ((__set->__val[__word] |= __mask), 0) ;	} 
extern __inline  int	 __sigdelset  (    __sigset_t *__set, int __sig)	{	unsigned long int __mask = (((unsigned long) 1) << ((( __sig ) - 1) % (8 * sizeof (unsigned long int)))) ;	unsigned long int __word = ((( __sig ) - 1) / (8 * sizeof (unsigned long int))) ;	return   ((__set->__val[__word] &= ~__mask), 0) ;	} 








 

typedef __sig_atomic_t sig_atomic_t;





 




















 





 








































 
typedef void (*__sighandler_t)  (int)  ;

 


extern __sighandler_t signal  (int __sig, __sighandler_t __handler)  ;

 


extern __sighandler_t __sysv_signal  (int __sig,
					  __sighandler_t __handler)  ;





 


extern int __kill  (__pid_t __pid, int __sig)  ;

extern int kill  (__pid_t __pid, int __sig)  ;



 


extern int killpg  (__pid_t __pgrp, int __sig)  ;


 
extern int raise  (int __sig)  ;


 
extern __sighandler_t ssignal  (int __sig, __sighandler_t __handler)  ;
extern int gsignal  (int __sig)  ;



 
extern void psignal  (int __sig, __const char *__s)  ;



 
extern int __sigblock  (int __mask)  ;

 
extern int __sigsetmask  (int __mask)  ;


 




extern int __sigpause  (int __sig_or_mask, int __is_sig)  ;


 

extern int sigpause  (int __mask)  ;







extern int sigblock  (int __mask)  ;
extern int sigsetmask  (int __mask)  ;

 

extern int siggetmask  (void)  ;









 

typedef __sighandler_t sig_t;






typedef __sigset_t sigset_t;








 
extern int sigemptyset  (sigset_t *__set)  ;

 
extern int sigfillset  (sigset_t *__set)  ;

 
extern int sigaddset  (sigset_t *__set, int __signo)  ;

 
extern int sigdelset  (sigset_t *__set, int __signo)  ;

 
extern int sigismember  (__const sigset_t *__set, int __signo)  ;



 

 


















 
struct sigaction
  {
     
    __sighandler_t sa_handler;

     
    __sigset_t sa_mask;

     
    int sa_flags;

     
    void (*sa_restorer)  (void)  ;
  };

 








 




 





 
extern int __sigprocmask  (int __how,
			       __const sigset_t *__set, sigset_t *__oset)  ;
extern int sigprocmask  (int __how,
			     __const sigset_t *__set, sigset_t *__oset)  ;

 

extern int __sigsuspend  (__const sigset_t *__set)  ;
extern int sigsuspend  (__const sigset_t *__set)  ;

 
extern int __sigaction  (int __sig, __const struct sigaction *__act,
			     struct sigaction *__oact)  ;
extern int sigaction  (int __sig, __const struct sigaction *__act,
			   struct sigaction *__oact)  ;

 
extern int sigpending  (sigset_t *__set)  ;


 
extern int __sigwait  (__const sigset_t *__set, int *__sig)  ;
extern int sigwait  (__const sigset_t *__set, int *__sig)  ;







 

extern __const char *__const _sys_siglist[32 ];
extern __const char *__const sys_siglist[32 ];

 
struct sigvec
  {
    __sighandler_t sv_handler;	 
    int sv_mask;		 

    int sv_flags;		 

  };

 





 




extern int __sigvec  (int __sig, __const struct sigvec *__vec,
			  struct sigvec *__ovec)  ;
extern int sigvec  (int __sig, __const struct sigvec *__vec,
			struct sigvec *__ovec)  ;


 
 




















 






 







struct _fpreg {
	unsigned short significand[4];
	unsigned short exponent;
};

struct _fpstate {
	unsigned long 	cw,
			sw,
			tag,
			ipoff,
			cssel,
			dataoff,
			datasel;
	struct _fpreg	_st[8];
	unsigned long	status;
};

struct sigcontext  {
	unsigned short gs, __gsh;
	unsigned short fs, __fsh;
	unsigned short es, __esh;
	unsigned short ds, __dsh;
	unsigned long edi;
	unsigned long esi;
	unsigned long ebp;
	unsigned long esp;
	unsigned long ebx;
	unsigned long edx;
	unsigned long ecx;
	unsigned long eax;
	unsigned long trapno;
	unsigned long err;
	unsigned long eip;
	unsigned short cs, __csh;
	unsigned long eflags;
	unsigned long esp_at_signal;
	unsigned short ss, __ssh;
	struct _fpstate * fpstate;
	unsigned long oldmask;
	unsigned long cr2;
};








 
extern int __sigreturn  (struct sigcontext *__scp)  ;
extern int sigreturn  (struct sigcontext *__scp)  ;












 





 


 



 




 



 









 





 

 



 

 







 




 



 





 












 


extern int siginterrupt  (int __sig, int __interrupt)  ;


 
struct sigstack
  {
    void *  ss_sp;		 
    int ss_onstack;		 
  };

 

extern int sigstack  (__const struct sigstack *__ss,
			  struct sigstack *__oss)  ;

 
struct sigaltstack
  {
    void *  ss_sp;
    size_t ss_size;
    int ss_flags;
  };

extern int sigaltstack  (__const struct sigaltstack *__ss,
			     struct sigaltstack *__oss)  ;



 




 
















































































 





 







 







 



 

 



 


 



 
extern int verbose;



 
void
fatal_hook(void (*hook_fn)(FILE *stream));	 


 


void
_fatal(char *file, char *func, int line, char *fmt, ...)
__attribute__ ((noreturn));



 


void
_panic(char *file, char *func, int line, char *fmt, ...)
__attribute__ ((noreturn));



 


void
_warn(char *file, char *func, int line, char *fmt, ...);



 


void
_info(char *file, char *func, int line, char *fmt, ...);










 

char *				 
mystrdup(char *s);		 

 

int				 
mystricmp(char *s1, char *s2);	 

 

void *getcore(int nbytes);

 
int log_base2(int n);

 
char *elapsed_time(long sec);

 




unsigned int
extractl(int word,		 
         int pos,		 
         int num);		 



 













































































 




 


 
typedef double SS_DOUBLE_TYPE;
typedef float SS_FLOAT_TYPE;
typedef int SS_WORD_TYPE;
typedef short SS_HALF_TYPE;
typedef char SS_BYTE_TYPE;
typedef SS_WORD_TYPE SS_PTR_TYPE;

 

typedef long long SS_COUNTER_TYPE;
typedef long long SS_TIME_TYPE;


 
typedef unsigned int SS_ADDR_TYPE;
typedef struct {
  unsigned int a;		 
  unsigned int b;		 
} SS_INST_TYPE;


 




 


 


 




 


 


 


 


 










 






 
extern int ss_fore_tab[8][5];
extern int ss_aft_tab[8][5];

 





 




 


 




 


 


 


 


 


 


 




 




 
extern unsigned int ss_lr_masks[];

 
extern SS_ADDR_TYPE ss_lr_temp;

 
extern SS_ADDR_TYPE temp_bs, temp_rd;

 


 


 







 


 


 


 


 


 




 






 


















 
extern SS_INST_TYPE SS_NOP_INST;

 
enum ss_opcode {
  OP_NA = 0,	 



 








































































 







































































































































 
 NOP , 

 



 JUMP , 
 JAL , 
 JR , 
 JALR , 
 BEQ , 
 BNE , 
 BLEZ , 
 BGTZ , 
 BLTZ , 
 BGEZ , 
 BC1F , 
 BC1T , 

 








 LB , 
 LBU , 
 LH , 
 LHU , 
 LW , 
 DLW , 
 L_S , 
 L_D , 
 LWL , 
 LWR , 

 SB , 
 SH , 
 SW , 
 DSW , 
 DSZ , 
 S_S , 
 S_D , 
 SWL , 
 SWR , 

 

 LB_RR , 
 LBU_RR , 
 LH_RR , 
 LHU_RR , 
 LW_RR , 
 DLW_RR , 
 L_S_RR , 
 
 L_D_RR , 

 SB_RR , 
 SH_RR , 
 SW_RR , 
 DSW_RR , 
 DSZ_RR , 
 S_S_RR , 
 S_D_RR , 


 
 
 L_S_RR_R2 , 
 
 
 S_S_RR_R2 , 
 
 LW_RR_R2 , 
 
 SW_RR_R2 , 


 



 ADD , 
 ADDI , 
 ADDU , 
 ADDIU , 

 SUB , 
 SUBU , 

 MULT , 
 MULTU , 
 DIV , 
 DIVU , 

 MFHI , 
 MTHI , 
 MFLO , 
 MTLO , 

 
 AND_ , 
 ANDI , 
 OR , 
 ORI , 
 XOR , 
 XORI , 
 NOR , 

 SLL , 
 SLLV , 
 SRL , 
 SRLV , 
 SRA , 
 SRAV , 

 SLT , 
 SLTI , 
 SLTU , 
 SLTIU , 


 



 FADD_S , 
 FADD_D , 
 FSUB_S , 
 FSUB_D , 
 FMUL_S , 
 FMUL_D , 
 FDIV_S , 
 FDIV_D , 
 FABS_S , 
 FABS_D , 
 FMOV_S , 
 FMOV_D , 
 FNEG_S , 
 FNEG_D , 

 CVT_S_D , 
 CVT_S_W , 
 CVT_D_S , 
 CVT_D_W , 
 CVT_W_S , 
 CVT_W_D , 

 C_EQ_S , 
 C_EQ_D , 
 C_LT_S , 
 C_LT_D , 
 C_LE_S , 
 C_LE_D , 

 FSQRT_S , 
 FSQRT_D , 


 



 SYSCALL , 
 BREAK , 
 LUI , 

 MFC1 , 
 DMFC1 , 
 CFC1 , 
 MTC1 , 
 DMTC1 , 
 CTC1 , 







  OP_MAX	 
};

 
enum ss_fu_class {
  FUClass_NA = 0,	 
  IntALU,		 
  IntMULT,		 
  IntDIV,		 
  FloatADD,		 
  FloatCMP,		 
  FloatCVT,		 
  FloatMULT,		 
  FloatDIV,		 
  FloatSQRT,		 
  RdPort,		 
  WrPort,		 
  NUM_FU_CLASSES	 
};

 



 

extern enum ss_opcode ss_mask2op[];

 

extern char *ss_op2name[];

 

extern char *ss_op2format[];

 

extern enum ss_fu_class ss_op2fu[];

 

extern unsigned int ss_op2flags[];

 

extern char *ss_fu2name[];

 
void ss_init_decoder(void);

 
void
ss_print_insn(SS_INST_TYPE inst,	 
	      SS_ADDR_TYPE pc,		 
	      FILE *stream);		 



 







































































 








































 
extern SS_WORD_TYPE regs_R[32 ];

 
union regs_FP {
    SS_WORD_TYPE l[32 ];		 
    SS_FLOAT_TYPE f[32 ];		 
    SS_DOUBLE_TYPE d[32 /2];		 
};

 
extern union regs_FP regs_F;

 
extern SS_WORD_TYPE regs_HI;

 
extern SS_WORD_TYPE regs_LO;

 
extern int regs_FCC;

 
extern SS_ADDR_TYPE regs_PC;

 
void regs_init(void);

 
void
regs_dump(FILE *stream);	 



 











































































 






































































 





 
enum endian_t { endian_big, endian_little, endian_unknown};
 
enum endian_t
endian_host_byte_order(void);

 
enum endian_t
endian_host_word_order(void);



 

enum endian_t
endian_target_byte_order(void);

 

enum endian_t
endian_target_word_order(void);





 






























































 










 
enum opt_class_t {
  oc_int = 0,		 
  oc_uint,		 
  oc_float,		 
  oc_double,		 
  oc_enum,		 
  oc_flag,		 
  oc_string,		 
  oc_NUM
};

 
struct opt_opt_t {
  struct opt_opt_t *next;	 
  char *name;			 
  char *desc;			 
  int nvars;			 
  int *nelt;			 
  char *format;			 
  int print;			 
  int accrue;			 
  enum opt_class_t oc;		 
  union opt_variant_t {
     
    struct opt_for_int_t {
      int *var;			 
    } for_int;
     
    struct opt_for_uint_t {
      unsigned int *var;	 
    } for_uint;
     
    struct opt_for_float_t {
      float *var;		 
    } for_float;
     
    struct opt_for_double_t {
      double *var;		 
    } for_double;
     
    struct opt_for_enum_t {
      int *var;			 
      char **emap;		 
      int *eval;		 
      int emap_sz;		 
    } for_enum;
     
    struct opt_for_string_t {
      char **var;		 
    } for_string;
  } variant;
};

 

typedef int
(*orphan_fn_t)(int i,		 
	       int argc,	 
	       char **argv);	 

 

struct opt_note_t {
  struct opt_note_t *next;	 
  char *note;			 
};

 
struct opt_odb_t {
  struct opt_opt_t *options;	 
  orphan_fn_t orphan_fn;	 
  char *header;			 
  struct opt_note_t *notes;	 
};

 
struct opt_odb_t *
opt_new(orphan_fn_t orphan_fn);		 

 
void
opt_delete(struct opt_odb_t *odb);	 

 
void
opt_reg_int(struct opt_odb_t *odb,	 
	    char *name,			 
	    char *desc,			 
	    int *var,			 
	    int def_val,		 
	    int print,			 
	    char *format);		 

 
void
opt_reg_int_list(struct opt_odb_t *odb,	 
		 char *name,		 
		 char *desc,		 
		 int *vars,		 
		 int nvars,		 
		 int *nelt,		 
		 int *def_val,		 
		 int print,		 
		 char *format,		 
		 int accrue);		 

 
void
opt_reg_uint(struct opt_odb_t *odb,	 
	     char *name,		 
	     char *desc,		 
	     unsigned int *var,		 
	     unsigned int def_val,	 
	     int print,			 
	     char *format);		 

 
void
opt_reg_uint_list(struct opt_odb_t *odb, 
		  char *name,		 
		  char *desc,		 
		  unsigned int *vars,	 
		  int nvars,		 
		  int *nelt,		 
		  unsigned int *def_val, 
		  int print,		 
		  char *format,		 
		  int accrue);		 

 
void
opt_reg_float(struct opt_odb_t *odb,	 
	      char *name,		 
	      char *desc,		 
	      float *var,		 
	      float def_val,		 
	      int print,		 
	      char *format);		 

 
void
opt_reg_float_list(struct opt_odb_t *odb, 
		   char *name,		 
		   char *desc,		 
		   float *vars,		 
		   int nvars,		 
		   int *nelt,		 
		   float *def_val,	 
		   int print,		 
		   char *format,	 
		   int accrue);		 

 
void
opt_reg_double(struct opt_odb_t *odb,	 
	       char *name,		 
	       char *desc,		 
	       double *var,		 
	       double def_val,		 
	       int print,		 
	       char *format);		 

 
void
opt_reg_double_list(struct opt_odb_t *odb, 
		    char *name,		 
		    char *desc,		 
		    double *vars,	 
		    int nvars,		 
		    int *nelt,		 
		    double *def_val,	 
		    int print,		 
		    char *format,	 
		    int accrue);	 

 


void
opt_reg_enum(struct opt_odb_t *odb,	 
	     char *name,		 
	     char *desc,		 
	     int *var,			 
	     char *def_val,		 
	     char **emap,		 
	     int *eval,			 
	     int emap_sz,		 
	     int print,			 
	     char *format);		 

 


void
opt_reg_enum_list(struct opt_odb_t *odb, 
		  char *name,		 
		  char *desc,		 
		  int *vars,		 
		  int nvars,		 
		  int *nelt,		 
		  char *def_val,	 
		  char **emap,		 
		  int *eval,		 
		  int emap_sz,		 
		  int print,		 
		  char *format,		 
		  int accrue);		 

 
void
opt_reg_flag(struct opt_odb_t *odb,	 
	     char *name,		 
	     char *desc,		 
	     int *var,			 
	     int def_val,		 
	     int print,			 
	     char *format);		 

 
void
opt_reg_flag_list(struct opt_odb_t *odb, 
		  char *name,		 
		  char *desc,		 
		  int *vars,		 
		  int nvars,		 
		  int *nelt,		 
		  int *def_val,		 
		  int print,		 
		  char *format,		 
		  int accrue);		 

 
void
opt_reg_string(struct opt_odb_t *odb,	 
	       char *name,		 
	       char *desc,		 
	       char **var,		 
	       char *def_val,		 
	       int print,		 
	       char *format);		 

 
void
opt_reg_string_list(struct opt_odb_t *odb, 
		    char *name,		 
		    char *desc,		 
		    char **vars,	 
		    int nvars,		 
		    int *nelt,		 
		    char **def_val,	 
		    int print,		 
		    char *format,	 
		    int accrue);	 

 
void
opt_process_options(struct opt_odb_t *odb,	 
		    int argc,			 
		    char **argv);		 

 
void
opt_print_option(struct opt_opt_t *opt,	 
		 FILE *fd);		 

 
void
opt_print_options(struct opt_odb_t *odb, 
		  FILE *fd,		 
		  int terse,		 
		  int notes);		 

 
void
opt_print_help(struct opt_odb_t *odb,	 
	       FILE *fd);		 

 
struct opt_opt_t *
opt_find_option(struct opt_odb_t *odb,	 
		char *opt_name);	 

 
void
opt_reg_header(struct opt_odb_t *odb,	 
	       char *header);		 

 
void
opt_reg_note(struct opt_odb_t *odb,	 
	     char *note);		 



 































































 
































































 
struct eval_state_t;
struct eval_value_t;

 


typedef struct eval_value_t		   
(*eval_ident_t)(struct eval_state_t *es);  

 
enum eval_token_t {
  tok_ident,		 
  tok_const,		 
  tok_plus,		 
  tok_minus,		 
  tok_mult,		 
  tok_div,		 
  tok_oparen,		 
  tok_cparen,		 
  tok_eof,		 
  tok_whitespace,	 
  tok_invalid		 
};

 
struct eval_state_t {
  char *p;			 
  char *lastp;			 
  eval_ident_t f_eval_ident;	 
  void *user_ptr;		 
  char tok_buf[512];		 
  enum eval_token_t peek_tok;	 
};

 
enum eval_err_t {
  ERR_NOERR,			 
  ERR_UPAREN,			 
  ERR_NOTERM,			 
  ERR_DIV0,			 
  ERR_BADCONST,			 
  ERR_BADEXPR,			 
  ERR_UNDEFVAR,			 
  ERR_EXTRA,			 
  ERR_NUM
};

 
extern enum eval_err_t eval_error  ;

 
extern char *eval_err_str[ERR_NUM];

 
enum eval_type_t {
  et_int,			 
  et_uint,			 
  et_float,			 
  et_double,			 
  et_symbol,			 
  et_NUM
};

 
extern char *eval_type_str[et_NUM];

 
struct eval_value_t {
  enum eval_type_t type;		 
  union {
    int as_int;				 
    unsigned int as_uint;		 
    float as_float;			 
    double as_double;			 
    char *as_symbol;			 
  } value;
};

 



 
double eval_as_double(struct eval_value_t val);

 
float eval_as_float(struct eval_value_t val);

 
unsigned int eval_as_uint(struct eval_value_t val);

 
int eval_as_int(struct eval_value_t val);

 
struct eval_state_t *			 
eval_new(eval_ident_t f_eval_ident,	 
	 void *user_ptr);		 

 
void
eval_delete(struct eval_state_t *es);	 

 

struct eval_value_t			 
eval_expr(struct eval_state_t *es,	 
	  char *p,			 
	  char **endp);			 

 
void
eval_print(FILE *stream,		 
	   struct eval_value_t val);	 




 










 
enum stat_class_t {
  sc_int = 0,			 
  sc_uint,			 

  sc_llong,			 

  sc_float,			 
  sc_double,			 
  sc_dist,			 
  sc_sdist,			 
  sc_formula,			 
  sc_NUM
};

 





 



 
struct bucket_t {
  struct bucket_t *next;	 
  unsigned int index;		 
  unsigned int count;		 
};

 
struct stat_stat_t;

 





 


typedef void
(*print_fn_t)(struct stat_stat_t *stat,	 
	      unsigned int index,	 
	      int count,		 
	      double sum,		 
	      double total);		 

 
struct stat_stat_t {
  struct stat_stat_t *next;	 
  char *name;			 
  char *desc;			 
  char *format;			 
  enum stat_class_t sc;		 
  union stat_variant_t {
     
    struct stat_for_int_t {
      int *var;			 
      int init_val;		 
    } for_int;
     
    struct stat_for_uint_t {
      unsigned int *var;	 
      unsigned int init_val;	 
    } for_uint;

     
    struct stat_for_llong_t {
      long long *var;		 
      long long init_val;	 
    } for_llong;

     
    struct stat_for_float_t {
      float *var;		 
      float init_val;		 
    } for_float;
     
    struct stat_for_double_t {
      double *var;		 
      double init_val;		 
    } for_double;
     
    struct stat_for_dist_t {
      unsigned int init_val;	 
      unsigned int *arr;	 
      unsigned int arr_sz;	 
      unsigned int bucket_sz;	 
      int pf;			 
      char **imap;		 
      print_fn_t print_fn;	 
      unsigned int overflows;	 
    } for_dist;
     
    struct stat_for_sdist_t {
      unsigned int init_val;	 
      struct bucket_t **sarr;	 
      int pf;			 
      print_fn_t print_fn;	 
    } for_sdist;
     
    struct stat_for_formula_t {
      char *formula;		 
    } for_formula;
  } variant;
};

 
struct stat_sdb_t {
  struct stat_stat_t *stats;		 
  struct eval_state_t *evaluator;	 
};

 
struct eval_value_t
stat_eval_ident(struct eval_state_t *es); 

 
struct stat_sdb_t *stat_new(void);

 
void
stat_delete(struct stat_sdb_t *sdb);	 

 
struct stat_stat_t *
stat_reg_int(struct stat_sdb_t *sdb,	 
	     char *name,		 
	     char *desc,		 
	     int *var,			 
	     int init_val,		 
	     char *format);		 

 
struct stat_stat_t *
stat_reg_uint(struct stat_sdb_t *sdb,	 
	      char *name,		 
	      char *desc,		 
	      unsigned int *var,	 
	      unsigned int init_val,	 
	      char *format);		 


 
struct stat_stat_t *
stat_reg_llong(struct stat_sdb_t *sdb,	 
	       char *name,		 
	       char *desc,		 
	       long long *var,		 
	       long long init_val,	 
	       char *format);		 


 




 
struct stat_stat_t *
stat_reg_float(struct stat_sdb_t *sdb,	 
	       char *name,		 
	       char *desc,		 
	       float *var,		 
	       float init_val,		 
	       char *format);		 

 
struct stat_stat_t *
stat_reg_double(struct stat_sdb_t *sdb,	 
		char *name,		 
		char *desc,		 
		double *var,		 
		double init_val,	 
		char *format);		 

 





struct stat_stat_t *
stat_reg_dist(struct stat_sdb_t *sdb,	 
	      char *name,		 
	      char *desc,		 
	      unsigned int init_val,	 
	      unsigned int arr_sz,	 
	      unsigned int bucket_sz,	 
	      int pf,			 
	      char *format,		 
	      char **imap,		 
	      print_fn_t print_fn);	 

 






struct stat_stat_t *
stat_reg_sdist(struct stat_sdb_t *sdb,	 
	       char *name,		 
	       char *desc,		 
	       unsigned int init_val,	 
	       int pf,			 
	       char *format,		 
	       print_fn_t print_fn);	 

 
void
stat_add_samples(struct stat_stat_t *stat, 
		 unsigned int index,	 
		 int nsamples);		 

 
void
stat_add_sample(struct stat_stat_t *stat, 
		unsigned int index);	 

 






struct stat_stat_t *
stat_reg_formula(struct stat_sdb_t *sdb, 
		 char *name,		 
		 char *desc,		 
		 char *formula,		 
		 char *format);		 

 
void
stat_print_stat(struct stat_sdb_t *sdb,	 
		struct stat_stat_t *stat, 
		FILE *fd);		 

 
void
stat_print_stats(struct stat_sdb_t *sdb, 
		 FILE *fd);		 


 
struct stat_stat_t *
stat_find_stat(struct stat_sdb_t *sdb,	 
	       char *stat_name);	 
	       




 
enum mem_cmd {
  Read,			 
  Write			 
};

 

typedef void
(*mem_access_fn)(enum mem_cmd cmd,	 
		 unsigned int addr,	 
		 void *p,		 
		 int nbytes);		 


 




















































 
extern SS_ADDR_TYPE mem_brk_point;

 
extern SS_ADDR_TYPE mem_stack_min;

 



 



 
extern char *mem_table[0x8000 ];


 


 



 



 



 




 











 












 
char *					 
mem_valid(enum mem_cmd cmd,		 
	  SS_ADDR_TYPE addr,		 
	  int nbytes,			 
	  int declare);			 

 


void
mem_access(enum mem_cmd cmd,		 
	   SS_ADDR_TYPE addr,		 
	   void *vp,			 
	   int nbytes);			 

 
char *mem_newblock(void);

 

int
mem_strcpy(mem_access_fn mem_fn,	 
	   enum mem_cmd cmd,		 
	   SS_ADDR_TYPE addr,		 
	   char *s);			 

 
void
mem_bcopy(mem_access_fn mem_fn,		 
	  enum mem_cmd cmd,		 
	  SS_ADDR_TYPE addr,		 
	  void *vp,			 
	  int nbytes);			 

 

void
mem_bcopy4(mem_access_fn mem_fn,	 
	   enum mem_cmd cmd,		 
	   SS_ADDR_TYPE addr,		 
	   void *vp,			 
	   int nbytes);			 

 
void
mem_bzero(mem_access_fn mem_fn,		 
	  SS_ADDR_TYPE addr,		 
	  int nbytes);			 

 
void
mem_reg_options(struct opt_odb_t *odb);	 

 
void
mem_check_options(struct opt_odb_t *odb, 
		  int argc, char **argv); 

 
void
mem_reg_stats(struct stat_sdb_t *sdb);	 

 
void mem_init(void);			 
void mem_init1(void);			 

 
void mem_aux_config(FILE *stream);	 

 
void mem_aux_stats(FILE *stream);	 

 
void
mem_dump(mem_access_fn mem_fn,		 
	 SS_ADDR_TYPE addr,		 
	 int len,			 
	 FILE *stream);			 



 












































































 

































 



 
enum cache_policy {
  LRU,		 
  Random,	 
  FIFO		 
};

 



 
struct cache_blk
{
  struct cache_blk *way_next;	 

  struct cache_blk *way_prev;	 
  struct cache_blk *hash_next;	 

   

  SS_ADDR_TYPE tag;		 
  unsigned int status;		 
  SS_TIME_TYPE ready;		 

  char *user_data;		 

   
  char data[1];			 

};

 
struct cache_set
{
  struct cache_blk **hash;	 

  struct cache_blk *way_head;	 
  struct cache_blk *way_tail;	 
  struct cache_blk *blks;	 


};

 
struct cache
{
   
  char *name;			 
  int nsets;			 
  int bsize;			 
  int balloc;			 
  int usize;			 
  int assoc;			 
  enum cache_policy policy;	 
  unsigned int hit_latency;	 

   








  unsigned int					 
    (*blk_access_fn)(enum mem_cmd cmd,		 
		     SS_ADDR_TYPE baddr,	 
		     int bsize,			 
		     struct cache_blk *blk,	 
		     SS_TIME_TYPE now);		 

   
  int hsize;			 
  SS_ADDR_TYPE blk_mask;
  int set_shift;
  SS_ADDR_TYPE set_mask;	 
  int tag_shift;
  SS_ADDR_TYPE tag_mask;	 
  SS_ADDR_TYPE tagset_mask;	 

   
  SS_TIME_TYPE bus_free;	 








   
  SS_COUNTER_TYPE hits;		 
  SS_COUNTER_TYPE misses;	 
  SS_COUNTER_TYPE replacements;	 
  SS_COUNTER_TYPE writebacks;	 
  SS_COUNTER_TYPE invalidations;  

   
  SS_ADDR_TYPE last_tagset;	 
  struct cache_blk *last_blk;	 

   
  char *data;			 
  struct cache_set sets[1];	 
};

 
struct cache *				 
cache_create(char *name,		 
	     int nsets,			 
	     int bsize,			 
	     int balloc,		 
	     int usize,			 
	     int assoc,			 
	     enum cache_policy policy,	 
	      
	     unsigned int (*blk_access_fn)(enum mem_cmd cmd,
					    SS_ADDR_TYPE baddr, int bsize,
					    struct cache_blk *blk,
					    SS_TIME_TYPE now),
	     unsigned int hit_latency); 

 
enum cache_policy			 
cache_char2policy(char c);		 

 
void
cache_config(struct cache *cp,		 
	     FILE *stream);		 

 
void
cache_reg_stats(struct cache *cp,	 
		struct stat_sdb_t *sdb); 

 
void
cache_stats(struct cache *cp,		 
	    FILE *stream);		 

 
void cache_stats(struct cache *cp, FILE *stream);

 




unsigned int				 
cache_access(struct cache *cp,		 
	     enum mem_cmd cmd,		 
	     SS_ADDR_TYPE addr,		 
	     void *vp,			 
	     int nbytes,		 
	     SS_TIME_TYPE now,		 
	     char **udata,		 
	     SS_ADDR_TYPE *repl_addr);	 

 








 


int					 
cache_probe(struct cache *cp,		 
	    SS_ADDR_TYPE addr);		 

 
unsigned int				 
cache_flush(struct cache *cp,		 
	    SS_TIME_TYPE now);		 

 

unsigned int				 
cache_flush_addr(struct cache *cp,	 
		 SS_ADDR_TYPE addr,	 
		 SS_TIME_TYPE now);	 



 















































































 
































 



 
extern SS_ADDR_TYPE ld_text_base;

 
extern unsigned int ld_text_size;

 
extern SS_ADDR_TYPE ld_data_base;

 
extern unsigned int ld_data_size;

 
extern SS_ADDR_TYPE ld_stack_base;

 
extern unsigned int ld_stack_size;

 
extern char *ld_prog_fname;

 
extern SS_ADDR_TYPE ld_prog_entry;

 
extern SS_ADDR_TYPE ld_environ_base;

 
extern int ld_target_big_endian;

 
void
ld_reg_stats(struct stat_sdb_t *sdb);	 

 

void
ld_load_prog(mem_access_fn mem_fn,	 
	     int argc, char **argv,	 
	     char **envp,		 
	     int zero_bss_segs);	 



 










































































 






















 

















 









 




 







 





 


 



 




 



 









 





 

 



 

 







 




 



 





 




















 

 
























 


 




 






 












 
typedef __clock_t clock_t;














 
struct tm
{
  int tm_sec;			 
  int tm_min;			 
  int tm_hour;			 
  int tm_mday;			 
  int tm_mon;			 
  int tm_year;			 
  int tm_wday;			 
  int tm_yday;			 
  int tm_isdst;			 


  long int tm_gmtoff;		 
  __const char *tm_zone;	 

};





 

extern clock_t clock  (void)  ;

 
extern time_t time  (time_t *__timer)  ;

 
extern double difftime  (time_t __time1, time_t __time0)  
     __attribute__ ((__const__));

 
extern time_t mktime  (struct tm *__tp)  ;

 


extern time_t __mktime_internal  (struct tm *__tp,
				      struct tm *(*__func) (const time_t *,
							    struct tm *),
				      time_t *__offset)  ;


 


extern size_t strftime  (char *__s, size_t __maxsize,
			     __const char *__format, __const struct tm *__tp)  ;




 

extern struct tm *gmtime  (__const time_t *__timer)  ;

 

extern struct tm *localtime  (__const time_t *__timer)  ;


 

extern struct tm *__gmtime_r  (__const time_t *__timer,
				   struct tm *__tp)  ;
extern struct tm *gmtime_r  (__const time_t *__timer,
				 struct tm *__tp)  ;

 

extern struct tm *__localtime_r  (__const time_t *__timer,
				      struct tm *__tp)  ;
extern struct tm *localtime_r  (__const time_t *__timer,
				    struct tm *__tp)  ;


 


extern void __offtime  (__const time_t *__timer,
			    long int __offset,
			    struct tm *__TP)  ;

 

extern char *asctime  (__const struct tm *__tp)  ;

 
extern char *ctime  (__const time_t *__timer)  ;


 

 

extern char *__asctime_r  (__const struct tm *__tp, char *__buf)  ;
extern char *asctime_r  (__const struct tm *__tp, char *__buf)  ;

 
extern char *ctime_r  (__const time_t *__timer, char *__buf)  ;



 
extern char *__tzname[2];	 
extern int __daylight;		 
extern long int __timezone;	 

 

extern void __tzset  (void)  ;


 
extern char *tzname[2];

 

extern long int __tzname_max  (void)  ;

extern void tzset  (void)  ;



extern int daylight;
extern long int timezone;



 

extern int stime  (__const time_t *__when)  ;



 





 


 
extern time_t timegm  (struct tm *__tp)  ;

 
extern time_t timelocal  (struct tm *__tp)  ;

 
extern int dysize  (int __year)  ;




 
extern int __nanosleep  (__const struct timespec *__requested_time,
			     struct timespec *__remaining)  ;
extern int nanosleep  (__const struct timespec *__requested_time,
			   struct timespec *__remaining)  ;



 








 






















 

struct timeval
  {
    time_t tv_sec;		 
    time_t tv_usec;		 
  };








 

 




 

struct timezone
  {
    int tz_minuteswest;		 
    int tz_dsttime;		 
  };

 




extern int __gettimeofday  (struct timeval *__tv,
				struct timezone *__tz)  ;
extern int gettimeofday  (struct timeval *__tv,
			      struct timezone *__tz)  ;

 

extern int __settimeofday  (__const struct timeval *__tv,
				__const struct timezone *__tz)  ;
extern int settimeofday  (__const struct timeval *__tv,
			      __const struct timezone *__tz)  ;

 



extern int __adjtime  (__const struct timeval *__delta,
			   struct timeval *__olddelta)  ;
extern int adjtime  (__const struct timeval *__delta,
			 struct timeval *__olddelta)  ;


 
enum __itimer_which
  {
     
    ITIMER_REAL = 0,

     
    ITIMER_VIRTUAL = 1,

     

    ITIMER_PROF = 2

  };

 

struct itimerval
  {
     
    struct timeval it_interval;
     
    struct timeval it_value;
  };

 

extern int __getitimer  (enum __itimer_which __which,
			     struct itimerval *__value)  ;
extern int getitimer  (enum __itimer_which __which,
			   struct itimerval *__value)  ;

 


extern int __setitimer  (enum __itimer_which __which,
			     __const struct itimerval *__new,
			     struct itimerval *__old)  ;
extern int setitimer  (enum __itimer_which __which,
			   __const struct itimerval *__new,
			   struct itimerval *__old)  ;

 

extern int __utimes  (__const char *__file, struct timeval __tvp[2])  ;
extern int utimes  (__const char *__file, struct timeval __tvp[2])  ;


 







 







 





















 











						 





						 




						 




						 

						 

						 
						 
						 
						 
						 
						 

						 
						 



						 



						 

						 
						 

						 
						 
						 

						 
						 


						 






						 



						 
						 








						 



























						 



						 







						 



						 












						 







                                                 







						 






 





 







 



 






































 















 



 





 

struct  ss_statbuf
{
        short           ss_st_dev;
        unsigned int   ss_st_ino;
        unsigned short  ss_st_mode;
        short         	ss_st_nlink;
        short           ss_st_uid;
        short           ss_st_gid;
        short           ss_st_rdev;
        int           	ss_st_size;
        int          	ss_st_atime;
        int             ss_st_spare1;
        int          	ss_st_mtime;
        int             ss_st_spare2;
        int          	ss_st_ctime;
        int             ss_st_spare3;
        int            ss_st_blksize;
        int            ss_st_blocks;
        unsigned int   ss_st_gennum;
        int            ss_st_spare4;
};

struct ss_timeval
{
  int ss_tv_sec;          
  int ss_tv_usec;         
};

 

struct ss_rusage
{
    struct ss_timeval ss_ru_utime;
    struct ss_timeval ss_ru_stime;
    int ss_ru_maxrss;
    int ss_ru_ixrss;
    int ss_ru_idrss;
    int ss_ru_isrss;
    int ss_ru_minflt;
    int ss_ru_majflt;
    int ss_ru_nswap;
    int ss_ru_inblock;
    int ss_ru_oublock;
    int ss_ru_msgsnd;
    int ss_ru_msgrcv;
    int ss_ru_nsignals;
    int ss_ru_nvcsw;
    int ss_ru_nivcsw;
};

struct ss_timezone
{
  int ss_tz_minuteswest;  
  int ss_tz_dsttime;      
};

struct ss_rlimit
{
  int ss_rlim_cur;                
  int ss_rlim_max;                
};

 












 


void
ss_syscall(mem_access_fn mem_fn,	 
	   SS_INST_TYPE inst);		 



 





































































 


































 
enum bpred_class {
  BPred2Level,			 
  BPred2bitBTB,			 
  BPredTaken,			 
  BPredNotTaken,		 
  BPred_NUM
};

 
struct bpred_btb_ent {
  SS_ADDR_TYPE addr;		 
  unsigned char state;		 
  SS_ADDR_TYPE target;		 
};

 
struct bpred {
  enum bpred_class class;	 
  union {
    struct {
      unsigned int size;	 
      struct bpred_btb_ent *sets; 
    } btb;
    struct {
      int l1size;		 
      int l2size;		 
      int shift_width;		 
      int *shiftregs;		 
      struct bpred_btb_ent *l2table; 
    } two;
  } data;

   
  SS_COUNTER_TYPE hits;		 
  SS_COUNTER_TYPE misses;	 
};

 
struct bpred *				 
bpred_create(enum bpred_class class,	 
	     unsigned int l1size,	 
	     unsigned int l2size,	 
	     unsigned int shift_width); 

 
void
bpred_config(struct bpred *pred,	 
	     FILE *stream);		 

 
void
bpred_stats(struct bpred *pred,		 
	    FILE *stream);		 

 
void
bpred_reg_stats(struct bpred *pred,	 
		struct stat_sdb_t *sdb); 

 



SS_ADDR_TYPE				 
bpred_lookup(struct bpred *pred,	 
	     SS_ADDR_TYPE baddr,	 
	     SS_ADDR_TYPE btarget,	 
	     struct bpred_btb_ent **update_ptr); 

 





void
bpred_update(struct bpred *pred,	 
	     SS_ADDR_TYPE baddr,	 
	     SS_ADDR_TYPE btarget,	 
	     int taken,			 
	     int correct,		 
	     struct bpred_btb_ent *update_ptr); 

 
void
bpred_dump(struct bpred *pred,		 
	   FILE *stream);		 



 



































































 


 


 
struct res_desc {
  char *name;				 
  int quantity;				 
  int busy;				 
  struct res_template {
    int class;				 


    int oplat;				 

    int issuelat;			 


    struct res_desc *master;		 
  } x[16 ];
};

 
struct res_pool {
  char *name;				 
  int num_resources;			 
  struct res_desc *resources;		 
   
  int nents[16 ];
  struct res_template *table[16 ][8 ];
};

 
struct res_pool *res_create_pool(char *name, struct res_desc *pool, int ndesc);

 





struct res_template *res_get(struct res_pool *pool, int class);

 
void res_dump(struct res_pool *pool, FILE *stream);



 

































































 




 



typedef unsigned int BITMAP_ENT_TYPE;
typedef unsigned int *BITMAP_PTR_TYPE;

 


 


 


 


 


 


 


 


 


 


 


 


 


 







 































































 

































































enum range_ptype_t {
  pt_addr = 0,			 
  pt_inst,			 
  pt_cycle,			 
  pt_NUM
};

 







struct range_pos_t {
  enum range_ptype_t ptype;	 
  SS_COUNTER_TYPE pos;		 
};

 
struct range_range_t {
  struct range_pos_t start;
  struct range_pos_t end;
};

 
char *						 
range_parse_pos(char *pstr,			 
		struct range_pos_t *pos);	 

 
void
range_print_pos(struct range_pos_t *pos,	 
		FILE *stream);			 

 
char *						 
range_parse_range(char *rstr,			 
		  struct range_range_t *range);	 

 
void
range_print_range(struct range_range_t *range,	 
		  FILE *stream);		 

 
int						 
range_cmp_pos(struct range_pos_t *pos,		 
	      SS_COUNTER_TYPE val);		 

 
int						 
range_cmp_range(struct range_range_t *range,	 
		SS_COUNTER_TYPE val);		 


 
int						 
range_cmp_range1(struct range_range_t *range,	 
		 SS_ADDR_TYPE addr,		 
		 SS_COUNTER_TYPE icount,	 
		 SS_COUNTER_TYPE cycle);	 


 










 









 






 






 






 
extern FILE *ptrace_outfd;

 
extern int ptrace_active;

 
extern struct range_range_t ptrace_range;

 
extern int ptrace_oneshot;

 
void
ptrace_open(char *range,		 
	    char *fname);		 

 
void
ptrace_close(void);

 



 








 
void
__ptrace_newinst(unsigned int iseq,	 
		 SS_INST_TYPE inst,	 
		 SS_ADDR_TYPE pc,	 
		 SS_ADDR_TYPE addr);	 

 
void
__ptrace_newuop(unsigned int iseq,	 
		char *uop_desc,		 
		SS_ADDR_TYPE pc,	 
		SS_ADDR_TYPE addr);	 

 
void
__ptrace_endinst(unsigned int iseq);	 

 
void
__ptrace_newcycle(SS_TIME_TYPE cycle);	 

 
void
__ptrace_newstage(unsigned int iseq,	 
		  char *pstage,		 
		  unsigned int pevents); 



 



























































 































































 
enum dlite_access_t {
  at_read,		 
  at_write,		 
  at_NUM
};

 

 
enum dlite_reg_t {
  rt_gpr,		 
  rt_lpr,		 
  rt_fpr,		 
  rt_dpr,		 
  rt_hi,		 
  rt_lo,		 
  rt_FCC,		 
  rt_PC,		 
  rt_NUM
};

 
union dlite_reg_val_t {
  SS_WORD_TYPE as_word;		 
  SS_FLOAT_TYPE as_float;	 
  SS_FLOAT_TYPE as_double;	 
  SS_ADDR_TYPE as_address;	 
  int as_condition;		 
};

 

typedef char *			  	    
(*dlite_reg_obj_t)(enum dlite_access_t at,  
		   enum dlite_reg_t rt,	    
		   int reg,		    
		   union dlite_reg_val_t *val);	 

 

typedef char *			  	    
(*dlite_mem_obj_t)(enum dlite_access_t at,  
		   SS_ADDR_TYPE addr,	    
		   char *p,		    
		   int nbytes);		    

 

typedef char *			  	    
(*dlite_mstate_obj_t)(FILE *stream,	    
		      char *cmd);	    

 
void
dlite_init(dlite_reg_obj_t reg_obj,		 
	   dlite_mem_obj_t mem_obj,		 
	   dlite_mstate_obj_t mstate_obj);	 

 



 
char *						 
dlite_reg_obj(enum dlite_access_t at,		 
	      enum dlite_reg_t rt,		 
	      int reg,				 
	      union dlite_reg_val_t *val);	 

 
char *						 
dlite_mem_obj(enum dlite_access_t at,		 
	      SS_ADDR_TYPE addr,		 
	      char *p,				 
	      int nbytes);			 

 
char *						 
dlite_mstate_obj(FILE *stream,			 
		 char *cmd);			 

 




 
extern SS_ADDR_TYPE dlite_fastbreak  ;

 
extern int dlite_active  ;

 
extern int dlite_check  ;

 
int						 
__check_break(SS_ADDR_TYPE next_PC,		 
	      int access,			 
	      SS_ADDR_TYPE addr,		 
	      SS_COUNTER_TYPE icount,		 
	      SS_COUNTER_TYPE cycle);		 

 


 
void
dlite_main(SS_ADDR_TYPE regs_PC,		 
	   SS_ADDR_TYPE next_PC,		 
	   SS_COUNTER_TYPE cycle);		 



 






































































 

















 








 

 
 











typedef int __jmp_buf[6];


 



 





















 








 
typedef struct __jmp_buf_tag	 
  {
     


    __jmp_buf __jmpbuf;		 
    int __mask_was_saved;	 
    __sigset_t __saved_mask;	 
  } jmp_buf[1];


 


extern int __sigsetjmp  (jmp_buf __env, int __savemask)  ;


 






 





 

extern void longjmp  (jmp_buf __env, int __val)  
     __attribute__ ((__noreturn__));

 


extern void _longjmp  (jmp_buf __env, int __val)  
     __attribute__ ((__noreturn__));


 
extern void __longjmp  (__jmp_buf __env, int __val)  
     __attribute__ ((__noreturn__));

 



extern int __sigjmp_save  (jmp_buf __env, int __savemask)  ;



 


typedef jmp_buf sigjmp_buf;

 



 



extern void siglongjmp  (sigjmp_buf __env, int __val)  
     __attribute__ ((__noreturn__));


 







 
extern int sim_dump_stats;

 
extern int sim_exit_now;

 
extern jmp_buf sim_exit_buf;

 
extern int sim_swap_bytes;
extern int sim_swap_words;

 
extern time_t sim_start_time;
extern time_t sim_end_time;
extern time_t sim_elapsed_time;

 
struct opt_odb_t *sim_odb;

 
struct stat_sdb_t *sim_sdb;

 



 
void sim_reg_options(struct opt_odb_t *odb);

 

 
void sim_check_options(struct opt_odb_t *odb, int argc, char **argv);

 
void sim_reg_stats(struct stat_sdb_t *sdb);

 
void sim_init(void);

 

 

 
void sim_aux_config(FILE *stream);

 
void sim_main(void);

 

 
void sim_aux_stats(FILE *stream);

 
void sim_uninit(void);

 
void
sim_print_stats(FILE *fd);		 




 







 



 
static unsigned int max_insts;

 
static int fastfwd_count;

 
static int ptrace_nelt = 0;
static char *ptrace_opts[2];

 
static int ruu_ifq_size;

 
static int ruu_branch_penalty;

 
static char *pred_type;

 
static int btb_size;

 
static int twolev_nelt = 3;
static int twolev_config[3] = {  1,  1024,  8 };

 
static int ruu_decode_width;

 
static int ruu_issue_width;

 
static int ruu_inorder_issue;

 
static int ruu_include_spec = 1 ;

 
static int ruu_commit_width;

 
static int RUU_size = 8;

 
static int LSQ_size = 4;

 
static char *cache_dl1_opt;

 
static int cache_dl1_lat;

 
static char *cache_dl2_opt;

 
static int cache_dl2_lat;

 
static char *cache_il1_opt;

 
static int cache_il1_lat;

 
static char *cache_il2_opt;

 
static int cache_il2_lat;

 
static int flush_on_syscalls;

 
static int compress_icache_addrs;

 
static int mem_nelt = 2;
static int mem_lat[2] =
  {  18,  2 };

 
static int mem_bus_width;

 
static char *itlb_opt;

 
static char *dtlb_opt;

 
static int tlb_miss_lat;

 
static int res_ialu;

 
static int res_imult;

 
static int res_memport;

 
static int res_fpalu;

 
static int res_fpmult;

 

static int pcstat_nelt = 0;
static char *pcstat_vars[8 ];

 
static int bugcompat_mode;

 



 






 
struct res_desc fu_config[] = {
  {
    "integer-ALU",
    4,
    0,
    {
      { IntALU, 1, 1 }
    }
  },
  {
    "integer-MULT/DIV",
    1,
    0,
    {
      { IntMULT, 3, 1 },
      { IntDIV, 20, 19 }
    }
  },
  {
    "memory-port",
    2,
    0,
    {
      { RdPort, 1, 1 },
      { WrPort, 1, 1 }
    }
  },
  {
    "FP-adder",
    4,
    0,
    {
      { FloatADD, 2, 1 },
      { FloatCMP, 2, 1 },
      { FloatCVT, 2, 1 }
    }
  },
  {
    "FP-MULT/DIV",
    1,
    0,
    {
      { FloatMULT, 4, 1 },
      { FloatDIV, 12, 12 },
      { FloatSQRT, 24, 24 }
    }
  },
};


 



 
static SS_COUNTER_TYPE sim_num_insn = 0;

 
static SS_COUNTER_TYPE sim_total_insn = 0;

 
static SS_COUNTER_TYPE sim_num_refs = 0;

 
static SS_COUNTER_TYPE sim_total_refs = 0;

 
static SS_COUNTER_TYPE sim_num_loads = 0;

 
static SS_COUNTER_TYPE sim_total_loads = 0;

 
static SS_COUNTER_TYPE sim_num_branches = 0;

 
static SS_COUNTER_TYPE sim_total_branches = 0;

 
static SS_TIME_TYPE sim_cycle = 0;


 



 
static unsigned int inst_seq = 0;

 
static unsigned int ptrace_seq = 0;

 



static int spec_mode = 0 ;

 
static unsigned ruu_fetch_issue_delay = 0;

 
static int pred_perfect = 0 ;

 
static struct cache *cache_il1;

 
static struct cache *cache_il2;

 
static struct cache *cache_dl1;

 
static struct cache *cache_dl2;

 
static struct cache *itlb;

 
static struct cache *dtlb;

 
static struct bpred *pred;

 
static struct res_pool *fu_pool = ((void *)0) ;

 
static struct stat_stat_t *pcstat_stats[8 ];
static SS_COUNTER_TYPE pcstat_lastvals[8 ];
static struct stat_stat_t *pcstat_sdists[8 ];

 



 
static unsigned int			 
mem_access_latency(int blk_sz)		 
{
  int chunks = (blk_sz + (mem_bus_width - 1)) / mem_bus_width;

  ((void) (( chunks > 0 ) ? 0 :	(__assert_fail ("chunks > 0" ,	"sim-outorder.c", 396, __PRETTY_FUNCTION__ ), 0))) ;

  return ( mem_lat[0] +
	  ( mem_lat[1] * (chunks - 1)));
}


 



 
static unsigned int			 
dl1_access_fn(enum mem_cmd cmd,		 
	      SS_ADDR_TYPE baddr,	 
	      int bsize,		 
	      struct cache_blk *blk,	 
	      SS_TIME_TYPE now)		 
{
  unsigned int lat;

  if (cache_dl2)
    {
       
      lat = cache_access(cache_dl2, cmd, baddr, ((void *)0) , bsize,
			  now,  ((void *)0) ,  ((void *)0) );
      if (cmd == Read)
	return lat;
      else
	{
	   
	  return 0;
	}
    }
  else
    {
       
      if (cmd == Read)
	return mem_access_latency(bsize);
      else
	{
	   
	  return 0;
	}
    }
}

 
static unsigned int			 
dl2_access_fn(enum mem_cmd cmd,		 
	      SS_ADDR_TYPE baddr,	 
	      int bsize,		 
	      struct cache_blk *blk,	 
	      SS_TIME_TYPE now)		 
{
   
  if (cmd == Read)
    return mem_access_latency(bsize);
  else
    {
       
      return 0;
    }
}

 
static unsigned int			 
il1_access_fn(enum mem_cmd cmd,		 
	      SS_ADDR_TYPE baddr,	 
	      int bsize,		 
	      struct cache_blk *blk,	 
	      SS_TIME_TYPE now)		 
{
  unsigned int lat;

if (cache_il2)
    {
       
      lat = cache_access(cache_il2, cmd, baddr, ((void *)0) , bsize,
			  now,  ((void *)0) ,  ((void *)0) );
      if (cmd == Read)
	return lat;
      else
	_panic("sim-outorder.c", __FUNCTION__, 479,  "writes to instruction memory not supported"  ) ;
    }
  else
    {
       
      if (cmd == Read)
	return mem_access_latency(bsize);
      else
	_panic("sim-outorder.c", __FUNCTION__, 487,  "writes to instruction memory not supported"  ) ;
    }
}

 
static unsigned int			 
il2_access_fn(enum mem_cmd cmd,		 
	      SS_ADDR_TYPE baddr,	 
	      int bsize,		 
	      struct cache_blk *blk,	 
	      SS_TIME_TYPE now)		 
{
   
  if (cmd == Read)
    return mem_access_latency(bsize);
  else
    _panic("sim-outorder.c", __FUNCTION__, 503,  "writes to instruction memory not supported"  ) ;
}


 



 
static unsigned int			 
itlb_access_fn(enum mem_cmd cmd,	 
	       SS_ADDR_TYPE baddr,	 
	       int bsize,		 
	       struct cache_blk *blk,	 
	       SS_TIME_TYPE now)	 
{
  SS_ADDR_TYPE *phy_page_ptr = (SS_ADDR_TYPE *)blk->user_data;

   
  ((void) (( phy_page_ptr ) ? 0 :	(__assert_fail ("phy_page_ptr" ,	"sim-outorder.c", 522, __PRETTY_FUNCTION__ ), 0))) ;

   
  *phy_page_ptr = 0;

   
  return tlb_miss_lat;
}

 
static unsigned int			 
dtlb_access_fn(enum mem_cmd cmd,	 
	       SS_ADDR_TYPE baddr,	 
	       int bsize,		 
	       struct cache_blk *blk,	 
	       SS_TIME_TYPE now)	 
{
  SS_ADDR_TYPE *phy_page_ptr = (SS_ADDR_TYPE *)blk->user_data;

   
  ((void) (( phy_page_ptr ) ? 0 :	(__assert_fail ("phy_page_ptr" ,	"sim-outorder.c", 542, __PRETTY_FUNCTION__ ), 0))) ;

   
  *phy_page_ptr = 0;

   
  return tlb_miss_lat;
}


 
void
sim_reg_options(struct opt_odb_t *odb)
{
  opt_reg_header(odb, 
"sim-outorder: This simulator implements a very detailed out-of-order issue\n"
"superscalar processor with a two-level memory system and speculative\n"
"execution support.  This simulator is a performance simulator, tracking the\n"
"latency of all pipeline operations.\n"
		 );

   

  opt_reg_string_list(odb, "-ptrace",
	      "generate pipetrace, i.e., <fname|stdout|stderr> <range>",
	      ptrace_opts,  2, &ptrace_nelt,  ((void *)0) ,
	       0 ,  ((void *)0) ,  0 );

  opt_reg_note(odb,
"  Pipetrace range arguments are formatted as follows:\n"
"\n"
"    {{@|#}<start>}:{{@|#|+}<end>}\n"
"\n"
"  Both ends of the range are optional, if neither are specified, the entire\n"
"  execution is traced.  Ranges that start with a `@' designate an address\n"
"  range to be traced, those that start with an `#' designate a cycle count\n"
"  range.  All other range values represent an instruction count range.  The\n"
"  second argument, if specified with a `+', indicates a value relative\n"
"  to the first argument, e.g., 1000:+100 == 1000:1100.  Program symbols may\n"
"  be used in all contexts.\n"
"\n"
"    Examples:   -ptrace FOO.trc #0:#1000\n"
"                -ptrace BAR.trc @2000:\n"
"                -ptrace BLAH.trc :1500\n"
"                -ptrace UXXE.trc :\n"
"                -ptrace FOOBAR.trc @main:+278\n"
	       );

   

  opt_reg_uint(odb, "-max:inst", "maximum number of inst's to execute",
               &max_insts,  0,
                1 ,  ((void *)0) );
  opt_reg_int(odb, "-fastfwd", "number of insts skipped before timing starts",
              &fastfwd_count,  0,
               1 ,  ((void *)0) );

   

  opt_reg_int(odb, "-fetch:ifqsize", "instruction fetch queue size (in insts)",
	      &ruu_ifq_size,  4,
	       1 ,  ((void *)0) );

  opt_reg_int(odb, "-fetch:mplat", "extra branch mis-prediction latency",
	      &ruu_branch_penalty,  3,
	       1 ,  ((void *)0) );

   

  opt_reg_string(odb, "-bpred",
		 "branch predictor type {nottaken|taken|perfect|bimod|2lev}",
		 &pred_type,  "bimod",
		  1 ,  ((void *)0) );

  opt_reg_int(odb, "-bpred:bimod", "bimodal predictor BTB size",
	      &btb_size,  2048,
	       1 ,  ((void *)0) );

  opt_reg_int_list(odb, "-bpred:2lev",
		   "2-level predictor config (<l1size> <l2size> <hist_size>)",
		   twolev_config, twolev_nelt, &twolev_nelt, twolev_config,
		    1 ,  ((void *)0) ,  0 );

   

  opt_reg_int(odb, "-decode:width",
	      "instruction decode B/W (insts/cycle)",
	      &ruu_decode_width,  4,
	       1 ,  ((void *)0) );

   

  opt_reg_int(odb, "-issue:width",
	      "instruction issue B/W (insts/cycle)",
	      &ruu_issue_width,  4,
	       1 ,  ((void *)0) );

  opt_reg_flag(odb, "-issue:inorder", "run pipeline with in-order issue",
	       &ruu_inorder_issue,  0 ,
	        1 ,  ((void *)0) );

  opt_reg_flag(odb, "-issue:wrongpath",
	       "issue instructions down wrong execution paths",
	       &ruu_include_spec,  1 ,
	        1 ,  ((void *)0) );

   

  opt_reg_int(odb, "-commit:width",
	      "instruction commit B/W (insts/cycle)",
	      &ruu_commit_width,  4,
	       1 ,  ((void *)0) );

   

  opt_reg_int(odb, "-ruu:size",
	      "register update unit (RUU) size",
	      &RUU_size,  16,
	       1 ,  ((void *)0) );

   

  opt_reg_int(odb, "-lsq:size",
	      "load/store queue (LSQ) size",
	      &LSQ_size,  8,
	       1 ,  ((void *)0) );

   

  opt_reg_string(odb, "-cache:dl1",
		 "l1 data cache config, i.e., {<config>|none}",
		 &cache_dl1_opt, "dl1:128:32:4:l",
		  1 , ((void *)0) );

  opt_reg_note(odb,
"  The cache config parameter <config> has the following format:\n"
"\n"
"    <name>:<nsets>:<bsize>:<assoc>:<repl>\n"
"\n"
"    <name>   - name of the cache being defined\n"
"    <nsets>  - number of sets in the cache\n"
"    <bsize>  - block size of the cache\n"
"    <assoc>  - associativity of the cache\n"
"    <repl>   - block replacement strategy, 'l'-LRU, 'f'-FIFO, 'r'-random\n"
"\n"
"    Examples:   -cache:dl1 dl1:4096:32:1:l\n"
"                -dtlb dtlb:128:4096:32:r\n"
	       );

  opt_reg_int(odb, "-cache:dl1lat",
	      "l1 data cache hit latency (in cycles)",
	      &cache_dl1_lat,  1,
	       1 ,  ((void *)0) );

  opt_reg_string(odb, "-cache:dl2",
		 "l2 data cache config, i.e., {<config>|none}",
		 &cache_dl2_opt, "ul2:1024:64:4:l",
		  1 , ((void *)0) );

  opt_reg_int(odb, "-cache:dl2lat",
	      "l2 data cache hit latency (in cycles)",
	      &cache_dl2_lat,  6,
	       1 ,  ((void *)0) );

  opt_reg_string(odb, "-cache:il1",
		 "l1 inst cache config, i.e., {<config>|dl1|dl2|none}",
		 &cache_il1_opt, "il1:512:32:1:l",
		  1 , ((void *)0) );

  opt_reg_note(odb,
"  Cache levels can be unified by pointing a level of the instruction cache\n"
"  hierarchy at the data cache hiearchy using the \"dl1\" and \"dl2\" cache\n"
"  configuration arguments.  Most sensible combinations are supported, e.g.,\n"
"\n"
"    A unified l2 cache (il2 is pointed at dl2):\n"
"      -cache:il1 il1:128:64:1:l -cache:il2 dl2\n"
"      -cache:dl1 dl1:256:32:1:l -cache:dl2 ul2:1024:64:2:l\n"
"\n"
"    Or, a fully unified cache hierarchy (il1 pointed at dl1):\n"
"      -cache:il1 dl1\n"
"      -cache:dl1 ul1:256:32:1:l -cache:dl2 ul2:1024:64:2:l\n"
	       );

  opt_reg_int(odb, "-cache:il1lat",
	      "l1 instruction cache hit latency (in cycles)",
	      &cache_il1_lat,  1,
	       1 ,  ((void *)0) );

  opt_reg_string(odb, "-cache:il2",
		 "l2 instruction cache config, i.e., {<config>|dl2|none}",
		 &cache_il2_opt, "dl2",
		  1 , ((void *)0) );

  opt_reg_int(odb, "-cache:il2lat",
	      "l2 instruction cache hit latency (in cycles)",
	      &cache_il2_lat,  6,
	       1 ,  ((void *)0) );

  opt_reg_flag(odb, "-cache:flush", "flush caches on system calls",
	       &flush_on_syscalls,  0 ,  1 , ((void *)0) );

  opt_reg_flag(odb, "-cache:icompress",
	       "convert 64-bit inst addresses to 32-bit inst equivalents",
	       &compress_icache_addrs,  0 ,
	        1 , ((void *)0) );

   
  opt_reg_int_list(odb, "-mem:lat",
		   "memory access latency (<first_chunk> <inter_chunk>)",
		   mem_lat, mem_nelt, &mem_nelt, mem_lat,
		    1 ,  ((void *)0) ,  0 );

  opt_reg_int(odb, "-mem:width", "memory access bus width (in bytes)",
	      &mem_bus_width,  8,
	       1 ,  ((void *)0) );

   

  opt_reg_string(odb, "-tlb:itlb",
		 "instruction TLB config, i.e., {<config>|none}",
		 &itlb_opt, "itlb:16:4096:4:l",  1 , ((void *)0) );

  opt_reg_string(odb, "-tlb:dtlb",
		 "data TLB config, i.e., {<config>|none}",
		 &dtlb_opt, "dtlb:32:4096:4:l",  1 , ((void *)0) );

  opt_reg_int(odb, "-tlb:lat",
	      "inst/data TLB miss latency (in cycles)",
	      &tlb_miss_lat,  30,
	       1 ,  ((void *)0) );

   

  opt_reg_int(odb, "-res:ialu",
	      "total number of integer ALU's available",
	      &res_ialu,  fu_config[0 ].quantity,
	       1 ,  ((void *)0) );

  opt_reg_int(odb, "-res:imult",
	      "total number of integer multiplier/dividers available",
	      &res_imult,  fu_config[1 ].quantity,
	       1 ,  ((void *)0) );

  opt_reg_int(odb, "-res:memport",
	      "total number of memory system ports available (to CPU)",
	      &res_memport,  fu_config[2 ].quantity,
	       1 ,  ((void *)0) );

  opt_reg_int(odb, "-res:fpalu",
	      "total number of floating point ALU's available",
	      &res_fpalu,  fu_config[3 ].quantity,
	       1 ,  ((void *)0) );

  opt_reg_int(odb, "-res:fpmult",
	      "total number of floating point multiplier/dividers available",
	      &res_fpmult,  fu_config[4 ].quantity,
	       1 ,  ((void *)0) );

  opt_reg_string_list(odb, "-pcstat",
		      "profile stat(s) against text addr's (mult uses ok)",
		      pcstat_vars, 8 , &pcstat_nelt, ((void *)0) ,
		       0 ,  ((void *)0) ,  1 );

  opt_reg_flag(odb, "-bugcompat",
	       "operate in backward-compatible bugs mode (for testing only)",
	       &bugcompat_mode,  0 ,  1 , ((void *)0) );
}

 
void
sim_check_options(struct opt_odb_t *odb,         
		  int argc, char **argv)         
{
  char name[128], c;
  int nsets, bsize, assoc;

  if (fastfwd_count < 0 || fastfwd_count >= 2147483647)
    _fatal("sim-outorder.c", __FUNCTION__, 819,  "bad fast forward count: %d" ,fastfwd_count ) ;

  if (ruu_ifq_size < 1 || (ruu_ifq_size & (ruu_ifq_size - 1)) != 0)
    _fatal("sim-outorder.c", __FUNCTION__, 822,  "inst fetch queue size must be positive > 0 and a power of two"  ) ;

  if (ruu_branch_penalty < 1)
    _fatal("sim-outorder.c", __FUNCTION__, 825,  "mis-prediction penalty must be at least 1 cycle"  ) ;

  if (!mystricmp(pred_type, "perfect"))
    {
       
      pred = ((void *)0) ;
      pred_perfect = 1 ;
    }
  else if (!mystricmp(pred_type, "taken"))
    {
       
      pred = bpred_create(BPredTaken, 0, 0, 0);
    }
  else if (!mystricmp(pred_type, "nottaken"))
    {
       
      pred = bpred_create(BPredNotTaken, 0, 0, 0);
    }
  else if (!mystricmp(pred_type, "bimod"))
    {
       
      pred = bpred_create(BPred2bitBTB, btb_size, 0, 0);
    }
  else if (!mystricmp(pred_type, "2lev"))
    {
       
      if (twolev_nelt != 3)
	_fatal("sim-outorder.c", __FUNCTION__, 852,  "bad 2-level predictor config (<l1size> <l2size> <hist_size>)"  ) ;
      pred = bpred_create(BPred2Level,
			   twolev_config[0],
			   twolev_config[1],
			   twolev_config[2]);
    }
  else
    _fatal("sim-outorder.c", __FUNCTION__, 859,  "cannot parse predictor type `%s'" ,pred_type ) ;

  if (ruu_decode_width < 1 || (ruu_decode_width & (ruu_decode_width-1)) != 0)
    _fatal("sim-outorder.c", __FUNCTION__, 862,  "issue width must be positive non-zero and a power of two"  ) ;

  if (ruu_issue_width < 1 || (ruu_issue_width & (ruu_issue_width-1)) != 0)
    _fatal("sim-outorder.c", __FUNCTION__, 865,  "issue width must be positive non-zero and a power of two"  ) ;

  if (ruu_commit_width < 1)
    _fatal("sim-outorder.c", __FUNCTION__, 868,  "commit width must be positive non-zero"  ) ;

  if (RUU_size < 2 || (RUU_size & (RUU_size-1)) != 0)
    _fatal("sim-outorder.c", __FUNCTION__, 871,  "RUU size must be a positive number > 1 and a power of two"  ) ;

  if (LSQ_size < 2 || (LSQ_size & (LSQ_size-1)) != 0)
    _fatal("sim-outorder.c", __FUNCTION__, 874,  "LSQ size must be a positive number > 1 and a power of two"  ) ;

   
  if (!mystricmp(cache_dl1_opt, "none"))
    {
      cache_dl1 = ((void *)0) ;

       
      if (strcmp(cache_dl2_opt, "none"))
	_fatal("sim-outorder.c", __FUNCTION__, 883,  "the l1 data cache must defined if the l2 cache is defined"  ) ;
      cache_dl2 = ((void *)0) ;
    }
  else  
    {
      if (sscanf(cache_dl1_opt, "%[^:]:%d:%d:%d:%c",
		 name, &nsets, &bsize, &assoc, &c) != 5)
	_fatal("sim-outorder.c", __FUNCTION__, 890,  "bad l1 D-cache parms: <name>:<nsets>:<bsize>:<assoc>:<repl>"  ) ;
      cache_dl1 = cache_create(name, nsets, bsize,  0 ,
			        0, assoc, cache_char2policy(c),
			       dl1_access_fn,  cache_dl1_lat);

       
      if (!mystricmp(cache_dl2_opt, "none"))
	cache_dl2 = ((void *)0) ;
      else
	{
	  if (sscanf(cache_dl2_opt, "%[^:]:%d:%d:%d:%c",
		     name, &nsets, &bsize, &assoc, &c) != 5)
	    _fatal("sim-outorder.c", __FUNCTION__, 903,  "bad l2 D-cache parms: "
		  "<name>:<nsets>:<bsize>:<assoc>:<repl>"  ) ;
	  cache_dl2 = cache_create(name, nsets, bsize,  0 ,
				    0, assoc, cache_char2policy(c),
				   dl2_access_fn,  cache_dl2_lat);
	}
    }

   
  if (!mystricmp(cache_il1_opt, "none"))
    {
      cache_il1 = ((void *)0) ;

       
      if (strcmp(cache_il2_opt, "none"))
	_fatal("sim-outorder.c", __FUNCTION__, 917,  "the l1 inst cache must defined if the l2 cache is defined"  ) ;
      cache_il2 = ((void *)0) ;
    }
  else if (!mystricmp(cache_il1_opt, "dl1"))
    {
      if (!cache_dl1)
	_fatal("sim-outorder.c", __FUNCTION__, 923,  "I-cache l1 cannot access D-cache l1 as it's undefined"  ) ;
      cache_il1 = cache_dl1;

       
      if (strcmp(cache_il2_opt, "none"))
	_fatal("sim-outorder.c", __FUNCTION__, 928,  "the l1 inst cache must defined if the l2 cache is defined"  ) ;
      cache_il2 = ((void *)0) ;
    }
  else if (!mystricmp(cache_il1_opt, "dl2"))
    {
      if (!cache_dl2)
	_fatal("sim-outorder.c", __FUNCTION__, 934,  "I-cache l1 cannot access D-cache l2 as it's undefined"  ) ;
      cache_il1 = cache_dl2;

       
      if (strcmp(cache_il2_opt, "none"))
	_fatal("sim-outorder.c", __FUNCTION__, 939,  "the l1 inst cache must defined if the l2 cache is defined"  ) ;
      cache_il2 = ((void *)0) ;
    }
  else  
    {
      if (sscanf(cache_il1_opt, "%[^:]:%d:%d:%d:%c",
		 name, &nsets, &bsize, &assoc, &c) != 5)
	_fatal("sim-outorder.c", __FUNCTION__, 946,  "bad l1 I-cache parms: <name>:<nsets>:<bsize>:<assoc>:<repl>"  ) ;
      cache_il1 = cache_create(name, nsets, bsize,  0 ,
			        0, assoc, cache_char2policy(c),
			       il1_access_fn,  cache_il1_lat);

       
      if (!mystricmp(cache_il2_opt, "none"))
	cache_il2 = ((void *)0) ;
      else if (!mystricmp(cache_il2_opt, "dl2"))
	{
	  if (!cache_dl2)
	    _fatal("sim-outorder.c", __FUNCTION__, 957,  "I-cache l2 cannot access D-cache l2 as it's undefined"  ) ;
	  cache_il2 = cache_dl2;
	}
      else
	{
	  if (sscanf(cache_il2_opt, "%[^:]:%d:%d:%d:%c",
		     name, &nsets, &bsize, &assoc, &c) != 5)
	    _fatal("sim-outorder.c", __FUNCTION__, 965,  "bad l2 I-cache parms: "
		  "<name>:<nsets>:<bsize>:<assoc>:<repl>"  ) ;
	  cache_il2 = cache_create(name, nsets, bsize,  0 ,
				    0, assoc, cache_char2policy(c),
				   il2_access_fn,  cache_il2_lat);
	}
    }

   
  if (!mystricmp(itlb_opt, "none"))
    itlb = ((void *)0) ;
  else
    {
      if (sscanf(itlb_opt, "%[^:]:%d:%d:%d:%c",
		 name, &nsets, &bsize, &assoc, &c) != 5)
	_fatal("sim-outorder.c", __FUNCTION__, 979,  "bad TLB parms: <name>:<nsets>:<page_size>:<assoc>:<repl>"  ) ;
      itlb = cache_create(name, nsets, bsize,  0 ,
			   sizeof(SS_ADDR_TYPE), assoc,
			  cache_char2policy(c), itlb_access_fn,
			   1);
    }

   
  if (!mystricmp(dtlb_opt, "none"))
    dtlb = ((void *)0) ;
  else
    {
      if (sscanf(dtlb_opt, "%[^:]:%d:%d:%d:%c",
		 name, &nsets, &bsize, &assoc, &c) != 5)
	_fatal("sim-outorder.c", __FUNCTION__, 993,  "bad TLB parms: <name>:<nsets>:<page_size>:<assoc>:<repl>"  ) ;
      dtlb = cache_create(name, nsets, bsize,  0 ,
			   sizeof(SS_ADDR_TYPE), assoc,
			  cache_char2policy(c), dtlb_access_fn,
			   1);
    }

  if (cache_dl1_lat < 1)
    _fatal("sim-outorder.c", __FUNCTION__, 1001,  "l1 data cache latency must be greater than zero"  ) ;

  if (cache_dl2_lat < 1)
    _fatal("sim-outorder.c", __FUNCTION__, 1004,  "l2 data cache latency must be greater than zero"  ) ;

  if (cache_il1_lat < 1)
    _fatal("sim-outorder.c", __FUNCTION__, 1007,  "l1 instruction cache latency must be greater than zero"  ) ;

  if (cache_il2_lat < 1)
    _fatal("sim-outorder.c", __FUNCTION__, 1010,  "l2 instruction cache latency must be greater than zero"  ) ;

  if (mem_nelt != 2)
    _fatal("sim-outorder.c", __FUNCTION__, 1013,  "bad memory access latency (<first_chunk> <inter_chunk>)"  ) ;

  if (mem_lat[0] < 1 || mem_lat[1] < 1)
    _fatal("sim-outorder.c", __FUNCTION__, 1016,  "all memory access latencies must be greater than zero"  ) ;

  if (mem_bus_width < 1 || (mem_bus_width & (mem_bus_width-1)) != 0)
    _fatal("sim-outorder.c", __FUNCTION__, 1019,  "memory bus width must be positive non-zero and a power of two"  ) ;

  if (tlb_miss_lat < 1)
    _fatal("sim-outorder.c", __FUNCTION__, 1022,  "TLB miss latency must be greater than zero"  ) ;

  if (res_ialu < 1)
    _fatal("sim-outorder.c", __FUNCTION__, 1025,  "number of integer ALU's must be greater than zero"  ) ;
  if (res_ialu > 8 )
    _fatal("sim-outorder.c", __FUNCTION__, 1027,  "number of integer ALU's must be <= MAX_INSTS_PER_CLASS"  ) ;
  fu_config[0 ].quantity = res_ialu;
  
  if (res_imult < 1)
    _fatal("sim-outorder.c", __FUNCTION__, 1031,  "number of integer multiplier/dividers must be greater than zero"  ) ;
  if (res_imult > 8 )
    _fatal("sim-outorder.c", __FUNCTION__, 1033,  "number of integer mult/div's must be <= MAX_INSTS_PER_CLASS"  ) ;
  fu_config[1 ].quantity = res_imult;
  
  if (res_memport < 1)
    _fatal("sim-outorder.c", __FUNCTION__, 1037,  "number of memory system ports must be greater than zero"  ) ;
  if (res_memport > 8 )
    _fatal("sim-outorder.c", __FUNCTION__, 1039,  "number of memory system ports must be <= MAX_INSTS_PER_CLASS"  ) ;
  fu_config[2 ].quantity = res_memport;
  
  if (res_fpalu < 1)
    _fatal("sim-outorder.c", __FUNCTION__, 1043,  "number of floating point ALU's must be greater than zero"  ) ;
  if (res_fpalu > 8 )
    _fatal("sim-outorder.c", __FUNCTION__, 1045,  "number of floating point ALU's must be <= MAX_INSTS_PER_CLASS"  ) ;
  fu_config[3 ].quantity = res_fpalu;
  
  if (res_fpmult < 1)
    _fatal("sim-outorder.c", __FUNCTION__, 1049,  "number of floating point multiplier/dividers must be > zero"  ) ;
  if (res_fpmult > 8 )
    _fatal("sim-outorder.c", __FUNCTION__, 1051,  "number of FP mult/div's must be <= MAX_INSTS_PER_CLASS"  ) ;
  fu_config[4 ].quantity = res_fpmult;
}

 
void
sim_aux_config(FILE *stream)             
{
   
}

 
void
sim_reg_stats(struct stat_sdb_t *sdb)    
{
  int i;

   
  stat_reg_llong( sdb ,  "sim_num_insn" , 
		   "total number of instructions committed" , 
		   &sim_num_insn ,  0 ,  ((void *)0)  ) ;
  stat_reg_llong( sdb ,  "sim_num_refs" , 
		   "total number of loads and stores committed" , 
		   &sim_num_refs ,  0 ,  ((void *)0)  ) ;
  stat_reg_llong( sdb ,  "sim_num_loads" , 
		   "total number of loads committed" , 
		   &sim_num_loads ,  0 ,  ((void *)0)  ) ;
  stat_reg_formula(sdb, "sim_num_stores",
		   "total number of stores committed",
		   "sim_num_refs - sim_num_loads", ((void *)0) );
  stat_reg_llong( sdb ,  "sim_num_branches" , 
		   "total number of branches committed" , 
		   &sim_num_branches ,   0 ,   ((void *)0)  ) ;
  stat_reg_int(sdb, "sim_elapsed_time",
	       "total simulation time in seconds",
	       (int *)&sim_elapsed_time, 0, ((void *)0) );
  stat_reg_formula(sdb, "sim_inst_rate",
		   "simulation speed (in insts/sec)",
		   "sim_num_insn / sim_elapsed_time", ((void *)0) );

  stat_reg_llong( sdb ,  "sim_total_insn" , 
		   "total number of instructions executed" , 
		   &sim_total_insn ,  0 ,  ((void *)0)  ) ;
  stat_reg_llong( sdb ,  "sim_total_refs" , 
		   "total number of loads and stores executed" , 
		   &sim_total_refs ,  0 ,  ((void *)0)  ) ;
  stat_reg_llong( sdb ,  "sim_total_loads" , 
		   "total number of loads executed" , 
		   &sim_total_loads ,  0 ,  ((void *)0)  ) ;
  stat_reg_formula(sdb, "sim_total_stores",
		   "total number of stores executed",
		   "sim_total_refs - sim_total_loads", ((void *)0) );
  stat_reg_llong( sdb ,  "sim_total_branches" , 
		   "total number of branches executed" , 
		   &sim_total_branches ,   0 ,   ((void *)0)  ) ;

   
  stat_reg_llong( sdb ,  "sim_cycle" , 
		   "total simulation time in cycles" , 
		   &sim_cycle ,   0 ,   ((void *)0)  ) ;
  stat_reg_formula(sdb, "sim_IPC",
		   "instructions per cycle",
		   "sim_num_insn / sim_cycle",  ((void *)0) );
  stat_reg_formula(sdb, "sim_CPI",
		   "cycles per instruction",
		   "sim_cycle / sim_num_insn",  ((void *)0) );
  stat_reg_formula(sdb, "sim_exec_BW",
		   "total instructions (mis-spec + committed) per cycle",
		   "sim_total_insn / sim_cycle",  ((void *)0) );
  stat_reg_formula(sdb, "sim_IPB",
		   "instruction per branch",
		   "sim_num_insn / sim_num_branches",  ((void *)0) );

   
  if (pred)
    bpred_reg_stats(pred, sdb);

   
  if (cache_il1
      && (cache_il1 != cache_dl1 && cache_il1 != cache_dl2))
    cache_reg_stats(cache_il1, sdb);
  if (cache_il2
      && (cache_il2 != cache_dl1 && cache_il2 != cache_dl2))
    cache_reg_stats(cache_il2, sdb);
  if (cache_dl1)
    cache_reg_stats(cache_dl1, sdb);
  if (cache_dl2)
    cache_reg_stats(cache_dl2, sdb);
  if (itlb)
    cache_reg_stats(itlb, sdb);
  if (dtlb)
    cache_reg_stats(dtlb, sdb);

  for (i=0; i<pcstat_nelt; i++)
    {
      char buf[512], buf1[512];
      struct stat_stat_t *stat;

       

       
      stat = stat_find_stat(sdb, pcstat_vars[i]);
      if (!stat)
	_fatal("sim-outorder.c", __FUNCTION__, 1154,  "cannot locate any statistic named `%s'" ,pcstat_vars[i] ) ;

       
      if (stat->sc != sc_int && stat->sc != sc_uint && stat->sc != sc_llong )
	_fatal("sim-outorder.c", __FUNCTION__, 1159,  "`-pcstat' statistical variable `%s' is not an integral type" ,stat->name ) ;

       
      pcstat_stats[i] = stat;
      pcstat_lastvals[i] = (( stat )->sc == sc_int	? (SS_COUNTER_TYPE)*(( stat )->variant.for_int.var)	: (( stat )->sc == sc_uint	? (SS_COUNTER_TYPE)*(( stat )->variant.for_uint.var)	: (( stat )->sc == sc_llong 	? *(( stat )->variant.for_llong .var)	: (_panic("sim-outorder.c", __FUNCTION__, 1163,  "bad stat class"  ) , 0)))) ;

       
      sprintf(buf, "%s_by_pc", stat->name);
      sprintf(buf1, "%s (by text address)", stat->desc);
      pcstat_sdists[i] = stat_reg_sdist(sdb, buf, buf1,
					 0,
					 (0x0001 | 0x0002 ),
					 "0x%lx %lu %.2f",
					 ((void *)0) );
    }
}

 
static void ruu_init(void);
static void lsq_init(void);
static void rslink_init(int nlinks);
static void eventq_init(void);
static void readyq_init(void);
static void cv_init(void);
static void tracer_init(void);
static void fetch_init(void);

 
static char *					 
simoo_reg_obj(enum dlite_access_t at,		 
	      enum dlite_reg_t rt,		 
	      int reg,				 
	      union dlite_reg_val_t *val);	 

 
static char *					 
simoo_mem_obj(enum dlite_access_t at,		 
	      SS_ADDR_TYPE addr,		 
	      char *p,				 
	      int nbytes);			 

 
static char *					 
simoo_mstate_obj(FILE *stream,			 
		 char *cmd);			 

 


 
void
sim_init(void)
{
  sim_num_insn = 0;
  sim_num_refs = 0;

   
  if (ptrace_nelt == 2)
    {
       
      ptrace_open( ptrace_opts[0],  ptrace_opts[1]);
    }
  else if (ptrace_nelt == 0)
    {
       ;
    }
  else
    _fatal("sim-outorder.c", __FUNCTION__, 1226,  "bad pipetrace args, use: <fname|stdout|stderr> <range>"  ) ;

   
  {
    SS_ADDR_TYPE addr;
    SS_INST_TYPE inst;

    if (OP_MAX > 255)
      _fatal("sim-outorder.c", __FUNCTION__, 1234,  "cannot do fast decoding, too many opcodes"  ) ;

     ;
    for (addr=ld_text_base;
	 addr < (ld_text_base+ld_text_size);
	 addr += sizeof(SS_INST_TYPE) )
      {
	inst = (*(( SS_INST_TYPE  *)(mem_table[((((SS_ADDR_TYPE)(   addr  )) >> 16) & 0x7fff) ] + ((   addr  ) & 0xffff) ))) ;
	inst.a = (inst.a & ~0xff) | (unsigned int)(ss_mask2op[ ( inst .a & 0xff)  ]) ;
	(*(( SS_INST_TYPE  *)(mem_table[((((SS_ADDR_TYPE)(   addr  )) >> 16) & 0x7fff) ] + ((   addr  ) & 0xffff) )))  = inst;
      }
  }

   
  fu_pool = res_create_pool("fu-pool", fu_config, (sizeof( fu_config )/sizeof(( fu_config )[0])) );
  rslink_init(2048 );
  tracer_init();
  fetch_init();
  cv_init();
  eventq_init();
  readyq_init();
  ruu_init();
  lsq_init();

   
  dlite_init(simoo_reg_obj, simoo_mem_obj, simoo_mstate_obj);
}

 
void
sim_aux_stats(FILE *stream)              
{
   
}

 
void
sim_uninit(void)
{
  if (ptrace_nelt > 0)
    ptrace_close();
}


 



 
typedef unsigned int INST_TAG_TYPE;

 


typedef unsigned int INST_SEQ_TYPE;


 


 


 












struct RUU_station {
   
  SS_INST_TYPE IR;                       
  enum ss_opcode op;                     
  SS_ADDR_TYPE PC, next_PC, pred_PC;     
  int in_LSQ;                            
  int ea_comp;                           
  int recover_inst;                      
  int spec_mode;                         
  SS_ADDR_TYPE addr;                     
  INST_TAG_TYPE tag;                     

  INST_SEQ_TYPE seq;                     

  unsigned int ptrace_seq;		 

   
  int queued;                            
  int issued;                            
  int completed;                         

   


  int onames[2 ];                 
  struct RS_link *odep_list[2 ];  

   





  int idep_ready[3 ];             
};

 


 

static struct RUU_station *RUU;          
static int RUU_head, RUU_tail;           
static int RUU_num;                      

 
static void
ruu_init(void)
{
  RUU = calloc(RUU_size, sizeof(struct RUU_station));
  if (!RUU)
    _fatal("sim-outorder.c", __FUNCTION__, 1362,  "out of virtual memory"  ) ;

  RUU_num = 0;
  RUU_head = RUU_tail = 0;
}

 
static void
ruu_dumpent(struct RUU_station *rs,		 
	    int index,				 
	    FILE *stream,			 
	    int header)				 
{
  if (header)
    fprintf(stream, "idx: %2d: opcode: %s, inst: `",
	    index, (ss_op2name[ rs->op ]) );
  else
    fprintf(stream, "       opcode: %s, inst: `",
	    (ss_op2name[ rs->op ]) );
  ss_print_insn(rs->IR, rs->PC, stream);
  fprintf(stream, "'\n");
  fprintf(stream, "         PC: 0x%08x, NPC: 0x%08x (pred_PC: 0x%08x)\n",
	  rs->PC, rs->next_PC, rs->pred_PC);
  fprintf(stream, "         in_LSQ: %s, ea_comp: %s, recover_inst: %s\n",
	  rs->in_LSQ ? "t" : "f",
	  rs->ea_comp ? "t" : "f",
	  rs->recover_inst ? "t" : "f");
  fprintf(stream, "         spec_mode: %s, addr: 0x%08x, tag: 0x%08x\n",
	  rs->spec_mode ? "t" : "f", rs->addr, rs->tag);
  fprintf(stream, "         seq: 0x%08x, ptrace_seq: 0x%08x\n",
	  rs->seq, rs->ptrace_seq);
  fprintf(stream, "         queued: %s, issued: %s, completed: %s\n",
	  rs->queued ? "t" : "f",
	  rs->issued ? "t" : "f",
	  rs->completed ? "t" : "f");
  fprintf(stream, "         operands ready: %s\n",
	  (( rs )->idep_ready[0] && ( rs )->idep_ready[1] && ( rs )->idep_ready[2])  ? "t" : "f");
}

 
static void
ruu_dump(FILE *stream)				 
{
  int num, head;
  struct RUU_station *rs;

  fprintf(stream, "** RUU state **\n");
  fprintf(stream, "RUU_head: %d, RUU_tail: %d\n", RUU_head, RUU_tail);
  fprintf(stream, "RUU_num: %d\n", RUU_num);

  num = RUU_num;
  head = RUU_head;
  while (num)
    {
      rs = &RUU[head];
      ruu_dumpent(rs, rs - RUU, stream,  1 );
      head = (head + 1) % RUU_size;
      num--;
    }
}

 



























static struct RUU_station *LSQ;          
static int LSQ_head, LSQ_tail;           
static int LSQ_num;                      

 










 
static void
lsq_init(void)
{
  LSQ = calloc(LSQ_size, sizeof(struct RUU_station));
  if (!LSQ)
    _fatal("sim-outorder.c", __FUNCTION__, 1472,  "out of virtual memory"  ) ;

  LSQ_num = 0;
  LSQ_head = LSQ_tail = 0;
}

 
static void
lsq_dump(FILE *stream)				 
{
  int num, head;
  struct RUU_station *rs;

  fprintf(stream, "** LSQ state **\n");
  fprintf(stream, "LSQ_head: %d, LSQ_tail: %d\n", LSQ_head, LSQ_tail);
  fprintf(stream, "LSQ_num: %d\n", LSQ_num);

  num = LSQ_num;
  head = LSQ_head;
  while (num)
    {
      rs = &LSQ[head];
      ruu_dumpent(rs, rs - LSQ, stream,  1 );
      head = (head + 1) % LSQ_size;
      num--;
    }
}


 



 







struct RS_link {
  struct RS_link *next;                  
  struct RUU_station *rs;                
  INST_TAG_TYPE tag;                     
  union {
    SS_TIME_TYPE when;                   
    INST_SEQ_TYPE seq;                   
    int opnum;                           
  } x;
};

 
static struct RS_link *rslink_free_list;

 

static struct RS_link RSLINK_NULL = { ((void *)0) , ((void *)0) , 0 } ;

 


 


 


 


 


 


 
 


 
static void
rslink_init(int nlinks)			 
{
  int i;
  struct RS_link *link;

  rslink_free_list = ((void *)0) ;
  for (i=0; i<nlinks; i++)
    {
      link = calloc(1, sizeof(struct RS_link));
      if (!link)
	_fatal("sim-outorder.c", __FUNCTION__, 1587,  "out of virtual memory"  ) ;
      link->next = rslink_free_list;
      rslink_free_list = link;
    }
}

 



static void
ruu_release_fu(void)
{
  int i;

   
  for (i=0; i<fu_pool->num_resources; i++)
    {
       
      if (fu_pool->resources[i].busy > 0)
	fu_pool->resources[i].busy--;
    }
}


 





 


static struct RS_link *event_queue;

 
static void
eventq_init(void)
{
  event_queue = ((void *)0) ;
}

 
static void
eventq_dump(FILE *stream)			 
{
  struct RS_link *ev;

  fprintf(stream, "** event queue state **\n");

  for (ev = event_queue; ev != ((void *)0) ; ev = ev->next)
    {
       
      if ((( ev )->tag == ( ev )->rs->tag) )
	{
	  struct RUU_station *rs = (( ev )->rs) ;

	  fprintf(stream, "idx: %2d: @ %.0f\n",
		  rs - (rs->in_LSQ ? LSQ : RUU), (double)ev->x.when);
	  ruu_dumpent(rs, rs - (rs->in_LSQ ? LSQ : RUU),
		      stream,  0 );
	}
    }
}

 


static void
eventq_queue_event(struct RUU_station *rs, SS_TIME_TYPE when)
{
  struct RS_link *prev, *ev, *new_ev;

  if (rs->completed)
    _panic("sim-outorder.c", __FUNCTION__, 1662,  "event completed"  ) ;

  if (when <= sim_cycle)
    _panic("sim-outorder.c", __FUNCTION__, 1665,  "event occurred in the past"  ) ;

   
  { struct RS_link *n_link;	if (!rslink_free_list)	_panic("sim-outorder.c", __FUNCTION__, 1668,  "out of rs links"  ) ;	n_link = rslink_free_list;	rslink_free_list = rslink_free_list->next;	n_link->next = ((void *)0) ;	n_link->rs = (  rs ); n_link->tag = n_link->rs->tag;	( new_ev ) = n_link;	} ;
  new_ev->x.when = when;

   
  for (prev= ((void *)0) , ev=event_queue;
       ev && ev->x.when < when;
       prev=ev, ev=ev->next);

  if (prev)
    {
       
      new_ev->next = prev->next;
      prev->next = new_ev;
    }
  else
    {
       
      new_ev->next = event_queue;
      event_queue = new_ev;
    }
}

 

static struct RUU_station *
eventq_next_event(void)
{
  struct RS_link *ev;

  if (event_queue && event_queue->x.when <= sim_cycle)
    {
       
      ev = event_queue;
      event_queue = event_queue->next;

       
      if ((( ev )->tag == ( ev )->rs->tag) )
	{
	  struct RUU_station *rs = (( ev )->rs) ;

	   
	  {  struct RS_link *f_link = ( ev );	f_link->rs = ((void *)0) ; f_link->tag = 0;	f_link->next = rslink_free_list;	rslink_free_list = f_link;	} ;

	   
	  return rs;
	}
      else
	{
	   
	  {  struct RS_link *f_link = ( ev );	f_link->rs = ((void *)0) ; f_link->tag = 0;	f_link->next = rslink_free_list;	rslink_free_list = f_link;	} ;

	   
	  return eventq_next_event();
	}
    }
  else
    {
       
      return ((void *)0) ;
    }
}


 











 
static struct RS_link *ready_queue;

 
static void
readyq_init(void)
{
  ready_queue = ((void *)0) ;
}

 
static void
readyq_dump(FILE *stream)			 
{
  struct RS_link *link;

  fprintf(stream, "** ready queue state **\n");

  for (link = ready_queue; link != ((void *)0) ; link = link->next)
    {
       
      if ((( link )->tag == ( link )->rs->tag) )
	{
	  struct RUU_station *rs = (( link )->rs) ;

	  ruu_dumpent(rs, rs - (rs->in_LSQ ? LSQ : RUU),
		      stream,  1 );
	}
    }
}

 












static void
readyq_enqueue(struct RUU_station *rs)		 
{
  struct RS_link *prev, *node, *new_node;

   
  if (rs->queued)
    _panic("sim-outorder.c", __FUNCTION__, 1794,  "node is already queued"  ) ;
  rs->queued = 1 ;

   
  { struct RS_link *n_link;	if (!rslink_free_list)	_panic("sim-outorder.c", __FUNCTION__, 1798,  "out of rs links"  ) ;	n_link = rslink_free_list;	rslink_free_list = rslink_free_list->next;	n_link->next = ((void *)0) ;	n_link->rs = (  rs ); n_link->tag = n_link->rs->tag;	( new_node ) = n_link;	} ;
  new_node->x.seq = rs->seq;

   
  if (rs->in_LSQ || (ss_op2flags[ rs->op ])  & (0x00001000 | 0x00000004 ))
    {
       
      prev = ((void *)0) ;
      node = ready_queue;
    }
  else
    {
       
      for (prev= ((void *)0) , node=ready_queue;
	   node && node->x.seq < rs->seq;
	   prev=node, node=node->next);
    }

  if (prev)
    {
       
      new_node->next = prev->next;
      prev->next = new_node;
    }
  else
    {
       
      new_node->next = ready_queue;
      ready_queue = new_node;
    }
}


 





 
struct CV_link {
  struct RUU_station *rs;                
  int odep_num;                          
};

 
static struct CV_link CVLINK_NULL = { ((void *)0) , 0 };

 


 


 


static unsigned int (  use_spec_cv )[(((  (32 + 32 + 1+ 1+ 1+ 1+	 1+ 1)   )+31)/32) ] ;
static struct CV_link create_vector[(32 + 32 + 1+ 1+ 1+ 1+	 1+ 1) ];
static struct CV_link spec_create_vector[(32 + 32 + 1+ 1+ 1+ 1+	 1+ 1) ];

 

static SS_TIME_TYPE create_vector_rt[(32 + 32 + 1+ 1+ 1+ 1+	 1+ 1) ];
static SS_TIME_TYPE spec_create_vector_rt[(32 + 32 + 1+ 1+ 1+ 1+	 1+ 1) ];

 


 


 


 
static void
cv_init(void)
{
  int i;

   

  for (i=0; i< (32 + 32 + 1+ 1+ 1+ 1+	 1+ 1) ; i++)
    {
      create_vector[i] = CVLINK_NULL;
      create_vector_rt[i] = 0;
      spec_create_vector[i] = CVLINK_NULL;
      spec_create_vector_rt[i] = 0;
    }

   
  { int i; for (i=0; i<(  (((( (32 + 32 + 1+ 1+ 1+ 1+	 1+ 1)  )+31)/32) )  ); i++) ( use_spec_cv )[i] = 0; } ;
}

 
static char *dep_names[(32 + 32 + 1+ 1+ 1+ 1+	 1+ 1) ] = {
  "n/a", "$r1", "$r2", "$r3", "$r4", "$r5", "$r6", "$r7", "$r8",  "$r9",
  "$r10", "$r11", "$r12", "$r13", "$r14", "$r15", "$r16", "$r17", "$r18",
  "$r19", "$r20", "$r21", "$r22", "$r23", "$r24", "$r25", "$r26", "$r27",
  "$r28",  "$r29", "$r30", "$r31",
  "$f0", "$f1", "$f2", "$f3", "$f4", "$f5", "$f6", "$f7", "$f8",  "$f9",
  "$f10", "$f11", "$f12", "$f13", "$f14", "$f15", "$f16", "$f17", "$f18",
  "$f19", "$f20", "$f21", "$f22", "$f23", "$f24", "$f25", "$f26", "$f27",
  "$f28",  "$f29", "$f30", "$f31",
  "$hi", "$lo", "$fcc", "$tmp",
  "n/a", "n/a"
};

 
static void
cv_dump(FILE *stream)				 
{
  int i;
  struct CV_link ent;

  fprintf(stream, "** create vector state **\n");

  for (i=0; i< (32 + 32 + 1+ 1+ 1+ 1+	 1+ 1) ; i++)
    {
      ent = (((( use_spec_cv )[(  ( i ) )/32] & (1 << ((  ( i ) ) % 32))) != 0) 	? spec_create_vector[ i ] : create_vector[ i ]) ;
      if (!ent.rs)
	fprintf(stream, "[%4s]: from architected reg file\n", dep_names[i]);
      else
	fprintf(stream, "[%4s]: from %s, idx: %d\n",
	      dep_names[i], (ent.rs->in_LSQ ? "LSQ" : "RUU"),
		ent.rs - (ent.rs->in_LSQ ? LSQ : RUU));
    }
}


 



 


static void
ruu_commit(void)
{
  int lat, events, committed = 0;

   
  while (RUU_num > 0 && committed < ruu_commit_width)
    {
      if (!RUU[RUU_head].completed)
	{
	   
	  break;
	}

       
      events = 0;

       
      if (RUU[RUU_head].ea_comp)
	{
	   
	  if (LSQ_num <= 0 || !LSQ[LSQ_head].in_LSQ)
	    _panic("sim-outorder.c", __FUNCTION__, 1965,  "RUU out of sync with LSQ"  ) ;

	   
	  if (!LSQ[LSQ_head].completed)
	    {
	       
	      break;
	    }

	  if (((ss_op2flags[ LSQ[LSQ_head].op ])  & (0x00000020 | 0x00000080 ))
	      == (0x00000020 | 0x00000080 ))
	    {
	      struct res_template *fu;


	       

	      fu = res_get(fu_pool, (ss_op2fu[ LSQ[LSQ_head].op ]) );
	      if (fu)
		{
		   
		  if (fu->master->busy)
		    _panic("sim-outorder.c", __FUNCTION__, 1987,  "functional unit already in use"  ) ;

		   
		  fu->master->busy = fu->issuelat;

		   
		  if (cache_dl1)
		    {
		       
		      lat =
			cache_access(cache_dl1, Write, (LSQ[LSQ_head].addr&~3),
				     ((void *)0) , 4, sim_cycle, ((void *)0) , ((void *)0) );
		      if (lat > cache_dl1_lat)
			events |= 0x00000001 ;
		    }

		   
		  if (dtlb)
		    {
		       
		      lat =
			cache_access(dtlb, Read, (LSQ[LSQ_head].addr & ~3),
				     ((void *)0) , 4, sim_cycle, ((void *)0) , ((void *)0) );
		      if (lat > 1)
			events |= 0x00000002 ;
		    }
		}
	      else
		{
		   
		  break;
		}
	    }

	   
	  LSQ[LSQ_head].tag++;

	   
	  if (ptrace_active) __ptrace_newstage(( LSQ[LSQ_head].ptrace_seq ),(  "CT"  ),(  events )) ;
	  if (ptrace_active) __ptrace_endinst(( LSQ[LSQ_head].ptrace_seq )) ;

	   
	  LSQ_head = (LSQ_head + 1) % LSQ_size;
	  LSQ_num--;
	}

       
      RUU[RUU_head].tag++;

       
      if (ptrace_active) __ptrace_newstage(( RUU[RUU_head].ptrace_seq ),(  "CT"  ),(  events )) ;
      if (ptrace_active) __ptrace_endinst(( RUU[RUU_head].ptrace_seq )) ;

       
      RUU_head = (RUU_head + 1) % RUU_size;
      RUU_num--;

       
      committed++;
    }
}


 



 

static void
ruu_recover(int branch_index)			 
{
  int i, RUU_index = RUU_tail, LSQ_index = LSQ_tail;
  int RUU_prev_tail = RUU_tail, LSQ_prev_tail = LSQ_tail;

   



   
  RUU_index = (RUU_index + (RUU_size-1)) % RUU_size;
  LSQ_index = (LSQ_index + (LSQ_size-1)) % LSQ_size;

   
  while (RUU_index != branch_index)
    {
       
      if (!RUU_num)
	_panic("sim-outorder.c", __FUNCTION__, 2075,  "empty RUU"  ) ;

       
      if (RUU_index == RUU_head)
	_panic("sim-outorder.c", __FUNCTION__, 2079,  "RUU head and tail broken"  ) ;

       
      if (RUU[RUU_index].ea_comp)
	{
	   
	  if (!LSQ_num)
	    _panic("sim-outorder.c", __FUNCTION__, 2086,  "RUU and LSQ out of sync"  ) ;

	   
	  for (i=0; i< 2 ; i++)
	    {
	      {  struct RS_link *fl_link, *fl_link_next;	for (fl_link=( LSQ[LSQ_index].odep_list[i] ); fl_link; fl_link=fl_link_next)	{	fl_link_next = fl_link->next;	{  struct RS_link *f_link = ( fl_link );	f_link->rs = ((void *)0) ; f_link->tag = 0;	f_link->next = rslink_free_list;	rslink_free_list = f_link;	} ;	}	} ;
	       
	      LSQ[LSQ_index].odep_list[i] = ((void *)0) ;
	    }
      
	   
	  LSQ[LSQ_index].tag++;

	   
	  if (ptrace_active) __ptrace_endinst(( LSQ[LSQ_index].ptrace_seq )) ;

	   
	  LSQ_prev_tail = LSQ_index;
	  LSQ_index = (LSQ_index + (LSQ_size-1)) % LSQ_size;
	  LSQ_num--;
	}

       
      for (i=0; i< 2 ; i++)
	{
	  {  struct RS_link *fl_link, *fl_link_next;	for (fl_link=( RUU[RUU_index].odep_list[i] ); fl_link; fl_link=fl_link_next)	{	fl_link_next = fl_link->next;	{  struct RS_link *f_link = ( fl_link );	f_link->rs = ((void *)0) ; f_link->tag = 0;	f_link->next = rslink_free_list;	rslink_free_list = f_link;	} ;	}	} ;
	   
	  RUU[RUU_index].odep_list[i] = ((void *)0) ;
	}
      
       
      RUU[RUU_index].tag++;

       
      if (ptrace_active) __ptrace_endinst(( RUU[RUU_index].ptrace_seq )) ;

       
      RUU_prev_tail = RUU_index;
      RUU_index = (RUU_index + (RUU_size-1)) % RUU_size;
      RUU_num--;
    }

   
  RUU_tail = RUU_prev_tail;
  LSQ_tail = LSQ_prev_tail;

   


  { int i; for (i=0; i<(  (((( (32 + 32 + 1+ 1+ 1+ 1+	 1+ 1)  )+31)/32) )  ); i++) ( use_spec_cv )[i] = 0; } ;

   
}


 



 
static void tracer_recover(void);

 




static void
ruu_writeback(void)
{
  int i;
  struct RUU_station *rs;

   
  while ((rs = eventq_next_event()))
    {
       
      if (! (( rs )->idep_ready[0] && ( rs )->idep_ready[1] && ( rs )->idep_ready[2])  || rs->queued || !rs->issued || rs->completed)
	_panic("sim-outorder.c", __FUNCTION__, 2164,  "inst completed and !ready, !issued, or completed"  ) ;

       
      rs->completed = 1 ;

       
      if (rs->recover_inst)
	{
	  if (rs->in_LSQ)
	    _panic("sim-outorder.c", __FUNCTION__, 2173,  "mis-predicted load or store?!?!?"  ) ;

	   
	  ruu_recover(rs - RUU);
	  tracer_recover();

	   
	  ruu_fetch_issue_delay = ruu_branch_penalty;

	   
	}

       
      if (ptrace_active) __ptrace_newstage(( rs->ptrace_seq ),(  "WB"  ),( 
		      rs->recover_inst ? 0x00000008  : 0 )) ;

       


      for (i=0; i< 2 ; i++)
	{
	  if (rs->onames[i] != 0 )
	    {
	      struct CV_link link;
	      struct RS_link *olink, *olink_next;

	      if (rs->spec_mode)
		{
		   

		  link = spec_create_vector[rs->onames[i]];
		  if ( link.rs
		      &&  (link.rs == rs && link.odep_num == i))
		    {
		       

		      spec_create_vector[rs->onames[i]] = CVLINK_NULL;
		      spec_create_vector_rt[rs->onames[i]] = sim_cycle;
		    }
		   
		}
	      else
		{
		   


		  link = create_vector[rs->onames[i]];
		  if ( link.rs
		      &&  (link.rs == rs && link.odep_num == i))
		    {
		       

		      create_vector[rs->onames[i]] = CVLINK_NULL;
		      create_vector_rt[rs->onames[i]] = sim_cycle;
		    }
		   
		}

	       
	      for (olink=rs->odep_list[i]; olink; olink=olink_next)
		{
		  if ((( olink )->tag == ( olink )->rs->tag) )
		    {
		      if (olink->rs->idep_ready[olink->x.opnum])
			_panic("sim-outorder.c", __FUNCTION__, 2237,  "output dependence already satisfied"  ) ;

		       
		      olink->rs->idep_ready[olink->x.opnum] = 1 ;

		       
		      if ((( olink->rs )->idep_ready[0] && ( olink->rs )->idep_ready[1] && ( olink->rs )->idep_ready[2]) )
			{
			   


			  if (!olink->rs->in_LSQ
			      || (((ss_op2flags[ olink->rs->op ]) &(0x00000020 | 0x00000080 ))
				  == (0x00000020 | 0x00000080 )))
			    readyq_enqueue(olink->rs);
			   
			}
		    }

		   
		  olink_next = olink->next;

		   
		  {  struct RS_link *f_link = ( olink );	f_link->rs = ((void *)0) ; f_link->tag = 0;	f_link->next = rslink_free_list;	rslink_free_list = f_link;	} ;
		}
	       
	      rs->odep_list[i] = ((void *)0) ;

	    }  

	}  

   }  

}


 



 




static void
lsq_refresh(void)
{
  int i, j, index, n_std_unknowns;
  SS_ADDR_TYPE std_unknowns[64 ];

   


  for (i=0, index=LSQ_head, n_std_unknowns=0;
       i < LSQ_num;
       i++, index=(index + 1) % LSQ_size)
    {
       

      if ( 
	  ((ss_op2flags[ LSQ[index].op ])  & (0x00000020 | 0x00000080 )) == (0x00000020 | 0x00000080 ))
	{
	  if (! (( &LSQ[index] )->idep_ready[1 ]) )
	    {
	       
	       
	      break;
	    }
	  else if (! (( &LSQ[index] )->idep_ready[0] && ( &LSQ[index] )->idep_ready[1] && ( &LSQ[index] )->idep_ready[2]) )
	    {
	       



	      if (n_std_unknowns == 64 )
		_fatal("sim-outorder.c", __FUNCTION__, 2314,  "STD unknown array overflow, increase MAX_STD_UNKNOWNS"  ) ;
	      std_unknowns[n_std_unknowns++] = LSQ[index].addr;
	    }
	  else  
	    {
	       
	      for (j=0; j<n_std_unknowns; j++)
		{
		  if (std_unknowns[j] ==  LSQ[index].addr)
		    std_unknowns[j] =  0;
		}
	    }
	}

      if ( 
	  (((ss_op2flags[ LSQ[index].op ])  & (0x00000020 | 0x00000040 )) == (0x00000020 | 0x00000040 ))
	  &&  !LSQ[index].queued
	  &&  !LSQ[index].issued
	  &&  !LSQ[index].completed
	  &&  (( &LSQ[index] )->idep_ready[0] && ( &LSQ[index] )->idep_ready[1] && ( &LSQ[index] )->idep_ready[2]) )
	{
	   

	  for (j=0; j<n_std_unknowns; j++)
	    {
	       
	      if (std_unknowns[j] == LSQ[index].addr)
		break;
	    }
	  if (j == n_std_unknowns)
	    {
	       
	      readyq_enqueue(&LSQ[index]);
	    }
	}
    }
}


 



 






static void
ruu_issue(void)
{
  int i, load_lat, tlb_lat, n_issued;
  struct RS_link *node, *next_node;
  struct res_template *fu;

   

   




  node = ready_queue;
  ready_queue = ((void *)0) ;

   


  for (n_issued=0;
       node && n_issued < ruu_issue_width;
       node = next_node)
    {
      next_node = node->next;

       
      if ((( node )->tag == ( node )->rs->tag) )
	{
	  struct RUU_station *rs = (( node )->rs) ;

	   
	  if (! (( rs )->idep_ready[0] && ( rs )->idep_ready[1] && ( rs )->idep_ready[2])  || !rs->queued
	      || rs->issued || rs->completed)
	    _panic("sim-outorder.c", __FUNCTION__, 2398,  "issued inst !ready, issued, or completed"  ) ;

	   
	  rs->queued = 0 ;

	  if (rs->in_LSQ
	      && (((ss_op2flags[ rs->op ])  & (0x00000020 | 0x00000080 )) == (0x00000020 | 0x00000080 )))
	    {
	       



	      rs->issued = 1 ;
	      rs->completed = 1 ;

	      if (rs->onames[0] || rs->onames[1])
		_panic("sim-outorder.c", __FUNCTION__, 2414,  "store creates result"  ) ;

	      if (rs->recover_inst)
		_panic("sim-outorder.c", __FUNCTION__, 2417,  "mis-predicted store"  ) ;

	       
	      if (ptrace_active) __ptrace_newstage(( rs->ptrace_seq ),(  "WB"  ),(  0 )) ;

	       
	      n_issued++;
	    }
	  else
	    {
	       
	      if ((ss_op2fu[ rs->op ])  != 0 )
		{
		  fu = res_get(fu_pool, (ss_op2fu[ rs->op ]) );
		  if (fu)
		    {
		       
		      rs->issued = 1 ;

		       
		      if (fu->master->busy)
			_panic("sim-outorder.c", __FUNCTION__, 2438,  "functional unit already in use"  ) ;

		       
		      fu->master->busy = fu->issuelat;

		       
		      if (rs->in_LSQ
			  && (((ss_op2flags[ rs->op ])  & (0x00000020 | 0x00000040 ))
			      == (0x00000020 | 0x00000040 )))
			{
			  int events = 0;

			   


			  load_lat = 0;
			  i = (rs - LSQ);
			  if (i != LSQ_head)
			    {
			      for (;;)
				{
				   
				  i = (i + (LSQ_size-1)) % LSQ_size;

				   
				  if (((ss_op2flags[ LSQ[i].op ])  & 0x00000080 )
				      && (LSQ[i].addr == rs->addr))
				    {
				       
				      load_lat = 1;
				      break;
				    }

				   
				  if (i == LSQ_head)
				    break;
				}
			    }

			   
			  if (!load_lat)
			    {
			       
			      if (cache_dl1
				   
				  && (rs->addr >= ld_data_base
				      && rs->addr < ld_stack_base))
				{
				   
				  load_lat =
				    cache_access(cache_dl1, Read,
						 (rs->addr & ~3), ((void *)0) , 4,
						 sim_cycle, ((void *)0) , ((void *)0) );
				  if (load_lat > cache_dl1_lat)
				    events |= 0x00000001 ;
				}
			      else
				{
				   
				  load_lat = fu->oplat;
				}
			    }

			   
			  if (dtlb
			       
			      && (rs->addr >= ld_data_base
				  && rs->addr < ld_stack_base))
			    {
			       

			      tlb_lat =
				cache_access(dtlb, Read, (rs->addr & ~3),
					     ((void *)0) , 4, sim_cycle, ((void *)0) , ((void *)0) );
			      if (tlb_lat > 1)
				events |= 0x00000002 ;

			       
			      load_lat = ((( tlb_lat ) < (  load_lat )) ? (  load_lat ) : ( tlb_lat )) ;
			    }

			   
			  eventq_queue_event(rs, sim_cycle + load_lat);

			   
			  if (ptrace_active) __ptrace_newstage(( rs->ptrace_seq ),(  "EX"  ),( 
					  ((rs->ea_comp ? 0x00000010  : 0)
					   | events) )) ;
			}
		      else  
			{
			   
			  eventq_queue_event(rs, sim_cycle + fu->oplat);

			   
			  if (ptrace_active) __ptrace_newstage(( rs->ptrace_seq ),(  "EX"  ),(  
					  rs->ea_comp ? 0x00000010  : 0 )) ;
			}

		       
		      n_issued++;
		    }
		  else  
		    {
		       


		      readyq_enqueue(rs);
		    }
		}
	      else  
		{
		   
		   
		  rs->issued = 1 ;

		   
		  eventq_queue_event(rs, sim_cycle + 1);

		   
		  if (ptrace_active) __ptrace_newstage(( rs->ptrace_seq ),(  "EX"  ),( 
				  rs->ea_comp ? 0x00000010  : 0 )) ;

		   
		  n_issued++;
		}
	    }  

	}
       

       



      {  struct RS_link *f_link = ( node );	f_link->rs = ((void *)0) ; f_link->tag = 0;	f_link->next = rslink_free_list;	rslink_free_list = f_link;	} ;
    }

   

  for (; node; node = next_node)
    {
      next_node = node->next;

       
      if ((( node )->tag == ( node )->rs->tag) )
        {
	  struct RUU_station *rs = (( node )->rs) ;

           
          rs->queued = 0 ;

	   

          readyq_enqueue(rs);
        }
       

       



      {  struct RS_link *f_link = ( node );	f_link->rs = ((void *)0) ; f_link->tag = 0;	f_link->next = rslink_free_list;	rslink_free_list = f_link;	} ;
    }
}


 




 

static unsigned int (  use_spec_R )[(((  32   )+31)/32) ] ;
static SS_WORD_TYPE spec_regs_R[32 ];

 

static unsigned int (  use_spec_F )[(((  32   )+31)/32) ] ;
static union regs_FP spec_regs_F;

  
static int use_spec_HI;
static SS_WORD_TYPE spec_regs_HI;
static int use_spec_LO;
static SS_WORD_TYPE spec_regs_LO;
static int use_spec_FCC;
static int spec_regs_FCC;

 
static void
rspec_dump(FILE *stream)			 
{
  int i;

  fprintf(stream, "** speculative register contents **\n");

  fprintf(stream, "spec_mode: %s\n", spec_mode ? "t" : "f");

   
  for (i=0; i< 32 ; i++)
    {
      if (((( use_spec_R )[(  i )/32] & (1 << ((  i ) % 32))) != 0) )
	{
	   
	  fprintf(stream, "[%4s]: %12d/0x%08x\n", dep_names[i],
		  spec_regs_R[i], spec_regs_R[i]);
	}
    }

   
  for (i=0; i< 32 ; i++)
    {
      if (((( use_spec_F )[(  i )/32] & (1 << ((  i ) % 32))) != 0) )
	{
	   
	  fprintf(stream,
		  "[%4s]: %12d/0x%08x/%f ([%4s] as double: %f)\n\n",
		  dep_names[i+32],
		  spec_regs_F.l[i], spec_regs_F.l[i], spec_regs_F.f[i],
		  dep_names[i+32],
		  spec_regs_F.d[i >> 1]);
	}
    }

   
  if (use_spec_HI)
    fprintf(stream, "[ $hi]: %12d/0x%08x\n", spec_regs_HI, spec_regs_HI);
  if (use_spec_LO)
    fprintf(stream, "[ $lo]: %12d/0x%08x\n", spec_regs_LO, spec_regs_LO);
  if (use_spec_FCC)
    fprintf(stream, "[$fcc]: 0x%08x\n", spec_regs_FCC);
}


 


 


struct spec_mem_ent {
  struct spec_mem_ent *next;		 
  SS_ADDR_TYPE addr;			 
  unsigned int data[2];			 
};

 
static struct spec_mem_ent *store_htable[32 ];

 
static struct spec_mem_ent *bucket_free_list = ((void *)0) ;


 
static SS_ADDR_TYPE pred_PC;
static SS_ADDR_TYPE recover_PC;

 
static SS_ADDR_TYPE fetch_regs_PC;
static SS_ADDR_TYPE fetch_pred_PC;

 
struct fetch_rec {
  SS_INST_TYPE IR;                       
  SS_ADDR_TYPE regs_PC, pred_PC;         
  struct bpred_btb_ent *update_ptr;	 
  unsigned int ptrace_seq;		 
};
static struct fetch_rec *fetch_data;	 
static int fetch_num;			 
static int fetch_tail, fetch_head;	 

 



static void
tracer_recover(void)
{
  int i;
  struct spec_mem_ent *ent, *ent_next;

   
  if (!spec_mode)
    _panic("sim-outorder.c", __FUNCTION__, 2724,  "cannot recover unless in speculative mode"  ) ;

   
  spec_mode = 0 ;

   
  { int i; for (i=0; i<(  (((( 32  )+31)/32) )  ); i++) ( use_spec_R )[i] = 0; } ;
  { int i; for (i=0; i<(  (((( 32  )+31)/32) )  ); i++) ( use_spec_F )[i] = 0; } ;
  use_spec_HI = 0 ;
  use_spec_LO = 0 ;
  use_spec_FCC = 0 ;

   
   
  for (i=0; i< 32 ; i++)
    {
       
      for (ent=store_htable[i]; ent; ent=ent_next)
	{
	  ent_next = ent->next;
	  ent->next = bucket_free_list;
	  bucket_free_list = ent;
	}
      store_htable[i] = ((void *)0) ;
    }

   
  if (ptrace_active)
    {
      while (fetch_num != 0)
	{
	   
	  if (ptrace_active) __ptrace_endinst(( fetch_data[fetch_head].ptrace_seq )) ;

	   
	  fetch_head = (fetch_head+1) & (ruu_ifq_size - 1);
	  fetch_num--;
	}
    }

   
  fetch_num = 0;
  fetch_tail = fetch_head = 0;
  fetch_pred_PC = fetch_regs_PC = recover_PC;
}

 
static void
tracer_init(void)
{
  int i;

   
  spec_mode = 0 ;

   
  { int i; for (i=0; i<(  (((( 32  )+31)/32) )  ); i++) ( use_spec_R )[i] = 0; } ;
  { int i; for (i=0; i<(  (((( 32  )+31)/32) )  ); i++) ( use_spec_F )[i] = 0; } ;
  use_spec_HI = 0 ;
  use_spec_LO = 0 ;
  use_spec_FCC = 0 ;

   
  for (i=0; i< 32 ; i++)
    store_htable[i] = ((void *)0) ;
}


 


 








static void
spec_mem_access(enum mem_cmd cmd,		 
		SS_ADDR_TYPE addr,		 
		void *p,			 
		int nbytes)			 
{
  int index;
  struct spec_mem_ent *ent, *prev;

   
   

   
  if ((nbytes & (nbytes-1)) != 0 || (addr & (nbytes-1)) != 0)
    {
       
      return;
    }

   
  if (!((addr >= ld_text_base && addr < (ld_text_base+ld_text_size)
	 && cmd == Read)
	|| (addr >= ld_data_base && addr < ld_stack_base)))
    {
       
      return;
    }

   
  index = (((( addr ) >> 24)^(( addr ) >> 16)^(( addr ) >> 8)^( addr )) & (32 -1)) ;
  for (prev= ((void *)0) ,ent=store_htable[index]; ent; prev=ent,ent=ent->next)
    {
      if (ent->addr == addr)
	{
	   
	  if (prev != ((void *)0) )
	    {
	       
	      prev->next = ent->next;
              ent->next = store_htable[index];
              store_htable[index] = ent;
	    }
	  break;
	}
    }

   
  if (!ent && cmd == Write)
    {
       
      if (!bucket_free_list)
	{
	   
	  bucket_free_list = calloc(1, sizeof(struct spec_mem_ent));
	  if (!bucket_free_list)
	    _fatal("sim-outorder.c", __FUNCTION__, 2860,  "out of virtual memory"  ) ;
	}
      ent = bucket_free_list;
      bucket_free_list = bucket_free_list->next;

      if (!bugcompat_mode)
	{
	   
	  ent->next = store_htable[index];
	  store_htable[index] = ent;
	  ent->addr = addr;
	  ent->data[0] = 0; ent->data[1] = 0;
	}
    }

   
  switch (nbytes)
    {
    case 1:
      if (cmd == Read)
	{
	  if (ent)
	    {
	       
	      *((unsigned char *)p) = *((unsigned char *)(&ent->data[0]));
	    }
	  else
	    {
	       
	      *((unsigned char *)p) =
                (mem_table[((((SS_ADDR_TYPE)( addr )) >> 16) & 0x7fff) ] ? (mem_valid(Read, ( addr ), sizeof(unsigned char),  1 ),	((!mem_table[((((SS_ADDR_TYPE)(    addr    )) >> 16) & 0x7fff) ]	? (mem_table[((((SS_ADDR_TYPE)(    addr    )) >> 16) & 0x7fff) ] = mem_newblock())	: 0) , (*(( unsigned char  *)(mem_table[((((SS_ADDR_TYPE)(   (  addr  )  )) >> 16) & 0x7fff) ] + ((   (  addr  )  ) & 0xffff) ))) ) )  : 0);
	    }
	}
      else
	{
	   
	  *((unsigned char *)(&ent->data[0])) = *((unsigned char *)p);
	}
      break;
    case 2:
      if (cmd == Read)
	{
	  if (ent)
	    {
	       
	      *((unsigned short *)p) = *((unsigned short *)(&ent->data[0]));
	    }
	  else
	    {
	       
              *((unsigned short *)p) =
                (mem_table[((((SS_ADDR_TYPE)( addr )) >> 16) & 0x7fff) ] ? (mem_valid(Read, ( addr ), sizeof(unsigned short),  1 ),	((!mem_table[((((SS_ADDR_TYPE)(    addr    )) >> 16) & 0x7fff) ]	? (mem_table[((((SS_ADDR_TYPE)(    addr    )) >> 16) & 0x7fff) ] = mem_newblock())	: 0) , (*(( unsigned short  *)(mem_table[((((SS_ADDR_TYPE)(   (  addr  )  )) >> 16) & 0x7fff) ] + ((   (  addr  )  ) & 0xffff) ))) ) )  : 0);
	    }
	}
      else
	{
	   
	  *((unsigned short *)&ent->data[0]) = *((unsigned short *)p);
	}
      break;
    case 4:
      if (cmd == Read)
	{
	  if (ent)
	    {
	       
	      *((unsigned int *)p) = *((unsigned int *)&ent->data[0]);
	    }
	  else
	    {
	       
              *((unsigned int *)p) =
                (mem_table[((((SS_ADDR_TYPE)( addr )) >> 16) & 0x7fff) ] ? (mem_valid(Read, ( addr ), sizeof(unsigned int),  1 ),	((!mem_table[((((SS_ADDR_TYPE)(    addr    )) >> 16) & 0x7fff) ]	? (mem_table[((((SS_ADDR_TYPE)(    addr    )) >> 16) & 0x7fff) ] = mem_newblock())	: 0) , (*(( unsigned int  *)(mem_table[((((SS_ADDR_TYPE)(   (  addr  )  )) >> 16) & 0x7fff) ] + ((   (  addr  )  ) & 0xffff) ))) ) )  : 0);
	    }
	}
      else
	{
	   
	  *((unsigned int *)&ent->data[0]) = *((unsigned int *)p);
	}
      break;
    case 8:
      if (cmd == Read)
	{
	  if (ent)
	    {
	       
	      *((unsigned int *)p) = *((unsigned int *)&ent->data[0]);
	      *(((unsigned int *)p)+1) = *((unsigned int *)&ent->data[1]);
	    }
	  else
	    {
	       
              *((unsigned int *)p) =
                (mem_table[((((SS_ADDR_TYPE)( addr )) >> 16) & 0x7fff) ] ? (mem_valid(Read, ( addr ), sizeof(unsigned int),  1 ),	((!mem_table[((((SS_ADDR_TYPE)(    addr    )) >> 16) & 0x7fff) ]	? (mem_table[((((SS_ADDR_TYPE)(    addr    )) >> 16) & 0x7fff) ] = mem_newblock())	: 0) , (*(( unsigned int  *)(mem_table[((((SS_ADDR_TYPE)(   (  addr  )  )) >> 16) & 0x7fff) ] + ((   (  addr  )  ) & 0xffff) ))) ) )  : 0);
              *(((unsigned int *)p)+1) =
                (mem_table[((((SS_ADDR_TYPE)( addr + sizeof(SS_WORD_TYPE) )) >> 16) & 0x7fff) ]
                 ? (mem_valid(Read, ( addr + sizeof(SS_WORD_TYPE) ), sizeof(unsigned int),  1 ),	((!mem_table[((((SS_ADDR_TYPE)(    addr + sizeof(SS_WORD_TYPE)    )) >> 16) & 0x7fff) ]	? (mem_table[((((SS_ADDR_TYPE)(    addr + sizeof(SS_WORD_TYPE)    )) >> 16) & 0x7fff) ] = mem_newblock())	: 0) , (*(( unsigned int  *)(mem_table[((((SS_ADDR_TYPE)(   (  addr + sizeof(SS_WORD_TYPE)  )  )) >> 16) & 0x7fff) ] + ((   (  addr + sizeof(SS_WORD_TYPE)  )  ) & 0xffff) ))) ) ) 
                 : 0);
	    }
	}
      else
	{
	   
	  *((unsigned int *)&ent->data[0]) = *((unsigned int *)p);
          *((unsigned int *)&ent->data[1]) = *(((unsigned int *)p)+1);
	}
      break;
    default:
      _panic("sim-outorder.c", __FUNCTION__, 2969,  "access size not supported in mis-speculative mode"  ) ;
    }
}

 
static void
mspec_dump(FILE *stream)			 
{
  int i;
  struct spec_mem_ent *ent;

  fprintf(stream, "** speculative memory contents **\n");

  fprintf(stream, "spec_mode: %s\n", spec_mode ? "t" : "f");

  for (i=0; i< 32 ; i++)
    {
       
      for (ent=store_htable[i]; ent; ent=ent->next)
	{
	  fprintf(stream, "[0x%08x]: %12.0f/0x%08x:%08x\n",
		  ent->addr, (double)(*((double *)ent->data)),
		  *((unsigned int *)&ent->data[0]),
		  *(((unsigned int *)&ent->data[0]) + 1));
	}
    }
}

 
static char *					 
simoo_mem_obj(enum dlite_access_t at,		 
	      SS_ADDR_TYPE addr,		 
	      char *p,				 
	      int nbytes)			 
{
  char *errstr;
  enum mem_cmd cmd;

  if (at == at_read)
    cmd = Read;
  else if (at == at_write)
    cmd = Write;
  else
    _panic("sim-outorder.c", __FUNCTION__, 3012,  "bogus access type"  ) ;

  errstr = mem_valid(cmd, addr, nbytes,  0 );
  if (errstr)
    return errstr;

   
  if (spec_mode)
    spec_mem_access(cmd, addr, p, nbytes);
  else
    mem_access(cmd, addr, p, nbytes);

   
  return ((void *)0) ;
}


 



 

static inline  void
ruu_link_idep(struct RUU_station *rs,		 
	      int idep_num,			 
	      int idep_name)			 
{
  struct CV_link head;
  struct RS_link *link;

   
  if (idep_name == 0 )
    {
       
      rs->idep_ready[idep_num] = 1 ;
      return;
    }

   
  head = (((( use_spec_cv )[(  ( idep_name ) )/32] & (1 << ((  ( idep_name ) ) % 32))) != 0) 	? spec_create_vector[ idep_name ] : create_vector[ idep_name ]) ;

   
  if (!head.rs)
    {
       

      rs->idep_ready[idep_num] = 1 ;
      return;
    }
   

   

  rs->idep_ready[idep_num] = 0 ;

   
  { struct RS_link *n_link;	if (!rslink_free_list)	_panic("sim-outorder.c", __FUNCTION__, 3069,  "out of rs links"  ) ;	n_link = rslink_free_list;	rslink_free_list = rslink_free_list->next;	n_link->next = ((void *)0) ;	n_link->rs = (  rs ); n_link->tag = n_link->rs->tag;	( link ) = n_link;	} ; link->x.opnum = idep_num;
  link->next = head.rs->odep_list[head.odep_num];
  head.rs->odep_list[head.odep_num] = link;
}

 
static inline  void
ruu_install_odep(struct RUU_station *rs,	 
		 int odep_num,			 
		 int odep_name)			 
{
  struct CV_link cv;

   
  if (odep_name == 0 )
    {
       
      rs->onames[odep_num] = 0 ;
      return;
    }
   

   
  rs->onames[odep_num] = odep_name;

   
  rs->odep_list[odep_num] = ((void *)0) ;

   
  (( cv ).rs = (  rs ), ( cv ).odep_num = (  odep_num )) ;
  (spec_mode ? (((( use_spec_cv )[(  ( odep_name ) )/32] |= (1 << ((  ( odep_name ) ) % 32))), ( use_spec_cv )) ,	spec_create_vector[ odep_name ] = (  cv )) : (create_vector[ odep_name ] = (  cv ))) ;
}


 



 




 




 







 



 


 



 





 









 









 
















 


 




 








































































 







































































































































 
 

 



 
 
 
 
 
 
 
 
 
 
 
 

 








 
 
 
 
 
 
 
 
 
 

 
 
 
 
 
 
 
 
 

 

 
 
 
 
 
 
 
 
 

 
 
 
 
 
 
 


 
 
 
 
 
 
 
 
 
 


 



 
 
 
 

 
 

 
 
 
 

 
 
 
 

 
 
 
 
 
 
 
 

 
 
 
 
 
 

 
 
 
 


 



 
 
 
 
 
 
 
 
 
 
 
 
 
 

 
 
 
 
 
 

 
 
 
 
 
 

 
 


 



 
 
 

 
 
 
 
 
 



 



 


static void
InstSRA(SS_INST_TYPE inst)
{
  unsigned int i;

   


  if ((((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  & 020000000000) {
    (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ))) ;
    for (i = 0; i < (inst.b & 0xff) ; i++) {
      (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  ((((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  >> 1) | 020000000000 )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  ((((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  >> 1) | 020000000000 ))) ;
    }
  }
  else {
    (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  >> (inst.b & 0xff)  )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  >> (inst.b & 0xff)  ))) ;
  }
}

 


static void
InstSRAV(SS_INST_TYPE inst)
{
  unsigned int i;
  unsigned int shamt = (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  & 037;

  if ((((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  & 020000000000) {
    (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ))) ;
    for (i = 0; i < shamt; i++) {
      (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  ((((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  >> 1) | 020000000000 )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  ((((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  >> 1) | 020000000000 ))) ;
    }
  }
  else {
    (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  >> shamt )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  >> shamt ))) ;
  }
}

 


static void
InstMULT(SS_INST_TYPE inst)
{
  int sign1, sign2;
  int i, op1, op2;

  sign1 = sign2 = 0;
  (spec_mode ? (use_spec_HI= 1 , spec_regs_HI = ( 0 )) : (regs_HI = ( 0 ))) ;
  (spec_mode ? (use_spec_LO= 1 , spec_regs_LO = ( 0 )) : (regs_LO = ( 0 ))) ;
  op1 = (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ]) ;
  op2 = (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ;

   

  if (op1 & 020000000000) {
    sign1 = 1;
    op1 = (~op1) + 1;
  }
  if (op2 & 020000000000) {
    sign2 = 1;
    op2 = (~op2) + 1;
  }
  if (op1 & 020000000000)
    (spec_mode ? (use_spec_LO= 1 , spec_regs_LO = ( op2 )) : (regs_LO = ( op2 ))) ;
  for (i = 0; i < 31; i++) {
    (spec_mode ? (use_spec_HI= 1 , spec_regs_HI = ( (use_spec_HI ? spec_regs_HI : regs_HI)  << 1 )) : (regs_HI = ( (use_spec_HI ? spec_regs_HI : regs_HI)  << 1 ))) ;
    (spec_mode ? (use_spec_HI= 1 , spec_regs_HI = ( (use_spec_HI ? spec_regs_HI : regs_HI)  + extractl((use_spec_LO ? spec_regs_LO : regs_LO) , 31, 1) )) : (regs_HI = ( (use_spec_HI ? spec_regs_HI : regs_HI)  + extractl((use_spec_LO ? spec_regs_LO : regs_LO) , 31, 1) ))) ;
    (spec_mode ? (use_spec_LO= 1 , spec_regs_LO = ( (use_spec_LO ? spec_regs_LO : regs_LO)  << 1 )) : (regs_LO = ( (use_spec_LO ? spec_regs_LO : regs_LO)  << 1 ))) ;
    if ((extractl(op1, 30-i, 1)) == 1) {
      if (((unsigned)037777777777 - (unsigned)(use_spec_LO ? spec_regs_LO : regs_LO) ) < (unsigned)op2) {
	(spec_mode ? (use_spec_HI= 1 , spec_regs_HI = ( (use_spec_HI ? spec_regs_HI : regs_HI)  + 1 )) : (regs_HI = ( (use_spec_HI ? spec_regs_HI : regs_HI)  + 1 ))) ;
      }
      (spec_mode ? (use_spec_LO= 1 , spec_regs_LO = ( (use_spec_LO ? spec_regs_LO : regs_LO)  + op2 )) : (regs_LO = ( (use_spec_LO ? spec_regs_LO : regs_LO)  + op2 ))) ;
    }
  }

   
  if (sign1 ^ sign2) {
    (spec_mode ? (use_spec_LO= 1 , spec_regs_LO = ( ~(use_spec_LO ? spec_regs_LO : regs_LO)  )) : (regs_LO = ( ~(use_spec_LO ? spec_regs_LO : regs_LO)  ))) ;
    (spec_mode ? (use_spec_HI= 1 , spec_regs_HI = ( ~(use_spec_HI ? spec_regs_HI : regs_HI)  )) : (regs_HI = ( ~(use_spec_HI ? spec_regs_HI : regs_HI)  ))) ;
    if ((unsigned)(use_spec_LO ? spec_regs_LO : regs_LO)  == 037777777777) {
      (spec_mode ? (use_spec_HI= 1 , spec_regs_HI = ( (use_spec_HI ? spec_regs_HI : regs_HI)  + 1 )) : (regs_HI = ( (use_spec_HI ? spec_regs_HI : regs_HI)  + 1 ))) ;
    }
    (spec_mode ? (use_spec_LO= 1 , spec_regs_LO = ( (use_spec_LO ? spec_regs_LO : regs_LO)  + 1 )) : (regs_LO = ( (use_spec_LO ? spec_regs_LO : regs_LO)  + 1 ))) ;
  }
}

 


static void
InstMULTU(SS_INST_TYPE inst)
{
  int i;

  (spec_mode ? (use_spec_HI= 1 , spec_regs_HI = ( 0 )) : (regs_HI = ( 0 ))) ;
  (spec_mode ? (use_spec_LO= 1 , spec_regs_LO = ( 0 )) : (regs_LO = ( 0 ))) ;
  if ((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  & 020000000000)
    (spec_mode ? (use_spec_LO= 1 , spec_regs_LO = ( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )) : (regs_LO = ( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ))) ;
  for (i = 0; i < 31; i++) {
    (spec_mode ? (use_spec_HI= 1 , spec_regs_HI = ( (use_spec_HI ? spec_regs_HI : regs_HI)  << 1 )) : (regs_HI = ( (use_spec_HI ? spec_regs_HI : regs_HI)  << 1 ))) ;
    (spec_mode ? (use_spec_HI= 1 , spec_regs_HI = ( (use_spec_HI ? spec_regs_HI : regs_HI)  + extractl((use_spec_LO ? spec_regs_LO : regs_LO) , 31, 1) )) : (regs_HI = ( (use_spec_HI ? spec_regs_HI : regs_HI)  + extractl((use_spec_LO ? spec_regs_LO : regs_LO) , 31, 1) ))) ;
    (spec_mode ? (use_spec_LO= 1 , spec_regs_LO = ( (use_spec_LO ? spec_regs_LO : regs_LO)  << 1 )) : (regs_LO = ( (use_spec_LO ? spec_regs_LO : regs_LO)  << 1 ))) ;
    if ((extractl((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ]) , 30-i, 1)) == 1) {
      if (((unsigned)037777777777 - (unsigned)(use_spec_LO ? spec_regs_LO : regs_LO) ) < (unsigned)(((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) {
	(spec_mode ? (use_spec_HI= 1 , spec_regs_HI = ( (use_spec_HI ? spec_regs_HI : regs_HI)  + 1 )) : (regs_HI = ( (use_spec_HI ? spec_regs_HI : regs_HI)  + 1 ))) ;
      }
      (spec_mode ? (use_spec_LO= 1 , spec_regs_LO = ( (use_spec_LO ? spec_regs_LO : regs_LO)  + (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )) : (regs_LO = ( (use_spec_LO ? spec_regs_LO : regs_LO)  + (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ))) ;
    }
  }
}









 
static char *					 
simoo_reg_obj(enum dlite_access_t at,		 
	      enum dlite_reg_t rt,		 
	      int reg,				 
	      union dlite_reg_val_t *val)	 
{
  if (reg < 0 || reg >= 32 )
    return "register number out of range";

  if (at == at_read || at == at_write)
    {
      switch (rt)
	{
	case rt_gpr:
	  if (at == at_read)
	    val->as_word = (((( use_spec_R )[(  ( reg ) )/32] & (1 << ((  ( reg ) ) % 32))) != 0) 	? spec_regs_R[ reg ] : regs_R[ reg ]) ;
	  else
	    (spec_mode ? (((( use_spec_R )[(  ( reg ) )/32] |= (1 << ((  ( reg ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ reg ] = (  val->as_word )) : (regs_R[ reg ] = (  val->as_word ))) ;
	  break;
	case rt_lpr:
	  if (at == at_read)
	    val->as_word = (((( use_spec_F )[(  (( reg )&~1) )/32] & (1 << ((  (( reg )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( reg )] : regs_F.l[( reg )]) ;
	  else
	    (spec_mode ? (((( use_spec_F )[( (( reg )&~1) )/32] |= (1 << (( (( reg )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.l[( reg )] = (  val->as_word )) : (regs_F.l[( reg )] = (  val->as_word ))) ;
	  break;
	case rt_fpr:
	  if (at == at_read)
	    val->as_float = (((( use_spec_F )[(  (( reg )&~1) )/32] & (1 << ((  (( reg )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( reg )] : regs_F.f[( reg )]) ;
	  else
	    (spec_mode ? (((( use_spec_F )[( (( reg )&~1) )/32] |= (1 << (( (( reg )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.f[( reg )] = (  val->as_float )) : (regs_F.f[( reg )] = (  val->as_float ))) ;
	  break;
	case rt_dpr:
	   
	  if (reg < 0 || reg >= 32 /2)
	    return "register number out of range";

	  if (at == at_read)
	    val->as_double = (((( use_spec_F )[(  (( reg * 2 )&~1) )/32] & (1 << ((  (( reg * 2 )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( reg * 2 ) >> 1] : regs_F.d[( reg * 2 ) >> 1]) ;
	  else
	    (spec_mode ? (((( use_spec_F )[( (( reg * 2 )&~1) )/32] |= (1 << (( (( reg * 2 )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.d[( reg * 2 ) >> 1] = (  val->as_double )) : (regs_F.d[( reg * 2 ) >> 1] = (  val->as_double ))) ;
	  break;
	case rt_hi:
	  if (at == at_read)
	    val->as_word = (use_spec_HI ? spec_regs_HI : regs_HI) ;
	  else
	    (spec_mode ? (use_spec_HI= 1 , spec_regs_HI = ( val->as_word )) : (regs_HI = ( val->as_word ))) ;
	  break;
	case rt_lo:
	  if (at == at_read)
	    val->as_word = (use_spec_LO ? spec_regs_LO : regs_LO) ;
	  else
	    (spec_mode ? (use_spec_LO= 1 , spec_regs_LO = ( val->as_word )) : (regs_LO = ( val->as_word ))) ;
	  break;
	case rt_FCC:
	  if (at == at_read)
	    val->as_condition = (use_spec_FCC ? spec_regs_FCC : regs_FCC) ;
	  else
	    (spec_mode ? (use_spec_FCC= 1 , spec_regs_FCC = ( val->as_condition )) : (regs_FCC = ( val->as_condition ))) ;
	  break;
	case rt_PC:
	  if (at == at_read)
	    val->as_address = regs_PC;
	  else
	    regs_PC = val->as_address;
	  break;
	default:
	  _panic("sim-outorder.c", __FUNCTION__, 3315,  "bogus register bank"  ) ;
	}
    }
  else
    _panic("sim-outorder.c", __FUNCTION__, 3319,  "bogus access type"  ) ;

   
  return ((void *)0) ;
}

 


 

static struct RS_link last_op = { ((void *)0) , ((void *)0) , 0 } ;

 


static void
ruu_dispatch(void)
{
  int i;
  int n_dispatched;                      
  SS_INST_TYPE inst;                     
  enum ss_opcode op;                     
  int out1, out2, in1, in2, in3;         
  SS_ADDR_TYPE next_PC;                  
  SS_ADDR_TYPE addr;                     
  struct RUU_station *rs;                
  struct RUU_station *lsq;               
  struct bpred_btb_ent *update_ptr;	 
  unsigned int pseq;			 
  int no_ea_dep;                         
  int is_write;				 
  int made_check;			 
  unsigned int temp_uint;		 
  signed short temp_short;		 
  unsigned short temp_ushort;		 
  signed char temp_char;		 
  unsigned char temp_uchar;		 

  made_check = 0 ;
  n_dispatched = 0;
  while ( 
	 n_dispatched < ruu_decode_width
	  
	 && RUU_num < RUU_size && LSQ_num < LSQ_size
	  
	 && fetch_num != 0
	  
	 && (ruu_include_spec || !spec_mode))
    {
       
      if (ruu_inorder_issue
	  && (last_op.rs && (( &last_op )->tag == ( &last_op )->rs->tag) 
	      && ! (( last_op.rs )->idep_ready[0] && ( last_op.rs )->idep_ready[1] && ( last_op.rs )->idep_ready[2]) ))
	{
	   
	  break;
	}

       
      inst = fetch_data[fetch_head].IR;
      regs_PC = fetch_data[fetch_head].regs_PC;
      pred_PC = fetch_data[fetch_head].pred_PC;
      update_ptr = fetch_data[fetch_head].update_ptr;
      pseq = fetch_data[fetch_head].ptrace_seq;

       
      op = ( inst .a & 0xff) ;

       
      next_PC = regs_PC + sizeof(SS_INST_TYPE);

       
      if ((ss_op2flags[ op ])  & 0x00000800 )
	{
	  if (RUU_num != 0)
	    break;

	   

	  if (spec_mode)
	    _panic("sim-outorder.c", __FUNCTION__, 3400,  "drained and speculative"  ) ;
	}

       
      regs_R[0] = 0; spec_regs_R[0] = 0;

       
      addr = 0; is_write = 0 ;

       
      switch (op)
	{

 




 










 
 










 








































































 







































































































































 
case  NOP :	out1 =  
	0  ; out2 =   0  ;	in1 =  		0  ; in2 =   0  ; in3 =   0  ;	 
	 ((void) 0) ;	break; 

 



case  JUMP :	out1 =  
	(0)  ; out2 =   (0)  ;	in1 =   		(0)  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(next_PC = ( ((regs_PC)  & 036000000000) | ((inst.b & 0x3ffffff)  << 2) ))  ;	break; 
case  JAL :	out1 =  
	( 31 )  ; out2 =   (0)  ;	in1 =  	 	(0)  ; in2 =   (0)  ; in3 =   (0)  ;	 
	((next_PC = ( ((regs_PC)  & 036000000000) | ((inst.b & 0x3ffffff)  << 2) )) , (spec_mode ? (((( use_spec_R )[(  ( 31 ) )/32] |= (1 << ((  ( 31 ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ 31 ] = (  (regs_PC)  + 8 )) : (regs_R[ 31 ] = (  (regs_PC)  + 8 ))) ) ;	break; 
case  JR :	out1 =  
	(0)  ; out2 =   (0)  ;	in1 =  		( (inst.b >> 24)  )  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(((( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) & 0x7)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 235,   "bad jump alignment"   ) )  : (void)0) , (next_PC = ( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  )) ) ;	break; 
case  JALR :	out1 =  
	( ((inst.b >> 8) & 0xff)  )  ; out2 =   (0)  ;	in1 =  		( (inst.b >> 24)  )  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(((( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) & 0x7)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 240,   "bad jump alignment"   ) )  : (void)0) , (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (regs_PC)  + 8 )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (regs_PC)  + 8 ))) , (next_PC = ( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  )) ) ;	break; 
case  BEQ :	out1 =  
	(0)  ; out2 =   (0)  ;	in1 =  		( (inst.b >> 24)  )  ; in2 =   ( ((inst.b >> 16) & 0xff)  )  ; in3 =   (0)  ;	 
	((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  == (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) ? (next_PC = ( (regs_PC)  + 8 + (((int)(( short)(inst.b & 0xffff)))   << 2) ))  : 0 ;	break; 
case  BNE :	out1 =  
	(0)  ; out2 =   (0)  ;	in1 =  		( (inst.b >> 24)  )  ; in2 =   ( ((inst.b >> 16) & 0xff)  )  ; in3 =   (0)  ;	 
	((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  != (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) ? (next_PC = ( (regs_PC)  + 8 + (((int)(( short)(inst.b & 0xffff)))   << 2) ))  : 0 ;	break; 
case  BLEZ :	out1 =  
	(0)  ; out2 =   (0)  ;	in1 =  		( (inst.b >> 24)  )  ; in2 =   (0)  ; in3 =   (0)  ;	 
	((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  <= 0) ? (next_PC = ( (regs_PC)  + 8 + (((int)(( short)(inst.b & 0xffff)))   << 2) ))  : 0 ;	break; 
case  BGTZ :	out1 =  
	(0)  ; out2 =   (0)  ;	in1 =  		( (inst.b >> 24)  )  ; in2 =   (0)  ; in3 =   (0)  ;	 
	((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  > 0) ? (next_PC = ( (regs_PC)  + 8 + (((int)(( short)(inst.b & 0xffff)))   << 2) ))  : 0 ;	break; 
case  BLTZ :	out1 =  
	(0)  ; out2 =   (0)  ;	in1 =  		( (inst.b >> 24)  )  ; in2 =   (0)  ; in3 =   (0)  ;	 
	((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  < 0) ? (next_PC = ( (regs_PC)  + 8 + (((int)(( short)(inst.b & 0xffff)))   << 2) ))  : 0 ;	break; 
case  BGEZ :	out1 =  
	(0)  ; out2 =   (0)  ;	in1 =  		( (inst.b >> 24)  )  ; in2 =   (0)  ; in3 =   (0)  ;	 
	((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  >= 0) ? (next_PC = ( (regs_PC)  + 8 + (((int)(( short)(inst.b & 0xffff)))   << 2) ))  : 0 ;	break; 
case  BC1F :	out1 =  
	(0)  ; out2 =   (0)  ;	in1 =  		(2+32+32)  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(! (use_spec_FCC ? spec_regs_FCC : regs_FCC) ) ? (next_PC = ( (regs_PC)  + 8 + (((int)(( short)(inst.b & 0xffff)))   << 2) ))  : 0 ;	break; 
case  BC1T :	out1 =  
	(0)  ; out2 =   (0)  ;	in1 =  		(2+32+32)  ; in2 =   (0)  ; in3 =   (0)  ;	 
	((use_spec_FCC ? spec_regs_FCC : regs_FCC) ) ? (next_PC = ( (regs_PC)  + 8 + (((int)(( short)(inst.b & 0xffff)))   << 2) ))  : 0 ;	break; 

 








case  LB :	out1 =  
	( ((inst.b >> 16) & 0xff)  )  ; out2 =   (((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ;	in1 =  	(0)  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   (0)  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_char   ,	sizeof( temp_char   ))	: mem_access(Read, addr,  &temp_char   ,	sizeof( temp_char   ))),	((unsigned int)(( signed int ) temp_char   )))   )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_char   ,	sizeof( temp_char   ))	: mem_access(Read, addr,  &temp_char   ,	sizeof( temp_char   ))),	((unsigned int)(( signed int ) temp_char   )))   )))  ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 
case  LBU :	out1 =  
	( ((inst.b >> 16) & 0xff)  )  ; out2 =   (((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ;	in1 =  	(0)  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   (0)  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uchar   ,	sizeof( temp_uchar   ))	: mem_access(Read, addr,  &temp_uchar   ,	sizeof( temp_uchar   ))),	((unsigned int)(( unsigned int ) temp_uchar   )))   )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uchar   ,	sizeof( temp_uchar   ))	: mem_access(Read, addr,  &temp_uchar   ,	sizeof( temp_uchar   ))),	((unsigned int)(( unsigned int ) temp_uchar   )))   )))  ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 
case  LH :	out1 =  
	( ((inst.b >> 16) & 0xff)  )  ; out2 =   (((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ;	in1 =  	(0)  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   (0)  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_short   ,	sizeof( temp_short   ))	: mem_access(Read, addr,  &temp_short   ,	sizeof( temp_short   ))),	((unsigned int)(( signed int ) temp_short   )))   )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_short   ,	sizeof( temp_short   ))	: mem_access(Read, addr,  &temp_short   ,	sizeof( temp_short   ))),	((unsigned int)(( signed int ) temp_short   )))   )))  ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 
case  LHU :	out1 =  
	( ((inst.b >> 16) & 0xff)  )  ; out2 =   (((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ;	in1 =  	(0)  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   (0)  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_ushort   ,	sizeof( temp_ushort   ))	: mem_access(Read, addr,  &temp_ushort   ,	sizeof( temp_ushort   ))),	((unsigned int)(( unsigned int ) temp_ushort   )))   )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_ushort   ,	sizeof( temp_ushort   ))	: mem_access(Read, addr,  &temp_ushort   ,	sizeof( temp_ushort   ))),	((unsigned int)(( unsigned int ) temp_ushort   )))   )))  ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 
case  LW :	out1 =  
	( ((inst.b >> 16) & 0xff)  )  ; out2 =   (((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ;	in1 =  	(0)  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   (0)  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )))  ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 
case  DLW :	out1 =  
	(( ((inst.b >> 16) & 0xff)  )&~1)  ; out2 =   (((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ;	in1 =  	(0)  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   (0)  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( ( 
		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (((( ((inst.b >> 16) & 0xff)  ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 323,   "bad INT register alignment"   ) )  : (void)0) , temp_bs = (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) ,
		 (spec_mode ? (((( use_spec_R )[(  ( (((inst.b >> 16) & 0xff) )^sim_swap_words ) )/32] |= (1 << ((  ( (((inst.b >> 16) & 0xff) )^sim_swap_words ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (((inst.b >> 16) & 0xff) )^sim_swap_words ] = (  (addr = (  ( temp_bs+ ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )) : (regs_R[ (((inst.b >> 16) & 0xff) )^sim_swap_words ] = (  (addr = (  ( temp_bs+ ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   ))) ,
		 (spec_mode ? (((( use_spec_R )[(  ( ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ) )/32] |= (1 << ((  ( ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ] = (  (addr = (  ( temp_bs+ ((int)(( short)(inst.b & 0xffff)))  +4 ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )) : (regs_R[ ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ] = (  (addr = (  ( temp_bs+ ((int)(( short)(inst.b & 0xffff)))  +4 ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   ))) ) ),	(spec_mode ? (((( use_spec_R )[(  ( (  		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 
case  L_S :	out1 =  
	((( ((inst.b >> 16) & 0xff)   )+32)&~1)  ; out2 =   (((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ;	in1 =  	(0)  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   (0)  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 16) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.l[( ((inst.b >> 16) & 0xff)   )] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )) : (regs_F.l[( ((inst.b >> 16) & 0xff)   )] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )))  ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 
case  L_D :	out1 =  
	((( ((inst.b >> 16) & 0xff)   )+32)&~1)  ; out2 =   (((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ;	in1 =  	(0)  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   (0)  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( ( 
		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 336,   "bad FP register alignment"   ) )  : (void)0) ,
		 (spec_mode ? (((( use_spec_F )[( (( (((inst.b >> 16) & 0xff)  )^sim_swap_words )&~1) )/32] |= (1 << (( (( (((inst.b >> 16) & 0xff)  )^sim_swap_words )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.l[( (((inst.b >> 16) & 0xff)  )^sim_swap_words )] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )) : (regs_F.l[( (((inst.b >> 16) & 0xff)  )^sim_swap_words )] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   ))) ,
		 (spec_mode ? (((( use_spec_F )[( (( ((((inst.b >> 16) & 0xff)  )+1)^sim_swap_words )&~1) )/32] |= (1 << (( (( ((((inst.b >> 16) & 0xff)  )+1)^sim_swap_words )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.l[( ((((inst.b >> 16) & 0xff)  )+1)^sim_swap_words )] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))  +4 ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )) : (regs_F.l[( ((((inst.b >> 16) & 0xff)  )+1)^sim_swap_words )] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))  +4 ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   ))) ) ),	(spec_mode ? (((( use_spec_R )[(  ( (  		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 
case  LWL :	out1 =  
	( ((inst.b >> 16) & 0xff)  )  ; out2 =   (0)  ;	in1 =  		(0)  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   (0)  ;	 
	( 
	  temp_bs = (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) ,
	 ss_lr_temp = (addr = (  ( (( temp_bs+ ((int)(( short)(inst.b & 0xffff)))   ) & ~0x03)  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))  ,
	 (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  & (ss_lr_masks[4- (4-((  temp_bs+ ((int)(( short)(inst.b & 0xffff)))    ) & 0x03)) ]) ) |
		      (ss_lr_temp & ~(ss_lr_masks[4- (4-((  temp_bs+ ((int)(( short)(inst.b & 0xffff)))    ) & 0x03)) ]) )) )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  & (ss_lr_masks[4- (4-((  temp_bs+ ((int)(( short)(inst.b & 0xffff)))    ) & 0x03)) ]) ) | 		      (ss_lr_temp & ~(ss_lr_masks[4- (4-((  temp_bs+ ((int)(( short)(inst.b & 0xffff)))    ) & 0x03)) ]) )) ))) ) ;	break; 
case  LWR :	out1 =  
	( ((inst.b >> 16) & 0xff)  )  ; out2 =   (0)  ;	in1 =  		(0)  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   (0)  ;	 
	( 
	  temp_bs = (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) ,
	 ss_lr_temp = (addr = (  ( (( temp_bs+ ((int)(( short)(inst.b & 0xffff)))   ) & ~0x03)  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))  ,
	 (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  & (~(ss_lr_masks[(((  temp_bs+ ((int)(( short)(inst.b & 0xffff)))    ) & 0x03)+1) ])) ) |
		      (ss_lr_temp & ~(~(ss_lr_masks[(((  temp_bs+ ((int)(( short)(inst.b & 0xffff)))    ) & 0x03)+1) ])) )) )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  & (~(ss_lr_masks[(((  temp_bs+ ((int)(( short)(inst.b & 0xffff)))    ) & 0x03)+1) ])) ) | 		      (ss_lr_temp & ~(~(ss_lr_masks[(((  temp_bs+ ((int)(( short)(inst.b & 0xffff)))    ) & 0x03)+1) ])) )) ))) ) ;	break; 

case  SB :	out1 =  
	(((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ; out2 =   (0)  ;	in1 =  	 	( ((inst.b >> 16) & 0xff)  )  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   (0)  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	 temp_uchar    = (  unsigned char )((unsigned int)( ( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uchar   ,	sizeof( temp_uchar   ))	: mem_access(Write, addr,  &temp_uchar   ,	sizeof( temp_uchar   ))))   ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 
case  SH :	out1 =  
	(((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ; out2 =   (0)  ;	in1 =  	 	( ((inst.b >> 16) & 0xff)  )  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   (0)  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	 temp_ushort    = (  unsigned short )((unsigned int)( ( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_ushort   ,	sizeof( temp_ushort   ))	: mem_access(Write, addr,  &temp_ushort   ,	sizeof( temp_ushort   ))))   ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 
case  SW :	out1 =  
	(((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ; out2 =   (0)  ;	in1 =  	 	( ((inst.b >> 16) & 0xff)  )  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   (0)  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))   ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 
case  DSW :	out1 =  
	(((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ; out2 =   (0)  ;	in1 =  		(( ((inst.b >> 16) & 0xff)  )&~1)  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   (0)  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( ( 
		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (((( ((inst.b >> 16) & 0xff)  ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 378,   "bad INT register alignment"   ) )  : (void)0) ,
		 (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_R )[(  ( (((inst.b >> 16) & 0xff) )^sim_swap_words ) )/32] & (1 << ((  ( (((inst.b >> 16) & 0xff) )^sim_swap_words ) ) % 32))) != 0) 	? spec_regs_R[ (((inst.b >> 16) & 0xff) )^sim_swap_words ] : regs_R[ (((inst.b >> 16) & 0xff) )^sim_swap_words ])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))  ,
		 (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))  +4 ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_R )[(  ( ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ) )/32] & (1 << ((  ( ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ) ) % 32))) != 0) 	? spec_regs_R[ ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ] : regs_R[ ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))  ) ),	(spec_mode ? (((( use_spec_R )[(  ( (  		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 
case  DSZ :	out1 =  
	(((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ; out2 =   (0)  ;	in1 =  		(0)  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   (0)  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( ( 
		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( ((addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_R )[(  ( 0 ) )/32] & (1 << ((  ( 0 ) ) % 32))) != 0) 	? spec_regs_R[ 0 ] : regs_R[ 0 ])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))  ,
		 (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))  +4 ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_R )[(  ( 0 ) )/32] & (1 << ((  ( 0 ) ) % 32))) != 0) 	? spec_regs_R[ 0 ] : regs_R[ 0 ])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))  ) ),	(spec_mode ? (((( use_spec_R )[(  ( (  		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 
case  S_S :	out1 =  
	(((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ; out2 =   (0)  ;	in1 =  		((( ((inst.b >> 16) & 0xff)   )+32)&~1)  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   (0)  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( ((inst.b >> 16) & 0xff)   )] : regs_F.l[( ((inst.b >> 16) & 0xff)   )])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))   ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 
case  S_D :	out1 =  
	(((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ; out2 =   (0)  ;	in1 =  		((( ((inst.b >> 16) & 0xff)   )+32)&~1)  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   (0)  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( ( 
		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 398,   "bad FP register alignment"   ) )  : (void)0) ,
		 (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( ((inst.b >> 16) & 0xff)   )] : regs_F.l[( ((inst.b >> 16) & 0xff)   )])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))  ,
		 (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))  +4 ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_F )[(  (( (((inst.b >> 16) & 0xff)  )+1 )&~1) )/32] & (1 << ((  (( (((inst.b >> 16) & 0xff)  )+1 )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( (((inst.b >> 16) & 0xff)  )+1 )] : regs_F.l[( (((inst.b >> 16) & 0xff)  )+1 )])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))  ) ),	(spec_mode ? (((( use_spec_R )[(  ( (  		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 
case  SWL :	out1 =  
	(0)  ; out2 =   (0)  ;	in1 =  		( ((inst.b >> 16) & 0xff)  )  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   (0)  ;	 
	( 
	 ss_lr_temp = (addr = (  ( (( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) & ~0x03)  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))  ,
	 ss_lr_temp = (((((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  & ~(ss_lr_masks[4- (4-((  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))    ) & 0x03)) ]) ) |
		       (ss_lr_temp & (ss_lr_masks[4- (4-((  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))    ) & 0x03)) ]) )),
	 (addr = (  (  (( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) & ~0x03)  ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( ss_lr_temp ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))  ) ;	break; 
case  SWR :	out1 =  
	(0)  ; out2 =   (0)  ;	in1 =  		( ((inst.b >> 16) & 0xff)  )  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   (0)  ;	 
	( 
	 ss_lr_temp = (addr = (  ( (( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) & ~0x03)  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))  ,
	 ss_lr_temp = (((((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  & ~(~(ss_lr_masks[(((  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))    ) & 0x03)+1) ])) ) |
		       (ss_lr_temp & (~(ss_lr_masks[(((  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))    ) & 0x03)+1) ])) )),
	 (addr = (  (  (( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) & ~0x03)  ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( ss_lr_temp ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))  ) ;	break; 

 

case  LB_RR :	out1 =  
	( ((inst.b >> 16) & 0xff)  )  ; out2 =   (((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ;	in1 =  	(0)  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   ( ((inst.b >> 8) & 0xff)  )  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_char   ,	sizeof( temp_char   ))	: mem_access(Read, addr,  &temp_char   ,	sizeof( temp_char   ))),	((unsigned int)(( signed int ) temp_char   )))   )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_char   ,	sizeof( temp_char   ))	: mem_access(Read, addr,  &temp_char   ,	sizeof( temp_char   ))),	((unsigned int)(( signed int ) temp_char   )))   )))  ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 
case  LBU_RR :	out1 =  
	( ((inst.b >> 16) & 0xff)  )  ; out2 =   (((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ;	in1 =  	(0)  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   ( ((inst.b >> 8) & 0xff)  )  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uchar   ,	sizeof( temp_uchar   ))	: mem_access(Read, addr,  &temp_uchar   ,	sizeof( temp_uchar   ))),	((unsigned int)(( unsigned int ) temp_uchar   )))   )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uchar   ,	sizeof( temp_uchar   ))	: mem_access(Read, addr,  &temp_uchar   ,	sizeof( temp_uchar   ))),	((unsigned int)(( unsigned int ) temp_uchar   )))   )))  ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 
case  LH_RR :	out1 =  
	( ((inst.b >> 16) & 0xff)  )  ; out2 =   (((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ;	in1 =  	(0)  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   ( ((inst.b >> 8) & 0xff)  )  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_short   ,	sizeof( temp_short   ))	: mem_access(Read, addr,  &temp_short   ,	sizeof( temp_short   ))),	((unsigned int)(( signed int ) temp_short   )))   )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_short   ,	sizeof( temp_short   ))	: mem_access(Read, addr,  &temp_short   ,	sizeof( temp_short   ))),	((unsigned int)(( signed int ) temp_short   )))   )))  ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 
case  LHU_RR :	out1 =  
	( ((inst.b >> 16) & 0xff)  )  ; out2 =   (((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ;	in1 =  	(0)  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   ( ((inst.b >> 8) & 0xff)  )  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_ushort   ,	sizeof( temp_ushort   ))	: mem_access(Read, addr,  &temp_ushort   ,	sizeof( temp_ushort   ))),	((unsigned int)(( unsigned int ) temp_ushort   )))   )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_ushort   ,	sizeof( temp_ushort   ))	: mem_access(Read, addr,  &temp_ushort   ,	sizeof( temp_ushort   ))),	((unsigned int)(( unsigned int ) temp_ushort   )))   )))  ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 
case  LW_RR :	out1 =  
	( ((inst.b >> 16) & 0xff)  )  ; out2 =   (((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ;	in1 =  	(0)  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   ( ((inst.b >> 8) & 0xff)  )  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )))  ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 
case  DLW_RR :	out1 =  
	(( ((inst.b >> 16) & 0xff)  )&~1)  ; out2 =   (((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ;	in1 =  	(0)  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   ( ((inst.b >> 8) & 0xff)  )  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( ( 
		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (((( ((inst.b >> 16) & 0xff)  ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 454,   "bad INT register alignment"   ) )  : (void)0) ,
		 temp_bs = (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) , temp_rd = (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ]) ,
		 (spec_mode ? (((( use_spec_R )[(  ( (((inst.b >> 16) & 0xff) )^sim_swap_words ) )/32] |= (1 << ((  ( (((inst.b >> 16) & 0xff) )^sim_swap_words ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (((inst.b >> 16) & 0xff) )^sim_swap_words ] = (  (addr = (  ( temp_bs+temp_rd ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )) : (regs_R[ (((inst.b >> 16) & 0xff) )^sim_swap_words ] = (  (addr = (  ( temp_bs+temp_rd ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   ))) ,
		 (spec_mode ? (((( use_spec_R )[(  ( ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ) )/32] |= (1 << ((  ( ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ] = ( 
			 (addr = (  ( temp_bs+temp_rd+4 ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )) : (regs_R[ ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ] = (  			 (addr = (  ( temp_bs+temp_rd+4 ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   ))) ) ),	(spec_mode ? (((( use_spec_R )[(  ( (  		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 
case  L_S_RR :	out1 =  
	((( ((inst.b >> 16) & 0xff)   )+32)&~1)  ; out2 =   (((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ;	in1 =  	(0)  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   ( ((inst.b >> 8) & 0xff)  )  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 16) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.l[( ((inst.b >> 16) & 0xff)   )] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )) : (regs_F.l[( ((inst.b >> 16) & 0xff)   )] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )))  ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 
 
case  L_D_RR :	out1 =  
	((( ((inst.b >> 16) & 0xff)   )+32)&~1)  ; out2 =   (((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ;	in1 =  	(0)  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   ( ((inst.b >> 8) & 0xff)  )  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( ( 
		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 469,   "bad FP register alignment"   ) )  : (void)0) ,
		 (spec_mode ? (((( use_spec_F )[( (( (((inst.b >> 16) & 0xff)  )^sim_swap_words )&~1) )/32] |= (1 << (( (( (((inst.b >> 16) & 0xff)  )^sim_swap_words )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.l[( (((inst.b >> 16) & 0xff)  )^sim_swap_words )] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )) : (regs_F.l[( (((inst.b >> 16) & 0xff)  )^sim_swap_words )] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   ))) ,
		 (spec_mode ? (((( use_spec_F )[( (( ((((inst.b >> 16) & 0xff)  )+1)^sim_swap_words )&~1) )/32] |= (1 << (( (( ((((inst.b >> 16) & 0xff)  )+1)^sim_swap_words )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.l[( ((((inst.b >> 16) & 0xff)  )+1)^sim_swap_words )] = ( 
			   (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ]) +4 ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )) : (regs_F.l[( ((((inst.b >> 16) & 0xff)  )+1)^sim_swap_words )] = (  			   (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ]) +4 ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   ))) ) ),	(spec_mode ? (((( use_spec_R )[(  ( (  		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 

case  SB_RR :	out1 =  
	(((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ; out2 =   (0)  ;	in1 =   	( ((inst.b >> 16) & 0xff)  )  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   ( ((inst.b >> 8) & 0xff)  )  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	 temp_uchar    = (  unsigned char )((unsigned int)( ( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uchar   ,	sizeof( temp_uchar   ))	: mem_access(Write, addr,  &temp_uchar   ,	sizeof( temp_uchar   ))))   ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 
case  SH_RR :	out1 =  
	(((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ; out2 =   (0)  ;	in1 =  	 	( ((inst.b >> 16) & 0xff)  )  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   ( ((inst.b >> 8) & 0xff)  )  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	 temp_ushort    = (  unsigned short )((unsigned int)( ( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_ushort   ,	sizeof( temp_ushort   ))	: mem_access(Write, addr,  &temp_ushort   ,	sizeof( temp_ushort   ))))   ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 
case  SW_RR :	out1 =  
	(((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ; out2 =   (0)  ;	in1 =   	( ((inst.b >> 16) & 0xff)  )  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   ( ((inst.b >> 8) & 0xff)  )  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))   ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 
case  DSW_RR :	out1 =  
	(((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ; out2 =   (0)  ;	in1 =  		(( ((inst.b >> 16) & 0xff)  )&~1)  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   ( ((inst.b >> 8) & 0xff)  )  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( ( 
		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (((( ((inst.b >> 16) & 0xff)  ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 493,   "bad INT register alignment"   ) )  : (void)0) ,
		 (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_R )[(  ( (((inst.b >> 16) & 0xff) )^sim_swap_words ) )/32] & (1 << ((  ( (((inst.b >> 16) & 0xff) )^sim_swap_words ) ) % 32))) != 0) 	? spec_regs_R[ (((inst.b >> 16) & 0xff) )^sim_swap_words ] : regs_R[ (((inst.b >> 16) & 0xff) )^sim_swap_words ])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))  ,
		 (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ]) +4 ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_R )[(  ( ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ) )/32] & (1 << ((  ( ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ) ) % 32))) != 0) 	? spec_regs_R[ ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ] : regs_R[ ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))  ) ),	(spec_mode ? (((( use_spec_R )[(  ( (  		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 
case  DSZ_RR :	out1 =  
	(((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ; out2 =   (0)  ;	in1 =  		(0)  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   ( ((inst.b >> 8) & 0xff)  )  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( ( 
		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( ((addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_R )[(  ( 0 ) )/32] & (1 << ((  ( 0 ) ) % 32))) != 0) 	? spec_regs_R[ 0 ] : regs_R[ 0 ])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))  ,
		 (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ]) +4 ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_R )[(  ( 0 ) )/32] & (1 << ((  ( 0 ) ) % 32))) != 0) 	? spec_regs_R[ 0 ] : regs_R[ 0 ])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))  ) ),	(spec_mode ? (((( use_spec_R )[(  ( (  		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 
case  S_S_RR :	out1 =  
	(((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ; out2 =   (0)  ;	in1 =  		((( ((inst.b >> 16) & 0xff)   )+32)&~1)  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   ( ((inst.b >> 8) & 0xff)  )  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( ((inst.b >> 16) & 0xff)   )] : regs_F.l[( ((inst.b >> 16) & 0xff)   )])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))   ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 
case  S_D_RR :	out1 =  
	(((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ; out2 =   (0)  ;	in1 =  		((( ((inst.b >> 16) & 0xff)   )+32)&~1)  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   ( ((inst.b >> 8) & 0xff)  )  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( ( 
		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 514,   "bad FP register alignment"   ) )  : (void)0) ,
		 (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_F )[(  (( (((inst.b >> 16) & 0xff)  )^sim_swap_words )&~1) )/32] & (1 << ((  (( (((inst.b >> 16) & 0xff)  )^sim_swap_words )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( (((inst.b >> 16) & 0xff)  )^sim_swap_words )] : regs_F.l[( (((inst.b >> 16) & 0xff)  )^sim_swap_words )])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))  ,
		 (addr = (  ( 
			    (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ]) +4 ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_F )[(  (( ((((inst.b >> 16) & 0xff)  )+1)^sim_swap_words )&~1) )/32] & (1 << ((  (( ((((inst.b >> 16) & 0xff)  )+1)^sim_swap_words )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( ((((inst.b >> 16) & 0xff)  )+1)^sim_swap_words )] : regs_F.l[( ((((inst.b >> 16) & 0xff)  )+1)^sim_swap_words )])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))  ) ),	(spec_mode ? (((( use_spec_R )[(  ( (  		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 


 
 
case  L_S_RR_R2 :	out1 =  
	((( ((inst.b >> 16) & 0xff)   )+32)&~1)  ; out2 =   (((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ;	in1 =  	(0)  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   ( ((inst.b >> 8) & 0xff)  )  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 16) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.l[( ((inst.b >> 16) & 0xff)   )] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ]) +4 ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )) : (regs_F.l[( ((inst.b >> 16) & 0xff)   )] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ]) +4 ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )))  ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 
 
 
case  S_S_RR_R2 :	out1 =  
	(((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ; out2 =   (0)  ;	in1 =  		((( ((inst.b >> 16) & 0xff)   )+32)&~1)  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   ( ((inst.b >> 8) & 0xff)  )  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ]) +4 ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( ((inst.b >> 16) & 0xff)   )] : regs_F.l[( ((inst.b >> 16) & 0xff)   )])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))   ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 
 
case  LW_RR_R2 :	out1 =  
	( ((inst.b >> 16) & 0xff)  )  ; out2 =   (((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ;	in1 =  	(0)  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   ( ((inst.b >> 8) & 0xff)  )  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ]) +4 ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ]) +4 ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )))  ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 
 
case  SW_RR_R2 :	out1 =  
	(((inst.a & 0xff00) >> 8)  != 0x00  ? ( (inst.b >> 24)   ) : 0)  ; out2 =   (0)  ;	in1 =  		( ((inst.b >> 16) & 0xff)  )  ; in2 =   ( (inst.b >> 24)   )  ; in3 =   ( ((inst.b >> 8) & 0xff)  )  ;	 
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ]) +4 ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))   ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ;	break; 


 



case  ADD :	out1 =  
	( ((inst.b >> 8) & 0xff)  )  ; out2 =   (0)  ;	in1 =  		( (inst.b >> 24)  )  ; in2 =   ( ((inst.b >> 16) & 0xff)  )  ; in3 =   (0)  ;	 
	(((((( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) > 0) && (( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) > 0)	&& (0x7fffffff  - ( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) < ( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )))	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 553,   "+ overflow"   ) )  : (void)0),	(((( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) < 0) && (( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) < 0)	&& (- 0x7fffffff  - ( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) > ( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )))	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 553,   "+ underflow"   ) )  : (void)0)) , (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  + (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  + (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ))) ) ;	break; 
case  ADDI :	out1 =  
	( ((inst.b >> 16) & 0xff)  )  ; out2 =   (0)  ;	in1 =   		( (inst.b >> 24)  )  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(((((( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) > 0) && (( ((int)(( short)(inst.b & 0xffff)))  ) > 0)	&& (0x7fffffff  - ( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) < ( ((int)(( short)(inst.b & 0xffff)))  )))	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 558,   "+ overflow"   ) )  : (void)0),	(((( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) < 0) && (( ((int)(( short)(inst.b & 0xffff)))  ) < 0)	&& (- 0x7fffffff  - ( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) > ( ((int)(( short)(inst.b & 0xffff)))  )))	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 558,   "+ underflow"   ) )  : (void)0)) , (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  + ((int)(( short)(inst.b & 0xffff)))  )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  + ((int)(( short)(inst.b & 0xffff)))  ))) ) ;	break; 
case  ADDU :	out1 =  
	( ((inst.b >> 8) & 0xff)  )  ; out2 =   (0)  ;	in1 =  		( (inst.b >> 24)  )  ; in2 =   ( ((inst.b >> 16) & 0xff)  )  ; in3 =   (0)  ;	 
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  + (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  + (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )))  ;	break; 
case  ADDIU :	out1 =  
	( ((inst.b >> 16) & 0xff)  )  ; out2 =   (0)  ;	in1 =   		( (inst.b >> 24)  )  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  + ((int)(( short)(inst.b & 0xffff)))  )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  + ((int)(( short)(inst.b & 0xffff)))  )))  ;	break; 

case  SUB :	out1 =  
	( ((inst.b >> 8) & 0xff)  )  ; out2 =   (0)  ;	in1 =  		( (inst.b >> 24)  )  ; in2 =   ( ((inst.b >> 16) & 0xff)  )  ; in3 =   (0)  ;	 
	(((((( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) > 0) && (( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) < 0)	&& (0x7fffffff  + ( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) < ( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  )))	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 574,   "- overflow"   ) )  : (void)0),	(((( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) < 0) && (( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) > 0)	&& (- 0x7fffffff  + ( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) > ( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  )))	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 574,   "- underflow"   ) )  : (void)0)) , (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  - (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  - (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ))) ) ;	break; 
case  SUBU :	out1 =  
	( ((inst.b >> 8) & 0xff)  )  ; out2 =   (0)  ;	in1 =  		( (inst.b >> 24)  )  ; in2 =   ( ((inst.b >> 16) & 0xff)  )  ; in3 =   (0)  ;	 
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  - (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  - (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )))  ;	break; 

case  MULT :	out1 =  
	(0+32+32)  ; out2 =   (1+32+32)  ;	in1 =  		( ((inst.b >> 16) & 0xff)  )  ; in2 =   ( (inst.b >> 24)  )  ; in3 =   (0)  ;	 
	InstMULT(inst) ;	break; 
case  MULTU :	out1 =  
	(0+32+32)  ; out2 =   (1+32+32)  ;	in1 =  		( ((inst.b >> 16) & 0xff)  )  ; in2 =   ( (inst.b >> 24)  )  ; in3 =   (0)  ;	 
	InstMULTU(inst) ;	break; 
case  DIV :	out1 =  
	(0+32+32)  ; out2 =   (1+32+32)  ;	in1 =  		( ((inst.b >> 16) & 0xff)  )  ; in2 =   ( (inst.b >> 24)  )  ; in3 =   (0)  ;	 
	((spec_mode	?  (void)0	: ((( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) == 0) ? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 596,   "divide by 0"   ) )  : (void)0)) ,
	 (spec_mode ? (use_spec_LO= 1 , spec_regs_LO = ( (((  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) == 0) ? 0 : (( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) / (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )))  )) : (regs_LO = ( (((  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) == 0) ? 0 : (( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) / (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )))  ))) , (spec_mode ? (use_spec_HI= 1 , spec_regs_HI = ( (((  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) == 0) ? 0 : (( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) % (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )))  )) : (regs_HI = ( (((  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) == 0) ? 0 : (( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) % (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )))  ))) ) ;	break; 
case  DIVU :	out1 =  
	(0+32+32)  ; out2 =   (1+32+32)  ;	in1 =  		( ((inst.b >> 16) & 0xff)  )  ; in2 =   ( (inst.b >> 24)  )  ; in3 =   (0)  ;	 
	((spec_mode	?  (void)0	: ((( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) == 0) ? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 603,   "divide by 0"   ) )  : (void)0)) ,
	 (spec_mode ? (use_spec_LO= 1 , spec_regs_LO = ( (((  ((unsigned)(((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) ) == 0) ? 0 : (( ((unsigned)(((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ]) ) ) / (  ((unsigned)(((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) )))  )) : (regs_LO = ( (((  ((unsigned)(((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) ) == 0) ? 0 : (( ((unsigned)(((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ]) ) ) / (  ((unsigned)(((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) )))  ))) ,
	 (spec_mode ? (use_spec_HI= 1 , spec_regs_HI = ( (((  ((unsigned)(((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) ) == 0) ? 0 : (( ((unsigned)(((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ]) ) ) % (  ((unsigned)(((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) )))  )) : (regs_HI = ( (((  ((unsigned)(((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) ) == 0) ? 0 : (( ((unsigned)(((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ]) ) ) % (  ((unsigned)(((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) )))  ))) ) ;	break; 

case  MFHI :	out1 =  
	( ((inst.b >> 8) & 0xff)  )  ; out2 =   (0)  ;	in1 =  		(0+32+32)  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (use_spec_HI ? spec_regs_HI : regs_HI)  )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (use_spec_HI ? spec_regs_HI : regs_HI)  )))  ;	break; 
case  MTHI :	out1 =  
	(0+32+32)  ; out2 =   (0)  ;	in1 =  		( (inst.b >> 24)  )  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(spec_mode ? (use_spec_HI= 1 , spec_regs_HI = ( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  )) : (regs_HI = ( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  )))  ;	break; 
case  MFLO :	out1 =  
	( ((inst.b >> 8) & 0xff)  )  ; out2 =   (0)  ;	in1 =  		(1+32+32)  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (use_spec_LO ? spec_regs_LO : regs_LO)  )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (use_spec_LO ? spec_regs_LO : regs_LO)  )))  ;	break; 
case  MTLO :	out1 =  
	(1+32+32)  ; out2 =   (0)  ;	in1 =  		( (inst.b >> 24)  )  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(spec_mode ? (use_spec_LO= 1 , spec_regs_LO = ( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  )) : (regs_LO = ( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  )))  ;	break; 

 
case  AND_ :	out1 =  
	( ((inst.b >> 8) & 0xff)  )  ; out2 =   (0)  ;	in1 =  		( (inst.b >> 24)  )  ; in2 =   ( ((inst.b >> 16) & 0xff)  )  ; in3 =   (0)  ;	 
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  & (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  & (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )))  ;	break; 
case  ANDI :	out1 =  
	( ((inst.b >> 16) & 0xff)  )  ; out2 =   (0)  ;	in1 =  	 	( (inst.b >> 24)  )  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  & (inst.b & 0xffff)  )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  & (inst.b & 0xffff)  )))  ;	break; 
case  OR :	out1 =  
	( ((inst.b >> 8) & 0xff)  )  ; out2 =   (0)  ;	in1 =  		( (inst.b >> 24)  )  ; in2 =   ( ((inst.b >> 16) & 0xff)  )  ; in3 =   (0)  ;	 
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  | (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  | (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )))  ;	break; 
case  ORI :	out1 =  
	( ((inst.b >> 16) & 0xff)  )  ; out2 =   (0)  ;	in1 =   		( (inst.b >> 24)  )  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  | (inst.b & 0xffff)  )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  | (inst.b & 0xffff)  )))  ;	break; 
case  XOR :	out1 =  
	( ((inst.b >> 8) & 0xff)  )  ; out2 =   (0)  ;	in1 =  		( (inst.b >> 24)  )  ; in2 =   ( ((inst.b >> 16) & 0xff)  )  ; in3 =   (0)  ;	 
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ^ (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ^ (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )))  ;	break; 
case  XORI :	out1 =  
	( ((inst.b >> 16) & 0xff)  )  ; out2 =   (0)  ;	in1 =   		( (inst.b >> 24)  )  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ^ (inst.b & 0xffff)  )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ^ (inst.b & 0xffff)  )))  ;	break; 
case  NOR :	out1 =  
	( ((inst.b >> 8) & 0xff)  )  ; out2 =   (0)  ;	in1 =  		( (inst.b >> 24)  )  ; in2 =   ( ((inst.b >> 16) & 0xff)  )  ; in3 =   (0)  ;	 
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  ~((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  | (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  ~((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  | (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) )))  ;	break; 

case  SLL :	out1 =  
	( ((inst.b >> 8) & 0xff)  )  ; out2 =   (0)  ;	in1 =  		( ((inst.b >> 16) & 0xff)  )  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  << (inst.b & 0xff)  )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  << (inst.b & 0xff)  )))  ;	break; 
case  SLLV :	out1 =  
	( ((inst.b >> 8) & 0xff)  )  ; out2 =   (0)  ;	in1 =  		( ((inst.b >> 16) & 0xff)  )  ; in2 =   ( (inst.b >> 24)  )  ; in3 =   (0)  ;	 
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  << ((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  & 037) )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  << ((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  & 037) )))  ;	break; 
case  SRL :	out1 =  
	( ((inst.b >> 8) & 0xff)  )  ; out2 =   (0)  ;	in1 =  		( ((inst.b >> 16) & 0xff)  )  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  ((unsigned)(((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) >> (inst.b & 0xff)  )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  ((unsigned)(((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) >> (inst.b & 0xff)  )))  ;	break; 
case  SRLV :	out1 =  
	( ((inst.b >> 8) & 0xff)  )  ; out2 =   (0)  ;	in1 =  		( ((inst.b >> 16) & 0xff)  )  ; in2 =   ( (inst.b >> 24)  )  ; in3 =   (0)  ;	 
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  ((unsigned)(((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) >> ((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  & 037) )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  ((unsigned)(((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) >> ((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  & 037) )))  ;	break; 
case  SRA :	out1 =  
	( ((inst.b >> 8) & 0xff)  )  ; out2 =   (0)  ;	in1 =  		( ((inst.b >> 16) & 0xff)  )  ; in2 =   (0)  ; in3 =   (0)  ;	 
	InstSRA(inst) ;	break; 
case  SRAV :	out1 =  
	( ((inst.b >> 8) & 0xff)  )  ; out2 =   (0)  ;	in1 =  		( ((inst.b >> 16) & 0xff)  )  ; in2 =   ( (inst.b >> 24)  )  ; in3 =   (0)  ;	 
	InstSRAV(inst) ;	break; 

case  SLT :	out1 =  
	( ((inst.b >> 8) & 0xff)  )  ; out2 =   (0)  ;	in1 =  		( (inst.b >> 24)  )  ; in2 =   ( ((inst.b >> 16) & 0xff)  )  ; in3 =   (0)  ;	 
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  ((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  < (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) ? 1 : 0 )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  ((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  < (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) ? 1 : 0 )))  ;	break; 
case  SLTI :	out1 =  
	( ((inst.b >> 16) & 0xff)  )  ; out2 =   (0)  ;	in1 =   		( (inst.b >> 24)  )  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  ((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  < ((int)(( short)(inst.b & 0xffff))) ) ? 1 : 0 )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  ((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  < ((int)(( short)(inst.b & 0xffff))) ) ? 1 : 0 )))  ;	break; 
case  SLTU :	out1 =  
	( ((inst.b >> 8) & 0xff)  )  ; out2 =   (0)  ;	in1 =  		( (inst.b >> 24)  )  ; in2 =   ( ((inst.b >> 16) & 0xff)  )  ; in3 =   (0)  ;	 
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((unsigned)(((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ]) ) < ((unsigned)(((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) )) ? 1 : 0 )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((unsigned)(((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ]) ) < ((unsigned)(((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) )) ? 1 : 0 )))  ;	break; 
case  SLTIU :	out1 =  
	( ((inst.b >> 16) & 0xff)  )  ; out2 =   (0)  ;	in1 =   		( (inst.b >> 24)  )  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  ((unsigned)(((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  < (unsigned)((int)(( short)(inst.b & 0xffff))) ) ? 1 : 0 )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  ((unsigned)(((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  < (unsigned)((int)(( short)(inst.b & 0xffff))) ) ? 1 : 0 )))  ;	break; 


 



case  FADD_S :	out1 =  
	((( ((inst.b >> 8) & 0xff)   )+32)&~1)  ; out2 =   (0)  ;	in1 =  	((( (inst.b >> 24)   )+32)&~1)  ; in2 =   ((( ((inst.b >> 16) & 0xff)   )+32)&~1)  ; in3 =   (0)  ;	 
	 
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 726,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 726,   "bad FP register alignment"   ) )  : (void)0) , ((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 726,   "bad FP register alignment"   ) )  : (void)0) ,
	 (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  + (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  )) : (regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  + (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  ))) ) ;	break; 
case  FADD_D :	out1 =  
	((( ((inst.b >> 8) & 0xff)   )+32)&~1)  ; out2 =   (0)  ;	in1 =  	((( (inst.b >> 24)   )+32)&~1)  ; in2 =   ((( ((inst.b >> 16) & 0xff)   )+32)&~1)  ; in3 =   (0)  ;	 
	 
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 733,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 733,   "bad FP register alignment"   ) )  : (void)0) , ((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 733,   "bad FP register alignment"   ) )  : (void)0) ,
	 (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  + (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  )) : (regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  + (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  ))) ) ;	break; 
case  FSUB_S :	out1 =  
	((( ((inst.b >> 8) & 0xff)   )+32)&~1)  ; out2 =   (0)  ;	in1 =  	((( (inst.b >> 24)   )+32)&~1)  ; in2 =   ((( ((inst.b >> 16) & 0xff)   )+32)&~1)  ; in3 =   (0)  ;	 
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 739,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 739,   "bad FP register alignment"   ) )  : (void)0) , ((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 739,   "bad FP register alignment"   ) )  : (void)0) ,
	 (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  - (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  )) : (regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  - (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  ))) ) ;	break; 
case  FSUB_D :	out1 =  
	((( ((inst.b >> 8) & 0xff)   )+32)&~1)  ; out2 =   (0)  ;	in1 =  	((( (inst.b >> 24)   )+32)&~1)  ; in2 =   ((( ((inst.b >> 16) & 0xff)   )+32)&~1)  ; in3 =   (0)  ;	 
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 745,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 745,   "bad FP register alignment"   ) )  : (void)0) , ((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 745,   "bad FP register alignment"   ) )  : (void)0) ,
	 (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  - (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  )) : (regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  - (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  ))) ) ;	break; 
case  FMUL_S :	out1 =  
	((( ((inst.b >> 8) & 0xff)   )+32)&~1)  ; out2 =   (0)  ;	in1 =  	((( (inst.b >> 24)   )+32)&~1)  ; in2 =   ((( ((inst.b >> 16) & 0xff)   )+32)&~1)  ; in3 =   (0)  ;	 
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 751,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 751,   "bad FP register alignment"   ) )  : (void)0) , ((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 751,   "bad FP register alignment"   ) )  : (void)0) ,
	 (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  * (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  )) : (regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  * (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  ))) ) ;	break; 
case  FMUL_D :	out1 =  
	((( ((inst.b >> 8) & 0xff)   )+32)&~1)  ; out2 =   (0)  ;	in1 =  	((( (inst.b >> 24)   )+32)&~1)  ; in2 =   ((( ((inst.b >> 16) & 0xff)   )+32)&~1)  ; in3 =   (0)  ;	 
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 757,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 757,   "bad FP register alignment"   ) )  : (void)0) , ((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 757,   "bad FP register alignment"   ) )  : (void)0) ,
	 (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  * (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  )) : (regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  * (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  ))) ) ;	break; 
case  FDIV_S :	out1 =  
	((( ((inst.b >> 8) & 0xff)   )+32)&~1)  ; out2 =   (0)  ;	in1 =  	((( (inst.b >> 24)   )+32)&~1)  ; in2 =   ((( ((inst.b >> 16) & 0xff)   )+32)&~1)  ; in3 =   (0)  ;	 
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 763,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 763,   "bad FP register alignment"   ) )  : (void)0) , ((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 763,   "bad FP register alignment"   ) )  : (void)0) ,
	 ((spec_mode	?  (void)0	: ((( (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  ) == 0) ? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 763,   "divide by 0"   ) )  : (void)0)) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  (((  (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  ) == 0) ? 0 : (( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  ) / (  (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  )))  )) : (regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  (((  (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  ) == 0) ? 0 : (( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  ) / (  (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  )))  ))) )) ;	break; 
case  FDIV_D :	out1 =  
	((( ((inst.b >> 8) & 0xff)   )+32)&~1)  ; out2 =   (0)  ;	in1 =  	((( (inst.b >> 24)   )+32)&~1)  ; in2 =   ((( ((inst.b >> 16) & 0xff)   )+32)&~1)  ; in3 =   (0)  ;	 
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 769,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 769,   "bad FP register alignment"   ) )  : (void)0) , ((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 769,   "bad FP register alignment"   ) )  : (void)0) ,
	 ((spec_mode	?  (void)0	: ((( (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  ) == 0) ? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 769,   "divide by 0"   ) )  : (void)0)) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  (((  (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  ) == 0) ? 0 : (( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  ) / (  (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  )))  )) : (regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  (((  (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  ) == 0) ? 0 : (( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  ) / (  (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  )))  ))) )) ;	break; 
case  FABS_S :	out1 =  
	((( ((inst.b >> 8) & 0xff)   )+32)&~1)  ; out2 =   (0)  ;	in1 =  	((( (inst.b >> 24)   )+32)&~1)  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 774,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 774,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  fabs((double)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )]) ) )) : (regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  fabs((double)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )]) ) ))) ) ;	break; 
case  FABS_D :	out1 =  
	((( ((inst.b >> 8) & 0xff)   )+32)&~1)  ; out2 =   (0)  ;	in1 =  	((( (inst.b >> 24)   )+32)&~1)  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 779,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 779,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  fabs((((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1]) ) )) : (regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  fabs((((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1]) ) ))) ) ;	break; 
case  FMOV_S :	out1 =  
	((( ((inst.b >> 8) & 0xff)   )+32)&~1)  ; out2 =   (0)  ;	in1 =  	((( (inst.b >> 24)   )+32)&~1)  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 784,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 784,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  )) : (regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  ))) ) ;	break; 
case  FMOV_D :	out1 =  
	((( ((inst.b >> 8) & 0xff)   )+32)&~1)  ; out2 =   (0)  ;	in1 =  	((( (inst.b >> 24)   )+32)&~1)  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 789,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 789,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  )) : (regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  ))) ) ;	break; 
case  FNEG_S :	out1 =  
	((( ((inst.b >> 8) & 0xff)   )+32)&~1)  ; out2 =   (0)  ;	in1 =  	((( (inst.b >> 24)   )+32)&~1)  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 794,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 794,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  - (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  )) : (regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  - (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  ))) ) ;	break; 
case  FNEG_D :	out1 =  
	((( ((inst.b >> 8) & 0xff)   )+32)&~1)  ; out2 =   (0)  ;	in1 =  	((( (inst.b >> 24)   )+32)&~1)  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 799,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 799,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  - (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  )) : (regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  - (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  ))) ) ;	break; 

case  CVT_S_D :	out1 =  
	((( ((inst.b >> 8) & 0xff)   )+32)&~1)  ; out2 =   (0)  ;	in1 =  	((( (inst.b >> 24)   )+32)&~1)  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 805,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 805,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  (float)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  )) : (regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  (float)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  ))) ) ;	break; 
case  CVT_S_W :	out1 =  
	((( ((inst.b >> 8) & 0xff)   )+32)&~1)  ; out2 =   (0)  ;	in1 =  	((( (inst.b >> 24)   )+32)&~1)  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 810,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 810,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  (float)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( (inst.b >> 24)   )] : regs_F.l[( (inst.b >> 24)   )])  )) : (regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  (float)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( (inst.b >> 24)   )] : regs_F.l[( (inst.b >> 24)   )])  ))) ) ;	break; 
case  CVT_D_S :	out1 =  
	((( ((inst.b >> 8) & 0xff)   )+32)&~1)  ; out2 =   (0)  ;	in1 =  	((( (inst.b >> 24)   )+32)&~1)  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 815,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 815,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  (double)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  )) : (regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  (double)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  ))) ) ;	break; 
case  CVT_D_W :	out1 =  
	((( ((inst.b >> 8) & 0xff)   )+32)&~1)  ; out2 =   (0)  ;	in1 =  	((( (inst.b >> 24)   )+32)&~1)  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 820,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 820,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  (double)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( (inst.b >> 24)   )] : regs_F.l[( (inst.b >> 24)   )])  )) : (regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  (double)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( (inst.b >> 24)   )] : regs_F.l[( (inst.b >> 24)   )])  ))) ) ;	break; 
case  CVT_W_S :	out1 =  
	((( ((inst.b >> 8) & 0xff)   )+32)&~1)  ; out2 =   (0)  ;	in1 =  	((( (inst.b >> 24)   )+32)&~1)  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 825,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 825,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.l[( ((inst.b >> 8) & 0xff)   )] = (  (int)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  )) : (regs_F.l[( ((inst.b >> 8) & 0xff)   )] = (  (int)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  ))) ) ;	break; 
case  CVT_W_D :	out1 =  
	((( ((inst.b >> 8) & 0xff)   )+32)&~1)  ; out2 =   (0)  ;	in1 =  	((( (inst.b >> 24)   )+32)&~1)  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 830,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 830,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.l[( ((inst.b >> 8) & 0xff)   )] = (  (int)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  )) : (regs_F.l[( ((inst.b >> 8) & 0xff)   )] = (  (int)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  ))) ) ;	break; 

case  C_EQ_S :	out1 =  
	(2+32+32)  ; out2 =   (0)  ;	in1 =  		((( (inst.b >> 24)   )+32)&~1)  ; in2 =   ((( ((inst.b >> 16) & 0xff)   )+32)&~1)  ; in3 =   (0)  ;	 
	(((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 836,   "bad FP register alignment"   ) )  : (void)0) , ((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 836,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (use_spec_FCC= 1 , spec_regs_FCC = ( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  == (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  )) : (regs_FCC = ( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  == (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  ))) ) ;	break; 
case  C_EQ_D :	out1 =  
	(2+32+32)  ; out2 =   (0)  ;	in1 =  		((( (inst.b >> 24)   )+32)&~1)  ; in2 =   ((( ((inst.b >> 16) & 0xff)   )+32)&~1)  ; in3 =   (0)  ;	 
	(((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 841,   "bad FP register alignment"   ) )  : (void)0) , ((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 841,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (use_spec_FCC= 1 , spec_regs_FCC = ( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  == (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  )) : (regs_FCC = ( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  == (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  ))) ) ;	break; 
case  C_LT_S :	out1 =  
	(2+32+32)  ; out2 =   (0)  ;	in1 =  		((( (inst.b >> 24)   )+32)&~1)  ; in2 =   ((( ((inst.b >> 16) & 0xff)   )+32)&~1)  ; in3 =   (0)  ;	 
	(((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 846,   "bad FP register alignment"   ) )  : (void)0) , ((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 846,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (use_spec_FCC= 1 , spec_regs_FCC = ( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  < (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  )) : (regs_FCC = ( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  < (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  ))) ) ;	break; 
case  C_LT_D :	out1 =  
	(2+32+32)  ; out2 =   (0)  ;	in1 =  		((( (inst.b >> 24)   )+32)&~1)  ; in2 =   ((( ((inst.b >> 16) & 0xff)   )+32)&~1)  ; in3 =   (0)  ;	 
	(((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 851,   "bad FP register alignment"   ) )  : (void)0) , ((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 851,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (use_spec_FCC= 1 , spec_regs_FCC = ( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  < (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  )) : (regs_FCC = ( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  < (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  ))) ) ;	break; 
case  C_LE_S :	out1 =  
	(2+32+32)  ; out2 =   (0)  ;	in1 =  		((( (inst.b >> 24)   )+32)&~1)  ; in2 =   ((( ((inst.b >> 16) & 0xff)   )+32)&~1)  ; in3 =   (0)  ;	 
	(((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 856,   "bad FP register alignment"   ) )  : (void)0) , ((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 856,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (use_spec_FCC= 1 , spec_regs_FCC = ( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  <= (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  )) : (regs_FCC = ( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  <= (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  ))) ) ;	break; 
case  C_LE_D :	out1 =  
	(2+32+32)  ; out2 =   (0)  ;	in1 =  		((( (inst.b >> 24)   )+32)&~1)  ; in2 =   ((( ((inst.b >> 16) & 0xff)   )+32)&~1)  ; in3 =   (0)  ;	 
	(((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 861,   "bad FP register alignment"   ) )  : (void)0) , ((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 861,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (use_spec_FCC= 1 , spec_regs_FCC = ( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  <= (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  )) : (regs_FCC = ( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  <= (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  ))) ) ;	break; 

case  FSQRT_S :	out1 =  
	((( ((inst.b >> 8) & 0xff)   )+32)&~1)  ; out2 =   (0)  ;	in1 =  	((( (inst.b >> 24)   )+32)&~1)  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 867,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 867,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  sqrt((double)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )]) ) )) : (regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  sqrt((double)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )]) ) ))) ) ;	break; 
case  FSQRT_D :	out1 =  
	((( ((inst.b >> 8) & 0xff)   )+32)&~1)  ; out2 =   (0)  ;	in1 =  	((( (inst.b >> 24)   )+32)&~1)  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 872,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 872,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  sqrt((((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1]) ) )) : (regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  sqrt((((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1]) ) ))) ) ;	break; 


 



case  SYSCALL :	out1 =  
	(0)  ; out2 =   (0)  ;	in1 =  		(0)  ; in2 =   (0)  ; in3 =   (0)  ;	 
	( (spec_mode ? _panic("ss.def", __FUNCTION__, 883,  "speculative syscall"  )  : (void) 0),	ss_syscall(mem_access,  inst ))  ;	break; 
case  BREAK :	out1 =  
	(0)  ; out2 =   (0)  ;	in1 =  		(0)  ; in2 =   (0)  ; in3 =   (0)  ;	 
	 
	 (void) 0 ;	break; 
case  LUI :	out1 =  
	( ((inst.b >> 16) & 0xff)  )  ; out2 =   (0)  ;	in1 =   		(0)  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (inst.b & 0xffff)  << 16 )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (inst.b & 0xffff)  << 16 )))  ;	break; 

case  MFC1 :	out1 =  
	( ((inst.b >> 16) & 0xff)  )  ; out2 =   (0)  ;	in1 =  		((( (inst.b >> 24)   )+32)&~1)  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( (inst.b >> 24)   )] : regs_F.l[( (inst.b >> 24)   )])  )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( (inst.b >> 24)   )] : regs_F.l[( (inst.b >> 24)   )])  )))  ;	break; 
case  DMFC1 :	out1 =  
	(( ((inst.b >> 16) & 0xff)  )&~1)  ; out2 =   (0)  ;	in1 =   	((( (inst.b >> 24)   )+32)&~1)  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(((( ((inst.b >> 16) & 0xff)  ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 908,   "bad INT register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 908,   "bad FP register alignment"   ) )  : (void)0) ,
	 (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( (inst.b >> 24)   )] : regs_F.l[( (inst.b >> 24)   )])  )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( (inst.b >> 24)   )] : regs_F.l[( (inst.b >> 24)   )])  ))) , (spec_mode ? (((( use_spec_R )[(  ( (((inst.b >> 16) & 0xff) )+1 ) )/32] |= (1 << ((  ( (((inst.b >> 16) & 0xff) )+1 ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (((inst.b >> 16) & 0xff) )+1 ] = (  (((( use_spec_F )[(  (( ((inst.b >> 24)  )+1 )&~1) )/32] & (1 << ((  (( ((inst.b >> 24)  )+1 )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( ((inst.b >> 24)  )+1 )] : regs_F.l[( ((inst.b >> 24)  )+1 )])  )) : (regs_R[ (((inst.b >> 16) & 0xff) )+1 ] = (  (((( use_spec_F )[(  (( ((inst.b >> 24)  )+1 )&~1) )/32] & (1 << ((  (( ((inst.b >> 24)  )+1 )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( ((inst.b >> 24)  )+1 )] : regs_F.l[( ((inst.b >> 24)  )+1 )])  ))) ) ;	break; 
case  CFC1 :	out1 =  
	(0)  ; out2 =   (0)  ;	in1 =  		(0)  ; in2 =   (0)  ; in3 =   (0)  ;	 
	 ((void) 0) ;	break; 
case  MTC1 :	out1 =  
	((( (inst.b >> 24)   )+32)&~1)  ; out2 =   (0)  ;	in1 =  	( ((inst.b >> 16) & 0xff)  )  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(spec_mode ? (((( use_spec_F )[( (( (inst.b >> 24)   )&~1) )/32] |= (1 << (( (( (inst.b >> 24)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.l[( (inst.b >> 24)   )] = (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )) : (regs_F.l[( (inst.b >> 24)   )] = (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )))  ;	break; 
case  DMTC1 :	out1 =  
	((( (inst.b >> 24)   )+32)&~1)  ; out2 =   (0)  ;	in1 =  	(( ((inst.b >> 16) & 0xff)  )&~1)  ; in2 =   (0)  ; in3 =   (0)  ;	 
	(((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 924,   "bad FP register alignment"   ) )  : (void)0) , ((( ((inst.b >> 16) & 0xff)  ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 924,   "bad INT register alignment"   ) )  : (void)0) ,
	 (spec_mode ? (((( use_spec_F )[( (( (inst.b >> 24)   )&~1) )/32] |= (1 << (( (( (inst.b >> 24)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.l[( (inst.b >> 24)   )] = (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )) : (regs_F.l[( (inst.b >> 24)   )] = (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ))) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 24)  )+1 )&~1) )/32] |= (1 << (( (( ((inst.b >> 24)  )+1 )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.l[( ((inst.b >> 24)  )+1 )] = (  (((( use_spec_R )[(  ( (((inst.b >> 16) & 0xff) )+1 ) )/32] & (1 << ((  ( (((inst.b >> 16) & 0xff) )+1 ) ) % 32))) != 0) 	? spec_regs_R[ (((inst.b >> 16) & 0xff) )+1 ] : regs_R[ (((inst.b >> 16) & 0xff) )+1 ])  )) : (regs_F.l[( ((inst.b >> 24)  )+1 )] = (  (((( use_spec_R )[(  ( (((inst.b >> 16) & 0xff) )+1 ) )/32] & (1 << ((  ( (((inst.b >> 16) & 0xff) )+1 ) ) % 32))) != 0) 	? spec_regs_R[ (((inst.b >> 16) & 0xff) )+1 ] : regs_R[ (((inst.b >> 16) & 0xff) )+1 ])  ))) ) ;	break; 
case  CTC1 :	out1 =  
	(0)  ; out2 =   (0)  ;	in1 =  		(0)  ; in2 =   (0)  ; in3 =   (0)  ;	 
	 ((void) 0) ;	break; 






	default:
	   
	  op = NOP;
	  out1 = 0 ; out2 = 0 ;
	  in1 = 0 ; in2 = 0 ; in3 = 0 ;
	   
	}
       

       
      if ((ss_op2flags[ op ])  & 0x00000020 )
	{
	  sim_total_refs++;
	  if (!spec_mode)
	    sim_num_refs++;

	  if ((ss_op2flags[ op ])  & 0x00000080 )
	    is_write = 1 ;
	  else
	    {
	      sim_total_loads++;
	      if (!spec_mode)
		sim_num_loads++;
	    }
	}

      if (pred_PC != next_PC && pred_perfect)
	{
	   
	   



	  pred_PC = fetch_pred_PC = fetch_regs_PC = next_PC;
	  fetch_head = (ruu_decode_width-1);
	  fetch_num = 1;
	  fetch_tail = 0;
	}

       
      no_ea_dep = 0 ;

       
      if (op != NOP)
	{
	   














	   
	  rs = &RUU[RUU_tail];

	  rs->IR = inst;
	  rs->op = op;
	  rs->PC = regs_PC;
	  rs->next_PC = next_PC; rs->pred_PC = pred_PC;
	  rs->in_LSQ = 0 ;
	  rs->ea_comp = 0 ;
	  rs->recover_inst = 0 ;
	  rs->spec_mode = spec_mode;
	  rs->addr = 0;
	   
	  rs->seq = ++inst_seq;
	  rs->queued = rs->issued = rs->completed = 0 ;
	  rs->ptrace_seq = pseq;

	   
	  if ((ss_op2flags[ op ])  & 0x00000020 )
	    {
	       
	      rs->op = ADD;
	      rs->ea_comp = 1 ;

	       
	      lsq = &LSQ[LSQ_tail];

	      lsq->IR = inst;
	      lsq->op = op;
	      lsq->PC = regs_PC;
	      lsq->next_PC = next_PC; lsq->pred_PC = pred_PC;
	      lsq->in_LSQ = 1 ;
	      lsq->ea_comp = 0 ;
	      lsq->recover_inst = 0 ;
	      lsq->spec_mode = spec_mode;
	      lsq->addr = addr;
	       
	      lsq->seq = ++inst_seq;
	      lsq->queued = lsq->issued = lsq->completed = 0 ;
	      lsq->ptrace_seq = ptrace_seq++;

	       
	      if (ptrace_active) __ptrace_newuop(( lsq->ptrace_seq ),(  "internal ld/st" ),(  lsq->PC ),(  0 )) ;
	      if (ptrace_active) __ptrace_newstage(( lsq->ptrace_seq ),(  "DA"  ),(  0 )) ;

	       
	      ruu_link_idep(rs,  0, 0 );
	      ruu_link_idep(rs,  1, in2);
	      ruu_link_idep(rs,  2, in3);

	       
	      ruu_install_odep(rs,  0, (3+32+32) );
	      ruu_install_odep(rs,  1, 0 );

	       
	      ruu_link_idep(lsq,
			     0  ,
			    in1);
	      ruu_link_idep(lsq,
			     1  ,
			    no_ea_dep ? 0  : (3+32+32) );
	      ruu_link_idep(lsq,  2, 0 );

	       
	      ruu_install_odep(lsq,  0, out1);
	      ruu_install_odep(lsq,  1, out2);

	       
	      n_dispatched++;
	      RUU_tail = (RUU_tail + 1) % RUU_size;
	      RUU_num++;
	      LSQ_tail = (LSQ_tail + 1) % LSQ_size;
	      LSQ_num++;

	      if ((( rs )->idep_ready[0] && ( rs )->idep_ready[1] && ( rs )->idep_ready[2]) )
		{
		   
		  readyq_enqueue(rs);
		}
	       
	      (( last_op ).next = ((void *)0) , ( last_op ).rs = (  lsq ), ( last_op ).tag = (  lsq )->tag) ;

	       
	      if ((((ss_op2flags[ op ])  & (0x00000020 | 0x00000080 )) == (0x00000020 | 0x00000080 ))
		  && (( lsq )->idep_ready[0] && ( lsq )->idep_ready[1] && ( lsq )->idep_ready[2]) )
		{
		   
		   
		  readyq_enqueue(lsq);
		}
	    }
	  else  
	    {
	       
	      ruu_link_idep(rs,  0, in1);
	      ruu_link_idep(rs,  1, in2);
	      ruu_link_idep(rs,  2, in3);

	       
	      ruu_install_odep(rs,  0, out1);
	      ruu_install_odep(rs,  1, out2);

	       
	      n_dispatched++;
	      RUU_tail = (RUU_tail + 1) % RUU_size;
	      RUU_num++;

	       
	      if ((( rs )->idep_ready[0] && ( rs )->idep_ready[1] && ( rs )->idep_ready[2]) )
		{
		   
		  readyq_enqueue(rs);
		   
		  last_op = RSLINK_NULL;
		}
	      else
		{
		   
		  (( last_op ).next = ((void *)0) , ( last_op ).rs = (  rs ), ( last_op ).tag = (  rs )->tag) ;
		}
	    }
	}
      else
	{
	   
	  rs = ((void *)0) ;
	}

       
      sim_total_insn++;
      if ((ss_op2flags[ op ])  & 0x00000004 )
	sim_total_branches++;

      if (!spec_mode)
	{
	   
	  sim_num_insn++;

	   

	  if ((ss_op2flags[ op ])  & 0x00000004 )
	    {
	      sim_num_branches++;
	      if (pred)
		bpred_update(pred, regs_PC, next_PC,
			      next_PC != (regs_PC +
						   sizeof(SS_INST_TYPE)),
			      pred_PC == next_PC,
			      update_ptr);
	    }

	   
	  if (pred_PC != next_PC)
	    {
	       
	      spec_mode = 1 ;
	      rs->recover_inst = 1 ;
	      recover_PC = next_PC;
	    }
	}

       
      if (ptrace_active) __ptrace_newstage(( pseq ),(  "DA"  ),( 
		      (pred_PC != next_PC) ? 0x00000004  : 0 )) ;
      if (op == NOP)
	{
	   
	  if (ptrace_active) __ptrace_endinst(( pseq )) ;
	}

       
      for (i=0; i<pcstat_nelt; i++)
	{
	  SS_COUNTER_TYPE newval;
	  int delta;

	   
	  newval = (( pcstat_stats[i] )->sc == sc_int	? (SS_COUNTER_TYPE)*(( pcstat_stats[i] )->variant.for_int.var)	: (( pcstat_stats[i] )->sc == sc_uint	? (SS_COUNTER_TYPE)*(( pcstat_stats[i] )->variant.for_uint.var)	: (( pcstat_stats[i] )->sc == sc_llong 	? *(( pcstat_stats[i] )->variant.for_llong .var)	: (_panic("sim-outorder.c", __FUNCTION__, 3697,  "bad stat class"  ) , 0)))) ;
	  delta = newval - pcstat_lastvals[i];
	  if (delta != 0)
	    {
	      stat_add_samples(pcstat_sdists[i], regs_PC, delta);
	      pcstat_lastvals[i] = newval;
	    }
	}

       
      fetch_head = (fetch_head+1) & (ruu_ifq_size - 1);
      fetch_num--;

       
      made_check = 1 ;
      if (((dlite_check || dlite_active)	? __check_break(( pred_PC ), ( 
			    is_write ? 0x02  : 0x01  ), ( 
			    addr ), (  sim_num_insn ), (  sim_cycle ))	: 0 ) )
	dlite_main(regs_PC, pred_PC, sim_cycle);
    }

   
  if (!made_check)
    {
      if (((dlite_check || dlite_active)	? __check_break((  0 ), ( 
			    is_write ? 0x02  : 0x01  ), ( 
			    addr ), (  sim_num_insn ), (  sim_cycle ))	: 0 ) )
	dlite_main(regs_PC,  0, sim_cycle);
    }
}


 



 
static void
fetch_init(void)
{
   
  fetch_data =
    (struct fetch_rec *)calloc(ruu_ifq_size, sizeof(struct fetch_rec));
  if (!fetch_data)
    _fatal("sim-outorder.c", __FUNCTION__, 3741,  "out of virtual memory"  ) ;

  fetch_num = 0;
  fetch_tail = fetch_head = 0;
}

 
void
fetch_dump(FILE *stream)			 
{
  int num, head;

  fprintf(stream, "** fetch stage state **\n");

  fprintf(stream, "spec_mode: %s\n", spec_mode ? "t" : "f");
  fprintf(stream, "pred_PC: 0x%08x, recover_PC: 0x%08x\n",
	  pred_PC, recover_PC);
  fprintf(stream, "fetch_regs_PC: 0x%08x, fetch_pred_PC: 0x%08x\n",
	  fetch_regs_PC, fetch_pred_PC);
  fprintf(stream, "\n");

  fprintf(stream, "** fetch queue contents **\n");
  fprintf(stream, "fetch_num: %d\n", fetch_num);
  fprintf(stream, "fetch_head: %d, fetch_tail: %d\n",
	  fetch_head, fetch_tail);

  num = fetch_num;
  head = fetch_head;
  while (num)
    {
      fprintf(stream, "idx: %2d: inst: `", head);
      ss_print_insn(fetch_data[head].IR, fetch_data[head].regs_PC, stream);
      fprintf(stream, "'\n");
      fprintf(stream, "         regs_PC: 0x%08x, pred_PC: 0x%08x\n",
	      fetch_data[head].regs_PC, fetch_data[head].pred_PC);
      head = (head + 1) & (ruu_ifq_size - 1);
      num--;
    }
}

static int last_inst_missed = 0 ;
static int last_inst_tmissed = 0 ;

 

static void
ruu_fetch(void)
{
  int i, lat, tlb_lat, done = 0 ;
  SS_INST_TYPE inst;
  struct bpred_btb_ent *update_ptr;

  for (i=0;
        
       i < ruu_decode_width
        
       && fetch_num < ruu_ifq_size
        
       && !done;
       i++)
    {
       
      fetch_regs_PC = fetch_pred_PC;

       
      if (ld_text_base <= fetch_regs_PC
	  && fetch_regs_PC < (ld_text_base+ld_text_size)
	  && !(fetch_regs_PC & (sizeof(SS_INST_TYPE)-1)))
	{
	   
	  mem_access(Read, fetch_regs_PC, &inst, sizeof(SS_INST_TYPE));

	   
	  lat = cache_il1_lat;
	  if (cache_il1)
	    {
	       
	      lat =
		cache_access(cache_il1, Read, fetch_regs_PC,
			     ((void *)0) , sizeof(SS_INST_TYPE), sim_cycle,
			     ((void *)0) , ((void *)0) );
	      if (lat > cache_il1_lat)
		last_inst_missed = 1 ;
	    }

	  if (itlb)
	    {
	       

	      tlb_lat =
		cache_access(itlb, Read, fetch_regs_PC,
			     ((void *)0) , sizeof(SS_INST_TYPE), sim_cycle,
			     ((void *)0) , ((void *)0) );
	      if (tlb_lat > 1)
		last_inst_tmissed = 1 ;

	       
	      lat = ((( tlb_lat ) < (  lat )) ? (  lat ) : ( tlb_lat )) ;
	    }

	   
	  if (lat != cache_il1_lat)
	    {
	       
	      ruu_fetch_issue_delay += lat - 1;
	      break;
	    }
	   
	}
      else
	{
	   
	  inst = SS_NOP_INST;
	}

       

       
      if (pred)
	{
	   
	  fetch_pred_PC = bpred_lookup(pred, fetch_regs_PC, 0, &update_ptr);

	   
	  if (!fetch_pred_PC)
	    {
	       
	      fetch_pred_PC = fetch_regs_PC + sizeof(SS_INST_TYPE);
	    }
	  else
	    {
	       
	      done = 1 ;
	    }
	}
      else
	{
	   

	  fetch_pred_PC = fetch_regs_PC + sizeof(SS_INST_TYPE);
	}

       
      fetch_data[fetch_tail].IR = inst;
      fetch_data[fetch_tail].regs_PC = fetch_regs_PC;
      fetch_data[fetch_tail].pred_PC = fetch_pred_PC;
      fetch_data[fetch_tail].update_ptr = update_ptr;
      fetch_data[fetch_tail].ptrace_seq = ptrace_seq++;

       
      if (ptrace_active) __ptrace_newinst(( fetch_data[fetch_tail].ptrace_seq ),( 
		     inst ),(  fetch_data[fetch_tail].regs_PC ),( 
		     0 )) ;
      if (ptrace_active) __ptrace_newstage(( fetch_data[fetch_tail].ptrace_seq ),( 
		      "IF"  ),( 
		      ((last_inst_missed ? 0x00000001  : 0)
		       | (last_inst_tmissed ? 0x00000002  : 0)) )) ;
      last_inst_missed = 0 ;
      last_inst_tmissed = 0 ;

       
      fetch_tail = (fetch_tail + 1) & (ruu_ifq_size - 1);
      fetch_num++;
    }
}

 
static char *					 
simoo_mstate_obj(FILE *stream,			 
		 char *cmd)			 
{
  if (!cmd || !strcmp(cmd, "help"))
    fprintf(stream,
"mstate commands:\n"
"\n"
"    mstate help   - show all machine-specific commands (this list)\n"
"    mstate stats  - dump all statistical variables\n"
"    mstate res    - dump current functional unit resource states\n"
"    mstate ruu    - dump contents of the register update unit\n"
"    mstate lsq    - dump contents of the load/store queue\n"
"    mstate eventq - dump contents of event queue\n"
"    mstate readyq - dump contents of ready instruction queue\n"
"    mstate cv     - dump contents of the register create vector\n"
"    mstate rspec  - dump contents of speculative regs\n"
"    mstate mspec  - dump contents of speculative memory\n"
"    mstate fetch  - dump contents of fetch stage registers and fetch queue\n"
"\n"
	    );
  else if (!strcmp(cmd, "stats"))
    {
       
      sim_print_stats(stream);
    }
  else if (!strcmp(cmd, "res"))
    {
       
      res_dump(fu_pool, stream);
    }
  else if (!strcmp(cmd, "ruu"))
    {
       
      ruu_dump(stream);
    }
  else if (!strcmp(cmd, "lsq"))
    {
       
      lsq_dump(stream);
    }
  else if (!strcmp(cmd, "eventq"))
    {
       
      eventq_dump(stream);
    }
  else if (!strcmp(cmd, "readyq"))
    {
       
      readyq_dump(stream);
    }
  else if (!strcmp(cmd, "cv"))
    {
       
      cv_dump(stream);
    }
  else if (!strcmp(cmd, "rspec"))
    {
       
      rspec_dump(stream);
    }
  else if (!strcmp(cmd, "mspec"))
    {
       
      mspec_dump(stream);
    }
  else if (!strcmp(cmd, "fetch"))
    {
       
      fetch_dump(stream);
    }
  else
    return "unknown mstate command";

   
  return ((void *)0) ;
}


 
void
sim_main(void)
{
   

  signal(8 , ((__sighandler_t) 1) );

   
  regs_PC = ld_prog_entry;

   
  if (((dlite_check || dlite_active)	? __check_break(( regs_PC ), (   0 ), (   0 ), (  0 ), (  0 ))	: 0 ) )
    dlite_main(regs_PC, regs_PC + sizeof(SS_INST_TYPE) , sim_cycle);

   

  if (fastfwd_count > 0)
    {
      int icount;
      SS_INST_TYPE inst;                 
      enum ss_opcode op;                 
      SS_ADDR_TYPE target_PC;            
      SS_ADDR_TYPE addr;                 
      SS_ADDR_TYPE next_PC;
      int is_write;                      
      unsigned int temp_uint;		 
      signed short temp_short;		 
      unsigned short temp_ushort;	 
      signed char temp_char;		 
      unsigned char temp_uchar;		 

      fprintf(((_IO_FILE*)(&_IO_stderr_))  , "sim: ** fast forwarding %d insts **\n", fastfwd_count);

      next_PC = regs_PC + sizeof(SS_INST_TYPE) ;
      for (icount=0; icount < fastfwd_count; icount++)
        {
           
          regs_R[0] = 0;

           
          inst = (*(( SS_INST_TYPE  *)(mem_table[((((SS_ADDR_TYPE)(   regs_PC  )) >> 16) & 0x7fff) ] + ((   regs_PC  ) & 0xffff) ))) ;

           
          addr = 0; is_write = 0 ;

           
          op = ( inst .a & 0xff) ;

           
          switch (op)
            {



 








































































 







































































































































 
case  NOP :  
	 ((void) 0) ; break; 

 



case  JUMP :  
	(next_PC = ( ((regs_PC)  & 036000000000) | ((inst.b & 0x3ffffff)  << 2) ))  ; break; 
case  JAL :  
	((next_PC = ( ((regs_PC)  & 036000000000) | ((inst.b & 0x3ffffff)  << 2) )) , (spec_mode ? (((( use_spec_R )[(  ( 31 ) )/32] |= (1 << ((  ( 31 ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ 31 ] = (  (regs_PC)  + 8 )) : (regs_R[ 31 ] = (  (regs_PC)  + 8 ))) ) ; break; 
case  JR :  
	(((( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) & 0x7)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 235,   "bad jump alignment"   ) )  : (void)0) , (next_PC = ( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  )) ) ; break; 
case  JALR :  
	(((( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) & 0x7)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 240,   "bad jump alignment"   ) )  : (void)0) , (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (regs_PC)  + 8 )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (regs_PC)  + 8 ))) , (next_PC = ( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  )) ) ; break; 
case  BEQ :  
	((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  == (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) ? (next_PC = ( (regs_PC)  + 8 + (((int)(( short)(inst.b & 0xffff)))   << 2) ))  : 0 ; break; 
case  BNE :  
	((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  != (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) ? (next_PC = ( (regs_PC)  + 8 + (((int)(( short)(inst.b & 0xffff)))   << 2) ))  : 0 ; break; 
case  BLEZ :  
	((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  <= 0) ? (next_PC = ( (regs_PC)  + 8 + (((int)(( short)(inst.b & 0xffff)))   << 2) ))  : 0 ; break; 
case  BGTZ :  
	((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  > 0) ? (next_PC = ( (regs_PC)  + 8 + (((int)(( short)(inst.b & 0xffff)))   << 2) ))  : 0 ; break; 
case  BLTZ :  
	((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  < 0) ? (next_PC = ( (regs_PC)  + 8 + (((int)(( short)(inst.b & 0xffff)))   << 2) ))  : 0 ; break; 
case  BGEZ :  
	((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  >= 0) ? (next_PC = ( (regs_PC)  + 8 + (((int)(( short)(inst.b & 0xffff)))   << 2) ))  : 0 ; break; 
case  BC1F :  
	(! (use_spec_FCC ? spec_regs_FCC : regs_FCC) ) ? (next_PC = ( (regs_PC)  + 8 + (((int)(( short)(inst.b & 0xffff)))   << 2) ))  : 0 ; break; 
case  BC1T :  
	((use_spec_FCC ? spec_regs_FCC : regs_FCC) ) ? (next_PC = ( (regs_PC)  + 8 + (((int)(( short)(inst.b & 0xffff)))   << 2) ))  : 0 ; break; 

 








case  LB :  
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_char   ,	sizeof( temp_char   ))	: mem_access(Read, addr,  &temp_char   ,	sizeof( temp_char   ))),	((unsigned int)(( signed int ) temp_char   )))   )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_char   ,	sizeof( temp_char   ))	: mem_access(Read, addr,  &temp_char   ,	sizeof( temp_char   ))),	((unsigned int)(( signed int ) temp_char   )))   )))  ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 
case  LBU :  
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uchar   ,	sizeof( temp_uchar   ))	: mem_access(Read, addr,  &temp_uchar   ,	sizeof( temp_uchar   ))),	((unsigned int)(( unsigned int ) temp_uchar   )))   )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uchar   ,	sizeof( temp_uchar   ))	: mem_access(Read, addr,  &temp_uchar   ,	sizeof( temp_uchar   ))),	((unsigned int)(( unsigned int ) temp_uchar   )))   )))  ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 
case  LH :  
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_short   ,	sizeof( temp_short   ))	: mem_access(Read, addr,  &temp_short   ,	sizeof( temp_short   ))),	((unsigned int)(( signed int ) temp_short   )))   )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_short   ,	sizeof( temp_short   ))	: mem_access(Read, addr,  &temp_short   ,	sizeof( temp_short   ))),	((unsigned int)(( signed int ) temp_short   )))   )))  ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 
case  LHU :  
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_ushort   ,	sizeof( temp_ushort   ))	: mem_access(Read, addr,  &temp_ushort   ,	sizeof( temp_ushort   ))),	((unsigned int)(( unsigned int ) temp_ushort   )))   )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_ushort   ,	sizeof( temp_ushort   ))	: mem_access(Read, addr,  &temp_ushort   ,	sizeof( temp_ushort   ))),	((unsigned int)(( unsigned int ) temp_ushort   )))   )))  ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 
case  LW :  
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )))  ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 
case  DLW :  
	((spec_mode ? (((( use_spec_R )[(  ( ( 
		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (((( ((inst.b >> 16) & 0xff)  ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 323,   "bad INT register alignment"   ) )  : (void)0) , temp_bs = (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) ,
		 (spec_mode ? (((( use_spec_R )[(  ( (((inst.b >> 16) & 0xff) )^sim_swap_words ) )/32] |= (1 << ((  ( (((inst.b >> 16) & 0xff) )^sim_swap_words ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (((inst.b >> 16) & 0xff) )^sim_swap_words ] = (  (addr = (  ( temp_bs+ ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )) : (regs_R[ (((inst.b >> 16) & 0xff) )^sim_swap_words ] = (  (addr = (  ( temp_bs+ ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   ))) ,
		 (spec_mode ? (((( use_spec_R )[(  ( ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ) )/32] |= (1 << ((  ( ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ] = (  (addr = (  ( temp_bs+ ((int)(( short)(inst.b & 0xffff)))  +4 ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )) : (regs_R[ ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ] = (  (addr = (  ( temp_bs+ ((int)(( short)(inst.b & 0xffff)))  +4 ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   ))) ) ),	(spec_mode ? (((( use_spec_R )[(  ( (  		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 
case  L_S :  
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 16) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.l[( ((inst.b >> 16) & 0xff)   )] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )) : (regs_F.l[( ((inst.b >> 16) & 0xff)   )] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )))  ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 
case  L_D :  
	((spec_mode ? (((( use_spec_R )[(  ( ( 
		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 336,   "bad FP register alignment"   ) )  : (void)0) ,
		 (spec_mode ? (((( use_spec_F )[( (( (((inst.b >> 16) & 0xff)  )^sim_swap_words )&~1) )/32] |= (1 << (( (( (((inst.b >> 16) & 0xff)  )^sim_swap_words )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.l[( (((inst.b >> 16) & 0xff)  )^sim_swap_words )] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )) : (regs_F.l[( (((inst.b >> 16) & 0xff)  )^sim_swap_words )] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   ))) ,
		 (spec_mode ? (((( use_spec_F )[( (( ((((inst.b >> 16) & 0xff)  )+1)^sim_swap_words )&~1) )/32] |= (1 << (( (( ((((inst.b >> 16) & 0xff)  )+1)^sim_swap_words )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.l[( ((((inst.b >> 16) & 0xff)  )+1)^sim_swap_words )] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))  +4 ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )) : (regs_F.l[( ((((inst.b >> 16) & 0xff)  )+1)^sim_swap_words )] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))  +4 ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   ))) ) ),	(spec_mode ? (((( use_spec_R )[(  ( (  		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 
case  LWL :  
	( 
	  temp_bs = (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) ,
	 ss_lr_temp = (addr = (  ( (( temp_bs+ ((int)(( short)(inst.b & 0xffff)))   ) & ~0x03)  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))  ,
	 (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  & (ss_lr_masks[4- (4-((  temp_bs+ ((int)(( short)(inst.b & 0xffff)))    ) & 0x03)) ]) ) |
		      (ss_lr_temp & ~(ss_lr_masks[4- (4-((  temp_bs+ ((int)(( short)(inst.b & 0xffff)))    ) & 0x03)) ]) )) )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  & (ss_lr_masks[4- (4-((  temp_bs+ ((int)(( short)(inst.b & 0xffff)))    ) & 0x03)) ]) ) | 		      (ss_lr_temp & ~(ss_lr_masks[4- (4-((  temp_bs+ ((int)(( short)(inst.b & 0xffff)))    ) & 0x03)) ]) )) ))) ) ; break; 
case  LWR :  
	( 
	  temp_bs = (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) ,
	 ss_lr_temp = (addr = (  ( (( temp_bs+ ((int)(( short)(inst.b & 0xffff)))   ) & ~0x03)  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))  ,
	 (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  & (~(ss_lr_masks[(((  temp_bs+ ((int)(( short)(inst.b & 0xffff)))    ) & 0x03)+1) ])) ) |
		      (ss_lr_temp & ~(~(ss_lr_masks[(((  temp_bs+ ((int)(( short)(inst.b & 0xffff)))    ) & 0x03)+1) ])) )) )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  & (~(ss_lr_masks[(((  temp_bs+ ((int)(( short)(inst.b & 0xffff)))    ) & 0x03)+1) ])) ) | 		      (ss_lr_temp & ~(~(ss_lr_masks[(((  temp_bs+ ((int)(( short)(inst.b & 0xffff)))    ) & 0x03)+1) ])) )) ))) ) ; break; 

case  SB :  
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	 temp_uchar    = (  unsigned char )((unsigned int)( ( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uchar   ,	sizeof( temp_uchar   ))	: mem_access(Write, addr,  &temp_uchar   ,	sizeof( temp_uchar   ))))   ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 
case  SH :  
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	 temp_ushort    = (  unsigned short )((unsigned int)( ( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_ushort   ,	sizeof( temp_ushort   ))	: mem_access(Write, addr,  &temp_ushort   ,	sizeof( temp_ushort   ))))   ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 
case  SW :  
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))   ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 
case  DSW :  
	((spec_mode ? (((( use_spec_R )[(  ( ( 
		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (((( ((inst.b >> 16) & 0xff)  ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 378,   "bad INT register alignment"   ) )  : (void)0) ,
		 (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_R )[(  ( (((inst.b >> 16) & 0xff) )^sim_swap_words ) )/32] & (1 << ((  ( (((inst.b >> 16) & 0xff) )^sim_swap_words ) ) % 32))) != 0) 	? spec_regs_R[ (((inst.b >> 16) & 0xff) )^sim_swap_words ] : regs_R[ (((inst.b >> 16) & 0xff) )^sim_swap_words ])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))  ,
		 (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))  +4 ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_R )[(  ( ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ) )/32] & (1 << ((  ( ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ) ) % 32))) != 0) 	? spec_regs_R[ ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ] : regs_R[ ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))  ) ),	(spec_mode ? (((( use_spec_R )[(  ( (  		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 
case  DSZ :  
	((spec_mode ? (((( use_spec_R )[(  ( ( 
		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( ((addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_R )[(  ( 0 ) )/32] & (1 << ((  ( 0 ) ) % 32))) != 0) 	? spec_regs_R[ 0 ] : regs_R[ 0 ])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))  ,
		 (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))  +4 ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_R )[(  ( 0 ) )/32] & (1 << ((  ( 0 ) ) % 32))) != 0) 	? spec_regs_R[ 0 ] : regs_R[ 0 ])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))  ) ),	(spec_mode ? (((( use_spec_R )[(  ( (  		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 
case  S_S :  
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( ((inst.b >> 16) & 0xff)   )] : regs_F.l[( ((inst.b >> 16) & 0xff)   )])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))   ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 
case  S_D :  
	((spec_mode ? (((( use_spec_R )[(  ( ( 
		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 398,   "bad FP register alignment"   ) )  : (void)0) ,
		 (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( ((inst.b >> 16) & 0xff)   )] : regs_F.l[( ((inst.b >> 16) & 0xff)   )])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))  ,
		 (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))  +4 ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_F )[(  (( (((inst.b >> 16) & 0xff)  )+1 )&~1) )/32] & (1 << ((  (( (((inst.b >> 16) & 0xff)  )+1 )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( (((inst.b >> 16) & 0xff)  )+1 )] : regs_F.l[( (((inst.b >> 16) & 0xff)  )+1 )])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))  ) ),	(spec_mode ? (((( use_spec_R )[(  ( (  		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 
case  SWL :  
	( 
	 ss_lr_temp = (addr = (  ( (( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) & ~0x03)  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))  ,
	 ss_lr_temp = (((((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  & ~(ss_lr_masks[4- (4-((  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))    ) & 0x03)) ]) ) |
		       (ss_lr_temp & (ss_lr_masks[4- (4-((  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))    ) & 0x03)) ]) )),
	 (addr = (  (  (( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) & ~0x03)  ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( ss_lr_temp ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))  ) ; break; 
case  SWR :  
	( 
	 ss_lr_temp = (addr = (  ( (( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) & ~0x03)  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))  ,
	 ss_lr_temp = (((((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  & ~(~(ss_lr_masks[(((  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))    ) & 0x03)+1) ])) ) |
		       (ss_lr_temp & (~(ss_lr_masks[(((  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))    ) & 0x03)+1) ])) )),
	 (addr = (  (  (( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + ((int)(( short)(inst.b & 0xffff)))   ) & ~0x03)  ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( ss_lr_temp ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))  ) ; break; 

 

case  LB_RR :  
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_char   ,	sizeof( temp_char   ))	: mem_access(Read, addr,  &temp_char   ,	sizeof( temp_char   ))),	((unsigned int)(( signed int ) temp_char   )))   )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_char   ,	sizeof( temp_char   ))	: mem_access(Read, addr,  &temp_char   ,	sizeof( temp_char   ))),	((unsigned int)(( signed int ) temp_char   )))   )))  ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 
case  LBU_RR :  
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uchar   ,	sizeof( temp_uchar   ))	: mem_access(Read, addr,  &temp_uchar   ,	sizeof( temp_uchar   ))),	((unsigned int)(( unsigned int ) temp_uchar   )))   )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uchar   ,	sizeof( temp_uchar   ))	: mem_access(Read, addr,  &temp_uchar   ,	sizeof( temp_uchar   ))),	((unsigned int)(( unsigned int ) temp_uchar   )))   )))  ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 
case  LH_RR :  
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_short   ,	sizeof( temp_short   ))	: mem_access(Read, addr,  &temp_short   ,	sizeof( temp_short   ))),	((unsigned int)(( signed int ) temp_short   )))   )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_short   ,	sizeof( temp_short   ))	: mem_access(Read, addr,  &temp_short   ,	sizeof( temp_short   ))),	((unsigned int)(( signed int ) temp_short   )))   )))  ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 
case  LHU_RR :  
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_ushort   ,	sizeof( temp_ushort   ))	: mem_access(Read, addr,  &temp_ushort   ,	sizeof( temp_ushort   ))),	((unsigned int)(( unsigned int ) temp_ushort   )))   )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_ushort   ,	sizeof( temp_ushort   ))	: mem_access(Read, addr,  &temp_ushort   ,	sizeof( temp_ushort   ))),	((unsigned int)(( unsigned int ) temp_ushort   )))   )))  ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 
case  LW_RR :  
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )))  ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 
case  DLW_RR :  
	((spec_mode ? (((( use_spec_R )[(  ( ( 
		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (((( ((inst.b >> 16) & 0xff)  ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 454,   "bad INT register alignment"   ) )  : (void)0) ,
		 temp_bs = (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) , temp_rd = (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ]) ,
		 (spec_mode ? (((( use_spec_R )[(  ( (((inst.b >> 16) & 0xff) )^sim_swap_words ) )/32] |= (1 << ((  ( (((inst.b >> 16) & 0xff) )^sim_swap_words ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (((inst.b >> 16) & 0xff) )^sim_swap_words ] = (  (addr = (  ( temp_bs+temp_rd ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )) : (regs_R[ (((inst.b >> 16) & 0xff) )^sim_swap_words ] = (  (addr = (  ( temp_bs+temp_rd ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   ))) ,
		 (spec_mode ? (((( use_spec_R )[(  ( ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ) )/32] |= (1 << ((  ( ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ] = ( 
			 (addr = (  ( temp_bs+temp_rd+4 ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )) : (regs_R[ ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ] = (  			 (addr = (  ( temp_bs+temp_rd+4 ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   ))) ) ),	(spec_mode ? (((( use_spec_R )[(  ( (  		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 
case  L_S_RR :  
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 16) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.l[( ((inst.b >> 16) & 0xff)   )] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )) : (regs_F.l[( ((inst.b >> 16) & 0xff)   )] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )))  ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 
 
case  L_D_RR :  
	((spec_mode ? (((( use_spec_R )[(  ( ( 
		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 469,   "bad FP register alignment"   ) )  : (void)0) ,
		 (spec_mode ? (((( use_spec_F )[( (( (((inst.b >> 16) & 0xff)  )^sim_swap_words )&~1) )/32] |= (1 << (( (( (((inst.b >> 16) & 0xff)  )^sim_swap_words )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.l[( (((inst.b >> 16) & 0xff)  )^sim_swap_words )] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )) : (regs_F.l[( (((inst.b >> 16) & 0xff)  )^sim_swap_words )] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   ))) ,
		 (spec_mode ? (((( use_spec_F )[( (( ((((inst.b >> 16) & 0xff)  )+1)^sim_swap_words )&~1) )/32] |= (1 << (( (( ((((inst.b >> 16) & 0xff)  )+1)^sim_swap_words )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.l[( ((((inst.b >> 16) & 0xff)  )+1)^sim_swap_words )] = ( 
			   (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ]) +4 ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )) : (regs_F.l[( ((((inst.b >> 16) & 0xff)  )+1)^sim_swap_words )] = (  			   (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ]) +4 ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   ))) ) ),	(spec_mode ? (((( use_spec_R )[(  ( (  		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 

case  SB_RR :  
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	 temp_uchar    = (  unsigned char )((unsigned int)( ( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uchar   ,	sizeof( temp_uchar   ))	: mem_access(Write, addr,  &temp_uchar   ,	sizeof( temp_uchar   ))))   ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  1 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 
case  SH_RR :  
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	 temp_ushort    = (  unsigned short )((unsigned int)( ( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_ushort   ,	sizeof( temp_ushort   ))	: mem_access(Write, addr,  &temp_ushort   ,	sizeof( temp_ushort   ))))   ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  2 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 
case  SW_RR :  
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))   ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 
case  DSW_RR :  
	((spec_mode ? (((( use_spec_R )[(  ( ( 
		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (((( ((inst.b >> 16) & 0xff)  ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 493,   "bad INT register alignment"   ) )  : (void)0) ,
		 (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_R )[(  ( (((inst.b >> 16) & 0xff) )^sim_swap_words ) )/32] & (1 << ((  ( (((inst.b >> 16) & 0xff) )^sim_swap_words ) ) % 32))) != 0) 	? spec_regs_R[ (((inst.b >> 16) & 0xff) )^sim_swap_words ] : regs_R[ (((inst.b >> 16) & 0xff) )^sim_swap_words ])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))  ,
		 (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ]) +4 ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_R )[(  ( ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ) )/32] & (1 << ((  ( ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ) ) % 32))) != 0) 	? spec_regs_R[ ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ] : regs_R[ ((((inst.b >> 16) & 0xff) )+1)^sim_swap_words ])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))  ) ),	(spec_mode ? (((( use_spec_R )[(  ( (  		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 
case  DSZ_RR :  
	((spec_mode ? (((( use_spec_R )[(  ( ( 
		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( ((addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_R )[(  ( 0 ) )/32] & (1 << ((  ( 0 ) ) % 32))) != 0) 	? spec_regs_R[ 0 ] : regs_R[ 0 ])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))  ,
		 (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ]) +4 ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_R )[(  ( 0 ) )/32] & (1 << ((  ( 0 ) ) % 32))) != 0) 	? spec_regs_R[ 0 ] : regs_R[ 0 ])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))  ) ),	(spec_mode ? (((( use_spec_R )[(  ( (  		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 
case  S_S_RR :  
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( ((inst.b >> 16) & 0xff)   )] : regs_F.l[( ((inst.b >> 16) & 0xff)   )])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))   ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 
case  S_D_RR :  
	((spec_mode ? (((( use_spec_R )[(  ( ( 
		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_fore_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 514,   "bad FP register alignment"   ) )  : (void)0) ,
		 (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ])  ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_F )[(  (( (((inst.b >> 16) & 0xff)  )^sim_swap_words )&~1) )/32] & (1 << ((  (( (((inst.b >> 16) & 0xff)  )^sim_swap_words )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( (((inst.b >> 16) & 0xff)  )^sim_swap_words )] : regs_F.l[( (((inst.b >> 16) & 0xff)  )^sim_swap_words )])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))  ,
		 (addr = (  ( 
			    (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ]) +4 ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_F )[(  (( ((((inst.b >> 16) & 0xff)  )+1)^sim_swap_words )&~1) )/32] & (1 << ((  (( ((((inst.b >> 16) & 0xff)  )+1)^sim_swap_words )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( ((((inst.b >> 16) & 0xff)  )+1)^sim_swap_words )] : regs_F.l[( ((((inst.b >> 16) & 0xff)  )+1)^sim_swap_words )])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))  ) ),	(spec_mode ? (((( use_spec_R )[(  ( (  		(inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  		(inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  		(inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   		(inst.b >> 24)    ) )/32] & (1 << ((  (   		(inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   		(inst.b >> 24)    ] : regs_R[   		(inst.b >> 24)    ])  + ss_aft_tab[(  8 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 


 
 
case  L_S_RR_R2 :  
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 16) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.l[( ((inst.b >> 16) & 0xff)   )] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ]) +4 ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )) : (regs_F.l[( ((inst.b >> 16) & 0xff)   )] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ]) +4 ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )))  ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 
 
 
case  S_S_RR_R2 :  
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ]) +4 ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( ((inst.b >> 16) & 0xff)   )] : regs_F.l[( ((inst.b >> 16) & 0xff)   )])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))   ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 
 
case  LW_RR_R2 :  
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ]) +4 ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (addr = (  ( (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ]) +4 ) ),	(spec_mode	? spec_mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Read, addr,  &temp_uint   ,	sizeof( temp_uint   ))),	((unsigned int)(( unsigned int ) temp_uint   )))   )))  ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 
 
case  SW_RR_R2 :  
	((spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_fore_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) ,	( (addr = (  (  (((( use_spec_R )[(  ( (inst.b >> 24)   ) )/32] & (1 << ((  ( (inst.b >> 24)   ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)   ] : regs_R[ (inst.b >> 24)   ]) + (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 8) & 0xff)  ] : regs_R[ ((inst.b >> 8) & 0xff)  ]) +4 ) ),	 temp_uint    = (  unsigned int )((unsigned int)( ( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) )),	(spec_mode	? spec_mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))	: mem_access(Write, addr,  &temp_uint   ,	sizeof( temp_uint   ))))   ),	(spec_mode ? (((( use_spec_R )[(  ( (  (inst.b >> 24)   ) ) )/32] |= (1 << ((  ( (  (inst.b >> 24)   ) ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] )) : (regs_R[ (  (inst.b >> 24)   ) ] = (  (((( use_spec_R )[(  (   (inst.b >> 24)    ) )/32] & (1 << ((  (   (inst.b >> 24)    ) ) % 32))) != 0) 	? spec_regs_R[   (inst.b >> 24)    ] : regs_R[   (inst.b >> 24)    ])  + ss_aft_tab[(  4 )-1][((inst.a & 0xff00) >> 8) ] ))) )  ; break; 


 



case  ADD :  
	(((((( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) > 0) && (( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) > 0)	&& (0x7fffffff  - ( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) < ( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )))	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 553,   "+ overflow"   ) )  : (void)0),	(((( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) < 0) && (( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) < 0)	&& (- 0x7fffffff  - ( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) > ( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )))	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 553,   "+ underflow"   ) )  : (void)0)) , (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  + (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  + (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ))) ) ; break; 
case  ADDI :  
	(((((( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) > 0) && (( ((int)(( short)(inst.b & 0xffff)))  ) > 0)	&& (0x7fffffff  - ( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) < ( ((int)(( short)(inst.b & 0xffff)))  )))	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 558,   "+ overflow"   ) )  : (void)0),	(((( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) < 0) && (( ((int)(( short)(inst.b & 0xffff)))  ) < 0)	&& (- 0x7fffffff  - ( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) > ( ((int)(( short)(inst.b & 0xffff)))  )))	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 558,   "+ underflow"   ) )  : (void)0)) , (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  + ((int)(( short)(inst.b & 0xffff)))  )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  + ((int)(( short)(inst.b & 0xffff)))  ))) ) ; break; 
case  ADDU :  
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  + (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  + (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )))  ; break; 
case  ADDIU :  
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  + ((int)(( short)(inst.b & 0xffff)))  )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  + ((int)(( short)(inst.b & 0xffff)))  )))  ; break; 

case  SUB :  
	(((((( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) > 0) && (( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) < 0)	&& (0x7fffffff  + ( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) < ( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  )))	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 574,   "- overflow"   ) )  : (void)0),	(((( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) < 0) && (( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) > 0)	&& (- 0x7fffffff  + ( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) > ( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  )))	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 574,   "- underflow"   ) )  : (void)0)) , (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  - (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  - (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ))) ) ; break; 
case  SUBU :  
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  - (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  - (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )))  ; break; 

case  MULT :  
	InstMULT(inst) ; break; 
case  MULTU :  
	InstMULTU(inst) ; break; 
case  DIV :  
	((spec_mode	?  (void)0	: ((( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) == 0) ? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 596,   "divide by 0"   ) )  : (void)0)) ,
	 (spec_mode ? (use_spec_LO= 1 , spec_regs_LO = ( (((  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) == 0) ? 0 : (( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) / (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )))  )) : (regs_LO = ( (((  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) == 0) ? 0 : (( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) / (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )))  ))) , (spec_mode ? (use_spec_HI= 1 , spec_regs_HI = ( (((  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) == 0) ? 0 : (( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) % (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )))  )) : (regs_HI = ( (((  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) == 0) ? 0 : (( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ) % (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )))  ))) ) ; break; 
case  DIVU :  
	((spec_mode	?  (void)0	: ((( (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ) == 0) ? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 603,   "divide by 0"   ) )  : (void)0)) ,
	 (spec_mode ? (use_spec_LO= 1 , spec_regs_LO = ( (((  ((unsigned)(((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) ) == 0) ? 0 : (( ((unsigned)(((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ]) ) ) / (  ((unsigned)(((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) )))  )) : (regs_LO = ( (((  ((unsigned)(((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) ) == 0) ? 0 : (( ((unsigned)(((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ]) ) ) / (  ((unsigned)(((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) )))  ))) ,
	 (spec_mode ? (use_spec_HI= 1 , spec_regs_HI = ( (((  ((unsigned)(((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) ) == 0) ? 0 : (( ((unsigned)(((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ]) ) ) % (  ((unsigned)(((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) )))  )) : (regs_HI = ( (((  ((unsigned)(((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) ) == 0) ? 0 : (( ((unsigned)(((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ]) ) ) % (  ((unsigned)(((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) )))  ))) ) ; break; 

case  MFHI :  
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (use_spec_HI ? spec_regs_HI : regs_HI)  )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (use_spec_HI ? spec_regs_HI : regs_HI)  )))  ; break; 
case  MTHI :  
	(spec_mode ? (use_spec_HI= 1 , spec_regs_HI = ( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  )) : (regs_HI = ( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  )))  ; break; 
case  MFLO :  
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (use_spec_LO ? spec_regs_LO : regs_LO)  )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (use_spec_LO ? spec_regs_LO : regs_LO)  )))  ; break; 
case  MTLO :  
	(spec_mode ? (use_spec_LO= 1 , spec_regs_LO = ( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  )) : (regs_LO = ( (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  )))  ; break; 

 
case  AND_ :  
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  & (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  & (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )))  ; break; 
case  ANDI :  
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  & (inst.b & 0xffff)  )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  & (inst.b & 0xffff)  )))  ; break; 
case  OR :  
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  | (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  | (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )))  ; break; 
case  ORI :  
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  | (inst.b & 0xffff)  )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  | (inst.b & 0xffff)  )))  ; break; 
case  XOR :  
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ^ (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ^ (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )))  ; break; 
case  XORI :  
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ^ (inst.b & 0xffff)  )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  ^ (inst.b & 0xffff)  )))  ; break; 
case  NOR :  
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  ~((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  | (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  ~((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  | (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) )))  ; break; 

case  SLL :  
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  << (inst.b & 0xff)  )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  << (inst.b & 0xff)  )))  ; break; 
case  SLLV :  
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  << ((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  & 037) )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  << ((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  & 037) )))  ; break; 
case  SRL :  
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  ((unsigned)(((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) >> (inst.b & 0xff)  )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  ((unsigned)(((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) >> (inst.b & 0xff)  )))  ; break; 
case  SRLV :  
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  ((unsigned)(((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) >> ((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  & 037) )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  ((unsigned)(((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) >> ((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  & 037) )))  ; break; 
case  SRA :  
	InstSRA(inst) ; break; 
case  SRAV :  
	InstSRAV(inst) ; break; 

case  SLT :  
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  ((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  < (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) ? 1 : 0 )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  ((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  < (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) ) ? 1 : 0 )))  ; break; 
case  SLTI :  
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  ((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  < ((int)(( short)(inst.b & 0xffff))) ) ? 1 : 0 )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  ((((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  < ((int)(( short)(inst.b & 0xffff))) ) ? 1 : 0 )))  ; break; 
case  SLTU :  
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 8) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 8) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((unsigned)(((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ]) ) < ((unsigned)(((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) )) ? 1 : 0 )) : (regs_R[ ((inst.b >> 8) & 0xff)  ] = (  (((unsigned)(((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ]) ) < ((unsigned)(((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ]) )) ? 1 : 0 )))  ; break; 
case  SLTIU :  
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  ((unsigned)(((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  < (unsigned)((int)(( short)(inst.b & 0xffff))) ) ? 1 : 0 )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  ((unsigned)(((( use_spec_R )[(  ( (inst.b >> 24)  ) )/32] & (1 << ((  ( (inst.b >> 24)  ) ) % 32))) != 0) 	? spec_regs_R[ (inst.b >> 24)  ] : regs_R[ (inst.b >> 24)  ])  < (unsigned)((int)(( short)(inst.b & 0xffff))) ) ? 1 : 0 )))  ; break; 


 



case  FADD_S :  
	 
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 726,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 726,   "bad FP register alignment"   ) )  : (void)0) , ((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 726,   "bad FP register alignment"   ) )  : (void)0) ,
	 (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  + (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  )) : (regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  + (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  ))) ) ; break; 
case  FADD_D :  
	 
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 733,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 733,   "bad FP register alignment"   ) )  : (void)0) , ((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 733,   "bad FP register alignment"   ) )  : (void)0) ,
	 (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  + (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  )) : (regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  + (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  ))) ) ; break; 
case  FSUB_S :  
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 739,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 739,   "bad FP register alignment"   ) )  : (void)0) , ((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 739,   "bad FP register alignment"   ) )  : (void)0) ,
	 (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  - (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  )) : (regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  - (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  ))) ) ; break; 
case  FSUB_D :  
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 745,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 745,   "bad FP register alignment"   ) )  : (void)0) , ((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 745,   "bad FP register alignment"   ) )  : (void)0) ,
	 (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  - (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  )) : (regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  - (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  ))) ) ; break; 
case  FMUL_S :  
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 751,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 751,   "bad FP register alignment"   ) )  : (void)0) , ((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 751,   "bad FP register alignment"   ) )  : (void)0) ,
	 (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  * (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  )) : (regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  * (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  ))) ) ; break; 
case  FMUL_D :  
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 757,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 757,   "bad FP register alignment"   ) )  : (void)0) , ((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 757,   "bad FP register alignment"   ) )  : (void)0) ,
	 (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  * (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  )) : (regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  * (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  ))) ) ; break; 
case  FDIV_S :  
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 763,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 763,   "bad FP register alignment"   ) )  : (void)0) , ((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 763,   "bad FP register alignment"   ) )  : (void)0) ,
	 ((spec_mode	?  (void)0	: ((( (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  ) == 0) ? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 763,   "divide by 0"   ) )  : (void)0)) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  (((  (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  ) == 0) ? 0 : (( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  ) / (  (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  )))  )) : (regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  (((  (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  ) == 0) ? 0 : (( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  ) / (  (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  )))  ))) )) ; break; 
case  FDIV_D :  
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 769,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 769,   "bad FP register alignment"   ) )  : (void)0) , ((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 769,   "bad FP register alignment"   ) )  : (void)0) ,
	 ((spec_mode	?  (void)0	: ((( (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  ) == 0) ? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 769,   "divide by 0"   ) )  : (void)0)) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  (((  (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  ) == 0) ? 0 : (( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  ) / (  (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  )))  )) : (regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  (((  (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  ) == 0) ? 0 : (( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  ) / (  (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  )))  ))) )) ; break; 
case  FABS_S :  
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 774,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 774,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  fabs((double)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )]) ) )) : (regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  fabs((double)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )]) ) ))) ) ; break; 
case  FABS_D :  
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 779,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 779,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  fabs((((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1]) ) )) : (regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  fabs((((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1]) ) ))) ) ; break; 
case  FMOV_S :  
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 784,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 784,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  )) : (regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  ))) ) ; break; 
case  FMOV_D :  
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 789,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 789,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  )) : (regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  ))) ) ; break; 
case  FNEG_S :  
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 794,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 794,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  - (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  )) : (regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  - (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  ))) ) ; break; 
case  FNEG_D :  
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 799,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 799,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  - (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  )) : (regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  - (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  ))) ) ; break; 

case  CVT_S_D :  
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 805,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 805,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  (float)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  )) : (regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  (float)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  ))) ) ; break; 
case  CVT_S_W :  
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 810,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 810,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  (float)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( (inst.b >> 24)   )] : regs_F.l[( (inst.b >> 24)   )])  )) : (regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  (float)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( (inst.b >> 24)   )] : regs_F.l[( (inst.b >> 24)   )])  ))) ) ; break; 
case  CVT_D_S :  
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 815,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 815,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  (double)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  )) : (regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  (double)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  ))) ) ; break; 
case  CVT_D_W :  
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 820,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 820,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  (double)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( (inst.b >> 24)   )] : regs_F.l[( (inst.b >> 24)   )])  )) : (regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  (double)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( (inst.b >> 24)   )] : regs_F.l[( (inst.b >> 24)   )])  ))) ) ; break; 
case  CVT_W_S :  
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 825,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 825,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.l[( ((inst.b >> 8) & 0xff)   )] = (  (int)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  )) : (regs_F.l[( ((inst.b >> 8) & 0xff)   )] = (  (int)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  ))) ) ; break; 
case  CVT_W_D :  
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 830,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 830,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.l[( ((inst.b >> 8) & 0xff)   )] = (  (int)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  )) : (regs_F.l[( ((inst.b >> 8) & 0xff)   )] = (  (int)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  ))) ) ; break; 

case  C_EQ_S :  
	(((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 836,   "bad FP register alignment"   ) )  : (void)0) , ((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 836,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (use_spec_FCC= 1 , spec_regs_FCC = ( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  == (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  )) : (regs_FCC = ( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  == (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  ))) ) ; break; 
case  C_EQ_D :  
	(((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 841,   "bad FP register alignment"   ) )  : (void)0) , ((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 841,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (use_spec_FCC= 1 , spec_regs_FCC = ( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  == (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  )) : (regs_FCC = ( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  == (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  ))) ) ; break; 
case  C_LT_S :  
	(((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 846,   "bad FP register alignment"   ) )  : (void)0) , ((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 846,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (use_spec_FCC= 1 , spec_regs_FCC = ( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  < (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  )) : (regs_FCC = ( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  < (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  ))) ) ; break; 
case  C_LT_D :  
	(((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 851,   "bad FP register alignment"   ) )  : (void)0) , ((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 851,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (use_spec_FCC= 1 , spec_regs_FCC = ( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  < (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  )) : (regs_FCC = ( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  < (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  ))) ) ; break; 
case  C_LE_S :  
	(((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 856,   "bad FP register alignment"   ) )  : (void)0) , ((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 856,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (use_spec_FCC= 1 , spec_regs_FCC = ( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  <= (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  )) : (regs_FCC = ( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )])  <= (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( ((inst.b >> 16) & 0xff)   )] : regs_F.f[( ((inst.b >> 16) & 0xff)   )])  ))) ) ; break; 
case  C_LE_D :  
	(((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 861,   "bad FP register alignment"   ) )  : (void)0) , ((( ((inst.b >> 16) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 861,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (use_spec_FCC= 1 , spec_regs_FCC = ( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  <= (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  )) : (regs_FCC = ( (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1])  <= (((( use_spec_F )[(  (( ((inst.b >> 16) & 0xff)   )&~1) )/32] & (1 << ((  (( ((inst.b >> 16) & 0xff)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1] : regs_F.d[( ((inst.b >> 16) & 0xff)   ) >> 1])  ))) ) ; break; 

case  FSQRT_S :  
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 867,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 867,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  sqrt((double)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )]) ) )) : (regs_F.f[( ((inst.b >> 8) & 0xff)   )] = (  sqrt((double)(((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.f[( (inst.b >> 24)   )] : regs_F.f[( (inst.b >> 24)   )]) ) ))) ) ; break; 
case  FSQRT_D :  
	(((( ((inst.b >> 8) & 0xff)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 872,   "bad FP register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 872,   "bad FP register alignment"   ) )  : (void)0) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 8) & 0xff)   )&~1) )/32] |= (1 << (( (( ((inst.b >> 8) & 0xff)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  sqrt((((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1]) ) )) : (regs_F.d[( ((inst.b >> 8) & 0xff)   ) >> 1] = (  sqrt((((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.d[( (inst.b >> 24)   ) >> 1] : regs_F.d[( (inst.b >> 24)   ) >> 1]) ) ))) ) ; break; 


 



case  SYSCALL :  
	( (spec_mode ? _panic("ss.def", __FUNCTION__, 883,  "speculative syscall"  )  : (void) 0),	ss_syscall(mem_access,  inst ))  ; break; 
case  BREAK :  
	 
	 (void) 0 ; break; 
case  LUI :  
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (inst.b & 0xffff)  << 16 )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (inst.b & 0xffff)  << 16 )))  ; break; 

case  MFC1 :  
	(spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( (inst.b >> 24)   )] : regs_F.l[( (inst.b >> 24)   )])  )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( (inst.b >> 24)   )] : regs_F.l[( (inst.b >> 24)   )])  )))  ; break; 
case  DMFC1 :  
	(((( ((inst.b >> 16) & 0xff)  ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 908,   "bad INT register alignment"   ) )  : (void)0) , ((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 908,   "bad FP register alignment"   ) )  : (void)0) ,
	 (spec_mode ? (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] |= (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( (inst.b >> 24)   )] : regs_F.l[( (inst.b >> 24)   )])  )) : (regs_R[ ((inst.b >> 16) & 0xff)  ] = (  (((( use_spec_F )[(  (( (inst.b >> 24)   )&~1) )/32] & (1 << ((  (( (inst.b >> 24)   )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( (inst.b >> 24)   )] : regs_F.l[( (inst.b >> 24)   )])  ))) , (spec_mode ? (((( use_spec_R )[(  ( (((inst.b >> 16) & 0xff) )+1 ) )/32] |= (1 << ((  ( (((inst.b >> 16) & 0xff) )+1 ) ) % 32))), ( use_spec_R )) ,	spec_regs_R[ (((inst.b >> 16) & 0xff) )+1 ] = (  (((( use_spec_F )[(  (( ((inst.b >> 24)  )+1 )&~1) )/32] & (1 << ((  (( ((inst.b >> 24)  )+1 )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( ((inst.b >> 24)  )+1 )] : regs_F.l[( ((inst.b >> 24)  )+1 )])  )) : (regs_R[ (((inst.b >> 16) & 0xff) )+1 ] = (  (((( use_spec_F )[(  (( ((inst.b >> 24)  )+1 )&~1) )/32] & (1 << ((  (( ((inst.b >> 24)  )+1 )&~1) ) % 32))) != 0) 	? spec_regs_F.l[( ((inst.b >> 24)  )+1 )] : regs_F.l[( ((inst.b >> 24)  )+1 )])  ))) ) ; break; 
case  CFC1 :  
	 ((void) 0) ; break; 
case  MTC1 :  
	(spec_mode ? (((( use_spec_F )[( (( (inst.b >> 24)   )&~1) )/32] |= (1 << (( (( (inst.b >> 24)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.l[( (inst.b >> 24)   )] = (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )) : (regs_F.l[( (inst.b >> 24)   )] = (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )))  ; break; 
case  DMTC1 :  
	(((( (inst.b >> 24)   ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 924,   "bad FP register alignment"   ) )  : (void)0) , ((( ((inst.b >> 16) & 0xff)  ) & 01)	? (spec_mode ?  (void)0 :  (void)_fatal("ss.def", __FUNCTION__, 924,   "bad INT register alignment"   ) )  : (void)0) ,
	 (spec_mode ? (((( use_spec_F )[( (( (inst.b >> 24)   )&~1) )/32] |= (1 << (( (( (inst.b >> 24)   )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.l[( (inst.b >> 24)   )] = (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  )) : (regs_F.l[( (inst.b >> 24)   )] = (  (((( use_spec_R )[(  ( ((inst.b >> 16) & 0xff)  ) )/32] & (1 << ((  ( ((inst.b >> 16) & 0xff)  ) ) % 32))) != 0) 	? spec_regs_R[ ((inst.b >> 16) & 0xff)  ] : regs_R[ ((inst.b >> 16) & 0xff)  ])  ))) , (spec_mode ? (((( use_spec_F )[( (( ((inst.b >> 24)  )+1 )&~1) )/32] |= (1 << (( (( ((inst.b >> 24)  )+1 )&~1) ) % 32))), ( use_spec_F )) ,	spec_regs_F.l[( ((inst.b >> 24)  )+1 )] = (  (((( use_spec_R )[(  ( (((inst.b >> 16) & 0xff) )+1 ) )/32] & (1 << ((  ( (((inst.b >> 16) & 0xff) )+1 ) ) % 32))) != 0) 	? spec_regs_R[ (((inst.b >> 16) & 0xff) )+1 ] : regs_R[ (((inst.b >> 16) & 0xff) )+1 ])  )) : (regs_F.l[( ((inst.b >> 24)  )+1 )] = (  (((( use_spec_R )[(  ( (((inst.b >> 16) & 0xff) )+1 ) )/32] & (1 << ((  ( (((inst.b >> 16) & 0xff) )+1 ) ) % 32))) != 0) 	? spec_regs_R[ (((inst.b >> 16) & 0xff) )+1 ] : regs_R[ (((inst.b >> 16) & 0xff) )+1 ])  ))) ) ; break; 
case  CTC1 :  
	 ((void) 0) ; break; 






            default:
              _panic("sim-outorder.c", __FUNCTION__, 4052,  "bogus opcode"  ) ;
            }

           
          if ((ss_op2flags[ op ])  & 0x00000020 )
            {
              if ((ss_op2flags[ op ])  & 0x00000080 )
                is_write = 1 ;
            }

           
          if (((dlite_check || dlite_active)	? __check_break(( next_PC ), ( 
                                is_write ? 0x02  : 0x01  ), ( 
                                addr ), (  sim_num_insn ), (  sim_num_insn ))	: 0 ) )
            dlite_main(regs_PC, next_PC, sim_num_insn);

           
          regs_PC = next_PC;
          next_PC += sizeof(SS_INST_TYPE) ;
        }
    }

  fprintf(((_IO_FILE*)(&_IO_stderr_))  , "sim: ** starting performance simulation **\n");

   
  fetch_regs_PC = regs_PC - sizeof(SS_INST_TYPE) ;
  fetch_pred_PC = regs_PC;
  regs_PC = regs_PC - sizeof(SS_INST_TYPE) ;

   

  for (;;)
    {
       
      if (RUU_num < LSQ_num)
	_panic("sim-outorder.c", __FUNCTION__, 4087,  "RUU_num < LSQ_num"  ) ;
      if (((RUU_head + RUU_num) % RUU_size) != RUU_tail)
	_panic("sim-outorder.c", __FUNCTION__, 4089,  "RUU_head/RUU_tail wedged"  ) ;
      if (((LSQ_head + LSQ_num) % LSQ_size) != LSQ_tail)
	_panic("sim-outorder.c", __FUNCTION__, 4091,  "LSQ_head/LSQ_tail wedged"  ) ;

       
      ((ptrace_outfd != ((void *)0) 	&& !range_cmp_range1(&ptrace_range, ( regs_PC ), (  sim_num_insn ), (  sim_cycle )))	? (!ptrace_oneshot ? (ptrace_active = ptrace_oneshot = 1 ) : 0 ) : (ptrace_active = 0 )) ;

       
      if (ptrace_active) __ptrace_newcycle(( sim_cycle )) ;

       
      ruu_commit();

       
      ruu_release_fu();

       

       
       
      ruu_writeback();

      if (!bugcompat_mode)
	{
	   
	   
	  lsq_refresh();

	   
	   
	  ruu_issue();
	}

       
       
      ruu_dispatch();

      if (bugcompat_mode)
	{
	   
	   
	  lsq_refresh();

	   
	   
	  ruu_issue();
	}

       
      if (!ruu_fetch_issue_delay)
	ruu_fetch();
      else
	ruu_fetch_issue_delay--;

       
      sim_cycle++;

       
      if (max_insts && sim_total_insn >= max_insts)
        return;
    }
}
