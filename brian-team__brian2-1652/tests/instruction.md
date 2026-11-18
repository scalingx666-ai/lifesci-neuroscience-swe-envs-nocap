# Issue

**Title:** Bump astral-sh/setup-uv from 6.1.0 to 6.3.1

## Description

Bumps [astral-sh/setup-uv](https://github.com/astral-sh/setup-uv) from 6.1.0 to 6.3.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/setup-uv/releases">astral-sh/setup-uv's releases</a>.</em></p>
<blockquote>
<h2>v6.3.1 🌈 Do not warn when version not in manifest-file</h2>
<h2>Changes</h2>
<p>This is a hotfix to change the warning messages that a version could not be found in the local manifest-file to info level.</p>
<p>A <code>setup-uv</code> release contains a version-manifest.json file with infos in all available <code>uv</code> releases. When a new <code>uv</code> version is released this is not contained in this file until the file gets updated and a new <code>setup-uv</code> release is made.
We will overhaul this process in the future but for now the spamming of warnings is removed.</p>
<h2>🐛 Bug fixes</h2>
<ul>
<li>Do not warn when version not in manifest-file <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#462</a>)</li>
</ul>
<h2>🧰 Maintenance</h2>
<ul>
<li>chore: update known versions for 0.7.14 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#459</a>)</li>
<li>Revert &quot;Set expected cache dir drive to C: on windows (<a href="">#451</a>)&quot; <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#460</a>)</li>
</ul>
<h2>v6.3.0 🌈 Use latest version from manifest-file</h2>
<h2>Changes</h2>
<p>If a manifest-file is supplied the default value of the version input (latest) will get the latest version available in the manifest. That might not be the actual latest version available in the official uv repo.</p>
<h2>🚀 Enhancements</h2>
<ul>
<li>Use latest version from manifest-file <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#458</a>)</li>
</ul>
<h2>v6.2.0 🌈  New input manifest-file</h2>
<h2>Changes</h2>
<p>This release adds a new input <code>manifest-file</code>.</p>
<p>The <code>manifest-file</code> input allows you to specify a JSON manifest that lists available uv versions,
architectures, and their download URLs. By default, this action uses the manifest file contained
in this repository, which is automatically updated with each release of uv.</p>
<p>The manifest file contains an array of objects, each describing a version,
architecture, platform, and the corresponding download URL.</p>
<p>You can supply a custom manifest file URL to define additional versions,
architectures, or different download URLs.
This is useful if you maintain your own uv builds or want to override the default sources.</p>
<p>For example:</p>
<pre lang="json"><code>[
  {
    &quot;version&quot;: &quot;0.7.12-alpha.1&quot;,
&lt;/tr&gt;&lt;/table&gt;
</code></pre>
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>bd01e18</code></a> Do not warn when version not in manifest-file (<a href="">#462</a>)</li>
<li><a href=""><code>c6a5eba</code></a> chore: update known versions for 0.7.14 (<a href="">#459</a>)</li>
<li><a href=""><code>790df8f</code></a> Revert &quot;Set expected cache dir drive to C: on windows (<a href="">#451</a>)&quot; (<a href="">#460</a>)</li>
<li><a href=""><code>445689e</code></a> Use latest version from manifest-file (<a href="">#458</a>)</li>
<li><a href=""><code>a02a550</code></a> Look for version-manifest.json relative to action path (<a href="">#456</a>)</li>
<li><a href=""><code>60cc2b4</code></a> Add input manifest-file (<a href="">#454</a>)</li>
<li><a href=""><code>7bbb36f</code></a> chore: update known versions for 0.7.13 and 0.7.12 (<a href="">#444</a>)</li>
<li><a href=""><code>60ecb38</code></a> Set expected cache dir drive to C: on windows (<a href="">#451</a>)</li>
<li><a href=""><code>252c995</code></a> chore: update known versions for 0.7.11 (<a href="">#442</a>)</li>
<li><a href=""><code>477a814</code></a> chore: update known versions for 0.7.10 (<a href="">#440</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/setup-uv/compare/f0ec1fc3b38f5e7cd731bb6ce540c5af426746bb...bd01e18f51369d5a26f1651c3cb451d3417e3bba">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=astral-sh/setup-uv&package-manager=github_actions&previous-version=6.1.0&new-version=6.3.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d7a39ec68018`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.