# Issue

**Title:** Stop publishing nightly and master container images

## Description

## Summary

- Remove the nightly cron and the push-on-master trigger from the Docker workflow. Only semver tag pushes publish to ghcr.io now.
- Guard the image push on tag refs, so a manual `workflow_dispatch` on a branch builds but does not publish a branch-named image.
- PR builds and the `:latest` retag of the newest release are unchanged.

The existing `nightly` and `master` images on ghcr.io are being removed separately. Until this merges, the cron on master keeps running and can recreate them.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01JbjzuSab2kesaLAq9wbw2B

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `139faa335244`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.