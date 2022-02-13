; Hello World in Assembly!
;   Author: John Hatton
;
;   Date: 13 Feb. 2022
;       Time: 2:52am
;
;
;
;
;-----------------------------------------------------
;
;       To run in Linux:
;       nasm -f elf HelloWorld.asm
;       ld -s -o HelloWorld HelloWorld.o
;
;-----------------------------------------------------


section .text
    ; Export the entry point to the ELF linker
    ;   or loader
    ;
    ; Conventional entry point is _start
    global _start ; Scope declaration


section .data

; store a message "Hello World! \n"
msg db  'Hello World!',0xa ; 0xa is \n
len equ $- msg ; store length of msg

section .text
; linker puts the entry point here


_start:

; Write the string to stdout system call

    mov edx,len ; move length to edx register
    mov ecx,msg ; move message to ecx register
    mov ebx,1   ; fd (file descriptor) *see C library
    mov eax,4   ; SYSCALL for sys_write
    int 0x80    ; kernel interrupt

    ; Exit gracefully

    mov ebx,0   ;   process exit code
    mov eax,1   ;   syscall number for sys_exit
    int 0x80    ;   kernel interrupt (wont return)