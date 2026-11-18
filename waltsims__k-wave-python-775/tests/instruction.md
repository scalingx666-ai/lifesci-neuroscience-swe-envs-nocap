# Issue

**Title:** fix(citation): fix author surname spelling typo in CITATION.cff

## Description

## Description
This PR fixes a surname spelling typo in `CITATION.cff`.

## Details
Corrected surname spelling (`Yagubbbayli` $\to$ `Yagubbayli` matching email address `farid.yagubbayli@tum.de`).

<!-- greptile_comment -->

<h3>Greptile Summary</h3>

Corrects citation metadata and improves the repository’s documentation and test helper scripts.
- Fixes Farid Yagubbayli’s surname in `CITATION.cff`.
- Uses an environment-resolved Bash interpreter and normalizes formatting in `make_docs.sh`.
- Forwards command-line arguments from `run_tests.sh` to pytest.

<h3>Confidence Score: 5/5</h3>

The PR appears safe to merge, with no actionable defects identified in the changed files.

The citation correction is schema-preserving, the updated Bash shebang remains valid, and quoted argument forwarding preserves caller-supplied pytest arguments as intended.

<details><summary><h3>Important Files Changed</h3></summary>

| Filename | Overview |
|----------|----------|
| CITATION.cff | Corrects an author surname typo without altering the citation schema. |
| make_docs.sh | Replaces the fixed Bash path with an environment-resolved shebang and cleans up formatting. |
| run_tests.sh | Safely forwards all supplied test arguments to pytest inside the Docker container. |

</details>

<sub>Reviews (1): Last reviewed commit:  | [Re-trigger Greptile](https://app.greptile.com/api/retrigger?id=46963404)</sub>

<!-- /greptile_comment -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aff369e9801c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.