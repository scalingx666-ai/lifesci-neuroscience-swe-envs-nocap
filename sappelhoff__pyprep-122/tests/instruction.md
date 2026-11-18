# Issue

**Title:** Bump actions/setup-python from 2 to 4

## Description

[//]: # (dependabot-start)
⚠️  **Dependabot is rebasing this PR** ⚠️

Rebasing might not happen immediately, so don't worry if this takes some time.

Note: if you make any changes to this PR yourself, they will take precedence over the rebase.

---

[//]: # (dependabot-end)

Bumps [actions/setup-python](https://github.com/actions/setup-python) from 2 to 4.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/setup-python/releases">actions/setup-python's releases</a>.</em></p>
<blockquote>
<h2>v4.0.0</h2>
<h3>What's Changed</h3>
<ul>
<li>Support for <code>python-version-file</code> input: <a href="https://github-redirect.dependabot.com/actions/setup-python/issues/336">#336</a></li>
</ul>
<p>Example of usage:</p>
<pre lang="yaml"><code>- uses: actions/setup-python@v4
  with:
    python-version-file: '.python-version' # Read python version from a file
- run: python my_script.py
</code></pre>
<p>There is no default python version for this <code>setup-python</code> major version, the action requires to specify either <code>python-version</code> input or <code>python-version-file</code> input. If the <code>python-version</code> input is not specified the action will try to read required version from file from <code>python-version-file</code> input.</p>
<ul>
<li>Use pypyX.Y for PyPy <code>python-version</code> input: <a href="https://github-redirect.dependabot.com/actions/setup-python/issues/349">#349</a></li>
</ul>
<p>Example of usage:</p>
<pre lang="yaml"><code>- uses: actions/setup-python@v4
  with:
    python-version: 'pypy3.9' # pypy-X.Y kept for backward compatibility
- run: python my_script.py
</code></pre>
<ul>
<li>
<p><code>RUNNER_TOOL_CACHE</code> environment variable is equal <code>AGENT_TOOLSDIRECTORY</code>: <a href="https://github-redirect.dependabot.com/actions/setup-python/issues/338">#338</a></p>
</li>
<li>
<p>Bugfix: create missing <code>pypyX.Y</code> symlinks: <a href="https://github-redirect.dependabot.com/actions/setup-python/issues/347">#347</a></p>
</li>
<li>
<p><code>PKG_CONFIG_PATH</code> environment variable: <a href="https://github-redirect.dependabot.com/actions/setup-python/issues/400">#400</a></p>
</li>
<li>
<p>Added <code>python-path</code> output: <a href="https://github-redirect.dependabot.com/actions/setup-python/issues/405">#405</a>
<code>python-path</code> output contains Python executable path.</p>
</li>
<li>
<p>Updated <code>zeit/ncc</code> to <code>vercel/ncc</code> package: <a href="https://github-redirect.dependabot.com/actions/setup-python/issues/393">#393</a></p>
</li>
<li>
<p>Bugfix: fixed output for prerelease version of poetry: <a href="https://github-redirect.dependabot.com/actions/setup-python/issues/409">#409</a></p>
</li>
<li>
<p>Made <code>pythonLocation</code> environment variable consistent for Python and PyPy: <a href="https://github-redirect.dependabot.com/actions/setup-python/issues/418">#418</a></p>
</li>
<li>
<p>Bugfix for <code>3.x-dev</code> syntax: <a href="https://github-redirect.dependabot.com/actions/setup-python/issues/417">#417</a></p>
</li>
<li>
<p>Other improvements: <a href="https://github-redirect.dependabot.com/actions/setup-python/issues/318">#318</a> <a href="https://github-redirect.dependabot.com/actions/setup-python/issues/396">#396</a> <a href="https://github-redirect.dependabot.com/actions/setup-python/issues/384">#384</a> <a href="https://github-redirect.dependabot.com/actions/setup-python/issues/387">#387</a> <a href="https://github-redirect.dependabot.com/actions/setup-python/issues/388">#388</a></p>
</li>
</ul>
<h2>Update actions/cache version to 2.0.2</h2>
<p>In scope of this release we updated <code>actions/cache</code> package as the new version contains fixes related to GHES 3.5 (<a href="https://github-redirect.dependabot.com/actions/setup-python/pull/382">actions/setup-python#382</a>)</p>
<h2>Add &quot;cache-hit&quot; output and fix &quot;python-version&quot; output for PyPy</h2>
<p>This release introduces new output cache-hit (<a href="https://github-redirect.dependabot.com/actions/setup-python/pull/373">actions/setup-python#373</a>) and fix python-version output for PyPy (<a href="https://github-redirect.dependabot.com/actions/setup-python/pull/365">actions/setup-python#365</a>)</p>
<p>The cache-hit output contains boolean value indicating that an exact match was found for the key. It shows that the action uses already existing cache or not. The output is available only if cache is enabled.</p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>c4e89fa</code></a> Improve readme for 3.x and 3.11-dev style python-version (<a href="https://github-redirect.dependabot.com/actions/setup-python/issues/441">#441</a>)</li>
<li><a href=""><code>0ad0f6a</code></a> Merge pull request <a href="https://github-redirect.dependabot.com/actions/setup-python/issues/452">#452</a> from mayeut/fix-env</li>
<li><a href=""><code>f0bcf8b</code></a> Merge pull request <a href="https://github-redirect.dependabot.com/actions/setup-python/issues/456">#456</a> from akx/patch-1</li>
<li><a href=""><code>af97157</code></a> doc: Add multiple wildcards example to readme</li>
<li><a href=""><code>364e819</code></a> Merge pull request <a href="https://github-redirect.dependabot.com/actions/setup-python/issues/394">#394</a> from akv-platform/v-sedoli/set-env-by-default</li>
<li><a href=""><code>782f81b</code></a> Merge pull request <a href="https://github-redirect.dependabot.com/actions/setup-python/issues/450">#450</a> from IvanZosimov/ResolveVersionFix</li>
<li><a href=""><code>2c9de4e</code></a> Remove duplicate code introduced in <a href="https://github-redirect.dependabot.com/actions/setup-python/issues/440">#440</a></li>
<li><a href=""><code>412091c</code></a> Fix tests for update-environment==false</li>
<li><a href=""><code>78a2330</code></a> Merge pull request <a href="https://github-redirect.dependabot.com/actions/setup-python/issues/451">#451</a> from dmitry-shibanov/fx-pipenv-python-version</li>
<li><a href=""><code>96f494e</code></a> trigger checks</li>
<li>Additional commits viewable in <a href="https://github.com/actions/setup-python/compare/v2...v4">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=actions/setup-python&package-manager=github_actions&previous-version=2&new-version=4)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b82d498379bb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.