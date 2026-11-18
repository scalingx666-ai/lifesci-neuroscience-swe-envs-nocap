# Issue

**Title:** Restore recording of default synaptic delays

## Description

`Synapses.delay` still exposes the default presynaptic delay, but its entry is missing from `Synapses.variables`. `StateMonitor` therefore raises `KeyError: 'delay'`, as reported in #1289:

```python
from brian2 import *
prefs.codegen.target = "numpy"
g = NeuronGroup(2, "v : 1", threshold="False", reset="")
s = Synapses(g, g, on_pre="v_post += 1")
s.connect()
s.delay = "(i + j)*ms"
m = StateMonitor(s, "delay", record=True)
Network(g, s, m).run(ms)
```

Add a reference to the existing default `pre` pathway's delay, alongside the qualified pathway references. No array is copied. Scalar and per-synapse delays, separate post delays and additional named pathways have regression coverage.

Validation uses Python 3.13 on Linux: the monitor/synapse suites pass for NumPy and Cython, independent monitor/synapse tests pass, and the affected C++ standalone monitor tests pass. A separate native delayed-spike simulation now supports all twelve formerly failing monitor configurations across NumPy/Cython/C++; delivery histories match direct event-time sums exactly, and all twelve pathway-monitor controls remain unchanged. Project pre-commit hooks pass. Other platforms, OpenMP and the complete project suite were not run.

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9f803d0c8190`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.