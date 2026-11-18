# Issue

**Title:** updated support for blackrock_nsx

## Description

Our new blackrock system stores Channel IDs under _orig.ElectrodesInfo.ChannelID_  rather than _orig.ElectrodesInfo.ElectrodeID_, which ft_reader_header currently expects.

This PR adds support for this presumably new field while preserving backwards-compatibility.

Relatedly, ft_hastoolbox was referencing an old github repository location (also updated).

Best,
Arjen

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bddfa627d4c7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.