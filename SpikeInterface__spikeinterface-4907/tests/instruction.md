# Issue

**Title:** Compute zarr shards one chunk at a time to reduce peak memory

## Description

@alejoe91 asked in #4833 for an alternative that keeps the shard handling inside the zarr writer. Right now each job computes and writes a whole shard at once. This PR keeps one worker per shard but the worker computes the chain one zarr chunk at a time and writes as many whole chunks at once as fit in a budget per worker, `write_buffer_megabytes` (500 MB). Writing in groups matters because every partial write makes zarr-python read the whole shard and write it again. With 60 s shards of 1 s chunks, writing chunk by chunk rewrites each shard 60 times, and with 384 float32 channels the budget brings this down to 6. Without shards a job is one zarr chunk and nothing changes.

`write_buffer_megabytes` is a fixed value inside the zarr writer instead of a new job kwarg. I made it per worker following the precedent of `chunk_memory` in the job kwargs. Depending on how the discussion in #4905 goes, we can make it public to give the user control over it. I picked 500 MB because in my tests 10 chunks per write was close to the speed of writing the shard once while keeping the memory of writing chunk by chunk. Against #4833 this uses about 0.4 GB more, the size of the buffer, and is 2.5 to 10 times faster:

| | main | #4833 | this PR |
|---|---|---|---|
| raw | 2.1 to 4.3 s, 3.05 GB | 34.6 s, 1.68 GB | 3.3 s, 2.08 GB |
| `bandpass_filter` to float32 and median `common_reference` | 25.5 s, 7.67 GB | 130.3 s, 4.92 GB | 31.9 s, 5.36 GB |
| `phase_shift` in front of the same chain | not run, about 22 GB | 128.6 s, 4.96 GB | 51.3 s, 5.39 GB |

Same data as in my review of #4833, the first 60 s of a four-shank Neuropixels 2.0 recording (384 channels, 30 kHz), with 1 s chunks and 60 s shards, one worker, one run each (two for raw), and the peak increase of the resident memory on my Linux laptop.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9ef464e66c1a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.