# Issue

**Title:** Bump github/codeql-action from 4.38.0 to 4.38.1

## Description

Bumps [github/codeql-action](https://github.com/github/codeql-action) from 4.38.0 to 4.38.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/releases">github/codeql-action's releases</a>.</em></p>
<blockquote>
<h2>v4.38.1</h2>
<ul>
<li>The CodeQL Action now has experimental support for CodeQL releases for which per-language bundles are available. Per-language bundles support analysis for a single language and are therefore smaller than the combined bundles that allow analysis for all supported languages. As a result, per-language bundles take up less space on disk and are faster to download. We expect to roll this change out to everyone in the coming weeks. <a href="">#4146</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/blob/main/CHANGELOG.md">github/codeql-action's changelog</a>.</em></p>
<blockquote>
<h2>4.38.1 - 18 Sept 2026</h2>
<ul>
<li>The CodeQL Action now has experimental support for CodeQL releases for which per-language bundles are available. Per-language bundles support analysis for a single language and are therefore smaller than the combined bundles that allow analysis for all supported languages. As a result, per-language bundles take up less space on disk and are faster to download. We expect to roll this change out to everyone in the coming weeks. <a href="">#4146</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>1c5b675</code></a> Merge pull request <a href="">#4152</a> from github/update-v4.38.1-a65b83a73</li>
<li><a href=""><code>a97cdca</code></a> Add changelog entry for <a href="">#4146</a></li>
<li><a href=""><code>cc6c691</code></a> Update changelog for v4.38.1</li>
<li><a href=""><code>a65b83a</code></a> Merge pull request <a href="">#4146</a> from github/henrymercer/per-language-bundles-pr</li>
<li><a href=""><code>07fa87d</code></a> Clarify the latest-nightly eligibility exception</li>
<li><a href=""><code>f18f353</code></a> Describe the bundle URL resolver</li>
<li><a href=""><code>ecec9b5</code></a> Share per-language telemetry fields without renaming</li>
<li><a href=""><code>79fe3a1</code></a> Move download telemetry into the status-report directory</li>
<li><a href=""><code>ead1f7d</code></a> Rename the platform module</li>
<li><a href=""><code>549d498</code></a> Simplify per-language platform eligibility checks</li>
<li>Additional commits viewable in <a href="https://github.com/github/codeql-action/compare/v4.38.0...v4.38.1">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=github/codeql-action&package-manager=github_actions&previous-version=4.38.0&new-version=4.38.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2dacb24c16a4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.