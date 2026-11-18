# Issue

**Title:** Fix physionet rename

## Description

## What does this PR do?

Fixed a bug when using *neuralfetch* for downloading Zyma2019Electroencephalograms study. The bug is the following : the Physionet._download() method (inside the neuralftech/download.py file) expects the S3 client to download files in the "temp/study/version" folder, but for the MAT study, the S3 client downloads directly in "temp" folder.

```bash
Downloading Zyma2019Electroencephalograms to /Users/edgarduc/Code/EEG_benchmark/data/Zyma2019Electroencephalograms/download...
Traceback (most recent call last):
  File "/Users/edgarduc/Code/EEG_benchmark/rocket.py", line 524, in <module>
    raise SystemExit(main())
                     ^^^^^^
  File "/Users/edgarduc/Code/EEG_benchmark/rocket.py", line 503, in main
    metrics = run_task(
              ^^^^^^^^^
  File "/Users/edgarduc/Code/EEG_benchmark/rocket.py", line 448, in run_task
    events = load_study_events(adapter, data_dir=data_dir, study_name_override=study_name)
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/Users/edgarduc/Code/EEG_benchmark/rocket.py", line 271, in load_study_events
    study.download()
  File "/Users/edgarduc/Code/EEG_benchmark/venv/lib/python3.12/site-packages/neuralset/events/study.py", line 382, in download
    self._download(**kwargs)
  File "/Users/edgarduc/Code/EEG_benchmark/venv/lib/python3.12/site-packages/neuralfetch/studies/zyma2019eeg.py", line 86, in _download
    physionet.download(overwrite=overwrite)
  File "/Users/edgarduc/Code/EEG_benchmark/venv/lib/python3.12/site-packages/neuralfetch/download.py", line 359, in download
    self._download()
  File "/Users/edgarduc/Code/EEG_benchmark/venv/lib/python3.12/site-packages/neuralfetch/download.py", line 1224, in _download
    inner.rename(self._dl_dir)
  File "/opt/homebrew/Cellar/python@3.12/3.12.12/Frameworks/Python.framework/Versions/3.12/lib/python3.12/pathlib.py", line 1363, in rename
    os.rename(self, target)
FileNotFoundError: [Errno 2] No such file or directory: '/Users/edgarduc/Code/EEG_benchmark/data/Zyma2019Electroencephalograms/temp/eegmat/1.0.0' -> '/Users/edgarduc/Code/EEG_benchmark/data/Zyma2019Electroencephalograms/download'
```

The fix is a simple path checking and fallback logic : if "temp/study/version" doesn't exist, we look for temp folder children containing study name or version name, and else we directly consider the temp folder as the "inner" folder.

## Test

Added "test_physionet_handles_missing_inner_path" function in neuralfetch/test_download.py to test for robust handling of temp directory layout.

## Checklist

- [ ] Tests added or updated
- [ ] Docstrings updated for any changed public APIs
- [ ] `pytest` and `mypy` pass locally

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b3b8b2da5bdc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.