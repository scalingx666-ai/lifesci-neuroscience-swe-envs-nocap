# Issue

**Title:** Writer options

## Description

Here's a first draft of `WriterOptions`. I don't see anything particularly horrible or insulting to a programmer :) Maybe

- `header_file: bool` is not a super name. Does nifti have a name for the distinct files (nii vs hdr+img)?
- I feel that the path update is "unclean". Maybe we should calculate the final path only in the `write` functions?
- I wanted to add an option to set a reference path, in case the user doesn't want to load the header himself and simply give us the path to the header, but we would lose the [faster] `reference: Option<&'a NiftiHeader>`. If we don't care about copying this struct and we love this feature, I can do it. It would also remove the lifetime, which some people may like :)
- Do you have other ideas of useful parameters?

> This would also be an opportunity to ground one common API for writing, regardless of their data type (RGB) or how they are represented (ndarray or a NiftiVolume type).

I still don't understand how I can write a single function for "normal" **and** rgb image. I see that they now share some common parameters, but we still have the problem with the traits. `[u8; 3]` must respect `DataElement` and `TriviallyTransmutable`. Because of this, I kept the `write_nifti` and `write_rgb_nifti` functions (now transformed to methods).

Fix #49 and maybe some other stuff.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `61d8534d3e08`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.