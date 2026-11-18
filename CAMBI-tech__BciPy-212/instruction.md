# Issue

**Title:** Prestim acq buffer

## Description

# Overview

Update init eeg acq buffer to include prestimulus information. Update copy phrase task to use correct poststim buffer. Update get_data_for_decision to return the correct triggers accounting for prestim.

++ Revert unintended change in copy phrase display

## Ticket

[pivotal ticket](https://www.pivotaltracker.com/story/show/181924087)

## Contributions

- [bcipy/display/paradigm/rsvp/mode/copy_phrase.py](https://github.com/CAMBI-tech/BciPy/compare/1.5.1...prestim_acq_buffer?expand=1#diff-a217bd47fc9c85f481890dcb1dc1ec0de949446d4d060c75be63c79c5a3d5719) -  revert unintended change in copy phrase display which would prevent stimuli from aligning in center.
- [bcipy/task/paradigm/rsvp/copy_phrase.py](https://github.com/CAMBI-tech/BciPy/compare/1.5.1...prestim_acq_buffer?expand=1#diff-a7325e7a6568ce0dd53f44c2df7a301b58a4e242e2e3065bee0968dcddf08cb9) - updates to use the correct post stim buffer. Add validate to ensure user-configured parameters are correct for the task. 
- [bcipy/helpers/acquisition.py](https://github.com/CAMBI-tech/BciPy/compare/1.5.1...prestim_acq_buffer?expand=1#diff-6624f72c18f53856c270a1341e9e186bcf1eb07b41899725b35e8775fd40767e) - add prestimulus duration
- [bcipy/helpers/exceptions.py](https://github.com/CAMBI-tech/BciPy/compare/1.5.1...prestim_acq_buffer?expand=1#diff-9eff57c94ac7934af52ba2a054e64cc51db298adea490af7e0f00236117ecc4a) - add task related exception for use in copy phrase

## Test

- `make test-all`
- full calibration + copy phrase to ensure spelling could occur

## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? Verify the updates you did here.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `24c07169372d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.