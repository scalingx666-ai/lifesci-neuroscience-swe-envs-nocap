# Issue

**Title:** fix: doc polish, UI improvements, tutorial dependency extras

## Description

## Summary

### UI / Doc improvements
- **Hero tagline**: "Simple. Fast. Robust. Scalable."
- **Subtitle**: updated for clarity
- **h1 underline bar**: full-width gradient fading to transparent
- **Copy button** next to pip install on landing page
- **neuralfetch card tagline**: "curated" brain datasets
- **Pipeline accordion**: Python syntax highlighter + `window._highlightPy` exposed globally
- **Quickstart code**: rename `cache`→`infra`, simplify MEG/EEG params, hemodynamic delay comment
- **neuralfetch landing**: fix DOMContentLoaded race (readyState check), add copy button, use `window._highlightPy`
- **Copy button positioning**: `position:relative` on `.code-block-wrapper pre`

### Tutorial dependency fixes
- `neuraltrain[all] = [models,metrics,lightning]` — one command installs all tutorial deps
- `neuralfetch[all] = [neuralset[all], matplotlib]`
- `neuraltrain install.md`: recommend `[dev,all]` for running all tutorials

### Tutorial content fixes
- `04_extractors.py`: note spacy `en_core_web_lg` ~400 MB auto-download
- `04_extractors.py`: use glob pattern for `stim.png` placeholder (suppresses file-missing warning)

Closes issues raised during internal tutorial testing.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5383b715b312`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.