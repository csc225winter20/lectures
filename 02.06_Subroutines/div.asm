        .ORIG x3000

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

        .END
