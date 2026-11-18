# Issue

**Title:** Bump github/codeql-action from 4.37.9 to 4.38.0

## Description

Bumps [github/codeql-action](https://github.com/github/codeql-action) from 4.37.9 to 4.38.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/releases">github/codeql-action's releases</a>.</em></p>
<blockquote>
<h2>v4.38.0</h2>
<ul>
<li>On GitHub-hosted runners, the CodeQL Action now deletes unused CodeQL bundles from the toolcache before downloading a different bundle, which frees up disk space for the analysis. We expect to roll this change out to everyone in September. <a href="">#4124</a></li>
<li>The CodeQL Action now supports CodeQL releases that are compatible with Linux Arm64 and downloads the native <code>linux-arm64</code> CodeQL bundle when available. <a href="">#4072</a></li>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.27.0">2.27.0</a>. <a href="">#4129</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/blob/main/CHANGELOG.md">github/codeql-action's changelog</a>.</em></p>
<blockquote>
<h2>4.38.0 - 09 Sept 2026</h2>
<ul>
<li>On GitHub-hosted runners, the CodeQL Action now deletes unused CodeQL bundles from the toolcache before downloading a different bundle, which frees up disk space for the analysis. We expect to roll this change out to everyone in September. <a href="">#4124</a></li>
<li>The CodeQL Action now supports CodeQL releases that are compatible with Linux Arm64 and downloads the native <code>linux-arm64</code> CodeQL bundle when available. <a href="">#4072</a></li>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.27.0">2.27.0</a>. <a href="">#4129</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b96794f</code></a> Merge pull request <a href="">#4131</a> from github/update-v4.38.0-7e08580a9</li>
<li><a href=""><code>02d5093</code></a> Update changelog for v4.38.0</li>
<li><a href=""><code>7e08580</code></a> Merge pull request <a href="">#4130</a> from github/henrymercer/workflow-runner-sizing</li>
<li><a href=""><code>bfcc52b</code></a> Run slow macOS checks on larger runners</li>
<li><a href=""><code>8c251e7</code></a> Merge pull request <a href="">#4129</a> from github/update-bundle/codeql-bundle-v2.27.0</li>
<li><a href=""><code>0b7ca40</code></a> Add changelog note</li>
<li><a href=""><code>40484b3</code></a> Update default bundle to codeql-bundle-v2.27.0</li>
<li><a href=""><code>977e6ce</code></a> Merge pull request <a href="">#4124</a> from github/henrymercer/toolcache-bundle-cleanup</li>
<li><a href=""><code>40a6b38</code></a> Address toolcache cleanup review feedback</li>
<li><a href=""><code>deece8f</code></a> Apply suggestion from <a href="https://github.com/henrymercer"><code>@​henrymercer</code></a></li>
<li>Additional commits viewable in <a href="https://github.com/github/codeql-action/compare/v4.37.9...v4.38.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=github/codeql-action&package-manager=github_actions&previous-version=4.37.9&new-version=4.38.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `318ef9e63a2a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.