# Issue

**Title:** [dependabot]: Bump pip from 26.0.1 to 26.1

## Description

Bumps [pip](https://github.com/pypa/pip) from 26.0.1 to 26.1.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pypa/pip/blob/main/NEWS.rst">pip's changelog</a>.</em></p>
<blockquote>
<h1>26.1 (2026-04-26)</h1>
<h2>Deprecations and Removals</h2>
<ul>
<li>Drop support for Python 3.9. (<code> &lt;</code>_)</li>
</ul>
<h2>Features</h2>
<ul>
<li>Add experimental support to read requirements from standardized pylock.toml files (<code>-r pylock.toml</code>). (<code> &lt;</code>_)</li>
<li>Allow <code>--uploaded-prior-to</code> to accept a duration in days (e.g., <code>P3D</code> for 3 days ago). (<code> &lt;</code>_)</li>
</ul>
<h2>Enhancements</h2>
<ul>
<li>Speed up dependency resolution when there are complex conflicts. (<code> &lt;</code>_)</li>
<li>Reduce memory usage when resolving large dependency trees. (<code> &lt;</code>_)</li>
<li>Emit a deprecation warning when pip imports an unexpected module after
installation of a distribution has started. (<code> &lt;</code>_)</li>
<li>Allow URL constraints to apply to requirements with extras. (<code> &lt;</code>_)</li>
<li>Allow unpinned requirements to use hashes from constraints. Constraints
like <code>{name}=={version} --hash=...</code> feeds into hash verification for
a corresponding requirement. (<code> &lt;</code>_)</li>
<li>Improve conflict reports that involve direct URLs. (<code> &lt;</code>_)</li>
<li>Show all errors instead of first error for faulty <code>dependency_groups</code> definitions. (<code> &lt;</code>_)</li>
</ul>
<h2>Bug Fixes</h2>
<ul>
<li>Fix recovery hint for missing RECORD file to use <code>--ignore-installed</code>
instead of <code>--force-reinstall</code>. (<code> &lt;</code>_)</li>
<li>Fix misleading error message when a constraint file cannot be opened. (<code> &lt;</code>_)</li>
<li>Show the filename rather than the full URL when downloading files from non-PyPI indexes in non-verbose mode. (<code> &lt;</code>_)</li>
<li>Remove the adjacent <code>__pycache__</code> directory when a .py file is removed. (<code> &lt;</code>_)</li>
<li>Force UTF-8 encoding for :pep:<code>723</code> metadata. (<code> &lt;</code>_)</li>
<li>Minor performance improvement when filtering candidates during resolution. (<code> &lt;</code>_)</li>
<li>Fix a hang on Windows when stdout is closed during verbose output. (<code> &lt;</code>_)</li>
<li>Common path prefixes are determined by path segment, not character by character. (<code> &lt;</code>_)</li>
<li>Fix installing <code>.tar.gz</code> source distributions that look like a zip file. (<code> &lt;</code>_)</li>
</ul>
<h2>Vendored Libraries</h2>
<ul>
<li>Upgrade certifi to 2026.2.25</li>
<li>Upgrade packaging to 26.2</li>
<li>Upgrade requests to 2.33.1</li>
<li>Upgrade tomli to 2.3.1</li>
<li>Upgrade urllib3 to 2.6.3</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>90b2b3e</code></a> Bump for release</li>
<li><a href=""><code>193f289</code></a> Update AUTHORS.txt</li>
<li><a href=""><code>63c3709</code></a> Merge pull request <a href="">#13876</a> from sbidoul/install-from-pylock-reqs-sbi</li>
<li><a href=""><code>e5fe702</code></a> Merge pull request <a href="">#13949</a> from pypa/revert-13888-resolver-editable-links</li>
<li><a href=""><code>122a14a</code></a> Revert &quot;Allow editable installs to satisfy direct-URL dependencies (<a href="">#13888</a>)&quot;</li>
<li><a href=""><code>c335252</code></a> -r pylock.toml: add pip-wheel -r pylock.toml test</li>
<li><a href=""><code>ba2fc12</code></a> -r pylock.toml: proper error with remote pylock.toml containing directory ent...</li>
<li><a href=""><code>747c4ae</code></a> Merge pull request <a href="">#13948</a> from ichard26/reword-news</li>
<li><a href=""><code>3517841</code></a> -r pylock: refine filename pylock-ness test</li>
<li><a href=""><code>2f7ad8c</code></a> -r pylock.toml: fix crash with pip wheel and pip lock</li>
<li>Additional commits viewable in <a href="https://github.com/pypa/pip/compare/26.0.1...26.1">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pip&package-manager=uv&previous-version=26.0.1&new-version=26.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/mne-tools/mne-bids-pipeline/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9fc17d728771`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.