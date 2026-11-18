# Issue

**Title:** build(deps): bump bokeh from 3.8.0 to 3.8.2

## Description

Bumps [bokeh](https://github.com/bokeh/bokeh) from 3.8.0 to 3.8.2.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/bokeh/bokeh/blob/3.8.2/docs/CHANGELOG">bokeh's changelog</a>.</em></p>
<blockquote>
<h2>2026-01-06    3.8.2:</h2>
<ul>
<li>
<p>bugfixes:</p>
<ul>
<li><a href="">#14768</a> [component: server] Incomplete Origin Validation in WebSockets in Bokeh server applications</li>
</ul>
</li>
<li>
<p>tasks:</p>
<ul>
<li><a href="">#14767</a> Backports for 3.8.2</li>
</ul>
</li>
</ul>
<h2>2025-11-07    3.8.1:</h2>
<ul>
<li>
<p>bugfixes:</p>
<ul>
<li><a href="">#14618</a> [component: docs] Local documentation build fails with <code>Extension error (sphinxext.opengraph)</code></li>
<li><a href="">#14626</a> [component: docs] Local documentation fails on Windows because of missing svg icons</li>
<li><a href="">#14651</a> [component: bokehjs] HoverTool parameter @$name for stacked bar chart not working in version 3.8.0</li>
</ul>
</li>
<li>
<p>tasks:</p>
<ul>
<li><a href="">#14704</a> Backports for 3.8.1</li>
</ul>
</li>
</ul>
<h2>2025-08-29      3.8:</h2>
<ul>
<li>bugfixes:
<ul>
<li><a href="">#12430</a> [component: bokehjs] [BUG] Step glyphs do not support linked brushing</li>
<li><a href="">#12994</a> [component: bokehjs] [BUG] Patch does not output under certain conditions</li>
<li><a href="">#13616</a> [component: bokehjs] [BUG] DateRangePicker value does not reflect value in browser when selection is aborted</li>
<li><a href="">#14334</a> js_on_change not firing when range is updated in range tool</li>
<li><a href="">#14352</a> [component: bokehjs] Log Axis and Range1d &lt; 1 failing</li>
<li><a href="">#14383</a> [component: bokehjs] <code>SerializationError: circular reference</code> When Passing List of Renderers to CustomJS Callbacks, but not when passing renderers sperately.</li>
<li><a href="">#14396</a> [component: examples] Remove context from time of day in span example</li>
<li><a href="">#14399</a> Bad typings for <code>list_attr_splat</code> (e.g. <code>Plot.axis</code>)</li>
<li><a href="">#14413</a> [component: bokehjs] <code>ValueRef</code> <code>formatter</code> does not handle datetime nullable well</li>
<li><a href="">#14420</a> [component: bokehjs] Enhance performance of WebGL multi_marker</li>
<li><a href="">#14422</a> [component: bokehjs] Legend renderer not correctly positioned when saved with SaveTool</li>
<li><a href="">#14424</a> [component: bokehjs] Patches with no data does not show plot with Bokeh 3.7+</li>
<li><a href="">#14458</a> [component: bokehjs] Removing and re-adding DOM nodes causes React problems</li>
<li><a href="">#14461</a> [component: tests] The regression test for issue <a href="">#14207</a> is unreliable</li>
<li><a href="">#14468</a> [component: docs] Try on CodePen link does not work in documentation /docs/user_guide/advanced/bokehjs.html</li>
<li><a href="">#14469</a> [component: bokehjs] Canvas2D: Multiple readback operations using getImageData are faster with the willReadFrequently attribute set to true</li>
<li><a href="">#14476</a> Improve handling of pd.NA in Property.matches</li>
<li><a href="">#14497</a> mypy 1.15.0 fails in CI but not locally</li>
<li><a href="">#14499</a> [component: docs] IndexError on importing bokeh.sphinxext.bokeh_plot</li>
<li><a href="">#14520</a> [component: bokehjs] BokehJS complains about categorical factors for the BoxAnnotation widget</li>
<li><a href="">#14536</a> Flex layouts need to apply <code>min_width</code> and <code>min_height</code> selectively</li>
<li><a href="">#14540</a> [component: tests] Tests are failing on Windows and Python 3.10 after PR <a href="">#14531</a></li>
<li><a href="">#14541</a> New SVG icons have inconsistent line widths</li>
<li><a href="">#14554</a> Add support for scalar uint32 color input.</li>
<li><a href="">#14565</a> [component: bokehjs] DataTable source update broken</li>
<li><a href="">#14574</a> [component: build] grammar build script failing with whitespace in path</li>
<li><a href="">#14597</a> [component: bokehjs] <code>document_ready</code> even trigger twice with Bokeh 3.4.0.dev4</li>
<li><a href="">#14602</a> [component: bokehjs] Layoutable components in side panels don't appear in exported images</li>
<li><a href="">#14620</a> Re-connect race condition on page reload</li>
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
<li><a href=""><code>e5ce879</code></a> Deployment updates for release 3.8.2</li>
<li><a href=""><code>2b3ee10</code></a> Don't validate npm credentials due to OICD limitations in npm (<a href="">#14769</a>)</li>
<li><a href=""><code>756e3ae</code></a> Migrate from NPM tokens to trusted providers for publishing in CI (<a href="">#14766</a>)</li>
<li><a href=""><code>2f225a1</code></a> Update dependencies in build environment (<a href="">#14758</a>)</li>
<li><a href=""><code>69d197c</code></a> update switcher.json</li>
<li><a href=""><code>d915c8b</code></a> update to latest ruff (<a href="">#14661</a>)</li>
<li><a href=""><code>5f9f7b6</code></a> update release notes</li>
<li><a href=""><code>cedd113</code></a> handle wildcard host with port correctly</li>
<li><a href=""><code>a961ab7</code></a> small CI fixes for advisory fork merge</li>
<li><a href=""><code>d62939a</code></a> Merge commit from fork</li>
<li>Additional commits viewable in <a href="https://github.com/bokeh/bokeh/compare/3.8.0...3.8.2">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b47aeeccda19`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.