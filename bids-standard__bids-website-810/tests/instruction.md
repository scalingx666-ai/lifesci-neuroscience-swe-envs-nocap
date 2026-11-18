# Issue

**Title:** Bump cairosvg from 2.8.2 to 2.9.0

## Description

Bumps [cairosvg](https://github.com/Kozea/CairoSVG) from 2.8.2 to 2.9.0.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/Kozea/CairoSVG/blob/main/NEWS.rst">cairosvg's changelog</a>.</em></p>
<blockquote>
<h1>Version 2.9.0 released on 2026-03-13</h1>
<p><strong>WARNING:</strong> this is a security update.</p>
<p>Using a lot of recursively nested use tags could lead to long rendering times with
relatively small inputs. CairoSVG now stops rendering when more than 100k use tags are
rendered.</p>
<p>Using the --unsafe option allows to render larger documents.</p>
<ul>
<li>Drop support of Python 3.9, add support of Python 3.14</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>fe5cae5</code></a> Version 2.9.0</li>
<li><a href=""><code>6dde868</code></a> Abort when more than 100k referenced elements are rendered</li>
<li><a href=""><code>a6b3a98</code></a> Cut long line again</li>
<li><a href=""><code>ce8b51d</code></a> Cut long line</li>
<li><a href=""><code>b7818c9</code></a> Clarify unsafe option scope without removing security warning</li>
<li>See full diff in <a href="https://github.com/Kozea/CairoSVG/compare/2.8.2...2.9.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=cairosvg&package-manager=uv&previous-version=2.8.2&new-version=2.9.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
📚 Documentation preview 📚: https://bids-website--810.org.readthedocs.build/en/810/

<!-- readthedocs-preview bids-website end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `470bda4039a2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.