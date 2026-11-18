# Issue

**Title:** BUG: Report an unclosed '[' instead of silently dropping the option

## Description

# Description

`CommandLineParser::RegroupCommandLineArguments` joins arguments from an opening `[` until the matching `]`. When the command line ends before any `]` shows up, the joined argument is thrown away without an error. The option loses its value, and every flag after it is swallowed into the discarded string too.

With the 2D test image `r16slice.nii.gz` and a small rigid registration:

```
antsRegistration -d 2 -o '[u_,u_w.nii.gz]' -t 'Rigid[0.1]' -m "MeanSquares[$I,$I,1]" \
  -c '[5,1e-6,10]' -s 0 -f 1 -x "[$I,$I" --verbose 1
```

On current main this exits 0 and prints nothing: `--verbose 1` never reaches the option parser, and `-x` is left with only the placeholder value `1` instead of the two mask files. With the closing `]` added, the same command prints 177 lines of verbose output.

The fix throws the same `itkExceptionMacro` the function already uses for other malformed delimiters. With it, the command above exits 1 with (image path shortened):

```
Description: Incorrect command line specification. Missing right delimiter? [r16slice.nii.gz,r16slice.nii.gz--verbose1
```

antsRegistration catches `itk::ExceptionObject` and exits 1. Tools that don't catch it, such as antsApplyTransforms, abort with exit 134 (`terminate called after throwing an instance of 'itk::ExceptionObject'`), which is what they already do for the other delimiter errors this function raises, for example `-o '[a.nii.gz' -o '[b,c]'`.

I added `antsCommandLineParserTest`, a small fixture-free test in `Examples/TestSuite` next to `antsWahbaRotationTest`. It checks that a well-formed `-x [fixed.nii, moving.nii] --float 1` (split across two arguments) still parses, and that `-x [fixed.nii,moving.nii --float 1` throws. Against the old parser the second case fails with:

```
FAIL: unclosed '[' was accepted; --masks has 1 value(s), first is '1', --float has 0 value(s)
```

`ctest` on a Linux superbuild (ITK v6, long tests off): 132/132 before, 133/133 after.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0f65b0e66bea`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.