# Issue

**Title:** Improve use of npm, especially with travis

## Description

If we're using npm, we may as well use npm: it allows us to clean up travis a little bit.

N.B. I've switched to using `npm install` rather than `--only=dev` because for some reason, the latter would skip a few of the dev dependencies (minimatch, mkdirp, optimist). Given it works in the base branch, I guess this must relate to the order of the dev dependencies? Which isn't something we should rely on, especially as `npm install <package>` sorts them alphanumerically.

For discussion: should we check `package-lock.json` into version control, for more deterministic builds? IIRC the rule of thumb is yes for binaries, no for libraries, and CATMAID is more of a binary than a library.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `faf972b6535c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.