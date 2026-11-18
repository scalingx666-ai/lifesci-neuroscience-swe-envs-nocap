# Issue

**Title:** Refactor CMake to make it easier to follow by modularizing concerns

## Description

I refactored CMakeLists.txt into a set of modules. Each module has a specific concern. Maybe my aging brain can't hold as much in working memory as it used to, but IMO this refactor makes it a lot easier to follow what we're doing with CMake. Indeed, it was necessary to do this refactor before I could make progress on building liblsl as an Apple Framework with code signing and notarization (coming in a future PR) so I really would like this PR merged.

This PR does not change the code. As far as I know, I simply moved things around.

I also added a bunch of #TODOs and questions of things I hope to address to further simplify the CMake scripts.

Let's see what the CI runners have to say...

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b5d521f25268`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.