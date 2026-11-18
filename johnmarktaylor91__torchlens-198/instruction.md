# Issue

**Title:** chore(deps-dev): bump mypy from 2.1.0 to 2.4.1

## Description

Bumps [mypy](https://github.com/python/mypy) from 2.1.0 to 2.4.1.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/python/mypy/blob/master/CHANGELOG.md">mypy's changelog</a>.</em></p>
<blockquote>
<h3>Mypy 2.4.1</h3>
<ul>
<li>Process overloads as a whole in two-phase type checking (Ivan Levkivskyi, PR <a href="">22231</a>)</li>
<li>Skip recursive setup for frame-private nested functions in mypyc (Piotr Sawicki, PR <a href="">22187</a>)</li>
</ul>
<h3>Acknowledgements</h3>
<p>Thanks to all mypy contributors who contributed to this release:</p>
<ul>
<li>A5rocks</li>
<li>Adam Dangoor</li>
<li>Alex Waygood</li>
<li>Ali Hamdan</li>
<li>Brian Helba</li>
<li>Chad Dombrova</li>
<li>David Foster</li>
<li>dnwpark</li>
<li>Edgar Ramírez Mondragón</li>
<li>Giorgos Michas</li>
<li>Ivan Levkivskyi</li>
<li>Jelle Zijlstra</li>
<li>Jukka Lehtosalo</li>
<li>Marc Mueller</li>
<li>Michael R. Crusoe</li>
<li>NIYONSHUTI Emmanuel</li>
<li>Piotr Sawicki</li>
<li>Shantanu</li>
<li>themylogin</li>
<li>Vaggelis Danias</li>
<li>Willy Bruns</li>
</ul>
<p>I'd also like to thank my employer, Dropbox, for supporting mypy development.</p>
<h2>Mypy 2.3</h2>
<p>We've just uploaded mypy 2.3.0 to the Python Package Index (<a href="https://pypi.org/project/mypy/">PyPI</a>).
Mypy is a static type checker for Python. This release includes new features, performance
improvements and bug fixes. You can install it as follows:</p>
<pre><code>python3 -m pip install -U mypy
</code></pre>
<p>You can read the full documentation for this release on <a href="http://mypy.readthedocs.io">Read the Docs</a>.</p>
<h3>The Upcoming Switch to the New Native Parser</h3>
<p>We are planning to enable the new native parser (<code>--native-parser</code>) by
default soon. We recommend that you test the native parser in your projects and report
any issues in the <a href="https://github.com/python/mypy/issues">mypy issue tracker</a>.</p>
<h3>Mypyc Free-threading Memory Safety</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>ad02a35</code></a> Skip test for 2.4.1</li>
<li><a href=""><code>cad7794</code></a> Finalize version to 2.4.1</li>
<li><a href=""><code>d9cbcbc</code></a> Add changelog for Mypy 2.4.1 (<a href="">#22310</a>)</li>
<li><a href=""><code>2860baa</code></a> Process overloads as a whole in two-phase type-checking (<a href="">#22231</a>)</li>
<li><a href=""><code>9b3e307</code></a> [mypyc] Skip recursive setup for frame-private nested functions (<a href="">#22187</a>)</li>
<li><a href=""><code>10ad5f6</code></a> Bump ast-serialize to 0.12.1 (<a href="">#22093</a>)</li>
<li><a href=""><code>350052f</code></a> Bump ast-serialize to 0.12.0 (<a href="">#22087</a>)</li>
<li><a href=""><code>f7d08cf</code></a> Bump version to 2.4.1+dev</li>
<li><a href=""><code>935ba8a</code></a> Bump version to 2.4.0</li>
<li><a href=""><code>334a678</code></a> Add link for PR 22066 in mypy 2.4 changelog (<a href="">#22082</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/python/mypy/compare/v2.1.0...v2.4.1">compare view</a></li>
</ul>
</details>
<br />

> **Note**
> Automatic rebases have been disabled on this pull request as it has been open for over 30 days.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a88faa1b5ef9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.