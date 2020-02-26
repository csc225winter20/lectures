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
        ADD R6, R6, #-1     ; Push space for the return value.
        ADD R6, R6, #-1     ; Push the return address.
        STR R7, R6, #0
        ADD R6, R6, #-1     ; Push the dynamic link.
        STR R5, R6, #0
        ADD R5, R6, #-1     ; Set the frame pointer.
                            ; NOTE: There are no locals.

        LDR R0, R5, #4      ; Load "n" into R0.
        BRp SUMELSE         ; If less than or equal to zero...
        ; NOTE: Base case:
        AND R0, R0, #0      ; ...set return value to 0...
        STR R0, R5, #3
        BRnzp SUMRET        ; Else...

SUMELSE ; NOTE: Recursive case:
        ; CallER setup:
        ADD R0, R0, #-1     ; ...compute "n - 1"...
        ADD R6, R6, #-1     ; ...push "n - 1"...
        STR R0, R6, #0
        JSR SUMFN           ; ...recurse on "sum(n - 1)"...

        ; CallER teardown:
        LDR R1, R6, #0      ; ...pop "sum(n - 1)" into R1...
        ADD R6, R6, #1
        ADD R6, R6, #1      ; ...pop arguments...

        LDR R0, R5, #4      ; ...load "n" into R0...
        ADD R0, R0, R1      ; ...compute "sum(n - 1) + n"...
        STR R0, R5, #3      ; ...set return value to "sum(n - 1) + n"...

        ; CallEE teardown:
SUMRET                      ; NOTE: There were no locals.
        LDR R5, R6, #0      ; Pop the dynamic link.
        ADD R6, R6, #1
        LDR R7, R6, #0      ; Pop the return address.
        ADD R6, R6, #1
        RET                 ; Return.

        .END
