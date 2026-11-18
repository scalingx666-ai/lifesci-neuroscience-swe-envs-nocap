# Issue

**Title:** chore(ci): Isolate permissions in pixi lock update

## Description

`pull_request_target` is generally considered insecure. I had initially thought that our usage was safe, since it would only push to an attacker's PR and we would see the results. However, because `pixi lock` ends up building the package, adding a build-time dependency that executes code that pushes back to the repository would be a feasible attack. An attacker could theoretically push a tag that does not show up in the `master` history that CircleCI would then publish to DockerHub.

This PR splits the `pixi lock` check into a permissionless one that uploads an artifact. When this workflow fails (the lock changes), the second workflow reviews the commit to ensure that it only touches `pixi.lock` and pushes the commit to the incoming PR.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ed2cfb61d1f5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.