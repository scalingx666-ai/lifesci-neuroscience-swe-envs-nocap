# Issue

**Title:** Accept an explicit subject-label mapping in nemar_subject_template

## Description

### Accept an explicit subject-label mapping in nemar_subject_template (#1098)

BIDS subject labels can be any alphanumeric string (sub-zdvm, sub-A01),
which no format template can produce. nemar_subject_template now also
accepts a {moabb_subject: bids_label} mapping; string templates and None
behave exactly as before. A mapping without an entry for the subject
raises RuntimeError, like a template that cannot format it.

Lioi2020_XP2 replaces its _nemar_subject override (non-contiguous
xp2NN labels) with the mapping; labels are unchanged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6da2e9423d22`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.