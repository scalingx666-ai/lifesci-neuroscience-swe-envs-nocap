# Issue

**Title:** Fix PoissonInput and PoissonGroup missing validation for N >= 1 and n…

## Description

# Summary

This PR adds missing input validation.

Previously, both classes accepted invalid values for `N`, and `PoissonInput` also accepted negative `rate`. These inputs did not raise errors and instead resulted in simulations producing zero input silently.

The issue occurred because `@check_units(...)` validates dimensions but does not validate value ranges.

---

# Fix 

Early validation checks were added at the start of `__init__`.

### `PoissonInput`

```python
if N < 1 or int(N) != N:
    raise ValueError(f"N has to be an integer >= 1, got {N!r}.")
if rate < 0 * Hz:
    raise ValueError(f"The rate cannot be negative, got {rate!s}.")
```

Now:

* `N < 1` → `ValueError`
* `rate < 0` → `ValueError`

---

### `PoissonGroup`

```python
if N < 1 or int(N) != N:
    raise TypeError(f"N has to be an integer >= 1, got {N!r}.")
```

Now:

* `N < 1` → `TypeError`

---

## Result

Before:

* Invalid `N` or negative `rate` created objects successfully.
* Simulations ran and produced `[0., 0., 0.]` silently.

After:

* Invalid inputs raise clear, immediate errors.
* Valid simulations remain unaffected.

This ensures incorrect configurations fail early instead of producing silent wrong results.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `526f6f2dc677`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.