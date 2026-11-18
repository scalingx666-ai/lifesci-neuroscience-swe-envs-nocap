# Issue

**Title:** COMP: Update ITK to 5.4.7

## Description

Thanks @hjmjohnson for pulling in some of the Slicer fork branch commits into the ITK upstream.
```
List of ITK changes:
$ git shortlog 5bfed91..d458a37 --no-merges
Andras Lasso (2):
      BUG: Fix image file reader crash when axis direction vector is short
      COMP: Fix itkFileTools build error when testing enabled

Bradley Lowekamp (3):
      BUG: Use check_symbol_exists for TIFFFieldReadCount detection
      BUG: Replace std::abs<double> with std::fabs to avoid ambiguity
      ENH: Conform GDCM to use CMAKE_*OUTPUT_DIRECTORY

Csaba Pinter (1):
      ENH: Support 5D files in NRRD IO

Hans J. Johnson (13):
      BUG: Allow '.' and '+' in -march/-mtune strip regex (issue # 6133)
      COMP: Add ccache support and pixi CI tasks to release-5.4
      COMP: Backport GitHub Actions cache-management workflows to release-5.4
      COMP: Use pixi CI tasks and cache ccache in release-5.4 pixi workflow
      COMP: Add ccache caching to release-5.4 Azure pipelines
      COMP: Add ccache caching to release-5.4 macOS-arm workflow
      BUG: Set FFTW_INCLUDE from FFTW3f_INCLUDE_DIRS in FFTWF-only builds
      BUG: Register FFTW factory only for configured precisions
      COMP: Include fftw3.h directly in FFTW filter headers
      BUG: Make 1D FFT tests build with single-precision FFTW
      COMP: Restrict CurvatureRegistrationFilter to ITK_USE_FFTWD builds
      PERF: Hoist constant tensor-basis SVD out of the per-voxel DTI loop
      ENH: Add single-image-path test for DTI tensor reconstruction

Hans Johnson (2):
      COMP: Fix GDCM re-configuration writing libraries to /bin
      COMP: Drop legacy EXECUTABLE_OUTPUT_PATH/LIBRARY_OUTPUT_PATH in GDCM

James Butler (1):
      COMP: Update DCMTK targets based on new DCMTK namespace

Jean-Christophe Fillion-Robin (1):
      COMP: Add support for customizing ITK namespace (draft)

Matt McCormick (5):
      ENH: Serve SWIG/PCRE archives via direct-file IPFS CIDs
      STYLE: Format SwigInterface CMakeLists.txt with gersemi
      BUG: Support reading and writing 32-bit integer TIFF images
      COMP: Support C17/C23 standards in VXL and drop obsolete vcl iterator test
      ENH: Bump ITK version to 5.4.7
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7ff7a4696137`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.