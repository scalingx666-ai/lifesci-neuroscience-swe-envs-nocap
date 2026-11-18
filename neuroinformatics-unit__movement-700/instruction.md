# Issue

**Title:** Fix issues with multi-version docs

## Description

## Description

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**
 PR #668 brought us multi-version docs, but had some in-adverted minor effects/hiccups:

- Merges to `main` don't trigger a deployment of docs to the "dev" folder, as was the original intention, because we neglected to update the if guard in the `docs_build_and_deploy.yml` workflow. See more detailed explanation on [Zulip: #Movement > Actions for deploying multiple versions of Sphinx Docs @ 💬](https://neuroinformatics.zulipchat.com/#narrow/channel/406001-Movement/topic/Actions.20for.20deploying.20multiple.20versions.20of.20Sphinx.20Docs/near/554388491).
- The light/dark theme switcher was lost, 

**What does this PR do?**
- Updates `docs_build_and_deploy.yml` workflow such that the deploy step is also triggered upon merges to main, in the same way it works for [NeuroBlueprint](https://github.com/neuroinformatics-unit/NeuroBlueprint/blob/a31abf970daa549b997539555c7945ff7c341706/.github/workflows/docs_build_and_deploy.yml#L53).
- Restores the theme switcher to the end of the navbar, by modifying `html_theme_options` in Sphinx's `conf.py`.

## References

 

## How has this PR been tested?

Local docs build looks correct. CI passes.
The real test for the deployment trigger will happen upon merging this PR.

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

N/A

## Checklist:

- [x] The code has been tested locally
- [ ] ~Tests have been added to cover all new functionality~
- [ ] ~The documentation has been updated to reflect any changes~
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bc523ee47c66`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.