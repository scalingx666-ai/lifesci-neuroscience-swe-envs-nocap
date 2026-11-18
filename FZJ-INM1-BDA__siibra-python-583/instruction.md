# Issue

**Title:** Use precalculated bounding boxes of image-features to speed up image feature query

## Description

The profiling revealed that most time is spend fetching the boundingboxes of images. When this information is cached, the query itself takes less than a second (on 11th Gen Intel(R) Core(TM) i5-1145G7, 16 GB memory). Therefore, this PR allows the bounding box information to be precalculated and stored in the configs to be used in run time. I suggest that we utilize this method for all image features until the new spatial query system is settled.

EDT: Tests are failing due to issues with data-proxy. (lint is failing due to unused import which is caused by using a specific config branch)

EDT 2: Requires:
- 
- and recalculation of boxes ()

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0662f69094c4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.