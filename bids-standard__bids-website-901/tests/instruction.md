# Issue

**Title:** [ENH] Update Link Checker Logic

## Description

This PR (may) adds some sanity to the link checking process.

- Ignores constantly failing contributors.md and blog posts
- Only checks changed files on pull requests to provide confidence in hitting merge
- Runs monthly and has status badge to compare with current state
- switched workflow to use CLI version of link checker as it has the `--ignore` option



<!-- readthedocs-preview bids-website start -->
----
📚 Documentation preview 📚: https://bids-website--901.org.readthedocs.build/en/901/

<!-- readthedocs-preview bids-website end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f734ccf78684`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.