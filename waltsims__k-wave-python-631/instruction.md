# Issue

**Title:** Bump requests from 2.32.3 to 2.32.5

## Description

Bumps [requests](https://github.com/psf/requests) from 2.32.3 to 2.32.5.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/psf/requests/releases">requests's releases</a>.</em></p>
<blockquote>
<h2>v2.32.5</h2>
<h2>2.32.5 (2025-08-18)</h2>
<p><strong>Bugfixes</strong></p>
<ul>
<li>The SSLContext caching feature originally introduced in 2.32.0 has created
a new class of issues in Requests that have had negative impact across a number
of use cases. The Requests team has decided to revert this feature as long term
maintenance of it is proving to be unsustainable in its current iteration.</li>
</ul>
<p><strong>Deprecations</strong></p>
<ul>
<li>Added support for Python 3.14.</li>
<li>Dropped support for Python 3.8 following its end of support.</li>
</ul>
<h2>v2.32.4</h2>
<h2>2.32.4 (2025-06-10)</h2>
<p><strong>Security</strong></p>
<ul>
<li>CVE-2024-47081 Fixed an issue where a maliciously crafted URL and trusted
environment will retrieve credentials for the wrong hostname/machine from a
netrc file. (<a href="">#6965</a>)</li>
</ul>
<p><strong>Improvements</strong></p>
<ul>
<li>Numerous documentation improvements</li>
</ul>
<p><strong>Deprecations</strong></p>
<ul>
<li>Added support for pypy 3.11 for Linux and macOS. (<a href="">#6926</a>)</li>
<li>Dropped support for pypy 3.9 following its end of support. (<a href="">#6926</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/psf/requests/blob/main/HISTORY.md">requests's changelog</a>.</em></p>
<blockquote>
<h2>2.32.5 (2025-08-18)</h2>
<p><strong>Bugfixes</strong></p>
<ul>
<li>The SSLContext caching feature originally introduced in 2.32.0 has created
a new class of issues in Requests that have had negative impact across a number
of use cases. The Requests team has decided to revert this feature as long term
maintenance of it is proving to be unsustainable in its current iteration.</li>
</ul>
<p><strong>Deprecations</strong></p>
<ul>
<li>Added support for Python 3.14.</li>
<li>Dropped support for Python 3.8 following its end of support.</li>
</ul>
<h2>2.32.4 (2025-06-10)</h2>
<p><strong>Security</strong></p>
<ul>
<li>CVE-2024-47081 Fixed an issue where a maliciously crafted URL and trusted
environment will retrieve credentials for the wrong hostname/machine from a
netrc file.</li>
</ul>
<p><strong>Improvements</strong></p>
<ul>
<li>Numerous documentation improvements</li>
</ul>
<p><strong>Deprecations</strong></p>
<ul>
<li>Added support for pypy 3.11 for Linux and macOS.</li>
<li>Dropped support for pypy 3.9 following its end of support.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b25c87d</code></a> v2.32.5</li>
<li><a href=""><code>131e506</code></a> Merge pull request <a href="">#7010</a> from psf/dependabot/github_actions/actions/checkout-...</li>
<li><a href=""><code>b336cb2</code></a> Bump actions/checkout from 4.2.0 to 5.0.0</li>
<li><a href=""><code>46e939b</code></a> Update publish workflow to use <code>artifact-id</code> instead of <code>name</code></li>
<li><a href=""><code>4b9c546</code></a> Merge pull request <a href="">#6999</a> from psf/dependabot/github_actions/step-security/har...</li>
<li><a href=""><code>7618dbe</code></a> Bump step-security/harden-runner from 2.12.0 to 2.13.0</li>
<li><a href=""><code>2edca11</code></a> Add support for Python 3.14 and drop support for Python 3.8 (<a href="">#6993</a>)</li>
<li><a href=""><code>fec96cd</code></a> Update Makefile rules (<a href="">#6996</a>)</li>
<li><a href=""><code>d58d8aa</code></a> docs: clarify timeout parameter uses seconds in Session.request (<a href="">#6994</a>)</li>
<li><a href=""><code>91a3eab</code></a> Bump github/codeql-action from 3.28.5 to 3.29.0</li>
<li>Additional commits viewable in <a href="https://github.com/psf/requests/compare/v2.32.3...v2.32.5">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=requests&package-manager=pip&previous-version=2.32.3&new-version=2.32.5)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `96441a424ce3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.