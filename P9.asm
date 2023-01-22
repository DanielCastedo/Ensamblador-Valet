;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o P9.o P9.asm -l P9.lst
;link:	   -->> gcc -o P9 P9.o
;run:      -->> P9
;debugger: -->> x64dbg 221044991
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
main:
sub rsp,0x20
	mov rcx,msj1
	call printf
	
	mov rcx,cad1
	call gets
	
	mov rcx,cad1
	call strlen
	
	mov rcx,rax
	mov rdx,cad1
	call calcular
	
	mov rcx,msj2
	mov rdx,rax
	call printf
	
add rsp,0x20
ret

calcular:
	mov rax,0
	ciclo:
		cmp rcx,0
		je salir
		mov bl,[rdx]
		cmp bl,0x30
		jb salta
			cmp bl,0x39
			ja salta1
				inc rax
			salta1:
		salta:
		cmp bl,0x41
		jb go
			cmp bl,0x5A
			ja go1
			   inc rax
			go1:
		go:
		cmp bl,0x61
		jb vamos
			cmp bl,0x7A
			ja vamos
			   inc rax
			vamos:
		vamos:
		dec rcx
		inc rdx
	jmp ciclo
	salir:
ret