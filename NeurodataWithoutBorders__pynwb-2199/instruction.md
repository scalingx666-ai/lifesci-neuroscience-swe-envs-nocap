# Issue

**Title:** Update nwb-schema submodule to NWB 2.10.0

## Description

## Motivation

Updates the `nwb-schema` submodule to the tip of the [`prepare_2.10.0`](https://github.com/NeurodataWithoutBorders/nwb-schema/tree/prepare_2.10.0) branch (NWB 2.10.0), which depends on nwb-schema PR NeurodataWithoutBorders/nwb-schema#681. This advances the nested `hdmf-common-schema` to 1.9.0 (adds `MeaningsTable`, promotes `HERD` to stable in hdmf-common).

Draft while NWB 2.10.0 is finalized.

Also fixes some Sphinx warnings.

## How to test the behavior?

The full pynwb test suite passes against the updated schema (`829 passed, 7 skipped, 6701 subtests passed`), after clearing the cached core typemap (`pynwb.clear_cache_dir()`).

## Checklist

- [ ] Did you update CHANGELOG.md with your changes?
  - Already added from a previous PR.
- [x] Have you checked our [Contributing](https://github.com/NeurodataWithoutBorders/pynwb/blob/dev/docs/CONTRIBUTING.rst) document?
- [x] Have you ensured the PR clearly describes the problem and the solution?
- [x] Is your contribution compliant with our coding style? This can be checked running `ruff` from the source directory.
- [x] Have you checked to ensure that there aren't other open or previously closed [Pull Requests](https://github.com/NeurodataWithoutBorders/pynwb/pulls) for the same change?
- [ ] Have you included the relevant issue number using "Fix #XXX" notation where XXX is the issue number? By including "Fix #XXX" you allow GitHub to close issue #XXX when the PR is merged.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bd9bcc275a17`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.