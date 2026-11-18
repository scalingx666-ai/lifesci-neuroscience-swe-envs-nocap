# Issue

**Title:** BUG: Fix all shellcheck error-level findings in Scripts/

## Description

Eliminates all 83 `shellcheck -S error` findings (4 distinct rules) in `Scripts/`, fixing several latent bugs along the way. First step of the cleanup discussed in #397; warnings/info-level findings are not addressed here.

Each shellcheck rule is its own commit so individual fixes can be reverted or cherry-picked independently.

<details>
<summary>Per-commit breakdown</summary>

| Commit | Rule | Fixes | Notes |
|---|---|---|---|
| `BUG: SC1037 …` | SC1037 ×2 | `sliceBySliceOperation.sh` reading `$10` / `$11` | Bash parses bare `$10` as `${1}0`; the script silently stuffed garbage into PARAMETERS[5,6] whenever it was invoked with ≥10 args. Real bug. |
| `BUG: SC1087 …` | SC1087 ×6 | `antsMultivariateTemplateConstruction{,2}.sh`, `buildtemplateparallel.sh`, `directlabels.sh` | Two patterns: (a) `echo $files[1]` where `files` is a scalar from backtick `ls` (the `[1]` was dead text appended to the whole string) — index removed; (b) `echo "$TEMPLATES[$i] was not created"` where TEMPLATES is a real array — braces added so the right element is printed in the error message. |
| `BUG: SC2145 …` | SC2145 ×11 | `antsMultivariateTemplateConstruction{,2}.sh` | (a) `echo "prefix ${arr[@]}"` → `${arr[*]}` (echo wants one space-joined string). (b) `mv ${tmpdir}/selection/${TEMPLATES[@]} ${currentdir}/` was a real bug — the prefix only glued to the first element, so subsequent files were picked up from `cwd` instead of `${tmpdir}/selection/`. Replaced with an explicit `for` loop. |
| `BUG: SC2068 …` | SC2068 ×64 | 14 scripts | Mechanical `${arr[@]}` → `"${arr[@]}"` everywhere it was unquoted. Done with a perl in-place regex using negative lookbehind/ahead so already-quoted expansions are left alone. Protects against filenames-with-spaces being re-split by `IFS`. |

</details>

<details>
<summary>Verification</summary>

- `shellcheck -S error Scripts/*.sh` returns 0 lines after the four commits (was 83 lines before).
- `bash -n` syntax check passes on every modified file.
- No behavior change is intended in the SC2068 commit (pure quoting). The SC1087/SC2145 commits include three genuine bug fixes (positional-arg parse, error-message array index, `mv` cross-directory move) which alter observable behavior only in the broken-case direction.

</details>

<details>
<summary>What's NOT in this PR</summary>

- 497 shellcheck warnings (SC2206/SC2034/SC1083/SC2207/SC2124/SC2164/…) — these are the precondition cleanup needed before `set -euo pipefail` adoption can be safely attempted.
- `set -e` adoption itself — only 1 of 46 scripts uses strict mode today. That's a separate, per-script PR with maintainer regression testing per the discussion in #397.
- A CI lint gate. A reasonable next step is to add `shellcheck -S error Scripts/*.sh` to CI to keep the 0-error invariant.

</details>

Refs: #397

<!--
provenance: claude-code session 2026-05-20
related_files:
  - Scripts/sliceBySliceOperation.sh
  - Scripts/antsMultivariateTemplateConstruction.sh
  - Scripts/antsMultivariateTemplateConstruction2.sh
  - Scripts/buildtemplateparallel.sh
  - Scripts/directlabels.sh
  - Scripts/antsAtroposN4.sh
  - Scripts/antsBrainExtraction.sh
  - Scripts/antsCookTemplatePriors.sh
  - Scripts/antsCorticalThickness.sh
  - Scripts/antsJointLabelFusion.sh
  - Scripts/antsJointLabelFusion2.sh
  - Scripts/antsLongitudinalCorticalThickness.sh
  - Scripts/antsLongitudinalJointLabelFusion.sh
  - Scripts/antsRegistrationSpaceTime.sh
  - Scripts/shapeupdatetotemplate.sh
shellcheck_version: 0.11.0
errors_before: 83
errors_after: 0
post_merge_action: consider adding `shellcheck -S error Scripts/*.sh` to CI to lock the 0-error invariant
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `301f40d0948c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.