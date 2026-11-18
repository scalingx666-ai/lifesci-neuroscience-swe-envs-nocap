# Issue

**Title:** Read array route actions, and apply the namespace a provider gives them

## Description

. Stacks on #73 — review that one first; this branch contains it.

## What

`Route::get($uri, ['as' => ..., 'uses' => 'Controller@method'])` was read as the positional
`[Controller::class, 'method']` form, because both are arrays of two entries. So the route's own
**name** became its controller, the `uses` string was left unsplit as the action, and any
`middleware` in the array was dropped. The one-entry `['uses' => ...]` matched neither shape and
produced no route at all.

This is current syntax rather than something removed. `Router::convertToControllerAction()` in
Laravel 12.26 still turns a string action into `['uses' => $action]`.

Separately, a controller named as a string was never qualified, for two reasons that compound:

- the registration scanner looked for a routes file passed to `Route::group()` **by path** and
  skipped closure arguments, so `Route::group($attrs, fn () => require base_path(...))` — the
  shape `laravel/laravel` shipped for years — recorded nothing, and the file was then parsed with
  no context at all, losing the group's middleware and prefix along with its namespace;
- the namespace is conventionally held in a provider property and written
  `'namespace' => $this->namespace`, which the literal-string reader returned `''` for even once
  the registration was found.

| shape | before | after |
|---|---|---|
| `['as' => 'b.name', 'uses' => 'BetaController@show']` | controller `b.name`, action `BetaController@show` | controller `BetaController`, action `show` |
| `['uses' => 'GammaController@edit']` | no route at all | controller `GammaController`, action `edit` |
| `['uses' => ..., 'middleware' => 'auth']` | middleware dropped | `auth` kept |
| provider group requiring its routes in a closure | no namespace, no middleware, no prefix | all three applied |

## Prepending a namespace needs the router's guards

The existing code applied a group namespace to any controller not starting with `\`. That was
harmless only because the namespace was almost always empty; with the registration above it
starts arriving, and the missing guards show up immediately. The router has two, and both matter:

1. **Only a string action takes a group namespace.** `actionReferencesController()` is true for a
   string, or an array whose `uses` is a string — a `[Controller::class, 'method']` pair names the
   class outright and is left alone.
2. **A name that already begins with the namespace is left alone.** `Controller::class` evaluates
   to a fully-qualified string at runtime, so without this a `Route::resource` inside a namespaced
   group is prefixed twice.

Both are implemented here. The second compares on a separator where the router compares on the
raw string, and the difference is load-bearing: the router is always holding the whole merged
namespace by the time it checks, while a group here contributes one segment at a time, so `Admin`
turns up as a string prefix of `AdminController` while being no namespace of it. Comparing raw
would silently un-qualify that controller.

## Effect on a real graph

Measured against #73, this branch's base. Edges compared on `(source, target, type, label)`.

| application | routes with an unusable controller | nodes | edges | edges vanished |
|---|---:|---:|---:|---:|
| A — 1,084 files | 321 of 451 → **0** | 2,891 → 3,543 | 5,576 → 8,972 | **0** |
| B — 1,885 files | 0 → 0 | unchanged | unchanged | **0** |
| C — 4,152 files | 0 → 0 | 2,467 → 2,457 | 5,018 → 5,007 | **0** |

A is the application written in this style, and its routes also go from 66 with no middleware to
none. The graph grows because 321 routes that previously dead-ended now reach a controller, and
the call chains hanging off those controllers get traced for the first time.

B does not move at all. C loses twelve nodes and gains two: six of its controllers were being
**double-prefixed** already — `Api\Plugin\App\Http\Controllers\Api\Plugin\PluginSessionDataController`
— and guard 2 collapses those onto the real ones. That is a pre-existing defect this happens to
fix rather than anything new.

## Cost

This is the expensive one, and the cost is real rather than an artefact. Medians of five, three
rounds:

| application | #73 | this branch | |
|---|---:|---:|---|
| A | 1,837 ms | 2,449 ms | **+34%** |
| B | 1,635 ms | 1,635 ms | 0% |
| C | 3,008 ms | 3,016 ms | 0% |

All of it lands on A, whose edge count grows 61%. It is the price of tracing 321 routes that were
previously being skipped, not a slower way of doing the same work — B and C, which gain no routes,
do not move at all. Worth knowing before merging: an application in this style pays a third more
scan time, and gets a graph that actually contains its controllers.

## Tests

`198 passed (696 assertions)` · PHPStan level 5 + larastan **No errors** · Pint clean.

Five new. Four fail on #73 and pass here: the array action form, the provider group that requires
its routes in a closure, the double-prefixing guard, and the leading-backslash controller. The
fifth — a controller whose name merely begins with the namespace segment — passes on #73 too,
because #73 has no such guard to get wrong. It is a regression test for guard 2 rather than a fix,
and it is here because I got that comparison wrong the first time and it cost C its `Admin\`
prefix before the separator went in.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3687ae425513`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.