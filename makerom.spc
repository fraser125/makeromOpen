# 1 "makerom.h"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "makerom.h"


# 1 "c:\\gcc\\lib\\gcc\\x86_64-w64-mingw32\\9.1.0\\include\\stdint.h" 1 3 4
# 9 "c:\\gcc\\lib\\gcc\\x86_64-w64-mingw32\\9.1.0\\include\\stdint.h" 3 4
# 1 "c:\\gcc\\x86_64-w64-mingw32\\include\\stdint.h" 1 3 4
# 28 "c:\\gcc\\x86_64-w64-mingw32\\include\\stdint.h" 3 4
# 1 "c:\\gcc\\x86_64-w64-mingw32\\include\\crtdefs.h" 1 3 4
# 10 "c:\\gcc\\x86_64-w64-mingw32\\include\\crtdefs.h" 3 4
# 1 "c:\\gcc\\x86_64-w64-mingw32\\include\\_mingw.h" 1 3 4
# 12 "c:\\gcc\\x86_64-w64-mingw32\\include\\_mingw.h" 3 4
# 1 "c:\\gcc\\x86_64-w64-mingw32\\include\\_mingw_mac.h" 1 3 4
# 91 "c:\\gcc\\x86_64-w64-mingw32\\include\\_mingw_mac.h" 3 4
             
# 100 "c:\\gcc\\x86_64-w64-mingw32\\include\\_mingw_mac.h" 3 4
             
# 13 "c:\\gcc\\x86_64-w64-mingw32\\include\\_mingw.h" 2 3 4
# 1 "c:\\gcc\\x86_64-w64-mingw32\\include\\_mingw_secapi.h" 1 3 4
# 14 "c:\\gcc\\x86_64-w64-mingw32\\include\\_mingw.h" 2 3 4
# 275 "c:\\gcc\\x86_64-w64-mingw32\\include\\_mingw.h" 3 4
# 1 "c:\\gcc\\x86_64-w64-mingw32\\include\\vadefs.h" 1 3 4
# 9 "c:\\gcc\\x86_64-w64-mingw32\\include\\vadefs.h" 3 4
# 1 "c:\\gcc\\x86_64-w64-mingw32\\include\\_mingw.h" 1 3 4
# 565 "c:\\gcc\\x86_64-w64-mingw32\\include\\_mingw.h" 3 4
# 1 "c:\\gcc\\x86_64-w64-mingw32\\include\\sdks/_mingw_directx.h" 1 3 4
# 566 "c:\\gcc\\x86_64-w64-mingw32\\include\\_mingw.h" 2 3 4
# 1 "c:\\gcc\\x86_64-w64-mingw32\\include\\sdks/_mingw_ddk.h" 1 3 4
# 567 "c:\\gcc\\x86_64-w64-mingw32\\include\\_mingw.h" 2 3 4
# 10 "c:\\gcc\\x86_64-w64-mingw32\\include\\vadefs.h" 2 3 4




#pragma pack(push,_CRT_PACKING)
# 24 "c:\\gcc\\x86_64-w64-mingw32\\include\\vadefs.h" 3 4
  
# 24 "c:\\gcc\\x86_64-w64-mingw32\\include\\vadefs.h" 3 4
 typedef __builtin_va_list __gnuc_va_list;






  typedef __gnuc_va_list va_list;
# 103 "c:\\gcc\\x86_64-w64-mingw32\\include\\vadefs.h" 3 4
#pragma pack(pop)
# 276 "c:\\gcc\\x86_64-w64-mingw32\\include\\_mingw.h" 2 3 4
# 539 "c:\\gcc\\x86_64-w64-mingw32\\include\\_mingw.h" 3 4
void __attribute__((__cdecl__)) __debugbreak(void);
extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) void __attribute__((__cdecl__)) __debugbreak(void)
{
  __asm__ __volatile__("int {$}3":);
}




const char *__mingw_get_crt_info (void);
# 11 "c:\\gcc\\x86_64-w64-mingw32\\include\\crtdefs.h" 2 3 4




#pragma pack(push,_CRT_PACKING)
# 35 "c:\\gcc\\x86_64-w64-mingw32\\include\\crtdefs.h" 3 4
__extension__ typedef unsigned long long size_t;
# 45 "c:\\gcc\\x86_64-w64-mingw32\\include\\crtdefs.h" 3 4
__extension__ typedef long long ssize_t;






typedef size_t rsize_t;
# 62 "c:\\gcc\\x86_64-w64-mingw32\\include\\crtdefs.h" 3 4
__extension__ typedef long long intptr_t;
# 75 "c:\\gcc\\x86_64-w64-mingw32\\include\\crtdefs.h" 3 4
__extension__ typedef unsigned long long uintptr_t;
# 88 "c:\\gcc\\x86_64-w64-mingw32\\include\\crtdefs.h" 3 4
__extension__ typedef long long ptrdiff_t;
# 98 "c:\\gcc\\x86_64-w64-mingw32\\include\\crtdefs.h" 3 4
typedef unsigned short wchar_t;







typedef unsigned short wint_t;
typedef unsigned short wctype_t;





typedef int errno_t;




typedef long __time32_t;




__extension__ typedef long long __time64_t;
# 138 "c:\\gcc\\x86_64-w64-mingw32\\include\\crtdefs.h" 3 4
typedef __time64_t time_t;
# 422 "c:\\gcc\\x86_64-w64-mingw32\\include\\crtdefs.h" 3 4
struct threadlocaleinfostruct;
struct threadmbcinfostruct;
typedef struct threadlocaleinfostruct *pthreadlocinfo;
typedef struct threadmbcinfostruct *pthreadmbcinfo;
struct __lc_time_data;

typedef struct localeinfo_struct {
  pthreadlocinfo locinfo;
  pthreadmbcinfo mbcinfo;
} _locale_tstruct,*_locale_t;



typedef struct tagLC_ID {
  unsigned short wLanguage;
  unsigned short wCountry;
  unsigned short wCodePage;
} LC_ID,*LPLC_ID;




typedef struct threadlocaleinfostruct {
  int refcount;
  unsigned int lc_codepage;
  unsigned int lc_collate_cp;
  unsigned long lc_handle[6];
  LC_ID lc_id[6];
  struct {
    char *locale;
    wchar_t *wlocale;
    int *refcount;
    int *wrefcount;
  } lc_category[6];
  int lc_clike;
  int mb_cur_max;
  int *lconv_intl_refcount;
  int *lconv_num_refcount;
  int *lconv_mon_refcount;
  struct lconv *lconv;
  int *ctype1_refcount;
  unsigned short *ctype1;
  const unsigned short *pctype;
  const unsigned char *pclmap;
  const unsigned char *pcumap;
  struct __lc_time_data *lc_time_curr;
} threadlocinfo;







#pragma pack(pop)
# 29 "c:\\gcc\\x86_64-w64-mingw32\\include\\stdint.h" 2 3 4



# 1 "c:\\gcc\\lib\\gcc\\x86_64-w64-mingw32\\9.1.0\\include\\stddef.h" 1 3 4
# 1 "c:\\gcc\\x86_64-w64-mingw32\\include\\stddef.h" 1 3 4
# 18 "c:\\gcc\\x86_64-w64-mingw32\\include\\stddef.h" 3 4
  __attribute__ ((__dllimport__)) extern int *__attribute__((__cdecl__)) _errno(void);

  errno_t __attribute__((__cdecl__)) _set_errno(int _Value);
  errno_t __attribute__((__cdecl__)) _get_errno(int *_Value);


  __attribute__ ((__dllimport__)) extern unsigned long __attribute__((__cdecl__)) __threadid(void);

  __attribute__ ((__dllimport__)) extern uintptr_t __attribute__((__cdecl__)) __threadhandle(void);
# 2 "c:\\gcc\\lib\\gcc\\x86_64-w64-mingw32\\9.1.0\\include\\stddef.h" 2 3 4
# 416 "c:\\gcc\\lib\\gcc\\x86_64-w64-mingw32\\9.1.0\\include\\stddef.h" 3 4
typedef struct {
  long long __max_align_ll __attribute__((__aligned__(__alignof__(long long))));
  long double __max_align_ld __attribute__((__aligned__(__alignof__(long double))));
# 427 "c:\\gcc\\lib\\gcc\\x86_64-w64-mingw32\\9.1.0\\include\\stddef.h" 3 4
} max_align_t;
# 33 "c:\\gcc\\x86_64-w64-mingw32\\include\\stdint.h" 2 3 4


typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef short int16_t;
typedef unsigned short uint16_t;
typedef int int32_t;
typedef unsigned uint32_t;
__extension__ typedef long long int64_t;
__extension__ typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef unsigned char uint_least8_t;
typedef short int_least16_t;
typedef unsigned short uint_least16_t;
typedef int int_least32_t;
typedef unsigned uint_least32_t;
__extension__ typedef long long int_least64_t;
__extension__ typedef unsigned long long uint_least64_t;





typedef signed char int_fast8_t;
typedef unsigned char uint_fast8_t;
typedef short int_fast16_t;
typedef unsigned short uint_fast16_t;
typedef int int_fast32_t;
typedef unsigned int uint_fast32_t;
__extension__ typedef long long int_fast64_t;
__extension__ typedef unsigned long long uint_fast64_t;


__extension__ typedef long long intmax_t;
__extension__ typedef unsigned long long uintmax_t;
# 10 "c:\\gcc\\lib\\gcc\\x86_64-w64-mingw32\\9.1.0\\include\\stdint.h" 2 3 4
# 4 "makerom.h" 2
# 1 "c:\\gcc\\lib\\gcc\\x86_64-w64-mingw32\\9.1.0\\include\\stdbool.h" 1 3 4
# 5 "makerom.h" 2

# 5 "makerom.h"
typedef struct arg_struct_t {
 int size;
 int disk_type;
 char disk_boot_type;
 char fill_byte;
 
# 10 "makerom.h" 3 4
_Bool 
# 10 "makerom.h"
     overlay_warning;
 
# 11 "makerom.h" 3 4
_Bool 
# 11 "makerom.h"
     dd64Mode;
 
# 12 "makerom.h" 3 4
_Bool 
# 12 "makerom.h"
     debugMode;
 
# 13 "makerom.h" 3 4
_Bool 
# 13 "makerom.h"
     linkError;
 
# 14 "makerom.h" 3 4
_Bool 
# 14 "makerom.h"
     mapFile;
 
# 15 "makerom.h" 3 4
_Bool 
# 15 "makerom.h"
     output;
 char *includes;
 char *defines;
 char *undefines;
 char *bootstrap;
 char *romheader;
 char *pif;
 char *font;
 char *resource_dir;
 char *output_file;
 char *output_symbols;
} arg_struct_t;

struct arg_struct_t arg_struct;
