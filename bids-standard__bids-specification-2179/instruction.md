# Issue

**Title:** [ENH] Clarify that task label is not required to derive from TaskName

## Description

Following up on decision made in Copenhagen. This "is" was interpreted by some to be a requirement, but this has never been validated, would be breaking to turn into an error, and is impractical to encode in the schema. Rather than contort ourselves to devise a check, it makes more sense to use RFC 2119 language to make clear that this is an optional convention, not a requirement.

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `db1c0871057f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.