;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o P5.o P5.asm -l P5.lst
;link:	   -->> gcc -o P5 P5.o
;run:      -->> P3
;debugger: -->> x64dbg P5
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: .asm (nombre programa)
;registro: 
;Apellidos y Nombre: 

;C:\mingw64\programas
;path C:\mingw64\bin

global main 
extern printf, scanf,gets,strlen


segment .data
msj1 db 10,"introduzca la contraseña: ",0
fmt db "%s"
msj2 db "la contaseña es incorrecta",0
msj3 db "la contraseña es correcto",0
cad1 db "juanito98"

segment .bss
cad2 resb 50

segment .text 
sub rsp,0x20
	mov rcx,msj1
	call printf
	
	mov rcx,cad2
	call gets
	
	mov rcx,cad1
	call strlen
	
add rsp,0x20
ret
;;;;;;;;;;;;;;;;;;;;;;;;;;;


ret