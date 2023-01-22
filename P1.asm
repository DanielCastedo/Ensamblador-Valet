;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o P1.o P1.asm -l P1.lst
;link:	   -->> gcc -o P1 P1.o
;run:      -->> P1
;debugger: -->> x64dbg 221044991
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
msj1 db 10,"ingresar la cadena de carcateres(max 100 carcateres): ",0
msj2 db "la cadena tiene de: %d",10,0
msj3 db "la cadena total tiene de: %d",0
fmt db "%d",0
segment .bss
cad1 resb 100
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
	
	mov rcx,cad1
	mov rdx,r13
	call contar
	
	mov r14,rax
	
	mov rcx,msj3
	mov rdx,r14
	call printf
		
add rsp,0x20

ret

contar:
	mov r15,0
	mov rsi,rcx
	mov r13,rdx
	ciclo:
	   cmp rdx,0
	   je salir
	   mov al,[rcx]
	   cmp al,0x30
	   jb noentra
			cmp al,0x39
			ja sientra
				inc r15
			sientra:
	   noentra:
	   dec rdx
	   inc rcx
	jmp ciclo
    salir:
	mov rcx,rsi
	mov rdx,r13
	ciclo1:
	   cmp rdx,0
	   je salir1
	   mov al,[rcx]
	   cmp al,0x41
	   jb noentra1
			cmp al,0x5A
			ja sientra1
				inc r15
			sientra1:
	   noentra1:
	   dec rdx
	   inc rcx
	jmp ciclo1
    salir1:
	mov rcx,rsi
	mov rdx,r13
	ciclo2:
	   cmp rdx,0
	   je salir2
	   mov al,[rcx]
	   cmp al,0x61
	   jb noentra2
			cmp al,0x7A
			ja sientra2
				inc r15
			sientra2:
	   noentra2:
	   dec rdx
	   inc rcx
	jmp ciclo2
    salir2:
	mov rax,r15
ret





