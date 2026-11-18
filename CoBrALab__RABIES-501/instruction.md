# Issue

**Title:** Print the help message when no processing stage is provided

## Description

## Problem

Running the container (or `rabies`) with no arguments crashes instead of showing the help message:

```
$ ./app-0.6.1.sif
Traceback (most recent call last):
  File "/opt/conda/bin/rabies", line 7, in <module>
    exec(compile(f.read(), __file__, 'exec'))
  File "/home/mambauser/RABIES/scripts/rabies", line 3, in <module>
    execute_workflow()
  File "/home/mambauser/RABIES/rabies/run_main.py", line 50, in execute_workflow
    if not os.path.isdir(opts.output_dir):
AttributeError: 'Namespace' object has no attribute 'output_dir'
```

## Cause

The subparsers added in `get_parser()` are not `required`, so when no processing stage is given `opts.rabies_stage` is `None` and none of the stage-specific arguments — including `output_dir` — are set on the namespace. `read_parser()` handles this fine (all three branches are skipped), but `execute_workflow()` then dereferences `opts.output_dir` unconditionally.

This is a regression. The case used to be handled by a `try`/`except AttributeError` wrapped around the `output_dir` absolute-path conversion, added in 08e1a30 (``). That `try`/`except` was dropped in 1141f7a when path handling was reworked to iterate over all `pathlib.Path` attributes, so nothing catches the missing attribute any more. The crash is therefore present in 0.6.0 and 0.6.1.

## Fix

Check `opts.rabies_stage` explicitly right after parsing, and print the help message as before. This restores the pre-0.6.0 behaviour without depending on an `AttributeError` being raised at the right place.

```python
if opts.rabies_stage is None: # no processing stage was selected, print the help message instead
    parser.print_help()
    return
```

## Verification

Against this branch, in a venv with the parser's dependencies installed:

- `execute_workflow([])` prints the full help message and returns cleanly — previously `AttributeError`.
- `read_parser(get_parser(), ['preprocess','bids_in','out_dir'])` still yields `rabies_stage = preprocess`, `output_dir = out_dir`, confirming the normal stage paths are untouched.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_019xu2Vu3c4tRMAywEp8yVTr

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6186af29ba1a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.