[bits 16]

; Data de criação: 13/10/2026
; Autor: Reney Sousa Silva.
; Sistema Operacional de 16 bits estilo DOS. 

org 100h

inicio:
	
	mov di,buffer_teclado
	call ler_teclado
	
	mov si,nova_linha
	call escrever_tela
		
	mov si,buffer_teclado
	call escrever_tela
	
	int 20h
	
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
	
	
nova_linha     db 0ah,0dh,00h
buffer_teclado db 00h	
