# Issue

**Title:** FIX: Improve FreeSurfer ID predictability

## Description

The intent after #3495 was encode as much information on how the anatomical template was formed into the FreeSurfer subject ID, but this introduced problems where the resulting FS ID could not be reused across a few cases:
- A new session was added after a previous run.
- Func-only processing leveraging precomputed derivatives from another session.

Starting this draft to think on how to cleanly address this in the future series.

Example 1
----------
Assume we have sub-01 with a single session, `pre`:

| --subject-anat-reference | FS ID (<25.2.x) | FS ID (25.2.x) | FS ID (26.0.x) |
|---------------------------|----------------|--|-------------------|
| sessionwise | n/a | sub-01_ses-pre | sub-01_ses-pre |
| first-lex | sub-01 | sub-01_ses-pre | sub-01 |
| unbiased | sub-01 | sub-01_ses-pre | sub-01 |

Now if a `post` session was added, the `post`'s anatomical will be used in `first-lex`.

| --subject-anat-reference | FS ID (<25.2.x) | FS ID (25.2.x) | FS ID (26.0.x) |
|---------------------------|----------------|--|-------------------|
| sessionwise | n/a | sub-01_ses-pre, sub-01_ses-post | sub-01_ses-pre, sub-01_ses-post |
| first-lex | sub-01 | sub-01_ses-post+pre | ? |
| unbiased | sub-01 | sub-01_ses-post+pre | ? |

IMO, sub-01 is misleading for both `first-lex` and `unbiased`, and only becomes hazier as additional sessions are added. Perhaps instead of changing the ID, some metadata (Sources) can be tied directly to the FreeSurfer subjects dir.

Example 2
----------

sub-Z has one `anat` and many `funcX` sessions. `anat` was processed with `--anat-only` and will be reused via `--derivatives`

| --subject-anat-reference | FS ID (<25.2.x) | FS ID (25.2.x) | FS ID (26.0.x) |
|---------------------------|----------------|--|-------------------|
| sessionwise | n/a | func session, no anat found | n/a |
| first-lex | sub-Z | sub-Z_anat+func1+.. | sub-Z |
| unbiased | sub-Z | sub-Z_anat+func1+.. | sub-Z |


Suggestions and additional examples are welcome and appreciated.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e679b51d7ebb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.