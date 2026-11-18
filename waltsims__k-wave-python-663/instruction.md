# Issue

**Title:** Release 0.5.0rc1

## Description

<!-- greptile_comment -->

<h3>Greptile Summary</h3>

This PR bumps the version from 0.4.1 to 0.5.0rc1, marking a new release candidate.

- Single line change updating the `__version__` variable in `kwave/__init__.py`
- The version is dynamically read by `pyproject.toml` via hatchling's version path configuration
- Standard release preparation with no code logic changes

<h3>Confidence Score: 5/5</h3>

- This PR is safe to merge with no risk
- Single line version string update with no logic changes, standard release candidate preparation
- No files require special attention

<details><summary><h3>Important Files Changed</h3></summary>

| Filename | Overview |
|----------|----------|
| kwave/__init__.py | Version bump from 0.4.1 to 0.5.0rc1 for release candidate |

</details>

</details>

<sub>Last reviewed commit: 706e1e3</sub>

<!-- greptile_other_comments_section -->

<sub>(4/5) You can add custom instructions or style guidelines for the agent [here](https://app.greptile.com/review/github)!</sub>

<!-- /greptile_comment -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6d1737bc89b7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.