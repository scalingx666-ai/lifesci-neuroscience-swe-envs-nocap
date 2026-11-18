# Issue

**Title:** Bump dompurify from 3.4.16 to 3.4.17

## Description

Bumps [dompurify](https://github.com/cure53/DOMPurify) from 3.4.16 to 3.4.17.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/cure53/DOMPurify/releases">dompurify's releases</a>.</em></p>
<blockquote>
<h2>DOMPurify 3.4.17</h2>
<ul>
<li>Fixed an issue with <code>IN_PLACE</code>, <code>SAFE_FOR_TEMPLATES</code> and shadow roots, thanks <a href="https://github.com/manus-pi"><code>@​manus-pi</code></a></li>
<li>Fixed <code>IN_PLACE</code> handling of nodes that hooks or custom elements tough during sanitization, thanks <a href="https://github.com/uttej-badwane"><code>@​uttej-badwane</code></a></li>
<li>Fixed the SMIL <code>attributeName</code> guard in XHTML mode, thanks <a href="https://github.com/Koukyosyumei"><code>@​Koukyosyumei</code></a></li>
<li>Hardened several smaller edge cases (namespaces, literal-text elements, <code>isValidAttribute()</code>), thanks <a href="https://github.com/artiphishell"><code>@​artiphishell</code></a></li>
<li>Added a purify-edge test runner as a compatibility check, thanks <a href="https://github.com/anzal1"><code>@​anzal1</code></a></li>
<li>Clarified the <code>IN_PLACE</code> documentation in the README about possible risks</li>
<li>Updated several dependencies</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>a77a3e7</code></a> release: 3.4.17 (<a href="">#1672</a>)</li>
<li>See full diff in <a href="https://github.com/cure53/DOMPurify/compare/3.4.16...3.4.17">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=dompurify&package-manager=npm_and_yarn&previous-version=3.4.16&new-version=3.4.17)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a40ffe7695b5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.