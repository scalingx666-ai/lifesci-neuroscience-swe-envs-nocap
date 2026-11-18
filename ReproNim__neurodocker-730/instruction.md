# Issue

**Title:** Warn about incompatible Debian template dependencies

## Description

Templates can request APT packages that do not exist in the selected Debian release. Generation now warns on stderr about known unavailable dependencies for official Debian 10–13 tags, using the current build stage. Custom images and floating tags remain unchecked; diagnostics do not contaminate generated recipes.

The change also corrects MRtrix binaries to request `libtiff5`, adds MATLAB Runtime 2010a's missing version mapping, and documents package and runtime compatibility limits. This addresses the early-warning and documentation portions of #728; it does not make the legacy SPM12/MATLAB stack compatible with newer Debian releases.

CI and repeated CLI calls now avoid two sources of shared state: tests isolate the template registry and renderer schema, and command lookup copies Click commands before adding dynamic options. The latter prevents duplicate-option warnings with current Click releases. APT integration fixtures and the Conda example use Bookworm because Bullseye security-package downloads return 404s. Rendering-only Bullseye coverage remains. `pyproject.toml` follows the configured formatter.

Validation:
- All PR checks passed: full CI on Python 3.10–3.13, all type checks, formatting, and the Conda example. The Python 3.12 full-suite log reports 102 passed.
- All repository hooks passed, including Ruff, YAML/TOML formatting, and mypy.
- Combined renderer/CLI suite: 69 passed with Click 8.5.0, covering the issue's command for Docker and Singularity and repeated generation.
- Checked package catalogs in Debian 11, 12, and 13 containers.
- Built the generated MRtrix 3.0.4 image on Ubuntu 22.04 and successfully ran `mrinfo -version`.

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `956a3c29d337`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.