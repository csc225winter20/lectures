        .ORIG x3000

; int main(void)
MAINFN  LD  R6, INITSP  ; Init. the stack pointer.
        ADD R5, R6, #0  ; Init. the frame pointer.

        ; Push '2'.

        ; Push '1'.

        ; Call "add".

        ; Pop the return value.

        ; Pop '1'.

        ; Pop '2'.

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

        ; Push the return address.

        ; Push the dynamic link.

        ; Set the frame pointer.

        ; Push "z".

        ; Load "x" into R0.

        ; Load "y" into R1.

        ; Compute "x + y".

        ; Store "x + y" in "z".

        ; Store the return value.

        ; Pop "z".

        ; Pop the dynamic link.

        ; Pop the return address.

        ; Return.

        .END
