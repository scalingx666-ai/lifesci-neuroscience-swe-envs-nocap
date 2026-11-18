# Issue

**Title:** adding function for plotting specific interval lists side by side

## Description

# Description

Adding the function `plot_specific_interval_lists()` to `common_interval.py`. 
I added this function to my repo locally a while ago and use it all the time so figured it might be helpful for other people too. It's similar to the `IntervalList.plot_intervals()` function except takes in a specific list of `interval_list_name` values to display and does some nice formatting. I've used it often as a helpful tool when double checking that my interval lists span the times that I expect them to and when developing new custom interval lists to add.

Example usage:
```
from spyglass.utils.nwb_helper_fn import get_nwb_copy_filename
from spyglass.common.common_interval import plot_specific_interval_lists

subj = 'chip'
date = 20220104

nwb_file_name = f"{subj}{date}.nwb"
nwb_copy_file_name = get_nwb_copy_filename(nwb_file_name)

plot_specific_interval_lists(nwb_copy_file_name, ['raw data valid times', 'pos 1 valid times', 'pos 1 mobile times', 'pos 3 valid times'])
```

Outputs:
![plot_specific_interval_lists_example](https://github.com/user-attachments/assets/6bb819da-b665-4d9b-8333-f225217c0665)

# Checklist:

- [X] This PR should be accompanied by a release: no
- [X] N/A. If release, I have updated the `CITATION.cff`
- [X] This PR makes edits to table definitions: no
- [X] N/A. If table edits, I have included an `alter` snippet for release notes.
- [X] N/A. If this PR makes changes to position, I ran the relevant tests locally.
- [X] N/A. I have updated the `CHANGELOG.md` with PR number and description.
- [X] N/A. I have added/edited docs/notebooks to reflect the changes

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c25ea48fc0de`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.