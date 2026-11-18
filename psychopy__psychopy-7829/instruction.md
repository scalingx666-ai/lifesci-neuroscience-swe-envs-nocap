# Issue

**Title:** perf(sound): stop `AudioClip` copying samples it needn't

## Description

`AudioClip.__init__` ran `np.clip` unconditionally, which always allocates, so every `Sound` held two copies of its samples: `sndArr` and the clip's

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8137bccc6e58`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.