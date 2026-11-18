# Issue

**Title:** [MNT] - Fix management of check modes

## Description

Addresses #292 - updates process for managing check modes, and updates extracting of sub-objects to propagate modes

This also integrates updates from @SM-Figueroa, merged in #294, which updated some element of run mode management, including adding the `set_run_modes` method. I also updated something that @SM-Figueroa explored but didn't add directly, which is using the `FOOOFRunModes` object (it didn't initially work due to NamedTuples not accepting leading underscores, but the object itself doesn't need the underscores, it can be used without them, which is how I added it. 

@mwprestonjr - for wtv reason I can't seem to tag you in for a proper review - but does this look good for addressing what you brought up in #292

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `209c57df15cb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.