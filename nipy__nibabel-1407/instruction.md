# Issue

**Title:** chore(deps): bump astral-sh/setup-uv from 4 to 5

## Description

Bumps [astral-sh/setup-uv](https://github.com/astral-sh/setup-uv) from 4 to 5.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/setup-uv/releases">astral-sh/setup-uv's releases</a>.</em></p>
<blockquote>
<h2>v5.2.1 🌈 Support toml spec 1.0.0</h2>
<p>v5.2.0 introduced TOML parsing using <a href="https://www.npmjs.com/package/@iarna/toml"><code>@​iarna/toml</code></a> because we already found out in <code>astral-sh/ruff-action</code> that <a href="https://www.npmjs.com/package/toml">toml</a> has missing features.</p>
<p>As it turns out <a href="https://www.npmjs.com/package/@iarna/toml"><code>@​iarna/toml</code></a> also is not fully TOML spec (1.0.0) compliant.</p>
<p>We now use <a href="https://www.npmjs.com/package/smol-toml">smol-toml</a></p>
<h2>🐛 Bug fixes</h2>
<ul>
<li>Support toml spec 1.0.0 <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#245</a>)</li>
</ul>
<h2>v5.0.0 🎄 Merry Christmas - Help fastly and users by default</h2>
<h2>Changes</h2>
<p>This christmans 🎄 release is a bit early bit still full of presents 🎁
Since we are changing some of the defaults this can lead to breaking changes, thus the major version increase.</p>
<p>Here are the highlights:</p>
<h3><a href="">Default to enable-cache: true on GitHub hosted runners</a></h3>
<p>Did you know that that Fastly, the company hosting PyPI, theoretically has to pay $12.5 million per month and so far have served more than 2.41 <strong>exabytes</strong> of data?
<img src="https://github.com/user-attachments/assets/f2f6cb3f-68f6-4e37-abb1-d3bf1f278533" alt="image" /></p>
<p>This is why <a href="">they asked us</a> to turn on caching by default. After weighting the pros and cons we decided to automatically upload the cache to the GitHub Actions cache when running on GitHub hosted runners. You can still disable that with <code>enable-cache: false</code>.</p>
<p>I remember when I first got into actions and didn't understand all the magic. I was baffled that some actions did something behind the scenes to make everything faster. I hope with this change we help a lot of users who are don't want to or are afraid to understand what <code>enable-cache</code> does.</p>
<h3><a href="">Add **/requirements*.txt to default cache-dependency-glob</a></h3>
<p>If caching is enabled we automatically searched for a <code>uv.lock</code> file and when this changed we knew we had to refresh the cache. A lot of projects don't use this but rather the good old <code>requirements.txt</code>. We now automatically search for both <code>uv.lock</code>and <code>requirements*.txt</code> (this means also <code>requirements-test.txt</code>, <code>requirements-dev.txt</code>, ...) files.
You can change this with <code>cache-dependency-glob</code></p>
<h3><a href="">Auto activate venv when python-version is set</a></h3>
<p>Some workflows install packages on the fly. This automatically works when using a python version that is already present on the runner. But if uv installs the version, e.g. because it is a free-threaded version or an old one, it is a <a href="https://astral.sh/blog/python-build-standalone">standalone-build</a> and installing packages &quot;into the system&quot; is not possible.</p>
<p>We now automatically create a new virtual environment with <code>uv venv</code> and activate it for the rest of the workflow if <code>python-version</code> is used. This means you can now do</p>
<pre lang="yaml"><code>- name: Install uv
  uses: astral-sh/setup-uv@auto-environment
  with:
    python-version: 3.13t
- run: uv pip install -i https://pypi.anaconda.org/scientific-python-nightly-wheels/simple cython
</code></pre>
<h2>🚨 Breaking changes</h2>
<ul>
<li>Default to enable-cache: true on GitHub hosted runners <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#193</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>4db9619</code></a> Do not expect GITHUB_TOKEN to be set or valid (<a href="">#262</a>)</li>
<li><a href=""><code>2625dd3</code></a> chore: update known checksums for 0.5.25 (<a href="">#259</a>)</li>
<li><a href=""><code>f9e15a1</code></a> Bump <code>@​types/node</code> from 22.10.10 to 22.12.0 (<a href="">#258</a>)</li>
<li><a href=""><code>1c21f62</code></a> Fix TOC (<a href="">#257</a>)</li>
<li><a href=""><code>982fbca</code></a> Bump release-drafter/release-drafter from 6.0.0 to 6.1.0 (<a href="">#249</a>)</li>
<li><a href=""><code>35cf708</code></a> Bump <code>@​types/node</code> from 22.10.9 to 22.10.10 (<a href="">#254</a>)</li>
<li><a href=""><code>7cf65de</code></a> chore: update known checksums for 0.5.24 (<a href="">#256</a>)</li>
<li><a href=""><code>6ade4fc</code></a> Bump <code>@​types/node</code> from 22.10.7 to 22.10.9 (<a href="">#253</a>)</li>
<li><a href=""><code>6e6e5a7</code></a> chore: update known checksums for 0.5.23 (<a href="">#252</a>)</li>
<li><a href=""><code>2098017</code></a> chore: update known checksums for 0.5.22 (<a href="">#250</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/setup-uv/compare/v4...v5">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=astral-sh/setup-uv&package-manager=github_actions&previous-version=4&new-version=5)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `78fcddb573cd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.