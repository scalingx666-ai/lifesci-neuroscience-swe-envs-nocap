# Issue

**Title:** serve: take the sampling defaults from the checkpoint's generation_config.json, as vLLM does

## Description

## What and why

A request that omits `temperature`, `top_p`, `top_k` or `min_p` currently gets the server's built-in defaults (temperature 1.0, top_p 1.0). The checkpoint's `generation_config.json` is ignored. For GLM-5.3-Flash that file sets `top_p: 0.95`, which is also the setting the model card evaluates with. vLLM applies the checkpoint's values by default (`--generation-config auto`), so clients written against vLLM get different sampling here.

This change reads `generation_config.json` from the model path once at start (`generation_defaults`) and uses its `temperature`, `top_p`, `top_k` and `min_p` as the defaults for fields a request leaves out:
- A field the request sets always wins.
- A value of the wrong type or out of range is skipped with a warning, and the server's own default stands.
- No file means no change.
- Penalties are not taken from the file, since a default the engine refuses would fail every request.

**Behaviour change:** clients that send no `top_p` now sample at 0.95 instead of 1.0 on GLM-5.3-Flash. Any benchmark that relied on the old default will shift slightly. The change is documented in `docs/API.md` and `CHANGELOG.md`.

## Graphs

- [x] Host-side only: no change under `trnrt/kernels/` or `trnrt/models/`, and no graph shape changes
- [ ] Changes compiled graphs: which ones, and the `tools/graph_equiv.py` or device evidence

Sampling parameters are runtime inputs, not graph shapes.

## Accuracy

The sampling defaults intentionally move for requests that omit these fields. Requests that set them are unchanged.

## Performance

None claimed.

## Checklist

- [x] `make check` passes (lint, type-check and the CPU suite)
- [x] Tests cover the change: `test_the_checkpoints_generation_config_sets_the_sampling_defaults` (fails on `main`)
- [x] Docs updated (README, `docs/`, `CHANGELOG.md`)

<!-- This is an auto-generated description by cubic. -->
---
## Summary by cubic
Sampling defaults for `temperature`, `top_p`, `top_k` and `min_p` now come from the checkpoint's `generation_config.json` instead of the server's built-in values (temperature 1.0, top_p 1.0), matching vLLM's default behavior.

- Reads the file once at startup; fields a request sets always win, invalid values are skipped with a warning, and no file means no change.
- Penalties are not taken from the file since an unusable default would fail every request.
- Behavior change: requests that omit `top_p` now sample at 0.95 on GLM-5.3-Flash instead of 1.0.

<sup>Written for commit c5db21b2b6079af2d21db34e39bbd7f0327fb73a. Summary will update on new commits.</sup>

<a href="https://cubic.dev/pr/RunanywhereAI/trnrt/pull/18?utm_source=github" target="_blank" rel="noopener noreferrer" data-no-image-dialog="true"><picture><source media="(prefers-color-scheme: dark)" srcset="https://www.cubic.dev/buttons/review-in-cubic-dark.svg"><source media="(prefers-color-scheme: light)" srcset="https://www.cubic.dev/buttons/review-in-cubic-light.svg"><img alt="View guided diff" src="https://www.cubic.dev/buttons/review-in-cubic-light.svg"></picture></a>

<!-- End of auto-generated description by cubic. -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8c58bd113fdf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.