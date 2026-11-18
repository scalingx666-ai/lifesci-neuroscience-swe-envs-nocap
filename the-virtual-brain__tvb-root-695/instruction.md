# Issue

**Title:** Bump pillow from 9.4.0 to 10.0.1 in /tvb_library

## Description

Bumps [pillow](https://github.com/python-pillow/Pillow) from 9.4.0 to 10.0.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/python-pillow/Pillow/releases">pillow's releases</a>.</em></p>
<blockquote>
<h2>10.0.1</h2>
<p><a href="https://pillow.readthedocs.io/en/stable/releasenotes/10.0.1.html">https://pillow.readthedocs.io/en/stable/releasenotes/10.0.1.html</a></p>
<h2>Changes</h2>
<ul>
<li>Updated libwebp to 1.3.2 <a href="">#7395</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Updated zlib to 1.3 <a href="">#7344</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
</ul>
<h2>10.0.0</h2>
<p><a href="https://pillow.readthedocs.io/en/stable/releasenotes/10.0.0.html">https://pillow.readthedocs.io/en/stable/releasenotes/10.0.0.html</a></p>
<h2>Changes</h2>
<ul>
<li>Fixed deallocating mask images <a href="">#7246</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Added ImageFont.MAX_STRING_LENGTH <a href="">#7244</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Fix Windows build with pyproject.toml <a href="">#7230</a> [<a href="https://github.com/nulano"><code>@​nulano</code></a>]</li>
<li>Do not close provided file handles with libtiff <a href="">#7199</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Convert to HSV if mode is HSV in getcolor() <a href="">#7226</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Added alpha_only argument to getbbox() <a href="">#7123</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Prioritise speed in <em>repr_png</em> <a href="">#7242</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Limit size even if one dimension is zero in decompression bomb check <a href="">#7235</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Restored 32-bit support <a href="">#7234</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Removed deleted file from codecov.yml and increased coverage threshold <a href="">#7232</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Removed support for 32-bit <a href="">#7228</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Use --config-settings instead of deprecated --global-option <a href="">#7171</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Better C integer definitions <a href="">#6645</a> [<a href="https://github.com/Yay295"><code>@​Yay295</code></a>]</li>
<li>Fixed finding dependencies on Cygwin <a href="">#7175</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Improved checks in font_render <a href="">#7218</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Change <code>grabclipboard()</code> to use PNG compression on macOS <a href="">#7219</a> [<a href="https://github.com/abey79"><code>@​abey79</code></a>]</li>
<li>Added PyPy 3.10 and removed PyPy 3.8 <a href="">#7216</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Added in_place argument to ImageOps.exif_transpose() <a href="">#7092</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Corrected error code <a href="">#7177</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Use &quot;not in&quot; <a href="">#7174</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Only call text_layout once in getmask2 <a href="">#7206</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Fixed calling putpalette() on L and LA images before load() <a href="">#7187</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Removed unused INT64 definition <a href="">#7180</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Updated xz to 5.4.3 <a href="">#7136</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Fixed saving TIFF multiframe images with LONG8 tag types <a href="">#7078</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Do not set size unnecessarily if image fails to open <a href="">#7056</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Removed unused code <a href="">#7210</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Removed unused variables <a href="">#7205</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Fixed signedness comparison warning <a href="">#7203</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Fixed combining single duration across duplicate APNG frames <a href="">#7146</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Remove temporary file when error is raised <a href="">#7148</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Do not use temporary file when grabbing clipboard on Linux <a href="">#7200</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>If the clipboard fails to open on Windows, wait and try again <a href="">#7141</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Fixed saving multiple 1 mode frames to GIF <a href="">#7181</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Replaced absolute PIL import with relative import <a href="">#7173</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Removed files and types override <a href="">#7194</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/python-pillow/Pillow/blob/main/CHANGES.rst">pillow's changelog</a>.</em></p>
<blockquote>
<h2>10.0.1 (2023-09-15)</h2>
<ul>
<li>
<p>Updated libwebp to 1.3.2 <a href="">#7395</a>
[radarhere]</p>
</li>
<li>
<p>Updated zlib to 1.3 <a href="">#7344</a>
[radarhere]</p>
</li>
</ul>
<h2>10.0.0 (2023-07-01)</h2>
<ul>
<li>
<p>Fixed deallocating mask images <a href="">#7246</a>
[radarhere]</p>
</li>
<li>
<p>Added ImageFont.MAX_STRING_LENGTH <a href="">#7244</a>
[radarhere, hugovk]</p>
</li>
<li>
<p>Fix Windows build with pyproject.toml <a href="">#7230</a>
[hugovk, nulano, radarhere]</p>
</li>
<li>
<p>Do not close provided file handles with libtiff <a href="">#7199</a>
[radarhere]</p>
</li>
<li>
<p>Convert to HSV if mode is HSV in getcolor() <a href="">#7226</a>
[radarhere]</p>
</li>
<li>
<p>Added alpha_only argument to getbbox() <a href="">#7123</a>
[radarhere. hugovk]</p>
</li>
<li>
<p>Prioritise speed in <em>repr_png</em> <a href="">#7242</a>
[radarhere]</p>
</li>
<li>
<p>Do not use CFFI access by default on PyPy <a href="">#7236</a>
[radarhere]</p>
</li>
<li>
<p>Limit size even if one dimension is zero in decompression bomb check <a href="">#7235</a>
[radarhere]</p>
</li>
<li>
<p>Use --config-settings instead of deprecated --global-option <a href="">#7171</a>
[radarhere]</p>
</li>
<li>
<p>Better C integer definitions <a href="">#6645</a>
[Yay295, hugovk]</p>
</li>
<li>
<p>Fixed finding dependencies on Cygwin <a href="">#7175</a>
[radarhere]</p>
</li>
<li>
<p>Changed grabclipboard() to use PNG instead of JPG compression on macOS <a href="">#7219</a>
[abey79, radarhere]</p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>e34d346</code></a> Updated order</li>
<li><a href=""><code>a62f240</code></a> 10.0.1 version bump</li>
<li><a href=""><code>d50250d</code></a> Added release notes for 10.0.1</li>
<li><a href=""><code>b4c7d4b</code></a> Update CHANGES.rst [ci skip]</li>
<li><a href=""><code>730f746</code></a> Updated libwebp to 1.3.2</li>
<li><a href=""><code>b0e2804</code></a> Updated zlib to 1.3</li>
<li><a href=""><code>6e28ed1</code></a> 10.0.0 version bump</li>
<li><a href=""><code>c827f3b</code></a> Merge pull request <a href="">#7246</a> from radarhere/deallocate</li>
<li><a href=""><code>39a3b1d</code></a> Fixed deallocating mask images</li>
<li><a href=""><code>8c1dc81</code></a> Update CHANGES.rst [ci skip]</li>
<li>Additional commits viewable in <a href="https://github.com/python-pillow/Pillow/compare/9.4.0...10.0.1">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pillow&package-manager=pip&previous-version=9.4.0&new-version=10.0.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9c131bff1265`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.