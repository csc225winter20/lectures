; NOTE: Must also set 0xFE00 to 0x4000 and 0x0180 to 0x0300.

            .ORIG x300
KB_ISR      ST  R0, SAVER0
            ST  R1, SAVER1

; NOTE: There is no need to poll the KBSR. The only way to get to this code is
;       for the user to type a character, thereby triggering the interrupt.

            LD  R0, SAVE_ADDR
            LDI R1, KBDR        ; Get typed character.
            STR R1, R0, #0      ; Save in user-space.
            ADD R0, R0, #1      ; Increment save addr.
            ST  R0, SAVE_ADDR

            LD  R1, SAVER1
            LD  R0, SAVER0
            RTI

SAVER0      .FILL x0000
SAVER1      .FILL x0000
SAVE_ADDR   .FILL x4000
KBDR        .FILL xFE02
            .END
