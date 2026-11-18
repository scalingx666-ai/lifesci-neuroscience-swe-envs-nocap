# Issue

**Title:** Address github cronjob CI runs issues: inability to build/install old git (wrong version/tag, absent build-depends)

## Description

### PR checklist

- [x] Provide an overview of the changes you're making and explain why you're proposing them.
- [x] Create a changelog snippet (add the `CHANGELOG-missing` label to this pull request in order to have a snippet generated from its title;
  or use `scriv create` locally and include the generated file in the pull request, see [scriv](https://scriv.readthedocs.io/)).
- [ ] Remove TEMP commit (lightens up CI and forces to run cron jobs too)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bf6065ab646d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.