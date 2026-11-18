# Issue

**Title:** RGB images writer

## Description

There's some code copy, but I don't know how to avoid it. Most types can have a `slope` so the standard functions respect:

     where
        ...
        A: Div<Output = A>,
        A: FromPrimitive,
        A: ScalarOperand,
        A: Sub<Output = A>
        ...

Of course, `[u8; 3]` can't respect those traits, so I added `write_rgb_nifti`, which is almost identical to `write_nifti`, and I try to re-use utility functions as much as possible. 

Moreover, I added 2 tests where I write RGB images, but I can't read them... So, those tests only check that the code compiles I guess. We will need a RGB reader someday to fix this!

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ac5dc24ed962`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.