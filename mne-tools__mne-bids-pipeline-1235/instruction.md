# Issue

**Title:** [dependabot]: Bump jupyter-server from 2.17.0 to 2.18.0

## Description

Bumps [jupyter-server](https://github.com/jupyter-server/jupyter_server) from 2.17.0 to 2.18.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/jupyter-server/jupyter_server/releases">jupyter-server's releases</a>.</em></p>
<blockquote>
<h2>v2.18.0</h2>
<h2>2.18.0</h2>
<p>(<a href="https://github.com/jupyter-server/jupyter_server/compare/v2.17.0...49b34392feaa97735b3b777e3baf8f22f2a14ed8">Full Changelog</a>)</p>
<h3>Security patches</h3>
<ul>
<li>CVE-2026-40110 <a href="https://github.com/jupyter-server/jupyter_server/security/advisories/GHSA-24qx-w28j-9m6p">https://github.com/jupyter-server/jupyter_server/security/advisories/GHSA-24qx-w28j-9m6p</a></li>
<li>CVE-2025-61669 <a href="https://github.com/jupyter-server/jupyter_server/security/advisories/GHSA-qh7q-6qm3-653w">https://github.com/jupyter-server/jupyter_server/security/advisories/GHSA-qh7q-6qm3-653w</a></li>
<li>CVE-2026-40934 <a href="https://github.com/jupyter-server/jupyter_server/security/advisories/GHSA-5mrq-x3x5-8v8f">https://github.com/jupyter-server/jupyter_server/security/advisories/GHSA-5mrq-x3x5-8v8f</a></li>
<li>CVE-2026-35397 <a href="https://github.com/jupyter-server/jupyter_server/security/advisories/GHSA-5789-5fc7-67v3">https://github.com/jupyter-server/jupyter_server/security/advisories/GHSA-5789-5fc7-67v3</a></li>
</ul>
<h3>API and Breaking Changes</h3>
<ul>
<li>Add query param to sanitize HTML in GET /nbconvert/html <a href="">#1618</a> (<a href="https://github.com/Yann-P"><code>@​Yann-P</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
</ul>
<h3>Enhancements made</h3>
<ul>
<li>Update handlers.py to fix ioloop  blockers(sync file operations) <a href="">#1617</a> (<a href="https://github.com/zolyfarkas-fb"><code>@​zolyfarkas-fb</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>Add resolvePath API for resolving kernel-relative paths <a href="">#1331</a> (<a href="https://github.com/krassowski"><code>@​krassowski</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>, <a href="https://github.com/blink1073"><code>@​blink1073</code></a>)</li>
</ul>
<h3>Bugs fixed</h3>
<ul>
<li>Move check origin into a util function and add it to websocket <a href="">#1630</a> (<a href="https://github.com/Carreau"><code>@​Carreau</code></a>, <a href="https://github.com/Yann-P"><code>@​Yann-P</code></a>)</li>
<li>Fix flaky test_restart_kernel by unsticking nudge() after port-changing restart <a href="">#1628</a> (<a href="https://github.com/Carreau"><code>@​Carreau</code></a>, <a href="https://github.com/claude"><code>@​claude</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
<li>Try to fix flaky test &quot;test_restart_kernel&quot; <a href="">#1625</a> (<a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>Fix potential unraisable pytest error <a href="">#1624</a> (<a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>fix: use %s placeholders in HTTPError to prevent Tornado from doubling % in gateway URLs <a href="">#1620</a> (<a href="https://github.com/terminalchai"><code>@​terminalchai</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>, <a href="https://github.com/ptch314"><code>@​ptch314</code></a>)</li>
<li>Fix three file descriptor leaks in kernel connection lifecycle (<a href="">#1506</a>) <a href="">#1619</a> (<a href="https://github.com/tonyx93"><code>@​tonyx93</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>Use web.HTTPError for kernel restart failures <a href="">#1616</a> (<a href="https://github.com/YDawn"><code>@​YDawn</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>Handle EADDRINUSE and EACCES in _bind_http_server_tcp <a href="">#1613</a> (<a href="https://github.com/YDawn"><code>@​YDawn</code></a>, <a href="https://github.com/Zsailer"><code>@​Zsailer</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
<li>Use st_birthtime for file created timestamp on macOS/BSD <a href="">#1594</a> (<a href="https://github.com/ktaletsk"><code>@​ktaletsk</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
<li>Fix double write when refusing hidden files in contents handler <a href="">#1585</a> (<a href="https://github.com/Krish-876"><code>@​Krish-876</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
<li>Close all sockets in _find_http_port explicitly <a href="">#1584</a> (<a href="https://github.com/MaryushSoroka"><code>@​MaryushSoroka</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
<li>Fix writing on remote file systems with attribute cache <a href="">#1574</a> (<a href="https://github.com/krassowski"><code>@​krassowski</code></a>, <a href="https://github.com/Zsailer"><code>@​Zsailer</code></a>)</li>
<li>Add IdentityProvider.cookie_secret_hook <a href="">#1569</a> (<a href="https://github.com/emin63"><code>@​emin63</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
<li>fix context pollution <a href="">#1561</a> (<a href="https://github.com/dualc"><code>@​dualc</code></a>, <a href="https://github.com/Zsailer"><code>@​Zsailer</code></a>)</li>
<li>Fix gateway cookie handling <a href="">#1558</a> (<a href="https://github.com/kevin-bates"><code>@​kevin-bates</code></a>, <a href="https://github.com/RRosio"><code>@​RRosio</code></a>, <a href="https://github.com/lresende"><code>@​lresende</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
<li>fix connection exception cause high cpu load <a href="">#1484</a> (<a href="https://github.com/dualc"><code>@​dualc</code></a>, <a href="https://github.com/lresende"><code>@​lresende</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
</ul>
<h3>Maintenance and upkeep improvements</h3>
<ul>
<li>Start to test on Python 3.13 and 3.14 <a href="">#1623</a> (<a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>Bump actions/create-github-app-token from 2 to 3 in the actions group across 1 directory <a href="">#1621</a> (<a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>Bump brace-expansion from 1.1.12 to 1.1.13 <a href="">#1615</a> (<a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
<li>Fix package spec for jupytext <a href="">#1614</a> (<a href="https://github.com/krassowski"><code>@​krassowski</code></a>, <a href="https://github.com/Zsailer"><code>@​Zsailer</code></a>)</li>
<li>chore: update pre-commit hooks <a href="">#1607</a> (<a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
<li>try to fix ci on windows <a href="">#1600</a> (<a href="https://github.com/minrk"><code>@​minrk</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
<li>run prerelease tests on 3.14 <a href="">#1599</a> (<a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
<li>Pin sphinx to an older version (&lt;9) to fix docs <a href="">#1597</a> (<a href="https://github.com/krassowski"><code>@​krassowski</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/jupyter-server/jupyter_server/blob/main/CHANGELOG.md">jupyter-server's changelog</a>.</em></p>
<blockquote>
<h2>2.18.0</h2>
<p>(<a href="https://github.com/jupyter-server/jupyter_server/compare/v2.9.1...49b34392feaa97735b3b777e3baf8f22f2a14ed8">Full Changelog</a>)</p>
<h3>API and Breaking Changes</h3>
<ul>
<li>Add query param to sanitize HTML in GET /nbconvert/html <a href="">#1618</a> (<a href="https://github.com/Yann-P"><code>@​Yann-P</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
</ul>
<h3>Enhancements made</h3>
<ul>
<li>Update handlers.py to fix ioloop blockers(sync file operations) <a href="">#1617</a> (<a href="https://github.com/zolyfarkas-fb"><code>@​zolyfarkas-fb</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>Avoid redundant call to <code>_get_os_path</code> in <code>_dir_model</code> <a href="">#1547</a> (<a href="https://github.com/joeyutong"><code>@​joeyutong</code></a>, <a href="https://github.com/vidartf"><code>@​vidartf</code></a>)</li>
<li>Allow specifying extra params to scrub from logs <a href="">#1538</a> (<a href="https://github.com/jtpio"><code>@​jtpio</code></a>, <a href="https://github.com/Zsailer"><code>@​Zsailer</code></a>, <a href="https://github.com/vidartf"><code>@​vidartf</code></a>)</li>
<li>Add a logger to the ExtensionPoint API <a href="">#1523</a> (<a href="https://github.com/Zsailer"><code>@​Zsailer</code></a>, <a href="https://github.com/vidartf"><code>@​vidartf</code></a>)</li>
<li>Allow user to update identity values <a href="">#1518</a> (<a href="https://github.com/brichet"><code>@​brichet</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
<li>If ServerApp.ip is ipv6 use [::1] as local_url <a href="">#1495</a> (<a href="https://github.com/manics"><code>@​manics</code></a>, <a href="https://github.com/afshin"><code>@​afshin</code></a>)</li>
<li>Better error message when starting kernel for session. <a href="">#1478</a> (<a href="https://github.com/Carreau"><code>@​Carreau</code></a>, <a href="https://github.com/davidbrochart"><code>@​davidbrochart</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
<li>Add a traitlet to disable recording HTTP request metrics <a href="">#1472</a> (<a href="https://github.com/yuvipanda"><code>@​yuvipanda</code></a>, <a href="https://github.com/Zsailer"><code>@​Zsailer</code></a>)</li>
<li>prometheus: Expose 3 activity metrics <a href="">#1471</a> (<a href="https://github.com/yuvipanda"><code>@​yuvipanda</code></a>, <a href="https://github.com/Zsailer"><code>@​Zsailer</code></a>)</li>
<li>Add prometheus info metrics listing server extensions + versions <a href="">#1470</a> (<a href="https://github.com/yuvipanda"><code>@​yuvipanda</code></a>, <a href="https://github.com/Zsailer"><code>@​Zsailer</code></a>)</li>
<li>Add prometheus metric with version information <a href="">#1467</a> (<a href="https://github.com/yuvipanda"><code>@​yuvipanda</code></a>, <a href="https://github.com/Zsailer"><code>@​Zsailer</code></a>)</li>
<li>Don't hide .so,.dylib files by default <a href="">#1457</a> (<a href="https://github.com/nokados"><code>@​nokados</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>, <a href="https://github.com/vidartf"><code>@​vidartf</code></a>)</li>
<li>Better hash format error message <a href="">#1442</a> (<a href="https://github.com/fcollonval"><code>@​fcollonval</code></a>, <a href="https://github.com/Zsailer"><code>@​Zsailer</code></a>)</li>
<li>Removing excessive logging from reading local files <a href="">#1420</a> (<a href="https://github.com/lresende"><code>@​lresende</code></a>, <a href="https://github.com/kevin-bates"><code>@​kevin-bates</code></a>)</li>
<li>Add async start hook to ExtensionApp API <a href="">#1417</a> (<a href="https://github.com/Zsailer"><code>@​Zsailer</code></a>, <a href="https://github.com/Darshan808"><code>@​Darshan808</code></a>, <a href="https://github.com/bollwyvl"><code>@​bollwyvl</code></a>, <a href="https://github.com/fcollonval"><code>@​fcollonval</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
<li>Do not include token in dashboard link, when available <a href="">#1406</a> (<a href="https://github.com/minrk"><code>@​minrk</code></a>, <a href="https://github.com/blink1073"><code>@​blink1073</code></a>)</li>
<li>Add an option to have authentication enabled for all endpoints by default <a href="">#1392</a> (<a href="https://github.com/krassowski"><code>@​krassowski</code></a>, <a href="https://github.com/Wh1isper"><code>@​Wh1isper</code></a>, <a href="https://github.com/blink1073"><code>@​blink1073</code></a>, <a href="https://github.com/bollwyvl"><code>@​bollwyvl</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>, <a href="https://github.com/yuvipanda"><code>@​yuvipanda</code></a>)</li>
<li>websockets: add configurations for ping interval and timeout <a href="">#1391</a> (<a href="https://github.com/oliver-sanders"><code>@​oliver-sanders</code></a>, <a href="https://github.com/blink1073"><code>@​blink1073</code></a>)</li>
<li>log extension import time at debug level unless it's actually slow <a href="">#1375</a> (<a href="https://github.com/minrk"><code>@​minrk</code></a>, <a href="https://github.com/Zsailer"><code>@​Zsailer</code></a>, <a href="https://github.com/yuvipanda"><code>@​yuvipanda</code></a>)</li>
<li>Add support for async Authorizers (part 2) <a href="">#1374</a> (<a href="https://github.com/Zsailer"><code>@​Zsailer</code></a>, <a href="https://github.com/blink1073"><code>@​blink1073</code></a>)</li>
<li>Support async Authorizers <a href="">#1373</a> (<a href="https://github.com/Zsailer"><code>@​Zsailer</code></a>, <a href="https://github.com/blink1073"><code>@​blink1073</code></a>)</li>
<li>Support get file(notebook) md5 <a href="">#1363</a> (<a href="https://github.com/Wh1isper"><code>@​Wh1isper</code></a>, <a href="https://github.com/blink1073"><code>@​blink1073</code></a>, <a href="https://github.com/bollwyvl"><code>@​bollwyvl</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
<li>Update kernel env to reflect changes in session <a href="">#1354</a> (<a href="https://github.com/blink1073"><code>@​blink1073</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
<li>Add resolvePath API for resolving kernel-relative paths <a href="">#1331</a> (<a href="https://github.com/krassowski"><code>@​krassowski</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>, <a href="https://github.com/blink1073"><code>@​blink1073</code></a>)</li>
</ul>
<h3>Bugs fixed</h3>
<ul>
<li>Move check origin into a util function and add it to websocket <a href="">#1630</a> (<a href="https://github.com/Carreau"><code>@​Carreau</code></a>, <a href="https://github.com/Yann-P"><code>@​Yann-P</code></a>)</li>
<li>Fix flaky test_restart_kernel by unsticking nudge() after port-changing restart <a href="">#1628</a> (<a href="https://github.com/Carreau"><code>@​Carreau</code></a>, <a href="https://github.com/claude"><code>@​claude</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>)</li>
<li>Try to fix flaky test &quot;test_restart_kernel&quot; <a href="">#1625</a> (<a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>Fix potential unraisable pytest error <a href="">#1624</a> (<a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>fix: use %s placeholders in HTTPError to prevent Tornado from doubling % in gateway URLs <a href="">#1620</a> (<a href="https://github.com/terminalchai"><code>@​terminalchai</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>, <a href="https://github.com/ptch314"><code>@​ptch314</code></a>)</li>
<li>Fix three file descriptor leaks in kernel connection lifecycle (<a href="">#1506</a>) <a href="">#1619</a> (<a href="https://github.com/tonyx93"><code>@​tonyx93</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>Use web.HTTPError for kernel restart failures <a href="">#1616</a> (<a href="https://github.com/YDawn"><code>@​YDawn</code></a>, <a href="https://github.com/Carreau"><code>@​Carreau</code></a>)</li>
<li>Handle EADDRINUSE and EACCES in _bind_http_server_tcp <a href="">#1613</a> (<a href="https://github.com/YDawn"><code>@​YDawn</code></a>, <a href="https://github.com/Zsailer"><code>@​Zsailer</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
<li>Use st_birthtime for file created timestamp on macOS/BSD <a href="">#1594</a> (<a href="https://github.com/ktaletsk"><code>@​ktaletsk</code></a>, <a href="https://github.com/krassowski"><code>@​krassowski</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
<li>Fix double write when refusing hidden files in contents handler <a href="">#1585</a> (<a href="https://github.com/Krish-876"><code>@​Krish-876</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
<li>Close all sockets in _find_http_port explicitly <a href="">#1584</a> (<a href="https://github.com/MaryushSoroka"><code>@​MaryushSoroka</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
<li>Fix writing on remote file systems with attribute cache <a href="">#1574</a> (<a href="https://github.com/krassowski"><code>@​krassowski</code></a>, <a href="https://github.com/Zsailer"><code>@​Zsailer</code></a>)</li>
<li>Add IdentityProvider.cookie_secret_hook <a href="">#1569</a> (<a href="https://github.com/emin63"><code>@​emin63</code></a>, <a href="https://github.com/minrk"><code>@​minrk</code></a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>0ceed45</code></a> Publish 2.18.0</li>
<li><a href=""><code>49b3439</code></a> Move check origin into a util function and add it to websocket (<a href="">#1630</a>)</li>
<li><a href=""><code>e2e08c8</code></a> Add test case for bad next URL format</li>
<li><a href=""><code>624d6c0</code></a> Delete outdated patch code</li>
<li><a href=""><code>d825b93</code></a> Apply suggestion from <a href="https://github.com/minrk"><code>@​minrk</code></a></li>
<li><a href=""><code>789fed0</code></a> patch open redirect in /login</li>
<li><a href=""><code>2ee51ec</code></a> fix(CVE-2026-35397): path traversal when target dir starts with root dir</li>
<li><a href=""><code>057869a</code></a> Fix allow_origin_pat to do full matching instead of prefix matching</li>
<li><a href=""><code>4862199</code></a> Add resolvePath API for resolving kernel-relative paths</li>
<li><a href=""><code>e31d514</code></a> Bump actions/create-github-app-token from 2 to 3 in the actions group across ...</li>
<li>Additional commits viewable in <a href="https://github.com/jupyter-server/jupyter_server/compare/v2.17.0...v2.18.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=jupyter-server&package-manager=uv&previous-version=2.17.0&new-version=2.18.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/mne-tools/mne-bids-pipeline/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2245e8ef8a79`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.