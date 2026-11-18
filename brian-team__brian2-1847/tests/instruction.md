# Issue

**Title:** Bump github/codeql-action/upload-sarif from 4.32.4 to 4.36.2

## Description

Bumps [github/codeql-action/upload-sarif](https://github.com/github/codeql-action) from 4.32.4 to 4.36.2.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/releases">github/codeql-action/upload-sarif's releases</a>.</em></p>
<blockquote>
<h2>v4.36.2</h2>
<ul>
<li>Cache CodeQL CLI version information across Actions steps. <a href="">#3943</a></li>
<li>Reduce requests while waiting for analysis processing by using exponential backoff when polling SARIF processing status. <a href="">#3937</a></li>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.25.6">2.25.6</a>. <a href="">#3948</a></li>
</ul>
<h2>v4.36.1</h2>
<p>No user facing changes.</p>
<h2>v4.36.0</h2>
<ul>
<li><em>Breaking change</em>: Bump the minimum required CodeQL bundle version to 2.19.4. <a href="">#3894</a></li>
<li>Add support for SHA-256 Git object IDs. <a href="">#3893</a></li>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.25.5">2.25.5</a>. <a href="">#3926</a></li>
</ul>
<h2>v4.35.5</h2>
<ul>
<li>We have improved how the JavaScript bundles for the CodeQL Action are generated to avoid duplication across bundles and reduce the size of the repository by around 70%. This should have no effect on the runtime behaviour of the CodeQL Action. <a href="">#3899</a></li>
<li>For performance and accuracy reasons, <a href="">improved incremental analysis</a> will now only be enabled on a pull request when diff-informed analysis is also enabled for that run. If diff-informed analysis is unavailable (for example, because the PR diff ranges could not be computed), the action will fall back to a full analysis. <a href="">#3791</a></li>
<li>If multiple inputs are provided for the GitHub-internal <code>analysis-kinds</code> input, only <code>code-scanning</code> will be enabled. The <code>analysis-kinds</code> input is experimental, for GitHub-internal use only, and may change without notice at any time. <a href="">#3892</a></li>
<li>Added an experimental change which, when running a Code Scanning analysis for a PR with <a href="">improved incremental analysis</a> enabled, prefers CodeQL CLI versions that have a cached overlay-base database for the configured languages. This speeds up analysis for a repository when there is not yet a cached overlay-base database for the latest CLI version. We expect to roll this change out to everyone in May. <a href="">#3880</a></li>
</ul>
<h2>v4.35.4</h2>
<ul>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.25.4">2.25.4</a>. <a href="">#3881</a></li>
</ul>
<h2>v4.35.3</h2>
<ul>
<li><em>Upcoming breaking change</em>: Add a deprecation warning for customers using CodeQL version 2.19.3 and earlier. These versions of CodeQL were discontinued on 9 April 2026 alongside GitHub Enterprise Server 3.15, and will be unsupported by the next minor release of the CodeQL Action. <a href="">#3837</a></li>
<li>Configurations for private registries that use Cloudsmith or GCP OIDC are now accepted. <a href="">#3850</a></li>
<li>Best-effort connection tests for private registries now use <code>GET</code> requests instead of <code>HEAD</code> for better compatibility with various registry implementations. For NuGet feeds, the test is now always performed against the service index. <a href="">#3853</a></li>
<li>Fixed a bug where two diagnostics produced within the same millisecond could overwrite each other on disk, causing one of them to be lost. <a href="">#3852</a></li>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.25.3">2.25.3</a>. <a href="">#3865</a></li>
</ul>
<h2>v4.35.2</h2>
<ul>
<li>The undocumented TRAP cache cleanup feature that could be enabled using the <code>CODEQL_ACTION_CLEANUP_TRAP_CACHES</code> environment variable is deprecated and will be removed in May 2026. If you are affected by this, we recommend disabling TRAP caching by passing the <code>trap-caching: false</code> input to the <code>init</code> Action. <a href="">#3795</a></li>
<li>The Git version 2.36.0 requirement for improved incremental analysis now only applies to repositories that contain submodules. <a href="">#3789</a></li>
<li>Python analysis on GHES no longer extracts the standard library, relying instead on models of the standard library. This should result in significantly faster extraction and analysis times, while the effect on alerts should be minimal. <a href="">#3794</a></li>
<li>Fixed a bug in the validation of OIDC configurations for private registries that was added in CodeQL Action 4.33.0 / 3.33.0. <a href="">#3807</a></li>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.25.2">2.25.2</a>. <a href="">#3823</a></li>
</ul>
<h2>v4.35.1</h2>
<ul>
<li>Fix incorrect minimum required Git version for <a href="">improved incremental analysis</a>: it should have been 2.36.0, not 2.11.0. <a href="">#3781</a></li>
</ul>
<h2>v4.35.0</h2>
<ul>
<li>Reduced the minimum Git version required for <a href="">improved incremental analysis</a> from 2.38.0 to 2.11.0. <a href="">#3767</a></li>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.25.1">2.25.1</a>. <a href="">#3773</a></li>
</ul>
<h2>v4.34.1</h2>
<ul>
<li>Downgrade default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.24.3">2.24.3</a> due to issues with a small percentage of Actions and JavaScript analyses. <a href="">#3762</a></li>
</ul>
<h2>v4.34.0</h2>
<ul>
<li>Added an experimental change which disables TRAP caching when <a href="">improved incremental analysis</a> is enabled, since improved incremental analysis supersedes TRAP caching. This will improve performance and reduce Actions cache usage. We expect to roll this change out to everyone in March. <a href="">#3569</a></li>
<li>We are rolling out improved incremental analysis to C/C++ analyses that use build mode <code>none</code>. We expect this rollout to be complete by the end of April 2026. <a href="">#3584</a></li>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.25.0">2.25.0</a>. <a href="">#3585</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/blob/main/CHANGELOG.md">github/codeql-action/upload-sarif's changelog</a>.</em></p>
<blockquote>
<h1>CodeQL Action Changelog</h1>
<p>See the <a href="https://github.com/github/codeql-action/releases">releases page</a> for the relevant changes to the CodeQL CLI and language packs.</p>
<h2>[UNRELEASED]</h2>
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
<li>The Git version 2.36.0 requirement for improved incremental analysis now only applies to repositories that contain submodules. <a href="">#3789</a></li>
<li>Python analysis on GHES no longer extracts the standard library, relying instead on models of the standard library. This should result in significantly faster extraction and analysis times, while the effect on alerts should be minimal. <a href="">#3794</a></li>
<li>Fixed a bug in the validation of OIDC configurations for private registries that was added in CodeQL Action 4.33.0 / 3.33.0. <a href="">#3807</a></li>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.25.2">2.25.2</a>. <a href="">#3823</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>8aad20d</code></a> Merge pull request <a href="">#3949</a> from github/update-v4.36.2-dcb947ce1</li>
<li><a href=""><code>f521b08</code></a> Add additional changelog notes</li>
<li><a href=""><code>8aeff0f</code></a> Update changelog for v4.36.2</li>
<li><a href=""><code>dcb947c</code></a> Merge pull request <a href="">#3948</a> from github/update-bundle/codeql-bundle-v2.25.6</li>
<li><a href=""><code>c251bce</code></a> Add changelog note</li>
<li><a href=""><code>62953c1</code></a> Update default bundle to codeql-bundle-v2.25.6</li>
<li><a href=""><code>423b570</code></a> Merge pull request <a href="">#3946</a> from github/dependabot/npm_and_yarn/npm-minor-5d507a...</li>
<li><a href=""><code>c35d1b1</code></a> Merge pull request <a href="">#3947</a> from github/dependabot/github_actions/dot-github/wor...</li>
<li><a href=""><code>cb1a588</code></a> Merge pull request <a href="">#3937</a> from github/robertbrignull/waitForProcessing_backoff</li>
<li><a href=""><code>ba47406</code></a> Merge pull request <a href="">#3943</a> from github/henrymercer/cache-cli-version-info</li>
<li>Additional commits viewable in <a href="https://github.com/github/codeql-action/compare/89a39a4e59826350b863aa6b6252a07ad50cf83e...8aad20d150bbac5944a9f9d289da16a4b0d87c1e">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=github/codeql-action/upload-sarif&package-manager=github_actions&previous-version=4.32.4&new-version=4.36.2)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cd889d9ab149`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.