# Issue

**Title:** Bump the python group with 9 updates

## Description

Bumps the python group with 9 updates:

| Package | From | To |
| --- | --- | --- |
| [certifi](https://github.com/certifi/python-certifi) | `2025.8.3` | `2025.11.12` |
| [mkdocs-macros-plugin](https://github.com/fralau/mkdocs_macros_plugin) | `1.3.9` | `1.5.0` |
| [mkdocs-rss-plugin](https://github.com/guts/mkdocs-rss-plugin) | `1.17.3` | `1.17.7` |
| [plotly](https://github.com/plotly/plotly.py) | `6.3.0` | `6.5.0` |
| [pybids](https://github.com/bids-standard/pybids) | `0.19.0` | `0.21.0` |
| [pyzotero](https://github.com/urschrei/pyzotero) | `1.6.11` | `1.7.6` |
| [rich](https://github.com/Textualize/rich) | `14.1.0` | `14.2.0` |
| ruamel-yaml | `0.18.15` | `0.19.0` |
| [urllib3](https://github.com/urllib3/urllib3) | `2.5.0` | `2.6.2` |

Updates `certifi` from 2025.8.3 to 2025.11.12
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>37ea150</code></a> 2025.11.12 (<a href="">#375</a>)</li>
<li><a href=""><code>2fa50bb</code></a> Bump actions/upload-artifact from 4.6.2 to 5.0.0 (<a href="">#374</a>)</li>
<li><a href=""><code>6cadb53</code></a> Bump actions/download-artifact from 5.0.0 to 6.0.0 (<a href="">#373</a>)</li>
<li><a href=""><code>fb14ac4</code></a> 2025.10.05 (<a href="">#371</a>)</li>
<li><a href=""><code>2c7c7ee</code></a> Add Python 3.14 classifier in setup.py</li>
<li><a href=""><code>1a5cb7b</code></a> Bump actions/setup-python from 5.6.0 to 6.0.0 (<a href="">#367</a>)</li>
<li><a href=""><code>dea5960</code></a> Bump pypa/gh-action-pypi-publish from 1.12.4 to 1.13.0 (<a href="">#366</a>)</li>
<li><a href=""><code>83566b7</code></a> Bump actions/checkout from 4.2.2 to 5.0.0</li>
<li><a href=""><code>ca2e121</code></a> Bump actions/download-artifact from 4.3.0 to 5.0.0</li>
<li>See full diff in <a href="https://github.com/certifi/python-certifi/compare/2025.08.03...2025.11.12">compare view</a></li>
</ul>
</details>
<br />

Updates `mkdocs-macros-plugin` from 1.3.9 to 1.5.0
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/fralau/mkdocs-macros-plugin/blob/master/CHANGELOG.md">mkdocs-macros-plugin's changelog</a>.</em></p>
<blockquote>
<h2>1.5.0, 2025-11-13</h2>
<ul>
<li>Added: For each push, testing on github for versions Python 3.8 to 3.12</li>
<li>Fixed: bug in import of packages when not in source dir (<a href="">#278</a>)</li>
</ul>
<h2>1.4.1, 2025-10-18</h2>
<ul>
<li>Added: support for j2_extensions paramater in config file (<a href="">#272</a>)</li>
<li>Fixed: missing dependency declaration on <code>requests</code> (<a href="">#269</a>)</li>
</ul>
<h2>1.4.0, 2025-09-21</h2>
<ul>
<li>Removed: auto-install of missing pluglet (meaningful error message <a href="">#262</a>)</li>
<li>Fixed: error with yaml dumps (<a href="">#258</a>)</li>
<li>Fixed: detection of Jinja2, to allow title rendering (<a href="">#266</a>)</li>
<li>Small improvements to documentation</li>
</ul>
<h2>1.3.7, 2024-10-18</h2>
<ul>
<li>Fixed: incompatibility with the d2 module (<a href="">#249</a>)</li>
</ul>
<h2>1.3.6, 2024-10-17</h2>
<ul>
<li>Added: complete test framework, using pytest and Mkdocs-Test (<a href="">#244</a>)
A number of automated test cases are implemented.</li>
<li>Changed: move from setup.py to pyproject.toml (<a href="">#250</a>)</li>
</ul>
<h2>1.2.0, 2024-09-15</h2>
<ul>
<li>Added: three hooks <code>register_variables/macros/filters</code> to facilitate
cooperation with other MkDocs plugins.</li>
<li>Fixed: `define_env() was always required in module (<a href="">#191</a>)</li>
<li>Added: trace the case when no module is found (INFO)</li>
<li>Improved documentation, particularly about HTML pages</li>
<li>Added: parameters <code>j2_comment_start_string</code> and
<code>j2_comment_end_string</code> to plugin's parameters,
to specify alternate markers for comments.</li>
<li>Added the multiline parameter <code>force_render_paths</code> in the config file,
to specify directories or file patterns to be rendered for the case when <code>render_by_default = false</code>
(the <code>render_macros</code> parameter in the YAML header of the page
has the last word).</li>
</ul>
<h2>1.0.5, 2023-10-31</h2>
<ul>
<li>Added: git.short_tag (<a href="">#183</a>)</li>
<li>Added: Mermaid diagrams in the documentation (Readthedocs)</li>
<li>Fixed: Changelog was no longer displayed (<a href="">#186</a>)</li>
</ul>
<h2>1.0.4, 2023-08-07</h2>
<ul>
<li>Fixed: Warning due to filter issue with mkdocs &gt;= 1.5</li>
<li>Fixed: Debug html tables (including for <code>macro_info()</code>) are
now readable also in dark mode.</li>
</ul>
<h2>1.0.2, 2023-07-02</h2>
<ul>
<li>Added: it is now possible to use macros in page titles, in the</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>0536f4d</code></a> Fix type hint for compatibility</li>
<li><a href=""><code>d9a6bc3</code></a> Require mkdocs-test&gt;=0.6.0 (compatibility with Python 3.8 and 3.9)</li>
<li><a href=""><code>bcaa72d</code></a> Make last minute corrections</li>
<li><a href=""><code>356fc2a</code></a> Prepare for release</li>
<li><a href=""><code>aaf16bd</code></a> Limit testing to 3.10 up (<a href="">#279</a>)</li>
<li><a href=""><code>ba5356c</code></a> Use proper exit for pytest if Python &lt; 3.10 (<a href="">#279</a>)</li>
<li><a href=""><code>6c79660</code></a> Skip test_modules.py if Python version &lt; 3.10 (<a href="">#279</a>)</li>
<li><a href=""><code>cec7440</code></a> Test installation of d2 in a cross-platform way (<a href="">#279</a>)</li>
<li><a href=""><code>492759c</code></a> Update with changes from local repo (<a href="">#278</a>)</li>
<li><a href=""><code>cc54168</code></a> Merge branch 'master' of github.com:fralau/mkdocs_macros_plugin</li>
<li>Additional commits viewable in <a href="https://github.com/fralau/mkdocs_macros_plugin/compare/v1.3.9...v1.5.0">compare view</a></li>
</ul>
</details>
<br />

Updates `mkdocs-rss-plugin` from 1.17.3 to 1.17.7
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/guts/mkdocs-rss-plugin/releases">mkdocs-rss-plugin's releases</a>.</em></p>
<blockquote>
<h2>1.17.7</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>Bugs fixes 🐛</h3>
<ul>
<li>fix(integration): imports from Material for Mkdocs blog plugin for type hint was breaking the build when using another theme by <a href="https://github.com/Guts"><code>@​Guts</code></a> in <a href="">Guts/mkdocs-rss-plugin#409</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/Guts/mkdocs-rss-plugin/compare/1.17.6...1.17.7">https://github.com/Guts/mkdocs-rss-plugin/compare/1.17.6...1.17.7</a></p>
<h2>1.17.6</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>Bugs fixes 🐛</h3>
<ul>
<li>update(chore): bump minimal version of Material for Mkdocs and fix related bugs by <a href="https://github.com/Guts"><code>@​Guts</code></a> in <a href="">Guts/mkdocs-rss-plugin#405</a></li>
<li>improve(integrations): refine some  logs about Material integrations by <a href="https://github.com/Guts"><code>@​Guts</code></a> in <a href="">Guts/mkdocs-rss-plugin#406</a></li>
</ul>
<h3>Known issues</h3>
<p>There is a problem with Material Social Cards generated for Material Blog Post.</p>
<p><strong>Full Changelog</strong>: <a href="https://github.com/Guts/mkdocs-rss-plugin/compare/1.17.5...1.17.6">https://github.com/Guts/mkdocs-rss-plugin/compare/1.17.5...1.17.6</a></p>
<h2>1.17.5</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>Bugs fixes 🐛</h3>
<ul>
<li>fix(packaging): rollback support for Python 3.14 by <a href="https://github.com/Guts"><code>@​Guts</code></a> in <a href="">Guts/mkdocs-rss-plugin#402</a></li>
<li>fix(xml): escape special chars from site_author (<!-- raw HTML omitted -->) by <a href="https://github.com/Guts"><code>@​Guts</code></a> in <a href="">Guts/mkdocs-rss-plugin#401</a></li>
</ul>
<h3>Features and enhancements 🎉</h3>
<ul>
<li>improve(performances): run RSS item image fetching only on filtered pages list by <a href="https://github.com/Guts"><code>@​Guts</code></a> in <a href="">Guts/mkdocs-rss-plugin#394</a></li>
</ul>
<h3>Tooling 🔧</h3>
<ul>
<li>Packaging: switch to pyproject by <a href="https://github.com/Guts"><code>@​Guts</code></a> in <a href="">Guts/mkdocs-rss-plugin#399</a></li>
<li>update(security): set GH token permissions scopes in CI workflows by <a href="https://github.com/Guts"><code>@​Guts</code></a> in <a href="">Guts/mkdocs-rss-plugin#400</a></li>
</ul>
<h3>Other Changes</h3>
<ul>
<li>Packaging/remove-python-3_9-add-3_14 by <a href="https://github.com/Guts"><code>@​Guts</code></a> in <a href="">Guts/mkdocs-rss-plugin#397</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/Guts/mkdocs-rss-plugin/compare/1.17.4...1.17.5">https://github.com/Guts/mkdocs-rss-plugin/compare/1.17.4...1.17.5</a></p>
<h2>1.17.4</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>Bugs fixes 🐛</h3>
<ul>
<li>fix: preserve sentence structure across newlines by <a href="https://github.com/miketheman"><code>@​miketheman</code></a> in <a href="">Guts/mkdocs-rss-plugin#378</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/Guts/mkdocs-rss-plugin/blob/main/CHANGELOG.md">mkdocs-rss-plugin's changelog</a>.</em></p>
<blockquote>
<h2>1.17.7 - 2025-11-14</h2>
<h3>Bugs fixes 🐛</h3>
<ul>
<li>fix(integration): imports from Material for Mkdocs blog plugin for type hint was breaking the build when using another theme by <a href="https://github.com/Guts"><code>@​Guts</code></a> in <a href="">Guts/mkdocs-rss-plugin#409</a></li>
</ul>
<h2>1.17.6 - 2025-11-13</h2>
<h3>Bugs fixes 🐛</h3>
<ul>
<li>update(chore): bump minimal version of Material for Mkdocs since 9.7.x and fix related bugs by <a href="https://github.com/Guts"><code>@​Guts</code></a> in <a href="">Guts/mkdocs-rss-plugin#405</a></li>
<li>improve(integrations): refine some  logs about Material integrations by <a href="https://github.com/Guts"><code>@​Guts</code></a> in <a href="">Guts/mkdocs-rss-plugin#406</a></li>
</ul>
<h2>1.17.5 - 2025-11-07</h2>
<h3>Bugs fixes 🐛</h3>
<ul>
<li>fix(xml): escape special chars from site_author (<code>&lt;managingEditor&gt;</code>) by <a href="https://github.com/Guts"><code>@​Guts</code></a> in <a href="">Guts/mkdocs-rss-plugin#401</a></li>
</ul>
<h3>Features and enhancements 🎉</h3>
<ul>
<li>improve(performances): run RSS item image fetching only on filtered pages list by <a href="https://github.com/Guts"><code>@​Guts</code></a> in <a href="">Guts/mkdocs-rss-plugin#394</a></li>
</ul>
<h3>Tooling 🔧</h3>
<ul>
<li>Packaging: switch to pyproject by <a href="https://github.com/Guts"><code>@​Guts</code></a> in <a href="">Guts/mkdocs-rss-plugin#399</a></li>
<li>update(security): set GH token permissions scopes in CI workflows by <a href="https://github.com/Guts"><code>@​Guts</code></a> in <a href="">Guts/mkdocs-rss-plugin#400</a></li>
</ul>
<h3>Other Changes</h3>
<ul>
<li>Packaging/remove-python-3_9-add-3_14 by <a href="https://github.com/Guts"><code>@​Guts</code></a> in <a href="">Guts/mkdocs-rss-plugin#397</a></li>
<li>fix(packaging): rollback support for Python 3.14 by <a href="https://github.com/Guts"><code>@​Guts</code></a> in <a href="">Guts/mkdocs-rss-plugin#402</a></li>
</ul>
<h2>1.17.4 - 2025-10-10</h2>
<h3>Bugs fixes 🐛</h3>
<ul>
<li>fix(logs): update references hyperlinks for git depth logs by <a href="https://github.com/Guts"><code>@​Guts</code></a> in <a href="">Guts/mkdocs-rss-plugin#384</a></li>
<li>fix(material): mkdocs_config.plugins.get(&quot;material/blog&quot;) can be None by <a href="https://github.com/Guts"><code>@​Guts</code></a> in <a href="">Guts/mkdocs-rss-plugin#392</a></li>
<li>fix: preserve sentence structure across newlines by <a href="https://github.com/miketheman"><code>@​miketheman</code></a> in <a href="">Guts/mkdocs-rss-plugin#378</a></li>
</ul>
<h3>Features and enhancements 🎉</h3>
<ul>
<li>improve(images): add timeout to remote images requests by <a href="https://github.com/Guts"><code>@​Guts</code></a> in <a href="">Guts/mkdocs-rss-plugin#391</a></li>
</ul>
<h3>New Contributors</h3>
<ul>
<li><a href="https://github.com/miketheman"><code>@​miketheman</code></a> made their first contribution in <a href="">Guts/mkdocs-rss-plugin#378</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>1dcb66f</code></a> release: bump version to 1.17.7</li>
<li><a href=""><code>94187b7</code></a> fix(integration): imports from Material for Mkdocs blog plugin for type hint ...</li>
<li><a href=""><code>dcdeaf3</code></a> fix(integration): imports from Material for Mkdocs blog plugin for type hint ...</li>
<li><a href=""><code>35f61f1</code></a> update(quality): test build without Material for Mkdocs, patching sys modules</li>
<li><a href=""><code>ad842c0</code></a> release: bump version to 1.17.6</li>
<li><a href=""><code>301793c</code></a> improve(integrations): refine some  logs about Material integrations (<a href="">#406</a>)</li>
<li><a href=""><code>cf19489</code></a> improve(integrations): add some debug logs</li>
<li><a href=""><code>712e21b</code></a> update(tests): pretty print blog related fixture</li>
<li><a href=""><code>04aa5d0</code></a> fix(integrations): decrease log level</li>
<li><a href=""><code>535702c</code></a> update(chore): bump minimal version of Material for Mkdocs since 9.7.x is the...</li>
<li>Additional commits viewable in <a href="https://github.com/guts/mkdocs-rss-plugin/compare/1.17.3...1.17.7">compare view</a></li>
</ul>
</details>
<br />

Updates `plotly` from 6.3.0 to 6.5.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/plotly/plotly.py/releases">plotly's releases</a>.</em></p>
<blockquote>
<h2>v6.5.0</h2>
<h3>Updated</h3>
<ul>
<li>Update plotly.js from version 3.2.0 to version 3.3.0. See the plotly.js <a href="https://github.com/plotly/plotly.js/releases/tag/v3.3.0">release notes</a> for more information. [<a href="">#5421</a>]. Notable changes include:
<ul>
<li>Add <code>hovertemplate</code> for <code>candlestick</code> and <code>ohlc</code> traces [<a href="">#7619</a>]</li>
</ul>
</li>
</ul>
<h3>Fixed</h3>
<ul>
<li>Fix bug where numpy datetime contained in Python list was converted to integer [<a href="">#5415</a>]</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/plotly/plotly.py/compare/v6.4.0...v6.5.0">https://github.com/plotly/plotly.py/compare/v6.4.0...v6.5.0</a></p>
<h2>v6.4.0</h2>
<h3>Updated</h3>
<ul>
<li>Update plotly.js from version 3.1.1 to version 3.2.0. See the plotly.js <a href="https://github.com/plotly/plotly.js/releases">release notes</a> for more information. [<a href="">#5357</a>]. Notable changes include:
<ul>
<li>Add <code>hovertemplatefallback</code> and <code>texttemplatefallback</code> attributes [<a href="">#7577</a>]</li>
<li>Add &quot;SI extended&quot; formatting rule for tick exponents on axis labels, allowing values to be displayed with extended SI prefixes (e.g., femto, pico, atto) [<a href="">#7249</a>]</li>
</ul>
</li>
</ul>
<h3>Deprecated</h3>
<ul>
<li>Deprecate <code>create_hexbin_mapbox</code> in favor of <code>create_hexbin_map</code>, update related function calls [<a href="">5358</a>], with thanks to <a href="https://github.com/ajlien"><code>@​ajlien</code></a> for the contribution!</li>
</ul>
<h2>v6.3.1</h2>
<h3>Updated</h3>
<ul>
<li>Update Plotly.js from version 3.1.0 to version 3.1.1. See the Plotly.js <a href="https://github.com/plotly/plotly.js/releases">release notes</a> for more information. [<a href="">#5357</a>]. Notable changes include:
<ul>
<li>Fix issue preventing Scattergl plots with text elements from rendering [<a href="">plotly.js#7563</a>]</li>
</ul>
</li>
<li>Use native legends when converting from matplotlib [<a href="">#5312</a>], with thanks to <a href="https://github.com/robertoffmoura"><code>@​robertoffmoura</code></a> to the contribution!</li>
<li>Allow <code>shared_yaxes</code> to work with secondary axes [<a href="">#5180</a>], with thanks to <a href="https://github.com/gmjw"><code>@​gmjw</code></a> for the contribution!</li>
</ul>
<h3>Fixed</h3>
<ul>
<li>Fix issue where width/height in plot layout were not respected during Kaleido image export [<a href="">#5325</a>]</li>
<li>Fix typo in default argument to <code>_ternary_contour.py</code> [<a href="">#5315</a>], with thanks to <a href="https://github.com/Lexachoc"><code>@​Lexachoc</code></a> for the contribution!</li>
<li>Fix incorrect <code>fig.show()</code> behavior when <code>ipython</code> is installed [<a href="">#5258</a>]</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/plotly/plotly.py/compare/v6.3.0...v6.3.1">https://github.com/plotly/plotly.py/compare/v6.3.0...v6.3.1</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/plotly/plotly.py/blob/main/CHANGELOG.md">plotly's changelog</a>.</em></p>
<blockquote>
<h2>[6.5.0] - 2025-11-17</h2>
<h3>Updated</h3>
<ul>
<li>Update plotly.js from version 3.2.0 to version 3.3.0. See the plotly.js <a href="https://github.com/plotly/plotly.js/releases/tag/v3.3.0">release notes</a> for more information. [<a href="">#5421</a>]. Notable changes include:
<ul>
<li>Add <code>hovertemplate</code> for <code>candlestick</code> and <code>ohlc</code> traces [<a href="">#7619</a>]</li>
</ul>
</li>
</ul>
<h3>Fixed</h3>
<ul>
<li>Fix bug where numpy datetime contained in Python list was converted to integer [<a href="">#5415</a>]</li>
</ul>
<h2>[6.4.0] - 2025-11-02</h2>
<h3>Updated</h3>
<ul>
<li>Update plotly.js from version 3.1.1 to version 3.2.0. See the plotly.js <a href="https://github.com/plotly/plotly.js/releases">release notes</a> for more information. [<a href="">#5357</a>]. Notable changes include:
<ul>
<li>Add <code>hovertemplatefallback</code> and <code>texttemplatefallback</code> attributes [<a href="">#7577</a>]</li>
<li>Add &quot;SI extended&quot; formatting rule for tick exponents on axis labels, allowing values to be displayed with extended SI prefixes (e.g., femto, pico, atto) [<a href="">#7249</a>]</li>
</ul>
</li>
</ul>
<h3>Deprecated</h3>
<ul>
<li>Deprecate <code>create_hexbin_mapbox</code> in favor of <code>create_hexbin_map</code>, update related function calls [<a href="">5358</a>], with thanks to <a href="https://github.com/ajlien"><code>@​ajlien</code></a> for the contribution!</li>
</ul>
<h2>[6.3.1] - 2025-10-02</h2>
<h3>Updated</h3>
<ul>
<li>Update Plotly.js from version 3.1.0 to version 3.1.1. See the Plotly.js <a href="https://github.com/plotly/plotly.js/releases">release notes</a> for more information. [<a href="">#5357</a>]. Notable changes include:
<ul>
<li>Fix issue preventing Scattergl plots with text elements from rendering [<a href="">plotly.js#7563</a>]</li>
</ul>
</li>
<li>Use native legends when converting from matplotlib [<a href="">#5312</a>], with thanks to <a href="https://github.com/robertoffmoura"><code>@​robertoffmoura</code></a> to the contribution!</li>
<li>Allow <code>shared_yaxes</code> to work with secondary axes [<a href="">#5180</a>], with thanks to <a href="https://github.com/gmjw"><code>@​gmjw</code></a> for the contribution!</li>
</ul>
<h3>Fixed</h3>
<ul>
<li>Fix issue where width/height in plot layout were not respected during Kaleido image export [<a href="">#5325</a>]</li>
<li>Fix typo in default argument to <code>_ternary_contour.py</code> [<a href="">#5315</a>], with thanks to <a href="https://github.com/Lexachoc"><code>@​Lexachoc</code></a> for the contribution!</li>
<li>Fix incorrect <code>fig.show()</code> behavior when <code>ipython</code> is installed [<a href="">#5258</a>]</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b19f8e5</code></a> changelog formatting</li>
<li><a href=""><code>1ec9a16</code></a> Update CHANGELOG.md</li>
<li><a href=""><code>83a2b0b</code></a> version changes for v6.5.0</li>
<li><a href=""><code>a49f495</code></a> Merge pull request <a href="">#5421</a> from plotly/update-plotlyjs-3.3.0</li>
<li><a href=""><code>f687526</code></a> update plotly/labextension with files from ci</li>
<li><a href=""><code>83ab425</code></a> update package-lock with new plotly.js</li>
<li><a href=""><code>a3480f0</code></a> package-lock indentation</li>
<li><a href=""><code>e519d5a</code></a> update plotly.js to v3.3.0</li>
<li><a href=""><code>22b0ac0</code></a> Merge pull request <a href="">#5415</a> from plotly/fix-np-date-handling-issue</li>
<li><a href=""><code>aa30be5</code></a> Update _plotly_utils/basevalidators.py</li>
<li>Additional commits viewable in <a href="https://github.com/plotly/plotly.py/compare/v6.3.0...v6.5.0">compare view</a></li>
</ul>
</details>
<br />

Updates `pybids` from 0.19.0 to 0.21.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/bids-standard/pybids/releases">pybids's releases</a>.</em></p>
<blockquote>
<h2>0.21.0</h2>
<p><a href="https://doi.org/10.5281/zenodo.17369894"><img src="https://zenodo.org/badge/DOI/10.5281/zenodo.17369894.svg" alt="DOI" /></a></p>
<h2>Release notes</h2>
<p>New feature release in the 0.21.x series.</p>
<p>This release fixes compatibility with <code>univeral_pathlib</code> 0.3. The following dependencies have been updated to new minimum versions:</p>
<ul>
<li>Python 3.10</li>
<li>NumPy 1.24</li>
<li>SciPy 1.10</li>
<li>NiBabel 5.0</li>
<li>Pandas 2.0</li>
</ul>
<h2>Changes</h2>
<ul>
<li>FIX: UPath protocol mismatch (<a href="">#1183</a>)</li>
<li>MNT: Drop Python 3.9 support (<a href="">#1184</a>)</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/bids-standard/pybids/compare/0.20.0...0.21.0">https://github.com/bids-standard/pybids/compare/0.20.0...0.21.0</a></p>
<h2>0.20.0</h2>
<p><a href="https://doi.org/10.5281/zenodo.17192494"><img src="https://zenodo.org/badge/DOI/10.5281/zenodo.17192494.svg" alt="DOI" /></a></p>
<h2>Release notes</h2>
<p>New feature release in the 0.20.x series.</p>
<p>This release finalizes some deprecations that were started in the 0.7 and 0.14 series. In particular, passing indexer arguments to <code>BIDSLayout</code> and disabling <code>absolute_paths</code> mode in <code>BIDSLayout()</code> or <code>BIDSLayout.get()</code> will now error. To adjust indexing behavior, create an explicit <code>BIDSLayoutIndexer()</code> and pass <code>BIDSLayout(..., indexer=indexer)</code>. To access relative paths, use the <code>BIDSFile.relative_path</code> property on <code>BIDSLayout.get()</code> return values.</p>
<h2>Changes</h2>
<ul>
<li>FIX: Check for attribute that can be absent before assigning (<a href="">#1165</a>)</li>
<li>FIX: Accommodate deprecations in the upcoming Pandas 3 release (<a href="">#1173</a>)</li>
<li>FIX: Repaired convolution issue that arises when onset values are repeated (<a href="">#1133</a>)</li>
<li>ENH: StatsModels: Add <code>invalid_inputs</code> parameter to allow dropping of missing data columns to run nodes (<a href="">#1145</a>)</li>
<li>ENH: Add missing root-level path patterns (<a href="">#1169</a>)</li>
<li>ENH: Parse <code>seg-</code> entities from dseg or probseg files (<a href="">#1172</a>)</li>
<li>DOC: Update link to derivatives config file (<a href="">#1132</a>)</li>
<li>MNT: Address warnings produced by pybids and dependencies (<a href="">#1136</a>)</li>
<li>MNT: Lock test environment, update with dependabot (<a href="">#1134</a>)</li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/emmanuel-ferdman"><code>@​emmanuel-ferdman</code></a> made their first contribution in <a href="">bids-standard/pybids#1132</a></li>
<li><a href="https://github.com/coryshain"><code>@​coryshain</code></a> made their first contribution in <a href="">bids-standard/pybids#1145</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/bids-standard/pybids/compare/0.19.0...0.20.0">https://github.com/bids-standard/pybids/compare/0.19.0...0.20.0</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/bids-standard/pybids/blob/main/CHANGELOG.rst">pybids's changelog</a>.</em></p>
<blockquote>
<h2>Version 0.21.0 (October 16, 2025)</h2>
<p>New feature release in the 0.21.x series.</p>
<p>This release fixes compatibility with <code>univeral_pathlib</code> 0.3.
The following dependencies have been updated to new minimum versions:</p>
<ul>
<li>Python 3.10</li>
<li>NumPy 1.24</li>
<li>SciPy 1.10</li>
<li>NiBabel 5.0</li>
<li>Pandas 2.0</li>
</ul>
<p>Merged pull requests:</p>
<ul>
<li>FIX: UPath protocol mismatch (<a href="">#1183</a>)</li>
<li>MNT: Drop Python 3.9 support (<a href="">#1184</a>)</li>
</ul>
<h2>Version 0.20.0 (September 24, 2025)</h2>
<p>New feature release in the 0.20.x series.</p>
<p>This release finalizes some deprecations that were started in the 0.7 and 0.14 series.
In particular, passing indexer arguments to <code>BIDSLayout</code> and disabling
<code>absolute_paths</code> mode in <code>BIDSLayout()</code> or <code>BIDSLayout.get()</code> will now error.
To adjust indexing behavior, create an explicit <code>BIDSLayoutIndexer()</code> and pass
<code>BIDSLayout(..., indexer=indexer)</code>.
To access relative paths, use the <code>BIDSFile.relative_path</code> property on
<code>BIDSLayout.get()</code> return values.</p>
<ul>
<li>FIX: Check for attribute that can be absent before assigning (<a href="">#1165</a>)</li>
<li>FIX: Accommodate deprecations in the upcoming Pandas 3 release (<a href="">#1173</a>)</li>
<li>FIX: Repaired convolution issue that arises when onset values are repeated (<a href="">#1133</a>)</li>
<li>ENH: StatsModels: Add <code>invalid_inputs</code> parameter to allow dropping of missing data columns to run nodes (<a href="">#1145</a>)</li>
<li>ENH: Add missing root-level path patterns (<a href="">#1169</a>)</li>
<li>ENH: Parse <code>seg-</code> entities from dseg or probseg files (<a href="">#1172</a>)</li>
<li>DOC: Update link to derivatives config file (<a href="">#1132</a>)</li>
<li>MNT: Address warnings produced by pybids and dependencies (<a href="">#1136</a>)</li>
<li>MNT: Lock test environment, update with dependabot (<a href="">#1134</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>030cc40</code></a> rel: 0.21.0</li>
<li><a href=""><code>58beee3</code></a> chore: Update zenodo.json</li>
<li><a href=""><code>712e031</code></a> Merge pull request <a href="">#1185</a> from effigies/mnt/upgrade</li>
<li><a href=""><code>514375b</code></a> Merge pull request <a href="">#1183</a> from mgxd/fix/upath-protocol-mismatch</li>
<li><a href=""><code>a0fb827</code></a> [DATALAD RUNCMD] uv lock --upgrade</li>
<li><a href=""><code>3d1c178</code></a> Merge branch 'master' into fix/upath-protocol-mismatch</li>
<li><a href=""><code>f2aac46</code></a> Merge pull request <a href="">#1184</a> from effigies/py39/drop</li>
<li><a href=""><code>8de2603</code></a> chore(tox): Set runner once</li>
<li><a href=""><code>388098c</code></a> chore(ci): Drop py39 tests, py311-pre</li>
<li><a href=""><code>265adea</code></a> [DATALAD RUNCMD] uv lock</li>
<li>Additional commits viewable in <a href="https://github.com/bids-standard/pybids/compare/0.19.0...0.21.0">compare view</a></li>
</ul>
</details>
<br />

Updates `pyzotero` from 1.6.11 to 1.7.6
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>4896975</code></a> Set contentType in attachment item metadata during upload</li>
<li><a href=""><code>b1fcf78</code></a> Bump actions/checkout from 5 to 6 in the gha-updates group</li>
<li><a href=""><code>4fc1d53</code></a> Make search params more visible</li>
<li><a href=""><code>fd99c81</code></a> Version bump</li>
<li><a href=""><code>876f19a</code></a> Fix dump method TypeError when path argument is provided</li>
<li><a href=""><code>8a61267</code></a> Sync --locked for CI</li>
<li><a href=""><code>80b3642</code></a> Bump the gha-updates group with 2 updates (<a href="">#264</a>)</li>
<li><a href=""><code>0326f28</code></a> Update docstring for addto_collection method to clarify functionality (<a href="">#263</a>)</li>
<li><a href=""><code>6ba13a8</code></a> Merge pull request <a href="">#262</a> from urschrei/dependabot/uv/python-dependencies-93c3a...</li>
<li><a href=""><code>4aa92ab</code></a> Bump whenever from 0.9.2 to 0.9.3 in the python-dependencies group</li>
<li>Additional commits viewable in <a href="https://github.com/urschrei/pyzotero/compare/v1.6.11...v1.7.6">compare view</a></li>
</ul>
</details>
<br />

Updates `rich` from 14.1.0 to 14.2.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/Textualize/rich/releases">rich's releases</a>.</em></p>
<blockquote>
<h2>The Easy as Pi release</h2>
<p>This release bumps Python compatibility to the just-released Python 3.14.</p>
<h2>[14.2.0] - 2025-10-09</h2>
<h3>Changed</h3>
<ul>
<li>Python3.14 compatibility <a href="">Textualize/rich#3861</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/Textualize/rich/blob/master/CHANGELOG.md">rich's changelog</a>.</em></p>
<blockquote>
<h2>[14.2.0] - 2025-10-09</h2>
<h3>Changed</h3>
<ul>
<li>Python3.14 compatibility <a href="">Textualize/rich#3861</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>494f83c</code></a> changelog</li>
<li><a href=""><code>d476e85</code></a> Merge pull request <a href="">#3862</a> from GeroZayas/docs/es-readme-sync-2025-10</li>
<li><a href=""><code>518daaa</code></a> docs(es): sync README.es.md (macOS, 16 colors, Python 3.8+)</li>
<li><a href=""><code>cd5074f</code></a> Merge pull request <a href="">#3861</a> from Textualize/python314</li>
<li><a href=""><code>041406c</code></a> removed asv</li>
<li><a href=""><code>655b521</code></a> test fixes</li>
<li><a href=""><code>27c2d2d</code></a> bump for Python3.14</li>
<li><a href=""><code>ea9d4db</code></a> Update feature_request.md</li>
<li>See full diff in <a href="https://github.com/Textualize/rich/compare/v14.1.0...v14.2.0">compare view</a></li>
</ul>
</details>
<br />

Updates `ruamel-yaml` from 0.18.15 to 0.19.0

Updates `urllib3` from 2.5.0 to 2.6.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/urllib3/urllib3/releases">urllib3's releases</a>.</em></p>
<blockquote>
<h2>2.6.2</h2>
<h2>🚀 urllib3 is fundraising for HTTP/2 support</h2>
<p><a href="https://sethmlarson.dev/urllib3-is-fundraising-for-http2-support">urllib3 is raising ~$40,000 USD</a> to release HTTP/2 support and ensure long-term sustainable maintenance of the project after a sharp decline in financial support. If your company or organization uses Python and would benefit from HTTP/2 support in Requests, pip, cloud SDKs, and thousands of other projects <a href="https://opencollective.com/urllib3">please consider contributing financially</a> to ensure HTTP/2 support is developed sustainably and maintained for the long-haul.</p>
<p>Thank you for your support.</p>
<h2>Changes</h2>
<ul>
<li>Fixed <code>HTTPResponse.read_chunked()</code> to properly handle leftover data in the decoder's buffer when reading compressed chunked responses. (<a href="">urllib3/urllib3#3734</a>)</li>
</ul>
<h2>2.6.1</h2>
<h2>🚀 urllib3 is fundraising for HTTP/2 support</h2>
<p><a href="https://sethmlarson.dev/urllib3-is-fundraising-for-http2-support">urllib3 is raising ~$40,000 USD</a> to release HTTP/2 support and ensure long-term sustainable maintenance of the project after a sharp decline in financial support. If your company or organization uses Python and would benefit from HTTP/2 support in Requests, pip, cloud SDKs, and thousands of other projects <a href="https://opencollective.com/urllib3">please consider contributing financially</a> to ensure HTTP/2 support is developed sustainably and maintained for the long-haul.</p>
<p>Thank you for your support.</p>
<h2>Changes</h2>
<ul>
<li>Restore previously removed <code>HTTPResponse.getheaders()</code> and <code>HTTPResponse.getheader()</code> methods. (<a href="">#3731</a>)</li>
</ul>
<h2>2.6.0</h2>
<h2>🚀 urllib3 is fundraising for HTTP/2 support</h2>
<p><a href="https://sethmlarson.dev/urllib3-is-fundraising-for-http2-support">urllib3 is raising ~$40,000 USD</a> to release HTTP/2 support and ensure long-term sustainable maintenance of the project after a sharp decline in financial support. If your company or organization uses Python and would benefit from HTTP/2 support in Requests, pip, cloud SDKs, and thousands of other projects <a href="https://opencollective.com/urllib3">please consider contributing financially</a> to ensure HTTP/2 support is developed sustainably and maintained for the long-haul.</p>
<p>Thank you for your support.</p>
<h2>Security</h2>
<ul>
<li>Fixed a security issue where streaming API could improperly handle highly compressed HTTP content (&quot;decompression bombs&quot;) leading to excessive resource consumption even when a small amount of data was requested. Reading small chunks of compressed data is safer and much more efficient now. (CVE-2025-66471 reported by <a href="https://github.com/Cycloctane"><code>@​Cycloctane</code></a>, 8.9 High, GHSA-2xpw-w6gg-jr37)</li>
<li>Fixed a security issue where an attacker could compose an HTTP response with virtually unlimited links in the <code>Content-Encoding</code> header, potentially leading to a denial of service (DoS) attack by exhausting system resources during decoding. The number of allowed chained encodings is now limited to 5. (CVE-2025-66418 reported by <a href="https://github.com/illia-v"><code>@​illia-v</code></a>, 8.9 High, GHSA-gm62-xv2j-4w53)</li>
</ul>
<blockquote>
<p>[!IMPORTANT]</p>
<ul>
<li>If urllib3 is not installed with the optional <code>urllib3[brotli]</code> extra, but your environment contains a Brotli/brotlicffi/brotlipy package anyway, make sure to upgrade it to at least Brotli 1.2.0 or brotlicffi 1.2.0.0 to  benefit from the security fixes and avoid warnings. Prefer using  <code>urllib3[brotli]</code> to install a compatible Brotli package automatically.</li>
<li>If you use custom decompressors, please make sure to update them to  respect the changed API of <code>urllib3.response.ContentDecoder</code>.</li>
</ul>
</blockquote>
<h2>Features</h2>
<ul>
<li>Enabled retrieval, deletion, and membership testing in <code>HTTPHeaderDict</code> using bytes keys. (<a href="">#3653</a>)</li>
<li>Added host and port information to string representations of <code>HTTPConnection</code>. (<a href="">#3666</a>)</li>
<li>Added support for Python 3.14 free-threading builds explicitly. (<a href="">#3696</a>)</li>
</ul>
<h2>Removals</h2>
<ul>
<li>Removed the <code>HTTPResponse.getheaders()</code> method in favor of <code>HTTPResponse.headers</code>. Removed the <code>HTTPResponse.getheader(name, default)</code> method in favor of <code>HTTPResponse.headers.get(name, default)</code>. (<a href="">#3622</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/urllib3/urllib3/blob/main/CHANGES.rst">urllib3's changelog</a>.</em></p>
<blockquote>
<h1>2.6.2 (2025-12-11)</h1>
<ul>
<li>Fixed <code>HTTPResponse.read_chunked()</code> to properly handle leftover data in
the decoder's buffer when reading compressed chunked responses.
(<code> &lt;</code>__)</li>
</ul>
<h1>2.6.1 (2025-12-08)</h1>
<ul>
<li>Restore previously removed <code>HTTPResponse.getheaders()</code> and
<code>HTTPResponse.getheader()</code> methods.
(<code> &lt;</code>__)</li>
</ul>
<h1>2.6.0 (2025-12-05)</h1>
<h2>Security</h2>
<ul>
<li>Fixed a security issue where streaming API could improperly handle highly
compressed HTTP content (&quot;decompression bombs&quot;) leading to excessive resource
consumption even when a small amount of data was requested. Reading small
chunks of compressed data is safer and much more efficient now.
(<code>GHSA-2xpw-w6gg-jr37 &lt;https://github.com/urllib3/urllib3/security/advisories/GHSA-2xpw-w6gg-jr37&gt;</code>__)</li>
<li>Fixed a security issue where an attacker could compose an HTTP response with
virtually unlimited links in the <code>Content-Encoding</code> header, potentially
leading to a denial of service (DoS) attack by exhausting system resources
during decoding. The number of allowed chained encodings is now limited to 5.
(<code>GHSA-gm62-xv2j-4w53 &lt;https://github.com/urllib3/urllib3/security/advisories/GHSA-gm62-xv2j-4w53&gt;</code>__)</li>
</ul>
<p>.. caution::</p>
<ul>
<li>
<p>If urllib3 is not installed with the optional <code>urllib3[brotli]</code> extra, but
your environment contains a Brotli/brotlicffi/brotlipy package anyway, make
sure to upgrade it to at least Brotli 1.2.0 or brotlicffi 1.2.0.0 to
benefit from the security fixes and avoid warnings. Prefer using
<code>urllib3[brotli]</code> to install a compatible Brotli package automatically.</p>
</li>
<li>
<p>If you use custom decompressors, please make sure to update them to
respect the changed API of <code>urllib3.response.ContentDecoder</code>.</p>
</li>
</ul>
<h2>Features</h2>
<ul>
<li>Enabled retrieval, deletion, and membership testing in <code>HTTPHeaderDict</code> using bytes keys. (<code> &lt;</code>__)</li>
<li>Added host and port information to string representations of <code>HTTPConnection</code>. (<code> &lt;</code>__)</li>
<li>Added support for Python 3.14 free-threading builds explicitly. (<code> &lt;</code>__)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>83f8643</code></a> Release 2.6.2</li>
<li><a href=""><code>571a9b7</code></a> Fix <code>HTTPResponse.read_chunked</code> when leftover data is present in decoder's bu...</li>
<li><a href=""><code>bfe8e19</code></a> Release 2.6.1</li>
<li><a href=""><code>3ceeb84</code></a> Restore <code>getheaders()</code> and <code>getheader()</code> (<a href="">#3732</a>)</li>
<li><a href=""><code>720f484</code></a> Release 2.6.0</li>
<li><a href=""><code>24d7b67</code></a> Merge commit from fork</li>
<li><a href=""><code>c19571d</code></a> Merge commit from fork</li>
<li><a href=""><code>816fcf0</code></a> Bump actions/setup-python from 6.0.0 to 6.1.0 (<a href="">#3725</a>)</li>
<li><a href=""><code>18af0a1</code></a> Improve speed of <code>BytesQueueBuffer.get()</code> by using memoryview (<a href="">#3711</a>)</li>
<li><a href=""><code>1f6abac</code></a> Bump versions of pre-commit hooks (<a href="">#3716</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/urllib3/urllib3/compare/2.5.0...2.6.2">compare view</a></li>
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
- `@dependabot merge` will merge this PR after your CI passes on it
- `@dependabot squash and merge` will squash and merge this PR after your CI passes on it
- `@dependabot cancel merge` will cancel a previously requested merge and block automerging
- `@dependabot reopen` will reopen this PR if it is closed
- `@dependabot close` will close this PR and stop Dependabot recreating it. You can achieve the same result by closing it manually
- `@dependabot show <dependency name> ignore conditions` will show all of the ignore conditions of the specified dependency
- `@dependabot ignore <dependency name> major version` will close this group update PR and stop Dependabot creating any more for the specific dependency's major version (unless you unignore this specific dependency's major version or upgrade to it yourself)
- `@dependabot ignore <dependency name> minor version` will close this group update PR and stop Dependabot creating any more for the specific dependency's minor version (unless you unignore this specific dependency's minor version or upgrade to it yourself)
- `@dependabot ignore <dependency name>` will close this group update PR and stop Dependabot creating any more for the specific dependency (unless you unignore this specific dependency or upgrade to it yourself)
- `@dependabot unignore <dependency name>` will remove all of the ignore conditions of the specified dependency
- `@dependabot unignore <dependency name> <ignore condition>` will remove the ignore condition of the specified dependency and ignore conditions

</details>

<!-- readthedocs-preview bids-website start -->
----
📚 Documentation preview 📚: https://bids-website--768.org.readthedocs.build/en/768/

<!-- readthedocs-preview bids-website end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fb9173eec118`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.