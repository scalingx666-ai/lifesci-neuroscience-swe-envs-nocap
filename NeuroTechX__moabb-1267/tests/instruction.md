# Issue

**Title:** feat: install a moabb console script (moabb = moabb.run:main)

## Description

### feat: install a moabb console script (moabb = moabb.run:main)

.

- moabb/run.py: move the __main__ block into main(argv=None) (returns 0),
  set prog="moabb"; python -m moabb.run keeps working via SystemExit(main()).
- pyproject.toml: [project.scripts] moabb = "moabb.run:main".
- tests: main() forwards CLI options to benchmark(); --help exits 0.
- Test workflow: smoke the installed script with moabb --help.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `876b8c9400d5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.