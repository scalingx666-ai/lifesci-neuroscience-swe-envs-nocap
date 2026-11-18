# Issue

**Title:** Add hardware nPlay/Hub2 clock-sync stress tests + fixture hardening

## Description

C++ integration (tests/integration/):
- test_nplay_sync_stress.cpp: wrap-segmented host-timeline monotonicity for file-playback nPlay, plus an opt-in nPlay+live-Hub2 cross-device variant (CERELINK_HW_MULTIDEVICE).
- nplay_fixture.h: unique per-launch lock name + remove the real $TMPDIR/<name>.lock file, fixing the alternating "multiple instances" failures caused by a leftover O_EXCL lock.
- download test assets from the v9.11.0 release.

pycbsdk (pycbsdk/tests/):
- test_lsl_sync.py + _lsl_generator.py: stamp every batch with device_to_monotonic and assert a monotonic host timeline on the --device=LSL path, single-nPlay and nPlay+live-Hub2.
- conftest.py: pylsl-driven LSL nPlayServer fixtures; a collection hook that runs LSL tests only in isolation (one NPLAY shmem per device type); EPERM-tolerant chmod for freshly-downloaded signed binaries; lock-file cleanup; and a guard that fails when the dev-built libcbsdk is older than the C++ sources.
- pyproject.toml: pylsl/numpy test deps and the `lsl` marker.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5fe471dd2a10`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.