# Issue

**Title:** Wrote component help functions for all core ngc-learn comps

## Description

Wrote a ".help()" routine for all components in:
```
ngclearn.components.neurons.graded
ngclearn.components.neurons.spiking
ngclearn.components.synapses.hebbian (including DenseSynapse in ngclearn.components.synapses)
ngclearn.components.other
ngclearn.components.input_encoders
```
Help functions return a nested dictionary containing core properties of a component, including its high-level explanation as well as information on its core dynamics (and/or plasticity if applicable) and small description of hyper-parameters. Furthermore, input and output components (and their variable names) are explained/distinguished

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `800167e3297d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.