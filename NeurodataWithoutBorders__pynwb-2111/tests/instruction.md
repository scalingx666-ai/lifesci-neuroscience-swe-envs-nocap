# Issue

**Title:** HERD Changes internal file

## Description

Allow HERD to be stored internally, but still allow external override

Future development:
On the surface to the user, HERD is a table and when you query before any I/O, you will see lists and tuples. Under the hood, HERD is written as a structured array and on read is no longer a list/tuple but a structured array. This was a bit surprising and so I spent some time to map over the array to a list on read in the get_item. However, this grew in complexity reaching __swap_refs in AbstractH5TableDataset. Without a clear easy solution, I am leaving this for future development. It is because of this the tests are structured the way they are in the asserts.

What was the reasoning behind this change? Please explain the changes briefly.

## How to test the behavior?
```
Show how to reproduce the new behavior (can be a bug fix or a new feature)
```

## Checklist

- [x] Did you update CHANGELOG.md with your changes?
- [x] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [x] Have you ensured the PR clearly describes the problem and the solution?
- [x] Is your contribution compliant with our coding style? This can be checked running `ruff check . && codespell` from the source directory.
- [x] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [ ] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2850074bbca6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.