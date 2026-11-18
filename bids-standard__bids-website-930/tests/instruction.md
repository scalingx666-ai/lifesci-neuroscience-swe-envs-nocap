# Issue

**Title:** Bump gitpython from 3.1.59 to 3.1.62

## Description

Bumps [gitpython](https://github.com/gitpython-developers/GitPython) from 3.1.59 to 3.1.62.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/gitpython-developers/GitPython/releases">gitpython's releases</a>.</em></p>
<blockquote>
<h2>3.1.62</h2>
<h2>What's Changed</h2>
<ul>
<li>prepare next release by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2222</a></li>
<li>Keep bare-repository worktrees non-bare by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2224</a></li>
<li>Reject unsafe submodule checkout paths by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2225</a></li>
<li>build(deps): bump <a href="https://github.com/astral-sh/ruff-pre-commit">https://github.com/astral-sh/ruff-pre-commit</a> from v0.16.0 to 0.16.5 in the pre-commit group by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">gitpython-developers/GitPython#2226</a></li>
<li>fix: join backslash line continuations when reading config values by <a href="https://github.com/nkbeast"><code>@​nkbeast</code></a> in <a href="">gitpython-developers/GitPython#2227</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/nkbeast"><code>@​nkbeast</code></a> made their first contribution in <a href="">gitpython-developers/GitPython#2227</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/gitpython-developers/GitPython/compare/3.1.61...3.1.62">https://github.com/gitpython-developers/GitPython/compare/3.1.61...3.1.62</a></p>
<h2>3.1.61</h2>
<p>Fix accidental removal of exploitable regex in <code>Actor</code> by bringing it back, and deprecating it.</p>
<h2>What's Changed</h2>
<ul>
<li>Fix repository discovery precedence by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2218</a></li>
<li>fix: wait for git daemon to listen before connecting by <a href="https://github.com/Vogtinator"><code>@​Vogtinator</code></a> in <a href="">gitpython-developers/GitPython#2219</a></li>
<li>fix: restore Actor.name_email_regex by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2221</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/Vogtinator"><code>@​Vogtinator</code></a> made their first contribution in <a href="">gitpython-developers/GitPython#2219</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/gitpython-developers/GitPython/compare/3.1.60...3.1.61">https://github.com/gitpython-developers/GitPython/compare/3.1.60...3.1.61</a></p>
<h2>3.1.60 Security</h2>
<h2>What's Changed</h2>
<ul>
<li>prepare changelog prior to release by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2212</a></li>
<li>Preserve Git config escape semantics by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2213</a></li>
<li>Harden diff path and actor identity parsing by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2215</a></li>
<li>Require explicit opt-in for filesystem diffs by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2217</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/gitpython-developers/GitPython/compare/3.1.59...3.1.60">https://github.com/gitpython-developers/GitPython/compare/3.1.59...3.1.60</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>db47516</code></a> prepare new release</li>
<li><a href=""><code>10ec385</code></a> get better commit messages from agents</li>
<li><a href=""><code>b754897</code></a> test: cover subdirectory discovery and pathspec commands in bare-repo worktre...</li>
<li><a href=""><code>9ebf8b6</code></a> Merge pull request <a href="">#2227</a> from nkbeast/fix-config-backslash-continuation</li>
<li><a href=""><code>a15f791</code></a> fix: parse joined config values as a whole</li>
<li><a href=""><code>60dd946</code></a> fix: ignore continuation markers in config comments</li>
<li><a href=""><code>075a664</code></a> fix: join backslash line continuations when reading config values</li>
<li><a href=""><code>62d1e2f</code></a> Merge pull request <a href="">#2226</a> from gitpython-developers/dependabot/pre_commit/pre-...</li>
<li><a href=""><code>23d0e92</code></a> build(deps): bump <a href="https://github.com/astral-sh/ruff-pre-commit">https://github.com/astral-sh/ruff-pre-commit</a></li>
<li><a href=""><code>8a14adc</code></a> Merge pull request <a href="">#2225</a> from gitpython-developers/submodule-path-hardening</li>
<li>Additional commits viewable in <a href="https://github.com/gitpython-developers/GitPython/compare/3.1.59...3.1.62">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=gitpython&package-manager=uv&previous-version=3.1.59&new-version=3.1.62)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
📚 Documentation preview 📚: https://bids-website--930.org.readthedocs.build/en/930/

<!-- readthedocs-preview bids-website end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7f563063967e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.