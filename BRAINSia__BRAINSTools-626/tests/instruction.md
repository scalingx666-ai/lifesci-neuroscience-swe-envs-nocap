# Issue

**Title:** BUG: Fix stack buffer overflow in DWIMetaDataDictionaryValidator::SetGradient

## Description

`DWIMetaDataDictionaryValidator::SetGradient` formatted three `%lf` values with `sprintf` into a 64-byte stack buffer; each component can expand past 300 characters. Now uses `snprintf` into a buffer sized for the format.

<details>
<summary>Verification</summary>

New test `DWIMetaDataDictionaryValidator.LargeGradientComponentsRoundtrip` sets 1e200 components and reads them back. Before the fix the test binary aborts on the stack protector; after the fix it passes. Full suite: 513/513 on macOS Release.

Found by CodeQL (`cpp/overrunning-write-with-float`).

</details>

<details>
<summary>AI assistance disclosure</summary>

Claude Code (Fable 5.1) ran the CodeQL scan and drafted the fix and the test. The author reviewed the change and ran all tests locally.

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `768345a75b8b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.