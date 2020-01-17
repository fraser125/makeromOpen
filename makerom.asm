GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 1


   1              		.file	"makerom.c"
   2              		.text
   3              		.comm	arg_struct, 96, 5
   4              		.comm	conversion_int, 4, 2
   5              		.globl	define_str
   6              		.section .rdata,"dr"
   7              	.LC0:
   8 0000 00       		.ascii "\0"
   9              		.data
  10              		.align 8
  11              	define_str:
  12 0000 00000000 		.quad	.LC0
  12      00000000 
  13              		.globl	include_str
  14              		.align 8
  15              	include_str:
  16 0008 00000000 		.quad	.LC0
  16      00000000 
  17              		.globl	bootstrap_file
  18              		.section .rdata,"dr"
  19              	.LC1:
  20 0001 426F6F74 		.ascii "Boot\0"
  20      00
  21              		.data
  22              		.align 8
  23              	bootstrap_file:
  24 0010 01000000 		.quad	.LC1
  24      00000000 
  25              		.globl	romheader_file
  26              		.section .rdata,"dr"
  27              	.LC2:
  28 0006 726F6D68 		.ascii "romheader\0"
  28      65616465 
  28      7200
  29              		.data
  30              		.align 8
  31              	romheader_file:
  32 0018 06000000 		.quad	.LC2
  32      00000000 
  33              		.globl	pif_file
  34              		.section .rdata,"dr"
  35              	.LC3:
  36 0010 70696632 		.ascii "pif2Boot\0"
  36      426F6F74 
  36      00
  37              		.data
  38              		.align 8
  39              	pif_file:
  40 0020 10000000 		.quad	.LC3
  40      00000000 
  41              		.globl	font_file
  42              		.section .rdata,"dr"
  43              	.LC4:
  44 0019 666F6E74 		.ascii "font\0"
  44      00
  45              		.data
  46              		.align 8
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 2


  47              	font_file:
  48 0028 19000000 		.quad	.LC4
  48      00000000 
  49              		.globl	output_file
  50              		.section .rdata,"dr"
  51              	.LC5:
  52 001e 726F6D00 		.ascii "rom\0"
  53              		.data
  54              		.align 8
  55              	output_file:
  56 0030 1E000000 		.quad	.LC5
  56      00000000 
  57              		.globl	symbol_file
  58              		.align 8
  59              	symbol_file:
  60 0038 00000000 		.quad	.LC0
  60      00000000 
  61              		.globl	spec_file
  62              		.section .rdata,"dr"
  63              	.LC6:
  64 0022 73706563 		.ascii "spec\0"
  64      00
  65              		.data
  66              		.align 8
  67              	spec_file:
  68 0040 22000000 		.quad	.LC6
  68      00000000 
  69              		.globl	directory_str
  70              		.align 8
  71              	directory_str:
  72 0048 00000000 		.quad	.LC0
  72      00000000 
  73              		.globl	resource_directory
  74              		.align 8
  75              	resource_directory:
  76 0050 00000000 		.quad	.LC0
  76      00000000 
  77 0058 00000000 		.text
  77      00000000 
  78              		.globl	mystrcat
  79              		.def	mystrcat;	.scl	2;	.type	32;	.endef
  80              		.seh_proc	mystrcat
  81              	mystrcat:
  82 0000 55       		pushq	%rbp
  83              		.seh_pushreg	%rbp
  84 0001 4889E5   		movq	%rsp, %rbp
  85              		.seh_setframe	%rbp, 0
  86              		.seh_endprologue
  87 0004 48894D10 		movq	%rcx, 16(%rbp)
  88 0008 48895518 		movq	%rdx, 24(%rbp)
  89 000c EB05     		jmp	.L2
  90              	.L3:
  91 000e 48834510 		addq	$1, 16(%rbp)
  91      01
  92              	.L2:
  93 0013 488B4510 		movq	16(%rbp), %rax
  94 0017 0FB600   		movzbl	(%rax), %eax
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 3


  95 001a 84C0     		testb	%al, %al
  96 001c 75F0     		jne	.L3
  97 001e 90       		nop
  98              	.L4:
  99 001f 488B5518 		movq	24(%rbp), %rdx
 100 0023 488D4201 		leaq	1(%rdx), %rax
 101 0027 48894518 		movq	%rax, 24(%rbp)
 102 002b 488B4510 		movq	16(%rbp), %rax
 103 002f 488D4801 		leaq	1(%rax), %rcx
 104 0033 48894D10 		movq	%rcx, 16(%rbp)
 105 0037 0FB612   		movzbl	(%rdx), %edx
 106 003a 8810     		movb	%dl, (%rax)
 107 003c 0FB600   		movzbl	(%rax), %eax
 108 003f 84C0     		testb	%al, %al
 109 0041 75DC     		jne	.L4
 110 0043 48836D10 		subq	$1, 16(%rbp)
 110      01
 111 0048 488B4510 		movq	16(%rbp), %rax
 112 004c 5D       		popq	%rbp
 113 004d C3       		ret
 114              		.seh_endproc
 115              		.globl	exec_and_wait
 116              		.def	exec_and_wait;	.scl	2;	.type	32;	.endef
 117              		.seh_proc	exec_and_wait
 118              	exec_and_wait:
 119 004e 55       		pushq	%rbp
 120              		.seh_pushreg	%rbp
 121 004f 4889E5   		movq	%rsp, %rbp
 122              		.seh_setframe	%rbp, 0
 123 0052 4883EC30 		subq	$48, %rsp
 124              		.seh_stackalloc	48
 125              		.seh_endprologue
 126 0056 48894D10 		movq	%rcx, 16(%rbp)
 127 005a 48895518 		movq	%rdx, 24(%rbp)
 128 005e C745FC00 		movl	$0, -4(%rbp)
 128      000000
 129 0065 E8000000 		call	fork
 129      00
 130 006a 4898     		cltq
 131 006c 488945F0 		movq	%rax, -16(%rbp)
 132 0070 48837DF0 		cmpq	$0, -16(%rbp)
 132      00
 133 0075 751A     		jne	.L7
 134 0077 488B4518 		movq	24(%rbp), %rax
 135 007b 4889C2   		movq	%rax, %rdx
 136 007e 488B4D10 		movq	16(%rbp), %rcx
 137 0082 E8000000 		call	execvp
 137      00
 138 0087 B9010000 		movl	$1, %ecx
 138      00
 139 008c E8000000 		call	_exit
 139      00
 140              	.L7:
 141 0091 8B45FC   		movl	-4(%rbp), %eax
 142 0094 4883C430 		addq	$48, %rsp
 143 0098 5D       		popq	%rbp
 144 0099 C3       		ret
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 4


 145              		.seh_endproc
 146              		.section .rdata,"dr"
 147              	.LC7:
 148 0027 0946696C 		.ascii "\11Filename : %s\12\0"
 148      656E616D 
 148      65203A20 
 148      25730A00 
 149              	.LC8:
 150 0037 0946696C 		.ascii "\11File Exists: %d\12\0"
 150      65204578 
 150      69737473 
 150      3A202564 
 150      0A00
 151              	.LC9:
 152 0049 0946696C 		.ascii "\11File Read : %d\12\0"
 152      65205265 
 152      6164203A 
 152      2025640A 
 152      00
 153              	.LC10:
 154 005a 0946696C 		.ascii "\11File Write : %d\12\0"
 154      65205772 
 154      69746520 
 154      3A202564 
 154      0A00
 155              	.LC11:
 156 006c 0946696C 		.ascii "\11File Execute : %d\12\0"
 156      65204578 
 156      65637574 
 156      65203A20 
 156      25640A00 
 157              		.text
 158              		.globl	file_exists
 159              		.def	file_exists;	.scl	2;	.type	32;	.endef
 160              		.seh_proc	file_exists
 161              	file_exists:
 162 009a 55       		pushq	%rbp
 163              		.seh_pushreg	%rbp
 164 009b 4889E5   		movq	%rsp, %rbp
 165              		.seh_setframe	%rbp, 0
 166 009e 4883EC20 		subq	$32, %rsp
 167              		.seh_stackalloc	32
 168              		.seh_endprologue
 169 00a2 48894D10 		movq	%rcx, 16(%rbp)
 170 00a6 895518   		movl	%edx, 24(%rbp)
 171 00a9 488B5510 		movq	16(%rbp), %rdx
 172 00ad 488D0D27 		leaq	.LC7(%rip), %rcx
 172      000000
 173 00b4 E8000000 		call	printf
 173      00
 174 00b9 BA000000 		movl	$0, %edx
 174      00
 175 00be 488B4D10 		movq	16(%rbp), %rcx
 176 00c2 E8000000 		call	access
 176      00
 177 00c7 83C001   		addl	$1, %eax
 178 00ca 89C2     		movl	%eax, %edx
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 5


 179 00cc 488D0D37 		leaq	.LC8(%rip), %rcx
 179      000000
 180 00d3 E8000000 		call	printf
 180      00
 181 00d8 BA040000 		movl	$4, %edx
 181      00
 182 00dd 488B4D10 		movq	16(%rbp), %rcx
 183 00e1 E8000000 		call	access
 183      00
 184 00e6 83C001   		addl	$1, %eax
 185 00e9 89C2     		movl	%eax, %edx
 186 00eb 488D0D49 		leaq	.LC9(%rip), %rcx
 186      000000
 187 00f2 E8000000 		call	printf
 187      00
 188 00f7 BA020000 		movl	$2, %edx
 188      00
 189 00fc 488B4D10 		movq	16(%rbp), %rcx
 190 0100 E8000000 		call	access
 190      00
 191 0105 83C001   		addl	$1, %eax
 192 0108 89C2     		movl	%eax, %edx
 193 010a 488D0D5A 		leaq	.LC10(%rip), %rcx
 193      000000
 194 0111 E8000000 		call	printf
 194      00
 195 0116 BA010000 		movl	$1, %edx
 195      00
 196 011b 488B4D10 		movq	16(%rbp), %rcx
 197 011f E8000000 		call	access
 197      00
 198 0124 83C001   		addl	$1, %eax
 199 0127 89C2     		movl	%eax, %edx
 200 0129 488D0D6C 		leaq	.LC11(%rip), %rcx
 200      000000
 201 0130 E8000000 		call	printf
 201      00
 202 0135 8B4518   		movl	24(%rbp), %eax
 203 0138 89C2     		movl	%eax, %edx
 204 013a 488B4D10 		movq	16(%rbp), %rcx
 205 013e E8000000 		call	access
 205      00
 206 0143 83F8FF   		cmpl	$-1, %eax
 207 0146 0F95C0   		setne	%al
 208 0149 4883C420 		addq	$32, %rsp
 209 014d 5D       		popq	%rbp
 210 014e C3       		ret
 211              		.seh_endproc
 212              		.globl	file_exists_path
 213              		.def	file_exists_path;	.scl	2;	.type	32;	.endef
 214              		.seh_proc	file_exists_path
 215              	file_exists_path:
 216 014f 55       		pushq	%rbp
 217              		.seh_pushreg	%rbp
 218 0150 4889E5   		movq	%rsp, %rbp
 219              		.seh_setframe	%rbp, 0
 220 0153 4883EC20 		subq	$32, %rsp
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 6


 221              		.seh_stackalloc	32
 222              		.seh_endprologue
 223 0157 48894D10 		movq	%rcx, 16(%rbp)
 224 015b 895518   		movl	%edx, 24(%rbp)
 225 015e 8B4518   		movl	24(%rbp), %eax
 226 0161 89C2     		movl	%eax, %edx
 227 0163 488B4D10 		movq	16(%rbp), %rcx
 228 0167 E82EFFFF 		call	file_exists
 228      FF
 229 016c 4883C420 		addq	$32, %rsp
 230 0170 5D       		popq	%rbp
 231 0171 C3       		ret
 232              		.seh_endproc
 233              		.section .rdata,"dr"
 234              	.LC12:
 235 0080 5C00     		.ascii "\\\0"
 236              	.LC13:
 237 0082 09504154 		.ascii "\11PATH MAX: %d\12\0"
 237      48204D41 
 237      583A2025 
 237      640A00
 238              	.LC14:
 239 0091 0946696C 		.ascii "\11File name: %s\12\0"
 239      65206E61 
 239      6D653A20 
 239      25730A00 
 240              	.LC15:
 241 00a1 0946696C 		.ascii "\11File name length: %d\12\0"
 241      65206E61 
 241      6D65206C 
 241      656E6774 
 241      683A2025 
 242              	.LC16:
 243 00b8 09437572 		.ascii "\11Current working dir: %s\12\0"
 243      72656E74 
 243      20776F72 
 243      6B696E67 
 243      20646972 
 244              	.LC17:
 245 00d2 09646972 		.ascii "\11dir name length: %d\12\0"
 245      206E616D 
 245      65206C65 
 245      6E677468 
 245      3A202564 
 246              	.LC18:
 247 00e8 09506174 		.ascii "\11Path is Null %d\12\0"
 247      68206973 
 247      204E756C 
 247      6C202564 
 247      0A00
 248              	.LC19:
 249 00fa 0946756C 		.ascii "\11Full dir and file: %s\12\0"
 249      6C206469 
 249      7220616E 
 249      64206669 
 249      6C653A20 
 250              		.text
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 7


 251              		.globl	file_exists_current_dir
 252              		.def	file_exists_current_dir;	.scl	2;	.type	32;	.endef
 253              		.seh_proc	file_exists_current_dir
 254              	file_exists_current_dir:
 255 0172 55       		pushq	%rbp
 256              		.seh_pushreg	%rbp
 257 0173 4881EC50 		subq	$336, %rsp
 257      010000
 258              		.seh_stackalloc	336
 259 017a 488DAC24 		leaq	128(%rsp), %rbp
 259      80000000 
 260              		.seh_setframe	%rbp, 128
 261              		.seh_endprologue
 262 0182 48898DE0 		movq	%rcx, 224(%rbp)
 262      000000
 263 0189 8995E800 		movl	%edx, 232(%rbp)
 263      0000
 264 018f BA000000 		movl	$0, %edx
 264      00
 265 0194 B9000000 		movl	$0, %ecx
 265      00
 266 0199 E8000000 		call	getcwd
 266      00
 267 019e 488985C8 		movq	%rax, 200(%rbp)
 267      000000
 268 01a5 488D45A0 		leaq	-96(%rbp), %rax
 269 01a9 488985C0 		movq	%rax, 192(%rbp)
 269      000000
 270 01b0 C645A000 		movb	$0, -96(%rbp)
 271 01b4 488D0580 		leaq	.LC12(%rip), %rax
 271      000000
 272 01bb 488985B8 		movq	%rax, 184(%rbp)
 272      000000
 273 01c2 488B95C8 		movq	200(%rbp), %rdx
 273      000000
 274 01c9 488B85C0 		movq	192(%rbp), %rax
 274      000000
 275 01d0 4889C1   		movq	%rax, %rcx
 276 01d3 E828FEFF 		call	mystrcat
 276      FF
 277 01d8 488985C0 		movq	%rax, 192(%rbp)
 277      000000
 278 01df 488B95B8 		movq	184(%rbp), %rdx
 278      000000
 279 01e6 488B85C0 		movq	192(%rbp), %rax
 279      000000
 280 01ed 4889C1   		movq	%rax, %rcx
 281 01f0 E80BFEFF 		call	mystrcat
 281      FF
 282 01f5 488985C0 		movq	%rax, 192(%rbp)
 282      000000
 283 01fc 488B85C0 		movq	192(%rbp), %rax
 283      000000
 284 0203 488B95E0 		movq	224(%rbp), %rdx
 284      000000
 285 020a 4889C1   		movq	%rax, %rcx
 286 020d E8EEFDFF 		call	mystrcat
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 8


 286      FF
 287 0212 488985C0 		movq	%rax, 192(%rbp)
 287      000000
 288 0219 488B8DE0 		movq	224(%rbp), %rcx
 288      000000
 289 0220 E8000000 		call	strlen
 289      00
 290 0225 8985B400 		movl	%eax, 180(%rbp)
 290      0000
 291 022b 488B85C8 		movq	200(%rbp), %rax
 291      000000
 292 0232 4889C1   		movq	%rax, %rcx
 293 0235 E8000000 		call	strlen
 293      00
 294 023a 8985B000 		movl	%eax, 176(%rbp)
 294      0000
 295 0240 BA040100 		movl	$260, %edx
 295      00
 296 0245 488D0D82 		leaq	.LC13(%rip), %rcx
 296      000000
 297 024c E8000000 		call	printf
 297      00
 298 0251 488B95E0 		movq	224(%rbp), %rdx
 298      000000
 299 0258 488D0D91 		leaq	.LC14(%rip), %rcx
 299      000000
 300 025f E8000000 		call	printf
 300      00
 301 0264 8B85B400 		movl	180(%rbp), %eax
 301      0000
 302 026a 89C2     		movl	%eax, %edx
 303 026c 488D0DA1 		leaq	.LC15(%rip), %rcx
 303      000000
 304 0273 E8000000 		call	printf
 304      00
 305 0278 488B85C8 		movq	200(%rbp), %rax
 305      000000
 306 027f 4889C2   		movq	%rax, %rdx
 307 0282 488D0DB8 		leaq	.LC16(%rip), %rcx
 307      000000
 308 0289 E8000000 		call	printf
 308      00
 309 028e 8B85B000 		movl	176(%rbp), %eax
 309      0000
 310 0294 89C2     		movl	%eax, %edx
 311 0296 488D0DD2 		leaq	.LC17(%rip), %rcx
 311      000000
 312 029d E8000000 		call	printf
 312      00
 313 02a2 4883BDC0 		cmpq	$0, 192(%rbp)
 313      00000000 
 314 02aa 0F94C0   		sete	%al
 315 02ad 0FB6C0   		movzbl	%al, %eax
 316 02b0 89C2     		movl	%eax, %edx
 317 02b2 488D0DE8 		leaq	.LC18(%rip), %rcx
 317      000000
 318 02b9 E8000000 		call	printf
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 9


 318      00
 319 02be 488D45A0 		leaq	-96(%rbp), %rax
 320 02c2 4889C2   		movq	%rax, %rdx
 321 02c5 488D0DFA 		leaq	.LC19(%rip), %rcx
 321      000000
 322 02cc E8000000 		call	printf
 322      00
 323 02d1 8B95E800 		movl	232(%rbp), %edx
 323      0000
 324 02d7 488D45A0 		leaq	-96(%rbp), %rax
 325 02db 4889C1   		movq	%rax, %rcx
 326 02de E8B7FDFF 		call	file_exists
 326      FF
 327 02e3 4881C450 		addq	$336, %rsp
 327      010000
 328 02ea 5D       		popq	%rbp
 329 02eb C3       		ret
 330              		.seh_endproc
 331              		.section .rdata,"dr"
 332 0112 00000000 		.align 8
 332      0000
 333              	.LC20:
 334 0118 75736167 		.ascii "usage:%s [option(s)] specfile\15\12\0"
 334      653A2573 
 334      205B6F70 
 334      74696F6E 
 334      2873295D 
 335              	.LC21:
 336 0138 36344444 		.ascii "64DD\15\0"
 336      0D00
 337 013e 0000     		.align 8
 338              	.LC22:
 339 0140 092D4444 		.ascii "\11-DD64         : set DD64 mode (makedisk mode)\15\0"
 339      36342020 
 339      20202020 
 339      2020203A 
 339      20736574 
 340              		.align 8
 341              	.LC23:
 342 0170 092D743C 		.ascii "\11-t<disktype>  : set disk type ( Only use DD64 mode )\15\0"
 342      6469736B 
 342      74797065 
 342      3E20203A 
 342      20736574 
 343              	.LC24:
 344 01a7 50617373 		.ascii "Passed to gcc\15\0"
 344      65642074 
 344      6F206763 
 344      630D00
 345 01b6 0000     		.align 8
 346              	.LC25:
 347 01b8 092D446E 		.ascii "\11-Dname[=def]  : passed to cpp for use during its invocation\15\0"
 347      616D655B 
 347      3D646566 
 347      5D20203A 
 347      20706173 
 348 01f6 0000     		.align 8
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 10


 349              	.LC26:
 350 01f8 092D4964 		.ascii "\11-Idirectory   : passed to cpp for use during its invocation\15\0"
 350      69726563 
 350      746F7279 
 350      2020203A 
 350      20706173 
 351 0236 0000     		.align 8
 352              	.LC27:
 353 0238 092D556E 		.ascii "\11-Uname        : passed to cpp for use during its invocation\15\0"
 353      616D6520 
 353      20202020 
 353      2020203A 
 353      20706173 
 354              	.LC28:
 355 0276 466C6167 		.ascii "Flags\15\0"
 355      730D00
 356 027d 000000   		.align 8
 357              	.LC29:
 358 0280 092D6420 		.ascii "\11-d            : debug mode ( don't remove temporary files )\15\0"
 358      20202020 
 358      20202020 
 358      2020203A 
 358      20646562 
 359 02be 0000     		.align 8
 360              	.LC30:
 361 02c0 092D4520 		.ascii "\11-E            : link error(undef. symbol) stop mode\15\0"
 361      20202020 
 361      20202020 
 361      2020203A 
 361      206C696E 
 362 02f6 0000     		.align 8
 363              	.LC31:
 364 02f8 092D6D20 		.ascii "\11-m            : print a link editor map to stdout\15\0"
 364      20202020 
 364      20202020 
 364      2020203A 
 364      20707269 
 365 032c 00000000 		.align 8
 366              	.LC32:
 367 0330 092D6F20 		.ascii "\11-o            : provided for compatibility with other tools\15\0"
 367      20202020 
 367      20202020 
 367      2020203A 
 367      2070726F 
 368 036e 0000     		.align 8
 369              	.LC33:
 370 0370 092D7720 		.ascii "\11-w            : disable overlay warning display\15\0"
 370      20202020 
 370      20202020 
 370      2020203A 
 370      20646973 
 371              	.LC34:
 372 03a2 46696C65 		.ascii "Files\15\0"
 372      730D00
 373 03a9 00000000 		.align 8
 373      000000
 374              	.LC35:
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 11


 375 03b0 092D623C 		.ascii "\11-b<filename>  : set bootstrap file     [Boot]\15\0"
 375      66696C65 
 375      6E616D65 
 375      3E20203A 
 375      20736574 
 376              		.align 8
 377              	.LC36:
 378 03e0 092D683C 		.ascii "\11-h<filename>  : set romheader file     [romheader]\15\0"
 378      66696C65 
 378      6E616D65 
 378      3E20203A 
 378      20736574 
 379 0415 000000   		.align 8
 380              	.LC37:
 381 0418 092D703C 		.ascii "\11-p<filename>  : set pif bootstrap file [pif2Boot]\15\0"
 381      66696C65 
 381      6E616D65 
 381      3E20203A 
 381      20736574 
 382 044c 00000000 		.align 8
 383              	.LC38:
 384 0450 092D463C 		.ascii "\11-F<filename>  : set font file          [font]\15\0"
 384      66696C65 
 384      6E616D65 
 384      3E20203A 
 384      20736574 
 385              		.align 8
 386              	.LC39:
 387 0480 092D4C3C 		.ascii "\11-L<directory> : set resource directory [/usr/lib/PR]\15\0"
 387      64697265 
 387      63746F72 
 387      793E203A 
 387      20736574 
 388 04b7 00       		.align 8
 389              	.LC40:
 390 04b8 092D723C 		.ascii "\11-r<filename>  : set output file        [rom]\15\0"
 390      66696C65 
 390      6E616D65 
 390      3E20203A 
 390      20736574 
 391 04e7 00       		.align 8
 392              	.LC41:
 393 04e8 092D653C 		.ascii "\11-e<filename>  : set output symbol file\15\0"
 393      66696C65 
 393      6E616D65 
 393      3E20203A 
 393      20736574 
 394 0511 00000000 		.align 8
 394      000000
 395              	.LC42:
 396 0518 09403C66 		.ascii "\11@<filename>   : specify indirect file \15\0"
 396      696C656E 
 396      616D653E 
 396      2020203A 
 396      20737065 
 397              	.LC43:
 398 0541 4F707469 		.ascii "Options\15\0"
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 12


 398      6F6E730D 
 398      00
 399 054a 00000000 		.align 8
 399      0000
 400              	.LC44:
 401 0550 092D733C 		.ascii "\11-s<romsize>   : set minimum rom size (Mbits)\15\0"
 401      726F6D73 
 401      697A653E 
 401      2020203A 
 401      20736574 
 402              	.LC45:
 403 057f 656E7669 		.ascii "environment\15\0"
 403      726F6E6D 
 403      656E740D 
 403      00
 404 058c 00000000 		.align 8
 405              	.LC46:
 406 0590 094D494C 		.ascii "\11MILD_OPT      : passed to ld\15\0"
 406      445F4F50 
 406      54202020 
 406      2020203A 
 406      20706173 
 407 05af 00       		.align 8
 408              	.LC47:
 409 05b0 09474343 		.ascii "\11GCCDIR        : tool directory $(GCCDIR)/mipse/bin\15\0"
 409      44495220 
 409      20202020 
 409      2020203A 
 409      20746F6F 
 410 05e5 000000   		.align 8
 411              	.LC48:
 412 05e8 0954454D 		.ascii "\11TEMP          : temporary directory\15\0"
 412      50202020 
 412      20202020 
 412      2020203A 
 412      2074656D 
 413              		.text
 414              		.globl	usage
 415              		.def	usage;	.scl	2;	.type	32;	.endef
 416              		.seh_proc	usage
 417              	usage:
 418 02ec 55       		pushq	%rbp
 419              		.seh_pushreg	%rbp
 420 02ed 4889E5   		movq	%rsp, %rbp
 421              		.seh_setframe	%rbp, 0
 422 02f0 4883EC20 		subq	$32, %rsp
 423              		.seh_stackalloc	32
 424              		.seh_endprologue
 425 02f4 48894D10 		movq	%rcx, 16(%rbp)
 426 02f8 488B5510 		movq	16(%rbp), %rdx
 427 02fc 488D0D18 		leaq	.LC20(%rip), %rcx
 427      010000
 428 0303 E8000000 		call	printf
 428      00
 429 0308 488D0D38 		leaq	.LC21(%rip), %rcx
 429      010000
 430 030f E8000000 		call	puts
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 13


 430      00
 431 0314 488D0D40 		leaq	.LC22(%rip), %rcx
 431      010000
 432 031b E8000000 		call	puts
 432      00
 433 0320 488D0D70 		leaq	.LC23(%rip), %rcx
 433      010000
 434 0327 E8000000 		call	puts
 434      00
 435 032c 488D0DA7 		leaq	.LC24(%rip), %rcx
 435      010000
 436 0333 E8000000 		call	puts
 436      00
 437 0338 488D0DB8 		leaq	.LC25(%rip), %rcx
 437      010000
 438 033f E8000000 		call	puts
 438      00
 439 0344 488D0DF8 		leaq	.LC26(%rip), %rcx
 439      010000
 440 034b E8000000 		call	puts
 440      00
 441 0350 488D0D38 		leaq	.LC27(%rip), %rcx
 441      020000
 442 0357 E8000000 		call	puts
 442      00
 443 035c 488D0D76 		leaq	.LC28(%rip), %rcx
 443      020000
 444 0363 E8000000 		call	puts
 444      00
 445 0368 488D0D80 		leaq	.LC29(%rip), %rcx
 445      020000
 446 036f E8000000 		call	puts
 446      00
 447 0374 488D0DC0 		leaq	.LC30(%rip), %rcx
 447      020000
 448 037b E8000000 		call	puts
 448      00
 449 0380 488D0DF8 		leaq	.LC31(%rip), %rcx
 449      020000
 450 0387 E8000000 		call	puts
 450      00
 451 038c 488D0D30 		leaq	.LC32(%rip), %rcx
 451      030000
 452 0393 E8000000 		call	puts
 452      00
 453 0398 488D0D70 		leaq	.LC33(%rip), %rcx
 453      030000
 454 039f E8000000 		call	puts
 454      00
 455 03a4 488D0DA2 		leaq	.LC34(%rip), %rcx
 455      030000
 456 03ab E8000000 		call	puts
 456      00
 457 03b0 488D0DB0 		leaq	.LC35(%rip), %rcx
 457      030000
 458 03b7 E8000000 		call	puts
 458      00
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 14


 459 03bc 488D0DE0 		leaq	.LC36(%rip), %rcx
 459      030000
 460 03c3 E8000000 		call	puts
 460      00
 461 03c8 488D0D18 		leaq	.LC37(%rip), %rcx
 461      040000
 462 03cf E8000000 		call	puts
 462      00
 463 03d4 488D0D50 		leaq	.LC38(%rip), %rcx
 463      040000
 464 03db E8000000 		call	puts
 464      00
 465 03e0 488D0D80 		leaq	.LC39(%rip), %rcx
 465      040000
 466 03e7 E8000000 		call	puts
 466      00
 467 03ec 488D0DB8 		leaq	.LC40(%rip), %rcx
 467      040000
 468 03f3 E8000000 		call	puts
 468      00
 469 03f8 488D0DE8 		leaq	.LC41(%rip), %rcx
 469      040000
 470 03ff E8000000 		call	puts
 470      00
 471 0404 488D0D18 		leaq	.LC42(%rip), %rcx
 471      050000
 472 040b E8000000 		call	puts
 472      00
 473 0410 488D0D41 		leaq	.LC43(%rip), %rcx
 473      050000
 474 0417 E8000000 		call	puts
 474      00
 475 041c 488D0D50 		leaq	.LC44(%rip), %rcx
 475      050000
 476 0423 E8000000 		call	puts
 476      00
 477 0428 488D0D7F 		leaq	.LC45(%rip), %rcx
 477      050000
 478 042f E8000000 		call	puts
 478      00
 479 0434 488D0D90 		leaq	.LC46(%rip), %rcx
 479      050000
 480 043b E8000000 		call	puts
 480      00
 481 0440 488D0DB0 		leaq	.LC47(%rip), %rcx
 481      050000
 482 0447 E8000000 		call	puts
 482      00
 483 044c 488D0DE8 		leaq	.LC48(%rip), %rcx
 483      050000
 484 0453 E8000000 		call	puts
 484      00
 485 0458 90       		nop
 486 0459 4883C420 		addq	$32, %rsp
 487 045d 5D       		popq	%rbp
 488 045e C3       		ret
 489              		.seh_endproc
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 15


 490              		.def	__main;	.scl	2;	.type	32;	.endef
 491              		.section .rdata,"dr"
 492              	.LC49:
 493 060e 496E7370 		.ascii "Inspired By:\15\0"
 493      69726564 
 493      2042793A 
 493      0D00
 494 061c 00000000 		.align 8
 495              	.LC50:
 496 0620 726F6D20 		.ascii "rom image link editor version 1.01 (gcc32) Copyright (c) 1997 Hudson/KMC\15\0"
 496      696D6167 
 496      65206C69 
 496      6E6B2065 
 496      6469746F 
 497              	.LC51:
 498 066a 09617267 		.ascii "\11argc %d\12\0"
 498      63202564 
 498      0A00
 499              	.LC52:
 500 0674 09617267 		.ascii "\11arg0 %s\12\0"
 500      30202573 
 500      0A00
 501 067e 0000     		.align 8
 502              	.LC54:
 503 0680 456C6170 		.ascii "Elapsed: %f seconds to execute \12\0"
 503      7365643A 
 503      20256620 
 503      7365636F 
 503      6E647320 
 504              	.LC55:
 505 06a1 096F7074 		.ascii "\11opt: %c\15\12\0"
 505      3A202563 
 505      0D0A00
 506              	.LC56:
 507 06ac 096F7074 		.ascii "\11optind: %d\15\12\0"
 507      696E643A 
 507      2025640D 
 507      0A00
 508              	.LC57:
 509 06ba 096F7074 		.ascii "\11optarg: %s\15\12\0"
 509      6172673A 
 509      2025730D 
 509      0A00
 510              	.LC58:
 511 06c8 096F7074 		.ascii "\11optopt: %c\15\12\0"
 511      6F70743A 
 511      2025630D 
 511      0A00
 512              	.LC59:
 513 06d6 096F7074 		.ascii "\11opterr: %d\15\12\0"
 513      6572723A 
 513      2025640D 
 513      0A00
 514 06e4 00000000 		.align 8
 515              	.LC60:
 516 06e8 094D6973 		.ascii "\11Missing value for parameter %c\15\12\0"
 516      73696E67 
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 16


 516      2076616C 
 516      75652066 
 516      6F722070 
 517 070a 00000000 		.align 8
 517      0000
 518              	.LC61:
 519 0710 09417267 		.ascii "\11Argument %c : Invalid value %s\12\0"
 519      756D656E 
 519      74202563 
 519      203A2049 
 519      6E76616C 
 520              	.LC62:
 521 0731 44363400 		.ascii "D64\0"
 522              	.LC63:
 523 0735 6F707469 		.ascii "option: %c \12\0"
 523      6F6E3A20 
 523      2563200A 
 523      00
 524              	.LC64:
 525 0742 64697265 		.ascii "directory: %s\12\0"
 525      63746F72 
 525      793A2025 
 525      730A00
 526              	.LC65:
 527 0751 756E6B6E 		.ascii "unknown option: %c\12\0"
 527      6F776E20 
 527      6F707469 
 527      6F6E3A20 
 527      25630A00 
 528              	.LC66:
 529 0765 756E6B6E 		.ascii "unknown value: %s\15\12\0"
 529      6F776E20 
 529      76616C75 
 529      653A2025 
 529      730D0A00 
 530 0779 00000000 		.align 8
 530      000000
 531              	.LC67:
 532 0780 3A623A42 		.ascii ":b:B:dD:e:Ef:F:h:I:L:mo:p:r:s:t:U:w\0"
 532      3A64443A 
 532      653A4566 
 532      3A463A68 
 532      3A493A4C 
 533              	.LC68:
 534 07a4 46696C65 		.ascii "File not found %s\12\0"
 534      206E6F74 
 534      20666F75 
 534      6E642025 
 534      730A00
 535              	.LC69:
 536 07b7 46696C65 		.ascii "File not writable %s\12\0"
 536      206E6F74 
 536      20777269 
 536      7461626C 
 536      65202573 
 537              	.LC70:
 538 07cd 25733A20 		.ascii "%s: using rom header: %s\12\0"
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 17


 538      7573696E 
 538      6720726F 
 538      6D206865 
 538      61646572 
 539              	.LC71:
 540 07e7 25733A20 		.ascii "%s: using pif2Boot: %s\12\0"
 540      7573696E 
 540      67207069 
 540      6632426F 
 540      6F743A20 
 541              	.LC72:
 542 07ff 25733A20 		.ascii "%s: using font file: %s\12\0"
 542      7573696E 
 542      6720666F 
 542      6E742066 
 542      696C653A 
 543              	.LC73:
 544 0818 25733A20 		.ascii "%s: using boot strap: %s\12\0"
 544      7573696E 
 544      6720626F 
 544      6F742073 
 544      74726170 
 545              	.LC74:
 546 0832 25733A20 		.ascii "%s: using spec file: %s\12\0"
 546      7573696E 
 546      67207370 
 546      65632066 
 546      696C653A 
 547              	.LC75:
 548 084b 25733A20 		.ascii "%s: using output file: %s\12\0"
 548      7573696E 
 548      67206F75 
 548      74707574 
 548      2066696C 
 549              	.LC76:
 550 0866 63707000 		.ascii "cpp\0"
 551 086a 00000000 		.align 8
 551      0000
 552              	.LC77:
 553 0870 25733A20 		.ascii "%s: %s -D_LANGUAGE_MAKEROM %s.cvt %s\12\0"
 553      2573202D 
 553      445F4C41 
 553      4E475541 
 553      47455F4D 
 554              	.LC78:
 555 0896 2A2E7370 		.ascii "*.spc\0"
 555      6300
 556              	.LC79:
 557 089c 2D445F4C 		.ascii "-D_LANGUAGE_MAKEROM\0"
 557      414E4755 
 557      4147455F 
 557      4D414B45 
 557      524F4D00 
 558              	.LC80:
 559 08b0 25733A20 		.ascii "%s: creating command file\12\0"
 559      63726561 
 559      74696E67 
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 18


 559      20636F6D 
 559      6D616E64 
 560              	.LC81:
 561 08cb 25733A20 		.ascii "%s: execute link editor\12\0"
 561      65786563 
 561      75746520 
 561      6C696E6B 
 561      20656469 
 562              	.LC82:
 563 08e4 2A2E636D 		.ascii "*.cmd\0"
 563      6400
 564              	.LC83:
 565 08ea 6C6400   		.ascii "ld\0"
 566 08ed 000000   		.align 8
 567              	.LC84:
 568 08f0 25733A20 		.ascii "%s: %s -G 0 -noinhibit-exec -T %s -o blocks.out\12\0"
 568      2573202D 
 568      47203020 
 568      2D6E6F69 
 568      6E686962 
 569              	.LC85:
 570 0921 2D472030 		.ascii "-G 0 -noinhibit-exec -T\0"
 570      202D6E6F 
 570      696E6869 
 570      6269742D 
 570      65786563 
 571              	.LC86:
 572 0939 2D6F00   		.ascii "-o\0"
 573              	.LC87:
 574 093c 25733A20 		.ascii "%s: creating entry source\12\0"
 574      63726561 
 574      74696E67 
 574      20656E74 
 574      72792073 
 575              	.LC88:
 576 0957 2D6E6F6E 		.ascii "-non_shared\0"
 576      5F736861 
 576      72656400 
 577              	.LC89:
 578 0963 617300   		.ascii "as\0"
 579              	.LC90:
 580 0966 25733A20 		.ascii "%s: %s %s %s\12\0"
 580      25732025 
 580      73202573 
 580      0A00
 581              	.LC91:
 582 0974 2A2E7300 		.ascii "*.s\0"
 583              	.LC92:
 584 0978 25733A20 		.ascii "%s: assemble entry source\12\0"
 584      61737365 
 584      6D626C65 
 584      20656E74 
 584      72792073 
 585              	.LC93:
 586 0993 6C7300   		.ascii "ls\0"
 587              	.LC94:
 588 0996 25733A20 		.ascii "%s: %s -R %s -o %s\12\0"
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 19


 588      2573202D 
 588      52202573 
 588      202D6F20 
 588      25730A00 
 589              	.LC95:
 590 09aa 612E6F75 		.ascii "a.out\0"
 590      7400
 591              	.LC96:
 592 09b0 25733A20 		.ascii "%s: writing %s\12\0"
 592      77726974 
 592      696E6720 
 592      25730A00 
 593              	.LC97:
 594 09c0 436F6D70 		.ascii "Complete\0"
 594      6C657465 
 594      00
 595              		.text
 596              		.globl	main
 597              		.def	main;	.scl	2;	.type	32;	.endef
 598              		.seh_proc	main
 599              	main:
 600 045f 55       		pushq	%rbp
 601              		.seh_pushreg	%rbp
 602 0460 4889E5   		movq	%rsp, %rbp
 603              		.seh_setframe	%rbp, 0
 604 0463 4881ECB0 		subq	$176, %rsp
 604      000000
 605              		.seh_stackalloc	176
 606              		.seh_endprologue
 607 046a 894D10   		movl	%ecx, 16(%rbp)
 608 046d 48895518 		movq	%rdx, 24(%rbp)
 609 0471 E8000000 		call	__main
 609      00
 610 0476 E8000000 		call	clock
 610      00
 611 047b 8945F8   		movl	%eax, -8(%rbp)
 612 047e C745FC00 		movl	$0, -4(%rbp)
 612      000000
 613 0485 488D0D0E 		leaq	.LC49(%rip), %rcx
 613      060000
 614 048c E8000000 		call	puts
 614      00
 615 0491 488D0D20 		leaq	.LC50(%rip), %rcx
 615      060000
 616 0498 E8000000 		call	puts
 616      00
 617 049d 8B5510   		movl	16(%rbp), %edx
 618 04a0 488D0D6A 		leaq	.LC51(%rip), %rcx
 618      060000
 619 04a7 E8000000 		call	printf
 619      00
 620 04ac 837D1001 		cmpl	$1, 16(%rbp)
 621 04b0 7516     		jne	.L17
 622 04b2 488B4518 		movq	24(%rbp), %rax
 623 04b6 488B00   		movq	(%rax), %rax
 624 04b9 4889C2   		movq	%rax, %rdx
 625 04bc 488D0D74 		leaq	.LC52(%rip), %rcx
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 20


 625      060000
 626 04c3 E8000000 		call	printf
 626      00
 627              	.L17:
 628 04c8 837D1001 		cmpl	$1, 16(%rbp)
 629 04cc 0F85B903 		jne	.L20
 629      0000
 630 04d2 488B4518 		movq	24(%rbp), %rax
 631 04d6 488B00   		movq	(%rax), %rax
 632 04d9 4889C1   		movq	%rax, %rcx
 633 04dc E80BFEFF 		call	usage
 633      FF
 634 04e1 E8000000 		call	clock
 634      00
 635 04e6 2B45F8   		subl	-8(%rbp), %eax
 636 04e9 8945F8   		movl	%eax, -8(%rbp)
 637 04ec F20F2A45 		cvtsi2sdl	-8(%rbp), %xmm0
 637      F8
 638 04f1 F20F100D 		movsd	.LC53(%rip), %xmm1
 638      C80A0000 
 639 04f9 F20F5EC1 		divsd	%xmm1, %xmm0
 640 04fd F20F1145 		movsd	%xmm0, -56(%rbp)
 640      C8
 641 0502 F20F1045 		movsd	-56(%rbp), %xmm0
 641      C8
 642 0507 488B45C8 		movq	-56(%rbp), %rax
 643 050b 660F28C8 		movapd	%xmm0, %xmm1
 644 050f 4889C2   		movq	%rax, %rdx
 645 0512 488D0D80 		leaq	.LC54(%rip), %rcx
 645      060000
 646 0519 E8000000 		call	printf
 646      00
 647 051e B8000000 		movl	$0, %eax
 647      00
 648 0523 E95B0900 		jmp	.L71
 648      00
 649              	.L49:
 650 0528 8B45F4   		movl	-12(%rbp), %eax
 651 052b 89C2     		movl	%eax, %edx
 652 052d 488D0DA1 		leaq	.LC55(%rip), %rcx
 652      060000
 653 0534 E8000000 		call	printf
 653      00
 654 0539 488B0500 		movq	.refptr.optind(%rip), %rax
 654      000000
 655 0540 8B00     		movl	(%rax), %eax
 656 0542 89C2     		movl	%eax, %edx
 657 0544 488D0DAC 		leaq	.LC56(%rip), %rcx
 657      060000
 658 054b E8000000 		call	printf
 658      00
 659 0550 488B0500 		movq	.refptr.optarg(%rip), %rax
 659      000000
 660 0557 488B00   		movq	(%rax), %rax
 661 055a 4889C2   		movq	%rax, %rdx
 662 055d 488D0DBA 		leaq	.LC57(%rip), %rcx
 662      060000
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 21


 663 0564 E8000000 		call	printf
 663      00
 664 0569 488B0500 		movq	.refptr.optopt(%rip), %rax
 664      000000
 665 0570 8B00     		movl	(%rax), %eax
 666 0572 89C2     		movl	%eax, %edx
 667 0574 488D0DC8 		leaq	.LC58(%rip), %rcx
 667      060000
 668 057b E8000000 		call	printf
 668      00
 669 0580 488B0500 		movq	.refptr.opterr(%rip), %rax
 669      000000
 670 0587 8B00     		movl	(%rax), %eax
 671 0589 89C2     		movl	%eax, %edx
 672 058b 488D0DD6 		leaq	.LC59(%rip), %rcx
 672      060000
 673 0592 E8000000 		call	printf
 673      00
 674 0597 488D0500 		leaq	arg_struct(%rip), %rax
 674      000000
 675 059e C6400C01 		movb	$1, 12(%rax)
 676 05a2 8B45F4   		movl	-12(%rbp), %eax
 677 05a5 83E83A   		subl	$58, %eax
 678 05a8 83F83D   		cmpl	$61, %eax
 679 05ab 0F879302 		ja	.L21
 679      0000
 680 05b1 89C0     		movl	%eax, %eax
 681 05b3 488D1485 		leaq	0(,%rax,4), %rdx
 681      00000000 
 682 05bb 488D05CC 		leaq	.L23(%rip), %rax
 682      090000
 683 05c2 8B0402   		movl	(%rdx,%rax), %eax
 684 05c5 4898     		cltq
 685 05c7 488D15CC 		leaq	.L23(%rip), %rdx
 685      090000
 686 05ce 4801D0   		addq	%rdx, %rax
 687 05d1 FFE0     		jmp	*%rax
 688              		.section .rdata,"dr"
 689 09c9 000000   		.align 4
 690              	.L23:
 691 09cc D7050000 		.long	.L40-.L23
 692 09d0 4C080000 		.long	.L21-.L23
 693 09d4 50080000 		.long	.L21-.L23
 694 09d8 54080000 		.long	.L21-.L23
 695 09dc 58080000 		.long	.L21-.L23
 696 09e0 5C080000 		.long	.L21-.L23
 697 09e4 60080000 		.long	.L21-.L23
 698 09e8 64080000 		.long	.L21-.L23
 699 09ec 30060000 		.long	.L39-.L23
 700 09f0 6C080000 		.long	.L21-.L23
 701 09f4 C4060000 		.long	.L38-.L23
 702 09f8 00070000 		.long	.L32-.L23
 703 09fc BF080000 		.long	.L20-.L23
 704 0a00 7C080000 		.long	.L21-.L23
 705 0a04 80080000 		.long	.L21-.L23
 706 0a08 64070000 		.long	.L36-.L23
 707 0a0c 88080000 		.long	.L21-.L23
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 22


 708 0a10 8C080000 		.long	.L21-.L23
 709 0a14 90080000 		.long	.L21-.L23
 710 0a18 94080000 		.long	.L21-.L23
 711 0a1c 98080000 		.long	.L21-.L23
 712 0a20 9C080000 		.long	.L21-.L23
 713 0a24 A0080000 		.long	.L21-.L23
 714 0a28 A4080000 		.long	.L21-.L23
 715 0a2c A8080000 		.long	.L21-.L23
 716 0a30 AC080000 		.long	.L21-.L23
 717 0a34 B0080000 		.long	.L21-.L23
 718 0a38 FB080000 		.long	.L20-.L23
 719 0a3c B8080000 		.long	.L21-.L23
 720 0a40 BC080000 		.long	.L21-.L23
 721 0a44 C0080000 		.long	.L21-.L23
 722 0a48 C4080000 		.long	.L21-.L23
 723 0a4c C8080000 		.long	.L21-.L23
 724 0a50 CC080000 		.long	.L21-.L23
 725 0a54 D0080000 		.long	.L21-.L23
 726 0a58 D4080000 		.long	.L21-.L23
 727 0a5c D8080000 		.long	.L21-.L23
 728 0a60 DC080000 		.long	.L21-.L23
 729 0a64 E0080000 		.long	.L21-.L23
 730 0a68 E4080000 		.long	.L21-.L23
 731 0a6c 9A060000 		.long	.L34-.L23
 732 0a70 EC080000 		.long	.L21-.L23
 733 0a74 34070000 		.long	.L33-.L23
 734 0a78 80070000 		.long	.L32-.L23
 735 0a7c 94070000 		.long	.L31-.L23
 736 0a80 FC080000 		.long	.L21-.L23
 737 0a84 CA070000 		.long	.L30-.L23
 738 0a88 04090000 		.long	.L21-.L23
 739 0a8c 08090000 		.long	.L21-.L23
 740 0a90 0C090000 		.long	.L21-.L23
 741 0a94 10090000 		.long	.L21-.L23
 742 0a98 12080000 		.long	.L29-.L23
 743 0a9c 18090000 		.long	.L21-.L23
 744 0aa0 63090000 		.long	.L20-.L23
 745 0aa4 67090000 		.long	.L20-.L23
 746 0aa8 24090000 		.long	.L21-.L23
 747 0aac 6F090000 		.long	.L20-.L23
 748 0ab0 3A080000 		.long	.L25-.L23
 749 0ab4 B9080000 		.long	.L24-.L23
 750 0ab8 34090000 		.long	.L21-.L23
 751 0abc 38090000 		.long	.L21-.L23
 752 0ac0 83090000 		.long	.L20-.L23
 753              		.text
 754              	.L40:
 755 05d3 488B0500 		movq	.refptr.optopt(%rip), %rax
 755      000000
 756 05da 8B00     		movl	(%rax), %eax
 757 05dc 89C2     		movl	%eax, %edx
 758 05de 488D0DE8 		leaq	.LC60(%rip), %rcx
 758      060000
 759 05e5 E8000000 		call	printf
 759      00
 760 05ea C745FC01 		movl	$1, -4(%rbp)
 760      000000
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 23


 761 05f1 E9950200 		jmp	.L20
 761      00
 762              	.L34:
 763 05f6 488B0500 		movq	.refptr.optarg(%rip), %rax
 763      000000
 764 05fd 488B00   		movq	(%rax), %rax
 765 0600 48890510 		movq	%rax, bootstrap_file(%rip)
 765      000000
 766 0607 E97F0200 		jmp	.L20
 766      00
 767              	.L39:
 768 060c 488B0500 		movq	.refptr.optarg(%rip), %rax
 768      000000
 769 0613 488B00   		movq	(%rax), %rax
 770 0616 4889C1   		movq	%rax, %rcx
 771 0619 E8000000 		call	atoi
 771      00
 772 061e 488D1500 		leaq	conversion_int(%rip), %rdx
 772      000000
 773 0625 8902     		movl	%eax, (%rdx)
 774 0627 488D0500 		leaq	conversion_int(%rip), %rax
 774      000000
 775 062e 8B00     		movl	(%rax), %eax
 776 0630 85C0     		testl	%eax, %eax
 777 0632 780E     		js	.L41
 778 0634 488D0500 		leaq	conversion_int(%rip), %rax
 778      000000
 779 063b 8B00     		movl	(%rax), %eax
 780 063d 83F801   		cmpl	$1, %eax
 781 0640 7E2C     		jle	.L42
 782              	.L41:
 783 0642 C745FC02 		movl	$2, -4(%rbp)
 783      000000
 784 0649 8B45F4   		movl	-12(%rbp), %eax
 785 064c 8845D5   		movb	%al, -43(%rbp)
 786 064f 488B0500 		movq	.refptr.optarg(%rip), %rax
 786      000000
 787 0656 488B10   		movq	(%rax), %rdx
 788 0659 0FBE45D5 		movsbl	-43(%rbp), %eax
 789 065d 4989D0   		movq	%rdx, %r8
 790 0660 89C2     		movl	%eax, %edx
 791 0662 488D0D10 		leaq	.LC61(%rip), %rcx
 791      070000
 792 0669 E8000000 		call	printf
 792      00
 793              	.L42:
 794 066e 488D0500 		leaq	conversion_int(%rip), %rax
 794      000000
 795 0675 8B00     		movl	(%rax), %eax
 796 0677 89C2     		movl	%eax, %edx
 797 0679 488D0500 		leaq	arg_struct(%rip), %rax
 797      000000
 798 0680 885008   		movb	%dl, 8(%rax)
 799 0683 E9030200 		jmp	.L20
 799      00
 800              	.L33:
 801 0688 488D0500 		leaq	arg_struct(%rip), %rax
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 24


 801      000000
 802 068f C6400C01 		movb	$1, 12(%rax)
 803 0693 E9F30100 		jmp	.L20
 803      00
 804              	.L38:
 805 0698 488B0500 		movq	.refptr.optarg(%rip), %rax
 805      000000
 806 069f 488B00   		movq	(%rax), %rax
 807 06a2 488D1531 		leaq	.LC62(%rip), %rdx
 807      070000
 808 06a9 4889C1   		movq	%rax, %rcx
 809 06ac E8000000 		call	strcmp
 809      00
 810 06b1 85C0     		testl	%eax, %eax
 811 06b3 7505     		jne	.L43
 812 06b5 E9D10100 		jmp	.L20
 812      00
 813              	.L43:
 814 06ba 8B45F4   		movl	-12(%rbp), %eax
 815 06bd 89C2     		movl	%eax, %edx
 816 06bf 488D0D35 		leaq	.LC63(%rip), %rcx
 816      070000
 817 06c6 E8000000 		call	printf
 817      00
 818 06cb E9BB0100 		jmp	.L20
 818      00
 819              	.L32:
 820 06d0 488D0500 		leaq	arg_struct(%rip), %rax
 820      000000
 821 06d7 C6400D01 		movb	$1, 13(%rax)
 822 06db E9AB0100 		jmp	.L20
 822      00
 823              	.L31:
 824 06e0 488B0500 		movq	.refptr.optarg(%rip), %rax
 824      000000
 825 06e7 488B00   		movq	(%rax), %rax
 826 06ea 41B80000 		movl	$0, %r8d
 826      0000
 827 06f0 BA000000 		movl	$0, %edx
 827      00
 828 06f5 4889C1   		movq	%rax, %rcx
 829 06f8 E8000000 		call	strtol
 829      00
 830 06fd 89C2     		movl	%eax, %edx
 831 06ff 488D0500 		leaq	arg_struct(%rip), %rax
 831      000000
 832 0706 885009   		movb	%dl, 9(%rax)
 833 0709 E97D0100 		jmp	.L20
 833      00
 834              	.L30:
 835 070e 488B0500 		movq	.refptr.optarg(%rip), %rax
 835      000000
 836 0715 488B00   		movq	(%rax), %rax
 837 0718 48890518 		movq	%rax, romheader_file(%rip)
 837      000000
 838 071f E9670100 		jmp	.L20
 838      00
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 25


 839              	.L36:
 840 0724 488B0500 		movq	.refptr.optarg(%rip), %rax
 840      000000
 841 072b 488B00   		movq	(%rax), %rax
 842 072e 4889C2   		movq	%rax, %rdx
 843 0731 488D0D42 		leaq	.LC64(%rip), %rcx
 843      070000
 844 0738 E8000000 		call	printf
 844      00
 845 073d E9490100 		jmp	.L20
 845      00
 846              	.L29:
 847 0742 488D0500 		leaq	arg_struct(%rip), %rax
 847      000000
 848 0749 C6400E01 		movb	$1, 14(%rax)
 849 074d E9390100 		jmp	.L20
 849      00
 850              	.L25:
 851 0752 488B0500 		movq	.refptr.optarg(%rip), %rax
 851      000000
 852 0759 488B00   		movq	(%rax), %rax
 853 075c 4889C1   		movq	%rax, %rcx
 854 075f E8000000 		call	atoi
 854      00
 855 0764 488D1500 		leaq	conversion_int(%rip), %rdx
 855      000000
 856 076b 8902     		movl	%eax, (%rdx)
 857 076d 488D0500 		leaq	conversion_int(%rip), %rax
 857      000000
 858 0774 8B00     		movl	(%rax), %eax
 859 0776 85C0     		testl	%eax, %eax
 860 0778 7810     		js	.L44
 861 077a 488D0500 		leaq	conversion_int(%rip), %rax
 861      000000
 862 0781 8B00     		movl	(%rax), %eax
 863 0783 3D000100 		cmpl	$256, %eax
 863      00
 864 0788 7E2C     		jle	.L45
 865              	.L44:
 866 078a C745FC02 		movl	$2, -4(%rbp)
 866      000000
 867 0791 8B45F4   		movl	-12(%rbp), %eax
 868 0794 8845D6   		movb	%al, -42(%rbp)
 869 0797 488B0500 		movq	.refptr.optarg(%rip), %rax
 869      000000
 870 079e 488B10   		movq	(%rax), %rdx
 871 07a1 0FBE45D6 		movsbl	-42(%rbp), %eax
 872 07a5 4989D0   		movq	%rdx, %r8
 873 07a8 89C2     		movl	%eax, %edx
 874 07aa 488D0D10 		leaq	.LC61(%rip), %rcx
 874      070000
 875 07b1 E8000000 		call	printf
 875      00
 876              	.L45:
 877 07b6 488D0500 		leaq	conversion_int(%rip), %rax
 877      000000
 878 07bd 8B10     		movl	(%rax), %edx
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 26


 879 07bf 488D0500 		leaq	arg_struct(%rip), %rax
 879      000000
 880 07c6 8910     		movl	%edx, (%rax)
 881 07c8 E9BE0000 		jmp	.L20
 881      00
 882              	.L24:
 883 07cd 488B0500 		movq	.refptr.optarg(%rip), %rax
 883      000000
 884 07d4 488B00   		movq	(%rax), %rax
 885 07d7 4889C1   		movq	%rax, %rcx
 886 07da E8000000 		call	atoi
 886      00
 887 07df 488D1500 		leaq	conversion_int(%rip), %rdx
 887      000000
 888 07e6 8902     		movl	%eax, (%rdx)
 889 07e8 488D0500 		leaq	conversion_int(%rip), %rax
 889      000000
 890 07ef 8B00     		movl	(%rax), %eax
 891 07f1 85C0     		testl	%eax, %eax
 892 07f3 780E     		js	.L46
 893 07f5 488D0500 		leaq	conversion_int(%rip), %rax
 893      000000
 894 07fc 8B00     		movl	(%rax), %eax
 895 07fe 83F806   		cmpl	$6, %eax
 896 0801 7E2C     		jle	.L47
 897              	.L46:
 898 0803 C745FC02 		movl	$2, -4(%rbp)
 898      000000
 899 080a 8B45F4   		movl	-12(%rbp), %eax
 900 080d 8845D7   		movb	%al, -41(%rbp)
 901 0810 488B0500 		movq	.refptr.optarg(%rip), %rax
 901      000000
 902 0817 488B10   		movq	(%rax), %rdx
 903 081a 0FBE45D7 		movsbl	-41(%rbp), %eax
 904 081e 4989D0   		movq	%rdx, %r8
 905 0821 89C2     		movl	%eax, %edx
 906 0823 488D0D10 		leaq	.LC61(%rip), %rcx
 906      070000
 907 082a E8000000 		call	printf
 907      00
 908              	.L47:
 909 082f 488D0500 		leaq	conversion_int(%rip), %rax
 909      000000
 910 0836 8B10     		movl	(%rax), %edx
 911 0838 488D0500 		leaq	arg_struct(%rip), %rax
 911      000000
 912 083f 895004   		movl	%edx, 4(%rax)
 913 0842 EB47     		jmp	.L20
 914              	.L21:
 915 0844 837DF43F 		cmpl	$63, -12(%rbp)
 916 0848 7439     		je	.L48
 917 084a 8B45F4   		movl	-12(%rbp), %eax
 918 084d 89C2     		movl	%eax, %edx
 919 084f 488D0D51 		leaq	.LC65(%rip), %rcx
 919      070000
 920 0856 E8000000 		call	printf
 920      00
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 27


 921 085b 488B0500 		movq	.refptr.optarg(%rip), %rax
 921      000000
 922 0862 488B00   		movq	(%rax), %rax
 923 0865 4885C0   		testq	%rax, %rax
 924 0868 7419     		je	.L48
 925 086a 488B0500 		movq	.refptr.optarg(%rip), %rax
 925      000000
 926 0871 488B00   		movq	(%rax), %rax
 927 0874 4889C2   		movq	%rax, %rdx
 928 0877 488D0D65 		leaq	.LC66(%rip), %rcx
 928      070000
 929 087e E8000000 		call	printf
 929      00
 930              	.L48:
 931 0883 C745FCFF 		movl	$-1, -4(%rbp)
 931      FFFFFF
 932 088a 90       		nop
 933              	.L20:
 934 088b 488B4518 		movq	24(%rbp), %rax
 935 088f 4C8D0580 		leaq	.LC67(%rip), %r8
 935      070000
 936 0896 4889C2   		movq	%rax, %rdx
 937 0899 8B4D10   		movl	16(%rbp), %ecx
 938 089c E8000000 		call	getopt
 938      00
 939 08a1 8945F4   		movl	%eax, -12(%rbp)
 940 08a4 837DF4FF 		cmpl	$-1, -12(%rbp)
 941 08a8 0F857AFC 		jne	.L49
 941      FFFF
 942 08ae 488B0500 		movq	.refptr.optind(%rip), %rax
 942      000000
 943 08b5 8B00     		movl	(%rax), %eax
 944 08b7 394510   		cmpl	%eax, 16(%rbp)
 945 08ba 7E24     		jle	.L50
 946 08bc 488B0500 		movq	.refptr.optind(%rip), %rax
 946      000000
 947 08c3 8B00     		movl	(%rax), %eax
 948 08c5 4898     		cltq
 949 08c7 488D14C5 		leaq	0(,%rax,8), %rdx
 949      00000000 
 950 08cf 488B4518 		movq	24(%rbp), %rax
 951 08d3 4801D0   		addq	%rdx, %rax
 952 08d6 488B00   		movq	(%rax), %rax
 953 08d9 48890540 		movq	%rax, spec_file(%rip)
 953      000000
 954              	.L50:
 955 08e0 488B0540 		movq	spec_file(%rip), %rax
 955      000000
 956 08e7 BA040000 		movl	$4, %edx
 956      00
 957 08ec 4889C1   		movq	%rax, %rcx
 958 08ef E87EF8FF 		call	file_exists_current_dir
 958      FF
 959 08f4 83F001   		xorl	$1, %eax
 960 08f7 84C0     		testb	%al, %al
 961 08f9 741D     		je	.L51
 962 08fb C745FC03 		movl	$3, -4(%rbp)
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 28


 962      000000
 963 0902 488B0540 		movq	spec_file(%rip), %rax
 963      000000
 964 0909 4889C2   		movq	%rax, %rdx
 965 090c 488D0DA4 		leaq	.LC68(%rip), %rcx
 965      070000
 966 0913 E8000000 		call	printf
 966      00
 967              	.L51:
 968 0918 488B0518 		movq	romheader_file(%rip), %rax
 968      000000
 969 091f BA040000 		movl	$4, %edx
 969      00
 970 0924 4889C1   		movq	%rax, %rcx
 971 0927 E86EF7FF 		call	file_exists
 971      FF
 972 092c 83F001   		xorl	$1, %eax
 973 092f 84C0     		testb	%al, %al
 974 0931 741D     		je	.L52
 975 0933 C745FC03 		movl	$3, -4(%rbp)
 975      000000
 976 093a 488B0518 		movq	romheader_file(%rip), %rax
 976      000000
 977 0941 4889C2   		movq	%rax, %rdx
 978 0944 488D0DA4 		leaq	.LC68(%rip), %rcx
 978      070000
 979 094b E8000000 		call	printf
 979      00
 980              	.L52:
 981 0950 488B0530 		movq	output_file(%rip), %rax
 981      000000
 982 0957 BA000000 		movl	$0, %edx
 982      00
 983 095c 4889C1   		movq	%rax, %rcx
 984 095f E836F7FF 		call	file_exists
 984      FF
 985 0964 84C0     		testb	%al, %al
 986 0966 7438     		je	.L53
 987 0968 488B0530 		movq	output_file(%rip), %rax
 987      000000
 988 096f BA020000 		movl	$2, %edx
 988      00
 989 0974 4889C1   		movq	%rax, %rcx
 990 0977 E81EF7FF 		call	file_exists
 990      FF
 991 097c 83F001   		xorl	$1, %eax
 992 097f 84C0     		testb	%al, %al
 993 0981 741D     		je	.L53
 994 0983 C745FC03 		movl	$3, -4(%rbp)
 994      000000
 995 098a 488B0530 		movq	output_file(%rip), %rax
 995      000000
 996 0991 4889C2   		movq	%rax, %rdx
 997 0994 488D0DB7 		leaq	.LC69(%rip), %rcx
 997      070000
 998 099b E8000000 		call	printf
 998      00
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 29


 999              	.L53:
 1000 09a0 488B0510 		movq	bootstrap_file(%rip), %rax
 1000      000000
 1001 09a7 BA040000 		movl	$4, %edx
 1001      00
 1002 09ac 4889C1   		movq	%rax, %rcx
 1003 09af E8E6F6FF 		call	file_exists
 1003      FF
 1004 09b4 83F001   		xorl	$1, %eax
 1005 09b7 84C0     		testb	%al, %al
 1006 09b9 741D     		je	.L54
 1007 09bb C745FC03 		movl	$3, -4(%rbp)
 1007      000000
 1008 09c2 488B0510 		movq	bootstrap_file(%rip), %rax
 1008      000000
 1009 09c9 4889C2   		movq	%rax, %rdx
 1010 09cc 488D0DA4 		leaq	.LC68(%rip), %rcx
 1010      070000
 1011 09d3 E8000000 		call	printf
 1011      00
 1012              	.L54:
 1013 09d8 488B0520 		movq	pif_file(%rip), %rax
 1013      000000
 1014 09df BA040000 		movl	$4, %edx
 1014      00
 1015 09e4 4889C1   		movq	%rax, %rcx
 1016 09e7 E8AEF6FF 		call	file_exists
 1016      FF
 1017 09ec 83F001   		xorl	$1, %eax
 1018 09ef 84C0     		testb	%al, %al
 1019 09f1 741D     		je	.L55
 1020 09f3 C745FC03 		movl	$3, -4(%rbp)
 1020      000000
 1021 09fa 488B0520 		movq	pif_file(%rip), %rax
 1021      000000
 1022 0a01 4889C2   		movq	%rax, %rdx
 1023 0a04 488D0DA4 		leaq	.LC68(%rip), %rcx
 1023      070000
 1024 0a0b E8000000 		call	printf
 1024      00
 1025              	.L55:
 1026 0a10 488B0528 		movq	font_file(%rip), %rax
 1026      000000
 1027 0a17 BA040000 		movl	$4, %edx
 1027      00
 1028 0a1c 4889C1   		movq	%rax, %rcx
 1029 0a1f E876F6FF 		call	file_exists
 1029      FF
 1030 0a24 83F001   		xorl	$1, %eax
 1031 0a27 84C0     		testb	%al, %al
 1032 0a29 741D     		je	.L56
 1033 0a2b C745FC03 		movl	$3, -4(%rbp)
 1033      000000
 1034 0a32 488B0528 		movq	font_file(%rip), %rax
 1034      000000
 1035 0a39 4889C2   		movq	%rax, %rdx
 1036 0a3c 488D0DA4 		leaq	.LC68(%rip), %rcx
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 30


 1036      070000
 1037 0a43 E8000000 		call	printf
 1037      00
 1038              	.L56:
 1039 0a48 837DFC00 		cmpl	$0, -4(%rbp)
 1040 0a4c 7454     		je	.L57
 1041 0a4e 488B4518 		movq	24(%rbp), %rax
 1042 0a52 488B00   		movq	(%rax), %rax
 1043 0a55 4889C1   		movq	%rax, %rcx
 1044 0a58 E88FF8FF 		call	usage
 1044      FF
 1045 0a5d E8000000 		call	clock
 1045      00
 1046 0a62 2B45F8   		subl	-8(%rbp), %eax
 1047 0a65 8945F8   		movl	%eax, -8(%rbp)
 1048 0a68 F20F2A45 		cvtsi2sdl	-8(%rbp), %xmm0
 1048      F8
 1049 0a6d F20F100D 		movsd	.LC53(%rip), %xmm1
 1049      C80A0000 
 1050 0a75 F20F5EC1 		divsd	%xmm1, %xmm0
 1051 0a79 F20F1145 		movsd	%xmm0, -40(%rbp)
 1051      D8
 1052 0a7e F20F1045 		movsd	-40(%rbp), %xmm0
 1052      D8
 1053 0a83 488B45D8 		movq	-40(%rbp), %rax
 1054 0a87 660F28C8 		movapd	%xmm0, %xmm1
 1055 0a8b 4889C2   		movq	%rax, %rdx
 1056 0a8e 488D0D80 		leaq	.LC54(%rip), %rcx
 1056      060000
 1057 0a95 E8000000 		call	printf
 1057      00
 1058 0a9a 8B45FC   		movl	-4(%rbp), %eax
 1059 0a9d E9E10300 		jmp	.L71
 1059      00
 1060              	.L57:
 1061 0aa2 488D0500 		leaq	arg_struct(%rip), %rax
 1061      000000
 1062 0aa9 0FB6400C 		movzbl	12(%rax), %eax
 1063 0aad 84C0     		testb	%al, %al
 1064 0aaf 0F84C000 		je	.L58
 1064      0000
 1065 0ab5 488B1518 		movq	romheader_file(%rip), %rdx
 1065      000000
 1066 0abc 488B4518 		movq	24(%rbp), %rax
 1067 0ac0 488B00   		movq	(%rax), %rax
 1068 0ac3 4989D0   		movq	%rdx, %r8
 1069 0ac6 4889C2   		movq	%rax, %rdx
 1070 0ac9 488D0DCD 		leaq	.LC70(%rip), %rcx
 1070      070000
 1071 0ad0 E8000000 		call	printf
 1071      00
 1072 0ad5 488B1520 		movq	pif_file(%rip), %rdx
 1072      000000
 1073 0adc 488B4518 		movq	24(%rbp), %rax
 1074 0ae0 488B00   		movq	(%rax), %rax
 1075 0ae3 4989D0   		movq	%rdx, %r8
 1076 0ae6 4889C2   		movq	%rax, %rdx
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 31


 1077 0ae9 488D0DE7 		leaq	.LC71(%rip), %rcx
 1077      070000
 1078 0af0 E8000000 		call	printf
 1078      00
 1079 0af5 488B1528 		movq	font_file(%rip), %rdx
 1079      000000
 1080 0afc 488B4518 		movq	24(%rbp), %rax
 1081 0b00 488B00   		movq	(%rax), %rax
 1082 0b03 4989D0   		movq	%rdx, %r8
 1083 0b06 4889C2   		movq	%rax, %rdx
 1084 0b09 488D0DFF 		leaq	.LC72(%rip), %rcx
 1084      070000
 1085 0b10 E8000000 		call	printf
 1085      00
 1086 0b15 488B1510 		movq	bootstrap_file(%rip), %rdx
 1086      000000
 1087 0b1c 488B4518 		movq	24(%rbp), %rax
 1088 0b20 488B00   		movq	(%rax), %rax
 1089 0b23 4989D0   		movq	%rdx, %r8
 1090 0b26 4889C2   		movq	%rax, %rdx
 1091 0b29 488D0D18 		leaq	.LC73(%rip), %rcx
 1091      080000
 1092 0b30 E8000000 		call	printf
 1092      00
 1093 0b35 488B1540 		movq	spec_file(%rip), %rdx
 1093      000000
 1094 0b3c 488B4518 		movq	24(%rbp), %rax
 1095 0b40 488B00   		movq	(%rax), %rax
 1096 0b43 4989D0   		movq	%rdx, %r8
 1097 0b46 4889C2   		movq	%rax, %rdx
 1098 0b49 488D0D32 		leaq	.LC74(%rip), %rcx
 1098      080000
 1099 0b50 E8000000 		call	printf
 1099      00
 1100 0b55 488B1530 		movq	output_file(%rip), %rdx
 1100      000000
 1101 0b5c 488B4518 		movq	24(%rbp), %rax
 1102 0b60 488B00   		movq	(%rax), %rax
 1103 0b63 4989D0   		movq	%rdx, %r8
 1104 0b66 4889C2   		movq	%rax, %rdx
 1105 0b69 488D0D4B 		leaq	.LC75(%rip), %rcx
 1105      080000
 1106 0b70 E8000000 		call	printf
 1106      00
 1107              	.L58:
 1108 0b75 488D0500 		leaq	arg_struct(%rip), %rax
 1108      000000
 1109 0b7c 0FB6400C 		movzbl	12(%rax), %eax
 1110 0b80 84C0     		testb	%al, %al
 1111 0b82 7433     		je	.L59
 1112 0b84 488B0D40 		movq	spec_file(%rip), %rcx
 1112      000000
 1113 0b8b 488B4518 		movq	24(%rbp), %rax
 1114 0b8f 488B00   		movq	(%rax), %rax
 1115 0b92 488D1596 		leaq	.LC78(%rip), %rdx
 1115      080000
 1116 0b99 48895424 		movq	%rdx, 32(%rsp)
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 32


 1116      20
 1117 0b9e 4989C9   		movq	%rcx, %r9
 1118 0ba1 4C8D0566 		leaq	.LC76(%rip), %r8
 1118      080000
 1119 0ba8 4889C2   		movq	%rax, %rdx
 1120 0bab 488D0D70 		leaq	.LC77(%rip), %rcx
 1120      080000
 1121 0bb2 E8000000 		call	printf
 1121      00
 1122              	.L59:
 1123 0bb7 488D059C 		leaq	.LC79(%rip), %rax
 1123      080000
 1124 0bbe 488945B0 		movq	%rax, -80(%rbp)
 1125 0bc2 488B0540 		movq	spec_file(%rip), %rax
 1125      000000
 1126 0bc9 488945B8 		movq	%rax, -72(%rbp)
 1127 0bcd 488D45B0 		leaq	-80(%rbp), %rax
 1128 0bd1 4889C2   		movq	%rax, %rdx
 1129 0bd4 488D0D66 		leaq	.LC76(%rip), %rcx
 1129      080000
 1130 0bdb E86EF4FF 		call	exec_and_wait
 1130      FF
 1131 0be0 8945F0   		movl	%eax, -16(%rbp)
 1132 0be3 488D0500 		leaq	arg_struct(%rip), %rax
 1132      000000
 1133 0bea 0FB6400C 		movzbl	12(%rax), %eax
 1134 0bee 84C0     		testb	%al, %al
 1135 0bf0 7416     		je	.L60
 1136 0bf2 488B4518 		movq	24(%rbp), %rax
 1137 0bf6 488B00   		movq	(%rax), %rax
 1138 0bf9 4889C2   		movq	%rax, %rdx
 1139 0bfc 488D0DB0 		leaq	.LC80(%rip), %rcx
 1139      080000
 1140 0c03 E8000000 		call	printf
 1140      00
 1141              	.L60:
 1142 0c08 488D0500 		leaq	arg_struct(%rip), %rax
 1142      000000
 1143 0c0f 0FB6400C 		movzbl	12(%rax), %eax
 1144 0c13 84C0     		testb	%al, %al
 1145 0c15 7416     		je	.L61
 1146 0c17 488B4518 		movq	24(%rbp), %rax
 1147 0c1b 488B00   		movq	(%rax), %rax
 1148 0c1e 4889C2   		movq	%rax, %rdx
 1149 0c21 488D0DCB 		leaq	.LC81(%rip), %rcx
 1149      080000
 1150 0c28 E8000000 		call	printf
 1150      00
 1151              	.L61:
 1152 0c2d 488D0500 		leaq	arg_struct(%rip), %rax
 1152      000000
 1153 0c34 0FB6400C 		movzbl	12(%rax), %eax
 1154 0c38 84C0     		testb	%al, %al
 1155 0c3a 7424     		je	.L62
 1156 0c3c 488B4518 		movq	24(%rbp), %rax
 1157 0c40 488B00   		movq	(%rax), %rax
 1158 0c43 4C8D0DE4 		leaq	.LC82(%rip), %r9
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 33


 1158      080000
 1159 0c4a 4C8D05EA 		leaq	.LC83(%rip), %r8
 1159      080000
 1160 0c51 4889C2   		movq	%rax, %rdx
 1161 0c54 488D0DF0 		leaq	.LC84(%rip), %rcx
 1161      080000
 1162 0c5b E8000000 		call	printf
 1162      00
 1163              	.L62:
 1164 0c60 488D0521 		leaq	.LC85(%rip), %rax
 1164      090000
 1165 0c67 48894590 		movq	%rax, -112(%rbp)
 1166 0c6b 488D05E4 		leaq	.LC82(%rip), %rax
 1166      080000
 1167 0c72 48894598 		movq	%rax, -104(%rbp)
 1168 0c76 488D0539 		leaq	.LC86(%rip), %rax
 1168      090000
 1169 0c7d 488945A0 		movq	%rax, -96(%rbp)
 1170 0c81 488B0530 		movq	output_file(%rip), %rax
 1170      000000
 1171 0c88 488945A8 		movq	%rax, -88(%rbp)
 1172 0c8c 488D4590 		leaq	-112(%rbp), %rax
 1173 0c90 4889C2   		movq	%rax, %rdx
 1174 0c93 488D0DEA 		leaq	.LC83(%rip), %rcx
 1174      080000
 1175 0c9a E8000000 		call	execvp
 1175      00
 1176 0c9f 8945EC   		movl	%eax, -20(%rbp)
 1177 0ca2 837DEC00 		cmpl	$0, -20(%rbp)
 1178 0ca6 740A     		je	.L63
 1179 0ca8 B9000000 		movl	$0, %ecx
 1179      00
 1180 0cad E8000000 		call	perror
 1180      00
 1181              	.L63:
 1182 0cb2 488D0500 		leaq	arg_struct(%rip), %rax
 1182      000000
 1183 0cb9 0FB6400C 		movzbl	12(%rax), %eax
 1184 0cbd 84C0     		testb	%al, %al
 1185 0cbf 7416     		je	.L64
 1186 0cc1 488B4518 		movq	24(%rbp), %rax
 1187 0cc5 488B00   		movq	(%rax), %rax
 1188 0cc8 4889C2   		movq	%rax, %rdx
 1189 0ccb 488D0D3C 		leaq	.LC87(%rip), %rcx
 1189      090000
 1190 0cd2 E8000000 		call	printf
 1190      00
 1191              	.L64:
 1192 0cd7 488D0500 		leaq	arg_struct(%rip), %rax
 1192      000000
 1193 0cde 0FB6400C 		movzbl	12(%rax), %eax
 1194 0ce2 84C0     		testb	%al, %al
 1195 0ce4 7446     		je	.L65
 1196 0ce6 488B4518 		movq	24(%rbp), %rax
 1197 0cea 488B00   		movq	(%rax), %rax
 1198 0ced 488D1574 		leaq	.LC91(%rip), %rdx
 1198      090000
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 34


 1199 0cf4 48895424 		movq	%rdx, 32(%rsp)
 1199      20
 1200 0cf9 4C8D0D57 		leaq	.LC88(%rip), %r9
 1200      090000
 1201 0d00 4C8D0563 		leaq	.LC89(%rip), %r8
 1201      090000
 1202 0d07 4889C2   		movq	%rax, %rdx
 1203 0d0a 488D0D66 		leaq	.LC90(%rip), %rcx
 1203      090000
 1204 0d11 E8000000 		call	printf
 1204      00
 1205 0d16 488B4518 		movq	24(%rbp), %rax
 1206 0d1a 488B00   		movq	(%rax), %rax
 1207 0d1d 4889C2   		movq	%rax, %rdx
 1208 0d20 488D0D78 		leaq	.LC92(%rip), %rcx
 1208      090000
 1209 0d27 E8000000 		call	printf
 1209      00
 1210              	.L65:
 1211 0d2c 488D0557 		leaq	.LC88(%rip), %rax
 1211      090000
 1212 0d33 48894580 		movq	%rax, -128(%rbp)
 1213 0d37 488D0574 		leaq	.LC91(%rip), %rax
 1213      090000
 1214 0d3e 48894588 		movq	%rax, -120(%rbp)
 1215 0d42 488D4580 		leaq	-128(%rbp), %rax
 1216 0d46 4889C2   		movq	%rax, %rdx
 1217 0d49 488D0D63 		leaq	.LC89(%rip), %rcx
 1217      090000
 1218 0d50 E8000000 		call	execvp
 1218      00
 1219 0d55 8945E8   		movl	%eax, -24(%rbp)
 1220 0d58 837DE800 		cmpl	$0, -24(%rbp)
 1221 0d5c 740A     		je	.L66
 1222 0d5e B9000000 		movl	$0, %ecx
 1222      00
 1223 0d63 E8000000 		call	perror
 1223      00
 1224              	.L66:
 1225 0d68 488D0500 		leaq	arg_struct(%rip), %rax
 1225      000000
 1226 0d6f 0FB6400C 		movzbl	12(%rax), %eax
 1227 0d73 84C0     		testb	%al, %al
 1228 0d75 7433     		je	.L67
 1229 0d77 488B0D30 		movq	output_file(%rip), %rcx
 1229      000000
 1230 0d7e 488B4518 		movq	24(%rbp), %rax
 1231 0d82 488B00   		movq	(%rax), %rax
 1232 0d85 488D15AA 		leaq	.LC95(%rip), %rdx
 1232      090000
 1233 0d8c 48895424 		movq	%rdx, 32(%rsp)
 1233      20
 1234 0d91 4989C9   		movq	%rcx, %r9
 1235 0d94 4C8D0593 		leaq	.LC93(%rip), %r8
 1235      090000
 1236 0d9b 4889C2   		movq	%rax, %rdx
 1237 0d9e 488D0D96 		leaq	.LC94(%rip), %rcx
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 35


 1237      090000
 1238 0da5 E8000000 		call	printf
 1238      00
 1239              	.L67:
 1240 0daa 488D0500 		leaq	arg_struct(%rip), %rax
 1240      000000
 1241 0db1 0FB6400C 		movzbl	12(%rax), %eax
 1242 0db5 84C0     		testb	%al, %al
 1243 0db7 7420     		je	.L68
 1244 0db9 488B1518 		movq	romheader_file(%rip), %rdx
 1244      000000
 1245 0dc0 488B4518 		movq	24(%rbp), %rax
 1246 0dc4 488B00   		movq	(%rax), %rax
 1247 0dc7 4989D0   		movq	%rdx, %r8
 1248 0dca 4889C2   		movq	%rax, %rdx
 1249 0dcd 488D0DB0 		leaq	.LC96(%rip), %rcx
 1249      090000
 1250 0dd4 E8000000 		call	printf
 1250      00
 1251              	.L68:
 1252 0dd9 488D0500 		leaq	arg_struct(%rip), %rax
 1252      000000
 1253 0de0 0FB6400C 		movzbl	12(%rax), %eax
 1254 0de4 84C0     		testb	%al, %al
 1255 0de6 7420     		je	.L69
 1256 0de8 488B1510 		movq	bootstrap_file(%rip), %rdx
 1256      000000
 1257 0def 488B4518 		movq	24(%rbp), %rax
 1258 0df3 488B00   		movq	(%rax), %rax
 1259 0df6 4989D0   		movq	%rdx, %r8
 1260 0df9 4889C2   		movq	%rax, %rdx
 1261 0dfc 488D0DB0 		leaq	.LC96(%rip), %rcx
 1261      090000
 1262 0e03 E8000000 		call	printf
 1262      00
 1263              	.L69:
 1264 0e08 488D0500 		leaq	arg_struct(%rip), %rax
 1264      000000
 1265 0e0f 0FB6400C 		movzbl	12(%rax), %eax
 1266 0e13 84C0     		testb	%al, %al
 1267 0e15 7420     		je	.L70
 1268 0e17 488B1528 		movq	font_file(%rip), %rdx
 1268      000000
 1269 0e1e 488B4518 		movq	24(%rbp), %rax
 1270 0e22 488B00   		movq	(%rax), %rax
 1271 0e25 4989D0   		movq	%rdx, %r8
 1272 0e28 4889C2   		movq	%rax, %rdx
 1273 0e2b 488D0DB0 		leaq	.LC96(%rip), %rcx
 1273      090000
 1274 0e32 E8000000 		call	printf
 1274      00
 1275              	.L70:
 1276 0e37 488D0DC0 		leaq	.LC97(%rip), %rcx
 1276      090000
 1277 0e3e E8000000 		call	puts
 1277      00
 1278 0e43 E8000000 		call	clock
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 36


 1278      00
 1279 0e48 2B45F8   		subl	-8(%rbp), %eax
 1280 0e4b 8945F8   		movl	%eax, -8(%rbp)
 1281 0e4e F20F2A45 		cvtsi2sdl	-8(%rbp), %xmm0
 1281      F8
 1282 0e53 F20F100D 		movsd	.LC53(%rip), %xmm1
 1282      C80A0000 
 1283 0e5b F20F5EC1 		divsd	%xmm1, %xmm0
 1284 0e5f F20F1145 		movsd	%xmm0, -32(%rbp)
 1284      E0
 1285 0e64 F20F1045 		movsd	-32(%rbp), %xmm0
 1285      E0
 1286 0e69 488B45E0 		movq	-32(%rbp), %rax
 1287 0e6d 660F28C8 		movapd	%xmm0, %xmm1
 1288 0e71 4889C2   		movq	%rax, %rdx
 1289 0e74 488D0D80 		leaq	.LC54(%rip), %rcx
 1289      060000
 1290 0e7b E8000000 		call	printf
 1290      00
 1291 0e80 8B45FC   		movl	-4(%rbp), %eax
 1292              	.L71:
 1293 0e83 4881C4B0 		addq	$176, %rsp
 1293      000000
 1294 0e8a 5D       		popq	%rbp
 1295 0e8b C3       		ret
 1296              		.seh_endproc
 1297 0e8c 90909090 		.section .rdata,"dr"
 1298 0ac4 00000000 		.align 8
 1299              	.LC53:
 1300 0ac8 00000000 		.long	0
 1301 0acc 00408F40 		.long	1083129856
 1302              		.ident	"GCC: (GNU) 9.1.0"
 1303              		.def	fork;	.scl	2;	.type	32;	.endef
 1304              		.def	execvp;	.scl	2;	.type	32;	.endef
 1305              		.def	_exit;	.scl	2;	.type	32;	.endef
 1306              		.def	printf;	.scl	2;	.type	32;	.endef
 1307              		.def	access;	.scl	2;	.type	32;	.endef
 1308              		.def	getcwd;	.scl	2;	.type	32;	.endef
 1309              		.def	strlen;	.scl	2;	.type	32;	.endef
 1310              		.def	puts;	.scl	2;	.type	32;	.endef
 1311              		.def	clock;	.scl	2;	.type	32;	.endef
 1312              		.def	atoi;	.scl	2;	.type	32;	.endef
 1313              		.def	strcmp;	.scl	2;	.type	32;	.endef
 1314              		.def	strtol;	.scl	2;	.type	32;	.endef
 1315              		.def	getopt;	.scl	2;	.type	32;	.endef
 1316              		.def	perror;	.scl	2;	.type	32;	.endef
 1317              		.section	.rdata$.refptr.opterr, "dr"
 1318              		.globl	.refptr.opterr
 1319              		.linkonce	discard
 1320              	.refptr.opterr:
 1321 0000 00000000 		.quad	opterr
 1321      00000000 
 1322 0008 00000000 		.section	.rdata$.refptr.optopt, "dr"
 1322      00000000 
 1323              		.globl	.refptr.optopt
 1324              		.linkonce	discard
 1325              	.refptr.optopt:
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 37


 1326 0000 00000000 		.quad	optopt
 1326      00000000 
 1327 0008 00000000 		.section	.rdata$.refptr.optarg, "dr"
 1327      00000000 
 1328              		.globl	.refptr.optarg
 1329              		.linkonce	discard
 1330              	.refptr.optarg:
 1331 0000 00000000 		.quad	optarg
 1331      00000000 
 1332 0008 00000000 		.section	.rdata$.refptr.optind, "dr"
 1332      00000000 
 1333              		.globl	.refptr.optind
 1334              		.linkonce	discard
 1335              	.refptr.optind:
 1336 0000 00000000 		.quad	optind
 1336      00000000 
 1336      00000000 
 1336      00000000 
GAS LISTING C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s 			page 38


DEFINED SYMBOLS
                            *ABS*:0000000000000000 makerom.c
                            *COM*:0000000000000060 arg_struct
                            *COM*:0000000000000004 conversion_int
C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s:11     .data:0000000000000000 define_str
C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s:15     .data:0000000000000008 include_str
C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s:23     .data:0000000000000010 bootstrap_file
C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s:31     .data:0000000000000018 romheader_file
C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s:39     .data:0000000000000020 pif_file
C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s:47     .data:0000000000000028 font_file
C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s:55     .data:0000000000000030 output_file
C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s:59     .data:0000000000000038 symbol_file
C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s:67     .data:0000000000000040 spec_file
C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s:71     .data:0000000000000048 directory_str
C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s:75     .data:0000000000000050 resource_directory
C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s:81     .text:0000000000000000 mystrcat
C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s:118    .text:000000000000004e exec_and_wait
C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s:161    .text:000000000000009a file_exists
C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s:215    .text:000000000000014f file_exists_path
C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s:254    .text:0000000000000172 file_exists_current_dir
C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s:417    .text:00000000000002ec usage
C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s:599    .text:000000000000045f main
C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s:1335   .rdata$.refptr.optind:0000000000000000 .refptr.optind
C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s:1330   .rdata$.refptr.optarg:0000000000000000 .refptr.optarg
C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s:1325   .rdata$.refptr.optopt:0000000000000000 .refptr.optopt
C:\Users\jwall\AppData\Local\Temp\1\ccWLax3W.s:1320   .rdata$.refptr.opterr:0000000000000000 .refptr.opterr

UNDEFINED SYMBOLS
__main
fork
execvp
_exit
printf
access
getcwd
strlen
puts
clock
atoi
strcmp
strtol
getopt
perror
opterr
optopt
optarg
optind
