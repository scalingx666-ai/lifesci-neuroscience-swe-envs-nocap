# Issue

**Title:** MNT: Raise the SPEC 0 floors quarterly, and state the policy

## Description

Raises the dependency floors to [SPEC 0](https://scientific-python.org/specs/spec-0000/) every quarter, as NiFreeze does (nipreps/nifreeze#648, with the app of nipreps/nifreeze#652), and states the policy.

- **`.github/workflows/spec0.yml`:** NiFreeze's workflow, which runs `scientific-python/spec0-action` v1.6 on day 3 of each quarter and on `workflow_dispatch` (with `create_pr: false` for a dry run). It keeps NiFreeze's settings: `update_all: 2`, `excluded_packages: python`.
  - The `nipreps-spec0` app opens the pull requests, so CI runs on them. `GITHUB_TOKEN` only checks the code out (`contents: read`).
  - Unlike NiFreeze's, it targets `master`, and it limits the app's token to `contents: write` and `pull-requests: write`. Without that limit, zizmor 1.32.0 fails the workflow (`github-app`, high).
  - Python is left out, as in NiFreeze: dropping a Python version also changes the CI matrices and images, the classifiers and the image's Python. That stays a pull request by hand (the next one drops 3.13, in 2027 Q4).
- **`pyproject.toml`:** the image's pins in `[tool.pixi.dependencies]` become ranges (`3.11.*` to `>=3.11,<3.12`).
  - The updater also edits pixi tables. It reads `3.11.*` as `==3.11.*`, so this quarter it would write `matplotlib = ">=3.11.0,==3.11.*"`, and the same for scikit-image.
  - The versions are the same, and `pixi lock --check` (pixi 0.82.1, as in the `Dockerfile`) finds the lock up to date.
- **`pixi.lock`:** the action commits `pyproject.toml` only, so the bot's pull requests leave the lock's copy of MRIQC's requirements stale.
  - The image installs with `--frozen`, so nothing breaks.
  - The bot's pull request asks to run `pixi lock` before merging. Raising three floors on a scratch copy changed just those three lines of the lock.
- **Docs:** the SPEC 0 badge in `README.rst`, and a "Supported versions" section in `docs/source/install.rst`.

**The first run** follows the 2026 Q4 schedule:
- it raises numpy to 2.3, matplotlib to 3.11 and scikit-learn to 1.7;
- it adds floors to scikit-image (0.26) and IPython (8.32);
- `update_all` raises the other floors to their oldest release of the last two years, and adds floors where there are none.

A dispatch with `create_pr: false` after the merge lists every change.

**Settings:**
- The org variable `SPEC0_APP_CLIENT_ID` and the org secret `SPEC0_APP_PRIVATE_KEY` are already visible to mriqc.
- The app is installed on selected repositories only. If mriqc isn't one of them, the token step fails at once.

Tests:

```
uvx zizmor==1.32.0 .github/workflows/spec0.yml
uvx --from actionlint-py actionlint .github/workflows/spec0.yml
docker run --rm -v "$PWD":/app -w /app ghcr.io/prefix-dev/pixi:0.82.1 pixi lock --check
```

X-Refs: nipreps/nifreeze#644, nipreps/nifreeze#648, nipreps/nifreeze#652

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ff37e1c17930`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.