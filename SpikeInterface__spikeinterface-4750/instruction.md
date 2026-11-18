# Issue

**Title:** Parallelize coherence-based bad channel detection

## Description

### Description

The default `coherence+psd` method first materialises 100 scaled chunks and then processes them in serial. On a 384-channel recording, profiling shows that the Welch and median computations dominate the call, while extracting the random traces takes a small part of the total time.

This change sends the same random slices through `TimeSeriesChunkExecutor`. The default stays at `n_jobs=1`, but the chunks are streamed instead of kept together in memory. A final `job_kwargs` parameter lets callers select a thread or process pool without changing positional arguments.

I measured the default 100 × 0.3 s chunk path on an Intel Core i9-13900HX, with numerical thread pools pinned to one thread. The generated row uses the 30 s / 384-channel shape reported in the issue. The second row uses real 384-channel SpikeGLX traces from the public Noise4Sam fixture; the public file is short, it was repeated in memory to cover the same chunk path.

| Workload | Before | After (`n_jobs=8`, processes) | Improvement |
|---|---:|---:|---:|
| Generated 30 s recording | 8.454 s (8.384–8.479) | 2.193 s (2.118–2.236) | 3.86x |
| Noise4Sam real traces | 12.836 s (12.749–12.964) | 2.984 s (2.973–3.014) | 4.30x |

The channel ids and labels matched exactly between both implementations in each run. On the serial real-trace path, three fresh-process peak RSS measurements gave a median of 1,688,604 KiB before (range 1,688,500-1,689,352) and 353,452 KiB after (range 352,984-354,896), around 79% less. This comes from processing one random slice at a time instead of retaining the scaled chunks.

Validation:

- `pytest -q src/spikeinterface/preprocessing/tests/test_detect_bad_channels.py`: 11 passed.
- The regression tests cover a thread pool, a spawned process pool, and a two-segment recording.
- A second spawned-process test uses a recording that is not pre-marked as filtered, so the
`highpass_filter` wrapper `detect_bad_channels` builds internally also gets exercised across a process boundary; it matches the serial result on the same data.
- Both new tests fail on the matching `main` revision and pass with this patch.
- `black` and the trailing-whitespace/end-of-file checks are clean.

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `32bcb0dca9f2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.