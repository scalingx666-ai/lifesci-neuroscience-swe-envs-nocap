# Issue

**Title:** Set rng explicitly when caching solver.

## Description

**Motivation and context:**
As noted in #1358 trying to inspect the default arguments has two problems:

* It prevents the usage of the ``(*args, **kwargs)`` idiom to write a wrapper for solvers.
* The solvers don't specify the actual RNG being used as default argument, but `None` and retrieve `np.random` later. So the RNG state was not saved anyways when relying on the default arguments (but I believe the builder always sets the `rng` argument, so that this bug did not ocurr in practice).

Instead of inspecting the defaults, `E` is assumed to be always `None` by default (any other default would seem quite weird to me) and `rng` is set to `np.random` if `None`.

By setting the RNG explicitly, all cached solvers will depend on the RNG state. This means that decoders are only reused if the RNG state matches even though the solver might be independent of the RNG. Unfortunately, there is no way to know whether the solver will use the RNG and this issue did exist before.

.

**Interactions with other PRs:**
none

**How has this been tested?**
Unit tests still pass. I did not test the original issue reported in #1358, but as the failing code was completely removed, it should be resolved. Not sure if we should add a regression test. It seems weird to write a test that tests that the code isn't doing certain things and it seems unlikely that #1358 is reintroduced. I also did not add a test for the hashing of the RNG state because it seems to be quite awkward to test (without gaining much). But I could probably be swayed to add tests.

**How long should this take to review?**
<!--- Please estimate if this PR is a quick, average, or lengthy PR. -->
<!--- Take into account both the size and complexity of the changes. -->
<!--- Also note if this is a timely PR that should be reviewed by a certain date. -->
<!--- Leave only the line that applies below: -->

- Quick (less than 40 lines changed or changes are straightforward)

**Types of changes:**
<!--- What types of changes does your code introduce? -->
<!--- Leave all lines that apply below: -->

- Bug fix (non-breaking change which fixes an issue)

**Checklist:**
<!--- Go over all the following points. Put an `x` in all the boxes that apply. -->
<!--- If a box is not applicable, please justify below the checklist. -->
<!--- If you're unsure about any of these, don't hesitate to ask. -->
<!--- We're here to help! -->

- [x] I have read the **CONTRIBUTING.rst** document.
- [n/a] I have updated the documentation accordingly.
- [x] I have included a changelog entry.
- [ ] I have added tests to cover my changes.
- [x] All new and existing tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2f32a75aad83`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.