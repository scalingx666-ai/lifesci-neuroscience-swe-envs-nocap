# Issue

**Title:** Fix: AI context export contains no source, and prints provenance as PHP

## Description

## The AI context export contains no source, and prints provenance inside a ```php fence

`ContextExporter` builds its budget-gated snippets from `data['source']`:

```php
$source = (string) ($node['data']['source'] ?? '');
if ($source === '') {
    continue;
}
```

No analyzer ever puts code there. The only writer of that key is `GraphBuilder`'s command node, and what it stores is `ConsoleCommandDefinition::$source` — *where the definition was found*, one of `'class'`, `'route'` or `'kernel'`.

On one application's 10,142 graph nodes the effect splits two ways. For 10,029 the key is absent, so the loop `continue`s and the export has no code in it at all. For the remaining 113 — the commands — it produces this:

````
## Source: pim:prune-orphaned-product-listings {--tenant=*} (focal)
```php
class
```
````

And because no snippet is ever emitted, `--budget` governs nothing. The same route exported at `--budget=300` and at `--budget=50000` came out byte-identical apart from the header line, and **87% of it was the two dependency tables**.

### Reading the file the node already names

Nodes carry `data['file']` — 8,454 of those 10,142 — which is the same path the viewer's Source tab loads through `BrainController::source()`. The snippets read that instead.

Measured on the same route export:

| | before | after |
|---|---|---|
| total | 5,058 chars | 21,764 chars |
| source | none | 77% |
| dependency tables | 87% | 20% |

And the budget bounds it monotonically for the first time:

```
budget    500 ->  1,264 tokens,  0 source sections
budget  2,000 ->  1,935 tokens,  1
budget  6,000 ->  5,441 tokens,  4
budget 20,000 -> 14,174 tokens, 19
```

Reading is confined to the project being analysed. Node paths come from the scan and should already be inside it, but an export is something a person hands to a model, and reading outside the tree is not a mistake worth leaving reachable.

### Renaming the key

The command node's `source` becomes `definedIn`, so nothing is called `source` that is not source. Nothing consumed it: the viewer distinguishes an edge from a node by testing `source` **and** `target` together, which a command node never satisfied — close, but it never fired.

### Tests

4 tests covering the decision: a node whose file exists yields its code under a `## Source:` heading, a missing file yields nothing, a file outside the project is refused, and a node naming no file yields nothing.

### Verification

- Reproduced against a real application before and after, including the `class`-in-a-php-fence output, which is what sent me looking.
- `254 → 258 passed`, PHPStan 0, Pint clean.

### One thing this does not fix

The two dependency tables are still emitted unconditionally, ahead of any snippet, and subtracted from the budget rather than fitted into it. At `--budget=500` the export is 1,264 tokens — 2.5× the budget — of which 87% is those tables and none is code. That is a separate defect and I will raise it on its own.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `344eecae256a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.