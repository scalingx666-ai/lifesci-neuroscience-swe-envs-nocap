# Issue

**Title:** Feat: allow custom auth middleware patterns via config

## Description

## Summary
This PR adds an option to allow custom auth middleware patterns via config.

## Problem
Brain hardcodes its list of authentication middleware in SecurityAnalyzer::AUTH_PATTERNS. Any application using a custom auth middleware (e.g. a BFF token layer, a custom JWT guard, or any alias that doesn't start with auth, sanctum, jwt, passport, or verified) gets a false "Public Route" warning on every protected route, because Brain resolves the alias to its FQCN and that FQCN doesn't match any known pattern.

There is currently no way to tell Brain about custom auth middleware without modifying vendor code.

## Solution
Add a security.auth_middleware config key that accepts additional middleware aliases or FQCN prefixes. These are merged with the built-in patterns at analysis time using the same case-insensitive prefix matching already in place. 

Both forms work:

```
// config/laravel-brain.php
  'security' => [
      'auth_middleware' => [
          'auth.custom', // matched as alias prefix
          'App\\Http\\Middleware\\CustomAuth', // matched as FQCN prefix
      ],
  ],
```

## Changes
- `config/laravel-brain.php` — new security.auth_middleware key (defaults to [], no behaviour change for existing users)                                       
- SecurityAnalyzer — accepts extraAuthPatterns as a constructor parameter; merges with `AUTH_PATTERNS` in `ClassifyExposure()`
- ProjectAnalyzer — reads the config key and passes it to SecurityAnalyzer
- `tests/Unit/SecurityAnalyzerTest.php` — new test file covering baseline built-in patterns, the false-positive case (custom alias with no config), and both matching strategies (alias prefix and resolved FQCN)

## Behavior Impact
- Default is [] — no change in behaviour for existing users
- Extra patterns follow the same prefix matching as built-in ones, so 'auth.custom' matches auth.custom:api, and a FQCN matches with or without a guard suffix

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8e2e9a49359d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.