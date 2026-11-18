# Issue

**Title:** Bump tqdm from 4.64.1 to 4.66.3 in /tvb_library

## Description

Bumps [tqdm](https://github.com/tqdm/tqdm) from 4.64.1 to 4.66.3.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tqdm/tqdm/releases">tqdm's releases</a>.</em></p>
<blockquote>
<h2>tqdm v4.66.3 stable</h2>
<ul>
<li><code>cli</code>: <code>eval</code> safety (fixes CVE-2024-34062, GHSA-g7vv-2v7x-gj9p)</li>
</ul>
<h2>tqdm v4.66.2 stable</h2>
<ul>
<li><code>pandas</code>: add <code>DataFrame.progress_map</code> (<a href="">#1549</a>)</li>
<li><code>notebook</code>: fix HTML padding (<a href="">#1506</a>)</li>
<li><code>keras</code>: fix resuming training when <code>verbose&gt;=2</code> (<a href="">#1508</a>)</li>
<li>fix <code>format_num</code> negative fractions missing leading zero (<a href="">#1548</a>)</li>
<li>fix Python 3.12 <code>DeprecationWarning</code> on <code>import</code> (<a href="">#1519</a>)</li>
<li>linting: use f-strings (<a href="">#1549</a>)</li>
<li>update tests (<a href="">#1549</a>)
<ul>
<li>fix <code>pandas</code> warnings</li>
<li>fix <code>asv</code> (<a href="">airspeed-velocity/asv#1323</a>)</li>
<li>fix macos <code>notebook</code> docstring indentation</li>
</ul>
</li>
<li>CI: bump actions (<a href="">#1549</a>)</li>
</ul>
<h2>tqdm v4.66.1 stable</h2>
<ul>
<li>fix <code>utils.envwrap</code> types (<a href="">#1493</a> &lt;- <a href="">#1491</a>, <a href="">#1320</a> &lt;- <a href="">#966</a>, <a href="">#1319</a>)
<ul>
<li>e.g. cloudwatch &amp; kubernetes workaround: <code>export TQDM_POSITION=-1</code></li>
</ul>
</li>
<li>drop mentions of unsupported Python versions</li>
</ul>
<h2>tqdm v4.66.0 stable</h2>
<ul>
<li>environment variables to override defaults (<code>TQDM_*</code>) (<a href="">#1491</a> &lt;- <a href="">#1061</a>, <a href="">#950</a> &lt;- <a href="">#614</a>, <a href="">#1318</a>, <a href="">#619</a>, <a href="">#612</a>, <a href="">#370</a>)
<ul>
<li>e.g. in CI jobs, <code>export TQDM_MININTERVAL=5</code> to avoid log spam</li>
<li>add tests &amp; docs for <code>tqdm.utils.envwrap</code></li>
</ul>
</li>
<li>fix &amp; update CLI completion</li>
<li>fix &amp; update API docs</li>
<li>minor code tidy: replace <code>os.path</code> =&gt; <code>pathlib.Path</code></li>
<li>fix docs image hosting</li>
<li>release with CI bot account again (<a href="">cli/cli#6680</a>)</li>
</ul>
<h2>tqdm v4.65.2 stable</h2>
<ul>
<li>exclude <code>examples</code> from distributed wheel (<a href="">#1492</a>)</li>
</ul>
<h2>tqdm v4.65.1 stable</h2>
<ul>
<li>migrate <code>setup.{cfg,py}</code> =&gt; <code>pyproject.toml</code> (<a href="">#1490</a>)
<ul>
<li>fix <code>asv</code> benchmarks</li>
<li>update docs</li>
</ul>
</li>
<li>fix snap build (<a href="">#1490</a>)</li>
<li>fix &amp; update tests (<a href="">#1490</a>)
<ul>
<li>fix flaky notebook tests</li>
<li>bump <code>pre-commit</code></li>
<li>bump workflow actions</li>
</ul>
</li>
</ul>
<h2>tqdm v4.65.0 stable</h2>
<ul>
<li>add Python 3.11 and drop Python 3.6 support (<a href="">#1439</a>, <a href="">#1419</a>, <a href="">#502</a> &lt;- <a href="">#720</a>, <a href="">#620</a>)</li>
<li>misc code &amp; docs tidy</li>
<li>fix &amp; update CI workflows &amp; tests</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>4e613f8</code></a> Merge pull request from GHSA-g7vv-2v7x-gj9p</li>
<li><a href=""><code>b53348c</code></a> cli: eval safety</li>
<li><a href=""><code>cc372d0</code></a> bump version, merge pull request <a href="">#1549</a> from tqdm/devel</li>
<li><a href=""><code>e9f0c05</code></a> use PyPI trusted publishing</li>
<li><a href=""><code>7323d5b</code></a> slight makefile clean</li>
<li><a href=""><code>5306125</code></a> tests: bump pre-commit</li>
<li><a href=""><code>4a6fd4f</code></a> fix datetime.utcfromtimestamp py3.12 warning (<a href="">#1519</a>)</li>
<li><a href=""><code>6f13759</code></a> tests: fix macos notebook indentation</li>
<li><a href=""><code>3abcd2a</code></a> tests: fix asv</li>
<li><a href=""><code>a4d15c8</code></a> tests: fix pandas warnings</li>
<li>Additional commits viewable in <a href="https://github.com/tqdm/tqdm/compare/v4.64.1...v4.66.3">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=tqdm&package-manager=pip&previous-version=4.64.1&new-version=4.66.3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot merge` will merge this PR after your CI passes on it
- `@dependabot squash and merge` will squash and merge this PR after your CI passes on it
- `@dependabot cancel merge` will cancel a previously requested merge and block automerging
- `@dependabot reopen` will reopen this PR if it is closed
- `@dependabot close` will close this PR and stop Dependabot recreating it. You can achieve the same result by closing it manually
- `@dependabot show <dependency name> ignore conditions` will show all of the ignore conditions of the specified dependency
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/the-virtual-brain/tvb-root/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `41444b1b8200`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.