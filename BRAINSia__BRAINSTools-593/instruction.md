# Issue

**Title:** ENH: Add pyproject.toml with pixi workspace for build/test/lint tasks

## Description

## Summary

- Adds `pyproject.toml` following the ITK paradigm (pixi workspace, not pip-installable package)
- Centralizes Python tool configuration (black, ruff, pytest), dependency management, and CMake build/test task commands
- Removes superseded files: `AutoWorkup/requirements.txt`, `AutoWorkup/requirements-dev.txt`, `AutoWorkup/install_python_tools.sh` (2012 `easy_install` script)

## Pixi task commands

| Command | What it does | Speed |
|---------|-------------|-------|
| `pixi run build-EP` | Full SuperBuild: ITK + VTK + ANTs + BRAINSTools | ~20 min first time |
| `pixi run build` | Inner BRAINSTools only (reuses EP artifacts) | Seconds |
| `pixi run test` | CTest with slow-test exclusions matching CI | Minutes |
| `pixi run lint` | ruff + black check | Seconds |
| `pixi run format` | ruff + black auto-fix | Seconds |
| `pixi run pre-commit-install` | Install all git hook stages | Seconds |
| `pixi run clean` | `git clean -fdx` (preserves `.claude/` and `DartConfiguration.tcl`) | Seconds |

Debug variants: `build-EP-debug`, `build-debug`, `test-debug`.

## Trigger-or-fall-through cascade

Tasks use pixi `outputs` to skip phases that are already done:

```
pixi run test
  └─ depends-on: build (inner only)
       └─ depends-on: build-EP (skipped if CMakeCache.txt exists)
            └─ depends-on: configure (skipped if CMakeFiles/ exists)
```

On a fresh checkout, `pixi run test` runs the full pipeline. After EPs are built, it falls through to inner build + test only.

## Composable environments

| Environment | Features | Use case |
|-------------|----------|----------|
| `cxx` | dev + cxx | C++ development (cmake, ninja, ccache + build tasks) |
| `autoworkup` | autoworkup | Python pipeline (SimpleITK, nipype, docopt, pytest) |
| `lint` | lint | Code quality (black, ruff) |
| `pre-commit` | pre-commit | Git hook management |

## Test plan

- [ ] `pixi install` creates environment successfully
- [ ] `pixi run -e cxx configure` configures the SuperBuild
- [ ] `pixi run -e cxx build-EP` builds all EPs + inner project
- [ ] `pixi run -e cxx build` rebuilds inner project only (fast path)
- [ ] `pixi run -e cxx test` runs CTest with exclusions
- [ ] `pixi run -e lint lint` checks Python code style
- [ ] `pixi run -e pre-commit pre-commit-install` installs hooks
- [ ] Verify `AutoWorkup/requirements*.txt` removal doesn't break anything

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6441624cf489`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.