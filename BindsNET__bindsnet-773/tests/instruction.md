# Issue

**Title:** Bump gitpython from 3.1.50 to 3.1.52

## Description

Bumps [gitpython](https://github.com/gitpython-developers/GitPython) from 3.1.50 to 3.1.52.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/gitpython-developers/GitPython/releases">gitpython's releases</a>.</em></p>
<blockquote>
<h2>3.1.52 Security</h2>
<p><a href="https://github.com/gitpython-developers/GitPython/security/advisories/GHSA-rwj8-pgh3-r573">https://github.com/gitpython-developers/GitPython/security/advisories/GHSA-rwj8-pgh3-r573</a>: Environment-variable exfiltration via os.path.expandvars() on Repo.clone_from() URL</p>
<h2>What's Changed</h2>
<ul>
<li>Skip cross-drive relative config test on Windows by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2171</a></li>
<li>fix: preserve literal clone URLs by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2172</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/gitpython-developers/GitPython/compare/3.1.51...3.1.52">https://github.com/gitpython-developers/GitPython/compare/3.1.51...3.1.52</a></p>
<h2>3.1.51 - Security</h2>
<h2>What's Changed</h2>
<ul>
<li>Add AI-disclosure and quality requirements to the contribution guidelines by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2143</a></li>
<li>docs(cmd): clarify Git.execute() string vs list command argument by <a href="https://github.com/mvanhorn"><code>@​mvanhorn</code></a> in <a href="">gitpython-developers/GitPython#2144</a></li>
<li>Rewrite Git.execute() command parameter docstring per <a href="">#2146</a> by <a href="https://github.com/EliahKagan"><code>@​EliahKagan</code></a> in <a href="">gitpython-developers/GitPython#2147</a></li>
<li>Document init script behavior with multiple master remotes by <a href="https://github.com/EliahKagan"><code>@​EliahKagan</code></a> in <a href="">gitpython-developers/GitPython#2148</a></li>
<li>Bump git/ext/gitdb from <code>335c0f6</code> to <code>0a019a2</code> by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">gitpython-developers/GitPython#2149</a></li>
<li>Support relative worktree paths (git 2.48+ worktree.useRelativePaths) by <a href="https://github.com/elovelan"><code>@​elovelan</code></a> in <a href="">gitpython-developers/GitPython#2151</a></li>
<li>Defer xfail condition evaluation with xfail_if_raises context manager by <a href="https://github.com/elovelan"><code>@​elovelan</code></a> in <a href="">gitpython-developers/GitPython#2153</a></li>
<li>Run more submodule tests on Cygwin (fix flaky xfails) by <a href="https://github.com/EliahKagan"><code>@​EliahKagan</code></a> in <a href="">gitpython-developers/GitPython#2154</a></li>
<li>Cut xtrace noise from POSIX-ownership diagnostic steps by <a href="https://github.com/EliahKagan"><code>@​EliahKagan</code></a> in <a href="">gitpython-developers/GitPython#2156</a></li>
<li>Support index diffs against the empty tree by <a href="https://github.com/puneetdixit200"><code>@​puneetdixit200</code></a> in <a href="">gitpython-developers/GitPython#2155</a></li>
<li>refactor: seperate out Progress type by <a href="https://github.com/LoeschMaximilian"><code>@​LoeschMaximilian</code></a> in <a href="">gitpython-developers/GitPython#2157</a></li>
<li>Bump <a href="https://github.com/astral-sh/ruff-pre-commit">https://github.com/astral-sh/ruff-pre-commit</a> from v0.15.12 to 0.15.15 in the pre-commit group by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">gitpython-developers/GitPython#2160</a></li>
<li>Bump actions/checkout from 6 to 7 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">gitpython-developers/GitPython#2164</a></li>
<li>Bump git/ext/gitdb from <code>0a019a2</code> to <code>4950ea9</code> by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">gitpython-developers/GitPython#2165</a></li>
<li>Bump <a href="https://github.com/astral-sh/ruff-pre-commit">https://github.com/astral-sh/ruff-pre-commit</a> from v0.15.15 to 0.15.20 in the pre-commit group by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">gitpython-developers/GitPython#2166</a></li>
<li>Add Commit.is_shallow property; document stats() limitation at shallow boundary by <a href="https://github.com/harshitayadavv"><code>@​harshitayadavv</code></a> in <a href="">gitpython-developers/GitPython#2167</a></li>
<li>Allow relative config paths with includes by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2169</a></li>
<li>Reject abbreviated forms of unsafe git options by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2168</a></li>
<li>guard unsafe git command options by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2163</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/elovelan"><code>@​elovelan</code></a> made their first contribution in <a href="">gitpython-developers/GitPython#2151</a></li>
<li><a href="https://github.com/puneetdixit200"><code>@​puneetdixit200</code></a> made their first contribution in <a href="">gitpython-developers/GitPython#2155</a></li>
<li><a href="https://github.com/LoeschMaximilian"><code>@​LoeschMaximilian</code></a> made their first contribution in <a href="">gitpython-developers/GitPython#2157</a></li>
<li><a href="https://github.com/harshitayadavv"><code>@​harshitayadavv</code></a> made their first contribution in <a href="">gitpython-developers/GitPython#2167</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/gitpython-developers/GitPython/compare/3.1.50...3.1.51">https://github.com/gitpython-developers/GitPython/compare/3.1.50...3.1.51</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>f8b6df5</code></a> bump patch level prior to release</li>
<li><a href=""><code>c65dfb3</code></a> Merge pull request <a href="">#2172</a> from gitpython-developers/fix-clone-expandvars</li>
<li><a href=""><code>8ac5a30</code></a> fix: prevent environment expansion in clone URLs</li>
<li><a href=""><code>7a46dfc</code></a> Merge pull request <a href="">#2171</a> from gitpython-developers/fix-windows-tests</li>
<li><a href=""><code>67082d6</code></a> test: skip relative config include across Windows drives</li>
<li><a href=""><code>7b0764d</code></a> bump to v3.1.51</li>
<li><a href=""><code>af027be</code></a> Merge pull request <a href="">#2163</a> from gitpython-developers/fix-unguarded-blame</li>
<li><a href=""><code>701ce32</code></a> fix: Guard unsafe git command options (GHSA-956x-8gvw-wg5v)</li>
<li><a href=""><code>65a7283</code></a> Merge pull request <a href="">#2168</a> from gitpython-developers/advisory-fix-1</li>
<li><a href=""><code>3e59876</code></a> Merge pull request <a href="">#2169</a> from gitpython-developers/fix-config-assert</li>
<li>Additional commits viewable in <a href="https://github.com/gitpython-developers/GitPython/compare/3.1.50...3.1.52">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=gitpython&package-manager=pip&previous-version=3.1.50&new-version=3.1.52)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6bb0ad18fd25`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.