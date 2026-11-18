# Issue

**Title:** fix(ast-extractor): split multi-base clause into one inherits edge per base

## Description

Filed as #251: Python's `inherit_pat` captures the whole parenthesized clause as one string, so `class Dog(Animal, Mixin):` matched `group(2)` as the literal `"Animal, Mixin"` and built a single inherits edge to `<file>::Animal, Mixin`, a node id that never exists (the real `Animal`/`Mixin` nodes are `<file>::Animal` and `<file>::Mixin`). Multiple inheritance and mixins are common Python, so every such class was silently dropping its real inheritance edges and getting a phantom one instead.

Added `_split_base_clause()`: splits on top-level commas (tracking bracket depth so a generic like `Mapping[str, int]` isn't split on its internal comma), drops keyword args (`metaclass=...`), and emits one inherits edge per real base.

I checked Kotlin's and C++'s `inherit_pat` too since they're in the same `LANGUAGES` list. Both only capture a single `\w+` identifier for the parent, so `class Foo : Base(), Iface1, Iface2` (Kotlin) and `class X : public A, public B` (C++) don't get this exact compound-string bug, but they do silently drop every base after the first (verified: both regexes only capture the first name). Left those alone here, different fix per language (Kotlin's `:` is ambiguous between the superclass and interfaces, C++ repeats the access specifier per base), happy to open that separately if useful.

Added three tests: multi-base emits both edges instead of the concatenated one, a `metaclass=` kwarg is dropped, and a bracketed generic base isn't split on its internal comma. The new tests don't pass on main and do pass on this branch, checked in Docker on both 3.9 and 3.12 (the CI matrix). Full suite is green here too, same `test_code_understand_cli.py` failures as on plain main (missing `python3` binary in that container, unrelated to this change).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `121a4e4e2d45`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.