# Issue

**Title:** ENH: add Raw annotation span conversion

## Description

#### Reference issue (if any)

Addresses #13890.

#### What does this implement/fix?

`Raw.get_annotation_spans()` computes all annotation spans at once as `(tmin, tmax)` pairs.

#### Additional information

Verification: 10 tests passed, 1 skipped because Qt was unavailable. Ruff checks and formatting checks passed.

AI/GDN disclosure:

GDN is an independent verification system that sits above AI and uses its own verification system in conjunction with AI. I have reviewed and understood the changes that were implemented and approve them. Once again, GDN is an independent verification system that sits above AI and can be used with any model. It just so happens that we are using ChatGPT with GPT-5.6 Sol at Ultra reasoning effort to complete our work.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `64718464cfc1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.