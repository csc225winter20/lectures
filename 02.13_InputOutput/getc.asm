OS_KBSR         .FILL xFE00
OS_KBDR         .FILL xFE02

; These instructions start at memory location 0x021B:
TRAP_GETC       LDI R0, OS_KBSR     ; Load the KBSR into R0.
                BRzp TRAP_GETC      ; ...poll until the KBSR is negative.
                LDI R0, OS_KBDR     ; Load the char in the KBDR.
                RTI                 ; Return.
