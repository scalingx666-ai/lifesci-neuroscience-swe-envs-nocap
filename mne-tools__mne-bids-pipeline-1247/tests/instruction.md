# Issue

**Title:** [dependabot]: Bump the deps group with 8 updates

## Description

Bumps the deps group with 8 updates:

| Package | From | To |
| --- | --- | --- |
| [mne-icalabel](https://github.com/mne-tools/mne-icalabel) | `0.8.1` | `0.9.0` |
| [pyvista](https://github.com/pyvista/pyvista) | `0.48.2` | `0.48.4` |
| [lefthook](https://github.com/evilmartians/lefthook) | `2.1.6` | `2.1.8` |
| [ruff](https://github.com/astral-sh/ruff) | `0.15.13` | `0.15.14` |
| [tombi](https://github.com/tombi-toml/tombi) | `0.11.4` | `0.11.6` |
| [ty](https://github.com/astral-sh/ty) | `0.0.35` | `0.0.38` |
| [black](https://github.com/psf/black) | `26.3.1` | `26.5.1` |
| [mkdocs-include-markdown-plugin](https://github.com/mondeja/mkdocs-include-markdown-plugin) | `7.2.2` | `7.3.0` |

Updates `mne-icalabel` from 0.8.1 to 0.9.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/mne-tools/mne-icalabel/releases">mne-icalabel's releases</a>.</em></p>
<blockquote>
<h2>v0.9.0</h2>
<h2>What's Changed</h2>
<ul>
<li>Fix MEGNET label ordering which had blink and eye movement swapped by <a href="https://github.com/mscheltienne"><code>@​mscheltienne</code></a> in <a href="">mne-tools/mne-icalabel#305</a></li>
<li>Bump codecov/codecov-action from 5 to 6 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">mne-tools/mne-icalabel#299</a></li>
<li>Prepare 0.9.0 release by <a href="https://github.com/mscheltienne"><code>@​mscheltienne</code></a> in <a href="">mne-tools/mne-icalabel#306</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/mne-tools/mne-icalabel/compare/v0.8.1...v0.9.0">https://github.com/mne-tools/mne-icalabel/compare/v0.8.1...v0.9.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>7a4e27c</code></a> Prepare 0.9.0 release (<a href="">#306</a>)</li>
<li><a href=""><code>928280b</code></a> Bump codecov/codecov-action from 5 to 6 (<a href="">#299</a>)</li>
<li><a href=""><code>65df723</code></a> Fix MEGNET label ordering which had blink and eye movement swapped (<a href="">#305</a>)</li>
<li><a href=""><code>241ef80</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#303</a>)</li>
<li><a href=""><code>2ffb860</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#302</a>)</li>
<li><a href=""><code>a096667</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#301</a>)</li>
<li><a href=""><code>5ee146d</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#300</a>)</li>
<li><a href=""><code>8f393e1</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#298</a>)</li>
<li><a href=""><code>b727d50</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#297</a>)</li>
<li><a href=""><code>80cc6da</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#296</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/mne-tools/mne-icalabel/compare/v0.8.1...v0.9.0">compare view</a></li>
</ul>
</details>
<br />

Updates `pyvista` from 0.48.2 to 0.48.4
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pyvista/pyvista/releases">pyvista's releases</a>.</em></p>
<blockquote>
<h2>v0.44.0: NumPy 2.0 Support and Upcoming VTK 9.4 Preparation</h2>
<!-- raw HTML omitted -->
<h2>Highlights</h2>
<ul>
<li>Ensure  compatibility with NumPy 2.0</li>
<li>Method Resolution Order compatibility for upcoming VTK 9.4 <a href="">pyvista/pyvista#5650</a> (preparation work to ensure some minimum level of compatibility with upcoming changes to VTK)</li>
<li>Add Image Source module to create example images.</li>
</ul>
<h2>What's Changed</h2>
<h3>Breaking Changes</h3>
<ul>
<li>Add parallel_projection and parallel_scale to Theme; make <code>camera</code> setting a first class <code>_ThemeConfig</code> by <a href="https://github.com/MatthewFlamm"><code>@​MatthewFlamm</code></a> in <a href="">pyvista/pyvista#5624</a></li>
<li>Ensure no overlap with crinkle clip by <a href="https://github.com/banesullivan"><code>@​banesullivan</code></a> in <a href="">pyvista/pyvista#6060</a></li>
<li>Fix active normals for properties <code>point_normals</code>, <code>cell_normals</code>, and method <code>plot_normals</code> with <code>smooth_shading</code> by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#6062</a></li>
</ul>
<h3>New Features</h3>
<ul>
<li>Scale array for points gaussian by <a href="https://github.com/kmarchais"><code>@​kmarchais</code></a> in <a href="">pyvista/pyvista#4366</a></li>
<li>Add Paraview-like 2D interactor style by <a href="https://github.com/MatthewFlamm"><code>@​MatthewFlamm</code></a> in <a href="">pyvista/pyvista#5336</a></li>
<li>Inherit <code>XdmfReader</code> class from <code>TimeReader</code> to improve time properties by <a href="https://github.com/tkoyama010"><code>@​tkoyama010</code></a> in <a href="">pyvista/pyvista#5332</a></li>
<li>Add <code>outline_opacity</code> to <code>add_plane_widget</code> by <a href="https://github.com/tkoyama010"><code>@​tkoyama010</code></a> in <a href="">pyvista/pyvista#5354</a></li>
<li>Add <code>from_irregular_faces</code> to <code>PolyData</code> by <a href="https://github.com/darikg"><code>@​darikg</code></a> in <a href="">pyvista/pyvista#5375</a></li>
<li>Add <code>font_family</code> param to <code>add_legend</code> function by <a href="https://github.com/tkoyama010"><code>@​tkoyama010</code></a> in <a href="">pyvista/pyvista#5396</a></li>
<li>Add Victorian Goblet face illusion example by <a href="https://github.com/tkoyama010"><code>@​tkoyama010</code></a> in <a href="">pyvista/pyvista#5403</a></li>
<li>Add italic and bold property to <code>TextPropery</code> by <a href="https://github.com/tkoyama010"><code>@​tkoyama010</code></a> in <a href="">pyvista/pyvista#5408</a></li>
<li>Add text justification option to <code>add_point_labels</code> by <a href="https://github.com/tkoyama010"><code>@​tkoyama010</code></a> in <a href="">pyvista/pyvista#5407</a></li>
<li>Trame Plotter UI: Menu positioning by <a href="https://github.com/annehaley"><code>@​annehaley</code></a> in <a href="">pyvista/pyvista#5429</a></li>
<li>Add custom trackball style and refactoring <code>enable_2d_style</code> by <a href="https://github.com/MatthewFlamm"><code>@​MatthewFlamm</code></a> in <a href="">pyvista/pyvista#5428</a></li>
<li>Allow computing number of cell vertices in <code>compute_cell_sizes</code> by <a href="https://github.com/MatthewFlamm"><code>@​MatthewFlamm</code></a> in <a href="">pyvista/pyvista#5474</a></li>
<li>Add support to <code>meshio</code>'s <code>polyhedronX</code> cell types by <a href="https://github.com/keurfonluu"><code>@​keurfonluu</code></a> in <a href="">pyvista/pyvista#5369</a></li>
<li>Fix EnSight reader time set selection by <a href="https://github.com/advktEntnschdl"><code>@​advktEntnschdl</code></a> in <a href="">pyvista/pyvista#5492</a></li>
<li>Update CellArray to use ImportLegacyFormat by <a href="https://github.com/darikg"><code>@​darikg</code></a> in <a href="">pyvista/pyvista#5495</a></li>
<li>Add <code>background_opacity</code> argument to <code>add_legend</code> by <a href="https://github.com/tkoyama010"><code>@​tkoyama010</code></a> in <a href="">pyvista/pyvista#5509</a></li>
<li>Add <code>CubeSource</code> algorithm class to represent cube by <a href="https://github.com/tkoyama010"><code>@​tkoyama010</code></a> in <a href="">pyvista/pyvista#5526</a></li>
<li>Add <code>DiscSource</code> algorithm class to represent disc by <a href="https://github.com/tkoyama010"><code>@​tkoyama010</code></a> in <a href="">pyvista/pyvista#5531</a></li>
<li>Add <code>LineSource</code> algorithm class to represent line by <a href="https://github.com/tkoyama010"><code>@​tkoyama010</code></a> in <a href="">pyvista/pyvista#5534</a></li>
<li>Add <code>SphereSource</code> algorithm class to represent sphere by <a href="https://github.com/tkoyama010"><code>@​tkoyama010</code></a> in <a href="">pyvista/pyvista#5535</a></li>
<li>Add <code>PolygonSource</code> algorithm class of polygon by <a href="https://github.com/tkoyama010"><code>@​tkoyama010</code></a> in <a href="">pyvista/pyvista#5539</a></li>
<li>Add <code>PlatonicSolidSource</code> platonic solid algorithm by <a href="https://github.com/tkoyama010"><code>@​tkoyama010</code></a> in <a href="">pyvista/pyvista#5547</a></li>
<li>Add <code>PlaneSource</code> to add plane algorithm source by <a href="https://github.com/tkoyama010"><code>@​tkoyama010</code></a> in <a href="">pyvista/pyvista#5562</a></li>
<li>Add the <code>camera3d_widget</code> allow to move the camera by <a href="https://github.com/tkoyama010"><code>@​tkoyama010</code></a> in <a href="">pyvista/pyvista#5577</a></li>
<li>Legend improvements by <a href="https://github.com/germa89"><code>@​germa89</code></a> in <a href="">pyvista/pyvista#3015</a></li>
<li>Add <code>compute_boundary_cell_quality</code> DataSet method by <a href="https://github.com/tkoyama010"><code>@​tkoyama010</code></a> in <a href="">pyvista/pyvista#5595</a></li>
<li>Add <code>BoxSource</code> to add box algorithm source by <a href="https://github.com/tkoyama010"><code>@​tkoyama010</code></a> in <a href="">pyvista/pyvista#5620</a></li>
<li>Add <code>ArrowSource</code> to add arrow algorithm source by <a href="https://github.com/tkoyama010"><code>@​tkoyama010</code></a> in <a href="">pyvista/pyvista#5622</a></li>
<li>Add <code>SuperquadricSource</code> to add arrow algorithm by <a href="https://github.com/tkoyama010"><code>@​tkoyama010</code></a> in <a href="">pyvista/pyvista#5648</a></li>
<li>Add <code>get_charts</code> method to <code>Renderer</code> by <a href="https://github.com/kmarchais"><code>@​kmarchais</code></a> in <a href="">pyvista/pyvista#5656</a></li>
<li>Add <code>point_dtype</code> to <code>Cube</code> and <code>CubeSource</code> class by <a href="https://github.com/tkoyama010"><code>@​tkoyama010</code></a> in <a href="">pyvista/pyvista#5676</a></li>
<li>Add capsule geometry use vtkCapsuleSource and vtkCylinderSource with <code>SetCapsuleCap</code> by <a href="https://github.com/kmarchais"><code>@​kmarchais</code></a> in <a href="">pyvista/pyvista#5655</a></li>
<li>Add <code>add_box_axes</code> to avoid complexity of add_axes by <a href="https://github.com/tkoyama010"><code>@​tkoyama010</code></a> in <a href="">pyvista/pyvista#5605</a></li>
<li>Add bounds to view methods on renderer by <a href="https://github.com/MattTheCuber"><code>@​MattTheCuber</code></a> in <a href="">pyvista/pyvista#5730</a></li>
<li>Allow setting and getting string scalar field data by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#5747</a></li>
<li>Add <code>Renderer</code> <code>viewport</code> setter to control layout by <a href="https://github.com/tkoyama010"><code>@​tkoyama010</code></a> in <a href="">pyvista/pyvista#5773</a></li>
<li>Allow reading DICOM stack from directory with <code>pv.read()</code> by <a href="https://github.com/user27182"><code>@​user27182</code></a> in <a href="">pyvista/pyvista#5776</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>d91b8b7</code></a> Bump version</li>
<li><a href=""><code>0a8c19f</code></a> Make identical accessor re-registration a silent no-op (<a href="">#8681</a>)</li>
<li><a href=""><code>085691d</code></a> Bump version 0.48.3</li>
<li><a href=""><code>d55a6ef</code></a> security: refuse pickle from remote URIs in pv.read (<a href="">#8674</a>)</li>
<li><a href=""><code>989dd5b</code></a> fix(voxelize_binary_mask): consider offset and rotation center of reference_v...</li>
<li><a href=""><code>22e918e</code></a> Fix validate CLI cell color replacement sort order (<a href="">#8665</a>)</li>
<li><a href=""><code>233de57</code></a> fix: correct origin calculation in ImageData's extract_subset when rebase_coo...</li>
<li><a href=""><code>3d09cfe</code></a> Avoid RGBA-&gt;RGB stride copy in Plotter.image (<a href="">#8652</a>)</li>
<li>See full diff in <a href="https://github.com/pyvista/pyvista/compare/v0.48.2...v0.48.4">compare view</a></li>
</ul>
</details>
<br />

Updates `lefthook` from 2.1.6 to 2.1.8
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/evilmartians/lefthook/releases">lefthook's releases</a>.</em></p>
<blockquote>
<h2>v2.1.8</h2>
<h2>Changelog</h2>
<ul>
<li>488a5f99a5a496e5837f757f8ce3e6c6d1415792 fix: do not warn if local hooks path is equal to default hooks path (<a href="">#1421</a>)</li>
</ul>
<h2>v2.1.7</h2>
<h2>Changelog</h2>
<ul>
<li>f415a9d3fce1d4f6af62622cf96c72e04ecf7bd3 chore: go mod tidy</li>
<li>cf4ab9ea4580f5aeb0d4b61d4dd169533e5bb0c9 fix: always restore unstaged changes (<a href="">#1416</a>)</li>
<li>4c0e000d6fe9f35f42efefb9263b0b4cb5dfbd49 fix: apply stage_fixed only if it is safe (<a href="">#1418</a>)</li>
<li>76aa843ef5ceb6970f61cd2ff28d16dd2ec82272 fix: linter, sacrifice optimization for readability</li>
<li>9d53c36ed9a26d3bf66e341a9650a0ecac9b6a37 fix: separate fallback push branch from pathspecs (<a href="">#1396</a>)</li>
<li>22c9f773cf93b59005bd244c5b00caab2947a755 fix: try to always restore unstaged changes (<a href="">#1417</a>)</li>
<li>37d83986d8e6d6bf6792f57e22e7cbb1a9e28064 fix: use contrast colors (<a href="">#1420</a>)</li>
<li>eb1064d0b8c6248627960bea1abf6891db5a21b1 refactor: add new logger without a global state (<a href="">#1385</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/evilmartians/lefthook/blob/master/CHANGELOG.md">lefthook's changelog</a>.</em></p>
<blockquote>
<h2>2.1.8 (2026-05-19)</h2>
<ul>
<li>fix: do not warn if local hooks path is equal to default hooks path (<a href="">#1421</a>) by <a href=""><code>@​mrexox</code></a></li>
</ul>
<h2>2.1.7 (2026-05-19)</h2>
<ul>
<li>fix: use contrast colors (<a href="">#1420</a>) by <a href=""><code>@​mrexox</code></a></li>
<li>fix: apply stage_fixed only if it is safe (<a href="">#1418</a>) by <a href=""><code>@​mrexox</code></a></li>
<li>fix: try to always restore unstaged changes (<a href="">#1417</a>) by <a href=""><code>@​mrexox</code></a></li>
<li>fix: always restore unstaged changes (<a href="">#1416</a>) by <a href=""><code>@​mrexox</code></a></li>
<li>refactor: add new logger without a global state (<a href="">#1385</a>) by <a href=""><code>@​mrexox</code></a></li>
<li>fix: linter, sacrifice optimization for readability by <a href=""><code>@​mrexox</code></a></li>
<li>fix: separate fallback push branch from pathspecs (<a href="">#1396</a>) by <a href=""><code>@​lawrence3699</code></a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>9e75b21</code></a> 2.1.8: reduce warning for core.hooksPath if it matches the default</li>
<li><a href=""><code>488a5f9</code></a> fix: do not warn if local hooks path is equal to default hooks path (<a href="">#1421</a>)</li>
<li><a href=""><code>b5c8310</code></a> 2.1.7: restore unstaged changes when possible</li>
<li><a href=""><code>37d8398</code></a> fix: use contrast colors (<a href="">#1420</a>)</li>
<li><a href=""><code>4c0e000</code></a> fix: apply stage_fixed only if it is safe (<a href="">#1418</a>)</li>
<li><a href=""><code>22c9f77</code></a> fix: try to always restore unstaged changes (<a href="">#1417</a>)</li>
<li><a href=""><code>cf4ab9e</code></a> fix: always restore unstaged changes (<a href="">#1416</a>)</li>
<li><a href=""><code>f415a9d</code></a> chore: go mod tidy</li>
<li><a href=""><code>eb1064d</code></a> refactor: add new logger without a global state (<a href="">#1385</a>)</li>
<li><a href=""><code>76aa843</code></a> fix: linter, sacrifice optimization for readability</li>
<li>Additional commits viewable in <a href="https://github.com/evilmartians/lefthook/compare/v2.1.6...v2.1.8">compare view</a></li>
</ul>
</details>
<br />

Updates `ruff` from 0.15.13 to 0.15.14
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.15.14</h2>
<h2>Release Notes</h2>
<p>Released on 2026-05-21.</p>
<h3>Preview features</h3>
<ul>
<li>[<code>airflow</code>] Implement <code>airflow-task-implicit-multiple-outputs</code> (<code>AIR202</code>) (<a href="">#25152</a>)</li>
<li>[<code>flake8-use-pathlib</code>] Mark <code>PTH101</code> fix as unsafe when first argument is a class attribute annotated as <code>int</code> (<a href="">#25086</a>)</li>
<li>[<code>pylint</code>] Implement <code>too-many-try-statements</code> (<code>W0717</code>) (<a href="">#23970</a>)</li>
<li>[<code>ruff</code>] Add <code>incorrect-decorator-order</code> (<code>RUF074</code>) (<a href="">#23461</a>)</li>
<li>[<code>ruff</code>] Add <code>fallible-context-manager</code> (<code>RUF075</code>) (<a href="">#22844</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Fix lambda formatting in interpolated string expressions (<a href="">#25144</a>)</li>
<li>Treat generic <code>frozenset</code> annotations as immutable (<a href="">#25251</a>)</li>
<li>[<code>flake8-type-checking</code>] Avoid <code>strict</code> behavior when <code>future-annotations</code> are enabled (<code>TC001</code>, <code>TC002</code>, <code>TC003</code>) (<a href="">#25035</a>)</li>
<li>[<code>pylint</code>] Avoid false positives in <code>else</code> clause (<code>PLR1733</code>) (<a href="">#25177</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>flake8-comprehensions</code>] Skip <code>C417</code> for lambdas with positional-only parameters (<a href="">#25272</a>)</li>
<li>[<code>flake8-simplify</code>] Preserve f-string source verbatim in <code>SIM101</code> fix (<a href="">#25061</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Avoid unnecessary parser lookahead for operators (<a href="">#25290</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Update code example setting Neovim LSP log level (<a href="">#25284</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Add full PEP 798 support (<a href="">#25104</a>)</li>
<li>Add a parser recursion limit (<a href="">#24810</a>)</li>
<li>Update various <code>ruff_python_stdlib</code> APIs (<a href="">#25273</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/ocaballeror"><code>@​ocaballeror</code></a></li>
<li><a href="https://github.com/lerebear"><code>@​lerebear</code></a></li>
<li><a href="https://github.com/samuelcolvin"><code>@​samuelcolvin</code></a></li>
<li><a href="https://github.com/baltasarblanco"><code>@​baltasarblanco</code></a></li>
<li><a href="https://github.com/aconal-com"><code>@​aconal-com</code></a></li>
<li><a href="https://github.com/anishgirianish"><code>@​anishgirianish</code></a></li>
<li><a href="https://github.com/JelleZijlstra"><code>@​JelleZijlstra</code></a></li>
<li><a href="https://github.com/AlexWaygood"><code>@​AlexWaygood</code></a></li>
<li><a href="https://github.com/ntBre"><code>@​ntBre</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/blob/main/CHANGELOG.md">ruff's changelog</a>.</em></p>
<blockquote>
<h2>0.15.14</h2>
<p>Released on 2026-05-21.</p>
<h3>Preview features</h3>
<ul>
<li>[<code>airflow</code>] Implement <code>airflow-task-implicit-multiple-outputs</code> (<code>AIR202</code>) (<a href="">#25152</a>)</li>
<li>[<code>flake8-use-pathlib</code>] Mark <code>PTH101</code> fix as unsafe when first argument is a class attribute annotated as <code>int</code> (<a href="">#25086</a>)</li>
<li>[<code>pylint</code>] Implement <code>too-many-try-statements</code> (<code>W0717</code>) (<a href="">#23970</a>)</li>
<li>[<code>ruff</code>] Add <code>incorrect-decorator-order</code> (<code>RUF074</code>) (<a href="">#23461</a>)</li>
<li>[<code>ruff</code>] Add <code>fallible-context-manager</code> (<code>RUF075</code>) (<a href="">#22844</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Fix lambda formatting in interpolated string expressions (<a href="">#25144</a>)</li>
<li>Treat generic <code>frozenset</code> annotations as immutable (<a href="">#25251</a>)</li>
<li>[<code>flake8-type-checking</code>] Avoid <code>strict</code> behavior when <code>future-annotations</code> are enabled (<code>TC001</code>, <code>TC002</code>, <code>TC003</code>) (<a href="">#25035</a>)</li>
<li>[<code>pylint</code>] Avoid false positives in <code>else</code> clause (<code>PLR1733</code>) (<a href="">#25177</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>flake8-comprehensions</code>] Skip <code>C417</code> for lambdas with positional-only parameters (<a href="">#25272</a>)</li>
<li>[<code>flake8-simplify</code>] Preserve f-string source verbatim in <code>SIM101</code> fix (<a href="">#25061</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Avoid unnecessary parser lookahead for operators (<a href="">#25290</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Update code example setting Neovim LSP log level (<a href="">#25284</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Add full PEP 798 support (<a href="">#25104</a>)</li>
<li>Add a parser recursion limit (<a href="">#24810</a>)</li>
<li>Update various <code>ruff_python_stdlib</code> APIs (<a href="">#25273</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/ocaballeror"><code>@​ocaballeror</code></a></li>
<li><a href="https://github.com/lerebear"><code>@​lerebear</code></a></li>
<li><a href="https://github.com/samuelcolvin"><code>@​samuelcolvin</code></a></li>
<li><a href="https://github.com/baltasarblanco"><code>@​baltasarblanco</code></a></li>
<li><a href="https://github.com/aconal-com"><code>@​aconal-com</code></a></li>
<li><a href="https://github.com/anishgirianish"><code>@​anishgirianish</code></a></li>
<li><a href="https://github.com/JelleZijlstra"><code>@​JelleZijlstra</code></a></li>
<li><a href="https://github.com/AlexWaygood"><code>@​AlexWaygood</code></a></li>
<li><a href="https://github.com/ntBre"><code>@​ntBre</code></a></li>
<li><a href="https://github.com/adityasingh2400"><code>@​adityasingh2400</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>9ad2da3</code></a> Bump 0.15.14 (<a href="">#25295</a>)</li>
<li><a href=""><code>c714e84</code></a> [ty] Modernize setup of union types in mdtests (<a href="">#25291</a>)</li>
<li><a href=""><code>8a8e35e</code></a> [<code>flake8-comprehensions</code>] Skip <code>C417</code> for lambdas with positional-only parame...</li>
<li><a href=""><code>aea5ed4</code></a> Avoid unnecessary parser lookahead for operators (<a href="">#25290</a>)</li>
<li><a href=""><code>e9d72bb</code></a> [ty] Allow enum member accesses on <code>self</code> (<a href="">#25077</a>)</li>
<li><a href=""><code>6cbd59b</code></a> Set <code>exclude-newer = &quot;7 days&quot;</code> in our PEP-723 scripts (<a href="">#25285</a>)</li>
<li><a href=""><code>9999a39</code></a> Update code example on how to update Neovim LSP log level (<a href="">#25284</a>)</li>
<li><a href=""><code>67d8c54</code></a> [ty] Retain recursively-defined state in binary expressions (<a href="">#25277</a>)</li>
<li><a href=""><code>25a3191</code></a> [ty] Refine Callable class-decorator fallback for unknown results (<a href="">#25250</a>)</li>
<li><a href=""><code>c423054</code></a> Add a recursion limit to the parser (<a href="">#24810</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ruff/compare/0.15.13...0.15.14">compare view</a></li>
</ul>
</details>
<br />

Updates `tombi` from 0.11.4 to 0.11.6
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tombi-toml/tombi/releases">tombi's releases</a>.</em></p>
<blockquote>
<h2>v0.11.6</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<p>We have updated the TOML version in <code>Cargo.toml</code> to <code>v1.1.0</code> 🎉</p>
<p>Users running Rust versions prior to 1.94 should create a <code>tombi.toml</code> file and specify the version as shown below.</p>
<pre lang="toml"><code>[[schemas]]
toml-version = &quot;v1.0.0&quot;
path = &quot;tombi://www.schemastore.org/cargo.json&quot;
include = [&quot;Cargo.toml&quot;]
</code></pre>
<h3>🚨 Breaking Changes</h3>
<ul>
<li>set Cargo.toml default TOML version to v1.1.0 by <a href="https://github.com/Natural-selection1"><code>@​Natural-selection1</code></a> in <a href="">tombi-toml/tombi#1903</a></li>
</ul>
<h3>🐛 Bug Fixes</h3>
<ul>
<li>Allow annotation-only property schemas in strict mode by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1904</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>Split winget release workflow from PR <a href="">#1866</a> by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1892</a></li>
<li>ci: move winget publish after install script update by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1893</a></li>
<li>Fix hover defaults with invalid array items by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1894</a></li>
<li>Update tombi.toml to enable document-link and simplify configuration by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1898</a></li>
<li>Improve markdown formatting for strict schema diagnostics by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1897</a></li>
<li>chore: Refine error message for strict schema diagnostics to enhance clarity and consistency in instructions. by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1900</a></li>
<li>Support <code>panic = &quot;immediate-abort&quot;</code> in cargo.json by <a href="https://github.com/silvanshade"><code>@​silvanshade</code></a> in <a href="">tombi-toml/tombi#1899</a></li>
<li>Fix format --check on read-only files by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1902</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/silvanshade"><code>@​silvanshade</code></a> made their first contribution in <a href="">tombi-toml/tombi#1899</a></li>
<li><a href="https://github.com/Natural-selection1"><code>@​Natural-selection1</code></a> made their first contribution in <a href="">tombi-toml/tombi#1903</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v0.11.5...v0.11.6">https://github.com/tombi-toml/tombi/compare/v0.11.5...v0.11.6</a></p>
<h2>v0.11.5</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🐛 Bug Fixes</h3>
<ul>
<li>Fix hover panic for schema defaults containing null by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1891</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>Revert &quot;zed-v0.2.5&quot; by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1887</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v0.11.4...v0.11.5">https://github.com/tombi-toml/tombi/compare/v0.11.4...v0.11.5</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>2498f2f</code></a> Merge pull request <a href="">#1904</a> from tombi-toml/issue-1895-v1</li>
<li><a href=""><code>2a21843</code></a> Reuse shared issue-1895 schema path helper</li>
<li><a href=""><code>09acecb</code></a> Fix annotation-only keyword filtering</li>
<li><a href=""><code>525e977</code></a> Enhance keyword support by allowing None dialect to access version-gated keyw...</li>
<li><a href=""><code>0977241</code></a> Address PR <a href="">#1896</a> review feedback</li>
<li><a href=""><code>1d8d8bb</code></a> Merge remote-tracking branch 'origin/main' into issue-1895-v1</li>
<li><a href=""><code>394854a</code></a> Refactor matches_both test cases to remove unused Diagnostic creation and sim...</li>
<li><a href=""><code>b046ed4</code></a> Merge pull request <a href="">#1903</a> from Natural-selection1/toml-1.1-cargo</li>
<li><a href=""><code>8ef358c</code></a> Remove unused schema description fields</li>
<li><a href=""><code>9df9394</code></a> Refactor accessor chaining in GetHoverContent implementation for Table</li>
<li>Additional commits viewable in <a href="https://github.com/tombi-toml/tombi/compare/v0.11.4...v0.11.6">compare view</a></li>
</ul>
</details>
<br />

Updates `ty` from 0.0.35 to 0.0.38
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/releases">ty's releases</a>.</em></p>
<blockquote>
<h2>0.0.38</h2>
<h2>Release Notes</h2>
<p>Released on 2026-05-19.</p>
<h3>Bug fixes</h3>
<ul>
<li>Fix panic in enum literal during cycle recovery (<a href="">#25237</a>)</li>
<li>Fix panic from lazy <code>NewType</code> base expansion during cycle recovery (<a href="">#25234</a>)</li>
<li>Fix class-body global lookup before class binding (<a href="">#25224</a>)</li>
<li>Handle aliased dict fallbacks in TypedDict unions (<a href="">#25241</a>)</li>
<li>Ignore <code>_generate_next_value_</code> with custom construction hooks (<a href="">#25210</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Fix find references for <code>except</code> handlers (<a href="">#25231</a>)</li>
<li>Preserve delimiters when folding expressions (<a href="">#24999</a>)</li>
<li>Use incremental file walk on <code>.gitignore</code> changes (<a href="">#25183</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Add first-class support for enum complements (<a href="">#24961</a>)</li>
<li>Allow known non-field writes on frozen dataclass subclasses (<a href="">#25087</a>)</li>
<li>Ignore generic specialization in layout compatibility checks (<a href="">#25178</a>)</li>
<li>Preserve short-circuit bindings in all condition consumers (<a href="">#25160</a>)</li>
<li>Support class decorators (<a href="">#25091</a>)</li>
<li>Support custom <code>_generate_next_value_</code> methods in enums (<a href="">#25196</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/MatthewMckee4"><code>@​MatthewMckee4</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/lerebear"><code>@​lerebear</code></a></li>
<li><a href="https://github.com/thejchap"><code>@​thejchap</code></a></li>
</ul>
<h2>Install ty 0.0.38</h2>
<h3>Install prebuilt binaries via shell script</h3>
<pre lang="sh"><code>curl --proto '=https' --tlsv1.2 -LsSf https://releases.astral.sh/github/ty/releases/download/0.0.38/ty-installer.sh | sh
</code></pre>
<h3>Install prebuilt binaries via powershell script</h3>
<pre lang="sh"><code>powershell -ExecutionPolicy Bypass -c &quot;irm https://releases.astral.sh/github/ty/releases/download/0.0.38/ty-installer.ps1 | iex&quot;
</code></pre>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/blob/main/CHANGELOG.md">ty's changelog</a>.</em></p>
<blockquote>
<h2>0.0.38</h2>
<p>Released on 2026-05-19.</p>
<h3>Bug fixes</h3>
<ul>
<li>Fix panic in enum literal during cycle recovery (<a href="">#25237</a>)</li>
<li>Fix panic from lazy <code>NewType</code> base expansion during cycle recovery (<a href="">#25234</a>)</li>
<li>Fix class-body global lookup before class binding (<a href="">#25224</a>)</li>
<li>Handle aliased dict fallbacks in TypedDict unions (<a href="">#25241</a>)</li>
<li>Ignore <code>_generate_next_value_</code> with custom construction hooks (<a href="">#25210</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Fix find references for <code>except</code> handlers (<a href="">#25231</a>)</li>
<li>Preserve delimiters when folding expressions (<a href="">#24999</a>)</li>
<li>Use incremental file walk on <code>.gitignore</code> changes (<a href="">#25183</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Add first-class support for enum complements (<a href="">#24961</a>)</li>
<li>Allow known non-field writes on frozen dataclass subclasses (<a href="">#25087</a>)</li>
<li>Ignore generic specialization in layout compatibility checks (<a href="">#25178</a>)</li>
<li>Preserve short-circuit bindings in all condition consumers (<a href="">#25160</a>)</li>
<li>Support class decorators (<a href="">#25091</a>)</li>
<li>Support custom <code>_generate_next_value_</code> methods in enums (<a href="">#25196</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/MatthewMckee4"><code>@​MatthewMckee4</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/lerebear"><code>@​lerebear</code></a></li>
<li><a href="https://github.com/thejchap"><code>@​thejchap</code></a></li>
</ul>
<h2>0.0.37</h2>
<p>Released on 2026-05-16.</p>
<h3>Bug fixes</h3>
<ul>
<li>Avoid unsound <code>not in</code> narrowing (<a href="">#25161</a>)</li>
<li>Fix async iteration over narrowed typevars (<a href="">#25155</a>)</li>
<li>Fix panic in double-inference for single starred positional TypedDict (<a href="">#25176</a>)</li>
<li>Fix panic in disjoint base check (<a href="">#25187</a>)</li>
<li>Fix panic in recursive binary inference (<a href="">#25189</a>)</li>
<li>Fix panic in cyclic <code>__new__</code> (<a href="">#25185</a>)</li>
<li>Fix panic in <code>reveal_protocol</code>, <code>reveal_mro</code>, etc. with keyword arguments (<a href="">#25179</a>)</li>
<li>Fix panic in imported overload definition (<a href="">#25168</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>1d3efc1</code></a> Bump version to 0.0.38 (<a href="">#3492</a>)</li>
<li><a href=""><code>f5100cc</code></a> scripts/update_schemastore: use -C to allow re-running schema update on exist...</li>
<li><a href=""><code>f18aed6</code></a> Bump version to 0.0.37 (<a href="">#3473</a>)</li>
<li><a href=""><code>a63e559</code></a> Bump version to 0.0.36 (<a href="">#3463</a>)</li>
<li><a href=""><code>94370d5</code></a> Update prek dependencies (<a href="">#3449</a>)</li>
<li>See full diff in <a href="https://github.com/astral-sh/ty/compare/0.0.35...0.0.38">compare view</a></li>
</ul>
</details>
<br />

Updates `black` from 26.3.1 to 26.5.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/psf/black/releases">black's releases</a>.</em></p>
<blockquote>
<h2>26.5.1</h2>
<h3>Stable style</h3>
<ul>
<li>Fix unstable formatting of annotated assignments whose subscript annotation contains
an inline comment (e.g. <code>x: list[  # pyright: ignore[...]</code>) (<a href="">#5130</a>)</li>
<li>Preserve inline comments (including <code># type: ignore</code>) immediately before a
<code># fmt: skip</code> line, avoiding AST equivalence failures (<a href="">#5139</a>)</li>
</ul>
<h3>Packaging</h3>
<ul>
<li>Correct the version in the published executables (<a href="">#5137</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Add Neovim integration guide covering conform.nvim, ALE, and simple command approaches
(<a href="">#5124</a>)</li>
</ul>
<h2>26.5.0</h2>
<h3>Highlights</h3>
<ul>
<li>Add support for unpacking in comprehensions (PEP 798) and for lazy imports (PEP 810),
both new syntactic features in Python 3.15 (<a href="">#5048</a>)</li>
<li>Python 3.15 is now supported. Compiled wheels are not yet provided for Python 3.15, so
performance may be slower than on existing Python versions. Wheels will be provided
once Python 3.15 is later in its release cycle. (<a href="">#5127</a>)</li>
</ul>
<h3>Stable style</h3>
<ul>
<li>Fix <code># fmt: skip</code> being ignored in nested <code>if</code> expressions with parenthesized <code>in</code>
clauses (<a href="">#4903</a>)</li>
<li>Add syntactic support for Python 3.15 (<a href="">#5048</a>)</li>
<li>Fix crash when an f-string follows a <code># fmt: off</code> comment inside brackets (<a href="">#5097</a>)</li>
<li>Preserve multiline compound statement headers when <code># fmt: skip</code> is placed on the
colon line (<a href="">#5117</a>)</li>
</ul>
<h3>Preview style</h3>
<ul>
<li>Improve heuristics around whether blank lines should appear before, within and after
groups of same-name decorated functions (such as <code>@overload</code> groups) in <code>.pyi</code> stub
files (<a href="">#5021</a>)</li>
<li>Fix blank lines being removed between a function and a decorated class in <code>.pyi</code> stub
files (<a href="">#5092</a>)</li>
<li>Prevent string merger from creating unsplittable long lines when a pragma comment
(e.g. <code># type: ignore</code>) follows the closing bracket (<a href="">#5096</a>)</li>
</ul>
<h3>Packaging</h3>
<ul>
<li>Run CI on 3.15 (<a href="">#5127</a>)</li>
</ul>
<h3>Output</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/psf/black/blob/main/CHANGES.md">black's changelog</a>.</em></p>
<blockquote>
<h2>Version 26.5.1</h2>
<h3>Stable style</h3>
<ul>
<li>Fix unstable formatting of annotated assignments whose subscript annotation contains
an inline comment (e.g. <code>x: list[  # pyright: ignore[...]</code>) (<a href="">#5130</a>)</li>
<li>Preserve inline comments (including <code># type: ignore</code>) immediately before a
<code># fmt: skip</code> line, avoiding AST equivalence failures (<a href="">#5139</a>)</li>
</ul>
<h3>Packaging</h3>
<ul>
<li>Correct the version in the published executables (<a href="">#5137</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Add Neovim integration guide covering conform.nvim, ALE, and simple command approaches
(<a href="">#5124</a>)</li>
</ul>
<h2>Version 26.5.0</h2>
<h3>Highlights</h3>
<ul>
<li>Add support for unpacking in comprehensions (PEP 798) and for lazy imports (PEP 810),
both new syntactic features in Python 3.15 (<a href="">#5048</a>)</li>
<li>Python 3.15 is now supported. Compiled wheels are not yet provided for Python 3.15, so
performance may be slower than on existing Python versions. Wheels will be provided
once Python 3.15 is later in its release cycle. (<a href="">#5127</a>)</li>
</ul>
<h3>Stable style</h3>
<ul>
<li>Fix <code># fmt: skip</code> being ignored in nested <code>if</code> expressions with parenthesized <code>in</code>
clauses (<a href="">#4903</a>)</li>
<li>Add syntactic support for Python 3.15 (<a href="">#5048</a>)</li>
<li>Fix crash when an f-string follows a <code># fmt: off</code> comment inside brackets (<a href="">#5097</a>)</li>
<li>Preserve multiline compound statement headers when <code># fmt: skip</code> is placed on the
colon line (<a href="">#5117</a>)</li>
</ul>
<h3>Preview style</h3>
<ul>
<li>Improve heuristics around whether blank lines should appear before, within and after
groups of same-name decorated functions (such as <code>@overload</code> groups) in <code>.pyi</code> stub
files (<a href="">#5021</a>)</li>
<li>Fix blank lines being removed between a function and a decorated class in <code>.pyi</code> stub
files (<a href="">#5092</a>)</li>
<li>Prevent string merger from creating unsplittable long lines when a pragma comment
(e.g. <code># type: ignore</code>) follows the closing bracket (<a href="">#5096</a>)</li>
</ul>
<h3>Packaging</h3>
<ul>
<li>Run CI on 3.15 (<a href="">#5127</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>87928e6</code></a> Prepare release 26.5.1 (<a href="">#5140</a>)</li>
<li><a href=""><code>c970a49</code></a> Preserve comments before fmt: skip lines (<a href="">#5139</a>)</li>
<li><a href=""><code>5809338</code></a> Preserve inline comments inside annotation subscripts (<a href="">#5130</a>)</li>
<li><a href=""><code>61361b7</code></a> docs: add Neovim integration guide and fix http link (<a href="">#5124</a>)</li>
<li><a href=""><code>ebe6018</code></a> CI Hotfixes (<a href="">#5136</a>)</li>
<li><a href=""><code>9cbd95f</code></a> Fix publish binaries again on Windows (<a href="">#5134</a>)</li>
<li><a href=""><code>3dc8e6c</code></a> Add new changelog (<a href="">#5132</a>)</li>
<li><a href=""><code>6d0fff0</code></a> Fix publish binaries workflow (<a href="">#5133</a>)</li>
<li><a href=""><code>d2490e2</code></a> Prepare release 26.5.0 (<a href="">#5131</a>)</li>
<li><a href=""><code>2b13ea7</code></a> Preserve multiline headers with fmt skip (<a href="">#5117</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/psf/black/compare/26.3.1...26.5.1">compare view</a></li>
</ul>
</details>
<br />

Updates `mkdocs-include-markdown-plugin` from 7.2.2 to 7.3.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/mondeja/mkdocs-include-markdown-plugin/releases">mkdocs-include-markdown-plugin's releases</a>.</em></p>
<blockquote>
<h2>v7.3.0</h2>
<h3>New features</h3>
<ul>
<li>Add new setting <code>include_from_url</code></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>0604be2</code></a> Add new setting <code>include_from_url</code>(<a href="">#299</a>)</li>
<li><a href=""><code>f0809f9</code></a> Document order setting (<a href="">#298</a>)</li>
<li>See full diff in <a href="https://github.com/mondeja/mkdocs-include-markdown-plugin/compare/v7.2.2...v7.3.0">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b5c8b98b1d12`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.