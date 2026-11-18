# Issue

**Title:** ENH: FILMGLS gifti output support in surface mode

## Description

<!--

Pull-request guidelines
-----------------------

1. If you would like to list yourself as a Nipype contributor and your name is not mentioned please modify .zenodo.json file.
2. By submitting this request you acknowledge that your contributions are available under the Apache 2 license.
3. Use a descriptive prefix for your PR: ENH (enhancement), FIX, TST, DOC, STY, REF (refactor), WIP (Work in progress)
4. Run `make check-before-commit` before submitting the PR.

-->
## Summary
<!-- Please reference any related issue and use fixes/close to automatically
close them, if pertinent -->

Fixes # .

FILMGLS is an interface for the FSL utility (film_gls) that fits GLM models to fMRI data. Most of FSL is only compatible with NIFTI files and NIFTI variants (e.g. NIFTI_GZ), but modern versions of film_gls in particular support gifti processing and output .func.gii files if a surface mode argument is included when invoking film_gls. Surface mode selection is supported by nipype but cannot be used in nipype workflows due to automated substitution of supported extensions for FSL outputs. With most FSL utilities the extension used to specify output files on the command line automatically selects the output format FSL uses, but film_gls in surface mode produces *.func.gii file in spite of this substitution. When workflow nodes downstream of FILMGLS then attempt to use the outputs of a FILMGLS node they're given the wrong filenames, namely files with NIFTI extensions rather than GIFTI extensions. This produces an error because such files do not exist. This enhancement addresses this issue in two ways.

* addition of GIFTI output file type to class Info of interfaces.fsl.base
* automatic assignment of GIFTI to output_type in FILMGLS constructor if (1) mode is set to 'surface' (2) no output_type is specified and (3) FSL version > 5.0.6

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `83e39037cb1f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.