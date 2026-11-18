# Issue

**Title:** [FIX] Drop None-valued Corrector kwargs and validate the rest against the m…

## Description

…ethod

FWECorrector and FDRCorrector collect every unrecognised keyword into ``self.parameters`` and forward it verbatim to whichever correction method ``transform`` ends up calling. Two things go wrong there.

An unset parameter arrives as ``None``, which is what the neurosynth-compose frontend sends for a field the user left blank. Storing it means the caller overrides the correction method's own default with nothing: a ``voxel_thresh`` of ``None`` crashes PermutedOLS, whose ``correct_fwe_montecarlo`` has no such argument, and quietly displaces ALE's 0.001 until it reaches ``_p_to_summarystat(None)``. Between them that was the only FWE path either estimator has. ``n_iters`` already had this rule; apply it to every keyword, in ``Corrector.__init__`` so FDR gets it too.

The keywords that remain were still only checked when Python bound them to the correction method, deep inside a run that may have taken hours to reach that point -- and not checked at all when the method is one of the Corrector's own, which take no keywords and so dropped them silently. The estimator is not known at construction, but it is by ``transform``, so validate there against the signature of the method about to be called and name it in the error. Methods declaring ``**kwargs`` accept anything and are left alone.

<!---
This is a suggested pull request template for NiMARE.
It's designed to capture information we've found to be useful in reviewing pull requests.

If there is other information that would be helpful to include, please don't hesitate to add it!

Please also label your pull request with the relevant tags.
See here for more information and a list of available options:
https://github.com/neurostuff/NiMARE/blob/main/CONTRIBUTING.md#pull-requests
-->

<!-- Please indicate after the # which issue you're closing with this PR.
This is helpful for the maintainers AND will magically close the issue when this
pull request is merged!
https://help.github.com/articles/closing-issues-using-keywords -->
Closes # .

<!-- Please give a brief overview of what has changed in the PR.
If you're not sure what to write, consider it a note to the maintainers to indicate
what they should be looking for when they review the pull request. -->
Changes proposed in this pull request:

-
-

## Summary by Sourcery

Make correction parameter handling defer unset values, forward configured estimator parameters, and reject unsupported keywords before correction runs.

Bug Fixes:
- Drop None-valued correction parameters so estimator defaults remain effective.
- Validate correction keywords during transform against the selected correction method and report unsupported arguments early.
- Forward FDR alpha values to estimator-implemented correction methods.

Enhancements:
- Support correction methods with **kwargs while preserving method-specific keyword validation for other callables.
- Add coverage for omitted parameters, estimator and native methods, permissive methods, and validation errors.

Documentation:
- Document None-parameter handling and transform-time validation for correction methods.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fdb11f05fa10`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.