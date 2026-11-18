# Issue

**Title:** Add borders to points

## Description

Two parameters were added to `set_point_options`: border_width and border_color. These options allow addition of a border to be drawn around each point. An example of a plot drawn with and without point borders is shown below.

The default is no border.
If border_width is set to a value greater than 0, a black border is drawn around each point.
If border_color is set but border_width is not, then no border will be drawn.
Acceptable values for border_color are an 1x3 RGB matrix, or the Matlab color shorthand (such as 'g' or 'green').

![figure_1_a_noborder](https://user-images.githubusercontent.com/15925882/37569995-7dbd3420-2ac0-11e8-867d-4cee3807238a.png)

With borders:
![figure_1_a](https://user-images.githubusercontent.com/15925882/37570005-9d65f744-2ac0-11e8-9329-b67152fb6798.png)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f117a4833759`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.