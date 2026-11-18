# Issue

**Title:** Feature WPLI

## Description

To further increase the number of functions in the phase_analysis module of ‘elephant’, we implemented the ‘weighted_phase_lag_index()’-function to calculate the WPLI, which is a measure of phase-synchronization and based on the imaginary part of the complex-valued cross-spectrum of two signals. This measure was first introduced in ‘An improved index of phase-synchronization for electrophysiological data in the presence of volume-conduction, noise and sample-size bias’ by Vinck et al., 2011. Correctness was tested  among other things via ‘ground-truth’-testing with:  MATLABs package FieldTrip and its function ft_connectivity_wpli() and its wrapper ft_connectivity(); as well as with python package  MNE and its function spectral_connectivity().

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `99d3555fa482`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.