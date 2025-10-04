main:
        addiu   $sp,$sp,-32
        sw      $fp,28($sp)
        move    $fp,$sp
        li      $2,1                        # 0x1
        sw      $2,16($fp)
        li      $2,1                        # 0x1
        sw      $2,20($fp)
        lw      $3,16($fp)
        lw      $2,20($fp)
        nop
        addu    $2,$3,$2
        sw      $2,12($fp)
        lw      $2,12($fp)
        nop
        addiu   $2,$2,3
        sw      $2,12($fp)
        sw      $0,8($fp)
        b       $L2
        nop

$L3:
        lw      $2,12($fp)
        nop
        addiu   $2,$2,1
        sw      $2,12($fp)
        lw      $2,8($fp)
        nop
        addiu   $2,$2,1
        sw      $2,8($fp)
$L2:
        lw      $2,8($fp)
        nop
        slt     $2,$2,10
        bne     $2,$0,$L3
        nop

        move    $2,$0
        move    $sp,$fp
        lw      $fp,28($sp)
        addiu   $sp,$sp,32
        jr      $31
        nop
