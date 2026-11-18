# Issue

**Title:** Fix the bug for computing quality metrics in spikesorting v0

## Description

# Description

I added a bug fix for `spikesorting.v0.spikesorting_curation.QualityMetrics._compute_metric` described in #1202 to make sure `num_spikes` is included when `num_spikes < min_spikes`.

# Checklist:

- [X] No. This PR should be accompanied by a release: no
- [X] N/a If release, I have updated the `CITATION.cff`
- [X] No. This PR makes edits to table definitions: (yes/no)
- [X] N/a If table edits, I have included an `alter` snippet for release notes.
- [X] N/a If this PR makes changes to position, I ran the relevant tests locally.
- [ ] I have updated the `CHANGELOG.md` with PR number and description.
- [X] N/a I have added/edited docs/notebooks to reflect the changes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f92b0ffe1851`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.