# Issue

**Title:** [DOC] Update docs

## Description

This pull request adds a comprehensive comparison document highlighting how `netneurotools` differs from other toolboxes, introduces a new gallery example demonstrating network assortativity and null models, and improves documentation structure and requirements for better usability and reproducibility. The most important changes are grouped below.

Documentation enhancements:

* Added a detailed `comparison.rst` document outlining the unique features of `netneurotools` compared to other toolboxes, including its modularity, original methods, optimized implementations, and compatibility with other packages.
* Updated documentation structure by including `comparison` in the main index and capitalizing the installation section title for consistency.

Gallery and example improvements:

* Introduced a new example (`plot_assortativity.py`) demonstrating network assortativity analysis and generation of distance-preserving surrogate connectomes, providing a practical workflow for null hypothesis testing in brain network analysis.
* Configured Sphinx Gallery to use the correct examples directory and output location, ensuring examples are properly integrated into the documentation.

Requirements update:

* Added `neuromaps` to the documentation requirements to support new example workflows involving spatial and surface data.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e42c3f6ce8f6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.