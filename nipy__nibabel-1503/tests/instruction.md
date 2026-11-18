# Issue

**Title:** chore(deps): bump the python group with 7 updates

## Description

Bumps the python group with 7 updates:

| Package | From | To |
| --- | --- | --- |
| [packaging](https://github.com/pypa/packaging) | `26.0` | `26.1` |
| [pillow](https://github.com/python-pillow/Pillow) | `12.1.1` | `12.2.0` |
| [pytest](https://github.com/pytest-dev/pytest) | `9.0.2` | `9.0.3` |
| [pytest-cov](https://github.com/pytest-dev/pytest-cov) | `7.0.0` | `7.1.0` |
| [tox](https://github.com/tox-dev/tox) | `4.50.0` | `4.53.0` |
| [tox-uv](https://github.com/tox-dev/tox-uv) | `1.33.4` | `1.35.1` |
| [mypy](https://github.com/python/mypy) | `1.19.1` | `1.20.1` |

Updates `packaging` from 26.0 to 26.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pypa/packaging/releases">packaging's releases</a>.</em></p>
<blockquote>
<h2>26.1</h2>
<p>Features:</p>
<ul>
<li><del>PEP 783: add handling for Emscripten wheel tags by <a href="https://github.com/hoodmane"><code>@​hoodmane</code></a> in <a href="">pypa/packaging#804</a></del> (old name used in implementation, will be fixed in next release)</li>
<li>PEP 803: add handling for the <code>abi3.abi3t</code> free-threading tag by <a href="https://github.com/ngoldbaum"><code>@​ngoldbaum</code></a> in <a href="">pypa/packaging#1099</a></li>
<li>PEP 723: add <code>packaging.dependency_groups</code> module, based on the <code>dependency-groups</code> package by <a href="https://github.com/sirosen"><code>@​sirosen</code></a> in <a href="">pypa/packaging#1065</a></li>
<li>Add the <code>packaging.direct_url</code> module by <a href="https://github.com/sbidoul"><code>@​sbidoul</code></a> in <a href="">pypa/packaging#944</a></li>
<li>Add the <code>packaging.errors</code> module by <a href="https://github.com/henryiii"><code>@​henryiii</code></a> in <a href="">pypa/packaging#1071</a></li>
<li>Add <code>SpecifierSet.is_unsatisfiable</code> using ranges (new internals that will be expanded in future versions) by <a href="https://github.com/notatallshaw"><code>@​notatallshaw</code></a> in <a href="">pypa/packaging#1119</a></li>
<li>Add <code>create_compatible_tags_selector</code> to select compatible tags by <a href="https://github.com/sbidoul"><code>@​sbidoul</code></a> in <a href="">pypa/packaging#1110</a></li>
<li>Add a <code>key</code> argument to <code>SpecifierSet.filter()</code> by <a href="https://github.com/frostming"><code>@​frostming</code></a> in <a href="">pypa/packaging#1068</a></li>
<li>Support <code>&amp;</code> and <code>|</code> for <code>Marker</code>'s by <a href="https://github.com/henryiii"><code>@​henryiii</code></a> in <a href="">pypa/packaging#1146</a></li>
<li>Normalize <code>Version.__replace__</code> and add <code>Version.from_parts</code> by <a href="https://github.com/henryiii"><code>@​henryiii</code></a> in <a href="">pypa/packaging#1078</a></li>
<li>Add an option to validate compressed tag set sort order in <code>parse_wheel_filename</code> by <a href="https://github.com/r266-tech"><code>@​r266-tech</code></a> in <a href="">pypa/packaging#1150</a></li>
</ul>
<p>Behavior adaptations:</p>
<ul>
<li>Narrow exclusion of pre-releases for <code>&lt;V.postN</code> to match spec by <a href="https://github.com/notatallshaw"><code>@​notatallshaw</code></a> in <a href="">pypa/packaging#1140</a></li>
<li>Narrow exclusion of post-releases for <code>&gt;V</code> to match spec by <a href="https://github.com/notatallshaw"><code>@​notatallshaw</code></a> in <a href="">pypa/packaging#1141</a></li>
<li>Rename <code>format_full_version</code> to <code>_format_full_version</code> to make it visibly private by <a href="https://github.com/r266-tech"><code>@​r266-tech</code></a> in <a href="">pypa/packaging#1125</a></li>
<li>Restrict local version to ASCII by <a href="https://github.com/henryiii"><code>@​henryiii</code></a> in <a href="">pypa/packaging#1102</a></li>
</ul>
<p>Pylock (PEP 751) updates:</p>
<ul>
<li>Add pylock <code>select</code> function by <a href="https://github.com/sbidoul"><code>@​sbidoul</code></a> in <a href="">pypa/packaging#1092</a></li>
<li>Document pylock <code>select()</code> method and <code>PylockSelectError</code> by <a href="https://github.com/r266-tech"><code>@​r266-tech</code></a> in <a href="">pypa/packaging#1153</a></li>
<li>Add <code>filename</code> property to <code>PackageSdist</code> and <code>PackageWheel</code>, more validation by <a href="https://github.com/sbidoul"><code>@​sbidoul</code></a> in <a href="">pypa/packaging#1095</a></li>
<li>Give preference to path over url by <a href="https://github.com/sbidoul"><code>@​sbidoul</code></a> in <a href="">pypa/packaging#1128</a></li>
<li>Validate name/version consistency in file names by <a href="https://github.com/sbidoul"><code>@​sbidoul</code></a> in <a href="">pypa/packaging#1114</a></li>
</ul>
<p>Fixes:</p>
<ul>
<li>Fix <code>&gt;</code> comparison for versions with dev+local segments by <a href="https://github.com/veeceey"><code>@​veeceey</code></a> in <a href="">pypa/packaging#1097</a></li>
<li>Fix incorrect self-comparison for <code>InfinityType</code> and <code>NegativeInfinityType</code> by <a href="https://github.com/bysiber"><code>@​bysiber</code></a> in <a href="">pypa/packaging#1093</a></li>
<li>Canonicalize when deduplicating specifiers in <code>SpecifierSet</code> by <a href="https://github.com/notatallshaw"><code>@​notatallshaw</code></a> in <a href="">pypa/packaging#1109</a></li>
<li>Fix charset error message formatting by <a href="https://github.com/notatallshaw"><code>@​notatallshaw</code></a> in <a href="">pypa/packaging#1121</a></li>
<li>Handle the <code>key</code> parameter in <code>SpecifierSet.filter</code> when specifiers are empty and prerelease is <code>False</code> by <a href="https://github.com/notatallshaw"><code>@​notatallshaw</code></a> in <a href="">pypa/packaging#1096</a></li>
<li>Standardize inner components of <code>repr</code> output by <a href="https://github.com/henryiii"><code>@​henryiii</code></a> in <a href="">pypa/packaging#1090</a></li>
<li><code>Specifier</code>'s <code>===</code> uses original string, not normalized, when available by <a href="https://github.com/notatallshaw"><code>@​notatallshaw</code></a> in <a href="">pypa/packaging#1124</a></li>
<li>Propagate int-max-str-digits <code>ValueError</code> by <a href="https://github.com/notatallshaw"><code>@​notatallshaw</code></a> in <a href="">pypa/packaging#1155</a></li>
</ul>
<p>Performance:</p>
<ul>
<li>Add fast path for parsing simple versions (digits and dots only) by <a href="https://github.com/notatallshaw"><code>@​notatallshaw</code></a> in <a href="">pypa/packaging#1082</a></li>
<li>Add fast path for <code>Version</code> to <code>Version</code> comparison by skipping <code>_key</code> property by <a href="https://github.com/notatallshaw"><code>@​notatallshaw</code></a> in <a href="">pypa/packaging#1083</a></li>
<li>Cache <code>Version</code> hash value in dedicated slot by <a href="https://github.com/notatallshaw"><code>@​notatallshaw</code></a> in <a href="">pypa/packaging#1118</a></li>
<li>Overhaul <code>_cmpkey</code> to remove use of custom objects by <a href="https://github.com/notatallshaw"><code>@​notatallshaw</code></a> in <a href="">pypa/packaging#1116</a></li>
<li>Skip <code>__replace__</code> in Specifier comparison if not needed by <a href="https://github.com/notatallshaw"><code>@​notatallshaw</code></a> in <a href="">pypa/packaging#1081</a></li>
<li><code>SpecifierSet</code> use <code>tuple</code> instead of <code>frozenset</code> for <code>_specs</code> by <a href="https://github.com/notatallshaw"><code>@​notatallshaw</code></a> in <a href="">pypa/packaging#1108</a></li>
<li>Speed up complex <code>SpecifierSet</code> filtering by implementing cost-based ordering by <a href="https://github.com/notatallshaw"><code>@​notatallshaw</code></a> in <a href="">pypa/packaging#1105</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pypa/packaging/blob/main/CHANGELOG.rst">packaging's changelog</a>.</em></p>
<blockquote>
<p>26.1 - 2026-04-14</p>
<pre><code>
Features:
<ul>
<li>PEP 783: add handling for Emscripten wheel tags in (:pull:<code>804</code>) (old name used in implementation, fixed in next release)</li>
<li>PEP 803: add handling for the <code>abi3.abi3t</code> free-threading tag in (:pull:<code>1099</code>)</li>
<li>PEP 723: add <code>packaging.dependency_groups</code> module, based on the <code>dependency-groups</code> package in (:pull:<code>1065</code>)</li>
<li>Add the <code>packaging.direct_url</code> module in (:pull:<code>944</code>)</li>
<li>Add the <code>packaging.errors</code> module in (:pull:<code>1071</code>)</li>
<li>Add <code>SpecifierSet.is_unsatisfiable</code> using ranges (new internals that will be expanded in future versions) in (:pull:<code>1119</code>)</li>
<li>Add <code>create_compatible_tags_selector</code> to select compatible tags in (:pull:<code>1110</code>)</li>
<li>Add a <code>key</code> argument to <code>SpecifierSet.filter()</code> in (:pull:<code>1068</code>)</li>
<li>Support <code>&amp;amp;</code> and <code>|</code> for <code>Marker</code>'s in (:pull:<code>1146</code>)</li>
<li>Normalize <code>Version.__replace__</code> and add <code>Version.from_parts</code> in (:pull:<code>1078</code>)</li>
<li>Add an option to validate compressed tag set sort order in <code>parse_wheel_filename</code> in (:pull:<code>1150</code>)</li>
</ul>
<p>Behavior adaptations:</p>
<ul>
<li>Narrow exclusion of pre-releases for <code>&amp;lt;V.postN</code> to match spec in (:pull:<code>1140</code>)</li>
<li>Narrow exclusion of post-releases for <code>&amp;gt;V</code> to match spec in (:pull:<code>1141</code>)</li>
<li>Rename <code>format_full_version</code> to <code>_format_full_version</code> to make it visibly private in (:pull:<code>1125</code>)</li>
<li>Restrict local version to ASCII in (:pull:<code>1102</code>)</li>
</ul>
<p>Pylock (PEP 751) updates:</p>
<ul>
<li>Add pylock <code>select</code> function in (:pull:<code>1092</code>)</li>
<li>Document pylock <code>select()</code> method and <code>PylockSelectError</code> in (:pull:<code>1153</code>)</li>
<li>Add <code>filename</code> property to <code>PackageSdist</code> and <code>PackageWheel</code>, more validation in (:pull:<code>1095</code>)</li>
<li>Give preference to path over url in (:pull:<code>1128</code>)</li>
<li>Validate name/version consistency in file names in (:pull:<code>1114</code>)</li>
</ul>
<p>Fixes:</p>
<ul>
<li>Fix <code>&amp;gt;</code> comparison for versions with dev+local segments in (:pull:<code>1097</code>)</li>
<li>Fix incorrect self-comparison for <code>InfinityType</code> and <code>NegativeInfinityType</code> in (:pull:<code>1093</code>)</li>
<li>Canonicalize when deduplicating specifiers in <code>SpecifierSet</code> in (:pull:<code>1109</code>)</li>
<li>Fix charset error message formatting in (:pull:<code>1121</code>)</li>
<li>Handle the <code>key</code> parameter in <code>SpecifierSet.filter</code> when specifiers are empty and prerelease is <code>False</code> in (:pull:<code>1096</code>)</li>
<li>Standardize inner components of <code>repr</code> output in (:pull:<code>1090</code>)</li>
<li><code>Specifier</code>'s <code>===</code> uses original string, not normalized, when available in (:pull:<code>1124</code>)</li>
<li>Propagate int-max-str-digits <code>ValueError</code> in (:pull:<code>1155</code>)</li>
</ul>
<p>Performance:</p>
<ul>
<li>Add fast path for parsing simple versions (digits and dots only) in (:pull:<code>1082</code>)</li>
<li>Add fast path for <code>Version</code> to <code>Version</code> comparison by skipping <code>_key</code> property in (:pull:<code>1083</code>)</li>
<li>Cache <code>Version</code> hash value in dedicated slot in (:pull:<code>1118</code>)</li>
<li>Overhaul <code>_cmpkey</code> to remove use of custom objects in (:pull:<code>1116</code>)</li>
<li>Skip <code>__replace__</code> in Specifier comparison if not needed in (:pull:<code>1081</code>)<br />
&lt;/tr&gt;&lt;/table&gt;<br />
</code></pre></li>
</ul>
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>c1a88a3</code></a> Bump for release</li>
<li><a href=""><code>702c25e</code></a> docs: update changelog for 26.1 (<a href="">#1156</a>)</li>
<li><a href=""><code>3f4f5d4</code></a> Implement <code>is_unsatisfiable</code> on <code>SpecifierSet</code> using ranges (<a href="">#1119</a>)</li>
<li><a href=""><code>06c6555</code></a> Propagate int-max-str-digits ValueError (<a href="">#1155</a>)</li>
<li><a href=""><code>905c90c</code></a> feat: option to validate compressed tag set sort order in `parse_wheel_filena...</li>
<li><a href=""><code>af0026c</code></a> docs(pylock): document select() method and PylockSelectError (<a href="">#1153</a>)</li>
<li><a href=""><code>668da86</code></a> Rename format_full_version to _format_full_version to make it visibly private...</li>
<li><a href=""><code>f294d52</code></a> tests: do not reload the tags module (<a href="">#1152</a>)</li>
<li><a href=""><code>2c6c7df</code></a> feat: add handling for Emscripten wheels tags per PEP 783 (<a href="">#804</a>)</li>
<li><a href=""><code>6762eea</code></a> docs(markers): document &amp; and | operators for combining Marker objects (<a href="">#1151</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pypa/packaging/compare/26.0...26.1">compare view</a></li>
</ul>
</details>
<br />

Updates `pillow` from 12.1.1 to 12.2.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/python-pillow/Pillow/releases">pillow's releases</a>.</em></p>
<blockquote>
<h2>12.2.0</h2>
<p><a href="https://pillow.readthedocs.io/en/stable/releasenotes/12.2.0.html">https://pillow.readthedocs.io/en/stable/releasenotes/12.2.0.html</a></p>
<h2>Documentation</h2>
<ul>
<li>Update 12.2.0 release notes <a href="">#9522</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
<li>Add loader plugins: AMOS abk, Atari Degas, 40+ more obscure formats via Netpbm <a href="">#9482</a> [<a href="https://github.com/bitplane"><code>@​bitplane</code></a>]</li>
<li>Update Python versions <a href="">#9515</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Jeffrey A. Clark -&gt; Jeffrey 'Alex' Clark <a href="">#9513</a> [<a href="https://github.com/aclark4life"><code>@​aclark4life</code></a>]</li>
<li>Add release notes for <a href="">#9394</a>, <a href="">#9419</a> and <a href="">#9456</a> <a href="">#9467</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Add Amiga Workbench .info loader to 3rd party plugins list <a href="">#9459</a> [<a href="https://github.com/bitplane"><code>@​bitplane</code></a>]</li>
<li>Merge PFM documentation into PPM <a href="">#9434</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update macOS tested Pillow versions <a href="">#9431</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Fix CVE number <a href="">#9430</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
</ul>
<h2>Dependencies</h2>
<ul>
<li>Update xz to 5.8.3 <a href="">#9523</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update libjpeg-turbo to 3.1.4.1 <a href="">#9507</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update libpng to 1.6.56 <a href="">#9499</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update freetype to 2.14.3 <a href="">#9485</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Updated libavif to 1.4.1 <a href="">#9479</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Updated harfbuzz to 13.2.1 <a href="">#9461</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update Ghostscript to 10.7.0 <a href="">#9469</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update harfbuzz to 13.0.1 <a href="">#9453</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update libavif to 1.4.0 <a href="">#9460</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update freetype to 2.14.2 <a href="">#9449</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update actions/download-artifact action to v8 <a href="">#9451</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Updated libpng to 1.6.55 <a href="">#9425</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
</ul>
<h2>Testing</h2>
<ul>
<li>Cleanup .spider extension in the same test where it is added <a href="">#9517</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Run tests in parallel via tox for 3.5x speedup <a href="">#9516</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
<li>Enable colour in CI logs <a href="">#9486</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
<li>Update Ghostscript to 10.7.0 <a href="">#9469</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Simplify TGA test code <a href="">#9477</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update tests to check for ValueError when encoding an empty image <a href="">#9464</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Upgrade CI from <code>macos-15-intel</code> to <code>macos-26-intel</code> <a href="">#9454</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
<li>Add check-case-conflict hook <a href="">#9446</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Specify platform when pulling docker image <a href="">#9440</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>GHA: Cache libavif and webp builds for Ubuntu <a href="">#9437</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
<li>Update macOS tested Pillow versions <a href="">#9431</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
</ul>
<h2>Other changes</h2>
<ul>
<li>Check calloc return value <a href="">#9527</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Check all allocs in the Arrow tree <a href="">#9488</a> [<a href="https://github.com/wiredfool"><code>@​wiredfool</code></a>]</li>
<li>Reject non-numeric elements inside list coords <a href="">#9526</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
<li>Move variable declaration inside define <a href="">#9525</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>3c41c09</code></a> 12.2.0 version bump</li>
<li><a href=""><code>cdaa29e</code></a> Check calloc return value (<a href="">#9527</a>)</li>
<li><a href=""><code>585b2f5</code></a> Check calloc return value</li>
<li><a href=""><code>ecf011e</code></a> Check all allocs in the Arrow tree (<a href="">#9488</a>)</li>
<li><a href=""><code>cf6de8c</code></a> Reject non-numeric elements inside list coords (<a href="">#9526</a>)</li>
<li><a href=""><code>ffdcede</code></a> Update 12.2.0 release notes (<a href="">#9522</a>)</li>
<li><a href=""><code>7929d77</code></a> Added security release notes (<a href="">#149</a>)</li>
<li><a href=""><code>c4f7aa5</code></a> Added security release notes</li>
<li><a href=""><code>22cdb5f</code></a> Move variable declaration inside define (<a href="">#9525</a>)</li>
<li><a href=""><code>fc15b3b</code></a> Resize tall images vertically first (<a href="">#9524</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/python-pillow/Pillow/compare/12.1.1...12.2.0">compare view</a></li>
</ul>
</details>
<br />

Updates `pytest` from 9.0.2 to 9.0.3
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pytest-dev/pytest/releases">pytest's releases</a>.</em></p>
<blockquote>
<h2>9.0.3</h2>
<h1>pytest 9.0.3 (2026-04-07)</h1>
<h2>Bug fixes</h2>
<ul>
<li>
<p><a href="">#12444</a>: Fixed <code>pytest.approx</code> which now correctly takes into account <code>~collections.abc.Mapping</code> keys order to compare them.</p>
</li>
<li>
<p><a href="">#13634</a>: Blocking a <code>conftest.py</code> file using the <code>-p no:</code> option is now explicitly disallowed.</p>
<p>Previously this resulted in an internal assertion failure during plugin loading.</p>
<p>Pytest now raises a clear <code>UsageError</code> explaining that conftest files are not plugins and cannot be disabled via <code>-p</code>.</p>
</li>
<li>
<p><a href="">#13734</a>: Fixed crash when a test raises an exceptiongroup with <code>__tracebackhide__ = True</code>.</p>
</li>
<li>
<p><a href="">#14195</a>: Fixed an issue where non-string messages passed to <!-- raw HTML omitted -->unittest.TestCase.subTest()<!-- raw HTML omitted --> were not printed.</p>
</li>
<li>
<p><a href="">#14343</a>: Fixed use of insecure temporary directory (CVE-2025-71176).</p>
</li>
</ul>
<h2>Improved documentation</h2>
<ul>
<li><a href="">#13388</a>: Clarified documentation for <code>-p</code> vs <code>PYTEST_PLUGINS</code> plugin loading and fixed an incorrect <code>-p</code> example.</li>
<li><a href="">#13731</a>: Clarified that capture fixtures (e.g. <code>capsys</code> and <code>capfd</code>) take precedence over the <code>-s</code> / <code>--capture=no</code> command-line options in <code>Accessing captured output from a test function &lt;accessing-captured-output&gt;</code>.</li>
<li><a href="">#14088</a>: Clarified that the default <code>pytest_collection</code> hook sets <code>session.items</code> before it calls <code>pytest_collection_finish</code>, not after.</li>
<li><a href="">#14255</a>: TOML integer log levels must be quoted: Updating reference documentation.</li>
</ul>
<h2>Contributor-facing changes</h2>
<ul>
<li>
<p><a href="">#12689</a>: The test reports are now published to Codecov from GitHub Actions.
The test statistics is visible <a href="https://app.codecov.io/gh/pytest-dev/pytest/tests">on the web interface</a>.</p>
<p>-- by <code>aleguy02</code></p>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>a7d58d7</code></a> Prepare release version 9.0.3</li>
<li><a href=""><code>089d981</code></a> Merge pull request <a href="">#14366</a> from bluetech/revert-14193-backport</li>
<li><a href=""><code>8127eaf</code></a> Revert &quot;Fix: assertrepr_compare respects dict insertion order (<a href="">#14050</a>) (<a href="">#14193</a>)&quot;</li>
<li><a href=""><code>99a7e60</code></a> Merge pull request <a href="">#14363</a> from pytest-dev/patchback/backports/9.0.x/95d8423bd...</li>
<li><a href=""><code>ddee02a</code></a> Merge pull request <a href="">#14343</a> from bluetech/cve-2025-71176-simple</li>
<li><a href=""><code>74eac69</code></a> doc: Update training info (<a href="">#14298</a>) (<a href="">#14301</a>)</li>
<li><a href=""><code>f92dee7</code></a> Merge pull request <a href="">#14267</a> from pytest-dev/patchback/backports/9.0.x/d6fa26c62...</li>
<li><a href=""><code>7ee58ac</code></a> Merge pull request <a href="">#12378</a> from Pierre-Sassoulas/fix-implicit-str-concat-and-d...</li>
<li><a href=""><code>37da870</code></a> Merge pull request <a href="">#14259</a> from mitre88/patch-4 (<a href="">#14268</a>)</li>
<li><a href=""><code>c34bfa3</code></a> Add explanation for string context diffs (<a href="">#14257</a>) (<a href="">#14266</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pytest-dev/pytest/compare/9.0.2...9.0.3">compare view</a></li>
</ul>
</details>
<br />

Updates `pytest-cov` from 7.0.0 to 7.1.0
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pytest-dev/pytest-cov/blob/master/CHANGELOG.rst">pytest-cov's changelog</a>.</em></p>
<blockquote>
<h2>7.1.0 (2026-03-21)</h2>
<ul>
<li>
<p>Fixed total coverage computation to always be consistent, regardless of reporting settings.
Previously some reports could produce different total counts, and consequently can make --cov-fail-under behave different depending on
reporting options.
See <code> &lt;</code>_.</p>
</li>
<li>
<p>Improve handling of ResourceWarning from sqlite3.</p>
<p>The plugin adds warning filter for sqlite3 <code>ResourceWarning</code> unclosed database (since 6.2.0).
It checks if there is already existing plugin for this message by comparing filter regular expression.
When filter is specified on command line the message is escaped and does not match an expected message.
A check for an escaped regular expression is added to handle this case.</p>
<p>With this fix one can suppress <code>ResourceWarning</code> from sqlite3 from command line::</p>
<p>pytest -W &quot;ignore:unclosed database in &lt;sqlite3.Connection object at:ResourceWarning&quot; ...</p>
</li>
<li>
<p>Various improvements to documentation.
Contributed by Art Pelling in <code> &lt;</code>_ and
&quot;vivodi&quot; in <code> &lt;</code><em>.
Also closed <code> &lt;</code></em>.</p>
</li>
<li>
<p>Fixed some assertions in tests.
Contributed by in Markéta Machová in <code> &lt;</code>_.</p>
</li>
<li>
<p>Removed unnecessary coverage configuration copying (meant as a backup because reporting commands had configuration side-effects before coverage 5.0).</p>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>66c8a52</code></a> Bump version: 7.0.0 → 7.1.0</li>
<li><a href=""><code>f707662</code></a> Make the examples use pypy 3.11.</li>
<li><a href=""><code>6049a78</code></a> Make context test use the old ctracer (seems the new sysmon tracer behaves di...</li>
<li><a href=""><code>8ebf20b</code></a> Update changelog.</li>
<li><a href=""><code>861d30e</code></a> Remove the backup context manager  - shouldn't be needed since coverage 5.0, ...</li>
<li><a href=""><code>fd4c956</code></a> Pass the precision on the nulled total (seems that there's some caching goion...</li>
<li><a href=""><code>78c9c4e</code></a> Only run the 3.9 on older deps.</li>
<li><a href=""><code>4849a92</code></a> Punctuation.</li>
<li><a href=""><code>197c35e</code></a> Update changelog and hopefully I don't forget to publish release again :))</li>
<li><a href=""><code>14dc1c9</code></a> Update examples to use 3.11 and make the adhoc layout example look a bit more...</li>
<li>Additional commits viewable in <a href="https://github.com/pytest-dev/pytest-cov/compare/v7.0.0...v7.1.0">compare view</a></li>
</ul>
</details>
<br />

Updates `tox` from 4.50.0 to 4.53.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/tox/releases">tox's releases</a>.</em></p>
<blockquote>
<h2>v4.53.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>✨ feat(toml): allow bare range/labeled dicts in env_list by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/tox#3923</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/tox/compare/4.52.1...4.53.0">https://github.com/tox-dev/tox/compare/4.52.1...4.53.0</a></p>
<h2>v4.52.1</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>use normalize_isa for architecture factor matching by <a href="https://github.com/rahuldevikar"><code>@​rahuldevikar</code></a> in <a href="">tox-dev/tox#3919</a></li>
<li>🐛 fix(pip): invalidate install cache on resolution env var changes by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/tox#3921</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/tox/compare/4.52.0...4.52.1">https://github.com/tox-dev/tox/compare/4.52.0...4.52.1</a></p>
<h2>v4.52.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>remove unsupported --remote flag from gh repo fork by <a href="https://github.com/rahuldevikar"><code>@​rahuldevikar</code></a> in <a href="">tox-dev/tox#3908</a></li>
<li>✨ feat(config): support escaped dots in -x override keys by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/tox#3910</a></li>
<li>🐛 fix(docs): auto-generate manpage from CLI parser by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/tox#3911</a></li>
<li>✨ feat(runner): add PEP 723 inline script metadata support by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/tox#3912</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/tox/compare/4.51.0...4.52.0">https://github.com/tox-dev/tox/compare/4.51.0...4.52.0</a></p>
<h2>v4.51.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>🔒 ci(workflows): add zizmor security auditing by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/tox#3896</a></li>
<li>Add <code>base_python_file</code> config option by <a href="https://github.com/rahuldevikar"><code>@​rahuldevikar</code></a> in <a href="">tox-dev/tox#3899</a></li>
<li>prevent machine ISA from overriding explicit env factors by <a href="https://github.com/rahuldevikar"><code>@​rahuldevikar</code></a> in <a href="">tox-dev/tox#3904</a></li>
<li>🐛 fix(config): fix handling of env_list in nested contexts by <a href="https://github.com/Daverball"><code>@​Daverball</code></a> in <a href="">tox-dev/tox#3905</a></li>
<li>fix: enable persist-credentials for release workflow by <a href="https://github.com/rahuldevikar"><code>@​rahuldevikar</code></a> in <a href="">tox-dev/tox#3907</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/Daverball"><code>@​Daverball</code></a> made their first contribution in <a href="">tox-dev/tox#3905</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/tox/compare/4.50.3...4.51.0">https://github.com/tox-dev/tox/compare/4.50.3...4.51.0</a></p>
<h2>v4.50.3</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/tox/blob/main/docs/changelog.rst">tox's changelog</a>.</em></p>
<blockquote>
<h1>Features - 4.53.0</h1>
<ul>
<li>TOML <code>env_list</code> now accepts bare range dicts (<code>{ prefix = &quot;3.&quot;, start = 12, stop = 14 }</code>) and bare labeled dicts
(<code>{ ecosystem = [&quot;oci&quot;, &quot;python&quot;] }</code>) as top-level items, removing the <code>{ product = [...] }</code> wrapper when there is
only a single factor group - by :user:<code>gaborbernat</code>. (:issue:<code>3923</code>)</li>
</ul>
<h1>Bug fixes - 4.53.0</h1>
<ul>
<li>Nesting a range or labeled dict inside a <code>product</code> factor-group list now raises a clear error pointing at the
un-nesting fix, instead of silently producing a malformed environment name - by :user:<code>gaborbernat</code>. (:issue:<code>3923</code>)</li>
</ul>
<hr />
<p>v4.52.1 (2026-04-09)</p>
<hr />
<h1>Bug fixes - 4.52.1</h1>
<ul>
<li>Changing a resolution-affecting environment variable via <code>set_env</code> (e.g. <code>PIP_INDEX_URL</code>) now invalidates the
install cache and triggers a reinstall, rather than incorrectly reusing the cached environment - by
:user:<code>gaborbernat</code>. (:issue:<code>3917</code>)</li>
<li>Use <code>normalize_isa</code> from <code>python-discovery</code> for architecture factor matching, supporting aliases like <code>i686</code> →
<code>x86</code> and <code>aarch64</code> → <code>arm64</code> - by :user:<code>rahuldevikar</code>. (:issue:<code>3919</code>)</li>
</ul>
<hr />
<p>v4.52.0 (2026-03-30)</p>
<hr />
<h1>Features - 4.52.0</h1>
<ul>
<li>Add <code>virtualenv-pep-723</code> runner that reads dependencies and Python version from :PEP:<code>723</code> inline script metadata —
no need to duplicate them in tox config - by :user:<code>gaborbernat</code>. (:issue:<code>3897</code>)</li>
<li>Support escaped dots (<code>\.</code>) in <code>-x</code>/<code>--override</code> keys, allowing overrides to target environments with dots in
their names such as <code>py3.14</code> - by :user:<code>gaborbernat</code>. (:issue:<code>3910</code>)</li>
</ul>
<h1>Bug fixes - 4.52.0</h1>
<ul>
<li>Auto-generate the manpage from the CLI argparse parser at wheel build time, fixing broken section headers and
documenting all commands and options - by :user:<code>gaborbernat</code>. (:issue:<code>3878</code>)</li>
</ul>
<h1>Miscellaneous internal changes - 4.52.0</h1>
<ul>
<li>Remove unsupported <code>--remote</code> flag from <code>gh repo fork</code> in the update-schemastore workflow, as recent versions of
<code>gh</code> no longer accept it - by :user:<code>rahuldevikar</code>. (:issue:<code>3908</code>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>4c584f2</code></a> release 4.53.0</li>
<li><a href=""><code>ddd7280</code></a> ✨ feat(toml): allow bare range/labeled dicts in env_list (<a href="">#3923</a>)</li>
<li><a href=""><code>3e7f9df</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#3922</a>)</li>
<li><a href=""><code>71ef9bf</code></a> release 4.52.1</li>
<li><a href=""><code>d15c8fa</code></a> 🐛 fix(pip): invalidate install cache on resolution env var changes (<a href="">#3921</a>)</li>
<li><a href=""><code>c1add25</code></a> build(deps): bump pypa/gh-action-pypi-publish from 1.13.0 to 1.14.0 (<a href="">#3920</a>)</li>
<li><a href=""><code>1866b9d</code></a> use normalize_isa for architecture factor matching (<a href="">#3919</a>)</li>
<li><a href=""><code>ec77d9f</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#3918</a>)</li>
<li><a href=""><code>e7052a6</code></a> build(deps): bump astral-sh/setup-uv from 7.6.0 to 8.0.0 (<a href="">#3915</a>)</li>
<li><a href=""><code>d83d577</code></a> release 4.52.0</li>
<li>Additional commits viewable in <a href="https://github.com/tox-dev/tox/compare/4.50.0...4.53.0">compare view</a></li>
</ul>
</details>
<br />

Updates `tox-uv` from 1.33.4 to 1.35.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/tox-uv/releases">tox-uv's releases</a>.</em></p>
<blockquote>
<h2>1.35.1</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>fix(lock-runner): respect UV_FROZEN env var and --frozen in uv_sync_flags by <a href="https://github.com/alexholtz"><code>@​alexholtz</code></a> in <a href="">tox-dev/tox-uv#327</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/alexholtz"><code>@​alexholtz</code></a> made their first contribution in <a href="">tox-dev/tox-uv#327</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/tox-uv/compare/1.35.0...1.35.1">https://github.com/tox-dev/tox-uv/compare/1.35.0...1.35.1</a></p>
<h2>1.35.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>Add machine and architecture handling to version spec by <a href="https://github.com/griels"><code>@​griels</code></a> in <a href="">tox-dev/tox-uv#321</a></li>
<li>🐛 fix(installer): invalidate install cache on UV_* env var changes by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/tox-uv#325</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/griels"><code>@​griels</code></a> made their first contribution in <a href="">tox-dev/tox-uv#321</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/tox-uv/compare/1.34.0...1.35.0">https://github.com/tox-dev/tox-uv/compare/1.34.0...1.35.0</a></p>
<h2>1.34.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>🔒 ci(workflows): add zizmor security auditing by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/tox-uv#317</a></li>
<li>✨ feat(runner): add PEP 723 inline script metadata support by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/tox-uv#319</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/tox-uv/compare/1.33.4...1.34.0">https://github.com/tox-dev/tox-uv/compare/1.33.4...1.34.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>8b0497e</code></a> fix(lock-runner): respect UV_FROZEN env var and --frozen in uv_sync_flags (<a href="">#327</a>)</li>
<li><a href=""><code>ad30d57</code></a> build(deps): bump pypa/gh-action-pypi-publish from 1.13.0 to 1.14.0 (<a href="">#324</a>)</li>
<li><a href=""><code>9fc7741</code></a> 🐛 fix(installer): invalidate install cache on UV_* env var changes (<a href="">#325</a>)</li>
<li><a href=""><code>928cd46</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#323</a>)</li>
<li><a href=""><code>84997a5</code></a> build(deps): bump astral-sh/setup-uv from 7.6.0 to 8.0.0 (<a href="">#322</a>)</li>
<li><a href=""><code>8072144</code></a> Add machine and architecture handling to version spec (<a href="">#321</a>)</li>
<li><a href=""><code>d9b72cf</code></a> ✨ feat(runner): add PEP 723 inline script metadata support (<a href="">#319</a>)</li>
<li><a href=""><code>0215281</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#318</a>)</li>
<li><a href=""><code>4deee33</code></a> 🔒 ci(workflows): add zizmor security auditing (<a href="">#317</a>)</li>
<li><a href=""><code>60d1fd6</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#316</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/tox-dev/tox-uv/compare/1.33.4...1.35.1">compare view</a></li>
</ul>
</details>
<br />

Updates `mypy` from 1.19.1 to 1.20.1
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/python/mypy/blob/master/CHANGELOG.md">mypy's changelog</a>.</em></p>
<blockquote>
<h3>Mypy 1.20.1</h3>
<ul>
<li>Always disable sync in SQLite cache (Ivan Levkivskyi, PR <a href="">21184</a>)</li>
<li>Temporarily skip few base64 tests (Ivan Levkivskyi, PR <a href="">21193</a>)</li>
<li>Revert <code>dict.__or__</code> typeshed change (Ivan Levkivskyi, PR <a href="">21186</a>)</li>
<li>Fix narrowing for match case with variadic tuples (Shantanu, PR <a href="">21192</a>)</li>
<li>Avoid narrowing <code>type[T]</code> in type calls (Shantanu, PR <a href="">21174</a>)</li>
<li>Fix regression for catching empty tuple in except (Shantanu, PR <a href="">21153</a>)</li>
<li>Fix reachability for frozenset and dict view narrowing (Shantanu, PR <a href="">21151</a>)</li>
<li>Fix narrowing with chained comparison (Shantanu, PR <a href="">21150</a>)</li>
<li>Avoid narrowing to unreachable at module level (Shantanu, PR <a href="">21144</a>)</li>
<li>Allow dangerous identity comparisons to <code>Any</code> typed variables (Shantanu, PR <a href="">21142</a>)</li>
<li><code>--warn-unused-config</code> should not be a strict flag (Ivan Levkivskyi, PR <a href="">21139</a>)</li>
</ul>
<h3>Mypy 1.20.2</h3>
<ul>
<li>Use WAL with SQLite cache and fix close (Shantanu, PR <a href="">21154</a>)</li>
<li>Adjust SQLite journal mode (Ivan Levkivskyi, PR <a href="">21217</a>)</li>
<li>Correctly aggregate narrowing information on parent expressions (Shantanu, PR <a href="">21206</a>)</li>
<li>Fix regression related to generic callables (Shantanu, PR <a href="">21208</a>)</li>
<li>Fix regression by avoiding widening types in some contexts (Shantanu, PR <a href="">21242</a>)</li>
<li>Fix slicing in non-strict optional mode (Shantanu, PR <a href="">21282</a>)</li>
<li>mypyc: Fix match statement semantics for &quot;or&quot; pattern (Shantanu, PR <a href="">21156</a>)</li>
<li>mypyc: Fix issue with module dunder attributes (Piotr Sawicki, PR <a href="">21275</a>)</li>
<li>Initial support for Python 3.15.0a8 (Marc Mueller, PR <a href="">21255</a>)</li>
</ul>
<h3>Acknowledgements</h3>
<p>Thanks to all mypy contributors who contributed to this release:</p>
<ul>
<li>A5rocks</li>
<li>Aaron Wieczorek</li>
<li>Adam Turner</li>
<li>Ali Hamdan</li>
<li>asce</li>
<li>BobTheBuidler</li>
<li>Brent Westbrook</li>
<li>Brian Schubert</li>
<li>bzoracler</li>
<li>Chris Burroughs</li>
<li>Christoph Tyralla</li>
<li>Colin Watson</li>
<li>Donghoon Nam</li>
<li>E. M. Bray</li>
<li>Emma Smith</li>
<li>Ethan Sarp</li>
<li>George Ogden</li>
<li>getzze</li>
<li>grayjk</li>
<li>Gregor Riepl</li>
<li>Ivan Levkivskyi</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>c60e8bf</code></a> Bump version to 1.20.1</li>
<li><a href=""><code>842e492</code></a> Always disable sync in SQLite cache (<a href="">#21184</a>)</li>
<li><a href=""><code>e82a046</code></a> Temporarily skip few base64 tests (<a href="">#21193</a>)</li>
<li><a href=""><code>f7fa418</code></a> Revert dict.<strong>or</strong> typeshed change (<a href="">#21186</a>)</li>
<li><a href=""><code>a2e8ee1</code></a> Fix narrowing for match case with variadic tuples (<a href="">#21192</a>)</li>
<li><a href=""><code>521f88f</code></a> Avoid narrowing type[T] in type calls (<a href="">#21174</a>)</li>
<li><a href=""><code>a4876e9</code></a> Fix regression for catching empty tuple in except (<a href="">#21153</a>)</li>
<li><a href=""><code>6fccffc</code></a> Fix reachability for frozenset and dict view narrowing (<a href="">#21151</a>)</li>
<li><a href=""><code>de50419</code></a> Fix narrowing with chained comparison (<a href="">#21150</a>)</li>
<li><a href=""><code>eafcf18</code></a> Avoid narrowing to unreachable at module level (<a href="">#21144</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/python/mypy/compare/v1.19.1...v1.20.1">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `09bdbf4c40a6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.