;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with 
;assemble: -->> nasm -f win64 -o hora.o hora.asm -l hora.lst
;link:	   -->> gcc -o hora hora.o
;run:      -->> hora
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: hora.asm (nombre programa)

extern printf, scanf		



segment .data
;aqui se declaran variables inicializadas
ms1 db "ingresar minutos: ",0
ms2 db "el resultado es %d hora con %d minutos",0
fmt db "%d",0
		
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar

x resd 1
hora resd 1
minutos resd 1


segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
sub rsp,0x20
mov rcx,ms1
call printf

mov rcx,fmt
mov edx,x
call scanf

add rsp,0x20
mov ecx,x
call Calcular

sub rsp,0x20
mov [hora],eax
mov [minutos],edx

mov rcx,ms2
mov edx,[hora]
mov r8d,[minutos]
call printf
add rsp,0x20

ret
;---------------------------------------
;..........subrutinas....................	

Calcular: 
		xor rax,rax
		xor rbx,rbx
		mov eax,[ecx]
		mov ebx,60
		cdq
		idiv ebx
ret	