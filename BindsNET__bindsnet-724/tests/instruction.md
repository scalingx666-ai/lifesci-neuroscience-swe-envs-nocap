# Issue

**Title:** Bump fonttools from 4.60.1 to 4.61.0

## Description

Bumps [fonttools](https://github.com/fonttools/fonttools) from 4.60.1 to 4.61.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/fonttools/fonttools/releases">fonttools's releases</a>.</em></p>
<blockquote>
<h2>4.61.0</h2>
<ul>
<li>[varLib.main]: <strong>SECURITY</strong> Only use basename(vf.filename) to prevent path traversal attacks when running <code>fonttools varLib</code> command-line script, or code which invokes <code>fonttools.varLib.main()</code>. Fixes CVE-2025-66034, see: <a href="https://github.com/fonttools/fonttools/security/advisories/GHSA-768j-98cg-p3fv">https://github.com/fonttools/fonttools/security/advisories/GHSA-768j-98cg-p3fv</a>.</li>
<li>[feaLib] Sort BaseLangSysRecords by tag (<a href="">#3986</a>).</li>
<li>Drop support for EOL Python 3.9 (<a href="">#3982</a>).</li>
<li>[instancer] Support --remove-overlaps for fonts with CFF2 table (<a href="">#3975</a>).</li>
<li>[CFF2ToCFF] Add --remove-overlaps option (<a href="">#3976</a>).</li>
<li>[feaLib] Raise an error for rsub with NULL target (<a href="">#3979</a>).</li>
<li>[bezierTools] Fix logic bug in curveCurveIntersections (<a href="">#3963</a>).</li>
<li>[feaLib] Error when condition sets have the same name (<a href="">#3958</a>).</li>
<li>[cu2qu.ufo] skip processing empty glyphs to support sparse kerning masters (<a href="">#3956</a>).</li>
<li>[unicodedata] Update to Unicode 17. Require <code>unicodedata2 &gt;= 17.0.0</code> when installed with 'unicode' extra.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/fonttools/fonttools/blob/main/NEWS.rst">fonttools's changelog</a>.</em></p>
<blockquote>
<h2>4.61.0 (released 2025-11-28)</h2>
<ul>
<li>[varLib.main]: <strong>SECURITY</strong> Only use basename(vf.filename) to prevent path traversal attacks when
running <code>fonttools varLib</code> command, or code which invokes <code>fonttools.varLib.main()</code>.
Fixes CVE-2025-66034, see:
<a href="https://github.com/fonttools/fonttools/security/advisories/GHSA-768j-98cg-p3fv">https://github.com/fonttools/fonttools/security/advisories/GHSA-768j-98cg-p3fv</a>.</li>
<li>[feaLib] Sort BaseLangSysRecords by tag (<a href="">#3986</a>).</li>
<li>Drop support for EOL Python 3.9 (<a href="">#3982</a>).</li>
<li>[instancer] Support --remove-overlaps for fonts with CFF2 table (<a href="">#3975</a>).</li>
<li>[CFF2ToCFF] Add --remove-overlaps option (<a href="">#3976</a>).</li>
<li>[feaLib] Raise an error for rsub with NULL target (<a href="">#3979</a>).</li>
<li>[bezierTools] Fix logic bug in curveCurveIntersections (<a href="">#3963</a>).</li>
<li>[feaLib] Error when condition sets have the same name (<a href="">#3958</a>).</li>
<li>[cu2qu.ufo] skip processing empty glyphs to support sparse kerning masters (<a href="">#3956</a>).</li>
<li>[unicodedata] Update to Unicode 17. Require <code>unicodedata2 &gt;= 17.0.0</code> when installed with 'unicode' extra.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>e691e3b</code></a> Release 4.61.0</li>
<li><a href=""><code>c2d540f</code></a> Update NEWS.rst</li>
<li><a href=""><code>3859753</code></a> Update NEWS.rst</li>
<li><a href=""><code>26eb070</code></a> black</li>
<li><a href=""><code>5ff73af</code></a> Merge commit from fork</li>
<li><a href=""><code>a696d5b</code></a> varLib: only use the basename(vf.filename)</li>
<li><a href=""><code>b00bc45</code></a> varLib_test: test path traversal in variable-font filename</li>
<li><a href=""><code>066512e</code></a> Merge pull request <a href="">#3986</a> from cmyr/base-minmax-sorting</li>
<li><a href=""><code>ce78973</code></a> [feaLib] Sort BasLangSysRecords by tag</li>
<li><a href=""><code>5bb37dc</code></a> Merge pull request <a href="">#3983</a> from fonttools/dependabot/pip/brotli-1.2.0</li>
<li>Additional commits viewable in <a href="https://github.com/fonttools/fonttools/compare/4.60.1...4.61.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=fonttools&package-manager=pip&previous-version=4.60.1&new-version=4.61.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/BindsNET/bindsnet/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fd3b904d80d2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.