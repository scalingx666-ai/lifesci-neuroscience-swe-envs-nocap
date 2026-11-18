# Issue

**Title:** Bump virtualenv from 21.7.13 to 21.14.9

## Description

Bumps [virtualenv](https://github.com/pypa/virtualenv) from 21.7.13 to 21.14.9.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pypa/virtualenv/releases">virtualenv's releases</a>.</em></p>
<blockquote>
<h2>21.14.9</h2>
<h1>Bugfixes - 21.14.9</h1>
<ul>
<li>
<p>Parse <code>VIRTUALENV_PERIODIC_UPDATE_INSECURE</code> as a boolean, so <code>0</code>, <code>false</code>, <code>no</code> and <code>off</code> keep certificate
verification enabled. (<a href="">#3398</a>)</p>
</li>
<li>
<p>Reject destinations whose resolved path contains the platform's PATH separator, including separators inherited from
the working directory or a directory symlink. (<a href="">#3399</a>)</p>
</li>
<li>
<p>Preserve an existing <code>pyvenv.cfg</code> when a prompt or configuration value cannot be encoded as UTF-8, instead of
leaving the file empty after a failed environment creation. The file now ends its lines with LF on every platform.</p>
<p>Debug logs show each configuration line as a Python string literal, so control characters are visible. (<a href="">#3400</a>)</p>
</li>
<li>
<p>Skip writing a <code>.venv</code> redirect when the environment name contains a line boundary. The environment is still
created, and any existing redirect remains unchanged. (<a href="">#3401</a>)</p>
</li>
<li>
<p>Preserve non-ASCII values in <code>activate_this.py</code> when applications read the script with a legacy text encoding before
executing it. (<a href="">#3402</a>)</p>
</li>
<li>
<p>Reject malformed seed versions and requirements ending in archive suffixes before starting pip, with an error
identifying the invalid value instead of a misleading download or local-file error. (<a href="">#3403</a>)</p>
</li>
<li>
<p>Allow a literal percent sign as a csh prompt and preserve carets in tcsh prompt display instead of interpreting them
as control-character notation.</p>
<p>Separate csh history and prompt escapes from preceding non-ASCII text in legacy locales. (<a href="">#3404</a>)</p>
</li>
<li>
<p>Report an error when an existing <code>pyvenv.cfg</code> is not a regular file, instead of trying to read or write directories,
pipes, or devices as configuration files. (<a href="">#3405</a>)</p>
</li>
<li>
<p>Preserve percent-containing paths during batch reactivation and show dollar signs literally in command prompts. Skip
batch scripts for paths containing line boundaries, and remove stale batch scripts for unsupported paths even when
only other activators are selected. (<a href="">#3406</a>)</p>
</li>
<li>
<p>Compile shared seed-cache bytecode without loading site customizations from the destination environment or importing
modules from the current working directory. (<a href="">#3407</a>)</p>
</li>
<li>
<p>Keep the bundled seed version when a cached periodic update is older, and stop recording downloads below the bundled
version during update checks. (<a href="">#3408</a>)</p>
</li>
<li>
<p>Stop activating a moved environment, leaving <code>PATH</code> unchanged, when the shell is not bash, the script is evaluated
or read from standard input, a path tool fails, the sourced file is not the environment's own activation script, or
the new location has no <code>pyvenv.cfg</code>, instead of continuing with an incorrect environment path. (<a href="">#3409</a>)</p>
</li>
<li>
<p>Reject built-in options with missing values before creating the application-data directory or starting interpreter
discovery, instead of reporting the argument error after those operations. (<a href="">#3410</a>)</p>
</li>
<li>
<p>Keep unset-variable bookkeeping out of exported xonsh variables, so child shells do not restore an internal sentinel
as <code>PYTHONHOME</code>. Skip xonsh activation for destination names that its PATH handling would expand to a different
path.</p>
<p>Restore unset Tcl/Tk library variables when switching between environments in one xonsh session.</p>
<p>Preserve non-ASCII paths and prompts when xonsh reads activation scripts with a legacy encoding. (<a href="">#3411</a>)</p>
</li>
<li>
<p>Skip default shell activators with a warning when a POSIX path encoding is incompatible with their UTF-8 scripts.
Explicitly requested incompatible shell activators still report an error. Environments created with <code>--activators=</code>
or <code>--activators=python</code> remain supported in legacy locales. Undecodable parent paths are now caught before any
shell activation script is written. (<a href="">#3412</a>)</p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pypa/virtualenv/blob/main/docs/changelog.rst">virtualenv's changelog</a>.</em></p>
<blockquote>
<h1>Bugfixes - 21.14.9</h1>
<ul>
<li>
<p>Parse <code>VIRTUALENV_PERIODIC_UPDATE_INSECURE</code> as a boolean, so <code>0</code>, <code>false</code>, <code>no</code> and <code>off</code> keep certificate
verification enabled. (:issue:<code>3398</code>)</p>
</li>
<li>
<p>Reject destinations whose resolved path contains the platform's PATH separator, including separators inherited from
the working directory or a directory symlink. (:issue:<code>3399</code>)</p>
</li>
<li>
<p>Preserve an existing <code>pyvenv.cfg</code> when a prompt or configuration value cannot be encoded as UTF-8, instead of
leaving the file empty after a failed environment creation. The file now ends its lines with LF on every platform.</p>
<p>Debug logs show each configuration line as a Python string literal, so control characters are visible. (:issue:<code>3400</code>)</p>
</li>
<li>
<p>Skip writing a <code>.venv</code> redirect when the environment name contains a line boundary. The environment is still
created, and any existing redirect remains unchanged. (:issue:<code>3401</code>)</p>
</li>
<li>
<p>Preserve non-ASCII values in <code>activate_this.py</code> when applications read the script with a legacy text encoding before
executing it. (:issue:<code>3402</code>)</p>
</li>
<li>
<p>Reject malformed seed versions and requirements ending in archive suffixes before starting pip, with an error
identifying the invalid value instead of a misleading download or local-file error. (:issue:<code>3403</code>)</p>
</li>
<li>
<p>Allow a literal percent sign as a csh prompt and preserve carets in tcsh prompt display instead of interpreting them
as control-character notation.</p>
<p>Separate csh history and prompt escapes from preceding non-ASCII text in legacy locales. (:issue:<code>3404</code>)</p>
</li>
<li>
<p>Report an error when an existing <code>pyvenv.cfg</code> is not a regular file, instead of trying to read or write directories,
pipes, or devices as configuration files. (:issue:<code>3405</code>)</p>
</li>
<li>
<p>Preserve percent-containing paths during batch reactivation and show dollar signs literally in command prompts. Skip
batch scripts for paths containing line boundaries, and remove stale batch scripts for unsupported paths even when
only other activators are selected. (:issue:<code>3406</code>)</p>
</li>
<li>
<p>Compile shared seed-cache bytecode without loading site customizations from the destination environment or importing
modules from the current working directory. (:issue:<code>3407</code>)</p>
</li>
<li>
<p>Keep the bundled seed version when a cached periodic update is older, and stop recording downloads below the bundled
version during update checks. (:issue:<code>3408</code>)</p>
</li>
<li>
<p>Stop activating a moved environment, leaving <code>PATH</code> unchanged, when the shell is not bash, the script is evaluated
or read from standard input, a path tool fails, the sourced file is not the environment's own activation script, or
the new location has no <code>pyvenv.cfg</code>, instead of continuing with an incorrect environment path. (:issue:<code>3409</code>)</p>
</li>
<li>
<p>Reject built-in options with missing values before creating the application-data directory or starting interpreter
discovery, instead of reporting the argument error after those operations. (:issue:<code>3410</code>)</p>
</li>
<li>
<p>Keep unset-variable bookkeeping out of exported xonsh variables, so child shells do not restore an internal sentinel
as <code>PYTHONHOME</code>. Skip xonsh activation for destination names that its PATH handling would expand to a different
path.</p>
<p>Restore unset Tcl/Tk library variables when switching between environments in one xonsh session.</p>
<p>Preserve non-ASCII paths and prompts when xonsh reads activation scripts with a legacy encoding. (:issue:<code>3411</code>)</p>
</li>
<li>
<p>Skip default shell activators with a warning when a POSIX path encoding is incompatible with their UTF-8 scripts.
Explicitly requested incompatible shell activators still report an error. Environments created with <code>--activators=</code>
or <code>--activators=python</code> remain supported in legacy locales. Undecodable parent paths are now caught before any
shell activation script is written. (:issue:<code>3412</code>)</p>
</li>
<li>
<p>Keep apostrophes and backslashes in fish activation values separate from preceding non-ASCII characters, so fish 3</p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>e53e30b</code></a> release 21.14.9</li>
<li><a href=""><code>2519941</code></a> 🐛 fix(seed): preserve interpreter paths in console scripts (<a href="">#3417</a>)</li>
<li><a href=""><code>70a0102</code></a> 🐛 fix(seed): preserve shared cache when reseeding with pip (<a href="">#3423</a>)</li>
<li><a href=""><code>554d9f9</code></a> 🐛 fix(create): replace linked output directories (<a href="">#3429</a>)</li>
<li><a href=""><code>7babec6</code></a> 🐛 fix(seed): verify wheels before caching (<a href="">#3430</a>)</li>
<li><a href=""><code>2dc8bd8</code></a> 🐛 fix(subprocess): omit implicit helper import paths (<a href="">#3416</a>)</li>
<li><a href=""><code>d25f286</code></a> 🐛 fix(create): replace generated file links (<a href="">#3431</a>)</li>
<li><a href=""><code>e3cea6f</code></a> 🐛 fix(seed): contain metadata cleanup (<a href="">#3428</a>)</li>
<li><a href=""><code>2bfdc02</code></a> 🐛 fix(path): preserve link targets on delete errors (<a href="">#3427</a>)</li>
<li><a href=""><code>6196d35</code></a> 🐛 fix(seed): retain the parent installation for updates (<a href="">#3420</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pypa/virtualenv/compare/21.7.13...21.14.9">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=virtualenv&package-manager=pip&previous-version=21.7.13&new-version=21.14.9)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/BindsNET/bindsnet/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `78ec02b56d90`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.