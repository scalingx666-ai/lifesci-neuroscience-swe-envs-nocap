# Issue

**Title:** Bump coverage from 7.5.4 to 7.6.1

## Description

Bumps [coverage](https://github.com/nedbat/coveragepy) from 7.5.4 to 7.6.1.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/nedbat/coveragepy/blob/master/CHANGES.rst">coverage's changelog</a>.</em></p>
<blockquote>
<h2>Version 7.6.1 — 2024-08-04</h2>
<ul>
<li>
<p>Fix: coverage used to fail when measuring code using :func:<code>runpy.run_path &lt;python:runpy.run_path&gt;</code> with a :class:<code>Path &lt;python:pathlib.Path&gt;</code> argument.
This is now fixed, thanks to <code>Ask Hjorth Larsen &lt;pull 1819_&gt;</code>_.</p>
</li>
<li>
<p>Fix: backslashes preceding a multi-line backslashed string could confuse the
HTML report.  This is now fixed, thanks to <code>LiuYinCarl &lt;pull 1828_&gt;</code>_.</p>
</li>
<li>
<p>Now we publish wheels for Python 3.13, both regular and free-threaded.</p>
</li>
</ul>
<p>.. _pull 1819: <a href="">nedbat/coveragepy#1819</a>
.. _pull 1828: <a href="">nedbat/coveragepy#1828</a></p>
<p>.. _changes_7-6-0:</p>
<h2>Version 7.6.0 — 2024-07-11</h2>
<ul>
<li>
<p>Exclusion patterns can now be multi-line, thanks to <code>Daniel Diniz &lt;pull 1807_&gt;</code><em>.  This enables many interesting exclusion use-cases, including those
requested in issues <code>118 &lt;issue 118_&gt;</code></em> (entire files), <code>996 &lt;issue 996_&gt;</code>_ (multiple lines only when appearing together), <code>1741 &lt;issue 1741_&gt;</code>_ (remainder of a function), and <code>1803 &lt;issue 1803_&gt;</code>_
(arbitrary sequence of marked lines).  See the :ref:<code>multi_line_exclude</code>
section of the docs for more details and examples.</p>
</li>
<li>
<p>The JSON report now includes per-function and per-class coverage information.
Thanks to <code>Daniel Diniz &lt;pull 1809_&gt;</code>_ for getting the work started. This
closes <code>issue 1793</code>_ and <code>issue 1532</code>_.</p>
</li>
<li>
<p>Fixed an incorrect calculation of &quot;(no class)&quot; lines in the HTML classes
report.</p>
</li>
<li>
<p>Python 3.13.0b3 is supported.</p>
</li>
</ul>
<p>.. _issue 118: <a href="">nedbat/coveragepy#118</a>
.. _issue 996: <a href="">nedbat/coveragepy#996</a>
.. _issue 1532: <a href="">nedbat/coveragepy#1532</a>
.. _issue 1741: <a href="">nedbat/coveragepy#1741</a>
.. _issue 1793: <a href="">nedbat/coveragepy#1793</a>
.. _issue 1803: <a href="">nedbat/coveragepy#1803</a>
.. _pull 1807: <a href="">nedbat/coveragepy#1807</a>
.. _pull 1809: <a href="">nedbat/coveragepy#1809</a></p>
<p>.. _changes_7-5-4:</p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>29f5898</code></a> docs: sample HTML for 7.6.1</li>
<li><a href=""><code>9b829f1</code></a> docs: prep for 7.6.1</li>
<li><a href=""><code>ebbb6a2</code></a> build: wheels for 3.13rc1</li>
<li><a href=""><code>3872525</code></a> chore: make upgrade</li>
<li><a href=""><code>7a27f40</code></a> test: fix a test on free-threading, use abiflags to get site-packages path co...</li>
<li><a href=""><code>2b53664</code></a> build: include gil/nogil in the version banner</li>
<li><a href=""><code>da1682f</code></a> docs: changelog and contributor for <a href="">#1828</a></li>
<li><a href=""><code>dc819ff</code></a> test: two tests for <a href="">#1828</a></li>
<li><a href=""><code>9aaa404</code></a> fix: properly handle backslash before multi-line string (<a href="">#1828</a>)</li>
<li><a href=""><code>9c50270</code></a> chore: make upgrade</li>
<li>Additional commits viewable in <a href="https://github.com/nedbat/coveragepy/compare/7.5.4...7.6.1">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=coverage&package-manager=pip&previous-version=7.5.4&new-version=7.6.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot merge` will merge this PR after your CI passes on it
- `@dependabot squash and merge` will squash and merge this PR after your CI passes on it
- `@dependabot cancel merge` will cancel a previously requested merge and block automerging
- `@dependabot reopen` will reopen this PR if it is closed
- `@dependabot close` will close this PR and stop Dependabot recreating it. You can achieve the same result by closing it manually
- `@dependabot show <dependency name> ignore conditions` will show all of the ignore conditions of the specified dependency
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `63055b465f55`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.