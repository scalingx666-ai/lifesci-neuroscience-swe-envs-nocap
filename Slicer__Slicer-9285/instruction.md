# Issue

**Title:** COMP: Bump github/codeql-action/upload-sarif from 4.36.3 to 4.37.0

## Description

Bumps [github/codeql-action/upload-sarif](https://github.com/github/codeql-action) from 4.36.3 to 4.37.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/releases">github/codeql-action/upload-sarif's releases</a>.</em></p>
<blockquote>
<h2>v4.37.0</h2>
<ul>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.26.0">2.26.0</a>. <a href="">#3995</a></li>
<li>In addition to the existing input format, the <code>config-file</code> input for the <code>codeql-action/init</code> step will soon support a new <code>[owner/]repo[@ref][:path]</code> format. All components except the repository name are optional. If omitted, <code>owner</code> defaults to the same owner as the repository the analysis is running for, <code>ref</code> to <code>main</code>, and <code>path</code> to <code>.github/codeql-action.yaml</code>. Support for this format ships in this version of the CodeQL Action, but will only be enabled over the coming weeks. <a href="">#3973</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/blob/main/CHANGELOG.md">github/codeql-action/upload-sarif's changelog</a>.</em></p>
<blockquote>
<h1>CodeQL Action Changelog</h1>
<p>See the <a href="https://github.com/github/codeql-action/releases">releases page</a> for the relevant changes to the CodeQL CLI and language packs.</p>
<h2>[UNRELEASED]</h2>
<ul>
<li><em>Upcoming breaking change</em>: Add a deprecation warning for customers using CodeQL version 2.20.6 and earlier. These versions of CodeQL were discontinued on 1 July 2026 alongside GitHub Enterprise Server 3.16, and will be unsupported by the next minor release of the CodeQL Action. <a href="">#3956</a></li>
</ul>
<h2>4.37.0 - 08 Jul 2026</h2>
<ul>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.26.0">2.26.0</a>. <a href="">#3995</a></li>
<li>In addition to the existing input format, the <code>config-file</code> input for the <code>codeql-action/init</code> step will soon support a new <code>[owner/]repo[@ref][:path]</code> format. All components except the repository name are optional. If omitted, <code>owner</code> defaults to the same owner as the repository the analysis is running for, <code>ref</code> to <code>main</code>, and <code>path</code> to <code>.github/codeql-action.yaml</code>. Support for this format ships in this version of the CodeQL Action, but will only be enabled over the coming weeks. <a href="">#3973</a></li>
</ul>
<h2>4.36.3 - 01 Jul 2026</h2>
<p>No user facing changes.</p>
<h2>4.36.2 - 04 Jun 2026</h2>
<ul>
<li>Cache CodeQL CLI version information across Actions steps. <a href="">#3943</a></li>
<li>Reduce requests while waiting for analysis processing by using exponential backoff when polling SARIF processing status. <a href="">#3937</a></li>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.25.6">2.25.6</a>. <a href="">#3948</a></li>
</ul>
<h2>4.36.1 - 02 Jun 2026</h2>
<p>No user facing changes.</p>
<h2>4.36.0 - 22 May 2026</h2>
<ul>
<li><em>Breaking change</em>: Bump the minimum required CodeQL bundle version to 2.19.4. <a href="">#3894</a></li>
<li>Add support for SHA-256 Git object IDs. <a href="">#3893</a></li>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.25.5">2.25.5</a>. <a href="">#3926</a></li>
</ul>
<h2>4.35.5 - 15 May 2026</h2>
<ul>
<li>We have improved how the JavaScript bundles for the CodeQL Action are generated to avoid duplication across bundles and reduce the size of the repository by around 70%. This should have no effect on the runtime behaviour of the CodeQL Action. <a href="">#3899</a></li>
<li>For performance and accuracy reasons, <a href="">improved incremental analysis</a> will now only be enabled on a pull request when diff-informed analysis is also enabled for that run. If diff-informed analysis is unavailable (for example, because the PR diff ranges could not be computed), the action will fall back to a full analysis. <a href="">#3791</a></li>
<li>If multiple inputs are provided for the GitHub-internal <code>analysis-kinds</code> input, only <code>code-scanning</code> will be enabled. The <code>analysis-kinds</code> input is experimental, for GitHub-internal use only, and may change without notice at any time. <a href="">#3892</a></li>
<li>Added an experimental change which, when running a Code Scanning analysis for a PR with <a href="">improved incremental analysis</a> enabled, prefers CodeQL CLI versions that have a cached overlay-base database for the configured languages. This speeds up analysis for a repository when there is not yet a cached overlay-base database for the latest CLI version. We expect to roll this change out to everyone in May. <a href="">#3880</a></li>
</ul>
<h2>4.35.4 - 07 May 2026</h2>
<ul>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.25.4">2.25.4</a>. <a href="">#3881</a></li>
</ul>
<h2>4.35.3 - 01 May 2026</h2>
<ul>
<li><em>Upcoming breaking change</em>: Add a deprecation warning for customers using CodeQL version 2.19.3 and earlier. These versions of CodeQL were discontinued on 9 April 2026 alongside GitHub Enterprise Server 3.15, and will be unsupported by the next minor release of the CodeQL Action. <a href="">#3837</a></li>
<li>Configurations for private registries that use Cloudsmith or GCP OIDC are now accepted. <a href="">#3850</a></li>
<li>Best-effort connection tests for private registries now use <code>GET</code> requests instead of <code>HEAD</code> for better compatibility with various registry implementations. For NuGet feeds, the test is now always performed against the service index. <a href="">#3853</a></li>
<li>Fixed a bug where two diagnostics produced within the same millisecond could overwrite each other on disk, causing one of them to be lost. <a href="">#3852</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>99df26d</code></a> Merge pull request <a href="">#3996</a> from github/update-v4.37.0-c7c896d71</li>
<li><a href=""><code>31c2707</code></a> Add changenote for <a href="">#3973</a></li>
<li><a href=""><code>72df218</code></a> Update changelog for v4.37.0</li>
<li><a href=""><code>c7c896d</code></a> Merge pull request <a href="">#3995</a> from github/update-bundle/codeql-bundle-v2.26.0</li>
<li><a href=""><code>3f34ff0</code></a> Add changelog note</li>
<li><a href=""><code>43bec09</code></a> Update default bundle to codeql-bundle-v2.26.0</li>
<li><a href=""><code>f58f0d1</code></a> Merge pull request <a href="">#3973</a> from github/mbg/repo-props/config-file-shorthands</li>
<li><a href=""><code>7dc37cb</code></a> Merge remote-tracking branch 'origin/main' into mbg/repo-props/config-file-sh...</li>
<li><a href=""><code>8e22350</code></a> Thread <code>ActionState</code> to <code>initConfig</code></li>
<li><a href=""><code>69c9e8c</code></a> Mark some <code>status-report</code> imports as <code>type</code>-only to avoid circular dependencies</li>
<li>Additional commits viewable in <a href="https://github.com/github/codeql-action/compare/54f647b7e1bb85c95cddabcd46b0c578ec92bc1a...99df26d4f13ea111d4ec1a7dddef6063f76b97e9">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=github/codeql-action/upload-sarif&package-manager=github_actions&previous-version=4.36.3&new-version=4.37.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `71545ac02741`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.