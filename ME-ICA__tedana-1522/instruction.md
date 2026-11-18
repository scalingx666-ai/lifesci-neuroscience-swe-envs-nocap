# Issue

**Title:** Bump virtualenv from 16.7.12 to 21.14.13

## Description

Bumps [virtualenv](https://github.com/pypa/virtualenv) from 16.7.12 to 21.14.13.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pypa/virtualenv/releases">virtualenv's releases</a>.</em></p>
<blockquote>
<h2>21.14.13</h2>
<p><!-- raw HTML omitted --><!-- raw HTML omitted --></p>
<h3>Security</h3>
<ul>
<li>Stop bash running commands from <code>--prompt</code> or an environment name containing <code>$(...)</code>, backticks or a backslash after <code>shopt -s promptvars</code>, <code>set -o posix</code>, or in a child shell that inherits an exported <code>PS1</code> (GHSA-cx6f-vjhg-g3cc); reported by <a href="https://github.com/rozzkml"><code>@​rozzkml</code></a>. zsh now draws the prompt from <code>psvar[9]</code>, which is never parsed as shell syntax. (<a href="">#3466</a>) by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a>.</li>
<li>Write the <code>.venv</code> redirect and the wheel <code>RECORD</code> with exclusive create, so a link planted after the existence check cannot redirect the write. On POSIX, replace a read-only <code>.venv</code> redirect that points at a virtualenv. (<a href="">#3466</a>) by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a>.</li>
</ul>
<p><a href="https://pypi.org/project/virtualenv/21.14.13/">🐍 PyPI release</a></p>
<p><a href="https://github.com/pypa/virtualenv/compare/21.14.12...21.14.13">📜 Full Changelog</a></p>
<h2>21.14.12</h2>
<p><!-- raw HTML omitted --><!-- raw HTML omitted --></p>
<h3>Packaging</h3>
<ul>
<li>Upgrade the embedded setuptools wheel from <code>84.0.0</code> to <code>84.2.1</code> and the embedded pip wheel from <code>26.2.1</code> to <code>26.2.2</code>. (<a href="">#3452</a>)</li>
</ul>
<h3>New Contributors</h3>
<ul>
<li><a href="https://github.com/qodelicious"><code>@​qodelicious</code></a> made their first contribution in <a href="">#3460</a></li>
</ul>
<p><a href="https://pypi.org/project/virtualenv/21.14.12/">🐍 PyPI release</a></p>
<p><a href="https://github.com/pypa/virtualenv/compare/21.14.11...21.14.12">📜 Full Changelog</a></p>
<h2>21.14.11</h2>
<p><!-- raw HTML omitted --><!-- raw HTML omitted --></p>
<h3>Bug fixes</h3>
<ul>
<li>Search all directories supplied by repeated <code>--extra-search-dir</code> options instead of keeping only the last group. (<a href="">#3440</a>) by <a href="https://github.com/repzakske"><code>@​repzakske</code></a>.</li>
<li>On Windows, the app data is now migrated into the nested cache directory instead of the migration failing with a warning on every run. (<a href="">#3441</a>) by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> and <a href="https://github.com/XXXXXQ-0206"><code>@​XXXXXQ-0206</code></a>.</li>
</ul>
<p><a href="https://pypi.org/project/virtualenv/21.14.11/">🐍 PyPI release</a></p>
<p><a href="https://github.com/pypa/virtualenv/compare/21.14.10...21.14.11">📜 Full Changelog</a></p>
<h2>21.14.10</h2>
<p><!-- raw HTML omitted --><!-- raw HTML omitted --></p>
<h3>Bug fixes</h3>
<ul>
<li>Always copy seed packages when app-data is temporary, including when symlink seeding is enabled through an environment variable or configuration file. Seeded packages remain available after temporary cache cleanup. (<a href="">#3437</a>) by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a>.</li>
</ul>
<p><a href="https://pypi.org/project/virtualenv/21.14.10/">🐍 PyPI release</a></p>
<p><a href="https://github.com/pypa/virtualenv/compare/21.14.9...21.14.10">📜 Full Changelog</a></p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pypa/virtualenv/blob/main/docs/changelog.rst">virtualenv's changelog</a>.</em></p>
<blockquote>
<p>#################
Release History
#################</p>
<p>.. towncrier-draft-entries:: [UNRELEASED DRAFT]</p>
<p>.. towncrier release notes start</p>
<p>.. _release-21-15-1:</p>
<hr />
<p>21.15.1 (2026-10-28)</p>
<hr />
<p>.. _release-21-15-1-fixed:</p>
<h2>Fixed</h2>
<ul>
<li>Keep the name of a seeded <code>console_scripts</code> entry that contains digits but does not end in a version, such as
<code>python3-config</code> or <code>2to3</code>, instead of truncating it at the first digit; <code>python3-config</code> overwrote the
environment's <code>python</code> executable (:pr:<code>3451</code>) by :user:<code>JingHao-Leon</code> and :user:<code>gaborbernat</code>.</li>
<li>Copy the content of a symlinked directory when a tree is copied into an environment, instead of dropping it
(:pr:<code>3454</code>) by :user:<code>JingHao-Leon</code> and :user:<code>gaborbernat</code>.</li>
<li>Count each <code>-v</code>, <code>-q</code>, <code>-p</code> and <code>--try-first-with</code> option once instead of once per internal parsing pass, so
<code>Session.verbosity</code> is 3 rather than 9 for a single <code>-v</code> (:pr:<code>3457</code>) by :user:<code>darrenhuai</code> and
:user:<code>gaborbernat</code>.</li>
<li>Copy the seed packages instead of failing when <code>VIRTUALENV_SYMLINK_APP_DATA</code> or <code>symlink_app_data</code> in the config
file turns on symlink seeding on a host that cannot create symlinks, such as Windows without the symlink privilege
(:pr:<code>3465</code>) by :user:<code>darrenhuai</code> and :user:<code>gaborbernat</code>.</li>
<li>Run the interpreter that collects the target debug information (<code>-vv</code> output and <code>Creator.debug</code>) without
<code>PYTHONPATH</code> and with the environment passed to <code>cli_run</code>, so the reported <code>sys.path</code> no longer lists the
caller's <code>PYTHONPATH</code> entries (:pr:<code>3474</code>) by :user:<code>RaphaelFakhri</code> and :user:<code>gaborbernat</code>.</li>
</ul>
<p>.. _release-21-15-0:</p>
<hr />
<p>21.15.0 (2026-10-27)</p>
<hr />
<p>.. _release-21-15-0-added:</p>
<h2>Added</h2>
<ul>
<li>Bundle dependencies for Python 3.15 in the standalone zipapp and stop bundling Python 3.8, which is outside the
package's supported range (:pr:<code>3458</code>) by :user:<code>gaborbernat</code>.</li>
</ul>
<p>.. _release-21-15-0-packaging:</p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>6accbd5</code></a> release 21.14.13</li>
<li><a href=""><code>3598e20</code></a> 🐛 fix(bash): escape the prompt for every PS1 state (<a href="">#3466</a>)</li>
<li><a href=""><code>f6512a5</code></a> release 21.14.12</li>
<li><a href=""><code>b535726</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#3455</a>)</li>
<li><a href=""><code>7e32366</code></a> Fix broken pip and code review links in the docs (<a href="">#3460</a>)</li>
<li><a href=""><code>632e56f</code></a> Upgrade embedded pip/setuptools/wheel and CI test tools (<a href="">#3452</a>)</li>
<li><a href=""><code>a8bd1a9</code></a> chore(deps): bump certifi from 2026.7.22 to 2026.10.19 in /tasks (<a href="">#3462</a>)</li>
<li><a href=""><code>c82323b</code></a> chore(deps): bump uv from 0.13.0 to 0.13.4 in /tasks (<a href="">#3461</a>)</li>
<li><a href=""><code>863ae6c</code></a> chore(deps): bump the runtime-dependencies group with 3 updates (<a href="">#3456</a>)</li>
<li><a href=""><code>79537b3</code></a> 👷 ci: pin App token action v3.3.0 (<a href="">#3449</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pypa/virtualenv/compare/16.7.12...21.14.13">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dcb10a757d58`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.