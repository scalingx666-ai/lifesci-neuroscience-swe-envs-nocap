# Issue

**Title:** [dependabot]: Bump the deps group with 6 updates

## Description

Bumps the deps group with 6 updates:

| Package | From | To |
| --- | --- | --- |
| [filelock](https://github.com/tox-dev/py-filelock) | `3.20.3` | `3.24.0` |
| [pyvista](https://github.com/pyvista/pyvista) | `0.46.5` | `0.47.0` |
| [ruff](https://github.com/astral-sh/ruff) | `0.15.0` | `0.15.1` |
| [tombi](https://github.com/tombi-toml/tombi) | `0.7.27` | `0.7.28` |
| [ty](https://github.com/astral-sh/ty) | `0.0.15` | `0.0.17` |
| [mkdocstrings-python](https://github.com/mkdocstrings/python) | `2.0.1` | `2.0.2` |

Updates `filelock` from 3.20.3 to 3.24.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/py-filelock/releases">filelock's releases</a>.</em></p>
<blockquote>
<h2>3.24.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>🐛 fix(unix): auto-fallback to SoftFileLock on ENOSYS by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#480</a></li>
<li>✨ feat(lock): add poll_interval to constructor by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#482</a></li>
<li>🐛 fix(win): eliminate lock file race in threaded usage by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#484</a></li>
<li>✨ feat(mode): respect POSIX default ACL inheritance by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#483</a></li>
<li>🐛 fix(api): detect same-thread self-deadlock by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#481</a></li>
<li>✨ feat(lock): add cancel_check to acquire by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#487</a></li>
<li>✨ feat(lock): add lifetime parameter for lock expiration by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#486</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.23.0...3.24.0">https://github.com/tox-dev/filelock/compare/3.23.0...3.24.0</a></p>
<h2>3.23.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>📝 docs: add fasteners to similar libraries by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#478</a></li>
<li>📝 docs: move from Unlicense to MIT by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#479</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.22.0...3.23.0">https://github.com/tox-dev/filelock/compare/3.22.0...3.23.0</a></p>
<h2>3.22.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>✨ feat(soft): detect and break stale locks by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#476</a></li>
<li>🐛 fix(soft): skip stale lock detection on Windows by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#477</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.21.2...3.22.0">https://github.com/tox-dev/filelock/compare/3.21.2...3.22.0</a></p>
<h2>3.21.2</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>🐛 fix: catch ImportError for missing sqlite3 C library by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#475</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.21.1...3.21.2">https://github.com/tox-dev/filelock/compare/3.21.1...3.21.2</a></p>
<h2>3.21.1</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>🐛 fix: gracefully handle missing <code>sqlite3</code> when importing <code>ReadWriteLock</code> by <a href="https://github.com/bayandin"><code>@​bayandin</code></a> in <a href="">tox-dev/filelock#473</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/filelock/blob/main/docs/changelog.rst">filelock's changelog</a>.</em></p>
<blockquote>
<h2>3.24.0 (2026-02-14)</h2>
<ul>
<li>✨ feat(lock): add lifetime parameter for lock expiration (<a href="">#68</a>) :pr:<code>486</code></li>
<li>✨ feat(lock): add cancel_check to acquire (<a href="">#309</a>) :pr:<code>487</code></li>
<li>🐛 fix(api): detect same-thread self-deadlock :pr:<code>481</code></li>
<li>✨ feat(mode): respect POSIX default ACLs (<a href="">#378</a>) :pr:<code>483</code></li>
<li>🐛 fix(win): eliminate lock file race in threaded usage :pr:<code>484</code></li>
<li>✨ feat(lock): add poll_interval to constructor :pr:<code>482</code></li>
<li>🐛 fix(unix): auto-fallback to SoftFileLock on ENOSYS :pr:<code>480</code></li>
</ul>
<h2>3.23.0 (2026-02-14)</h2>
<ul>
<li>📝 docs: move from Unlicense to MIT :pr:<code>479</code></li>
<li>📝 docs: add fasteners to similar libraries :pr:<code>478</code></li>
</ul>
<h2>3.22.0 (2026-02-14)</h2>
<ul>
<li>🐛 fix(soft): skip stale detection on Windows :pr:<code>477</code></li>
<li>✨ feat(soft): detect and break stale locks :pr:<code>476</code></li>
</ul>
<h2>3.21.2 (2026-02-13)</h2>
<ul>
<li>🐛 fix: catch ImportError for missing sqlite3 C library :pr:<code>475</code></li>
</ul>
<h2>3.21.1 (2026-02-12)</h2>
<ul>
<li>🐛 fix: gracefully handle missing <code>sqlite3</code> when importing <code>ReadWriteLock</code> :pr:<code>473</code> - by :user:<code>bayandin</code></li>
<li>🐛 fix(ci): make release workflow robust</li>
</ul>
<h2>3.21.0 (2026-02-12)</h2>
<ul>
<li>🐛 fix(ci): make release workflow robust</li>
<li>👷 ci(release): commit changelog and use release config :pr:<code>472</code></li>
<li>👷 ci(release): consolidate to two jobs :pr:<code>471</code></li>
<li>✨ feat(unix): delete lock file on release :pr:<code>408</code> - by :user:<code>sbc100</code></li>
<li>✨ feat(lock): add SQLite-based ReadWriteLock :pr:<code>399</code> - by :user:<code>leventov</code></li>
<li>🔧 chore: modernize tooling and bump deps :pr:<code>470</code></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>2de9380</code></a> Release 3.24.0</li>
<li><a href=""><code>d429e18</code></a> ✨ feat(lock): add lifetime parameter for lock expiration (<a href="">#68</a>) (<a href="">#486</a>)</li>
<li><a href=""><code>6c75bf7</code></a> ✨ feat(lock): add cancel_check to acquire (<a href="">#309</a>) (<a href="">#487</a>)</li>
<li><a href=""><code>fa6a27b</code></a> 🐛 fix(api): detect same-thread self-deadlock (<a href="">#481</a>)</li>
<li><a href=""><code>57251e9</code></a> ✨ feat(mode): respect POSIX default ACLs (<a href="">#378</a>) (<a href="">#483</a>)</li>
<li><a href=""><code>23b797c</code></a> 🐛 fix(win): eliminate lock file race in threaded usage (<a href="">#484</a>)</li>
<li><a href=""><code>79ca84f</code></a> ✨ feat(lock): add poll_interval to constructor (<a href="">#482</a>)</li>
<li><a href=""><code>7dfdb02</code></a> 🐛 fix(unix): auto-fallback to SoftFileLock on ENOSYS (<a href="">#480</a>)</li>
<li><a href=""><code>f2c4095</code></a> Release 3.23.0</li>
<li><a href=""><code>4aac786</code></a> 📝 docs: move from Unlicense to MIT (<a href="">#479</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/tox-dev/py-filelock/compare/3.20.3...3.24.0">compare view</a></li>
</ul>
</details>
<br />

Updates `pyvista` from 0.46.5 to 0.47.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pyvista/pyvista/releases">pyvista's releases</a>.</em></p>
<blockquote>
<h2>v0.47.0</h2>
<h2>What's Changed</h2>
<h3>Breaking Changes</h3>
<ul>
<li>Improve number_time_points property in EnsightReader by <a href="https://github.com/riku-sakamoto"><code>@​riku-sakamoto</code></a> in <a href="">pyvista/pyvista#7804</a></li>
<li>Do not always get last image depth by <a href="https://github.com/akaszynski"><code>@​akaszynski</code></a> in <a href="">pyvista/pyvista#7953</a></li>
<li>Make <code>CameraPosition.__repr__</code> explicit by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#7794</a></li>
<li>Use 2D labels by default with CubeAxesActor for VTK 9.6 by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8248</a></li>
</ul>
<h3>New Features</h3>
<ul>
<li>Add <code>Texture.color_mode</code> and use <code>'direct'</code> mode by default by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#7757</a></li>
<li>Add <code>pass_point(cell)_ids</code> to <code>extract_points(cells)</code> by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#7765</a></li>
<li>Add remove_existing_actor parameter to add_mesh by <a href="https://github.com/tkoyama010"><code>@​tkoyama010</code></a> in <a href="">pyvista/pyvista#7809</a></li>
<li>Add <code>point</code> keyword to <code>Transform.compose</code> by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#7869</a></li>
<li>Add optional downloads info to <code>Report</code> by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#7927</a></li>
<li>Add <code>border_mode</code> to <code>resample</code> filter by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#7964</a></li>
<li>Add <code>bspline</code> interpolator to <code>resample</code> filter by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#7965</a></li>
<li>Add command line interface with <code>--version</code> and <code>report</code> options by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#7463</a></li>
<li>Allow adding mesh to plotter from file by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#7976</a></li>
<li>Add <code>plot</code> command to pyvista CLI by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#7970</a></li>
<li>Use <code>cyclopts</code> as CLI library by <a href="https://github.com/edabor"><code>@​edabor</code></a> in <a href="">pyvista/pyvista#7991</a></li>
<li>Improve morphological filters for ImageData by <a href="https://github.com/tkoyama010"><code>@​tkoyama010</code></a> in <a href="">pyvista/pyvista#7833</a></li>
<li>Use binary filter dynamically with morphological operators by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#7996</a></li>
<li>Add <code>convert</code> CLI command for converting mesh file format by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8005</a></li>
<li>Disallow no files for <code>pyvista plot</code> CLI by <a href="https://github.com/edabor"><code>@​edabor</code></a> in <a href="">pyvista/pyvista#8011</a></li>
<li>Add <code>allow_new_attributes</code> state manager class by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#7864</a></li>
<li>Add image <code>concatenate</code> filter by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8013</a></li>
<li>Add <code>connectivity</code> region assignment mode by <a href="https://github.com/edabor"><code>@​edabor</code></a> in <a href="">pyvista/pyvista#8029</a></li>
<li>Add <code>background_value</code> keyword to <code>concatenate</code> filter by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8031</a></li>
<li>Add <code>Transform</code> component properties by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8051</a></li>
<li>Add multi-level option to <code>Box</code> by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8068</a></li>
<li>Add png, jpg, tiff, nifti, bmp, pnm image writers by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8084</a></li>
<li>Add writer classes by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8094</a></li>
<li>Add <code>DataObject.cast_to_multiblock</code> by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8106</a></li>
<li>Generalize <code>dimensionality</code> property for all datasets by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8121</a></li>
<li>Add more arguments to spline by <a href="https://github.com/tletut0ur"><code>@​tletut0ur</code></a> in <a href="">pyvista/pyvista#8072</a></li>
<li>Enable <code>VtkErrorCatcher</code> to catch VTK warnings by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#7863</a></li>
<li>Add warping spheres example and enable plotting <code>PartitionedDataSet</code> by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8111</a></li>
<li>Allow using <code>Plane</code> with plane-based filters by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8151</a></li>
<li>Add <code>UnstructuredGrid.distinct_cell_types</code> by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8160</a></li>
<li>Enable setting dataset <code>center</code> by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8174</a></li>
<li>Add <code>length</code> option to <code>resize</code> filter by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8175</a></li>
<li>Add <code>pv.to_trimesh</code> and <code>pv.from_trimesh</code> functions by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8176</a></li>
<li>Add <code>select_interior_points</code> filter to replace <code>select_enclosed_points</code> by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8181</a></li>
<li>Support mesh validation for <code>MultiBlock</code> by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8189</a></li>
<li>Add min/max cell dimensionality by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8186</a></li>
<li>Add generic typing for mesh validation reports by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8203</a></li>
<li>Add validate keyword to mesh constructors by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8222</a></li>
<li>Add <code>font_size</code>, <code>point_size</code>, <code>line_width</code> and <code>normals_scale</code> keywords to <code>plot_cell</code> by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8236</a></li>
<li>Generalize <code>distinct_cell_types</code> for all datasets by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8224</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>f6613b1</code></a> Merge branch 'main' into release/0.47</li>
<li><a href=""><code>a738a6a</code></a> Make upload step conditional on tag only (<a href="">#8302</a>)</li>
<li><a href=""><code>96bed1e</code></a> Avoid casting to ugrid for distinct cell types (<a href="">#8298</a>)</li>
<li><a href=""><code>b41d5c2</code></a> bump to v0.47.0 (<a href="">#8300</a>)</li>
<li><a href=""><code>259ebb3</code></a> revert all deprecation modifications</li>
<li><a href=""><code>b77c749</code></a> fix theme testing</li>
<li><a href=""><code>f4d2d4c</code></a> allow setting axes box in themes</li>
<li><a href=""><code>d05b37e</code></a> skip gc check; remove unused image</li>
<li><a href=""><code>27ba548</code></a> make error instead</li>
<li><a href=""><code>eb7d55f</code></a> remove add_axes(box=...) functionality and add_pick observer</li>
<li>Additional commits viewable in <a href="https://github.com/pyvista/pyvista/compare/v0.46.5...v0.47.0">compare view</a></li>
</ul>
</details>
<br />

Updates `ruff` from 0.15.0 to 0.15.1
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
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ruff/compare/0.15.0...0.15.1">compare view</a></li>
</ul>
</details>
<br />

Updates `tombi` from 0.7.27 to 0.7.28
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tombi-toml/tombi/releases">tombi's releases</a>.</em></p>
<blockquote>
<h2>v0.7.28</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>👒 Dependencies</h3>
<ul>
<li>chore(deps): bump time from 0.3.41 to 0.3.47 in the cargo group across 1 directory by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">tombi-toml/tombi#1487</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>feat: enhance get_status handler to include schema information by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1489</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v0.7.27...v0.7.28">https://github.com/tombi-toml/tombi/compare/v0.7.27...v0.7.28</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>749df5d</code></a> Merge pull request <a href="">#1489</a> from tombi-toml/add_get_status_schema</li>
<li><a href=""><code>e205448</code></a> feat: enhance get_status handler to include schema information</li>
<li><a href=""><code>2807441</code></a> Merge pull request <a href="">#1487</a> from tombi-toml/dependabot/cargo/cargo-19d6922b9f</li>
<li><a href=""><code>cbaa377</code></a> chore(deps): bump time in the cargo group across 1 directory</li>
<li>See full diff in <a href="https://github.com/tombi-toml/tombi/compare/v0.7.27...v0.7.28">compare view</a></li>
</ul>
</details>
<br />

Updates `ty` from 0.0.15 to 0.0.17
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/releases">ty's releases</a>.</em></p>
<blockquote>
<h2>0.0.17</h2>
<h2>Release Notes</h2>
<p>Released on 2026-02-13.</p>
<h3>Bug fixes</h3>
<ul>
<li>Avoid <code>Literal</code> promotion for constrained <code>TypeVar</code>s with <code>Literal</code> bounds (<a href="">#23209</a>)</li>
<li>Fix false positives in <code>TypeVar</code> shadowing checks (<a href="">#23222</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Support generic protocols (<a href="">#21902</a>)</li>
<li>Perform control-flow analysis in loops (<a href="">#22794</a>)</li>
<li>Support <code>typing.Self</code> in attribute annotations (<a href="">#23108</a>)</li>
<li>Support type narrowing in situations with calls to <code>NoReturn</code> functions (<a href="">#23109</a>)</li>
<li>Support type narrowing and reachability analysis based on <code>os.name</code> checks (<a href="">#23230</a>)</li>
<li>Detect overrides of <code>Final</code> class variables in subclasses (<a href="">#23180</a>)</li>
<li>Fix bound method access on <code>None</code> (<a href="">#23246</a>)</li>
<li>Fix method calls on subclasses of <code>Any</code> (<a href="">#23248</a>)</li>
<li>Disallow type variables within PEP-695 type variable bounds and constraints (<a href="">#22982</a>)</li>
<li>Emit error for attribute access on union where some elements lack the attribute (<a href="">#23042</a>)</li>
<li>Emit error for invalid typevar defaults (<a href="">#23194</a>)</li>
<li>Improve display of <code>ParamSpec</code>s in some situations (<a href="">#23211</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Add hover and go-to-declaration support for subscript literals (<a href="">#22837</a>)</li>
<li>Assign lower completion ranking to deprecated names in auto import (<a href="">#23188</a>)</li>
<li>Improve spans of references to submodules imported in an <code>__init__.py</code> (<a href="">#21795</a>)</li>
<li>Include conditional symbols (like <code>datetime.UTC</code>) in auto-import in more cases (<a href="">#23249</a>)</li>
<li>Support auto-import for symbols in inlay hints (<a href="">#22111</a>)</li>
<li>Include overload declarations in find-references (<a href="">#23215</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Avoid <code>UnionBuilder</code> overhead when creating a new union from the filtered elements of an existing union (<a href="">#22352</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Allow discovering dependencies in system Python environments (<a href="">#22994</a>)</li>
<li>Apply workspace settings to virtual files (<a href="">#23228</a>)</li>
<li>Add support for <code>--output-format=junit</code> (<a href="">#22125</a>)</li>
<li>Use a smaller diagnostic range for <code>inconsistent-mro</code> diagnostics (<a href="">#23213</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/carljm"><code>@​carljm</code></a></li>
<li><a href="https://github.com/BurntSushi"><code>@​BurntSushi</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/blob/main/CHANGELOG.md">ty's changelog</a>.</em></p>
<blockquote>
<h2>0.0.17</h2>
<p>Released on 2026-02-13.</p>
<h3>Bug fixes</h3>
<ul>
<li>Avoid <code>Literal</code> promotion for constrained <code>TypeVar</code>s with <code>Literal</code> bounds (<a href="">#23209</a>)</li>
<li>Fix false positives in <code>TypeVar</code> shadowing checks (<a href="">#23222</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Support generic protocols (<a href="">#21902</a>)</li>
<li>Perform control-flow analysis in loops (<a href="">#22794</a>)</li>
<li>Support <code>typing.Self</code> in attribute annotations (<a href="">#23108</a>)</li>
<li>Support type narrowing in situations with calls to <code>NoReturn</code> functions (<a href="">#23109</a>)</li>
<li>Support type narrowing and reachability analysis based on <code>os.name</code> checks (<a href="">#23230</a>)</li>
<li>Detect overrides of <code>Final</code> class variables in subclasses (<a href="">#23180</a>)</li>
<li>Fix bound method access on <code>None</code> (<a href="">#23246</a>)</li>
<li>Fix method calls on subclasses of <code>Any</code> (<a href="">#23248</a>)</li>
<li>Disallow type variables within PEP-695 type variable bounds and constraints (<a href="">#22982</a>)</li>
<li>Emit error for attribute access on union where some elements lack the attribute (<a href="">#23042</a>)</li>
<li>Emit error for invalid typevar defaults (<a href="">#23194</a>)</li>
<li>Improve display of <code>ParamSpec</code>s in some situations (<a href="">#23211</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Add hover and go-to-declaration support for subscript literals (<a href="">#22837</a>)</li>
<li>Assign lower completion ranking to deprecated names in auto import (<a href="">#23188</a>)</li>
<li>Improve spans of references to submodules imported in an <code>__init__.py</code> (<a href="">#21795</a>)</li>
<li>Include conditional symbols (like <code>datetime.UTC</code>) in auto-import in more cases (<a href="">#23249</a>)</li>
<li>Support auto-import for symbols in inlay hints (<a href="">#22111</a>)</li>
<li>Include overload declarations in find-references (<a href="">#23215</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Avoid <code>UnionBuilder</code> overhead when creating a new union from the filtered elements of an existing union (<a href="">#22352</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Allow discovering dependencies in system Python environments (<a href="">#22994</a>)</li>
<li>Apply workspace settings to virtual files (<a href="">#23228</a>)</li>
<li>Add support for <code>--output-format=junit</code> (<a href="">#22125</a>)</li>
<li>Use a smaller diagnostic range for <code>inconsistent-mro</code> diagnostics (<a href="">#23213</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/carljm"><code>@​carljm</code></a></li>
<li><a href="https://github.com/BurntSushi"><code>@​BurntSushi</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/Glyphack"><code>@​Glyphack</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>8cec857</code></a> [ty] Bump version to 0.0.17 (<a href="">#2806</a>)</li>
<li><a href=""><code>3650f58</code></a> docs: Clarify that nvim-lspconfig is the recommended way of using ty in all v...</li>
<li><a href=""><code>55b8ff2</code></a> Add note about fallback behavior to <code>python</code> in <code>PATH</code> (<a href="">#2787</a>)</li>
<li><a href=""><code>e96ea4c</code></a> Bump version to 0.0.16 (<a href="">#2779</a>)</li>
<li><a href=""><code>b393d32</code></a> Update docker/login-action action to v3.7.0 (<a href="">#2754</a>)</li>
<li><a href=""><code>532b111</code></a> Update actions/cache action to v5.0.3 (<a href="">#2751</a>)</li>
<li><a href=""><code>61b0376</code></a> Update astral-sh/setup-uv action to v7.3.0 (<a href="">#2753</a>)</li>
<li><a href=""><code>216f8dc</code></a> Update prek dependencies (<a href="">#2752</a>)</li>
<li><a href=""><code>044af7f</code></a> FAQ: Why doesn't ty warn about missing type annotations? (<a href="">#2721</a>)</li>
<li>See full diff in <a href="https://github.com/astral-sh/ty/compare/0.0.15...0.0.17">compare view</a></li>
</ul>
</details>
<br />

Updates `mkdocstrings-python` from 2.0.1 to 2.0.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/mkdocstrings/python/releases">mkdocstrings-python's releases</a>.</em></p>
<blockquote>
<h2>2.0.2</h2>
<h2><a href="https://github.com/mkdocstrings/python/releases/tag/2.0.2">2.0.2</a> - 2026-02-09</h2>
<p><!-- raw HTML omitted --><a href="https://github.com/mkdocstrings/python/compare/2.0.1...2.0.2">Compare with 2.0.1</a><!-- raw HTML omitted --></p>
<h3>Bug Fixes</h3>
<ul>
<li>Fix aliases for parameters (<a href="">0ae77a3</a> by Timothée Mazzucotelli). <a href="">Issue-mkdocstrings-813</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/mkdocstrings/python/blob/main/CHANGELOG.md">mkdocstrings-python's changelog</a>.</em></p>
<blockquote>
<h2><a href="https://github.com/mkdocstrings/python/releases/tag/2.0.2">2.0.2</a> - 2026-02-09</h2>
<p><!-- raw HTML omitted --><a href="https://github.com/mkdocstrings/python/compare/2.0.1...2.0.2">Compare with 2.0.1</a><!-- raw HTML omitted --></p>
<h3>Bug Fixes</h3>
<ul>
<li>Fix aliases for parameters (<a href="">0ae77a3</a> by Timothée Mazzucotelli). <a href="">Issue-mkdocstrings-813</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>4e546b5</code></a> chore: Prepare release 2.0.2</li>
<li><a href=""><code>1781871</code></a> Merge branch 'main' of github.com:mkdocstrings/python</li>
<li><a href=""><code>0ae77a3</code></a> fix: Fix aliases for parameters</li>
<li><a href=""><code>5bab7f5</code></a> chore: Update sponsors section in README (<a href="">#325</a>)</li>
<li>See full diff in <a href="https://github.com/mkdocstrings/python/compare/2.0.1...2.0.2">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `66fc73ffc79d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.