# Issue

**Title:** adding compression for spikes/rates outputs

## Description

Compression capability is added for spike/rate h5 files.

The option can be given in the 'output' or 'report' section of the config files for bionet, pointnet, and filternet.
String values such as 'gzip', 'lzf', or 'none', or integer 0-9 (level for gzip) are accepted.

The default is 'gzip', and this option will be ignored if h5 file will not be saved.
Simple tests in test_sonata_adaptor.py are implemented, but tests for for the individual components (bionet, pointnet, and filternet) are not implemented. Let's discuss if more comprehensive tests are desired.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `112316674155`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.