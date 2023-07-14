.segment "BANK_0E"
; $C000-$DFFF
.setcpu "6502X"

.feature org_per_seg
.feature pc_assignment

.include "globals.inc"


; -----------------------------------------------------------------------------
.export dmc_rayden

dmc_rayden:
.incbin "audio/rayden.dmc"

; ----------------
.export dmc_sonya

dmc_sonya:
.incbin "audio/sonya.dmc"

; ----------------
.export dmc_subzero

dmc_subzero:
.incbin "audio/subzero.dmc"

; ----------------
.export dmc_skorpion

dmc_skorpion:
.incbin "audio/skorpion.dmc"

; ----------------
.export dmc_kano

dmc_kano:
.incbin "audio/kano.dmc"

; -----------------------------------------------------------------------------

.byte $00, $00, $00, $00, $00, $00, $00, $00
