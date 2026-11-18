# Issue

**Title:** Update version to 2.7.1 and refactor Dynamics class: enhance input ha…

## Description

## Summary by Sourcery

Refactor core state Dynamics class to support flexible current and delta input management, update Neuron and Synapse to use the new Dynamics base, adjust projection alignment logic to the new API, remove outdated example notebooks, and bump package version to 2.7.1.

New Features:
- Add API to register and sum current inputs (add_current_input, sum_current_inputs).
- Add API to register and sum delta inputs (add_delta_input, sum_delta_inputs).
- Introduce get_input method to retrieve registered inputs by key.
- Add align_pre method for chaining execution order of dynamics modules.

Enhancements:
- Refactor Dynamics to inherit from brainstate.nn.Dynamics with unified input labeling.
- Update Neuron and Synapse classes to subclass the new Dynamics and revise import paths in examples.
- Refactor projection alignment functions to use the new Dynamics class and public before_update hooks.

Documentation:
- Remove obsolete docs_state example notebooks.

Chores:
- Bump version to 2.7.1.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `94cb3298c2ba`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.