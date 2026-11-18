# Issue

**Title:** Bump cairosvg from 2.9.0 to 2.9.1

## Description

Bumps [cairosvg](https://github.com/Kozea/CairoSVG) from 2.9.0 to 2.9.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/Kozea/CairoSVG/releases">cairosvg's releases</a>.</em></p>
<blockquote>
<h2>2.9.1</h2>
<p><strong>WARNING</strong>: this is a security update.</p>
<p>Specially crafted SVGs with very long paths could lead to exponential rendering times.</p>
<ul>
<li>Support path-like objects for the url parameter</li>
<li>Fix support of Windows paths</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/Kozea/CairoSVG/blob/main/NEWS.rst">cairosvg's changelog</a>.</em></p>
<blockquote>
<h1>Version 2.9.1 released on 2026-09-07</h1>
<p><strong>WARNING:</strong> this is a security update.</p>
<p>Specially crafted SVGs with very long paths could lead to exponential rendering times.</p>
<ul>
<li>Support path-like objects for the url parameter</li>
<li>Fix support of Windows paths</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>3b7a250</code></a> Version 2.9.1</li>
<li><a href=""><code>9d63f04</code></a> Use a regex-based tokenizer for paths to avoid quadratic compexity</li>
<li><a href=""><code>a4d585e</code></a> Don’t use O(n) list.pop(0) for vertices, use O(1) deque.popleft()</li>
<li><a href=""><code>026fbce</code></a> Merge pull request <a href="">#449</a> from SAY-5/feat/url-pathlike</li>
<li><a href=""><code>6eaa366</code></a> feat(url): accept path-like objects for the url parameter</li>
<li><a href=""><code>0613641</code></a> Cut long line</li>
<li><a href=""><code>50fdfe8</code></a> Merge pull request <a href="">#447</a> from BudongJW/fix/resub-positional-flags</li>
<li><a href=""><code>278c227</code></a> Fix re.sub positional argument in nt_compatible_path</li>
<li><a href=""><code>6075040</code></a> Cut long line</li>
<li><a href=""><code>babf3df</code></a> Fix CI</li>
<li>See full diff in <a href="https://github.com/Kozea/CairoSVG/compare/2.9.0...2.9.1">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=cairosvg&package-manager=uv&previous-version=2.9.0&new-version=2.9.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
📚 Documentation preview 📚: https://bids-website--936.org.readthedocs.build/en/936/

<!-- readthedocs-preview bids-website end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4bfef4993818`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.