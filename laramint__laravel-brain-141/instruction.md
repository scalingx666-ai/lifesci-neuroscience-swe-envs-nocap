# Issue

**Title:** Fix: keep GLOB_BRACE behind a guard, so a scan runs on musl

## Description

## Why

`brain:scan` dies before it traces anything with `Undefined constant "LaraMint\LaravelBrain\Analysis\GLOB_BRACE"` at `SourceDirectories.php:79`.

`GLOB_BRACE` is not a PHP-level constant on PHP 8.4 and older — it is re-exported from the platform's own `glob.h`, and **musl does not define it**. `ext/standard/dir.stub.php` on the 8.4 branch declares it as `#if (defined(GLOB_BRACE) && GLOB_BRACE != 0)`, so on Alpine the userland constant is absent and naming it is a fatal `Error` rather than an ignored flag. PHP 8.5 closes this: `main/php_glob.h` arrived with *"Use win32 glob implementation on all platforms"* (php-src#18164) and defines it unconditionally. The file is absent from PHP-8.1 through PHP-8.4 and present in 8.5 and master. Since `composer.json` requires `php: >=8.0`, **8.0 through 8.4 on musl is affected** — most of the supported range.

It needs no unusual configuration. The glob is only reached when a configured path is *not* an existing directory, and the shipped default is `'source_paths' => ['app', 'src']`: in a standard Laravel application `app` short-circuits and **`src` does not exist**, so the fallback runs on every scan.

After this change, the same scan completes on Alpine and produces byte-identical output everywhere else.

## What changed

- One guarded helper, `SourceDirectories::globDirectories()`, is now the only place in the package that names `GLOB_BRACE`: `GLOB_ONLYDIR | (defined('GLOB_BRACE') ? GLOB_BRACE : 0)`.
- The four call sites that each named the flag — `SourceDirectories`, `ModelAnalyzer`, `FilamentAnalyzer`, `ComposerPsr4Map` — now call it. Patching only the reported line would have moved the crash rather than ended it: on a project without `app/Models`, the first failure is `ModelAnalyzer.php:527` instead.
- `GLOB_ONLYDIR` is deliberately **not** guarded. musl omits it too, but PHP has emulated it in `main/streams/glob_wrapper.c` for years — which is exactly why the reported error names `GLOB_BRACE` and not the left-hand operand.
- A `PHP 8.4 on Alpine (musl)` CI job. Every existing job runs on `ubuntu-latest`, which is how four unguarded sites accumulated unseen.

Trade-off: where the constant is missing, a brace pattern now matches nothing instead of erroring. Wildcards are unaffected, and no shipped default, README snippet or config example uses braces — the modular-monolith example is `app-modules/*/src`. Expanding braces in userland would preserve the capability, but that is code and a test for something nobody's config uses, on a platform/version pair PHP has already fixed.

## Architecture impact

- [x] No persisted graph schema, API, or generated-file format changed.
- [x] Existing scan data remains readable, or the migration/regeneration path is documented.

<details>
<summary>Compatibility or migration notes</summary>

No configuration change and no regeneration. Affected environments are musl-based PHP 8.0–8.4; every other environment is unaffected, which the output gate below demonstrates rather than asserts.

</details>

## Risk, security, and performance

- [x] No new route, endpoint, command, subprocess, or filesystem write was introduced.
- [x] Scan performance / memory use is unaffected or was measured on a representative project.
- [x] This change does not introduce a breaking change.

<details>
<summary>Risk, performance, or breaking-change notes</summary>

The full build output is byte-identical to `main` on three real applications, with a null arm (base against base) run first to confirm the corpora were stable. The change therefore cannot affect anyone whose PHP defines the constant. The only behavioural difference anywhere is on musl + PHP ≤ 8.4, where a scan now runs instead of aborting.

</details>

## Evidence

### Automated checks

- [x] `composer test:lint`
- [x] `composer test:unit` — 938 passed (2498 assertions)
- [x] `composer test:types` — no errors
- [x] Added or updated focused tests / fixtures.

Five new tests. Four cover the helper: wildcards, directories-only, no match, and brace expansion where the platform has it. The fifth is the regression guard that works on any platform — it walks `src/` and fails if `GLOB_BRACE` is named anywhere outside the helper. Reintroducing one unguarded site fails that test and only that test.

### Manual verification

1. Ran the failing call — `SourceDirectories::resolve(['app', 'src'])` against a fixture with an `app/` directory and no `src/` — inside six containers, before and after the patch. The probe requires `SourceDirectories.php` directly, so it needs no composer and no Laravel.

| image | libc | `GLOB_BRACE` | `GLOB_ONLYDIR` | before | after |
|---|---|---|---|---|---|
| `php:8.2-cli-alpine` | musl | **ABSENT** | yes | **Error at `SourceDirectories.php:79`** | OK |
| `php:8.3-cli-alpine` | musl | **ABSENT** | yes | **Error at `SourceDirectories.php:79`** | OK |
| `php:8.4-cli-alpine` | musl | **ABSENT** | yes | **Error at `SourceDirectories.php:79`** | OK |
| `php:8.5-cli-alpine` | musl | yes | yes | OK | OK |
| `php:8.4-cli` | glibc | yes | yes | OK | OK |
| `php:8.5-cli` | glibc | yes | yes | OK | — |

The error text matches the issue verbatim. The new CI job on this PR prints `GLOB_BRACE ABSENT, GLOB_ONLYDIR defined` before running the suite, so the job's own premise is visible in its log rather than assumed.

2. Measured what the guard costs where the constant is missing:

```
glob('…/{alpha,beta}/src', GLOB_ONLYDIR | GLOB_BRACE)   → 2 directories
glob('…/{alpha,beta}/src', GLOB_ONLYDIR)                → 0
glob('…/*/src',            GLOB_ONLYDIR)                → 2 directories
```

## UI and documentation

- [x] No user-visible behaviour changed.
- [x] Updated inline PHPDoc / TypeScript types where the public contract changed.

## Reviewer focus

The judgement call is the trade-off above: braces silently match nothing on musl + PHP ≤ 8.4 rather than being expanded in userland. Happy to add a userland expander if you would rather not lose the capability on that pair.

The three analyzers still duplicate the `is_dir()`-then-`glob()` shape around the new helper. Collapsing that too felt like more than a bug fix should carry, but say the word.

## Contributor confirmation

- [x] I have completed the required sections, kept this pull request focused, and have not included credentials, private source code, or scan output from a real application.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bdf33692ed0e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.