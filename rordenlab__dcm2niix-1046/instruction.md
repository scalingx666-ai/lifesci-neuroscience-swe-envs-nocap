# Issue

**Title:** Pin Cloudflare zlib to a reproducible source revision

## Description

The optional Cloudflare-zlib recipe tracks the moving `gcc.amd64` branch. Checking out a fixed dcm2niix revision therefore does not fix the dependency source revision.

Pin the previously observed branch head, `7d9d0b20249fd459c69e4b98bc569b7157f3018c`, and rename the local variable to CLOUDFLARE_TAG. This retains the branch snapshot observed during investigation, including its CMake-4 compatibility update, while making the selected source explicit. The patch changes two lines in one CMake file and targets development.

Validation was limited to one isolated language-NONE CMake configuration including the actual recipe. ExternalProject properties confirmed the exact commit SHA and unchanged repository URL. No external target was executed, so no dependency download, update, compilation or installation occurred. One whitespace check passed.

Previously gathered branch-resolution evidence and [CMake's recommendation to prefer commit hashes](https://cmake.org/cmake/help/latest/module/ExternalProject.html#git) were reused. The branch was not resolved again; no dependency source was re-hashed or re-verified. No DICOM conversion, dcm_qa corpus, codespell sweep or broader checks were run, per the explicit validation scope.

Observed source revision:  . This is reproducibility/supply-chain hardening for the optional Cloudflare configuration, not a vulnerability fix, dependency-security audit, or change to the documented zlib-ng deployment choice.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5beba99a3fdb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.