# Issue

**Title:** STYLE: Use stack objects in DCMTKFileReader::CanReadFile and IsImageFile

## Description

`DCMTKFileReader::CanReadFile` and `IsImageFile` checked the result of `new` for null, which can never happen since a failed allocation throws. Both objects are now stack-allocated, removing the dead checks and the manual `delete` calls. No behavior change.

<details>
<summary>Verification</summary>

Pure refactor; no test can fail without it. The existing DWIConvert DICOM tests exercise both functions. Full suite: 513/513 on macOS Release. Found by CodeQL (`cpp/incorrect-allocation-error-handling`).

</details>

<details>
<summary>AI assistance disclosure</summary>

Claude Code (Fable 5.1) ran the CodeQL scan and drafted the change. The author reviewed it and ran all tests locally.

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `768345a75b8b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.