# Issue

**Title:** Add BrainPy citation and update documentation

## Description

This pull request includes updates to the `README.md` and documentation files to improve clarity, provide updated references, and enhance usability. The most important changes include updating references to BrainPy's ecosystem and documentation, adding citation details for the BrainPy framework, and reorganizing the API documentation structure.

### Updates to `README.md`:

* Updated the description of BrainPy's foundation to specify that it has been rewritten based on `brainstate` since August 2025.
* Replaced the outdated link to `brainpy-datasets` with a more general reference to the "brain modeling ecosystem."
* Added a detailed BibTeX citation for BrainPy, including publication details in the journal eLife, for users to reference the framework in academic work.

### Documentation improvements:

* Removed changelog links (`brainpy-changelog.md` and `brainpylib-changelog.md`) from the `docs/api.rst` file, likely to streamline the API documentation.
* Added an "Ecosystem" installation tab in `docs/index.rst` with commands for installing `BrainX` on different platforms (CPU, CUDA, TPU).
* Updated the "Learn more" section in `docs/index.rst` to include changelog links and fixed an outdated example link. [[1]](diffhunk://#diff-8d068e8797e88947c320f79e856c3e16a72b730124a8f9d7031e2c4680dfa534L96-R107) [[2]](diffhunk://#diff-8d068e8797e88947c320f79e856c3e16a72b730124a8f9d7031e2c4680dfa534L143-R155)

## Summary by Sourcery

Enhance README and documentation by updating BrainPy references, adding citation details, and improving the ecosystem installation and API docs structure

New Features:
- Add detailed BibTeX citation for the BrainPy framework in README.md
- Introduce an "Ecosystem" installation tab with CPU, CUDA, and TPU commands in docs/index.rst

Enhancements:
- Update README to specify rewriting based on brainstate since August 2025
- Replace the brainpy-datasets link with a generic brain modeling ecosystem reference

Documentation:
- Remove obsolete changelog links from docs/api.rst
- Update "Learn more" section in docs/index.rst with corrected example and changelog links

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b21cb2693673`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.