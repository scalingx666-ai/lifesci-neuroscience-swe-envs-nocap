# Issue

**Title:** Fix changed-file detection for renamed extension description files

## Description

The AI analysis workflow collected changed files with --diff-filter=AM, which silently dropped files that git classifies as renamed (R), e.g. when an extension description file is renamed with small edits. The analysis then ran with no input while the job still reported success.

Include renames (--diff-filter=AMR) in both the AI analysis and the extension validation workflows (--name-only reports a renamed file under its new path), exclude deletions from the validation file list, and emit a workflow warning when the AI analysis file list is empty so this failure mode is visible on the run page.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6bfce30175fb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.