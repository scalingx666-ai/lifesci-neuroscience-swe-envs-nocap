# Issue

**Title:** Add cat35 categorical palette (BSD-compatible substitute for fs_colours2 from #91)

## Description

Resolves the last unmerged piece of #91.

## Why a substitute, not the original

The original \`fs_colours2\` array is a verbatim copy of FreeSurfer's parcellation color LUT. FreeSurfer is licensed for **non-commercial use only**, which is incompatible with BrainSpace's BSD-3 license. Shipping those exact RGB tuples would create a license-mismatch downstream.

## What this is

A 35-entry palette named \`cat35\`:
- Same shape as the original (\`(35, 4)\` uint8 RGBA), so it's a drop-in replacement for any code that wanted a Desikan-Killiany-style 35-color palette (34 cortical labels + 1 unknown/medial-wall slot).
- Built **programmatically** from matplotlib's \`tab20\` + \`tab20b\` qualitative colormaps (PSF/BSD-compatible), with a leading black row for the unknown slot.
- Construction lives in \`_build_cat35()\` so the colors are auditable rather than hand-listed.

## Test plan
- [x] \`pytest brainspace/tests/test_colormaps.py\` → 4 passed (registration, shape, opaque-alpha, leading-black, all-distinct).
- [x] Full suite still green.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `54a99f5d6baa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.