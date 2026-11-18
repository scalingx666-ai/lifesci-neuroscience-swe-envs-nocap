# Issue

**Title:** move set_eeg_montage after drop_channels

## Description

to match config statement:
```
# !!! warning
#     If the data contains channel names that are not part of the template montage, the
#     pipeline run will fail with an error message. You must either pick a different
#     montage or remove those channels via
#     [`drop_channels`][mne_bids_pipeline._config.drop_channels] to continue.

```

### Before merging …

- [x] Changelog has been updated (`docs/source/dev.md.inc`)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6aef3219ec52`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.