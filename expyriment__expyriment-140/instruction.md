# Issue

**Title:** Updated help text and init method for Audio class

## Description

Updated the help text and init method for Audio class to indicate the filetype must be .ogg or .wav because thats all the `pygame.mixer.Sound` accepts, according to the [the Pygame.mixer.Sound man page](https://www.pygame.org/docs/ref/mixer.html#pygame.mixer.Sound).

Without this check, you get a generic message about bring "unable to open the file" when you try to open e.g., a .mp3 file, which doesn't help anyone figure out the issue.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4ac751c20490`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.