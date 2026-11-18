# Issue

**Title:** [update] Refine installation instructions and improve docstring formatting

## Description

This pull request includes updates to the documentation, codebase, and dependency management for the BrainPy project. The changes focus on improving clarity, updating installation instructions, and ensuring consistency with the project's recent rewrite based on the BrainState framework.

### Documentation Updates:

* Updated the license badge in `README.md` to use a GNU GPLv3 badge and removed references to OpenI. Added a note about BrainPy's rewrite based on BrainState and updated the Python version requirement to 3.10. [[1]](diffhunk://#diff-b335630551682c19a781afebcf4d07bf978fb1f8ac04c6bf87428ed5106870f5L9-R30) [[2]](diffhunk://#diff-b335630551682c19a781afebcf4d07bf978fb1f8ac04c6bf87428ed5106870f5R64)
* Simplified installation instructions in `docs/index.rst` by removing dependency links for GPU and TPU installations and added a note about the BrainState rewrite. [[1]](diffhunk://#diff-8d068e8797e88947c320f79e856c3e16a72b730124a8f9d7031e2c4680dfa534L20-R32) [[2]](diffhunk://#diff-8d068e8797e88947c320f79e856c3e16a72b730124a8f9d7031e2c4680dfa534R114-R117)
* Removed the installation section from the quickstart table of contents in `docs/index.rst`.

### Codebase Improvements:

* Updated docstrings across multiple files (`lowdim_analyzer.py`, `lowdim_bifurcation.py`, `random_conn.py`) to use raw string literals (`r"""`) for better rendering of mathematical expressions in documentation. [[1]](diffhunk://#diff-c4f4373ce544c9ddd365265eacac08fee3e90f337f35130c051f5001e229e5b4L290-R290) [[2]](diffhunk://#diff-c4f4373ce544c9ddd365265eacac08fee3e90f337f35130c051f5001e229e5b4L419-R419) [[3]](diffhunk://#diff-c4f4373ce544c9ddd365265eacac08fee3e90f337f35130c051f5001e229e5b4L528-R552) [[4]](diffhunk://#diff-c4f4373ce544c9ddd365265eacac08fee3e90f337f35130c051f5001e229e5b4L1040-R1040) [[5]](diffhunk://#diff-d511d4d0e97e7bb2dabab171679e12c1931dcaa61b747fe0192afc9832063501L175-R175) [[6]](diffhunk://#diff-99a5180bfc03c923cdf8598896f48e45e2684ad8c99f087caa072482bd3a1e0dL514-R514) [[7]](diffhunk://#diff-99a5180bfc03c923cdf8598896f48e45e2684ad8c99f087caa072482bd3a1e0dL658-R658)

### Dependency Management:

* Removed unused `dependency_links` from `setup.py` and corrected the TPU extras requirement to include `brainstate[tpu]` instead of `brainstate[cuda12]`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ee942e9bc73d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.