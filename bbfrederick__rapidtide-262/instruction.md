# Issue

**Title:** Bump gittools/actions from 4.4.2 to 4.5.0

## Description

Bumps [gittools/actions](https://github.com/gittools/actions) from 4.4.2 to 4.5.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/gittools/actions/releases">gittools/actions's releases</a>.</em></p>
<blockquote>
<h2>v4.5.0</h2>
<p>As part of this release we had <a href="https://github.com/GitTools/actions/compare/v4.4.2...v4.5.0">75 commits</a> which resulted in <a href="https://github.com/GitTools/actions/milestone/36?closed=1">3 issues</a> being closed.</p>
<p><strong>Features</strong></p>
<ul>
<li>[<strong><a href="">#1936</a></strong>](<a href="">GitTools/actions#1936</a>) [ISSUE]: Add /updatewixversionfile to Azure DevOps task</li>
</ul>
<p><strong>Improvements</strong></p>
<ul>
<li>[<strong><a href="">#1932</a></strong>](<a href="">GitTools/actions#1932</a>) [ISSUE]: Better error handling in Azure</li>
<li>[<strong><a href="">#2010</a></strong>](<a href="">GitTools/actions#2010</a>) Improve CI/CD consistency and refresh published workflow examples</li>
</ul>
<h3>SHA256 Hashes of the release artifacts</h3>
<ul>
<li><code>ae208cf21cd3506d486516e2b977bc4e5b325fa649bef036e04131eafc1471e1	- gittools.gittools-4.5.0.260407213.vsix</code></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>bc6623a</code></a> ci(github): add delay before triggering update examples</li>
<li><a href=""><code>ace732b</code></a> feat(github): add workflow automation prompts and git-commit skill</li>
<li><a href=""><code>462062f</code></a> Merge pull request <a href="">#2031</a> from GitTools/dependabot/github_actions/gittools/cicd-2</li>
<li><a href=""><code>cd5bba8</code></a> (github-actions): Bump gittools/cicd from 1 to 2</li>
<li><a href=""><code>300b335</code></a> Merge pull request <a href="">#2030</a> from GitTools/dependabot/npm_and_yarn/vite-3932ebd7b6</li>
<li><a href=""><code>e99f495</code></a> (npm): Bump vite from 8.0.6 to 8.0.7 in the vite group</li>
<li><a href=""><code>081cd6f</code></a> dist update</li>
<li><a href=""><code>cc3b3f3</code></a> Merge pull request <a href="">#1994</a> from GitTools/dependabot/npm_and_yarn/vite-555ff24f4a</li>
<li><a href=""><code>ce57e8e</code></a> build(vite): migrate to oxc and native tsconfig path resolution</li>
<li><a href=""><code>e600a39</code></a> (npm): Bump the vite group across 1 directory with 3 updates</li>
<li>Additional commits viewable in <a href="https://github.com/gittools/actions/compare/v4.4.2...v4.5.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=gittools/actions&package-manager=github_actions&previous-version=4.4.2&new-version=4.5.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bb6c040a9474`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.