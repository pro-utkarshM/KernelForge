; Bootloader starting at 0x7C00
ORG 0x7C00
BITS 16

; Segment offsets relative to the GDT start
CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start

; Entry point
_start:
    jmp short start        ; Jump over padding and alignment
    nop                    ; Placeholder (optional)

times 33 db 0              ; Padding

start:
    jmp 0:step2            ; Far jump to absolute address to continue execution

step2:
    cli                    ; Clear interrupts (disable)
    xor ax, ax             ; Zero out AX
    mov ds, ax             ; Set DS to 0
    mov es, ax             ; Set ES to 0
    mov ss, ax             ; Set SS to 0
    mov sp, 0x7C00         ; Set stack pointer to 0x7C00
    sti                    ; Enable interrupts

; Load GDT and switch to protected mode
.load_protected:
    cli                    ; Disable interrupts before switching modes
    lgdt [gdt_descriptor]   ; Load Global Descriptor Table (GDT)
    mov eax, cr0           ; Load control register CR0
    or eax, 0x1            ; Set the lowest bit to enable protected mode
    mov cr0, eax           ; Write back to CR0
    jmp CODE_SEG:load32    ; Far jump to switch to 32-bit protected mode

; GDT (Global Descriptor Table)
gdt_start:
gdt_null:
    dd 0x0                 ; Null descriptor (required)
    dd 0x0                 ; Padding

; Code segment descriptor (offset 0x8)
gdt_code:
    dw 0xFFFF              ; Segment limit (low 16 bits)
    dw 0x0000              ; Base address (low 16 bits)
    db 0x00                ; Base address (middle 8 bits)
    db 0x9A                ; Access byte: Code segment, present, ring 0
    db 11001111b           ; Flags: 4K granularity, 32-bit protected mode
    db 0x00                ; Base address (high 8 bits)

; Data segment descriptor (offset 0x10)
gdt_data:
    dw 0xFFFF              ; Segment limit (low 16 bits)
    dw 0x0000              ; Base address (low 16 bits)
    db 0x00                ; Base address (middle 8 bits)
    db 0x92                ; Access byte: Data segment, present, ring 0
    db 11001111b           ; Flags: 4K granularity, 32-bit protected mode
    db 0x00                ; Base address (high 8 bits)

gdt_end:

; GDT descriptor (pointer to the GDT)
gdt_descriptor:
    dw gdt_end - gdt_start - 1   ; GDT size (limit)
    dd gdt_start                 ; GDT base address

; 32-bit protected mode entry point
[BITS 32]
load32:
    mov ax, DATA_SEG             ; Load data segment selector
    mov ds, ax                   ; Set DS to data segment
    mov es, ax                   ; Set ES to data segment
    mov fs, ax                   ; Set FS to data segment
    mov gs, ax                   ; Set GS to data segment
    mov ss, ax                   ; Set SS to data segment
    mov ebp, 0x00200000          ; Set up stack base
    mov esp, ebp                 ; Set up stack pointer
    jmp $                        ; Infinite loop (halt execution)

; Boot sector signature (required for bootloader)
times 510-($ - $$) db 0          ; Pad remaining space to 510 bytes
dw 0xAA55                        ; Boot signature (mandatory)

