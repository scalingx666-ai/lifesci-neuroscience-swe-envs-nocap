# Issue

**Title:** Bump furo from 2024.5.6 to 2024.8.6

## Description

Bumps [furo](https://github.com/pradyunsg/furo) from 2024.5.6 to 2024.8.6.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pradyunsg/furo/blob/main/docs/changelog.md">furo's changelog</a>.</em></p>
<blockquote>
<h1>Changelog</h1>
<!-- raw HTML omitted -->
<h2>2024.08.06 -- Energetic Eminence</h2>
<ul>
<li>✨ Add support for Sphinx 8</li>
<li>✨ Add smoother transitions between breakpoints</li>
<li>Increase specificity of table-wrapper selector</li>
<li>Avoid page breaks inside paragraphs</li>
</ul>
<h2>2024.07.18 -- Dull Denim</h2>
<ul>
<li>Improve how icons are handled and aligned.</li>
<li>Improve scroll event handler.</li>
<li>Hide the copybutton by default.</li>
<li>Fix <code>source_view_link</code> configuration handling.</li>
<li>Fix close tag on pencil icon.</li>
</ul>
<h2>2024.05.06 -- Cheerful Cerulean</h2>
<ul>
<li>✨ Add new custom icons for auto mode, reflecting the currently active theme.</li>
<li>✨ Add a view this page button.</li>
<li>✨ Add colours and highlighting to &quot;version modified&quot; API helpers.</li>
<li>✨ Add release information to various customisation knobs.</li>
<li>Make all icons bigger and use a thinner stroke with them.</li>
</ul>
<h2>2024.04.27 -- Bold Burgundy</h2>
<ul>
<li>Add a skip to content link.</li>
<li>Add <code>--font-stack--headings</code>.</li>
<li>Add <code>:visited</code> colour and enforce uniform contrast between light/dark.</li>
<li>Add an offset of <code>:target</code> to reduce back-to-top overlap.</li>
<li>Improve dark mode colours.</li>
<li>Fix outstanding colour contrast warnings on Firefox.</li>
<li>Fix bad indent in footnotes.</li>
<li>Tweak handling of default configuration options in a more resilient manner.</li>
<li>Tweak length and sizing of API <code>source</code> links.</li>
<li>Stop search engine indexing on search page.</li>
</ul>
<h2>2024.01.29 -- Amazing Amethyst</h2>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>1bbf4ee</code></a> Prepare release: 2024.08.06</li>
<li><a href=""><code>bcb22c3</code></a> Update changelog</li>
<li><a href=""><code>e633f02</code></a> Improve the selector for sidebar</li>
<li><a href=""><code>d2fa2e0</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#821</a>)</li>
<li><a href=""><code>05a2d63</code></a> Add smoother transitions between breakpoints</li>
<li><a href=""><code>d261d3b</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#810</a>)</li>
<li><a href=""><code>2d3b6ba</code></a> Add support for Sphinx 8</li>
<li><a href=""><code>bf98041</code></a> Increase specificity of table-wrapper selector</li>
<li><a href=""><code>fc6337c</code></a> Fix the figures</li>
<li><a href=""><code>fd3f422</code></a> Avoid page breaks inside paragraphs</li>
<li>Additional commits viewable in <a href="https://github.com/pradyunsg/furo/compare/2024.05.06...2024.08.06">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=furo&package-manager=pip&previous-version=2024.5.6&new-version=2024.8.6)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fcd023c11cda`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.