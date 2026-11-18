# Issue

**Title:** BUG: Constrain resolution of ICA source slider images and skip redundant draws

## Description

@larsoner your last commit on #14422 made the code a bit slower again, see the table below. I think including the changes here would be acceptable -- WDYT?

| ICA components (pages × segments) | `main` | This PR | Speed-up | Slider image size | Report HTML size |
|---|---|---|---|---|---|
| 95 (5 × 5) | 18.3 s | 7.1 s | 2.6× | 2647×1408 → 850×452 px | 24.6 → 5.2 MB |
| 30 (2 × 5) | 6.9 s | 2.5 s | 2.8× | 2647×1408 → 850×452 px | 9.6 → 2.5 MB |

Time spent in `Report._add_ica_sources` with `source_segments=5`, `n_components=20`, on a synthetic `RawArray` (96 EEG + 2 EOG channels, 500 Hz, 1290 s). Median of 10 interleaved runs per variant.

Worked on with Claude Opus 5.5 High. Iterated on and understood by me.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `24c3922e8a31`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.