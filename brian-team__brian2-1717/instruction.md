# Issue

**Title:** Eliminate Python overhead from synapses_create_array and synapses_create_generator templates _resize() and _update_synapse_numbers() methods

## Description

### What was the problem?

In our larger effort to remove python indirection from cython runtime , there were some changes left for the synapses_create_array and synapses_create_generator templates. 

Every time we created new synapses, the fast Cython code had to stop and call back to Python (`_owner._resize()` and `_owner._update_synapse_numbers()`). This Python step was in charge of resizing all the synaptic arrays (like weights, delays, etc.) and updating counters like `N_incoming`. This back-and-forth between Cython and Python is super slow and was a real bottleneck.

### What's the fix?

I've moved all that logic directly into the Cython templates, just like how standalone mode already does it.

This means when you create synapses now:

* All the registered arrays get resized immediately in C++ (`varname_ptr.resize(...)`).
* The `N_incoming`, `N_outgoing`, and total `N` counters are updated right there in Cython.
* The `synapse_number` (for multisynaptic connections) is also calculated in Cython.

Note : This is still WIP as I need to verify a few cases and also do the changes ofr the synapses_create_generator template

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `83aa4d17b5df`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.