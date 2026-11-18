# Issue

**Title:** Bump gittools/actions from 4.3.3 to 4.4.1

## Description

Bumps [gittools/actions](https://github.com/gittools/actions) from 4.3.3 to 4.4.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/gittools/actions/releases">gittools/actions's releases</a>.</em></p>
<blockquote>
<h2>v4.4.1</h2>
<p>As part of this release we had <a href="https://github.com/GitTools/actions/compare/v4.4.0...v4.4.1">4 commits</a> which resulted in <a href="https://github.com/GitTools/actions/milestone/34?closed=1">1 issue</a> being closed.</p>
<p><strong>Bug</strong></p>
<ul>
<li>[<strong><a href="">#2001</a></strong>](<a href="">GitTools/actions#2001</a>) [Bug]: Updating the versions in docs and workflows on new release</li>
</ul>
<h3>SHA256 Hashes of the release artifacts</h3>
<ul>
<li><code>c8c9754a01a5c4de9def15f1012776d9a42cd904d5c1119ebe169bc88eb9e69b	- gittools.gittools-4.4.1.260316032.vsix</code></li>
</ul>
<h2>v4.4.0</h2>
<p>As part of this release we had <a href="https://github.com/GitTools/actions/compare/v4.3.3...v4.4.0">49 commits</a> which resulted in <a href="https://github.com/GitTools/actions/milestone/33?closed=1">2 issues</a> being closed.</p>
<p><strong>Bug</strong></p>
<ul>
<li>[<strong><a href="">#1912</a></strong>](<a href="">GitTools/actions#1912</a>) [ISSUE]: gitversion-execute@4.2.0 fails on Windows (with self hosted agent?)</li>
</ul>
<p><strong>Improvements</strong></p>
<ul>
<li>[<strong><a href="">#1992</a></strong>](<a href="">GitTools/actions#1992</a>) [ISSUE]: NodeJS20 will be deprecated in Github ACtions</li>
</ul>
<h3>SHA256 Hashes of the release artifacts</h3>
<ul>
<li><code>a9c2459127afc0451fb36b38a68d9755b212d707218bd5181bdcff531f84975f	- gittools.gittools-4.4.0.260316014.vsix</code></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>63daa16</code></a> Merge pull request <a href="">#2002</a> from GitTools/fix/update-version</li>
<li><a href=""><code>d8a3bc7</code></a> ci(versioning): Enhance GitVersion update logic in workflows</li>
<li><a href=""><code>a7cf940</code></a> ci(examples-version): Use service account for checkout and enhance logging</li>
<li><a href=""><code>153a67d</code></a> update examples version to 4.4.0</li>
<li><a href=""><code>639a719</code></a> refactor(node): Use node: protocol for built-in module imports</li>
<li><a href=""><code>5ee1a94</code></a> dist update</li>
<li><a href=""><code>aa5b939</code></a> Merge pull request <a href="">#1988</a> from denisbredikhin/exec-fix</li>
<li><a href=""><code>015244e</code></a> Formatting</li>
<li><a href=""><code>6348cc8</code></a> Formatting</li>
<li><a href=""><code>6c14082</code></a> Update src/agents/common/build-agent.ts</li>
<li>Additional commits viewable in <a href="https://github.com/gittools/actions/compare/v4.3.3...v4.4.1">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=gittools/actions&package-manager=github_actions&previous-version=4.3.3&new-version=4.4.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f8a67c8418f3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.