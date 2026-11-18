# Issue

**Title:** [ENH] Add `check_data` mode to deal with running with/without nan values

## Description

Responds to #175 

This PR adds the `check_data` mode to FOOOF objects, which controls if added data is checked for NaN/Inf data-points, and fails out if so. By default, `check_data` is turned on, in which case objects act the same as before. 

However, this mode can be turned off, in which case the object plays nice with having NaN/Inf data. Model fitting will cleanly fail (no error) and so fitting can continue. This allows for fitting groups of spectra in which some spectra are NaN, and makes it easier to deal with messy shaped data in which some spectra may be missing, etc. 

So far the decision here is to not change default behaviour, but add an option for users to bypass some of the data checks. This, I think, is a safer option - the user has to choose when to ignore NaN data, and should only do so if they know why it is happening, etc. 

Note: this is an issue brought up by @mwprestonjr. MJ - whenever you get a chance, can you have a look at this proposal, and see if it addresses your use case, and check in whether you think this is a good solution for your purposes? Thanks!

### Examples

By default, this code will error, as before:
```
from fooof import FOOOF
from fooof.sim import gen_power_spectrum

freqs, pows = gen_power_spectrum([3, 50], [1, 1], [10, 0.2, 1])
pows[:] = np.nan

fm = FOOOF()
fm.fit(freqs, pows)
```

But, with explicit toggle of the check data mode, this will no longer throw an explicit error:
```
fm = FOOOF()
fm.set_check_data_mode(False)
fm.fit(freqs, pows)
```

This is probably most relevant for cases, with FOOOFGroup, whereby some spectra may be null:
```
from fooof import FOOOF, FOOOFGroup
from fooof.sim import gen_group_power_spectra

freqs, pows = gen_group_power_spectra(3, [3, 50], [1, 1], [10, 0.2, 1])
pows[1, :] = np.nan

fg = FOOOFGroup()
fg.set_check_data_mode(False)
fg.fit(freqs, pows)
```

Note, in the above, that by default (or if `set_check_data_mode(True)` is called, which returns the object to default mode of having check_data on), the above code fails.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2a66519bc40b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.