# Issue

**Title:** Bump coverage from 7.6.12 to 7.7.0

## Description

Bumps [coverage](https://github.com/nedbat/coveragepy) from 7.6.12 to 7.7.0.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/nedbat/coveragepy/blob/master/CHANGES.rst">coverage's changelog</a>.</em></p>
<blockquote>
<h2>Version 7.7.0 — 2025-03-16</h2>
<ul>
<li>
<p>The Coverage object has a new method, :meth:<code>.Coverage.branch_stats</code> for
getting simple branch information for a module.  Closes <code>issue 1888</code>_.</p>
</li>
<li>
<p>The :class:<code>Coverage constructor&lt;.Coverage&gt;</code> now has a <code>plugins</code> parameter
for passing in plugin objects directly, thanks to <code>Alex Gaynor &lt;pull 1919_&gt;</code>_.</p>
</li>
<li>
<p>Many constant tests in if statements are now recognized as being optimized
away.  For example, previously <code>if 13:</code> would have been considered a branch
with one path not taken.  Now it is understood as always true and no coverage
is missing.</p>
</li>
<li>
<p>The experimental sys.monitoring support now works for branch coverage if you
are using Python 3.14.0 alpha 6 or newer.  This should reduce the overhead
coverage.py imposes on your test suite. Set the environment variable
<code>COVERAGE_CORE=sysmon</code> to try it out.</p>
</li>
<li>
<p>Confirmed support for PyPy 3.11. Thanks Michał Górny.</p>
</li>
</ul>
<p>.. _issue 1888: <a href="">nedbat/coveragepy#1888</a>
.. _pull 1919: <a href="">nedbat/coveragepy#1919</a></p>
<p>.. _changes_7-6-12:</p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>61dcf71</code></a> docs: sample HTML for 7.7.0</li>
<li><a href=""><code>35a31c5</code></a> docs: prep for 7.7.0</li>
<li><a href=""><code>8f6e006</code></a> docs: edit the changelog</li>
<li><a href=""><code>33f12df</code></a> feat: Coverage.branch_stats() <a href="">#1888</a></li>
<li><a href=""><code>c4919cb</code></a> lint: somehow these snuck through</li>
<li><a href=""><code>7e9f2f2</code></a> perf(sysmon): silly mistake</li>
<li><a href=""><code>1e99d28</code></a> perf(sysmon): improve speed</li>
<li><a href=""><code>c9908d7</code></a> test: benchmark improvements</li>
<li><a href=""><code>0973f44</code></a> chore: bump the action-dependencies group with 2 updates (<a href="">#1935</a>)</li>
<li><a href=""><code>824b3ba</code></a> style: fix one change from updated pylint</li>
<li>Additional commits viewable in <a href="https://github.com/nedbat/coveragepy/compare/7.6.12...7.7.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=coverage&package-manager=pip&previous-version=7.6.12&new-version=7.7.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3ba71fdd8359`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.