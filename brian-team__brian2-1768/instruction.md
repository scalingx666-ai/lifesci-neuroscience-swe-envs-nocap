# Issue

**Title:** Implement substitution functionality for Statements class

## Description

- Add __init__ method with **substitutions parameter to Statements class
- Implement _substitute static method for identifier replacement
- Support both name substitution (string -> string) and value substitution (identifier -> value)
- Use regex with word boundaries to respect identifier boundaries
- Add comprehensive test suite with 22 tests covering:
  - Basic value and name substitution
  - Multiple simultaneous substitutions
  - Word boundary handling
  - Brian2 units support
  - Multi-line statements
  - Integration with Synapses and NeuronGroup
  - Backward compatibility
- All existing tests pass (no regression)

This enables users to create reusable statement templates for on_pre, on_post, threshold, and reset parameters, similar to how Equations supports substitution for differential equations.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5d0dc751808d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.