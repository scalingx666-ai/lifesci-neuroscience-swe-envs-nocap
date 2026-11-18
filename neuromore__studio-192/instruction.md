# Issue

**Title:** Improve Windows Package

## Description

**WINDOWS ONLY CHANGES**

* Adds required icon resolutions: 
  * 50x50 (Store-Logo)
  * 44x44 (Small Start-Menu Logo)
  * 150x150 (Medium Start-Menu Logo)
* Zips `.pdb` into `.appxsym` files
* Zips `.appxbundle` and `.appxsym` files into `.appxupload`
* Adds `.appxupload` file to Github artifacts
* Sets `/PDBALTPATH` to plain filename instead of full path on compile system
* Shows `.pdb` info in Github CI using `llvm-pdbutil dump --summary`
* Adds `.pdb` files to `.appx` packages (for side-loading..)
* Sets `/DEBUG:FULL` in linker on release builds (see [here](https://learn.microsoft.com/en-us/cpp/build/reference/debug-generate-debug-info))
* Sets` /MANIFEST:EMBED` in linker (see [here](https://learn.microsoft.com/en-us/cpp/build/reference/manifest-create-side-by-side-assembly-manifest))

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9af8d006ee7d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.