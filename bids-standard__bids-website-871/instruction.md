# Issue

**Title:** Add SpinePrep to the BIDS Apps list

## Description

Adds [SpinePrep](https://spineprep.com) to data/tools/apps.yml — an open, containerised BIDS-App for reproducible, QC-first preprocessing of human spinal-cord fMRI (repo: https://github.com/SpinePrep/SpinePrep, on PyPI as spineprep). It automates the recommended cord-fMRI recipe (SCT, FSL, PAM50) with per-vertebral-level quality control. No Docker Hub image is listed by design — SpinePrep ships as a build recipe.

<!-- readthedocs-preview bids-website start -->
----
📚 Documentation preview 📚: https://bids-website--871.org.readthedocs.build/en/871/

<!-- readthedocs-preview bids-website end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f64c3909da2b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.