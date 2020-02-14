OS_DSR          .FILL xFE04
OS_DDR          .FILL xFE06
TOUT_R1         .BLKW #1

; NOTE: R0 contains the ASCII value of the character to be displayed.
TRAP_OUT        ST  R1, TOUT_R1     ; Save R1.
TRAP_OUT_WAIT   LDI R1, OS_DSR      ; Load the DSR into R1.
                BRzp TRAP_OUT_WAIT  ; ...poll until the DSR is negative.
                STI R0, OS_DDR      ; Store the char in the DDR.
                LD  R1, TOUT_R1     ; Restore R1.
                RTI                 ; Return.
