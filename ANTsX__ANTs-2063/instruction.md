# Issue

**Title:** COMP: Include vnl_determinant.h where vnl_determinant is used

## Description

Four sources call `vnl_determinant` without including `vnl/algo/vnl_determinant.h`. They compiled because an ITK header included it, but current ITK `main` no longer does, so `ImageMath` fails to build against ITK `main`:

```
Examples/ImageMath_Templates.hxx:6195:25: error: 'vnl_determinant' was not declared in this scope; did you mean 'vnl_qr_determinant'?
```

This adds the include to:

- `Examples/ImageMath_Templates.hxx`
- `Examples/antsTransformInfo.cxx`
- `Utilities/itkAverageOverDimensionImageFilter.hxx`
- `Utilities/itkPreservationOfVectorDirectionImageFilter.cxx`

The other ANTs sources that call `vnl_determinant` (`ANTSJacobian`, `KellySlater`, ...) already include it.

## Testing

- Built `ImageMath`, `antsTransformInfo`, `antsRegistration`, `antsApplyTransforms`, `N4BiasFieldCorrection`, `DenoiseImage`, `PrintHeader` and `antsMotionCorr` from this branch, without the SuperBuild, against ITK `main` (`003e7538`) configured like `SuperBuild/External_ITKv6.cmake`: no errors. Without this change, `ImageMath` fails with the error above.
- Not built here against the current ITK pin or ITK 5.4.7; the header exists there and these files already compiled with it included indirectly.

## Note

With `ITK_LEGACY_REMOVE=ON` (the SuperBuild setting), ITK `main` warns that `vnl_determinant.h` is deprecated in favor of `itk::bridge::Math::Determinant`. With `ITK_FUTURE_LEGACY_REMOVE=ON` it is an error. Moving to `itk::bridge::Math::Determinant` would drop ITK 5.4 support, so it is left for when the ITK 5 build is retired.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dcdaf4212df4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.