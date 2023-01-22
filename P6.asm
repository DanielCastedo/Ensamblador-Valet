;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with: 
;assemble: -->> nasm -f win64 -o P6.o P6.asm -l P6.lst
;link:	   -->> gcc -o P6 P6.o
;run:      -->> P6
;debugger: -->> x64dbg P6
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: .asm (nombre programa)
;registro:  
;Apellidos y Nombre: 

;C:\mingw64\programas
;C:\mingw64\bin

global main 
extern printf, scanf		
segment .data 
	a dd 30,10,20
segment .bss
   
segment .text 
global main 					
main:	
	mov r10,a ;r10=2500
	xor r12,r12 
	mov eax,[r10+r12] ;eax=30
	mov ebx,[r10+r12+4] ; ebx=10
	mov ecx,[r10+r12+8] ;ecx=20
	cmp eax,ebx
	jnc ll1 
	cmp ebx,ecx
	jc ll2
ll2:	mov [r10+r12+4],ebx
	jmp ll4
	mov [r10+r12+4],ecx
	jmp ll4
ll1:	cmp eax,ecx
	jc ll3
	xor eax,0x88 ;eax=0X9E
	mov [r10+r12+4],eax
    jmp ll4
ll3: mov [r10+r12+4],ecx
ll4: ret