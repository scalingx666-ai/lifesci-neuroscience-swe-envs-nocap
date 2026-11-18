# Issue

**Title:** Bump gitpython from 3.1.47 to 3.1.50

## Description

Bumps [gitpython](https://github.com/gitpython-developers/GitPython) from 3.1.47 to 3.1.50.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/gitpython-developers/GitPython/releases">gitpython's releases</a>.</em></p>
<blockquote>
<h2>3.1.49 - Security</h2>
<h2>What's Changed</h2>
<ul>
<li>reject control chars in written values in configuration by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2137</a></li>
<li>Improve pure Python rev-parse coverage and behavior  by <a href="https://github.com/Copilot"><code>@​Copilot</code></a> in <a href="">gitpython-developers/GitPython#2136</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/gitpython-developers/GitPython/compare/3.1.48...3.1.49">https://github.com/gitpython-developers/GitPython/compare/3.1.48...3.1.49</a></p>
<h2>3.1.48 - Security</h2>
<p>Accidentally deleted the previous GH release, it did mention the advisory this fixes.</p>
<h2>What's Changed</h2>
<ul>
<li>prevent out-of-repo access when manipulating references. by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2134</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/gitpython-developers/GitPython/compare/3.1.47...3.1.48">https://github.com/gitpython-developers/GitPython/compare/3.1.47...3.1.48</a></p>
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
<li><a href=""><code>aee2fd5</code></a> bump version to 3.1.49</li>
<li>Additional commits viewable in <a href="https://github.com/gitpython-developers/GitPython/compare/3.1.47...3.1.50">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=gitpython&package-manager=pip&previous-version=3.1.47&new-version=3.1.50)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/BindsNET/bindsnet/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `34ee2920cf3b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.