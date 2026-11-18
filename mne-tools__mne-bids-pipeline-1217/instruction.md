# Issue

**Title:** [dependabot]: Bump the deps group with 11 updates

## Description

Bumps the deps group with 11 updates:

| Package | From | To |
| --- | --- | --- |
| [filelock](https://github.com/tox-dev/py-filelock) | `3.25.2` | `3.28.0` |
| [packaging](https://github.com/pypa/packaging) | `26.0` | `26.1` |
| [pydantic](https://github.com/pydantic/pydantic) | `2.12.5` | `2.13.1` |
| [pyvista](https://github.com/pyvista/pyvista) | `0.47.2` | `0.47.3` |
| [rich](https://github.com/Textualize/rich) | `14.3.3` | `15.0.0` |
| [lefthook](https://github.com/evilmartians/lefthook) | `2.1.4` | `2.1.6` |
| [ruff](https://github.com/astral-sh/ruff) | `0.15.10` | `0.15.11` |
| [tombi](https://github.com/tombi-toml/tombi) | `0.9.16` | `0.9.18` |
| [ty](https://github.com/astral-sh/ty) | `0.0.29` | `0.0.31` |
| [mike](https://github.com/jimporter/mike) | `2.1.4` | `2.2.0` |
| [pydantic-core](https://github.com/pydantic/pydantic) | `2.41.5` | `2.46.1` |

Updates `filelock` from 3.25.2 to 3.28.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/py-filelock/releases">filelock's releases</a>.</em></p>
<blockquote>
<h2>3.28.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>🐛 fix(ci): unbreak release workflow, publish to PyPI again by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#529</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.27.0...3.28.0">https://github.com/tox-dev/filelock/compare/3.27.0...3.28.0</a></p>
<h2>3.27.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>✨ feat(rw): add SoftReadWriteLock for NFS and HPC clusters by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#528</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.26.1...3.27.0">https://github.com/tox-dev/filelock/compare/3.26.1...3.27.0</a></p>
<h2>3.26.1</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>🐛 fix(asyncio): add <strong>exit</strong> to BaseAsyncFileLock and fix <strong>del</strong> loop handling by <a href="https://github.com/naarob"><code>@​naarob</code></a> in <a href="">tox-dev/filelock#518</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/naarob"><code>@​naarob</code></a> made their first contribution in <a href="">tox-dev/filelock#518</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.26.0...3.26.1">https://github.com/tox-dev/filelock/compare/3.26.0...3.26.1</a></p>
<h2>3.26.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>🔒 ci(workflows): add zizmor security auditing by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#517</a></li>
<li>🔧 fix(ci): restore git credentials for release job by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#520</a></li>
<li>✨ feat(soft): add PID inspection and lock breaking by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#524</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.25.2...3.26.0">https://github.com/tox-dev/filelock/compare/3.25.2...3.26.0</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/filelock/blob/main/docs/changelog.rst">filelock's changelog</a>.</em></p>
<blockquote>
<p>###########
Changelog
###########</p>
<hr />
<p>3.28.0 (2026-04-14)</p>
<hr />
<ul>
<li>🐛 fix(ci): unbreak release workflow, publish to PyPI again :pr:<code>529</code></li>
</ul>
<hr />
<p>3.26.1 (2026-04-09)</p>
<hr />
<ul>
<li>🐛 fix(asyncio): add <strong>exit</strong> to BaseAsyncFileLock and fix <strong>del</strong> loop handling :pr:<code>518</code> - by :user:<code>naarob</code></li>
<li>build(deps): bump pypa/gh-action-pypi-publish from 1.13.0 to 1.14.0 :pr:<code>525</code> - by :user:<code>dependabot[bot]</code></li>
</ul>
<hr />
<p>3.26.0 (2026-04-06)</p>
<hr />
<ul>
<li>✨ feat(soft): add PID inspection and lock breaking :pr:<code>524</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>523</code> - by :user:<code>pre-commit-ci[bot]</code></li>
<li>build(deps): bump astral-sh/setup-uv from 7.6.0 to 8.0.0 :pr:<code>522</code> - by :user:<code>dependabot[bot]</code></li>
<li>Remove persist-credentials: false from release job :pr:<code>520</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>519</code> - by :user:<code>pre-commit-ci[bot]</code></li>
<li>🔒 ci(workflows): add zizmor security auditing :pr:<code>517</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>516</code> - by :user:<code>pre-commit-ci[bot]</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>514</code> - by :user:<code>pre-commit-ci[bot]</code></li>
</ul>
<hr />
<p>3.25.2 (2026-03-11)</p>
<hr />
<ul>
<li>🐛 fix(unix): suppress EIO on close in Docker bind mounts :pr:<code>513</code></li>
</ul>
<hr />
<p>3.25.1 (2026-03-09)</p>
<hr />
<ul>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>510</code> - by :user:<code>pre-commit-ci[bot]</code></li>
<li>🐛 fix(win): restore best-effort lock file cleanup on release :pr:<code>511</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>508</code> - by :user:<code>pre-commit-ci[bot]</code></li>
<li>📝 docs(logo): add branded project logo :pr:<code>507</code></li>
</ul>
<hr />
<p>3.25.0 (2026-03-01)</p>
<hr />
<ul>
<li>✨ feat(async): add AsyncReadWriteLock :pr:<code>506</code></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>55de20c</code></a> Release 3.28.0</li>
<li><a href=""><code>476b0e4</code></a> 🐛 fix(ci): unbreak release workflow, publish to PyPI again (<a href="">#529</a>)</li>
<li><a href=""><code>824713e</code></a> ✨ feat(rw): add SoftReadWriteLock for NFS and HPC clusters (<a href="">#528</a>)</li>
<li><a href=""><code>9879de9</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#527</a>)</li>
<li><a href=""><code>4cfab49</code></a> Release 3.26.1</li>
<li><a href=""><code>734c9f2</code></a> 🐛 fix(asyncio): add <strong>exit</strong> to BaseAsyncFileLock and fix <strong>del</strong> loop handli...</li>
<li><a href=""><code>c9f9cb4</code></a> build(deps): bump pypa/gh-action-pypi-publish from 1.13.0 to 1.14.0 (<a href="">#525</a>)</li>
<li><a href=""><code>ad728d7</code></a> Release 3.26.0</li>
<li><a href=""><code>f8a9849</code></a> ✨ feat(soft): add PID inspection and lock breaking (<a href="">#524</a>)</li>
<li><a href=""><code>fc53a83</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#523</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/tox-dev/py-filelock/compare/3.25.2...3.28.0">compare view</a></li>
</ul>
</details>
<br />

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
<li>PEP 783: add handling for Emscripten wheel tags in (:pull:<code>804</code>)</li>
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

Updates `pydantic` from 2.12.5 to 2.13.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pydantic/pydantic/releases">pydantic's releases</a>.</em></p>
<blockquote>
<h2>v2.13.1 2026-04-15</h2>
<h2>v2.13.1 (2026-04-15)</h2>
<h3>What's Changed</h3>
<h4>Fixes</h4>
<ul>
<li>Fix <code>ValidationInfo.data</code> missing with <code>model_validate_json()</code> by <a href="https://github.com/davidhewitt"><code>@​davidhewitt</code></a> in <a href="">#13079</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/pydantic/pydantic/compare/v2.13.0...v2.13.1">https://github.com/pydantic/pydantic/compare/v2.13.0...v2.13.1</a></p>
<h2>v2.13.0 2026-04-13</h2>
<h2>v2.13.0 (2026-04-13)</h2>
<p>The highlights of the v2.13 release are available in the <a href="https://pydantic.dev/articles/pydantic-v2-13-release">blog post</a>.
Several minor changes (considered non-breaking changes according to our <a href="https://pydantic.dev/docs/validation/2.13/get-started/version-policy/#pydantic-v2">versioning policy</a>) are also included in this release. Make sure to look into them before upgrading.</p>
<p>This release contains the updated <code>pydantic.v1</code> namespace, matching version 1.10.26 which includes support for Python 3.14.</p>
<h3>What's Changed</h3>
<p>See the beta releases for all changes sinces 2.12.</p>
<h4>Packaging</h4>
<ul>
<li>Add zizmor for GitHub Actions workflow linting by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13039</a></li>
<li>Update jiter to v0.14.0 to fix a segmentation fault on musl Linux by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13064</a></li>
</ul>
<h4>New Features</h4>
<ul>
<li>Allow default factories of private attributes to take validated model data by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13013</a></li>
</ul>
<h4>Changes</h4>
<ul>
<li>Warn when serializing fixed length tuples with too few items by <a href="https://github.com/arvindsaripalli"><code>@​arvindsaripalli</code></a> in <a href="">#13016</a></li>
</ul>
<h4>Fixes</h4>
<ul>
<li>Change type of <code>Any</code> when synthesizing <code>_build_sources</code> for  <code>BaseSettings.__init__()</code> signature in the mypy plugin by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13049</a></li>
<li>Fix model equality when using runtime <code>extra</code> configuration by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13062</a></li>
</ul>
<h3>New Contributors</h3>
<ul>
<li><a href="https://github.com/arvindsaripalli"><code>@​arvindsaripalli</code></a> made their first contribution in <a href="">#13016</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/pydantic/pydantic/compare/v2.12.0...v2.13.0">https://github.com/pydantic/pydantic/compare/v2.12.0...v2.13.0</a></p>
<h2>v2.13.0b3 2026-03-31</h2>
<!-- raw HTML omitted -->
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pydantic/pydantic/blob/v2.13.1/HISTORY.md">pydantic's changelog</a>.</em></p>
<blockquote>
<h2>v2.13.1 (2026-04-15)</h2>
<p><a href="https://github.com/pydantic/pydantic/releases/tag/v2.13.1">GitHub release</a></p>
<h3>What's Changed</h3>
<h4>Fixes</h4>
<ul>
<li>Fix <code>ValidationInfo.data</code> missing with <code>model_validate_json()</code> by <a href="https://github.com/davidhewitt"><code>@​davidhewitt</code></a> in <a href="">#13079</a></li>
</ul>
<h2>v2.13.0 (2026-04-13)</h2>
<p><a href="https://github.com/pydantic/pydantic/releases/tag/v2.13.0">GitHub release</a></p>
<p>The highlights of the v2.13 release are available in the <a href="https://pydantic.dev/articles/pydantic-v2-13-release">blog post</a>.
Several minor changes (considered non-breaking changes according to our <a href="https://pydantic.dev/docs/validation/2.13/get-started/version-policy/#pydantic-v2">versioning policy</a>)
are also included in this release. Make sure to look into them before upgrading.</p>
<p>This release contains the updated <code>pydantic.v1</code> namespace, matching version 1.10.26 which includes support for Python 3.14.</p>
<h3>What's Changed</h3>
<p>See the beta releases for all changes sinces 2.12.</p>
<h4>New Features</h4>
<ul>
<li>Allow default factories of private attributes to take validated model data by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13013</a></li>
</ul>
<h4>Changes</h4>
<ul>
<li>Warn when serializing fixed length tuples with too few items by <a href="https://github.com/arvindsaripalli"><code>@​arvindsaripalli</code></a> in <a href="">#13016</a></li>
</ul>
<h4>Fixes</h4>
<ul>
<li>Change type of <code>Any</code> when synthesizing <code>_build_sources</code> for  <code>BaseSettings.__init__()</code> signature in the mypy plugin by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13049</a></li>
<li>Fix model equality when using runtime <code>extra</code> configuration by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13062</a></li>
</ul>
<h4>Packaging</h4>
<ul>
<li>Add zizmor for GitHub Actions workflow linting by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13039</a></li>
<li>Update jiter to v0.14.0 to fix a segmentation fault on musl Linux by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13064</a></li>
</ul>
<h3>New Contributors</h3>
<ul>
<li><a href="https://github.com/arvindsaripalli"><code>@​arvindsaripalli</code></a> made their first contribution in <a href="">#13016</a></li>
</ul>
<h2>v2.13.0b3 (2026-03-31)</h2>
<p><a href="https://github.com/pydantic/pydantic/releases/tag/v2.13.0b3">GitHub release</a></p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>d45d8be</code></a> Prepare release 2.13.1</li>
<li><a href=""><code>54aca60</code></a> Fix <code>ValidationInfo.data</code> missing with <code>model_validate_json()</code></li>
<li><a href=""><code>46bf4fa</code></a> Fix Pydantic release workflow (<a href="">#13067</a>)</li>
<li><a href=""><code>1b359ed</code></a> Prepare release v2.13.0 (<a href="">#13065</a>)</li>
<li><a href=""><code>b1bf194</code></a> Fix model equality when using runtime <code>extra</code> configuration (<a href="">#13062</a>)</li>
<li><a href=""><code>17a35e3</code></a> Update jiter to v0.14.0 (<a href="">#13064</a>)</li>
<li><a href=""><code>feea402</code></a> Use <code>simulation</code> mode in Codspeed CI (<a href="">#13063</a>)</li>
<li><a href=""><code>671c9b0</code></a> Add basic benchmarks for model equality (<a href="">#13061</a>)</li>
<li><a href=""><code>d17d71e</code></a> Bump cryptography from 46.0.6 to 46.0.7 (<a href="">#13056</a>)</li>
<li><a href=""><code>919d61a</code></a> 👥 Update Pydantic People (<a href="">#13059</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pydantic/pydantic/compare/v2.12.5...v2.13.1">compare view</a></li>
</ul>
</details>
<br />

Updates `pyvista` from 0.47.2 to 0.47.3
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>6173f04</code></a> ignore numpy nightly warning</li>
<li><a href=""><code>e8a8f6f</code></a> Remove 9.6.1 restriction</li>
<li>See full diff in <a href="https://github.com/pyvista/pyvista/compare/v0.47.2...v0.47.3">compare view</a></li>
</ul>
</details>
<br />

Updates `rich` from 14.3.3 to 15.0.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/Textualize/rich/releases">rich's releases</a>.</em></p>
<blockquote>
<h2>The So Long 3.8 Release</h2>
<p>A few fixes. The major version bump is to honor the passing of 3.8 support which reached its EOL in October 7, 2024</p>
<h2>[15.0.0] - 2026-04-12</h2>
<h3>Changed</h3>
<ul>
<li>Breaking change: Dropped support for Python3.8</li>
</ul>
<h3>Fixed</h3>
<ul>
<li>Fixed empty print ignoring the <code>end</code> parameter <a href="">Textualize/rich#4075</a></li>
<li>Fixed <code>Text.from_ansi</code> removing newlines <a href="">Textualize/rich#4076</a></li>
<li>Fixed <code>FileProxy.isatty</code> not proxying <a href="">Textualize/rich#4077</a></li>
<li>Fixed inline code in Markdown tables cells <a href="">Textualize/rich#4079</a></li>
</ul>
<h2>The Faster Startup Release</h2>
<p>No new features in this release, but there should be improved startup time for Rich apps, and potentially improved runtime if you have a lot of links.</p>
<h2>[14.3.4] - 2026-04-11</h2>
<h3>Changed</h3>
<ul>
<li>Improved import time with lazy loading <a href="">Textualize/rich#4070</a></li>
<li>Changed link id generation to avoid random number generation at runtime <a href="">Textualize/rich#3845</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/Textualize/rich/blob/master/CHANGELOG.md">rich's changelog</a>.</em></p>
<blockquote>
<h2>[15.0.0] - 2026-04-12</h2>
<h3>Changed</h3>
<ul>
<li>Breaking change: Dropped support for Python3.8</li>
</ul>
<h3>Fixed</h3>
<ul>
<li>Fixed empty print ignoring the <code>end</code> parameter <a href="">Textualize/rich#4075</a></li>
<li>Fixed <code>Text.from_ansi</code> removing newlines <a href="">Textualize/rich#4076</a></li>
<li>Fixed <code>FileProxy.isatty</code> not proxying <a href="">Textualize/rich#4077</a></li>
<li>Fixed inline code in Markdown tables cells <a href="">Textualize/rich#4079</a></li>
</ul>
<h2>[14.3.4] - 2026-04-11</h2>
<h3>Changed</h3>
<ul>
<li>Improved import time with lazy loading <a href="">Textualize/rich#4070</a></li>
<li>Changed link id generation to avoid random number generation at runtime <a href="">Textualize/rich#3845</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>6ac483c</code></a> correction</li>
<li><a href=""><code>458a910</code></a> Merge pull request <a href="">#4080</a> from Textualize/bump1500</li>
<li><a href=""><code>82e06e0</code></a> changelog</li>
<li><a href=""><code>d6556bc</code></a> bump to 15.0.0</li>
<li><a href=""><code>ffe2edc</code></a> Merge pull request <a href="">#4079</a> from Textualize/inline-table-code</li>
<li><a href=""><code>cf3b5a1</code></a> changelog</li>
<li><a href=""><code>77f0edb</code></a> remove comments</li>
<li><a href=""><code>7ef2d05</code></a> fix inline code in table cells</li>
<li><a href=""><code>19c67b9</code></a> Merge pull request <a href="">#4077</a> from Textualize/isattry</li>
<li><a href=""><code>494b795</code></a> changelog</li>
<li>Additional commits viewable in <a href="https://github.com/Textualize/rich/compare/v14.3.3...v15.0.0">compare view</a></li>
</ul>
</details>
<br />

Updates `lefthook` from 2.1.4 to 2.1.6
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/evilmartians/lefthook/releases">lefthook's releases</a>.</em></p>
<blockquote>
<h2>v2.1.6</h2>
<h2>Changelog</h2>
<ul>
<li>bf73ea2f1ea5468c9af7a6f06b5ef8cd43e66040 fix(packaging): do not pipe stdout and stderr (<a href="">#1382</a>)</li>
<li>04da00697cd8a6241023c1962feb720eeaa62698 fix(windows): normalize lefthook path for sh script (<a href="">#1383</a>)</li>
<li>de9597a1bf456d2cf0fbcb8816858b6e5cf6b609 fix: log full scoped name for skipped jobs (<a href="">#1291</a>)</li>
<li>eb3e70dbbd2442200ec8ff2140a3ee9daa7d9e70 fix: normalize <code>root</code> to always include trailing slash before path replacement (<a href="">#1381</a>)</li>
<li>f90f3f570ef9227ddf345a79cec687dac41a5d31 fix: skip pty allocation when stdout is not a terminal (<a href="">#1393</a>)</li>
</ul>
<h2>v2.1.5</h2>
<h2>Changelog</h2>
<ul>
<li>afac466157f88b5a5f9d03eb28acc90b095a4b5d chore(golangci-lint): upgrade to 2.11.4 (<a href="">#1362</a>)</li>
<li>f8e73b947e2eefd6950d6a19c20bbde19070809d chore: fix golangci-lint version lookup</li>
<li>4564da343b1497f73f8a82f6104e1b5903f8a081 chore: move golangci-lint version to .tool-versions (<a href="">#1349</a>)</li>
<li>236a5bd07c650aaa882963d68ab5e5e654a47681 chore: small cleanup (<a href="">#1370</a>)</li>
<li>5ddf2206dd23e826c5434392e034fa7db523cd3d deps: April 2026 (<a href="">#1375</a>)</li>
<li>e26c719f5a85e8ff35871e9724649714d6f05c13 fix: git repository merge issue (<a href="">#1372</a>)</li>
<li>3503a3b102c2b41c298e1e7dc6549181508518a6 fix: prevent <code>lefthook run</code> from overwriting global hooks (<a href="">#1371</a>)</li>
<li>f3fc175f6c638fd54ab49b8d7c060898f936c934 fix: use pre-push stdin for push file detection (<a href="">#1368</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/evilmartians/lefthook/blob/master/CHANGELOG.md">lefthook's changelog</a>.</em></p>
<blockquote>
<h2>2.1.6 (2026-04-16)</h2>
<ul>
<li>fix: normalize lefthook path for sh script (<a href="">#1383</a>) by <a href="https://github.com/AndrewKahr"><code>@​AndrewKahr</code></a></li>
<li>fix: normalize <code>root</code> to always include trailing slash before path replacement (<a href="">#1381</a>) by <a href="https://github.com/Copilot"><code>@​Copilot</code></a></li>
<li>fix: skip pty allocation when stdout is not a terminal (<a href="">#1393</a>) by <a href="https://github.com/technicalpickles"><code>@​technicalpickles</code></a></li>
<li>docs: upgrade docmd (<a href="">#1391</a>) by <a href="https://github.com/mrexox"><code>@​mrexox</code></a></li>
<li>fix: log full scoped name for skipped jobs (<a href="">#1291</a>) by <a href="https://github.com/scop"><code>@​scop</code></a></li>
<li>fix: do not pipe stdout and stderr (<a href="">#1382</a>) by <a href="https://github.com/mrexox"><code>@​mrexox</code></a></li>
</ul>
<h2>2.1.5 (2026-04-06)</h2>
<ul>
<li>deps: April 2026 (<a href="">#1375</a>) by <a href=""><code>@​mrexox</code></a></li>
<li>docs: update documentation and docs for claude (<a href="">#1373</a>) by <a href=""><code>@​mrexox</code></a></li>
<li>fix: git repository merge issue (<a href="">#1372</a>) by <a href=""><code>@​mrexox</code></a></li>
<li>fix: use pre-push stdin for push file detection (<a href="">#1368</a>) by <a href=""><code>@​supitsdu</code></a></li>
<li>chore: small cleanup (<a href="">#1370</a>) by <a href=""><code>@​mrexox</code></a></li>
<li>fix: prevent <code>lefthook run</code> from overwriting global hooks (<a href="">#1371</a>) by <a href=""><code>@​ivy</code></a></li>
<li>chore: upgrade to 2.11.4 (<a href="">#1362</a>) by <a href=""><code>@​scop</code></a></li>
<li>chore: fix golangci-lint version lookup by <a href=""><code>@​mrexox</code></a></li>
<li>chore: move golangci-lint version to .tool-versions (<a href="">#1349</a>) by <a href=""><code>@​scop</code></a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>679ce27</code></a> 2.1.6: fixes for Windows and AI tools execution</li>
<li><a href=""><code>04da006</code></a> fix(windows): normalize lefthook path for sh script (<a href="">#1383</a>)</li>
<li><a href=""><code>eb3e70d</code></a> fix: normalize <code>root</code> to always include trailing slash before path replacemen...</li>
<li><a href=""><code>f90f3f5</code></a> fix: skip pty allocation when stdout is not a terminal (<a href="">#1393</a>)</li>
<li><a href=""><code>1481e9d</code></a> docs: upgrade docmd (<a href="">#1391</a>)</li>
<li><a href=""><code>de9597a</code></a> fix: log full scoped name for skipped jobs (<a href="">#1291</a>)</li>
<li><a href=""><code>bf73ea2</code></a> fix(packaging): do not pipe stdout and stderr (<a href="">#1382</a>)</li>
<li><a href=""><code>4cec579</code></a> 2.1.5: prevent overwriting global hooks and fix pre-push for sha256 repos</li>
<li><a href=""><code>5ddf220</code></a> deps: April 2026 (<a href="">#1375</a>)</li>
<li><a href=""><code>0c16199</code></a> docs: update documentation and docs for claude (<a href="">#1373</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/evilmartians/lefthook/compare/v2.1.4...v2.1.6">compare view</a></li>
</ul>
</details>
<br />

Updates `ruff` from 0.15.10 to 0.15.11
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.15.11</h2>
<h2>Release Notes</h2>
<p>Released on 2026-04-16.</p>
<h3>Preview features</h3>
<ul>
<li>[<code>ruff</code>] Ignore <code>RUF029</code> when function is decorated with <code>asynccontextmanager</code> (<a href="">#24642</a>)</li>
<li>[<code>airflow</code>] Implement <code>airflow-xcom-pull-in-template-string</code> (<code>AIR201</code>) (<a href="">#23583</a>)</li>
<li>[<code>flake8-bandit</code>] Fix <code>S103</code> false positives and negatives in mask analysis (<a href="">#24424</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>[<code>flake8-async</code>] Omit overridden methods for <code>ASYNC109</code> (<a href="">#24648</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>[<code>flake8-async</code>] Add override mention to <code>ASYNC109</code> docs (<a href="">#24666</a>)</li>
<li>Update Neovim config examples to use <code>vim.lsp.config</code> (<a href="">#24577</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/augustelalande"><code>@​augustelalande</code></a></li>
<li><a href="https://github.com/anishgirianish"><code>@​anishgirianish</code></a></li>
<li><a href="https://github.com/benberryallwood"><code>@​benberryallwood</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/Dev-iL"><code>@​Dev-iL</code></a></li>
</ul>
<h2>Install ruff 0.15.11</h2>
<h3>Install prebuilt binaries via shell script</h3>
<pre lang="sh"><code>curl --proto '=https' --tlsv1.2 -LsSf https://releases.astral.sh/github/ruff/releases/download/0.15.11/ruff-installer.sh | sh
</code></pre>
<h3>Install prebuilt binaries via powershell script</h3>
<pre lang="sh"><code>powershell -ExecutionPolicy Bypass -c &quot;irm https://releases.astral.sh/github/ruff/releases/download/0.15.11/ruff-installer.ps1 | iex&quot;
</code></pre>
<h2>Download ruff 0.15.11</h2>
<table>
<thead>
<tr>
<th>File</th>
<th>Platform</th>
<th>Checksum</th>
</tr>
</thead>
<tbody>
<tr>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.15.11/ruff-aarch64-apple-darwin.tar.gz">ruff-aarch64-apple-darwin.tar.gz</a></td>
<td>Apple Silicon macOS</td>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.15.11/ruff-aarch64-apple-darwin.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.15.11/ruff-x86_64-apple-darwin.tar.gz">ruff-x86_64-apple-darwin.tar.gz</a></td>
<td>Intel macOS</td>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.15.11/ruff-x86_64-apple-darwin.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.15.11/ruff-aarch64-pc-windows-msvc.zip">ruff-aarch64-pc-windows-msvc.zip</a></td>
<td>ARM64 Windows</td>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.15.11/ruff-aarch64-pc-windows-msvc.zip.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.15.11/ruff-i686-pc-windows-msvc.zip">ruff-i686-pc-windows-msvc.zip</a></td>
<td>x86 Windows</td>
<td><a href="https://releases.astral.sh/github/ruff/releases/download/0.15.11/ruff-i686-pc-windows-msvc.zip.sha256">checksum</a></td>
</tr>
</tbody>
</table>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/blob/main/CHANGELOG.md">ruff's changelog</a>.</em></p>
<blockquote>
<h2>0.15.11</h2>
<p>Released on 2026-04-16.</p>
<h3>Preview features</h3>
<ul>
<li>[<code>ruff</code>] Ignore <code>RUF029</code> when function is decorated with <code>asynccontextmanager</code> (<a href="">#24642</a>)</li>
<li>[<code>airflow</code>] Implement <code>airflow-xcom-pull-in-template-string</code> (<code>AIR201</code>) (<a href="">#23583</a>)</li>
<li>[<code>flake8-bandit</code>] Fix <code>S103</code> false positives and negatives in mask analysis (<a href="">#24424</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>[<code>flake8-async</code>] Omit overridden methods for <code>ASYNC109</code> (<a href="">#24648</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>[<code>flake8-async</code>] Add override mention to <code>ASYNC109</code> docs (<a href="">#24666</a>)</li>
<li>Update Neovim config examples to use <code>vim.lsp.config</code> (<a href="">#24577</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/augustelalande"><code>@​augustelalande</code></a></li>
<li><a href="https://github.com/anishgirianish"><code>@​anishgirianish</code></a></li>
<li><a href="https://github.com/benberryallwood"><code>@​benberryallwood</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/Dev-iL"><code>@​Dev-iL</code></a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>53554b1</code></a> Bump 0.15.11 (<a href="">#24678</a>)</li>
<li><a href=""><code>08c56c8</code></a> Factor out the <code>mdtest</code> crate (<a href="">#24616</a>)</li>
<li><a href=""><code>725fbb7</code></a> [ty] Use partially qualified names when reporting diagnostics regarding bad c...</li>
<li><a href=""><code>ddd6a30</code></a> [ty] Do not suggest argument completion when at value of keyword argument (<a href="">#2</a>...</li>
<li><a href=""><code>9282e61</code></a> Disallow <a href="https://github.com/disjoint"><code>@​disjoint</code></a>_base on TypedDicts and Protocols (<a href="">#24671</a>)</li>
<li><a href=""><code>e9986d8</code></a> [ty] Reject using properties with <code>Never</code> setters or deleters (<a href="">#24510</a>)</li>
<li><a href=""><code>9cf212f</code></a> [ty] Normalize property setter and deleter wrappers (<a href="">#24509</a>)</li>
<li><a href=""><code>12a1589</code></a> Add override mention to ASYNC109 docs (<a href="">#24666</a>)</li>
<li><a href=""><code>dccb03d</code></a> [ty] Avoid panicking on overloaded <code>Callable</code> type context (<a href="">#24661</a>)</li>
<li><a href=""><code>61f9a0a</code></a> [ty] Sync vendored typeshed stubs (<a href="">#24646</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ruff/compare/0.15.10...0.15.11">compare view</a></li>
</ul>
</details>
<br />

Updates `tombi` from 0.9.16 to 0.9.18
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tombi-toml/tombi/releases">tombi's releases</a>.</em></p>
<blockquote>
<h2>v0.9.18</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<p>In this release, we have changed the default settings for DocumentLink, enabling document links only for <code>crates.io</code> or <code>pypi.org</code>.</p>
<pre><code>[extensions]
&quot;tombi-toml/cargo&quot; = {
  lsp = {
    document-link = {
      cargo-toml.enabled = false,
      crates-io.enabled = true,
      git.enabled = false,
      path.enabled = false,
      workspace.enabled = false,
    },
  }
}
</code></pre>
<p>You can revert to the previous behavior by modifying the configuration file. However, if there is no demand from users, the DocumentLink functionality that has been disabled by default in this release may be removed in the future.</p>
<h3>🚀 New Features</h3>
<ul>
<li>feat: implement LSP features for pyproject and Tombi extensions by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1712</a></li>
<li>Refactor extension feature configuration formatting by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1714</a></li>
<li>break: change document-link sub-features to default-false by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1716</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>Ya7010/fix ci pr1700 by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1701</a></li>
<li>Add wildcard support for schemas root accessors by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1702</a></li>
<li>Abort did_open background tasks on LSP shutdown by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1703</a></li>
<li>Fix document link feature toggles by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1706</a></li>
<li>Rename ToggleFeature to ToggleFeatureDefaultTrue across the codebase by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1711</a></li>
<li>feat: add BoolDefaultFalse type and update extensions to use it by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1713</a></li>
<li>Restore extension_features! and toggle_features! macros by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1715</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v0.9.17...v0.9.18">https://github.com/tombi-toml/tombi/compare/v0.9.17...v0.9.18</a></p>
<h2>v0.9.17</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🚀 New Features</h3>
<ul>
<li>Support BBEdit hang on LSP shutdown by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1690</a></li>
<li>feat: Add autolib configuration to disable automatic discovery of lib targets by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1695</a></li>
<li>Remove obsolete rustdoc lint schema and update references in cargo.json to use HTTPS URLs by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1696</a></li>
</ul>
<h3>🐛 Bug Fixes</h3>
<ul>
<li>Fix oneOf hover branch selection by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1693</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>54f3919</code></a> Merge pull request <a href="">#1716</a> from tombi-toml/refactor/document-link-default-false</li>
<li><a href=""><code>be1ba0a</code></a> refactor: change document-link sub-features to default-false</li>
<li><a href=""><code>23ebc60</code></a> Merge pull request <a href="">#1715</a> from tombi-toml/refactor/restore-extension-feature-m...</li>
<li><a href=""><code>38d3bec</code></a> refactor: restore extension_features! and toggle_features! macros</li>
<li><a href=""><code>300219c</code></a> Merge pull request <a href="">#1714</a> from tombi-toml/refactor_config_features</li>
<li><a href=""><code>a01bb13</code></a> refactor: simplify extension feature config and restore hand-written accessors</li>
<li><a href=""><code>5cdd81d</code></a> refactor: replace lsp_features macro with extension_features for consistency ...</li>
<li><a href=""><code>4767dd0</code></a> refactor: update feature handling in code actions and inlay hints for better ...</li>
<li><a href=""><code>3bf753c</code></a> Refactor LSP and Tombi extension features to use macro-based feature definitions</li>
<li><a href=""><code>4d22e97</code></a> Merge branch 'main' of github.com:tombi-toml/tombi into refactor_config_features</li>
<li>Additional commits viewable in <a href="https://github.com/tombi-toml/tombi/compare/v0.9.16...v0.9.18">compare view</a></li>
</ul>
</details>
<br />

Updates `ty` from 0.0.29 to 0.0.31
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/releases">ty's releases</a>.</em></p>
<blockquote>
<h2>0.0.31</h2>
<h2>Release Notes</h2>
<p>Released on 2026-04-15.</p>
<h3>Bug fixes</h3>
<ul>
<li>Avoid panic from double inference for <code>namedtuple(typename=T, field_names=x, **{})</code> (<a href="">#24641</a>)</li>
<li>Avoid panic from double inference with missing functional <code>Enum(...)</code> names (<a href="">#24638</a>)</li>
<li>Avoid panic from double inference with functional <code>Enum(value=...)</code> (<a href="">#24639</a>)</li>
<li>Fix cases where <code>invalid-key</code> fix doesn't converge, and <code>override-of-final-method</code> produces invalid syntax (<a href="">#24649</a>)</li>
<li>Fix unnecessary <code>ty:ignore</code> comments inserted by <code>--add-ignore</code> for diagnostics starting on the same line (<a href="">#24651</a>)</li>
</ul>
<h3>CLI</h3>
<ul>
<li>Add <code>--fix</code> mode to enable auto-fix for diagnostics (<a href="">#24097</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Avoid excessive memory usage for dataclasses with many fields (<a href="">#24620</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Check inherited <code>NamedTuple</code> field conflicts (<a href="">#24542</a>)</li>
<li>Error when duplicate keywords are provided to TypedDict constructors (<a href="">#24449</a>)</li>
<li>Respect mixed positional and keyword arguments in TypedDict constructor (<a href="">#24448</a>)</li>
<li>Respect subclass shadowing for inherited NamedTuple fields (<a href="">#24640</a>)</li>
<li>Skip <code>EnumMeta.__call__</code> for enum constructor signatures (<a href="">#24513</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/sharkdp"><code>@​sharkdp</code></a></li>
<li><a href="https://github.com/Glyphack"><code>@​Glyphack</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charl...

_Description has been truncated_

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0f270ce53484`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.