# Issue

**Title:** BUG: Fix bug with TWA caching

## Description

Requires #1133, don't review until that's in or the diff will be unnecessarily large.

Repeated invocations of:
```
mne_bids_pipeline pipeline/mmn.py --subject 130 --n_jobs=1 --session=a
```
on `main` were *always* causing TWA to be recomputed, which causes everything downstream to need to be recomputed :scream: 
```
┌────────┬ preprocessing/_02_head_pos ──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
│10:30:15│ ✅ sub-130 ses-a Computation unnecessary (cached) …
│10:30:15│ ⏳️ sub-130 ses-a Computing time-weighted average head position
└────────┴ done (1s)
┌────────┬ preprocessing/_03_maxfilter ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
│10:30:15│ ⏳️ sub-130 ses-a Loading reference run: None.
│10:30:15│ ⏳️ sub-130 ses-a Preparing to apply tSSS (6.0 sec, corr=0.95) with MC to experimental data
```
This is because we didn't limit the `config` passed during the TWA step 🤦 

- [x] Fixes the config limiting in `_02_head_pos.py` for the TWA step
- [x] Adds a protection against this in the future by ensuring our cached calls only ever use a limited subset of `config` vals rather than bare `config`
- [x] Adds an option for `--logging-level`, which was very useful while debugging this. Not sure users will use or need it but maybe they will. If we don't think it's worthwhile we could add this easily via an env var, but it's more annoying (longer) for devs that way.
- [x] Makes it so logging is controlled by directly changing `logger.level` rather than by passing around a clunky `log: bool`, which is more consistent with standard `logging` control.

Pushing before #1133 is in so I can verify that the new `assert` doesn't catch any more of these errors!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e228500f5d94`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.