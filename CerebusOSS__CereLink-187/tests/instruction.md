# Issue

**Title:** Fix non-Gemini (nPlay) clock sync: convert tick timestamps to ns in the data-packet fallback

## Description

## Summary

On non-Gemini devices (e.g. nPlay) the host-clock conversion of device timestamps was broken, so toLocalTime() returned timestamps in the raw device-clock domain instead of host time. Streams looked fine in their raw device_ts but their host-clock (main) timestamps were offset by ~`−host_clock` (millions of seconds). Gemini devices were unaffected.

## Root cause

Gemini processors report timestamps in nanoseconds; other processors (nPlay, legacy) report sample-count ticks that must be scaled by 1e9/sysfreq. That conversion was duplicated inline at three clock-sync inputs:

* the bulk data-delivery rewrite of header->time,
* the NPLAYREP clock-probe handler,
* the data-packet fallback (addDataPacketSample, added in #186).

The data-packet fallback fed the raw header->time (ticks) straight into the clock sync as if it were nanoseconds. For a non-Gemini device that makes the fallback offset ≈ ticks − host_ns ≈ −host_clock; combined with #186's max-offset/glitch probe selection, the poisoned fallback dominated the estimate. Gemini hid it because header->time is already ns (the conversion is a no-op there).

A secondary issue: nPlay's clock-probe replies carry header.time = 0 before playback starts (proctime not running), which were accepted as valid probes and produced the same ≈ −host_clock garbage.

## Fix

* Extract a single deviceTimestampToNs(raw, timestamps_are_nanoseconds, ts_convert_num, ts_convert_den) helper and route all three conversion sites through it, so no clock-sync input can diverge from the others' time domain.
* Skip clock probes that carry no valid device timestamp (etime == 0 && header->time == 0).

Both are no-ops on Gemini (timestamps_are_nanoseconds == true).

## Testing

* New unit tests in [test_clock_sync.cpp](https://github.com/CerebusOSS/CereLink/compare/test_clock_sync.cpp) (DeviceTimestampToNs.*) pin the tick→ns scaling, the Gemini pass-through, the trivial-denominator case, and explicitly assert large tick values are not passed through raw. Run in CI (cbdev_tests).
* End-to-end via an nPlay-source recording through Orion: the non-Gemini main-vs-source offset went from +2.38×10⁹ ms to +1.2 ms (the device's raw-vs-source gap stays a stable, sample-locked constant as expected). Real Gemini NSP + Hub multi-device recording unchanged.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cd14a576c6a1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.