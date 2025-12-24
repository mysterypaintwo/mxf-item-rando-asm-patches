!START_FREESPACE_SLOT_00 = $00FE88 ; PC 0x007E88
!END_FREESPACE_SLOT_00   = $00FEA5 ; PC 0x007EA5

!START_FREESPACE_SLOT_01 = $03B9C0 ; PC 0x01B9C0
!END_FREESPACE_SLOT_01   = $03B9FF ; PC 0x01B9FF

!START_FREESPACE_SLOT_02 = $04FFB8 ; PC 0x027FB8
!END_FREESPACE_SLOT_02   = $04FFFF ; PC 0x027FFF

!START_FREESPACE_SLOT_03 = $0BF790 ; PC 0x05F790
!END_FREESPACE_SLOT_03   = $0BF7FF ; PC 0x05F7FF

!START_FREESPACE_SLOT_04 = $10FFD8 ; PC 0x087FD8
!END_FREESPACE_SLOT_04   = $10FFFF ; PC 0x087FFF

!START_FREESPACE_SLOT_05 = $12DB48 ; PC 0x095B48
!END_FREESPACE_SLOT_05   = $12DCCF ; PC 0x095CCF

!START_FREESPACE_SLOT_06 = $1BCD28 ; PC 0x0DCD28
!END_FREESPACE_SLOT_06   = $1BCD4F ; PC 0x0DCD4F

; -----------------------------
; Freespace slot utilities
; -----------------------------

; Enter a freespace slot by numeric index (e.g. 03)
macro slot(num)
    pushpc
    org !START_FREESPACE_SLOT_<num>
endmacro

macro endslot()
    pullpc
endmacro

; Print the defined freespace slot range
macro printfreespace(num)
    print "FREESPACE_SLOT_", "<num>", ": $", \
          hex(!START_FREESPACE_SLOT_<num>), " - $", \
          hex(!END_FREESPACE_SLOT_<num>)
endmacro

; Print all defined freespace slots at once
macro printfreespace_all()
    %printfreespace(00)
    %printfreespace(01)
    %printfreespace(02)
    %printfreespace(03)
    %printfreespace(04)
    %printfreespace(05)
    %printfreespace(06)
endmacro
