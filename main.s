.ifdef __C64__
    border_color = $d020
    jiffy_lsb = $a2 ; Jiffy clock LSB
.endif
.ifdef __PLUS4__
    border_color = $ff19
    jiffy_lsb = $a5 ; Jiffy clock LSB
.endif

loop:
    lda jiffy_lsb
wait4jiffy:
    cmp jiffy_lsb
    beq wait4jiffy

    inc border_color

    ldx #$ff
simulate_workload:
    dex
    bne simulate_workload

    dec border_color

    jmp loop
