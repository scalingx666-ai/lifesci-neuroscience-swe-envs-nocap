# Issue

**Title:** New feature - Custom time interval for channel interpolation - Conflicts resolved

## Description

### Feature explanation
When interpolating channels of datasets, it is good to have the option of just interpolating a custom time interval of the bad channels instead of the entire time interval. This option is added to the pop_interp.m and eeg_interp.m. The text field for entering the start and stop of the time interval is shown in the interpolation pop page when the EEG dataset is not epoched.

### Test call
`EEG = pop_loadset('filename','eeglab_data.set','filepath','/data/matlab/eeglab/sample_data/');`
` EEG = pop_chanedit(EEG, 'lookup','/data/matlab/eeglab/plugins/dipfit/standard_BESA/standard-10-5-cap385.elp','load',{'/data/matlab/eeglab/sample_data/eeglab_chan32.locs' 'filetype' 'autodetect'});`
`EEG = pop_interp(EEG, [7  8  9], 'spherical', [10 20]);`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a6feed8180c4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.