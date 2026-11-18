# Issue

**Title:** Read the middleware file the application actually configures

## Description

## What

`MiddlewareAnalyzer::analyze()` picked its source file by existence:

```php
if (file_exists($kernelPath)) {
    return $this->analyzeLaravel10($kernelPath);
}
```

`bootstrap/app.php` exists in every Laravel application, on both sides of the 11.0 boundary, so it could never be the discriminator — but `app/Http/Kernel.php` cannot be one either. An application upgraded to 11+ commonly keeps that file behind: nothing deletes it, nothing loads it, and it sits there holding whatever it held on the day of the upgrade.

For those applications the analyzer read the file the framework ignores. Measured on the fixture this PR adds — a Laravel 11 `bootstrap/app.php` registering `auth.customer`, beside a Kernel stub still declaring a retired guard:

| | aliases | groups |
|---|---|---|
| before | `{"auth.retired": "…\RetiredGuard"}` | `{}` |
| after | `{"auth.customer": "…\AuthenticateCustomer"}` | `{"api": ["…\ThrottleApi"]}` |

Every live registration missing, one dead one in their place.

## What it costs downstream

`resolveMiddlewares()` resolves a route's middleware through this registry before `classifyExposure()` reads it, so a missing alias is not a cosmetic gap. Unresolved, `auth.customer` stays the literal string — and that string matches no auth pattern, since `auth` matches `auth`, `auth:…` and `auth\…`, never a dotted sibling:

```
DELETE /records/{record}  middleware: auth.customer

before  exposure=public   PUBLIC_WRITE raised — "anyone can call this endpoint"
after   exposure=authed   no issue
```

The route is guarded by a guard that extends `Authenticate`. The finding was false, and it was false for every mutating route behind every custom alias in the application.

## The rule

The file that **configures** middleware wins, rather than the file that exists:

1. `bootstrap/app.php` is asked first, and answers only when it carries a `->withMiddleware(...)` call.
2. Otherwise the Kernel is read, which is what keeps a Laravel 10 application working — its bootstrap file exists too, creates the application, and configures no middleware, so it declines.
3. Neither: an empty registry, as before.

`analyzeLaravel11()` returns `?MiddlewareRegistry` for that: **null is not an empty registry**, and the difference is load-bearing. `->withMiddleware(function ($middleware) { $middleware->redirectGuestsTo('/login'); })` registers no alias and no group, yet it is still the file this application configures middleware in — an empty registry from there is that application, while null is a file that never had an opinion. Falling back to a stale Kernel in the first case is the bug this PR fixes, one step removed.

Two smaller things follow from the same change:

- **An unparseable `bootstrap/app.php` now falls through to the Kernel** instead of returning an empty registry.
- **The `web`/`api`/`alias` scan is confined to files that configure middleware.** The visitor matches those method names anywhere in the file, so a pre-11 bootstrap calling `->api(...)` on something unrelated could previously contribute a "group". It cannot now.

## What I did not do

**A union of both files.** It is the more forgiving reading, and it is what I first wrote, but it resurrects exactly what the Kernel stub gets wrong: an alias the application retired keeps resolving, and a group it removed keeps listing members. The framework reads one file, so this reads one file.

## Tests

`tests/Unit/MiddlewareSourcePreferenceTest.php`, with two fixture applications:

- an upgraded application (bootstrap + a Kernel stub) → aliases and groups come from bootstrap
- the same application → the stub's retired alias is **not** in the registry
- a Laravel 10 application (Kernel + a pre-11 bootstrap) → still reads the Kernel, aliases and groups both
- neither file configures middleware → empty registry
- end to end: the guarded `DELETE` above is `authed` with no `PUBLIC_WRITE`

Checked against the unpatched analyzer: 4 of the 6 fail without the source change, and the two that pass are the Laravel 10 and empty-registry cases — the ones that are there to hold still.

Full suite green (260 passed, 865 assertions), phpstan 0 errors, pint clean.

## Relationship to #92

Independent — different file, different question, and either order merges cleanly. They do compose: #92 recognises a guard by what it extends, and this one makes sure the alias naming that guard resolves to a class in the first place. The end-to-end test above passes on this branch alone, since `AuthenticateCustomer extends Authenticate` is the base `main` already walks to.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `344eecae256a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.