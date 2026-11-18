# Issue

**Title:** [dependabot]: Bump the deps group with 5 updates

## Description

Bumps the deps group with 5 updates:

| Package | From | To |
| --- | --- | --- |
| [bokeh](https://github.com/bokeh/bokeh) | `3.9.0` | `3.9.1` |
| [filelock](https://github.com/tox-dev/py-filelock) | `3.29.0` | `3.29.1` |
| [lefthook](https://github.com/evilmartians/lefthook) | `2.1.8` | `2.1.9` |
| [ruff](https://github.com/astral-sh/ruff) | `0.15.15` | `0.15.16` |
| [ty](https://github.com/astral-sh/ty) | `0.0.40` | `0.0.43` |

Updates `bokeh` from 3.9.0 to 3.9.1
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/bokeh/bokeh/blob/3.9.1/docs/CHANGELOG">bokeh's changelog</a>.</em></p>
<blockquote>
<h2>2026-06-04    3.9.1:</h2>
<ul>
<li>
<p>bugfixes:</p>
<ul>
<li><a href="">#14944</a> Document().to_json() is not JSON serializable</li>
<li><a href="">#13477</a> [component: docs] Dev docs no longer report precise version information</li>
<li><a href="">#15041</a> range_padding of y_range is not updated when changed via CustomJS</li>
<li><a href="">#7297</a> [component: bokehjs] Invert Colorbar Axis</li>
<li><a href="">#15004</a> [component: bokehjs] Cannot update min_border of figure with CustomJS callback</li>
<li><a href="">#14869</a> [component: bokehjs] BoxAnnotation shows resize cursor by default</li>
<li><a href="">#8787</a> [component: bokehjs] vline hover misses some multi-lines</li>
<li><a href="">#13838</a> [BUG] Using array/list in line_dash for hspan doesn't work</li>
<li><a href="">#13509</a> [component: bokehjs] [BUG] Incorrectly formatted ticks with %N format when time is older than the Epoch</li>
<li><a href="">#14665</a> [component: bokehjs] [bokeh-3.8.0.min.js:405] Uncaught (in promise) RangeError: Maximum call stack size exceeded</li>
<li><a href="">#14491</a> [component: bokehjs] Legends are not synced with glyph visibility state</li>
<li><a href="">#14741</a> [component: bokehjs] Possible regression in muting of legend entries since v3.7.0</li>
<li><a href="">#14856</a> [component: bokehjs] Patches hover tooltip triggers inside holes (hit-testing doesn't account for NaN-separated holes)</li>
<li><a href="">#14855</a> [component: bokehjs] Canvas Patch fill doesn't respect holes (nonzero fill rule instead of evenodd)</li>
<li><a href="">#15080</a> [component: bokehjs] Bokeh plot frame height does not update when changed via slider</li>
<li><a href="">#15015</a> [component: bokehjs] Update of num_minor_ticks does not trigger a visual update of the plot</li>
<li><a href="">#14907</a> <code>NaT</code> is encoded as <code>float(nan)</code> by the serializer</li>
<li><a href="">#15116</a> [component: docs] Documentation of enums is broken in 3.10 branch</li>
<li><a href="">#15131</a> [component: build] Release build failed for non pre-release version</li>
</ul>
</li>
<li>
<p>features:</p>
<ul>
<li><a href="">#14411</a> Adding a performance mode</li>
</ul>
</li>
<li>
<p>tasks:</p>
<ul>
<li><a href="">#14922</a> [component: docs] Update <code>dev</code> section of <code>switcher.json</code> after 3.9 release</li>
<li><a href="">#15054</a> [component: docs] Building documentation with <code>BOKEH_DOCS_CDN=local</code> raises SphinxError</li>
<li><a href="">#15022</a> [component: docs] Fix wrong formatted code block directives</li>
<li><a href="">#14878</a> [component: docs] Toopltips are broken if special characters are in the <code>source.data</code> keys</li>
<li><a href="">#14962</a> [component: docs] <code>Document().models.freeze()</code> not documented</li>
<li><a href="">#15098</a> [component: docs] Add missing link and fix example for <code>tex()</code> in figure class</li>
<li><a href="">#14961</a> [component: tests] Make it possible to run the Python unit test run in parallel</li>
<li><a href="">#15089</a> Backports for 3.9.1</li>
</ul>
</li>
</ul>
<h2>2026-03-11      3.9:</h2>
<ul>
<li>bugfixes:
<ul>
<li><a href="">#14584</a> <code>Div</code> from <code>bokeh.models.dom</code> raisese ValueError in <code>show</code> call</li>
<li><a href="">#14724</a> Bokeh protocol doesn't use binary encoding in <code>pull-doc-reply</code> message</li>
<li><a href="">#14569</a> [component: bokehjs] Adjust overlay in case of 1D box zoom</li>
<li><a href="">#14799</a> [component: build] Compilation failing with whitespace in path</li>
<li><a href="">#13578</a> [component: tests] Unit tests are failing due to changes in pytest-asyncio</li>
<li><a href="">#14568</a> [component: bokehjs] [BUG] Wheel Zoom Tool and Categorical Axis Range</li>
<li><a href="">#14817</a> MyPy can crash on Bokeh 3.9.0.dev9 code</li>
<li><a href="">#14776</a> [component: bokehjs] Don't add BBox if an axis has fixed position</li>
<li><a href="">#14815</a> [component: bokehjs] Bounds using FactorRanges aren't respected in the first visualization</li>
<li><a href="">#14881</a> Default compression level seems too high</li>
<li><a href="">#14894</a> NoChannelsConfiguredError breaks CI after PR <a href="">#14309</a></li>
</ul>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>0d983b5</code></a> Deployment updates for release 3.9.1</li>
<li><a href=""><code>808d988</code></a> Verify <code>switcher.json</code> after updating it in release automation (<a href="">#15132</a>)</li>
<li><a href=""><code>c7cb2d9</code></a> Merge pull request <a href="">#15089</a> from bokeh/mattpap/3.9.1_backports</li>
<li><a href=""><code>b9c7c97</code></a> Add release notes</li>
<li><a href=""><code>3907ae8</code></a> Resolve <code>npm audit</code>'s complaints</li>
<li><a href=""><code>bfd0e34</code></a> Update visual baselines</li>
<li><a href=""><code>2d1718c</code></a> Restore Python 3.10 compatibility</li>
<li><a href=""><code>6c7f228</code></a> reorder documentation strings in <code>enums.py</code> (<a href="">#15118</a>)</li>
<li><a href=""><code>4387218</code></a> Fix definition of {Event,Property}CallbackManager.document</li>
<li><a href=""><code>6c690e9</code></a> Pin mypy to version 0.19*</li>
<li>Additional commits viewable in <a href="https://github.com/bokeh/bokeh/compare/3.9.0...3.9.1">compare view</a></li>
</ul>
</details>
<br />

Updates `filelock` from 3.29.0 to 3.29.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/py-filelock/releases">filelock's releases</a>.</em></p>
<blockquote>
<h2>3.29.1</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>docs: fix API docs of <code>release()</code> by <a href="https://github.com/MrAnno"><code>@​MrAnno</code></a> in <a href="">tox-dev/filelock#540</a></li>
<li>docs: clarify per-thread scope of FileLock configuration by <a href="https://github.com/Gares95"><code>@​Gares95</code></a> in <a href="">tox-dev/filelock#543</a></li>
<li>chore: improve filelock maintenance path by <a href="https://github.com/lphuc2250gma"><code>@​lphuc2250gma</code></a> in <a href="">tox-dev/filelock#542</a></li>
<li>chore: improve filelock maintenance path by <a href="https://github.com/lphuc2250gma"><code>@​lphuc2250gma</code></a> in <a href="">tox-dev/filelock#544</a></li>
<li>chore: improve filelock maintenance path by <a href="https://github.com/lphuc2250gma"><code>@​lphuc2250gma</code></a> in <a href="">tox-dev/filelock#545</a></li>
<li>🐛 fix(soft): refuse to follow symlinks when reading the lock file by <a href="https://github.com/dxbjavid"><code>@​dxbjavid</code></a> in <a href="">tox-dev/filelock#548</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/MrAnno"><code>@​MrAnno</code></a> made their first contribution in <a href="">tox-dev/filelock#540</a></li>
<li><a href="https://github.com/Gares95"><code>@​Gares95</code></a> made their first contribution in <a href="">tox-dev/filelock#543</a></li>
<li><a href="https://github.com/lphuc2250gma"><code>@​lphuc2250gma</code></a> made their first contribution in <a href="">tox-dev/filelock#542</a></li>
<li><a href="https://github.com/dxbjavid"><code>@​dxbjavid</code></a> made their first contribution in <a href="">tox-dev/filelock#548</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.29.0...3.29.1">https://github.com/tox-dev/filelock/compare/3.29.0...3.29.1</a></p>
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
<p>3.29.1 (2026-06-03)</p>
<hr />
<ul>
<li>🐛 fix(soft): refuse to follow symlinks when reading the lock file :pr:<code>548</code> - by :user:<code>dxbjavid</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>547</code> - by :user:<code>pre-commit-ci[bot]</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>546</code> - by :user:<code>pre-commit-ci[bot]</code></li>
<li>chore: improve filelock maintenance path :pr:<code>545</code> - by :user:<code>lphuc2250gma</code></li>
<li>chore: improve filelock maintenance path :pr:<code>544</code> - by :user:<code>lphuc2250gma</code></li>
<li>chore: improve filelock maintenance path :pr:<code>542</code> - by :user:<code>lphuc2250gma</code></li>
<li>docs: clarify per-thread scope of FileLock configuration :pr:<code>543</code> - by :user:<code>Gares95</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>541</code> - by :user:<code>pre-commit-ci[bot]</code></li>
<li>docs: fix API docs of <code>release()</code> :pr:<code>540</code> - by :user:<code>MrAnno</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>539</code> - by :user:<code>pre-commit-ci[bot]</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>538</code> - by :user:<code>pre-commit-ci[bot]</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>537</code> - by :user:<code>pre-commit-ci[bot]</code></li>
<li>build(deps): bump astral-sh/setup-uv from 8.0.0 to 8.1.0 :pr:<code>536</code> - by :user:<code>dependabot[bot]</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>535</code> - by :user:<code>pre-commit-ci[bot]</code></li>
</ul>
<hr />
<p>3.29.0 (2026-04-19)</p>
<hr />
<ul>
<li>✨ feat(soft): enable stale lock detection on Windows :pr:<code>534</code></li>
<li>🐛 fix(async): use single-thread executor for lock consistency :pr:<code>533</code></li>
<li>build(deps): bump actions/upload-artifact from 7.0.0 to 7.0.1 :pr:<code>530</code> - by :user:<code>dependabot[bot]</code></li>
</ul>
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
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>438b6fe</code></a> Release 3.29.1</li>
<li><a href=""><code>bfbfa76</code></a> 🐛 fix(soft): refuse to follow symlinks when reading the lock file (<a href="">#548</a>)</li>
<li><a href=""><code>c51a72c</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#547</a>)</li>
<li><a href=""><code>cc05fd7</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#546</a>)</li>
<li><a href=""><code>cb947e5</code></a> chore: improve filelock maintenance path (<a href="">#545</a>)</li>
<li><a href=""><code>e087ca9</code></a> chore: improve filelock maintenance path (<a href="">#544</a>)</li>
<li><a href=""><code>f9dd949</code></a> chore: improve filelock maintenance path (<a href="">#542</a>)</li>
<li><a href=""><code>9200f1f</code></a> docs: clarify per-thread scope of FileLock configuration (<a href="">#543</a>)</li>
<li><a href=""><code>9d8985f</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#541</a>)</li>
<li><a href=""><code>7d1f48c</code></a> docs: fix API docs of <code>release()</code> (<a href="">#540</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/tox-dev/py-filelock/compare/3.29.0...3.29.1">compare view</a></li>
</ul>
</details>
<br />

Updates `lefthook` from 2.1.8 to 2.1.9
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/evilmartians/lefthook/releases">lefthook's releases</a>.</em></p>
<blockquote>
<h2>v2.1.9</h2>
<h2>Changelog</h2>
<ul>
<li>1d35cbabe1ebaf2a5ed4d2186caa0402de6448e2 chore: add pretty gradient (<a href="">#1432</a>)</li>
<li>22be6c50e1412c748f3c6b60e9c61cd056dc693b deps: May 2026 (<a href="">#1415</a>)</li>
<li>1bae568f03dfb88af9185031fa44e9fee285e917 fix: update hooks path after resetting (<a href="">#1431</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/evilmartians/lefthook/blob/master/CHANGELOG.md">lefthook's changelog</a>.</em></p>
<blockquote>
<h2>2.1.9 (2026-05-29)</h2>
<ul>
<li>fix: update hooks path after resetting (<a href="">#1431</a>) by <a href=""><code>@​mrexox</code></a></li>
<li>deps: May 2026 (<a href="">#1415</a>) by <a href=""><code>@​mrexox</code></a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>75f99ff</code></a> 2.1.9: fix install with --reset-hooks-path</li>
<li><a href=""><code>1d35cba</code></a> chore: add pretty gradient (<a href="">#1432</a>)</li>
<li><a href=""><code>1bae568</code></a> fix: update hooks path after resetting (<a href="">#1431</a>)</li>
<li><a href=""><code>22be6c5</code></a> deps: May 2026 (<a href="">#1415</a>)</li>
<li>See full diff in <a href="https://github.com/evilmartians/lefthook/compare/v2.1.8...v2.1.9">compare view</a></li>
</ul>
</details>
<br />

Updates `ruff` from 0.15.15 to 0.15.16
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.15.16</h2>
<h2>Release Notes</h2>
<p>Released on 2026-06-04.</p>
<h3>Preview features</h3>
<ul>
<li>[<code>flake8-async</code>] Implement <code>yield-in-context-manager-in-async-generator</code> (<code>ASYNC119</code>) (<a href="">#24644</a>)</li>
<li>[<code>pylint</code>] Narrow diagnostic range and exclude cases without exception handlers (<code>PLW0717</code>) (<a href="">#25440</a>)</li>
<li>[<code>ruff</code>] Treat <code>yield</code> before <code>break</code> from a terminal loop as terminal (<code>RUF075</code>) (<a href="">#25447</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>[<code>eradicate</code>] Avoid flagging <code>ruff:ignore</code> comments as code (<code>ERA001</code>) (<a href="">#25537</a>)</li>
<li>[<code>eradicate</code>] Fix <code>ERA001</code>/<code>RUF100</code> conflict when <code>noqa</code> is on commented-out code (<a href="">#25414</a>)</li>
<li>[<code>pyflakes</code>] Avoid removing the <code>format</code> call when it would change behavior (<code>F523</code>) (<a href="">#25320</a>)</li>
<li>[<code>pylint</code>] Avoid syntax errors in invalid character replacements in f-strings before Python 3.12 (<code>PLE2510</code>, <code>PLE2512</code>, <code>PLE2513</code>, <code>PLE2514</code>, <code>PLE2515</code>) (<a href="">#25544</a>)</li>
<li>[<code>pyupgrade</code>] Avoid converting <code>format</code> calls with more kinds of side effects (<code>UP032</code>) (<a href="">#25484</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>flake8-pytest-style</code>] Avoid fixes for ambiguous <code>argnames</code> and <code>argvalues</code> combinations (<code>PT006</code>) (<a href="">#24776</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Drop excess capacity from statement suites during parsing (<a href="">#25368</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>[<code>pydocstyle</code>] Improve discoverability of rules enabled for each convention (<a href="">#24973</a>)</li>
<li>[<code>ruff</code>] Restore example code for Python versions before 3.15 (<code>RUF017</code>) (<a href="">#25439</a>)</li>
<li>Fix typo <code>bin/active</code> → <code>bin/activate</code> in tutorial (<a href="">#25473</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Shrink additional parser AST collections (<a href="">#25465</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/Redslayer112"><code>@​Redslayer112</code></a></li>
<li><a href="https://github.com/koriyoshi2041"><code>@​koriyoshi2041</code></a></li>
<li><a href="https://github.com/George-Ogden"><code>@​George-Ogden</code></a></li>
<li><a href="https://github.com/TejasAmle"><code>@​TejasAmle</code></a></li>
<li><a href="https://github.com/anishgirianish"><code>@​anishgirianish</code></a></li>
<li><a href="https://github.com/ntBre"><code>@​ntBre</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/loganrosen"><code>@​loganrosen</code></a></li>
<li><a href="https://github.com/RafaelJohn9"><code>@​RafaelJohn9</code></a></li>
<li><a href="https://github.com/adityasingh2400"><code>@​adityasingh2400</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/blob/main/CHANGELOG.md">ruff's changelog</a>.</em></p>
<blockquote>
<h2>0.15.16</h2>
<p>Released on 2026-06-04.</p>
<h3>Preview features</h3>
<ul>
<li>[<code>flake8-async</code>] Implement <code>yield-in-context-manager-in-async-generator</code> (<code>ASYNC119</code>) (<a href="">#24644</a>)</li>
<li>[<code>pylint</code>] Narrow diagnostic range and exclude cases without exception handlers (<code>PLW0717</code>) (<a href="">#25440</a>)</li>
<li>[<code>ruff</code>] Treat <code>yield</code> before <code>break</code> from a terminal loop as terminal (<code>RUF075</code>) (<a href="">#25447</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>[<code>eradicate</code>] Avoid flagging <code>ruff:ignore</code> comments as code (<code>ERA001</code>) (<a href="">#25537</a>)</li>
<li>[<code>eradicate</code>] Fix <code>ERA001</code>/<code>RUF100</code> conflict when <code>noqa</code> is on commented-out code (<a href="">#25414</a>)</li>
<li>[<code>pyflakes</code>] Avoid removing the <code>format</code> call when it would change behavior (<code>F523</code>) (<a href="">#25320</a>)</li>
<li>[<code>pylint</code>] Avoid syntax errors in invalid character replacements in f-strings before Python 3.12 (<code>PLE2510</code>, <code>PLE2512</code>, <code>PLE2513</code>, <code>PLE2514</code>, <code>PLE2515</code>) (<a href="">#25544</a>)</li>
<li>[<code>pyupgrade</code>] Avoid converting <code>format</code> calls with more kinds of side effects (<code>UP032</code>) (<a href="">#25484</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>flake8-pytest-style</code>] Avoid fixes for ambiguous <code>argnames</code> and <code>argvalues</code> combinations (<code>PT006</code>) (<a href="">#24776</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Drop excess capacity from statement suites during parsing (<a href="">#25368</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>[<code>pydocstyle</code>] Improve discoverability of rules enabled for each convention (<a href="">#24973</a>)</li>
<li>[<code>ruff</code>] Restore example code for Python versions before 3.15 (<code>RUF017</code>) (<a href="">#25439</a>)</li>
<li>Fix typo <code>bin/active</code> → <code>bin/activate</code> in tutorial (<a href="">#25473</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Shrink additional parser AST collections (<a href="">#25465</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/Redslayer112"><code>@​Redslayer112</code></a></li>
<li><a href="https://github.com/koriyoshi2041"><code>@​koriyoshi2041</code></a></li>
<li><a href="https://github.com/George-Ogden"><code>@​George-Ogden</code></a></li>
<li><a href="https://github.com/TejasAmle"><code>@​TejasAmle</code></a></li>
<li><a href="https://github.com/anishgirianish"><code>@​anishgirianish</code></a></li>
<li><a href="https://github.com/ntBre"><code>@​ntBre</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/loganrosen"><code>@​loganrosen</code></a></li>
<li><a href="https://github.com/RafaelJohn9"><code>@​RafaelJohn9</code></a></li>
<li><a href="https://github.com/adityasingh2400"><code>@​adityasingh2400</code></a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>6c498ab</code></a> Bump 0.15.16 (<a href="">#25635</a>)</li>
<li><a href=""><code>e51e132</code></a> [<code>flake8-async</code>] Implement <code>yield-in-context-manager-in-async-generator</code> (`AS...</li>
<li><a href=""><code>7c6dcd9</code></a> [ty] Add caching for pattern match narrowing (<a href="">#25613</a>)</li>
<li><a href=""><code>27058fc</code></a> [ty] Compact retained definition and expression identities (<a href="">#25606</a>)</li>
<li><a href=""><code>bf80d05</code></a> Fix CODEOWNERS syntax (<a href="">#25622</a>)</li>
<li><a href=""><code>10ccd51</code></a> Shrink additional parser AST collections (<a href="">#25465</a>)</li>
<li><a href=""><code>0d7135f</code></a> [ty] Upgrade Salsa (<a href="">#25545</a>)</li>
<li><a href=""><code>49493a3</code></a> [ty] Show type alias value on hover (<a href="">#25381</a>)</li>
<li><a href=""><code>85207d3</code></a> [ty] sys.implementation.version is not sys.version_info (<a href="">#25608</a>)</li>
<li><a href=""><code>a8a0614</code></a> [ty] Avoid retaining duplicate function signatures (<a href="">#25609</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ruff/compare/0.15.15...0.15.16">compare view</a></li>
</ul>
</details>
<br />

Updates `ty` from 0.0.40 to 0.0.43
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/releases">ty's releases</a>.</em></p>
<blockquote>
<h2>0.0.43</h2>
<h2>Release Notes</h2>
<p>Released on 2026-06-03.</p>
<h3>Bug fixes</h3>
<ul>
<li>Don't inject <code>Unknown</code> from non-callable elements of intersection call (<a href="">#25538</a>)</li>
<li>Don't needlessly disambiguate the same type alias (<a href="">#25563</a>)</li>
<li>Fix variance inference for nested type aliases (<a href="">#25567</a>)</li>
<li>Ignore rejected member annotations for synthesized bindings (<a href="">#25427</a>)</li>
<li>Normalize dynamic class literals in cycle recovery (<a href="">#25558</a>)</li>
<li>Register file roots for first-party search paths (<a href="">#25522</a>)</li>
<li>Treat union-bound typevars like unions for <code>possibly-missing-attribute</code> (<a href="">#25561</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Suppress importable completions that are already in scope (<a href="">#25479</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Avoid retaining duplicate function signatures (<a href="">#25609</a>)</li>
<li>Compact retained definition inference results (<a href="">#25593</a>)</li>
<li>Compact retained definition kinds (<a href="">#25610</a>)</li>
<li>Compact retained definitions by node (<a href="">#25498</a>)</li>
<li>Consolidate AST ID reverse lookup (<a href="">#25455</a>)</li>
<li>Consolidate retained use-def definition maps (<a href="">#25499</a>)</li>
<li>Omit redundant definitions-by-node entries (<a href="">#25501</a>)</li>
<li>Reuse common protocol constraints for TypedDict unions (<a href="">#25598</a>)</li>
</ul>
<h3>Diagnostics</h3>
<ul>
<li>Improve error context for not-iterable diagnostics (<a href="">#24944</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Detect disjointness due to incompatible generic specializations (<a href="">#24822</a>)</li>
<li>Distinguish <code>typing.Callable</code> from <code>collections.abc.Callable</code> (<a href="">#24954</a>)</li>
<li>Include nested <code>global</code>/<code>nonlocal</code> bindings in type inference (<a href="">#25387</a>)</li>
<li>Optional lower/upper bounds in individual constraints (<a href="">#25435</a>)</li>
<li>Preserve slice-bound types in subscript inference (<a href="">#25446</a>)</li>
<li>Reject <code>Self</code> in type aliases (<a href="">#25529</a>)</li>
<li>Require literal booleans for TypedDict flags (<a href="">#25594</a>)</li>
<li>Support narrowing on lengths (<a href="">#25347</a>)</li>
<li>Synthesize precise <code>__len__</code> methods for literals (<a href="">#25600</a>)</li>
<li>Use callable type context to implicitly specialize generic class (<a href="">#25471</a>)</li>
<li>expand type aliases inside type context unions (<a href="">#25553</a>)</li>
</ul>
<h3>Contributors</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/blob/main/CHANGELOG.md">ty's changelog</a>.</em></p>
<blockquote>
<h2>0.0.43</h2>
<p>Released on 2026-06-03.</p>
<h3>Bug fixes</h3>
<ul>
<li>Don't inject <code>Unknown</code> from non-callable elements of intersection call (<a href="">#25538</a>)</li>
<li>Don't needlessly disambiguate the same type alias (<a href="">#25563</a>)</li>
<li>Fix variance inference for nested type aliases (<a href="">#25567</a>)</li>
<li>Ignore rejected member annotations for synthesized bindings (<a href="">#25427</a>)</li>
<li>Normalize dynamic class literals in cycle recovery (<a href="">#25558</a>)</li>
<li>Register file roots for first-party search paths (<a href="">#25522</a>)</li>
<li>Treat union-bound typevars like unions for <code>possibly-missing-attribute</code> (<a href="">#25561</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Suppress importable completions that are already in scope (<a href="">#25479</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Avoid retaining duplicate function signatures (<a href="">#25609</a>)</li>
<li>Compact retained definition inference results (<a href="">#25593</a>)</li>
<li>Compact retained definition kinds (<a href="">#25610</a>)</li>
<li>Compact retained definitions by node (<a href="">#25498</a>)</li>
<li>Consolidate AST ID reverse lookup (<a href="">#25455</a>)</li>
<li>Consolidate retained use-def definition maps (<a href="">#25499</a>)</li>
<li>Omit redundant definitions-by-node entries (<a href="">#25501</a>)</li>
<li>Reuse common protocol constraints for TypedDict unions (<a href="">#25598</a>)</li>
</ul>
<h3>Diagnostics</h3>
<ul>
<li>Improve error context for not-iterable diagnostics (<a href="">#24944</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Detect disjointness due to incompatible generic specializations (<a href="">#24822</a>)</li>
<li>Distinguish <code>typing.Callable</code> from <code>collections.abc.Callable</code> (<a href="">#24954</a>)</li>
<li>Include nested <code>global</code>/<code>nonlocal</code> bindings in type inference (<a href="">#25387</a>)</li>
<li>Optional lower/upper bounds in individual constraints (<a href="">#25435</a>)</li>
<li>Preserve slice-bound types in subscript inference (<a href="">#25446</a>)</li>
<li>Reject <code>Self</code> in type aliases (<a href="">#25529</a>)</li>
<li>Require literal booleans for TypedDict flags (<a href="">#25594</a>)</li>
<li>Support narrowing on lengths (<a href="">#25347</a>)</li>
<li>Synthesize precise <code>__len__</code> methods for literals (<a href="">#25600</a>)</li>
<li>Use callable type context to implicitly specialize generic class (<a href="">#25471</a>)</li>
<li>expand type aliases inside type context unions (<a href="">#25553</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/carljm"><code>@​carljm</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>29ce314</code></a> Bump version to 0.0.43 (<a href="">#3648</a>)</li>
<li><a href=""><code>794322d</code></a> Update docker/build-push-action action to v7.2.0 (<a href="">#3629</a>)</li>
<li><a href=""><code>ce89685</code></a> Update prek dependencies (<a href="">#3628</a>)</li>
<li><a href=""><code>792fb71</code></a> Update docker/login-action action to v4.2.0 (<a href="">#3630</a>)</li>
<li><a href=""><code>5c37747</code></a> Update docker/metadata-action action to v6.1.0 (<a href="">#3631</a>)</li>
<li><a href=""><code>5a3e169</code></a> Update docker/setup-buildx-action action to v4.1.0 (<a href="">#3632</a>)</li>
<li><a href=""><code>c2500cc</code></a> Release: Force usage of PyPI as the index (<a href="">#3616</a>)</li>
<li><a href=""><code>7f8cb64</code></a> Bump version to 0.0.42 (<a href="">#3615</a>)</li>
<li><a href=""><code>41bb0d2</code></a> Bump version to 0.0.41 (<a href="">#3601</a>)</li>
<li><a href=""><code>c690a49</code></a> Document <code>completeFunctionParentheses</code> editor setting (<a href="">#3513</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ty/compare/0.0.40...0.0.43">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1be375a21e0e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.