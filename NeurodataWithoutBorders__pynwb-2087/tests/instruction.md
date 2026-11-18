# Issue

**Title:** Use both pynwb and hdmf version for type map cache dir

## Description

## Motivation

Fix broken wheel installation in https://github.com/NeurodataWithoutBorders/pynwb/actions/runs/15316694085/job/43091793043

The core problem is that a type map is cached using hdmf 3.14.5 but then the wheel installation happens using hdmf 4.1.0, and in hdmf 4.1.0, we renamed ClassGenerator to ClassGeneratorManager. This breaks the loading of the pickled type map because ClassGenerator does not exist.

To remedy that, we will use both the pynwb and hdmf version to generate the name of the type map cache directory.

## Checklist

- [x] Did you update CHANGELOG.md with your changes?
- [x] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [x] Have you ensured the PR clearly describes the problem and the solution?
- [x] Is your contribution compliant with our coding style? This can be checked running `ruff check . && codespell` from the source directory.
- [x] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [x] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `98a6701baf64`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.