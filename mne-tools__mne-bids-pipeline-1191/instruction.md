# Issue

**Title:** [dependabot]: Bump black from 26.1.0 to 26.3.1

## Description

Bumps [black](https://github.com/psf/black) from 26.1.0 to 26.3.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/psf/black/releases">black's releases</a>.</em></p>
<blockquote>
<h2>26.3.1</h2>
<h3>Stable style</h3>
<ul>
<li>Prevent Jupyter notebook magic masking collisions from corrupting cells by using
exact-length placeholders for short magics and aborting if a placeholder can no longer
be unmasked safely (<a href="">#5038</a>)</li>
</ul>
<h3>Configuration</h3>
<ul>
<li>Always hash cache filename components derived from <code>--python-cell-magics</code> so custom
magic names cannot affect cache paths (<a href="">#5038</a>)</li>
</ul>
<h3><em>Blackd</em></h3>
<ul>
<li>Disable browser-originated requests by default, add configurable origin allowlisting
and request body limits, and bound executor submissions to improve backpressure
(<a href="">#5039</a>)</li>
</ul>
<h2>26.3.0</h2>
<h3>Stable style</h3>
<ul>
<li>Don't double-decode input, causing non-UTF-8 files to be corrupted (<a href="">#4964</a>)</li>
<li>Fix crash on standalone comment in lambda default arguments (<a href="">#4993</a>)</li>
<li>Preserve parentheses when <code># type: ignore</code> comments would be merged with other
comments on the same line, preventing AST equivalence failures (<a href="">#4888</a>)</li>
</ul>
<h3>Preview style</h3>
<ul>
<li>Fix bug where <code>if</code> guards in <code>case</code> blocks were incorrectly split when the pattern had
a trailing comma (<a href="">#4884</a>)</li>
<li>Fix <code>string_processing</code> crashing on unassigned long string literals with trailing
commas (one-item tuples) (<a href="">#4929</a>)</li>
<li>Simplify implementation of the power operator &quot;hugging&quot; logic (<a href="">#4918</a>)</li>
</ul>
<h3>Packaging</h3>
<ul>
<li>Fix shutdown errors in PyInstaller builds on macOS by disabling multiprocessing in
frozen environments (<a href="">#4930</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Introduce winloop for windows as an alternative to uvloop (<a href="">#4996</a>)</li>
<li>Remove deprecated function <code>uvloop.install()</code> in favor of <code>uvloop.new_event_loop()</code>
(<a href="">#4996</a>)</li>
<li>Rename <code>maybe_install_uvloop</code> function to <code>maybe_use_uvloop</code> to simplify loop
installation and creation of either a uvloop/winloop evenloop or default eventloop
(<a href="">#4996</a>)</li>
</ul>
<h3>Output</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/psf/black/blob/main/CHANGES.md">black's changelog</a>.</em></p>
<blockquote>
<h2>26.3.1</h2>
<h3>Stable style</h3>
<ul>
<li>Prevent Jupyter notebook magic masking collisions from corrupting cells by using
exact-length placeholders for short magics and aborting if a placeholder can no longer
be unmasked safely (<a href="">#5038</a>)</li>
</ul>
<h3>Configuration</h3>
<ul>
<li>Always hash cache filename components derived from <code>--python-cell-magics</code> so custom
magic names cannot affect cache paths (<a href="">#5038</a>)</li>
</ul>
<h3><em>Blackd</em></h3>
<ul>
<li>Disable browser-originated requests by default, add configurable origin allowlisting
and request body limits, and bound executor submissions to improve backpressure
(<a href="">#5039</a>)</li>
</ul>
<h2>26.3.0</h2>
<h3>Stable style</h3>
<ul>
<li>Don't double-decode input, causing non-UTF-8 files to be corrupted (<a href="">#4964</a>)</li>
<li>Fix crash on standalone comment in lambda default arguments (<a href="">#4993</a>)</li>
<li>Preserve parentheses when <code># type: ignore</code> comments would be merged with other
comments on the same line, preventing AST equivalence failures (<a href="">#4888</a>)</li>
</ul>
<h3>Preview style</h3>
<ul>
<li>Fix bug where <code>if</code> guards in <code>case</code> blocks were incorrectly split when the pattern had
a trailing comma (<a href="">#4884</a>)</li>
<li>Fix <code>string_processing</code> crashing on unassigned long string literals with trailing
commas (one-item tuples) (<a href="">#4929</a>)</li>
<li>Simplify implementation of the power operator &quot;hugging&quot; logic (<a href="">#4918</a>)</li>
</ul>
<h3>Packaging</h3>
<ul>
<li>Fix shutdown errors in PyInstaller builds on macOS by disabling multiprocessing in
frozen environments (<a href="">#4930</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Introduce winloop for windows as an alternative to uvloop (<a href="">#4996</a>)</li>
<li>Remove deprecated function <code>uvloop.install()</code> in favor of <code>uvloop.new_event_loop()</code>
(<a href="">#4996</a>)</li>
<li>Rename <code>maybe_install_uvloop</code> function to <code>maybe_use_uvloop</code> to simplify loop
installation and creation of either a uvloop/winloop evenloop or default eventloop
(<a href="">#4996</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>c6755bb</code></a> Prepare release 26.3.1 (<a href="">#5046</a>)</li>
<li><a href=""><code>69973fd</code></a> Harden blackd browser-facing request handling (<a href="">#5039</a>)</li>
<li><a href=""><code>4937fe6</code></a> Fix some shenanigans with the cache file and IPython (<a href="">#5038</a>)</li>
<li><a href=""><code>2e641d1</code></a> docs: remove outdated Black Playground references (<a href="">#5044</a>)</li>
<li><a href=""><code>c014b22</code></a> Remove unused internal code (<a href="">#5041</a>)</li>
<li><a href=""><code>0dae20b</code></a> Add new changelog (<a href="">#5036</a>)</li>
<li><a href=""><code>c5c1cbd</code></a> Minor release patches (<a href="">#5035</a>)</li>
<li><a href=""><code>7e5a828</code></a> docs: clarify relationship between Black style and PEP 8 (<a href="">#5025</a>)</li>
<li><a href=""><code>69705de</code></a> docs: add clearer pyproject configuration guidance (<a href="">#5026</a>)</li>
<li><a href=""><code>35ea679</code></a> Prepare release 26.3.0 (<a href="">#5032</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/psf/black/compare/26.1.0...26.3.1">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=black&package-manager=uv&previous-version=26.1.0&new-version=26.3.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/mne-tools/mne-bids-pipeline/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `50d627e40c39`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.