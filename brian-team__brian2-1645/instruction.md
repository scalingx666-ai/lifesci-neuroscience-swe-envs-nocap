# Issue

**Title:** Bump github/codeql-action from 3.28.17 to 3.29.0

## Description

Bumps [github/codeql-action](https://github.com/github/codeql-action) from 3.28.17 to 3.29.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/releases">github/codeql-action's releases</a>.</em></p>
<blockquote>
<h2>v3.29.0</h2>
<h1>CodeQL Action Changelog</h1>
<p>See the <a href="https://github.com/github/codeql-action/releases">releases page</a> for the relevant changes to the CodeQL CLI and language packs.</p>
<h2>3.29.0 - 11 Jun 2025</h2>
<ul>
<li>Update default CodeQL bundle version to 2.22.0. <a href="">#2925</a></li>
<li>Bump minimum CodeQL bundle version to 2.16.6. <a href="">#2912</a></li>
</ul>
<p>See the full <a href="https://github.com/github/codeql-action/blob/v3.29.0/CHANGELOG.md">CHANGELOG.md</a> for more information.</p>
<h2>v3.28.19</h2>
<h1>CodeQL Action Changelog</h1>
<p>See the <a href="https://github.com/github/codeql-action/releases">releases page</a> for the relevant changes to the CodeQL CLI and language packs.</p>
<h2>3.28.19 - 03 Jun 2025</h2>
<ul>
<li>The CodeQL Action no longer includes its own copy of the extractor for the <code>actions</code> language, which is currently in public preview.
The <code>actions</code> extractor has been included in the CodeQL CLI since v2.20.6. If your workflow has enabled the <code>actions</code> language <em>and</em> you have pinned
your <code>tools:</code> property to a specific version of the CodeQL CLI earlier than v2.20.6, you will need to update to at least CodeQL v2.20.6 or disable
<code>actions</code> analysis.</li>
<li>Update default CodeQL bundle version to 2.21.4. <a href="">#2910</a></li>
</ul>
<p>See the full <a href="https://github.com/github/codeql-action/blob/v3.28.19/CHANGELOG.md">CHANGELOG.md</a> for more information.</p>
<h2>v3.28.18</h2>
<h1>CodeQL Action Changelog</h1>
<p>See the <a href="https://github.com/github/codeql-action/releases">releases page</a> for the relevant changes to the CodeQL CLI and language packs.</p>
<h2>3.28.18 - 16 May 2025</h2>
<ul>
<li>Update default CodeQL bundle version to 2.21.3. <a href="">#2893</a></li>
<li>Skip validating SARIF produced by CodeQL for improved performance. <a href="">#2894</a></li>
<li>The number of threads and amount of RAM used by CodeQL can now be set via the <code>CODEQL_THREADS</code> and <code>CODEQL_RAM</code> runner environment variables. If set, these environment variables override the <code>threads</code> and <code>ram</code> inputs respectively. <a href="">#2891</a></li>
</ul>
<p>See the full <a href="https://github.com/github/codeql-action/blob/v3.28.18/CHANGELOG.md">CHANGELOG.md</a> for more information.</p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/blob/main/CHANGELOG.md">github/codeql-action's changelog</a>.</em></p>
<blockquote>
<h1>CodeQL Action Changelog</h1>
<p>See the <a href="https://github.com/github/codeql-action/releases">releases page</a> for the relevant changes to the CodeQL CLI and language packs.</p>
<h2>[UNRELEASED]</h2>
<p>No user facing changes.</p>
<h2>3.29.0 - 11 Jun 2025</h2>
<ul>
<li>Update default CodeQL bundle version to 2.22.0. <a href="">#2925</a></li>
<li>Bump minimum CodeQL bundle version to 2.16.6. <a href="">#2912</a></li>
</ul>
<h2>3.28.19 - 03 Jun 2025</h2>
<ul>
<li>The CodeQL Action no longer includes its own copy of the extractor for the <code>actions</code> language, which is currently in public preview.
The <code>actions</code> extractor has been included in the CodeQL CLI since v2.20.6. If your workflow has enabled the <code>actions</code> language <em>and</em> you have pinned
your <code>tools:</code> property to a specific version of the CodeQL CLI earlier than v2.20.6, you will need to update to at least CodeQL v2.20.6 or disable
<code>actions</code> analysis.</li>
<li>Update default CodeQL bundle version to 2.21.4. <a href="">#2910</a></li>
</ul>
<h2>3.28.18 - 16 May 2025</h2>
<ul>
<li>Update default CodeQL bundle version to 2.21.3. <a href="">#2893</a></li>
<li>Skip validating SARIF produced by CodeQL for improved performance. <a href="">#2894</a></li>
<li>The number of threads and amount of RAM used by CodeQL can now be set via the <code>CODEQL_THREADS</code> and <code>CODEQL_RAM</code> runner environment variables. If set, these environment variables override the <code>threads</code> and <code>ram</code> inputs respectively. <a href="">#2891</a></li>
</ul>
<h2>3.28.17 - 02 May 2025</h2>
<ul>
<li>Update default CodeQL bundle version to 2.21.2. <a href="">#2872</a></li>
</ul>
<h2>3.28.16 - 23 Apr 2025</h2>
<ul>
<li>Update default CodeQL bundle version to 2.21.1. <a href="">#2863</a></li>
</ul>
<h2>3.28.15 - 07 Apr 2025</h2>
<ul>
<li>Fix bug where the action would fail if it tried to produce a debug artifact with more than 65535 files. <a href="">#2842</a></li>
</ul>
<h2>3.28.14 - 07 Apr 2025</h2>
<ul>
<li>Update default CodeQL bundle version to 2.21.0. <a href="">#2838</a></li>
</ul>
<h2>3.28.13 - 24 Mar 2025</h2>
<p>No user facing changes.</p>
<h2>3.28.12 - 19 Mar 2025</h2>
<ul>
<li>Dependency caching should now cache more dependencies for Java <code>build-mode: none</code> extractions. This should speed up workflows and avoid inconsistent alerts in some cases.</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>ce28f5b</code></a> Merge pull request <a href="">#2926</a> from github/update-v3.29.0-e8799281c</li>
<li><a href=""><code>bc251b7</code></a> Update changelog for v3.29.0</li>
<li><a href=""><code>e879928</code></a> Merge pull request <a href="">#2925</a> from github/update-bundle/codeql-bundle-v2.22.0</li>
<li><a href=""><code>efd43b3</code></a> Merge branch 'main' into update-bundle/codeql-bundle-v2.22.0</li>
<li><a href=""><code>7cb9b16</code></a> Merge pull request <a href="">#2912</a> from github/henrymercer/bump-minimum-codeql-2.16.6</li>
<li><a href=""><code>3855117</code></a> Add changelog note</li>
<li><a href=""><code>f5d4e2a</code></a> Update default bundle to codeql-bundle-v2.22.0</li>
<li><a href=""><code>22deae8</code></a> Update package-lock.json</li>
<li><a href=""><code>df2a830</code></a> Merge branch 'main' into henrymercer/bump-minimum-codeql-2.16.6</li>
<li><a href=""><code>b1e4dc3</code></a> Merge pull request <a href="">#2916</a> from github/dependabot/npm_and_yarn/npm-5cdccdc43f</li>
<li>Additional commits viewable in <a href="https://github.com/github/codeql-action/compare/60168efe1c415ce0f5521ea06d5c2062adbeed1b...ce28f5bb42b7a9f2c824e633a3f6ee835bab6858">compare view</a></li>
</ul>
</details>
<br />

<details>
<summary>Most Recent Ignore Conditions Applied to This Pull Request</summary>

| Dependency Name | Ignore Conditions |
| --- | --- |
| github/codeql-action | [< 3.29, > 3.28.17] |
</details>

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=github/codeql-action&package-manager=github_actions&previous-version=3.28.17&new-version=3.29.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `54e782609e7b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.