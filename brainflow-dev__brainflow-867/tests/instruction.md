# Issue

**Title:** Fix NeuroPawn Knight EEG scale factor

## Description

## Summary

Knight and Knight IMU EEG samples were scaled with a runtime `float` that omitted the `79.57` divisor. Both readers now use one compile-time constant on `KnightBase`:

```cpp
static constexpr double eeg_scale =
    4.0 / (32768.0 - 1.0) / 12.0 / 79.57 * 1000000.0; // uV
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e3caf4b7289a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.