# Issue

**Title:** Add LN2_SENSITIVITY and LN2_SPECIFICITY

## Description

Hi LayNii developers,

I have implemented two new programs, **LN2_SENSITIVITY** and **LN2_SPECIFICITY**, based on _Equations 1 and 2_ from:
- _Pizzuti A, Huber LR, Gulban OF, Benitez-Andonegui A, Peters J, Goebel R. Imaging the columnar functional organization of human area MT+ to axis-of-motion stimuli using VASO at 7 Tesla. Cereb Cortex. 2023 Jun 20;33(13):8693-8711. doi: 10.1093/cercor/bhad151. PMID: 37254796; PMCID: PMC10321107._ 

**LN2_SENSITIVITY** computes a voxel-wise measure of functional sensitivity from a 4D matrix of fMRI responses to N tasks (e.g., betas, percent signal change, t-statistics). It quantifies how strongly a voxel responds across different tasks, representing its overall responsiveness.

**LN2_SPECIFICITY** computes a voxel-wise measure of functional specificity from the same 4D fMRI response matrix. It complements the "Winner Takes All" approach by measuring how selectively a voxel responds to the winning condition. Specificity is normalized between 0 and 1.

Both programs have been tested using my own data and produce the same numerical results as the Python script from the original study: <https://github.com/27-apizzuti/AOM-VASO_project/blob/main/VASO_analysis/5_voxel_characterization/5_winner_map_and_metrics.py>

Looking forward to your feedback!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `633c9f5fe7e0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.