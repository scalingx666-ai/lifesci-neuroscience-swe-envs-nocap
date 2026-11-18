# Issue

**Title:** Bump requests from 2.32.2 to 2.32.4

## Description

Bumps [requests](https://github.com/psf/requests) from 2.32.2 to 2.32.4.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/psf/requests/releases">requests's releases</a>.</em></p>
<blockquote>
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
<h2>v2.32.3</h2>
<h2>2.32.3 (2024-05-29)</h2>
<p><strong>Bugfixes</strong></p>
<ul>
<li>Fixed bug breaking the ability to specify custom SSLContexts in sub-classes of
HTTPAdapter. (<a href="">#6716</a>)</li>
<li>Fixed issue where Requests started failing to run on Python versions compiled
without the <code>ssl</code> module. (<a href="">#6724</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/psf/requests/blob/main/HISTORY.md">requests's changelog</a>.</em></p>
<blockquote>
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
<h2>2.32.3 (2024-05-29)</h2>
<p><strong>Bugfixes</strong></p>
<ul>
<li>Fixed bug breaking the ability to specify custom SSLContexts in sub-classes of
HTTPAdapter. (<a href="">#6716</a>)</li>
<li>Fixed issue where Requests started failing to run on Python versions compiled
without the <code>ssl</code> module. (<a href="">#6724</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>021dc72</code></a> Polish up release tooling for last manual release</li>
<li><a href=""><code>821770e</code></a> Bump version and add release notes for v2.32.4</li>
<li><a href=""><code>59f8aa2</code></a> Add netrc file search information to authentication documentation (<a href="">#6876</a>)</li>
<li><a href=""><code>5b4b64c</code></a> Add more tests to prevent regression of CVE 2024 47081</li>
<li><a href=""><code>7bc4587</code></a> Add new test to check netrc auth leak (<a href="">#6962</a>)</li>
<li><a href=""><code>96ba401</code></a> Only use hostname to do netrc lookup instead of netloc</li>
<li><a href=""><code>7341690</code></a> Merge pull request <a href="">#6951</a> from tswast/patch-1</li>
<li><a href=""><code>6716d7c</code></a> remove links</li>
<li><a href=""><code>a7e1c74</code></a> Update docs/conf.py</li>
<li><a href=""><code>c799b81</code></a> docs: fix dead links to kenreitz.org</li>
<li>Additional commits viewable in <a href="https://github.com/psf/requests/compare/v2.32.2...v2.32.4">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=requests&package-manager=pip&previous-version=2.32.2&new-version=2.32.4)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/aplbrain/dotmotif/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f3fb47878231`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.