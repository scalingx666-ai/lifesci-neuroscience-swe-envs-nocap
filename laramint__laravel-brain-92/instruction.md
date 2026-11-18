# Issue

**Title:** Recognise every framework auth middleware, not only Authenticate

## Description

## What

The `extends` walk added in #51 terminates on one class, `Illuminate\Auth\Middleware\Authenticate`. An application builds a guard by extending whichever framework middleware does the check it needs, and there are four. A descendant of the other three matched no pattern, no basename and no chain.

The walk now terminates on all four, from one list beside the patterns it mirrors.

Measured before the change, one route per row, `POST` with no other middleware:

| the middleware a route carries | before | after |
|---|---|---|
| `auth` (alias) | `authed` | `authed` |
| `verified` (alias) | `authed` | `authed` |
| `signed` (alias) | `authed` | `authed` |
| `auth.basic` (alias) | **`public`** | `authed` |
| `Illuminate\Auth\Middleware\Authenticate` | `authed` | `authed` |
| `Illuminate\Routing\Middleware\ValidateSignature` | `authed` | `authed` |
| `Illuminate\Auth\Middleware\AuthenticateWithBasicAuth` | **`public`** | `authed` |
| `Illuminate\Auth\Middleware\EnsureEmailIsVerified` | **`public`** | `authed` |

Every `public` in that column is a mutating route drawing a `PUBLIC_WRITE` — "anyone can call this endpoint" — on a route that is guarded.

## The inconsistency it removes

Read the table by pairs and the bug is not "three classes are missing". It is that **one middleware got two answers depending on the form it arrived in**: `verified` is authentication, `EnsureEmailIsVerified` — the class that alias resolves to — was not. An application that registers the alias itself (`$middleware->alias(['verified' => EnsureEmailIsVerified::class])`) hands the analyzer the FQCN, and the same guard silently changes meaning.

So this is not a new opinion about what counts as authentication. It is the existing opinion, applied to whichever form the middleware reaches `classifyExposure()` in. Matching a name and walking a chain are two ways of asking one question, and they now answer from one list.

## Why these four

They are the classes `AUTH_PATTERNS` already reaches, by alias or literally — with one gap that had to be closed for the sentence to be true: `auth.basic` is not the `auth` pattern (`auth` matches `auth`, `auth:…` and `auth\…`, never a dotted sibling), so Laravel's own alias for HTTP Basic auth was read as no guard at all. The second commit names it.

## The honest limit

`EnsureEmailIsVerified` does not itself authenticate. It presupposes a user and checks a property of them, and in real applications it is always paired with `auth`. Including it is defensible only because Brain already treats its alias as authentication — `verified` has been in `AUTH_PATTERNS` from the start — so this makes the class agree with the alias rather than deciding something new.

If you would rather Brain did not treat verification as authentication, the change to make is removing `verified` from `AUTH_PATTERNS` and this base with it. That is a one-line pair and I am happy to send it; what should not stay is the current state, where the answer depends on which of the two forms an application happened to write.

## What it still does not cover

- **A named middleware group.** `classifyExposure()` reads the resolved middleware list, and `resolveMiddlewares()` resolves aliases only — `MiddlewareRegistry::resolveGroup()` still has no caller. A route gated only by a member of an `api`/`web` group is unchanged by this PR.
- **A middleware that authenticates without extending a framework class** — a from-scratch API-key or HMAC guard. That is what `laravel-brain.security.auth_middleware` is for, and the config path is unchanged.

## Cost

None to speak of. The added work is an `in_array` over four strings before the walk that already ran; no file is parsed that was not parsed before, and the per-scan memo is untouched. Naming `auth.basic` in the patterns actually saves a walk, since a pattern hit returns before `isAuthClass()` is asked.

## Tests

Appended to `tests/Unit/SecurityAnalyzerTest.php`, with four middleware fixtures added to `custom-auth-project`:

- a descendant of each of the three newly reached bases → `authed`, no `PUBLIC_WRITE`
- a descendant two hops out (`CheckExpiringSignedLink extends CheckSignedLink extends ValidateSignature`) → `authed`, so the walk keeps following a parent it cannot match instead of stopping there
- each of the four framework classes given directly by FQCN → `authed`
- the `auth.basic` alias → `authed`
- a middleware that authenticates nothing still → `public`, `PUBLIC_WRITE` still raised: the widening is four framework classes, not "anything with a parent"

Checked against the unpatched analyzer: 7 of the 10 datasets fail without the source change, and the three that pass are the two forms `main` already handled plus the negative case — which is what those are there to hold still.

Full suite green (264 passed, 868 assertions), phpstan 0 errors, pint clean.

## Two commits, separable

1. the classifier — the base set and the walk
2. the `auth.basic` alias

The first stands alone if you would rather leave the alias list untouched; the second is what makes the alias and class forms of basic auth agree, so I would keep them together.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `344eecae256a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.