# Issue

**Title:** Fix progress bar text in cell detection widget

## Description

Before submitting a pull request (PR), please read the [contributing guide](https://github.com/brainglobe/.github/blob/main/CONTRIBUTING.md).

Please fill out as much of this template as you can, but if you have any problems or questions, just leave a comment and we will help out :)

## Description
When the user opens the cell detection widget, selects "Skip Classification", and enables detection only, the progress bar still displays messages for classification steps:

Current sequence (even when classification is skipped):

- "Setting up detection..."
- "Detecting cells"
- "Setting up classification..."
- "Classifying cells"
- "Finished classification"

To fix this, I refined the logic so that the progress bar only displays relevant messages based on whether detection or classification is enabled.

**What is this PR**

- [x] Bug fix
- [ ] Addition of a new feature
- [ ] Other

**Why is this PR needed?**

Although a minor issue, this inconsistency may confuse users since they explicitly skipped classification, yet the UI incorrectly indicates classification is happening. This fix improves clarity and user experience.


**What does this PR do?**

Refines `thread_worker.py` file in `napari.detect ` submodule to ensure that only relevant progress messages appear based on the user's selection.

## References

Please reference any existing issues/PRs that relate to this PR.

I reviewed some existing issues, but I am unsure if any directly relate to this fix. This improvement is based on my experience as a user.

## How has this PR been tested?

Please explain how any new code has been tested, and how you have ensured that no existing functionality has changed. 

Manually tested by running the cell detection widget with different settings (detection only, classification only, both enabled). Verified that the progress bar messages correctly reflect the selected operation. No effect on any functionality because the refinement is related to the UI appearing text to make it more user-friendly, it's interrupting or intervening with existing functionality.

## Is this a breaking change?

If this PR breaks any existing functionality, please explain how and why. 

No, this does not break any existing functionality.

## Does this PR require an update to the documentation?

No

If any features have changed, or have been added. Please explain how the documentation has been updated (and link to the associated PR). See [here](https://brainglobe.info/community/developers/index.html#to-improve-the-documentation) for details.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `489d97bed936`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.