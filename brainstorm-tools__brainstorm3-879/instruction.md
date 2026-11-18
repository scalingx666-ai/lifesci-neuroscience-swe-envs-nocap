# Issue

**Title:** FEM: Extract layers from FEM mesh

## Description

Add option for FEM layer extraction into process_fem_mesh [as interactive no need a process]

Add FEM tissue layer extraction into process_fem_mesh as ExtractFemlayers. The new workflow provides a GUI to select FEM layers, process the FEMFile, saves a uniquely  it in the database.

This feature is relevant for extracting specific FEM tissues from a larger mesh with the same vertices and elements used for the computation, and then to perform postprocessing of the results. [LF, TDCS currents/voltage and more]

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0726e1dcfa33`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.