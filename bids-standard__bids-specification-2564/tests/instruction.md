# Issue

**Title:** [INFRA] Introduce REUSE specification compliance

## Description

## Summary

This covers the "this repository itself" item of 
- #2015
 
It makes the repository's existing licensing machine-readable under [REUSE](https://reuse.software/): it adds `LICENSES/`, a `REUSE.toml`, and a `reuse` pre-commit hook. **Nothing is relicensed.** The annotations only record what the repository already declares:

| Path                           | License      | Copyright                              | Source of the declaration                        |
| ------------------------------ | ------------ | -------------------------------------- | ------------------------------------------------ |
| `**` (default)                 | CC-BY-4.0    | 2016-2026 BIDS Contributors            | root `LICENSE`, `CITATION.cff`, `mkdocs.yml`     |
| `tools/schemacode/**`          | MIT          | 2020-2026 Brain Imaging Data Structure | `tools/schemacode/LICENSE`, its `pyproject.toml` |
| `BIDS_logo/bids-animated.webm` | CC-BY-SA-4.0 | 2021 Adina Wagner                      | `BIDS_logo/README.md`                            |

`reuse lint` reports 365/365 files compliant with REUSE 3.3.

## Question for maintainers: license of the remaining code

Apart from `bidsschematools`, the repository has more code: `tools/*.py`, `tools/mkdocs_macros_bids/`, `tools/typescript/`, `tools/examplecode/`, `scripts/`, and `pdf_build_src/`. This code has no license of its own, so the root CC-BY-4.0 applies to it, and this PR records it that way. CC licenses are [not recommended for software](https://creativecommons.org/faq/#can-i-apply-a-creative-commons-license-to-software). 

**Should this code move to MIT, the same as `bidsschematools`?**

That is a relicensing decision. It is not part of this PR. The files date from 2020–2026 and have between 1 and 9 authors each, so the change would need agreement from those contributors. With agreement, the change is one more `[[annotations]]` block in `REUSE.toml`.

<details><summary>Details</summary>

- **Years:** CC-BY-4.0 starts at 2016, the BIDS 1.0.0 release (the spec existed as a Google Doc before it moved to git in 2018). `bidsschematools` starts at 2020, when `schemacode/` first appears in history, although its `LICENSE` file says 2022 (the year that file was added in #1207).
- **License texts:** the CC texts are the canonical files from creativecommons.org `legalcode.txt`. `MIT.txt` comes from `reuse download` (the SPDX list). The root `LICENSE` and `tools/schemacode/LICENSE` are unchanged; they differ from the `LICENSES/` copies only in the copyright line and whitespace.
- **pre-commit:** adds the `reuse` hook from codeberg.org/fsfe/reuse-tool, frozen at v6.2.0, which lints the whole repository. pre-commit.ci will enforce it.
- **README:** adds a short Licensing section.

</details>

## Test plan

- [x] `uvx --from reuse reuse lint`: compliant
- [x] `pre-commit run reuse --all-files`: passed
- [x] Spot-checked `reuse spdx`: schemacode files resolve to MIT, the animated logo to CC-BY-SA-4.0, and the rest to CC-BY-4.0
- [ ] Maintainers decide on the code-licensing question above (can be a follow-up issue)
- [ ] Depending on above, remove `exclude-from-changelog` label ;-) 

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c357bdbdfb2c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.