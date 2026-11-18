# Issue

**Title:** Add nwb2bids converter for microelectrode electrophysiology data

## Description

Add con/nwb2bids to converters list and a new "Microelectrode Electrophysiology Converters" section in converters.md. nwb2bids reorganizes NWB files into BIDS layout, supporting ecephys/icephys data per BEP032.

This was inspired by looking into @neuromechanist 's OSA framework and thinking how it could even potentially figure out to suggest nwb2bids? ;)

<!-- readthedocs-preview bids-website start -->
----
📚 Documentation preview 📚: https://bids-website--797.org.readthedocs.build/en/797/

<!-- readthedocs-preview bids-website end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `119e0b57ccb6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.