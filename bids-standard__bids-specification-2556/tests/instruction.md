# Issue

**Title:** [SCHEMA] Use the full participant list in ParticipantIDMismatch

## Description

`ParticipantIDMismatch` reads `columns.participant_id`, which the validator truncates to `--max-rows` (1000 by default), so any dataset with more than 1000 subjects gets a false `PARTICIPANT_ID_MISMATCH`. This switches it to `dataset.subjects.participant_id`, which is always loaded in full, as suggested in bids-standard/bids-validator#454.

Tested with bids-validator main and an exported schema on a 1100-subject dataset: the false error goes away, and removing a subject from participants.tsv still raises it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `db4fd884a558`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.