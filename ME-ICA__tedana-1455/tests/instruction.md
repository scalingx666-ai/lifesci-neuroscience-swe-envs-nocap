# Issue

**Title:** Bump tqdm from 4.68.2 to 4.68.3

## Description

Bumps [tqdm](https://github.com/tqdm/tqdm) from 4.68.2 to 4.68.3.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tqdm/tqdm/releases">tqdm's releases</a>.</em></p>
<blockquote>
<h2>tqdm v4.68.3 stable</h2>
<ul>
<li><code>utils</code>: delay <code>os.get_terminal_size</code> (<a href="">#1763</a> &lt;- <a href="">#1760</a>)</li>
<li><code>autonotebook</code>: support QtConsole, Spyder, JupyterLite (<a href="">#1763</a>, <a href="">#1628</a>, <a href="">#1559</a> &lt;- <a href="">#1283</a>, <a href="">#1098</a>, <a href="">#512</a>)</li>
<li>minor docs updates
<ul>
<li>fix typo (<a href="">#1762</a>)</li>
<li>use <code>git-fame</code></li>
</ul>
</li>
<li>misc minor framework updates
<ul>
<li>fix &amp; update CI build</li>
<li>pre-commit: add docs &amp; metadata generation</li>
<li>move <code>tox.ini</code> -&gt; <code>pyproject.toml</code>, move <code>tox-gh-actions</code> -&gt; <code>tox-gh</code></li>
<li>add Python 3.14, drop 3.7 support</li>
</ul>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>9aff609</code></a> bump version, merge pull request <a href="">#1763</a> from tqdm/jupyterlite</li>
<li><a href=""><code>9872f80</code></a> drop date from snap version str to fix pydantic</li>
<li><a href=""><code>b829334</code></a> support QtConsole, Spyder, JupyterLite</li>
<li><a href=""><code>6fa4867</code></a> delay os.get_terminal_size</li>
<li><a href=""><code>748e107</code></a> lint</li>
<li><a href=""><code>e6e29eb</code></a> move tox.ini -&gt; pyproject.toml</li>
<li><a href=""><code>617e4fa</code></a> tox-gh-actions -&gt; tox-gh</li>
<li><a href=""><code>c49c50d</code></a> add python 3.14, drop python 3.7 support</li>
<li><a href=""><code>fa2bcdb</code></a> pre-commit: tqdm.1</li>
<li><a href=""><code>1ec7988</code></a> auto git-fame</li>
<li>Additional commits viewable in <a href="https://github.com/tqdm/tqdm/compare/v4.68.2...v4.68.3">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `19bdf03b8806`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.