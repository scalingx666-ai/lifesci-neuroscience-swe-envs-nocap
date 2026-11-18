# Issue

**Title:** chore(deps): bump the python group with 6 updates

## Description

Bumps the python group with 6 updates:

| Package | From | To |
| --- | --- | --- |
| [packaging](https://github.com/pypa/packaging) | `25.0` | `26.0` |
| [matplotlib](https://github.com/matplotlib/matplotlib) | `3.10.7` | `3.10.8` |
| [pytest](https://github.com/pytest-dev/pytest) | `9.0.1` | `9.0.2` |
| [pytest-doctestplus](https://github.com/scientific-python/pytest-doctestplus) | `1.6.0` | `1.7.1` |
| [pytest-httpserver](https://github.com/csernazs/pytest-httpserver) | `1.1.3` | `1.1.5` |
| [ruff](https://github.com/astral-sh/ruff) | `0.14.13` | `0.15.1` |

Updates `packaging` from 25.0 to 26.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pypa/packaging/releases">packaging's releases</a>.</em></p>
<blockquote>
<h2>26.0</h2>
<p>Read about the performance improvements here: <a href="https://iscinumpy.dev/post/packaging-faster">https://iscinumpy.dev/post/packaging-faster</a>.</p>
<h2>What's Changed</h2>
<p>Features:</p>
<ul>
<li>PEP 751: support pylock by <a href="https://github.com/sbidoul"><code>@​sbidoul</code></a> in <a href="">pypa/packaging#900</a></li>
<li>PEP 794: import name metadata by <a href="https://github.com/brettcannon"><code>@​brettcannon</code></a> in <a href="">pypa/packaging#948</a></li>
<li>Support writing metadata by <a href="https://github.com/henryiii"><code>@​henryiii</code></a> in <a href="">pypa/packaging#846</a></li>
<li>Support <code>__replace__</code> for <code>Version</code> by <a href="https://github.com/henryiii"><code>@​henryiii</code></a> in <a href="">pypa/packaging#1003</a></li>
<li>Support positional pattern matching for <code>Version</code> and <code>Specifier</code> by <a href="https://github.com/henryiii"><code>@​henryiii</code></a> in <a href="">pypa/packaging#1004</a></li>
</ul>
<p>Behavior adaptations:</p>
<ul>
<li>PEP 440 handling of prereleases for <code>Specifier.contains</code>, <code>SpecifierSet.contains</code>, and <code>SpecifierSet.filter</code> by <a href="https://github.com/notatallshaw"><code>@​notatallshaw</code></a> in <a href="">pypa/packaging#897</a></li>
<li>Handle PEP 440 edge case in <code>SpecifierSet.filter</code> by <a href="https://github.com/notatallshaw"><code>@​notatallshaw</code></a> in <a href="">pypa/packaging#942</a></li>
<li>Adjust arbitrary equality intersection preservation in <code>SpecifierSet</code> by <a href="https://github.com/notatallshaw"><code>@​notatallshaw</code></a> in <a href="">pypa/packaging#951</a></li>
<li>Return <code>False</code> instead of raising for <code>.contains</code> with invalid version by <a href="https://github.com/Liam-DeVoe"><code>@​Liam-DeVoe</code></a> in <a href="">pypa/packaging#932</a></li>
<li>Support arbitrary equality on arbitrary strings for <code>Specifier</code> and <code>SpecifierSet</code>'s <code>filter</code> and <code>contains</code> method. by <a href="https://github.com/notatallshaw"><code>@​notatallshaw</code></a> in <a href="">pypa/packaging#954</a></li>
<li>Only try to parse as <code>Version</code> on certain marker keys, return <code>False</code> on unequal ordered comparsions by <a href="https://github.com/JP-Ellis"><code>@​JP-Ellis</code></a> in <a href="">pypa/packaging#939</a></li>
</ul>
<p>Fixes:</p>
<ul>
<li>Update <code>_hash</code> when unpickling <code>Tag()</code> by <a href="https://github.com/dholth"><code>@​dholth</code></a> in <a href="">pypa/packaging#860</a></li>
<li>Correct comment and simplify implicit prerelease handling in <code>Specifier.prereleases</code> by <a href="https://github.com/notatallshaw"><code>@​notatallshaw</code></a> in <a href="">pypa/packaging#896</a></li>
<li>Use explicit <code>_GLibCVersion</code> <code>NamedTuple</code> in <code>_manylinux</code> by <a href="https://github.com/cthoyt"><code>@​cthoyt</code></a> in <a href="">pypa/packaging#868</a></li>
<li>Detect invalid license expressions containing <code>()</code> by <a href="https://github.com/bwoodsend"><code>@​bwoodsend</code></a> in <a href="">pypa/packaging#879</a></li>
<li>Correct regex for metadata <code>'name'</code> format by <a href="https://github.com/di"><code>@​di</code></a> in <a href="">pypa/packaging#925</a></li>
<li>Improve the message around expecting a semicolon by <a href="https://github.com/pradyunsg"><code>@​pradyunsg</code></a> in <a href="">pypa/packaging#833</a></li>
<li>Support nested parens in license expressions by <a href="https://github.com/Liam-DeVoe"><code>@​Liam-DeVoe</code></a> in <a href="">pypa/packaging#931</a></li>
<li>Add space before at symbol in <code>Requirements</code> string by <a href="https://github.com/henryiii"><code>@​henryiii</code></a> in <a href="">pypa/packaging#953</a></li>
<li>A root logger use found by ruff LOG, use <code>packaging</code> logger instead by <a href="https://github.com/henryiii"><code>@​henryiii</code></a> in <a href="">pypa/packaging#965</a></li>
<li>Better support for subclassing <code>Marker</code> and <code>Requirement</code> by <a href="https://github.com/henryiii"><code>@​henryiii</code></a> in <a href="">pypa/packaging#1022</a></li>
<li>Normalize all extras, not just if it comes first by <a href="https://github.com/henryiii"><code>@​henryiii</code></a> in <a href="">pypa/packaging#1024</a></li>
<li>Don't produce a broken repr if <code>Marker</code> fails to construct by <a href="https://github.com/henryiii"><code>@​henryiii</code></a> in <a href="">pypa/packaging#1033</a></li>
</ul>
<p>Performance:</p>
<ul>
<li>Avoid recompiling regexes in the tokenizer for a 3x speedup by <a href="https://github.com/hauntsaninja"><code>@​hauntsaninja</code></a> in <a href="">pypa/packaging#1019</a></li>
<li>Improve performance in <code>_manylinux.py</code> by <a href="https://github.com/cthoyt"><code>@​cthoyt</code></a> in <a href="">pypa/packaging#869</a></li>
<li>Minor cleanups to <code>Version</code> by <a href="https://github.com/bearomorphism"><code>@​bearomorphism</code></a> in <a href="">pypa/packaging#913</a></li>
<li>Skip redundant creation of <code>Version</code>s in specifier comparison by <a href="https://github.com/notatallshaw"><code>@​notatallshaw</code></a> in <a href="">pypa/packaging#986</a></li>
<li>Cache <code>Specifier</code>'s Version by <a href="https://github.com/notatallshaw"><code>@​notatallshaw</code></a> in <a href="">pypa/packaging#985</a></li>
<li>Make <code>Version</code> a little faster by <a href="https://github.com/henryiii"><code>@​henryiii</code></a> in <a href="">pypa/packaging#987</a></li>
<li>Minor <code>Version</code> regex cleanup by <a href="https://github.com/henryiii"><code>@​henryiii</code></a> in <a href="">pypa/packaging#990</a></li>
<li>Faster regex on Python 3.11.5+ by <a href="https://github.com/henryiii"><code>@​henryiii</code></a> in <a href="">pypa/packaging#988</a> and <a href="">pypa/packaging#1055</a></li>
<li>Lazily calculate <code>_key</code> in <code>Version</code> by <a href="https://github.com/notatallshaw"><code>@​notatallshaw</code></a> in <a href="">pypa/packaging#989</a> and regression for <code>packaging_legacy</code> fixed by <a href="https://github.com/henryiii"><code>@​henryiii</code></a> in <a href="">pypa/packaging#1048</a></li>
<li>Faster <code>canonicalize_version</code> by <a href="https://github.com/henryiii"><code>@​henryiii</code></a> in <a href="">pypa/packaging#993</a></li>
<li>Use <code>fullmatch</code> in a couple more places by <a href="https://github.com/henryiii"><code>@​henryiii</code></a> in <a href="">pypa/packaging#992</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pypa/packaging/blob/main/CHANGELOG.rst">packaging's changelog</a>.</em></p>
<blockquote>
<p>26.0 - 2026-01-20</p>
<pre><code>
Features:
<ul>
<li>PEP 751: support pylock (:pull:<code>900</code>)</li>
<li>PEP 794: import name metadata (:pull:<code>948</code>)</li>
<li>Support for writing metadata to a file (:pull:<code>846</code>)</li>
<li>Support <code>__replace__</code> on Version (:pull:<code>1003</code>)</li>
<li>Support positional pattern matching for <code>Version</code> and <code>SpecifierSet</code> (:pull:<code>1004</code>)</li>
</ul>
<p>Behavior adaptations:</p>
<ul>
<li>PEP 440 handling of prereleases for <code>Specifier.contains</code>, <code>SpecifierSet.contains</code>, and <code>SpecifierSet.filter</code> (:pull:<code>897</code>)</li>
<li>Handle PEP 440 edge case in <code>SpecifierSet.filter</code> (:pull:<code>942</code>)</li>
<li>Adjust arbitrary equality intersection preservation in <code>SpecifierSet</code> (:pull:<code>951</code>)</li>
<li>Return <code>False</code> instead of raising for <code>.contains</code> with invalid version (:pull:<code>932</code>)</li>
<li>Support arbitrary equality on arbitrary strings for <code>Specifier</code> and <code>SpecifierSet</code>'s <code>filter</code> and <code>contains</code> method. (:pull:<code>954</code>)</li>
<li>Only try to parse as <code>Version</code> on certain marker keys, return <code>False</code> on unequal ordered comparisons (:pull:<code>939</code>)</li>
</ul>
<p>Fixes:</p>
<ul>
<li>Update <code>_hash</code> when unpickling <code>Tag()</code> (:pull:<code>860</code>)</li>
<li>Correct comment and simplify implicit prerelease handling in <code>Specifier.prereleases</code> (:pull:<code>896</code>)</li>
<li>Use explicit <code>_GLibCVersion</code> <code>NamedTuple</code> in <code>_manylinux</code> (:pull:<code>868</code>)</li>
<li>Detect invalid license expressions containing <code>()</code> (:pull:<code>879</code>)</li>
<li>Correct regex for metadata <code>'name'</code> format (:pull:<code>925</code>)</li>
<li>Improve the message around expecting a semicolon (:pull:<code>833</code>)</li>
<li>Support nested parens in license expressions (:pull:<code>931</code>)</li>
<li>Add space before at symbol in <code>Requirements</code> string (:pull:<code>953</code>)</li>
<li>A root logger use found, use a <code>packaging</code> logger instead (:pull:<code>965</code>)</li>
<li>Better support for subclassing <code>Marker</code> and <code>Requirement</code> (:pull:<code>1022</code>)</li>
<li>Normalize all extras, not just if it comes first (:pull:<code>1024</code>)</li>
<li>Don't produce a broken repr if <code>Marker</code> fails to construct (:pull:<code>1033</code>)</li>
</ul>
<p>Performance:</p>
<ul>
<li>Avoid recompiling regexes in the tokenizer for a 3x speedup (:pull:<code>1019</code>)</li>
<li>Improve performance in <code>_manylinux.py</code> (:pull:<code>869</code>)</li>
<li>Minor cleanups to <code>Version</code> (:pull:<code>913</code>)</li>
<li>Skip redundant creation of <code>Version</code>'s in specifier comparison (:pull:<code>986</code>)</li>
<li>Cache the <code>Specifier</code>'s <code>Version</code> (:pull:<code>985</code>)</li>
<li>Make <code>Version</code> a little faster (:pull:<code>987</code>)</li>
<li>Minor <code>Version</code> regex cleanup (:pull:<code>990</code>)</li>
<li>Faster regex on Python 3.11.5+ for <code>Version</code> (:pull:<code>988</code>, :pull:<code>1055</code>)</li>
<li>Lazily calculate <code>_key</code> in <code>Version</code> (:pull:<code>989</code>, :pull:<code>1048</code>)</li>
<li>Faster <code>canonicalize_version</code> (:pull:<code>993</code>)</li>
<li>Use <code>re.fullmatch</code> in a couple more places (:pull:<code>992</code>, :pull:<code>1029</code>)</li>
<li>Use <code>map</code> instead of generator (:pull:<code>996</code>)</li>
<li>Deprecate <code>._version</code> (<code>_Version</code>, a <code>NamedTuple</code>) (:pull:<code>995</code>, :pull:<code>1062</code>)<br />
&lt;/tr&gt;&lt;/table&gt;<br />
</code></pre></li>
</ul>
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>3b77a26</code></a> Bump for release</li>
<li><a href=""><code>31371cc</code></a> docs: prepare for 26.0 final (<a href="">#1063</a>)</li>
<li><a href=""><code>9627a88</code></a> perf: dual replace (<a href="">#1064</a>)</li>
<li><a href=""><code>d5398b8</code></a> fix: restore ._version as a compat shim (<a href="">#1062</a>)</li>
<li><a href=""><code>3a7b600</code></a> Bump for development</li>
<li><a href=""><code>d4eefdc</code></a> Bump for release</li>
<li><a href=""><code>4618912</code></a> docs: prepare for 26.0rc3 (<a href="">#1060</a>)</li>
<li><a href=""><code>0cf1b41</code></a> ci: test on first public release of CPythons (<a href="">#1056</a>)</li>
<li><a href=""><code>716beb1</code></a> perf:  10% faster stripping zeros (<a href="">#1058</a>)</li>
<li><a href=""><code>350a230</code></a> fix: support CPython 3.11.0-3.11.4 and older PyPy3.11 (<a href="">#1055</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pypa/packaging/compare/25.0...26.0">compare view</a></li>
</ul>
</details>
<br />

Updates `matplotlib` from 3.10.7 to 3.10.8
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/matplotlib/matplotlib/releases">matplotlib's releases</a>.</em></p>
<blockquote>
<h2>REL: v3.10.8</h2>
<p>This is a bugfix release in the 3.10.x series.</p>
<p>The primary highlights of this release are:</p>
<ul>
<li>Properly allow freethreaded mode in the MacOS backend</li>
<li>Better error handling for MacOS backend</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>1392cbe</code></a> REL: v3.10.8</li>
<li><a href=""><code>0b9ebb3</code></a> Doc release prep v3.10.8</li>
<li><a href=""><code>bc7b5c4</code></a> Merge branch 'v3.10.7-doc' into v3.10.x</li>
<li><a href=""><code>86b38d3</code></a> Github stats v3.10.8</li>
<li><a href=""><code>9512188</code></a> Merge pull request <a href="">#30717</a> from meeseeksmachine/auto-backport-of-pr-30714-on-v...</li>
<li><a href=""><code>d300769</code></a> Backport PR <a href="">#30714</a>: FIX: Gracefully handle numpy arrays as input to check_in_...</li>
<li><a href=""><code>799bc95</code></a> Merge pull request <a href="">#30711</a> from ngoldbaum/v3.10.x</li>
<li><a href=""><code>134000b</code></a> Merge pull request <a href="">#30697</a> from ngoldbaum/fix-plotting-on-worker-threads</li>
<li><a href=""><code>5b8e219</code></a> TST: Run macosx backends in a subprocess</li>
<li><a href=""><code>878e71a</code></a> Backport PR <a href="">#29810</a>: Declare free-threaded support in MacOS backend extension ...</li>
<li>Additional commits viewable in <a href="https://github.com/matplotlib/matplotlib/compare/v3.10.7...v3.10.8">compare view</a></li>
</ul>
</details>
<br />

Updates `pytest` from 9.0.1 to 9.0.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pytest-dev/pytest/releases">pytest's releases</a>.</em></p>
<blockquote>
<h2>9.0.2</h2>
<h1>pytest 9.0.2 (2025-12-06)</h1>
<h2>Bug fixes</h2>
<ul>
<li>
<p><a href="">#13896</a>: The terminal progress feature added in pytest 9.0.0 has been disabled by default, except on Windows, due to compatibility issues with some terminal emulators.</p>
<p>You may enable it again by passing <code>-p terminalprogress</code>. We may enable it by default again once compatibility improves in the future.</p>
<p>Additionally, when the environment variable <code>TERM</code> is <code>dumb</code>, the escape codes are no longer emitted, even if the plugin is enabled.</p>
</li>
<li>
<p><a href="">#13904</a>: Fixed the TOML type of the <code>tmp_path_retention_count</code> settings in the API reference from number to string.</p>
</li>
<li>
<p><a href="">#13946</a>: The private <code>config.inicfg</code> attribute was changed in a breaking manner in pytest 9.0.0.
Due to its usage in the ecosystem, it is now restored to working order using a compatibility shim.
It will be deprecated in pytest 9.1 and removed in pytest 10.</p>
</li>
<li>
<p><a href="">#13965</a>: Fixed quadratic-time behavior when handling <code>unittest</code> subtests in Python 3.10.</p>
</li>
</ul>
<h2>Improved documentation</h2>
<ul>
<li><a href="">#4492</a>: The API Reference now contains cross-reference-able documentation of <code>pytest's command-line flags &lt;command-line-flags&gt;</code>.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>3d10b51</code></a> Prepare release version 9.0.2</li>
<li><a href=""><code>188750b</code></a> Merge pull request <a href="">#14030</a> from pytest-dev/patchback/backports/9.0.x/1e4b01d1f...</li>
<li><a href=""><code>b7d7bef</code></a> Merge pull request <a href="">#14014</a> from bluetech/compat-note</li>
<li><a href=""><code>bd08e85</code></a> Merge pull request <a href="">#14013</a> from pytest-dev/patchback/backports/9.0.x/922b60377...</li>
<li><a href=""><code>bc78386</code></a> Add CLI options reference documentation (<a href="">#13930</a>)</li>
<li><a href=""><code>5a4e398</code></a> Fix docs typo (<a href="">#14005</a>) (<a href="">#14008</a>)</li>
<li><a href=""><code>d7ae6df</code></a> Merge pull request <a href="">#14006</a> from pytest-dev/maintenance/update-plugin-list-tmpl...</li>
<li><a href=""><code>556f6a2</code></a> pre-commit: fix rst-lint after new release (<a href="">#13999</a>) (<a href="">#14001</a>)</li>
<li><a href=""><code>c60fbe6</code></a> Fix quadratic-time behavior when handling <code>unittest</code> subtests in Python 3.10 ...</li>
<li><a href=""><code>73d9b01</code></a> Merge pull request <a href="">#13995</a> from nicoddemus/patchback/backports/9.0.x/1b5200c0f...</li>
<li>Additional commits viewable in <a href="https://github.com/pytest-dev/pytest/compare/9.0.1...9.0.2">compare view</a></li>
</ul>
</details>
<br />

Updates `pytest-doctestplus` from 1.6.0 to 1.7.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/scientific-python/pytest-doctestplus/releases">pytest-doctestplus's releases</a>.</em></p>
<blockquote>
<h2>v1.7.1</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>BUG: fix <strong>doctest_requires</strong> when constraint is present by <a href="https://github.com/KostaIlic2"><code>@​KostaIlic2</code></a> in <a href="">scientific-python/pytest-doctestplus#319</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/KostaIlic2"><code>@​KostaIlic2</code></a> made their first contribution in <a href="">scientific-python/pytest-doctestplus#319</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/scientific-python/pytest-doctestplus/compare/v1.7.0...v1.7.1">https://github.com/scientific-python/pytest-doctestplus/compare/v1.7.0...v1.7.1</a></p>
<h2>v1.7.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>MAINT: dropping python 3.9 support and pytest&lt;7 by <a href="https://github.com/bsipocz"><code>@​bsipocz</code></a> in <a href="">scientific-python/pytest-doctestplus#313</a></li>
<li>Test multiple directives by <a href="https://github.com/mkelley"><code>@​mkelley</code></a> in <a href="">scientific-python/pytest-doctestplus#316</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/mkelley"><code>@​mkelley</code></a> made their first contribution in <a href="">scientific-python/pytest-doctestplus#316</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/scientific-python/pytest-doctestplus/compare/v1.6.0...v1.7.0">https://github.com/scientific-python/pytest-doctestplus/compare/v1.6.0...v1.7.0</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/scientific-python/pytest-doctestplus/blob/main/CHANGES.rst">pytest-doctestplus's changelog</a>.</em></p>
<blockquote>
<h1>1.7.1 (2026-01-26)</h1>
<ul>
<li>Fixing bug where <code>__doctest_requires__</code> with version specifiers (e.g.,
<code>numpy&gt;=2.0</code>) incorrectly skipped tests even when dependencies were
satisfied. <a href="">#319</a></li>
</ul>
<h1>1.7.0 (2026-01-07)</h1>
<ul>
<li>
<p>Fixing crashing sphinx builds where multiple directives are used with the
first one expecting content. The order of the directives used does not
matter after this fix. <a href="">#316</a></p>
</li>
<li>
<p>Versions of Python &lt;3.10 and pytest&lt;7 are no longer supported. <a href="">#313</a></p>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>9c3698d</code></a> Finalizing changelog for v1.7.1</li>
<li><a href=""><code>44de19c</code></a> Merge pull request <a href="">#319</a> from KostaIlic2/fix-issue-318</li>
<li><a href=""><code>299dfbf</code></a> Minor typo</li>
<li><a href=""><code>2232898</code></a> Update CHANGES.rst</li>
<li><a href=""><code>8d97d4a</code></a> TST: use pass instead of skip in test_requires_module_variable</li>
<li><a href=""><code>789ba6e</code></a> DOC: update changelist</li>
<li><a href=""><code>4cb058c</code></a> BUG: fix <strong>doctest_requires</strong> when constraint is present</li>
<li><a href=""><code>d51d45a</code></a> TST: add test that shows <strong>doctest_requires</strong> fails with contraint</li>
<li><a href=""><code>0d8d511</code></a> Back to development: v1.8.0.dev</li>
<li><a href=""><code>8248fb7</code></a> Finalizing changelog for v1.7.0</li>
<li>Additional commits viewable in <a href="https://github.com/scientific-python/pytest-doctestplus/compare/v1.6.0...v1.7.1">compare view</a></li>
</ul>
</details>
<br />

Updates `pytest-httpserver` from 1.1.3 to 1.1.5
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/csernazs/pytest-httpserver/releases">pytest-httpserver's releases</a>.</em></p>
<blockquote>
<h2>1.1.5</h2>
<h2>What's Changed</h2>
<ul>
<li>Add <code>bake()</code> method for pre-configured request expectations by <a href="https://github.com/HayaoSuzuki"><code>@​HayaoSuzuki</code></a> in <a href="">csernazs/pytest-httpserver#470</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/csernazs/pytest-httpserver/compare/1.1.4...1.1.5">https://github.com/csernazs/pytest-httpserver/compare/1.1.4...1.1.5</a></p>
<h2>1.1.4</h2>
<h2>What's Changed</h2>
<ul>
<li>Drop Python 3.9 support and migrate to PEP 621 by <a href="https://github.com/HayaoSuzuki"><code>@​HayaoSuzuki</code></a> in <a href="">csernazs/pytest-httpserver#460</a></li>
<li>doc: improve documentation by preferring check() method over check_assertions() by <a href="https://github.com/csernazs"><code>@​csernazs</code></a> in <a href="">csernazs/pytest-httpserver#463</a></li>
<li>Implement http readiness checking by <a href="https://github.com/csernazs"><code>@​csernazs</code></a> &amp; <a href="https://github.com/HayaoSuzuki"><code>@​HayaoSuzuki</code></a> in <a href="">csernazs/pytest-httpserver#462</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/csernazs/pytest-httpserver/compare/1.1.3...1.1.4">https://github.com/csernazs/pytest-httpserver/compare/1.1.3...1.1.4</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/csernazs/pytest-httpserver/blob/master/CHANGES.rst">pytest-httpserver's changelog</a>.</em></p>
<blockquote>
<h1>1.1.5</h1>
<p>.. _Release Notes_1.1.5_New Features:</p>
<h2>New Features</h2>
<ul>
<li>Add <code>bake()</code> method to <code>HTTPServer</code> for creating pre-configured
request expectation proxies (<code>BakedHTTPServer</code>). This allows sharing
common keyword arguments (e.g. <code>method</code>, <code>headers</code>) across multiple
<code>expect_request()</code> calls with last-wins merging semantics.
<code> &lt;</code>_
Contributed by <code>@HayaoSuzuki &lt;https://github.com/HayaoSuzuki&gt;</code>_</li>
</ul>
<p>.. _Release Notes_1.1.4:</p>
<h1>1.1.4</h1>
<p>.. _Release Notes_1.1.4_New Features:</p>
<h2>New Features</h2>
<ul>
<li>More robust server startup by checking server readiness (disabled by
default).
<code> &lt;</code>_</li>
</ul>
<p>.. _Release Notes_1.1.4_Deprecation Notes:</p>
<h2>Deprecation Notes</h2>
<ul>
<li>Python 3.9 has been deprecated as it reached EOL 2025-10-31. While the code
may work on this version, there will be no CI tests running on it.</li>
</ul>
<p>.. _Release Notes_1.1.3:</p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>840c7d1</code></a> CHANGES.rst: add release notes for 1.1.5</li>
<li><a href=""><code>7c7be88</code></a> Version bump to 1.1.5</li>
<li><a href=""><code>f1971ce</code></a> fix-release: remove release notes</li>
<li><a href=""><code>ae956c0</code></a> release.py: fix check order</li>
<li><a href=""><code>c880480</code></a> Make release.py more robust</li>
<li><a href=""><code>310529c</code></a> Add bake() method for pre-configured request expectations</li>
<li><a href=""><code>7716cda</code></a> [pre-commit.ci] pre-commit autoupdate</li>
<li><a href=""><code>98fe77c</code></a> CHANGES.rst: add release notes for 1.1.4</li>
<li><a href=""><code>dd070b2</code></a> Version bump to 1.1.4</li>
<li><a href=""><code>cb65a6f</code></a> releasenotes: add release note for readiness check</li>
<li>Additional commits viewable in <a href="https://github.com/csernazs/pytest-httpserver/compare/1.1.3...1.1.5">compare view</a></li>
</ul>
</details>
<br />

Updates `ruff` from 0.14.13 to 0.15.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.15.1</h2>
<h2>Release Notes</h2>
<p>Released on 2026-02-12.</p>
<h3>Preview features</h3>
<ul>
<li>[<code>airflow</code>] Add ruff rules to catch deprecated Airflow imports for Airflow 3.1 (<code>AIR321</code>) (<a href="">#22376</a>)</li>
<li>[<code>airflow</code>] Third positional parameter not named <code>ti_key</code> should be flagged for <code>BaseOperatorLink.get_link</code> (<code>AIR303</code>) (<a href="">#22828</a>)</li>
<li>[<code>flake8-gettext</code>] Fix false negatives for plural argument of <code>ngettext</code> (<code>INT001</code>, <code>INT002</code>, <code>INT003</code>) (<a href="">#21078</a>)</li>
<li>[<code>pyflakes</code>] Fix infinite loop in preview fix for <code>unused-import</code> (<code>F401</code>) (<a href="">#23038</a>)</li>
<li>[<code>pygrep-hooks</code>] Detect non-existent mock methods in standalone expressions (<code>PGH005</code>) (<a href="">#22830</a>)</li>
<li>[<code>pylint</code>] Allow dunder submodules and improve diagnostic range (<code>PLC2701</code>) (<a href="">#22804</a>)</li>
<li>[<code>pyupgrade</code>] Improve diagnostic range for tuples (<code>UP024</code>) (<a href="">#23013</a>)</li>
<li>[<code>refurb</code>] Check subscripts in tuple do not use lambda parameters in <code>reimplemented-operator</code> (<code>FURB118</code>) (<a href="">#23079</a>)</li>
<li>[<code>ruff</code>] Detect mutable defaults in <code>field</code> calls (<code>RUF008</code>) (<a href="">#23046</a>)</li>
<li>[<code>ruff</code>] Ignore std <code>cmath.inf</code> (<code>RUF069</code>) (<a href="">#23120</a>)</li>
<li>[<code>ruff</code>] New rule <code>float-equality-comparison</code> (<code>RUF069</code>) (<a href="">#20585</a>)</li>
<li>Don't format unlabeled Markdown code blocks (<a href="">#23106</a>)</li>
<li>Markdown formatting support in LSP (<a href="">#23063</a>)</li>
<li>Support Quarto Markdown language markers (<a href="">#22947</a>)</li>
<li>Support formatting <code>pycon</code> Markdown code blocks (<a href="">#23112</a>)</li>
<li>Use extension mapping to select Markdown code block language (<a href="">#22934</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Avoid false positive for undefined variables in <code>FAST001</code> (<a href="">#23224</a>)</li>
<li>Avoid introducing syntax errors for <code>FAST003</code> autofix (<a href="">#23227</a>)</li>
<li>Avoid suggesting <code>InitVar</code> for <code>__post_init__</code> that references PEP 695 type parameters (<a href="">#23226</a>)</li>
<li>Deduplicate type variables in generic functions (<a href="">#23225</a>)</li>
<li>Fix exception handler parenthesis removal for Python 3.14+ (<a href="">#23126</a>)</li>
<li>Fix f-string middle panic when parsing t-strings (<a href="">#23232</a>)</li>
<li>Wrap <code>RUF020</code> target for multiline fixes (<a href="">#23210</a>)</li>
<li>Wrap <code>UP007</code> target for multiline fixes (<a href="">#23208</a>)</li>
<li>Fix missing diagnostics for last range suppression in file (<a href="">#23242</a>)</li>
<li>[<code>pyupgrade</code>] Fix syntax error on string with newline escape and comment (<code>UP037</code>) (<a href="">#22968</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>Use <code>ruff</code> instead of <code>Ruff</code> as the program name in GitHub output format (<a href="">#23240</a>)</li>
<li>[<code>PT006</code>] Fix syntax error when unpacking nested tuples in <code>parametrize</code> fixes (<a href="">#22441</a>) (<a href="">#22464</a>)</li>
<li>[<code>airflow</code>] Catch deprecated attribute access from context key for Airflow 3.0 (<code>AIR301</code>) (<a href="">#22850</a>)</li>
<li>[<code>airflow</code>] Capture deprecated arguments and a decorator (<code>AIR301</code>) (<a href="">#23170</a>)</li>
<li>[<code>flake8-boolean-trap</code>] Add <code>multiprocessing.Value</code> to excluded functions for <code>FBT003</code> (<a href="">#23010</a>)</li>
<li>[<code>flake8-bugbear</code>] Add a secondary annotation showing the previous occurrence (<code>B033</code>) (<a href="">#22634</a>)</li>
<li>[<code>flake8-type-checking</code>] Add sub-diagnostic showing the runtime use of an annotation (<code>TC004</code>) (<a href="">#23091</a>)</li>
<li>[<code>isort</code>] Support configurable import section heading comments (<a href="">#23151</a>)</li>
<li>[<code>ruff</code>] Improve the diagnostic for <code>RUF012</code> (<a href="">#23202</a>)</li>
</ul>
<h3>Formatter</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/blob/main/CHANGELOG.md">ruff's changelog</a>.</em></p>
<blockquote>
<h2>0.15.1</h2>
<p>Released on 2026-02-12.</p>
<h3>Preview features</h3>
<ul>
<li>[<code>airflow</code>] Add ruff rules to catch deprecated Airflow imports for Airflow 3.1 (<code>AIR321</code>) (<a href="">#22376</a>)</li>
<li>[<code>airflow</code>] Third positional parameter not named <code>ti_key</code> should be flagged for <code>BaseOperatorLink.get_link</code> (<code>AIR303</code>) (<a href="">#22828</a>)</li>
<li>[<code>flake8-gettext</code>] Fix false negatives for plural argument of <code>ngettext</code> (<code>INT001</code>, <code>INT002</code>, <code>INT003</code>) (<a href="">#21078</a>)</li>
<li>[<code>pyflakes</code>] Fix infinite loop in preview fix for <code>unused-import</code> (<code>F401</code>) (<a href="">#23038</a>)</li>
<li>[<code>pygrep-hooks</code>] Detect non-existent mock methods in standalone expressions (<code>PGH005</code>) (<a href="">#22830</a>)</li>
<li>[<code>pylint</code>] Allow dunder submodules and improve diagnostic range (<code>PLC2701</code>) (<a href="">#22804</a>)</li>
<li>[<code>pyupgrade</code>] Improve diagnostic range for tuples (<code>UP024</code>) (<a href="">#23013</a>)</li>
<li>[<code>refurb</code>] Check subscripts in tuple do not use lambda parameters in <code>reimplemented-operator</code> (<code>FURB118</code>) (<a href="">#23079</a>)</li>
<li>[<code>ruff</code>] Detect mutable defaults in <code>field</code> calls (<code>RUF008</code>) (<a href="">#23046</a>)</li>
<li>[<code>ruff</code>] Ignore std <code>cmath.inf</code> (<code>RUF069</code>) (<a href="">#23120</a>)</li>
<li>[<code>ruff</code>] New rule <code>float-equality-comparison</code> (<code>RUF069</code>) (<a href="">#20585</a>)</li>
<li>Don't format unlabeled Markdown code blocks (<a href="">#23106</a>)</li>
<li>Markdown formatting support in LSP (<a href="">#23063</a>)</li>
<li>Support Quarto Markdown language markers (<a href="">#22947</a>)</li>
<li>Support formatting <code>pycon</code> Markdown code blocks (<a href="">#23112</a>)</li>
<li>Use extension mapping to select Markdown code block language (<a href="">#22934</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Avoid false positive for undefined variables in <code>FAST001</code> (<a href="">#23224</a>)</li>
<li>Avoid introducing syntax errors for <code>FAST003</code> autofix (<a href="">#23227</a>)</li>
<li>Avoid suggesting <code>InitVar</code> for <code>__post_init__</code> that references PEP 695 type parameters (<a href="">#23226</a>)</li>
<li>Deduplicate type variables in generic functions (<a href="">#23225</a>)</li>
<li>Fix exception handler parenthesis removal for Python 3.14+ (<a href="">#23126</a>)</li>
<li>Fix f-string middle panic when parsing t-strings (<a href="">#23232</a>)</li>
<li>Wrap <code>RUF020</code> target for multiline fixes (<a href="">#23210</a>)</li>
<li>Wrap <code>UP007</code> target for multiline fixes (<a href="">#23208</a>)</li>
<li>Fix missing diagnostics for last range suppression in file (<a href="">#23242</a>)</li>
<li>[<code>pyupgrade</code>] Fix syntax error on string with newline escape and comment (<code>UP037</code>) (<a href="">#22968</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>Use <code>ruff</code> instead of <code>Ruff</code> as the program name in GitHub output format (<a href="">#23240</a>)</li>
<li>[<code>PT006</code>] Fix syntax error when unpacking nested tuples in <code>parametrize</code> fixes (<a href="">#22441</a>) (<a href="">#22464</a>)</li>
<li>[<code>airflow</code>] Catch deprecated attribute access from context key for Airflow 3.0 (<code>AIR301</code>) (<a href="">#22850</a>)</li>
<li>[<code>airflow</code>] Capture deprecated arguments and a decorator (<code>AIR301</code>) (<a href="">#23170</a>)</li>
<li>[<code>flake8-boolean-trap</code>] Add <code>multiprocessing.Value</code> to excluded functions for <code>FBT003</code> (<a href="">#23010</a>)</li>
<li>[<code>flake8-bugbear</code>] Add a secondary annotation showing the previous occurrence (<code>B033</code>) (<a href="">#22634</a>)</li>
<li>[<code>flake8-type-checking</code>] Add sub-diagnostic showing the runtime use of an annotation (<code>TC004</code>) (<a href="">#23091</a>)</li>
<li>[<code>isort</code>] Support configurable import section heading comments (<a href="">#23151</a>)</li>
<li>[<code>ruff</code>] Improve the diagnostic for <code>RUF012</code> (<a href="">#23202</a>)</li>
</ul>
<h3>Formatter</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>a2f11d2</code></a> Prepare for 0.15.1 (<a href="">#23253</a>)</li>
<li><a href=""><code>d29628e</code></a> Remove docker-run-action (<a href="">#23254</a>)</li>
<li><a href=""><code>8a04266</code></a> [ty] Allow discovering dependencies in system Python environments (<a href="">#22994</a>)</li>
<li><a href=""><code>55d06c8</code></a> Ensure pending suppression diagnostics are reported (<a href="">#23242</a>)</li>
<li><a href=""><code>d056a9f</code></a> [<code>isort</code>] support for configurable import section heading comments (<a href="">#23151</a>)</li>
<li><a href=""><code>e22fa4f</code></a> [ty] Fix method calls on subclasses of <code>Any</code> (<a href="">#23248</a>)</li>
<li><a href=""><code>fa56c15</code></a> [ty] Fix bound method access on <code>None</code> (<a href="">#23246</a>)</li>
<li><a href=""><code>4fd07d0</code></a> Make range suppression test snapshot actually useful (<a href="">#23251</a>)</li>
<li><a href=""><code>8c63bce</code></a> [ty] Include conditional symbols (like <code>datetime.UTC</code>) in auto-import in more...</li>
<li><a href=""><code>46be943</code></a> Exclude WASM artifacts from GitHub releases (<a href="">#23221</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ruff/compare/0.14.13...0.15.1">compare view</a></li>
</ul>
</details>
<br />

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
- `@dependabot show <dependency name> ignore conditions` will show all of the ignore conditions of the specified dependency
- `@dependabot ignore <dependency name> major version` will close this group update PR and stop Dependabot creating any more for the specific dependency's major version (unless you unignore this specific dependency's major version or upgrade to it yourself)
- `@dependabot ignore <dependency name> minor version` will close this group update PR and stop Dependabot creating any more for the specific dependency's minor version (unless you unignore this specific dependency's minor version or upgrade to it yourself)
- `@dependabot ignore <dependency name>` will close this group update PR and stop Dependabot creating any more for the specific dependency (unless you unignore this specific dependency or upgrade to it yourself)
- `@dependabot unignore <dependency name>` will remove all of the ignore conditions of the specified dependency
- `@dependabot unignore <dependency name> <ignore condition>` will remove the ignore condition of the specified dependency and ignore conditions

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b7d71f5c9ff3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.