# Issue

**Title:** chore(deps): bump ip-address from 10.2.0 to 10.4.0

## Description

Bumps [ip-address](https://github.com/beaugunderson/ip-address) from 10.2.0 to 10.4.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/beaugunderson/ip-address/releases">ip-address's releases</a>.</em></p>
<blockquote>
<h2>v10.4.0</h2>
<h2>What's Changed</h2>
<ul>
<li>Add GitHub Actions CI by <a href="https://github.com/beaugunderson"><code>@​beaugunderson</code></a> in <a href="">beaugunderson/ip-address#213</a></li>
<li>Keep the package loadable on node 12, and enforce it by <a href="https://github.com/beaugunderson"><code>@​beaugunderson</code></a> in <a href="">beaugunderson/ip-address#216</a></li>
<li>Validate the byte arrays Address6 is given by <a href="https://github.com/beaugunderson"><code>@​beaugunderson</code></a> in <a href="">beaugunderson/ip-address#217</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/beaugunderson/ip-address/compare/v10.3.1...v10.4.0">https://github.com/beaugunderson/ip-address/compare/v10.3.1...v10.4.0</a></p>
<h2>v10.3.1</h2>
<p><strong>Full Changelog</strong>: <a href="https://github.com/beaugunderson/ip-address/compare/v10.3.0...v10.3.1">https://github.com/beaugunderson/ip-address/compare/v10.3.0...v10.3.1</a></p>
<h2>v10.3.0</h2>
<p><strong>Full Changelog</strong>: <a href="https://github.com/beaugunderson/ip-address/compare/v10.2.2...v10.3.0">https://github.com/beaugunderson/ip-address/compare/v10.2.2...v10.3.0</a></p>
<h2>v10.2.2</h2>
<p><strong>Full Changelog</strong>: <a href="https://github.com/beaugunderson/ip-address/compare/v10.2.1...v10.2.2">https://github.com/beaugunderson/ip-address/compare/v10.2.1...v10.2.2</a></p>
<h2>v10.2.1</h2>
<p><strong>Full Changelog</strong>: <a href="https://github.com/beaugunderson/ip-address/compare/v10.2.0...v10.2.1">https://github.com/beaugunderson/ip-address/compare/v10.2.0...v10.2.1</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>fbb8db2</code></a> 10.4.0</li>
<li><a href=""><code>45a2b11</code></a> Validate the byte arrays Address6 is given (<a href="">#217</a>)</li>
<li><a href=""><code>bac8810</code></a> Keep the package loadable on node 12, and enforce it (<a href="">#216</a>)</li>
<li><a href=""><code>9b3d848</code></a> Add a security policy and a README section on security posture</li>
<li><a href=""><code>e84a7b3</code></a> Order the README API reference Address4, Address6, AddressError</li>
<li><a href=""><code>015160b</code></a> Collapse each class in the README API reference</li>
<li><a href=""><code>34061a8</code></a> Pin checkout and setup-node to commits in the release job</li>
<li><a href=""><code>c5fae5d</code></a> Pin action-gh-release to a commit and move it to 3.0.2</li>
<li><a href=""><code>e0ef048</code></a> Replace CircleCI with GitHub Actions</li>
<li><a href=""><code>5e3ceb7</code></a> Add GitHub Actions CI across Node 20, 22, 24 and 25 (<a href="">#213</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/beaugunderson/ip-address/compare/v10.2.0...v10.4.0">compare view</a></li>
</ul>
</details>
<details>
<summary>Maintainer changes</summary>
<p>This version was pushed to npm by <a href="https://www.npmjs.com/~GitHub%20Actions">GitHub Actions</a>, a new releaser for ip-address since your current version.</p>
</details>
<details>
<summary>Install script changes</summary>
<p>This version adds <code>prepare</code> script that runs during installation. Review the package contents before updating.</p>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=ip-address&package-manager=npm_and_yarn&previous-version=10.2.0&new-version=10.4.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/NeuroAIHub/BrainPilot/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `59ce2f362280`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.