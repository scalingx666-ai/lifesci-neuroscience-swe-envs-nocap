# Issue

**Title:** Fix: drop subgraphs whose route no longer exists

## Description

## Drop subgraphs whose route no longer exists

A scan writes one subgraph blob per tab and never removes the ones it did not write. `subgraphIds()` reports whatever is stored, so a route that is deleted or renamed leaves its blob behind and the viewer keeps listing a tab for a surface the application no longer has.

Measured on one application: a package upgrade changed a module's route surface, and the eight URIs it dropped left **33 orphaned tab files** in `storage/app/laravel-brain/`. Three days and several scans later they were still listed — there is no path by which they ever go away, short of deleting the directory by hand.

Both drivers leaked: `FileGraphStore` never unlinked a file, `DatabaseGraphStore` never deleted a row. So pruning goes on the `GraphStore` contract, next to the `subgraphIds()` it mirrors, and both places that persist a scan call it — `ScanCommand` and `BrainController`.

### Why pruning to "what this scan wrote" is safe

This was the one thing worth checking, because getting it wrong would delete live tabs on every `--watch` poll rather than leave dead ones around.

It holds: a scoped rescan merges its partial result into the previous graph and the splitter runs on the **merged** graph, so `$result->subgraphs` is the complete tab set in both the full and the scoped mode. Both modes then persist through the same block in `ScanCommand::runScan()`. There is no path that writes a subset of tabs.

The manifest is not a tab and is excluded by `subgraphIds()` already, so it survives pruning — including `pruneSubgraphsExcept([])`, which there is a test for.

### Alternative considered

A `--prune` flag, leaving the current behaviour as the default. I did not take it: the store is a cache of the last scan, and a blob no tab can address is not data the flag would be protecting. Happy to add the flag instead if you would rather the drivers never delete without being asked.

### Tests

5 new tests against `FileGraphStore`: a subgraph the scan did not write is dropped, ones it did write are kept, the manifest is never pruned, an empty store is a no-op, and a rewritten subgraph keeps its new content.

`DatabaseGraphStore` has no test — the Unit suite runs on plain PHPUnit with no Laravel container or connection, and standing one up for this seemed a larger change than the fix. The implementation is the same query `subgraphIds()` already uses, with `delete()` and a `whereNotIn`.

Full suite: `259 passed (861 assertions)`, up from 254. `pint` clean, `phpstan` 0 errors.

### Compatibility

The contract gains a method, so a third-party `GraphStore` implementation outside this package would need to add it. Both in-tree drivers implement it, and no stored payload changes shape — the only difference is that a scan now leaves the directory (or table) holding exactly the tabs the manifest lists.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `344eecae256a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.