# Issue

**Title:** Bump tqdm from 4.68.3 to 4.68.4

## Description

Bumps [tqdm](https://github.com/tqdm/tqdm) from 4.68.3 to 4.68.4.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tqdm/tqdm/releases">tqdm's releases</a>.</em></p>
<blockquote>
<h2>tqdm v4.68.4 stable</h2>
<ul>
<li>trim to <code>ncols</code> even when <code>'{bar}' not in bar_format</code> (<a href="">#1717</a>, <a href="">#1767</a> &lt;- <a href="">#1658</a>)</li>
<li>fix <code>tqdm.write</code> when <code>stdout=None</code> (<a href="">#1768</a> &lt;- <a href="">#1654</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>53d096e</code></a> bump version, merge pull request <a href="">#1768</a> from its-Sohan/fix/write-stdout-none</li>
<li><a href=""><code>74ff992</code></a> fix: prevent tqdm.write from crashing when sys.stdout is none</li>
<li><a href=""><code>3757d0d</code></a> Merge pull requests <a href="">#1717</a> and <a href="">#1767</a> (fixes <a href="">#1658</a>)</li>
<li><a href=""><code>55156ce</code></a> fix: apply disp_trim to all format_meter return paths (<a href="">#1658</a>)</li>
<li>See full diff in <a href="https://github.com/tqdm/tqdm/compare/v4.68.3...v4.68.4">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `849f5c12fdb7`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.