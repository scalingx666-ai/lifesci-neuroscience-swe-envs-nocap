# Issue

**Title:** fix(scripts): pass arguments to pytest in run_tests.sh

## Description

## Description
This PR allows passing CLI arguments to `pytest` when running `run_tests.sh`.

## Details
Updated script execution line (`pytest` $\to$ `pytest "$@"`) to forward options (such as specific test file paths or markers).

<!-- greptile_comment -->

<h3>Greptile Summary</h3>

Updates local helper scripts:
- Forwards all command-line arguments from `run_tests.sh` to pytest while preserving argument boundaries.
- Standardizes the `make_docs.sh` shebang and whitespace.

<h3>Confidence Score: 5/5</h3>

The PR appears safe to merge with no actionable defects identified.

The pytest arguments remain individually quoted and are placed correctly after the container command, while the documentation script changes do not alter its build command.

<details><summary><h3>Important Files Changed</h3></summary>

| Filename | Overview |
|----------|----------|
| run_tests.sh | Correctly forwards caller arguments to pytest inside the Docker container using quoted `"$@"`. |
| make_docs.sh | Standardizes the Bash shebang and removes insignificant whitespace without changing documentation-build behavior. |

</details>

<sub>Reviews (1): Last reviewed commit:  | [Re-trigger Greptile](https://app.greptile.com/api/retrigger?id=46963358)</sub>

<!-- /greptile_comment -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aff369e9801c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.