# Issue

**Title:** Bump matplotlib from 3.9.2 to 3.9.3

## Description

Bumps [matplotlib](https://github.com/matplotlib/matplotlib) from 3.9.2 to 3.9.3.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/matplotlib/matplotlib/releases">matplotlib's releases</a>.</em></p>
<blockquote>
<h2>REL: 3.9.3</h2>
<p>This is the third bugfix release of the 3.9.x series.</p>
<p>This release contains several bug-fixes and adjustments:</p>
<ul>
<li>Fix <code>axline</code> with extremely small slopes</li>
<li>Fix <code>axline</code> with non-linear axis scales</li>
<li>Fix <code>minimumSizeHint</code> with Qt backend</li>
<li>Fix config directory usage when it's behind a symlink</li>
<li>Fix draggable legend when blitting is enabled</li>
<li>Fix high CPU utilization in the <code>macosx</code> backend</li>
<li>Fix multiple hatch <code>edgecolors</code> passed to <code>contourf</code></li>
<li>Improve compatibility with <code>pytest</code> 8.2.0</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>3ac0aea</code></a> REL: 3.9.3</li>
<li><a href=""><code>3f7adbd</code></a> Merge branch 'v3.9.2-doc' into v3.9.x</li>
<li><a href=""><code>4ca8d68</code></a> DOC: Create release notes for 3.9.3</li>
<li><a href=""><code>0cabfe2</code></a> Merge pull request <a href="">#29195</a> from meeseeksmachine/auto-backport-of-pr-29191-on-v...</li>
<li><a href=""><code>562d458</code></a> Backport PR <a href="">#29191</a>: ci: Simplify 3.13t test setup</li>
<li><a href=""><code>0586854</code></a> Merge pull request <a href="">#29176</a> from meeseeksmachine/auto-backport-of-pr-29148-on-v...</li>
<li><a href=""><code>84f2ae2</code></a> Merge pull request <a href="">#29178</a> from meeseeksmachine/auto-backport-of-pr-29163-on-v...</li>
<li><a href=""><code>dd57772</code></a> Backport PR <a href="">#29163</a>: ci: Remove outdated pkg-config package on macOS</li>
<li><a href=""><code>c4bfd54</code></a> Backport PR <a href="">#29148</a>: Don't fail on equal-but-differently-named cmaps in qt fig...</li>
<li><a href=""><code>d71ff49</code></a> Backport PR <a href="">#29153</a>: Bump codecov/codecov-action from 4 to 5 in the actions gr...</li>
<li>Additional commits viewable in <a href="https://github.com/matplotlib/matplotlib/compare/v3.9.2...v3.9.3">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=matplotlib&package-manager=pip&previous-version=3.9.2&new-version=3.9.3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `96a267d556d6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.