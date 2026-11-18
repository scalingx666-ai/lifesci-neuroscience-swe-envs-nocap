# Issue

**Title:** Fix `test_pipeline_equiv_to_step`

## Description

`test_pipeline_equiv_to_step` builds each preprocessor twice and tests the results for equivalence, but some nondeterministic preprocessors weren't being seeded, or the seeds weren't being forwarded to where they were needed. This was causing checks to fail on totally unrelated PRs/CI runs (e.g., #4620).

Fix 1A: `DetectAndRemoveArtifactsRecording` accepted a seed but didn't forward it to the "envelope" method's chunk subsampling. The docstring's description of seed handling was also wrong.

Fix 1B (surfaced in the process of testing & fixing 1A): the envelope detector emits threshold crossings as a structured array with named fields "sample_index", "segment_index", and "front". "front" is a `bool` indicating whether the crossing is a rising edge or a falling edge of the presumed artifact. `_transform_internal_dtype_to_artifact_dtype` converts the crossings into `(start, end)` pairs. But if a segment ended while an artifact was still ongoing (a trailing rising edge with no matching falling edge), it makes up a closing falling edge at the last sample of the segment so the pairs are complete. But to do this, it was allocating a single record with the wrong dtype (no "sample_index"). Then trying to write to it, raising a `ValueError`. Just needed to use the right dtype.

Fix 2: Seeded `detect_and_remove_bad_channels`,
`detect_and_interpolate_bad_channels`, `detect_and_remove_artifacts` in `test_pipeline_equiv_to_step`.

Fix 3A: `silence_periods` in theory is vulnerable to the same issues, if it were tested with `mode="noise"`, so I fixed it too: `DetectArtifactAndSilentPeriodsRecording` also needed to forward `seed` to the envelope method. And `SilencedPeriodsRecordings` needed its docstring's description of seed behavior fixed.

Fix 3B: While here, I found that the `DetectArtifactAndSilentPeriodsRecording` wasn't even constructing because it referenced an undefined "artifacts" that seems like it was replaced by "periods" at some point. I guess this raises the question: if nobody noticed, is the class used/needed?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dcdfc1a2275e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.