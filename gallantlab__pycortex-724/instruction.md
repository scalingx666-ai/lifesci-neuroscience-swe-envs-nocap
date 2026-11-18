# Issue

**Title:** CI: let the Claude workflow run the test suite

## Description

. The `claude.yml` workflow added there checks out the repo and runs `claude-code-action` with no setup, so Claude cannot actually run anything Python — `import cortex` fails without the Cython extensions built.

## Changes

**Environment setup before the Claude step**, mirroring `run_tests.yml`:

- `setup-python` (3.12) + pip cache, reusing `run_tests.yml`'s cache key so runs on `main` warm it
- `inkscape` via apt, then `pip install -e '.[headless]'` and `-e . --group dev`
- `python -c 'import cortex'` smoke check, so a broken build fails the job loudly rather than confusing Claude
- Playwright browser cache + `playwright install --with-deps --only-shell chromium`

**A narrow tool allowlist** so the test run doesn't hit a permission prompt (which in Actions means it simply can't proceed):

```yaml
claude_args: |
  --allowed-tools "Bash(pytest:*),Bash(python -m pytest:*)"
```

## Notes

- The allowlist is intentionally just pytest. With the environment pre-installed there's no need to grant `pip` or a bare `python`, and `Bash(python:*)` would be arbitrary code execution in a job holding `CLAUDE_CODE_OAUTH_TOKEN`.
- Pre-installing costs roughly 2-4 min on every `@claude` mention, including ones that never touch Python. The alternative — letting Claude install things itself — can't use `actions/cache`, re-derives the build steps each time, and needs `sudo apt-get` in the allowlist anyway. For a package with compiled extensions the tradeoff seemed worth it, but happy to revisit.
- The Playwright browsers cache; the apt `inkscape` install does not, and is re-downloaded each run (same as `run_tests.yml` today).

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1b02f9c22946`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.