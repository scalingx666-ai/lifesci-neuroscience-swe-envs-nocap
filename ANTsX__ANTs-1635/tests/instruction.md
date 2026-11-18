# Issue

**Title:** BUG: Template input overwritten when basename identical

## Description

As evidenced in #1634

This bug affects users who run `antsLongitudinalCorticalThickness.sh` or `antsMultivariateTemplateConstruction[2].sh`.

The bug only affects use cases where `-n 1` is passed to the template script **and** the input base names are identical. For example,

`antsLongitudinalCorticalThickness.sh [options] /data1/t1w.nii.gz /data2/t1w.nii.gz`

`antsMultivariateTemplateConstruction.sh [options] -n 1 /data1/t1w.nii.gz /data2/t1w.nii.gz`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0ea8e536603f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.