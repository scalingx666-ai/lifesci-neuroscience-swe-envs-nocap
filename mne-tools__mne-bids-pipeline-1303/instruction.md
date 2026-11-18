# Issue

**Title:** [dependabot]: Bump pip from 26.1.2 to 26.2

## Description

Bumps [pip](https://github.com/pypa/pip) from 26.1.2 to 26.2.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pypa/pip/blob/main/NEWS.rst">pip's changelog</a>.</em></p>
<blockquote>
<h1>26.2 (2026-07-29)</h1>
<h2>Deprecations and Removals</h2>
<ul>
<li>
<p>Newly published packages will no longer be immediately visible to pip
if the index uses caching. To install a newly published package, use
<code>--refresh-package</code>. (<code> &lt;</code>_)</p>
</li>
<li>
<p>Drop support for detecting legacy, non-:pep:<code>405</code>, <code>virtualenv</code> (&lt; 20)
environments. (<code> &lt;</code>_)</p>
</li>
<li>
<p>Constraints files, including <code>PIP_CONSTRAINT</code>, no longer affect isolated
build environments. Use <code>--build-constraint</code> or the <code>PIP_BUILD_CONSTRAINT</code>
environment variable to constrain build dependencies instead.</p>
<p>The <code>--use-feature=build-constraint</code> flag is now always enabled and has no
effect. (<code> &lt;</code>_)</p>
</li>
</ul>
<h2>Features</h2>
<ul>
<li>
<p>Declare support for Python 3.15 (<code> &lt;</code>_)</p>
</li>
<li>
<p>Support self-referential extras officially. pip has supported this by accident since version 21.2. (<code> &lt;</code>_)</p>
</li>
<li>
<p>Add <code>--only-deps</code> flag to instruct pip to select only the dependencies
of supplied packages. It cannot be used with <code>--no-deps</code>, <code>-r</code>, <code>--group</code>,
or <code>--requirements-from-script</code>. (<code> &lt;</code>_)</p>
</li>
<li>
<p>Cache simple responses in accordance to their <code>Cache-Control</code> header
instead of always revalidating on every request. To refresh cached package index responses
and ensure newly published packages are found, use <code>--refresh-package &lt;package&gt;</code>. (<code> &lt;</code>_)</p>
</li>
<li>
<p>Add <code>--no-require-hashes</code> to disable automatic enablement of
<code>--require-hashes</code> when encountering a requirement with hashes. (<code> &lt;</code>_)</p>
</li>
<li>
<p>Honor <code>--only-final</code> when sourcing requirements with <code>-r pylock.toml</code>. (<code> &lt;</code>_)</p>
</li>
<li>
<p>Add support for <code>pylock.toml</code> <code>upload-time</code> field, so <code>--uploaded-prior-to</code> works with <code>-r pylock.toml</code>. (<code> &lt;</code>_)</p>
</li>
<li>
<p>Better error messages in case of conflicts with requirements from <code>-r pylock.toml</code>. (<code> &lt;</code>_)</p>
</li>
<li>
<p>Add experimental support for isolating build subprocesses by creating standard
virtual environments. This will fix most (if not all) subtle isolation issues
that can lead to broken builds exclusive to pip. The feature can be enabled
via <code>--use-feature=venv-isolation</code> and will be enabled by default in a future
release.</p>
<p>Note that the feature has limited compatibility with <code>--use-feature=inprocess-build-deps</code>.
While most builds should work with both features enabled, there are known edge cases.
<code>inprocess-build-deps</code> will not be enabled by default until they are fixed. (<code> &lt;</code>_)</p>
</li>
<li>
<p>Present more informative diagnostic errors on uncaught network errors. (<code> &lt;</code>_)</p>
</li>
<li>
<p>Allow opting out of Git partial clones with <code>PIP_NO_PARTIAL_CLONE_FOR_BROKEN_GIT_SERVER</code>. (<code> &lt;</code>_)</p>
</li>
<li>
<p>Add a <code>--no-proxy-env</code> (or <code>--proxy &quot;&quot;</code>) option to ignore proxies
configured via non-pip environment variables or configuration files.
A proxy set with <code>--proxy</code> is still used. (<code> &lt;</code>_)</p>
</li>
<li>
<p>Add support for pulling username from keyring subprocess provider (<code> &lt;</code>_)</p>
</li>
<li>
<p>Speedup tab autocompletion by lazy-importing certain modules. (<code> &lt;</code>_)</p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>4b6ae5c</code></a> Bump for release</li>
<li><a href=""><code>50b6d3c</code></a> Update AUTHORS.txt</li>
<li><a href=""><code>dbddfbd</code></a> Tweak news entries for pip 26.2 (<a href="">#14212</a>)</li>
<li><a href=""><code>6576b75</code></a> Merge pull request <a href="">#14165</a> from sbidoul/refactor-pylock-hanling-sbi</li>
<li><a href=""><code>0090e00</code></a> Address a variety of typos detected in code review</li>
<li><a href=""><code>e12ddd9</code></a> Add support for --uploaded-prior-to with -r pylock.toml</li>
<li><a href=""><code>5eefdbc</code></a> Better conflict report for requirements from -r pylock.toml</li>
<li><a href=""><code>6d71ff8</code></a> Test --only-final with -r pylock.toml</li>
<li><a href=""><code>e7d6eb9</code></a> Refactor -r pylock.toml</li>
<li><a href=""><code>756506d</code></a> Add TODO about pylock.select and --no-binary</li>
<li>Additional commits viewable in <a href="https://github.com/pypa/pip/compare/26.1.2...26.2">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pip&package-manager=uv&previous-version=26.1.2&new-version=26.2)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7c0d934b26b3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.