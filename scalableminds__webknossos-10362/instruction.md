# Issue

**Title:** AI help chat: rotating thinking messages, copy button for code

## Description

### Summary
- While waiting for a reply, the AI help chat starts with "Searching the documentation…" and then switches to random (partly microscopy-themed) messages every 2.5 s.
- Code blocks in chat replies get a copy button.
- Extracted from #10285.

### Steps to test:
- Open the help panel and ask the AI assistant a question. The status text above the skeleton should change while waiting.
- Ask for a code example (e.g. "How do I download a dataset with the Python library?") and use the copy button on the code block.

------
- [x] Added changelog entry

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ad13c970195`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.