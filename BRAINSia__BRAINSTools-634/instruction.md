# Issue

**Title:** BUG: Stop using --posteriorTemplate as a printf format string

## Description

`BRAINSABC` passed the user-supplied `--posteriorTemplate` directly to `sprintf` as its format string, into a fixed 8192-byte buffer. A template containing another conversion reads arguments that were never passed, `%n` writes through a pointer taken from the stack, and an expansion longer than the buffer overruns it. The template is now expanded by a small parser: one `%s` becomes the prior name, `%%` becomes a literal percent sign, and any other use of `%` raises an `itk::ExceptionObject`. The default `POST_%s.nii.gz` is unchanged.

<details>
<summary>Tests</summary>

Seven GTests in `PosteriorFilenameTemplateGTest`, run against the previous `sprintf` implementation before the fix:

| Test | Previous implementation |
|---|---|
| substitutes the prior name; `%%` is a literal percent | passes (behavior preserved) |
| name of 10,000 characters is not truncated or overrun | process terminates (stack protector) |
| `%n` in the template throws | process terminates |
| second `%s`, `%x`, and a trailing `%` throw | fail their `EXPECT_THROW` |

Full suite on macOS Release: 529/529. The end-to-end `BRAINSABCSmallTest` is not registered in this configuration, so the default-template path through `main` is covered only by these unit tests.

Found by CodeQL (`cpp/non-constant-format`, CWE-134) after building the modules CI leaves off (`USE_BRAINSABC` needs `AutoWorkup` and `ReferenceAtlas`).

</details>

<details>
<summary>Scope notes</summary>

- A template with no `%s` at all still works as before, so every posterior gets the same filename. That is a data-loss footgun but not a memory-safety issue, so it is left unchanged here.
- `BRAINSABC.cxx` has the same pattern on `--outputVolumes` (`sprintf(buf, output_Volumes[0].c_str(), name, i)`). It needs a parser that also accepts an integer conversion, so it is a separate follow-up PR.

</details>

<details>
<summary>AI assistance disclosure</summary>

Claude Code (Sonnet 5.5) drafted the parser and the tests from a CodeQL finding triaged earlier in the session; each test was run against the old implementation to confirm it fails. The author reviewed the change and ran the tests locally.

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c06d9dc711dc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.