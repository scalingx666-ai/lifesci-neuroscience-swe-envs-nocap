# Issue

**Title:** Bump pillow from 8.2.0 to 8.3.2

## Description

Bumps [pillow](https://github.com/python-pillow/Pillow) from 8.2.0 to 8.3.2.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/python-pillow/Pillow/releases">pillow's releases</a>.</em></p>
<blockquote>
<h2>8.3.2</h2>
<p><a href="https://pillow.readthedocs.io/en/stable/releasenotes/8.3.2.html">https://pillow.readthedocs.io/en/stable/releasenotes/8.3.2.html</a></p>
<h2>Security</h2>
<ul>
<li>
<p>CVE-2021-23437 Raise ValueError if color specifier is too long
[hugovk, radarhere]</p>
</li>
<li>
<p>Fix 6-byte OOB read in FliDecode
[wiredfool]</p>
</li>
</ul>
<h2>Python 3.10 wheels</h2>
<ul>
<li>Add support for Python 3.10 <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5569">#5569</a>, <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5570">#5570</a>
[hugovk, radarhere]</li>
</ul>
<h2>Fixed regressions</h2>
<ul>
<li>
<p>Ensure TIFF <code>RowsPerStrip</code> is multiple of 8 for JPEG compression <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5588">#5588</a>
[kmilos, radarhere]</p>
</li>
<li>
<p>Updates for <code>ImagePalette</code> channel order <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5599">#5599</a>
[radarhere]</p>
</li>
<li>
<p>Hide FriBiDi shim symbols to avoid conflict with real FriBiDi library <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5651">#5651</a>
[nulano]</p>
</li>
</ul>
<h2>8.3.1</h2>
<p><a href="https://pillow.readthedocs.io/en/stable/releasenotes/8.3.1.html">https://pillow.readthedocs.io/en/stable/releasenotes/8.3.1.html</a></p>
<h2>Changes</h2>
<ul>
<li>Catch OSError when checking if fp is sys.stdout <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5585">#5585</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Handle removing orientation from alternate types of EXIF data <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5584">#5584</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Make Image.<strong>array</strong> take optional dtype argument <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5572">#5572</a> [<a href="https://github.com/t-vi"><code>@​t-vi</code></a>]</li>
</ul>
<h2>8.3.0</h2>
<p><a href="https://pillow.readthedocs.io/en/stable/releasenotes/8.3.0.html">https://pillow.readthedocs.io/en/stable/releasenotes/8.3.0.html</a></p>
<h2>Changes</h2>
<ul>
<li>Use snprintf instead of sprintf <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5567">#5567</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Limit TIFF strip size when saving with LibTIFF <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5514">#5514</a> [<a href="https://github.com/kmilos"><code>@​kmilos</code></a>]</li>
<li>Allow ICNS save on all operating systems <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/4526">#4526</a> [<a href="https://github.com/newpanjing"><code>@​newpanjing</code></a>]</li>
<li>De-zigzag JPEG's DQT when loading; deprecate convert_dict_qtables <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/4989">#4989</a> [<a href="https://github.com/gofr"><code>@​gofr</code></a>]</li>
<li>Do not use background or transparency index for new color <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5564">#5564</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Simplified code <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5315">#5315</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Replaced xml.etree.ElementTree <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5565">#5565</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/python-pillow/Pillow/blob/main/CHANGES.rst">pillow's changelog</a>.</em></p>
<blockquote>
<h2>8.3.2 (2021-09-02)</h2>
<ul>
<li>
<p>CVE-2021-23437 Raise ValueError if color specifier is too long
[hugovk, radarhere]</p>
</li>
<li>
<p>Fix 6-byte OOB read in FliDecode
[wiredfool]</p>
</li>
<li>
<p>Add support for Python 3.10 <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5569">#5569</a>, <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5570">#5570</a>
[hugovk, radarhere]</p>
</li>
<li>
<p>Ensure TIFF <code>RowsPerStrip</code> is multiple of 8 for JPEG compression <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5588">#5588</a>
[kmilos, radarhere]</p>
</li>
<li>
<p>Updates for <code>ImagePalette</code> channel order <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5599">#5599</a>
[radarhere]</p>
</li>
<li>
<p>Hide FriBiDi shim symbols to avoid conflict with real FriBiDi library <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5651">#5651</a>
[nulano]</p>
</li>
</ul>
<h2>8.3.1 (2021-07-06)</h2>
<ul>
<li>
<p>Catch OSError when checking if fp is sys.stdout <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5585">#5585</a>
[radarhere]</p>
</li>
<li>
<p>Handle removing orientation from alternate types of EXIF data <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5584">#5584</a>
[radarhere]</p>
</li>
<li>
<p>Make Image.<strong>array</strong> take optional dtype argument <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5572">#5572</a>
[t-vi, radarhere]</p>
</li>
</ul>
<h2>8.3.0 (2021-07-01)</h2>
<ul>
<li>
<p>Use snprintf instead of sprintf. CVE-2021-34552 <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5567">#5567</a>
[radarhere]</p>
</li>
<li>
<p>Limit TIFF strip size when saving with LibTIFF <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5514">#5514</a>
[kmilos]</p>
</li>
<li>
<p>Allow ICNS save on all operating systems <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/4526">#4526</a>
[baletu, radarhere, newpanjing, hugovk]</p>
</li>
<li>
<p>De-zigzag JPEG's DQT when loading; deprecate convert_dict_qtables <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/4989">#4989</a>
[gofr, radarhere]</p>
</li>
<li>
<p>Replaced xml.etree.ElementTree <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5565">#5565</a>
[radarhere]</p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>8013f13</code></a> 8.3.2 version bump</li>
<li><a href=""><code>23c7ca8</code></a> Update CHANGES.rst</li>
<li><a href=""><code>8450366</code></a> Update release notes</li>
<li><a href=""><code>a0afe89</code></a> Update test case</li>
<li><a href=""><code>9e08eb8</code></a> Raise ValueError if color specifier is too long</li>
<li><a href=""><code>bd5cf7d</code></a> FLI tests for Oss-fuzz crash.</li>
<li><a href=""><code>94a0cf1</code></a> Fix 6-byte OOB read in FliDecode</li>
<li><a href=""><code>cece64f</code></a> Add 8.3.2 (2021-09-02) [CI skip]</li>
<li><a href=""><code>e422386</code></a> Add release notes for Pillow 8.3.2</li>
<li><a href=""><code>08dcbb8</code></a> Pillow 8.3.2 supports Python 3.10 [ci skip]</li>
<li>Additional commits viewable in <a href="https://github.com/python-pillow/Pillow/compare/8.2.0...8.3.2">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pillow&package-manager=pip&previous-version=8.2.0&new-version=8.3.2)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/JanCBrammer/biopeaks/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2d43d544c18e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.