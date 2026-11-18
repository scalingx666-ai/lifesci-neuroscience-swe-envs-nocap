# Issue

**Title:** Point AI help chat to the webknossos-combined webhook

## Description

### Summary
- Points `supportAiAgentUrl` to the new `webknossos-combined` webhook.
- The rotating thinking messages and the copy button for code blocks moved to #10362.

### Steps to test:
- Open the help panel and ask the AI assistant a question. It should answer using the new webhook.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ebe548118145`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.