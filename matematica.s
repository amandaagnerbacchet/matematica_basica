section .data
    numero1 dd 10  ; Primeiro número
    numero2 dd 5   ; Segundo número
    resultado dd 0 ; Armazena o resultado das operações

section .text
    global _start

_start:
    ; Adição
    mov eax, [numero1]
    add eax, [numero2]
    mov [resultado], eax
    ; Subtração
    mov eax, [numero1]
    sub eax, [numero2]
    mov [resultado + 4], eax  ; Resultado da subtração é armazenado após o resultado da adição
    ; Multiplicação
    mov eax, [numero1]
    imul eax, dword [numero2]
    mov [resultado + 8], eax  ; Resultado da multiplicação é armazenado após o resultado da subtração
    ; Divisão
    mov eax, [numero1]
    mov ebx, [numero2]
    xor edx, edx  ; Zera EDX (resto)
    idiv ebx      ; Divisão inteira
    mov [resultado + 12], eax  ; Resultado da divisão é armazenado após o resultado da multiplicação

    ; Termina o programa
    mov eax, 1      ; syscall exit
    xor ebx, ebx    ; Código de saída 0
    int 0x80        ; Chamada do sistema
