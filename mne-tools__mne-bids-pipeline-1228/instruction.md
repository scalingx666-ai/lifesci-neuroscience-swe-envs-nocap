# Issue

**Title:** [dependabot]: Bump the deps group with 5 updates

## Description

Bumps the deps group with 5 updates:

| Package | From | To |
| --- | --- | --- |
| [packaging](https://github.com/pypa/packaging) | `26.1` | `26.2` |
| [python-picard](https://github.com/mind-inria/picard) | `0.8.1` | `0.8.2` |
| [ruff](https://github.com/astral-sh/ruff) | `0.15.11` | `0.15.12` |
| [tombi](https://github.com/tombi-toml/tombi) | `0.9.22` | `0.10.1` |
| [ty](https://github.com/astral-sh/ty) | `0.0.32` | `0.0.33` |

Updates `packaging` from 26.1 to 26.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pypa/packaging/releases">packaging's releases</a>.</em></p>
<blockquote>
<h2>26.2</h2>
<h2>What's Changed</h2>
<p>Fixes:</p>
<ul>
<li>Fix incorrect sysconfig var name for pyemscripten by <a href="https://github.com/ryanking13"><code>@​ryanking13</code></a> in <a href="">pypa/packaging#1160</a></li>
<li>Make <code>Version</code>, <code>Specifier</code>, <code>SpecifierSet</code>, <code>Tag</code>, <code>Marker</code>, and <code>Requirement</code> pickle-safe
and backward-compatible with pickles created in 25.0-26.1 (including references to the removed
<code>packaging._structures</code> module) by <a href="https://github.com/eachimei"><code>@​eachimei</code></a> and <a href="https://github.com/henryiii"><code>@​henryiii</code></a> in <a href="">pypa/packaging#1163</a>, <a href="">pypa/packaging#1168</a>, <a href="">pypa/packaging#1170</a>, and <a href="">pypa/packaging#1171</a></li>
<li>fix: re-export ExceptionGroup for now by <a href="https://github.com/henryiii"><code>@​henryiii</code></a> in <a href="">pypa/packaging#1164</a></li>
</ul>
<p>Documentation:</p>
<ul>
<li>docs: add errors section and fix missing details by <a href="https://github.com/henryiii"><code>@​henryiii</code></a> in <a href="">pypa/packaging#1159</a></li>
<li>docs(dev): document property-based test suite by <a href="https://github.com/r266-tech"><code>@​r266-tech</code></a> in <a href="">pypa/packaging#1167</a></li>
<li>Fix typo in DirectUrl documentation by <a href="https://github.com/sbidoul"><code>@​sbidoul</code></a> in <a href="">pypa/packaging#1169</a></li>
<li>docs(specifiers): add is_unsatisfiable() usage example by <a href="https://github.com/r266-tech"><code>@​r266-tech</code></a> in <a href="">pypa/packaging#1166</a></li>
</ul>
<p>Internal:</p>
<ul>
<li>Enable the auditor persona on zizmor by <a href="https://github.com/henryiii"><code>@​henryiii</code></a> in <a href="">pypa/packaging#1158</a></li>
<li>Test new pickle guarantees by <a href="https://github.com/henryiii"><code>@​henryiii</code></a> in <a href="">pypa/packaging#1174</a></li>
<li>Use native uv integration in rtd by <a href="https://github.com/henryiii"><code>@​henryiii</code></a> in <a href="">pypa/packaging#1175</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/ryanking13"><code>@​ryanking13</code></a> made their first contribution in <a href="">pypa/packaging#1160</a></li>
<li><a href="https://github.com/eachimei"><code>@​eachimei</code></a> made their first contribution in <a href="">pypa/packaging#1163</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/pypa/packaging/compare/26.1...26.2">https://github.com/pypa/packaging/compare/26.1...26.2</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pypa/packaging/blob/main/CHANGELOG.rst">packaging's changelog</a>.</em></p>
<blockquote>
<p>26.2 - 2026-04-24</p>
<pre><code>
Fixes:
<ul>
<li>Fix incorrect sysconfig var name for pyemscripten in (:pull:<code>1160</code>)</li>
<li>Make <code>Version</code>, <code>Specifier</code>, <code>SpecifierSet</code>, <code>Tag</code>, <code>Marker</code>, and <code>Requirement</code> pickle-safe<br />
and backward-compatible with pickles created in 25.0-26.1 (including references to the removed<br />
<code>packaging._structures</code> module) (:pull:<code>1163</code>, :pull:<code>1168</code>, :pull:<code>1170</code>, :pull:<code>1171</code>)</li>
<li>Re-export <code>ExceptionGroup</code> in metadata for now in (:pull:<code>1164</code>)</li>
</ul>
<p>Documentation:</p>
<ul>
<li>Add errors section and fix missing details in (:pull:<code>1159</code>)</li>
<li>Document our property-based test suite in (:pull:<code>1167</code>)</li>
<li>Fix a <code>DirectUrl</code> typo in (:pull:<code>1167</code>)</li>
<li>Add example of <code>is_unsatisfiable</code> in (:pull:<code>1166</code>)</li>
</ul>
<p>Internal:</p>
<ul>
<li>Enable the auditor persona on zizmor in (:pull:<code>1158</code>)</li>
<li>Test new pickle guarantees in (:pull:<code>1174</code>)</li>
<li>Use new native ReadTheDocs uv integration in (:pull:<code>1175</code>)<br />
</code></pre></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>84a87ee</code></a> Bump for release</li>
<li><a href=""><code>4a616b6</code></a> docs: a few more updates to prepare for 26.2 (<a href="">#1176</a>)</li>
<li><a href=""><code>9de6f44</code></a> ci: use native uv integration in rtd (<a href="">#1175</a>)</li>
<li><a href=""><code>bc76e14</code></a> chore: update changelog for 26.2 (<a href="">#1161</a>)</li>
<li><a href=""><code>3f00091</code></a> tests: add a pickle check (<a href="">#1174</a>)</li>
<li><a href=""><code>48a8a06</code></a> fix: make Requirements/Markers pickle-safe (<a href="">#1171</a>)</li>
<li><a href=""><code>823b44e</code></a> fix: make Tags pickle-safe (<a href="">#1170</a>)</li>
<li><a href=""><code>4bed32d</code></a> fix: make Specifier / SpecifierSet pickle-safe (<a href="">#1168</a>)</li>
<li><a href=""><code>963118e</code></a> fix: re-export ExceptionGroup for now (<a href="">#1164</a>)</li>
<li><a href=""><code>66e34a8</code></a> docs(specifiers): add is_unsatisfiable() usage example (<a href="">#1166</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pypa/packaging/compare/26.1...26.2">compare view</a></li>
</ul>
</details>
<br />

Updates `python-picard` from 0.8.1 to 0.8.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/mind-inria/picard/releases">python-picard's releases</a>.</em></p>
<blockquote>
<h2>v0.8.2</h2>
<p>Numpy 2.x fix for line_search</p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>d530ea3</code></a> CI: use write-access deploy key for gh-pages push</li>
<li><a href=""><code>44608a3</code></a> MAINT: Prep for 0.8.2, fix CircleCI deploy key for gh-pages</li>
<li><a href=""><code>729f21a</code></a> MAINT: Prep for 0.8.2</li>
<li><a href=""><code>832b4a9</code></a> Fix FloatingPointError with NumPy 2.x due to overflow in line search (<a href="">#74</a>)</li>
<li><a href=""><code>bea80f2</code></a> make sure picard does not alter sklearn FastICA._parameter_constraints (<a href="">#70</a>)</li>
<li>See full diff in <a href="https://github.com/mind-inria/picard/compare/v0.8.1...v0.8.2">compare view</a></li>
</ul>
</details>
<br />

Updates `ruff` from 0.15.11 to 0.15.12
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.15.12</h2>
<h2>Release Notes</h2>
<p>Released on 2026-04-24.</p>
<h3>Preview features</h3>
<ul>
<li>Implement <code>#ruff:file-ignore</code> file-level suppressions (<a href="">#23599</a>)</li>
<li>Implement <code>#ruff:ignore</code> logical-line suppressions (<a href="">#23404</a>)</li>
<li>Revert preview changes to displayed diagnostic severity in LSP (<a href="">#24789</a>)</li>
<li>[<code>airflow</code>] Implement <code>task-branch-as-short-circuit</code> (<code>AIR004</code>) (<a href="">#23579</a>)</li>
<li>[<code>flake8-bugbear</code>] Fix <code>break</code>/<code>continue</code> handling in <code>loop-iterator-mutation</code> (<code>B909</code>) (<a href="">#24440</a>)</li>
<li>[<code>pylint</code>] Fix <code>PLC2701</code> for type parameter scopes (<a href="">#24576</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>pandas-vet</code>] Suggest <code>.array</code> as well in <code>PD011</code> (<a href="">#24805</a>)</li>
</ul>
<h3>CLI</h3>
<ul>
<li>Respect default Unix permissions for cache files (<a href="">#24794</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>[<code>pylint</code>] Fix <code>PLR0124</code> description not to claim self-comparison always returns the same value (<a href="">#24749</a>)</li>
<li>[<code>pyupgrade</code>] Expand docs on reusable <code>TypeVar</code>s and scoping (<code>UP046</code>) (<a href="">#24153</a>)</li>
<li>Improve rules table accessibility (<a href="">#24711</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/dylwil3"><code>@​dylwil3</code></a></li>
<li><a href="https://github.com/AlexWaygood"><code>@​AlexWaygood</code></a></li>
<li><a href="https://github.com/woodruffw"><code>@​woodruffw</code></a></li>
<li><a href="https://github.com/avasis-ai"><code>@​avasis-ai</code></a></li>
<li><a href="https://github.com/Dev-iL"><code>@​Dev-iL</code></a></li>
<li><a href="https://github.com/denyszhak"><code>@​denyszhak</code></a></li>
<li><a href="https://github.com/ShipItAndPray"><code>@​ShipItAndPray</code></a></li>
<li><a href="https://github.com/anishgirianish"><code>@​anishgirianish</code></a></li>
<li><a href="https://github.com/augustelalande"><code>@​augustelalande</code></a></li>
<li><a href="https://github.com/amyreese"><code>@​amyreese</code></a></li>
<li><a href="https://github.com/majiayu000"><code>@​majiayu000</code></a></li>
</ul>
<h2>Install ruff 0.15.12</h2>
<h3>Install prebuilt binaries via shell script</h3>
<pre lang="sh"><code>curl --proto '=https' --tlsv1.2 -LsSf https://releases.astral.sh/github/ruff/releases/download/0.15.12/ruff-installer.sh | sh
</code></pre>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/blob/main/CHANGELOG.md">ruff's changelog</a>.</em></p>
<blockquote>
<h2>0.15.12</h2>
<p>Released on 2026-04-24.</p>
<h3>Preview features</h3>
<ul>
<li>Implement <code>#ruff:file-ignore</code> file-level suppressions (<a href="">#23599</a>)</li>
<li>Implement <code>#ruff:ignore</code> logical-line suppressions (<a href="">#23404</a>)</li>
<li>Revert preview changes to displayed diagnostic severity in LSP (<a href="">#24789</a>)</li>
<li>[<code>airflow</code>] Implement <code>task-branch-as-short-circuit</code> (<code>AIR004</code>) (<a href="">#23579</a>)</li>
<li>[<code>flake8-bugbear</code>] Fix <code>break</code>/<code>continue</code> handling in <code>loop-iterator-mutation</code> (<code>B909</code>) (<a href="">#24440</a>)</li>
<li>[<code>pylint</code>] Fix <code>PLC2701</code> for type parameter scopes (<a href="">#24576</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>pandas-vet</code>] Suggest <code>.array</code> as well in <code>PD011</code> (<a href="">#24805</a>)</li>
</ul>
<h3>CLI</h3>
<ul>
<li>Respect default Unix permissions for cache files (<a href="">#24794</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>[<code>pylint</code>] Fix <code>PLR0124</code> description not to claim self-comparison always returns the same value (<a href="">#24749</a>)</li>
<li>[<code>pyupgrade</code>] Expand docs on reusable <code>TypeVar</code>s and scoping (<code>UP046</code>) (<a href="">#24153</a>)</li>
<li>Improve rules table accessibility (<a href="">#24711</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/dylwil3"><code>@​dylwil3</code></a></li>
<li><a href="https://github.com/AlexWaygood"><code>@​AlexWaygood</code></a></li>
<li><a href="https://github.com/woodruffw"><code>@​woodruffw</code></a></li>
<li><a href="https://github.com/avasis-ai"><code>@​avasis-ai</code></a></li>
<li><a href="https://github.com/Dev-iL"><code>@​Dev-iL</code></a></li>
<li><a href="https://github.com/denyszhak"><code>@​denyszhak</code></a></li>
<li><a href="https://github.com/ShipItAndPray"><code>@​ShipItAndPray</code></a></li>
<li><a href="https://github.com/anishgirianish"><code>@​anishgirianish</code></a></li>
<li><a href="https://github.com/augustelalande"><code>@​augustelalande</code></a></li>
<li><a href="https://github.com/amyreese"><code>@​amyreese</code></a></li>
<li><a href="https://github.com/majiayu000"><code>@​majiayu000</code></a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>66f93cf</code></a> Bump 0.15.12 (<a href="">#24815</a>)</li>
<li><a href=""><code>476a4d0</code></a> [ty] Complete support for more detailed diagnostics on possibly unbound error...</li>
<li><a href=""><code>ed669ea</code></a> Implement <code>#ruff:file-ignore</code> file-level suppressions (<a href="">#23599</a>)</li>
<li><a href=""><code>e73d952</code></a> [ty] Include inferred type in <code>invalid-key</code> concise diagnostic for union/inte...</li>
<li><a href=""><code>80feb29</code></a> [ty] report only dead annotation-only locals as unused (<a href="">#24811</a>)</li>
<li><a href=""><code>0fbf2bc</code></a> Drop deprecated license classifier (<a href="">#24808</a>)</li>
<li><a href=""><code>43b174c</code></a> [ty] Infer lambda parameter types with <code>Callable</code> type context (<a href="">#24317</a>)</li>
<li><a href=""><code>4f449ae</code></a> [ty] Add error context for intersection types (<a href="">#24772</a>)</li>
<li><a href=""><code>5b4e753</code></a> [ty] Add support for goto in literal enum member inlay hint (<a href="">#24792</a>)</li>
<li><a href=""><code>e7cc762</code></a> [ty] Add error context for TypedDict assignments (<a href="">#24790</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ruff/compare/0.15.11...0.15.12">compare view</a></li>
</ul>
</details>
<br />

Updates `tombi` from 0.9.22 to 0.10.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tombi-toml/tombi/releases">tombi's releases</a>.</em></p>
<blockquote>
<h2>v0.10.1</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🚀 New Features</h3>
<ul>
<li>Fix tombi config path resolution and completions by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1807</a></li>
</ul>
<h3>🐛 Bug Fixes</h3>
<ul>
<li>fix: keep root hover range on the current key-value by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1812</a></li>
<li>fix(config): reject empty schema glob patterns by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1814</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>Add schema exclude support by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1813</a></li>
<li>docs: refine formatter intro wording by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1815</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v0.10.0...v0.10.1">https://github.com/tombi-toml/tombi/compare/v0.10.0...v0.10.1</a></p>
<h2>v0.10.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<p>The file path specification in <code>.config/tombi.toml</code> has been modified to be searched starting from its parent directory, rather than from <code>.config/</code>.</p>
<h3>🚨 Breaking Changes</h3>
<ul>
<li>fix: add leading comment handling for empty tables and arrays in formatting by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1800</a></li>
<li>fix: resolve project-root paths from <code>.config/tombi.toml</code> config by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1802</a></li>
</ul>
<h3>🐛 Bug Fixes</h3>
<ul>
<li>fix: resolve schema paths from config base dir by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1806</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>fix: remove redundant explanation for group-blank-lines-limit and table-blank-lines by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1799</a></li>
<li>Strengthen README overview by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1801</a></li>
<li>docs: correct terminology for auto sorting in documentation by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1805</a></li>
<li>ci: cache TOMBI_CACHE_HOME in CI by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1804</a></li>
<li>Add schema catalog path examples by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1803</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v0.9.26...v0.10.0">https://github.com/tombi-toml/tombi/compare/v0.9.26...v0.10.0</a></p>
<h2>v0.9.26</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🚀 New Features</h3>
<ul>
<li>feat: add example paths for schema in JSON and Rust definitions by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1798</a></li>
<li>feat(formatter): add blank line spacing options by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1792</a></li>
</ul>
<h3>🐛 Bug Fixes</h3>
<ul>
<li>fix(vscode): enable markdown TOML fence injection by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1794</a></li>
<li>chore: update codeblock rule by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1797</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>fix: update latest stable version to 0.9.25 in install script by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1788</a></li>
<li>fix(vscode): broaden markdown TOML fence matching by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1790</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>0d64bd3</code></a> Merge pull request <a href="">#1817</a> from tombi-toml/fix/lsp-diagnostic-test-inline-source</li>
<li><a href=""><code>8b62cb1</code></a> test(diagnostic): improve handling of multiline string literals in tests</li>
<li><a href=""><code>10470a4</code></a> Merge remote-tracking branch 'origin/main' into fix/lsp-diagnostic-test-inlin...</li>
<li><a href=""><code>6c82973</code></a> test(lsp): inline overridden diagnostic fixtures</li>
<li><a href=""><code>922b27a</code></a> Merge pull request <a href="">#1815</a> from ya7010/ya7010/pr-flow-setup</li>
<li><a href=""><code>187e316</code></a> docs: refine formatter intro wording</li>
<li><a href=""><code>ac0c675</code></a> Merge pull request <a href="">#1814</a> from tombi-toml/ya7010/config-glob-pattern</li>
<li><a href=""><code>a6172f2</code></a> chore(config): assert glob pattern layout</li>
<li><a href=""><code>16a5807</code></a> fix(config): reject empty schema glob patterns</li>
<li><a href=""><code>5d3bdfb</code></a> Merge pull request <a href="">#1813</a> from tombi-toml/ya7010/add-schema-exclude</li>
<li>Additional commits viewable in <a href="https://github.com/tombi-toml/tombi/compare/v0.9.22...v0.10.1">compare view</a></li>
</ul>
</details>
<br />

Updates `ty` from 0.0.32 to 0.0.33
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/releases">ty's releases</a>.</em></p>
<blockquote>
<h2>0.0.33</h2>
<h2>Release Notes</h2>
<p>Released on 2026-04-28.</p>
<h3>Notable changes</h3>
<ul>
<li>
<p>ty now prefers the declared type of an annotated assignment in more situations (<a href="">#24802</a>).
Consider this example:</p>
<pre lang="py"><code>from some_library import untyped_function
<p>threshold: int | None = 0
result: str = untyped_function()
</code></pre></p>
<p>ty previously favored the <em>inferred</em> type of the right hand side expression when <code>threshold</code> and <code>result</code> were used. This is useful for <code>threshold</code>, as it allows something like <code>threshold += 1</code> to work without an error: we know that <code>threshold</code> could later become <code>None</code>, but <em>right now</em>, we see that it is an <code>int</code>. However, for <code>result</code>, the inferred type is <code>Unknown</code>. This is <em>not</em> a useful type and it can lead to false negatives. Starting with this release, ty will therefore prefer
the declared type <em>if the inferred and declared types are mutually assignable</em>. In the above example, <code>threshold</code> will still be inferred as <code>int</code> (or rather <code>Literal[1]</code>), but <code>result</code> will now be inferred as <code>str</code>. If you previously added <code>cast</code>s to work around this behavior, you should be able to remove them after upgrading.</p>
</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Fix reporting of annotation-only locals as unused (<a href="">#24811</a>)</li>
<li>Fix project and workspace selection (<a href="">#24824</a>)</li>
<li>Fix go-to definition for generic classes (<a href="">#24714</a>)</li>
<li>Fix receiver coloring for aliased decorators (<a href="">#24884</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Add support for go-to definition in literal enum member inlay hints (<a href="">#24792</a>)</li>
<li>Add support for &quot;baking&quot; keyword argument inlay hints into the source code (<a href="">#24667</a>)</li>
<li>Don't allow inlay hint edits when introducing a non global scope symbol (<a href="">#24797</a>)</li>
<li>Omit semantic highlighting for unresolved symbols (<a href="">#24718</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Support narrowing with aliased conditional expressions (<a href="">#24302</a>)</li>
<li>Model short-circuiting control flow in Boolean expressions (<a href="">#24458</a>)</li>
<li>Handle <code>finally</code> blocks where all <code>try</code>/<code>except</code> blocks are terminal (<a href="">#24882</a>)</li>
<li>Detect invalid <code>ClassVar</code> vs instance-attribute overrides (<a href="">#24767</a>)</li>
<li>Emit diagnostic for invalid uses of <code>Unpack[...]</code> (<a href="">#24868</a>)</li>
<li>Infer lambda parameter types with <code>Callable</code> type context (<a href="">#24317</a>)</li>
<li>Support <code>**</code> unpacking of <code>TypedDict</code> in dict-literal assignments (<a href="">#24703</a>)</li>
<li>Support <code>Unpack[TypedDict]</code> in <code>**kwargs</code> signatures (<a href="">#24653</a>)</li>
<li>Treat <code>[*xs]</code> as an irrefutable pattern when matching on <code>Sequence</code> (<a href="">#24787</a>)</li>
<li>Improve generics solving for unions in invariant positions (<a href="">#24698</a>)</li>
<li>Improve generics solving for unions when matching against protocols (<a href="">#24837</a>)</li>
</ul>
<h3>Diagnostics</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/blob/main/CHANGELOG.md">ty's changelog</a>.</em></p>
<blockquote>
<h2>0.0.33</h2>
<p>Released on 2026-04-28.</p>
<h3>Notable changes</h3>
<ul>
<li>
<p>ty now prefers the declared type of an annotated assignment in more situations (<a href="">#24802</a>).
Consider this example:</p>
<pre lang="py"><code>from some_library import untyped_function
<p>threshold: int | None = 0
result: str = untyped_function()
</code></pre></p>
<p>ty previously favored the <em>inferred</em> type of the right hand side expression when <code>threshold</code> and <code>result</code> were used. This is useful for <code>threshold</code>, as it allows something like <code>threshold += 1</code> to work without an error: we know that <code>threshold</code> could later become <code>None</code>, but <em>right now</em>, we see that it is an <code>int</code>. However, for <code>result</code>, the inferred type is <code>Unknown</code>. This is <em>not</em> a useful type and it can lead to false negatives. Starting with this release, ty will therefore prefer
the declared type <em>if the inferred and declared types are mutually assignable</em>. In the above example, <code>threshold</code> will still be inferred as <code>int</code> (or rather <code>Literal[1]</code>), but <code>result</code> will now be inferred as <code>str</code>. If you previously added <code>cast</code>s to work around this behavior, you should be able to remove them after upgrading.</p>
</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Fix reporting of annotation-only locals as unused (<a href="">#24811</a>)</li>
<li>Fix project and workspace selection (<a href="">#24824</a>)</li>
<li>Fix go-to definition for generic classes (<a href="">#24714</a>)</li>
<li>Fix receiver coloring for aliased decorators (<a href="">#24884</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Add support for go-to definition in literal enum member inlay hints (<a href="">#24792</a>)</li>
<li>Add support for &quot;baking&quot; keyword argument inlay hints into the source code (<a href="">#24667</a>)</li>
<li>Don't allow inlay hint edits when introducing a non global scope symbol (<a href="">#24797</a>)</li>
<li>Omit semantic highlighting for unresolved symbols (<a href="">#24718</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Support narrowing with aliased conditional expressions (<a href="">#24302</a>)</li>
<li>Model short-circuiting control flow in Boolean expressions (<a href="">#24458</a>)</li>
<li>Handle <code>finally</code> blocks where all <code>try</code>/<code>except</code> blocks are terminal (<a href="">#24882</a>)</li>
<li>Detect invalid <code>ClassVar</code> vs instance-attribute overrides (<a href="">#24767</a>)</li>
<li>Emit diagnostic for invalid uses of <code>Unpack[...]</code> (<a href="">#24868</a>)</li>
<li>Infer lambda parameter types with <code>Callable</code> type context (<a href="">#24317</a>)</li>
<li>Support <code>**</code> unpacking of <code>TypedDict</code> in dict-literal assignments (<a href="">#24703</a>)</li>
<li>Support <code>Unpack[TypedDict]</code> in <code>**kwargs</code> signatures (<a href="">#24653</a>)</li>
<li>Treat <code>[*xs]</code> as an irrefutable pattern when matching on <code>Sequence</code> (<a href="">#24787</a>)</li>
<li>Improve generics solving for unions in invariant positions (<a href="">#24698</a>)</li>
<li>Improve generics solving for unions when matching against protocols (<a href="">#24837</a>)</li>
</ul>
<h3>Diagnostics</h3>
<ul>
<li>Add error context to <code>invalid-return-type</code> diagnostics, <code>invalid-yield</code> diagnostics, attribute assignment diagnostics (<a href="">#24770</a>, <a href="">#24771</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>c512d84</code></a> Bump version to 0.0.33 (<a href="">#3368</a>)</li>
<li><a href=""><code>4cd7b33</code></a> Upgrade Depot runners from macOS 14 to 15 (<a href="">#3363</a>)</li>
<li><a href=""><code>c78b832</code></a> Update rui314/setup-mold digest to 9c9c13b (<a href="">#3342</a>)</li>
<li><a href=""><code>dea3381</code></a> Update actions/cache action to v5.0.5 (<a href="">#3343</a>)</li>
<li><a href=""><code>d451af4</code></a> update typing-features and faqs (<a href="">#3335</a>)</li>
<li><a href=""><code>052d70b</code></a> Update prek dependencies (<a href="">#3344</a>)</li>
<li><a href=""><code>66b5e87</code></a> Update astral-sh/setup-uv action to v8.1.0 (<a href="">#3345</a>)</li>
<li><a href=""><code>7ec6712</code></a> Add a 'Diagnostics improvements' section to the changelogs (<a href="">#3309</a>)</li>
<li><a href=""><code>978dfdb</code></a> Add version metadata publishing to the release process (<a href="">#3292</a>)</li>
<li>See full diff in <a href="https://github.com/astral-sh/ty/compare/0.0.32...0.0.33">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `49248d79d77a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.