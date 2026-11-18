# Issue

**Title:** Bump filelock from 3.19.1 to 3.20.3

## Description

Bumps [filelock](https://github.com/tox-dev/py-filelock) from 3.19.1 to 3.20.3.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/py-filelock/releases">filelock's releases</a>.</em></p>
<blockquote>
<h2>3.20.3</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>Fix TOCTOU symlink vulnerability in SoftFileLock by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#465</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.20.2...3.20.3">https://github.com/tox-dev/filelock/compare/3.20.2...3.20.3</a></p>
<h2>3.20.2</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>Support Unix systems without O_NOFOLLOW by <a href="https://github.com/mwilliamson"><code>@​mwilliamson</code></a> in <a href="">tox-dev/filelock#463</a></li>
<li>[pre-commit.ci] pre-commit autoupdate by <a href="https://github.com/pre-commit-ci"><code>@​pre-commit-ci</code></a>[bot] in <a href="">tox-dev/filelock#464</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/mwilliamson"><code>@​mwilliamson</code></a> made their first contribution in <a href="">tox-dev/filelock#463</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.20.1...3.20.2">https://github.com/tox-dev/filelock/compare/3.20.1...3.20.2</a></p>
<h2>3.20.1</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>CVE-2025-68146: Fix TOCTOU symlink vulnerability in lock file creation by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#461</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.20.0...3.20.1">https://github.com/tox-dev/filelock/compare/3.20.0...3.20.1</a></p>
<h2>3.20.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>Add tox.toml to sdist by <a href="https://github.com/mtelka"><code>@​mtelka</code></a> in <a href="">tox-dev/filelock#436</a></li>
<li>Update docs with example by <a href="https://github.com/znichollscr"><code>@​znichollscr</code></a> in <a href="">tox-dev/filelock#438</a></li>
<li>Add 3.14 support and drop 3.9 by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#448</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/mtelka"><code>@​mtelka</code></a> made their first contribution in <a href="">tox-dev/filelock#436</a></li>
<li><a href="https://github.com/znichollscr"><code>@​znichollscr</code></a> made their first contribution in <a href="">tox-dev/filelock#438</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.19.1...3.20.0">https://github.com/tox-dev/filelock/compare/3.19.1...3.20.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>41b42dd</code></a> Fix TOCTOU symlink vulnerability in SoftFileLock (<a href="">#465</a>)</li>
<li><a href=""><code>f2e7d40</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#464</a>)</li>
<li><a href=""><code>5088854</code></a> Support Unix systems without O_NOFOLLOW (<a href="">#463</a>)</li>
<li><a href=""><code>377f622</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#460</a>)</li>
<li><a href=""><code>4724d7f</code></a> Fix TOCTOU symlink vulnerability in lock file creation (<a href="">#461</a>)</li>
<li><a href=""><code>cb69414</code></a> Bump actions/upload-artifact from 5 to 6 (<a href="">#459</a>)</li>
<li><a href=""><code>0769294</code></a> Bump actions/download-artifact from 6 to 7 (<a href="">#458</a>)</li>
<li><a href=""><code>414193a</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#457</a>)</li>
<li><a href=""><code>1456797</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#456</a>)</li>
<li><a href=""><code>8d6bf90</code></a> Bump actions/checkout from 5 to 6 (<a href="">#455</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/tox-dev/py-filelock/compare/3.19.1...3.20.3">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=filelock&package-manager=uv&previous-version=3.19.1&new-version=3.20.3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/ME-ICA/tedana/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `58d8a02ad6f0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.