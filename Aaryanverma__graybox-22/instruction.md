# Issue

**Title:** Refactor retrieval graph expansion and enhance scoring logic

## Description

- Updated `_expand_graph` to incorporate query relevance in scoring, ensuring that nodes are scored based on both proximity and content relevance.
- Improved handling of already expanded nodes to prevent redundant processing and ensure the best score is retained across multiple paths.
- Added tests for the new scoring logic to validate that distant but relevant neighbors are not suppressed and that shared neighbors receive the maximum score regardless of visit order.
- Introduced a new `llms.txt` file for documentation on the Gray Box system, detailing installation, operational behavior, and configuration.
- Refactored various test files to streamline imports and improve clarity, including tests for interactive input handling, curation, history tracking, and storage.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9f0689547947`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.