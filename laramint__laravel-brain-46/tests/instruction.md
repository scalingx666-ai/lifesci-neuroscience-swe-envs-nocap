# Issue

**Title:** Refactor RouteAnalyzer to enhance path resolution

## Description

## Fix route file detection when using grouped route files with prefixes

### Problem

When routes are registered using:

```php
Route::prefix('api/admin')
    ->group(base_path('routes/admin.php'));
```

the package cannot reliably determine the original route file (`admin.php`, `restaurant.php`, etc.) because Laravel stores the controller action instead of the route file path in the route action metadata.

This causes incorrect or missing route grouping/filtering when trying to identify routes by file source.

### Solution

This PR improves route detection by using the generated route URI/prefix instead of relying on the `uses` action metadata.

Example:

* `api/admin/*` → `routes/admin.php`
* `api/restaurant/*` → `routes/restaurant.php`

### Benefits

* Works correctly with Laravel 13 route registration style
* Supports grouped route files with prefixes
* Fixes route filtering for modular route structures

### Tested

Tested with:

* Laravel 13
* Multiple grouped route files
* Prefixed API routes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f02e2d71cd25`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.