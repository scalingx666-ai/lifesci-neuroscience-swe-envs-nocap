# Issue

**Title:** Fix: dependency tables spend the context budget instead of fitting into it

## Description

## The dependency tables spend the budget instead of fitting into it

> Builds on #103, which is what makes the budget mean anything at all. Merge that one first.

Both package tables are built into the "always included" structural block and then subtracted from the budget:

```php
$structural = implode("\n", $parts);   // includes both tables
$charBudget -= strlen($structural);
```

On an application with 120-odd dependencies the tables are long enough to be the entire export. A route asked for at `--budget=500` came back at **1,264 tokens — 2.5× the budget — of which 87% was those two tables and none was the code the route runs.**

They say what the project has installed. They do not say anything about the focal node, which is what the export exists to describe.

### Fitting them

They now take at most 15% of what remains after the structural essentials, and state how many rows they dropped:

```
| …and 96 more | | |
```

Truncated rather than omitted: knowing the project runs Filament at all is worth a few lines, and the count says plainly what was left out instead of implying the list is whole.

Same route, before → after:

| budget | before | after |
|---|---|---|
| 500 | 1,264 tokens · 87% packages · 0 source | **500 tokens · 10% · 1 source** |
| 2,000 | 1,935 tokens · 57% packages · 1 source | 1,884 tokens · 14% · 2 source |
| 6,000 | 5,441 tokens · 20% packages · 4 source | 5,416 tokens · 16% · 4 source |
| 20,000 | 14,174 tokens · 8% packages · 19 source | unchanged — the tables fit whole |

The 500 row is the one that matters: the *tables* now fit inside what the budget leaves, and what is left is spent on code rather than on a dependency list.

Not the export as a whole — that would overclaim. The structural node and edge listing is emitted ahead of the budget and can exceed it on its own (2,923 characters against a 2,000-character limit on one reviewed application, before any table or snippet). This PR does not touch that and does not claim to.

At 20,000 nothing changes, and nothing should — there the tables fit and no truncation row appears.

### Tests

3 tests: at a small budget the focal node's code is still present, the dropped count is stated, and the export stays inside `budget * 4` characters — the same ratio the exporter budgets with.

### Verification

Measured against a real 120-dependency application at four budgets, before and after. `258 → 261 passed`, PHPStan 0, Pint clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `344eecae256a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.