# Issue

**Title:** HuggingFacePCA: bound and self-clear the staging folder

## Description

## What does this PR do?

`HuggingFacePCA.prepare` staged its intermediate embeddings in a `tempfile.TemporaryDirectory`, which nothing cleans up after a SIGKILL (Slurm timeout, OOM, preemption). The name was random, so every killed attempt left another `HF-PCA-tmp*` folder behind — thousands of them in practice.

- Name the staging folder after the prepare uid *and* the extractor's `uid_folder()`. That bounds the leak to one folder per (event set, extractor): a retry lands on the same folder and reuses the extraction, while a different model gets its own and cannot `rmtree` a peer's.
- Release the extractor cache in a `finally`. `del feat.infra._state.cache_dict` only ran on the success path, so a failed prepare left an fd open on a staged file — deleting a still-open file over NFS is what leaves `.nfs*` entries and `[Errno 16] Device or resource busy`.
- Clear the staging folder once the PCA is cached, including the everything-already-cached early return, so leftovers from a killed run go away.

## Checklist

- [x] Tests added or updated
- [x] Docstrings updated for any changed public APIs
- [x] `pytest` and `mypy` pass locally

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a8092dc10956`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.