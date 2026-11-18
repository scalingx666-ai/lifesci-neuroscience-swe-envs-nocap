# Issue

**Title:** Add DeidentificationMethod and DeidentificationMethodCodeSequence to json

## Description

This parallels my PR to bids-specification:



The goal is to add DeidentificationMethod and DeidentificationMethodCodeSequence to json, so that users downstream have a chance to be informed of whether some tags were scrubbed and/or if any de-facing or other image scrubbing was applied.

From our email discussion, I understand that you will probably not merge this until bids-specification merges theirs. I thought we could iterate on this, if needed, in the meantime.

Thanks for your consideration,
Chris Schwarz
Mayo Clinic

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ae1cb2917de7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.