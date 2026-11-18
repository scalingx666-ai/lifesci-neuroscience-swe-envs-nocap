# Issue

**Title:** [SCHEMA] Fix selectors that keep AGE_89 and PHENOTYPE_SUBJECTS_MISSING from running

## Description

Two checks have selectors that can never match, so they never run:

- `CheckAge89` (`AGE_89`) uses `path == 'participants.tsv'`. Paths in the context start with a slash (`/participants.tsv`, as in `ParticipantIDMismatch`), so the selector is always false. It has been written this way since the check was added in d4a2f390.
- `PhenotypeSubjectsMissing` (`PHENOTYPE_SUBJECTS_MISSING`) uses `suffix == '.tsv'`, but `.tsv` is the extension. This came in with the move to per-file phenotype checks in #2107.

This changes them to `path == '/participants.tsv'` and `extension == '.tsv'`. I also grepped the rules for other `path ==` values without a leading slash and `suffix ==` values with a dot and found none.

How I checked it, with bids-validator main (7a455c2) and a small dataset (10 subjects, the last one aged 95 in participants.tsv, and a `phenotype/survey.tsv` that lists one participant not in participants.tsv):

| Schema | AGE_89 | PHENOTYPE_SUBJECTS_MISSING |
|---|---|---|
| bundled schema (1.2.7) | not raised | not raised |
| exported from this branch (`bst export`) | warning on `/participants.tsv` | error on `/phenotype/survey.tsv` |

The same dataset without those two problems gets neither issue with the new schema. For `age`, values of `45`, `89+`, `n/a` and `88.9` do not warn and `89` does.

Since both checks start running again, I also validated all 108 datasets in bids-examples (the submodule in bids-validator's tests) with the bundled schema and with the schema exported from this branch: none of them gets an AGE_89 or PHENOTYPE_SUBJECTS_MISSING with either.

`tools/schemacode` tests pass with the CI flags (`pytest --doctest-modules -Werror`: 91 passed, 1 skipped, same as master), and pre-commit passes on the changed files.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9a8463f9ee6d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.