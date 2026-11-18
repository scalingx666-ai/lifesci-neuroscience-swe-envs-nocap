# Issue

**Title:** Raise uv to 0.13.4 to drop the compromised emSign root

## Description

## Summary

uv before 0.13.4 trusts the `emSign ECC Root CA - G3` root. Intermediate CA keys under that root are compromised ([GHSA-hq85-5cpj-mr62](https://github.com/astral-sh/uv/security/advisories/GHSA-hq85-5cpj-mr62), [Dependabot alert 197](https://github.com/neuronsimulator/nrn/security/dependabot/197)). An on-path attacker can present a certificate for any hostname and that uv will accept it. uv 0.13.4 drops the root. It is the current release on PyPI.

- `ci/uv_requirements.txt`: `uv<=0.12.21` → `uv==0.13.4`. CI installs this file with pip, then uses that uv to install the hashed lock.
- `dev_container/Dockerfile`: the three `uv==0.9.15` pins → `uv==0.13.4`. That image then installs mpi4py, cython, and setuptools with uv and no hashes.

`ci/requirements.txt` is unchanged. certifi in the lock is the same incident (`certifi==2026.7.22`, [GHSA-6q48-6c7w-9gw2](https://github.com/advisories/GHSA-6q48-6c7w-9gw2)) and stays for a follow-up `uv pip compile` once this uv is in use.

## Test plan

- [ ] CI installs `ci/uv_requirements.txt` and then `ci/requirements.txt`, and the usual matrix stays green
- [ ] An install log shows uv 0.13.4 (`Successfully installed uv-0.13.4`)
- [ ] The dev container image is not built by these workflows; the Dockerfile pin is review-only here

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `20235041e68d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.