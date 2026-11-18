# Issue

**Title:** Small fixes and new warning for Neurons classes.

## Description

Small fixes and new warning for Neurons classes.

**Fixes:**
- Added an error in `VectorCells` init if class is initialized directly.
- Removed default value of `None` for `Other_Agent` in `AgentVectorCells` init, as `None` is not an allowed value. 
- Raised an error in ObjectVectorCells if there are no objects in the environment.

**New warning added:**
- Added a warning in classes where the number of neurons can be changed internally, overriding `params["n"]`. This is to avoid confusion when a user requests 10 neurons, but ends up with 64, for example. The added code specifically checks whether `n` was passed as a parameter, and will not produce a warning if `n` was added in from a default parameter dictionary.

**New warning examples:**
1. In the simple case that applies to `HeadDirectionCells` in 1D environments and to `SpeedCell`, if you run something like:
```
from ratinabox import Agent, Environment, SpeedCell

Env = Environment(params={"objects": [[0.5, 0.5]]})
Ag = Agent(Env)
SpeedCell(Ag, params={"n": 3})
```
you get: 

```UserWarning: Ignoring 'n' parameter value (3) that was passed for SpeedCell. Only 1 speed cell is needed.```

2. In the slightly more complex case that applies to `VectorCells` and its child classes, if you run something like

```
from ratinabox import Agent, Environment, FieldOfViewOVCs

Env = Environment(params={"objects": [[0.5, 0.5]]})
Ag = Agent(Env)

FieldOfViewOVCs(Ag, params={"object_tuning_type": "random", "cell_arrangement": "diverging_manifold"})
FieldOfViewOVCs(Ag, params={"object_tuning_type": "random", "cell_arrangement": "random", "n":10})
```
then there's no warning. In the first case, because you didn't specify an `n` value [1] and in the second case, because the `n` value is not changed. 

However, if you run 
```
from ratinabox import Agent, Environment, FieldOfViewOVCs

Env = Environment(params={"objects": [[0.5, 0.5]]})
Ag = Agent(Env)
FieldOfViewOVCs(Ag, params={"object_tuning_type": "random", "cell_arrangement": "diverging_manifold", "n": 10})
```
you get: 

```UserWarning: Ignoring 'n' parameter value (10) that was passed, and setting number of ObjectVectorCell neurons to 58, inferred from the cell arrangement parameter.```

[1] To ensure that no superfluous warning is produced in this case, I had to create an extra attribute `_warn_n_change` that can be set in a child class. This allows the init of `VectorCells` to know whether `n` was actively passed by the user or was added to `params` at some point during the initialization chain (e.g., from a child class' default parameters).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ba679c41ccbe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.