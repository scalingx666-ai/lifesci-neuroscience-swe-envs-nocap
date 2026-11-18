# Issue

**Title:** Improve parser diagnostics for missing ':' in equation units

## Description

## Summary
Improve equation parse diagnostics for model descriptions that miss `:` before unit declarations.

## What Changed
- Improved error formatting in `parse_string_equations` to provide clearer line-level diagnostics.
- When parsing with `ZeroOrMore(EQUATION)` yields a degraded top-level error, re-parse the relevant line with `EQUATION` to recover specific expectations.
- Added a targeted hint for likely missing unit separators:
  - `Equation syntax error: expected ':' before unit declaration.`
  - Includes a concrete example (`dv/dt = -v / tau : 1`).
- Reduced brittle error detection by inspecting `ParseException.parser_element` metadata instead of relying on raw exception strings.
- Kept grammar behavior unchanged; this PR only improves diagnostics.

## Edge-Case Handling
- Preserves specific non-unit errors (e.g. `dv/d = ...` still reports `Expected 'dt'`).
- Avoids missing-`:` hints for malformed RHS expression cases (e.g. `x = (`).
- Covers both equation form and parameter form missing separators (e.g. `tau second`).

## Tests
Added `test_parse_error_messages` coverage for:
- Missing `:` in equation definitions.
- Missing `:` in multiline/comment inputs.
- `dt` typo should not be masked by missing-unit hints.
- Malformed RHS should not trigger missing-unit hints.
- Missing `:` in parameter declarations.
- Unknown-unit-like token after expression (`... foobaz`) should still surface missing-unit hint.
- Non-equation junk input should not trigger missing-unit hints.

Validation run:
- `pytest -q brian2/tests/test_equations.py`
- Result: `15 passed, 1 skipped`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6143adc3523b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.