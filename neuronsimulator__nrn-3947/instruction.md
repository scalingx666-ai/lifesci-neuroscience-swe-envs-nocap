# Issue

**Title:** neuronapi: nrn_sectionlist_iterator_next frees a deleted section's item properly

## Description

`SectionListIterator::next` drops an item whose section was deleted. It did that with `delete q`, but the item comes from `emalloc` (`src/oc/list.cpp`), which ASan reports as alloc-dealloc-mismatch. The rxd tests hit this on #3877. It also never released the reference the list holds on the section (`lappendsec` takes one, `seclist.cpp`), so the section leaked.

It now does the same as `forall` (`seclist.cpp`): `hoc_l_delete(q)` then `section_unref(sec)`.

`test/api/sectionlist_iterator_deleted.cpp` deletes the first, a middle and the last entry, then the rest, and checks exactly which sections come back on two passes. It also checks the refcount drops by one, which is why it needs NEURON's internal headers. On master that check fails in a plain run, and valgrind reports the mismatched free at this `delete`. With the fix the test passes with 0 valgrind errors.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9eb469be7dbc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.