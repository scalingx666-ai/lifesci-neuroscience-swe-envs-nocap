# Issue

**Title:** fixes and suggestions for challenge

## Description

- made the right screen (bot view) render in debug mode

- corrected the distance calculation in the evaluation function, since it was appending distances each iteration instead of the final distance achieved for each run

- scaled down bot energy from 1000 to 1 for better reservoir dynamics, since the rest of the input is between 0 and 1, this big value makes training rather difficult. I have manually adjusted my `Win` to account for this, but I get the best results by just scaling down the value for the Bot and Environment itself. 
(This could probably also be done simpler in the evaluate function, so 
in line 152 of `challenge.py` with 
`I[n:,0] = bot.hit, bot.energy, 1.0` 
to 
`I[n:,0] = bot.hit, bot.energy / 1000 , 1.0` 
, but might be less intuitive without an explanation.)

Since these changes influence the performance of the bots, some changes need to be made to the readme as well, so the score for the random bot changes to `1.05 ± 0.54` and the explanations itself at some points change too.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f56e6e487411`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.