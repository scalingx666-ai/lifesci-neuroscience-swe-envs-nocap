# Issue

**Title:** Phase 2.1: Refactor lit_model.py into modular components

## Description

Split the monolithic lit_model.py (1846 lines) into focused, maintainable modules:
- lit_model.py (539 lines, 71% reduction): Core Lightning orchestration
- deep_supervision.py (404 lines): Deep supervision and multi-task learning
- inference.py (868 lines): Sliding window inference, TTA, postprocessing
- debugging.py (173 lines): NaN detection and debugging utilities

Key improvements:
- Eliminated code duplication through delegation pattern
- Clear separation of concerns with single responsibility per module
- Improved maintainability and testability
- No backward compatibility methods (clean design per user requirement)

All modules pass Python syntax compilation. Integration tests pending.

.1 in REFACTORING_PLAN.md

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1c63827e20b1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.