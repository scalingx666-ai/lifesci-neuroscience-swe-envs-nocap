# Issue

**Title:** Add cross-version serialization tests

## Description

SpikeInterface has no test that loads an object serialized by an older release with the current code, even though that is exactly the path that breaks users. We only round-trip within a single version, which never exercises a class move, a renamed constructor argument, or a change in how something is written to disk. Two recent cases make the gap concrete. On #4588, Sam pointed out that moving `NoiseGeneratorRecording` out of `core` could break any old JSON or pickle that stored its fully qualified class path. The probe refactor in #4465 changes how a probe is written to disk (`contact_vector` property to a `ProbeGroup` object), which risks old saved recordings either failing to load or, worse, silently mis-mapping channels to locations. Nothing in continuous integration would catch either today.

This adds a harness that generates a small battery of canonical objects under an old release and loads them with the branch, asserting content rather than only that they load. Fixtures are regenerated from a real old install each run in an isolated uv environment, so nothing is committed to the repository. The battery covers both failure axes: JSON recipes catch moved classes and changed signatures (the #4588 case, where the fixture records the old `core.generate.NoiseGeneratorRecording` path and loading exercises the redirect), while folder and zarr fixtures catch on-disk encoding changes. Those include a single-probe and an interleaved multi-probe recording that assert exact per-channel locations, so a silent channel-to-location scramble (the case that motivated `_global_contact_order` in #4465) fails the test instead of passing on shape alone. It runs against the previous release on every pull request touching `core`, and the full version matrix weekly.

I set the version floor at 0.102 because 0.100 and 0.101 no longer install cleanly on the continuous-integration Python (numcodecs dependency rot). This makes "testable floor equals support floor" a deliberate choice worth confirming with the team rather than an accident.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6a8d87ba3538`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.