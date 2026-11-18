# Issue

**Title:** chore: Sync BEP information with spec CITATION.cff

## Description

Down to 4 missing citations:

```
󰅂 uv run tools/ci/validate_people.py | grep '^0|NOT|no email' | grep '^ ' -B1
    13-	032 Microelectrode electrophysiology
    14:	      no email in specification/CITATION.cff.
    15:	    NOT FOUND Andrew Davison
--
    28-	045 Peripheral Physiological Recordings
    29:	    NOT FOUND Mary Miedema
    30:	    NOT FOUND Stefano Moia
    31:	    NOT FOUND Sourav Kulkarni
```

I believe these folks are:

@apdavison @m-miedema @smoia @Sourav-Kulkarni

Also @lzehl is missing an email in the main spec CITATION.cff, but I relaxed the check to only be an error if there are no BEP leads with emails.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `adbdcfb5874f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.