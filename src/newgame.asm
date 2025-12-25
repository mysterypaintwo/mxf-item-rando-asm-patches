; =======================================================
; Set Inventory + Starting location at the start of the game
; =======================================================
org $8A80D2
  JSL NewGameSetup
  BRA $00

org !START_FREESPACE_SLOT_05
RandoStartTable:
  dw $0063   ; energy
  dw $0005   ; missiles
  dw $0000   ; power bombs
  dw $0001   ; reserves
  dw $0000   ; items
  dw $0000   ; beams
  db $01     ; area
  db $00     ; load

; =======================================================
; Set Inventory + Starting location at the start of the game
; Pointer-driven
; =======================================================
NewGameSetup:
{
  ; ---------------------------
  ; Load RandoStartTable pointer
  ; ---------------------------
  LDA.l RandoStartTablePtr
  STA $00
  LDA.l RandoStartTablePtr+2
  STA $02
  
  LDY #$0000

  ; energy
  LDA [$00],y
  STA $09C2
  STA $09C4
  INY #2

  ; missiles
  LDA [$00],y
  STA $09C6
  STA $09C8
  INY #2

  ; power bombs
  LDA [$00],y
  STA $09CE
  STA $09D0
  INY #2

  ; reserves
  LDA [$00],y
  STA $09D4
  STA $09EC
  STA $09EE
  INY #2

  ; items
  LDA [$00],y
  STA $09A2
  STA $09A4
  INY #2

  ; beams
  LDA [$00],y
  STA $09A6
  STA $09A8
  INY #2

  ; ---------------------------
  ; 8-bit values
  ; ---------------------------
  SEP #$20            ; 8-bit A

  ; area
  LDA [$00],y
  STA $079F
  INY

  ; load / station
  LDA [$00],y
  STA $078B

  ; ---------------------------
  ; Events and fixes
  ; ---------------------------
  LDA #$FF : STA $7ED909
  LDA #$01 : STA $0DF4

  REP #$20

  RTL
}
