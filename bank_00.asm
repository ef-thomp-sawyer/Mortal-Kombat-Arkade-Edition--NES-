.segment "BANK_00"
; $8000-$9FFF
.setcpu "6502X"

.feature org_per_seg
.feature pc_assignment

.include "globals.inc"
.include "charmap.inc"


; -----------------------------------------------------------------------------
.export sub_load_stage_background

sub_load_stage_background:
	lda ram_irq_routine_idx
	asl A
	sta zp_7B
	jsr sub_prepare_stage_rle_pointer
	lda #$00
	sta zp_05
	jsr sub_stage_rle_unpack
	inc zp_7B
	lda zp_7B
	jsr sub_prepare_stage_rle_pointer
	lda #$01
	sta zp_05
	jmp sub_stage_rle_unpack ;jsr sub_stage_rle_unpack
	;rts

; -----------------------------------------------------------------------------

sub_prepare_stage_rle_pointer:
	asl A
	tax
	lda tbl_stage_rle_ptrs+0,X
	sta zp_ptr1_lo
	lda tbl_stage_rle_ptrs+1,X
	sta zp_ptr1_hi
	lda zp_ptr1_lo
	clc
	adc #$02
	sta zp_ptr1_lo
	lda zp_ptr1_hi
	adc #$00
	sta zp_ptr1_hi
	rts

; -----------------------------------------------------------------------------

; PPU pointers to the four nametables (stage backgrounds)
tbl_stage_ppu_ptrs:
	.word $2000, $2400, $2800, $2C00

; -----------------------------------------------------------------------------

sub_stage_rle_unpack:
	lda #$00
	sta PpuControl_2000
	sta PpuMask_2001
	lda zp_05
	asl A
	tax
	ldy #$00
	lda PpuStatus_2002
	lda tbl_stage_ppu_ptrs+1,X
	sta PpuAddr_2006
	lda tbl_stage_ppu_ptrs+0,X
	sta PpuAddr_2006
	@805E:
	lda (zp_ptr1_lo),Y
	bpl @807C
	cmp #$FF
	beq @8090

		and #$7F
		sta zp_18
		@806A:
			jsr sub_rom_8091
			lda (zp_ptr1_lo),Y
			sta PpuData_2007
		dec zp_18
		bne @806A

		jsr sub_rom_8091
		jmp @805E

		@807C:
		sta zp_18
		jsr sub_rom_8091
		lda (zp_ptr1_lo),Y
		@8083:
			sta PpuData_2007
		dec zp_18
		bne @8083

		jsr sub_rom_8091
		jmp @805E

	@8090:
	rts

; -----------------------------------------------------------------------------

; TODO Inline this
sub_rom_8091:
	inc zp_ptr1_lo
	bne :+
		inc zp_ptr1_hi
	:
	rts

; -----------------------------------------------------------------------------

tbl_stage_rle_ptrs:
	.word rle_goros_lair_left
	.word rle_goros_lair_right
	.word rle_pit_left
	.word rle_pit_right
	.word rle_courtyard_left
	.word rle_courtyard_right
	.word rle_palace_gates_left
	.word rle_palace_gates_right
	.word rle_warrior_shrine_left
	.word rle_warrior_shrine_right
	.word rom_throne_room_left
	.word rom_throne_room_right

; -----------------------------------------------------------------------------

; Nametable data, starts with PPU address and terminates with $FFFF
rle_goros_lair_left:
	.byte $20, $00, $63, $00, $81, $81, $0B, $8A
	.byte $02, $00, $0B, $8A, $81, $92, $43, $00
	.byte $F8, $02, $01, $02, $01, $02, $01, $02
	.byte $01, $02, $F8, $F9, $03, $04, $05, $06
	.byte $07, $08, $06, $F2, $F1, $06, $07, $08
	.byte $06, $F3, $F5, $06, $07, $08, $06, $09
	.byte $0A, $01, $02, $01, $02, $01, $02, $01
	.byte $02, $01, $02, $01, $0C, $0D, $0E, $0F
	.byte $10, $11, $0F, $F0, $12, $0F, $13, $14
	.byte $11, $15, $F4, $0F, $10, $11, $0F, $16
	.byte $17, $1A, $19, $1A, $19, $1A, $19, $1A
	.byte $19, $1A, $19, $1A, $F9, $1B, $1C, $1D
	.byte $1E, $1F, $20, $1E, $21, $22, $23, $24
	.byte $25, $26, $1F, $20, $1E, $1F, $27, $28
	.byte $29, $19, $1A, $19, $1A, $19, $1A, $19
	.byte $1A, $19, $1A, $19, $1A, $2A, $2B, $2C
	.byte $2D, $2E, $2F, $2D, $30, $31, $32, $33
	.byte $34, $C8, $35, $2E, $2F, $2D, $2E, $36
	.byte $37, $38, $3A, $39, $3A, $39, $3A, $39
	.byte $3A, $39, $3A, $39, $3A, $39, $3B, $3C
	.byte $3D, $1F, $20, $1E, $1F, $20, $41, $42
	.byte $43, $44, $1F, $20, $1E, $1F, $20, $45
	.byte $46, $47, $39, $3A, $39, $3A, $39, $3A
	.byte $39, $3A, $39, $3A, $39, $3A, $48, $49
	.byte $4A, $2E, $2F, $2D, $2E, $2F, $4E, $4F
	.byte $50, $51, $2E, $2F, $2D, $2E, $2F, $52
	.byte $53, $54, $0C, $55, $96, $56, $57, $58
	.byte $40, $3E, $3F, $40, $3E, $3F, $5C, $5D
	.byte $5E, $40, $3E, $3F, $40, $3E, $5F, $60
	.byte $61, $70, $71, $08, $00, $98, $62, $63
	.byte $64, $65, $66, $4D, $4B, $4C, $4D, $4B
	.byte $4C, $6A, $6B, $6C, $4D, $4B, $4C, $4D
	.byte $4B, $6D, $6E, $6F, $7D, $7E, $08, $00
	.byte $98, $72, $73, $74, $75, $76, $3E, $3F
	.byte $40, $3E, $3F, $40, $77, $78, $79, $3E
	.byte $3F, $40, $3E, $3F, $7A, $7B, $7C, $8A
	.byte $8B, $08, $00, $97, $7F, $80, $81, $82
	.byte $83, $4B, $4C, $4D, $4B, $4C, $4D, $84
	.byte $85, $86, $4B, $4C, $4D, $4B, $4C, $87
	.byte $88, $89, $98, $05, $00, $82, $FC, $FD
	.byte $03, $00, $96, $8C, $8D, $8E, $8F, $59
	.byte $5A, $5B, $59, $5A, $5B, $93, $94, $5B
	.byte $59, $5A, $5B, $59, $5A, $95, $96, $97
	.byte $55, $0A, $00, $96, $55, $8D, $99, $9A
	.byte $67, $68, $69, $67, $68, $69, $9E, $9F
	.byte $69, $67, $68, $69, $67, $68, $A0, $A1
	.byte $97, $55, $0A, $00, $96, $55, $8D, $A2
	.byte $A3, $91, $92, $90, $91, $92, $90, $A4
	.byte $A5, $90, $91, $92, $90, $91, $92, $A2
	.byte $A3, $97, $55, $0A, $00, $95, $55, $8D
	.byte $A6, $A7, $9C, $9D, $9B, $9C, $9D, $9B
	.byte $A8, $A9, $AA, $9C, $9D, $9B, $9C, $9D
	.byte $A6, $A7, $97, $0D, $AB, $92, $AD, $AE
	.byte $90, $91, $92, $90, $91, $92, $90, $91
	.byte $92, $90, $91, $92, $90, $91, $AD, $AE
	.byte $02, $AB, $9F, $AC, $AB, $AC, $AB, $AC
	.byte $AB, $AC, $AB, $AC, $AB, $AC, $AB, $AF
	.byte $B0, $9B, $9C, $9D, $9B, $9C, $9D, $9B
	.byte $9C, $9D, $9B, $9C, $9D, $9B, $9C, $AF
	.byte $B0, $AC, $02, $AB, $83, $AC, $AB, $AC
	.byte $03, $AB, $9C, $AC, $AB, $AC, $AB, $AC
	.byte $B1, $B2, $91, $92, $90, $91, $92, $90
	.byte $91, $92, $90, $91, $92, $90, $91, $92
	.byte $B1, $B2, $AB, $B3, $B4, $F6, $F7, $02
	.byte $F6, $85, $B3, $B4, $F6, $F7, $F6, $02
	.byte $F7, $C6, $B3, $B6, $B7, $B8, $B9, $BA
	.byte $BB, $BC, $AC, $BD, $BE, $BF, $C0, $AB
	.byte $B4, $AC, $B4, $F6, $F7, $BD, $BE, $BF
	.byte $C0, $AB, $AC, $C1, $B4, $AC, $B4, $B5
	.byte $AC, $B4, $C1, $C2, $C3, $C4, $C5, $C6
	.byte $C7, $C8, $AC, $C9, $CA, $CB, $CC, $CD
	.byte $B4, $AC, $B4, $B5, $AC, $C9, $CA, $CB
	.byte $CC, $CD, $DE, $B5, $B4, $B5, $AC, $B4
	.byte $B5, $B4, $B5, $CE, $CF, $D0, $D1, $D2
	.byte $02, $B5, $E1, $AC, $D3, $D4, $D5, $D6
	.byte $D7, $B4, $B5, $AC, $B4, $B5, $D3, $D4
	.byte $D5, $D6, $D7, $B5, $DC, $B3, $DD, $AC
	.byte $B4, $B5, $BD, $BE, $BF, $C0, $AB, $B6
	.byte $B7, $B8, $B9, $BA, $BB, $BC, $D8, $D9
	.byte $DA, $DB, $DC, $B3, $DD, $AC, $C1, $B4
	.byte $AC, $B4, $B5, $AC, $E3, $C1, $E4, $E5
	.byte $E6, $E7, $C9, $CA, $CB, $CC, $CD, $C2
	.byte $C3, $C4, $C5, $C6, $C7, $C8, $DF, $E0
	.byte $E1, $E2, $E3, $C1, $E4, $E5, $B5, $B4
	.byte $B5, $AC, $B4, $B5, $AC, $B4, $AC, $B4
	.byte $EE, $EF, $D3, $D4, $D5, $D6, $D7, $CE
	.byte $CF, $D0, $D1, $D2, $03, $B5, $8A, $E8
	.byte $E9, $EA, $EB, $B5, $EC, $ED, $B5, $AC
	.byte $B4, $02, $B5, $86, $AC, $B5, $AC, $B5
	.byte $AC, $B4, $02, $B5, $84, $AC, $B5, $AC
	.byte $B4, $02, $B5, $82, $AC, $B4, $02, $B5
	.byte $82, $AC, $B4, $02, $B5, $82, $AC, $B4
	.byte $02, $B5, $81, $AC, $08, $0F, $08, $F0
	.byte $11, $FF, $81, $F7, $0E, $FF, $08, $AA
	.byte $08, $FA, $FF, $FF

; -----------------------------------------------------------------------------

; Nametable data, starts with PPU address and terminates with $FFFF
rle_goros_lair_right:
	.byte $20, $00, $77, $00, $49, $00, $8C, $0B
	.byte $FA, $FB, $02, $01, $02, $01, $02, $01
	.byte $02, $01, $02, $14, $00, $8C, $18, $01
	.byte $02, $01, $02, $01, $02, $01, $02, $01
	.byte $02, $01, $14, $00, $8C, $FA, $1A, $19
	.byte $1A, $19, $1A, $19, $1A, $19, $1A, $19
	.byte $1A, $14, $00, $8C, $1A, $19, $1A, $19
	.byte $1A, $19, $1A, $19, $1A, $19, $1A, $19
	.byte $14, $00, $8C, $39, $3A, $39, $3A, $39
	.byte $3A, $39, $3A, $39, $3A, $39, $3A, $14
	.byte $00, $8C, $3A, $39, $3A, $39, $3A, $39
	.byte $3A, $39, $3A, $39, $3A, $39, $14, $00
	.byte $0C, $55, $14, $00, $83, $39, $70, $71
	.byte $08, $00, $81, $62, $14, $00, $83, $39
	.byte $7D, $7E, $05, $00, $84, $FC, $FD, $00
	.byte $72, $14, $00, $83, $19, $8A, $8B, $08
	.byte $00, $81, $7F, $14, $00, $82, $19, $98
	.byte $02, $00, $82, $FC, $FD, $1A, $00, $82
	.byte $39, $55, $1E, $00, $82, $39, $55, $1E
	.byte $00, $82, $19, $55, $1E, $00, $0C, $AB
	.byte $14, $00, $84, $AB, $AC, $AB, $AC, $03
	.byte $AB, $81, $AC, $03, $AB, $81, $AC, $14
	.byte $00, $84, $AC, $AB, $AC, $AB, $03, $AC
	.byte $81, $AB, $03, $AC, $81, $AB, $14, $00
	.byte $8C, $F6, $F7, $F6, $F7, $B4, $B5, $F6
	.byte $F7, $B4, $B5, $F6, $F7, $14, $00, $81
	.byte $B4, $02, $B5, $89, $AC, $B6, $B7, $B8
	.byte $B9, $BA, $BB, $B5, $AC, $14, $00, $8C
	.byte $B5, $AC, $B4, $B5, $C2, $C3, $C4, $C5
	.byte $C6, $C7, $B4, $B5, $14, $00, $81, $B4
	.byte $03, $B5, $85, $CE, $CF, $D0, $D1, $D2
	.byte $03, $B5, $14, $00, $85, $E6, $E7, $AC
	.byte $B4, $B5, $02, $AC, $82, $B4, $B5, $02
	.byte $AC, $81, $B4, $14, $00, $84, $EE, $EF
	.byte $AC, $B4, $02, $B5, $82, $AC, $B4, $02
	.byte $B5, $82, $AC, $B4, $14, $00, $81, $B4
	.byte $02, $B5, $82, $AC, $B4, $02, $B5, $82
	.byte $AC, $B4, $02, $B5, $81, $AC, $14, $00
	.byte $1A, $FF, $81, $DF, $06, $FF, $81, $F5
	.byte $0E, $FF, $08, $AA, $08, $FA, $FF, $FF

; -----------------------------------------------------------------------------

; Nametable data, starts with PPU address and terminates with $FFFF
rle_pit_left:
.incbin "bin/stage_pit_left.rle"

; -----------------------------------------------------------------------------

; Nametable data, starts with PPU address and terminates with $FFFF
rle_pit_right:
.incbin "bin/stage_pit_right.rle"

; -----------------------------------------------------------------------------

; Nametable data, starts with PPU address and terminates with $FFFF
rle_courtyard_left:
	.byte $20, $00, $63, $00, $81, $81, $0B, $8A
	.byte $02, $00, $0B, $8A, $81, $92, $43, $00
	.byte $22, $01, $82, $C5, $C6, $0B, $01, $81
	.byte $02, $05, $01, $83, $03, $04, $05, $05
	.byte $01, $81, $06, $02, $01, $88, $C9, $CA
	.byte $CB, $CC, $CD, $CE, $07, $08, $06, $01
	.byte $82, $09, $0A, $05, $01, $83, $0B, $0C
	.byte $0D, $05, $01, $93, $0E, $0F, $01, $D5
	.byte $D6, $D7, $D8, $11, $EA, $EB, $12, $13
	.byte $14, $15, $16, $17, $18, $19, $1A, $05
	.byte $01, $83, $1B, $1C, $1D, $05, $01, $83
	.byte $1E, $1F, $20, $02, $27, $83, $DC, $DD
	.byte $DE, $03, $27, $88, $28, $29, $2A, $2B
	.byte $2C, $2D, $2E, $2F, $04, $01, $85, $30
	.byte $31, $32, $33, $34, $04, $01, $83, $35
	.byte $36, $37, $02, $3E, $84, $E2, $E3, $E4
	.byte $E5, $02, $3E, $89, $3F, $40, $41, $42
	.byte $43, $44, $45, $46, $47, $03, $01, $85
	.byte $48, $49, $4A, $4B, $4C, $03, $01, $95
	.byte $4D, $4E, $4F, $50, $6B, $6C, $6D, $6E
	.byte $6F, $70, $57, $58, $59, $5A, $5B, $5C
	.byte $5D, $5E, $5F, $60, $61, $02, $01, $87
	.byte $62, $63, $64, $65, $66, $67, $68, $02
	.byte $01, $95, $69, $6A, $6B, $6C, $87, $88
	.byte $89, $8A, $8B, $8C, $71, $72, $73, $74
	.byte $75, $76, $77, $78, $79, $7A, $7B, $02
	.byte $7C, $87, $7D, $7E, $7F, $80, $81, $82
	.byte $83, $02, $84, $95, $85, $86, $87, $88
	.byte $A3, $A4, $A5, $A6, $A7, $A8, $8D, $8E
	.byte $8F, $90, $91, $92, $93, $94, $95, $96
	.byte $97, $02, $98, $87, $99, $9A, $9B, $9C
	.byte $9D, $9E, $9F, $02, $A0, $95, $A1, $A2
	.byte $A3, $A4, $BF, $10, $11, $12, $13, $14
	.byte $A9, $AA, $AB, $AC, $AD, $AE, $AF, $B0
	.byte $B1, $B2, $B3, $02, $B4, $87, $B5, $B6
	.byte $B7, $B8, $B9, $BA, $BB, $02, $BC, $F8
	.byte $BD, $BE, $BF, $10, $C4, $C5, $C6, $C7
	.byte $C8, $C9, $CA, $C1, $C2, $C3, $C4, $C5
	.byte $C6, $C7, $C8, $C9, $CA, $C1, $C2, $C3
	.byte $C4, $C5, $C6, $C7, $C8, $C9, $CA, $C1
	.byte $C2, $C3, $C4, $C5, $CE, $CF, $D0, $D1
	.byte $D2, $D3, $D4, $CB, $CC, $CD, $CE, $CF
	.byte $D0, $D1, $D2, $D3, $D4, $CB, $CC, $CD
	.byte $CE, $CF, $D0, $D1, $D2, $D3, $D4, $CB
	.byte $CC, $CD, $CE, $CF, $D8, $D9, $DA, $DB
	.byte $DC, $DD, $DE, $D5, $D6, $D7, $D8, $D9
	.byte $DA, $DB, $DC, $DD, $DE, $D5, $D6, $D7
	.byte $D8, $D9, $DA, $DB, $DC, $DD, $DE, $D5
	.byte $D6, $D7, $D8, $D9, $E2, $E3, $E4, $E5
	.byte $E6, $E7, $E8, $DF, $E0, $E1, $E2, $E3
	.byte $E4, $E5, $E6, $E7, $E8, $DF, $E0, $E1
	.byte $EC, $E2, $E3, $E4, $E5, $E6, $E7, $E8
	.byte $DF, $E0, $E1, $E2, $E3, $1D, $1E, $1F
	.byte $20, $21, $22, $23, $24, $25, $1E, $1D
	.byte $1E, $1F, $20, $21, $22, $23, $24, $25
	.byte $1E, $1D, $1E, $1F, $20, $21, $22, $23
	.byte $24, $25, $1E, $1D, $1E, $26, $27, $28
	.byte $27, $29, $2A, $2B, $2C, $2D, $2E, $26
	.byte $27, $28, $27, $29, $2A, $2B, $2C, $2D
	.byte $2E, $26, $27, $28, $27, $29, $2A, $2B
	.byte $2C, $2D, $2E, $26, $27, $2F, $30, $31
	.byte $32, $33, $34, $35, $36, $37, $38, $2F
	.byte $30, $31, $32, $33, $34, $35, $36, $37
	.byte $38, $2F, $30, $31, $32, $33, $34, $35
	.byte $36, $37, $38, $2F, $30, $02, $39, $02
	.byte $3A, $08, $39, $02, $3A, $08, $39, $02
	.byte $3A, $08, $39, $82, $3B, $3C, $02, $3D
	.byte $88, $3E, $3F, $40, $41, $42, $3C, $3B
	.byte $3C, $02, $3D, $88, $3E, $3F, $40, $41
	.byte $42, $3C, $3B, $3C, $02, $3D, $8A, $3E
	.byte $3F, $40, $41, $42, $3C, $3B, $3C, $43
	.byte $44, $02, $45, $88, $46, $47, $48, $49
	.byte $4A, $44, $43, $44, $02, $45, $88, $46
	.byte $47, $48, $49, $4A, $44, $43, $44, $02
	.byte $45, $8A, $46, $47, $48, $49, $4A, $44
	.byte $43, $44, $4B, $4C, $02, $4D, $88, $4E
	.byte $4F, $50, $51, $52, $4C, $4B, $4C, $02
	.byte $4D, $88, $4E, $4F, $50, $51, $52, $4C
	.byte $4B, $4C, $02, $4D, $8A, $4E, $4F, $50
	.byte $51, $52, $4C, $4B, $4C, $53, $54, $02
	.byte $55, $88, $56, $57, $58, $59, $5A, $54
	.byte $53, $54, $02, $55, $88, $56, $57, $58
	.byte $59, $5A, $54, $53, $54, $02, $55, $88
	.byte $56, $57, $58, $59, $5A, $54, $53, $54
	.byte $40, $5B, $08, $0F, $81, $B0, $02, $F0
	.byte $8D, $B0, $F0, $A0, $F0, $E0, $99, $55
	.byte $95, $AA, $EF, $AA, $EF, $AA, $08, $FF
	.byte $08, $AF, $18, $FF, $FF, $FF

; -----------------------------------------------------------------------------

; Nametable data, starts with PPU address and terminates with $FFFF
rle_courtyard_right:
	.byte $20, $00, $77, $00, $49, $00, $0C, $01
	.byte $14, $00, $08, $01, $82, $C7, $C8, $02
	.byte $01, $14, $00, $05, $01, $87, $10, $CF
	.byte $D0, $D1, $D2, $D3, $D4, $14, $00, $8C
	.byte $21, $22, $23, $24, $25, $26, $EC, $ED
	.byte $D9, $DA, $EE, $DB, $14, $00, $85, $38
	.byte $39, $3A, $3B, $3C, $03, $3D, $84, $DF
	.byte $E0, $E1, $3D, $14, $00, $85, $51, $52
	.byte $53, $54, $55, $02, $56, $85, $E6, $E7
	.byte $E8, $E9, $56, $14, $00, $8C, $6D, $6E
	.byte $6F, $70, $57, $58, $59, $5A, $5B, $5C
	.byte $5D, $5E, $14, $00, $8C, $89, $8A, $8B
	.byte $8C, $71, $72, $73, $74, $75, $76, $77
	.byte $78, $14, $00, $8C, $A5, $A6, $A7, $A8
	.byte $8D, $8E, $8F, $90, $91, $92, $93, $94
	.byte $14, $00, $8C, $11, $12, $13, $14, $A9
	.byte $AA, $AB, $AC, $AD, $AE, $AF, $B0, $14
	.byte $00, $8C, $C6, $C7, $C8, $C9, $CA, $C1
	.byte $C2, $C3, $C4, $C5, $C6, $C7, $14, $00
	.byte $8C, $D0, $D1, $D2, $D3, $D4, $CB, $CC
	.byte $CD, $CE, $CF, $D0, $D1, $14, $00, $8C
	.byte $DA, $DB, $DC, $DD, $DE, $D5, $D6, $D7
	.byte $D8, $D9, $DA, $DB, $14, $00, $8C, $E4
	.byte $E5, $E6, $E7, $E8, $DF, $E0, $E1, $E2
	.byte $E3, $E4, $E5, $14, $00, $8C, $1F, $20
	.byte $21, $22, $23, $24, $25, $1E, $1D, $1E
	.byte $1F, $20, $14, $00, $8C, $28, $27, $29
	.byte $2A, $2B, $2C, $2D, $2E, $26, $27, $28
	.byte $27, $14, $00, $8C, $31, $32, $33, $34
	.byte $35, $36, $37, $38, $2F, $30, $31, $32
	.byte $14, $00, $02, $3A, $08, $39, $02, $3A
	.byte $14, $00, $02, $3D, $88, $3E, $3F, $40
	.byte $41, $42, $3C, $3B, $3C, $02, $3D, $14
	.byte $00, $02, $45, $88, $46, $47, $48, $49
	.byte $4A, $44, $43, $44, $02, $45, $14, $00
	.byte $02, $4D, $88, $4E, $4F, $50, $51, $52
	.byte $4C, $4B, $4C, $02, $4D, $14, $00, $02
	.byte $55, $88, $56, $57, $58, $59, $5A, $54
	.byte $53, $54, $02, $55, $14, $00, $0C, $5B
	.byte $14, $00, $0C, $5B, $14, $00, $08, $0F
	.byte $90, $B0, $F0, $E0, $B0, $F0, $A0, $F0
	.byte $E0, $66, $55, $66, $AA, $EF, $AA, $EF
	.byte $AA, $08, $FF, $08, $AF, $18, $FF, $FF
	.byte $FF

; -----------------------------------------------------------------------------

; Nametable data, starts with PPU address and terminates with $FFFF
rle_palace_gates_left:
	.byte $20, $00, $63, $00, $81, $81, $0B, $8A
	.byte $02, $00, $0B, $8A, $81, $92, $43, $00
	.byte $88, $01, $02, $03, $04, $05, $06, $07
	.byte $08, $18, $09, $8A, $01, $0A, $0B, $0C
	.byte $0D, $0E, $0F, $10, $11, $12, $16, $09
	.byte $82, $01, $13, $02, $0F, $86, $14, $15
	.byte $16, $17, $18, $19, $16, $09, $8A, $01
	.byte $1A, $1B, $1C, $0F, $0B, $1D, $1E, $1F
	.byte $20, $16, $09, $8A, $01, $21, $22, $23
	.byte $1B, $1C, $24, $25, $26, $27, $16, $09
	.byte $82, $01, $28, $02, $09, $86, $29, $2A
	.byte $2B, $2C, $2D, $2E, $0A, $09, $82, $2F
	.byte $30, $02, $31, $81, $32, $07, $09, $82
	.byte $33, $34, $04, $09, $84, $35, $36, $37
	.byte $20, $09, $09, $83, $38, $39, $3A, $02
	.byte $3B, $83, $3C, $3D, $3E, $05, $09, $82
	.byte $01, $28, $05, $09, $86, $3F, $40, $41
	.byte $09, $42, $43, $02, $09, $82, $44, $45
	.byte $02, $09, $81, $46, $02, $47, $82, $48
	.byte $49, $02, $47, $84, $4A, $09, $44, $45
	.byte $02, $09, $82, $01, $28, $05, $09, $86
	.byte $4B, $4C, $4D, $09, $4E, $4F, $02, $09
	.byte $8F, $50, $51, $09, $52, $53, $54, $55
	.byte $56, $57, $58, $59, $5A, $5B, $50, $51
	.byte $02, $09, $8D, $5C, $5D, $5E, $5F, $60
	.byte $61, $09, $62, $63, $64, $09, $65, $66
	.byte $02, $09, $84, $67, $68, $09, $69, $07
	.byte $6A, $84, $6B, $6C, $67, $68, $02, $09
	.byte $8D, $6D, $6E, $6F, $70, $71, $72, $73
	.byte $62, $74, $75, $09, $76, $77, $02, $09
	.byte $8F, $78, $79, $09, $7A, $7B, $7C, $7B
	.byte $7C, $7B, $7C, $7B, $7D, $7E, $78, $79
	.byte $02, $09, $8D, $01, $28, $7F, $80, $81
	.byte $82, $83, $62, $84, $85, $86, $87, $88
	.byte $02, $09, $85, $89, $8A, $09, $8B, $8C
	.byte $06, $8D, $84, $8E, $09, $89, $8A, $02
	.byte $09, $98, $DB, $DC, $DD, $DE, $DF, $E0
	.byte $E1, $E2, $E3, $E4, $E5, $E6, $E7, $E8
	.byte $E9, $EA, $EB, $EC, $ED, $EE, $EF, $F0
	.byte $F1, $F2, $02, $EF, $9E, $F3, $E9, $EA
	.byte $EB, $EC, $ED, $67, $68, $69, $6A, $6B
	.byte $6C, $6D, $6E, $6F, $70, $71, $72, $73
	.byte $74, $75, $76, $77, $78, $79, $7A, $7B
	.byte $7C, $00, $7D, $02, $7B, $B5, $7E, $75
	.byte $76, $77, $78, $79, $7F, $80, $81, $14
	.byte $81, $14, $82, $6E, $6F, $83, $84, $85
	.byte $86, $14, $87, $88, $89, $8A, $8B, $81
	.byte $14, $81, $14, $81, $14, $81, $14, $87
	.byte $88, $89, $8A, $8B, $67, $8C, $8D, $1F
	.byte $8D, $1F, $8E, $6E, $6F, $8F, $90, $91
	.byte $92, $1F, $93, $02, $94, $8B, $95, $96
	.byte $8D, $1F, $8D, $1F, $8D, $1F, $8D, $1F
	.byte $93, $02, $94, $F8, $95, $96, $67, $97
	.byte $2F, $98, $2A, $2E, $2F, $6E, $6F, $99
	.byte $9A, $9B, $9C, $2E, $9D, $9E, $9F, $A0
	.byte $A1, $98, $2A, $2E, $2F, $98, $2A, $2E
	.byte $2F, $9D, $9E, $9F, $A0, $A1, $67, $A2
	.byte $2F, $98, $2A, $2E, $2F, $A3, $A4, $A5
	.byte $2F, $98, $2A, $2E, $2F, $98, $2A, $2E
	.byte $2F, $98, $2A, $2E, $2F, $98, $2A, $2E
	.byte $2F, $98, $2A, $2E, $2F, $98, $67, $A6
	.byte $38, $A7, $36, $37, $38, $A7, $36, $37
	.byte $38, $A7, $36, $37, $38, $A7, $36, $37
	.byte $38, $A7, $36, $37, $38, $A7, $36, $37
	.byte $38, $A7, $36, $37, $38, $A7, $67, $A8
	.byte $42, $A9, $40, $41, $42, $A9, $40, $41
	.byte $42, $A9, $40, $41, $42, $A9, $40, $41
	.byte $42, $A9, $40, $41, $F8, $42, $A9, $40
	.byte $41, $42, $A9, $40, $41, $42, $A9, $67
	.byte $AA, $4D, $4E, $4B, $4C, $4D, $4E, $4B
	.byte $4C, $4D, $4E, $4B, $4C, $4D, $4E, $4B
	.byte $4C, $4D, $4E, $4B, $4C, $4D, $4E, $4B
	.byte $4C, $4D, $4E, $4B, $4C, $4D, $4E, $67
	.byte $AB, $54, $55, $52, $53, $54, $55, $52
	.byte $53, $54, $55, $52, $53, $54, $55, $52
	.byte $53, $54, $55, $52, $53, $54, $55, $52
	.byte $53, $54, $55, $52, $53, $54, $55, $67
	.byte $AC, $5B, $5C, $59, $5A, $5B, $5C, $59
	.byte $5A, $5B, $5C, $59, $5A, $5B, $5C, $59
	.byte $5A, $5B, $5C, $59, $5A, $5B, $5C, $59
	.byte $5A, $5B, $5C, $59, $5A, $5B, $5C, $67
	.byte $AD, $62, $63, $60, $61, $62, $63, $60
	.byte $61, $62, $63, $60, $61, $92, $62, $63
	.byte $60, $61, $62, $63, $60, $61, $62, $63
	.byte $60, $61, $62, $63, $60, $61, $62, $63
	.byte $08, $0F, $08, $F0, $05, $FF, $85, $5F
	.byte $DF, $FF, $7F, $DD, $02, $FF, $81, $77
	.byte $02, $55, $83, $7F, $77, $DD, $02, $FF
	.byte $81, $BB, $02, $AA, $81, $F7, $18, $FF
	;.byte $81, $0F
	.byte $FF, $FF

; -----------------------------------------------------------------------------

; Nametable data, starts with PPU address and terminates with $FFFF
rle_palace_gates_right:
	.byte $20, $00, $60, $00, $60, $FF, $04, $09
	.byte $81, $8F, $02, $90, $85, $91, $92, $93
	.byte $94, $95, $14, $FF, $04, $09, $81, $96
	.byte $02, $90, $85, $97, $98, $99, $9A, $9B
	.byte $14, $FF, $04, $09, $88, $9C, $9D, $9E
	.byte $9F, $A0, $A1, $A2, $A3, $14, $FF, $04
	.byte $09, $88, $A4, $A5, $A6, $A7, $A8, $A9
	.byte $AA, $AB, $14, $FF, $04, $09, $88, $AC
	.byte $90, $AD, $AE, $AF, $B0, $B1, $B2, $14
	.byte $FF, $04, $09, $88, $8F, $90, $B3, $B4
	.byte $B5, $B6, $09, $B7, $14, $FF, $04, $09
	.byte $84, $96, $90, $B8, $B9, $03, $09, $81
	.byte $B7, $14, $FF, $82, $BA, $BB, $02, $09
	.byte $84, $8F, $90, $BC, $B9, $03, $09, $81
	.byte $B7, $14, $FF, $82, $BD, $BE, $02, $09
	.byte $84, $96, $90, $BC, $B9, $02, $09, $82
	.byte $BF, $C0, $14, $FF, $82, $C1, $C2, $02
	.byte $09, $88, $96, $C3, $C4, $C5, $5E, $C6
	.byte $C7, $C8, $14, $FF, $82, $C9, $CA, $02
	.byte $09, $88, $CB, $CC, $BC, $B9, $CD, $61
	.byte $CE, $CF, $14, $FF, $8C, $D0, $D1, $D2
	.byte $09, $D3, $D4, $BC, $B9, $6F, $D5, $D6
	.byte $D7, $14, $FF, $8C, $F4, $F5, $F6, $F7
	.byte $F8, $F9, $FA, $FB, $FC, $FD, $FE, $DA
	.byte $14, $FF, $8C, $01, $02, $03, $04, $05
	.byte $06, $07, $08, $09, $0A, $0B, $0C, $14
	.byte $FF, $8C, $0D, $0E, $0F, $10, $11, $12
	.byte $07, $13, $14, $15, $16, $17, $14, $FF
	.byte $8C, $18, $19, $1A, $1B, $1C, $1D, $07
	.byte $1E, $1F, $20, $21, $22, $14, $FF, $8C
	.byte $23, $24, $25, $26, $27, $28, $07, $29
	.byte $2A, $2B, $2C, $2D, $14, $FF, $8C, $2A
	.byte $2E, $2F, $30, $31, $32, $07, $29, $2A
	.byte $33, $34, $35, $14, $FF, $8C, $36, $37
	.byte $38, $39, $3A, $3B, $3C, $29, $36, $3D
	.byte $3E, $3F, $14, $FF, $8C, $40, $41, $42
	.byte $43, $44, $45, $46, $47, $40, $48, $49
	.byte $4A, $14, $FF, $8C, $4B, $4C, $4D, $4E
	.byte $4B, $4C, $4D, $4E, $4B, $4F, $50, $51
	.byte $14, $FF, $8C, $52, $53, $54, $55, $52
	.byte $53, $54, $55, $52, $56, $57, $58, $14
	.byte $FF, $8C, $59, $5A, $5B, $5C, $59, $5A
	.byte $5B, $5C, $59, $5D, $5E, $5F, $14, $FF
	.byte $8C, $60, $61, $62, $63, $60, $61, $62
	.byte $63, $60, $64, $65, $66, $14, $FF, $08
	.byte $0F, $08, $F0, $05, $FF, $88, $5F, $DF
	.byte $FF, $7F, $FF, $DF, $FF, $77, $02, $55
	.byte $86, $7F, $F7, $FF, $DD, $FF, $BB, $02
	.byte $AA, $81, $F7, $18, $FF ;, $81, $0F
	.byte $FF, $FF

; -----------------------------------------------------------------------------

; Nametable data, starts with PPU address and terminates with $FFFF
rle_warrior_shrine_left:
	.byte $20, $00, $63, $00, $81, $81, $0B, $8A
	.byte $02, $00, $0B, $8A, $81, $92, $43, $00
	.byte $85, $01, $02, $03, $04, $05, $1B, $00
	.byte $86, $0A, $0B, $0C, $0D, $0E, $0F, $04
	.byte $00, $86, $62, $63, $00, $64, $00, $65
	.byte $03, $00, $86, $66, $67, $68, $69, $6A
	.byte $6B, $07, $00, $86, $15, $16, $17, $18
	.byte $19, $1A, $04, $00, $9C, $6C, $6D, $6E
	.byte $6F, $00, $70, $71, $72, $73, $74, $75
	.byte $76, $77, $78, $79, $00, $7A, $7B, $00
	.byte $7C, $7D, $7E, $0C, $21, $22, $23, $24
	.byte $25, $04, $00, $9C, $82, $83, $84, $85
	.byte $00, $86, $87, $88, $89, $8A, $8B, $8C
	.byte $8D, $8E, $8F, $00, $90, $91, $00, $92
	.byte $93, $94, $2B, $2C, $2D, $2E, $2F, $30
	.byte $05, $00, $82, $98, $99, $02, $00, $8D
	.byte $9A, $9B, $9C, $9D, $9E, $9F, $A0, $A1
	.byte $A2, $A3, $A4, $A5, $A6, $02, $00, $88
	.byte $A7, $A8, $37, $38, $39, $3A, $3B, $3C
	.byte $05, $00, $82, $AB, $AC, $02, $00, $8D
	.byte $AD, $AE, $AF, $B0, $B1, $B2, $B3, $B4
	.byte $B5, $B6, $B7, $B8, $B9, $03, $00, $81
	.byte $BA, $02, $00, $84, $43, $44, $45, $25
	.byte $05, $00, $82, $BC, $BD, $03, $00, $8C
	.byte $BE, $BF, $C0, $C1, $C2, $C3, $C4, $C5
	.byte $C6, $C7, $C8, $C9, $03, $00, $81, $CA
	.byte $03, $00, $83, $49, $4A, $4B, $05, $00
	.byte $82, $54, $55, $03, $00, $8C, $56, $57
	.byte $58, $00, $59, $5A, $5B, $5C, $00, $5D
	.byte $5E, $5F, $03, $00, $81, $60, $03, $00
	.byte $86, $CD, $CE, $CF, $00, $D0, $D1, $02
	.byte $00, $87, $D2, $D3, $D4, $00, $D5, $D6
	.byte $D7, $02, $00, $89, $D8, $D9, $DA, $DB
	.byte $00, $DC, $DD, $DE, $DF, $02, $00, $81
	.byte $E0, $03, $00, $9A, $43, $44, $45, $00
	.byte $46, $47, $00, $48, $49, $4A, $4B, $00
	.byte $4C, $4D, $4E, $4F, $00, $50, $51, $52
	.byte $53, $00, $54, $55, $56, $57, $02, $00
	.byte $81, $58, $03, $00, $9A, $43, $59, $5A
	.byte $00, $5B, $5C, $00, $5D, $5E, $5F, $60
	.byte $00, $61, $62, $63, $10, $00, $64, $65
	.byte $66, $67, $00, $68, $00, $69, $6A, $02
	.byte $00, $81, $6B, $03, $00, $88, $43, $6C
	.byte $6D, $6E, $6F, $70, $00, $71, $02, $00
	.byte $90, $72, $00, $73, $74, $75, $76, $77
	.byte $78, $00, $79, $7A, $7B, $7C, $00, $7D
	.byte $7E, $02, $00, $81, $7F, $03, $00, $88
	.byte $43, $44, $45, $80, $81, $82, $00, $83
	.byte $02, $13, $83, $14, $00, $83, $02, $13
	.byte $83, $14, $00, $83, $02, $13, $83, $14
	.byte $00, $83, $02, $13, $84, $14, $00, $83
	.byte $13, $03, $1A, $88, $43, $44, $84, $85
	.byte $86, $87, $1A, $88, $02, $18, $83, $19
	.byte $1A, $88, $02, $18, $83, $19, $1A, $88
	.byte $02, $18, $83, $19, $1A, $88, $02, $18
	.byte $84, $19, $1A, $88, $18, $03, $21, $88
	.byte $43, $44, $89, $8A, $8B, $8C, $21, $8D
	.byte $02, $1F, $83, $20, $21, $8D, $02, $1F
	.byte $83, $20, $21, $8D, $02, $1F, $83, $20
	.byte $21, $8D, $02, $1F, $84, $20, $21, $8D
	.byte $1F, $03, $26, $86, $43, $44, $8E, $8F
	.byte $90, $91, $17, $26, $03, $2B, $83, $43
	.byte $44, $92, $1A, $2B, $03, $2D, $83, $93
	.byte $94, $95, $1A, $2D, $95, $96, $97, $98
	.byte $99, $9A, $32, $31, $32, $31, $32, $31
	.byte $32, $31, $32, $31, $32, $31, $9B, $9C
	.byte $9D, $9E, $02, $9F, $8C, $A0, $A1, $A2
	.byte $A3, $32, $31, $32, $31, $32, $A4, $A5
	.byte $A6, $0D, $38, $82, $A7, $A8, $08, $18
	.byte $82, $A9, $AA, $04, $38, $81, $AB, $0F
	.byte $3C, $84, $AC, $AD, $AE, $AF, $04, $18
	.byte $84, $B0, $B1, $B2, $B3, $04, $3C, $95
	.byte $3E, $3F, $3E, $3F, $3E, $3F, $3E, $3F
	.byte $3E, $3F, $3E, $3F, $3E, $3F, $3E, $3F
	.byte $3E, $B4, $B5, $B6, $B7, $02, $B8, $9E
	.byte $B9, $BA, $BB, $BC, $3F, $3E, $3F, $3E
	.byte $3F, $40, $41, $40, $41, $40, $41, $40
	.byte $41, $40, $41, $40, $41, $40, $41, $40
	.byte $41, $40, $41, $40, $41, $40, $02, $41
	.byte $82, $40, $41, $02, $40, $85, $41, $40
	.byte $41, $40, $41, $20, $42, $08, $0F, $02
	.byte $F0, $86, $B0, $A0, $B0, $A0, $E0, $F0
	.byte $02, $FF, $81, $BB, $04, $AA, $81, $BA
	.byte $02, $FF, $82, $BB, $AE, $03, $AA, $81
	.byte $AB, $02, $FF, $81, $FB, $05, $FA, $18
	.byte $FF ;, $81, $0F
	.byte $FF, $FF

; -----------------------------------------------------------------------------

; Nametable data, starts with PPU address and terminates with $FFFF
rle_warrior_shrine_right:
	.byte $20, $00, $77, $00, $49, $00, $04, $FF
	.byte $03, $00, $85, $05, $06, $07, $08, $09
	.byte $18, $FF, $02, $00, $86, $10, $11, $12
	.byte $0C, $13, $14, $14, $FF, $84, $7F, $80
	.byte $81, $FF, $02, $00, $86, $1B, $1C, $1D
	.byte $1E, $1F, $20, $14, $FF, $84, $95, $96
	.byte $97, $FF, $02, $00, $86, $26, $27, $28
	.byte $29, $2A, $0C, $14, $FF, $84, $A9, $AA
	.byte $00, $FF, $02, $00, $86, $31, $32, $33
	.byte $34, $35, $36, $14, $FF, $81, $BB, $02
	.byte $00, $81, $FF, $02, $00, $86, $3D, $3E
	.byte $3F, $40, $41, $42, $14, $FF, $81, $CB
	.byte $02, $00, $81, $FF, $02, $00, $84, $26
	.byte $46, $47, $48, $02, $00, $14, $FF, $81
	.byte $61, $03, $FF, $02, $00, $83, $51, $52
	.byte $53, $03, $00, $14, $FF, $81, $E1, $02
	.byte $FF, $86, $E2, $E3, $FF, $E4, $E5, $E6
	.byte $17, $FF, $81, $01, $02, $00, $86, $02
	.byte $03, $00, $04, $05, $06, $03, $00, $14
	.byte $FF, $81, $07, $02, $00, $86, $08, $09
	.byte $0A, $0B, $0C, $06, $03, $00, $14, $FF
	.byte $81, $0D, $02, $00, $86, $0E, $0F, $10
	.byte $11, $12, $06, $03, $00, $14, $FF, $89
	.byte $13, $14, $00, $15, $16, $17, $04, $05
	.byte $06, $03, $00, $14, $FF, $89, $18, $19
	.byte $1A, $1B, $1C, $1D, $1E, $05, $06, $03
	.byte $1A, $14, $FF, $89, $1F, $20, $21, $22
	.byte $23, $24, $25, $05, $06, $03, $21, $14
	.byte $FF, $03, $26, $86, $27, $28, $29, $2A
	.byte $05, $06, $03, $26, $14, $FF, $06, $2B
	.byte $83, $2C, $05, $06, $03, $2B, $14, $FF
	.byte $06, $2D, $83, $2E, $2F, $30, $03, $2D
	.byte $14, $FF, $8C, $31, $32, $31, $32, $31
	.byte $32, $31, $33, $34, $35, $36, $37, $14
	.byte $FF, $09, $38, $83, $39, $3A, $3B, $14
	.byte $FF, $0B, $3C, $81, $3D, $14, $FF, $8A
	.byte $3E, $3F, $3E, $3F, $3E, $3F, $3E, $3F
	.byte $3E, $3F, $02, $3E, $14, $FF, $8A, $40
	.byte $41, $40, $41, $40, $41, $40, $41, $40
	.byte $41, $02, $40, $14, $FF, $0C, $42, $14
	.byte $FF, $08, $0F, $03, $F0, $86, $A0, $B0
	.byte $A0, $E0, $F0, $EA, $02, $FF, $04, $AA
	.byte $85, $BA, $EE, $FF, $BB, $AE, $03, $AA
	.byte $84, $AB, $FE, $FF, $FB, $05, $FA, $18
	.byte $FF ;, $81, $0F
	.byte $FF, $FF

; -----------------------------------------------------------------------------

; Nametable data, starts with PPU address and terminates with $FFFF
rom_throne_room_left:
	.byte $20, $00, $63, $00, $81, $81, $0B, $8A
	.byte $02, $00, $0B, $8A, $81, $92, $43, $00
	.byte $02, $01, $8E, $02, $03, $04, $01, $05
	.byte $06, $07, $08, $09, $0A, $0B, $01, $0C
	.byte $0D, $02, $01, $8A, $0E, $0F, $10, $11
	.byte $12, $13, $14, $15, $16, $17, $02, $01
	.byte $82, $18, $19, $02, $01, $8E, $1A, $1B
	.byte $1C, $01, $1D, $1E, $1F, $20, $21, $22
	.byte $0B, $01, $23, $24, $02, $01, $8A, $25
	.byte $26, $27, $28, $29, $2A, $2B, $2C, $2D
	.byte $2E, $02, $01, $82, $2F, $30, $02, $01
	.byte $8E, $31, $32, $33, $01, $34, $35, $36
	.byte $37, $38, $39, $3A, $01, $3B, $3C, $02
	.byte $01, $8A, $3D, $3E, $3F, $40, $41, $42
	.byte $43, $44, $45, $46, $02, $01, $82, $47
	.byte $48, $02, $01, $8E, $49, $4A, $4B, $01
	.byte $4C, $4D, $4E, $4F, $50, $51, $52, $01
	.byte $53, $54, $02, $01, $8A, $55, $56, $57
	.byte $58, $59, $5A, $5B, $5C, $5D, $5E, $02
	.byte $01, $82, $5F, $60, $02, $01, $8E, $61
	.byte $62, $63, $01, $64, $65, $66, $67, $68
	.byte $69, $6A, $01, $6B, $6C, $02, $01, $8A
	.byte $6D, $6E, $6F, $70, $71, $72, $73, $74
	.byte $75, $76, $02, $01, $82, $77, $78, $02
	.byte $01, $8E, $79, $7A, $7B, $01, $7C, $7D
	.byte $7E, $7F, $80, $81, $0B, $01, $82, $83
	.byte $02, $01, $8A, $84, $85, $86, $87, $88
	.byte $89, $8A, $8B, $8C, $8D, $02, $01, $82
	.byte $8E, $8F, $02, $01, $8B, $90, $91, $92
	.byte $01, $93, $94, $95, $96, $97, $98, $0B
	.byte $03, $01, $8E, $99, $9A, $01, $9B, $9C
	.byte $9D, $9E, $9F, $A0, $A1, $A2, $01, $A3
	.byte $A4, $04, $01, $98, $02, $03, $04, $01
	.byte $A5, $A6, $A7, $A8, $A9, $AA, $0B, $AB
	.byte $AC, $AD, $AE, $AF, $01, $B0, $B1, $B2
	.byte $B3, $B4, $B5, $B6, $02, $01, $84, $B7
	.byte $B8, $B9, $BA, $02, $01, $83, $1A, $1B
	.byte $1C, $08, $01, $85, $BB, $BC, $BD, $BE
	.byte $BF, $02, $01, $86, $C0, $C1, $C2, $C3
	.byte $C4, $C5, $02, $01, $84, $C6, $C7, $C8
	.byte $C9, $02, $CF, $83, $CC, $CD, $CE, $06
	.byte $CF, $87, $D0, $D1, $D2, $D3, $D4, $D5
	.byte $D6, $02, $CF, $86, $D7, $D8, $D9, $DA
	.byte $DB, $DC, $02, $CF, $84, $DD, $DE, $DF
	.byte $E0, $02, $B4, $83, $1C, $1D, $1E, $06
	.byte $B4, $87, $1F, $20, $21, $22, $23, $24
	.byte $25, $02, $B4, $86, $26, $27, $28, $29
	.byte $2A, $2B, $02, $B4, $84, $2C, $2D, $2E
	.byte $2F, $02, $B3, $83, $30, $31, $32, $03
	.byte $B3, $98, $33, $34, $35, $36, $37, $38
	.byte $39, $3A, $3B, $3C, $B3, $3D, $3E, $3F
	.byte $40, $41, $42, $43, $44, $B3, $45, $46
	.byte $47, $48, $02, $B4, $8F, $49, $4A, $4B
	.byte $B4, $4C, $4D, $4E, $4F, $50, $51, $52
	.byte $53, $54, $55, $56, $02, $B4, $88, $57
	.byte $58, $59, $5A, $5B, $5C, $5D, $5E, $02
	.byte $B4, $83, $5F, $60, $61, $02, $B4, $83
	.byte $62, $63, $64, $02, $B4, $8A, $66, $67
	.byte $68, $69, $6A, $6B, $6C, $6D, $6E, $6F
	.byte $02, $B4, $81, $70, $06, $71, $81, $72
	.byte $02, $B4, $83, $73, $74, $75, $02, $1A
	.byte $83, $76, $77, $78, $0D, $1A, $82, $79
	.byte $7A, $06, $71, $82, $7B, $7C, $04, $1A
	.byte $02, $1B, $83, $7D, $7E, $7F, $1B, $1B
	.byte $C0, $AA, $83, $84, $85, $86, $87, $AA
	.byte $AB, $A6, $A7, $AA, $AB, $A6, $A7, $AA
	.byte $AB, $A6, $A7, $AA, $AB, $A6, $A7, $AA
	.byte $AB, $A6, $A7, $AA, $AB, $A6, $A7, $AA
	.byte $AB, $AC, $88, $89, $8A, $8B, $8C, $AC
	.byte $AD, $A8, $A9, $AC, $AD, $A8, $A9, $AC
	.byte $AD, $A8, $A9, $AC, $AD, $A8, $A9, $AC
	.byte $AD, $A8, $A9, $AC, $AD, $A8, $A9, $AC
	.byte $AD, $20, $8D, $40, $8E, $20, $8F, $A0
	.byte $AE, $AF, $B0, $B1, $AE, $AF, $B0, $B1
	.byte $AE, $AF, $B0, $B1, $AE, $AF, $B0, $B1
	.byte $AE, $AF, $B0, $B1, $AE, $AF, $B0, $B1
	.byte $AE, $AF, $B0, $B1, $AE, $AF, $B0, $B1
	.byte $20, $B2, $08, $0F, $83, $B0, $E0, $F0
	.byte $02, $30, $86, $50, $10, $30, $BB, $EE
	.byte $FF, $02, $33, $8D, $DD, $11, $33, $BB
	.byte $EE, $BF, $AA, $E6, $DD, $D5, $AA, $BB
	.byte $AE, $02, $AA, $81, $EE, $02, $FD, $83
	.byte $AA, $FB, $FE, $06, $FF, $08, $00, $08
	.byte $FF ;, $81, $0F
	.byte $FF, $FF

; -----------------------------------------------------------------------------

; Nametable data, starts with PPU address and terminates with $FFFF
rom_throne_room_right:
	.byte $20, $00, $40, $00, $77, $FF, $09, $FF
	.byte $02, $01, $8A, $05, $06, $07, $08, $09
	.byte $0A, $0B, $02, $03, $04, $14, $FF, $02
	.byte $01, $8A, $1D, $1E, $1F, $20, $21, $22
	.byte $0B, $1A, $1B, $1C, $14, $FF, $02, $01
	.byte $8A, $34, $35, $36, $37, $38, $39, $3A
	.byte $31, $32, $33, $14, $FF, $02, $01, $8A
	.byte $4C, $4D, $4E, $4F, $50, $51, $52, $49
	.byte $4A, $4B, $14, $FF, $02, $01, $8A, $64
	.byte $65, $66, $67, $68, $69, $6A, $61, $62
	.byte $63, $14, $FF, $02, $01, $8A, $7C, $7D
	.byte $7E, $7F, $80, $81, $0B, $79, $7A, $7B
	.byte $14, $FF, $02, $01, $8A, $93, $94, $95
	.byte $96, $97, $98, $0B, $90, $91, $92, $14
	.byte $FF, $8C, $CA, $01, $A5, $A6, $A7, $A8
	.byte $A9, $AA, $0B, $02, $03, $04, $14, $FF
	.byte $81, $CB, $08, $01, $83, $1A, $1B, $1C
	.byte $14, $FF, $83, $E1, $E2, $E3, $06, $CF
	.byte $83, $CC, $CD, $CE, $14, $FF, $83, $01
	.byte $02, $03, $06, $B4, $83, $1C, $1D, $1E
	.byte $14, $FF, $86, $04, $05, $06, $07, $08
	.byte $09, $03, $B3, $83, $30, $31, $32, $14
	.byte $FF, $8C, $0A, $0B, $0C, $0D, $0E, $0F
	.byte $10, $11, $B4, $49, $4A, $4B, $14, $FF
	.byte $87, $12, $13, $14, $15, $16, $17, $18
	.byte $02, $B4, $83, $62, $63, $64, $14, $FF
	.byte $09, $1A, $83, $76, $77, $78, $14, $FF
	.byte $09, $1B, $83, $7D, $7E, $7F, $14, $FF
	.byte $8C, $A6, $A7, $AA, $AB, $A6, $A7, $AA
	.byte $AB, $83, $84, $85, $86, $14, $FF, $8C
	.byte $A8, $A9, $AC, $AD, $A8, $A9, $AC, $AD
	.byte $88, $89, $8A, $8B, $14, $FF, $0C, $8D
	.byte $14, $FF, $0C, $8E, $14, $FF, $0C, $8E
	.byte $14, $FF, $0C, $8F, $14, $FF, $8C, $AE
	.byte $AF, $B0, $B1, $AE, $AF, $B0, $B1, $AE
	.byte $AF, $B0, $B1, $14, $FF, $0C, $B2, $14
	.byte $FF, $08, $0F, $02, $F0, $81, $A0, $02
	.byte $30, $83, $50, $10, $30, $02, $FF, $81
	.byte $AA, $02, $33, $85, $DD, $11, $33, $AE
	.byte $EF, $02, $AA, $83, $E6, $DD, $D5, $02
	.byte $AA, $81, $AE, $02, $AA, $81, $EE, $02
	.byte $FD, $81, $AA, $02, $FF, $81, $FA, $05
	.byte $FF, $08, $00, $08, $FF ;, $81, $0F
	.byte $FF, $FF

; -----------------------------------------------------------------------------
.export sub_update_health_bars
; This seems to transfer data to the PPU, depending on the flags in $4B.
sub_update_health_bars:
	lda zp_4B
	cmp #$FF
	bne @D291

		; Display the full bar at the beginning of the match
		lda #$20
		sta PpuAddr_2006
		ldx #$71	; First pattern of health bar for Player 2
		lda zp_F2
		bpl :+
			ldx #$64	; First pattern of health bar for Player 1
		:
		stx PpuAddr_2006
		ldx #$0A
		lda #$8A	; Full bar pattern
		:
			sta PpuData_2007
		dex
		bpl :-

	rts
; ----------------
	@D291:
	lda zp_ppu_control_backup
	ora #$04
	sta PpuControl_2000
	lda zp_frame_counter
	and #$01
	bne :+
		ldx #$00
		jsr sub_rom_D359
		ldx #$01
		jsr sub_rom_D359
	:
	jmp @D2EE

	@D2AB:
	lda zp_ppu_control_backup
	sta PpuControl_2000
	lda zp_game_substate
	cmp #$03	; Match main loop
	beq @D2BE

	cmp #$04
	beq @D2BE

	cmp #$05
	bne @D2ED

	@D2BE:
	lda #$20
	sta PpuAddr_2006
	lda #$8F
	sta PpuAddr_2006
	lda zp_9F
	cmp #$0F
	bcs @D2E1

	lda zp_frame_counter
	and #$04
	bne @D2E1

	lda zp_game_substate
	cmp #$03	; Match main loop
	bne @D2E1

	ldx #$FF
	stx PpuData_2007
	bne @D2EA

	@D2E1:
	ldx ram_063E
	stx PpuData_2007
	ldx ram_063F
	@D2EA:
	stx PpuData_2007
	@D2ED:
	rts
; ----------------
	@D2EE:
	lda zp_game_substate
	cmp #$03	; Match main loop
	beq @D356

	lda ram_plr1_rounds_won
	beq @D325

	ldx #$20
	stx PpuAddr_2006
	cmp #$02
	bcc @D316

	ldx #$41
	stx PpuAddr_2006
	lda #$AD
	sta PpuData_2007
	lda #$AE
	sta PpuData_2007
	lda #$20
	sta PpuAddr_2006
	@D316:
	ldx #$42
	stx PpuAddr_2006
	lda #$AD
	sta PpuData_2007
	lda #$AE
	sta PpuData_2007
	@D325:
	lda ram_plr2_rounds_won
	beq @D356

	ldx #$20
	stx PpuAddr_2006
	cmp #$02
	bcc @D347

	ldx #$5E
	stx PpuAddr_2006
	lda #$AD
	sta PpuData_2007
	lda #$AE
	sta PpuData_2007
	lda #$20
	sta PpuAddr_2006
	@D347:
	ldx #$5D
	stx PpuAddr_2006
	lda #$AD
	sta PpuData_2007
	lda #$AE
	sta PpuData_2007
	@D356:
	jmp @D2AB

; -----------------------------------------------------------------------------

sub_rom_D359:
	lda zp_plr1_damage,X
	cmp #$58
	bcc @D387

	lda zp_8E,X
	cmp #$2E
	beq @D375

	cmp #$31
	beq @D375

	cmp #$26
	beq @D38B

	lda #$2E
	sta zp_8E,X
	lda #$00
	sta zp_90,X
	@D375:
	lda zp_4B
	bmi @D38B

	; Play the "victory jingle"
	lda #$32
	sta ram_req_song
	lda #$10
	sta zp_92
	sta ram_0438
	bne @D38B

	@D387:
	lda zp_A7,X
	bne @D38C

	@D38B:
	rts
; ----------------
	@D38C:
	dec zp_A7,X
	inc zp_plr1_damage,X
	lda #$20
	sta PpuAddr_2006
	lda zp_plr1_damage,X
	sec
	sbc #$01
	lsr A
	lsr A
	lsr A
	sta zp_ptr1_lo
	txa
	bne @D3B7

	lda #$64
	clc
	adc zp_ptr1_lo
	sta PpuAddr_2006
	lda zp_plr1_damage
	sec
	sbc #$01
	and #$07
	tay
	lda @plr1_health_bar,Y
	bne @D3CA

	@D3B7:
	lda #$7B
	sec
	sbc zp_ptr1_lo
	sta PpuAddr_2006
	lda zp_plr1_damage,X
	sec
	sbc #$01
	and #$07
	tay
	lda @plr2_health_bar,Y
	@D3CA:
	sta PpuData_2007
	rts

; ----------------
; Pattern indices for health bars

	@plr1_health_bar:
	.byte $89, $88, $87, $86, $85, $84, $83, $82
	@plr2_health_bar:
	.byte $91, $90, $8F, $8E, $8D, $8C, $8B, $82

; -----------------------------------------------------------------------------



; -----------------------------------------------------------------------------
.export sub_init_game_mode

; Initialises "game mode", setting a new IRQ handler, loading nametable data
; for the stage background, sprite data for the player(s) and music
sub_init_game_mode:
	; Retrieve the stage index
	lda zp_F3	; This is player 2 fighter index, bit 7 is set for CPU opponent
	and #$7F
	tax
	lda @tbl_stage_indices,X
	sta ram_irq_routine_idx

	; Disable rendering and NMI generation
	lda #$00
	sta PpuControl_2000
	sta zp_ppu_control_backup
	sta PpuMask_2001
	sta zp_ppu_mask_backup

	lda #$01
	sta ram_040F

	; Check if the two players are using the same fighter
	; Then either add or subtract $0C to the index in order to load
	; the alternative palette
	lda zp_F2	; <- Player 1
	and #$7F
	sta zp_ptr1_lo
	lda zp_F3	; <- Player 2
	and #$7F
	cmp zp_ptr1_lo
	bne @C05A

	cmp #$0C
	bcc @C04D

	sec
	sbc #$0C
	jmp @C050

	@C04D:
	clc
	adc #$0C

	@C050:
	sta zp_ptr1_lo
	lda zp_F3
	and #$80
	ora zp_ptr1_lo
	sta zp_F3
	@C05A:
	lda zp_F2
	and #$7F
	sta zp_A3
	lda zp_F3
	and #$7F
	sta zp_A4

	; Select stage music
	ldx ram_irq_routine_idx
	lda @rom_C0C0,X
	sta zp_4A
	txa
	clc
	adc #$25	; Stage music offset
	sta ram_req_song

	lda #$00
	sta ram_0435
	sta ram_042D
	sta zp_scroll_x
	sta ram_0438
	sta zp_scroll_y

	jsr sub_clear_oam_data
	jsr sub_call_load_stage_bg
	jsr sub_show_fighter_names
	jsr sub_finish_match_init

	lda #$18
	sta zp_ppu_mask_backup
	lda #$88
	sta PpuControl_2000
	sta zp_ppu_control_backup
	lda #$00
	sta mmc3_mirroring
	inc zp_game_substate
	;nop
	lda zp_60
	sta zp_4B
	rts

; ----------------

	@tbl_stage_indices:
	.byte $00, $01, $05, $03, $04, $02, $02, $01
	.byte $04, $01, $02, $03, $00, $01, $05, $03
	.byte $04, $02, $02, $01, $04, $01, $02, $03

; ----------------

	@rom_C0C0:
	.byte $DA, $D0, $DA, $DA, $DA, $DA

; -----------------------------------------------------------------------------
.export sub_call_load_stage_bg

; Loads stage background nametables from bank 0
; $8000-$9FFF = Bank $00
; $A000-$BFFF = Bank $01
sub_call_load_stage_bg:
	lda #$00
	sta ram_043F
	sta ram_0440

	; Not needed after code relocation
	; Bank $00 in $8000-$9FFF
	;lda #$86
	;sta zp_prg_bank_select_backup
	;sta mmc3_bank_select
	;lda #$00
	;sta mmc3_bank_data
	; Bank $01 in $A000-$BFFF
	;lda #$87
	;sta zp_prg_bank_select_backup
	;sta mmc3_bank_select
	;lda #$01
	;sta mmc3_bank_data

	jmp sub_load_stage_background ;jsr sub_rom_00_8000
	;rts

; -----------------------------------------------------------------------------
.export sub_rebase_fighter_indices

; If any of the fighter indices were changed to load the alt palette,
; put it back as it was before ($00-$08 instead of $0C-$14)
sub_rebase_fighter_indices:
	lda zp_A3	; Player 1 fighter idx
	@C0EC:
	cmp #$0C
	bcc @C0F8

	sec
	sbc #$0C
	sta zp_A3
	jmp @C0EC

	@C0F8:
	lda zp_A4	; Player 2 fighter idx
	@C0FA:
	cmp #$0C
	bcc @C106

	sec
	sbc #$0C
	sta zp_A4
	jmp @C0FA

	@C106:
	rts

; -----------------------------------------------------------------------------
.export sub_match_fade_in

sub_match_fade_in:
	lda ram_0401
	bne :+
		jsr sub_rom_C69C
	:
	jsr sub_fade_palettes_in
	bcc :+
		inc zp_game_substate
	:
	rts

; -----------------------------------------------------------------------------
.export sub_match_start

sub_match_start:
	ldy zp_9F	; The match will start when this counter reaches 99 ($63)
	bne :+
		; Counter is zero: show round number
		ldx #$00
		@round_text_loop:
			lda @str_round,X
			sta ram_ppu_data_buffer,X
		inx
		cpx #$06
		bcc @round_text_loop
		
		; Show round number
		lda ram_plr1_rounds_won
		clc
		adc ram_plr2_rounds_won
		tax
		lda @str_numbers,X
		ldx #$06
		sta ram_ppu_data_buffer,X
		inx

		jsr sub_announcer_text
	:
	cpy #$31
	bne :+
		; "FIGHT!"
		lda #$06
		sta ram_req_sfx
		; Show text
		ldx #$00
		@fight_text_loop:
			lda @str_fight,X
			sta ram_ppu_data_buffer,X
		inx
		cpx #$07
		bcc @fight_text_loop
		jsr sub_announcer_text
	:
	cpy #$63
	beq :+
		; Just waiting, increase the counter and return
		inc zp_9F
		rts
	:
	; Counter is 99: advance substate and begin the match
	
	lax #$00
	sta zp_A2
	; Clear text
	:
		sta ram_ppu_data_buffer,X
	inx
	cpx #$07
	bcc :-
	jsr sub_announcer_text

	inc zp_game_substate
	rts

; ----------------

	@str_round:
	.byte "ROUND "
	@str_numbers:
	.byte $1F, $20, $21	; Yellow numbers 1, 2 and 3
	@str_fight:
	.byte " fight  "

; -----------------------------------------------------------------------------

sub_announcer_text:
		; X = number of characters in string
		stx zp_nmi_ppu_cols
		lda #$01
		sta zp_nmi_ppu_rows
		; PPU Address = $204D
		lda #$20
		sta zp_nmi_ppu_ptr_hi
		lda #$8D
		sta zp_nmi_ppu_ptr_lo
		rts

; -----------------------------------------------------------------------------

.export sub_match_eval

sub_match_eval:
	inc zp_9E
	ldy #$00
	sty zp_F1
	jsr sub_rom_C207
	iny
	jsr sub_rom_C207
	rts

; -----------------------------------------------------------------------------

sub_rom_C207:
	ldx #$07
	lda ram_plr1_rounds_won,Y
	cmp #$02
	bcs @C215

	lda zp_5E
	bne @C215

	inx
	@C215:
	stx zp_game_substate
	cpx #$08
	beq @C21D

	pla
	pla
	@C21D:
	rts

; -----------------------------------------------------------------------------
.export sub_match_fade_out

sub_match_fade_out:
	lda zp_F1
	cmp #$40
	bcs @C227

	inc zp_F1
	rts
; ----------------
	@C227:
	jsr sub_fade_palettes_out
	bcc @C271

	lda zp_9E
	cmp #$09
	bcs @C238

	lda zp_game_substate
	cmp #$08
	beq @C268

	@C238:
	ldx #$01
	lda ram_plr2_rounds_won
	cmp ram_plr1_rounds_won
	bcs @C243

	dex
	@C243:
	stx ram_040C
	ldx #$02
	lda zp_5E
	beq @C24D

	inx
	@C24D:
	stx zp_machine_state_0
	lda #$0B
	sta ram_irq_routine_idx
	lda #$00
	sta zp_scroll_y
	jsr sub_rom_C272
	lda #$00
	sta ram_067C
	sta ram_plr1_rounds_won
	sta ram_plr2_rounds_won
	sta zp_9E
	@C268:
	lda #$00
	sta ram_067D
	sta zp_game_substate
	sta zp_F1
	@C271:
	rts

; -----------------------------------------------------------------------------

sub_rom_C272:
	ldx #$00
	beq @C278

		ldx #$80
	@C278:
	lda #$F8
	@C27A:
	sta ram_oam_copy_ypos,X
	inx
	inx
	inx
	inx
	bne @C27A
	rts

; -----------------------------------------------------------------------------
