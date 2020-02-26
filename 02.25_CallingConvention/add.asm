        .ORIG x3000

; int main(void)
MAINFN  LD  R6, INITSP  ; Init. the stack pointer.
        ADD R5, R6, #0  ; Init. the frame pointer.

        ; Push '2'.
        AND R0, R0, #0
        ADD R0, R0, #2
        ADD R6, R6, #-1
        STR R0, R6, #0

        ; Push '1'.
        ADD R0, R0, #-1
        ADD R6, R6, #-1
        STR R0, R6, #0

        ; Call "add".
        JSR ADDFN

        ; Pop the return value.
        LDR R1, R6, #0
        ADD R6, R6, #1

        ; Pop '1'.
        ADD R6, R6, #1

        ; Pop '2'.
        ADD R6, R6, #1

        LEA R0, STRING  ; NOTE: "printf" is really another function call, but
        PUTS            ;       it's defined in stdio, and its implementation
        LD  R0, INTOFF  ;       is beyond the scope of this course.
        ADD R0, R0, R1
        OUT
        LD  R0, NEWLINE
        OUT

        HALT

INITSP  .FILL xFE00
STRING  .STRINGZ "1 + 2 = "
INTOFF  .FILL x30
NEWLINE .FILL x0A


; int add(int, int)
ADDFN   ; Push space for ret. val.
        ADD R6, R6, #-1

        ; Push the return address.
        ADD R6, R6, #-1
        STR R7, R6, #0

        ; Push the dynamic link.
        ADD R6, R6, #-1
        STR R5, R6, #0

        ; Set the frame pointer.
        ADD R5, R6, #-1

        ; Push "z".
        ADD R6, R6, #-1

        ; Load "x" into R0.
        LDR R0, R5, #4

        ; Load "y" into R1.
        LDR R1, R5, #5

        ; Compute "x + y".
        ADD R0, R0, R1

        ; Store "x + y" in "z".
        STR R0, R5, #0

        ; Store the return value.
        LDR R0, R5, #0
        STR R0, R5, #3

        ; Pop "z".
        ADD R6, R6, #1

        ; Pop the dynamic link.
        LDR R5, R6, #0
        ADD R6, R6, #1

        ; Pop the return address.
        LDR R7, R6, #0
        ADD R6, R6, #1

        ; Return.
        RET

        .END
