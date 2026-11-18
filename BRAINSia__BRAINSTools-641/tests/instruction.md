# Issue

**Title:** STYLE: Clean up InitFromXML buffer handling and small CodeQL notes in BRAINSABC

## Description

Small cleanups in `BRAINSABC` from the CodeQL scan, as three separate commits. No behavior changes apart from one small leak fixed.

<details>
<summary>Commits</summary>

1. **`AtlasDefinition::InitFromXML` uses RAII.** The XML text was read into a `new char[]` that every error path had to `delete[]` by hand, after a null check that could never be taken because `operator new` throws (`cpp/incorrect-allocation-error-handling`). The text now lives in a `std::vector<char>` and the expat parser in a `unique_ptr` with `XML_ParserFree` as its deleter, removing the null check and five `delete[]` calls. The parser was previously created and never freed, so each call leaked it. One new test checks that an empty atlas file raises an exception, since a zero-size vector is the one new edge.
2. **Empty `if (debuglevel > 4) {}` removed** from `BRAINSABC.cxx` (`cpp/empty-if`, `cpp/empty-block`).
3. **Two implicit narrowing conversions made explicit** (`cpp/lossy-function-result-cast`): `GeneratePurePlugMask.h` converts `edgeMaskInterp->Evaluate()` to `bool`, and `LLSBiasCorrector.hxx` converts `foregroundBrainMaskInterp->Evaluate()` to `ByteImagePixelType`. Both come from nearest-neighbor interpolation of a mask image, so the values are exactly the mask's pixel values and the behavior is identical.

</details>

<details>
<summary>Tests and scope</summary>

These are refactors, so only commit 1 has a new test (`AtlasDefinition.EmptyFileThrows`); the existing `AtlasDefinitionGTest` (12/12 here) covers `InitFromXML`'s read, parse, and error paths. Commits 2 and 3 sit inside `main` and the registration pipeline, which no registered test reaches, so they are checked by compilation only. Full suite on macOS Release: 541/541. `BRAINSABC` needs `USE_AutoWorkup` and `USE_ReferenceAtlas`, which the CI recipe turns off, so CI does not build these changes.

Left alone on purpose: the 51 `cpp/commented-out-code` and 12 `cpp/equality-on-floats` results in `BRAINSABC`, which would be a large diff for no behavior change.

</details>

<details>
<summary>AI assistance disclosure</summary>

Claude Code (Sonnet 5.5) drafted the changes from the CodeQL findings triaged earlier in this series. The author reviewed them and ran the tests locally.

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f161d412e5c9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.