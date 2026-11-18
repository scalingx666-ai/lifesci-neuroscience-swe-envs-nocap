# Issue

**Title:** doc: Use importlib.metadata for author info in manpage generation to avoid None's and double nested <>

## Description

dist.get_author() and dist.get_author_email() return None when using pyproject.toml's authors list format. Use importlib.metadata.metadata() instead to correctly retrieve author information.

Fixes manpage Authors section showing:
  "datalad is developed by None <The DataLad Team and Contributors <...>>"

🤖 Generated with [Claude Code](https://claude.com/claude-code)

I spotted that while was referred to our docs... checked that looks fine in manpages after this fix.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `30ff569bf98b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.