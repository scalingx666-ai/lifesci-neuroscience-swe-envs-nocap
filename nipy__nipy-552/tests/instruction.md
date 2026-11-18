# Issue

**Title:** ENH: Replace saving mayavi figure to a temporary file with mlab.screenshot()

## Description

## Details
While triaging your project, our bug fixing tool generated the following message(s)-

> In file: [maps_3d.py](https://github.com/nipy/nipy/blob/main/nipy/labs/viz_tools/maps_3d.py#L120), there is a method that creates a temporary file using an unsafe API `mktemp`. The use of this method is discouraged in the [Python documentation](https://docs.python.org/3/library/tempfile.html#tempfile.mktemp). iCR suggested that a temporary file should be created using `mkstemp` which is a [safe API](https://docs.python.org/3/library/tempfile.html#tempfile.mkstemp). iCR replaced the usage of mktemp with `mkstemp`.


#### Resources Related to `mktemp`
- [POC - Improper Method Call - python - mktemp.mp4](https://drive.google.com/file/d/16YKuKgv7iItWcac2biRyi2Cm8upJ3HP_/view?usp=share_link)
- [MISC - Python - Taking a peek under the tempfile library.mp4](https://drive.google.com/file/d/1ns2_x_ZDvzFwj0eNNxyay-HUMclLasNT/view?usp=share_link)


## Changes
- Replaced `mktemp()` method with `mkstemp()`


## Previously Found & Fixed
- 
- 
- 


## CLA Requirements
*This section is only relevant if your project requires contributors to sign a Contributor License Agreement (CLA) for external contributions.*

All contributed commits are already automatically signed off.

> The meaning of a signoff depends on the project, but it typically certifies that committer has the rights to submit this work under the same license and agrees to a Developer Certificate of Origin (see [https://developercertificate.org/](https://developercertificate.org/) for more information).
\- [Git Commit SignOff documentation](https://developercertificate.org/)


## Sponsorship and Support
This work is done by the security researchers from OpenRefactory and is supported by the [Open Source Security Foundation (OpenSSF)](https://openssf.org/): [Project Alpha-Omega](https://alpha-omega.dev/). Alpha-Omega is a project partnering with open source software project maintainers to systematically find new, as-yet-undiscovered vulnerabilities in open source code - and get them fixed – to improve global software supply chain security.

The bug is found by running the Intelligent Code Repair (iCR) tool by OpenRefactory and then manually triaging the results.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b3d202f7aa46`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.