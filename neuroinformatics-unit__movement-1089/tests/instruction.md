# Issue

**Title:** Bump pyvista/setup-headless-display-action from 4 to 5

## Description

Bumps [pyvista/setup-headless-display-action](https://github.com/pyvista/setup-headless-display-action) from 4 to 5.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pyvista/setup-headless-display-action/releases">pyvista/setup-headless-display-action's releases</a>.</em></p>
<blockquote>
<h2>v5.0.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>Prevent 24-hour macOS production workflow hangs by <a href="https://github.com/banesullivan"><code>@​banesullivan</code></a> with <a href="https://github.com/Copilot"><code>@​Copilot</code></a> in <a href="">pyvista/setup-headless-display-action#49</a></li>
<li>Bump actions/checkout from 6 to 7 in the actions group by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">pyvista/setup-headless-display-action#50</a></li>
<li>Bump actions/setup-python from 6 to 7 in the actions group by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">pyvista/setup-headless-display-action#51</a></li>
<li>Fix timeouts by <a href="https://github.com/larsoner"><code>@​larsoner</code></a> in <a href="">pyvista/setup-headless-display-action#52</a></li>
<li>Support wayland via weston by <a href="https://github.com/larsoner"><code>@​larsoner</code></a> in <a href="">pyvista/setup-headless-display-action#53</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/banesullivan"><code>@​banesullivan</code></a> with <a href="https://github.com/Copilot"><code>@​Copilot</code></a> made their first contribution in <a href="">pyvista/setup-headless-display-action#49</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/pyvista/setup-headless-display-action/compare/v4...v5.0.0">https://github.com/pyvista/setup-headless-display-action/compare/v4...v5.0.0</a></p>
<h2>v4.3</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>Add missing apt package for qt6 deps by <a href="https://github.com/akaszynski"><code>@​akaszynski</code></a> in <a href="">pyvista/setup-headless-display-action#47</a></li>
</ul>
<h2>v4.2</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>BUG: Fix mesa=latest with install-mesa3d-offscreen on Windows by <a href="https://github.com/larsoner"><code>@​larsoner</code></a> in <a href="">pyvista/setup-headless-display-action#38</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/pyvista/setup-headless-display-action/compare/v4...v4.2">https://github.com/pyvista/setup-headless-display-action/compare/v4...v4.2</a></p>
<h2>v4.1</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>docs: update README and action input description by <a href="https://github.com/RobPasMue"><code>@​RobPasMue</code></a> in <a href="">pyvista/setup-headless-display-action#32</a></li>
<li>MAINT: Set default back to no wm by <a href="https://github.com/larsoner"><code>@​larsoner</code></a> in <a href="">pyvista/setup-headless-display-action#34</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/pyvista/setup-headless-display-action/compare/v4...v4.1">https://github.com/pyvista/setup-headless-display-action/compare/v4...v4.1</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b0bf9f5</code></a> Support wayland via weston (<a href="">#53</a>)</li>
<li><a href=""><code>b2dab26</code></a> Fix timeouts (<a href="">#52</a>)</li>
<li><a href=""><code>21b8901</code></a> Bump actions/setup-python from 6 to 7 in the actions group (<a href="">#51</a>)</li>
<li><a href=""><code>57ebfcf</code></a> Bump actions/checkout from 6 to 7 in the actions group (<a href="">#50</a>)</li>
<li><a href=""><code>8e2e967</code></a> Prevent 24-hour macOS production workflow hangs (<a href="">#49</a>)</li>
<li>See full diff in <a href="https://github.com/pyvista/setup-headless-display-action/compare/v4...v5">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pyvista/setup-headless-display-action&package-manager=github_actions&previous-version=4&new-version=5)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `86c27819835c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.