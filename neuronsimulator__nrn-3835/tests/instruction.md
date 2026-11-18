# Issue

**Title:** neuronapi: add section-tree accessors (parent, trueparent, child, sibling)

## Description

Adds four read-only section-tree accessors to the public C API: `nrn_section_parent`, `nrn_section_trueparent`, `nrn_section_child`, `nrn_section_sibling`.

## What and why

The public API can create and connect sections but cannot read the tree back. There is no `parent`, `trueparent`, `child`, or `sibling` accessor -- only `nrn_section_connect`, which *sets* a connection. So a binding that needs `parentseg`, `trueparentseg`, `subtree`, `wholetree`, or a children iteration has to go through a HOC `SectionRef`, and **constructing a `SectionRef` bumps the global object-id counter** -- an observable divergence from simply reading the connectivity.

```c
Section* nrn_section_parent(Section* sec);      // sec->parentsec
Section* nrn_section_trueparent(Section* sec);  // nrn_trueparent(sec)
Section* nrn_section_child(Section* sec);       // first child
Section* nrn_section_sibling(Section* sec);     // next child of the same parent
```

These return the same sections a `SectionRef`'s `parent` / `trueparent` / `child` yield:

- `parent`, `child`, `sibling` are direct reads of the `Section` connectivity fields (`parentsec`, `child`, `sibling`).
- `trueparent` reuses the existing `nrn_trueparent` -- the same function `SectionRef.trueparent` calls -- so a section joined at its parent's `0` end reports the climbed-through parent, not the immediate one.
- `child` + `sibling` iterate a section's children in `SectionRef.child[i]` order:
  ```c
  for (Section* c = nrn_section_child(p); c; c = nrn_section_sibling(c)) { ... }
  ```

Each returns `NULL` when there is nothing to return (a root has no parent, a leaf no child) and on a `NULL` section.

Note for downstream bindings: reading the tree this way no longer creates a `SectionRef`, so it does not advance the object-id counter the way the `SectionRef` route does. That is a deliberate, if small, behavior change relative to routing through `SectionRef`.

## Changes

- `src/nrniv/neuronapi.h`, `src/nrniv/neuronapi.cpp`: declare + define the four accessors.
- `docs/capi.rst`: documented each, with the child/sibling iteration idiom.
- `test/api/section_tree.cpp`: builds a known tree and checks every edge -- including `axon` joined at `soma`'s `0` end, where the true parent (`NULL`) differs from the direct parent (`soma`) -- plus child/sibling iteration and null-section safety.

Same structure as #3810. `make format-pr` clean (clang-format 12.0.1, cmakelang 0.6.13). `ctest -R section_tree` passes; the `api::` group is green.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c8289d44cd66`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.