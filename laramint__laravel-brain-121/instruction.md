# Issue

**Title:** Fix: record the container registrations the analyzer was dropping

## Description

`ContainerBindingAnalyzer` was dropping most of the container registrations written in front of it, and one branch downstream could never fire because of it.

## Measured

Distinct abstracts recorded, same provider paths both sides:

| Codebase | Before | After |
|---|---|---|
| Illuminate source (`vendor/laravel/framework/src`) | 100 | **167** |
| A 60-module Laravel application | 60 | **86** |

40% and 30% missing. Two causes, both confirmed by reading the code before changing it:

- `count($args) < 2` returned early, so `$this->app->singleton(Foo::class)` — an ordinary self-binding — was never recorded.
- The abstract was resolved with `resolveClassLike()`, which requires a namespace separator. Laravel's own bindings are routinely keyed by bare alias: `'mailer'`, `'cache'`, `'db'`. 61 of the 67 newly-found Illuminate registrations are exactly that.

## The unreachable branch was real

`FacadeRegistry::resolveWith()` only inspects facades whose accessor has **no** namespace separator — with one, `FacadeAnalyzer` sets `concreteFqcn` itself and `resolveWith` skips the facade. The registry only ever held keys **with** a separator. The two sets were disjoint by construction, so that branch could not fire on any input the two analyzers produce together.

Probed on a project with `singleton('short-url', ShortUrlService::class)` and a facade returning `'short-url'`: the facade resolved to `NULL` before and to `App\Services\ShortUrlService` after. It now resolves any application facade fronting a container alias — which is what the accessor-as-string branch of `FacadeAnalyzer` was written to feed in the first place.

The pre-existing test for that path hands the registry a `ContainerBindingRecord` built by hand — one that nothing could produce from source. It is left in place, and an end-to-end test now runs both analyzers over one fixture. That test asserts its own premise first (the accessor really is a bare key, `concreteFqcn` really is null) so it cannot pass vacuously.

## Widening paid for with tightening

The receiver check (`$this->app`, `$app`, `app()`) is the only thing separating a registration from any other `bind()`/`singleton()` call, so it was not relaxed — it was leaned on:

- **Single-argument form takes class-shaped arguments only.** A bare `->bind('x')` is the shape an unrelated one-argument `bind()` most often has. This costs nothing measurable: across both codebases every single-argument registration was class-shaped and none was bare.
- **The concrete position stays FQCN-only.** `bind(Foo::class, 'reporting')` is legal alias chaining, but `GraphBuilder` builds a node from `concreteFqcn`, and an alias there would materialise a class that does not exist. The abstract is recorded; the concrete is left null.
- **Alias charset** `^[A-Za-z0-9_][A-Za-z0-9_.-]*$`, derived from the 61 keys Illuminate actually uses. An out-of-shape key is missed, never mis-recorded.
- **Named arguments are read by name.** `bind(concrete: X, abstract: Y)` was previously recorded **backwards** — a false entry rather than a missing one, which is the worse defect of the two, and one that already occurs in the wild.
- **Spread and first-class-callable give up on the whole call.** `bind(Foo::class, ...$rest)` has an unreadable concrete; recording just the abstract would file it as a self-binding the source contradicts.
- **Self-bindings set concrete = abstract**, matching `Container::bind()`'s own `if (is_null($concrete)) { $concrete = $abstract; }`. Null already means "closure, unknown".

A `DecoyServiceProvider` fixture holds every one of those shapes, and a test asserts that **no** record carries that provider's name.

## No graph output changed

The obvious risk of widening a registry is churn in the graph. There is none, and it was measured rather than assumed: a second worktree at `main` produced `GraphBuilder` edge sets for all 18 pre-existing fixtures, compared byte for byte against this branch — identical, `GraphBuilderTest`'s exact `toHaveCount(63)` included.

The reason is structural: `maybeWireContainerBinding()` only fires when the abstract is an interface or an abstract class. Bare aliases are never a `calleeFqcn`, and self-bindings of concrete classes are not abstractions, so neither can add an edge. No existing assertion needed to move.

## Deliberately left out

`Container::bind()` also routes a one-argument **closure** through `bindBasedOnClosureReturnTypes()` — `singleton(static fn (): Generator => …)` binds `Generator`. It is real and genuinely single-argument, but reading it means resolving union and intersection return types into a set of abstracts, and it appeared twice across both codebases against 31 of the `X::class` form. Recorded as a decision in the source docblock so it reads as considered rather than missed.

## Verification

`pint`, `phpstan` and the suite are green — **417 passing**, 12 new, no existing test changed. Ten mutations were run and all ten killed: restoring the single-argument rejection, self-binding concrete to null, routing the single-argument form through the wrong resolver, resolving the abstract with `resolveClassLike`, dropping the charset rule, widening the concrete to aliases, reading named arguments positionally, removing the spread bail-out, class-only keys in the `$bindings` array, and disabling the receiver check.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c2bf14bbb41d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.