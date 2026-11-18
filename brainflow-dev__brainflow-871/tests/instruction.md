# Issue

**Title:** Reduce Python FFT and C# channel-packing overhead

## Description

Python FFT/IFFT wrappers convert complex values in scalar Python loops, and C# band-power/ICA wrappers repeatedly allocate copied rows while packing selected channels. Use NumPy array assignments and contiguous real/imaginary buffers, and pack C# rows directly into one buffer while validating channel bounds.

Local Windows probes measured 11.2x faster Python FFT calls at 2,048 samples and 3.5–4.5x faster C# packing at 64 x 2,000 samples. These are operation-specific measurements, not application-wide speedups. C# packing allocations dropped from 4.13 MB to 1.02 MB per call.

Validation: freshly built MSVC Release /MT DataHandler; 19 signal-processing and 18 band-power Python tests passed; C# Release build and signal-processing regression passed. Added coverage for strided complex input, repeated/reordered channels, input preservation, and invalid channel indices. Tests run in the existing regression CI jobs.

Also repair the shared CI failures: stage native dylibs beside the macOS C# regression executable, report C++ test exceptions through a nonzero exit status, and guard allocation failure/overflow in the macOS Bluetooth pipe resize.

Part of #601. Independent of the file-reader, DSP-context, and acquisition changes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c60ebca87c89`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.