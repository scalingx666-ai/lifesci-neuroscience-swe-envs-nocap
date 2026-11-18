# Issue

**Title:** [dependabot]: Bump the deps group with 4 updates

## Description

Bumps the deps group with 4 updates: [bokeh](https://github.com/bokeh/bokeh), [openneuro-py](https://github.com/openneuro-py/openneuro-py), [tqdm](https://github.com/tqdm/tqdm) and [ty](https://github.com/astral-sh/ty).

Updates `bokeh` from 3.9.1 to 3.9.2
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

Updates `openneuro-py` from 2026.7.0 to 2026.7.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/openneuro-py/openneuro-py/releases">openneuro-py's releases</a>.</em></p>
<blockquote>
<h2>v2026.7.1</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>Add bidsignore, tweak docs and messages by <a href="https://github.com/larsoner"><code>@​larsoner</code></a> in <a href="">openneuro-py/openneuro-py#354</a></li>
<li>Move to niquests by <a href="https://github.com/larsoner"><code>@​larsoner</code></a> in <a href="">openneuro-py/openneuro-py#353</a></li>
<li>Move to rich for progress updates by <a href="https://github.com/larsoner"><code>@​larsoner</code></a> in <a href="">openneuro-py/openneuro-py#355</a></li>
<li>Make downloads resilient to per-file failures by <a href="https://github.com/larsoner"><code>@​larsoner</code></a> in <a href="">openneuro-py/openneuro-py#361</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/openneuro-py/openneuro-py/compare/v2026.7.0...v2026.7.1">https://github.com/openneuro-py/openneuro-py/compare/v2026.7.0...v2026.7.1</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>8a99880</code></a> Make downloads resilient to per-file failures (<a href="">#361</a>)</li>
<li><a href=""><code>e2cdf6d</code></a> Move to rich for progress updates (<a href="">#355</a>)</li>
<li><a href=""><code>d2d5b5f</code></a> Move to niquests (<a href="">#353</a>)</li>
<li><a href=""><code>52faee3</code></a> Bump types-tqdm from 4.69.0.20260720 to 4.69.0.20260724 (<a href="">#360</a>)</li>
<li><a href=""><code>28f6bd9</code></a> Bump the minor-patch group with 4 updates (<a href="">#359</a>)</li>
<li><a href=""><code>4fb043b</code></a> Bump the minor-patch group with 7 updates (<a href="">#358</a>)</li>
<li><a href=""><code>b3c2b63</code></a> Bump wcmatch from 10.2.1 to 11.0 in the majors group across 1 directory (<a href="">#357</a>)</li>
<li><a href=""><code>19c2d8d</code></a> Bump the minor-patch group with 4 updates (<a href="">#356</a>)</li>
<li><a href=""><code>a0efc20</code></a> Add bidsignore, tweak docs and messages (<a href="">#354</a>)</li>
<li>See full diff in <a href="https://github.com/openneuro-py/openneuro-py/compare/v2026.7.0...v2026.7.1">compare view</a></li>
</ul>
</details>
<br />

Updates `tqdm` from 4.69.0 to 4.70.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tqdm/tqdm/releases">tqdm's releases</a>.</em></p>
<blockquote>
<h2>tqdm v4.70.0 stable</h2>
<ul>
<li><code>contrib.concurrent</code>: major improvements
<ul>
<li>support <code>process_map(mp_context, max_tasks_per_child)</code>, <code>thread_map(thread_name_prefix)</code> (<a href="">#1265</a>)</li>
<li>fix <code>total</code> based on shortest iterable length (<a href="">#1473</a>)</li>
<li>use default <code>max_workers</code> (<a href="">#1543</a> &lt;- <a href="">#1530</a>, <a href="">#1518</a>)</li>
<li>support <code>timeout</code>, <code>buffersize</code> (<a href="">#1576</a>)</li>
<li>improve ETA (<a href="">#1708</a> &lt;- <a href="">#1161</a>)</li>
<li>update <code>as_completed</code> (<a href="">#1709</a> &lt;- <a href="">#1565</a>)</li>
<li>add <code>tqdm.concurrent.intepreter_map</code> (<a href="">#1777</a>)</li>
</ul>
</li>
<li><code>asyncio</code>: support iterables with only <code>__aiter__</code> (<a href="">#1714</a> &lt;- <a href="">#1686</a>)</li>
<li>support <code>reset(float(&quot;inf&quot;))</code> (<a href="">#1783</a> &lt;- <a href="">#1781</a>, <a href="">#651</a>)</li>
<li>framework: test &amp; reduce wheel size (<a href="">#1782</a>)</li>
</ul>
<h2>tqdm v4.69.1 stable</h2>
<ul>
<li><code>contrib.logging</code>: preserve filters (<a href="">#1775</a> &lt;- <a href="">#1581</a>)</li>
<li><code>rich</code>: misc fixes (<a href="">#1773</a>)
<ul>
<li>support generators (without <code>len</code>) (<a href="">#1391</a>)</li>
<li>fix potential <code>AttributeError</code> on exit (<a href="">#1674</a>)</li>
</ul>
</li>
<li>fix <code>total=float('inf')</code> (<a href="">#1781</a> &lt;- <a href="">#651</a>)</li>
<li>fix potential <code>AttributeError</code> on exit (<a href="">#1778</a> &lt;- <a href="">#1668</a>, <a href="">#1537</a>, <a href="">#261</a>)</li>
<li>fix minor docs typos (<a href="">#1780</a>, <a href="">#1746</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>96f2e60</code></a> Merge pull request <a href="">#1777</a> from shermansiu/feat/interpreter-pool</li>
<li><a href=""><code>c27393e</code></a> misc tidy</li>
<li><a href=""><code>061c623</code></a> Disable <code>tqdm.monitor_interval</code> for subinterpreters because they do not have ...</li>
<li><a href=""><code>9fc160b</code></a> Update how we check for <code>interpreter_map</code> support in the tests</li>
<li><a href=""><code>b42463a</code></a> Ensure that subinterpreters can import tqdm while unpickling the initializer</li>
<li><a href=""><code>16d5486</code></a> Add support for nested progress bars</li>
<li><a href=""><code>9f5890f</code></a> Add initial implementation for interpreter_map</li>
<li><a href=""><code>321f920</code></a> Merge pull request <a href="">#1783</a> from LuShadowX/reset-inf-total</li>
<li><a href=""><code>4664b57</code></a> minor tidy</li>
<li><a href=""><code>426a098</code></a> Treat inf total as unknown in reset() too</li>
<li>Additional commits viewable in <a href="https://github.com/tqdm/tqdm/compare/v4.69.0...v4.70.0">compare view</a></li>
</ul>
</details>
<br />

Updates `ty` from 0.0.63 to 0.0.64
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/releases">ty's releases</a>.</em></p>
<blockquote>
<h2>0.0.64</h2>
<h2>Release Notes</h2>
<p>Released on 2026-07-27.</p>
<h3>Bug fixes</h3>
<ul>
<li>Fix identity narrowing for NewTypes (<a href="">#26439</a>)</li>
<li>Make reachability analysis idempotent (<a href="">#27163</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Fix ParamSpec declaration hover and type navigation (<a href="">#27183</a>)</li>
<li>Implement LSP <code>textDocument/implementation</code> request (<a href="">#25410</a>)</li>
<li>Introduce shared primitives for parsing backticks in docstrings (<a href="">#26928</a>)</li>
<li>Render NumPy docstrings as structured Markdown (<a href="">#25925</a>)</li>
</ul>
<h3>CLI</h3>
<ul>
<li>Add <code>--exclude-scripts</code> and <code>--include-scripts</code> (<a href="">#27169</a>)</li>
<li>Discover uv workspace roots (<a href="">#25551</a>)</li>
</ul>
<h3>Diagnostics</h3>
<ul>
<li>Add a lint rule for combined abstract and final decorators (<a href="">#26932</a>)</li>
<li>Change <code>--add-ignore</code> to add space after the colon for <code>ty: ignore</code> (<a href="">#27120</a>)</li>
<li>Fix <code>missing-override-decorator</code> suggestion before Python 3.12 (<a href="">#27166</a>)</li>
<li>Reuse full call diagnostics for implicit setter calls (<a href="">#27115</a>)</li>
</ul>
<h3>Configuration</h3>
<ul>
<li>Allow unresolved unused venv home paths (<a href="">#27162</a>)</li>
<li>Simplify script metadata query (<a href="">#27121</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Decorate only overload implementation signatures (<a href="">#27147</a>)</li>
<li>Don't consider known-instance types, generic aliases or non-singleton special-form types to be single-valued (<a href="">#27137</a>)</li>
<li>Improve identity comparison inference for singleton types (<a href="">#27126</a>)</li>
<li>Improve tuple membership and rich comparison inference (<a href="">#27164</a>)</li>
<li>Model walrus bindings from comprehensions (<a href="">#26466</a>)</li>
<li>Narrow tagged unions using identity comparisons (<a href="">#27130</a>)</li>
<li>Preserve <code>Self</code> in <code>__new__</code> calls (<a href="">#27003</a>)</li>
<li>Preserve receiver constraints when binding overloaded methods (<a href="">#27038</a>)</li>
<li>Support generic manual PEP 695 type aliases (<a href="">#27083</a>)</li>
<li>Treat bivariance as covariant (<a href="">#24319</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Avoid cycles when resolving <code>ModuleType</code> globals (<a href="">#27182</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/blob/main/CHANGELOG.md">ty's changelog</a>.</em></p>
<blockquote>
<h2>0.0.64</h2>
<p>Released on 2026-07-27.</p>
<h3>Bug fixes</h3>
<ul>
<li>Fix identity narrowing for NewTypes (<a href="">#26439</a>)</li>
<li>Make reachability analysis idempotent (<a href="">#27163</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Fix ParamSpec declaration hover and type navigation (<a href="">#27183</a>)</li>
<li>Implement LSP <code>textDocument/implementation</code> request (<a href="">#25410</a>)</li>
<li>Introduce shared primitives for parsing backticks in docstrings (<a href="">#26928</a>)</li>
<li>Render NumPy docstrings as structured Markdown (<a href="">#25925</a>)</li>
</ul>
<h3>CLI</h3>
<ul>
<li>Add <code>--exclude-scripts</code> and <code>--include-scripts</code> (<a href="">#27169</a>)</li>
<li>Discover uv workspace roots (<a href="">#25551</a>)</li>
</ul>
<h3>Diagnostics</h3>
<ul>
<li>Add a lint rule for combined abstract and final decorators (<a href="">#26932</a>)</li>
<li>Change <code>--add-ignore</code> to add space after the colon for <code>ty: ignore</code> (<a href="">#27120</a>)</li>
<li>Fix <code>missing-override-decorator</code> suggestion before Python 3.12 (<a href="">#27166</a>)</li>
<li>Reuse full call diagnostics for implicit setter calls (<a href="">#27115</a>)</li>
</ul>
<h3>Configuration</h3>
<ul>
<li>Allow unresolved unused venv home paths (<a href="">#27162</a>)</li>
<li>Simplify script metadata query (<a href="">#27121</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Decorate only overload implementation signatures (<a href="">#27147</a>)</li>
<li>Don't consider known-instance types, generic aliases or non-singleton special-form types to be single-valued (<a href="">#27137</a>)</li>
<li>Improve identity comparison inference for singleton types (<a href="">#27126</a>)</li>
<li>Improve tuple membership and rich comparison inference (<a href="">#27164</a>)</li>
<li>Model walrus bindings from comprehensions (<a href="">#26466</a>)</li>
<li>Narrow tagged unions using identity comparisons (<a href="">#27130</a>)</li>
<li>Preserve <code>Self</code> in <code>__new__</code> calls (<a href="">#27003</a>)</li>
<li>Preserve receiver constraints when binding overloaded methods (<a href="">#27038</a>)</li>
<li>Support generic manual PEP 695 type aliases (<a href="">#27083</a>)</li>
<li>Treat bivariance as covariant (<a href="">#24319</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Avoid cycles when resolving <code>ModuleType</code> globals (<a href="">#27182</a>)</li>
<li>Avoid expanding optional enum comparisons (<a href="">#27105</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>5e64a13</code></a> Bump version to 0.0.64 (<a href="">#4097</a>)</li>
<li>See full diff in <a href="https://github.com/astral-sh/ty/compare/0.0.63...0.0.64">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `622aa488b944`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.