# Issue

**Title:** Fix copy/paste error (I think) removing negative bins.

## Description

Greetings!

I've starting including Bombcell in a processing pipeline I'm working on.  Bombcell is cool and looks great!

I did encounter an error when I started testing with a short-duration dataset:

```
Computing bombcell quality metrics:   0%|          | 0/159 units🚀 Starting BombCell quality metrics pipeline...
📁 Processing data from: ___
Results will be saved to: ___

Loading ephys data...
Loaded ephys data: 159 units, 101,797 spikes

⚙️ Computing quality metrics for 159 units...
   (Progress bar will appear below)
Computing bombcell quality metrics:   0%|          | 0/159 units
2026-01-29 22:27:52,632 [ERROR] Error running bombcell.
Traceback (most recent call last):
  File "/opt/code/run.py", line 114, in main
    capsule_main(
    ~~~~~~~~~~~~^
        analysis_path,
        ^^^^^^^^^^^^^^
    ...<2 lines>...
        cli_args.n_jobs,
        ^^^^^^^^^^^^^^^^
    )
    ^
  File "/opt/code/run.py", line 69, in capsule_main
    bc.run_bombcell(
    ~~~~~~~~~~~~~~~^
        phy_dir,
        ^^^^^^^^
    ...<3 lines>...
        save_figures=True
        ^^^^^^^^^^^^^^^^^
    )
    ^
  File "/opt/miniconda/envs/bombcell/lib/python3.13/site-packages/bombcell/helper_functions.py", line 1219, in run_bombcell
    quality_metrics, times = get_all_quality_metrics(
                             ~~~~~~~~~~~~~~~~~~~~~~~^
        unique_templates,
        ^^^^^^^^^^^^^^^^^
    ...<11 lines>...
        save_path,
        ^^^^^^^^^^
    )
    ^
  File "/opt/miniconda/envs/bombcell/lib/python3.13/site-packages/bombcell/helper_functions.py", line 846, in get_all_quality_metrics
    ) = qm.perc_spikes_missing(
        ~~~~~~~~~~~~~~~~~~~~~~^
        these_amplitudes, these_spike_times, time_chunks, param, return_per_bin=True
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    )
    ^
  File "/opt/miniconda/envs/bombcell/lib/python3.13/site-packages/bombcell/quality_metrics.py", line 452, in perc_spikes_missing
    surrogate_bins = np.delete(
        surrogate_amplitudes, np.argwhere(surrogate_bins < 0)
    )
  File "/opt/miniconda/envs/bombcell/lib/python3.13/site-packages/numpy/lib/_function_base_impl.py", line 5444, in delete
    keep[obj,] = False
    ~~~~^^^^^^
IndexError: index 4 is out of bounds for axis 0 with size 4
```

To my eye, this might be a simple copy-paste error in the code, involving `surrogate_amplitudes` vs `surrogate_bins`  This PR is a one-liner change that seems to fix it.  With this change, Bombcell is running great for me!

I'm not sure why this issue would arise for me but not others.  Maybe it's because I'm using a short-duration dataset, so more likely to try to remove elements at the end of `surrogate_amplitudes` or `surrogate_bins`?

In any event, I hope this PR is useful as a data point and/or fix.

Thanks!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7a09389469e1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.