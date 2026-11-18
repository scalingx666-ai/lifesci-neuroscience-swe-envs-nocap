# Issue

**Title:** Downloads test_data and changes to test comparison methods.

## Description

List of changes included in this PR:

- Added Cellpose/utils' `download_url_to_file` function to `suite2p/utils.py`. Removed some unused imports and added tqdm import.
- Downloads test_data files to `.suite2p` folder
- Tests now rely on `Pathlib` instead of `os.path`
- Changed from using `filecmp.cmp` to `np.allclose` for comparison of `.npy` output files. Although `filecmp.cmp` worked fine when I kept running the tests on my own machine, the tests failed when I ran them on my remote workstation and another machine I had at home (both are Linux machines). The tests fail because all the output numpy arrays have very small differences. 
For instance, this example involves the comparison of the ground_truth(calculated on my machine) `F.npy` and the test_generated (on Janelia's remote workstation) `F.npy`. 
```
# Ground Truth F.npy data
arr1 = array([[17830.232, 17694.783, 17795.121, ..., 17561.602, 17491.295,
        17596.104],
       [17949.002, 17597.898, ...    16840.107],
       [17208.02 , 17385.795, 17578.523, ..., 17569.71 , 17490.918,
        17605.947]], dtype=float32)

# Test_generated F.npy Data
arr2 = array([[17830.23 , 17694.781, 17795.121, ..., 17561.602, 17491.295,
        17596.105],
       [17949.002, 17597.896, ...    16840.107],
       [17208.02 , 17385.797, 17578.531, ..., 17569.71 , 17490.918,
        17605.947]], dtype=float32)
```
I also noticed that the `F.npy` produced on my machine at home showed similar differences to the ground_truth `F.npy` **but** was not the same as the `F.npy` produced on Janelia's remote workstation. This leads me to believe there are small machine-specific differences across the output files which makes `filecmp.cmp` hard to use.

This problem was resolved with np.allclose and choosing appropriate `rtol` (relative tolerance) and `atol` (absolute tolerance) values.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5da9838eb144`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.