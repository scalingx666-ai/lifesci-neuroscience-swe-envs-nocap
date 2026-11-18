# Issue

**Title:** Add codegen.synapse_connect_target preference

## Description

### Description
This PR implements the `codegen.synapse_connect_target` preference discussed in #1729. 

This preference allows users to override the code generation target specifically for synaptic connection statements. This is particularly useful for interactive development (e.g., on Windows with MSVC), where the overhead of compiling C++ code for simple connections is significant (~20s) compared to the Numpy implementation (<1s).

### Implementation
* Added `synapse_connect_target` to `brian2/codegen/_prefs.py` (defaults to `None`).
* Updated `Synapses._add_synapses_generator` and `Synapses._add_synapses_from_arrays` to use this preference as a fallback in `create_runner_codeobj`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a08118aad0a2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.