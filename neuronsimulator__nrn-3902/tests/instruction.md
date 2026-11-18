# Issue

**Title:** nrnpy_rangepointer: use the requested layer for extracellular variables

## Description

From Python, `seg.vext[i]` and `seg._ref_vext[i]` reach extracellular layer 0 whatever `i` is. On released 9.0.2, with `nlayer_extracellular(2)`, `seg.vext[1] = 2` from Python sets HOC's `vext[0]` (HOC then reads `vext[0] = 2, vext[1] = 0`), and Python reads both `seg.vext[0]` and `seg.vext[1]` as layer 0.

Cause: the `EXTRACELL` branch of `nrnpy_rangepointer` (`cabcode.cpp`) calls `nrn_vext_pd(s, 0, nd)` instead of using its `idx` argument. `nrn_rangepointer`, the HOC counterpart, already passes the index. One-line fix. It only shows up with more than one layer; the existing extracellular test (`test_nlayer.py`) only reads `vext[0]`.

Test: `test/unit_tests/hoc_python/test_vext_layers.py`, with two layers:
- writes `vext[1]` from Python and checks HOC sees it in layer 1 with layer 0 untouched;
- reads a HOC write to layer 0 back from Python;
- reads and writes through `_ref_vext[1]`.

It fails on the unfixed code (the Python write lands in layer 0) and passes here. Locally the pytest, pytest_coreneuron, hoctests and `unit_tests::python_unit_tests` groups pass (47/47).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9cb05746c4ec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.