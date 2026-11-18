# Issue

**Title:** Bump tornado from 6.3.1 to 6.3.2

## Description

Bumps [tornado](https://github.com/tornadoweb/tornado) from 6.3.1 to 6.3.2.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/tornadoweb/tornado/blob/master/docs/releases.rst">tornado's changelog</a>.</em></p>
<blockquote>
<h1>Release notes</h1>
<p>.. toctree::
:maxdepth: 2</p>
<p>releases/v6.3.2
releases/v6.3.1
releases/v6.3.0
releases/v6.2.0
releases/v6.1.0
releases/v6.0.4
releases/v6.0.3
releases/v6.0.2
releases/v6.0.1
releases/v6.0.0
releases/v5.1.1
releases/v5.1.0
releases/v5.0.2
releases/v5.0.1
releases/v5.0.0
releases/v4.5.3
releases/v4.5.2
releases/v4.5.1
releases/v4.5.0
releases/v4.4.3
releases/v4.4.2
releases/v4.4.1
releases/v4.4.0
releases/v4.3.0
releases/v4.2.1
releases/v4.2.0
releases/v4.1.0
releases/v4.0.2
releases/v4.0.1
releases/v4.0.0
releases/v3.2.2
releases/v3.2.1
releases/v3.2.0
releases/v3.1.1
releases/v3.1.0
releases/v3.0.2
releases/v3.0.1
releases/v3.0.0
releases/v2.4.1
releases/v2.4.0
releases/v2.3.0
releases/v2.2.1
releases/v2.2.0
releases/v2.1.1</p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>34f5c1c</code></a> Version 6.3.2</li>
<li><a href=""><code>32ad07c</code></a> web: Fix an open redirect in StaticFileHandler</li>
<li><a href=""><code>e0fa53e</code></a> Merge pull request <a href="">#3257</a> from bdarnell/build-workflow-wstest-warning</li>
<li><a href=""><code>f5a1d5c</code></a> ci: Only run pypi actions from the main repo</li>
<li><a href=""><code>1849ef6</code></a> test: Close a websocket client that causes occasional test failures</li>
<li><a href=""><code>fcb09eb</code></a> Merge pull request <a href="">#3256</a> from bdarnell/build-workflow-qemu</li>
<li><a href=""><code>c3d50f4</code></a> ci: Update setup-qemu-action version</li>
<li>See full diff in <a href="https://github.com/tornadoweb/tornado/compare/v6.3.1...v6.3.2">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=tornado&package-manager=pip&previous-version=6.3.1&new-version=6.3.2)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/BindsNET/bindsnet/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1c48f9dd16aa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.