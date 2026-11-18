# Issue

**Title:** Bump pillow from 8.4.0 to 9.0.0

## Description

Bumps [pillow](https://github.com/python-pillow/Pillow) from 8.4.0 to 9.0.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/python-pillow/Pillow/releases">pillow's releases</a>.</em></p>
<blockquote>
<h2>9.0.0</h2>
<p><a href="https://pillow.readthedocs.io/en/stable/releasenotes/9.0.0.html">https://pillow.readthedocs.io/en/stable/releasenotes/9.0.0.html</a></p>
<h2>Changes</h2>
<ul>
<li>Restrict builtins for ImageMath.eval() <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5923">#5923</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Ensure JpegImagePlugin stops at the end of a truncated file <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5921">#5921</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Fixed ImagePath.Path array handling <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5920">#5920</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Remove consecutive duplicate tiles that only differ by their offset <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5919">#5919</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Removed redundant part of condition <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5915">#5915</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Explicitly enable strip chopping for large uncompressed TIFFs <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5517">#5517</a> [<a href="https://github.com/kmilos"><code>@​kmilos</code></a>]</li>
<li>Use the Windows method to get TCL functions on Cygwin <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5807">#5807</a> [<a href="https://github.com/DWesl"><code>@​DWesl</code></a>]</li>
<li>Changed error type to allow for incremental WebP parsing <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5404">#5404</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Improved I;16 operations on big endian <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5901">#5901</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Ensure that BMP pixel data offset does not ignore palette <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5899">#5899</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Limit quantized palette to number of colors <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5879">#5879</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Use latin1 encoding to decode bytes <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5870">#5870</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Fixed palette index for zeroed color in FASTOCTREE quantize <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5869">#5869</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>When saving RGBA to GIF, make use of first transparent palette entry <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5859">#5859</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Pass SAMPLEFORMAT to libtiff <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5848">#5848</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Added rounding when converting P and PA <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5824">#5824</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Improved putdata() documentation and data handling <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5910">#5910</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Exclude carriage return in PDF regex to help prevent ReDoS <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5912">#5912</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Image.NONE is only used for resampling and dithers <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5908">#5908</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Fixed freeing pointer in ImageDraw.Outline.transform <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5909">#5909</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Add Tidelift alignment action and badge <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5763">#5763</a> [<a href="https://github.com/aclark4life"><code>@​aclark4life</code></a>]</li>
<li>Replaced further direct invocations of setup.py <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5906">#5906</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Added ImageShow support for xdg-open <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5897">#5897</a> [<a href="https://github.com/m-shinder"><code>@​m-shinder</code></a>]</li>
<li>Fixed typo <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5902">#5902</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Switched from deprecated &quot;setup.py install&quot; to &quot;pip install .&quot; <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5896">#5896</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Support 16-bit grayscale ImageQt conversion <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5856">#5856</a> [<a href="https://github.com/cmbruns"><code>@​cmbruns</code></a>]</li>
<li>Fixed raising OSError in _safe_read when size is greater than SAFEBLOCK <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5872">#5872</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Convert subsequent GIF frames to RGB or RGBA <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5857">#5857</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>WebP: Fix memory leak during decoding on failure <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5798">#5798</a> [<a href="https://github.com/ilai-deutel"><code>@​ilai-deutel</code></a>]</li>
<li>Do not prematurely return in ImageFile when saving to stdout <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5665">#5665</a> [<a href="https://github.com/infmagic2047"><code>@​infmagic2047</code></a>]</li>
<li>Added support for top right and bottom right TGA orientations <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5829">#5829</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Corrected ICNS file length in header <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5845">#5845</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Block tile TIFF tags when saving <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5839">#5839</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Added line width argument to ImageDraw polygon <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5694">#5694</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Do not redeclare class each time when converting to NumPy <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5844">#5844</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Only prevent repeated polygon pixels when drawing with transparency <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5835">#5835</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Fix pushes_fd method signature <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5833">#5833</a> [<a href="https://github.com/hoodmane"><code>@​hoodmane</code></a>]</li>
<li>Add support for pickling TrueType fonts <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5826">#5826</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
<li>Only prefer command line tools SDK on macOS over default MacOSX SDK <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5828">#5828</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Fix compilation on 64-bit Termux <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5793">#5793</a> [<a href="https://github.com/landfillbaby"><code>@​landfillbaby</code></a>]</li>
<li>Replace 'setup.py sdist' with '-m build --sdist' <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5785">#5785</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
<li>Use declarative package configuration <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5784">#5784</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
<li>Use title for display in ImageShow <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5788">#5788</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Fix for PyQt6 <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5775">#5775</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/python-pillow/Pillow/blob/main/CHANGES.rst">pillow's changelog</a>.</em></p>
<blockquote>
<h2>9.0.0 (2022-01-02)</h2>
<ul>
<li>
<p>Restrict builtins for ImageMath.eval(). CVE-2022-22817 <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5923">#5923</a>
[radarhere]</p>
</li>
<li>
<p>Ensure JpegImagePlugin stops at the end of a truncated file <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5921">#5921</a>
[radarhere]</p>
</li>
<li>
<p>Fixed ImagePath.Path array handling. CVE-2022-22815, CVE-2022-22816 <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5920">#5920</a>
[radarhere]</p>
</li>
<li>
<p>Remove consecutive duplicate tiles that only differ by their offset <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5919">#5919</a>
[radarhere]</p>
</li>
<li>
<p>Improved I;16 operations on big endian <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5901">#5901</a>
[radarhere]</p>
</li>
<li>
<p>Limit quantized palette to number of colors <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5879">#5879</a>
[radarhere]</p>
</li>
<li>
<p>Fixed palette index for zeroed color in FASTOCTREE quantize <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5869">#5869</a>
[radarhere]</p>
</li>
<li>
<p>When saving RGBA to GIF, make use of first transparent palette entry <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5859">#5859</a>
[radarhere]</p>
</li>
<li>
<p>Pass SAMPLEFORMAT to libtiff <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5848">#5848</a>
[radarhere]</p>
</li>
<li>
<p>Added rounding when converting P and PA <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5824">#5824</a>
[radarhere]</p>
</li>
<li>
<p>Improved putdata() documentation and data handling <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5910">#5910</a>
[radarhere]</p>
</li>
<li>
<p>Exclude carriage return in PDF regex to help prevent ReDoS <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5912">#5912</a>
[hugovk]</p>
</li>
<li>
<p>Fixed freeing pointer in ImageDraw.Outline.transform <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5909">#5909</a>
[radarhere]</p>
</li>
<li>
<p>Added ImageShow support for xdg-open <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5897">#5897</a>
[m-shinder, radarhere]</p>
</li>
<li>
<p>Support 16-bit grayscale ImageQt conversion <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5856">#5856</a>
[cmbruns, radarhere]</p>
</li>
<li>
<p>Convert subsequent GIF frames to RGB or RGBA <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5857">#5857</a>
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
<li><a href=""><code>82541b6</code></a> 9.0.0 version bump</li>
<li><a href=""><code>cae5ac4</code></a> Merge pull request <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5924">#5924</a> from radarhere/cves</li>
<li><a href=""><code>ed4cf78</code></a> CVEs TBD</li>
<li><a href=""><code>d7f60d1</code></a> Merge pull request <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5923">#5923</a> from radarhere/imagemath_eval</li>
<li><a href=""><code>8531b01</code></a> Restrict builtins for ImageMath.eval</li>
<li><a href=""><code>1efb1d9</code></a> Merge pull request <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5922">#5922</a> from radarhere/releasenotes</li>
<li><a href=""><code>f6c7871</code></a> Added release notes for <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5919">#5919</a>, <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5920">#5920</a> and <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5921">#5921</a></li>
<li><a href=""><code>032d2dc</code></a> Update CHANGES.rst [ci skip]</li>
<li><a href=""><code>baae9ec</code></a> Merge pull request <a href="https://github-redirect.dependabot.com/python-pillow/Pillow/issues/5921">#5921</a> from radarhere/jpeg_eoi</li>
<li><a href=""><code>1059eb5</code></a> If appended EOI did not work, do not keep trying</li>
<li>Additional commits viewable in <a href="https://github.com/python-pillow/Pillow/compare/8.4.0...9.0.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pillow&package-manager=pip&previous-version=8.4.0&new-version=9.0.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f2eabd777938`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.