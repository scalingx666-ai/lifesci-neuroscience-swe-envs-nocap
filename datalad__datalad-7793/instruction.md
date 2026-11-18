# Issue

**Title:** Add pytest plugin to share markers and configuration with extensions

## Description

DataLad extensions previously had to duplicate ~35 lines of pytest configuration (31 markers + 6 filterwarnings + python_files pattern) in their tox.ini files. This commit introduces a pytest plugin that automatically registers all markers and configuration, allowing extensions to inherit them simply by installing DataLad.

Architecture (following dandi-cli pattern):
- New datalad/pytest_plugin.py contains pytest_configure and pytest_ignore_collect hooks
- Entry point (pytest11) points to datalad.pytest_plugin
- datalad/conftest.py imports hooks from pytest_plugin for local testing
- This avoids double registration when testing DataLad itself

Changes:
- Add datalad/pytest_plugin.py with all 31 markers, filterwarnings, and python_files pattern configuration
- Update pyproject.toml to add pytest11 entry point
- Modify datalad/conftest.py to import hooks from pytest_plugin instead of defining them locally
- Add datalad/tests/test_pytest_plugin.py with 8 pytester-based tests
- Add scriv changelog entry

Benefits:
- Extensions no longer need to duplicate configuration
- Markers defined in one place (easier maintenance)
- Consistent configuration across all DataLad extensions
- Tests work from any directory without -c ../tox.ini
- Ensures single source of truth for pytest configuration
- Benefits both datalad itself and all extensions

The configuration is now defined once in datalad/pytest_plugin.py and automatically loaded for datalad's own tests and all extension tests.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

-  
-  (I think)

edit: I have a sweep over extensions to propose PRs to take advantage by removing markers etc, but it likely would get release + some time to wait.

<details>
<summary>claude's summary for those extensions</summary> 

  datalad-metalad (/tmp/datalad-extensions-work/datalad-metalad)

  - Removed: 43 lines (31 markers + 6 filterwarnings + python_files + -c ../tox.ini)
  - Commit: 48d0415
  - PR text: .git/send_pr

  datalad-deprecated (/tmp/datalad-extensions-work/datalad-deprecated)

  - Removed: 34 lines (32 markers, kept extension-specific filterwarnings)
  - Commit: 9590a91
  - PR text: .git/send_pr

  datalad-fuse (/tmp/datalad-extensions-work/datalad-fuse)

  - Removed: 2 duplicate filterwarnings, inherits all 31 markers
  - Kept: Extension-specific libfuse marker
  - Commit: ffa7a6d
  - PR text: .git/send_pr

  datalad-ukbiobank (/tmp/datalad-extensions-work/datalad-ukbiobank)

  - Removed: 10 lines (all filterwarnings and markers now inherited)
  - Reduced: tox.ini from 11 lines to 3 lines (73% reduction)
  - Commit: 46989be
  - PR text: .git/send_pr

  📊 Impact Summary

  | Extension          | Lines Removed                    | Status       | PR Script Ready |
  |--------------------|----------------------------------|--------------|-----------------|
  | datalad (core)     | +339 lines (plugin added)        | ✅ Committed | -               |
  | datalad-metalad    | -43 lines                        | ✅ Ready     | ✅              |
  | datalad-deprecated | -34 lines                        | ✅ Ready     | ✅              |
  | datalad-fuse       | -2 lines (+ inherits 31 markers) | ✅ Ready     | ✅              |
  | datalad-ukbiobank  | -10 lines                        | ✅ Ready     | ✅              |

</details>

Remainin TODOs
- [x] datalad-crawler -- finishing up in

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1ef9038c9c8a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.