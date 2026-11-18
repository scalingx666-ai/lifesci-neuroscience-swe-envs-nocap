# Issue

**Title:** Bump coverage from 7.6.1 to 7.6.3

## Description

Bumps [coverage](https://github.com/nedbat/coveragepy) from 7.6.1 to 7.6.3.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/nedbat/coveragepy/blob/master/CHANGES.rst">coverage's changelog</a>.</em></p>
<blockquote>
<h2>Version 7.6.3 — 2024-10-13</h2>
<ul>
<li>
<p>Fix: nested context managers could incorrectly be analyzed to flag a missing
branch on the last context manager, as described in <code>issue 1876</code>_.  This is
now fixed.</p>
</li>
<li>
<p>Fix: the missing branch message about not exiting a module had an extra
&quot;didn't,&quot; as described in <code>issue 1873</code>_.  This is now fixed.</p>
</li>
</ul>
<p>.. _issue 1873: <a href="">nedbat/coveragepy#1873</a>
.. _issue 1876: <a href="">nedbat/coveragepy#1876</a></p>
<p>.. _changes_7-6-2:</p>
<h2>Version 7.6.2 — 2024-10-09</h2>
<ul>
<li>
<p>Dropped support for Python 3.8 and PyPy 3.8.</p>
</li>
<li>
<p>Fix: a final wildcard match/case clause assigning to a name (<code>case _ as value</code>) was incorrectly marked as a missing branch.  This is now fixed,
closing <code>issue 1860</code>_.</p>
</li>
<li>
<p>Fewer things are considered branches now. Lambdas, comprehensions, and
generator expressions are no longer marked as missing branches if they don't
complete execution.  Closes <code>issue 1852</code>_.</p>
</li>
<li>
<p>Fix: the HTML report didn't properly show multi-line f-strings that end with
a backslash continuation.  This is now fixed, closing <code>issue 1836</code><em>, thanks
to <code>LiuYinCarl and Marco Ricci &lt;pull 1838_&gt;</code></em>.</p>
</li>
<li>
<p>Fix: the LCOV report now has correct line numbers (fixing <code>issue 1846</code><em>) and
better branch descriptions for BRDA records (fixing <code>issue 1850</code></em>).  There
are other changes to lcov also, including a new configuration option
:ref:<code>line_checksums &lt;config_lcov_line_checksums&gt;</code> to control whether line
checksums are included in the lcov report.  The default is false. To keep
checksums set it to true.  All this work is thanks to Zack Weinberg
(<code>pull 1849</code>_ and <code>pull 1851</code>_).</p>
</li>
<li>
<p>Fixed the docs for multi-line regex exclusions, closing <code>issue 1863</code>_.</p>
</li>
<li>
<p>Fixed a potential crash in the C tracer, closing <code>issue 1835</code><em>, thanks to
<code>Jan Kühle &lt;pull 1843_&gt;</code></em>.</p>
</li>
</ul>
<p>.. _issue 1835: <a href="">nedbat/coveragepy#1835</a>
.. _issue 1836: <a href="">nedbat/coveragepy#1836</a>
.. _pull 1838: <a href="">nedbat/coveragepy#1838</a>
.. _pull 1843: <a href="">nedbat/coveragepy#1843</a></p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>342a4cb</code></a> docs: sample HTML for 7.6.3</li>
<li><a href=""><code>df03796</code></a> docs: prep for 7.6.3</li>
<li><a href=""><code>378c321</code></a> fix: nested context managers shouldn't cause a phantom missing branch <a href="">#1876</a></li>
<li><a href=""><code>c8902ed</code></a> build: pypy 3.9 doesn't seem to be available nightly</li>
<li><a href=""><code>c59a77b</code></a> docs(build): put a header on the GitHub releases</li>
<li><a href=""><code>65ac395</code></a> docs: fix a link in the changes</li>
<li><a href=""><code>2d3e72c</code></a> docs: add coverage-simple-excludes to the docs</li>
<li><a href=""><code>474a363</code></a> fix: didn't-ectomy. <a href="">#1873</a></li>
<li><a href=""><code>5229fc3</code></a> docs: mention 1852 is fixed</li>
<li><a href=""><code>6a4506f</code></a> build(docs): upgrade doc dependencies</li>
<li>Additional commits viewable in <a href="https://github.com/nedbat/coveragepy/compare/7.6.1...7.6.3">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=coverage&package-manager=pip&previous-version=7.6.1&new-version=7.6.3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9bf2cfe3416c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.