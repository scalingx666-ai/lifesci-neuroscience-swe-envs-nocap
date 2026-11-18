# Issue

**Title:** Fix docs version display and update copyright to Gallant Lab

## Description

At release time, the docs website displayed `1.3.0.dev0` instead of `1.3.0` because the docs build workflow used a shallow checkout, preventing setuptools-scm from discovering git tags and generating the correct version. Copyright was also stale (`2012, James Gao`).

## Changes

- **`docs/conf.py` — version**: Use `cortex.__version__` directly, which is populated by setuptools-scm's generated `cortex/_version.py` at install time, rather than relying on a hardcoded fallback:
  ```python
  release = cortex.__version__
  version = ".".join(release.split(".")[:2])
  ```
- **`.github/workflows/build_docs.yml`**: Added `fetch-depth: 0` to the `actions/checkout` step so setuptools-scm can discover git tags and produce the correct version during docs builds (matching what `publish.yml` already does).
- **`docs/conf.py` — copyright**: Updated from `2012, James Gao` to `2012–<current year>, Gallant Lab` using `datetime.now().year` so the year stays current automatically.
- **`docs/conf.py` — epub metadata**: Updated `epub_author`, `epub_publisher`, and `epub_copyright` to `Gallant Lab` with matching dynamic year.

<!-- START COPILOT CODING AGENT TIPS -->
---

📍 Connect Copilot coding agent with [Jira](https://gh.io/cca-jira-docs), [Azure Boards](https://gh.io/cca-azure-boards-docs) or [Linear](https://gh.io/cca-linear-docs) to delegate work to Copilot in one click without leaving your project management tool.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bd53700861fe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.