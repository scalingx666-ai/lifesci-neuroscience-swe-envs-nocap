# Issue

**Title:** Only autodeploy on CI completion if the run is for the current PR head

## Description

### Summary
When CI completes on a push, the autodeploy trigger deployed regardless of whether the run's commit was still the PR head. That broke the GitHub deployment display on #10354:

- Two commits were pushed 16s apart (`0c948d9f`, then head `de851b7d`). Their CI runs finished out of order, and the older one was later re-run.
- Each completion triggered an autodeploy. The last one created a GitHub deployment on the old commit `0c948d9f`. Because of `override: true`, it marked the head commit's deployment as inactive.
- As a result, the PR showed the head deployment as "Destroyed" and the merge box said "No deployments", although the instance was up and running the correct commit. Kubernetix only receives the branch name and deploys the newest image.

Now `check-build-smoketest-push-result` fetches the PR's `headRefOid` together with the labels. It skips the deploy if that doesn't match `workflow_run.head_sha`, and also if there is no open PR for the branch. Besides fixing the display, this avoids redundant redeploys from stale runs.

### Steps to test:
- Dry-ran the step's script locally against the current state of #10354:
  - stale commit `0c948d9f` → skipped
  - head `de851b7d` → `enabled=true` with the correct env/url
  - `master` (no PR) → skipped
- After merging: push to an `autodeploy` PR and check that the deployment shows up as active on the PR

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8d87073deab7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.