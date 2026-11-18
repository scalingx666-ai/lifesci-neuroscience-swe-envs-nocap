# Issue

**Title:** VEP Display

## Description

# Overview

Added a VEP Display component. 

**Note**: while I've made a method for animation and a variable referencing vep_type, these need more direction from the clinical and engineering teams (4x4 vs 6x6; how it should animate). I want to preserve all of the spike work we've done thus far without committing to fancy animations or code generation at this time. Please add any suggestions that will make future changes easier.

## Ticket

https://www.pivotaltracker.com/story/show/182457440

## Contributions

- `display/paradigm/vep.py`: `VEPDisplay`: main display component needed to operate in any task. `VEPBox`: Bounding box for every single flickering box. `create_vep_codes`: method to create a random code for displaying the vep flickering.
- `display/paradigm/rsvp.py`: Add typing / linting.
- `bcipy/display.py`: added `VEPStimulusProperties` to better encapsulate the stimuli needed for VEP operation
- `display/demo/vep/demo_calibration_vep.py`:  a script to demonstrate how to set up and use the VEPDisplay in a task type setting.

## Test

- `display/demo/vep/demo_calibration_vep.py` Ran and made sure everything hit AC. No other parts of the code were touched. 

https://user-images.githubusercontent.com/11506578/186269881-fb76f065-0c9e-4d11-bbdd-e0ba47f56ebd.MOV


## Documentation

- Are documentation updates required? In-line, README, or [documentation](https://github.com/BciPy/bcipy.github.io)? Updated in-line. Some readme or other documentation could be helpful, please point it out! 

## Changelog

- Is the CHANGELOG.md updated with your detailed changes? Will do!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d9ddf4adfb28`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.