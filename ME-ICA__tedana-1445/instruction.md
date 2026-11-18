# Issue

**Title:** Bump tqdm from 4.67.3 to 4.68.2

## Description

Bumps [tqdm](https://github.com/tqdm/tqdm) from 4.67.3 to 4.68.2.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tqdm/tqdm/releases">tqdm's releases</a>.</em></p>
<blockquote>
<h2>tqdm v4.68.2 stable</h2>
<ul>
<li>revert accidental change to <code>ascii</code> default (fixes <a href="">#1760</a>)
<ul>
<li><code>UnicodeEncodeError: 'charmap' codec can't encode characters in position 6-7: character maps to &lt;undefined&gt;</code> can be fixed by installing <code>tqdm!=4.68.0,!=4.68.1</code></li>
</ul>
</li>
<li>misc docs updates
<ul>
<li>fix links</li>
<li>replace stray <code>rst</code> -&gt; <code>md</code> syntax</li>
<li>consistent &quot;progress bar&quot; terminology (<a href="">#1737</a>)</li>
</ul>
</li>
<li>tests: fix coverage (fixes <a href="">#1760</a>)</li>
</ul>
<h2>tqdm v4.68.1 stable</h2>
<ul>
<li>set name of monitor thread (<a href="">#1669</a>, <a href="">#1752</a> &lt;- <a href="">#1435</a>)</li>
<li>fix monitor thread <code>atexit</code> deadlock (<a href="">#1751</a> &lt;- <a href="">#528</a>, <a href="">#627</a>, <a href="">#1435</a>, <a href="">#1564</a>)</li>
<li>docs: minor copyediting</li>
</ul>
<h2>tqdm v4.68.0 stable</h2>
<ul>
<li><code>utils</code>: simplify terminal size detection (<a href="">#1760</a>)</li>
<li><code>contrib</code>
<ul>
<li><code>itertools</code> (<a href="">#1760</a>)
<ul>
<li>add <code>chain</code>, <code>permutations</code>, <code>combinations</code>, <code>combinations_with_replacement</code>, <code>batched</code></li>
<li>add <code>product(repeat=1)</code> keyword argument (<a href="">#1428</a>)</li>
</ul>
</li>
<li>fix <code>discord</code>, <code>telegram</code> error handling</li>
<li>fix <code>discord</code>, <code>slack</code>, <code>telegram</code> format for <code>total=None</code></li>
</ul>
</li>
<li>soft-deprecate <code>tqdm.utils.envwrap</code> -&gt; <a href="https://github.com/tqdm/envwrap"><code>envwrap</code></a></li>
<li>benchmarks: fix <code>asv</code></li>
<li>misc linting</li>
<li>misc framework updates
<ul>
<li>CI: migrate manual job to <code>pre-commit.ci</code></li>
<li>bump workflow actions &amp; pre-commit hooks</li>
</ul>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>4b33952</code></a> revert accidental change to <code>tqdm(ascii)</code> default</li>
<li><a href=""><code>b10848f</code></a> docs: fix links</li>
<li><a href=""><code>85b62dd</code></a> docs: replace stray rst -&gt; md</li>
<li><a href=""><code>d2fb04a</code></a> docs: mention OpenAI sponsorship</li>
<li><a href=""><code>85940f9</code></a> docs: consistent progress bar terminology</li>
<li><a href=""><code>9dbb36b</code></a> tests: fix coverage</li>
<li><a href=""><code>67cf355</code></a> Merge pull request <a href="">#1751</a> from jaltmayerpizzorno/fix-atexit-monitor-deadlock</li>
<li><a href=""><code>cfa4a85</code></a> minor docstring updates</li>
<li><a href=""><code>f83290c</code></a> Fix TMonitor deadlock at interpreter shutdown</li>
<li><a href=""><code>59029c3</code></a> Set name for tqdm monitor thread (<a href="">#1752</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/tqdm/tqdm/compare/v4.67.3...v4.68.2">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c4bcd5d44e2b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.