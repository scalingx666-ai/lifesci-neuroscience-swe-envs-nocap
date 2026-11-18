# Issue

**Title:** Orthoslice view for Blender with Image_stack_interraction

## Description

Hi,
I modified the code of Image_Stack_Interactions.py so that you can now displays stacks in the X and Y directions.
The only problem I see is if you change the folders while an Image is displayed, it will make blender crash. But I think it was already doing it with your version.

I generate the stacks with a macro I wrote in ImageJ. I provide it to you in case you think it can be usefull. It take a stack in Z as input, and create 3 folders containing the separated stacks in X, Y and Z.
[stackSeparation3D.txt](https://github.com/ajorstad/NeuroMorph/files/202382/stackSeparation3D.txt)

I haven't updated the version of the script, I let you do that if you are fine with it.

Best regards,
Tom Boissonnet

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e7241fd5729d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.