# Issue

**Title:** neuralbench: accept the study names --help lists in --dataset

## Description

.

`neuralbench --help` lists each task's datasets by study name, but `--dataset` only matched file stems in the task's `datasets/` folder. As a result, the task's default study could never be selected by name, and neither could most of the listed names. Only about half of the variants have a stem that is just the lowercased study name, and many differ entirely (e.g. `wei2022a` holds `Wei2022BeetlA`, `arico2013` holds `Arico2014Influence`).

- `--dataset` now accepts a study name or a file stem, in any case, resolved through one registry lookup that also backs the `--help` list and `get_available_datasets`. Naming the default study runs the base `config.yaml`. The "Unknown dataset" error lists the same names as `--help`.
- `fmri/image/datasets/Chang2019Bold5000.yaml` is removed. It merged to exactly the task's default config, so `--dataset all` ran BOLD5000 twice.
- The `--help` usage line shows `MODEL` / `WRAPPER` / `TASK` placeholders instead of spelling out every choice (twice, for tasks). Model and wrapper choices are listed in their help text instead.
- Docs: six task pages used the nonexistent `--datasets` flag, `motor_imagery.rst` used a missing stem, and the multi-dataset task count in `full_benchmark.rst` was stale. The `--dataset` help example (`steyrl2016`, which doesn't exist) is replaced with a real one.

The added test checks that every name `--help` lists resolves, in any case, and that the default resolves to the base config.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `19949cbd4d3d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.