# Issue

**Title:** COMP: Bump github/codeql-action/upload-sarif from 4.37.6 to 4.37.7

## Description

Bumps [github/codeql-action/upload-sarif](https://github.com/github/codeql-action) from 4.37.6 to 4.37.7.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/releases">github/codeql-action/upload-sarif's releases</a>.</em></p>
<blockquote>
<h2>v4.37.7</h2>
<ul>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.26.3">2.26.3</a>. <a href="">#4085</a></li>
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
<p>No user facing changes.</p>
<h2>4.37.7 - 13 Aug 2026</h2>
<ul>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.26.3">2.26.3</a>. <a href="">#4085</a></li>
</ul>
<h2>4.37.6 - 04 Aug 2026</h2>
<ul>
<li>Changed the default filepath for the new remote file address format that was introduced in CodeQL Action 4.37.0 / 3.37.0 to <code>.github/codeql-config.yml</code> to align it with the suggested path that is used elsewhere. <a href="">#4070</a></li>
</ul>
<h2>4.37.5 - 03 Aug 2026</h2>
<ul>
<li>Fixed a bug where a network error while streaming the download of the CodeQL bundle could terminate the <code>init</code> Action instead of falling back to downloading the bundle before extracting it. <a href="">#4061</a></li>
</ul>
<h2>4.37.4 - 29 Jul 2026</h2>
<ul>
<li>This version of the CodeQL Action adds support for the <code>tools</code> input for the <code>codeql-action/init</code> step to be specified using a <code>github-codeql-tools</code> <a href="https://docs.github.com/en/organizations/managing-organization-settings/managing-custom-properties-for-repositories-in-your-organization">repository property</a>. This feature will gradually be rolled out following the release of this version. Once rolled out, this allows for the CodeQL CLI version that is used in GitHub-managed workflows, such as Default Setup, to be set to a custom value. For example, customers who run into issues with rate limits when a new CodeQL CLI version is released can set the value to <code>toolcache</code> to always use the CodeQL CLI version that is available in the runner toolcache. For Advanced Setup workflows, the value provided for <code>tools</code> in the workflow definition always takes precedence unless the value of the repository property starts with <code>!</code>. <a href="">#4037</a></li>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.26.2">2.26.2</a>. <a href="">#4051</a></li>
</ul>
<h2>4.37.3 - 22 Jul 2026</h2>
<p>No user facing changes.</p>
<h2>4.37.2 - 21 Jul 2026</h2>
<ul>
<li>The new address format for the <code>config-file</code> input that was introduced in CodeQL Action 4.37.0 is now enabled by default. In addition to the format described there, the <code>remote=</code> prefix can now be used to explicitly indicate that the input refers to a remote file. All previous input formats continue to be accepted as well. <a href="">#4023</a></li>
<li>The CodeQL Action can now make use of <a href="https://docs.github.com/en/code-security/how-tos/secure-at-scale/configure-organization-security/manage-usage-and-access/giving-org-access-private-registries">configured private registries</a> in Default Setup to retrieve CodeQL configuration files from remote repositories that require authentication. This will allow customers to store their CodeQL configuration in a single repository that can then be referenced by Default Setup workflows in other repositories. We expect to roll this and other, related changes out to everyone in July. <a href="">#4007</a></li>
</ul>
<h2>4.37.1 - 16 Jul 2026</h2>
<ul>
<li><em>Upcoming breaking change</em>: Add a deprecation warning for customers using CodeQL version 2.20.6 and earlier. These versions of CodeQL were discontinued on 1 July 2026 alongside GitHub Enterprise Server 3.16, and will be unsupported by the next minor release of the CodeQL Action. <a href="">#3956</a></li>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.26.1">2.26.1</a>. <a href="">#4019</a></li>
</ul>
<h2>4.37.0 - 08 Jul 2026</h2>
<ul>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.26.0">2.26.0</a>. <a href="">#3995</a></li>
<li>In addition to the existing input format, the <code>config-file</code> input for the <code>codeql-action/init</code> step will soon support a new <code>[owner/]repo[@ref][:path]</code> format. All components except the repository name are optional. If omitted, <code>owner</code> defaults to the same owner as the repository the analysis is running for, <code>ref</code> to <code>main</code>, and <code>path</code> to <code>.github/codeql-action.yaml</code>. Support for this format ships in this version of the CodeQL Action, but will only be enabled over the coming weeks. <a href="">#3973</a></li>
</ul>
<h2>4.36.3 - 01 Jul 2026</h2>
<p>No user facing changes.</p>
<h2>4.36.2 - 04 Jun 2026</h2>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>ff2f1c6</code></a> Merge pull request <a href="">#4093</a> from github/update-v4.37.7-be7a3dbb8</li>
<li><a href=""><code>951a133</code></a> Update changelog for v4.37.7</li>
<li><a href=""><code>be7a3db</code></a> Merge pull request <a href="">#4087</a> from github/dependabot/npm_and_yarn/npm-minor-0aa561...</li>
<li><a href=""><code>9310334</code></a> Merge pull request <a href="">#4086</a> from github/mbg/thread-action-state-to-codeql</li>
<li><a href=""><code>b4d8a54</code></a> Rebuild</li>
<li><a href=""><code>ab5db25</code></a> Bump the npm-minor group across 1 directory with 8 updates</li>
<li><a href=""><code>38055a3</code></a> Drop <code>logger</code> from <code>databaseInitCluster</code> in interface</li>
<li><a href=""><code>1f87aed</code></a> Merge pull request <a href="">#4085</a> from github/update-bundle/codeql-bundle-v2.26.3</li>
<li><a href=""><code>dc1b98a</code></a> Make <code>logger</code> available to <code>getCodeQLForCmd</code></li>
<li><a href=""><code>6f0220e</code></a> Merge pull request <a href="">#4084</a> from github/navntoft/bump-undici</li>
<li>Additional commits viewable in <a href="https://github.com/github/codeql-action/compare/5595ccaf912efad79be6eef63a5619ff05969be3...ff2f1c621b7f889edc0d3c761ac2e6a3f8cdb0dd">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=github/codeql-action/upload-sarif&package-manager=github_actions&previous-version=4.37.6&new-version=4.37.7)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fa84163204a5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.