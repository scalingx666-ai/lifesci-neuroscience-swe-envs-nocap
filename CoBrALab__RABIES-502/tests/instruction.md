# Issue

**Title:** Bump docs dependencies and drop dead ICA-AROMA requirements.txt

## Description

Clears all 23 open Dependabot alerts on this repo. None were on a runtime path — 21 were in the ReadTheDocs build environment and 2 were in a file nothing reads.

## `docs/requirements.txt` — 21 alerts

| | from | to |
|---|---|---|
| `jinja2` | 3.1.1 | 3.1.6 |
| `pillow` | 10.1.0 | 12.3.0 |

Pillow 12.x requires Python >= 3.10, so `.readthedocs.yml` moves from Python 3.9 to 3.10, and `ubuntu-20.04` to `ubuntu-22.04` (the 20.04 image doesn't offer 3.10). Sphinx 5.0 still supports 3.10, so that pin is untouched.

## `rabies/confound_correction_pkg/mod_ICA_AROMA/requirements.txt` — 2 alerts

Deleted. It pinned `numpy==1.14` / `pandas==0.23` / `matplotlib==2.2` and **nothing referenced it**: not `setup.py`, not `rabies_environment.yml`, not the top-level `Dockerfile`, not `mod_ICA_AROMA/Dockerfile` (which installs numpy/scipy via `yum`). It came in with the vendored upstream ICA-AROMA package and documented a `python2.7 -m pip install` workflow.

The only mention left is a line in the vendored `mod_ICA_AROMA/README.md` describing that original Python 2.7 install. I left that README alone since it's upstream text, but it's now a dangling reference if you'd rather trim it.

## Verification

Built the docs in a clean Python 3.10 venv from the updated `docs/requirements.txt`:

```
pillow   12.3.0
jinja2   3.1.6
sphinx   5.0.0
rabies   0.6.1
traits   6.4.3

build succeeded.
```

## Note — not addressed here

Dependabot doesn't parse conda environment files, so `rabies_environment.yml` is unscanned. It's what users and the container actually get, and it pins `scikit-learn=0.24.1`, `pandas=1.2.4`, `nibabel=3.2.1`, `matplotlib=3.3.4` — all 2021. That's a compatibility exercise rather than a security patch, so it's deliberately out of scope for this PR, but it's the dependency surface that actually ships.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_011eAqGnoxyyiEzktoJEktZn

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `68a0a5857fb9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.