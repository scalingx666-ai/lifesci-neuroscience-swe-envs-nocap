# Issue

**Title:** nmodl: emit NEURON BEFORE/AFTER blocks

## Description

.

The NEURON NMODL C++ backend parsed BEFORE and AFTER blocks and then dropped them, so a mechanism such as the rxd `beforestep_callback` compiled and did nothing. nocmodl and the CoreNEURON visitor already emitted them.

`CodegenNeuronCppVisitor` now emits one `nrn_bamech_t` callback per block and registers it with `hoc_reg_ba`. `nrn_ba` already loops the mechanism list. All five kinds `hoc_reg_ba` accepts share that one body. The argument is `BAType` in `neuron/ba_reg.h`, the same two-part sum nocmodl and CoreNEURON already used (`Before` 10 or `After` 20, plus `Breakpoint` 1, `Solve` 2, `Initial` 3, or `Step` 4). Generated code and `hoc_reg_ba` include that header. nocmodl and both NMODL backends emit the names:

- BEFORE BREAKPOINT is `Before + Breakpoint` (11)
- AFTER SOLVE is `After + Solve` (22)
- BEFORE INITIAL is `Before + Initial` (13)
- AFTER INITIAL is `After + Initial` (23)
- BEFORE STEP is `Before + Step` (14)

Translating those sums into the `bamech_[]` slots is unchanged.

Voltage is read through the existing `v_unused` RANGE slot, assigned from the node the same way `nrn_init` does. That slot keeps the NEURON and CoreNEURON RANGE layouts the same size. Removing it is a separate change.

`LAG` inside those blocks is translated the way nocmodl does, keyed on that slot, so `vlag.mod` still compiles once BEFORE STEP is emitted.

`compare_data` now raises when BEFORE STEP recorded no samples. It used to return 0, which hid a dropped block.

CI is unchanged. `NRN_ENABLE_NMODL` stays off, so neuron-ci still translates NEURON mechanisms with nocmodl. CoreNEURON jobs already build `nmodl` and run `testcodegen`, which covers the new string checks. Turning the NEURON backend on in CI belongs in a later PR: a local `ctest -j` with `NRN_ENABLE_NMODL=ON` still fails six tests that are not missing blocks (`mcna` counters, a `BBSaveState` abort, `cv.states` length, a NONLINEAR residual, a KSChan trace, and `external_nrntest`). `order1` in that last suite prints the five blocks and matches the nocmodl reference until a later CVODE step.

## Test plan

- [x] `testcodegen "[ba]"` (36 assertions), including all five `hoc_reg_ba` names and the LAG line
- [x] `ninja` with `NRN_ENABLE_NMODL=ON`, including `vlag.mod`
- [x] `hoctests::test_beforestep_py`
- [x] `example_nmodl::test_vlag_py`
- [ ] `test/coreneuron/test_ba.py` (`ba0` / `ba1`). Needs `NRN_ENABLE_CORENEURON=ON` and was not run here

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `11b0f51c3775`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.