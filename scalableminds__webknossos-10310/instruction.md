# Issue

**Title:** Show icon-only Ask button in navbar on small screens

## Description

### Summary
On small screens the "Ask" chatbot button in the navbar collided with the annotation toolbar. Below 1200px the button now shows only its icon, using the existing `hide-on-small-screen` pattern (like the Save/Sandbox buttons). Added a "Ask a Question" tooltip for the icon-only state.

### Steps to test:
- Open an annotation and shrink the window below 1200px width
- The "Ask" button should collapse to an icon-only button and no longer overlap the toolbar; hovering shows "Ask a Question"

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e7904e3cb55e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.