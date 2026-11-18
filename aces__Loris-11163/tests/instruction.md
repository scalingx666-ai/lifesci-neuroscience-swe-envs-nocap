# Issue

**Title:** Bump smarty/smarty from 4.5.6 to 4.5.7

## Description

Bumps [smarty/smarty](https://github.com/smarty-php/smarty) from 4.5.6 to 4.5.7.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/smarty-php/smarty/releases">smarty/smarty's releases</a>.</em></p>
<blockquote>
<h2>v4.5.7</h2>
<h2>What's Changed</h2>
<ul>
<li>Port security fixes from v5.8.2 to Smarty v4. by <a href="https://github.com/wisskid"><code>@​wisskid</code></a> in <a href="">smarty-php/smarty#1194</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/smarty-php/smarty/compare/v4.5.6...v4.5.7">https://github.com/smarty-php/smarty/compare/v4.5.6...v4.5.7</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/smarty-php/smarty/blob/v4.5.7/CHANGELOG.md">smarty/smarty's changelog</a>.</em></p>
<blockquote>
<h2>[4.5.7] - 2026-06-29</h2>
<ul>
<li>Security: prevent symlinks inside a trusted <code>secure_dir</code>/template directory from being used to read files outside of it (CWE-22 path traversal), affecting <code>{include}</code> and <code>{fetch}</code> of local files</li>
<li>Security: <code>{html_image}</code> now escapes the <code>file</code>, <code>path_prefix</code>, <code>href</code>/<code>link</code>, <code>width</code> and <code>height</code> attributes (it already escaped <code>alt</code> and pass-through attributes), and <code>{html_select_date}</code> casts <code>day_size</code>/<code>month_size</code>/<code>year_size</code> to int (matching <code>{html_select_time}</code>), preventing untrusted values passed into these attributes from breaking out of the generated HTML (CWE-79)</li>
<li>Security: <code>{fetch}</code> no longer follows HTTP redirects for remote resources while a security policy is active, preventing an open redirect on a trusted host from bypassing <code>trusted_uri</code> (CWE-918 server-side request forgery)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>838d6ad</code></a> Merge branch 'release/4.5.7' into support/4</li>
<li><a href=""><code>187f7b6</code></a> version bump</li>
<li><a href=""><code>a1ccdb0</code></a> Port security fixes from v5.8.2 to Smarty v4. (<a href="">#1194</a>)</li>
<li><a href=""><code>c285f84</code></a> Reproduce block override leakage in template inheritance</li>
<li>See full diff in <a href="https://github.com/smarty-php/smarty/compare/v4.5.6...v4.5.7">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1e771c7298f2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.