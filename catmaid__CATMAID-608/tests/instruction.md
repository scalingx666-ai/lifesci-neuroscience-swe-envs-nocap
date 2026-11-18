# Issue

**Title:** Add tag based Highlighting in dataviews

## Description

This adds a config option "highlight_tags" for the Project tag table which
expects a list of tags (just like filter_tags, row_tags and col_tags do). In
the data view, all projects tagged with any of the tags provided will be
highlighted in bold (#dataview .highlight in screen.css).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6ce8f617d53e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.