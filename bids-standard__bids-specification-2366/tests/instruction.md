# Issue

**Title:** Add channels -> electrodes -> probes consistency checks

## Description

Thanks @effigies and @rwblair for the meeting and feedback yesterday. I have tried drafting a rule for the channels -> electrodes -> probes consistency checks.

### What this does

Validates that references from child files resolve in parent files:
- `electrode_name` in `channels.tsv` must exist in `electrodes.tsv`
- `probe_name` in `electrodes.tsv` must exist in `probes.tsv`

Both checks allow `n/a` (for aux channels without electrodes, or standalone electrodes without probes). We intentionally do not check the reverse direction (parent -> child) since not all electrodes need channels (broken contacts, reference-only, run-specific subsets).

### Changes

- **`context.yaml`**: Added `name` column to `electrodes` association and new `probes` association with `probe_name` column
- **`associations.yaml`**: Extended selectors so `electrodes` is resolved when visiting `channels.tsv` and `probes` is resolved when visiting `electrodes.tsv` (follows the `coordsystem` precedent which already includes `electrodes` in its selector). Added `inherit: true` to `probes`.
- **`checks/microephys.yaml`**: Two warning-level child -> parent reference checks

### Looking for feedback on

I was not able to get the validator to fire these checks when I broke a dataset by replacing `probe_name` values in `electrodes.tsv` with nonexistent names. The schema compiles fine, valid datasets still pass, but the broken dataset did not trigger the new warnings.

Also, the check expression uses `length(intersects(...))`. When `intersects()` finds zero overlap it returns `false` rather than an empty array -- how does `length(false)` behave? If this is problematic, would a simpler check like the following be preferred?

```yaml
count(unique(columns.probe_name), "n/a") == length(unique(columns.probe_name))
|| intersects(unique(columns.probe_name), associations.probes.probe_name)
```

Related #2307

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4517132cfc90`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.