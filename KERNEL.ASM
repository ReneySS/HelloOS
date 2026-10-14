[bits 16]

; Data de criação: 13/10/2026 - 10:37:28 
; Brasil, Itinga do Maranhão - MA.
; Autor: Reney Sousa Silva.
; Sistema Operacional de 16 bits estilo DOS. 
;
; Comando para assembler: nasm -f bin kernel.asm -o kernel.com  
;					
; Use o DOSBOX para executar o kernel.com equanto não tem um bootloader

org 100h

inicio:
		
	mov di,buffer_teclado
	call ler_teclado
	
	mov si,nova_linha
	call escrever_tela
	
	mov si,buffer_teclado
	mov di,sair
	call comparar_strings
	
	cmp al,00h
	jz comandoSair
	
	jmp inicio

comandoSair:

	call sair_do_sistema
	

; *** ROTINAS DO SISTEMA ***
	
ler_teclado:

; Essa rotina e responsável por ler as teclas precionadas. 

_inicio_ler_teclado:
	
	mov ah,00h
	int 16h
	mov ah,0eh
	int 10h
	
	mov [di],al
	inc di
			
	cmp al,0dh
	jnz _inicio_ler_teclado
	
	mov [di],00h
	
	ret
	
escrever_tela:

; Essa rotina escreve strings na tela do computador. 

	mov ah,0eh

_inicio_escrever_tela:
	
	mov al,[si]
	int 10h
	
	inc si
	
	cmp [si],00h
	jnz _inicio_escrever_tela
	
	ret
	
comparar_strings:

; Essa rotina compara duas strings, caso sejam iguais AL = 00H
; casso sejam diferentes AL = 01H. As strings seram apontadas por SI e DI. 
; 

_inicio_comparar_strings:

	mov al,[si]
	mov ah,[di]

	inc si
	inc di
	
	cmp al,ah
	
	jnz _strings_diferentes
	jz _strings_iguais
	
_strings_diferentes:

	mov al,01h
	jmp _fim_comparar_strings

_strings_iguais:

	cmp al,00h
	
	jnz _inicio_comparar_strings
	
	cmp ah,00h
	
	jnz _inicio_comparar_strings

	mov al,00h
	jmp _fim_comparar_strings

_fim_comparar_strings:

	ret
	
sair_do_sistema:

	int 20h

sair           db 'sair',0dh,00h
nova_linha     db 0ah,0dh,00h
buffer_teclado db 00h	
