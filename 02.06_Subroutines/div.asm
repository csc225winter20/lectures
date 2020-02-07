        .ORIG x3000

MAIN    AND R0, R0, #0
        ADD R0, R0, #9
        AND R1, R1, #0
        ADD R1, R1, #3

        JSR DIV

        HALT


; Divides one positive integer by another.
;  Takes the dividend in R0, divisor in R1.
;  Returns the quotient in R2, remainder in R3.

DIV     ST  R0, SAVER0
        AND R3, R3, #0  ; Clear temp quotient.

LOOP    ST  R7, SAVER7  ; Subtract R1 from R0.
        JSR SUB
        LD  R7, SAVER7
        ADD R2, R2, #0  ; Check the difference.
        BRn DONE        ; If non-negative...
        ADD R0, R2, #0  ; ...keep the difference...
        ADD R3, R3, #1  ; ...increment quotient...
        BRnzp LOOP      ; ...loop again.

DONE    ADD R2, R3, #0  ; Set the quotient.
        ADD R3, R0, #0  ; Set the remainder.
        LD  R0, SAVER0  ; Restore the dividend.
        RET

SAVER0  .FILL x0000
SAVER7  .FILL x0000


; NOTE: This subroutine must be in the same file, otherwise, the assembler will
;       not know where to find the definition of "SUB".

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
