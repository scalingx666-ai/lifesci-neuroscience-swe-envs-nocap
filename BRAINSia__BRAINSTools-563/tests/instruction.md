# Issue

**Title:** COMP: Fix macOS/Linux portability in shell scripts and utilities

## Description

## Summary

Audit and fix all macOS (BSD toolchain) vs Linux (GNU toolchain) portability
issues found across `Utilities/` scripts. Companion to the cross-platform
requirement added to `CLAUDE.md` and `Documentation/AI/style.md` in PR #561.

| File | Issue | Fix |
|------|-------|-----|
| `Utilities/Maintenance/replace_atoi_atof.sh` | `fgrep` deprecated | `grep -F` |
| `Utilities/Maintenance/replace_atoi_atof.sh` | `sed -i ""` BSD-only | tmp-file pattern |
| `Utilities/Maintenance/replace_atoi_atof.sh` | copy-paste bug: atof loop read `atoi_files.list` | fixed to `atof_files.list` |
| `Utilities/DevelopmentSetupScripts/SetupHooks.sh` | `egrep` deprecated | `grep -E` |
| `Utilities/Maintenance/clang-format.bash` | `type -p` bash-ism | `command -v` (POSIX) |
| `Utilities/build_configs/nightly.sh` | `which` not POSIX | `command -v` |
| `Utilities/UpdateCopyrightStatementsInBRAINSTools.py` | `#!/usr/bin/python` (Python 2 EOL) | `#!/usr/bin/env python3` |

Note: the `cp -rn` → `rsync -a --ignore-existing` fix in `.github/workflows/build.yml`
was squashed directly into PR #561 (the ExternalData cache commit) since it
affects the same CI workflow being added there.

## AI Assistance Disclosure

Portability audit performed with Claude Sonnet 4.6. All fixes reviewed and
verified against POSIX documentation before committing.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4a0222bc37df`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.