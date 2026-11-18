# Issue

**Title:** Log missing optional event metadata at DEBUG

## Description

Reading an event array's optional tags or source label logs a root warning every time the metadata is absent. Code that preserves metadata while rebuilding spike trains consequently emits repeated warnings, even though these fields default to None and are not required for analysis.

Keep the existing missing-metadata messages at DEBUG through the module's named logger, `nelpy.core._eventarray`. Ordinary runs stay quiet while diagnostic logging remains available when enabled. Document that the getters return None when unspecified. This covers event/spike arrays and their binned counterparts, including the `unit_tags` alias. Return values, setters, populated metadata, spike values, sampling rate, and support semantics remain unchanged.

Validation:
- Thirteen regression cases cover unset and populated metadata, aliases, copies, reconstruction, clearing a label, DEBUG message content and severity, and control through the parent `nelpy` logger.
- Targeted metadata/event/logging tests: 65 passed.
- Full nelpy suite: 509 passed, 3 skipped.
- Repository Ruff check and new-test formatting pass.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `92dd4eedfe43`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.