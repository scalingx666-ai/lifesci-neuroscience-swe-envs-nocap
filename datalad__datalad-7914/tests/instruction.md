# Issue

**Title:** Define public API for datalad.support.network module

## Description

### Overview

This PR adds an explicit `__all__` declaration to the `datalad/support/network.py` module to define its public API. The module exports resource identifier classes (`RI`, `URL`, `PathRI`, `SSHRI`, `DataLadRI`, `GitTransportRI`), helper functions for classification (`is_url`, `is_ssh`, `is_datalad_compat_ri`), and a utility function for path conversion (`get_local_file_url`).

### Rationale

Explicitly defining `__all__` provides several benefits:
- **Clear API contract**: Users and maintainers can easily identify which symbols are part of the public API
- **Better IDE support**: Tools can provide accurate autocompletion and documentation for public exports
- **Maintenance clarity**: The comment notes that everything else is considered internal and may change without notice, even if imported elsewhere in datalad
- **Documentation**: Makes it explicit what should be documented and what is implementation detail

### Changes

- Added `__all__` list with 9 public symbols organized into three categories:
  - Resource identifiers (5 classes)
  - Classification helpers (3 functions)
  - Path conversion utility (1 function)

### Testing

No testing needed — this is a documentation/API declaration change that doesn't alter runtime behavior.

https://claude.ai/code/session_01UrJiX2X6ik1vMAG3aet8w6

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `477e885ce8bb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.