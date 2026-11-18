# Issue

**Title:** Bump github/codeql-action from 4.39.1 to 4.39.2

## Description

Bumps [github/codeql-action](https://github.com/github/codeql-action) from 4.39.1 to 4.39.2.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/releases">github/codeql-action's releases</a>.</em></p>
<blockquote>
<h2>v4.39.2</h2>
<ul>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.27.4">2.27.4</a>. <a href="">#4284</a></li>
<li><em>Upcoming breaking change</em>: CodeQL version 2.22.3 and earlier were discontinued on 16 October 2026 alongside GitHub Enterprise Server 3.18, and will be unsupported by the next minor release of the CodeQL Action. Added a deprecation warning for customers using these versions of CodeQL. <a href="">#4266</a></li>
<li>Starting with macOS 27 and Xcode 27, traced analyses are unsupported. See <a href="https://github.blog/changelog/2026-10-19-codeql-changes-for-macos-27-xcode-27-and-swift-6-4/">this blog post for more information</a>. The CodeQL Action will now try to identify if a workflow is about to perform a traced analysis on version 27 or above of macOS or Xcode. If so, the CodeQL Action will emit a corresponding warning that will also be visible on the <a href="https://docs.github.com/en/code-security/how-tos/find-and-fix-code-vulnerabilities/manage-your-configuration/use-the-tools-status-page-for-code-scanning">Tool Status Page</a>. This check will be rolled out following this release of the CodeQL Action. <a href="">#4221</a></li>
<li>The undocumented TRAP cache cleanup feature that could be enabled using the <code>CODEQL_ACTION_CLEANUP_TRAP_CACHES</code> environment variable has been removed, as announced in the release notes for CodeQL Action 4.35.2. The <code>analyze</code> Action now warns if this environment variable is set. If you used TRAP cache cleanup to limit Actions cache usage, we recommend disabling TRAP caching by passing the <code>trap-caching: false</code> input to the <code>init</code> Action. <a href="">#4243</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/blob/main/CHANGELOG.md">github/codeql-action's changelog</a>.</em></p>
<blockquote>
<h2>4.39.2 - 03 Nov 2026</h2>
<ul>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.27.4">2.27.4</a>. <a href="">#4284</a></li>
<li><em>Upcoming breaking change</em>: CodeQL version 2.22.3 and earlier were discontinued on 16 October 2026 alongside GitHub Enterprise Server 3.18, and will be unsupported by the next minor release of the CodeQL Action. Added a deprecation warning for customers using these versions of CodeQL. <a href="">#4266</a></li>
<li>Starting with macOS 27 and Xcode 27, traced analyses are unsupported. See <a href="https://github.blog/changelog/2026-10-19-codeql-changes-for-macos-27-xcode-27-and-swift-6-4/">this blog post for more information</a>. The CodeQL Action will now try to identify if a workflow is about to perform a traced analysis on version 27 or above of macOS or Xcode. If so, the CodeQL Action will emit a corresponding warning that will also be visible on the <a href="https://docs.github.com/en/code-security/how-tos/find-and-fix-code-vulnerabilities/manage-your-configuration/use-the-tools-status-page-for-code-scanning">Tool Status Page</a>. This check will be rolled out following this release of the CodeQL Action. <a href="">#4221</a></li>
<li>The undocumented TRAP cache cleanup feature that could be enabled using the <code>CODEQL_ACTION_CLEANUP_TRAP_CACHES</code> environment variable has been removed, as announced in the release notes for CodeQL Action 4.35.2. The <code>analyze</code> Action now warns if this environment variable is set. If you used TRAP cache cleanup to limit Actions cache usage, we recommend disabling TRAP caching by passing the <code>trap-caching: false</code> input to the <code>init</code> Action. <a href="">#4243</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>1fc58d0</code></a> Merge pull request <a href="">#4286</a> from github/update-v4.39.2-c05042115</li>
<li><a href=""><code>d998481</code></a> Update changelog for v4.39.2</li>
<li><a href=""><code>c050421</code></a> Merge pull request <a href="">#4284</a> from github/update-bundle/codeql-bundle-v2.27.4</li>
<li><a href=""><code>750fe8f</code></a> Merge branch 'main' into update-bundle/codeql-bundle-v2.27.4</li>
<li><a href=""><code>adfcd5f</code></a> Add changelog note</li>
<li><a href=""><code>2ef3b62</code></a> Update default bundle to codeql-bundle-v2.27.4</li>
<li><a href=""><code>b35c6c6</code></a> Merge pull request <a href="">#4251</a> from github/mbg/refactor-util/errors</li>
<li><a href=""><code>ac9f257</code></a> Merge remote-tracking branch 'origin/main' into mbg/refactor-util/errors</li>
<li><a href=""><code>52cf185</code></a> Merge pull request <a href="">#4278</a> from github/mbg/macos27/xcode-detection</li>
<li><a href=""><code>95dd6bf</code></a> Fix new test not providing typical input</li>
<li>Additional commits viewable in <a href="https://github.com/github/codeql-action/compare/v4.39.1...v4.39.2">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=github/codeql-action&package-manager=github_actions&previous-version=4.39.1&new-version=4.39.2)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bef19b1d283d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.