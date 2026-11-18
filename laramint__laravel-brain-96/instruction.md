# Issue

**Title:** Read group declarations from bootstrap/app.php

## Description

## What

`MiddlewareAnalyzer` reads a Laravel 11+ `bootstrap/app.php` for `->web(append: …)`, `->api(append: …)` and `->alias(…)`. Those two methods modify the framework's own groups. **Every group an application declares for itself is declared somewhere else**, and none of it was read:

```php
$middleware->group('admin', [AuthenticateCustomer::class, 'can:administer']);
$middleware->appendToGroup('admin', [ThrottleAdmin::class]);
$middleware->prependToGroup('tenant', EnsureTenantMatches::class);
```

Before this, `$registry->groups` held `web` and `api` and nothing else, so `resolveGroup('admin')` answered `[]` — the same answer it gives for a group that does not exist.

## The three calls

From `Illuminate\Foundation\Configuration\Middleware`:

- `group(string $group, array $middleware)` — the whole membership. Read as a replacement, which is what the framework does with it.
- `appendToGroup(string $group, array|string $middleware)` — merged onto what is known so far.
- `prependToGroup(string $group, array|string $middleware)` — merged in front, so the order the registry reports is the order the middleware runs.

Both `…ToGroup` methods take `array|string` and Laravel wraps a bare one, so `prependToGroup('admin', EnsureTenantMatches::class)` is one member rather than none. A group that only ever has members appended to it is recorded from those, since an application may add to a group the framework declares.

A name that is not a literal string — a variable, a constant — is left alone rather than guessed at: attributing middleware to a group whose name cannot be read would put it under a group that does not exist. The first-class callable form (`->group(...)`) carries a `VariadicPlaceholder` with no `value`, and is guarded the same way `extractAliases()` guards it.

## Why it matters beyond the registry

A group is where an application puts the guard it wants on a set of routes, and a group nothing knows about resolves to nothing. Anything asking what a route runs — including the exposure classification in #95 — gets the group's name and no members, so a route behind `admin` reads as guarded by a middleware called `admin` that does not exist.

## Honest limit

The framework's own `web` and `api` members still come only from what an application appends to them. Their default contents live in Laravel, not in the application's source, so a scan of the project cannot see them — unchanged by this PR, and worth knowing when reading a `web` group that looks short.

## Tests

`tests/Unit/MiddlewareAliasFormTest.php`, with a `middleware-group-declarations` fixture:

- a group declared with `group()` → its members, including a parameterised alias member
- append and prepend → the order the middleware runs
- a bare class string rather than an array → one member
- a group that only ever had members appended → recorded from those

All four fail without the source change. Full suite green (258 passed, 858 assertions) over two `--order-by=random` runs, phpstan 0 errors, pint clean.

## Relationship to the other open PRs

Touches `MiddlewareAnalyzer` like #93 does, but a different part of it — #93 decides *which file* is read, this decides *what is read* in the 11+ one. They stack in either order; if #93 lands first this needs no change, and if this lands first #93 needs none.

#95 is the consumer that makes the difference visible: it expands a group when classifying a route's exposure, and can only expand what the registry holds.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `344eecae256a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.