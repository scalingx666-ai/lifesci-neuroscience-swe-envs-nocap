# Issue

**Title:** Bump coverage from 7.7.0 to 7.8.0

## Description

Bumps [coverage](https://github.com/nedbat/coveragepy) from 7.7.0 to 7.8.0.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/nedbat/coveragepy/blob/master/CHANGES.rst">coverage's changelog</a>.</em></p>
<blockquote>
<h2>Version 7.8.0 — 2025-03-30</h2>
<ul>
<li>
<p>Added a new <code>source_dirs</code> setting for symmetry with the existing
<code>source_pkgs</code> setting. It's preferable to the existing <code>source</code> setting,
because you'll get a clear error when directories don't exist. Fixes <code>issue 1942</code><em>.  Thanks, <code>Jeremy Fleischman &lt;pull 1943_&gt;</code></em>.</p>
</li>
<li>
<p>Fix: the PYTHONSAFEPATH environment variable new in Python 3.11 is properly
supported, closing <code>issue 1696</code><em>.  Thanks, <code>Philipp A. &lt;pull 1700_&gt;</code></em>.  This
works properly except for a detail when using the <code>coverage</code> command on
Windows.  There you can use <code>python -m coverage</code> instead if you need exact
emulation.</p>
</li>
</ul>
<p>.. _issue 1696: <a href="">nedbat/coveragepy#1696</a>
.. _pull 1700: <a href="">nedbat/coveragepy#1700</a>
.. _issue 1942: <a href="">nedbat/coveragepy#1942</a>
.. _pull 1943: <a href="">nedbat/coveragepy#1943</a></p>
<p>.. _changes_7-7-1:</p>
<h2>Version 7.7.1 — 2025-03-21</h2>
<ul>
<li>A few small tweaks to the sys.monitoring support for Python 3.14.  Please
test!</li>
</ul>
<p>.. _changes_7-7-0:</p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>6d5ced9</code></a> docs: sample HTML for 7.8.0</li>
<li><a href=""><code>49c194f</code></a> docs: prep for 7.8.0</li>
<li><a href=""><code>38782cb</code></a> docs: finish up source_dirs. bump to 7.8.0</li>
<li><a href=""><code>7aea2f3</code></a> feat: add new <code>source_dirs</code> option (<a href="">#1943</a>)</li>
<li><a href=""><code>f464155</code></a> test: some simple bytecode tests</li>
<li><a href=""><code>cf1dec0</code></a> refactor: these pypy modules are available in all our versions</li>
<li><a href=""><code>a876052</code></a> test: a general helper for iterating over our own source files</li>
<li><a href=""><code>82cff3e</code></a> perf: sets are better than lists</li>
<li><a href=""><code>a66bd61</code></a> refactor: move bytecode code into bytecode.py</li>
<li><a href=""><code>d64ce5f</code></a> chore: bump the action-dependencies group with 3 updates (<a href="">#1940</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/nedbat/coveragepy/compare/7.7.0...7.8.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=coverage&package-manager=pip&previous-version=7.7.0&new-version=7.8.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8361936b8616`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.