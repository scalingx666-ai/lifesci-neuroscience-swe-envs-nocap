# Issue

**Title:** Bump sphinx-toolbox from 3.5.0 to 3.6.0

## Description

Bumps [sphinx-toolbox](https://github.com/sphinx-toolbox/sphinx-toolbox) from 3.5.0 to 3.6.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/sphinx-toolbox/sphinx-toolbox/releases">sphinx-toolbox's releases</a>.</em></p>
<blockquote>
<h2>Version 3.6.0</h2>
<p>Automatically copied from <a href="https://pypi.org/project/sphinx-toolbox/3.6.0">PyPI</a>.</p>
<hr />
<p>Powered by OctoCheese<br />
<a href="https://octocheese.readthedocs.io">📝 docs</a> | <a href="https://github.com/domdfcoding/octocheese">:octocat: repo</a> | <a href="https://github.com/domdfcoding/octocheese/issues">🙋 issues</a> | <a href="https://github.com/marketplace/octocheese">🏪 marketplace</a></p>
<!-- raw HTML omitted -->
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/sphinx-toolbox/sphinx-toolbox/blob/master/doc-source/changelog.rst">sphinx-toolbox's changelog</a>.</em></p>
<blockquote>
<h2>3.6.0</h2>
<ul>
<li>Documentation fixes in :mod:<code>~.collapse</code>.</li>
<li>Dunder methods added in Python 3.13 are hidden by :mod:<code>~.autoprotocol</code> (<code>__non_callable_proto_members__</code>, <code>__firstlineno__</code>, <code>__replace__</code>, <code>__static_attributes__</code>)</li>
<li>mod:<code>~.autoprotocol</code> doesn't document subclasses of protocols, unless :class:<code>~.Protocol</code> is one of their direct base classes.</li>
<li>Support for Sphinx 7.x</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>06db47d</code></a> Bump version v3.5.0 -&gt; v3.6.0</li>
<li><a href=""><code>5e3f87b</code></a> Cleanup tox.ini and formate.toml</li>
<li><a href=""><code>8aff4df</code></a> Updated files with 'repo_helper'. (<a href="">#164</a>)</li>
<li><a href=""><code>687a561</code></a> Skip genericalias.html test on Python 3.13 for now as the link to pathlib.Pat...</li>
<li><a href=""><code>e82803f</code></a> Exclude new Python 3.13 dunder methods in tests</li>
<li><a href=""><code>d226d4b</code></a> Exclude new Python 3.13 dunder methods in autoprotocol</li>
<li><a href=""><code>0920b7b</code></a> Update reference templates.</li>
<li><a href=""><code>45c71f3</code></a> Handle recursive_guard change to ForwardRef._evaluate</li>
<li><a href=""><code>108531f</code></a> Specialcase typing.Self in typehints.py</li>
<li><a href=""><code>2632ca9</code></a> Don't treat subclasses of protocols as protocols for autoprotocol.</li>
<li>Additional commits viewable in <a href="https://github.com/sphinx-toolbox/sphinx-toolbox/compare/v3.5.0...v3.6.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=sphinx-toolbox&package-manager=pip&previous-version=3.5.0&new-version=3.6.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `90d6e5d06107`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.