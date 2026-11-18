# Issue

**Title:** CI: Test-braindecode runs braindecode's MOABB tests and examples instead of its whole suite

## Description

`Test-braindecode` has been red since 25 Oct. Six of its runs, including the 1 Nov run (41341915425), stopped 10-14 min into `pytest` with "The runner has received a shutdown signal". The cause is memory. The step runs braindecode's whole default suite, about 8.3k tests covering its model zoo, with `-n auto` on the 16 GB `ubuntu-latest` runner. Each xdist worker grows to 4-7 GB and does not shrink.

We replayed the step's commands in a 4-CPU pod with a 16 GiB limit:
- `-n 4`: 7 workers were OOM-killed.
- `-n 2`: 1 worker was killed.
- glibc malloc tunables did not help.
- With 64 GiB the same suite passes (7781 passed).

The 29 Oct failures, in the TorchScript tests of the filter-bank models on torch 2.15, were fixed in braindecode by braindecode/braindecode#1501.

This PR keeps only the MOABB integration in the job:
- `pytest test/ -n 2 -k moabb`: braindecode's MOABB tests (6 passed and 3 skipped in 18 s in our replay);
- braindecode's four MOABB examples: `plot_moabb_dataset_example`, `plot_bcic_iv_2a_moabb_trial`, `plot_bcic_iv_2a_moabb_cropped` and `plot_moabb_benchmark` (about 2 min in total in our replay);
- `timeout-minutes: 60` on the job.

braindecode's own CI still runs its full suite. On MOABB develop, braindecode 1.8.1 and braindecode master gave the same results for MOABB's tests, braindecode's MOABB tests and these four examples.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bed9f0fa1b9c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.