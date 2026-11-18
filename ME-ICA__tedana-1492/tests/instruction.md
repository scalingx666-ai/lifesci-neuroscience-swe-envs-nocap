# Issue

**Title:** Bump bokeh from 3.9.1 to 3.9.2

## Description

Bumps [bokeh](https://github.com/bokeh/bokeh) from 3.9.1 to 3.9.2.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/bokeh/bokeh/blob/3.9.2/docs/CHANGELOG">bokeh's changelog</a>.</em></p>
<blockquote>
<h2>2026-07-25    3.9.2:</h2>
<ul>
<li>
<p>bugfixes:</p>
<ul>
<li><a href="">#11991</a> [component: server] Authentication doesn't work with prefix? [BUG]</li>
<li><a href="">#12160</a> [BUG] theme is not applied to json_item plot</li>
<li><a href="">#14439</a> [component: bokehjs] Hiding map tiles attribution when multiple tiles renderer are added to the plot</li>
<li><a href="">#15006</a> [component: bokehjs] Python callback updates min interval of y range but fails to update the plot</li>
<li><a href="">#15026</a> [component: bokehjs] JS callback does not change the color of arrow head</li>
<li><a href="">#15031</a> [component: bokehjs] Cannot recover the original state of the plot after toggling scientific notation</li>
<li><a href="">#15063</a> [component: bokehjs] Scientific precision not updating when zooming in</li>
<li><a href="">#15034</a> [component: bokehjs] Bokeh Button is still resizable after setting resizable to false with CustomJS</li>
<li><a href="">#15122</a> [component: bokehjs] DataRange1d.max_interval runtime update does not recompute the visible range</li>
<li><a href="">#15135</a> [component: bokehjs] Primary group labels of a nested categorical axis are not centered</li>
<li><a href="">#15151</a> CI failing due to pytest 9.1.0 deprecations</li>
<li><a href="">#15212</a> [component: bokehjs] on_transitive_change has a resource leak</li>
<li><a href="">#15218</a> [component: tests] Handle precision issue in flaky mercator tick test</li>
<li><a href="">#15251</a> [component: bokehjs] <code>bokeh init</code> uses npm incompabible bokehjs version</li>
</ul>
</li>
<li>
<p>tasks:</p>
<ul>
<li><a href="">#10067</a> [BUG] _line_stack() doesn't accept np.ndarray in stackers argument</li>
<li><a href="">#13177</a> Remove message &quot;User authentication hooks NOT provided (default user enabled)&quot;</li>
<li><a href="">#14026</a> [component: docs] Update environment variables section in dev docs</li>
<li><a href="">#14689</a> [component: docs] Document caveats of visual integration tests in bokehjs</li>
<li><a href="">#15120</a> [component: bokehjs] Axis.fixed_location string value on numeric range can throw UnreachableError during initial render</li>
<li><a href="">#15125</a> [component: server] Verify WebSocket token signatures before payload parsing</li>
<li><a href="">#15234</a> [component: tests] Fix flaky macos BokehJS Pantool test</li>
<li><a href="">#15260</a> [component: examples] Fix/improve faces example</li>
<li><a href="">#15189</a> [component: docs] Fix parameter name mismatches in docstrings</li>
</ul>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>1605765</code></a> Deployment updates for release 3.9.2</li>
<li><a href=""><code>5fe45c9</code></a> Backports for 3.9.2 (<a href="">#15264</a>)</li>
<li><a href=""><code>0764cdd</code></a> Merge deployment staging branch staging-3.9.1</li>
<li>See full diff in <a href="https://github.com/bokeh/bokeh/compare/3.9.1...3.9.2">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ceaa9a6ca5d1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.