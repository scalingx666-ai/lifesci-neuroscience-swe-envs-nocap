# Issue

**Title:** Remove unnecessary calls to deepcopy(get_type_map)

## Description

## Motivation

Fix #1958. . Similar approach as in #2075. Adds a `copy` argument to `get_type_map` that is default True but can be set to False. The False setting is used when creating a setter for each attribute in each NWB container class. Previously, a deepcopy was performed when creating every setter, which significantly hurt performance.

This PR deprecates calling get_type_map with any 'extensions' arguments, a use case I have never seen. IMO it's easy for the rare user to just call load_namespaces on the type map than us maintain all this extra convenience logic that even we don't use. See similar PR for hdmf-common in 

It is possible that deepcopying of typemaps in `get_type_map` can be removed entirely. That will be investigated separately as part of #2120.

## How to test the behavior?
```
Profile performance, run pytest
```

## Checklist

- [x] Did you update CHANGELOG.md with your changes?
- [x] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [x] Have you ensured the PR clearly describes the problem and the solution?
- [x] Is your contribution compliant with our coding style? This can be checked running `ruff check . && codespell` from the source directory.
- [x] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [x] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f9cd2a280cb5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.