# Issue

**Title:** Bump johnwason/vcpkg-action from 7.0.0 to 8.0.0

## Description

Bumps [johnwason/vcpkg-action](https://github.com/johnwason/vcpkg-action) from 7.0.0 to 8.0.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/johnwason/vcpkg-action/releases">johnwason/vcpkg-action's releases</a>.</em></p>
<blockquote>
<h2>v8.0.0</h2>
<h2>What's Changed</h2>
<ul>
<li>Bump actions/checkout from 4 to 5 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">johnwason/vcpkg-action#47</a></li>
<li>Use x-write-nuget-packages-config option for hash file by <a href="https://github.com/johnwason"><code>@​johnwason</code></a> in <a href="">johnwason/vcpkg-action#55</a></li>
<li>Bump actions/upload-artifact from 4 to 7 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">johnwason/vcpkg-action#54</a></li>
<li>Bump actions/cache from 4 to 5 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">johnwason/vcpkg-action#53</a></li>
<li>Bump actions/checkout from 5 to 6 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">johnwason/vcpkg-action#51</a></li>
<li>Save cache at end of vcpkg-action instead of end of the job by <a href="https://github.com/johnwason"><code>@​johnwason</code></a> in <a href="">johnwason/vcpkg-action#56</a></li>
<li>Improve readme documentation by <a href="https://github.com/johnwason"><code>@​johnwason</code></a> in <a href="">johnwason/vcpkg-action#57</a></li>
<li>Use <a href="https://github.com/v8"><code>@​v8</code></a> in readme by <a href="https://github.com/johnwason"><code>@​johnwason</code></a> in <a href="">johnwason/vcpkg-action#58</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/johnwason/vcpkg-action/compare/v7.0.1...v8.0.0">https://github.com/johnwason/vcpkg-action/compare/v7.0.1...v8.0.0</a></p>
<h2>v7.0.1</h2>
<p>Fixes errors in README.md</p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>04c68c8</code></a> Use <a href="https://github.com/v8"><code>@​v8</code></a> in readme (<a href="">#58</a>)</li>
<li><a href=""><code>1bdfd7d</code></a> Improve readme documentation (<a href="">#57</a>)</li>
<li><a href=""><code>276fce9</code></a> Save cache at end of vcpkg-action instead of end of the job (<a href="">#56</a>)</li>
<li><a href=""><code>c1f2590</code></a> Bump actions/checkout from 5 to 6 (<a href="">#51</a>)</li>
<li><a href=""><code>9ede423</code></a> Bump actions/cache from 4 to 5 (<a href="">#53</a>)</li>
<li><a href=""><code>2b63866</code></a> Bump actions/upload-artifact from 4 to 7 (<a href="">#54</a>)</li>
<li><a href=""><code>51fae72</code></a> Use x-write-nuget-packages-config option for hash file (<a href="">#55</a>)</li>
<li><a href=""><code>ae07fd6</code></a> Bump actions/checkout from 4 to 5 (<a href="">#47</a>)</li>
<li><a href=""><code>caa1c94</code></a> Improve readme (<a href="">#46</a>)</li>
<li><a href=""><code>50833c2</code></a> Improve readme (<a href="">#45</a>)</li>
<li>See full diff in <a href="https://github.com/johnwason/vcpkg-action/compare/ff71808de10afc0e3160fd079353c69ba0d7dd60...04c68c847bf5196ecaa72331ecf51208583916ef">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=johnwason/vcpkg-action&package-manager=github_actions&previous-version=7.0.0&new-version=8.0.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5d0dc751808d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.