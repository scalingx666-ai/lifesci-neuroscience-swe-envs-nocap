# Issue

**Title:** Use Jupyter notebook terminology consistently

## Description

**Motivation and context:**
The IPython notebook was rebranded the Jupyter notebook some time ago. We still had some instances of calling the notebook the IPython notebook; this PR ensures that we use "Jupyter notebook" in all instances.

Also made a minor change to the manifest to try to make sure `.ipynb_checkpoints` folders are not included in releases. For some reason excluding the folder is not sufficient (though it is sufficient for `.git` and others :confused:)

**How long should this take to review?**

- Quick (less than 40 lines changed or changes are straightforward)

**Types of changes:**

- Non-code change (touches things like tests, documentation, build scripts)

**Checklist:**

- [x] I have read the **CONTRIBUTING.rst** document.
- [x] I have updated the documentation accordingly.
- [NA] I have included a changelog entry.
- [NA] I have added tests to cover my changes.
- [x] All new and existing tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `766dbc0cb1e3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.