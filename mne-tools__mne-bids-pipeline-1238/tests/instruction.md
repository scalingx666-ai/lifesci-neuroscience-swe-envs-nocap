# Issue

**Title:** [dependabot]: Bump the deps group with 5 updates

## Description

Bumps the deps group with 5 updates:

| Package | From | To |
| --- | --- | --- |
| [pydantic](https://github.com/pydantic/pydantic) | `2.13.3` | `2.13.4` |
| [pyvista](https://github.com/pyvista/pyvista) | `0.47.3` | `0.48.1` |
| [tombi](https://github.com/tombi-toml/tombi) | `0.10.1` | `0.10.6` |
| [ty](https://github.com/astral-sh/ty) | `0.0.33` | `0.0.34` |
| [pydantic-core](https://github.com/pydantic/pydantic) | `2.46.3` | `2.46.4` |

Updates `pydantic` from 2.13.3 to 2.13.4
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pydantic/pydantic/releases">pydantic's releases</a>.</em></p>
<blockquote>
<h2>v2.13.4 2026-05-06</h2>
<h2>v2.13.4 (2026-05-06)</h2>
<h3>What's Changed</h3>
<h4>Packaging</h4>
<ul>
<li>Bump libc from 0.2.155 to 0.2.185 by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13109</a></li>
<li>Adapt <code>pydantic-core</code> linker flags on macOS by <a href="https://github.com/washingtoneg"><code>@​washingtoneg</code></a> and <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13147</a></li>
</ul>
<h4>Fixes</h4>
<ul>
<li>Preserve <code>RootModel</code> core metadata by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13129</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/pydantic/pydantic/compare/v2.13.3...v2.13.4">https://github.com/pydantic/pydantic/compare/v2.13.3...v2.13.4</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pydantic/pydantic/blob/v2.13.4/HISTORY.md">pydantic's changelog</a>.</em></p>
<blockquote>
<h2>v2.13.4 (2026-05-06)</h2>
<p><a href="https://github.com/pydantic/pydantic/releases/tag/v2.13.4">GitHub release</a></p>
<h3>What's Changed</h3>
<h4>Packaging</h4>
<ul>
<li>Bump libc from 0.2.155 to 0.2.185 by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13109</a></li>
<li>Adapt <code>pydantic-core</code> linker flags on macOS by <a href="https://github.com/washingtoneg"><code>@​washingtoneg</code></a> and <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13147</a></li>
</ul>
<h4>Fixes</h4>
<ul>
<li>Preserve <code>RootModel</code> core metadata by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">#13129</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>cf67d4b</code></a> Fix linting</li>
<li><a href=""><code>f0d8a21</code></a> Prepare release v2.13.4</li>
<li><a href=""><code>5e3fe1d</code></a> Check for pydantic tag pattern in CI</li>
<li><a href=""><code>7f9edcc</code></a> Document tagging conventions</li>
<li><a href=""><code>b46a0c9</code></a> Adapt <code>pydantic-core</code> linker flags on macOS</li>
<li><a href=""><code>50629c8</code></a> Update to PyPy 7.3.22</li>
<li><a href=""><code>8522ebb</code></a> Preserve <code>RootModel</code> core metadata</li>
<li><a href=""><code>a37f3af</code></a> Adapt <code>MISSING</code> sentinel test to work with unreleased <code>typing_extensions</code> ver...</li>
<li><a href=""><code>909259a</code></a> Remove Logfire example in documentation</li>
<li><a href=""><code>2c4174c</code></a> Bump libc from 0.2.155 to 0.2.185</li>
<li>See full diff in <a href="https://github.com/pydantic/pydantic/compare/v2.13.3...v2.13.4">compare view</a></li>
</ul>
</details>
<br />

Updates `pyvista` from 0.47.3 to 0.48.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pyvista/pyvista/releases">pyvista's releases</a>.</em></p>
<blockquote>
<h2>v0.48: Built to Extend</h2>
<h1>PyVista 0.48: Built to Extend</h1>
<p>PyVista 0.48 is a community release focused on extensibility. Third-party packages can now plug directly into PyVista without monkey-patching or forks. New registries cover readers, writers, themes, plotter components, dataset accessors, interactor styles, and notebook backends, all wired through standard Python entry points. If you maintain a downstream project that wraps PyVista, start here.</p>
<h2>Highlights</h2>
<p><strong>Plugin registries.</strong> <code>pv.read()</code> is now backed by a <a href="">pluggable reader registry</a>, with a matching <a href="">writer registry</a> that adopts the new <code>pyvista-zstd</code> package as the first external writer. <a href="">Themes</a>, <a href="">interactor styles</a>, <a href="">notebook backends</a>, <a href="">dataset accessors</a>, and <a href="">plotter components</a> follow the same pattern. The plotter component work migrates <code>ScalarBars</code>, picking, and widgets onto the new architecture so downstream packages can swap in replacements.</p>
<p><strong>Bug fixes.</strong> Shared meshes across subplots no longer mutate each other's <a href="">active scalars</a>. Smooth shading is <a href="">ported to a proper VTK algorithm</a> so it composes with the rest of a pipeline. macOS users get a <a href="">fix for the zombie off-screen window</a>. <code>pyvista_ndarray</code> no longer <a href="">leaks a vtkWeakReference</a> through <code>point_data.__setitem__</code>. Colormap resolution is now <a href="">deterministic</a>, preferring matplotlib over third-party shadows.</p>
<p><strong>New rendering and I/O.</strong> <a href="">Stereo rendering</a>, <a href="">custom point sprites and max-intensity projection</a>, <a href="">environment texture rotation with a background toggle</a>, a <a href="">CalculiX <code>.frd</code> reader</a>, <a href=""><code>force_opaque</code> plotting</a>, and <a href="">DataFrame and Apache Arrow export</a> for mesh data.</p>
<p><strong>Notebook and CLI.</strong> A <a href="">modernized HTML repr</a> and a <a href="">PNG repr for plotters</a> for cleaner Jupyter output. The CLI gains a <a href=""><code>validate</code> command</a> with <a href="">colorized reports</a> and <a href="">glob support for bulk file conversions</a>.</p>
<p><strong>Performance.</strong> <a href="">Array and filter optimizations</a>, <a href=""><code>wrap()</code> overhead reductions</a>, <a href="">VTK SMP tools helpers</a>, and a <a href=""><code>remove_nan_cells</code></a> helper.</p>
<p><strong>Mesh validation and cell types.</strong> Expanded <code>validate_mesh</code> and <code>cell_validator</code>, new <code>CellType</code> properties, a <code>dimension_map</code>, Bezier and Lagrange examples, and <code>to_hexahedra</code> / <code>to_quads</code> for <code>ImageData</code> and <code>RectilinearGrid</code>.</p>
<p>Eight new contributors landed PRs this cycle. Thanks to <a href="https://github.com/jcapriot"><code>@​jcapriot</code></a>, <a href="https://github.com/Zetarcos"><code>@​Zetarcos</code></a>, <a href="https://github.com/3rav"><code>@​3rav</code></a>, <a href="https://github.com/bryzgin"><code>@​bryzgin</code></a>, <a href="https://github.com/saschabuehrle"><code>@​saschabuehrle</code></a>, <a href="https://github.com/kuriankattukaren-dev"><code>@​kuriankattukaren-dev</code></a>, <a href="https://github.com/T4mmi"><code>@​T4mmi</code></a>, and <a href="https://github.com/Maxwell-Rosen"><code>@​Maxwell-Rosen</code></a> for jumping in.</p>
<p>Full changelog: <a href="https://github.com/pyvista/pyvista/compare/v0.47.0...v0.48.0">https://github.com/pyvista/pyvista/compare/v0.47.0...v0.48.0</a></p>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>Breaking Changes</h3>
<ul>
<li>Use delimited color names by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8350</a></li>
<li>Make mesh validation report body show error message by default by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8354</a></li>
<li>Fix colormap determinism: prefer matplotlib over third-party shadows by <a href="https://github.com/banesullivan"><code>@​banesullivan</code></a> in <a href="">pyvista/pyvista#8593</a></li>
</ul>
<h3>New Features</h3>
<ul>
<li>Augment <code>cell_validator</code> with additional checks by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8318</a></li>
<li>Add <code>exclude_fields</code> option to <code>validate_mesh</code> by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8327</a></li>
<li>Update paraview named colors by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8347</a></li>
<li>Add <code>validate</code> command to PyVista CLI by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8344</a></li>
<li>Add <code>report_body</code> keyword to <code>validate_mesh</code> by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8353</a></li>
<li>Add type annotations for literal named colors by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8349</a></li>
<li>Add <code>--report</code> option to <code>validate</code> CLI command by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8355</a></li>
<li>Format and color output text from <code>validate</code> CLI by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8358</a></li>
<li>Allow excluding fields from a subset of mesh validation fields by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8364</a></li>
<li>Add <code>DataSet.bounding_sphere</code> property by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8385</a></li>
<li>Add the ability to read CalculiX .frd files by <a href="https://github.com/3rav"><code>@​3rav</code></a> in <a href="">pyvista/pyvista#8255</a></li>
<li>Support registration of custom notebook backends by <a href="https://github.com/banesullivan"><code>@​banesullivan</code></a> in <a href="">pyvista/pyvista#8389</a></li>
<li>Add <code>CellType</code> properties by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8393</a></li>
<li>Add <code>ConvexPointSet</code> cell type example by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8400</a></li>
<li>Add <code>generate_cell_blocks</code> to generate mesh with arbitrary cell type(s) by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#8404</a></li>
<li>Add <code>force_opaque</code> argument to plotting methods by <a href="https://github.com/edabor"><code>@​edabor</code></a> in <a href="">pyvista/pyvista#8408</a></li>
<li>Modernize HTML repr for Jupyter notebooks by <a href="https://github.com/banesullivan"><code>@​banesullivan</code></a> in <a href="">pyvista/pyvista#8443</a></li>
<li>Add pluggable reader registry for pv.read() by <a href="https://github.com/banesullivan"><code>@​banesullivan</code></a> in <a href="">pyvista/pyvista#8437</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>c978f49</code></a> Bump version: v0.48.1</li>
<li><a href=""><code>6d70bf0</code></a> Fix dimension property for abstract cell types with older VTK (<a href="">#8636</a>)</li>
<li><a href=""><code>752a26c</code></a> Fix CI silently running latest VTK on pinned-version envs (<a href="">#8638</a>)</li>
<li><a href=""><code>84198a3</code></a> Fix dataset accessor when accessed from class first (<a href="">#8624</a>)</li>
<li><a href=""><code>935ffb8</code></a> Update version to 0.48.0</li>
<li><a href=""><code>27c65dc</code></a> Finalize v0.48 deprecations</li>
<li><a href=""><code>0785f61</code></a> Release v0.48</li>
<li><a href=""><code>0fb0507</code></a> Lazily import all VTK classes in a common <code>pyvista._vtk.py</code> module (<a href="">#8602</a>)</li>
<li><a href=""><code>3fe6dab</code></a> Cache lazily-loaded <code>pyvista</code> attributes for faster repeated access (<a href="">#8607</a>)</li>
<li><a href=""><code>bd0f3b0</code></a> Add gallery examples for common PyVista APIs (<a href="">#8513</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pyvista/pyvista/compare/v0.47.3...v0.48.1">compare view</a></li>
</ul>
</details>
<br />

Updates `tombi` from 0.10.1 to 0.10.6
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tombi-toml/tombi/releases">tombi's releases</a>.</em></p>
<blockquote>
<h2>v0.10.6</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🐛 Bug Fixes</h3>
<ul>
<li>Limit verbose logging to Tombi crates by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1861</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>Move LSP store loading from initialize to initialized by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1862</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v0.10.5...v0.10.6">https://github.com/tombi-toml/tombi/compare/v0.10.5...v0.10.6</a></p>
<h2>v0.10.5</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🐛 Bug Fixes</h3>
<ul>
<li>Show TOML keyword suggestions in VS Code by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1859</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>clippy: fix needless_for_each lint by <a href="https://github.com/xtqqczze"><code>@​xtqqczze</code></a> in <a href="">tombi-toml/tombi#1854</a></li>
<li>Add workspace lints to all Cargo.toml files by <a href="https://github.com/xtqqczze"><code>@​xtqqczze</code></a> in <a href="">tombi-toml/tombi#1855</a></li>
<li>clippy: fix collapsible_match lint by <a href="https://github.com/xtqqczze"><code>@​xtqqczze</code></a> in <a href="">tombi-toml/tombi#1856</a></li>
<li>docs: remove sticky table header gap by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1857</a></li>
<li>Fix docs table sticky header path by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1858</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v0.10.4...v0.10.5">https://github.com/tombi-toml/tombi/compare/v0.10.4...v0.10.5</a></p>
<h2>v0.10.4</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🐛 Bug Fixes</h3>
<ul>
<li>fix(lsp): refresh workspace pull diagnostics by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1853</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>refactor: Replace Vec::with_capacity(0) with Vec::new() by <a href="https://github.com/xtqqczze"><code>@​xtqqczze</code></a> in <a href="">tombi-toml/tombi#1851</a></li>
<li>clippy: fix explicit_counter_loop lint by <a href="https://github.com/xtqqczze"><code>@​xtqqczze</code></a> in <a href="">tombi-toml/tombi#1852</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/xtqqczze"><code>@​xtqqczze</code></a> made their first contribution in <a href="">tombi-toml/tombi#1851</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v0.10.3...v0.10.4">https://github.com/tombi-toml/tombi/compare/v0.10.3...v0.10.4</a></p>
<h2>v0.10.3</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🚀 New Features</h3>
<ul>
<li>feat(hover): show latest package version by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1831</a></li>
</ul>
<h3>🐛 Bug Fixes</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>87d7502</code></a> Merge pull request <a href="">#1862</a> from tombi-toml/ya7010/investigate-slowdown</li>
<li><a href=""><code>3f0ab13</code></a> fix: drop startup warning notification</li>
<li><a href=""><code>617f9b4</code></a> fix: address startup review feedback</li>
<li><a href=""><code>b44c1fe</code></a> Merge remote-tracking branch 'origin/main' into ya7010/investigate-slowdown</li>
<li><a href=""><code>5f3624c</code></a> fix: move lsp store loading to initialized</li>
<li><a href=""><code>53aeaba</code></a> Merge pull request <a href="">#1861</a> from ya7010/ya7010/filter-external-logs</li>
<li><a href=""><code>0439684</code></a> Limit verbose logs to Tombi crates</li>
<li><a href=""><code>393cbb7</code></a> docs: update install.sh stable version to 0.10.5</li>
<li><a href=""><code>22e8154</code></a> Merge pull request <a href="">#1859</a> from tombi-toml/ya7010/inspect-pipe-completion</li>
<li><a href=""><code>1a8cb8f</code></a> Show TOML keyword suggestions</li>
<li>Additional commits viewable in <a href="https://github.com/tombi-toml/tombi/compare/v0.10.1...v0.10.6">compare view</a></li>
</ul>
</details>
<br />

Updates `ty` from 0.0.33 to 0.0.34
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/releases">ty's releases</a>.</em></p>
<blockquote>
<h2>0.0.34</h2>
<h2>Release Notes</h2>
<p>Released on 2026-05-01.</p>
<h3>Bug fixes</h3>
<ul>
<li>Avoid panic in recursive protocol signature comparisons (<a href="">#24665</a>)</li>
<li>Avoid panics for syntax error targets in invalid unpacking assignments (<a href="">#24663</a>)</li>
<li>Fix unbounded type growth in nested-typevar substitutions (<a href="">#24803</a>)</li>
<li>Prevent string annotation tokens from leaking across notebook cells (<a href="">#24919</a>)</li>
<li>Support reference finding in stringified annotations (<a href="">#24956</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Add hover support for PEP 695 type aliases (<a href="">#24926</a>)</li>
<li>Offer string literal completion suggestions based on expected type (<a href="">#24555</a>)</li>
<li>Support Go-to Definition, Go-To Declaration, and Find References for TypedDict and NamedTuple initializers (<a href="">#24897</a>)</li>
<li>Support <code>Annotated</code> metadata in semantic tokens (<a href="">#24890</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Add support for <code>functools.partial</code> (<a href="">#24582</a>)</li>
<li>Fix ParamSpec defaults and alias variance (<a href="">#24479</a>)</li>
<li>Fix <code>TypeIs</code> assignability with gradual types (<a href="">#24928</a>)</li>
<li>Infer <code>dict(**TypedDict)</code> in <code>TypedDict</code> context (<a href="">#24709</a>)</li>
<li>Support <code>infer_variance</code> for legacy <code>TypeVar</code> (<a href="">#24930</a>)</li>
<li>Support variance keywords in <code>ParamSpec</code> (<a href="">#24927</a>)</li>
<li>Sync vendored typeshed stubs (<a href="">#24952</a>). <a href="https://github.com/python/typeshed/compare/c03c2b926422c82ab680d27f3ad2491845000802...e4d32e01bee44241a5e7c33298c261175b9f1bdb">Typeshed diff</a></li>
<li>Unpack <code>Union</code> of <code>TypedDict</code> in various sites (<a href="">#24958</a>)</li>
</ul>
<h3>Diagnostics</h3>
<ul>
<li>Add missing error context node for protocol to protocol assignability (<a href="">#24905</a>)</li>
<li>Show a diagnostic for unsupported inferred Python version (<a href="">#24581</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Lazily build TypeVar accumulations (<a href="">#24782</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/sharkdp"><code>@​sharkdp</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/lerebear"><code>@​lerebear</code></a></li>
<li><a href="https://github.com/MatthewMckee4"><code>@​MatthewMckee4</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/mtshiba"><code>@​mtshiba</code></a></li>
<li><a href="https://github.com/Minibrams"><code>@​Minibrams</code></a></li>
<li><a href="https://github.com/denyszhak"><code>@​denyszhak</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/blob/main/CHANGELOG.md">ty's changelog</a>.</em></p>
<blockquote>
<h2>0.0.34</h2>
<p>Released on 2026-05-01.</p>
<h3>Bug fixes</h3>
<ul>
<li>Avoid panic in recursive protocol signature comparisons (<a href="">#24665</a>)</li>
<li>Avoid panics for syntax error targets in invalid unpacking assignments (<a href="">#24663</a>)</li>
<li>Fix unbounded type growth in nested-typevar substitutions (<a href="">#24803</a>)</li>
<li>Prevent string annotation tokens from leaking across notebook cells (<a href="">#24919</a>)</li>
<li>Support reference finding in stringified annotations (<a href="">#24956</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Add hover support for PEP 695 type aliases (<a href="">#24926</a>)</li>
<li>Offer string literal completion suggestions based on expected type (<a href="">#24555</a>)</li>
<li>Support Go-to Definition, Go-To Declaration, and Find References for TypedDict and NamedTuple initializers (<a href="">#24897</a>)</li>
<li>Support <code>Annotated</code> metadata in semantic tokens (<a href="">#24890</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Add support for <code>functools.partial</code> (<a href="">#24582</a>)</li>
<li>Fix ParamSpec defaults and alias variance (<a href="">#24479</a>)</li>
<li>Fix <code>TypeIs</code> assignability with gradual types (<a href="">#24928</a>)</li>
<li>Infer <code>dict(**TypedDict)</code> in <code>TypedDict</code> context (<a href="">#24709</a>)</li>
<li>Support <code>infer_variance</code> for legacy <code>TypeVar</code> (<a href="">#24930</a>)</li>
<li>Support variance keywords in <code>ParamSpec</code> (<a href="">#24927</a>)</li>
<li>Sync vendored typeshed stubs (<a href="">#24952</a>). <a href="https://github.com/python/typeshed/compare/c03c2b926422c82ab680d27f3ad2491845000802...e4d32e01bee44241a5e7c33298c261175b9f1bdb">Typeshed diff</a></li>
<li>Unpack <code>Union</code> of <code>TypedDict</code> in various sites (<a href="">#24958</a>)</li>
</ul>
<h3>Diagnostics</h3>
<ul>
<li>Add missing error context node for protocol to protocol assignability (<a href="">#24905</a>)</li>
<li>Show a diagnostic for unsupported inferred Python version (<a href="">#24581</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Lazily build TypeVar accumulations (<a href="">#24782</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/sharkdp"><code>@​sharkdp</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/lerebear"><code>@​lerebear</code></a></li>
<li><a href="https://github.com/MatthewMckee4"><code>@​MatthewMckee4</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/mtshiba"><code>@​mtshiba</code></a></li>
<li><a href="https://github.com/Minibrams"><code>@​Minibrams</code></a></li>
<li><a href="https://github.com/denyszhak"><code>@​denyszhak</code></a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>d00448e</code></a> Bump version to 0.0.34 (<a href="">#3392</a>)</li>
<li><a href=""><code>e9e4c90</code></a> docs: Reference correct issue in FAQ regarding strict mode (<a href="">#3385</a>)</li>
<li><a href=""><code>1b70eae</code></a> Release: move 'diagnostics' section further down (<a href="">#3373</a>)</li>
<li><a href=""><code>d439e37</code></a> CHANGELOG: Rename to 'Notable changes' (<a href="">#3372</a>)</li>
<li>See full diff in <a href="https://github.com/astral-sh/ty/compare/0.0.33...0.0.34">compare view</a></li>
</ul>
</details>
<br />

Updates `pydantic-core` from 2.46.3 to 2.46.4
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>cf67d4b</code></a> Fix linting</li>
<li><a href=""><code>f0d8a21</code></a> Prepare release v2.13.4</li>
<li><a href=""><code>5e3fe1d</code></a> Check for pydantic tag pattern in CI</li>
<li><a href=""><code>7f9edcc</code></a> Document tagging conventions</li>
<li><a href=""><code>b46a0c9</code></a> Adapt <code>pydantic-core</code> linker flags on macOS</li>
<li><a href=""><code>50629c8</code></a> Update to PyPy 7.3.22</li>
<li><a href=""><code>8522ebb</code></a> Preserve <code>RootModel</code> core metadata</li>
<li><a href=""><code>a37f3af</code></a> Adapt <code>MISSING</code> sentinel test to work with unreleased <code>typing_extensions</code> ver...</li>
<li><a href=""><code>909259a</code></a> Remove Logfire example in documentation</li>
<li><a href=""><code>2c4174c</code></a> Bump libc from 0.2.155 to 0.2.185</li>
<li>See full diff in <a href="https://github.com/pydantic/pydantic/compare/core-v2.46.3...core-v2.46.4">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `15cf2c237b0a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.