# Issue

**Title:** Make pairwise spectral Granger opt-in

## Description

`method=None` computed `pairwise_spectral_granger_prediction`, contradicting the cookbook ("Directed measures are opt-in by name") and dominating the default set's cost: on the benchmark's time-resolved few-observation case the whole default set took 183 s while pairwise Granger alone took 203 s.

- `DEFAULT_METHODS` now holds only undirected measures (10); every directed measure is requested by name.
- `fourier_connectivity` no longer needs to drop two-sided-only measures from its default set for one-sided input; that filter is removed, and a test pins that no default is directed or requires a two-sided spectrum.
- CHANGELOG: migration row (2.x's `method=None` computed every public measure outside a short exclusion list, including pairwise Granger), updated Changed entry, and reworded performance numbers that described the old eleven-measure set.
- `benchmarks/bench_default_measures.py` still times and parity-checks pairwise Granger (Wilson kernels change often); baselines saved earlier compare key for key (verified against a master baseline: PASS at 1e-12).

Validation: full suite, doctests, ruff, and mypy pass locally.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `880edfe1ec26`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.