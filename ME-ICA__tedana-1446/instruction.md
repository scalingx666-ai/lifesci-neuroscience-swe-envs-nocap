# Issue

**Title:** Bump bokeh from 3.9.0 to 3.9.1

## Description

Bumps [bokeh](https://github.com/bokeh/bokeh) from 3.9.0 to 3.9.1.
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

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6bdc5a435e04`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.