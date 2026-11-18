# Issue

**Title:** Build docs with TravisCI, use nengo.ai

## Description

**Motivation and context:**
Currently Nengo core's documentation is the only set of docs hosted on pythonhosted.org. It's pretty unreliable, and really all of the docs should be found on the nengo.ai domain.

This PR has TravisCI build the docs and push them to `gh-pages` when tags are pushed, but not when any branch is pushed, since building the docs takes some time. This also switches the doc theme to Guzzle, which the rest of the docs use.

**How has this been tested?**
I originally had this build on all pushes to generate http://www.nengo.ai/nengo/ ; I then amended in the check for the `$TRAVIS_TAG` environment variable.

**How long should this take to review?**

- Average (neither quick nor lengthy)

**Where should a reviewer start?**
Probably check `.travis.yml` first. For reviewing doc changes, the rendered version is at http://www.nengo.ai/nengo/

**Types of changes:**

- Non-code change (touches things like tests, documentation, build scripts)

**Checklist:**

- [x] I have read the **CONTRIBUTING.rst** document.
- [x] I have updated the documentation accordingly.
- [na] I have included a changelog entry.
- [na] I have added tests to cover my changes.
- [x] All new and existing tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `88c29a8c9c9e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.