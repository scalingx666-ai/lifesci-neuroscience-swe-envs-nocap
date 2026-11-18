# Issue

**Title:** neuralset: install spaCy models once before cluster dispatch; add Greek

## Description

Stops cluster workers from pip-installing the same spaCy model concurrently and fails early on unsupported languages; adds Greek.

- `SpacyEmbedding.prepare` installs every spaCy model the uncached events need once, in the submitting process, before dispatching to the cluster; workers sharing the environment no longer pip-install the same model concurrently, and an unsupported language fails before dispatch. A fully cached run installs nothing.
- `utils.get_spacy_model` is split into `spacy_model_name(model=, language=)` (pure resolution) and `install_spacy_model(model)`; `get_spacy_model` behaves as before.
- Greek: `"el"` / `"greek"` → `el_core_news_lg`.

## What does this PR do?

<!-- Brief description of the change. -->

## Related Issues

<!-- e.g. ,  -->

## Checklist

- [ ] Tests added or updated
- [ ] Docstrings updated for any changed public APIs
- [ ] `pytest` and `mypy` pass locally

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b1889d1f336c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.