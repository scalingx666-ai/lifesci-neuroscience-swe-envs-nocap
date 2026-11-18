# Issue

**Title:** Fix docs build failing with sphinx-design 0.8

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

The Docs job currently fails on every PR. sphinx-design 0.8.0 deprecates the `+++` separator for card footers, which is used in the logo cards on the Resources page. The deprecation warning becomes an error because the docs are built with `-W`.

**What does this PR do?**

- Replaces the `+++` separators in `docs/source/community/resources.md` with the new `{card-footer}` directive.
- Requires `sphinx-design>=0.8` in the `docs` dependency group, since older versions don't support `card-footer`.

## References

I found this issue because it blocks the Docs checks on #1190 and #1199.

## How has this PR been tested?

Built the docs locally using the same versions CI installs (Sphinx 9.2.0, sphinx-gallery 0.22.1, sphinx-design 0.8.0): no warnings. The three cards still render with their SVG/PNG download links in the footer.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7e258141d820`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.