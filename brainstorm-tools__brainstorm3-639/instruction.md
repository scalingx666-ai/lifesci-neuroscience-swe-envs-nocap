# Issue

**Title:** Renaming Biosemicaps to 10-10 EEG system

## Description

## Description
Process and context menu to rename EEG channels from the BioSemi naming system to the standard 10-10 system. Renaming only happens for 16-, 32- and 64-electrode caps as these have a one to one correspondence. See [BioSemi caps documentation](https://www.biosemi.com/headcap.htm).

Renaming happens if:
 - There are EEG channels, AND
 - Current channels names correspond to BioSemi style: A1...A32, B1...B32 and so on
 - All EEG channels make up a Biosemi cap. No missing or extra EEG channels

Context menu, only appears for Channel file with `BDF` in their names.

## Result:

| Before  | After |
|--------|-------|
| ![image](https://github.com/brainstorm-tools/brainstorm3/assets/8238803/d43102ae-5fa0-4d02-96ec-78bb983546d1) | ![image](https://github.com/brainstorm-tools/brainstorm3/assets/8238803/9786bb7e-ed4d-440d-8e4e-137a16bec73d) |

Edited by @rcassani

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fe2e5bad1b21`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.