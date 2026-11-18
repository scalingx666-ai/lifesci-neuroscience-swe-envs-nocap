# Issue

**Title:** Bump gettext-converter from 1.3.0 to 1.3.3

## Description

Bumps [gettext-converter](https://github.com/locize/gettext-converter) from 1.3.0 to 1.3.3.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/locize/gettext-converter/blob/master/CHANGELOG.md">gettext-converter's changelog</a>.</em></p>
<blockquote>
<h3>1.3.3</h3>
<ul>
<li>security: prevent prototype pollution in <code>js2i18next()</code> via unsafe translation keys (<code>__proto__</code>, <code>constructor</code>, <code>prototype</code>) (<a href="">#15</a>, reported by <a href="https://github.com/Dremig"><code>@​Dremig</code></a>)</li>
</ul>
<h3>1.3.2</h3>
<ul>
<li>fix: nested array of objects (<a href="">#14</a>)</li>
</ul>
<h3>1.3.1</h3>
<ul>
<li>fix: handle empty <code>msgid_plural</code> as valid plural in PO files, ensuring correct conversion to i18next plural format (<a href="">#13</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>4b02e8c</code></a> 1.3.3</li>
<li><a href=""><code>df90c3b</code></a> security: prevent prototype pollution in js2i18next() via unsafe translation ...</li>
<li><a href=""><code>955bec4</code></a> 1.3.2</li>
<li><a href=""><code>6e06f8c</code></a> prepare release</li>
<li><a href=""><code>3b86355</code></a> 1.3.2</li>
<li><a href=""><code>cc3b8e2</code></a> Merge pull request <a href="">#14</a> from locize/fix/nested-array-of-objects</li>
<li><a href=""><code>9f4f02f</code></a> fix: apply array-of-strings guard in handleNewFormat and add nested array tests</li>
<li><a href=""><code>72944ee</code></a> fix: nested array of objects</li>
<li><a href=""><code>0751ca7</code></a> 1.3.1</li>
<li><a href=""><code>397406a</code></a> fix <a href="">#13</a></li>
<li>Additional commits viewable in <a href="https://github.com/locize/gettext-converter/compare/v1.3.0...v1.3.3">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=gettext-converter&package-manager=npm_and_yarn&previous-version=1.3.0&new-version=1.3.3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/aces/Loris/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0eb19ac51165`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.