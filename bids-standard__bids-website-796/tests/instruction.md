# Issue

**Title:** Bump pillow from 11.3.0 to 12.1.1

## Description

Bumps [pillow](https://github.com/python-pillow/Pillow) from 11.3.0 to 12.1.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/python-pillow/Pillow/releases">pillow's releases</a>.</em></p>
<blockquote>
<h2>12.1.1</h2>
<p><a href="https://pillow.readthedocs.io/en/stable/releasenotes/12.1.1.html">https://pillow.readthedocs.io/en/stable/releasenotes/12.1.1.html</a></p>
<h2>Dependencies</h2>
<ul>
<li>Patch libavif for svt-av1 4.0 compatibility <a href="">#9413</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
</ul>
<h2>Other changes</h2>
<ul>
<li>Fix OOB Write with invalid tile extents <a href="">#9427</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
</ul>
<h2>12.1.0</h2>
<p><a href="https://pillow.readthedocs.io/en/stable/releasenotes/12.1.0.html">https://pillow.readthedocs.io/en/stable/releasenotes/12.1.0.html</a></p>
<h2>Deprecations</h2>
<ul>
<li>Deprecate getdata(), in favour of new get_flattened_data() <a href="">#9292</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
</ul>
<h2>Documentation</h2>
<ul>
<li>Specify APNG duration type when opening <a href="">#9368</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Added release notes for <a href="">#9350</a> <a href="">#9366</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update ImageMorph documentation <a href="">#9349</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Docs: update major bump cadence <a href="">#9334</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
<li>Add release notes for <a href="">#9070</a> <a href="">#9320</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Updated Ubuntu version <a href="">#9306</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update macOS tested Pillow versions <a href="">#9265</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
</ul>
<h2>Dependencies</h2>
<ul>
<li>Update harfbuzz to 12.3.0 <a href="">#9355</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update xz to 5.8.2 <a href="">#9343</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Updated libjpeg-turbo to 3.1.3 <a href="">#9333</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Updated zlib-ng to 2.3.2 <a href="">#9324</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Updated libpng to 1.6.53 <a href="">#9325</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update actions/checkout action to v6 <a href="">#9323</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Update dependency mypy to v1.19.0 <a href="">#9322</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Updated libpng to 1.6.51 <a href="">#9305</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Updated brotli to 1.2.0 <a href="">#9284</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update libimagequant to 4.4.1 <a href="">#9301</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update zlib-ng to 2.3.1, except on manylinux2014 aarch64 <a href="">#9312</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Updated harfbuzz to 12.2.0 <a href="">#9289</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update github-actions <a href="">#9277</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
</ul>
<h2>Testing</h2>
<ul>
<li>Replace pre-commit with prek <a href="">#9360</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
<li>Test PyQt6 on Python 3.14 on Windows <a href="">#9353</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Test 32-bit Windows on Windows Server 2022 <a href="">#9345</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Correct variable type <a href="">#9335</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>5158d98</code></a> 12.1.1 version bump</li>
<li><a href=""><code>9000313</code></a> Fix OOB Write with invalid tile extents (<a href="">#9427</a>)</li>
<li><a href=""><code>cd01118</code></a> Patch libavif for svt-av1 4.0 compatibility</li>
<li><a href=""><code>46f45f6</code></a> 12.1.0 version bump</li>
<li><a href=""><code>c9ac097</code></a> Simplify band splitting (<a href="">#9291</a>)</li>
<li><a href=""><code>3baedf2</code></a> Deprecate getdata(), in favour of new get_flattened_data() (<a href="">#9292</a>)</li>
<li><a href=""><code>b51a036</code></a> Specify APNG duration type when opening (<a href="">#9368</a>)</li>
<li><a href=""><code>8d08e31</code></a> Add release notes for <a href="">#9348</a> (<a href="">#9369</a>)</li>
<li><a href=""><code>432707e</code></a> Added release notes for <a href="">#9348</a></li>
<li><a href=""><code>2d58910</code></a> Specify APNG duration type when opening</li>
<li>Additional commits viewable in <a href="https://github.com/python-pillow/Pillow/compare/11.3.0...12.1.1">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a128ff51f8a8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.