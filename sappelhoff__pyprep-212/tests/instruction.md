# Issue

**Title:** Reconcile the drifted parameter docstrings

## Description

Documentation only — no change to behaviour, signatures or defaults.

Several parameters are documented in more than one place, because their
descriptions were copy-pasted between `NoisyChannels`, `PrepPipeline`,
`Reference`, `find_bad_by_ransac` and `removeTrend`. The copies have since
drifted: markup was lost, a cross-reference was dropped, and one type string
is wrong in twelve places. This reconciles them.

### Type strings

`ransac`, `channel_wise` and `matlab_strict` were rendered as `bool | None` in
twelve places. All twelve have a plain bool default and never accept `None`, so
the API docs told the reader they could pass it. They now say `bool`.

The entries that keep `bool | None` are the ones in
`NoisyChannels.find_all_bads`, where `None` really does mean "use the value
from instantiation", or where the parameter is documented as ignored.

### Prose

- `ransac` in `PrepPipeline` and `Reference` had lost the sentence warning that
  RANSAC slows noisy channel detection down considerably, and left its default
  unmarked.
- `random_state` in `PrepPipeline`, `Reference` and `find_bad_by_ransac` said
  "see RandomState for details" without linking anything, and marked up none of
  its literals. All three now link `~numpy.random.RandomState`.
- `matlab_strict` in `Reference` was the only description of that flag in the
  package that did not point at `:ref:`matlab-diffs``, the page listing the
  improvements it turns off.
- `reject_by_annotation` in `Reference` no longer said what `'omit'` does to the
  data or why one would ask for it.
- `interpolate_bads` in `PrepPipeline.robust_reference` now names the
  alternative to interpolating, as the `Reference` copy already did.

Each site keeps the opening sentence that is genuinely its own: what the random
seed is used for differs between the pipeline, the reference and RANSAC, and
`matlab_strict` is described in terms of the code the reader is looking at
("PyPREP", "RANSAC", "detrending").

The wording fixes get no changelog entry, but the type strings do: a user
reading the rendered API was told three boolean flags accept `None`.

### Open questions

- **Based on `quiet-logging-by-default`, not `main`.** #211 is still open and
  touches two of the same files, though not these lines. Retarget to `main`
  once it lands.
- **No shared docdict.** Repeating a parameter description per function is
  right for numpydoc — a reader of `NoisyChannels.__init__` wants the text
  inline, not a pointer elsewhere. Deduplicating for real means an MNE-style
  `docdict` + `fill_doc` substituting one canonical string at import time,
  which is a separate and much larger change. Until then these copies can drift
  again.
- **`{int, None} | None` and `{None, 'omit'} | None` left alone.** The trailing
  `| None` is redundant in both, and in every similar type string in the
  package. Untangling that is its own decision, not part of a wording fix.
- `PrepPipeline.robust_reference` documents `max_iterations` by deferring to the
  `prep_params` dict, while `Reference` states the number outright. Both
  readings are defensible for their own call signature, so neither was touched.
- Descriptions that differ deliberately were left differing: `channel_wise` and
  `max_chunk_size` drop the "has no effect if not using RANSAC" clause inside
  the RANSAC functions themselves, and the private RANSAC helpers do not render
  in the docs at all.

### Verification

`pytest` (61 passed), `pre-commit run --all-files`, and a clean
`make html` in `docs/` with no warnings.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `64f1fef8cd67`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.