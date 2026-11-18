# Issue

**Title:** Fix bug with quaternion conversion

## Description

@wmvanvliet fixes a corner-case bug I think you mentioned:
```
import mne
fname = mne.datasets.sample.data_path() / "MEG" / "sample" / "sample_audvis_raw.fif"
info = mne.io.read_info(fname)
info = mne.pick_info(info, mne.pick_channels(info.ch_names, ["MEG 0811", "MEG 0812", "MEG 0813"]))
fig = mne.viz.plot_alignment(info, meg="sensors", coord_frame="meg", surfaces=[], dig=False)
mne.viz.set_3d_view(fig, azimuth=90, elevation=90, distance=0.1)
```
Gives (look at the front center sensor):

| main | PR |
| -- | -- |
| <img width="912" height="940" alt="Screenshot 2026-11-04 at 10 30 32" src="https://github.com/user-attachments/assets/0b0cc107-6d9d-470a-b979-f875830ac246" /> | <img width="912" height="940" alt="Screenshot 2026-11-04 at 10 30 58" src="https://github.com/user-attachments/assets/f085311d-2789-4071-b2e0-1a3cfa73b575" /> |

Changes investigated with Claude Opus 5.5 but iterated on by me.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7c1f9326dc2b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.