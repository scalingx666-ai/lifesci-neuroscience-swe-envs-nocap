# Issue

**Title:** Bump tqdm from 4.68.4 to 4.70.0

## Description

Bumps [tqdm](https://github.com/tqdm/tqdm) from 4.68.4 to 4.70.0.
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
<h2>tqdm v4.69.0 stable</h2>
<ul>
<li>add <code>tqdm.asyncio.gather(..., return_exceptions=False)</code> (<a href="">#1776</a>, <a href="">#1671</a> &lt;- <a href="">#1286</a>)</li>
<li>misc minor framework updates
<ul>
<li>bump workflow actions &amp; pre-commit hooks</li>
</ul>
</li>
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
<li>Additional commits viewable in <a href="https://github.com/tqdm/tqdm/compare/v4.68.4...v4.70.0">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d1b00bcd1067`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.