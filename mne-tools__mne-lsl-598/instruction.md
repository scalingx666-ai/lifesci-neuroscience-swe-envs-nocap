# Issue

**Title:** Bump pypa/cibuildwheel from 4.3.1 to 4.3.4

## Description

Bumps [pypa/cibuildwheel](https://github.com/pypa/cibuildwheel) from 4.3.1 to 4.3.4.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pypa/cibuildwheel/releases">pypa/cibuildwheel's releases</a>.</em></p>
<blockquote>
<h2>v4.3.4</h2>
<ul>
<li>🔐 Warns when a uv build frontend is selected and the host uv is older than 0.13.4, which still trusts the compromised eMudhra CA roots (<a href="">#3021</a>)</li>
<li>🔐 Uses cibuildwheel's CA bundle for pip on Python 3.9, where pip uses its bundled certifi, which still trusts the compromised eMudhra roots (<a href="">#3017</a>)</li>
<li>🔐 Uses cibuildwheel's CA bundle for pip on GraalPy, where truststore is not supported (<a href="">#3019</a>)</li>
<li>🔐 Uses cibuildwheel's CA bundle in Android, iOS, and Pyodide cross venvs, where pip uses the host's OpenSSL CA file (<a href="">#3020</a>)</li>
<li>🐛 Seeds build's isolated environment with the pinned pip on macOS and Windows, fixing GraalPy 25.0 builds (<a href="">#3018</a>)</li>
<li>💼 Stops Azure cache growth from <code>restoreKeys</code> (<a href="">#3022</a>)</li>
</ul>
<h2>v4.3.3</h2>
<ul>
<li>🔐 Updates manylinux images and pip to fix vulnerability to <a href="https://emudhra.we-have-a-problem.com/">eMudhra</a>.</li>
</ul>
<h2>v4.3.2</h2>
<ul>
<li>🔐 Updates our dependency pins to certifi==2026.10.19, following the <a href="https://emudhra.we-have-a-problem.com/">eMudhra Intermediate CA Compromise</a>. Linux builds may still be vulnerable through manylinux images - a patch release will soon follow if so.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pypa/cibuildwheel/blob/main/docs/changelog.md">pypa/cibuildwheel's changelog</a>.</em></p>
<blockquote>
<h3>v4.3.4</h3>
<p><em>22 October 2026</em></p>
<ul>
<li>🔐 Warns when a uv build frontend is selected and the host uv is older than 0.13.4, which still trusts the compromised eMudhra CA roots (<a href="">#3021</a>)</li>
<li>🔐 Uses cibuildwheel's CA bundle for pip on Python 3.9, where pip uses its bundled certifi, which still trusts the compromised eMudhra roots (<a href="">#3017</a>)</li>
<li>🔐 Uses cibuildwheel's CA bundle for pip on GraalPy, where truststore is not supported (<a href="">#3019</a>)</li>
<li>🔐 Uses cibuildwheel's CA bundle in Android, iOS, and Pyodide cross venvs, where pip uses the host's OpenSSL CA file (<a href="">#3020</a>)</li>
<li>🐛 Seeds build's isolated environment with the pinned pip on macOS and Windows, fixing GraalPy 25.0 builds (<a href="">#3018</a>)</li>
<li>💼 Stops Azure cache growth from <code>restoreKeys</code> (<a href="">#3022</a>)</li>
</ul>
<h3>v4.3.3</h3>
<p><em>21 October 2026</em></p>
<ul>
<li>🔐 Updates manylinux images and pip to fix vulnerability to <a href="https://emudhra.we-have-a-problem.com/">eMudhra</a>.</li>
</ul>
<h3>v4.3.2</h3>
<p><em>20 October 2026</em></p>
<ul>
<li>🔐 Updates our dependency pins to certifi==2026.10.19, following the <a href="https://emudhra.we-have-a-problem.com/">eMudhra Intermediate CA Compromise</a>. Linux builds may still be vulnerable through manylinux images - a patch release will soon follow if so.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b9e566a</code></a> Bump version: v4.3.4</li>
<li><a href=""><code>0d511ac</code></a> fix: use cibuildwheel's CA bundle in cross venvs (<a href="">#3020</a>)</li>
<li><a href=""><code>d6c9b11</code></a> feat: warn when uv is too old to have the eMudhra CA fix (<a href="">#3021</a>)</li>
<li><a href=""><code>4463120</code></a> fix: seed build's isolated env with the pinned pip (<a href="">#3018</a>)</li>
<li><a href=""><code>6d4911a</code></a> fix: use cibuildwheel's CA bundle for pip on GraalPy (<a href="">#3019</a>)</li>
<li><a href=""><code>54d1a6f</code></a> ci: stop Azure cache growth from restoreKeys (<a href="">#3022</a>)</li>
<li><a href=""><code>5891574</code></a> fix: use cibuildwheel's CA bundle for pip on Python 3.9 (<a href="">#3017</a>)</li>
<li><a href=""><code>8c2dcd2</code></a> Bump version: v4.3.3</li>
<li><a href=""><code>56459e6</code></a> [Bot] Update dependencies (<a href="">#3012</a>)</li>
<li><a href=""><code>afd09e6</code></a> chore(deps): bump the actions group with 4 updates (<a href="">#3013</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pypa/cibuildwheel/compare/v4.3.1...v4.3.4">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pypa/cibuildwheel&package-manager=github_actions&previous-version=4.3.1&new-version=4.3.4)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c4184155f0c9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.