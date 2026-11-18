# Issue

**Title:** Bump pyvista/setup-headless-display-action from 5.1.0 to 5.2.0

## Description

Bumps [pyvista/setup-headless-display-action](https://github.com/pyvista/setup-headless-display-action) from 5.1.0 to 5.2.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pyvista/setup-headless-display-action/releases">pyvista/setup-headless-display-action's releases</a>.</em></p>
<blockquote>
<h2>v5.2.0</h2>
<p>Start Xvfb with <code>-noreset</code> (<a href="">#56</a>), so the reset after the last client leaves no longer drops a client mid-connect.</p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>10e6efb</code></a> Start Xvfb with <code>-noreset</code> (<a href="">#56</a>)</li>
<li>See full diff in <a href="https://github.com/pyvista/setup-headless-display-action/compare/c103a2ff45650d38cb71684b5dc6cdfeb9442c79...10e6efb97af3cd1523828f0e22c39f0e4567f3e4">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pyvista/setup-headless-display-action&package-manager=github_actions&previous-version=5.1.0&new-version=5.2.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

Dependabot will resolve any conflicts with this PR as long as you don't alter it yourself. You can also trigger a rebase manually by commenting `@dependabot rebase`.

[//]: # (dependabot-automerge-start)
[//]: # (dependabot-automerge-end)

---

<details>
<summary>Dependabot commands and options</summary>
<br />

You can trigger Dependabot actions by commenting on this PR:
- `@dependabot rebase` will rebase this PR
- `@dependabot recreate` will recreate this PR, overwriting any edits that have been made to it
- `@dependabot show <dependency name> ignore conditions` will show all of the ignore conditions of the specified dependency
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `10e41aae6eca`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.