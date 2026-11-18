# Issue

**Title:** ENH:  Add label iamge registration and tests.

## Description

@stnava , @cookpa --- I was going to send an email regarding this work but figured it would be easiest to put all the information in a possible pull request.

With the segmentation networks developed over at ANTsXNet, I've been leveraging that information for registration and I figured the functionality might be useful for the community. Basic usage takes respective sets of fixed and label images, converts them to sets of single label images and calculates the centers-of-mass of all the labels. Those centers-of-mass are used to quickly compute a linear transform using ants.fit_transform_to_paired_points. The single label images (and optional intensity images) are used as input to one of the antsRegistrationSyN* deformable-only calls. I've also been playing with this for masked lesion registration.

Also, add test.

Let me know if you have a problem with this pull request. Alternatively, I can put it over in ANTsPyNet.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `96ba4f75d17a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.