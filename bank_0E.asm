.segment "BANK_0E"
; $C000-$DFFF
.setcpu "6502X"

.feature org_per_seg
.feature pc_assignment

.include "globals.inc"


; -----------------------------------------------------------------------------
.export dmc_raiden

dmc_raiden:
.incbin "audio/raiden_sp10up.dmc"

; ----------------
.export dmc_sonya

dmc_sonya:
.incbin "audio/sonya_sp10up.dmc"

; ----------------
.export dmc_subzero

dmc_subzero:
.incbin "audio/subzero_sp10up.dmc"

; ----------------
.export dmc_scorpion

dmc_scorpion:
.incbin "audio/scorpion_sp10up.dmc"

; ----------------
.export dmc_kano

dmc_kano:
.incbin "audio/kano_sp10up.dmc"

; ----------------
.export dmc_hit

dmc_hit:
.incbin "audio/hit_08.dmc"

; ----------------
.export dmc_mortal

dmc_mortal:
.incbin "audio/mk_1_sp10up.dmc"

; -----------------------------------------------------------------------------
