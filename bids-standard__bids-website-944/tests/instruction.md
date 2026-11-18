# Issue

**Title:** chore: Mark all dependencies dev dependencies

## Description

This is intended to reduce dependabot noise. Dev dependencies are not considered as urgent to upgrade as regular dependencies, and we're publishing a static webpage, not a dynamic package.

I also went ahead and upgraded the lock file with a 1 week cooldown.

<!-- readthedocs-preview bids-website start -->
----
📚 Documentation preview 📚: https://bids-website--944.org.readthedocs.build/en/944/

<!-- readthedocs-preview bids-website end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fde470c018db`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.