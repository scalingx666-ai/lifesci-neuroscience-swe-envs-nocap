# Issue

**Title:** Iscprog

## Description

## Summary

Adds `3dInSync`, a new program for voxelwise intersubject correlation (ISC)
analysis from aligned subject time-series datasets. Meant to be complimentary
to the existing `3dISC` program that does _better_ statistical modeling of ISC.
Much of the reasoning behind this program was to establish comparisons
between other ISC tool approaches and those of `3dISC`. 

`3dInSync` is intended for questions about how similarly subjects respond to
the same stimulus over time. It calculates ISC directly from the input time
series, without requiring users to first generate a separate correlation map
for every subject pair.

## What it provides

- Pairwise and leave-one-out ISC estimates, with median or Fisher-z mean
  summaries.
- Bootstrap confidence intervals, temporal-null tests, and permutation-based
  group-difference inference for exactly two independent groups.
- Repeated-condition support through long-format subject-by-condition tables.
  A specified two-condition contrast can be evaluated with within-subject
  label-swap permutations; with two groups, this also produces the
  group-by-condition difference-in-differences map.
- Spearman correlation, common censoring (including automatic all-zero-volume
  censoring with per-subject/condition warnings), missing-data handling, and
  optional atlas/ROI summaries.

## 3dISC interoperability

`3dInSync` can also bridge direct ISC estimation to mixed-effects analysis in
`3dISC`. With `-save_pairwise`, it calculates every subject-pair correlation,
Fisher-z transforms the resulting maps, and saves them as sub-bricks in a
single output dataset. It writes a companion table that points each subject
pair to its corresponding sub-brick and carries forward group labels and
subject-level covariates.

For example, given an input table such as:

```text
Subj  Group    Age  InputFile
s01   control  24   s01_movie+tlrc
s02   control  29   s02_movie+tlrc
s03   control  35   s03_movie+tlrc
s04   patient  27   s04_movie+tlrc
s05   patient  32   s05_movie+tlrc
s06   patient  40   s06_movie+tlrc
```

`3dInSync` can estimate ISC and export pair maps with:

```tcsh
3dInSync                                                     \
    -prefix movie_isc                                         \
    -mask brain+tlrc                                          \
    -isc_method pairwise                                      \
    -summary median                                           \
    -save_pairwise movie_pairs                                \
    -dataTableFile subjects.txt
```

This creates `movie_pairs+tlrc` and `movie_pairs.3dISC.txt`. The latter
contains one row per unique subject pair, including `Subj1`, `Subj2`, group
and covariate columns, and an `InputFile` selector such as
`movie_pairs+tlrc[7]`.

The exported table can then be used directly in `3dISC` to model the pairwise
maps while accounting for subjects appearing in multiple pairs:

```tcsh
3dISC                                                        \
    -prefix movie_isc_lme                                    \
    -jobs 8                                                   \
    -mask brain+tlrc                                          \
    -model '1+(1|Subj1)+(1|Subj2)'                            \
    -dataTable @movie_pairs.3dISC.txt
```

For repeated-condition data, `3dInSync` writes one directly runnable `3dISC`
table for each ordered condition pair, while retaining a combined table for
provenance. This preserves `3dISC`'s one-row-per-subject-pair input structure.

## Scope

`3dInSync` provides direct estimates for any number of groups and conditions.
Its group-label permutation test is currently limited to exactly two groups,
and its condition inference is based on a specified two-condition contrast.
More elaborate multi-group, multi-condition, or covariate models can use the
exported voxelwise pair maps as input to `3dISC`. Edge analyses (`-edges*`) are
estimates and temporal-shift nulls only; they do not yet feed `3dISC` or support
group-label permutation or condition contrasts.

## Edge (cofluctuation) ISC

Adds an atlas-based mode that asks whether subjects share moment-to-moment
*cofluctuations* between regions, not just similar regional time courses.

For each subject, ROI mean series are z-scored (sample SD) and multiplied
pairwise to form an edge time series, z_i(t)·z_j(t), whose mean over time is the
ordinary Pearson r. The existing ISC estimators (pairwise or leave-one-out,
median or Fisher-mean, Pearson or Spearman, groups, conditions, censoring) are
then applied to those edge series.

### New options (all require `-atlas`)

- `-edges`: ISC of every ROI-pair edge series. Writes `PREFIX.edge.1D`, one row
  per condition, group, and ROI pair. Each row also carries the ISC of its two
  ROIs (`Node1ISC`, `Node2ISC`) so edge synchrony can be read next to node
  synchrony.
- `-edges_matrix`: also writes one `PREFIX_edge_[COND_]GROUP.netcc` per
  condition and group, in the `3dNetCorr` `.netcc` layout. `CC` is edge ISC, `FZ`
  its Fisher z, and the diagonal holds node ISC rather than 1.0.
- `-edges_rss`: ISC of the global cofluctuation amplitude,
  RSS(t) = sqrt(Σ_{i<j} (z_i z_j)²).
- `-edges_events FRAC`: counts, for each frame, how many subjects in a group
  have an event there, where an event is a frame in that subject's top `FRAC`
  fraction of RSS(t).
- `-edges_nnull N`: surrogate sets for the nulls below (`-min_shift` and `-seed`
  apply).

`-edges_rss` and `-edges_events` write a single per-frame table,
`PREFIX.frames.1D`. At most two text files are written by default.

### Nulls

- **Edges.** Edge ISC is largely inherited from node ISC: if both ROIs are
  synchronized across subjects, their product is too, even when their coupling
  is not shared. To separate the two, ROI j of each pair is circularly shifted
  by one offset common to all subjects. This leaves every node's own ISC
  unchanged and breaks the within-subject i–j coupling. The output reports
  `NullMean`, `Excess` (= ISC − NullMean), and one-sided empirical P, BH Q, and
  max-statistic FWE across condition × group × edge. The same synchronized shift
  set is reused for every edge.
- **Amplitude and events.** Each subject is shifted independently. Event
  P/PFWE are per frame, with the maximum taken over frames, conditions, and
  groups.

The help text includes guidance on reading edge ISC against node ISC (for
example, edge ISC above what the nodes predict, high edge ISC with low node ISC,
and high node ISC with a flat edge) and the main confounds: shared nuisance
signals, spatial blur between neighboring ROIs, and heavy-tailed products.

### Limits

- Stimulus-locked measures only; they are not meaningful for unlocked data
  such as rest.
- All ROIs share one retained timeline (`-missing common` uses the intersection
  across ROIs), and ROI series are z-scored over the retained frames.
- `-edges_nnull` cannot be combined with `-censor`, `-zcensor`, or
  `-missing common`, because circular shifts need an intact timeline.
- The null cost grows with N × edges × subject pairs; use `-roi_sel` or a coarse
  atlas for large atlases.
- Edge analyses do not yet support the `3dISC` bridge (`-save_pairwise` applies
  to the voxelwise maps only), and group-label permutation and condition
  contrasts are not yet applied to edges.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `660b784c90f1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.