# Issue

**Title:** PERF: Plan FFTW transforms with FFTW_MEASURE instead of FFTW_EXHAUSTIVE

## Description

Plan FFTW transforms with `FFTW_MEASURE` rather than `FFTW_EXHAUSTIVE`. With no saved float wisdom, `BCDTest_writeBranded2DImage` spent its entire 1500 s timeout in `fftwf_mkplan`; with this change it passes in about 60 s.

<details>
<summary>Root cause</summary>

`FFTWInit()` in `BRAINSCommonLib/BRAINSCommonLib.cxx` set `FFTW_EXHAUSTIVE`, which times every algorithm variant for each new transform size. The masked FFT normalized correlation in the constellation detector (`landmarksConstellationDetector.cxx:531`) creates many float plan sizes during the landmark searches, starting at "Processing MPJ...".

ITK writes wisdom to disk only at a normal exit, so a run killed at its test timeout saves nothing, and the next run plans again from scratch. On the test machine the float wisdom file held only its header.

gdb samples during the stall all sat in `fftwf_mkplan_d` → `search0` → `evaluate_plan` → `fftwf_measure_execution_time`.

</details>

<details>
<summary>Local testing</summary>

Linux, Xeon w7-3545, GCC 13.3, Release, ITK v5.4.7 SuperBuild. The same timeout also occurs with ITK main `ffda1aac7d`. Runs used an empty wisdom directory via `HOME`.

| Plan rigor | Wisdom | Result |
|---|---|---|
| `FFTW_EXHAUSTIVE` | none | Timeout at 1500 s (full ctest run); still planning at 300 s alone |
| `FFTW_MEASURE` | cold | Passed, 63 s |
| `FFTW_MEASURE` | warm | Passed, 58 s |

`pre-commit run --all-files` passes.

The remaining 58 s is MSP estimation (about 19 s) plus about 50 landmark searches at about 0.75 s each, measured while another test suite was loading the machine. Neither part is a hang; reducing them is a separate change.

</details>

<details>
<summary>AI assistance</summary>

Claude Code located the stall with timestamped output and gdb stack samples, made the one-line change, and ran the timings above. I reviewed the diagnosis and the change.

</details>

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a22414dde1f0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.