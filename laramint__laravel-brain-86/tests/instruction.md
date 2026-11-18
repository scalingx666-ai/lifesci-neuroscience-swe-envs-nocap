# Issue

**Title:** fix(middleware): read array-form $middleware->alias([...]) registrations

## Description

Split out of #51 as @SanderMuller suggested ("Part 1 stands on its own. Splitting it out would let it land now") — this is just the `MiddlewareAnalyzer` half, with none of the security-classifier changes still under discussion there.

## Problem

`MiddlewareAnalyzer::extractAliases()` only handled the two-argument form:

```php
$middleware->alias('key', Class::class);   // ✓ handled
```

The array form Laravel's docs and the `bootstrap/app.php` skeleton recommend was silently dropped:

```php
$middleware->alias([
    'auth.customer' => AuthenticateCustomer::class,   // ✗ never registered
]);
```

So any custom guard registered the array way never made it into the `MiddlewareRegistry`, and everything downstream that resolves aliases (exposure classification included) was working from an incomplete map.

## Change

`extractAliases()` now handles both forms:

- **Form A** — `$middleware->alias('key', Class::class)` — unchanged, still supported.
- **Form B** — `$middleware->alias(['key' => Class::class, ...])` — new. Iterates the array items, taking each string key as the alias and resolving the value through the existing `extractClassString()`.

No public API change; no new constructor parameters.

## Tests

New `tests/Unit/MiddlewareAliasFormTest.php` + a `middleware-array-alias` fixture whose `bootstrap/app.php` registers both forms in one file:

- extracts the two aliases from an array-form `$middleware->alias([...])` call
- still extracts the two-argument `$middleware->alias(key, class)` form

Full suite green (212 passed), phpstan 0 errors, pint clean.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a05a31095910`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.