# Issue

**Title:** Feat: show what a queued job promises when it goes wrong

## Description

A job node carried its name, its file and its flow — so "this runs on a queue" was the whole story. Not whether a failure is retried, not whether a second dispatch is dropped on the floor, not whether the job refuses to overlap with itself. Those are the differences that matter at three in the morning.

<table>
<tr>
<td><img src="https://raw.githubusercontent.com/webard/laravel-brain/pr-media/120-jobs/job-unique-timeout.png" width="380"></td>
<td><img src="https://raw.githubusercontent.com/webard/laravel-brain/pr-media/120-jobs/job-middleware.png" width="380"></td>
</tr>
</table>

The section appears only when the job declares something. A job that declares none of it gets no section at all — six nulls say less than nothing.

## Two sources, for two kinds of fact

Interfaces and the `Batchable` trait are asked of the **loaded class**, because `ShouldBeUnique` is as often inherited from a base job as written on the job itself.

Everything else is read from the **source**. A declared `$tries = 5` is a fact the file states, and instantiating a job to ask it is not something an analyzer should do — a constructor can take models, open connections, or throw.

## A fact expressed as a method is still a fact

Reading properties alone would have found a third of it. Measured on an application of 113 jobs:

| declared as | count |
|---|---|
| `ShouldBeUnique` | 44 |
| `uniqueId()` | 32 |
| `middleware()` | 14 |
| `retryUntil()` | 8 |
| `$timeout` | 8 |
| `$tries` | 7 |
| `backoff()` | 4 |

So a method is reported too — as its **value** where the body is a single `return 60;`, and otherwise as **decided at runtime**. A computed backoff cannot be reduced to a number by reading the source, and printing a guess would be worse than printing nothing.

Middleware names come from the `new` at the **root** of each entry. Middleware is habitually configured by chaining, and the outermost node of

```php
new WithoutOverlapping($key)->releaseAfter(60)->expireAfter(180)
```

is a method call, not the class anyone means. A bare `SomeMiddleware::class` entry is read too.

## Scope

This enriches the job nodes a graph already has; it does not discover jobs. On the application measured that is 27 of 113 — the rest are not reachable from any traced call chain, which is a separate question from this one.

`Bus::chain()` and `Bus::batch()` are deliberately left out. They are call-site facts rather than class facts, and showing a chain properly means grouping its members and drawing the order between them — the region machinery from #117. Once that is in, a chain can reuse it rather than grow a second copy. The class-level half of it, the `Batchable` trait, is included here.

## Verification

`pint`, `phpstan` and the suite are green — 413 passing, 8 new. Three rules were mutation-checked: dropping the literal-return read, taking the outer node of a middleware chain instead of its root, and letting a job that declares nothing through to the panel each turn a test red.

`Batchable` reported zero across the measured graph, so rather than trust the zero it was checked directly against a job known to use the trait, which reports `batchable: true`. None of the reachable job nodes happens to be one of the four that use it.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8b7851a8a1d5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.