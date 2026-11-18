# Issue

**Title:** neuralset: audio context windows, anti-aliased downsampling, Whisper padding fix; HuggingFace device="auto" resolved on the worker

## Description

Lets audio extractors embed long events in overlapping windows instead of relying on `ChunkEvents`, so the feature cache no longer depends on the events chain and latents near window edges keep context. Also fixes aliasing when downsampling audio latents, Whisper's 30 s padding, and HuggingFace extractors silently running on CPU when built on a CPU node.

## Audio context windows

- `BaseAudio.context_duration` / `context_overlap` (fraction in [0, 1), default 0.2): each event is fed to the model in centred, overlapping windows and still cached as one item. The last window is shifted to end at the event end.
- `context_duration` defaults to 30 s on `HuggingFaceAudio` and its subclasses (`Wav2Vec`, `Wav2VecBert`, `SeamlessM4T`, `Whisper`); `None` restores whole-event processing (still the default for `MelSpectrum`, `SpeechEnvelope`, `SonarAudio`).
- Shared helper `neuralset.utils.strided_windows(mode="bidirectional" | "causal")`.
- A CUDA out-of-memory error while embedding an event is re-raised with a hint to set or lower `context_duration`.
- `ChunkEvents` on Audio/Video events without `event_type_to_split_by` emits a `FutureWarning`.

## Fixes

- Downsampling below the latent frame rate averages frames (`F.interpolate(mode="area")`) instead of keeping one frame per sample. The audio cache version goes from v5 to v7, so audio caches are recomputed.
- `Whisper` uses 30 s windows and drops the latents of the padding (it previously stretched 30 s of latents over shorter events and dropped anything past 30 s).
- HuggingFace extractors keep `device="auto"` in their config and resolve it when the model loads, on the worker; it was resolved at build time, so jobs built on a CPU node ran on CPU. `device` is excluded from cache uids, so no uid changes.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ab2537659142`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.