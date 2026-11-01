<H1>Hello OS.</H1>

Utilize o VirutalBox para dar boot no sistema.

No momento o sistema conta com 2 arquivos: 

<p><b>boot.asm</b> - código para carregar o kernel para memóira. </p>
<p><b>kernel.asm</b> - código com as rotinas do sistema.</p> 

Execute o arquivo montar.bat para criar um imagem do sistema. 

01/11/2026 13:49

O kernel do sistema dispõe das seguintes rotindas:

<p><b>ler_teclado:</b> ler das teclas pressionada para memóira até que o tecla ENTER seja pressionada.
<p><b>escrever_tela:</b> escrever um string da memória até encontrar o byte 00h (0x00).</p>
<p><b>comparar_strings:</b> comparar duas strings apontadas por SI e DI, retornando o resultado em AL.</p>

