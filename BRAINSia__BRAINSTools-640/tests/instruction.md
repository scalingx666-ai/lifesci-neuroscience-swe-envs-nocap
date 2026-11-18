# Issue

**Title:** BUG: Stop using --outputVolumes as a printf format string

## Description

When a single `--outputVolumes` value is given, `BRAINSABC` used it as a pattern for every corrected image and passed it directly to `sprintf` as the format string, with the volume type and the list index as arguments, into a fixed 8192-byte buffer. The documented `%s` and `%d` worked, but any other conversion read arguments that were never passed, `%n` wrote through a pointer taken from the stack, `%d` before `%s` handed an integer to a string conversion, and a long volume type overran the buffer. The pattern is now expanded by a small parser: `%s` is the volume type and `%d` the index, each at most once and in either order; `%0Nd` zero-pads the index; `%%` is a literal percent sign; anything else raises an `itk::ExceptionObject`. The default `%s_corrected_%d.nii.gz` and the documented behavior are unchanged. Same defect class as #634.

<details>
<summary>Tests</summary>

Thirteen GTests in `OutputVolumeTemplateGTest`, run against the previous `sprintf` implementation before the fix:

| Test | Previous implementation |
|---|---|
| default pattern, zero-padded index (`%03d`), literal `%%`, pattern with no conversions | pass (behavior preserved) |
| `%d` before `%s` | process terminates |
| volume type of 10,000 characters is not truncated or overrun | process terminates |
| second `%s`, second `%d`, `%n`, `%x`, `%*d`, `%10s`, trailing `%` throw | fail their `EXPECT_THROW` |
| wide zero padding (`%012d`, `%099d`) is not truncated, malformed widths (`%0d`, `%03x`, `%03`, `%003d`, `%3d`) throw | new with the parser |

Full suite on macOS Release: 553/553. The end-to-end `BRAINSABCSmallTest` is not registered in this configuration, and its two `--outputVolumes` arguments are separate files rather than a pattern, so the single-pattern path through `main` is covered only by these unit tests.

A search of the tree for `printf`-family calls whose format is a variable found no other instance; the remaining `sprintf` calls use literal formats.

Scope notes: widths are zero-padded only (`%03d`), matching what the option's description implies, so `%3d` (space padding) and precisions are now rejected rather than honored. A pattern with no `%s` or `%d` still works as before, so every image gets the same filename.

</details>

<details>
<summary>AI assistance disclosure</summary>

Claude Code (Sonnet 5.5) drafted the parser and the tests from a CodeQL finding triaged earlier in this series; each test was run against the old implementation to confirm the expected result. The author reviewed the change and ran the tests locally.

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f161d412e5c9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.