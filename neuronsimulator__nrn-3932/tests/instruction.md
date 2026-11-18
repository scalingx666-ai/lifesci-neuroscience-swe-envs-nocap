# Issue

**Title:** Limit the size of CoreNEURON dataset version and mechanism tokens.

## Description

Deus Rex &lt;deusrex.ai&gt; reported that bbcore_mech.dat, globals.dat, and files.dat copied those tokens into fixed stack buffers with no width limit. A longer token overwrote the frame. The four reads (two from bbcore_mech.dat and one each from globals.dat and files.dat) now stop at the buffer and abort when the token does not fit.

A dataset is a directory the operator chose, written by NEURON and loaded by nrniv-core. The change stops four text fields from writing past their buffers, and an overlong token aborts. The counts that size the binary records, those records, and the user's HOC, Python, and MOD VERBATIM are outside this fix.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9004127638da`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.