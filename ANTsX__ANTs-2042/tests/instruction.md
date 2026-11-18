# Issue

**Title:** PERF: Read only the reference image header in antsApplyTransforms

## Description

# Description

This change comes from a performance review of ANTs.

`antsApplyTransforms` reads the full `-r` reference image with `ReadImage()`. That reads and keeps all of the pixel data. But the tool uses only the geometry of the reference image (origin, spacing, direction, largest possible region). No code uses its pixels or its MetaDataDictionary.

## Summary

```diff
 Utilities/ReadWriteData.h
+  ReadImageInformation<T>(target, file)     # new helper, next to ReadImage
+    file:    reader->UpdateOutputInformation()   # read the header only
+    pointer: target->CopyInformation(source)     # ANTsR / ANTsPy, no pixel copy

 antsApplyTransforms
-  ReadImage(referenceImage)                       # full read of the pixels
+  ReadImageInformation(referenceImage)            # geometry only, no pixel buffer
+  if it fails and an image or displacement field is written: error, EXIT_FAILURE
-  referenceImage->GetBufferedRegion() / GetRequestedRegion()
+  referenceImage->GetLargestPossibleRegion()
```

The reference image now has no pixel buffer. So the code reads its size and start index from `GetLargestPossibleRegion()`, and not from the buffered or requested region. After a full read, these three regions are equal, so the values do not change. Every use of the reference image reads only geometry.

There are two commits:

1. `ENH:` adds `ReadImageInformation<T>()` to `Utilities/ReadWriteData.h`. It handles a file name and an in-memory image pointer (ANTsR / ANTsPy). It prints the same `does not exist` / `is not recognized as a supported image format` messages as `ReadImage()`. PR #2050 can use the same helper after this PR merges.
2. `PERF:` uses the helper in `antsApplyTransforms`, changes the region reads, and adds the CTest `antsApplyTransformsReferenceImageTest`.

The code uses only API that is in ITK 5.4.7 and in ITK 6 (`ImageFileReader::UpdateOutputInformation`, `ImageBase::CopyInformation`).

## Evidence

Host: epic (AMD Ryzen 9 9950X, GCC 15, ITK 6 pinned build). The base binary is built from unmodified `main` (f53fd42b) with the same compiler and flags. Tests use `ITK_GLOBAL_DEFAULT_NUMBER_OF_THREADS=4`.

**Peak memory** (`/usr/bin/time -v`, `-d 3 -e 0 -i T1w.nii.gz -r mni.nii.gz -t identity -n Linear`, reference 193x229x193, two runs each):

| Binary | Peak RSS (kB)  |
|--------|----------------|
| base   | 282216, 281576 |
| PR     | 216036, 215728 |

Peak RSS is approximately 66 MB (approximately 23%) lower. Other jobs used epic during the runs, so I do not report wall times.

**Output is bit-identical.** I compared uncompressed outputs from base and PR with `cmp`. All cases are byte-identical:

- `-e 0` T1w to mni, identity, Linear
- `-e 0` T1w to mni2mm, BSpline
- `-e 3` 4D series2mm to mni2mm, Linear
- `-e 3` 4D bold3mm to T1w3mm, NearestNeighbor
- `-e 0` affine transform, displacement field output `[disp.nii,1]`
- `-e 0` affine transform, Linear
- `-e 1` vector image input (non-zero displacement field), affine transform
- `-e 0` with a 4D reference image
- `-e 2` tensor input (small test image made at test time)
- `-o Linear[lin.mat]` with a good reference image, and with a missing reference image
- `-o CompositeTransform[comp.h5]` with a missing reference image
- benchmark output above

**Reference image that cannot be read** (missing file, or a file that is not an image):

| Output | Before | After |
|--------|--------|-------|
| Image (`-o out.nii`, all `-e` types) or displacement field (`-o [field.nii,1]`) | segmentation fault (exit 139), because the tool continued with a null reference image | error message and exit 1 |
| Transform only (`-o Linear[...]` or `-o CompositeTransform[...]`, no `-i`) | exit 0, transform written | exit 0, transform written (no change) |

A transform-only output does not need a reference image, so a bad reference image is still not an error there. The error message prints without `--verbose`, because it is a hard error. `ReadImage()` also printed its messages without `--verbose`.

**New test.** `antsApplyTransformsReferenceImageTest` is a CMake script test, like `ResampleImageInterpolationTest`. It makes small MetaImage inputs and an affine transform at test time, so it needs no new test data. It checks:

- a good reference image gives an output with the reference size (exit 0)
- a missing or non-image reference image gives exit 1 and no output, for a scalar image, a displacement field and a tensor (`-e 2`) image
- a missing reference image with `-o Linear[...]` or `-o CompositeTransform[...]` gives exit 0 and writes the transform
- a tensor (`-e 2`) image with a good reference image gives exit 0

I ran the test script on epic with the same `cmake -P` command line that CTest uses. It passes with the PR binary. It fails with the base binary, because base crashes with a missing reference image.

## Merge Danger

**Door:** two-way

The change is local to one function and one new helper, and is easy to revert.

**Blast Radius:** small

Caveats:

- The in-memory pointer path (ANTsR / ANTsPy) now also copies only the image information, and not the pixels. I did not test it, because the command line cannot make a pointer. A null pointer now gives exit 1 when an image is written, and not a crash.
- `-o Linear[...]` with `-i` and with a missing or no `-r` crashes on base and on this PR. This PR does not change that path.
- I compiled and tested only with ITK 6.
- #2045 restructures the time-series output block of `antsApplyTransforms.cxx`, and this PR changes the region reads in that block. A merge of both PRs has one conflict hunk there. #2045 already reads `referenceImage->GetLargestPossibleRegion()` in that block, so keep the #2045 version of the hunk. All other files merge without conflict.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f53fd42bb555`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.