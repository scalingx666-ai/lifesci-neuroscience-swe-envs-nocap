# Issue

**Title:** chore(deps): Bump fast-xml-parser from 5.5.7 to 5.7.1

## Description

Bumps [fast-xml-parser](https://github.com/NaturalIntelligence/fast-xml-parser) from 5.5.7 to 5.7.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/NaturalIntelligence/fast-xml-parser/releases">fast-xml-parser's releases</a>.</em></p>
<blockquote>
<h2>upgrade <code>@​nodable/entities</code> and FXB</h2>
<ul>
<li>Use <code>@nodable/entities</code> v2.1.0
<ul>
<li>breaking changes
<ul>
<li>single entity scan. You're not allowed to use entity value to form another entity name.</li>
<li>you cant add numeric external entity</li>
<li>entity error message when expantion limit is crossed might change</li>
</ul>
</li>
<li>typings are updated for new options related to process entity</li>
<li>please follow documentation of <code>@nodable/entities</code> for more detail.</li>
<li>performance
<ul>
<li>if processEntities is false, then there should not be impact on performance.</li>
<li>if processEntities is true, but you dont pass entity decoder separately then performance may degrade by approx 8-10%</li>
<li>if processEntities is true, and you pass entity decoder separately
<ul>
<li>if no entity then performance should be same as before</li>
<li>if there are entities then performance should be increased from past versions</li>
</ul>
</li>
</ul>
</li>
<li>ignoreAttributes is not required to be set to set xml version for NCR entity value</li>
</ul>
</li>
<li>update 'fast-xml-builder' to sanitize malicious CDATA and comment's content</li>
</ul>
<h2>use <code>@​nodable/entities</code> to replace entities</h2>
<ul>
<li>No API change</li>
<li>No change in performance for basic usage</li>
<li>No typing change</li>
<li>No config change</li>
<li>new dependency</li>
<li>breaking: error messages for entities might have been changed.</li>
<li></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/NaturalIntelligence/fast-xml-parser/compare/v5.5.12...v5.6.0">https://github.com/NaturalIntelligence/fast-xml-parser/compare/v5.5.12...v5.6.0</a></p>
<h2>performance improvment, increase entity expansion default limit</h2>
<ul>
<li>increase default entity explansion limit as many projects demand for that</li>
</ul>
<pre><code>maxEntitySize: 10000,
maxExpansionDepth: 10000,
maxTotalExpansions: Infinity,
maxExpandedLength: 100000,
maxEntityCount: 1000,
</code></pre>
<ul>
<li>performance improvement
<ul>
<li>reduce calls to toString</li>
<li>early return when entities are not present</li>
<li>prepare rawAttrsForMatcher only if user sets <code>jPath: false</code></li>
</ul>
</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/NaturalIntelligence/fast-xml-parser/compare/v5.5.9...v5.5.10">https://github.com/NaturalIntelligence/fast-xml-parser/compare/v5.5.9...v5.5.10</a></p>
<h2>fix typins and matcher instance in callbacks</h2>
<p>combine typings file to avoid configuration changes
pass readonly instance of matcher to the call backs to avoid accidental push/pop call</p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/NaturalIntelligence/fast-xml-parser/blob/master/CHANGELOG.md">fast-xml-parser's changelog</a>.</em></p>
<blockquote>
<p><!-- raw HTML omitted -->Note: If you find missing information about particular minor version, that version must have been changed without any functional change in this library.<!-- raw HTML omitted --></p>
<p>Note: Due to some last quick changes on v4, detail of v4.5.3 &amp; v4.5.4 are not updated here. v4.5.4x is the last tag of v4 in github repository. I'm extremely sorry for the confusion</p>
<p><strong>5.7.1 / 2026-04-20</strong></p>
<ul>
<li>fix <a href="">#705</a>: attributesGroupName working with preserveOrder</li>
<li>fix <a href="">#817</a>: stackoverflow when tag expression is very long</li>
</ul>
<p><strong>5.7.0 / 2026-04-17</strong></p>
<ul>
<li>Use <code>@nodable/entities</code> v2.1.0
<ul>
<li>breaking changes
<ul>
<li>single entity scan. You're not allowed to user entity value to form another entity name.</li>
<li>you cant add numeric external entity</li>
<li>entity error message when expantion limit is crossed might change</li>
</ul>
</li>
<li>typings are updated for new options related to process entity</li>
<li>please follow documentation of <code>@nodable/entities</code> for more detail.</li>
<li>performance
<ul>
<li>if processEntities is false, then there should not be impact on performance.</li>
<li>if processEntities is true, but you dont pass entity decoder separately then performance may degrade by approx 8-10%</li>
<li>if processEntities is true, and you pass entity decoder separately
<ul>
<li>if no entity then performance should be same as before</li>
<li>if there are entities then performance should be increased from past versions</li>
</ul>
</li>
</ul>
</li>
<li>ignoreAttributes is not required to be set to set xml version for NCR entity value</li>
</ul>
</li>
<li>update 'fast-xml-builder' to sanitize malicious CDATA and comment's content</li>
</ul>
<p><strong>5.6.0 / 2026-04-15</strong></p>
<ul>
<li>fix: entity replacement for numeric entities</li>
<li>use <code>@​nodable/entities</code> to replace entities
<ul>
<li>this may change some error messages related to entities expansion limit or inavlid use</li>
<li>post check would be exposed in future version</li>
</ul>
</li>
</ul>
<p><strong>5.5.12 / 2026-04-13</strong></p>
<ul>
<li>Performance Improvement: update path-expression-matcher
<ul>
<li>use proxy pattern than Proxy class</li>
</ul>
</li>
</ul>
<p><strong>5.5.11 / 2026-04-08</strong></p>
<ul>
<li>Performance Improvement
<ul>
<li>integrate ExpressionSet for stopNodes</li>
</ul>
</li>
</ul>
<p><strong>5.5.10 / 2026-04-03</strong></p>
<ul>
<li>increase default entity explansion limit as many projects demand for that</li>
<li>performance improvement
<ul>
<li>reduce calls to toString</li>
<li>early return when entities are not present</li>
<li>prepare rawAttrsForMatcher only if user sets <code>jPath: false</code></li>
</ul>
</li>
</ul>
<p><strong>5.5.9 / 2026-03-23</strong></p>
<ul>
<li>combine typing files</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>0f08303</code></a> fix typo</li>
<li><a href=""><code>f529642</code></a> update to release v5.7.0</li>
<li><a href=""><code>52a8583</code></a> Revert &quot;improve performance of attributes reading&quot;</li>
<li><a href=""><code>8d187f9</code></a> update builder</li>
<li><a href=""><code>e174168</code></a> improve performance of attributes reading</li>
<li><a href=""><code>79a8dde</code></a> update docs</li>
<li><a href=""><code>f5cd5a5</code></a> set xml version to decoder even if attributes are ignored</li>
<li><a href=""><code>f44b923</code></a> remove unwanted tests</li>
<li><a href=""><code>869ec8b</code></a> Use <code>@​nodable/entities</code> v2.1.0</li>
<li><a href=""><code>7cb49e5</code></a> update release detail</li>
<li>Additional commits viewable in <a href="https://github.com/NaturalIntelligence/fast-xml-parser/compare/v5.5.7...v5.7.1">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=fast-xml-parser&package-manager=npm_and_yarn&previous-version=5.5.7&new-version=5.7.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/OpenNeuroOrg/openneuro/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `95f239b3e919`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.