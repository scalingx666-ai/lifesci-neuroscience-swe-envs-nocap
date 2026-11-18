# Issue

**Title:** MultiModel continue run

## Description

`MultiModel` now able to accommodate continuous runs with `model.run(continue_run=True)`. It'll set initial state from previous run(s).
Naturally, one can change parameters between runs, and, moreover, one can also change (noise) inputs in between runs. 
E.g. one can start the ALN model with no noise for 2 seconds, then continue with Ornstein-Uhlenbeck and finally end it with sinusoidal input. Of course, one can change parameters in between.

Moreover, one last addition: some shortcuts for ease of access:
`model.num_state_variables` - return total number of state variables in the `MultiModel`
`model.num_noise_variables` - return the total number of variables that accept noise (e.g. in ALN node it's 2)
`model.noise_input` - return or set the full input to the model (list of length `num_noise_variables`)

Therefore, changing (noise) inputs for `MultiModel` was never easier:
```python
mm = MultiModel(...)
# list of `Input` classes of the same length as original list, i.e. mm.num_noise_variables
mm.noise_input = [stim.ZeroInput(), stim.OrnsteinUhlenback(...), ...]
# set all to the same input
mm.noise_input = [stim.ZeroInput()] * mm.num_noise_variables
# or change just one
mm.noise_input[1] = stim.ZeroInput()
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `696b099ed99f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.