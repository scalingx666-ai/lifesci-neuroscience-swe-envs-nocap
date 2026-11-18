# Issue

**Title:** DOC: clarify BrainModelAxis.iter_structures yields a BrainModelAxis

## Description

## What
Correct the `BrainModelAxis.iter_structures` docstring to state that the third
element of each yielded tuple is a `BrainModelAxis`, not a "brain model".

## Why / evidence
Issue #1440: a user followed the docstring ("brain model covering that specific
brain structure") and asserted `type(brain_model) == Cifti2BrainModel`, which
fails. The maintainer confirmed `Cifti2BrainModel` is the XML rendering while
`BrainModelAxis` is the Pythonic interface, and asked for the docstring to be
updated.

`iter_structures` yields `self[idx_start:idx_current]`.
`BrainModelAxis.__getitem__` returns "a new BrainModelAxis" for slice input
(its own docstring), so the yielded object is always a `BrainModelAxis`.

## Change
One-line wording fix in `nibabel/cifti2/cifti2_axes.py`; links the yielded type
to the `BrainModelAxis` class via `:class:`. No code behavior change.

## Verified
Reproduced the yielded type against a locally-built `BrainModelAxis`:

    $ python -c "
    import numpy as np
    from nibabel.cifti2.cifti2_axes import BrainModelAxis
    bm = BrainModelAxis.from_mask(np.ones(5), name='thalamus_left') + \
         BrainModelAxis.from_mask(np.ones(3), name='thalamus_right')
    for name, sl, model in bm.iter_structures():
        print(name, sl, type(model).__name__)
    "
    CIFTI_STRUCTURE_THALAMUS_LEFT  slice(0, 5, None)     BrainModelAxis
    CIFTI_STRUCTURE_THALAMUS_RIGHT slice(5, None, None)  BrainModelAxis

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1d7baa6d0eba`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.