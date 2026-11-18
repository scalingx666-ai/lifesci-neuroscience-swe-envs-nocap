# Issue

**Title:** Add go-to-version and bisect tools to version restore view

## Description

### Summary
- Adds a subtle cog button to the version restore view that opens a power-user panel.
- **Go to version**: enter a version number; the list loads the required pages, activates that version, expands its group and scrolls to it.
- **Bisect**: enter a good and a bad version and start; the middle version is activated and can be marked good/bad until the first bad version is found.

### Screenshots
<img width="405" height="561" alt="image" src="https://github.com/user-attachments/assets/94912a58-16fe-46af-ab7c-5e491d174a41" />
<img width="405" height="561" alt="image" src="https://github.com/user-attachments/assets/fff57809-e61a-4cb5-85ac-837df3387a5c" />
<img width="405" height="561" alt="image" src="https://github.com/user-attachments/assets/44dc58a2-ad4a-4596-981f-a2daa3f81cec" />


### Steps to test:
- Open the version restore view of an annotation with many versions and click the cog icon.
- Enter a version number (also one far outside the loaded pages) and click Go.
- Enter a good (older) and bad (newer) version, click Start bisect, and mark versions good/bad until the first bad version is shown.

### Issues:
- none

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8f67dba2244c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.