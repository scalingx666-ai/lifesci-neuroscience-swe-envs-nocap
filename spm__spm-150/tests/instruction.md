# Issue

**Title:** New feature: add EEG HEP beamforming example pipelines

## Description

Two DAiSS example pipelines using LCMV beamforming for the heartbeat evoked potential (HEP) in EEG data:
-bf_pipeline_LCMV_HEP_power_image.m - source power images 
-bf_pipeline_LCMV_HEP_source_extraction.m - source waveform reconstruction

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0bb0d362cff0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.