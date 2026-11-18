# Issue

**Title:** Release 0.1.97

## Description

Silent release.

- MCP tools: every refusal carries a reason code; unambiguous inputs (numbers/booleans as strings, edits as a JSON string, a vault by name or org id) are accepted; deleting something already deleted answers success instead of an error.
- Published notes: embedded images now load (the page's image policy allows the storage bucket the image redirects to), and the page is restyled in the baalda.com design, light mode only.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `73958a7939a9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.