# Issue

**Title:** Fix spatial null maps for volumetric data

## Description

This pull request fixes the bugs reported in Issue #27, as well as a few other unreported bugs. The main changes are:

- Added a try-except statement to clean-up temporary files when an error is raised in _vol_surrogates() function.

- WindowsPath object fetched using fetch_atlas() is now converted to a str in the mni152_to_mni152() function. This fixes an Error happening when load_niimg(), a nibabel function, is called.

- In the _make_surrogates() function, when genfunc() is called as _vol_surrogates(), an error was raised because n_proc is not a valid argument. The function call was modified so that n_proc is now a keyword argument.

- The function call to genfunc() in the _make_surrogates() function was modified so that n_proc is now a keyword argument. This fixes an issue happening when _vol_surrogates() is called.

- The generation of burt2020 nulls required version >= 0.10.0 of brainsmash. The burt2020() function now tests for that using the "packaging" module. This module has been added to the requirement.txt file.

- The _vol_surrogates() function was refactored such that the data is masked only when no parcellation is used. Otherwise, the data should already be parcellated. 

- The function now checks whether the data (if not parcellated) is in the 2009cASym or 6ASym MNI152 space. If it is in neither, the 2009cASym brainmask is resampled behind the scene to fit the data.

- Fixed a bug in _vol_surrogates() where the column average was not computed when using a parcellation. 

- Fixed a bug happening when the user try to generate a single null brainmap using the burt2018, burt2020 or moran method.

- Modified the fetch_atlas() function so that two different T1w and brain masks (one for 2009cAsym and one for 6Asym) are downloaded from OSF and added to the Bunch object when fetching the MNI152 atlases for the 1mm and 2mm densities. We also added the name of the MNI152 version as prefix to the map names in the Bunch object. For instance, "T1w" is now called "2009cAsym_T1w".

- Modified the documentation of null functions, clarifying the Types of the "data" parameter

- Added a check making sure that data is array-like and one dimensional when a parcellation is used in any of the burt2018(), burt2020() or moran() spatial nulls.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ba28fc47e091`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.