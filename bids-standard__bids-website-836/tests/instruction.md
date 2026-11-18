# Issue

**Title:** Bump gitpython from 3.1.47 to 3.1.49

## Description

Bumps [gitpython](https://github.com/gitpython-developers/GitPython) from 3.1.47 to 3.1.49.
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
<li><a href=""><code>aee2fd5</code></a> bump version to 3.1.49</li>
<li><a href=""><code>1c4ea96</code></a> Merge pull request <a href="">#2136</a> from gitpython-developers/copilot/create-reproducing...</li>
<li><a href=""><code>6cf7ac3</code></a> Address rev-parse review feedback</li>
<li><a href=""><code>b049a13</code></a> Merge pull request <a href="">#2137</a> from gitpython-developers/fix-config-injection</li>
<li><a href=""><code>bdbdf4b</code></a> Fix rev-parse CI issues</li>
<li><a href=""><code>d7ce6fc</code></a> Improve pure Python rev-parse coverage and behavior (<a href="">#2135</a>)</li>
<li><a href=""><code>8e24503</code></a> avoid duplicate validation in set_value</li>
<li><a href=""><code>c417af4</code></a> reject control chars in written values in configuration</li>
<li><a href=""><code>5a15361</code></a> a new release with safer reference creation</li>
<li><a href=""><code>dbfa264</code></a> Merge pull request <a href="">#2134</a> from gitpython-developers/validate-ref-creation</li>
<li>Additional commits viewable in <a href="https://github.com/gitpython-developers/GitPython/compare/3.1.47...3.1.49">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=gitpython&package-manager=uv&previous-version=3.1.47&new-version=3.1.49)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
📚 Documentation preview 📚: https://bids-website--836.org.readthedocs.build/en/836/

<!-- readthedocs-preview bids-website end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2d14f6f96c2e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.