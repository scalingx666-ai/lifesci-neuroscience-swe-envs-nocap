# Issue

**Title:** Fix: say when --budget is raised to the minimum

## Description

## `--budget` is silently raised to a minimum the help does not mention

`brain:export-context` clamps the option:

```php
budget: max(500, (int) $this->option('budget')),
```

and the help reads `{--budget=6000 : Token budget}` — no minimum anywhere. So `--budget=300` becomes 500 without a word, and the export's own header then reports `Budget: 500 tokens`, a number the caller never chose. Someone tuning the budget down has no way to know their value stopped taking effect.

The minimum is in the help now, and the command says so when it actually applies:

```
WARN  Budget raised to the 500-token minimum (asked for 300).
```

Nothing is printed when the requested budget is used as given, so the normal case is unchanged.

The clamp itself stays: below 500 tokens the export cannot carry a focal node and its immediate context, which is the least it can be useful at. The complaint was never the floor, only that it was invisible.

### Verification

Run against a real project: `--budget=300` warns and exports at 500, `--budget=6000` exports with no warning. `254 passed`, PHPStan 0, Pint clean.

No test: this is a help string and one console line, and the console output is the behaviour. Happy to add one if you would rather have it pinned.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `344eecae256a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.