# Issue

**Title:** add support for custom offline atlases

## Description

With this small PR, i want to enable atlas developers to test their atlases using BrainGlobe's pipeline.
As of now, if the atlas is not official (i.e. present on the Gin repository), it updates the `last_versions.conf` file overriding any local changes that may have added a new custom local atlas.

This PR intends to read the atlases from both the cached file of `last_versions.conf` and `custom_atlases.conf` file.
`custom_atlases.conf` follows the same structure as `last_versions.conf`.

## Description

**What is this PR**

- [ ] Bug fix
- [x] Addition of a new feature
- [ ] Other

## References

discussed over [on Zulip](https://brainglobe.zulipchat.com/#narrow/channel/390955-general/topic/adult.20mouse.203D.20atlas.20with.20dorsal.2Fventral.20distinction/near/495003139).

## How has this PR been tested?

`python -c "import brainglobe_atlasapi as bg; print(bg.list_atlases.get_all_atlases_lastversions())"`

with `custom_atlases.conf` file both existing and not.

## Is this a breaking change?

no

## Does this PR require an update to the documentation?

Perhaps?

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [ ] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8ea937a54d52`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.