# Issue

**Title:** Conda recipe fixes

## Description

- I added `make` to the build requirements.
- For now, I've removed the `MACOSX_DEPLOYMENT_TARGET`, since I'm had trouble using old SDKs with new versions of Xcode.  This means that the mac build will be different depending on the machine we build it with.  But to my knowledge, I'm the only one building the Mac binaries anyway...

<!-- Reviewable:start -->
- - -
This change is [<img src="https://reviewable.io/review_button.svg" height="34" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/janelia-flyem/dvid/396)
<!-- Reviewable:end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `280b45d7ea7e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.