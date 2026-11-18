# Issue

**Title:** Feat: support the OPTIONS and QUERY HTTP methods

## Description

Two HTTP verbs the viewer could not name. One of them was already in the data.

<table>
<tr>
<td><img src="https://raw.githubusercontent.com/webard/laravel-brain/pr-media/128-methods/method-chips.png" width="520"></td>
</tr>
</table>

## OPTIONS was extracted from the start and never once displayed

`RouteAnalyzer` has recognised `Route::options()` in its `HTTP_METHODS` list since the beginning, and the live-router path yields OPTIONS from `$route->methods()` like any other verb. The gap was on the other side: membership in the frontend's `METHOD_COLORS` is what makes a verb visible at all — `splitLabel`, `routeSegments` and the chip filter each ask whether a label's first word is in that map before treating it as a method.

A verb the analyzer emits but the map omits therefore renders its **entire** label as the URI. An `OPTIONS /health` route displayed as a path literally called "OPTIONS /health", sorted under that spelling, and could not be filtered. Measured on a 60-module application: one such route, misrendered that way for as long as the viewer has existed.

## QUERY, without pretending it exists yet

QUERY (RFC 9110bis — safe and idempotent, carries its query in the request body) is in the verb list, but nothing here guesses it into a route. `Route::query()` and the `Router::$verbs` entry were merged in **laravel/framework#60655**, which went to `master` (the 14.x line) and not to 13.x. On 9 through 13 the only spelling is `Route::match(['query'], …)`.

Hard-coding either verb list would be wrong on half the support matrix — it would drop a real QUERY endpoint on 14.x or invent one on 13.x. The shared list deliberately never includes QUERY, so the method is recognised where the framework has it and absent where it does not.

## The two new colours were measured, not eyeballed

Against the five existing chips the tightest pair is POST/PATCH at **ΔE2000 19.3**, so that is the bar a new colour has to clear. Cyan (OPTIONS) sits at ΔE 22.4 from its nearest neighbour, pink (QUERY) at 18.6. Both hold up in either theme: contrast is 10.5 and 7.2 against the dark panel and 1.8 and 2.7 against the light one, inside the 1.7–2.8 band the existing five already occupy — and a toggled chip additionally paints a 16% tint and a 55% border of its own colour.

The chip row now wraps. At the 280px minimum sidebar width seven chips leave roughly 32px each while "OPTIONS" needs about 42px at 10px mono, so a fixed row would have clipped it to "OPTIO". `flex: 1 1 auto` lets a short row still fill the width and a long one spill onto a second line.

## Verification

`pint` clean, `phpstan` no errors, **420 tests passing**, and confirmed end to end on a real application: the seven chips render, and the previously misrendered OPTIONS route now carries a method badge and a path that can be filtered.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7e4a6ae032af`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.