;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o P2.o P2.asm -l P2.lst
;link:	   -->> gcc -o P2 P2.o
;run:      -->> P2
;debugger: -->> x64dbg P2
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: .asm (nombre programa)
;registro: 
;Apellidos y Nombre: 

;C:\mingw64\programas
;C:\mingw64\bin

global main 
extern printf, scanf,gets,strlen		
segment .data 
msj1 db 10,"Por favor introduzca la contrasena: ",0
msj2 db "la contrasena es corrrecta:",0
msj3 db "la contrasena es incoreccta",0
fmt db "%s",0
cad2 db "juanito98",0
segment .bss
cad1 resb 50
segment .text 				
main:	
sub rsp,0x20
	mov rcx,msj1
	call printf
	
	mov rcx,cad1
	call gets
	
	mov rcx,cad1
	call strlen
	mov r13,rax
	
	mov rcx,cad2
	call strlen 
	
	mov rcx,r13
	mov rdx,rax
	mov r8,cad1
	mov r9,cad2
	call verif
	
	mov rax,0
	jne salir
		mov rcx,msj2
		call printf
		jmp salir2
salir:
	mov rcx,msj3
	call printf
salir2:

add rsp,0x20
ret
verif:
cmp rcx,rdx
jne fin
ciclo:
	mov al,[r8]
	cmp al,[r9]
	jne null
	inc r8
	inc r9
	dec rcx
	jnz ciclo
null:
fin:
   mov rax,rcx

ret
