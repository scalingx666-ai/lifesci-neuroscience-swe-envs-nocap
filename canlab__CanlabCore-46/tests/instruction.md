# Issue

**Title:** built in masking function taking any atlas_object for flexible parcel specification

## Description

Hi Tor!

I built in a mask option for robfit_parcelwise to accept any atlas_object (as an alternative to the default canlab_2018 489 parcels) for flexible specification of different atlases, subsets of parcels from the canlab_2018 atlas, etc.

Would be great if you could have a look and merge into the master branch!

Thanks,

Lukas

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f031afade866`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.