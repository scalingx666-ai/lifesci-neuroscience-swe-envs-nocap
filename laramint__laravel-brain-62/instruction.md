# Issue

**Title:** Trace API resource references as resource edges

## Description

## What

Teaches `MethodTracer` to recognise Eloquent **API resources**, which were previously invisible to the graph. `UserResource::make($user)`, `::collection($users)`, and `new UserResource(...)` now emit a `resource` ("transforms") edge, and **nested composition** inside a resource's `toArray()` is followed transitively. So a changed resource lights up the controllers that return it and the resources that embed it — the blast-radius that was silently missing before.

## How

Recognition mirrors Brain's existing `looksLike*` heuristics (models, jobs, mails):

- `looksLikeResource()` — true when the FQCN is under `App\Http\Resources\`, the conventional `make:resource` location. Precise enough **not** to collide with Filament's `\Filament\Resources\`.
- `handleStaticCall` / `handleNew` emit a resource hop (method `toArray`) for `::make` / `::collection` / `new`.
- `'resource'` is added to the deep-recursion sets, so a resource's `toArray()` is scanned and its nested resources linked (`resource → resource`).
- Sibling resources composed in the same namespace **without an import** are resolved against the current namespace (`qualifySibling`).
- New `resource` graph node type + `transforms` edge label.

## Deliberately excluded (each verified with a test)

- **Framework base classes** under `Illuminate\Http\Resources\` (`JsonResource::collection()`, `new JsonResource(...)`) — guarded by `isFrameworkClass`, so no edges to unopenable vendor nodes.
- **`self` / `static` / `parent`** keyword references — never mis-resolved to a phantom `\Http\Resources\static`.
- **A resource composing its own type** (a recursive tree of comments/interactions) — a self-loop that adds no reach.

## Tests

10 Pest tests in `ResourceEdgeTest`: `make` / `collection` / `new`, sibling-namespace resolution, transitive nested descent, model-hop preservation alongside the resource, the framework-class exclusion, the `self`/`static` phantom exclusion, the recursive self-loop exclusion, and the Filament non-collision, plus the graph-wiring (`action-to-resource` / `resource-to-resource` edges labelled `transforms`).

Verified: `pint` clean · `phpstan` (level 5 + larastan) **No errors** · full suite **121 passed**. Dogfooded against a real ~large Laravel app (99 resources): **51 resource→resource composition edges**, correct action→resource links, and — after the guards above — **0** framework, phantom, or self-loop edges.

## Note

Independent of #58 (observers), #60 (policies), #61 (Blade view composition). All branch from `main`; this one touches `MethodTracer`, so a trivial rebase may be needed depending on merge order. Happy to do that.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3606ddd7ec79`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.