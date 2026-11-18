# Issue

**Title:** feat(security): reduce false positives in SecurityAnalyzer

## Description

On a real Laravel 13 app (131 routes, 46 controllers) `php artisan brain:scan` currently reports 18 security issues — all of them false positives — by way of three independent rules in `SecurityAnalyzer.php`. The noise buries the handful of genuine findings and makes the security tab hard to trust. This PR fixes the three root causes with focused changes and 12 new tests.

## What changes

### Bug 1 — `UNVALIDATED_INPUT` matched any `->all()`

Pass 2 of `scanAstNode()` walked every `MethodCall` named `all()` regardless of receiver, so each of these legitimate calls became a high-severity finding:

\`\`\`php
collect((array) data_get($t->settings, 'methods', []))->values()->all()
$query->get(['col'])->all()
collect($e->getTrace())->take(8)->all()
\`\`\`

The visitor now only fires when the receiver is provably an HTTP Request — either a method-parameter typed as \`Illuminate\\Http\\Request\` (or any FormRequest-shaped class) or the bare \`request()\` helper. The check is promoted to a public static \`SecurityAnalyzer::isRequestAllCall()\` so the existing Pass-1 mass-assignment visitor reuses the same receiver logic.

### Bug 2 — `signed`, custom HMAC, and webhook routes flagged as `PUBLIC_WRITE`

Webhooks (`POST /webhooks/stripe/{tenant?}`), token-in-URL magic-link endpoints (`POST /portal/{token}/cancel`), and custom-merchant-API routes all enforce authentication outside the standard `auth:*` middleware. With no extensibility, the only fix was to ignore the entire SecurityAnalyzer.

This PR:

- Adds `signed` and `Illuminate\Routing\Middleware\ValidateSignature` to `AUTH_PATTERNS` — a signed URL is cryptographic authentication of the request.
- Adds a `security` block to `config/laravel-brain.php` so apps can declare their own auth-providing middleware and trust webhook URI globs:

  \`\`\`php
  'security' => [
      'auth_middleware_patterns'     => ['merchant.hmac'],
      'throttle_middleware_patterns' => [],
      'trusted_route_names'          => ['webhooks.*'],
      'trusted_route_uris'           => ['webhooks/*', 'portal/*'],
  ],
  \`\`\`

- Defaults are empty, so no behaviour change for apps that don't publish the config — except for the `signed`-as-auth fix, which is a strict improvement.

### Bug 3 — Breeze `POST /login` etc. flagged as `MISSING_THROTTLE`

Breeze 2.x / Fortify enforce login throttling via `RateLimiter::tooManyAttempts(...)` inside the controller action (or inside the bound `LoginRequest::ensureIsNotRateLimited()`) — not via the `throttle:` middleware. The current middleware-only check produces a high-severity finding on every Breeze auth route.

The analyzer now also scans:

- The controller method AST for `RateLimiter::tooManyAttempts/hit/for/attempt/availableIn`, `$x->tooManyAttempts()`, or `$x->hitRateLimit()`.
- Each `FormRequest` typed in the action's parameters (so `LoginRequest::ensureIsNotRateLimited()` is reached).
- The controller class for the `Illuminate\Foundation\Auth\ThrottlesLogins` trait.

When any of these is found, `MISSING_THROTTLE` is suppressed.

## Real-world impact

A Laravel 13 SaaS app, 131 routes, 46 controllers:

| Setup | UNVALIDATED_INPUT | PUBLIC_WRITE | Total |
| --- | --- | --- | --- |
| `v2.3.0` | 5 | 13 | 18 |
| After this PR, no config | 0 | 13 | 13 |
| After this PR + `trusted_route_uris` published | 0 | 0 | 0 |

All eliminated findings were verified by hand as false positives; no real issue was hidden.

## Tests

12 new Pest tests in `tests/Unit/SecurityAnalyzerTest.php` cover each bug both ways — the FP suppression AND the still-flagged regressions:

\`\`\`
PASS  Tests\\Unit\\SecurityAnalyzerTest
  ✓ does not flag Collection->values()->all() as UNVALIDATED_INPUT
  ✓ does not flag Eloquent Collection ->all() as UNVALIDATED_INPUT
  ✓ still flags request()->all() (helper) as UNVALIDATED_INPUT
  ✓ treats `signed` middleware as authentication, not public
  ✓ treats `ValidateSignature` FQCN middleware as authentication
  ✓ treats configured auth_middleware_patterns as authentication
  ✓ suppresses PUBLIC_WRITE on routes matching trusted_route_names glob
  ✓ suppresses PUBLIC_WRITE on routes matching trusted_route_uris glob
  ✓ still flags public mutating routes that are NOT trusted
  ✓ does not flag MISSING_THROTTLE when controller uses RateLimiter::tooManyAttempts
  ✓ does not flag MISSING_THROTTLE when the action FormRequest throttles
  ✓ still flags MISSING_THROTTLE on sensitive routes with no rate-limiting
\`\`\`

Full suite: 82 passed (was 70), 0 phpstan errors, pint clean.

## Compatibility

- No public API breaks — `SecurityAnalyzer::__construct` takes an optional `?array $config` for tests but defaults to reading from `config('laravel-brain.security')` exactly as the rest of the package does.
- Adding `signed` to `AUTH_PATTERNS` is the only default-behaviour change. It is a fix, not a regression.
- Config defaults are empty arrays, so apps that don't publish `laravel-brain.php` see identical behaviour for the rest of the rules.
- No new runtime dependencies; nothing changes for the Laravel 9 / 10 / 11 / 12 / 13 matrix.

## Files

- `src/Analysis/SecurityAnalyzer.php:39` — added `signed` + `ValidateSignature` to AUTH_PATTERNS; new constructor + config plumbing; `isTrustedRoute()`, `hasInCodeThrottle()`, `astHasRateLimiterCall()`, `astUsesThrottlesLoginsTrait()`, `resolveFormRequestFiles()`; static `isRequestAllCall()`; FunctionLike-aware `collectRequestParamNames()`.
- `config/laravel-brain.php` — new `security` block, all defaults empty.
- `tests/Unit/SecurityAnalyzerTest.php` + `tests/fixtures/security-project/` — 12 tests + 5 fixture files.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f078d5a5cc08`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.