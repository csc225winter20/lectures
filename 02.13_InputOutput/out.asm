OS_DSR          .FILL xFE04
OS_DDR          .FILL xFE06
TOUT_R1         .BLKW #1

TRAP_OUT        ST  R1, TOUT_R1
TRAP_OUT_WAIT   LDI R1, OS_DSR
                BRzp TRAP_OUT_WAIT
                STI R0, OS_DDR
                LD  R1, TOUT_R1
                RTI
