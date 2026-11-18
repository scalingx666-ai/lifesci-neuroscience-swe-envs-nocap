# Issue

**Title:** Bump virtualenv from 20.35.4 to 20.36.1

## Description

Bumps [virtualenv](https://github.com/pypa/virtualenv) from 20.35.4 to 20.36.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pypa/virtualenv/releases">virtualenv's releases</a>.</em></p>
<blockquote>
<h2>20.36.1</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>release 20.36.0 by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">pypa/virtualenv#3011</a></li>
<li>fix: resolve TOCTOU vulnerabilities in app_data and lock directory creation by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">pypa/virtualenv#3013</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/pypa/virtualenv/compare/20.36.0...20.36.1">https://github.com/pypa/virtualenv/compare/20.36.0...20.36.1</a></p>
<h2>20.36.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>release 20.35.3 by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">pypa/virtualenv#2981</a></li>
<li>fix: Prevent NameError when accessing _DISTUTILS_PATCH during file ov… by <a href="https://github.com/gracetyy"><code>@​gracetyy</code></a> in <a href="">pypa/virtualenv#2982</a></li>
<li>Upgrade pip and fix 3.15 picking old wheel by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">pypa/virtualenv#2989</a></li>
<li>release 20.35.4 by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">pypa/virtualenv#2990</a></li>
<li>fix: wrong path on migrated venv by <a href="https://github.com/sk1234567891"><code>@​sk1234567891</code></a> in <a href="">pypa/virtualenv#2996</a></li>
<li>test_too_many_open_files: assert on <code>errno.EMFILE</code> instead of <code>strerror</code> by <a href="https://github.com/pltrz"><code>@​pltrz</code></a> in <a href="">pypa/virtualenv#3001</a></li>
<li>fix: update filelock dependency version to 3.20.1 to fix CVE CVE-2025-68146 by <a href="https://github.com/pythonhubdev"><code>@​pythonhubdev</code></a> in <a href="">pypa/virtualenv#3002</a></li>
<li>fix: resolve EncodingWarning in tox upgrade environment by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">pypa/virtualenv#3007</a></li>
<li>Fix Interpreter discovery bug wrt. Microsoft Store shortcut using Latin-1 by <a href="https://github.com/rahuldevikar"><code>@​rahuldevikar</code></a> in <a href="">pypa/virtualenv#3006</a></li>
<li>Add support for PEP 440 version specifiers in the <code>--python</code> flag. by <a href="https://github.com/rahuldevikar"><code>@​rahuldevikar</code></a> in <a href="">pypa/virtualenv#3008</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/gracetyy"><code>@​gracetyy</code></a> made their first contribution in <a href="">pypa/virtualenv#2982</a></li>
<li><a href="https://github.com/sk1234567891"><code>@​sk1234567891</code></a> made their first contribution in <a href="">pypa/virtualenv#2996</a></li>
<li><a href="https://github.com/pltrz"><code>@​pltrz</code></a> made their first contribution in <a href="">pypa/virtualenv#3001</a></li>
<li><a href="https://github.com/pythonhubdev"><code>@​pythonhubdev</code></a> made their first contribution in <a href="">pypa/virtualenv#3002</a></li>
<li><a href="https://github.com/rahuldevikar"><code>@​rahuldevikar</code></a> made their first contribution in <a href="">pypa/virtualenv#3006</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/pypa/virtualenv/compare/20.35.3...20.36.0">https://github.com/pypa/virtualenv/compare/20.35.3...20.36.0</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pypa/virtualenv/blob/main/docs/changelog.rst">virtualenv's changelog</a>.</em></p>
<blockquote>
<h2>v20.36.1 (2026-01-09)</h2>
<p>Bugfixes - 20.36.1</p>
<pre><code>- Fix TOCTOU vulnerabilities in app_data and lock directory creation that could be exploited via symlink attacks - reported by :user:`tsigouris007`, fixed by :user:`gaborbernat`. (:issue:`3013`)
<h2>v20.36.0 (2026-01-07)</h2>
<p>Features - 20.36.0
</code></pre></p>
<ul>
<li>Add support for PEP 440 version specifiers in the <code>--python</code> flag. Users can now specify Python versions using operators like <code>&gt;=</code>, <code>&lt;=</code>, <code>~=</code>, etc. For example: <code>virtualenv --python=&quot;&gt;=3.12&quot; myenv</code> <code>. (:issue:</code>2994`)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>d0ad11d</code></a> release 20.36.1</li>
<li><a href=""><code>dec4cec</code></a> Merge pull request <a href="">#3013</a> from gaborbernat/fix-sec</li>
<li><a href=""><code>5fe5d38</code></a> release 20.36.0 (<a href="">#3011</a>)</li>
<li><a href=""><code>9719376</code></a> release 20.36.0</li>
<li><a href=""><code>0276db6</code></a> Add support for PEP 440 version specifiers in the <code>--python</code> flag. (<a href="">#3008</a>)</li>
<li><a href=""><code>4f900c2</code></a> Fix Interpreter discovery bug wrt. Microsoft Store shortcut using Latin-1 (<a href="">#3</a>...</li>
<li><a href=""><code>13afcc6</code></a> fix: resolve EncodingWarning in tox upgrade environment (<a href="">#3007</a>)</li>
<li><a href=""><code>31b5d31</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#2997</a>)</li>
<li><a href=""><code>7c28422</code></a> fix: update filelock dependency version to 3.20.1 to fix CVE CVE-2025-68146 (...</li>
<li><a href=""><code>365628c</code></a> test_too_many_open_files: assert on <code>errno.EMFILE</code> instead of <code>strerror</code> (<a href="">#3001</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pypa/virtualenv/compare/20.35.4...20.36.1">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=virtualenv&package-manager=pip&previous-version=20.35.4&new-version=20.36.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/BindsNET/bindsnet/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3ebc263ba4d3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.