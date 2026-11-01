[bits 16]

; Data de criação: 31/10/2026 - 12:52:28
; Brasil, Itinga do Maranhão - MA.
; Autor: Reney Sousa Silva.
; Bootloader para um Sistema Operacional de 16 bits estilo DOS. 

org 0x7c00

inicio:	

	; Mensagem "Hello OS."
	mov ah,0x0E
	mov al,0x48		; codigo ASCII letra 'H'
	int 0x10

	mov ah,0x0E
	mov al,0x65		; codigo ASCII letra 'e'
	int 0x10

	mov ah,0x0E
	mov al,0x6C		; codigo ASCII letra 'l'
	int 0x10

	mov ah,0x0E
	mov al,0x6C		; codigo ASCII letra 'l'
	int 0x10

	mov ah,0x0E
	mov al,0x6F		; codigo ASCII letra 'o'
	int 0x10

	mov ah,0x0E
	mov al,0x20		; codigo ASCII 'Espaço'
	int 0x10

	mov ah,0x0E
	mov al,0x4F		; codigo ASCII letra 'O'
	int 0x10
	
	mov ah,0x0E
	mov al,0x53		; codigo ASCII letra 'S'
	int 0x10

	mov ah,0x0E
	mov al,0x2E		; codigo ASCII letra '.'
	int 0x10

	mov ah,0x0E
	mov al,0x0A		; codigo ASCII 'NOVA LINHA'
	int 0x10

	mov ah,0x0E
	mov al,0x0D		; codigo ASCII 'TECLA ENTER'
	int 0x10

	; Rotina para carregar o kernel na memoria 0000:01000.

		
	mov ax,0x0000	; move o valor 0x0000 para AX para servir de endereço de CS, DS, ES, SS. 
	mov es,ax 		; move o valor de ES para AX. ES será o seguimento onde o kernel será carregado. 
	mov bx,0x0100	; mov para BX o valor 0x0100. BX será o offset onde o kernel será carregado. 

	mov ah,0x02		; função para ler setores do disco.
	mov al,0x01 	; número de setores a serem lidos. 	
	mov ch,0x00 	; número da trilha do setor a ser lido. 
	mov cl,0x02		; setor inicial a ser lido. 
	mov dh,0x00     ; número da cabeça de leitura. 
	mov dl,0x00 	; disco que deve ser lido. 

	int 0x13

	jmp 0x0:0x0100		; salta para o inicio o kernel. ENTRY POINT. 

times 510 - ($ - $$) db 0x00
dw 0xAA55