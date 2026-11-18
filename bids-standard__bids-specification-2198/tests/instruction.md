# Issue

**Title:** [ENH][BEP032] Updates

## Description

Contributes to #1705 

* 4395dcf3 2025-09-04 | Probe interface exaple file tree
* 2f3069f9 2025-09-04 | Minor change to the default probe relative coordinate system
* cf3e7a95 2025-09-04 | Rewrote the coordsystem JSON and photo section to align with ieeg but adopt to animal electrophysiology
* 198e3655 2025-09-04 | Added entities for the photo specific to microephys
* cfd64cc4 2025-09-04 | Added rules to 1) override rule for coorsystem to be present for electrode.tsv 2) If coorsystem present, corresponding electrode.tsv must be present 3. Match the space between corresponding coordystem and electrodes files
* b84bd493 2025-09-04 | Add coordinate system metadata fields for microephys
* 649a2ce9 2025-09-04 | Adds space entity for microephys electrodes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `80e91191193c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.