# Issue

**Title:** Bump pillow from 10.0.1 to 10.2.0 in /tvb_library

## Description

Bumps [pillow](https://github.com/python-pillow/Pillow) from 10.0.1 to 10.2.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/python-pillow/Pillow/releases">pillow's releases</a>.</em></p>
<blockquote>
<h2>10.2.0</h2>
<p><a href="https://pillow.readthedocs.io/en/stable/releasenotes/10.2.0.html">https://pillow.readthedocs.io/en/stable/releasenotes/10.2.0.html</a></p>
<h2>Changes</h2>
<ul>
<li>Add <code>keep_rgb</code> option when saving JPEG to prevent conversion of RGB colorspace <a href="">#7553</a> [<a href="https://github.com/bgilbert"><code>@​bgilbert</code></a>]</li>
<li>Trim negative glyph offsets in ImageFont.getmask() <a href="">#7672</a> [<a href="https://github.com/nulano"><code>@​nulano</code></a>]</li>
<li>Removed unnecessary &quot;pragma: no cover&quot; <a href="">#7668</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Trim glyph size in ImageFont.getmask() <a href="">#7669</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Fix loading IPTC images and update test <a href="">#7667</a> [<a href="https://github.com/nulano"><code>@​nulano</code></a>]</li>
<li>Allow uncompressed TIFF images to be saved in chunks <a href="">#7650</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Concatenate multiple JPEG EXIF markers <a href="">#7496</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Changed IPTC tile tuple to match other plugins <a href="">#7661</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Do not assign new fp attribute when exiting context manager <a href="">#7566</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Support arbitrary masks for uncompressed RGB DDS images <a href="">#7589</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Support setting ROWSPERSTRIP tag <a href="">#7654</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Apply ImageFont.MAX_STRING_LENGTH to ImageFont.getmask() <a href="">#7662</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Optimise <code>ImageColor</code> using <code>functools.lru_cache</code> <a href="">#7657</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
<li>Restricted environment keys for ImageMath.eval() <a href="">#7655</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Optimise <code>ImageMode.getmode</code> using <code>functools.lru_cache</code> <a href="">#7641</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
<li>Added trusted PyPI publishing <a href="">#7616</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Compile FriBiDi for Windows ARM64 <a href="">#7629</a> [<a href="https://github.com/nulano"><code>@​nulano</code></a>]</li>
<li>Fix incorrect color blending for overlapping glyphs <a href="">#7497</a> [<a href="https://github.com/ZachNagengast"><code>@​ZachNagengast</code></a>]</li>
<li>Add .git-blame-ignore-revs file <a href="">#7528</a> [<a href="https://github.com/akx"><code>@​akx</code></a>]</li>
<li>Attempt memory mapping when tile args is a string <a href="">#7565</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Fill identical pixels with transparency in subsequent frames when saving GIF <a href="">#7568</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Removed unnecessary string length check <a href="">#7560</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Determine mask mode in Python instead of C <a href="">#7548</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Corrected duration when combining multiple GIF frames into single frame <a href="">#7521</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Handle disposing GIF background from outside palette <a href="">#7515</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Seek past the data when skipping a PSD layer <a href="">#7483</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>ImageMath: Inline <code>isinstance</code> check <a href="">#7623</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
<li>Update actions/upload-artifact action to v4 <a href="">#7619</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Import plugins relative to the module <a href="">#7576</a> [<a href="https://github.com/deliangyang"><code>@​deliangyang</code></a>]</li>
<li>Translate encoder error codes to strings; deprecate <code>ImageFile.raise_oserror()</code> <a href="">#7609</a> [<a href="https://github.com/bgilbert"><code>@​bgilbert</code></a>]</li>
<li>Updated readthedocs to latest version of Python <a href="">#7611</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Support reading BC4U and DX10 BC1 images <a href="">#6486</a> [<a href="https://github.com/REDxEYE"><code>@​REDxEYE</code></a>]</li>
<li>Optimize ImageStat.Stat.extrema <a href="">#7593</a> [<a href="https://github.com/florath"><code>@​florath</code></a>]</li>
<li>Handle pathlib.Path in FreeTypeFont <a href="">#7578</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Use list comprehensions to create transformed lists <a href="">#7597</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
<li>Added support for reading DX10 BC4 DDS images <a href="">#7603</a> [<a href="https://github.com/sambvfx"><code>@​sambvfx</code></a>]</li>
<li>Optimized ImageStat.Stat.count <a href="">#7599</a> [<a href="https://github.com/florath"><code>@​florath</code></a>]</li>
<li>Moved error from truetype() to FreeTypeFont <a href="">#7587</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Correct PDF palette size when saving <a href="">#7555</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Fixed closing file pointer with olefile 0.47 <a href="">#7594</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>ruff: Minor optimizations of list comprehensions, x in set, etc. <a href="">#7524</a> [<a href="https://github.com/cclauss"><code>@​cclauss</code></a>]</li>
<li>Build Windows wheels using cibuildwheel <a href="">#7580</a> [<a href="https://github.com/nulano"><code>@​nulano</code></a>]</li>
<li>Raise ValueError when TrueType font size is zero or less <a href="">#7584</a> [<a href="https://github.com/akx"><code>@​akx</code></a>]</li>
<li>Install cibuildwheel from requirements file <a href="">#7581</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/python-pillow/Pillow/blob/main/CHANGES.rst">pillow's changelog</a>.</em></p>
<blockquote>
<h2>10.2.0 (2024-01-02)</h2>
<ul>
<li>
<p>Add <code>keep_rgb</code> option when saving JPEG to prevent conversion of RGB colorspace <a href="">#7553</a>
[bgilbert, radarhere]</p>
</li>
<li>
<p>Trim glyph size in ImageFont.getmask() <a href="">#7669</a>, <a href="">#7672</a>
[radarhere, nulano]</p>
</li>
<li>
<p>Deprecate IptcImagePlugin helpers <a href="">#7664</a>
[nulano, hugovk, radarhere]</p>
</li>
<li>
<p>Allow uncompressed TIFF images to be saved in chunks <a href="">#7650</a>
[radarhere]</p>
</li>
<li>
<p>Concatenate multiple JPEG EXIF markers <a href="">#7496</a>
[radarhere]</p>
</li>
<li>
<p>Changed IPTC tile tuple to match other plugins <a href="">#7661</a>
[radarhere]</p>
</li>
<li>
<p>Do not assign new fp attribute when exiting context manager <a href="">#7566</a>
[radarhere]</p>
</li>
<li>
<p>Support arbitrary masks for uncompressed RGB DDS images <a href="">#7589</a>
[radarhere, akx]</p>
</li>
<li>
<p>Support setting ROWSPERSTRIP tag <a href="">#7654</a>
[radarhere]</p>
</li>
<li>
<p>Apply ImageFont.MAX_STRING_LENGTH to ImageFont.getmask() <a href="">#7662</a>
[radarhere]</p>
</li>
<li>
<p>Optimise <code>ImageColor</code> using <code>functools.lru_cache</code> <a href="">#7657</a>
[hugovk]</p>
</li>
<li>
<p>Restricted environment keys for ImageMath.eval() <a href="">#7655</a>
[wiredfool, radarhere]</p>
</li>
<li>
<p>Optimise <code>ImageMode.getmode</code> using <code>functools.lru_cache</code> <a href="">#7641</a>
[hugovk, radarhere]</p>
</li>
<li>
<p>Fix incorrect color blending for overlapping glyphs <a href="">#7497</a>
[ZachNagengast, nulano, radarhere]</p>
</li>
<li>
<p>Attempt memory mapping when tile args is a string <a href="">#7565</a>
[radarhere]</p>
</li>
<li>
<p>Fill identical pixels with transparency in subsequent frames when saving GIF <a href="">#7568</a>
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
<li><a href=""><code>6956d0b</code></a> 10.2.0 version bump</li>
<li><a href=""><code>31c8dac</code></a> Merge pull request <a href="">#7675</a> from python-pillow/pre-commit-ci-update-config</li>
<li><a href=""><code>40a3f91</code></a> Merge pull request <a href="">#7674</a> from nulano/url-example</li>
<li><a href=""><code>cb41b0c</code></a> [pre-commit.ci] pre-commit autoupdate</li>
<li><a href=""><code>de62b25</code></a> fix image url in &quot;Reading from URL&quot; example</li>
<li><a href=""><code>7c526a6</code></a> Update CHANGES.rst [ci skip]</li>
<li><a href=""><code>d93a5ad</code></a> Merge pull request <a href="">#7553</a> from bgilbert/jpeg-rgb</li>
<li><a href=""><code>aed764f</code></a> Update CHANGES.rst [ci skip]</li>
<li><a href=""><code>f8df530</code></a> Merge pull request <a href="">#7672</a> from nulano/imagefont-negative-crop</li>
<li><a href=""><code>24e9485</code></a> Merge pull request <a href="">#7671</a> from radarhere/imagetransform</li>
<li>Additional commits viewable in <a href="https://github.com/python-pillow/Pillow/compare/10.0.1...10.2.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pillow&package-manager=pip&previous-version=10.0.1&new-version=10.2.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/the-virtual-brain/tvb-root/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fcaf75998a84`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.