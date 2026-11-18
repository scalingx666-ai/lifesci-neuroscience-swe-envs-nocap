# Issue

**Title:** Fix container package page to recommend :latest tag

## Description

## Summary
- Disable `docker/metadata-action`'s automatic `:latest` tagging (`flavor: latest=false`)
- After every build, re-tag the latest GitHub release image as `:latest` using `docker buildx imagetools create` (server-side retag, no layer transfer)
- This ensures `:latest` is always the most recently pushed tag on the ghcr.io package page, so it gets recommended instead of `:master`

## Test plan
- [ ] Merge and verify the next master push triggers the workflow successfully
- [ ] Check https://github.com/CoBrALab/RABIES/pkgs/container/rabies shows `:latest` as the recommended tag
- [ ] Verify `:latest` points to the same image digest as the current release tag (`0.6.0`)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

<!-- This is an auto-generated comment: release notes by coderabbit.ai -->
## Summary by CodeRabbit

* **Chores**
  * Improved Docker image tagging so the :latest tag is applied only for actual releases and reliably points to the most recent release, improving registry discoverability.
  * Prevented automatic :latest tagging for pull-request events to avoid accidental overwrites of the latest image.
<!-- end of auto-generated comment: release notes by coderabbit.ai -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `97e72517fa3b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.