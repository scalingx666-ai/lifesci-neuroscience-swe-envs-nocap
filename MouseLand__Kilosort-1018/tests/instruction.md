# Issue

**Title:** Fix attribute not exist error in `io`

## Description

This pull request makes a small correction to the logic for handling incomplete data batches in `kilosort/io.py`.

Specifically, it ensures that the correct variable is decremented when the last batch is smaller than expected.

The bug was caught with the following traceback:

```python
Traceback (most recent call last):
  File "/home/zhangyiqin/miniforge3/envs/dbci/lib/python3.13/site-packages/spikeinterface/sorters/basesorter.py", line 270, in run_from_folder
    SorterClass._run_from_folder(sorter_output_folder, sorter_params, verbose)
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/zhangyiqin/miniforge3/envs/dbci/lib/python3.13/site-packages/spikeinterface/sorters/external/kilosort4.py", line 341, in _run_from_folder
    ops = compute_preprocessing(ops=ops, device=device, tic0=tic0, file_object=file_object)
  File "/home/zhangyiqin/miniforge3/envs/dbci/lib/python3.13/site-packages/kilosort/run_kilosort.py", line 616, in compute_preprocessing
    bfile = io.BinaryFiltered(ops['filename'], n_chan_bin, fs, NT, nt, twav_min,
                              chan_map, hp_filter, device=device, do_CAR=do_CAR,
    ...<2 lines>...
                              shift=shift, scale=scale, file_object=file_object,
                              batch_downsampling=batch_downsampling)
  File "/home/zhangyiqin/miniforge3/envs/dbci/lib/python3.13/site-packages/kilosort/io.py", line 978, in __init__
    super().__init__(filename, n_chan_bin, fs, NT, nt, nt0min, device,
    ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                     dtype=dtype, tmin=tmin, tmax=tmax, shift=shift,
                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                     scale=scale, file_object=file_object,
                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                     batch_downsampling=batch_downsampling)
                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/zhangyiqin/miniforge3/envs/dbci/lib/python3.13/site-packages/kilosort/io.py", line 654, in __init__
    self.n_batches -= 1
    ^^^^^^^^^^^^^^
AttributeError: 'BinaryFiltered' object has no attribute 'n_batches'. Did you mean: 'n_batches_raw'?
```

## Potential Risk

I am not sure if `n_batches` has some special usage under other scenarios. But the fix is unlikely to introduce BC as `self.n_batches` is soon overrided by `self.set_downsampling`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bc3bb2bc39cc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.