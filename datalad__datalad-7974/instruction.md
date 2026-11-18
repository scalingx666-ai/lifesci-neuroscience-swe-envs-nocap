# Issue

**Title:** BF(TST): test_assure_unicode tolerates chardet 7.7 declining to guess an encoding

## Description

With chardet 7.7.0, `datalad/tests/test_utils.py::test_assure_unicode` fails on every platform. For example, 's [`test (3.15, ubuntu-latest)`](https://github.com/datalad/datalad/actions/runs/40523639851/job/122258171904) and con/git-annex's DataLad jobs. The failure is:

```
ValueError: Could not decode value as utf-8, or to guess its encoding: b'\xcd\xc1\xcd\xc1 \xcd\xd9\xcc\xc1 \xd2\xc1\xcd\xd5\x1b$BEl\x1b(B\xe6\x9d\xb1'
```

### Cause

chardet 7.7.0 now decodes the data with the encoding it is about to answer before answering ([release notes](https://github.com/chardet/chardet/releases/tag/7.7.0)). The test feeds `ensure_unicode()` deliberately mixed KOI8-R + ISO-2022-JP + UTF-8 bytes, and `chardet.detect()` (era ALL) answers differently across versions:

| chardet | `detect()` answer | `ensure_unicode(mixedin)` |
|---|---|---|
| < 7 | a decodable guess | returns `str` |
| 7.0–7.6 | `ISO-2022-JP`, 0.95 | `UnicodeDecodeError` (accepted by the test) |
| 7.7.0 | `None` (`application/octet-stream`) | `ValueError` from its "could not guess" branch (not accepted) |

7.7.0's answer is the more correct one. `UnicodeDecodeError` is a subclass of `ValueError`, and no caller of `ensure_unicode()` in DataLad catches `UnicodeDecodeError` specifically. So this is only the test's expectation.

### Change

The test now accepts any `ValueError` for chardet >= 7. For chardet < 7 it still requires a successful decode, instead of letting the exception pass whatever the chardet version is.

### Testing

- With chardet 5.2.0 (Ubuntu 24.04), the test passes on the strict chardet < 7 path.
- I couldn't run chardet 7.x itself here, so I replayed the `detect()` answers I had recorded from 7.6.0 and 7.7.0 for these bytes; all other inputs got real chardet 5.2 answers.
  - The test from `maint` passes with 7.6.0 and fails with 7.7.0, with the same `ValueError` as CI.
  - The test from this branch passes with both.

- [x] Overview
- [x] Changelog snippet: `changelog.d/pr-7974.md`

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_015vAgc4ZANuUE54RVf1848o

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `41f00025d04f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.