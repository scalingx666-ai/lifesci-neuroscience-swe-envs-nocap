# Issue

**Title:** Use new go-cgo package from conda-forge, support conda-4.6

## Description

This PR updates the build system to support conda-4.6, and also fixes our go compiler dependency with respect to the changes in the conda-forge `go-cgo` package.

The instructions in our developer `GUIDE.md` work now.  If you are starting from a pre-existing environment, uninstall the following packages before installing the new ones (if you have them):

```
conda remove go
conda remove go-nocgo
conda remove go-nocgo_linux-64
conda remove go-nocgo_osx-64
```

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="34" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/janelia-flyem/dvid/310)
<!-- Reviewable:end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6b2bf038d195`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.