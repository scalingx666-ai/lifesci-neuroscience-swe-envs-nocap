# Issue

**Title:** Pad thin volumes by reflection instead of zeros

## Description

Axes shorter than `data.dataloader.patch_size` were padded with `SpatialPadd`'s default constant 0, in both the train and the eval/test transforms. That is a black slab of input the model never saw. On EMNeuron this hit Ionsem (30 sections, 32-section window) and the tune chunk mira_scn (31).

- Image and label are padded with `data_transform.pad_mode` (default `reflect`, the mode already used for the test-time context pad, `BorderPadd`). Masks stay zero.
- When the pad is longer than the axis (torch reflect fails, e.g. 1 section → 32), numpy's reflect mirrors repeatedly. This is not edge replication: replication repeats one section into a constant cross-section, which zebrafinch work found worse at volume faces (reflect 0.279 vs replicate 0.24 face NERL).

Checked on BC (pytc env, MONAI 1.5.1):
- 30→32: image z `1, 0, 1, …, 29, 28`; label equals image; mask is 0 on the two added sections.
- 3→9: `1 2 1 0 1 2 1 0 1`, mask zero outside.
- `pytest tests/unit -k 'transform or augment or build or pad or tutorial'`: 185 passed.

Not changed: test mode still does not crop this padding back off the saved prediction (the prediction of a 30-section volume has 32 sections). This needs a separate fix; until then, crop `[d // 2 : d // 2 + z]`.

Behaviour change: training on volumes thinner than the patch now sees reflected rather than zero context.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `23875e94f3f2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.