# Issue

**Title:** [Feature] Merging "Total spiking probability edges" into elephant

## Description

**Summary:**
TSPE enables the classification of excitatory and inhibitory synaptic effects using a connectivity estimation. It uses the cross-correlation of spiketrains at different delays combined with specially designed Edge-Filters to distinguish between excitatory and inhibitory connections.

Related issue: #557

**Currently implemented:**

- [x] generate_filter_pairs
- [x] normalized_cross_correlation
- [x] total_spiking_probability_edges
- [x] get_connectivity_matrix
- [x] normalization function inside tspe
       Not sure if working correctly.

**Current tests implemented for:**

- [x] generate_filter_pairs (Fairly Basic Test)
- [x] normalized_cross_correlation (Fairly Basic Test)
- [x] total_spiking_probability_edges 
       The test is implemented, but currently not pushed because I need help where to put the evaluation data

**What remains to be done:**
- [x] Upload evaluation data to data-repository
- [x] Validate test-cases
- [x] Proper documentation for:
    - [x] total_spiking_probability_edges
    - [x] Module documentation?
- [x] Add reference to the Elephant bibliography file

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e2df1b96a4d8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.