# Issue

**Title:** fix(bst): Address deprecation warnings

## Description

This PR does some long-overdue maintenance, setting up tox and using it for github actions, so we can use lockfiles and minimum dependencies.

I have set up tox to allow pre-release tests, but I did not set up a CI job.

This PR also reduces dependabot to quarterly frequency, as monthly is really not necessary for our uses.

Finally, this PR drops support for the end-of-life Python 3.9 and tests on Python 3.14. Given that the last two BIDS releases were post-3.9-EOL, I'm content to do this in the maintenance branch.

This PR targets the `maint/1.11.1` branch so that we can release bidsschematools with these fixes. They should have no impact on the specification.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4de9eef23fc6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.