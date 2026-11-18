# Issue

**Title:** neuronapi: add top-level objref/strdef get and set accessors

## Description

Adds four accessors for top-level HOC `objref` and `strdef` symbols:

```c
Object* nrn_symbol_object_get(const Symbol* sym);
int     nrn_symbol_object_set(Symbol* sym, Object* obj);
const char* nrn_symbol_str_get(const Symbol* sym);
int     nrn_symbol_str_set(Symbol* sym, const char* value);
```

## What and why

This is the #3821 follow-up. `nrn_symbol_dataptr` correctly returns `NULL` for an `objref` or `strdef` since neither is a `double*`, but there was no way to read or write the actual object/string. The data lives in the top-level object-data array (`hoc_top_level_data[sym->u.oboff].pobj` / `.ppstr`), which the public header didn't expose, so a binding had to route through HOC trampolines (an `obfunc` for objrefs, a print-capture for strdefs, and `proc` shims for the writes). These accessors replace all of that.

- `object_get` returns the bound object borrowed (no refcount bump; nil or wrong type -> `NULL`).
- `object_set` follows HOC's assignment refcounting (release old, retain new; `NULL` clears the objref).
- `str_get` returns the string (wrong type -> `NULL`); `str_set` copies via `hoc_assign_str` (frees the old).
- A symbol of the wrong kind returns `NULL`/nonzero rather than crashing.

## Changes

- `src/nrniv/neuronapi.h`, `src/nrniv/neuronapi.cpp`: the four functions.
- `docs/capi.rst`: documented, with the Python equivalents (`n.obj` / `n.s`).
- `test/api/symbol_object_string.cpp`: get/set round-trips for both kinds, HOC-visibility of the writes, nil-clearing, and all four type-mismatch rejections. Registered in `test/api/CMakeLists.txt`.

Same structure as #3810. `make format-pr` clean (clang-format 12.0.1, cmakelang 0.6.13); `ctest -R symbol_object_string` passes, full `api::` group green.

Per the #3821 discussion ("can we grab a top-level string or object?"). Setters are included because a binding also needs to *write* these (e.g. `n.s = ...`); happy to split get-only if you'd prefer.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `61cb128d873b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.