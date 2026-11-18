# Issue

**Title:** Give the benchmark application facades and the imports a real app has

## Description

## What

The generator wrote no application facade. The facade phase on CI is a 15 ms first-read of a tree that has none, so a broken `FacadeAnalyzer` would not move counts. #134's timing claim is idle there for the same reason.

It now emits two, unscaled. `App\Facades\Catalog` is the ordinary `extends Facade`. `App\Support\Reporting` reaches the base through an abstract parent and its own file never names `Facade`, which is the second pass. `Controller000` and `Controller001` call them.

Almost every other generated class now has `use Illuminate\Support\Facades\Log` (or Cache, DB, Auth, Session, Storage). That is the line a real app file carries, and the line the prefilter has to skip. The imports are unused; class bodies are unchanged.

## Why this shape

One of each application facade is enough for the second pass to run. Scaling them with the tree would add more without making the scan more like a real app.

The imports close a different gap. On a tree that only had the two definitions, reverting the `Facades\` skip still only admitted a handful of files. With the imports, the same revert sends `FacadeAnalyzer` from 6 parses to 399.

`MethodTracer` does not hop a static call on an application facade, so `facade-resolves-to` edges still do not appear.

## Cost

Nothing timed. Unused `use` lines. The suite's facade phase is 15 ms with a ±16% floor; this will not make a second-pass I/O win visible there.

## Gate

Same Brain, old tree vs this tree, scale 1, PHP 8.5: files 395 → 398, facades found 0 → 2, parse() 216 → 222, nodes / edges / tabs / routes unchanged (719 / 1,953 / 195 / 160). The import lines do not add parses: `scan-small` is still 222 against the first commit of this PR.

This PR's CI comment will still show identical counts between arms. Both scan the new tree with the same analyzer. The next PR that drops the `Facades\` skip is the one that will move parse calls, by hundreds.

## Tests

`406 passed (1135 assertions)` · PHPStan level 5 + larastan **No errors** · Pint clean.

The test dies if `Reporting.php` is missing, if `Controller000` no longer calls `Catalog`, if fewer than 90% of app files import a framework facade, or if `FacadeAnalyzer` parses 10 or more files on that tree.

Mutations: empty `frameworkFacadeImport` → `2 is not greater than 358`. Raw `str_contains($code, 'Facade')` in `mightDefineFacade` → `399 is not less than 10`.

Made with [Cursor](https://cursor.com)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c2bf14bbb41d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.