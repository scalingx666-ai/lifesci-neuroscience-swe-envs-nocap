# Issue

**Title:** Fix CI: require PHP 8.1 for PHPStan 2.3, and stop assuming Laravel 13 has no QUERY

## Description

## Why

The last CI run on `main` (2026-09-18) was green, but any new run now fails, as #143 shows. Two upstream releases came out since then. The CI job runs `composer update`, so it gets them even though the lock pins older versions.

1. PHPStan 2.3 takes the lowest PHP version from `composer.json`, which says `>=8.0`. With PHPStan 2.3.1 and Larastan 3.13.0 it reports 133 errors:
   - 68 × `property.readOnlyNotSupported`
   - 64 × `arrayUnpacking.stringOffset`
   - 1 × `callable.notSupported`

   All three are PHP 8.1 features, so the code has needed 8.1 for a while. `laramint/laravel-stress`, a required dependency, also asks for `>=8.1`, so no install on PHP 8.0 could have worked.
2. Laravel 13.35 added `Route::query()` and `QUERY` in `Router::$verbs` (laravel/framework#61797). Two tests in `RouteAnalyzerHttpMethodsTest` asserted that the installed framework has neither, so they fail on the Laravel 13 jobs, which now resolve 13.37. The analyzer itself was already right, because it reads the verb list from the router.

PR #143 shows the PHPStan failure. It changes nothing under `src/`. There, PHPStan stopped the Laravel 13 jobs before the tests ran.

## What changed

- `composer.json` requires `php: >=8.1`, and the lock file gets the matching `platform` and `content-hash`. I left out an unrelated `phpdotenv` URL change that `composer update --lock` also made.
- The README badge, the README requirements and `docs/index.md` say PHP 8.1+.
- The `any()` test sets `Router::$verbs` to the list without `QUERY` and then to the list with it, and checks the read both times. It restores the installed list afterwards. The `Route::query()` test no longer checks whether the framework has the method.
- Comments in `RouteAnalyzer`, in the fixture, in the HTTP-methods test and in `StressTestPanel.tsx` that said 13.x cannot register `QUERY` now name 13.35. The `StressTestPanel` comment keeps its CSRF point: `PreventRequestForgery::isReading()` on 13.37 is still `['HEAD', 'GET', 'OPTIONS']`. The bundle does not change, because the minifier strips comments.

I did not add `phpVersion` to `phpstan.neon`. That would make CI green while `composer.json` still claims 8.0.

## Architecture impact

- [x] No persisted graph schema, API, or generated-file format changed.
- [x] Existing scan data remains readable, or the migration/regeneration path is documented.

## Risk, security, and performance

- [x] No new route, endpoint, command, subprocess, or filesystem write was introduced.
- [x] Scan performance / memory use is unaffected or was measured on a representative project.
- [x] This change does not introduce a breaking change.

<details>
<summary>Risk, performance, or breaking-change notes</summary>

The PHP floor goes up on paper only. PHP 8.0 could not parse the source, and a required package already excluded it. In practice 8.1 means Laravel 9 and 10, because Laravel 11 needs 8.2.

CI has no 8.1 job. I checked 8.1 by hand on PHP 8.1.34:

- `php -l` passes on all 122 files in `src/`. As a control, `readonly class` and a `: true` return type both fail to parse on 8.1.
- The suite passes with Laravel 10.50.3 and Pest 2.36.0: `Tests: 922 passed (2471 assertions)`. To run it, I removed Pint (it needs PHP 8.2), set `tests/ArchTest.php` aside, and turned off Composer's advisory block for Laravel 10.

An 8.1 job in the CI matrix would need the same steps. I left that out of this PR.

The only change in `src/` is to comments.

</details>

## Evidence

### Automated checks

- [x] `composer test:lint`
- [x] `composer test:unit`
- [x] `composer test:types`
- [x] Added or updated focused tests / fixtures.

`composer test` on the pinned lock (PHPStan 2.2.13, Laravel 13.31.0): Pint clean, PHPStan "[OK] No errors", Pest "3 deprecated, 938 passed (2497 assertions)". On this PR, CI runs PHPStan 2.3.1 with Laravel 13.37.0, and all 16 checks pass.

### Manual verification

1. I upgraded to PHPStan 2.3.1 and Larastan 3.13.0, the versions CI resolves, and ran `composer test:types`. The result was "[OK] No errors". With the same dependencies and `composer.json` set back to `>=8.0`, it reported the same 133 errors that CI reports.
2. I upgraded to Laravel 13.37.0 and ran `RouteAnalyzerHttpMethodsTest`. The new tests pass (11 of 11). The old tests fail on the same two tests as CI.
3. Mutation check: when `anyRouteVerbs()` ignores the router, the new `any()` test fails.
4. `composer validate` reports the lock file as current.

## Contributor confirmation

- [x] I have completed the required sections, kept this pull request focused, and have not included credentials, private source code, or scan output from a real application.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `07df09a40269`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.