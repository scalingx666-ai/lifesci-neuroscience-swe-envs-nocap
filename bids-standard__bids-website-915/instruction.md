# Issue

**Title:** Bump gitpython from 3.1.58 to 3.1.59

## Description

Bumps [gitpython](https://github.com/gitpython-developers/GitPython) from 3.1.58 to 3.1.59.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/gitpython-developers/GitPython/releases">gitpython's releases</a>.</em></p>
<blockquote>
<h2>3.1.59 - Security</h2>
<h2>What's Changed</h2>
<ul>
<li>prepare changelog for upcoming release by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2207</a></li>
<li>Block file-reading Git options by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2208</a></li>
<li>index: write blobs via git hash-object, not gitdb's odb.store by <a href="https://github.com/caroescm"><code>@​caroescm</code></a> in <a href="">gitpython-developers/GitPython#2209</a></li>
<li>Block separate git directories during clone by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2210</a></li>
<li>fix: harden config parsing boundaries by <a href="https://github.com/Byron"><code>@​Byron</code></a> in <a href="">gitpython-developers/GitPython#2211</a></li>
<li><code>repo.index.add()</code> now respects worktree filters  <a href="">gitpython-developers/GitPython#2209</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/gitpython-developers/GitPython/compare/3.1.58...3.1.59">https://github.com/gitpython-developers/GitPython/compare/3.1.58...3.1.59</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>66340d7</code></a> prepare changelog prior to release</li>
<li><a href=""><code>a5e047d</code></a> Merge pull request <a href="">#2211</a> from gitpython-developers/config-sanitize-more</li>
<li><a href=""><code>ef7568e</code></a> fix: ignore includes in submodule configuration</li>
<li><a href=""><code>4b4e47f</code></a> fix: preserve multiline config values when writing</li>
<li><a href=""><code>b473abb</code></a> Merge pull request <a href="">#2210</a> from gitpython-developers/fix-clone-unsafe-option</li>
<li><a href=""><code>5ff52cc</code></a> Merge pull request <a href="">#2209</a> from caroescm/fix-index-add-chmod</li>
<li><a href=""><code>b68afff</code></a> Block separate git directories during clone</li>
<li><a href=""><code>93677a0</code></a> fix: <code>index.add()</code> now supports filters (<a href="">#2021</a>)</li>
<li><a href=""><code>9729ed3</code></a> Merge pull request <a href="">#2208</a> from gitpython-developers/security-fixes</li>
<li><a href=""><code>ce9d8e8</code></a> prepare next release</li>
<li>Additional commits viewable in <a href="https://github.com/gitpython-developers/GitPython/compare/3.1.58...3.1.59">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=gitpython&package-manager=uv&previous-version=3.1.58&new-version=3.1.59)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
📚 Documentation preview 📚: https://bids-website--915.org.readthedocs.build/en/915/

<!-- readthedocs-preview bids-website end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `850cdc8606be`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.