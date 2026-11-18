# Issue

**Title:** Maint hybrid anchor assignment

## Description

### Prefer region labels over locations when assigning hybrid anchors

**What**
`AnatomicalAnchor.assign()` now treats the region label as authoritative for anchors that have both a region and a location:

- **Region query + anchor with a region string and a location:** only the semantic region-hierarchy check (equal / parent / child) is used. The spatial `location.assign()` is skipped.
- **Any query:** if any of the anchor's regions produces an assignment, the location assignment is skipped.
- **Anchors with only a region or only a location:** behaviour is unchanged.

**Why**
Spatial matching of features like BigBrain cell-density patches against a query region's mask caused two problems. It pulled in features from neighbouring areas, because the mask may come from warping into another space and using a probabilistic mask. It also triggered warping calls per point, which are slow.

**Affected features**
- `CellDensityProfile` (122 configs) and `LayerwiseCellDensity` (12 configs)
- Rat `LocalFieldPotential` / `RegionalLocalFieldPotential`

Not affected: region-only features (receptors, EBRAINS datasets, connectivity), location-only features (VOIs, sections), and the direct results of live queries that pre-set `_assignments`.

**CI**
The docs workflow trigger changes from `maint_configuration_loading` to `maint_*`, so the docs of this branch can be built.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0a6a1e81fb00`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.