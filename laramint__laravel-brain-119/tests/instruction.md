# Issue

**Title:** Fix: stop calling every property read in a loop an N+1

## Description

The N+1 marker was mostly noise. `FlowExtractor::isQuery()` answered yes for **any** `PropertyFetch`:

```php
if ($expr instanceof Node\Expr\PropertyFetch) {
    $obj = $this->shortExpr($expr->var);   // computed, never read
    // If it's $this->relation or $item->relation, it's often an N+1
    return true;
}
```

That `$obj` is the leftover of a condition nobody wrote. And because a method call falls through to its receiver, `$this->service->handle()` inside any loop registered as a query — a shape that appears in almost every loop. Measured on a real application: **28 of 33 markers came from that one branch.**

## What it asks now

A relation read is an N+1 when it is read **off the value the loop is iterating**. The fetch chain is followed back to its root variable, and that root has to be bound by an enclosing `foreach`:

| in a loop | before | now |
|---|---|---|
| `$order->customer` (loop binds `$order`) | N+1 | N+1 |
| `$order->customer->address` | N+1 | N+1 |
| `$this->releaseClaim->execute($row)` | N+1 | — |
| `$this->config->timeout` | N+1 | — |
| `Warehouse::query()->find($id)` | N+1 | N+1 |

The loop's variable is popped when the loop ends. The extractor is reused across every method it charts, so a name left bound goes on flagging reads of that name in the next loop and in the next method — there is a test for exactly that, and it was written because a mutation of the pop survived the first round of tests.

## Applications that autoload relations

`Model::automaticallyEagerLoadRelationships()` loads the relation for the whole collection on first touch, so even the genuine shape is not an N+1 there and the branch is skipped.

It arrived in **Laravel 12.8** and this package supports 9 through 13, so the call itself is the version gate: on anything earlier there is no such method and the attempt throws, which is the same answer as "off" — an application that cannot turn it on has not turned it on. A `method_exists` guard would read better but cannot be written honestly, because static analysis runs against one installed version where the method always exists.

Asking the framework also beats scanning providers for the call, which would miss it being set from a package, a config flag, or a conditional.

An explicit query in a loop is untouched by any of this: batching relation access does not batch a query somebody wrote out.

## Measured

On the same application, end to end:

| | markers |
|---|---|
| before | **33** |
| after narrowing to the loop variable | **7** |
| after also honouring relation autoloading | **6** |

The narrowing does the work; autoloading removes one more here. Survivors were spot-checked and are real — for instance a command calling `$destination->subscriptionTenants()->get()` and `forceDelete()` once per row, neither of which autoloading batches.

## Verification

`pint`, `phpstan` and the suite are green — 413 passing, 7 new tests covering both directions of each rule. All three rules were mutation-checked: restoring "every property fetch is a query", ignoring autoloading, and dropping the loop-variable pop each turn a test red. The third only did so after a test was added for it — the first mutation of the pop survived, which is what surfaced the cross-method leak.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c2bf14bbb41d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.