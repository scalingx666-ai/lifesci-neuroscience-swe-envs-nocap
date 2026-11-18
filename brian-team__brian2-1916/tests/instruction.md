# Issue

**Title:** Restore Cython rate-monitor checkpoints with recorded array sizes

## Description

. A nonempty Cython `PopulationRateMonitor` saves its data with size zero, so restoring the network fails:

```python
from brian2 import *
prefs.codegen.target = "cython"
G = NeuronGroup(2, "v : 1", threshold="True", reset="")
M = PopulationRateMonitor(G)
net = Network(G, M)
net.run(3 * defaultclock.dt)
net.store()
net.restore()
```

Before: `ValueError: could not broadcast input array from shape (3,) into shape (0,)`. After: restores all three samples and continues recording. Reproduced on the 2.11.0 wheel and current master.

Synchronize the rate monitor's variable sizes after each run, as the other monitors already do. Restore dynamic arrays from the saved values' actual dimensions, so existing checkpoints with stale sizes also load. The checkpoint structure stays unchanged.

Checked memory/disk saves, repeated continuation, subgroup rates and legacy zero-size metadata with both NumPy and Cython targets. The shipped 135-neuron Maass model now resumes exactly from both a fresh disk checkpoint and an actual file written before this fix. All 43 recorded simulation arrays remain identical to the original uninterrupted run. The full network/monitor suites pass: 130 tests with NumPy, 129 with Cython plus one skip (one standalone-only case deselected in each). C++ standalone subgroup rates/times are unchanged, and the project's pre-commit hooks pass.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a88d9f15fb88`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.