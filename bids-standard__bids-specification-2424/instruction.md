# Issue

**Title:** chore(deps): bump gitpython from 3.1.45 to 3.1.50

## Description

Bumps [gitpython](https://github.com/gitpython-developers/GitPython) from 3.1.45 to 3.1.50.
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
<h2>3.1.47 - with security fixes</h2>
<h2>Advisories</h2>
<ul>
<li><a href="https://github.com/gitpython-developers/GitPython/security/advisories/GHSA-rpm5-65cw-6hj4">https://github.com/gitpython-developers/GitPython/security/advisories/GHSA-rpm5-65cw-6hj4</a></li>
<li><a href="https://github.com/gitpython-developers/GitPython/security/advisories/GHSA-x2qx-6953-8485">https://github.com/gitpython-developers/GitPython/security/advisories/GHSA-x2qx-6953-8485</a></li>
</ul>
<h2>What's Changed</h2>
<ul>
<li>Prepare next release by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2095</a></li>
<li>Bump git/ext/gitdb from <code>335c0f6</code> to <code>4c63ee6</code> by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">gitpython-developers/GitPython#2096</a></li>
<li>DOC: README Add urls and updated a relative url by <a href="https://github.com/Timour-Ilyas"><code>@​Timour-Ilyas</code></a> in <a href="">gitpython-developers/GitPython#2098</a></li>
<li>Fix GitConfigParser ignoring multiple [include] path entries by <a href="https://github.com/daniel7an"><code>@​daniel7an</code></a> in <a href="">gitpython-developers/GitPython#2100</a></li>
<li>Switch back from Alpine to Debian for WSL by <a href="https://github.com/EliahKagan"><code>@​EliahKagan</code></a> in <a href="">gitpython-developers/GitPython#2108</a></li>
<li>Bump git/ext/gitdb from <code>4c63ee6</code> to <code>5c1b303</code> by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">gitpython-developers/GitPython#2106</a></li>
<li>Run <code>gc.collect()</code> twice in <code>test_rename</code> on Python 3.12 by <a href="https://github.com/EliahKagan"><code>@​EliahKagan</code></a> in <a href="">gitpython-developers/GitPython#2109</a></li>
<li>fix: guard AutoInterrupt terminate during interpreter shutdown by <a href="https://github.com/lweyrich1"><code>@​lweyrich1</code></a> in <a href="">gitpython-developers/GitPython#2105</a></li>
<li>Improve CI infrastructure for pre-commit by <a href="https://github.com/EliahKagan"><code>@​EliahKagan</code></a> in <a href="">gitpython-developers/GitPython#2110</a></li>
<li>Bump the pre-commit group with 5 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">gitpython-developers/GitPython#2111</a></li>
<li>Upgrade Sphinx for 3.14 support; drop doc build support on 3.8; test 3.14 by <a href="https://github.com/EliahKagan"><code>@​EliahKagan</code></a> in <a href="">gitpython-developers/GitPython#2112</a></li>
<li>Fix <code>Repo.active_branch</code> resolution for reftable-backed repositories by <a href="https://github.com/Copilot"><code>@​Copilot</code></a> in <a href="">gitpython-developers/GitPython#2114</a></li>
<li>docs: warn about GitDB performance with large commits by <a href="https://github.com/mvanhorn"><code>@​mvanhorn</code></a> in <a href="">gitpython-developers/GitPython#2115</a></li>
<li>cmd: fix kwarg formatting in docstring example by <a href="https://github.com/UweSchwaeke"><code>@​UweSchwaeke</code></a> in <a href="">gitpython-developers/GitPython#2117</a></li>
<li>Bump <a href="https://github.com/astral-sh/ruff-pre-commit">https://github.com/astral-sh/ruff-pre-commit</a> from v0.15.5 to 0.15.8 in the pre-commit group by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">gitpython-developers/GitPython#2122</a></li>
<li>Add trailer support for commit creation by <a href="https://github.com/Krishnachaitanyakc"><code>@​Krishnachaitanyakc</code></a> in <a href="">gitpython-developers/GitPython#2116</a></li>
<li>Harden commit trailer subprocess handling and align trailer I/O paths by <a href="https://github.com/Copilot"><code>@​Copilot</code></a> in <a href="">gitpython-developers/GitPython#2125</a></li>
<li>git.cmd.Git.execute(..): fix <code>with_stdout=False</code> by <a href="https://github.com/ngie-eign"><code>@​ngie-eign</code></a> in <a href="">gitpython-developers/GitPython#2126</a></li>
<li>Make sure that multi-options are checked after splitting them with <code>shlex</code> by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2130</a></li>
<li>Block unsafe underscored git kwargs / Fix for GHSA-rpm5-65cw-6hj4 by <a href="https://github.com/WesR"><code>@​WesR</code></a> in <a href="">gitpython-developers/GitPython#2131</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/Timour-Ilyas"><code>@​Timour-Ilyas</code></a> made their first contribution in <a href="">gitpython-developers/GitPython#2098</a></li>
<li><a href="https://github.com/daniel7an"><code>@​daniel7an</code></a> made their first contribution in <a href="">gitpython-developers/GitPython#2100</a></li>
<li><a href="https://github.com/lweyrich1"><code>@​lweyrich1</code></a> made their first contribution in <a href="">gitpython-developers/GitPython#2105</a></li>
<li><a href="https://github.com/Copilot"><code>@​Copilot</code></a> made their first contribution in <a href="">gitpython-developers/GitPython#2114</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
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
<li>Additional commits viewable in <a href="https://github.com/gitpython-developers/GitPython/compare/3.1.45...3.1.50">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=gitpython&package-manager=uv&previous-version=3.1.45&new-version=3.1.50)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

You can trigger a rebase of this PR by commenting `@dependabot rebase`.

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/bids-standard/bids-specification/network/alerts).

</details>

> **Note**
> Automatic rebases have been disabled on this pull request as it has been open for over 30 days.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f637dc697033`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.