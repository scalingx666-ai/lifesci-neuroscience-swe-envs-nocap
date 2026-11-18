# Issue

**Title:** COMP: Bump github/codeql-action/upload-sarif from 4.36.2 to 4.36.3

## Description

Bumps [github/codeql-action/upload-sarif](https://github.com/github/codeql-action) from 4.36.2 to 4.36.3.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/releases">github/codeql-action/upload-sarif's releases</a>.</em></p>
<blockquote>
<h2>v4.36.3</h2>
<p>No user facing changes.</p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/blob/main/CHANGELOG.md">github/codeql-action/upload-sarif's changelog</a>.</em></p>
<blockquote>
<h1>CodeQL Action Changelog</h1>
<p>See the <a href="https://github.com/github/codeql-action/releases">releases page</a> for the relevant changes to the CodeQL CLI and language packs.</p>
<h2>[UNRELEASED]</h2>
<p>No user facing changes.</p>
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
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.25.3">2.25.3</a>. <a href="">#3865</a></li>
</ul>
<h2>4.35.2 - 15 Apr 2026</h2>
<ul>
<li>The undocumented TRAP cache cleanup feature that could be enabled using the <code>CODEQL_ACTION_CLEANUP_TRAP_CACHES</code> environment variable is deprecated and will be removed in May 2026. If you are affected by this, we recommend disabling TRAP caching by passing the <code>trap-caching: false</code> input to the <code>init</code> Action. <a href="">#3795</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>54f647b</code></a> Merge pull request <a href="">#3984</a> from github/update-v4.36.3-1f34ec164</li>
<li><a href=""><code>e78819e</code></a> Trigger checks</li>
<li><a href=""><code>2c9d3d6</code></a> Update changelog for v4.36.3</li>
<li><a href=""><code>1f34ec1</code></a> Merge pull request <a href="">#3983</a> from github/mbg/repo-props/ff-for-config-file-prop</li>
<li><a href=""><code>d5f0145</code></a> Log when repository property has a value but is ignored</li>
<li><a href=""><code>f27f563</code></a> Add test for when the FF is off</li>
<li><a href=""><code>0025d0f</code></a> Use FF</li>
<li><a href=""><code>f7fa18f</code></a> Add FF for config file repo property</li>
<li><a href=""><code>628fc3f</code></a> Merge pull request <a href="">#3979</a> from github/henrymercer/overlay-db-cleanup-size-tele...</li>
<li><a href=""><code>9cfb67b</code></a> Add clarifying comments</li>
<li>Additional commits viewable in <a href="https://github.com/github/codeql-action/compare/8aad20d150bbac5944a9f9d289da16a4b0d87c1e...54f647b7e1bb85c95cddabcd46b0c578ec92bc1a">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=github/codeql-action/upload-sarif&package-manager=github_actions&previous-version=4.36.2&new-version=4.36.3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `92ffd178ef44`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.