;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o P3.o P3.asm -l P3.lst
;link:	   -->> gcc -o P3 P3.o
;run:      -->> P3
;debugger: -->> x64dbg P3
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: .asm (nombre programa)
;registro: 
;Apellidos y Nombre: 

;C:\mingw64\programas
;C:\mingw64\bin

global main 
extern printf, scanf, strlen, gets		

segment .data
msj1 db 10,"ingresar la cadena de caracteres(max 100 caracteres): ",0
msj2 db "la cadena total tiene: %d",0
fmt db "%d",0
segment .bss
cad1 resb 100

segment .text 
sub rsp,0x20
	mov rcx,msj1
	call printf
	
	mov rcx,cad1
	call gets
	
add rsp,0x20
ret