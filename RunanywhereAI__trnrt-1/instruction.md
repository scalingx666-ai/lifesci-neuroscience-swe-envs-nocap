# Issue

**Title:** verify: graph-equivalence gate, no-trace scan, notices, results

## Description

- `tools/graph_equiv.py`: compares two AOT captures graph by graph: HLO (names, ids, metadata and kernel package prefixes normalized; the rest byte-identical) and each NKI kernel's body (instruction JSON without debug info). Self-tests in `tests/test_graph_equiv.py`, including the positive control: one changed kernel constant differs exactly the graph that calls it.
- `tests/test_no_trace.py`: scans tracked files, paths and commit history for names that must not appear in the published tree; a planted hit must trip it.
- `THIRD_PARTY_NOTICES.md` with `tests/test_third_party_notices.py`: every file carrying a third-party header must be listed, and every listed path must exist.
- `docs/RESULTS.md`: measured serving results.
- `.gitignore`: drops a local tool path.

The real captures (130 graphs per side) run on an x86 host with the Neuron SDK; this PR carries the tool and its self-tests.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a3da0795073d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.