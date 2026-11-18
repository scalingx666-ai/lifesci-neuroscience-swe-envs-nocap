# Issue

**Title:** BEP032: Relax many levels to optional

## Description

@ree-gupta @bendichter These are my suggestions for what can/should be relaxed in terms of 'how easy' things are to extract from NWB

Note that for many of these fields, there might be a generic place in NWB to write some information but it is nearly always free-text strings that cannot be reliably parsed into individual BIDS fields. A fully automated conversion tool could not set those fields, but an interactive agent such as the meditor could likely parse the text and provide guesses to matching fields, so I would suggest that being a post-organization enhancement for data contributors

An extension or core modification would be needed to completely 'harmonize' the two (not that I am convinced that would entirely be worth it, given we can just treat the BIDS metadata as a ground truth)

cc @rwblair @effigies

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7537d11dcbae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.