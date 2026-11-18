# Issue

**Title:** Maintenance: pin GitHub Actions to commit SHAs and add Dependabot

## Description

Supersedes #139, which proposed the same idea but mapped both `matlab-actions/setup-matlab@v1` and `@v2` to the same SHA, silently upgrading the legacy jobs to v2.7.0. See the note at the end.

## Why

Every action reference floated on a major tag. That absorbs patches silently but never crosses a major, so the repo drifted:

| action | was | now |
| --- | --- | --- |
| `actions/download-artifact` | v4 | **v8.0.1** |
| `actions/checkout` | v4 | **v7.0.1** |
| `actions/upload-artifact` | v4 | **v7.0.1** |
| `actions/cache` | v4 | **v6.1.0** |
| `matlab-actions/setup-matlab` | v2 | **v3.0.2** |
| `matlab-actions/run-command` | v2 | **v3.2.1** |
| `softprops/action-gh-release` | v2 | **v3.0.2** |
| `peter-evans/repository-dispatch` | v3 | **v4.0.1** |
| `peter-evans/create-pull-request` | v7 | **v8.1.1** |
| `contributor-assistant/github-action` | v2.6.1 | v2.6.1, already current |

The Node 20 deprecation warnings in the workflow logs are this bill coming due. The v4 actions target a runtime GitHub is removing, and when it goes they break together.

Tags are also mutable. A compromised action repository can repoint one at malicious code, which is how CVE-2025-30066 reached roughly 23000 repositories in March 2025: every version tag was moved, so pinning `@v44.5.1` gave no protection and only SHA pins were unaffected. `sync-fieldtrip.yml` already pinned `create-pull-request` by SHA with the comment "hash for safety, since we use a PAT_TOKEN", so this extends practice the repo had already adopted for its highest risk case.

## What changed

50 references across all 7 workflows, each pinned to a SHA with the version in a trailing comment so the file stays readable:

```yaml
uses: actions/checkout@3d3c42e5aac5ba805825da76410c181273ba90b1 # v7.0.1
```

`matlab-actions` stays on v1 where the older MATLAB releases need it, pinned separately from the v3 references:

```yaml
uses: matlab-actions/setup-matlab@e6b241a42928104e9e489fcc63aa2915df01565f # v1.2.5, kept for the older MATLAB releases
uses: matlab-actions/setup-matlab@2323adb8243827ea460b0def4c413545aaec46a9 # v3.0.2
```

`.github/dependabot.yml` adds one grouped pull request per month. Pinning without it would be a downgrade: the repo would freeze on this snapshot and stop receiving security patches entirely.

Four actions are excluded from Dependabot and reviewed by hand instead, roughly once a year:

| excluded | why |
| --- | --- |
| `matlab-actions/setup-matlab`, `matlab-actions/run-command` | Dependabot treats an action as one dependency, so it cannot leave the v1 pins alone while updating the v3 ones. Every monthly pull request would carry a hunk needing a judgement call, which is the kind of review that eventually gets rubber stamped. |
| `peter-evans/repository-dispatch`, `softprops/action-gh-release` | used only in `release.yml`, which no pull request triggers, so a green run says nothing about them and a bad version would first surface during a release. |

What remains should merge without thought, which is the point. Of the six actions Dependabot still manages, four are exercised directly by a pull request; the other two, `actions/download-artifact` and `peter-evans/create-pull-request`, are exercised daily by `test_container.yml` and `sync-fieldtrip.yml`, so a bad version shows up within a day rather than at a release.

## Breaking changes checked

Almost every major crossed is a Node 20 to Node 24 runtime move with no behavioural change. The three that were not:

* **`download-artifact` v5** changed path handling for downloads **by ID**. This repo downloads by `name` and `pattern` only, so it is unaffected.
* **`checkout` v7** blocks fork PR checkout under `pull_request_target` and `workflow_run`. The only `pull_request_target` workflow is `cla.yml`, which checks out nothing.
* **`upload-artifact` v7** adds an opt-in `archive: false` for direct uploads; the default is unchanged.

All twelve SHAs were resolved against the official repositories and confirmed to carry the stated release tag.

## Note on #139

#139 proposed the same pinning, but mapped both `matlab-actions/setup-matlab@v1` and `@v2` to `aa8bbc7b…`, which is tagged v2.7.0. Real `v1` is `e6b241a4…`. That would have silently moved the four legacy jobs to v2, and since `setup-matlab@v1` on Linux installs a broader product set than v2, those are exactly the jobs whose toolbox availability differs. #139 also omitted version comments. Worth closing with thanks, since the underlying finding was sound.

The companion PRs #140, #141 and #142 replace long-lived PATs with GitHub App tokens. That idea is good, but they reference `vars.APP_ID` and `secrets.APP_PRIVATE_KEY`, neither of which exists in this repository, and the token step carries no `if:` guard while the step it feeds does. They need the App created first and the guards fixed, so they are not addressed here.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a883da142e3b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.