;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o mayor.o mayor.asm -l mayor.lst
;link:	   -->> gcc -o mayor mayor.o
;run:      -->> mayor
;debugger: -->> x64dbg mayor
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: .asm (nombre programa)
;registro: 
;Apellidos y Nombre: 

;C:\mingw64\programas
;C:\mingw64\bin

;encontrar el numero mayor digito de un numero
global main 
extern printf, scanf		
segment .data 
msj1 db 10,"ingrese el numero: ",0
msj2 db "el digito mayor es: %d",0
fmt db "%d",0
segment .bss
    x resd 1
   mayor resd 1
segment .text 
global main 					
main:	
    sub rsp,0x20
		mov rcx,msj1
		call printf
		
		mov rcx,fmt
		mov edx,x
		call scanf
	add rsp,0x20
	
	mov ecx,x
	call calculo
	
	mov [mayor],eax
	
	mov rcx,msj2
	mov edx,[mayor]
	call printf
add rsp,0x20
	
ret
;///////subrutina//////// 12/10=1 1/10=0
calculo:
	xor rax,rax
	xor rbx,rbx
	xor rdx,rdx
	xor r14,r14
	mov eax,[ecx];eax=12
	mov r14d,0
 ciclo: 
    cmp eax,0 
	je salir  ;12=0 
	mov ebx,10 ;ebx=10 
	cdq
	div ebx   ;eax=1 edx=2 eax=0 edx=1
	cmp edx,r14d ;<=2
	jbe mayornum
		mov r14d,edx ;r15d=2
	mayornum:
	jmp ciclo
	salir:
	mov eax,r14d
ret