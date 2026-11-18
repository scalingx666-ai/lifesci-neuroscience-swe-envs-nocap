# Issue

**Title:** fix(security): recognise custom auth guards by their extends chain

## Description

Rebased onto current `main` and narrowed to the classifier change. The array-form `$middleware->alias([...])` fix is split out to #86 (per @SanderMuller's suggestion), and the review items that only applied to the old base — the `SAFE_INFRA_PATTERNS` suppression, the duplicated locate helper, the `signed`/`ValidateSignature` contradiction — are gone with the rebase (current `main` never had them).

## Problem

`classifyExposure()` already recognises the framework `Authenticate` and an app subclass that happens to **share its name** (`App\Http\Middleware\Authenticate`), via basename matching. It still misses a custom guard whose class name doesn't contain "auth" — the textbook second-guard case:

```php
$middleware->alias(['auth.customer' => AuthenticateCustomer::class]);
```

`AuthenticateCustomer extends Authenticate`, but its basename isn't `authenticate`, so the route is classified `public` and every mutating route behind it gets a false `PUBLIC_WRITE`.

## Change

`classifyExposure()` now also does a **verified `extends Authenticate` walk** (reusing the existing `PhpExtendsFqcnResolver`) for any middleware that pattern matching didn't already resolve. A guard that reaches `Illuminate\Auth\Middleware\Authenticate` through its parent chain is classified `authed`, which in turn suppresses the false `PUBLIC_WRITE`.

The walk is memoised per scan. Addressing your review: the memo is **seeded before recursing**, so a cyclic `extends` chain (a broken class that Brain can't execute) terminates instead of exhausting memory and taking the whole scan down.

No public API change; no new constructor parameters.

## Tests

Appended to `tests/Unit/SecurityAnalyzerTest.php` (+ `custom-auth-project` middleware fixtures):

- a differently-named `Authenticate` subclass resolved via an alias → `authed`, no `PUBLIC_WRITE`
- the same subclass given by bare FQCN → `authed`
- a cyclic `A extends B extends A` chain terminates (route stays `public`, `PUBLIC_WRITE` still fires)

Full suite green (213 passed), phpstan 0 errors, pint clean.

## Relationship to #86

Independent and self-contained (its tests build the alias map directly), but they compose: #86 makes the array-form alias reach the registry, and this PR classifies the resolved guard correctly. Either order merges cleanly.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a05a31095910`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.