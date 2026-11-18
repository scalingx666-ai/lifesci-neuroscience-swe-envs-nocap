# Issue

**Title:** Bump github/codeql-action from 3.28.15 to 3.28.17

## Description

Bumps [github/codeql-action](https://github.com/github/codeql-action) from 3.28.15 to 3.28.17.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/releases">github/codeql-action's releases</a>.</em></p>
<blockquote>
<h2>v3.28.17</h2>
<h1>CodeQL Action Changelog</h1>
<p>See the <a href="https://github.com/github/codeql-action/releases">releases page</a> for the relevant changes to the CodeQL CLI and language packs.</p>
<h2>3.28.17 - 02 May 2025</h2>
<ul>
<li>Update default CodeQL bundle version to 2.21.2. <a href="">#2872</a></li>
</ul>
<p>See the full <a href="https://github.com/github/codeql-action/blob/v3.28.17/CHANGELOG.md">CHANGELOG.md</a> for more information.</p>
<h2>v3.28.16</h2>
<h1>CodeQL Action Changelog</h1>
<p>See the <a href="https://github.com/github/codeql-action/releases">releases page</a> for the relevant changes to the CodeQL CLI and language packs.</p>
<h2>3.28.16 - 23 Apr 2025</h2>
<ul>
<li>Update default CodeQL bundle version to 2.21.1. <a href="">#2863</a></li>
</ul>
<p>See the full <a href="https://github.com/github/codeql-action/blob/v3.28.16/CHANGELOG.md">CHANGELOG.md</a> for more information.</p>
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
<li>Update default CodeQL bundle version to 2.20.7. <a href="">#2810</a></li>
</ul>
<h2>3.28.11 - 07 Mar 2025</h2>
<ul>
<li>Update default CodeQL bundle version to 2.20.6. <a href="">#2793</a></li>
</ul>
<h2>3.28.10 - 21 Feb 2025</h2>
<ul>
<li>Update default CodeQL bundle version to 2.20.5. <a href="">#2772</a></li>
<li>Address an issue where the CodeQL Bundle would occasionally fail to decompress on macOS. <a href="">#2768</a></li>
</ul>
<h2>3.28.9 - 07 Feb 2025</h2>
<ul>
<li>Update default CodeQL bundle version to 2.20.4. <a href="">#2753</a></li>
</ul>
<h2>3.28.8 - 29 Jan 2025</h2>
<ul>
<li>Enable support for Kotlin 2.1.10 when running with CodeQL CLI v2.20.3. <a href="">#2744</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>60168ef</code></a> Merge pull request <a href="">#2886</a> from github/update-v3.28.17-97a2bfd2a</li>
<li><a href=""><code>0d5a311</code></a> Update changelog for v3.28.17</li>
<li><a href=""><code>97a2bfd</code></a> Merge pull request <a href="">#2872</a> from github/update-bundle/codeql-bundle-v2.21.2</li>
<li><a href=""><code>9aba20e</code></a> Merge branch 'main' into update-bundle/codeql-bundle-v2.21.2</li>
<li><a href=""><code>81a9508</code></a> Merge pull request <a href="">#2876</a> from github/henrymercer/fix-diff-informed-multiple-a...</li>
<li><a href=""><code>1569f4c</code></a> Disable diff-informed queries in code scanning config tests</li>
<li><a href=""><code>62fbeb6</code></a> Merge branch 'main' into henrymercer/fix-diff-informed-multiple-analyze</li>
<li><a href=""><code>f122d1d</code></a> Address test failures from computing temporary directory too early</li>
<li><a href=""><code>083772a</code></a> Do not fail diff informed analyses when <code>analyze</code> is run twice in the same job</li>
<li><a href=""><code>5db14d0</code></a> Merge branch 'main' into update-bundle/codeql-bundle-v2.21.2</li>
<li>Additional commits viewable in <a href="https://github.com/github/codeql-action/compare/45775bd8235c68ba998cffa5171334d58593da47...60168efe1c415ce0f5521ea06d5c2062adbeed1b">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=github/codeql-action&package-manager=github_actions&previous-version=3.28.15&new-version=3.28.17)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `de316f0c4cae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.