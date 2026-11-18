# Issue

**Title:** Write ndarray to nifti

## Description

As explained in #19, here's our code to write a `ndarray` to a nifti file. I kept it simple, it's all in the same file, you simply need to call `write_nifti` with an `Array` or an `ArrayView`, in `c` or `f` ordering. When you want to create a new image with the same header (same position, spacing, etc.), simply call the function with the optional `NiftiHeader`.

In a generic context, you will need to use the trait `TypeTool`. I'm not a fan of it, but I don't know how to avoid it, and it's not too bad, maybe it simply needs to be hidden :)

Some problems that I can see with my code:
- The `if slope != 1.0 || header.scl_inter != 0.0 {` condition is not required. Maybe we shouldn't care about some substraction and divisions...
- As I said, `TypeTool`. The name is bad, I know. But I do think it's a good trait usage.
- The ndarray `dim` and `datatype` currently win over the same fields in the header. That may or may not be what the user wants. I know that nibabel prefers the header, so it casts the data. I personally don't like automatic hidden casts, I prefer converting my ndarray myself.
- Afaik, NiBabel ignores `scl_slope` and `scl_inter` on writing. They are simply set to 1.0 or 0.0. I never ignore them. This is sadly as "automatic" as the casts...
- The last 2 points are complex. Not complex to code but to decide what should be done.

By the way, do not hesitate to be critical! I won't cry over it. It's the best way to learn.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1b10e0989f7e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.