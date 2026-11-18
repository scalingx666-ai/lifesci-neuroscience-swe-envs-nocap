# Issue

**Title:** Bump matlab-actions/run-command from 2.3.0 to 2.4.0

## Description

Bumps [matlab-actions/run-command](https://github.com/matlab-actions/run-command) from 2.3.0 to 2.4.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/matlab-actions/run-command/releases">matlab-actions/run-command's releases</a>.</em></p>
<blockquote>
<h2>v2.4.0</h2>
<h3>Features</h3>
<ul>
<li>If you have a MATLAB Test™ license, you can view your MATLAB and Simulink test results in your GitHub job summary. For more information, see <a href="https://github.com/matlab-actions/run-tests/blob/main/README.md#view-test-results">View Test Results</a>.</li>
<li>You can view your MATLAB buildtool task results in your GitHub job summary.</li>
</ul>
<h3>Maintenance</h3>
<ul>
<li>This release moves utilities to <a href="https://github.com/matlab-actions/common-utils">common-utils</a>.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>8a0be7d</code></a> Build for 07838b9</li>
<li><a href=""><code>07838b9</code></a> [skip ci] Bump v2.4.0</li>
<li><a href=""><code>59fe8ed</code></a> Refactor code and add support for test, build results summary and logs groupi...</li>
<li><a href=""><code>b4cb80d</code></a> Bump glob from 10.4.5 to 10.5.0 (<a href="">#83</a>)</li>
<li><a href=""><code>5f6677f</code></a> Bump js-yaml from 3.14.1 to 3.14.2 (<a href="">#82</a>)</li>
<li><a href=""><code>44b566a</code></a> Update actions workflows (<a href="">#80</a>)</li>
<li>See full diff in <a href="https://github.com/matlab-actions/run-command/compare/v2.3.0...v2.4.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=matlab-actions/run-command&package-manager=github_actions&previous-version=2.3.0&new-version=2.4.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot merge` will merge this PR after your CI passes on it
- `@dependabot squash and merge` will squash and merge this PR after your CI passes on it
- `@dependabot cancel merge` will cancel a previously requested merge and block automerging
- `@dependabot reopen` will reopen this PR if it is closed
- `@dependabot close` will close this PR and stop Dependabot recreating it. You can achieve the same result by closing it manually
- `@dependabot show <dependency name> ignore conditions` will show all of the ignore conditions of the specified dependency
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f025d6b5f1d1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.