# Issue

**Title:** docs: hyphenate time-domain in pyproject.toml description

## Description

## Description
This PR fixes the compound adjective hyphenation for `time-domain` in `pyproject.toml`'s description field.

## Details
Hyphenated `time domain` -> `time-domain` to match standard usage across `docs/README.md` and the rest of the documentation.

<!-- greptile_comment -->

<h3>Greptile Summary</h3>

Corrects compound-adjective hyphenation in package metadata.
- Changes “time domain” to “time-domain” in the `pyproject.toml` project description.

<h3>Confidence Score: 5/5</h3>

The PR appears safe to merge.

The change only corrects hyphenation in a valid TOML string and introduces no functional, packaging, or security issue.

<details><summary><h3>Important Files Changed</h3></summary>

| Filename | Overview |
|----------|----------|
| pyproject.toml | Updates one metadata description string without affecting packaging syntax or runtime behavior. |

</details>

<sub>Reviews (1): Last reviewed commit:  | [Re-trigger Greptile](https://app.greptile.com/api/retrigger?id=46779325)</sub>

<!-- /greptile_comment -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `011c8ed3a9f8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.