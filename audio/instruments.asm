; ------------------------------------------------------------------------------

tbl_vol_env_ptrs:
	.word @vol_env_00
	.word @vol_env_01
	.word @vol_env_02
	.word @vol_env_03
	.word @vol_env_04
	.word @vol_env_05
	.word @vol_env_06
	.word @vol_env_07
	.word @vol_env_08
	.word @vol_env_09
	.word @vol_env_0A
	.word @vol_env_0B
	.word @vol_env_0C
	.word @vol_env_0D
	.word @vol_env_0E
	.word @vol_env_0F
	.word @vol_env_10
	.word @vol_env_11
	.word @vol_env_12
	.word @vol_env_13
	.word @vol_env_14
	.word @vol_env_15
	.word @vol_env_16
	.word @vol_env_17
	.word @vol_env_18
	.word @vol_env_19
	.word @vol_env_1A
	.word @vol_env_1B
	.word @vol_env_1C
	.word @vol_env_1D
	.word @vol_env_1E
	.word @vol_env_1F

; -----------------

	@vol_env_00:
	.byte $01, $04, $01, $02, $02, $01, $01, $00
	.byte $FF, $00

; -----------------

	@vol_env_01:
	.byte $01, $07, $02, $04, $03, $03, $03, $02
	.byte $04, $01, $01, $00, $FF, $00

; -----------------

	@vol_env_02:
	.byte $01, $07, $03, $02, $01, $07, $03, $02
	.byte $02, $01, $01, $00, $FF, $00

; -----------------

	@vol_env_03:
	.byte $01, $07, $01, $04, $03, $03, $04, $02
	.byte $04, $01, $01, $00, $FF, $00

; -----------------

	@vol_env_04:
	.byte $01, $03, $01, $02, $02, $01, $01, $00
	.byte $FF, $00

; -----------------

	@vol_env_05:
	.byte $01, $05, $03, $06, $04, $05, $08, $04
	.byte $0E, $03, $0E, $02, $0E, $01, $01, $00
	.byte $FF, $00

; -----------------

	@vol_env_06:
	.byte $01, $02, $06, $03, $0C, $02, $0E, $01
	.byte $01, $00, $FF, $00

; -----------------

	@vol_env_07:
	.byte $01, $06, $06, $07, $0E, $06, $0E, $05
	.byte $0E, $04, $0D, $03, $01, $02, $FF, $00

; -----------------

	@vol_env_08:
	.byte $01, $08, $01, $04, $01, $03, $02, $02
	.byte $03, $01, $01, $00, $FF, $00

; -----------------

	@vol_env_09:
	.byte $01, $06, $01, $05, $01, $04, $01, $03
	.byte $02, $02, $02, $01, $01, $00, $01, $03
	.byte $01, $02, $02, $01, $01, $00, $FF, $00

; -----------------

	@vol_env_0A:
	.byte $01, $03, $01, $02, $02, $01, $05, $00
	.byte $02, $01, $03, $00, $FF, $00

; -----------------

	@vol_env_0B:
	.byte $01, $06, $01, $04, $01, $02, $02, $01
	.byte $01, $00, $FF, $00

; -----------------

	@vol_env_0C:
	.byte $01, $05, $03, $03, $03, $02, $04, $01
	.byte $01, $00, $FF, $00

; -----------------

	@vol_env_0D:
	.byte $01, $01, $02, $02, $03, $03, $0A, $04
	.byte $11, $03, $08, $02, $08, $01, $01, $00
	.byte $FF, $00

; -----------------

	@vol_env_0E:
	.byte $01, $07, $02, $04, $02, $03, $02, $02
	.byte $04, $01, $01, $00, $FF, $00

; -----------------

	@vol_env_0F:
	.byte $01, $04, $01, $08, $01, $06, $01, $05
	.byte $02, $04, $04, $03, $01, $02, $FF, $00

; -----------------

	@vol_env_10:
	.byte $01, $04, $01, $08, $01, $06, $01, $05
	.byte $02, $04, $01, $08, $01, $06, $01, $05
	.byte $02, $04, $04, $03, $01, $02, $FF, $00

; -----------------

	@vol_env_11:
	.byte $01, $03, $02, $05, $03, $06, $0A, $05
	.byte $0A, $04, $15, $03, $01, $02, $FF, $00

; -----------------

	@vol_env_12:
	.byte $01, $02, $01, $04, $01, $03, $03, $02
	.byte $04, $01, $01, $00, $FF, $00

; -----------------

	@vol_env_13:
	.byte $01, $02, $01, $03, $01, $04, $01, $03
	.byte $02, $02, $01, $03, $01, $04, $01, $03
	.byte $02, $02, $04, $01, $01, $00, $FF, $00

; -----------------

	@vol_env_14:
	.byte $01, $01, $02, $02, $03, $03, $09, $02
	.byte $01, $01, $FF, $00

; -----------------

	@vol_env_15:
	.byte $01, $07, $02, $03, $02, $02, $03, $01
	.byte $01, $00, $FF, $00

; -----------------

	@vol_env_16:
	.byte $02, $06, $02, $03, $02, $02, $04, $01
	.byte $01, $00, $FF, $00

; -----------------

	@vol_env_17:
	.byte $01, $05, $02, $03, $04, $02, $06, $01
	.byte $01, $00, $FF, $00

; -----------------

	@vol_env_18:
	.byte $01, $04, $01, $06, $08, $07, $01, $06
	.byte $FF, $00

; -----------------

	@vol_env_19:
	.byte $01, $01, $0C, $03, $01, $02, $FF, $00

; -----------------

	@vol_env_1A:
	.byte $01, $03, $04, $05, $0A, $04, $0D, $03
	.byte $17, $02, $01, $01, $FF, $00

; -----------------

	@vol_env_1B:
	.byte $01, $04, $04, $05, $06, $04, $0D, $03
	.byte $0D, $02, $01, $01, $FF, $00

; -----------------

	@vol_env_1C:
	.byte $01, $06, $01, $08, $01, $04, $01, $02
	.byte $03, $01, $01, $00, $FF, $00

; -----------------

	@vol_env_1D:
	.byte $01, $06, $01, $05, $01, $04, $01, $03
	.byte $01, $06, $01, $05, $01, $04, $01, $03
	.byte $02, $02, $02, $01, $01, $00, $01, $03
	.byte $01, $02, $02, $01, $01, $00, $FF, $00

; -----------------

	@vol_env_1E:
	.byte $01, $03, $01, $02, $02, $01, $01, $03
	.byte $01, $02, $02, $01, $05, $00, $02, $01
	.byte $03, $00, $FF, $00

; -----------------

	@vol_env_1F:
	.byte $01, $05, $02, $02, $03, $01, $01, $00
	.byte $FF, $00

; ------------------------------------------------------------------------------

tbl_arp_ptrs:
	.word @arp_00
	.word @arp_01
	.word @arp_02
	.word @arp_03
	.word @arp_04
	.word @arp_05
	.word @arp_06
	.word @arp_07
	.word @arp_08
	.word @arp_09
	.word @arp_0A

; -----------------

	@arp_00:
	.byte $01, $24, $01, $21, $01, $1E, $01, $1B
	.byte $01, $18, $FF, $00

; -----------------

	@arp_01:
	.byte $01, $2D, $01, $2B, $FF, $00

; -----------------

	@arp_02:
	.byte $01, $00, $01, $04, $FF, $00

; -----------------

	@arp_03:
	.byte $01, $00, $01, $01, $01, $02, $FF, $00

; -----------------

	@arp_04:
	.byte $01, $00, $01, $01, $02, $02, $01, $00
	.byte $01, $01, $01, $02, $FF, $00

; -----------------

	@arp_05:
	.byte $01, $00, $01, $FF, $FF, $00

; -----------------

	@arp_06:
	.byte $01, $00, $01, $02, $FF, $00

; -----------------

	@arp_07:
	.byte $01, $00, $01, $02, $FF, $00

; -----------------

	@arp_08:
	.byte $01, $06, $01, $00, $FF, $00

; -----------------

	@arp_09:
	.byte $02, $00, $01, $FD, $FF, $00

; -----------------

	@arp_0A:
	.byte $01, $00, $01, $05, $FF, $00

; ------------------------------------------------------------------------------

tbl_pitch_env_ptrs:
	.word @pitch_env_00
	.word @pitch_env_01
	.word @pitch_env_02
	.word @pitch_env_03
	.word @pitch_env_04

; -----------------

	@pitch_env_00:
	.byte $02, $00, $01, $01, $01, $00, $01, $FF
	.byte $02, $00, $02, $00, $02, $FF, $02, $00
	.byte $02, $01, $FF, $FC

; -----------------

	@pitch_env_01:
	.byte $01, $01, $FF, $00

; -----------------

	@pitch_env_02:
	.byte $0A, $00, $02, $FF, $04, $FE, $02, $FF
	.byte $02, $00, $02, $01, $04, $02, $02, $01
	.byte $02, $00, $FF, $F8

; -----------------

	@pitch_env_03:
	.byte $01, $00, $01, $FE, $FF, $00

; -----------------

	@pitch_env_04:
	.byte $0A, $00, $01, $FF, $03, $00, $01, $01
	.byte $03, $00, $01, $01, $03, $00, $01, $FF
	.byte $03, $00, $FF, $F8

tbl_duty_env_ptrs:
	.word @duty_env_00
	.word @duty_env_01
	.word @duty_env_02
	.word @duty_env_03
	.word @duty_env_04
	.word @duty_env_05
	.word @duty_env_06
	.word @duty_env_07
	.word @duty_env_08
	.word @duty_env_09

; -----------------

	@duty_env_00:
	.byte $01, $00, $01, $01, $FF, $00

; -----------------

	@duty_env_01:
	.byte $01, $00, $01, $01, $FF, $00

; -----------------

	@duty_env_02:
	.byte $01, $00, $FF, $00

; -----------------

	@duty_env_03:
	.byte $01, $01, $01, $02, $FF, $00

; -----------------

	@duty_env_04:
	.byte $02, $02, $01, $03, $FF, $00

; -----------------

	@duty_env_05:
	.byte $02, $01, $03, $02, $02, $01, $01, $02
	.byte $FF, $00

; -----------------

	@duty_env_06:
	.byte $02, $01, $01, $02, $FF, $00

; -----------------

	@duty_env_07:
	.byte $01, $01, $01, $02, $FF, $00

; -----------------

	@duty_env_08:
	.byte $01, $00, $01, $01, $FF, $00

; -----------------

	@duty_env_09:
	.byte $01, $00, $FF, $00
