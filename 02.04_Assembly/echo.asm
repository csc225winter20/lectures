; Infinitely reads and echoes typed characters.

        .ORIG x3000
LOOP    GETC            ; Read a character from the keyboard.
        OUT             ; Print that character to the terminal.
        BRnzp LOOP      ; Loop infinitely.
        .END
