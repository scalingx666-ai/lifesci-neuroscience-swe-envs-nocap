# Issue

**Title:** ENH sort subject list and improve repr of transforms

## Description

Maybe this problem was a problem only for me. But I always hated how the transforms were listed in the `__repr__`, as it wasn't really easy to understand what transforms were available for a subject.

Before the PR they would be listed as

```
>>> cortex.db.subjects["fsaverage"].transforms
Transforms: [atlas,atlas336,atlas_2mm,atlas_3mm]
```
which is fine for a few transforms, but it becomes quickly unreadable if one has many transforms.

After this PR they are listed as
```
>>> cortex.db.subjects["fsaverage"].transforms
Available transforms for fsaverage:
atlas
atlas336
atlas_2mm
atlas_3mm
```

This PR also sorts the subjects when running `cortex.db` and `cortex.db.subjects`. The unsorted subjects also bugged me in the past.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d20e63062632`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.