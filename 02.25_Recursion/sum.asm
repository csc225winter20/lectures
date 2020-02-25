        .ORIG x3000

; int main(void)
MAINFN  LD  R6, INITSP  ; Init. the stack pointer.
        ADD R5, R6, #0  ; Init. the frame pointer.

        AND R0, R0, #0  ; Push '3'.
        ADD R0, R0, #3
        ADD R6, R6, #-1
        STR R0, R6, #0
        JSR SUMFN       ; Call "sum".

        LDR R1, R6, #0  ; Pop the return value.
        ADD R6, R6, #1
        ADD R6, R6, #1  ; Pop '3'.

        LEA R0, STRING  ; NOTE: "printf" is really another function call, but
        PUTS            ;       it's defined in stdio, and its implementation
        LD  R0, INTOFF  ;       is beyond the scope of this course.
        ADD R0, R0, R1
        OUT
        LD  R0, NEWLINE
        OUT

        HALT

INITSP  .FILL xFE00
STRING  .STRINGZ "3 + 2 + 1 + 0 = "
INTOFF  .FILL x30
NEWLINE .FILL x0A


; int sum(int)
SUMFN   ; CallEE setup:

        ; CallER setup:

        ; CallER teardown:

        ; CallEE teardown:

        .END
