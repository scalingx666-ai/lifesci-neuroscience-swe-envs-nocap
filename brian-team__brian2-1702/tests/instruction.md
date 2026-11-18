# Issue

**Title:** chore(deps): bump github/codeql-action from 4.30.8 to 4.31.0

## Description

Bumps [github/codeql-action](https://github.com/github/codeql-action) from 4.30.8 to 4.31.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/releases">github/codeql-action's releases</a>.</em></p>
<blockquote>
<h2>v4.31.0</h2>
<h1>CodeQL Action Changelog</h1>
<p>See the <a href="https://github.com/github/codeql-action/releases">releases page</a> for the relevant changes to the CodeQL CLI and language packs.</p>
<h2>4.31.0 - 24 Oct 2025</h2>
<ul>
<li>Bump minimum CodeQL bundle version to 2.17.6. <a href="">#3223</a></li>
<li>When SARIF files are uploaded by the <code>analyze</code> or <code>upload-sarif</code> actions, the CodeQL Action automatically performs post-processing steps to prepare the data for the upload. Previously, these post-processing steps were only performed before an upload took place. We are now changing this so that the post-processing steps will always be performed, even when the SARIF files are not uploaded. This does not change anything for the <code>upload-sarif</code> action. For <code>analyze</code>, this may affect Advanced Setup for CodeQL users who specify a value other than <code>always</code> for the <code>upload</code> input. <a href="">#3222</a></li>
</ul>
<p>See the full <a href="https://github.com/github/codeql-action/blob/v4.31.0/CHANGELOG.md">CHANGELOG.md</a> for more information.</p>
<h2>v4.30.9</h2>
<h1>CodeQL Action Changelog</h1>
<p>See the <a href="https://github.com/github/codeql-action/releases">releases page</a> for the relevant changes to the CodeQL CLI and language packs.</p>
<h2>4.30.9 - 17 Oct 2025</h2>
<ul>
<li>Update default CodeQL bundle version to 2.23.3. <a href="">#3205</a></li>
<li>Experimental: A new <code>setup-codeql</code> action has been added which is similar to <code>init</code>, except it only installs the CodeQL CLI and does not initialize a database. Do not use this in production as it is part of an internal experiment and subject to change at any time. <a href="">#3204</a></li>
</ul>
<p>See the full <a href="https://github.com/github/codeql-action/blob/v4.30.9/CHANGELOG.md">CHANGELOG.md</a> for more information.</p>
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
<h2>4.31.0 - 24 Oct 2025</h2>
<ul>
<li>Bump minimum CodeQL bundle version to 2.17.6. <a href="">#3223</a></li>
<li>When SARIF files are uploaded by the <code>analyze</code> or <code>upload-sarif</code> actions, the CodeQL Action automatically performs post-processing steps to prepare the data for the upload. Previously, these post-processing steps were only performed before an upload took place. We are now changing this so that the post-processing steps will always be performed, even when the SARIF files are not uploaded. This does not change anything for the <code>upload-sarif</code> action. For <code>analyze</code>, this may affect Advanced Setup for CodeQL users who specify a value other than <code>always</code> for the <code>upload</code> input. <a href="">#3222</a></li>
</ul>
<h2>4.30.9 - 17 Oct 2025</h2>
<ul>
<li>Update default CodeQL bundle version to 2.23.3. <a href="">#3205</a></li>
<li>Experimental: A new <code>setup-codeql</code> action has been added which is similar to <code>init</code>, except it only installs the CodeQL CLI and does not initialize a database. Do not use this in production as it is part of an internal experiment and subject to change at any time. <a href="">#3204</a></li>
</ul>
<h2>4.30.8 - 10 Oct 2025</h2>
<p>No user facing changes.</p>
<h2>4.30.7 - 06 Oct 2025</h2>
<ul>
<li>[v4+ only] The CodeQL Action now runs on Node.js v24. <a href="">#3169</a></li>
</ul>
<h2>3.30.6 - 02 Oct 2025</h2>
<ul>
<li>Update default CodeQL bundle version to 2.23.2. <a href="">#3168</a></li>
</ul>
<h2>3.30.5 - 26 Sep 2025</h2>
<ul>
<li>We fixed a bug that was introduced in <code>3.30.4</code> with <code>upload-sarif</code> which resulted in files without a <code>.sarif</code> extension not getting uploaded. <a href="">#3160</a></li>
</ul>
<h2>3.30.4 - 25 Sep 2025</h2>
<ul>
<li>We have improved the CodeQL Action's ability to validate that the workflow it is used in does not use different versions of the CodeQL Action for different workflow steps. Mixing different versions of the CodeQL Action in the same workflow is unsupported and can lead to unpredictable results. A warning will now be emitted from the <code>codeql-action/init</code> step if different versions of the CodeQL Action are detected in the workflow file. Additionally, an error will now be thrown by the other CodeQL Action steps if they load a configuration file that was generated by a different version of the <code>codeql-action/init</code> step. <a href="">#3099</a> and <a href="">#3100</a></li>
<li>We added support for reducing the size of dependency caches for Java analyses, which will reduce cache usage and speed up workflows. This will be enabled automatically at a later time. <a href="">#3107</a></li>
<li>You can now run the latest CodeQL nightly bundle by passing <code>tools: nightly</code> to the <code>init</code> action. In general, the nightly bundle is unstable and we only recommend running it when directed by GitHub staff. <a href="">#3130</a></li>
<li>Update default CodeQL bundle version to 2.23.1. <a href="">#3118</a></li>
</ul>
<h2>3.30.3 - 10 Sep 2025</h2>
<p>No user facing changes.</p>
<h2>3.30.2 - 09 Sep 2025</h2>
<ul>
<li>Fixed a bug which could cause language autodetection to fail. <a href="">#3084</a></li>
<li>Experimental: The <code>quality-queries</code> input that was added in <code>3.29.2</code> as part of an internal experiment is now deprecated and will be removed in an upcoming version of the CodeQL Action. It has been superseded by a new <code>analysis-kinds</code> input, which is part of the same internal experiment. Do not use this in production as it is subject to change at any time. <a href="">#3064</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>4e94bd1</code></a> Merge pull request <a href="">#3235</a> from github/update-v4.31.0-1d36546c1</li>
<li><a href=""><code>8f11182</code></a> Update changelog for v4.31.0</li>
<li><a href=""><code>1d36546</code></a> Merge pull request <a href="">#3234</a> from github/mbg/changelog/post-processing</li>
<li><a href=""><code>08ada26</code></a> Add changelog entry for post-processing change</li>
<li><a href=""><code>b843cbe</code></a> Merge pull request <a href="">#3233</a> from github/mbg/getOptionalEnvVar</li>
<li><a href=""><code>1ecd563</code></a> Use <code>getOptionalEnvVar</code> in <code>writePostProcessedFiles</code></li>
<li><a href=""><code>e576807</code></a> Merge pull request <a href="">#3223</a> from github/henrymercer/bump-minimum</li>
<li><a href=""><code>ad35676</code></a> Add <code>getOptionalEnvVar</code> function</li>
<li><a href=""><code>d75645b</code></a> Merge pull request <a href="">#3222</a> from github/mbg/upload-lib/post-process</li>
<li><a href=""><code>710606c</code></a> Check that <code>outputPath</code> is non-empty</li>
<li>Additional commits viewable in <a href="https://github.com/github/codeql-action/compare/f443b600d91635bebf5b0d9ebc620189c0d6fba5...4e94bd11f71e507f7f87df81788dff88d1dacbfb">compare view</a></li>
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

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=github/codeql-action&package-manager=github_actions&previous-version=4.30.8&new-version=4.31.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4b3fe6192b2e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.