# Issue

**Title:** Guard the launch-script search against an absolute benchmark_script

## Description

`_magpie_script_from_recipe()` feeds the recipe's `benchmark_script` straight into
`Path.rglob()`. When the orchestrator records it as a full path rather than a bare
filename, `rglob` raises `NotImplementedError` ("Non-relative patterns are
unsupported"). That is **not** an `OSError`, so the `try/except` around it does not
catch it and the exception escapes `apply_bench_launcher()` entirely.

I have seen this case while using Hyperloom on a pytorch model (custom framework mode).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `19d59a32a58a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.