incsrc defines.asm
incsrc macros.asm
incsrc freespace.asm
incsrc newgame.asm

org !START_FREESPACE_SLOT_00    ; $80FE88 ; PC 0x007E88
RandoStartTablePtr:
  dl RandoStartTable

%printfreespace_all()
