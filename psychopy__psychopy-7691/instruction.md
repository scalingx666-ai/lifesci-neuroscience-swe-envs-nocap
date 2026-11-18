# Issue

**Title:** fix(feat): sample-accurate (sub-block) onset scheduling in the SoundDevice backend

## Description

The SoundDevice backend starts a scheduled sound at sample 0 of the first output block whose `outputBufferDacTime` has passed the requested time. Every onset therefore lands late by a random amount in `[0, blockSize/sampleRate)`: up to 2.9 ms at the default 128-sample block (44.1 kHz), up to 11 ms at 512. Because the error changes from one onset to the next, it smears anything locked to onsets (ERPs, frequency tagging). It also undoes part of `play(when=win)`: since #7794, `getFutureFlipTime()` gives the time the frame actually reaches the display, and the sound then lands up to one block after it.

## Cause

`_callback` checks whether the onset time has been reached only once per block, then always writes the sound from the first sample of the block.

## Fix

`_callback` now works out where the onset falls inside the current block and writes the first, partial block from that sample, so the onset is placed to within one sample (~0.02 ms). Three small changes keep the partial block consistent:

- `_nextBlock` advances `t` by the number of samples it actually produced.
- The end-of-stream check compares against the samples requested for this block (`nReq`), not `blockSize`, so a partial first block isn't mistaken for the end of the sound.
- `samplesLeft` is rounded rather than truncated, so the last sample isn't dropped once `t` is no longer a whole number of samples.

I considered just recommending smaller blocks. That only shrinks the error, and it raises CPU load and the risk of dropouts.

## Verification

`psychopy/tests/test_sound/test_sd_onset_offset.py` runs the real `_callback` and `_nextBlock` with made-up PortAudio timing, so it needs no audio device. It checks that:

- the onset lands on the requested sample wherever it falls in the block;
- there is no gap after the partial first block;
- every sample is played through to the end of the sound;
- `play(when=win)` starts the sound on the sample of the flip.

On `dev` these tests fail (the onset is at the block boundary). With this change all 11 pass.

Acoustic check on Linux (laptop speaker → mic, PipeWire, 48 kHz, 30 onsets per condition at random positions within the block). Onset spread across trials:

| block | this PR: std / range | `dev`: std / range |
|---|---|---|
| 128 | 0.26 / 0.89 ms | 1.61 / 6.28 ms |
| 256 | 0.60 / 1.92 ms | 1.37 / 4.77 ms |
| 512 | 0.13 / 0.45 ms | 2.96 / 9.79 ms |

## Scope

This PR only changes where the onset falls inside a block. It relies on PortAudio's `outputBufferDacTime` to know when a block will actually be played, and doesn't correct any error in that value. How accurate `outputBufferDacTime` is on each platform, including the macOS offset discussed below, is left open: speaker → mic loopback can't settle it (details in the thread). Tested on Linux and, before the rebase, on macOS (unit tests plus real playback). Not tested on Windows.

---
*Pull request created by Claude Opus 5.5.*

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `014b6a6f3cfd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.