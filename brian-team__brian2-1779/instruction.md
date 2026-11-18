# Issue

**Title:** Bump github/codeql-action from 4.31.0 to 4.32.4

## Description

Bumps [github/codeql-action](https://github.com/github/codeql-action) from 4.31.0 to 4.32.4.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/releases">github/codeql-action's releases</a>.</em></p>
<blockquote>
<h2>v4.32.4</h2>
<ul>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.24.2">2.24.2</a>. <a href="">#3493</a></li>
<li>Added an experimental change which improves how certificates are generated for the authentication proxy that is used by the CodeQL Action in Default Setup when <a href="https://docs.github.com/en/code-security/how-tos/secure-at-scale/configure-organization-security/manage-usage-and-access/giving-org-access-private-registries">private package registries are configured</a>. This is expected to generate more widely compatible certificates and should have no impact on analyses which are working correctly already. We expect to roll this change out to everyone in February. <a href="">#3473</a></li>
<li>When the CodeQL Action is run <a href="https://docs.github.com/en/code-security/how-tos/scan-code-for-vulnerabilities/troubleshooting/troubleshooting-analysis-errors/logs-not-detailed-enough#creating-codeql-debugging-artifacts-for-codeql-default-setup">with debugging enabled in Default Setup</a> and <a href="https://docs.github.com/en/code-security/how-tos/secure-at-scale/configure-organization-security/manage-usage-and-access/giving-org-access-private-registries">private package registries are configured</a>, the &quot;Setup proxy for registries&quot; step will output additional diagnostic information that can be used for troubleshooting. <a href="">#3486</a></li>
<li>Added a setting which allows the CodeQL Action to enable network debugging for Java programs. This will help GitHub staff support customers with troubleshooting issues in GitHub-managed CodeQL workflows, such as Default Setup. This setting can only be enabled by GitHub staff. <a href="">#3485</a></li>
<li>Added a setting which enables GitHub-managed workflows, such as Default Setup, to use a <a href="https://github.com/dsp-testing/codeql-cli-nightlies">nightly CodeQL CLI release</a> instead of the latest, stable release that is used by default. This will help GitHub staff support customers whose analyses for a given repository or organization require early access to a change in an upcoming CodeQL CLI release. This setting can only be enabled by GitHub staff. <a href="">#3484</a></li>
</ul>
<h2>v4.32.3</h2>
<ul>
<li>Added experimental support for testing connections to <a href="https://docs.github.com/en/code-security/how-tos/secure-at-scale/configure-organization-security/manage-usage-and-access/giving-org-access-private-registries">private package registries</a>. This feature is not currently enabled for any analysis. In the future, it may be enabled by default for Default Setup. <a href="">#3466</a></li>
</ul>
<h2>v4.32.2</h2>
<ul>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.24.1">2.24.1</a>. <a href="">#3460</a></li>
</ul>
<h2>v4.32.1</h2>
<ul>
<li>A warning is now shown in Default Setup workflow logs if a <a href="https://docs.github.com/en/code-security/how-tos/secure-at-scale/configure-organization-security/manage-usage-and-access/giving-org-access-private-registries">private package registry is configured</a> using a GitHub Personal Access Token (PAT), but no username is configured. <a href="">#3422</a></li>
<li>Fixed a bug which caused the CodeQL Action to fail when repository properties cannot successfully be retrieved. <a href="">#3421</a></li>
</ul>
<h2>v4.32.0</h2>
<ul>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.24.0">2.24.0</a>. <a href="">#3425</a></li>
</ul>
<h2>v4.31.11</h2>
<ul>
<li>When running a Default Setup workflow with <a href="https://docs.github.com/en/actions/how-tos/monitor-workflows/enable-debug-logging">Actions debugging enabled</a>, the CodeQL Action will now use more unique names when uploading logs from the Dependabot authentication proxy as workflow artifacts. This ensures that the artifact names do not clash between multiple jobs in a build matrix. <a href="">#3409</a></li>
<li>Improved error handling throughout the CodeQL Action. <a href="">#3415</a></li>
<li>Added experimental support for automatically excluding <a href="https://docs.github.com/en/repositories/working-with-files/managing-files/customizing-how-changed-files-appear-on-github">generated files</a> from the analysis. This feature is not currently enabled for any analysis. In the future, it may be enabled by default for some GitHub-managed analyses. <a href="">#3318</a></li>
<li>The changelog extracts that are included with releases of the CodeQL Action are now shorter to avoid duplicated information from appearing in Dependabot PRs. <a href="">#3403</a></li>
</ul>
<h2>v4.31.10</h2>
<h1>CodeQL Action Changelog</h1>
<p>See the <a href="https://github.com/github/codeql-action/releases">releases page</a> for the relevant changes to the CodeQL CLI and language packs.</p>
<h2>4.31.10 - 12 Jan 2026</h2>
<ul>
<li>Update default CodeQL bundle version to 2.23.9. <a href="">#3393</a></li>
</ul>
<p>See the full <a href="https://github.com/github/codeql-action/blob/v4.31.10/CHANGELOG.md">CHANGELOG.md</a> for more information.</p>
<h2>v4.31.9</h2>
<h1>CodeQL Action Changelog</h1>
<p>See the <a href="https://github.com/github/codeql-action/releases">releases page</a> for the relevant changes to the CodeQL CLI and language packs.</p>
<h2>4.31.9 - 16 Dec 2025</h2>
<p>No user facing changes.</p>
<p>See the full <a href="https://github.com/github/codeql-action/blob/v4.31.9/CHANGELOG.md">CHANGELOG.md</a> for more information.</p>
<h2>v4.31.8</h2>
<h1>CodeQL Action Changelog</h1>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/blob/main/CHANGELOG.md">github/codeql-action's changelog</a>.</em></p>
<blockquote>
<h1>CodeQL Action Changelog</h1>
<p>See the <a href="https://github.com/github/codeql-action/releases">releases page</a> for the relevant changes to the CodeQL CLI and language packs.</p>
<h2>[UNRELEASED]</h2>
<p>No user facing changes.</p>
<h2>4.32.4 - 20 Feb 2026</h2>
<ul>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.24.2">2.24.2</a>. <a href="">#3493</a></li>
<li>Added an experimental change which improves how certificates are generated for the authentication proxy that is used by the CodeQL Action in Default Setup when <a href="https://docs.github.com/en/code-security/how-tos/secure-at-scale/configure-organization-security/manage-usage-and-access/giving-org-access-private-registries">private package registries are configured</a>. This is expected to generate more widely compatible certificates and should have no impact on analyses which are working correctly already. We expect to roll this change out to everyone in February. <a href="">#3473</a></li>
<li>When the CodeQL Action is run <a href="https://docs.github.com/en/code-security/how-tos/scan-code-for-vulnerabilities/troubleshooting/troubleshooting-analysis-errors/logs-not-detailed-enough#creating-codeql-debugging-artifacts-for-codeql-default-setup">with debugging enabled in Default Setup</a> and <a href="https://docs.github.com/en/code-security/how-tos/secure-at-scale/configure-organization-security/manage-usage-and-access/giving-org-access-private-registries">private package registries are configured</a>, the &quot;Setup proxy for registries&quot; step will output additional diagnostic information that can be used for troubleshooting. <a href="">#3486</a></li>
<li>Added a setting which allows the CodeQL Action to enable network debugging for Java programs. This will help GitHub staff support customers with troubleshooting issues in GitHub-managed CodeQL workflows, such as Default Setup. This setting can only be enabled by GitHub staff. <a href="">#3485</a></li>
<li>Added a setting which enables GitHub-managed workflows, such as Default Setup, to use a <a href="https://github.com/dsp-testing/codeql-cli-nightlies">nightly CodeQL CLI release</a> instead of the latest, stable release that is used by default. This will help GitHub staff support customers whose analyses for a given repository or organization require early access to a change in an upcoming CodeQL CLI release. This setting can only be enabled by GitHub staff. <a href="">#3484</a></li>
</ul>
<h2>4.32.3 - 13 Feb 2026</h2>
<ul>
<li>Added experimental support for testing connections to <a href="https://docs.github.com/en/code-security/how-tos/secure-at-scale/configure-organization-security/manage-usage-and-access/giving-org-access-private-registries">private package registries</a>. This feature is not currently enabled for any analysis. In the future, it may be enabled by default for Default Setup. <a href="">#3466</a></li>
</ul>
<h2>4.32.2 - 05 Feb 2026</h2>
<ul>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.24.1">2.24.1</a>. <a href="">#3460</a></li>
</ul>
<h2>4.32.1 - 02 Feb 2026</h2>
<ul>
<li>A warning is now shown in Default Setup workflow logs if a <a href="https://docs.github.com/en/code-security/how-tos/secure-at-scale/configure-organization-security/manage-usage-and-access/giving-org-access-private-registries">private package registry is configured</a> using a GitHub Personal Access Token (PAT), but no username is configured. <a href="">#3422</a></li>
<li>Fixed a bug which caused the CodeQL Action to fail when repository properties cannot successfully be retrieved. <a href="">#3421</a></li>
</ul>
<h2>4.32.0 - 26 Jan 2026</h2>
<ul>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.24.0">2.24.0</a>. <a href="">#3425</a></li>
</ul>
<h2>4.31.11 - 23 Jan 2026</h2>
<ul>
<li>When running a Default Setup workflow with <a href="https://docs.github.com/en/actions/how-tos/monitor-workflows/enable-debug-logging">Actions debugging enabled</a>, the CodeQL Action will now use more unique names when uploading logs from the Dependabot authentication proxy as workflow artifacts. This ensures that the artifact names do not clash between multiple jobs in a build matrix. <a href="">#3409</a></li>
<li>Improved error handling throughout the CodeQL Action. <a href="">#3415</a></li>
<li>Added experimental support for automatically excluding <a href="https://docs.github.com/en/repositories/working-with-files/managing-files/customizing-how-changed-files-appear-on-github">generated files</a> from the analysis. This feature is not currently enabled for any analysis. In the future, it may be enabled by default for some GitHub-managed analyses. <a href="">#3318</a></li>
<li>The changelog extracts that are included with releases of the CodeQL Action are now shorter to avoid duplicated information from appearing in Dependabot PRs. <a href="">#3403</a></li>
</ul>
<h2>4.31.10 - 12 Jan 2026</h2>
<ul>
<li>Update default CodeQL bundle version to 2.23.9. <a href="">#3393</a></li>
</ul>
<h2>4.31.9 - 16 Dec 2025</h2>
<p>No user facing changes.</p>
<h2>4.31.8 - 11 Dec 2025</h2>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>89a39a4</code></a> Merge pull request <a href="">#3494</a> from github/update-v4.32.4-39ba80c47</li>
<li><a href=""><code>e5d84c8</code></a> Apply remaining review suggestions</li>
<li><a href=""><code>0c20209</code></a> Apply suggestions from code review</li>
<li><a href=""><code>314172e</code></a> Fix typo</li>
<li><a href=""><code>cdda72d</code></a> Add changelog entries</li>
<li><a href=""><code>cfda84c</code></a> Update changelog for v4.32.4</li>
<li><a href=""><code>39ba80c</code></a> Merge pull request <a href="">#3493</a> from github/update-bundle/codeql-bundle-v2.24.2</li>
<li><a href=""><code>00150da</code></a> Add changelog note</li>
<li><a href=""><code>d97dce6</code></a> Update default bundle to codeql-bundle-v2.24.2</li>
<li><a href=""><code>50fdbb9</code></a> Merge pull request <a href="">#3492</a> from github/henrymercer/new-repository-properties-ff</li>
<li>Additional commits viewable in <a href="https://github.com/github/codeql-action/compare/4e94bd11f71e507f7f87df81788dff88d1dacbfb...89a39a4e59826350b863aa6b6252a07ad50cf83e">compare view</a></li>
</ul>
</details>
<br />

<details>
<summary>Most Recent Ignore Conditions Applied to This Pull Request</summary>

| Dependency Name | Ignore Conditions |
| --- | --- |
| github/codeql-action | [< 3.29, > 3.28.17] |
| github/codeql-action | [< 3.30, > 3.29.1] |
</details>

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=github/codeql-action&package-manager=github_actions&previous-version=4.31.0&new-version=4.32.4)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `983696c3cfd3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.