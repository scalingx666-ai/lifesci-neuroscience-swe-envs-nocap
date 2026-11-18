# Issue

**Title:** Fix the -e flag of moabb.run splitting its value into characters

## Description

`-e`/`--evaluations` is declared `type=list`, so argparse runs `list()` over the string you pass it. `-e WithinSession` reaches `benchmark()` as thirteen seperate letters and the run stops on `KeyError: 'W'`, after it's already printed the paradigms it was about to work through. Every other value does the same, so there isn't a spelling of `-e` that works.

`nargs="+"` hands it the list of names the Python API already takes (`benchmark(evaluations=["WithinSession"])`). The help text went with it, since it was telling you to pass a list and had the options butted up against the "By default" sentence with no space. I've not put `choices=` on the argument, so a name that isn't one of the three still gets as far as `benchmark` before it fails, same as today.

Most of the diff is the new test file. There was nothing covering `run.py` at all, which is probaly how this sat there since #264 - CI calls the runner without `-e`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a2dcaca16ae6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.