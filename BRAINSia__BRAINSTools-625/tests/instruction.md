# Issue

**Title:** BUG: gtractInvertRigidTransform wrote the identity instead of the inverse

## Description

`gtractInvertRigidTransform` always wrote an identity transform and exited 0. It called `GetInverse` through a generic `itk::Transform` pointer, whose base-class overload is non-virtual, does nothing, and returns `false`. The tool now downcasts to `VersorRigid3DTransform`, uses its `GetInverse`, and fails with a message when the input is not an invertible rigid transform.

<details>
<summary>Verification</summary>

New `GTRACTInvertRigidGTest` runs the module entry point on a known rigid transform and checks `inverse(forward(p)) == p`. Before the fix the round-trip point is off by the full transform (FAILED); after the fix it passes. Full suite: 513/513 on macOS Release.

Found by CodeQL (`cpp/useless-expression`: the ignored `GetInverse` return value).

</details>

<details>
<summary>AI assistance disclosure</summary>

Claude Code (Fable 5.1) ran the CodeQL scan, identified the root cause in the ITK API, and drafted the fix and the test. The author reviewed the change and ran all tests locally.

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eb0a9d25d508`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.