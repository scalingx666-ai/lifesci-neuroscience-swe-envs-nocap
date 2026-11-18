# Issue

**Title:** Add functions to compute max_rates and intercepts

## Description

**Motivation and context:**

Each neuron type has a function that computes gains and biases given max_rates and intercepts.  This adds a function to each neuron type that does the inverse, computing max_rates and intercepts from gains and biases.

I don't love the name `max_rates_intercepts`, given the awkward double `_`, but I went with that for symmetry with `gain_bias`.

**How has this been tested?**
Added a new unit test, see `test_neurons.py:test_gain_bias`

**How long should this take to review?**
- Average (neither quick nor lengthy)

**Types of changes:**
- New feature (non-breaking change which adds functionality)

**Checklist:**
<!--- Go over all the following points. Put an `x` in all the boxes that apply. -->
<!--- If a box is not applicable, please justify below the checklist. -->
<!--- If you're unsure about any of these, don't hesitate to ask. -->
<!--- We're here to help! -->

- [x] I have read the **CONTRIBUTING.rst** document.
- [x] I have updated the documentation accordingly.
- [x] I have included a changelog entry.
- [x] I have added tests to cover my changes.
- [x] All new and existing tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4aeae47a27e4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.