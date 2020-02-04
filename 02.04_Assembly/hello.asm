; Prints "Hello, world!"

        .ORIG x3000
        LEA R1, STRING  ; Get address of first char.
LOOP    LDR R0, R1, #0  ; Load current char.
        BRz DONE        ; While char is not null...
        OUT             ; ...print the char...
        ADD R1, R1, #1  ; ...increment address...
        BRnzp LOOP      ; ...loop back.
DONE    HALT

STRING  .STRINGZ "Hello, world!\n"
        .END
