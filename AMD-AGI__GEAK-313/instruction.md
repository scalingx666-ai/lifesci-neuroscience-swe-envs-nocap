# Issue

**Title:** Make invalid --target fall back to 'kernel' not 'wall'

## Description

The normal-path scoring default on release/v3.2.2 is already `kernel` (`--target` None -> `GEAK_SCORE_TARGET` env -> `kernel`). But an unknown/typo'd `--target` value still fell back to `wall` (`mini.py:693`), contradicting the kernel-first default and risking a silently wall-scored (host-dispatch-collapse) run.

This flips that fallback (and its warning text) to `kernel` so **every** path defaults to the GPU-only, E2E-relevant signal. Dual-signal harness still reports both wall+kernel; only the scoring choice changes.

Motivation: an E2E audit confirmed wall-only microbench wins (e.g. a 3.86x `_aiter_ops` dispatch wrapper) do not transfer to serving throughput; kernel-ms is the gate that correlates with E2E.

+2/-2, py_compile clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ff8b32e88092`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.