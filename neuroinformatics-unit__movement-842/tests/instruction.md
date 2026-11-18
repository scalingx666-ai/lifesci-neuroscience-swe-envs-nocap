# Issue

**Title:** Make hide_pooch_hash_logs internal by renaming to _hide_pooch_hash_logs

## Description

## Description

**What is this PR**

- [ ] Bug fix  
- [ ] Addition of a new feature  
- [x] Other  

**Why is this PR needed?**

`hide_pooch_hash_logs` is only used internally and should not be exposed as part of the public API.

**What does this PR do?**

Renames `hide_pooch_hash_logs` to `_hide_pooch_hash_logs` and updates internal references and tests accordingly.

---

## References

 

---

## How has this PR been tested?

Updated the existing unit tests to use the renamed function. Ran `pre-commit` locally to ensure formatting and linting checks pass.

---

## Is this a breaking change?

No.

---

## Does this PR require an update to the documentation?

No.

---

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with pre-commit

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8d794fd0f6f2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.