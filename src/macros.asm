; ---------------
; General Purpose
; ---------------

macro a8() ; A = 8-bit
    SEP #$20
endmacro

macro a16() ; A = 16-bit
    REP #$20
endmacro

macro i8() ; X/Y = 8-bit
    SEP #$10
endmacro

macro i16() ; X/Y = 16-bit
    REP #$10
endmacro

macro ai8() ; A + X/Y = 8-bit
    SEP #$30
endmacro

macro ai16() ; A + X/Y = 16-bit
    REP #$30
endmacro

macro setmenubank()
; used to set the menu bank before a manual submenu jump
; assumes 16bit A
    PHK : PHK : PLA
    STA !ram_cm_menu_bank
endmacro

; ---------------
; X-Fusion Item Randomizer
; ---------------

macro cm_toggle_bit_inverted(title, addr, mask, jsltarget)
; toggle specific bits, draw ON if bits cleared
  .dm_action
    dw !ACTION_TOGGLE_BIT_INVERTED
  .dm_addr
    dl <addr> ; 24bit RAM address to display/manipulate
  .dm_bitmask
    dw <mask> ; which bits to flip
  .dm_jsl
    dw <jsltarget> ; 16bit address to code in the same bank as current menu/submenu
  .dm_text
table ../resources/normal.tbl
    db #$28, "<title>", #$FF
endmacro
