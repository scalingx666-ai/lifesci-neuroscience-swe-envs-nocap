# Issue

**Title:** Bump jupyter-server from 2.19.0 to 2.20.0

## Description

Bumps [jupyter-server](https://github.com/jupyter-server/jupyter_server) from 2.19.0 to 2.20.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/jupyter-server/jupyter_server/releases">jupyter-server's releases</a>.</em></p>
<blockquote>
<h2>v2.20.0</h2>
<h2>2.20.0</h2>
<p>(<a href="https://github.com/jupyter-server/jupyter_server/compare/v2.19.0...333e700119ee0bcc0b5fcd4c158213d7c275c778">Full Changelog</a>)</p>
<h3>Security fixes</h3>
<ul>
<li>CVE-2026-44727 <a href="https://github.com/jupyter-server/jupyter_server/security/advisories/GHSA-fcw5-x6j4-ccmp">GHSA-fcw5-x6j4-ccmp</a></li>
</ul>
<h3>Enhancements made</h3>
<ul>
<li>Fix confusing terminal output when using ServerApp.ip=0.0.0.0 <a href="">#1643</a> (<a href="https://github.com/Yann-P"><code>@​Yann-P</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
<li>Add a toggle to enable curve encryption for all kernels that support it <a href="">#1638</a> (<a href="https://github.com/krassowski"><code>@​krassowski</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>, <a href="https://github.com/ianthomas23"><code>@​ianthomas23</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
</ul>
<h3>Bugs fixed</h3>
<ul>
<li>Grab the port from <code>bind_sockets</code> in case its different <a href="">#1651</a> (<a href="https://github.com/choldgraf"><code>@​choldgraf</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
</ul>
<h3>Maintenance and upkeep improvements</h3>
<ul>
<li>Fix <code>test_authorizer</code> having a spurious comma in params <a href="">#1664</a> (<a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
<li>Add a reminder to merge GHSA before release <a href="">#1659</a> (<a href="https://github.com/Yann-P"><code>@​Yann-P</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>Exclude problematic <code>pywinpty</code> 3.0.4 version <a href="">#1658</a> (<a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
<li>ci: explicitly pass base-setup inputs to fix strict validation failures <a href="">#1626</a> (<a href="https://github.com/Carreau"><code>@​Carreau</code></a>, <a href="https://github.com/Copilot"><code>@​Copilot</code></a>)</li>
</ul>
<h3>Documentation improvements</h3>
<ul>
<li>Align docs for curve encryption with latest JEP version <a href="">#1660</a> (<a href="https://github.com/krassowski"><code>@​krassowski</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>Remove PGP key from docs <a href="">#1653</a> (<a href="https://github.com/Yann-P"><code>@​Yann-P</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
</ul>
<h3>Contributors to this release</h3>
<p>The following people contributed discussions, new ideas, code and documentation contributions, and review.
See <a href="https://github-activity.readthedocs.io/en/latest/use/#how-does-this-tool-define-contributions-in-the-reports">our definition of contributors</a>.</p>
<p>(<a href="https://github.com/jupyter-server/jupyter_server/graphs/contributors?from=2026-05-29&amp;to=2026-06-17&amp;type=c">GitHub contributors page for this release</a>)</p>
<p><a href="https://github.com/Carreau"><code>@​Carreau</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3ACarreau+updated%3A2026-05-29..2026-06-17&amp;type=Issues">activity</a>) | <a href="https://github.com/choldgraf"><code>@​choldgraf</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Acholdgraf+updated%3A2026-05-29..2026-06-17&amp;type=Issues">activity</a>) | <a href="https://github.com/Copilot"><code>@​Copilot</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3ACopilot+updated%3A2026-05-29..2026-06-17&amp;type=Issues">activity</a>) | <a href="https://github.com/ianthomas23"><code>@​ianthomas23</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Aianthomas23+updated%3A2026-05-29..2026-06-17&amp;type=Issues">activity</a>) | <a href="https://github.com/krassowski"><code>@​krassowski</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Akrassowski+updated%3A2026-05-29..2026-06-17&amp;type=Issues">activity</a>) | <a href="https://github.com/minrk"><code>@​minrk</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Aminrk+updated%3A2026-05-29..2026-06-17&amp;type=Issues">activity</a>) | <a href="https://github.com/Yann-P"><code>@​Yann-P</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3AYann-P+updated%3A2026-05-29..2026-06-17&amp;type=Issues">activity</a>)</p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/jupyter-server/jupyter_server/blob/main/CHANGELOG.md">jupyter-server's changelog</a>.</em></p>
<blockquote>
<h2>2.20.0</h2>
<p>(<a href="https://github.com/jupyter-server/jupyter_server/compare/v2.19.0...333e700119ee0bcc0b5fcd4c158213d7c275c778">Full Changelog</a>)</p>
<h3>Enhancements made</h3>
<ul>
<li>Fix confusing terminal output when using ServerApp.ip=0.0.0.0 <a href="">#1643</a> (<a href="https://github.com/Yann-P"><code>@​Yann-P</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
<li>Add a toggle to enable curve encryption for all kernels that support it <a href="">#1638</a> (<a href="https://github.com/krassowski"><code>@​krassowski</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>, <a href="https://github.com/ianthomas23"><code>@​ianthomas23</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
</ul>
<h3>Bugs fixed</h3>
<ul>
<li>Grab the port from <code>bind_sockets</code> in case its different <a href="">#1651</a> (<a href="https://github.com/choldgraf"><code>@​choldgraf</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
</ul>
<h3>Maintenance and upkeep improvements</h3>
<ul>
<li>Fix <code>test_authorizer</code> having a spurious comma in params <a href="">#1664</a> (<a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
<li>Add a reminder to merge GHSA before release <a href="">#1659</a> (<a href="https://github.com/Yann-P"><code>@​Yann-P</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>Exclude problematic <code>pywinpty</code> 3.0.4 version <a href="">#1658</a> (<a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
<li>ci: explicitly pass base-setup inputs to fix strict validation failures <a href="">#1626</a> (<a href="https://github.com/Carreau"><code>@​Carreau</code></a>, <a href="https://github.com/Copilot"><code>@​Copilot</code></a>)</li>
</ul>
<h3>Documentation improvements</h3>
<ul>
<li>Align docs for curve encryption with latest JEP version <a href="">#1660</a> (<a href="https://github.com/krassowski"><code>@​krassowski</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>Remove PGP key from docs <a href="">#1653</a> (<a href="https://github.com/Yann-P"><code>@​Yann-P</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
</ul>
<h3>Contributors to this release</h3>
<p>The following people contributed discussions, new ideas, code and documentation contributions, and review.
See <a href="https://github-activity.readthedocs.io/en/latest/use/#how-does-this-tool-define-contributions-in-the-reports">our definition of contributors</a>.</p>
<p>(<a href="https://github.com/jupyter-server/jupyter_server/graphs/contributors?from=2026-05-29&amp;to=2026-06-17&amp;type=c">GitHub contributors page for this release</a>)</p>
<p><a href="https://github.com/Carreau"><code>@​Carreau</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3ACarreau+updated%3A2026-05-29..2026-06-17&amp;type=Issues">activity</a>) | <a href="https://github.com/choldgraf"><code>@​choldgraf</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Acholdgraf+updated%3A2026-05-29..2026-06-17&amp;type=Issues">activity</a>) | <a href="https://github.com/Copilot"><code>@​Copilot</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3ACopilot+updated%3A2026-05-29..2026-06-17&amp;type=Issues">activity</a>) | <a href="https://github.com/ianthomas23"><code>@​ianthomas23</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Aianthomas23+updated%3A2026-05-29..2026-06-17&amp;type=Issues">activity</a>) | <a href="https://github.com/krassowski"><code>@​krassowski</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Akrassowski+updated%3A2026-05-29..2026-06-17&amp;type=Issues">activity</a>) | <a href="https://github.com/minrk"><code>@​minrk</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3Aminrk+updated%3A2026-05-29..2026-06-17&amp;type=Issues">activity</a>) | <a href="https://github.com/Yann-P"><code>@​Yann-P</code></a> (<a href="https://github.com/search?q=repo%3Ajupyter-server%2Fjupyter_server+involves%3AYann-P+updated%3A2026-05-29..2026-06-17&amp;type=Issues">activity</a>)</p>
<!-- raw HTML omitted -->
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>05a78ad</code></a> Publish 2.20.0</li>
<li><a href=""><code>6cbee8d</code></a> Merge commit from fork</li>
<li><a href=""><code>333e700</code></a> Fix <code>test_authorizer</code> having a spurious comma in params (<a href="">#1664</a>)</li>
<li><a href=""><code>cccd543</code></a> Fix CI: explicitly pass base-setup inputs to avoid strict validation failures</li>
<li><a href=""><code>cd16d71</code></a> Align docs for curve encryption with latest JEP version (<a href="">#1660</a>)</li>
<li><a href=""><code>e458061</code></a> Add a toggle to enable curve encryption for all kernels that support it (<a href="">#1638</a>)</li>
<li><a href=""><code>0ceeb4f</code></a> Add note in RELEASE.md</li>
<li><a href=""><code>b13f8a2</code></a> Markdown does not work.</li>
<li><a href=""><code>e885b10</code></a> Add GHSA reminder in prep-release</li>
<li><a href=""><code>0e28c90</code></a> Exclude problematic <code>pywinpty</code> 3.0.4 version (<a href="">#1658</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/jupyter-server/jupyter_server/compare/v2.19.0...v2.20.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=jupyter-server&package-manager=pip&previous-version=2.19.0&new-version=2.20.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `00d870d078a6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.