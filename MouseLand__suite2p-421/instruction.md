# Issue

**Title:** Registration Benchmark script added

## Description

PR addresses #403. 

- Uses argparse instead of getopt
- Metrics script relies on CLI script in `suite2p.__main__`
- script now prints averages/max of offset scores when run

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e803dbc53781`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.