# Takeover (C64, 1984) analysis/reformatting

## Overview

An analysis/reformatting (for readability) of the BASIC source code of the 1984 game `Takeover` (a.k.a. `Military Coup`) by Humphrey Walwyn. Written for the C64 in the book "Power Plays on the Commodore 64".

[GB64: Takeover (1984)](https://gb64.com/game.php?id=16144)

## Recommended approach

Open [the final reformatting](3.%20annotated%20GOSUBs%20and%20GOTOs.bas) and read what you're interested in, while having [the variable table](variable_table.md) in another window on the side.

## Process

Most of the analysis and reformatting has been performed by GitHub Copilot (GPT-4o).

This introduces line-end comments (`// 1030 = Main Game Loop`) to annotate GOSUBs and some far-jump GOTOs. These are not valid C64 BASIC and would have to be removed before trying to run the source again.
But even with that in mind, Copilot might very well have introduced new errors, removed essential code or introduced new hallucinations. The reformatted files have never been interpreted again, and might very well be incorrect. They have not been thoroughly compared to the original either.

## Files

* [`1. reference extraction.bas`](1.%20reference%20extraction.bas): The source I extracted from a tape archive I found in an archive somewhere. I don't know whether it is an unmodified original, or how closely it matches the source from the book.
* [`2. reformatted, sectioned, subroutine headers.bas`](./2.%20reformatted,%20sectioned,%20subroutine%20headers.bas): Copilot did a) introduce whitespace to improve readability, b) split the code into logical sections and preface each section with a header comment.
* [`3. annotated GOSUBs and GOTOs.bas`](3.%20annotated%20GOSUBs%20and%20GOTOs.bas): Copilot did a) annotate every GOSUB (and every GOTO that jumped further than indicating a simple FOR/WHILE/REPEAT control flow) with a line-end comment, stating the name of the subroutine or code section the line number represents.
* [`variable_table.md`](variable_table.md): Copilot did a) generate a table of all system constants, like color codes, poke addresses and audio information, including their hex value, b) generate a table of game constants, including an assumed value, c) generate a table of dynamic variables, and d) write a few sentence on the purpose and usage of each dynamic variable as the game uses it.

The last document is intended to be shown on the side while working with the source code.
