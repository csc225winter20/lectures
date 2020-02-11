OS_KBSR         .FILL xFE00
OS_KBDR         .FILL xFE02

TRAP_GETC       LDI R0, OS_KBSR
                BRzp TRAP_GETC
                LDI R0, OS_KBDR
                RTI
