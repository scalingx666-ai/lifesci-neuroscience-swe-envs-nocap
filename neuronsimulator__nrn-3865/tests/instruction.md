# Issue

**Title:** cvode: let extra_scatter_gather take a HOC function

## Description

> **Stacked on #3862.** The first commit here is that PR; only the second is this change. It will shrink to one commit once #3862 merges. The dependency is real rather than cosmetic — the flush loop tests `execute()`'s return, which only has a single meaning once both of its branches agree on one.

`CVode.extra_scatter_gather` has only ever accepted a PythonObject:

```cpp
check_obj_type(o, "PythonObject");
```

and fires it by calling `neuron::python::methods.hoccommand_exec` directly. It is the one callback that cannot use the register-a-name route the others do, so a non-Python host cannot register a scatter or gather callback at all, and a Python-disabled build cannot use the feature even though nothing about it is inherently Python.

## The change

Accept either a PythonObject or a HOC function. Both get wrapped in a `HocCommand`, the way `FInitializeHandler` already does it, so the HOC path runs through `HocCommand`'s `hoc_obj_run` branch and never touches the methods table.

- Storage moves from `vector<Object*>` to `vector<HocCommand*>`.
- `extra_scatter_gather_remove` matches on the command string for the HOC case and on `pysame` for the Python case.
- `nrn_extra_scatter_gather` fires through `HocCommand::execute` rather than reaching into the methods table itself.

## History

You asked for this in June and I never put it up, which was my miss. What made it worth revisiting rather than just filing late is that the original patch had to carry a wart: `HocCommand::execute` returned opposite senses for its two branches, so the flush loop had to ask which kind of callback it was holding before it could test the result. #3862 removes that, and this becomes the straightforward version it should have been.

## Test

Covers registration and firing for both callback kinds, and removal of each without disturbing the other.

`clang-format` 12.0.1 clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2d2e73b171f2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.