# Issue

**Title:** Reinstate brainmapper ci check

## Description

## Minor metadata updates

- Drop python 3.8 official support
- Point README to brainmapper information, rather than old cellfinder-CLI

## Reinstate the CI check for `brainmapper`

For the release of v1.0.0 we had to suppress the check on the `brainmapper` command-line interface, since we had a circular dependency:

Workflows needs cellfinder v1.0.0 on PyPI to download it and test-run brainmapper -> cellfinder v1.0.0 can't check that brainmapper works since it needs the name available in workflows.

This PR reinstates the command-line tool check in our CI workflow.
This is something of a code duplication (ideally the CI in this repo would call some CI in workflows) but it safeguards us for now, and we can always set this up ourselves after the migration is complete.

## Won't work until brainglobe-workflows is released with brainmapper available.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2e8e528fd743`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.