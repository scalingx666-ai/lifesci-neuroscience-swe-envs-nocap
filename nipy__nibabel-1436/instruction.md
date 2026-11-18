# Issue

**Title:** PL: Add stub file for top-level `__init__.py`

## Description

Related to #1426 by @pcasl
Related to #1220 by @effigies 

## Description

This PR adds a stub file for the top-level `__init__.py`, including an `__all__` to expose the types of all symbols imported or defined therein.

## Screenshots

### Without the stub file

<img width="738" height="86" alt="warning: &quot;load&quot; is not exported from module &quot;nibabel&quot;" src="https://github.com/user-attachments/assets/24a3fe30-3a34-4df8-904b-7374a2ecfdf1" />

### With the stub file

<img width="430" height="78" alt="no warning" src="https://github.com/user-attachments/assets/34073054-2883-4af7-9108-a8db5bcc6784" />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4ee2a49cccbd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.