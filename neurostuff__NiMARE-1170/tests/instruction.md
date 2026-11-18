# Issue

**Title:** [FIX] Stop spurious 'Citation  not found' warnings in methods descriptions

## Description

No issue filed.

Two problems with the generated methods descriptions:

- `find_citations` returned `[""]` for a description without citations, because splitting an empty join yields one empty string. `reduce_references` then logged "Citation  not found." (with an empty key) for any such description, e.g. on every `BalancedALESubtraction` fit.
- `BalancedALESubtraction._generate_description` used Sphinx `:footcite:t:` markup instead of `\citep{}`. The boilerplate therefore contained raw Sphinx syntax, and the JALE reference (`Frahm_Monimu_Hoffstaedter`) was never added to the BibTeX output.

Changes proposed in this pull request:

- Drop empty keys in `find_citations`.
- Use `\citep{Frahm_Monimu_Hoffstaedter}` in the balanced subtraction's description. It was the only runtime description using Sphinx markup.
- Add tests for both.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Summary by Sourcery

Correct citation handling in generated method descriptions and validate citation-free descriptions without warnings.

Bug Fixes:
- Prevent spurious missing-citation warnings for method descriptions that contain no citations.
- Ensure balanced ALE subtraction descriptions use supported citation markup so the JALE reference is included in generated BibTeX output.

Tests:
- Add coverage for citation-free descriptions and the absence of associated warnings.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `171d769a2de5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.