# Issue

**Title:** Bump ujson from 5.12.1 to 5.13.0

## Description

Bumps [ujson](https://github.com/ultrajson/ultrajson) from 5.12.1 to 5.13.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/ultrajson/ultrajson/releases">ujson's releases</a>.</em></p>
<blockquote>
<h2>5.13.0</h2>
<h2>Added</h2>
<ul>
<li>Create manylinux2014 wheels (<a href="">#745</a>) <a href="https://github.com/hugovk"><code>@​hugovk</code></a></li>
<li>Add support for Python 3.15 (<a href="">#742</a>) <a href="https://github.com/hugovk"><code>@​hugovk</code></a></li>
<li>Disable global interpreter lock for freethreading (<a href="">#737</a>) <a href="https://github.com/bwoodsend"><code>@​bwoodsend</code></a></li>
<li>Re-enable building GraalPy wheels on macOS arm64 (<a href="">#733</a>) <a href="https://github.com/timfel"><code>@​timfel</code></a></li>
</ul>
<h2>Changed</h2>
<ul>
<li>Move metadata from <code>setup.cfg</code> to <code>pyproject.toml</code> (<a href="">#736</a>) <a href="https://github.com/hugovk"><code>@​hugovk</code></a></li>
</ul>
<h2>Fixed</h2>
<ul>
<li>Tighten UTF-8 validation for <code>ujson.dumps(b&quot;...&quot;, reject_bytes=False)</code> (169eaf36b1116fece5034ee79a7a0ef3f6deedcf) <a href="https://github.com/bwoodsend"><code>@​bwoodsend</code></a></li>
<li>Replace generated <code>version.h</code> with macro (<a href="">#735</a>) <a href="https://github.com/hugovk"><code>@​hugovk</code></a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>1a23a68</code></a> Create manylinux2014 wheels (<a href="">#745</a>)</li>
<li><a href=""><code>bd943e8</code></a> Build separate manylinux2014 + modern wheels</li>
<li><a href=""><code>87ae2df</code></a> Create manylinux2014 wheels</li>
<li><a href=""><code>209371e</code></a> Verify expected number of dists (<a href="">#743</a>)</li>
<li><a href=""><code>6392258</code></a> Also check SHA of wheels in case manylinux version changes</li>
<li><a href=""><code>a00edea</code></a> Verify expected number of dists</li>
<li><a href=""><code>e24aeb7</code></a> Fix utf-8 test for graalpy</li>
<li><a href=""><code>9122ebe</code></a> Replace pre-commit with prek to fix deprecation warning (<a href="">#744</a>)</li>
<li><a href=""><code>0bbf9a3</code></a> Add support for Python 3.15 (<a href="">#742</a>)</li>
<li><a href=""><code>90ddea2</code></a> Replace pre-commit with prek to fix deprecation warning</li>
<li>Additional commits viewable in <a href="https://github.com/ultrajson/ultrajson/compare/5.12.1...5.13.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=ujson&package-manager=uv&previous-version=5.12.1&new-version=5.13.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/psychopy/psychopy/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4d550dcd63a0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.