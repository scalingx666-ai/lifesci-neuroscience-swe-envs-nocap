# Issue

**Title:** Stop skipping files that open with declare(strict_types=1) in the binding, facade and inheritance scans

## Description

## What

Three scans unwrap a file's namespace only when it is the *first* statement in the AST. A file that opens with `declare(strict_types=1);` shifts the `Namespace_` node to index 1, so the unwrap never fires, no top-level `Class_` is found, and the file is silently skipped — one bug class, three surfaces:

- `ContainerBindingAnalyzer::scanFile()` — **strict-typed apps get zero container-binding records**, across both registration surfaces (`bind()`/`singleton()`/`scoped()` calls and the `$bindings`/`$singletons` properties).
- `FacadeAnalyzer::topLevelStmts()` — feeds all three facade scans (`scanFile()`, `isInFacadeChain()`, `findAccessorInChain()`), so a strict-typed facade never reaches the registry, and a strict-typed intermediate parent silently breaks chain and accessor resolution for its children.
- `GraphBuilder::extractExtendsFromAst()` — the method inheritance walk (`findMethodNodeInChain()`, which feeds flow steps and complexity metrics) cannot resolve the parent of a strict-typed child class, so inherited methods read as missing.

## How

Each unwrap now iterates the top-level statements to the first `Namespace_` — the same iteration `PhpExtendsFqcnResolver::namespaceFromAst()` already performs to resolve the namespace string, so the namespace string and the statement list can no longer disagree about where the namespace lives. Files without a namespace fall through unchanged.

## Scope

- Behavioral surface is the three statement unwraps only — extraction, name resolution, and registry semantics are untouched.
- Files without a leading `declare` scan exactly as before (every pre-existing fixture test passes unchanged).
- Found while building [sandermuller/richter](https://github.com/SanderMuller/richter) on top of Brain: its fixture app enforces `declare(strict_types=1)` via Pint, which made every container binding vanish from the graph — the silent-empty failure shape that made this worth fixing at the root. The facade and inheritance-walk instances are the same pattern found by sweeping `src/` for the remaining `$stmts[0] instanceof Namespace_` sites; after this PR that sweep comes back empty.
- Adjacent observation, deliberately **not** touched here: `ContainerBindingAnalyzer::scanFile()` still scans only the first class per file (`break` after the first `Class_`). Fine for real-world providers — noting it only so the scope of this fix is unambiguous.

## Tests

- Fixture project `tests/fixtures/strict-types-project/` (the `security-project` pattern, so `GraphBuilderTest`'s exact edge-count assertion on the shared `laravel-project` fixture stays untouched) grows a strict-typed facade pair — concrete `StrictClockFacade` plus abstract parent carrying `getFacadeAccessor()`, exercising all three facade call sites in one chain — and a strict-typed controller pair whose method lives on the parent only.
- `ContainerBindingAnalyzerTest`: *it extracts bindings from a provider that opens with declare(strict_types=1)* — fails on `main` (the registry comes back empty), passes with the fix.
- `FacadeAnalyzerTest`: *it discovers a facade whose files open with declare(strict_types=1)* — fails on `main` (the facade never reaches the registry), passes with the fix.
- `FindMethodNodeInChainTest`: *it walks the inheritance chain of a class that opens with declare(strict_types=1)* — follows the `ResolveBladePathTest` reflection pattern for private-method coverage; fails on `main` (the walk returns null), passes with the fix.

Verified: full Pest suite **114 passed (450 assertions)** · Pint clean · PHPStan **No errors**. The 3 deprecation notices in the suite are pre-existing vendor tooling on PHP 8.5 (`pest-plugin-arch` calling `ReflectionProperty::setAccessible()`), unrelated to this change.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3606ddd7ec79`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.