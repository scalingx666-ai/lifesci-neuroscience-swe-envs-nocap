# Issue

**Title:** Fix EEG/EMG Foundation Challenge 2026 starter-kit issues found in a from-scratch walkthrough

## Description

Fixes what a from-scratch walkthrough of the [EEG/EMG Foundation Challenge 2026 starter kit](https://facebookresearch.github.io/neuroai/neuralbench/auto_examples/biosignal_challenge_2026/index.html) turned up, following the published pages only, on a clean `pip install neuralbench` environment.

## Code

- **Adaptation wrappers reached only the published foundation models.** `-w linear_probe_mean` was dropped with a warning for `mae`, so the pretraining page's own linear probe silently ran a full fine-tune instead — a wrong number, not an error. The gate now asks whether the model's config ships a `downstream_model_wrapper`, which is exactly the six FMs plus `mae` today and stays right as models are added.
- **The GPU capability check aborted the CLI.** On a driver older than the installed torch, `torch.cuda.get_device_capability` raises, and it did so inside the warning helper that every command runs — including `--download` and `--plot-cached`, which never touch a GPU. It now warns and names the reinstall.
- **`load_config` ignored a hand-written config's directories** and failed later with `Parent folder ... must exist first`; it now creates them, as the wizard already did. Creation is best-effort, so an unmounted or read-only `DATA_DIR` still cannot break a command that never touches it. The non-interactive `/tmp` fallback also says so on stderr rather than silently redirecting a batch job's datasets to local disk.
- **A MOABB study whose subjects all fail to download** asserted `Failed to create timelines.csv`, discarding the real cause. It now names the counts and chains the last error.
- **`ChannelPositions`** names the montage it resolved against, and the fix, when no channel has a position.

## Docs

- Track 1's headline metric key was `test/batch_top5_acc`, the in-batch number early stopping monitors; the scored one is `test/full_retrieval/top5_acc_subject-agg`.
- Track 3 described the target as a single latency from recording start. The task predicts the time remaining per 5-second window; the page now gives that, and the conversion back to the competition's `tau_hat`.
- The overview's Track 4 aggregation command named `emg typing -m emg2qwerty`.
- Tracks 2 and 4 need `moabb` and `eegdash`, which the base install does not pull and the install page said were unnecessary.
- No page mentioned download size. Measured footprints for all four defaults are now on the overview and the two heaviest track pages: `Gifford2022Large` is ~210 GB, `Salter2024Emg2pose` ~310 GB, and `Stieger2021Continuous` ~600 GB plus ~280 GB once MOABB converts it — which also makes the pretraining example close to a terabyte rather than a laptop job.
- Track 2 now points at `--dataset tangermann2012` (BCI Competition IV-2a, under 1 GB) as the way to exercise the pipeline against a known baseline before committing ~900 GB to the default.
- The pretraining page installed `neuraltrain-repo/.[lightning,models]` without saying `ssl_example` only exists in a clone, and pointed at `DATA_DIR`/`CACHE_DIR` when the example uses its own `DATADIR`/`CACHEDIR` under `~/.cache/neuralset`.
- The submission page still said the portal was not open; it now names Codabench and the per-track registration.
- Sleep-EDF is 78 participants over up to two nights each, not "78 nights"; `install.md`'s `#developer-install` anchor resolves.

## Checks

`ruff check`, `ruff format --check`, `mypy` on the three touched packages, `pytest` on the two touched test modules (59 passed), and a full `make -C docs html`.

Four tests are added: adaptation applies to backbones only, the GPU check survives a driver error, and `load_config` both creates the configured directories and warns rather than fails on one it cannot create.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c36d59991d98`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.