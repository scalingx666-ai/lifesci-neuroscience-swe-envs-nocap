# Issue

**Title:** Bump glob-parent from 5.1.0 to 5.1.2

## Description

Bumps [glob-parent](https://github.com/gulpjs/glob-parent) from 5.1.0 to 5.1.2.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/gulpjs/glob-parent/releases">glob-parent's releases</a>.</em></p>
<blockquote>
<h2>v5.1.2</h2>
<h3>Bug Fixes</h3>
<ul>
<li>eliminate ReDoS (<a href="https://github-redirect.dependabot.com/gulpjs/glob-parent/issues/36">#36</a>) (<a href="">f923116</a>)</li>
</ul>
<h2>v5.1.1</h2>
<h3>Bug Fixes</h3>
<ul>
<li>unescape exclamation mark (<a href="https://github-redirect.dependabot.com/gulpjs/glob-parent/issues/26">#26</a>) (<a href="">a98874f</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/gulpjs/glob-parent/blob/main/CHANGELOG.md">glob-parent's changelog</a>.</em></p>
<blockquote>
<h3><a href="https://github.com/gulpjs/glob-parent/compare/v5.1.1...v5.1.2">5.1.2</a> (2021-03-06)</h3>
<h3>Bug Fixes</h3>
<ul>
<li>eliminate ReDoS (<a href="https://github-redirect.dependabot.com/gulpjs/glob-parent/issues/36">#36</a>) (<a href="">f923116</a>)</li>
</ul>
<h2><a href="https://www.github.com/gulpjs/glob-parent/compare/v5.1.2...v6.0.0">6.0.0</a> (2021-05-03)</h2>
<h3>⚠ BREAKING CHANGES</h3>
<ul>
<li>Correct mishandled escaped path separators (<a href="https://github-redirect.dependabot.com/gulpjs/glob-parent/issues/34">#34</a>)</li>
<li>upgrade scaffold, dropping node &lt;10 support</li>
</ul>
<h3>Bug Fixes</h3>
<ul>
<li>Correct mishandled escaped path separators (<a href="https://github-redirect.dependabot.com/gulpjs/glob-parent/issues/34">#34</a>) (<a href="">32f6d52</a>), closes <a href="https://github-redirect.dependabot.com/gulpjs/glob-parent/issues/32">#32</a></li>
</ul>
<h3>Miscellaneous Chores</h3>
<ul>
<li>upgrade scaffold, dropping node &lt;10 support (<a href="">e83d0c5</a>)</li>
</ul>
<h3><a href="https://github.com/gulpjs/glob-parent/compare/v5.1.0...v5.1.1">5.1.1</a> (2021-01-27)</h3>
<h3>Bug Fixes</h3>
<ul>
<li>unescape exclamation mark (<a href="https://github-redirect.dependabot.com/gulpjs/glob-parent/issues/26">#26</a>) (<a href="">a98874f</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>eb2c439</code></a> chore: update changelog</li>
<li><a href=""><code>12bcb6c</code></a> chore: release 5.1.2</li>
<li><a href=""><code>f923116</code></a> fix: eliminate ReDoS (<a href="https://github-redirect.dependabot.com/gulpjs/glob-parent/issues/36">#36</a>)</li>
<li><a href=""><code>0b014a7</code></a> chore: add JSDoc returns information (<a href="https://github-redirect.dependabot.com/gulpjs/glob-parent/issues/33">#33</a>)</li>
<li><a href=""><code>2b24ebd</code></a> chore: generate initial changelog</li>
<li><a href=""><code>9b6e874</code></a> chore: release 5.1.1</li>
<li><a href=""><code>749c35e</code></a> ci: try wrapping the JOB_ID in a string</li>
<li><a href=""><code>5d39def</code></a> ci: attempt to switch to published coveralls</li>
<li><a href=""><code>0b5b37f</code></a> ci: put the npm step back in for only Windows</li>
<li><a href=""><code>473f5d8</code></a> ci: update azure build images</li>
<li>Additional commits viewable in <a href="https://github.com/gulpjs/glob-parent/compare/v5.1.0...v5.1.2">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=glob-parent&package-manager=npm_and_yarn&previous-version=5.1.0&new-version=5.1.2)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)
- `@dependabot use these labels` will set the current labels as the default for future PRs for this repo and language
- `@dependabot use these reviewers` will set the current reviewers as the default for future PRs for this repo and language
- `@dependabot use these assignees` will set the current assignees as the default for future PRs for this repo and language
- `@dependabot use this milestone` will set the current milestone as the default for future PRs for this repo and language

You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/patrickjquinn/P-Brain.ai/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b32799b2dd2b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.