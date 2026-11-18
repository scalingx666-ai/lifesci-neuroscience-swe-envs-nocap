# Issue

**Title:** Notify on slack when scheduled conda workflow fails

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other: maintainer experience

**Why is this PR needed?**

In the past we've missed some failures of the scheduled `conda_install_check` workflow.

**What does this PR do?**

Borrowing [brainglobe's approach](https://github.com/brainglobe/brainglobe-atlasapi/blob/29a4bfab2f8ff69da882e7952d953850d973b892/.github/workflows/test_and_deploy.yml#L69-L76), scheduled failures of this workflow send a notification to a specific channel of the NIU slack. The `SLACK_NOTIFYBOT_URL` has already been stored as an org-wide secret.

I also considered configuring this for some of our other workflows, but I decided against it for now. Here's my thinking:

- `test_and_deploy.yml` and `docs_build_and_deploy.yml` run on every push, PR and merge. Given how actively `movement` is being developed, these run multiple times a day and we don't do scheduled runs for them.
- `update_contributors_list.yml`: this is a workflow that open a PR. If the CI on the PR fails, we get notified by github and we deal with it. In principle this could fail in a way that no PR appears (which would be silent). This hasn't happened yet, but it could be worth adding the same job here to catch it. That said, failure here is unlikely, and not critical, so I've left it out for now.

## References

N/A

## How has this PR been tested?

The notification only fires for scheduled runs, so a manual run wouldn't test it.
I briefly removed the `github.event_name == 'schedule'` condition and made it fail on purpose.
This test was fruitful, as I discovered that I had not configured the secret correctly.
I fixed that and managed to get a notification through on slack 🎉 
I've reverted these temporary test changes.

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

No. The workflow is self-documenting.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality
- [ ] The documentation has been updated to reflect any changes
- [x] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6d2333b990c5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.