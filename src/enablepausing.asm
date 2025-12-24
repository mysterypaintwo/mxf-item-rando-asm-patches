; =======================================================
; Enable map fully on new game
; =======================================================

EventsEnableMap:
  %cm_toggle_bit_inverted("Map Obtained", $7E0DF4, $0001, .routine)
.routine
  %a8()
  CMP #$01 : BNE .off
  LDA #$FF
  BRA .store
.off
  LDA #$00
.store
  STA $7ED909
  RTL