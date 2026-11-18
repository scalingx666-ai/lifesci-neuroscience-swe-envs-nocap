# Issue

**Title:** ENH: Locale-safe string-to-number conversions

## Description

## Summary

Addresses #403 — locale-dependent parsing functions (`std::stod`, `std::stof`, `std::stoi`, `atof`, `atoi`) cause failures for international users whose locale uses comma as the decimal separator.

- Adds `BRAINSCommonLib/LocaleSafeConversions.h` with drop-in replacements (`BRAINSTools::safe_stod`, `safe_stof`, `safe_stoi`, `safe_stoui`) that always use the C/POSIX locale
- Uses `std::istringstream` imbued with `std::locale::classic()` for full portability (GCC, Clang, Apple Clang, MSVC)

## Files requiring migration

The following files contain locale-dependent parsing calls that should be migrated in subsequent commits:

### BRAINSCommonLib (5 files)
- `BRAINSCommonLib/Slicer3LandmarkIO.cxx` — `std::stod`, `atof` (6 calls)
- `BRAINSCommonLib/Slicer3LandmarkWeightIO.cxx` — `std::stod` (1 call)
- `BRAINSCommonLib/itkBRAINSToolsTestMain.h` — `std::stoi`, `std::stod` (4 calls)
- `BRAINSCommonLib/itkInverseConsistentLandmarks.hxx` — `std::stoi` (2 calls)
- `BRAINSCommonLib/DWIMetaDataDictionaryValidator.cxx` — `std::atoi` (1 call)
- `BRAINSCommonLib/itkV3TestKernel/include/itkTestDriverInclude.h` — `atoi`, `std::stoi`, `std::stod` (4 calls)
- `BRAINSCommonLib/TestSuite/DumpImageInfo.cxx` — `std::stoi` (1 call)

### BRAINSConstellationDetector (6 files)
- `BRAINSConstellationDetector/src/landmarkIO.cxx` — `std::stod`, `std::stoi` (4 calls)
- `BRAINSConstellationDetector/src/landmarksDataSet.h` — `std::stod` (1 call)
- `BRAINSConstellationDetector/src/BRAINSClipInferior.cxx` — `std::stoi` (1 call)
- `BRAINSConstellationDetector/src/BRAINSLmkTransform.cxx` — `std::stod` (1 call)
- `BRAINSConstellationDetector/src/BRAINSConstellationModeler.cxx` — `std::stoi` (1 call)
- `BRAINSConstellationDetector/src/BRAINSConstellationDetector2.hxx` — `std::stoi` (1 call)
- `BRAINSConstellationDetector/src/BRAINSTrimForegroundInDirection.cxx` — `std::stoi` (1 call)
- `BRAINSConstellationDetector/src/BRAINSAlignMSP.cxx` — `std::stoi` (1 call)
- `BRAINSConstellationDetector/landmarkStatistics/LmkStatistics.cxx` — `std::stoi` (1 call)

### ImageCalculator (1 file)
- `ImageCalculator/ImageGenerate.cxx` — `std::stod`, `std::stoi` (5 calls)

### BRAINSFit (1 file)
- `BRAINSFit/TestSuite/PerformTestMMI.cxx` — `std::stoi` (2 calls)

### BRAINSLabelStats (1 file)
- `BRAINSLabelStats/BRAINSLabelStats.cxx` — `std::stoi` (2 calls)

### GTRACT (2 files)
- `GTRACT/Cmdline/gtractTensor.cxx` — `std::stod` (4 calls)
- `GTRACT/Cmdline/gtractAverageBvalues.cxx` — `std::stod` (6 calls)

### DWIConvert (3 files)
- `DWIConvert/SiemensDWIConverter.cxx` — `std::stod` (1 call)
- `DWIConvert/TestSuite/checkTagValueInHeader.cxx` — `std::stoi`, `std::stod` (5 calls)
- `DWIConvert/TestSuite/BFileCompareTool.cpp` — `std::stod`, `std::stoi` (3 calls)

### ARCHIVE (1 file)
- `ARCHIVE/BRAINSTalairach/vtkTalairachConversion.cxx` — `std::stod` (10 calls)

**Total: ~67 call sites across ~20 files.**

## Migration plan

1. This PR adds the utility header with safe wrappers
2. Subsequent PRs will migrate each module, grouped by directory, replacing locale-dependent calls with `BRAINSTools::safe_stod()` etc.
3. Integer parsing (`safe_stoi`) is included for API consistency, though `std::stoi` is not locale-sensitive for decimal integers — it matters for hexadecimal or when the string contains locale-dependent grouping separators

## AI disclosure

This PR was drafted with assistance from Claude (Anthropic). The utility header design, portability analysis, and codebase audit were AI-assisted. The `std::istringstream` + `std::locale::classic()` approach was chosen over `std::from_chars` (incomplete floating-point support on older Apple Clang) and over `strtod_l` / `_strtod_l` (non-portable platform extensions).

## Test plan

- [ ] Verify header compiles on all CI platforms (GCC, Clang, Apple Clang, MSVC)
- [ ] Add unit tests for `safe_stod`, `safe_stof`, `safe_stoi` with various inputs including edge cases (leading/trailing whitespace, overflow, empty string)
- [ ] Test with `LC_NUMERIC=de_DE.UTF-8` to confirm locale independence
- [ ] Migrate call sites incrementally and verify no test regressions

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `335bb3cf5b07`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.