# Issue

**Title:** Fix false "public route" warnings for routes behind app auth middleware

## Description

.

## Problem

`SecurityAnalyzer` flags routes as **"Public Route — no authentication middleware detected"** (HIGH risk) even when they're guarded by auth middleware inherited from a parent `Route::group()`, and correspondingly raises false **PUBLIC_WRITE** alerts on mutating routes inside those groups. On a real app this produced **80+ false HIGH-risk alerts**, drowning out genuine findings.

## Root cause

Apps generate and apply their **own** auth middleware — `App\Http\Middleware\Authenticate`, a subclass of the framework class, applied as `Authenticate::class`. So a route carries the app FQCN, not the `auth` alias or `Illuminate\Auth\Middleware\Authenticate`. `middlewareMatches()` only matched the alias and the *exact* framework FQCN (prefix match), so the app's own auth middleware registered as no auth at all — even though Brain's own lifecycle graph renders `Authenticate` in the chain for the same route (the contradiction the issue notes).

## Fix

`middlewareMatches()` now also matches a framework-middleware FQCN pattern **by class name**, so `App\Http\Middleware\Authenticate` is recognised as `Illuminate\Auth\Middleware\Authenticate`. This applies uniformly to the five reserved framework middleware names:

| name | exposure |
|---|---|
| `Authenticate` | auth |
| `ValidateSignature` | auth (signed URL) |
| `RedirectIfAuthenticated` | guest |
| `Authorize` | admin |
| `ThrottleRequests` | throttle |

It is a **name match, not a verified subclass check** (documented in-code) — consistent with the analyzer's existing `*_PATTERNS` heuristic style — and is **guarded to FQCN patterns only** (`str_contains($pattern, '\\')`), so the `auth`/`guest`/`throttle`/`admin` alias semantics are unchanged. A middleware whose name differs, e.g. `AuthenticateSession`, is deliberately not matched (covered by a negative test).

## Tests

5 new cases in `SecurityAnalyzerTest`: the app `Authenticate` subclass → authed; the full nested-group stack (`web`, app `Authenticate`, `role:admin`) → admin; a **direct assertion that PUBLIC_WRITE is not raised** on the reporter's DELETE symptom; the app `RedirectIfAuthenticated` → guest; and the negative `AuthenticateSession` → still public. Existing `CustomAuth`-name-and-config tests still pass (the fix doesn't over-match).

Verified: `pint` clean · `phpstan` (level 5 + larastan) **No errors** · full suite **116 passed**. Reproduced and confirmed fixed against a real large app: routes carrying an app `Authenticate` subclass dropped from **292 mis-classified "public" to 118** — the remainder being genuinely public (login/error pages) or custom-named auth middleware, which the existing `security.auth_middleware` config already covers.

## Note

For stricter precision a future change could resolve the middleware's `extends` chain rather than match by name; the name heuristic was chosen to match the repo's existing style and to keep the fix minimal. Branches from `main`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3606ddd7ec79`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.