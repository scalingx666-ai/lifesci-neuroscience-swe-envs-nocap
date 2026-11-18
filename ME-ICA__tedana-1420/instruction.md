# Issue

**Title:** Bump matplotlib from 3.10.8 to 3.10.9

## Description

Bumps [matplotlib](https://github.com/matplotlib/matplotlib) from 3.10.8 to 3.10.9.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/matplotlib/matplotlib/releases">matplotlib's releases</a>.</em></p>
<blockquote>
<h2>v3.10.9</h2>
<p>This is a micro release of the v3.10.x series.
Highlights of this release include:</p>
<ul>
<li>Various minor bug and doc fixes</li>
<li>Security hardening validation of cyclers - Removing eval usage</li>
<li>Security hardening in Latex and PS calls - Removing shell escapes</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>dd8d78b</code></a> REL: v3.10.9</li>
<li><a href=""><code>2fb1891</code></a> REL: Release prep v3.10.9</li>
<li><a href=""><code>d0e923a</code></a> Merge branch 'v3.10.8-doc' into v3.10.x</li>
<li><a href=""><code>1637932</code></a> Merge pull request <a href="">#31558</a> from meeseeksmachine/auto-backport-of-pr-31556-on-v...</li>
<li><a href=""><code>a83faac</code></a> Backport PR <a href="">#31556</a>: FIX: Inverted PyErr_Occurred check in enum type caster (_...</li>
<li><a href=""><code>a4f57ab</code></a> Merge pull request <a href="">#31545</a> from ksunden/backport-of-pr-31282-on-v3.10.x</li>
<li><a href=""><code>063288d</code></a> Merge pull request <a href="">#31544</a> from ksunden/backport-of-pr-31248-on-v3.10.x</li>
<li><a href=""><code>b2ed196</code></a> Backport PR <a href="">#31248</a>: SEC: Remove eval() from validate_cycler</li>
<li><a href=""><code>acc6024</code></a> Merge pull request <a href="">#31282</a> from scottshambaugh/tex_no_shell</li>
<li><a href=""><code>e3fb541</code></a> Merge pull request <a href="">#31078</a> from meeseeksmachine/auto-backport-of-pr-31075-on-v...</li>
<li>Additional commits viewable in <a href="https://github.com/matplotlib/matplotlib/compare/v3.10.8...v3.10.9">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d4280ea2be71`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.