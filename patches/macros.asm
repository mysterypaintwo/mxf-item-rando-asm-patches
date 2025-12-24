
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
