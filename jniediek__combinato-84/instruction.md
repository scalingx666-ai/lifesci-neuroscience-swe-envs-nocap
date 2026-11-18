# Issue

**Title:** Implemented align-timestamps and do_clean as command-line flags

## Description

This pull request introduces two new command-line flags (--align-timestamps and --do-clean) to the Combinato command css-extract. These flags enable the following:

    --align-timestamps: Align timestamps to the peaks of extracted spikes.
    --do-clean: Remove spikes with unexpected maxima.

These changes address issue .

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `190251cc09ee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.