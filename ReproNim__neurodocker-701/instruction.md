# Issue

**Title:** Add auto-version query step and push Docker master tag on every build

## Description

The Docker build/push steps referenced steps.auto-version.outputs.version but no step with id auto-version existed, so Docker images were never built. Add the auto-version query step (as in heudiconv) so releases actually trigger Docker pushes. Also restructure so the master tag is built and pushed on every push to master, while latest and version tags are only pushed on actual releases.

I will merge right away since changes only to workflow operating only on master.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `85c295fb4845`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.