# Issue

**Title:** Neurovault - Neuropower integration

## Description

There are two main parts of this pull request:
1. A button is added to the image pages on [neurovault](http://www.neurovault.org).  This button redirects to [neuropower](http://www.neuropowertools.org) and fills out the form with data from the neurovault API, similar to the [neurosynth](http://www.neurosynth.org) button.
2. A specific data upload page has been created on [neurovault](http://www.neurovault.org) for power analysis.  This page allows with one page the upload of a new image, also similar to what is in [neurosynth](http://www.neurosynth.org).  The form is specific to the necessary input for neuropower.  Images are by default hidden, as these data are supposed to be from pilot or incomplete studies.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e11f47d74b27`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.