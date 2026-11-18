# Issue

**Title:** Add a `dev` dependency group so uv installs pre-commit by default

## Description

Python packaging has both optional dependencies (extras) and dependency groups. The former are meant to be user facing and the latter are meant for development as they are not published. Because of this meaning, tools like uv, which I think now we all use, give a special meaning to the `dev` dependency group: it is installed by default when you are developing locally which in our case means `black` and `pre-commit`.

This PR creates a `dev` dependency group with the lint tools of the `dev` extra, `black` and `pre-commit`, so our dev environments always have `pre-commit`. I should have done this in #4541 when I moved the test tools to dependency groups, but I missed the lint tools.

I also think the `dev` extra should go away eventually as extras are published in the package metadata, and lint tools are not an install option of the library. The same goes for `docs`, which could become a group too. I left both for another PR because `doc/get_started/installation.rst` documents `[dev]` and `readthedocs.yml` installs `.[docs]`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7d7bd2140b32`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.