# Issue

**Title:** Improved ExplicitTPM API and method semantics (now with array methods for free)

## Description

Now that the current state of both branches is reasonably clean, and before (a) introducing xarray as the base array type and (b) before divergence increases, I would like to bring these changes (and conflicts) to the table and possibly merge.


```sh
feature/iit-4.0 $  py.test -k 'not test_relations' -W ignore::UserWarning
[...]
104 failed, 579 passed, 37 skipped, 27 deselected, 2 xfailed, 23 errors in 88.10s (0:01:28)
```

```sh
feature/tpm-class $  py.test -k 'not test_relations' -W ignore::UserWarning
[...]
103 failed, 580 passed, 37 skipped, 27 deselected, 2 xfailed, 23 errors in 75.63s (0:01:15)
```

 includes a workaround for the issue I experienced with parallel evaluation, reproducible using Matteo's example:

```python3
import pyphi

k = 4
n = 7

weights = pyphi.network_generator.weights.nearest_neighbor(n,.5,.5)
state = (0,)*n
network = pyphi.network_generator.build_network([pyphi.network_generator.ising.probability]*n,weights,temperature=1/k)
subsystems = [pyphi.Subsystem(network,state,nodes=nodes) for nodes in pyphi.utils.powerset(range(n),nonempty=True)]
sias = [pyphi.new_big_phi.sia(subsystem) for subsystem in subsystems]
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e050e210db99`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.