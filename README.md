<H1>Hello OS.</H1>

Utilize o VirutalBox para dar boot no sistema.

No momento o sistema conta com 2 arquivos: 

<p>boot.asm - código para carregar o kernel para memóira. </p>
<p>kernel.asm - código com as rotinas do sistema.</p> 

Execute o arquivo montar.bat para criar um imagem do sistema. 

01/11/2026 13:49

O kernel do sistema dispõe das seguintes rotindas:

ler_teclado: ler das teclas pressionada para memóira até que o tecla ENTER seja pressionada.
escrever_tela: escrever um string da memória até encontrar o byte 00h (0x00).
comparar_strings: comparar duas strings apontadas por SI e DI, retornando o resultado em AL. 

