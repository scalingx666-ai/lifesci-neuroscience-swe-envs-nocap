# Issue

**Title:** Add IST LICONN ABISS tutorial; fix decode tag kwarg and mixed-scale e…

## Description

…xport

tutorials/neuron_liconn_ist/: affinity + conservative ABISS decode for the real IST LICONN volume (ExPID82_1, FFN-proofread, 18x18x24 nm), mirroring neuron_j0126's params/step/README layout. Whole-val result at mt=0.47: VOI 0.9129 (split 0.6732 / merge 0.2397), adapted-Rand err 0.3195 over 145x4290x3345. Neither prior 200k run on this volume had ever been decoded.

Thresholds cannot be copied from the other ABISS tutorials: this affinity is saved with scale_sigmoid, so it spans ~[0.03, 0.81] and Pinky's ws_high_threshold=0.88 would sit above the data maximum and seed nothing. ws_high/ws_low are therefore percentiles, and ws_merge_threshold is swept by sweep_merge_threshold.py (full-Z slabs, GT ids used as-is).

decoding/graph.py: pop the reserved `tag` kwarg in _resolve_decoder_kwargs. runtime.output_naming already honoured kwargs["tag"] as an override for the auto-generated filename slug, but nothing stripped it before the decoder call, so the feature was unusable -- it would reach the decoder as an unexpected keyword. Without a tag the namer slugifies every kwarg value into the filename, including the full command string; on this tutorial that produced a >255-char name and killed a 43-minute whole-volume decode at the write step with OSError errno 36.

scripts/prepare_liconn.py: --segmentation-resolution-xyz, so image and segmentation can be exported from different scales. The segmentation is nearest-upsampled by the exact integer factor, validated against both the resolution ratio and Neuroglancer's ceil-halving size convention. This is what exports the 9x9x12 nm image against the 18x18x24 nm proofread labels, since the proofread segmentation has no 9 nm scale.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bbe1a2ce3cee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.