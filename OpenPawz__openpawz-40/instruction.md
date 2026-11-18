# Issue

**Title:** Review/engram memory overhaul

## Description

This pull request updates the git hook setup to improve reliability and developer experience by ensuring the `prek` tool is automatically installed when missing, and simplifies how hooks are managed and installed. The changes remove manual installation logic from the Node.js script and move the auto-install logic directly into the hook scripts themselves. This makes the hooks self-sufficient and ensures a fresh clone will work without requiring `prek` to be pre-installed.

**Git hook installation and management improvements:**

* The `scripts/pre-commit` and `scripts/pre-push` hook scripts now auto-install `prek` at runtime if it's missing, ensuring hooks run even on fresh clones without manual setup. [[1]](diffhunk://#diff-40564a4a456c31b8543923ab58e31689dde6119d9419c1211a0cbee86a524debR1-R23) [[2]](diffhunk://#diff-426deb3a3b3a4a1eba45f53a4baaff13822616be1722d220cff2f96baebe82e6L2-R21)
* The hook scripts provide clear messaging about installation status and skip checks gracefully if `prek` cannot be installed. [[1]](diffhunk://#diff-40564a4a456c31b8543923ab58e31689dde6119d9419c1211a0cbee86a524debR1-R23) [[2]](diffhunk://#diff-426deb3a3b3a4a1eba45f53a4baaff13822616be1722d220cff2f96baebe82e6L2-R21)
* The `scripts/prepare-hooks.js` script is simplified to only copy the hook scripts into `.git/hooks/` and make them executable, removing previous logic for installing `prek` via Node.js. [[1]](diffhunk://#diff-cba6efd76d2c5cfeaf810802a8fd6e10c3012eab765c032905bdaf270a288423L2-L5) [[2]](diffhunk://#diff-cba6efd76d2c5cfeaf810802a8fd6e10c3012eab765c032905bdaf270a288423L18-R40)

**Documentation and clarity:**

* Comments and documentation in hook scripts and `prepare-hooks.js` have been updated to clarify that hooks are managed and re-created on `npm install`, and that auto-installation of `prek` is handled at runtime. [[1]](diffhunk://#diff-40564a4a456c31b8543923ab58e31689dde6119d9419c1211a0cbee86a524debR1-R23) [[2]](diffhunk://#diff-426deb3a3b3a4a1eba45f53a4baaff13822616be1722d220cff2f96baebe82e6L2-R21) [[3]](diffhunk://#diff-cba6efd76d2c5cfeaf810802a8fd6e10c3012eab765c032905bdaf270a288423L2-L5)

**Cleanup and removal of manual installation logic:**

* The previous logic for checking and installing `prek` in `prepare-hooks.js` has been removed, reducing complexity and potential points of failure.

These changes make the git hook setup more robust, easier to maintain, and friendlier for new contributors.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `246e0d7f0591`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.