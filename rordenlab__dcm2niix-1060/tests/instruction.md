# Issue

**Title:** Fix malformed ReconFilterType JSON for multi-valued ConvolutionKernel

## Description

## Problem

Since v1.0.20260416 (49a27c3, issue #983), some CT series produce a BIDS sidecar that is not valid JSON. The new `ConvolutionKernel` -> `ReconFilterType`/`ReconFilterSize` split has two defects:

1. It scans the whole kernel string, including the DICOM multi-value separator `\`. Siemens CT kernels are often multi-valued, e.g. `Bv40d\3` (kernel + iterative strength). The last digit run is taken as the size, so the name becomes `Bv40d\`.
2. The name is written with a raw `fprintf("%s")` instead of `json_Str`, so `\` and `"` are not escaped.

Result for `ConvolutionKernel = Bv40d\3`:

```json
	"ConvolutionKernel": "Bv40d\\3",
	"ReconFilterType": "Bv40d\",
	"ReconFilterSize": 3,
```

The `\"` escapes the closing quote, and JSON parsers fail (Python: `Invalid control character`, or `Expecting ',' delimiter` with `strict=False`). The bug is still present in v1.0.20261029 and on `development`.

## Fix

- Parse only the first value of the kernel (`strcspn(..., "\\")`). `Bv40d\3` now yields no `ReconFilterType`, the same as `B30f`.
- Write the name with `json_Str`, which also returns early on an empty name (replacing the `strlen > 0` check).

## Testing

Synthetic 3-slice CT series (pydicom), `-b y -ba y`, sidecar loaded with Python `json.loads`:

| ConvolutionKernel | `development` | this PR |
| --- | --- | --- |
| `Bv40d\3` | invalid JSON | valid, no ReconFilterType |
| `A"B3` | invalid JSON | valid, `"A\"B"` + 3 |
| `XYZ Gauss4.00` | `XYZ Gauss` + 4 | `XYZ Gauss` + 4 (unchanged) |
| `B30f` | no ReconFilterType | unchanged |

`dcm_qa` outputs are byte-identical between `development` and this branch. `codespell` is clean, and `clang-format` (project style) makes no change to the edited lines.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c462a7393681`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.