;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;assemble and link with:
;assemble: -->> nasm -f win64 -o 221044043.o 221044043.asm -l 221044043.lst
;link: -->> gcc -o 221044043 221044043.o
;run: -->> 221044043
;debugger: -->> x64dbg 221044043
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------
;C:\Ensamblador\MinGW64\bin
;C:\Ensamblador\programa

;file: 221044043.asm (nombre programa)
;registro: 221044043
;nombres y apellidos: Pablo Daniel Castedo Suarez

global main
extern printf, scanf,gets,strlen

segment .data
msj1 db 10,"ingresar cadena(max. 50 caracteres): ",0
msj2 db "la nueva cadena es: ",0
segment .bss
cad1 resb 50
cad2 resb 50
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
mov r8,cad2
call convertir

mov rcx,msj2
call printf

mov rcx,cad2
call printf

add rsp,0x20

ret
convertir:
ciclo:
cmp rcx,0
je salir
mov bl,[rdx]
cmp bl,0x30
jb salto
cmp bl,0x39
ja salto1
mov [r8],bl
inc r8
salto1:
salto:

cmp bl,0x61
jb go
cmp bl,0x7A
ja go1
mov [r8],bl
inc r8
go1:
go:
inc rdx
dec rcx
jmp ciclo
salir:

ret