# Issue

**Title:** Correct extract_annot_labels and add fetch_aparc

## Description

This pull request adds support for fetching and working with the FreeSurfer `aparc` (Desikan-Killiany) cortical parcellation annotation files in the `netneurotools.datasets` module. It introduces a new `fetch_aparc` function, updates the dataset registry and test suites, and ensures compatibility across relevant interfaces and tests.

**Dataset and Fetching Enhancements:**

* Added the `fetch_aparc` function to `fetch_atlas.py` to download FreeSurfer `aparc` annotation files for multiple fsaverage template versions. This function is now included in the module namespace and public API (`__init__.py`). [[1]](diffhunk://#diff-0f1751ec4ea3bb68b6a041b737c0370b353b821fcae23cd5cab93b09940e173dL5-R135) [[2]](diffhunk://#diff-2ecf53be44f9251ec3234ca020359ef716b138ac19828c21239e8c61dabfc170L14-R14) [[3]](diffhunk://#diff-2ecf53be44f9251ec3234ca020359ef716b138ac19828c21239e8c61dabfc170L48-R56)
* Registered the new `atl-aparc` dataset and its references in `datasets.json` and `references.json`, providing metadata and download links for each supported template. [[1]](diffhunk://#diff-24087459d601e30532ed460d380d8b8b8bcb3f70d7d1a0594a9505a887c27b0fR157-R208) [[2]](diffhunk://#diff-c0cb21fa7efdbe116142fed7d9da5cab01be4aab6b99dd35c1a70472192727dbR212-R219)

**Testing and Interface Updates:**

* Added comprehensive tests for `fetch_aparc` and its integration with FreeSurfer annotation label extraction, including parameterized tests for different template versions and annotation types. [[1]](diffhunk://#diff-56ad5dcdf547ced4e8b20db007c1eaf609ff73ef5cad319b37b8e4f79800cdafR114-R124) [[2]](diffhunk://#diff-c96a3890cdb98a9dd9c0bfcd9bc85f6aed3cea4d52e1f205826efb3b117e1a6eR2-R65)
* Updated `extract_annot_labels` in `interface/freesurfer.py` to correctly generate label keys for the new annotation files.
* Extended transform interface tests to support and validate `aparc.annot` files, updating expected outputs and data preparation logic. [[1]](diffhunk://#diff-3d0ce6c343e061cac8119cfc7a580eb2e238365cf8dcc09cf81913e913a304b9L9-R23) [[2]](diffhunk://#diff-3d0ce6c343e061cac8119cfc7a580eb2e238365cf8dcc09cf81913e913a304b9L36-R42) [[3]](diffhunk://#diff-3d0ce6c343e061cac8119cfc7a580eb2e238365cf8dcc09cf81913e913a304b9L50-R61) [[4]](diffhunk://#diff-3d0ce6c343e061cac8119cfc7a580eb2e238365cf8dcc09cf81913e913a304b9L124-R140) [[5]](diffhunk://#diff-3d0ce6c343e061cac8119cfc7a580eb2e238365cf8dcc09cf81913e913a304b9L212-R233)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fc2c43ba265f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.