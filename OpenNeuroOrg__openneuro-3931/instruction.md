# Issue

**Title:** chore(deps): Bump fast-xml-builder from 1.1.5 to 1.2.0

## Description

Bumps [fast-xml-builder](https://github.com/NaturalIntelligence/fast-xml-builder) from 1.1.5 to 1.2.0.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/NaturalIntelligence/fast-xml-builder/blob/main/CHANGELOG.md">fast-xml-builder's changelog</a>.</em></p>
<blockquote>
<p><strong>1.2.0</strong> (2026-05-08)</p>
<ul>
<li>Add support for <code>sanitizeName</code> option</li>
<li>Support xml-naming for validating and sanitizing tag and attribute names</li>
</ul>
<p><strong>1.1.9</strong> (2026-05-06)</p>
<ul>
<li>fix: format output for preserve order when indent by is set to empty string</li>
</ul>
<p><strong>1.1.8</strong> (2026-05-05)</p>
<ul>
<li>fix: skip text property for PI tags</li>
<li>improve typings</li>
</ul>
<p><strong>1.1.7</strong> (2026--05-04)</p>
<ul>
<li>fix security issues when attribute value contains quotes</li>
</ul>
<p><strong>1.1.6</strong> (2026--05-04)</p>
<ul>
<li>fix security issues related to comment</li>
<li>skip comment with null value</li>
</ul>
<p><strong>1.1.5</strong> (2026-04-17)</p>
<ul>
<li>fix security issues related to comment and cdata</li>
</ul>
<p><strong>1.1.4</strong> (2026-03-16)</p>
<ul>
<li>support maxNestedTags option</li>
</ul>
<p><strong>1.1.3</strong> (2026-03-13)</p>
<ul>
<li>declare Matcher &amp; Expression as unknown so user is not forced to install path-expression-matcher</li>
</ul>
<p><strong>1.1.2</strong> (2026-03-11)</p>
<ul>
<li>fix typings</li>
</ul>
<p><strong>1.1.1</strong> (2026-03-11)</p>
<ul>
<li>upgrade path-expression-matcher to 1.1.3</li>
</ul>
<p><strong>1.1.0</strong> (2026-03-10)</p>
<ul>
<li>Integrate <a href="https://github.com/NaturalIntelligence/path-expression-matcher">path-expression-matcher</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>a9a905b</code></a> for release</li>
<li><a href=""><code>42680e8</code></a> support name sanitization</li>
<li><a href=""><code>8b00185</code></a> release info</li>
<li><a href=""><code>8a08f17</code></a> allow indentation to be empty string</li>
<li><a href=""><code>7fc5dec</code></a> update docs</li>
<li><a href=""><code>c241b6a</code></a> improve documentation</li>
<li><a href=""><code>15d5668</code></a> update for release</li>
<li><a href=""><code>9877485</code></a> fix: skip text property for PI tags</li>
<li><a href=""><code>311a221</code></a> fix <a href="">#5</a> typing import issues</li>
<li><a href=""><code>e8fc5b1</code></a> update for releast</li>
<li>Additional commits viewable in <a href="https://github.com/NaturalIntelligence/fast-xml-builder/compare/v1.1.5...v1.2.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=fast-xml-builder&package-manager=npm_and_yarn&previous-version=1.1.5&new-version=1.2.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1f4d28e9d6e4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.