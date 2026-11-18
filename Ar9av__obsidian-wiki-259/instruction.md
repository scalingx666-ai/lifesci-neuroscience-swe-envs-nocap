# Issue

**Title:** feat(docs): a no-code path for adding README translations

## Description

## Why

From the competitive survey: GD4AI/obsidian-llm-wiki has 406 merged PRs, and an explicit "add a language" path is its main way of bringing in outside contributors (11 UI languages). zosmaai/pi-llm-wiki ships 10 translations and nashsu/llm_wiki ships 4. We have one, and adding a second today would mean editing the drift checker, which was hardcoded to `README_TW.md`.

## What

- **`tools/check_readme_sync.py`** discovers every **tracked** `README_<LANG>.md` and reports drift for each separately. For a repo with only `README_TW.md`, the output is unchanged.
- **`docs/contributing.md`** adds a new "Adding a README translation" checklist covering:
  - file naming
  - translating prose only (commands, slash commands, skill names and URLs stay as they are)
  - keeping the structure identical
  - adding the language to the switcher in every README
  - running the checks
  - saying in the PR whether you're a native speaker

  It also generalizes the TW-specific sync wording.
- **`AGENTS.md`** wording is generalized the same way and points to the checklist.
- **README.md and README_TW.md** add one line in Contributing inviting translators, with a link to the checklist.
- **The CI warning** no longer names `README_TW.md`.

## Tests

- `tests/test_readme_sync.py` adds three tests:
  - drift is reported per translation (TW in sync while JA lags)
  - an untracked draft isn't treated as a translation
  - every `README_*.md` is linked from `README.md`'s language switcher, whether as an HTML `href` or a markdown link
- The four existing checker tests pass unchanged.
- `pytest`: 1095 passed, 4 skipped.
- `python tools/check_readme_sync.py` on this branch reports `README_TW.md is up to date with README.md.`

## Follow-up (needs the maintainer)

Opening one `good first issue` per target language (JA, KO, ES, CN) would make the path visible. I haven't created them, since issues are public.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `94e1c401dc23`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.