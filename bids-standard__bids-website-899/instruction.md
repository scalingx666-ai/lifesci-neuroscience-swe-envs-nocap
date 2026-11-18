# Issue

**Title:** Bump gitpython from 3.1.57 to 3.1.58

## Description

Bumps [gitpython](https://github.com/gitpython-developers/GitPython) from 3.1.57 to 3.1.58.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/gitpython-developers/GitPython/releases">gitpython's releases</a>.</em></p>
<blockquote>
<h2>Security and Fixes</h2>
<h2>What's Changed</h2>
<ul>
<li>test: allow Python startup before timeout by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2195</a></li>
<li>Resolve Windows hook Bash through PATH by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2199</a></li>
<li>Revert &quot;Resolve Windows hook Bash through PATH&quot; by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2200</a></li>
<li>test: focus pytest summary on unexpected failures by <a href="https://github.com/raisulchowdhury"><code>@​raisulchowdhury</code></a> in <a href="">gitpython-developers/GitPython#2203</a></li>
<li>Validate submodule names before filesystem operations by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2202</a></li>
<li>Handle invalid submodule names during recursive updates by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2205</a></li>
<li>Fix Windows path handling on Python 3.13+ by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2196</a></li>
<li>fixup 2202 by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2206</a></li>
<li>Correct Windows hook Bash precedence by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2201</a></li>
<li>Harden config and Git option validation by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2204</a></li>
<li>Skip tests that need symlink privileges instead of erroring by <a href="https://github.com/Cyrus580529"><code>@​Cyrus580529</code></a> in <a href="">gitpython-developers/GitPython#2197</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/raisulchowdhury"><code>@​raisulchowdhury</code></a> made their first contribution in <a href="">gitpython-developers/GitPython#2203</a></li>
<li><a href="https://github.com/Cyrus580529"><code>@​Cyrus580529</code></a> made their first contribution in <a href="">gitpython-developers/GitPython#2197</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/gitpython-developers/GitPython/compare/3.1.57...3.1.58">https://github.com/gitpython-developers/GitPython/compare/3.1.57...3.1.58</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>30be45d</code></a> prepare changelog for upcoming release</li>
<li><a href=""><code>fc2f02c</code></a> Merge pull request <a href="">#2197</a> from Cyrus580529/shared-symlink-guard</li>
<li><a href=""><code>b10e250</code></a> test: use the shared guard instead of local copies</li>
<li><a href=""><code>e3e5da8</code></a> test: skip tests that need symlink privileges</li>
<li><a href=""><code>30d05e3</code></a> test: add a shared symlink capability guard</li>
<li><a href=""><code>9a8f6fe</code></a> Merge pull request <a href="">#2204</a> from gitpython-developers/security-fixes</li>
<li><a href=""><code>f2550b6</code></a> Guard pathspec file inputs in high-level commands</li>
<li><a href=""><code>d9ddb55</code></a> Guard unsafe git init options</li>
<li><a href=""><code>9b5dcaf</code></a> Guard read-tree index output paths</li>
<li><a href=""><code>96a888f</code></a> Check joined short-option values before Git execution</li>
<li>Additional commits viewable in <a href="https://github.com/gitpython-developers/GitPython/compare/3.1.57...3.1.58">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=gitpython&package-manager=uv&previous-version=3.1.57&new-version=3.1.58)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
📚 Documentation preview 📚: https://bids-website--899.org.readthedocs.build/en/899/

<!-- readthedocs-preview bids-website end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1cf6bc1efaa5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.