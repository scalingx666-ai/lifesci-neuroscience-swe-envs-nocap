# Issue

**Title:** Specifying Y-direction for FilterNet

## Description

I've added a new feature in BMTK to be compatible with the LGN of the new V1 model that has Y-axis defined upward. Currently, BMTK uses the downward Y-axis implicitly, while defining the angle of the drifting gratings using upward Y-axis. This may cause confusion, so I tried to make it more optional and explicit.

I did not change the default behavior, but implemented the 'y_dir' option, and the generation of the drifting gratings respect this option. Also, when movie is imported to BMTK, it can be optionally flipped along the Y-axis to resolve compatibility between the typical image format that uses the downward Y-axis and the new LGN model that uses the upward Y-axis.

A few tests were added for these changes and the documentation was updated.

Also, I've fixed a strange behavior of the 'add_movie' method for 'movie' option and 'data_file' is not specified. This method was supposed to work when 'data' was specified instead of 'data_file', but it wasn't.

On the minor thing, the spelling error for 'grating' was fixed on the examples in BMTK, and FilterNet is now compatible with both 'grating' and 'grating' for backward compatibility.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0b017e2b6940`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.