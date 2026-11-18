# Issue

**Title:** Bump gittools/actions from 3 to 4

## Description

Bumps [gittools/actions](https://github.com/gittools/actions) from 3 to 4.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/gittools/actions/releases">gittools/actions's releases</a>.</em></p>
<blockquote>
<h2>v4.0.0</h2>
<p>As part of this release we had <a href="https://github.com/GitTools/actions/compare/v3.2.1...v4.0.0">168 commits</a> which resulted in <a href="https://github.com/GitTools/actions/milestone/25?closed=1">10 issues</a> being closed.</p>
<p><strong>Breaking changes</strong></p>
<ul>
<li>[<strong><a href="">#1353</a></strong>](<a href="">GitTools/actions#1353</a>) [ISSUE]: GitVersion.yml config file not detected</li>
<li>[<strong><a href="">#1357</a></strong>](<a href="">GitTools/actions#1357</a>) [ISSUE]: Upgrade AzureDevops minimal agent version</li>
<li><a href=""><strong>!1388</strong></a> GitReleaseManager repository and owner input</li>
<li>[<strong><a href="">#1396</a></strong>](<a href="">GitTools/actions#1396</a>) [ISSUE]: Preserve only the &quot;_&quot; separated version and output variables to be in line with the GitHub actions and the GitVersion.Tool</li>
<li>[<strong><a href="">#1495</a></strong>](<a href="">GitTools/actions#1495</a>) [ISSUE]: Fix Azure Pipeline task build warning</li>
</ul>
<p><strong>Bugs</strong></p>
<ul>
<li>[<strong><a href="">#1434</a></strong>](<a href="">GitTools/actions#1434</a>) [ISSUE]: Allow customization of version variable set in $(Build.BuildNumber) for Azure DevOps GitVersion task</li>
<li>[<strong><a href="">#1493</a></strong>](<a href="">GitTools/actions#1493</a>) [ISSUE]: Azure DevOps Release pipeline throws the error on GitVersion updatebuildnumber</li>
</ul>
<p><strong>Documentation</strong></p>
<ul>
<li>[<strong><a href="">#1402</a></strong>](<a href="">GitTools/actions#1402</a>) [DOCS]: Update docs and <code>versions.md</code> to use v4 and GitVersion.Tool v6.1.x</li>
</ul>
<p><strong>Improvements</strong></p>
<ul>
<li><a href=""><strong>!1627</strong></a> Potential fix for code scanning alert no. 11: Incomplete string escaping or encoding</li>
<li>[<strong><a href="">#1659</a></strong>](<a href="">GitTools/actions#1659</a>) [ISSUE]: Unable to fetch GitVersion.Tool</li>
</ul>
<h3>SHA256 Hashes of the release artifacts</h3>
<ul>
<li><code>1ee9cc45adbd18a72f67cff6789bb9a7cc6b5a1aba2ad9b703df959ee316ec46	- gittools.gittools-4.0.0.25063007.vsix</code></li>
</ul>
<h2>v3.2.1</h2>
<p>As part of this release we had <a href="https://github.com/GitTools/actions/compare/v3.2.0...v3.2.1">50 commits</a> which resulted in <a href="https://github.com/GitTools/actions/milestone/24?closed=1">1 issue</a> being closed.</p>
<p><strong>Improvements</strong></p>
<ul>
<li><a href=""><strong>!1586</strong></a> updates GitVersion and GitReleaseManager versions</li>
</ul>
<h3>SHA256 Hashes of the release artifacts</h3>
<ul>
<li><code>1d446034a454176807f7c3846983ec4b8a4efef0e2e10cabef19f7ea1f428e33	- gittools.gittools-3.2.1.25042514.vsix</code></li>
</ul>
<h2>v3.2.0</h2>
<p>As part of this release we had <a href="https://github.com/GitTools/actions/compare/v3.1.11...v3.2.0">147 commits</a> which resulted in <a href="https://github.com/GitTools/actions/milestone/23?closed=1">6 issues</a> being closed.</p>
<p><strong>Bugs</strong></p>
<ul>
<li>[<strong><a href="">#1400</a></strong>](<a href="">GitTools/actions#1400</a>) [ISSUE]: Azure DevOps task v3.1.1 fails with 'Overwriting readonly variable is not permitted'</li>
<li>[<strong><a href="">#1515</a></strong>](<a href="">GitTools/actions#1515</a>) [ISSUE]: gitVersion execute task not immediately available after gitVersion setup task</li>
<li><a href=""><strong>!1554</strong></a> Normalizes target path in dotnet tool</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>81f0bc4</code></a> dist update</li>
<li><a href=""><code>5eb6c7e</code></a> Merge pull request <a href="">#1664</a> from IdsTeepe/feat/dotnet-based-nuget-query</li>
<li><a href=""><code>e38db95</code></a> Query all enabled sources</li>
<li><a href=""><code>66027dc</code></a> Move builder to separate variable</li>
<li><a href=""><code>1891d98</code></a> Chore: Tiny comment, better variable naming.</li>
<li><a href=""><code>93ee926</code></a> Feat: Dynamically get query service from nuget package source</li>
<li><a href=""><code>2169f9f</code></a> Merge pull request <a href="">#1661</a> from GitTools/dependabot/npm_and_yarn/eslint-c11f433916</li>
<li><a href=""><code>efeecdc</code></a> (npm): Bump eslint-plugin-prettier in the eslint group</li>
<li><a href=""><code>7124bde</code></a> Merge pull request <a href="">#1662</a> from GitTools/dependabot/npm_and_yarn/types-a55ad1e45f</li>
<li><a href=""><code>b43ed1a</code></a> (npm): Bump <code>@​types/node</code> from 24.0.3 to 24.0.4 in the types group</li>
<li>Additional commits viewable in <a href="https://github.com/gittools/actions/compare/v3...v4">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=gittools/actions&package-manager=github_actions&previous-version=3&new-version=4)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7f21582008e2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.