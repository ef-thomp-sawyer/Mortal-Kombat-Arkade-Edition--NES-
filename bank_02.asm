.segment "BANK_02"
; $8000-$9FFF
.setcpu "6502X"

.feature org_per_seg
.feature pc_assignment

.include "globals.inc"

; -----------------------------------------------------------------------------
.export tbl_instrument_ptrs

tbl_instrument_ptrs:
	.word @instr_8100	; $00
	.word @instr_8104	; $01
	.word @instr_8110	; $02
	.word @instr_8116	; $03
	.word @instr_811C	; $04
	.word @instr_8124	; $05
	.word @instr_8140	; $06
	.word @instr_8146	; $07
	.word @instr_814A	; $08
	.word @instr_8158	; $09
	.word @instr_815C	; $0A
	.word @instr_8176	; $0B
	.word @instr_8180	; $0C
	.word @instr_818A	; $0D
	.word @instr_8194	; $0E
	.word @instr_819C	; $0F
	.word @instr_81A6	; $10
	.word @instr_81AC	; $11
	.word @instr_81C2	; $12
	.word @instr_81CD	; $13
	.word @instr_81D9	; $14
	.word @instr_81E3	; $15
	.word @instr_81ED	; $16
	.word @instr_81F7	; $17
	.word @instr_81FF	; $18
	.word @instr_8203	; $19
	.word @instr_821F	; $1A
	.word @instr_822B	; $1B
	.word @instr_823B	; $1C
	.word @instr_8241	; $1D
	.word @instr_8245	; $1E
	.word @instr_8249	; $1F
	.word @instr_824F	; $20
	.word @instr_826F	; $21
	.word @instr_8275	; $22
	.word @instr_827D	; $23
	.word @instr_828D	; $24
	.word @instr_8291	; $25
	.word @instr_8100	; $26
	.word @instr_8100	; $27
	.word @instr_8100	; $28
	.word @instr_8100	; $29
	.word @instr_8100	; $2A
	.word @instr_8293	; $2B
	.word @instr_8100	; $2C
	.word @instr_8100	; $2D
	.word @instr_829D	; $2E
	.word @instr_82B5	; $2F
	.word @instr_82BF	; $30
	.word @instr_82C9	; $31
	.word @instr_82D1	; $32
	.word @instr_82FD	; $33
	.word @instr_831B	; $34
	.word @instr_8100	; $35
	.word @instr_8327	; $36
	.word @instr_8337	; $37
	.word @instr_833F	; $38
	.word @instr_8343	; $39
	.word @instr_8100	; $3A
	.word @instr_8100	; $3B
	.word @instr_8100	; $3C
	.word @instr_8100	; $3D
	.word @instr_8100	; $3E
	.word @instr_8100	; $3F
	.word @instr_834F	; $40
	.word @instr_835F	; $41
	.word @instr_8379	; $42
	.word @instr_8381	; $43
	.word @instr_8397	; $44
	.word @instr_83A1	; $45
	.word @instr_83B3	; $46
	.word @instr_83C7	; $47
	.word @instr_840B	; $48
	.word @instr_840F	; $49
	.word @instr_8413	; $4A
	.word @instr_8425	; $4B
	.word @instr_842B	; $4C
	.word @instr_8431	; $4D
	.word @instr_8437	; $4E
	.word @instr_8100	; $4F
	.word @instr_843D	; $50
	.word @instr_844E	; $51
	.word @instr_845E	; $52
	.word @instr_8462	; $53
	.word @instr_846E	; $54
	.word @instr_8472	; $55
	.word @instr_8486	; $56
	.word @instr_84B0	; $57
	.word @instr_84B4	; $58
	.word @instr_84C0	; $59
	.word @instr_8100	; $5A
	.word @instr_84CC	; $5B
	.word @instr_84D0	; $5C
	.word @instr_84DE	; $5D
	.word @instr_84EE	; $5E
	.word @instr_8508	; $5F
	.word @instr_8520	; $60
	.word @instr_8528	; $61
	.word @instr_853E	; $62
	.word @instr_8554	; $63
	.word @instr_8576	; $64
	.word @instr_8100	; $65
	.word @instr_8100	; $66
	.word @instr_8100	; $67
	.word @instr_8100	; $68
	.word @instr_8100	; $69
	.word @instr_8100	; $6A
	.word @instr_8100	; $6B
	.word @instr_8598	; $6C
	.word @instr_8100	; $6D
	.word @instr_8100	; $6E
	.word @instr_859A	; $6F
	.word @instr_8100	; $70
	.word @instr_8100	; $71
	.word @instr_8100	; $72
	.word @instr_8100	; $73
	.word @instr_85A0	; $74
	.word @instr_85A8	; $75
	.word @instr_8100	; $76
	.word @instr_8100	; $77
	.word @instr_8100	; $78
	.word @instr_8100	; $79
	.word @instr_8100	; $7A
	.word @instr_85B3	; $7B
	.word @instr_8100	; $7C
	.word @instr_8100	; $7D
	.word @instr_8100	; $7E
	.word @instr_8100	; $7F

; ----------------

	@instr_8100:
	.byte $00, $00, $FF, $00

; ----------------

	@instr_8104:
	.byte $05, $0F, $02, $0C, $04, $04, $08, $02
	.byte $08, $01, $FF, $00

; -----------------

	@instr_8110:
	.byte $01, $06, $FE, $04, $FF, $FE

; -----------------

	@instr_8116:
	.byte $01, $04, $FE, $02, $FF, $FE

; -----------------

	@instr_811C:
	.byte $08, $00, $08, $40, $FE, $80, $FF, $FE

; -----------------

	@instr_8124:
	.byte $01, $14, $01, $0A, $01, $05, $01, $03
	.byte $0A, $00, $01, $01, $01, $02, $01, $01
	.byte $01, $00, $01, $FE, $01, $FE, $01, $00
	.byte $01, $00, $FF, $F0

; -----------------

	@instr_8140:
	.byte $06, $0F, $FE, $00, $FF, $00

; -----------------

	@instr_8146:
	.byte $FE, $80, $FF, $FE

; -----------------

	@instr_814A:
	.byte $01, $01, $01, $03, $02, $05, $03, $04
	.byte $06, $03, $FE, $02, $FF, $FE

; -----------------

	@instr_8158:
	.byte $FE, $40, $FF, $FE

; -----------------

	@instr_815C:
	.byte $49, $10, $42, $08, $04, $04, $C8, $02
	.byte $01, $02, $02, $04, $01, $02, $02, $00
	.byte $01, $FE, $02, $FC, $01, $FE, $02, $00
	.byte $FF, $F0

; -----------------

	@instr_8176:
	.byte $06, $0F, $02, $00, $03, $0F, $FE, $00
	.byte $FF, $00

; -----------------

	@instr_8180:
	.byte $01, $03, $01, $06, $01, $03, $FE, $01
	.byte $FF, $FE

; -----------------

	@instr_818A:
	.byte $01, $02, $01, $04, $01, $02, $FE, $01
	.byte $FF, $FE

; -----------------

	@instr_8194:
	.byte $01, $00, $01, $40, $FE, $80, $FF, $FE

; -----------------

	@instr_819C:
	.byte $02, $00, $02, $01, $02, $02, $02, $01
	.byte $FF, $F8

; -----------------

	@instr_81A6:
	.byte $0A, $0F, $FE, $00, $FF, $FE

; -----------------

	@instr_81AC:
	.byte $01, $06, $11, $04, $02, $01, $01, $03
	.byte $11, $02, $02, $01, $01, $02, $11, $01
	.byte $02, $01, $FE, $01, $FF, $FE

; -----------------

	@instr_81C2:
	.byte $00, $01, $40, $01, $80, $01, $40, $10
	.byte $00, $FF, $F6

; -----------------

	@instr_81CD:
	.byte $12, $0F, $FE, $00, $01, $80, $01, $40
	.byte $FE, $00, $FF, $FE

; -----------------

	@instr_81D9:
	.byte $01, $02, $01, $04, $01, $08, $FE, $04
	.byte $FF, $FE

; -----------------

	@instr_81E3:
	.byte $01, $01, $01, $02, $01, $04, $FE, $02
	.byte $FF, $FE

; -----------------

	@instr_81ED:
	.byte $03, $01, $03, $02, $03, $01, $03, $00
	.byte $FF, $F8

; -----------------

	@instr_81F7:
	.byte $01, $80, $01, $40, $FE, $00, $FF, $00

; -----------------

	@instr_81FF:
	.byte $FE, $0F, $FF, $FE

; -----------------

	@instr_8203:
	.byte $01, $08, $01, $06, $11, $04, $01, $00
	.byte $01, $04, $01, $03, $11, $02, $01, $00
	.byte $01, $02, $12, $01, $01, $00, $13, $01
	.byte $FE, $00, $FF, $FE

; -----------------

	@instr_821F:
	.byte $01, $00, $01, $40, $01, $80, $01, $40
	.byte $10, $00, $FF, $F6

; -----------------

	@instr_822B:
	.byte $01, $08, $01, $06, $01, $04, $01, $03
	.byte $01, $02, $01, $01, $0E, $00, $FF, $F2

; -----------------

	@instr_823B:
	.byte $28, $0F, $FE, $00, $FF, $FE

; -----------------

	@instr_8241:
	.byte $FE, $04, $FF, $FE

; -----------------

	@instr_8245:
	.byte $FE, $02, $FF, $FE

; -----------------

	@instr_8249:
	.byte $01, $80, $FE, $00, $FF, $FE

; -----------------

	@instr_824F:
	.byte $01, $0F, $01, $0E, $02, $0D, $02, $0C
	.byte $02, $0B, $03, $0A, $03, $09, $03, $08
	.byte $03, $07, $04, $06, $0E, $05, $04, $04
	.byte $04, $03, $DE, $02, $05, $01, $FF, $00

; -----------------

	@instr_826F:
	.byte $01, $00, $FE, $0F, $FF, $FE

; -----------------

	@instr_8275:
	.byte $0A, $00, $03, $01, $05, $00, $FF, $FC

; -----------------

	@instr_827D:
	.byte $01, $04, $0F, $07, $0F, $06, $0F, $04
	.byte $0F, $03, $0F, $02, $0F, $01, $FF, $00

; -----------------

	@instr_828D:
	.byte $FE, $80, $FF, $FE

; -----------------

	@instr_8291:
	.byte $FF, $01

; -----------------

	@instr_8293:
	.byte $01, $F6, $0A, $00, $03, $03, $03, $00
	.byte $FF, $FC

; -----------------

	@instr_829D:
	.byte $02, $0B, $03, $0A, $03, $09, $03, $08
	.byte $03, $07, $04, $06, $0E, $05, $04, $04
	.byte $04, $03, $DE, $02, $05, $01, $FF, $00

; -----------------

	@instr_82B5:
	.byte $01, $08, $01, $04, $01, $02, $FE, $01
	.byte $FF, $FE

; -----------------

	@instr_82BF:
	.byte $01, $C0, $01, $80, $01, $40, $03, $00
	.byte $FF, $F8

; -----------------

	@instr_82C9:
	.byte $01, $04, $01, $08, $FE, $04, $FF, $FE

; -----------------

	@instr_82D1:
	.byte $01, $01, $01, $02, $01, $04, $01, $08
	.byte $01, $04, $01, $02, $02, $00, $01, $01
	.byte $01, $01, $01, $02, $01, $04, $01, $02
	.byte $01, $01, $02, $00, $01, $01, $01, $01
	.byte $01, $01, $01, $02, $01, $01, $01, $01
	.byte $02, $00, $FF, $00

; -----------------

	@instr_82FD:
	.byte $01, $01, $01, $01, $01, $02, $01, $04
	.byte $01, $02, $01, $01, $02, $00, $01, $01
	.byte $01, $01, $01, $01, $01, $02, $01, $01
	.byte $01, $01, $02, $00, $FF, $00

; -----------------

	@instr_831B:
	.byte $01, $C0, $01, $80, $01, $40, $01, $00
	.byte $01, $40, $FF, $F6

; -----------------

	@instr_8327:
	.byte $01, $0E, $04, $0F, $01, $0C, $04, $0E
	.byte $01, $0B, $03, $0C, $FE, $0A, $FF, $FE

; -----------------

	@instr_8337:
	.byte $01, $80, $01, $40, $01, $C0, $FF, $F6

; -----------------

	@instr_833F:
	.byte $FE, $80, $FF, $00

; -----------------

	@instr_8343:
	.byte $01, $00, $01, $FE, $01, $FE, $01, $FD
	.byte $01, $FC, $FF, $F6

; -----------------

	@instr_834F:
	.byte $02, $04, $02, $02, $01, $04, $02, $02
	.byte $02, $01, $01, $02, $03, $01, $FF, $00

; -----------------

	@instr_835F:
	.byte $01, $0F, $02, $08, $02, $04, $01, $08
	.byte $02, $04, $02, $02, $01, $04, $02, $02
	.byte $02, $01, $01, $02, $03, $01, $FE, $00
	.byte $FF, $FE

; -----------------

	@instr_8379:
	.byte $03, $00, $03, $40, $04, $80, $FF, $FA

; -----------------

	@instr_8381:
	.byte $01, $00, $01, $14, $01, $04, $01, $18
	.byte $01, $08, $01, $1C, $01, $10, $01, $24
	.byte $01, $20, $01, $34, $FF, $EC

; -----------------

	@instr_8397:
	.byte $01, $00, $01, $80, $01, $40, $01, $C0
	.byte $FF, $F6

; -----------------

	@instr_83A1:
	.byte $01, $0F, $05, $00, $05, $0E, $05, $00
	.byte $05, $0A, $05, $00, $05, $04, $FE, $00
	.byte $FF, $F6

; -----------------

	@instr_83B3:
	.byte $05, $0F, $05, $0C, $05, $0A, $05, $08
	.byte $0A, $04, $0A, $02, $0A, $01, $0A, $00
	.byte $A0, $01, $FF, $00

; -----------------

	@instr_83C7:
	.byte $05, $01, $05, $01, $05, $02, $05, $03
	.byte $05, $04, $05, $05, $05, $06, $05, $07
	.byte $05, $08, $05, $09, $05, $0A, $05, $0B
	.byte $05, $0C, $05, $0D, $05, $0E, $05, $0F
	.byte $05, $0F, $05, $0E, $05, $0D, $05, $0C
	.byte $05, $0B, $05, $0A, $05, $09, $05, $08
	.byte $05, $07, $05, $06, $05, $05, $05, $04
	.byte $05, $03, $05, $02, $05, $01, $05, $01
	.byte $A0, $01, $FF, $00

; -----------------

	@instr_840B:
	.byte $FE, $0F, $FF, $00

; -----------------

	@instr_840F:
	.byte $01, $00, $FF, $00

; -----------------

	@instr_8413:
	.byte $04, $F6, $04, $EC, $1E, $E2, $04, $D8
	.byte $04, $E2, $04, $EC, $04, $F6, $04, $00
	.byte $FF, $F0

; -----------------

	@instr_8425:
	.byte $01, $05, $FE, $03, $FF, $FE

; -----------------

	@instr_842B:
	.byte $01, $80, $FE, $40, $FF, $FE

; -----------------

	@instr_8431:
	.byte $03, $00, $0F, $01, $FF, $FC

; -----------------

	@instr_8437:
	.byte $03, $01, $03, $02, $FF, $FC

; -----------------

	@instr_843D:
	.byte $08, $23, $07, $19, $06, $0F, $05, $0F
	.byte $04, $0F, $03, $0F, $02, $0F, $01, $FF
	.byte $FE

; -----------------

	@instr_844E:
	.byte $23, $07, $19, $06, $0F, $05, $0F, $04
	.byte $0F, $03, $0F, $02, $0F, $01, $FF, $FE

; -----------------

	@instr_845E:
	.byte $FE, $0F, $FF, $00

; -----------------

	@instr_8462:
	.byte $01, $0F, $02, $08, $04, $04, $08, $02
	.byte $08, $01, $FF, $00

; -----------------

	@instr_846E:
	.byte $FE, $80, $FF, $00

; -----------------

	@instr_8472:
	.byte $01, $00, $01, $FE, $01, $FE, $01, $FE
	.byte $01, $FE, $01, $FD, $01, $FD, $01, $FD
	.byte $01, $FC, $FF, $F6

; -----------------

	@instr_8486:
	.byte $02, $08, $02, $07, $02, $06, $02, $05
	.byte $02, $07, $02, $06, $02, $05, $02, $04
	.byte $03, $06, $03, $05, $03, $04, $03, $03
	.byte $03, $05, $03, $04, $03, $03, $03, $02
	.byte $03, $04, $03, $03, $03, $02, $03, $01
	.byte $FF, $14

; -----------------

	@instr_84B0:
	.byte $FE, $80, $FF, $00

; -----------------

	@instr_84B4:
	.byte $01, $00, $01, $FE, $01, $FE, $01, $FD
	.byte $01, $FC, $FF, $F6

; -----------------

	@instr_84C0:
	.byte $05, $0F, $02, $0C, $04, $04, $08, $02
	.byte $08, $01, $FF, $00

; -----------------

	@instr_84CC:
	.byte $FE, $80, $FF, $00

; -----------------

	@instr_84D0:
	.byte $04, $10, $04, $0F, $04, $0E, $04, $0C
	.byte $04, $0B, $04, $0A, $FF, $00

; -----------------

	@instr_84DE:
	.byte $02, $10, $02, $0F, $01, $0E, $02, $0D
	.byte $02, $08, $01, $07, $03, $06, $FF, $FA

; -----------------

	@instr_84EE:
	.byte $02, $40, $02, $20, $02, $10, $02, $08
	.byte $02, $04, $02, $02, $02, $FE, $02, $FC
	.byte $02, $F8, $02, $F0, $02, $E0, $02, $C0
	.byte $FF, $00

; -----------------

	@instr_8508:
	.byte $04, $10, $04, $0F, $04, $0E, $04, $0D
	.byte $04, $0C, $04, $0B, $04, $0A, $04, $09
	.byte $04, $08, $04, $07, $04, $06, $FF, $F8

; -----------------

	@instr_8520:
	.byte $05, $C0, $04, $00, $03, $00, $FF, $FD

; -----------------

	@instr_8528:
	.byte $03, $08, $03, $07, $03, $05, $03, $03
	.byte $03, $02, $02, $00, $03, $00, $02, $00
	.byte $02, $00, $02, $00, $FF, $00

; -----------------

	@instr_853E:
	.byte $40, $14, $01, $14, $01, $14, $01, $14
	.byte $01, $16, $01, $18, $01, $1A, $01, $1B
	.byte $01, $1C, $01, $1D, $FF, $FC

; -----------------

	@instr_8554:
	.byte $01, $50, $01, $46, $01, $3C, $01, $32
	.byte $01, $28, $01, $1E, $01, $14, $01, $0A
	.byte $01, $F6, $01, $EC, $01, $E2, $01, $D8
	.byte $01, $CE, $01, $C4, $01, $BA, $01, $B0
	.byte $FF, $FE

; -----------------

	@instr_8576:
	.byte $01, $B0, $01, $BA, $01, $C4, $01, $CE
	.byte $01, $D8, $01, $E2, $01, $EC, $01, $F6
	.byte $01, $0A, $01, $14, $01, $1E, $01, $28
	.byte $01, $32, $01, $3C, $01, $46, $01, $50
	.byte $FF, $FE

; -----------------

	@instr_8598:
	.byte $FF, $00

; -----------------

	@instr_859A:
	.byte $02, $01, $02, $00, $FF, $F8

; -----------------

	@instr_85A0:
	.byte $04, $03, $DE, $02, $05, $01, $FF, $00

; -----------------

	@instr_85A8:
	.byte $00, $01, $40, $01, $80, $01, $40, $10
	.byte $00, $FF, $F6

; -----------------

	@instr_85B3:
	.byte $00, $01, $40, $01, $80, $01, $40, $10
	.byte $00, $FF, $F6

; -----------------------------------------------------------------------------
.export tbl_pitches

; Period table (NTSC)
tbl_pitches:
	.word $0000	; $00	(rest)
	.word $0000	; $01	N/A
	.word $0000	; $02	N/A
	.word $0000	; $03	N/A
	.word $0000	; $04	N/A
	.word $0000	; $05	N/A
	.word $0000	; $06	N/A
	.word $0000	; $07	N/A
	.word $0000	; $08	N/A
	.word $07F1	; $09	A0
	.word $0780	; $0A	A#0
	.word $0712	; $0B	B0

	.word $06AD	; $0C	C1
	.word $064D	; $0D	C#1
	.word $05F3	; $0E	D1
	.word $059D	; $0F	D#1
	.word $054D	; $10	E1
	.word $0500	; $11	F1
	.word $04B8	; $12	F#1
	.word $0475	; $13	G1
	.word $0435	; $14	G#1
	.word $03F8 ; $15	A1
	.word $03BF	; $16	A#1
	.word $0389	; $17	B1
	.word $0356	; $18	C2
	.word $0326	; $19	C#2
	.word $02F9 ; $1A	D2
	.word $02CE	; $1B	D#2
	.word $02A6	; $1C	E2
	.word $027F	; $1D	F2
	.word $025C	; $1E	F#2
	.word $023A	; $1F	G2
	.word $021A	; $20	G#2
	.word $01FB	; $21	A2
	.word $01DF	; $22	A#2
	.word $01C4	; $23	B2

	.word $01AB	; $24	C3
	.word $0193	; $25	C#3
	.word $017C	; $26	D3
	.word $0167	; $27	D#3
	.word $0152	; $28	E3
	.word $013F	; $29	F3
	.word $012D	; $2A	F#3
	.word $011C	; $2B	G3
	.word $010C	; $2C	G#3
	.word $00FD	; $2D	A3
	.word $00EF	; $2E	A#3
	.word $00E2	; $2F	B3

	.word $00D2	; $30	C4
	.word $00C9	; $31	C#4
	.word $00BD	; $32	D4
	.word $00B3	; $33	D#4
	.word $00A9	; $34	E4
	.word $009F	; $35	F4
	.word $0096	; $36	F#4
	.word $008E	; $37	G4
	.word $0086	; $38	G#4
	.word $007E	; $39	A4
	.word $0077	; $3A	A#4
	.word $0070	; $3B	B4

	.word $006A	; $3C	C5
	.word $0064	; $3D	C#5
	.word $005E	; $3E	D5
	.word $0059	; $3F	D#5
	.word $0054	; $40	E5
	.word $004F	; $41	F5
	.word $004B	; $42	F#5
	.word $0046	; $43	G5
	.word $0042	; $44	G#5
	.word $003F	; $45	A5
	.word $003B	; $46	A#5
	.word $0038	; $47	B5

	.word $0034	; $48	C6
	.word $0031	; $49	C#6
	.word $002F	; $4A	D6
	.word $002C	; $4B	D#6
	.word $0029	; $4C	E6
	.word $0027	; $4D	F6
	.word $0025	; $4E	F#6
	.word $0023	; $4F	G6
	.word $0021	; $50	G#6
	.word $001F	; $51	A6
	.word $001D	; $52	A#6
	.word $001B	; $53	B6

	.word $001A	; $54	C7
	.word $0018	; $55	C#7
	.word $0017	; $56	D7
	.word $0015	; $57	D#7
	.word $0014	; $58	E7
	.word $0013	; $59	F7
	.word $0012	; $5A	F#7
	.word $0011	; $5B	G7
	.word $0010	; $5C	G#7
	.word $000F	; $5D	A7
	.word $000E	; $5E	A#7
	.word $000D	; $5F	B7

; -----------------------------------------------------------------------------
.export tbl_track_ptrs

; Track pointers
tbl_track_ptrs:
	.word track_silence		; $00
	.word sfx_97A7			; $01
	.word sfx_9712			; $02
	.word sfx_9785			; $03
	.word sfx_96DF			; $04
	.word sfx_96CE			; $05
	.word track_silence		; $06
	.word sfx_96F0			; $07
	.word sfx_96F0			; $08
	.word track_silence		; $09
	.word track_silence		; $0A
	.word track_silence		; $0B
	.word sfx_8A4E			; $0C
	.word sfx_9736			; $0D
	.word sfx_9750			; $0E
	.word sfx_9736			; $0F
	.word sfx_9771			; $10
	.word track_silence		; $11
	.word track_silence		; $12
	.word track_silence		; $13
	.word track_silence		; $14
	.word track_silence		; $15
	.word track_silence		; $16
	.word track_silence		; $17
	.word track_silence		; $18
	.word track_silence		; $19
	.word track_silence		; $1A
	.word track_silence		; $1B
	.word track_silence		; $1C
	.word track_silence		; $1D
	.word track_silence		; $1E
	.word track_silence		; $1F
	.word mus_menu_jingle	; $20
	.word mus_player_select	; $21
	.word track_silence		; $22
	.word mus_8960			; $23
	.word mus_8A1A			; $24
	.word mus_8D5F			; $25
	.word mus_8EE8			; $26
	.word mus_9162			; $27
	.word mus_9353			; $28
	.word mus_94C4			; $29
	.word mus_96B1			; $2A
	.word mus_8D5F			; $2B
	.word mus_8EE8			; $2C
	.word mus_9162			; $2D
	.word mus_9353			; $2E
	.word mus_94C4			; $2F
	.word mus_96B1			; $30
	.word sfx_8A4E			; $31
	.word mus_victory_jingle; $32

; -----------------------------------------------------------------------------

track_silence:
	.byte $00
	.word rom_8702
	.byte $01
	.word rom_8702
	.byte $02
	.word rom_8702
	.byte $03
	.word rom_8702
	.byte $04
	.word rom_8702
	; This should mute the SFX channels too
	.byte $80
	.word rom_8702
	.byte $81
	.word rom_8702
	.byte $82
	.word rom_8702
	.byte $83
	.word rom_8702
	.byte $84
	.word rom_8702
rom_8702:
	.byte $FF

; -----------------------------------------------------------------------------

; Square 0
rom_8703:
	.byte $F5, $02, $F6, $0F, $F9, $07, $FA, $05
	.byte $F8, $02, $83, $2D, $2B, $A4, $2D, $8C
	.byte $00, $00, $F6, $01, $F9, $34, $FA, $39
	.byte $F8, $41, $98, $17, $FF, $FF

; Square 1
rom_8721:
	.byte $F6, $0F, $F9, $12, $FA, $00, $F8, $11
	.byte $83, $39, $37, $A4, $39, $8C, $00, $00
	.byte $F6, $01, $F9, $34, $FA, $39, $F8, $41
	.byte $BC, $15, $FF, $FF

; Triangle
rom_873D:
	.byte $F6, $0F, $F9, $12, $FA, $00, $F8, $11
	.byte $83, $2B, $29, $A4, $28, $8C, $00, $00
	.byte $FF

; Noise
rom_874E:
	.byte $F6, $00, $F9, $00, $FA, $00, $F8, $53
	.byte $83, $24, $24, $24, $24, $8C, $00, $00
	.byte $00, $00, $F9, $34, $FA, $39, $F8, $46
	.byte $A4, $2D, $FF, $FF

; DMC?
rom_876A:
	.byte $FF

; ----------------

; Menu intro jingle
mus_menu_jingle:
	.byte $00
	.word rom_8703
	.byte $01
	.word rom_8721
	.byte $02
	.word rom_873D
	.byte $03
	.word rom_874E
	.byte $04
	.word rom_876A
	.byte $FF

; -----------------------------------------------------------------------------

; Square 0
rom_877B:
	.byte $F5, $02, $F6, $0B, $F9, $38, $FA, $39
	.byte $F8, $40, $88, $2D, $00, $2D, $00, $2D
	.byte $00, $2D, $00
	@rom_878E:
	.byte $F6, $0B, $F9, $38, $FA, $39, $F8, $40
	.byte $88, $21, $2D, $2B, $2D, $00, $2D, $2B
	.byte $2D, $21, $2D, $2B, $2D, $00, $2D, $2B
	.byte $2D, $21, $2D, $2B, $2D, $00, $2D, $2B
	.byte $2D, $21, $2D, $2B, $2D, $00, $2D, $2B
	.byte $2D, $F9, $12, $FA, $00, $F8, $11, $2D
	.byte $2D, $2B, $2D, $30, $84, $2D, $82, $30
	.byte $2D, $88, $2B, $28, $28, $24, $26, $A0
	.byte $28, $88, $00, $32, $84, $30, $82, $32
	.byte $30, $88, $2D, $2B, $98, $2D, $84, $30
	.byte $2B, $A0, $2D, $88, $00, $00, $00, $00
	.byte $F4
	.word @rom_878E
	.byte $FF
; ----------------

; Square 1
rom_87EA:
	.byte $F6, $0B, $F9, $38, $FA, $39, $F8, $40
	.byte $88, $00, $00, $00, $00, $00, $00, $00
	.byte $00
	@rom_87FB:
	.byte $F9, $00, $FA, $00, $F8, $33, $A0, $2D
	.byte $F9, $00, $FA, $00, $F8, $33, $88, $2D
	.byte $84, $2B, $2D, $30, $2D, $88, $2D, $2D
	.byte $2D, $2B, $2D, $2D, $84, $2B, $2D, $30
	.byte $2D, $88, $2D, $F9, $54, $FA, $55, $F8
	.byte $56, $A0, $2D, $F9, $00, $FA, $00, $F8
	.byte $33, $88, $2D, $84, $2B, $2D, $30, $2D
	.byte $88, $2D, $2D, $2D, $2B, $2D, $2D, $84
	.byte $2B, $2D, $30, $2D, $88, $2D, $F9, $54
	.byte $FA, $55, $F8, $56, $A0, $2D, $F9, $00
	.byte $FA, $00, $F8, $33, $88, $2D, $84, $2B
	.byte $2D, $30, $2D, $88, $2D, $2D, $2D, $2B
	.byte $2D, $2D, $84, $2B, $2D, $30, $2D, $88
	.byte $2D, $F9, $54, $FA, $55, $F8, $56, $A0
	.byte $2D, $F9, $00, $FA, $00, $F8, $33, $88
	.byte $2D, $84, $2B, $2D, $30, $2D, $88, $2D
	.byte $2D, $2D, $2B, $2D, $2D, $84, $2B, $2D
	.byte $30, $2D, $88, $2D, $A0, $2D, $88, $00
	.byte $00, $00, $00, $A0, $2D, $88, $00, $00
	.byte $00, $00
	.byte $F4
	.word @rom_87FB
	.byte $FF
; ----------------

; Triangle
rom_8899:
	.byte $F6, $0A, $F9, $38, $FA, $39, $F8, $40
	.byte $88, $00, $00, $00, $00, $00, $00, $00
	.byte $00
	@rom_88AA:
	.byte $F9, $38, $FA, $39, $F8, $40, $88, $21
	.byte $2D, $2B, $2D, $00, $2D, $2B, $2D
	.byte $F4
	.word @rom_88AA
	.byte $FF
; ----------------

; Noise
rom_88BD:
	.byte $F6, $00, $F9, $00, $FA, $00, $F8, $53
	.byte $88, $2F, $2D, $2F, $2D, $2F, $2D, $2F
	.byte $84, $2D, $2D
	.byte $F4
	.word rom_88BD
	.byte $FF

; ----------------

; DMC?
rom_88D4:
	.byte $FF

; ----------------

; Player select / VS screen
mus_player_select:
	.byte $00
	.word rom_877B
	.byte $01
	.word rom_87EA
	.byte $02
	.word rom_8899
	.byte $03
	.word rom_88BD
	.byte $04
	.word rom_88D4
	.byte $FF

; -----------------------------------------------------------------------------

; Square 0
rom_88E5:
	.byte $F5, $02, $F6, $0B, $F9, $38, $FA, $39
	.byte $F8, $40
	@rom_88EF:
	.byte $F6, $0B, $F9, $38, $FA, $39, $F8, $40
	.byte $88, $21, $2D, $2B, $2D, $00, $2D, $2B
	.byte $2D, $21, $2D, $2B, $2D, $00, $2D, $2B
	.byte $2D
	.byte $F4
	.word @rom_88EF
	.byte $FF
; ----------------

; Square 1
rom_890C:
	.byte $F6, $0B, $F9, $38, $FA, $39, $F8, $40
	@rom_8914:
	.byte $F9, $00, $FA, $00, $F8, $33, $88, $2D
	.byte $84, $2B, $2D, $30, $2D, $88, $2D, $2D
	.byte $2D, $2B, $2D, $2D, $84, $2B, $2D, $30
	.byte $2D, $88, $2D
	.byte $F4
	.word @rom_8914
	.byte $FF
; ----------------

; Triangle
rom_8933:
	.byte $F6, $0A, $F9, $38, $FA, $39, $F8, $40
	.byte $88, $21, $2D, $2B, $2D, $00, $2D, $2B
	.byte $2D
	.byte $F4
	.word rom_8933
	.byte $FF
; ----------------

; Noise
rom_8948:
	.byte $F6, $00, $F9, $00, $FA, $00, $F8, $53
	.byte $88, $24, $24, $24, $24, $24, $24, $24
	.byte $84, $24, $24
	.byte $F4
	.word rom_8948
	.byte $FF
; ----------------

; DMC?
rom_895F:
	.byte $FF

; ----------------

; Player selection
mus_8960:
	.byte $00
	.word rom_88E5
	.byte $01
	.word rom_890C
	.byte $02
	.word rom_8933
	.byte $03
	.word rom_8948
	.byte $04
	.word rom_895F
	.byte $FF

; -----------------------------------------------------------------------------

; Square 0
rom_8970:
	.byte $F5, $01, $F6, $00, $F9, $15, $FA, $39
	.byte $F8, $23, $86, $2D, $90, $2F, $8C, $32
	.byte $86, $2D, $DC, $2F, $86, $2D, $2F, $8C
	.byte $35, $32, $2F, $2B, $E0, $29, $86, $2F
	.byte $30, $98, $2F, $8C, $2D, $2C, $28, $26
	.byte $23, $E0, $28, $86, $2F, $2D, $D4, $2F
	.byte $86, $34, $32, $D4, $34, $B0, $35, $32
	.byte $F4
	.word rom_8970
	.byte $FF

; Square 1 / Noise
rom_89AC:
	.byte $F6, $00, $F9, $09, $FA, $00, $F8, $23
	.byte $A4, $28, $F9, $15, $FA, $39, $F8, $2F
	.byte $8C, $17, $98, $1D, $8C, $1A, $17, $98
	.byte $10, $8C, $16, $17, $98, $1D, $8C, $1A
	.byte $17, $98, $11, $8C, $17, $18, $98, $1D
	.byte $8C, $1A, $17, $98, $11, $8C, $17, $18
	.byte $98, $1D, $8C, $1A, $17, $98, $10, $8C
	.byte $16, $17, $98, $1D, $8C, $1A, $17, $98
	.byte $10, $8C, $16, $17, $98, $1D, $8C, $1A
	.byte $17, $98, $11, $8C, $17, $18, $98, $1D
	.byte $8C, $1A, $17, $98, $11, $8C, $17, $18
	.byte $98, $1D, $8C, $1A, $17
	.byte $F4
	.word rom_89AC
	.byte $FF

; Triangle
rom_8A0D:
	.byte $F6, $00, $F8, $23, $E0, $1C, $1C, $1D
	.byte $1D
	.byte $F4
	.word rom_8A0D

; Silent channel
rom_8A19:
	.byte $FF

; ----------------

mus_8A1A:
	.byte $00
	.word rom_8970
	.byte $01
	.word rom_89AC
	.byte $02
	.word rom_8A0D
	.byte $03
	.word rom_89AC
	.byte $04
	.word rom_8A19
	.byte $FF

; -----------------------------------------------------------------------------

; Square 0
rom_8A2A:
	.byte $F5, $02, $F6, $00, $F9, $38, $FA, $63
	.byte $F8, $11, $A4, $1D, $FF

; Square 1
rom_8A37:
	.byte $F6, $01, $F9, $38, $FA, $63, $F8, $11
	.byte $A4, $21, $FF

; Triangle
rom_8A42:
	.byte $F6, $00, $F9, $38, $FA, $63, $F8, $11
	.byte $A4, $2F, $FF

; Silent channel
rom_8A4D:
	.byte $FF

; ----------------

; "Siren" sound
sfx_8A4E:
	.byte $00
	.word rom_8A2A
	.byte $01
	.word rom_8A37
	.byte $02
	.word rom_8A42
	.byte $03
	.word rom_8A4D
	.byte $04
	.word rom_8A4D
	.byte $FF

; -----------------------------------------------------------------------------

; Square 0
rom_8A5E:
	.byte $F5, $02, $F6, $0F, $F9, $07, $FA, $05
	.byte $F8, $02, $8C, $2B, $B0, $2D, $FF

; Square 1
rom_8A6D:
	.byte $F6, $0F, $F9, $12, $FA, $00, $F8, $11
	.byte $8C, $2B, $B0, $2D, $FF

; Triangle
rom_8A7A:
	.byte $F6, $0F, $F9, $12, $FA, $00, $F8, $11
	.byte $8C, $29, $B0, $28, $FF

; Noise
rom_8A87:
	.byte $F6, $00, $F9, $00, $FA, $00, $F8, $53
	.byte $83, $24, $24, $24, $24, $86, $24, $24
	.byte $24, $24, $24, $24, $24, $FF

; Silent channel	
rom_8A9D:
	.byte $FF

; ----------------

mus_victory_jingle:
	.byte $00
	.word rom_8A5E
	.byte $01
	.word rom_8A6D
	.byte $02
	.word rom_8A7A
	.byte $03
	.word rom_8A87
	.byte $04
	.word rom_8A9D
	.byte $FF

; -----------------------------------------------------------------------------

; Square 0
rom_8AAE:
	.byte $F5, $02, $F6, $00, $F9, $24, $FA, $53
	.byte $F8, $23, $8C, $10, $13, $14, $92, $13
	.byte $86, $00, $8C, $00, $00, $00, $10, $13
	.byte $14, $92, $13, $86, $00, $8C, $00, $00
	.byte $00, $F6, $10, $F9, $04, $FA, $05, $F8
	.byte $02, $BC, $2D, $8C, $00, $00, $00, $F6
	.byte $00, $F9, $12, $FA, $00, $F8, $11, $10
	.byte $13, $14, $92, $13, $86, $00, $8C, $00
	.byte $00, $00, $F6, $0F, $F9, $17, $FA, $16
	.byte $F8, $14, $00, $2F, $32, $33, $34, $86
	.byte $36, $38, $92, $37, $83, $35, $34, $92
	.byte $37, $83, $38, $35, $92, $37, $83, $38
	.byte $35, $92, $37, $83, $35, $34, $33, $35
	.byte $34, $32, $BC, $31, $8C, $00, $00, $00
	.byte $00, $00, $2F, $32, $33, $34, $86, $36
	.byte $38, $92, $37, $83, $35, $34, $92, $37
	.byte $83, $38, $35, $92, $37, $83, $38, $35
	.byte $92, $37, $83, $35, $34, $33, $35, $34
	.byte $32, $BC, $31, $8C, $00, $00, $00, $00
	.byte $F4
	.word rom_8AAE
	.byte $FF

; Square 1
rom_8B4A:
	.byte $F6, $0C, $F9, $00, $FA, $53, $F8, $32
	.byte $83, $28, $89, $2B, $83, $28, $89, $2B
	.byte $83, $28, $2B, $2B, $28, $8C, $2D, $83
	.byte $28, $89, $2B, $83, $28, $89, $2B, $83
	.byte $28, $2B, $2B, $28, $2D, $89, $2F, $83
	.byte $28, $89, $2B, $83, $28, $89, $2B, $83
	.byte $28, $2B, $2B, $28, $8C, $2D, $83, $28
	.byte $89, $2B, $83, $28, $89, $2B, $83, $28
	.byte $2B, $2B, $28, $2D, $89, $2F, $83, $28
	.byte $89, $2B, $83, $28, $89, $2B, $83, $28
	.byte $2B, $2B, $28, $8C, $2D, $83, $28, $89
	.byte $2B, $83, $28, $89, $2B, $83, $28, $2B
	.byte $2B, $28, $2D, $89, $2F, $83, $28, $89
	.byte $2B, $83, $28, $89, $2B, $83, $28, $2B
	.byte $2B, $28, $8C, $2D, $83, $28, $89, $2B
	.byte $83, $28, $89, $2B, $83, $28, $2B, $2B
	.byte $28, $2D, $89, $2F, $F9, $17, $FA, $16
	.byte $F8, $14, $8C, $00, $2F, $32, $33, $34
	.byte $86, $36, $38, $92, $37, $83, $35, $34
	.byte $92, $37, $83, $38, $35, $92, $37, $83
	.byte $38, $35, $92, $37, $83, $35, $34, $33
	.byte $35, $34, $32, $8C, $31, $F9, $00, $FA
	.byte $00, $F8, $33, $83, $28, $89, $2B, $83
	.byte $28, $89, $2B, $83, $28, $2B, $2B, $28
	.byte $8C, $2D, $83, $28, $89, $2B, $83, $28
	.byte $89, $2B, $83, $28, $2B, $2B, $28, $2D
	.byte $89, $2F, $F9, $17, $FA, $16, $F8, $14
	.byte $8C, $00, $2F, $32, $33, $34, $86, $36
	.byte $38, $92, $37, $83, $35, $34, $92, $37
	.byte $83, $38, $35, $92, $37, $83, $38, $35
	.byte $92, $37, $83, $35, $34, $33, $35, $34
	.byte $32, $8C, $31, $F9, $00, $FA, $00, $F8
	.byte $33, $83, $28, $89, $2B, $83, $28, $89
	.byte $2B, $83, $28, $2B, $2B, $28, $8C, $2D
	.byte $83, $28, $89, $2B, $83, $28, $89, $2B
	.byte $83, $28, $2B, $2B, $28, $2D, $89, $2F
	.byte $F4
	.word rom_8B4A
	.byte $FF

; Triangle
rom_8C6E:
	.byte $F6, $02, $F9, $00, $FA, $64, $F8, $11
	.byte $8C, $24, $24, $24, $24, $24, $00, $86
	.byte $28, $92, $00, $8C, $24, $24, $24, $24
	.byte $24, $00, $86, $28, $00, $83, $2B, $2B
	.byte $2B, $2B, $8C, $24, $24, $24, $24, $24
	.byte $00, $86, $28, $92, $00, $8C, $24, $24
	.byte $24, $24, $24, $00, $86, $28, $00, $83
	.byte $2B, $2B, $2B, $2B, $86, $24, $24, $28
	.byte $24, $83, $28, $28, $28, $28, $24, $24
	.byte $24, $24, $86, $24, $24, $8C, $28, $83
	.byte $1F, $24, $24, $1F, $28, $86, $24, $83
	.byte $00, $86, $24, $24, $28, $24, $83, $28
	.byte $28, $28, $28, $24, $24, $24, $24, $86
	.byte $24, $24, $8C, $28, $83, $1F, $24, $24
	.byte $1F, $28, $86, $24, $83, $00, $86, $24
	.byte $24, $28, $24, $83, $28, $28, $28, $28
	.byte $24, $24, $24, $24, $2B, $2B, $2B, $2B
	.byte $24, $24, $24, $24, $21, $21, $21, $21
	.byte $28, $28, $28, $28, $86, $24, $24, $28
	.byte $24, $83, $28, $28, $28, $28, $24, $24
	.byte $24, $24, $86, $24, $24, $8C, $28, $83
	.byte $21, $24, $24, $21, $28, $86, $24, $83
	.byte $00, $86, $24, $24, $28, $24, $83, $28
	.byte $28, $28, $28, $24, $24, $24, $24, $86
	.byte $24, $24, $8C, $28, $83, $21, $24, $24
	.byte $21, $28, $86, $24, $83, $00, $86, $24
	.byte $24, $28, $24, $28, $83, $28, $28, $24
	.byte $24, $24, $24, $21, $21, $21, $21, $23
	.byte $23, $23, $23, $24, $24, $24, $24, $2B
	.byte $2B, $2B, $2B
	.byte $F4
	.word rom_8C6E
	.byte $FF

; Unused byte
	.byte $FF

; Silent channel
rom_8D5E:
	.byte $FF

; ----------------

mus_8D5F:
	.byte $00
	.word rom_8AAE
	.byte $01
	.word rom_8B4A
	.byte $02
	.word rom_8C6E
	.byte $03
	.word rom_8D5E
	.byte $04
	.word rom_8D5E
	.byte $FF

; -----------------------------------------------------------------------------

; Square 0
rom_8D6F:
	.byte $F5, $02, $F6, $03, $F9, $12, $FA, $00
	.byte $F8, $11, $86, $15, $15, $13, $15, $00
	.byte $0E, $0C, $0E, $15, $15, $13, $15, $00
	.byte $83, $13, $15, $8C, $18, $86, $15, $15
	.byte $13, $15, $00, $0E, $0C, $0E, $15, $15
	.byte $13, $15, $00, $83, $13, $15, $8C, $18
	.byte $B0, $45, $86, $15, $15, $13, $15, $00
	.byte $83, $13, $15, $8C, $18, $86, $43, $A4
	.byte $45, $86, $00, $15, $15, $13, $15, $00
	.byte $83, $13, $15, $8C, $18, $86, $15, $15
	.byte $13, $15, $00, $0E, $0C, $0E, $15, $15
	.byte $13, $15, $00, $83, $13, $15, $8C, $18
	.byte $86, $15, $15, $13, $15, $00, $0E, $0C
	.byte $0E, $15, $15, $13, $15, $00, $83, $13
	.byte $15, $8C, $18, $86, $13, $15, $18, $8C
	.byte $15, $00, $00, $00, $00, $92, $00, $8C
	.byte $00, $00, $00, $00, $00, $00, $00, $00
	.byte $F4
	.word rom_8D6F
	.byte $FF

; Square 1
rom_8DFB:
	.byte $F6, $0F, $F9, $00, $FA, $00, $F8, $33
	.byte $83, $27, $26, $25, $24, $2B, $2A, $29
	.byte $28, $27, $26, $25, $24, $2B, $2A, $29
	.byte $28, $2B, $2A, $29, $28, $2B, $2A, $29
	.byte $28, $2B, $2D, $2E, $2D, $2B, $2A, $29
	.byte $28, $27, $26, $25, $24, $2B, $2A, $29
	.byte $28, $27, $26, $25, $24, $2B, $2A, $29
	.byte $28, $2B, $2A, $29, $28, $2B, $2A, $29
	.byte $28, $2B, $2D, $2E, $2D, $2B, $2A, $29
	.byte $28, $F6, $03, $F9, $12, $FA, $00, $F8
	.byte $11, $86, $2D, $28, $2B, $2D, $30, $37
	.byte $92, $36, $86, $35, $A4, $34, $86, $2D
	.byte $28, $2B, $2D, $30, $37, $92, $36, $86
	.byte $35, $A4, $34, $83, $34, $35, $34, $32
	.byte $30, $2F, $30, $32, $34, $35, $37, $35
	.byte $34, $35, $37, $35, $34, $35, $34, $32
	.byte $30, $2F, $30, $32, $34, $35, $37, $35
	.byte $34, $35, $37, $35, $34, $35, $34, $32
	.byte $30, $2F, $30, $32, $34, $35, $37, $35
	.byte $34, $35, $37, $35, $34, $35, $34, $32
	.byte $30, $2F, $30, $32, $34, $35, $37, $35
	.byte $34, $35, $37, $35, $86, $37, $39, $30
	.byte $8C, $39, $92, $00, $F9, $34, $FA, $39
	.byte $F8, $41, $8C, $00, $00, $00, $00, $00
	.byte $00, $00, $00, $00, $00, $00, $00
	.byte $F4
	.word rom_8DFB
	.byte $FF

; Triangle
rom_8EC6:
	.byte $F6, $00, $F9, $00, $FA, $64, $F8, $11
	.byte $86, $26, $26, $24, $26, $00, $24, $8C
	.byte $2B, $86, $26, $26, $24, $26, $00, $83
	.byte $24, $26, $86, $2B, $24
	.byte $F4
	.word rom_8EC6
	.byte $FF

; Silent channel
rom_8EE7:
	.byte $FF

; ----------------

mus_8EE8:
	.byte $00
	.word rom_8D6F
	.byte $01
	.word rom_8DFB
	.byte $02
	.word rom_8EC6
	.byte $03
	.word rom_8EE7
	.byte $04
	.word rom_8EE7
	.byte $FF

; -----------------------------------------------------------------------------

; Square 0
rom_8EF8:
	.byte $F5, $02, $F6, $03, $F9, $12, $FA, $00
	.byte $F8, $11, $83, $2D, $2B, $AA, $2D, $92
	.byte $30, $32, $8C, $2B, $83, $30, $2F, $AA
	.byte $2D, $8C, $00, $00, $00, $00, $83, $2F
	.byte $30, $AA, $2F, $86, $28, $32, $2F, $30
	.byte $32, $83, $34, $35, $86, $34, $32, $8C
	.byte $2F, $86, $32, $98, $34, $86, $00, $8C
	.byte $00, $00, $00, $00, $F6, $03, $86, $15
	.byte $15, $15, $15, $18, $18, $18, $18, $1C
	.byte $1C, $1C, $1C, $21, $21, $21, $21, $B0
	.byte $2D, $28, $2D, $28, $F6, $03, $F9, $12
	.byte $FA, $00, $F8, $11, $92, $2D, $8C, $34
	.byte $86, $37, $B0, $39, $8C, $00, $92, $2D
	.byte $8C, $34, $86, $37, $B0, $39, $8C, $00
	.byte $92, $2D, $8C, $34, $86, $37, $B0, $39
	.byte $8C, $00, $92, $2D, $8C, $34, $86, $37
	.byte $B0, $39, $8C, $00, $92, $39, $8C, $37
	.byte $92, $35, $34, $8C, $32, $92, $2F, $B0
	.byte $34, $92, $32, $8C, $30, $92, $2F
	.byte $F4
	.word rom_8EF8
	.byte $FF

; ----------------

; Square 1
rom_8F93:
	.byte $F6, $03, $F9, $17, $FA, $16, $F8, $14
	.byte $B0, $15, $92, $18, $98, $17, $86, $00
	.byte $B0, $15, $92, $18, $8C, $13, $92, $11
	.byte $B0, $10, $92, $10, $8C, $1A, $92, $17
	.byte $1D, $8C, $1C, $92, $1A, $17, $8C, $1A
	.byte $92, $1C, $F9, $00, $FA, $00, $F8, $53
	.byte $86, $15, $15, $15, $15, $18, $18, $18
	.byte $18, $1C, $1C, $1C, $1C, $21, $21, $21
	.byte $21, $F9, $12, $FA, $00, $F8, $11, $92
	.byte $15, $8C, $18, $86, $1A, $8C, $1C, $86
	.byte $15, $18, $1C, $8C, $1D, $86, $1C, $8C
	.byte $1A, $92, $15, $8C, $18, $86, $1A, $8C
	.byte $1C, $86, $15, $18, $1C, $8C, $1D, $86
	.byte $1C, $8C, $1A, $92, $15, $8C, $18, $86
	.byte $1A, $8C, $1C, $86, $15, $18, $1C, $8C
	.byte $1D, $86, $1C, $8C, $1A, $92, $15, $8C
	.byte $18, $86, $1A, $8C, $1C, $86, $15, $18
	.byte $1C, $8C, $24, $92, $23, $15, $8C, $18
	.byte $86, $1A, $8C, $1C, $86, $15, $18, $1C
	.byte $8C, $1D, $86, $1C, $8C, $1A, $92, $15
	.byte $8C, $18, $86, $1A, $8C, $1C, $86, $15
	.byte $18, $1C, $8C, $24, $92, $23, $21, $8C
	.byte $1F, $92, $1D, $1C, $8C, $1A, $92, $17
	.byte $B0, $1C, $92, $1A, $8C, $18, $92, $17
	.byte $F4
	.word rom_8F93
	.byte $FF

; ----------------

; Triangle
rom_9057:
	.byte $F6, $00, $F9, $00, $FA, $64, $F8, $11
	.byte $8C, $24, $00, $86, $2B, $00, $8C, $24
	.byte $24, $00, $86, $2B, $00, $8C, $24, $83
	.byte $2B, $2B, $86, $2B, $8C, $00, $00, $00
	.byte $00, $00, $86, $2B, $00, $2B, $2B, $8C
	.byte $24, $00, $2B, $24, $24, $00, $2B, $24
	.byte $83, $2B, $2B, $86, $2B, $8C, $00, $00
	.byte $00, $00, $00, $86, $2B, $00, $2B, $2B
	.byte $24, $24, $24, $24, $26, $26, $26, $26
	.byte $28, $28, $28, $28, $2B, $2B, $83, $2B
	.byte $2B, $2B, $2B, $86, $24, $24, $2B, $83
	.byte $2B, $2B, $86, $24, $24, $2B, $00, $24
	.byte $24, $2B, $83, $2B, $2B, $8C, $24, $86
	.byte $2B, $00, $24, $24, $2B, $83, $2B, $2B
	.byte $86, $24, $24, $2B, $00, $24, $24, $2B
	.byte $83, $2B, $2B, $8C, $24, $83, $2B, $2B
	.byte $2B, $2B, $86, $24, $24, $2B, $83, $2B
	.byte $2B, $86, $24, $24, $2B, $00, $24, $24
	.byte $2B, $83, $2B, $2B, $8C, $24, $86, $2B
	.byte $00, $24, $24, $2B, $83, $2B, $2B, $86
	.byte $24, $24, $2B, $00, $24, $24, $2B, $83
	.byte $2B, $2B, $8C, $24, $83, $2B, $2B, $2B
	.byte $2B, $86, $24, $24, $2B, $83, $2B, $2B
	.byte $86, $24, $24, $2B, $00, $24, $24, $2B
	.byte $83, $2B, $2B, $8C, $24, $86, $2B, $00
	.byte $24, $24, $2B, $83, $2B, $2B, $86, $24
	.byte $24, $2B, $00, $24, $24, $2B, $83, $2B
	.byte $2B, $86, $24, $00, $83, $2B, $2B, $2B
	.byte $2B, $86, $24, $8C, $00, $86, $2B, $00
	.byte $8C, $2B, $86, $00, $24, $92, $00, $8C
	.byte $24, $86, $2B, $2B, $24, $92, $00, $86
	.byte $2B, $00, $2B, $00, $24, $92, $00, $8C
	.byte $00, $86, $2B, $83, $2B, $2B
	.byte $F4
	.word rom_9057
	.byte $FF

; ----------------

; Silent channel
rom_9161:
	.byte $FF

; ----------------

mus_9162:
	.byte $00
	.word rom_8EF8
	.byte $01
	.word rom_8F93
	.byte $02
	.word rom_9057
	.byte $03
	.word rom_9161
	.byte $04
	.word rom_9161
	.byte $FF

; -----------------------------------------------------------------------------

; Square 0
rom_9172:
	.byte $F5, $02, $F6, $05, $F9, $12, $FA, $00
	.byte $F8, $11, $8C, $00, $00, $00, $00
	.byte $F0
	.word rom_931A
	.byte $F0
	.word rom_931A
	.byte $F0
	.word rom_931A
	.byte $F0
	.word rom_931A
	.byte $30, $86, $32, $98, $2D, $86, $00
	.byte $F0
	.word rom_931A
	.byte $8C, $2B, $86, $2D, $98, $28, $86, $00
	.byte $F0
	.word rom_931A
	.byte $8C, $2D, $86, $28, $8C, $2B, $92, $2C
	.byte $8C, $2D, $86, $2C, $8C, $2B, $92, $2C
	.byte $B0, $28, $F9, $38, $FA, $39, $F8, $40
	.byte $83, $1F, $21, $23, $24, $26, $28, $29
	.byte $2B, $8C, $00, $00, $F9, $12, $FA, $00
	.byte $F8, $11, $30, $86, $32, $98, $2D, $86
	.byte $00
	.byte $F0
	.word rom_931A
	.byte $8C, $2B, $86, $2D, $98, $28, $86, $00
	.byte $F0
	.word rom_931A
	.byte $8C, $2D, $86, $28, $8C, $2B, $92, $2C
	.byte $8C, $2D, $86, $2C, $8C, $2B, $92, $2C
	.byte $B0, $28
	.byte $F0
	.word rom_931A
	.byte $F6, $05, $F9, $07
	.byte $FA, $05, $F8, $02, $A4, $2D, $8C, $28
	.byte $B0, $2C, $A4, $2D, $8C, $2F, $B0, $28
	.byte $A4, $2D, $8C, $28, $B0, $2C, $A4, $2D
	.byte $8C, $2F, $B0, $28
	.byte $F4
	.word rom_9172
	.byte $FF

; ----------------

; Square 1
rom_921A:
	.byte $F6, $11, $F9, $12, $FA, $00, $F8, $11
	.byte $8C, $00, $00, $00, $00
	.byte $F0
	.word rom_931A
	.byte $F0
	.word rom_931A
	.byte $F0
	.word rom_931A
	.byte $F0
	.word rom_931A
	.byte $F0
	.word rom_931A
	.byte $F0
	.word rom_931A
	.byte $F0
	.word rom_931A
	.byte $F0
	.word rom_931A
	.byte $F0
	.word rom_931A
	.byte $F0
	.word rom_931A
	.byte $F0
	.word rom_931A
	.byte $F0
	.word rom_931A
	.byte $F0
	.word rom_931A
	.byte $F0
	.word rom_931A
	.byte $F0
	.word rom_931A
	.byte $F0
	.word rom_931A
	.byte $F0
	.word rom_931A
	.byte $F0
	.word rom_931A
	.byte $F0
	.word rom_931A
	.byte $F0
	.word rom_931A
	.byte $F6, $11, $F9, $38, $FA, $39, $F8, $40
	.byte $F0
	.word rom_9323
	.byte $F0
	.word rom_9323
	.byte $F0
	.word rom_9323
	.byte $F0
	.word rom_9323
	.byte $F0
	.word rom_9323
	.byte $F0
	.word rom_9323
	.byte $F0
	.word rom_9323
	.byte $F0
	.word rom_9323
	.byte $F4
	.word rom_921A
	.byte $FF

; ----------------

; Triangle
rom_9287:
	.byte $F6, $00, $F9, $00, $FA, $64, $F8, $11
	.byte $F0
	.word rom_9335
	.byte $F0
	.word rom_9335
	.byte $F0
	.word rom_9335
	.byte $F0
	.word rom_9335
	.byte $F0
	.word rom_933B
	.byte $F0
	.word rom_933B
	.byte $F0
	.word rom_933B
	.byte $F0
	.word rom_933B
	.byte $F0
	.word rom_933B
	.byte $86, $28, $28, $24, $28, $00, $24, $2B
	.byte $00, $28, $28, $24, $28, $83, $24, $24
	.byte $24, $24, $2B, $2B, $2B, $2B
	.byte $F0
	.word rom_933B
	.byte $F0
	.word rom_933B
	.byte $86
	.byte $28, $28, $24, $28, $00, $24, $2B, $00
	.byte $8C, $24, $00, $24, $86, $2B, $2B, $28
	.byte $28, $24, $28, $00, $24, $2B, $00, $8C
	.byte $24, $00, $00, $86, $2B, $83, $2B, $2B
	.byte $F9, $07, $FA, $05, $F8, $02, $F6, $0C
	.byte $F0
	.word rom_9350
	.byte $F6, $0B
	.byte $F0
	.word rom_9350
	.byte $F6, $0C
	.byte $F0
	.word rom_9350
	.byte $F6, $10
	.byte $F0
	.word rom_9350
	.byte $F6, $0C
	.byte $F0
	.word rom_9350
	.byte $F6, $0B
	.byte $F0
	.word rom_9350
	.byte $F6, $0C
	.byte $F0
	.word rom_9350
	.byte $F6, $10
	.byte $F0
	.word rom_9350
	.byte $F4
	.word rom_9287
	.byte $FF

; ----------------

; Silent channel
rom_9319:
	.byte $FF

; ----------------

; Segments used by the song above
rom_931A:
	.byte $86, $15, $15, $13, $15, $8C, $00, $00
	.byte $F1
rom_9323:
	.byte $83, $28, $29, $28, $26, $24, $23, $24
	.byte $26, $28, $29, $2B, $29, $28, $29, $2B
	.byte $29, $F1
rom_9335:
	.byte $83, $2B, $2B, $2B, $2B, $F1
rom_933B:
	.byte $86, $26, $26, $24, $26, $00, $24, $2B
	.byte $00, $26, $26, $24, $26, $00, $83, $24
	.byte $26, $86, $2B, $24, $F1
rom_9350:
	.byte $B0, $21, $F1

; ----------------

mus_9353:
	.byte $00
	.word rom_9172
	.byte $01
	.word rom_921A
	.byte $02
	.word rom_9287
	.byte $03
	.word rom_9319
	.byte $04
	.word rom_9319
	.byte $FF

; -----------------------------------------------------------------------------

; Square 0
rom_9363:
	.byte $F5, $02, $F6, $0C, $F9, $12, $FA, $00
	.byte $F8, $11, $86, $2D, $2D, $2D, $2D, $2D
	.byte $2D, $2D, $2D, $30, $30, $30, $83, $32
	.byte $30, $8C, $32, $2B, $86, $2D, $2D, $2D
	.byte $2D, $2D, $2D, $2D, $2D, $30, $30, $30
	.byte $83, $32, $30, $8C, $32, $2B, $F9, $07
	.byte $FA, $05, $F8, $03, $86, $34, $35, $34
	.byte $32, $B0, $34, $8C, $30, $32, $98, $34
	.byte $30, $2D, $8C, $28, $86, $2D, $34, $B0
	.byte $32, $8C, $00, $00, $30, $2D, $B0, $2F
	.byte $F9, $12, $FA, $00, $F8, $11, $86, $2D
	.byte $30, $37, $98, $39, $86, $00, $F9, $04
	.byte $FA, $05, $F8, $02, $34, $35, $34, $32
	.byte $B0, $34, $8C, $30, $32, $98, $34, $30
	.byte $2D, $8C, $28, $86, $2D, $34, $B0, $32
	.byte $8C, $00, $00, $30, $32, $34, $86, $39
	.byte $98, $2D, $86, $00, $F9, $12, $FA, $00
	.byte $F8, $11, $30, $28, $2F, $28, $2D, $28
	.byte $2C, $28
	.byte $F4
	.word rom_9363
	.byte $FF
; ----------------

; Square 1
rom_93F9:
	.byte $F6, $00, $F9, $12, $FA, $00, $F8, $11
	.byte $F6, $00
	.byte $F0
	.word rom_948B
	.byte $F0
	.word rom_9496
	.byte $F6, $00
	.byte $F0
	.word rom_948B
	.byte $F0
	.word rom_9496
	.byte $F6, $00
	.byte $F0
	.word rom_948B
	.byte $F0
	.word rom_9496
	.byte $F6, $00
	.byte $F0
	.word rom_948B
	.byte $F0
	.word rom_9496
	.byte $F6, $05
	.byte $F0
	.word rom_948B
	.byte $F0
	.word rom_9496
	.byte $F6, $07
	.byte $F0
	.word rom_9496
	.byte $F0
	.word rom_9496
	.byte $F6, $00
	.byte $F0
	.word rom_948B
	.byte $F0
	.word rom_9496
	.byte $F6, $00
	.byte $F0
	.word rom_948B
	.byte $F0
	.word rom_9496
	.byte $F6, $05
	.byte $F0
	.word rom_948B
	.byte $F0
	.word rom_9496
	.byte $F6, $07
	.byte $F0
	.word rom_9496
	.byte $F0
	.word rom_9496
	.byte $F4
	.word rom_93F9
	.byte $FF
; ----------------

; Triangle
rom_9455:
	.byte $F6, $00, $F9, $00, $FA, $00, $F8, $33
	.byte $F0
	.word rom_94A1
	.byte $F0
	.word rom_94A1
	.byte $F0
	.word rom_94A1
	.byte $F0
	.word rom_94A1
	.byte $F9, $00, $FA, $64, $F8, $11
	.byte $F0
	.word rom_94AB
	.byte $F0
	.word rom_94AB
	.byte $F0
	.word rom_94AB
	.byte $F0
	.word rom_94AB
	.byte $F0
	.word rom_94AB
	.byte $F0
	.word rom_94AB
	.byte $F0
	.word rom_94AB
	.byte $F0
	.word rom_94AB
	.byte $F4
	.word rom_9455
	.byte $FF
; ----------------

; Segments used by the song above
rom_948B:
	.byte $86, $21, $21, $21, $8C, $24, $86, $23
	.byte $8C, $21, $F1
rom_9496:
	.byte $86, $21, $21, $21, $8C, $24, $86, $26
	.byte $8C, $28, $F1
rom_94A1:
	.byte $86, $2D, $2D, $2D, $2D, $2D, $2D, $2D
	.byte $2D, $F1
rom_94AB:
	.byte $8C, $24, $86, $24, $8C, $2B, $86, $24
	.byte $8C, $2B, $86, $24, $83, $24, $24, $86
	.byte $24, $8C, $2B, $86, $24, $8C, $2B, $F1

; ----------------

; Silent channel
rom_94C3:
	.byte $FF

; ----------------

mus_94C4:
	.byte $00
	.word rom_9363
	.byte $01
	.word rom_93F9
	.byte $02
	.word rom_9455
	.byte $03
	.word rom_94C3
	.byte $04
	.word rom_94C3
	.byte $FF

; -----------------------------------------------------------------------------

; Square 0
rom_94D4:
	.byte $F5, $02, $F6, $0E, $F9, $12, $FA, $00
	.byte $F8, $11, $86, $2D, $8C, $2D, $2B, $86
	.byte $29, $8C, $28, $86, $2D, $8C, $2D, $2B
	.byte $86, $2B, $8C, $2D, $86, $2D, $8C, $2D
	.byte $2B, $86, $29, $8C, $28, $98, $2D, $2B
	.byte $F9, $12, $FA, $00, $F8, $11, $86, $15
	.byte $15, $89, $2D, $83, $2F, $86, $30, $2F
	.byte $89, $2B, $83, $28, $86, $2B, $A4, $2D
	.byte $86, $00, $15, $15, $89, $2D, $83, $2F
	.byte $89, $30, $83, $2F, $86, $2D, $2B, $34
	.byte $83, $32, $32, $86, $34, $98, $32, $86
	.byte $00, $15, $15, $89, $2D, $83, $2F, $86
	.byte $30, $2F, $89, $2B, $83, $28, $86, $2B
	.byte $A4, $2D, $86, $00, $11, $11, $89, $2D
	.byte $83, $2F, $89, $30, $83, $2F, $86, $2D
	.byte $2B, $2D, $83, $2B, $2B, $86, $2B, $83
	.byte $28, $26, $98, $24, $86, $34, $83, $35
	.byte $34, $86, $30, $83, $2B, $98, $2D, $83
	.byte $00, $8C, $00, $00, $00, $83, $2D, $89
	.byte $30, $B0, $30, $8C, $00, $00, $00, $00
	.byte $F4
	.word rom_94D4
	.byte $FF
; ----------------

; Square 1
rom_9578:
	.byte $F6, $02, $F9, $12, $FA, $00, $F8, $11
	.byte $86, $21, $24, $2D, $8C, $2B, $86, $29
	.byte $8C, $28, $86, $21, $24, $2D, $8C, $2B
	.byte $86, $2B, $8C, $2D, $86, $21, $24, $2D
	.byte $8C, $2B, $86, $29, $8C, $28, $86, $21
	.byte $24, $2D, $92, $2B, $8C, $29, $86, $2D
	.byte $2D, $8C, $00, $98, $2B, $2D, $8C, $2D
	.byte $2B, $86, $2D, $2D, $8C, $00, $98, $2B
	.byte $24, $8C, $23, $1F, $86, $2D, $2D, $8C
	.byte $00, $98, $2B, $2D, $8C, $2D, $2B, $86
	.byte $29, $29, $8C, $00, $98, $2B, $8C, $24
	.byte $23, $29, $28, $B0, $26, $2B, $2B, $8C
	.byte $00, $00, $00, $00
	.byte $F4
	.word rom_9578
	.byte $FF
; ----------------

; Triangle
rom_95E0:
	.byte $F6, $00, $F9, $00, $FA, $64, $F8, $11
	.byte $86, $24, $00, $2B, $00, $24, $00, $2B
	.byte $2B, $24, $00, $2B, $00, $24, $00, $2B
	.byte $2B, $24, $00, $2B, $00, $24, $00, $2B
	.byte $2B, $24, $00, $2B, $00, $24, $00, $83
	.byte $2B, $2B, $2B, $2B, $86, $24, $24, $8C
	.byte $00, $86, $2B, $00, $24, $00, $24, $24
	.byte $8C, $29, $83, $24, $24, $24, $24, $29
	.byte $86, $2D, $83, $00, $86, $24, $24, $8C
	.byte $00, $86, $2B, $00, $24, $00, $24, $24
	.byte $8C, $29, $83, $24, $24, $24, $24, $29
	.byte $86, $2D, $83, $00, $86, $24, $24, $8C
	.byte $00, $86, $2B, $00, $24, $00, $24, $24
	.byte $8C, $29, $83, $24, $24, $24, $24, $29
	.byte $86, $2D, $83, $00, $86, $24, $24, $8C
	.byte $00, $86, $2B, $00, $24, $00, $24, $24
	.byte $8C, $29, $83, $24, $24, $24, $24, $29
	.byte $86, $2D, $83, $00, $2B, $2B, $2B, $2B
	.byte $29, $29, $29, $29, $28, $28, $28, $28
	.byte $26, $26, $26, $26, $26, $26, $26, $26
	.byte $28, $28, $28, $28, $29, $29, $29, $29
	.byte $2B, $2B, $2B, $2B, $2B, $2B, $2B, $2B
	.byte $29, $29, $29, $29, $28, $28, $28, $28
	.byte $26, $26, $26, $26, $26, $26, $26, $26
	.byte $28, $28, $28, $28, $29, $29, $29, $29
	.byte $2B, $2B, $2B, $2B
	.byte $F4
	.word rom_95E0
	.byte $FF
; ----------------

; Silent channel
rom_96B0:
	.byte $FF

; ----------------

mus_96B1:
	.byte $00
	.word rom_94D4
	.byte $01
	.word rom_9578
	.byte $02
	.word rom_95E0
	.byte $03
	.word rom_96B0
	.byte $04
	.word rom_96B0
	.byte $FF

; -----------------------------------------------------------------------------

; Square 1
rom_96C1:
	.byte $F5, $02, $F6, $01, $F9, $34, $FA, $39
	.byte $F8, $41, $BC, $15, $FF

; ----------------

sfx_96CE:
	.byte $81
	.word rom_96C1
	.byte $FF
	
; -----------------------------------------------------------------------------

; Noise
rom_96D2:
	.byte $F5, $03, $F6, $01, $F9, $34, $FA, $39
	.byte $F8, $46, $A0, $2D, $FF

; ----------------

sfx_96DF:
	.byte $83
	.word rom_96D2
	.byte $FF
	
; -----------------------------------------------------------------------------

; Noise
rom_96E3:
	.byte $F5, $03, $F6, $01, $F9, $1F, $FA, $2B
	.byte $F8, $01, $A0, $2F, $FF

; ----------------

sfx_96F0:
	.byte $83
	.word rom_96E3
	.byte $FF

; -----------------------------------------------------------------------------

; Unused SFX Noise channel
rom_96F4:
	.byte $F5, $03, $F6, $01, $F9, $38, $FA, $39
	.byte $F8, $01, $B2, $17, $FF

; ----------------

; Potentially unused SFX
sfx_9701_unused:
	.byte $83
	.word rom_96F4
	.byte $FF
	
; -----------------------------------------------------------------------------

rom_9705:
	.byte $F5, $03, $F6, $01, $F9, $1F, $FA, $2B
	.byte $F8, $01, $8C, $29, $FF

; ----------------

sfx_9712:
	.byte $83
	.word rom_9705
	.byte $FF
	
; -----------------------------------------------------------------------------

; Square 0
rom_9716:
	.byte $F5, $04, $F6, $00, $F9, $5B, $FA, $39
	.byte $F8, $11, $83, $2D, $30, $95, $39, $FF
; Square 1
rom_9726:
	.byte $F6, $00, $F9, $5B, $FA, $39, $F8, $11
	.byte $81, $00, $83, $2D, $30, $95, $39, $FF

; ----------------

sfx_9736:
	.byte $80
	.word rom_9716
	.byte $81
	.word rom_9726
	.byte $FF
	
; -----------------------------------------------------------------------------

; Square 1
rom_973D:
	.byte $F5, $01, $F6, $11, $F9, $38, $FA, $39
	.byte $F8, $41, $83, $28, $00, $24, $00, $28
	.byte $00, $24, $FF

; ----------------

sfx_9750:
	.byte $81
	.word rom_973D
	.byte $FF
	
; -----------------------------------------------------------------------------

; Square 0
rom_9754:
	.byte $F5, $04, $F6, $00, $F9, $38, $FA, $39
	.byte $F8, $41, $81, $24, $89, $21, $FF
; Square 1
rom_9763:
	.byte $F6, $00, $F9, $38, $FA, $39, $F8, $40
	.byte $81, $00, $24, $89, $21, $FF

; ----------------

sfx_9771:
	.byte $80
	.word rom_9754
	.byte $81
	.word rom_9763
	.byte $FF

; -----------------------------------------------------------------------------

; Square 0
rom_9778:
	.byte $F5, $04, $F6, $00, $F9, $38, $FA, $39
	.byte $F8, $40, $83, $39, $FF

; ----------------

; Cursor movement blip
sfx_9785:
	.byte $80
	.word rom_9778
	.byte $FF

; -----------------------------------------------------------------------------

; Potentially unused SFX noise channel
rom_9789:
	.byte $F5, $03, $F6, $01, $F9, $34, $FA, $39
	.byte $F8, $46, $84, $2F, $FF

; ----------------

; Potentially unused SFX
sfx_9796_unused:
	.byte $83
	.word rom_9789
	.byte $FF

; -----------------------------------------------------------------------------

; Noise
rom_979A:
	.byte $F5, $03, $F6, $01, $F9, $5B, $FA, $5E
	.byte $F8, $5F, $85, $17, $FF

; ----------------


sfx_97A7:
	.byte $83
	.word rom_979A
	.byte $FF

; -----------------------------------------------------------------------------

; Potentially unused
rom_97AB:
	.byte $0B, $79, $7A, $7B
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
	.byte $FF, $08, $00, $08, $FF, $81, $0F, $FF
	.byte $FF

; -----------------------------------------------------------------------------

; As usual, the rest is rubbish (unassembled code)
