# Issue

**Title:** ENH: Compare the resampled volume in BCDTest_writeBranded2DImage

## Description

`BCDTest_writeBranded2DImage` now also compares the resampled volume it already writes, against the `BCDTest_T1_outputResampledVolume` baseline. The duplicate `BCDTest_T1_outputResampledVolume` test is removed. That test ran the same command without `--writeBranded2DImage`, and `CTEST_CUSTOM_TESTS_IGNORE` kept it from ever running, so its check was dead.

<details>
<summary>Local testing</summary>

Linux, GCC 13.3, Release SuperBuild against ITK v5.4.7.

- `ctest -R '^BCDTest_writeBranded2DImage$' -V` passes, with `ImageError` 0 for both the PNG and the NRRD (59 s).
- Negative check: comparing against a different BCD baseline (`BCDTest_T1_outputVolume_standard.nrrd`) fails with a size mismatch (exit 1), so the new compare is live.
- `pre-commit run --all-files` passes.

`TestData/BCDTest_writeBranded2DImage_standard.nrrd.sha512` exists but nothing references it. It is left untouched.

</details>

<details>
<summary>AI assistance</summary>

Claude Code found the duplication during a test-suite performance review, made the change, and ran the checks above. I reviewed the change.

</details>

<!--
provenance: claude-code session 2026-11-02
commit: d73efaafc
-->

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `479f147b8a9b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.