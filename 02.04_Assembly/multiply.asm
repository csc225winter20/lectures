; Computes R2 = R0 * R1.

        .ORIG x3000
        ST  R1, SAVER1  ; Save R1.
        AND R2, R2, #0
        ADD R1, R1, #0  ; Touch R1 to set codes.
LOOP    BRnz DONE       ; Loop while positive.
        ADD R2, R2, R0
        ADD R1, R1, #-1
        BRnzp LOOP
DONE    LD  R1, SAVER1  ; Restore R1.
        HALT
SAVER1  .FILL x0000     ; Space to save R1
        .END
