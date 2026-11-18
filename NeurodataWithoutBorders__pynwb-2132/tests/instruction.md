# Issue

**Title:** Handle Device conflicts between core schema and extensions

## Description

## Motivation

Fix #2108. Related to updates in  that will warn a user when there are extension conflicts, these changes remap some of these conflicts on read.
- Remaps `Device.model` as a string attribute to a `DeviceModel` object on read.
- Remaps `Device.model` defined by other extensions to a `Device.{extension_name}_model` field to allow data from files with an older extension with a conflicting Device.model to be read. 

Note - the tests will not pass until  is merged since it raises a warning instead of an error if an extension attempts to overwrite an existing specification.

## How to test the behavior?
```
Show how to reproduce the new behavior (can be a bug fix or a new feature)
```

## Checklist

- [X] Did you update CHANGELOG.md with your changes?
- [X] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [X] Have you ensured the PR clearly describes the problem and the solution?
- [X] Is your contribution compliant with our coding style? This can be checked running `ruff check . && codespell` from the source directory.
- [X] Have you checked to ensure that there aren't other open [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [X] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6ff7e4456708`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.