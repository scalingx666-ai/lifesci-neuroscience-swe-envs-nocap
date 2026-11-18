# Issue

**Title:** Maintenance: drop the container build trigger from the release workflow

## Description

The release workflow no longer triggers the container build in spm-docker. That repository now checks for new releases itself (spm/spm-docker#14).

## Why

- The trigger needed a personal access token for spm-docker. It failed for 26.10 ("Bad credentials") and for 26.10.01 ("Resource not accessible by personal access token"), so neither release has container images.
- The trigger was the last step of the Linux build job. Its failure turned the job red and skipped "Test Released Standalone" for both releases.

## Changes

- `release.yml`: the two trigger steps are removed.
- `dependabot.yml`: the ignore entry for the action that sent the trigger is removed.

## After merging

- The secret `PAT_TOKEN_SPM_DOCKER` is unused and can be deleted.
- #179 is obsolete, as the check in spm-docker builds pre-releases as well.
- This does not change 26.10.01: a tag runs the workflow as it was at the tag. Its standalones can be tested by running "Test SPM Standalone" by hand with source `release` and tag `26.10.01`.

Merge spm/spm-docker#14 first. Otherwise a release in between gets no container images on its own.

## Test plan

- [x] The workflow file parses, and nothing else uses the variables the removed steps set
- [ ] Next release or candidate: the Linux build job is green, "Test Released Standalone" runs, and the images appear in spm-docker within about three hours

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `24dc599d3eef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.