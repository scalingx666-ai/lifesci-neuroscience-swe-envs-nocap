# Issue

**Title:** Remove markdown link syntax from issue template chooser text

## Description

Removed the Markdown link syntax from the `about:` text of the forum entry in
`.github/ISSUE_TEMPLATE/config.yml`. The issue template chooser does not render
Markdown, so the `[text](url)` syntax was shown as-is. The forum link is still
available via the `url:` field.

**AI assistance disclosure:** I used Claude Sonnet 5.5 (tool) to get the corrected
wording for the `about:` line after I gave it the contents of `config.yml` (manner).
The change is a one-line edit to that file only (scope). I applied, committed, and
pushed the change myself.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f51b088eff42`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.