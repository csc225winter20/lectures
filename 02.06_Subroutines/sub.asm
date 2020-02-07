        .ORIG x3000

MAIN    AND R0, R0, #0
        ADD R0, R0, #2
        AND R1, R1, #0
        ADD R1, R1, #1

        JSR SUB

        HALT

; Subtracts one integer from another.
;  Takes the minuend in R0, subtrahend in R1.
;  Returns the difference in R2.

SUB     ST  R3, SAVER3  ; Save R3.
        NOT R3, R1      ; Negate R1.
        ADD R3, R3, #1
        ADD R2, R0, R3  ; Add -R1 to R0.
        LD  R3, SAVER3  ; Restore R3.
        RET

SAVER3  .FILL x0000     ; Space to save R3

        .END
