; =======================================================
; Set Inventory + Starting location at the start of the game
; =======================================================
!RandoStartTable_energy = 99
!RandoStartTable_missiles = 15
!RandoStartTable_powerBombs = 5
!RandoStartTable_reserves = 0
!RandoStartTable_items = 5
!RandoStartTable_beams = 5
!RandoStartTable_area = 1
!RandoStartTable_load = 0

org $8A80D2
    JSL NewGameSetup
    BRA $00

org !START_FREESPACE_03
RandoStartTable:
  .energy
    dw $0063
  .missiles
    dw $0005
  .powerBombs
    dw $0000
  .reserves
    dw $0001
  .items
    dw $0000
  .beams
    dw $0000
  .area
    db $0001
  .load
    db $0000

NewGameSetup:
{
  PHB
  PHK
  PLB
  LDA #!RandoStartTable_energy
  STA $09C2
  STA $09C4
  LDA #!RandoStartTable_missiles
  STA $09C6
  STA $09C8
  LDA #!RandoStartTable_powerBombs
  STA $09CE
  STA $09D0
  LDA #!RandoStartTable_reserves
  STA $09D4
  STA $09EC
  STA $09EE
  LDA #!RandoStartTable_items
  STA $09A2
  STA $09A4
  LDA #!RandoStartTable_beams
  STA $09A6
  STA $09A8
  LDA #!RandoStartTable_area
  STA $079F
  LDA #!RandoStartTable_load
  STA $078B

  ; events and fixes
  SEP #$20
  LDA #$FF : STA $7ED909
  LDA #$01 : STA $0DF4
  REP #$20

  JSL EventsEnableMap
  PLB
  RTL
}