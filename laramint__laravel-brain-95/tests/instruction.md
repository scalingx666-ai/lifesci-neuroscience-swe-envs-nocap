# Issue

**Title:** Expand middleware groups when classifying a route's exposure

## Description

## What

A middleware group is one name standing for a list, and it is exactly where an application puts the guard it wants on a set of routes — a Kernel's `$middlewareGroups`, or the members appended in `bootstrap/app.php`, both of which the registry already carries:

```php
'api' => ['throttle:60,1', 'auth:sanctum']
```

`resolveMiddlewares()` resolved aliases only, so a route carrying that group reached `classifyExposure()` as the single string `api` — which matches no pattern, no basename and no class. Every route behind the group was classified `public`, and every mutating one drew a `PUBLIC_WRITE` saying anyone can call it.

```
POST /records   middleware: api   (api = ['throttle:60,1', 'auth:sanctum'])

before  exposure=public   PUBLIC_WRITE raised
after   exposure=authed   no issue
```

## How the name is resolved

`MiddlewareRegistry::expand()`, which follows Laravel's own [`MiddlewareNameResolver`](https://github.com/laravel/framework/blob/master/src/Illuminate/Routing/MiddlewareNameResolver.php) rather than inventing an order:

- **A group wins over an alias of the same name.** The framework checks `$middlewareGroups[$name]` before the alias map, so an application that has both is read the way it runs.
- **The group lookup is on the whole name**, so `web:tenant` is an alias with a parameter, not the `web` group — again the framework's rule, which splits on the colon only after the group check.
- **A member that is itself a group is expanded in turn.** Laravel supports nesting and applications use it.
- **Parameters survive.** `throttle:60,1` inside a group arrives as `Illuminate\…\ThrottleRequests:60,1`, so the throttle check still sees the limit.

The one deliberate difference is the cycle. Laravel throws on a group that lists itself and recurses forever on a longer loop; an application with either is broken, but a scan reads whatever is on disk, including source no one has run. A name already expanded on the current path is dropped instead of followed, so `['api' => ['auth', 'api']]` ends with `auth` rather than taking the scan down.

`resolveGroup()` gains its first caller in the process — it has been public and unused since it was written.

## Not in scope, and worth naming

`MiddlewareAnalyzer` reads a group from a Kernel's `$middlewareGroups` and from `->web(append: …)` / `->api(append: …)`. It does not yet read `$middleware->group('name', [...])`, the Laravel 11+ call for declaring one — so an application using that form has no groups in the registry for this to expand. That is a separate gap in a separate file, and this PR does not touch it.

## Scope

`SecurityAnalyzer` only. `GraphBuilder::resolveMiddlewares()` deliberately still draws one `middleware::api` node per group, because the graph answers a different question: expanding a group there would attach every route in it to each of its members, and a change to one member would report the whole group's routes as its blast radius. What a route is *guarded by* and what a change to a middleware *reaches* are not the same question, and this PR only changes the first.

## Tests

Eight, appended to `tests/Unit/SecurityAnalyzerTest.php`:

- a route guarded only by a group member → `authed`
- a group listing another group → expanded through
- an alias inside a group → resolved through the alias map, and then recognised by the `extends` walk, which only composes when the group is expanded first
- `throttle:60,1` inside a group → no `MISSING_THROTTLE`
- `web:tenant` → not the `web` group
- a name that is both a group and an alias → read as the group
- a group listing itself, and two groups listing each other → both terminate

Checked against the unpatched analyzer: 6 of the 8 fail without the source change. The two that pass are the parameterised-name and mutual-cycle cases, which are there to hold behaviour still.

Full suite green (262 passed, 861 assertions) across three `--order-by=random` runs, phpstan 0 errors, pint clean.

## Relationship to #92, #93 and #94

Independent of all three; any merge order works. It does finish something #92 left open: that PR recognises a guard by what it extends and says in its own description that a guard reaching a route through a group is still missed. This is that half. The alias-inside-a-group test is the two composing.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `344eecae256a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.