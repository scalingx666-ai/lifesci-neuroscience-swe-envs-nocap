# Issue

**Title:** Resolve names during parsing so analyzers stop guessing FQCNs

## Description

## What

Runs nikic's `NameResolver` during parsing so every `Name` node carries a `resolvedName` attribute, and exposes `PhpFileParser::resolvedName()` to read it. Analyzers can now ask the parser for a real FQCN instead of hand-rolling `useMap[...] ?? qualify()` string heuristics — the root cause of a class of resolution bugs.

## Why

Today `PhpFileParser` only builds a `useMap` from `use` statements. Every analyzer then resolves names by hand, which silently mis-resolves:

- **same-namespace siblings** — `Foo::bar()` / `new Foo()` referenced by short name in its own namespace (no import) resolves to the bare `Foo`, so its call chain vanishes;
- **group-use imports** — `use App\Models\{User, Order}` is invisible to the useMap;
- **leading-`\` fully-qualified** names — resolved inconsistently.

## How — additive, zero-risk

- `NameResolver` runs in **non-destructive mode** (`replaceNodes => false`): it only *adds* a `resolvedName` attribute. The original nodes are untouched, so `->toString()` and the `useMap` are unchanged and **every existing consumer keeps working**.
- Errors are **collected, not thrown**, so a semantically-invalid but parseable file (e.g. a duplicate `use` alias — which `NameResolver` rejects) still scans instead of aborting mid-traverse. (Covered by a test, since it's a load-bearing safety property.)
- `NameResolver` and the use-map collection now share a **single traversal**.
- `resolvedName()` returns `null` for the reserved `self`/`static`/`parent` keywords (the caller resolves those against its own class context) and for any `Name` from an AST that never went through the parser — so the `?? useMap` fallback is always safe.
- `parseCode(string)` is extracted from `parse(filePath)` for testability.

## Consumer migration (proof, not dead code)

`MethodTracer`'s four **direct class-reference** sites — `handleStaticCall`, `handleNew`, `handleAssign`, `handleClassConstFetch` — now prefer `resolvedName()` before the useMap fallback. This fixes the same-namespace-sibling gap end-to-end, including the common `$x = new Foo(); $x->bar()` shape.

**Scope:** the `new X` arguments *inside* facade helpers (`Bus::dispatch(new Job)`, `Event::dispatch(new E)`, etc.) still use the useMap — those targets are near-always imported, and threading the Name node through the arg extractors is a separate step. The parser capability is in place for the rest of the analyzers to adopt incrementally.

## Tests

`PhpFileParserResolutionTest` (group-use / aliased / same-namespace / fully-qualified / `self` / additive-ness / duplicate-alias-doesn't-throw / null-fallback) and `MethodTracerResolutionTest` (same-namespace `new` and assign-then-call now link). The same-namespace model FQCN move is more correct — `GraphBuilder` keys model nodes on the FQCN, so the qualified name is the canonical node, not an orphan.

Verified: `pint` clean · `phpstan` (level 5 + larastan) **No errors** · full suite **121 passed**. Dogfooded across **1,500** files of a real large app: **0 parse failures**, ~46% of all `Name` nodes resolved (the rest are declarations / `use` names / reserved keywords).

## Note

Independent of #58/#60/#61/#62. This is the root-cause fix behind several resolution hacks in those PRs (e.g. #62's same-namespace `qualifySibling`) — once merged, those can lean on the resolver instead. Branches from `main`; trivial rebase may be needed by merge order.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3606ddd7ec79`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.