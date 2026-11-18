# Issue

**Title:** Bump fsspec from 2025.9.0 to 2026.6.0

## Description

Bumps [fsspec](https://github.com/fsspec/filesystem_spec) from 2025.9.0 to 2026.6.0.
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>a245700</code></a> changelog (<a href="">#2049</a>)</li>
<li><a href=""><code>652325d</code></a> Fix async cat ranges on error (<a href="">#2045</a>)</li>
<li><a href=""><code>073aac8</code></a> Forward kwargs from cat_ranges to cat_file (<a href="">#2044</a>)</li>
<li><a href=""><code>2818611</code></a> FTP: preserve filenames containing whitespace in _mlsd2 (<a href="">#2043</a>)</li>
<li><a href=""><code>c879384</code></a> Prevent attribute error by checking for 'forced' attribute before flushing ca...</li>
<li><a href=""><code>71b8a6b</code></a> Reflect async _walk correctly (<a href="">#2040</a>)</li>
<li><a href=""><code>5eec9f9</code></a> Fix: Omit <code>threading.get_ident()</code> from cache token for async implementations ...</li>
<li><a href=""><code>8643878</code></a> Small safety improvements (<a href="">#2039</a>)</li>
<li><a href=""><code>a1c16ab</code></a> Honour simple_templates everywhere in referenceFS (<a href="">#2029</a>)</li>
<li><a href=""><code>85facaa</code></a> Fix infinite recursion in expand_path when resolving paths with glob magic ch...</li>
<li>Additional commits viewable in <a href="https://github.com/fsspec/filesystem_spec/compare/2025.9.0...2026.6.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=fsspec&package-manager=uv&previous-version=2025.9.0&new-version=2026.6.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
📚 Documentation preview 📚: https://bids-website--935.org.readthedocs.build/en/935/

<!-- readthedocs-preview bids-website end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4bfef4993818`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.