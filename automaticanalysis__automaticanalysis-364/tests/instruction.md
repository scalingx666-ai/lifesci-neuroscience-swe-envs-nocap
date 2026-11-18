# Issue

**Title:** PPI

## Description

This PR includes code changes related to PPI analysis:

**aamod_vois_extract**

I added fixed-sphere (to run the chapter 36 example in the SPM manual) and mask-based ROI definition (because we need that option here) while being careful not to make any changes to how roimaximum setup works (because its already in use).

I added a bunch of sanity checks in the code to help the user navigate proper parameter specification.

Also, I deleted "blob" from the <type> header options. Listing unimplemented options in the API can confuse a user.

Additionally, I removed the isrenamaeable tag on rois -- the code isn't structured for this to be a renameable stream.

Finally, I documented usage in the module header as best I could.


**aamod_ppi_prepare**

I added options for contrast vector and named contrast specification. Also sanity checked the VOI name to generate a more helpful error message than Matlab crashtext. 

Also documented usage in the module header as best I could.


**aamod_firstlevel_model**

I restored the old codeblock for adding PPI regressors automatically which the module uses if it doesn't find any ppi-specific covariates. This way, we provide the option to define complex PPI models for advanced users yet made the functionality easy to use for people who just need the basics. I had to change ~isempty to isstruct in the PPI checkrequirements section -- the former was crashing on me if I didn't define any PPI covariates.

Unrelated: I changed the design matrix QA image to the design matrix rather than the orthogonality summary in order to display additional model settings which I think the user will find more informative.


**New Files**

I added a PPI tutorial script based on the clickthrough PPI analysis in chapter 36 of the SPM12 manual. The script required some trickery to deal with their old Analyze format data by converting to nifti on-the-fly (so the aamod_*fromnifti modules can be used). 

I was able to reproduce the chapter results closely albeit not exactly. YMMV.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1094ed7ac978`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.