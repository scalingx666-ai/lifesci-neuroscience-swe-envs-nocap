# Issue

**Title:** Changes to connection transform simulation

## Description

**Motivation and context:**
Two changes:
1. `nengo.Connection(x, ens.neurons)` was applying the neural gains before the synapse (`synapse(x*gains)`), whereas `nengo.Connection(x, ens)` was applying the gains after the synapse (`synapse(x)*gains`).  This changes it so that the implementation is consistent in both cases (I went with the latter formulation).

2. All Connections get created with a default `transform=1`, which has no effect.  For `ensemble->x` connections this gets rolled into the decoders, but for `node->x` connections we're just doing an unnecessary multiplication by 1 for all those connections.  The second commit optimizes those identity multiplications out of the connection builder.  (Note: we can't do a similar optimization for identity matrices, because those might be the target of learning rules).

**How has this been tested?**
One of our unit tests failed after the neural gain change, because it was tuned to the previous implementation.  I adjusted a parameter slightly to get it to pass again.

**How long should this take to review?**
- Quick (less than 40 lines changed or changes are straightforward)

**Types of changes:**
- Bug fix (non-breaking change which fixes an issue)
- New feature (non-breaking change which adds functionality)

**Checklist:**
<!--- Go over all the following points. Put an `x` in all the boxes that apply. -->
<!--- If a box is not applicable, please justify below the checklist. -->
<!--- If you're unsure about any of these, don't hesitate to ask. -->
<!--- We're here to help! -->

- [x] I have read the **CONTRIBUTING.rst** document.
- [n/a] I have updated the documentation accordingly.
- [n/a] I have included a changelog entry.
- [n/a] I have added tests to cover my changes.
- [x] All new and existing tests passed.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6bd53f033f22`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.