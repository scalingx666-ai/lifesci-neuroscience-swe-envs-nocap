# Issue

**Title:** Tracing overlay: change type of internal `nodes` field to Map

## Description

This replaces the data type of the internal node directory of `TracingOverlay` from `Object` to `Map`. This enforces proper typing of node IDs when referencing into the dictionary, which will make ID types more predictable and reduces other type enforcing code.

Iterating maps is in many scenarios faster than iterating objects and some useful helper fields and  methods like `.size` are provided. This doesn't seem to make a big difference though for common node query sizes. For ~20,000 nodes, using the Map implementation saves  about ~20ms in average, but in general it seems to come with about the same performance as before. Memory use however is much better with the Map based implementation. It seems that the Tracing Overlay needs about one third less memory when using the Map implementation and garbage collection happens more quickly.  Individual element access might be slightly slower due to the `.get()` function call, but this only happens with low frequency for only a few nodes at a time, plus it runs in about the same time as before anyway.

I file this as a pull request for documentation purposes (it is a very central data structure in the tracing data display) and to allow others to provide arguments why this may not be such a good idea. I believe I checked all uses. All tracing actions seems to work normally.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b82b06057869`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.