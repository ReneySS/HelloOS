[bits 16]

; Data de criação: 13/10/2026
; Autor: Reney Sousa Silva.
; Sistema Operacional de 16 bits estilo DOS. 

org 100h

inicio:
	
	mov si,String1
	mov di,String2
	
	call comparar_strings
	
	cmp al,00h
	jz saoiguais
	
	cmp al,01h
	jz saodiferentes
	
saoiguais:

	mov si,StringIguais
	call escrever_tela
	jmp fim
	
saodiferentes:

	mov si,StringsDiferentes
	call escrever_tela
	jmp fim

fim:
		
	int 20h

String1        	  db 'abcd.',00h
String2        	  db 'abcd.',00h
StringIguais 	  db 'Iguais.',00h
StringsDiferentes db 'Diferentes.',00h

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

nova_linha     db 0ah,0dh,00h
buffer_teclado db 00h	
