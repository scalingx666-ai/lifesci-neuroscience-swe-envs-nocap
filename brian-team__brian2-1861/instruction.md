# Issue

**Title:** Skip gc.collect() in Network.run() when unused-object warnings are disabled

## Description

Recreates #1860, which was closed automatically on 12 Aug when the fork
hosting its branch was detached during an account cleanup on my side —
my mistake, apologies for the noise.

The head commit is byte-identical to the original PR (`f9291df8be`).
All prior context and discussion: 

---

Skips the explicit `gc.collect()` at the start of `Network.run()` when the `logging.warn_for_unused_objects` preference is disabled.

### Motivation

The only purpose of this collection is to trigger `BrianObject.__del__` for objects that were created but never included in a network, so that the "was never included in a network" warning can be raised. That warning is already gated by `prefs.logging.warn_for_unused_objects` inside `BrianObject.__del__`, so when the preference is `False` the collection has no user visible effect, but it still has a fixed cost: a full pass over all tracked objects (about 140k of them right after `import brian2`, roughly 80 ms per call on my machine).

This fixed cost dominates short runs. On Windows (CPython 3.14), 500 consecutive `run(0*ms)` calls with the warning disabled spent about 37.9 s out of 40 s (more than 90%) inside `gc.collect()`. Since #1823 points out that many tests end with a `run(0*ms)` just to trigger code generation, and since the test runner already sets `logging.warn_for_unused_objects = False` (`brian2/tests/__init__.py`), the whole test suite benefits directly from this change: on a small Linux machine (1 vCPU, CPython 3.12), `gc.collect()` accounted for roughly 45 to 50% of the wall time of the `codegen_independent` run of `test_neurongroup.py` before this change, and only a few percent after. These numbers are indicative and machine dependent; happy to rerun benchmarks if useful.

### Behaviour

* Default behaviour is unchanged: the preference defaults to `True`, so the collection happens exactly as before.
* With the preference disabled, no warning was emitted before and none is emitted now. The only observable difference is that unused objects are collected later, by the regular generational garbage collector, instead of eagerly at the start of `run()`. Users who rely on the eager collection for memory reasons can call `gc.collect()` themselves.
* The existing tests `test_unused_object_warning` and `test_magic_unused_object` pass unchanged (they enable the preference explicitly).

### Changes

* `brian2/core/network.py`: make the collection conditional and explain why in the comment.
* `brian2/utils/logger.py`: document the link in the description of the preference (this also updates the generated preference documentation).
* `brian2/tests/test_network.py`: add `test_conditional_gc_collect`, a regression test checking via `unittest.mock` that the collection happens if and only if the preference is enabled.

### Out of scope

* `MagicNetwork.after_run()` also calls `gc.collect()` after every magic `run()`. That call frees objects that were kept alive by the magic network, so it is not purely warning related and is left untouched here; it could be revisited as part of #1823.
* The broader test suite restructuring of #1823, and `cpp_standalone` run overhead, which is a separate topic.

Supersedes #1843: I had opened the same core change from a branch that has since been deleted, and closed that PR before review. Compared to #1843, this version adds the regression test and the documentation update for the preference.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aec54d2afae3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.