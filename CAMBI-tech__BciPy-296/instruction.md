# Issue

**Title:** VEP display

## Description

# Overview

Modified VEP Display to support a configurable number of text areas with provided positions, as well as configurable VEP stimulus that can use any size of checkerboard pattern.

## Ticket

https://www.pivotaltracker.com/story/show/184564386

## Contributions

- Added a module for computing box positions and checkerboard patterns.
- Updated the vep demo code.
- Refactored the display code to use the new positions, simplifying stim creation.
- Refactored the layout utilities to support computing square shapes in 'norm' units. Also refactored to support 'height' units.
- Created a demo module for demonstrating various positional elements.

## Test

- Ran all demo code
- Created unit tests for computations. Ran all unit tests.

## Discussion

With just 4 text areas and a 2x2 checkerboard to represent each VEPStimuli, the flicker rate was able to render in the allotted 1 second. However, with 6 text areas, this increased the total number of stimuli to be rendered in each frame and the rendering of a single flicker took longer than 1 second. This problem was worse when the checkerboard size was increased to 3x3 or above. This is because each square on the checkerboard was represented using two shapes, a GratingStim for 'on' and one for 'off'. With 6 areas, this resulted in 48 visual shapes just to represent the stim.

I was able to reduce the number of stimuli by rendering each VEP Stim (checkerboard) as two visual shapes, a polygon with the primary color that has holes for each alternating square, and a backing square with the secondary color. On my local machine with 6 text boxes and 6 corresponding 5x5 checkerboards, the timing was able to complete in the allowed second. I put logging in place to confirm that this will work on other machines. If not, we can reduce the checkerboard size or draw fewer static elements.

https://github.com/CAMBI-tech/BciPy/assets/2153447/1cf9efa4-ad5f-41bf-b745-828121a253a3

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2757971cac31`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.