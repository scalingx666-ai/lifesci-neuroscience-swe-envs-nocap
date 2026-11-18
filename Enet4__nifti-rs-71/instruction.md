# Issue

**Title:** Update crates

## Description

I'm not sure if this is what you wanted but I updated all the crates
- using a X.Y versioning, not X.Y.Z, because I don't see the point of being explicit about the last number. Please educate me if I shouldn't have done that :)
- including `safe-transmute` which you just updated. Yay, no more RC crates.
- nalgebra required more changes, they dropped algo in favor of simba.
- I added some `#[rustfmt::skip]` because the matrices were auto-formatted. I hate that. I needed that add them on top of the functions, otherwise `attributes on expressions are experimental`. I hate that even more.

Did you have other goals before a release? We want to use nalgebra 0.21 but we depend on nifti-rs. I'm aware of #62 , but it could be a 0.10 release.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a0dd26106327`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.