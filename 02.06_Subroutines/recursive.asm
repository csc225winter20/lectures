        .ORIG x3000
MAIN    JSR FOO
        HALT

FOO     ADD R0, R0, #-1 ; Decrement R0.
        BRnz DONE       ; If R0 is positive...
        ST  R7, SAVER7  ; ...recurse...
        JSR FOO
        LD  R7, SAVER7
DONE    RET             ; BUG: This infinitely loops for all R0 >= 3.
SAVER7  .FILL x3000
        .END
