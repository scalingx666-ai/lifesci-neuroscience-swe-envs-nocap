# Issue

**Title:** Bump the python group with 3 updates

## Description

Bumps the python group with 3 updates: [plotly](https://github.com/plotly/plotly.py), [pybids](https://github.com/bids-standard/pybids) and [tabulate](https://github.com/astanin/python-tabulate).

Updates `plotly` from 6.5.2 to 6.6.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/plotly/plotly.py/releases">plotly's releases</a>.</em></p>
<blockquote>
<h2>v6.6.0</h2>
<h3>Fixed</h3>
<ul>
<li>Remove unneeded <code>type=&quot;text/javascript&quot;</code> attribute from <code>&lt;style&gt;</code> tag [<a href="">#5454</a>], with thanks to <a href="https://github.com/hannob"><code>@​hannob</code></a> for the contribution!</li>
<li>Remove global warning format side effect [<a href="">#5481</a>], with thanks to <a href="https://github.com/emmanuel-ferdman"><code>@​emmanuel-ferdman</code></a> for the contribution!</li>
<li>Fix spurious engine deprecation warning in write_image [<a href="">#5517</a>], with thanks to <a href="https://github.com/mosh3eb"><code>@​mosh3eb</code></a> for the contribution!</li>
</ul>
<h3>Updated</h3>
<ul>
<li>Update plotly.js from version 3.3.1 to version 3.4.0. See the plotly.js <a href="https://github.com/plotly/plotly.js/releases/tag/v3.4.0">release notes</a> for more information. [<a href="">#5527</a>]. Notable changes include:
<ul>
<li>Add support for clicking legend titles to toggle visibility of all traces in legend [<a href="">#7698</a>]</li>
<li>Add support for shapes to reference multiple axes [<a href="">#7666</a>]</li>
<li>Add support for dashed marker lines in scatter plots [<a href="">#7673</a>]</li>
<li>Increase axis autorange when bar charts have outside text labels, to avoid labels being clipped [<a href="">#7675</a>]</li>
</ul>
</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/plotly/plotly.py/compare/v6.5.2...v6.6.0">https://github.com/plotly/plotly.py/compare/v6.5.2...v6.6.0</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/plotly/plotly.py/blob/main/CHANGELOG.md">plotly's changelog</a>.</em></p>
<blockquote>
<h2>[6.6.0] - 2026-03-02</h2>
<h3>Fixed</h3>
<ul>
<li>Remove unneeded <code>type=&quot;text/javascript&quot;</code> attribute from <code>&lt;style&gt;</code> tag [<a href="">#5454</a>], with thanks to <a href="https://github.com/hannob"><code>@​hannob</code></a> for the contribution!</li>
<li>Remove global warning format side effect [<a href="">#5481</a>], with thanks to <a href="https://github.com/emmanuel-ferdman"><code>@​emmanuel-ferdman</code></a> for the contribution!</li>
<li>Fix spurious engine deprecation warning in write_image [<a href="">#5517</a>], with thanks to <a href="https://github.com/mosh3eb"><code>@​mosh3eb</code></a> for the contribution!</li>
</ul>
<h3>Updated</h3>
<ul>
<li>Update plotly.js from version 3.3.1 to version 3.4.0. See the plotly.js <a href="https://github.com/plotly/plotly.js/releases/tag/v3.4.0">release notes</a> for more information. [<a href="">#5527</a>]. Notable changes include:
<ul>
<li>Add support for clicking legend titles to toggle visibility of all traces in legend [<a href="">#7698</a>]</li>
<li>Add support for shapes to reference multiple axes [<a href="">#7666</a>]</li>
<li>Add support for dashed marker lines in scatter plots [<a href="">#7673</a>]</li>
<li>Increase axis autorange when bar charts have outside text labels, to avoid labels being clipped [<a href="">#7675</a>]</li>
</ul>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>837d27e</code></a> changes for v6.6.0</li>
<li><a href=""><code>e0278b3</code></a> update changelog</li>
<li><a href=""><code>bb783da</code></a> Merge pull request <a href="">#5516</a> from plotly/new-charts</li>
<li><a href=""><code>5aabff0</code></a> Merge branch 'main' into new-charts</li>
<li><a href=""><code>03fd2ed</code></a> Merge pull request <a href="">#5527</a> from plotly/update-plotlyjs-3.4.0</li>
<li><a href=""><code>aee4c33</code></a> update changelog</li>
<li><a href=""><code>46a8aa2</code></a> update js artifacts</li>
<li><a href=""><code>7dc360c</code></a> update package-lock</li>
<li><a href=""><code>cf1b9ae</code></a> upgrade plotly.js to v3.4.0</li>
<li><a href=""><code>a4832a8</code></a> Merge branch 'main' into new-charts</li>
<li>Additional commits viewable in <a href="https://github.com/plotly/plotly.py/compare/v6.5.2...v6.6.0">compare view</a></li>
</ul>
</details>
<br />

Updates `pybids` from 0.21.0 to 0.22.0
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/bids-standard/pybids/blob/main/CHANGELOG.rst">pybids's changelog</a>.</em></p>
<blockquote>
<h2>Version 0.22.0 (March 11, 2026)</h2>
<p>New feature release in the 0.22.x series.</p>
<p>This release introduces schema-based layout configurations::</p>
<pre><code>from bids.layout import BIDSLayout
<p>layout = BIDSLayout('/path/to/dataset', config='bids-schema')
</code></pre></p>
<p>This will use the version of the schema included in
the installed version of bidsschematools_.
The schema configuration will be the way to incorporate updates from
new versions of BIDS (v1.11+), and will eventually be made the default
configuration.
Please try it out and report any issues you encounter
to help us make the transition as smooth as possible.
We are particularly interested in reports from
users who supply custom configurations.</p>
<p>The following dependencies have been updated to new minimum versions:</p>
<ul>
<li>
<p>NumPy 1.25</p>
</li>
<li>
<p>SciPy 1.11</p>
</li>
<li>
<p>NiBabel 5.1</p>
</li>
<li>
<p>ENH: Sort BIDS file name entities (<a href="">#1220</a>)</p>
</li>
<li>
<p>ENH: Use BIDS schema to &quot;drive&quot; pybids <a href="">#818</a> (<a href="">#1163</a>)</p>
</li>
<li>
<p>DOC: Fix documentation deployment (<a href="">#1224</a>)</p>
</li>
<li>
<p>MNT: Add Python 3.14 tests (<a href="">#1175</a>)</p>
</li>
<li>
<p>MNT: Skip pre-release checks on unlabeled PRs (<a href="">#1188</a>)</p>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>321f8fe</code></a> doc: Update changelog</li>
<li><a href=""><code>afe3c40</code></a> [DATALAD RUNCMD] uv lock</li>
<li><a href=""><code>6238a4d</code></a> git log --grep &quot;[ignore-rev]&quot; --pretty=format:&quot;# %ai - %ae - %s%n%H&quot; &gt; .git...</li>
<li><a href=""><code>f894748</code></a> chore(deps): speczeroplus</li>
<li><a href=""><code>67909eb</code></a> chore: Update zenodo.json</li>
<li><a href=""><code>c92a526</code></a> sty: Clean up trailing whitespace [ignore-rev]</li>
<li><a href=""><code>982eac5</code></a> chore: Change master to main</li>
<li><a href=""><code>a29d5dd</code></a> chore: Update versioneer</li>
<li><a href=""><code>c5b4d6d</code></a> Build(deps): Bump the uv group with 3 updates (<a href="">#1225</a>)</li>
<li><a href=""><code>774585e</code></a> Build(deps): Bump bids-examples from <code>dd54571</code> to <code>a946006</code> (<a href="">#1217</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/bids-standard/pybids/compare/0.21.0...0.22.0">compare view</a></li>
</ul>
</details>
<br />

Updates `tabulate` from 0.9.0 to 0.10.0
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astanin/python-tabulate/blob/master/CHANGELOG">tabulate's changelog</a>.</em></p>
<blockquote>
<ul>
<li>0.10.0: Add support for Python 3.11, 3.12, 3.13, 3.14.
Drop support for Python 3.7, 3.8, 3.9.
PRESERVE_STERILITY global is replaced with preserve_sterility function argument.
New formatting options: headersglobalalign, headersalign, colglobalalign.
New output format: <code>colon_grid</code> (Pandoc grid_tables with alignment)
Various bug fixes.
Improved error messages.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>3b4cd50</code></a> update HOWTOPUBLISH</li>
<li><a href=""><code>35ee0f6</code></a> update mini-benchmark table</li>
<li><a href=""><code>37ac76e</code></a> restore tabulate.<strong>version</strong></li>
<li><a href=""><code>37e1ed0</code></a> move # nowa: E931 to a different line (flake8)</li>
<li><a href=""><code>7bacc90</code></a> run pre-commit hooks (black)</li>
<li><a href=""><code>1b69704</code></a> Remove spurious cast in string interpolation</li>
<li><a href=""><code>4d535af</code></a> Use specific noqa directives</li>
<li><a href=""><code>76c3d37</code></a> Remove spurious space from error message</li>
<li><a href=""><code>13508e7</code></a> Unnecessary <code>list</code> call</li>
<li><a href=""><code>69f67cd</code></a> Do not call <code>getattr</code> with a constant value</li>
<li>Additional commits viewable in <a href="https://github.com/astanin/python-tabulate/compare/v0.9.0...v0.10.0">compare view</a></li>
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

<!-- readthedocs-preview bids-website start -->
----
📚 Documentation preview 📚: https://bids-website--813.org.readthedocs.build/en/813/

<!-- readthedocs-preview bids-website end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `03d6761f4cef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.