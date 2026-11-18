# Issue

**Title:** docs: fix challenge starter-kit claims found in the post-release audit

## Description

. I repeated the from-scratch participant audit against released 0.3.1 (`pip install neuralbench` in a clean Python 3.12 venv, following only the published pages) and re-checked every claim in the starter kit against the shipped code.

The release itself holds up: every documented CLI invocation parses, every `--dataset` alias resolves, every model and `-w` preset exists, all four headline metric keys match what the tasks log, and all of #249's fixes are live and working — the non-interactive config notice, the GPU-capability warning (it fired on a real driver mismatch here, `torch 2.14.0+cu130` against driver 12.4, and the run continued), and the `moabb>=1.7.1` / `eegdash>=0.8.2` errors, whose floors match the code exactly. `tangermann2012` downloaded in 57 s at 744 MB, the figure the Track 2 page gives.

This PR fixes what the audit found that is wrong in prose rather than in code. Everything here is either under `docs/` or under `neuraltrain-repo/ssl_example/`, which participants get by cloning rather than from the wheel, so **no release is required**.

## Pretraining page: the documented run could not reach the first gradient step

The page said each dataset "is fetched from its public source the first time its study runs" and that "nothing else is needed to start them downloading". `Study.run()` never fetches; only `Study.download()` does, and neither `ssl_example` nor the page ever called it. A participant following the page would have watched all four studies fail — `Gifford2022Large` on a missing file, `Stieger2021Continuous` on the `timelines.csv` that only `_download` writes, and the other two on an empty timeline.

Added `ssl_example/grids/download.py`, which walks `STUDIES` and calls `Study.download()` on each; verified against released 0.3.1 that the call resolves the per-study subfolder itself and is a no-op on already-fetched data. The page and the example README now both route through it.

Three more corrections on the same page:

- The install block asked for `neuraltrain[lightning,models]` only, but `Stieger2021Continuous` needs `moabb>=1.7.1`, which nothing in the dependency graph installs. The sibling Track 2 page and `install.md` both say so already; this page was the odd one out.
- "Any `neuraltrain` model config drops into the same `MaeModule`" is not true: `brain_model_config` is typed `MaeEncoder`, and `MaeModule` calls that encoder's patching and token methods. Passing another model is rejected by pydantic.
- The frozen backbone was attributed to `mae.yaml`, which sets no freeze key and therefore fine-tunes. Freezing comes from the `linear_probe_mean` preset, which `-w` selects and `evaluate_model` defaults to — as the same page correctly says 54 lines earlier. A reader who trusted the later sentence and dropped `-w` would have reported a fine-tune score as a probe score.
- The corpus is ~1.1 TB by the overview page's own measured table, not "close to a terabyte".

## `install.md`: the config it recommends writing by hand crashes

The page tells participants to write a config file for SLURM batch scripts, `nohup`, CI and notebooks, and gives `{"CLUSTER": null}` as its example. Six keys have no default in `config_manager._initialize_module_vars` — `USER`, `ENTITY_NAME`, `PROJECT_NAME`, `DATA_DIR`, `CACHE_DIR`, `SAVE_DIR` — so that example fails with a bare `KeyError: 'USER'`, which I hit before any run started. The page now lists all six with a complete example, says which of them are only labels, and presents the `CLUSTER` snippet as an addition to them.

Two smaller ones there:

- `--prepare` was listed as CPU-only, but `eeg image`'s target extractor embeds its stimuli with DINOv2 and its task config requests a GPU. The section also now says that training, `--debug` included, has no CPU fallback — the driver mismatch this page warns about is what stopped the "quick local sanity check" on my host, after the pipeline had otherwise run through download, preprocessing and model construction.
- "`wandb` is the only extra of the package itself" contradicted the developer install two sections above; `dev` and `docs` exist too.

## Track pages

- **Track 3** described the target as the first *stable* N2 epoch and offered "the first non-Wake epoch satisfying a fixed persistence rule" as an equivalent. `AddSleepOnsetTargets` takes `n2["start"].min()` — the earliest annotated N2 event, with no persistence or non-Wake logic — and the two definitions do not coincide, since N1 normally precedes N2. The page now states what the extractor computes and tells participants to check the competition's definition before reshaping the target. The overview's echo of the same phrase is fixed too.
- **Track 3** also promised tolerance rates within 30 / 60 / 300 s "as diagnostics"; no such metric exists in `neuralbench`. Now attributed to the competition scorer, with the starter kit's own metrics named.
- **Track 4** and the overview gave emg2pose as ~310 GB; `salter2024emg2pose.py` warns the user it is ~340 GB. Aligned to the figure the code prints.
- **Track 2** attributed `PredefinedSplit` to `neuralset.events.transforms`; it lives in `neuralbench.transforms`.
- `ssl_example/grids/run_grid.py` hardcodes `slurm_partition: "learnfair"`, a Meta-internal partition the page points public participants at twice. Flagged in place with a comment.

## Not in this PR

Two findings need code changes and therefore a release; noted here so they are not lost:

- `neuralbench --help` lists each task's default study alongside its selectable variants, but `--dataset` only accepts the variants that have a `datasets/*.yaml`. `--dataset gifford2022large`, `--dataset stieger2021continuous` and `--dataset kemp2000analysis` — the primary dataset of tracks 1, 2 and 3 — all fail with "Unknown dataset", which is a strange first experience for anyone who reads `--help` and types what it shows.
- User errors surface as raw tracebacks: an unknown `--dataset`, a missing optional dependency and a hand-written config each end in an uncaught exception rather than a CLI message, even though the message text itself is good.

Separately, the theme's "View this page" and "Edit this page" links 404 on every sphinx-gallery page, challenge pages included: they point at `docs/neuralbench/auto_examples/.../plot_*.rst`, which is generated at build time and never committed. That is a `docs/conf.py` fix, and I left it out of a content PR.

## Test plan

- `ruff check` and `ruff format --check` pass on `docs/` and `neuraltrain-repo/ssl_example/`.
- `ns.Study(name=..., path=...).download()`, the call `download.py` makes, verified against released 0.3.1 on an already-fetched study.
- Link and anchor check over the 8 published challenge pages plus `install.md`: 3161 link instances, 396 distinct targets, no broken internal links and no missing anchors beyond the pre-existing gallery source links described above.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b457e8317997`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.