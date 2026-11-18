# Issue

**Title:** [INFRA] Adjust DockerHub publication workflow

## Description

. Hopefully this will help.

Changes proposed in this pull request:

- Create a new GitHub workflow to publish to DockerHub on release, in addition to the one that publishes the `latest` tag.
- Change when PyPi is published. This won't be a problem generally, but if you work on a release draft before you actually publish the release, it may not push to PyPi when you _do_ publish the release as-is. We found that out with `tedana`.
- Simplify the release process documentation. You shouldn't have to do much locally, since you can create the release tag and the release itself in the same act on the GitHub website.

I also think you could remove `builddocker.sh` and `dockerbuild/`, but I didn't include that in this PR in case you have reasons for keeping both that I don't know about.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `91ed1c614d4d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.