del boot.bin
del kernel.bin
del hello.img

nasm -f bin boot.asm -o boot.bin 
nasm -f bin kernel.asm -o kernel.bin

type boot.bin >> hello.img
type kernel.bin >> hello.img 