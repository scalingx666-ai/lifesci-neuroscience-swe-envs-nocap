# Issue

**Title:** Bump pillow from 9.1.0 to 9.1.1

## Description

Bumps [pillow](https://github.com/python-pillow/Pillow) from 9.1.0 to 9.1.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/python-pillow/Pillow/releases">pillow's releases</a>.</em></p>
<blockquote>
<h2>9.1.1</h2>
<p>This release addresses several security problems.</p>
<p><a href="https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-30595">CVE-2022-30595</a>: When reading a TGA file with RLE packets that cross scan lines, Pillow reads the information past the end of the first line without deducting that from the length of the remaining file data. This vulnerability was introduced in Pillow 9.1.0, and can cause a heap buffer overflow.</p>
<p>Opening an image with a zero or negative height has been found to bypass a decompression bomb check. This will now raise a <a href="https://docs.python.org/3/library/exceptions.html#SyntaxError"><code>SyntaxError</code></a> instead, in turn raising a <code>PIL.UnidentifiedImageError</code>.</p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/python-pillow/Pillow/blob/main/CHANGES.rst">pillow's changelog</a>.</em></p>
<blockquote>
<h2>9.1.1 (2022-05-17)</h2>
<ul>
<li>
<p>When reading past the end of a TGA scan line, reduce bytes left. CVE-2022-30595
[radarhere]</p>
</li>
<li>
<p>Do not open images with zero or negative height <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/6269">#6269</a>
[radarhere]</p>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>0f44136</code></a> 9.1.1 version bump</li>
<li><a href=""><code>f66f5e1</code></a> pre-commit: update Black to fix Click</li>
<li><a href=""><code>0153b37</code></a> Skip test_realloc_overflow unless libtiff 4.0.4 or higher</li>
<li><a href=""><code>6fcd31b</code></a> Added release notes for 9.1.1</li>
<li><a href=""><code>c846cc8</code></a> When reading past the end of a scan line, reduce bytes left</li>
<li><a href=""><code>184b73e</code></a> Do not open images with zero or negative height</li>
<li>See full diff in <a href="https://github.com/python-pillow/Pillow/compare/9.1.0...9.1.1">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pillow&package-manager=pip&previous-version=9.1.0&new-version=9.1.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/BindsNET/bindsnet/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5163fcc5175f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.