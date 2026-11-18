# Issue

**Title:** Fix empty neuron.__version__ when git describe fails in shallow clones

## Description

## Summary

- Release dry-run wheels use a depth-1 checkout and do not create the release tag, so `git describe` fails while `.git` still exists.
- `add_cpp_git_information` left `GIT_DESCRIBE` empty in that case, so `neuron.__version__` (`nrnversion(5)`) was `""` and ModelDB CI failed on `runmodels --workdir=$nrn_ver` (`mkdir('')`).
- Fall back to `PROJECT_VERSION` when describe fails/empty so dry-run and ship wheels get the same non-empty string (e.g. `9.0.2`).
- Assert non-empty `__version__` in `test_wheels.sh`.

## Test plan

- [ ] Wheel CI / NEURON Release dry-run: `python -c "import neuron; print(repr(neuron.__version__))"` is non-empty (e.g. `'9.0.2'`)
- [ ] ModelDB V2 no longer fails with empty workdir after installing dry-run wheels
- [ ] Ship path (`upload=true`, tag checkout) still reports the tag version via describe

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7ca2dbbc80cd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.