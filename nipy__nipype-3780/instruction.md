# Issue

**Title:** FIX: Raise on nonzero return codes from CommandLine interfaces

## Description

`CommandLine` interfaces now raise as soon as the command's return code is not in `correct_return_codes`. .

An earlier revision was too narrowly focused on the case in #1603 (a command killed by a signal). This revision checks only for a nonzero status. The sole addition is a hedged hint when the code is negative, which by convention means termination by a signal, e.g. `Return code: -9 (possibly terminated by signal SIGKILL)`. A program can return a negative value for other reasons, so the hint is a possible cause and not a diagnosis. Positive codes (including shell-style 128+N) are not interpreted; the message instead notes that the meaning of a return code is defined by the application and points to its documentation.

**Behavior change for review:** this restores the pre-2021 behavior where a failing command raises from `run()`. Code that called a `CommandLine` interface directly, ignored the exit status, and then inspected `runtime` now gets a `RuntimeError` unless it passes `ignore_exception=True`. Nodes already ran with `ignore_exception=True`, so for workflows only the error message changes.

<details>
<summary>Root cause</summary>

Since 7244d9c9c the return-code check lived in `RuntimeContext.__exit__`, which runs after `aggregate_outputs` and, for a `Node` (`ignore_exception=True`), returns before it is reached. A command that exits nonzero, such as the OOM-killed `antsRegistration` in #1603, surfaced as a `FileNotFoundError` on its outputs and the exit status was never reported. ANTs itself exits nonzero in every memory-failure case, so nothing changes on the ANTs side.

</details>

<details>
<summary>Verification</summary>

- New tests in `nipype/interfaces/base/tests/test_core.py`: a script that kills itself raises through `run()` and through a `Node` (asserting `-9` or `137`, since the value depends on the shell); a plain `false` raises with `Return code: 1`; the hint appears, worded as "possibly", for `-9` and `-15` and not for `137` or `1`.
- `nipype/interfaces/base/tests` and `nipype/pipeline/engine/tests`: 169 passed, 9 skipped.
- No interface in the tree passes a custom `correct_return_codes`.
- `pre-commit run --all-files` clean.

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b7a4a02bd456`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.