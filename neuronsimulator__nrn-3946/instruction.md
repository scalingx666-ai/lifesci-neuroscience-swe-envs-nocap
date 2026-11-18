# Issue

**Title:** rxd: neuron.crxd submodules are the neuron.rxd modules

## Description

#2893 fails `rxdtests` on the ubuntu-22.04 and macOS-15-intel gcc-12 jobs: `hh`, `hh_cvode`, `hh_morph`, `hh_param`, `hh_param_cvode` and `IraHH` stop with

```
RxDException: -(v+40.0) of type <class 'neuron.rxd.rxdmath._Arithmeticed'> is not a valid _Arithmeticed object.
```

Those six are the rxdtests that use `from neuron.crxd.rxdmath import ...`. `neuron.crxd` aliases only the package, so that import loads a second copy of `rxdmath` with its own `_Arithmeticed`. `v` comes from one copy and `vtrap` from the other. master hid this because `_ensure_arithmeticed` wrapped anything it didn't recognize.

This aliases the loaded `neuron.rxd.*` submodules under `neuron.crxd.*` as well, so there is one copy.

Testing:
- New `test_crxd_rxdmath_is_rxdmath` fails without the change and passes with it.
- With the change, all six tests run, and their output files are byte-identical to the code before #2893.
- That was a local build with RX3D off, so this PR's CI is the first full run.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0f04355063af`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.