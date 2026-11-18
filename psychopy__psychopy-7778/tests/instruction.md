# Issue

**Title:** BF: pause online microphones before finishing

## Description

## Problem

In generated PsychoJS, the microphone component changes its status to `FINISHED` before calling `pause()`. `sound.Microphone.pause()` only operates while the status is `STARTED`, so the underlying `MediaRecorder` remains active. Starting the next loop iteration then raises `InvalidStateError` because the recorder is still recording.

## Change

- let components defer the common generated `FINISHED` transition when they must perform stop work while still active;
- have `MicrophoneComponent` call `pause()` first and mark itself finished immediately afterward;
- add a compiler regression test which checks the emitted statement order.

.

## Validation

- PsychoPy component compiler tests: 2 passed, including compilation of every PsychoJS component and the focused microphone ordering regression.
- BCL baseline/candidate check: the pinned `release` revision fails with `MICROPHONE_STOP_ORDER`; the candidate emits `pause()` before the single `FINISHED` transition and passes.
- Full BCL run: https://github.com/iibaranov-IG/broadcast-control-lab/actions/runs/34902084687

The reporter's two-iteration Pavlovia experiment remains the end-to-end browser and real-microphone confirmation.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7e5205e188f1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.