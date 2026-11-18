# Issue

**Title:** Improve function naming in volume-related functions

## Description

The [naming guidelines](https://rust-lang-nursery.github.io/api-guidelines/naming.html) established in the Rust API guidelines help us create interfaces that are generally intuitive and non-confusing for the usual Rust programmer. During the development of `nifti`, I accidentally gave some methods and functions unconventional names, which I believe should be corrected before the crate enters a mature state. To make the migration process smoother, I deprecated the old methods for removal, starting from 0.6.0, and will only remove them in 0.7.0.

- deprecate `InMemNiftiVolume::to_raw_data` into `into_raw_data`
- deprecate `InMemNiftiVolume::get_raw_data` and `InMemNiftiVolume::get_raw_data_mut` into `InMemNiftiVolume::raw_data` and `InMemNiftiVolume::raw_data_mut`
- deprecate `IntoNdarray::to_ndarray` into `into_ndarray`
- rename util function `to_img_file_gz` to `into_img_file_gz`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `46d677ad1f3d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.