# Issue

**Title:** Non-square dvid YZ tiles display incorrectly

## Description

When tiles are not square, YZ (ZY) dvid tiles display with seams and gaps.  This appears to be because the width and height styles are set to the final width and height, rather than those of the source image.

With this patch, if you set the tile size to the transposed viewable (YZ) size (not the DVID ZY size), they should display correctly. (Alternatively, you could let users enter the original DVID ZY tile size and flip width and height everywhere else. Regardless, might be worth documenting.)

This fixes the display for non-square transposed tiles, at least for me on firefox (Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0).  This may need to be fixed in other viewers as well.

Even with this patch, I still see 1-pixel seams in some cases, but I suspect that's more a browser CSS transform issue.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e085224cfc72`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.