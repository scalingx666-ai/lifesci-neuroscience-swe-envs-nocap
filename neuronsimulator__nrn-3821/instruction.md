# Issue

**Title:** neuronapi: return nullptr from nrn_symbol_dataptr for non-scalar symbols

## Description

, addressing the post-merge review note.

`nrn_symbol_dataptr` returned `sym->u.pval` for any symbol that wasn't a NOTUSER scalar, so asking for the dataptr of a symbol with no double storage — a function like `finitialize`, a top-level `objref`/`strdef`, or a section-level property (`nseg`/`L`/`Ra`/`rallbranch`) — handed back a reinterpreted union member that dereferences to garbage.

This returns `nullptr` for those instead. The function now yields a real `double*` only for a scalar/array `VAR` (`USERDOUBLE`, the typed `USERINT`/`USERFLOAT` that alias `sym->u.pval`, and `NOTUSER` whose storage lives in the top-level object-data array), and `nullptr` for everything else — which also answers the "is a top-level object or string fine?" question: those now return `nullptr` rather than a bogus pointer.

`test/api/global_scalar.cpp` gains the `nullptr` cases (null symbol, `finitialize`, a top-level objref and strdef, and `L`), and the `capi.rst` return doc now states the failure behavior.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5ac449d894df`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.