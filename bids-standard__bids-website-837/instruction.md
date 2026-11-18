# Issue

**Title:** Bump gitpython from 3.1.49 to 3.1.50

## Description

Bumps [gitpython](https://github.com/gitpython-developers/GitPython) from 3.1.49 to 3.1.50.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/gitpython-developers/GitPython/releases">gitpython's releases</a>.</em></p>
<blockquote>
<h2>3.1.50</h2>
<h2>What's Changed</h2>
<ul>
<li>Bump <a href="https://github.com/astral-sh/ruff-pre-commit">https://github.com/astral-sh/ruff-pre-commit</a> from v0.15.8 to 0.15.12 in the pre-commit group by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">gitpython-developers/GitPython#2140</a></li>
<li>Bump git/ext/gitdb from <code>335c0f6</code> to <code>53c94d6</code> by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">gitpython-developers/GitPython#2141</a></li>
<li>Fix Repo() autodiscovery in linked worktrees when GIT_DIR is set by <a href="https://github.com/meliezer"><code>@​meliezer</code></a> in <a href="">gitpython-developers/GitPython#2128</a></li>
<li>Validate config key names before writing by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2142</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/meliezer"><code>@​meliezer</code></a> made their first contribution in <a href="">gitpython-developers/GitPython#2128</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/gitpython-developers/GitPython/compare/3.1.49...3.1.50">https://github.com/gitpython-developers/GitPython/compare/3.1.49...3.1.50</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>5a294a6</code></a> bump version to 3.1.50</li>
<li><a href=""><code>d7b029f</code></a> Merge pull request <a href="">#2142</a> from gitpython-developers/fix-validate-config-key-ne...</li>
<li><a href=""><code>5453842</code></a> Validate config key section names before writing</li>
<li><a href=""><code>1085a7c</code></a> Merge pull request <a href="">#2128</a> from meliezer/fix-worktree-git-dir</li>
<li><a href=""><code>b7f5fde</code></a> Merge pull request <a href="">#2141</a> from gitpython-developers/dependabot/submodules/git/...</li>
<li><a href=""><code>4e8cd45</code></a> Bump git/ext/gitdb from <code>335c0f6</code> to <code>53c94d6</code></li>
<li><a href=""><code>9e94459</code></a> Merge pull request <a href="">#2140</a> from gitpython-developers/dependabot/pre_commit/pre-...</li>
<li><a href=""><code>714e2e1</code></a> Xfail Windows symlink-capable index mutation test</li>
<li><a href=""><code>b17f113</code></a> Bump <a href="https://github.com/astral-sh/ruff-pre-commit">https://github.com/astral-sh/ruff-pre-commit</a></li>
<li><a href=""><code>4c6ec60</code></a> fix: support Repo() autodiscovery from linked worktree GIT_DIR</li>
<li>See full diff in <a href="https://github.com/gitpython-developers/GitPython/compare/3.1.49...3.1.50">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=gitpython&package-manager=uv&previous-version=3.1.49&new-version=3.1.50)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/bids-standard/bids-website/network/alerts).

</details>

<!-- readthedocs-preview bids-website start -->
----
📚 Documentation preview 📚: https://bids-website--837.org.readthedocs.build/en/837/

<!-- readthedocs-preview bids-website end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `809f8c33f4c6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.