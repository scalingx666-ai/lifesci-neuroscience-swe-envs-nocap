# Issue

**Title:** fix: add brainglobe-template-builder to atlasgen optional dependencies

## Description

# Fix missing brainglobe-template-builder dependency and cleanup duplicates

## Description

**What is this PR**

- [x] Bug fix

**Why is this PR needed?**

`filtering_wingdisc.py` imports functionality from `brainglobe_template_builder`. Without this package, users installing `brainglobe-atlasapi[atlasgen]` encounter a `ModuleNotFoundError`, preventing atlas generation workflows from running.

**What does this PR do?**

Adds the missing dependency to the `atlasgen` optional dependencies list in `pyproject.toml` and removes a duplicate `"brainglobe-utils"` entry.

---

## References



---

## How has this PR been tested?

- Confirmed that `pyproject.toml` now lists `brainglobe-template-builder` under the correct extras group.
- Verified that installation with:

```
pip install brainglobe-atlasapi[atlasgen]
```

now installs `brainglobe-template-builder`, preventing the import error.

---

## Is this a breaking change?

- No — no existing functionality is changed. This PR only ensures required dependencies are installed.

---

## Does this PR require documentation updates?

- No — this change only updates dependency configuration and does not modify user-facing behavior or documentation.

---

## Checklist

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (not applicable — dependency change only)
- [ ] The documentation has been updated to reflect any changes (not required)
- [x] The code has been formatted with pre-commit (N/A — no Python source modified)

---

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `076d3ebb273d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.