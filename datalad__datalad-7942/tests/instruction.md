# Issue

**Title:** BF: fix doubled author name in generated man page AUTHORS section

## Description

## Summary

`man datalad` (and other generated command manpages) showed a doubled author
name in the AUTHORS section:

```
datalad is developed by The DataLad Team and Contributors <The DataLad Team and Contributors <team@datalad.org>>.
```

Fixed by parsing `Author-email` with `email.utils.parseaddr()` to recover
the separate name and email before formatting, and added a regression check
to the docs CI workflow that fails the build if any generated manpage
contains a doubled `<...<...>...>`.

## Test plan

- [x] Verified locally: `python setup.py build_manpage` now produces
      `datalad is developed by The DataLad Team and Contributors <team@datalad.org>.`
- [x] Added CI regression test in `.github/workflows/docbuild.yml`
      (`! grep -E '<[^>]*<[^>]*>[^>]*>' build/man/*.1`)

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8357e625743e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.