# Issue

**Title:** Fetch PhysioNet files from the AWS Open Data mirror first

## Description

### Fetch PhysioNet files from the AWS Open Data mirror first (#1245)

physionet.org serves eegmmidb at 10-40 kB/s and times out mid-file;
pooch restarts from zero. Try https://physionet-open.s3.amazonaws.com
(byte-identical: S001R04.edf md5 == S3 ETag) for physionet.org/files/
URLs in data_dl and download_if_missing, warn and fall back to upstream
on any mirror error. MOABB_S3_MIRROR=0 disables. TLS verify stays on
for the mirror. Covers PhysionetMI and Mainsah2025 (bigp3bci).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `642940482349`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.