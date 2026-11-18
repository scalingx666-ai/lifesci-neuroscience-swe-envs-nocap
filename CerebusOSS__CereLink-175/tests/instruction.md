# Issue

**Title:** Fix NSP clock sync bias: peer HUB offset via shared memory

## Description

## Problem

When running an NSP and HUB simultaneously, events recorded by the NSP appeared ~10-15 ms later than the same events on the HUB after device_to_monotonic conversion. The root cause was the NSP's unreliable header->time (runs ~4% slow in 2-second cycles, with occasional large glitches), which caused the clock sync to fall back to a data-packet method that converged slowly and was vulnerable to permanent corruption from a single bad timestamp.
 
## Investigation

Using a new dual-device latency test (audio tone played to both devices simultaneously), we isolated the problem layer by layer: 

- PTP clocks are fine: Both devices agree on event timestamps to within ~0.9 ms in the PTP domain.
- device_to_monotonic introduces the bias: The NSP's clock offset estimate was systematically too low, shifting its converted timestamps into the future relative to the HUB.
- Two different methods disagreed: The HUB used probe-based sync (accurate, 0.2 ms uncertainty) while the NSP fell back to data-packet sync (biased by ~15 ms due to packet batching delay, and vulnerable to glitch-induced floor crashes of 500+ ms).
 
## Changes
 
Clock sync algorithm (clock_sync.cpp, clock_sync.h):
- Probe selection: max-offset with gap-based glitch rejection instead of min-RTT. Strips isolated upward outliers (>10 ms gap from neighbors) while selecting the highest-quality probes. Equivalent to min-RTT on devices with reliable timestamps (HUB).
- Data-packet fallback: max(raw_offset) instead of min. The maximum corresponds to the minimum one-way delay, which is closest to the true offset. Same gap-based glitch rejection. Recomputed from sliding window each update — no permanent monotonic floor.
- setExternalOffset(): new method to inject a peer device's offset directly, overriding internal estimates. Used by the peer shmem reader.
 
Probe infrastructure (sdk_session.cpp, clock_sync.h):
- Probe rate increased from 0.5 Hz to 10 Hz for better sampling of the NSP's 2-second processing cycles.
- Probe buffer increased from 8 to 80 samples (still ~8 seconds of history).
 
Peer HUB clock sharing (sdk_session.cpp):
- When the NSP falls back to data-packet sync, it opens the HUB1/2/3's shared memory config segment read-only via shm_open/mmap and reads the HUB's probe-based clock_offset_ns.
- The peer offset is injected into the NSP's ClockSync via setExternalOffset() in the periodic datagram callback (~every 10 ms), so toLocalTime() on the C++ hot path has zero additional overhead.
- Liveness check via kill(owner_pid, 0) prevents reading stale segments from dead processes.
- POSIX-only implementation (Windows stub returns nullopt).
 
Test script (analog_latency_test.py):
- Supports --device-type BOTH to run NSP and HUB simultaneously.
- Auto-calibrates detection thresholds per device using a calibration tone.
- Reports both PTP-domain and monotonic-domain cross-device deltas.
- Clock sync timeline monitor showing probe/data transitions and offset evolution.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `18b75e449d64`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.