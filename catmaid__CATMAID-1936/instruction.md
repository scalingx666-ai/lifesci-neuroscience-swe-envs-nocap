# Issue

**Title:** Ignore GUI tests when testing for non-mainline repos

## Description

This makes it possible to have CI tests being run successfully for other repos than the main upstream repo. Simply defining the Saucelab credentials outside of the Travis file and in the general project configuration (on the website), makes this happen automatically (after a few adjustments to disable GUI tests without these environment variables).

Additionally, this makes it possible for repos other than the mainline repo to enable GUI tests by simply adding the `SAUCE_USERNAME` and `SAUCE_ACCESS_KEY` environment variables through the Travis web interface.

I tried different setups, including build stages, but this becomes quickly verbose and redundant, because the Travis YAML format doesn't support configuring addons and secure environment variables on the stage level. Ultimately, the above solution is simpler anyway.

With this change, this PR from my personal repo should now also be green, because the GUI tests aren't run.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e73277e4acf8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.