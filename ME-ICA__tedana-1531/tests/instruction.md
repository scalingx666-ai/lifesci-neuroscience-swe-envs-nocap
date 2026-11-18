# Issue

**Title:** Bump setuptools from 84.0.0 to 84.2.1

## Description

Bumps [setuptools](https://github.com/pypa/setuptools) from 84.0.0 to 84.2.1.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pypa/setuptools/blob/main/NEWS.rst">setuptools's changelog</a>.</em></p>
<blockquote>
<h1>v84.2.1</h1>
<h2>Bugfixes</h2>
<ul>
<li>Changed wheel tags and stable-ABI validation to use sysconfig data. (<a href="">#5360</a>)</li>
<li>Fixed unimportable extensions on free-threaded Python 3.13 and 3.14 when
<code>Extension.py_limited_api</code> is enabled. These builds now use their
version-specific extension suffix instead of using the unsupported <code>.abi3t</code>
suffix. (<a href="">#5363</a>)</li>
</ul>
<h2>Improved Documentation</h2>
<ul>
<li>Replaced broken link to Python Eggs documentation with an archived version from the Wayback Machine. (<a href="">#1929</a>)</li>
</ul>
<h1>v84.2.0</h1>
<h2>Features</h2>
<ul>
<li>Added support for building abi3t extensions and abi3.abi3t wheels on Python
3.15 and newer. See :pep:<code>803</code> and the <code>Python 3.15 &quot;What's New&quot; entry &lt;https://docs.python.org/3.15/whatsnew/3.15.html#pep-803-abi3t-stable-abi-for-free-threaded-builds&gt;</code>_
for more details. (<a href="">#5193</a>)</li>
<li>Updated vendored packaging version to 26.3, which adds support for the
<code>abi3t</code> tag from :pep:<code>803</code>. (<a href="">#5361</a>)</li>
</ul>
<h2>Bugfixes</h2>
<ul>
<li>Use target sysconfig data for stable-ABI extension filenames. (<a href="">#5351</a>)</li>
</ul>
<h1>v84.1.0</h1>
<h2>Features</h2>
<ul>
<li><code>setuptools.archive_util</code> now raises the new <code>UnsafeMember</code> exception when
an archive member would be extracted outside of the extraction directory,
where previously such a member was silently skipped. Aborting makes a
malicious or malformed archive visible to the caller instead of yielding a
quietly incomplete extraction, and matches the behavior of the standard</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>3895f98</code></a> Bump version: 84.2.0 → 84.2.1</li>
<li><a href=""><code>7c5cb7a</code></a> Merge pull request <a href="">#5362</a> from jameshilliard/fix/abi3t-target-config</li>
<li><a href=""><code>00595bf</code></a> Use sysconfig data for wheel tags and stable-ABI validation</li>
<li><a href=""><code>873b29c</code></a> Merge pull request <a href="">#5363</a> from ngoldbaum/fix-3.14t</li>
<li><a href=""><code>d8bc01b</code></a> Merge pull request <a href="">#5330</a> from Topgearfanboy/main</li>
<li><a href=""><code>e27271e</code></a> Apply review comments from <a href="https://github.com/jameshillard"><code>@​jameshillard</code></a></li>
<li><a href=""><code>aa98f85</code></a> add newsfragment</li>
<li><a href=""><code>3301fa6</code></a> Avoid .abi3t extension suffixes on Python 3.13t and 3.14t</li>
<li><a href=""><code>301e27a</code></a> Bump version: 84.1.0 → 84.2.0</li>
<li><a href=""><code>39a7c2e</code></a> Merge pull request <a href="">#5193</a> from ngoldbaum/abi3.abi3t</li>
<li>Additional commits viewable in <a href="https://github.com/pypa/setuptools/compare/v84.0.0...v84.2.1">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ec77dcb78cba`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.