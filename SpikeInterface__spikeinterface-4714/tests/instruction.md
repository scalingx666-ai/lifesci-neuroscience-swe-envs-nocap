# Issue

**Title:** Add `template_operator` to template metrics backwards compatibility

## Description

The `TemplateMetrics` kwarg `template_operator` was introduced recently, this PR adds backwards compatibility.

Required if you're splitting/merging a `<0.104` analyzer using si `0.104`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a5f7dbb3e39b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.