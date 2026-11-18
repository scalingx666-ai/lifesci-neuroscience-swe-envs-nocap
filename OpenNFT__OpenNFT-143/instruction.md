# Issue

**Title:** Some fixes, hopefully, for DCM feedback errors found on test data

## Description

When testing on DCM dataset the following issue happens on ~scan 161, after the first FB session is evaluated

(here I emulated online session by copying files one by one every TR s, to exclude possible offline mode issues; so the output somewhat differs from offline mode)

```
2022-03-15 07:35:05 | INFO      | opennft:callMainLoopIteration - Call iteration for file "001_000008_000161.dcm"
TIMING: 5 iter - PREPROC MC: 2.534752e-01 s - SMOOTH: 2.042950e-02 s - IGLM: 5.246740e-02 s
2022-03-15 07:35:06 | INFO      | opennft:callMainLoopIteration -   preprocess fMRI Volume: 0.36 s
2022-03-15 07:35:06 | INFO      | opennft:callMainLoopIteration -   preprocess signal: 17.00 ms
2022-03-15 07:35:06 | INFO      | opennft:callMainLoopIteration - Sending by UDP - dispValue = 0.0
2022-03-15 07:35:06 | INFO      | opennft:displayMosaicImage - Getting background volume: 7.00 ms
2022-03-15 07:35:06 | INFO      | opennft:callMainLoopIteration - Display mosaic image: 22.00 ms
Traceback (most recent call last):
  File "opennft-venv\lib\site-packages\opennft\opennft.py", line 978, in callMainLoopIteration
    self.drawRoiPlots(init)
  File "opennft-venv\lib\site-packages\opennft\opennft.py", line 2685, in drawRoiPlots
    (dataNorm, np.array([self.displaySamples]) / self.P['MaxFeedbackVal'])
  File "opennft-venv\lib\site-packages\pyqtgraph\numpy_fix.py", line 13, in concatenate
    return np.concatenate_orig(vals, *args, **kwds)
  File "<__array_function__ internals>", line 6, in concatenate
ValueError: all the input array dimensions for the concatenation axis must match exactly, but along dimension 1, the array at index 0 has size 109 and the array at index 1 has size 151
```

So at the time the shapes of arrays are:
```
dataNorm.shape:
(3, 109)
np.array([self.displaySamples]).shape
(1, 151)
```

The first commit of this PR seems to solve the issue, however I am not fully sure this is the proper way of doing that.

Also the second commit is about feedback always being 0, but that is a much clearer issue or at least I think it is.

If the issue should not be hapening anyway, and is the result of local setup and not OpenNFT, please let me know, in any case feedback is apreciated

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5e0f77d86972`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.