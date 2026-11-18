# Issue

**Title:** corenrn permute for reports

## Description

### Context

Until now, corenrn reports were not really addressing corenrn permutations. They were not tested too since cell_permute is hardcoded to 0 in neurodamus. 

### Scope

This small pr fixes this to the root (where possible). 
- `compartment sets report`: in this case the report passes manually the node indexes. At the loading moment `NrnThread` is empty and I cannot do the node conversion on the spot (@nrnhines if you know of a better way I would actually prefer to permute immediately, when I load this file. I mean in `report_configuration_parser.cpp`. Let me know if you want a zoom call). For this reason the permutation is done in `get_compartment_set_vars_to_report`
- **all the other reports**: use `cell_mapping`. We apply the permutation as soon as we load the indexes in memory thus nobody can uses stale values. This is done largely in `phase3.cpp`. 

### Tests

This was already successfully tested manually in neurodamus for all the reports (lfp included). 

- [ ] run tests with cell_permute 1 once the option can be passed to neurodamus 

### Note

This pr does not block nor is blocked by the neurodamus side. Current neurodamus has hardcoded `cell_permute = 0` and this pr should not change anything if cell_permute is 0

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `71cb81761a2b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.