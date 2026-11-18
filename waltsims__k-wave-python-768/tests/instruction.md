# Issue

**Title:** Bump coverage from 7.14.2 to 7.15.1

## Description

Bumps [coverage](https://github.com/coveragepy/coveragepy) from 7.14.2 to 7.15.1.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/coveragepy/coveragepy/blob/main/CHANGES.rst">coverage's changelog</a>.</em></p>
<blockquote>
<h2>Version 7.15.1 — 2026-07-12</h2>
<ul>
<li>
<p>Fix: in the HTML report with <code>show_contexts</code> enabled, a context label
containing <code>&lt;/script&gt;</code> (for example a parametrized pytest node id) could
close the inline <code>&lt;script&gt;</code> element in a file page early, injecting markup.
Context labels are now fully escaped. Thanks, <code>Rajath Mohare &lt;pull 2224_&gt;</code>_.</p>
</li>
<li>
<p>A number of performance improvements thanks to Paul Kehrer, in pull requests
<code>2213 &lt;pull 2213_&gt;</code><em>, <code>2214 &lt;pull 2214_&gt;</code></em>, <code>2215 &lt;pull 2215_&gt;</code><em>, <code>2216 &lt;pull 2216_&gt;</code></em>, <code>2218 &lt;pull 2218_&gt;</code><em>, <code>2220 &lt;pull 2220_&gt;</code></em>, and <code>2221 &lt;pull 2221_&gt;</code>_.</p>
</li>
</ul>
<p>.. _pull 2213: <a href="">coveragepy/coveragepy#2213</a>
.. _pull 2214: <a href="">coveragepy/coveragepy#2214</a>
.. _pull 2215: <a href="">coveragepy/coveragepy#2215</a>
.. _pull 2216: <a href="">coveragepy/coveragepy#2216</a>
.. _pull 2218: <a href="">coveragepy/coveragepy#2218</a>
.. _pull 2220: <a href="">coveragepy/coveragepy#2220</a>
.. _pull 2221: <a href="">coveragepy/coveragepy#2221</a>
.. _pull 2224: <a href="">coveragepy/coveragepy#2224</a></p>
<p>.. _changes_7-15-0:</p>
<h2>Version 7.15.0 — 2026-07-02</h2>
<ul>
<li>
<p>Since 7.14.0, reporting commands implicitly combine parallel data files. Now
those commands have a new option <code>--keep-combined</code> to retain the data files
after combining them instead of the default, which is to delete them.
Finishes <code>issue 2198</code>_.</p>
</li>
<li>
<p>Fix: the LCOV report would incorrectly count excluded functions as uncovered,
as described in <code>issue 2205</code><em>. This is now fixed thanks to <code>Martin Kuntz Jacobsen &lt;pull 2206_&gt;</code></em>.</p>
</li>
<li>
<p>When running your program, coverage now correctly sets
<code>yourmodule.__spec__.loader</code> as <code>strongly recommended &lt;--loader--_&gt;</code><em>,
avoiding the deprecation warning described in <code>issue 2208</code></em>. Thanks, <code>A5rocks &lt;pull 2209_&gt;</code>_.</p>
</li>
<li>
<p>Fix: with Python 3.10, running with the <code>-I</code> (isolated mode) option didn't
correctly omit the current directory from the module search path, as
described in <code>issue 2103</code><em>. That is now fixed thanks to <code>Ilia Sorokin &lt;pull 2211_&gt;</code></em>.</p>
</li>
</ul>
<p>.. <em>--loader--: <a href="https://docs.python.org/3/reference/datamodel.html#module.__loader">https://docs.python.org/3/reference/datamodel.html#module.__loader</a></em>_
.. _issue 2103:  <a href="">coveragepy/coveragepy#2103</a>
.. _issue 2198:  <a href="">coveragepy/coveragepy#2198</a>
.. _issue 2205:  <a href="">coveragepy/coveragepy#2205</a></p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>da63bed</code></a> docs: sample HTML for 7.15.1</li>
<li><a href=""><code>bc35e64</code></a> docs: prep for 7.15.1</li>
<li><a href=""><code>182b010</code></a> perf: resolve sysmon branch events lazily, one pair at a time (<a href="">#2221</a>)</li>
<li><a href=""><code>ee271ee</code></a> perf: compute multiline maps cheaply in the sysmon core (<a href="">#2220</a>)</li>
<li><a href=""><code>1441b96</code></a> chore: bump the action-dependencies group with 6 updates (<a href="">#2225</a>)</li>
<li><a href=""><code>dd80635</code></a> fix: escape context labels in html report inline script block (<a href="">#2224</a>)</li>
<li><a href=""><code>7c3ae71</code></a> docs: normalize earlier history order (<a href="">#2222</a>)</li>
<li><a href=""><code>088dc60</code></a> chore: make upgrade</li>
<li><a href=""><code>f7e15a8</code></a> test: upload .json and .xml coverage reports</li>
<li><a href=""><code>3b62112</code></a> docs: thanks, Paul Kehrer</li>
<li>Additional commits viewable in <a href="https://github.com/coveragepy/coveragepy/compare/7.14.2...7.15.1">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=coverage&package-manager=pip&previous-version=7.14.2&new-version=7.15.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

</details>

<!-- greptile_comment -->

<h3>Greptile Summary</h3>

This PR bumps the test coverage tool version.

- Updates the `coverage` test extra from `7.14.2` to `7.15.1` in `pyproject.toml`.

<h3>Confidence Score: 5/5</h3>

This looks safe to merge.

- No blocking issues found in the changed code.

<details><summary><h3>Important Files Changed</h3></summary>

| Filename | Overview |
|----------|----------|
| pyproject.toml | Updates the pinned `coverage` version used by the test extra. |

</details>

<sub>Reviews (2): Last reviewed commit:  | [Re-trigger Greptile](https://app.greptile.com/api/retrigger?id=43951243)</sub>

<!-- /greptile_comment -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b89ed25d05e5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.