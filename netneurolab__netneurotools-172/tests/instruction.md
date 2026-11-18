# Issue

**Title:** [DOC] Update documentation

## Description

This pull request focuses on improving documentation, installation instructions, and the CSS styling for the project’s docs. It also includes minor updates to docstrings in the `randomize.py` module for clarity and formatting. The most important changes are grouped below.

**Documentation and Installation Updates:**

* Updated the minimum required Python version to 3.8 and simplified the installation instructions, recommending direct installation via pip and clarifying optional dependencies for surface plotting. Added detailed guidance for Pyvista/VTK backends and removed outdated troubleshooting and manual build instructions for visualization dependencies.
* Updated copyright year in `docs/conf.py` to 2026.

**Documentation Build System:**

* Fixed the `html-noplot` target in `docs/Makefile` to use the correct Sphinx options variable, and updated `.PHONY` targets for better maintainability.

**CSS and Documentation Styling:**

* Added and improved custom CSS in `docs/_static/theme_overrides.css` for better layout, table readability, sidebar highlighting, code blocks, API signatures, field lists, and link styling. Also hid heading hash icons and improved paragraph readability.

**Docstring and Formatting Improvements:**

* Updated docstrings in `netneurotools/networks/randomize.py` for `strength_preserving_rand_sa` and `strength_preserving_rand_sa_dir` to clarify the available `energy_type` options and improve formatting. Added `# noqa: E501` to suppress line length warnings.
* Minor formatting fix in the docstring for `match_length_degree_distribution`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bfeaa0fdca20`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.